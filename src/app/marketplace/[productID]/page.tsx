// "use client"

// import { useState, useEffect } from 'react';
// import axios from 'axios';

// interface Variant {
//   VariantID: number;
//   VariantName: string;
//   Description: string;
//   SKU: string;
//   Price: string;
//   StockCount: number;
//   ImageLink: string;
//   Attributes?: Attribute[];
// }

// interface Attribute {
//   VariantID: number;
//   AttributeValue: string;
//   AttributeName: string;
// }

// interface ProductDetailsPageProps {
//   params: {
//     productID: string;
//   };
// }

// const ProductDetailsPage = ({ params }: ProductDetailsPageProps) => {
//   const { productID } = params; // Get productID from route params
//   const [productVariants, setProductVariants] = useState<Variant[]>([]);
//   const [selectedVariant, setSelectedVariant] = useState<Variant | null>(null);
//   const [loading, setLoading] = useState(false);
//   const [error, setError] = useState('');

//   useEffect(() => {
//     if (productID) {
//       fetchProductDetails();
//     }
//   }, [productID]);

//   // Fetch product details and variants based on productID
//   const fetchProductDetails = async () => {
//     setLoading(true);
//     try {
//       const response = await axios.post('/api/getProductVariants', {
//         ProductCategoryID: productID,
//       });

//       const variants = response.data;
//       setProductVariants(variants);

//       // Fetch attributes for each variant
//       for (const v of variants) {
//         try {
//           const attributeResponse = await axios.post('/api/getAttribute', {
//             VariantID: v.VariantID,
//           });
//           v.Attributes = attributeResponse.data; // Store attributes in the variant
//         } catch (err) {
//           console.error(`Error fetching attributes for variant ${v.VariantID}`, err);
//         }
//       }

//       if (variants.length > 0) {
//         setSelectedVariant(variants[0]); // Select the first variant by default
//       }
//       setLoading(false);
//     } catch (err) {
//       setError('Error fetching product details');
//       setLoading(false);
//     }
//   };

//   // Handle variant button click
//   const handleVariantClick = (variant: Variant) => {
//     setSelectedVariant(variant);
//   };

//   // Add selected variant to cart
//   const addToCart = () => {
//     if (selectedVariant) {
//       console.log('Adding to cart:', selectedVariant);
//       // Add your logic here to handle adding to the cart
//     }
//   };

//   if (loading) {
//     return <p>Loading...</p>;
//   }

//   if (error) {
//     return <p>{error}</p>;
//   }

//   return (
//     <div className="container p-6 mx-auto">
//       {selectedVariant ? (
//         <div className="p-6 bg-white rounded-lg shadow-lg">
//           <div className="flex">
//             <img
//               src={selectedVariant.ImageLink}
//               alt={selectedVariant.VariantName}
//               className="w-1/2 rounded-lg"
//             />
//             <div className="w-1/2 ml-6">
//               <h1 className="text-3xl font-bold">{selectedVariant.VariantName}</h1>
//               <p className="mt-2 text-gray-600">{selectedVariant.Description}</p>
//               <p className="mt-4 text-xl font-semibold">Price: € {selectedVariant.Price}</p>
//               <p className={`mt-2 ${selectedVariant.StockCount > 0 ? 'text-green-600' : 'text-red-600'}`}>
//                 {selectedVariant.StockCount > 0 ? 'In Stock' : 'Out of Stock'}
//               </p>
              
//               {/* Variant Buttons */}
//               <div className="mt-4">
//                 <h3 className="text-lg font-semibold">Choose a variant:</h3>
//                 {productVariants.map((variant, index) => (
//                   <button
//                     key={index}
//                     className="p-2 mt-2 mr-2 bg-gray-200 border rounded hover:bg-gray-300"
//                     onClick={() => handleVariantClick(variant)}
//                   >
//                     {variant.Attributes?.map(attr => `${attr.AttributeName}: ${attr.AttributeValue}`).join(', ')}
//                   </button>
//                 ))}
//               </div>

//               {/* Add to Cart Button */}
//               <button
//                 className="px-4 py-2 mt-6 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
//                 onClick={addToCart}
//                 disabled={selectedVariant.StockCount === 0}
//               >
//                 Add to Cart
//               </button>
//             </div>
//           </div>
//         </div>
//       ) : (
//         <p>No product details found</p>
//       )}
//     </div>
//   );
// };

// export default ProductDetailsPage;


"use client";

import { useState, useEffect } from "react";
import axios from "axios";
import toast from "react-hot-toast";

interface Variant {
  VariantID: number;
  VariantName: string;
  Description: string;
  SKU: string;
  Price: string;
  StockCount: number;
  ImageLink: string;
  Attributes?: Attribute[];
}

interface Attribute {
  VariantID: number;
  AttributeValue: string;
  AttributeName: string;
}

interface ProductDetailsPageProps {
  params: {
    productID: string;
  };
}

