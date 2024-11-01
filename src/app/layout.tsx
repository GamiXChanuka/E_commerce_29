// Layout.tsx
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import LayoutWrapper from "./LayoutWrapper";
import { Toaster } from "react-hot-toast";
import InitializeRegistrationStatus from "@/components/isRegisterd/isRegistered";
import { CartProvider } from "@/components/context/CartContext";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Shopzy",
  description: "Generated by create next app",
  icons: {
    icon: '/login2.png',
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${inter.className} flex flex-col min-h-screen`}>
        <CartProvider>
            <LayoutWrapper>
            {children}
            <Toaster position="top-center" />
            </LayoutWrapper>
          <InitializeRegistrationStatus />
        </CartProvider>
      </body>
    </html>
  );
}