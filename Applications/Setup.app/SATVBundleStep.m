@interface SATVBundleStep
+ (BOOL)isBundleAvailable;
+ (NSString)bundlePath;
+ (NSString)stableIdentifier;
+ (id)_stableIdentifierFromBundle;
+ (id)_stepBundle;
- (Class)_stepClass;
- (SATVBundleStep)init;
- (TVSKStep)bundleStep;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)autoAdvance;
- (void)didCancelStep:(id)a3;
- (void)setStepDelegate:(id)a3;
- (void)step:(id)a3 didCompleteWithResult:(id)a4;
- (void)step:(id)a3 displayViewController:(id)a4;
- (void)step:(id)a3 triggerStatusDidChangeForTriggers:(id)a4 context:(id)a5;
@end

@implementation SATVBundleStep

- (SATVBundleStep)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVBundleStep;
  v2 = -[SATVBundleStep init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (TVSKStep *)objc_alloc_init(-[SATVBundleStep _stepClass](v2, "_stepClass"));
    bundleStep = v3->_bundleStep;
    v3->_bundleStep = v4;

    char v6 = objc_opt_respondsToSelector(v3->_bundleStep, "setStepDelegate:");
    v7 = v3->_bundleStep;
    if ((v6 & 1) != 0)
    {
      -[TVSKStep setStepDelegate:](v7, "setStepDelegate:", v3);
    }

    else
    {
      v3->_bundleStep = 0LL;

      id v8 = sub_10005671C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000786B8();
      }
    }
  }

  return v3;
}

+ (NSString)bundlePath
{
  return (NSString *)&stru_1000CB560;
}

+ (BOOL)isBundleAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 bundlePath]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  return v4;
}

+ (NSString)stableIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _stableIdentifierFromBundle]);
  if (![v3 length])
  {
    id v4 = sub_10005671C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100078720(a1, v5);
    }

    char v6 = NSStringFromClass((Class)a1);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

    v3 = (void *)v7;
  }

  return (NSString *)v3;
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBundleStep bundleStep](self, "bundleStep"));
  char v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 executeStepForContext:v4]);
  }

  else
  {
    id v8 = sub_10005671C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000787A8(v9);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  }

  v10 = (void *)v7;

  return v10;
}

- (void)autoAdvance
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVBundleStep bundleStep](self, "bundleStep"));
  [v2 autoAdvance];
}

- (void)step:(id)a3 didCompleteWithResult:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056998;
  v5[3] = &unk_1000C9BA0;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)didCancelStep:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100056A30;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)step:(id)a3 displayViewController:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056AEC;
  v5[3] = &unk_1000C9BA0;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)step:(id)a3 triggerStatusDidChangeForTriggers:(id)a4 context:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100056BD4;
  block[3] = &unk_1000C9A70;
  block[4] = self;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  dispatch_async(&_dispatch_main_q, block);
}

- (Class)_stepClass
{
  id v3 = [(id)objc_opt_class(self) _stepBundle];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForInfoDictionaryKey:@"NSPrincipalClass"]);
  id v15 = 0LL;
  unsigned __int8 v6 = [v4 loadAndReturnError:&v15];
  id v7 = v15;
  if ((v6 & 1) == 0)
  {
    id v8 = sub_10005671C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100078850((uint64_t)self, (uint64_t)v7, v9);
    }
  }

  id v10 = [v4 classNamed:v5];
  if (!v10)
  {
    id v11 = sub_10005671C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000787E8();
    }
  }

  v13 = (objc_class *)v10;

  return v13;
}

+ (id)_stepBundle
{
  id v2 = [(id)objc_opt_class(a1) bundlePath];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v3));

  return v4;
}

+ (id)_stableIdentifierFromBundle
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _stepBundle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInfoDictionaryKey:@"TVSKStepStableIdentifier"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  id v5 = v3;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInfoDictionaryKey:@"NSPrincipalClass"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
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

    id v8 = v13;
  }

  return v8;
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (TVSKStep)bundleStep
{
  return self->_bundleStep;
}

- (void).cxx_destruct
{
}

@end