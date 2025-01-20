@interface NSCloudKitMirroringDelegate
+ (BOOL)checkAndCreateDirectoryAtURL:(id)a3 wipeIfExists:(BOOL)a4 error:(id *)a5;
+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5;
+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 onlyCompareSharedZones:(BOOL)a5 error:(id *)a6;
+ (BOOL)isFirstPartyContainerIdentifier:(id)a3;
+ (BOOL)printEventsInStores:(id)a3 startingAt:(id)a4 endingAt:(id)a5 error:(id *)a6;
+ (BOOL)printSharedZoneWithName:(id)a3 inStoreAtURL:(id)a4 error:(id *)a5;
+ (BOOL)traceObjectMatchingRecordName:(id)a3 inStores:(id)a4 startingAt:(id)a5 endingAt:(id)a6 error:(id *)a7;
+ (BOOL)traceObjectMatchingValue:(id)a3 atKeyPath:(id)a4 inStores:(id)a5 startingAt:(id)a6 endingAt:(id)a7 error:(id *)a8;
+ (NSString)cloudKitMachServiceName;
+ (NSString)cloudKitMetadataTransformerName;
+ (id)createCloudKitServerWithMachServiceName:(id)a3 andStorageDirectoryPath:(id)a4;
+ (id)stringForResetReason:(unint64_t)a3;
+ (void)initialize;
+ (void)printMetadataForStoreAtURL:(id)a3 withConfiguration:(id)a4 operateOnACopy:(BOOL)a5;
+ (void)printRepresentativeSchemaForModelAtURL:(id)a3 orStoreAtURL:(id)a4 withConfiguration:(id)a5;
- (BOOL)registeredExportActivityHandler;
- (BOOL)registeredForSubscription;
- (BOOL)registeredImportActivityHandler;
- (BOOL)registeredSetupActivityHandler;
- (BOOL)shouldAttemptSetupRecoveryFromError:(char)a3 viaPush:;
- (BOOL)validateManagedObjectModel:(id)a3 forUseWithStoreWithDescription:(id)a4 error:(id *)a5;
- (NSCloudKitMirroringDelegate)initWithCloudKitContainerOptions:(id)a3;
- (NSCloudKitMirroringDelegate)initWithOptions:(id)a3;
- (NSPersistentStoreResult)executeMirroringRequest:(uint64_t *)a3 error:;
- (PFApplicationStateMonitor)applicationMonitor;
- (uint64_t)_dateExceedsSchedulingThreshold:(uint64_t)result;
- (uint64_t)_exportFinishedWithResult:(uint64_t)result exporter:(void *)a2;
- (uint64_t)_finishedRequest:(void *)a3 withResult:;
- (uint64_t)_importFinishedWithResult:(uint64_t)result importer:(void *)a2;
- (uint64_t)_markZonesNeedingRecoveryFromManateeIdentityLoss:(uint64_t)a3 databaseScope:(uint64_t)a4 inStore:(void *)a5 error:;
- (uint64_t)_recoverFromError:(void *)a3 withZoneIDs:(uint64_t)a4 forStore:(uint64_t)a5 inMonitor:;
- (uint64_t)recoverFromError:(uint64_t)a1;
- (void)_acceptShareMetadatasInRequest:(uint64_t)a3 workBlockContext:;
- (void)_disableAutomaticExports;
- (void)_enableAutomaticExports;
- (void)_openTransactionWithLabel:(uint64_t)a3 assertionLabel:(uint64_t)a4 andExecuteWorkBlock:;
- (void)_performAcceptShareInvitationsRequest:(uint64_t)a1;
- (void)_performDelegateResetRequest:(uint64_t)a1;
- (void)_performExportProgressRequest:(uint64_t)a1;
- (void)_performSchemaInitializationRequest:(uint64_t)a1;
- (void)_performSerializationRequest:(uint64_t)a1;
- (void)_performSetupRequest:(uint64_t)a1;
- (void)_postResetSyncNotificationWithName:(void *)a3 forError:;
- (void)_requestAbortedNotInitialized:(uint64_t)a1;
- (void)_requestEncounteredRecoverableError:(void *)a3 withResult:;
- (void)_requestEncounteredUnrecoverableError:(void *)a3 withResult:;
- (void)_scheduleAutomatedExportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:;
- (void)_scheduleAutomatedImportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:;
- (void)_setUpCloudKitIntegration:(uint64_t)a1;
- (void)addActivityVoucher:(id)a3;
- (void)applicationStateMonitorEnteredBackground:(id)a3;
- (void)applicationStateMonitorEnteredForeground:(id)a3;
- (void)applicationStateMonitorExpiredBackgroundActivityTimeout:(id)a3;
- (void)beginActivitiesForRequest:(uint64_t)a1;
- (void)checkAndExecuteNextRequest;
- (void)checkAndScheduleImportIfNecessaryFromPush:(char)a3 fromErrorRecovery:fromShareAccept:andStartAfterDate:;
- (void)ckAccountOrIdentityChangedHandler:(id)a3;
- (void)coordinatorWillRemoveStore:(id)a3;
- (void)dealloc;
- (void)eventUpdated:(id)a3;
- (void)expireActivityVoucher:(id)a3;
- (void)exporter:(id)a3 willScheduleOperations:(id)a4;
- (void)finishedAutomatedRequestWithResult:(uint64_t)a1;
- (void)logResetSyncNotification:(id)a3;
- (void)managedObjectContextSaved:(id)a3;
- (void)newActivityWithIdentifier:(void *)a3 andVoucher:;
- (void)persistentStoreCoordinator:(id)a3 didSuccessfullyAddPersistentStore:(id)a4 withDescription:(id)a5;
- (void)publishActivity:(id)a3;
- (void)registerForAccountAndIdentityNotificationsIfNeeded;
- (void)remoteStoreDidChange:(id)a3;
- (void)removeNotificationRegistrations;
- (void)resetAfterError:(uint64_t)a1 andKeepContainer:(void *)a2;
- (void)scheduleExportAndStartAfterDate:(uint64_t)a1;
- (void)storesDidChange:(id)a3;
- (void)tearDown:(uint64_t)a1;
@end

@implementation NSCloudKitMirroringDelegate

+ (NSString)cloudKitMachServiceName
{
  return (NSString *)@"com.apple.coredatad.cloudkit";
}

+ (id)createCloudKitServerWithMachServiceName:(id)a3 andStorageDirectoryPath:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___CDDCloudKitServerConfiguration);
  if ([a3 length])
  {
    if (!v6)
    {
      [a4 length];
      goto LABEL_7;
    }

    objc_setProperty_nonatomic(v6, v7, a3, 16LL);
  }

  if ([a4 length] && v6) {
    objc_setProperty_nonatomic(v6, v8, a4, 8LL);
  }
LABEL_7:
  v9 = -[CDDCloudKitServer initWithListener:configuration:]( objc_alloc(&OBJC_CLASS___CDDCloudKitServer),  "initWithListener:configuration:",  0LL,  v6);

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    objc_opt_class();
  }
}

- (NSCloudKitMirroringDelegate)initWithOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v4 = -[NSCloudKitMirroringDelegate init](self, "init");
  if (v4)
  {
    v5 = (void *)MEMORY[0x186E3E5D8]();
    v6 = (NSCloudKitMirroringDelegateOptions *)[a3 copy];
    v4->_options = v6;
    if (!-[NSCloudKitMirroringDelegateOptions progressProvider](v6, "progressProvider")) {
      -[NSCloudKitMirroringDelegateOptions setProgressProvider:](v4->_options, "setProgressProvider:", v4);
    }
    objc_autoreleasePoolPop(v5);
    if (_MergedGlobals_83 != -1) {
      dispatch_once(&_MergedGlobals_83, &__block_literal_global_27);
    }
    v4->_cloudKitQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    v4->_cloudKitQueue = (OS_dispatch_queue *)(id)qword_18C4ABB08;
    v4->_databaseSubscription = 0LL;
    *(_WORD *)&v4->_hadObservedStore = 0;
    v4->_setupFinishedMetadataInitialization = 0;
    *(_WORD *)&v4->_registeredForAccountChangeNotifications = 0;
    v4->_requestManager = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringRequestManager);
    v4->_voucherManager = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringActivityVoucherManager);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v7 = (void *)[a3 activityVouchers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          -[NSCloudKitMirroringActivityVoucherManager addVoucher:]( v4->_voucherManager,  "addVoucher:",  *(void *)(*((void *)&v25 + 1) + 8 * i));
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v8);
    }

    objc_initWeak(&location, v4);
    v11 = objc_alloc(&OBJC_CLASS___PFCloudKitThrottledNotificationObserver);
    uint64_t v19 = MEMORY[0x1895F87A8];
    uint64_t v20 = 3221225472LL;
    v21 = __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke_2;
    v22 = &unk_189EAB3A0;
    objc_copyWeak(&v23, &location);
    uint64_t v12 = -[PFCloudKitThrottledNotificationObserver initWithLabel:handlerBlock:]( v11,  "initWithLabel:handlerBlock:",  @"AccountChangeObserver",  &v19);
    v4->_accountChangeObserver = (PFCloudKitThrottledNotificationObserver *)v12;
    if (v12) {
      *(void *)(v12 + 32) = 10LL;
    }
    if (-[NSCloudKitMirroringDelegateOptions automaticallyScheduleImportAndExportOperations]( v4->_options,  "automaticallyScheduleImportAndExportOperations",  v19,  v20,  v21,  v22))
    {
      options = v4->_options;
      if (!options || (scheduler = options->_scheduler) == 0LL) {
        scheduler = (CKScheduler *)-[objc_class sharedScheduler](getCloudKitCKSchedulerClass(), "sharedScheduler");
      }
      v4->_scheduler = scheduler;
      if (-[NSCloudKitMirroringDelegateOptions databaseScope](v4->_options, "databaseScope") == 2
        || -[NSCloudKitMirroringDelegateOptions databaseScope](v4->_options, "databaseScope") == 3)
      {
        v15 = v4->_options;
        if (v15 && (notificationListener = v15->_notificationListener) != 0LL)
        {
          v17 = notificationListener;
        }

        else if (-[NSString length]( -[NSCloudKitMirroringDelegateOptions apsConnectionMachServiceName]( v15,  "apsConnectionMachServiceName"),  "length"))
        {
          v17 = (CKNotificationListener *)objc_msgSend( objc_alloc(getCloudKitCKNotificationListenerClass()),  "initWithMachServiceName:",  -[NSCloudKitMirroringDelegateOptions apsConnectionMachServiceName]( v4->_options,  "apsConnectionMachServiceName"));
        }

        else
        {
          v17 = (CKNotificationListener *)objc_alloc_init(getCloudKitCKNotificationListenerClass());
        }
      }

      else
      {
        v17 = 0LL;
      }

      v4->_notificationListener = v17;
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v4;
}

dispatch_queue_t __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.coredata.cloudkit.queue", v0);
  qword_18C4ABB08 = (uint64_t)result;
  return result;
}

void __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = 134415LL;
    if ([a2 isEqualToString:getCloudKitCKIdentityUpdateNotification()])
    {
      uint64_t v3 = 134416LL;
    }

    else if (![a2 isEqualToString:getCloudKitCKAccountChangedNotification()])
    {
      uint64_t v4 = 0LL;
      goto LABEL_7;
    }

    uint64_t v4 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:v3 userInfo:0];
LABEL_7:
    v5 = -[NSCloudKitMirroringDelegateResetRequest initWithError:completionBlock:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateResetRequest),  "initWithError:completionBlock:",  v4,  0LL);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke;
    v7[3] = &unk_189EAB0A8;
    v7[4] = WeakRetained;
    v7[5] = v5;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)WeakRetained,  (uint64_t)@"com.apple.coredata.cloudkit.schedule.enqueue",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v7);
  }
}

- (NSCloudKitMirroringDelegate)initWithCloudKitContainerOptions:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v5 = (NSCloudKitMirroringDelegateOptions *)a3;
  }
  else {
    v5 = -[NSCloudKitMirroringDelegateOptions initWithCloudKitContainerOptions:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateOptions),  "initWithCloudKitContainerOptions:",  a3);
  }
  v6 = v5;
  v7 = -[NSCloudKitMirroringDelegate initWithOptions:](self, "initWithOptions:", v5);

  return v7;
}

- (void)registerForAccountAndIdentityNotificationsIfNeeded
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x186E3E5D8]();
    if (!*(_BYTE *)(a1 + 112))
    {
      uint64_t v3 = (void *)[MEMORY[0x189607958] defaultCenter];
      [v3 addObserver:a1 selector:sel_ckAccountOrIdentityChangedHandler_ name:getCloudKitCKAccountChangedNotification() object:0];
      *(_BYTE *)(a1 + 112) = 1;
    }

    if (!*(_BYTE *)(a1 + 113))
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v4 = (void *)[MEMORY[0x189607958] defaultCenter];
        [v4 addObserver:a1 selector:sel_ckAccountOrIdentityChangedHandler_ name:getCloudKitCKIdentityUpdateNotification() object:*(void *)(a1 + 48)];
        *(_BYTE *)(a1 + 113) = 1;
      }
    }

    objc_autoreleasePoolPop(v2);
  }

- (void)removeNotificationRegistrations
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x186E3E5D8]();
    id Weak = objc_loadWeak((id *)(a1 + 128));
    uint64_t v4 = (void *)[MEMORY[0x189607958] defaultCenter];
    [v4 removeObserver:a1 name:getCloudKitCKAccountChangedNotification() object:0];
    [v4 removeObserver:a1 name:getCloudKitCKIdentityUpdateNotification() object:*(void *)(a1 + 48)];
    [v4 removeObserver:a1 name:@"NSPersistentStoreCoordinatorWillRemoveStoreNotification" object:objc_loadWeak((id *)(a1 + 120))];
    [v4 removeObserver:a1 name:@"NSPersistentStoreCoordinatorStoresDidChangeNotification" object:Weak];
    [v4 removeObserver:a1 name:@"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification" object:Weak];
    [v4 removeObserver:a1 name:@"NSPersistentStoreRemoteChangeNotification" object:Weak];
    *(_WORD *)(a1 + 112) = 0;
    objc_autoreleasePoolPop(v2);
  }

- (void)dealloc
{
  self->_coredatadClient = 0LL;
  self->_cloudKitQueue = 0LL;

  self->_options = 0LL;
  self->_currentUserRecordID = 0LL;

  self->_databaseSubscription = 0LL;
  self->_container = 0LL;

  self->_database = 0LL;
  self->_scheduler = 0LL;

  self->_notificationListener = 0LL;
  self->_lastInitializationError = 0LL;

  self->_exporterOptions = 0LL;
  objc_storeWeak((id *)&self->_observedStore, 0LL);
  objc_storeWeak((id *)&self->_observedCoordinator, 0LL);

  self->_sharingUIObserver = 0LL;
  self->_applicationMonitor = 0LL;

  self->_accountChangeObserver = 0LL;
  self->_setupActivityIdentifier = 0LL;

  self->_activityGroupName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegate;
  -[NSCloudKitMirroringDelegate dealloc](&v3, sel_dealloc);
}

- (BOOL)validateManagedObjectModel:(id)a3 forUseWithStoreWithDescription:(id)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x1895F89C0];
  v35 = 0LL;
  if (self->_hadObservedStore)
  {
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v40 = *MEMORY[0x1896075F0];
    v41 = @"Instances of NSCloudKitMirroringDelegate are not reusable and should have a lifecycle tied to a given instance of NSPersistentStore.";
    v7 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v35 = v7;
    if (v7) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t v26 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
    v33 = (os_log_s *)__pflogFaultLog;
    BOOL v8 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v8) {
      return v8;
    }
    *(_DWORD *)buf = 136315394;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
    __int16 v38 = 1024;
    int v39 = 395;
    _os_log_fault_impl( &dword_186681000,  v33,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
LABEL_22:
    LOBYTE(v8) = 0;
    return v8;
  }

  if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a4, "options"),  "objectForKey:",  @"NSCloudKitMirroringDelegateReadOnlyOptionKey"),  "BOOLValue"))
  {
LABEL_6:
    LOBYTE(v8) = 1;
    return v8;
  }

  uint64_t v12 = -[PFCloudKitModelValidator initWithManagedObjectModel:configuration:mirroringDelegateOptions:]( [PFCloudKitModelValidator alloc],  "initWithManagedObjectModel:configuration:mirroringDelegateOptions:",  a3,  [a4 configuration],  self->_options);
  v13 = v12;
  options = self->_options;
  if (options) {
    LOBYTE(options) = options->_skipCloudKitSetup;
  }
  if (!v12) {
    goto LABEL_18;
  }
  v12->_skipValueTransformerValidation = (char)options;
  if (!a4)
  {
    v17 = (void *)NSString;
    v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = [v17 stringWithFormat:@"Cannot be used without an instance of %@.", NSStringFromClass(v18)];
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x189607460];
    uint64_t v42 = *MEMORY[0x1896075F0];
    uint64_t v43 = v19;
    v22 = (void *)MEMORY[0x189603F68];
    id v23 = &v43;
    v24 = &v42;
LABEL_17:
    v35 = (void *)objc_msgSend( v20,  "errorWithDomain:code:userInfo:",  v21,  134060,  objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1));
LABEL_18:

    goto LABEL_19;
  }

  if ((objc_msgSend((id)objc_msgSend(a4, "type"), "isEqualToString:", @"SQLite") & 1) == 0)
  {
    uint64_t v25 = [NSString stringWithFormat:@"CloudKit integration is only supported for %@ stores.", @"SQLite"];
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x189607460];
    uint64_t v44 = *MEMORY[0x1896075F0];
    v45[0] = v25;
    v22 = (void *)MEMORY[0x189603F68];
    id v23 = v45;
    v24 = &v44;
    goto LABEL_17;
  }

  v15 = objc_alloc_init(&OBJC_CLASS___PFCloudKitOptionsValidator);
  BOOL v16 = -[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:]( (BOOL)v15,  self->_options,  (void *)[a4 options],  (uint64_t *)&v35);

  if (v16) {
    goto LABEL_6;
  }
LABEL_19:
  v7 = v35;
  if (!v35) {
    goto LABEL_20;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_22;
  }
  LOBYTE(v8) = 0;
  *a5 = v7;
  return v8;
}

- (void)persistentStoreCoordinator:(id)a3 didSuccessfullyAddPersistentStore:(id)a4 withDescription:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __108__NSCloudKitMirroringDelegate_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription___block_invoke;
  v5[3] = &unk_189EAAFE0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.cloudkit.store.added",  (uint64_t)@"CoreData: CloudKit Add Persistent Store",  (uint64_t)v5);
}

void __108__NSCloudKitMirroringDelegate_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription___block_invoke( void *a1)
{
  v29[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v1 = a1[4];
  if (v1)
  {
    v2 = (void *)a1[5];
    objc_super v3 = (void *)a1[6];
    id Weak = objc_loadWeak((id *)(v1 + 120));
    v5 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v6 = (unint64_t)__ckLoggingOverride >= 9 ? 9LL : __ckLoggingOverride;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Observing store: %@"];
    _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]");
    objc_autoreleasePoolPop(v5);
    if (!Weak)
    {
      v14 = (void *)MEMORY[0x186E3E5D8]();
      objc_storeWeak((id *)(v1 + 120), v2);
      objc_storeWeak((id *)(v1 + 128), v3);
      *(_BYTE *)(v1 + 88) = 1;
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v1,  sel_coordinatorWillRemoveStore_,  @"NSPersistentStoreCoordinatorWillRemoveStoreNotification",  0);
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v1,  sel_storesDidChange_,  @"NSPersistentStoreCoordinatorStoresDidChangeNotification",  v3);
      id v15 = (id)[v2 identifier];
      *(void *)(v1 + 168) = v15;
      *(void *)(v1 + 176) = (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.coredata.cloudkit.activity.import", v15, v1, v2];
      *(void *)(v1 + 184) = (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.coredata.cloudkit.activity.export", *(void *)(v1 + 168)];
      *(void *)(v1 + 192) = (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.coredata.cloudkit.activity.setup", *(void *)(v1 + 168)];
      *(void *)(v1 + 200) = (id)[NSString stringWithFormat:@"com.apple.coredata.cloudkit.%@.%@", objc_msgSend( (id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "processName"), *(void *)(v1 + 168)];
      if ([*(id *)(v1 + 8) automaticallyScheduleImportAndExportOperations])
      {
        objc_initWeak(location, (id)v1);
        BOOL v16 = *(void **)(v1 + 64);
        uint64_t v17 = *(void *)(v1 + 184);
        uint64_t v18 = MEMORY[0x1895F87A8];
        v23[0] = MEMORY[0x1895F87A8];
        v23[1] = 3221225472LL;
        v23[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke;
        v23[3] = &unk_189EAB008;
        objc_copyWeak(&v24, location);
        [v16 registerActivityIdentifier:v17 handler:v23];
        *(_BYTE *)(v1 + 146) = 1;
        objc_destroyWeak(&v24);
        uint64_t v19 = *(void **)(v1 + 64);
        uint64_t v20 = *(void *)(v1 + 176);
        v28[0] = v18;
        v28[1] = 3221225472LL;
        v28[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_2;
        v28[3] = &unk_189EAB008;
        objc_copyWeak(v29, location);
        [v19 registerActivityIdentifier:v20 handler:v28];
        *(_BYTE *)(v1 + 147) = 1;
        objc_destroyWeak(v29);
        uint64_t v21 = *(void **)(v1 + 64);
        uint64_t v22 = *(void *)(v1 + 192);
        v26[0] = v18;
        v26[1] = 3221225472LL;
        v26[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_3;
        v26[3] = &unk_189EA96E0;
        objc_copyWeak(v27, location);
        v26[4] = v1;
        [v21 registerActivityIdentifier:v22 handler:v26];
        *(_BYTE *)(v1 + 148) = 1;
        objc_destroyWeak(v27);
        objc_destroyWeak(location);
      }

      -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v1, 0LL);
      objc_autoreleasePoolPop(v14);
    }
  }

- (void)_openTransactionWithLabel:(uint64_t)a3 assertionLabel:(uint64_t)a4 andExecuteWorkBlock:
{
  if (a1)
  {
    uint64_t v6 = -[NSCloudKitMirroringDelegateWorkBlockContext initWithTransactionLabel:powerAssertionLabel:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateWorkBlockContext),  "initWithTransactionLabel:powerAssertionLabel:",  a2,  a3);
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 32);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __92__NSCloudKitMirroringDelegate__openTransactionWithLabel_assertionLabel_andExecuteWorkBlock___block_invoke;
    v8[3] = &unk_189EA9538;
    v8[4] = v6;
    v8[5] = a4;
    dispatch_async(v7, v8);
  }

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v15 = WeakRetained;
  if (WeakRetained)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( (uint64_t)WeakRetained,  (uint64_t)@"ExportActivity",  a2,  0LL,  a3);
  }

  else
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v7 = __ckLoggingOverride;
    }
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Got called back for an export activity but the mirroring delegate is gone."];
    _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke");
    objc_autoreleasePoolPop(v6);
  }
}

- (void)_scheduleAutomatedExportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:
{
  v34[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v11 = __ckLoggingOverride;
    }
    uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Beginning automated export - %@:\n%@"];
    _NSCoreDataLog( v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]");
    objc_autoreleasePoolPop(v10);
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringRequestOptions);
    if ([*(id *)(a1 + 8) defaultOperationConfiguration]) {
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:]( v19,  "setOperationConfiguration:",  [*(id *)(a1 + 8) defaultOperationConfiguration]);
    }
    if (a4 || (a4 = [*(id *)(a1 + 224) usableVoucherForEventType:2]) != 0)
    {
      v34[0] = a4;
      -[NSCloudKitMirroringRequestOptions setVouchers:]( v19,  "setVouchers:",  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1]);
    }

    uint64_t v20 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportRequest);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __100__NSCloudKitMirroringDelegate__scheduleAutomatedExportWithLabel_activity_voucher_completionHandler___block_invoke;
    v31[3] = &unk_189EAB328;
    v31[4] = a1;
    v31[5] = a2;
    v31[6] = a5;
    uint64_t v21 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:]( v20,  "initWithActivity:options:completionBlock:",  a3,  v19,  v31);
    uint64_t v30 = 0LL;
    if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](a1, v21, &v30))
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Failed to execute mirroring request for automated export: %@"];
      _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, v30);
      uint64_t v29 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v30;
        _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to execute mirroring request for automated export: %@",  buf,  0xCu);
      }
    }
  }

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v15 = WeakRetained;
  if (WeakRetained)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]( (uint64_t)WeakRetained,  (uint64_t)@"ImportActivity",  a2,  0LL,  a3);
  }

  else
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v7 = __ckLoggingOverride;
    }
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Got called back for activity: %@, but the mirroring delegate is gone."];
    _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke_2");
    objc_autoreleasePoolPop(v6);
  }
}

- (void)_scheduleAutomatedImportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:
{
  v34[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v11 = __ckLoggingOverride;
    }
    uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Beginning automated import - %@ - in response to activity:\n%@"];
    _NSCoreDataLog( v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]");
    objc_autoreleasePoolPop(v10);
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringRequestOptions);
    if ([*(id *)(a1 + 8) defaultOperationConfiguration]) {
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:]( v19,  "setOperationConfiguration:",  [*(id *)(a1 + 8) defaultOperationConfiguration]);
    }
    if (a4 || (a4 = [*(id *)(a1 + 224) usableVoucherForEventType:1]) != 0)
    {
      v34[0] = a4;
      -[NSCloudKitMirroringRequestOptions setVouchers:]( v19,  "setVouchers:",  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1]);
    }

    uint64_t v20 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringImportRequest);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __100__NSCloudKitMirroringDelegate__scheduleAutomatedImportWithLabel_activity_voucher_completionHandler___block_invoke;
    v31[3] = &unk_189EAB328;
    v31[4] = a1;
    v31[5] = a2;
    v31[6] = a5;
    uint64_t v21 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:]( v20,  "initWithActivity:options:completionBlock:",  a3,  v19,  v31);
    uint64_t v30 = 0LL;
    if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](a1, v21, &v30))
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Failed to execute mirroring request for automated import: %@"];
      _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, v30);
      uint64_t v29 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v30;
        _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to execute mirroring request for automated import: %@",  buf,  0xCu);
      }
    }
  }

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained[4];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_4;
    block[3] = &unk_189EA95D8;
    block[4] = *(void *)(a1 + 32);
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v10 = __ckLoggingOverride;
    }
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Got called back for activity: %@, but the mirroring delegate is gone."];
    _NSCoreDataLog( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke_3");
    objc_autoreleasePoolPop(v9);
  }
}

uint64_t __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_4( uint64_t *a1)
{
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_setUpCloudKitIntegration:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequestOptions);
    if ([*(id *)(a1 + 8) defaultOperationConfiguration]) {
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:]( v4,  "setOperationConfiguration:",  [*(id *)(a1 + 8) defaultOperationConfiguration]);
    }
    v5 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequest),  "initWithActivity:options:completionBlock:",  a2,  v4,  0LL);
    -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](a1, v5);
    uint64_t v24 = 0LL;
    BOOL v6 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](*(void *)(a1 + 160), (uint64_t)v5, &v24);
    uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
    if (v6)
    {
      else {
        uint64_t v8 = __ckLoggingOverride;
      }
      uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Successfully enqueued setup request: %@"];
      _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:]");
      objc_autoreleasePoolPop(v7);
      -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](a1);
    }

    else
    {
      BOOL v16 = __ckLoggingOverride != 0;
      uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to enqueue setup request, this likely means one is already scheduled and this has collided: %@"];
      _NSCoreDataLog( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:]");
      objc_autoreleasePoolPop(v7);
    }
  }

- (void)tearDown:(uint64_t)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __40__NSCloudKitMirroringDelegate_tearDown___block_invoke;
    v2[3] = &unk_189EAB0A8;
    v2[4] = a1;
    v2[5] = a2;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.teardown",  (uint64_t)@"CoreData: CloudKit Teardown",  (uint64_t)v2);
  }

- (void)beginActivitiesForRequest:(uint64_t)a1
{
  if (a1)
  {
    id v7 = (id)[*(id *)(a1 + 8) progressProvider];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = -[NSPersistentCloudKitContainerEventActivity initWithRequestIdentifier:storeIdentifier:eventType:]( [NSPersistentCloudKitContainerEventActivity alloc],  [a2 requestIdentifier],  *(void *)(a1 + 168));
        if (a2) {
          objc_setProperty_nonatomic(a2, v4, v5, 72LL);
        }
        BOOL v6 = (void *)[v5 beginActivityForPhase:0];
        [v7 publishActivity:v5];
        [v7 publishActivity:v6];
      }
    }
  }

