
/* Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle). */

/* SANS JOINTURE */
SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user, t_role 
WHERE t_user.role_id = t_role.role_id;

/* AVEC JOINTURE */
SELECT user_id, user_lastname, user_firstname, user_email, role_name 
FROM t_user 
JOIN t_role ON t_user.role_id = t_role.role_id;