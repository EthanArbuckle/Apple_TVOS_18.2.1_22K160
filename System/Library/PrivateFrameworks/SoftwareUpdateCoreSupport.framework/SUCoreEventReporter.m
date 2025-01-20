@interface SUCoreEventReporter
+ (id)_errorDomainAbbreviation:(id)a3;
+ (id)_nsURLSessionTaskNameForState:(int64_t)a3;
+ (id)_sharedReporter:(id)a3 withAccessControl:(int64_t)a4;
+ (id)accessControlSummary:(int64_t)a3;
+ (id)buildSplunkServerURLFromBase:(id)a3;
+ (id)initSharedReporterStoringToPath:(id)a3;
+ (id)sharedReporter;
+ (int64_t)eventForEventString:(id)a3;
+ (void)augmentEvent:(id)a3 withError:(id)a4;
- (BOOL)_sendFirstAwaitingRetry;
- (BOOL)_storeServerURLMetadata:(id)a3 toFileUUID:(id)a4;
- (BOOL)dropEventsOnSendFailure;
- (BOOL)eventExtensionsDetermined;
- (BOOL)sendEvent:(id)a3;
- (BOOL)sendEvent:(id)a3 returningFinalEventDictionary:(id *)a4;
- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4;
- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4 returningFinalEventDictionary:(id *)a5;
- (BOOL)splunkAccessCreated;
- (NSMutableArray)awaitingRetry;
- (NSMutableDictionary)eventExtensions;
- (NSOperationQueue)inProcessOperationQueue;
- (NSString)persistedStatePath;
- (NSString)storeToPath;
- (NSURL)splunkURL;
- (NSURLSession)inProcessSession;
- (NSURLSessionConfiguration)inProcessConfig;
- (OS_dispatch_queue)splunkStateQueue;
- (SUCoreEvent)lastErrorEvent;
- (SUCoreEventReporterDelegate)reporterDelegate;
- (SUCorePersistedState)activeEventsState;
- (id)_activeEventForFileUUID:(id)a3;
- (id)_alignPersistedStateWithExistingFileUUIDs:(id)a3;
- (id)_buildContextFromNVRAMBootArgs;
- (id)_copyEscapeStringsForEventData:(id)a3;
- (id)_getJSONDataFromPayload:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5;
- (id)_getSplunkRequestForURL:(id)a3;
- (id)_getSplunkServerURL:(id)a3;
- (id)_newExistingFileUUIDs;
- (id)_newScrubbedEvents:(id)a3;
- (id)_removeFileUUID:(id)a3 fromFilesToRetry:(id)a4;
- (id)_storeJSONData:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5;
- (id)_synchonizeDiscoveredCanceling:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredCompleted:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredRunning:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredSuspended:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredUnknown:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)initStoringToPath:(id)a3;
- (id)initStoringToPath:(id)a3 withAccessControl:(int64_t)a4;
- (id)onceIdleCompletion;
- (id)sendEventReturningAugmented:(id)a3 toServerURL:(id)a4;
- (int)activeSendTaskCount;
- (int64_t)accessControl;
- (int64_t)currentAccessControl;
- (void)_adoptLastErrorEvent:(id)a3;
- (void)_awaitRetryingFileUUID:(id)a3;
- (void)_checkWhetherIdle:(id)a3;
- (void)_decrementActiveSendCount;
- (void)_determineEventExtensions;
- (void)_incrementActiveSendCount:(id)a3;
- (void)_removeActiveEventForFileUUID:(id)a3;
- (void)_removeFileUUID:(id)a3 loggingError:(BOOL)a4 forReason:(id)a5;
- (void)_sendAllAwaitingRetry;
- (void)_sendCoreEvent:(id)a3;
- (void)_sendCoreEvents:(id)a3 secondEvent:(id)a4;
- (void)_sendInterruptedFromStorage:(id)a3;
- (void)_sendSplunkEvents:(id)a3 forEventUUID:(id)a4 toServerURL:(id)a5;
- (void)_splunkAccessSetup;
- (void)_synchronizeWithNSURLSessionExpecting:(id)a3;
- (void)_updateActiveEvent:(id)a3 forFileUUID:(id)a4;
- (void)_uploadFromFile:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5 toServerURL:(id)a6;
- (void)dropOnSendFailure:(BOOL)a3;
- (void)flushEvent;
- (void)handleSendFinishedInvalidFileUUID:(id)a3 withError:(id)a4;
- (void)handleSendFinishedWithFileUUID:(id)a3 sendSucceeded:(BOOL)a4 withStatusCode:(int64_t)a5 withError:(id)a6;
- (void)indicateOnceIdle:(id)a3;
- (void)setAccessControl:(int64_t)a3;
- (void)setActiveEventsState:(id)a3;
- (void)setActiveSendTaskCount:(int)a3;
- (void)setAwaitingRetry:(id)a3;
- (void)setDropEventsOnSendFailure:(BOOL)a3;
- (void)setEventExtensions:(id)a3;
- (void)setEventExtensionsDetermined:(BOOL)a3;
- (void)setInProcessConfig:(id)a3;
- (void)setInProcessOperationQueue:(id)a3;
- (void)setInProcessSession:(id)a3;
- (void)setLastErrorEvent:(id)a3;
- (void)setOnceIdleCompletion:(id)a3;
- (void)setPersistedStatePath:(id)a3;
- (void)setReporterDelegate:(id)a3;
- (void)setSplunkAccessCreated:(BOOL)a3;
- (void)setSplunkURL:(id)a3;
- (void)setStoreToPath:(id)a3;
@end

@implementation SUCoreEventReporter

+ (id)initSharedReporterStoringToPath:(id)a3
{
  return (id)[a1 _sharedReporter:a3 withAccessControl:1];
}

+ (id)sharedReporter
{
  return (id)[a1 _sharedReporter:0 withAccessControl:1];
}

+ (id)_sharedReporter:(id)a3 withAccessControl:(int64_t)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke;
  v10[3] = &unk_189FE9200;
  id v11 = v5;
  int64_t v12 = a4;
  uint64_t v6 = _sharedReporter_withAccessControl__reporterOnce;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&_sharedReporter_withAccessControl__reporterOnce, v10);
  }
  id v8 = (id)_sharedReporter_withAccessControl__reporter;

  return v8;
}

void __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke(uint64_t a1)
{
  id v1 = -[SUCoreEventReporter initStoringToPath:withAccessControl:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporter),  "initStoringToPath:withAccessControl:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  v2 = (void *)_sharedReporter_withAccessControl__reporter;
  _sharedReporter_withAccessControl__reporter = (uint64_t)v1;
}

- (id)initStoringToPath:(id)a3
{
  id v4 = a3;
  id v5 = -[SUCoreEventReporter initStoringToPath:withAccessControl:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporter),  "initStoringToPath:withAccessControl:",  v4,  1LL);

  return v5;
}

- (id)initStoringToPath:(id)a3 withAccessControl:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___SUCoreEventReporter;
  id v7 = -[SUCoreEventReporter init](&v52, sel_init);
  id v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  awaitingRetry = v7->_awaitingRetry;
  v7->_awaitingRetry = 0LL;

  splunkURL = v8->_splunkURL;
  v8->_splunkURL = 0LL;

  id v11 = objc_alloc(NSString);
  +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 commonDomain];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = [v11 initWithFormat:@"%@.%@", v13, @"core.splunk.state"];
  v15 = (const char *)[v14 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
  splunkStateQueue = v8->_splunkStateQueue;
  v8->_splunkStateQueue = (OS_dispatch_queue *)v17;

  if (!v8->_splunkStateQueue)
  {
    v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v23 = objc_alloc(NSString);
    +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSString commonDomain](v22, "commonDomain");
    v25 = (void *)[v23 initWithFormat:@"unable to create dispatch queue domain(%@.%@)", v24, @"core.splunk.state"];
    [v20 trackError:@"[EVENT_REPORTER] INIT" forReason:v25 withResult:8100 withError:0];

    goto LABEL_6;
  }
  v19 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v19 oslog];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v21 commonDomain];
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v22;
    __int16 v55 = 2114;
    v56 = @"core.splunk.state";
    _os_log_impl( &dword_187139000,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)",  buf,  0x16u);

