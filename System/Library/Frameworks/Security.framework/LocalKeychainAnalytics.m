@interface LocalKeychainAnalytics
+ (id)databasePath;
- (BOOL)canPersistMetrics;
- (LocalKeychainAnalytics)init;
- (void)processPendingMessages;
- (void)reportKeychainBackupEnd:(BOOL)a3 error:(id)a4;
- (void)reportKeychainBackupStartWithType:(int)a3;
- (void)reportKeychainUpgradeFrom:(int)a3 to:(int)a4 outcome:(int)a5 error:(id)a6;
- (void)reportKeychainUpgradeOutcome:(int)a3 attributes:(id)a4;
@end

@implementation LocalKeychainAnalytics

- (LocalKeychainAnalytics)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LocalKeychainAnalytics;
  v2 = -[SFAnalytics init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_probablyInClassD = 1;
    uint64_t v4 = objc_opt_new();
    pendingReports = v3->_pendingReports;
    v3->_pendingReports = (NSMutableArray *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create("LKADataQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_notificationToken = -1;
  }

  return v3;
}

- (BOOL)canPersistMetrics
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL probablyInClassD = v2->_probablyInClassD;
  objc_sync_exit(v2);

  if (!probablyInClassD) {
    return 1;
  }
  int v8 = -1431655766;
  if (!aks_get_lock_state(0, &v8) && (v8 & 4) != 0)
  {
    v5 = v2;
    objc_sync_enter(v5);
    v2->_BOOL probablyInClassD = 0;
    int notificationToken = v5->_notificationToken;
    if (notificationToken != -1) {
      notify_cancel(notificationToken);
    }
    objc_sync_exit(v5);

    -[LocalKeychainAnalytics processPendingMessages](v5, "processPendingMessages");
    return 1;
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke;
  v7[3] = &unk_189676638;
  v7[4] = v2;
  if (canPersistMetrics_onceToken != -1) {
    dispatch_once(&canPersistMetrics_onceToken, v7);
  }
  return 0;
}

- (void)processPendingMessages
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__LocalKeychainAnalytics_processPendingMessages__block_invoke;
  block[3] = &unk_189676638;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)reportKeychainUpgradeFrom:(int)a3 to:(int)a4 outcome:(int)a5 error:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v26[3] = *MEMORY[0x1895F89C0];
  id v10 = a6;
  v25[0] = @"oldschema";
  [MEMORY[0x189607968] numberWithInt:v8];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v25[1] = @"newschema";
  [MEMORY[0x189607968] numberWithInt:v7];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  v25[2] = @"upgradeoutcome";
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)[v14 mutableCopy];

  if (v10)
  {
    v23[0] = @"errorDomain";
    [v10 domain];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = @"errorCode";
    v24[0] = v16;
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v10, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 addEntriesFromDictionary:v18];
  }

  if (-[LocalKeychainAnalytics canPersistMetrics](self, "canPersistMetrics"))
  {
    -[LocalKeychainAnalytics reportKeychainUpgradeOutcome:attributes:]( self,  "reportKeychainUpgradeOutcome:attributes:",  v6,  v15);
  }

  else
  {
    queue = self->_queue;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke;
    v20[3] = &unk_189664CE0;
    v20[4] = self;
    int v22 = v6;
    id v21 = v15;
    dispatch_async((dispatch_queue_t)queue, v20);
  }
}

- (void)reportKeychainUpgradeOutcome:(int)a3 attributes:(id)a4
{
  if (a3) {
    -[SFAnalytics logHardFailureForEventNamed:withAttributes:]( self,  "logHardFailureForEventNamed:withAttributes:",  @"LKAEventUpgrade",  a4);
  }
  else {
    -[SFAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", @"LKAEventUpgrade", a4);
  }
}

- (void)reportKeychainBackupStartWithType:(int)a3
{
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  backupStartTime = self->_backupStartTime;
  self->_backupStartTime = v5;

  self->_backupType = a3;
}

- (void)reportKeychainBackupEnd:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v18[3] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [MEMORY[0x189603F50] date];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 timeIntervalSinceDate:self->_backupStartTime];
  uint64_t v9 = 100 * (int)((v8 + 0.05) * 10.0);
  [MEMORY[0x189607968] numberWithInteger:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics logMetric:withName:](self, "logMetric:withName:", v10, @"LKAMetricBackupDuration");

  if (v4)
  {
    -[SFAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v7, @"backupLastSuccess");
    -[SFAnalytics logSuccessForEventNamed:timestampBucket:]( self,  "logSuccessForEventNamed:timestampBucket:",  @"LKAEventBackup",  2LL);
  }

  else
  {
    v11 = -[SFAnalytics datePropertyForKey:](self, "datePropertyForKey:", @"backupLastSuccess");
    int64_t v12 = +[SFAnalytics fuzzyDaysSinceDate:](&OBJC_CLASS___SFAnalytics, "fuzzyDaysSinceDate:", v11);

    if ([v6 code] != -25308 || v12)
    {
      v17[0] = @"daysSinceSuccess";
      [MEMORY[0x189607968] numberWithInteger:v12];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v17[1] = @"duration";
      [MEMORY[0x189607968] numberWithInteger:v9];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v14;
      v17[2] = @"type";
      [MEMORY[0x189607968] numberWithUnsignedInt:self->_backupType];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:timestampBucket:]( self,  "logResultForEvent:hardFailure:result:withAttributes:timestampBucket:",  @"LKAEventBackup",  1LL,  v6,  v16,  2LL);
    }
  }
}

- (void).cxx_destruct
{
}

void __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72LL);
  v2 = -[LKAUpgradeOutcomeReport initWithOutcome:attributes:]( objc_alloc(&OBJC_CLASS___LKAUpgradeOutcomeReport),  "initWithOutcome:attributes:",  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40));
  [v1 addObject:v2];
}

void __48__LocalKeychainAnalytics_processPendingMessages__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v8 = *(void **)(a1 + 32);
        uint64_t v9 = objc_msgSend(v7, "outcome", (void)v11);
        [v7 attributes];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 reportKeychainUpgradeOutcome:v9 attributes:v10];
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }
}

void __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_get_global_queue(0LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2;
  handler[3] = &unk_189664CB8;
  handler[4] = v1;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(v1 + 88), v2, handler);
}

uint64_t __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) canPersistMetrics];
}

+ (id)databasePath
{
  return (id)[a1 defaultAnalyticsDatabasePath:@"localkeychain"];
}

@end