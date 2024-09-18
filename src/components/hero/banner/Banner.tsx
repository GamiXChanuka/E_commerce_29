import React from 'react'

function Banner() {
  return (
<div className="p-6 py-12 text-gray-900 bg-violet-400 dark:bg-violet-600 dark:text-gray-50">
	<div className="container mx-auto">
		<div className="flex flex-col items-center justify-between lg:flex-row">
			<h2 className="text-6xl font-bold tracking-tighter text-center">Up to
				<br  className="sm:hidden" />50% Off
			</h2>
			<div className="py-2 space-x-2 text-center lg:py-0">
				<span>Plus free shipping! Use code:</span>
				<span className="text-lg font-bold">Group29</span>
			</div>
			<a href="./marketplace" rel="noreferrer noopener" className="block px-5 py-3 mt-4 text-gray-900 border border-gray-400 rounded-md lg:mt-0 bg-gray-50 dark:bg-gray-900 dark:text-gray-50 dark:border-gray-600">Shop Now</a>
		</div>
	</div>
</div>
  )
}

export default Banner
