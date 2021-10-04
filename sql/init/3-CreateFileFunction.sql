create or replace function api.file(id int) returns bytea as $$
declare headers text;
declare blob bytea;
begin
select format(
    '[{"Content-Type": "%s"}, {"Content-Disposition": "inline; filename=\"%s\""}, {"Cache-Control": "max-age=604800"}]',
    api.files.type,
    api.files.name
  )
from api.files
where api.files.id = file.id into headers;
perform set_config('response.headers', headers, true);
select api.files.blob
from api.files
where api.files.id = file.id into blob;
if found then return(blob);
else raise sqlstate 'PT404' using message = 'NOT FOUND',
detail = 'File not found',
hint = format('%s seems to be an invalid file id', id);
end if;
end $$ language plpgsql;
