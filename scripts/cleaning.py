import pandas as pd

def clean_data(path, logger):
    logger.info("Start reading data")

    df = pd.read_csv(path)

    logger.info("Starting cleanning")

    logger.info(f"Original shape: {df.shape}")
    logger.info(f"the sum of duplication row is {df.duplicated().sum()}")
    
    print(f"{df.info()}")
    print(df.describe())


    df.dropna(inplace=True)
    df.drop_duplicates(inplace=True)
    logger.info(f"the sum of null value \n{df.isnull().sum()}")
    df['session_date'] = pd.to_datetime(df['session_date'], errors='coerce')

    logger.info(f"the sum of duplication row is {df.duplicated().sum()}")
    df.to_csv('clean_data.csv', index=False)
    # Clean column names
    df.columns = df.columns.str.lower().str.replace(" ", "_")

    logger.info(f"Cleaned shape: {df.shape}")

    return df