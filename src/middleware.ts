import { NextResponse, NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  const path = request.nextUrl.pathname;

  const protectedPaths = ["/profile", "/profile/:path*"];

  const token = request.cookies.get("token")?.value || "";

  if (protectedPaths.some((protectedPath) => path.startsWith(protectedPath)) && !token) {
    return NextResponse.redirect(new URL("/login", request.nextUrl));
  }
}
