# Pair programming exercise

This exercise is all about building a basic online store. I've provided a pre-made database with some products, as well as HTML and CSS for most of the pages you'll need.


## Feature one - list products

Using the database provided, create a basic product listing page. You'll find that there is already an index.php file with a basic template for what a product should look like. Some basic CSS has also been provided.

If there are no products in the database you should display an error message.


## Feature two - product detail page

When a user clicks the 'view more' button they should be sent to a product details page. You should display the image, name, price and description.

Again you will notice that there is a product.php that already contains all the HTML you need.

If a product has 0 qty, the add to basket button should be disabled. You can acheive this by adding a `disabled` class to the button.

## Feature three - add to basket

When a user views a product detail page, clicking the add to basket button should redirect the user to the basket.php page.

If the product is out of stock, rather than adding the product to the basket, you should instead display an error message.

For this store, only a single qty of a product can be added, so if the basket already contains a product being added, you should display an error message.

You'll notice that the database already contains a basket_products table, this can be used to record which products a given user has added to their cart. To start with, set it so that all products in the cart are assigned to the user with the ID of 1.

When displaying the products in the basket, also assume the user ID of 1.

## Feature four - user login

Allow a customer to log into their account. The database provided already includes a user table with a single user.

Use the login.php page provided (yes it's ugly, I didn't have time to style it soz) as your starting point. If the user enters the correct details (by checking them against the database) store their user id in a session and redirect them back to the home page.

Update your add to basket functionality so that a user can only add a product if they are logged in, and ensure that the current users ID is used when adding products to the cart (originally it was hard coded as ID 1)

Update the basket display to only show products added by that particular user.


## Feature five - user registration

Allow new customers to register an account. Use the provided register.php file (again sorry it's ugly) as a start point.

Once the user enters a username and password, save them as a new row in the users table.


## Feature six - password encryption

Update functionality for logging in and registering to ensure passwords are properly hashed before being stored.

## Feature seven - log out

Add a button at the bottom of each page (note there is already a pre-styled btn class you can use) that will log a user out (only if they're signed in).

If no user is signed in, the button should instead allow them to login.


## Feature eight - complete order

Add a checkout button to the basket page.

When clicked, the basket should be emptied and a new entry into the orders table should be made. At the same time you should store the IDs of all products ordered in the order_products table. 

You should also deduct 1 from the qty level of any products ordered.