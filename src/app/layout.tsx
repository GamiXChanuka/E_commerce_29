import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import LayoutWrapper from "./LayoutWrapper"; // Import the wrapper
import { Toaster } from "react-hot-toast";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${inter.className} flex flex-col min-h-screen`}>
        {/* Use the LayoutWrapper to manage the Navbar and Footer conditionally */}
        <LayoutWrapper>
          {children}
          <Toaster position="top-right" />
        </LayoutWrapper>
        
      </body>
    </html>
  );
}
