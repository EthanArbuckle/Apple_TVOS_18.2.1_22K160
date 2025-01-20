@interface TVSettingsDiagnosticLogsFacade
+ (BOOL)filePathIsPowerLog:(id)a3;
+ (BOOL)filePathIsSysdiagnose:(id)a3;
+ (id)listedExtensions;
+ (id)tableNamesForPowerLog:(id)a3;
+ (id)textForContentsOfLog:(id)a3;
+ (id)textForTableName:(id)a3 inPowerLog:(id)a4;
- (BOOL)deleteLogFileAtPath:(id)a3;
- (NSArray)logFilePaths;
- (OS_dispatch_queue_serial)workQueue;
- (TVSettingsDiagnosticLogsFacade)init;
- (id)loadLogFilePaths;
- (void)_loadLogs;
- (void)_triggerLogCopy;
- (void)_workQueue_loadLogs;
- (void)loadLogFilePathsIfNeeded;
- (void)setWorkQueue:(id)a3;
@end

@implementation TVSettingsDiagnosticLogsFacade

+ (id)listedExtensions
{
  return &off_1001AEFC8;
}

+ (id)textForContentsOfLog:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  if ([v4 isEqualToString:@"synced"])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingPathExtension]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 pathExtension]);

    v4 = (void *)v6;
  }

  if ([v4 isEqualToString:@"plist"])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"description"]);
    if (v8) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v8));
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    if (([v4 isEqualToString:@"metriclog"] & 1) == 0
      && ![v3 hasSuffix:@"metriclog.anon"])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithContentsOfFile:usedEncoding:error:]( &OBJC_CLASS___NSMutableString,  "stringWithContentsOfFile:usedEncoding:error:",  v3,  0LL,  0LL));
      goto LABEL_17;
    }

    if (qword_1001E1930 != -1) {
      dispatch_once(&qword_1001E1930, &stru_1001924B8);
    }
    off_1001DFF88[0]();
    uint64_t v10 = off_1001DFF98((uint64_t)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v7) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v7));
    }
    else {
      v9 = 0LL;
    }
    off_1001DFF90[0]();
  }

LABEL_17:
  return v9;
}

+ (BOOL)filePathIsPowerLog:(id)a3
{
  return [a3 hasSuffix:@"PLSQL.pll.anon"];
}

+ (BOOL)filePathIsSysdiagnose:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  unsigned __int8 v4 = [v3 hasPrefix:@"sysdiagnose"];

  return v4;
}

+ (id)tableNamesForPowerLog:(id)a3
{
  id v3 = a3;
  id v4 = [[PLDatabaseReader alloc] initWithDatabaseFile:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tableNamesFromDatabase]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

  return v6;
}

+ (id)textForTableName:(id)a3 inPowerLog:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PLDatabaseReader alloc] initWithDatabaseFile:v5];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValueOfTable:v6]);
  return v8;
}

- (TVSettingsDiagnosticLogsFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsDiagnosticLogsFacade;
  v2 = -[TVSettingsDiagnosticLogsFacade init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVSettings.TVSettingsDiagnosticLogsFacade.workQueue", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue_serial *)v3;

    -[TVSettingsDiagnosticLogsFacade _triggerLogCopy](v2, "_triggerLogCopy");
    -[TVSettingsDiagnosticLogsFacade _workQueue_loadLogs](v2, "_workQueue_loadLogs");
  }

  return v2;
}

- (BOOL)deleteLogFileAtPath:(id)a3
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticLogsFacade logFilePaths](self, "logFilePaths"));
  unsigned int v7 = [v6 containsObject:v5];

  if (!v7)
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v12 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v12);
    }

    id v10 = 0LL;
    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  unsigned int v9 = [v8 removeItemAtPath:v5 error:&v15];
  id v10 = v15;

  if (!v9)
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v13 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v13);
    }

- (void)loadLogFilePathsIfNeeded
{
}

