#datenbase test
<?php
#connection db 

require_once "db.php"; 

#testabfrage 
$sql = "tables in db" 
$result = $conn->query($sql); 

if ($result) {
    echo "tables found"; 
    while ($row = $result->fetch_array(){
        echo $row[0 .; 
    }
} else { 
    echo "error" . $conn->error
}

$conn->close()


?>