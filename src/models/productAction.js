import pool from '../lib/dbConfig';

export async function getProducts(category) {
    try {
      console.log("Using connection pool");
  
      const [rows] = await pool.execute(
                `WITH RECURSIVE CategoryTree AS (
          SELECT CategoryID
          FROM category
          WHERE categoryName LIKE ?
          UNION ALL
          SELECT c.categoryID
          FROM category c
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
            product p
            JOIN productcategory pc ON p.ProductID = pc.ProductID
            JOIN category c ON pc.CategoryID = c.CategoryID
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

      return rows;
    } catch (error) {
      throw new Error(error.message);
    }
  }