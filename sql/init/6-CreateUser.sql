CREATE ROLE web_anon nologin;
GRANT web_anon TO app_user;
GRANT usage ON SCHEMA api TO web_anon;
GRANT SELECT ON ALL TABLES IN SCHEMA api TO web_anon;