LABEL_6:
  }

  inProcessConfig = v8->_inProcessConfig;
  v8->_inProcessConfig = 0LL;

  inProcessOperationQueue = v8->_inProcessOperationQueue;
  v8->_inProcessOperationQueue = 0LL;

  inProcessSession = v8->_inProcessSession;
  v8->_inProcessSession = 0LL;

  reporterDelegate = v8->_reporterDelegate;
  v8->_reporterDelegate = 0LL;

  if (v6)
  {
    uint64_t v30 = [v6 stringByAppendingPathComponent:@"/RecorderSplunkRecords"];
    storeToPath = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v30;

    v8->_accessControl = a4;
    uint64_t v32 = [v6 stringByAppendingPathComponent:@"/EventReporterPersistedState"];
    persistedStatePath = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v32;
  }

  else
  {
    v34 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v34 commonFilesystemBaseDir];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 stringByAppendingPathComponent:@"/RecorderSplunkRecords"];
    v37 = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v36;

    v8->_accessControl = a4;
    persistedStatePath = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [persistedStatePath commonFilesystemBaseDir];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v38 stringByAppendingPathComponent:@"/EventReporterPersistedState"];
    v40 = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v39;
  }

  v41 = (void *)[objc_alloc(NSString) initWithFormat:@"%@/%@", v8->_persistedStatePath, @"SUCoreEventReporterState.state"];
  v42 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( objc_alloc(&OBJC_CLASS___SUCorePersistedState),  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v8->_splunkStateQueue,  v41,  @"1.0");
  activeEventsState = v8->_activeEventsState;
  v8->_activeEventsState = v42;

  lastErrorEvent = v8->_lastErrorEvent;
  v8->_lastErrorEvent = 0LL;

  *(_WORD *)&v8->_splunkAccessCreated = 0;
  eventExtensions = v8->_eventExtensions;
  v8->_eventExtensions = 0LL;

  v8->_activeSendTaskCount = 0;
  v8->_dropEventsOnSendFailure = 0;
  id onceIdleCompletion = v8->_onceIdleCompletion;
  v8->_id onceIdleCompletion = 0LL;
  v47 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v47 oslog];
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v8->_storeToPath;
    +[SUCoreEventReporter accessControlSummary:]( &OBJC_CLASS___SUCoreEventReporter,  "accessControlSummary:",  v8->_accessControl);
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v49;
    __int16 v55 = 2114;
    v56 = v50;
    _os_log_impl( &dword_187139000,  v48,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] INIT(v1.0) | storing to path: %{public}@, access control: %{public}@",  buf,  0x16u);
  }

LABEL_13:
  return v8;
}

+ (void)augmentEvent:(id)a3 withError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 domain];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [a1 _errorDomainAbbreviation:v8];

    if (v9) {
      v10 = (__CFString *)v9;
    }
    else {
      v10 = @"NoDomain";
    }
    id v11 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ %ld", v10, objc_msgSend(v7, "code")];
    int64_t v12 = (void *)[objc_alloc(NSString) initWithFormat:@"%@", v7];
    if (v11) {
      [v13 setSafeObject:v11 forKey:@"result"];
    }
    if (v12) {
      [v13 setSafeObject:v12 forKey:@"failureReason"];
    }
  }

  else
  {
    id v11 = 0LL;
    int64_t v12 = 0LL;
    v10 = 0LL;
  }
}

+ (id)buildSplunkServerURLFromBase:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = (void *)[objc_alloc(NSString) initWithFormat:@"%@/%d/%@", v3, 2, @"psr_ota"];
    [MEMORY[0x189604030] URLWithString:v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)accessControlSummary:(int64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc(NSString);
  id v5 = @"Y";
  if ((v3 & 1) == 0) {
    id v5 = @"N";
  }
  id v6 = (void *)[v4 initWithFormat:@"|NVRAM Allowed:%@", v5];
  [&stru_189FEB358 stringByAppendingString:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 stringByAppendingString:@"|"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)eventForEventString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"purge"])
  {
    int64_t v4 = 0LL;
  }

  else if ([v3 isEqualToString:@"preflightScan"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"preflightDownload"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"preflightPersonalize"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"preflightFDR"])
  {
    int64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:@"preflightWakeup"])
  {
    int64_t v4 = 5LL;
  }

  else if ([v3 isEqualToString:@"preflightPrerequisiteCheck"])
  {
    int64_t v4 = 6LL;
  }

  else if ([v3 isEqualToString:@"prepareStarted"])
  {
    int64_t v4 = 7LL;
  }

  else if ([v3 isEqualToString:@"prepareFinished"])
  {
    int64_t v4 = 8LL;
  }

  else if ([v3 isEqualToString:@"applyStarted"])
  {
    int64_t v4 = 9LL;
  }

  else if ([v3 isEqualToString:@"applyFinished"])
  {
    int64_t v4 = 10LL;
  }

  else if ([v3 isEqualToString:@"CryptegraftStarted"])
  {
    int64_t v4 = 11LL;
  }

  else if ([v3 isEqualToString:@"CryptegraftFinshed"])
  {
    int64_t v4 = 12LL;
  }

  else if ([v3 isEqualToString:@"updateFinished"])
  {
    int64_t v4 = 13LL;
  }

  else
  {
    int64_t v4 = 100LL;
  }

  return v4;
}

- (BOOL)sendEvent:(id)a3
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:]( self,  "sendEvent:toServerURL:returningFinalEventDictionary:",  a3,  0LL,  0LL);
}

- (BOOL)sendEvent:(id)a3 returningFinalEventDictionary:(id *)a4
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:]( self,  "sendEvent:toServerURL:returningFinalEventDictionary:",  a3,  0LL,  a4);
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4
{
  return -[SUCoreEventReporter sendEvent:toServerURL:returningFinalEventDictionary:]( self,  "sendEvent:toServerURL:returningFinalEventDictionary:",  a3,  a4,  0LL);
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4 returningFinalEventDictionary:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0LL;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke;
  block[3] = &unk_189FE9228;
  block[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  v19 = &v27;
  v20 = &v21;
  dispatch_sync(v11, block);

  if (a5) {
    *a5 = (id) v22[5];
  }
  char v14 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke( uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___SUCoreEvent);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) eventExtensions];
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreEvent initWithEventDictionary:extendingWith:reportingToServer:]( v2,  "initWithEventDictionary:extendingWith:reportingToServer:",  v3,  v4,  *(void *)(a1 + 48));

  if (v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    -[SUCoreEvent allFields](v5, "allFields");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1 + 32) splunkStateQueue];
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2;
    v12[3] = &unk_189FE8FC0;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    dispatch_async(v10, v12);
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 trackError:@"[EVENT_REPORTER] SEND" forReason:@"failed to create core event from provided event information" withResult:8100 withError:0];
  }
}

uint64_t __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCoreEvent:*(void *)(a1 + 40)];
}

- (id)sendEventReturningAugmented:(id)a3 toServerURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0LL;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke;
  v14[3] = &unk_189FE9250;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v17 = &v18;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___SUCoreEvent);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) eventExtensions];
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreEvent initWithEventDictionary:extendingWith:reportingToServer:]( v2,  "initWithEventDictionary:extendingWith:reportingToServer:",  v3,  v4,  *(void *)(a1 + 48));

  if (v5)
  {
    uint64_t v6 = -[SUCoreEvent getAugmentedEvent](v5, "getAugmentedEvent");
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(a1 + 32) splunkStateQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2;
    v11[3] = &unk_189FE8FC0;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_async(v9, v11);
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackError:@"[EVENT_REPORTER] SEND_RETURNING_AUGMENTED" forReason:@"failed to create core event from provided event information" withResult:8100 withError:0];
  }
}

uint64_t __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCoreEvent:*(void *)(a1 + 40)];
}

- (void)dropOnSendFailure:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__SUCoreEventReporter_dropOnSendFailure___block_invoke;
  v6[3] = &unk_189FE9278;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __41__SUCoreEventReporter_dropOnSendFailure___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = [*(id *)(a1 + 32) dropEventsOnSendFailure];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setDropEventsOnSendFailure:v3 != 0];
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) dropEventsOnSendFailure];
      BOOL v7 = @"NO";
      if (v6) {
        BOOL v7 = @"YES";
      }
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl( &dword_187139000,  v5,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] CONFIG | dropEventsOnSendFailure=%{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)flushEvent
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreEventReporter_flushEvent__block_invoke;
  block[3] = &unk_189FE8FE8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__SUCoreEventReporter_flushEvent__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastErrorEvent];
  if (v2
    && (int v3 = (void *)v2,
        [*(id *)(a1 + 32) lastErrorEvent],
        int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 changedSinceReported],
        v4,
        v3,
        v5))
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v7,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] FLUSH | sending last error event",  buf,  2u);
    }

    int v8 = *(void **)(a1 + 32);
    [v8 lastErrorEvent];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 _sendCoreEvents:v9 secondEvent:0];
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( &dword_187139000,  v11,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] FLUSH | sending first awaiting retry",  v13,  2u);
    }

    [*(id *)(a1 + 32) _sendFirstAwaitingRetry];
  }

  return [*(id *)(a1 + 32) setLastErrorEvent:0];
}

