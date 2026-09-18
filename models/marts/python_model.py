def model(dbt, session): 
    my_sql_model_df = dbt.ref("stablecoin_activity_per_day")
    return my_sql_model_df