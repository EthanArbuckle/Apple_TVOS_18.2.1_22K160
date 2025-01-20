@interface MSDLogModel
+ (id)sharedInstance;
- (BOOL)enableLogToFile:(id)a3;
- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5;
- (MSDLogModel)init;
- (NSString)logFolderPath;
- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4;
- (void)logMessage:(int)a3 prefix:(id)a4 message:(id)a5;
- (void)setLoggingLevelToFile:(int)a3;
- (void)setLoggingLevelToStdout:(int)a3;
@end

@implementation MSDLogModel

+ (id)sharedInstance
{
  if (qword_10000C730 != -1) {
    dispatch_once(&qword_10000C730, &stru_100008348);
  }
  return (id)qword_10000C728;
}

- (MSDLogModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDLogModel;
  v2 = -[MSDLogModel init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_logFP = 0LL;
    logFolderPath = v2->_logFolderPath;
    v2->_logFolderPath = 0LL;

    *(void *)&v3->_loggingLevelToFile = 0x300000001LL;
    v5 = getprogname();
    os_log_t v6 = os_log_create("com.apple.MobileDemo", v5);
    osLog = v3->_osLog;
    v3->_osLog = v6;

    v8 = v3;
  }

  return v3;
}

- (void)setLoggingLevelToFile:(int)a3
{
  self->_loggingLevelToFile = a3;
}

- (void)setLoggingLevelToStdout:(int)a3
{
  self->_loggingLevelToStdout = a3;
}

- (void)logMessage:(int)a3 prefix:(id)a4 message:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = self;
  objc_sync_enter(v10);
  if (v10->_loggingLevelToFile <= a3)
  {
    context = objc_autoreleasePoolPush();
    v25[1] = (__uint64_t)&v30;
    v11 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v9,  &v30);
    v25[0] = 0LL;
    pthread_threadid_np(0LL, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v12 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss Z");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v24));
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%llx %d [%@] %@ %@\n",  v25[0],  getpid(),  v13,  v8,  v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    logFP = v10->_logFP;
    if (logFP)
    {
      fputs((const char *)[v15 UTF8String], logFP);
      fflush(v10->_logFP);
    }

    if (v10->_loggingLevelToStdout <= a3)
    {
      v22 = __stdoutp;
      v21 = (const char *)[v13 UTF8String];
      v18 = getprogname();
      id v19 = objc_claimAutoreleasedReturnValue([v8 substringToIndex:5]);
      fprintf( v22, "%s %s %s %s\n", v21, v18, (const char *)[v19 UTF8String], -[NSString UTF8String](v11, "UTF8String"));

      fflush(__stdoutp);
    }

    osLog = v10->_osLog;
    if (os_log_type_enabled(osLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v8;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, osLog, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(context);
  }

  objc_sync_exit(v10);
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByExpandingTildeInPath]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
  BOOL v9 = 0;
  if (([v5 fileExistsAtPath:v7] & 1) != 0
    || [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0])
  {
    objc_storeStrong((id *)&self->_logFolderPath, v7);
    id v8 = fopen((const char *)[v6 fileSystemRepresentation], "a");
    self->_logFP = v8;
    if (v8) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = sub_1000027A0;
  v29[4] = sub_1000027B0;
  id v30 = 0LL;
  char v28 = 97;
  if (([v10 fileExistsAtPath:v8] & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    if ((v12 & 1) == 0)
    {
      v17 = 0LL;
      id v19 = 0LL;
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
    id v19 = 0LL;
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_7;
  }

  [v10 removeItemAtPath:v13 error:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v16,  (double)a5 * -86400.0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contentsOfDirectoryAtPath:v8 error:0]);

  if (v19)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000027B8;
    v23[3] = &unk_100008370;
    id v24 = v8;
    id v25 = v17;
    id v27 = v29;
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
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v7, "components:fromDate:", 28LL, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@-%4ld%02ld%02ld.log",  v6,  v5,  [v10 year],  objc_msgSend(v10, "month"),  objc_msgSend(v10, "day")));

  return v11;
}

- (NSString)logFolderPath
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end