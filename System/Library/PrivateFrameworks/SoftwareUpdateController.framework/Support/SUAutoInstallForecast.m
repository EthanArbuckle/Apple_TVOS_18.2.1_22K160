@interface SUAutoInstallForecast
+ (BOOL)alarmSetBeforeDate:(id)a3;
- (BOOL)_isDateExpired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)suEndDate;
- (NSDate)suStartDate;
- (SUAutoInstallForecast)init;
- (id)_calendar;
- (id)_dateNameUsingComponents:(id)a3;
- (id)_forecastDateCache;
- (id)dateAtTime:(id)a3 atHour:(int64_t)a4 atMinute:(int64_t)a5 tomorrow:(BOOL)a6;
- (id)description;
- (id)suWindowName;
- (void)computeStartEndDate:(int64_t)a3 beginAtMinute:(int64_t)a4 endAtHour:(int64_t)a5 endAtMinute:(int64_t)a6;
- (void)computeStartEndDelta:(int64_t)a3 beginAtMinute:(int64_t)a4 endAtHour:(int64_t)a5 endAtMinute:(int64_t)a6;
- (void)provideSUStartEndDates:(id)a3 endingAt:(id)a4;
- (void)setSuEndDate:(id)a3;
- (void)setSuStartDate:(id)a3;
@end

@implementation SUAutoInstallForecast

- (SUAutoInstallForecast)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUAutoInstallForecast;
  v2 = -[SUAutoInstallForecast init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    suStartDate = v2->_suStartDate;
    v2->_suStartDate = 0LL;

    suEndDate = v3->_suEndDate;
    v3->_suEndDate = 0LL;

    lazy_forecastDateCache = v3->_lazy_forecastDateCache;
    v3->_lazy_forecastDateCache = 0LL;
  }

  return v3;
}

+ (BOOL)alarmSetBeforeDate:(id)a3
{
  v3 = (const __CFDate *)a3;
  if (v3 && (CFArrayRef v4 = IOPMCopyScheduledPowerEvents()) != 0LL)
  {
    v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFArrayGetTypeID())
    {
      if (CFArrayGetCount(v5) < 1)
      {
        char v8 = 0;
      }

      else
      {
        CFIndex v7 = 0LL;
        char v8 = 0;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v7);
          if (ValueAtIndex)
          {
            v10 = ValueAtIndex;
            CFTypeID v11 = CFGetTypeID(ValueAtIndex);
            if (v11 == CFDictionaryGetTypeID())
            {
              Value = (const __CFBoolean *)CFDictionaryGetValue(v10, @"UserVisible");
              if (Value)
              {
                v13 = Value;
                CFTypeID v14 = CFGetTypeID(Value);
                if (v14 == CFBooleanGetTypeID() && v13 == kCFBooleanTrue)
                {
                  v15 = (const __CFDate *)CFDictionaryGetValue(v10, @"time");
                  if (v15)
                  {
                    v16 = v15;
                    CFTypeID v17 = CFGetTypeID(v15);
                    if (v17 == CFDateGetTypeID() && CFDateCompare(v16, v3, 0LL) == kCFCompareLessThan)
                    {
                      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"scheduled at time %@",  v16));
                      v19 = CFDictionaryGetValue(v10, @"scheduledby");
                      if (v19)
                      {
                        uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 stringByAppendingFormat:@" (Event name: %@)", v19]);

                        v18 = (void *)v20;
                      }

                      v21 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerLogger sharedLogger]( &OBJC_CLASS___SUControllerLogger,  "sharedLogger"));
                      char v8 = 1;
                      [v21 logAtLevel:1, "+[SUAutoInstallForecast alarmSetBeforeDate:]", @"Wake Event %@", v18 label format];
                    }
                  }
                }
              }
            }
          }

          ++v7;
        }

        while (CFArrayGetCount(v5) > v7);
      }

      BOOL v22 = v8 & 1;
    }

    else
    {
      BOOL v22 = 0;
    }

    CFRelease(v5);
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)computeStartEndDelta:(int64_t)a3 beginAtMinute:(int64_t)a4 endAtHour:(int64_t)a5 endAtMinute:(int64_t)a6
{
  int64_t v7 = 3600 * a5 + 60 * a6;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(3600 * a3 + 60 * a4)));
  char v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v7));
  -[SUAutoInstallForecast setSuStartDate:](self, "setSuStartDate:", v11);
  -[SUAutoInstallForecast setSuEndDate:](self, "setSuEndDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suWindowName](self, "suWindowName"));
  [v9 logAtLevel:1, "-[SUAutoInstallForecast computeStartEndDelta:beginAtMinute:endAtHour:endAtMinute:]", @"computed Software Update window: %@", v10 label format];
}

