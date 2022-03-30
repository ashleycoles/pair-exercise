<?php
require_once 'functions.php';

// Only bother to get the DB connection and look for a product if we have a product_id in the
// query string - also check to see if the id is a number, if not redirect home
if (isset($_GET['product_id']) && is_numeric($_GET['product_id'])) {
    $db = getDbConnection();
    $product = getSingleProduct($db, $_GET['product_id']);

    if (!$product) {
        header('Location: index.php');
        exit();
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $product['name']; ?></title>
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
    <div class="container single-product">
        <div class="product-img">
            <?php if ($product['sale_active']) { ?>
                <div class="sale">Sale</div>
            <?php } ?>

            <?php if ($product['qty'] == 0) { ?>
                <div class="out-of-stock">Out of stock</div>
            <?php } ?>

            <img
                    src="<?php echo $product['img_url']; ?>"
                    alt="<?php echo $product['name']; ?>"
            />
        </div>
        <div class="product-title"><?php echo $product['name']; ?></div>
        <div class="product-desc"><?php echo $product['description']; ?></div>
        <div class="product-price">£<?php echo ($product['sale_active'] ? $product['sale_price'] : $product['price']); ?></div>
        <a class="btn <?php echo ($product['qty'] == 0 ? 'disabled': ''); ?>" href="basket.php?product_id=<?php echo $product['id']; ?>">Add to basket</a>
    </div>
</main>
</body>
</html>
<?php
} else {
    header('Location: index.php');
    exit();
}


