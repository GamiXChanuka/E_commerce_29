import { NextRequest } from "next/server";
import jwt from "jsonwebtoken";

export function getDataFromToken(request: NextRequest) {
  try {
    const token = request.cookies.get("token")?.value || "";
    if (token) {
      const decodedToken = jwt.verify(token, process.env.JWT_SECRET!);
      
      if (typeof decodedToken === "object" && "id" in decodedToken) {
        return (decodedToken as jwt.JwtPayload).id;
      }
    }
    return null;

  } catch (error) {
    throw new Error("Error getting data from token");
  }
}
