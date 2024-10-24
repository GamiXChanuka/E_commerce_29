import pool from '../lib/dbConfig';

export async function getCart(userId) {
    try {
        console.log("Using connection pool");

        // Call the stored procedure
        const [rows] = await pool.execute(
            `CALL GetCart(?)`, 
            [userId]
        );

        return rows[0];
    } catch (error) {
        console.log("Error fetching cart:", error.message);
        throw error;
    }
}


//get cart id by user id
export async function getCartId(userId) {
    try {
        // Call the stored procedure
        const [rows] = await pool.execute('CALL GetCartId(?)', [userId]);

        // Extract the CartID from the nested array structure
        const cartId = rows[0][0].CartID;

        return cartId;
    } catch (error) {
        console.log("Error fetching cart ID:", error.message);
        throw error;
    }
}