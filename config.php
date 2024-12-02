
<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "hotel_booking";

$conn = mysqli_connect($servername, $username, $password, $database);

if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
if(session_id()==""){
    session_start();
}

?>