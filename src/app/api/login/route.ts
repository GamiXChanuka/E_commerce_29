import { NextResponse, NextRequest } from "next/server";
import mysql from "mysql2/promise";
import bcrypt from 'bcrypt';
import jwt from "jsonwebtoken";

const connectionParams = {
  host: process.env.DB_Host,
  port: Number(process.env.DB_Port),
  user: process.env.DB_User,
  password: process.env.DB_Password,
  database: process.env.DB_Name,
};

export async function POST(request: NextRequest) {
  try {
    const { email, password } = await request.json();

    const connection = await mysql.createConnection(connectionParams);
    const [rows]: [any[], any] = await connection.execute(
      `SELECT * FROM users WHERE email = ?`,
      [email]
    );

    // Check if user exists
    if (rows.length === 0) {
      return NextResponse.json({ message: 'Invalid email or password' }, { status: 401 });
    }

    const user = rows[0]; // user will contain the user details such as id, email, etc.

    // Compare the password with the hashed password stored in the database
    const isMatch = await bcrypt.compare(password, user.password);

    // If the password doesn't match, return an error response
    if (!isMatch) {
      return NextResponse.json({ message: 'Invalid email or password' }, { status: 401 });
    }

    await connection.end();

    // Newly added code: Include user's `id` and `email` in the token
    const tokenData = {
      id: user.id,  // Adding the user's ID to the JWT payload
      email: email
    };

    // Create a JWT token that contains the user's `id` and `email`
    const token = jwt.sign(tokenData, process.env.JWT_SECRET!, {
      expiresIn: "1d", // Token expiration set to 1 day
    });

    // Send the JWT token to the client as part of the response
    const response = NextResponse.json(
      { message: "Login successful", token }, // The token will be returned in the response body
      { status: 200 }
    );

    // Newly added code: Manually set the JWT token in an HttpOnly cookie
    response.headers.set('Set-Cookie', `token=${token}; HttpOnly; Path=/; Max-Age=86400; Secure`);

    return response;

  } catch (error) {
    console.error('Error logging in:', error);
    return NextResponse.json({ message: 'Error logging in', error }, { status: 500 });
  }
}
