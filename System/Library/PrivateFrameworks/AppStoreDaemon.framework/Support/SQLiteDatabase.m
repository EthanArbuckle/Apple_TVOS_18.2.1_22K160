@interface SQLiteDatabase
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
@end

@implementation SQLiteDatabase

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  v4 = (id *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  uint64_t v6 = ASDLogHandleForCategory(35LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (v4)
    {
      id Property = v4[7];
      v11 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v10, 24LL, 1);
      }
    }

    else
    {
      v11 = 0LL;
      id Property = 0LL;
    }

    id v12 = Property;
    int v13 = 138543362;
    id v14 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Requring all stores to migrate after truncating corrupt database at: %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  NSResetHashTable(self->_migratedStores);
  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  v4 = (id *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (v4)
  {
    id Property = v4[7];
    v7 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v6, 24LL, 1);
    }
  }

  else
  {
    v7 = 0LL;
    id Property = 0LL;
  }

  id v8 = Property;

  uint64_t v9 = ASDLogHandleForCategory(35LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Exiting after deleting corrupt database at: %{public}@",  buf,  0xCu);
  }

  if (v4) {
    sub_1001D63E0((uint64_t)v4);
  }
  id v20 = 0LL;
  sub_10025270C(v8, &v20);
  id v11 = v20;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = ASDLogHandleForCategory(35LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error when deleting corrupt database, renaming database instead: %{public}@",  buf,  0xCu);
    }

    id v19 = 0LL;
    sub_1002524D4(v8, &v19);
    id v15 = v19;
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = ASDLogHandleForCategory(35LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error when renaming database: %{public}@",  buf,  0xCu);
      }
    }
  }

  exit(0);
}

- (void).cxx_destruct
{
}

@end