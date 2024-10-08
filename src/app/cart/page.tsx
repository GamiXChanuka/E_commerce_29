"use client";
import { useEffect, useState } from "react";

interface CartItemData {
  VariantID: number;
  VariantName: string;
  Price: number;
  Quantity: number;
  ImageLink: string;
}

export default function CartPage() {
  const [data, setData] = useState<CartItemData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const cartId = 1; // Set your cart ID here

  var isRegistered = false;

  // Fetch cart data
  // const fetchData = async () => {
  //   try {
  //     if(isRegistered){

  //     const response = await fetch("/api/cart", {
  //       method: "POST",
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: JSON.stringify({ id: cartId }),
  //     });

  //     if (!response.ok) {
  //       throw new Error(`HTTP error! Status: ${response.status}`);
  //     }
  //     const result = await response.json();
  //     console.log("Cart data:", result);
  //     setData(result);}
  //     else{
  //       const cart = JSON.parse(localStorage.getItem('internalCart') || '[]');
  //       for (const item of cart) {
  //         const response = await fetch("/api/UnRegCart", {
  //           method: "POST",
  //           headers: {
  //             "Content-Type": "application/json",
  //           },
  //           body: JSON.stringify({ VariantID: item.VariantID }),
  //         });
    
  //         if (!response.ok) {
  //           throw new Error(`HTTP error! Status: ${response.status}`);
  //         }
    
  //         const result = await response.json();
  //         console.log("Cart data:", result);
  //       setData(cart);
  //     }
  //   } catch (err) {
  //     console.error("Error fetching data:", err);
  //     setError(err instanceof Error ? err.message : "An error occurred");
  //   } finally {
  //     setLoading(false);
  //   }
  // };
  const fetchData = async () => {
    try {
      if (isRegistered) {
        const response = await fetch("/api/cart", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ id: cartId }),
        });
  
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const result = await response.json();
        console.log("Cart data:", result);
        setData(result);
      } else {
        const cart = JSON.parse(localStorage.getItem('internalCart') || '[]');
        const updatedCart = [];
  
        for (const item of cart) {
          const response = await fetch("/api/UnRegCart", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ VariantID: item.VariantID }),
          });
  
          console.log("Response: = ", item);
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
  
          const variantDetailsArray = await response.json();
        const variantDetails = variantDetailsArray[0]; // Assuming the response is an array with one object

        updatedCart.push({
          VariantID: variantDetails.VariantID,
          VariantName: variantDetails.VariantName,
          Price: variantDetails.Price,
          Quantity: item.quantity,
          ImageLink: variantDetails.ImageLink,
        });
        }
  
        console.log("Cart data:=", updatedCart);
        setData(updatedCart);
      }
    } catch (err) {
      console.error("Error fetching data:", err);
      setError(err instanceof Error ? err.message : "An error occurred");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);



  const removeFromCart = async (id: number) => {
    try {
      if (isRegistered) {
        const response = await fetch("/api/setCart", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ op: "remove", VariantID: id, cartId }),
        });
  
        if (!response.ok) {
          throw new Error("Failed to remove product from cart");
        }
  
        console.log(`Removed item with id: ${id}`);
        fetchData();
      } else {
        // Retrieve the current cart from localStorage
        const cart = JSON.parse(localStorage.getItem('internalCart') || '[]');
  
        // Find the item in the cart
        const itemIndex = cart.findIndex((item: any) => item.VariantID === id);
  
        if (itemIndex !== -1) {
          // If the item exists, decrease the quantity
          cart[itemIndex].quantity -= 1;
  
          // If the quantity becomes 0, remove the item from the cart
          if (cart[itemIndex].quantity === 0) {
            cart.splice(itemIndex, 1);
          }
        }
  
        // Save the updated cart back to localStorage
        localStorage.setItem('internalCart', JSON.stringify(cart));
  
        console.log(`Removed item with id: ${id} from internal cart`);
        fetchData();
      }
    } catch (error) {
      console.error("Error removing from cart:", error);
    }
  };

  const addToCart = async (id: number) => {
    try {
      if (isRegistered) {
        const response = await fetch("/api/setCart", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ op: "add", VariantID: id, cartId }),
        });
  
        if (!response.ok) {
          throw new Error("Failed to add product to cart");
        }
  
        console.log(`Added to cart: ${id}`);
        fetchData();
      } else {
        // Retrieve the current cart from localStorage
        const cart = JSON.parse(localStorage.getItem('internalCart') || '[]');
  
        // Find the item in the cart
        const itemIndex = cart.findIndex((item: any) => item.VariantID === id);
  
        if (itemIndex !== -1) {
          // If the item exists, increase the quantity
          cart[itemIndex].quantity += 1;
        } else {
          // If the item does not exist, add it with quantity 1
          cart.push({ VariantID: id, quantity: 1 });
          
        }
  
        // Save the updated cart back to localStorage
        localStorage.setItem('internalCart', JSON.stringify(cart));
  
        console.log(`Added to internal cart: ${id}`);
        fetchData();
      }
    } catch (error) {
      console.error("Error adding to cart:", error);
    }
  };

  const placeOrder = async () => {
    const userid = 1; // Replace with actual user ID
    const DeliveryType = "delivery"; // Set your delivery type
    const PaymentMethod = "card"; // Set your payment method
    const AddressID = 1; // Replace with the actual Address ID

    try {
      const response = await fetch("/api/placeOrder", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
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
        throw new Error("Failed to place order");
      }

      const result = await response.json();
      console.log("Order placed successfully:", result);
    } catch (error) {
      console.error("Error placing the order:", error);
    }
  };

  if (loading) {
    return <p>Loading data...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div className="flex flex-col md:flex-row bg-[#1f2021] min-h-screen">
      <div className="w-full md:w-2/3 p-8">
        <h2 className="text-3xl font-bold mb-4 text-white">Shopping Cart</h2>
        <h3 className="text-lg text-gray-400">{data.length} items</h3>
        <div className="bg-[#2c2f32] shadow-md rounded-lg p-4 mt-4">
          {data.length > 0 ? (
            data.map((item) => (
              <div
                key={item.VariantID}
                className="flex items-center justify-between border border-gray-600 py-2 px-4 mb-2 rounded-lg bg-white"
              >
                <div className="flex items-center w-1/3">
                  <img
                    src={item.ImageLink}
                    alt={item.VariantName}
                    className="w-16 h-16 object-cover mr-4"
                  />
                  <h4 className="font-semibold text-black">{item.VariantName}</h4>
                </div>
                <div className="flex items-center w-1/3 justify-center">
                  <button
                    className="px-2 bg-[#3c4144] text-white rounded-lg hover:bg-[#4d5255]"
                    onClick={() => removeFromCart(item.VariantID)}
                  >
                    -
                  </button>
                  <input
                    type="number"
                    value={item.Quantity}
                    className="w-12 text-center bg-[#3c4144] text-white border border-gray-600 rounded-lg mx-2"
                    readOnly
                  />
                  <button
                    className="px-2 bg-[#3c4144] text-white rounded-lg hover:bg-[#4d5255]"
                    onClick={() => addToCart(item.VariantID)}
                  >
                    +
                  </button>
                </div>
                <div className="flex items-center w-1/3 justify-end">
                  <span className="font-bold text-black">
                    € {item.Price * item.Quantity}
                  </span>
                  <button
                    className="ml-4 text-red-500 hover:text-red-400"
                    onClick={() => removeFromCart(item.VariantID)}
                  >
                    X
                  </button>
                </div>
              </div>
            ))
          ) : (
            <p className="text-gray-400">Your cart is empty</p>
          )}
          <div className="flex justify-between mt-4">
            <button
              className="text-blue-400 hover:text-blue-300"
              onClick={() => (window.location.href = "/shop")}
            >
              Back to shop
            </button>
            <button
              className="text-red-400 hover:text-red-300"
              onClick={() => setData([])}
            >
              Remove all
            </button>
          </div>
        </div>
      </div>

      <div className="w-full md:w-1/3 bg-[#2c2f32] p-8 rounded-lg shadow-md">
        <h2 className="text-2xl font-bold mb-4 text-white">Summary</h2>
        <div className="flex justify-between mb-2 text-white">
          <span>ITEMS</span>
          <span>
            €{" "}
            {data.reduce(
              (total, item) => total + item.Price * item.Quantity,
              0
            )}
          </span>
        </div>
        <div className="flex justify-between mb-4 text-white">
          <span>SHIPPING</span>
          <span>Standard Delivery - € 5.00</span>
        </div>
        <div className="flex justify-between font-bold text-white">
          <span>TOTAL PRICE</span>
          <span>
            €{" "}
            {data.reduce(
              (total, item) => total + item.Price * item.Quantity,
              0
            ) + 5.0}
          </span>
        </div>
        <button
          className="bg-green-500 text-white p-2 rounded-lg w-full mt-4 hover:bg-green-400"
          onClick={placeOrder}
        >
          Place Order
        </button>
      </div>
    </div>
  );
}
