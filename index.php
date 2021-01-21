<?php 
include 'config.php'; 
  try{
      $con = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
      echo "<div style='text-align: center'><h2>Welcome to iroamnetAPI</h2></div>";
  }
catch(PDOException $exception) {
    echo "Connection error: " . $exception->getMessage();
}
?>