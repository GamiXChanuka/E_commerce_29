import { NextResponse, NextRequest } from "next/server";
import bcryptjs from "bcryptjs";
import { getUserByEmail } from "@/models/userModel";
import jwt from "jsonwebtoken";

export async function POST(request: NextRequest) {
  try {
    const reqBody = await request.json();
    const { email, password } = reqBody;

    //check if the user already exists
    const existingUser = await getUserByEmail(email);
    if (!existingUser) {
      return NextResponse.json(
        { message: "Email or Password is incorrect" },
        { status: 409 }
      );
    }

    // check if the password is correct
    const isPasswordCorrect = await bcryptjs.compare(
      password,
      existingUser.Password
    );
    
    if (!isPasswordCorrect) {
      return NextResponse.json(
        { message: "Invalid password" },
        { status: 401 }
      );
    }

    //create token data
    const tokenData = {
      id: existingUser.UserID,
      email: existingUser.Email,
    };

    //create a token
    const token = jwt.sign(tokenData, process.env.JWT_SECRET!, {
      expiresIn: "1d",
    });

    const response = NextResponse.json(
      { message: "Login successful", token },
      { status: 200 }
    );
    response.cookies.set("token", token, {
        httpOnly: true,
        secure: true,
        
    });
    //store token in the local storage
    return response;

  } catch (error: any) {
      console.log("🚀 ~ POST ~ error:", error)
      return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
