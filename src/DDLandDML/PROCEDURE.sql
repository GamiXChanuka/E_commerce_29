DELIMITER $$
CREATE PROCEDURE GetUserInfo(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM User
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist';
    ELSE
        SELECT 
            user.FirstName,
            user.LastName,
            user.PhoneNumber,
            registeredcustomer.UserName,
            registeredcustomer.Email,
            Address.AddressNumber,
            Address.Lane,
            Address.City,
            Address.PostalCode,
            Address.District
        FROM User
        JOIN RegisteredCustomer ON User.UserID = RegisteredCustomer.UserID
        JOIN Address ON registeredcustomer.AddressID = Address.AddressID
        WHERE User.UserID = userId;
    END IF;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE CreateUser(
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN userName VARCHAR(255),
    IN phoneNumber VARCHAR(20),
    IN email VARCHAR(255),
    IN password VARCHAR(255),
    IN addressNumber VARCHAR(255),
    IN lane VARCHAR(255),
    IN city VARCHAR(255),
    IN postalCode VARCHAR(20),
    IN district VARCHAR(255),
    OUT userId INT,
    OUT addressId INT
)
BEGIN
    -- Insert the new user into the User table
    INSERT INTO User (PhoneNumber, FirstName, LastName, Role)
    VALUES (phoneNumber, firstName, lastName, 'Registered');
    SET userId = LAST_INSERT_ID(); -- Get the newly inserted user ID

    -- Insert the user's address into the Address table
    INSERT INTO Address (AddressNumber, Lane, City, PostalCode, District)
    VALUES (addressNumber, lane, city, postalCode, district);
    SET addressId = LAST_INSERT_ID(); -- Get the newly inserted address ID

    -- Insert the user into the RegisteredCustomer table
    INSERT INTO RegisteredCustomer (UserID, UserName, Email, Password, AddressID)
    VALUES (userId, userName, email, password, addressId);

    COMMIT;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetUserNameByID(IN userId INT)
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM User
    WHERE UserID = userId;

    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not a registered customer';
    ELSE
        SELECT 
            registeredcustomer.UserName
        FROM User
        JOIN RegisteredCustomer ON User.UserID = RegisteredCustomer.UserID
        WHERE User.UserID = userId;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `GetUserByEmail`(IN inputEmail VARCHAR(255))
BEGIN
    -- Check if the user exists
    DECLARE user_exists INT;

    -- Check if email exists in RegisteredCustomer table
    SELECT COUNT(*) INTO user_exists
    FROM RegisteredCustomer
    WHERE Email = inputEmail;

    -- If no user is found, raise an error
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User email is incorrect';
    ELSE
        -- Fetch user details if the email exists
        SELECT * 
        FROM RegisteredCustomer
        WHERE Email = inputEmail;
    END IF;
END$$
DELIMITER ;

-------------------------------------------------------
-- new search procedure  ------------------------------

DELIMITER $$

CREATE PROCEDURE GetProductVariantsByCategory(IN categoryNameInput VARCHAR(50))
BEGIN
    -- Step 1: Recursive CTE to find the category tree (including parents and children)
    WITH RECURSIVE CategoryTree AS (
        -- Find the category matching the input name with wildcards for partial match
        SELECT CategoryID
        FROM category
        WHERE CategoryName LIKE CONCAT('%', categoryNameInput, '%')  -- Added wildcards
        
        UNION ALL
        
        -- Recursively find parent categories and their children
        SELECT c.CategoryID
        FROM category c
        INNER JOIN CategoryTree ct ON c.ParentCategoryID = ct.CategoryID
    ),

    -- Step 2: Get ranked products with variants and images
    RankedProducts AS (
        SELECT 
            v.VariantID,
            v.Price,
            p.ProductID, 
            p.Title, 
            pc.CategoryID, 
            c.CategoryName,
            i.ImageLink AS image_link,
            ROW_NUMBER() OVER (PARTITION BY p.ProductID ORDER BY p.ProductID) AS row_num
        FROM 
            product p
            JOIN productcategory pc ON p.ProductID = pc.ProductID
            JOIN category c ON pc.CategoryID = c.CategoryID
            JOIN variant v ON p.ProductID = v.ProductID
            JOIN image i ON v.VariantID = i.VariantID
        WHERE 
            pc.CategoryID IN (SELECT CategoryID FROM CategoryTree)  -- Categories from the CTE
    )

    -- Step 3: Select the required product information
    SELECT 
        ProductID, 
        Title, 
        CategoryID, 
        CategoryName, 
        image_link,
        VariantID,
        Price
    FROM 
        RankedProducts
    WHERE 
        row_num = 1;  -- Get only one variant per product

END$$

DELIMITER ;

