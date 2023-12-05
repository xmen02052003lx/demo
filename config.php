<?php 
ob_start(); //Turns on output buffering, save you a lot of headaches when you host this website online in the end
session_start();

$timezone = date_default_timezone_set("Asia/Ho_Chi_Minh");

$con = mysqli_connect("localhost", "root", "", "social");
if(mysqli_connect_errno()) {
    echo "Failed to connect: " . mysqli_connect_errno();
}

?>