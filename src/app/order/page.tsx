"use client";

import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import { useState } from "react";

const schema = yup.object().shape({
  firstName: yup.string().required("First name is required"),
  lastName: yup.string().required("Last name is required"),
  phone: yup.string().required("Phone number is required"),
  email: yup.string().email("Invalid email").required("Email is required"),
  city: yup.string().required("City is required"),
  address: yup.string().required("Address is required"),
  zipCode: yup.string().required("ZIP code is required"),
  cardNumber: yup.string().required("Card number is required"),
  expiration: yup.string().required("Expiration date is required"),
  ccv: yup.string().required("CCV is required"),
});

const OrderPage = () => {
  const [paymentMethod, setPaymentMethod] = useState("creditCard");

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
  });

  const onSubmit = (data: any) => {
    console.log(data);
    // Handle form submission
  };

  return (
    <div className="bg-gray-900 text-white min-h-screen p-8">
      <h1 className="text-3xl font-bold mb-6">Billing Details</h1>
      <form onSubmit={handleSubmit(onSubmit)} className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Billing Form */}
        <div>
          <div className="mb-4">
            <label className="block text-sm">First Name</label>
            <input
              {...register("firstName")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.firstName ? "border-red-500" : "border-gray-600"}`}
              placeholder="First Name"
            />
            {errors.firstName && <p className="text-red-500 text-sm">{errors.firstName.message}</p>}
          </div>
          
          <div className="mb-4">
            <label className="block text-sm">Last Name</label>
            <input
              {...register("lastName")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.lastName ? "border-red-500" : "border-gray-600"}`}
              placeholder="Last Name"
            />
            {errors.lastName && <p className="text-red-500 text-sm">{errors.lastName.message}</p>}
          </div>

          <div className="mb-4">
            <label className="block text-sm">Phone</label>
            <input
              {...register("phone")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.phone ? "border-red-500" : "border-gray-600"}`}
              placeholder="Phone"
            />
            {errors.phone && <p className="text-red-500 text-sm">{errors.phone.message}</p>}
          </div>

          <div className="mb-4">
            <label className="block text-sm">Email</label>
            <input
              {...register("email")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.email ? "border-red-500" : "border-gray-600"}`}
              placeholder="Email"
            />
            {errors.email && <p className="text-red-500 text-sm">{errors.email.message}</p>}
          </div>

          <div className="mb-4">
            <label className="block text-sm">Address</label>
            <input
              {...register("address")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.address ? "border-red-500" : "border-gray-600"}`}
              placeholder="Address"
            />
            {errors.address && <p className="text-red-500 text-sm">{errors.address.message}</p>}
          </div>

          <div className="mb-4">
            <label className="block text-sm">ZIP Code</label>
            <input
              {...register("zipCode")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.zipCode ? "border-red-500" : "border-gray-600"}`}
              placeholder="ZIP Code"
            />
            {errors.zipCode && <p className="text-red-500 text-sm">{errors.zipCode.message}</p>}
          </div>

          <div className="mb-4">
            <label className="block text-sm">City</label>
            <input
              {...register("city")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.city ? "border-red-500" : "border-gray-600"}`}
              placeholder="City"
            />
            {errors.city && <p className="text-red-500 text-sm">{errors.city.message}</p>}
          </div>

          {/* Address, ZIP Code */}
        </div>

        {/* Payment Details */}
        <div>
          <h2 className="text-xl font-semibold mb-4">How would you like to pay?</h2>
          
          <div className="mb-4">
            <label>
              <input
                type="radio"
                value="creditCard"
                checked={paymentMethod === "creditCard"}
                onChange={() => setPaymentMethod("creditCard")}
              />
              Pay with Credit Card
            </label>
          </div>

          {/* Credit Card Info (similar to billing details) */}
          
          <div className="mb-4">
            <label className="block text-sm">Card Number</label>
            <input
              {...register("cardNumber")}
              className={`w-full p-3 rounded bg-gray-800 border ${errors.cardNumber ? "border-red-500" : "border-gray-600"}`}
              placeholder="Card Number"
            />
            {errors.cardNumber && <p className="text-red-500 text-sm">{errors.cardNumber.message}</p>}
          </div>

          <div className="mb-4 flex space-x-4">
            <div className="w-1/2">
              <label className="block text-sm">Expiration</label>
              <input
                {...register("expiration")}
                className={`w-full p-3 rounded bg-gray-800 border ${errors.expiration ? "border-red-500" : "border-gray-600"}`}
                placeholder="MM/YY"
              />
              {errors.expiration && <p className="text-red-500 text-sm">{errors.expiration.message}</p>}
            </div>
            <div className="w-1/2">
              <label className="block text-sm">CCV</label>
              <input
                {...register("ccv")}
                className={`w-full p-3 rounded bg-gray-800 border ${errors.ccv ? "border-red-500" : "border-gray-600"}`}
                placeholder="CCV"
              />
              {errors.ccv && <p className="text-red-500 text-sm">{errors.ccv.message}</p>}
            </div>
          </div>

          <button type="submit" className="w-full bg-yellow-500 text-black p-3 rounded mt-4">
            Confirm Payment
          </button>
        </div>
      </form>

      {/* Order Summary */}
      <div className="mt-8 p-4 bg-gray-800 rounded">
        <h2 className="text-2xl font-semibold">Order Summary</h2>
        <p>Subtotal: $774.96</p>
        <p>Shipping: Free</p>
        <p>Total: $774.96</p>
      </div>

      {/* Icons Section */}
      <div className="mt-8 flex justify-between">
        <div className="text-center">
          <p>🚚</p>
          <p>Fast & Free Shipping</p>
        </div>
        <div className="text-center">
          <p>🛒</p>
          <p>Easy to Shop</p>
        </div>
        <div className="text-center">
          <p>🕒</p>
          <p>24/7 Support</p>
        </div>
      </div>
    </div>
  );
};

export default OrderPage;