- (void)checkAndExecuteNextRequest
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Checking for pending requests."];
    _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]");
    objc_autoreleasePoolPop(v2);
    objc_initWeak(&location, a1);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __57__NSCloudKitMirroringDelegate_checkAndExecuteNextRequest__block_invoke;
    v11[3] = &unk_189EAB300;
    objc_copyWeak(&v12, &location);
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)a1,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

- (void)resetAfterError:(uint64_t)a1 andKeepContainer:(void *)a2
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v4 = [NSString stringWithUTF8String:"resetAfterError illegally passed nil instead of an error on a failure condition"];
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v21);
      uint64_t v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: resetAfterError illegally passed nil instead of an error on a failure condition",  buf,  2u);
      }
    }

    id v12 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v13 = __ckLoggingOverride != 0;
    uint64_t v14 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - resetting internal state after error: %@"];
    _NSCoreDataLog( v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"-[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:]");
    objc_autoreleasePoolPop(v12);
    -[NSCloudKitMirroringDelegate removeNotificationRegistrations](a1);

    *(void *)(a1 + 80) = a2;
    *(_BYTE *)(a1 + 89) = 0;

    *(void *)(a1 + 152) = 0LL;
    *(void *)(a1 + 96) = 0LL;
    -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](a1);
  }

- (BOOL)shouldAttemptSetupRecoveryFromError:(char)a3 viaPush:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  uint64_t v6 = (void *)[a2 domain];
  if (![v6 isEqualToString:getCloudKitCKErrorDomain()])
  {
    uint64_t v9 = (void *)[a2 domain];
    if (![v9 isEqualToString:*MEMORY[0x189607740]]
      || [a2 code] != -1
      && [a2 code] != -999
      && [a2 code] != -1001
      && [a2 code] != -1003
      && [a2 code] != -1004
      && [a2 code] != -1005
      && [a2 code] != -1006
      && [a2 code] != -1007
      && [a2 code] != -1008
      && [a2 code] != -1009
      && [a2 code] != -1010
      && [a2 code] != -1012
      && [a2 code] != -1013
      && [a2 code] != -1014
      && [a2 code] != -1100
      && [a2 code] != -1101
      && [a2 code] != -1102
      && [a2 code] != -1103
      && [a2 code] != -1104
      && [a2 code] != -1200
      && [a2 code] != -2000
      && [a2 code] != -3000
      && [a2 code] != -3001
      && [a2 code] != -3002
      && [a2 code] != -3003
      && [a2 code] != -3004
      && [a2 code] != -3005
      && [a2 code] != -3006
      && [a2 code] != -3007
      && [a2 code] != -1018
      && [a2 code] != -1019
      && [a2 code] != -1020
      && [a2 code] != -995
      && [a2 code] != -996
      && [a2 code] != -997)
    {
      goto LABEL_49;
    }

    goto LABEL_47;
  }

  if ([a2 code] == 3
    || [a2 code] == 4
    || [a2 code] == 22
    || [a2 code] == 7
    || [a2 code] == 23
    || [a2 code] == 6)
  {
LABEL_47:
    a3 = 1;
LABEL_48:
    *((_BYTE *)v15 + 24) = a3;
    goto LABEL_49;
  }

  if ([a2 code] != 2)
  {
    if ([a2 code] != 25) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  *((_BYTE *)v15 + 24) = 1;
  uint64_t v7 = (void *)[a2 userInfo];
  uint64_t v8 = (void *)[v7 objectForKey:getCloudKitCKPartialErrorsByItemIDKey[0]()];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __75__NSCloudKitMirroringDelegate_shouldAttemptSetupRecoveryFromError_viaPush___block_invoke;
  v12[3] = &unk_189EAB030;
  char v13 = a3;
  v12[4] = a1;
  v12[5] = &v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
LABEL_49:
  BOOL v10 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __75__NSCloudKitMirroringDelegate_shouldAttemptSetupRecoveryFromError_viaPush___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (getCloudKitCKRecordZoneIDClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), uint64_t result = objc_opt_isKindOfClass(), (result & 1) != 0))
  {
    uint64_t result = -[NSCloudKitMirroringDelegate shouldAttemptSetupRecoveryFromError:viaPush:]( *(void *)(a1 + 32),  a3,  *(unsigned __int8 *)(a1 + 48));
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }

  return result;
}

void __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __74__NSCloudKitMirroringDelegate__respondToPushNotification_forSubscription___block_invoke;
    v16[3] = &unk_189EAAFE0;
    v16[4] = WeakRetained;
    v16[5] = a3;
    v16[6] = a2;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)WeakRetained,  (uint64_t)@"com.apple.coredata.cloudkit.push",  (uint64_t)@"CoreData: CloudKit Responding to Push",  (uint64_t)v16);
  }

  else
  {
    uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Got called back for subscription: %@, but the mirroring delegate is gone. Notification:\n%@"];
    _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }
}

- (void)scheduleExportAndStartAfterDate:(uint64_t)a1
{
  if (a1 && [*(id *)(a1 + 8) automaticallyScheduleImportAndExportOperations])
  {
    if (*(_BYTE *)(a1 + 89))
    {
      uint64_t v4 = (void *)[*(id *)(a1 + 224) usableVoucherForEventType:2];
      uint64_t v5 = v4;
      if (a2)
      {
        uint64_t v6 = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](a1, *(void *)(a1 + 184), v4);
        [v6 setEarliestStartDate:a2];
      }

      else
      {
        if (objc_msgSend((id)objc_msgSend(v4, "operationConfiguration"), "qualityOfService") > 24)
        {
          -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( a1,  (uint64_t)@"AutomatedExportBypassingDasdDueToVoucher",  0LL,  (uint64_t)v5,  0LL);
          return;
        }

        uint64_t v6 = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](a1, *(void *)(a1 + 184), v5);
      }

      [*(id *)(a1 + 64) submitActivity:v6];
    }

    else
    {
      uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v8 = __ckLoggingOverride;
      }
      uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Deferring export because the mirroring delegate is not initialized:\n%@"];
      _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:]");
      objc_autoreleasePoolPop(v7);
    }
  }

void __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3 && *(void *)(v3 + 152))
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( (uint64_t)WeakRetained,  (uint64_t)@"SandboxExport",  0LL,  0LL,  0LL);
      id WeakRetained = v13;
    }

    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]( (uint64_t)WeakRetained,  (uint64_t)@"SandboxImport",  0LL,  0LL,  0LL);
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Tried to schedule sandbox operations but the mirroring delegate was gone."];
    _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]_block_invoke_2");
    objc_autoreleasePoolPop(v4);
  }
}

- (void)checkAndScheduleImportIfNecessaryFromPush:(char)a3 fromErrorRecovery:fromShareAccept:andStartAfterDate:
{
  if (a1)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
    v3[3] = &unk_189EAB2D8;
    char v4 = a2;
    char v5 = 0;
    char v6 = a3;
    v3[4] = a1;
    v3[5] = 0LL;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v3);
  }

void __40__NSCloudKitMirroringDelegate_tearDown___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x186E3E5D8]();
  BOOL v3 = __ckLoggingOverride != 0;
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Told to tear down with reason: %@"];
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate tearDown:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v11 + 146))
  {
    [*(id *)(v11 + 64) unregisterActivityIdentifier:*(void *)(v11 + 184)];
    *(_BYTE *)(*(void *)(a1 + 32) + 146LL) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v11 + 147))
  {
    [*(id *)(v11 + 64) unregisterActivityIdentifier:*(void *)(v11 + 176)];
    *(_BYTE *)(*(void *)(a1 + 32) + 147LL) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v11 + 148))
  {
    [*(id *)(v11 + 64) unregisterActivityIdentifier:*(void *)(v11 + 192)];
    *(_BYTE *)(*(void *)(a1 + 32) + 148LL) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v11 + 145))
  {
    objc_msgSend( *(id *)(v11 + 72),  "unregisterForSubscriptionWithID:inDatabase:",  objc_msgSend(*(id *)(v11 + 40), "subscriptionID"),  *(void *)(*(void *)(a1 + 32) + 56));
    *(_BYTE *)(*(void *)(a1 + 32) + 145LL) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
  }

  -[NSCloudKitMirroringDelegate removeNotificationRegistrations](v11);
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v12 + 89))
  {
    id v13 = -[NSCloudKitMirroringRequestManager dequeueAllPendingRequests](*(id **)(v12 + 160));
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = v13;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      uint64_t v17 = *MEMORY[0x189607460];
      uint64_t v18 = *MEMORY[0x1896075F0];
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
          else {
            uint64_t v22 = __ckLoggingOverride;
          }
          uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Cancelling pending request: %@"];
          uint64_t v32 = *(void *)(a1 + 32);
          _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[NSCloudKitMirroringDelegate tearDown:]_block_invoke");
          objc_autoreleasePoolPop(v21);
          uint64_t v30 = (void *)MEMORY[0x189607870];
          uint64_t v38 = v18;
          uint64_t v39 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v20, "requestIdentifier"), 843, v32, v20];
          uint64_t v31 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( [NSCloudKitMirroringResult alloc],  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v20,  *(void *)(*(void *)(a1 + 32) + 168),  0,  0,  objc_msgSend( v30,  "errorWithDomain:code:userInfo:",  v17,  134407,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1)));
          -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:]((uint64_t)v20, (uint64_t)v31);
        }

        uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }

      while (v15);
    }

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 120LL), 0LL);
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 128LL), 0LL);
    *(_BYTE *)(*(void *)(a1 + 32) + 89LL) = 0;

    *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
    *(void *)(*(void *)(a1 + 32) + 48LL) = 0LL;

    *(void *)(*(void *)(a1 + 32) + 152LL) = 0LL;
    *(void *)(*(void *)(a1 + 32) + 96LL) = 0LL;
  }

- (void)coordinatorWillRemoveStore:(id)a3
{
  id v4 = (id)[a3 object];
  if (v4 == objc_loadWeak((id *)&self->_observedStore)) {
    -[NSCloudKitMirroringDelegate tearDown:]((uint64_t)self, (uint64_t)@"Store Removed");
  }
}

- (void)storesDidChange:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_observedCoordinator);
  if (Weak == (id)[a3 object])
  {
    if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"removed"),  "containsObject:",  objc_loadWeak((id *)&self->_observedStore))) {
      -[NSCloudKitMirroringDelegate tearDown:]((uint64_t)self, (uint64_t)@"Stores Changed");
    }
  }

- (void)ckAccountOrIdentityChangedHandler:(id)a3
{
}

void __74__NSCloudKitMirroringDelegate__respondToPushNotification_forSubscription___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Got notification for subscription: %@\n%@"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate _respondToPushNotification:forSubscription:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v11 + 89))
  {
    uint64_t v39 = MEMORY[0x1895F87A8];
    uint64_t v40 = 3221225472LL;
    uint64_t v41 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
    uint64_t v42 = &unk_189EAB2D8;
    __int16 v45 = 1;
    char v46 = 0;
    uint64_t v43 = v11;
    uint64_t v44 = 0LL;
    uint64_t v12 = @"com.apple.coredata.cloudkit.schedule";
    id v13 = @"CoreData: CloudKit Scheduling";
    uint64_t v14 = v11;
LABEL_32:
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v14,  (uint64_t)v12,  (uint64_t)v13,  (uint64_t)&v39);
    return;
  }

  uint64_t v15 = *(void **)(v11 + 80);
  uint64_t v16 = (void *)[v15 domain];
  if (![v16 isEqualToString:getCloudKitCKErrorDomain()])
  {
    if (objc_msgSend( (id)objc_msgSend(v15, "domain"),  "isEqualToString:",  @"kCFErrorDomainCFNetwork"))
    {
      if ([v15 code] != 2
        && [v15 code] != 303
        && [v15 code] != 310
        && [v15 code] != 311)
      {
        goto LABEL_34;
      }
    }

    else if (objc_msgSend( (id)objc_msgSend(v15, "domain"),  "isEqualToString:",  @"NSSQLiteErrorDomain"))
    {
      if ([v15 code] != 266
        && [v15 code] != 3
        && [v15 code] != 1034
        && [v15 code] != 23
        && [v15 code] != 769)
      {
        goto LABEL_34;
      }
    }

    else
    {
      uint64_t v20 = (void *)[v15 domain];
      if (![v20 isEqualToString:*MEMORY[0x189607460]]
        || [v15 code] != 4099 && objc_msgSend(v15, "code") != 4097)
      {
        goto LABEL_34;
      }
    }

id __92__NSCloudKitMirroringDelegate__openTransactionWithLabel_assertionLabel_andExecuteWorkBlock___block_invoke( uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v3 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [v2 drain];

  return 0LL;
}

- (NSPersistentStoreResult)executeMirroringRequest:(uint64_t *)a3 error:
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSPersistentStoreResult);
    uint64_t v32 = 0LL;
    uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Asked to execute request: %@"];
    uint64_t v31 = a2;
    _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate executeMirroringRequest:error:]");
    objc_autoreleasePoolPop(v7);
    if ([a2 validateForUseWithStore:objc_loadWeak((id *)(v5 + 120)) error:&v32])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {

                        BOOL v17 = (void *)MEMORY[0x189607870];
                        uint64_t v18 = *MEMORY[0x189607460];
                        uint64_t v33 = *MEMORY[0x1896075F0];
                        BOOL v19 = (void *)NSString;
                        uint64_t v20 = (objc_class *)objc_opt_class();
                        uint64_t v21 = NSStringFromClass(v20);
                        uint64_t v22 = (objc_class *)objc_opt_class();
                        uint64_t v34 = [v19 stringWithFormat:@"Instances of '%@' are ambiguous and not understood by '%@', use one of the subclasses instead.", v21, NSStringFromClass(v22), v5, v31];
                        uint64_t v16 = objc_msgSend( v17,  "errorWithDomain:code:userInfo:",  v18,  134091,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1));
                        uint64_t v32 = v16;
                        if (v16)
                        {
LABEL_19:
                          if (a3)
                          {
                            uint64_t v6 = 0LL;
                            *a3 = v16;
                            return v6;
                          }

void __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: enqueuing request: %@"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11 && (uint64_t v12 = *(void *)(v11 + 8)) != 0) {
    uint64_t v13 = *(void **)(v12 + 88);
  }
  else {
    uint64_t v13 = 0LL;
  }
  id Weak = objc_loadWeak((id *)(v11 + 120));
  id v15 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v13, (uint64_t)Weak);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke_2;
  v16[3] = &unk_189EA7A38;
  v16[4] = v15;
  __int128 v17 = *(_OWORD *)(a1 + 32);
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v15, (uint64_t)v16);
}

void __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke_2(uint64_t a1)
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (!v2)
  {
    id v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x189607460];
    uint64_t v32 = *MEMORY[0x1896075F0];
    v33[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 48), "requestIdentifier")];
    uint64_t v17 = objc_msgSend( v15,  "errorWithDomain:code:userInfo:",  v16,  134407,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
    uint64_t v18 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v21 = v17;
LABEL_14:
    uint64_t v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v18,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v19,  v20,  0LL,  0LL,  v21);
    -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](*(void *)(a1 + 48), (uint64_t)v30);

    goto LABEL_15;
  }

  uint64_t v31 = 0LL;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 160);
  }
  else {
    uint64_t v4 = 0LL;
  }
  BOOL v5 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](v4, *(void *)(a1 + 48), &v31);
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
  if (!v5)
  {
    else {
      uint64_t v22 = __ckLoggingOverride;
    }
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to enqueue request: %@\n%@"];
    _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v6);
    uint64_t v18 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v21 = v31;
    goto LABEL_14;
  }

  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Enqueued request: %@"];
  _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke_2");
  objc_autoreleasePoolPop(v6);
  -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](*(void *)(a1 + 40), *(void **)(a1 + 48));
  -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](*(void **)(a1 + 40));
LABEL_15:
}

- (void)_performSetupRequest:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if ([a2 requestCompletionBlock])
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Setup request executed with a completion block that will never be called: %@"];
    _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = a2;
      _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Setup request executed with a completion block that will never be called: %@",  buf,  0xCu);
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke;
  v12[3] = &unk_189EAB0A8;
  v12[4] = a1;
  v12[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.setup",  (uint64_t)@"CoreData: CloudKit Setup",  (uint64_t)v12);
}

- (void)_performDelegateResetRequest:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a2 || !*(void *)(a2 + 80))
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Reset request was scheduled without a root cause error: %@"];
    _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, a2);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = a2;
      _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Reset request was scheduled without a root cause error: %@",  buf,  0xCu);
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__NSCloudKitMirroringDelegate__performDelegateResetRequest___block_invoke;
  v12[3] = &unk_189EAB0A8;
  v12[4] = a1;
  v12[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.setup.reset",  (uint64_t)@"CoreData: CloudKit Setup Reset",  (uint64_t)v12);
}

- (void)_performSchemaInitializationRequest:(uint64_t)a1
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke;
  v2[3] = &unk_189EAB0A8;
  v2[4] = a2;
  v2[5] = a1;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.schema.initialize",  (uint64_t)@"CoreData: CloudKit Initialize Schema",  (uint64_t)v2);
}

- (void)_performSerializationRequest:(uint64_t)a1
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke;
  v2[3] = &unk_189EAB0A8;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.serialization",  (uint64_t)@"CoreData: CloudKit Record Serialization",  (uint64_t)v2);
}

- (void)_performExportProgressRequest:(uint64_t)a1
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke;
  v2[3] = &unk_189EAB0A8;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.progress.export",  (uint64_t)@"CoreData: CloudKit Export Progress",  (uint64_t)v2);
}

- (void)_performAcceptShareInvitationsRequest:(uint64_t)a1
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke;
  v2[3] = &unk_189EAB0A8;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.share.accept",  (uint64_t)@"CoreData: CloudKit Share Accept Invitation",  (uint64_t)v2);
}

void __60__NSCloudKitMirroringDelegate__performDelegateResetRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 80);
    }
    else {
      uint64_t v4 = 0LL;
    }
    -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v2, v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v2, 0LL);
  uint64_t v5 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 168LL),  1LL,  0LL,  0LL);
  -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(void *)(a1 + 32), *(void **)(a1 + 40), v5);
}

- (uint64_t)_finishedRequest:(void *)a3 withResult:
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v7 = __ckLoggingOverride;
    }
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished request: %@ with result: %@"];
    _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate _finishedRequest:withResult:]");
    objc_autoreleasePoolPop(v6);
    -[NSCloudKitMirroringRequestManager requestFinished:](*(void *)(v5 + 160), a2);
    uint64_t v15 = [a3 error];
    if (a2) {
      uint64_t v16 = (void *)a2[9];
    }
    else {
      uint64_t v16 = 0LL;
    }
    id v17 = v16;
    uint64_t v18 = v17;
    if (v17)
    {
      [v17 finishWithError:v15];
      objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "progressProvider"), "publishActivity:", v18);
    }

    if (([a3 success] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v19 = (uint64_t)a2;
LABEL_13:
      -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](v19, (uint64_t)a3);
      return -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](v5);
    }

    uint64_t v20 = (void *)[a3 error];
    if (a3)
    {
      if ([a3 success] && v20)
      {
        uint64_t v21 = [NSString stringWithUTF8String:"handleErrorInResult passed a sucessful result (%@) with an illegal error object (%@)"];
        _NSCoreDataLog(17LL, v21, v22, v23, v24, v25, v26, v27, (uint64_t)a3);
        uint64_t v28 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412546;
        v52 = a3;
        __int16 v53 = 2112;
        v54 = v20;
        uint64_t v29 = "CoreData: handleErrorInResult passed a sucessful result (%@) with an illegal error object (%@)";
        uint64_t v30 = (os_log_s *)v28;
        uint32_t v31 = 22;
      }

      else
      {
        if (([a3 success] & 1) != 0
          || v20
          || (uint64_t v40 = [NSString stringWithUTF8String:"handleErrorInResult illegally passed a failed result (%@) with nil instead of an error on a failure condition"],  _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)a3),  v47 = __pflogFaultLog,  !os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
        {
LABEL_27:
          uint64_t v48 = [a3 request];
          v49 = (void *)[v20 domain];
          if ([v49 isEqualToString:*MEMORY[0x189607460]])
          {
            if ([v20 code] == 134407)
            {
              -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v5, v20);
LABEL_33:
              uint64_t v19 = v48;
              goto LABEL_13;
            }

            if ([v20 code] == 134406
              || [v20 code] == 134418
              || [v20 code] == 134419)
            {
              goto LABEL_33;
            }
          }

          else {
            -[NSCloudKitMirroringDelegate _requestEncounteredUnrecoverableError:withResult:](v5, v48, a3);
          }
          return -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](v5);
        }

        *(_DWORD *)buf = 138412290;
        v52 = a3;
        uint64_t v29 = "CoreData: handleErrorInResult illegally passed a failed result (%@) with nil instead of an error on a failure condition";
        uint64_t v30 = (os_log_s *)v47;
        uint32_t v31 = 12;
      }
    }

    else
    {
      uint64_t v32 = [NSString stringWithUTF8String:"handleErrorInResult illegally passed nil instead of a result"];
      _NSCoreDataLog(17LL, v32, v33, v34, v35, v36, v37, v38, v50);
      uint64_t v39 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      uint64_t v29 = "CoreData: handleErrorInResult illegally passed nil instead of a result";
      uint64_t v30 = (os_log_s *)v39;
      uint32_t v31 = 2;
    }

    _os_log_fault_impl(&dword_186681000, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_27;
  }

  return result;
}

void __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke(uint64_t a1)
{
  uint64_t v158 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120LL));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 8);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v142 = (id)[v4 progressProvider];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 89))
  {
    uint64_t v20 = [*(id *)(v5 + 224) usableVoucherForEventType:0];
    if (v20)
    {
      uint64_t v147 = v20;
      objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "options"),  "setVouchers:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v147, 1));
    }

    uint64_t v21 = -[PFCloudKitSetupAssistant initWithSetupRequest:mirroringOptions:observedStore:]( objc_alloc(&OBJC_CLASS___PFCloudKitSetupAssistant),  "initWithSetupRequest:mirroringOptions:observedStore:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 8LL),  WeakRetained);
    v143 = 0LL;
    int v22 = -[PFCloudKitSetupAssistant _initializeCloudKitForObservedStore:andNoteMetadataInitialization:]( (uint64_t)v21,  &v143,  (_BYTE *)(*(void *)(a1 + 32) + 144LL));
    if (v21) {
      setupEvent = v21->_setupEvent;
    }
    else {
      setupEvent = 0LL;
    }
    uint64_t v19 = setupEvent;
    if (v22)
    {
      uint64_t v24 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v25 = __ckLoggingOverride;
      }
      uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Successfully set up CloudKit integration for store (%@): %@"];
      [WeakRetained identifier];
      _NSCoreDataLog( v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
      objc_autoreleasePoolPop(v24);
      uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 56LL);
      if (v33)
      {

        *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
      }

      if (v21) {
        database = v21->_database;
      }
      else {
        database = 0LL;
      }
      *(void *)(*(void *)(a1 + 32) + 56LL) = database;
      uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 40LL);
      if (v35)
      {

        *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
      }

      if (v21) {
        databaseSubscription = v21->_databaseSubscription;
      }
      else {
        databaseSubscription = 0LL;
      }
      *(void *)(*(void *)(a1 + 32) + 40LL) = databaseSubscription;
      uint64_t v37 = *(void **)(*(void *)(a1 + 32) + 48LL);
      if (v37)
      {

        *(void *)(*(void *)(a1 + 32) + 48LL) = 0LL;
      }

      if (v21) {
        container = v21->_container;
      }
      else {
        container = 0LL;
      }
      *(void *)(*(void *)(a1 + 32) + 48LL) = container;
      uint64_t v39 = *(void **)(*(void *)(a1 + 32) + 216LL);
      if (v39)
      {

        *(void *)(*(void *)(a1 + 32) + 216LL) = 0LL;
      }

      if (v21) {
        currentUserRecordID = v21->_currentUserRecordID;
      }
      else {
        currentUserRecordID = 0LL;
      }
      *(void *)(*(void *)(a1 + 32) + 152LL) = currentUserRecordID;
      *(void *)(*(void *)(a1 + 32) + 96LL) = -[PFCloudKitExporterOptions initWithDatabase:options:]( objc_alloc(&OBJC_CLASS___PFCloudKitExporterOptions),  "initWithDatabase:options:",  *(void *)(*(void *)(a1 + 32) + 56LL),  *(void *)(*(void *)(a1 + 32) + 8LL));
      uint64_t v41 = *(void *)(a1 + 32);
      if (*(void *)(v41 + 152)
        || (uint64_t v42 = [*(id *)(v41 + 8) databaseScope], v41 = *(void *)(a1 + 32), v42 == 1))
      {
        *(_BYTE *)(v41 + 89) = 1;
        goto LABEL_39;
      }

      uint64_t v114 = *(void *)(v41 + 8);
      if (v114)
      {
        v115 = (_BYTE *)(v41 + 89);
        if (*(_BYTE *)(v114 + 12))
        {
          _BYTE *v115 = 1;
LABEL_39:
          uint64_t v43 = *(void *)(a1 + 32);
          if (*(_BYTE *)(v43 + 89))
          {
            uint64_t v44 = *(void **)(v43 + 80);
            if (v44)
            {

              *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
              uint64_t v43 = *(void *)(a1 + 32);
            }

            char context = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "options"), "fromNotification");
            if (v43)
            {
              uint64_t v45 = (void *)MEMORY[0x186E3E5D8]();
              id Weak = objc_loadWeak((id *)(v43 + 128));
              -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](v43);
              objc_initWeak(location, (id)v43);
              if ([*(id *)(v43 + 8) automaticallyScheduleImportAndExportOperations])
              {
                if (*(void *)(v43 + 152))
                {
                  objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v43,  sel_managedObjectContextSaved_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  Weak);
                  objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v43,  sel_remoteStoreDidChange_,  @"NSPersistentStoreRemoteChangeNotification",  Weak);
                }

                uint64_t v47 = *(PFApplicationStateMonitor **)(v43 + 40);
                if (v47 && !*(_BYTE *)(v43 + 145))
                {
                  uint64_t v48 = *(void **)(v43 + 72);
                  uint64_t v138 = -[PFApplicationStateMonitor subscriptionID](v47, "subscriptionID");
                  uint64_t v49 = *(void *)(v43 + 56);
                  v148[0] = MEMORY[0x1895F87A8];
                  v148[1] = 3221225472LL;
                  v148[2] = __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke;
                  v148[3] = &unk_189EAB058;
                  objc_copyWeak(&v149, location);
                  [v48 registerForSubscriptionWithID:v138 inDatabase:v49 handler:v148];
                  *(_BYTE *)(v43 + 145) = 1;
                  objc_destroyWeak(&v149);
                }

                if (!*(void *)(v43 + 208))
                {
                  uint64_t v47 = objc_alloc_init(&OBJC_CLASS___PFApplicationStateMonitor);
                  *(void *)(v43 + 208) = v47;
                  if (v47) {
                    uint64_t v47 = (PFApplicationStateMonitor *)objc_storeWeak((id *)&v47->_delegate, (id)v43);
                  }
                }

                if (*(void *)(v43 + 152))
                {
                  uint64_t v50 = (void *)MEMORY[0x186E3E5D8](v47);
                  unint64_t v51 = __ckLoggingOverride;
                  uint64_t v52 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Scheduling post-setup export"];
                  if (v51 >= 0x10) {
                    uint64_t v59 = 16LL;
                  }
                  else {
                    uint64_t v59 = v51;
                  }
                  _NSCoreDataLog( v59,  v52,  v53,  v54,  v55,  v56,  v57,  v58,  (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]");
                  objc_autoreleasePoolPop(v50);
                  -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](v43, 0LL);
                }

                if (objc_msgSend((id)objc_msgSend(*(id *)(v43 + 48), "containerID"), "environment") == 2)
                {
                  *(void *)buf = MEMORY[0x1895F87A8];
                  uint64_t v151 = 3221225472LL;
                  v152 = __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke_2;
                  v153 = &unk_189EAB080;
                  objc_copyWeak(&v155, location);
                  uint64_t v154 = v43;
                  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v43,  (uint64_t)@"com.apple.coredata.cloudkit.setup.operations",  (uint64_t)@"CoreData: CloudKit Sandbox Operations",  (uint64_t)buf);
                  objc_destroyWeak(&v155);
                }

                else
                {
                  *(void *)buf = MEMORY[0x1895F87A8];
                  uint64_t v151 = 3221225472LL;
                  v152 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
                  v153 = &unk_189EAB2D8;
                  char v156 = context;
                  __int16 v157 = 0;
                  uint64_t v154 = v43;
                  id v155 = 0LL;
                  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v43,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)buf);
                }
              }

              objc_destroyWeak(location);
              objc_autoreleasePoolPop(v45);
            }
          }

          goto LABEL_92;
        }
      }

      else
      {
        v115 = (_BYTE *)(v41 + 89);
      }

      _BYTE *v115 = 0;
      v134 = *(void **)(*(void *)(a1 + 32) + 80LL);
      if (v134)
      {

        *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
      }

      id v135 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v145 = *MEMORY[0x1896075E8];
      v146 = @"Failed to initialize because there is no user signed in to this device.";
      uint64_t v136 = [MEMORY[0x189603F68] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      *(void *)(*(void *)(a1 + 32) + 80) = [v135 initWithDomain:*MEMORY[0x189607460] code:134400 userInfo:v136];
      -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](*(void *)(a1 + 32));
      if (*(_BYTE *)(*(void *)(a1 + 32) + 145LL))
      {
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 72),  "unregisterForSubscriptionWithID:inDatabase:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "subscriptionID"),  *(void *)(*(void *)(a1 + 32) + 56));
        *(_BYTE *)(*(void *)(a1 + 32) + 145LL) = 0;
      }

      goto LABEL_39;
    }

    v69 = *(void **)(*(void *)(a1 + 32) + 80LL);
    if (v69)
    {

      *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
    }

    *(void *)(*(void *)(a1 + 32) + 80LL) = v143;
    *(_BYTE *)(*(void *)(a1 + 32) + 89LL) = 0;
    v70 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v71 = __ckLoggingOverride != 0;
    uint64_t v72 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to set up CloudKit integration for store: %@\n%@"];
    _NSCoreDataLog( v71,  v72,  v73,  v74,  v75,  v76,  v77,  v78,  (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
    objc_autoreleasePoolPop(v70);
    if (!v143)
    {
      uint64_t v103 = [NSString stringWithUTF8String:"_initializeCloudKitForObservedStore failed but did not return an error."];
      _NSCoreDataLog(17LL, v103, v104, v105, v106, v107, v108, v109, v137);
      v110 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v110,  OS_LOG_TYPE_FAULT,  "CoreData: _initializeCloudKitForObservedStore failed but did not return an error.",  buf,  2u);
      }

      goto LABEL_92;
    }

    if ((-[NSCloudKitMirroringDelegate recoverFromError:](*(void *)(a1 + 32), (uint64_t)v143) & 1) == 0)
    {
      if (v21)
      {
        v111 = v21->_container;
        if (v111)
        {
          uint64_t v112 = *(void *)(a1 + 32);
          v113 = *(CKContainer **)(v112 + 48);
          if (v113 != v111)
          {

            *(void *)(*(void *)(a1 + 32) + 48LL) = v21->_container;
            uint64_t v112 = *(void *)(a1 + 32);
          }

          -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](v112);
        }
      }

      goto LABEL_92;
    }

    if (-[NSCloudKitMirroringDelegate shouldAttemptSetupRecoveryFromError:viaPush:](*(void *)(a1 + 32), v143, 0))
    {
      uint64_t v79 = *(void *)(a1 + 32);
      v80 = *(CKContainer **)(v79 + 48);
      if (v21)
      {
        if (v80 == v21->_container) {
          goto LABEL_70;
        }

        v81 = v21->_container;
      }

      else
      {
        if (!v80)
        {
LABEL_70:
          v82 = v143;
          if (!v143)
          {
            uint64_t v83 = [NSString stringWithUTF8String:"Expected a non-nil error to schedule a setup activity from."];
            _NSCoreDataLog(17LL, v83, v84, v85, v86, v87, v88, v89, v137);
            v90 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(location[0]) = 0;
              _os_log_fault_impl( &dword_186681000,  v90,  OS_LOG_TYPE_FAULT,  "CoreData: Expected a non-nil error to schedule a setup activity from.",  (uint8_t *)location,  2u);
            }
          }

          [*(id *)(v79 + 224) expireVouchersForEventType:0];
          if ([*(id *)(v79 + 8) automaticallyScheduleImportAndExportOperations])
          {
            contexta = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v91 = __ckLoggingOverride;
            }
            uint64_t v92 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Submitting setup activity as recovery for %@"];
            objc_loadWeak((id *)(v79 + 120));
            _NSCoreDataLog( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleSetupActivityFromError:]");
            objc_autoreleasePoolPop(contexta);
            contextb = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:]( v79,  *(void *)(v79 + 192),  0LL);
            v99 = (void *)-[__CFString userInfo](v82, "userInfo");
            v100 = (void *)[v99 objectForKey:getCloudKitCKErrorRetryAfterKey[0]()];
            [v100 doubleValue];
            if (v101 > 0.0)
            {
              v102 = (void *)MEMORY[0x189603F50];
              [v100 doubleValue];
              objc_msgSend(contextb, "setEarliestStartDate:", objc_msgSend(v102, "dateWithTimeIntervalSinceNow:"));
            }

            [*(id *)(v79 + 64) submitActivity:contextb];
            -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v79, v82);
          }

          goto LABEL_92;
        }

        v81 = 0LL;
      }

      *(void *)(*(void *)(a1 + 32) + 48LL) = v81;
      uint64_t v79 = *(void *)(a1 + 32);
      if (v79) {
        goto LABEL_70;
      }
    }

