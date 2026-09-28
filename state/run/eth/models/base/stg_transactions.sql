-- back compat for old kwarg name
  
  begin;
    
        
            
            
            
            
        
    

    

    merge into dbt.xiaobai.stg_transactions as DBT_INTERNAL_DEST
        using dbt.xiaobai.stg_transactions__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.hash = DBT_INTERNAL_DEST.hash))

    
    when matched then update set
        "HASH" = DBT_INTERNAL_SOURCE."HASH","BLOCK_NUMBER" = DBT_INTERNAL_SOURCE."BLOCK_NUMBER","DATE" = DBT_INTERNAL_SOURCE."DATE","FROM_ADDRESS" = DBT_INTERNAL_SOURCE."FROM_ADDRESS","TO_ADDRESS" = DBT_INTERNAL_SOURCE."TO_ADDRESS","VALUE" = DBT_INTERNAL_SOURCE."VALUE","RECEIPT_CONTRACT_ADDRESS" = DBT_INTERNAL_SOURCE."RECEIPT_CONTRACT_ADDRESS","INPUT" = DBT_INTERNAL_SOURCE."INPUT"
    

    when not matched then insert
        ("HASH", "BLOCK_NUMBER", "DATE", "FROM_ADDRESS", "TO_ADDRESS", "VALUE", "RECEIPT_CONTRACT_ADDRESS", "INPUT")
    values
        ("HASH", "BLOCK_NUMBER", "DATE", "FROM_ADDRESS", "TO_ADDRESS", "VALUE", "RECEIPT_CONTRACT_ADDRESS", "INPUT")

;
    commit;