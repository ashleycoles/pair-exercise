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
        <h1>Login</h1>
        <?php

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