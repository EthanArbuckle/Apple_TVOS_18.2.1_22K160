@interface SATVPrivacyStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleConsent;
- (void)_showPrivacyViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVPrivacyStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVPrivacyStep");
    v3 = (void *)qword_1001099E8;
    qword_1001099E8 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVPrivacyStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipPrivacy];

  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___SATVPrivacyViewController);
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

    unint64_t v14 = v13;

    if ([v4 isNavigationFlowForward])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
      if ([v15 isUpdate])
      {
        v16 = (os_log_s *)qword_1001099E8;
        if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "We are moving forwards and this is an update flow...",  v29,  2u);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v4 previousExecutionRecord]);
        id v18 = [v17 setupVersion];
        if ((unint64_t)v18 >= TVSKSetupVersionPrivacy)
        {
          v20 = (os_log_s *)qword_1001099E8;
          if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We have previously offered the privacy step UI. Will complete step",  v28,  2u);
          }

          uint64_t v19 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
        }

        else
        {
          uint64_t v19 = 0LL;
        }
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
      unsigned int v22 = [v21 isTapToSetupEnabled];

      if (v22)
      {
        v23 = (os_log_s *)qword_1001099E8;
        if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "We are moving forward in the flow and TTSU has been enabled. Skip.",  v27,  2u);
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));

        goto LABEL_34;
      }

      if (!(v19 | v14))
      {
        v24 = (os_log_s *)qword_1001099E8;
        if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  v26,  2u);
        }

        -[SATVPrivacyStep _showPrivacyViewController](self, "_showPrivacyViewController");
      }
    }

    else if (v14)
    {
      uint64_t v19 = 0LL;
    }

    else
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
    }

    uint64_t v19 = (uint64_t)(id)v19;
    v8 = (void *)v19;
LABEL_34:

    goto LABEL_35;
  }

  v7 = (os_log_s *)qword_1001099E8;
  if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
LABEL_35:

  return v8;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_1001099E8;
  if (os_log_type_enabled((os_log_t)qword_1001099E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVPrivacyStep _handleConsent](self, "_handleConsent");
}

- (void)_showPrivacyViewController
{
  v3 = -[SATVPrivacyViewController initWithPrivacyBundleIdentifier:]( objc_alloc(&OBJC_CLASS___SATVPrivacyViewController),  "initWithPrivacyBundleIdentifier:",  @"com.apple.onboarding.privacypane");
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005CCCC;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVPrivacyViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005CD18;
  v5[3] = &unk_1000C93A0;
  objc_copyWeak(&v6, &location);
  -[SATVPrivacyViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPrivacyStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleConsent
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPrivacyStep stepDelegate](self, "stepDelegate"));
  [v3 step:self didCompleteWithResult:v4];
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