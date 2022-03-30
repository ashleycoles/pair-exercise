<?php

/**
 * Creates a PDO connection to the app database
 *
 * @return PDO
 */
function getDbConnection(): PDO {
    $db = new PDO('mysql:host=db; dbname=beatles', 'root', 'password');
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $db;
}

/**
 * Returns all products from the database
 *
 * @param PDO $db
 *
 * @return array
 */
function getAllProducts(PDO $db): array {
    $query = $db->prepare('SELECT `id`, `name`, `price` , `qty`, `img_url`, `sale_price`, `sale_active` FROM `products`;');
    $query->execute();
    return $query->fetchAll();
}

/**
 * Returns a single product from the db by its ID
 *
 * @param PDO $db
 * @param int $id
 *
 * @return mixed
 */
function getSingleProduct(PDO $db, int $id) {
    $query = $db->prepare('SELECT `id`, `name`, `description`, `price` , `qty`, `img_url`, `sale_price`, `sale_active` FROM `products` WHERE `id` = :id;');
    $query->bindParam(':id', $id);
    $query->execute();
    return $query->fetch();
}

/**
 * Adds a single product to a given users basket
 *
 * @param PDO $db
 * @param int $userId
 * @param int $productId
 *
 * @return bool
 */
function addProductToBasket(PDO $db, int $userId, int $productId): bool {
    $query = $db->prepare('INSERT INTO `basket_products` (`user_id`, `product_id`) VALUES(:userId, :productId);');
    $query->bindParam(':userId', $userId);
    $query->bindParam(':productId', $productId);
    return $query->execute();
}

/**
 * Checks to see if a given product is in a given users basket
 *
 * @param PDO $db
 * @param int $userId
 * @param int $productId
 *
 * @return bool
 */
function isProductInBasket(PDO $db, int $userId, int $productId): bool {
    $query = $db->prepare('
        SELECT `id` 
            FROM `basket_products` 
            WHERE `user_id` = :userId AND `product_id` = :productId;');
    $query->bindParam(':userId', $userId);
    $query->bindParam(':productId', $productId);
    $query->execute();
    return (bool)$query->fetch();
}

/**
 * Get all products in a given users basket
 *
 * @param PDO $db
 * @param int $userId
 *
 * @return array
 */
function getProductsInBasket(PDO $db, int $userId): array {
    $query = $db->prepare('
        SELECT `products`.`name`
	        FROM `basket_products`
		    INNER JOIN `products`
		        ON `basket_products`.`product_id` = `products`.`id`
		    WHERE `basket_products`.`user_id` = :userId;');
    $query->bindParam(':userId', $userId);
    $query->execute();
    return $query->fetchAll();
}

/**
 * Register a user
 *
 * @param PDO $db
 * @param string $username
 * @param string $password
 *
 * @return mixed
 */
function registerUser(PDO $db, string $username, string $password) {
    $query = $db->prepare('INSERT INTO `users` (`username`, `password`) VALUES (:username, :password);');
    $query->bindParam(':username', $username);
    $query->bindParam(':password', $password);
    if (!$query->execute()) {
        return false;
    }
    return $db->lastInsertId();
}

/**
 * Redirect a user home if they are logged in
 *
 * @return void
 */
function loggedInRedirect(): void {
    if (isset($_SESSION['loggedIn'])) {
        header('Location: index.php');
        exit();
    }
}