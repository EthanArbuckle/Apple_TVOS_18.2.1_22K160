@interface SATVLanguageStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_didLockdownSetLanguage;
- (BOOL)_setLanguageWithDeviceInfo:(id)a3;
- (SATVLanguageViewController)languageViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleLanguageSelection:(id)a3;
- (void)_resetLanguageIfRequiredForContext:(id)a3;
- (void)_showLanguageViewController;
- (void)autoAdvance;
- (void)didPerformTapToSetupWithDeviceInfo:(id)a3;
- (void)setLanguageViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVLanguageStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVLanguageStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVLanguageStep");
    v3 = (void *)qword_100109A28;
    qword_100109A28 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVLanguageStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipLanguage];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109A28;
    if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step. Since we have to skip the language step without pr esentation, we commit the default language..",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    if ([v8 languageCommitted])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 orderedLanguageCodes]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 firstObject]);
      v15 = (void *)v14;
      v16 = @"en";
      if (v14) {
        v16 = (__CFString *)v14;
      }
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 language]);
      v20 = (void *)v19;
      if (v19) {
        v21 = (void *)v19;
      }
      else {
        v21 = v17;
      }
      id v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue([v8 languageCodeWithGuessedRegionForCode:v22]);
      [v8 setUserSetSystemLanguageCode:v23];
      unsigned int v24 = [v8 commitLanguageWillRestartSystem];
      [v8 commitLanguage];
      if (v24)
      {
        v25 = (os_log_s *)qword_100109A28;
        if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Language commit will cause restart. Holding..",  v43,  2u);
        }

        v9 = 0LL;
      }

      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
      }
    }

    goto LABEL_41;
  }

  if (-[SATVLanguageStep _didLockdownSetLanguage](self, "_didLockdownSetLanguage"))
  {
    v10 = (os_log_s *)qword_100109A28;
    if (!os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
      goto LABEL_41;
    }

    *(_WORD *)v42 = 0;
    v11 = "Lockdown has configured the device language..";
    v12 = v42;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    goto LABEL_10;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  unsigned int v27 = [v26 languageCommitted];

  if (v27)
  {
    v10 = (os_log_s *)qword_100109A28;
    if (!os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v41 = 0;
    v11 = "We are moving forward in the flow and seems like the language has already been committed. Skip";
    v12 = (uint8_t *)&v41;
    goto LABEL_9;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 tapToSetupDeviceInfo]);

  if (v29)
  {
    v30 = (os_log_s *)qword_100109A28;
    if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "We are moving forward in the flow and TTSU has been enabled. Use iOS device language if supported and move forward.",  v40,  2u);
    }

    -[SATVLanguageStep _setLanguageWithDeviceInfo:](self, "_setLanguageWithDeviceInfo:", v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  }

  else
  {
LABEL_31:
    -[SATVLanguageStep _resetLanguageIfRequiredForContext:](self, "_resetLanguageIfRequiredForContext:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___SATVLanguageViewController);
    id v33 = v31;
    v34 = v33;
    if (v32)
    {
      if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0) {
        v35 = v34;
      }
      else {
        v35 = 0LL;
      }
    }

    else
    {
      v35 = 0LL;
    }

    id v36 = v35;

    if (!v36)
    {
      v37 = (os_log_s *)qword_100109A28;
      if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Present a view controller for this step..",  v39,  2u);
      }

      -[SATVLanguageStep _showLanguageViewController](self, "_showLanguageViewController");
    }

    v9 = 0LL;
  }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109A28;
  if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageStep languageViewController](self, "languageViewController"));
  [v4 autoAdvance];
}

- (void)didPerformTapToSetupWithDeviceInfo:(id)a3
{
  if (!-[SATVLanguageStep _setLanguageWithDeviceInfo:](self, "_setLanguageWithDeviceInfo:", a3))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVLanguageStep stepDelegate](self, "stepDelegate"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    [v5 step:self didCompleteWithResult:v4];
  }

- (BOOL)_setLanguageWithDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization allSupportedSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "allSupportedSystemLanguages"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCodes]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 firstSupportedLanguageFromLanguages:v6]);
  if (v7)
  {
    v8 = (os_log_s *)qword_100109A28;
    if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      uint64_t v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ will be transferred to this device.",  (uint8_t *)&v18,  0xCu);
    }

    [v4 setUserSetSystemLanguageCode:v7];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 orderedLanguageCodes]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 firstObject]);
    v11 = (void *)v10;
    v12 = @"en";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v13 = v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCodeWithGuessedRegionForCode:v13]);
    v15 = (os_log_s *)qword_100109A28;
    if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      uint64_t v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No supported language in iOS preferred languages.  %{public}@ is the best guessed language and will be set.",  (uint8_t *)&v18,  0xCu);
    }

    [v4 setUserSetSystemLanguageCode:v14];
  }

  unsigned __int8 v16 = [v4 commitLanguageWillRestartSystem];
  [v4 commitLanguage];

  return v16;
}

- (BOOL)_didLockdownSetLanguage
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LockdownSetLanguage"]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_resetLanguageIfRequiredForContext:(id)a3
{
  if (([a3 isNavigationFlowForward] & 1) == 0)
  {
    id v3 = (os_log_s *)qword_100109A28;
    if (os_log_type_enabled((os_log_t)qword_100109A28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear any language code that has already been set..",  v5,  2u);
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    [v4 setLanguageCommitted:0];
  }

- (void)_showLanguageViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SATVLanguageViewController);
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_100062CDC;
  v8 = &unk_1000CADF8;
  objc_copyWeak(&v9, &location);
  -[SATVLanguageViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  -[SATVLanguageStep setLanguageViewController:](self, "setLanguageViewController:", v3, v5, v6, v7, v8);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleLanguageSelection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  if (v5)
  {
    uint64_t v9 = TVSKMetricsPayloadKeyStepSuffixLanguage;
    id v10 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult resultWithSuccess:]( &OBJC_CLASS___TVSKBasicStepResult,  "resultWithSuccess:",  v5 != 0LL));
  [v7 setMetricsPayload:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageStep stepDelegate](self, "stepDelegate"));
  [v8 step:self didCompleteWithResult:v7];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVLanguageViewController)languageViewController
{
  return self->_languageViewController;
}

- (void)setLanguageViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end