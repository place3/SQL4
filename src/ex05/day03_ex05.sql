SELECT DISTINCT pz.name AS pizzeria_name
FROM pizzeria pz
JOIN person_visits pv ON pv.pizzeria_id = pz.id
JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Andrey'
  AND pz.id NOT IN (
      SELECT m.pizzeria_id
      FROM person_order po
      JOIN menu m ON m.id = po.menu_id
      JOIN person p2 ON p2.id = po.person_id
      WHERE p2.name = 'Andrey'
  )
ORDER BY pizzeria_name ASC;