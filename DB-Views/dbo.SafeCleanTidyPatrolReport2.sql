USE [FStepRubbishRecycling_prod]
GO

/****** Object:  View [dbo].[SafeCleanTidyPatrolReport2]    Script Date: 03/02/2020 14:00:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




























CREATE view [dbo].[SafeCleanTidyPatrolReport2]
AS

 
 SELECT 
Reference as Reference,
 Contact as Customer,
 DateReported as DateLogged,
 Replace(CONVERT(VARCHAR(20), DateReported, 103),'/','-') AS DateReported,
 ISNULL (WasteDescription, CorrectWasteDescription) AS WasteReported,
LocationReported AS ReportedLocation,
   Postcode as Postcode,
  Road AS Road
 -- (FinalOutcome + ' ' + InvestigationComments) AS Outcome
  from SafeCleanTidyUWaste 
  
  UNION
  
  
   SELECT 
   CaseNo as Reference,
   Contact as Customer,
   recorded_date,
   Replace(CONVERT(VARCHAR(20), recorded_date, 103),'/','-') AS DateReported,
  ColTypes AS WasteReported,
    cast(Address as varchar(100))  AS ReportedLocation,
     Postcode as Postcode,
	 Road AS Road
    -- convert(varchar(100),Address)l AS Road,
  --recorded_by AS Outcome
  from MissedColl

















GO

