import pool from '../lib/dbConfig';

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

        // Call the stored procedure and define OUT parameters
        const createUserQuery = `CALL CreateUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @userId, @addressId)`;

        // Execute the procedure
        await connection.execute(createUserQuery, [
            firstName,
            lastName,
            userName,
            phoneNumber,
            email,
            password, // Ensure password is hashed before passing it
            addressNumber,
            lane,
            city,
            postalCode,
            district
        ]);

        // Fetch the OUT parameters (userId and addressId) from the procedure
        const [rows] = await connection.execute('SELECT @userId AS userId, @addressId AS addressId');

        const { userId, addressId } = rows[0];

        await connection.commit(); // Commit the transaction

        return {
            userId,
            addressId
        };
    } catch (error) {
        await connection.rollback(); // Rollback the transaction if an error occurs
        console.log("🚀 ~ createUser ~ error:", error)
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
        console.log("🚀 ~ getUserByEmail ~ error:", error)
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
        console.log("🚀 ~ getUserInfo ~ error:", error)
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
        console.log("🚀 ~ getUserNameById ~ error:", error)
        throw error;
    }
};


export async function addUserAndGetCartID(user) {
    const { PhoneNumber, FirstName, LastName, Role } = user;

    try {
        console.log("Using connection pool");

        // Call the stored procedure to add the user and get the cart ID
        const [rows] = await pool.execute(
            `CALL AddUserAndGetCartID(?, ?, ?, ?, @UserID, @CartID)`,
            [PhoneNumber, FirstName, LastName, Role]
        );
        console.log(rows);
        // Extract the message, UserID, and CartID from the result
        const message = rows[0][0].message;
        const UserID = rows[0][0].UserID;
        const CartID = rows[0][0].CartID;

        

        if (message.includes('Error')) {
            throw new Error(message);
        }

        return { message, UserID, CartID };
    } catch (error) {
        console.error('Error adding user and cart:', error);
        throw new Error('Failed to add user and cart');
    }
}

//get cart id by user id
export const getUserCartId = async (userId) => {
    try {
        const query = 'CALL GetCartIDByUserID(?);';
        const [rows] = await pool.execute(query, [userId]);
        console.log(rows[0]);
        return rows[0]; //
    } catch (error) {
        console.log("🚀 ~ getUserNameById ~ error:", error)
        throw error;
    }
};