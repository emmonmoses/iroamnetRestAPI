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
        $query = "UPDATE products 
                    SET p_category=:name, p_description=:description, p_price=:price 
                    WHERE p_id = :id";
 
        // prepare query for excecution
        $stmt = $con->prepare($query);
 
        // posted values option 1
        // $id = $_POST['id'];
        // $category = $_POST['name'];
        // $description = $_POST['description'];
        // $price = $_POST['price'];

         // posted values option 1
         $id = $request->id;
         $category = trim($request->name);
         $description = trim($request->description);
         $price = trim($request->price);
 
        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':name', $category);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':price', $price);        
         
        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'category' => $category,
            'description' => $description,
            'price' => $price
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
