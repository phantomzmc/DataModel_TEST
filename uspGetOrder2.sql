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
CREATE PROCEDURE  uspGetOrder
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	
		c.ProductName,c.ProductPrice,
		d.FirstName,d.LastName,
		a.OrderQty,
		sum(c.ProductPrice * a.OrderQty) AS OrderPrice,
		a.OrderTime
		
		FROM Orders AS a
		inner join Product AS c on c.ProductID = a.ProductID
		inner join Customer d on d.UserID = a.UserID
		GROUP BY c.ProductName,c.ProductPrice,d.FirstName,d.LastName,a.OrderQty,a.OrderPrice,a.OrderTime
		END
GO
