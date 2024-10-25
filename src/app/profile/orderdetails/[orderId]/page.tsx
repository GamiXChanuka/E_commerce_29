"use client";
import React, { useEffect, useState } from "react";
import { useRouter, useParams } from "next/navigation";
import axios from "axios";
import Spinner from "@/components/spinner/Spinner";
import { ArrowLeftStartOnRectangleIcon } from "@heroicons/react/24/outline";

interface OrderItem {
  VariantName: string;
  Price: string;
  Quantity: number;
  ImageLink: string;
}

interface OrderDetails {
  OrderDate: string;
  DeliveryType: string;
  PaymentMethod: string;
  OrderTotal: string;
  items: OrderItem[];
}

const OrderDetailsPage = () => {
  const router = useRouter();
  const { orderId } = useParams(); // assuming you pass orderId in the route
  const [orderDetails, setOrderDetails] = useState<OrderDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchOrderDetails = async () => {
      if (!orderId) return;

      try {
        const response = await axios.post("/api/getOrderDetails", {
          orderId: Number(orderId),
        });
        setOrderDetails(response.data);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchOrderDetails();
  }, [orderId]);

  if (loading) return <Spinner />;
  if (error) return <p>{error}</p>;

  if (!orderDetails) {
    return <p>No order details found.</p>;
  }

  return (
    <div className="flex min-h-screen bg-[#e6e7eb]">
      {/* Sidebar */}
      <aside className="w-1/5 bg-[#004581] p-6 shadow-lg rounded-lg">
        <nav>
          <ul className="space-y-4">
            <li>
              <button
                onClick={() => router.back()}
                className="flex items-center text-[#97CBDC] hover:text-[#018ABD] transition duration-300"
              >
                <ArrowLeftStartOnRectangleIcon className="w-5 h-5 mr-2" /> Back to Orders
              </button>
            </li>
          </ul>
        </nav>
      </aside>

      {/* Main Content */}
      <div className="w-4/5 p-10 bg-white shadow-lg rounded-lg">
    <div>
      <h2 className="text-3xl font-semibold mb-6 text-[#004581]">Order Details</h2>
      <div className="mb-4 flex flex-col items-center p-4 bg-[#e6e7eb] border border-blue-300 rounded-md focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black">
        <div className="w-full flex justify-between">
        <p className="text-lg"><strong>Order Date:</strong> {new Date(orderDetails.OrderDate).toLocaleDateString()}</p>
        <p className="text-lg"><strong>Payment Method:</strong> {orderDetails.PaymentMethod}</p>
        </div>
        <div className="w-full flex justify-between">
        <p className="text-lg"><strong>Order Total:</strong> {orderDetails.OrderTotal}</p>
        <p className="text-lg"><strong>Delivery Type:</strong> {orderDetails.DeliveryType}</p>
        </div>
      </div>
    </div>

        <h3 className="text-2xl font-semibold mb-4 text-[#004581]">Items:</h3>
        <ul className="space-y-4">
          {orderDetails.items.map((item, index) => (
            <li key={index} className="flex items-center p-4  bg-[#e6e7eb] border border-blue-300 rounded-md focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black">
              <img src={item.ImageLink} alt={item.VariantName} className="w-24 h-24 object-cover mr-4 rounded" />
              <div className="flex-grow">
                <p className="font-bold">{item.VariantName}</p>
                <p>Unit Price: {item.Price}</p>
                <p>Quantity: {item.Quantity}</p>
              </div>
            </li>
          ))}
        </ul>

        <button
          onClick={() => router.back()}
          className="mt-6 px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD] transition duration-300"
        >
          Back to Orders
        </button>
      </div>
    </div>
  );
};

export default OrderDetailsPage;