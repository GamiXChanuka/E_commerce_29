import pool from '../lib/dbConfig';

export async function unRegSetCart(VariantID, cartId, quantity) {
  console.log("Using connection pool");
  console.log(VariantID, cartId, quantity);

  try {
    // Call the stored procedure
    const [result] = await pool.execute(`CALL UnRegSetCart(?, ?, ?)`, [VariantID, cartId, quantity]);

    // Extract the message from the result
    const message = result[0][0].message;

    if (message.includes('Error')) {
      return { error: message, status: 500 };
    } else {
      return { success: message, status: 200 };
    }
  } catch (error) {
    console.error('Error in cart operation:', error);
    return { error: 'Failed to perform cart operation', status: 500 };
  }
}