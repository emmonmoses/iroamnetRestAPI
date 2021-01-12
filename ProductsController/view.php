<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
// include database connection
include '../config/database.php';
 
// delete message prompt will be here
 
// select all data
$query = "SELECT p_id, p_category, p_description, p_price, p_created, p_created FROM products ORDER BY p_id DESC";
$stmt = $con->prepare($query);
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
$json = json_encode($results);
echo $json;
?>
