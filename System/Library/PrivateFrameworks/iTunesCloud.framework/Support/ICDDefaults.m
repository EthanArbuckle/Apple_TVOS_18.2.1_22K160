@interface ICDDefaults
+ (ICDDefaults)daemonDefaults;
- (BOOL)lastKnownExplicitContentAllowed;
- (BOOL)lastKnownMusicVideosAllowed;
- (NSArray)knownAccountDSIDs;
- (NSData)pendingBackgroundTasksData;
- (NSString)knownActiveAccountDSID;
- (NSUserDefaults)internalDefaults;
- (NSUserDefaults)userDefaults;
- (id)_init;
- (int64_t)lastKnownMusicSubscriptionType;
- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4;
- (void)setInternalDefaults:(id)a3;
- (void)setKnownAccountDSIDs:(id)a3;
- (void)setKnownActiveAccountDSID:(id)a3;
- (void)setLastKnownExplicitContentAllowed:(BOOL)a3;
- (void)setLastKnownMusicSubscriptionType:(int64_t)a3;
- (void)setLastKnownMusicVideosAllowed:(BOOL)a3;
- (void)setPendingBackgroundTasksData:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation ICDDefaults

- (NSArray)knownAccountDSIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ICDDefaultsKeyKnowAccountDSIDs"]);

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    else {
      v6 = &__NSArray0__struct;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - knownActiveAccountDSID: %@",  (uint8_t *)&v10,  0x16u);
  }

  else {
    v7 = &__NSArray0__struct;
  }
  v8 = v7;

  return v8;
}

- (void)setKnownAccountDSIDs:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - setKnownAccountDSIDs: %@",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDDefaults _setOrRemoveObject:forKey:]( self,  "_setOrRemoveObject:forKey:",  v4,  @"ICDDefaultsKeyKnowAccountDSIDs");
}

- (NSString)knownActiveAccountDSID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:@"ICDDefaultsKeyKnownActiveAccountDSID"]);

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    else {
      int v6 = 0LL;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - knownActiveAccountDSID: %@",  (uint8_t *)&v10,  0x16u);
  }

  else {
    v7 = 0LL;
  }
  __int16 v8 = v7;

  return v8;
}

- (void)setKnownActiveAccountDSID:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - setKnownActiveAccountDSID: %@",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDDefaults _setOrRemoveObject:forKey:]( self,  "_setOrRemoveObject:forKey:",  v4,  @"ICDDefaultsKeyKnownActiveAccountDSID");
}

- (NSData)pendingBackgroundTasksData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataForKey:@"ICDDefaultsKeyPendingBackgroundTasksData"]);

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    else {
      int v6 = 0LL;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - pendingBackgroundTasksData: %@",  (uint8_t *)&v10,  0x16u);
  }

  else {
    v7 = 0LL;
  }
  __int16 v8 = v7;

  return v8;
}

- (void)setPendingBackgroundTasksData:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDDefaults %p - setPendingBackgroundTasksData: %@",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDDefaults _setOrRemoveObject:forKey:]( self,  "_setOrRemoveObject:forKey:",  v4,  @"ICDDefaultsKeyPendingBackgroundTasksData");
}

- (BOOL)lastKnownExplicitContentAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"ICDDefaultsKeyLastKnownExplicitContentAllowed"];

  return v3;
}

- (void)setLastKnownExplicitContentAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  [v4 setBool:v3 forKey:@"ICDDefaultsKeyLastKnownExplicitContentAllowed"];
}

- (BOOL)lastKnownMusicVideosAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"ICDDefaultsKeyLastKnownMusicVideosAllowed"];

  return v3;
}

- (void)setLastKnownMusicVideosAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  [v4 setBool:v3 forKey:@"ICDDefaultsKeyLastKnownMusicVideosAllowed"];
}

- (int64_t)lastKnownMusicSubscriptionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"ICDDefaultsKeyLastKnownMusicSubscriptionType"];

  return (int64_t)v3;
}

- (void)setLastKnownMusicSubscriptionType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  [v4 setInteger:a3 forKey:@"ICDDefaultsKeyLastKnownMusicSubscriptionType"];
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ICDDefaults;
  v2 = -[ICDDefaults init](&v10, "init");
  if (v2)
  {
    id v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.itunescloud.daemon");
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned int v6 = [v5 isInternalBuild];

    if (v6)
    {
      v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.itunescloud.daemon.internal");
      internalDefaults = v2->_internalDefaults;
      v2->_internalDefaults = v7;
    }
  }

  return v2;
}

- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDDefaults userDefaults](self, "userDefaults"));
  __int16 v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (void)setInternalDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (ICDDefaults)daemonDefaults
{
  if (qword_1001DB5A8 != -1) {
    dispatch_once(&qword_1001DB5A8, &stru_1001A21D8);
  }
  return (ICDDefaults *)(id)qword_1001DB5A0;
}

@end