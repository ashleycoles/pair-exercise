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
</head>
<body>
<main>
    <div class="container" >
        <h1>Register</h1>
        <?php
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
    </div>
</main>
</body>
</html>