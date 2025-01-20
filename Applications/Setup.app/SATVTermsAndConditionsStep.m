@interface SATVTermsAndConditionsStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (SATVTermsViewController)termsAndConditionsViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleConsent:(BOOL)a3;
- (void)_showTermsAndConditionsViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
- (void)setTermsAndConditionsViewController:(id)a3;
@end

@implementation SATVTermsAndConditionsStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVTermsAndConditionsStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVTermsAndConditionsStep");
    v3 = (void *)qword_100109920;
    qword_100109920 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVTermsAndConditionsStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipTermsAndConditions];

  if (v6)
  {
    v7 = (os_log_s *)qword_100109920;
    if (os_log_type_enabled((os_log_t)qword_100109920, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
  }

  else
  {
    if ([v4 isNavigationFlowForward])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___SATVTermsViewController);
      id v11 = v9;
      v12 = v11;
      if (v10) {
        v13 = (objc_opt_isKindOfClass(v11, v10) & 1) != 0 ? v12 : 0LL;
      }
      else {
        v13 = 0LL;
      }
      id v14 = v13;

      if (!v14)
      {
        v15 = (os_log_s *)qword_100109920;
        if (os_log_type_enabled((os_log_t)qword_100109920, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  v17,  2u);
        }

        -[SATVTermsAndConditionsStep _showTermsAndConditionsViewController]( self,  "_showTermsAndConditionsViewController");
      }
    }

    v8 = 0LL;
  }

  return v8;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109920;
  if (os_log_type_enabled((os_log_t)qword_100109920, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVTermsAndConditionsStep _handleConsent:](self, "_handleConsent:", 1LL);
}

- (void)_showTermsAndConditionsViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVTermsViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C018;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVTermsViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C064;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVTermsViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  -[SATVTermsAndConditionsStep setTermsAndConditionsViewController:](self, "setTermsAndConditionsViewController:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsAndConditionsStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleConsent:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[TVSKConsentStepResult resultWithSuccess:]( &OBJC_CLASS___TVSKConsentStepResult,  "resultWithSuccess:",  TVCSTriStateBoolForBool(a3, a2) != 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  [v7 setDidConsent:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsAndConditionsStep stepDelegate](self, "stepDelegate"));
  [v6 step:self didCompleteWithResult:v7];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVTermsViewController)termsAndConditionsViewController
{
  return self->_termsAndConditionsViewController;
}

- (void)setTermsAndConditionsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end