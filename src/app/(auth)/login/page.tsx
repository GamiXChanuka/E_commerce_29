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
      router.push("/");
    } catch (error: any) {
      toast.error(error.response?.data.message || error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100">
      {/* Outer container with sidebar and form content */}
      <div className="bg-white rounded-lg shadow-xl w-4/5 max-w-3xl flex justify-items-center">
        {/* Sidebar */}
        <div className="w-1/3 bg-gray-200 text-gray-800 p-8 rounded-l-lg flex flex-col justify-between">
          <div>
            <h2 className="text-3xl font-bold mb-5">Login</h2>
            <p className="text-gray-600 mb-6">
            Welcome back!
              <br />
              <br />
              <Image src="/login.jpg" alt="Login Image" className="object-cover rounded-full" width={150} height={150} />
            </p>
            <h2 className="text-2xl font-bold mb-2">SHOPZY</h2>
            <p className="text-gray-600 mb-6">
            Where fun meets innovation!.
            </p>
          </div>
          {/* Persistent "Don't have an account?" link */}
          <div className="mt-6">
            <Link
              href="/signup"
              className="text-gray-600 hover:underline text-[14px]"
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
            className="absolute w-full h-full flex items-center justify-center"
          >
            <form className="space-y-6 p-8 w-full" onSubmit={handleSubmit(onLogin)}>
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

              <div>
                <label className="block text-sm font-medium text-gray-600">
                  Password
                </label>
                <input
                  type="password"
                  {...register("password", {
                    required: "Password is required",
                  })}
                  className=" w-full px-4 py-1.5 mt-0.8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-400"
                />
                {errors.password && (
                  <p className="text-red-500 text-sm mt-1">
                    {errors.password.message}
                  </p>
                )}
              </div>

              <button
                type="submit"
                className={`w-full px-4 py-2 text-white rounded-md transition duration-300 ${
                  loading ? "bg-gray-600" : "bg-gray-800 hover:bg-gray-600"
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