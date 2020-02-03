USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyInsertsEmails]    Script Date: 03/02/2020 14:05:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 16/05/2018
-- Description:	Inserts new emails in the table SafeCleanTidyEmails
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyInsertsEmails]
	-- Add the parameters for the stored procedure here
	@InputEmail varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


	
	IF @InputEmail NOT IN (SELECT EmailAddress FROM SafeCleanTidyEmails)
	INSERT INTO SafeCleanTidyEmails (EmailAddress)
	VALUES (@InputEmail)
	

	
	
	
	
END
GO

