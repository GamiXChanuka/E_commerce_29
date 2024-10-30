import { getProducts } from "@/models/productAction";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
  try {
    // Fetch the items from the database (products)
    const products = await getProducts();

    // Return the items as a JSON response
    return NextResponse.json({ products }, { status: 200 });
    
  } catch (error) {
    console.error('Error fetching data:', error);
    return new Response(JSON.stringify({ message: 'Error fetching data' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}
