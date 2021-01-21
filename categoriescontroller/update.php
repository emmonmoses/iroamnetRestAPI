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
        $query = "UPDATE categories 
                    SET name=:name
                    WHERE id = :id";
 
        // prepare query for excecution
        $stmt = $con->prepare($query);              

         // posted values
         $id = $request->id;
         $category = trim($request->name);                
 
        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':name', $category);            
         
        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'name' => $category
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
