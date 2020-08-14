#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SEQUENCE IF NOT EXISTS bucket_seq_id START WITH 1;
    CREATE TABLE IF NOT EXISTS bucket (
        id INT PRIMARY KEY DEFAULT nextval('bucket_seq_id'),
        type text NOT NULL check (char_length(type) < 10),
        name text NOT NULL check (char_length(name) < 100),
        prefix text NOT NULL check (char_length(prefix) < 500),
        access_key text NOT NULL check (char_length(access_key) < 100),
        access_secret text NOT NULL check (char_length(access_secret) < 100)
    );
EOSQL
