import pool from '../lib/dbConfig';

export async function getCart(id) {
    try {
      console.log("Using connection pool");
  
      const [rows] = await pool.execute(
        `SELECT ci.*, p.Title, v.Price ,i.ImageLink
      FROM CartItem ci
      JOIN Variant v ON ci.VariantID = v.VariantID
      JOIN Product p ON v.ProductID = p.ProductID
      join image i on i.VariantID= v.VariantID
      WHERE ci.CartID = ? ;`,
        [`${id}`]
      );

      console.log(rows);
      return rows;
    } catch (error) {
      throw new Error(error.message);
    }
  }