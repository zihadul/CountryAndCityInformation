
CREATE TABLE [dbo].[CountryTBL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[AboutCountry] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CountryTBL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CityTBL]    Script Date: 06/08/2015 02:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityTBL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[AboutCity] [varchar](250) NOT NULL,
	[NoOfDwellers] [decimal](18, 0) NOT NULL,
	[Location] [varchar](150) NOT NULL,
	[Weather] [varchar](150) NOT NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_CityTBL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_CityTBL_CountryTBL]    Script Date: 06/08/2015 02:36:29 ******/
ALTER TABLE [dbo].[CityTBL]  WITH CHECK ADD  CONSTRAINT [FK_CityTBL_CountryTBL] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryTBL] ([Id])
GO
ALTER TABLE [dbo].[CityTBL] CHECK CONSTRAINT [FK_CityTBL_CountryTBL]
GO
