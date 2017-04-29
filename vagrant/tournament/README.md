# Project Description: Tournament Planner

## Project Summary

In this project, I wrote a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

## How to Use This API

* Go into folder```cd /vagrant```
* Install necessary components using command line: ```vagrant up```
* Access the files: ```vagrant ssh```
* Go into folder```cd /vagrant/tournament```
* Go into postgresql using command line:```psql```
* In postgresql command line```\i tournament.sql``` to create database tournament and tables and views.
* Then you could run the test using ``` python tournament_test.py``` to test out the API

## Functions Supported

### registerPlayer(name)
Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

### countPlayers()
Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

### deletePlayers()
Clear out all the player records from the database.

### reportMatch(winner, loser)
Stores the outcome of a single match between two players in the database.

### deleteMatches()
Clear out all the match records from the database.

### playerStandings()
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

### swissPairings()
Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.