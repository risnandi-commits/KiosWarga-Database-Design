-- ==========================================
-- 1. Tabel Users
-- ==========================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- Email harus unik
    password_hash VARCHAR(255) NOT NULL,
    status ENUM('active', 'banned', 'pending') DEFAULT 'pending', -- Status akun
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- 2. Tabel Login History
-- ==========================================
CREATE TABLE login_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    ip_address VARCHAR(45) NOT NULL, -- Menampung IPv4 dan IPv6
    user_agent VARCHAR(255), -- Browser/Device info (opsional tapi bagus)
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Kunci asing agar data history tidak hilang jika user dihapus
    CONSTRAINT fk_login_user 
        FOREIGN KEY (user_id) 
        REFERENCES users(id) 
        ON DELETE CASCADE
);

-- ==========================================
-- 3. Indexing (Opsional tapi disarankan)
-- ==========================================
-- Mempercepat pencarian login history berdasarkan user
CREATE INDEX idx_login_user_id ON login_history(user_id);