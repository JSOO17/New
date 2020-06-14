USE [New]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13/06/2020 21:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameCity] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrentWeather]    Script Date: 13/06/2020 21:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentWeather](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObservationTime] [datetime] NULL,
	[Temperature] [int] NULL,
	[WeatherDescription] [varchar](30) NULL,
	[WindSpeed] [int] NULL,
	[WindDegree] [int] NULL,
	[windDir] [varchar](10) NULL,
	[Pressure] [int] NULL,
	[Precip] [int] NULL,
	[HumidiTy] [int] NULL,
	[CloudOver] [int] NULL,
	[Feelslike] [int] NULL,
	[Visibility] [int] NULL,
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 13/06/2020 21:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[NameCity] [varchar](100) NULL,
	[SearchedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 13/06/2020 21:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [varchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [text] NULL,
	[Url] [nvarchar](300) NULL,
	[UrlToImage] [nvarchar](300) NULL,
	[PublishedAt] [datetime] NULL,
	[Content] [text] NULL,
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CurrentWeather]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
