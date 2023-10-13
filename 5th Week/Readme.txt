Certainly, here are some sample SQL queries for inserting, updating, and deleting data in the database you've created for your gaming event management system:

**Insert Data Queries:**

1. Insert a new quest into the `Quests` table:
```sql
INSERT INTO Quests (quest_name, description, min_player_level, max_player_level, quest_location_coordinates, quest_location_zone)
VALUES ('Epic Adventure', 'Defeat the Dragon', 10, 20, '123.456,789.012', 'Dragon's Lair');
```

2. Insert a new player into the `Players` table:
```sql
INSERT INTO Players (username, avatar_image)
VALUES ('Player1', 'avatar1.jpg');
```

3. Insert a player's participation record in a quest:
```sql
INSERT INTO QuestParticipation (quest_id, player_id, items_collected, points_scored, time_taken)
VALUES (1, 1, 'Sword x1, Shield x1', 100, '00:45:30');
```

4. Create a new friendship between two players:
```sql
INSERT INTO Friends (player_id, friend_player_id, date_became_friends, shared_quests, mutual_enemies_defeated)
VALUES (1, 2, '2023-10-10', 'Quest1, Quest2', 'Enemy1, Enemy2');
```

**Update Data Queries:**

1. Update a player's avatar image:
```sql
UPDATE Players
SET avatar_image = 'new_avatar.jpg'
WHERE player_id = 1;
```

2. Update quest details:
```sql
UPDATE Quests
SET max_player_level = 30, quest_location_coordinates = '456.789,123.456'
WHERE quest_id = 1;
```

**Delete Data Queries:**

1. Delete a quest from the `Quests` table:
```sql
DELETE FROM Quests
WHERE quest_id = 1;
```

2. Delete a player's participation record:
```sql
DELETE FROM QuestParticipation
WHERE participation_id = 1;
```

3. Delete a friendship between two players:
```sql
DELETE FROM Friends
WHERE player_id = 1 AND friend_player_id = 2;
```

Please note that these are just sample queries, and you should adapt them according to your specific use cases and data requirements in your gaming event management system. Make sure to use appropriate WHERE clauses to target the rows you want to insert, update, or delete.