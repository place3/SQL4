INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + gs.n AS id,
       ordered_persons.person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25'::date AS order_date
FROM generate_series(1, (SELECT COUNT(*) FROM person)) AS gs(n)
JOIN (
    SELECT p.id AS person_id,
           (SELECT COUNT(*) FROM person p2 WHERE p2.id <= p.id) AS rn
    FROM person p
) AS ordered_persons ON ordered_persons.rn = gs.n;