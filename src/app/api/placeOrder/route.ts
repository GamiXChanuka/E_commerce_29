import { NextResponse, NextRequest } from "next/server";
import { placeOrder } from "../../../models/placeOrderAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { userid, cartId, DeliveryType, PaymentMethod, AddressID } = reqBody;
    console.log("userid", userid , "cartId", cartId, "DeliveryType", DeliveryType, "PaymentMethod", PaymentMethod, "AddressID", AddressID);

    // place order
    const result: { success?: string; error?: string; status: number } = await placeOrder(userid, cartId, DeliveryType, PaymentMethod, AddressID);

    // Return the appropriate response
    if (result && 'error' in result) {
      return NextResponse.json({ error: result.error }, { status: result.status });
    } else {
      if (result) {
        return NextResponse.json({ success: result.success }, { status: result.status });
      } else {
        return NextResponse.json({ error: "Unknown error" }, { status: 500 });
      }
    }

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}