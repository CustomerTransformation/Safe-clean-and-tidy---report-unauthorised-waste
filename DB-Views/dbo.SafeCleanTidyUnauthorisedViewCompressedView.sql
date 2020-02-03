USE [FStepRubbishRecycling_prod]
GO

/****** Object:  View [dbo].[SafeCleanTidyUnauthorisedViewCompressed]    Script Date: 03/02/2020 14:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [dbo].[SafeCleanTidyUnauthorisedViewCompressed]
AS
SELECT 
Reference,
DateReported,
WasteCategory,
Volume,
LandOwnership,
WhichLand,
OtherLand,
OfficialTip,
CommentsEnforcement,
EnforcementOfficer

FROM SafeCleanTidyUWaste













GO

