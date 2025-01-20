@interface OSASubmissionScheduler
+ (double)_lastSuccessTime;
+ (id)_calculateNewCadenceParametersWithPermissive:(BOOL)a3 fastLane:(BOOL)a4;
+ (id)_getCurrentCadenceParametersFromActivity:(id)a3;
+ (int64_t)_retryCount;
+ (void)_incrementRetryCount;
+ (void)_resetRetryCount;
+ (void)_saveLastSuccessTime;
+ (void)_scheduleSubmissionWithPermissive:(BOOL)a3;
+ (void)_updateCadenceForActivity:(id)a3 newCadenceParameters:(id)a4;
+ (void)scheduleCleanupWithHomeDirectory:(id)a3;
+ (void)scheduleSubmission;
@end

@implementation OSASubmissionScheduler

+ (void)scheduleSubmission
{
}

+ (void)_scheduleSubmissionWithPermissive:(BOOL)a3
{
  v3 = "com.apple.osanalytics.submissions.submit";
  if (a3) {
    v3 = "com.apple.osanalytics.submissions.submit-permissive";
  }
  v4 = (void *)*MEMORY[0x1895F8680];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke;
  v5[3] = &__block_descriptor_41_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  v5[4] = a1;
  xpc_activity_register(v3, v4, v5);
}

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (!state)
    {
      +[OSASubmissionScheduler _lastSuccessTime](&OBJC_CLASS___OSASubmissionScheduler, "_lastSuccessTime");
      if (v5 <= 0.0) {
        +[OSASubmissionScheduler _saveLastSuccessTime](&OBJC_CLASS___OSASubmissionScheduler, "_saveLastSuccessTime");
      }
      uint64_t v6 = [MEMORY[0x189611B08] fastLane];
      if (v6 >= 1) {
        +[OSASubmissionScheduler _resetRetryCount](&OBJC_CLASS___OSASubmissionScheduler, "_resetRetryCount");
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v7 = "YES";
        if (*(_BYTE *)(a1 + 40)) {
          v8 = "YES";
        }
        else {
          v8 = "NO";
        }
        if (v6 <= 0) {
          v7 = "NO";
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v7;
        _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Initializing submission activity cadence. Permissive: %{public}s. FastLane: %{public}s.",  buf,  0x16u);
      }

      [*(id *)(a1 + 32) _calculateNewCadenceParametersWithPermissive:*(unsigned __int8 *)(a1 + 40) fastLane:v6 > 0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSASubmissionScheduler _updateCadenceForActivity:newCadenceParameters:]( &OBJC_CLASS___OSASubmissionScheduler,  "_updateCadenceForActivity:newCadenceParameters:",  v3,  v9);
    }

    goto LABEL_33;
  }

  [MEMORY[0x189611B08] sharedInstance];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v10 optInApple];

  if ((v11 & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
LABEL_19:
      uint64_t v17 = [MEMORY[0x189611B08] fastLane];
      BOOL v18 = v17 > 0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v19 = "YES";
        if (*(_BYTE *)(a1 + 40)) {
          v20 = "YES";
        }
        else {
          v20 = "NO";
        }
        if (v17 <= 0) {
          v19 = "NO";
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v19;
        _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Scheduling submission. Permissive: %{public}s. FastLane: %{public}s.",  buf,  0x16u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      char v32 = 0;
      v21 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0LL);
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_12;
      v25[3] = &unk_18A1C6548;
      BOOL v29 = v18;
      char v30 = *(_BYTE *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 32);
      v27 = buf;
      uint64_t v28 = v22;
      v26 = v3;
      dispatch_sync(v21, v25);

      _Block_object_dispose(buf, 8);
      goto LABEL_33;
    }

    xpc_object_t v12 = xpc_activity_copy_criteria(v3);
    int64_t int64 = xpc_dictionary_get_int64(v12, (const char *)*MEMORY[0x1895F86A0]);
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v15 = v14;
    +[OSASubmissionScheduler _lastSuccessTime](&OBJC_CLASS___OSASubmissionScheduler, "_lastSuccessTime");
    if (v15 - v16 >= (double)(int64 + 86400))
    {

      goto LABEL_19;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)MEMORY[0x189603F50];
      +[OSASubmissionScheduler _lastSuccessTime](&OBJC_CLASS___OSASubmissionScheduler, "_lastSuccessTime");
      objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = int64;
      _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Cancelling permissive submission due to recent success at %{public}@ with interval %{public}lli.",  buf,  0x16u);
    }

    xpc_activity_set_state(v3, 5LL);
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Cancelling submission due to opt-out.",  buf,  2u);
    }

    xpc_activity_set_state(v3, 5LL);
  }

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_12(uint64_t a1)
{
  v10[2] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc_init(&OBJC_CLASS___OSASubmissionClient);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[OSASubmissionClient submit](v2, "submit");

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    +[OSASubmissionScheduler _saveLastSuccessTime](&OBJC_CLASS___OSASubmissionScheduler, "_saveLastSuccessTime");
LABEL_4:
    +[OSASubmissionScheduler _resetRetryCount](&OBJC_CLASS___OSASubmissionScheduler, "_resetRetryCount");
    goto LABEL_5;
  }

  if (*(_BYTE *)(a1 + 56)) {
    goto LABEL_4;
  }
  if (!*(_BYTE *)(a1 + 57)) {
    +[OSASubmissionScheduler _incrementRetryCount](&OBJC_CLASS___OSASubmissionScheduler, "_incrementRetryCount");
  }
