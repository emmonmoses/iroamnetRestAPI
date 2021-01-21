<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
// include database connection
include 'config.php';
$_POST = file_get_contents("php://input");

// check if form was submitted
if($_POST){    
    // remove this to use posted values option 1 below using form-data
    $request = json_decode($_POST);
    try{       
        $query =  "UPDATE mailbox 
                   SET name=:name,  message=:message, email=:email, response=:response, status=:status
                   WHERE id = :id"; 

        // prepare query for excecution
        $stmt = $con->prepare($query);         

         // posted values
         $id = $request->id;
         $originalFrom_name = trim($request->name);
         $message = trim($request->message);
         $originalFrom_email = trim($request->email);
         $response = trim($request->response);
         $status = "Read";
         $from_name = "AfriDevTech";
         $from_email = "info@afridevtech.com";         

        // bind the parameters
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':name', $originalFrom_name);
        $stmt->bindParam(':message', $message);
        $stmt->bindParam(':email', $originalFrom_email); 
        $stmt->bindParam(':response', $response);               
        $stmt->bindParam(':status', $status);

        // Execute the query
        if($stmt->execute()){
          // echo json_encode(array('result'=>'success'));
           $authdata = [
            'id' => $id,
            'name' => $originalFrom_name,
            'message' => $message,
            'email' => $originalFrom_email,
            'response' => $response,
            'status' => $status,
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
