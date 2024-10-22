import pool from '../lib/dbConfig';

export async function getProductVariants(ProductID) {
    console.log("Using connection pool");
    console.log("ProductID", ProductID);

    try {
        // Call the stored procedure
        const [rows] = await pool.execute(`CALL GetProductVariants(?)`, [ProductID]);
        console.log("variant details ", rows);

        // Check if the result contains an error message
        const message = rows[0][0]?.message;
        if (message && message.includes('Error')) {
            throw new Error(message);
        }

        return rows[0];
    } catch (error) {
        console.error('Error fetching product variants:', error);
        throw new Error('Failed to fetch product variants');
    }
}