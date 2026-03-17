-- Initialize expense_tracker database
-- This script creates the database, user, and grants privileges
-- Create database if not exists
CREATE DATABASE IF NOT EXISTS expense_tracker CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- Create user for the application
CREATE USER IF NOT EXISTS 'expense_user' @'%' IDENTIFIED BY 'expense123';
-- Grant privileges
GRANT ALL PRIVILEGES ON expense_tracker.* TO 'expense_user' @'%';
FLUSH PRIVILEGES;
-- Use the database
USE expense_tracker;
-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    type ENUM('income', 'expense') NOT NULL,
    icon VARCHAR(50) DEFAULT '📦',
    color VARCHAR(20) DEFAULT '#64748b',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_type (type)
);
-- Create transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    type ENUM('income', 'expense') NOT NULL,
    category_id INT,
    description TEXT,
    transaction_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE
    SET NULL,
        INDEX idx_date (transaction_date),
        INDEX idx_type (type),
        INDEX idx_category (category_id)
);
-- Insert default categories (only if table is empty)
INSERT IGNORE INTO categories (name, type, icon, color)
VALUES -- Income categories
    ('Salary', 'income', '💰', '#22c55e'),
    ('Freelance', 'income', '💻', '#3b82f6'),
    ('Investment', 'income', '📈', '#8b5cf6'),
    ('Business', 'income', '🏢', '#f97316'),
    ('Rental', 'income', '🏠', '#14b8a6'),
    ('Other Income', 'income', '🎁', '#6b7280'),
    -- Expense categories
    ('Food & Dining', 'expense', '🍔', '#ef4444'),
    ('Shopping', 'expense', '🛍️', '#ec4899'),
    ('Transportation', 'expense', '🚗', '#eab308'),
    ('Entertainment', 'expense', '🎬', '#8b5cf6'),
    ('Bills & Utilities', 'expense', '💡', '#6b7280'),
    ('Healthcare', 'expense', '🏥', '#06b6d4'),
    ('Education', 'expense', '📚', '#14b8a6'),
    ('Travel', 'expense', '✈️', '#3b82f6'),
    ('Groceries', 'expense', '🛒', '#f97316'),
    ('Rent', 'expense', '🏠', '#64748b');
-- Insert sample transactions (only if table is empty)
INSERT IGNORE INTO transactions (
        amount,
        type,
        category_id,
        description,
        transaction_date
    )
VALUES (
        5000.0,
        'income',
        1,
        'Monthly salary',
        '2024-03-01'
    ),
    (
        150.0,
        'expense',
        7,
        'Restaurant dinner',
        '2024-03-02'
    ),
    (200.0, 'expense', 8, 'New clothes', '2024-03-03'),
    (
        1000.0,
        'income',
        2,
        'Web development project',
        '2024-03-04'
    ),
    (75.0, 'expense', 9, 'Uber rides', '2024-03-05'),
    (
        300.0,
        'expense',
        10,
        'Concert tickets',
        '2024-03-06'
    ),
    (
        2000.0,
        'income',
        3,
        'Stock dividends',
        '2024-03-07'
    ),
    (
        500.0,
        'expense',
        15,
        'Grocery shopping',
        '2024-03-08'
    ),
    (
        1200.0,
        'expense',
        16,
        'Monthly rent',
        '2024-03-09'
    ),
    (
        100.0,
        'expense',
        11,
        'Electricity bill',
        '2024-03-10'
    );