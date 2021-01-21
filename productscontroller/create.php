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
   $image_title = mysqli_real_escape_string($db, $_POST['title']);
   $image_currency = mysqli_real_escape_string($db, $_POST['currency']);
   $image_price = mysqli_real_escape_string($db, $_POST['price']);
   $image_description = mysqli_real_escape_string($db, $_POST['description']);
   // image file directory
   $target = "../images/".basename($image);
      $sql = "INSERT INTO products (image, title, currency, price, description) VALUES ('$image', '$image_title', '$image_currency', '$image_price', '$image_description')";   
   // execute query
   mysqli_query($db, $sql);
   if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {    
    $authdata = [
      'id' => $db-> insert_id,       
      'title' =>  $image_title,
      'currency' =>  $image_currency,
      'price' =>  $image_price,
      'description' =>  $image_description,
      'image' => $image,      
      ];
      echo json_encode($authdata);
   }else{    
    echo json_encode(array('result'=>'fail'));
   }
 } 
?>
