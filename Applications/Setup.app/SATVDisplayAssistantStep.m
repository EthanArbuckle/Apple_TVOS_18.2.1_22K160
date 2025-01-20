@interface SATVDisplayAssistantStep
+ (BOOL)_shouldExecute;
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStep;
- (void)_showDisplayAssistantViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVDisplayAssistantStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVDisplayAssistantStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVDisplayAssistantStep");
    v3 = (void *)qword_1001098B0;
    qword_1001098B0 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVDisplayAssistantStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class(self) _shouldExecute] & 1) == 0)
  {
    v10 = (os_log_s *)qword_1001098B0;
    if (os_log_type_enabled((os_log_t)qword_1001098B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skip executing this step..", buf, 2u);
    }

    goto LABEL_16;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SATVDisplayAssistantViewController);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  id v11 = v9;

  if ([v4 isNavigationFlowForward])
  {
    if (!v11)
    {
      v12 = (os_log_s *)qword_1001098B0;
      if (os_log_type_enabled((os_log_t)qword_1001098B0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  v15,  2u);
      }

      -[SATVDisplayAssistantStep _showDisplayAssistantViewController](self, "_showDisplayAssistantViewController");
    }

    goto LABEL_15;
  }

  if (!v11)
  {
LABEL_16:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    goto LABEL_17;
  }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_1001098B0;
  if (os_log_type_enabled((os_log_t)qword_1001098B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVDisplayAssistantStep _completeStep](self, "_completeStep");
}

+ (BOOL)_shouldExecute
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  if ([v2 canAttemptUpgradeWithDisplayAssistant])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    else {
      int v4 = sub_10001AB80() ^ 1;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_showDisplayAssistantViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVDisplayAssistantViewController);
  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  id v7 = sub_10002C500;
  v8 = &unk_1000C93C8;
  objc_copyWeak(&v9, &location);
  -[SATVDisplayAssistantViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDisplayAssistantStep stepDelegate](self, "stepDelegate", v5, v6, v7, v8));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_completeStep
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDisplayAssistantStep stepDelegate](self, "stepDelegate"));
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