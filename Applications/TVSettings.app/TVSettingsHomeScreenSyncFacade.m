@interface TVSettingsHomeScreenSyncFacade
+ (id)sharedInstance;
- (BOOL)homeScreenSyncEnabled;
- (BOOL)isAutoAppDownloadsEnabledForAccountIdentifier:(id)a3;
- (TVSPreferences)headBoardPreferences;
- (TVSettingsHomeScreenSyncFacade)init;
- (TVSiCloudAccountManager)iCloudAccountManager;
- (void)_clearLastKnownDeviceSyncState;
- (void)clearAccountPrefsForAutoAppDownloads;
- (void)iCloudAccountManager:(id)a3 didModifyActiveAccount:(id)a4;
- (void)setAutoAppDownloadsEnabled:(BOOL)a3 accountIdentifier:(id)a4;
- (void)setHeadBoardPreferences:(id)a3;
- (void)setHomeScreenSyncEnabled:(BOOL)a3;
- (void)setICloudAccountManager:(id)a3;
@end

@implementation TVSettingsHomeScreenSyncFacade

+ (id)sharedInstance
{
  if (qword_1001E1798 != -1) {
    dispatch_once(&qword_1001E1798, &stru_100190D80);
  }
  return (id)qword_1001E1790;
}

- (TVSettingsHomeScreenSyncFacade)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsHomeScreenSyncFacade;
  v2 = -[TVSettingsHomeScreenSyncFacade init](&v17, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.HeadBoard"));
    headBoardPreferences = v2->_headBoardPreferences;
    v2->_headBoardPreferences = (TVSPreferences *)v3;

    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSPreferences domain](v2->_headBoardPreferences, "domain"));
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    v13 = sub_10005D83C;
    v14 = &unk_10018E810;
    objc_copyWeak(&v15, &location);
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v5,  &v11));
    id headboardPrefsObserverToken = v2->_headboardPrefsObserverToken;
    v2->_id headboardPrefsObserverToken = (id)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    iCloudAccountManager = v2->_iCloudAccountManager;
    v2->_iCloudAccountManager = v8;

    -[TVSiCloudAccountManager setDelegate:](v2->_iCloudAccountManager, "setDelegate:", v2, v11, v12, v13, v14);
    -[TVSettingsHomeScreenSyncFacade setHomeScreenSyncEnabled:]( v2,  "setHomeScreenSyncEnabled:",  -[TVSPreferences BOOLForKey:](v2->_headBoardPreferences, "BOOLForKey:", @"iCloudSyncEnabled"));
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)setHomeScreenSyncEnabled:(BOOL)a3
{
  self->_int homeScreenSyncEnabled = a3;
  unsigned int v4 = -[TVSPreferences BOOLForKey:]( self->_headBoardPreferences,  "BOOLForKey:",  @"iCloudSyncEnabled");
  int homeScreenSyncEnabled = self->_homeScreenSyncEnabled;
  if (homeScreenSyncEnabled != v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", homeScreenSyncEnabled != 0));
    +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 7LL, v6);

    -[TVSPreferences setBool:forKey:]( self->_headBoardPreferences,  "setBool:forKey:",  self->_homeScreenSyncEnabled,  @"iCloudSyncEnabled");
  }

- (void)setAutoAppDownloadsEnabled:(BOOL)a3 accountIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 integerValue])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPreferences objectForKey:]( self->_headBoardPreferences,  "objectForKey:",  @"accountsListForAutoAppDownloadsEnabled"));
    v7 = (NSMutableDictionary *)[v6 mutableCopy];

    if (!v7) {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v10));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, v9);

    -[TVSPreferences setObject:forKey:]( self->_headBoardPreferences,  "setObject:forKey:",  v7,  @"accountsListForAutoAppDownloadsEnabled");
  }
}

- (BOOL)isAutoAppDownloadsEnabledForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 integerValue])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPreferences objectForKey:]( self->_headBoardPreferences,  "objectForKey:",  @"accountsListForAutoAppDownloadsEnabled"));
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
      unsigned __int8 v8 = [v7 BOOLValue];
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)clearAccountPrefsForAutoAppDownloads
{
}

- (void)iCloudAccountManager:(id)a3 didModifyActiveAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = (objc_class *)objc_opt_class(self);
      v9 = NSStringFromClass(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received a notification in %@ that user isn't authenticated with iCloud anymore......",  (uint8_t *)&v11,  0xCu);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Clearing last known device sync state...",  (uint8_t *)&v11,  2u);
    }

    -[TVSettingsHomeScreenSyncFacade setHomeScreenSyncEnabled:](self, "setHomeScreenSyncEnabled:", 0LL);
    -[TVSettingsHomeScreenSyncFacade _clearLastKnownDeviceSyncState](self, "_clearLastKnownDeviceSyncState");
  }
}

- (void)_clearLastKnownDeviceSyncState
{
}

- (BOOL)homeScreenSyncEnabled
{
  return self->_homeScreenSyncEnabled;
}

- (TVSPreferences)headBoardPreferences
{
  return self->_headBoardPreferences;
}

- (void)setHeadBoardPreferences:(id)a3
{
}

- (TVSiCloudAccountManager)iCloudAccountManager
{
  return self->_iCloudAccountManager;
}

- (void)setICloudAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end