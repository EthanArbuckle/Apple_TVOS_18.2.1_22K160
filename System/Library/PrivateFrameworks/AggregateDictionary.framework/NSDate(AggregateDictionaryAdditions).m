@interface NSDate(AggregateDictionaryAdditions)
+ (time_t)daysSince1970;
+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions;
- (uint64_t)daysSince1970;
@end

@implementation NSDate(AggregateDictionaryAdditions)

+ (time_t)daysSince1970
{
  time_t result = time(0LL);
  if (result >= 0) {
    return (result / 0x15180uLL);
  }
  else {
    return result;
  }
}

+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions
{
  return [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)(86400 * a3)];
}

- (uint64_t)daysSince1970
{
  return (int)(v1 / 86400.0);
}

@end