"use client";

import { useEffect, useState } from "react";
import axios from "axios";
import React from "react";
import toast from "react-hot-toast";
import { useRouter } from "next/navigation";

const ProfilePage = () => {
  const router = useRouter();

  const logout = async () => {
    try {
      await axios.post("/api/logout");
      toast.success("Logged out successfully");
      router.push("/");
    } catch (error: any) {
      console.log("🚀 ~ logout ~ error:", error)
      toast.error("Failed to logout");
    }
  };

  const [user, setUser] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchUserProfile = async () => {
      try {
        const response = await axios.get("/api/profile");
        setUser(response.data);
      } catch (err) {
        console.log("Error fetching user profile:", err);
        setError((err as Error).message);
      } finally {
        setLoading(false);
      }
    };

    fetchUserProfile();
  }, []);

  if (loading) return <p>Loading...</p>;

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-900 py-6 px-4">
      <div className="w-full max-w-md bg-gray-800 p-8 rounded-lg shadow-lg flex flex-col">
        <h1 className="text-3xl text-white font-bold mb-6 text-center">
          Profile
        </h1>
        <hr className="border-gray-600 mb-6" />

        {user && !error ? (
          <>
            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Username:</p>
                <p>{user.UserName}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">First Name:</p>
                <p>{user.FirstName}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Last Name:</p>
                <p>{user.LastName}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Phone Number:</p>
                <p>{user.PhoneNumber}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Email:</p>
                <p>{user.Email}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Address Number:</p>
                <p>{user.AddressNumber}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Lane:</p>
                <p>{user.Lane}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">City:</p>
                <p>{user.City}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">Postal Code:</p>
                <p>{user.PostalCode}</p>
              </div>
              <div className="grid grid-cols-2 gap-4 text-white">
                <p className="font-semibold">District:</p>
                <p>{user.District}</p>
              </div>
            </div>

            <button
              className="bg-green-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded my-5"
              onClick={logout}
            >
              Logout
            </button>
          </>
        ) : (
          <p className="text-center text-red-500">No user data available</p>
        )}
      </div>
    </div>
  );
};

export default ProfilePage;
