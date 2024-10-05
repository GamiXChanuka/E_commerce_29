"use client";

import Link from "next/link";
import React from "react";
import { useForm } from "react-hook-form";
import { useRouter } from "next/navigation";
import axios from "axios";
import { toast } from "react-hot-toast";

interface LoginFormInputs {
  email: string;
  password: string;
}

const LoginPage = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<LoginFormInputs>();
  const router = useRouter();
  const [loading, setLoading] = React.useState(false);

  const onLogin = async (data: { email: string; password: string }) => {
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
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-50">
      <div className="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
        <h2 className="mb-6 text-3xl font-semibold text-center text-blue-800">
          {loading ? "Processing" : "Login"}
        </h2>
        <hr className="border-gray-300 mb-6" />

        <form onSubmit={handleSubmit(onLogin)} className="space-y-4">
          <div>
            <label htmlFor="email" className="block text-sm font-medium text-gray-700">
              Email
            </label>
            <input
              className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
              id="email"
              type="email"
              {...register("email", { required: "Email is required" })}
              placeholder="Enter your email"
            />
            {errors.email && (
              <span className="text-red-500">{errors.email.message}</span>
            )}
          </div>

          <div>
            <label htmlFor="password" className="block text-sm font-medium text-gray-700">
              Password
            </label>
            <input
              className="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
              id="password"
              type="password"
              {...register("password", { required: "Password is required" })}
              placeholder="Enter your password"
            />
            {errors.password && (
              <span className="text-red-500">{errors.password.message}</span>
            )}
          </div>

          <button
            className={`w-full p-3 text-white transition duration-300 ${
              loading ? "bg-gray-600" : "bg-blue-500 hover:bg-blue-600"
            } rounded-lg focus:ring-2 focus:ring-blue-400`}
            disabled={loading}
            type="submit"
          >
            {loading ? "Logging in..." : "Login"}
          </button>
        </form>

        <p className="mt-4 text-sm text-center text-black">
          Already have an account?{" "}
          <Link href="/signup" className="font-semibold text-blue-500 hover:underline">
            Signup here
          </Link>
        </p>
      </div>
    </div>
  );
};

export default LoginPage;