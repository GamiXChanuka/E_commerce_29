import pool from '../lib/dbConfig';

export async function getOrders(userId) {
   
      console.log("Using connection pool");

      try {

        const [rows] = await pool.execute(`
              SELECT * FROM \`Order\` where UserID= ? ;`, [`${userId}`]);
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