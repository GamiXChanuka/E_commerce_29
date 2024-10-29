"use client";
import router, { useRouter } from "next/navigation";
import React, { useState, useEffect } from "react";
import axios from "axios";

interface CartItemData {
  VariantID: string;
  VariantName: string;
  Price: number;
  Quantity: number;
  ImageLink: string;
}

const CheckoutPage = () => {
  const router = useRouter();
  const [data, setData] = useState<CartItemData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedCity, setSelectedCity] = useState<string>("");

  // Set COD as the default payment method
  const [paymentMethod, setPaymentMethod] = useState("COD");
  const [deliveryMethod, setDeliveryMethod] = useState("delivery");

  // State variables for user inputs
  const [FirstName, setFirstName] = useState("");
  const [LastName, setLastName] = useState("");
  const [PhoneNumber, setPhoneNumber] = useState("");
  const [AddressNumber, setAddressNumber] = useState("");
  const [Lane, setLane] = useState("");
  const [City, setCity] = useState("");
  const [PostalCode, setPostalCode] = useState("");
  const [District, setDistrict] = useState("");

  const [userId, setUserId] = useState<number>(0);
  const [cartId, setCartId] = useState<number>(0);
  const [addressId, setAddressId] = useState<number>(0);

  const [isRegistered, setIsRegistered] = useState<string>("true"); // Set this based on your auth logic

  const fetchData = async () => {
    try {
      if (isRegistered === "true") {
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
    console.log(paymentMethod);
    fetchData();
  }, []);

  const handlePlaceOrder = async () => {
    console.log("yydadyyy");
    console.log("handel place order");
    try {
      if (isRegistered === "false") {
        console.log("yyyyy");
        // Add unregistered customer first

        // await addUnregCustomer();

        try {
          const response = await axios.post("/api/addUnregCustomer", {
            PhoneNumber,
            FirstName,
            LastName,
            Role: "UnRegistered",
          });

          const result = response.data;

          setUserId(result.UserID);
          setCartId(result.CartID);
          console.log("Unregistered customer added:", result.UserID);
          console.log("Unregistered customer added:", result.CartID);

          const cart = JSON.parse(localStorage.getItem("internalCart") || "[]");
          for (const item of cart) {
            await axios.post("/api/unRegSetCart", {
              VariantID: item.VariantID,
              cartId: result.CartID,
              quantity: item.quantity,
            });
          }
          // Clean the local storage cart
          localStorage.removeItem("internalCart");

          const addressData = {
            AddressNumber: AddressNumber,
            Lane: Lane,
            City: City,
            PostalCode: PostalCode,
            District: District,
          };
          // Send address data to backend
          const response3 = await axios.post("/api/addAddress", addressData);

          console.log("Address created successfully:", response3.data);
          setAddressId(response3.data.AddressID);

          const orderData = {
            userid: result.UserID,
            cartId: result.CartID,
            DeliveryType: deliveryMethod,
            PaymentMethod: paymentMethod,
            AddressID: response3.data.AddressID,
          };
          // const response2 = await axios.post("/api/placeOrder", orderData);

// -----------------------------------------------------------------------------------------------
          try {
            const response2 = await axios.post("/api/placeOrder", orderData);
        
            if (response2.data.status === 200) {

              const orderID = response2.data.orderID; // Extract orderID from response
              console.log("Order ID:", orderID); // Now you can use this orderID as needed
              // You can save it to state if you want to use it elsewhere in the component
              // router.push('/thank-you');
              router.push(`/thank-you?orderId=${orderID}`);

            } else {
              console.error("Failed to place order:", response.data.success);
            }
          } catch (error) {
            console.error("Error placing order:", error);
          }
// ----------------------------------------------------------------------------------------------------

          // console.log("Order placed successfully:", response2.data);
          // // alert("Order placed successfully");
          // router.push('/thank-you');

          // Redirect to thank-you page with order and invoice data
          // router.push(`/thank-you?orderId=${response2.data.OrderID}&userId=16`);
        } catch (err) {
          console.error("Error adding unregistered customer:", err);
          alert("An error occurred while adding the unregistered customer");
        }

        // Send order data to backend
      } else {
        // Prepare order data for registered users

        console.log("xxxxxx");

        try {
          const response = await axios.post("/api/getUserCartId", {
            userId: 13,
          });

          const result = response.data;
          console.log("Cart ID retrieved:", result.CartID);

          const addressData = {
            AddressNumber,
            Lane,
            City,
            PostalCode,
            District,
          };

          // Send address data to backend
          const response3 = await axios.post("/api/addAddress", addressData);

          console.log("Address created successfully:", response3.data);
          setAddressId(response3.data.AddressID);

          const orderData = {
            userid: 13,
            cartId: result.CartID,
            DeliveryType: deliveryMethod,
            PaymentMethod: paymentMethod,
            AddressID: response3.data.AddressID,
          };

          // // Send order data to backend
          // const response2 = await axios.post("/api/placeOrder", orderData);

          // console.log("Order placed successfully:", response2.data);
          // alert("Order placed successfully");
          // router.push('/thank-you');


          try {
            const response2 = await axios.post("/api/placeOrder", orderData);
        
            if (response2.data.status === 200) {

              const orderID = response2.data.orderID; // Extract orderID from response
              console.log("Order ID:", orderID); // Now you can use this orderID as needed
              // You can save it to state if you want to use it elsewhere in the component
              // router.push('/thank-you');
              router.push(`/thank-you?orderId=${orderID}`);

            } else {
              console.error("Failed to place order:", response.data.success);
            }
          } catch (error) {
            console.error("Error placing order:", error);
          }

          if (result.CartID) {
            setCartId(result.CartID);
          } else {
            throw new Error("Failed to retrieve CartID");
          }
        } catch (err) {
          console.error("Error retrieving cart ID:", err);
          alert("An error occurred while retrieving the cart ID");
        }
      }
    } catch (err) {
      console.error("Error placing order:", err);
      alert("An error occurred while placing the order");
    }
  };

  return (
    <>
      {/* ----------------------------------------------------------Nabvar ---------------------------------------- */}
      <div className="flex flex-col items-center py-4 bg-white border-b h-fit sm:flex-row sm:px-10 lg:px-20 xl:px-32">
        <a href="#" className="text-2xl font-bold text-gray-800">
          Checkout Page
        </a>

        <div className="py-2 mt-4 text-xs sm:mt-0 sm:ml-auto sm:text-base">
          <div className="relative">
            <ul className="relative flex items-center justify-between w-full space-x-2 sm:space-x-4">
              <li className="flex items-center space-x-3 text-left sm:space-x-4">
                <a
                  className="flex items-center justify-center w-6 h-6 text-xs font-semibold rounded-full bg-emerald-200 text-emerald-700"
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
                  className="flex items-center justify-center w-6 h-6 text-xs font-semibold text-white bg-yellow-400 rounded-full ring ring-gray-600 ring-offset-2"
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

      <div className="grid bg-gray-200 sm:px-10 lg:grid-cols-2 lg:px-20 xl:px-32">
        <div className="px-4 pt-8">
          <p className="text-xl font-medium text-black">Order Summary</p>
          <p className="text-gray-900">
            Check your items. And select a suitable shipping method.
          </p>
          {/* --------------------------------------products-------------------------------- */}
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
                    <h4 className="font-semibold text-black">
                      {item.VariantName}
                    </h4>
                  </div>
                  <input
                    type="number"
                    value={item.Quantity}
                    className="w-10 text-center text-white bg-blue-900 border border-gray-300 rounded-full "
                    readOnly
                  />
                </div>
              ))
            ) : (
              <p className="text-gray-700">Your cart is empty</p>
            )}
          </div>

          {/* -------------------------------choose shiping----------------------------------- */}
          <div>
            <p className="mt-8 text-lg font-medium text-black">
              Shipping Methods
            </p>

            <form className="grid gap-6 mt-5">
              <div className="relative">
                <input
                  className="hidden peer"
                  id="radio_1"
                  type="radio"
                  name="radio"
                  checked={deliveryMethod === "delivery"}
                  onChange={() => setDeliveryMethod("delivery")}
                 
                />
                <span className="box-content absolute block w-4 h-4 -translate-y-1/2 bg-white border-8 border-gray-300 rounded-full peer-checked:border-blue-700 peer-checked:bg-gray-800 right-4 top-1/2"></span>
                <label
                  className="flex p-4 border border-gray-300 rounded-lg cursor-pointer select-none peer-checked:border-2 peer-checked:border-gray-700 peer-checked:bg-gray-50"
                  htmlFor="radio_1"
                >
                  <img
                    className="object-contain w-14"
                    src="https://assets.turbologo.com/blog/en/2019/12/19084817/Fedex-logo.png"
                    alt=""
                  />
                  <div className="ml-5">
                    <span className="mt-2 font-semibold text-black">
                      Fedex Delivery
                    </span>
                    <p className="text-sm leading-6 text-slate-500">
                      Delivery: 2-4 Days
                    </p>
                  </div>
                </label>
              </div>

              <div className="relative">
                <input
                  className="hidden peer"
                  id="radio_2"
                  type="radio"
                  name="radio"
                  checked={deliveryMethod === "DHL"}
                  onChange={() => setDeliveryMethod("dilivery")}
                  
                />
                <span className="box-content absolute block w-4 h-4 -translate-y-1/2 bg-white border-8 border-gray-300 rounded-full peer-checked:border-blue-700 peer-checked:bg-gray-800 right-4 top-1/2"></span>
                <label
                  className="flex p-4 border border-gray-300 rounded-lg cursor-pointer select-none peer-checked:border-2 peer-checked:border-gray-700 peer-checked:bg-gray-50"
                  htmlFor="radio_2"
                >
                  <img
                    className="object-contain w-14"
                    src="https://cdn11.bigcommerce.com/s-fj3z5r15lm/images/stencil/1280x1280/products/1269/9315/DHLLOGOYLW_01__23607.1694446728.jpg?c=2"
                    alt=""
                  />
                  <div className="ml-5">
                    <span className="mt-2 font-semibold text-black"> DHL</span>
                    <p className="text-sm leading-6 text-slate-500">
                      Delivery: 1-3 Days
                    </p>
                  </div>
                </label>
              </div>
            </form>
          </div>
          {/* ---------------------------------choose paymentmethod---------------------------------------- */}
          <div>
            <p className="mt-8 text-lg font-medium text-black">
              Payment Methods
            </p>
            <form className="grid gap-6 mt-5">
              <div className="relative">
                <input
                  className="hidden peer"
                  id="radio_3"
                  type="radio"
                  name="radio"
                  defaultChecked
                  checked={paymentMethod === "COD"}
                  onChange={() => setPaymentMethod("COD")}
                />
                <span className="box-content absolute block w-4 h-4 -translate-y-1/2 bg-white border-8 border-gray-300 rounded-full peer-checked:border-blue-700 peer-checked:bg-gray-800 right-4 top-1/2"></span>
                <label
                  className="flex p-4 border border-gray-300 rounded-lg cursor-pointer select-none peer-checked:border-2 peer-checked:border-blue-700 peer-checked:bg-white"
                  htmlFor="radio_3"
                >
                  <img
                    className="object-contain w-14"
                    src="https://img.freepik.com/premium-vector/cash-delivery-label_686319-773.jpg"
                    alt=""
                  />
                  <div className="ml-5">
                    <span className="mt-2 font-semibold text-black">COD</span>
                  </div>
                </label>
              </div>

              <div className="relative">
                <input
                  className="hidden peer"
                  id="radio_4"
                  type="radio"
                  name="radio"
                  checked={paymentMethod === "Card"}
                  onChange={() => setPaymentMethod("Card")}
                />
                <span className="box-content absolute block w-4 h-4 -translate-y-1/2 bg-white border-8 border-gray-300 rounded-full peer-checked:border-blue-700 peer-checked:bg-gray-800 right-4 top-1/2"></span>
                <label
                  className="flex p-4 border border-gray-300 rounded-lg cursor-pointer select-none peer-checked:border-2 peer-checked:border-gray-700 peer-checked:bg-gray-50"
                  htmlFor="radio_4"
                >
                  <img
                    className="object-contain w-14"
                    src="https://img.freepik.com/premium-vector/digital-wallet-logo-technology-logo-design_267160-177.jpg?semt=ais_hybrid"
                    alt=""
                  />
                  <div className="ml-5">
                    <span className="mt-2 font-semibold text-black">
                      Debit/Credit Card
                    </span>
                  </div>
                </label>
              </div>
            </form>
          </div>
        </div>

        {/*------------------------------- form Section --------------------------------------------------------------------------*/}

        <div className="px-4 pt-8 mt-10 bg-gray-50 lg:mt-0">
          {!isRegistered && (
            <div>
              <p className="mt-8 text-xl font-medium text-black">
                User Details
              </p>

              <label
                htmlFor="card-holder"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900 "
              >
                First Name
              </label>
              <input
                type="text"
                id="card-holder"
                name="card-holder"
                className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                placeholder="Your full name here"
                value={FirstName}
                onChange={(e) => setFirstName(e.target.value)}
              />

              <label
                htmlFor="card-no"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900 "
              >
                Last Name
              </label>
              <div className="flex">
                <input
                  type="text"
                  id="card-no"
                  name="card-no"
                  className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                  placeholder="Your last name here"
                  value={LastName}
                  onChange={(e) => setLastName(e.target.value)}
                />
              </div>
              <label
                htmlFor="card-no"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900 "
              >
                Phone No
              </label>

              <input
                type="text"
                id="card-no"
                name="card-no"
                className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                placeholder="Your phone number here"
                value={PhoneNumber}
                onChange={(e) => setPhoneNumber(e.target.value)}
              />
            </div>
          )}

          <p className="mt-5 text-xl font-medium text-black">Address Details</p>
          <p className="text-gray-900">
            Complete your order by providing your payment details.
          </p>
          <div className="mb-3">
            <label
              htmlFor="card-holder"
              className="block mt-4 mb-2 text-sm font-medium text-gray-900"
            >
              Address No
            </label>
            <input
              type="text"
              id="Address-holder"
              name="Address-holder"
              className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
              placeholder="Address No"
              value={AddressNumber}
              onChange={(e) => setAddressNumber(e.target.value)}
            />

            <label
              htmlFor="card-holder"
              className="block mt-4 mb-2 text-sm font-medium text-gray-900"
            >
              Lane
            </label>

            <input
              type="text"
              id="Lane-holder"
              name="Lane-holder"
              className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
              placeholder="Lane "
              value={Lane}
              onChange={(e) => setLane(e.target.value)}
            />

            <label
              htmlFor="card-holder"
              className="block mt-4 mb-2 text-sm font-medium text-gray-900"
            >
              City
            </label>

            <input
              type="text"
              id="City-holder"
              name="City-holder"
              className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
              placeholder="City "
              value={City}
              onChange={(e) => setCity(e.target.value)}
            />

            {/* Card Details */}

            <div className="flex gap-4">
              <div className="w-full">
                <label
                  htmlFor="card-holder"
                  className="block mt-4 mb-2 text-sm font-medium text-gray-900"
                >
                  Postal Code
                </label>

                <input
                  type="text"
                  id="Postal-no"
                  name="Postal-no"
                  className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                  placeholder="Postal code"
                  value={PostalCode}
                  onChange={(v) => setPostalCode(v.target.value)}
                />
              </div>

              <div className="w-full">
                <label
                  htmlFor="card-holder"
                  className="block mt-4 mb-2 text-sm font-medium text-gray-900"
                >
                  District
                </label>

                <input
                  type="text"
                  id="District-no"
                  name="District-no"
                  className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                  placeholder="District"
                  value={District}
                  onChange={(e) => setDistrict(e.target.value)}
                />
              </div>
            </div>
          </div>

          <p className="text-xl font-medium text-black">Payment Details</p>

          {paymentMethod === "Card" && (
            <div>
              {/* Cardholder Name */}
              <label
                htmlFor="card-holder"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900 "
              >
                Card Holder
              </label>
              <input
                type="text"
                id="card-holder"
                name="card-holder"
                className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                placeholder="Your full name here"
              />

              {/* Card Details */}
              <label
                htmlFor="card-no"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900 "
              >
                Card Details
              </label>
              <div className="flex">
                <input
                  type="text"
                  id="card-no"
                  name="card-no"
                  className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                  placeholder="xxxx-xxxx-xxxx-xxxx"
                />
                <input
                  type="text"
                  name="card-expiry"
                  className="w-1/2 px-4 py-3 ml-2 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                  placeholder="MM/YY"
                />
              </div>

              {/* CVV */}
              <label
                htmlFor="cvv"
                className="block mt-4 mb-2 text-sm font-medium text-gray-900"
              >
                CVV
              </label>
              <input
                type="text"
                id="cvv"
                name="cvv"
                className="w-full px-4 py-3 text-sm bg-gray-200 border border-gray-200 rounded-md shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                placeholder="123"
              />
            </div>
          )}

          {/* Submit Button */}
          <button
            type="submit"
            className="w-full px-6 py-3 mt-4 font-medium text-white bg-blue-500 rounded-md hover:bg-blue-600 focus:bg-blue-600 focus:outline-none"
            onClick={() => handlePlaceOrder()}
          >
            Place Order
          </button>
        </div>
      </div>
    </>
  );
};

export default CheckoutPage;
