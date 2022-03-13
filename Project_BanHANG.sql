CREATE DATABASE Project_BanHang;
USE Project_BanHang;
GO


CREATE TABLE [dbo].[Customer]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[username] VARCHAR(50) NOT NULL UNIQUE,
	[password] VARCHAR(100) NOT NULL,
	[firstName] NVARCHAR(50) NOT NULL,
	[lastName] NVARCHAR(20) NOT NULL,
	[gender] BIT NOT NULL,
	[birthDate] VARCHAR(30),
	[address] NVARCHAR(60) NOT NULL,
	[joinDate] VARCHAR(12),
	[isNew] BIT NOT NULL,
)

CREATE TABLE [dbo].[Role]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[Role_Name] NVARCHAR(25) NOT NULL,
)

CREATE TABLE [dbo].[Employee]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[username] VARCHAR(50) NOT NULL UNIQUE,
	[password] TEXT NOT NULL,
	[firstName] NVARCHAR(50) NOT NULL,
	[lastName] NVARCHAR(20) NOT NULL,
	[gender] BIT NOT NULL,
	[birthDate] VARCHAR(30),
	[address] NVARCHAR(60) NOT NULL,
	[joinDate] VARCHAR(11) NOT NULL,
	[Role_ID] INT NOT NULL 
)

CREATE TABLE [dbo].[Catalog]
(
	[ID] VARCHAR(10) NOT NULL PRIMARY KEY,
	[catalogName] NVARCHAR(25) NOT NULL,
)

CREATE TABLE [dbo].[State]
(
	[ID] VARCHAR(10) PRIMARY KEY,
	[stateName] NVARCHAR(30) NOT NULL,
)

CREATE TABLE [dbo].[Product]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[productName] NVARCHAR(100) NOT NULL,
	[Catalog_ID] VARCHAR(10),
	[Amount] INT NOT NULL, 
	[Price] TEXT NOT NULL,
	[productImage] TEXT NOT NULL,
	[State_ID] INT NOT NULL
)

CREATE TABLE [dbo].[ProductDetail]
(
	[Product_ID] INT NOT NULL PRIMARY KEY,
	[productDetail] NVARCHAR(700) NOT NULL,
)

CREATE TABLE [dbo].[Combo]
(
	[ID] INT NOT NULL PRIMARY KEY ,
	[comboName] NVARCHAR(100) NOT NULL,
	[Product_List] TEXT NOT NULL,
	[startDate] VARCHAR(30) NOT NULL,
	[endDate] VARCHAR(30) NOT NULL,
	[totalMoney] TEXT NOT NULL,
	[discountMoney] TEXT NOT NULL
)

CREATE TABLE [dbo].[Invoice]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[Customer_ID] INT NOT NULL,
	[Shipper_ID] INT,
	[totalMoney] TEXT NOT NULL,
	[createdDate] VARCHAR(11) NOT NULL,
	[customerAddress] NVARCHAR(60) NOT NULL,
	[shipDate] VARCHAR(10) NOT NULL,
	[State_ID] INT NOT NULL
)

CREATE TABLE [dbo].[InvoiceDetail]
(
	[Invoice_ID] INT NOT NULL,
	[Product_ID] INT NOT NULL,
	[Combo_ID] INT,
	[Amount] INT NOT NULL,
	[Price] TEXT NOT NULL,
)

