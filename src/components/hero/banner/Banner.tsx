// import React from 'react'

// function Banner() {
//   return (
// <div className="p-6 py-12 text-gray-900 bg-violet-400 dark:bg-violet-600 dark:text-gray-50">
// 	<div className="container mx-auto">
// 		<div className="flex flex-col items-center justify-between lg:flex-row">
// 			<h2 className="text-6xl font-bold tracking-tighter text-center">Up to
// 				<br  className="sm:hidden" />50% Off
// 			</h2>
// 			<div className="py-2 space-x-2 text-center lg:py-0">
// 				<span>Plus free shipping! Use code:</span>
// 				<span className="text-lg font-bold">Group29</span>
// 			</div>
// 			<a href="./marketplace" rel="noreferrer noopener" className="block px-5 py-3 mt-4 text-gray-900 border border-gray-400 rounded-md lg:mt-0 bg-gray-50 dark:bg-gray-900 dark:text-gray-50 dark:border-gray-600">Shop Now</a>
// 		</div>
// 	</div>
// </div>
//   )
// }

// export default Banner


"use client"
import { useState, useEffect } from 'react';

const BannerCarousel = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const banners = [
    '/header/1.jpg', // replace with your banner URLs
    '/header/2.jpg',
    '/header/3.jpg',
  ];

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % banners.length);
    }, 3000); // Slide every 2 seconds
    return () => clearInterval(interval);
  }, [banners.length]);

  return (
    <div className="flex items-center justify-center h-auto mt-8"> {/* Full viewport height minus header */}
      <div className="relative w-3/4 overflow-hidden h-80"> {/* Slideshow container */}
        {banners.map((banner, index) => (
          <img
            key={index}
            src={banner}
            alt={`Banner ${index + 1}`}
            className={`absolute w-full h-full object-cover transition-opacity duration-1000 ${index === currentIndex ? 'opacity-100' : 'opacity-0'}`}
          />
        ))}
        <div className="absolute flex space-x-2 transform -translate-x-1/2 bottom-4 left-1/2">
          {banners.map((_, index) => (
            <span
              key={index}
              className={`w-2 h-2 rounded-full ${index === currentIndex ? 'bg-black' : 'bg-gray-400'}`}
            />
          ))}
        </div>
      </div>
    </div>
  );
};

export default BannerCarousel;
