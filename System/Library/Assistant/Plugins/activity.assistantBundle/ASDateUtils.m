@interface ASDateUtils
+ (id)eventEndDateFromDate:(id)a3;
+ (id)eventStartDateFromDate:(id)a3;
+ (id)predicateForEventsWithDateRangeFromDate:(id)a3 toDate:(id)a4;
+ (id)subtractDays:(int64_t)a3 fromDate:(id)a4;
@end

@implementation ASDateUtils

+ (id)eventStartDateFromDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  v6 = v5;

  return v6;
}

+ (id)eventEndDateFromDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  v6 = v5;

  return v6;
}

+ (id)predicateForEventsWithDateRangeFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v5 | v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
    v7 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_15;
  }

  v7 = (void *)v6;
  if (!v5)
  {
    v9 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]";
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%s No start date specified. Defaulting to [NSDate distantPast]",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }

  if (!v6)
  {
LABEL_9:
    v10 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]";
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%s No end date specified. Defaulting to [NSDate distantFuture]",  (uint8_t *)&v12,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  }

+ (id)subtractDays:(int64_t)a3 fromDate:(id)a4
{
  id v5 = a4;
  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v6, "setDay:", -a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingComponents:v6 toDate:v5 options:0]);

  return v8;
}

@end