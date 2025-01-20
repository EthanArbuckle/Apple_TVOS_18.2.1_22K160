@interface MSDPreferencesFile
+ (BOOL)preferencesFileExists;
+ (id)preferencesFilePath;
+ (id)preferencesFileUrl;
+ (id)sharedInstance;
- (BOOL)removeObjectForKey:(id)a3;
- (BOOL)removeObjectsForKeys:(id)a3;
- (BOOL)saveCache;
- (BOOL)setObject:(id)a3 forKey:(id)a4;
- (MSDPreferencesFile)init;
- (NSMutableDictionary)cache;
- (id)deepCopy:(id)a3;
- (id)objectForKey:(id)a3;
- (void)populateCache;
- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3;
- (void)reload;
- (void)setCache:(id)a3;
@end

@implementation MSDPreferencesFile

+ (id)sharedInstance
{
  if (qword_100125318 != -1) {
    dispatch_once(&qword_100125318, &stru_1000F9BE0);
  }
  return (id)qword_100125310;
}

- (MSDPreferencesFile)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDPreferencesFile;
  v2 = -[MSDPreferencesFile init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MSDPreferencesFile populateCache](v2, "populateCache");
  }
  return v3;
}

+ (id)preferencesFilePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return v3;
}

+ (BOOL)preferencesFileExists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](&OBJC_CLASS___MSDPreferencesFile, "preferencesFilePath"));
  unsigned __int8 v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (void)reload
{
  obj = self;
  objc_sync_enter(obj);
  -[MSDPreferencesFile populateCache](obj, "populateCache");
  objc_sync_exit(obj);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    objc_sync_exit(v5);
  }

  else
  {
    id v9 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000962C8(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v7 = 0LL;
  }

  return v7;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v7;
  if (!v6 || !v7)
  {
    id v17 = sub_10003A95C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446210;
      v22 = "-[MSDPreferencesFile setObject:forKey:]";
      v18 = "%{public}s - Both object and key must be non-nil.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0xCu);
    }

- (BOOL)removeObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    [v6 removeObjectForKey:v4];

    unsigned __int8 v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);
  }

  else
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000963B8(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    [v6 removeObjectsForKeys:v4];

    unsigned __int8 v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);
  }

  else
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100096428(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)populateCache
{
  if (!+[MSDPreferencesFile preferencesFileExists](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileExists"))
  {
LABEL_7:
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDPreferencesFile setCache:](self, "setCache:", v4);
    goto LABEL_8;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileUrl"));
  id v10 = 0LL;
  id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v10));
  id v5 = v10;

  if (!v4)
  {
    id v7 = sub_10003A95C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](&OBJC_CLASS___MSDPreferencesFile, "preferencesFilePath"));
      *(_DWORD *)buf = 136446722;
      uint64_t v12 = "-[MSDPreferencesFile populateCache]";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s - Failed to read preferences file:  %{public}@ - Error:  %{public}@",  buf,  0x20u);
    }

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));
  -[MSDPreferencesFile setCache:](self, "setCache:", v6);

LABEL_8:
}

- (BOOL)saveCache
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](self, "cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileUrl"));
  id v10 = 0LL;
  unsigned __int8 v4 = [v2 writeToURL:v3 error:&v10];
  id v5 = v10;

  if ((v4 & 1) == 0)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](&OBJC_CLASS___MSDPreferencesFile, "preferencesFilePath"));
      *(_DWORD *)buf = 136446722;
      uint64_t v12 = "-[MSDPreferencesFile saveCache]";
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s - Failed to save preferences file:  %{public}@ - Error:  %{public}@",  buf,  0x20u);
    }
  }

  return v4;
}

- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3
{
  id v3 = a3;
  id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Object %@ of type %@ is not a valid property list object.",  v3,  objc_opt_class(v3, v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"InvalidPropertyListObject",  v6,  0LL));
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v11 = "-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]";
    __int16 v12 = 2114;
    __int16 v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s - Exception:  %{public}@",  buf,  0x16u);
  }

  [v7 raise];
}

+ (id)preferencesFileUrl
{
  if (qword_100125328 != -1) {
    dispatch_once(&qword_100125328, &stru_1000F9C00);
  }
  return (id)qword_100125320;
}

- (id)deepCopy:(id)a3
{
  return (id)(id)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, a3, 0LL);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end