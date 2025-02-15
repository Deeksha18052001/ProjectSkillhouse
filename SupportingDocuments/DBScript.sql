
USE [CollaboSphere]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](100) NOT NULL,
	[UploadDate] [datetime] NULL,
	[UploadedByUserID] [int] NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK__Document__1ABEEF6FED1D15AB] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](100) NOT NULL,
	[ProjectDescription] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ProjectManagerID] [int] NULL,
 CONSTRAINT [PK__Project__761ABED0CDD7BC6D] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[RoleDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK__Role__8AFACE3A0D32802F] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](100) NOT NULL,
	[TaskDescription] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[AssignedToUserID] [int] NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK__Task__7C6949D1910F0BF6] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__User__1788CCACCCC6D7CF] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XYZ]    Script Date: 01-11-2023 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XYZ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Column1] [varchar](100) NULL,
	[Column2] [varchar](100) NULL,
 CONSTRAINT [PK__XYZ__3214EC278DF73C39] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK__Document__Projec__440B1D61] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK__Document__Projec__440B1D61]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK__Document__Upload__4316F928] FOREIGN KEY([UploadedByUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK__Document__Upload__4316F928]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK__Project__Project__3C69FB99] FOREIGN KEY([ProjectManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK__Project__Project__3C69FB99]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK__Task__AssignedTo__3F466844] FOREIGN KEY([AssignedToUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK__Task__AssignedTo__3F466844]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK__Task__ProjectID__403A8C7D] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK__Task__ProjectID__403A8C7D]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__RoleID__398D8EEE] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__RoleID__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [CollaboSphere] SET  READ_WRITE 
GO
