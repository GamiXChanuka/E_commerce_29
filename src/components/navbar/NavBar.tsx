import Link from "next/link";
import React from "react";
import { FaUserCircle, FaShoppingCart } from "react-icons/fa";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation"; // Use useRouter from next/navigation
// import Image from "next/image";
import axios from "axios";
import toast from "react-hot-toast";
import Search from "@/components/search/Search";

export default function NavBar() {
  //----------------------------------------------------------------------------------------------------------------------------
  const [loggedIn, setLoggedIn] = useState(false); // track loggedIn state
  const [userName, setUserName] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const router = useRouter();

    // Function to check user data or session status
    const fetchUserData = async () => {
      try {
        const response = await axios.get("/api/homeNav");
        const data = response.data;
    
        if (response.status === 200 && data.username) {
          setUserName(data.username);
          setLoggedIn(true);
        } else {
          setUserName(null);
          setLoggedIn(false);
        }
      } catch (error) {
        console.error("Error fetching user data:", error);
        setUserName(null);
        setLoggedIn(false);
      } finally {
        setLoading(false);
      }
    };

  // Fetch user session data on component mount
  useEffect(() => {
    fetchUserData();
  }, []);

  const handleLogout = async () => {
    try {
      await axios.post("/api/logout");
      toast.success("Logged out successfully");
      setLoggedIn(false); // Set loggedIn to false
      setUserName(null); // Clear the userName
      router.push("/");
    } catch (error: any) {
      console.log("🚀 ~ logout ~ error:", error);
      toast.error("Failed to logout");
    }
  };


  return (
    <nav className="py-4 bg-gray-800 shadow-md">
      <div className="container flex items-center justify-between mx-auto">
        {/* Logo */}
        <div className="text-3xl font-bold text-white ">
          <a href="./">Shopzy</a>
        </div>

        {/* Navigation Links */}
        <div className="flex items-center space-x-6">
          <Link
            className="text-lg font-medium text-white hover:text-gray-300"
            href="/"
          >
            Home
          </Link>
          <Link
            href="/marketplace"
            className="text-lg font-medium text-white hover:text-gray-300"
          >
            Marketplace
          </Link>
          <Link
            href="/about"
            className="text-lg font-medium text-white hover:text-gray-300"
          >
            About
          </Link>
        </div>
        
        {/*--------------------------------------------- Search -------- Card ------------Profile Icon---------------------- */}
        <div className="flex justify-between">
            {/* ---------------------------------Searchbox--------------------------------------------------------------- */}
            {/* <div className="relative flex items-center">
              <input
                  type="search"
                  name="search"
                  placeholder="Search..."
                  className="h-12 pl-5 text-sm text-white placeholder-white transition-all duration-300 ease-in-out transform rounded-full shadow-lg min-w-48 pr-14 bg-gradient-to-r from-gray-500 via-gray-600 to-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2 hover:scale-105"
              />
              <svg
                  className="absolute w-6 h-6 text-gray-300 pointer-events-none right-4"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
              >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div> */}
            <Search />

                
            {/* -----------------------------------Card Button--------------------------------------------------------------- */}

            <div className="dropdown dropdown-end dropdown-hover">
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
                {/* ----------------Dropdown menu of card---------------------------------- */}
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
                </div>

            </div>
            {/* ------------------------profile icon or login button--------------------------------- */}
            <div className="ml-6 dropdown dropdown-end">
              {loggedIn? (
                <>
                  <div
                    tabIndex={0}
                    role="button"
                    className="ml-1 btn btn-ghost btn-circle avatar"
                  >
                    <div className="rounded-full w-11">
                      <img
                        alt="User Avatar"
                        src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp"
                      />
                      {/* <Image
                        src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp"
                        alt="User Avatar"
                        width={20}
                        height={20}
                        className="rounded-badge"
                      /> */}
                    </div>
                  </div>
                  <div>
                    <ul
                      tabIndex={0}
                      className="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p- shadow bg-slate-600"
                    >
                      <li>
                        <div>
                          <FaUserCircle className="inline-block w-6 h-6" />

                          <Link href="/profile">
                            <div className="justify-between">
                              {userName}
                              {/* <span className="badge">New</span> */}
                            </div>
                          </Link>
                        </div>
                      </li>
                      <li>
                        <a>Settings</a>
                      </li>
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
                <div className="text-center ">
                  <Link href="/signup">
                    <button className="px-4 py-2 mx-1 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                      Signup
                    </button>
                  </Link>
                  <Link href="/login">
                    <button className="px-4 py-2 mx-1 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                      Login
                    </button>
                  </Link>
                </div>
              )}
            </div>
        </div>


        </div>
    </nav>
  );
}
