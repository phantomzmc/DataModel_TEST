select * from Product

select ProductName,ProductPrice,TypeName,TypeDetail 
	from Product inner join ProductType 
	on Product.TypeID = ProductType.TypeID
		where ProductType.TypeID = 1

update Product
set TypeID = 3
where ProductID =7