LABEL_5:
  uint64_t v7 = MEMORY[0x1895F87A8];
  LOBYTE(v8) = *(_BYTE *)(a1 + 57);
  AnalyticsSendEventLazy();
  objc_msgSend( MEMORY[0x189611B08],  "sharedInstance",  v7,  3221225472,  __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2,  &__block_descriptor_33_e19___NSDictionary_8__0l,  v8,  @"crk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 crashReporterKey];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = @"type";
  v10[0] = v4;
  v10[1] = @"unified";
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  rtcsc_send();

  [MEMORY[0x189611B00] recordEvent:*MEMORY[0x189611B80]];
  [*(id *)(a1 + 48) _calculateNewCadenceParametersWithPermissive:*(unsigned __int8 *)(a1 + 57) fastLane:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) _updateCadenceForActivity:*(void *)(a1 + 32) newCadenceParameters:v6];
}

id __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2(uint64_t a1)
{
  v5[3] = *MEMORY[0x1895F89C0];
  v4[0] = @"action";
  v4[1] = @"type";
  v5[0] = @"submit";
  v5[1] = @"unified";
  v4[2] = @"permissive";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)scheduleCleanupWithHomeDirectory:(id)a3
{
  id v3 = a3;
  v4 = (void *)*MEMORY[0x1895F8680];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke;
  handler[3] = &unk_18A1C65F8;
  id v7 = v3;
  id v5 = v3;
  xpc_activity_register("com.apple.osanalytics.submissions.cleanup", v4, handler);
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke( uint64_t a1,  xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188041000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Scheduling cleanup.", buf, 2u);
    }

    id v3 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36;
    block[3] = &unk_18A1C6590;
    id v5 = *(id *)(a1 + 32);
    dispatch_sync(v3, block);
    AnalyticsSendEventLazy();
  }

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x189611AF0];
  [MEMORY[0x189611B08] sharedInstance];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 pathSubmission];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 scanProxies:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189611C58] submissionPathsWithHomeDirectory:*(void *)(a1 + 32)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([MEMORY[0x189611AF0] isDataVaultEnabled])
  {
    [MEMORY[0x189611B08] sharedInstance];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 pathSubmissionDataVault];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [MEMORY[0x189611AF0] scanProxies:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = (id)[v5 arrayByAddingObjectsFromArray:v9];

      id v11 = (id)[v6 arrayByAddingObject:v8];
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36_cold_1();
    }
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5, 0);
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [MEMORY[0x189611AF0] cleanupRetired:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }

      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

void *__59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_39()
{
  return &unk_18A1C7178;
}

+ (id)_calculateNewCadenceParametersWithPermissive:(BOOL)a3 fastLane:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v21[3] = *MEMORY[0x1895F89C0];
  uint64_t v6 = +[OSASubmissionScheduler _retryCount](&OBJC_CLASS___OSASubmissionScheduler, "_retryCount");
  uint64_t v7 = *MEMORY[0x1895F86B8];
  if (v5 && v4)
  {
    uint64_t v8 = *MEMORY[0x1895F86B8];
    v7 *= 12LL;
    goto LABEL_10;
  }

  uint64_t v9 = *MEMORY[0x1895F86B0];
  if (v5)
  {
    uint64_t v8 = *MEMORY[0x1895F86B8];
LABEL_6:
    uint64_t v7 = v9;
    goto LABEL_10;
  }

  if (v4 || OSAIsACDCDevice())
  {
    uint64_t v8 = *MEMORY[0x1895F86C0];
    goto LABEL_10;
  }

  if (v6 < 1)
  {
    uint64_t v8 = 3 * v7;
    goto LABEL_6;
  }

  uint64_t v18 = v7;
  if (v6 != 1)
  {
    if (v6 == 2) {
      uint64_t v18 = 2 * v7;
    }
    else {
      uint64_t v18 = *MEMORY[0x1895F86C8];
    }
  }

  uint64_t v19 = v18 + arc4random_uniform(0xE10u);
  uint64_t v8 = v7;
  uint64_t v7 = v19 - 1800;
