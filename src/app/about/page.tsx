import React from 'react'
import NavBar from "@/components/search/Search";

function page() {
  return (
    <>
      <div className="px-10 bg-slate-600">
        <div className="text-sm breadcrumbs">
          <ul>
            <li><a href="./">Home</a></li>
            <li><a>About</a></li>
          </ul>
        </div>
      </div>
      <NavBar/>


    </>
  )
}

export default page
