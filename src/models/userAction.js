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
        const query = 'CALL getUserByEmail(?)';
        const [rows] = await pool.execute(query, [email]);
        return rows[0][0];  // first[0] is the result of the procedure, second [0] is the first row of the result
    } catch (error) {
        throw error;
    }
};

// Function get user info
export const getUserInfo = async (userId) => {
    try {
        const query = `CALL GetUserInfo(?)`;
        const [rows] = await pool.execute(query, [userId]);
        return rows[0][0]; // Assuming there's only one user with this ID
    } catch (error) {
        throw error;
    }
};

// get username by user id
export const getUserNameById = async (userId) => {
    try {
        const query = 'CALL GetUserNameByID(?)';
        const [rows] = await pool.execute(query, [userId]);
        return rows[0][0].UserName; //rows[0][0] = {UserName: 'username'} , rows[0][0].UserName = 'username'
    } catch (error) {
        throw error;
    }
};
