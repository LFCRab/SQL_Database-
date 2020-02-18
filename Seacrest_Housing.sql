select b.branch_id, p.house_id, p.postcode, o.seller_id, o.owner_name
from branch b, property p, property_Seller o
where o.seller_id = p.seller_id
and b.branch_id = p.branch_id
and b.branch_id = &branch;