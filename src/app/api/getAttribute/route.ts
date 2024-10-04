import { NextResponse, NextRequest } from "next/server";
import { getProductAttribute } from "@/models/getProductAttribute";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { VariantID } = reqBody;

    // get cart details
    const variantAttribute = await getProductAttribute(VariantID);
    console.log("variant attribute ",variantAttribute)
    if (!variantAttribute) {
      return NextResponse.json(
        { message: "No attributes " },
        { status: 409 }
      );
    }

    return NextResponse.json(variantAttribute);
    

  } catch (error: any) {
      console.log("🚀 ~ POST ~ error:", error)
      return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
