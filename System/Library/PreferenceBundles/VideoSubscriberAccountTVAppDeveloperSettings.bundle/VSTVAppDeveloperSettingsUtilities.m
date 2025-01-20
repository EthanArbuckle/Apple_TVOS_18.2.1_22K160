@interface VSTVAppDeveloperSettingsUtilities
+ (id)stringFromDate:(id)a3;
@end

@implementation VSTVAppDeveloperSettingsUtilities

+ (id)stringFromDate:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"YYYY-MM-dd HH:mm:ss");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v3));

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_8370;
  }
  v8 = v7;

  return v8;
}

@end