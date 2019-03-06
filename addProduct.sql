USE [ShopCafe]
GO
/****** Object:  StoredProcedure [dbo].[addProduct]    Script Date: 6/3/2562 14:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspAddProduct] 
	-- Add the parameters for the stored procedure here
	@ProductName nvarchar(100),
	@ProductPrice int,
	@ProductDetail nvarchar(100),
	@TypeProduct int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Product (ProductName,ProductPrice,ProductDatail,TypeID) VALUES (@ProductName,@ProductPrice,@ProductDetail,@TypeProduct);
END
