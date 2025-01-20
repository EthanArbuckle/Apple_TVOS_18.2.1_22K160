@interface SUCoreDiag
+ (id)sharedDiag;
- (BOOL)isSharedDiag;
- (NSMutableArray)trackingHistory;
- (NSString)appendingDumpFilename;
- (NSString)lastReportedUUID;
- (NSString)uniqueInstanceName;
- (OS_dispatch_queue)trackingQueue;
- (SUCoreDiag)initWithAppendedDomain:(id)a3 appendingDumpFilename:(id)a4;
- (SUCoreDiagStats)trackStats;
- (id)_copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4;
- (id)_dumpMaskToString:(int64_t)a3;
- (id)copyTrackedStatsClearingAfter:(BOOL)a3;
- (id)copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4;
- (id)loadDump:(id)a3;
- (int64_t)allIndications;
- (void)_appendToHistory:(id)a3;
- (void)_dumpEvent:(id)a3;
- (void)_dumpToFile:(id)a3 dumpingDict:(id)a4 forReason:(id)a5;
- (void)_dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7;
- (void)_logTrackedError:(id)a3 fromLocation:(id)a4 forReason:(id)a5 withResult:(int64_t)a6 withError:(id)a7;
- (void)collectTrackedStatsClearingAfter:(BOOL)a3 completion:(id)a4;
- (void)collectTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4 completion:(id)a5;
- (void)dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7;
- (void)setAppendingDumpFilename:(id)a3;
- (void)setIsSharedDiag:(BOOL)a3;
- (void)setLastReportedUUID:(id)a3;
- (void)setTrackStats:(id)a3;
- (void)setTrackingHistory:(id)a3;
- (void)setUniqueInstanceName:(id)a3;
- (void)trackAnomaly:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)trackBegin:(id)a3;
- (void)trackBegin:(id)a3 atLevel:(int)a4;
- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5;
- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6;
- (void)trackEnd:(id)a3;
- (void)trackEnd:(id)a3 atLevel:(int)a4;
- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5;
- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6 withResult:(int64_t)a7 withError:(id)a8;
- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withResult:(int64_t)a6 withError:(id)a7;
- (void)trackEnd:(id)a3 atLevel:(int)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)trackEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)trackError:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)trackFailure:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)trackFault:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)trackLastReportedUUID:(id)a3;
- (void)trackStateEvent:(id)a3 previousState:(id)a4 handlingEvent:(id)a5 nextState:(id)a6 performingAction:(id)a7 withInfo:(id)a8;
@end

@implementation SUCoreDiag

+ (id)sharedDiag
{
  if (sharedDiag_diagOnce != -1) {
    dispatch_once(&sharedDiag_diagOnce, &__block_literal_global_6);
  }
  return (id)sharedDiag_diag;
}

uint64_t __24__SUCoreDiag_sharedDiag__block_invoke()
{
  v0 = -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:]( objc_alloc(&OBJC_CLASS___SUCoreDiag),  "initWithAppendedDomain:appendingDumpFilename:",  @"shared",  @"SUDiagDump.plist");
  v1 = (void *)sharedDiag_diag;
  sharedDiag_diag = (uint64_t)v0;

  return [(id)sharedDiag_diag setIsSharedDiag:1];
}

- (SUCoreDiag)initWithAppendedDomain:(id)a3 appendingDumpFilename:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SUCoreDiag;
  v9 = -[SUCoreDiag init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueInstanceName, a3);
    id v11 = objc_alloc(NSString);
    v12 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v12 commonDomain];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)[v11 initWithFormat:@"%@.%@.%@", v13, @"core.diag.tracking", v7];

    id v15 = v14;
    v16 = (const char *)[v15 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    trackingQueue = v10->_trackingQueue;
    v10->_trackingQueue = (OS_dispatch_queue *)v18;

    v20 = v10->_trackingQueue;
    v21 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v21 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v15;
        _os_log_impl( &dword_187139000,  v22,  OS_LOG_TYPE_DEFAULT,  "[DIAG] DISPATCH: created dispatch queue domain(%{public}@)",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:].cold.1( (uint64_t)v15,  v22,  v23,  v24,  v25,  v26,  v27,  v28);
    }

    uint64_t v29 = objc_opt_new();
    trackingHistory = v10->_trackingHistory;
    v10->_trackingHistory = (NSMutableArray *)v29;

    v31 = objc_alloc_init(&OBJC_CLASS___SUCoreDiagStats);
    trackStats = v10->_trackStats;
    v10->_trackStats = v31;

    objc_storeStrong((id *)&v10->_appendingDumpFilename, a4);
    lastReportedUUID = v10->_lastReportedUUID;
    v10->_lastReportedUUID = 0LL;

    v10->_isSharedDiag = 0;
  }

  return v10;
}

- (void)trackBegin:(id)a3
{
}

- (void)trackBegin:(id)a3 atLevel:(int)a4
{
}

- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5
{
}

- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v13);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreDiag_trackBegin_atLevel_forModule_withIdentifier___block_invoke;
  block[3] = &unk_189FEA180;
  id v19 = v10;
  id v20 = v12;
  int v23 = a4;
  v21 = self;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  dispatch_sync(v14, block);
}

