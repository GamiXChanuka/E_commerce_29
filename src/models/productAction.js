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
              p.ProductCategoryID, 
              p.ProductID, 
              p.Title, 
              p.CategoryID, 
              c.CategoryName,
              i.ImageLink AS category_name,
              
              ROW_NUMBER() OVER (PARTITION BY p.ProductCategoryID ORDER BY p.ProductID) AS row_num
            FROM 
              Product p
              JOIN Category c ON p.CategoryID = c.CategoryID
              JOIN variant v ON p.ProductCategoryID = v.ProductCategoryID
              JOIN image i ON v.VariantID = i.VariantID
            WHERE 
              p.CategoryID IN (SELECT CategoryID FROM CategoryTree)
          )
              SELECT 
                ProductCategoryID, 
                ProductID, 
                Title, 
                CategoryID, 
                CategoryName, 
                category_name,
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