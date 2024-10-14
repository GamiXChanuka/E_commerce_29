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
