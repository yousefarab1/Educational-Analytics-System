from scripts.cleaning import clean_data
from scripts.load_to_db import load_data
from scripts.logger import setup_logger

def run_pipeline():
    logger = setup_logger()

    logger.info("Pipeline started")

    df = clean_data("data/educational_analytics_dirty.csv", logger)

    load_data(df, logger)

    logger.info("Pipeline finished successfully")

run_pipeline()
