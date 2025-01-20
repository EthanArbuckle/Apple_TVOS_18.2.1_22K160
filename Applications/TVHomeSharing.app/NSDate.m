@interface NSDate
+ (id)_tvh_abbreviatedDayOfWeekDateFormatter;
+ (id)_tvh_abbreviatedMonthDayDateFormatter;
+ (id)_tvh_abbreviatedMonthDayYearDateFormatter;
+ (id)_tvh_dateFormatterWithFormatTemplate:(id)a3;
+ (id)_tvh_dayOfWeekDateFormatter;
+ (id)_tvh_monthDayDateFormatter;
+ (id)_tvh_monthDayYearDateFormatter;
- (BOOL)_tvh_inSameYearAs:(id)a3;
- (BOOL)_tvh_isThisYear;
- (double)tvh_timeIntervalFromDate:(id)a3;
- (id)_tvh_dateWithDeltaDays:(int64_t)a3;
- (id)_tvh_friendlyDisplayStringWithAbbreviation:(BOOL)a3;
- (id)tvh_abbreviatedFriendlyDisplayString;
- (id)tvh_friendlyDisplayString;
@end

@implementation NSDate

- (id)tvh_friendlyDisplayString
{
  return -[NSDate _tvh_friendlyDisplayStringWithAbbreviation:](self, "_tvh_friendlyDisplayStringWithAbbreviation:", 0LL);
}

- (id)tvh_abbreviatedFriendlyDisplayString
{
  return -[NSDate _tvh_friendlyDisplayStringWithAbbreviation:](self, "_tvh_friendlyDisplayStringWithAbbreviation:", 1LL);
}

- (double)tvh_timeIntervalFromDate:(id)a3
{
  id v4 = a3;
  -[NSDate timeIntervalSince1970](self, "timeIntervalSince1970");
  double v6 = v5;
  [v4 timeIntervalSince1970];
  double v8 = v7;

  return v6 - v8;
}

- (id)_tvh_friendlyDisplayStringWithAbbreviation:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 startOfDayForDate:self]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 startOfDayForDate:v7]);

  if ([v6 isEqualToDate:v8])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"TODAY" value:0 table:0]);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_tvh_dateWithDeltaDays:", -7));
    if ([v6 compare:v11] == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _tvh_dayOfWeekDateFormatter](&OBJC_CLASS___NSDate, "_tvh_dayOfWeekDateFormatter"));
    }

    else if (objc_msgSend(v6, "_tvh_isThisYear"))
    {
      if (v3) {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate _tvh_abbreviatedMonthDayDateFormatter]( &OBJC_CLASS___NSDate,  "_tvh_abbreviatedMonthDayDateFormatter"));
      }
      else {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _tvh_monthDayDateFormatter](&OBJC_CLASS___NSDate, "_tvh_monthDayDateFormatter"));
      }
    }

    else if (v3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate _tvh_abbreviatedMonthDayYearDateFormatter]( &OBJC_CLASS___NSDate,  "_tvh_abbreviatedMonthDayYearDateFormatter"));
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _tvh_monthDayYearDateFormatter](&OBJC_CLASS___NSDate, "_tvh_monthDayYearDateFormatter"));
    }

    v9 = v12;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v12 stringFromDate:v6]);
  }

  return v10;
}

- (id)_tvh_dateWithDeltaDays:(int64_t)a3
{
  double v5 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v5, "setDay:", a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingComponents:v5 toDate:self options:0]);

  return v7;
}

- (BOOL)_tvh_isThisYear
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(self) = -[NSDate _tvh_inSameYearAs:](self, "_tvh_inSameYearAs:", v3);

  return (char)self;
}

- (BOOL)_tvh_inSameYearAs:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 components:4 fromDate:self]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 components:4 fromDate:v4]);

  id v8 = [v6 year];
  LOBYTE(v8) = v8 == [v7 year];

  return (char)v8;
}

+ (id)_tvh_dayOfWeekDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099D2C;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157660 != -1) {
    dispatch_once(&qword_100157660, block);
  }
  return (id)qword_100157658;
}

+ (id)_tvh_abbreviatedDayOfWeekDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099DD0;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157670 != -1) {
    dispatch_once(&qword_100157670, block);
  }
  return (id)qword_100157668;
}

+ (id)_tvh_monthDayDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099E74;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157680 != -1) {
    dispatch_once(&qword_100157680, block);
  }
  return (id)qword_100157678;
}

+ (id)_tvh_abbreviatedMonthDayDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099F18;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157690 != -1) {
    dispatch_once(&qword_100157690, block);
  }
  return (id)qword_100157688;
}

+ (id)_tvh_monthDayYearDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099FBC;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001576A0 != -1) {
    dispatch_once(&qword_1001576A0, block);
  }
  return (id)qword_100157698;
}

+ (id)_tvh_abbreviatedMonthDayYearDateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A060;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001576B0 != -1) {
    dispatch_once(&qword_1001576B0, block);
  }
  return (id)qword_1001576A8;
}

+ (id)_tvh_dateFormatterWithFormatTemplate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter dateFormatFromTemplate:options:locale:]( &OBJC_CLASS___NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  v3,  0LL,  v4));

  double v6 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", v5);
  -[NSDateFormatter setLocale:](v6, "setLocale:", v4);

  return v6;
}

@end