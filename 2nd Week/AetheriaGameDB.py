import json
import psycopg2

# Step 1: Read cleaned JSON data
with open('cleaned_data.json', 'r') as file:
    cleaned_data = json.load(file)

# Step 2: Connect to the database
conn = psycopg2.connect(
    dbname='your_database_name',
    user='your_username',
    password='your_password',
    host='your_host'
)
cursor = conn.cursor()

# Step 3: Create database tables (assuming you haven't already)
create_table_query = '''
CREATE TABLE IF NOT EXISTS gaming_data (
    event_id serial PRIMARY KEY,
    player_id INT,
    event_type VARCHAR(255),
    event_date DATE,
    -- Add more columns as needed
);
'''
cursor.execute(create_table_query)
conn.commit()

# Step 4: Load data into the database
for record in cleaned_data:
    insert_query = '''
    INSERT INTO gaming_data (player_id, event_type, event_date, ...)
    VALUES (%s, %s, %s, ...);
    '''
    cursor.execute(insert_query, (record['player_id'], record['event_type'], record['event_date'], ...))

conn.commit()

# Step 5: Close the database connection
conn.close()
