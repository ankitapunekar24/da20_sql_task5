CREATE TABLE Financial_Services (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    bank_id INT NOT NULL,
    service_type VARCHAR(20) NOT NULL CHECK (service_type IN ('Insurance', 'Loan', 'FD')),
    
    -- Insurance-related
    insurance_type VARCHAR(50),
    insurance_amount DECIMAL(12, 2),
    insurance_start_date DATE,
    insurance_end_date DATE,

    -- Loan-related
    loan_type VARCHAR(50),
    loan_amount DECIMAL(12, 2),
    loan_term_months INT,
    interest_rate DECIMAL(5, 2),

    -- FD-related
    fd_amount DECIMAL(12, 2),
    fd_interest_rate DECIMAL(5, 2),
    fd_maturity_date DATE,

    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (bank_id) REFERENCES Bank(id)
);

select * from Financial_Services

-- Insert an Insurance service
INSERT INTO Financial_Services (
    customer_id, bank_id, service_type,
    insurance_type, insurance_amount, insurance_start_date, insurance_end_date
) VALUES (
    101, 5, 'Insurance',
    'Health', 500000.00, '2024-01-01', '2029-01-01'
);

-- Insert a Loan service
INSERT INTO Financial_Services (
    customer_id, bank_id, service_type,
    loan_type, loan_amount, loan_term_months, interest_rate
) VALUES (
    102, 12, 'Loan',
    'Home Loan', 2500000.00, 240, 7.25
);

-- Insert an FD service
INSERT INTO Financial_Services (
    customer_id, bank_id, service_type,
    fd_amount, fd_interest_rate, fd_maturity_date
) VALUES (
    103, 8, 'FD',
    100000.00, 6.50, '2028-07-16'
);