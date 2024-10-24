"use client";
import { useEffect, useState } from "react";
import axios from "axios";
import { useRouter } from "next/navigation";

interface CartItemData {
  VariantID: number;
  VariantName: string;
  Price: number;
  Quantity: number;
  ImageLink: string;
}


export default function CartPage() {
  const router = useRouter();
  const [data, setData] = useState<CartItemData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedCity, setSelectedCity] = useState<string>("");


  var isRegistered = true; // Set this based on your auth logic

  const fetchData = async () => {
    try {
      if (isRegistered) {
        // For registered users, fetch cart data from backend using token
        const response = await axios.get("/api/cart");

        const result = response.data;
        console.log("Cart data:", result);
        setData(result);
      } else {
        // For unregistered users, fetch cart from localStorage
        const cart = JSON.parse(localStorage.getItem("internalCart") || "[]");
        const updatedCart = [];

        for (const item of cart) {
          const response = await axios.post("/api/UnRegCart", {
            VariantID: item.VariantID,
          });

          const variantDetailsArray = response.data;
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
        setData(updatedCart); // Update state with cart items for unregistered users
      }
    } catch (err) {
      console.error("Error fetching data:", err);
      setError(err instanceof Error ? err.message : "An error occurred");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    console.log("xxxxxxxx");
    fetchData();
  }, []);

  const removeFromCart = async (id: number) => {
    try {
      if (isRegistered) {
        const response = await axios.post("/api/setCart", {
          op: "remove",
          VariantID: id,
        });

        console.log(`Removed item with id: ${id}`);
        fetchData();
      } else {
        // Handle unregistered users' cart
        const cart = JSON.parse(localStorage.getItem("internalCart") || "[]");

        const itemIndex = cart.findIndex((item: any) => item.VariantID === id);

        if (itemIndex !== -1) {
          cart[itemIndex].quantity -= 1;
          if (cart[itemIndex].quantity === 0) {
            cart.splice(itemIndex, 1);
          }
        }

        localStorage.setItem("internalCart", JSON.stringify(cart));
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
        const response = await axios.post("/api/setCart", {
          op: "add",
          VariantID: id,
        });

        console.log(`Added to cart: ${id}`);
        fetchData();
      } else {
        // Handle unregistered users' cart
        const cart = JSON.parse(localStorage.getItem("internalCart") || "[]");

        const itemIndex = cart.findIndex((item: any) => item.VariantID === id);

        if (itemIndex !== -1) {
          cart[itemIndex].quantity += 1;
        } else {
          cart.push({ VariantID: id, quantity: 1 });
        }

        localStorage.setItem("internalCart", JSON.stringify(cart));
        console.log(`Added to internal cart: ${id}`);
        fetchData();
      }
    } catch (error) {
      console.error("Error adding to cart:", error);
    }
  };

  //onclick remove all items from cart
  const removeAll = async () => {
    try {
      if (isRegistered) {
        const response = await axios.post("/api/setCart", {
          op: "removeAll",
        });

        console.log("Removed all items from cart");
        fetchData();
      } else {
        // Handle unregistered users' cart
        localStorage.removeItem("internalCart");
        console.log("Removed all items from internal cart");
        fetchData();
      }
    } catch (error) {
      console.error("Error removing all items from cart:", error);
    }
  };

  

  const placeOrder = async () => {
    try {
      router.push("/checkoutPage");
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
    <>

    <div className="flex flex-col items-center py-4 bg-white border-b sm:flex-row sm:px-10 lg:px-20 xl:px-32">
    <a href="#" className="text-2xl font-bold text-gray-900">Checkout Page</a>


    <div className="py-2 mt-4 text-xs sm:mt-0 sm:ml-auto sm:text-base">
      <div className="relative">
        <ul className="relative flex items-center justify-between w-full space-x-2 sm:space-x-4">
          <li className="flex items-center space-x-3 text-left sm:space-x-4">
            <a
              className="flex items-center justify-center w-6 h-6 text-xs font-semibold text-white bg-yellow-400 rounded-full ring ring-gray-600 ring-offset-2"
              href="#"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-4 h-4"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M5 13l4 4L19 7"
                />
              </svg>
            </a>
            <span className="font-semibold text-gray-900">Cart</span>
          </li>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="w-4 h-4 text-gray-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M9 5l7 7-7 7"
            />
          </svg>
          <li className="flex items-center space-x-3 text-left sm:space-x-4">
            <a
              className="flex items-center justify-center w-6 h-6 text-xs font-semibold text-white bg-gray-400 rounded-full"
              href="#"
            >
              2
            </a>
            <span className="font-semibold text-gray-900">Checkout</span>
          </li>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="w-4 h-4 text-gray-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M9 5l7 7-7 7"
            />
          </svg>
          <li className="flex items-center space-x-3 text-left sm:space-x-4">
            <a
              className="flex items-center justify-center w-6 h-6 text-xs font-semibold text-white bg-gray-400 rounded-full"
              href="#"
            >
              3
            </a>
            <span className="font-semibold text-gray-500">Proccessed</span>
          </li>
        </ul>
      </div>
    </div>


  </div>

    <div className="flex flex-col min-h-screen md:flex-row">
      <div className="w-full p-8 md:w-2/3">
        <h2 className="mb-4 text-3xl font-bold text-black">Shopping Cart</h2>
        <h3 className="text-lg text-gray-700">{data.length} items</h3>
        <div className="p-4 mt-4 bg-white rounded-lg shadow-md">
          {data.length > 0 ? (
            data.map((item) => (
              <div
                key={item.VariantID}
                className="flex items-center justify-between px-4 py-2 mb-2 bg-white border border-black rounded-lg shadow-xl"
              >
                <div className="flex items-center w-1/3">
                  <img
                    src={item.ImageLink}
                    alt={item.VariantName}
                    className="object-cover w-16 h-16 mr-4 rounded-lg"
                  />
                  <h4 className="font-semibold text-black">{item.VariantName}</h4>
                </div>
                <div className="flex items-center justify-center w-1/3">
                  <button
                    className="px-2 bg-[#004581] text-white rounded-lg hover:bg-[#018ABD]"
                    onClick={() => removeFromCart(item.VariantID)}
                  >
                    -
                  </button>
                  <input
                    type="number"
                    value={item.Quantity}
                    className="w-12 text-center bg-[#004581] text-white border border-gray-300 rounded-lg mx-2"
                    readOnly
                  />
                  <button
                    className="px-2 bg-[#004581] text-white rounded-lg hover:bg-[#018ABD]"
                    onClick={() => addToCart(item.VariantID)}
                  >
                    +
                  </button>
                </div>
                <div className="flex items-center justify-end w-1/3">
                    <span className="font-bold text-black">
                    Rs {(item.Price * item.Quantity).toFixed(2)}
                    </span>
                    <button
                    className="px-5 py-2 m-3 text-red-600 transition duration-300 border border-red-600 rounded-full shadow-md hover:bg-red-100"
                    onClick={() => removeFromCart(item.VariantID)}
                    >
                    X
                    </button>
                </div>
              </div>
            ))
          ) : (
            <p className="text-gray-700">Your cart is empty</p>
          )}
          <div className="flex justify-between mt-4">
            <button
              className="px-6 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD] transition duration=300 shadow-md"
              onClick={() => (window.location.href = "/shop")}
            >
              Back to shop
            </button>
            <button
              className="px-6 py-2 text-red-600 transition duration-300 border border-red-600 rounded-md shadow-md hover:bg-red-100"
              onClick={() => {
                setData([]);
                removeAll();
              }}
            >
              Remove all
            </button>
          </div>
        </div>
        {/* ------------------------------------------------------------------------------- */}
      </div>


      <div className="w-full p-8 bg-white shadow-2xl md:w-1/3">
        <h2 className="mb-4 text-2xl font-bold text-black">Summary</h2>
        <div className="flex justify-between mb-2 text-black">
          <span>ITEMS</span>
          <span>
            Rs{" "}
            {data
              .reduce((total, item) => total + item.Price * item.Quantity, 0)
              .toFixed(2)}
          </span>
        </div>
        <div className="flex justify-between mb-4 text-black">
          <span>SHIPPING (Standard Delivery) </span>
          <span>Rs 225.00</span>
        </div>
        <div className="flex justify-between font-bold text-black">
          <span>TOTAL PRICE</span>
          <span>
            Rs{" "}
            {(
              data.reduce(
                (total, item) => total + item.Price * item.Quantity,
                0
              ) + 225.0
            ).toFixed(2)}
          </span>
        </div>


        <button
          className="bg-[#004581] text-white p-2 rounded-lg w-full mt-4 hover:bg-[#018ABD]"
          onClick={placeOrder}
        >
          Place Order
        </button>
      </div>
    </div>
    </>
  );
}