@interface NSDate(SFAnalytics)
- (double)bucketToRoundingFactor:()SFAnalytics;
- (double)timeIntervalSince1970WithBucket:()SFAnalytics;
@end

@implementation NSDate(SFAnalytics)

- (double)bucketToRoundingFactor:()SFAnalytics
{
  double result = 60.0;
  if (a3 != 1) {
    double result = 1.0;
  }
  if (a3 == 2) {
    return 3600.0;
  }
  return result;
}

- (double)timeIntervalSince1970WithBucket:()SFAnalytics
{
  double v2 = v1;
  [MEMORY[0x189603F50] date];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 timeIntervalSince1970];
  double v5 = v4;

  return v5 + v2 - (double)((uint64_t)v5 % (uint64_t)v2);
}

@end