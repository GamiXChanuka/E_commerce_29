import pool from '../lib/dbConfig';

export async function getProductsByTitle(title) {
    try {
        console.log("Using connection pool");

        // Call the stored procedure
        const [rows] = await pool.execute(`CALL GetDistinctVariantDetailsByTitle(?)`, [`%${title}%`]);

        // Check if the result contains an error message
        const message = rows[0][0]?.message;
        if (message && message.includes('Error')) {
            throw new Error(message);
        }
        return rows[0];
    } catch (error) {
        console.log('Error fetching variant details by title:', error);
        throw new Error('Failed to fetch variant details by title');
    }
}