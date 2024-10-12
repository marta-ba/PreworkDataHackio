
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
SELECT 
    CONCAT("Track"."Name", ' (', "Album"."Title", ')') AS "Track_Album_Info"
FROM 
    "Track"
JOIN 
    "Album" 
ON 
    "Track"."AlbumId" = "Album"."AlbumId"
ORDER BY 
    "Track_Album_Info";



-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
SELECT 
    CONCAT("Artist"."Name", ' - ', "Album"."Title") AS "Artist_Album_Info"
FROM 
    "Album"
JOIN 
    "Artist" 
ON 
    "Album"."ArtistId" = "Artist"."ArtistId"
ORDER BY 
    "Artist"."Name";


SELECT 
    CONCAT("Customer"."FirstName", ' ', "Customer"."LastName") AS "Customer_Name", 
    SUM("Invoice"."Total") AS "Total_Invoices"
FROM 
    "Customer"
JOIN 
    "Invoice" 
ON 
    "Customer"."CustomerId" = "Invoice"."CustomerId"
GROUP BY 
    "Customer"."CustomerId"
ORDER BY 
    "Total_Invoices" DESC
LIMIT 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
SELECT 
    CONCAT(empleados."FirstName", ' ', empleados."LastName") AS "Employee_Name", 
    CONCAT(clientes."FirstName", ' ', clientes."LastName") AS "Customer_Name"
FROM 
    "Employee" AS empleados
JOIN 
    "Customer" AS clientes 
ON 
    empleados."EmployeeId" = clientes."SupportRepId"
ORDER BY 
    "Employee_Name";


-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.



-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

SELECT CONCAT(artistas."Name", ' - ', generos."Name") AS "Artist_Genre_Info" FROM "Track" AS pistas JOIN "Album" AS albumes ON pistas."AlbumId" = albumes."AlbumId" JOIN "Artist" AS artistas ON albumes."ArtistId" = artistas."ArtistId" JOIN "Genre" AS generos ON pistas."GenreId" = generos."GenreId" ORDER BY artistas."Name", generos."Name";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

SELECT pistas."Name" AS "Track_Name", media."Name" AS "Media_Type" FROM "Track" AS pistas JOIN "MediaType" AS media ON pistas."MediaTypeId" = media."MediaTypeId" ORDER BY pistas."Name";


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

SELECT 
    pistas."Name" AS "Track_Name", 
    generos."Name" AS "Genre_Name"
FROM 
    "Track" AS pistas
LEFT JOIN 
    "Genre" AS generos 
ON 
    pistas."GenreId" = generos."GenreId"
ORDER BY 
    pistas."Name";


-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

SELECT 
    clientes."FirstName" AS "Customer_First_Name", 
    clientes."LastName" AS "Customer_Last_Name", 
    facturas."InvoiceId" AS "Invoice_ID", 
    facturas."Total" AS "Invoice_Total"
FROM 
    "Customer" AS clientes
LEFT JOIN 
    "Invoice" AS facturas 
ON 
    clientes."CustomerId" = facturas."CustomerId"
ORDER BY 
    clientes."FirstName", clientes."LastName";

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

SELECT 
    albumes."Title" AS "Album_Title", 
    artistas."Name" AS "Artist_Name"
FROM 
    "Album" AS albumes
LEFT JOIN 
    "Artist" AS artistas 
ON 
    albumes."ArtistId" = artistas."ArtistId"
ORDER BY 
    albumes."Title";

SELECT 
    generos."Name" AS "Genre_Name", 
    COUNT(pistas."TrackId") AS "Track_Count"
FROM 
    "Genre" AS generos
LEFT JOIN 
    "Track" AS pistas 
ON 
    generos."GenreId" = pistas."GenreId"
GROUP BY 
    generos."GenreId", generos."Name"
ORDER BY 
    "Track_Count" DESC;


--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
SELECT 
    albumes."Title" AS "Album_Title", 
    SUM(pistas."Milliseconds") AS "Total_Duration_MS"
FROM 
    "Album" AS albumes
JOIN 
    "Track" AS pistas 
ON 
    albumes."AlbumId" = pistas."AlbumId"
GROUP BY 
    albumes."AlbumId", albumes."Title"
ORDER BY 
    albumes."Title";


-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

SELECT 
    CONCAT(clientes."FirstName", ' ', clientes."LastName") AS "Client_Name", 
    SUM(facturas."Total") AS "Total_Spent"
FROM 
    "Customer" AS clientes
JOIN 
    "Invoice" AS facturas 
ON 
    clientes."CustomerId" = facturas."CustomerId"
GROUP BY 
    clientes."CustomerId", clientes."FirstName", clientes."LastName"
ORDER BY 
    "Total_Spent" DESC;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.


SELECT 
    CONCAT(empleados."FirstName", ' ', empleados."LastName") AS "Employee_Name", 
    CONCAT(clientes."FirstName", ' ', clientes."LastName") AS "Client_Name"
FROM 
    "Employee" AS empleados
LEFT JOIN 
    "Customer" AS clientes 
ON 
    empleados."EmployeeId" = clientes."SupportRepId"
ORDER BY 
    empleados."EmployeeId";

