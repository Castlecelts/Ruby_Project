DROP TABLE team_rosters
DROP TABLE teams
DROP TABLE heroes

CREATE TABLE heroes(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255), NOT NULL
  world VARCHAR(255),
  hireable BIT NOT NULL
);

CREATE TABLE teams(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255), NOT NULL
  region VARCHAR(255)
);

CREATE TABLE team_rosters(
  id SERIAL8 PRIMARY KEY,
  team_id SERIAL8 REFERENCES teams(id),
  hero_id SERIAL8 REFERENCES hero(id)
);
