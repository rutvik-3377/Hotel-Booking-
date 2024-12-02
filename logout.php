<?php
session_start();
unset($_SESSION['uloginid']);
unset($_SESSION['uloginuser']);
header("Location: index.php");
?>