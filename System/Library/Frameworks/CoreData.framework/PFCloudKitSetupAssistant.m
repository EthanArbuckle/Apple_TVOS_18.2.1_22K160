@interface PFCloudKitSetupAssistant
- (PFCloudKitSetupAssistant)initWithSetupRequest:(id)a3 mirroringOptions:(id)a4 observedStore:(id)a5;
- (uint64_t)_deleteZone:(void *)a3 error:;
- (uint64_t)_initializeCloudKitForObservedStore:(_BYTE *)a3 andNoteMetadataInitialization:;
- (uint64_t)_saveZone:(void *)a3 error:;
- (void)beginActivityForPhase:(uint64_t)a1;
- (void)dealloc;
- (void)endActivityForPhase:(uint64_t)a3 withError:;
@end

@implementation PFCloudKitSetupAssistant

- (PFCloudKitSetupAssistant)initWithSetupRequest:(id)a3 mirroringOptions:(id)a4 observedStore:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PFCloudKitSetupAssistant;
  v8 = -[PFCloudKitSetupAssistant init](&v11, sel_init);
  if (v8)
  {
    v8->_setupRequest = (NSCloudKitMirroringDelegateSetupRequest *)a3;
    v8->_cloudKitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    v9 = (NSCloudKitMirroringDelegateOptions *)a4;
    v8->_mirroringOptions = v9;
    if (v9) {
      v9 = (NSCloudKitMirroringDelegateOptions *)v9->_storeMonitorProvider;
    }
    v8->_storeMonitor = (PFCloudKitStoreMonitor *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]( v9,  (uint64_t)a5);
  }

  return v8;
}

- (void)dealloc
{
  self->_container = 0LL;
  self->_database = 0LL;

  self->_databaseSubscription = 0LL;
  self->_largeBlobDirectoryURL = 0LL;

  self->_currentUserRecordID = 0LL;
  cloudKitSemaphore = (dispatch_object_s *)self->_cloudKitSemaphore;
  if (cloudKitSemaphore) {
    dispatch_release(cloudKitSemaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitSetupAssistant;
  -[PFCloudKitSetupAssistant dealloc](&v4, sel_dealloc);
}

- (uint64_t)_initializeCloudKitForObservedStore:(_BYTE *)a3 andNoteMetadataInitialization:
{
  uint64_t v280 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  uint64_t v5 = *(void *)(result + 8);
  if (v5) {
    BOOL v6 = *(_BYTE *)(v5 + 12) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v227 = 0LL;
  uint64_t v228 = (uint64_t)&v227;
  uint64_t v229 = 0x2020000000LL;
  LOBYTE(v230) = 1;
  *(void *)v246 = 0LL;
  uint64_t v247 = (uint64_t)v246;
  uint64_t v248 = 0x3052000000LL;
  v249 = __Block_byref_object_copy__25;
  v250 = __Block_byref_object_dispose__25;
  v251 = 0LL;
  -[PFCloudKitSetupAssistant beginActivityForPhase:](result, 1LL);
  uint64_t v7 = *(void *)(v4 + 56);
  *(void *)v259 = MEMORY[0x1895F87A8];
  *(void *)&v259[8] = 3221225472LL;
  *(void *)&v259[16] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke;
  v260 = &unk_189EA7A60;
  v261 = (void *)v7;
  v262 = (uint64_t *)v4;
  v263 = &v227;
  v264 = v246;
  -[PFCloudKitStoreMonitor performBlock:](v7, (uint64_t)v259);
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 1LL, *(void *)(v247 + 40));
  if (*(_BYTE *)(v228 + 24)) {
    goto LABEL_5;
  }
  v8 = (__CFString *)*(id *)(v247 + 40);
  if (!v8)
  {
    uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v27 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

- (void)beginActivityForPhase:(uint64_t)a1
{
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 72);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = (id)[v4 beginActivityForPhase:a2];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v5);
}

- (void)endActivityForPhase:(uint64_t)a3 withError:
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    id v5 = *(void **)(v4 + 72);
  }
  else {
    id v5 = 0LL;
  }
  id v6 = (id)[v5 endActivityForPhase:a2 withError:a3];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v6);
}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke(uint64_t *a1)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
    id v11 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v47 = *MEMORY[0x1896075F0];
    v48 = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    *(void *)(*(void *)(a1[7] + 8) + 40) = [v11 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v12];
    goto LABEL_23;
  }

  uint64_t v3 = a1[4];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    uint64_t v5 = a1[4];
  }

  else
  {
    uint64_t v5 = 0LL;
    id WeakRetained = 0LL;
  }

  id v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
  -[NSManagedObjectContext setTransactionAuthor:]( v6,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
  uint64_t v7 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2;
  v35[3] = &unk_189EA7A38;
  v35[4] = v2;
  v35[5] = v6;
  v35[6] = a1[5];
  -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v35);
  *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = +[PFCloudKitMetadataModel checkAndRepairSchemaOfStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___PFCloudKitMetadataModel,  v2,  (uint64_t)v6,  (void *)(*(void *)(a1[7] + 8) + 40LL));
  uint64_t v8 = *(void *)(a1[6] + 8);
  if (!*(_BYTE *)(v8 + 24)) {
    goto LABEL_17;
  }
  if (!a1[5])
  {
LABEL_16:
    *(_BYTE *)(v8 + 24) = 0;
LABEL_17:
    id v24 = *(id *)(*(void *)(a1[7] + 8) + 40LL);
    goto LABEL_20;
  }

  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3052000000LL;
  v44 = __Block_byref_object_copy__25;
  uint64_t v45 = __Block_byref_object_dispose__25;
  uint64_t v46 = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 1;
  v36[0] = v7;
  v36[1] = 3221225472LL;
  v36[2] = __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke;
  v36[3] = &unk_189EA8D40;
  v36[4] = v6;
  v36[5] = &v41;
  v36[6] = &v37;
  -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v36);
  if (!*((_BYTE *)v38 + 24))
  {
    id v10 = (id)v42[5];
    if (v10)
    {
      *(void *)(v9 + 40) = v10;
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v50 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v51 = 1024;
        int v52 = 1685;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v42[5] = 0LL;
  int v21 = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  if (!v21)
  {
    uint64_t v8 = *(void *)(a1[6] + 8);
    goto LABEL_16;
  }

  uint64_t v22 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]( (uint64_t)&OBJC_CLASS___NSCKEvent,  *(void *)(a1[5] + 72),  a1[4],  (void *)(*(void *)(a1[7] + 8) + 40LL));
  uint64_t v23 = v22;
  if (v22)
  {
    *(void *)(a1[5] + 64) = v22;
    objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 8), "progressProvider"), "eventUpdated:", v23);
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
    id v25 = *(id *)(*(void *)(a1[7] + 8) + 40LL);
  }

