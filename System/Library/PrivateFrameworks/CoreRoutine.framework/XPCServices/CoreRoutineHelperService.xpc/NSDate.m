@interface NSDate
+ (NSDate)dateWithHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5;
+ (NSDate)dateWithResolution:(unint64_t)a3;
+ (NSDate)dateWithResolution:(unint64_t)a3 calendar:(id)a4;
+ (id)dateBisectingDate1:(id)a3 date2:(id)a4;
+ (id)dateFormatter;
+ (id)endOfDay;
+ (id)roundingUpDate:(id)a3 bucketDurationMinute:(int)a4;
+ (id)startOfDay;
+ (id)stringFromTimestamp:(double)a3;
- (BOOL)betweenDate:(id)a3 andDate:(id)a4;
- (BOOL)isAfterDate:(id)a3;
- (BOOL)isBeforeDate:(id)a3;
- (BOOL)isOnOrAfter:(id)a3;
- (BOOL)isOnOrBefore:(id)a3;
- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)dateByRoundingWithTimeQuantization:(int64_t)a3;
- (id)dateReducedToResolution:(unint64_t)a3;
- (id)dateReducedToResolution:(unint64_t)a3 calendar:(id)a4;
- (id)endOfDay;
- (id)getFormattedDateString;
- (id)startOfDay;
- (id)stringFromDate;
- (id)weekdayStringFromDate;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)weekday;
@end

@implementation NSDate

- (BOOL)betweenDate:(id)a3 andDate:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    [a3 timeIntervalSinceReferenceDate];
    double v9 = v8;
    -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
    double v11 = v10;
    [v7 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v9 <= v13)
    {
      BOOL v14 = v9 <= v11;
      BOOL v15 = v11 > v13;
    }

    else
    {
      BOOL v14 = v13 <= v11;
      BOOL v15 = v11 > v9;
    }

    return !v15 && v14;
  }

  return result;
}

- (BOOL)isBeforeDate:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) == NSOrderedAscending;
}

- (BOOL)isOnOrBefore:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) != (id)1;
}

- (BOOL)isAfterDate:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) == (id)1;
}

- (BOOL)isOnOrAfter:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) != NSOrderedAscending;
}

+ (id)startOfDay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 date]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 startOfDay]);

  return v3;
}

- (id)startOfDay
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 components:28 fromDate:self]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromComponents:v4]);

  return v6;
}

+ (id)endOfDay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 date]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 endOfDay]);

  return v3;
}

- (id)endOfDay
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 components:28 fromDate:self]);

  [v4 setHour:23];
  [v4 setMinute:59];
  [v4 setSecond:59];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromComponents:v4]);

  return v6;
}

- (unint64_t)hour
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v4 = [v3 component:32 fromDate:self];

  return (unint64_t)v4;
}

- (unint64_t)minute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v4 = [v3 component:64 fromDate:self];

  return (unint64_t)v4;
}

- (unint64_t)weekday
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  LOBYTE(self) = [v3 component:512 fromDate:self];

  return 1 << ((_BYTE)self - 1);
}

- (id)weekdayStringFromDate
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"EEEE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  -[NSDateFormatter setLocale:](v3, "setLocale:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", self));
  return v5;
}

- (id)stringFromDate
{
  uint64_t v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateFormatter](&OBJC_CLASS___NSDate, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromDate:self]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f (%@)", v4, v6));

  return v7;
}

- (id)getFormattedDateString
{
  if (self)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy/MM/dd HH:mm:ss.SSS");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
    -[NSDateFormatter setTimeZone:](v3, "setTimeZone:", v4);

    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", self));
  }

  else
  {
    v5 = @"-";
  }

  return v5;
}

+ (id)stringFromTimestamp:(double)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringFromDate]);

  return v4;
}

+ (id)dateFormatter
{
  if (qword_10002D1F0 != -1) {
    dispatch_once(&qword_10002D1F0, &stru_100024650);
  }
  return (id)qword_10002D1E8;
}

+ (NSDate)dateWithResolution:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dateReducedToResolution:a3 calendar:v5]);

  return (NSDate *)v6;
}

+ (NSDate)dateWithResolution:(unint64_t)a3 calendar:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateReducedToResolution:a3 calendar:v5]);

  return (NSDate *)v7;
}

- (id)dateReducedToResolution:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateReducedToResolution:calendar:](self, "dateReducedToResolution:calendar:", a3, v5));

  return v6;
}

- (id)dateReducedToResolution:(unint64_t)a3 calendar:(id)a4
{
  id v6 = a4;
  if (a3 >= 7)
  {
    id v8 = sub_10000B294(&qword_10002D0A0);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218498;
      unint64_t v14 = a3;
      __int16 v15 = 2080;
      v16 = "-[NSDate(RTExtensions) dateReducedToResolution:calendar:]";
      __int16 v17 = 1024;
      int v18 = 180;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unhandled resolution, %lu (in %s:%d)",  (uint8_t *)&v13,  0x1Cu);
    }

    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = qword_1000198E8[a3];
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 components:v7 fromDate:self]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dateFromComponents:v10]);

  return v11;
}

- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingUnit:a3 value:a4 toDate:self options:0]);

  return v8;
}

- (id)dateByRoundingWithTimeQuantization:(int64_t)a3
{
  uint64_t v3 = self;
  if (self)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 components:96 fromDate:v3]);

    uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSDate dateByAddingTimeInterval:]( v3,  "dateByAddingTimeInterval:",  (double)((uint64_t)[v6 minute] % a3) * -60.0));
  }

  return v3;
}

+ (NSDate)dateWithHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 components:28 fromDate:v9]);

  [v10 setHour:a3];
  [v10 setMinute:a4];
  [v10 setSecond:a5];
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dateFromComponents:v10]);

  return (NSDate *)v11;
}

+ (id)dateBisectingDate1:(id)a3 date2:(id)a4
{
  id v5 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (v7 + v9) * 0.5);
}

+ (id)roundingUpDate:(id)a3 bucketDurationMinute:(int)a4
{
  id v5 = a3;
  if (a4 <= 0)
  {
    id v6 = sub_10000B294(&qword_10002D0A0);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 67109634;
      v16[1] = a4;
      __int16 v17 = 2080;
      int v18 = "+[NSDate(RTExtensions) roundingUpDate:bucketDurationMinute:]";
      __int16 v19 = 1024;
      int v20 = 226;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "bucketDurationMinute should be greater than 0, %d (in %s:%d)",  (uint8_t *)v16,  0x18u);
    }
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 components:2097404 fromDate:v5]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 components:2097276 fromDate:v5]);

  float v12 = ceil(((float)(uint64_t)[v9 second] / 60.0 + (float)(uint64_t)objc_msgSend(v9, "minute")) / (double)a4);
  [v11 setMinute:(uint64_t)(float)((float)a4 * v12)];
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateFromComponents:v11]);

  return v14;
}

@end