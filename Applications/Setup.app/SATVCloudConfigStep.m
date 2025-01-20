@interface SATVCloudConfigStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_shouldShowCloudConfigUI;
- (SATVCloudConfigContainerViewController)cloudConfigContainerViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithCloudConfigSuccess:(BOOL)a3;
- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3;
- (void)_showCloudConfigContainerViewController;
- (void)autoAdvance;
- (void)setCloudConfigContainerViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVCloudConfigStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVCloudConfigStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVCloudConfigStep");
    v3 = (void *)qword_100109960;
    qword_100109960 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVCloudConfigStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  unsigned int v6 = [v5 isTapToSetupEnabled];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109960;
    if (os_log_type_enabled((os_log_t)qword_100109960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tap-to-setup is enabled so will skip executing this step.",  buf,  2u);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
LABEL_17:
    v17 = (void *)v8;
    goto LABEL_24;
  }

  if (!-[SATVCloudConfigStep _shouldShowCloudConfigUI](self, "_shouldShowCloudConfigUI"))
  {
    v16 = (os_log_s *)qword_100109960;
    if (os_log_type_enabled((os_log_t)qword_100109960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "We don't want to show the cloud config UI. Will skip executing this step but we will fire the activation trigger.",  v23,  2u);
    }

    -[SATVCloudConfigStep _notifyTriggerStatusChangeAndReset:]( self,  "_notifyTriggerStatusChangeAndReset:",  [v4 isNavigationFlowForward] ^ 1);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_17;
  }

  if (([v4 isNavigationFlowForward] & 1) == 0)
  {
    v9 = (os_log_s *)qword_100109960;
    if (os_log_type_enabled((os_log_t)qword_100109960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear anything that was previously set up for this step..",  v22,  2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    [v10 reset];

    -[SATVCloudConfigStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 1LL);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SATVCloudConfigContainerViewController);
  id v13 = v11;
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

  id v18 = v15;

  if (!v18)
  {
    v19 = (os_log_s *)qword_100109960;
    if (os_log_type_enabled((os_log_t)qword_100109960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We don't have a cloud config view controller. Present one..",  v21,  2u);
    }

    -[SATVCloudConfigStep _showCloudConfigContainerViewController](self, "_showCloudConfigContainerViewController");
  }

  v17 = 0LL;
LABEL_24:

  return v17;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109960;
  if (os_log_type_enabled((os_log_t)qword_100109960, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Touchless set up mode is enabled for the device...",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigStep cloudConfigContainerViewController](self, "cloudConfigContainerViewController"));
  [v4 autoAdvance];
}

- (BOOL)_shouldShowCloudConfigUI
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  if ([v2 isMDMConfiguration])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned __int8 v4 = [v3 shouldShowCloudConfigurationUI];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_showCloudConfigContainerViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVCloudConfigContainerViewController);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100046D18;
  v12[3] = &unk_1000C93A0;
  objc_copyWeak(&v13, &location);
  -[SATVCloudConfigContainerViewController setMenuHandler:](v3, "setMenuHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100046D64;
  v10[3] = &unk_1000C93A0;
  objc_copyWeak(&v11, &location);
  -[SATVCloudConfigContainerViewController setCloudConfigFetchFailureHandler:]( v3,  "setCloudConfigFetchFailureHandler:",  v10);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_100046D94;
  uint64_t v8 = &unk_1000C93A0;
  objc_copyWeak(&v9, &location);
  -[SATVCloudConfigContainerViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  -[SATVCloudConfigStep setCloudConfigContainerViewController:]( self,  "setCloudConfigContainerViewController:",  v3,  v5,  v6,  v7,  v8);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_completeStepWithCloudConfigSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigStep stepDelegate](self, "stepDelegate"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    [v6 step:self didCompleteWithResult:v5];
  }

  else
  {
    [v6 didCancelStep:self];
  }
}

- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerDeviceActivation));
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
  [v5 setShouldReset:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigStep stepDelegate](self, "stepDelegate"));
  [v6 step:self triggerStatusDidChangeForTriggers:v7 context:v5];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVCloudConfigContainerViewController)cloudConfigContainerViewController
{
  return self->_cloudConfigContainerViewController;
}

- (void)setCloudConfigContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end