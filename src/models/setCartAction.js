
import pool from '../lib/dbConfig';

export async function setCart(op, VariantID, cartId) {
  console.log("Using connection pool");
  console.log(op, VariantID, cartId);

  try {
    if (op === "add") {
      // Fetch the variant (product) from the database using VariantID
      const [rows] = await pool.execute(`
        SELECT * FROM Variant WHERE VariantID = ?
      `, [VariantID]);
      console.log("rows ", rows);

      // Check if the variant exists
      if (rows.length === 0) {
        return { error: 'Product variant not found', status: 404 };
      }

      const [rows2] = await pool.execute(`
        SELECT * FROM CartItem WHERE VariantID = ? and CartID = ?
      `, [VariantID, cartId]);
      console.log("rows2 ", rows2);

      // If the product variant is not already in the cart, add it
      if (rows2.length === 0) {
        const product = rows[0];  // Get product details from the query

        // Insert the product variant into the CartItem table
        const query = 'INSERT INTO CartItem (VariantID, CartID, Quantity) VALUES (?, ?, ?)';
        await pool.execute(query, [
          product.VariantID,
          cartId,
          1, // Start with quantity 1
        ]);
        console.log(`Added to cart: ${product.VariantID}`);
        return { success: true, status: 200 };

      } else {
        // If the product variant is already in the cart, update the quantity
        const query = 'UPDATE CartItem SET Quantity = Quantity + 1 WHERE VariantID = ? and CartID = ?';
        await pool.execute(query, [VariantID, cartId]);
        return { success: true, status: 200 };
      }

    } else if (op === "remove") {
      // Remove the product variant from the cart
      const [rows2] = await pool.execute(`
        SELECT * FROM CartItem WHERE VariantID = ? and CartID = ?
      `, [VariantID, cartId]);

      if (rows2[0].Quantity > 1) {
        const query = 'UPDATE CartItem SET Quantity = Quantity - 1 WHERE VariantID = ? and CartID = ?';
        await pool.execute(query, [VariantID, cartId]);
      } else {
        await pool.execute(`
          DELETE FROM CartItem WHERE VariantID = ? and CartID = ?
        `, [VariantID, cartId]);
      }
      return { success: true, status: 200 }; // Return a response after successful removal
    }
  } catch (error) {
    console.error('Error in cart operation:', error);
    return { error: 'Failed to perform cart operation', status: 500 };
  }
}