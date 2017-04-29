-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

CREATE TABLE players ( name TEXT NOT NULL,
                     id SERIAL PRIMARY KEY
                     );
                     
CREATE TABLE matches ( winner integer REFERENCES players(id),
                     loser integer REFERENCES players(id),
                     PRIMARY KEY(winner, loser)
                     );

CREATE VIEW wins AS
SELECT players.id, COUNT(*) AS num
FROM players, matches
WHERE players.id = matches.winner
GROUP BY players.id;

CREATE VIEW total AS
SELECT players.id, COUNT(*) AS num
FROM players, matches
WHERE players.id = matches.winner OR players.id = matches.loser
GROUP BY players.id;

CREATE VIEW playerstandings AS
SELECT players.id, players.name, coalesce(wins.num, 0) AS winnum, coalesce(total.num, 0) AS totalnum
FROM players
LEFT JOIN wins USING (id)
LEFT JOIN total USING (id)
ORDER BY wins.num DESC;