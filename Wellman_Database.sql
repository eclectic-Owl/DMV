USE [master]
GO
/****** Object:  Database [DMV]    Script Date: 5/12/2022 10:50:15 PM ******/
CREATE DATABASE [DMV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DMV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMV] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMV] SET RECOVERY FULL 
GO
ALTER DATABASE [DMV] SET  MULTI_USER 
GO
ALTER DATABASE [DMV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMV', N'ON'
GO
ALTER DATABASE [DMV] SET QUERY_STORE = OFF
GO
USE [DMV]
GO
/****** Object:  Table [dbo].[DMVworkers]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMVworkers](
	[Worker_ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkersFirstName] [varchar](50) NULL,
	[WorkersLastName] [varchar](50) NULL,
	[WorkersUserName] [varchar](12) NOT NULL,
	[workersPassword] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Worker_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver_Vehicles]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver_Vehicles](
	[DriverVehicle_ID] [int] IDENTITY(1,1) NOT NULL,
	[DriversSocialSecurity] [varchar](11) NULL,
	[VIN] [varchar](17) NULL,
	[Worker_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverVehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverSocialSecurity] [varchar](11) NOT NULL,
	[DriversFirstName] [varchar](50) NOT NULL,
	[DriversLastName] [varchar](50) NOT NULL,
	[DriversPhoneNumber] [varchar](50) NULL,
	[DriversStreetAddress] [varchar](50) NULL,
	[DriversCity] [varchar](50) NULL,
	[DriversState] [char](2) NULL,
	[DriversZipCode] [int] NULL,
	[DriversAge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverSocialSecurity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infractions]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infractions](
	[InfractionID] [int] IDENTITY(1,1) NOT NULL,
	[DriversSocialSecurity] [varchar](11) NULL,
	[BadgeNumber] [int] NULL,
	[InfractionName] [varchar](50) NULL,
	[InfractionFine] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InfractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Officers]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Officers](
	[BadgeNumber] [int] IDENTITY(1,1) NOT NULL,
	[OfficerFirstName] [varchar](50) NULL,
	[OfficerLastName] [varchar](50) NULL,
	[PoliceUsername] [varchar](12) NULL,
	[PolicePassword] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[BadgeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/12/2022 10:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VIN] [varchar](17) NOT NULL,
	[LicensePlate] [varchar](7) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[ModelYear] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DMVworkers] ON 

INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (1, N'Alyx', N'Howell', N'ReVanDAveStE', N'Q26rL2cUdyuy')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (2, N'Nicole', N'Mays', N'dPARClONGeNT', N'94VrUVqCRkbn')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (3, N'Melanie', N'Peralta', N'WEadrIMaLeSi', N'bWM4dg29h7A8')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (4, N'Mohammad', N'Preston', N'ndUCtiTardop', N'Lc9wynWeU2gb')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (5, N'Kris', N'Mccarthy', N'NcENTOriKini', N'UYS3VaQJtXva')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (6, N'Trixie', N'Mooney', N'uARowlesIVEr', N'TVcH4ydBEQLY')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (7, N'Osman', N'Burgess', N'SnEYcEntIOCK', N'ZQ7AMHq6jJE9')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (8, N'Kirsty', N'Finley', N'AKERchoRAThw', N'4Y5QgxNeSXqc')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (9, N'Dewey', N'Munro', N'nTiogyRABLen', N'VuVBk3R537h5')
INSERT [dbo].[DMVworkers] ([Worker_ID], [WorkersFirstName], [WorkersLastName], [WorkersUserName], [workersPassword]) VALUES (10, N'Mahnoor', N'Schultz', N'zIelenTiORIp', N'xy4MKQdCaAUD')
SET IDENTITY_INSERT [dbo].[DMVworkers] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver_Vehicles] ON 

INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (1, N'252-77-7220', N'1B3BG56P3FX563681', 10)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (2, N'277-14-2080', N'1FADP3K26FL294742', 9)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (3, N'285-54-2222', N'1G6CD1184H4323745', 8)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (4, N'411-97-1870', N'1GKEV16K8LF538649', 7)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (5, N'443-14-5476', N'1GNDT13S582215117', 6)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (6, N'504-43-7855', N'2C4GM68475R667819', 5)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (7, N'510-05-1701', N'JH4KA4670KC024543', 4)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (8, N'530-16-0065', N'3FAFP08Z66R143414', 3)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (9, N'544-09-7062', N'5B4LP57G323345457', 2)
INSERT [dbo].[Driver_Vehicles] ([DriverVehicle_ID], [DriversSocialSecurity], [VIN], [Worker_ID]) VALUES (10, N'554-37-0714', N'JH4DA9450NS000826', 1)
SET IDENTITY_INSERT [dbo].[Driver_Vehicles] OFF
GO
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'252-77-7220', N'Maverick', N'Lowe', N'256-813-2654', N'26263 Kali Burg', N'Letaport', N'GA', 33960, 33)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'277-14-2080', N'Shea', N'Moore', N'724-462-7557', N'92270 Lueilwitz Dale Suite 782', N'Wolfmouth', N'OH', 60689, 46)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'285-54-2222', N'Giovanni', N'Roob', N'812-750-0788', N'77765 Sincere Burg Apt.184', N'Homenickburgh', N'OH', 44000, 28)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'411-97-1870', N'Ola', N'Ward', N'937-317-7247', N'310 Giuseppe Villages', N'Port Karlee', N'TN', 57998, 32)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'443-14-5476', N'Grace', N'Brakus', N'339-368-8032', N'77670 Alfredo Fork Apt. 053 ', N'Tyreseborough', N'OK', 12732, 39)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'504-43-7855', N'Tobin', N'Bosco', N'773-922-5349', N'8624 Roberts Meadows Suite 744', N'North Lindsay', N'SD', 51152, 35)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'510-05-1701', N'Benny', N'Cremin', N'213-438-1424', N'407 Gust Mount', N'Hammesmouth', N'KS', 22071, 37)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'530-16-0065', N'Hermina', N'Ebert', N'540-273-3564', N'5454 Kertzmann Views Apt. 403 ', N'South Sydnee', N'NV', 41044, 32)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'544-09-7062', N'Gillian', N'Emard', N'206-218-0426', N'58 Yvette Pines Suite 203', N'North Sandy', N'OR', 34398, 39)
INSERT [dbo].[Drivers] ([DriverSocialSecurity], [DriversFirstName], [DriversLastName], [DriversPhoneNumber], [DriversStreetAddress], [DriversCity], [DriversState], [DriversZipCode], [DriversAge]) VALUES (N'554-37-0714', N'Herman', N'Stiedemann', N'401-728-3511', N'53080 Lueilwitz Glen', N'Wolffberg', N'CA', 63737, 52)
GO
SET IDENTITY_INSERT [dbo].[Infractions] ON 

INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (1, N'252-77-7220', 2, N'Speeding Ticket', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (2, N'252-77-7220', 3, N'failure to stop', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (3, N'504-43-7855', 20, N'DUI', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (4, N'510-05-1701', 7, N'Parking Ticket', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (5, N'554-37-0714', 7, N'illegal U-turn', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (6, N'285-54-2222', 14, N'No proof of insurance', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (7, N'530-16-0065', 2, N'Driving without a licence', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (8, N'411-97-1870', 20, N'parking ticket', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (9, N'411-97-1870', 20, N'parking ticket', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (10, N'411-97-1870', 20, N'parking ticket', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Infractions] ([InfractionID], [DriversSocialSecurity], [BadgeNumber], [InfractionName], [InfractionFine]) VALUES (11, N'411-97-1870', 20, N'parking ticket', CAST(50.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Infractions] OFF
GO
SET IDENTITY_INSERT [dbo].[Officers] ON 

INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (2, N'Cem', N'Trevino', N'monitorcar', N'nGwD77U6UJ8B')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (3, N'Harold', N'Guevara', N'brasscowboy', N'7Jqj8EhGpQkJ')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (5, N'lianne', N'Sargent', N'ownsledder', N'DJtZ87q9xmAc')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (7, N'Alix', N'Sheenhan', N'usablegoogle', N'5YdDpvr67zYb')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (9, N'Izzy', N'Freeman', N'queasymarket', N'8jQkqZCddUgq')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (11, N'Catrin', N'Pope', N'moveland', N'2NF5JKSHDcxk')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (14, N'Oliwier', N'Bellamy', N'cantant', N'n8tbx4S9U88R')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (16, N'Nayan', N'Cameron', N'directionred', N'DAtcZ2CyLFWk')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (18, N'Siddharth', N'Chester', N'changingblue', N'HuaNBx7wR3WU')
INSERT [dbo].[Officers] ([BadgeNumber], [OfficerFirstName], [OfficerLastName], [PoliceUsername], [PolicePassword]) VALUES (20, N'Samiyah', N'Hawkins', N'cowardlydog', N'33fUR2UGjYb6')
SET IDENTITY_INSERT [dbo].[Officers] OFF
GO
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'1B3BG56P3FX563681', N'5JQZ487', N'Nissan', N'Pathfinder', N'grey', N'2018')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'1FADP3K26FL294742', N'6PXK320', N'Volkswagen', N'Jetta', N'brown', N'2014')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'1G6CD1184H4323745', N'2CT0335', N'Hyundai', N'Santa Fe', N'white', N'2018')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'1GKEV16K8LF538649', N'8CPT582', N'dodge', N'Stratus', N'Blue', N'2006')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'1GNDT13S582215117', N'963WET', N'Ford', N'Crown Victoria', N'red', N'2005')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'2C4GM68475R667819', N'CB30WU', N'Cadillac', N'Cts', N'white', N'2004')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'3FAFP08Z66R143414', N'UTE018', N'Toyota', N'Prius', N'black', N'2014')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'5B4LP57G323345457', N'CN1L808', N'Mercury', N'Sable', N'red', N'1991')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'JH4DA9450NS000826', N'SC19527', N'Jeep', N'Patriot', N'blue', N'2015')
INSERT [dbo].[Vehicles] ([VIN], [LicensePlate], [Make], [Model], [Color], [ModelYear]) VALUES (N'JH4KA4670KC024543', N'823VKK', N'Mazda', N'Mazdaspeed6', N'black', N'2007')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DMV__0AC8F1B54307884B]    Script Date: 5/12/2022 10:50:15 PM ******/
ALTER TABLE [dbo].[DMVworkers] ADD UNIQUE NONCLUSTERED 
(
	[WorkersUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DMV__9D8CCAAC70CA5D78]    Script Date: 5/12/2022 10:50:15 PM ******/
ALTER TABLE [dbo].[DMVworkers] ADD UNIQUE NONCLUSTERED 
(
	[workersPassword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Officers__29A8FD1C0C8F7A95]    Script Date: 5/12/2022 10:50:15 PM ******/
ALTER TABLE [dbo].[Officers] ADD UNIQUE NONCLUSTERED 
(
	[PolicePassword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Officers__C5291AF766E3CA5C]    Script Date: 5/12/2022 10:50:15 PM ******/
ALTER TABLE [dbo].[Officers] ADD UNIQUE NONCLUSTERED 
(
	[PoliceUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vehicles__026BC15C463FBDDD]    Script Date: 5/12/2022 10:50:15 PM ******/
ALTER TABLE [dbo].[Vehicles] ADD UNIQUE NONCLUSTERED 
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Driver_Vehicles]  WITH CHECK ADD FOREIGN KEY([DriversSocialSecurity])
REFERENCES [dbo].[Drivers] ([DriverSocialSecurity])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Driver_Vehicles]  WITH CHECK ADD FOREIGN KEY([Worker_ID])
REFERENCES [dbo].[DMVworkers] ([Worker_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Driver_Vehicles]  WITH CHECK ADD FOREIGN KEY([VIN])
REFERENCES [dbo].[Vehicles] ([VIN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD FOREIGN KEY([BadgeNumber])
REFERENCES [dbo].[Officers] ([BadgeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD FOREIGN KEY([DriversSocialSecurity])
REFERENCES [dbo].[Drivers] ([DriverSocialSecurity])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [DMV] SET  READ_WRITE 
GO
