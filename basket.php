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
</head>
<body>

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