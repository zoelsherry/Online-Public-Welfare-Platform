USE [master]
GO
/****** Object:  Database [GY]    Script Date: 11/09/2016 15:09:49 ******/
CREATE DATABASE [GY] ON  PRIMARY 
( NAME = N'GY', FILENAME = N'D:\GY.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GY_log', FILENAME = N'D:\GY_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GY] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GY].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [GY] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GY] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GY] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GY] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GY] SET ARITHABORT OFF
GO
ALTER DATABASE [GY] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GY] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GY] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GY] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GY] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GY] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GY] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GY] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GY] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GY] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GY] SET  DISABLE_BROKER
GO
ALTER DATABASE [GY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GY] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GY] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GY] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GY] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GY] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GY] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GY] SET  READ_WRITE
GO
ALTER DATABASE [GY] SET RECOVERY FULL
GO
ALTER DATABASE [GY] SET  MULTI_USER
GO
ALTER DATABASE [GY] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GY] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'GY', N'ON'
GO
USE [GY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([UserName], [Password], [Role]) VALUES (N'superAdmin', N'111111', N'super')
INSERT [dbo].[admin] ([UserName], [Password], [Role]) VALUES (N'璃音', N'111111', N'common')
/****** Object:  Table [dbo].[actMember]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actMember](
	[ActMemberID] [int] NOT NULL,
	[ActName] [varchar](50) NOT NULL,
	[UserMail] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_actMember] PRIMARY KEY CLUSTERED 
(
	[ActMemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[actMember] ([ActMemberID], [ActName], [UserMail], [UserName]) VALUES (1, N'京哈高速强救狗狗行动', N'prince_fuji@hotmail.com', N'璃音')
INSERT [dbo].[actMember] ([ActMemberID], [ActName], [UserMail], [UserName]) VALUES (2, N'京哈高速强救狗狗行动', N'lanmiao@qq.com', N'lan喵')
INSERT [dbo].[actMember] ([ActMemberID], [ActName], [UserMail], [UserName]) VALUES (3, N'玉渊潭水质观察活动', N'lanmiao@qq.com', N'lan喵')
/****** Object:  Table [dbo].[activity]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[activity](
	[ActID] [int] NOT NULL,
	[OrgName] [varchar](50) NOT NULL,
	[ActName] [varchar](50) NOT NULL,
	[ActClass] [varchar](50) NOT NULL,
	[StartTime] [varchar](50) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Intro] [varchar](50) NOT NULL,
	[Cover] [varchar](50) NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[ActID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[activity] ([ActID], [OrgName], [ActName], [ActClass], [StartTime], [EndTime], [Address], [Intro], [Cover]) VALUES (1, N'流浪动物救助站', N'京哈高速强救狗狗行动', N'救助', N'2011-4-25', N'2011-5-1', N'北京京哈高速路段及各地区宠物医院', N'500只被救狗狗的转移及强救工作', N'images/e439627.jpg')
INSERT [dbo].[activity] ([ActID], [OrgName], [ActName], [ActClass], [StartTime], [EndTime], [Address], [Intro], [Cover]) VALUES (2, N'达尔文求知学社', N'玉渊潭水质观察活动', N'讲座/沙龙', N'2011-4-28', N'2011-4-28', N'北京玉渊潭公园', N'水的自然观察', N'images/e217401.jpg')
/****** Object:  Table [dbo].[users]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [int] NOT NULL,
	[UserMail] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Sex] [varchar](50) NOT NULL,
	[Tel] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[UserCover] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[users] ([UserID], [UserMail], [Password], [UserName], [Sex], [Tel], [City], [UserCover]) VALUES (1, N'prince_fuji@hotmail.com', N'111111', N'璃音', N'女', N'111111111', N'北京', N'images/photo/u3176209-41.jpg')
INSERT [dbo].[users] ([UserID], [UserMail], [Password], [UserName], [Sex], [Tel], [City], [UserCover]) VALUES (2, N'lanmiao@qq.com', N'111111', N'lan喵', N'女', N'111111111', N'北京', N'images/photo/u50069502-2.jpg')
INSERT [dbo].[users] ([UserID], [UserMail], [Password], [UserName], [Sex], [Tel], [City], [UserCover]) VALUES (3, N'huizi@qq.com', N'123456', N'Nancy慧子', N'女', N'111111111', N'北京', N'images/photo/u43949451-2.jpg')
INSERT [dbo].[users] ([UserID], [UserMail], [Password], [UserName], [Sex], [Tel], [City], [UserCover]) VALUES (4, N'843644573@qq.com', N'111111', N'达尔文', N'男', N'111111111', N'上海', NULL)
/****** Object:  Table [dbo].[organizer]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[organizer](
	[UserID] [int] NOT NULL,
	[UserMail] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Class] [varchar](50) NOT NULL,
	[Tel] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Number] [int] NULL,
	[AdminName] [varchar](50) NOT NULL,
	[UserCover] [varchar](50) NULL,
	[Intro] [varchar](2000) NOT NULL,
	[Remark] [varchar](2000) NULL,
 CONSTRAINT [PK_organizer_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[organizer] ([UserID], [UserMail], [UserName], [Class], [Tel], [City], [Number], [AdminName], [UserCover], [Intro], [Remark]) VALUES (1, N'prince_fuji@hotmail.com', N'流浪动物救助站', N'救助、环保', N'111111111', N'北京', 3, N'璃音', N'images/photo/p940048843.jpg', N'由志愿者组成的流浪动物救助工作团队', N'无')
INSERT [dbo].[organizer] ([UserID], [UserMail], [UserName], [Class], [Tel], [City], [Number], [AdminName], [UserCover], [Intro], [Remark]) VALUES (2, N'843644573@qq.com', N'达尔文求知学社', N'环保', N'111111111', N'北京', 3, N'达尔文', N'images/photo/0b95206241cb46c.jpg', N'自然环保讲座及实践观察学习活动', N'无')
/****** Object:  Table [dbo].[donation]    Script Date: 11/09/2016 15:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[donation](
	[ID] [int] NOT NULL,
	[DonorID] [int] NOT NULL,
	[RecipientID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Time] [varchar](50) NOT NULL,
	[DonorName] [varchar](50) NULL,
	[DonorTel] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_donation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[donation] ([ID], [DonorID], [RecipientID], [Amount], [Time], [DonorName], [DonorTel], [Remark]) VALUES (1, 2, 1, 100, N'2011-5-1', N'lan喵', N'11111111', N'无')
INSERT [dbo].[donation] ([ID], [DonorID], [RecipientID], [Amount], [Time], [DonorName], [DonorTel], [Remark]) VALUES (2, 1, 1, 200, N'2011-4-1', N'璃音', N'11111111', NULL)
/****** Object:  ForeignKey [FK_donation_activity1]    Script Date: 11/09/2016 15:09:51 ******/
ALTER TABLE [dbo].[donation]  WITH CHECK ADD  CONSTRAINT [FK_donation_activity1] FOREIGN KEY([RecipientID])
REFERENCES [dbo].[activity] ([ActID])
GO
ALTER TABLE [dbo].[donation] CHECK CONSTRAINT [FK_donation_activity1]
GO
/****** Object:  ForeignKey [FK_donation_users1]    Script Date: 11/09/2016 15:09:51 ******/
ALTER TABLE [dbo].[donation]  WITH CHECK ADD  CONSTRAINT [FK_donation_users1] FOREIGN KEY([DonorID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[donation] CHECK CONSTRAINT [FK_donation_users1]
GO
