@interface IMDebugSyslogDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugSyslogDataProvider

- (id)debugData
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, a2);
  +[NSDateFormatter setDefaultFormatterBehavior:](&OBJC_CLASS___NSDateFormatter, "setDefaultFormatterBehavior:", 1040LL);
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"YYYY-MM-dd HH:mm:ss.SSS");
  v4 = asl_new(1u);
  v5 = asl_search(0LL, v4);
  asl_object_t v6 = asl_next(v5);
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = asl_get(v7, "Time");
      double v9 = (double)atol(v8);
      v10 = asl_get(v7, "TimeNanoSec");
      v11 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)atol(v10) / 1000000000.0 + v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v12));
      v14 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", asl_get(v7, "Message"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v2 appendString:v13];
      [v2 appendString:@" "];
      [v2 appendString:v15];
      [v2 appendString:@"\n"];

      v7 = asl_next(v5);
    }

    while (v7);
  }

  asl_release(v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v2 dataUsingEncoding:4]);

  return v16;
}

- (id)debugDataFileName
{
  return @"syslog.txt";
}

@end