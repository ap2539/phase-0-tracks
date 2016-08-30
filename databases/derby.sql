
/*Create players table*/
CREATE TABLE Players 
("id" INTEGER PRIMARY KEY, 
	"name" VARCHAR(255), 
	"jersey" INTEGER, 
	"team_name" VARCHAR(255));

/* Insert Several players into new table*/
INSERT INTO Players VALUES
(1,"Paula Bunion", 45, "Wrecking Balls"),
(2,"Grave Danger", 6, "Team Unicorn"),
(3,"April Bloodgate", 12, "Team Unicorn");

/* select player with an ID of 1 */
SELECT * FROM Players WHERE id=1;

/*Create team table*/
CREATE TABLE Team 
("team_id" INTEGER PRIMARY KEY, 
	"team_name" VARCHAR(255));

/*Insert teams to table*/
INSERT INTO Team VALUES
(1, "Wrecking Belles"),
(2, "Team Unicorn");

/*Drop players table */
DROP TABLE Players;

/*Recreate Players table with foriegn key for team*/
CREATE TABLE Players 
("id" INTEGER PRIMARY KEY, 
	"name" VARCHAR(255), 
	"jersey" INTEGER, 
	"team_id" INTEGER, 
	FOREIGN KEY (team_id) REFERENCES team(team_id));

/*Add players back to table with team_id insetad of team name */
INSERT INTO Players VALUES
(1,"Paula Bunion", 45, 1),
(2,"Grave Danger", 6, 2),
(3,"April Bloodgate", 12, 2);

/*View players with team names query*/
SELECT p.name, t.team_name
FROM players p,team t
WHERE p.team_id = t.team_id;