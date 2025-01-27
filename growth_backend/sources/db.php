ECHO ist eingeschaltet (ON).

$<?php 
# db details 
$host = '127.0.0.1'; 
$port = '3306';
$db   = 'growth'; 
$user = 'root';
$pass = '';

# db connection
$conn = new mysquli($host,$user, $pass,$db); 

# connection check
if ($conn->connect_error){
    die(json_encode(["success"=> false, "massage" => "Connection failed: " . $conn->connect_error]));
}
echo "Connection Successfuly";
?>