LABEL_20:
  if (!*(_BYTE *)(*(void *)(a1[6] + 8) + 24LL))
  {
    uint64_t v26 = (void *)MEMORY[0x186E3E5D8](v24);
    BOOL v27 = __ckLoggingOverride != 0;
    uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to initialize CloudKit metadata: %@"];
    _NSCoreDataLog( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke");
    objc_autoreleasePoolPop(v26);
  }

LABEL_23:
}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2(uint64_t a1)
{
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    uint64_t v11 = 0LL;
    if ((objc_msgSend( *(id *)(a1 + 40),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  &v11) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v3 = __ckLoggingOverride != 0;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }
  }

void __60__PFCloudKitSetupAssistant__initializeAssetStorageURLError___block_invoke(uint64_t *a1)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    id v38 = 0LL;
    uint64_t v3 = a1[4];
    if (v3) {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    }
    else {
      id WeakRetained = 0LL;
    }
    p_info = &OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequest.info;
    *(void *)(*(void *)(a1[5] + 8) + 40LL) = (id)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  v2);
    if (!*(void *)(*(void *)(a1[5] + 8) + 40LL))
    {
      *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
      id v26 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v27 = *MEMORY[0x189607460];
      uint64_t v41 = *MEMORY[0x1896075F0];
      uint64_t v42 = [NSString stringWithFormat:@"Failed to create largeBlobDirectoryURL with observed store: %@", v2];
      *(void *)(*(void *)(a1[7] + 8) + 40) = objc_msgSend( v26,  "initWithDomain:code:userInfo:",  v27,  134403,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1));
LABEL_29:

      goto LABEL_30;
    }

    id v6 = (id)[MEMORY[0x1896078A8] defaultManager];
    char v37 = 0;
    if (objc_msgSend( v6,  "fileExistsAtPath:isDirectory:",  objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "path"),  &v37))
    {
      uint64_t v7 = *(void **)(*(void *)(a1[5] + 8) + 40LL);
      if (v37)
      {
        id v30 = WeakRetained;
        uint64_t v31 = v2;
        uint64_t v8 = (void *)objc_msgSend(v6, "subpathsAtPath:", objc_msgSend(v7, "path"));
        uint64_t v36 = 0LL;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = (void *)[*(id *)(*(void *)(a1[5] + 8) + 40) URLByAppendingPathComponent:*(void *)(*((void *)&v32 + 1) + 8 * i)];
              if (([v6 removeItemAtURL:v13 error:&v36] & 1) == 0
                && unlink((const char *)objc_msgSend((id)objc_msgSend(v13, "path"), "fileSystemRepresentation")))
              {
                uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
                BOOL v15 = __ckLoggingOverride != 0;
                uint64_t v16 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to asset file (and unlink:%d) at url: %@\n%@"];
                __error();
                _NSCoreDataLog( v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"-[PFCloudKitSetupAssistant _initializeAssetStorageURLError:]_block_invoke");
                objc_autoreleasePoolPop(v14);
              }
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v45 count:16];
          }

          while (v10);
        }

        uint64_t v23 = a1 + 6;
        id WeakRetained = v30;
        v2 = v31;
        p_info = (__objc2_class_ro **)(&OBJC_CLASS___NSCloudKitMirroringDelegateSetupRequest + 32);
        goto LABEL_24;
      }

      *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v6 removeItemAtURL:v7 error:&v38];
    }

    uint64_t v23 = a1 + 6;
    if (!*(_BYTE *)(*(void *)(a1[6] + 8) + 24LL)) {
      goto LABEL_27;
    }
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v6 createDirectoryAtURL:*(void *)(*(void *)(a1[5] + 8) + 40) withIntermediateDirectories:1 attributes:0 error:&v38];
    if (!*(_BYTE *)(*(void *)(a1[6] + 8) + 24LL)) {
      goto LABEL_27;
    }
    uint64_t v28 = *(void **)(*(void *)(a1[5] + 8) + 40LL);
    uint64_t v43 = *MEMORY[0x189603C50];
    uint64_t v44 = MEMORY[0x189604A88];
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend( v28,  "setResourceValues:error:",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1),  &v38);
LABEL_24:
    if (*(_BYTE *)(*(void *)(*v23 + 8) + 24LL))
    {
      uint64_t v29 = (void *)+[PFCloudKitSerializer oldAssetStorageDirectoryURLForStore:]((uint64_t)(p_info + 116), v2);
      goto LABEL_28;
    }

