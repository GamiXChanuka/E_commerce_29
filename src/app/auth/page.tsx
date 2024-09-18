// pages/logout.tsx
"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";

export default function LogoutPage() {
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
    } catch (error) {
      console.error("Error during logout:", error);
    }
  };

  // if (!loggedIn) return null; // Don't show logout button if user is not logged in

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-50">
      <div className="w-full max-w-md p-6 text-center bg-white rounded-lg shadow-md">
        <h2 className="mb-4 text-3xl font-semibold text-blue-800">
          You're logged in!
        </h2>
        <button
          onClick={handleLogout}
          className="w-full p-3 text-white transition duration-300 bg-red-500 rounded-lg hover:bg-red-600 focus:ring-2 focus:ring-red-400"
        >
          Logout
        </button>
      </div>
    </div>
  );
}
