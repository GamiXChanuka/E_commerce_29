import { NextResponse, NextRequest } from "next/server";
import { getDeliveryData } from "@/models/getDeliveryData";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { orderId } = reqBody;

    // Get the delivery data
    const result = await getDeliveryData(orderId);

    // Return the appropriate response
    if (result) {
      return NextResponse.json({ success: "Delivery data retrieved successfully", deliveryData: result }, { status: 200 });
    } else {
      return NextResponse.json({ error: "Delivery data not found" }, { status: 404 });
    }
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}