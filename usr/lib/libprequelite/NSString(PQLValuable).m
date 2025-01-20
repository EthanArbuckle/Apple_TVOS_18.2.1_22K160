@interface NSString(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSString(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  return sqlite3_bind_text( a3, a4, (const char *)[a1 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 5) {
    return 0LL;
  }
  v7 = sqlite3_column_text(a3, iCol);
  return objc_msgSend( objc_alloc(NSString),  "initWithBytes:length:encoding:",  v7,  sqlite3_column_bytes(a3, iCol),  4);
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  if (sqlite3_value_type(a3) == 5) {
    return 0LL;
  }
  v5 = sqlite3_value_text(a3);
  return [objc_alloc(NSString) initWithBytes:v5 length:sqlite3_value_bytes(a3) encoding:4];
}

@end