GO
-- Insert (Dữ liệu máy tính, chuột, tai nghe, loa) được trích từ thegioididong.com / Dữ liệu bàn phím được trích từ gearvn.com)
	-- State
	INSERT INTO [dbo].[State] VALUES(1, N'Đơn Hàng Chưa Xử Lý'),
									(2, N'Đơn Hàng Đã Xử Lý'),
									(3, N'Đơn Hàng Bị Huỷ'),
									(4, N'Còn Hàng'),
									(5, N'Hết Hàng')
	-- Customer
	INSERT INTO [dbo].[Customer] VALUES(1, 'sieusaopolo15', 'Password1234', N'Huỳnh Tuấn', N'Đạt' , 1, '05/05/1999', N'267/16 Tùng Thiện Vương', '17/11/2020', 'true'),
									   (2, 'abcxyz', '123456', N'Nguyễn Văn', N'A' , 1, '01/01/1999', N'193 Hàm Tử', '18/11/2020', 'true'),
									   (3, 'hello', '123456', N'Nguyễn Văn', N'B' , 1, '01/01/1999', N'193 Hàm Tử', '18/11/2020', 'true')
	-- Role
	INSERT INTO [dbo].[Role] VALUES(1, 'admin'),
								   (2, 'employee'),
								   (3, 'Shipper')

	-- Employee
	INSERT INTO [dbo].[Employee] VALUES(1, 'NV_001', '123456', N'Nguyễn Văn', 'A', 1, '01/01/1999', N'193 Hàm Tử', '2015-11-20', 1),
									   (2, 'NV_002', '123456', N'Nguyễn Văn', 'B', 0, '02/01/1999', N'193 Hàm Tử', '2015-11-20', 2),
									   (3, 'NV_003', '123456', N'Nguyễn Văn', 'C', 0, '02/01/1999', N'193 Hàm Tử', '2015-11-20', 3)
	-- Catalog
	INSERT INTO [dbo].[Catalog] VALUES(1, 'Máy vi tính'),
									  (2, 'Bàn Phím'),
									  (3, 'Chuột'),
									  (4, 'Tai nghe'),
									  (5, 'Loa')
	-- Product
	INSERT INTO [dbo].[Product] VALUES(1, N'Laptop Acer Aspire 3 A315 56 36YS i3 1005G1 (NX.HS5SV.008)', 1, 10, '13.690.000vnđ', 'acer-aspire-3-a315-56-i3', 4),
									  (2, N'Laptop Asus Gaming Rog Strix G512 i7 10750H/144Hz (IAL001T)', 1, 5, '28.990.000vnđ', 'asus-gaming-rog-strix-g512-i7', 4),
									  (3, N'Bàn phím cơ Newmen GM368', 2, 18, '790.000vnđ', 'gearvn-ban-phim-co-newmen', 4),
									  (4, N'Bàn phím E-Dra EK311', 2, 15, '690.000vnđ', 'gearvn-ban-phim-e-dra-ek311', 4),
									  (5, N'Chuột Gaming Zadez G151M Đen', 3, 15, '300.000vnđ', 'chuot-gaming-zadez-g151m', 4),
									  (6, N'Chuột không dây Zadez M353 Xám', 3, 10, '300.000vnđ', 'chuot-khong-day-zadez-m353', 4),
									  (7, N'Tai nghe Bluetooth True Wireless Mozard Air 3 Đen', 4, 10, '800.000vnđ', 'tai-nghe-bluetooth-true-wireless-mozard-air-3', 4),
									  (8, N'Tai nghe Bluetooth True Wireless Jabra Elite Active 65T Xanh Cooper', 4, 5, '3.790.000vnđ', 'tai-nghe-bluetooth-tws-jabra-elite-active-65t', 4),
									  (9, N'Loa Bluetooth LG Xboom Go PL7 Xanh Đen', 5, 8, '3.390.000vnđ', 'loa-bluetooth-jbl-pulse2blkas-den', 4),
									  (10, N'Loa Bluetooth JBL PULSE2BLKAS Đen', 5, 6, '2.952.000vnđ', 'loa-bluetooth-lg-xboom-go-pl7-xanh-den', 4)
	-- Product Detail
	INSERT INTO [dbo].[ProductDetail] VALUES (1, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;' +
														   N'RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;' + 
														   N'Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;' +
														   N'Màn hình: 15.6 inch, Full HD (1920 x 1080);' +
														   N'Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;' +
														   N'Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);' +
														   N'Hệ điều hành: Windows 10 Home SL;' +
														   N'Thiết kế: Vỏ nhựa, PIN liền;' +
														   N'Kích thước: Dày 19.9 mm, 1.7 kg'
											 ),
											 (2, N'CPU: Intel Core i7 Comet Lake, 10750H, 2.60 GHz;' +
														   N'RAM: 8 GB, DDR4 (2 khe), 2933 MHz;' + 
														   N'Ổ cứng: Hỗ trợ thêm 2 khe cắm SSD M.2 PCIe, SSD 512 GB M.2 PCIe;' +
														   N'Màn hình: 15.6 inch, Full HD (1920 x 1080), 144Hz;' +
														   N'Card màn hình: Card đồ họa rời, NVIDIA GeForce GTX 1650Ti 4GB;' +
														   N'Cổng kết nối: 3 x USB 3.2, HDMI, LAN (RJ45), USB Type-C;' +
														   N'Hệ điều hành: Windows 10 Home SL;' +
														   N'Thiết kế: Vỏ nhựa, PIN liền;' +
														   N'Kích thước: Dày 25.8 mm, 2.3 Kg'
											 ),
											 (3, N'Model: GM368;' +
														   N'Kiểu kết nối: bàn phím có dây, 160cm;' +
														   N'Kết nối: USB 2.0;' +
														   N'Phím chức năng: Standard;' +
														   N'Kích thước: Full size, 485x230x40mm;' +
														   N'Kiểu bàn phím: bàn phím cơ;' +
														   N'Trọng lượng: 1083g'
											 ),
											 (4, N'Model: EK311;' +
														   N'Loại bàn phím: Bàn phím cơ fullsize;' + 
														   N'Led: LED Rainbow siêu sáng;' +
														   N'Switch: Outmenu;' +
														   N'Kết nối: USB;' +
														   N'Kích thước: Full size, 485x230x40mm;' +
														   N'Chất liệu: kim loại'
											 ),
											 (5, N'Tương thích: Windows;' +
														   N'Độ phân giải: 1200 - 3200 DPI;' + 
														   N'Cách kết nối: Dây cắm USB;' +
														   N'Độ dài dây / Khoảng cách kết nối: Dây dài 158 cm;' +
														   N'Trọng lượng: 69g;' +
														   N'Thương hiệu của: Trung Quốc'
											 ),
											 (6, N'Tương thích: Windows;' +
														   N'Độ phân giải: 1200 - 3200 DPI;' + 
														   N'Cách kết nối: Dây cắm USB;' +
														   N'Độ dài dây / Khoảng cách kết nối: Dây dài 158 cm;' +
														   N'Trọng lượng: 69g;' +
														   N'Thương hiệu của: Trung Quốc'
											 ),
											 (7, N'Tương thích: Android, Windows, iOS (iPhone);' +
														   N'Cổng sạc: Type-C;' + 
														   N'Thời gian sử dụng: 4 giờ;' +
														   N'Thời gian sạc đầy: 2 giờ;' +
														   N'Kết nối cùng lúc: 1 thiết bị;' +
														   N'Hỗ trợ kết nối: 10m (Bluetooth 5.0);' +
														   N'Phím điều khiển: Nghe/nhận cuộc gọi, Phát/dừng chơi nhạc, Chuyển bài hát, Tăng/giảm âm lượng;' +
														   N'Thương hiệu: Thế Giới Di Động;' + 
														   N'Sản xuất tại: Trung Quốc'
											 ),
											 (8, N'Tương thích: Android, Windows, iOS (iPhone);' +
														   N'Cổng sạc: Micro USB;' + 
														   N'Thời gian sử dụng: 5 giờ;' +
														   N'Thời gian sạc đầy: 2 giờ;' +
														   N'Kết nối cùng lúc: 2 thiết bị;' +
														   N'Hỗ trợ kết nối: 10m (Bluetooth 5.0);' +
														   N'Phím điều khiển: Nghe/nhận cuộc gọi, Phát/dừng chơi nhạc, Chuyển bài hát, Tăng/giảm âm lượng;' +
														   N'Thương hiệu: Đan Mạch;' + 
														   N'Sản xuất tại: Trung Quốc'
											 ),
											 (9, N'Loại loa: Loa bluetooth;' + -- 24
														   N'Tương thích: Android, Windows, iOS (iPhone);' + -- 44
														   N'Tổng công suất: 30W;' + -- 20
														   N'Thời gian sử dụng: dùng khoảng 24 giờ;' + -- 37
														   N'Thời gian sạc đầy: 5 giờ;' + -- 25
														   N'Công nghệ âm thanh: Meridian, Sound boost;' + -- 42
														   N'Kết nối không dây: Bluetooth;' + -- 29
														   N'Kết nối khác: AUX in;' + -- 21
														   N'Tiện ích: Kết nối không dây nhiều loa cùng lúc, Chống nước IPX5, Google Assistant;' + -- 83
														   N'Phím điều khiển: Bật/tắt bluetooth, Nút nguồn, Tăng/giảm âm lượng, Phát/dừng chơi nhạc;' + -- 93
														   N'Điều khiển bằng điện thoại: LG XBoom;' + -- 37
														   N'Kích thước: Dài 25 cm - Đường kính 10 cm - Nặng 1.46 kg;' + -- 56
														   N'Thương hiệu của: Hàn Quốc' -- 25
											 ),
											 (10, N'Loại loa: Loa bluetooth;' +
														   N'Tương thích: Android, Windows, iOS (iPhone);' +
														   N'Tổng công suất: 16W;' +
														   N'Thời gian sử dụng: dùng khoảng 10 giờ;' +
														   N'Thời gian sạc đầy: 5 giờ;' +
														   N'Công nghệ âm thanh: JBL Connect;' +
														   N'Kết nối không dây: Bluetooth 4.1;' +
														   N'Kết nối khác: Jack 3.5 mm;' + 
														   N'Tiện ích: Có micro đàm thoại, Bật trợ lý ảo trên điện thoại, Chống nước IPX7;' +
														   N'Phím điều khiển: Bật/tắt bluetooth, Nút nguồn, Tăng/giảm âm lượng, Phát/dừng chơi nhạc;' +
														   N'Điều khiển bằng điện thoại: LG XBoom;' +
														   N'Kích thước: Dài 19.5 cm - Đường kính 8 cm - Nặng 775 g;' +
														   N'Thương hiệu của: Mỹ'
											 )
	-- Combo
	INSERT INTO [dbo].[Combo] VALUES(1, N'Giảm giá Giáng Sinh', '1;3;5;7', '11/19/2020', '01/01/2021', '15.580.000', '13.243.000') -- 15.580.000 - 2.337.000
	/*
	-- Invoice
	INSERT INTO [dbo].[Invoice] VALUES(1, 1, 3, '10.000.000', 2020-12-12, N'ABCSEWEASD', 2020-12-21, 1),
									  (2, 1, 3, '10.000.000', 2020-12-12, N'ABCSEWEASD', 2020-12-21, 1),
									  (3, 1, 3, '10.000.000', 2020-12-12, N'ABCSEWEASD', 2020-12-21, 1)
	-- InvoiceDetail
	INSERT INTO[dbo].[InvoiceDetail] VALUES(1, 1, 1, 1, '13.690.000vnđ'),
										   (1, 3, 1, 1, '790.000vnđ'),
										   (1, 5, 1, 1, '300.000vnđ'),
										   (1, 7, 1, 1, '800.000vnđ')
	*/

