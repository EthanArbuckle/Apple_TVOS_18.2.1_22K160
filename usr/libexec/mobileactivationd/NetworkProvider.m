@interface NetworkProvider
+ (id)sharedInstance;
- (BOOL)networkReachable;
- (NWPathEvaluator)networkPathEvaluator;
- (NetworkProvider)init;
@end

@implementation NetworkProvider

- (NetworkProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NetworkProvider;
  v2 = -[NetworkProvider init](&v6, "init");
  if (v2)
  {
    if (!objc_opt_class(&OBJC_CLASS___NWPathEvaluator)
      || (v3 = objc_alloc_init(&OBJC_CLASS___NWPathEvaluator),
          networkPathEvaluator = v2->_networkPathEvaluator,
          v2->_networkPathEvaluator = v3,
          networkPathEvaluator,
          !v2->_networkPathEvaluator))
    {

      return 0LL;
    }
  }

  return v2;
}

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_networkProvider)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NetworkProvider);
    v4 = (void *)sharedInstance_networkProvider;
    sharedInstance_networkProvider = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (id)sharedInstance_networkProvider;
}

- (BOOL)networkReachable
{
  id v2 = -[NetworkProvider networkPathEvaluator](self, "networkPathEvaluator");
  id v3 = -[NWPathEvaluator path](v2, "path");
  id v4 = [v3 status];

  return (((unint64_t)v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NWPathEvaluator)networkPathEvaluator
{
  return self->_networkPathEvaluator;
}

- (void).cxx_destruct
{
}

@end