void __58__SUCoreDiag_trackBegin_atLevel_forModule_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  1LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  0LL,  0LL);
  [*(id *)(a1 + 48) _appendToHistory:v2];
  [*(id *)(a1 + 48) trackStats];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBeginCount:", objc_msgSend(v3, "beginCount") + 1);

  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
    {
      if (v8)
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v24 = 138543362;
        *(void *)&v24[4] = v19;
        id v12 = "%{public}@...";
        v13 = v7;
        uint32_t v14 = 12;
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v24 = 138543618;
    *(void *)&v24[4] = v15;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v16;
    id v12 = "%{public}@... (%{public}@)";
LABEL_11:
    v13 = v7;
    uint32_t v14 = 22;
    goto LABEL_14;
  }

  if (!v5)
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v24 = 138543618;
    *(void *)&v24[4] = v17;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v18;
    id v12 = "[%{public}@]%{public}@...";
    goto LABEL_11;
  }

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v24 = 138543874;
    *(void *)&v24[4] = v9;
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v10;
    *(_WORD *)&v24[22] = 2114;
    uint64_t v25 = v11;
    id v12 = "[%{public}@]%{public}@... (%{public}@)";
    v13 = v7;
    uint32_t v14 = 32;
LABEL_14:
    _os_log_impl(&dword_187139000, v13, OS_LOG_TYPE_DEFAULT, v12, v24, v14);
  }

- (void)trackEnd:(id)a3
{
}

- (void)trackEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

- (void)trackEnd:(id)a3 atLevel:(int)a4
{
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 withResult:(int64_t)a5 withError:(id)a6
{
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5
{
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withResult:(int64_t)a6 withError:(id)a7
{
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6 withResult:(int64_t)a7 withError:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__SUCoreDiag_trackEnd_atLevel_forModule_withIdentifier_withResult_withError___block_invoke;
  block[3] = &unk_189FEA1A8;
  id v25 = v14;
  id v26 = v16;
  id v27 = v17;
  uint64_t v28 = self;
  int v31 = a4;
  id v29 = v15;
  int64_t v30 = a7;
  id v20 = v15;
  id v21 = v17;
  id v22 = v16;
  id v23 = v14;
  dispatch_sync(v19, block);
}

void __77__SUCoreDiag_trackEnd_atLevel_forModule_withIdentifier_withResult_withError___block_invoke( uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  2LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 72),  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) _appendToHistory:v2];
  if (!*(void *)(a1 + 72) && !*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 56) trackStats];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEndSuccessCount:", objc_msgSend(v22, "endSuccessCount") + 1);

    uint64_t v23 = *(void *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 40);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v26 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        if (!v26) {
          goto LABEL_33;
        }
        uint64_t v27 = *(void *)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 32);
        id v29 = *(void **)(a1 + 40);
        *(_DWORD *)v47 = 138543874;
        *(void *)&v47[4] = v27;
        *(_WORD *)&v47[12] = 2114;
        *(void *)&v47[14] = v28;
        *(_WORD *)&v47[22] = 2114;
        v48 = v29;
        int64_t v30 = "...[%{public}@]%{public}@ (%{public}@) | SUCCESS";
        int v31 = v9;
        uint32_t v32 = 32;
LABEL_32:
        _os_log_impl(&dword_187139000, v31, OS_LOG_TYPE_DEFAULT, v30, v47, v32);
        goto LABEL_33;
      }

      if (!v26) {
        goto LABEL_33;
      }
      uint64_t v40 = *(void *)(a1 + 64);
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)v47 = 138543618;
      *(void *)&v47[4] = v40;
      *(_WORD *)&v47[12] = 2114;
      *(void *)&v47[14] = v41;
      int64_t v30 = "...[%{public}@]%{public}@ | SUCCESS";
    }

    else
    {
      if (!v24)
      {
        if (!v26) {
          goto LABEL_33;
        }
        uint64_t v42 = *(void *)(a1 + 32);
        *(_DWORD *)v47 = 138543362;
        *(void *)&v47[4] = v42;
        int64_t v30 = "...%{public}@ | SUCCESS";
        int v31 = v9;
        uint32_t v32 = 12;
        goto LABEL_32;
      }

      if (!v26) {
        goto LABEL_33;
      }
      uint64_t v38 = *(void *)(a1 + 32);
      uint64_t v39 = *(void *)(a1 + 40);
      *(_DWORD *)v47 = 138543618;
      *(void *)&v47[4] = v38;
      *(_WORD *)&v47[12] = 2114;
      *(void *)&v47[14] = v39;
      int64_t v30 = "...%{public}@ (%{public}@) | SUCCESS";
    }

    int v31 = v9;
    uint32_t v32 = 22;
    goto LABEL_32;
  }

  [*(id *)(a1 + 56) trackStats];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndFailCount:", objc_msgSend(v3, "endFailCount") + 1);

  if ([v2 checkedIndications])
  {
    [*(id *)(a1 + 56) trackStats];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndFailIndicationsCount:", objc_msgSend(v4, "endFailIndicationsCount") + 1);

    [*(id *)(a1 + 56) trackStats];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "setEndFailAllIndications:",  objc_msgSend(v5, "endFailAllIndications") | objc_msgSend(v2, "checkedIndications"));
  }

  if (*(int *)(a1 + 80) >= 1)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 40);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v7)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          id v12 = *(void **)(a1 + 40);
          uint64_t v13 = *(void *)(a1 + 64);
          uint64_t v14 = *(void *)(a1 + 72);
          [*(id *)(a1 + 48) checkedDescription];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v47 = 138544386;
          *(void *)&v47[4] = v13;
          *(_WORD *)&v47[12] = 2114;
          *(void *)&v47[14] = v11;
          *(_WORD *)&v47[22] = 2114;
          v48 = v12;
          *(_WORD *)v49 = 2048;
          *(void *)&v49[2] = v14;
          *(_WORD *)&v49[10] = 2114;
          *(void *)&v49[12] = v15;
          id v16 = "[DIAG_END] ...[%{public}@]%{public}@ (%{public}@) | result=%ld error:%{public}@";
          id v17 = v9;
          uint32_t v18 = 52;
