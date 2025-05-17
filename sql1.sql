# which movies has not yet retuned ?

Select customer_id,rental_id, r.last_update,f.title
from sakila.rental r
join sakila.inventory i on i.inventory_id = r.inventory_id
join sakila.film f on f.film_id = i.film_id
where r.return_date is null;