- (void)_triggerLogCopy
{
  v20 = @"Extensions";
  id v3 = [(id)objc_opt_class(self) listedExtensions];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v21 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  objc_super v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10008AA00;
  v18 = sub_10008AA10;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0LL, 0LL);
  unsigned int v7 = (_xpc_connection_s *)v15[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10008AA18;
  handler[3] = &unk_100192458;
  handler[4] = &v14;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume((xpc_connection_t)v15[5]);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v15[5], v6);
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v8, "Success");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v12 = v11;
    if (v11) {
      BOOL v9 = xpc_BOOL_get_value(v11);
    }
    else {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  if (!v9 && _TVSLogInternalLogLevel >= 3)
  {
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v2, &_os_log_default, 65LL, 0LL, 3LL, TVSSystemLog);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)_loadLogs
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticLogsFacade loadLogFilePaths](self, "loadLogFilePaths"));
  -[TVSettingsDiagnosticLogsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"logFilePaths");
  id v3 = (NSArray *)[v5 copy];
  logFilePaths = self->_logFilePaths;
  self->_logFilePaths = v3;

  -[TVSettingsDiagnosticLogsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"logFilePaths");
}

- (void)_workQueue_loadLogs
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticLogsFacade workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008AB4C;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)loadLogFilePaths
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v4,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v5,  0LL,  1LL,  0LL));

  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v7, "addObject:", @"/var/mobile/Library/Logs/CrashReporter");
  -[NSMutableArray addObject:]( v7,  "addObject:",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose");
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
  v43 = v4;
  if (v8)
  {
    BOOL v9 = (void *)v8;
    do
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      id v54 = 0LL;
      [v9 getResourceValue:&v54 forKey:NSURLIsDirectoryKey error:0];
      if ([v54 BOOLValue])
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
        unsigned int v12 = [v11 hasPrefix:@"ProxiedDevice-"];

        id v4 = v43;
        if (v12) {
          -[NSMutableArray addObject:](v7, "addObject:", v10);
        }
      }

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
      BOOL v9 = (void *)v13;
    }

    while (v13);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  obj = v7;
  id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v55,  16LL);
  if (v44)
  {
    uint64_t v42 = *(void *)v51;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
        uint64_t v46 = v14;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v4,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v15,  0LL,  1LL,  0LL));

        uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 nextObject]);
        if (v17)
        {
          v18 = (void *)v17;
          do
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            id v49 = 0LL;
            [v18 getResourceValue:&v49 forKey:NSURLIsDirectoryKey error:0];
            id v20 = v49;
            id v21 = [(id)objc_opt_class(self) listedExtensions];
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 pathExtension]);
            unsigned __int8 v24 = [v22 containsObject:v23];

            if (((v24 & 1) != 0 || [(id)objc_opt_class(self) filePathIsSysdiagnose:v19])
              && ([v20 BOOLValue] & 1) == 0)
            {
              -[NSMutableArray addObject:](v3, "addObject:", v19);
            }

            uint64_t v25 = objc_claimAutoreleasedReturnValue([v16 nextObject]);
            v18 = (void *)v25;
          }

          while (v25);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue([v45 stringByAppendingPathComponent:@"Retired"]);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v26));
        id v4 = v43;
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v43,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v27,  0LL,  1LL,  0LL));

        uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 nextObject]);
        if (v29)
        {
          v30 = (void *)v29;
          do
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v30 path]);
            id v48 = 0LL;
            [v30 getResourceValue:&v48 forKey:NSURLIsDirectoryKey error:0];

            uint64_t v32 = objc_claimAutoreleasedReturnValue([v28 nextObject]);
            v30 = (void *)v32;
          }

          while (v32);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue([v45 stringByAppendingPathComponent:@"Panics"]);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v33));
        objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v43,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v34,  0LL,  1LL,  0LL));

        uint64_t v35 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
        if (v35)
        {
          v36 = (void *)v35;
          do
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);
            id v47 = 0LL;
            [v36 getResourceValue:&v47 forKey:NSURLIsDirectoryKey error:0];

            uint64_t v38 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
            v36 = (void *)v38;
          }

          while (v38);
        }

        uint64_t v14 = v46 + 1;
      }

      while ((id)(v46 + 1) != v44);
      id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v55,  16LL);
    }

    while (v44);
  }

  -[NSMutableArray sortUsingComparator:](v3, "sortUsingComparator:", &stru_100192498);
  id v39 = -[NSMutableArray copy](v3, "copy");

  return v39;
}

- (NSArray)logFilePaths
{
  return self->_logFilePaths;
}

- (OS_dispatch_queue_serial)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end