void __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2;
    v6[3] = &unk_189EA9D00;
    v6[4] = v2;
    v6[5] = v3;
    __int128 v7 = *(_OWORD *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v4 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v5 = *MEMORY[0x189607460];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v10[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( v4,  "initWithDomain:code:userInfo:",  v5,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v10,  &v9,  1));
  }
}

id __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2(uint64_t a1)
{
  id result = (id)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey",  *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (result)
  {
    id result = (id)[result stringValue];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  }

  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  }

  return result;
}

uint64_t __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetched account info for store %@: %@\n%@"];
  _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (!a2)
  {
    uint64_t v25 = (void *)[a3 domain];
    if ([v25 isEqualToString:getCloudKitCKErrorDomain()]
      && [a3 code] == 9)
    {
      id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v16 setObject:@"Unable to initialize without an iCloud account (CKErrorNotAuthenticated)." forKey:*MEMORY[0x1896075F0]];
      [v16 setObject:a3 forKey:*MEMORY[0x189607798]];
      id v17 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v18 = *MEMORY[0x189607460];
      uint64_t v19 = 134400LL;
      goto LABEL_20;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v27 = a3;
    goto LABEL_22;
  }

  uint64_t v15 = [a2 accountStatus];
  if (v15 != 1 || ![a2 hasValidCredentials])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v16 = v20;
    if (a3) {
      [v20 setObject:a3 forKey:*MEMORY[0x189607798]];
    }
    if (v15 == 3)
    {
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      if (v21)
      {
        [v16 setObject:v21 forKey:@"PFCloudKitOldUserIdentityKey"];
        [v16 setObject:&unk_189F04440 forKey:@"NSCloudKitMirroringDelegateResetSyncReasonKey"];
        uint64_t v22 = (void *)MEMORY[0x189607870];
        uint64_t v23 = *MEMORY[0x189607460];
        uint64_t v24 = 134405LL;
LABEL_38:
        id v38 = (void *)[v22 errorWithDomain:v23 code:v24 userInfo:v16];
        goto LABEL_39;
      }

      if ([*(id *)(*(void *)(a1 + 40) + 8) databaseScope] == 1)
      {
        id v38 = 0LL;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
LABEL_39:
        id v26 = v38;
        goto LABEL_40;
      }

      [a2 hasValidCredentials];
      objc_opt_self();
      uint64_t v47 = *MEMORY[0x1896075F0];
      uint64_t v29 = @"Unable to initialize without an iCloud account (CKAccountStatusNoAccount).";
    }

    else
    {
      int v28 = [a2 hasValidCredentials];
      objc_opt_self();
      uint64_t v29 = @"Unable to determine the status of the iCloud account (CKAccountStatusCouldNotDetermine).";
      switch(v15)
      {
        case 0LL:
          break;
        case 1LL:
          if (v28)
          {
            uint64_t v30 = [NSString stringWithUTF8String:"failureReasonForAccountStatus was called with an available account and valid credentials."];
            _NSCoreDataLog(17LL, v30, v31, v32, v33, v34, v35, v36, v55);
            char v37 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: failureReasonForAccountStatus was called with an available account and valid credentials.",  buf,  2u);
            }
          }

          uint64_t v29 = @"Unable to initialize because even though there is an available account it does not have valid credentials. The user will need to enter their password in settings, or via a password prompt.";
          break;
        case 2LL:
          uint64_t v29 = @"Unable to initialize without a valid iCloud account (CKAccountStatusRestricted).";
          break;
        case 4LL:
          uint64_t v29 = @"Unable to initialize without a valid iCloud account (CKAccountStatusTemporarilyUnavailable).";
          break;
        default:
          uint64_t v39 = [NSString stringWithUTF8String:"Cannot generate a failure reason for an unknown account status: %ld"];
          _NSCoreDataLog(17LL, v39, v40, v41, v42, v43, v44, v45, v15);
          uint64_t v46 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v61 = v15;
            _os_log_fault_impl( &dword_186681000,  v46,  OS_LOG_TYPE_FAULT,  "CoreData: Cannot generate a failure reason for an unknown account status: %ld",  buf,  0xCu);
          }

          uint64_t v29 = @"Unknown account status";
          break;
      }

      uint64_t v47 = *MEMORY[0x1896075F0];
    }

    [v16 setObject:v29 forKey:v47];
    uint64_t v22 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x189607460];
    uint64_t v24 = 134400LL;
    goto LABEL_38;
  }

  if (!*(_BYTE *)(a1 + 80)
    || ([a2 deviceToDeviceEncryptionAvailability] & 1) != 0
    && ([a2 deviceToDeviceEncryptionAvailability] & 2) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v16 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:@"PFCloudKitOldUserIdentityKey"];
    [v16 setObject:&unk_189F04440 forKey:@"NSCloudKitMirroringDelegateResetSyncReasonKey"];
    id v17 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v18 = *MEMORY[0x189607460];
    uint64_t v19 = 134405LL;
