import Link from 'next/link';
import React from 'react';
import { FaUserCircle, FaShoppingCart } from 'react-icons/fa';
import { useEffect, useState } from 'react';
import { useRouter } from "next/navigation"; // Use useRouter from next/navigation


export default function NavBar(){
//----------------------------------------------------------------------------------------------------------------------------
    const [loggedIn, setLoggedIn] = useState(false);
    const router = useRouter();

    // Helper function to retrieve cookie value


    const handleLogout = async () => {
      try {
          const res = await fetch("/api/logout", {
          method: "POST",
          headers: {
              "Content-Type": "application/json",
          },
          });

          if (res.ok) {
          // Manually clear the token from cookies
          document.cookie = "token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
          setLoggedIn(false); // Update state to reflect logged-out status

          }
          router.push("/"); // Redirect to the home page

      } catch (error) {
          console.error("Error during logout:", error);
      }
    };

//----------------------------------------------------------------------------------------------------------------------------

    const [userName, setUserName] = useState<string | null>(null);
    const [loading, setLoading] = useState<boolean>(true);

    useEffect(() => {
      // Fetch the user's data from the API route
      const fetchUserData = async () => {
        try {
          const response = await fetch('/api/homeNav');
          const data = await response.json();
  
          if (response.ok && data.username) {
            setUserName(data.username);
          } else {
            console.error('Error:', data.error);
            setUserName(null);
          }
        } catch (error) {
          console.error('Error fetching user data:', error);
          setUserName(null);
        } finally {
          setLoading(false);
        }
      };
  
      fetchUserData();
    }, []);
  
    if (loading) {
      return <p>Loading...</p>;
    }
  
  return (
    <nav className="py-4 bg-blue-600 shadow-md">
      <div className="container flex items-center justify-between mx-auto">
        {/* Logo */}
        <div className="text-3xl font-bold text-black">
          <a href="./">Shopzy</a>
        </div>

        {/* Navigation Links */}
        <div className="flex items-center space-x-6">
          <Link href="./" className="text-lg font-medium text-white hover:text-gray-300">Home</Link>
          <Link href="./marketplace" className="text-lg font-medium text-white hover:text-gray-300">Marketplace</Link>
          <Link href="./about" className="text-lg font-medium text-white hover:text-gray-300">About</Link>
          
        </div>

        {/* Search Bar and Icons */}
        <div className="flex">
            <input
                type="search"
                name="search"
                placeholder="Search..."
                className="h-10 px-4 pr-10 text-sm text-white bg-gray-800 rounded-full "
            />
        
            <div className="dropdown dropdown-end">

                <div tabIndex={0} role="button" className="ml-4 mr-2 btn btn-ghost btn-circle">
                    <div className="indicator">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        className="h-7 w-7 "
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth="2"
                        d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                    </svg>
                    <span className="badge badge-sm indicator-item">8</span>
                    </div>

                </div>

                <div
                    tabIndex={0}
                    className="card card-compact dropdown-content bg-base-100 z-[1] mt-3 min-w-12 shadow ">
                        <div className="card-body">
                            <span className="text-lg font-bold">8 Items</span>
                            <span className="text-info">Subtotal: $999</span>
                            <div className="card-actions">
                            <button className="btn btn-primary btn-block">View cart</button>
                            </div>
                        </div>

                        
                        {/* ================================== */}
                </div>
            </div>

            <div className="ml-6 dropdown dropdown-end">
                {userName ? (
                    <>
                    <div tabIndex={0} role="button" className="btn btn-ghost btn-circle avatar ml-7">
                        <div className="rounded-full w-11">
                        <img
                            alt="User Avatar"
                            src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp"
                        />
                        </div>
                    </div>
                    <div>
                        <ul
                        tabIndex={0}
                        className="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p- shadow bg-slate-600"
                        >
                        <li>
                            <a className="justify-between">
                            Profile
                            <span className="badge">New</span>
                            </a>
                        </li>
                        <li><a>Settings</a></li>
                        <li>
                            <button
                            onClick={handleLogout}
                            className="w-full px-3 py-2 text-center text-white transition duration-300 bg-red-500 rounded-lg hover:bg-red-600 focus:ring-2 focus:ring-red-400"
                            >
                            Logout
                            </button>
                        </li>
                        </ul>
                    </div>
                    </>
                ) : (
                    <div className="text-center">
                    <Link href="/auth/signup">
                        <button className="px-4 py-2 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                        Login/Signup
                        </button>
                    </Link>
                    </div>
                )}

            </div>

         </div>

        </div>
    </nav>
  );
};


