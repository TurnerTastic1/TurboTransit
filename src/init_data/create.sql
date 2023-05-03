DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password CHAR(60) NOT NULL,
    home_address VARCHAR(100),
    phone VARCHAR(100)
);

DROP TABLE IF EXISTS trips CASCADE;
CREATE TABLE trips(
    trip_id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    departing CHAR(60) NOT NULL,
    destination CHAR(60) NOT NULL,
    purpose VARCHAR(200),
    time DATE NOT NULL,
    seats INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

DROP TABLE IF EXISTS users_to_trips CASCADE;
CREATE TABLE users_to_trips(
    trip_id INTEGER NOT NULL REFERENCES trips (trip_id),
    user_id INTEGER NOT NULL REFERENCES users (user_id)
);

DROP TABLE IF EXISTS history CASCADE;
CREATE TABLE history(
    trip_id INTEGER NOT NULL REFERENCES trips (trip_id),
    user_id INTEGER NOT NULL REFERENCES users (user_id)
);

DROP TABLE IF EXISTS friends CASCADE;
CREATE TABLE friends(
    user_id INTEGER NOT NULL REFERENCES users (user_id),
    friend_id INTEGER NOT NULL REFERENCES users (user_id)
);
