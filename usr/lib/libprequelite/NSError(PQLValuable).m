@interface NSError(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (void)sqliteBind:()PQLValuable index:;
@end

@implementation NSError(PQLValuable)

- (void)sqliteBind:()PQLValuable index:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v7 = (void *)MEMORY[0x1895CF1AC]();
  id v12 = 0LL;
  [MEMORY[0x1896078F8] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v12];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v12;
  if (v9)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    v10 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_18895A000, v10, OS_LOG_TYPE_DEFAULT, "warning: failed to archive error object %@", buf, 0xCu);
    }
  }

  id v11 = v8;
  sqlite3_bind_blob( a3,  a4,  (const void *)[v11 bytes],  objc_msgSend(v11, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v7);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (sqlite3_column_type(a3, iCol) != 4) {
    return 0LL;
  }
  v6 = (void *)MEMORY[0x189603F48];
  v7 = sqlite3_column_blob(a3, iCol);
  objc_msgSend(v6, "dataWithBytes:length:", v7, sqlite3_column_bytes(a3, iCol));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  uint64_t v9 = [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v13];
  id v10 = v13;
  if (v10)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    id v11 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl( &dword_18895A000,  v11,  OS_LOG_TYPE_DEFAULT,  "warning: failed to unarchive error object %@",  buf,  0xCu);
    }
  }

  return v9;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (sqlite3_value_type(a3) != 4) {
    return 0LL;
  }
  v4 = (void *)MEMORY[0x189603F48];
  v5 = sqlite3_value_blob(a3);
  [v4 dataWithBytes:v5 length:sqlite3_value_bytes(a3)];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  uint64_t v7 = [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v9 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_18895A000, v9, OS_LOG_TYPE_DEFAULT, "warning: failed to unarchive error object %@", buf, 0xCu);
    }
  }

  return v7;
}

@end