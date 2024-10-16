import { NextResponse, NextRequest } from "next/server";
import { getUserInfo } from "@/models/userAction";
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
    console.log("🚀 ~ GET ~ userInfo:", userInfo)

    return NextResponse.json(userInfo);
  } catch (error: any) {
    if (error.sqlState === '45000') {
      return NextResponse.json({ message: error.message  }, { status: 404 });
  }

  return NextResponse.json({ message: 'Fail to fetch the data' }, { status: 500 });

    
  }
}