LABEL_20:
    id v26 = (id)[v17 initWithDomain:v18 code:v19 userInfo:v16];
LABEL_40:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v26;

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

  char v49 = [a2 deviceToDeviceEncryptionAvailability];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  id v50 = objc_alloc(MEMORY[0x189607870]);
  uint64_t v51 = *MEMORY[0x189607460];
  if ((v49 & 1) != 0)
  {
    uint64_t v58 = *MEMORY[0x1896075F0];
    v59 = @"Unable to initialize the CloudKit container because this device does not support device to device encryption.";
    int v52 = (void *)MEMORY[0x189603F68];
    uint64_t v53 = &v59;
    v54 = &v58;
  }

  else
  {
    uint64_t v56 = *MEMORY[0x1896075F0];
    v57 = @"Unable to initialize the CloudKit container because this account does not support device to device encryption.";
    int v52 = (void *)MEMORY[0x189603F68];
    uint64_t v53 = &v57;
    v54 = &v56;
  }

  id v27 = (id)objc_msgSend( v50,  "initWithDomain:code:userInfo:",  v51,  134400,  objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, 1));
LABEL_22:
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v27;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2;
    v7[3] = &unk_189EA9D50;
    v7[4] = v2;
    v7[5] = v3;
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    __int128 v8 = *(_OWORD *)(a1 + 40);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  v14[0] = 0LL;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  v16[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:]( v2,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v16 count:1]);
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"database.databaseScopeNum = %@ AND %K == YES", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", *(void *)(a1 + 72)), @"needsRecoveryFromIdentityLoss"]);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v14];
  if (v14[0])
  {
    id result = v14[0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  else
  {
    id v5 = v3;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        __int128 v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "ckRecordZoneName"),  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "ckOwnerName"));
          [*(id *)(a1 + 48) addObject:v9];

          __int128 v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id result = (id)[v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        id v6 = result;
      }

      while (result);
    }
  }

  return result;
}

