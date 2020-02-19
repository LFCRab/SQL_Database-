1. 

select * from branch;

2.

Select e.Employee_ID, e.Employee_Name, b.Branch_ID, b.Address_Line_1
from Employee e, Branch b
where b.Branch_ID = e.Branch_ID
and e.employee_ID = &employee_ID;

3.

Select p.house_ID, p.Asking_Price, o.Offer_Amount
from property p, offer o
where p.house_id = o.house_id
and p.asking_Price > o.offer_amount
and p.sale_status = 'Contract';

4.
select p.house_id,p.postcode,  p.asking_price, b.budget, b.full_name
from property p, buyer b, employee e, branch f
where f.branch_id = p.branch_id
and f.branch_id = e. branch_id
and e.employee_id = b.employee_id
and p.asking_Price < b.budget
and full_name = 'Ezekiel Parsons';

5.

select s.house_ID, s.survey_Date, b.buyer_ID, b.full_Name
from survey s, buyer b
where b.buyer_id = s.buyer_id;

6.

select s.survey_date,b.buyer_id,b.full_name, e.employee_id, e.employee_name
from survey s, employee e, buyer b
where b.buyer_id = s.buyer_id
and e.employee_id = b.employee_id;

7.

select p.house_id, p.postcode, a.advert_company, a.advert_price
from property p, property_advert a
where p.house_id = a.house_id
and p.house_id = 'J9V6S';

8.

select b.branch_id, p.house_id, p.postcode, o.seller_id, o.owner_name
from branch b, property p, property_Seller o
where o.seller_id = p.seller_id
and b.branch_id = p.branch_id
and b.branch_id = &branch;

9.

select p.house_id, s.survey_date, b.buyer_id, b.full_name, e.employee_id, e.employee_name
from property p, survey a, buyer b, employee e
where e.employee_id = b.employee_id
and b.buyer_ID = a.buyer_id 
and a.house_id = p.house_id
order by e.employee_id desc;

10.

select SUM(o.offer_amount) as Total_Contract_Sales_Amount
from property p, offer o
where o.house_id = p.house_id
and p.sale_status = 'Contract';


11.

select SUM(contract_price) as Total_Contract_Sales_Amount
from sold_property
where Date_Of_Sale < '12-MAR-16';

12.

select MAX(p.asking_price)as Most_Expensive_House_For_Employee
from property p, property_seller b, employee e
where p.seller_id = b.seller_id
and b.employee_id = e.employee_id
and e.employee_id = '99907';

13.

SELECT p.house_ID, COUNT(p.advert_company)AS Number_Of_Ads, SUM(p.advert_price) as Total_Cost
FROM property_advert p
WHERE house_ID = house_ID
GROUP BY house_ID;

14.

select Address_Line_1, postcode, no_of_rooms, house_id from property;

15.

SELECT s.house_ID, p.Address_line_1 COUNT(s.survey_cost)AS Number_Of_Surveys
FROM survey s, property p
WHERE s.house_ID = p.house_ID
GROUP BY s.house_ID, p.address_line_1;

16.

select e.employee_ID,e.employee_name, count(s.survey_date) as Number_Of_Surveys
from survey s, employee e, buyer b
where s.buyer_id = b.buyer_id
and b.employee_id = e.employee_id
group by e.employee_id, e.employee_name;

17.

select b.buyer_id, b.full_name, p.house_id, p.postcode, b.rooms_wanted
from property p, buyer b, employee e, branch f
where f.branch_id = p.branch_id
and f.branch_id = e.branch_id
and e.employee_id = b.employee_id
and p.no_of_rooms = b.rooms_wanted
order by rooms_wanted desc;