-- don't do last part unless you want it to be public...
CREATE DATABASE "NewDatabase"
  WITH OWNER = RelevantUserName
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United Kingdom.1252'
       LC_CTYPE = 'English_United Kingdom.1252'
       CONNECTION LIMIT = -1;
GRANT ALL ON DATABASE "NewDatabase" TO RelevantUserName;
GRANT ALL ON DATABASE "NewDatabase" TO public;
