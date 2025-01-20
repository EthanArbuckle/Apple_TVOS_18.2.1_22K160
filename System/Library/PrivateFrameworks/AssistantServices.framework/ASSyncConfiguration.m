@interface ASSyncConfiguration
- (ASSyncConfiguration)init;
- (ASSyncConfiguration)initWithConfigurationPlistForSyncKey:(id)a3;
- (id)configurationInfoForKey:(id)a3;
- (void)_tryGettingPlistData;
@end

@implementation ASSyncConfiguration

- (ASSyncConfiguration)initWithConfigurationPlistForSyncKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASSyncConfiguration;
  v5 = -[ASSyncConfiguration init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    syncKey = v5->_syncKey;
    v5->_syncKey = v6;
  }

  return v5;
}

- (ASSyncConfiguration)init
{
  return 0LL;
}

- (id)configurationInfoForKey:(id)a3
{
  id v4 = a3;
  -[ASSyncConfiguration _tryGettingPlistData](self, "_tryGettingPlistData");
  if (v4 && (configPlistData = self->_configPlistData) != 0LL)
  {
    v8 = 0LL;
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void)_tryGettingPlistData
{
  if (!self->_attemptedPlistOpen)
  {
    self->_attemptedPlistOpen = 1;
    if (self->_syncKey)
    {
      v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0x408uLL, 1);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

      v5 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"Assistant/SyncConfiguration/"]);
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  self->_syncKey));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);

      if (v7)
      {
        v8 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v7,  1LL,  0LL));
        configPlistData = self->_configPlistData;
        self->_configPlistData = v8;
      }
    }
  }

- (void).cxx_destruct
{
}

@end