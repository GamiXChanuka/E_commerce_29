import { NextResponse, NextRequest } from "next/server";
import { getProductAttribute } from "@/models/getProductAttribute";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { VariantID } = reqBody;

    // get product attributes
    const variantAttribute = await getProductAttribute(VariantID);
    if (!variantAttribute || variantAttribute.length === 0) {
      return NextResponse.json(
        { message: "No attributes found" },
        { status: 409 }
      );
    }

    return NextResponse.json(variantAttribute);
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}