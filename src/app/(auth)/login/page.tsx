"use client";

import React, { useState } from "react";
import { useForm, SubmitHandler } from "react-hook-form";
import toast from "react-hot-toast";
import axios from "axios";
import { useRouter } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
import { motion } from "framer-motion";

// Define types for form inputs
type LoginFormInputs = {
  email: string;
  password: string;
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

const LoginPage = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<LoginFormInputs>();
  const router = useRouter();
  const [loading, setLoading] = useState(false);

  const onLogin: SubmitHandler<LoginFormInputs> = async (data) => {
    try {
      setLoading(true);
      await toast.promise(axios.post("/api/login", data), {
        loading: "Logging in...",
        success: <b>Login successful</b>,
        error: <b>Login failed</b>,
      });
      
      window.location.href = "/"; // Redirect to home page
    } catch (error: any) {
      toast.error(error.response?.data.message || error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen">
      {/* Outer container with sidebar and form content */}
      <div className="flex w-4/5 max-w-3xl bg-white rounded-lg shadow-xl justify-items-center">
        {/* Sidebar */}
        <div className="flex flex-col justify-between w-1/3 p-8 text-black bg-[#97CBDC] rounded-l-lg">
          <div>
            <h2 className="mb-5 text-3xl font-bold">Login</h2>
            <p className="mb-6 text-black">
              Welcome back!
              <br />
              <br />
              <Image src="/login.jpg" alt="Login Image" className="object-cover rounded-full" width={150} height={150} />
            </p>
            <h2 className="mb-2 text-2xl font-bold">SHOPZY</h2>
            <p className="mb-6 text-black">
              Where fun meets innovation!
            </p>
          </div>
          {/* Persistent "Don't have an account?" link */}
          <div className="mt-6">
            <Link
              href="/signup"
              className="text-black hover:underline text-[14px]"
            >
              Don&apos;t have an account? Sign up here
            </Link>
          </div>
        </div>

        {/* Form section */}
        <div className="w-2/3 min-h-[500px] relative overflow-hidden">
          <motion.div
            key="loginForm"
            variants={variants}
            initial="enter"
            animate="center"
            exit="exit"
            transition={{ duration: 0.5 }}
            className="absolute flex items-center justify-center w-full h-full"
          >
            <form className="w-full p-8 space-y-6" onSubmit={handleSubmit(onLogin)}>
              <div>
                <label className="block text-sm font-medium text-black">
                  Email
                </label>
                <input
                  type="email"
                  {...register("email", {
                    required: "Email is required",
                  })}
                  className="mt-1 p-3 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                />
                {errors.email && (
                  <p className="mt-1 text-sm text-red-500">
                    {errors.email.message}
                  </p>
                )}
              </div>

              <div>
                <label className="block text-sm font-medium text-black">
                  Password
                </label>
                <input
                  type="password"
                  {...register("password", {
                    required: "Password is required",
                  })}
                  className="mt-1 p-3 block w-full bg-[#e6e7eb] border border-blue-300 rounded-md shadow-xl focus:border-[#97CBDC] sm:text-sm hover:bg-[#dde8f0] transition duration-300 placeholder:text-gray-500 text-black"
                />
                {errors.password && (
                  <p className="mt-1 text-sm text-red-500">
                    {errors.password.message}
                  </p>
                )}
              </div>

              <button
                type="submit"
                className={`w-full px-4 py-2 text-white rounded-md transition duration-300 ${
                  loading ? "bg-[#97CBDC]" : "bg-[#004581] hover:bg-[#018ABD]"
                }`}
                disabled={loading}
              >
                {loading ? "Logging in..." : "Login"}
              </button>
            </form>
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default LoginPage;