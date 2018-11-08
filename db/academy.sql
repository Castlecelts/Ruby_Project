DROP TABLE team_rosters
DROP TABLE teams
DROP TABLE heroes

CREATE TABLE heroes(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  world VARCHAR(255),
  hireable BIT NOT NULL
);
