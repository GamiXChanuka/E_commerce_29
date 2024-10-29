import { NextRequest, NextResponse } from "next/server";
import { getOrderDetails } from "@/models/gerOrderAction"; // Adjust this import path based on your project structure

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { orderId } = reqBody;
    console.log("🚀 ~ POST ~ orderId:", orderId);

    if (!orderId) {
      return NextResponse.json({ error: "Order ID is required" }, { status: 400 });
    }

    const orderDetails = await getOrderDetails(orderId);

    return NextResponse.json(orderDetails);
  } catch (error: any) {
    console.error("Error fetching order details:", error);
    return NextResponse.json({ error: error.message || "Internal Server Error" }, { status: 500 });
  }
}