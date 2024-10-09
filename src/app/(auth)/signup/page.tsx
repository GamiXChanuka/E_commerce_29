"use client";

import React, { useState } from "react";
import { useForm, SubmitHandler } from "react-hook-form";
import toast from "react-hot-toast";
import axios from "axios";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { motion } from "framer-motion";

// Define types for form inputs
type FormData = {
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
  district: string;
  postalCode: string;
};

// Motion variants for animating transitions
const variants = {
  enter: {
    opacity: 0,
    x: 100,
  },
  center: {
    opacity: 1,
    x: 0,
  },
  exit: {
    opacity: 0,
    x: -100,
  },
};

const SignupPage = () => {
  const [currentStep, setCurrentStep] = useState(0);
  const router = useRouter();

  // Hook form setup
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<FormData>();

  const nextStep = (data: FormData) => {
    console.log("Step data validated:", data);
    setCurrentStep((prev) => prev + 1);
  };

  const prevStep = () => setCurrentStep((prev) => prev - 1);

  const onSignUp: SubmitHandler<FormData> = async (data) => {
    console.log("Form data submitted:", data);

    // Convert undefined values to null
    const sanitizedData = Object.fromEntries(
      Object.entries(data).map(([key, value]) => [key, value ?? null])
    );

    try {
      const response = await axios.post("/api/signup", sanitizedData);
      console.log("Signup successful", response.data);
      router.push("/login");
      toast.success(response.data.message);
    } catch (error: any) {
      console.log(error);
      toast.error(error.response?.data.message || error.message);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100">
      {/* Outer container with sidebar and form content */}
      <div className="bg-white rounded-lg shadow-xl w-4/5 max-w-3xl flex">
        {/* Sidebar */}
        <div className="w-1/3 bg-gray-200 text-gray-800 p-8 rounded-l-lg flex flex-col justify-between overflow-y-auto">
          <div>
            <h2 className="text-3xl font-bold mb-8">Sign Up</h2>
            <ul className="space-y-5">
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 ${
                  currentStep === 0 ? "bg-gray-800 text-white" : "text-gray-500 hover:bg-gray-300"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(0)}
              >
                <span className="text-1xl">1</span>
                <span>Welcome!</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 ${
                  currentStep === 1 ? "bg-gray-800 text-white" : "text-gray-500 hover:bg-gray-300"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(1)}
              >
                <span className="text-1xl">2</span>
                <span>Personal Information</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 ${
                  currentStep === 2 ? "bg-gray-800 text-white" : "text-gray-500 hover:bg-gray-300"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(2)}
              >
                <span className="text-1xl">3</span>
                <span>Set Your Password</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 ${
                  currentStep === 3 ? "bg-gray-800 text-white" : "text-gray-500 hover:bg-gray-300"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(3)}
              >
                <span className="text-1xl">4</span>
                <span>Address Information</span>
              </li>
            </ul>
          </div>
          {/* Persistent "Do you have an account?" link */}
          <div className="mt-6">
            <Link
              href="/login"
              className="text-gray-600 hover:underline text-[14px]"
            >
              Do you have an account? Login here
            </Link>
          </div>
          {/* if currentStep != 0 do not render button */}
          {currentStep === 0 && (
            <button
              onClick={() => nextStep({} as FormData)}
              className="mt-6 px-8 py-3 bg-gray-800 text-gray-300 rounded-md shadow hover:bg-gray-400 transition-colors duration-300"
            >
              Get Started
            </button>
          )}
        </div>

        {/* Form section */}
        <div className="w-2/3 min-h-[500px] relative overflow-hidden">
          <motion.div
            key={currentStep}
            variants={variants}
            initial="enter"
            animate="center"
            exit="exit"
            transition={{ duration: 0.5 }}
            className="absolute w-full h-full"
          >
            {currentStep === 0 && (
              <div className="text-center">
                <div className="w-full h-full flex justify-center items-center">
                  <img
                    src="signup.png"
                    alt="Welcome Image"
                    className="w-full h-full object-cover rounded-md shadow"
                  />
                </div>
              </div>
            )}

            {currentStep === 1 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form className="space-y-6 p-8" onSubmit={handleSubmit(nextStep)}>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      First Name
                    </label>
                    <input
                      type="text"
                      {...register("firstName", {
                        required: "First name is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.firstName && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.firstName.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Last Name
                    </label>
                    <input
                      type="text"
                      {...register("lastName", {
                        required: "Last name is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.lastName && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.lastName.message}
                      </p>
                    )}
                  </div>
                  {/* user name  */}
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      User Name
                    </label>
                    <input
                      type="text"
                      {...register("userName", {
                        required: "User name is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.userName && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.userName.message}
                      </p>
                    )}
                  </div>
                  {/* phone number */}
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Phone Number
                    </label>
                    <input
                      type="text"
                      {...register("phoneNumber", {
                        required: "Phone number is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.phoneNumber && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.phoneNumber.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Email
                    </label>
                    <input
                      type="email"
                      {...register("email", {
                        required: "Email is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.email && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.email.message}
                      </p>
                    )}
                  </div>
            
                  {/* Step navigation */}
                  <div className="flex justify-between">
                    <button
                      type="button"
                      className="px-4 py-2 bg-gray-300 text-gray-600 rounded-md hover:bg-gray-400"
                      onClick={prevStep}
                    >
                      Back
                    </button>
                    <button
                      type="submit"
                      className="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700"
                    >
                      Next
                    </button>
                  </div>
                </form>
              </div>
            )}            
           {currentStep === 2 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form className="space-y-6 p-8" onSubmit={handleSubmit(nextStep)}>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Password
                    </label>
                    <input
                      type="password"
                      {...register("password", {
                        required: "Password is required",
                        minLength: {
                          value: 8,
                          message: "Password must be at least 8 characters long",
                        },
                        pattern: {
                          value: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                          message:
                            "Password must include uppercase, lowercase, number, and special character",
                        },
                      })}
                      className="w-full px-4 py-2 mt-1 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.password && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.password.message}
                      </p>
                    )}
                  </div>
            
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Confirm Password
                    </label>
                    <input
                      type="password"
                      {...register("confirmPassword", {
                        required: "Please confirm your password",
                        validate: (value) =>
                          value === watch("password") || "Passwords do not match",
                      })}
                      className="w-full px-4 py-2 mt-1 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.confirmPassword && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.confirmPassword.message}
                      </p>
                    )}
                  </div>
            
                  <div className="flex justify-between">
                    <button
                      type="button"
                      className="px-4 py-2 bg-gray-300 text-gray-600 rounded-md hover:bg-gray-400"
                      onClick={prevStep}
                    >
                      Back
                    </button>
                    <button
                      type="submit"
                      className="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700"
                    >
                      Next
                    </button>
                  </div>
                </form>
              </div>
            )}
            
            {currentStep === 3 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form className="space-y-6 p-8" onSubmit={handleSubmit(onSignUp)}>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Address Number
                    </label>
                    <input
                      type="text"
                      {...register("addressNumber", {
                        required: "Address number is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.addressNumber && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.addressNumber.message}
                      </p>
                    )}
                  </div>
            
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Lane
                    </label>
                    <input
                      type="text"
                      {...register("lane", {
                        required: "Lane is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.lane && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.lane.message}
                      </p>
                    )}
                  </div>
            
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      City
                    </label>
                    <input
                      type="text"
                      {...register("city", {
                        required: "City is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.city && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.city.message}
                      </p>
                    )}
                  </div>
            
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      District
                    </label>
                    <input
                      type="text"
                      {...register("district", {
                        required: "District is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.district && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.district.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-600">
                      Postal Code
                    </label>
                    <input
                      type="text"
                      {...register("postalCode", {
                        required: "Postal Code is required",
                      })}
                      className="w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                    />
                    {errors.postalCode && (
                      <p className="text-red-500 text-sm mt-1">
                        {errors.postalCode.message}
                      </p>
                    )}
                  </div>
                  <div className="flex justify-between">
                    <button
                      type="button"
                      className="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-l"
                      onClick={prevStep}
                    >
                      Prev
                    </button>
                    <button
                      type="submit"
                      className="px-6 py-3 bg-gray-600 text-white rounded-md shadow hover:bg-gray-700"
                    >
                      Signup
                    </button>
                  </div>
                </form>
              </div>
            )}        </motion.div>
        </div>
      </div>
    </div>
  );
};

export default SignupPage;
