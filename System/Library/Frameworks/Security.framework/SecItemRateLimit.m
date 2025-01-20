@interface SecItemRateLimit
+ (id)getStaticRateLimit;
+ (id)instance;
+ (void)resetStaticRateLimit;
- (BOOL)consumeTokenFromBucket:(BOOL)a3;
- (BOOL)isEnabled;
- (BOOL)isModifyingAPICallWithinLimits;
- (BOOL)isReadOnlyAPICallWithinLimits;
- (BOOL)shouldCountAPICalls;
- (NSDate)roBucket;
- (NSDate)rwBucket;
- (SecItemRateLimit)init;
- (double)limitMultiplier;
- (double)roRate;
- (double)rwRate;
- (int)roCapacity;
- (int)rwCapacity;
- (void)forceEnabled:(BOOL)a3;
@end

@implementation SecItemRateLimit

+ (id)instance
{
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_7933);
  }
  return (id)ratelimit;
}

- (BOOL)isReadOnlyAPICallWithinLimits
{
  BOOL v2 = -[SecItemRateLimit consumeTokenFromBucket:](self, "consumeTokenFromBucket:", 0LL);
  if (!v2)
  {
    secLogObjForScope("secitemratelimit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_DEFAULT, "Readonly API rate exceeded", v5, 2u);
    }
  }

  return v2;
}

- (BOOL)consumeTokenFromBucket:(BOOL)a3
{
  if (!-[SecItemRateLimit shouldCountAPICalls](self, "shouldCountAPICalls") && !self->_forceEnabled) {
    return 1;
  }
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke;
  block[3] = &unk_18966F6A8;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync((dispatch_queue_t)dataQueue, block);
  BOOL v6 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)shouldCountAPICalls
{
  if (shouldCountAPICalls_shouldCountToken != -1) {
    dispatch_once(&shouldCountAPICalls_shouldCountToken, &__block_literal_global_6);
  }
  return shouldCountAPICalls_shouldCount;
}

- (SecItemRateLimit)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SecItemRateLimit;
  BOOL v2 = -[SecItemRateLimit init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_roCapacity = 0x1900000019LL;
    *(_OWORD *)&v2->_roRate = xmmword_18065A220;
    roBucket = v2->_roBucket;
    v2->_roBucket = 0LL;

    rwBucket = v3->_rwBucket;
    v3->_rwBucket = 0LL;

    v3->_forceEnabled = 0;
    v3->_limitMultiplier = 5.0;
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.keychain.secitemratelimit.dataqueue", v6);
    dataQueue = v3->_dataQueue;
    v3->_dataQueue = (OS_dispatch_queue *)v7;
  }

  return v3;
}

- (BOOL)isEnabled
{
  return self->_forceEnabled || -[SecItemRateLimit shouldCountAPICalls](self, "shouldCountAPICalls");
}

- (void)forceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  self->_forceEnabled = a3;
  secLogObjForScope("secitemratelimit");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      BOOL v6 = "F";
    }
    else {
      BOOL v6 = "Not f";
    }
    int v7 = 136315394;
    v8 = v6;
    __int16 v9 = 1024;
    BOOL v10 = -[SecItemRateLimit isEnabled](self, "isEnabled");
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "%sorcing SIRL to be enabled (effective: %i)",  (uint8_t *)&v7,  0x12u);
  }
}

- (BOOL)isModifyingAPICallWithinLimits
{
  BOOL v2 = -[SecItemRateLimit consumeTokenFromBucket:](self, "consumeTokenFromBucket:", 1LL);
  if (!v2)
  {
    secLogObjForScope("secitemratelimit");
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_DEFAULT, "Modifying API rate exceeded", v5, 2u);
    }
  }

  return v2;
}

- (int)roCapacity
{
  return self->_roCapacity;
}

- (double)roRate
{
  return self->_roRate;
}

- (int)rwCapacity
{
  return self->_rwCapacity;
}

- (double)rwRate
{
  return self->_rwRate;
}

- (double)limitMultiplier
{
  return self->_limitMultiplier;
}

- (NSDate)roBucket
{
  return self->_roBucket;
}

- (NSDate)rwBucket
{
  return self->_rwBucket;
}

- (void).cxx_destruct
{
}

void __39__SecItemRateLimit_shouldCountAPICalls__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    if (gSecurityd)
    {
      secLogObjForScope("secitemratelimit");
      v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5) = 0;
        v1 = "gSecurityd non-nil, disabling SIRL for testing";
LABEL_7:
        _os_log_impl(&dword_1804F4000, v0, OS_LOG_TYPE_DEFAULT, v1, (uint8_t *)&v5, 2u);
      }
    }

    else
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        secLogObjForScope("secitemratelimit");
        v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        LOWORD(v5) = 0;
        v1 = "SIRL disabled via feature flag";
        goto LABEL_7;
      }

      SecTaskRef v2 = SecTaskCreateFromSelf(0LL);
      [MEMORY[0x189603FA8] arrayWithArray:&unk_18969C060];
      v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        int v5 = 0;
        csops_task((uint64_t)v2);
        secLogObjForScope("secitemratelimit");
        v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "Not valid/debugged platform binary, disabling SIRL",  (uint8_t *)&v5,  2u);
        }

        CFRelease(v2);
      }

      else
      {
        secLogObjForScope("SecError");
        BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v5) = 0;
          _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "secitemratelimit: unable to get task from self, disabling SIRL",  (uint8_t *)&v5,  2u);
        }
      }
    }
  }

  else
  {
    secLogObjForScope("secitemratelimit");
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      v1 = "Not internal release, disabling SIRL";
      goto LABEL_7;
    }
  }

void __43__SecItemRateLimit_consumeTokenFromBucket___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v3 = 28LL;
  }
  else {
    uint64_t v3 = 24LL;
  }
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v4 = 40LL;
  }
  else {
    uint64_t v4 = 32LL;
  }
  uint64_t v5 = 64LL;
  if (!*(_BYTE *)(a1 + 48)) {
    uint64_t v5 = 56LL;
  }
  uint64_t v6 = (id *)(v2 + v5);
  [MEMORY[0x189603F50] now];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 dateByAddingTimeInterval:-1.0 / *(double *)(v2 + v4) * (double)*(int *)(v2 + v3)];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*v6 || ([*v6 timeIntervalSinceDate:v7], v8 < 0.0)) {
    objc_storeStrong(v6, v7);
  }
  uint64_t v9 = [*v6 dateByAddingTimeInterval:1.0 / *(double *)(v2 + v4)];
  id v10 = *v6;
  *uint64_t v6 = (id)v9;

  [*v6 timeIntervalSinceDate:v13];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11 <= 0.0;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v12 = *v6;
    *uint64_t v6 = 0LL;

    *(_DWORD *)(v2 + v3) = (int)(*(double *)(*(void *)(a1 + 32) + 48LL) * (double)*(int *)(v2 + v3));
    *(double *)(v2 + v4) = *(double *)(*(void *)(a1 + 32) + 48LL) * *(double *)(v2 + v4);
  }
}

+ (id)getStaticRateLimit
{
  return +[SecItemRateLimit instance](&OBJC_CLASS___SecItemRateLimit, "instance");
}

+ (void)resetStaticRateLimit
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)ratelimit;
  ratelimit = v2;
}

void __28__SecItemRateLimit_instance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)ratelimit;
  ratelimit = v0;
}

@end