-- end of inserts

/*
-- Enable Constraint
	-- Employee
	ALTER TABLE [dbo].[Employee] ADD CONSTRAINT FK_Role FOREIGN KEY(Role_ID) REFERENCES [dbo].[Role] (ID);
	-- Product
	ALTER TABLE [dbo].[Product] ADD CONSTRAINT FK_Catalog FOREIGN KEY(Catalog_ID) REFERENCES [dbo].[Catalog] (ID);
	ALTER TABLE [dbo].[Product] ADD CONSTRAINT FK_PRODUCT_State FOREIGN KEY(State_ID) REFERENCES [dbo].[State] (ID);
	-- Product Detail
	ALTER TABLE [dbo].[ProductDetail] ADD CONSTRAINT FK_ProductDetail_Product FOREIGN KEY(Product_ID) REFERENCES [dbo].[Product] (ID);
	-- Storage
	ALTER TABLE [dbo].[Storage] ADD CONSTRAINT FK_Storage_Product FOREIGN KEY(Product_ID) REFERENCES [dbo].[Product] (ID);
	-- Invoice
	ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT FK_Customer FOREIGN KEY(Customer_ID) REFERENCES [dbo].[Customer] (ID);
	ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT FK_Shipper FOREIGN KEY(Shipper_ID) REFERENCES [dbo].[Employee] (ID);
	-- Combo
	ALTER TABLE [dbo].[InvoiceDetail] ADD CONSTRAINT FK_Invoice FOREIGN KEY(Invoice_ID) REFERENCES [dbo].[Invoice] (ID);
	ALTER TABLE [dbo].[InvoiceDetail] ADD CONSTRAINT FK_InvoiceDetail_Product FOREIGN KEY(Product_ID) REFERENCES [dbo].[Product] (ID);
	ALTER TABLE [dbo].[InvoiceDetail] ADD CONSTRAINT FK_Combo FOREIGN KEY(Combo_ID) REFERENCES [dbo].[Combo] (ID);
-- end of enable constraint
*/

