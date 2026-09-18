
import holidays

def is_holiday(date_col): 
    german_holidays = holidays.Germany()
    is_holiday = (date_col in german_holidays)      #boolean
    return is_holiday

def model(dbt, session): 
    dbt.config(packages=['pandas==2.3.3', 'holidays==0.29'])
    import pandas as pd


    my_sql_model_df = dbt.ref("stablecoin_activity_per_day")
    #my_sql_model_df = my_sql_model_df.to_pandas()
    rows = my_sql_model_df.collect()
    sql_model_df = pd.DataFrame([r.as_dict() for r in rows])

    sql_model_df["is_holiday"] = sql_model_df["DATE"].apply(is_holiday)

    snowpark_df = session.write_pandas(
        sql_model_df, 
        table_name='PYTHON_MODEL',
        auto_create_table = True, 
        overwrite = True, 
        table_type = "temporary"
    )
    return snowpark_df
