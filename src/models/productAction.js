import pool from '../lib/dbConfig';

export async function getProducts(category) {
    try {
      console.log("Using connection pool");
  
      const [rows] = await pool.execute(
                `WITH RECURSIVE CategoryTree AS (
          SELECT CategoryID
          FROM Category
          WHERE CategoryName LIKE ?
          UNION ALL
          SELECT c.CategoryID
          FROM Category c
          INNER JOIN CategoryTree ct ON c.ParentCategoryID = ct.CategoryID
        ),
        RankedProducts AS (
          SELECT 
            v.VariantID,
            v.Price,
            p.ProductID, 
            p.Title, 
            pc.CategoryID, 
            c.CategoryName,
            i.ImageLink as image_link,
            ROW_NUMBER() OVER (PARTITION BY p.ProductID ORDER BY p.ProductID) AS row_num
          FROM 
            Product p
            JOIN productCategory pc ON p.ProductID = pc.ProductID
            JOIN Category c ON pc.CategoryID = c.CategoryID
            JOIN variant v ON p.ProductID = v.ProductID
            JOIN image i ON v.VariantID = i.VariantID
          WHERE 
            pc.CategoryID IN (SELECT CategoryID FROM CategoryTree)
        )
        SELECT 
          ProductID, 
          Title, 
          CategoryID, 
          CategoryName, 
          image_link,
          VariantID,
          Price
        FROM 
          RankedProducts
        WHERE 
          row_num = 1;`,
          [`%${category}%`]
        );

      console.log("products -",rows);
      return rows;
    } catch (error) {
      throw new Error(error.message);
    }
  }