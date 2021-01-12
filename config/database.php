<?php
// used to connect to the database
$host = "localhost";
$db_name = "iroamnet_posts";
$username = "root";
$password = "";
  
try {
   $con = new PDO("mysql:host={$host};dbname={$db_name}", $username, $password);
   // $mysqli = new mysqli($host, $db_name, $username, $password);
}
  
// show error
catch(PDOException $exception) {
    echo "Connection error: " . $exception->getMessage();
}

?>
