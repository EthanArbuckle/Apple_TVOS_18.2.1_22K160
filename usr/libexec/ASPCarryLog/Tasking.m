@interface Tasking
+ (void)startDpTaskingMonitorOnDispatchQ:(id)a3 andWorkDir:(id)a4;
- (BOOL)LoadTasking;
- (BOOL)evaluateTaskingCriteria:(id)a3 doWhiteListCheck:(BOOL)a4;
- (BOOL)isDeviceTasked;
- (BOOL)validate;
- (NSDate)dpTaskingExpireTime;
- (NSDictionary)myTaskingDict;
- (NSString)workDir;
- (StatsProvider)myStatsProvider;
- (Tasking)initWithWorkDir:(id)a3;
- (id)LoadFromPlist:(id)a3 forKey:(id)a4;
- (id)getTaskingCriteria;
- (id)getTaskingID;
- (int64_t)getTaskingDurationInSeconds;
- (int64_t)getTaskingSizeLimitInBytes;
- (void)setDpTaskingExpireTime:(id)a3;
- (void)setMyStatsProvider:(id)a3;
- (void)setMyTaskingDict:(id)a3;
- (void)setWorkDir:(id)a3;
- (void)tryLoadDPTasking;
@end

@implementation Tasking

- (Tasking)initWithWorkDir:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___Tasking;
  v6 = -[Tasking init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workDir, a3);
    myTaskingDict = v7->_myTaskingDict;
    v7->_myTaskingDict = 0LL;

    v9 = v7;
  }

  return v7;
}

+ (void)startDpTaskingMonitorOnDispatchQ:(id)a3 andWorkDir:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010A44;
  block[3] = &unk_10008C948;
  id v9 = a3;
  id v10 = a4;
  uint64_t v5 = qword_1000C4318;
  id v6 = v10;
  id v7 = v9;
  if (v5 != -1) {
    dispatch_once(&qword_1000C4318, block);
  }
}

- (void)tryLoadDPTasking
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking workDir](self, "workDir"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"dp_tasking_payload.plist"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v7 fileExistsAtPath:v5])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v6,  0LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"expire_time"]);
    if (v9
      && (id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now")),
          id v10 = [v9 compare:v2],
          v2,
          v10 == (id)1))
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));

      if (!v11)
      {
        v12 = (os_log_s *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Loading tasking payload from DP",  (uint8_t *)&v17,  2u);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"payload"]);
        -[Tasking setMyTaskingDict:](self, "setMyTaskingDict:", v13);
      }
    }

    else
    {
      v14 = (os_log_s *)(id)oslog;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v9)
        {
          id v15 = DateTimeToStr(v9);
          id v2 = objc_claimAutoreleasedReturnValue(v15);
          v16 = (const char *)[v2 UTF8String];
        }

        else
        {
          v16 = "N/A";
        }

        int v17 = 136315138;
        v18 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Deleting expired payload with expire date %s",  (uint8_t *)&v17,  0xCu);
        if (v9) {
      }
        }

      [v7 removeItemAtPath:v5 error:0];
    }
  }

  else
  {
    id v9 = 0LL;
    v8 = 0LL;
  }
}

- (BOOL)LoadTasking
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[Tasking LoadFromPlist:forKey:]( self,  "LoadFromPlist:forKey:",  @"com.apple.da",  @"ASPCarryLog_tasking"));
  if (v4) {
    -[Tasking LoadTaskingFromDict:](self, "LoadTaskingFromDict:", v4);
  }
  -[Tasking tryLoadDPTasking](self, "tryLoadDPTasking");
  uint64_t v5 = (os_log_s *)(id)oslog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[Tasking isDeviceTasked](self, "isDeviceTasked");
    if (v6)
    {
      id v2 = objc_claimAutoreleasedReturnValue(-[Tasking getTaskingID](self, "getTaskingID"));
      id v7 = (const char *)[v2 UTF8String];
    }

    else
    {
      id v7 = "None";
    }

    int v10 = 136315138;
    objc_super v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DA tasking info loaded. Tasking id: %s",  (uint8_t *)&v10,  0xCu);
    if (v6) {
  }
    }

  v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100043180(v8, self);
  }

  return 1;
}

- (id)LoadFromPlist:(id)a3 forKey:(id)a4
{
  v4 = (void *)CFPreferencesCopyValue((CFStringRef)a4, (CFStringRef)a3, @"mobile", kCFPreferencesCurrentHost);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)isDeviceTasked
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingID](self, "getTaskingID"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)getTaskingID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"TASKING_ID"]);

  if (!v4
    || ([v4 isEqualToString:&stru_10008DB08] & 1) != 0
    || -[Tasking getTaskingDurationInSeconds](self, "getTaskingDurationInSeconds") < 0)
  {
    id v5 = 0LL;
  }

  else
  {
    id v5 = v4;
  }

  return v5;
}

- (int64_t)getTaskingDurationInSeconds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TASKING_DURATION_SECONDS"]);
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (int64_t)getTaskingSizeLimitInBytes
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TASKING_SIZE_LIMIT_BYTES"]);
  id v4 = [v3 longLongValue];

  return (int64_t)v4;
}

- (id)getTaskingCriteria
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TASKING_CRITERIA"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v9 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    int v10 = v5;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0) {
      id v6 = v3;
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)validate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TASKING_CRITERIA_VERSION"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TASKING_SIZE_LIMIT_BYTES"]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"TASKING_ID"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingCriteria](self, "getTaskingCriteria"));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  BOOL v11 = (objc_opt_isKindOfClass(v4, v10) & 1) != 0 && (int)[v4 intValue] < 3;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
  BOOL v13 = (objc_opt_isKindOfClass(v6, v12) & 1) != 0 && (uint64_t)[v6 longLongValue] > 0;
  if (v8) {
    BOOL v14 = v9 == 0LL;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14 && v11;
  BOOL v16 = v15 && v13;

  return v16;
}

- (BOOL)evaluateTaskingCriteria:(id)a3 doWhiteListCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[Tasking validate](self, "validate"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingCriteria](self, "getTaskingCriteria"));
    id v8 = -[TaskingCriteriaRange initFromTaskingCrit:]( objc_alloc(&OBJC_CLASS___TaskingCriteriaRange),  "initFromTaskingCrit:",  v7);
    unsigned __int8 v9 = [v8 evaluateCriteriaUsingStatsProvider:v6 doWhiteListCheck:v4];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (StatsProvider)myStatsProvider
{
  return self->_myStatsProvider;
}

- (void)setMyStatsProvider:(id)a3
{
}

- (NSDictionary)myTaskingDict
{
  return self->_myTaskingDict;
}

- (void)setMyTaskingDict:(id)a3
{
}

- (NSDate)dpTaskingExpireTime
{
  return self->_dpTaskingExpireTime;
}

- (void)setDpTaskingExpireTime:(id)a3
{
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (void).cxx_destruct
{
}

@end