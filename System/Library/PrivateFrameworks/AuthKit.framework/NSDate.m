@interface NSDate
+ (id)_httpDateFormatter;
+ (id)ak_dateFromPasskeyVerificationDateString:(id)a3;
+ (id)ak_expiryDateFromServerDate:(id)a3 localDate:(id)a4 ttl:(double)a5;
@end

@implementation NSDate

+ (id)ak_expiryDateFromServerDate:(id)a3 localDate:(id)a4 ttl:(double)a5
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dateByAddingTimeInterval:a5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:a5]);

  if ([v9 compare:v8] == (id)-1) {
    v10 = v9;
  }
  else {
    v10 = v8;
  }
  id v11 = v10;

  return v11;
}

+ (id)ak_dateFromPasskeyVerificationDateString:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _httpDateFormatter]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromString:v4]);

  return v6;
}

+ (id)_httpDateFormatter
{
  v2 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"EEEE, dd LLL yyyy HH:mm:ss zzz");
  -[NSDateFormatter setLocale:](v3, "setLocale:", v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSDateFormatter setTimeZone:](v3, "setTimeZone:", v4);

  return v3;
}

@end