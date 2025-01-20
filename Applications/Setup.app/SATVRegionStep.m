@interface SATVRegionStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_isRegionConfigured;
- (SATVRegionViewController)regionViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleRegionSelection:(id)a3;
- (void)_resetRegionIfRequiredForContext:(id)a3;
- (void)_setRegionWithDeviceInfo:(id)a3;
- (void)_showRegionViewController;
- (void)_updatePreferredLanguages;
- (void)autoAdvance;
- (void)setRegionViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVRegionStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVRegionStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVRegionStep");
    v3 = (void *)qword_100109A00;
    qword_100109A00 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVRegionStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipRegion];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step. Since we have to skip the region step without pres entation, we commit the default region..",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    if (([v8 localeCommitted] & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[BYLocationController sharedBuddyLocationController]( &OBJC_CLASS___BYLocationController,  "sharedBuddyLocationController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 guessedCountries]);
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 firstObject]);
      v12 = (void *)v11;
      v13 = @"US";
      if (v11) {
        v13 = (__CFString *)v11;
      }
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 region]);

      if (v16) {
        v17 = v16;
      }
      else {
        v17 = v14;
      }
      [v8 setUserSetSystemRegionCode:v17];
      [v8 commitRegion];
      -[SATVRegionStep _updatePreferredLanguages](self, "_updatePreferredLanguages");
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));

    goto LABEL_31;
  }

  if (!-[SATVRegionStep _isRegionConfigured](self, "_isRegionConfigured"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 tapToSetupDeviceInfo]);

    if (v21)
    {
      v22 = (os_log_s *)qword_100109A00;
      if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "We are moving forward in the flow and TTSU has been enabled. Use iOS device region and move forward.",  v32,  2u);
      }

      -[SATVRegionStep _setRegionWithDeviceInfo:](self, "_setRegionWithDeviceInfo:", v21);

LABEL_30:
      v18 = 0LL;
      goto LABEL_31;
    }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109A00;
  if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device is in touchless set up mode..", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionStep regionViewController](self, "regionViewController"));
  [v4 autoAdvance];
}

- (void)_setRegionWithDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 region]);

  unsigned int v6 = (os_log_s *)qword_100109A00;
  if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "iOS device region: %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization availableRegions](&OBJC_CLASS___TVSInternationalization, "availableRegions"));
  v8 = (os_log_s *)qword_100109A00;
  if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "tvOS supported regions: %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  if ([v7 containsObject:v5])
  {
    v9 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Region %{public}@ is a supported system region and will be transferred to this device",  (uint8_t *)&v17,  0xCu);
    }

    [v4 setUserSetSystemRegionCode:v5];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[BYLocationController sharedBuddyLocationController]( &OBJC_CLASS___BYLocationController,  "sharedBuddyLocationController"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 guessedCountries]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v13 = (void *)v12;
    v14 = @"US";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    v16 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      v18 = v5;
      __int16 v19 = 2114;
      v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Region %{public}@ is not supported. %{public}@ is the best guessed region and will be set.",  (uint8_t *)&v17,  0x16u);
    }

    [v4 setUserSetSystemRegionCode:v15];
  }

  [v4 commitRegion];
}

- (void)_resetRegionIfRequiredForContext:(id)a3
{
  if (([a3 isNavigationFlowForward] & 1) == 0)
  {
    id v3 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear the region that has already been configured..",  v5,  2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    [v4 setLocaleCommitted:0];
  }

- (void)_showRegionViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SATVRegionViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100060AAC;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVRegionViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100060AF8;
  v5[3] = &unk_1000CADF8;
  objc_copyWeak(&v6, &location);
  -[SATVRegionViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  -[SATVRegionStep setRegionViewController:](self, "setRegionViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleRegionSelection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  if (v5)
  {
    uint64_t v9 = TVSKMetricsPayloadKeyStepSuffixRegion;
    id v10 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  else
  {
    id v6 = 0LL;
  }

  -[SATVRegionStep _updatePreferredLanguages](self, "_updatePreferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult resultWithSuccess:]( &OBJC_CLASS___TVSKBasicStepResult,  "resultWithSuccess:",  v5 != 0LL));
  [v7 setMetricsPayload:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionStep stepDelegate](self, "stepDelegate"));
  [v8 step:self didCompleteWithResult:v7];
}

- (BOOL)_isRegionConfigured
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LockdownSetLanguage"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LockdownSetLocale"]);
  unsigned __int8 v6 = [v3 languageCommitted];
  unsigned __int8 v7 = [v3 localeCommitted];
  char v8 = v6 ^ 1;
  if (!v4) {
    char v8 = 1;
  }
  if (v5) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = v7;
  }

  return v9;
}

- (void)_updatePreferredLanguages
{
  if ((_os_feature_enabled_impl("UIKit", "tv_multilingual_keyboards") & 1) != 0)
  {
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v3 languageIdentifier]);

    id v4 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting system Language: %{public}@",  (uint8_t *)&buf,  0xCu);
    }

    v29 = v17;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    [v2 setPreferredLanguages:v5 withVariants:0];

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 1;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredInputModeList]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100061104;
    v22[3] = &unk_1000CAE20;
    v22[4] = &buf;
    [v6 enumerateObjectsUsingBlock:v22];
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredLanguages]);
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale scriptCodeFromLanguage:](&OBJC_CLASS___NSLocale, "scriptCodeFromLanguage:", v11));
            if ([v12 isEqual:@"Latn"])
            {
              v14 = (os_log_s *)qword_100109A00;
              if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v23 = 138543362;
                uint64_t v24 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "English will not be explicitly added because %{public}@ is a Latin script",  v23,  0xCu);
              }

              *(_BYTE *)(*((void *)&buf + 1) + 24LL) = 0;

              goto LABEL_19;
            }
          }

          id v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVRegionViewController)regionViewController
{
  return self->_regionViewController;
}

- (void)setRegionViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end