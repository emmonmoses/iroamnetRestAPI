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
        // write update query
        // in this case, it seemed like we have so many fields to pass and 
        // it is better to label them and not use question marks
        $query = "UPDATE orders 
                    SET name=:name, order_number=:order_number, quantity=:quantity, total=:total
                    WHERE id = :id";

        // prepare query for excecution
        $stmt = $con->prepare($query);
 

         // posted values
         $id = $request->id;
         $name = trim($request->name);
         $order_number = trim($request->order_number);         
         $quantity = trim($request->quantity); 
         $total = trim($request->total);  

        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':order_number', $order_number);
        $stmt->bindParam(':total', $total);                
        $stmt->bindParam(':quantity', $quantity);

        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'name' => $name,
            'order_number' => $order_number,
            'quantity' => $quantity,
            'total' => $total,
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
