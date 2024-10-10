import React from "react";
import Search from "@/components/search/Search";

function page() {
  return (
    <>
      <div className="px-10 bg-slate-600">
        <div className="text-sm breadcrumbs">
          <ul>
            <li>
              <a href="./">Home</a>
            </li>
            <li>
              <a>About</a>
            </li>
          </ul>
        </div>
      </div>
    </>
  );
}

export default page;
