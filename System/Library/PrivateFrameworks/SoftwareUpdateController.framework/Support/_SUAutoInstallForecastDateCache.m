@interface _SUAutoInstallForecastDateCache
- (NSCalendar)calendar;
- (_SUAutoInstallForecastDateCache)initWithForecast:(id)a3;
- (id)description;
@end

@implementation _SUAutoInstallForecastDateCache

- (_SUAutoInstallForecastDateCache)initWithForecast:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____SUAutoInstallForecastDateCache;
  v6 = -[_SUAutoInstallForecastDateCache init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_forecast, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](&OBJC_CLASS___NSCalendar, "autoupdatingCurrentCalendar"));
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    v10 = v7->_calendar;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    -[NSCalendar setTimeZone:](v10, "setTimeZone:", v11);
  }

  return v7;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[<_SUAutoInstallForecastDateCache:%p> ",  self));
  -[NSMutableString appendString:](v3, "appendString:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSDateFormatterCache sharedInstance](&OBJC_CLASS___BSDateFormatterCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](self->_forecast, "suStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 formatDateAsLongYMDHMSZPosixLocaleWithDate:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"startDate=%@, ", v7));
  -[NSMutableString appendString:](v3, "appendString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSDateFormatterCache sharedInstance](&OBJC_CLASS___BSDateFormatterCache, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](self->_forecast, "suEndDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 formatDateAsLongYMDHMSZPosixLocaleWithDate:v10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"endDate=%@, ", v11));
  -[NSMutableString appendString:](v3, "appendString:", v12);

  -[NSMutableString appendString:](v3, "appendString:", @"]");
  return v3;
}

- (void).cxx_destruct
{
}

@end