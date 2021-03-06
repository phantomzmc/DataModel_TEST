USE [ShopCafe]
GO
/****** Object:  StoredProcedure [dbo].[uspAddUser]    Script Date: 7/3/2562 15:41:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspAddUser]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Tel nvarchar(50),
	@Username nvarchar(50),
	@Email nvarchar(50),
	@BrithDay date,
	@Gender nchar(5),
	@NumAddress nvarchar(50),
	@Tumbun nvarchar(50),
	@Amphoe nvarchar(50),
	@City nvarchar(50),
	@Country nvarchar(50),
	@Postnumber nvarchar(50),
	@UserID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Customer (FirstName,LastName,Tel,UserName,Email,BrithDay,Gender)
	OUTPUT inserted.UserID,'1' as status
	VALUES (@FirstName,@LastName,@Tel,@Username,@Email,@BrithDay,@Gender)
	RETURN
	
--INSERT INTO CustomsAddress (NumAddress,Tambon,Amphoe,City,Country,PostNumber)
--VALUES (@NumAddress,@Tumbun,@Amphoe,@Country,@City,@Postnumber);

	
	
END
