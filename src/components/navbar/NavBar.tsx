import React, { useEffect, useState } from "react";
import Link from "next/link";
import { FaUserCircle } from "react-icons/fa";
import { useRouter } from "next/navigation";
import axios from "axios";
import Image from "next/image";
import toast from "react-hot-toast";
import Search from "@/components/search/Search";
import CartSlider from "@/components/cartSlider/cartSlider"; // Import the Cart component
import { getUserName } from "@/helpers/getDataFromToken";
import { useCart } from "../context/CartContext";

export default function NavBar() {
  const [loggedIn, setLoggedIn] = useState(false);
  const [userName, setUserName] = useState<string | null>(null);
  const [isSticky, setIsSticky] = useState(false); // New state for stickiness
  const router = useRouter();
  const {clearCart} = useCart();
  

  // Fetch user data
  const fetchUserData = async () => {
    try {
      const token = localStorage.getItem("user");
      const userName = token ? getUserName(token) : "UnAuthorized";
      const isRegistered = localStorage.getItem("isRegistered") === "true";
      if (userName && isRegistered){
        setUserName(userName);
        setLoggedIn(true);
      } else {
        setUserName("UnAuthorized");
        setLoggedIn(false);
      }
    } catch (error) {
      console.error("Error fetching user data:", error);
      setUserName(null);
      setLoggedIn(false);
    }
  };

  useEffect(() => {
    fetchUserData();
  }, []);

  const handleLogout = async () => {
    try {
      await axios.post("/api/logout");
      toast.success("Logged out successfully");
      setLoggedIn(false);
      setUserName(null);
      localStorage.setItem("isRegistered", "false");
      localStorage.removeItem("user");
      clearCart();
      router.push("/");
    } catch (error: any) {
      toast.error("Failed to logout");
    }
  };

  // Handle sticky behavior on scroll
  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 80) {
        setIsSticky(true); // Become sticky after scrolling 80px down
      } else {
        setIsSticky(false); // Remove sticky effect when back at the top
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return (
    <nav
      className={`transition-all duration-300 py-4 bg-white shadow-md ${
        isSticky ? "fixed top-0 left-0 w-full z-50" : "relative"
      }`}
    >
      <div className="container flex items-center justify-between mx-auto">

      {/* Logo and Text */}
      <div className="flex items-center space-x-2 text-3xl font-bold text-gray-800">
        <a href="./" className="flex items-center space-x-2">
          <img 
            src="/login.png" // Path to your logo inside the public folder
            alt="Shopzy Logo"
            className="w-auto h-16" // Adjust height and width as needed
          />
          <span>Shopzy</span> {/* Text next to the logo */}
        </a>
      </div>


        {/* Navigation Links */}
        <div className="flex items-center space-x-6">
            <Link
            className="relative text-lg font-medium text-gray-800 hover:text-gray-600 group"
            href="/"
            >
            Home
            <span className="block h-0.5 bg-gray-800 absolute bottom-0 left-0 w-0 group-hover:w-full transition-all duration-300"></span>
            </Link>
            <Link
            href="/marketplace"
            className="relative text-lg font-medium text-gray-800 hover:text-gray-600 group"
            >
            Marketplace
            <span className="block h-0.5 bg-gray-800 absolute bottom-0 left-0 w-0 group-hover:w-full transition-all duration-300"></span>
            </Link>
            <Link
            href="/about"
            className="relative text-lg font-medium text-gray-800 hover:text-gray-600 group"
            >
            About
            <span className="block h-0.5 bg-gray-800 absolute bottom-0 left-0 w-0 group-hover:w-full transition-all duration-300"></span>
            </Link>
        </div>

        {/* Search - Cart - Profile */}
        <div className="flex justify-between">
          {/* Searchbox */}
          <Search />
          {/* Cart Component */}
          <CartSlider /> 
          {/* Profile or Login */}
          <div className="ml-6 dropdown dropdown-end">
            {loggedIn ? (
              <>
                <div
                  tabIndex={0}
                  role="button"
                  className="ml-1 btn btn-ghost btn-circle avatar"
                >
                    <Image
                      alt="User Avatar"
                      src="/user.png"
                      width={44} // Adjust width as needed
                      height={44} // Adjust height as needed
                      className="border rounded-full shadow-md"
                    />
                </div>
                <div>
                  <ul
                    tabIndex={0}
                    className="menu menu-sm dropdown-content bg-white z-[1] mt-3 w-52 shadow-lg gap-3"
                  >
                    <li>
                    <Link href="/profile">
                      <div className="flex items-center px-8 py-2 shadow-lg hover:bg-[#dde8f0] rounded-md">
                        <FaUserCircle className="inline-block w-6 h-6 text-gray-800" />
                        <div className="ml-2 text-gray-800">{userName}</div>
                      </div>
                    </Link>

                    </li>
                    <li>
                      <button
                        onClick={handleLogout}
                        className="px-6 py-2 text-red-600 transition duration-300 border border-red-600 rounded-md shadow-md hover:bg-red-100"
                        >
                        Logout
                      </button>
                    </li>
                  </ul>
                </div>
              </>
            ) : (
              <div className="text-center">
                <Link href="/signup">
                  <button className="px-4 py-2 mx-1 text-white bg-[#004581] rounded-lg hover:bg-[#018ABD]">
                    Signup
                  </button>
                </Link>
                <Link href="/login">
                  <button className="px-4 py-2 mx-1 text-white bg-[#004581] rounded-lg hover:bg-[#018ABD]">
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