- (uint64_t)recoverFromError:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      uint64_t v4 = [NSString stringWithUTF8String:"recoverFromError illegally passed nil instead of an error on a failure condition"];
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v26);
      uint64_t v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: recoverFromError illegally passed nil instead of an error on a failure condition",  buf,  2u);
      }
    }

    *(void *)buf = 0LL;
    uint64_t v29 = buf;
    uint64_t v30 = 0x2020000000LL;
    char v31 = 0;
    uint64_t v12 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v13 = __ckLoggingOverride;
    uint64_t v14 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Attempting recovery from error: %@"];
    _NSCoreDataLog( v13 != 0,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"-[NSCloudKitMirroringDelegate recoverFromError:]");
    objc_autoreleasePoolPop(v12);
    uint64_t v21 = *(void *)(v2 + 8);
    if (v21) {
      int v22 = *(void **)(v21 + 88);
    }
    else {
      int v22 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v2 + 120));
    id v24 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v22, (uint64_t)Weak);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __48__NSCloudKitMirroringDelegate_recoverFromError___block_invoke;
    v27[3] = &unk_189EA8700;
    v27[4] = v24;
    id v27[5] = a2;
    v27[6] = v2;
    v27[7] = buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v24, (uint64_t)v27);

    uint64_t v2 = v29[24] != 0;
    _Block_object_dispose(buf, 8);
  }

  return v2;
}

void __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 && (uint64_t v7 = *(void *)(v6 + 8)) != 0) {
      uint64_t v8 = *(void **)(v7 + 88);
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v8,  (uint64_t)WeakRetained);
    uint64_t v19 = 0LL;
    uint64_t v10 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  *(void *)(a1 + 40),  (uint64_t)v9,  &v19);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        uint64_t v12 = *(void **)(v11 + 8);
      }
      else {
        uint64_t v12 = 0LL;
      }
      objc_msgSend((id)objc_msgSend(v12, "progressProvider"), "eventUpdated:", v10);
      uint64_t v13 = -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterOptions),  "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:",  *(void *)(*(void *)(a1 + 32) + 8LL),  v9,  +[PFCloudKitSerializer assetStorageDirectoryURLForStore:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  WeakRetained),  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 56LL));
      uint64_t v14 = -[PFCloudKitImporter initWithOptions:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporter),  "initWithOptions:request:",  v13,  *(void *)(a1 + 40));

      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke_2;
      v18[3] = &unk_189EA9758;
      v18[4] = v14;
      v18[5] = a2;
      uint64_t v15 = *(void *)(a1 + 32);
      v18[6] = v9;
      v18[7] = v15;
      -[PFCloudKitImporter importIfNecessaryWithCompletion:]((uint64_t)v14, (uint64_t)v18);
    }

    else
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v16,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 168LL),  0LL,  0LL,  v19);
      -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(void *)(a1 + 32), v17);

      uint64_t v14 = 0LL;
    }
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(void **)(a1 + 40));
  }

void __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v18 = 0LL;
  uint64_t v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  (uint64_t)a2,  *(void *)(a1 + 48),  &v18);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 8);
    }
    else {
      uint64_t v8 = 0LL;
    }
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }

  else
  {
    id v9 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v10 = __ckLoggingOverride;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to finish import event: %@"];
    _NSCoreDataLog( v10 != 0,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[NSCloudKitMirroringDelegate _performImportWithRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(void *)(a1 + 56), a2);
}

- (uint64_t)_importFinishedWithResult:(uint64_t)result importer:(void *)a2
{
  v18[3] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = (void *)MEMORY[0x189603FC8];
    v17[0] = @"success";
    v18[0] = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a2, "success"));
    v17[1] = @"madeChanges";
    v17[2] = @"result";
    v18[1] = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a2, "madeChanges"));
    v18[2] = a2;
    id v5 = (void *)objc_msgSend( v4,  "dictionaryWithDictionary:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    if ([a2 success])
    {
      if ([*(id *)(v3 + 8) automaticallyScheduleImportAndExportOperations])
      {
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
        v15[3] = &unk_189EAB2D8;
        v15[4] = v3;
        v16[0] = 0LL;
        *(_DWORD *)((char *)v16 + 7) = 0;
        -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v3,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v15);
      }
    }

    else
    {
      uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v7 = __ckLoggingOverride != 0;
      uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Import failed with error:\n%@"];
      [a2 error];
      _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:]");
      objc_autoreleasePoolPop(v6);
    }

    if ([a2 error]) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a2, "error"), @"error");
    }
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v3, (void *)[a2 request], a2);
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:userInfo:",  @"PFCloudKitDidImportNotificationName",  v3,  v5);
  }

  return result;
}

- (void)_requestAbortedNotInitialized:(uint64_t)a1
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v4 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Never successfully initialized and cannot execute request '%@' due to error: %@"];
    uint64_t v18 = *(void *)(a1 + 80);
    _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:]");
    objc_autoreleasePoolPop(v4);
    uint64_t v13 = [NSString stringWithFormat:@"Request '%@' was aborted because the mirroring delegate never successfully initialized due to error: %@", objc_msgSend(a2, "requestIdentifier"), *(void *)(a1 + 80), a1, a2, v18];
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v15 = *(void *)(a1 + 168);
    uint64_t v16 = *MEMORY[0x189607460];
    uint64_t v19 = *MEMORY[0x1896075F0];
    v20[0] = v13;
    uint64_t v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v14,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a2,  v15,  0,  0,  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v16,  134406,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1, a2, v17);
  }

void __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke( uint64_t a1,  void (*a2)(void, void))
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 89))
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(void **)(a1 + 40));
    return;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6 || !*(void *)(v6 + 152))
  {
    uint64_t v7 = [NSString stringWithUTF8String:"%@: Illegal attempt to export without an account: %@ - %@"];
    uint64_t v8 = *(void *)(a1 + 32);
    [WeakRetained URL];
    _NSCoreDataLog(17LL, v7, v9, v10, v11, v12, v13, v14, v8);
    uint64_t v15 = (os_log_s *)__pflogFaultLog;
    BOOL v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v16)
    {
      uint64_t v28 = [WeakRetained URL];
      uint64_t v29 = *(void *)(a1 + 32);
      if (v29) {
        uint64_t v29 = *(void *)(v29 + 8);
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v32 = 2112;
      uint64_t v33 = v28;
      __int16 v34 = 2112;
      uint64_t v35 = v29;
      _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: %@: Illegal attempt to export without an account: %@ - %@",  buf,  0x20u);
      uint64_t v6 = *(void *)(a1 + 32);
      if (!v6) {
        goto LABEL_20;
      }
    }

    else if (!v6)
    {
LABEL_20:
      uint64_t v18 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v17 = *(void *)(v6 + 8);
  if (!v17) {
    goto LABEL_20;
  }
  uint64_t v18 = *(void **)(v17 + 88);
LABEL_8:
  id v19 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v18,  (uint64_t)WeakRetained);

  *(void *)buf = 0LL;
  uint64_t v20 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  *(void *)(a1 + 40),  (uint64_t)v19,  buf);
  if (v20)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      int v22 = *(void **)(v21 + 8);
    }
    else {
      int v22 = 0LL;
    }
    objc_msgSend((id)objc_msgSend(v22, "progressProvider"), "eventUpdated:", v20);
    uint64_t v23 = -[PFCloudKitExporter initWithOptions:request:monitor:workQueue:]( objc_alloc(&OBJC_CLASS___PFCloudKitExporter),  "initWithOptions:request:monitor:workQueue:",  *(void *)(*(void *)(a1 + 32) + 96LL),  *(void *)(a1 + 40),  v19,  *(void *)(*(void *)(a1 + 32) + 32LL));
    id v24 = v23;
    if (v23) {
      objc_storeWeak((id *)&v23->_delegate, *(id *)(a1 + 32));
    }
    v30[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v30[1] = (void (*)(void, void))3221225472LL;
    v30[2] = (void (*)(void, void))__57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke_286;
    v30[3] = (void (*)(void, void))&unk_189EA9758;
    v30[4] = a2;
    v30[5] = (void (*)(void, void))v24;
    uint64_t v25 = *(void (**)(void, void))(a1 + 32);
    v30[6] = (void (*)(void, void))v19;
    v30[7] = v25;
    -[PFCloudKitExporter exportIfNecessaryWithCompletion:](v24, v30);

    id v19 = 0LL;
  }

  else
  {
    uint64_t v26 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v27 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v26,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 168LL),  0LL,  0LL,  *(void *)buf);
    -[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:](*(void *)(a1 + 32), v27);
  }
}

void __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke_286(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v18 = 0LL;
  uint64_t v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  (uint64_t)a2,  *(void *)(a1 + 48),  &v18);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 8);
    }
    else {
      uint64_t v8 = 0LL;
    }
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }

  else
  {
    uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v10 = __ckLoggingOverride;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to finish export event: %@"];
    _NSCoreDataLog( v10 != 0,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[NSCloudKitMirroringDelegate _performExportWithRequest:]_block_invoke");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:](*(void *)(a1 + 56), a2);
}

- (uint64_t)_exportFinishedWithResult:(uint64_t)result exporter:(void *)a2
{
  v24[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    int v4 = [a2 success];
    id v5 = (void *)MEMORY[0x186E3E5D8]();
    if (v4)
    {
      else {
        uint64_t v6 = __ckLoggingOverride;
      }
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished export: %@"];
      _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:]");
    }

    else
    {
      BOOL v14 = __ckLoggingOverride != 0;
      uint64_t v15 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Export failed with error:\n%@"];
      [a2 error];
      _NSCoreDataLog( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:]");
    }

    objc_autoreleasePoolPop(v5);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v3, (void *)[a2 request], a2);
    int v22 = (void *)[MEMORY[0x189607958] defaultCenter];
    v23[0] = @"madeChanges";
    v23[1] = @"result";
    v24[0] = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a2, "madeChanges"));
    v24[1] = a2;
    return objc_msgSend( v22,  "postNotificationName:object:userInfo:",  @"PFCloudKitDidExportNotificationName",  v3,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  }

  return result;
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    if (v3) {
      int v4 = *(void **)(v3 + 88);
    }
    else {
      int v4 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v2 + 120));
    id v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 80);
    }
    else {
      uint64_t v8 = 0LL;
    }
    if ([v8 count])
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_2;
      v22[3] = &unk_189EA7A38;
      v22[4] = v6;
      __int128 v23 = *(_OWORD *)(a1 + 32);
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v22);
    }

    else
    {
      uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v10 = __ckLoggingOverride;
      uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Asked to schedule a zone reset operation without a zoneID: %@"];
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      _NSCoreDataLog( v10 != 0,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke");
      objc_autoreleasePoolPop(v9);
      uint64_t v18 = (void *)MEMORY[0x189607870];
      uint64_t v24 = *MEMORY[0x1896075F0];
      v25[0] = [NSString stringWithFormat:@"The mirroring delegate could not complete request '%@' because it does not have a zone.", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"), 1644, v20, v21];
      uint64_t v19 = [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:]( *(void *)(a1 + 32),  (void *)[v18 errorWithDomain:*MEMORY[0x189607460] code:134406 userInfo:v19]);
      -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    }
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(void **)(a1 + 40));
  }

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_2(uint64_t *a1)
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  uint64_t v54 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  uint64_t v56 = a1;
  if (v54)
  {
    uint64_t v65 = 0LL;
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void *)(v2 + 8);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 96);
    }
    else {
      uint64_t v4 = 0LL;
    }
    uint64_t v5 = a1[6];
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 80);
    }
    else {
      uint64_t v6 = 0LL;
    }
    uint64_t v7 = a1[4];
    uint64_t v8 = [*(id *)(v2 + 56) databaseScope];
    if (v4
      && (uint64_t v8 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]( v4,  (uint64_t)v54,  v7,  9LL,  v6,  v8,  0LL,  &v65),  (v8 & 1) != 0))
    {
      id v55 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      uint64_t v9 = a1[6];
      if (v9) {
        uint64_t v10 = *(void **)(v9 + 80);
      }
      else {
        uint64_t v10 = 0LL;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v68 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v62;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v62 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            uint64_t v15 = (void *)[v14 ownerName];
            if ([v15 isEqualToString:getCloudKitCKCurrentUserDefaultName()])
            {
              [v55 addObject:v14];
            }

            else
            {
              uint64_t v16 = (void *)MEMORY[0x186E3E5D8]();
              unint64_t v17 = __ckLoggingOverride;
              uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Skipping delete of zone because it's not owned by the current user: %@"];
              if (v17 >= 3) {
                uint64_t v25 = 3LL;
              }
              else {
                uint64_t v25 = v17;
              }
              _NSCoreDataLog( v25,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke_2");
              objc_autoreleasePoolPop(v16);
            }
          }

          uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v68 count:16];
        }

        while (v11);
      }

      if ([v55 count])
      {
        uint64_t v26 = (void *)[objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]()) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v55];
        if ([(id)v56[6] options]) {
          -[NSCloudKitMirroringRequestOptions applyToOperation:]([(id)v56[6] options], v26);
        }
        [v26 setMarkZonesAsUserPurged:1];
        objc_initWeak(&location, (id)v56[5]);
        v57[0] = MEMORY[0x1895F87A8];
        v57[1] = 3221225472LL;
        v57[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_3;
        v57[3] = &unk_189EAB0D0;
        objc_copyWeak(&v59, &location);
        int8x16_t v58 = vextq_s8(*(int8x16_t *)(v56 + 5), *(int8x16_t *)(v56 + 5), 8uLL);
        [v26 setModifyRecordZonesCompletionBlock:v57];
        [*(id *)(v56[5] + 56) addOperation:v26];

        objc_destroyWeak(&v59);
        objc_destroyWeak(&location);
      }

      else
      {
        unint64_t v51 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v56[6],  *(void *)(v56[5] + 168),  1LL,  1LL,  0LL);
        -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v56[5], (void *)v56[6], v51);
      }
    }

    else
    {
      __int16 v32 = (void *)MEMORY[0x186E3E5D8](v8);
      uint64_t v33 = __ckLoggingOverride;
      uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Zone reset request failed: %@\nFailed to clear metadata from store: %@\n%@"];
      uint64_t v53 = v65;
      uint64_t v52 = a1[6];
      _NSCoreDataLog( v33 != 0,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke_2");
      objc_autoreleasePoolPop(v32);
      uint64_t v41 = (void *)NSString;
      uint64_t v42 = [(id)a1[6] requestIdentifier];
      uint64_t v43 = [v41 stringWithFormat:@"Request '%@' was aborted because the mirroring delegate failed to reset the local store's metadata: %@", v42, v65, v52, v54, v53];
      id v44 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v44 setObject:v43 forKey:*MEMORY[0x1896075F0]];
      if (v65) {
        [v44 setObject:v65 forKey:*MEMORY[0x189607798]];
      }
      uint64_t v45 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v46 = a1[6];
      uint64_t v47 = *(void *)(a1[5] + 168);
      uint64_t v48 = (void *)MEMORY[0x189607870];
      id v49 = (id)[v44 copy];
      uint64_t v50 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v45,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v46,  v47,  0,  0,  [v48 errorWithDomain:*MEMORY[0x189607460] code:134406 userInfo:v49]);
      -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[5], (void *)a1[6], v50);
    }
  }

  else
  {
    uint64_t v27 = (void *)MEMORY[0x189607870];
    uint64_t v66 = *MEMORY[0x1896075F0];
    uint64_t v29 = (void *)a1[6];
    uint64_t v28 = (void **)(a1 + 6);
    uint64_t v67 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v29, "requestIdentifier")];
    uint64_t v30 = [MEMORY[0x189603F68] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    char v31 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( [NSCloudKitMirroringResult alloc],  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *v28,  *(void *)(v56[5] + 168),  0,  0,  [v27 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v30]);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v56[5], *v28, v31);
  }
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[4];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_4;
    v10[3] = &unk_189EA8980;
    v10[4] = a4;
    __int128 v11 = *(_OWORD *)(a1 + 32);
    uint64_t v12 = a3;
    dispatch_async(v9, v10);
  }
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_4(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1[4])
  {
    uint64_t v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a1[5],  *(void *)(a1[6] + 168LL),  0LL,  0LL,  a1[4]);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[6], (void *)a1[5], v2);
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v3 = (void *)a1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = a1[5];
          if (v7) {
            uint64_t v8 = *(void **)(v7 + 80);
          }
          else {
            uint64_t v8 = 0LL;
          }
          if ([v8 containsObject:*(void *)(*((void *)&v11 + 1) + 8 * v6)])
          {
            uint64_t v10 = 1LL;
            goto LABEL_17;
          }

          ++v6;
        }

        while (v4 != v6);
        uint64_t v9 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v4 = v9;
      }

      while (v9);
    }

    uint64_t v10 = 0LL;
LABEL_17:
    uint64_t v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a1[5],  *(void *)(a1[6] + 168LL),  1LL,  v10,  0LL);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[6], (void *)a1[5], v2);
  }
}

void __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 && (uint64_t v7 = *(void *)(v6 + 8)) != 0) {
      uint64_t v8 = *(void **)(v7 + 88);
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v8,  (uint64_t)WeakRetained);
    uint64_t v20 = 0LL;
    uint64_t v10 = +[NSCKEvent beginEventForRequest:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  *(void *)(a1 + 40),  (uint64_t)v9,  &v20);
    if (v10)
    {
      __int128 v11 = (void *)v10;
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        __int128 v13 = *(void **)(v12 + 8);
      }
      else {
        __int128 v13 = 0LL;
      }
      objc_msgSend((id)objc_msgSend(v13, "progressProvider"), "eventUpdated:", v11);
      __int128 v14 = -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporterOptions),  "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:",  *(void *)(*(void *)(a1 + 32) + 8LL),  v9,  +[PFCloudKitSerializer assetStorageDirectoryURLForStore:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  WeakRetained),  *(void *)(*(void *)(a1 + 32) + 32LL),  *(void *)(*(void *)(a1 + 32) + 56LL));
      uint64_t v15 = -[PFCloudKitImporter initWithOptions:request:]( objc_alloc(&OBJC_CLASS___PFCloudKitImporter),  "initWithOptions:request:",  v14,  *(void *)(a1 + 40));

      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke_2;
      v19[3] = &unk_189EA9758;
      v19[4] = v15;
      v19[5] = a2;
      uint64_t v16 = *(void *)(a1 + 32);
      v19[6] = v9;
      v19[7] = v16;
      -[PFCloudKitImporter importIfNecessaryWithCompletion:]((uint64_t)v15, (uint64_t)v19);
    }

    else
    {
      unint64_t v17 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v17,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 168LL),  0LL,  0LL,  v20);
      -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(void *)(a1 + 32), v18);

      uint64_t v15 = 0LL;
      __int128 v11 = 0LL;
    }
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(void **)(a1 + 40));
  }

void __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v18 = 0LL;
  uint64_t v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  (uint64_t)a2,  *(void *)(a1 + 48),  &v18);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 8);
    }
    else {
      uint64_t v8 = 0LL;
    }
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }

  else
  {
    id v9 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v10 = __ckLoggingOverride;
    uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to finish import event: %@"];
    _NSCoreDataLog( v10 != 0,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[NSCloudKitMirroringDelegate _performFetchRecordsRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(void *)(a1 + 56), a2);
}

void __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    id v3 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  [*(id *)(v2 + 8) databaseScope]);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4 && (uint64_t v5 = *(void *)(v4 + 8)) != 0) {
      uint64_t v6 = *(void **)(v5 + 88);
    }
    else {
      uint64_t v6 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v4 + 120));
    id v8 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v6, (uint64_t)Weak);
    v20[0] = 0LL;
    v20[1] = v20;
    void v20[2] = 0x2020000000LL;
    char v21 = 0;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3052000000LL;
    uint64_t v17 = __Block_byref_object_copy__39;
    uint64_t v18 = __Block_byref_object_dispose__39;
    uint64_t v19 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke_317;
    v9[3] = &unk_189EA8618;
    v9[4] = v8;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    id v11 = v3;
    uint64_t v12 = v20;
    uint64_t v13 = &v14;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v8, (uint64_t)v9);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  (void *)v15[5]);

    void v15[5] = 0LL;
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(v20, 8);
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(void **)(a1 + 40));
  }

void __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke_317(uint64_t a1)
{
  v43[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (!v2)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 168LL);
    int8x16_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x189607460];
    uint64_t v41 = *MEMORY[0x1896075F0];
    uint64_t v42 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v8, "requestIdentifier")];
    uint64_t v12 = objc_msgSend( v10,  "errorWithDomain:code:userInfo:",  v11,  134407,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    uint64_t v13 = v7;
    uint64_t v14 = v8;
    uint64_t v15 = v9;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_12;
  }

  uint64_t v40 = 0LL;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectIDsToReset"), "count");
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!v4)
  {
    uint64_t v5 = 0LL;
    if (v3) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v18 = *(void *)(a1 + 32);
    v43[0] = *(void *)(a1 + 56);
    uint64_t v19 = [MEMORY[0x189603F18] arrayWithObjects:v43 count:1];
    uint64_t v20 = *(void *)(a1 + 48);
    if (v20) {
      char v21 = *(void **)(v20 + 56);
    }
    else {
      char v21 = 0LL;
    }
    uint64_t v22 = [v21 databaseScope];
    if (v5) {
      BOOL v6 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]( v5,  (uint64_t)v2,  v18,  238LL,  v19,  v22,  0LL,  &v40);
    }
    else {
      BOOL v6 = 0;
    }
    goto LABEL_11;
  }

  uint64_t v5 = *(void *)(v4 + 96);
  if (!v3) {
    goto LABEL_7;
  }
LABEL_4:
  BOOL v6 = -[PFCloudKitMetadataPurger purgeMetadataMatchingObjectIDs:inRequest:inStore:withMonitor:error:]( v5,  [*(id *)(a1 + 40) objectIDsToReset],  *(void *)(a1 + 40),  (uint64_t)v2,  *(void *)(a1 + 32),  &v40);
LABEL_11:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v6;
  uint64_t v13 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 168LL);
  uint64_t v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  uint64_t v12 = v40;
  uint64_t v17 = v16;
