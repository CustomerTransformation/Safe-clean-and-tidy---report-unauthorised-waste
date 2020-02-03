USE [FStepRubbishRecycling_prod]
GO

/****** Object:  Table [dbo].[SafeCleanTidyUWaste]    Script Date: 03/02/2020 13:59:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SafeCleanTidyUWaste](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateReported] [date] NULL,
	[Reference] [varchar](20) NULL,
	[Contact] [varchar](60) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](30) NULL,
	[LocationReported] [varchar](100) NULL,
	[Postcode] [varchar](10) NULL,
	[Road] [varchar](100) NULL,
	[FirstLineAddress] [varchar](100) NULL,
	[ProvideMoreInfo] [varchar](max) NULL,
	[WasteStillThere] [varchar](5) NULL,
	[WhereIsWaste] [varchar](max) NULL,
	[WasteDescription] [varchar](max) NULL,
	[WasItWitnessed] [varchar](5) NULL,
	[WitnessedDate] [varchar](15) NULL,
	[WitnessComment] [varchar](max) NULL,
	[GoToCourt] [varchar](3) NULL,
	[LandOwnership] [varchar](max) NULL,
	[WhichLand] [varchar](max) NULL,
	[OtherLand] [varchar](max) NULL,
	[ResourceControllerOutcome] [varchar](max) NULL,
	[AssignTo] [varchar](max) NULL,
	[ResourceControllerComments] [varchar](max) NULL,
	[ResourceControllerDate] [varchar](max) NULL,
	[ResourceController] [varchar](max) NULL,
	[CaseDueDate] [varchar](max) NULL,
	[CleanClearFix] [varchar](100) NULL,
	[AcceptJob] [varchar](max) NULL,
	[ReasonJobRejected] [varchar](max) NULL,
	[WasteFound] [varchar](max) NULL,
	[AddressCorrect] [varchar](max) NULL,
	[CorrectLocation] [varchar](max) NULL,
	[WasteDescriptionCorrect] [varchar](max) NULL,
	[CorrectWasteDescription] [varchar](max) NULL,
	[WasteCategory] [varchar](max) NULL,
	[Volume] [varchar](max) NULL,
	[AccessibleForRemoval] [varchar](max) NULL,
	[HealthAndSafetyConcerns] [varchar](max) NULL,
	[Evidence] [varchar](max) NULL,
	[OfficialTip] [varchar](max) NULL,
	[OfficialNotices] [varchar](max) NULL,
	[OfficialNoticeDate] [varchar](max) NULL,
	[InvestigationComments] [varchar](max) NULL,
	[InvestigationDate] [varchar](max) NULL,
	[InvestigationOfficer] [varchar](max) NULL,
	[InvestigationOutcome] [varchar](max) NULL,
	[EnforcementDate] [varchar](max) NULL,
	[EnforcementOfficer] [varchar](max) NULL,
	[FinalOutcome] [varchar](max) NULL,
	[CaseFileNumber] [varchar](max) NULL,
	[CommentsEnforcement] [varchar](max) NULL,
	[ExplainWasteOther] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

