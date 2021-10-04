create or replace function api.update_file(file_id int, name text, type text, base64 text) returns void as $$ begin
update api.files
set type = update_file.type,
  name = update_file.name,
  blob = decode(update_file.base64, 'base64')
where id = 1;
end $$ language plpgsql;