LABEL_12:
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v13,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v14,  v15,  v16,  v17,  v12);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    uint64_t v23 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v24 = __ckLoggingOverride;
    }
    uint64_t v25 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Purged cloudkit metadata from store: %@\nResult: %@"];
    _NSCoreDataLog( v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)"-[NSCloudKitMirroringDelegate _performMetadataResetRequest:]_block_invoke");
    goto LABEL_19;
  }

  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "error"), "code") != 134407)
  {
    uint64_t v23 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v32 = __ckLoggingOverride != 0;
    uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purge cloudkit metadata from store: %@\n%@"];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) error];
    _NSCoreDataLog( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"-[NSCloudKitMirroringDelegate _performMetadataResetRequest:]_block_invoke");
LABEL_19:
    objc_autoreleasePoolPop(v23);
  }
}

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 88);
    }
    else {
      uint64_t v4 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v2 + 120));
    id v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000LL;
    uint64_t v13 = __Block_byref_object_copy__39;
    uint64_t v14 = __Block_byref_object_dispose__39;
    uint64_t v15 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_2;
    v7[3] = &unk_189EA8908;
    v7[4] = v6;
    __int128 v8 = *(_OWORD *)(a1 + 32);
    uint64_t v9 = &v10;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v7);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  (void *)v11[5]);

    v11[5] = 0LL;
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(void **)(a1 + 40));
  }

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_2(uint64_t a1)
{
  v30[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 1;
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3052000000LL;
    uint64_t v22 = __Block_byref_object_copy__39;
    uint64_t v23 = __Block_byref_object_dispose__39;
    uint64_t v24 = 0LL;
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_3;
    v12[3] = &unk_189EA9560;
    __int128 v13 = *(_OWORD *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = v4;
    id v16 = v3;
    uint64_t v17 = &v19;
    uint64_t v18 = &v25;
    -[NSManagedObjectContext performBlockAndWait:](v4, "performBlockAndWait:", v12);

    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequestResult);
    if (*((_BYTE *)v26 + 24)) {
      id v6 = v3;
    }
    else {
      id v6 = 0LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = -[NSCloudKitMirroringDelegateSerializationRequestResult initWithRequest:storeIdentifier:serializedObjects:error:]( v5,  "initWithRequest:storeIdentifier:serializedObjects:error:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 40) + 168LL),  v6,  v20[5]);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }

  else
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    __int128 v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v29 = *MEMORY[0x1896075F0];
    v30[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v8, "requestIdentifier")];
    uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v7,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v8,  v9,  0,  0,  [v10 errorWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v11]);
  }
}

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___PFCloudKitMetadataCache);
  id v3 = objc_alloc(&OBJC_CLASS___PFCloudKitSerializer);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 8);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v72 = v2;
  id v6 = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:]( v3,  "initWithMirroringOptions:metadataCache:recordNamePrefix:",  v5,  v2,  0LL);
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  uint64_t v7 = (void *)[*(id *)(a1 + 40) objectIDsToSerialize];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v75;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v74 + 1) + 8 * v11);
        __int128 v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "persistentStore"), "identifier");
        uint64_t v14 = *(void *)(a1 + 48);
        if (v14) {
          uint64_t v15 = *(void *)(v14 + 48);
        }
        else {
          uint64_t v15 = 0LL;
        }
        if ([v13 isEqualToString:v15])
        {
          id v73 = 0LL;
          id v16 = (void *)[*(id *)(a1 + 56) existingObjectWithID:v12 error:&v73];
          if (!v16)
          {
            uint64_t v31 = (void *)MEMORY[0x186E3E5D8]();
            BOOL v32 = __ckLoggingOverride != 0;
            uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Unable to serialize object '%@' because it appears to be missing from the store."];
            _NSCoreDataLog( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"-[NSCloudKitMirroringDelegate _performSerializationRequest:]_block_invoke");
            objc_autoreleasePoolPop(v31);
            goto LABEL_27;
          }

          uint64_t v17 = (uint64_t)v16;
          id v18 = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]( (uint64_t)v6,  v16,  0,  0,  &v73);
          if (!v18)
          {
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v73;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
            goto LABEL_35;
          }

          uint64_t v19 = v18;
          if ([v18 count])
          {
            if ((unint64_t)[v19 count] >= 2)
            {
              uint64_t v20 = [NSString stringWithUTF8String:"Multiple records returned for object even though we didn't ask for relationships: %@\n%@"];
              _NSCoreDataLog(17LL, v20, v21, v22, v23, v24, v25, v26, v17);
              uint64_t v27 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v17;
                __int16 v79 = 2112;
                v80 = v19;
                _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: Multiple records returned for object even though we didn't ask for relationships: %@\n%@",  buf,  0x16u);
              }
            }

            uint64_t v28 = [*(id *)(a1 + 40) resultType];
            if (!v28)
            {
              uint64_t v29 = *(void **)(a1 + 64);
              uint64_t v30 = objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "recordID");
LABEL_24:
              [v29 setObject:v30 forKey:v12];
              goto LABEL_26;
            }

            if (v28 == 1)
            {
              uint64_t v29 = *(void **)(a1 + 64);
              uint64_t v30 = [v19 objectAtIndexedSubscript:0];
              goto LABEL_24;
            }

            uint64_t v51 = [NSString stringWithUTF8String:"Unsupported resultType: %lu, %@"];
            uint64_t v52 = [*(id *)(a1 + 40) resultType];
            _NSCoreDataLog(17LL, v51, v53, v54, v55, v56, v57, v58, v52);
            uint64_t v59 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
LABEL_26:

              goto LABEL_27;
            }

            uint64_t v60 = [*(id *)(a1 + 40) resultType];
            __int128 v61 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = v60;
            __int16 v79 = 2112;
            v80 = v61;
            uint64_t v48 = (os_log_s *)v59;
            id v49 = "CoreData: Unsupported resultType: %lu, %@";
            uint32_t v50 = 22;
          }

          else
          {
            uint64_t v40 = [NSString stringWithUTF8String:"No records returned from the serializer for object: %@"];
            _NSCoreDataLog(17LL, v40, v41, v42, v43, v44, v45, v46, v17);
            uint64_t v47 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v17;
            uint64_t v48 = (os_log_s *)v47;
            id v49 = "CoreData: No records returned from the serializer for object: %@";
            uint32_t v50 = 12;
          }

          _os_log_fault_impl(&dword_186681000, v48, OS_LOG_TYPE_FAULT, v49, buf, v50);
          goto LABEL_26;
        }

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    uint64_t v3 = *(void *)(v2 + 8);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 88);
    }
    else {
      uint64_t v4 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v2 + 120));
    id v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000LL;
    __int128 v13 = __Block_byref_object_copy__39;
    uint64_t v14 = __Block_byref_object_dispose__39;
    uint64_t v15 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_2;
    v7[3] = &unk_189EA8700;
    v7[4] = v6;
    uint64_t v9 = &v10;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v7);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  (void *)v11[5]);

    v11[5] = 0LL;
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(void **)(a1 + 40));
  }

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_3;
    v10[3] = &unk_189EAB120;
    v10[4] = v2;
    void v10[5] = v3;
    uint64_t v4 = *(void *)(a1 + 56);
    __int128 v11 = *(_OWORD *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v10);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 168LL);
    int8x16_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x189607460];
    uint64_t v14 = *MEMORY[0x1896075F0];
    v15[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v6, "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v5,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v6,  v7,  0,  0,  objc_msgSend( v8,  "errorWithDomain:code:userInfo:",  v9,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v15,  &v14,  1)));
  }
}

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v38 = 0LL;
  uint64_t v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)&v38);
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = (void *)[v2 transformedValue];
    if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v4, "storeTokens"),  "objectForKeyedSubscript:",  objc_msgSend(*(id *)(a1 + 32), "identifier")),  "integerValue") < 1)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      uint64_t v13 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectIDsToFetch", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v24;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
            id v18 = (void *)objc_msgSend((id)objc_msgSend(v17, "persistentStore"), "identifier");
            uint64_t v19 = *(void *)(a1 + 64);
            if (v19) {
              uint64_t v20 = *(void *)(v19 + 48);
            }
            else {
              uint64_t v20 = 0LL;
            }
            ++v16;
          }

          while (v14 != v16);
          uint64_t v21 = [v13 countByEnumeratingWithState:&v23 objects:v39 count:16];
          uint64_t v14 = v21;
        }

        while (v21);
      }

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportProgressResult),  "initWithRequest:storeIdentifier:objectIDToLastExpo rtedToken:error:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 168LL),  v3,  0LL);
    }

    else
    {
      uint64_t v32 = 0LL;
      uint64_t v33 = &v32;
      uint64_t v34 = 0x3052000000LL;
      uint64_t v35 = __Block_byref_object_copy__39;
      uint64_t v36 = __Block_byref_object_dispose__39;
      uint64_t v37 = 0LL;
      uint64_t v28 = 0LL;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000LL;
      char v31 = 1;
      uint64_t v5 = (void *)[*(id *)(a1 + 48) objectIDsToFetch];
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_4;
      v27[3] = &unk_189EAB0F8;
      v27[4] = v6;
      id v27[5] = v3;
      v27[6] = &v28;
      v27[7] = &v32;
      +[NSCKRecordMetadata enumerateRecordMetadataDictionariesMatchingObjectIDs:withProperties:inStore:withManagedObjectContext:block:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  v5,  &unk_189F0B2F8,  v6,  v7,  (uint64_t)v27);
      if (*((_BYTE *)v29 + 24))
      {
        int8x16_t v8 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportProgressResult);
        uint64_t v9 = 0LL;
        id v10 = v3;
      }

      else
      {
        int8x16_t v8 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportProgressResult);
        id v10 = 0LL;
        uint64_t v9 = v33[5];
      }

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:]( v8,  "initWithRequest:storeIdentifier:objectIDToLastExpo rtedToken:error:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 168LL),  v10,  v9);

      v33[5] = 0LL;
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);
    }
  }

  else
  {
    if (v38)
    {
      __int128 v11 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v12 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v11,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 168LL),  0LL,  0LL,  v38);
    }

    else
    {
      uint64_t v22 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportProgressResult);
      uint64_t v12 = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:]( v22,  "initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 56) + 168LL),  MEMORY[0x189604A60],  0LL);
    }

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v12;
  }

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_4( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  if (a2)
  {
    id v6 = (void *)+[NSCKRecordMetadata createObjectIDFromMetadataDictionary:inSQLCore:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  a2,  *(void **)(a1 + 32));
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"lastExportedTransactionNumber"];
    int8x16_t v8 = objc_alloc(&OBJC_CLASS___NSPersistentHistoryToken);
    if (!v7) {
      uint64_t v7 = &unk_189F04578;
    }
    uint64_t v9 = -[NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]( v8,  "initWithTransactionNumber:andStoreID:",  v7,  [*(id *)(a1 + 32) identifier]);
    [*(id *)(a1 + 40) setObject:v9 forKey:v6];
  }

  else
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a3;
  }

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke( uint64_t a1,  uint64_t a2)
{
  v31[3] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    if ([*(id *)(v3 + 8) databaseScope] == 3)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        id v6 = *(void **)(v5 + 80);
      }
      else {
        id v6 = 0LL;
      }
      if ([v6 count])
      {
        id v7 = objc_alloc((Class)getCloudKitCKFetchShareMetadataOperationClass[0]());
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          uint64_t v9 = *(void *)(v8 + 80);
        }
        else {
          uint64_t v9 = 0LL;
        }
        id v10 = (void *)[v7 initWithShareURLs:v9];
        id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v12 = MEMORY[0x1895F87A8];
        v29[0] = MEMORY[0x1895F87A8];
        v29[1] = 3221225472LL;
        id v29[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_2;
        v29[3] = &unk_189EAB148;
        v29[4] = v11;
        v29[5] = 0LL;
        [v10 setPerShareMetadataBlock:v29];
        objc_initWeak(&location, *(id *)(a1 + 32));
        v26[0] = v12;
        v26[1] = 3221225472LL;
        v26[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_357;
        v26[3] = &unk_189EAB170;
        objc_copyWeak(&v27, &location);
        uint64_t v13 = *(void *)(a1 + 40);
        v26[4] = 0LL;
        void v26[5] = v13;
        v26[6] = v11;
        v26[7] = a2;
        [v10 setFetchShareMetadataCompletionBlock:v26];
        [*(id *)(*(void *)(a1 + 32) + 48) addOperation:v10];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

      else
      {
        -[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]( *(void *)(a1 + 32),  *(void *)(a1 + 40),  a2);
      }
    }

    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        id Weak = objc_loadWeak((id *)(v14 + 120));
      }
      else {
        id Weak = 0LL;
      }
      id v16 = Weak;
      uint64_t v17 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 168LL);
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x1896075F0];
      v31[0] = @"Provided persistent store is not set to the shared database scope and cannot accept share invitation.";
      uint64_t v22 = *MEMORY[0x189607760];
      v30[0] = v21;
      v30[1] = v22;
      if ([v16 URL]) {
        __int128 v23 = (const __CFString *)[v16 URL];
      }
      else {
        __int128 v23 = @"nil";
      }
      v31[1] = v23;
      void v30[2] = @"databaseScope";
      v31[2] = softLinkCKDatabaseScopeString([*(id *)(*(void *)(a1 + 32) + 8) databaseScope]);
      uint64_t v24 = [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:3];
      __int128 v25 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v17,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  v18,  v19,  0,  0,  [v20 errorWithDomain:*MEMORY[0x189607460] code:134091 userInfo:v24]);
      -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(void *)(a1 + 32), *(void **)(a1 + 40), v25);
    }
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(void **)(a1 + 40));
  }

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }

  else if (a4)
  {
    [*(id *)(a1 + 40) setObject:a4 forKey:a2];
  }

  else
  {
    uint64_t v5 = [NSString stringWithUTF8String:"No metadata or error for share URL: %@"];
    _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, a2);
    uint64_t v12 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = a2;
      _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: No metadata or error for share URL: %@",  buf,  0xCu);
    }
  }

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_357( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([*(id *)(a1 + 32) count]
    && (uint64_t v5 = [NSString stringWithUTF8String:"Some shareURLs failed to return metadata..."],
        _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, v20[0]),
        uint64_t v12 = (os_log_s *)__pflogFaultLog,
        os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
  {
    LOWORD(v20[0]) = 0;
    _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: Some shareURLs failed to return metadata...",  (uint8_t *)v20,  2u);
    if (a2)
    {
LABEL_4:
      if (WeakRetained)
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = (dispatch_queue_s *)WeakRetained[4];
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        void v20[2] = (uint64_t)__62__NSCloudKitMirroringDelegate__handleError_duringShareAccept___block_invoke;
        void v20[3] = (uint64_t)&unk_189EA7A38;
        v20[4] = v13;
        v20[5] = (uint64_t)WeakRetained;
        v20[6] = a2;
        dispatch_async(v14, v20);
      }

      goto LABEL_12;
    }
  }

  else if (a2)
  {
    goto LABEL_4;
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    uint64_t v16 = *(void *)(v15 + 88);
  }
  else {
    uint64_t v16 = 0LL;
  }
  [*(id *)(a1 + 48) addObjectsFromArray:v16];
  uint64_t v18 = *(void **)(a1 + 40);
  if (v18)
  {
    objc_setProperty_nonatomic_copy(v18, v17, *(id *)(a1 + 48), 88LL);
    uint64_t v19 = *(void *)(a1 + 40);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  -[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]( (uint64_t)WeakRetained,  v19,  *(void *)(a1 + 56));
LABEL_12:
}

- (void)_acceptShareMetadatasInRequest:(uint64_t)a3 workBlockContext:
{
  if (a1)
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v7 = __ckLoggingOverride;
    }
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Accepting shares defined by request: %@"];
    _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]");
    objc_autoreleasePoolPop(v6);
    id v15 = objc_alloc((Class)getCloudKitCKAcceptSharesOperationClass[0]());
    if (a2) {
      uint64_t v16 = *(void *)(a2 + 88);
    }
    else {
      uint64_t v16 = 0LL;
    }
    uint64_t v17 = (void *)[v15 initWithShareMetadatas:v16];
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v20 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke;
    v22[3] = &unk_189EAB198;
    v22[4] = v18;
    void v22[5] = v19;
    [v17 setPerShareCompletionBlock:v22];
    v21[0] = v20;
    v21[1] = 3221225472LL;
    v21[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_372;
    v21[3] = &unk_189EAB1E8;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = a3;
    v21[7] = v18;
    v21[8] = v19;
    [v17 setAcceptSharesCompletionBlock:v21];
    [*(id *)(a1 + 48) addOperation:v17];
  }

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    [*(id *)(a1 + 40) addObject:a2];
  }

  else if (a4)
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v7 = __ckLoggingOverride != 0;
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to accept share: %@\n%@"];
    _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]_block_invoke");
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    uint64_t v15 = [NSString stringWithUTF8String:"No error or share for accepted share metadata: %@"];
    _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, a2);
    uint64_t v22 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = a2;
      _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: No error or share for accepted share metadata: %@",  buf,  0xCu);
    }
  }

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_372( uint64_t a1,  uint64_t a2)
{
  v4[1] = 3221225472LL;
  __int128 v2 = *(_OWORD *)(a1 + 48);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
  int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v4[0] = MEMORY[0x1895F87A8];
  v4[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_2;
  v4[3] = &unk_189EAA808;
  v4[4] = a2;
  __int128 v6 = v2;
  uint64_t v7 = *(void *)(a1 + 64);
  dispatch_async(v3, v4);
}

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_2( uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v9 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 48) + 168LL),  0LL,  0LL,  *(void *)(a1 + 32));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(void *)(a1 + 48), *(void **)(a1 + 40), v9);
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
      uint64_t v4 = *(void **)(v3 + 88);
    }
    else {
      uint64_t v4 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(v2 + 120));
    id v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    uint64_t v16 = 0x3052000000LL;
    uint64_t v17 = __Block_byref_object_copy__39;
    uint64_t v18 = __Block_byref_object_dispose__39;
    v10[0] = MEMORY[0x1895F87A8];
    v10[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_3;
    v10[3] = &unk_189EAB120;
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    v10[4] = v6;
    void v10[5] = v7;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v19 = 0LL;
    v10[1] = 3221225472LL;
    int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v12 = v8;
    uint64_t v13 = &v14;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v10);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:]( *(void *)(a1 + 48),  *(void **)(a1 + 40),  (void *)v15[5]);

    void v15[5] = 0LL;
    _Block_object_dispose(&v14, 8);
  }

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_3( uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_4;
    v9[3] = &unk_189EAB1C0;
    __int128 v10 = *(_OWORD *)(a1 + 40);
    int8x16_t v11 = v2;
    uint64_t v12 = v3;
    uint64_t v14 = *(void *)(a1 + 72);
    __int128 v13 = *(_OWORD *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v9);
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsResult);
    int8x16_t v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 168LL);
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x189607460];
    uint64_t v15 = *MEMORY[0x1896075F0];
    v16[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(v5, "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = -[NSCloudKitMirroringAcceptShareInvitationsResult initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:]( v4,  "initWithRequest:storeIdentifier:acceptedShares:accep tedShareMetadatas:error:",  v5,  v6,  0,  0,  objc_msgSend( v7,  "errorWithDomain:code:userInfo:",  v8,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v16,  &v15,  1)));
  }
}

uint64_t __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_4( uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v34;
    char v31 = 1;
LABEL_3:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v34 != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * v5);
      uint64_t v7 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "databaseScope"),  *(void *)(a1 + 48),  *(void **)(a1 + 56),  (uint64_t)&v37);
      if (!v7) {
        goto LABEL_22;
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      if (v8 && (uint64_t v9 = v7, (v10 = *(void *)(v8 + 136)) != 0))
      {
        id v11 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v10, (uint64_t)v6, &v37);
        if (v11)
        {
          -[NSManagedObject setNeedsImport:](v9, "setNeedsImport:", 1LL);
          -[NSManagedObject setNeedsShareUpdate:](v9, "setNeedsShareUpdate:", 0LL);
          -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v11);
          if (objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus") != 1
            || objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus") != 2)
          {
            uint64_t v12 = [NSString stringWithUTF8String:"Accepted share %@ but the invitation status %lu or acceptance status %lu is incorrect."];
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID");
            objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus");
            objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus");
            _NSCoreDataLog(17LL, v12, v14, v15, v16, v17, v18, v19, v13);
            uint64_t v20 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v21 = objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID");
              uint64_t v22 = objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus");
              uint64_t v23 = objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus");
              *(_DWORD *)buf = 138412802;
              uint64_t v39 = v21;
              __int16 v40 = 2048;
              uint64_t v41 = v22;
              __int16 v42 = 2048;
              uint64_t v43 = v23;
              _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Accepted share %@ but the invitation status %lu or acceptance status %lu is incorrect.",  buf,  0x20u);
            }
          }

          goto LABEL_16;
        }
      }

      else
      {
        id v11 = 0LL;
      }

      char v31 = 0;
LABEL_16:

      if (v3 == ++v5)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v3) {
          goto LABEL_3;
        }
        if ((v31 & 1) == 0) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  if ([*(id *)(a1 + 56) hasChanges]
    && ![*(id *)(a1 + 56) save:&v37])
  {
LABEL_22:
    uint64_t v24 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsResult);
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v29 = v37;
    uint64_t v25 = 0LL;
    uint64_t v28 = 0LL;
  }

  else
  {
    -[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]( *(void *)(a1 + 40),  0,  1);
    uint64_t v24 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsResult);
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v28 = *(void *)(a1 + 72);
    uint64_t v29 = 0LL;
  }

  uint64_t result = -[NSCloudKitMirroringAcceptShareInvitationsResult initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:]( v24,  "initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:",  v27,  v26,  v25,  v28,  v29);
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = result;
  return result;
}

- (void)_requestEncounteredUnrecoverableError:(void *)a3 withResult:
{
  uint64_t v6 = -[PFCloudKitFatalErrorMetric initWithContainerIdentifier:result:]( [PFCloudKitFatalErrorMetric alloc],  "initWithContainerIdentifier:result:",  [*(id *)(a1 + 8) containerIdentifier],  a3);
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 72);
  }
  else {
    uint64_t v8 = 0LL;
  }
  -[PFCloudKitMetricsClient logMetric:](v8, v6);

  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ([a3 error])
  {
    uint64_t v9 = [a3 error];
    [v11 setObject:v9 forKey:*MEMORY[0x189607798]];
  }

  uint64_t v10 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( [NSCloudKitMirroringResult alloc],  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a2,  *(void *)(a1 + 168),  [a3 success],  objc_msgSend(a3, "madeChanges"),  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 134410, v11));
  -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](a2, (uint64_t)v10);
}

- (void)_requestEncounteredRecoverableError:(void *)a3 withResult:
{
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ([a3 error])
  {
    uint64_t v6 = [a3 error];
    [v8 setObject:v6 forKey:*MEMORY[0x189607798]];
  }

  uint64_t v7 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( [NSCloudKitMirroringResult alloc],  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a2,  *(void *)(a1 + 168),  [a3 success],  objc_msgSend(a3, "madeChanges"),  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 134409, v8));
  -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](a2, (uint64_t)v7);
}

void __48__NSCloudKitMirroringDelegate_recoverFromError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v3 = 0LL;
    id WeakRetained = 0LL;
  }

  uint64_t v4 = (NSManagedObjectContext *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v3);
  if (v4)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 40) domain];
    if ([v5 isEqualToString:getCloudKitCKErrorDomain()]
      && [*(id *)(a1 + 40) code] == 2)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = (void *)[v8 domain];
        if ([v9 isEqualToString:getCloudKitCKErrorDomain()]
          && [v8 code] == 2)
        {
          uint64_t v10 = (void *)[v8 userInfo];
          id v11 = (void *)[v10 objectForKey:getCloudKitCKPartialErrorsByItemIDKey[0]()];
          uint64_t v70 = 0LL;
          uint64_t v71 = &v70;
          uint64_t v72 = 0x2020000000LL;
          char v73 = 0;
          uint64_t v64 = 0LL;
          uint64_t v65 = &v64;
          uint64_t v66 = 0x3052000000LL;
          uint64_t v67 = __Block_byref_object_copy__39;
          uint64_t v68 = __Block_byref_object_dispose__39;
          uint64_t v69 = 0LL;
          id v61 = objc_alloc_init(MEMORY[0x189603FA8]);
          id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
          id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
          id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
          id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
          v63[0] = MEMORY[0x1895F87A8];
          v63[1] = 3221225472LL;
          v63[2] = __75__NSCloudKitMirroringDelegate__recoverFromPartialError_forStore_inMonitor___block_invoke;
          v63[3] = &unk_189EAB210;
          v63[12] = &v64;
          v63[4] = v8;
          v63[5] = v61;
          v63[6] = v13;
          v63[7] = v12;
          v63[8] = v14;
          v63[9] = v15;
          v63[10] = v6;
          v63[11] = &v70;
          [v11 enumerateKeysAndObjectsUsingBlock:v63];
          if ([v14 count])
          {
            uint64_t v16 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v17 = __ckLoggingOverride;
            uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Error recovery failed because the following fatal errors were found: %@"];
            _NSCoreDataLog( v17 != 0,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromPartialError:forStore:inMonitor:]");
            objc_autoreleasePoolPop(v16);
          }

          else
          {
            if (*((_BYTE *)v71 + 24)) {
              int v60 = -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:]( v6,  (void *)v65[5],  v61,  (uint64_t)v4,  v7);
            }
            else {
              int v60 = 1;
            }
            if ([v12 count])
            {
              uint64_t v83 = 0LL;
              uint64_t v84 = &v83;
              uint64_t v85 = 0x2020000000LL;
              char v86 = 0;
              uint64_t v44 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              uint64_t v74 = MEMORY[0x1895F87A8];
              uint64_t v75 = 3221225472LL;
              __int128 v76 = __79__NSCloudKitMirroringDelegate__recoverUnknownItemRecordIDs_forStore_inMonitor___block_invoke;
              __int128 v77 = &unk_189EA9588;
              id v78 = v12;
              uint64_t v79 = (uint64_t)v4;
              v80 = v44;
              uint64_t v81 = v6;
              uint64_t v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v44, "performBlockAndWait:", &v74);

              if (*((_BYTE *)v84 + 24))
              {
                uint64_t v45 = (void *)MEMORY[0x186E3E5D8]();
                unint64_t v46 = __ckLoggingOverride;
                uint64_t v47 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Recovered from unknown item error for recordIDs: %@"];
                if (v46 >= 0x10) {
                  uint64_t v54 = 16LL;
                }
                else {
                  uint64_t v54 = v46;
                }
                _NSCoreDataLog( v54,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]");
                objc_autoreleasePoolPop(v45);
                BOOL v59 = *((_BYTE *)v84 + 24) != 0;
              }

              else
              {
                BOOL v59 = 0;
              }

              _Block_object_dispose(&v83, 8);
            }

            else
            {
              BOOL v59 = 1;
            }

            BOOL v55 = 1;
            if ([v15 count])
            {
              uint64_t v83 = 0LL;
              uint64_t v84 = &v83;
              uint64_t v85 = 0x2020000000LL;
              char v86 = 1;
              uint64_t v56 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              uint64_t v74 = MEMORY[0x1895F87A8];
              uint64_t v75 = 3221225472LL;
              __int128 v76 = __79__NSCloudKitMirroringDelegate__recoverConflictedZoneShares_forStore_inMonitor___block_invoke;
              __int128 v77 = &unk_189EA9588;
              id v78 = v15;
              uint64_t v79 = v6;
              v80 = v4;
              uint64_t v81 = (uint64_t)v56;
              uint64_t v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v56, "performBlockAndWait:", &v74);

              LODWORD(v56) = *((unsigned __int8 *)v84 + 24);
              _Block_object_dispose(&v83, 8);
              BOOL v55 = (_DWORD)v56 != 0;
            }

            if ([v13 count])
            {
              uint64_t v83 = 0LL;
              uint64_t v84 = &v83;
              uint64_t v85 = 0x2020000000LL;
              char v86 = 0;
              uint64_t v57 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              uint64_t v74 = MEMORY[0x1895F87A8];
              uint64_t v75 = 3221225472LL;
              __int128 v76 = __84__NSCloudKitMirroringDelegate__recoverFromUnknownShareRecordIDs_forStore_inMonitor___block_invoke;
              __int128 v77 = &unk_189EA9588;
              id v78 = v13;
              uint64_t v79 = v6;
              v80 = v4;
              uint64_t v81 = (uint64_t)v57;
              uint64_t v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v57, "performBlockAndWait:", &v74);

              LODWORD(v57) = *((unsigned __int8 *)v84 + 24);
              _Block_object_dispose(&v83, 8);
              BOOL v58 = (_DWORD)v57 != 0;
            }

            else
            {
              BOOL v58 = 1;
            }

            if ((v60 & v59) == 1)
            {
              BOOL v43 = v55 && v58;
LABEL_35:

              v65[5] = 0LL;
              _Block_object_dispose(&v64, 8);
              _Block_object_dispose(&v70, 8);
              goto LABEL_36;
            }
          }

          BOOL v43 = 0;
          goto LABEL_35;
        }

        __int128 v34 = (void *)MEMORY[0x186E3E5D8]();
        BOOL v35 = __ckLoggingOverride != 0;
        uint64_t v36 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unknown error passed to partial error handler: %@"];
        _NSCoreDataLog( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromPartialError:forStore:inMonitor:]");
        objc_autoreleasePoolPop(v34);
      }

      BOOL v43 = 0;
LABEL_36:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v43;
      goto LABEL_37;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:]( *(void *)(a1 + 48),  *(void **)(a1 + 40),  0LL,  (uint64_t)v4,  *(void *)(a1 + 32));
  }

  else
  {
    uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v26 = __ckLoggingOverride != 0;
    uint64_t v27 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"The store was removed before the mirroring delegate could recover from an error:\n%@"];
    _NSCoreDataLog( v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"-[NSCloudKitMirroringDelegate recoverFromError:]_block_invoke");
    objc_autoreleasePoolPop(v25);
  }