LABEL_23:
          _os_log_error_impl(&dword_187139000, v17, OS_LOG_TYPE_ERROR, v16, v47, v18);
        }

- (void)trackError:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__SUCoreDiag_trackError_forReason_withResult_withError___block_invoke;
  block[3] = &unk_189FEA1D0;
  id v18 = v10;
  id v19 = v11;
  id v21 = self;
  int64_t v22 = a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __56__SUCoreDiag_trackError_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  id v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  4LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) _appendToHistory:v6];
  [*(id *)(a1 + 56) trackStats];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setErrorCount:", objc_msgSend(v2, "errorCount") + 1);

  if ([v6 checkedIndications])
  {
    [*(id *)(a1 + 56) trackStats];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setErrorIndicationsCount:", objc_msgSend(v3, "errorIndicationsCount") + 1);

    [*(id *)(a1 + 56) trackStats];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "setErrorAllIndications:",  objc_msgSend(v4, "errorAllIndications") | objc_msgSend(v6, "checkedIndications"));
  }

  if ([*(id *)(a1 + 56) isSharedDiag])
  {
    [*(id *)(a1 + 56) _logTrackedError:@"ERROR" fromLocation:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 trackError:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }
}

- (void)trackAnomaly:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreDiag_trackAnomaly_forReason_withResult_withError___block_invoke;
  block[3] = &unk_189FEA1D0;
  id v18 = v10;
  id v19 = v11;
  id v21 = self;
  int64_t v22 = a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __58__SUCoreDiag_trackAnomaly_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  id v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  8LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) _appendToHistory:v6];
  [*(id *)(a1 + 56) trackStats];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnomalyCount:", objc_msgSend(v2, "anomalyCount") + 1);

  if ([v6 checkedIndications])
  {
    [*(id *)(a1 + 56) trackStats];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnomalyIndicationsCount:", objc_msgSend(v3, "anomalyIndicationsCount") + 1);

    [*(id *)(a1 + 56) trackStats];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "setAnomalyAllIndications:",  objc_msgSend(v4, "anomalyAllIndications") | objc_msgSend(v6, "checkedIndications"));
  }

  if ([*(id *)(a1 + 56) isSharedDiag])
  {
    [*(id *)(a1 + 56) _logTrackedError:@"ANOMALY" fromLocation:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 trackAnomaly:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }
}

- (void)trackFailure:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreDiag_trackFailure_forReason_withResult_withError___block_invoke;
  block[3] = &unk_189FEA1D0;
  id v18 = v10;
  id v19 = v11;
  id v21 = self;
  int64_t v22 = a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __58__SUCoreDiag_trackFailure_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  id v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  16LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) _appendToHistory:v6];
  [*(id *)(a1 + 56) trackStats];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFailureCount:", objc_msgSend(v2, "failureCount") + 1);

  if ([v6 checkedIndications])
  {
    [*(id *)(a1 + 56) trackStats];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFailureIndicationsCount:", objc_msgSend(v3, "failureIndicationsCount") + 1);

    [*(id *)(a1 + 56) trackStats];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "setFailureAllIndications:",  objc_msgSend(v4, "failureAllIndications") | objc_msgSend(v6, "checkedIndications"));
  }

  if ([*(id *)(a1 + 56) isSharedDiag]) {
    [*(id *)(a1 + 56) _logTrackedError:@"FAILURE" fromLocation:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 56) _dumpTracked:@"FAILURE" dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  if (([*(id *)(a1 + 56) isSharedDiag] & 1) == 0)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 trackFailure:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40) withResult:*(void *)(a1 + 64) withError:*(void *)(a1 + 48)];
  }
}

- (void)trackFault:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke;
  block[3] = &unk_189FEA1D0;
  id v18 = v10;
  id v19 = v11;
  id v21 = self;
  int64_t v22 = a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initOfType:fromLocation:forReason:withCode:withError:",  32LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) _appendToHistory:v2];
  [*(id *)(a1 + 56) trackStats];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaultCount:", objc_msgSend(v3, "faultCount") + 1);

  if ([v2 checkedIndications])
  {
    [*(id *)(a1 + 56) trackStats];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFaultIndicationsCount:", objc_msgSend(v4, "faultIndicationsCount") + 1);

    [*(id *)(a1 + 56) trackStats];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "setFaultAllIndications:",  objc_msgSend(v5, "faultAllIndications") | objc_msgSend(v2, "checkedIndications"));
  }

  [*(id *)(a1 + 56) _dumpTracked:@"FAULT" dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  if ([*(id *)(a1 + 56) isSharedDiag])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v6)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v13 = *(void **)(a1 + 64);
          [*(id *)(a1 + 48) checkedDescription];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          int v23 = 138544130;
          uint64_t v24 = v11;
          __int16 v25 = 2114;
          uint64_t v26 = v12;
          __int16 v27 = 2048;
          uint64_t v28 = v13;
          __int16 v29 = 2114;
          int64_t v30 = v14;
          id v15 = "[DIAG_FAULT] FAULT:%{public}@, reason=%{public}@ result=%ld error:%{public}@";
          id v16 = v9;
          uint32_t v17 = 42;