- (int64_t)currentAccessControl
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__SUCoreEventReporter_currentAccessControl__block_invoke;
  v7[3] = &unk_189FE9010;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __43__SUCoreEventReporter_currentAccessControl__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessControl];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (void)indicateOnceIdle:(id)a3
{
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  int64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke;
  v7[3] = &unk_189FE92C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 buildError:8117 underlying:0 description:@"indicateOnceIdle completion when older completion in place - issuing error to older completion"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) onceIdleCompletion];
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setOnceIdleCompletion:0];
    +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 completionQueue];
    BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 3221225472LL;
    id v13 = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2;
    char v14 = &unk_189FE92A0;
    id v15 = v4;
    id v16 = v5;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v7, &v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "setOnceIdleCompletion:", *(void *)(a1 + 40), v11, v12, v13, v14);
  return [*(id *)(a1 + 32) _checkWhetherIdle:@"indicate once idle"];
}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)_splunkAccessSetup
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SUCoreEventReporter splunkAccessCreated](self, "splunkAccessCreated"))
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v5 = -[SUCoreEventReporterDelegate initWithReporter:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporterDelegate),  "initWithReporter:",  self);
    -[SUCoreEventReporter setReporterDelegate:](self, "setReporterDelegate:", v5);

    [MEMORY[0x189607AA8] defaultSessionConfiguration];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter setInProcessConfig:](self, "setInProcessConfig:", v6);

    id v7 = objc_alloc_init(MEMORY[0x189607988]);
    -[SUCoreEventReporter setInProcessOperationQueue:](self, "setInProcessOperationQueue:", v7);

    -[SUCoreEventReporter inProcessOperationQueue](self, "inProcessOperationQueue");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setMaxConcurrentOperationCount:1];

    id v9 = (void *)MEMORY[0x189607AA0];
    -[SUCoreEventReporter inProcessConfig](self, "inProcessConfig");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter reporterDelegate](self, "reporterDelegate");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter inProcessOperationQueue](self, "inProcessOperationQueue");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 sessionWithConfiguration:v10 delegate:v11 delegateQueue:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter setInProcessSession:](self, "setInProcessSession:", v13);

    char v14 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:@"https://xp.apple.com/report/2/psr_ota"];
    -[SUCoreEventReporter setSplunkURL:](self, "setSplunkURL:", v14);

    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreEventReporter splunkURL](self, "splunkURL");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SETUP | default Splunk URL: %{public}@",  buf,  0xCu);
    }

    -[SUCoreEventReporter storeToPath](self, "storeToPath");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v36 = 0LL;
    char v19 = [v4 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v20 = v36;

    if ((v19 & 1) == 0 && (!v20 || [v20 code] != 17))
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = objc_alloc(NSString);
      -[SUCoreEventReporter storeToPath](self, "storeToPath");
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)[v22 initWithFormat:@"failed to create store-to directory: %@", v23];
      objc_msgSend( v21,  "trackError:forReason:withResult:withError:",  @"[EVENT_REPORTER] SETUP",  v24,  objc_msgSend(v20, "code"),  v20);
    }
    v25 = -[SUCoreEventReporter persistedStatePath](self, "persistedStatePath");
    id v35 = 0LL;
    char v26 = [v4 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v27 = v35;

    if ((v26 & 1) == 0 && (!v27 || [v27 code] != 17))
    {
      v28 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v29 = objc_alloc(NSString);
      -[SUCoreEventReporter persistedStatePath](self, "persistedStatePath");
      char v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)[v29 initWithFormat:@"failed to create persisted-state directory: %@", v30];
      objc_msgSend( v28,  "trackError:forReason:withResult:withError:",  @"[EVENT_REPORTER] SETUP",  v31,  objc_msgSend(v27, "code"),  v27);
    }

    -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 loadPersistedState];

    id v33 = -[SUCoreEventReporter _newExistingFileUUIDs](self, "_newExistingFileUUIDs");
    v34 = -[SUCoreEventReporter _alignPersistedStateWithExistingFileUUIDs:]( self,  "_alignPersistedStateWithExistingFileUUIDs:",  v33);
    -[SUCoreEventReporter _synchronizeWithNSURLSessionExpecting:](self, "_synchronizeWithNSURLSessionExpecting:", v34);
    -[SUCoreEventReporter setSplunkAccessCreated:](self, "setSplunkAccessCreated:", 1LL);
  }

- (void)_determineEventExtensions
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SUCoreEventReporter eventExtensionsDetermined](self, "eventExtensionsDetermined"))
  {
    id v9 = (id)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.UpdateMetrics"];
    [v9 stringForKey:@"Context"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      int64_t v5 = 0LL;
    }

    else if ((-[SUCoreEventReporter accessControl](self, "accessControl") & 1) == 0 {
           || (-[SUCoreEventReporter _buildContextFromNVRAMBootArgs](self, "_buildContextFromNVRAMBootArgs"),
    }
               (int64_t v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
LABEL_11:
      -[SUCoreEventReporter setEventExtensionsDetermined:](self, "setEventExtensionsDetermined:", 1LL);

      return;
    }

    id v6 = (NSMutableDictionary *)objc_opt_new();
    eventExtensions = self->_eventExtensions;
    self->_eventExtensions = v6;

    if (v4) {
      id v8 = v4;
    }
    else {
      id v8 = v5;
    }
    -[NSMutableDictionary setSafeObject:forKey:](self->_eventExtensions, "setSafeObject:forKey:", v8, @"context");

    goto LABEL_11;
  }

- (id)_buildContextFromNVRAMBootArgs
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  if (!v3)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 trackAnomaly:@"[EVENT_REPORTER] BUILD" forReason:@"unable to read NVRAM variables - unable to get registry entry for IODeviceTree:/options" withResult:8104 withError:0];

    return 0LL;
  }

  io_object_t v4 = v3;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"boot-args", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  IOObjectRelease(v4);
  if (!CFProperty) {
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = (id)[objc_alloc(NSString) initWithData:CFProperty encoding:4];
    if (!v6) {
      goto LABEL_23;
    }
LABEL_9:
    id v22 = v6;
    id v23 = CFProperty;
    [v6 componentsSeparatedByString:@" "];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) componentsSeparatedByString:@"="];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v15;
          if (!v12)
          {
            if ([v15 count] == 2)
            {
              [v16 objectAtIndexedSubscript:0];
              id v17 = (void *)objc_claimAutoreleasedReturnValue();
              int v18 = [v17 isEqualToString:@"BATS_TESTPLAN_ID"];

              uint64_t v12 = 0LL;
              if (v18)
              {
                id v19 = objc_alloc(NSString);
                [v16 objectAtIndexedSubscript:1];
                id v20 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v12 = (void *)[v19 initWithFormat:@"BATS_TESTPLAN_ID_%@", v20];
              }
            }

            else
            {
              uint64_t v12 = 0LL;
            }
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    CFProperty = v23;
    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = CFProperty;
    goto LABEL_9;
  }

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 trackAnomaly:@"[EVENT_REPORTER] BUILD" forReason:@"NVRAM boot-args exist but format unknown - ignored" withResult:8103 withError:0];

LABEL_23:
  uint64_t v12 = 0LL;
LABEL_26:

  return v12;
}

- (void)_adoptLastErrorEvent:(id)a3
{
  id v5 = a3;
  [v5 allFields];
  io_object_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setSafeObject:@"false" forKey:@"sameErrorSignature"];

  -[SUCoreEventReporter setLastErrorEvent:](self, "setLastErrorEvent:", v5);
}

- (void)_sendCoreEvent:(id)a3
{
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter _splunkAccessSetup](self, "_splunkAccessSetup");
  [v4 allFields];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 safeStringForKey:@"UUID"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 trackLastReportedUUID:v7];
  }

  if ([v4 isSuccess])
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v10,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] STATUS | sending event [event indicating successful operation]",  buf,  2u);
    }

    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 changedSinceReported];

    if (v12)
    {
      -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    -[SUCoreEventReporter setLastErrorEvent:](self, "setLastErrorEvent:", 0LL);
    goto LABEL_25;
  }

  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  char v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v26 = 0;
      _os_log_impl( &dword_187139000,  v21,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] STATUS | sending event [event indicating error when no last error]",  v26,  2u);
    }

    -[SUCoreEventReporter _adoptLastErrorEvent:](self, "_adoptLastErrorEvent:", v4);
    goto LABEL_18;
  }

  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = [v4 isEqualErrorEvent:v15];

  if (v16)
  {
    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 incrementErrorCount];

    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] STATUS | not sending event [event indicating error matching last reported]",  v28,  2u);
    }

    id v4 = 0LL;
