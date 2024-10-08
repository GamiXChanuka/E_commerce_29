'use client';

import { useState , useEffect} from 'react';

const ShoppingCart = () => {
  const [items, setItems] = useState([
    { id: 1, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 2 },
    { id: 2, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 1 },
    { id: 3, name: 'Shirt', description: 'Cotton T-shirt', price: 44.00, quantity: 1 },
  ]);

  const [discountCode, setDiscountCode] = useState('');
  const [message, setMessage] = useState('');
  const [totalPrice, setTotalPrice] = useState(0);
  const shippingCost = 5.00;
  
  useEffect(() => {
    setTotalPrice(items.reduce((total, item) => total + item.price * item.quantity, 0) + shippingCost);
  }, [items]);

  const handleRemoveItem = (id: number) => {
    setItems(items.filter(item => item.id !== id));
  };

  const handleQuantityChange = (id: number, delta: number) => {
    setItems(items.map(item => 
      item.id === id ? { ...item, quantity: Math.max(item.quantity + delta, 1) } : item
    ));
  };

  const handleApplyDiscount = () => {
    if (discountCode === 'Group29') {
      setMessage('Discount applied: €10 off');
      setTotalPrice(prevTotalPrice => prevTotalPrice - 100);
      // Adjust totalPrice here if needed
    } else {
      setMessage('Invalid discount code');
    }
  };

  const handleRemoveAll = () => {
    setItems([]);
    setMessage('All items removed from the cart.');
  };

  return (
    <div className="flex flex-col md:flex-row bg-[#1f2021] min-h-screen">
      <div className="w-full md:w-2/3 p-8">
        <h2 className="text-3xl font-bold mb-4 text-white">Shopping Cart</h2>
        <h3 className="text-lg text-gray-400">{items.length} items</h3>
        <div className="bg-[#2c2f32] shadow-md rounded-lg p-4 mt-4">
          {items.map(item => (
            <div key={item.id} className="flex items-center justify-between border-b border-gray-600 py-2">
              <div className="flex items-center">
                <img src="https://th.bing.com/th/id/OIP.L83A3gkMYsWK3jrdLCPsSQHaHa?rs=1&pid=ImgDetMain" alt={item.description} className="w-16 h-16 object-cover mr-4" />
                <div>
                  <h4 className="font-semibold text-white">{item.name}</h4>
                  <p className="text-gray-300">{item.description}</p>
                </div>
              </div>
              <div className="flex items-center">
                <button className="px-2 bg-[#3c4144] text-white rounded-lg hover:bg-[#4d5255]" onClick={() => handleQuantityChange(item.id, -1)}>-</button>
                <input type="number" value={item.quantity} className="w-12 text-center bg-[#3c4144] text-white border border-gray-600 rounded-lg mx-2" readOnly />
                <button className="px-2 bg-[#3c4144] text-white rounded-lg hover:bg-[#4d5255]" onClick={() => handleQuantityChange(item.id, 1)}>+</button>
              </div>
              <div>
                <span className="font-bold text-white">€ {item.price * item.quantity}</span>
                <button className="ml-4 text-red-500 hover:text-red-400" onClick={() => handleRemoveItem(item.id)}>X</button>
              </div>
            </div>
          ))}
          <div className="flex justify-between mt-4">
            <button className="text-blue-400 hover:text-blue-300" onClick={() => window.location.href = '/shop'}>Back to shop</button>
            <button className="text-red-400 hover:text-red-300" onClick={handleRemoveAll}>Remove all</button>
          </div>
          {message && <p className="text-green-400 mt-4">{message}</p>}
        </div>
      </div>

      <div className="w-full md:w-1/3 bg-[#2c2f32] p-8 rounded-lg shadow-md">
        <h2 className="text-2xl font-bold mb-4 text-white">Summary</h2>
        <div className="flex justify-between mb-2 text-white">
          <span>ITEMS</span>
          <span>€ {totalPrice - shippingCost}</span>
        </div>
        <div className="flex justify-between mb-4 text-white">
          <span>SHIPPING</span>
          <span>Standard Delivery - € {shippingCost}</span>
        </div>
        <div className="flex justify-between mb-4">
          <input 
            type="text" 
            placeholder="Enter your code" 
            className="bg-[#3c4144] text-white border border-gray-600 p-2 rounded-lg w-2/3" 
            value={discountCode} 
            onChange={(e) => setDiscountCode(e.target.value)} 
          />
          <button className="bg-blue-500 text-white p-2 rounded-lg hover:bg-blue-400" onClick={handleApplyDiscount}>Apply</button>
        </div>
        <div className="flex justify-between font-bold text-white">
          <span>TOTAL PRICE</span>
          <span>€ {totalPrice}</span>
        </div>
        <button className="bg-green-500 text-white p-2 rounded-lg w-full mt-4 hover:bg-green-400">REGISTER</button>
      </div>
    </div>  );
};

export default ShoppingCart;
