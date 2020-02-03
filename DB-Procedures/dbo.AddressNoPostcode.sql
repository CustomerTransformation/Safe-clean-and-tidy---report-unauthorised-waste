USE [FStepFormsTasks_prod]
GO

/****** Object:  StoredProcedure [dbo].[AddressNoPostcode]    Script Date: 03/02/2020 13:58:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 13/11/2019
-- Description:	Displays addresses without postcodes
-- =============================================
CREATE PROCEDURE [dbo].[AddressNoPostcode]
	-- Add the parameters for the stored procedure here

@SearchAddress varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here



 --and  LOGICAL_STATUS = 1 and (postcode is null or postcode = '')


IF (SELECT  COUNT(Postal_Address) -- if there are more than 20 records, only 20 records will be displayed together with a warning to narrow down the search
FROM 
AddressesWithoutPostcodes
WHERE 
 Postal_Address LIKE '%' + @SearchAddress +'%' ) > 25
	BEGIN
		SELECT top(20) dbo.ProperCase2(Postal_Address) as  display, UPRN as name
		FROM 
		AddressesWithoutPostcodes
		WHERE 
		Postal_Address LIKE '%' + @SearchAddress +'%' 
		
	END

 ELSE --if there are less than 20 records, all will be displayed
	BEGIN
 
		 SELECT  dbo.ProperCase2(Postal_Address) as  display, UPRN as name
		 FROM 
		 AddressesWithoutPostcodes
		 WHERE 
		 Postal_Address LIKE '%' + @SearchAddress +'%' 
    END

END
GO

