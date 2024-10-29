import pool from '../lib/dbConfig';

export async function getOrders(userId) {
    console.log("Using connection pool");

    try {
        // Call the stored procedure
        const [rows] = await pool.execute(`CALL GetOrders(?)`, [userId]);

        // Check if the result contains an error message
        const message = rows[0][0]?.message;
        if (message && message.includes('Error')) {
            throw new Error(message);
        }

        return rows[0];
    } catch (error) {
        console.log('Error fetching orders:', error);
        throw new Error('Failed to fetch orders');
    }
}

export async function getOrderDetails(orderId) {
  const query = `CALL GetOrderDetails(?)`;
  const [orderDetails] = await pool.execute(query, [orderId]);

  if (orderDetails[0].length === 0) {
    throw new Error("Order not found");
  }

  const items = orderDetails[0].map((item) => ({
    VariantName: item.VariantName,
    Price: item.Price,
    Quantity: item.Quantity,
    ImageLink: item.ImageLink,
  }));

  return {
    OrderDate: orderDetails[0][0].OrderDate,
    DeliveryType: orderDetails[0][0].DeliveryType,
    PaymentMethod: orderDetails[0][0].PaymentMethod,
    OrderTotal: orderDetails[0][0].OrderTotal,
    items,
  };
}