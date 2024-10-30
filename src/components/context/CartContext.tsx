"use client";

import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';

interface CartContextType {
  cartCount: number;
  incrementCart: (amount?: number) => void;
  decrementCart: (amount?: number) => void;
  clearCart: () => void;
}

const CartContext = createContext<CartContextType | undefined>(undefined);

interface CartProviderProps {
  children: ReactNode;
}

export const CartProvider: React.FC<CartProviderProps> = ({ children }) => {
  const [cartCount, setCartCount] = useState<number | null>(null);

  useEffect(() => {
    const storedCount = localStorage.getItem('cartCount');
    setCartCount(storedCount ? Number(storedCount) : 0);
  }, []);

  useEffect(() => {
    if (cartCount !== null) {
      localStorage.setItem('cartCount', cartCount.toString());
    }
  }, [cartCount]);

  const incrementCart = (amount: number = 1) => setCartCount((prevCount) => (prevCount ?? 0) + amount);
  const decrementCart = (amount: number = 1) => setCartCount((prevCount) => Math.max((prevCount ?? amount) - amount, 0));
  const clearCart = () => {
    setCartCount(0);
    localStorage.setItem('cartCount', '0');
  };

  if (cartCount === null) return null;

  return (
    <CartContext.Provider value={{ cartCount, incrementCart, decrementCart, clearCart }}>
      {children}
    </CartContext.Provider>
  );
};

export const useCart = (): CartContextType => {
  const context = useContext(CartContext);
  if (!context) throw new Error("useCart must be used within a CartProvider");
  return context;
};
