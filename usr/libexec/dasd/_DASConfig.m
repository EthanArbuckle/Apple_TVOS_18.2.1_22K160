@interface _DASConfig
+ (BOOL)computeHasDeviceRecentlyUpdated;
+ (BOOL)hasRecentlyUpdated;
+ (BOOL)isAudioAccessory;
+ (BOOL)isInternalBuild;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)requiresStrictDarkBoot;
+ (void)initialize;
@end

@implementation _DASConfig

+ (void)initialize
{
  v3 = objc_autoreleasePoolPush();
  byte_100157C20 = os_variant_has_internal_content("com.apple.dasd");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
  v7 = (void *)qword_100157C28;
  qword_100157C28 = (uint64_t)v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100074648;
  handler[3] = &unk_100114FE0;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100157C28, handler);
  v8 = (dispatch_source_s *)qword_100157C28;
  dispatch_time_t v9 = dispatch_walltime(0LL, 43200000000000LL);
  dispatch_source_set_timer(v8, v9, 0x274A48A78000uLL, 0xD18C2E2800uLL);
  dispatch_activate((dispatch_object_t)qword_100157C28);
  byte_100157C30 = [(id)objc_opt_class(a1) computeHasDeviceRecentlyUpdated];
  objc_autoreleasePoolPop(v3);
}

+ (BOOL)isInternalBuild
{
  return byte_100157C20;
}

+ (BOOL)hasRecentlyUpdated
{
  return byte_100157C30;
}

+ (BOOL)computeHasDeviceRecentlyUpdated
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  free(v14);
  v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v4, "stringForKey:", @"savedBuildVersion"));
  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v5
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v5, "length") - 1)),
        unsigned int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    -[NSUserDefaults doubleForKey:](v4, "doubleForKey:", @"savedBuildDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v6 timeIntervalSinceDate:v10];
    BOOL v2 = v11 < 604800.0;
  }

  else
  {
    -[NSUserDefaults setObject:forKey:](v4, "setObject:forKey:", v3, @"savedBuildVersion");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[NSUserDefaults setDouble:forKey:](v4, "setDouble:forKey:", @"savedBuildDate");
    BOOL v2 = 1;
  }

  return v2;
}

+ (BOOL)isAudioAccessory
{
  if (qword_100157C38 != -1) {
    dispatch_once(&qword_100157C38, &stru_100116C08);
  }
  return byte_100157C31;
}

+ (BOOL)isiPad
{
  return 0;
}

+ (BOOL)isiPhone
{
  return 0;
}

+ (BOOL)requiresStrictDarkBoot
{
  return 0;
}

@end