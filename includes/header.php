<?php 
require 'config.php';
require "includes/classes/User.php";
require "includes/classes/Post.php";
require "includes/classes/Message.php";

if(isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
    <link rel="stylesheet" href="assets/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
	<link rel="stylesheet" href="assets/css/jquery.Jcrop.css" type="text/css" />
   
    <script src="https://kit.fontawesome.com/06221bb005.js" crossorigin="anonymous"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" ></script>
    <!-- <script src="assets/js/bootstrap.js"></script> -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/jquery.Jcrop.js"></script>
	<script src="assets/js/jcrop_bits.js"></script>
    <script defer src="assets/js/demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<!-- Javascript -->


    <title>Welcome to UEH's Social</title>
    
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top navbar-light ">
      <div class="container">
        <a class="navbar-brand text-primary fw-bold fs-3" href="index.php">
          UEH's social
        </a>
        <div class="search ">
          <form action="search.php" method="get" name='search_form' class='d-flex'>
            <input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn ?>')", name='q' placeholder="Search..." autocomplete='off' id='search_text_input'>
            <div class='button_holder'>
              <img src="assets/images/icons/magnifying_glass.png" alt="searchImg" class='bg-white'>
            </div>
          </form>
          <div class='search_results'></div>
          <div class='search_results_footer_empty'></div>
        </div>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavDropdown"
          aria-controls="navbarNavDropdown"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav ms-auto">
          <li class="nav-item">
              <a class="nav-link" aria-current="page" href="<?php echo $userLoggedIn; ?>">
                <?php echo "Hello, " . $user['firstname']; ?>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#index.php"><i class="fas fa-home fa-2x text-primary"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="messages.php" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'message')"><i class="fa-regular fa-envelope fa-2x text-primary"></i></a>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#"><i class="fa-regular fa-bell fa-2x text-primary"></i></a>
            </li> -->
            <li class="nav-item">
              <a class="nav-link" href="requests.php"><i class="fas fa-users fa-2x text-primary"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="settings.php"><i class="fas fa-gear fa-2x text-primary"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="includes/handlers/logout.php"><i class="fas fa-right-from-bracket fa-2x text-primary"></i></a>
            </li>
            <li class="nav-item d-flex align-items-center">
              <a
                class="btn btn-outline-primary px-4 mx-4"
                href="contact.php" onMouseOver="this.style.color='white'"
                onMouseOut="this.style.color=''"
                >Contact Us</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="dropdown_data_window" style='border: none;'>
      <input type="hidden" id="dropdown_data_type" value="">
    </div>

    
    <div class="modal fade" id="deletePostModal" tabindex="-1" role="dialog" aria-labelledby="deletePostModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePostModalLabel">Delete Post</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this post?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
            </div>
        </div>
    </div>
</div>
 
<button id="to-top" class="to-top-btn">
      <img src="assets/images/up-arrow.png" alt="to-top-btn" />
</button>	
