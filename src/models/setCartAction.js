import pool from '../lib/dbConfig';

export async function setCart(op, VariantID, cartId) {
  console.log("Using connection pool");

  try {
    let result;
    if (op === "add") {
      // Call the stored procedure for adding to cart
      [result] = await pool.execute(`CALL AddToCart(?, ?)`, [VariantID, cartId]);
    } else if (op === "remove") {
      // Call the stored procedure for removing from cart
      [result] = await pool.execute(`CALL RemoveFromCart(?, ?)`, [VariantID, cartId]);
    } else if (op === "removeAll") {
      // Call the stored procedure for removing all from cart
      [result] = await pool.execute(`CALL RemoveAllFromCart(?)`, [cartId]);
    }

    // Extract the message from the result
    const message = result[0][0].message;
    console.log(message);
    if (message.includes('Error')) {
      return { error: message, status: 500 };
    } else {
      return { success: message, status: 200 };
    }
  } catch (error) {
    console.log('Error in cart operation:', error);
    return { error: 'Failed to perform cart operation', status: 500 };
  }
}