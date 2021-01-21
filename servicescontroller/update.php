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
        $query = "UPDATE services 
                    SET title=:title, description=:description
                    WHERE id = :id";
 
        // prepare query for excecution
        $stmt = $con->prepare($query);
 
        // posted values option 1
        // $id = $_POST['id'];
        // $category = $_POST['category'];
        // $description = $_POST['description'];        

         // posted values option 1
         $id = $request->id;
         $title = trim($request->title);
         $description = trim($request->description);         
 
        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':description', $description);              
         
        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'title' => $title,
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
