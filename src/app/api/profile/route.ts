import { NextResponse, NextRequest } from "next/server";
import { getUserInfo } from "@/models/userModel";
import { getDataFromToken } from "@/helpers/getDataFromToken";

export async function GET(request: NextRequest) {
  try {
    // Extract token from cookies
    const token = request.cookies.get("token")?.value || "";
    if (!token) {
      throw new Error("No token found from backend");
    }

    const userId = await getDataFromToken(request);
    const userInfo = await getUserInfo(userId);

    return NextResponse.json(userInfo);
  } catch (error) {

    console.error("Error fetching user profile:", error);
    return NextResponse.error();
    
  }
}
