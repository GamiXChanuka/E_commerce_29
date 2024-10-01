// src/app/api/getproduct/route.ts

import { getProducts } from "@/models/productAction";
import { NextResponse } from "next/server";
import { NextRequest } from "next/server";

export async function POST(request: NextRequest) {
  try {
    // Extract the 'category' query parameter from the request URL
    const reqBody = await request.json();
    const { category  } = reqBody;

    // Fetch the items from the database (products)
    const products = await getProducts(category);

    // Return the items as a JSON response
    return NextResponse.json({ products }, { status: 200 });
    
  } catch (error: any) {
    console.error('Error fetching data:', error);
    return new NextResponse(
      JSON.stringify({ message: 'Error fetching data' }),
      {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      }
    );
  }
}
