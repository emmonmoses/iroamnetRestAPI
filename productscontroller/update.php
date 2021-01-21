<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
// include database connection
include '../config/database.php';
$_POST = file_get_contents("php://input");

// check if form was submitted
if($_POST){    
    // remove this to use posted values option 1 below using form-data
    $request = json_decode($_POST);
    try{      
        $query = "UPDATE products
                    SET title=:title, currency=:currency, price=:price, description=:description
                    WHERE id = :id";
 
        // prepare query for excecution
        $stmt = $con->prepare($query);       

         // posted values 
         $id = $request->id;
         $title = trim($request->title);
         $currency = trim($request->currency);
         $price = trim($request->price);
         $description = trim($request->description);         
 
        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':currency', $currency);
        $stmt->bindParam(':price', $price);
        $stmt->bindParam(':description', $description);              
         
        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'title' => $title,
            'currency' => $currency,
            'price' => $price,
            'description' => $description
            ];
            echo json_encode($authdata);
        }else{
            echo json_encode(array('result'=>'fail'));
        }
         
    }
     
    // show errors
    catch(PDOException $exception){
        die('ERROR: ' . $exception->getMessage());
    }
}
?>