uint64_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  if (a4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
    id v5 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting zones %@ in response to Manatee identity loss failed, %@"];
    _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
    objc_autoreleasePoolPop(v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5;
    v7[3] = &unk_189EA9DC8;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v2 = *(void **)(a1 + 32);
  id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  id v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v6);
        id v27 = 0LL;
        __int128 v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v7,  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v27);
        uint64_t v9 = v27;
        if (v27) {
          goto LABEL_17;
        }
        if (v8)
        {
          -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v8, "setNeedsRecoveryFromIdentityLoss:", 0LL);
        }

        else
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          uint64_t v10 = [NSString stringWithUTF8String:"Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@"];
          _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          id v17 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v27;
            _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@",  buf,  0xCu);
          }
        }

        if ([*(id *)(a1 + 48) hasChanges])
        {
          if (([*(id *)(a1 + 48) save:&v27] & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v19 = __ckLoggingOverride;
            uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"];
            _NSCoreDataLog( v19 != 0,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            objc_autoreleasePoolPop(v18);
            uint64_t v9 = v27;
            if (v27)
            {
LABEL_17:
              id result = v9;
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
              *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
              return result;
            }
          }
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_70(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_71;
    v7[3] = &unk_189EA9D50;
    v7[4] = v2;
    v7[5] = v3;
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    __int128 v8 = *(_OWORD *)(a1 + 40);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_71(uint64_t a1)
{
  v18[1] = *MEMORY[0x1895F89C0];
  v16[0] = 0LL;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  v18[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:]( v2,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v18 count:1]);
  -[NSFetchRequest setPredicate:]( v2,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"database.databaseScopeNum = %@ AND %K == YES", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", *(void *)(a1 + 72)), @"needsNewShareInvitation"]);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v16];
  if (v16[0])
  {
    id result = v16[0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  else
  {
    id v5 = v3;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        __int128 v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((void *)&v12 + 1) + 8LL * (void)v8));
          id v10 = objc_alloc(getCloudKitCKRecordIDClass());
          uint64_t v11 = (void *)[v10 initWithRecordName:getCloudKitCKRecordNameZoneWideShare[0]() zoneID:v9];
          [*(id *)(a1 + 48) addObject:v11];

          __int128 v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id result = (id)[v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        id v6 = result;
      }

      while (result);
    }
  }

  return result;
}

uint64_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3_74( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  if (a4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a4;
    id v5 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting records in Shared database %@ in response to Manatee identity loss failed, %@"];
    _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
    objc_autoreleasePoolPop(v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4_77( uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_78;
    v7[3] = &unk_189EA9DC8;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_78(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v2 = *(void **)(a1 + 32);
  id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  id v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v6);
        id v27 = 0LL;
        __int128 v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v7,  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v27);
        uint64_t v9 = v27;
        if (v27) {
          goto LABEL_17;
        }
        if (v8)
        {
          -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v8, "setNeedsRecoveryFromIdentityLoss:", 0LL);
        }

        else
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
          uint64_t v10 = [NSString stringWithUTF8String:"Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@"];
          _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          id v17 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v27;
            _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@",  buf,  0xCu);
          }
        }

        if ([*(id *)(a1 + 48) hasChanges])
        {
          if (([*(id *)(a1 + 48) save:&v27] & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v19 = __ckLoggingOverride;
            uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"];
            _NSCoreDataLog( v19 != 0,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            objc_autoreleasePoolPop(v18);
            uint64_t v9 = v27;
            if (v27)
            {
LABEL_17:
              id result = v9;
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
              *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
              return result;
            }
          }
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2;
    v7[3] = &unk_189EA9E18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2(uint64_t a1)
{
  v6[5] = *(id *)MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  id v2 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  *(void *)(a1 + 80));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 8);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v2,  [v4 databaseScope],  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v6);
  if (v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = -[NSManagedObject hasRecordZone](v5, "hasRecordZone");
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v6[0];
  }
}

- (uint64_t)_saveZone:(void *)a3 error:
{
  v40[1] = *MEMORY[0x1895F89C0];
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  __int128 v29 = __Block_byref_object_copy__25;
  __int128 v30 = __Block_byref_object_dispose__25;
  uint64_t v31 = 0LL;
  uint64_t v6 = *(dispatch_semaphore_s **)(a1 + 48);
  id v7 = objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]());
  v40[0] = a2;
  __int128 v8 = (void *)objc_msgSend( v7,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v40, 1),  0);
  -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1 + 72) options], v8);
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v25[3] = 0LL;
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke;
  v24[3] = &unk_189EA9F58;
  v24[6] = &v26;
  v24[7] = v25;
  v24[8] = &v32;
  v24[4] = a2;
  v24[5] = v6;
  [v8 setModifyRecordZonesCompletionBlock:v24];
  [*(id *)(a1 + 24) addOperation:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  if (!*((_BYTE *)v33 + 24)) {
    goto LABEL_3;
  }
  uint64_t v10 = [*(id *)(a1 + 8) databaseScope];
  id v11 = *(id *)(a1 + 56);
  v23[0] = v9;
  v23[1] = 3221225472LL;
  v23[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2;
  v23[3] = &unk_189EA9E40;
  v23[4] = v11;
  v23[5] = a2;
  v23[6] = v25;
  v23[7] = &v32;
  v23[8] = &v26;
  v23[9] = v10;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v11, (uint64_t)v23);

  if (!*((_BYTE *)v33 + 24))
  {
LABEL_3:
    id v12 = (id)v27[5];
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v38 = 1024;
        int v39 = 983;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v27[5] = 0LL;
  uint64_t v21 = *((unsigned __int8 *)v33 + 24);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v21;
}

- (uint64_t)_deleteZone:(void *)a3 error:
{
  v36[1] = *MEMORY[0x1895F89C0];
  uint64_t v28 = 0LL;
  __int128 v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  uint64_t v25 = __Block_byref_object_copy__25;
  uint64_t v26 = __Block_byref_object_dispose__25;
  uint64_t v27 = 0LL;
  uint64_t v6 = *(dispatch_semaphore_s **)(a1 + 48);
  id v7 = objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]());
  v36[0] = [a2 zoneID];
  __int128 v8 = (void *)objc_msgSend( v7,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v36, 1));
  -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1 + 72) options], v8);
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke;
  v21[3] = &unk_189EA9E68;
  v21[6] = &v28;
  v21[7] = &v22;
  v21[4] = a2;
  v21[5] = v6;
  [v8 setModifyRecordZonesCompletionBlock:v21];
  [*(id *)(a1 + 24) addOperation:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v9 = (id)v23[5];
  if (!*((_BYTE *)v29 + 24))
  {
    uint64_t v12 = v23[5];
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v34 = 1024;
        int v35 = 1016;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  uint64_t v10 = *((unsigned __int8 *)v29 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

uint64_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a4;
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a2);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend( (id)objc_msgSend(v10, "zoneID"),  "isEqual:",  objc_msgSend(*(id *)(a1 + 32), "zoneID")))
          {
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 capabilities];
            *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
          }
        }

        uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3;
    v7[3] = &unk_189EA9E18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

uint64_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3(uint64_t a1)
{
  id v5 = 0LL;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)[*(id *)(a1 + 32) zoneID],  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:]( v2,  "setSupportsFetchChanges:",  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1),  -[NSManagedObject setSupportsRecordSharing:]( v3,  "setSupportsRecordSharing:",  (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 2) & 1),  -[NSManagedObject setSupportsAtomicChanges:]( v3,  "setSupportsAtomicChanges:",  (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 1) & 1),  -[NSManagedObject setSupportsZoneSharing:]( v3,  "setSupportsZoneSharing:",  (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 3) & 1),  -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1),  uint64_t result = [*(id *)(a1 + 48) save:&v5],  (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
  }

  return result;
}

