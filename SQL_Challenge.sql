-- Create a table called Pokemon
CREATE TABLE Pokemon (
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Name NVARCHAR(16) NOT NULL,
    Height NVARCHAR(16) NOT NULL,
    Weight NVARCHAR(16) NOT NULL
)

-- Create a table called Type
CREATE TABLE Type (
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Name NVARCHAR(16) NOT NULL UNIQUE
)

-- Create a table called PokemonType
CREATE TABLE PokemonType (
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    PokemonId INT NOT NULL,
    TypeId INT NOT NULL,
)

-- Add foreign key constraint
ALTER TABLE PokemonType ADD CONSTRAINT FK_PokemonId
FOREIGN KEY (PokemonId) REFERENCES Pokemon(Id)

ALTER TABLE PokemonType ADD CONSTRAINT FK_TypeId
FOREIGN KEY (TypeId) REFERENCES Type(Id)

-- Add records to Pokemon table
INSERT Pokemon (Name, Height, Weight)
VALUES ('Bulbasaur', '7', '70'), ('Ditto', '3', '40');

-- Add records to Type
INSERT Type (Name) VALUES ('Normal'), ('Grass');

-- Add records to PokemonType
INSERT PokemonType (PokemonId, TypeId) VALUES (1, 2), (2, 1);

SELECT * FROM Pokemon;
SELECT * FROM Type;
SELECT * FROM PokemonType;

SELECT 
Pokemon.Id, Pokemon.Name, Pokemon.Height, Pokemon.Weight, Type.Id AS TypeId, Type.Name AS TypeName, PokemonType.Id AS PokemonTypeId 
FROM Pokemon 
LEFT JOIN PokemonType ON Pokemon.Id = PokemonType.PokemonId
LEFT JOIN Type ON PokemonType.TypeId = Type.Id;