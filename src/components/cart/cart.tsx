import React, { useState, useEffect } from 'react';
import { FaShoppingCart } from 'react-icons/fa';

const Cart = () => {
  const [items, setItems] = useState([
    { id: 1, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 2 },
    { id: 2, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 1 },
    { id: 3, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 1 },
  ]);

  const handleRemoveItem = (id: number) => {
    setItems(items.filter(item => item.id !== id));
  };

  const handleQuantityChange = (id: number, delta: number) => {
    setItems(items.map(item => 
      item.id === id ? { ...item, quantity: Math.max(item.quantity + delta, 1) } : item
    ));
  };

  return (
    <div className="dropdown dropdown-end dropdown-hover ml-4">
      <div tabIndex={0} role="button" className="mr-2 btn btn-ghost btn-circle">
        <div className="indicator">
          <FaShoppingCart className="h-7 w-7" />
          <span className="badge badge-sm indicator-item">{items.length}</span>
        </div>
      </div>

      {/* Cart dropdown menu */}
      <div tabIndex={0} className="card card-compact dropdown-content bg-base-100 z-[1] mt-3 min-w-12 shadow">
        <div className="card-body">
          {items.map(item => (
            <div key={item.id} className="flex items-center justify-between border-b border-gray-600 py-2">
              <div className="flex items-center">
                <img src="https://th.bing.com/th/id/OIP.L83A3gkMYsWK3jrdLCPsSQHaHa?rs=1&pid=ImgDetMain" alt={item.description} className="w-16 h-16 object-cover mr-4" />
                <div>
                  <h4 className="font-semibold text-black">{item.name}</h4>
                  <p className="text-gray-600">{item.description}</p>
                </div>
              </div>
              <div className="flex items-center">
                <button className="px-2 bg-gray-300 text-black rounded-lg hover:bg-gray-400" onClick={() => handleQuantityChange(item.id, -1)}>-</button>
                <input type="number" value={item.quantity} className="w-12 text-center bg-gray-200 text-black border border-gray-600 rounded-lg mx-2" readOnly />
                <button className="px-2 bg-gray-300 text-black rounded-lg hover:bg-gray-400" onClick={() => handleQuantityChange(item.id, 1)}>+</button>
              </div>
              <div>
                <span className="font-bold text-black">€ {item.price * item.quantity}</span>
                <button className="ml-4 text-red-500 hover:text-red-400" onClick={() => handleRemoveItem(item.id)}>X</button>
              </div>
            </div>
          ))}
          <div className="flex justify-between mt-4">
            <button className="text-blue-400 hover:text-blue-300" onClick={() => window.location.href = '/shop'}>Back to shop</button>
            <button className="text-red-400 hover:text-red-300" onClick={() => setItems([])}>Remove all</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;