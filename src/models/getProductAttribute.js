import pool from '../lib/dbConfig';

export async function getProductAttribute(VariantID) {
   
      console.log("Using connection pool");

      try {

        const [rows] = await pool.execute(`
              select pa.VariantID,pa.AttributeValue,a.AttributeName from
              productattribute pa left outer join attributes a 
              on pa.AttributeID=a.AttributeID where pa.VariantID=?; `, [`${VariantID}`]);
         console.log(rows);
    
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