create or replace function api.insert_file(name text, type text, base64 text) returns int as $$
declare file_id int;
begin
insert into api.files (type, name, blob)
values (type, name, decode(base64, 'base64'))
returning id into file_id;
return file_id;
end $$ language plpgsql;
