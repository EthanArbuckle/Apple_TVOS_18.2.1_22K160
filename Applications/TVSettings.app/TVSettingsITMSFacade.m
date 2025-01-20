@interface TVSettingsITMSFacade
+ (TVSettingsITMSFacade)sharedInstance;
- (BOOL)autoDownloadApps;
- (BOOL)isManagedSubscriptionsURLLoaded;
- (NSArray)availableLocales;
- (NSString)versionInfo;
- (NSURL)manageSubscriptionsURL;
- (SSAccount)preferredAccount;
- (TVSStoreFrontLocale)locale;
- (TVSettingsITMSFacade)init;
- (void)_automaticDownloadKindsChangedNotification:(id)a3;
- (void)_availableLocalesUpdated;
- (void)_localeUpdated;
- (void)_updateAutoDownloadApps;
- (void)_updateAutoDownloadAppsPerCloudSyncPreferences;
- (void)_urlBagLoaded:(id)a3;
- (void)dealloc;
- (void)killStoreApps;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAutoDownloadApps:(BOOL)a3;
- (void)setIsManagedSubscriptionsURLLoaded:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPreferredAccount:(id)a3;
@end

@implementation TVSettingsITMSFacade

+ (TVSettingsITMSFacade)sharedInstance
{
  if (qword_1001E17C0 != -1) {
    dispatch_once(&qword_1001E17C0, &stru_100190FA8);
  }
  return (TVSettingsITMSFacade *)(id)qword_1001E17B8;
}

- (TVSettingsITMSFacade)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsITMSFacade;
  v2 = -[TVSettingsITMSFacade init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
    [v3 synchronizeAutomaticDownloadKinds];

    -[TVSettingsITMSFacade _updateAutoDownloadAppsPerCloudSyncPreferences]( v2,  "_updateAutoDownloadAppsPerCloudSyncPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
    v2->_isManagedSubscriptionsURLLoaded = [v4 isValid];

    [(id)objc_opt_class(TVSStoreFront) addObserver:v2 forKeyPath:@"availableLocales" options:0 context:off_1001DFCA0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
    [v5 addObserver:v2 forKeyPath:@"locale" options:0 context:off_1001DFCA8];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_automaticDownloadKindsChangedNotification:" name:SSDeviceAutomaticDownloadKindsChangedNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v8 = TVSURLBagDidLoadNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
    [v7 addObserver:v2 selector:"_urlBagLoaded:" name:v8 object:v9];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"locale" context:off_1001DFCA8];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsITMSFacade;
  -[TVSettingsITMSFacade dealloc](&v5, "dealloc");
}

- (TVSStoreFrontLocale)locale
{
  v2 = self;
  objc_sync_enter(v2);
  locale = v2->_locale;
  if (!locale)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 locale]);
    v6 = v2->_locale;
    v2->_locale = (TVSStoreFrontLocale *)v5;

    locale = v2->_locale;
  }

  v7 = locale;
  objc_sync_exit(v2);

  return v7;
}

- (void)setLocale:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[TVSStoreFront switchToStoreFrontWithLocale:](&OBJC_CLASS___TVSStoreFront, "switchToStoreFrontWithLocale:", v5);
  objc_sync_exit(v4);
}

- (NSArray)availableLocales
{
  v2 = self;
  objc_sync_enter(v2);
  availableLocales = v2->_availableLocales;
  if (!availableLocales)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"displayName",  1LL,  "localizedCompare:"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront availableLocales](&OBJC_CLASS___TVSStoreFront, "availableLocales"));
    objc_super v11 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingDescriptors:v6]);
    uint64_t v8 = v2->_availableLocales;
    v2->_availableLocales = (NSArray *)v7;

    availableLocales = v2->_availableLocales;
  }

  v9 = availableLocales;
  objc_sync_exit(v2);

  return v9;
}

- (NSURL)manageSubscriptionsURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:@"ManageSubscriptionsURL"]);
  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  }
  else {
    v6 = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"itml-app-urls"]);

  if (v6)
  {
    id v9 = v6;
    id v10 = 0LL;
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"subscription-mgmt"]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && [v12 length])
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

        id v10 = v14;
        id v9 = v10;
        if (v10) {
          goto LABEL_15;
        }
      }

      else
      {
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F8880((uint64_t)v8);
    }
    id v10 = 0LL;
    id v9 = 0LL;
  }