- (void)computeStartEndDate:(int64_t)a3 beginAtMinute:(int64_t)a4 endAtHour:(int64_t)a5 endAtMinute:(int64_t)a6
{
  int64_t v11 = a4 + 60 * a3;
  int64_t v12 = a6 + 60 * a5;
  id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SUAutoInstallForecast dateAtTime:atHour:atMinute:tomorrow:]( self,  "dateAtTime:atHour:atMinute:tomorrow:",  v25,  a3,  a4,  0LL));
  CFTypeID v14 = (void *)objc_claimAutoreleasedReturnValue( -[SUAutoInstallForecast dateAtTime:atHour:atMinute:tomorrow:]( self,  "dateAtTime:atHour:atMinute:tomorrow:",  v25,  a5,  a6,  0LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[SUAutoInstallForecast dateAtTime:atHour:atMinute:tomorrow:]( self,  "dateAtTime:atHour:atMinute:tomorrow:",  v25,  a3,  a4,  1LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[SUAutoInstallForecast dateAtTime:atHour:atMinute:tomorrow:]( self,  "dateAtTime:atHour:atMinute:tomorrow:",  v25,  a5,  a6,  1LL));
  if (v11 <= v12)
  {
    id v21 = [v25 compare:v13];
    id v18 = v13;
    v19 = v14;
    if (v21 != (id)-1LL)
    {
      BOOL v22 = (char *)[v25 compare:v14] + 1 == 0;
      if (v22) {
        id v18 = v25;
      }
      else {
        id v18 = v15;
      }
      if (v22) {
        v19 = v14;
      }
      else {
        v19 = v16;
      }
    }
  }

  else
  {
    id v17 = [v25 compare:v14];
    id v18 = v25;
    v19 = v14;
    if (v17 != (id)-1LL)
    {
      id v20 = [v25 compare:v13];
      id v18 = v25;
      v19 = v16;
      if (v20)
      {
        if ([v25 compare:v13] == (id)1) {
          id v18 = v25;
        }
        else {
          id v18 = v13;
        }
        v19 = v16;
      }
    }
  }

  -[SUAutoInstallForecast setSuStartDate:](self, "setSuStartDate:", v18);
  -[SUAutoInstallForecast setSuEndDate:](self, "setSuEndDate:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suWindowName](self, "suWindowName"));
  [v23 logAtLevel:1, "-[SUAutoInstallForecast computeStartEndDate:beginAtMinute:endAtHour:endAtMinute:]", @"computed Software Update window: %@", v24 label format];
}

- (id)dateAtTime:(id)a3 atHour:(int64_t)a4 atMinute:(int64_t)a5 tomorrow:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  int64_t v11 = v10;
  if (v6)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 dateByAddingUnit:32 value:24 toDate:v9 options:0]);

    id v9 = (id)v12;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 components:252 fromDate:v9]);
  [v13 setHour:a4];
  [v13 setMinute:a5];
  [v13 setSecond:0];
  CFTypeID v14 = (void *)objc_claimAutoreleasedReturnValue([v11 dateFromComponents:v13]);

  return v14;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](self, "suStartDate"));
  CFArrayRef v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](self, "suEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AutoInstallForecast <%p> :\nsuStart = %@\nsuEnd = %@\n",  self,  v3,  v4));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CFArrayRef v4 = (SUAutoInstallForecast *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
    {
      BOOL v6 = v4;
      int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](self, "suStartDate"));
      char v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](v6, "suStartDate"));
      if ([v7 isEqualToDate:v8])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](self, "suEndDate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](v6, "suEndDate"));
        unsigned __int8 v11 = [v9 isEqualToDate:v10];
      }

      else
      {
        unsigned __int8 v11 = 0;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)suWindowName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](self, "suStartDate"));
  CFArrayRef v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast _dateNameUsingComponents:](self, "_dateNameUsingComponents:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](self, "suEndDate"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast _dateNameUsingComponents:](self, "_dateNameUsingComponents:", v5));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ <-> %@]",  v4,  v6));

  return v7;
}

- (void)provideSUStartEndDates:(id)a3 endingAt:(id)a4
{
  id v6 = a4;
  -[SUAutoInstallForecast setSuStartDate:](self, "setSuStartDate:", a3);
  -[SUAutoInstallForecast setSuEndDate:](self, "setSuEndDate:", v6);
}

- (id)_dateNameUsingComponents:(id)a3
{
  id v3 = a3;
  CFArrayRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 components:252 fromDate:v3]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%02d/%02d/%04d %02d:%02d:%02d",  [v5 month],  objc_msgSend(v5, "day"),  objc_msgSend(v5, "year"),  objc_msgSend(v5, "hour"),  objc_msgSend(v5, "minute"),  objc_msgSend(v5, "second")));
  return v6;
}

- (id)_calendar
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast _forecastDateCache](self, "_forecastDateCache"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 calendar]);

  return v3;
}

- (id)_forecastDateCache
{
  lazy_forecastDateCache = self->_lazy_forecastDateCache;
  if (!lazy_forecastDateCache)
  {
    CFArrayRef v4 = -[_SUAutoInstallForecastDateCache initWithForecast:]( objc_alloc(&OBJC_CLASS____SUAutoInstallForecastDateCache),  "initWithForecast:",  self);
    uint64_t v5 = self->_lazy_forecastDateCache;
    self->_lazy_forecastDateCache = v4;

    lazy_forecastDateCache = self->_lazy_forecastDateCache;
  }

  return lazy_forecastDateCache;
}

- (BOOL)_isDateExpired:(id)a3
{
  id v3 = a3;
  CFArrayRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 laterDate:v4]);

  return v5 == v4;
}

- (NSDate)suStartDate
{
  return self->_suStartDate;
}

- (void)setSuStartDate:(id)a3
{
}

- (NSDate)suEndDate
{
  return self->_suEndDate;
}

- (void)setSuEndDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end