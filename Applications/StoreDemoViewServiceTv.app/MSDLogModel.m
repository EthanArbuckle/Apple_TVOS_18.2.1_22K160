@interface MSDLogModel
+ (id)sharedInstance;
- (BOOL)enableLogToFile:(id)a3;
- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5;
- (__sFILE)logFP;
- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4;
- (void)logMessage:(id)a3;
- (void)logWithFormat:(id)a3 andArgs:(char *)a4;
- (void)setLogFP:(__sFILE *)a3;
@end

@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_1000122C0 != -1) {
    dispatch_once(&qword_1000122C0, &stru_10000C3C0);
  }
  return (id)qword_1000122B8;
}

- (void)logWithFormat:(id)a3 andArgs:(char *)a4
{
  id v6 = a3;
  v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

  -[MSDLogModel logMessage:](self, "logMessage:", v7);
}

- (void)logMessage:(id)a3
{
  id v9 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"dd-MM-yyyy HH:mm:ss:SSS");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@\n", v6, v9));
  if (-[MSDLogModel logFP](self, "logFP"))
  {
    v8 = self;
    objc_sync_enter(v8);
    fputs((const char *)[v7 UTF8String], -[MSDLogModel logFP](v8, "logFP"));
    fflush(-[MSDLogModel logFP](v8, "logFP"));
    objc_sync_exit(v8);
  }
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByExpandingTildeInPath]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
  BOOL v8 = 0;
  if (([v5 fileExistsAtPath:v7] & 1) != 0
    || [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0])
  {
    -[MSDLogModel setLogFP:]( self, "setLogFP:", fopen((const char *)[v6 fileSystemRepresentation], "a"));
    if (-[MSDLogModel logFP](self, "logFP")) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = sub_100004000;
  v29[4] = sub_100004010;
  id v30 = 0LL;
  char v28 = 97;
  if (([v10 fileExistsAtPath:v8] & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    if ((v12 & 1) == 0)
    {
      v17 = 0LL;
      v19 = 0LL;
      v13 = 0LL;
      goto LABEL_10;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"testWritability.log"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v28, 1LL));
  unsigned int v15 = [v10 createFileAtPath:v13 contents:v14 attributes:0];

  if (!v15)
  {
    v17 = 0LL;
    v19 = 0LL;
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_7;
  }

  [v10 removeItemAtPath:v13 error:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v16,  (double)a5 * -86400.0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contentsOfDirectoryAtPath:v8 error:0]);

  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100004018;
    v23[3] = &unk_10000C3E8;
    id v24 = v8;
    id v25 = v17;
    v27 = v29;
    id v26 = v10;
    [v19 enumerateObjectsUsingBlock:v23];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLogModel fileNameForTodayUnder:prefix:](self, "fileNameForTodayUnder:prefix:", v8, v9));
  BOOL v21 = -[MSDLogModel enableLogToFile:](self, "enableLogToFile:", v20);

LABEL_7:
  _Block_object_dispose(v29, 8);

  return v21;
}

- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  -[NSCalendar setLocale:](v7, "setLocale:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v7, "components:fromDate:", 28LL, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@-%4ld%02ld%02ld.log",  v6,  v5,  [v10 year],  objc_msgSend(v10, "month"),  objc_msgSend(v10, "day")));

  return v11;
}

- (__sFILE)logFP
{
  return self->_logFP;
}

- (void)setLogFP:(__sFILE *)a3
{
  self->_logFP = a3;
}

@end