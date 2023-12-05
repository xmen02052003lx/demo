<?php 
ob_start(); //Turns on output buffering, save you a lot of headaches when you host this website online in the end
session_start();

$timezone = date_default_timezone_set("Asia/Ho_Chi_Minh");

// Development Connection
    // $host = "localhost";
    // $db = "social";
    // $user = "root";
    // $pass = "";
// Remote database connection
$host = 'sql12.freesqldatabase.com';
$db = 'sql12667788';
$user = 'sql12667788';
$pass = '9P1HTST64X';

$con = mysqli_connect($host, $user, $pass, $db);
if(mysqli_connect_errno()) {
    echo "Failed to connect: " . mysqli_connect_errno();
}

?>