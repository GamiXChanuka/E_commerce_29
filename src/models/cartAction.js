import pool from '../lib/dbConfig';

export async function getCart(userId) {
    try {
        console.log("Using connection pool");

        // Combined query to get CartID and related cart items using UserID
        const [rows] = await pool.execute(
            `SELECT ci.*, v.VariantName, v.Price, i.ImageLink
             FROM CartItem ci
             JOIN Cart c ON ci.CartID = c.CartID
             JOIN Variant v ON ci.VariantID = v.VariantID
             JOIN Product p ON v.ProductID = p.ProductID
             JOIN Image i ON i.VariantID = v.VariantID
             WHERE c.UserID = ?`, 
            [userId]
        );

        console.log(rows);
        return rows;
    } catch (error) {
        console.log("Error fetching cart:", error.message);
    }}


//get cart id by user id
export async function getCartId(userId) {
    try {
        const [rows] = await pool.execute('SELECT CartID FROM Cart WHERE UserID = ?', [userId]);
        return rows[0].CartID;
    } catch (error) {
        throw error;
    }
}
