<?php 
require "../../config.php";
require "../classes/User.php";
require "../classes/Post.php";

if(isset($_POST['post_body'])) {
    $post = new Post($con, $_POST['user_from']);
    $post->submitPost($_POST['post_body'], $_POST['user_to']);
}
?>