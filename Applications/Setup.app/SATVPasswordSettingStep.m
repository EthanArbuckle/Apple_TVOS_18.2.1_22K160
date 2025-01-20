@interface SATVPasswordSettingStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_iTunesAccount;
- (id)executeStepForContext:(id)a3;
- (void)_completeStep;
- (void)_showPasswordSettingPromptViewController;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVPasswordSettingStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVPasswordSettingStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVPasswordSettingStep");
    v3 = (void *)qword_1001097F0;
    qword_1001097F0 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVPasswordSettingStep";
}

- (void)autoAdvance
{
}

- (id)executeStepForContext:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stepConfiguration]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SATVPasswordSettingStepConfiguration, v7);
  id v9 = v6;
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

  id v12 = v11;

  if (!v12)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"configuration"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000768EC(a2, (uint64_t)self, (uint64_t)v33);
    }
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x100021394LL);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 stepViewController]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___SATVPasswordSettingPromptViewController, v14);
  id v16 = v13;
  v17 = v16;
  if (v15)
  {
    if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0) {
      v18 = v17;
    }
    else {
      v18 = 0LL;
    }
  }

  else
  {
    v18 = 0LL;
  }

  id v19 = v18;

  if (![v5 isNavigationFlowForward])
  {
    if (v19) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 setupSession]);
  if ([v20 isTapToSetupEnabled])
  {
  }

  else
  {
    char v22 = _os_feature_enabled_impl("AppleIDSetup", "Sandstone");

    if ((v22 & 1) == 0)
    {
      v30 = (os_log_s *)qword_1001097F0;
      if (!os_log_type_enabled((os_log_t)qword_1001097F0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      v31 = "Tap to setup is not enabled. Skipping.";
      goto LABEL_30;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingStep _iTunesAccount](self, "_iTunesAccount"));

  if (!v23)
  {
    v30 = (os_log_s *)qword_1001097F0;
    if (!os_log_type_enabled((os_log_t)qword_1001097F0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    v31 = "No active iTunes account. Skipping.";
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_31;
  }

  if ((sub_100049F7C() & 1) == 0)
  {
    v30 = (os_log_s *)qword_1001097F0;
    if (os_log_type_enabled((os_log_t)qword_1001097F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "Setting already set. Skipping.";
      goto LABEL_30;
    }

- (void)_showPasswordSettingPromptViewController
{
  v3 = objc_alloc(&OBJC_CLASS___SATVPasswordSettingPromptViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingStep _iTunesAccount](self, "_iTunesAccount"));
  id v5 = -[SATVPasswordSettingPromptViewController initWithAccount:](v3, "initWithAccount:", v4);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100021504;
  v9[3] = &unk_1000C93A0;
  objc_copyWeak(&v10, &location);
  -[SATVPasswordSettingPromptViewController setMenuHandler:](v5, "setMenuHandler:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021550;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVPasswordSettingPromptViewController setCompletionHandler:](v5, "setCompletionHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingStep stepDelegate](self, "stepDelegate"));
  [v6 step:self displayViewController:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_iTunesAccount
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return v3;
}

- (void)_completeStep
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingStep stepDelegate](self, "stepDelegate"));
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