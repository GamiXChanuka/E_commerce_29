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
    CategoryName: string;
    image_link: string;
    Price: string;
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
    <div className="flex flex-col my-6">
      <h1 className="py-4 mb-8 text-4xl font-bold text-center text-gray-200 bg-blue-600">Marketplace</h1>
      {loading && <p className="text-center text-gray-500">Loading...</p>}
      {error && <p className="text-center text-red-500">{error}</p>}
      
      {/* Grid layout with 6 columns and gap */}
      <div className="grid grid-cols-1 gap-6 mx-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
        {products.length > 0 ? (
          products.map((product) => (
            <div key={product.ProductID} className="m-3 transition-transform duration-300 transform bg-white rounded-lg shadow-lg card hover:scale-105 glass">
              <figure>
                <img
                  src={product.image_link}
                  alt={product.Title}
                  className="object-cover w-full h-64 rounded-t-lg"
                />
              </figure>
              <div className="p-4 card-body">
                <h2 className="text-lg font-semibold text-gray-800 card-title">{product.Title}</h2>
                <p className="text-gray-600">Price: € {product.Price}</p>
                <div className="justify-end mt-4 card-actions">
                  <button className="px-4 py-2 text-white transition-colors duration-300 bg-blue-500 rounded-lg btn hover:bg-blue-600">
                    Buy Now
                  </button>
                </div>
              </div>
            </div>
          ))
        ) : (
          !loading && <p className="text-center text-gray-500">No products found</p>
        )}
      </div>
    </div>
  );
};

export default MarketplacePage;