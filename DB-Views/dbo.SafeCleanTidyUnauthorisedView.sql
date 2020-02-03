USE [FStepRubbishRecycling_prod]
GO

/****** Object:  View [dbo].[SafeCleanTidyUnauthorisedView]    Script Date: 03/02/2020 14:01:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [dbo].[SafeCleanTidyUnauthorisedView]
AS
SELECT 
Reference,

CONVERT(VARCHAR(20),DateReported,103) as DateReported, 
Contact,
Email,
Telephone,
LocationReported,
Postcode,
Road,
ProvideMoreInfo,
WasteStillThere,
WhereIsWaste,
WasteDescription,
WasItWitnessed,
WitnessedDate,
WitnessComment,
GoToCourt,
LandOwnership,
WhichLand,
OtherLand,
ResourceControllerOutcome,
AssignTo,
ResourceControllerComments,
ResourceControllerDate,
ResourceController,
CaseDueDate,
CleanClearFix,
AcceptJob,
ReasonJobRejected,
WasteFound,
AddressCorrect,
CorrectLocation,
WasteDescriptionCorrect,
CorrectWasteDescription,
OfficialTip,
ExplainWasteOther,
WasteCategory,
Volume,
AccessibleForRemoval,
HealthAndSafetyConcerns,
Evidence,
OfficialNotices,
OfficialNoticeDate,
InvestigationComments,
InvestigationDate,
InvestigationOfficer,
InvestigationOutcome,
EnforcementDate,
EnforcementOfficer,
CommentsEnforcement,
FinalOutcome,
CaseFileNumber
 FROM SafeCleanTidyUWaste













GO

