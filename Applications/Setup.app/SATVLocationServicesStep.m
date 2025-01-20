@interface SATVLocationServicesStep
+ (NSString)stableIdentifier;
+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3;
+ (int)_authorizationForIdentifier:(id)a3 locationServicesAuthorizationInfo:(id)a4;
+ (int)_defaultAuthorizationForIdentifier:(id)a3;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleEnableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithEnableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4;
- (void)_enableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4;
- (void)_enableLocationServicesByDefault;
- (void)_reset;
- (void)_showLocationServicesViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVLocationServicesStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVLocationServicesStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVLocationServicesStep");
    v3 = (void *)qword_100109790;
    qword_100109790 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVLocationServicesStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipLocationServices];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109790;
    if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  (uint8_t *)v25,  2u);
    }

    -[SATVLocationServicesStep _enableLocationServicesByDefault](self, "_enableLocationServicesByDefault");
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_24;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SATVLocationServicesViewController, v11);
  id v13 = v10;
  v14 = v13;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      v15 = v14;
    }
    else {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  unint64_t v16 = v15;

  if (![v4 isNavigationFlowForward])
  {
    -[SATVLocationServicesStep _reset](self, "_reset");
    if (v16)
    {
      uint64_t v9 = 0LL;
      goto LABEL_24;
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
    goto LABEL_5;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  if ([v17 isExpressTapToSetupEnabledForItemTypes:8])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 tapToSetupDeviceInfo]);
    uint64_t v19 = TVCSBoolForTriStateBool([v18 isLocationServicesEnabled], 0);

    v20 = (os_log_s *)qword_100109790;
    if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 67109120;
      v25[1] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup is enabled and location services was shown to the user. Will apply location services settin g and skip step. enableLocationServices=%{BOOL}d",  (uint8_t *)v25,  8u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v17 tapToSetupDeviceInfo]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 locationServicesAuthorizationInfo]);

    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SATVLocationServicesStep _handleEnableLocationServices:locationServicesAuthorizationInfo:]( self,  "_handleEnableLocationServices:locationServicesAuthorizationInfo:",  v19,  v22));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (!(v9 | v16))
  {
    v23 = (os_log_s *)qword_100109790;
    if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  (uint8_t *)v25,  2u);
    }

    -[SATVLocationServicesStep _showLocationServicesViewController](self, "_showLocationServicesViewController");
  }

LABEL_24:
  return (id)v9;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109790;
  if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVLocationServicesStep _completeStepWithEnableLocationServices:locationServicesAuthorizationInfo:]( self,  "_completeStepWithEnableLocationServices:locationServicesAuthorizationInfo:",  1LL,  0LL);
}

+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isLocationServicesEnabled] == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 locationServicesAuthorizationInfo]);
    if (v4)
    {
      id v5 = objc_alloc(&OBJC_CLASS___TVSKExpressTapToSetupItem);
      id v6 = sub_10000D7CC(@"EXPRESS_SETUP_LOCATION_INFO", @"Localizable");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v8 = [v5 initWithTypes:8 descriptionText:v7 imageSymbolName:@"location.fill" imageSymbolScale:2];
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_enableLocationServicesByDefault
{
}

- (void)_showLocationServicesViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SATVLocationServicesViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011530;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVLocationServicesViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001157C;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVLocationServicesViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLocationServicesStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_handleEnableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4
{
  BOOL v4 = a3;
  -[SATVLocationServicesStep _enableLocationServices:locationServicesAuthorizationInfo:]( self,  "_enableLocationServices:locationServicesAuthorizationInfo:",  a3,  a4);
  return +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v4, v5));
}

- (void)_completeStepWithEnableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[SATVLocationServicesStep _handleEnableLocationServices:locationServicesAuthorizationInfo:]( self,  "_handleEnableLocationServices:locationServicesAuthorizationInfo:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLocationServicesStep stepDelegate](self, "stepDelegate"));
  [v5 step:self didCompleteWithResult:v6];
}

