USE [FStepRubbishRecycling_prod]
GO

/****** Object:  StoredProcedure [dbo].[SafeCleanTidyDisplayEmails]    Script Date: 03/02/2020 14:04:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 17/05/2018
-- Description:	displays emails cached once a few letters are typed (Safe Clean Tidy forms)
-- =============================================
CREATE PROCEDURE [dbo].[SafeCleanTidyDisplayEmails]
	-- Add the parameters for the stored procedure here
@InputEmail varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EmailAddress  AS inputEmail FROM SafeCleanTidyEmails
	WHERE EmailAddress LIKE  @InputEmail + '%'
END
GO

