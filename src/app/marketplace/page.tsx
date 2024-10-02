"use client";

import { useSearchParams } from 'next/navigation';
import { useEffect, useState } from 'react';
import axios from 'axios';

const MarketplacePage = () => {
  const searchParams = useSearchParams();
  const searchQuery = searchParams.get('search'); // Get the search query from the URL
  
  interface Product {
    ProductID: number;
    Title: string;
    CategoryID: number;
    category_name: string;
  }
  
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    // Fetch products based on the search query using axios POST
    const fetchProducts = async () => {
      try {
        setLoading(true);
        
        const response = await axios.post('/api/marketPlace', {
          category: searchQuery, // Send the search query as JSON
        });
        
        setProducts(response.data.products); // Assuming the API returns an object with a products array
        setLoading(false);
      } catch (err) {
        setError('Error fetching products');
        setLoading(false);
      }
    };

    if (searchQuery) {
      fetchProducts();
    } else {
      // Fetch all products if no search query is provided
      const fetchAllProducts = async () => {
        try {
          setLoading(true);
          
          const response = await axios.post('/api/marketPlace');
          
          setProducts(response.data.products); // Fetch all products if no search query is provided
          setLoading(false);
        } catch (err) {
          setError('Error fetching products');
          setLoading(false);
        }
      };
      
      fetchAllProducts();
    }
  }, [searchQuery]);

  return (
    <div>
      <h1>Marketplace</h1>
      {loading && <p>Loading...</p>}
      {error && <p>{error}</p>}
      <div>
        {products.length > 0 ? (
          products.map((product) => (
            <div key={product.ProductID}>
              <h2>{product.Title}</h2>
              <p>Category: {product.category_name}</p>
              <p>Product ID: {product.ProductID}</p>
            </div>
          ))
        ) : (
          !loading && <p>No products found</p>
        )}
      </div>
    </div>
  );
};

export default MarketplacePage;
