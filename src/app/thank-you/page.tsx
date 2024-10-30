"use client";
import React, { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import axios from "axios";
import Spinner from "@/components/spinner/Spinner";
import { ArrowLeftStartOnRectangleIcon } from "@heroicons/react/24/outline";
import domtoimage from "dom-to-image";
import { jsPDF } from "jspdf";
import { useSearchParams } from 'next/navigation';



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

interface InvoiceProps {
  orderId: number;
}

interface deliveryData {
  AddressNumber: string;
  City: string;
  District: string;
  EstimateDate: string;
  Lane: string;
}

const Invoice = () => {
  const router = useRouter();
  // const orderId = 16; // hardcoded order ID
  const [orderDetails, setOrderDetails] = useState<OrderDetails | null>(null);

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  
  const [deliveryData, setDeliveryData] = useState<deliveryData | null>(null);


  const searchParams = useSearchParams();
  const orderId = searchParams.get('orderId'); // Retrieve the orderID

  console.log("Order ID:", orderId); // Now you can use orderId as needed


  const invoiceRef = useRef(null);

  let deliveryDays: number | null = null;
  if (orderDetails && deliveryData) {
    const orderDate = new Date(orderDetails.OrderDate);
    const estimateDate = new Date(deliveryData.EstimateDate);
    
    const timeDifference = estimateDate.getTime() - orderDate.getTime();
    deliveryDays = Math.ceil(timeDifference / (1000 * 60 * 60 * 24)); // convert ms to days
    
    console.log("Delivery Days:", deliveryDays);
  }


  

  const downloadPdf = () => {
    const node = invoiceRef.current;
    if (!node) return;

    domtoimage.toPng(node, { quality: 1, bgcolor: '#fff', })
      .then((dataUrl) => {
        const pdf = new jsPDF("p", "mm", "a4");
        const imgProps = pdf.getImageProperties(dataUrl);
        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;

        pdf.addImage(dataUrl, "PNG", 0, 0, pdfWidth, pdfHeight);
        pdf.save("invoice.pdf");
      })
      .catch((error) => {
        console.error("Error generating PDF", error);
      });
  };

  const fetchOrderDetails = async () => {
    try {
      const response = await axios.post("/api/getOrderDetails", {
        orderId,
      });
      const response_address = await axios.post("/api/getDeliveryData", {
        orderId,
      });
      setOrderDetails(response.data);
      setDeliveryData(response_address.data.deliveryData[0]);

      console.log("Delivery Data:-------------------------------------", response_address.data.deliveryData[0]);
      console.log("Order ID:", response.data); // Now you can use orderId as needed

    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchOrderDetails();
  }, []);

  if (loading) {
    return <Spinner />;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <section className="py-20 bg-gray-100">
        
      {/* Banner Section */}
      <div className="relative z-10 flex items-center justify-center py-4 font-semibold text-center text-white bg-green-500 shadow-lg px-9 md:max-w-2xl md:mx-auto md:rounded-t-md">
      <p>Thank you for purchasing! Your delivery will arrive within the next {deliveryDays !== null ? `${deliveryDays} days` : "Calculating..."} days.</p>
      </div>


        {/* <p>Thank you for purchasing! Your delivery will arrive within the next {deliveryDays !== null ? `${deliveryDays} days` : "Calculating..."} days.</p> */}
 
 
      <div className="max-w-2xl py-0 mx-auto md:py-16 " >
        <article className="overflow-hidden shadow-none md:shadow-md md:rounded-md invoice-content"  ref={invoiceRef}>
          <div className="bg-white md:rounded-b-md" >
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-6">
                <div className="flex justify-between items-top">
                  <div className="space-y-4">
                    <div>
                      <p className="text-2xl font-bold text-blue-900">Shopzy</p>
                      <p className="text-lg font-bold text-black">Invoice</p>
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">Billed To</p>
                      <p className="text-black"> {deliveryData?.Lane}</p>
                      <p className="text-black">{deliveryData?.District}</p>
                      <p className="text-black"></p>
                    </div>
                  </div>
                  <div className="space-y-2">
                    <div>
                      <p className="text-sm font-medium text-gray-400">Invoice Number</p>
                      <p className="text-black">INV-MJ00{orderId}</p>
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">Invoice Date</p>
                      <p className="text-black">{new Date(orderDetails?.OrderDate ?? "").toLocaleDateString()}</p>
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">ABN</p>
                      <p className="text-black">57 {orderId} 446</p>
                    </div>
                    <div>
                      <a
                        href="#"
                        target="_blank"
                        className="inline-flex items-center text-sm font-medium text-blue-500 hover:opacity-75 btn-download"
                        onClick={downloadPdf} 
                      >
                        Download PDF
                        <svg
                          className="ml-0.5 h-4 w-4 fill-current"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          aria-hidden="true"
                        >
                          <path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z" />
                          <path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="border-b border-gray-200 p-9">
              <p className="text-sm font-medium text-gray-400">Note</p>
              <p className="text-sm text-black">Thank you for your order.</p>
            </div>
            <table className="w-full text-sm divide-y divide-gray-200">
              <thead>
                <tr>
                  <th className="py-4 font-semibold text-left text-black px-9">Item</th>
                  <th className="py-3 font-semibold text-left text-gray-400"></th>
                  <th className="py-3 font-semibold text-center text-black">Quantity   </th>
                  <td className="text-gray-600 truncate whitespace-nowrap">             </td>

                  <th className="py-3 ml-5 font-semibold text-left text-black">Amount</th>
                  <th className="py-3 font-semibold text-left text-gray-400"></th>
                </tr>
              </thead>


                <tbody className="divide-y divide-gray-200">
                {orderDetails?.items.map((item, index) => (
                    <tr key={index}>
                    <td className="flex items-center py-5 space-x-1 px-9 whitespace-nowrap">
                        <img
                        src={item.ImageLink}
                        alt={item.VariantName}
                        className="object-cover w-16 h-16 mr-4 rounded-lg"
                        />
                        <div>
                        <p className="font-bold text-black">{item.VariantName}</p>
                        <p className="text-sm text-gray-400">Description or type of item</p>
                        </div>
                    </td>
                    <td className="text-gray-600 truncate whitespace-nowrap">      </td>

                    <td className="text-gray-600 truncate whitespace-nowrap"> {item.Quantity}</td>
                    <td className="text-gray-600 truncate whitespace-nowrap">     </td>

                    <td className="text-gray-600 truncate whitespace-nowrap">Rs {item.Price}</td>
                    </tr>
                ))}
                </tbody>



            </table>
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-3">
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Subtotal</p>
                  <p className="text-sm text-gray-500">Rs.{orderDetails?.OrderTotal}</p>
                </div>
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Tax</p>
                  <p className="text-sm text-gray-500"> 0.00</p>
                </div>
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Total</p>
                  <p className="text-sm text-gray-500">Rs.{orderDetails?.OrderTotal}</p>
                </div>
              </div>
            </div>
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-3">
                <div className="flex justify-between">
                  <p className="text-lg font-bold text-black">Amount Due</p>
                  <p className="text-lg font-bold text-black">Rs.{orderDetails?.OrderTotal}</p>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>
  );
};

export default Invoice;
