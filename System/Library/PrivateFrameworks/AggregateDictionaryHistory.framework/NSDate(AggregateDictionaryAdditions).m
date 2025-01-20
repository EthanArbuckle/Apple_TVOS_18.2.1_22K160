@interface NSDate(AggregateDictionaryAdditions)
+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions;
+ (uint64_t)daysSince1970;
@end

@implementation NSDate(AggregateDictionaryAdditions)

+ (uint64_t)daysSince1970
{
  return ((int)time(0LL) / 86400);
}

+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions
{
  return [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)(86400 * a3)];
}

@end