import pool from '../lib/dbConfig';

// Function to create a new user
export const createUser = async (userData) => {
    const connection = await pool.getConnection();
    
    try {
        await connection.beginTransaction(); // Start a transaction
        const {
            firstName,
            lastName,
            userName,
            phoneNumber,
            email,
            password,
            addressNumber,
            lane,
            city,
            postalCode,
            district,
        } = userData;

        // Insert the new user into the User table
        const userQuery = `
            INSERT INTO User (PhoneNumber, FirstName, LastName, Role) 
            VALUES (?, ?, ?, 'Registered')
        `;
        const [userResult] = await connection.execute(userQuery, [
            phoneNumber,
            firstName,
            lastName,
        ]);
        console.log('userResult:', userResult);
        const userId = userResult.insertId; // Get the newly inserted user ID

        // Insert the user's address into the Address table
        const addressQuery = `
        INSERT INTO Address (AddressNumber, Lane, City, PostalCode, District) 
        VALUES (?, ?, ?, ?, ?)
        `;
        const [addressResult] = await connection.execute(addressQuery, [
            addressNumber,
            lane,
            city,
            postalCode,
            district
        ]);
        
        const addressId = addressResult.insertId;
        
        // Insert the user into the RegisteredCustomer table
        const registeredCustomerQuery = `
            INSERT INTO RegisteredCustomer (UserID, UserName, Email, Password, AddressID)
            VALUES (?, ?, ?, ?, ?)
        `;
        const [registeredCustomerResult] = await connection.execute(registeredCustomerQuery, [
            userId,
            userName,
            email,
            password, // Password is already hashed before this function call
            addressId
        ]);
        
        await connection.commit(); // Commit the transaction

        return {
            userId,
            addressId,
            registeredCustomerId: registeredCustomerResult.insertId,
        };
    } catch (error) {
        await connection.rollback(); // Rollback the transaction if an error occurs
        console.log('Error creating user:', error);
        throw error;
    }
};

// Function to get a user by email
export const getUserByEmail = async (email) => {
    try {
        const query = 'SELECT * FROM RegisteredCustomer WHERE Email = ?';
        const [rows] = await pool.execute(query, [email]);
        return rows[0]; 
    } catch (error) {
        console.error('Error fetching user from database:', error);
        throw error;
    }
};

// Function get user info
export const getUserInfo = async (userId) => {
    try {
        const query = `
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
            WHERE User.UserID = ?
        `;
        const [rows] = await pool.execute(query, [userId]);
        return rows[0]; // Assuming there's only one user with this ID
    } catch (error) {
        console.error('Error fetching user info from database:', error);
        throw error;
    }
};

// get username by user id
export const getUserNameById = async (userId) => {
    try {
        const query = 'SELECT UserName FROM registeredcustomer WHERE UserID = ?';
        const [rows] = await pool.execute(query, [userId]);
        return rows[0].UserName;
    } catch (error) {
        console.error('Error fetching username from database:', error);
        throw error;
    }
};



// Fetch products from the database
export const getProducts = async () => {
    try {
        const query = 'SELECT image_url, title, short_description FROM products';
        const [rows] = await pool.execute(query); // Execute the query to fetch all products
        return rows; // Return all rows (products)
    } catch (error) {
        console.error('Error fetching products from database:', error);
        return error;
        throw error;
    }
};
