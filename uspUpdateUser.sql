-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE uspUpdateUser
	-- Add the parameters for the stored procedure here
	@UserID int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(50),
	@Tel nvarchar(50),
	@Gender nchar(5),
	@Username nvarchar(50),
	@BrithDay datetime,
	@NumAddress nvarchar(50),
	@Tumbun nvarchar(50),
	@Amphoe nvarchar(50),
	@City nvarchar(50),
	@Country nvarchar(50),
	@Postnumber nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Customer
	SET Customer.FirstName = @FirstName,
		Customer.LastName = @LastName,
		Customer.Email = @Email,
		Customer.Tel = @Tel,
		Customer.Gender = @Gender,
		Customer.UserName = @Username,
		Customer.BrithDay = @BrithDay
	WHERE Customer.UserID = @UserID;

	UPDATE CustomsAddress
	SET CustomsAddress.NumAddress = @NumAddress,
		CustomsAddress.Tambon = @Tumbun,
		CustomsAddress.Amphoe = @Amphoe,
		CustomsAddress.City = @City,
		CustomsAddress.Country = @Country,
		CustomsAddress.PostNumber = @Postnumber
	WHERE CustomsAddress.UserID = @UserID;
	


END
GO