/*
-- Drop Tables
	DROP TABLE [dbo].[ProductDetail];
	DROP TABLE [dbo].[InvoiceDetail];
	DROP TABLE [dbo].[Combo];
	DROP TABLE [dbo].[Product];
	DROP TABLE [dbo].[Catalog];
	DROP TABLE [dbo].[Invoice];
	DROP TABLE [dbo].[Customer];
	DROP TABLE [dbo].[Employee];
	DROP TABLE [dbo].[Role];
	DROP TABLE [dbo].[State];
-- end of delete table
*/
SELECT * FROM Employee WHERE username = 'NV_001'

GO
CREATE PROC UpdateProfileInformation(@ID INT, @firstName NVARCHAR(50), @lastName NVARCHAR(20), @gender BIT, @birthDate VARCHAR(12), @address NVARCHAR(60))
AS
	BEGIN
		UPDATE [dbo].[Employee] SET [firstName] = @firstName, [lastName] = @lastName, [gender] = @gender, [birthDate] = @birthDate, [address] = @address
		WHERE ID = @ID;
	END

GO
CREATE PROC UpdateProfileUser(@ID INT, @password TEXT)
AS
	BEGIN
		UPDATE [dbo].[Employee] SET [password] = @password
		WHERE ID = @ID;
	END
