"use client"; // Mark this as a Client Component

import { usePathname } from "next/navigation";
import NavBar from "@/components/navbar/NavBar";
import Footer from "@/components/footer/Footer";

export default function LayoutWrapper({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  // const isLoginPage = pathname === "/auth/signup"; // Add the leading slash

  return (
    <>
      {/* {!isLoginPage && <NavBar />} */}
      <NavBar />
      <main className="flex-grow">{children}</main>
      <Footer />
      {/* {!isLoginPage && <Footer />} */}
    </>
  );
}
