import { NextResponse, NextRequest } from "next/server";
import { getVariant } from "@/models/unRegCartAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { VariantID } = reqBody;

    // get variant details
    const variantDetails = await getVariant(VariantID);
    if (!variantDetails || variantDetails.length === 0) {
      return NextResponse.json(
        { message: "Variant not found!" },
        { status: 409 }
      );
    }

    return NextResponse.json(variantDetails);
  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}