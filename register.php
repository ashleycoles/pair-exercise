<?php
require_once 'functions.php';

session_start();

loggedInRedirect();

if (isset($_POST['username']) && isset($_POST['password'])) {
    $db = getDbConnection();
    $registered = registerUser($db, $_POST['username'], $_POST['password']);

    if ($registered) {
        $_SESSION['loggedIn'] = true;
        $_SESSION['userId'] = $registered;
        header('Location: index.php');
        exit();
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
        <h1>Register</h1>
        <?php
        // Display an error if registration failed
        if (isset($registered) && !$registered) {
            echo 'Error!';
        }

        ?>
        <form class="register-form" method="post">
            <label>Username
                <input type="text" name="username" />
            </label>
            <label>Password
                <input type="text" name="password" />
            </label>
            <input type="submit" />
        </form>
        <h4>Already have an account? <a href="login.php">Login here</a></h4>

    </div>
</main>
</body>
</html>