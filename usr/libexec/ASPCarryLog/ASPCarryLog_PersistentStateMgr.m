@interface ASPCarryLog_PersistentStateMgr
- (ASPCarryLog_PersistentStateMgr)initWithIdentifier:(id)a3;
- (NSMutableDictionary)stateDict;
- (NSString)identifier;
- (NSString)plistPath;
- (NSURL)plistUrl;
- (id)getValueForKey:(id)a3;
- (void)_tryInitializePlistDir;
- (void)removeKey:(id)a3 doPersist:(BOOL)a4;
- (void)saveValue:(id)a3 forKey:(id)a4 doPersist:(BOOL)a5;
- (void)setIdentifier:(id)a3;
- (void)setPlistPath:(id)a3;
- (void)setPlistUrl:(id)a3;
- (void)setStateDict:(id)a3;
@end

@implementation ASPCarryLog_PersistentStateMgr

- (ASPCarryLog_PersistentStateMgr)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___ASPCarryLog_PersistentStateMgr;
  v6 = -[ASPCarryLog_PersistentStateMgr init](&v41, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@".plist"]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([@"/private/var/db/NANDTelemetryServices" stringByAppendingPathComponent:v8]);
    plistPath = v6->_plistPath;
    v6->_plistPath = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v11, 0LL));
    plistUrl = v6->_plistUrl;
    v6->_plistUrl = (NSURL *)v12;

    stateDict = v6->_stateDict;
    v6->_stateDict = 0LL;

    -[ASPCarryLog_PersistentStateMgr _tryInitializePlistDir](v6, "_tryInitializePlistDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    unsigned int v16 = [v7 fileExistsAtPath:v15];

    id v17 = 0LL;
    v18 = 0LL;
    if (v16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](v6, "plistUrl"));
      id v40 = 0LL;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v19,  &v40));
      id v20 = v40;

      if (v20)
      {
        v21 = (void *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
          sub_100041BA0(v21, v6);
        }
        v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
        id v39 = v20;
        [v7 removeItemAtPath:v22 error:&v39];
        id v17 = v39;
      }

      else
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v18));
        id v17 = 0LL;
        v22 = v6->_stateDict;
        v6->_stateDict = (NSMutableDictionary *)v23;
      }
    }

    if (!v6->_stateDict)
    {
      v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v25 = v6->_stateDict;
      v6->_stateDict = v24;

      v26 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v5;
        v28 = v26;
        id v29 = [v27 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v43 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Persistent state absent for %s. Generated an empty one.",  buf,  0xCu);
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    unsigned __int8 v31 = [v7 fileExistsAtPath:v30];

    if ((v31 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](v6, "stateDict"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](v6, "plistUrl"));
      id v38 = v17;
      [v32 writeToURL:v33 error:&v38];
      id v34 = v38;

      id v17 = v34;
      if (!v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
        disableFileBackUp(v35);

        id v17 = 0LL;
      }
    }

    v36 = v6;
  }

  return v6;
}

- (void)_tryInitializePlistDir
{
  char v13 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = [v2 fileExistsAtPath:@"/private/var/db/NANDTelemetryServices" isDirectory:&v13];
  if (v3) {
    BOOL v4 = v13 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v5 = (void *)oslog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100041D04(v5);
      }
      id v12 = 0LL;
      [v2 removeItemAtPath:@"/private/var/db/NANDTelemetryServices" error:&v12];
      id v6 = v12;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v5;
        id v8 = [@"/private/var/db/NANDTelemetryServices" UTF8String];
        *(_DWORD *)buf = 136315138;
        id v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Plist directory %s does not exist. Creating it",  buf,  0xCu);
      }

      id v6 = 0LL;
    }

    id v11 = v6;
    [v2 createDirectoryAtPath:@"/private/var/db/NANDTelemetryServices" withIntermediateDirectories:0 attributes:0 error:&v11];
    id v9 = v11;

    if (v9)
    {
      v10 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100041C38(v10, v9);
      }
    }
  }
}

- (id)getValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)saveValue:(id)a3 forKey:(id)a4 doPersist:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  [v10 setObject:v9 forKeyedSubscript:v8];

  if (v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](self, "plistUrl"));
    id v14 = 0LL;
    [v11 writeToURL:v12 error:&v14];
    id v13 = v14;
  }

- (void)removeKey:(id)a3 doPersist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
    [v9 removeObjectForKey:v6];

    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](self, "plistUrl"));
      id v13 = 0LL;
      [v10 writeToURL:v11 error:&v13];
      id v12 = v13;
    }
  }
}

- (NSMutableDictionary)stateDict
{
  return self->_stateDict;
}

- (void)setStateDict:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (void)setPlistPath:(id)a3
{
}

- (NSURL)plistUrl
{
  return self->_plistUrl;
}

- (void)setPlistUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end