LABEL_13:
          _os_log_fault_impl(&dword_187139000, v16, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v23, v17);
        }
      }

      else if (v10)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 40);
        int64_t v22 = *(void **)(a1 + 64);
        int v23 = 138543874;
        uint64_t v24 = v20;
        __int16 v25 = 2114;
        uint64_t v26 = v21;
        __int16 v27 = 2048;
        uint64_t v28 = v22;
        _os_log_fault_impl( &dword_187139000,  v9,  OS_LOG_TYPE_FAULT,  "[DIAG_FAULT] FAULT:%{public}@, reason=%{public}@ result=%ld",  (uint8_t *)&v23,  0x20u);
      }
    }

    else if (v6)
    {
      if (v10)
      {
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 64);
        [*(id *)(a1 + 48) checkedDescription];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543874;
        uint64_t v24 = v18;
        __int16 v25 = 2048;
        uint64_t v26 = v19;
        __int16 v27 = 2114;
        uint64_t v28 = v14;
        id v15 = "[DIAG_FAULT] FAULT:%{public}@, result=%ld error:%{public}@";
        id v16 = v9;
        uint32_t v17 = 32;
        goto LABEL_13;
      }
    }

    else if (v10)
    {
      __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke_cold_1( (uint64_t *)(a1 + 32),  (uint64_t *)(a1 + 64),  v9);
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s trackFault:forReason:withResult:withError:]( v9,  "trackFault:forReason:withResult:withError:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
  }
}

- (void)trackStateEvent:(id)a3 previousState:(id)a4 handlingEvent:(id)a5 nextState:(id)a6 performingAction:(id)a7 withInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __94__SUCoreDiag_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo___block_invoke;
  block[3] = &unk_189FEA1F8;
  id v28 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  uint64_t v34 = self;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v19;
  dispatch_async(v20, block);
}

void __94__SUCoreDiag_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo___block_invoke( uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    id v4 = v3;
  }

  else
  {
    [v3 description];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v5 = v4;
  id v6 = -[SUCoreDiagPoint initStateEventForFSM:previousState:fsmEvent:nextState:fsmAction:eventInfo:]( objc_alloc(&OBJC_CLASS___SUCoreDiagPoint),  "initStateEventForFSM:previousState:fsmEvent:nextState:fsmAction:eventInfo:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  v4);
  [*(id *)(a1 + 80) _appendToHistory:v6];
  [*(id *)(a1 + 80) trackStats];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStateEventCount:", objc_msgSend(v7, "stateEventCount") + 1);

  if ([*(id *)(a1 + 80) isSharedDiag])
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_187139000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackStateEvent:*(void *)(a1 + 40) previousState:*(void *)(a1 + 48) handlingEvent:*(void *)(a1 + 56) nextState:*(void *)(a1 + 64) performingAction:*(void *)(a1 + 72) withInfo:*(void *)(a1 + 32)];
  }
}

- (void)trackLastReportedUUID:(id)a3
{
  id v4 = a3;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__SUCoreDiag_trackLastReportedUUID___block_invoke;
  v7[3] = &unk_189FE8FC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__SUCoreDiag_trackLastReportedUUID___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSharedDiag] & 1) == 0)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 trackLastReportedUUID:*(void *)(a1 + 40)];
  }

- (int64_t)allIndications
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 allIndications];

  return v3;
}

- (id)copyTrackedStatsClearingAfter:(BOOL)a3
{
  return -[SUCoreDiag copyTrackedStatsClearingAfter:droppingMatchedIndications:]( self,  "copyTrackedStatsClearingAfter:droppingMatchedIndications:",  a3,  0LL);
}

- (id)copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4
{
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__5;
  id v17 = __Block_byref_object_dispose__5;
  id v18 = 0LL;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __71__SUCoreDiag_copyTrackedStatsClearingAfter_droppingMatchedIndications___block_invoke;
  v11[3] = &unk_189FEA220;
  v11[4] = self;
  v11[5] = &v13;
  BOOL v12 = a3;
  v11[6] = a4;
  dispatch_sync(v8, v11);

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __71__SUCoreDiag_copyTrackedStatsClearingAfter_droppingMatchedIndications___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyTrackedStatsClearingAfter:*(unsigned __int8 *)(a1 + 56) droppingMatchedIndications:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)collectTrackedStatsClearingAfter:(BOOL)a3 completion:(id)a4
{
}

- (void)collectTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke;
  v11[3] = &unk_189FEA248;
  BOOL v14 = a3;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _copyTrackedStatsClearingAfter:*(unsigned __int8 *)(a1 + 56) droppingMatchedIndications:*(void *)(a1 + 48)];
  +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 completionQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke_2;
  v7[3] = &unk_189FE92A0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  dispatch_async(v4, v7);
}

uint64_t __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

- (void)dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  BOOL v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v14);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__SUCoreDiag_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory___block_invoke;
  block[3] = &unk_189FEA270;
  void block[4] = self;
  id v19 = v12;
  id v20 = v13;
  int64_t v21 = a4;
  BOOL v22 = a6;
  BOOL v23 = a7;
  id v16 = v13;
  id v17 = v12;
  dispatch_sync(v15, block);
}

uint64_t __85__SUCoreDiag_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpTracked:*(void *)(a1 + 40) dumpingTo:*(void *)(a1 + 56) usingFilename:*(void *)(a1 + 48) clearingStatistics:*(unsigned __int8 *)(a1 + 64) clearingHistory:*(unsigned __int8 *)(a1 + 65)];
}

