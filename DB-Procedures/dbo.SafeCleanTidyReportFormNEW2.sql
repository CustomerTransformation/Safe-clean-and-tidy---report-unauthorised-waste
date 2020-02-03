USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyReportFormNEW2]    Script Date: 03/02/2020 14:06:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Daniela Dutu
-- Create date: 11/02/2019
-- Description:	Creates a report in the form Safe Clean Tidy - Unauthorised waste report
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyReportFormNEW2]
	-- Add the parameters for the stored procedure here
@InputPostcode varchar(200),
@InputRoad varchar(60),
@InputName varchar(60),
@InputAddress varchar(max),
@PostcodeValidation varchar(10),
@RoadValidation varchar(10),
@CustomerValidation varchar(10),
@AddressValidation varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

  
	IF @PostcodeValidation = 'True'
	BEGIN
	SELECT Reference as name, Reference + ' '+  RequestDate + ' '+  Customer + ' '+  WasteReported  AS display FROM SafeCleanTidyPatrolReport2
	WHERE Postcode LIKE '%' + @InputPostcode + '%' AND DateCompleted > DATEADD( MONTH, -6, GETDATE())--AND (Outcome IS NOT NULL OR Outcome != '')
	END
	
	
	--ORDER BY JobDateTime1 DESC
	
	IF @RoadValidation = 'True'
	SELECT Reference as name, Reference + ' Date Reported: '+  RequestDate + ' Customer:  '+  Customer + ' Waste description: '+  WasteReported AS display FROM SafeCleanTidyPatrolReport2
	WHERE Road LIKE @InputRoad + '%' AND DateCompleted > DATEADD( MONTH, -6, GETDATE())--AND (Outcome IS NOT NULL OR Outcome != '')
	
	
	IF @CustomerValidation = 'True'
	BEGIN
	SELECT Reference as name, Reference + ' '+ RequestDate +  ' '+  WasteReported  AS display FROM SafeCleanTidyPatrolReport2
	WHERE Customer LIKE '%' + @InputName + '%' AND DateCompleted > DATEADD( MONTH, -6, GETDATE())--AND (Outcome IS NOT NULL OR Outcome != '')
	END

	IF @AddressValidation = 'True'
	BEGIN
	SELECT Reference as name, Reference + ' '+ RequestDate +  ' '+  WasteReported  AS display FROM SafeCleanTidyPatrolReport2
	WHERE Customer LIKE '%' + @InputName + '%' AND DateCompleted > DATEADD( MONTH, -6, GETDATE())--AND (Outcome IS NOT NULL OR Outcome != '')
	END
	
END
GO

