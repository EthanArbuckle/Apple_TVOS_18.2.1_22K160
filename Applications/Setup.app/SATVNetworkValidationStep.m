@interface SATVNetworkValidationStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (SATVNetworkValidationContainerViewController)networkValidationContainerViewController;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_displayNetworkValidationViewController;
- (void)autoAdvance;
- (void)setNetworkValidationContainerViewController:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVNetworkValidationStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVNetworkValidationStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVNetworkValidationStep");
    v3 = (void *)qword_100109730;
    qword_100109730 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVNetworkValidationStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  if ([v5 isTapToSetupEnabled])
  {

LABEL_4:
    v7 = (os_log_s *)qword_100109730;
    if (os_log_type_enabled((os_log_t)qword_100109730, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Either the user has chosen tap to set up OR Network has been configured. Skip executing this step..",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    goto LABEL_17;
  }

  unsigned __int8 v6 = +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable");

  if ((v6 & 1) != 0) {
    goto LABEL_4;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SATVNetworkValidationContainerViewController, v10);
  id v12 = v9;
  v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      v14 = v13;
    }
    else {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = v14;

  if (!v15)
  {
    v16 = (os_log_s *)qword_100109730;
    if (os_log_type_enabled((os_log_t)qword_100109730, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Display a view controller for this step..",  v18,  2u);
    }

    -[SATVNetworkValidationStep _displayNetworkValidationViewController]( self,  "_displayNetworkValidationViewController");
  }

  v8 = 0LL;
LABEL_17:

  return v8;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109730;
  if (os_log_type_enabled((os_log_t)qword_100109730, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationStep networkValidationContainerViewController]( self,  "networkValidationContainerViewController"));
  [v4 autoAdvance];
}

- (void)_displayNetworkValidationViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVNetworkValidationContainerViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008BA4;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVNetworkValidationContainerViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008BF0;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVNetworkValidationContainerViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  -[SATVNetworkValidationStep setNetworkValidationContainerViewController:]( self,  "setNetworkValidationContainerViewController:",  v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (SATVNetworkValidationContainerViewController)networkValidationContainerViewController
{
  return self->_networkValidationContainerViewController;
}

- (void)setNetworkValidationContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end