- (id)loadDump:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = objc_alloc(NSString);
    +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 commonFilesystemBaseDir];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = (id)[v4 initWithFormat:@"%@%@/%@", v6, @"/DiagDump", @"SUDiagDump.plist"];
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 contentsAtPath:v3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDiag loadDump:].cold.1((uint64_t)v3, v19, v21, v22, v23, v24, v25, v26);
    }
    id v16 = 0LL;
    id v17 = 0LL;
    goto LABEL_11;
  }

  id v9 = (void *)MEMORY[0x189607908];
  id v10 = (void *)MEMORY[0x189604010];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = 0LL;
  [v9 unarchivedObjectOfClasses:v15 fromData:v8 error:&v29];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v29;

  if (!v16 || v17)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDiag loadDump:].cold.2();
    }
LABEL_11:
  }

  id v27 = v16;

  return v27;
}

- (void)_appendToHistory:(id)a3
{
  id v12 = a3;
  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    id v5 = (void *)objc_opt_new();
    -[SUCoreDiag setTrackingHistory:](self, "setTrackingHistory:", v5);
  }

  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v12];

  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 count];

  if (v8 >= 0x81)
  {
    do
    {
      -[SUCoreDiag trackingHistory](self, "trackingHistory");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 removeObjectAtIndex:0];

      -[SUCoreDiag trackingHistory](self, "trackingHistory");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v11 = [v10 count];
    }

    while (v11 > 0x80);
  }
}

- (void)_logTrackedError:(id)a3 fromLocation:(id)a4 forReason:(id)a5 withResult:(int64_t)a6 withError:(id)a7
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  int64_t v13 = (int64_t)a5;
  unint64_t v14 = (unint64_t)a7;
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v13 | v14)
  {
    if (v13)
    {
      if (!v14)
      {
        if (!v17) {
          goto LABEL_13;
        }
        int v25 = 138544130;
        id v26 = v11;
        __int16 v27 = 2114;
        id v28 = v12;
        __int16 v29 = 2114;
        int64_t v30 = v13;
        __int16 v31 = 2048;
        int64_t v32 = a6;
        id v18 = "[DIAG_ERROR] %{public}@: %{public}@, reason=%{public}@ result=%ld";
        id v19 = v16;
        uint32_t v20 = 42;
        goto LABEL_4;
      }

      if (!v17) {
        goto LABEL_13;
      }
      [(id)v14 checkedDescription];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v25 = 138544386;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2114;
      int64_t v30 = v13;
      __int16 v31 = 2048;
      int64_t v32 = a6;
      __int16 v33 = 2114;
      uint64_t v34 = v21;
      uint64_t v22 = "[DIAG_ERROR] %{public}@: %{public}@, reason=%{public}@ result=%ld error:%{public}@";
      uint64_t v23 = v16;
      uint32_t v24 = 52;
    }

    else
    {
      if (!v17) {
        goto LABEL_13;
      }
      [(id)v14 checkedDescription];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v25 = 138544130;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2048;
      int64_t v30 = a6;
      __int16 v31 = 2114;
      int64_t v32 = (int64_t)v21;
      uint64_t v22 = "[DIAG_ERROR] %{public}@: %{public}@, result=%ld error:%{public}@";
      uint64_t v23 = v16;
      uint32_t v24 = 42;
    }

    _os_log_error_impl(&dword_187139000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v25, v24);

    goto LABEL_13;
  }

  if (v17)
  {
    int v25 = 138543874;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2048;
    int64_t v30 = a6;
    id v18 = "[DIAG_ERROR] %{public}@: %{public}@, result=%ld";
    id v19 = v16;
    uint32_t v20 = 32;
LABEL_4:
    _os_log_error_impl(&dword_187139000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v25, v20);
  }