const ProductDetailsPage = ({ params }: ProductDetailsPageProps) => {
  const { productID } = params; // Get productID from route params
  const [productVariants, setProductVariants] = useState<Variant[]>([]);
  const [selectedVariant, setSelectedVariant] = useState<Variant | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    if (productID) {
      fetchProductDetails();
    }
  }, [productID]);

  // Fetch product details and variants based on productID
  const fetchProductDetails = async () => {
    setLoading(true);
    try {
      const response = await axios.post("/api/getProductVariants", {
        ProductCategoryID: productID,
      });

      const variants = response.data;
      setProductVariants(variants);

      // Fetch attributes for each variant
      for (const v of variants) {
        try {
          const attributeResponse = await axios.post("/api/getAttribute", {
            VariantID: v.VariantID,
          });
          v.Attributes = attributeResponse.data; // Store attributes in the variant
        } catch (err) {
          console.error(`Error fetching attributes for variant ${v.VariantID}`, err);
        }
      }

      if (variants.length > 0) {
        setSelectedVariant(variants[0]); // Select the first variant by default
      }
      setLoading(false);
    } catch (err) {
      setError("Error fetching product details");
      setLoading(false);
    }
  };

  // Handle variant button click
  const handleVariantClick = (variant: Variant) => {
    setSelectedVariant(variant);
  };

  // Add selected variant to cart
  const addToCart = async () => {
    if (selectedVariant) {
      console.log("Adding to cart:", selectedVariant);
      // Add your logic here to handle adding to the cart

      const requestBody = {
        op: "add", // The operation can be "add" or whatever is needed
        VariantID: selectedVariant.VariantID, // Use the selected variant's ID
        cartId: 1 // Hardcoded cartId as 1
      };
  
      try {
        // Make the API call to add to the cart
        const response = await fetch("/api/setCart", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(requestBody)
        });
  
        // Handle the response
        const data = await response.json();
        
        if (response.ok) {
          toast.success("Product added to cart!");
          console.log("Cart updated successfully:", data);
          // You can add additional logic here, such as showing a success message
        } else {
          toast.error(data.error || "Failed to add product to cart");
          console.error("Error updating cart:", data.error);
          // Handle error here, such as showing an error message to the user
        }
      } catch (error) {
        toast.error("An error occurred while adding to cart");
        console.error("An error occurred while adding to the cart:", error);
        // Handle fetch errors here
      }
    }
  };

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>{error}</p>;
  }

  return (
    <section className="py-8 antialiased bg-white md:py-16 dark:bg-white">
      <div className="max-w-screen-xl px-4 mx-auto 2xl:px-0">
        <div className="lg:grid lg:grid-cols-2 lg:gap-8 xl:gap-16">
          <div className="max-w-md mx-auto shrink-0 lg:max-w-lg">
            <img
              className="w-full dark:hidden"
              src={selectedVariant?.ImageLink || ""}
              alt={selectedVariant?.VariantName || "Product image"}
            />
            <img
              className="hidden w-full dark:block"
              src={selectedVariant?.ImageLink || ""}
              alt={selectedVariant?.VariantName || "Product image"}
            />
          </div>

          <div className="mt-6 sm:mt-8 lg:mt-0">
            <h1 className="text-xl font-semibold text-gray-900 sm:text-2xl dark:text-black">
              {selectedVariant?.VariantName}
            </h1>
            <p className="mt-4 text-gray-600 dark:text-gray-400">
              {selectedVariant?.Description}
            </p>
            <div className="mt-4 sm:items-center sm:gap-4 sm:flex">
              <p className="text-2xl font-extrabold text-gray-900 sm:text-3xl dark:text-black">
                Rs.{selectedVariant?.Price}
              </p>

              <div className="flex items-center gap-2 mt-2 sm:mt-0">
                <p className="text-sm font-medium text-gray-500 dark:text-gray-400">
                  Stock:{" "}
                  {(selectedVariant?.StockCount ?? 0) > 0 ? (
                    <span className="text-green-600">In Stock</span>
                  ) : (
                    <span className="text-red-600">Out of Stock</span>
                  )}
                </p>
              </div>
            </div>

            <div className="mt-6 sm:gap-4 sm:items-center sm:flex sm:mt-8">
              {productVariants.length > 0 && (
                <div>
                  <h3 className="text-lg font-semibold text-black">Choose a variant:</h3>
                  {productVariants.map((variant, index) => (
                    <button
                    key={index}
                    className="text-blue-700 hover:text-white border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-blue-500 dark:text-blue-500 dark:hover:text-white dark:hover:bg-blue-500 dark:focus:ring-blue-800 focus:ring-blue-800"
                    onClick={() => handleVariantClick(variant)} // When clicked, call handleVariantClick with the variant
                  >
                    {variant.Attributes?.map(
                      (attr) => `${attr.AttributeName}: ${attr.AttributeValue}`
                    ).join(", ")}
                  </button>

                  ))}
                </div>
              )}
            </div>

            <div className="mt-6 sm:gap-4 sm:items-center sm:flex sm:mt-8">
              <button
                className="flex items-center justify-center py-2.5 px-5 text-sm font-medium text-gray-100 focus:outline-none bg-blue-500 rounded-lg border border-gray-200 hover:bg-blue-700 hover:text-primary-700  "
                onClick={addToCart}
                disabled={selectedVariant?.StockCount === 0}
              >
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default ProductDetailsPage;
