@interface TVSettingsAppsFacade
+ (BOOL)MSOSettingsNeededForBundleID:(id)a3;
+ (BOOL)backgroundAppRefreshSettingsNeededForBundleID:(id)a3;
+ (BOOL)bluetoothPrivacySettingsNeededForBundleID:(id)a3;
+ (BOOL)cameraSettingsNeededForBundleID:(id)a3;
+ (BOOL)crossAppTrackingSettingsNeededForBundleID:(id)a3;
+ (BOOL)homeKitSettingsNeededForBundleID:(id)a3;
+ (BOOL)isAppEnabledForBundleID:(id)a3;
+ (BOOL)locationSettingsNeededForBundleID:(id)a3;
+ (BOOL)mediaLibrarySettingsNeededForBundleID:(id)a3;
+ (BOOL)microphoneSettingsNeededForBundleID:(id)a3;
+ (BOOL)notificationSettingsNeededForBundleID:(id)a3;
+ (BOOL)photosSettingsNeededForBundleID:(id)a3;
+ (BOOL)settingsNeededForBundleID:(id)a3;
+ (BOOL)userAccessSettingsNeededForBundleID:(id)a3;
+ (TVSettingsAppsFacade)sharedInstance;
+ (id)_allowedSystemApps;
- (BOOL)_shouldShowTCCSettingForBundleIdentifier:(id)a3;
- (BOOL)needsUpdate;
- (NSArray)systemAppsWithSettings;
- (NSArray)userAppsWithSettings;
- (NSSet)bundleIdentifiersWithSettings;
- (NSTimer)knockTimer;
- (id)_init;
- (os_unfair_lock_s)updateLock;
- (void)_cancelKnockTimer:(id)a3;
- (void)_trySomeStuffWithURLString:(id)a3;
- (void)_updateApps;
- (void)_updateAppsCoalesced;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)dealloc;
- (void)knockForEntry;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBundleIdentifiersWithSettings:(id)a3;
- (void)setKnockTimer:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation TVSettingsAppsFacade

+ (TVSettingsAppsFacade)sharedInstance
{
  if (qword_1001E1A78 != -1) {
    dispatch_once(&qword_1001E1A78, &stru_1001932A8);
  }
  return (TVSettingsAppsFacade *)(id)qword_1001E1A70;
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsAppsFacade;
  v2 = -[TVSettingsAppsFacade init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v2->_updateLock._os_unfair_lock_opaque = 0;
    -[TVSettingsAppsFacade _updateApps](v2, "_updateApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"applicationItems" options:0 context:off_1001E02E8];

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
    [v5 addObserver:v3 forKeyPath:@"systemServiceItems" options:0 context:off_1001E02F0];

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
    [v6 addObserver:v3 forKeyPath:@"notificationSettings" options:0 context:off_1001E02F8];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
    [v7 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0300];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMediaLibraryAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMediaLibraryAccessFacade,  "sharedInstance"));
    [v8 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0308];

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPhotosAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsPhotosAccessFacade,  "sharedInstance"));
    [v9 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0310];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUserAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsUserAccessFacade,  "sharedInstance"));
    [v10 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0318];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsMSOFacade sharedInstance](&OBJC_CLASS___TVSettingsMSOFacade, "sharedInstance"));
    [v11 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0320];

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBackgroundAppRefreshFacade sharedInstance]( &OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade,  "sharedInstance"));
    [v12 addObserver:v3 forKeyPath:@"backgroundAppRefreshSettings" options:0 context:off_1001E0328];

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMicrophoneAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMicrophoneAccessFacade,  "sharedInstance"));
    [v13 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0330];

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCameraAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsCameraAccessFacade,  "sharedInstance"));
    [v14 addObserver:v3 forKeyPath:@"infoArray" options:0 context:off_1001E0338];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v15 addObserver:v3];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"applicationItems" context:off_1001E02E8];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"systemServiceItems" context:off_1001E02F0];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
  [v5 removeObserver:self forKeyPath:@"notificationSettings" context:off_1001E02F8];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  [v6 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0300];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMediaLibraryAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMediaLibraryAccessFacade,  "sharedInstance"));
  [v7 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0308];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPhotosAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsPhotosAccessFacade,  "sharedInstance"));
  [v8 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0310];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUserAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsUserAccessFacade,  "sharedInstance"));
  [v9 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0318];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsMSOFacade sharedInstance](&OBJC_CLASS___TVSettingsMSOFacade, "sharedInstance"));
  [v10 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0320];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBackgroundAppRefreshFacade sharedInstance]( &OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade,  "sharedInstance"));
  [v11 removeObserver:self forKeyPath:@"backgroundAppRefreshSettings" context:off_1001E0328];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMicrophoneAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMicrophoneAccessFacade,  "sharedInstance"));
  [v12 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0330];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCameraAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsCameraAccessFacade,  "sharedInstance"));
  [v13 removeObserver:self forKeyPath:@"infoArray" context:off_1001E0338];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  [v14 removeObserver:self];

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsAppsFacade;
  -[TVSettingsAppsFacade dealloc](&v15, "dealloc");
}

