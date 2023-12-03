import psycopg2
import os
import pandas as pd
from getpass import getpass
from sqlalchemy import create_engine


CURRENT_DIRECTORY = os.getcwd()
CSV_PATH = "csv"
TARGET_PATH = os.path.join(CURRENT_DIRECTORY, CSV_PATH)
FBI = "fbi.csv"
IUCR = "iucr_codes.csv"
DATABASE = 'test_database'

if __name__ == '__main__':
    try:
        print("User password will not be displayed here.")
        postgresql_pass = getpass('Please enter your PostgreSQL 16 password: ', )

        conn = psycopg2.connect(
            user='postgres',
            password=postgresql_pass,
            host='localhost',
            port='5432',
            database=DATABASE
        )

        cursor = conn.cursor()

            # Create the 'iucr' table
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS iucr (
                iucr VARCHAR(255) UNIQUE NOT NULL,
                primary_description VARCHAR(255) NOT NULL,
                secondary_description VARCHAR(255) NOT NULL,
                index_code VARCHAR(255) NOT NULL,
                active BOOLEAN NOT NULL
            );
        ''')

        # Create the 'crime_fact_table' table
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS crime_fact_table (
                id VARCHAR,
                datetime_id INT,
                description VARCHAR,
                location_id INT,
                community_area INT,
                iucr VARCHAR,
                case_number VARCHAR,
                domestic BOOLEAN,
                fbi_code VARCHAR,
                primary_type VARCHAR(50),
                arrest BOOLEAN
            );
        ''')

        # Create the 'crime_date_dimension' table
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS crime_date_dimension (
                datetime_id INT,
                _month INT,
                _day INT,
                _year INT,
                _hour INT,
                crime_date DATE
            );
        ''')

        # Create the 'crime_location_dimension' table
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS crime_location_dimension (
                location_id INT PRIMARY KEY,
                latitude FLOAT,
                longitude FLOAT,
                location_description VARCHAR,
                block VARCHAR
            );
        ''')

        # Create the 'fbi_code' table
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS fbi_code (
                id VARCHAR UNIQUE,
                description VARCHAR,
                crime_against VARCHAR
            );
        ''')

        # Commit the changes
        conn.commit()

        print('Tables created successfully!')

        engine = create_engine(f'postgresql://postgres:{postgresql_pass}@localhost:5432/{DATABASE}')
        
        # Insert the fbi_code data
        fbi_path = os.path.join(TARGET_PATH, FBI)
        fbi_table = "fbi_code"
        df_fbi = pd.read_csv(fbi_path)
        df_fbi.to_sql(fbi_table, con=engine, if_exists='replace')

        iucr_path = os.path.join(TARGET_PATH, IUCR)
        iucr_table = "iucr"
        df_iucr = pd.read_csv(iucr_path)
        df_iucr.to_sql(iucr_table, con=engine, if_exists='replace')

        print("Data exported to tables. Database setup complete.")

    except Exception as e:
        print(str(e))