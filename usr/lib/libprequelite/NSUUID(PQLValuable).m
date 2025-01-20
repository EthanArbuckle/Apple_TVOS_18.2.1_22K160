@interface NSUUID(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSUUID(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a1 getUUIDBytes:v7];
  return sqlite3_bind_blob(a3, a4, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (sqlite3_column_type(a3, iCol) == 4)
  {
    v6 = sqlite3_column_blob(a3, iCol);
    if (sqlite3_column_bytes(a3, iCol) == 16) {
      return [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v6];
    }
  }

  else if (sqlite3_column_type(a3, iCol) == 3)
  {
    uint64_t v8 = sqlite3_column_text(a3, iCol);
  }

  return 0LL;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (sqlite3_value_type(a3) == 4)
  {
    v4 = sqlite3_value_blob(a3);
    if (sqlite3_value_bytes(a3) == 16) {
      return [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v4];
    }
  }

  else if (sqlite3_value_type(a3) == 3)
  {
    v6 = sqlite3_value_text(a3);
  }

  return 0LL;
}

@end