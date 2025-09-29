## Requêtes UPDATE à implémenter (utilisateurs) 

1. Modifier l'utilisateur n° 3. 
    - Nouvel email : germaine.lustrucru@example.fr 

```sql
UPDATE t_user SET user_email='germaine.lustrucru@example.fr' 
WHERE user_id=3;
```

2. Modifier l'utilisateur n°4.
    - Nouveau nom : Hatcher
    - Nouveau mot de passe : tatayoyo

```sql
UPDATE t_user SET user_lastname='hatcher', user_password='tatayoyo' 
WHERE user_id=4;
```



## Requêtes SELECT à implémenter (utilisateurs)

1. Sélectionner toutes les informations de tous les utilisateurs.

```sql
SELECT * 
FROM t_user; /* utilisation de * non recommandé mais pas interdit */

SELECT user_id, user_email, user_lastname, user_firstname, user_password, role_id 
FROM t_user;
```

2. Sélectionner le nom, prénom, email et identifiant de chaque utilisateur.

```sql
SELECT user_lastname, user_firstname, user_email, user_id 
FROM t_user;
```

3. Sélectionner l'identifiant, le prénom et le nom de l'utilisateur n°2.

```sql
SELECT user_id, user_firstname, user_lastname 
FROM t_user 
WHERE user_id=2;
```

4. Sélectionner l'identifiant, le nom et l'email des utilisateurs dont le nom est "ingals".

```sql
SELECT user_id, user_lastname, user_email 
FROM t_user 
WHERE user_lastname='ingals';
```

5. Sélectionner toutes les informations des utilisateurs sans prénom.

```sql
SELECT user_id, user_email, user_lastname, user_firstname, user_password, role_id
FROM t_user 
WHERE user_firstname IS NULL OR user_firstname='';
```

6. Sélectionner toutes les informations des utilisateurs avec un prénom. Le résultat est trié par identifiant (ordre décroissant)

```sql
SELECT user_id, user_email, user_lastname, user_firstname, user_password, role_id 
FROM t_user 
WHERE user_firstname IS NOT NULL AND user_firstname <> ''
ORDER BY user_id DESC;
```

7. Sélectionner l'identifiant et le nom des utilisateurs dont le nom contient la lettre "g".

```sql
SELECT user_id, user_lastname 
FROM t_user
WHERE user_lastname LIKE '%g%';
```

8. Sélectionner l'identifiant, le nom et l'email des utilisateurs dont le prénom commence par la lettre "c". Le résultat est trié par prénom (ordre alphabétique)

```sql
SELECT user_id, user_lastname, user_email
FROM t_user 
WHERE user_firstname LIKE 'c%' 
ORDER BY user_firstname ASC;
```

9. Sélectionner le nom, le prénom et l'email des utilisateurs dont l'email se termine par ".fr". Le résultat est trié par nom (ordre alphabétique)

```sql
SELECT user_lastname, user_firstname, user_email 
FROM t_user 
WHERE user_email LIKE '%.fr'
ORDER BY user_lastname ASC;
```
