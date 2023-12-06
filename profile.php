<?php
require "includes/header.php";


if(isset($_GET['profile_username'])) {
    $username = $_GET['profile_username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$username'");
    $user_array = mysqli_fetch_array($user_details_query);

    $num_friends = (substr_count($user_array['friend_array'], ",")) - 1;
}

if(isset($_POST['remove_friend'])) {
    $user = new User($con, $userLoggedIn);
    $user->removeFriend($username);
}

if(isset($_POST['add_friend'])) {
    $user = new User($con, $userLoggedIn);
    $user->sendRequest($username);
}

if(isset($_POST['respond_friend'])) {
    header("Location: requests.php");
}

?>
    <div class="profile_left">
        <img src="<?php echo $user_array['profile_pic']; ?>" alt="">

        <div class="profile_info">
            <p><?php echo "Posts: " . $user_array['num_posts']; ?></p>
            <p><?php echo "Likes: " . $user_array['num_likes']; ?></p>
            <p><?php echo "Friends: " . $num_friends; ?></p>
        </div>

        <form action="<?php echo $username; ?>" method="POST">
            <?php 
            $profile_user_obj = new User($con, $username);
            if($profile_user_obj->isClosed()) {
                header("Location: user_closed.php");
            }
            
            $logged_in_user_obj = new User($con, $userLoggedIn);

            if($userLoggedIn != $username) {
                if($logged_in_user_obj->isFriend($username)) {
                    echo "<input type='submit' name='remove_friend' class='btn btn-danger' value='Remove friend'><br>";
                } else if($logged_in_user_obj->didReceiveRequest($username)) {
                    echo "<input type='submit' name='respond_friend' class='btn btn-warning' value='Respond to request '><br>";

                } else if($logged_in_user_obj->didSendRequest($username)) {
                    echo "<input type='submit' name='' class='btn btn-info' value='Request sent'><br>";

                } else {
                    echo "<input type='submit' name='add_friend' class='btn btn-primary' value='Add friend'><br>";

                }
            }

            ?>


        </form>
        <input type="submit" class="deep_blue btn btn-primary" data-bs-toggle="modal" data-bs-target="#post_form" value="Post Something">

        <?php 
        if($userLoggedIn != $username) {
            echo "<div class='profile_info_bottom'>";
            echo $logged_in_user_obj->getMutualFriends($username) . " Mutual friends";
            echo "</div>";
        }
        ?>
    </div>
    

    <div class="">
    <!-- <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Message</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul> -->
<div class="tab-content"></div>
    <div class="posts_area bg-light"></div>

<img id="loading" class="loading-gif" src="assets/images/icons/Spinner-1s-200px.gif" alt="loading">

<!-- Modal -->
<div class="modal fade modal-dialog modal-dialog-centered" id="post_form" tabindex="-1" aria-labelledby="postModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post something</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>This will appear on the user's profile page and also their newsfeed for your friends to see!</p>

        <form class="profile_post" action="" method="POST">
            <div class="form-group">
                <textarea name="post_body" class="form-control" id="" cols="30" rows="10"></textarea>
                <input type="hidden" name="user_from" value="<?php echo $userLoggedIn;?>">
                <input type="hidden" name="user_to" value="<?php echo $username;?>">
            </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button name="post_button" id="submit_profile_post" type="button" class="btn btn-primary">Post</button>
      </div>
    </div>
  </div>
</div>
    </div>
    <script src="assets/js/bootstrap.js"></script>
    <script>
        let userLoggedIn = "<?php echo $userLoggedIn; ?>"
        let profileUsername = "<?php echo $username ?>"
        $(document).ready(function() {

            $('#loading').show()

            // Original ajax request for loading first posts
            $.ajax({
                url: "includes/handlers/ajax_load_profile_posts.php",
                type: "POST",
                data: "page=1&userLoggedIn=" + userLoggedIn + "&profileUsername=" + profileUsername,
                cache:false,

                success: function(data) {
                    $('#loading').hide()
                    $(".posts_area").html(data)
                }

            })

            $(window).scroll(function() {
                let height = $('.posts_area').height() //div containing posts
                let scroll_top = $(this).scrollTop()
                let page = $('.posts_area').find('.nextPage').val()
                let noMorePosts = $(".posts_area").find('.noMorePosts').val()
                
                console.log("scrollHeight " + document.body.scrollHeight)
                console.log("document.body.scrollTop " + document.body.scrollTop)
                console.log("innerHeight " + window.innerHeight)
                console.log("scroll_top " +scroll_top)
console.log(noMorePosts)
                if((document.body.scrollHeight < (scroll_top + window.innerHeight)) && noMorePosts == undefined) {
                        $('#loading').show()
                        console.error('sado');
                // Original ajax request for loading first posts
            let ajaxReq = $.ajax({
                url: "includes/handlers/ajax_load_profile_posts.php",
                type: "POST",
                data: "page=" + page + "&userLoggedIn="+ userLoggedIn + "&profileUsername=" + profileUsername,
                cache:false,

                success: function(response) {
                    $(".posts_area").find(".nextPage").remove() //Removes current .nextPage
                    $(".posts_area").find(".noMorePosts").remove() //Removes current .nextPage

                    $('#loading').hide()
                    $(".posts_area").append(response)
                }

            }) } 
            //End if
            return false

            }) //End (window).scroll(function())
        })



    </script>

</body>
</html>