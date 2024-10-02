import { NextRequest, NextResponse } from "next/server";
import { getProductsByCategory, getAllProducts } from "@/models/productAction";

export async function POST(request: NextRequest) {
  try {
    // Check if there is a request body (JSON object)
    let products;

    const reqBody = await request.json().catch(() => null); // Catch if no JSON body
    if (reqBody && reqBody.category) {
      const { category } = reqBody;

      // Fetch products by category if category is provided
      products = await getProductsByCategory(category);
    } else {
      // Fetch all products if no category is provided
      products = await getAllProducts();
    }

    // Return products as a JSON response
    return NextResponse.json({ products }, { status: 200 });
  } catch (error: any) {
    console.error("Error fetching products:", error);

    // Return error response with detailed message
    return NextResponse.json(
      { message: "Error fetching products.", error: error.message },
      { status: 500 }
    );
  }
}
