USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyCachedEmailsOLD]    Script Date: 03/02/2020 14:04:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 16/05/2018
-- Description:	Inserts new emails in the table SafeCleanTidyEmails
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyCachedEmailsOLD]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --DECLARE @EmailFound varchar (50)
	--SELECT @EmailFound = EmailAddress FROM SafeCleanTidyEmails 
	

	SELECT ID AS name, EmailAddress AS display FROM SafeCleanTidyEmails

	
	
END
GO

