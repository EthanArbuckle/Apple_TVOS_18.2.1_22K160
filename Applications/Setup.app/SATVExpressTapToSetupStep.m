@interface SATVExpressTapToSetupStep
+ (NSString)stableIdentifier;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleExpressSetupConsent:(BOOL)a3 itemTypes:(unint64_t)a4;
- (void)_notifyDeviceActivationTriggerStatusChangeWithReset:(BOOL)a3 didConsentToExpressSetup:(BOOL)a4;
- (void)_showExpressSetupViewControllerWithDataSource:(id)a3;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVExpressTapToSetupStep

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVExpressTapToSetupStep";
}

- (id)executeStepForContext:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stepConfiguration]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupStepConfiguration);
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

  id v11 = v10;

  if (!v11)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"configuration"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079538(a2, (uint64_t)self, (uint64_t)v38);
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x10006677CLL);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v13 = [v12 shouldSkipChooseSetupMethod];

  if (v13)
  {
    id v14 = sub_10002B0E4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[SATVExpressTapToSetupStepResult managedConfigurationSkipResult]( &OBJC_CLASS___SATVExpressTapToSetupStepResult,  "managedConfigurationSkipResult"));
LABEL_11:
    v17 = (void *)v16;
    goto LABEL_30;
  }

  if (![v5 isNavigationFlowForward])
  {
    id v29 = sub_10002B0E4();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear anything that was previously set up for this step",  buf,  2u);
    }

    -[SATVExpressTapToSetupStep _notifyDeviceActivationTriggerStatusChangeWithReset:didConsentToExpressSetup:]( self,  "_notifyDeviceActivationTriggerStatusChangeWithReset:didConsentToExpressSetup:",  1LL,  0LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 stepViewController]);
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupViewController);
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

    if (v36)
    {
      v17 = 0LL;
      goto LABEL_30;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[SATVExpressTapToSetupStepResult successResult]( &OBJC_CLASS___SATVExpressTapToSetupStepResult,  "successResult"));
    goto LABEL_11;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 setupSession]);
  v19 = objc_alloc(&OBJC_CLASS___SATVExpressTapToSetupDataSource);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 tapToSetupDeviceInfo]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v11 expressTapToSetupItemProviderClasses]);
  v22 = -[SATVExpressTapToSetupDataSource initWithTapToSetupDeviceInfo:expressTapToSetupItemProviderClasses:]( v19,  "initWithTapToSetupDeviceInfo:expressTapToSetupItemProviderClasses:",  v20,  v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource items](v22, "items"));
  id v24 = [v23 count];

  id v25 = sub_10002B0E4();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupDataSource items](v22, "items"));
      *(_DWORD *)buf = 138412290;
      v40 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step. items=%@",  buf,  0xCu);
    }

    -[SATVExpressTapToSetupStep _showExpressSetupViewControllerWithDataSource:]( self,  "_showExpressSetupViewControllerWithDataSource:",  v22);
    v17 = 0LL;
  }

  else
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Express Tap-To-Setup is not available as we have no items to show. Skip executing this step.",  buf,  2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SATVExpressTapToSetupStepResult successResult]( &OBJC_CLASS___SATVExpressTapToSetupStepResult,  "successResult"));
  }

LABEL_30:
  return v17;
}

- (void)autoAdvance
{
  id v3 = sub_10002B0E4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auto advance mode is on..", v5, 2u);
  }

  -[SATVExpressTapToSetupStep _handleExpressSetupConsent:itemTypes:]( self,  "_handleExpressSetupConsent:itemTypes:",  0LL,  0LL);
}

- (void)_showExpressSetupViewControllerWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = -[SATVExpressTapToSetupViewController initWithDataSource:]( objc_alloc(&OBJC_CLASS___SATVExpressTapToSetupViewController),  "initWithDataSource:",  v4);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100066914;
  v8[3] = &unk_1000CA610;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  -[SATVExpressTapToSetupViewController setCompletionHandler:](v5, "setCompletionHandler:", v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupStep stepDelegate](self, "stepDelegate"));
  [v7 step:self displayViewController:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleExpressSetupConsent:(BOOL)a3 itemTypes:(unint64_t)a4
{
  BOOL v5 = a3;
  -[SATVExpressTapToSetupStep _notifyDeviceActivationTriggerStatusChangeWithReset:didConsentToExpressSetup:]( self,  "_notifyDeviceActivationTriggerStatusChangeWithReset:didConsentToExpressSetup:",  0LL,  a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SATVExpressTapToSetupStepResult successResultWithConsent:]( &OBJC_CLASS___SATVExpressTapToSetupStepResult,  "successResultWithConsent:",  v5));
  [v8 setItemTypes:a4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupStep stepDelegate](self, "stepDelegate"));
  [v7 step:self didCompleteWithResult:v8];
}

- (void)_notifyDeviceActivationTriggerStatusChangeWithReset:(BOOL)a3 didConsentToExpressSetup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = sub_10002B0E4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109376;
    v13[1] = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending device activation trigger status did change. shouldReset=%{BOOL}d, didConsentToExpressSetup=%{BOOL}d",  (uint8_t *)v13,  0xEu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
  [v9 setShouldReset:v5];
  objc_msgSend(v9, "_setExpressTapToSetupEnabledOverride:", TVCSTriStateBoolForBool(v4, v10));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerDeviceActivation));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupStep stepDelegate](self, "stepDelegate"));
  [v12 step:self triggerStatusDidChangeForTriggers:v11 context:v9];
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