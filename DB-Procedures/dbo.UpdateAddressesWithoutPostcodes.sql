USE [FStepFormsTasks_prod]
GO

/****** Object:  StoredProcedure [dbo].[UpdateAddressesWithoutPostcode]    Script Date: 03/02/2020 13:58:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 20/11/2019
-- Description:	Deletes old records and puts new ones in the table
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddressesWithoutPostcode]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	TRUNCATE TABLE AddressesWithoutPostcodes

	INSERT INTO AddressesWithoutPostcodes
	SELECT *
	FROM [SVP-SQL08].[BS7666_PC].[dbo].[LLPG_Postal_Address]
	WHERE LOGICAL_STATUS = 1 AND (postcode is NULL or postcode = '')
END
GO

