USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyUWasteGetData]    Script Date: 03/02/2020 14:06:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Daniela Dutu
-- Create date: 25/01/2018
-- Description:	writes values to the table SafeCleanTidyPatrols from the form 'Safe Clean Tidy - Patrols'
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyUWasteGetData] 
	@DateReported date,
	@Reference varchar(20),
	@Contact varchar(100),
	@Email varchar(100),
	@Telephone varchar(20),
	@LocationReported varchar(100),
	@ProvideMoreInfo varchar(max),
	@Postcode varchar(10),
	@Road varchar(100),
	@WasteStillThere varchar(3),
	@WhereIsWaste varchar(100),
	@WasteDescription varchar(max),
	@WasItWitnessed varchar(3),
	@WitnessedDate varchar(15),
	@WitnessComment varchar(100),
	@GoToCourt varchar(3),
	@LandOwnership varchar(max),
	@WhichLand varchar(max),
	@OtherLand varchar(max),
	@ResourceControllerOutcome varchar(100),
	@AssignTo varchar(100),
	@ResourceControllerComments varchar(100),
	@ResourceControllerDate varchar(100),
	@ResourceController varchar(100),
	@CaseDueDate varchar(max),
	@CleanClearFix varchar(100),
    @AcceptJob varchar(max),
	@ReasonJobRejected varchar(max),
	@WasteFound varchar(max),
	@AddressCorrect varchar(max),
	@CorrectLocation varchar(max),
	@WasteDescriptionCorrect varchar(max),
	@CorrectWasteDescription varchar(max),
	@WasteCategory varchar(max),
	@Volume varchar(max),
	@AccessibleForRemoval varchar(max),
	@HealthAndSafetyConcerns varchar(max),
	@Evidence varchar(max),
	@OfficialTip varchar(max),
	@ExplainWasteOther varchar(max),
	@OfficialNotices varchar(max),
	@OfficialNoticeDate varchar(max),
	@InvestigationComments varchar(max),
	@InvestigationDate varchar(max),
	@InvestigationOfficer varchar(max),
	@InvestigationOutcome varchar(max),
	@EnforcementOutcome varchar(100),
	@CaseFileNumber varchar(100),
	@EnforcementDate varchar(100),
	@EnforcementOfficer varchar(100),
	@CommentsEnforcement varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @FirstLineAddress varchar(100)
	SET @FirstLineAddress = SUBSTRING ( @LocationReported, 0, CHARINDEX(',', @LocationReported))
	IF exists (SELECT Reference FROM SafeCleanTidyUWaste WHERE @Reference = Reference)
	BEGIN
			
			IF isnull(@InvestigationOfficer,'') != ''
			BEGIN
			UPDATE SafeCleanTidyUWaste
			--LTRIM gets rid of the space in front, in case the column is blank
	
		SET 
			AcceptJob = LTRIM(ISNULL(AcceptJob ,'') + ' ' + ISNULL(@AcceptJob ,'')),
			ReasonJobRejected  = LTRIM(ISNULL(ReasonJobRejected ,'') + ' ' + ISNULL(@ReasonJobRejected ,'')),
			WasteFound = LTRIM(ISNULL(WasteFound,'') + ' ' + ISNULL(@WasteFound,'')),
			AddressCorrect = LTRIM(ISNULL(AddressCorrect,'') + ' ' + ISNULL(@AddressCorrect,'')),
			CorrectLocation = LTRIM(ISNULL(CorrectLocation,'') + ' ' + ISNULL(@CorrectLocation,'')),
			WasteDescriptionCorrect =  LTRIM(ISNULL(WasteDescriptionCorrect ,'') + ' ' + ISNULL(@WasteDescriptionCorrect ,'')) ,
			CorrectWasteDescription = LTRIM(ISNULL(CorrectWasteDescription,'') + ' ' + ISNULL(@CorrectWasteDescription,'')),
			WasteCategory = LTRIM(ISNULL(WasteCategory,'') + ' ' + ISNULL(@WasteCategory,'')),
			Volume = LTRIM(ISNULL(Volume, '') + ' ' + ISNULL(@Volume,'')),
			AccessibleForRemoval = LTRIM(ISNULL(AccessibleForRemoval, '') + ' ' + ISNULL(@AccessibleForRemoval,'')),
			HealthAndSafetyConcerns = LTRIM(ISNULL(HealthAndSafetyConcerns,'') + ' ' + ISNULL(@HealthAndSafetyConcerns,'')),
			Evidence = LTRIM(ISNULL(Evidence,'') + ' ' + ISNULL(@Evidence,'')),
			OfficialTip= LTRIM(ISNULL(OfficialTip, '') + ' ' + ISNULL(@OfficialTip, '')),
			ExplainWasteOther= LTRIM(ISNULL(ExplainWasteOther, '') + ' ' + ISNULL(@ExplainWasteOther, '')),
	        OfficialNotices  = LTRIM(ISNULL(OfficialNotices, '') + ' ' + ISNULL(@OfficialNotices , '')),
			OfficialNoticeDate = LTRIM(ISNULL(OfficialNoticeDate, '')+ ' ' + ISNULL(@OfficialNoticeDate,'')),
			InvestigationComments = LTRIM(ISNULL(InvestigationComments, '')+ ' ' + ISNULL(@InvestigationComments,'')),
			InvestigationDate = LTRIM(ISNULL(InvestigationDate, '')+ ' ' + ISNULL(@InvestigationDate,'')),
			InvestigationOfficer = LTRIM(ISNULL(InvestigationOfficer, '')+ ' ' + ISNULL(@InvestigationOfficer,'')),
			InvestigationOutcome = LTRIM(ISNULL(InvestigationOutcome, '')+ ' ' + ISNULL(@InvestigationOutcome,'')),
			FinalOutcome = ISNULL(@InvestigationOutcome,''),
			CleanClearFix = LTRIM(ISNULL(CleanClearFix, '')+ ' ' + ISNULL(@CleanClearFix,''))
		
			WHERE Reference = @Reference
			END
			
					
			IF isnull(@ResourceController,'') != ''
			BEGIN
				UPDATE SafeCleanTidyUWaste
			SET	
					
					ResourceControllerDate= LTRIM(ISNULL(ResourceControllerDate, '')+ ' ' + ISNULL (@ResourceControllerDate,'')),
					ResourceControllerComments = LTRIM(ISNULL(ResourceControllerComments, '')+ ' ' + ISNULL(@ResourceControllerComments,'')),
					ResourceControllerOutcome = LTRIM(ISNULL(ResourceControllerOutcome, '') + ' ' +  ISNULL(@ResourceControllerOutcome,'')),
					ResourceController = LTRIM(ISNULL(ResourceController, '') + ' ' +  ISNULL(@ResourceController,'')),
					FinalOutcome = ISNULL(@ResourceControllerOutcome,''),
					AssignTo = LTRIM(ISNULL(AssignTo, '')+ ' ' + ISNULL(@AssignTo,'')),
					CaseDueDate = LTRIM(ISNULL(CaseDueDate, '')+ ' ' + ISNULL(@CaseDueDate,'')),
					CleanClearFix = LTRIM(ISNULL(CleanClearFix, '')+ ' ' + ISNULL(@CleanClearFix,'')),
					LandOwnership = ISNULL(@LandOwnership, ''),
					WhichLand = ISNULL(@WhichLand, ''),
					OtherLand = ISNULL(@OtherLand, '')
				    WHERE Reference = @Reference
			END


					
					
			IF isnull(@EnforcementOfficer,'') != ''
			BEGIN
				UPDATE SafeCleanTidyUWaste
			SET	
				
					FinalOutcome = ISNULL(@EnforcementOutcome,''),
					CaseFileNumber  = LTRIM(ISNULL(CaseFileNumber , '') + ' ' +  ISNULL(@CaseFileNumber ,'')),
					EnforcementDate = LTRIM(ISNULL(EnforcementDate, '')+ ' ' + ISNULL(@EnforcementDate,'')),
					EnforcementOfficer = LTRIM(ISNULL(EnforcementOfficer, '')+ ' ' + ISNULL(@EnforcementOfficer,'')),
					CommentsEnforcement = LTRIM(ISNULL(CommentsEnforcement, '')+ ' ' + ISNULL(@CommentsEnforcement,''))

				
				WHERE Reference = @Reference
			END
	END	
	ELSE
	BEGIN


	INSERT INTO 
	[dbo].[SafeCleanTidyUWaste](
	 	DateReported ,
	Reference ,
	Contact ,
	Email ,
	Telephone ,
	LocationReported ,
	ProvideMoreInfo,
	Postcode ,
	Road,
	FirstLineAddress,
	WasteStillThere ,
	WhereIsWaste ,
	WasteDescription ,
	WasItWitnessed ,
	WitnessedDate ,
	WitnessComment ,
	GoToCourt,
	LandOwnership ,
	Whichland,
	OtherLand,
	ResourceControllerOutcome ,
	AssignTo,
	ResourceControllerComments ,
	ResourceControllerDate ,
	ResourceController ,
	CaseDueDate,
	CleanClearFix,
	FinalOutcome)

	VALUES(
	@DateReported ,
	@Reference ,
	@Contact ,
	@Email ,
	@Telephone ,
	@LocationReported ,
	@ProvideMoreInfo,
	@Postcode ,
	@Road,
	@FirstLineAddress,
	@WasteStillThere ,
	@WhereIsWaste ,
	@WasteDescription ,
	@WasItWitnessed ,
	CASE 
	WHEN @WasItWitnessed = 'no' or @WasItWitnessed = '' or @WasItWitnessed is NULL
	THEN ''
	ELSE
	@WitnessedDate
	END,
	@WitnessComment ,
	@GoToCourt,
	@LandOwnership ,
	@WhichLand,
	@OtherLand,
	@ResourceControllerOutcome ,
	@AssignTo,
	@ResourceControllerComments ,
	@ResourceControllerDate,
	@ResourceController,
	@CaseDueDate,
	@CleanClearFix,
	@ResourceControllerOutcome
	)
	END


END
GO

