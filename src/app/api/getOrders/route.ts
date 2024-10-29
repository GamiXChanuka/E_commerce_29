import { NextResponse, NextRequest } from "next/server";
import { getOrders } from "@/models/gerOrderAction";
import { getDataFromToken } from "@/helpers/getDataFromToken";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const  userId  = reqBody.userId;
    console.log("🚀 ~ POST ~ userId:", userId)

    // get orders
    const orders = await getOrders(userId);
    console.log("🚀 ~ GET ~ orders:", orders)

    if (!orders || orders.length === 0) {
      return NextResponse.json(
        { message: "No orders found" },
        { status: 409 }
      );
    }

    return NextResponse.json(orders);
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}