"use client";

import { useSearchParams } from 'next/navigation';
import { useEffect, useState } from 'react';
import axios from 'axios';
import Link from 'next/link';

const MarketplacePage = () => {
  const searchParams = useSearchParams();
  const searchQuery = searchParams.get('search'); // Get the search query from the URL
  
  interface Product {
    ProductCategoryID: any;
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
          
          const response = await axios.post('/api/marketPlace', {
            category: "", // Send the search query as JSON
          });          
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
    // <div className="flex flex-col my-6">
    //   <h1 className="py-4 mb-8 text-4xl font-bold text-center text-gray-200 bg-blue-600">Marketplace</h1>
    //   {loading && <p className="text-center text-gray-500">Loading...</p>}
    //   {error && <p className="text-center text-red-500">{error}</p>}
      
    //   {/* Grid layout with 6 columns and gap */}
    //   <div className="grid grid-cols-1 gap-6 mx-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
    //     {products.length > 0 ? (
    //       products.map((product) => (
    //         <div key={product.ProductID} className="m-3 transition-transform duration-300 transform bg-white rounded-lg shadow-lg card hover:scale-105 glass">
    //           <figure>
    //             <img
    //               src={product.image_link}
    //               alt={product.Title}
    //               className="object-cover w-full h-64 rounded-t-lg"
    //             />
    //           </figure>
    //           <div className="p-4 card-body">
    //             <h2 className="text-lg font-semibold text-gray-800 card-title">{product.Title}</h2>
    //             <p className="text-gray-600">Price: € {product.Price}</p>
    //             <div className="justify-end mt-4 card-actions">
    //               <button className="px-4 py-2 text-white transition-colors duration-300 bg-blue-500 rounded-lg btn hover:bg-blue-600">
    //                 Buy Now
    //               </button>
    //             </div>
    //           </div>
    //         </div>
    //       ))
    //     ) : (
    //       !loading && <p className="text-center text-gray-500">No products found</p>
    //     )}
    //   </div>
    // </div>

// -------------------------------------------------------------------------------------------------


    <section className="py-8 antialiased bg-gray-200 dark:bg-gray-200 md:py-12">
      <div className="max-w-screen-xl px-4 mx-auto 2xl:px-0">
        {/* Heading & Filters */}
        <div className="items-end justify-between mb-4 space-y-4 sm:flex sm:space-y-0 md:mb-8">
          <div>
            {/* Breadcrumb */}
            <nav className="flex" aria-label="Breadcrumb">
              <ol className="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                <li className="inline-flex items-center">
                  <a href="#" className="inline-flex items-center text-sm font-medium text-black hover:text-primary-600 dark:text-black dark:hover:text-white">
                    <svg className="mr-2.5 h-3 w-3" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path d="M19.707 9.293l-2-2-7-7a1 1 0 00-1.414 0l-7 7-2 2a1 1 0 001.414 1.414L2 10.414V18a2 2 0 002 2h3a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1h3a2 2 0 002-2v-7.586l.293.293a1 1 0 001.414-1.414z" />
                    </svg>
                    Home
                  </a>
                </li>
                <li>
                  <div className="flex items-center">
                    <svg className="w-5 h-5 text-gray-400 rtl:rotate-180" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                    </svg>
                    <a href="#" className="ml-1 text-sm font-medium text-black hover:text-primary-600 dark:text-black dark:hover:text-white md:ml-2">
                      Products
                    </a>
                  </div>
                </li>
                <li aria-current="page">
                  <div className="flex items-center">
                    <svg className="w-5 h-5 text-gray-400 rtl:rotate-180" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                    </svg>
                    <span className="ml-1 text-sm font-medium text-black dark:text-black md:ml-2">Electronics</span>
                  </div>
                </li>
              </ol>
            </nav>
            <h2 className="mt-3 text-xl font-semibold text-gray-900 dark:text-gray-800 sm:text-2xl">Electronics</h2>
          </div>

          {/* Filters and Sort */}
          <div className="flex items-center space-x-4">
            <button
              type="button"
              className="flex items-center justify-center px-3 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-primary-700 focus:outline-none focus:ring-4 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-800 dark:text-white dark:hover:bg-white dark:hover:text-white"
            >
              <svg className="w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M18.796 4H5.204a1 1 0 00-.753 1.659l5.302 6.058a1 1 0 01.247.659v4.874a.5.5 0 00.2.4l3 2.25a.5.5 0 00.8-.4v-7.124a1 1 0 01.247-.659l5.302-6.059c.566-.646.106-1.658-.753-1.658z" />
              </svg>
              Filters
            </button>

            <button
              type="button"
              className="flex items-center justify-center px-3 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-primary-700 focus:outline-none focus:ring-4 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-800 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white"
            >
              <svg className="w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M7 4l3 3M7 4L4 7m9-3h6l-6 6h6m-6.5 10l3.5-7 3.5 7M14 18h4" />
              </svg>
              Sort
            </button>
          </div>
        </div>

        {/* Product Cards */}
        <div className="grid grid-cols-1 gap-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
          {loading ? (
            <p className="text-center text-gray-500">Loading...</p>
          ) : error ? (
            <p className="text-center text-red-500">{error}</p>
          ) : products.length > 0 ? (
            products.map((product) => (
              <div key={product.ProductID} className="m-4 transition-transform duration-500 transform bg-white rounded-lg shadow-lg min-w-44 hover:scale-105 dark:bg-gray-50 dark:border-gray-600 dark:text-gray-300">
                <figure>
                  <img
                    src={product.image_link}
                    alt={product.Title}
                    className="object-cover p-4 rounded-t-lg h-60 min-h-fit "
                  />
                </figure>
                <div className="p-4">
                  <h2 className="text-lg font-semibold text-center text-gray-800 dark:text-gray-600">{product.Title}</h2>
                  <p className="text-center text-gray-600 dark:text-gray-500">Price: € {product.Price}</p>
                  <div className="flex justify-center mt-2">
                    <button className="px-3 py-2 text-white bg-blue-500 rounded-lg hover:bg-blue-600 dark:bg-blue-600 dark:hover:bg-blue-700">
                      <Link href={`/marketplace/${product.ProductCategoryID}`} >View Product</Link>
                    </button>
                  </div>
                </div>
              </div>
            ))
          ) : (
            <p className="text-center text-gray-500">No products found</p>
          )}
        </div>
      </div>
    </section>

  );
};

export default MarketplacePage;