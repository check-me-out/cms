/*
USE [master]
GO

CREATE DATABASE [GuruInBlogDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GuruInBlogDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GuruInBlogDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GuruInBlogDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GuruInBlogDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GuruInBlogDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GuruInBlogDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GuruInBlogDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GuruInBlogDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GuruInBlogDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GuruInBlogDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GuruInBlogDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GuruInBlogDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GuruInBlogDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GuruInBlogDB] SET  MULTI_USER 
GO
ALTER DATABASE [GuruInBlogDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GuruInBlogDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GuruInBlogDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GuruInBlogDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GuruInBlogDB', N'ON'
GO
*/
USE [GuruInBlogDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BadWords]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadWords](
	[Keyword] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.BadWords] PRIMARY KEY CLUSTERED 
(
	[Keyword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UrlSlug] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Content] [nvarchar](3000) NOT NULL,
	[CommentedOn] [datetime] NOT NULL,
	[NotifyOnComments] [bit] NOT NULL,
	[NotifyOnPosts] [bit] NOT NULL,
	[Post_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[UrlSlug] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
	[PostedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[Category_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 07/02/2017 15:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UrlSlug] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Class] [nvarchar](max) NULL,
	[Post_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Post_Id]    Script Date: 07/02/2017 15:20:26 ******/
CREATE NONCLUSTERED INDEX [IX_Post_Id] ON [dbo].[Comments]
(
	[Post_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_Id]    Script Date: 07/02/2017 15:20:26 ******/
CREATE NONCLUSTERED INDEX [IX_Category_Id] ON [dbo].[Posts]
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_Id]    Script Date: 07/02/2017 15:20:26 ******/
CREATE NONCLUSTERED INDEX [IX_Post_Id] ON [dbo].[Tags]
(
	[Post_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Posts_Post_Id] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Posts_Post_Id]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Categories_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Categories_Category_Id]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tags_dbo.Posts_Post_Id] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_dbo.Tags_dbo.Posts_Post_Id]
GO
USE [master]
GO
ALTER DATABASE [GuruInBlogDB] SET  READ_WRITE 
GO






CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NULL,
	[Forename] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO



CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO


CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO





SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (1, N'Knockout JS', N'konckout-ko-js', N'Knockout JS')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (2, N'Angular JS', N'angular-js', N'Angular JS')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (3, N'jQuery', N'jquery', N'jQuery')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (4, N'Javascript', N'javascript', N'Javascript')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (5, N'ASP.NET MVC', N'asp-net-mvc', N'ASP.NET MVC')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (6, N'.NET Framework', N'dot-net-framework', N'.NET Framework')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (7, N'ASP.NET WebAPI', N'asp-net-web-api', N'ASP.NET WebAPI')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (8, N'C# .NET', N'csharp-dot-net', N'C# .NET')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (9, N'SQL Database', N'sql-database', N'SQL Database')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (10, N'Software Development', N'software-development', N'Software Development')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (11, N'Security', N'security', N'Security')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (12, N'Error Handling', N'error-handling', N'Error Handling')
INSERT [dbo].[Categories] ([Id], [Name], [UrlSlug], [Description]) VALUES (13, N'Visual Studio', N'visual-studio', N'Visual Studio')
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (1, N'ASP.NET', N'asp-net', N'ASP.NET', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (2, N'ASP.NET MVC', N'asp-net-mvc', N'ASP.NET MVC', N'size-md', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (3, N'C#', N'c-sharp-programming-language', N'C# Programming Language', N'size-lg', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (4, N'Code', N'programming-code', N'Programming Code', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (5, N'Javascript', N'javascript', N'Javascript', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (6, N'jQuery', N'jquery', N'jQuery', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (7, N'KnockoutJs', N'knockout-js', N'Knockout JS', N'size-md', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (8, N'AngularJs', N'angular-js', N'Angular JS', N'size-lg', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (9, N'Bootstrap', N'bootstrap', N'Bootstrap', N'size-md', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (10, N'Less-Sass', N'sass-less', N'Sass-Less', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (11, N'Type Script', N'type-js', N'Type Script', N'size-md', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (12, N'SQL', N'sql-database', N'T-SQL', N'size-lg', NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (13, N'TFS', N'team-foundation-server', N'TFS', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (14, N'Visual Studio', N'visual-studio', N'Visual Studio', NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [UrlSlug], [Description], [Class], [Post_Id]) VALUES (15, N'Validation', N'validation', N'Validation', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF


INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'4r5e')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'50 yard cunt punt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'5h1t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'5hit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'a_s_s')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'a2m')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'a55')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'adult')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'amateur')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'anal')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'anal impaler')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'anal leakage')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'anilingus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'anus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ar5e')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'arrse')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'arse')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'arsehole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ass')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ass fuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'asses')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'assfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ass-fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'assfukka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'asshole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'assholes')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'assmucus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'assmunch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'asswhole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'autoerotic')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'b!tch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'b00bs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'b17ch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'b1tch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ballbag')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ballsack')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bang (one''s) box')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bangbros')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bareback')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bastard')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'beastial')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'beastiality')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'beef curtain')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bellend')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bestial')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bestiality')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bi+ch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'biatch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bimbos')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'birdlock')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitch tit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitcher')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitchers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitches')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitchin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bitching')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bloody')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blow job')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blow me')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blow mud')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blowjob')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blowjobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blue waffle')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'blumpkin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'boiolas')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bollock')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bollok')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'boner')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'boob')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'boobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'booobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'boooobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'booooobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'booooooobs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'breasts')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'buceta')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bugger')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bunny fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'bust a load')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'busty')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'butt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'butt fuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'butthole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'buttmuch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'buttplug')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'c0ck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'c0cksucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'carpet muncher')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'carpetmuncher')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cawk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'chink')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'choade')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'chota bags')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cipa')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cl1t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clit licker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clitoris')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clits')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clitty litter')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'clusterfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cnut')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cock')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cock pocket')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cock snot')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cockface')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cockhead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cockmunch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cockmuncher')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cock-sucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksuka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cocksukka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cok')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cokmuncher')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'coksucka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'coon')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cop some wood')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cornhole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'corp whore')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cox')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cum chugger')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cum dumpster')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cum freak')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cum guzzler')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cumdump')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cummer')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cumming')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cums')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cumshot')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunilingus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunillingus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunnilingus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunt hair')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cuntbag')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cuntlick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cuntlicker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cuntlicking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunts')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cuntsicle')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cunt-struck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cut rope')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyalis')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfuc')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'cyberfucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'd1ck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'damn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dick hole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dick shy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dickhead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dildo')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dildos')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dink')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dinks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dirsa')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dirty Sanchez')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dlck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dog-fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'doggie style')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'doggiestyle')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'doggin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dogging')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'donkeyribber')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'doosh')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'duche')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'dyke')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'eat a dick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'eat hair pie')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculated')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculates')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculating')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculatings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejaculation')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ejakulate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'erotic')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'f u c k')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'f u c k e r')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'f_u_c_k')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'f4nny')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'facial')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fag')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fagging')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'faggitt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'faggot')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'faggs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fagot')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fagots')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fags')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fanny')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fannyflaps')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fannyfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fanyy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fatass')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fcuk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fcuker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fcuking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'feck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fecker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'felching')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fellate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fellatio')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fingerfucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fist fuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfuckings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fistfucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'flange')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'flog the log')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fook')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fooker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck hole')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck puppet')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck trophy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck yo mama')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck-ass')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuck-bitch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckhead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckheads')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckingshitmotherfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckme')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckmeat')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fucktoy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckwhit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuckwit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fudge packer')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fudgepacker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fukker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fukkin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fuks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fukwhit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fukwit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fux')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'fux0r')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gangbang')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gang-bang')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gangbanged')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gangbangs')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gassy ass')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gaylord')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'gaysex')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'goatse')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'god')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'god damn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'god-dam')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'goddamn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'goddamned')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'god-damned')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ham flap')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hardcoresex')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hell')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'heshe')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hoar')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hoare')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hoer')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'homo')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'homoerotic')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hore')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'horniest')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'horny')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'hotsex')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'how to kill')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'how to murdep')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jackoff')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jack-off')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jap')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jerk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jerk-off')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jism')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jiz')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jizm')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'jizz')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kawk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kinky Jesus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knob')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knob end')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobed')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobend')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobhead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobjocky')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'knobjokey')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kock')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kondum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kondums')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kummer')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kumming')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kums')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kunilingus')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'kwif')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'l3i+ch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'l3itch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'labia')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'LEN')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'lmao')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'lmfao')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'lust')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'lusting')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'm0f0')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'm0fo')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'm45terbate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ma5terb8')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'ma5terbate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mafugly')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masochist')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterb8')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterbat*')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterbat3')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterbate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'master-bate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterbation')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masterbations')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'masturbate')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mof0')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mofo')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mo-fo')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafucka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuckas')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuckaz')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuckin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafuckings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mothafucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mother fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfucked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfuckers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfuckin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfucking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfuckings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfuckka')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'motherfucks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'muff')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'muff puff')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mutha')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'muthafecker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'muthafuckker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'muther')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'mutherfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'n1gga')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'n1gger')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nazi')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'need the dick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nigg3r')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nigg4h')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nigga')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'niggah')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'niggas')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'niggaz')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nigger')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'niggers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nob')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nob jokey')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nobhead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nobjocky')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nobjokey')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'numbnuts')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nut butter')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'nutsack')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'omg')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'orgasim')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'orgasims')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'orgasm')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'orgasms')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'p0rn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pawn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pecker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'penis')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'penisfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phonesex')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phukked')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phukking')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'phuq')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pigfucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pimpis')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'piss')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissed')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pisser')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissers')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pisses')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissflaps')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissing')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pissoff')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'poop')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'porn')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'porno')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pornography')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pornos')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'prick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pricks')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pron')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pube')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pusse')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussi')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussies')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussy fart')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussy palace')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'pussys')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'queaf')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'queer')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'rectum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'retard')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'rimjaw')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'rimming')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N's hit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N's.o.b.')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N's_h_i_t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sadism')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sadist')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sandbar')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sausage queen')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'schlong')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'screwing')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'scroat')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'scrote')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'scrotum')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'semen')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sex')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sh!+')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sh!t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sh1t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shag')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shagger')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shaggin')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shagging')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shemale')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shi+')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shit fucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitdick')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shite')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shited')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitey')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitfull')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shithead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shiting')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shits')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitted')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitter')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitters')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitting')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shittings')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'shitty')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'skank')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'slope')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'slut')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'slut bucket')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'sluts')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'smegma')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'smut')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'snatch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'son-of-a-bitch')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'spac')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'spunk')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N't1tt1e5')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N't1tties')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'teets')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'teez')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'testical')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'testicle')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tit')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tit wank')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'titfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tits')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'titt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tittie5')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tittiefucker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'titties')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tittyfuck')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tittywank')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'titwank')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tosser')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'turd')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'tw4t')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'twat')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'twathead')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'twatty')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'twunt')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'twunter')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'v14gra')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'v1gra')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'vagina')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'viagra')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'vulva')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'w00se')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'wang')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'wank')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'wanker')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'wanky')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'whoar')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'whore')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'willies')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'willy')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'wtf')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'xrated')
INSERT [dbo].[BadWords] ([Keyword]) VALUES (N'xxx')

GO
