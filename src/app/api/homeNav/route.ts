// File: /app/api/user/route.ts
import { NextResponse, NextRequest } from "next/server";
import { getDataFromToken } from "@/helpers/getDataFromToken";
import { getUserNameById } from "@/models/userModel";


export async function GET(request: NextRequest) {

  const token = request.cookies.get("token")?.value || "";

  try {
    if (!token) {
      return NextResponse.json({ error: "No token found" }, { status: 401 });
    }
    const userId = await getDataFromToken(request);
    const Username = await getUserNameById(userId);
    if (!Username) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }
    return NextResponse.json( { username:Username }, { status: 200 } );
  } catch (error) {
    console.error("Error fetching user data:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 }
    );
  }
}
