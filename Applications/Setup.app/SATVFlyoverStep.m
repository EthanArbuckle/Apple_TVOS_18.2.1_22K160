@interface SATVFlyoverStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_enableFlyover:(BOOL)a3;
- (void)_enableFlyoverAndCompleteStep:(BOOL)a3;
- (void)_reset;
- (void)_showFlyoverViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVFlyoverStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVFlyoverStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVFlyoverStep");
    v3 = (void *)qword_1001097F8;
    qword_1001097F8 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVFlyoverStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipFlyover];

  if (v6)
  {
    v7 = (os_log_s *)qword_1001097F8;
    if (os_log_type_enabled((os_log_t)qword_1001097F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
    }

    -[SATVFlyoverStep _enableFlyover:](self, "_enableFlyover:", 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
  }

  else
  {
    if ([v4 isNavigationFlowForward])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___SATVFlyoverViewController, v10);
      id v12 = v9;
      v13 = v12;
      if (v11)
      {
        if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
          v14 = v13;
        }
        else {
          v14 = 0LL;
        }
      }

      else
      {
        v14 = 0LL;
      }

      id v15 = v14;

      if (!v15)
      {
        v16 = (os_log_s *)qword_1001097F8;
        if (os_log_type_enabled((os_log_t)qword_1001097F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  v18,  2u);
        }

        -[SATVFlyoverStep _showFlyoverViewController](self, "_showFlyoverViewController");
      }
    }

    else
    {
      -[SATVFlyoverStep _reset](self, "_reset");
    }

    v8 = 0LL;
  }

  return v8;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_1001097F8;
  if (os_log_type_enabled((os_log_t)qword_1001097F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVFlyoverStep _enableFlyoverAndCompleteStep:](self, "_enableFlyoverAndCompleteStep:", 0LL);
}

- (void)_reset
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVIEntryManager sharedEntryManager](&OBJC_CLASS___TVIEntryManager, "sharedEntryManager"));
  [v2 setEntryRefreshInterval:0];
}

- (void)_showFlyoverViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVFlyoverViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021BEC;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVFlyoverViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100021C38;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVFlyoverViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_enableFlyoverAndCompleteStep:(BOOL)a3
{
  BOOL v3 = a3;
  -[SATVFlyoverStep _enableFlyover:](self, "_enableFlyover:");
  id v6 = +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v3, v5));
  id v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverStep stepDelegate](self, "stepDelegate"));
  [v7 step:self didCompleteWithResult:v8];
}

- (void)_enableFlyover:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVIEntryManager sharedEntryManager](&OBJC_CLASS___TVIEntryManager, "sharedEntryManager"));
  [v4 setEntryRefreshInterval:v3];
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