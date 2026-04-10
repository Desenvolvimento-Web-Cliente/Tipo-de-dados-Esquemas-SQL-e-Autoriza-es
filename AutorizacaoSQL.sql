--Questão 1: Criação dos usuários
CREATE USER User_A WITH PASSWORD='Pt3035921';
CREATE USER User_B WITH PASSWORD='Pt3035921';
CREATE USER User_C WITH PASSWORD='Pt3035921';
CREATE USER User_D WITH PASSWORD='Pt3035921';

--Questão 2: Privilégio de acessar e modificar as tabelas, menos a classroom, para o User_A e a possibilidade de passar esses privilégios para outros usuários
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA:: dbo TO User_A WITH GRANT OPTION;
REVOKE SELECT, INSERT, UPDATE, DELETE ON dbo.classroom TO User_A cascade;

--Questão 3: Permissões do usuário A
SELECT  princ.name, princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id)
FROM    sys.database_principals princ
LEFT JOIN
        sys.database_permissions perm
ON      perm.grantee_principal_id = princ.principal_id
WHERE princ.name = 'User_A';
