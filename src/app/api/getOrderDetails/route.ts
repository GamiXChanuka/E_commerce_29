import { NextRequest, NextResponse } from "next/server";
import pool from "@/lib/dbConfig"; // Adjust this import path based on your project structure

export async function POST(request: NextRequest) {
  try {

    
    const reqBody = await request.json();
    const  orderId  = reqBody.orderId;
    console.log("🚀 ~ POST ~ orderId:", orderId);

    if (!orderId) {
      return NextResponse.json({ error: "Order ID is required" }, { status: 400 });
    }

    const query = `CALL GetOrderDetails(?)`;
    const [orderDetails]: any = await pool.execute(query, [orderId]);

    if (orderDetails[0].length === 0) {
      return NextResponse.json({ error: "Order not found" }, { status: 404 });
    }

    const items = orderDetails[0].map((item: { VariantName: string; Price: number; Quantity: number; ImageLink: string }) => ({
      VariantName: item.VariantName,
      Price: item.Price,
      Quantity: item.Quantity,
      ImageLink: item.ImageLink,
    }));

    const response = {
      OrderDate: orderDetails[0][0].OrderDate,
      DeliveryType: orderDetails[0][0].DeliveryType,
      PaymentMethod: orderDetails[0][0].PaymentMethod,
      OrderTotal: orderDetails[0][0].OrderTotal,
      items,
    };

    return NextResponse.json(response);
  } catch (error) {
    console.error("Error fetching order details:", error);
    return NextResponse.json({ error: "Internal Server Error" }, { status: 500 });
  }
}