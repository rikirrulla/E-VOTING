USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Partia]    Script Date: 6/21/2020 9:00:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Partia](
	[numri_partis] [int] NOT NULL,
	[emri_partis] [varchar](50) NOT NULL,
 CONSTRAINT [PK_partia] PRIMARY KEY CLUSTERED 
(
	[numri_partis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


------------

USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Perdoruesi]    Script Date: 6/21/2020 9:00:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Perdoruesi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perdoruesi] [varchar](50) NULL,
	[fjalkalimi] [varchar](50) NULL,
	[emri] [varchar](50) NULL,
	[mbiemri] [varchar](50) NULL,
	[numri_telefonit] [varchar](50) NULL,
 CONSTRAINT [PK_Perdoruesi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



--------






USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Personi]    Script Date: 6/21/2020 9:00:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personi](
	[idPersoni] [int] NOT NULL,
	[emri] [varchar](50) NOT NULL,
	[mbiemri] [varchar](50) NOT NULL,
	[ditelindja] [varchar](10) NOT NULL,
	[gjinia] [varchar](10) NOT NULL,
	[numri_leternjoftimit] [varchar](20) NOT NULL,
	[adresa] [varchar](50) NOT NULL,
	[vendi] [varchar](50) NOT NULL,
	[komuna] [varchar](50) NOT NULL,
	[numri_personal] [int] NULL,
 CONSTRAINT [PK_Personi] PRIMARY KEY CLUSTERED 
(
	[idPersoni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[VerfikimiVotuesit]    Script Date: 6/21/2020 9:00:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VerfikimiVotuesit](
	[numri_personal] [int] NOT NULL,
	[hashscode] [varchar](60) NULL,
	[emri] [varchar](50) NULL,
	[mbiemri] [varchar](50) NULL,
	[ditlindja] [varchar](50) NULL,
	[gjinia] [varchar](10) NULL,
	[numri_leternjoftimit] [varchar](50) NULL,
	[adresa] [varchar](50) NULL,
	[vendi] [varchar](50) NULL,
	[komuna] [varchar](50) NULL,
	[ka_votuar] [varchar](50) NULL,
 CONSTRAINT [PK_VerfikimiVotuesit] PRIMARY KEY CLUSTERED 
(
	[numri_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-----


USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Votat]    Script Date: 6/21/2020 9:00:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Votat](
	[numri_votes] [int] IDENTITY(1,1) NOT NULL,
	[emri_partis] [varchar](50) NULL,
	[kandidati_pare] [varchar](50) NULL,
	[kandidati_dyte] [varchar](50) NULL,
	[kandidati_trete] [varchar](50) NULL,
	[kandidati_katert] [varchar](50) NULL,
	[kandidati_peste] [varchar](50) NULL,
	[vendi] [varchar](50) NULL,
	[komuna] [nchar](10) NULL,
	[koha_votuar] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[numri_votes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Zgjedhje]    Script Date: 6/21/2020 9:01:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zgjedhje](
	[numri_zgjedhjeve] [varchar](20) NOT NULL,
	[tipi_zgjedhjeve] [varchar](20) NOT NULL,
	[data_zgjedhjeve] [date] NOT NULL,
	[statusi_zgjedhjeve] [varchar](11) NOT NULL,
	[aeskey] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Zgjedhjet] PRIMARY KEY CLUSTERED 
(
	[numri_zgjedhjeve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


------------


USE [Zgjedhjet]
GO

/****** Object:  Table [dbo].[Kandidati]    Script Date: 6/21/2020 9:01:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kandidati](
	[kandidati_id] [varchar](11) NOT NULL,
	[emri_mbiemri] [varchar](50) NULL,
	[ditelindja] [date] NULL,
	[numri_kandidatit] [int] NULL,
	[dega] [varchar](50) NULL,
	[vendi] [varchar](50) NULL,
	[komuna] [varchar](50) NULL,
	[numri_zgjedhjeve] [varchar](20) NULL,
	[numri_partis] [int] NULL,
	[numri_zgjedheve] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[kandidati_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Kandidati]  WITH CHECK ADD FOREIGN KEY([numri_zgjedhjeve])
REFERENCES [dbo].[Zgjedhje] ([numri_zgjedhjeve])
GO

ALTER TABLE [dbo].[Kandidati]  WITH CHECK ADD FOREIGN KEY([numri_partis])
REFERENCES [dbo].[Partia] ([numri_partis])
GO





