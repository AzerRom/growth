<?php 
# Connect to db
require_once "db.php"; 

#get Users
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql = "SELECT USER_ID, NAME, AGE, EMAIL, ROLE FROM users";
    $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $users = []; 
            while ($row =$result->fetcg_assoc()) {
                $users = $row;
            }
            echo json_encode($users); 
        } else {
            echo json_encode([]);
        }
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $age = $_POST['age'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BVRYPT);
    $role = $_POST['role'];

    $dql = "INSERT INTO USERS ( NAME, AGE, EMAIL, PASSWORD, ROLE) Values (?, ?, ?, ?, ?)"
    $stmt = $conn->prepare($sql); 
    $stmt->bind_param("sisss", $name, $age, $email, $password, $role); 
    
    if ($stmt->execute()) {
        echo json_encode(["massage" => "User created successfuly!"])
    } else {
        echo json_encode(["error" => "Creating user fialed!"])
    }  
    
 ###
    if ($_SERVER['REQUEST_METHOD'] === 'DELETE' {

    }
###
}
?>