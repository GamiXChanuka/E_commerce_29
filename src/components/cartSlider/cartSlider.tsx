import React, { useState, useEffect } from "react";
import axios from "axios";
import { useRouter } from "next/navigation";

interface CartItemData {
  VariantID: number;
  VariantName: string;
  Price: number;
  Quantity: number;
  ImageLink: string;
}

export default function CartSlider() {
  const [cartItems, setCartItems] = useState<CartItemData[]>([]);
  const [isOpen, setIsOpen] = useState(false); // To control the slider visibility
  const router = useRouter();

  // Fetch cart data from the API
  const fetchCartData = async () => {
    try {
      const response = await axios.get("/api/cart");
      setCartItems(response.data);
    } catch (error) {
      console.error("Error fetching cart data:", error);
    }
  };

  useEffect(() => {
    fetchCartData();
  }, []);

  // Function to add item to cart
  const addToCart = (variantId: number) => {
    setCartItems((prevItems) =>
      prevItems.map((item) =>
        item.VariantID === variantId
          ? { ...item, Quantity: item.Quantity + 1 }
          : item
      )
    );
  };

  // Function to toggle the cart slider
  const toggleCart = () => {
    setIsOpen(!isOpen);
  };

  // Function to visit cart page
  const visitCart = () => {
    router.push("/cart");
  };

  return (
    <>
      {/* Cart icon */}
      <div
        onClick={toggleCart}
        role="button"
        className="ml-4 mr-2 btn btn-ghost btn-circle"
      >
        <div className="indicator">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-7 w-7 text-gray-800"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
            />
          </svg>
          <span className="badge badge-sm indicator-item bg-red-500 text-white">
            {cartItems.length}
          </span>
        </div>
      </div>

      {/* Cart slider */}
      <div
        className={`w-96 fixed top-0 right-0 bg-white shadow-lg h-full z-50 transform transition-transform duration-300 ${
          isOpen ? "translate-x-0" : "translate-x-full"
        }`}
      >
        <div className="p-4">
          <button
            type="button"
            className="px-6 py-2 border border-red-600 text-red-600 rounded-md hover:bg-red-100 transition duration-300 shadow-md mb-5"
            onClick={toggleCart}
          >
            Cancel
          </button>
          <h2 className="text-2xl font-semibold mb-4 text-black">Your Cart</h2>
          {cartItems.length > 0 ? (
            <>
              <div className="flex justify-between items-center mb-4">
                <span className="text-lg font-bold text-black">
                  {cartItems.length} Items
                </span>
                <span className="text-gray-700">
                  Subtotal: €{" "}
                  {cartItems
                    .reduce(
                      (total, item) => total + item.Price * item.Quantity,
                      0
                    )
                    .toFixed(2)}
                </span>
              </div>
              {cartItems.map((item) => (
                <div
                  key={item.VariantID}
                  className="flex justify-between items-center py-2 border-b"
                >
                  <div className="flex items-center space-x-4">
                    <img
                      src={item.ImageLink}
                      alt={item.VariantName}
                      className="w-12 h-12 object-cover rounded-lg"
                    />
                    <div className="flex flex-col">
                      <p className="font-medium text-black">
                        {item.VariantName}
                      </p>
                      <p className="text-gray-500">€{item.Price}</p>
                    </div>
                  </div>
                  <span className="text-black">{item.Quantity}</span>
                </div>
              ))}
              <button
                className="btn btn-primary w-full mt-3 bg-[#004581] hover:bg-[#018ABD] text-white font-semibold py-2 rounded-lg transition"
                onClick={visitCart}
              >
                View Cart
              </button>
            </>
          ) : (
            <p className="mt-4 text-gray-500">Your cart is empty</p>
          )}
        </div>
      </div>

      {/* Overlay to close cart when clicking outside */}
      {isOpen && (
        <div
          onClick={toggleCart}
          className="fixed inset-0 bg-black opacity-50 z-40"
        />
      )}
    </>
  );
}
