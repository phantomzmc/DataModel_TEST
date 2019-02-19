--select * from Orders


--select * from Invoice

select 
		--a.InvoiceID,
		f.ProductName,o.OrderQty,f.ProductPrice,
		d.PromotionName,d.PromotionDiscount,o.OrderTime,
		sum(f.ProductPrice *o.OrderQty) AS Total,
		sum(((f.ProductPrice *o.OrderQty)- d.PromotionDiscount) - (f.ProductPrice *o.OrderQty)) AS InvoiceDiscountAll,
		
		case d.PromotionType
			when '2'then sum((f.ProductPrice *o.OrderQty) - d.PromotionDiscount)
			when '1' then sum(((f.ProductPrice *o.OrderQty) *100)/(100+d.PromotionDiscount))
		end 
		AS InvoicePrice
			
from Invoice AS a
inner join Promotion AS d on d.PromotionID = a.PromotionID
inner join Orders AS o on o.OrderID = a.OrderID
inner join Product as f on f.ProductID = o.ProductID

where o.UserID = a.UserID
group by a.InvoiceID,f.ProductName,o.OrderQty,f.ProductPrice,d.PromotionName,d.PromotionDiscount,d.PromotionType,o.OrderTime


