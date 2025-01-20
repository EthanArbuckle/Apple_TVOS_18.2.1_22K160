@interface TVTestPurgeTask
- (NSString)description;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4;
- (int64_t)purgeableAmountWithUrgency:(int64_t)a3;
@end

@implementation TVTestPurgeTask

- (int64_t)purgeableAmountWithUrgency:(int64_t)a3
{
  return 1000LL;
}

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4
{
  if (a3 >= 1000) {
    return 1000LL;
  }
  else {
    return a3;
  }
}

- (NSString)description
{
  return (NSString *)@"Fake Cache";
}

@end