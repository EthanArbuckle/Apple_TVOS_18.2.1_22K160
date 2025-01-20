@interface CLFitnessDailyAnalyticsAggregator
+ (BOOL)isSupported;
- (FitnessDailyMetric)getActivityStats;
@end

@implementation CLFitnessDailyAnalyticsAggregator

+ (BOOL)isSupported
{
  return 0;
}

- (FitnessDailyMetric)getActivityStats
{
  retstr->var0 = 0;
  retstr->var1 = -1.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(void *)&retstr->var13 = -1LL;
  retstr->var15 = -1.0;
  *(void *)&retstr->var16 = 0LL;
  *(void *)((char *)&retstr->var17 + 1) = 0LL;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(void *)&retstr->var28 = 0LL;
  retstr->var30 = -1;
  return self;
}

@end