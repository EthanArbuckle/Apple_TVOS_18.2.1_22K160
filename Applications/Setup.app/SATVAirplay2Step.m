@interface SATVAirplay2Step
+ (BOOL)_isSupportedForUpgradeWithContext:(id)a3;
+ (BOOL)_isSupportedWithSetupSession:(id)a3;
+ (NSString)stableIdentifier;
- (SATVAirplay2ViewController)airplay2ViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithDidSetupHomeTheater:(BOOL)a3;
- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3;
- (void)_showAirplay2ViewControllerWithHomeKitInfo:(id)a3 isUpdateFlow:(BOOL)a4;
- (void)autoAdvance;
- (void)setAirplay2ViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVAirplay2Step

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVRoomNameStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipRoom];

  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___SATVAirplay2ViewController, v12);
    id v14 = v11;
    v15 = v14;
    if (v13)
    {
      if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
        v16 = v15;
      }
      else {
        v16 = 0LL;
      }
    }

    else
    {
      v16 = 0LL;
    }

    id v17 = v16;

    unsigned int v18 = [v4 isNavigationFlowForward];
    id v19 = sub_10002B004();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        LOWORD(v38) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is forwards..",  (uint8_t *)&v38,  2u);
      }

      if ([v10 isUpdate])
      {
      }

      else
      {
        id v23 = sub_10002B004();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Set up flow...", (uint8_t *)&v38, 2u);
        }
      }
    }

    else
    {
      if (v21)
      {
        LOWORD(v38) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is backwards..",  (uint8_t *)&v38,  2u);
      }

      if (v17) {
        goto LABEL_28;
      }
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    if (v26)
    {
      v9 = (void *)v26;
      id v27 = sub_10002B004();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "We need to skip showing ourselves..",  (uint8_t *)&v38,  2u);
      }

      -[SATVAirplay2Step _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
      goto LABEL_38;
    }

- (void)autoAdvance
{
  id v3 = sub_10002B004();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v5,  2u);
  }

  -[SATVAirplay2Step _completeStepWithDidSetupHomeTheater:](self, "_completeStepWithDidSetupHomeTheater:", 0LL);
}

+ (BOOL)_isSupportedWithSetupSession:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  unsigned __int8 v4 = [v3 isDeviceNameModificationAllowed];

  return v4;
}

+ (BOOL)_isSupportedForUpgradeWithContext:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pbs_buddySelectedRoomName"));

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 previousExecutionRecord]);
  id v7 = [v6 setupVersion];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v9 = [v8 isDeviceNameModificationAllowed];

  if (v5) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (unint64_t)v7 >= TVSKSetupVersionAirPlay2;
  }
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9;
  }

  return v11;
}

- (void)_showAirplay2ViewControllerWithHomeKitInfo:(id)a3 isUpdateFlow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = -[SATVAirplay2ViewController initWithTapToSetupHomeKitInfo:]( objc_alloc(&OBJC_CLASS___SATVAirplay2ViewController),  "initWithTapToSetupHomeKitInfo:",  v6);
  -[SATVAirplay2ViewController setUpdateFlow:](v7, "setUpdateFlow:", v4);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004F48;
  v11[3] = &unk_1000C93A0;
  objc_copyWeak(&v12, &location);
  -[SATVAirplay2ViewController setMenuHandler:](v7, "setMenuHandler:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004F94;
  v9[3] = &unk_1000C93C8;
  objc_copyWeak(&v10, &location);
  -[SATVAirplay2ViewController setCompletionHandler:](v7, "setCompletionHandler:", v9);
  -[SATVAirplay2Step setAirplay2ViewController:](self, "setAirplay2ViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2Step stepDelegate](self, "stepDelegate"));
  [v8 step:self displayViewController:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_completeStepWithDidSetupHomeTheater:(BOOL)a3
{
  BOOL v3 = a3;
  -[SATVAirplay2Step _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  uint64_t v9 = TVSKMetricsPayloadKeyStepSuffixDidSetupHomeTheater;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  id v10 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  [v5 setMetricsPayload:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2Step stepDelegate](self, "stepDelegate"));
  [v8 step:self didCompleteWithResult:v5];
}

- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerHome));
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
  [v5 setShouldReset:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2Step stepDelegate](self, "stepDelegate"));
  [v6 step:self triggerStatusDidChangeForTriggers:v7 context:v5];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVAirplay2ViewController)airplay2ViewController
{
  return self->_airplay2ViewController;
}

- (void)setAirplay2ViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end