<?php
include("config.php");
if(isset($_SESSION['uloginid']) && $_SESSION['uloginid'] != ''){
    Header("location:index.php");
}
if(isset($_POST['submit']))
{
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $res = mysqli_query($conn,"select * from users where username='".$username."' and password='".$password."'");
    if(mysqli_num_rows($res) < 1)
    {
        $invalid_cred = true;
    }
    else
    {
        
        $user_data = mysqli_fetch_array($res);
        $_SESSION['uloginid']=$user_data['id'];
        $_SESSION['uloginuser']=$user_data['username'];
        Header("location:index.php");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking Login</title>
    <link rel="stylesheet" href="logincss.css">
</head>
<body>
    <div class="container">
        <h1>Trip Login</h1>
        <?php
                if(isset($_SESSION['action_success_msg'])){
                ?>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <div class="alert alert-success" style="color:green;padding-bottom:15px;">
                            <?php
                                echo $_SESSION['action_success_msg'];
                                unset($_SESSION['action_success_msg']);
                            ?>
                        </div>
                    </div>
                </div>
                <?php
                }
                ?>
                <?php
                if(isset($invalid_cred)){
                ?>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <div class="alert alert-danger" style="color:red;padding-bottom:15px;">
                            Invalid Username or Password!
                        </div>
                    </div>
                </div>
                <?php
                }
                ?>
        <form action="login.php" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" name="submit">Login</button>
        </form>
        <div class="options">
            <a href="rajisteer.php">Register</a>
            
        </div>
    </div>
</body>
</html>
