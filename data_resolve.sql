USE TEST

SELECT *
FROM Cinema

SELECT *
FROM Theatre

-- Update the status of a cinema (e.g., close a cinema)
UPDATE Cinema
SET C_Status = 'Closed'
WHERE ID = 2;

-- Update the location of a cinema
UPDATE Cinema
SET C_location = 'New Downtown'
WHERE ID = 1;

-- Verify updates
SELECT *
FROM Cinema;

-- Delete a cinema and cascade the deletion to associated theatres
DELETE FROM Cinema
WHERE ID = 3;

SELECT *
FROM Cinema;

-- Verify cascading effect
SELECT *
FROM Theatre;
-- Theatre with C_ID = 3 should no longer exist.

