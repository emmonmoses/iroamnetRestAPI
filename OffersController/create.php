<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
// Create database connection
$db = mysqli_connect("localhost", "root", "", "iroamnet_posts");
 
 // If upload button is clicked ...
 if (isset($_POST)) {  
   // Get image name
   $image = $_FILES['image']['name'];
   // Get text  
   $image_name = mysqli_real_escape_string($db, $_POST['name']);
   $description = mysqli_real_escape_string($db, $_POST['description']);
   $discount = mysqli_real_escape_string($db, $_POST['discount']);
   // image file directory
   $target = "../images/".basename($image);
      $sql = "INSERT INTO offers (image, name, description, discount) VALUES ('$image', '$image_name', '$description', '$discount')";   
   // execute query
   mysqli_query($db, $sql);
   if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {    
    $authdata = [
      'id' => $db-> insert_id,       
      'name' =>  $image_name,
      'description' =>  $description,
      'discount' =>  $discount,
      'image' => $image,      
      ];
      echo json_encode($authdata);
   }else{    
    echo json_encode(array('result'=>'fail'));
   }
 } 
?>
