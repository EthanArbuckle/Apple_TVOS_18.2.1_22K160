@interface MADAutoAssetHistory
+ (id)autoAssetHistory;
+ (void)loadPersistedState;
+ (void)recordFailedOperation:(int64_t)a3 fromClient:(id)a4 forAssetID:(id)a5 withSelector:(id)a6 failingWithError:(id)a7;
+ (void)recordFailedOperation:(int64_t)a3 fromClient:(id)a4 forClientDomainName:(id)a5 forAssetSetIdentifier:(id)a6 forAtomicInstance:(id)a7 failingWithError:(id)a8;
+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 failingWithError:(id)a5;
+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 forAssetID:(id)a5 withSelector:(id)a6 failingWithError:(id)a7;
+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 forClientDomainName:(id)a5 forAssetSetIdentifier:(id)a6 forAtomicInstance:(id)a7 failingWithError:(id)a8;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 forAssetID:(id)a6 withSelector:(id)a7;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 fromLayer:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8 usageCount:(int64_t)a9 configuredCount:(int64_t)a10 requestedCount:(int64_t)a11 fromPallasCount:(int64_t)a12 vendingCount:(int64_t)a13 forClientDomainName:(id)a14 forAssetSetIdentifier:(id)a15 forAtomicInstance:(id)a16 withAddendumMessage:(id)a17 failingWithError:(id)a18;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9 withAddendumMessage:(id)a10;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 configuredCount:(int64_t)a6 requestedCount:(int64_t)a7 fromPallasCount:(int64_t)a8 vendingCount:(int64_t)a9 forClientDomainName:(id)a10 forAssetSetIdentifier:(id)a11 forAtomicInstance:(id)a12 withAddendumMessage:(id)a13;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 forAssetID:(id)a6 withSelector:(id)a7;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 fromClient:(id)a6;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9;
+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9 withAddendumMessage:(id)a10;
- (BOOL)persistedStateLoaded;
- (MADAutoAssetHistory)init;
- (MADAutoAssetHistoryTracker)trackerAtomic;
- (MADAutoAssetHistoryTracker)trackerError;
- (MADAutoAssetHistoryTracker)trackerFilesystem;
- (MADAutoAssetHistoryTracker)trackerLocker;
- (MADAutoAssetHistoryTracker)trackerScheduler;
- (MADAutoAssetHistoryTracker)trackerSecure;
- (MADAutoAssetHistoryTracker)trackerStager;
- (OS_dispatch_queue)historyProtectionQueue;
- (id)_trackerForHistoryType:(int64_t)a3;
- (void)setPersistedStateLoaded:(BOOL)a3;
@end

@implementation MADAutoAssetHistory

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8
{
}

+ (id)autoAssetHistory
{
  if (autoAssetHistory_dispatchOnceAutoAssetHistory != -1) {
    dispatch_once(&autoAssetHistory_dispatchOnceAutoAssetHistory, &__block_literal_global_9);
  }
  return (id)autoAssetHistory___autoAssetHistory;
}

- (OS_dispatch_queue)historyProtectionQueue
{
  return self->_historyProtectionQueue;
}

- (BOOL)persistedStateLoaded
{
  return self->_persistedStateLoaded;
}

- (id)_trackerForHistoryType:(int64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory historyProtectionQueue](self, "historyProtectionQueue"));
  dispatch_assert_queue_V2(v5);

  switch(a3)
  {
    case 0LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerFilesystem](self, "trackerFilesystem"));
      break;
    case 1LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerLocker](self, "trackerLocker"));
      break;
    case 2LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerAtomic](self, "trackerAtomic"));
      break;
    case 3LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerError](self, "trackerError"));
      break;
    case 4LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerStager](self, "trackerStager"));
      break;
    case 5LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerScheduler](self, "trackerScheduler"));
      break;
    case 6LL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistory trackerSecure](self, "trackerSecure"));
      break;
    default:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetHistory _trackerForHistoryType:].cold.1(a3, v8);
      }

      v6 = 0LL;
      break;
  }

  return v6;
}

- (MADAutoAssetHistoryTracker)trackerLocker
{
  return self->_trackerLocker;
}

