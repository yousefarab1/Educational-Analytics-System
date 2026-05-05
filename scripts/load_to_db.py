from sqlalchemy import create_engine, text
import logging

def load_data(df, logger):
    try:
        logger.info("Connecting to database")

        engine = create_engine("postgresql://postgres:arabi@localhost:5432/final_project")


        logger.info("Loading data into PostgreSQL")

        df.to_sql("student_attendance", engine, if_exists="replace", index=False)

        logger.info("Data loaded successfully")

    except Exception as e:
        logger.error(f"Error: {str(e)}")
        raise