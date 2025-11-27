-- Menampilkan semua data pada tabel product 
SELECT *
FROM Production.product;

-- Menampilkan Name, ProductNumber, dan ListPrice
SELECT Name, productnumber, ListPrice
FROM Producttion.product;

-- Menmpilkan data menggunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

-- Menampilkan HargaBaru = ListPrice * 1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.product;

-- Menampilkan data dengan menggabukan string
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

-- Filterisasi Data 
-- Menampilkan produk yang berwarna 'red'
SELECT Name, Color, listprice
FROM Production.Product
WHERE Color ='red';

-- Menampilkan produk yg ListPricenya lebih dara 100
SELECT Name, Listprice
FROM Production.Product
WHERE Listprice < 1000;

-- Menampilkan produk yg berwarna black dan list pricenya lebih dari 500
SELECT Name, Color, ListPrice 
FROM Production.Product
WHERE Color = 'black' AND Listprice > 500;

-- Menampilkan produk yang berwarna red, blue, ATAU black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black');

-- Menampilkan produk yang namanya menganduk kata 'Road'
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Road%';

-- Agregasi dan pengelompokkan 
-- Menghitung total baris 
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

-- Menampilkan Warna Produk dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

-- Menampilkan ProductID, jumlah OrderQty, dan rata2 UnitPrice
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT *
FROM Sales.SalesOrderDetail

-- Menampilkan data dengan grouping lebih dari satu kolom
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product

-- Filter Hasil Agregasi 
-- Menampilkan warna produk yang jumlahnya lebih dari 20

SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color 
HAVING COUNT(*) > 2;

-- Menampilkan warna produk yang ListPricenya > 500 dan jumlahnya > 10
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE Listprice > 500
GROUP BY Color 
HAVING COUNT(*) < 10;

-- menampilkan ProducID yang jumlah OrederQtynya lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY productID
HAVING SUM(OrderQty) > 10;

-- Menampilkan SpecialOfferId yang rata2 OrderQtynya kurang dari 2 
SELECT SpacialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

-- Menampilkan warna yang ListPricenya lebih dari 300 Menggunakan MAX
SELECT Color
FROM Production.product
GROUP BY Color 
HAVING MAX(ListPrice) > 3000;

-- Advanced Select dan Order By
-- Menampilkan JobTitle tanpa duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

-- Menampilkan % nama produk termahal 
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- OFFSET FETCH
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 3 ROWS 
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TOTALNilaiStok
FROM Production.Product
WHERE Listprice > 0
GROUP BY Color 
ORDER BY TOTALNilaiStok DESC;

-- TUGAS MANDIRI
-- Tugas Mandiri

-- 1.
SELECT ProductID,SUM(LineTotal) AS TotalUang -- menampilkan ProductID & LineTotal AS TotalUang dan setiap kelompok produk, SQL melakukan SUM(LineTotal).
FROM Sales.SalesOrderDetail -- SQL mengambil semua data dari kolom SalesOrderDetail.
GROUP BY ProductID; -- Mengelompok kan baris berdasarkan ProductID.

-- 2. 
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID dan total uangnya, lalu menghitung total uang per produk dari baris yang sudah lolos filter.
FROM Sales.SalesOrderDetail -- Ambil semua data dari SalesOrderDetail.
WHERE OrderQty >= 2 -- SQL menyaring baris – hanya transaksi dengan OrderQty minimal 2 yang diproses.
GROUP BY ProductID; -- Setelah disaring, data dikelompokkan berdasarkan ProductID.

-- 3.
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan total uang dari tiap produk.
FROM Sales.SalesOrderDetail -- Mengambil data dari SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter: hanya transaksi dengan jumlah beli minimal 2.
GROUP BY ProductID; -- Mengelompokkan berdasarkan ProductID (tahap inti dari nomor 3).


-- 4.
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Mengambil data dari tabel SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter awal: hanya transaksi OrderQty >= 2.
GROUP BY ProductID -- SQL mengelompokkan baris berdasarkan ProductID.
HAVING SUM(LineTotal) > 50000; -- Filter hasil agregasi: hanya produk dengan total > 50.000.


-- 5.
SELECT ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan ProductID & total pendapatan.
FROM Sales.SalesOrderDetail -- Sumber data SalesOrderDetail.
WHERE OrderQty >= 2 -- Filter baris sebelum pengelompokan.
GROUP BY ProductID -- Kelompokkan per produk.
HAVING SUM(LineTotal) > 50000 -- Filter hasil agregasi.
ORDER BY TotalUang DESC; -- Mengurutkan dari pendapatan terbesar ke terkecil.


-- 6.
SELECT TOP 10 ProductID, SUM(LineTotal) AS TotalUang -- Menampilkan 10 produk dengan pendapatan tertinggi.
FROM Sales.SalesOrderDetail -- Mengambil semua data transaksi.
WHERE OrderQty >= 2 -- Filter transaksi dengan OrderQty minimal 2.
GROUP BY ProductID -- Mengelompokkan baris berdasarkan ProductID.
HAVING SUM(LineTotal) > 50000 -- Hanya produk dengan total uang > 50.000.
ORDER BY TotalUang DESC; -- Urutkan dari total pendapatan tertinggi.











