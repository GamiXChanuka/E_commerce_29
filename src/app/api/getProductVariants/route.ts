import { NextResponse, NextRequest } from "next/server";
import { getProductVariants } from "@/models/getProductVariants";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { ProductCategoryID } = reqBody;

    // get cart details
    const variantList = await getProductVariants(ProductCategoryID);
    console.log("variant list ",variantList)
    if (!variantList) {
      return NextResponse.json(
        { message: "No variants " },
        { status: 409 }
      );
    }

    return NextResponse.json(variantList);
    

  } catch (error: any) {
      console.log("🚀 ~ POST ~ error:", error)
      return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