- (uint64_t)_recoverFromError:(void *)a3 withZoneIDs:(uint64_t)a4 forStore:(uint64_t)a5 inMonitor:
{
  uint64_t v208 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v9 = a1;
    id v202 = 0LL;
    uint64_t v10 = (void *)[a2 domain];
    if (![v10 isEqualToString:getCloudKitCKErrorDomain()])
    {
      BOOL v26 = (void *)[a2 domain];
      if ([v26 isEqualToString:*MEMORY[0x189607460]])
      {
        if ([a2 code] == 134301)
        {
          -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]( (void *)v9,  (uint64_t)@"NSCloudKitMirroringDelegateWillResetSyncNotificationName",  a2);
          uint64_t v27 = *(void **)(v9 + 8);
          if (v27)
          {
            uint64_t v28 = v27[12];
            uint64_t v29 = [v27 databaseScope];
            if (v28)
            {
              uint64_t v29 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]( v28,  a4,  a5,  37LL,  MEMORY[0x189604A58],  v29,  0LL,  &v202);
              if ((_DWORD)v29) {
                goto LABEL_88;
              }
            }

            goto LABEL_149;
          }

          goto LABEL_155;
        }

        if ([a2 code] == 134405)
        {
          if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a2, "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateResetSyncReasonKey"),  "unsignedIntegerValue") == 2 && *(_BYTE *)(v9 + 145))
          {
            objc_msgSend( *(id *)(v9 + 72),  "unregisterForSubscriptionWithID:inDatabase:",  objc_msgSend(*(id *)(v9 + 40), "subscriptionID"),  *(void *)(v9 + 56));
            *(_BYTE *)(v9 + 145) = 0;
          }

          -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]( (void *)v9,  (uint64_t)@"NSCloudKitMirroringDelegateWillResetSyncNotificationName",  a2);
          uint64_t v45 = *(void **)(v9 + 8);
          if (v45) {
            uint64_t v46 = v45[12];
          }
          else {
            uint64_t v46 = 0LL;
          }
          uint64_t v29 = -[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]( v46,  a4,  a5,  [v45 databaseScope],  &v202);
          if ((_DWORD)v29) {
            goto LABEL_87;
          }
          goto LABEL_149;
        }

        if ([a2 code] == 134407)
        {
          -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v9, a2);
          goto LABEL_149;
        }

        uint64_t v29 = [a2 code];
        if (v29 != 133000) {
          goto LABEL_149;
        }
      }

      else
      {
        uint64_t v30 = (void *)[a2 domain];
        uint64_t v29 = [v30 isEqualToString:*MEMORY[0x189607740]];
        if (!(_DWORD)v29) {
          goto LABEL_149;
        }
        uint64_t v31 = [a2 code];
        if (v31 > -1105)
        {
          switch(v31)
          {
            case -1022LL:
              uint64_t v32 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorAppTransportSecurityRequiresSecure Connection and probably shouldn't have."];
              _NSCoreDataLog(17LL, v32, v33, v34, v35, v36, v37, v38, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorAppTransportSecurityRequir"
                    "esSecureConnection and probably shouldn't have.";
              break;
            case -1021LL:
              uint64_t v143 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorRequestBodyStreamExhausted and pr obably shouldn't have."];
              _NSCoreDataLog(17LL, v143, v144, v145, v146, v147, v148, v149, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorRequestBodyStreamExhausted"
                    " and probably shouldn't have.";
              break;
            case -1020LL:
            case -1019LL:
            case -1018LL:
            case -1014LL:
            case -1013LL:
            case -1012LL:
            case -1010LL:
            case -1009LL:
            case -1008LL:
            case -1007LL:
            case -1006LL:
            case -1005LL:
            case -1004LL:
            case -1003LL:
            case -1001LL:
            case -999LL:
            case -997LL:
            case -996LL:
            case -995LL:
              goto LABEL_89;
            case -1017LL:
              uint64_t v136 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotParseResponse and probably shouldn't have."];
              _NSCoreDataLog(17LL, v136, v137, v138, v139, v140, v141, v142, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotParseResponse and pr"
                    "obably shouldn't have.";
              break;
            case -1016LL:
              uint64_t v171 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeContentData and proba bly shouldn't have."];
              _NSCoreDataLog(17LL, v171, v172, v173, v174, v175, v176, v177, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeContentData an"
                    "d probably shouldn't have.";
              break;
            case -1015LL:
              uint64_t v157 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeRawData and probably shouldn't have."];
              _NSCoreDataLog(17LL, v157, v158, v159, v160, v161, v162, v163, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeRawData and pr"
                    "obably shouldn't have.";
              break;
            case -1011LL:
              uint64_t v150 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadServerResponse and probably shouldn't have."];
              _NSCoreDataLog(17LL, v150, v151, v152, v153, v154, v155, v156, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadServerResponse and prob"
                    "ably shouldn't have.";
              break;
            case -1002LL:
              uint64_t v178 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorUnsupportedURL and probably shouldn't have."];
              _NSCoreDataLog(17LL, v178, v179, v180, v181, v182, v183, v184, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorUnsupportedURL and probabl"
                    "y shouldn't have.";
              break;
            case -1000LL:
              uint64_t v164 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadURL and probably shouldn't have."];
              _NSCoreDataLog(17LL, v164, v165, v166, v167, v168, v169, v170, v195);
              uint64_t v39 = __pflogFaultLog;
              uint64_t v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29) {
                goto LABEL_149;
              }
              *(_WORD *)buf = 0;
              uint64_t v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadURL and probably shouldn't have.";
              break;
            case -998LL:
              goto LABEL_100;
            default:
              goto LABEL_89;
          }

- (uint64_t)_markZonesNeedingRecoveryFromManateeIdentityLoss:(uint64_t)a3 databaseScope:(uint64_t)a4 inStore:(void *)a5 error:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 1;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  uint64_t v29 = __Block_byref_object_copy__39;
  uint64_t v30 = __Block_byref_object_dispose__39;
  uint64_t v31 = 0LL;
  uint64_t v10 = -[PFCloudKitStoreMonitor initForStore:](objc_alloc(&OBJC_CLASS___PFCloudKitStoreMonitor), "initForStore:", a4);
  id v11 = v10;
  if (v10) {
    id WeakRetained = objc_loadWeakRetained(v10 + 4);
  }
  else {
    id WeakRetained = 0LL;
  }
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  void v25[2] = __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke;
  v25[3] = &unk_189EA8F90;
  v25[4] = a1;
  v25[5] = a2;
  v25[6] = v11;
  v25[7] = a4;
  v25[8] = &v26;
  v25[9] = &v32;
  v25[10] = a3;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v11, (uint64_t)v25);

  uint64_t v13 = (void *)v27[5];
  if (v13)
  {
    id v14 = v13;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
    }

    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
      uint64_t v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
        __int16 v38 = 1024;
        int v39 = 3813;
        _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v27[5] = 0LL;
  }

  uint64_t v23 = *((unsigned __int8 *)v33 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v23;
}

void __75__NSCloudKitMirroringDelegate__recoverFromPartialError_forStore_inMonitor___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  getCloudKitCKRecordIDClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (getCloudKitCKRecordZoneIDClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([a2 isEqualToString:@"com.apple.coredata.cloudkit.private.subscription"] & 1) == 0
      && ([a2 isEqualToString:@"com.apple.coredata.cloudkit.shared.subscription"] & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Unexpected string item for partial failure: %@ - %@"];
      _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      uint64_t v13 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        char v35 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v61 = a2;
        __int16 v62 = 2112;
        uint64_t v63 = v35;
        _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Unexpected string item for partial failure: %@ - %@",  buf,  0x16u);
      }
    }

    id v14 = (void *)[a3 domain];
    if ([v14 isEqualToString:getCloudKitCKErrorDomain()])
    {
      if ([a3 code] == 26
        || [a3 code] == 28
        || [a3 code] == 21
        || [a3 code] == 112
        || [a3 code] == 15
        || [a3 code] == 9
        || [a3 code] == 6)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 1;
        if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL)) {
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = a3;
        }
        getCloudKitCKRecordIDClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ([a3 code] == 15)
          {
            uint64_t v15 = [NSString stringWithUTF8String:"Got server rejected request as part of a partial error for a CKRecord: %@ - %@"];
            _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
            uint64_t v22 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v61 = a2;
              __int16 v62 = 2112;
              uint64_t v63 = a3;
              _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Got server rejected request as part of a partial error for a CKRecord: %@ - %@",  buf,  0x16u);
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
            goto LABEL_89;
          }

          uint64_t v34 = *(void **)(a1 + 40);
          goto LABEL_73;
        }

        uint64_t v24 = *(void **)(a1 + 40);
        goto LABEL_75;
      }

      if ([a3 code] == 3
        || [a3 code] == 4
        || [a3 code] == 22
        || [a3 code] == 7
        || [a3 code] == 23)
      {
LABEL_70:
        *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 1;
        if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL)) {
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = a3;
        }
        getCloudKitCKRecordIDClass();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v34 = *(void **)(a1 + 40);
        if ((isKindOfClass & 1) != 0)
        {
LABEL_73:
          uint64_t v37 = [a2 zoneID];
          uint64_t v24 = v34;
LABEL_76:
          [v24 addObject:v37];
          return;
        }

        uint64_t v24 = v34;
LABEL_75:
        uint64_t v37 = (uint64_t)a2;
        goto LABEL_76;
      }

      if ([a3 code] == 11)
      {
        getCloudKitCKRecordIDClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v40 = [NSString stringWithUTF8String:"Got an unknown item error back for a zone: %@ - %@"];
          _NSCoreDataLog(17LL, v40, v41, v42, v43, v44, v45, v46, (uint64_t)a2);
          uint64_t v47 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v61 = a2;
            __int16 v62 = 2112;
            uint64_t v63 = a3;
            _os_log_fault_impl( &dword_186681000,  v47,  OS_LOG_TYPE_FAULT,  "CoreData: Got an unknown item error back for a zone: %@ - %@",  buf,  0x16u);
          }

          goto LABEL_89;
        }

        __int16 v38 = (void *)[a2 recordName];
        else {
          uint64_t v24 = *(void **)(a1 + 56);
        }
        goto LABEL_75;
      }

      if ([a3 code] == 12 || objc_msgSend(a3, "code") == 25)
      {
LABEL_92:
        [*(id *)(a1 + 64) setObject:a3 forKey:a2];
        return;
      }

      if ([a3 code] == 14)
      {
        getCloudKitCKRecordIDClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          int v39 = (void *)[a2 recordName];
          if ([v39 isEqualToString:getCloudKitCKRecordNameZoneWideShare[0]()])
          {
            uint64_t v24 = *(void **)(a1 + 72);
            uint64_t v37 = (uint64_t)a3;
            goto LABEL_76;
          }
        }
      }
    }

    else
    {
      uint64_t v23 = (void *)[a3 domain];
      if ([v23 isEqualToString:*MEMORY[0x189607740]]
        && ([a3 code] == -1
         || [a3 code] == -999
         || [a3 code] == -1001
         || [a3 code] == -1003
         || [a3 code] == -1004
         || [a3 code] == -1005
         || [a3 code] == -1006
         || [a3 code] == -1007
         || [a3 code] == -1008
         || [a3 code] == -1009
         || [a3 code] == -1010
         || [a3 code] == -1012
         || [a3 code] == -1013
         || [a3 code] == -1014
         || [a3 code] == -1100
         || [a3 code] == -1101
         || [a3 code] == -1102
         || [a3 code] == -1103
         || [a3 code] == -1104
         || [a3 code] == -1200
         || [a3 code] == -2000
         || [a3 code] == -3000
         || [a3 code] == -3001
         || [a3 code] == -3002
         || [a3 code] == -3003
         || [a3 code] == -3004
         || [a3 code] == -3005
         || [a3 code] == -3006
         || [a3 code] == -3007
         || [a3 code] == -1018
         || [a3 code] == -1019
         || [a3 code] == -1020
         || [a3 code] == -995
         || [a3 code] == -996
         || [a3 code] == -997))
      {
        goto LABEL_70;
      }
    }

void __79__NSCloudKitMirroringDelegate__recoverConflictedZoneShares_forStore_inMonitor___block_invoke( uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v44 = 0LL;
        uint64_t v9 = (void *)[v7 userInfo];
        uint64_t v10 = (void *)[v9 objectForKey:getCloudKitCKRecordChangedErrorServerRecordKey[0]()];
        uint64_t v11 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)objc_msgSend((id)objc_msgSend(v10, "recordID"), "zoneID"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "databaseScope"),  *(void *)(a1 + 48),  *(void **)(a1 + 56),  (uint64_t)&v44);
        if (!v11)
        {
          uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
          BOOL v27 = __ckLoggingOverride != 0;
          uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover conflict for record: %@ due to error: %@"];
          _NSCoreDataLog( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
          objc_autoreleasePoolPop(v26);
          goto LABEL_16;
        }

        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
        if (!v12
          || (uint64_t v13 = v11, (v14 = *(void *)(v12 + 136)) == 0)
          || (id v15 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v14, (uint64_t)v10, &v44)) == 0LL)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
          uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
          BOOL v35 = __ckLoggingOverride != 0;
          uint64_t v36 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover conflict for record: %@ due to error: %@"];
          _NSCoreDataLog( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
          uint64_t v16 = 0LL;
          goto LABEL_14;
        }

        uint64_t v16 = v15;
        -[NSManagedObject setEncodedShareData:](v13, "setEncodedShareData:", v15);
        -[NSManagedObject setNeedsShareUpdate:](v13, "setNeedsShareUpdate:", 0LL);
        if (([*(id *)(a1 + 56) save:&v44] & 1) == 0)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
          uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
          BOOL v18 = __ckLoggingOverride != 0;
          uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover conflict for record: %@ due to save failure: %@"];
          _NSCoreDataLog( v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
LABEL_14:
          objc_autoreleasePoolPop(v17);
        }

LABEL_16:
        int v43 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        objc_autoreleasePoolPop(v8);
        if (!v43) {
          return;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v4);
  }

void __79__NSCloudKitMirroringDelegate__recoverUnknownItemRecordIDs_forStore_inMonitor___block_invoke( uint64_t a1)
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v110 = 0LL;
  id v2 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  *(void **)(a1 + 32),  *(void **)(a1 + 40),  *(void **)(a1 + 48),  &v110);
  uint64_t v3 = v2;
  if (!v2)
  {
    __int128 v47 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v48 = __ckLoggingOverride;
    uint64_t v49 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to recover from unknown item error due to record metadata fetch error: %@"];
    _NSCoreDataLog( v48 != 0,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
LABEL_43:
    objc_autoreleasePoolPop(v47);
    return;
  }

  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v106 objects:v117 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v107;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v107 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        if ([v7 needsCloudDelete])
        {
          [*(id *)(a1 + 48) deleteObject:v7];
        }

        else
        {
          uint64_t v8 = [NSString stringWithUTF8String:"%@: Unexpected state for record metadata. It was not found on the server but the local row was not expe cted to be deleted, how did we get here? %@"];
          _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, *(void *)(a1 + 56));
          id v15 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            uint64_t v114 = v16;
            __int16 v115 = 2112;
            uint64_t v116 = v7;
            _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: %@: Unexpected state for record metadata. It was not found on the server but the local row was n ot expected to be deleted, how did we get here? %@",  buf,  0x16u);
          }
        }
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v106 objects:v117 count:16];
    }

    while (v4);
  }

  if (![*(id *)(a1 + 48) save:&v110])
  {
    __int128 v47 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v56 = __ckLoggingOverride;
    uint64_t v57 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save record metadata changes from recovering unknown item errors: %@"];
    _NSCoreDataLog( v56 != 0,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
    goto LABEL_43;
  }

  id v17 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  MEMORY[0x189604A58],  *(void **)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  &v110);
  BOOL v18 = v17;
  if (!v17)
  {
    __int16 v64 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v65 = __ckLoggingOverride;
    uint64_t v66 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to recover from unknown item error due to mirrored relationship fetch error: %@"];
    _NSCoreDataLog( v65 != 0,  v66,  v67,  v68,  v69,  v70,  v71,  v72,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
LABEL_46:
    objc_autoreleasePoolPop(v64);
    return;
  }

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  uint64_t v19 = [v17 countByEnumeratingWithState:&v102 objects:v112 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v103;
    do
    {
      for (uint64_t j = 0LL; j != v19; ++j)
      {
        if (*(void *)v103 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        if ([v22 needsDelete])
        {
          [*(id *)(a1 + 48) deleteObject:v22];
        }

        else
        {
          uint64_t v23 = [NSString stringWithUTF8String:"%@: Unexpected state for mirrored relationship metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@"];
          _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, *(void *)(a1 + 56));
          uint64_t v30 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v31 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            uint64_t v114 = v31;
            __int16 v115 = 2112;
            uint64_t v116 = v22;
            _os_log_fault_impl( &dword_186681000,  v30,  OS_LOG_TYPE_FAULT,  "CoreData: %@: Unexpected state for mirrored relationship metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@",  buf,  0x16u);
          }
        }
      }

      uint64_t v19 = [v18 countByEnumeratingWithState:&v102 objects:v112 count:16];
    }

    while (v19);
  }

  if (![*(id *)(a1 + 48) save:&v110])
  {
    __int16 v64 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v73 = __ckLoggingOverride;
    uint64_t v74 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save mirrored relationship changes from recovering unknown item errors: %@"];
    _NSCoreDataLog( v73 != 0,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
    goto LABEL_46;
  }

  id v32 = +[NSCKRecordZoneMoveReceipt moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:]( &OBJC_CLASS___NSCKRecordZoneMoveReceipt,  "moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  *(void *)(a1 + 40),  &v110);
  uint64_t v33 = v32;
  if (v32)
  {
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    uint64_t v34 = [v32 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v99;
      do
      {
        for (uint64_t k = 0LL; k != v34; ++k)
        {
          if (*(void *)v99 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v37 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          if ([v37 needsCloudDelete])
          {
            [*(id *)(a1 + 48) deleteObject:v37];
          }

          else
          {
            uint64_t v38 = [NSString stringWithUTF8String:"%@: Unexpected move receipt state. It was not found on the server but the local row was not marked f or cloud deletion. Why were we trying to access it? %@"];
            _NSCoreDataLog(17LL, v38, v39, v40, v41, v42, v43, v44, *(void *)(a1 + 56));
            __int128 v45 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v46 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              uint64_t v114 = v46;
              __int16 v115 = 2112;
              uint64_t v116 = v37;
              _os_log_fault_impl( &dword_186681000,  v45,  OS_LOG_TYPE_FAULT,  "CoreData: %@: Unexpected move receipt state. It was not found on the server but the local row was not ma rked for cloud deletion. Why were we trying to access it? %@",  buf,  0x16u);
            }
          }
        }

        uint64_t v34 = [v33 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }

      while (v34);
    }

    if ([*(id *)(a1 + 48) save:&v110])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
      return;
    }

    uint64_t v81 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v90 = __ckLoggingOverride;
    uint64_t v91 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to recover from unknown item error due to a save failure after deleting move receipts: %@"];
    _NSCoreDataLog( v90 != 0,  v91,  v92,  v93,  v94,  v95,  v96,  v97,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
  }

  else
  {
    uint64_t v81 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v82 = __ckLoggingOverride;
    uint64_t v83 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to recover from unknown item error due to move receipt fetch error: %@"];
    _NSCoreDataLog( v82 != 0,  v83,  v84,  v85,  v86,  v87,  v88,  v89,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
  }

  objc_autoreleasePoolPop(v81);
}

void __62__NSCloudKitMirroringDelegate__handleError_duringShareAccept___block_invoke(void *a1)
{
  id v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult),  "initWithRequest:storeIdentifier:success:madeChanges:error:",  a1[4],  *(void *)(a1[5] + 168LL),  0LL,  0LL,  a1[6]);
  -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[5], (void *)a1[4], v2);
}

- (void)_postResetSyncNotificationWithName:(void *)a3 forError:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v7 setObject:a3 forKey:*MEMORY[0x189607798]];
  uint64_t v8 = (void *)[a3 domain];
  uint64_t v9 = [a3 code];
  if (![v8 isEqualToString:*MEMORY[0x189607460]])
  {
    uint64_t v10 = &unk_189F045A8;
    if (v9 > 27)
    {
      if (v9 != 112)
      {
        if (v9 != 28) {
          goto LABEL_15;
        }
        uint64_t v10 = &unk_189F045C0;
      }
    }

    else if (v9 == 21)
    {
      uint64_t v10 = &unk_189F045D8;
    }

    else if (v9 != 26)
    {
      goto LABEL_15;
    }

- (void)logResetSyncNotification:(id)a3
{
  id v14 = (id)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"%@: Sending '%@'", self, objc_msgSend(a3, "name")];
  uint64_t v4 = objc_msgSend( (id)objc_msgSend(a3, "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateResetSyncReasonKey");
  if (v4) {
    uint64_t v4 = [v14 appendFormat:@" with reason: '%@'", +[NSCloudKitMirroringDelegate stringForResetReason:]( NSCloudKitMirroringDelegate, "stringForResetReason:", objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateResetSyncReasonKey"), "unsignedIntegerValue"))];
  }
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](v4);
  BOOL v6 = __ckLoggingOverride != 0;
  uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@"];
  _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSCloudKitMirroringDelegate logResetSyncNotification:]");
  objc_autoreleasePoolPop(v5);
}

- (void)exporter:(id)a3 willScheduleOperations:(id)a4
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a4)
  {
    if (objc_msgSend(a4, "count", a3))
    {
      BOOL v6 = (void *)[MEMORY[0x189607958] defaultCenter];
      uint64_t v7 = @"operations";
      v8[0] = a4;
      objc_msgSend( v6,  "postNotificationName:object:userInfo:",  @"PFCloudKitWillExportNotificationName",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
    }
  }

- (void)managedObjectContextSaved:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"managedObjectContext");
  if (v5) {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }
  uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v8 = __ckLoggingOverride;
  }
  uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Observed context save: %@ - %@"];
  [a3 object];
  _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate managedObjectContextSaved:]");
  objc_autoreleasePoolPop(v7);
  if (!+[PFCloudKitHistoryAnalyzer isPrivateTransactionAuthor:]( PFCloudKitHistoryAnalyzer,  "isPrivateTransactionAuthor:",  [WeakRetained transactionAuthor])
    && !+[PFCloudKitHistoryAnalyzer isPrivateContextName:]( PFCloudKitHistoryAnalyzer,  "isPrivateContextName:",  [WeakRetained name]))
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    void v16[2] = __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke;
    v16[3] = &unk_189EAB0A8;
    v16[4] = self;
    void v16[5] = a3;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v16);
  }
}

void __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke(int8x16_t *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[0] + 128));
  uint64_t v3 = a1[2].i64[0];
  if (v3 && (uint64_t v4 = *(void *)(v3 + 8)) != 0) {
    uint64_t v5 = *(void **)(v4 + 88);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id Weak = objc_loadWeak((id *)(v3 + 120));
  id v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  void v8[2] = __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke_2;
  v8[3] = &unk_189EA7A38;
  v8[4] = v7;
  int8x16_t v9 = vextq_s8(a1[2], a1[2], 8uLL);
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v8);
}

void __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v28[0] = @"inserted_objectIDs";
    v28[1] = @"updated_objectIDs";
    v28[2] = @"deleted_objectIDs";
    uint64_t v3 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v28 count:3];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      BOOL v18 = v2;
      char v6 = 0;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v3);
          }
          int8x16_t v9 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "userInfo"),  "objectForKey:",  *(void *)(*((void *)&v23 + 1) + 8 * i));
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v20;
            do
            {
              uint64_t v13 = 0LL;
              do
              {
                if (*(void *)v20 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * v13) _storeIdentifier];
                uint64_t v15 = *(void *)(a1 + 32);
                if (v15) {
                  uint64_t v16 = *(void *)(v15 + 48);
                }
                else {
                  uint64_t v16 = 0LL;
                }
                if ([v14 isEqualToString:v16])
                {
                  char v6 = 1;
                  goto LABEL_21;
                }

                ++v13;
              }

              while (v11 != v13);
              uint64_t v17 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
              uint64_t v11 = v17;
            }

            while (v17);
          }

- (void)remoteStoreDidChange:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"storeURL");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"historyToken");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSStoreUUID");
  uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v9 = __ckLoggingOverride;
  }
  uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Observed remote store notification: %@ - %@ - %@ - %@"];
  [a3 object];
  _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]");
  objc_autoreleasePoolPop(v8);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke;
  void v17[3] = &unk_189EAB238;
  v17[4] = self;
  v17[5] = v7;
  v17[6] = v6;
  v17[7] = v5;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v17);
}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
    uint64_t v4 = *(void **)(v3 + 88);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id Weak = objc_loadWeak((id *)(v2 + 120));
  uint64_t v6 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
  uint64_t v7 = v6;
  if (v6) {
    id WeakRetained = objc_loadWeakRetained(v6 + 4);
  }
  else {
    id WeakRetained = 0LL;
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_2;
  v10[3] = &unk_189EAA790;
  v10[4] = v7;
  __int128 v11 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = v9;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v10);
}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_2(uint64_t *a1)
{
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    __int128 v24 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v25 = __ckLoggingOverride;
    }
    uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Ignoring remote change notification because the store has been removed from the coordinator: %@"];
    goto LABEL_32;
  }

  uint64_t v3 = a1[4];
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 48);
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (![v4 isEqualToString:a1[5]])
  {
    __int128 v24 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v25 = __ckLoggingOverride;
    }
    uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Ignoring remote change notification because it's for a different store: %@ / %@"];
    goto LABEL_32;
  }

  uint64_t v5 = (void *)a1[6];
  if (!v5)
  {
    __int128 v24 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v25 = __ckLoggingOverride;
    }
    uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Ignoring remote change notification because it didn't change any entities tracked by persistent history: %@"];
    goto LABEL_32;
  }

  uint64_t v6 = (void *)[v5 storeTokens];
  uint64_t v7 = a1[4];
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 48);
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = [v6 objectForKey:v8];
  if (!v9)
  {
    __int128 v24 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v25 = __ckLoggingOverride;
    }
    uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Ignoring remote change notification because it didn't change any entities in the monitored store: %@"];
LABEL_32:
    _NSCoreDataLog( v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
    objc_autoreleasePoolPop(v24);
    goto LABEL_33;
  }

  uint64_t v10 = v9;
  uint64_t v55 = 0LL;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 1;
  uint64_t v49 = 0LL;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3052000000LL;
  uint64_t v52 = __Block_byref_object_copy__39;
  uint64_t v53 = __Block_byref_object_dispose__39;
  uint64_t v54 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3052000000LL;
  uint64_t v46 = __Block_byref_object_copy__39;
  __int128 v47 = __Block_byref_object_dispose__39;
  uint64_t v48 = 0LL;
  __int128 v11 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
  v42[0] = MEMORY[0x1895F87A8];
  v42[1] = 3221225472LL;
  v42[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_3;
  v42[3] = &unk_189EA9D00;
  v42[4] = v2;
  v42[5] = v11;
  v42[6] = &v43;
  v42[7] = &v55;
  v42[8] = &v49;
  uint64_t v12 = -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", v42);
  if (*((_BYTE *)v56 + 24))
  {
    uint64_t v13 = (void *)objc_msgSend( (id)objc_msgSend((id)v50[5], "storeTokens"),  "objectForKey:",  objc_msgSend(v2, "identifier"));
    if (!v13 || [v13 compare:v10] == -1)
    {
      -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](a1[7], 0LL);
    }

    else
    {
      uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
      unint64_t v15 = __ckLoggingOverride;
      uint64_t v16 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Ignoring remote change notification because the exporter has already caught up to this transaction: %@ / %@ - %@"];
      if (v15 >= 9) {
        uint64_t v23 = 9LL;
      }
      else {
        uint64_t v23 = v15;
      }
      _NSCoreDataLog( v23,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
      objc_autoreleasePoolPop(v14);
    }
  }

  else
  {
    uint64_t v33 = (void *)MEMORY[0x186E3E5D8](v12);
    uint64_t v34 = __ckLoggingOverride;
    uint64_t v35 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Ignoring remote change notification because the current history token couldn't be read: %@ - %@"];
    _NSCoreDataLog( v34 != 0,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
    objc_autoreleasePoolPop(v33);
  }

  v50[5] = 0LL;
  v44[5] = 0LL;
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
LABEL_33:
}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateLastHistoryTokenKey",  *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    uint64_t v3 = (void *)MEMORY[0x186E3E5D8](*(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    BOOL v4 = __ckLoggingOverride != 0;
    uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to read the last history token: %@"];
    _NSCoreDataLog( v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_3");
    objc_autoreleasePoolPop(v3);
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = (id)[v2 transformedValue];
  }

- (void)newActivityWithIdentifier:(void *)a3 andVoucher:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = (void *)[objc_alloc((Class)getCloudKitCKSchedulerActivityClass[0]()) initWithIdentifier:a2 container:*(void *)(a1 + 48) priority:2];
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7) {
    BOOL v8 = *(unsigned __int8 *)(v7 + 17) != 0;
  }
  else {
    BOOL v8 = 0LL;
  }
  [v5 setOverrideRateLimiting:v8];
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (objc_msgSend((id)objc_msgSend(a3, "operationConfiguration"), "qualityOfService") == 9)
  {
    xpc_object_t v10 = xpc_string_create((const char *)*MEMORY[0x1895F86D8]);
    uint64_t v11 = (void *)MEMORY[0x1895F86D0];
  }

  else
  {
    xpc_object_t v12 = xpc_string_create((const char *)*MEMORY[0x1895F86E0]);
    objc_msgSend( v9,  "setObject:forKey:",  v12,  objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1895F86D0]));
    xpc_release(v12);
    xpc_object_t v10 = xpc_int64_create(10LL);
    uint64_t v11 = (void *)MEMORY[0x1895F8690];
  }

  objc_msgSend(v9, "setObject:forKey:", v10, objc_msgSend(NSString, "stringWithUTF8String:", *v11));
  xpc_release(v10);
  xpc_object_t v13 = xpc_int64_create(0LL);
  objc_msgSend( v9,  "setObject:forKey:",  v13,  objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1895F8688]));
  xpc_release(v13);
  xpc_object_t v14 = xpc_string_create((const char *)[*(id *)(a1 + 200) cStringUsingEncoding:4]);
  objc_msgSend( v9,  "setObject:forKey:",  v14,  objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1895F8698]));
  xpc_release(v14);
  [v6 setAdditionalXPCActivityCriteria:v9];

  return v6;
}

