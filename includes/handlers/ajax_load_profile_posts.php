<?php 
require "../../config.php";
require "../classes/User.php";
require "../classes/Post.php";

$limit = 10; //Number of posts to be loaded per call

$posts = new Post($con, $_REQUEST['userLoggedIn']);
$posts->loadProfilePosts($_REQUEST, $limit);

?>