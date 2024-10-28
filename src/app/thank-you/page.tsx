import React from 'react';

const Invoice = () => {
  return (
    <section className="py-20 bg-gray-100">
      <div className="max-w-2xl py-0 mx-auto md:py-16">
        <article className="overflow-hidden shadow-none md:shadow-md md:rounded-md">
          <div className="bg-white md:rounded-b-md">
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-6">
                <div className="flex justify-between items-top">
                  <div className="space-y-4">
                    <div>
                      <p className="text-2xl font-bold text-black text-blue-900">Shopzy</p>

                      <p className="text-lg font-bold text-black">Invoice</p>
                      {/* <p>Shopzy</p> */}
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">Billed To</p>
                      <p className='text-black'>Tony Stark</p>
                      <p className='text-black'>tony@starkindustriesxyz.com</p>
                      <p className='text-black'>(02) 1234 1234</p>
                    </div>
                  </div>
                  <div className="space-y-2">
                    <div>
                      <p className="text-sm font-medium text-gray-400">Invoice Number</p>
                      <p className='text-black'>INV-MJ0001</p>
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">Invoice Date</p>
                      <p className='text-black'>31 December 2021</p>
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-400">ABN</p>
                      <p className='text-black'>57 630 182 446</p>
                    </div>
                    <div>
                      <a
                        href="#"
                        target="_blank"
                        className="inline-flex items-center text-sm font-medium text-blue-500 hover:opacity-75"
                      >
                        Download PDF
                        <svg
                          className="ml-0.5 h-4 w-4 fill-current"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          aria-hidden="true"
                        >
                          <path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z" />
                          <path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z" />
                        </svg>
                      </a>
                    </div>
                    {/* <div>
                      <a
                        href="#"
                        target="_blank"
                        className="inline-flex items-center text-sm font-medium text-blue-500 hover:opacity-75"
                      >
                        Pay Balance
                        <svg
                          className="ml-0.5 h-4 w-4 fill-current"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          aria-hidden="true"
                        >
                          <path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z" />
                          <path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z" />
                        </svg>
                      </a>
                    </div> */}
                  </div>
                </div>
              </div>
            </div>
            <div className="border-b border-gray-200 p-9">
              <p className="text-sm font-medium text-gray-400">Note</p>
              <p className="text-sm text-black">Thank you for your order.</p>
            </div>
            <table className="w-full text-sm divide-y divide-gray-200">
              <thead>
                <tr>
                  <th className="py-4 font-semibold text-left text-gray-400 px-9">Item</th>
                  <th className="py-3 font-semibold text-left text-gray-400"></th>
                  <th className="py-3 font-semibold text-left text-gray-400">Amount</th>
                  <th className="py-3 font-semibold text-left text-gray-400">Discount</th>
                  <th className="py-3 font-semibold text-left text-gray-400"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-200">
                <tr>
                  <td className="flex items-center py-5 space-x-1 px-9 whitespace-nowrap">
                    <div>
                      <p className='text-black'>Jericho III (YA-4)</p>
                      <p className="text-sm text-gray-400">Nuclear-armed ICBM</p>
                    </div>
                  </td>
                  <td className="text-gray-600 truncate whitespace-nowrap"></td>
                  <td className="text-gray-600 truncate whitespace-nowrap">$380,000.00</td>
                  <td className="text-gray-600 truncate whitespace-nowrap">0%</td>
                </tr>
                <tr>
                  <td className="flex items-center py-5 space-x-1 px-9 whitespace-nowrap">
                    <div>
                      <p className='text-black'>Pym Particles (Pack of 10,000)</p>
                      <p className="text-sm text-gray-400">Redacted Description</p>
                    </div>
                  </td>
                  <td className="text-gray-600 truncate whitespace-nowrap"></td>
                  <td className="text-gray-600 truncate whitespace-nowrap">$280,000.00</td>
                  <td className="text-gray-600 truncate whitespace-nowrap">0%</td>
                </tr>
              </tbody>
            </table>
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-3">
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Subtotal</p>
                  <p className="text-sm text-gray-500">$660,000.00</p>
                </div>
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Tax</p>
                  <p className="text-sm text-gray-500">$0.00</p>
                </div>
                <div className="flex justify-between">
                  <p className="text-sm text-gray-500">Total</p>
                  <p className="text-sm text-gray-500">$660,000.00</p>
                </div>
              </div>
            </div>
            <div className="border-b border-gray-200 p-9">
              <div className="space-y-3">
                <div className="flex justify-between">
                  <p className="text-lg font-bold text-black">Amount Due</p>
                  <p className="text-lg font-bold text-black">$360.00</p>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>
  );
};

export default Invoice;
