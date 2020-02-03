USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyPatrolsGetData]    Script Date: 03/02/2020 14:05:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 25/01/2018
-- Description:	writes values to the table SafeCleanTidyPatrols from the form 'Safe Clean Tidy - Patrols'
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyPatrolsGetData] 
	@Reference varchar (20),
	@FullName varchar(100),
	@CustomerAddress varchar(100),
	@Email varchar(100),
	@Telephone varchar(30),
	@WorkType varchar(50),
	@LocationProblem varchar(100),
	@NumberDemands int,
    @TimeWorkNeeded varchar(20),
    @ExactTime time,
	@dateResourceController varchar(30),
	@OutcomeRC varchar(30),
	@CaseDueDate varchar(max),
	@TeamAssigned varchar(30) ,
	@OfficerAssigned varchar(50) ,
	@Comments varchar(max) ,
	@ResourceController varchar(50) ,
	@DateInvestigation varchar(30) ,
	@AcceptJob varchar(3) ,
	@ReasonJobRejected varchar(max) ,
	@DateTimeAttended varchar(15) ,
	@OfficersInvolved varchar(max) ,
	@NumberIncidentsWitnessed varchar(3) ,
	@NumberPeopleStopped varchar(3) ,
	@DetailsPeople varchar(max) ,
	@FPN varchar(3) ,
	@FPNDetails varchar(max),
	@WhatHappened varchar(max) ,
	@OutcomeInvestigation varchar(30) ,
	@DateTimeCallClosed varchar(15) ,
	@InvestigationOfficer varchar(50),
	@CleanClearFixEmail varchar(100),
	@Postcode varchar(10),
	@Road varchar(100),
	@FormName varchar(100),
	@LandOwner varchar(50),
    @WhichLand varchar(10),
    @OtherLand varchar(10),
	@ReasonJobClosed varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @DateReported date
	SET @DateReported = GETDATE()
