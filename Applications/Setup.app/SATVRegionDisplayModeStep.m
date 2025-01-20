@interface SATVRegionDisplayModeStep
+ (BOOL)_shouldExecuteStep;
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStep;
- (void)_showRegionDisplayModeViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVRegionDisplayModeStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVRegionDisplayModeStep");
    v3 = (void *)qword_100109930;
    qword_100109930 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVDisplayRegionModeStep";
}

- (id)executeStepForContext:(id)a3
{
  if ([a3 isNavigationFlowForward])
  {
    if ([(id)objc_opt_class(self) _shouldExecuteStep])
    {
      -[SATVRegionDisplayModeStep _showRegionDisplayModeViewController](self, "_showRegionDisplayModeViewController");
      return 0LL;
    }
  }

  else
  {
    v5 = (os_log_s *)qword_100109930;
    if (os_log_type_enabled((os_log_t)qword_100109930, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. We never show this step when moving backwards.",  v6,  2u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult successResult]( &OBJC_CLASS___TVSKBasicStepResult,  "successResult"));
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109930;
  if (os_log_type_enabled((os_log_t)qword_100109930, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device is in touchless set up mode..", v4, 2u);
  }

  -[SATVRegionDisplayModeStep _completeStep](self, "_completeStep");
}

+ (BOOL)_shouldExecuteStep
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);
  [v3 refreshRate];
  double v5 = v4;

  double v6 = sub_10003EC60();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  if ([v7 isSupervised])
  {

LABEL_4:
    LODWORD(v9) = 0;
    goto LABEL_5;
  }

  char v8 = sub_10001AB80();

  if ((v8 & 1) != 0) {
    goto LABEL_4;
  }
  id v18 = sub_10003ED38();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v9) {
    LODWORD(v9) = PBSDisplayRefreshRateEqualToRefreshRate(v5, v6) ^ 1;
  }
LABEL_5:
  v10 = (void *)qword_100109930;
  if (os_log_type_enabled((os_log_t)qword_100109930, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v13 = [v12 isSupervised];
    int v14 = sub_10001AB80();
    id v15 = sub_10003ED38();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v19[0] = 67110658;
    v19[1] = (_DWORD)v9;
    __int16 v20 = 2048;
    double v21 = v5;
    __int16 v22 = 2048;
    double v23 = v6;
    __int16 v24 = 1024;
    unsigned int v25 = v13;
    __int16 v26 = 1024;
    int v27 = v14;
    __int16 v28 = 2112;
    v29 = v16;
    __int16 v30 = 1024;
    int refreshed = PBSDisplayRefreshRateEqualToRefreshRate(v5, v6);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "shouldExecute = %d {currentRefreshRate = %f, localeRefreshRate = %f, isSupervised = %d, skipDisplaySteps = %d, loc aleDisplayMode = %@, (currentRefreshRate == localeRefreshRate) = %d}",  (uint8_t *)v19,  0x38u);
  }

  return (char)v9;
}

- (void)_showRegionDisplayModeViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVDisplayModeRegionViewController);
  objc_initWeak(&location, self);
  double v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_10003FBF8;
  char v8 = &unk_1000C93C8;
  objc_copyWeak(&v9, &location);
  -[SATVDisplayModeRegionViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionDisplayModeStep stepDelegate](self, "stepDelegate", v5, v6, v7, v8));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_completeStep
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionDisplayModeStep stepDelegate](self, "stepDelegate"));
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