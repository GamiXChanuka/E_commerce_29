import pool from '../lib/dbConfig';

export async function getProductsByTitle(title) {
    try {
        console.log("Using connection pool");
        console.log("title", title);

        // Call the stored procedure
        const [rows] = await pool.execute(`CALL GetDistinctVariantDetailsByTitle(?)`, [`%${title}%`]);
        console.log("variant details by title -", rows);

        // Check if the result contains an error message
        const message = rows[0][0]?.message;
        if (message && message.includes('Error')) {
            throw new Error(message);
        }
        console.log("title products",rows);
        return rows[0];
    } catch (error) {
        console.error('Error fetching variant details by title:', error);
        throw new Error('Failed to fetch variant details by title');
    }
}