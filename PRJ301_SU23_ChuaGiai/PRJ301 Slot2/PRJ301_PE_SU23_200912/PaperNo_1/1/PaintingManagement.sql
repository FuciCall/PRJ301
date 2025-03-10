USE [master]
GO
/****** Object:  Database [PaintingManagement]    Script Date: 10/06/2023 11:46:52 AM ******/
CREATE DATABASE [PaintingManagement]
 
USE [PaintingManagement]
GO

CREATE TABLE [dbo].[tblPainting](
	[id] [char](5) NULL,
	[creator] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[height] [int] NULL,
	[width] [int] NULL,
	[price] [float] NULL,
	[status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/06/2023 11:46:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[roleID] [char](2) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblPainting] ([id], [creator], [description], [height], [width], [price], [status]) VALUES (N'P004 ', N'FPT 1', N'Tranh son dau 4', 12, 24, 90, 0)
INSERT [dbo].[tblPainting] ([id], [creator], [description], [height], [width], [price], [status]) VALUES (N'P005 ', N'FPT 2', N'Tranh son dau 5', 9, 12, 75, 0)
INSERT [dbo].[tblPainting] ([id], [creator], [description], [height], [width], [price], [status]) VALUES (N'P006 ', N'FPT 3', N'Tranh sown dau 6', 6, 9, 45, 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'QL002', N'Administrator', N'AD', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'SE003', N'I am User', N'US', N'1')

SELECT * FROM [tblUsers] WHERE [userID] = 'QL002' AND [password] = '1'