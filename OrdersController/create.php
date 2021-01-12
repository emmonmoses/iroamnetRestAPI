<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

$db_host = 'localhost';
$db_username = 'root';
$db_order_number = '';
$db_name = 'iroamnet_posts';

$mysqli = new mysqli($db_host, $db_username, $db_order_number,$db_name);

if ($mysqli->connect_error) {
die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}

$_POST = file_get_contents("php://input");

if(isset($_POST) && !empty($_POST))
{
  $request = json_decode($_POST);

  $name = trim($request->name);
  $order_number = trim($request->order_number);
  $quantity = trim($request->quantity);
  $total= trim($request->total);

  $sql = "INSERT INTO orders(name,order_number,quantity,total) VALUES ('$name', '$order_number','$quantity','$total')";

 if ($mysqli->query($sql) === TRUE) {
    $authdata = [
        'id' => mysqli_insert_id($mysqli),
        'order_number' => $order_number,
        'name' => $name,
        'quantity' => $quantity,        
        'total' => $total,       
    ];
    echo json_encode($authdata);
 }
}

?>