- (id)_dumpMaskToString:(int64_t)a3
{
  char v3 = a3;
  if ((a3 & 1) != 0)
  {
    id v4 = @"LOG_ARCHIVE";
    if ((a3 & 2) != 0)
    {
      [@"LOG_ARCHIVE" stringByAppendingString:@"|STDOUT"];

      if ((v3 & 4) != 0) {
        goto LABEL_13;
      }
    }

    else if ((a3 & 4) != 0)
    {
      goto LABEL_13;
    }

    goto LABEL_7;
  }

  if ((a3 & 2) != 0)
  {
    id v4 = @"STDOUT";
    if ((a3 & 4) != 0)
    {
LABEL_13:
      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|FILE");

      if ((v3 & 8) == 0) {
        return v4;
      }
      goto LABEL_8;
    }

- (void)_dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  unint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[SUCoreDiag _dumpMaskToString:](self, "_dumpMaskToString:", a4);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    *(_DWORD *)buf = 138544386;
    if (v7) {
      id v19 = @"YES";
    }
    else {
      id v19 = @"NO";
    }
    unint64_t v68 = (unint64_t)v12;
    __int16 v69 = 2114;
    v70 = v15;
    __int16 v71 = 2114;
    id v72 = v13;
    __int16 v73 = 2114;
    v74 = v18;
    __int16 v75 = 2114;
    v76 = v19;
    _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[DIAG] dump tracked with reason=%{public}@ dumpToMask=%{public}@ filename=%{public}@ clearStatistics=%{public}@ cl earHistory=%{public}@",  buf,  0x34u);
  }

  if ((a4 & 2) != 0)
  {
    if (v8) {
      uint32_t v20 = @"YES";
    }
    else {
      uint32_t v20 = @"NO";
    }
    if (v7) {
      uint64_t v21 = @"YES";
    }
    else {
      uint64_t v21 = @"NO";
    }
    NSLog( (NSString *)@"[DIAG] dump tracked with reason=%@ dumpToMask=%@ filename=%@ clearStatistics=%@ clearHistory=%@",  v12,  v15,  v13,  v20,  v21);
  }

  if ((a4 & 4) != 0)
  {
    uint64_t v22 = (void *)objc_opt_new();
    if ((a4 & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v23 = 0LL;
    if (!a4) {
      goto LABEL_57;
    }
    goto LABEL_22;
  }

  uint64_t v22 = 0LL;
  if ((a4 & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v23 = (void *)objc_opt_new();
LABEL_22:
  if (v12)
  {
    [v22 setSafeObject:v12 forKey:@"reportReason"];
    [v23 setSafeObject:v12 forKey:@"reportReason"];
  }

  BOOL v65 = v7;
  v66 = v23;
  -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
  uint32_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setSafeObject:v25 forKey:@"UUID"];

    -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setSafeObject:v26 forKey:@"UUID"];

    if ((a4 & 1) != 0)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 oslog];
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        unint64_t v68 = (unint64_t)v29;
        _os_log_impl(&dword_187139000, v28, OS_LOG_TYPE_DEFAULT, "[DIAG] DUMP_UUID: %{public}@", buf, 0xCu);
      }
    }

    if ((a4 & 2) != 0)
    {
      -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)@"[DIAG] DUMP_UUID: %@", v30);
    }
  }

  -[SUCoreDiag trackStats](self, "trackStats");
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SUCoreDiag trackStats](self, "trackStats");
    int64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v33 = v22;
    [v22 setSafeObject:v32 forKey:@"reportStats"];

    -[SUCoreDiag trackStats](self, "trackStats");
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 summary];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v66 setSafeObject:v35 forKey:@"reportStats"];

    if ((a4 & 1) != 0)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 oslog];
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDiag trackStats](self, "trackStats");
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        unint64_t v68 = (unint64_t)v38;
        _os_log_impl(&dword_187139000, v37, OS_LOG_TYPE_DEFAULT, "[DIAG] DUMP_STATS:\n%{public}@", buf, 0xCu);
      }
    }

    uint64_t v22 = v33;
    if ((a4 & 2) != 0)
    {
      -[SUCoreDiag trackStats](self, "trackStats");
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)@"[DIAG] DUMP_STATS:\n%@", v39);
    }
  }

  BOOL v64 = v8;
  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v40 count];

  BOOL v7 = v65;
  if (v41)
  {
    -[SUCoreDiag trackingHistory](self, "trackingHistory");
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v42);
    v43 = -[SUCoreDiag trackingHistory](self, "trackingHistory");
    uint64_t v44 = [v43 count];

    if (v44)
    {
      v60 = v22;
      v61 = v15;
      id v62 = v13;
      id v63 = v12;
      unint64_t v45 = 0LL;
      id v46 = 0LL;
      do
      {
        v47 = -[SUCoreDiag trackingHistory](self, "trackingHistory");
        [v47 objectAtIndexedSubscript:v45];
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        id v49 = objc_alloc(NSString);
        uint64_t v50 = [v48 summary];
        v51 = (void *)v50;
        if (v46)
        {
          uint64_t v52 = [v49 initWithFormat:@",[%04lu:%@]", v45, v50];

          uint64_t v53 = [v46 stringByAppendingString:v52];

          v51 = (void *)v52;
          id v46 = (void *)v53;
        }

        else
        {
          id v46 = (void *)[v49 initWithFormat:@"[%04lu:%@]", v45, v50];
        }

        if ((a4 & 1) != 0)
        {
          v54 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          [v54 oslog];
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            unint64_t v68 = v45;
            __int16 v69 = 2114;
            v70 = v48;
            _os_log_impl( &dword_187139000,  v55,  OS_LOG_TYPE_DEFAULT,  "[DIAG] DUMP_HISTORY[%04lu]: %{public}@",  buf,  0x16u);
          }
        }

        if ((a4 & 2) != 0) {
          NSLog((NSString *)@"[DIAG] DUMP_HISTORY[%04lu]: %@", v45, v48);
        }

        ++v45;
        v56 = -[SUCoreDiag trackingHistory](self, "trackingHistory");
        unint64_t v57 = [v56 count];
      }

      while (v45 < v57);
      id v13 = v62;
      id v12 = v63;
      BOOL v7 = v65;
      uint64_t v22 = v60;
      uint64_t v15 = v61;
      if (v46)
      {
        [v66 setSafeObject:v46 forKey:@"reportHistory"];
      }
    }
  }

  if ((a4 & 4) != 0) {
    -[SUCoreDiag _dumpToFile:dumpingDict:forReason:](self, "_dumpToFile:dumpingDict:forReason:", v13, v22, v12);
  }
  BOOL v8 = v64;
  uint64_t v23 = v66;
  if ((a4 & 8) != 0) {
    -[SUCoreDiag _dumpEvent:](self, "_dumpEvent:", v66);
  }
LABEL_57:
  if (v8)
  {
    v58 = objc_alloc_init(&OBJC_CLASS___SUCoreDiagStats);
    -[SUCoreDiag setTrackStats:](self, "setTrackStats:", v58);
  }

  if (v7)
  {
    v59 = -[SUCoreDiag trackingHistory](self, "trackingHistory");
    [v59 removeAllObjects];
  }
}

