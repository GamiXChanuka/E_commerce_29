
import Image from "next/image";
import { Children } from "react";
import Hero from "@/components/hero/Hero"; // Import the 'Hero' component from the correct file path
import { AppleCardsCarouselDemo } from "@/components/acenterityUi/applecardscarouseldemo";
import { useState, useEffect } from 'react';


export default function Home() {
//------------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------
  return (
    <div className="">

{/*       
      <div className="px-10 bg-slate-400">
        <div className="text-sm breadcrumbs">
          <ul>
            <li><a>Home</a></li>
            <li></li>
           
          </ul>
        </div>
      </div>
       */}
      <Hero/>
      <AppleCardsCarouselDemo/>
      

      


    </div>
  );
}
