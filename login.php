<?php

require_once 'functions.php';
session_start();

loggedInRedirect();

$error = '';

if (isset($_GET['error'])) {
    $error = $_GET['error'];
}

if (isset($_POST['username']) && isset($_POST['password'])) {
    $db = getDbConnection();
    $user = getSingleUser($db, $_POST['username']);

    if (!$user) {
        $error = 'Invalid username or password.';
    } else {
        if ($_POST['password'] === $user['password']) {
            $_SESSION['loggedIn'] = true;
            $_SESSION['userId'] = $user['id'];
            header('Location: account.php');
            exit;
        } else {
            $error = 'Invalid username or password.';
        }
    }
}

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
    <div class="container" >
        <h1>Login</h1>
        <?php
        // Display any errors
        // For example if a user tries to add a product to their basket without
        // being logged in
        echo "<span>$error</span>";

        ?>
        <form class="login-form" method="post">
            <label>Username
                <input type="text" name="username" />
            </label>
            <label>Password
                <input type="text" name="password" />
            </label>
            <input type="submit" />
        </form>
        <h4>Don't have an account? <a href="register.php">Register here</a></h4>
    </div>
</main>
</body>
</html>