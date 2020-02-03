USE [FStepFormsTasks_prod]
GO

/****** Object:  Table [dbo].[AddressesWithoutPostcodes]    Script Date: 03/02/2020 13:57:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AddressesWithoutPostcodes](
	[Postal_Address] [varchar](8000) NULL,
	[EASTING] [numeric](12, 4) NULL,
	[NORTHING] [numeric](12, 4) NULL,
	[UPRN] [float] NULL,
	[LOGICAL_STATUS] [tinyint] NOT NULL,
	[description] [varchar](100) NULL,
	[postcode] [varchar](8) NULL,
	[NEVEREXPORT] [bit] NULL
) ON [PRIMARY]
GO

