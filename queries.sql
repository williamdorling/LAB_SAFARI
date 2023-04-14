-- Write queries to find:

-- (1) - The names of the animals in a given enclosure
SELECT animals.name FROM animals
INNER JOIN enclosures
ON animals.enclosure_id = enclosures.id
WHERE enclosures.name = 'Bird Cage';


-- (2) - The names of the staff working in a given enclosure
SELECT employees.name FROM employees
INNER JOIN assignments 
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.name = 'Reptile House';

-- (3) - The names of staff working in enclosures which are closed for maintenance
SELECT employees.name FROM employees
INNER JOIN assignments 
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.closed_for_maintenance = TRUE;

-- (4) - The name of the enclosure where the oldest animal lives. 
-- If there are two animals who are the same age choose the first one alphabetically.
SElECT enclosureS.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
ORDER BY animals.age desc, animals.name LIMIT 1;

-- (5) - The number of different animal types a given keeper has been assigned to work with.
SELECT COUNT(animals.type) FROM employees
INNER JOIN assignments
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE employees.name = 'Colin';


-- (6) - The number of different keepers who have been assigned to work in a given enclosure
SELECT COUNT(*) FROM enclosures
INNER JOIN assignments
ON enclosures.id = assignments.enclosure_id
INNER JOIN employees
ON assignments.employee_id = employees.id
WHERE enclosures.name = 'Bird Cage'; 


-- (7) - The names of the other animals sharing an enclosure with a given animal 
-- (eg. find the names of all the animals sharing the big cat field with Tony)
SELECT enclosures.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE animals.name = 'Terry';


SELECT animals.name FROM ANIMALS
INNER JOIN enclosures
on animals.enclosure_id = enclosures.id
WHERE enclosures.name = 'Big Cat Field' AND animals.name != 'Terry';