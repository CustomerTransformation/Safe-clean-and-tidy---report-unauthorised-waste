USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyCountsCases]    Script Date: 03/02/2020 14:04:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 14/08/2018
-- Description:	Counts cases reported 
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyCountsCases]
@InputPostcode varchar(200),
@InputRoad varchar(60),
@InputName varchar(60),
@PostcodeValidation varchar(10),
@RoadValidation varchar(10),
@CustomerValidation varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(Reference) as numberCases FROM SafeCleanTidyPatrolReport2
	WHERE (Customer LIKE '%' + @InputName + '%'  OR Postcode LIKE '%' + @InputPostcode + '%' OR Road LIKE '%' + @InputRoad + '%' )AND DateLogged > DATEADD( MONTH, -6, GETDATE())
	
END
GO

