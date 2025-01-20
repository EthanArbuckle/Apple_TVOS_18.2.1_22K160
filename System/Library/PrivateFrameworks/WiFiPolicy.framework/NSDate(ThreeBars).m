@interface NSDate(ThreeBars)
- (id)dateByAddingDays:()ThreeBars;
@end

@implementation NSDate(ThreeBars)

- (id)dateByAddingDays:()ThreeBars
{
  v5 = (void *)MEMORY[0x1895BA820]();
  [MEMORY[0x189603F38] currentCalendar];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 components:28 fromDate:a1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dateFromComponents:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = objc_alloc_init(MEMORY[0x189603F58]);
  [v9 setDay:a3];
  [v6 dateByAddingComponents:v9 toDate:v8 options:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v10;
}

@end