void __73__NSCloudKitMirroringDelegate_setupMirroringDelegateFromPushNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequestOptions);
  if ([*(id *)(*(void *)(a1 + 32) + 8) defaultOperationConfiguration]) {
    -[NSCloudKitMirroringRequestOptions setOperationConfiguration:]( v2,  "setOperationConfiguration:",  [*(id *)(*(void *)(a1 + 32) + 8) defaultOperationConfiguration]);
  }
  -[NSCloudKitMirroringDelegateSetupRequestOptions setFromNotification:](v2, "setFromNotification:", 1LL);
  uint64_t v3 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequest),  "initWithOptions:completionBlock:",  v2,  0LL);
  -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](*(void *)(a1 + 32), v3);
  uint64_t v24 = 0LL;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 160);
  }
  else {
    uint64_t v5 = 0LL;
  }
  BOOL v6 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](v5, (uint64_t)v3, &v24);
  uint64_t v7 = (void *)MEMORY[0x186E3E5D8]();
  if (v6)
  {
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Successfully enqueued setup request from push notification: %@"];
    _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[NSCloudKitMirroringDelegate setupMirroringDelegateFromPushNotification]_block_invoke");
    objc_autoreleasePoolPop(v7);
    -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](*(void *)(a1 + 32));
  }

  else
  {
    BOOL v16 = __ckLoggingOverride != 0;
    uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to enqueue setup request, this likely means one is already scheduled and this has collided: %@"];
    _NSCoreDataLog( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[NSCloudKitMirroringDelegate setupMirroringDelegateFromPushNotification]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }
}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[PFCloudKitStoreMonitor initForStore:]( objc_alloc(&OBJC_CLASS___PFCloudKitStoreMonitor),  "initForStore:",  objc_loadWeak((id *)(*(void *)(a1 + 32) + 120LL)));
  uint64_t v3 = v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained(v2 + 4);
  }
  else {
    id WeakRetained = 0LL;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_2;
  v6[3] = &unk_189EAB2B0;
  char v7 = *(_BYTE *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v3;
  __int16 v8 = *(_WORD *)(a1 + 49);
  v6[6] = v5;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v3, (uint64_t)v6);
}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Checking to see if an automated import should be scheduled."];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:a ndStartAfterDate:]_block_invoke_2");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 40));
  if (v11)
  {
    uint64_t v32 = 0LL;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    char v35 = 1;
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3052000000LL;
    uint64_t v29 = __Block_byref_object_copy__39;
    uint64_t v30 = __Block_byref_object_dispose__39;
    uint64_t v31 = 0LL;
    uint64_t v12 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 40));
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    void v23[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_3;
    v23[3] = &unk_189EAB288;
    char v24 = *(_BYTE *)(a1 + 56);
    __int16 v25 = *(_WORD *)(a1 + 57);
    void v23[4] = *(void *)(a1 + 32);
    v23[5] = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    v23[6] = v12;
    v23[7] = v13;
    v23[8] = &v32;
    v23[9] = &v26;
    -[NSManagedObjectContext performBlockAndWait:](v12, "performBlockAndWait:", v23);
    if (!*((_BYTE *)v33 + 24)) {
      -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](*(void *)(a1 + 32), (void *)v27[5]);
    }

    id v27[5] = 0LL;
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }

  else
  {
    uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v15 = __ckLoggingOverride;
    }
    uint64_t v16 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Cancelling import check because the store is dead."];
    _NSCoreDataLog( v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept :andStartAfterDate:]_block_invoke_2");
    objc_autoreleasePoolPop(v14);
  }
}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_3( uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v114 = *MEMORY[0x1895F89C0];
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 224) usableVoucherForEventType:1];
  v109[0] = 0LL;
  uint64_t v95 = v2;
  if (v2)
  {
    char v3 = objc_msgSend((id)objc_msgSend(v2, "operationConfiguration"), "qualityOfService") > 24;
    if (*(_BYTE *)(v1 + 80))
    {
      uint64_t v4 = (const __CFString *)[NSString stringWithFormat:@"Push-Voucher-%@", objc_msgSend(v95, "label")];
LABEL_10:
      int v5 = 1;
      goto LABEL_11;
    }
  }

  else
  {
    char v3 = 0;
    if (*(_BYTE *)(v1 + 80))
    {
      uint64_t v4 = @"Push";
      goto LABEL_10;
    }
  }

  if (*(_BYTE *)(v1 + 81))
  {
    uint64_t v4 = @"RecoverableImportError";
    goto LABEL_10;
  }

  if (*(_BYTE *)(v1 + 82))
  {
    uint64_t v4 = @"AcceptShare";
    goto LABEL_10;
  }

  uint64_t v51 = *(void *)(v1 + 32);
  if (v51) {
    uint64_t v52 = *(void **)(v51 + 8);
  }
  else {
    uint64_t v52 = 0LL;
  }
  uint64_t v53 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)NSCKDatabaseMetadata,  [v52 databaseScope],  *(void *)(v1 + 40),  *(void **)(v1 + 48),  (uint64_t)v109);
  uint64_t v54 = v53;
  if (v53)
  {
    if (-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:]( *(void *)(v1 + 32),  (void *)-[NSManagedObject lastFetchDate](v53, "lastFetchDate")))
    {
      uint64_t v4 = (const __CFString *)[NSString stringWithFormat:@"Database-LastFetchDate-%@", -[NSManagedObject lastFetchDate](v54, "lastFetchDate")];
      uint64_t v55 = *(void *)(*(void *)(v1 + 32) + 8LL);
      if (v55) {
        LOBYTE(v55) = *(_BYTE *)(v55 + 16) != 0;
      }
      v3 |= v55;
      goto LABEL_10;
    }

    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int16 v64 = (void *)-[NSManagedObject recordZones](v54, "recordZones");
    uint64_t v65 = [v64 countByEnumeratingWithState:&v105 objects:v113 count:16];
    char v94 = v3;
    uint64_t v100 = v1;
    if (v65)
    {
      char v66 = 0;
      uint64_t v4 = 0LL;
      id obj = v64;
      uint64_t v97 = *(void *)v106;
      while (1)
      {
        uint64_t v98 = v65;
        uint64_t v67 = 0LL;
        do
        {
          if (*(void *)v106 != v97) {
            objc_enumerationMutation(obj);
          }
          uint64_t v68 = *(void **)(*((void *)&v105 + 1) + 8 * v67);
          uint64_t v99 = v67;
          if ([v68 needsImport])
          {
            uint64_t v69 = [NSString stringWithFormat:@"Zone-%@", objc_msgSend(v68, "ckRecordZoneName")];
LABEL_52:
            uint64_t v4 = (const __CFString *)v69;
            char v66 = 1;
            goto LABEL_53;
          }

          if (-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:]( *(void *)(v100 + 32),  (void *)[v68 lastFetchDate]))
          {
            [v68 setNeedsImport:1];
            uint64_t v69 = [NSString stringWithFormat:@"Zone-LastFetchDate-%@-%@", objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v68, "lastFetchDate")];
            goto LABEL_52;
          }

          if ([*(id *)(*(void *)(v100 + 32) + 8) databaseScope] == 1)
          {
            __int128 v103 = 0u;
            __int128 v104 = 0u;
            __int128 v101 = 0u;
            __int128 v102 = 0u;
            uint64_t v70 = (void *)[v68 queries];
            uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v112 count:16];
            if (v71)
            {
              uint64_t v72 = *(void *)v102;
              do
              {
                for (uint64_t i = 0LL; i != v71; ++i)
                {
                  if (*(void *)v102 != v72) {
                    objc_enumerationMutation(v70);
                  }
                  uint64_t v74 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                  if ([v74 queryCursor])
                  {
                    [v68 setNeedsImport:1];
                    uint64_t v75 = [NSString stringWithFormat:@"Zone-QueryCursor-%@-%@", objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v74, "recordType")];
                  }

                  else
                  {
                    if (!-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:]( *(void *)(v100 + 32),  (void *)[v74 lastFetchDate])) {
                      continue;
                    }
                    [v68 setNeedsImport:1];
                    uint64_t v75 = [NSString stringWithFormat:@"Zone-QueryLastFetchDate-%@-%@-%@", objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v74, "recordType"), objc_msgSend(v74, "lastFetchDate")];
                  }

                  uint64_t v4 = (const __CFString *)v75;
                  char v66 = 1;
                }

                uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v112 count:16];
              }

              while (v71);
            }
          }

- (uint64_t)_dateExceedsSchedulingThreshold:(uint64_t)result
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (!a2) {
      return 1LL;
    }
    uint64_t v3 = result;
    BOOL v4 = +[NSCloudKitMirroringDelegate isFirstPartyContainerIdentifier:]( NSCloudKitMirroringDelegate,  "isFirstPartyContainerIdentifier:",  [*(id *)(result + 8) containerIdentifier]);
    uint64_t v5 = [*(id *)(v3 + 8) databaseScope];
    if ((unint64_t)(v5 - 2) >= 2)
    {
      if (v5 != 1)
      {
        uint64_t v10 = [NSString stringWithUTF8String:"Unsupported database scope in date threshold calculation: %ld"];
        uint64_t v11 = [*(id *)(v3 + 8) databaseScope];
        _NSCoreDataLog(17LL, v10, v12, v13, v14, v15, v16, v17, v11);
        uint64_t v18 = (os_log_s *)__pflogFaultLog;
        double v9 = -86400.0;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v20 = [*(id *)(v3 + 8) databaseScope];
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = v20;
          _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Unsupported database scope in date threshold calculation: %ld",  buf,  0xCu);
        }

        goto LABEL_15;
      }

      uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "containerID"), "environment");
      BOOL v7 = !v4;
      double v8 = -1800.0;
    }

    else
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "containerID"), "environment");
      BOOL v7 = !v4;
      double v8 = -300.0;
    }

    if (!v7) {
      double v8 = -86400.0;
    }
    if (v6 == 2) {
      double v9 = -60.0;
    }
    else {
      double v9 = v8;
    }
LABEL_15:
    [a2 timeIntervalSinceNow];
    return v9 > v19;
  }

  return result;
}

void __57__NSCloudKitMirroringDelegate_checkAndExecuteNextRequest__block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v60 = WeakRetained;
  if (WeakRetained)
  {
    id v2 = WeakRetained[20];
    uint64_t v3 = v2;
    if (v2 && *((void *)v2 + 12))
    {
      BOOL v4 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v5 = __ckLoggingOverride;
      }
      uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Deferring additional work. There is still an active request: %@"];
      _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v4);
      goto LABEL_34;
    }

    uint64_t v22 = (id *)-[NSCloudKitMirroringRequestManager dequeueNextRequest]((id *)v2);
    uint64_t v23 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v24 = __ckLoggingOverride;
    }
    if (v22)
    {
      uint64_t v25 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Executing: %@"];
      _NSCoreDataLog( v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v23);
      id v32 = v22[9];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v33 = (void *)[v32 endActivityForPhase:0 withError:0];
        objc_msgSend((id)objc_msgSend(v60[1], "progressProvider"), "publishActivity:", v33);
      }

      else if (v32)
      {
        uint64_t v41 = [NSString stringWithUTF8String:"I don't know how to handle this type of activity yet: %@"];
        _NSCoreDataLog(17LL, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v32);
        uint64_t v48 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v32;
          _os_log_fault_impl( &dword_186681000,  v48,  OS_LOG_TYPE_FAULT,  "CoreData: I don't know how to handle this type of activity yet: %@",  buf,  0xCu);
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(void *)buf = MEMORY[0x1895F87A8];
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke;
        uint64_t v62 = &unk_189EAB0A8;
        uint64_t v49 = (uint64_t)v60;
        uint64_t v63 = v60;
        __int16 v64 = v22;
        uint64_t v50 = @"com.apple.coredata.cloudkit.fetch.records";
        uint64_t v51 = @"CoreData: CloudKit Fetch Records";
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *(void *)buf = MEMORY[0x1895F87A8];
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&uint8_t buf[16] = __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke;
          uint64_t v62 = &unk_189EAB0A8;
          uint64_t v49 = (uint64_t)v60;
          uint64_t v63 = v60;
          __int16 v64 = v22;
          uint64_t v50 = @"com.apple.coredata.cloudkit.import";
          uint64_t v51 = @"CoreData: CloudKit Import";
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(void *)buf = MEMORY[0x1895F87A8];
            *(void *)&uint8_t buf[8] = 3221225472LL;
            *(void *)&uint8_t buf[16] = __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke;
            uint64_t v62 = &unk_189EAB0A8;
            uint64_t v49 = (uint64_t)v60;
            uint64_t v63 = v60;
            __int16 v64 = v22;
            uint64_t v50 = @"com.apple.coredata.cloudkit.export";
            uint64_t v51 = @"CoreData: CloudKit Export";
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(void *)buf = MEMORY[0x1895F87A8];
              *(void *)&uint8_t buf[8] = 3221225472LL;
              *(void *)&uint8_t buf[16] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke;
              uint64_t v62 = &unk_189EAB0A8;
              uint64_t v49 = (uint64_t)v60;
              uint64_t v63 = v60;
              __int16 v64 = v22;
              uint64_t v50 = @"com.apple.coredata.cloudkit.zone.reset";
              uint64_t v51 = @"CoreData: CloudKit Zone Reset";
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSCloudKitMirroringDelegate _performSetupRequest:]((uint64_t)v60, v22);
                }

                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[NSCloudKitMirroringDelegate _performDelegateResetRequest:]((uint64_t)v60, (uint64_t)v22);
                  }

                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      -[NSCloudKitMirroringDelegate _performSchemaInitializationRequest:]((uint64_t)v60, (uint64_t)v22);
                    }

                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        -[NSCloudKitMirroringDelegate _performSerializationRequest:]((uint64_t)v60, (uint64_t)v22);
                      }

                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          -[NSCloudKitMirroringDelegate _performExportProgressRequest:]((uint64_t)v60, (uint64_t)v22);
                        }

                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            -[NSCloudKitMirroringDelegate _performAcceptShareInvitationsRequest:]( (uint64_t)v60,  (uint64_t)v22);
                          }

                          else
                          {
                            uint64_t v52 = [NSString stringWithUTF8String:"%@: Asked to execute a request that isn't understood yet: %@"];
                            _NSCoreDataLog(17LL, v52, v53, v54, v55, v56, v57, v58, (uint64_t)v60);
                            uint64_t v59 = (os_log_s *)__pflogFaultLog;
                            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(void *)&uint8_t buf[4] = v60;
                              *(_WORD *)&_BYTE buf[12] = 2112;
                              *(void *)&buf[14] = v22;
                              _os_log_fault_impl( &dword_186681000,  v59,  OS_LOG_TYPE_FAULT,  "CoreData: %@: Asked to execute a request that isn't understood yet: %@",  buf,  0x16u);
                            }
                          }
                        }
                      }
                    }
                  }
                }

                goto LABEL_33;
              }

              *(void *)buf = MEMORY[0x1895F87A8];
              *(void *)&uint8_t buf[8] = 3221225472LL;
              *(void *)&uint8_t buf[16] = __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke;
              uint64_t v62 = &unk_189EAB0A8;
              uint64_t v49 = (uint64_t)v60;
              uint64_t v63 = v60;
              __int16 v64 = v22;
              uint64_t v50 = @"com.apple.coredata.cloudkit.metadata.reset";
              uint64_t v51 = @"CoreData: CloudKit Metadata Reset";
            }
          }
        }
      }

      -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v49,  (uint64_t)v50,  (uint64_t)v51,  (uint64_t)buf);
    }

    else
    {
      uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: No more requests to execute."];
      _NSCoreDataLog( v24,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v23);
    }

- (void)finishedAutomatedRequestWithResult:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  BOOL v4 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v5 = (unint64_t)__ckLoggingOverride >= 3 ? 3LL : __ckLoggingOverride;
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished request '%@' with result: %@"];
  [a2 request];
  _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:]");
  objc_autoreleasePoolPop(v4);
  if ([a2 success]) {
    return;
  }
  uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
  if (![v13 isEqualToString:*MEMORY[0x189607460]]
    || objc_msgSend((id)objc_msgSend(a2, "error"), "code") != 134409)
  {
    return;
  }

  uint64_t v14 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "userInfo");
  uint64_t v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "objectForKey:", *MEMORY[0x189607798]), "userInfo");
  uint64_t v16 = (void *)[v15 objectForKey:getCloudKitCKErrorRetryAfterKey[0]()];
  [v16 doubleValue];
  if (v17 <= 0.0)
  {
    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v18 = (void *)MEMORY[0x189603F50];
    [v16 doubleValue];
    uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
  }

  [a2 request];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v20 = 2LL;
  }

  else
  {
    [a2 request];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v20 = 1LL;
  }

  [*(id *)(a1 + 224) expireVouchersForEventType:v20];
LABEL_16:
  [a2 request];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v21 = *(void *)(a1 + 8);
    if (v21) {
      uint64_t v22 = *(void **)(v21 + 88);
    }
    else {
      uint64_t v22 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(a1 + 120));
    uint64_t v24 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v22,  (uint64_t)Weak);
    uint64_t v25 = v24;
    if (v24) {
      id WeakRetained = objc_loadWeakRetained(v24 + 4);
    }
    else {
      id WeakRetained = 0LL;
    }
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __66__NSCloudKitMirroringDelegate_finishedAutomatedRequestWithResult___block_invoke;
    v36[3] = &unk_189EA7A38;
    v36[4] = v25;
    v36[5] = a1;
    v36[6] = v19;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v25, (uint64_t)v36);
  }

  else
  {
    [a2 request];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(void *)&__int128 buf = MEMORY[0x1895F87A8];
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v38 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
      uint64_t v39 = &unk_189EAB2D8;
      __int16 v42 = 256;
      char v43 = 0;
      uint64_t v40 = a1;
      uint64_t v41 = v19;
      -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( a1,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)&buf);
    }

    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Can't handle automated requests of type '%@' yet."];
      [a2 request];
      uint64_t v28 = objc_opt_class();
      _NSCoreDataLog(17LL, v27, v29, v30, v31, v32, v33, v34, v28);
      uint64_t v35 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        [a2 request];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = objc_opt_class();
        _os_log_fault_impl( &dword_186681000,  v35,  OS_LOG_TYPE_FAULT,  "CoreData: Can't handle automated requests of type '%@' yet.",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

void __66__NSCloudKitMirroringDelegate_finishedAutomatedRequestWithResult___block_invoke(uint64_t *a1)
{
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    id v3 = v2;
    -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](a1[5], a1[6]);
    id v2 = v3;
  }
}

void __100__NSCloudKitMirroringDelegate__scheduleAutomatedImportWithLabel_activity_voucher_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  BOOL v4 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v5 = __ckLoggingOverride;
  }
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Finished automatic import - %@ - with result: %@"];
  _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v4);
  if (*(void *)(a1 + 48))
  {
    if (![a2 success]
      && (uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain"),
          [v13 isEqualToString:*MEMORY[0x189607460]])
      && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
    {
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    else
    {
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    v14();
  }

  -[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:](*(void *)(a1 + 32), a2);
}

uint64_t __100__NSCloudKitMirroringDelegate__scheduleAutomatedExportWithLabel_activity_voucher_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  BOOL v4 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v5 = __ckLoggingOverride;
  }
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Finished automatic export - %@ - with result: %@"];
  _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v4);
  if (*(void *)(a1 + 48))
  {
    if (![a2 success]
      && (uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain"),
          [v13 isEqualToString:*MEMORY[0x189607460]])
      && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
    {
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    else
    {
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    }

    v14();
  }

  return -[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:](*(void *)(a1 + 32), a2);
}

void __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke( uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Marking zones %@ needing recovery from Manatee identity loss"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  id v23 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 48));
  if (v23)
  {
    uint64_t v11 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 48));
    v24[0] = MEMORY[0x1895F87A8];
    v24[2] = __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke_2;
    void v24[3] = &unk_189EA8F90;
    uint64_t v26 = *(void *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    v24[4] = *(void *)(a1 + 40);
    v24[5] = v12;
    v24[1] = 3221225472LL;
    v24[6] = v11;
    v24[7] = v13;
    __int128 v25 = *(_OWORD *)(a1 + 64);
    -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", v24);
  }

  else
  {
    uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v15 = __ckLoggingOverride;
    }
    uint64_t v16 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Cancelling marking zones needing recovery from Manatee identity loss because the store is dead."];
    _NSCoreDataLog( v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:erro r:]_block_invoke_2");
    objc_autoreleasePoolPop(v14);
  }
}

uint64_t __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke_2( uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v34[0] = 0LL;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v31;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  *(void **)(*((void *)&v30 + 1) + 8 * v5),  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v34);
        uint64_t v7 = v6;
        if (!v6)
        {
          if (v34[0]) {
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v34[0];
          }
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          uint64_t v12 = [NSString stringWithUTF8String:"Failed to fetch zone metadata during marking zones needing recovery from Manatee identity loss: %@"];
          _NSCoreDataLog(17LL, v12, v13, v14, v15, v16, v17, v18, (uint64_t)v34[0]);
          uint64_t v19 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v36 = v34[0];
            _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to fetch zone metadata during marking zones needing recovery from Manatee identity loss: %@",  buf,  0xCu);
          }

          goto LABEL_20;
        }

        -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v6, "setNeedsRecoveryFromIdentityLoss:", 1LL);
        uint64_t v8 = (void *)-[NSManagedObject ckOwnerName](v7, "ckOwnerName");
        uint64_t v9 = *(void *)(a1 + 56);
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 152);
        }
        else {
          uint64_t v10 = 0LL;
        }
        if ((objc_msgSend(v8, "isEqualToString:", objc_msgSend(v10, "recordName")) & 1) == 0) {
          -[NSManagedObject setNeedsNewShareInvitation:](v7, "setNeedsNewShareInvitation:", 1LL);
        }
        ++v5;
      }

      while (v3 != v5);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v30 objects:v37 count:16];
      uint64_t v3 = v11;
      if (v11) {
        continue;
      }
      break;
    }
  }

void __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Executing schema initialization request: %@"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate _performSchemaInitializationRequest:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v11 + 89))
  {
    uint64_t v31 = 0LL;
    __int128 v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    char v34 = 0;
    uint64_t v25 = 0LL;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3052000000LL;
    uint64_t v28 = __Block_byref_object_copy__39;
    uint64_t v29 = __Block_byref_object_dispose__39;
    uint64_t v30 = 0LL;
    id v12 = *(id *)(v11 + 8);
    uint64_t v13 = v12;
    if (v12) {
      uint64_t v14 = (void *)*((void *)v12 + 11);
    }
    else {
      uint64_t v14 = 0LL;
    }
    id Weak = objc_loadWeak((id *)(*(void *)(a1 + 40) + 120LL));
    uint64_t v16 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v14,  (uint64_t)Weak);
    uint64_t v17 = v16;
    if (v16) {
      id WeakRetained = objc_loadWeakRetained(v16 + 4);
    }
    else {
      id WeakRetained = 0LL;
    }
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke_2;
    v21[3] = &unk_189EAB350;
    v21[4] = v17;
    v21[5] = v13;
    uint64_t v23 = &v31;
    uint64_t v24 = &v25;
    __int128 v22 = *(_OWORD *)(a1 + 32);
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v17, (uint64_t)v21);
    uint64_t v19 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringResult);
    uint64_t v20 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]( v19,  "initWithRequest:storeIdentifier:success:madeChanges:error:",  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 168LL),  *((unsigned __int8 *)v32 + 24),  *((unsigned __int8 *)v32 + 24),  v26[5]);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(void *)(a1 + 40), *(void **)(a1 + 32), v20);

    void v26[5] = 0LL;
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }

  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v11, *(void **)(a1 + 32));
  }

