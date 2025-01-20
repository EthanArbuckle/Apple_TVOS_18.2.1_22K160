@interface SATVDiagnosticsStep
+ (BOOL)_isDiagnosticsLockedDown;
+ (NSString)stableIdentifier;
+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleDiagnosticsConsent:(BOOL)a3;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithDiagnosticsConsent:(BOOL)a3;
- (void)_reset;
- (void)_setEnableDiagnosticsSubmission:(BOOL)a3;
- (void)_showDiagnosticsViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVDiagnosticsStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVDiagnosticsStep");
    v3 = (void *)qword_100109800;
    qword_100109800 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVDiagnosticStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipDiagnostics];

  if (v6)
  {
    v8 = (os_log_s *)qword_100109800;
    if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  (uint8_t *)v29,  2u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_21;
  }

  if (objc_msgSend((id)objc_opt_class(self, v7), "_isDiagnosticsLockedDown"))
  {
    v10 = (os_log_s *)qword_100109800;
    if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Diagnostics submission is locked down. We will skip this step.",  (uint8_t *)v29,  2u);
    }

    goto LABEL_20;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___SATVDiagnosticsViewController, v12);
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

  unint64_t v17 = v16;

  if ([v4 isNavigationFlowForward])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    if ([v18 isExpressTapToSetupEnabledForItemTypes:16])
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 tapToSetupDeviceInfo]);
      uint64_t v20 = TVCSBoolForTriStateBool([v19 isDiagnosticSubmissionsAllowed], 0);

      v21 = (os_log_s *)qword_100109800;
      if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
      {
        v29[0] = 67109120;
        v29[1] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup is enabled and diagnostics was shown to the user. Will apply diagnostics setting and skip step. enableDiagnostics=%{BOOL}d",  (uint8_t *)v29,  8u);
      }

      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsStep _handleDiagnosticsConsent:](self, "_handleDiagnosticsConsent:", v20));
    }

    else if ([v18 isUpdate])
    {
      v24 = (os_log_s *)qword_100109800;
      if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Going through an update in Mini Buddy.",  (uint8_t *)v29,  2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v4 previousExecutionRecord]);
      id v26 = [v25 setupVersion];
      if ((unint64_t)v26 >= TVSTVSKSetupVersionDiagnosticsAndUsage)
      {
        v27 = (os_log_s *)qword_100109800;
        if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "We have already shown this. No need to show again until next update.",  (uint8_t *)v29,  2u);
        }

        uint64_t v22 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
      }

      else
      {
        uint64_t v22 = 0LL;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    if (!(v22 | v17))
    {
      v28 = (os_log_s *)qword_100109800;
      if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  (uint8_t *)v29,  2u);
      }

      -[SATVDiagnosticsStep _showDiagnosticsViewController](self, "_showDiagnosticsViewController");
    }
  }

  else
  {
    -[SATVDiagnosticsStep _reset](self, "_reset");
    if (!v17)
    {
LABEL_20:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
LABEL_21:
      uint64_t v22 = v9;
      goto LABEL_22;
    }

    uint64_t v22 = 0LL;
  }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109800;
  if (os_log_type_enabled((os_log_t)qword_100109800, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Touchless mode is enabled for the device...",  v4,  2u);
  }

  -[SATVDiagnosticsStep _completeStepWithDiagnosticsConsent:](self, "_completeStepWithDiagnosticsConsent:", 0LL);
}

+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3
{
  id v4 = a3;
  if (([a1 _isDiagnosticsLockedDown] & 1) != 0
    || !TVCSTriStateBoolIsDefined([v4 isDiagnosticSubmissionsAllowed]))
  {
    id v8 = 0LL;
  }

  else
  {
    else {
      v5 = @"EXPRESS_SETUP_APPLE_ANALYTICS_OFF_INFO";
    }
    id v6 = sub_10000D7CC(v5, @"Localizable");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [[TVSKExpressTapToSetupItem alloc] initWithTypes:16 descriptionText:v7 imageSymbolName:@"chart.bar.fill" imageSymbolScale:2];
  }

  return v8;
}

+ (BOOL)_isDiagnosticsLockedDown
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isBoolSettingLockedDownByRestrictions:MCFeatureDiagnosticsSubmissionAllowed];

  return v3;
}

- (void)_showDiagnosticsViewController
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___SATVDiagnosticsViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000236FC;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVDiagnosticsViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100023748;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVDiagnosticsViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_completeStepWithDiagnosticsConsent:(BOOL)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsStep _handleDiagnosticsConsent:](self, "_handleDiagnosticsConsent:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDiagnosticsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self didCompleteWithResult:v5];
}

- (id)_handleDiagnosticsConsent:(BOOL)a3
{
  BOOL v3 = a3;
  -[SATVDiagnosticsStep _setEnableDiagnosticsSubmission:](self, "_setEnableDiagnosticsSubmission:");
  return +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v3, v4));
}

- (void)_setEnableDiagnosticsSubmission:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 setBoolValue:v3 forSetting:MCFeatureDiagnosticsSubmissionAllowed];
}

- (void)_reset
{
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