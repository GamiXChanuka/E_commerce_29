import { NextResponse } from "next/server";

export async function POST() {
  const response = NextResponse.json({ message: "Logged out" }, { status: 200 });
  
  // Set the 'Set-Cookie' header to clear the cookie
  response.headers.set('Set-Cookie', 'token=; HttpOnly; Path=/; Max-Age=0; Secure');
  
  return response;
}
