"use client"

import { useState, useEffect } from 'react';
import axios from 'axios';

const CheckoutPage = () => {
  const [isRegistered, setIsRegistered] = useState(false);
  const [cartItems, setCartItems] = useState<{ id: number; title: string; price: number }[]>([]);
  const [address, setAddress] = useState({
    firstName: '',
    lastName: '',
    phone: '',
    address1: '',
    address2: '',
    country: '',
    city: '',
    state: '',
    postalCode: ''
  });
  const [paymentDetails, setPaymentDetails] = useState({
    cardNumber: '',
    nameOnCard: '',
    expiryDate: '',
    csv: ''
  });
  const [loading, setLoading] = useState(false);

  // Fetch user info and cart items
  useEffect(() => {
    // Check if user is registered
    const checkUserRegistration = async () => {
      const user = await axios.get('/api/checkUser'); // Your API route for checking user
      if (user.data.registered) {
        setIsRegistered(true);
        // Fetch cart items for registered user
        const items = await axios.get('/api/cart'); // Replace with your cart API route
        setCartItems(items.data);
      } else {
        // Get cart items from localStorage for unregistered user
        const items = JSON.parse(localStorage.getItem('cartItems') || '[]');
        setCartItems(items);
      }
    };
    checkUserRegistration();
  }, []);

  // Handle input changes for address and payment
  const handleAddressChange = (e: { target: { name: any; value: any; }; }) => {
    setAddress({ ...address, [e.target.name]: e.target.value });
  };

  const handlePaymentChange = (e: { target: { name: any; value: any; }; }) => {
    setPaymentDetails({ ...paymentDetails, [e.target.name]: e.target.value });
  };

  // Handle order submission
  const handleOrder = async () => {
    setLoading(true);
    try {
      // Validate the inputs
      if (!isRegistered && Object.values(address).some(field => !field)) {
        alert('Please fill in all address fields.');
        setLoading(false);
        return;
      }
      if (Object.values(paymentDetails).some(field => !field)) {
        alert('Please fill in all payment details.');
        setLoading(false);
        return;
      }

      const orderData = {
        cartItems,
        address: isRegistered ? null : address,
        paymentDetails
      };

      // Place the order
      const response = await axios.post('/api/placeOrder', orderData);
      if (response.data.success) {
        alert('Thank you! Your order has been placed.');
      } else {
        alert('Error placing order. Please try again.');
      }
    } catch (error) {
      console.error('Error placing order:', error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="checkout-container">
      <div className="checkout-form">
        <h2>Checkout</h2>
        {!isRegistered && (
          <div className="shipping-info">
            <h3>Shipping Information</h3>
            <input
              type="text"
              name="firstName"
              placeholder="First name"
              value={address.firstName}
              onChange={handleAddressChange}
            />
            <input
              type="text"
              name="lastName"
              placeholder="Last name"
              value={address.lastName}
              onChange={handleAddressChange}
            />
            <input
              type="text"
              name="phone"
              placeholder="Phone number"
              value={address.phone}
              onChange={handleAddressChange}
            />
            <input
              type="text"
              name="address1"
              placeholder="Address line 1"
              value={address.address1}
              onChange={handleAddressChange}
            />
            {/* Add other address inputs like city, country, postal code */}
          </div>
        )}

        <div className="payment-info">
          <h3>Payment</h3>
          <input
            type="text"
            name="cardNumber"
            placeholder="Card Number"
            value={paymentDetails.cardNumber}
            onChange={handlePaymentChange}
          />
          <input
            type="text"
            name="nameOnCard"
            placeholder="Name on the card"
            value={paymentDetails.nameOnCard}
            onChange={handlePaymentChange}
          />
          {/* Add other payment inputs like expiry date, csv */}
        </div>

        <button onClick={handleOrder} disabled={loading}>
          {loading ? 'Processing...' : 'Confirm Order'}
        </button>
      </div>

      <div className="order-summary">
        <h3>Order Details</h3>
        {cartItems.map((item) => (
          <div key={item.id} className="cart-item">
            <p>{item.title}</p>
            <p>${item.price}</p>
          </div>
        ))}
        <div className="total">
          <p>Subtotal: ${cartItems.reduce((sum, item) => sum + item.price, 0)}</p>
          <p>Shipping: $10</p>
          <p>Total: ${cartItems.reduce((sum, item) => sum + item.price, 0) + 10}</p>
        </div>
      </div>
    </div>
  );
};

export default CheckoutPage;
