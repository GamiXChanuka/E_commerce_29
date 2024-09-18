// File: /app/api/user/route.ts
import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import jwt from 'jsonwebtoken';

// Database connection parameters
const connectionParams = {
  host: process.env.DB_Host,
  port: Number(process.env.DB_Port),
  user: process.env.DB_User,
  password: process.env.DB_Password,
  database: process.env.DB_Name,
};

export async function GET(request: Request) {
  const cookies = request.headers.get('cookie') || '';
  const token = cookies
    .split('; ')
    .find((row) => row.startsWith('token='))
    ?.split('=')[1];

  if (!token) {
    return NextResponse.json({ error: 'No token found' }, { status: 401 });
  }

  try {
    // Decode the token
    const decodedToken = jwt.verify(token, process.env.JWT_SECRET!);
    const userId = (decodedToken as { id: number }).id;

    // Create a connection to the database
    const connection = await mysql.createConnection(connectionParams);

    // Query the database for the user's name based on the user ID
    const [rows]: [mysql.RowDataPacket[], any] = await connection.execute(
      'SELECT username FROM users WHERE id = ?',
      [userId]
    );

    await connection.end();

    if (rows.length > 0) {
      return NextResponse.json({ username: rows[0].username });
    } else {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }
  } catch (error) {
    console.error('Error fetching user data:', error);
    return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 });
  }
}
