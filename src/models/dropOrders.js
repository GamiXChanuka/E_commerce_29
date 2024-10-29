import pool from '../lib/dbConfig';

export async function dropOrder(orderId) {
    try {
        console.log("Using connection pool");

        // Call the stored procedure
        const [result] = await pool.execute(
            `CALL DropOrder(?)`,
            [orderId]
        );

        // Extract the message from the result
        const message = result[0][0].message;

        if (message.includes('Error')) {
            throw new Error(message);
        } else {
            console.log(message);
            return message;
        }
    } catch (error) {
        console.log('Error dropping order:', error);
        throw new Error('Failed to drop order');
    }
}