GO

-- PROCEDURES
	-- INSERT
		-- PRODUCT
			CREATE PROC ProductInsertComputer(@ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650))
			AS
				BEGIN
					INSERT INTO [dbo].[Product] VALUES(@ID, @Name, 1, @Amount, @Price, @productImage, 4);
					INSERT INTO [dbo].[ProductDetail] VALUES(@ID, @productDetail);
				END
			GO
			CREATE PROC ProductInsertKeyboard( @ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650) )
			AS
				BEGIN
					INSERT INTO [dbo].[Product] VALUES(@ID, @Name, 2, @Amount, @Price, @productImage, 4);
					INSERT INTO [dbo].[ProductDetail] VALUES(@ID, @productDetail);
				END
			GO
			CREATE PROC ProductInsertMouse( @ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650) )
			AS
				BEGIN
					INSERT INTO [dbo].[Product] VALUES(@ID, @Name, 3, @Amount, @Price, @productImage, 4);
					INSERT INTO [dbo].[ProductDetail] VALUES(@ID, @productDetail);
				END
			GO

			GO
			CREATE PROC ProductInsertHeadPhone( @ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650) )
			AS
				BEGIN
					INSERT INTO [dbo].[Product] VALUES(@ID, @Name, 4, @Amount, @Price, @productImage, 4);
					INSERT INTO [dbo].[ProductDetail] VALUES(@ID, @productDetail);
				END
			GO

			GO
			CREATE PROC ProductInsertSpeaker( @ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650) )
			AS
				BEGIN
					INSERT INTO [dbo].[Product] VALUES(@ID, @Name, 5, @Amount, @Price, @productImage, 4);
					INSERT INTO [dbo].[ProductDetail] VALUES(@ID, @productDetail);
				END
			GO
		--
		-- Employee
			CREATE PROC InsertEmployee( @ID INT,  @Username VARCHAR(50), @Password TEXT, @Firstname NVARCHAR(50), @Lastname NVARCHAR(20), @Gender BIT, @Birthdate VARCHAR(30), @Address NVARCHAR(60), @Role_ID INT )
			AS
				BEGIN
					IF NOT EXISTS(SELECT [ID]
								  FROM [dbo].[Employee]
								  WHERE [ID] = @ID)
						BEGIN
							IF(@Username NOT IN ( SELECT [username] FROM [dbo].[Employee] ))
								BEGIN
									INSERT INTO [dbo].[Employee] VALUES (@ID, @Username, @Password, @Firstname, @Lastname, @Gender, @Birthdate, @Address, CAST( GETDATE() AS DATE ),@Role_ID);
								END			
						END
				END
			GO
		--
		-- Combo
			CREATE PROC InsertCombo(@ID INT, @comboName NVARCHAR(100), @Product_List TEXT, @startDate VARCHAR(30), @endDate VARCHAR(30), @totalMoney TEXT, @discountMoney TEXT)
			AS
				BEGIN
					INSERT INTO [dbo].[Combo] VALUES(@ID, @comboName, @Product_List, @startDate, @endDate, @totalMoney, @discountMoney);
				END
			GO
	-- UPDATE
		-- Product
			CREATE PROC UpdateProduct( @ID INT, @Name NVARCHAR(100), @Amount INT, @Price TEXT, @productImage TEXT, @productDetail NVARCHAR(650) )
			AS
				BEGIN
					IF (@Amount > 0)
						BEGIN
							UPDATE [dbo].[Product] SET [productName] = @Name, [Amount] = @Amount, [Price] = @Price, [productImage] = @productImage, [State_ID] = 4
							WHERE [ID] = @ID;
						END
					ELSE
						BEGIN
							UPDATE [dbo].[Product] SET [productName] = @Name, [Amount] = @Amount, [Price] = @Price, [productImage] = @productImage, [State_ID] = 5
							WHERE [ID] = @ID;
						END	
					UPDATE [dbo].[ProductDetail] SET [productDetail] = @productDetail WHERE [Product_ID] = @ID;
				END
			GO			
	-- Employee
		CREATE PROC UpdateEmployee( @ID INT, @Password TEXT, @Firstname NVARCHAR(50), @Lastname NVARCHAR(20), @Gender BIT, @Birthdate VARCHAR(30), @Address NVARCHAR(60), @Role_ID INT)
		AS
			BEGIN
				UPDATE [dbo].[Employee] SET [password]  = @Password, [firstName] = @Firstname, [lastName] = @Lastname, [gender] = @Gender, [birthDate] = @Birthdate, [address] = @Address, [Role_ID] = @Role_ID
				WHERE [ID] = @ID;
			END
		GO
	-- Invoice
		CREATE PROC UpdateInvoice( @ID INT, @Employee_ID INT, @State_ID INT )
		AS
			BEGIN
				UPDATE [dbo].[Invoice] SET [Shipper_ID] = @Employee_ID, [State_ID] = @State_ID WHERE [ID] = @ID;
			END
		GO
	-- Combo
		CREATE PROC UpdateCombo( @ID INT, @comboName NVARCHAR(100), @Product_List TEXT, @startDate VARCHAR(30), @endDate VARCHAR(30), @totalMoney TEXT, @discountMoney TEXT )
		AS
			BEGIN
				UPDATE [dbo].[Combo] SET [comboName] = @comboName, [Product_List] = @Product_List, [startDate] = @startDate, [endDate] = @endDate, [totalMoney] = @totalMoney, [discountMoney] = @discountMoney WHERE [ID] = @ID;
			END
		GO