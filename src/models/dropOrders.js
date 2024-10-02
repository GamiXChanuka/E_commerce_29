import pool from '../lib/dbConfig';

export async function dropOrder(orderId) {
    try {
      console.log("Using connection pool");
  
      await pool.execute(
        `DELETE FROM \`Order\` WHERE OrderID = ? `,
        [`${orderId}`]
      );

        console.log(`Order with OrderID ${orderId} has been deleted`);
    } catch (error) {
      throw new Error(error.message);
    }
  }