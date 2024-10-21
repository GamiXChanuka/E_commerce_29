import Link from "next/link";
import Image from "next/image";

const Footer = () => {
    return (
      <div className='px-4 py-8 mt-24 text-sm text-gray-300 bg-[#F5F5F7] md:px-8 lg:px-16 xl:32 2xl:px-64'>
        {/* TOP */}
        <div className="flex flex-col justify-between gap-12 p-6 rounded-lg shadow-lg md:flex-row md:gap-24 backdrop-blur-lg bg-opacity-30">
            {/* LEFT */}
            <div className="flex flex-col w-full gap-8 lg:w-1/4 md:w-1/2">
                <Link href="/">
                  <div className="text-2xl font-bold tracking-wide text-black">Shopzy</div>
                </Link>
                <p className="font-semibold text-gray-700">3252 Winding Way, Central Plaza, Willowbrook, CA 90210, United States</p>
                <span className="font-semibold text-gray-700">hello@shopzy.dev</span>
                <span className="font-semibold text-gray-700">+1 223 456 789</span>
                <div className="flex gap-6">
                    <a href="https://facebook.com" className="transition-transform hover:scale-110">
                      <Image src="/facebook.png" alt="Facebook" width={16} height={16} />
                    </a>
                    <a href="https://instagram.com" className="transition-transform hover:scale-110">
                      <Image src="/instagram.png" alt="Instagram" width={16} height={16} />
                    </a>
                    <a href="https://youtube.com" className="transition-transform hover:scale-110">
                      <Image src="/youtube.png" alt="YouTube" width={16} height={16} />
                    </a>
                    <a href="https://pinterest.com" className="transition-transform hover:scale-110">
                      <Image src="/pinterest.png" alt="Pinterest" width={16} height={16} />
                    </a>
                    <a href="https://x.com" className="transition-transform hover:scale-110">
                      <Image src="/x.png" alt="Twitter/X" width={16} height={16} />
                    </a>
                </div>
            </div>
            {/* CENTER */}
            <div className="justify-between hidden w-1/2 lg:flex">
                <div className="flex flex-col justify-between">
                  <h1 className="text-lg font-medium text-black">COMPANY</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">About Us</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Careers</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Affiliates</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Blog</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Contact Us</Link>
                  </div>
                </div>
                <div className="flex flex-col justify-between">
                  <h1 className="text-lg font-medium text-black">SHOP</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">New Arrivals</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Accessories</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Electronics</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Toys</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">All Products</Link>
                  </div>
                </div>
                <div className="flex flex-col justify-between">
                  <h1 className="text-lg font-medium text-black">HELP</h1>
                  <div className="flex flex-col gap-6">
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Customer Service</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">My Account</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Find a Store</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Legal & Privacy</Link>
                    <Link href="/" className="text-gray-700 transition-colors hover:text-blue-400 ">Gift Card</Link>
                  </div>
                </div>
            </div>
            {/* RIGHT */}
            <div className="flex flex-col w-full gap-8 lg:w-1/4 md:w-1/2">
                <h1 className="text-lg font-medium text-black">SUBSCRIBE</h1>
                <div className="flex">
                    <input type="text" placeholder="Email Address" className="w-3/4 p-2 text-white bg-gray-800 border border-gray-600 rounded-l-md focus:ring focus:ring-blue-500" />
                    <button className="w-1/4 p-2 text-white transition-colors bg-blue-600 shadow-lg hover:bg-blue-500 rounded-r-md">JOIN</button>
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
        <div className="flex flex-col items-center justify-between gap-8 pt-4 mt-8 border-t border-gray-700 md:flex-row">
          <div className="text-gray-500">© 2024 Shopzy</div>
          <div className="flex flex-col gap-4 md:flex-row">
            <div className="flex items-center">
              <span className="mr-4 text-gray-500">Language</span>
              <span className="font-medium text-black">United States | English</span>
            </div>
            <div className="flex items-center">
              <span className="mr-4 text-gray-500">Currency</span>
              <span className="font-medium text-black">$ USD</span>
            </div>
          </div>
        </div>
      </div>
    )
}

export default Footer;
