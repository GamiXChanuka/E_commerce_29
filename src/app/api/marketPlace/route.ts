

import { getProducts } from "@/models/productAction";
import { getProductsByTitle } from "@/models/getProductsByTitle";
import { NextResponse } from "next/server";
import { NextRequest } from "next/server";
// import { mergeProductsWithVariants } from "@/helpers/mergeArray";
import { removeDuplicateItems } from "@/helpers/removeDuplicates";

export async function POST(request: NextRequest) {
  try {
    // Extract the 'category' query parameter from the request URL
    const reqBody = await request.json();
    const { category } = reqBody;

    // Fetch the items from the database (products)
    const products = await getProducts(category);
    const tproducts = await getProductsByTitle(category);
    console.log("products by title", tproducts);
    console.log("products by category", products);

    const combinedProducts = [...(Array.isArray(tproducts) ? tproducts : []), ...(Array.isArray(products) ? products : [])];
    console.log("combined products", combinedProducts);

    // Remove duplicate items
    const uniqueProducts = removeDuplicateItems(combinedProducts);
    console.log("unique products", uniqueProducts);

    // Return the items as a JSON response
    return NextResponse.json({ products: uniqueProducts }, { status: 200 });
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