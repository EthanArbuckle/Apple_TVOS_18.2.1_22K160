@interface UALoggingAdvertiser
- (BOOL)active;
- (BOOL)resume;
- (BOOL)shouldLog:(int)a3;
- (BOOL)suspend;
- (NSFileHandle)outputFile;
- (NSString)logFileDirectoryPath;
- (NSString)logFilePath;
- (UALoggingAdvertiser)initWithManager:(id)a3;
- (id)advertisableItems;
- (id)statusString;
- (void)log:(int)a3 format:(id)a4;
- (void)log:(int)a3 format:(id)a4 args:(char *)a5;
- (void)logItem:(id)a3;
- (void)setAdvertisableItems:(id)a3;
- (void)setLogFileDirectoryPath:(id)a3;
- (void)setLogFilePath:(id)a3;
- (void)setOutputFile:(id)a3;
@end

@implementation UALoggingAdvertiser

- (UALoggingAdvertiser)initWithManager:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UALoggingAdvertiser;
  v3 = -[UAAdvertiser initWithManager:name:](&v18, "initWithManager:name:", a3, @"Logging");
  if (v3)
  {
    v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v5)
    {
      if ([v5 count])
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
          v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Logs/Handoff/",  v8));
          -[UALoggingAdvertiser setLogFileDirectoryPath:](v3, "setLogFileDirectoryPath:", v9);

          v10 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFileDirectoryPath](v3, "logFileDirectoryPath"));
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/UALoggingAdvertiserItems.log",  v10));
          -[UALoggingAdvertiser setLogFilePath:](v3, "setLogFilePath:", v11);
        }
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFilePath](v3, "logFilePath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v12));
    -[UALoggingAdvertiser setOutputFile:](v3, "setOutputFile:", v13);

    id v14 = objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFilePath](v3, "logFilePath"));
    uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 770, 420);

    if ((_DWORD)v15)
    {
      v16 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v15,  1LL);
      -[UALoggingAdvertiser setOutputFile:](v3, "setOutputFile:", v16);
    }
  }

  return v3;
}

- (id)advertisableItems
{
  return 0LL;
}

- (void)setAdvertisableItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"["));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:buf count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activityType]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
        [v5 appendFormat:@"(%@, %@)", v12, v14, (void)v19];
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:buf count:16];
    }

    while (v8);
  }

  [v5 appendString:@"]"];
  id v15 = [v5 copy];

  os_log_t v16 = sub_100039584(0LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "AdvertisableItems:%{private}@", buf, 0xCu);
  }

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Advertisable:%@",  v15));
  -[UALoggingAdvertiser log:format:](self, "log:format:", 5LL, @"%@", v18);
}

- (void)logItem:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003B288;
  v5[3] = &unk_1000BCC30;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 requestPayloadWithCompletionHandler:v5];
}

- (id)statusString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFilePath](self, "logFilePath"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFilePath](self, "logFilePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ActivityLogger: Logging to %@.\n",  v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser logFilePath](self, "logFilePath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    unsigned __int8 v4 = [v3 loggingAdvertiserEnabled];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)resume
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UALoggingAdvertiser;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v5, "resume");
  if (v3) {
    -[UALoggingAdvertiser log:format:](self, "log:format:", 5LL, @"UALoggingAdvertiser: ADVERTISING RESUMED.");
  }
  return v3;
}

- (BOOL)suspend
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UALoggingAdvertiser;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v5, "suspend");
  if (v3) {
    -[UALoggingAdvertiser log:format:](self, "log:format:", 5LL, @"UALoggingAdvertiser: ADVERTISING SUSPENDED.");
  }
  return v3;
}

- (BOOL)shouldLog:(int)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser outputFile](self, "outputFile"));

  return a3 < 7 && v4 != 0LL;
}

- (void)log:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v8)
  {
    if (a5)
    {
      id v14 = v8;
      unsigned int v9 = -[UALoggingAdvertiser shouldLog:](self, "shouldLog:", v6);
      id v8 = v14;
      if (v9)
      {
        v10 = objc_autoreleasePoolPush();
        v11 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v14,  a5);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UALoggingAdvertiser outputFile](self, "outputFile"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v11, "dataUsingEncoding:", 4LL));
        [v12 writeData:v13];

        objc_autoreleasePoolPop(v10);
        id v8 = v14;
      }
    }
  }
}

- (void)log:(int)a3 format:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6 && -[UALoggingAdvertiser shouldLog:](self, "shouldLog:", v4)) {
    -[UALoggingAdvertiser log:format:args:](self, "log:format:args:", v4, v6, &v7);
  }
}

- (NSFileHandle)outputFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 49LL, 1);
}

- (void)setOutputFile:(id)a3
{
}

- (NSString)logFileDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 57LL, 1);
}

- (void)setLogFileDirectoryPath:(id)a3
{
}

- (NSString)logFilePath
{
  return (NSString *)objc_getProperty(self, a2, 65LL, 1);
}

- (void)setLogFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end