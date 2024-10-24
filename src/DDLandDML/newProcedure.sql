CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAddress`(
    IN AddressNumber VARCHAR(10),
    IN Lane VARCHAR(50),
    IN City VARCHAR(50),
    IN PostalCode VARCHAR(10),
    IN District VARCHAR(50),
    OUT AddressID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding address' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert the new address
    INSERT INTO `address` (AddressNumber, Lane, City, PostalCode, District)
    VALUES (AddressNumber, Lane, City, PostalCode, District);

    -- Get the last inserted AddressID
    SET AddressID = LAST_INSERT_ID();

    COMMIT;
    SELECT 'Address added successfully' AS message, AddressID;
END


--------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserAndGetCartID`(
    IN PhoneNumber CHAR(10),
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50),
    IN Role ENUM('Registered', 'UnRegistered'),
    OUT UserID INT,
    OUT CartID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Handle the error
        SELECT 'Error adding user' AS message;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Insert the new user
    INSERT INTO `user` (PhoneNumber, FirstName, LastName, Role)
    VALUES (PhoneNumber, FirstName, LastName, Role);

    -- Get the last inserted UserID
    SET UserID = LAST_INSERT_ID();

    -- Insert a new cart for the newly registered user
    INSERT INTO Cart (UserID)
    VALUES (UserID);

    -- Get the last inserted CartID
    SET CartID = LAST_INSERT_ID();

    COMMIT;
    SELECT 'User and cart added successfully' AS message, UserID, CartID;
END


--------------------------------------------------------------