+ (BOOL)settingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsAppsFacade sharedInstance](&OBJC_CLASS___TVSettingsAppsFacade, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifiersWithSettings]);
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

+ (BOOL)locationSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 itemForBundleID:v3]);

  LOBYTE(v3) = [v5 accessType] != 0;
  return (char)v3;
}

+ (BOOL)notificationSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationSettingForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)backgroundAppRefreshSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBackgroundAppRefreshFacade sharedInstance]( &OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundAppRefreshSettingForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)homeKitSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)mediaLibrarySettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMediaLibraryAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMediaLibraryAccessFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)MSOSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsMSOFacade sharedInstance](&OBJC_CLASS___TVSettingsMSOFacade, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)photosSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPhotosAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsPhotosAccessFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)microphoneSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMicrophoneAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMicrophoneAccessFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)cameraSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCameraAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsCameraAccessFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)bluetoothPrivacySettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBluetoothPrivacyFacade sharedInstance]( &OBJC_CLASS___TVSettingsBluetoothPrivacyFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)userAccessSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUserAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsUserAccessFacade,  "sharedInstance"));
  if ([v4 isEnabledOnDevice])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUserAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsUserAccessFacade,  "sharedInstance"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 infoForIdentifier:v3]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)crossAppTrackingSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 infoForIdentifier:v3]);

  return v5 != 0LL;
}

+ (BOOL)isAppEnabledForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appInfos]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);

  return v6 != 0LL;
}

+ (id)_allowedSystemApps
{
  if (qword_1001E1A88 != -1) {
    dispatch_once(&qword_1001E1A88, &stru_1001932C8);
  }
  return (id)qword_1001E1A80;
}

- (void)knockForEntry
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppsFacade knockTimer](self, "knockTimer"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_cancelKnockTimer:",  0LL,  0LL,  4.0));
    -[TVSettingsAppsFacade setKnockTimer:](self, "setKnockTimer:", v4);
  }

  unint64_t v5 = self->_knockCount + 1;
  self->_knockCount = v5;
  if (v5 == 4)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
    unsigned int v7 = [v6 shouldAllowAppOTA];

    if (v7)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000AAF34;
      block[3] = &unk_10018E440;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E02E8 == a6
    || off_1001E02F0 == a6
    || off_1001E02F8 == a6
    || off_1001E0300 == a6
    || off_1001E0308 == a6
    || off_1001E0310 == a6
    || off_1001E0318 == a6
    || off_1001E0330 == a6
    || off_1001E0338 == a6
    || off_1001E0320 == a6
    || off_1001E0328 == a6)
  {
    -[TVSettingsAppsFacade _updateAppsCoalesced](self, "_updateAppsCoalesced", a3, a4, a5);
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVSettingsAppsFacade;
    -[TVSettingsAppsFacade observeValueForKeyPath:ofObject:change:context:]( &v16,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
}

- (BOOL)_shouldShowTCCSettingForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class(self) locationSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) notificationSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) homeKitSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) mediaLibrarySettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) MSOSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) microphoneSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) cameraSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) photosSettingsNeededForBundleID:v4] & 1) != 0
    || ([(id)objc_opt_class(self) userAccessSettingsNeededForBundleID:v4] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned __int8 v5 = [(id)objc_opt_class(self) backgroundAppRefreshSettingsNeededForBundleID:v4];
  }

  return v5;
}

