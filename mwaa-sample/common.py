create_fruit_tb = """
CREATE TABLE IF NOT EXISTS fruit (
 fruit_id INTEGER,
 name VARCHAR NOT NULL,
 color VARCHAR NOT NULL
 );
"""
insert_data= [
 "INSERT INTO fruit VALUES ( 1, 'Banana', 'Yellow');",
 "INSERT INTO fruit VALUES ( 2, 'Apple', 'Red');",
 "INSERT INTO fruit VALUES ( 3, 'Lemon', 'Yellow');",
 "INSERT INTO fruit VALUES ( 4, 'Grape', 'Purple');",
 "INSERT INTO fruit VALUES ( 5, 'Pear', 'Green');",
 "INSERT INTO fruit VALUES ( 6, 'Strawberry', 'Red');",
 ]
create_more_fruit_from_fruit="CREATE TABLE more_fruit AS SELECT * FROM fruit;"