LABEL_18:
    uint64_t v13 = 0LL;
    goto LABEL_25;
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v27 = 0;
    _os_log_impl( &dword_187139000,  v23,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] STATUS | sending event [event indicating error that is different than last reported]",  v27,  2u);
  }

  -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v25 = [v24 changedSinceReported];

  if (v25)
  {
    -[SUCoreEventReporter lastErrorEvent](self, "lastErrorEvent");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  -[SUCoreEventReporter _adoptLastErrorEvent:](self, "_adoptLastErrorEvent:", v4);
LABEL_25:
  -[SUCoreEventReporter _sendCoreEvents:secondEvent:](self, "_sendCoreEvents:secondEvent:", v13, v4);
}

- (void)_sendCoreEvents:(id)a3 secondEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_opt_new();
  if (v6 && v7)
  {
    [v6 reportedUUID];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 reportedUUID];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v7);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 allFields];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v14];

    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:]( self,  "_sendSplunkEvents:forEventUUID:toServerURL:",  v9,  v10,  v11);
    id v15 = (void *)objc_opt_new();

    [v7 allFields];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 addObject:v16];

    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:]( self,  "_sendSplunkEvents:forEventUUID:toServerURL:",  v15,  v12,  v13);
    id v9 = v15;
    goto LABEL_9;
  }

  if (v6)
  {
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 allFields];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v18];

    id v19 = v6;
LABEL_8:
    [v19 reportedUUID];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _sendSplunkEvents:forEventUUID:toServerURL:]( self,  "_sendSplunkEvents:forEventUUID:toServerURL:",  v9,  v21,  v17);

    goto LABEL_9;
  }

  if (v7)
  {
    -[SUCoreEventReporter _getSplunkServerURL:](self, "_getSplunkServerURL:", v7);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 allFields];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v20];

    id v19 = v7;
    goto LABEL_8;
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v24 = 0;
    _os_log_impl( &dword_187139000,  v23,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] STATUS | send events with nothing to send",  v24,  2u);
  }

LABEL_9:
}

- (void)_sendSplunkEvents:(id)a3 forEventUUID:(id)a4 toServerURL:(id)a5
{
  v34[2] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  id v12 = -[SUCoreEventReporter _newScrubbedEvents:](self, "_newScrubbedEvents:", v10);
  if (v8)
  {
    id v13 = v8;
  }

  else
  {
    [MEMORY[0x189607AB8] UUID];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  [MEMORY[0x189607AB8] UUID];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 UUIDString];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && v12
    && v13
    && v16
    && (-[SUCoreEventReporter inProcessSession](self, "inProcessSession"),
        id v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    v33[0] = @"clientId";
    v33[1] = @"events";
    v34[0] = v13;
    v34[1] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEventReporter _getJSONDataFromPayload:withFileUUID:forEventUUID:]( self,  "_getJSONDataFromPayload:withFileUUID:forEventUUID:",  v18,  v16,  v13);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      uint64_t v20 = -[SUCoreEventReporter _storeJSONData:withFileUUID:forEventUUID:]( self,  "_storeJSONData:withFileUUID:forEventUUID:",  v19,  v16,  v13);
      if (v20)
      {
        __int128 v26 = (void *)v20;
        [v9 dataRepresentation];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreEventReporter _storeServerURLMetadata:toFileUUID:]( self,  "_storeServerURLMetadata:toFileUUID:",  v21,  v16);

        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 oslog];
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v28 = v13;
          __int16 v29 = 2114;
          char v30 = v16;
          __int16 v31 = 2114;
          uint64_t v32 = v18;
          _os_log_impl( &dword_187139000,  v23,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] UPLOADING | sending [UUID: %{public}@] file: %{public}@ payload: %{public}@",  buf,  0x20u);
        }

        -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:]( self,  "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:",  v26,  v16,  v13,  v9);
        +[SUCoreSplunkHistory logEventUUID:](&OBJC_CLASS___SUCoreSplunkHistory, "logEventUUID:", v13);
      }
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = (void *)[objc_alloc(NSString) initWithFormat:@"missing required event resources [UUID: %@]", v13];
    [v24 trackAnomaly:@"[EVENT_REPORTER] SEND" forReason:v25 withResult:8101 withError:0];

    int v18 = 0LL;
    id v19 = 0LL;
  }
}

- (void)_uploadFromFile:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5 toServerURL:(id)a6
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  char v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  id v15 = v10;
  +[SUCore getFileMetadata:forKey:]( SUCore,  "getFileMetadata:forKey:",  [v15 fileSystemRepresentation],  @"SUCoreEventReporterServerURL");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v11);
  id v17 = (SUCoreEventReporterActive *)objc_claimAutoreleasedReturnValue();
  id v35 = v15;
  if (v17)
  {
    int v18 = v17;
    -[SUCoreEventReporterActive setAttemptedSendCount:]( v17,  "setAttemptedSendCount:",  -[SUCoreEventReporterActive attemptedSendCount](v17, "attemptedSendCount") + 1);
    if (-[SUCoreEventReporterActive attemptedSendCount](v18, "attemptedSendCount") >= 9)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreEventReporterActive summary](v18, "summary");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v37 = v11;
        __int16 v38 = 2114;
        uint64_t v39 = v21;
        _os_log_impl( &dword_187139000,  v20,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] UPLOADING | dropping event with fileUUID:%{public}@ - too many send attempts | active:%{public}@",  buf,  0x16u);
      }

      -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:]( self,  "_removeFileUUID:loggingError:forReason:",  v11,  1LL,  @"too many send attempts");
      goto LABEL_20;
    }
  }

  else
  {
    int v18 = -[SUCoreEventReporterActive initWithServerURL:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporterActive),  "initWithServerURL:",  v13);
    -[SUCoreEventReporterActive setAttemptedSendCount:]( v18,  "setAttemptedSendCount:",  -[SUCoreEventReporterActive attemptedSendCount](v18, "attemptedSendCount") + 1);
  }

  -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v18, v11);
  v34 = v16;
  if (v16)
  {
    id v22 = (void *)[objc_alloc(NSString) initWithData:v16 encoding:4];
    if (v22)
    {
      id v23 = (id)[objc_alloc(MEMORY[0x189604030]) initWithString:v22];
      if (v23) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    id v22 = 0LL;
  }

  id v23 = v13;
LABEL_13:
  uint64_t v24 = -[SUCoreEventReporter _getSplunkRequestForURL:](self, "_getSplunkRequestForURL:", v23);
  if (v24)
  {
    int v25 = (void *)v24;
    id v33 = v13;
    id v26 = v12;
    -[SUCoreEventReporter inProcessSession](self, "inProcessSession");
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 uploadTaskWithRequest:v25 fromFile:v15];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[SUCoreEventReporter _incrementActiveSendCount:](self, "_incrementActiveSendCount:", @"uploading");
      [v28 setTaskDescription:v11];
      [v28 resume];

      id v12 = v26;
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create NSURL session task [UUID: %@] file: %@", v26, v11];
      [v31 trackAnomaly:@"[EVENT_REPORTER] QUEUED" forReason:v32 withResult:8101 withError:0];

      id v12 = v26;
      -[SUCoreEventReporter _awaitRetryingFileUUID:](self, "_awaitRetryingFileUUID:", v11);
    }

    id v13 = v33;
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
    char v30 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create request to reach server [UUID: %@] file: %@", v12, v11];
    [v29 trackAnomaly:@"[EVENT_REPORTER] QUEUED" forReason:v30 withResult:8101 withError:0];

    -[SUCoreEventReporter _awaitRetryingFileUUID:](self, "_awaitRetryingFileUUID:", v11);
  }

  int v16 = v34;
LABEL_20:
}

