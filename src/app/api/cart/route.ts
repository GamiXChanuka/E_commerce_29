import { NextResponse, NextRequest } from "next/server";
import { getCart } from "@/models/cartAction";
import { getDataFromToken } from "@/helpers/getDataFromToken";

export async function GET(request: NextRequest) {
  try {
      // Extract token and decode it to get the userId
      const token = request.cookies.get("token")?.value || "";
      if (!token) {
        throw new Error("No token found from backend");
      }
  
      const userId = await getDataFromToken(request);
      const cartItems = await getCart(userId);

      console.log("🚀 ~ GET ~ cartItems", cartItems[0]);

      return NextResponse.json(cartItems);
  } catch (error: any) {
      console.error("Error fetching cart:", error);
      return NextResponse.json({ message: error.message }, { status: 500 });
  }
}
