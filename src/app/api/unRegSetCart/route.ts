
import { NextResponse, NextRequest } from "next/server";
import { unRegSetCart } from "@/models/unRegSetCartAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const {  VariantID, cartId ,quantity } = reqBody;
    console.log("🚀 ~ POST ~ reqBody", reqBody);
    

    // Perform cart operation
    const result = await unRegSetCart( VariantID, cartId, quantity);

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