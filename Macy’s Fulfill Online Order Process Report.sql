select o.DELIVERY_PICKUP, to_char(SUM(p.PRODUCT_PRICE),'FM$99,999.00')Revenue
from orders o
JOIN shopping_cart sc                         /*Finding the revenue obtained from both Pickup and delivery, if revenue is less in pickup, we promote it more*/
on o.order_id=sc.ORDER_ID
join product p
on p.product_id=sc.PRODUCT_ID
group by o.DELIVERY_PICKUP;

select o.cust_id,sc.PRODUCT_ID,o.order_id,lc.LOCATION_ID "Nearest Store",iv.QUANTITY "Quantity at nearest store",sc.QUANTITY "Quantity ordered" 
from orders o
join shopping_cart sc                                 --How many customers choose delivery because of the unavailability of products for store pickup?
on o.order_id=sc.ORDER_ID                             --To find those orders, where delivery address was in the same city as store, yet Delivery option was chosen. 
join LOCATION_DETAILS lc                              --Then the quantity of products ordered are compared with the quantity available at store. An inference 
on upper(o.DELIVERY_CITY)=upper(lc.CITY)              --can be made that maybe delivery was chosen due to lack of inventory. This can help in inventory building as well
JOIN inventory iv
on lc.LOCATION_ID=iv.LOCATION_ID
and sc.PRODUCT_ID=iv.PRODUCT_ID
where iv.QUANTITY<sc.quantity
and o.DELIVERY_PICKUP='Delivery';

