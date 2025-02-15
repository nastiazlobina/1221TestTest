USE [master]
GO
/****** Object:  Database [MasterFloor]    Script Date: 23.12.2024 3:24:37 ******/
CREATE DATABASE [MasterFloor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterFloor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterFloor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterFloor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterFloor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterFloor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterFloor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterFloor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterFloor] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterFloor] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MasterFloor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterFloor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterFloor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterFloor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterFloor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterFloor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterFloor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterFloor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterFloor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MasterFloor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterFloor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterFloor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterFloor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterFloor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterFloor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterFloor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterFloor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterFloor] SET  MULTI_USER 
GO
ALTER DATABASE [MasterFloor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterFloor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterFloor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterFloor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterFloor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterFloor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterFloor] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterFloor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterFloor]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[PassportSerial] [nvarchar](4) NULL,
	[PassportNumber] [nvarchar](6) NULL,
	[BankDetails] [nvarchar](100) NULL,
	[Family] [bit] NULL,
	[Health] [nvarchar](100) NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialProduct]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[TypeMaterial] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypePartner] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Director] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[INN] [nvarchar](10) NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[Partner] [int] NULL,
	[CountProduct] [int] NULL,
	[DateSale] [date] NULL,
	[Employee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeProduct] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[Articul] [nvarchar](50) NULL,
	[MinPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMaterial]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaterial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Percent] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartner]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 23.12.2024 3:24:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Coefficient] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [MiddleName], [DateOfBirth], [PassportSerial], [PassportNumber], [BankDetails], [Family], [Health], [Role]) VALUES (1, N'Иванов', N'Иван', N'Иванович', CAST(N'2000-12-01' AS Date), N'1111', N'111111', N'Данные', 0, N'Здоровье', 1)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [MiddleName], [DateOfBirth], [PassportSerial], [PassportNumber], [BankDetails], [Family], [Health], [Role]) VALUES (2, N'Петров', N'Петр', N'Петрович', CAST(N'1999-03-01' AS Date), N'2222', N'222222', N'Данные', 1, N'Здоровье', 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialProduct] ON 

INSERT [dbo].[MaterialProduct] ([Id], [Product], [TypeMaterial]) VALUES (1, 1, 1)
INSERT [dbo].[MaterialProduct] ([Id], [Product], [TypeMaterial]) VALUES (2, 2, 2)
INSERT [dbo].[MaterialProduct] ([Id], [Product], [TypeMaterial]) VALUES (3, 3, 3)
INSERT [dbo].[MaterialProduct] ([Id], [Product], [TypeMaterial]) VALUES (4, 4, 4)
INSERT [dbo].[MaterialProduct] ([Id], [Product], [TypeMaterial]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[MaterialProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

INSERT [dbo].[Partner] ([Id], [TypePartner], [Name], [Director], [Email], [Phone], [Address], [INN], [Rating]) VALUES (1, 1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 7)
INSERT [dbo].[Partner] ([Id], [TypePartner], [Name], [Director], [Email], [Phone], [Address], [INN], [Rating]) VALUES (2, 2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partner] ([Id], [TypePartner], [Name], [Director], [Email], [Phone], [Address], [INN], [Rating]) VALUES (3, 3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partner] ([Id], [TypePartner], [Name], [Director], [Email], [Phone], [Address], [INN], [Rating]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partner] ([Id], [TypePartner], [Name], [Director], [Email], [Phone], [Address], [INN], [Rating]) VALUES (5, 1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProduct] ON 

INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date), 1)
INSERT [dbo].[PartnerProduct] ([Id], [Product], [Partner], [CountProduct], [DateSale], [Employee]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date), 1)
SET IDENTITY_INSERT [dbo].[PartnerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [TypeProduct], [Name], [Articul], [MinPrice]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeProduct], [Name], [Articul], [MinPrice]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeProduct], [Name], [Articul], [MinPrice]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeProduct], [Name], [Articul], [MinPrice]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([Id], [TypeProduct], [Name], [Articul], [MinPrice]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Мастер 
производства')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMaterial] ON 

INSERT [dbo].[TypeMaterial] ([Id], [Name], [Percent]) VALUES (1, N'Тип материала 1', CAST(0.10 AS Decimal(10, 2)))
INSERT [dbo].[TypeMaterial] ([Id], [Name], [Percent]) VALUES (2, N'Тип материала 2', CAST(0.95 AS Decimal(10, 2)))
INSERT [dbo].[TypeMaterial] ([Id], [Name], [Percent]) VALUES (3, N'Тип материала 3', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[TypeMaterial] ([Id], [Name], [Percent]) VALUES (4, N'Тип материала 4', CAST(0.01 AS Decimal(10, 2)))
INSERT [dbo].[TypeMaterial] ([Id], [Name], [Percent]) VALUES (5, N'Тип материала 5', CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[TypeMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[TypePartner] ON 

INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[TypePartner] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeProduct] ON 

INSERT [dbo].[TypeProduct] ([Id], [Name], [Coefficient]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[TypeProduct] ([Id], [Name], [Coefficient]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[TypeProduct] ([Id], [Name], [Coefficient]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[TypeProduct] ([Id], [Name], [Coefficient]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[TypeProduct] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[MaterialProduct]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[MaterialProduct]  WITH CHECK ADD FOREIGN KEY([TypeMaterial])
REFERENCES [dbo].[TypeMaterial] ([Id])
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD FOREIGN KEY([TypePartner])
REFERENCES [dbo].[TypePartner] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD FOREIGN KEY([Partner])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([TypeProduct])
REFERENCES [dbo].[TypeProduct] ([Id])
GO
USE [master]
GO
ALTER DATABASE [MasterFloor] SET  READ_WRITE 
GO