- (MADAutoAssetHistory)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADAutoAssetHistory;
  v2 = -[MADAutoAssetHistory init](&v23, "init");
  if (v2)
  {
    v3 = (const char *)[@"com.apple.MobileAsset.daemon.autoassethistory" UTF8String];
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create(v3, v5);
    historyProtectionQueue = v2->_historyProtectionQueue;
    v2->_historyProtectionQueue = (OS_dispatch_queue *)v6;

    v8 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  0LL,  785971LL,  v2->_historyProtectionQueue);
    trackerFilesystem = v2->_trackerFilesystem;
    v2->_trackerFilesystem = v8;

    v10 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  1LL,  742306LL,  v2->_historyProtectionQueue);
    trackerLocker = v2->_trackerLocker;
    v2->_trackerLocker = v10;

    v12 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  3LL,  742306LL,  v2->_historyProtectionQueue);
    trackerError = v2->_trackerError;
    v2->_trackerError = v12;

    v14 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  2LL,  742306LL,  v2->_historyProtectionQueue);
    trackerAtomic = v2->_trackerAtomic;
    v2->_trackerAtomic = v14;

    v16 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  4LL,  742306LL,  v2->_historyProtectionQueue);
    trackerStager = v2->_trackerStager;
    v2->_trackerStager = v16;

    v18 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  5LL,  742306LL,  v2->_historyProtectionQueue);
    trackerScheduler = v2->_trackerScheduler;
    v2->_trackerScheduler = v18;

    v20 = -[MADAutoAssetHistoryTracker initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:]( objc_alloc(&OBJC_CLASS___MADAutoAssetHistoryTracker),  "initForHistoryType:withMaximumFilesystemBytes:usingProtectionQueue:",  6LL,  742306LL,  v2->_historyProtectionQueue);
    trackerSecure = v2->_trackerSecure;
    v2->_trackerSecure = v20;

    v2->_persistedStateLoaded = 0;
  }

  return v2;
}

void __39__MADAutoAssetHistory_autoAssetHistory__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetHistory);
  v2 = (void *)autoAssetHistory___autoAssetHistory;
  autoAssetHistory___autoAssetHistory = (uint64_t)v1;
}

+ (void)loadPersistedState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetHistory autoAssetHistory](&OBJC_CLASS___MADAutoAssetHistory, "autoAssetHistory"));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 historyProtectionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__MADAutoAssetHistory_loadPersistedState__block_invoke;
  block[3] = &unk_34DBC0;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

id __41__MADAutoAssetHistory_loadPersistedState__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) persistedStateLoaded];
  if ((result & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerFilesystem]);
    [v3 loadPersistedState];

    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerLocker]);
    [v4 loadPersistedState];

    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerAtomic]);
    [v5 loadPersistedState];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerError]);
    [v6 loadPersistedState];

    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerStager]);
    [v7 loadPersistedState];

    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerScheduler]);
    [v8 loadPersistedState];

    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) trackerSecure]);
    [v9 loadPersistedState];

    return [*(id *)(a1 + 32) setPersistedStateLoaded:1];
  }

  return result;
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 forAssetID:(id)a6 withSelector:(id)a7
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 fromClient:(id)a6
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9 withAddendumMessage:(id)a10
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 forAssetID:(id)a6 withSelector:(id)a7
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 usageCount:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAtomicInstance:(id)a9 withAddendumMessage:(id)a10
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromLayer:(int64_t)a5 configuredCount:(int64_t)a6 requestedCount:(int64_t)a7 fromPallasCount:(int64_t)a8 vendingCount:(int64_t)a9 forClientDomainName:(id)a10 forAssetSetIdentifier:(id)a11 forAtomicInstance:(id)a12 withAddendumMessage:(id)a13
{
}

+ (void)recordFailedOperation:(int64_t)a3 fromClient:(id)a4 forAssetID:(id)a5 withSelector:(id)a6 failingWithError:(id)a7
{
}

+ (void)recordFailedOperation:(int64_t)a3 fromClient:(id)a4 forClientDomainName:(id)a5 forAssetSetIdentifier:(id)a6 forAtomicInstance:(id)a7 failingWithError:(id)a8
{
}

+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 failingWithError:(id)a5
{
}

