@interface BMSyncDatabaseTransactionBatcher
- (BMSyncDatabaseTransactionBatcher)initWithDatabase:(id)a3 transcationBatchSize:(unint64_t)a4;
- (BOOL)_commitTransaction;
- (BOOL)executeOperationWithBlock:(id)a3;
- (BOOL)markAllOperationsComplete;
- (BOOL)markOperationComplete;
- (BOOL)markOperationStarted;
@end

@implementation BMSyncDatabaseTransactionBatcher

- (BMSyncDatabaseTransactionBatcher)initWithDatabase:(id)a3 transcationBatchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BMSyncDatabaseTransactionBatcher;
  v8 = -[BMSyncDatabaseTransactionBatcher init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (BOOL)executeOperationWithBlock:(id)a3
{
  v4 = (void (**)(id, _BYTE *))a3;
  while (1)
  {
    v5 = objc_autoreleasePoolPush();
    -[BMSyncDatabase beginTransaction](self->_database, "beginTransaction");
    if (self->_batchSize) {
      break;
    }
LABEL_6:
    if (!-[BMSyncDatabase commit](self->_database, "commit"))
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100043AD8(v20, v21, v22, v23, v24, v25, v26, v27);
      }

      -[BMSyncDatabase rollback](self->_database, "rollback");
      BOOL v8 = 0;
      goto LABEL_13;
    }

    objc_autoreleasePoolPop(v5);
  }

  uint64_t v6 = 0LL;
  while (1)
  {
    id v7 = objc_autoreleasePoolPush();
    char v28 = 0;
    v4[2](v4, &v28);
    if (v28) {
      break;
    }
    objc_autoreleasePoolPop(v7);
    if (++v6 >= self->_batchSize) {
      goto LABEL_6;
    }
  }

  BOOL v8 = -[BMSyncDatabase commit](self->_database, "commit");
  if (!v8)
  {
    uint64_t v9 = __biome_log_for_category(11LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100043AD8(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    -[BMSyncDatabase rollback](self->_database, "rollback");
  }

  objc_autoreleasePoolPop(v7);
LABEL_13:
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (BOOL)_commitTransaction
{
  BOOL v3 = -[BMSyncDatabase commit](self->_database, "commit");
  if (!v3)
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100043AD8(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    self->_transactionError = 1;
    -[BMSyncDatabase rollback](self->_database, "rollback");
  }

  return v3;
}

- (BOOL)markOperationStarted
{
  if (-[BMSyncDatabase isInTransaction](self->_database, "isInTransaction")) {
    return 1;
  }
  else {
    return -[BMSyncDatabase beginTransaction](self->_database, "beginTransaction");
  }
}

- (BOOL)markOperationComplete
{
  if (!-[BMSyncDatabase isInTransaction](self->_database, "isInTransaction")
    || self->_currentBatchCount < self->_batchSize)
  {
    return 1;
  }

  self->_currentBatchCount = 0LL;
  return -[BMSyncDatabaseTransactionBatcher _commitTransaction](self, "_commitTransaction");
}

- (BOOL)markAllOperationsComplete
{
  if (self->_transactionError) {
    return 0;
  }
  if (-[BMSyncDatabase isInTransaction](self->_database, "isInTransaction")) {
    return -[BMSyncDatabaseTransactionBatcher _commitTransaction](self, "_commitTransaction");
  }
  return 1;
}

- (void).cxx_destruct
{
}

@end