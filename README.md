### README for E_commerce_29

## Single Vendor E-Commerce Platform

### Project Description
Shopzy is a local chain retailer in Texas aiming to enhance its online presence to compete with major players like Amazon. The project involves designing and developing a robust e-commerce platform that will initially focus on consumer electronics and toys. The company maintains its own stock in several warehouses and has a subsidiary courier service for deliveries.

![image](https://github.com/user-attachments/assets/d1d9ceb7-f8b7-4a27-929c-766b788e26b9)


![image](https://github.com/user-attachments/assets/ac2f5dcf-8a9e-4663-bf3e-468d517a1af0)

### Features
- Product Management: Supports multiple product variants, categories, and custom attributes.
- Inventory Management: Tracks product availability and updates inventory upon order completion.
- User Management: Allows customers to register, browse as guests, add products to the cart, and complete purchases.
- Order Management: Manages customer details, delivery methods, payment methods, and ensures consistency in transactions.
- Delivery Module: Provides delivery time estimates based on stock availability and delivery location.

### Delivery Module Rules
- **Main City Delivery (e.g., Colombo):**
  - In stock: 5 days
  - Out of stock: 8 days
- **Non-Main City Delivery (e.g., Negombo):**
  - In stock: 7 days
  - Out of stock: 10 days
- Delivery estimates will be shown during checkout.

### Database Design
- **Entities and Relationships:** The database will encapsulate all entities and relationships described in the project requirements.
- **Procedures, Functions, and Triggers:** Used to ensure ACID properties and maintain consistency.
- **Keys and Indexing:** Foreign keys and primary keys will be set to maintain consistency, and indexing will be done as necessary.
- **Data Population:** The database will be populated with at least 40 products, including variants, and at least 10 different categories.

### Getting Started
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/GamiXChanuka/E_commerce_29.git
   ```
2. **Install Dependencies:**
   ```bash
   npm install
   ```
3. **Run the Application:**
   ```bash
   npm start
   ```

### Technologies Used
- **TypeScript:** 90.7%
- **JavaScript:** 7.2%
- **CSS:** 2.1%

### Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

### License
This project is licensed under the MIT License.

### Authors
- [GamiXChanuka](https://github.com/GamiXChanuka)
- [NaveenSandaruwan](https://github.com/NaveenSandaruwan)
- [InduwaraRathnayake]()
- [chamindhuSathsara]()
- [code-GDC]()

For more details, visit the repository [here](https://github.com/GamiXChanuka/E_commerce_29).
