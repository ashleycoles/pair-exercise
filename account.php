<?php
require_once 'functions.php';

session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Arabic:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>

<nav>
    <div class="container">
        <div class="menu menu-left">
            <ul>
                <li><a href="index.php">Products</a></li>
            </ul>
        </div>
        <div class="menu menu-right">
            <ul>
                <li><a href="basket.php">Basket</a></li>
                <li><a href="account.php">My Account</a></li>
                <li><li><?php echo displayLoginOutButton(loginCheck()) ?></li></li>
            </ul>
        </div>
    </div>
</nav>

<main>
    <div class="container">

    </div>
</main>
</body>
</html>