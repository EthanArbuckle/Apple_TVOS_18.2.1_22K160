@interface SUCorePower
+ (id)sharedPowerManager;
+ (int)getPowerAssertionCountForIdentifierDomain:(id)a3;
+ (void)_disablePowerAssertion:(id)a3 forAppendedDomain:(id)a4;
+ (void)_enablePowerAssertion:(id)a3 forAppendedDomain:(id)a4;
+ (void)setPowerAssertion:(BOOL)a3 forIdentifierDomain:(id)a4;
- (NSMutableDictionary)activePowerAssertions;
- (OS_dispatch_queue)assertionQueue;
- (SUCorePower)init;
- (void)setActivePowerAssertions:(id)a3;
@end

@implementation SUCorePower

+ (id)sharedPowerManager
{
  if (sharedPowerManager_powerManagerOnce != -1) {
    dispatch_once(&sharedPowerManager_powerManagerOnce, &__block_literal_global_6);
  }
  return (id)sharedPowerManager_powerManager;
}

void __33__SUCorePower_sharedPowerManager__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCorePower);
  v1 = (void *)sharedPowerManager_powerManager;
  sharedPowerManager_powerManager = (uint64_t)v0;
}

- (SUCorePower)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SUCorePower;
  v2 = -[SUCorePower init](&v18, sel_init);
  if (v2)
  {
    id v3 = objc_alloc(NSString);
    [MEMORY[0x189612760] sharedCore];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 commonDomain];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)[v3 initWithFormat:@"%@.%@", v5, @"core.power.assertion"];

    id v7 = v6;
    v8 = (const char *)[v7 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    assertionQueue = v2->_assertionQueue;
    v2->_assertionQueue = (OS_dispatch_queue *)v10;

    if (v2->_assertionQueue)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 oslog];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POWER_ASSERTION] DISPATCH: created dispatch queue domain(%{public}@)",  buf,  0xCu);
      }
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create dispatch queue domain(%@)", v7];
      -[os_log_s trackError:forReason:withResult:withError:]( v13,  "trackError:forReason:withResult:withError:",  @"[POWER_ASSERTION]",  v14,  8100LL,  0LL);
    }

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    activePowerAssertions = v2->_activePowerAssertions;
    v2->_activePowerAssertions = v15;
  }

  return v2;
}

+ (void)setPowerAssertion:(BOOL)a3 forIdentifierDomain:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  v5 = +[SUCorePower sharedPowerManager](&OBJC_CLASS___SUCorePower, "sharedPowerManager");
  if (v5)
  {
    [MEMORY[0x189612760] sharedSUCoreDomainAppending:v13];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 assertionQueue];
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v7);

    [v5 assertionQueue];
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke;
    block[3] = &unk_18A0F1078;
    BOOL v17 = v4;
    id v15 = v5;
    id v16 = v6;
    id v9 = v6;
    dispatch_sync(v8, block);

    dispatch_queue_t v10 = v15;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc(NSString);
    v12 = @"disable";
    if (v4) {
      v12 = @"enable";
    }
    dispatch_queue_t v10 = (void *)[v11 initWithFormat:@"no shared power manager - unable to %@ power assertion for domain(%@)", v12, v13];
    [v9 trackError:@"[POWER_ASSERTION]" forReason:v10 withResult:8101 withError:0];
  }
}

uint64_t __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48)) {
    return +[SUCorePower _enablePowerAssertion:forAppendedDomain:]( &OBJC_CLASS___SUCorePower,  "_enablePowerAssertion:forAppendedDomain:",  v1,  v2);
  }
  else {
    return +[SUCorePower _disablePowerAssertion:forAppendedDomain:]( &OBJC_CLASS___SUCorePower,  "_disablePowerAssertion:forAppendedDomain:",  v1,  v2);
  }
}