- (void)_cancelKnockTimer:(id)a3
{
  self->_knockCount = 0LL;
}

- (void)_trySomeStuffWithURLString:(id)a3
{
  id v3 = a3;
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_IPAddress"));
  unsigned __int8 v6 = v5;
  if (v5 && ![v5 rangeOfString:@"17."])
  {
    if (v4)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v4));
      if (v7)
      {
        v8 = (void *)v7;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_1000AB450;
        v10[3] = &unk_1001932F0;
        id v11 = [[SSDownloadManifestRequest alloc] initWithURLRequest:v7];
        id v9 = v11;
        [v9 startWithManifestResponseBlock:v10];
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1000FAB88((uint64_t)v4);
  }
}

- (void)_updateApps
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appInfos]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000AB698;
  v18[3] = &unk_100193318;
  v18[4] = self;
  v8 = v5;
  v19 = v8;
  id v9 = v4;
  v20 = v9;
  objc_super v17 = v3;
  v21 = v17;
  [v7 enumerateKeysAndObjectsUsingBlock:v18];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v17, "sortedArrayUsingComparator:", &stru_100193358));
  unsigned __int8 v11 = [v10 isEqual:self->_userAppsWithSettings];
  unsigned __int8 v12 = -[NSMutableArray isEqual:](v9, "isEqual:", self->_systemAppsWithSettings);
  if ((v11 & 1) == 0) {
    -[TVSettingsAppsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"userAppsWithSettings");
  }
  if ((v12 & 1) == 0) {
    -[TVSettingsAppsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"systemAppsWithSettings");
  }
  -[TVSettingsAppsFacade setBundleIdentifiersWithSettings:](self, "setBundleIdentifiersWithSettings:", v8);
  if ((v11 & 1) != 0)
  {
    if ((v12 & 1) != 0) {
      goto LABEL_7;
    }
  }

  else
  {
    v13 = (NSArray *)[v10 copy];
    userAppsWithSettings = self->_userAppsWithSettings;
    self->_userAppsWithSettings = v13;

    if ((v12 & 1) != 0)
    {
LABEL_7:
      if ((v11 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_13:
      -[TVSettingsAppsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"userAppsWithSettings");
      if ((v12 & 1) != 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  objc_super v15 = (NSArray *)-[NSMutableArray copy](v9, "copy");
  systemAppsWithSettings = self->_systemAppsWithSettings;
  self->_systemAppsWithSettings = v15;

  if ((v11 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v12 & 1) == 0) {
LABEL_9:
  }
    -[TVSettingsAppsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"systemAppsWithSettings");
LABEL_10:
}

- (void)_updateAppsCoalesced
{
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  -[TVSettingsAppsFacade setNeedsUpdate:](self, "setNeedsUpdate:", 1LL);
  os_unfair_lock_unlock(p_updateLock);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000AB898;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSArray)systemAppsWithSettings
{
  return self->_systemAppsWithSettings;
}

- (NSArray)userAppsWithSettings
{
  return self->_userAppsWithSettings;
}

- (NSSet)bundleIdentifiersWithSettings
{
  return self->_bundleIdentifiersWithSettings;
}

- (void)setBundleIdentifiersWithSettings:(id)a3
{
}

- (os_unfair_lock_s)updateLock
{
  return self->_updateLock;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NSTimer)knockTimer
{
  return self->_knockTimer;
}

- (void)setKnockTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end