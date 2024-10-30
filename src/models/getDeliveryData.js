import pool from '../lib/dbConfig';

export async function getDeliveryData(orderId) {
    try {
        console.log("🚀 ~ getDeliveryData ~ orderId", orderId);
        const query = 'CALL GetDeliveryData(?);';
        const [rows] = await pool.execute(query, [orderId]);
        console.log(rows);
        return rows[0]; // Assuming there's only one row with this OrderID
    } catch (error) {
        console.log("🚀 ~ getDeliveryData ~ error:", error);
        throw error;
    }
}