- (void)_dumpToFile:(id)a3 dumpingDict:(id)a4 forReason:(id)a5
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  id v43 = 0LL;
  [MEMORY[0x1896078F8] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v43];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = v43;
  unint64_t v14 = v13;
  if (!v12 || v13)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.3((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
    }
  }

  else
  {
    if (!v8)
    {
      id v15 = objc_alloc(NSString);
      +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 commonFilesystemBaseDir];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiag appendingDumpFilename](self, "appendingDumpFilename");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[SUCoreDiag appendingDumpFilename](self, "appendingDumpFilename");
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v8 = (id)[v15 initWithFormat:@"%@%@/%@", v17, @"/DiagDump", v19];
      }

      else
      {
        id v8 = (id)[v15 initWithFormat:@"%@%@/%@", v17, @"/DiagDump", @"SUDiagDump.plist"];
      }
    }

    [MEMORY[0x1896078A8] defaultManager];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v28 fileExistsAtPath:v8])
    {
      id v42 = 0LL;
      char v29 = [v28 removeItemAtPath:v8 error:&v42];
      id v30 = v42;
      if ((v29 & 1) == 0)
      {
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 oslog];
        int64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v47 = v9;
          __int16 v48 = 2114;
          id v49 = v8;
          __int16 v50 = 2114;
          id v51 = v30;
          _os_log_error_impl( &dword_187139000,  v32,  OS_LOG_TYPE_ERROR,  "[DIAG_ERROR] ANOMALY: [%@] could not remove pre-existing dump file: %{public}@, error: %{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      id v30 = 0LL;
    }

    [v8 stringByDeletingLastPathComponent];
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      id v41 = v30;
      char v34 = [v28 createDirectoryAtPath:v33 withIntermediateDirectories:1 attributes:0 error:&v41];
      uint64_t v21 = (os_log_s *)v41;

      if ((v34 & 1) == 0 && (!v21 || -[os_log_s code](v21, "code") != 17))
      {
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 oslog];
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.2();
        }
      }
    }

    else
    {
      uint64_t v21 = (os_log_s *)v30;
    }

    uint64_t v44 = *MEMORY[0x189607530];
    uint64_t v45 = *MEMORY[0x189607538];
    [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    char v38 = [v28 createFileAtPath:v8 contents:v12 attributes:v37];

    if ((v38 & 1) == 0)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 oslog];
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.1();
      }
    }
  }
}

- (void)_dumpEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 setSafeObject:@"coreDiagReport" forKey:@"event"];
    +[SUCoreEventReporter sharedReporter](&OBJC_CLASS___SUCoreEventReporter, "sharedReporter");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 sendEvent:v4];
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDiag _dumpEvent:].cold.1((os_log_t)v5);
    }
  }
}

