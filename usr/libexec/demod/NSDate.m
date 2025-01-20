@interface NSDate
+ (id)dateFromString:(id)a3;
- (BOOL)isEarlierDateThan:(id)a3;
- (BOOL)isLaterDateThan:(id)a3;
- (id)endOfDay;
- (id)newDateByAddingOneDay;
- (id)newDateByAddingOneWeek;
- (id)startOfDay;
- (id)timeZoneFromISO8601DateString:(id)a3;
- (id)toString;
@end

@implementation NSDate

+ (id)dateFromString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v4, "dateFromString:", v3));

  return v5;
}

- (id)toString
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  if (-[NSDate isEqualToDate:](self, "isEqualToDate:", v4)) {
    goto LABEL_4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  unsigned __int8 v6 = -[NSDate isEqualToDate:](self, "isEqualToDate:", v5);

  if ((v6 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
    -[NSISO8601DateFormatter setTimeZone:](v3, "setTimeZone:", v4);
LABEL_4:
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v3, "stringFromDate:", self));

  return v7;
}

- (id)timeZoneFromISO8601DateString:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 length];
  v5 = v4 - 6;
  v7 = v4;
  if ([v3 characterAtIndex:v4 - 1] == 90)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
    goto LABEL_13;
  }

  unsigned int v8 = [v3 characterAtIndex:v5];
  if (v8 == 43)
  {
    uint64_t v9 = 1LL;
  }

  else
  {
    if (v8 != 45)
    {
LABEL_2:
      unsigned __int8 v6 = 0LL;
      goto LABEL_13;
    }

    uint64_t v9 = -1LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:v7 - 5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@":"]);

  if ([v11 count] == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
    id v13 = [v12 integerValue];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
    id v15 = [v14 integerValue];

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneForSecondsFromGMT:]( &OBJC_CLASS___NSTimeZone,  "timeZoneForSecondsFromGMT:",  (3600LL * (void)v13 + 60LL * (void)v15) * v9));
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

LABEL_13:
  return v6;
}

- (id)startOfDay
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 startOfDayForDate:self]);

  return v4;
}

- (id)endOfDay
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateBySettingHour:23 minute:59 second:59 ofDate:self options:0]);

  return v4;
}

- (id)newDateByAddingOneWeek
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingUnit:16 value:7 toDate:self options:0]);

  return v4;
}

- (id)newDateByAddingOneDay
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingUnit:16 value:1 toDate:self options:0]);

  return v4;
}

- (BOOL)isLaterDateThan:(id)a3
{
  id v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](self, "laterDate:", a3));
  LOBYTE(v3) = [v4 isEqualToDate:v3];

  return (char)v3;
}

- (BOOL)isEarlierDateThan:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](self, "laterDate:", v4));
  unsigned __int8 v6 = [v5 isEqualToDate:v4];

  return v6;
}

@end