void __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    if ([*(id *)(a1 + 40) databaseScope] != 3)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 56);
      char v10 = [*(id *)(a1 + 48) schemaInitializationOptions];
      uint64_t v11 = *(void *)(a1 + 72);
      if (v9)
      {
        char v12 = v10;
        uint64_t v43 = *(void *)(v11 + 8);
        uint64_t v53 = 0LL;
        uint64_t v54 = &v53;
        uint64_t v55 = 0x2020000000LL;
        char v56 = 0;
        uint64_t v47 = 0LL;
        uint64_t v48 = &v47;
        uint64_t v49 = 0x3052000000LL;
        uint64_t v50 = __Block_byref_object_copy__39;
        uint64_t v51 = __Block_byref_object_dispose__39;
        uint64_t v52 = 0LL;
        uint64_t v13 = -[PFCloudKitSchemaGenerator initWithMirroringOptions:forStoreInMonitor:]( objc_alloc(&OBJC_CLASS___PFCloudKitSchemaGenerator),  "initWithMirroringOptions:forStoreInMonitor:",  *(void *)(v9 + 8),  v8);
        uint64_t v14 = (void *)-[PFCloudKitSchemaGenerator newRepresentativeRecords:]((uint64_t)v13, v48 + 5);
        if (v14)
        {
          if ((v12 & 4) != 0)
          {
            uint64_t v15 = (void *)MEMORY[0x186E3E5D8]();
            BOOL v16 = __ckLoggingOverride != 0;
            uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ generated the following records for the model associated with the store: %@\n%@"];
            uint64_t v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            _NSCoreDataLog( v16,  v17,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSCloudKitMirroringDelegate _createSchemaForStore:withMonitor:options:error:]");
            objc_autoreleasePoolPop(v15);
          }

          if ((v12 & 2) != 0)
          {
            *((_BYTE *)v54 + 24) = 1;
          }

          else
          {
            uint64_t v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v14, "count"));
            v46[0] = MEMORY[0x1895F87A8];
            v46[1] = 3221225472LL;
            v46[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke;
            v46[3] = &unk_189EAB378;
            v46[4] = v25;
            [v14 enumerateObjectsUsingBlock:v46];
            uint64_t v26 = dispatch_semaphore_create(0LL);
            uint64_t v27 = (void *)[objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()) initWithRecordsToSave:v14 recordIDsToDelete:0];
            v45[0] = MEMORY[0x1895F87A8];
            v45[1] = 3221225472LL;
            void v45[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_2;
            v45[3] = &unk_189EA9E68;
            v45[6] = &v53;
            v45[7] = &v47;
            v45[4] = v25;
            v45[5] = v26;
            [v27 setModifyRecordsCompletionBlock:v45];
            [*(id *)(v9 + 56) addOperation:v27];
            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

            if (*((_BYTE *)v54 + 24))
            {
              id v28 = (id)[v25 allObjects];
              *((_BYTE *)v54 + 24) = 0;
              uint64_t v29 = (void *)[objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()) initWithRecordsToSave:0 recordIDsToDelete:v28];
              v44[0] = MEMORY[0x1895F87A8];
              v44[1] = 3221225472LL;
              v44[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_4;
              v44[3] = &unk_189EA9E68;
              v44[6] = &v53;
              v44[7] = &v47;
              v44[4] = v25;
              v44[5] = v26;
              [v29 setModifyRecordsCompletionBlock:v44];

              [*(id *)(v9 + 56) addOperation:v29];
              dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            }

            if (v26) {
              dispatch_release(v26);
            }
          }
        }

        else
        {
          id v30 = (id)v48[5];
        }

        id v31 = (id)v48[5];
        if (!*((_BYTE *)v54 + 24))
        {
          uint64_t v32 = v48[5];
          if (v32)
          {
            *(void *)(v43 + 40) = v32;
          }

          else
          {
            uint64_t v33 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog( 17LL,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
            uint64_t v40 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__int128 buf = 136315394;
              uint64_t v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
              __int16 v63 = 1024;
              int v64 = 3960;
              _os_log_fault_impl( &dword_186681000,  v40,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
            }
          }
        }

        int v41 = *((unsigned __int8 *)v54 + 24);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v53, 8);
        if (v41)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
          goto LABEL_27;
        }

        uint64_t v11 = *(void *)(a1 + 72);
      }

      id v42 = *(id *)(*(void *)(v11 + 8) + 40LL);
      goto LABEL_27;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v3 = objc_alloc(MEMORY[0x189607870]);
    v59[0] = *MEMORY[0x1896075F0];
    v60[0] = [NSString stringWithFormat:@"Request '%@' was skipped because it was configured with databaseScope == CKDatabaseShared.", objc_msgSend(*(id *)(a1 + 48), "requestIdentifier")];
    v59[1] = *MEMORY[0x1896074F8];
    v60[1] = objc_msgSend((id)objc_msgSend(v2, "URL"), "path");
    uint64_t v4 = [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:2];
    uint64_t v5 = [v3 initWithDomain:*MEMORY[0x189607460] code:134419 userInfo:v4];
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v6 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v57 = *MEMORY[0x1896075F0];
    uint64_t v58 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 48), "requestIdentifier")];
    uint64_t v7 = [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    uint64_t v5 = [v6 initWithDomain:*MEMORY[0x189607460] code:134407 userInfo:v7];
  }

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v5;
LABEL_27:
}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "recordID"));
}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_3;
  v9[3] = &unk_189EAB378;
  void v9[4] = v7;
  [a2 enumerateObjectsUsingBlock:v9];
  else {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_3( uint64_t a1,  void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "recordID"));
}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v6 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  int v7 = [*(id *)(a1 + 32) isEqualToSet:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (v7)
  {
    *(_BYTE *)(v8 + 24) = 1;
  }

  else
  {
    *(_BYTE *)(v8 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)eventUpdated:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  id v6 = (void *)[MEMORY[0x189607958] defaultCenter];
  int v7 = @"event";
  v8[0] = a3;
  objc_msgSend( v6,  "postNotificationName:object:userInfo:",  @"NSPersistentCloudKitContainerEventChangedNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  objc_autoreleasePoolPop(v5);
}

- (void)publishActivity:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  int v7 = (void *)[a3 createDictionaryRepresentation];
  [v6 setObject:v7 forKey:@"activityDictionary"];
  objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSPersistentCloudKitContainerActivityChangedNotificationName",  self,  v6);

  objc_autoreleasePoolPop(v5);
}

- (void)addActivityVoucher:(id)a3
{
  uint64_t v5 = (void *)NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [v5 stringWithFormat:@"CoreData: %@ Apply", NSStringFromClass(v6)];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  void v8[2] = __50__NSCloudKitMirroringDelegate_addActivityVoucher___block_invoke;
  v8[3] = &unk_189EAB0A8;
  v8[4] = self;
  void v8[5] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.voucher.apply",  v7,  (uint64_t)v8);
}

void __50__NSCloudKitMirroringDelegate_addActivityVoucher___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "operationConfiguration"), "qualityOfService") >= 25)
  {
    uint64_t v2 = [*(id *)(a1 + 40) eventType];
    if (v2 == 2)
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( *(void *)(a1 + 32),  (uint64_t)@"VoucherImmediateExport",  0LL,  *(void *)(a1 + 40),  0LL);
    }

    else if (v2 == 1)
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]( *(void *)(a1 + 32),  (uint64_t)@"VoucherImmediateImport",  0LL,  *(void *)(a1 + 40),  0LL);
    }
  }

- (void)expireActivityVoucher:(id)a3
{
  uint64_t v5 = (void *)NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [v5 stringWithFormat:@"CoreData: %@ Expire", NSStringFromClass(v6)];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  void v8[2] = __53__NSCloudKitMirroringDelegate_expireActivityVoucher___block_invoke;
  v8[3] = &unk_189EAB0A8;
  v8[4] = self;
  void v8[5] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.voucher.expire",  v7,  (uint64_t)v8);
}

uint64_t __53__NSCloudKitMirroringDelegate_expireActivityVoucher___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) expireVoucher:*(void *)(a1 + 40)];
}

+ (id)stringForResetReason:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 - 1 < 7) {
    return off_189EAB440[a3 - 1];
  }
  uint64_t v5 = [NSString stringWithUTF8String:"Can't generate string for unknown reset sync reason: %lu"];
  _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, a3);
  char v12 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v14 = a3;
    _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: Can't generate string for unknown reset sync reason: %lu",  buf,  0xCu);
  }

  return 0LL;
}

+ (BOOL)isFirstPartyContainerIdentifier:(id)a3
{
  return [a3 containsString:@"com.apple."];
}

- (void)_disableAutomaticExports
{
  if (self)
  {
    if (self->_currentUserRecordID)
    {
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  self,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  0);
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  self,  @"com.apple.coredata.NSPersistentStoreRemoteChangeNotification.remotenotification",  0);
    }
  }

- (void)_enableAutomaticExports
{
  if (self)
  {
    if (self->_currentUserRecordID)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observedCoordinator);
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel_managedObjectContextSaved_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  WeakRetained);
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel_remoteStoreDidChange_,  @"NSPersistentStoreRemoteChangeNotification",  WeakRetained);
      -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:]((uint64_t)self, 0LL);
    }
  }

- (void)applicationStateMonitorEnteredBackground:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke;
  v3[3] = &unk_189EAB260;
  v3[4] = self;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v3);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128LL));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && (uint64_t v4 = *(void *)(v3 + 8)) != 0) {
    uint64_t v5 = *(void **)(v4 + 88);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id Weak = objc_loadWeak((id *)(v3 + 120));
  id v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke_2;
  v9[3] = &unk_189EA7648;
  uint64_t v8 = *(void *)(a1 + 32);
  void v9[4] = v7;
  void v9[5] = v8;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v9);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke_2(uint64_t a1)
{
  id v11 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v11)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( *(void *)(a1 + 40),  (uint64_t)@"AppDeactivationExport",  0LL,  0LL,  0LL);
  }

  else
  {
    uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Ignoring application deactivation notification because the store is dead."];
    _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorEnteredBackground:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
  }
}

- (void)applicationStateMonitorEnteredForeground:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke;
  v3[3] = &unk_189EAB260;
  v3[4] = self;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( (uint64_t)self,  (uint64_t)@"com.apple.coredata.cloudkit.schedule",  (uint64_t)@"CoreData: CloudKit Scheduling",  (uint64_t)v3);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128LL));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && (uint64_t v4 = *(void *)(v3 + 8)) != 0) {
    uint64_t v5 = *(void **)(v4 + 88);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id Weak = objc_loadWeak((id *)(v3 + 120));
  id v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke_2;
  v9[3] = &unk_189EA7648;
  uint64_t v8 = *(void *)(a1 + 32);
  void v9[4] = v7;
  void v9[5] = v8;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v9);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke_2(uint64_t a1)
{
  id v11 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v11)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]( *(void *)(a1 + 40),  (uint64_t)@"AppActivationExport",  0LL,  0LL,  0LL);
    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]( *(void *)(a1 + 40),  (uint64_t)@"AppActivationImport",  0LL,  0LL,  0LL);
  }

  else
  {
    uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Ignoring application activation notification because the store is dead."];
    _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorEnteredForeground:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
  }
}

- (void)applicationStateMonitorExpiredBackgroundActivityTimeout:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8](self, a2, a3);
  else {
    uint64_t v5 = __ckLoggingOverride;
  }
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Deferring active request due to background timeout: %@"];
  _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorExpiredBackgroundActivityTimeout:]");
  objc_autoreleasePoolPop(v4);
  requestManager = self->_requestManager;
  if (requestManager)
  {
    activeRequest = requestManager->_activeRequest;
    if (activeRequest) {
      activeRequest->_deferredByBackgroundTimeout = 1;
    }
  }

- (PFApplicationStateMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (BOOL)registeredForSubscription
{
  return self->_registeredForSubscription;
}

- (BOOL)registeredExportActivityHandler
{
  return self->_registeredExportActivityHandler;
}

- (BOOL)registeredImportActivityHandler
{
  return self->_registeredImportActivityHandler;
}

- (BOOL)registeredSetupActivityHandler
{
  return self->_registeredSetupActivityHandler;
}

- (void).cxx_destruct
{
}

+ (void)printMetadataForStoreAtURL:(id)a3 withConfiguration:(id)a4 operateOnACopy:(BOOL)a5
{
  BOOL v5 = a5;
  v59[1] = *MEMORY[0x1895F89C0];
  uint64_t v46 = 0LL;
  uint64_t v51 = @"NSReadOnlyPersistentStoreOption";
  uint64_t v8 = (const __CFString *)MEMORY[0x189604A88];
  uint64_t v52 = MEMORY[0x189604A88];
  id v9 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  a3,  [MEMORY[0x189603F68] dictionaryWithObjects:&v52 forKeys:&v51 count:1],  &v46);
  if (!v9)
  {
    fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Unable to load model from store: %@\n%@", a3, v46), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    return;
  }

  id v42 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v9);
  objc_opt_self();
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  uint64_t v58 = v8;
  v59[0] = 0LL;
  uint64_t v57 = @"NSReadOnlyPersistentStoreOption";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  uint64_t v10 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v42,  "addPersistentStoreWithType:configuration:URL:options:error:");
  if (!v10)
  {
    unint64_t v14 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v15 = (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to open store: %@\n%@", a3, v59[0]), "UTF8String"];
LABEL_12:
    fputs(v15, v14);
    goto LABEL_13;
  }

  *(void *)__int128 buf = MEMORY[0x1895F87A8];
  *(void *)&uint8_t buf[8] = 3221225472LL;
  *(void *)&uint8_t buf[16] = __122__NSCloudKitMirroringDelegate___CLI__checkForCloudKitTablesInStoreAtURL_withPersistentStoreCoordinator_withConfiguration___block_invoke;
  uint64_t v54 = &unk_189EA9938;
  uint64_t v55 = &v47;
  uint64_t v11 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  buf,  0LL,  v10);
  -[NSSQLCore dispatchRequest:withRetries:](v10, v11, 0LL);
  uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
  if (v11)
  {
    exception = v11->super._exception;
    if (exception || (exception = v11->super._error) != 0LL) {
      fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Attepmting to check for CloudKit tables failed: %@\n%@", a3, exception), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    }
  }

  if (!-[NSPersistentStoreCoordinator removePersistentStore:error:](v42, "removePersistentStore:error:", v10, v59))
  {
    unint64_t v14 = *v12;
    uint64_t v15 = (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to tear down read-only store: %@\n%@", a3, v59[0]), "UTF8String"];
    goto LABEL_12;
  }

void __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"event");
  if (v4)
  {
    BOOL v5 = v4;
    if (![v4 type] && objc_msgSend(v5, "endDate"))
    {
      if ([v5 succeeded])
      {
        if (![v5 error]) {
          goto LABEL_11;
        }
        uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "Error was non-nil, but expected nil");
        _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v30);
        uint64_t v13 = (os_log_s *)__pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
          goto LABEL_11;
        }
        *(_WORD *)__int128 buf = 0;
        unint64_t v14 = "CoreData: Error was non-nil, but expected nil";
      }

      else
      {
        uint64_t v23 = [NSString stringWithUTF8String:"Success was NO but expected YES"];
        _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, v30);
        uint64_t v13 = (os_log_s *)__pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
LABEL_11:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
          return;
        }

        *(_WORD *)__int128 buf = 0;
        unint64_t v14 = "CoreData: Success was NO but expected YES";
      }

      _os_log_fault_impl(&dword_186681000, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Missing event %@"];
    _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
    uint64_t v22 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      BOOL v32 = a2;
      _os_log_fault_impl(&dword_186681000, v22, OS_LOG_TYPE_FAULT, "CoreData: Missing event %@", buf, 0xCu);
    }
  }

uint64_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_12( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = result;
  if (a3)
  {
    fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to load persistent store at url: %@\n%@", *(void *)(result + 32), a3), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    *(_BYTE *)(*(void *)(*(void *)(v3 + 48) + 8LL) + 24LL) = 0;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 40));
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL) = 1;
  }

  return result;
}

uint64_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_2( uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v48 = 0LL;
  uint64_t v1 = (void *)objc_msgSend( *(id *)(a1 + 32),  "executeFetchRequest:error:",  +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMetadataEntry entityPath](NSCKMetadataEntry, "entityPath")),  &v48);
  if (v1)
  {
    uint64_t v2 = v1;
    if ([v1 count])
    {
      fputs( (const char *)objc_msgSend( (id)objc_msgSend(NSString, "stringWithFormat:", @"CloudKit Metadata:\n"),  "UTF8String"),  (FILE *)*MEMORY[0x1895F89E0]);
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id obj = (id)[v2 sortedArrayUsingComparator:&__block_literal_global_28];
      uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v45;
        do
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            if (*(void *)v45 != v5) {
              objc_enumerationMutation(obj);
            }
            uint64_t v7 = *(__CFString **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v8 = -[NSCKMetadataEntry describeValue](v7);
            if (-[__CFString containsString:](v8, "containsString:", @"\n")) {
              uint64_t v8 = (__CFString *)objc_msgSend( @"\n\t\t",  "stringByAppendingString:",  -[__CFString stringByReplacingOccurrencesOfString:withString:]( v8,  "stringByReplacingOccurrencesOfString:withString:",  @"\n",  @"\n\t\t"));
            }
            fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"\t%@: %@\n", -[__CFString key](v7, "key"), v8), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
          }

          uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
        }

        while (v4);
      }
    }
  }

  else
  {
    fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to fetch metadata entries:\n%@", v48), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
  }

  uint64_t v9 = (void *)objc_msgSend( *(id *)(a1 + 32),  "executeFetchRequest:error:",  +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKDatabaseMetadata entityPath](NSCKDatabaseMetadata, "entityPath")),  &v48);
  if (!v9) {
    return fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to fetch database metadata entries:\n%@", v48), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
  }
  id v28 = v9;
  uint64_t result = [v9 count];
  if (result)
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t result = [v28 countByEnumeratingWithState:&v40 objects:v50 count:16];
    uint64_t v30 = result;
    if (result)
    {
      uint64_t v29 = *(void *)v41;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v28);
          }
          uint64_t v31 = v11;
          uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
          uint64_t v13 = (FILE *)*MEMORY[0x1895F89E0];
          unint64_t v14 = (void *)NSString;
          uint64_t v15 = [v12 databaseName];
          uint64_t v16 = [v12 databaseScope];
          else {
            uint64_t v17 = @"NO";
          }
          fputs( (const char *)[(id)objc_msgSend( v14 stringWithFormat:@"Database: %@ (%ld): hasSubscription: %@, currentChangeToken: %@\n", v15, v16, v17, objc_msgSend(v12, "currentChangeToken")), "UTF8String"],  v13);
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v33 = (id)[v12 recordZones];
          uint64_t v18 = [v33 countByEnumeratingWithState:&v36 objects:v49 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            id obja = *(id *)v37;
            do
            {
              for (uint64_t j = 0LL; j != v19; ++j)
              {
                if (*(id *)v37 != obja) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v21 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                uint64_t v22 = (FILE *)*MEMORY[0x1895F89E0];
                uint64_t v23 = (void *)NSString;
                uint64_t v24 = [v21 ckRecordZoneName];
                uint64_t v25 = [v21 ckOwnerName];
                uint64_t v26 = @"NO";
                else {
                  uint64_t v27 = @"NO";
                }
                fputs( (const char *)[(id)objc_msgSend( v23 stringWithFormat:@"\tZone: %@:%@: hasRecordZone: %@, hasSubscription: %@, currentChangeToken: %@\n", v24, v25, v27, v26, objc_msgSend(v21, "currentChangeToken")), "UTF8String"],  v22);
              }

              uint64_t v19 = [v33 countByEnumeratingWithState:&v36 objects:v49 count:16];
            }

            while (v19);
          }

          uint64_t v11 = v31 + 1;
        }

        while (v31 + 1 != v30);
        uint64_t result = [v28 countByEnumeratingWithState:&v40 objects:v50 count:16];
        uint64_t v30 = result;
      }

      while (result);
    }
  }

  return result;
}

uint64_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "key"), "localizedCaseInsensitiveCompare:", objc_msgSend(a3, "key"));
}

+ (void)printRepresentativeSchemaForModelAtURL:(id)a3 orStoreAtURL:(id)a4 withConfiguration:(id)a5
{
  id v6 = a4;
  v32[1] = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  if (a3)
  {
    uint64_t v8 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  a3);
  }

  else
  {
    if (!a4)
    {
      uint64_t v20 = 0LL;
      goto LABEL_20;
    }

    uint64_t v31 = @"NSReadOnlyPersistentStoreOption";
    v32[0] = MEMORY[0x189604A88];
    uint64_t v8 = (NSManagedObjectModel *) +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  a4,  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1],  &v30);
  }

  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v20 = v30;
LABEL_20:
    fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to load a managed object model. Arguments:\nstoreURL: %@\nmodelURL: %@\nEncountered error: %@", v6, a3, v20), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    uint64_t v9 = 0LL;
    goto LABEL_25;
  }

  if (!v6)
  {
    id v6 = (id)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByAppendingPathComponent:]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  @"cdutil"),  "stringByAppendingPathComponent:",  objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString")));
    if (!+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:wipeIfExists:error:]( NSCloudKitMirroringDelegate,  "checkAndCreateDirectoryAtURL:wipeIfExists:error:",  [v6 URLByDeletingLastPathComponent],  0,  &v30))
    {
      fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to create temporary directory: %@", v30), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
      goto LABEL_25;
    }

    if (!v6) {
      goto LABEL_25;
    }
  }

  uint64_t v10 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v9);
  uint64_t v11 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateOptions),  "initWithContainerIdentifier:",  @"cdutil-stub-container");
  uint64_t v12 = v11;
  if (v11) {
    v11->_skipCloudKitSetup = 1;
  }
  uint64_t v13 = -[NSCloudKitMirroringDelegate initWithOptions:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegate),  "initWithOptions:",  v11);
  unint64_t v14 = -[NSPersistentStoreDescription initWithURL:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreDescription),  "initWithURL:",  v6);
  -[NSPersistentStoreDescription setType:](v14, "setType:", @"SQLite");
  -[NSPersistentStoreDescription setConfiguration:](v14, "setConfiguration:", a5);
  -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v14, "setShouldMigrateStoreAutomatically:", 1LL);
  -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:]( v14,  "setShouldInferMappingModelAutomatically:",  1LL);
  -[NSPersistentStoreDescription setMirroringDelegate:](v14, "setMirroringDelegate:", v13);
  -[NSPersistentStoreDescription setOption:forKey:]( v14,  "setOption:forKey:",  MEMORY[0x189604A88],  @"NSPersistentHistoryTrackingKey");
  uint64_t v15 = dispatch_semaphore_create(0LL);
  uint64_t v16 = (void *)[MEMORY[0x189607958] defaultCenter];
  uint64_t v17 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  id v29[2] = __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke;
  v29[3] = &unk_189EA9708;
  v29[4] = v15;
  uint64_t v18 = [v16 addObserverForName:@"PFCloudKitDidSetupNotificationName" object:v13 queue:0 usingBlock:v29];
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  v24[0] = v17;
  v24[1] = 3221225472LL;
  v24[2] = __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_62;
  void v24[3] = &unk_189EAB5B8;
  v24[4] = v6;
  v24[5] = &v25;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:]( v10,  "addPersistentStoreWithDescription:completionHandler:",  v14,  v24);
  dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_semaphore_wait(v15, v19))
  {
    *((_BYTE *)v26 + 24) = 0;
    fputs( (const char *)objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"Timed out waiting for the mirroring delegate to finish setting up. This is a bug. Please re-run and attach a sample of cdutil if you can."),  "UTF8String"),  (FILE *)*MEMORY[0x1895F89D0]);
  }

  else
  {
    *((_BYTE *)v26 + 24) = 1;
  }

  objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "removeObserver:", v18);
  if (*((_BYTE *)v26 + 24))
  {
    id v21 = -[PFCloudKitStoreMonitor initForStore:]( objc_alloc(&OBJC_CLASS___PFCloudKitStoreMonitor),  "initForStore:",  -[NSArray lastObject]( -[NSPersistentStoreCoordinator persistentStores](v10, "persistentStores"),  "lastObject"));
    uint64_t v22 = -[PFCloudKitSchemaGenerator initWithMirroringOptions:forStoreInMonitor:]( objc_alloc(&OBJC_CLASS___PFCloudKitSchemaGenerator),  "initWithMirroringOptions:forStoreInMonitor:",  v12,  v21);
    uint64_t v23 = (void *)-[PFCloudKitSchemaGenerator newRepresentativeRecords:]((uint64_t)v22, &v30);
    if (v23)
    {
      fputs( (const char *)objc_msgSend( (id)objc_msgSend(NSString, "stringWithFormat:", @"Generated records:\n"),  "UTF8String"),  (FILE *)*MEMORY[0x1895F89E0]);
      [v23 enumerateObjectsUsingBlock:&__block_literal_global_68];
    }

    else
    {
      *((_BYTE *)v26 + 24) = 0;
      fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to generate records: %@", v30), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    }
  }

  _Block_object_dispose(&v25, 8);
LABEL_25:
}

uint64_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKeyedSubscript:", @"result");
  if ([v3 success])
  {
    if ([v3 error])
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "Error was non-nil, but expected nil");
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v22);
      uint64_t v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v12 = "CoreData: Error was non-nil, but expected nil";
        uint64_t v13 = (uint8_t *)&v22;
LABEL_8:
        _os_log_fault_impl(&dword_186681000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
      }
    }
  }

  else
  {
    uint64_t v14 = [NSString stringWithUTF8String:"Success was NO but expected YES"];
    _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, v22);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      uint64_t v12 = "CoreData: Success was NO but expected YES";
      uint64_t v13 = buf;
      goto LABEL_8;
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_62( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = result;
  if (a3)
  {
    uint64_t result = fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to load persistent store at url: %@\n%@", *(void *)(result + 32), a3), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
    char v4 = 0;
  }

  else
  {
    char v4 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(v3 + 40) + 8LL) + 24LL) = v4;
  return result;
}

uint64_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_2( uint64_t a1,  void *a2)
{
  return fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@\n", objc_msgSend(a2, "description")), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
}

+ (BOOL)checkAndCreateDirectoryAtURL:(id)a3 wipeIfExists:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v12 = 0LL;
  uint64_t v8 = (void *)[MEMORY[0x1896078A8] defaultManager];
  char v11 = 0;
  if (v11 && !v6) {
    return 1;
  }
  if ([v8 removeItemAtURL:a3 error:&v12])
  {
LABEL_6:
    BOOL v9 = 1;
    if ([v8 createDirectoryAtURL:a3 withIntermediateDirectories:1 attributes:0 error:&v12]) {
      return v9;
    }
  }

  BOOL v9 = 0;
  if (a5 && v12)
  {
    BOOL v9 = 0;
    *a5 = v12;
  }

  return v9;
}

uint64_t __122__NSCloudKitMirroringDelegate___CLI__checkForCloudKitTablesInStoreAtURL_withPersistentStoreCoordinator_withConfiguration___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(a2 + 24);
    if (result) {
      uint64_t result = -[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)@"ANSCKMIRROREDRELATIONSHIP", 0);
    }
  }

  else
  {
    uint64_t result = 0LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5
{
  return +[NSCloudKitMirroringDelegate checkIfContentsOfStore:matchContentsOfStore:onlyCompareSharedZones:error:]( &OBJC_CLASS___NSCloudKitMirroringDelegate,  "checkIfContentsOfStore:matchContentsOfStore:onlyCompareSharedZones:error:",  a3,  a4,  0LL,  a5);
}

+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 onlyCompareSharedZones:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = -[PFCloudKitStoreComparer initWithStore:otherStore:]( objc_alloc(&OBJC_CLASS___PFCloudKitStoreComparer),  "initWithStore:otherStore:",  a3,  a4);
  -[PFCloudKitStoreComparer setOnlyCompareSharedZones:](v8, "setOnlyCompareSharedZones:", v7);
  LOBYTE(a6) = -[PFCloudKitStoreComparer ensureContentsMatch:](v8, "ensureContentsMatch:", a6);

  return (char)a6;
}

+ (BOOL)traceObjectMatchingValue:(id)a3 atKeyPath:(id)a4 inStores:(id)a5 startingAt:(id)a6 endingAt:(id)a7 error:(id *)a8
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  uint64_t v57 = 0LL;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3052000000LL;
  uint64_t v60 = __Block_byref_object_copy__42;
  uint64_t v61 = __Block_byref_object_dispose__42;
  uint64_t v62 = 0LL;
  uint64_t v53 = 0LL;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  char v56 = 1;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v47 = [a5 countByEnumeratingWithState:&v49 objects:v77 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v50;
    uint64_t v42 = *MEMORY[0x189607460];
    uint64_t v43 = *MEMORY[0x1896075F0];
    do
    {
      for (uint64_t i = 0LL; i != v47; ++i)
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(a5);
        }
        uint64_t v9 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v75 = @"NSReadOnlyPersistentStoreOption";
        uint64_t v76 = MEMORY[0x189604A88];
        uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        id v12 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v9,  v11,  v58 + 5);
        if (!v12)
        {
          *((_BYTE *)v54 + 24) = 0;
          int v22 = 2;
          goto LABEL_19;
        }

        uint64_t v13 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v12);
        v73[0] = @"NSReadOnlyPersistentStoreOption";
        v73[1] = @"NSCloudKitMirroringDelegateReadOnlyOptionKey";
        v74[0] = MEMORY[0x189604A88];
        v74[1] = MEMORY[0x189604A88];
        v73[2] = @"NSPersistentHistoryTrackingKey";
        v74[2] = MEMORY[0x189604A88];
        uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:3];
        uint64_t v15 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v13,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  v9,  v14,  v58 + 5);
        if (!v15) {
          goto LABEL_17;
        }
        uint64_t v16 = (void *)[a4 componentsSeparatedByString:@"."];
        if ([v16 count] != 2)
        {
          id v23 = objc_alloc(MEMORY[0x189607870]);
          uint64_t v67 = v43;
          uint64_t v68 = [NSString stringWithFormat:@"Unable to parse provided keypath. Expected two components when split by '.': %@", a4];
          uint64_t v24 = objc_msgSend( v23,  "initWithDomain:code:userInfo:",  v42,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
LABEL_16:
          v58[5] = v24;
LABEL_17:
          *((_BYTE *)v54 + 24) = 0;
          goto LABEL_18;
        }

        uint64_t v17 = [v16 objectAtIndexedSubscript:0];
        uint64_t v18 = [v16 objectAtIndexedSubscript:1];
        id v19 = -[NSDictionary objectForKeyedSubscript:]( -[NSManagedObjectModel entitiesByName]( -[NSPersistentStoreCoordinator managedObjectModel](v13, "managedObjectModel"),  "entitiesByName"),  "objectForKeyedSubscript:",  v17);
        if (!v19)
        {
          id v25 = objc_alloc(MEMORY[0x189607870]);
          uint64_t v69 = v43;
          uint64_t v70 = [NSString stringWithFormat:@"Unable to parse provided keypath. An entity named '%@' could not be found in the model for the store: %@", v17, v9];
          uint64_t v24 = objc_msgSend( v25,  "initWithDomain:code:userInfo:",  v42,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          goto LABEL_16;
        }

        uint64_t v20 = objc_msgSend((id)objc_msgSend(v19, "attributesByName"), "objectForKeyedSubscript:", v18);
        if (!v20)
        {
          id v26 = objc_alloc(MEMORY[0x189607870]);
          uint64_t v71 = v43;
          uint64_t v72 = [NSString stringWithFormat:@"Unable to parse provided keypath. An attribute named '%@' could not be found on the entity '%@' in the store: %@", v18, v17, v9];
          uint64_t v24 = objc_msgSend( v26,  "initWithDomain:code:userInfo:",  v42,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
          goto LABEL_16;
        }

        id v21 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](v21, "setPersistentStoreCoordinator:", v13);
        -[NSManagedObjectContext _setAllowAncillaryEntities:](v21, "_setAllowAncillaryEntities:", 1LL);
        v48[0] = MEMORY[0x1895F87A8];
        v48[1] = 3221225472LL;
        v48[2] = __108__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingValue_atKeyPath_inStores_startingAt_endingAt_error___block_invoke;
        v48[3] = &unk_189EAB620;
        v48[4] = v17;
        v48[5] = v20;
        v48[6] = a3;
        v48[7] = v18;
        v48[8] = v9;
        v48[9] = v21;
        v48[14] = &v53;
        v48[10] = a6;
        v48[11] = a7;
        v48[12] = v15;
        v48[13] = &v57;
        -[NSManagedObjectContext performBlockAndWait:](v21, "performBlockAndWait:", v48);

LABEL_18:
        int v22 = 2 * (*((_BYTE *)v54 + 24) == 0);
LABEL_19:
        objc_autoreleasePoolPop(v10);
        if (v22) {
          goto LABEL_22;
        }
      }

      uint64_t v47 = [a5 countByEnumeratingWithState:&v49 objects:v77 count:16];
    }

    while (v47);
  }

