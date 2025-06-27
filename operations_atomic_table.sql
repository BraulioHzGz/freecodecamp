-- QUERYS PARA REALIZAR EL RETO

-- Modificado de nombre de tablas
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- Añadir CONSTRAINTS
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

-- Crear table 'types'
CREATE TABLE types(type_id INTEGER PRIMARY KEY);
ALTER TABLE types ADD COLUMN type VARCHAR(30) NOT NULL;
INSERT INTO types(type_id, type) VALUES(1, 'nonmetal'), (2, 'metal'), (3, 'metalloid');

-- Corregir tabla properties
ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);
UPDATE properties SET type_id = 1 WHERE atomic_number = 1;
UPDATE properties SET type_id = 1 WHERE atomic_number = 2;
UPDATE properties SET type_id = 1 WHERE atomic_number = 6;
UPDATE properties SET type_id = 1 WHERE atomic_number = 7;
UPDATE properties SET type_id = 1 WHERE atomic_number = 8;
UPDATE properties SET type_id = 2 WHERE atomic_number = 3;
UPDATE properties SET type_id = 2 WHERE atomic_number = 4;
UPDATE properties SET type_id = 3 WHERE atomic_number = 5;
UPDATE properties SET type_id = 3 WHERE atomic_number = 1000;
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties DROP COLUMN type;

-- Corregir nombre de elementos para que empiecen con mayúsculas
UPDATE elements SET symbol = 'He' WHERE atomic_number = 2;
UPDATE elements SET symbol = 'Li' WHERE atomic_number = 3;
UPDATE elements SET symbol = 'Mt' WHERE atomic_number = 1000;

-- Poner atomic_mass como DECMAL y eliminar ceros al final de la columna atomic_mass
ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;
UPDATE properties SET atomic_mass = 1.008 WHERE atomic_number = 1;
UPDATE properties SET atomic_mass = 4.0026 WHERE atomic_number = 2;
UPDATE properties SET atomic_mass = 6.94 WHERE atomic_number = 3;
UPDATE properties SET atomic_mass = 9.0122 WHERE atomic_number = 4;
UPDATE properties SET atomic_mass = 10.81 WHERE atomic_number = 5;
UPDATE properties SET atomic_mass = 12.011 WHERE atomic_number = 6;
UPDATE properties SET atomic_mass = 14.008 WHERE atomic_number = 7;
UPDATE properties SET atomic_mass = 15.999 WHERE atomic_number = 8;

-- Eliminar el elemento de la tabla periódica con atomic_mass de 1000
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

-- Añadir elementos a la tabla elements y properties
INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 18.998, -220, -188.1, 1), (10, 20.18, -248.6, -246.1, 1);
