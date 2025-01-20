@interface TVSettingsAppleRemoteFacade
+ (BOOL)automaticallyNotifiesObserversForClickpadMode;
+ (id)sharedInstance;
- (BOOL)supportsClickpadModes;
- (BOOL)supportsSensitivity;
- (BOOL)tvButtonLaunchesTVApp;
- (NSArray)availableClickpadModeValues;
- (NSArray)availableSensitivityValues;
- (NSFormatter)clickpadModeFormatter;
- (NSFormatter)sensitivityFormatter;
- (TVSettingsAppleRemoteFacade)init;
- (unint64_t)clickpadMode;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setClickpadMode:(unint64_t)a3;
- (void)setSensitivity:(int64_t)a3;
- (void)setTvButtonLaunchesTVApp:(BOOL)a3;
@end

@implementation TVSettingsAppleRemoteFacade

+ (id)sharedInstance
{
  if (qword_1001E1860 != -1) {
    dispatch_once(&qword_1001E1860, &stru_100191B50);
  }
  return (id)qword_1001E1858;
}

- (TVSettingsAppleRemoteFacade)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsAppleRemoteFacade;
  v2 = -[TVSettingsAppleRemoteFacade init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults"));
    [v3 addObserver:v2 forKeyPath:TVPeripheralServicesUserDefaultsKeyRemoteClickpadMode options:1 context:off_1001DFDF8];
    id v4 = sub_10007B2C4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_msgSend(v3, "tvps_remoteClickpadMode");
      *(_DWORD *)buf = 134217984;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initial clickpad mode is %lu", buf, 0xCu);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults"));
  [v3 removeObserver:self forKeyPath:TVPeripheralServicesUserDefaultsKeyRemoteClickpadMode context:off_1001DFDF8];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAppleRemoteFacade;
  -[TVSettingsAppleRemoteFacade dealloc](&v4, "dealloc");
}

- (BOOL)tvButtonLaunchesTVApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  unsigned __int8 v3 = objc_msgSend(v2, "pbs_watchListButtonBehaviorEnabled");

  return v3;
}

- (void)setTvButtonLaunchesTVApp:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[TVSettingsAppleRemoteFacade tvButtonLaunchesTVApp](self, "tvButtonLaunchesTVApp") != a3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    objc_msgSend(v4, "setPbs_watchListButtonBehaviorEnabled:", v3);

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
    +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 13LL, v5);
  }

- (BOOL)supportsClickpadModes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  unsigned __int8 v3 = [v2 supportsClickPadModes];

  return v3;
}

- (unint64_t)clickpadMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults"));
  id v3 = objc_msgSend(v2, "tvps_remoteClickpadMode");

  return (unint64_t)v3;
}

- (void)setClickpadMode:(unint64_t)a3
{
  if (-[TVSettingsAppleRemoteFacade clickpadMode](self, "clickpadMode") != a3)
  {
    id v4 = sub_10007B2C4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating clickpad mode to %lu", buf, 0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults"));
    objc_msgSend(v6, "tvps_setRemoteClickpadMode:", a3);

    if (a3) {
      uint64_t v7 = 2LL * (a3 == 1);
    }
    else {
      uint64_t v7 = 1LL;
    }
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
    v9 = (char *)[v8 remoteType];

    else {
      id v10 = (char *)v7;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007B610;
    v11[3] = &unk_100191B70;
    v11[4] = v10;
    v11[5] = 0LL;
    AnalyticsSendEventLazy(@"com.apple.appletv.settings.remote.clickpadMode.updated", v11);
  }

- (NSArray)availableClickpadModeValues
{
  return (NSArray *)&off_1001AEDD0;
}

- (NSFormatter)clickpadModeFormatter
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v4 = TSKLocStringFromBundleCachingKey(@"RCClickpadModeClickAndTouch", v3, 1LL, 0LL, @"Localizable-B519");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v7 = TSKLocStringFromBundleCachingKey(@"RCClickpadModeClickOnly", v6, 1LL, 0LL, @"Localizable-B519");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  id v10 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppleRemoteFacade availableClickpadModeValues](self, "availableClickpadModeValues"));
  v12 = -[TSKMappingFormatter initWithInputs:outputs:](v10, "initWithInputs:outputs:", v11, v9);

  return (NSFormatter *)v12;
}

- (BOOL)supportsSensitivity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  unsigned __int8 v3 = [v2 supportsTouch];

  return v3;
}

- (void)setSensitivity:(int64_t)a3
{
}

- (NSArray)availableSensitivityValues
{
  return (NSArray *)&off_1001AEDE8;
}

- (NSFormatter)sensitivityFormatter
{
  uint64_t v3 = TSKLocString(@"RCTouchpadTrackingSpeedFast");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v14 = v4;
  uint64_t v5 = TSKLocString(@"RCTouchpadTrackingSpeedMedium");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v15 = v6;
  uint64_t v7 = TSKLocString(@"RCTouchpadTrackingSpeedSlow");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 3LL));

  id v10 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAppleRemoteFacade availableSensitivityValues]( self,  "availableSensitivityValues",  v14,  v15));
  v12 = -[TSKMappingFormatter initWithInputs:outputs:](v10, "initWithInputs:outputs:", v11, v9);

  return (NSFormatter *)v12;
}

+ (BOOL)automaticallyNotifiesObserversForClickpadMode
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFDF8 == a6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tvps_userDefaults](&OBJC_CLASS___NSUserDefaults, "tvps_userDefaults", a3, a4, a5));
    id v8 = objc_msgSend(v7, "tvps_remoteClickpadMode");

    id v9 = sub_10007B2C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Clickpad mode has changed. New mode = %lu",  buf,  0xCu);
    }

    -[TVSettingsAppleRemoteFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"clickpadMode");
    -[TVSettingsAppleRemoteFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"clickpadMode");
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVSettingsAppleRemoteFacade;
    -[TVSettingsAppleRemoteFacade observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

@end