- (void)_enableLocationServices:(BOOL)a3 locationServicesAuthorizationInfo:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  +[CLLocationManager setLocationServicesEnabled:](&OBJC_CLASS___CLLocationManager, "setLocationServicesEnabled:", v4);
  id v8 = objc_msgSend( (id)objc_opt_class(self, v7),  "_authorizationForIdentifier:locationServicesAuthorizationInfo:",  @"com.apple.locationd.bundle-/System/Library/LocationBundles/TimeZone.bundle",  v6);
  if ((_DWORD)v8 == 3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  [v9 setAutomaticTimeZoneSelectionEnabled:v4];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/LocationBundles/TimeZone.bundle"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v8,  v10);

  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundleIdentifier:",  v8,  @"com.apple.PineBoard");
  id v12 = objc_msgSend( (id)objc_opt_class(self, v11),  "_authorizationForIdentifier:locationServicesAuthorizationInfo:",  @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/AssistantServices.framework",  v6);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/AssistantServices.framework"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v12,  v13);

  id v15 = objc_msgSend( (id)objc_opt_class(self, v14),  "_authorizationForIdentifier:locationServicesAuthorizationInfo:",  @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/HomeKitDaemon.framework",  v6);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/HomeKitDaemon.framework"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v15,  v16);

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v17 setObject:&__kCFBooleanTrue forKey:@"LocationServices5Presented"];
}

- (void)_reset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  [v3 setAutomaticTimeZoneSelectionEnabled:0];

  id v5 = objc_msgSend( (id)objc_opt_class(self, v4),  "_defaultAuthorizationForIdentifier:",  @"com.apple.locationd.bundle-/System/Library/LocationBundles/TimeZone.bundle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/LocationBundles/TimeZone.bundle"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v5,  v6);

  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:]( CLLocationManager,  "setAuthorizationStatusByType:forBundleIdentifier:",  objc_msgSend((id)objc_opt_class(self, v7), "_defaultAuthorizationForIdentifier:", @"com.apple.PineBoard"),  @"com.apple.PineBoard");
  id v9 = objc_msgSend( (id)objc_opt_class(self, v8),  "_defaultAuthorizationForIdentifier:",  @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/AssistantServices.framework");
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/AssistantServices.framework"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v9,  v10);

  id v12 = objc_msgSend( (id)objc_opt_class(self, v11),  "_defaultAuthorizationForIdentifier:",  @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/HomeKitDaemon.framework");
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/HomeKitDaemon.framework"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v12,  v13);

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v14 setObject:&__kCFBooleanFalse forKey:@"LocationServices5Presented"];
}

+ (int)_defaultAuthorizationForIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.locationd.bundle-/System/Library/LocationBundles/TimeZone.bundle"] & 1) != 0 || (objc_msgSend( v3,  "isEqualToString:",  @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/HomeKitDaemon.framework") & 1) != 0 || (objc_msgSend(v3, "isEqualToString:", @"com.apple.PineBoard"))
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/AssistantServices.framework"])
  {
    int v4 = 4;
  }

  else
  {
    id v6 = (os_log_s *)qword_100109790;
    if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_ERROR)) {
      sub_100076300((uint64_t)v3, v6);
    }
    int v4 = 2;
  }

  return v4;
}

+ (int)_authorizationForIdentifier:(id)a3 locationServicesAuthorizationInfo:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bs_safeNumberForKey:", v6));
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = 2;
    switch((unint64_t)[v7 unsignedIntegerValue])
    {
      case 0uLL:
        goto LABEL_6;
      case 1uLL:
        break;
      case 2uLL:
        int v9 = 4;
        break;
      case 4uLL:
        int v9 = 3;
        break;
      default:
        v10 = (os_log_s *)qword_100109790;
        if (os_log_type_enabled((os_log_t)qword_100109790, OS_LOG_TYPE_ERROR)) {
          sub_100076374((uint64_t)v6, (uint64_t)v8, v10);
        }
        goto LABEL_6;
    }
  }

  else
  {
LABEL_6:
    int v9 = [a1 _defaultAuthorizationForIdentifier:v6];
  }

  return v9;
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end