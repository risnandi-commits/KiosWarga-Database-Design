-- KIOSWARGA - DATABASE SCHEMA
-- 1. TABEL UTAMA
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_supplier VARCHAR(100) NOT NULL,
    kontak VARCHAR(50),
    alamat TEXT
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    supplier_id INT,
    nama_barang VARCHAR(100) NOT NULL,
    harga_beli DECIMAL(12,2) NOT NULL,
    harga_jual DECIMAL(12,2) NOT NULL,
    stok_gudang INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE SET NULL
);

-- 2. TABEL PELANGGAN (FITUR MEMBER UMKM)
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_member VARCHAR(100),
    poin_belanja INT DEFAULT 0
);

-- 3. TABEL TRANSAKSI (DENGAN DISKON MEMBER)
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    member_id INT,
    jumlah INT NOT NULL,
    total_harga DECIMAL(12,2) NOT NULL,
    diskon_persen DECIMAL(5,2) DEFAULT 0,
    tanggal_transaksi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- A. TRIGGER OTOMATIS KURANGI STOK
CREATE TRIGGER after_sale_insert
AFTER INSERT ON transactions
FOR EACH ROW
UPDATE products 
SET stok_gudang = stok_gudang - NEW.jumlah
WHERE product_id = NEW.product_id;

-- B. VIEW ANALISIS PROFIT
CREATE VIEW v_laporan_profit AS
SELECT 
    p.nama_barang,
    SUM(t.jumlah) AS total_terjual,
    SUM(t.total_harga) AS pendapatan_kotor,
    SUM(t.jumlah * p.harga_beli) AS total_modal,
    (SUM(t.total_harga) - SUM(t.jumlah * p.harga_beli)) AS keuntungan_bersih
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.product_id;

--C. CONTOH PERINTAH QUERY
--
-- 1. Tambah Data Awal (Dummy)
INSERT INTO suppliers (nama_supplier, kontak, alamat) VALUES ('PT Sumber Sembako', '0812345678', 'Bandung');
INSERT INTO categories (nama_kategori) VALUES ('Sembako'), ('Elektronik');
INSERT INTO products (category_id, supplier_id, nama_barang, harga_beli, harga_jual, stok_gudang) 
VALUES (1, 1, 'Minyak Goreng 2L', 25000, 32000, 100);
INSERT INTO members (nama_member, poin_belanja) VALUES ('Jaya', 0);

-- 2. Simulasi Transaksi Penjualan (Otomatis memicu Trigger stok berkurang)
-- Membeli 2 Minyak Goreng, total 64000
INSERT INTO transactions (product_id, member_id, jumlah, total_harga) 
VALUES (1, 1, 2, 64000);

-- 3. Cek apakah stok di products otomatis berkurang (dari 100 jadi 98)
SELECT nama_barang, stok_gudang FROM products WHERE product_id = 1;

-- 4. Lihat laporan profit dari View
SELECT * FROM v_laporan_profit;
