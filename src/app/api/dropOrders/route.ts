import { NextResponse, NextRequest } from "next/server";
import { dropOrder } from "../../../models/dropOrders";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { orderId } = reqBody;

    // place order
    await dropOrder(orderId);

    // return success response
    return NextResponse.json({ message: "Order dropped successfully!" }, { status: 200 });

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}