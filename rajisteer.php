<?php
include("config.php");
if(isset($_SESSION['uloginid']) && $_SESSION['uloginid'] != ''){
    Header("location:index.php");
}
if(isset($_POST['submit']))
{
    
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $cpassword = md5($_POST['confirm_password']);
    
    $rs=mysqli_query($conn, "select * from users where username='".$username."'");
    if (mysqli_num_rows($rs)>0)
    {   
        $_SESSION['action_error_msg'] = "Username already exists.";
    }elseif($password!=$cpassword){
        $_SESSION['action_error_msg'] = "Password and confirm password does not match.";
    }else{

        $inset = mysqli_query($conn,"insert into users (username,email,password) values('".$username."','".$email."','".$password."')");
        if($inset)
        {
            $_SESSION['action_success_msg'] = "User added successfully.";
            Header("location:login.php");
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Registration</title>
    <link rel="stylesheet" href="rajistercss.css">
</head>
<body>
    <div class="container">
        <h1>Hotel  Registration</h1>
        <?php
                if(isset($_SESSION['action_error_msg'])){
                ?>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <div class="alert alert-danger" style="color:red;padding-bottom:15px;">
                            <?php
                                echo $_SESSION['action_error_msg'];
                                unset($_SESSION['action_error_msg']);
                            ?>
                        </div>
                    </div>
                </div>
                <?php
                }
                ?>
        <form action="rajisteer.php" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <button type="submit" name="submit">Register</button>
        </form>
        <div class="options">
            <a href="login.php">Back to Login</a>
        </div>
    </div>
</body>
</html>
