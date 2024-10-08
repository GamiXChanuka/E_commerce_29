import { NextResponse, NextRequest } from "next/server";
import {  getOrders } from "@/models/gerOrderAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { userId } = reqBody;

    // get cart details
    const orders = await getOrders(userId);
    console.log("Orders ",orders)
    if (!orders) {
      return NextResponse.json(
        { message: "No attributes " },
        { status: 409 }
      );
    }

    return NextResponse.json(orders);
    

  } catch (error: any) {
      console.log("🚀 ~ POST ~ error:", error)
      return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
