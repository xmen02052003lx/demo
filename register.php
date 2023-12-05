<?php 
require 'config.php';
require 'includes/form_handlers/register_handler.php';
require 'includes/form_handlers/login_handler.php';


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/register_style.css">
    <link rel="stylesheet" href="assets/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
    <script src="https://kit.fontawesome.com/06221bb005.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="assets/js/register.js" defer></script>
    <title>Welcome to UEH's Social</title>
</head>
<body>
    <?php 
    if(isset($_POST['register_button'])) {
        echo '
        <script> 

        $(document).ready(function() {
            $("#first").hide();
            $("#second").show();

        });

        </script>
        
        ';
    }
    ?>

<div class="wrapper">

    <div class="login_box">
        <div class="login_header">
            <h1>UEH's Social</h1>
        </div>
        <div id="first">
    <form action="register.php" method="POST">
        <input type="email" name="log_email" placeholder="Email Address" 
        value="<?php if(isset($_SESSION['log_email'])) {echo $_SESSION['log_email'];} ?>" class="form-control" required
        >
        <br>
        <input type="password" name="log_password" placeholder="Password" class="form-control">
        <br>
        <?php if(in_array("Email or password was incorrect<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'> Email or password was incorrect</span><br>" ?>
        <input type="submit" name="login_button" value="Login" class="btn btn-primary w-100 text-light">
        <br>
        <a href="#" id="signup" class="signup">Need an account? Register here!</a>

    </form>
    </div>
    <div id="second">
    <form action="register.php" method="POST">
        <input type="text" name="reg_fname" placeholder="First Name" value="<?php if(isset($_SESSION['reg_fname'])) {echo $_SESSION['reg_fname'];} ?>" class="form-control" required>
        <br>
        <?php 
        if(in_array("Your first name must be between 2 and 25 characters<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Your first name must be between 2 and 25 characters</span><br>";
        ?>
        <input type="text" name="reg_lname" placeholder="Last Name" value="<?php if(isset($_SESSION['reg_lname'])) {echo $_SESSION['reg_lname'];} ?>" class="form-control" required>
        <br>
        <?php 
        if(in_array("Your last name must be between 2 and 25 characters<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Your last name must be between 2 and 25 characters</span><br>";
        ?>
        <input type="email" name="reg_email" placeholder="Email" value="<?php if(isset($_SESSION['reg_email'])) {echo $_SESSION['reg_email'];} ?>" class="form-control"  required>
        <br>
        <?php 
        if(in_array("Email already in use<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'> Email already in use</span><br>";
        ?>
        <input type="email" name="reg_email2" placeholder="Confirm Email" value="<?php if(isset($_SESSION['reg_email2'])) {echo $_SESSION['reg_email2'];} ?>" class="form-control" required>
        <br>
        <?php 
        if(in_array("Email already in use<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'> Email already in use</span><br>";
        else if(in_array("Invalid email format<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Invalid email format</span><br>";
        else if(in_array("Emails don't match<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'> Emails don't match</span><br>";
        ?>
        <input type="password" name="reg_password" placeholder="Password" class="form-control" required>
        <br>
        <input type="password" name="reg_password2" placeholder="Confirm password" class="form-control" required>
        <br>
        <?php 
        if(in_array("Your password do not match<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Your password do not match</span><br>";
        else if(in_array("Your password can only contain english characters or numbers<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Your password can only contain english characters or numbers</span><br>";
        else if(in_array("Your password must be between 5 and 30 characters<br>", $error_array)) echo "<span class='text-danger fw-bold d-flex align-items-center justify-content-center'>Your password must be between 5 and 30 characters</span><br>";
        ?>
        <input type="submit" name="register_button" value="Register" class="btn btn-primary w-100 text-light">
        <br>
        <?php 
        if(in_array("<span style='color:#14c000;'>You're all set! Go ahead and login! </span><br>", $error_array)) echo "<span class='fw-bold' style='color:#14c000;'>You're all set! Go ahead and login! </span><br>";
        ?>
        <a href="#" id="signin" class="signin">Already have an account? Sign in here!</a>
    </form>
    </div>

    </div>
</div>
</body>
</html>