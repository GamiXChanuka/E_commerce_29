import { NextResponse, NextRequest } from "next/server";
import { placeOrder } from "../../../models/placeOrderAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { userid, cartId, DeliveryType, PaymentMethod, AddressID } = reqBody;

    // place order
    await placeOrder(userid, cartId, DeliveryType, PaymentMethod, AddressID);

    // return success response
    return NextResponse.json({ message: "Order placed successfully!" }, { status: 200 });

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}