+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 forAssetID:(id)a5 withSelector:(id)a6 failingWithError:(id)a7
{
}

+ (void)recordFailedOperation:(int64_t)a3 fromLayer:(int64_t)a4 forClientDomainName:(id)a5 forAssetSetIdentifier:(id)a6 forAtomicInstance:(id)a7 failingWithError:(id)a8
{
}

+ (void)recordOperation:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 fromLayer:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8 usageCount:(int64_t)a9 configuredCount:(int64_t)a10 requestedCount:(int64_t)a11 fromPallasCount:(int64_t)a12 vendingCount:(int64_t)a13 forClientDomainName:(id)a14 forAssetSetIdentifier:(id)a15 forAtomicInstance:(id)a16 withAddendumMessage:(id)a17 failingWithError:(id)a18
{
  id v20 = a5;
  id v21 = a7;
  id v22 = a8;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  id v27 = a18;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetHistory autoAssetHistory](&OBJC_CLASS___MADAutoAssetHistory, "autoAssetHistory"));
  v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v28 historyProtectionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __266__MADAutoAssetHistory_recordOperation_toHistoryType_fromClient_fromLayer_forAssetID_withSelector_usageCount_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_failingWithError___block_invoke;
  block[3] = &unk_34E700;
  id v43 = v28;
  id v44 = v20;
  int64_t v53 = a3;
  int64_t v54 = a6;
  id v45 = v21;
  id v46 = v22;
  __int128 v55 = *(_OWORD *)&a9;
  __int128 v56 = *(_OWORD *)&a11;
  int64_t v57 = a13;
  id v47 = v23;
  id v48 = v24;
  id v49 = v25;
  id v50 = v26;
  id v51 = v27;
  int64_t v52 = a4;
  id v41 = v27;
  id v30 = v26;
  id v31 = v25;
  id v32 = v24;
  id v33 = v23;
  id v34 = v22;
  id v35 = v21;
  id v36 = v20;
  id v37 = v28;
  dispatch_async(v29, block);
}

void __266__MADAutoAssetHistory_recordOperation_toHistoryType_fromClient_fromLayer_forAssetID_withSelector_usageCount_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_failingWithError___block_invoke( uint64_t a1)
{
  if ([*(id *)(a1 + 32) persistedStateLoaded])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _trackerForHistoryType:*(void *)(a1 + 104)]);
    if (v2)
    {
      v3 = v2;
      [v2 recordHistoryEntry:*(void *)(a1 + 112) toHistoryType:*(void *)(a1 + 104) fromClient:*(void *)(a1 + 40) fromLayer:*(void *)(a1 + 120) forAssetID:*(void *)(a1 + 48) withSelector:*(void *)(a1 + 56) usageCount:*(void *)(a1 + 128) configuredCount:*(void *)(a1 + 136) request edCount:*(void *)(a1 + 144) fromPallasCount:*(void *)(a1 + 152) vendingCount:*(void *)(a1 + 160) forClientDomainName:*(void *)(a1 + 64) forAssetSetIdentifier:*(void *)(a1 + 72) forAtomicInstance:*(void *)(a1 + 80) withAddendumMes sage:*(void *)(a1 + 88) failingWithError:*(void *)(a1 + 96)];
      v2 = v3;
    }
  }

- (MADAutoAssetHistoryTracker)trackerFilesystem
{
  return self->_trackerFilesystem;
}

- (MADAutoAssetHistoryTracker)trackerAtomic
{
  return self->_trackerAtomic;
}

- (MADAutoAssetHistoryTracker)trackerError
{
  return self->_trackerError;
}

- (MADAutoAssetHistoryTracker)trackerStager
{
  return self->_trackerStager;
}

- (MADAutoAssetHistoryTracker)trackerScheduler
{
  return self->_trackerScheduler;
}

- (MADAutoAssetHistoryTracker)trackerSecure
{
  return self->_trackerSecure;
}

- (void)setPersistedStateLoaded:(BOOL)a3
{
  self->_persistedStateLoaded = a3;
}

- (void).cxx_destruct
{
}

- (void)_trackerForHistoryType:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY:_trackerForHistoryType} | invalid history-type:%ld",  (uint8_t *)&v2,  0xCu);
}

@end