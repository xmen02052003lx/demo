<?php 
require "../../config.php";
require "../classes/User.php";

$query = $_POST['query'];
$userLoggedIn = $_POST['userLoggedIn'];

$names = explode(" ", $query);

if(strpos($query, "_") !== false) {
    $usersReturned = mysqli_query($con, "SELECT * FROM users WHERE username LIKE '$query%' ABD user_closed='no' LIMIT 8");
}
else if(count($names) == 2) {
    $usersReturned = mysqli_query($con, "SELECT * FROM users WHERE ((firstname LIKE '%$names[0]%' AND lastname LIKE '%$names[1]%') OR (firstname LIKE '%$names[1]%' AND lastname LIKE '%$names[0]%')) AND user_closed='no' LIMIT 8");
}
else {
    $usersReturned = mysqli_query($con, "SELECT * FROM users WHERE (firstname LIKE '%$names[0]%' OR lastname LIKE '%$names[0]%') AND user_closed='no' LIMIT 8");
}

if($query != "") {
    while($row = mysqli_fetch_array($usersReturned)) {
        $user = new User($con, $userLoggedIn);

        if($row['username'] != $userLoggedIn) {
            $mutual_friends = $user->getMutualFriends($row['username']) . " friends in common";
        }
        else {
            $mutual_friends = "";
         }

         if($user->isFriend($row['username'])) {
            echo "<div class='resultDisplay'>
                <a href='messages.php?u='" . $row['username'] . "' style='color: #000;'>
                <div class='liveSearchProfilePic'>
                    <img src='" . $row['profile_pic'] . "'>
                </div>
                
                <div class='liveSearchText'>
                ".$row['firstname'] . " " . $row['lastname'] . "
                <p>" . $row['username'] . "</p>
                <p id='grey'>" . $mutual_friends . "</p>
                </div>
                </a>
            
            </div>
            ";
         }
    }
}
?>