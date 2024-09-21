"use client";
import React, { useState, useEffect } from 'react';

interface Item {
  image_url: string;
  title: string;
  short_description: string;
}

function Page() {
  const [items, setItems] = useState<Item[]>([]);

  // Fetch data from the backend API
  useEffect(() => {
    const fetchItems = async () => {
      try {
        const response = await fetch('/api/products');
        if (!response.ok) {
          throw new Error(`Error: ${response.statusText}`);
        }
        const data = await response.json();

        // Ensure the structure of the API response
        if (Array.isArray(data)) {
          setItems(data); // Set the fetched data to state
        } else if (data.products) {
          setItems(data.products); // In case data is wrapped in an object
        } else {
          console.error('Unexpected API response format:', data);
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchItems();
  }, []);

  return (
    <div className="flex flex-col my-3">
      {/* Grid layout with 6 columns and gap */}
      <div className="grid grid-cols-1 gap-4 mx-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
        {items.map((item, index) => (
          <div key={index} className="w-full m-3 card glass">
            <figure>
              <img
                src={item.image_url}
                alt={item.title}
                className="object-cover"
              />
            </figure>
            <div className="card-body">
              <h2 className="card-title">{item.title}</h2>
              <p>{item.short_description}</p>
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

export default Page;
