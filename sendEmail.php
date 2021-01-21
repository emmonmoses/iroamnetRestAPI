<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');
// $request = json_decode(file_get_contents("php://input"));
// $from_email = "oemmon@yahoo.com";
// $message = "Welcome.";
// $from_name = "Emmon Moses";

$from_name = $_POST['name'];
$from_email = $_POST['email'];
$message = $_POST['message'];

$to_email = "info@iroamnet.com";
$contact = "<p><strong>Name:</strong>$from_name</p><p><strong>Email:</strong> $from_email</p>";

$email_subject = "Iroamnet Message";
$email_body = '<html><body>';
$email_body .= "<p><strong>Name:</strong>$from_name</p><p><strong>Email:</strong> $from_email</p>
                <p><strong>Message:</strong>$message</p>";
$email_body .= '</body></html>';

$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
$headers .= "From: $from_name\r\n";
$headers .= "Reply-To: $from_email\r\n";
$email_body;

mail($to_email,$email_subject,$email_body,$headers);

$response_array['status'] = 'Success';
$response_array['from'] = $from_name;

echo json_encode($response_array);
echo json_encode($from_email);
header($response_array);
return $from_email;
   
?>