- (void)_sendInterruptedFromStorage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v21 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v12 = (void *)MEMORY[0x189604030];
          -[SUCoreEventReporter storeToPath](self, "storeToPath");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 stringByAppendingPathComponent:v11];
          char v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 fileURLWithPath:v14];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v11);
          int v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 oslog];
          int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            [v16 summary];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            uint64_t v27 = v11;
            __int16 v28 = 2114;
            __int16 v29 = v19;
            _os_log_impl( &dword_187139000,  v18,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | retrying (recovered from storage), re-sending fileUUID:%{public}@ | active:%{public}@",  buf,  0x16u);
          }

          -[SUCoreEventReporter splunkURL](self, "splunkURL");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:]( self,  "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:",  v15,  v11,  0LL,  v20);
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }

      while (v8);
    }

    id v4 = v21;
  }
}

- (void)_sendAllAwaitingRetry
{
  io_registry_entry_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  while (-[SUCoreEventReporter _sendFirstAwaitingRetry](self, "_sendFirstAwaitingRetry"))
    ;
}

- (BOOL)_sendFirstAwaitingRetry
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  io_registry_entry_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectAtIndex:0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 removeObjectAtIndex:0];

    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 67109376;
      *(_DWORD *)__int128 v24 = v11;
      *(_WORD *)&v24[4] = 2048;
      *(void *)&v24[6] = [v12 count];
      _os_log_impl( &dword_187139000,  v10,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | sending first awaiting retry - activeSendTaskCount:%d, awaitingRetry:%lu",  (uint8_t *)&v23,  0x12u);
    }

    if (v7)
    {
      id v13 = (void *)MEMORY[0x189604030];
      -[SUCoreEventReporter storeToPath](self, "storeToPath");
      char v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByAppendingPathComponent:v7];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 fileURLWithPath:v15];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreEventReporter _activeEventForFileUUID:](self, "_activeEventForFileUUID:", v7);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 oslog];
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v17 summary];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543618;
        *(void *)__int128 v24 = v7;
        *(_WORD *)&v24[8] = 2114;
        *(void *)&v24[10] = v20;
        _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] UPLOADING | retrying, re-sending fileUUID:%{public}@ | active:%{public}@",  (uint8_t *)&v23,  0x16u);
      }

      -[SUCoreEventReporter splunkURL](self, "splunkURL");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreEventReporter _uploadFromFile:withFileUUID:forEventUUID:toServerURL:]( self,  "_uploadFromFile:withFileUUID:forEventUUID:toServerURL:",  v16,  v7,  0LL,  v21);
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 trackAnomaly:@"[EVENT_REPORTER] UPLOADING" forReason:@"unable to load fileUUID from awaiting retry array" withResult:8103 withError:0];
    }
  }

  return v5 != 0;
}

- (void)_awaitRetryingFileUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    uint64_t v7 = (void *)objc_opt_new();
    -[SUCoreEventReporter setAwaitingRetry:](self, "setAwaitingRetry:", v7);
  }

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v4];

  -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = [v9 count];

  if (v10 >= 0x11)
  {
    do
    {
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 objectAtIndex:0];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 removeObjectAtIndex:0];

      if (v12)
      {
        +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = (void *)[objc_alloc(NSString) initWithFormat:@"too many awaiting retry - not reporting file: %@", v12];
        [v14 trackError:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8108 withError:0];

        -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:]( self,  "_removeFileUUID:loggingError:forReason:",  v12,  1LL,  @"too many waiting retry");
      }

      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v17 = [v16 count];
    }

    while (v17 > 0x10);
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 oslog];
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109376;
    int v23 = v20;
    __int16 v24 = 2048;
    uint64_t v25 = [v21 count];
    _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | awaiting retrying - activeSendTaskCount:%d, awaitingRetry:%lu",  buf,  0x12u);
  }
}

- (id)_newExistingFileUUIDs
{
  io_registry_entry_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  [v3 contentsOfDirectoryAtPath:v4 error:&v11];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v11;

  if (v6)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to get existing files error: %@", v6];
    objc_msgSend( v7,  "trackError:forReason:withResult:withError:",  @"[EVENT_REPORTER] SYNC",  v8,  objc_msgSend(v6, "code"),  v6);
  }

  else
  {
    uint64_t v9 = (void *)[v5 mutableCopy];
    if (v9) {
      goto LABEL_5;
    }
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 trackError:@"[EVENT_REPORTER] SYNC" forReason:@"failed to copy existing files array" withResult:8105 withError:0];
  }

  uint64_t v9 = 0LL;
LABEL_5:

  return v9;
}

- (void)_synchronizeWithNSURLSessionExpecting:(id)a3
{
  id v4 = a3;
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | getAllTasksWithCompletionHandler... | synchronizing with NSURLSession to determin e in-flight events",  buf,  2u);
  }

  -[SUCoreEventReporter inProcessSession](self, "inProcessSession");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke;
  v9[3] = &unk_189FE9318;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 getAllTasksWithCompletionHandler:v9];
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) splunkStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2;
  block[3] = &unk_189FE92F0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2(id *a1)
{
  id v1 = a1;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (__CFString *)[a1[4] copy];
  id v3 = v1[5];
  unint64_t v4 = 0x189FE8000uLL;
  if (v3 && [v3 count])
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v1[5] count];
      uint64_t v8 = [v1[5] count];
      uint64_t v9 = @"s";
      if (v8 == 1) {
        uint64_t v9 = &stru_189FEB358;
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v43 = v7;
      __int16 v44 = 2112;
      v45 = v9;
      _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | %lu in-flight event%@",  buf,  0x16u);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v10 = v1[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v39;
      *(void *)&__int128 v12 = 138543618LL;
      __int128 v33 = v12;
      id v34 = v10;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "taskDescription", v33);
          unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v1[6] _activeEventForFileUUID:v17];
            int v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v1[4] containsObject:v17])
            {
              switch([v16 state])
              {
                case 0LL:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredRunning:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 1LL:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredSuspended:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 2LL:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredCanceling:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 3LL:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredCompleted:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                default:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredUnknown:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
              }

              __int128 v22 = v2;
              uint64_t v2 = (__CFString *)v19;
            }

            else
            {
              id v21 = v1;
              id v35 = v2;
              +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  [v16 state]);
              __int128 v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              unint64_t v23 = v4;
              [*(id *)(v4 + 2944) sharedLogger];
              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 oslog];
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
              if (v18)
              {
                if (v26)
                {
                  [v18 summary];
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  uint64_t v43 = (uint64_t)v17;
                  __int16 v44 = 2114;
                  v45 = v22;
                  __int16 v46 = 2114;
                  v47 = v27;
                  _os_log_error_impl( &dword_187139000,  v25,  OS_LOG_TYPE_ERROR,  "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public} @ - no longer on the filesystem | active:%{public}@",  buf,  0x20u);
                }

                [v21[6] _removeActiveEventForFileUUID:v17];
              }

              else
              {
                if (v26)
                {
                  *(_DWORD *)buf = v33;
                  uint64_t v43 = (uint64_t)v17;
                  __int16 v44 = 2114;
                  v45 = v22;
                  _os_log_error_impl( &dword_187139000,  v25,  OS_LOG_TYPE_ERROR,  "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public} @ - no longer on the filesystem",  buf,  0x16u);
                }
              }

              unint64_t v4 = v23;
              id v1 = v21;
              id v10 = v34;
              uint64_t v2 = v35;
            }
          }

          else
          {
            [*(id *)(v4 + 2944) sharedLogger];
            int v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 oslog];
            int v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
              __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1( &v36,  v37,  (os_log_s *)v18);
            }
          }
        }

        uint64_t v13 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }

      while (v13);
    }
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | no in-flight events",  buf,  2u);
    }
  }

  if (v2 && -[__CFString count](v2, "count"))
  {
    [*(id *)(v4 + 2944) sharedLogger];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 oslog];
    char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v30,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | retrying events discovered on the filesystem",  buf,  2u);
    }

    [v1[6] _sendInterruptedFromStorage:v2];
  }

  else
  {
    [*(id *)(v4 + 2944) sharedLogger];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 oslog];
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v32,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | no events to retry",  buf,  2u);
    }
  }
}

