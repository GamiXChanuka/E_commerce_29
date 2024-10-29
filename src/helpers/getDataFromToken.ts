import { NextRequest } from "next/server";
import jwt, {JwtPayload} from "jsonwebtoken";

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

export const getUserID = (token: string): string => {
  try {
    const decodedToken = jwt.decode(token) as JwtPayload;
    console.log("🚀 ~ getAdminNameFromToken ~ decodedToken:", decodedToken);

    return typeof decodedToken === 'object' && 'id' in decodedToken
      ? (decodedToken.id as string)
      : 'Not Authorized';
  } catch (error) {
    console.error('Invalid token', error);
    return 'Not Authorized';
  }
};

export const getUserName = (token: string): string => {
  try {
    const decodedToken = jwt.decode(token) as JwtPayload;
    console.log("🚀 ~ getUserName ~ decodedToken:", decodedToken)

    return typeof decodedToken === 'object' && 'id' in decodedToken
      ? (decodedToken.userName as string)
      : 'Not Authorized';
  } catch (error) {
    console.error('Invalid token', error);
    return 'Not Authorized';
  }
};


