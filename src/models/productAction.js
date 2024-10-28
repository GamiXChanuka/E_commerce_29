import pool from '../lib/dbConfig';

export async function getProducts(category) {
    try {
      console.log("Using connection pool");
  
      const [rows] = await pool.execute(
                `call ecommerce4.GetProductVariantsByCategory(?);`,
          [`${category}`]
        );
        console.log(rows);
      return rows[0];
    } catch (error) {
      throw new Error(error.message);
    }
  }