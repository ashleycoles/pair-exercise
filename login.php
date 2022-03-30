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
                <li><a href="login.php">Log In</a></li>
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
        if (isset($_GET['error'])) {
            echo $_GET['error'];
        }

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
    </div>
</main>
</body>
</html>