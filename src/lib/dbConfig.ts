import mysql from 'mysql2/promise';

const connectionParams = {
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    charset: 'utf8mb4',
    
    // Pool options
    connectionLimit: 100,  // Adjust based on your needs (default is 10)
    queueLimit: 0,        // Unlimited queue (or set a limit if needed)
    waitForConnections: true,  // Wait for free connections when pool is full
}
let pool: mysql.Pool;

try {
    pool = mysql.createPool(connectionParams);
    console.log('Database connection pool created successfully.');
} catch (error) {
    console.error('Error creating database connection pool:', error);
    process.exit(1); // Exit the process with a failure code
}

export default pool;