- (id)_copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreDiag trackStats](self, "trackStats");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (SUCoreDiagStats *)[v8 copy];

  if (v5)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___SUCoreDiagStats);
    -[SUCoreDiag setTrackStats:](self, "setTrackStats:", v10);
  }

  if (a4)
  {
    uint64_t v55 = -[SUCoreDiagStats endFailCount](v9, "endFailCount");
    uint64_t v52 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
    uint64_t v51 = -[SUCoreDiagStats endFailAllIndications](v9, "endFailAllIndications");
    uint64_t v54 = -[SUCoreDiagStats errorCount](v9, "errorCount");
    uint64_t v50 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
    uint64_t v49 = -[SUCoreDiagStats errorAllIndications](v9, "errorAllIndications");
    uint64_t v53 = -[SUCoreDiagStats anomalyCount](v9, "anomalyCount");
    uint64_t v48 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
    uint64_t v47 = -[SUCoreDiagStats anomalyAllIndications](v9, "anomalyAllIndications");
    uint64_t v11 = -[SUCoreDiagStats failureCount](v9, "failureCount");
    uint64_t v46 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
    uint64_t v45 = -[SUCoreDiagStats failureAllIndications](v9, "failureAllIndications");
    uint64_t v12 = -[SUCoreDiagStats faultCount](v9, "faultCount");
    uint64_t v13 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
    uint64_t v14 = -[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications");
    +[SUCoreErrorInformation summaryOfIndications:](&OBJC_CLASS___SUCoreErrorInformation, "summaryOfIndications:", a4);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[SUCoreDiagStats endFailAllIndications](v9, "endFailAllIndications");
    BOOL v17 = v16 == a4;
    if (v16 == a4)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 oslog];
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
        uint64_t v21 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
        uint64_t v22 = @"endFails";
        *(_DWORD *)buf = 134218498;
        uint64_t v57 = v20;
        __int16 v58 = 2114;
        if (v21 == 1) {
          uint64_t v22 = @"endFail";
        }
        v59 = v22;
        __int16 v60 = 2114;
        v61 = v15;
        _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ matched %{public}@]",  buf,  0x20u);
      }

      uint64_t v51 = 0LL;
      uint64_t v52 = 0LL;
      v55 -= -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
    }

    if (-[SUCoreDiagStats errorAllIndications](v9, "errorAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 oslog];
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
        uint64_t v26 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
        uint64_t v27 = @"errors";
        *(_DWORD *)buf = 134218754;
        uint64_t v57 = v25;
        __int16 v58 = 2114;
        if (v26 == 1) {
          uint64_t v27 = @"error";
        }
        v59 = v15;
        __int16 v60 = 2114;
        v61 = v27;
        __int16 v62 = 2114;
        id v63 = v15;
        _os_log_impl( &dword_187139000,  v24,  OS_LOG_TYPE_DEFAULT,  "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]",  buf,  0x2Au);
      }

      uint64_t v49 = 0LL;
      uint64_t v50 = 0LL;
      v54 -= -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
      BOOL v17 = 1;
    }

    if (-[SUCoreDiagStats anomalyAllIndications](v9, "anomalyAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
        uint64_t v31 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
        int64_t v32 = @"anomalies";
        *(_DWORD *)buf = 134218754;
        uint64_t v57 = v30;
        __int16 v58 = 2114;
        if (v31 == 1) {
          int64_t v32 = @"anomaly";
        }
        v59 = v15;
        __int16 v60 = 2114;
        v61 = v32;
        __int16 v62 = 2114;
        id v63 = v15;
        _os_log_impl( &dword_187139000,  v29,  OS_LOG_TYPE_DEFAULT,  "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]",  buf,  0x2Au);
      }

      uint64_t v47 = 0LL;
      uint64_t v48 = 0LL;
      v53 -= -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
      BOOL v17 = 1;
    }

    if (-[SUCoreDiagStats failureAllIndications](v9, "failureAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 oslog];
      char v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
        uint64_t v36 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
        uint64_t v37 = @"failures";
        *(_DWORD *)buf = 134218754;
        uint64_t v57 = v35;
        __int16 v58 = 2114;
        if (v36 == 1) {
          uint64_t v37 = @"failure";
        }
        v59 = v15;
        __int16 v60 = 2114;
        v61 = v37;
        __int16 v62 = 2114;
        id v63 = v15;
        _os_log_impl( &dword_187139000,  v34,  OS_LOG_TYPE_DEFAULT,  "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]",  buf,  0x2Au);
      }

      v11 -= -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
      uint64_t v45 = 0LL;
      uint64_t v46 = 0LL;
      if (-[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications") != a4) {
        goto LABEL_35;
      }
    }

    else if (-[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications") != a4)
    {
      if (!v17) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }

    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    char v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 oslog];
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
      uint64_t v41 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
      id v42 = @"faults";
      *(_DWORD *)buf = 134218754;
      uint64_t v57 = v40;
      __int16 v58 = 2114;
      if (v41 == 1) {
        id v42 = @"fault";
      }
      v59 = v15;
      __int16 v60 = 2114;
      v61 = v42;
      __int16 v62 = 2114;
      id v63 = v15;
      _os_log_impl( &dword_187139000,  v39,  OS_LOG_TYPE_DEFAULT,  "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]",  buf,  0x2Au);
    }

    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    v12 -= -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
LABEL_35:
    id v43 = -[SUCoreDiagStats initWithBeginCount:withEndSuccessCount:withEndFailCount:withEndFailIndicationsCount:withEndFailAllIndications:withErrorCount:withErrorIndicationsCount:withErrorAllIndications:withAnomalyCount:withAnomalyIndicationsCount:withAnomalyAllIndications:withFailureCount:withFailureIndicationsCount:withFailureAllIndications:withFaultCount:withFaultIndicationsCount:withFaultAllIndications:withStateEventCount:]( objc_alloc(&OBJC_CLASS___SUCoreDiagStats),  "initWithBeginCount:withEndSuccessCount:withEndFailCount:withEndFailIndicationsCount:withEndFailAllIndication s:withErrorCount:withErrorIndicationsCount:withErrorAllIndications:withAnomalyCount:withAnomalyIndicationsCo unt:withAnomalyAllIndications:withFailureCount:withFailureIndicationsCount:withFailureAllIndications:withFau ltCount:withFaultIndicationsCount:withFaultAllIndications:withStateEventCount:",  -[SUCoreDiagStats beginCount](v9, "beginCount"),  -[SUCoreDiagStats endSuccessCount](v9, "endSuccessCount"),  v55,  v52,  v51,  v54,  v50,  v49,  v53,  v48,  v47,  v11,  v46,  v45,  v12,  v13,  v14,  -[SUCoreDiagStats stateEventCount](v9, "stateEventCount"));

    id v9 = v43;
LABEL_36:
  }

  return v9;
}

- (NSMutableArray)trackingHistory
{
  return self->_trackingHistory;
}

- (void)setTrackingHistory:(id)a3
{
}

- (BOOL)isSharedDiag
{
  return self->_isSharedDiag;
}

- (void)setIsSharedDiag:(BOOL)a3
{
  self->_isSharedDiag = a3;
}

- (OS_dispatch_queue)trackingQueue
{
  return self->_trackingQueue;
}

- (SUCoreDiagStats)trackStats
{
  return self->_trackStats;
}

- (void)setTrackStats:(id)a3
{
}

- (NSString)uniqueInstanceName
{
  return self->_uniqueInstanceName;
}

- (void)setUniqueInstanceName:(id)a3
{
}

- (NSString)appendingDumpFilename
{
  return self->_appendingDumpFilename;
}

- (void)setAppendingDumpFilename:(id)a3
{
}

- (NSString)lastReportedUUID
{
  return self->_lastReportedUUID;
}

- (void)setLastReportedUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithAppendedDomain:(uint64_t)a3 appendingDumpFilename:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke_cold_1( uint64_t *a1,  uint64_t *a2,  os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_fault_impl( &dword_187139000,  log,  OS_LOG_TYPE_FAULT,  "[DIAG_FAULT] FAULT:%{public}@, result=%ld",  (uint8_t *)&v5,  0x16u);
  OUTLINED_FUNCTION_10();
}

- (void)loadDump:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)loadDump:.cold.2()
{
}

- (void)_dumpToFile:dumpingDict:forReason:.cold.1()
{
}

- (void)_dumpToFile:dumpingDict:forReason:.cold.2()
{
}

- (void)_dumpToFile:(uint64_t)a3 dumpingDict:(uint64_t)a4 forReason:(uint64_t)a5 .cold.3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_dumpEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( &dword_187139000,  log,  OS_LOG_TYPE_ERROR,  "[DIAG_ERROR] DUMP_LOSS: unable to create event to report",  v1,  2u);
}

@end