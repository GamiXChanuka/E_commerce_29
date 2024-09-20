"use client";

import Link from "next/link";
import React from "react";
import { useRouter } from "next/navigation";
import axios from "axios";
import toast from "react-hot-toast";
import { useForm } from "react-hook-form";

// Interface for form inputs
interface SignUpFormInputs {
  firstName: string;
  lastName: string;
  userName: string;
  phoneNumber: string;
  email: string;
  password: string;
  confirmPassword: string;
  addressNumber: string;
  lane: string;
  city: string;
  postalCode: string;
  district: string;
}

const SignUpPage = () => {
  const router = useRouter();
  
  // Using react-hook-form for form management
  const {
    register,
    handleSubmit,
    formState: { errors },
    watch,
  } = useForm<SignUpFormInputs>();

  const onSignUp = async (data: any) => {
    try {
      const response = await axios.post("/api/signup", data);
      console.log("Signup successful", response.data);
      router.push("/auth/login");
      toast.success(response.data.message);
    } catch (error: any) {
      console.log(error);
      toast.error(error.response?.data.message || error.message);
    }
  };

  // Watch for password and confirm password for real-time validation
  const password = watch("password");

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-50">
      <div className="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
        <h1 className="text-3xl text-blue-800 font-semibold mb-6 text-center">
          Signup
        </h1>
        <hr className="border-gray-300 mb-6" />

        <form onSubmit={handleSubmit(onSignUp)} className="space-y-4">
          {/* User Section */}
          <div className="flex gap-4">
            <div className="w-1/2">
              <label htmlFor="firstName" className="block text-sm font-medium text-gray-700">
                First Name
              </label>
              <input
                className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
                id="firstName"
                type="text"
                {...register("firstName", { required: "First name is required" })}
                placeholder="First Name"
              />
              {errors.firstName && (
                <p className="text-red-500 text-sm">{errors.firstName.message}</p>
              )}
            </div>
            <div className="w-1/2">
              <label htmlFor="lastName" className="block text-sm font-medium text-gray-700">
                Last Name
              </label>
              <input
                className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
                id="lastName"
                type="text"
                {...register("lastName", { required: "Last name is required" })}
                placeholder="Last Name"
              />
              {errors.lastName && (
                <p className="text-red-500 text-sm">{errors.lastName.message}</p>
              )}
            </div>
          </div>

          <label htmlFor="userName" className="block text-sm font-medium text-gray-700">
            Username
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="userName"
            type="text"
            {...register("userName", { required: "Username is required" })}
            placeholder="Username"
          />
          {errors.userName && (
            <p className="text-red-500 text-sm">{errors.userName.message}</p>
          )}

          <label htmlFor="phoneNumber" className="block text-sm font-medium text-gray-700">
            Phone Number
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="phoneNumber"
            type="text"
            {...register("phoneNumber", { required: "Phone number is required" })}
            placeholder="Phone Number"
          />
          {errors.phoneNumber && (
            <p className="text-red-500 text-sm">{errors.phoneNumber.message}</p>
          )}

          {/* Email and Password Section */}
          <label htmlFor="email" className="block text-sm font-medium text-gray-700">
            Email
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="email"
            type="email"
            {...register("email", {
              required: "Email is required",
              pattern: {
                value: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
                message: "Invalid email format",
              },
            })}
            placeholder="Email"
          />
          {errors.email && (
            <p className="text-red-500 text-sm">{errors.email.message}</p>
          )}

          <div className="flex gap-4">
            <div className="w-1/2">
              <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                Password
              </label>
              <input
                className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
                id="password"
                type="password"
                {...register("password", {
                  required: "Password is required",
                  minLength: { value: 6, message: "Password must be at least 6 characters long" },
                })}
                placeholder="Password"
              />
              {errors.password && (
                <p className="text-red-500 text-sm">{errors.password.message}</p>
              )}
            </div>
            <div className="w-1/2">
              <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700">
                Confirm Password
              </label>
              <input
                className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
                id="confirmPassword"
                type="password"
                {...register("confirmPassword", {
                  required: "Please confirm your password",
                  validate: (value) =>
                    value === password || "Passwords do not match",
                })}
                placeholder="Confirm Password"
              />
              {errors.confirmPassword && (
                <p className="text-red-500 text-sm">{errors.confirmPassword.message}</p>
              )}
            </div>
          </div>

          {/* Address Section */}
          <label htmlFor="addressNumber" className="block text-sm font-medium text-gray-700">
            Address Number
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="addressNumber"
            type="text"
            {...register("addressNumber", { required: "Address number is required" })}
            placeholder="Address Number"
          />
          {errors.addressNumber && (
            <p className="text-red-500 text-sm">{errors.addressNumber.message}</p>
          )}

          <label htmlFor="lane" className="block text-sm font-medium text-gray-700">
            Lane
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="lane"
            type="text"
            {...register("lane", { required: "Lane is required" })}
            placeholder="Lane"
          />
          {errors.lane && <p className="text-red-500 text-sm">{errors.lane.message}</p>}

          {/* City, Postal Code, District */}
          <label htmlFor="city" className="block text-sm font-medium text-gray-700">
            City
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="city"
            type="text"
            {...register("city", { required: "City is required" })}
            placeholder="City"
          />
          {errors.city && <p className="text-red-500 text-sm">{errors.city.message}</p>}

          <label htmlFor="postalCode" className="block text-sm font-medium text-gray-700">
            Postal Code
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="postalCode"
            type="text"
            {...register("postalCode", { required: "Postal code is required" })}
            placeholder="Postal Code"
          />
          {errors.postalCode && (
            <p className="text-red-500 text-sm">{errors.postalCode.message}</p>
          )}

          <label htmlFor="district" className="block text-sm font-medium text-gray-700">
            District
          </label>
          <input
            className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            id="district"
            type="text"
            {...register("district", { required: "District is required" })}
            placeholder="District"
          />
          {errors.district && (
            <p className="text-red-500 text-sm">{errors.district.message}</p>
          )}

          {/* Signup Button */}
          <button
            type="submit"
            className="w-full py-3 bg-blue-800 text-white font-semibold rounded-lg hover:bg-blue-700 transition-colors"
          >
            Sign Up
          </button>

          {/* Link to Login */}
          <p className="text-sm text-center text-gray-600">
            Already have an account?{" "}
            <Link href="/auth/login" className="text-blue-500 hover:underline">
              Login
            </Link>
          </p>
        </form>
      </div>
    </div>
  );
};

export default SignUpPage;