uint64_t __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  else {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = a4;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    id v4 = a3;
LABEL_11:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v4;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

  if (!a2)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Zone fetch didn't return an error or a dictionary of zones"];
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v20);
    __int128 v13 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Zone fetch didn't return an error or a dictionary of zones",  buf,  2u);
    }

    id v14 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v15 = *MEMORY[0x189607460];
    uint64_t v22 = *MEMORY[0x1896075F0];
    uint64_t v23 = [NSString stringWithFormat:@"Could not locate the desired zone in the database with scope '%@': %@", softLinkCKDatabaseScopeString(*(void *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID")];
    uint64_t v16 = (void *)MEMORY[0x189603F68];
    uint64_t v17 = &v23;
    uint64_t v18 = &v22;
    goto LABEL_10;
  }

  id v5 = (void *)objc_msgSend(a2, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  if (!v5)
  {
    id v14 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v15 = *MEMORY[0x189607460];
    uint64_t v24 = *MEMORY[0x1896075F0];
    v25[0] = [NSString stringWithFormat:@"Could not locate the desired zone in the database with scope '%@': %@", softLinkCKDatabaseScopeString(*(void *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID")];
    uint64_t v16 = (void *)MEMORY[0x189603F68];
    uint64_t v17 = v25;
    uint64_t v18 = &v24;
LABEL_10:
    id v4 = (id)objc_msgSend( v14,  "initWithDomain:code:userInfo:",  v15,  134400,  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    goto LABEL_11;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v5 capabilities];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_87(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2;
    v7[3] = &unk_189EA9E18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    __int128 v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2(uint64_t a1)
{
  id v5 = 0LL;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)[*(id *)(a1 + 32) zoneID],  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:]( v2,  "setSupportsFetchChanges:",  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1),  -[NSManagedObject setSupportsRecordSharing:]( v3,  "setSupportsRecordSharing:",  (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 2) & 1),  -[NSManagedObject setSupportsAtomicChanges:]( v3,  "setSupportsAtomicChanges:",  (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 1) & 1),  -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1),  uint64_t result = [*(id *)(a1 + 48) save:&v5],  (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
  }

  return result;
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_89(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_90;
    v6[3] = &unk_189EA9B78;
    uint64_t v8 = *(void *)(a1 + 64);
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v2;
    id v6[6] = v3;
    __int128 v7 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v4 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v5 = *MEMORY[0x189607460];
    uint64_t v9 = *MEMORY[0x1896075F0];
    v10[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v4,  "initWithDomain:code:userInfo:",  v5,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v10,  &v9,  1));
  }
}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_90(uint64_t a1)
{
  id v5 = 0LL;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)[*(id *)(a1 + 32) zoneID],  *(void *)(a1 + 72),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", 0LL),
        -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", 0LL),
        -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", 1LL),
        -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1LL),
        uint64_t result = [*(id *)(a1 + 48) save:&v5],
        (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  }

  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v8[1] = 3221225472LL;
    __int128 v4 = *(_OWORD *)(a1 + 64);
    __int128 v9 = *(_OWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1895F87A8];
    v8[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2;
    v8[3] = &unk_189EA9EE0;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 80);
    v8[4] = v5;
    v8[5] = v2;
    v8[6] = v3;
    __int128 v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v8);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v6 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v7 = *MEMORY[0x189607460];
    uint64_t v12 = *MEMORY[0x1896075F0];
    v13[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_msgSend( v6,  "initWithDomain:code:userInfo:",  v7,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v13,  &v12,  1));
  }
}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2(uint64_t a1)
{
  v5[5] = *(id *)MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  *(void **)(a1 + 32),  *(void *)(a1 + 88),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)v5);
  uint64_t v3 = v2;
  if (!v2
    || (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -[NSManagedObject hasSubscription]( v2,  "hasSubscription"),  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend( (id)-[NSManagedObject database](v3, "database"),  "hasSubscription"),  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "save:", v5),  (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    uint64_t result = (uint64_t)v5[0];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = result;
  }

  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_3(uint64_t a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4;
    v7[3] = &unk_189EA9E40;
    v7[4] = v2;
    v7[5] = v3;
    __int128 v8 = *(_OWORD *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v11 = *MEMORY[0x1896075F0];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v12,  &v11,  1));
  }
}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4(uint64_t a1)
{
  v4[5] = *(id *)MEMORY[0x1895F89C0];
  v4[0] = 0LL;
  id v2 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  *(void *)(a1 + 72),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)v4);
  if (!v2
    || (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[NSManagedObject hasSubscription]( v2,  "hasSubscription"),  uint64_t result = [*(id *)(a1 + 40) save:v4],  (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    uint64_t result = (uint64_t)v4[0];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  }

  return result;
}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_5( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(a2);
      }
      if (objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v11), "subscriptionID"),  "isEqualToString:",  objc_msgSend(*(id *)(a1 + 32), "subscriptionID"))) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [a2 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    int v12 = 1;
    if (a2) {
      goto LABEL_13;
    }
  }

  else
  {
LABEL_9:
    int v12 = 0;
    if (a2) {
      goto LABEL_13;
    }
  }

  uint64_t v13 = [NSString stringWithUTF8String:"Saved subscriptions was unexpectedly nil."];
  _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, v44);
  uint64_t v20 = (os_log_s *)__pflogFaultLog;
  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
LABEL_13:
    if (a4) {
      goto LABEL_14;
    }
LABEL_21:
    if ((v12 & 1) != 0) {
      goto LABEL_22;
    }
    id v41 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v42 = *MEMORY[0x189607460];
    uint64_t v49 = *MEMORY[0x1896075F0];
    uint64_t v50 = [NSString stringWithFormat:@"Subscription save succeeded but did not return '%@' as a saved subscription", objc_msgSend(*(id *)(a1 + 32), "subscriptionID")];
    id v40 = (id)objc_msgSend( v41,  "initWithDomain:code:userInfo:",  v42,  134400,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
LABEL_24:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v40;
    goto LABEL_25;
  }

  *(_WORD *)buf = 0;
  _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Saved subscriptions was unexpectedly nil.",  buf,  2u);
  if (!a4) {
    goto LABEL_21;
  }
