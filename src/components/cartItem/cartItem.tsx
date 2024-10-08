import React from 'react';
import styles from './CartItem.module.css'; // Adjust the path as necessary

interface CartItemProps {
  item: {
    VariantID: number;
    Title: string;
    Price: number;
    Quantity: number;
    ImageLink: string; // Added ImageLink property
  };
  onRemove: (id: number) => void;
  onAdd: (id: number) => void;
}

const CartItem: React.FC<CartItemProps> = ({ item, onRemove, onAdd }) => {
  return (
    <div className={styles.card}>
      <img src={item.ImageLink} alt={item.Title} className={styles.image} /> {/* Display image */}
      <div className={styles.itemDetails}>
        <h2 className={styles.title}>{item.Title}</h2>
        <p className={styles.price}>${item.Price}</p>
        <p className={styles.quantity}>Quantity: {item.Quantity}</p>
      </div>
      <div className={styles.buttonGroup}>
        <button className={styles.button} onClick={() => onRemove(item.VariantID)}>Remove</button>
        <button className={styles.button} onClick={() => onAdd(item.VariantID)}>Add</button>
      </div>
    </div>
  );
};

export default CartItem;
