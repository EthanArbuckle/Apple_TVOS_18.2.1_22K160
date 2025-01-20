@interface SATVActivationStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_handleActivationResult:(BOOL)a3 shouldFinishSetup:(BOOL)a4;
- (void)_showActivationContainerViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVActivationStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVActivationStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVActivationStep");
    v3 = (void *)qword_100109910;
    qword_100109910 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVActivationStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  if ([v5 isTapToSetupEnabled])
  {

LABEL_8:
    v12 = (os_log_s *)qword_100109910;
    if (os_log_type_enabled((os_log_t)qword_100109910, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Either we are moving backwards OR Tap to set up has been chosen. Skip activation..",  buf,  2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    goto LABEL_17;
  }

  unsigned __int8 v6 = [v4 isNavigationFlowForward];

  if ((v6 & 1) == 0) {
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SATVActivationContainerViewController);
  id v9 = v7;
  v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v11 = v10;
    }
    else {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  id v14 = v11;

  if (!v14)
  {
    v15 = (os_log_s *)qword_100109910;
    if (os_log_type_enabled((os_log_t)qword_100109910, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Show a view controller for this step..",  v17,  2u);
    }

    -[SATVActivationStep _showActivationContainerViewController](self, "_showActivationContainerViewController");
  }

  v13 = 0LL;
LABEL_17:

  return v13;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109910;
  if (os_log_type_enabled((os_log_t)qword_100109910, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVActivationStep _handleActivationResult:shouldFinishSetup:]( self,  "_handleActivationResult:shouldFinishSetup:",  1LL,  0LL);
}

- (void)_showActivationContainerViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVActivationContainerViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003A4F0;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVActivationContainerViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003A53C;
  v5[3] = &unk_1000CA2D8;
  objc_copyWeak(&v6, &location);
  -[SATVActivationContainerViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleActivationResult:(BOOL)a3 shouldFinishSetup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult resultWithSuccess:](&OBJC_CLASS___TVSKBasicStepResult, "resultWithSuccess:"));
  if (v5 && v4) {
    [v8 setFlowOptions:1];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationStep stepDelegate](self, "stepDelegate"));
  [v7 step:self didCompleteWithResult:v8];
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