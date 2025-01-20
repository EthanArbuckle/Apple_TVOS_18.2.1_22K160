@interface NSError(PQLAdditions)
+ (id)errorForDB:()PQLAdditions SQL:;
+ (id)errorForDB:()PQLAdditions stmt:;
+ (id)errorWithSqliteCode:()PQLAdditions andMessage:;
+ (uint64_t)errorForDB:()PQLAdditions;
- (BOOL)isSqliteErrorCode:()PQLAdditions;
- (id)sqliteStatement;
- (uint64_t)extendedSqliteCode;
@end

@implementation NSError(PQLAdditions)

+ (uint64_t)errorForDB:()PQLAdditions
{
  return [MEMORY[0x189607870] errorForDB:a3 SQL:0];
}

+ (id)errorForDB:()PQLAdditions stmt:
{
  v5 = (void *)MEMORY[0x189607870];
  [NSString stringWithUTF8String:sqlite3_sql(pStmt)];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 errorForDB:a3 SQL:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForDB:()PQLAdditions SQL:
{
  id v5 = a4;
  unsigned __int8 v6 = sqlite3_errcode(a3);
  uint64_t v7 = sqlite3_extended_errcode(a3);
  int v15 = 0;
  if (v5) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = 3LL;
  }
  [MEMORY[0x189603FC8] dictionaryWithCapacity:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:sqlite3_errmsg(a3)];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x189604F38]];

  [MEMORY[0x189607968] numberWithInteger:v7];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v11 forKeyedSubscript:@"SqliteExtendedCode"];

  if (a3 && !sqlite3_file_control(a3, 0LL, 4, &v15) && v15)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v15 userInfo:0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x189607798]];
  }

  if (v5) {
    [v9 setObject:v5 forKeyedSubscript:@"SqliteSQL"];
  }
  [MEMORY[0x189607870] errorWithDomain:@"SqliteErrorDomain" code:v6 userInfo:v9];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithSqliteCode:()PQLAdditions andMessage:
{
  v12[2] = *MEMORY[0x1895F89C0];
  v11[0] = *MEMORY[0x189604F38];
  v11[1] = @"SqliteExtendedCode";
  v12[0] = a4;
  id v5 = (void *)MEMORY[0x189607968];
  id v6 = a4;
  [v5 numberWithInt:a3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"SqliteErrorDomain" code:a3 userInfo:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)extendedSqliteCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"SqliteExtendedCode"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = [a1 code];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)sqliteStatement
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"SqliteSQL"];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isSqliteErrorCode:()PQLAdditions
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    BOOL v6 = 0LL;
  }

  return v6;
}

@end