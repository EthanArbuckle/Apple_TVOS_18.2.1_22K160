@interface VSSetupStep
+ (NSString)stableIdentifier;
- (BOOL)_shouldExecuteStepWithContext:(id)a3;
- (BOOL)_shouldSkipWithSetupSession:(id)a3;
- (TVSKStepDelegate)stepDelegate;
- (VSSetupContainerViewController)setupContainerViewController;
- (id)_lazySetupContainerViewController;
- (id)executeStepForContext:(id)a3;
- (id)triggers;
- (void)_showVideoSubscriberContainerViewControllerWithStepContext:(id)a3;
- (void)autoAdvance;
- (void)setSetupContainerViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4;
@end

@implementation VSSetupStep

- (id)triggers
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerDeviceActivation);
}

- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4
{
  id v6 = a4;
  if ([a3 containsObject:TVSKStepTriggerDeviceActivation])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 setupSession]);
    unsigned __int8 v8 = -[VSSetupStep _shouldSkipWithSetupSession:](self, "_shouldSkipWithSetupSession:", v7);

    if ((v8 & 1) == 0)
    {
      id v9 = [v6 shouldReset];
      if ((v9 & 1) == 0)
      {
        uint64_t v10 = VSDefaultLogObject(v9);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Device has been activated. Will start set-top-box silent sign-in.",  v13,  2u);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupStep _lazySetupContainerViewController](self, "_lazySetupContainerViewController"));
        [v12 startSetTopBoxSilentSignIn];
      }
    }
  }
}

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVVSAStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___VSSetupContainerViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    [v4 isNavigationFlowForward];
    id v7 = 0LL;
    goto LABEL_8;
  }

  id v7 = v5;
  id v8 = [v4 isNavigationFlowForward];
  if ((v8 & 1) != 0 || !v7)
  {
LABEL_8:
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    unsigned int v12 = -[VSSetupStep _shouldSkipWithSetupSession:](self, "_shouldSkipWithSetupSession:", v11);

    if (v12)
    {
      uint64_t v14 = VSDefaultLogObject(v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "Skip executing this step due to managed configuration.",  v26,  2u);
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
    }

    else
    {
      BOOL v17 = -[VSSetupStep _shouldExecuteStepWithContext:](self, "_shouldExecuteStepWithContext:", v4);
      BOOL v18 = v17;
      uint64_t v19 = VSDefaultLogObject(v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Display the setup view controller", v24, 2u);
        }

        -[VSSetupStep _showVideoSubscriberContainerViewControllerWithStepContext:]( self,  "_showVideoSubscriberContainerViewControllerWithStepContext:",  v4);
        goto LABEL_16;
      }

      if (v21)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "Skip executing this step as the VSA view controller does not need to be shown.",  v25,  2u);
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    }

    v22 = (void *)v16;
    goto LABEL_21;
  }

  uint64_t v9 = VSDefaultLogObject(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards and we already have a view controller in the stack. Reset and display again..",  buf,  2u);
  }

  [v7 reset];
LABEL_16:
  v22 = 0LL;
LABEL_21:

  return v22;
}

- (void)autoAdvance
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v6,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupStep setupContainerViewController](self, "setupContainerViewController"));
  [v5 autoAdvance];
}

- (BOOL)_shouldExecuteStepWithContext:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 setupSession]);
  unsigned int v5 = [v4 isUpdate];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    unsigned __int8 v7 = -[VSPreferences shouldSkipSetup](v6, "shouldSkipSetup");
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 previousExecutionRecord]);
    id v9 = [v8 setupVersion];
    BOOL v10 = (unint64_t)v9 < TVSKSetupVersionStepExecutionRecords;

    char v11 = v10 & ~v7;
  }

  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_shouldSkipWithSetupSession:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedConfigurationState]);
  unsigned __int8 v5 = [v4 shouldSkipVideoSubscriberAccount];
  unsigned int v6 = [v3 isUpdate];

  unsigned __int8 v7 = v6 | v5;
  if (v6 && (v5 & 1) == 0) {
    unsigned __int8 v7 = [v4 isSupervised];
  }

  return v7;
}

- (id)_lazySetupContainerViewController
{
  id v3 = (VSSetupContainerViewController *)objc_claimAutoreleasedReturnValue( -[VSSetupStep setupContainerViewController]( self,  "setupContainerViewController"));
  if (!v3)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___VSSetupContainerViewController);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_150CC;
    v7[3] = &unk_25010;
    objc_copyWeak(&v8, &location);
    -[VSSetupContainerViewController setMenuHandler:](v3, "setMenuHandler:", v7);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_15124;
    v5[3] = &unk_25060;
    objc_copyWeak(&v6, &location);
    -[VSSetupContainerViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
    -[VSSetupStep setSetupContainerViewController:](self, "setSetupContainerViewController:", v3);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)_showVideoSubscriberContainerViewControllerWithStepContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupStep _lazySetupContainerViewController](self, "_lazySetupContainerViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tapToSetupDeviceInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoSubscriberAccountData]);

  if (v8)
  {
    uint64_t v10 = VSDefaultLogObject(v9);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Passing serialized account data to setup container view controller. videoSubscriberAccountData=%@",  (uint8_t *)&v13,  0xCu);
    }

    [v5 setSerializedAccountData:v8];
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupStep stepDelegate](self, "stepDelegate"));
  [v12 step:self displayViewController:v5];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (VSSetupContainerViewController)setupContainerViewController
{
  return self->_setupContainerViewController;
}

- (void)setSetupContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end