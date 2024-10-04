
import pool from '../lib/dbConfig';

export async function placeOrder(userid, cartId, DeliveryType, PaymentMethod, AddressID) {
  console.log("Using connection pool");
  console.log(userid, cartId, DeliveryType, PaymentMethod, AddressID);
  let connection;

  try {
    // Get a connection from the pool
    connection = await pool.getConnection();

    // Fetch cart items
    const [cartItems] = await connection.query(`
      SELECT ci.Quantity, v.ProductID, v.Price, v.VariantID
      FROM CartItem ci
      JOIN Variant v ON ci.VariantID = v.VariantID
      JOIN Cart c ON ci.CartID = c.CartID
      WHERE c.UserID = ?
    `, [userid]);
    console.log('Cart items:', cartItems); // Debugging log

    // Ensure cartItems is not empty or undefined
    if (!cartItems || cartItems.length === 0) {
      throw new Error('Cart is empty, cannot proceed with order.');
    }

    // Calculate total price of the cart
    const totalPrice = cartItems.reduce((sum, item) => sum + parseFloat(item.Price) * item.Quantity, 0);
    console.log('Total price of the cart is:', totalPrice);

    // Ensure totalPrice is not undefined or zero
    if (totalPrice === 0) {
      throw new Error('Total price is zero, cannot proceed with order.');
    }

    // Start a transaction
    await connection.beginTransaction();

    // Insert into Orders table
    const insertOrderQuery = `
      INSERT INTO \`Order\` (UserID, OrderDate, DeliveryType, PaymentMethod, OrderTotal, AddressID)
      VALUES (?, CURRENT_DATE, ?, ?, ?, ?)
    `;
    const [orderResult] = await connection.query(insertOrderQuery, [userid, DeliveryType, PaymentMethod, totalPrice, AddressID]);

    const orderID = orderResult.insertId; // Get the inserted OrderID

    // Insert into OrderItem table for each cart item
    for (const item of cartItems) {
      console.log('Inserting order item:', item); // Debugging log
      await connection.query(
        'INSERT INTO OrderItem (OrderID, VariantID, Quantity) VALUES (?, ?, ?)',
        [orderID, item.VariantID, item.Quantity]
      );
    }

    // Empty the cart table
    await connection.query('DELETE FROM CartItem WHERE CartID = ?', [cartId]);

    // Commit the transaction
    await connection.commit();
    console.log('Transaction committed successfully.');

    // Send success response
    return new Response(JSON.stringify({ message: 'Order placed successfully!' }), {
      status: 200,
    });

  } catch (error) {
    // Rollback the transaction in case of error
    if (connection) await connection.rollback();
    console.error('Transaction failed, rolled back.', error);

    // Send error response
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
    });

  } finally {
    // Release the connection back to the pool
    if (connection) connection.release();
  }
}