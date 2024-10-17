"use client";
import React, { useState, useEffect } from "react";
import { motion } from "framer-motion";
import Link from "next/link";
import {
  MapPinIcon,
  UserIcon,
  ShoppingBagIcon,
  AtSymbolIcon,
  HomeIcon,
  PhoneIcon,
  ArrowLeftStartOnRectangleIcon,
  Cog8ToothIcon,
  LockClosedIcon,
} from "@heroicons/react/24/outline";
import axios from "axios";
import Spinner from "@/components/spinner/Spinner";
import { toast } from "react-hot-toast";

// Define the type for the form fields
type FormFields = {
  firstName: string;
  lastName: string;
  email: string;
  addressNo: string;
  lane: string;
  contactNumber: string;
  city: string;
  district: string;
  userName: string;
  postalCode: string;
};

const ProfilePage = () => {
  // State for form inputs
  const [formData, setFormData] = useState<FormFields>({
    firstName: "",
    lastName: "",
    email: "",
    addressNo: "",
    lane: "",
    contactNumber: "",
    city: "",
    district: "",
    userName: "",
    postalCode: "",
  });

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Fetch user data from the API
  useEffect(() => {
    const fetchUserProfile = async () => {
      try {
        const response = await axios.get("/api/profile"); // Call to the backend API
        const data = response.data;

        // Update form data with fetched data
        setFormData({
          firstName: data.FirstName,
          lastName: data.LastName,
          email: data.Email,
          addressNo: data.AddressNumber,
          lane: data.Lane,
          contactNumber: data.PhoneNumber,
          city: data.City,
          district: data.District,
          userName: data.UserName,
          postalCode: data.PostalCode,
        });
      } catch (error: any) {
        console.log("🚀 ~ fetchUserProfile ~ error:", error);
        console.error("Error fetching user profile:", error);
        setError(error.response?.data.message || error.message);
      } finally {
        setLoading(false);
      }
    };

    fetchUserProfile();
  }, []);

  // Handle form input change
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const onLogout = async () => {
    try {
      await axios.post("/api/logout");
      window.location.href = "/login"; // Redirect to login page after logout
      toast.success("Logged out successfully!");
    } catch (error) {
      console.error("Error logging out:", error);
      toast.error("Failed to log out. Please try again.");
    }
  };

  // Handle form submission
  // const handleSave = (event: React.FormEvent) => {
  //   event.preventDefault();
  //   alert('Profile saved!'); // Replace with actual save logic
  // };

  // Handle cancel action
  // const handleCancel = () => {
  //   window.location.href = '/'; // Redirect to home (you can customize this)
  // };

  if (loading) return <Spinner />;
  if (error) return <p>{error}</p>;

  return (
    <div className="flex min-h-screen bg-[#e6e7eb]">
      {/* Sidebar */}


      <aside className="w-1/5 bg-[#004581] p-6 shadow-lg rounded-lg">
        <nav>
          <ul className="space-y-4">
            <li>
              <Link href="#" className="flex items-center text-white font-bold hover:text-[#97CBDC] transition duration-300">
                  <UserIcon className="w-5 h-5 mr-2" /> Your Profile
              </Link>
            </li>
            <li>
              <Link href="#" className="flex items-center text-[#97CBDC] hover:text-[#018ABD] transition duration-300">
                  <ShoppingBagIcon className="w-5 h-5 mr-2" /> Your Orders
              </Link>
            </li>
            <li>
              <Link href="#" className="flex items-center text-[#97CBDC] hover:text-[#018ABD] transition duration-300">
                  <Cog8ToothIcon className="w-5 h-5 mr-2" /> Settings
              </Link>
            </li>
            <li>
              <Link href="#" className="flex items-center text-[#97CBDC] hover:text-[#018ABD] transition duration-300">
                  <LockClosedIcon className="w-5 h-5 mr-2" /> Security
              </Link>
            </li>
            <li>
              <button
                onClick={onLogout}
                className="flex items-center text-red-600 hover:text-red-400 transition duration-300"
              >
                <ArrowLeftStartOnRectangleIcon className="w-5 h-5 mr-2" /> Logout
              </button>
            </li>
          </ul>
        </nav>
        <div className="mt-10">
          <Link href="/" className="text-gray-300 text-sm flex items-center hover:text-[#97CBDC] transition duration-300">
              <span className="mr-2">🏠</span> Back to Home
          </Link>
        </div>
      </aside>

      {/* Main Content */}
      <div className="w-4/5 p-10 shadow-lg rounded-lg bg-white">
        <div className="flex justify-between mb-4 items-baseline">
          <h1 className="text-3xl font-semibold mb-2 text-[#004581]">
            Hello, <span className="p-12">{formData.userName} !!!!</span>{" "}
          </h1>
          {/* User Avatar */}
          <motion.img
            alt="User Avatar"
            src="./user.jpeg"
            className="rounded-full w-28 h-28 border border-[#018ABD] shadow-md hover:scale-105 transition-transform"
          />
        </div>
        <p className="mb-8 text-lg text-gray-600">
          Welcome to your profile page! You can view your personal
          information below.
        </p>

        {/* Form for Input Fields */}
        <form className="space-y-6">
          {/* Input Fields */}
          {[
            { label: "First Name", name: "firstName", icon: UserIcon },
            { label: "Last Name", name: "lastName", icon: UserIcon },
            { label: "Email", name: "email", icon: AtSymbolIcon },
            { label: "Contact Number", name: "contactNumber", icon: PhoneIcon },
            { label: "Address No.", name: "addressNo", icon: HomeIcon },
            { label: "Lane", name: "lane", icon: HomeIcon },
            { label: "City", name: "city", icon: MapPinIcon },
            { label: "District", name: "district", icon: MapPinIcon },
            { label: "Postal Code", name: "postalCode", icon: MapPinIcon },
          ].map((field, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ duration: 0.3 }}
              className={`grid grid-cols-[auto_1fr] gap-x-4 gap-y-6`}
            >
              <field.icon className="w-6 h-6 text-[#004581] mt-[0.25rem]" />
              <div>
                <label className="block text-sm font-medium text-[#004581]">
                  {field.label}
                </label>
                <input
                  type={field.name === "email" ? "email" : "text"}
                  name={field.name}
                  value={formData[field.name as keyof FormFields]}
                  onChange={handleChange}
                  className="mt-1 p-3 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                  placeholder={`Enter your ${field.label.toLowerCase()}`}
                  // disable all fields
                  disabled
                />
              </div>
            </motion.div>
          ))}

          {/* Action Buttons */}
          {/* <div className="flex justify-between mt-6">
            <button
              type="button"
              className="px-6 py-2 border border-red-600 text-red-600 rounded-md hover:bg-red-100 transition duration-300 shadow-md"
              onClick={handleCancel}
            >
              Cancel
            </button>
            <button
              type="submit"
              className="px-6 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD] transition duration=300 shadow-md"
            >
              Save
            </button>
          </div> */}
        </form>
      </div>
    </div>
  );
};

export default ProfilePage;
