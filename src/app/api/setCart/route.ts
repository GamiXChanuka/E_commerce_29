
import { NextResponse, NextRequest } from "next/server";
import { setCart } from "@/models/setCartAction";
import { getCartId } from "@/models/cartAction";
import { getDataFromToken } from "@/helpers/getDataFromToken";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { op, VariantID } = reqBody;
    const token = request.cookies.get("token")?.value || "";
    const userId = await getDataFromToken(request);
    const cartId = await getCartId(userId);
    console.log("🚀 ~ POST ~ reqBody", reqBody);
    
    console.log("Cart", cartId);
    // Perform cart operation
    const result = await setCart(op, VariantID, cartId);

    // Return the appropriate response
    if (result && result.error) {
      return NextResponse.json({ error: result.error }, { status: result.status });
    } else {
      if (result) {
        return NextResponse.json({ success: result.success }, { status: result.status });
      } else {
        return NextResponse.json({ error: "Unknown error" }, { status: 500 });
      }
    }

  } catch (error: any) {
    console.error("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}