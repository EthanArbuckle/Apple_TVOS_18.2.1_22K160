@interface NSURL(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (void)sqliteBind:()PQLValuable index:;
@end

@implementation NSURL(PQLValuable)

- (void)sqliteBind:()PQLValuable index:
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 sqliteBind:a3 index:a4];
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  v0 = (void *)objc_msgSend(NSString, "newFromSqliteStatement:atIndex:");
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x189604030]) initWithString:v0];
  }
  else {
    uint64_t v1 = 0LL;
  }

  return v1;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  v0 = (void *)objc_msgSend(NSString, "newFromSqliteValue:");
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x189604030]) initWithString:v0];
  }
  else {
    uint64_t v1 = 0LL;
  }

  return v1;
}

@end