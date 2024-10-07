// "use client";

// import { useEffect, useState } from 'react';
// import CartItem from '../../components/cartItem/cartItem'; // Adjust the path as necessary

// interface CartItemData {
//   VariantID: number;
//   Title: string;
//   Price: number;
//   Quantity: number;
// }

// export default function CartPage() {
//   const [data, setData] = useState<CartItemData[]>([]);
//   const [loading, setLoading] = useState(true);
//   const [error, setError] = useState<string | null>(null);
//   const cartId = 1; // Set your cart ID here

//   // Fetch cart data
//   const fetchData = async () => {
//     try {
//       const response = await fetch('/api/cart', {
//         method: 'POST', // Changed to POST method
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: JSON.stringify({ id: cartId }), // Send cart ID in request body
//       });
      
//       if (!response.ok) {
//         throw new Error(`HTTP error! Status: ${response.status}`);
//       }
//       const result = await response.json();
//       console.log('Cart data:', result);
//       setData(result);
//     } catch (err) {
//       console.error('Error fetching data:', err);
//       setError(err instanceof Error ? err.message : "An error occurred");
//     } finally {
//       setLoading(false);
//     }
//   };

//   useEffect(() => {
//     fetchData();
//   }, []);

//   // Remove item from cart
//   const removeFromCart = async (id: number) => {
//     try {
//       const response = await fetch('/api/setCart', {
//         method: 'POST',
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: JSON.stringify({ op: 'remove', VariantID: id, cartId }), // Send data as JSON
//       });

//       if (!response.ok) {
//         throw new Error('Failed to remove product from cart');
//       }

//       console.log(`Removed item with id: ${id}`);
//       // Refresh cart data after removal
//       fetchData();
//     } catch (error) {
//       console.error('Error removing from cart:', error);
//     }
//   };

//   // Add item to cart
//   const addToCart = async (id: number) => {
//     try {
//       const response = await fetch('/api/setCart', {
//         method: 'POST',
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: JSON.stringify({ op: 'add', VariantID: id, cartId }), // Send data as JSON
//       });

//       if (!response.ok) {
//         throw new Error('Failed to add product to cart');
//       }

//       console.log(`Added to cart: ${id}`);
//       // Refresh cart data after adding
//       fetchData();
//     } catch (error) {
//       console.error('Error adding to cart:', error);
//     }
//   };

//   const placeOrder = async () => {
//     const userid = 1; // Replace with actual user ID (you might fetch this from user context or props)
//     const DeliveryType = "delivery"; // Set your delivery type (you may fetch this from user selection)
//     const PaymentMethod = "card"; // Set your payment method (you may fetch this from user selection)
//     const AddressID = 1; // Replace with the actual Address ID


//     try {
//       const response = await fetch('/api/placeOrder', {
//         method: 'POST',
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: JSON.stringify({
//           userid,
//           cartId,
//           DeliveryType,
//           PaymentMethod,
//           AddressID,
//         }),
//       });
  
//       if (!response.ok) {
//         throw new Error('Failed to place order');
//       }
  
//       const result = await response.json(); // Assuming the response is in JSON
//       console.log('Order placed successfully:', result);
  
//       // Refresh cart or perform other actions after the order is placed
//       // Example: Clear the cart, show confirmation message, etc.
  
//     } catch (error) {
//       console.error('Error placing the order:', error);
//     }
//   };
  

//   if (loading) {
//     return <p>Loading data...</p>;
//   }

//   if (error) {
//     return <p>Error: {error}</p>;
//   }

//   return (
//     <div>
//       <h1>Your Shopping Cart</h1>
//       {data.length > 0 ? (
//         <table border={1} cellPadding={10}>
//           <thead>
//             <tr>
//               <th>Variant ID</th>
//               <th>Product</th>
//               <th>Unit Price</th>
//               <th>Quantity</th>
//               <th>Actions</th>
//             </tr>
//           </thead>
//           <tbody>
//             {data.map((item) => (
//               <CartItem 
//                 key={item.VariantID} 
//                 item={item} 
//                 onRemove={removeFromCart} 
//                 onAdd={addToCart} 
//               />
//             ))}
//           </tbody>
//         </table>
//       ) : (
//         <p>Your cart is empty</p>
//       )}
//       <button onClick={placeOrder}>Place Order</button>
//       <button onClick={() => window.history.back()}>Go Back</button>
//     </div>
//   );
// }
"use client";

import { useEffect, useState } from 'react';
import CartItem from '../../components/cartItem/cartItem'; // Adjust the path as necessary
import styles from './CartPage.module.css'; // Import CSS module

interface CartItemData {
  VariantID: number;
  Title: string;
  Price: number;
  Quantity: number;
}

export default function CartPage() {
  const [data, setData] = useState<CartItemData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const cartId = 1; // Set your cart ID here

  // Fetch cart data
  const fetchData = async () => {
    try {
      const response = await fetch('/api/cart', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: cartId }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      const result = await response.json();
      console.log('Cart data:', result);
      setData(result);
    } catch (err) {
      console.error('Error fetching data:', err);
      setError(err instanceof Error ? err.message : "An error occurred");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // Remove item from cart
  const removeFromCart = async (id: number) => {
    try {
      const response = await fetch('/api/setCart', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ op: 'remove', VariantID: id, cartId }),
      });

      if (!response.ok) {
        throw new Error('Failed to remove product from cart');
      }

      console.log(`Removed item with id: ${id}`);
      fetchData();
    } catch (error) {
      console.error('Error removing from cart:', error);
    }
  };

  // Add item to cart
  const addToCart = async (id: number) => {
    try {
      const response = await fetch('/api/setCart', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ op: 'add', VariantID: id, cartId }),
      });

      if (!response.ok) {
        throw new Error('Failed to add product to cart');
      }

      console.log(`Added to cart: ${id}`);
      fetchData();
    } catch (error) {
      console.error('Error adding to cart:', error);
    }
  };

  const placeOrder = async () => {
    const userid = 1; // Replace with actual user ID
    const DeliveryType = "delivery"; // Set your delivery type
    const PaymentMethod = "card"; // Set your payment method
    const AddressID = 1; // Replace with the actual Address ID

    try {
      const response = await fetch('/api/placeOrder', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          userid,
          cartId,
          DeliveryType,
          PaymentMethod,
          AddressID,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to place order');
      }

      const result = await response.json();
      console.log('Order placed successfully:', result);
    } catch (error) {
      console.error('Error placing the order:', error);
    }
  };

  if (loading) {
    return <p>Loading data...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Your Shopping Cart</h1>
      {data.length > 0 ? (
        <div className={styles.cardContainer}>
          {data.map((item) => (
            <CartItem 
              key={item.VariantID} 
              item={item} 
              onRemove={removeFromCart} 
              onAdd={addToCart} 
            />
          ))}
        </div>
      ) : (
        <p className={styles.emptycart}>Your cart is empty</p>
      )}
      <button className={`${styles.button} ${styles.placeorder}`} onClick={placeOrder}>Place Order</button>
      <button className={`${styles.button} ${styles.goback}`} onClick={() => window.history.back()}>Go Back</button>
    </div>
  );
}
