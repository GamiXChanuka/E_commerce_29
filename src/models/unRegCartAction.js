import pool from '../lib/dbConfig';

export async function getVariant(VariantID) {
    try {
      console.log("Using connection pool");
  
      const [rows] = await pool.execute(
        `select v.VariantID,v.VariantName, v.Price,i.ImageLink
        from Variant v left outer join image i on v.VariantID = i.VariantID
        where v.VariantID= ?;`,
        [`${VariantID}`]
      );

      console.log(rows);
      return rows;
    } catch (error) {
      throw new Error(error.message);
    }
  }