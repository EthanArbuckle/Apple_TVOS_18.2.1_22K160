@interface SATViCloudHomeScreenSyncStep
+ (BOOL)_hasAuthenticatediCloudAccount;
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_shouldExecuteStepForContext:(id)a3;
- (SATViCloudHomeScreenSyncViewController)homeScreenSyncViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (id)triggers;
- (void)_completeStepWithConsent:(BOOL)a3;
- (void)_showHomeScreenSyncViewController;
- (void)autoAdvance;
- (void)setHomeScreenSyncViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4;
@end

@implementation SATViCloudHomeScreenSyncStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATViCloudHomeScreenSyncStep");
    v3 = (void *)qword_100109728;
    qword_100109728 = (uint64_t)v2;
  }

- (id)triggers
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerAuthentication);
}

- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = TVSKStepTriggerAuthentication;
  if ([a3 containsObject:TVSKStepTriggerAuthentication])
  {
    unsigned int v7 = [v5 shouldReset];
    v8 = (os_log_s *)qword_100109728;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v11) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Reset all cached results for the iCloud home screen sync profile prefetch task..",  (uint8_t *)&v11,  2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
      [v10 resetInfo];
    }

    else
    {
      if (v9)
      {
        int v11 = 138412290;
        uint64_t v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Perform task for the completion of the trigger event %@",  (uint8_t *)&v11,  0xCu);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
      [v10 beginFetchingCloudChangesForiCloudUser];
    }
  }
}

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVHomeScreenSyncStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  if (([v5 shouldSkipHomeScreenSync] & 1) != 0
    || [v5 isSupervised])
  {
    uint64_t v6 = (os_log_s *)qword_100109728;
    if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }

  if (!-[SATViCloudHomeScreenSyncStep _shouldExecuteStepForContext:](self, "_shouldExecuteStepForContext:", v4))
  {
    v13 = (os_log_s *)qword_100109728;
    if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Seems like we are not supposed to show ourselves.",  v33,  2u);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
    goto LABEL_6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
  unsigned int v11 = [v10 isFetchOperationInFlight];

  if (!v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cloudKitZoneIDForUser]);

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 operationError]);

    if (v17 || !v15)
    {
      v24 = (os_log_s *)qword_100109728;
      if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "We need to skip showing the pane but set the user defaults...",  v31,  2u);
      }

      +[SATViCloudHomeScreenSyncUtilities enableOrDisableHomeScreenSync:]( &OBJC_CLASS___SATViCloudHomeScreenSyncUtilities,  "enableOrDisableHomeScreenSync:",  v17 == 0LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
      goto LABEL_37;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncViewController, v19);
    id v21 = v18;
    v22 = v21;
    if (v20)
    {
      if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
        v23 = v22;
      }
      else {
        v23 = 0LL;
      }
    }

    else
    {
      v23 = 0LL;
    }

    id v25 = v23;

    unsigned int v26 = [v4 isNavigationFlowForward];
    v27 = (os_log_s *)qword_100109728;
    BOOL v28 = os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Navigation flow is forwards.", v30, 2u);
      }

      -[SATViCloudHomeScreenSyncStep _showHomeScreenSyncViewController](self, "_showHomeScreenSyncViewController");
    }

    else
    {
      if (v28)
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Navigation flow is backwards.", v29, 2u);
      }

      if (!v25)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
        goto LABEL_36;
      }

      [v25 reset];
    }

    v8 = 0LL;
LABEL_36:

LABEL_37:
    goto LABEL_7;
  }

  uint64_t v12 = (os_log_s *)qword_100109728;
  if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Seems like the cloud fetch operation hasn't completed yet. We still want to show a spinner for sometime.",  v32,  2u);
  }

  -[SATViCloudHomeScreenSyncStep _showHomeScreenSyncViewController](self, "_showHomeScreenSyncViewController");
  v8 = 0LL;
LABEL_7:

  return v8;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109728;
  if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncStep homeScreenSyncViewController](self, "homeScreenSyncViewController"));
  [v4 autoAdvance];
}

+ (BOOL)_hasAuthenticatediCloudAccount
{
  os_log_t v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)_shouldExecuteStepForContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  unsigned int v6 = [v5 isUpdate];

  if (!v6) {
    goto LABEL_5;
  }
  v8 = (os_log_s *)qword_100109728;
  if (os_log_type_enabled((os_log_t)qword_100109728, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "This is an update flow", v11, 2u);
  }

  if (!+[SATViCloudHomeScreenSyncUtilities shouldShowHomeScreenSyncPromptToUserWithStepContext:]( &OBJC_CLASS___SATViCloudHomeScreenSyncUtilities,  "shouldShowHomeScreenSyncPromptToUserWithStepContext:",  v4)) {
    unsigned __int8 v9 = 0;
  }
  else {
LABEL_5:
  }
    unsigned __int8 v9 = objc_msgSend((id)objc_opt_class(self, v7), "_hasAuthenticatediCloudAccount");

  return v9;
}

- (void)_showHomeScreenSyncViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATViCloudHomeScreenSyncViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008698;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATViCloudHomeScreenSyncViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000086E4;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATViCloudHomeScreenSyncViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  -[SATViCloudHomeScreenSyncStep setHomeScreenSyncViewController:](self, "setHomeScreenSyncViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_completeStepWithConsent:(BOOL)a3
{
  id v4 = +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(a3, a2));
  id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncStep stepDelegate](self, "stepDelegate"));
  [v5 step:self didCompleteWithResult:v6];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATViCloudHomeScreenSyncViewController)homeScreenSyncViewController
{
  return self->_homeScreenSyncViewController;
}

- (void)setHomeScreenSyncViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end