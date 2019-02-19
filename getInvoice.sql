/***select	b.FirstName,
		c.ProductName,c.ProductPrice,
		d.PromotionName,d.PromotionDiscount,d.PromotionType,
		a.InvoiceDiscount,
		sum(c.ProductPrice - d.PromotionDiscount) AS InvoicePrice
from Invoice AS a
inner join Customer AS b on a.UserID = b.UserID
inner join Product AS c on c.ProductID = a.ProductID
inner join Promotion AS d on d.PromotionID = a.ProductID
group by b.FirstName
**/

select	a.InvoiceID,
		c.ProductName,a.Qty,c.ProductPrice,
		d.PromotionName,d.PromotionDiscount,
		sum(c.ProductPrice *a.Qty) AS Total,
		sum(((c.ProductPrice *a.Qty)- d.PromotionDiscount) - (c.ProductPrice *a.Qty)) AS InvoiceDiscountAll,
		
		InVoicePrice = case d.PromotionType
						when '2'then sum((c.ProductPrice *a.Qty) - d.PromotionDiscount)
						when '1' then sum(((c.ProductPrice *a.Qty) *100)/(100+d.PromotionDiscount))
						end
		
from Invoice AS a
inner join Product AS c on c.ProductID = a.ProductID
inner join Promotion AS d on d.PromotionID = a.PromotionID
inner join Orders AS o on o.OrderID = a.OrderID

group by a.InvoiceID,c.ProductName,a.Qty,c.ProductPrice,d.PromotionName,d.PromotionDiscount,d.PromotionType 


select	
		c.ProductName,c.ProductPrice,
		d.FirstName,d.LastName,
		a.OrderQty,
		sum(c.ProductPrice * a.OrderQty) AS OrderPrice,
		a.OrderTime
		
		
	/**m((c.ProductPrice - d.PromotionDiscount) - c.ProductPrice) AS InvoiceDiscountAll,
		sum(c.ProductPrice - d.PromotionDiscount) AS InvoicePrice
	**/
		
from Orders AS a
inner join Product AS c on c.ProductID = a.ProductID
inner join Customer d on d.UserID = a.UserID
group by c.ProductName,c.ProductPrice,d.FirstName,d.LastName,a.OrderQty,a.OrderPrice,a.OrderTime
