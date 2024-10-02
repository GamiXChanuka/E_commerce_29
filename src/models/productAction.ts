import pool from "@/lib/dbConfig";

export async function getAllProducts() {
  const query = `
    SELECT p.ProductID, p.Title, p.CategoryID, c.CategoryName as category_name
    FROM Product p
    JOIN Category c ON p.CategoryID = c.CategoryID;
  `;

  const [rows] = await pool.execute(query);
  return rows;
}

export async function getProductsByCategory(category: string) {
  const query = `
    WITH RECURSIVE CategoryTree AS (
      SELECT CategoryID
      FROM Category
      WHERE CategoryName LIKE ?
      UNION ALL
      SELECT c.CategoryID
      FROM Category c
      INNER JOIN CategoryTree ct ON c.ParentCategoryID = ct.CategoryID
    )
    SELECT p.ProductID, p.Title, p.CategoryID, c.CategoryName as category_name
    FROM Product p
    JOIN Category c ON p.CategoryID = c.CategoryID
    WHERE p.CategoryID IN (SELECT CategoryID FROM CategoryTree);
  `;

  const [rows] = await pool.execute(query, [`%${category}%`]);
  return rows;
}
