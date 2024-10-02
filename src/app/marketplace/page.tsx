"use client";
import { useState, useEffect } from "react";
import { useSearchParams } from "next/navigation"; // Replace useRouter with useSearchParams

interface Product {
  ProductID: number;
  Title: string;
  CategoryID: number;
  category_name: string;
}

function MarketplacePage() {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const searchParams = useSearchParams(); // Use useSearchParams instead of useRouter
  const searchQuery = searchParams.get('search'); // Get the 'search' query parameter

  useEffect(() => {
    const fetchProducts = async () => {
      setLoading(true);
      try {
        // Send the search query in the request body as JSON
        const response = await fetch("/api/marketPlace", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ search: searchQuery || "" }),
        });

        const data = await response.json();

        if (data.products) {
          setProducts(data.products); // Set the products from the API
        } else {
          console.error('Unexpected API response format:', data);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, [searchQuery]);

  if (loading) return <div>Loading...</div>;

  return (
    <div className="flex flex-col my-3">
      <div className="grid grid-cols-1 gap-4 mx-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
        {products.map((product) => (
          <div key={product.ProductID} className="w-full m-3 card glass">
            <div className="card-body">
              <h2 className="card-title">{product.Title}</h2>
              <p>Category: {product.category_name}</p>
              <div className="justify-end card-actions">
                <button className="btn btn-primary">Buy Now</button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default MarketplacePage;