+ (int)getPowerAssertionCountForIdentifierDomain:(id)a3
{
  id v3 = a3;
  +[SUCorePower sharedPowerManager](&OBJC_CLASS___SUCorePower, "sharedPowerManager");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = 0LL;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 0;
  if (v4)
  {
    [MEMORY[0x189612760] sharedSUCoreDomainAppending:v3];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 assertionQueue];
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    [v4 assertionQueue];
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke;
    block[3] = &unk_18A0F06D0;
    id v13 = v4;
    id v14 = v5;
    id v15 = &v16;
    id v8 = v5;
    dispatch_sync(v7, block);

    id v9 = v13;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[objc_alloc(NSString) initWithFormat:@"no shared power manager - unable to get power assertion count for domain(%@)", v3];
    [v8 trackError:@"[POWER_ASSERTION]" forReason:v9 withResult:8101 withError:0];
  }

  int v10 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class()];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = v4;
  if (v4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 activeAssertionCount];
    id v3 = v4;
  }
}

+ (void)_enablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = (__CFString *)a4;
  [v5 assertionQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 activePowerAssertions];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 safeObjectForKey:v6 ofClass:objc_opt_class()];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___SUCorePowerAssertion);
    if (!v13)
    {
      [MEMORY[0x189612778] sharedDiag];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create SUCorePowerAssertion object for domain(%@)", v6];
      [v9 trackError:@"[POWER_ASSERTION]" forReason:v11 withResult:8100 withError:0];
      goto LABEL_11;
    }

    id v9 = v13;
    IOPMAssertionID AssertionID = -1;
    IOReturn v14 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v6, &AssertionID);
    if (v14)
    {
      IOReturn v15 = v14;
      [MEMORY[0x189612778] sharedDiag];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create IOKit Power Assertion for domain(%@)", v6];
      [v11 trackError:@"[POWER_ASSERTION]" forReason:v16 withResult:v15 withError:0];

      goto LABEL_11;
    }

    objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
    [v9 setAssertionID:AssertionID];
    [v5 activePowerAssertions];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setSafeObject:v9 forKey:v6];

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v19 = [v9 activeAssertionCount];
    *(_DWORD *)buf = 67109378;
    int v22 = v19;
    __int16 v23 = 2114;
    v24 = v6;
    v12 = "[POWER_ASSERTION] ENABLED(count=%d) for domain(%{public}@)";
    goto LABEL_4;
  }

  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
  [MEMORY[0x1896127A0] sharedLogger];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = [v9 activeAssertionCount];
    __int16 v23 = 2114;
    v24 = v6;
    v12 = "[POWER_ASSERTION] INCREASED(count=%d) for domain(%{public}@)";
LABEL_4:
    _os_log_impl(&dword_187A54000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
  }

+ (void)_disablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  [v5 assertionQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 activePowerAssertions];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 safeObjectForKey:v6 ofClass:objc_opt_class()];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = (void *)[objc_alloc(NSString) initWithFormat:@"disabling power assertion when no assertion is active for domain(%@)", v6];
    [v11 trackError:@"[POWER_ASSERTION]" forReason:v13 withResult:8101 withError:0];

    goto LABEL_7;
  }

  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") - 1);
  if ((int)[v9 activeAssertionCount] <= 0)
  {
    IOReturn v14 = IOPMAssertionRelease([v9 assertionID]);
    if (v14)
    {
      IOReturn v15 = v14;
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v17 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to release IOKit Power Assertion for domain(%@)", v6];
      [v16 trackError:@"[POWER_ASSERTION]" forReason:v17 withResult:v15 withError:0];

      goto LABEL_8;
    }

    [v5 activePowerAssertions];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 removeObjectForKey:v6];

    [MEMORY[0x1896127A0] sharedLogger];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = [v9 activeAssertionCount];
      __int16 v22 = 2114;
      id v23 = v6;
      v12 = "[POWER_ASSERTION] DISABLED(count=%d) for domain(%{public}@)";
      goto LABEL_5;
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = [v9 activeAssertionCount];
      __int16 v22 = 2114;
      id v23 = v6;
      v12 = "[POWER_ASSERTION] DECREASED(count=%d) for domain(%{public}@)";
LABEL_5:
      _os_log_impl(&dword_187A54000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
    }
  }

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (NSMutableDictionary)activePowerAssertions
{
  return self->_activePowerAssertions;
}

- (void)setActivePowerAssertions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end