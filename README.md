# How to setup the database to locally execute the pipeline

## Before doing the steps below, you should have cloned this git repository into a local directory

# Creating the database via a backup:
1. Ensure that a ```test_database``` database already exists in PostgreSQL 16.
2. Right click on the database in PostgreSQL 16 and click ```Restore```. 
3. Upload the provided  ```db_backup.sql``` file to recreate an image of the database
![Import database backup](import.png)
![Backup selection](import2.png)
![Restore](restore.png)

## Creating the database via the Python script:
1. First, create a virtual environment for Python. This will be necessary as you will install a requirements.txt file. Run: ```python -m venv .venv``` on Windows.
2. Active the venv: ```.venv\Scripts\activate```
3. Install the requirements.txt: ```pip install -r requirements.txt```
4. Run the main.py script: ```python main.py```. During the execution you will be prompted for your password for PostgreSQL 16.