USE [master]
GO
/****** Object:  Database [renting]    Script Date: 5/30/2022 5:22:49 PM ******/
CREATE DATABASE [renting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'renting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\renting.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'renting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\renting_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [renting] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [renting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [renting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [renting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [renting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [renting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [renting] SET ARITHABORT OFF 
GO
ALTER DATABASE [renting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [renting] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [renting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [renting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [renting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [renting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [renting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [renting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [renting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [renting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [renting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [renting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [renting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [renting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [renting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [renting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [renting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [renting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [renting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [renting] SET  MULTI_USER 
GO
ALTER DATABASE [renting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [renting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [renting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [renting] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [renting]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 5/30/2022 5:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[a_username] [varchar](20) NOT NULL,
	[a_password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[a_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client]    Script Date: 5/30/2022 5:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[c_username] [varchar](20) NOT NULL,
	[c_password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[c_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[game]    Script Date: 5/30/2022 5:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[game](
	[g_name] [varchar](20) NOT NULL,
	[g_ID] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NOT NULL,
	[category] [varchar](20) NOT NULL,
	[v_username] [varchar](20) NULL,
	[year] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[g_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ordering]    Script Date: 5/30/2022 5:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ordering](
	[month] [int] NOT NULL,
	[year] [int] NOT NULL,
	[o_type] [varchar](20) NOT NULL,
	[g_ID] [int] NOT NULL,
	[c_username] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 5/30/2022 5:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[v_password] [varchar](20) NOT NULL,
	[v_username] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[v_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[game]  WITH CHECK ADD FOREIGN KEY([v_username])
REFERENCES [dbo].[Vendor] ([v_username])
GO
ALTER TABLE [dbo].[game]  WITH CHECK ADD  CONSTRAINT [fk_test3] FOREIGN KEY([v_username])
REFERENCES [dbo].[Vendor] ([v_username])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[game] CHECK CONSTRAINT [fk_test3]
GO
ALTER TABLE [dbo].[ordering]  WITH CHECK ADD FOREIGN KEY([c_username])
REFERENCES [dbo].[client] ([c_username])
GO
ALTER TABLE [dbo].[ordering]  WITH CHECK ADD FOREIGN KEY([g_ID])
REFERENCES [dbo].[game] ([g_ID])
GO
ALTER TABLE [dbo].[ordering]  WITH CHECK ADD  CONSTRAINT [fk_test1] FOREIGN KEY([c_username])
REFERENCES [dbo].[client] ([c_username])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ordering] CHECK CONSTRAINT [fk_test1]
GO
ALTER TABLE [dbo].[ordering]  WITH CHECK ADD  CONSTRAINT [fk_test2] FOREIGN KEY([c_username])
REFERENCES [dbo].[client] ([c_username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordering] CHECK CONSTRAINT [fk_test2]
GO
ALTER TABLE [dbo].[ordering]  WITH CHECK ADD  CONSTRAINT [fk_test4] FOREIGN KEY([g_ID])
REFERENCES [dbo].[game] ([g_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordering] CHECK CONSTRAINT [fk_test4]
GO
USE [master]
GO
ALTER DATABASE [renting] SET  READ_WRITE 
GO