- (id)_synchonizeDiscoveredRunning:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [v10 taskDescription];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v10 state];

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( &OBJC_CLASS___SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      [v8 summary];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543874;
      __int128 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      BOOL v26 = v18;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - continuin g | active:%{public}@",  (uint8_t *)&v21,  0x20u);
    }

    objc_msgSend(v8, "setDiscoveredRunningCount:", objc_msgSend(v8, "discoveredRunningCount") + 1);
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v8, v12);
  }

  else
  {
    if (v17)
    {
      int v21 = 138543618;
      __int128 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored",  (uint8_t *)&v21,  0x16u);
    }

    uint64_t v19 = -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);

    id v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredSuspended:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [v8 taskDescription];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  [v8 state]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 oslog];
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v16)
    {
      [v9 summary];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = 138543874;
      int v21 = v12;
      __int16 v22 = 2114;
      __int16 v23 = v13;
      __int16 v24 = 2114;
      __int16 v25 = v17;
      _os_log_impl( &dword_187139000,  v15,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - resuming | active:%{public}@",  (uint8_t *)&v20,  0x20u);
    }

    objc_msgSend(v9, "setDiscoveredSuspendedCount:", objc_msgSend(v9, "discoveredSuspendedCount") + 1);
    [v8 resume];
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v9, v12);
  }

  else
  {
    if (v16)
    {
      int v20 = 138543618;
      int v21 = v12;
      __int16 v22 = 2114;
      __int16 v23 = v13;
      _os_log_impl( &dword_187139000,  v15,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored",  (uint8_t *)&v20,  0x16u);
    }

    uint64_t v18 = -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);

    id v10 = (id)v18;
  }

  return v10;
}

- (id)_synchonizeDiscoveredCanceling:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [v10 taskDescription];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v10 state];

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( &OBJC_CLASS___SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      [v8 summary];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543874;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - awaiting didCompleteWithError | active:%{public}@",  (uint8_t *)&v21,  0x20u);
    }

    objc_msgSend(v8, "setDiscoveredCancelingCount:", objc_msgSend(v8, "discoveredCancelingCount") + 1);
    -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v8, v12);
  }

  else
  {
    if (v17)
    {
      int v21 = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored",  (uint8_t *)&v21,  0x16u);
    }

    uint64_t v19 = -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);

    id v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredCompleted:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [v8 taskDescription];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  [v8 state]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    [v8 error];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v9, "setFailedSendCount:", objc_msgSend(v9, "failedSendCount") + 1);
      uint64_t v15 = [v9 failedSendCount];
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 oslog];
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15 <= 7)
      {
        if (v18)
        {
          [v9 summary];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          int v29 = 138543874;
          char v30 = v12;
          __int16 v31 = 2114;
          uint64_t v32 = v13;
          __int16 v33 = 2114;
          id v34 = v19;
          _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - will retry | active:%{public}@",  (uint8_t *)&v29,  0x20u);
        }

        -[SUCoreEventReporter _updateActiveEvent:forFileUUID:](self, "_updateActiveEvent:forFileUUID:", v9, v12);
        goto LABEL_17;
      }

      if (v18)
      {
        [v9 summary];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        int v29 = 138543874;
        char v30 = v12;
        __int16 v31 = 2114;
        uint64_t v32 = v13;
        __int16 v33 = 2114;
        id v34 = v26;
        _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - dropping | active:%{public}@",  (uint8_t *)&v29,  0x20u);
      }

      -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v12);
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 oslog];
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        [v9 summary];
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
        int v29 = 138543874;
        char v30 = v12;
        __int16 v31 = 2114;
        uint64_t v32 = v13;
        __int16 v33 = 2114;
        id v34 = v25;
        _os_log_impl( &dword_187139000,  v24,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [SUCCESS] - considering done | active:%{public}@",  (uint8_t *)&v29,  0x20u);
      }
    }

    uint64_t v27 = -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);

    id v10 = (id)v27;
LABEL_17:

    goto LABEL_18;
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 oslog];
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543618;
    char v30 = v12;
    __int16 v31 = 2114;
    uint64_t v32 = v13;
    _os_log_impl( &dword_187139000,  v21,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored",  (uint8_t *)&v29,  0x16u);
  }

  uint64_t v22 = -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v10);

  -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:]( self,  "_removeFileUUID:loggingError:forReason:",  v12,  1LL,  @"synchonize discovered Completed");
  id v10 = (id)v22;
LABEL_18:

  return v10;
}

- (id)_synchonizeDiscoveredUnknown:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [v10 taskDescription];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v10 state];

  +[SUCoreEventReporter _nsURLSessionTaskNameForState:]( &OBJC_CLASS___SUCoreEventReporter,  "_nsURLSessionTaskNameForState:",  v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      [v8 summary];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543874;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - dropping | active:%{public}@",  (uint8_t *)&v21,  0x20u);
    }

    -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v12);
  }

  else
  {
    if (v17)
    {
      int v21 = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored",  (uint8_t *)&v21,  0x16u);
    }
  }

  -[SUCoreEventReporter _removeFileUUID:fromFilesToRetry:](self, "_removeFileUUID:fromFilesToRetry:", v12, v9);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_alignPersistedStateWithExistingFileUUIDs:(id)a3
{
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 dictionaryForKey:@"ActiveEventsState"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v16 = MEMORY[0x1895F87A8];
  uint64_t v17 = 3221225472LL;
  BOOL v18 = __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke;
  uint64_t v19 = &unk_189FE9340;
  id v10 = v6;
  id v20 = v10;
  id v21 = v9;
  id v11 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:&v16];
  -[SUCoreEventReporter activeEventsState](self, "activeEventsState", v16, v17, v18, v19);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 persistDictionary:v11 forKey:@"ActiveEventsState"];

  uint64_t v13 = v21;
  id v14 = v10;

  return v14;
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = (os_log_s *)v5;
    id v8 = -[SUCoreEventReporterActive initFromArchivedData:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporterActive),  "initFromArchivedData:",  v6);
    int v9 = [*(id *)(a1 + 32) containsObject:v7];
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        [v8 summary];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = 138543618;
        uint64_t v19 = v7;
        __int16 v20 = 2114;
        id v21 = v13;
        _os_log_impl( &dword_187139000,  v11,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - on filesystem and persisted | active:%{public}@",  (uint8_t *)&v18,  0x16u);
      }

      [*(id *)(a1 + 40) setSafeObject:v6 forKey:v7];
    }

    else
    {
      if (v12)
      {
        [v8 summary];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = 138543618;
        uint64_t v19 = v7;
        __int16 v20 = 2114;
        id v21 = v17;
        _os_log_impl( &dword_187139000,  v11,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - no longer on filesystem, dropping | active:%{public}@",  (uint8_t *)&v18,  0x16u);
      }
    }
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1(v7, v15, v16);
    }
  }
}

- (id)_removeFileUUID:(id)a3 fromFilesToRetry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  id v9 = v7;
  id v10 = v9;
  if (v9 && [v9 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v11 = 0LL;
    while (1)
    {
      [v10 objectAtIndex:v11];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v6, v12)) {
        break;
      }
    }

    [v10 removeObjectAtIndex:v11];
  }

- (id)_activeEventForFileUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dictionaryForKey:@"ActiveEventsState"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && ([v7 safeObjectForKey:v4 ofClass:objc_opt_class()],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = -[SUCoreEventReporterActive initFromArchivedData:]( objc_alloc(&OBJC_CLASS___SUCoreEventReporterActive),  "initFromArchivedData:",  v8);

    if (v10)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 oslog];
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [v10 summary];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = 138543618;
        id v16 = v4;
        __int16 v17 = 2114;
        int v18 = v13;
        _os_log_impl( &dword_187139000,  v12,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] ACTIVE | found active event for fileUUID:%{public}@ | activeEvent:%{public}@",  (uint8_t *)&v15,  0x16u);
      }
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_updateActiveEvent:(id)a3 forFileUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 dictionaryForKey:@"ActiveEventsState"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (id)[v10 mutableCopy];

  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  [v6 toArchivedData];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setSafeObject:v12 forKey:v7];

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 persistDictionary:v11 forKey:@"ActiveEventsState"];

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 oslog];
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [v6 summary];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    __int16 v20 = v16;
    _os_log_impl( &dword_187139000,  v15,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] ACTIVE | updated active event for fileUUID:%{public}@ | activeEvent:%{public}@",  (uint8_t *)&v17,  0x16u);
  }
}

- (void)_removeActiveEventForFileUUID:(id)a3
{
  id v9 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryForKey:@"ActiveEventsState"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v7 removeObjectForKey:v9];
    -[SUCoreEventReporter activeEventsState](self, "activeEventsState");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 persistDictionary:v7 forKey:@"ActiveEventsState"];
  }
}

