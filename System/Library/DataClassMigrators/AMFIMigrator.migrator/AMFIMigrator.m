@interface AMFIMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation AMFIMigrator

- (id)dataClassName
{
  return @"AMFIMigrator";
}

- (BOOL)performMigration
{
  uint64_t v3 = _DMLogFunc(v2, 5LL);
  BOOL v4 = AMFIInitiateDataMigration(v3) == 0;
  _DMLogFunc(v2, 5LL);
  return v4;
}
@end