@interface SATVTimeZoneStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStep;
- (void)_handleSelectedCity:(id)a3;
- (void)_setTimeZone:(id)a3 timeZoneCityID:(id)a4;
- (void)_setTimeZoneWithCity:(id)a3;
- (void)_showTimeZoneViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVTimeZoneStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVTimeZoneStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVTimeZoneStep");
    v3 = (void *)qword_100109908;
    qword_100109908 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVTimeZoneStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  if (+[CLLocationManager locationServicesEnabled:]( &OBJC_CLASS___CLLocationManager,  "locationServicesEnabled:",  0LL))
  {
    v5 = (os_log_s *)qword_100109908;
    if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Location services was enabled. Don't show.",  (uint8_t *)&v22,  2u);
    }

    goto LABEL_16;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SATVTimeZoneViewController);
  id v8 = v6;
  v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      v10 = v9;
    }
    else {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  unint64_t v11 = v10;

  if ([v4 isNavigationFlowForward])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tapToSetupDeviceInfo]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 timeZone]);
    if (v14)
    {
      v15 = (os_log_s *)qword_100109908;
      if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Tap-To-Setup device info info has a time zone. TimeZone=%@. Will use it and finish this step.",  (uint8_t *)&v22,  0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](&OBJC_CLASS___ALCityManager, "sharedManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 defaultCityForTimeZone:v14]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 classicIdentifier]);

      -[SATVTimeZoneStep _setTimeZone:timeZoneCityID:](self, "_setTimeZone:timeZoneCityID:", v14, v18);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    if (!(v19 | v11))
    {
      v20 = (os_log_s *)qword_100109908;
      if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  (uint8_t *)&v22,  2u);
      }

      -[SATVTimeZoneStep _showTimeZoneViewController](self, "_showTimeZoneViewController");
    }
  }

  else
  {
    if (!v11)
    {
LABEL_16:
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
      goto LABEL_23;
    }

    uint64_t v19 = 0LL;
  }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109908;
  if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVTimeZoneStep _completeStep](self, "_completeStep");
}

- (void)_showTimeZoneViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVTimeZoneViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100039DB4;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVTimeZoneViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100039E00;
  v5[3] = &unk_1000CA2B0;
  objc_copyWeak(&v6, &location);
  -[SATVTimeZoneViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleSelectedCity:(id)a3
{
}

- (void)_setTimeZoneWithCity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 timeZone]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v5));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 classicIdentifier]);
  -[SATVTimeZoneStep _setTimeZone:timeZoneCityID:](self, "_setTimeZone:timeZoneCityID:", v7, v6);
}

- (void)_setTimeZone:(id)a3 timeZoneCityID:(id)a4
{
  id v5 = a3;
  id v6 = (char *)a4;
  +[CLLocationManager setLocationServicesEnabled:](&OBJC_CLASS___CLLocationManager, "setLocationServicesEnabled:", 0LL);
  TMSetAutomaticTimeZoneEnabled(0LL);
  id v7 = (os_log_s *)qword_100109908;
  if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Setting time zone to %@ for city ID %@",  (uint8_t *)&v14,  0x16u);
  }

  id v8 = objc_claimAutoreleasedReturnValue([v5 name]);
  int v9 = tzlink([v8 UTF8String]);

  if (v9)
  {
    v10 = (void *)qword_100109908;
    if (os_log_type_enabled((os_log_t)qword_100109908, OS_LOG_TYPE_INFO))
    {
      unint64_t v11 = v10;
      v12 = strerror(v9);
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2080;
      v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "failed to change timezone to %@: %s",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.preferences.datetime"));
    [v13 setObject:v6 forKey:@"timezone"];
    [v13 setBool:1 forKey:@"timezoneset"];
    [v13 synchronize];
    +[NSTimeZone resetSystemTimeZone](&OBJC_CLASS___NSTimeZone, "resetSystemTimeZone");
  }
}

- (void)_completeStep
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneStep stepDelegate](self, "stepDelegate"));
  [v3 step:self didCompleteWithResult:v4];
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