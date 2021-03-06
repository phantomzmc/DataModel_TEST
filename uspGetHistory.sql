USE [ShopCafe]
GO
/****** Object:  StoredProcedure [dbo].[uspGetHistory]    Script Date: 6/3/2562 14:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspGetHistory]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT b.FirstName,b.LastName,b.Email,b.Tel,c.InvoiceID,d.PromotionName,c.OrderID
	 FROM History as a
		INNER JOIN Customer AS b ON b.UserID = a.UserID
		INNER JOIN Invoice AS c on c.InvoiceID = a.InvoiceID
		INNER JOIN Promotion as d ON d. PromotionID = a.PromotionID
	GROUP BY b.FirstName,b.LastName,b.Email,b.Tel,c.InvoiceID,d.PromotionName,c.OrderID;

END
