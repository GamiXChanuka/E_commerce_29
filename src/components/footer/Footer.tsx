import Link from "next/link";
import Image from "next/image";

const Footer = () => {
    return (
      <div className='py-8 px-4 md:px-8 lg:px-16 xl:32 2xl:px-64 bg-gradient-to-r from-gray-900 via-gray-700 to-gray-900 text-sm mt-24 text-gray-300'>
        {/* TOP */}
        <div className="flex flex-col md:flex-row justify-between gap-12 md:gap-24 backdrop-blur-lg bg-opacity-30 p-6 rounded-lg shadow-lg">
            {/* LEFT */}
            <div className="w-full lg:w-1/4 md:w-1/2 flex flex-col gap-8">
                <Link href="/">
                  <div className="text-2xl tracking-wide text-white font-bold">Shopzy</div>
                </Link>
                <p>3252 Winding Way, Central Plaza, Willowbrook, CA 90210, United States</p>
                <span className="font-semibold text-gray-400">hello@shopzy.dev</span>
                <span className="font-semibold text-gray-400">+1 223 456 789</span>
                <div className="flex gap-6">
                    <a href="https://facebook.com" className="hover:scale-110 transition-transform">
                      <Image src="/facebook.png" alt="Facebook" width={16} height={16} />
                    </a>
                    <a href="https://instagram.com" className="hover:scale-110 transition-transform">
                      <Image src="/instagram.png" alt="Instagram" width={16} height={16} />
                    </a>
                    <a href="https://youtube.com" className="hover:scale-110 transition-transform">
                      <Image src="/youtube.png" alt="YouTube" width={16} height={16} />
                    </a>
                    <a href="https://pinterest.com" className="hover:scale-110 transition-transform">
                      <Image src="/pinterest.png" alt="Pinterest" width={16} height={16} />
                    </a>
                    <a href="https://x.com" className="hover:scale-110 transition-transform">
                      <Image src="/x.png" alt="Twitter/X" width={16} height={16} />
                    </a>
                </div>
            </div>
            {/* CENTER */}
            <div className="hidden lg:flex justify-between w-1/2">
                <div className="flex flex-col justify-between">
                  <h1 className="font-medium text-lg text-white">COMPANY</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="hover:text-white hover:underline transition-colors">About Us</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Careers</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Affiliates</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Blog</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Contact Us</Link>
                  </div>
                </div>
                <div className="flex flex-col justify-between">
                  <h1 className="font-medium text-lg text-white">SHOP</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="hover:text-white hover:underline transition-colors">New Arrivals</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Accessories</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Electronics</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Toys</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">All Products</Link>
                  </div>
                </div>
                <div className="flex flex-col justify-between">
                  <h1 className="font-medium text-lg text-white">HELP</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Customer Service</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">My Account</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Find a Store</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Legal & Privacy</Link>
                    <Link href="/" className="hover:text-white hover:underline transition-colors">Gift Card</Link>
                  </div>
                </div>
            </div>
            {/* RIGHT */}
            <div className="w-full lg:w-1/4 md:w-1/2 flex flex-col gap-8">
                <h1 className="font-medium text-lg text-white">SUBSCRIBE</h1>
                <div className="flex">
                    <input type="text" placeholder="Email Address" className="p-2 w-3/4 border border-gray-600 bg-gray-800 text-white rounded-l-md focus:ring focus:ring-blue-500" />
                    <button className="w-1/4 bg-blue-600 text-white hover:bg-blue-500 transition-colors p-2 rounded-r-md shadow-lg">JOIN</button>
                </div>
                <span className="font-semibold text-gray-400">Secure Payments</span>
                <div className="flex justify-between">
                  <Image src="/discover.png" alt="Discover" width={40} height={20} />
                  <Image src="/skrill.png" alt="Skrill" width={40} height={20} />
                  <Image src="/paypal.png" alt="PayPal" width={40} height={20} />
                  <Image src="/mastercard.png" alt="MasterCard" width={40} height={20} />
                  <Image src="/visa.png" alt="Visa" width={40} height={20} />
                </div>
            </div>
        </div>
        {/* BOTTOM */}
        <div className="flex flex-col md:flex-row items-center justify-between gap-8 mt-8 border-t border-gray-700 pt-4">
          <div className="text-gray-500">© 2024 Shopzy</div>
          <div className="flex flex-col gap-4 md:flex-row">
            <div className="flex items-center">
              <span className="text-gray-500 mr-4">Language</span>
              <span className="font-medium text-white">United States | English</span>
            </div>
            <div className="flex items-center">
              <span className="text-gray-500 mr-4">Currency</span>
              <span className="font-medium text-white">$ USD</span>
            </div>
          </div>
        </div>
      </div>
    )
}

export default Footer;
