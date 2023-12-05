<?php
require "includes/header.php";


if(isset($_POST['post'])) {
    $post = new Post($con, $userLoggedIn);
    $post->submitPost($_POST['post_text'], 'none');
    header("Location: index.php"); // prevent form re-submitting
}

?>
    
<div class="container row user-card">
    <div class="user-details col-md-4 bg-light">
        <div class="row">
        <a href="<?php echo $userLoggedIn; ?>"><img src="<?php echo $user['profile_pic']; ?>" alt="" class="img-fluid"></a>
        <a href="<?php echo $userLoggedIn; ?>">
        <?php 
        echo $user['firstname'] . " " . $user['lastname'] . "<br>"; 
        ?>
        </a>
        <?php 
        echo "Posts: " . $user['num_posts'] . "<br>"; 
        echo "Likes: " . $user['num_likes'];
        ?>
        </div>
    </div>

    <div class="col-md-8">
    <form action="index.php" method="POST" class="thought_form d-inline-block  w-100 position-absolute">
        <textarea name="post_text" id="post_text" cols="10" rows="3" placeholder="Got something to say?" class="form-control"></textarea>
        <input type="submit" name="post" id="post_button" value="Post" class="thought_submit_btn position-absolute  btn btn-primary">
    </form>
    </div>
</div>
    <div class="posts_area-container ">

       

        <div class="posts_area bg-light"></div>

        <img id="loading" class="loading-gif" src="assets/images/icons/Spinner-1s-200px.gif" alt="loading">
    </div>


<script>
    document.addEventListener("DOMContentLoaded", function() {
    let userLoggedIn = "<?php echo $userLoggedIn; ?>";
    let loading = document.getElementById('loading');
    let postsArea = document.querySelector('.posts_area');

    function showLoading() {
        loading.style.display = 'block';
    }

    function hideLoading() {
        loading.style.display = 'none';
    }

    function removeElement(selector) {
        let element = document.querySelector(selector);
        if (element) {
            element.parentNode.removeChild(element);
        }
    }

    function loadPosts(page) {
        showLoading();

        let formData = new FormData();
        formData.append('page', page);
        formData.append('userLoggedIn', userLoggedIn);

        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'includes/handlers/ajax_load_posts.php', true);

        xhr.onload = function() {
            if (xhr.status === 200) {
                hideLoading();
                postsArea.innerHTML = xhr.responseText;
            }
        };

        xhr.onerror = function() {
            console.error('Error:', xhr.statusText);
        };

        xhr.send(formData);
    }

    // Initial load
    loadPosts(1);

    // Infinite scroll
    window.addEventListener('scroll', function() {
        let height = postsArea.offsetHeight;
        let scrollTop = window.scrollY || document.documentElement.scrollTop;
        let nextPageElement = postsArea.querySelector('.nextPage');
        let noMorePostsElement = postsArea.querySelector('.noMorePosts');

        if (nextPageElement && !noMorePostsElement) {
            let page = nextPageElement.value;

            if (document.body.scrollHeight < scrollTop + window.innerHeight) {
                showLoading();

                let xhr = new XMLHttpRequest();
                xhr.open('POST', 'includes/handlers/ajax_load_posts.php', true);

                let postData = "page=" + page + "&userLoggedIn=" + userLoggedIn;
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

                xhr.onload = function() {
                    if (xhr.status === 200) {
                        removeElement(".nextPage");
                        removeElement(".noMorePosts");
                        hideLoading();
                        postsArea.innerHTML += xhr.responseText;
                    }
                };

                xhr.onerror = function() {
                    console.error('Error:', xhr.statusText);
                };

                xhr.send(postData);
            }
        }
    });
});

