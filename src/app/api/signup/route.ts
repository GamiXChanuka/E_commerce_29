import { NextResponse, NextRequest } from "next/server";
import mysql from "mysql2/promise";
import bcrypt from 'bcrypt';

const connectionParams = {
  host: process.env.DB_Host,
  port: Number(process.env.DB_Port),
  user: process.env.DB_User,
  password: process.env.DB_Password,
  database: process.env.DB_Name,
};

export async function POST(request: NextRequest) {
  let connection;
  try {
    // Parse the request body
    const { username, email, password } = await request.json();

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create MySQL connection
    connection = await mysql.createConnection(connectionParams);

    // Check if username or email already exists
    const [existingUser]: [any[], any] = await connection.execute(
      `SELECT * FROM users WHERE username = ? OR email = ?`,
      [username, email]
    );

    if (existingUser.length > 0) {
      if (existingUser[0].username === username) {
        return NextResponse.json({ message: 'Username already taken' }, { status: 400 });
      }
      if (existingUser[0].email === email) {
        return NextResponse.json({ message: 'Email already registered' }, { status: 400 });
      }
    }

    // Insert new user into the database
    await connection.execute(
      `INSERT INTO users (username, email, password) VALUES (?, ?, ?)`,
      [username, email, hashedPassword]
    );

    // Return success response
    return NextResponse.json({ message: 'User registered successfully' }, { status: 200 });
  } catch (error) {
    console.error('Error registering user:', error);
    return NextResponse.json({ message: 'Error registering user', error: (error as Error).message }, { status: 500 });
  } finally {
    if (connection) {
      // Close the MySQL connection
      await connection.end();
    }
  }
}
