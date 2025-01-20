@interface RMManagementSettings
+ (RMManagementSettings)sharedSettings;
+ (void)reset;
- (NSMutableDictionary)cachedSettings;
- (NSURL)settingsURL;
- (RMManagementSettings)initWithURL:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_readCachedSettings;
- (void)_writeCachedSettings;
- (void)removeValueForKey:(id)a3;
- (void)setCachedSettings:(id)a3;
- (void)setSettingsURL:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RMManagementSettings

+ (RMManagementSettings)sharedSettings
{
  if (qword_1000253C0 != -1) {
    dispatch_once(&qword_1000253C0, &stru_10001C6D8);
  }
  return (RMManagementSettings *)(id)qword_1000253B8;
}

+ (void)reset
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 sharedSettings]);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations dataVaultDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "dataVaultDirectoryURLCreateIfNeeded:",  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"ManagementSettings.plist"]);
  [v5 setSettingsURL:v3];

  [v5 _readCachedSettings];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 cachedSettings]);
  [v4 removeAllObjects];

  [v5 _writeCachedSettings];
}

- (RMManagementSettings)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RMManagementSettings;
  v6 = -[RMManagementSettings init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsURL, a3);
    v8 = objc_opt_new(&OBJC_CLASS___NSObject);
    settingsLock = v7->_settingsLock;
    v7->_settingsLock = v8;
  }

  return v7;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  id v5 = self->_settingsLock;
  objc_sync_enter(v5);
  -[RMManagementSettings _readCachedSettings](self, "_readCachedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings cachedSettings](self, "cachedSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (void)removeValueForKey:(id)a3
{
  id v6 = a3;
  id v4 = self->_settingsLock;
  objc_sync_enter(v4);
  -[RMManagementSettings _readCachedSettings](self, "_readCachedSettings");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings cachedSettings](self, "cachedSettings"));
  [v5 setObject:0 forKeyedSubscript:v6];

  -[RMManagementSettings _writeCachedSettings](self, "_writeCachedSettings");
  objc_sync_exit(v4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self->_settingsLock;
  objc_sync_enter(v7);
  -[RMManagementSettings _readCachedSettings](self, "_readCachedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings cachedSettings](self, "cachedSettings"));
  [v8 setObject:v9 forKeyedSubscript:v6];

  -[RMManagementSettings _writeCachedSettings](self, "_writeCachedSettings");
  objc_sync_exit(v7);
}

- (void)_readCachedSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings cachedSettings](self, "cachedSettings"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings settingsURL](self, "settingsURL"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v4));

    [v5 open];
    id v18 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v5,  2LL,  0LL,  &v18));
    id v7 = v18;
    [v5 close];
    if (v6)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementSettings](&OBJC_CLASS___RMLog, "managementSettings"));
      objc_super v11 = v10;
      if ((isKindOfClass & 1) != 0)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_10001243C(self);
        }

        -[RMManagementSettings setCachedSettings:](self, "setCachedSettings:", v6);
        goto LABEL_20;
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000124B4();
      }

      v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[RMManagementSettings setCachedSettings:](self, "setCachedSettings:", v13);
LABEL_19:

LABEL_20:
      return;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v13, "domain"));
      if ([v14 isEqualToString:NSPOSIXErrorDomain])
      {
        id v15 = -[NSMutableDictionary code](v13, "code");

        if (v15 == (id)2)
        {
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementSettings](&OBJC_CLASS___RMLog, "managementSettings"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_1000123FC(v16);
          }
LABEL_18:

          v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          -[RMManagementSettings setCachedSettings:](self, "setCachedSettings:", v17);

          goto LABEL_19;
        }
      }

      else
      {
      }
    }

    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementSettings](&OBJC_CLASS___RMLog, "managementSettings"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001239C();
    }
    goto LABEL_18;
  }

- (void)_writeCachedSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings settingsURL](self, "settingsURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamWithURL:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamWithURL:append:",  v3,  0LL));

  [v4 open];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSettings cachedSettings](self, "cachedSettings"));
  id v10 = 0LL;
  NSInteger v6 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v5,  v4,  100LL,  0LL,  &v10);
  id v7 = v10;

  [v4 close];
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementSettings](&OBJC_CLASS___RMLog, "managementSettings"));
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100012574(self);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100012514();
  }
}

- (NSURL)settingsURL
{
  return self->_settingsURL;
}

- (void)setSettingsURL:(id)a3
{
}

- (NSMutableDictionary)cachedSettings
{
  return self->_cachedSettings;
}

- (void)setCachedSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end