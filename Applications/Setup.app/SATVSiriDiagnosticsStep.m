@interface SATVSiriDiagnosticsStep
+ (BOOL)_shouldTrustSiriDataSharingFromiOSBuild:(id)a3;
+ (NSString)stableIdentifier;
+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleSiriDiagnosticsConsent:(BOOL)a3;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithSiriDiagnosticsConsent:(BOOL)a3;
- (void)_reset;
- (void)_showSiriDiagnosticsViewController:(BOOL)a3;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVSiriDiagnosticsStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVSiriDiagnosticsStep");
    v3 = (void *)qword_100109A30;
    qword_100109A30 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVSiriDiagnosticsStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipSiri];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109A30;
    if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  (uint8_t *)v34,  2u);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_28;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  if ([v9 isSiriEnabled])
  {
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    unsigned __int8 v11 = [v10 isDictationEnabled];

    if ((v11 & 1) == 0)
    {
      v26 = (os_log_s *)qword_100109A30;
      if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Neither Siri or dictation is enabled. Will skip.",  (uint8_t *)v34,  2u);
      }

      goto LABEL_27;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsViewController);
  id v14 = v12;
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

  if (![v4 isNavigationFlowForward])
  {
    v24 = (os_log_s *)qword_100109A30;
    if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear anything that was previously set up for this step..",  (uint8_t *)v34,  2u);
    }

    -[SATVSiriDiagnosticsStep _reset](self, "_reset");
    if (v17)
    {
      uint64_t v25 = 0LL;
      goto LABEL_42;
    }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109A30;
  if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Touchless mode is enabled for the device...",  v4,  2u);
  }

  -[SATVSiriDiagnosticsStep _completeStepWithSiriDiagnosticsConsent:]( self,  "_completeStepWithSiriDiagnosticsConsent:",  0LL);
}

+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isSiriDataSharingEnabled];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 buildVersion]);

  LOBYTE(v3) = +[SATVSiriDiagnosticsStep _shouldTrustSiriDataSharingFromiOSBuild:]( &OBJC_CLASS___SATVSiriDiagnosticsStep,  "_shouldTrustSiriDataSharingFromiOSBuild:",  v5);
  if ((v3 & 1) != 0)
  {
    if (!TVCSTriStateBoolIsDefined(v4))
    {
      v9 = 0LL;
      goto LABEL_12;
    }

    else {
      unsigned int v6 = @"EXPRESS_SETUP_SIRI_DATA_SHARING_OFF_INFO";
    }
  }

  else
  {
    v7 = (os_log_s *)qword_100109A30;
    if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring siri diagnostics value from tap-to-setup and opting out as iOS build cannot be trusted.",  v12,  2u);
    }

    unsigned int v6 = @"EXPRESS_SETUP_SIRI_DATA_SHARING_OFF_INFO";
  }

  id v8 = sub_10000D7CC(v6, @"Localizable");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
LABEL_12:
    id v10 = 0LL;
    goto LABEL_13;
  }

  id v10 = [[TVSKExpressTapToSetupItem alloc] initWithTypes:4 descriptionText:v9 imageSymbolName:@"waveform" imageSymbolScale:3];
LABEL_13:

  return v10;
}

- (void)_showSiriDiagnosticsViewController:(BOOL)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___SATVSiriDiagnosticsViewController);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100069444;
  v12[3] = &unk_1000CAF08;
  BOOL v14 = a3;
  objc_copyWeak(&v13, &location);
  -[SATVSiriDiagnosticsViewController setMenuHandler:](v5, "setMenuHandler:", v12);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1000694A8;
  id v10 = &unk_1000C93C8;
  objc_copyWeak(&v11, &location);
  -[SATVSiriDiagnosticsViewController setCompletionHandler:](v5, "setCompletionHandler:", &v7);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsStep stepDelegate](self, "stepDelegate", v7, v8, v9, v10));
  [v6 step:self displayViewController:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_handleSiriDiagnosticsConsent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v4 handleDataSharingOfferWithEnableDataSharing:v3];

  return +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v3, v5));
}

- (void)_completeStepWithSiriDiagnosticsConsent:(BOOL)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsStep _handleSiriDiagnosticsConsent:](self, "_handleSiriDiagnosticsConsent:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self didCompleteWithResult:v5];
}

- (void)_reset
{
  os_log_t v2 = (os_log_s *)qword_100109A30;
  if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Rolling back data sharing state to its initial value",  v4,  2u);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v3 rollbackDataSharingState];
}

+ (BOOL)_shouldTrustSiriDataSharingFromiOSBuild:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"19A"] & 1) != 0
    || ([v3 hasPrefix:@"19B"] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    unsigned int v4 = [v3 hasPrefix:@"19C"] ^ 1;
  }

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