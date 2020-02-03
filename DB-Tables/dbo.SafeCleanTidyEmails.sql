USE [FStepRubbishRecycling_prod]
GO

/****** Object:  Table [dbo].[SafeCleanTidyEmails]    Script Date: 03/02/2020 13:59:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SafeCleanTidyEmails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](50) NULL
) ON [PRIMARY]
GO

