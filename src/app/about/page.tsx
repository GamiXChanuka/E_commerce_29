'use client';
import React from "react";
import { motion } from "framer-motion";
import { Parallax, ParallaxProvider } from 'react-scroll-parallax';

function AboutUs() {
  return (
    <ParallaxProvider>
      {/* Breadcrumbs */}
      <div className="px-5 sm:px-10 bg-gradient-to-r from-gray-900 to-gray-800 text-white py-4 shadow-md">
        <div className="text-sm breadcrumbs">
          <ul className="flex space-x-2">
            <li>
              <a href="./" className="hover:underline hover:text-purple-400 transition duration-300">Home</a>
            </li>
            <li>
              <span>&gt;</span>
            </li>
            <li>
              <span className="text-purple-300">About Us</span>
            </li>
          </ul>
        </div>
      </div>

      {/* Hero Section with Parallax */}
      <Parallax speed={-20}>
        <section 
          className="relative bg-cover bg-center h-[300px] sm:h-[400px] md:h-[500px] flex items-center justify-center" 
          style={{ backgroundImage: `url('https://images.unsplash.com/photo-1566197717032-72c687d8abbb')` }}
        >
          <div className="absolute inset-0 bg-black opacity-80"></div>
          <motion.div className="relative text-center text-white z-10 px-4 sm:px-0">
            <motion.h1
              className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-extrabold tracking-widest"
              initial={{ opacity: 0, y: -100 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 1 }}
            >
              Welcome to Shopzy
            </motion.h1>
            <motion.p
              className="text-lg sm:text-xl md:text-2xl mt-4 sm:mt-6"
              initial={{ opacity: 0, y: 50 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 1.2, delay: 0.5 }}
            >
              Bridging Tradition with Innovation – Your Trusted Store for Electronics & Toys, Now Online!
            </motion.p>
            <motion.a
              href="#journey"
              className="inline-block mt-6 sm:mt-8 px-6 sm:px-8 py-3 sm:py-4 bg-gradient-to-r from-purple-600 to-pink-600 text-white font-semibold rounded-lg hover:scale-105 hover:shadow-2xl transform transition-all duration-300"
              initial={{ scale: 0.9 }}
              animate={{ scale: 1 }}
              transition={{ duration: 0.5, delay: 1 }}
            >
              Discover Our Legacy
            </motion.a>
          </motion.div>
        </section>
      </Parallax>

      {/* Our Journey Section with Parallax */}
      <Parallax speed={5}>
        <section 
          id="journey" 
          className="bg-gray-900 py-16 sm:py-20 px-5 sm:px-10" 
          style={{ backgroundImage: `url('https://images.unsplash.com/photo-1510511459019-5dda7724fd87')`, backgroundSize: 'cover' }}
        >
          <div className="container mx-auto text-center text-white">
            <motion.h2
              className="text-4xl sm:text-5xl md:text-6xl font-extrabold mb-6 sm:mb-8"
              initial={{ opacity: 0 }}
              whileInView={{ opacity: 1 }}
              transition={{ duration: 0.8 }}
            >
              Our Journey
            </motion.h2>
            <motion.p
              className="text-lg sm:text-xl leading-relaxed mb-6 sm:mb-8"
              initial={{ x: -150, opacity: 0 }}
              whileInView={{ x: 0, opacity: 1 }}
              transition={{ duration: 0.8 }}
            >
              Founded as a small family-owned business in Texas, Shopzy began with a simple dream – to bring top-quality electronics and toys to our community. Over the years, we have grown from a local retailer to a trusted name in Texas, thanks to the loyalty of our customers and our commitment to quality. 
            </motion.p>
            <motion.p
              className="text-lg sm:text-xl leading-relaxed mb-10"
              initial={{ x: -150, opacity: 0 }}
              whileInView={{ x: 0, opacity: 1 }}
              transition={{ duration: 0.8 }}
            >
              Shopzy is not just a store; it’s part of a legacy that began in the heart of Texas and continues to grow. We aim to connect tradition with innovation, blending the best of local values with the convenience of modern technology.
            </motion.p>
            <motion.img
              src="/store-history.jpg"
              alt="Store History"
              className="rounded-lg shadow-lg mx-auto w-full sm:w-2/3"
              initial={{ opacity: 0, scale: 0.8 }}
              whileInView={{ opacity: 1, scale: 1 }}
              transition={{ duration: 1 }}
            />
          </div>
        </section>
      </Parallax>

      {/* Mission Statement Section */}
      <section 
        className="bg-gradient-to-r from-purple-800 via-black to-purple-800 animate-gradient-x text-white py-16 sm:py-20 px-5 sm:px-10"
        style={{ backgroundImage: `url('https://images.unsplash.com/photo-1556155092-8707de31f9c4')`, backgroundSize: 'cover' }}
      >
        <div className="container mx-auto text-center">
          <motion.h2
            className="text-4xl sm:text-5xl md:text-6xl font-extrabold mb-6 sm:mb-8"
            initial={{ opacity: 0 }}
            whileInView={{ opacity: 1 }}
            transition={{ duration: 0.8 }}
          >
            Our Mission
          </motion.h2>
          <motion.p
            className="text-lg sm:text-xl mb-6 sm:mb-8 leading-relaxed"
            initial={{ y: 100, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.8 }}
          >
            We are dedicated to providing innovative, high-quality products that enhance your everyday life. At Shopzy, shopping is not just a transaction – it's a relationship built on trust and satisfaction.
          </motion.p>
          <motion.div
            className="inline-block mt-6 sm:mt-8 px-6 sm:px-8 py-3 sm:py-4 bg-purple-600 text-white font-semibold rounded-lg hover:bg-purple-700 transition-all duration-300 transform hover:scale-110 shadow-lg"
            initial={{ scale: 0.9 }}
            whileHover={{ scale: 1.05 }}
            transition={{ duration: 0.5 }}
          >
            <a href="#values">Explore Our Values</a>
          </motion.div>
        </div>
      </section>

      {/* Core Values Section */}
      <Parallax speed={10}>
        <section 
          id="values" 
          className="bg-gray-800 py-16 sm:py-20 px-5 sm:px-10"
          style={{ backgroundImage: `url('https://images.unsplash.com/photo-1581092337807-d047577e9480')`, backgroundSize: 'cover' }}
        >
          <div className="container mx-auto text-center text-white">
            <h2 className="text-4xl sm:text-5xl md:text-6xl font-extrabold mb-6 sm:mb-8 text-yellow-400">Our Core Values</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
              <motion.div
                className="p-6 bg-gray-700 shadow-xl rounded-lg"
                whileHover={{ scale: 1.1, rotate: 2 }}
                transition={{ duration: 0.5 }}
              >
                <h3 className="text-2xl font-bold mb-4">💎 Quality</h3>
                <p>We offer only the products we trust and use ourselves, ensuring the highest standards for our customers.</p>
              </motion.div>
              <motion.div
                className="p-6 bg-gray-700 shadow-xl rounded-lg"
                whileHover={{ scale: 1.1, rotate: -2 }}
                transition={{ duration: 0.5 }}
              >
                <h3 className="text-2xl font-bold mb-4">🎯 Integrity</h3>
                <p>We believe in honesty, transparency, and fairness in all our dealings.</p>
              </motion.div>
              <motion.div
                className="p-6 bg-gray-700 shadow-xl rounded-lg"
                whileHover={{ scale: 1.1, rotate: 2 }}
                transition={{ duration: 0.5 }}
              >
                <h3 className="text-2xl font-bold mb-4">💡 Innovation</h3>
                <p>Constantly evolving to bring the latest trends and tech to your fingertips.</p>
              </motion.div>
              <motion.div
                className="p-6 bg-gray-700 shadow-xl rounded-lg"
                whileHover={{ scale: 1.1, rotate: -2 }}
                transition={{ duration: 0.5 }}
              >
                <h3 className="text-2xl font-bold mb-4">🌟 Customer Delight</h3>
                <p>Your satisfaction is our top priority – we’re not happy unless you are.</p>
              </motion.div>
            </div>
          </div>
        </section>
      </Parallax>

      {/* Contact Us Section */}
      <section 
        className="bg-gradient-to-r from-blue-900 to-blue-800 text-blue-900 py-16 sm:py-20 px-5 sm:px-10"
        style={{ backgroundImage: `url('https://images.unsplash.com/photo-1573497491208-6b1acb260507')`, backgroundSize: 'cover' }}
      >
        <div className="container mx-auto text-center">
          <motion.h2
            className="text-4xl sm:text-5xl md:text-6xl font-extrabold mb-6 sm:mb-8"
            initial={{ opacity: 0 }}
            whileInView={{ opacity: 1 }}
            transition={{ duration: 0.8 }}
          >
            Get In Touch
          </motion.h2>
          <motion.p
            className="text-lg sm:text-xl mb-6 sm:mb-8"
            initial={{ y: 100, opacity: 0 }}
            whileInView={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.8 }}
          >
            Have questions? We’d love to hear from you! Whether you need assistance with a product or have feedback, we are here for you.
          </motion.p>
          <motion.a
            href="mailto:support@company.com"
            className="inline-block mt-6 sm:mt-8 px-6 sm:px-8 py-3 sm:py-4 bg-white text-blue-700 font-semibold rounded-lg hover:bg-gray-200 transition transform hover:scale-110 shadow-xl"
            whileHover={{ scale: 1.1 }}
            transition={{ duration: 0.5 }}
          >
            Contact Us Today
          </motion.a>
        </div>
      </section>
    </ParallaxProvider>
  );
}

export default AboutUs;
