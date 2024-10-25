import { NextResponse, NextRequest } from "next/server";
import { getUserCartId } from "@/models/userAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { userId } = reqBody;

    // Get the cart ID for the user
    const result = await getUserCartId(userId);

    // Return the appropriate response
    if (result) {
      return NextResponse.json({ success: "Cart ID retrieved successfully", CartID: result.CartID }, { status: 200 });
    } else {
      return NextResponse.json({ error: "Cart ID not found" }, { status: 404 });
    }
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}