LABEL_14:
  if (v12)
  {
    uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v22 = __ckLoggingOverride != 0;
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save our subscription and had an operation error, %@"];
    _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[PFCloudKitSetupAssistant _setupDatabaseSubscriptionIfNecessary:]_block_invoke");
    objc_autoreleasePoolPop(v21);
LABEL_22:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    goto LABEL_25;
  }

  if (![a2 count])
  {
    id v40 = a4;
    goto LABEL_24;
  }

  uint64_t v30 = [NSString stringWithUTF8String:"Saved some subscriptions (%lu) %@, but had an operation error, %@"];
  uint64_t v31 = [a2 count];
  _NSCoreDataLog(17LL, v30, v32, v33, v34, v35, v36, v37, v31);
  __int16 v38 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v39 = [a2 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v52 = v39;
    __int16 v53 = 2112;
    v54 = a2;
    __int16 v55 = 2112;
    uint64_t v56 = a4;
    _os_log_fault_impl( &dword_186681000,  v38,  OS_LOG_TYPE_FAULT,  "CoreData: Saved some subscriptions (%lu) %@, but had an operation error, %@",  buf,  0x20u);
  }

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_102(uint64_t a1)
{
  id v4 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v4)
  {
    id v2 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v2,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_103;
    v5[3] = &unk_189EA9E40;
    v5[4] = v4;
    v5[5] = v2;
    __int128 v6 = *(_OWORD *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = v3;
    -[NSManagedObjectContext performBlockAndWait:](v2, "performBlockAndWait:", v5);
  }
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_103(uint64_t a1)
{
  id v9 = 0LL;
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2 == 2)
  {
    id v3 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:]( &OBJC_CLASS___PFCloudKitSerializer,  "defaultRecordZoneIDForDatabaseScope:",  2LL);
    id v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v3,  *(void *)(a1 + 72),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)&v9);
    id v5 = (_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    if (v4)
    {
      __int128 v6 = v4;
      if (*v5) {
        objc_msgSend((id)-[NSManagedObject database](v4, "database"), "setHasSubscription:", 1);
      }
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        -[NSManagedObject setHasSubscription:](v6, "setHasSubscription:", 0LL);
      }
      if ([*(id *)(a1 + 40) save:&v9]) {
        goto LABEL_10;
      }
      id v5 = (_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    }

    *id v5 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v9;
LABEL_10:

    return;
  }

  uint64_t v7 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  v2,  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)&v9);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!v7) {
    goto LABEL_15;
  }
  if (*(_BYTE *)(v8 + 24))
  {
    -[NSManagedObject setHasSubscription:](v7, "setHasSubscription:", 1LL);
    if (([*(id *)(a1 + 40) save:&v9] & 1) == 0)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
LABEL_15:
      *(_BYTE *)(v8 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v9;
    }
  }

