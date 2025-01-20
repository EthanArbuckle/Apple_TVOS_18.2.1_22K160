@interface SecTapToRadar
+ (BOOL)askUserIfTTR:(id)a3;
+ (BOOL)isRateLimited:(id)a3;
+ (id)keyname:(id)a3;
+ (void)disableTTRsEntirely;
+ (void)triggerTapToRadar:(id)a3;
- (BOOL)isRateLimited;
- (NSString)alert;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (NSString)radarnumber;
- (NSString)reason;
- (OS_dispatch_queue)queue;
- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5;
- (void)clearRetryTimestamp;
- (void)setAlert:(id)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarnumber:(id)a3;
- (void)setReason:(id)a3;
- (void)trigger;
- (void)updateRetryTimestamp;
@end

@implementation SecTapToRadar

- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SecTapToRadar;
  v12 = -[SecTapToRadar init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alert, a3);
    objc_storeStrong((id *)&v13->_radarDescription, a4);
    objc_storeStrong((id *)&v13->_radarnumber, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.security.diagnostic-queue", 0LL);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = (dispatch_object_s *)v13->_queue;
    dispatch_get_global_queue(-32768LL, 0LL);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v16, v17);

    componentName = v13->_componentName;
    v13->_componentName = (NSString *)@"Security";

    componentVersion = v13->_componentVersion;
    v13->_componentVersion = (NSString *)@"all";

    componentID = v13->_componentID;
    v13->_componentID = (NSString *)@"606179";

    v21 = v13;
  }

  return v13;
}

- (BOOL)isRateLimited
{
  v3 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.security"];
  [(id)objc_opt_class() keyname:self];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 valueForKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189603F50] date];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = [v5 compare:v6] != -1;
  }

  else
  {
    [v3 removeObjectForKey:v4];
    BOOL v7 = 0;
  }

  return v7;
}

- (void)updateRetryTimestamp
{
  id v6 = (id)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.security"];
  [MEMORY[0x189603F50] date];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dateByAddingTimeInterval:86400.0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() keyname:self];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v4 forKey:v5];
}

- (void)clearRetryTimestamp
{
  id v4 = (id)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.security"];
  [(id)objc_opt_class() keyname:self];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObjectForKey:v3];
}

- (void)trigger
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__SecTapToRadar_trigger__block_invoke;
  block[3] = &unk_189676638;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)alert
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAlert:(id)a3
{
}

- (NSString)radarDescription
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarnumber
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRadarnumber:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __24__SecTapToRadar_trigger__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x186DFF9D0]();
  if (os_variant_allows_internal_security_policies())
  {
    if ([(id)objc_opt_class() isRateLimited:*(void *)(a1 + 32)])
    {
      secLogObjForScope("SecTTR");
      v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 32) alert];
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        int v5 = 138412290;
        id v6 = v4;
        _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "Not showing ttr due to ratelimiting: %@",  (uint8_t *)&v5,  0xCu);
      }
    }

    else
    {
      [*(id *)(a1 + 32) updateRetryTimestamp];
    }
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)keyname:(id)a3
{
  v3 = (void *)NSString;
  [a3 radarnumber];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@-%@", @"NextTTRDate", v4];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isRateLimited:(id)a3
{
  if ((SecTTRDisabled & 1) != 0) {
    return 1;
  }
  else {
    return [a3 isRateLimited];
  }
}

+ (void)disableTTRsEntirely
{
  SecTTRDisabled = 1;
}

+ (void)triggerTapToRadar:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  secLogObjForScope("secttr");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 alert];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "Triggering TTR: %@", (uint8_t *)&v7, 0xCu);
  }

  [v3 queue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);
}

+ (BOOL)askUserIfTTR:(id)a3
{
  return 0;
}

@end