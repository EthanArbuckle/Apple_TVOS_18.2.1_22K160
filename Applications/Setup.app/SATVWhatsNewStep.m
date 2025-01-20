@interface SATVWhatsNewStep
+ (BOOL)_isSupportedForUpdate;
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_completeStep;
- (void)_displayWhatsNewViewController;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVWhatsNewStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVWhatsNewStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVWhatsNewStep");
    v3 = (void *)qword_1001098D0;
    qword_1001098D0 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVWhatsNewStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  if ([v4 isNavigationFlowForward])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    if ([v6 isUpdate])
    {
      unsigned int v7 = [(id)objc_opt_class(self) _isSupportedForUpdate];

      if (v7)
      {
        v8 = (os_log_s *)qword_1001098D0;
        if (os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is forwards and we have an update setup session.",  (uint8_t *)&v29,  2u);
        }

        goto LABEL_32;
      }
    }

    else
    {
    }

    v14 = (void *)qword_1001098D0;
    if (os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
      int v29 = 67109376;
      LODWORD(v30[0]) = [v16 isUpdate];
      WORD2(v30[0]) = 1024;
      *(_DWORD *)((char *)v30 + 6) = [(id)objc_opt_class(self) _isSupportedForUpdate];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is forwards but we do not need to show any UI. isUpdate=%{BOOL}d, isSupportedForUpdate=%{BOOL}d",  (uint8_t *)&v29,  0xEu);
    }

    if (!v5) {
      goto LABEL_32;
    }
    id v17 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___SATVWhatsNewViewController);
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

    id v17 = v13;

    if (v17) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    }

    v19 = (os_log_s *)qword_1001098D0;
    if (os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      v30[0] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is backwards. whatsNewViewController=%@",  (uint8_t *)&v29,  0xCu);
    }

    if (!v18)
    {
      if (v17)
      {
        unsigned int v22 = [v17 shouldSkipShowingWhatsNew];
        v23 = (os_log_s *)qword_1001098D0;
        BOOL v24 = os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            LOWORD(v29) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "It seems like we had already fetched whats new info before and we don't need to show it again. Done executing this step.",  (uint8_t *)&v29,  2u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
          goto LABEL_36;
        }

        if (v24)
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "We have a view controller and should show it.",  (uint8_t *)&v29,  2u);
        }

+ (BOOL)_isSupportedForUpdate
{
  return 1;
}

- (void)_displayWhatsNewViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVWhatsNewViewController);
  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  unsigned int v7 = sub_100031EE8;
  v8 = &unk_1000C93A0;
  objc_copyWeak(&v9, &location);
  -[SATVWhatsNewViewController setCompletionHandler:](v3, "setCompletionHandler:", &v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewStep stepDelegate](self, "stepDelegate", v5, v6, v7, v8));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_completeStep
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVWhatsNewStep stepDelegate](self, "stepDelegate"));
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