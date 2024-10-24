import pool from '../lib/dbConfig';

export async function addAddress(address) {
    const { AddressNumber, Lane, City, PostalCode, District } = address;

    try {
        console.log("Using connection pool");

        // Call the stored procedure
        const [rows] = await pool.execute(
            `CALL AddAddress(?, ?, ?, ?, ?, @AddressID)`,
            [AddressNumber, Lane, City, PostalCode, District]
        );

        // Extract the message and AddressID from the result
        const message = rows[0][0]?.message;
        const AddressID = rows[0][0]?.AddressID;

        if (message.includes('Error')) {
            throw new Error(message);
        }

        return { message, AddressID };
    } catch (error) {
        console.error('Error adding address:', error);
        throw new Error('Failed to add address');
    }
}