</script>

    <!-- <script>
        let userLoggedIn = "<?php echo $userLoggedIn; ?>"
        $(document).ready(function() {

            $('#loading').show()

            // Original ajax request for loading first posts
            $.ajax({
                url: "includes/handlers/ajax_load_posts.php",
                type: "POST",
                data: "page=1&userLoggedIn=" + userLoggedIn,
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
                
//                 console.log("scrollHeight " + document.body.scrollHeight)
//                 console.log("document.body.scrollTop " + document.body.scrollTop)
//                 console.log("innerHeight " + window.innerHeight)
//                 console.log("scroll_top " +scroll_top)
// console.log(noMorePosts)
                if((document.body.scrollHeight < (scroll_top + window.innerHeight)) && noMorePosts == undefined) {
                        $('#loading').show()
                        
                // Original ajax request for loading first posts
            let ajaxReq = $.ajax({
                url: "includes/handlers/ajax_load_posts.php",
                type: "POST",
                data: "page=" + page + "&userLoggedIn="+ userLoggedIn,
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

//         $(function(){
 
//  var userLoggedIn = '<?php echo $userLoggedIn; ?>';
//  var inProgress = false;

//  loadPosts(); //Load first posts

//  $(window).scroll(function() {
//      var bottomElement = $(".status_post").last();
//      var noMorePosts = $('.posts_area').find('.noMorePosts').val();

//      // isElementInViewport uses getBoundingClientRect(), which requires the HTML DOM object, not the jQuery object. The jQuery equivalent is using [0] as shown below.
//      if (isElementInView(bottomElement[0]) && noMorePosts == 'false') {
//          loadPosts();
//      }
//  });

//  function loadPosts() {
//      if(inProgress) { //If it is already in the process of loading some posts, just return
//          return;
//      }
     
//      inProgress = true;
//      $('#loading').show();

//      var page = $('.posts_area').find('.nextPage').val() || 1; //If .nextPage couldn't be found, it must not be on the page yet (it must be the first time loading posts), so use the value '1'

//      $.ajax({
//          url: "includes/handlers/ajax_load_posts.php",
//          type: "POST",
//          data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
//          cache:false,

//          success: function(response) {
//              $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage 
//              $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage 
//              $('.posts_area').find('.noMorePostsText').remove(); //Removes current .nextpage 

//              $('#loading').hide();
//              $(".posts_area").append(response);

//              inProgress = false;
//          }
//      });
//  }

//  //Check if the element is in view
//  function isElementInView (el) {
//      var rect = el.getBoundingClientRect();

//      return (
//          rect.top >= 0 &&
//          rect.left >= 0 &&
//          rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && //* or $(window).height()
//          rect.right <= (window.innerWidth || document.documentElement.clientWidth) //* or $(window).width()
//      );
//  }
// });

//         $(function(){
 
//  var userLoggedIn = '<?php echo $userLoggedIn; ?>';
//  var inProgress = false;

//  loadPosts(); //Load first posts

//  $(window).scroll(function() {
//      var bottomElement = $(".status_post").last();
//      var noMorePosts = $('.posts_area').find('.noMorePosts').val();

//      // isElementInViewport uses getBoundingClientRect(), which requires the HTML DOM object, not the jQuery object. The jQuery equivalent is using [0] as shown below.
//      if (isElementInView(bottomElement[0]) && noMorePosts == 'false') {
//          loadPosts();
//      }
//  });

//  function loadPosts() {
//      if(inProgress) { //If it is already in the process of loading some posts, just return
//          return;
//      }
    
//      inProgress = true;
//      $('#loading').show();

//      var page = $('.posts_area').find('.nextPage').val() || 1; //If .nextPage couldn't be found, it must not be on the page yet (it must be the first time loading posts), so use the value '1'

//      $.ajax({
//          url: "includes/handlers/ajax_load_posts.php",
//          type: "POST",
//          data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
//          cache:false,

//          success: function(response) {
//              $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage
//              $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage
//              $('.posts_area').find('.noMorePostsText').remove(); //Removes current .nextpage

//              $('#loading').hide();
//              $(".posts_area").append(response);

//              inProgress = false;
//          }
//      });
//  }

//  //Check if the element is in view
//  function isElementInView (el) {
//        if(el == null) {
//           return;
//       }

//      var rect = el.getBoundingClientRect();

//      return (
//          rect.top >= 0 &&
//          rect.left >= 0 &&
//          rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && //* or $(window).height()
//          rect.right <= (window.innerWidth || document.documentElement.clientWidth) //* or $(window).width()
//      );
//  }
// });

    </script> -->
</body>
</html>