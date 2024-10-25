import { NextResponse, NextRequest } from "next/server";
import { dropOrder } from "../../../models/dropOrders";

export async function DELETE(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { orderId } = reqBody;
    // Drop order
    const message = await dropOrder(orderId);

    // Return success response
    return NextResponse.json({ message }, { status: 200 });

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}