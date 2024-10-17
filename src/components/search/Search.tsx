"use client";

import { useRouter } from 'next/navigation';
import { useState, useEffect } from 'react';

const SearchComponent = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const router = useRouter();

  useEffect(() => {
    const delayDebounceFn = setTimeout(() => {
      // If the searchTerm is empty, reset the search parameter
      if (searchTerm.trim() === "") {
        // Reset to marketplace without a search query
        // router.push('/marketplace');
      } else {
        // Otherwise, update the URL with the search term
        router.push(`/marketplace?search=${searchTerm}`);
      }
    }, 500); // Debounce delay of 500ms

    return () => clearTimeout(delayDebounceFn);
  }, [searchTerm, router]);

  return (
    <div className="relative flex items-center">
      <input
        type="text"
        name="search"
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        placeholder="Search products"
        className="h-12 pl-5 text-sm text-white placeholder-white transition-all duration-300 ease-in-out transform rounded-full shadow-lg min-w-48 pr-14 bg-gradient-to-r from-[#004581] via-[#018ABD] to-[#97CBDC] focus:outline-none focus:ring-2"
      />
      <svg
        className="absolute w-6 h-6 text-gray-300 pointer-events-none right-4"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
      </svg>
    </div>
  );
};

export default SearchComponent;
