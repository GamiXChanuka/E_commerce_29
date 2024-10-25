"use client"
import { useEffect } from 'react';

// Component to initialize isRegistered on the client-side
const InitializeRegistrationStatus: React.FC = () => {
    useEffect(() => {
      if (localStorage.getItem("isRegistered") === null) {
        localStorage.setItem("isRegistered", "false");
      }
    }, []);
    
    return null; // This component does not render anything
}

export default InitializeRegistrationStatus;