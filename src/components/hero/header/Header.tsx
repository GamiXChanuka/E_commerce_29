import Link from "next/link";
import React from "react";
import styles from "./Header.module.css";

function Header() {
  return (
    <div className={styles.heroImage}>
      <div className={styles.heroText}>
        <section className="text-white">
          <div className="container flex flex-col items-center px-4 py-16 mx-auto text-center md:py-32 md:px-10 lg:px-32 xl:max-w-3xl">
            <h1 className="text-4xl font-bold leading-none sm:text-5xl">
              Biggest Sale of the Year! <br />
              <span className="dark:text-blue-500">Up to 70%</span>Off on Cyber
              Monday Deals
            </h1>
            <p className="px-8 mt-8 mb-12 text-lg">
              Don&apos;t miss out on our exclusive offers. Find the best discounts on
              electronics, fashion, home goods, and more!
            </p>
            <div className="flex flex-wrap justify-center">
              <div className="flex flex-wrap justify-center">
                <Link
                  href="/marketplace"
                  className="px-8 py-3 m-2 text-lg font-semibold rounded dark:text-gray-50 dark:bg-blue-600"
                >
                  Shop Now
                </Link>
                <Link
                  href="/about"
                  className="px-8 py-3 m-2 text-lg border rounded dark:text-white dark:bg-gray-400"
                >
                  Learn More
                </Link>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}

export default Header;
