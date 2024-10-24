import { NextResponse, NextRequest } from "next/server";
import { addAddress } from "@/models/addressAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { AddressNumber, Lane, City, PostalCode, District } = reqBody;

    // Add address
    const result = await addAddress({ AddressNumber, Lane, City, PostalCode, District });

    // Return the appropriate response
    if (!result || !result.message || !result.AddressID) {
      return NextResponse.json({ error: "Failed to add address" }, { status: 500 });
    } else {
      return NextResponse.json({ success: result.message, AddressID: result.AddressID }, { status: 200 });
    }

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}