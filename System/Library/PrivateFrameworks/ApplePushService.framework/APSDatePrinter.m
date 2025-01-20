@interface APSDatePrinter
+ (id)dateStringFromDate:(id)a3;
+ (id)dateStringFromInterval:(double)a3;
@end

@implementation APSDatePrinter

+ (id)dateStringFromDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = sub_10001B6A4();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromDate:v3]);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v8 = v7;
    [v3 timeIntervalSinceReferenceDate];
    double v10 = v9;

    v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%.2f seconds ago)",  v6,  v8 - v10));
  }

  else
  {
    v11 = @"never";
  }

  return v11;
}

+ (id)dateStringFromInterval:(double)a3
{
  if (a3 == 0.0)
  {
    id v3 = @"never";
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    id v6 = sub_10001B6A4();
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringFromDate:v5]);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%.2f seconds ago)",  v8,  v9 - a3));
  }

  return v3;
}

@end