DECLARE @FirstLineAddress varchar(100)
	SET @FirstLineAddress = SUBSTRING ( @LocationProblem, 0, CHARINDEX(',', @LocationProblem))
	IF exists (SELECT Reference FROM SafeCleanTidyPatrols WHERE @Reference = Reference)
	BEGIN
			
			IF isnull(@InvestigationOfficer,'') != ''
			BEGIN
			UPDATE SafeCleanTidyPatrols
			--LTRIM gets rid of the space in front, in case the column is blank
	
		SET 
			DateTimeAttended = LTRIM(ISNULL(DateTimeAttended,'') + ' ' + ISNULL(@DateTimeAttended,'')),
			DateTimeCallClosed = LTRIM(ISNULL(DateTimeCallClosed,'') + ' ' + ISNULL(@DateTimeCallClosed,'')),
			DetailsPeople = LTRIM(ISNULL(DetailsPeople,'') + ' ' + ISNULL(@DetailsPeople,'')),
			OfficersInvolved = LTRIM(ISNULL(OfficersInvolved,'') + ' ' + ISNULL(@OfficersInvolved,'')),
			NumberIncidentsWitnessed = LTRIM(ISNULL(NumberIncidentsWitnessed,'') + ' ' + ISNULL(@NumberIncidentsWitnessed,'')),
			NumberPeopleStopped =  LTRIM(ISNULL(NumberPeopleStopped ,'') + ' ' + ISNULL(@NumberPeopleStopped ,'')) ,
			FPN = LTRIM(ISNULL(FPN,'') + ' ' + ISNULL(@FPN,'')),
			FPNDetails = LTRIM(ISNULL(FPNDetails,'') + ' ' + ISNULL(@FPNDetails,'')),
			WhatHappened = LTRIM(ISNULL(WhatHappened, '') + ' ' + ISNULL(@WhatHappened,'')),
			OutcomeInvestigation = LTRIM(ISNULL(OutcomeInvestigation, '') + ' ' + ISNULL(@OutcomeInvestigation,'')),
			DateInvestigation = LTRIM(ISNULL(DateInvestigation,'') + ' ' + ISNULL(@DateInvestigation,'')),
			InvestigationOfficer = LTRIM(ISNULL(InvestigationOfficer,'') + ' ' + ISNULL(@InvestigationOfficer,'')),
			AcceptJob= LTRIM(ISNULL(AcceptJob, '') + ' ' + ISNULL(@AcceptJob, '')),
	        ReasonJobRejected = LTRIM(ISNULL(ReasonJobRejected, '') + ' ' + ISNULL(@ReasonJobRejected, '')),
			CleanClearFixEmail = LTRIM(ISNULL(CleanClearFixEmail, '')+ ' ' + ISNULL(@CleanClearFixEmail,'')),
			ReasonJobClosed = LTRIM(ISNULL(ReasonJobClosed, '')+ ' ' + ISNULL(@ReasonJobClosed,''))
			WHERE Reference = @Reference
			END
			
					
			IF isnull(@ResourceController,'') != ''
			BEGIN
				UPDATE SafeCleanTidyPatrols
			SET	
					Comments = LTRIM(ISNULL(Comments, '') + ' ' + ISNULL(@Comments,'')),
					DateResourceController= LTRIM(ISNULL(DateResourceController, '')+ ' ' + ISNULL (@dateResourceController,'')),
					OutcomeRC = LTRIM(ISNULL(OutcomeRC, '') + ' ' +  ISNULL(@OutcomeRC,'')),
					ResourceController = LTRIM(ISNULL(ResourceController, '')+ ' ' + ISNULL(@ResourceController,'')),
					TeamAssigned = LTRIM(ISNULL(TeamAssigned, '')+ ' ' + ISNULL(@TeamAssigned,'')),
					OfficerAssigned  = LTRIM(ISNULL(OfficerAssigned ,'') + ' ' +  ISNULL(@OfficerAssigned , '')),
					CaseDueDate = LTRIM(ISNULL(CaseDueDate, '')+ ' ' + ISNULL(@CaseDueDate,'')),
					CleanClearFixEmail = LTRIM(ISNULL(CleanClearFixEmail, '')+ ' ' + ISNULL(@CleanClearFixEmail,'')),
					LandOwner = LTRIM(ISNULL(LandOwner, '') + ISNULL(@LandOwner, '')),
					WhichLand = LTRIM(ISNULL(WhichLand, '') + ISNULL(@WhichLand, '')),
					OtherLand = LTRIM(ISNULL(OtherLand, '') + ISNULL(@OtherLand, ''))
				WHERE Reference = @Reference
			END
	END	
	ELSE
	BEGIN


	INSERT INTO 
	[dbo].[SafeCleanTidyPatrols](
	  [DateReported]
      ,[Reference]
      ,[FullName]
      ,[CustomerAddress]
      ,[Email]
      ,[Telephone]
      ,[WorkType]
      ,[LocationProblem]
      ,[NumberDemands]
      ,[TimeWorkNeeded]
      ,[ExactTime]
      ,[DateResourceController]
      ,[OutcomeRC]
      ,[CaseDueDate]
      ,[TeamAssigned]
      ,[OfficerAssigned]
      ,[Comments]
      ,[ResourceController]
      ,[DateInvestigation]
      ,[OutcomeInvestigation]
      ,[AcceptJob]
      ,[ReasonJobRejected]
      ,[DateTimeAttended]
      ,[OfficersInvolved]
      ,[NumberIncidentsWitnessed]
      ,[NumberPeopleStopped]
      ,[DetailsPeople]
      ,[FPN]
      ,[FPNDetails]
      ,[WhatHappened]
      ,[DateTimeCallClosed]
      ,[InvestigationOfficer]
      ,[CleanClearFixEmail]
      ,[Postcode]
      ,[Road]
      ,[FirstLineAddress]
      ,[FormName]
	  ,[LandOwner]
      ,[WhichLand]
      ,[OtherLand]
	  ,[ReasonJobClosed])

	VALUES(
	@DateReported ,
	@Reference ,
	@FullName ,
	@CustomerAddress,
	@Email ,
	@Telephone ,
	@WorkType,
	@LocationProblem ,
	@NumberDemands ,
	@TimeWorkNeeded,
	@ExactTime,
	CASE 
	WHEN @ResourceController is NULL or @ResourceController = ''
	THEN ''
	ELSE
	@dateResourceController
	END,
	@OutcomeRC,
	@CaseDueDate,
	@TeamAssigned  ,
	@OfficerAssigned  ,
	@Comments  ,
	@ResourceController  ,
	CASE 
	WHEN @InvestigationOfficer is NULL or @InvestigationOfficer = ''
	THEN ''
	ELSE
	@DateInvestigation
	END,
	@OutcomeInvestigation  ,
	@AcceptJob  ,
	@ReasonJobRejected  ,
	@DateTimeAttended  ,
	@OfficersInvolved  ,
	@NumberIncidentsWitnessed  ,
	@NumberPeopleStopped  ,
	@DetailsPeople  ,
	@FPN,
	@FPNDetails,
	@WhatHappened  ,

	@DateTimeCallClosed  ,
	@InvestigationOfficer,
	@CleanClearFixEmail,
	@Postcode,
	@Road,
	@FirstLineAddress,
    @FormName,
	@LandOwner,
    @WhichLand,
    @OtherLand,
	@ReasonJobClosed)
	END


END
GO