- (void)setAutoDownloadApps:(BOOL)a3
{
  BOOL v3 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100061CD4;
  v17[3] = &unk_10018EC08;
  v17[4] = self;
  id v5 = objc_retainBlock(v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomeScreenSyncFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomeScreenSyncFacade,  "sharedInstance"));
  if ([v6 homeScreenSyncEnabled])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    id v10 = [v9 integerValue];

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accountName]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        __int16 v20 = 2112;
        v21 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Updating home screen sync preferences for account %@. Auto downloads value %@",  buf,  0x16u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
      [v6 setAutoAppDownloadsEnabled:v3 accountIdentifier:v13];
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", SSDownloadKindSoftwareApplication));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  v16 = v15;
  if (v3) {
    [v15 unionAutomaticDownloadKinds:v14 withCompletionBlock:v5];
  }
  else {
    [v15 minusAutomaticDownloadKinds:v14 withCompletionBlock:v5];
  }

  self->_autoDownloadApps = v3;
}

- (NSString)versionInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedDescription]);

  return (NSString *)v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001DFCA0 == a6)
  {
    -[TVSettingsITMSFacade _availableLocalesUpdated](self, "_availableLocalesUpdated");
  }

  else if (off_1001DFCA8 == a6)
  {
    -[TVSettingsITMSFacade _localeUpdated](self, "_localeUpdated");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___TVSettingsITMSFacade;
    -[TVSettingsITMSFacade observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_localeUpdated
{
  BOOL v3 = self;
  objc_sync_enter(v3);
  locale = v3->_locale;
  v3->_locale = 0LL;

  objc_sync_exit(v3);
  -[TVSettingsITMSFacade didChangeValueForKey:](v3, "didChangeValueForKey:", @"locale");
}

- (void)_availableLocalesUpdated
{
  BOOL v3 = self;
  objc_sync_enter(v3);
  availableLocales = v3->_availableLocales;
  v3->_availableLocales = 0LL;

  objc_sync_exit(v3);
  -[TVSettingsITMSFacade didChangeValueForKey:](v3, "didChangeValueForKey:", @"availableLocales");
}

- (void)_automaticDownloadKindsChangedNotification:(id)a3
{
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v5 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 5LL, v5);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061FD0;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateAutoDownloadAppsPerCloudSyncPreferences
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeAccount]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomeScreenSyncFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomeScreenSyncFacade,  "sharedInstance"));
  if ([v5 homeScreenSyncEnabled])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    id v7 = [v5 isAutoAppDownloadsEnabledForAccountIdentifier:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Auto downloads per cloud sync preferences enabled %@",  (uint8_t *)&v9,  0xCu);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Home screen sync is enabled so updating auto downloads from home screen sync preferences...",  (uint8_t *)&v9,  2u);
    }

    -[TVSettingsITMSFacade setAutoDownloadApps:](self, "setAutoDownloadApps:", v7);
  }

  else
  {
    -[TVSettingsITMSFacade _updateAutoDownloadApps](self, "_updateAutoDownloadApps");
  }
}

- (void)_updateAutoDownloadApps
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 automaticDownloadKinds]);
  unsigned int v5 = [v4 containsObject:SSDownloadKindSoftwareApplication];

  if (self->_autoDownloadApps != v5)
  {
    -[TVSettingsITMSFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"autoDownloadApps");
    self->_autoDownloadApps = v5;
    -[TVSettingsITMSFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"autoDownloadApps");
  }

- (void)killStoreApps
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = [&off_1001AED40 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v12;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(&off_1001AED40);
        }
        SFKillProcessNamed(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v6), v3);
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [&off_1001AED40 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemServiceProxy]);

  [v8 purgeTopShelfContentForApplicationIdentifiers:&off_1001AED58];
  SFKillProcessNamed(@"com.apple.TVSearchServices.ActionService", v9);
  SFKillProcessNamed(@"SiriViewService", v10);
}

- (void)_urlBagLoaded:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance", a3));
  id v5 = [v4 isValid];

  -[TVSettingsITMSFacade setIsManagedSubscriptionsURLLoaded:](self, "setIsManagedSubscriptionsURLLoaded:", v5);
}

- (BOOL)isManagedSubscriptionsURLLoaded
{
  return self->_isManagedSubscriptionsURLLoaded;
}

- (void)setIsManagedSubscriptionsURLLoaded:(BOOL)a3
{
  self->_isManagedSubscriptionsURLLoaded = a3;
}

- (BOOL)autoDownloadApps
{
  return self->_autoDownloadApps;
}

- (SSAccount)preferredAccount
{
  return self->_preferredAccount;
}

- (void)setPreferredAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end