- (id)_getSplunkServerURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SUCoreEventReporter splunkURL](self, "splunkURL");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_getSplunkRequestForURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189607948] requestWithURL:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [v5 setHTTPMethod:@"POST"];
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_newScrubbedEvents:(id)a3
{
  id v4 = a3;
  if (v4 && (id v5 = (void *)objc_opt_new()) != 0LL)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __42__SUCoreEventReporter__newScrubbedEvents___block_invoke;
    v8[3] = &unk_189FE9368;
    v8[4] = self;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

void __42__SUCoreEventReporter__newScrubbedEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[*(id *)(a1 + 32) _copyEscapeStringsForEventData:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_copyEscapeStringsForEventData:(id)a3
{
  id v3 = (void *)MEMORY[0x189607930];
  id v4 = a3;
  [v3 characterSetWithCharactersInString:@"%\\""];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607810] controlCharacterSet];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 formUnionWithCharacterSet:v6];

  [MEMORY[0x189607810] newlineCharacterSet];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 formUnionWithCharacterSet:v7];

  objc_msgSend(MEMORY[0x189607930], "characterSetWithRange:", 0, 127);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 invertedSet];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 formIntersectionWithCharacterSet:v9];

  [v4 allKeys];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE8] null];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectsForKeys:v10 notFoundMarker:v11];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = (void *)[v12 mutableCopy];
  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke;
  uint64_t v22 = &unk_189FE9390;
  id v23 = v13;
  id v24 = v8;
  id v14 = v8;
  id v15 = v13;
  [v15 enumerateObjectsUsingBlock:&v19];
  id v16 = objc_alloc(MEMORY[0x189603F68]);
  int v17 = (void *)objc_msgSend(v16, "initWithObjects:forKeys:", v15, v10, v19, v20, v21, v22);

  return v17;
}

void __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v10 = a2;
  *a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v10 stringByReplacingOccurrencesOfString:@"=" withString:@":"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = *(void **)(a1 + 32);
    [v7 stringByAddingPercentEncodingWithAllowedCharacters:*(void *)(a1 + 40)];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 replaceObjectAtIndex:a3 withObject:v9];
  }
}

+ (id)_errorDomainAbbreviation:(id)a3
{
  id v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"com.apple.softwareupdateservices.errors") & 1) != 0)
  {
    id v4 = @"SUS";
LABEL_15:

    goto LABEL_16;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"SUControllerError") & 1) != 0)
  {
    id v4 = @"SUC";
    goto LABEL_15;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"SUBError") & 1) != 0)
  {
    id v4 = @"SUB";
    goto LABEL_15;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"BridgeOSSoftwareUpdateError") & 1) != 0)
  {
    id v4 = @"BSU";
    goto LABEL_15;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"MobileSoftwareUpdateErrorDomain") & 1) != 0)
  {
    id v4 = @"MSU";
    goto LABEL_15;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", @"ASError") & 1) != 0)
  {
    id v4 = @"AS";
    goto LABEL_15;
  }

  id v4 = v3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"MobileAssetError"))
  {
    id v4 = @"MA";
    goto LABEL_15;
  }

- (id)_getJSONDataFromPayload:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1896078D8] isValidJSONObject:v7])
  {
    id v18 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v7 options:0 error:&v18];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v18;
    if (!v10)
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to serialize data into JSON [UUID: %@] file: %@", v9, v8];
      if (v11) {
        uint64_t v14 = [v11 code];
      }
      else {
        uint64_t v14 = 8106LL;
      }
      [v12 trackError:@"[EVENT_REPORTER] DROP" forReason:v13 withResult:v14 withError:v11];
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = (void *)[objc_alloc(NSString) initWithFormat:@"encountered invalid JSON payload [UUID: %@] file: %@", v9, v8];
    [v15 trackError:@"[EVENT_REPORTER] DROP" forReason:v16 withResult:8107 withError:0];

    id v10 = 0LL;
  }

  return v10;
}

- (id)_storeJSONData:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  BOOL v12 = (void *)MEMORY[0x189604030];
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringByAppendingPathComponent:v9];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 fileURLWithPath:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    id v25 = 0LL;
    int v16 = [v8 writeToURL:v15 options:1 error:&v25];
    id v17 = v25;
    id v18 = v17;
    if (!v16 || v17)
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to write JSON data to file [UUID: %@] file: %@", v10, v9];
      if (v18) {
        uint64_t v21 = [v18 code];
      }
      else {
        uint64_t v21 = 8109LL;
      }
      [v19 trackError:@"[EVENT_REPORTER] DROP" forReason:v20 withResult:v21 withError:v18];

      -[SUCoreEventReporter _removeFileUUID:loggingError:forReason:]( self,  "_removeFileUUID:loggingError:forReason:",  v9,  0LL,  @"failed to write JSON data");
      id v15 = 0LL;
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to form JSON data file [UUID: %@] file: %@", v10, v9];
    [v22 trackAnomaly:@"[EVENT_REPORTER] DROP" forReason:v23 withResult:8100 withError:0];

    id v15 = 0LL;
  }

  return v15;
}

- (BOOL)_storeServerURLMetadata:(id)a3 toFileUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x189604030];
  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringByAppendingPathComponent:v7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 fileURLWithPath:v11];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to create file: %@ for attaching of serverURL metadata", v7];
    [v14 trackAnomaly:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8100 withError:0];
    BOOL v13 = 0;
    goto LABEL_5;
  }

  BOOL v13 = +[SUCore setFileMetadata:forKey:value:]( SUCore, "setFileMetadata:forKey:value:", [v12 fileSystemRepresentation], @"SUCoreEventReporterServerURL", v6);
  if (!v13)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to add serverURL metadata to file: %@", v7];
    [v14 trackError:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8109 withError:0];
LABEL_5:
  }

  return v13;
}

- (void)_removeFileUUID:(id)a3 loggingError:(BOOL)a4 forReason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[SUCoreEventReporter storeToPath](self, "storeToPath");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringByAppendingPathComponent:v8];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  char v14 = [v13 removeItemAtPath:v12 error:&v19];
  id v15 = v19;

  if ((v14 & 1) == 0 && v6)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ - could not remove event file: %@", v9, v12];
    if (v15) {
      uint64_t v18 = [v15 code];
    }
    else {
      uint64_t v18 = 8110LL;
    }
    [v16 trackAnomaly:@"[EVENT_REPORTER] REMOVE" forReason:v17 withResult:v18 withError:v15];
  }

  -[SUCoreEventReporter _removeActiveEventForFileUUID:](self, "_removeActiveEventForFileUUID:", v8);
}

- (void)_incrementActiveSendCount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") <= 127)
  {
    -[SUCoreEventReporter setActiveSendTaskCount:]( self,  "setActiveSendTaskCount:",  -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") + 1);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 138543874;
      id v11 = v4;
      __int16 v12 = 1024;
      int v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = [v9 count];
      _os_log_impl( &dword_187139000,  v7,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | %{public}@ - activeSendTaskCount:%d, awaitingRetry:%lu",  (uint8_t *)&v10,  0x1Cu);
    }
  }
}

- (void)_decrementActiveSendCount
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") >= 1)
  {
    -[SUCoreEventReporter setActiveSendTaskCount:]( self,  "setActiveSendTaskCount:",  -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount") - 1);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109376;
      v8[1] = v6;
      __int16 v9 = 2048;
      uint64_t v10 = [v7 count];
      _os_log_impl( &dword_187139000,  v5,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | decrement active - activeSendTaskCount:%d, awaitingRetry:%lu",  (uint8_t *)v8,  0x12u);
    }
  }

- (void)_checkWhetherIdle:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount"))
  {
    -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 count])
    {
    }

    else
    {
      -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 oslog];
        __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
          -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v23 = v4;
          __int16 v24 = 1024;
          int v25 = v15;
          __int16 v26 = 2048;
          uint64_t v27 = [v16 count];
          _os_log_impl( &dword_187139000,  v14,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | now idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu",  buf,  0x1Cu);
        }

        -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreEventReporter setOnceIdleCompletion:](self, "setOnceIdleCompletion:", 0LL);
        +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 completionQueue];
        id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __41__SUCoreEventReporter__checkWhetherIdle___block_invoke;
        block[3] = &unk_189FE93B8;
        id v21 = v17;
        __int16 v9 = v17;
        dispatch_async(v19, block);

        goto LABEL_11;
      }
    }
  }

  -[SUCoreEventReporter onceIdleCompletion](self, "onceIdleCompletion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = -[SUCoreEventReporter activeSendTaskCount](self, "activeSendTaskCount");
      -[SUCoreEventReporter awaitingRetry](self, "awaitingRetry");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v23 = v4;
      __int16 v24 = 1024;
      int v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = [v11 count];
      _os_log_impl( &dword_187139000,  v9,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] IDLE_TRACK | not idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu",  buf,  0x1Cu);
    }

