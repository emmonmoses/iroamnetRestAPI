
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

$db_host = 'localhost';
$db_username = 'root';
$db_password = '';
$db_name = 'iroamnet_posts';
$mysqli = new mysqli($db_host, $db_username, $db_password,$db_name);

$_POST = file_get_contents("php://input");
$request = json_decode($_POST);

if(isset($_POST) && !empty($_POST))    
{
    $password = base64_encode(mysqli_real_escape_string($mysqli, trim($request->password)));
    $email = mysqli_real_escape_string($mysqli, trim($request->email));   

    $sql = "SELECT * FROM users where email='$email' and password='$password'";

   if($result = mysqli_query($mysqli,$sql))
    {
      $rows = array();
      while($row = mysqli_fetch_assoc($result))
      {
      // $rows = [    
      // "id" => $row['id'],                 
      // "email" =>  $email,
      // "password" =>  '', 
      //  ];   
      $rows[] = $row;     
      }
      echo json_encode($rows);
    }     
}
?>