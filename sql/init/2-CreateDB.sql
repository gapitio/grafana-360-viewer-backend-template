CREATE TABLE api.files (
  id SERIAL PRIMARY KEY,
  name TEXT,
  type TEXT,
  blob BYTEA
);
CREATE TABLE api.areas (
  area_key SERIAL PRIMARY KEY,
  area_name TEXT UNIQUE
);
CREATE TABLE api.scenes (
  scene_key SERIAL PRIMARY KEY,
  area_key INTEGER REFERENCES api.areas (area_key) ON DELETE CASCADE,
  scene_name TEXT,
  file_id INTEGER REFERENCES api.files (id),
  facing_yaw REAL,
  facing_pitch REAL,
  fov REAL
);
CREATE TABLE api.hotspots (
  hotspot_key SERIAL PRIMARY KEY,
  scene_key INTEGER REFERENCES api.scenes (scene_key) ON DELETE CASCADE,
  area_key INTEGER REFERENCES api.areas (area_key) ON DELETE CASCADE,
  type TEXT,
  title TEXT,
  description TEXT,
  decimals INT,
  metric TEXT,
  unit TEXT,
  color TEXT,
  go_to_scene_key INTEGER REFERENCES api.scenes (scene_key) ON DELETE CASCADE,
  yaw REAL,
  pitch REAL,
  extra_transforms TEXT,
  link TEXT
);
