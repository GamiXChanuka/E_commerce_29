import { NextResponse, NextRequest } from "next/server";
import { getProductVariants } from "@/models/getProductVariants";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { ProductID } = reqBody;

    // get product variants
    const variantList = await getProductVariants(ProductID);
    console.log("variant list ", variantList);
    if (!variantList || variantList.length === 0) {
      return NextResponse.json(
        { message: "No variants found" },
        { status: 409 }
      );
    }

    return NextResponse.json(variantList);
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}