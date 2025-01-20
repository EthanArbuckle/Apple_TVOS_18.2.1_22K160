@interface NSSQLiteIndexStatisticsRequest
+ (id)indexStatistics;
- (unint64_t)requestType;
@end

@implementation NSSQLiteIndexStatisticsRequest

+ (id)indexStatistics
{
  return objc_alloc_init((Class)a1);
}

- (unint64_t)requestType
{
  return 10LL;
}

@end