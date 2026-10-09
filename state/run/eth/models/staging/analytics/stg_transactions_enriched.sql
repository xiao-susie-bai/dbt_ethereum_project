begin;
    insert into dbt.xiaobai.stg_transactions_enriched ("HASH", "BLOCK_NUMBER", "DATE", "FROM_ADDRESS", "TO_ADDRESS", "VALUE", "RECEIPT_CONTRACT_ADDRESS", "INPUT", "TOKEN_TRANSFER_COUNT", "TRANSACTION_CATEGORY")
    (
        select "HASH", "BLOCK_NUMBER", "DATE", "FROM_ADDRESS", "TO_ADDRESS", "VALUE", "RECEIPT_CONTRACT_ADDRESS", "INPUT", "TOKEN_TRANSFER_COUNT", "TRANSACTION_CATEGORY"
        from dbt.xiaobai.stg_transactions_enriched__dbt_tmp
    )

;
    commit;