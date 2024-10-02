// src/components/navbar/search/search.tsx

"use client"; // Ensure this is the first line in the file

import { useState } from "react";
import { useRouter } from "next/navigation"; // Use next/navigation

export default function NavigationBar() {
  const [searchTerm, setSearchTerm] = useState("");
  const router = useRouter(); // Correct usage of useRouter

  const handleSearch = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      const response = await fetch("/api/marketPlace", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ search: searchTerm }), // Send the search term in JSON format
      });
      console.log(response);

      if (response.ok) {
        const data = await response.json();
        // Navigate to marketplace and handle data as necessary
        console.log(searchTerm)
        router.push(`/marketplace?search=${encodeURIComponent(searchTerm)}`);
      } else {
        console.error("Failed to search products");
      }
    } catch (error) {
      console.error("Error during product search:", error);
    }
  };

  return (
    <nav>
      <form onSubmit={handleSearch}>
        <input
          type="text"
          placeholder="Search for products by category..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="search-input"
        />
        <button type="submit">Search</button>
      </form>
    </nav>
  );
}
