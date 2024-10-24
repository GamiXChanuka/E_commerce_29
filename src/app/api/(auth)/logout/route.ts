import { NextResponse } from "next/server";

export async function POST() {
  const response = NextResponse.json({ message: "Logged out" }, { status: 200 });
  
  try {
    const response = NextResponse.json(
      { message: "Logout successful", success: true },
      { status: 200 }
    );

    response.cookies.set("token", "", {
      httpOnly: true,
      secure: true,
      expires: new Date(0),
    });

    return response;
  } catch (error: any) {
    console.log("🚀 ~ GET ~ error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  
}
