"use client";
import React, { useState, useEffect } from "react";
import { motion } from "framer-motion";
import Link from "next/link";
import {
  ArrowLeftStartOnRectangleIcon,
  ShoppingBagIcon,
  TrashIcon,
} from "@heroicons/react/24/outline";
import axios from "axios";
import Spinner from "@/components/spinner/Spinner";
import { useRouter } from "next/navigation";
import { toast } from "react-hot-toast";

interface Order {
  OrderDate: string;
  PaymentMethod: string;
  DeliveryType: string;
  OrderTotal: string;
  AddressNumber: string;
  Lane: string;
  City: string;
  PostalCode: string;
  District: string;
  OrderID: number;
}

const GetOrdersPage = () => {
  const [orders, setOrders] = useState<Order[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const response = await axios.post("/api/getOrders", { userId: 4 });
        setOrders(response.data);
      } catch (error: any) {
        console.error("Error fetching orders:", error);
        setError(error.response?.data.message || error.message);
      } finally {
        setLoading(false);
      }
    };

    fetchOrders();
  }, []);

  const handleDelete = async (orderId: number) => {
    try {
      await axios.delete(`/api/dropOrders`, { data: { orderId } });
      setOrders(orders.filter((order) => order.OrderID !== orderId));
      toast.success("Order deleted successfully!");
      setOrders(orders.filter((order) => order.OrderID !== orderId));
    } catch (error) {
      console.error("Error deleting order:", error);
    }
  };

  if (loading) return <Spinner />;
  if (error) return <p>{error}</p>;

  return (
    <div className="flex min-h-screen bg-[#e6e7eb]">
      {/* Sidebar */}
      <aside className="w-1/5 bg-[#004581] p-6 shadow-lg rounded-lg">
        <nav>
          <ul className="space-y-4">
            <li>
              <Link
                href="/profile"
                className="flex items-center text-[#97CBDC] hover:text-[#018ABD] transition duration-300"
              >
                <ArrowLeftStartOnRectangleIcon className="w-5 h-5 mr-2" /> Back
                to Profile
              </Link>
            </li>
            <li>
              <Link
                href="/profile/my-orders"
                className="flex items-center text-white font-bold"
              >
                <ShoppingBagIcon className="w-5 h-5 mr-2" /> Your Orders
              </Link>
            </li>
          </ul>
        </nav>
      </aside>

      {/* Main Content */}
      <div className="w-4/5 p-10 bg-white shadow-lg rounded-lg">
        <h2 className="text-3xl font-semibold mb-6 text-[#004581]">
          Your Orders
        </h2>

        {orders.length > 0 ? (
          <motion.table
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.5 }}
            className="min-w-full bg-[#dde8f0] shadow-md rounded-lg border border-gray-200"
          >
            <thead>
              <tr className="bg-[#004581] text-white text-left">
                <th className="p-4">Order Date</th>
                <th className="p-4">Payment Method</th>
                <th className="p-4">Delivery Type</th>
                <th className="p-4">Order Total</th>
                <th className="p-4">Address</th>
                <th className="p-4">Postal Code</th>
                <th className="p-4">Actions</th>
              </tr>
            </thead>
            <tbody className=" bg-[#e6e7eb] border border-blue-300 rounded-md focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black">
              {orders.map((order) => (
                <tr key={order.OrderID}>
                  <td className="p-4">
                    {new Date(order.OrderDate).toLocaleDateString()}
                  </td>
                  <td className="p-4">{order.PaymentMethod}</td>
                  <td className="p-4">{order.DeliveryType}</td>
                  <td className="p-4">{order.OrderTotal}</td>
                  <td className="p-4">
                    {[
                      order.AddressNumber,
                      order.Lane,
                      order.City,
                      order.District,
                    ]
                      .filter(Boolean)
                      .join(", ")}
                  </td>
                  <td className="p-4">{order.PostalCode}</td>
                  <td className="p-4">


                    <button
                      onClick={() => handleDelete(order.OrderID)}
                      className="mx-2 px-6 py-2 border border-red-600 text-red-600 rounded-md hover:bg-red-100 transition duration-300 shadow-md"
                      >
                      <TrashIcon className="w-5 h-5 inline" /> Delete
                    </button>

                    <button
                  onClick={() => router.push(`/profile/orderdetails/${order.OrderID}`)}
                  className="px-6 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD] transition duration=300 shadow-md"
                  >
                  View Details
                </button>
                 
                  </td>
                </tr>
              ))}
            </tbody>
          </motion.table>
        ) : (
          <p>No orders found for this user.</p>
        )}
      </div>
    </div>
  );
};

export default GetOrdersPage;