uint64_t __41__SUCoreEventReporter__checkWhetherIdle___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)handleSendFinishedWithFileUUID:(id)a3 sendSucceeded:(BOOL)a4 withStatusCode:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  __int16 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke;
  block[3] = &unk_189FE93E0;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

uint64_t __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke( uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) _decrementActiveSendCount];
  if (!*(void *)(a1 + 40))
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(NSString);
    __int16 v9 = @"succeeded";
    if (!*(_BYTE *)(a1 + 64)) {
      __int16 v9 = @"failed";
    }
    id v10 = (void *)[v8 initWithFormat:@"callback [send %@ (status=%ld)] without file UUID - event file may be left on filesystem", v9, *(void *)(a1 + 56)];
    id v11 = *(void **)(a1 + 48);
    if (v11)
    {
      uint64_t v12 = [v11 code];
      uint64_t v13 = *(void *)(a1 + 48);
    }

    else
    {
      uint64_t v13 = 0LL;
      uint64_t v12 = *(void *)(a1 + 56);
    }

    [v7 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v10 withResult:v12 withError:v13];

    goto LABEL_35;
  }

  uint64_t v2 = *(void *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 64))
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to send event (status=%ld) validated file: %@", *(void *)(a1 + 56), *(void *)(a1 + 40)];
    if (v2)
    {
      uint64_t v16 = [*(id *)(a1 + 48) code];
      uint64_t v17 = *(void *)(a1 + 48);
      int64_t v18 = v14;
      BOOL v19 = v15;
    }

    else
    {
      int64_t v18 = v14;
      BOOL v19 = v15;
      uint64_t v16 = 8202LL;
      uint64_t v17 = 0LL;
    }

    [v18 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v19 withResult:v16 withError:v17];

    [*(id *)(a1 + 32) _activeEventForFileUUID:*(void *)(a1 + 40)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([*(id *)(a1 + 32) dropEventsOnSendFailure])
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 40);
        [v7 summary];
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v30;
        __int16 v46 = 2114;
        v47 = v31;
        _os_log_impl( &dword_187139000,  v29,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (dropped) | active:%{public}@",  buf,  0x16u);
      }

      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      id v34 = @"dropping on failed send";
    }

    else
    {
      objc_msgSend(v7, "setFailedSendCount:", objc_msgSend(v7, "failedSendCount") + 1);
      uint64_t v35 = [v7 failedSendCount];
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint8_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 oslog];
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v35 <= 7)
      {
        if (v38)
        {
          uint64_t v39 = *(void *)(a1 + 40);
          [v7 summary];
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v45 = v39;
          __int16 v46 = 2114;
          v47 = v40;
          _os_log_impl( &dword_187139000,  v37,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (will retry) | active:%{public}@",  buf,  0x16u);
        }

        [*(id *)(a1 + 32) _updateActiveEvent:v7 forFileUUID:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) _awaitRetryingFileUUID:*(void *)(a1 + 40)];
        goto LABEL_35;
      }

      if (v38)
      {
        uint64_t v41 = *(void *)(a1 + 40);
        [v7 summary];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v41;
        __int16 v46 = 2114;
        v47 = v42;
        _os_log_impl( &dword_187139000,  v37,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (max retries) | active:%{public}@",  buf,  0x16u);
      }

      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      id v34 = @"dropping on failed send (max retries)";
    }

    [v32 _removeFileUUID:v33 loggingError:1 forReason:v34];
    [*(id *)(a1 + 32) _sendFirstAwaitingRetry];
LABEL_35:

    return [*(id *)(a1 + 32) _checkWhetherIdle:@"send finished"];
  }

  if (!v2 && *(void *)(a1 + 56) == 200LL) {
    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = [v4 code];
    uint64_t v6 = *(void *)(a1 + 48);
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v5 = *(void *)(a1 + 56);
  }

  [v3 trackAnomaly:@"[EVENT_REPORTER] SEND_FINISHED" forReason:@"callback where send considered successful yet may not have been [completely sent]" withResult:v5 withError:v6];

  if (*(void *)(a1 + 48))
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      id v23 = *(void **)(a1 + 40);
      [*(id *)(a1 + 48) checkedDescription];
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      uint64_t v45 = v22;
      __int16 v46 = 2114;
      v47 = v23;
      __int16 v48 = 2114;
      uint64_t v49 = v24;
      _os_log_impl( &dword_187139000,  v21,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SEND_FINISHED | SUCCESS (with error) | sent event (status=%ld) validated file: %{public}@, error: %{public}@",  buf,  0x20u);
    }
  }

  else
  {
LABEL_19:
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 oslog];
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 56);
      uint64_t v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = v26;
      __int16 v46 = 2114;
      v47 = v27;
      _os_log_impl( &dword_187139000,  v21,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] SEND_FINISHED | SUCCESS | sent event (status=%ld) validated file: %{public}@",  buf,  0x16u);
    }
  }

  [*(id *)(a1 + 32) _removeFileUUID:*(void *)(a1 + 40) loggingError:1 forReason:@"send finished"];
  [*(id *)(a1 + 32) _sendAllAwaitingRetry];
  return [*(id *)(a1 + 32) _checkWhetherIdle:@"send finished"];
}

- (void)handleSendFinishedInvalidFileUUID:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreEventReporter splunkStateQueue](self, "splunkStateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke;
  block[3] = &unk_189FE92F0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[objc_alloc(NSString) initWithFormat:@"send callback fileUUID invalid (%@) - event file may be left on filesystem", *(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = [v4 code];
    uint64_t v6 = *(void *)(a1 + 40);
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v5 = 8204LL;
  }

  [v2 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v3 withResult:v5 withError:v6];

  [*(id *)(a1 + 48) _decrementActiveSendCount];
  return [*(id *)(a1 + 48) _checkWhetherIdle:@"send finished with invalid file UUID"];
}

+ (id)_nsURLSessionTaskNameForState:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)awaitingRetry
{
  return self->_awaitingRetry;
}

- (void)setAwaitingRetry:(id)a3
{
}

- (NSURL)splunkURL
{
  return self->_splunkURL;
}

- (void)setSplunkURL:(id)a3
{
}

- (OS_dispatch_queue)splunkStateQueue
{
  return self->_splunkStateQueue;
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
}

- (NSOperationQueue)inProcessOperationQueue
{
  return self->_inProcessOperationQueue;
}

- (void)setInProcessOperationQueue:(id)a3
{
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
}

- (SUCoreEventReporterDelegate)reporterDelegate
{
  return self->_reporterDelegate;
}

- (void)setReporterDelegate:(id)a3
{
}

- (NSString)storeToPath
{
  return self->_storeToPath;
}

- (void)setStoreToPath:(id)a3
{
}

- (NSString)persistedStatePath
{
  return self->_persistedStatePath;
}

- (void)setPersistedStatePath:(id)a3
{
}

- (int64_t)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(int64_t)a3
{
  self->_accessControl = a3;
}

- (SUCorePersistedState)activeEventsState
{
  return self->_activeEventsState;
}

- (void)setActiveEventsState:(id)a3
{
}

- (SUCoreEvent)lastErrorEvent
{
  return self->_lastErrorEvent;
}

- (void)setLastErrorEvent:(id)a3
{
}

- (BOOL)splunkAccessCreated
{
  return self->_splunkAccessCreated;
}

- (void)setSplunkAccessCreated:(BOOL)a3
{
  self->_splunkAccessCreated = a3;
}

- (BOOL)eventExtensionsDetermined
{
  return self->_eventExtensionsDetermined;
}

- (void)setEventExtensionsDetermined:(BOOL)a3
{
  self->_eventExtensionsDetermined = a3;
}

- (NSMutableDictionary)eventExtensions
{
  return self->_eventExtensions;
}

- (void)setEventExtensions:(id)a3
{
}

- (int)activeSendTaskCount
{
  return self->_activeSendTaskCount;
}

- (void)setActiveSendTaskCount:(int)a3
{
  self->_activeSendTaskCount = a3;
}

- (BOOL)dropEventsOnSendFailure
{
  return self->_dropEventsOnSendFailure;
}

- (void)setDropEventsOnSendFailure:(BOOL)a3
{
  self->_dropEventsOnSendFailure = a3;
}

- (id)onceIdleCompletion
{
  return self->_onceIdleCompletion;
}

- (void)setOnceIdleCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1( uint8_t *a1,  _BYTE *a2,  os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0( &dword_187139000,  a3,  (uint64_t)a3,  "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task without appropriate description",  a1);
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_0( &dword_187139000,  a1,  a3,  "[EVENT_REPORTER] SYNCHRONIZING | aligning encountered invalid key=value, dropped",  v3);
}

@end