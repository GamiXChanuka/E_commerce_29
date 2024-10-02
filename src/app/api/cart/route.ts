import { NextResponse, NextRequest } from "next/server";
import { getCart } from "@/models/cartAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { id } = reqBody;

    // get cart details
    const cartDetails = await getCart(id);
    if (!cartDetails) {
      return NextResponse.json(
        { message: "Cart Empty !" },
        { status: 409 }
      );
    }

    return NextResponse.json(cartDetails);
    

  } catch (error: any) {
      console.log("🚀 ~ POST ~ error:", error)
      return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
