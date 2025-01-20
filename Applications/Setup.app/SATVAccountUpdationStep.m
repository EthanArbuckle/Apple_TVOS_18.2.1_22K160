@interface SATVAccountUpdationStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_showAccountUpdationViewController;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVAccountUpdationStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVAccountUpdationStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVAccountUpdationStep");
    v3 = (void *)qword_1001098F8;
    qword_1001098F8 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVAccountUpdationStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v5, "activeAccount"));

  if (!v6)
  {
    v8 = (os_log_s *)qword_1001098F8;
    if (os_log_type_enabled((os_log_t)qword_1001098F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skip executing this step..", buf, 2u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_10;
  }

  if (([v4 isNavigationFlowForward] & 1) == 0)
  {
    v10 = (os_log_s *)qword_1001098F8;
    if (os_log_type_enabled((os_log_t)qword_1001098F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Skip executing this step",  v12,  2u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
LABEL_10:
    v7 = (void *)v9;
    goto LABEL_11;
  }

  -[SATVAccountUpdationStep _showAccountUpdationViewController](self, "_showAccountUpdationViewController");
  v7 = 0LL;
LABEL_11:

  return v7;
}

- (void)_showAccountUpdationViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVAccountUpdationViewController);
  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_100037884;
  v8 = &unk_1000C93C8;
  objc_copyWeak(&v9, &location);
  -[SATVAccountUpdationViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAccountUpdationStep stepDelegate](self, "stepDelegate", v5, v6, v7, v8));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
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