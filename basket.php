<?php
require_once 'functions.php';

session_start();

if (!isset($_SESSION['loggedIn'])) {
    header('Location: login.php?error=You must be logged in to add a product to the basket');
    exit();
}

$db = getDbConnection();

if (isset($_GET['product_id']) && is_numeric($_GET['product_id'])) {
    $basketProduct = getSingleProduct($db, $_GET['product_id']);

    // Make sure the product being added actually exists
    if (!$basketProduct) {
        header('Location: index.php');
        exit();
    }

    // Make sure the product is in stock
    if ($basketProduct < 1) {
        header('Location: index.php');
        exit();
    }

    $alreadyInBasket = isProductInBasket($db, $_SESSION['userId'], $_GET['product_id']);

    if (!$alreadyInBasket) {
        $added = addProductToBasket($db, $_SESSION['userId'], $_GET['product_id']);
    }

}

$products = getProductsInBasket($db, 1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basket</title>
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
    <div class="container basket">
        <h1>Basket</h1>
        <ul>
            <?php
            if (count($products) == 0) {
                echo '<li>Basket empty</li>';
            }
            ?>
            <?php foreach ($products as $product) { ?>
            <li><?php echo $product['name']; ?></li>
            <?php } ?>
        </ul>
    </div>
</main>

</body>
</html>