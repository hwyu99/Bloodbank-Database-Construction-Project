USE [master]
GO
/****** Object:  Database [CS504 PROJECT]    Script Date: 3/27/2019 11:34:44 PM ******/
/**GMU CS 504 007 Spring 2019 Blood Donation System Database Project**/

CREATE DATABASE [CS504 PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CS504 PROJECT', FILENAME = N'D:\Microsoft SQL Server\CS504 PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CS504 PROJECT_log', FILENAME = N'D:\Microsoft SQL Server\CS504 PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CS504 PROJECT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CS504 PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CS504 PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CS504 PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CS504 PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CS504 PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CS504 PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET RECOVERY FULL 
GO
ALTER DATABASE [CS504 PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [CS504 PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CS504 PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CS504 PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CS504 PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CS504 PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CS504 PROJECT', N'ON'
GO
ALTER DATABASE [CS504 PROJECT] SET QUERY_STORE = OFF
GO
USE [CS504 PROJECT]
GO
/****** Object:  Table [dbo].[BLOODBANK]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOODBANK](
	[cid] [int] NOT NULL,
	[bname] [varchar](50) NULL,
	[baddress] [varchar](50) NULL,
	[bnumber] [varchar](20) NULL,
	[did] [int] NULL,
	[pid] [int] NULL,
 CONSTRAINT [PK_BLOODBANK] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONOR]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONOR](
	[did] [int] NOT NULL,
	[dname] [varchar](50) NULL,
	[dgroup] [varchar](50) NULL,
	[dreport] [varchar](50) NULL,
	[daddress] [varchar](50) NULL,
	[dnumber] [varchar](20) NULL,
	[tid] [int] NULL,
 CONSTRAINT [PK_DONOR_1] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONOR_BLOODBANK]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONOR_BLOODBANK](
	[did] [int] NOT NULL,
	[cid] [int] NULL,
 CONSTRAINT [PK_DONOR_BLOODBANK] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENT]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENT](
	[pid] [int] NOT NULL,
	[pname] [varchar](50) NULL,
	[pgroup] [varchar](50) NULL,
	[pdisease] [varchar](50) NULL,
 CONSTRAINT [PK_DONOR] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENT_BLOODBANK]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENT_BLOODBANK](
	[pid] [int] NOT NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TESTCENTER]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TESTCENTER](
	[tid] [int] NOT NULL,
	[ttimes] [int] NULL,
	[tname] [varchar](50) NULL,
	[tnumber] [varchar](50) NULL,
	[tdate] [date] NULL,
 CONSTRAINT [PK_TESTCENTER] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TESTCENTER_DONOR]    Script Date: 3/27/2019 11:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TESTCENTER_DONOR](
	[tid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3100211, N'Foundation Hospital', N'20 East St Margarets Ave. Faribault, MN 55021', N'2025550148', 246789, 146789)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3100212, N'Foundation Hospital', N'20 East St Margarets Ave. Faribault, MN 55021', N'2025550148', 235678, 145678)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3100213, N'Foundation Hospital', N'20 East St Margarets Ave. Faribault, MN 55021', N'2025550148', 256789, 156789)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3254581, N'General Hospital', N'731 South Alton Rd. Holbrook, NY 11741', N'6144678901', 278901, 157890)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3254582, N'General Hospital', N'731 South Alton Rd. Holbrook, NY 11741', N'6144678901', 278906, 167890)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3254583, N'General Hospital', N'731 South Alton Rd. Holbrook, NY 11741', N'6144678901', 267890, 168901)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3321020, N'UP Health System', N'19 Branch Dr. North Andover, MA 01845', N'5712345678', 213456, 123456)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3321021, N'UP Health System', N'19 Branch Dr. North Andover, MA 01845', N'5712345678', 214567, 124567)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3321022, N'UP Health System', N'19 Branch Dr. North Andover, MA 01845', N'5712345678', 245678, 134567)
INSERT [dbo].[BLOODBANK] ([cid], [bname], [baddress], [bnumber], [did], [pid]) VALUES (3321023, N'UP Health System', N'19 Branch Dr. North Andover, MA 01845', N'5712345678', 257890, 135678)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (213456, N'Jane Miranda', N'A', N'Qualified', N'513 Sunset Dr. Greenfield, IN 46140', N'6142564850', 456789)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (214567, N'Roxanne Nichols', N'B', N'Qualified', N'671 N. Yukon Ave. North Haven, CT 06473', N'7205412563', 467890)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (234567, N'Summer Fitzpatrick', N'AB', N'Unqualified', N'393 Studebaker St. North Brunswick, NJ 08902', N'2205648950', 478901)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (235678, N'Stephanie Copeland', N'AB', N'Qualified', N'241 Cross St. Lexington, NC 27292', N'6552325480', 489012)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (245678, N'Anika Harris', N'O', N'Qualified', N'232 West Lake Dr. Marysville, OH 43040', N'1548954785', 490123)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (246789, N'Tina Mccormick', N'B', N'Qualified', N'7831 SW. Kent Avenue Wappingers Falls, NY 12590', N'6548523580', 401234)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (256789, N'Scarlett Ryan', N'O', N'Qualified', N'7668 Winding Way Lane Orland Park, IL 60462', N'9874052150', 412345)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (257890, N'Abigail Lowery', N'A', N'Qualified', N'8912 Henry Ave. Bloomington, IN 47401', N'2456589560', 423456)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (267890, N'Ruth Davies', N'B', N'Qualified', N'576 Newcastle Drive Harrisburg, PA 17109', N'4785689540', 434567)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (268901, N'Zahra Rhodes', N'O', N'Unqualified', N'81 Military Drive Hilliard, OH 43026', N'5504569850', 445678)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278901, N'Izaak Watson', N'AB', N'Qualified', N'4801  Juniper Drive,Saginaw,MI 48607', N'2025550130', 457890)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278902, N'Cassie Davis', N'O', N'Unqualified', N'3468  Rowes Lane, PEDRICKTOWN, NJ 08067', N'6202550187', 457891)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278903, N'Avaya Matthams', N'B', N'Unqualified', N'4744  Biddie Lane, Richmond, VA 23227', N'6203580897', 457901)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278904, N'Asmaa Roth', N'B', N'Unqualified', N'1070  Wildwood Street, Kent,OH 44240', N'5908984023', 458901)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278905, N'Zayaan Everett', N'O', N'Unqualified', N'2899  Melrose Street, Wapato, WA 98951', N'9837601389', 467891)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278906, N'Elly Burks', N'A', N'Qualified', N'2292  Harper Street, Paducah, KY 42001', N'9876409867', 467892)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278907, N'Karim Ali', N'AB', N'Unqualified', N'271  Fleming Street, Montgomery, AL 36109', N'4799760987', 467893)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278908, N'Keaton Sharma', N'AB', N'Unqualified', N'3580  University Hill Road, Champaign, IL 61820', N'6783767909', 467894)
INSERT [dbo].[DONOR] ([did], [dname], [dgroup], [dreport], [daddress], [dnumber], [tid]) VALUES (278909, N'Sidra Stout', N'B', N'Unqualified', N'3624  Bluff Street, Reston MD 22090', N'2387658769', 467895)
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (123456, N'Gary Kier', N'A', N'Cerebral hemorrhage')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (124567, N'Rebecca Miller', N'B', N'Leukemia')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (134567, N'Samantha Moore', N'O', N'Cerebral hemorrhage')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (135678, N'Kayla Johnson', N'A', N'Infection')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (145678, N'Melissa Brown', N'AB', N'Kidney disease')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (146789, N'Victoria Davis', N'B', N'Thrombocytopenia')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (156789, N'Alexandra Wilson', N'O', N'Chronic condition')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (157890, N'Anna Williams', N'AB', N'Infection')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (167890, N'Laura Jones', N'A', N'Cancer')
INSERT [dbo].[PATIENT] ([pid], [pname], [pgroup], [pdisease]) VALUES (168901, N'Chelsea Taylor', N'B', N'Leukemia')
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (401234, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-02-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (412345, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (423456, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-05-01' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (434567, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (445678, 6, N'LabsMD', N'8889522763', CAST(N'2018-02-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (456789, 4, N'LabCorp', N'8635721789', CAST(N'2018-03-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (457890, 4, N'LabsMD', N'8889522763', CAST(N'2018-04-01' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (457891, 5, N'LabsMD', N'8889522763', CAST(N'2018-04-04' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (457901, 6, N'LabsMD', N'8889522763', CAST(N'2018-05-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (458901, 7, N'LabsMD', N'8889522763', CAST(N'2018-01-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467890, 4, N'LabCorp', N'8635721789', CAST(N'2018-03-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467891, 5, N'LabsMD', N'8889522763', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467892, 4, N'Health labs', N'8005793914', CAST(N'2018-04-22' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467893, 6, N'Health labs', N'8005793914', CAST(N'2018-05-20' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467894, 7, N'Health labs', N'8005793914', CAST(N'2018-05-25' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (467895, 6, N'Health labs', N'8005793914', CAST(N'2018-01-22' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (478901, 5, N'LabCorp', N'8635721789', CAST(N'2018-02-02' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (489012, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-02-28' AS Date))
INSERT [dbo].[TESTCENTER] ([tid], [ttimes], [tname], [tnumber], [tdate]) VALUES (490123, 4, N'Private MD Labs', N'8772837882', CAST(N'2018-03-05' AS Date))
ALTER TABLE [dbo].[DONOR_BLOODBANK]  WITH CHECK ADD  CONSTRAINT [FK__DONOR_BLOO__bbid__3C69FB99] FOREIGN KEY([cid])
REFERENCES [dbo].[BLOODBANK] ([cid])
GO
ALTER TABLE [dbo].[DONOR_BLOODBANK] CHECK CONSTRAINT [FK__DONOR_BLOO__bbid__3C69FB99]
GO
ALTER TABLE [dbo].[PATIENT_BLOODBANK]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[BLOODBANK] ([cid])
GO
ALTER TABLE [dbo].[TESTCENTER_DONOR]  WITH CHECK ADD FOREIGN KEY([tid])
REFERENCES [dbo].[DONOR] ([did])
GO
USE [master]
GO
ALTER DATABASE [CS504 PROJECT] SET  READ_WRITE 
GO
