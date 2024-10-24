import { NextResponse, NextRequest } from "next/server";
import { addUserAndGetCartID } from "@/models/userAction";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { PhoneNumber, FirstName, LastName, Role } = reqBody;

    // Add user and get cart ID
    const result = await addUserAndGetCartID({ PhoneNumber, FirstName, LastName, Role });

    // Return the appropriate response
    if ( result && result.message) {
      
      return NextResponse.json({ success: result.message, UserID: result.UserID, CartID: result.CartID }, { status: 200 });
    } else {
        return NextResponse.json({ error: result.message }, { status: 500 });
    }

  } catch (error: any) {
    console.log("🚀 ~ POST ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}