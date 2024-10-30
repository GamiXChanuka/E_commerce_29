"use client";

import React, { useState } from "react";
import { useForm, SubmitHandler } from "react-hook-form";
import { motion } from "framer-motion";
import axios from "axios";
import { useRouter } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import { toast } from "react-hot-toast";

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
    <div className="min-h-screen flex items-center justify-center ">
      <div className="bg-white rounded-lg shadow-xl w-4/5 max-w-3xl flex">
        <div className="w-1/3 bg-[#97CBDC] text-[#000000] p-8 rounded-l-lg flex flex-col justify-between overflow-y-auto">
          <div>
            <h2 className="text-3xl font-bold mb-8 text-black">Sign Up</h2>
            <ul className="space-y-5">
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 text-black ${
                  currentStep === 0 ? "shadow-2xl bg-[#DDE8F0]" : "hover:bg-[#97CBDC]"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(0)}
              >
                <span className="text-1xl">1</span>
                <span>Welcome!</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 text-black ${
                  currentStep === 1 ? "shadow-2xl bg-[#DDE8F0]" : "hover:bg-[#97CBDC]"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(1)}
              >
                <span className="text-1xl">2</span>
                <span>Personal Information</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 text-black ${
                  currentStep === 2 ? "shadow-2xl bg-[#DDE8F0]" : "hover:bg-[#97CBDC]"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(2)}
              >
                <span className="text-1xl">3</span>
                <span>Set Your Password</span>
              </li>
              <li
                className={`flex items-center space-x-2 transition-colors duration-300 text-black ${
                  currentStep === 3 ? "shadow-2xl bg-[#DDE8F0]" : "hover:bg-[#97CBDC]"
                } p-2 rounded-md cursor-pointer`}
                onClick={() => setCurrentStep(3)}
              >
                <span className="text-1xl">4</span>
                <span>Address Information</span>
              </li>
            </ul>
          </div>
          <div className="mt-6">
            <Link
              href="/login"
              className="text-[#000000] hover:underline text-[14px]"
            >
              Do you have an account? Login here
            </Link>
          </div>
          {currentStep === 0 && (
            <button
              onClick={() => nextStep({} as FormData)}
              className="mt-6 px-8 py-3 bg-[#ffffff] text-[#018ABD] rounded-md shadow hover:bg-[#018ABD] hover:text-[#ffffff] transition-colors duration-300"
            >
              Get Started
            </button>
          )}
        </div>

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
                  <Image
                    src="/signup.png"
                    alt="Welcome Image"
                    layout="fill"
                    objectFit="cover"
                    className="rounded-md shadow"
                  />
                </div>
              </div>
            )}

            {currentStep === 1 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form
                  className="space-y-6 p-8"
                  onSubmit={handleSubmit(nextStep)}
                >
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      First Name
                    </label>
                    <input
                      type="text"
                      {...register("firstName", {
                        required: "First name is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                      />
                    {errors.firstName && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.firstName.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Last Name
                    </label>
                    <input
                      type="text"
                      {...register("lastName", {
                        required: "Last name is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                      />
                    {errors.lastName && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.lastName.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      User Name
                    </label>
                    <input
                      type="text"
                      {...register("userName", {
                        required: "User name is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                      />
                    {errors.userName && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.userName.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Phone Number
                    </label>
                    <input
                      type="text"
                      {...register("phoneNumber", {
                        required: "Phone number is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                      />
                    {errors.phoneNumber && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.phoneNumber.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Email
                    </label>
                    <input
                      type="email"
                      {...register("email", {
                        required: "Email is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                      />
                    {errors.email && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.email.message}
                      </p>
                    )}
                  </div>
                  <div className="absolute bottom-0 left-0 right-0 flex justify-between p-4 bg-white shadow-md">
                    {/* back button */}
                    <button
                      type="button"
                      onClick={prevStep}
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Back
                    </button>
                    <button
                      type="submit"
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Next
                    </button>
                  </div>
                </form>
              </div>
            )}

            {currentStep === 2 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form
                  className="space-y-6 p-8"
                  onSubmit={handleSubmit(nextStep)}
                >
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Password
                    </label>
                    <input
                      type="password"
                      {...register("password", {
                        required: "Password is required",
                        minLength: {
                          value: 8,
                          message:
                            "Password must be at least 8 characters long",
                        },
                        pattern: {
                          value:
                            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                          message:
                            "Password must include uppercase, lowercase, number, and special character",
                        },
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.password && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.password.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Confirm Password
                    </label>
                    <input
                      type="password"
                      {...register("confirmPassword", {
                        required: "Please confirm your password",
                        validate: (value) =>
                          value === watch("password") || "Passwords do not match",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.confirmPassword && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.confirmPassword.message}
                      </p>
                    )}
                  </div>
                  <div className="absolute bottom-0 left-0 right-0 flex justify-between p-4 bg-white shadow-md">
                    {/* back button */}
                    <button
                      type="button"
                      onClick={prevStep}
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Back
                    </button>
                    <button
                      type="submit"
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Next
                    </button>
                  </div>
                </form>
              </div>
            )}

            {currentStep === 3 && (
              <div className="max-h-[80vh] overflow-y-auto">
                <form
                  className="space-y-6 p-8"
                  onSubmit={handleSubmit(onSignUp)}
                >
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Address Number
                    </label>
                    <input
                      type="text"
                      {...register("addressNumber", {
                        required: "Address number is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.addressNumber && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.addressNumber.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Lane
                    </label>
                    <input
                      type="text"
                      {...register("lane", {
                        required: "Lane is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.lane && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.lane.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      City
                    </label>
                    <input
                      type="text"
                      {...register("city", {
                        required: "City is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.city && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.city.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      District
                    </label>
                    <input
                      type="text"
                      {...register("district", {
                        required: "District is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                    />
                    {errors.district && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.district.message}
                      </p>
                    )}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-[#004581]">
                      Postal Code
                    </label>
                    <input
                      type="text"
                      {...register("postalCode", {
                        required: "Postal code is required",
                      })}
                      className="p-2 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"                    />
                    {errors.postalCode && (
                      <p className="text-red-500 text-xs mt-1">
                        {errors.postalCode.message}
                      </p>
                    )}
                  </div>
                  <div className="absolute bottom-0 left-0 right-0 flex justify-between p-4 bg-white shadow-md">
                    {/* back button */}
                    <button
                      type="button"
                      onClick={prevStep}
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Back
                    </button>

                    <button
                      type="submit"
                      className="px-4 py-2 bg-[#004581] text-white rounded-md hover:bg-[#018ABD]"
                    >
                      Sign Up
                    </button>
                  </div>
                </form>
              </div>
            )}
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default SignupPage;