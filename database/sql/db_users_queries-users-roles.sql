/*
if(user_id > 2 && user_id < 2 || user_lastname.contain('r') { }

*/
/* Sélectionner tous les utilisateurs 
(identifiant nom, prénom, email et nom du rôle). */

-- email = 	' or 1=1;#		germaine.lustrucru@example.fr
-- password = azer
/*
SELECT user_lastname, user_firstname 
FROM t_user
WHERE user_email='' AND user_password='azer';

SELECT user_lastname, user_firstname 
FROM t_user
WHERE user_email='' or 1=1;#' AND user_password='azer';


*/


SELECT 
user_lastname, user_firstname, user_id, user_email
FROM t_user
WHERE user_id >= 2 OR user_lastname LIKE 'd%' AND user_firstname LIKE 'd%'
ORDER BY user_lastname DESC, user_email DESC
LIMIT 1;


/* Sélectionner tous les utilisateurs 
(identifiant nom, prénom, email et nom du rôle). */

/* SANS JOINTURE */
SELECT user_id, user_lastname, user_firstname, user_email, role_name, t_user.role_id
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id;

/* SANS JOINTURE (uniquement les emails se terminant par .com) */
SELECT user_id, user_lastname, user_firstname, user_email, role_name, t_user.role_id
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id AND user_email LIKE '%.com';

/* AVEC JOINTURE */
SELECT *
FROM t_user INNER JOIN t_role ON t_user.role_id = t_role.role_id
ORDER BY user_lastname DESC, user_email DESC
LIMIT 10;

/* AVEC JOINTURE (uniquement les emails se terminant par .com) */
SELECT *
FROM t_user INNER JOIN t_role ON t_user.role_id = t_role.role_id 
WHERE user_email LIKE '%.com'
;

/*
SELECT *
FROM t_user LEFT JOIN t_role ON t_user.role_id = t_role.role_id;

SELECT *
FROM t_user RIGHT JOIN t_role ON t_user.role_id = t_role.role_id;


SELECT *
FROM t_role RIGHT JOIN t_user ON t_user.role_id = t_role.role_id;

SELECT *
FROM t_role LEFT JOIN t_user ON t_user.role_id = t_role.role_id; */




/* 2. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle). 
    Trier les résultats par identifiant de rôle par ordre décroissant puis par nom de famille par ordre croissant. */ 
    
SELECT user_id, user_lastname, user_firstname, user_email, t_role.role_id, role_name 
FROM t_user 
INNER JOIN t_role 
ON t_user.role_id = t_role.role_id
ORDER BY t_role.role_id DESC, user_lastname ASC;

SELECT 
user_id, 
user_lastname, 
user_firstname, 
user_email, 
U.role_id, 
role_name 
FROM t_user AS U
INNER JOIN t_role R
ON U.role_id = R.role_id
ORDER BY U.role_id DESC, user_lastname ASC;


/* 3. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2 */

SELECT user_id, user_lastname, user_firstname, user_email, t_role.role_id, role_name 
FROM t_user 
INNER JOIN t_role ON t_user.role_id = t_role.role_id 
WHERE t_role.role_id = 2;

/* 4. Sélectionner, dans les rôles, le plus grand identifiant. */

SELECT 
MAX(role_name) AS role_id_max 
FROM t_role;
-- SELECT * FROM t_role ORDER BY role_name DESC LIMIT 1;

/* 4. Sélectionner, dans les rôles, le plus petit identifiant. */

SELECT MIN(role_id) FROM t_role;


/* 4. Sélectionner, dans les rôles, la moyenne des niveaux... */

SELECT AVG(role_level) FROM t_role;


/* 4. Sélectionner, dans les rôles, la somme des identifiants... */

SELECT SUM(role_id) FROM t_role;


/* 5. Sélectionner le nombre d'utilisateurs. */

SELECT COUNT(user_id) FROM t_user;

/* 6. Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). 
    Pour chaque rôle, afficher le nombre d'utilisateurs concernés. */
    
SELECT role_name, role_description, COUNT(user_id)
FROM t_role
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_role.role_id
;

/* 7. Sélectionner la moyenne du nombre d'utilisateurs par rôle. */
/* PAS DE JOINTURE :D */
/* IL Y A UNE SOUS REQUETE... */

SELECT (SELECT COUNT(user_id) FROM t_user) / (SELECT COUNT(role_id) FROM t_role);
/* Après exécution des 2 sous requeêtes */
SELECT (7) / (4)
