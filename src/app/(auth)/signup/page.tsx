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

  const {
    register,
    handleSubmit,
    formState: { errors },
    watch,
  } = useForm<SignUpFormInputs>();

  const onSignUp = async (data: SignUpFormInputs) => {
    try {
      const response = await axios.post("/api/signup", data);
      console.log("Signup successful", response.data);
      router.push("/login");
      toast.success(response.data.message);
    } catch (error: any) {
      console.log(error);
      toast.error(error.response?.data.message || error.message);
    }
  };

  const password = watch("password");

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-900">
      <div className="w-full max-w-4xl p-6 bg-gray-800 rounded-lg shadow-lg">
        <h1 className="mb-6 text-3xl font-bold text-center text-white">Sign Up</h1>
        <hr className="mb-6 border-gray-600" />
        <form onSubmit={handleSubmit(onSignUp)} className="space-y-6">
          <div className="flex gap-8">
            {/* Right Column */}
            <div className="w-1/2">
              <div className="flex gap-4">
                <div className="w-1/2 ">
                  <label htmlFor="firstName" className="block text-sm font-medium text-gray-200">
                    First Name
                  </label>
                  <input
                    className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    id="firstName"
                    type="text"
                    {...register("firstName", { required: "First name is required" })}
                    placeholder="First Name"
                  />
                  {errors.firstName && (
                    <p className="text-sm text-red-500">{errors.firstName.message}</p>
                  )}
                </div>
                <div className="w-1/2">
                  <label htmlFor="lastName" className="block text-sm font-medium text-gray-200">
                    Last Name
                  </label>
                  <input
                    className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    id="lastName"
                    type="text"
                    {...register("lastName", { required: "Last name is required" })}
                    placeholder="Last Name"
                  />
                  {errors.lastName && (
                    <p className="text-sm text-red-500">{errors.lastName.message}</p>
                )}
                </div>
              {/* ------------------------------------------------------------------------------------------------------------------------ */}
              </div>


              <label htmlFor="userName" className="block mt-4 text-sm font-medium text-gray-200">
                Username
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="userName"
                type="text"
                {...register("userName", { required: "Username is required" })}
                placeholder="Username"
              />
              {errors.userName && (
                <p className="text-sm text-red-500">{errors.userName.message}</p>
              )}

              <label htmlFor="phoneNumber" className="block mt-4 text-sm font-medium text-gray-200">
                Phone Number
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="phoneNumber"
                type="text"
                {...register("phoneNumber", { required: "Phone number is required" })}
                placeholder="Phone Number"
              />
              {errors.phoneNumber && (
                <p className="text-sm text-red-500">{errors.phoneNumber.message}</p>
              )}

              <label htmlFor="email" className="block mt-4 text-sm font-medium text-gray-200">
                Email
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
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
                <p className="text-sm text-red-500">{errors.email.message}</p>
              )}

              <div className="flex gap-6 mt-4">
                <div className="w-1/2">
                  <label htmlFor="password" className="block text-sm font-medium text-gray-200">
                    Password
                  </label>
                  <input
                    className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    id="password"
                    type="password"
                    {...register("password", {
                      required: "Password is required",
                      minLength: { value: 6, message: "Password must be at least 6 characters long" },
                    })}
                    placeholder="Password"
                  />
                  {errors.password && (
                    <p className="text-sm text-red-500">{errors.password.message}</p>
                  )}
                </div>

                <div className="w-1/2">
                  <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-200">
                    Confirm Password
                  </label>
                  <input
                    className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
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
                    <p className="text-sm text-red-500">{errors.confirmPassword.message}</p>
                  )}
                </div>
              </div>
            </div>
            
            {/* Left Column */}
            <div className="w-1/2">
              <label htmlFor="addressNumber" className="block text-sm font-medium text-gray-200">
                Address Number
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="addressNumber"
                type="text"
                {...register("addressNumber", { required: "Address number is required" })}
                placeholder="Address Number"
              />
              {errors.addressNumber && (
                <p className="text-sm text-red-500">{errors.addressNumber.message}</p>
              )}

              <label htmlFor="lane" className="block mt-4 text-sm font-medium text-gray-200">
                Lane
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="lane"
                type="text"
                {...register("lane", { required: "Lane is required" })}
                placeholder="Lane"
              />
              {errors.lane && <p className="text-sm text-red-500">{errors.lane.message}</p>}

              <label htmlFor="city" className="block mt-4 text-sm font-medium text-gray-200">
                City
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="city"
                type="text"
                {...register("city", { required: "City is required" })}
                placeholder="City"
              />
              {errors.city && <p className="text-sm text-red-500">{errors.city.message}</p>}

              <label htmlFor="postalCode" className="block mt-4 text-sm font-medium text-gray-200">
                Postal Code
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="postalCode"
                type="text"
                {...register("postalCode", { required: "Postal code is required" })}
                placeholder="Postal Code"
              />
              {errors.postalCode && (
                <p className="text-sm text-red-500">{errors.postalCode.message}</p>
              )}

              <label htmlFor="district" className="block mt-4 text-sm font-medium text-gray-200">
                District
              </label>
              <input
                className="w-full p-3 text-white bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                id="district"
                type="text"
                {...register("district", { required: "District is required" })}
                placeholder="District"
              />
              {errors.district && (
                <p className="text-sm text-red-500">{errors.district.message}</p>
              )}
            </div>


          </div>

          <button
            type="submit"
            className="w-full py-3 font-semibold text-white bg-blue-600 rounded-lg hover:bg-blue-500"
          >
            Sign Up
          </button>
        </form>

        <div className="mt-4 text-center">
          <p className="text-sm text-gray-400">
            Already have an account?{" "}
            <Link href="/login" className="text-blue-400 hover:underline">
              Login
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
};

export default SignUpPage;
