@interface NSNumber(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSNumber(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  id v6 = a1;
  [v6 doubleValue];
  return sqlite3_bind_double(a3, a4, v7);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  int v6 = sqlite3_column_type(a3, iCol);
  if (v6 == 5) {
    return 0LL;
  }
  if (v6 == 2) {
    objc_msgSend(MEMORY[0x189607968], "numberWithDouble:", sqlite3_column_double(a3, iCol));
  }
  else {
    objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", sqlite3_column_int64(a3, iCol));
  }
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  int v4 = sqlite3_value_type(a3);
  if (v4 == 5) {
    return 0LL;
  }
  if (v4 == 2) {
    [MEMORY[0x189607968] numberWithDouble:sqlite3_value_double(a3)];
  }
  else {
    [MEMORY[0x189607968] numberWithLongLong:sqlite3_value_int64(a3)];
  }
  return objc_claimAutoreleasedReturnValue();
}

@end