@interface SATVLoginStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_isAuthenticated;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleLoginWithResult:(unint64_t)a3;
- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3;
- (void)_showLoginViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVLoginStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVLoginStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVLoginStep");
    v3 = (void *)qword_100109A40;
    qword_100109A40 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVLoginStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  unsigned int v6 = [v5 isTapToSetupEnabled];

  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    unsigned int v10 = [v9 shouldSkipLogin];

    if (v10)
    {
      v11 = (os_log_s *)qword_100109A40;
      if (os_log_type_enabled((os_log_t)qword_100109A40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cloud config wants us to skip this step but we will fire the authentication trigger",  v20,  2u);
      }

      -[SATVLoginStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 1LL);
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
      goto LABEL_9;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone"))
    {
      id v14 = [v4 navigationFlow];
      if (v14 != (id)1)
      {
        if (!v14)
        {
          v15 = (os_log_s *)qword_100109A40;
          if (os_log_type_enabled((os_log_t)qword_100109A40, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = 0;
            v16 = (uint8_t *)&v19;
LABEL_19:
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  v16,  2u);
            goto LABEL_20;
          }

          goto LABEL_20;
        }

        goto LABEL_25;
      }

      if (v13)
      {
        [v13 reset];
        goto LABEL_25;
      }
    }

    else
    {
      if ([v4 isNavigationFlowForward])
      {
        if (!v13)
        {
          v15 = (os_log_s *)qword_100109A40;
          if (os_log_type_enabled((os_log_t)qword_100109A40, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            v16 = (uint8_t *)&v18;
            goto LABEL_19;
          }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109A40;
  if (os_log_type_enabled((os_log_t)qword_100109A40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVLoginStep _handleLoginWithResult:](self, "_handleLoginWithResult:", 0LL);
}

- (void)_showLoginViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginStep stepDelegate](self, "stepDelegate"));
  int v4 = _os_feature_enabled_impl("AppleIDSetup", "Sandstone");
  v5 = &off_1000C8778;
  if (!v4) {
    v5 = off_1000C8770;
  }
  id v6 = objc_alloc_init(*v5);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F9D8;
  v9[3] = &unk_1000C93A0;
  objc_copyWeak(&v10, &location);
  [v6 setMenuHandler:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006FA24;
  v7[3] = &unk_1000CAF80;
  objc_copyWeak(&v8, &location);
  [v6 setCompletionHandler:v7];
  [v3 step:self displayViewController:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleLoginWithResult:(unint64_t)a3
{
  if (-[SATVLoginStep _isAuthenticated](self, "_isAuthenticated")) {
    -[SATVLoginStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  if (a3 > 3) {
    id v6 = 0LL;
  }
  else {
    id v6 = *(id *)*(&off_1000CB110 + a3);
  }
  uint64_t v9 = TVSKMetricsPayloadKeyStepPrefixLogin;
  id v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  [v5 setMetricsPayload:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginStep stepDelegate](self, "stepDelegate"));
  [v8 step:self didCompleteWithResult:v5];
}

- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerAuthentication));
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
  [v5 setShouldReset:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginStep stepDelegate](self, "stepDelegate"));
  [v6 step:self triggerStatusDidChangeForTriggers:v7 context:v5];
}

- (BOOL)_isAuthenticated
{
  os_log_t v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  BOOL v4 = v3 != 0LL;

  return v4;
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