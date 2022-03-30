<?php
require_once 'functions.php';

$db = getDbConnection();

$products = getAllProducts($db);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Beetles</title>
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
    <div class="container products">

        <?php foreach($products as $product) { ?>

        <div class='product'>
            <?php if ($product['sale_active']) { ?>
                <div class="sale">Sale</div>
            <?php } ?>

            <?php if ($product['qty'] == 0) { ?>
                <div class="out-of-stock">Out of stock</div>
            <?php } ?>

            <div class="product-img">
                <img
                    src="<?php echo $product['img_url']; ?>"
                    alt="<?php echo $product['name']; ?>"
                />
            </div>
            <div class="product-title"><?php echo $product['name']; ?></div>
            <div class="product-price">
                £<?php echo ($product['sale_active'] ? $product['sale_price'] : $product['price']); ?>
                </div>
            <a class="btn" href="product.php?product_id=<?php echo $product['id']; ?>">View more</a>
        </div>

        <?php } ?>

    </div>
</main>

</body>
</html>