
import pool from '../lib/dbConfig';

export async function unRegSetCart( VariantID, cartId ,quantity) {
  console.log("Using connection pool");
  console.log( VariantID, cartId,quantity);

  try {
    
      // Remove the product variant from the cart
     await pool.execute(`
        insert into CartItem values(?, ?, ?)
      `, [VariantID, cartId,quantity]);
      return { success: true, status: 200 }; // Return a response after successful removal
    
  } catch (error) {
    console.error('Error in cart operation:', error);
    return { error: 'Failed to perform cart operation', status: 500 };
  }
}