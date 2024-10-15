import pool from '../lib/dbConfig';

export async function getProductVariants(ProductID) {
   
      console.log("Using connection pool");
      console.log("ProductID",ProductID);

      try {

        const [rows] = await pool.execute(`
            select * from variant left outer join product on variant.ProductID = product.ProductID
             left outer join image on variant.VariantID=image.VariantID
             where product.ProductID = ?; `, [`${ProductID}`]);
            console.log("variant details ",rows);
    
        return rows;
      } catch (error) {
        return new Response(JSON.stringify({ error: error.message }), {
          status: 500,
          headers: {
            'Content-Type': 'application/json',
          },
        });
      } finally {
        // await pool.end();
      }

}