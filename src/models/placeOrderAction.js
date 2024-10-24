
import pool from '../lib/dbConfig';

export async function placeOrder(userid, cartId, DeliveryType, PaymentMethod, AddressID) {
  console.log("Using connection pool");

  try {
    // Call the stored procedure
    const [result] = await pool.execute(
      `CALL PlaceOrder(?, ?, ?, ?, ?)`,
      [userid, cartId, DeliveryType, PaymentMethod, AddressID]
    );

    // Extract the message from the result
    const message = result[0][0].message;

    if (message.includes('Error')) {
      return { error: message, status: 500 };
    } else {
      return { success: message, status: 200 };
    }
  } catch (error) {
    console.log('Error placing order:', error);
    return { error: 'Failed to place order', status: 500 };
  }
}