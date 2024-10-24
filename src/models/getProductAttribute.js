import pool from '../lib/dbConfig';

export async function getProductAttribute(VariantID) {
    console.log("Using connection pool");

    try {
        // Call the stored procedure
        const [rows] = await pool.execute(`CALL GetProductAttribute(?)`, [VariantID]);

        // Check if the result contains an error message
        const message = rows[0][0]?.message;
        if (message && message.includes('Error')) {
            throw new Error(message);
        }

        return rows[0];
    } catch (error) {
        console.log('Error fetching product attributes:', error);
        throw new Error('Failed to fetch product attributes');
    }
}