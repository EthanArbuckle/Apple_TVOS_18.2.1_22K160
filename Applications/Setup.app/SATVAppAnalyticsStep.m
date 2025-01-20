@interface SATVAppAnalyticsStep
+ (BOOL)_isAppAnalyticsSupported;
+ (NSString)stableIdentifier;
+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleDidConsentToAnalytics:(BOOL)a3;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithAnalyticsConsent:(BOOL)a3;
- (void)_enableAppAnalytics:(BOOL)a3 markAsPresented:(BOOL)a4;
- (void)_reset;
- (void)_showAppAnalyticsViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVAppAnalyticsStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVAppAnalyticsStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVAppAnalyticsStep");
    v3 = (void *)qword_100109928;
    qword_100109928 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVAppAnalyticsStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipDiagnostics];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109928;
    if (os_log_type_enabled((os_log_t)qword_100109928, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  (uint8_t *)v23,  2u);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_21;
  }

  if (([(id)objc_opt_class(self) _isAppAnalyticsSupported] & 1) == 0)
  {
    v14 = (os_log_s *)qword_100109928;
    if (os_log_type_enabled((os_log_t)qword_100109928, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "This step is not supported. Will skip.",  (uint8_t *)v23,  2u);
    }

    goto LABEL_20;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___SATVAppAnalyticsViewController);
  id v11 = v9;
  v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      v13 = v12;
    }
    else {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  unint64_t v15 = v13;

  if (![v4 isNavigationFlowForward])
  {
    -[SATVAppAnalyticsStep _reset](self, "_reset");
    if (v15)
    {
      uint64_t v20 = 0LL;
      goto LABEL_22;
    }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109928;
  if (os_log_type_enabled((os_log_t)qword_100109928, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVAppAnalyticsStep _completeStepWithAnalyticsConsent:](self, "_completeStepWithAnalyticsConsent:", 0LL);
}

+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3
{
  id v4 = a3;
  if ([a1 _isAppAnalyticsSupported]
    && TVCSTriStateBoolIsDefined([v4 isAppAnalyticSubmissionsAllowed]))
  {
    else {
      v5 = @"EXPRESS_SETUP_APP_ANALYTICS_OFF_INFO";
    }
    id v6 = sub_10000D7CC(v5, @"Localizable");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [[TVSKExpressTapToSetupItem alloc] initWithTypes:32 descriptionText:v7 imageSymbolName:@"chart.bar.fill" imageSymbolScale:2];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (BOOL)_isAppAnalyticsSupported
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isBoolSettingLockedDownByRestrictions:MCFeatureAppAnalyticsAllowed];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v5 = [v4 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];

  return (v5 == 1) & ~v3;
}

- (void)_showAppAnalyticsViewController
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___SATVAppAnalyticsViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C7BC;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVAppAnalyticsViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C808;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVAppAnalyticsViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_completeStepWithAnalyticsConsent:(BOOL)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsStep _handleDidConsentToAnalytics:](self, "_handleDidConsentToAnalytics:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self didCompleteWithResult:v5];
}

- (id)_handleDidConsentToAnalytics:(BOOL)a3
{
  BOOL v3 = a3;
  -[SATVAppAnalyticsStep _enableAppAnalytics:markAsPresented:](self, "_enableAppAnalytics:markAsPresented:", a3, 1LL);
  return +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v3, v4));
}

- (void)_enableAppAnalytics:(BOOL)a3 markAsPresented:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v6 setObject:v7 forKey:@"PBAppActivity2Presented"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v8 setBoolValue:v5 forSetting:MCFeatureAppAnalyticsAllowed];
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