void __108__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingValue_atKeyPath_inStores_startingAt_endingAt_error___block_invoke( uint64_t a1)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  *(void *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 40) attributeType];
  if (v3 == 700)
  {
    id v4 = *(id *)(a1 + 48);
    goto LABEL_5;
  }

  if (v3 == 1100)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:*(void *)(a1 + 48)];
LABEL_5:
    id v5 = v4;
    goto LABEL_9;
  }

  uint64_t v6 = [NSString stringWithUTF8String:"Sorry, I don't know how to translate this value in to a predicate yet: %@ / %@"];
  _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, *(void *)(a1 + 48));
  uint64_t v13 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v65 = *(void *)(a1 + 40);
    uint64_t v64 = *(void *)(a1 + 48);
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v64;
    __int16 v107 = 2112;
    uint64_t v108 = v65;
    _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Sorry, I don't know how to translate this value in to a predicate yet: %@ / %@",  buf,  0x16u);
  }

  id v5 = 0LL;
LABEL_9:
  id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v78 = v5;
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"%K == %@", *(void *)(a1 + 56), v5]);
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0LL);
  uint64_t v15 = (FILE **)MEMORY[0x1895F89E0];
  fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Tracing %@.%@ == %@ in store: %@\nWith fetch: %@\n", *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 64), v2), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
  *(void *)__int128 buf = 0LL;
  uint64_t v16 = [*(id *)(a1 + 72) executeFetchRequest:v2 error:buf];
  uint64_t v77 = v14;
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    fputs( (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"Found rows: %@\n", v16), "UTF8String"],  *v15);
    objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v17, "valueForKey:", @"objectID"));
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL) = *(id *)buf;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 0;
  }

  uint64_t v79 = a1;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL))
  {
    uint64_t v18 = +[NSPersistentHistoryChange fetchRequest](&OBJC_CLASS___NSPersistentHistoryChange, "fetchRequest");
    -[NSFetchRequest setPredicate:]( v18,  "setPredicate:",  objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"changeType == %ld", 2));
    id v19 = +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryWithFetchRequest:",  v18);
    -[NSPersistentHistoryChangeRequest setResultType:](v19, "setResultType:", 5LL);
    uint64_t v20 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "executeRequest:error:", v19, buf), "result");
    if (v20)
    {
      id v21 = v20;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      uint64_t v22 = [v20 countByEnumeratingWithState:&v97 objects:v105 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v98;
        do
        {
          for (uint64_t i = 0LL; i != v23; ++i)
          {
            if (*(void *)v98 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            char v27 = (void *)MEMORY[0x186E3E5D8]();
            __int128 v93 = 0u;
            __int128 v94 = 0u;
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            char v28 = (void *)[v26 changes];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v93 objects:v104 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v94;
              do
              {
                for (uint64_t j = 0LL; j != v30; ++j)
                {
                  if (*(void *)v94 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void **)(*((void *)&v93 + 1) + 8 * j);
                  uint64_t v34 = objc_msgSend( (id)objc_msgSend(v33, "tombstone"),  "objectForKeyedSubscript:",  *(void *)(v79 + 56));
                }

                uint64_t v30 = [v28 countByEnumeratingWithState:&v93 objects:v104 count:16];
              }

              while (v30);
            }

            objc_autoreleasePoolPop(v27);
          }

          uint64_t v23 = [v21 countByEnumeratingWithState:&v97 objects:v105 count:16];
        }

        while (v23);
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL) = *(id *)buf;
    }
  }

  uint64_t v35 = v79;
  unint64_t v36 = 0x189607000uLL;
  if (*(_BYTE *)(*(void *)(*(void *)(v79 + 112) + 8LL) + 24LL))
  {
    fputs( (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"Found objectIDs: %@\n", v77), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
    if ([v77 count])
    {
      __int128 v37 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterToken:",  0LL);
      -[NSPersistentHistoryChangeRequest setResultType:](v37, "setResultType:", 5LL);
      uint64_t v38 = objc_msgSend((id)objc_msgSend(*(id *)(v79 + 72), "executeRequest:error:", v37, buf), "result");
      if (v38)
      {
        __int128 v39 = (void *)v38;
        id v71 = objc_alloc_init(MEMORY[0x189607848]);
        [v71 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        id obj = v39;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v89 objects:v103 count:16];
        __int128 v41 = v77;
        uint64_t v68 = v40;
        if (v40)
        {
          uint64_t v67 = *(void *)v90;
          do
          {
            uint64_t v42 = 0LL;
            do
            {
              if (*(void *)v90 != v67) {
                objc_enumerationMutation(obj);
              }
              uint64_t v70 = v42;
              uint64_t v73 = *(void **)(*((void *)&v89 + 1) + 8 * v42);
              char context = (void *)MEMORY[0x186E3E5D8]();
              uint64_t v43 = *(void **)(v35 + 80);
              if (!v43 || objc_msgSend(v43, "compare:", objc_msgSend(v73, "timestamp")) != 1)
              {
                __int128 v44 = *(void **)(v79 + 88);
                if (!v44 || objc_msgSend(v44, "compare:", objc_msgSend(v73, "timestamp")) != -1)
                {
                  __int128 v87 = 0u;
                  __int128 v88 = 0u;
                  __int128 v85 = 0u;
                  __int128 v86 = 0u;
                  id v75 = (id)[v73 changes];
                  uint64_t v45 = [v75 countByEnumeratingWithState:&v85 objects:v102 count:16];
                  if (v45)
                  {
                    uint64_t v46 = v45;
                    uint64_t v47 = *(void *)v86;
                    uint64_t v72 = *(void *)v86;
                    do
                    {
                      uint64_t v48 = 0LL;
                      uint64_t v74 = v46;
                      do
                      {
                        if (*(void *)v86 != v47) {
                          objc_enumerationMutation(v75);
                        }
                        __int128 v49 = *(void **)(*((void *)&v85 + 1) + 8 * v48);
                        __int128 v50 = (void *)MEMORY[0x186E3E5D8]();
                        if (objc_msgSend(v41, "containsObject:", objc_msgSend(v49, "changedObjectID")))
                        {
                          fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Transaction (%lld): %@:%@:%@ at %@\n", objc_msgSend(v73, "transactionNumber"), objc_msgSend(v73, "processID"), objc_msgSend(v73, "bundleID"), objc_msgSend(v73, "author"), objc_msgSend(v71, "stringFromDate:", objc_msgSend(v73, "timestamp"))), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
                          uint64_t v46 = v74;
                          uint64_t v47 = v72;
                          __int128 v41 = v77;
                          fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"\tChange (%llu): %@: %@ - %@\n", objc_msgSend(v49, "changeID"), objc_msgSend(v49, "changedObjectID"), +[NSPersistentHistoryChange stringForChangeType:]( NSPersistentHistoryChange, "stringForChangeType:", objc_msgSend(v49, "changeType")), objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v49, "updatedProperties"), "valueForKey:", @"name"), "allObjects"), "componentsJoinedByString:", @",")), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
                        }

                        objc_autoreleasePoolPop(v50);
                        ++v48;
                      }

                      while (v46 != v48);
                      uint64_t v46 = [v75 countByEnumeratingWithState:&v85 objects:v102 count:16];
                    }

                    while (v46);
                  }
                }
              }

              objc_autoreleasePoolPop(context);
              uint64_t v42 = v70 + 1;
              uint64_t v35 = v79;
            }

            while (v70 + 1 != v68);
            uint64_t v68 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
          }

          while (v68);
        }

        unint64_t v36 = 0x189607000LL;
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(v79 + 112) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(v79 + 104) + 8LL) + 40LL) = *(id *)buf;
      }

      if (*(_BYTE *)(*(void *)(*(void *)(v35 + 112) + 8LL) + 24LL))
      {
        id v51 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  [v77 allObjects],  *(void *)(v35 + 96),  *(void **)(v35 + 72),  buf);
        if (v51)
        {
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          id v76 = v51;
          uint64_t v52 = [v51 countByEnumeratingWithState:&v81 objects:v101 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v80 = *(void *)v82;
            do
            {
              for (uint64_t k = 0LL; k != v53; ++k)
              {
                if (*(void *)v82 != v80) {
                  objc_enumerationMutation(v76);
                }
                uint64_t v55 = *(void **)(*((void *)&v81 + 1) + 8 * k);
                char v56 = (void *)MEMORY[0x186E3E5D8]();
                uint64_t v57 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v55);
                fputs( (const char *)[(id)objc_msgSend( *(id *)(v36 + 2600) stringWithFormat:@"Found record metadata for objectID: %@\n%@\n", v57, v55), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
                id v58 = (id)[v55 encodedRecord];
                if (v58)
                {
                  id v59 = +[NSCKRecordMetadata recordFromEncodedData:error:]( &OBJC_CLASS___NSCKRecordMetadata,  "recordFromEncodedData:error:",  v58,  buf);
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void **)(v36 + 2600);
                  if (v59)
                  {
                    uint64_t v62 = (FILE *)*MEMORY[0x1895F89E0];
                    __int16 v63 = (void *)[v61 stringWithFormat:@"Encoded record:\n%@\n", objc_msgSend(v59, "debugDescription")];
                  }

                  else
                  {
                    uint64_t v62 = (FILE *)*MEMORY[0x1895F89D0];
                    __int16 v63 = (void *)[v61 stringWithFormat:@"Failed to decode record for metadata: %@", *(void *)buf];
                  }

                  fputs((const char *)[v63 UTF8String], v62);

                  unint64_t v36 = 0x189607000LL;
                }

                objc_autoreleasePoolPop(v56);
              }

              uint64_t v53 = [v76 countByEnumeratingWithState:&v81 objects:v101 count:16];
            }

            while (v53);
          }
        }

        else
        {
          fputs( (const char *)[(id)objc_msgSend( *(id *)(v36 + 2600) stringWithFormat:@"Failed to fetch record metadata for objectIDs: %@\n%@\n", v77, *(void *)buf), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
          *(_BYTE *)(*(void *)(*(void *)(v35 + 112) + 8LL) + 24LL) = 0;
          *(void *)(*(void *)(*(void *)(v35 + 104) + 8LL) + 40LL) = *(id *)buf;
        }
      }
    }
  }
}

+ (BOOL)traceObjectMatchingRecordName:(id)a3 inStores:(id)a4 startingAt:(id)a5 endingAt:(id)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3052000000LL;
  uint64_t v47 = __Block_byref_object_copy__42;
  uint64_t v48 = __Block_byref_object_dispose__42;
  uint64_t v49 = 0LL;
  uint64_t v40 = 0LL;
  __int128 v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 1;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v36 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v37;
    uint64_t v9 = MEMORY[0x189604A88];
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(a4);
      }
      uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x186E3E5D8]();
      char v56 = @"NSReadOnlyPersistentStoreOption";
      uint64_t v57 = v9;
      uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v14 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v11,  v13,  v45 + 5);
      if (v14)
      {
        uint64_t v15 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v14);
        v54[0] = @"NSReadOnlyPersistentStoreOption";
        v54[1] = @"NSCloudKitMirroringDelegateReadOnlyOptionKey";
        v55[0] = v9;
        v55[1] = v9;
        v54[2] = @"NSPersistentHistoryTrackingKey";
        v55[2] = v9;
        uint64_t v16 = [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:3];
        if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v15,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  v11,  v16,  v45 + 5))
        {
          uint64_t v17 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v17, "setPersistentStoreCoordinator:", v15);
          -[NSManagedObjectContext _setAllowAncillaryEntities:](v17, "_setAllowAncillaryEntities:", 1LL);
          v35[0] = MEMORY[0x1895F87A8];
          v35[1] = 3221225472LL;
          v35[2] = __103__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingRecordName_inStores_startingAt_endingAt_error___block_invoke;
          v35[3] = &unk_189EAB648;
          v35[4] = a3;
          v35[5] = v11;
          v35[10] = &v40;
          v35[6] = v17;
          v35[7] = a5;
          v35[9] = &v44;
          v35[8] = a6;
          -[NSManagedObjectContext performBlockAndWait:](v17, "performBlockAndWait:", v35);
        }

        else
        {
          *((_BYTE *)v41 + 24) = 0;
        }

        int v18 = 2 * (*((_BYTE *)v41 + 24) == 0);
      }

      else
      {
        *((_BYTE *)v41 + 24) = 0;
        int v18 = 2;
      }

      objc_autoreleasePoolPop(v12);
      if (v18) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [a4 countByEnumeratingWithState:&v36 objects:v58 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!*((_BYTE *)v41 + 24))
  {
    id v21 = (id)v45[5];
    if (v21)
    {
      if (a7) {
        *a7 = v21;
      }
    }

    else
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      uint64_t v29 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        id v51 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        __int16 v52 = 1024;
        int v53 = 705;
        _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  void v45[5] = 0LL;
  char v19 = *((_BYTE *)v41 + 24);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v19;
}

void __103__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingRecordName_inStores_startingAt_endingAt_error___block_invoke( uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  id v61 = objc_alloc_init(MEMORY[0x189603FE0]);
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordName == %@", *(void *)(a1 + 32)]);
  uint64_t v3 = (FILE **)MEMORY[0x1895F89E0];
  unint64_t v4 = 0x189607000uLL;
  fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Tracing record %@ in store: %@\nWith fetch: %@\n", *(void *)(a1 + 32), *(void *)(a1 + 40), v2), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
  id v78 = 0LL;
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v2 error:&v78];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v46 = a1;
    fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Found record metadata: %@\n", v5), "UTF8String"],  *v3);
    id obj = v6;
    id v51 = objc_alloc_init(&OBJC_CLASS___PFCloudKitArchivingUtilities);
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    uint64_t v55 = [v6 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v55)
    {
      uint64_t v53 = *(void *)v75;
      do
      {
        for (uint64_t i = 0LL; i != v55; ++i)
        {
          if (*(void *)v75 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v9 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v10 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v8);
          fputs( (const char *)[(id)objc_msgSend( *(id *)(v4 + 2600) stringWithFormat:@"Found metadata for row '%@': %@\n", v10, v8), "UTF8String"],  *v3);
          if ([v8 encodedRecord])
          {
            id v59 = v9;
            id v11 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]( (uint64_t)v51,  (void *)[v8 encodedRecord],  &v78);
            uint64_t v57 = v10;
            fputs( (const char *)[(id)objc_msgSend( *(id *)(v4 + 2600) stringWithFormat:@"Record for row '%@': %@\n", v10, v11), "UTF8String"],  *v3);
            __int128 v70 = 0u;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            uint64_t v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "encryptedValues"), "allKeys");
            uint64_t v13 = [v12 countByEnumeratingWithState:&v70 objects:v81 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v71;
              do
              {
                for (uint64_t j = 0LL; j != v14; ++j)
                {
                  if (*(void *)v71 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v70 + 1) + 8 * j);
                  int v18 = *v3;
                  char v19 = (void *)NSString;
                  uint64_t v41 = objc_msgSend((id)objc_msgSend(v11, "encryptedValues"), "objectForKeyedSubscript:", v17);
                  uint64_t v20 = v19;
                  uint64_t v3 = (FILE **)MEMORY[0x1895F89E0];
                  fputs( (const char *)[(id)objc_msgSend(v20 stringWithFormat:@"\t%@: %@\n", v17, v41), "UTF8String"],  v18);
                }

                uint64_t v14 = [v12 countByEnumeratingWithState:&v70 objects:v81 count:16];
              }

              while (v14);
            }

            unint64_t v4 = 0x189607000LL;
            uint64_t v10 = v57;
            uint64_t v9 = v59;
          }

          [v61 addObject:v10];

          objc_autoreleasePoolPop(v9);
        }

        uint64_t v55 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
      }

      while (v55);
    }

    a1 = v46;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v78;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    fputs( (const char *)[(id)objc_msgSend(*(id *)(v4 + 2600) stringWithFormat:@"Found objectIDs: %@\n", v61), "UTF8String"],  *v3);
    if ([v61 count])
    {
      id v21 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterToken:",  0LL);
      -[NSPersistentHistoryChangeRequest setResultType:](v21, "setResultType:", 5LL);
      uint64_t v22 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v21, &v78), "result");
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        id v52 = objc_alloc_init(MEMORY[0x189607848]);
        [v52 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v43 = v23;
        uint64_t v45 = [v23 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v45)
        {
          uint64_t v44 = *(void *)v67;
          uint64_t v47 = a1;
          do
          {
            uint64_t v24 = 0LL;
            do
            {
              if (*(void *)v67 != v44) {
                objc_enumerationMutation(v43);
              }
              id obja = v24;
              char v56 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v24);
              char context = (void *)MEMORY[0x186E3E5D8]();
              uint64_t v25 = *(void **)(a1 + 56);
              if (!v25 || objc_msgSend(v25, "compare:", objc_msgSend(v56, "timestamp")) != 1)
              {
                uint64_t v26 = *(void **)(v47 + 64);
                if (!v26 || objc_msgSend(v26, "compare:", objc_msgSend(v56, "timestamp")) != -1)
                {
                  __int128 v64 = 0u;
                  __int128 v65 = 0u;
                  __int128 v62 = 0u;
                  __int128 v63 = 0u;
                  id v60 = (id)[v56 changes];
                  uint64_t v27 = [v60 countByEnumeratingWithState:&v62 objects:v79 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v63;
                    uint64_t v54 = *(void *)v63;
                    do
                    {
                      uint64_t v30 = 0LL;
                      uint64_t v58 = v28;
                      do
                      {
                        if (*(void *)v63 != v29) {
                          objc_enumerationMutation(v60);
                        }
                        uint64_t v31 = *(void **)(*((void *)&v62 + 1) + 8 * v30);
                        uint64_t v32 = (void *)MEMORY[0x186E3E5D8]();
                        if (objc_msgSend(v61, "containsObject:", objc_msgSend(v31, "changedObjectID")))
                        {
                          uint64_t v33 = *(void **)(v4 + 2600);
                          unint64_t v4 = 0x189607000uLL;
                          fputs( (const char *)[(id)objc_msgSend( v33 stringWithFormat:@"Transaction (%lld): %@:%@:%@ at %@\n", objc_msgSend(v56, "transactionNumber"), objc_msgSend(v56, "processID"), objc_msgSend(v56, "bundleID"), objc_msgSend(v56, "author"), objc_msgSend(v52, "stringFromDate:", objc_msgSend(v56, "timestamp"))), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
                          uint64_t v34 = (FILE *)*MEMORY[0x1895F89E0];
                          uint64_t v35 = (void *)NSString;
                          uint64_t v36 = [v31 changeID];
                          uint64_t v37 = [v31 changedObjectID];
                          id v38 = +[NSPersistentHistoryChange stringForChangeType:]( NSPersistentHistoryChange,  "stringForChangeType:",  [v31 changeType]);
                          uint64_t v42 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v31, "updatedProperties"),  "valueForKey:",  @"name"),  "allObjects"),  "componentsJoinedByString:",  @",");
                          uint64_t v40 = v36;
                          uint64_t v28 = v58;
                          __int128 v39 = v35;
                          uint64_t v29 = v54;
                          fputs( (const char *)[(id)objc_msgSend( v39 stringWithFormat:@"\tChange (%llu): %@: %@ - %@\n", v40, v37, v38, v42), "UTF8String"],  v34);
                        }

                        objc_autoreleasePoolPop(v32);
                        ++v30;
                      }

                      while (v28 != v30);
                      uint64_t v28 = [v60 countByEnumeratingWithState:&v62 objects:v79 count:16];
                    }

                    while (v28);
                  }
                }
              }

              objc_autoreleasePoolPop(context);
              uint64_t v24 = obja + 1;
              a1 = v47;
            }

            while (obja + 1 != (char *)v45);
            uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v80 count:16];
          }

          while (v45);
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v78;
      }
    }
  }
}

+ (BOOL)printEventsInStores:(id)a3 startingAt:(id)a4 endingAt:(id)a5 error:(id *)a6
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  uint64_t v38 = 0LL;
  __int128 v39 = &v38;
  uint64_t v40 = 0x3052000000LL;
  uint64_t v41 = __Block_byref_object_copy__42;
  uint64_t v42 = __Block_byref_object_dispose__42;
  uint64_t v43 = 0LL;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v34 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = MEMORY[0x189604A88];
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * v9);
      id v11 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v54 = @"NSReadOnlyPersistentStoreOption";
      uint64_t v55 = v8;
      uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v13 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v10,  v12,  v39 + 5);
      if (v13)
      {
        uint64_t v14 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v13);
        v52[0] = @"NSReadOnlyPersistentStoreOption";
        v52[1] = @"NSCloudKitMirroringDelegateReadOnlyOptionKey";
        v53[0] = v8;
        v53[1] = v8;
        v52[2] = @"NSPersistentHistoryTrackingKey";
        v53[2] = v8;
        uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:3];
        if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v14,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  v10,  v15,  v39 + 5))
        {
          uint64_t v16 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v16, "setPersistentStoreCoordinator:", v14);
          -[NSManagedObjectContext _setAllowAncillaryEntities:](v16, "_setAllowAncillaryEntities:", 1LL);
          v33[0] = MEMORY[0x1895F87A8];
          v33[1] = 3221225472LL;
          void v33[2] = __84__NSCloudKitMirroringDelegate___CLI__printEventsInStores_startingAt_endingAt_error___block_invoke;
          v33[3] = &unk_189EA9290;
          v33[4] = a4;
          v33[5] = a5;
          v33[6] = v10;
          v33[7] = v16;
          v33[8] = &v44;
          v33[9] = &v38;
          -[NSManagedObjectContext performBlockAndWait:](v16, "performBlockAndWait:", v33);
        }

        else
        {
          *((_BYTE *)v45 + 24) = 0;
        }

        int v17 = 2 * (*((_BYTE *)v45 + 24) == 0);
      }

      else
      {
        *((_BYTE *)v45 + 24) = 0;
        int v17 = 2;
      }

      objc_autoreleasePoolPop(v11);
      if (v17) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [a3 countByEnumeratingWithState:&v34 objects:v56 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!*((_BYTE *)v45 + 24))
  {
    id v20 = (id)v39[5];
    if (v20)
    {
      if (a6) {
        *a6 = v20;
      }
    }

    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      uint64_t v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        __int16 v50 = 1024;
        int v51 = 798;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v39[5] = 0LL;
  char v18 = *((_BYTE *)v45 + 24);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v18;
}

void __84__NSCloudKitMirroringDelegate___CLI__printEventsInStores_startingAt_endingAt_error___block_invoke( uint64_t a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v2, "setFetchBatchSize:", 1000LL);
  v20[0] = [MEMORY[0x189607A20] sortDescriptorWithKey:@"startedAt" ascending:1];
  -[NSFetchRequest setSortDescriptors:]( v2,  "setSortDescriptors:",  [MEMORY[0x189603F18] arrayWithObjects:v20 count:1]);
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (*(void *)(a1 + 32)) {
    [v3 addObject:objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"startedAt >= %@", *(void *)(a1 + 32))];
  }
  if (*(void *)(a1 + 40)) {
    [v3 addObject:objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"startedAt <= %@", *(void *)(a1 + 40))];
  }
  if ([v3 count]) {
    -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x189607820] andPredicateWithSubpredicates:v3]);
  }
  fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Fetching events from store: %@\nWith fetch: %@\n", *(void *)(a1 + 48), v2), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
  id v18 = 0LL;
  uint64_t v4 = [*(id *)(a1 + 56) executeFetchRequest:v2 error:&v18];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v13 = v3;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    id v6 = objc_alloc_init(MEMORY[0x189607848]);
    [v6 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"%@ - %@: %@ - ", objc_msgSend(v6, "stringFromDate:", objc_msgSend(v11, "startedAt")), objc_msgSend(v6, "stringFromDate:", objc_msgSend(v11, "endedAt")), +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", objc_msgSend(v11, "cloudKitEventType"))];
          else {
            [v12 appendFormat:@"failed - %@:%lld", objc_msgSend(v11, "errorDomain"), objc_msgSend(v11, "errorCode")];
          }
          fputs( (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@\n", v12), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
        }

        uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v8);
    }

    id v3 = v13;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v18;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }
}

+ (BOOL)printSharedZoneWithName:(id)a3 inStoreAtURL:(id)a4 error:(id *)a5
{
  v44[1] = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000LL;
  uint64_t v30 = __Block_byref_object_copy__42;
  uint64_t v31 = __Block_byref_object_dispose__42;
  uint64_t v32 = 0LL;
  uint64_t v43 = @"NSReadOnlyPersistentStoreOption";
  uint64_t v8 = MEMORY[0x189604A88];
  v44[0] = MEMORY[0x189604A88];
  uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  id v10 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  a4,  v9,  v28 + 5);
  if (v10)
  {
    id v11 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v10);
    v41[0] = @"NSReadOnlyPersistentStoreOption";
    v41[1] = @"NSCloudKitMirroringDelegateReadOnlyOptionKey";
    v42[0] = v8;
    v42[1] = v8;
    v41[2] = @"NSPersistentHistoryTrackingKey";
    v42[2] = v8;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:3];
    if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v11,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  a4,  v12,  v28 + 5))
    {
      id v13 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v13, "setPersistentStoreCoordinator:", v11);
      -[NSManagedObjectContext _setAllowAncillaryEntities:](v13, "_setAllowAncillaryEntities:", 1LL);
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __81__NSCloudKitMirroringDelegate___CLI__printSharedZoneWithName_inStoreAtURL_error___block_invoke;
      v26[3] = &unk_189EA96B8;
      v26[4] = a3;
      void v26[5] = v13;
      v26[6] = a4;
      v26[7] = &v33;
      void v26[8] = &v27;
      -[NSManagedObjectContext performBlockAndWait:](v13, "performBlockAndWait:", v26);
    }

    else
    {
      *((_BYTE *)v34 + 24) = 0;
    }
  }

  else
  {
    *((_BYTE *)v34 + 24) = 0;
    id v14 = (id)v28[5];
  }

  if (!*((_BYTE *)v34 + 24))
  {
    id v17 = (id)v28[5];
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
    }

    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      uint64_t v25 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        __int16 v39 = 1024;
        int v40 = 878;
        _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v28[5] = 0LL;
  char v15 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v15;
}

void __81__NSCloudKitMirroringDelegate___CLI__printSharedZoneWithName_inStoreAtURL_error___block_invoke( uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordZoneName == %@", *(void *)(a1 + 32)]);
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0LL);
  id v21 = 0LL;
  id v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:&v21];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (v3)
  {
    uint64_t v5 = v3;
    *(_BYTE *)(v4 + 24) = 1;
    if ([v3 count])
    {
      uint64_t v15 = a1;
      __int128 v16 = objc_alloc_init(&OBJC_CLASS___PFCloudKitArchivingUtilities);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = (FILE **)MEMORY[0x1895F89E0];
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v5);
            }
            id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v12 = (void *)MEMORY[0x186E3E5D8]();
            fputs( (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"Metadata:\n%@\n", v11), "UTF8String"],  *v8);
            if ([v11 encodedShareData])
            {
              id v13 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v11);
              id v14 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( (uint64_t)v16,  (void *)[v11 encodedShareData],  v13,  &v21);
              if (v14)
              {
                fputs( (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"Share:\n%@\n", v14), "UTF8String"],  *v8);
              }

              else
              {
                fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"Failed to decode share data for %@: %@\n", v13, v21), "UTF8String"],  (FILE *)*MEMORY[0x1895F89D0]);
                id v21 = 0LL;
              }
            }

            else
            {
              fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"No encoded share was found on the metadata for %@\n", *(void *)(v15 + 32)), "UTF8String"],  *v8);
            }

            objc_autoreleasePoolPop(v12);
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }

        while (v7);
      }
    }

    else
    {
      fputs( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@ does not container a zone named %@", objc_msgSend(*(id *)(a1 + 48), "lastPathComponent"), *(void *)(a1 + 32)), "UTF8String"],  (FILE *)*MEMORY[0x1895F89E0]);
    }
  }

  else
  {
    *(_BYTE *)(v4 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v21;
  }

+ (NSString)cloudKitMetadataTransformerName
{
  return (NSString *)@"com.apple.CoreData.cloudkit.metadata.transformer";
}

@end