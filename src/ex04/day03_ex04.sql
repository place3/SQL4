(
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM pizzeria pz
    WHERE EXISTS (
        SELECT 1
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN person p ON p.id = po.person_id
        WHERE m.pizzeria_id = pz.id AND p.gender = 'female'
    )
    AND NOT EXISTS (
        SELECT 1
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN person p ON p.id = po.person_id
        WHERE m.pizzeria_id = pz.id AND p.gender = 'male'
    )
)
UNION
(
    SELECT DISTINCT pz.name AS pizzeria_name
    FROM pizzeria pz
    WHERE EXISTS (
        SELECT 1
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN person p ON p.id = po.person_id
        WHERE m.pizzeria_id = pz.id AND p.gender = 'male'
    )
    AND NOT EXISTS (
        SELECT 1
        FROM person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN person p ON p.id = po.person_id
        WHERE m.pizzeria_id = pz.id AND p.gender = 'female'
    )
)
ORDER BY pizzeria_name ASC;