uint64_t __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __int128 v6 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetched user recordID for store %@: %@\n%@"];
  _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    id v15 = a2;
    uint64_t v16 = *(void *)(a1 + 56);
  }

  else
  {
    id v15 = a3;
    uint64_t v16 = *(void *)(a1 + 64);
  }

  *(void *)(*(void *)(v16 + 8) + 40LL) = v15;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2(uint64_t a1)
{
  id v4 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v4)
  {
    uint64_t v2 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v2,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3;
    v5[3] = &unk_189EA9FA8;
    v5[4] = v4;
    v5[5] = v2;
    __int128 v3 = *(_OWORD *)(a1 + 56);
    __int128 v6 = *(_OWORD *)(a1 + 40);
    __int128 v7 = v3;
    -[NSManagedObjectContext performBlockAndWait:](v2, "performBlockAndWait:", v5);
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3(uint64_t a1)
{
  v46[2] = *MEMORY[0x1895F89C0];
  v41[0] = 0LL;
  v46[0] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v46[1] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  uint64_t v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  [MEMORY[0x189603F18] arrayWithObjects:v46 count:2],  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)v41);
  __int128 v3 = v2;
  if (!v2)
  {
    uint64_t v18 = a1 + 64;
LABEL_24:
    *(_BYTE *)(*(void *)(*(void *)v18 + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v41[0];
    return;
  }

  id v4 = (NSManagedObject *)[v2 objectForKey:@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"];
  if (!v4) {
    id v4 = +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey",  0LL,  *(void *)(a1 + 32),  *(void **)(a1 + 40));
  }
  if (!-[NSManagedObject BOOLValue](v4, "BOOLValue"))
  {
    -[NSManagedObject setBoolValue:](v4, "setBoolValue:", 1LL);
    +[NSCKMetadataEntry insertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:]( (uint64_t)NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey",  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName],  *(void *)(a1 + 32),  *(void **)(a1 + 40));
    goto LABEL_22;
  }

  id v5 = (void *)[v3 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
  __int128 v6 = v5;
  if (!v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t v19 = (void *)MEMORY[0x186E3E5D8]();
    unint64_t v20 = __ckLoggingOverride;
    uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record changed from nil to %@"];
    if (v20 >= 3) {
      uint64_t v28 = 3LL;
    }
    else {
      uint64_t v28 = v20;
    }
    _NSCoreDataLog( v28,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
    objc_autoreleasePoolPop(v19);
    id v29 = objc_alloc(MEMORY[0x189607870]);
    v42[0] = @"PFCloudKitNewUserIdentityKey";
    uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    v42[1] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v43[0] = v30;
    v43[1] = &unk_189F04470;
    uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:2];
    goto LABEL_21;
  }

  char v7 = objc_msgSend( (id)objc_msgSend(v5, "stringValue"),  "isEqualToString:",  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "recordName"));
  uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
  unint64_t v9 = __ckLoggingOverride;
  if ((v7 & 1) == 0)
  {
    else {
      uint64_t v32 = __ckLoggingOverride;
    }
    uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record has changed from %@ to %@"];
    [v6 stringValue];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    _NSCoreDataLog( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_3");
    objc_autoreleasePoolPop(v8);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v29 = objc_alloc(MEMORY[0x189607870]);
    v44[0] = @"PFCloudKitOldUserIdentityKey";
    v45[0] = [v6 stringValue];
    v44[1] = @"PFCloudKitNewUserIdentityKey";
    uint64_t v40 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    v44[2] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v45[1] = v40;
    v45[2] = &unk_189F04458;
    uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:3];
LABEL_21:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v29 initWithDomain:*MEMORY[0x189607460] code:134405 userInfo:v31];
    goto LABEL_22;
  }

  uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record matches store: %@"];
  if (v9 >= 0x10) {
    uint64_t v17 = 16LL;
  }
  else {
    uint64_t v17 = v9;
  }
  _NSCoreDataLog( v17,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
  objc_autoreleasePoolPop(v8);
LABEL_22:
  uint64_t v18 = a1 + 64;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)
    && ([*(id *)(a1 + 40) save:v41] & 1) == 0)
  {
    goto LABEL_24;
  }

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_116(uint64_t a1)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    __int128 v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:]( v3,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.setup");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_117;
    v7[3] = &unk_189EA9FD0;
    v7[4] = v2;
    v7[5] = v3;
    __int128 v4 = *(_OWORD *)(a1 + 56);
    __int128 v8 = *(_OWORD *)(a1 + 40);
    __int128 v9 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v10 = *MEMORY[0x1896075F0];
    v11[0] = [NSString stringWithFormat:@"Identity check was cancelled because the store was removed from the coordinator."];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  134407,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v11,  &v10,  1));
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_117(uint64_t a1)
{
  v33[2] = *MEMORY[0x1895F89C0];
  id v30 = 0LL;
  v33[0] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v33[1] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  uint64_t v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  [MEMORY[0x189603F18] arrayWithObjects:v33 count:2],  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t)&v30);
  if (!v2) {
    goto LABEL_16;
  }
  __int128 v3 = v2;
  if (!objc_msgSend( (id)objc_msgSend( v2,  "objectForKey:",  @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"),  "BOOLValue"))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v12 = __ckLoggingOverride;
    }
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: First identity fetch failed due to authentication but store was never assigned to a user record: %@"];
    _NSCoreDataLog( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
    objc_autoreleasePoolPop(v11);
    unint64_t v20 = (void *)[v3 objectForKey:@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"];
    if (v20) {
      [v20 setBoolValue:1];
    }
    else {
      +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey",  1LL,  *(void *)(a1 + 32),  *(void **)(a1 + 40));
    }
    if ([*(id *)(a1 + 40) save:&v30]) {
      return;
    }
LABEL_16:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    id v10 = v30;
    goto LABEL_17;
  }

  uint64_t v4 = [v3 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    *(_BYTE *)(v5 + 24) = 0;
    id v7 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v8 = *MEMORY[0x189607460];
    v31[0] = @"PFCloudKitOldUserIdentityKey";
    uint64_t v9 = [v6 stringValue];
    v31[1] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v32[0] = v9;
    v32[1] = &unk_189F04440;
    id v10 = (id)objc_msgSend( v7,  "initWithDomain:code:userInfo:",  v8,  134405,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
LABEL_17:
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v10;
    return;
  }

  *(_BYTE *)(v5 + 24) = 1;
  uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v22 = __ckLoggingOverride;
  }
  uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Identity fetch failed due to authentication but store was never assigned to a user record: %@"];
  _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
  objc_autoreleasePoolPop(v21);
}

void __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke( uint64_t *a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKEvent entityPath](&OBJC_CLASS___NSCKEvent, "entityPath"));
  uint64_t v3 = a1[4];
  if (v3)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:](v3, v2, (id *)(*(void *)(a1[5] + 8) + 40LL));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
      id v5 = *(id *)(*(void *)(a1[5] + 8) + 40LL);
    }

    else if (v4 >= 0x4E21)
    {
      -[NSFetchRequest setFetchLimit:](v2, "setFetchLimit:", v4 - 10000);
      -[NSFetchRequest setResultType:](v2, "setResultType:", 1LL);
      v10[0] = [MEMORY[0x189607A20] sortDescriptorWithKey:@"SELF" ascending:1];
      -[NSFetchRequest setSortDescriptors:]( v2,  "setSortDescriptors:",  [MEMORY[0x189603F18] arrayWithObjects:v10 count:1]);
      uint64_t v6 = [(id)a1[4] executeFetchRequest:v2 error:*(void *)(a1[5] + 8) + 40];
      if (v6)
      {
        id v7 = -[NSBatchDeleteRequest initWithObjectIDs:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithObjectIDs:",  v6);
        -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0LL);
        *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)a1[4],  "executeRequest:error:",  v7,  *(void *)(a1[5] + 8) + 40),  "result"),  "BOOLValue");
        if (!*(_BYTE *)(*(void *)(a1[6] + 8) + 24LL)) {
          id v8 = *(id *)(*(void *)(a1[5] + 8) + 40LL);
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
        id v9 = *(id *)(*(void *)(a1[5] + 8) + 40LL);
      }
    }
  }

@end