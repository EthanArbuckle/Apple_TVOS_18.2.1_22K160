@interface SATVBundlePrefetchStep
- (SATVBundlePrefetchStep)init;
- (TVSKPrefetchStep)bundlePrefetchStep;
- (id)triggers;
- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4;
@end

@implementation SATVBundlePrefetchStep

- (SATVBundlePrefetchStep)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVBundlePrefetchStep;
  v2 = -[SATVBundleStep init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBundleStep bundleStep](v2, "bundleStep"));
    if ((objc_opt_respondsToSelector(v4, "triggers") & 1) != 0)
    {
      objc_storeStrong((id *)&v3->_bundlePrefetchStep, v4);
    }

    else
    {
      if (qword_100109988 != -1) {
        dispatch_once(&qword_100109988, &stru_1000CA630);
      }
      v5 = (os_log_s *)qword_100109980;
      if (os_log_type_enabled((os_log_t)qword_100109980, OS_LOG_TYPE_ERROR)) {
        sub_100077970(v5);
      }
    }
  }

  return v3;
}

- (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVBundlePrefetchStep bundlePrefetchStep](self, "bundlePrefetchStep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 triggers]);

  return v3;
}

- (void)triggerStatusDidChangeForTriggers:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVBundlePrefetchStep bundlePrefetchStep](self, "bundlePrefetchStep"));
  [v8 triggerStatusDidChangeForTriggers:v7 context:v6];
}

- (TVSKPrefetchStep)bundlePrefetchStep
{
  return self->_bundlePrefetchStep;
}

- (void).cxx_destruct
{
}

@end