LABEL_10:
  [NSString stringWithUTF8String:*MEMORY[0x1895F8688]];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  [MEMORY[0x189607968] numberWithLongLong:v7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  [NSString stringWithUTF8String:*MEMORY[0x1895F86A0]];
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  [MEMORY[0x189607968] numberWithLongLong:v7];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  [NSString stringWithUTF8String:*MEMORY[0x1895F8690]];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  [MEMORY[0x189607968] numberWithLongLong:v8];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:3];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_getCurrentCadenceParametersFromActivity:(id)a3
{
  v16[3] = *MEMORY[0x1895F89C0];
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  BOOL v4 = (const char *)*MEMORY[0x1895F8688];
  [NSString stringWithUTF8String:*MEMORY[0x1895F8688]];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  uint64_t v7 = (const char *)*MEMORY[0x1895F86A0];
  [NSString stringWithUTF8String:*MEMORY[0x1895F86A0]];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  id v10 = (const char *)*MEMORY[0x1895F8690];
  [NSString stringWithUTF8String:*MEMORY[0x1895F8690]];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v10));
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)_updateCadenceForActivity:(id)a3 newCadenceParameters:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (_xpc_activity_s *)a3;
  id v7 = a4;
  [a1 _getCurrentCadenceParametersFromActivity:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = xpc_activity_copy_identifier();
  if (v9)
  {
    id v10 = (void *)v9;
    [NSString stringWithUTF8String:v9];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }

  else
  {
    id v11 = 0LL;
  }

  xpc_activity_state_t state = xpc_activity_get_state(v6);
  if (!state) {
    goto LABEL_11;
  }
  if (state != 2) {
    goto LABEL_15;
  }
  if (xpc_activity_set_state(v6, 5LL)) {
    usleep(0xAu);
  }
  if ([v8 isEqualToDictionary:v7])
  {
LABEL_15:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543618;
      v24 = v11;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Submission cadences were unchanged for activity %{public}@. Keeping current cadences parameters %{public}@",  (uint8_t *)&v23,  0x16u);
    }
  }

  else
  {
LABEL_11:
    xpc_object_t v13 = xpc_activity_copy_criteria(v6);
    uint64_t v14 = (const char *)*MEMORY[0x1895F8688];
    [NSString stringWithUTF8String:*MEMORY[0x1895F8688]];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v14, [v16 longLongValue]);

    __int128 v17 = (const char *)*MEMORY[0x1895F86A0];
    [NSString stringWithUTF8String:*MEMORY[0x1895F86A0]];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v18];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v17, [v19 longLongValue]);

    __int128 v20 = (const char *)*MEMORY[0x1895F8690];
    [NSString stringWithUTF8String:*MEMORY[0x1895F8690]];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v20, [v22 longLongValue]);

    xpc_activity_set_criteria(v6, v13);
  }
}

+ (void)_saveLastSuccessTime
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setDouble:forKey:", @"lastSuccess");
}

+ (double)_lastSuccessTime
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 doubleForKey:@"lastSuccess"];
  double v4 = v3;

  return v4;
}

+ (int64_t)_retryCount
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 integerForKey:@"retryCount"];

  return v3;
}

+ (void)_incrementRetryCount
{
  uint64_t v3 = +[OSASubmissionScheduler _retryCount](&OBJC_CLASS___OSASubmissionScheduler, "_retryCount");
  if (v3 > 2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Maxed out on retries. Resetting retry count",  buf,  2u);
    }

    [a1 _resetRetryCount];
  }

  else
  {
    uint64_t v4 = v3;
    [MEMORY[0x189604038] standardUserDefaults];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setInteger:v4 + 1 forKey:@"retryCount"];
  }

+ (void)_resetRetryCount
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInteger:0 forKey:@"retryCount"];
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_188041000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to get the data vault submission path.",  v0,  2u);
}

@end