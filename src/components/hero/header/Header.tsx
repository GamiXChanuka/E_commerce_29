"use client";

import { useEffect, useState } from 'react';
import axios from 'axios';
import Link from 'next/link';

// Import Swiper for the slideshow
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';
import { Pagination, Navigation, Autoplay } from 'swiper/modules';

const HomePageProductSlideshow = () => {
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
    // Fetch all products without a search query using axios POST
    const fetchProducts = async () => {
      try {
        setLoading(true);
        
        const response = await axios.post('/api/marketPlace', {
          category: "", // No search query, fetch all products
        });
        
        let allProducts = response.data.products;
        
        // Randomly select 10 products
        let randomProducts = allProducts
          .sort(() => 0.5 - Math.random())
          .slice(0, 10);
        
        setProducts(randomProducts);
        setLoading(false);
      } catch (err) {
        setError('Error fetching products');
        setLoading(false);
      }
    };

    fetchProducts();
  }, []);

  return (
    <section className="py-8 antialiased bg-gray-200 dark:bg-gray-200 md:py-12">
      <div className="max-w-screen-xl px-4 mx-auto 2xl:px-0">
        <h2 className="mb-8 text-xl font-semibold text-center text-gray-900 dark:text-gray-800 sm:text-2xl">Featured Products</h2>
        
        {loading ? (

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5">
          {[1, 2, 3, 4, 5].map((n) => (
            <div
              key={n}
              className="p-4 transition-transform duration-500 transform bg-gray-200 rounded-lg shadow-lg"
            >
              <div className="animate-pulse">
                <div className="mb-4 bg-gray-300 rounded-lg h-72"></div>
                <div className="w-3/4 h-6 mx-auto mb-2 bg-gray-300 rounded"></div>
                <div className="w-1/2 h-4 mx-auto bg-gray-300 rounded"></div>
              </div>
            </div>
          ))}
        </div>

        ) : error ? (
          <p className="text-center text-red-500">{error}</p>
        ) : products.length > 0 ? (
          <Swiper
            slidesPerView={1}
            spaceBetween={20}
            autoplay={{ delay: 10000, disableOnInteraction: false }}
            pagination={{ clickable: true }}
            navigation={true}
            modules={[Autoplay, Navigation]}
            className="mySwiper"
            breakpoints={{
              640: { slidesPerView: 2, spaceBetween: 20 },
              768: { slidesPerView: 3, spaceBetween: 30 },
              1024: { slidesPerView: 5, spaceBetween: 10 },
            }}
          >
            {products.map((product) => (
              <SwiperSlide key={product.ProductID}>
        <div className="transition-transform duration-500 transform bg-white rounded-lg shadow-lg hover:scale-105 dark:bg-gray-50 dark:border-gray-600 dark:text-gray-300 h-[450px] w-full flex flex-col justify-between">
            <figure className="h-60">
              <img
                src={product.image_link}
                alt={product.Title}
                className="object-cover w-64 h-64 rounded-t-lg"
              />
            </figure>
            <div className="flex flex-col justify-between flex-1 p-4">
              <h2 className="text-lg font-semibold text-center text-gray-800 dark:text-gray-600">
                {product.Title}
              </h2>
              <p className="text-center text-gray-600 dark:text-gray-500">
                Price: Rs {product.Price}
              </p>
              <div className="flex justify-center mt-2">
                <button className="bg-[#004581] text-white p-2 rounded-lg w-full mt-4 hover:bg-[#018ABD]">
                  <Link href={`/marketplace/${product.ProductID}`}>View Product</Link>
                </button>
              </div>
            </div>
          </div>

              </SwiperSlide>
            ))}
              </Swiper>
        ) : (


          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5">
          {[1, 2, 3, 4, 5].map((n) => (
            <div
              key={n}
              className="p-4 transition-transform duration-500 transform bg-gray-200 rounded-lg shadow-lg"
            >
              <div className="animate-pulse">
                <div className="mb-4 bg-gray-300 rounded-lg h-72"></div>
                <div className="w-3/4 h-6 mx-auto mb-2 bg-gray-300 rounded"></div>
                <div className="w-1/2 h-4 mx-auto bg-gray-300 rounded"></div>
              </div>
            </div>
          ))}
        </div>


        )}
      </div>
    </section>
  );
};

export default HomePageProductSlideshow;
