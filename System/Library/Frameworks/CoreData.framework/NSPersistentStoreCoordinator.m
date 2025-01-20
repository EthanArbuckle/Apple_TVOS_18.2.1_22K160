@interface NSPersistentStoreCoordinator
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)removePersistentHistoryFromPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error;
+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error;
+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error;
+ (NSDictionary)registeredStoreTypes;
+ (NSPersistentStoreCoordinator)alloc;
+ (NSPersistentStoreCoordinator)allocWithZone:(_NSZone *)a3;
+ (const)_classForPersistentStoreAtURL:(uint64_t)a1;
+ (id)ubiquityStoreURLForStoreURL:(id)a3 ubiquityIdentityToken:(id)a4 ubiquityName:(id)a5;
+ (uint64_t)_beginPowerAssertionNamed:(void *)a3 withAssert:;
+ (uint64_t)_shouldDebugAllTaskAssertions;
+ (uint64_t)_storeClassForStoreType:(uint64_t)a1;
+ (void)_endPowerAssertionWithAssert:(void *)a3 andApp:;
+ (void)_registerCoreDataStoreClass:(Class)a3 forStoreType:(id)a4;
+ (void)_setMetadata:(void *)a3 forPersistentStoreOfType:(void *)a4 URL:(uint64_t)a5 options:(void *)a6 error:;
+ (void)initialize;
+ (void)registerStoreClass:(Class)storeClass forStoreType:(NSString *)storeType;
- (BOOL)_canRouteToStore:(void *)a3 forContext:;
- (BOOL)_canSaveGraphRootedAtObject:(void *)value intoStore:(uint64_t)a2 withPreviouslyChecked:(CFSetRef)theSet withAcceptableEntities:(const __CFSet *)a4;
- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5;
- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_finishDeferredLightweightMigrationTasks:(void *)a3 withError:;
- (BOOL)_refreshTriggerValuesInStore:(id)a3 error:(id *)a4;
- (BOOL)_rekeyPersistentStoreAtURL:(id)a3 type:(id)a4 options:(id)a5 withKey:(id)a6 error:(id *)a7;
- (BOOL)_removeAllPersistentStores:(id *)a3;
- (BOOL)_removePersistentStore:(unint64_t)a1;
- (BOOL)_removePersistentStore:(void *)a3 error:;
- (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 storeType:(id)a7 error:(id *)a8;
- (BOOL)_validateQueryGeneration:(id)a3 error:(id *)a4;
- (BOOL)finishDeferredLightweightMigration:(NSError *)error;
- (BOOL)finishDeferredLightweightMigrationTask:(NSError *)error;
- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (BOOL)removePersistentStore:(NSPersistentStore *)store error:(NSError *)error;
- (BOOL)setURL:(NSURL *)url forPersistentStore:(NSPersistentStore *)store;
- (NSArray)persistentStores;
- (NSDictionary)metadataForPersistentStore:(NSPersistentStore *)store;
- (NSManagedObjectID)managedObjectIDForURIRepresentation:(NSURL *)url;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentHistoryToken)currentPersistentHistoryTokenFromStores:(NSArray *)stores;
- (NSPersistentStore)addPersistentStoreWithType:(NSString *)storeType configuration:(NSString *)configuration URL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error;
- (NSPersistentStore)migratePersistentStore:(NSPersistentStore *)store toURL:(NSURL *)URL options:(NSDictionary *)options withType:(NSString *)storeType error:(NSError *)error;
- (NSPersistentStore)persistentStoreForURL:(NSURL *)URL;
- (NSPersistentStoreCoordinator)init;
- (NSPersistentStoreCoordinator)initWithManagedObjectModel:(NSManagedObjectModel *)model;
- (NSString)name;
- (NSTemporaryObjectID)managedObjectIDForURIRepresentation:(void *)a3 error:;
- (NSTemporaryObjectID)managedObjectIDFromUTF8String:(uint64_t)a3 length:(void *)a4 error:;
- (NSURL)URLForPersistentStore:(NSPersistentStore *)store;
- (_NSPersistentHistoryToken)_retainedChangeTokenFromStores:(_NSPersistentHistoryToken *)result;
- (_NSQueryGenerationToken)_retainedIdentifierFromStores:(_NSQueryGenerationToken *)result;
- (const)_storeClassForStoreWithType:(const char *)result URL:(uint64_t)a2 options:(void *)a3;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_doAddPersistentStoreWithDescription:(void *)a3 privateCopy:(int)a4 completeOnMainThread:(uint64_t)a5 withHandler:;
- (id)_exceptionNoStoreSaveFailureForError:(id)a3 recommendedFrame:(int *)a4;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_reopenQueryGenerationWithIdentifier:(uint64_t)a3 inStoreWithIdentifier:(void *)a4 error:;
- (id)_retainedCurrentQueryGeneration:(id)a3;
- (id)currentQueryGenerationTokenFromStores:(id)a3;
- (id)delegate;
- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)persistentStoreForIdentifier:(id)a3;
- (os_unfair_lock_s)_xpcBundleIdentifier;
- (os_unfair_lock_s)_xpcProcessName;
- (uint64_t)_checkForSkewedEntityHashes:(uint64_t)result metadata:(void *)a2;
- (uint64_t)_checkForTombstoneSkew:(uint64_t)a3 metadata:(uint64_t)a4 configuration:;
- (uint64_t)_conflictsWithRowCacheForObject:(void *)a3 withContext:(void *)a4 andStore:;
- (uint64_t)_doPreSaveAssignmentsForObjects:(void *)a3 intoStores:;
- (uint64_t)_handleFaultingError:(uint64_t)a3 fromContext:;
- (uint64_t)_newConflictRecordForObject:(unint64_t)a3 andOriginalRow:(void *)a4 withContext:;
- (uint64_t)_realStoreTypeForStoreWithType:(uint64_t)a3 URL:(uint64_t)a4 options:(void *)a5 error:;
- (uint64_t)_repairIndiciesForStoreWithIdentifier:(uint64_t)a3 synchronous:;
- (uint64_t)applyMigrationStage:(void *)a3 withContext:(void *)a4 error:;
- (unint64_t)migrateStoreWithContext:(void *)a3 error:;
- (void)_addPersistentStore:(uint64_t)a3 identifier:;
- (void)_copyMetadataFromStore:(void *)a3 toStore:(uint64_t)a4 migrationManager:;
- (void)_introspectLastErrorAndThrow;
- (void)_persistentStoreForIdentifier:(uint64_t)a1;
- (void)_postStoreRemoteChangeNotificationsForStore:(uint64_t)a3 andState:;
- (void)_postStoresChangedNotificationsForStores:(uint64_t)a3 changeKey:(void *)a4 options:;
- (void)_retainedPersistentStores;
- (void)_routeHeavyweightBlock:(unint64_t)a1;
- (void)_routeLightweightBlock:(uint64_t)a3 toStore:;
- (void)_setIsMigrating:(unint64_t)a1;
- (void)_setXPCBundleIdentifier:(uint64_t)a1;
- (void)_setXPCProcessName:(uint64_t)a1;
- (void)addPersistentStoreWithDescription:(NSPersistentStoreDescription *)storeDescription completionHandler:(void *)block;
- (void)createPersistentContainerForMigrationContext:(void *)a1 withModel:(uint64_t)a2 andExecuteBlock:(uint64_t)a3;
- (void)dealloc;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)performBlock:(void *)block;
- (void)performBlockAndWait:(void *)block;
- (void)setDelegate:(id)a3;
- (void)setMetadata:(NSDictionary *)metadata forPersistentStore:(NSPersistentStore *)store;
- (void)setName:(NSString *)name;
@end

@implementation NSPersistentStoreCoordinator

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  v6 = request;
  uint64_t v112 = *MEMORY[0x1895F89C0];
  uint64_t v99 = 0LL;
  v100 = &v99;
  uint64_t v101 = 0x3052000000LL;
  v102 = __Block_byref_object_copy__17;
  v103 = __Block_byref_object_dispose__17;
  uint64_t v104 = 0LL;
  uint64_t v93 = 0LL;
  v94 = &v93;
  uint64_t v95 = 0x3052000000LL;
  v96 = __Block_byref_object_copy__17;
  v97 = __Block_byref_object_dispose__17;
  uint64_t v98 = 0LL;
  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x2020000000LL;
  char v92 = 0;
  NSPersistentStoreRequestType v9 = -[NSPersistentStoreRequest requestType](request, "requestType");
  unint64_t v10 = v9;
  if (v9 == NSFetchRequestType)
  {
    uint64_t v11 = -[NSPersistentStoreRequest resultType](v6, "resultType");
    LOBYTE(v12) = -[NSPersistentStoreRequest _isAsyncRequest](v6, "_isAsyncRequest");
    char v77 = 0;
    v75 = 0LL;
    if (v11 == 4) {
      unint64_t v10 = 3LL;
    }
    else {
      unint64_t v10 = 1LL;
    }
    uint64_t v88 = 0LL;
    goto LABEL_11;
  }

  uint64_t v88 = 0LL;
  if (v9 - 5 < 3 || v9 == NSSaveRequestType) {
    goto LABEL_10;
  }
  if (v9 == 8)
  {
    int v12 = -[NSPersistentStoreRequest isDelete](v6, "isDelete");
    if (v12)
    {
LABEL_10:
      v75 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Executing write request",  &v88);
      LOBYTE(v12) = 0;
      char v77 = 1;
      goto LABEL_11;
    }

    char v77 = 0;
    v75 = 0LL;
    unint64_t v10 = 8LL;
  }

  else
  {
    char v77 = 0;
    LOBYTE(v12) = 0;
    v75 = 0LL;
  }

- (void)_routeHeavyweightBlock:(unint64_t)a1
{
  if (a1)
  {
    uint64_t v12 = 0LL;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    uint64_t v6 = 0LL;
    v7 = &v6;
    uint64_t v8 = 0x3052000000LL;
    NSPersistentStoreRequestType v9 = __Block_byref_object_copy__17;
    unint64_t v10 = __Block_byref_object_dispose__17;
    uint64_t v11 = 0LL;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke;
    v5[3] = &unk_189EA8BF0;
    v5[6] = &v12;
    v5[7] = &v6;
    v5[4] = a1;
    v5[5] = a2;
    _perform_0(a1, (uint64_t)v5);
    if (*((_BYTE *)v13 + 24))
    {
      if (v7[5])
      {
        id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7[5]);

        [v3 drain];
        id v4 = 0LL;
      }
    }

    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v12, 8);
  }

void __55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if ((*(_WORD *)(v2 + 24) & 2) != 0)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    os_unfair_lock_lock_with_options();
    *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 48) mutableCopy];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32LL));
  }

  else
  {
    id v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](v2);
    (*(void (**)(void))(a1[5] + 16LL))();
  }

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  uint32_t v38 = &v37;
  uint64_t v39 = 0x3052000000LL;
  id v40 = __Block_byref_object_copy__17;
  v41 = __Block_byref_object_dispose__17;
  uint64_t v42 = 0LL;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3052000000LL;
  v34 = __Block_byref_object_copy__17;
  v35 = __Block_byref_object_dispose__17;
  uint64_t v36 = 0LL;
  if (a5 && _PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a5, a2);
  }
  uint64_t v11 = [a4 persistentStore];
  id v30 = 0LL;
  if (a5) {
    uint64_t v12 = *((void *)a5 + 20);
  }
  else {
    uint64_t v12 = 0LL;
  }
  int v13 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
  if (v13 != (NSQueryGenerationToken *)[a5 _queryGenerationToken]) {
    goto LABEL_7;
  }
  id v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v12);
  if (!v18)
  {
    v20 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134502 userInfo:0];
    id v30 = v20;
    if (!v20)
    {
LABEL_15:
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v45 = 1024;
        int v46 = 4683;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }

      goto LABEL_20;
    }

- (void)_routeLightweightBlock:(uint64_t)a3 toStore:
{
  if (a1)
  {
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3052000000LL;
    unint64_t v10 = __Block_byref_object_copy__17;
    uint64_t v11 = __Block_byref_object_dispose__17;
    uint64_t v12 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke;
    v6[3] = &unk_189EA8BC8;
    v6[4] = a1;
    v6[5] = a3;
    v6[7] = &v13;
    v6[8] = &v7;
    v6[6] = a2;
    _perform_0(a1, (uint64_t)v6);
    if (*((_BYTE *)v14 + 24))
    {
      if (v8[5])
      {
        id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v8[5]);

        [v4 drain];
        id v5 = 0LL;
      }
    }

    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v13, 8);
  }

void __63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke(uint64_t a1)
{
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24LL) & 2) == 0) {
    goto LABEL_2;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  os_unfair_lock_lock_with_options();
  if ([*(id *)(*(void *)(a1 + 32) + 48) indexOfObjectIdenticalTo:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = *(id *)(a1 + 40);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32LL));
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) _persistentStoreCoordinator];
    _NSCoreDataLog( 1LL,  (uint64_t)@" API Misuse: Attempt to serialize store access on non-owning coordinator (PSC = %p, store PSC = %p)",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
    if (!byte_18C4ABDBB)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
LABEL_2:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

- (BOOL)_canRouteToStore:(void *)a3 forContext:
{
  if (result)
  {
    uint64_t v4 = (void *)[a3 _queryGenerationToken];
    if ([v4 _isEnabled]) {
      return +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken") != v4 && -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v4, a2) != 0LL;
    }
    else {
      return 1LL;
    }
  }

  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3052000000LL;
  uint32_t v38 = __Block_byref_object_copy__17;
  uint64_t v39 = __Block_byref_object_dispose__17;
  uint64_t v40 = 0LL;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  id v32 = __Block_byref_object_copy__17;
  uint64_t v33 = __Block_byref_object_dispose__17;
  uint64_t v34 = 0LL;
  if (a4 && _PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a4, a2);
  }
  uint64_t v9 = [a3 persistentStore];
  uint64_t v28 = 0LL;
  if (a4) {
    uint64_t v10 = *((void *)a4 + 20);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
  if (v11 != (NSQueryGenerationToken *)[a4 _queryGenerationToken]) {
    goto LABEL_7;
  }
  id v16 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v10);
  if (!v16)
  {
    id v18 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134502 userInfo:0];
    uint64_t v28 = v18;
    if (!v18)
    {
LABEL_15:
      uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v26 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v42 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v43 = 1024;
        int v44 = 4625;
        _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }

      goto LABEL_20;
    }

id __95__NSPersistentStoreCoordinator__NSInternalMethods__newValuesForObjectWithID_withContext_error___block_invoke( uint64_t a1,  void *a2)
{
  v7[3] = *MEMORY[0x1895F89C0];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a2 newValuesForObjectWithID:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    return *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  return result;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7 = [a3 count];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v8[3] = &unk_189EA8EF0;
  v8[5] = a4;
  v8[6] = v7;
  v8[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((unint64_t)self, (uint64_t)v8);
}

void __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 48) == 1LL)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      if ([a2 indexOfObjectIdenticalTo:v4] != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v6 = [v5 supportsGenerationalQuerying];
        uint64_t v7 = *(void *)(a1 + 32);
        if (v6) {
          [v5 managedObjectContextDidRegisterObjectsWithIDs:v7 generation:*(void *)(a1 + 40)];
        }
        else {
          [v5 managedObjectContextDidRegisterObjectsWithIDs:v7];
        }
      }
    }
  }

  else
  {
    valueCallBacks.version = 0LL;
    valueCallBacks.retain = 0LL;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x189605250] + 16LL);
    valueCallBacks.equal = 0LL;
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v8 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, &valueCallBacks);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v24 = a1;
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v15 = [v14 persistentStore];
          if (v15)
          {
            id v16 = (const void *)v15;
            if ([a2 indexOfObjectIdenticalTo:v15] != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v8, v16);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0LL, 0LL);
                CFDictionarySetValue(v8, v16, Value);
              }

              CFArrayAppendValue((CFMutableArrayRef)Value, v14);
            }
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v11);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v18 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v8);
          }
          uint64_t v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          uint64_t v23 = CFDictionaryGetValue(v8, v22);
          else {
            [v22 managedObjectContextDidRegisterObjectsWithIDs:v23];
          }
        }

        uint64_t v19 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
      }

      while (v19);
    }

    CFRelease(v8);
  }

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7 = [a3 count];
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3052000000LL;
  v11[3] = __Block_byref_object_copy__17;
  v11[4] = __Block_byref_object_dispose__17;
  v11[5] = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v10[3] = &unk_189EA8F18;
  v10[6] = v11;
  v10[7] = v7;
  v10[4] = a3;
  v10[5] = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (dispatchQueue)
  {
    uint64_t v9 = malloc(0x28uLL);
    *uint64_t v9 = _Block_copy(v10);
    v9[1] = CFRetain(self);
    v9[2] = 8199LL;
    v9[3] = 0LL;
    v9[4] = 0LL;
    dispatch_async_f(dispatchQueue, v9, (dispatch_function_t)internalBlockToNSPersistentStoreCoordinatorPerform);
  }

  _Block_object_dispose(v11, 8);
}

- (void)_retainedPersistentStores
{
  v1 = (void *)a1;
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    v1 = (void *)v1[6];
    uint64_t v3 = v1;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = (void *)objc_opt_self();
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"SQLite"];
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"Binary"];
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"InMemory"];
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"NSXPCStore"];
  }

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)performBlock:(void *)block
{
  if (self->_dispatchQueue)
  {
    uint64_t v5 = malloc(0x28uLL);
    *uint64_t v5 = _Block_copy(block);
    v5[1] = CFRetain(self);
    v5[2] = 8199LL;
    v5[3] = 0LL;
    v5[4] = 0LL;
    dispatch_async_f( (dispatch_queue_t)self->_dispatchQueue,  v5,  (dispatch_function_t)developerSubmittedBlockToNSPersistentStoreCoordinatorPerform);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can only use -performBlock: on an NSPersistentStoreCoordinator that was created with a queue." userInfo:0]);
    developerSubmittedBlockToNSPersistentStoreCoordinatorPerform();
  }

- (void)performBlockAndWait:(void *)block
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!self->_dispatchQueue)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can only use -performBlockAndWait: on an NSPersistentStoreCoordinator that was created with a queue." userInfo:0]);
    goto LABEL_26;
  }

  uint64_t v4 = *(NSPersistentStoreCoordinator **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  v12[0] = block;
  v12[1] = self;
  v12[2] = 8196LL;
  v12[3] = v4;
  id v13 = 0LL;
  if (v4)
  {
    unint64_t v5 = 0LL;
    int v6 = 0;
    unint64_t v7 = (unint64_t)v4;
    while ((NSPersistentStoreCoordinator *)v7 != self)
    {
      if (v7 == v5) {
        goto LABEL_11;
      }
      if (!v5) {
        unint64_t v5 = v7;
      }
      unint64_t v7 = atomic_load((unint64_t *)(v7 + 8));
      if (!v7) {
        goto LABEL_12;
      }
    }

    int v6 = 1;
LABEL_11:
    if (v6)
    {
LABEL_21:
      gutsOfBlockToNSPersistentStoreCoordinatorPerform(v12);
      goto LABEL_23;
    }

- (void)setName:(NSString *)name
{
  uint64_t v4 = -[NSString copy](name, "copy");
  unint64_t v5 = (NSString *)v4;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __40__NSPersistentStoreCoordinator_setName___block_invoke;
    void v6[3] = &unk_189EA7648;
    v6[4] = self;
    v6[5] = v4;
    -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {

    self->_queueLabel = v5;
  }

void __40__NSPersistentStoreCoordinator_setName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];

  *(void *)(*(void *)(a1 + 32) + 56LL) = *(void *)(a1 + 40);
  __str[0] = 0;
  if (*(void *)(a1 + 40))
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", *(const void **)(a1 + 32));
    [*(id *)(a1 + 40) UTF8String];
    __strlcat_chk();
  }

  else
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", *(const void **)(a1 + 32));
  }

  uint64_t v2 = strdup(__str);
  __dmb(0xBu);
  id v3 = (unint64_t *)(*(void *)(*(void *)(a1 + 32) + 16LL) + *(unsigned __int16 *)(MEMORY[0x1895FADB0] + 2LL));
  unint64_t v4 = *v3;
  do
  {
    unint64_t v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      uint64_t block = MEMORY[0x1895F87A8];
      int v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_2;
      p_uint64_t block = &block;
      goto LABEL_10;
    }
  }

  while (__stlxr((unint64_t)v2, v3));
  if (!v4) {
    return;
  }
  uint64_t v8 = MEMORY[0x1895F87A8];
  int v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_3;
  p_uint64_t block = &v8;
  uint64_t v2 = (char *)v4;
LABEL_10:
  p_block[1] = 3221225472LL;
  p_block[2] = (uint64_t)v6;
  p_block[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
  p_block[4] = (uint64_t)v2;
  dispatch_async(MEMORY[0x1895F8AE0], p_block);
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_2(uint64_t a1)
{
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_3(uint64_t a1)
{
}

- (NSString)name
{
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  int v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  uint64_t v11 = 0LL;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __36__NSPersistentStoreCoordinator_name__block_invoke;
    v5[3] = &unk_189EA78C0;
    v5[4] = self;
    v5[5] = &v6;
    -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v5);
    uint64_t v2 = (void *)v7[5];
  }

  else
  {
    uint64_t v2 = (void *)-[NSString copy](self->_queueLabel, "copy");
    v7[5] = (uint64_t)v2;
  }

  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__NSPersistentStoreCoordinator_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

+ (void)_registerCoreDataStoreClass:(Class)a3 forStoreType:(id)a4
{
  if (!qword_18C4ABA48) {
    qword_18C4ABA48 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:5];
  }
  uint64_t v6 = [MEMORY[0x189607B18] valueWithPointer:a3];
  [(id)qword_18C4ABA48 setObject:v6 forKey:a4];
}

+ (void)registerStoreClass:(Class)storeClass forStoreType:(NSString *)storeType
{
  if (storeType)
  {
    unint64_t v4 = storeType;
    objc_sync_enter(a1);
    if (!qword_18C4ABA48 || ![(id)qword_18C4ABA48 objectForKey:v4])
    {
      unint64_t v7 = (void *)qword_18C4ABA50;
      if (qword_18C4ABA50)
      {
        if (storeClass)
        {
LABEL_6:
          uint64_t v8 = [MEMORY[0x189607B18] valueWithPointer:storeClass];
          [(id)qword_18C4ABA50 setObject:v8 forKey:v4];
LABEL_9:
          objc_sync_exit(a1);
          return;
        }
      }

      else
      {
        unint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4];
        qword_18C4ABA50 = (uint64_t)v7;
        if (storeClass) {
          goto LABEL_6;
        }
      }

      [v7 removeObjectForKey:v4];
      goto LABEL_9;
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot register a store class using a 'nil' type." userInfo:0]);
  }

  int v9 = (void *)MEMORY[0x189603F70];
  uint64_t v10 = [NSString stringWithFormat:@"Store type '%@' is reserved for Core Data, and cannot be re-registered.", v4];
  objc_exception_throw((id)[v9 exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
  __break(1u);
}

+ (NSDictionary)registeredStoreTypes
{
  if (qword_18C4ABA50)
  {
    id v3 = (void *)[(id)qword_18C4ABA50 mutableCopy];
    [v3 addEntriesFromDictionary:qword_18C4ABA48];
  }

  else
  {
    id v3 = (void *)[(id)qword_18C4ABA48 copy];
  }

  objc_sync_exit(a1);
  return (NSDictionary *)v3;
}

+ (const)_classForPersistentStoreAtURL:(uint64_t)a1
{
  v7[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if ([a2 isFileURL])
  {
    uint64_t result = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
    if (!result) {
      return result;
    }
    int v4 = open(result, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      ssize_t v6 = read(v4, v7, 8uLL);
      close(v5);
      if (v6 == 8 && (v7[0] == 0x66206574694C5153LL || v7[0] == 0x6174614465726F43LL)) {
        return (const char *)objc_opt_class();
      }
    }
  }

  return 0LL;
}

+ (uint64_t)_beginPowerAssertionNamed:(void *)a3 withAssert:
{
  uint64_t v5 = objc_opt_self();
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000LL;
  __int128 v27 = __Block_byref_object_copy__17;
  __int128 v28 = __Block_byref_object_dispose__17;
  uint64_t v29 = 0LL;
  MEMORY[0x186E3F1A8](v5);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke;
  block[3] = &unk_189EA7280;
  block[4] = &v24;
  if (qword_18C4ABA58 != -1) {
    dispatch_once(&qword_18C4ABA58, block);
  }
  id v6 = (id)qword_18C4ABA60;
  if (!qword_18C4ABA60 && _MergedGlobals_75)
  {
    if (!v25[5])
    {
LABEL_18:
      id v6 = 0LL;
      goto LABEL_19;
    }

    if ((objc_opt_respondsToSelector() & 1) != 0) {
      id v6 = objc_msgSend((id)v25[5], sel_sharedApplication);
    }
    else {
      id v6 = 0LL;
    }
    char v13 = objc_opt_respondsToSelector();
    if (byte_18C4ABA41) {
      _NSCoreDataLog( 9LL,  (uint64_t)@"Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@",  v7,  v8,  v9,  v10,  v11,  v12,  v25[5]);
    }
    if ((v13 & 1) == 0)
    {
      id v6 = (id)qword_18C4ABA60;
      if (!qword_18C4ABA60) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }

    qword_18C4ABA60 = (uint64_t)v6;
  }

  if (!v6) {
    goto LABEL_19;
  }
LABEL_14:
  id v14 = objc_msgSend(v6, (SEL)qword_18C4ABA68, a2, &__block_literal_global_584);
  id v6 = v14;
  if (!v14)
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to acquire background task assertion for task '%@'.",  v15,  v16,  v17,  v18,  v19,  v20,  a2);
    goto LABEL_18;
  }

  if (byte_18C4ABA41) {
    _NSCoreDataLog( 9LL,  (uint64_t)@"Successfully acquired background task assertion %d for task '%@'.",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v14);
  }
LABEL_19:
  *a3 = v6;
  uint64_t v21 = qword_18C4ABA60;
  _Block_object_dispose(&v24, 8);
  return v21;
}

+ (uint64_t)_storeClassForStoreType:(uint64_t)a1
{
  id v3 = (void *)objc_opt_self();
  objc_sync_enter(v3);
  int v4 = (void *)[(id)qword_18C4ABA48 objectForKey:a2];
  if (!v4) {
    int v4 = (void *)[(id)qword_18C4ABA50 objectForKey:a2];
  }
  objc_sync_exit(v3);
  return [v4 pointerValue];
}

+ (void)_endPowerAssertionWithAssert:(void *)a3 andApp:
{
  uint64_t v5 = objc_opt_self();
  MEMORY[0x186E3F1B4](v5);
  if (a2 && a3)
  {
    objc_msgSend(a3, sel_endBackgroundTask_, a2);
    if (byte_18C4ABA41) {
      _NSCoreDataLog(9LL, (uint64_t)@"Ended background task assertion %d.", v6, v7, v8, v9, v10, v11, a2);
    }
  }

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  if (!objc_msgSend(@"NSXPCStore", "isEqual:")) {
    return (NSDictionary *)[a1 metadataForPersistentStoreOfType:storeType URL:url options:0 error:error];
  }
  if (error)
  {
    NSLog((NSString *)@"This is not the API you're looking for.");
    *error = (NSError *)[MEMORY[0x189607870] errorWithDomain:@"This is not the API you're looking for" code:134060 userInfo:0];
  }

  return 0LL;
}

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (objc_msgSend(@"NSXPCStore", "isEqual:"))
  {
    uint64_t v10 = -[NSXPCStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( objc_alloc(&OBJC_CLASS___NSXPCStore),  "initWithPersistentStoreCoordinator:configurationName:URL:options:",  0LL,  0LL,  url,  options);
    if (v10)
    {
      uint64_t v11 = v10;
      if (-[NSXPCStore loadMetadata:](v10, "loadMetadata:", error))
      {
        uint64_t v12 = -[NSXPCStore metadata](v11, "metadata");

        return v12;
      }
    }

    else if (error)
    {
      NSLog((NSString *)@"Can't create store");
      uint64_t v21 = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
      uint64_t result = 0LL;
      *error = v21;
      return result;
    }

    return 0LL;
  }

  if (-[NSString length](storeType, "length")) {
    id v14 = storeType;
  }
  else {
    id v14 = 0LL;
  }
  uint64_t v15 = objc_opt_self();
  if (!url)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invalid store URL: nil" userInfo:0]);
    objc_exception_rethrow();
    __break(1u);
    return result;
  }

  uint64_t v16 = (void *)v15;
  objc_opt_class();
  objc_opt_class();
  uint64_t v42 = 0LL;
  id v43 = 0LL;
  id v36 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v37 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Retrieving metadata for persistent store",  &v42);
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    uint64_t v17 = -[NSURL path](url, "path");
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "isReadableFileAtPath:", v17) & 1) == 0)
    {
      if (error)
      {
        id v22 = objc_alloc(MEMORY[0x189603F68]);
        uint64_t v23 = (void *)objc_msgSend(v22, "initWithObjectsAndKeys:", url, *MEMORY[0x189607760], 0);
        id v43 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:260 userInfo:v23];
        *error = (NSError *)v43;
      }

      int v24 = 0;
      goto LABEL_44;
    }

    if (stat(-[NSString fileSystemRepresentation](v17, "fileSystemRepresentation"), &v44)) {
      off_t st_size = 0LL;
    }
    else {
      off_t st_size = v44.st_size;
    }
    if (!v14) {
      goto LABEL_18;
    }
  }

  else
  {
    off_t st_size = 1LL;
    if (!v14)
    {
LABEL_18:
      uint64_t v19 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  url);
      goto LABEL_19;
    }
  }

  uint64_t v19 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)v14);
  if (!v19) {
    goto LABEL_18;
  }
LABEL_19:
  if (v19 && st_size)
  {
    uint64_t v20 = (void *)((objc_opt_respondsToSelector() & 1) != 0
                 ? [v19 metadataForPersistentStoreWithURL:url options:options error:&v43]
                 : [v19 metadataForPersistentStoreWithURL:url error:&v43]);
    id v25 = v20;
    if (v25)
    {
LABEL_47:
      int v24 = 1;
      goto LABEL_48;
    }
  }

  int v24 = 1;
  if (-[NSString length](v14, "length") || !st_size)
  {
    id v25 = 0LL;
    goto LABEL_48;
  }

  objc_sync_enter(v16);
  uint64_t v26 = (void *)[(id)qword_18C4ABA50 allKeys];
  objc_sync_exit(v16);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:&v44 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v43 = 0LL;
        __int128 v31 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v30);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          __int128 v32 = (void *)[v31 metadataForPersistentStoreWithURL:url options:options error:&v43];
        }
        else {
          __int128 v32 = (void *)[v31 metadataForPersistentStoreWithURL:url error:&v43];
        }
        id v25 = v32;
        if (v25)
        {
          id v43 = 0LL;
          goto LABEL_47;
        }
      }

      uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:&v44 count:16];
      int v24 = 1;
      if (v27) {
        continue;
      }
      break;
    }
  }

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  if (!-[NSString isEqualToString:](storeType, "isEqualToString:", @"NSXPCStore"))
  {
    +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)metadata,  storeType,  url,  (uint64_t)options,  error);
    return result;
  }

  uint64_t v12 = -[NSXPCStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( objc_alloc(&OBJC_CLASS___NSXPCStore),  "initWithPersistentStoreCoordinator:configurationName:URL:options:",  0LL,  0LL,  url,  options);
  if (v12)
  {
    char v13 = v12;
    uint64_t v18 = 0LL;
    if (-[NSXPCStore loadMetadata:](v12, "loadMetadata:", &v18))
    {
      -[NSXPCStore setMetadata:](v13, "setMetadata:", metadata);
      id v14 = -[NSXPCStore executeRequest:withContext:error:]( v13,  "executeRequest:withContext:error:",  objc_alloc_init(&OBJC_CLASS___NSSaveChangesRequest),  0LL,  error);

      return [v14 BOOLValue];
    }

    if (error)
    {
      if (v18) {
        uint64_t v17 = v18;
      }
      else {
        uint64_t v17 = @"Unknown";
      }
      *error = (NSError *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", v17, *MEMORY[0x189607798]));
    }
  }

  else if (error)
  {
    NSLog((NSString *)@"Can't create store");
    uint64_t v16 = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
    BOOL result = 0;
    *error = v16;
    return result;
  }

  return 0;
}

+ (void)_setMetadata:(void *)a3 forPersistentStoreOfType:(void *)a4 URL:(uint64_t)a5 options:(void *)a6 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v11 = objc_opt_self();
  if (a4)
  {
    uint64_t v12 = (void *)v11;
    objc_opt_class();
    objc_opt_class();
    id v26 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v32 = 0LL;
    id v33 = 0LL;
    uint64_t v27 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Setting metadata for persistent store",  &v32);
    if ((a3
       && (char v13 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)a3)) != 0LL || (char v13 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  a4)) != 0LL)
      && ((objc_opt_respondsToSelector() & 1) == 0
        ? (char v14 = [v13 setMetadata:a2 forPersistentStoreWithURL:a4 error:&v33])
        : (char v14 = [v13 setMetadata:a2 forPersistentStoreWithURL:a4 options:a5 error:&v33]),
          (v14 & 1) != 0))
    {
      char v15 = 1;
    }

    else
    {
      if (![a3 length])
      {
        objc_sync_enter(v12);
        uint64_t v17 = (void *)[(id)qword_18C4ABA50 allKeys];
        objc_sync_exit(v12);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v29;
          id v25 = a6;
          while (2)
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v29 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              id v33 = 0LL;
              id v22 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v21);
              if ((objc_opt_respondsToSelector() & 1) != 0) {
                char v23 = [v22 setMetadata:a2 forPersistentStoreWithURL:a4 options:a5 error:&v33];
              }
              else {
                char v23 = [v22 setMetadata:a2 forPersistentStoreWithURL:a4 error:&v33];
              }
              if ((v23 & 1) != 0)
              {
                char v15 = 1;
                a6 = v25;
                goto LABEL_27;
              }
            }

            uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
            a6 = v25;
            if (v18) {
              continue;
            }
            break;
          }
        }
      }

      if (a6) {
        id v16 = v33;
      }
      char v15 = 0;
    }

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  return result;
}

- (void)setMetadata:(NSDictionary *)metadata forPersistentStore:(NSPersistentStore *)store
{
  if (-[NSPersistentStore isReadOnly](store, "isReadOnly"))
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Cannot set metadata in read-only store.",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", store),  @"NSAffectedStoresErrorKey",  0)));
    __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke(v7, v8);
  }

  else
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke;
    v9[3] = &unk_189EA8C18;
    v9[4] = metadata;
    -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((unint64_t)self, (uint64_t)v9, (uint64_t)store);
  }

uint64_t __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 setMetadata:*(void *)(a1 + 32)];
}

- (NSDictionary)metadataForPersistentStore:(NSPersistentStore *)store
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke;
  v5[3] = &unk_189EA8C40;
  v5[4] = &v6;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((unint64_t)self, (uint64_t)v5, (uint64_t)store);
  id v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 metadata];
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
}

+ (NSPersistentStoreCoordinator)alloc
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0LL);
}

+ (NSPersistentStoreCoordinator)allocWithZone:(_NSZone *)a3
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0LL);
}

- (void)dealloc
{
  persistentStores = self->_persistentStores;
  self->_persistentStores = 0LL;
  __dmb(0xBu);
  os_unfair_lock_unlock(&self->_miniLock);
  if (persistentStores)
  {
    uint64_t v4 = MEMORY[0x1895F87A8];
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke;
    void v6[3] = &unk_189EA7648;
    v6[4] = persistentStores;
    v6[5] = self;
    _perform_0((unint64_t)self, (uint64_t)v6);
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke_217;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = self;
    dispatch_async((dispatch_queue_t)self->_dispatchQueue, block);
  }

uint64_t __39__NSPersistentStoreCoordinator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    uint64_t v1 = a1;
    id v25 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v26 = v1;
    uint64_t v2 = *(void **)(*(void *)(v1 + 40) + 64LL);
    if (v2 || *(void *)(v1 + 32))
    {
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v3)
      {
        uint64_t v4 = *(void *)v36;
        do
        {
          for (uint64_t i = 0LL; i != v3; ++i)
          {
            if (*(void *)v36 != v4) {
              objc_enumerationMutation(v2);
            }
            -[_PFGarbageManager doCleanupForURL:]( (uint64_t)+[_PFGarbageManager defaultInstance](&OBJC_CLASS____PFGarbageManager, "defaultInstance"),  *(void **)(*((void *)&v35 + 1) + 8 * i));
          }

          uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }

        while (v3);
      }

      *(void *)(*(void *)(v26 + 40) + 64LL) = 0LL;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      uint64_t v6 = *(void **)(v26 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v32;
        do
        {
          for (uint64_t j = 0LL; j != v7; ++j)
          {
            if (*(void *)v32 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(unint64_t **)(*((void *)&v31 + 1) + 8 * j);
            uint64_t v11 = (const __CFString *)[v10 type];
            if (v10) {
              BOOL v12 = v11 == @"SQLite";
            }
            else {
              BOOL v12 = 0;
            }
            if (v12)
            {
              unint64_t v13 = atomic_load(v10 + 22);
              if (v13)
              {
                char v14 = +[_PFGarbageManager defaultInstance](&OBJC_CLASS____PFGarbageManager, "defaultInstance");
                -[_PFGarbageManager doCleanupForURL:]( (uint64_t)v14,  (void *)[MEMORY[0x189604030] fileURLWithPath:v13 isDirectory:1]);
              }
            }
          }

          uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }

        while (v7);
      }
    }

    context = (void *)MEMORY[0x186E3E5D8]();
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    char v15 = *(void **)(v26 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t k = 0LL; k != v16; ++k)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(unint64_t **)(*((void *)&v27 + 1) + 8 * k);
          uint64_t v20 = (void *)[MEMORY[0x189607958] defaultCenter];
          __int128 v39 = @"removed";
          __int128 v40 = v19;
          objc_msgSend( v20,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  0,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
          [v19 willRemoveFromPersistentStoreCoordinator:0];
          if (v19)
          {
            if (atomic_load(v19 + 1)) {
              atomic_store(0LL, v19 + 1);
            }
          }
        }

        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }

      while (v16);
    }

    id v22 = *(const void **)(v26 + 32);
    if (v22) {
      CFRelease(v22);
    }
    objc_autoreleasePoolPop(context);

    *(void *)(*(void *)(v26 + 40) + 72LL) = 0LL;
    *(void *)(*(void *)(v26 + 40) + 80LL) = 0LL;

    *(void *)(*(void *)(v26 + 40) + 88LL) = 0LL;
    *(void *)(*(void *)(v26 + 40) + 96LL) = 0LL;

    *(void *)(*(void *)(v26 + 40) + 40LL) = 0LL;
    objc_storeWeak((id *)(*(void *)(v26 + 40) + 104LL), 0LL);
    a1 = [v25 drain];
  }

  return MEMORY[0x186E3F1B4](a1);
}

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_217(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);

  *(void *)(v2 + 56) = 0LL;
  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 712);
  if (v5 == v2)
  {
    *(void *)(StatusReg + 712) = 0LL;
  }

  else if (v5)
  {
    uint64_t v6 = (unint64_t *)(v5 + 8);
    unint64_t v7 = atomic_load((unint64_t *)(v5 + 8));
    if (v7 == v2)
    {
      while (1)
      {
        unint64_t v8 = __ldaxr(v6);
        if (v8 != v7) {
          break;
        }
        if (!__stlxr(0LL, v6)) {
          goto LABEL_10;
        }
      }

      __clrex();
      uint64_t v9 = [NSString stringWithUTF8String:"Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)"];
      atomic_load((unint64_t *)(v5 + 8));
      _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, v5);
      uint64_t v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        unint64_t v17 = atomic_load((unint64_t *)(v5 + 8));
        *(_DWORD *)buf = 134218752;
        uint64_t v35 = v5;
        __int16 v36 = 2048;
        uint64_t v37 = 0LL;
        __int16 v38 = 2048;
        unint64_t v39 = v7;
        __int16 v40 = 2048;
        unint64_t v41 = v17;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)",  buf,  0x2Au);
      }
    }
  }

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 32);
  if (v2)
  {
    dispatch_set_context(v2, 0LL);
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }

  _PFDeallocateObject(*(id *)(a1 + 40));
}

- (NSPersistentStoreCoordinator)init
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSManagedObjectModel);
  uint64_t v10 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:](self, "initWithManagedObjectModel:", v9);

  return v10;
}

- (NSPersistentStoreCoordinator)initWithManagedObjectModel:(NSManagedObjectModel *)model
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSPersistentStoreCoordinator;
  uint64_t v5 = -[NSPersistentStoreCoordinator init](&v12, sel_init);
  if (!v5) {
    return v5;
  }
  if (model)
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    v5->_persistentStores = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    v5->_miniLock._os_unfair_lock_opaque = 0;
    v5->_managedObjectModel = model;
    __str[0] = 0;
    uint64_t v7 = -[NSPersistentStoreCoordinator name](v5, "name");
    if (v7)
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", v5);
      -[NSString UTF8String](v7, "UTF8String");
      __strlcat_chk();
    }

    else
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", v5);
    }

    _persistentStoreCoordinatorFlags flags = v5->_flags;
    if ((*(unsigned int *)&flags >> 2)) {
      uint64_t v9 = dispatch_queue_attr_make_with_qos_class( 0LL,  (dispatch_qos_class_t)(*(unsigned int *)&flags >> 2),  0);
    }
    else {
      uint64_t v9 = 0LL;
    }
    dispatch_queue_t v10 = dispatch_queue_create(__str, v9);
    dispatch_set_context(v10, v5);
    v5->_dispatchQueue = v10;
    -[NSManagedObjectModel _setIsEditable:](v5->_managedObjectModel, "_setIsEditable:", 0LL);
    *(_WORD *)&v5->_flags |= 2u;
    v5->_modelMap = (_PFModelMap *)-[_PFModelMap initWithClientModel:](objc_alloc(&OBJC_CLASS____PFModelMap), model);
    objc_autoreleasePoolPop(v6);
    return v5;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot create an NSPersistentStoreCoordinator with a nil model" userInfo:0]);
  __break(1u);
  return result;
}

- (NSArray)persistentStores
{
  p_miniLocuint64_t k = &self->_miniLock;
  os_unfair_lock_lock_with_options();
  persistentStores = self->_persistentStores;
  uint64_t v5 = persistentStores;
  os_unfair_lock_unlock(p_miniLock);
  return persistentStores;
}

- (uint64_t)_checkForSkewedEntityHashes:(uint64_t)result metadata:(void *)a2
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (void *)result;
    objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"NSPersistenceFrameworkVersion"), "floatValue");
    if ((int)v4 <= 386)
    {
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      uint64_t v5 = (void *)objc_msgSend(v3, "managedObjectModel", 0);
      BOOL result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            if ((-[NSEntityDescription _hasPotentialHashSkew](*(void *)(*((void *)&v9 + 1) + 8 * i)) & 1) != 0) {
              return objc_msgSend( -[NSManagedObjectModel _entityVersionHashesByNameInStyle:]( (id)objc_msgSend(v3, "managedObjectModel"),  1),  "isEqual:",  objc_msgSend(a2, "valueForKey:", @"NSStoreModelVersionHashes"));
            }
          }

          uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          BOOL result = 0LL;
          if (v6) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (uint64_t)_checkForTombstoneSkew:(uint64_t)a3 metadata:(uint64_t)a4 configuration:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v7 = [a2 mutableCopy];
  unint64_t v8 = (void *)v7;
  if (v7) {
    -[NSManagedObjectModel _traverseTombstonesAndMark:](v7, 1LL);
  }
  if ([v8 isConfiguration:a4 compatibleWithStoreMetadata:a3])
  {
    uint64_t v9 = 1LL;
  }

  else
  {

    uint64_t v10 = [a2 mutableCopy];
    unint64_t v8 = (void *)v10;
    if (v10) {
      -[NSManagedObjectModel _traverseTombstonesAndMark:](v10, 0LL);
    }
    uint64_t v9 = [v8 isConfiguration:a4 compatibleWithStoreMetadata:a3];
  }

  return v9;
}

- (id)_doAddPersistentStoreWithDescription:(void *)a3 privateCopy:(int)a4 completeOnMainThread:(uint64_t)a5 withHandler:
{
  v56[1] = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v53 = 0LL;
  if (objc_msgSend((id)objc_msgSend(a3, "mirroringOptions"), "count"))
  {
    __int128 v11 = (NSCloudKitMirroringDelegate *)(id)[a3 mirroringDelegate];
  }

  else
  {
    if (![a3 cloudKitContainerOptions])
    {
      __int128 v11 = 0LL;
      char v51 = 1;
LABEL_13:
      uint64_t v19 = objc_msgSend( v9,  "addPersistentStoreWithType:configuration:URL:options:error:",  objc_msgSend(a3, "type"),  objc_msgSend(a3, "configuration"),  objc_msgSend(a3, "URL"),  objc_msgSend(a3, "options"),  &v53);
      if (v19) {
        goto LABEL_14;
      }
      id v27 = v53;
      _NSCoreDataLog( 1LL,  (uint64_t)@"%@: Attempting recovery from error encountered during addPersistentStore: %p %@",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v9);
      uint64_t v28 = (void *)[MEMORY[0x1896078A8] defaultManager];
      uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URL"), "path"), "stringByDeletingLastPathComponent");
      __int128 v30 = (void *)[v27 domain];
      if ([v30 isEqualToString:*MEMORY[0x189607460]])
      {
        if ([v27 code] != 512 && objc_msgSend(v27, "code") != 4 && objc_msgSend(v27, "code") != 514) {
          goto LABEL_17;
        }
      }

      else
      {
        unint64_t v31 = (void *)[v27 domain];
        if (![v31 isEqualToString:*MEMORY[0x189607688]]
          || [v27 code] != 2)
        {
          goto LABEL_17;
        }
      }

      if (([a3 isReadOnly] & 1) == 0)
      {
        if ([v28 fileExistsAtPath:v29])
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"During recovery, parent directory path reported to exist",  v32,  v33,  v34,  v35,  v36,  v37,  v50);
        }

        else
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"During recovery, parent directory path reported as missing",  v32,  v33,  v34,  v35,  v36,  v37,  v50);
          uint64_t v54 = 0LL;
          if (([v28 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v54] & 1) == 0)
          {
            [v27 userInfo];
            _NSCoreDataLog( 1LL,  (uint64_t)@"During recovery, failed to create directory structure '%@' with error %@ and userInfo %@",  v38,  v39,  v40,  v41,  v42,  v43,  v29);
          }
        }

        id v53 = 0LL;
        uint64_t v19 = objc_msgSend( v9,  "addPersistentStoreWithType:configuration:URL:options:error:",  objc_msgSend(a3, "type"),  objc_msgSend(a3, "configuration"),  objc_msgSend(a3, "URL"),  objc_msgSend(a3, "options"),  &v53);
        if (v19)
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"Recovery attempt while adding %@ was successful!",  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)a3);
LABEL_14:
          if ((v51 & 1) == 0) {
            -[NSCloudKitMirroringDelegate persistentStoreCoordinator:didSuccessfullyAddPersistentStore:withDescription:]( v11,  "persistentStoreCoordinator:didSuccessfullyAddPersistentStore:withDescription:",  v9,  v19,  a3);
          }
          goto LABEL_17;
        }

        _NSCoreDataLog( 1LL,  (uint64_t)@"Recovery attempt while adding %@ FAILED with error %@",  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)a3);
      }

      goto LABEL_17;
    }

    [a3 cloudKitContainerOptions];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      __int128 v12 = -[NSCloudKitMirroringDelegate initWithOptions:]( [NSCloudKitMirroringDelegate alloc],  "initWithOptions:",  [a3 cloudKitContainerOptions]);
    }
    else {
      __int128 v12 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]( [NSCloudKitMirroringDelegate alloc],  "initWithCloudKitContainerOptions:",  [a3 cloudKitContainerOptions]);
    }
    __int128 v11 = v12;
    [a3 setMirroringDelegate:v12];
  }

  if (!v11)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Use of the mirroring options requires that a mirroring delegate also be provided. The following options were set, but a mirroring delegate was not found at '%@':\n%@", @"NSPersistentStoreMirroringDelegateOptionKey", objc_msgSend(a3, "mirroringOptions")];
    uint64_t v21 = (void *)MEMORY[0x189607870];
    uint64_t v55 = *MEMORY[0x1896075F0];
    v56[0] = v20;
    uint64_t v22 = [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    __int128 v11 = 0LL;
    id v53 = (id)[v21 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v22];
    goto LABEL_17;
  }

  if (-[NSCloudKitMirroringDelegate validateManagedObjectModel:forUseWithStoreWithDescription:error:]( v11,  "validateManagedObjectModel:forUseWithStoreWithDescription:error:",  [v9 managedObjectModel],  a3,  &v53))
  {
    char v51 = 0;
    goto LABEL_13;
  }

void __114__NSPersistentStoreCoordinator__doAddPersistentStoreWithDescription_privateCopy_completeOnMainThread_withHandler___block_invoke( uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [v2 drain];
}

- (void)addPersistentStoreWithDescription:(NSPersistentStoreDescription *)storeDescription completionHandler:(void *)block
{
  uint64_t v7 = (void *)-[NSPersistentStoreDescription copy](storeDescription, "copy");
  if ([MEMORY[0x189607A40] isMainThread]) {
    int v8 = !-[NSPersistentStoreDescription shouldInvokeCompletionHandlerConcurrently]( storeDescription,  "shouldInvokeCompletionHandlerConcurrently");
  }
  else {
    int v8 = 0;
  }
  if ([v7 shouldAddStoreAsynchronously])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    blocka[0] = MEMORY[0x1895F87A8];
    blocka[1] = 3221225472LL;
    blocka[2] = __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke;
    blocka[3] = &unk_189EA8C90;
    blocka[4] = self;
    blocka[5] = storeDescription;
    char v11 = v8;
    blocka[6] = v7;
    blocka[7] = block;
    dispatch_async(global_queue, blocka);
  }

  else
  {
    -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:]( self,  storeDescription,  v7,  v8,  (uint64_t)block);
  }
}

id __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke( uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:]( *(id *)(a1 + 32),  *(void **)(a1 + 40),  *(void **)(a1 + 48),  *(unsigned __int8 *)(a1 + 64),  *(void *)(a1 + 56));
}

- (NSPersistentStore)addPersistentStoreWithType:(NSString *)storeType configuration:(NSString *)configuration URL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v86 = 0LL;
  v87 = &v86;
  uint64_t v88 = 0x3052000000LL;
  uint64_t v89 = __Block_byref_object_copy__17;
  v90 = __Block_byref_object_dispose__17;
  uint64_t v91 = configuration;
  uint64_t v80 = 0LL;
  char v81 = &v80;
  uint64_t v82 = 0x3052000000LL;
  __int128 v83 = __Block_byref_object_copy__17;
  __int128 v84 = __Block_byref_object_dispose__17;
  uint64_t v85 = 0LL;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x3052000000LL;
  char v77 = __Block_byref_object_copy__17;
  v78 = __Block_byref_object_dispose__17;
  uint64_t v79 = 0LL;
  uint64_t v13 = -[NSPersistentStoreCoordinator managedObjectModel](self, "managedObjectModel");
  int v14 = objc_msgSend( -[NSDictionary objectForKey:]( options,  "objectForKey:",  @"NSPersistentStoreForceLightweightMigrationOption"),  "BOOLValue");
  char v15 = v14;
  if (v14)
  {
    id v16 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
    [v16 removeObjectForKey:@"NSPersistentStoreForceLightweightMigrationOption"];
    options = (NSDictionary *)(id)[v16 copy];
  }

  uint64_t v17 = MEMORY[0x1895F87A8];
  v72[0] = MEMORY[0x1895F87A8];
  v72[1] = 3221225472LL;
  v72[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke;
  v72[3] = &unk_189EA8CB8;
  v72[4] = options;
  v72[5] = self;
  v72[6] = v13;
  v72[7] = storeType;
  v72[8] = storeURL;
  v72[9] = &v74;
  v72[10] = &v86;
  v72[11] = &v80;
  v72[12] = error;
  char v73 = v15;
  _perform_0((unint64_t)self, (uint64_t)v72);
  id v18 = (id)v81[5];
  if (v75[5])
  {
    uint64_t v19 = NSStringFromSelector(a2);
    [(id)v75[5] domain];
    [(id)v75[5] code];
    _NSCoreDataLog(1LL, (uint64_t)@"%@ returned error %@ (%ld)", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
    if (objc_msgSend((id)objc_msgSend((id)v75[5], "userInfo"), "count"))
    {
      _NSCoreDataLog(1LL, (uint64_t)@"userInfo:", v26, v27, v28, v29, v30, v31, v69);
      objc_msgSend( (id)objc_msgSend((id)v75[5], "userInfo"),  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_11);
    }

    _NSCoreDataLog(1LL, (uint64_t)@"storeType: %@", v26, v27, v28, v29, v30, v31, (uint64_t)storeType);
    _NSCoreDataLog(1LL, (uint64_t)@"configuration: %@", v32, v33, v34, v35, v36, v37, v87[5]);
    _NSCoreDataLog(1LL, (uint64_t)@"URL: %@", v38, v39, v40, v41, v42, v43, (uint64_t)storeURL);
    if (-[NSDictionary count](options, "count"))
    {
      _NSCoreDataLog(4LL, (uint64_t)@"options:", v44, v45, v46, v47, v48, v49, v68);
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( options,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_321);
    }

    if ([(id)v75[5] code] == 134130 || objc_msgSend((id)v75[5], "code") == 134020)
    {
      uint64_t v50 = -[NSManagedObjectModel entityVersionHashesByName]( -[NSPersistentStoreCoordinator managedObjectModel](self, "managedObjectModel"),  "entityVersionHashesByName");
      _NSCoreDataLog( 1LL,  (uint64_t)@"NSPersistentStoreCoordinator's current model hashes are %@",  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)v50);
    }

    uint64_t v57 = (void *)v75[5];
    if (error)
    {
      *error = (NSError *)v57;
    }

    else
    {

      v75[5] = 0LL;
    }
  }

  uint64_t v58 = (void *)v81[5];
  if (v58)
  {
    if (([(id)v81[5] isReadOnly] & 1) == 0
      && objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)v81[5], "metadata"),  "objectForKey:",  @"NSPersistentStoreRebuildIndicies"),  "BOOLValue"))
    {
      uint64_t v59 = getprogname();
      if (v59 && (!strncmp("assetsd", v59, 7uLL) || !strncmp("photolibraryd", v59, 0xDuLL)))
      {
        v71[0] = v17;
        v71[1] = 3221225472LL;
        v71[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_3;
        v71[3] = &unk_189EA7258;
        v71[4] = self;
        v71[5] = &v80;
        -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v71);
      }

      else if (-[NSDictionary valueForKey:]( options,  "valueForKey:",  @"NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey"))
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Deferring index repair until after migration is complete (NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey is set).",  v60,  v61,  v62,  v63,  v64,  v65,  v68);
      }

      else
      {
        v70[0] = v17;
        v70[1] = 3221225472LL;
        v70[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4;
        v70[3] = &unk_189EA7258;
        v70[4] = self;
        v70[5] = &v80;
        -[NSPersistentStoreCoordinator performBlock:](self, "performBlock:", v70);
      }
    }
  }

  uint64_t v66 = (NSPersistentStore *)v81[5];
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);
  return v66;
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke( uint64_t a1)
{
  uint64_t v179 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
  {
    id v2 = objc_alloc(MEMORY[0x189607870]);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v2 initWithDomain:*MEMORY[0x189607460] code:3328 userInfo:&unk_189F03A68];
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    if (v3)
    {
      uint64_t v4 = a1;
      uint64_t v5 = *(void **)(a1 + 96);
      if (v5) {
        *uint64_t v5 = v3;
      }
    }

    else
    {
      uint64_t v4 = a1;
      uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v43 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v177 = 1024;
        int v178 = 1530;
        _os_log_fault_impl( &dword_186681000,  v43,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v44 = *(id *)(*(void *)(*(void *)(v4 + 72) + 8LL) + 40LL);
    return;
  }

  uint64_t v142 = a1;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  uint64_t v6 = [&unk_189F0B1A8 countByEnumeratingWithState:&v145 objects:v165 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v146;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v146 != v7) {
          objc_enumerationMutation(&unk_189F0B1A8);
        }
        uint64_t v9 = *(void *)(*((void *)&v145 + 1) + 8 * i);
        if ([*(id *)(v142 + 32) valueForKey:v9])
        {
          uint64_t v45 = (void *)NSString;
          uint64_t v46 = NSStringFromSelector(sel_setOption_forMirroringKey_);
          uint64_t v47 = (objc_class *)objc_opt_class();
          uint64_t v48 = [v45 stringWithFormat:@"%@ is only valid as a mirroring option. It should be set using '%@' on '%@'", v9, v46, NSStringFromClass(v47)];
          id v49 = objc_alloc(MEMORY[0x189607870]);
          uint64_t v163 = *MEMORY[0x1896075F0];
          uint64_t v164 = v48;
          uint64_t v50 = [MEMORY[0x189603F68] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
          uint64_t v51 = [v49 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v50];
LABEL_61:
          *(void *)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL) = v51;
          return;
        }
      }

      uint64_t v6 = [&unk_189F0B1A8 countByEnumeratingWithState:&v145 objects:v165 count:16];
    }

    while (v6);
  }

  if (![*(id *)(v142 + 32) objectForKey:@"NSPersistentHistoryTrackingKey"])
  {
LABEL_59:
    if ([*(id *)(v142 + 32) valueForKey:@"NSCoreDataCoreSpotlightExporter"])
    {
      uint64_t v67 = [NSString stringWithFormat:@"CoreSpotlight integration is not supported on this platform. The following option key is forbidden: %@", @"NSCoreDataCoreSpotlightExporter"];
      id v68 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v161 = *MEMORY[0x1896075F0];
      uint64_t v162 = v67;
      uint64_t v69 = [MEMORY[0x189603F68] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
      uint64_t v51 = [v68 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v69];
      goto LABEL_61;
    }

    *(void *)buf = 0LL;
    uint64_t v70 = *(void **)(v142 + 56);
    uint64_t v71 = *(void *)(v142 + 64);
    v175[0] = 0LL;
    v72 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Adding persistent store",  v175);
    if (!v70)
    {
      uint64_t v70 = (void *)-[NSPersistentStoreCoordinator _realStoreTypeForStoreWithType:URL:options:error:]( *(void *)(v142 + 40),  *(void *)(v142 + 56),  v71,  *(void *)(v142 + 32),  buf);
      if (!v70)
      {
        uint64_t v93 = *(void *)buf;
        if (!*(void *)buf) {
          uint64_t v93 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:&unk_189F03A90];
        }
        __int128 v83 = 0LL;
        *(void *)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL) = v93;
        goto LABEL_141;
      }
    }

    char v73 = (objc_class *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)v70);
    if (!v73)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Unsupported store type." userInfo:0]);
      __break(1u);
      return;
    }

    char v74 = objc_msgSend( (id)objc_msgSend(*(id *)(v142 + 32), "objectForKey:", @"NSIgnorePersistentStoreVersioningOption"),  "BOOLValue");
    if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
      char v75 = v74;
    }
    else {
      char v75 = 1;
    }
    if ((v75 & 1) != 0) {
      int v76 = 0;
    }
    else {
      int v76 = objc_msgSend( (id)objc_msgSend( *(id *)(v142 + 32),  "objectForKey:",  @"NSMigratePersistentStoresAutomaticallyOption"),  "BOOLValue");
    }
    if (*(void *)(*(void *)(*(void *)(v142 + 80) + 8LL) + 40LL)
      && objc_msgSend(@"Default", "isEqual:")
      && ![*(id *)(v142 + 48) entitiesForConfiguration:*(void *)(*(void *)(*(void *)(v142 + 80) + 8) + 40)])
    {
      *(void *)(*(void *)(*(void *)(v142 + 80) + 8LL) + 40LL) = 0LL;
    }

    *(void *)(*(void *)(*(void *)(v142 + 88) + 8) + 40) = objc_msgSend( objc_allocWithZone(v73),  "initWithPersistentStoreCoordinator:configurationName:URL:options:",  *(void *)(v142 + 40),  *(void *)(*(void *)(*(void *)(v142 + 80)
                                                                                            + 8LL)
                                                                                + 40LL),
                                                                      v71,
                                                                      *(void *)(v142 + 32));
    uint64_t v77 = *(void *)(*(void *)(*(void *)(v142 + 88) + 8LL) + 40LL);
    if (v77)
    {
      unsigned __int8 v78 = atomic_load((unsigned __int8 *)(v77 + 60));
      uint64_t v79 = v78 & 1;
      uint64_t v80 = *(void **)(*(void *)(*(void *)(v142 + 88) + 8LL) + 40LL);
    }

    else
    {
      uint64_t v80 = 0LL;
      uint64_t v79 = 0LL;
    }

    char v81 = [v80 loadMetadata:buf];
    uint64_t v82 = *(void *)(*(void *)(v142 + 88) + 8LL);
    __int128 v83 = *(void **)(v82 + 40);
    if ((v81 & 1) != 0)
    {
      [*(id *)(v82 + 40) _didLoadMetadata];
      [*(id *)(*(void *)(*(void *)(v142 + 88) + 8) + 40) _setMetadataDirty:v79];
      __int128 v83 = 0LL;
      __int128 v84 = (uint64_t *)(v142 + 88);
      uint64_t v85 = *(void **)(*(void *)(*(void *)(v142 + 88) + 8LL) + 40LL);
      if (!v85)
      {
LABEL_141:
        +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v175[0],  v72);
        id v126 = *(id *)(*(void *)(*(void *)(v142 + 88) + 8LL) + 40LL);
        if (v83)
        {
          [v83 willRemoveFromPersistentStoreCoordinator:0];
        }

        uint64_t v127 = v142;
        v128 = *(void **)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL);
        if (v128)
        {
          id v129 = v128;
          uint64_t v130 = v142;
          v131 = *(void **)(*(void *)(v142 + 40) + 72LL);
          if (v131 != *(void **)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL))
          {

            uint64_t v130 = v142;
            *(void *)(*(void *)(v142 + 40) + 72LL) = 0LL;
          }

          if ([*(id *)(v130 + 64) isFileURL])
          {
            v132 = (void *)MEMORY[0x189603FC8];
            uint64_t v133 = [*(id *)(v142 + 64) path];
            v134 = (void *)objc_msgSend(v132, "dictionaryWithObjectsAndKeys:", v133, *MEMORY[0x1896074F8], 0);
          }

          else
          {
            v134 = 0LL;
          }

          uint64_t v135 = objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(*(void *)(v142 + 72) + 8) + 40), "userInfo"),  "objectForKey:",  @"NSSQLiteErrorDomain");
          if (v135)
          {
            if (!v134) {
              v134 = (void *)[MEMORY[0x189603FC8] dictionary];
            }
            [v134 setObject:v135 forKey:@"NSSQLiteErrorDomain"];
          }

          v136 = (void *)[*(id *)(*(void *)(*(void *)(v142 + 72) + 8) + 40) userInfo];
          uint64_t v137 = *MEMORY[0x189607688];
          uint64_t v138 = [v136 objectForKey:*MEMORY[0x189607688]];
          if (v138)
          {
            if (!v134) {
              v134 = (void *)[MEMORY[0x189603FC8] dictionary];
            }
            [v134 setObject:v138 forKey:v137];
          }

          uint64_t v139 = objc_msgSend( objc_alloc(MEMORY[0x189607870]),  "initWithDomain:code:userInfo:",  objc_msgSend(*(id *)(*(void *)(*(void *)(v142 + 72) + 8) + 40), "domain"),  objc_msgSend(*(id *)(*(void *)(*(void *)(v142 + 72) + 8) + 40), "code"),  v134);
          uint64_t v127 = v142;
          *(void *)(*(void *)(v142 + 40) + 72LL) = v139;
        }

        if (*(void *)(*(void *)(*(void *)(v127 + 88) + 8LL) + 40LL))
        {

          *(void *)(*(void *)(v142 + 40) + 72LL) = 0LL;
        }

        v140 = *(void **)(*(void *)(*(void *)(v142 + 88) + 8LL) + 40LL);
        if (v140 && ([v140 supportsConcurrentRequestHandling] & 1) == 0) {
          *(_WORD *)(*(void *)(v142 + 40) + 24LL) &= ~2u;
        }
        return;
      }

      id v86 = (id)objc_msgSend((id)objc_msgSend(v85, "metadata"), "copy");
      v87 = v86;
      if (!v86 && *(void *)(v142 + 96))
      {
        v97 = (void *)MEMORY[0x189607870];
        uint64_t v98 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Can't read store metadata.",  @"reason",  0);
        *(void *)(*(void *)(*(void *)(v142 + 72) + 8) + 40) = [v97 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v98];
        uint64_t v96 = *(void *)(v142 + 88);
LABEL_100:
        uint64_t v88 = *(void *)(v96 + 8);
        if (*(void *)(v88 + 40)) {
          __int128 v83 = *(void **)(v88 + 40);
        }
LABEL_127:
        *(void *)(v88 + 40) = 0LL;
        goto LABEL_141;
      }

      if ((objc_msgSend(v70, "isEqual:", objc_msgSend(v86, "objectForKey:", @"NSStoreType")) & 1) == 0)
      {
        if (*(void *)(v142 + 96))
        {
          v94 = (void *)MEMORY[0x189607870];
          uint64_t v95 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"The store type in the metadata does not match the specified store type.",  @"reason",  v87,  @"metadata",  0);
          *(void *)(*(void *)(*(void *)(v142 + 72) + 8) + 40) = [v94 errorWithDomain:*MEMORY[0x189607460] code:134010 userInfo:v95];
        }

        uint64_t v96 = *v84;
        goto LABEL_100;
      }

      if ((v75 & 1) == 0)
      {
        uint64_t v99 = (void *)[v87 objectForKey:@"NSStoreModelVersionHashesVersion"];
        if ([v99 intValue] >= 4)
        {
          if (*(void *)(v142 + 96))
          {
            v119 = (void *)MEMORY[0x189607870];
            uint64_t v120 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"The version hash version (and associated hashes) are incompatible with the current Core Data version.",  @"reason",  v87,  @"metadata",  0);
            *(void *)(*(void *)(*(void *)(v142 + 72) + 8) + 40) = [v119 errorWithDomain:*MEMORY[0x189607460] code:134100 userInfo:v120];
          }

          uint64_t v88 = *(void *)(*v84 + 8);
          v121 = *(void **)(v88 + 40);
          if (v121)
          {
            *(void *)(v88 + 40) = 0LL;
            uint64_t v88 = *(void *)(*v84 + 8);
            __int128 v83 = v121;
          }

          goto LABEL_127;
        }

        if (v99 && [v87 objectForKey:@"NSStoreModelVersionHashes"])
        {
          char v100 = [*(id *)(v142 + 48) isConfiguration:*(void *)(*(void *)(*(void *)(v142 + 80) + 8) + 40) compatibleWithStoreMetadata:v87];
          char v101 = *(_BYTE *)(v142 + 104) ? 0 : v100;
          if ((v101 & 1) == 0
            && (*(_BYTE *)(v142 + 104)
             || (-[NSPersistentStoreCoordinator _checkForSkewedEntityHashes:metadata:](*(void *)(v142 + 40), v87) & 1) == 0
             && (!+[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  *(void **)(v142 + 48))
              || (-[NSPersistentStoreCoordinator _checkForTombstoneSkew:metadata:configuration:]( *(void *)(v142 + 40),  *(void **)(v142 + 48),  (uint64_t)v87,  *(void *)(*(void *)(*(void *)(v142 + 80) + 8LL) + 40LL)) & 1) == 0)))
          {
            if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel"))
            {
              if (v76) {
                v102 = @" ";
              }
              else {
                v102 = @" NOT ";
              }
              [*(id *)(v142 + 48) entityVersionHashesByName];
              _NSCoreDataLog( 4LL,  (uint64_t)@"Incompatible version schema for persistent store '%@'.  store metadata = %@ and current model versions = %@",  v103,  v104,  v105,  v106,  v107,  v108,  v71);
              _NSCoreDataLog( 4LL,  (uint64_t)@"(migration)\t will%@attempt automatic schema migration",  v109,  v110,  v111,  v112,  v113,  v114,  (uint64_t)v102);
            }

            uint64_t v115 = *(void *)(*v84 + 8);
            v116 = *(void **)(v115 + 40);
            if (v116)
            {
              *(void *)(v115 + 40) = 0LL;
              __int128 v83 = v116;
            }

            if (v76)
            {
              v117 = (void *)[*(id *)(v142 + 32) mutableCopy];
              [v117 setValue:MEMORY[0x189604A88] forKey:@"NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey"];
              v118 = -[NSPersistentStoreCoordinatorMigrationContext initWithStoreURL:type:options:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinatorMigrationContext),  "initWithStoreURL:type:options:",  v71,  v70,  v117);

              -[NSPersistentStoreCoordinatorMigrationContext setConfigurationName:]( v118,  "setConfigurationName:",  *(void *)(*(void *)(*(void *)(v142 + 80) + 8LL) + 40LL));
              -[NSPersistentStoreCoordinatorMigrationContext setDestinationConfigurationForCloudKitValidation:]( v118,  "setDestinationConfigurationForCloudKitValidation:",  *(void *)(*(void *)(*(void *)(v142 + 80) + 8LL) + 40LL));
              -[NSPersistentStoreCoordinatorMigrationContext setMetadata:](v118, "setMetadata:", v87);
              -[NSPersistentStoreCoordinatorMigrationContext setForceMigration:]( v118,  "setForceMigration:",  *(unsigned __int8 *)(v142 + 104));
              if (-[NSPersistentStoreCoordinator migrateStoreWithContext:error:]( *(void *)(v142 + 40),  v118,  (void *)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL))) {
                *(void *)(*(void *)(*v84 + 8) + 40LL) =   -[NSPersistentStoreCoordinatorMigrationContext migratedStore]( v118,  "migratedStore");
              }

              goto LABEL_141;
            }

            if (*(void *)(v142 + 96))
            {
              v124 = (void *)MEMORY[0x189607870];
              uint64_t v125 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"The model used to open the store is incompatible with the one used to create the store",  @"reason",  v87,  @"metadata",  0);
              *(void *)(*(void *)(*(void *)(v142 + 72) + 8) + 40) = [v124 errorWithDomain:*MEMORY[0x189607460] code:134100 userInfo:v125];
            }

            uint64_t v88 = *(void *)(*v84 + 8);
            goto LABEL_127;
          }
        }
      }

      uint64_t v88 = *(void *)(*v84 + 8);
      uint64_t v89 = *(void **)(v88 + 40);
      if (!v89)
      {
        if (*(void *)(v142 + 96))
        {
          *(void *)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL) = *(void *)buf;
          uint64_t v88 = *(void *)(*(void *)(v142 + 88) + 8LL);
        }

        goto LABEL_127;
      }

      if ([v89 load:buf])
      {
        -[NSPersistentStoreCoordinator _addPersistentStore:identifier:]( *(void *)(v142 + 40),  *(void **)(*(void *)(*(void *)(v142 + 88) + 8) + 40),  [*(id *)(*(void *)(*(void *)(v142 + 88) + 8) + 40) identifier]);

        -[NSPersistentStore _updateMetadata](*(_BYTE **)(*(void *)(*v84 + 8) + 40LL));
        [*(id *)(*(void *)(*(void *)(v142 + 88) + 8) + 40) _setupObserver:*(void *)(v142 + 40)];
        [*(id *)(*(void *)(*(void *)(v142 + 88) + 8) + 40) didAddToPersistentStoreCoordinator:*(void *)(v142 + 40)];
        v90 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  *(void *)(*(void *)(*v84 + 8) + 40),  0);
        -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:]( *(void *)(v142 + 40),  (uint64_t)v90,  (uint64_t)@"added",  *(void **)(v142 + 32));

        goto LABEL_141;
      }

      [*(id *)(*(void *)(*v84 + 8) + 40) _unload:0];
      uint64_t v122 = *(void *)(*v84 + 8);
      v123 = *(void **)(v122 + 40);
      if (v123)
      {
        *(void *)(v122 + 40) = 0LL;
        __int128 v83 = v123;
      }
    }

    else if (v83)
    {
      *(void *)(v82 + 40) = 0LL;
    }

    else if (!*(void *)buf)
    {
      uint64_t v91 = (void *)MEMORY[0x189607870];
      uint64_t v92 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Unable to initialize store.",  @"reason",  0);
      *(void *)buf = [v91 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v92];
    }

    if (*(void *)(v142 + 96)) {
      *(void *)(*(void *)(*(void *)(v142 + 72) + 8LL) + 40LL) = *(void *)buf;
    }
    goto LABEL_141;
  }

  uint64_t v10 = v142;
  if (!*(void *)(v142 + 40)) {
    goto LABEL_57;
  }
  char v11 = *(void **)(v142 + 48);
  uint64_t v141 = *(void *)(*(void *)(v142 + 72) + 8LL);
  __int128 v12 = (void *)[*(id *)(v142 + 32) objectForKey:@"NSPersistentHistoryTrackingKey"];
  if (![v12 isNSDictionary])
  {
    if (([v12 isNSNumber] & 1) == 0)
    {
      uint64_t v52 = (void *)MEMORY[0x189607870];
      uint64_t v170 = *MEMORY[0x1896075F0];
      uint64_t v53 = (void *)NSString;
      uint64_t v54 = (objc_class *)objc_opt_class();
      uint64_t v55 = NSStringFromClass(v54);
      uint64_t v56 = (objc_class *)objc_opt_class();
      uint64_t v171 = [v53 stringWithFormat:@"%@ expects an instance of %@ as its value but found: %@", @"NSPersistentHistoryTrackingKey", v55, NSStringFromClass(v56)];
      uint64_t v57 = [MEMORY[0x189603F68] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
      uint64_t v35 = [v52 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v57];
      if (v35) {
        goto LABEL_48;
      }
      goto LABEL_55;
    }

    goto LABEL_59;
  }

  id v144 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  obuint64_t j = (id)[v11 entities];
  uint64_t v13 = [obj countByEnumeratingWithState:&v157 objects:buf count:16];
  if (!v13) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)v158;
  do
  {
    for (uint64_t j = 0LL; j != v13; ++j)
    {
      if (*(void *)v158 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v157 + 1) + 8 * j);
      uint64_t v17 = (void *)objc_msgSend( (id)objc_msgSend(v16, "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes");
      id v18 = v17;
      if (!v17) {
        continue;
      }
      if (![v17 isNSString])
      {
        uint64_t v23 = (void *)NSString;
        uint64_t v24 = [v16 name];
        uint64_t v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = [v23 stringWithFormat:@"%@ - Wrong type: %@ but should be %@", v24, v26, NSStringFromClass(v27)];
LABEL_36:
        [v144 addObject:v28];
        continue;
      }

      if (![v18 length])
      {
        goto LABEL_36;
      }

      uint64_t v19 = (void *)[v18 componentsSeparatedByString:@","];
      __int128 v155 = 0u;
      __int128 v156 = 0u;
      __int128 v153 = 0u;
      __int128 v154 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v153 objects:v175 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v154;
        while (2)
        {
          for (uint64_t k = 0LL; k != v20; ++k)
          {
            if (*(void *)v154 != v21) {
              objc_enumerationMutation(v19);
            }
            if (!objc_msgSend( (id)objc_msgSend(v16, "attributesByName"),  "objectForKey:",  *(void *)(*((void *)&v153 + 1) + 8 * k)))
            {
              uint64_t v28 = [NSString stringWithFormat:@"%@ - One or more unknown attributes: %@", objc_msgSend(v16, "name"), v18];
              goto LABEL_36;
            }
          }

          uint64_t v20 = [v19 countByEnumeratingWithState:&v153 objects:v175 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
    }

    uint64_t v13 = [obj countByEnumeratingWithState:&v157 objects:buf count:16];
  }

  while (v13);
LABEL_39:
  if (![v144 count])
  {

    goto LABEL_59;
  }

  [v144 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following entities did not have a valid configuration for %@. It should be a string of comma separated attribute names to tombstone on delete.", @"NSPersistentHistoryTombstoneAttributes"];
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  uint64_t v30 = [v144 countByEnumeratingWithState:&v149 objects:v174 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v150;
    do
    {
      for (uint64_t m = 0LL; m != v30; ++m)
      {
        if (*(void *)v150 != v31) {
          objc_enumerationMutation(v144);
        }
        [v29 appendFormat:@"\n%@", *(void *)(*((void *)&v149 + 1) + 8 * m)];
      }

      uint64_t v30 = [v144 countByEnumeratingWithState:&v149 objects:v174 count:16];
    }

    while (v30);
  }

  uint64_t v33 = (void *)MEMORY[0x189607870];
  uint64_t v172 = *MEMORY[0x1896075F0];
  v173 = v29;
  uint64_t v34 = [MEMORY[0x189603F68] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
  uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v34];

  if (v35)
  {
LABEL_48:
    *(void *)(v141 + 40) = v35;
    uint64_t v10 = v142;
    goto LABEL_57;
  }

- (uint64_t)_realStoreTypeForStoreWithType:(uint64_t)a3 URL:(uint64_t)a4 options:(void *)a5 error:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = a2;
  id v10 = 0LL;
  uint64_t v7 = (void *)[(id)objc_opt_class() metadataForPersistentStoreOfType:a2 URL:a3 options:a4 error:&v10];
  if (v7) {
    return [v7 objectForKey:@"NSStoreType"];
  }
  uint64_t v9 = (void *)[v10 domain];
  if (![v9 isEqualToString:*MEMORY[0x189607460]]
    || [v10 code] != 4 && objc_msgSend(v10, "code") != 260)
  {
    uint64_t v6 = 0LL;
    if (a5) {
      *a5 = v10;
    }
  }

  return v6;
}

- (unint64_t)migrateStoreWithContext:(void *)a3 error:
{
  unint64_t v3 = a1;
  v73[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = [a2 configurationName];
    [a2 setConfigurationName:0];
    id v59 = 0LL;
    uint64_t v7 = (void *)objc_msgSend( (id)objc_msgSend(a2, "options"),  "objectForKey:",  @"NSPersistentStoreStagedMigrationManagerOptionKey");
    if (v7
      && (!objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a2, "options"),  "objectForKey:",  @"NSMigratePersistentStoresAutomaticallyOption"),  "BOOLValue")
       || (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a2, "options"),  "objectForKey:",  @"NSInferMappingModelAutomaticallyOption"),  "BOOLValue") & 1) == 0))
    {
      id v12 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v13 = *MEMORY[0x189607460];
      uint64_t v72 = *MEMORY[0x1896075E0];
      v73[0] = @"Staged Migration was requested with NSPersistentStoreStagedMigrationManagerOptionKey but without setting NSMigratePersistentStoresAutomaticallyOption and NSInferMappingModelAutomaticallyOption to YES.";
      uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:&v72 count:1];
      uint64_t v15 = 134100LL;
      goto LABEL_14;
    }

    [a2 setStagedMigrationManager:v7];
    if (!objc_msgSend((id)objc_msgSend(v7, "stages"), "count"))
    {
      id v18 = 0LL;
LABEL_21:
      *(_WORD *)(v3 + 24) |= 0x400u;
      if ([v18 count])
      {
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        uint64_t v25 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v56;
          while (2)
          {
            for (uint64_t i = 0LL; i != v26; ++i)
            {
              if (*(void *)v56 != v27) {
                objc_enumerationMutation(v18);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                __int128 v53 = 0u;
                __int128 v54 = 0u;
                __int128 v51 = 0u;
                __int128 v52 = 0u;
                uint64_t v31 = [v18 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v52;
                  while (2)
                  {
                    for (uint64_t j = 0LL; j != v32; ++j)
                    {
                      if (*(void *)v52 != v33) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                      uint64_t v36 = (void *)MEMORY[0x186E3E5D8]();
                      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:]( (void *)v3,  v35,  a2,  &v59) & 1) == 0)
                      {
                        id v39 = v59;
                        objc_autoreleasePoolPop(v36);
                        goto LABEL_47;
                      }

                      objc_autoreleasePoolPop(v36);
                    }

                    uint64_t v32 = [v18 countByEnumeratingWithState:&v51 objects:v64 count:16];
                    if (v32) {
                      continue;
                    }
                    break;
                  }
                }

                goto LABEL_42;
              }
            }

            uint64_t v26 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        uint64_t v29 = (void *)[v18 lastObject];
        uint64_t v30 = (void *)v3;
      }

      else
      {
        uint64_t v30 = (void *)v3;
        uint64_t v29 = 0LL;
      }

      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:](v30, v29, a2, &v59) & 1) == 0)
      {
        id v38 = v59;
LABEL_47:
        *(_WORD *)(v3 + 24) &= ~0x400u;
LABEL_50:
        id v41 = v59;
        if (v41)
        {
          if (a3)
          {
            unint64_t v3 = 0LL;
            *a3 = v41;
            goto LABEL_56;
          }
        }

        else
        {
          uint64_t v42 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog( 17LL,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
          id v49 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v61 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
            __int16 v62 = 1024;
            int v63 = 3855;
            _os_log_fault_impl( &dword_186681000,  v49,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
          }
        }

        unint64_t v3 = 0LL;
        goto LABEL_56;
      }

- (void)_addPersistentStore:(uint64_t)a3 identifier:
{
  if (a1)
  {
    uint64_t v6 = [a2 URL];
    if (v6 && [(id)a1 persistentStoreForURL:v6]
      || -[NSPersistentStoreCoordinator _persistentStoreForIdentifier:](a1, a3))
    {
      id v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134081LL,  (uint64_t)@"Can't add the same store twice",  0LL);
      objc_exception_throw(v9);
      -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:]();
    }

    else
    {
      __dmb(0xBu);
      while (1)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v7 = *(void **)(a1 + 48);
        uint64_t v8 = (const void *)[v7 arrayByAddingObject:a2];
        CFRetain(v8);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
        if (v8) {
          CFRelease(v8);
        }
      }

      *(void *)(a1 + 48) = v8;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      if (v7) {
        CFRelease(v7);
      }
    }
  }

- (void)_postStoresChangedNotificationsForStores:(uint64_t)a3 changeKey:(void *)a4 options:
{
  if (a1)
  {
    uint64_t v8 = (void *)[MEMORY[0x189607958] defaultCenter];
    id v9 = objc_alloc(MEMORY[0x189603F68]);
    if (!a2) {
      a2 = [MEMORY[0x189603F18] array];
    }
    uint64_t v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a2, a3, 0);
    if ((!a4
       || (id v11 = (void *)[a4 objectForKey:@"_NSNotifyObserversOfStoreChange"]) == 0
       || ([v11 BOOLValue] & 1) != 0)
      && (*(_WORD *)(a1 + 24) & 0x400) == 0)
    {
      [v8 postNotificationName:@"_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification" object:a1 userInfo:v10];
      [v8 postNotificationName:@"NSPersistentStoreCoordinatorStoresDidChangeNotification" object:a1 userInfo:v10];
    }
  }

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_309( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_3( uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:]( *(void *)(a1 + 32),  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier],  1);
}

- (uint64_t)_repairIndiciesForStoreWithIdentifier:(uint64_t)a3 synchronous:
{
  if (result)
  {
    uint64_t v4 = (void *)[(id)result persistentStoreForIdentifier:a2];
    BOOL result = [v4 isReadOnly];
    if ((result & 1) == 0)
    {
      BOOL result = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v4, "metadata"),  "objectForKey:",  @"NSPersistentStoreRebuildIndicies"),  "BOOLValue");
      if ((_DWORD)result) {
        return [v4 _rebuildIndiciesSynchronously:a3];
      }
    }
  }

  return result;
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4( uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:]( *(void *)(a1 + 32),  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier],  0);
}

- (BOOL)removePersistentStore:(NSPersistentStore *)store error:(NSError *)error
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (store)
  {
    uint64_t v7 = (void *)[MEMORY[0x189607958] defaultCenter];
    id v9 = @"removed";
    v10[0] = store;
    objc_msgSend( v7,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }

  return -[NSPersistentStoreCoordinator _removePersistentStore:error:]((unint64_t)self, store, error);
}

- (BOOL)_removePersistentStore:(void *)a3 error:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  uint64_t v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  uint64_t v17 = 0LL;
  if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", @"NSXPCStore"))
  {
    id v6 = a2;
    [a2 _prepareStoreForRemovalFromCoordinator:a1];
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke;
  v11[3] = &unk_189EA7A60;
  v11[4] = a2;
  v11[5] = a1;
  void v11[6] = &v18;
  v11[7] = &v12;
  _perform_0(a1, (uint64_t)v11);
  uint64_t v7 = (void *)v13[5];
  if (v7)
  {
    id v8 = v7;
    if (a3) {
      *a3 = v13[5];
    }
  }

  BOOL v9 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)_removeAllPersistentStores:(id *)a3
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  uint64_t v12 = __Block_byref_object_copy__17;
  uint64_t v13 = __Block_byref_object_dispose__17;
  uint64_t v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke;
  v8[3] = &unk_189EA8D40;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v8);
  id v4 = (id)v10[5];
  if (a3)
  {
    uint64_t v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }

  char v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

void __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v2 = (void *)MEMORY[0x186E3E5D8]();
  unint64_t v3 = (void *)[*(id *)(a1 + 32) persistentStores];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(a1 + 32) removePersistentStore:*(void *)(*((void *)&v9 + 1) + 8 * v7) error:*(void *)(*(void *)(a1 + 40) + 8) + 40] & 1) == 0) {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        }
        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  objc_autoreleasePoolPop(v2);
}

void __61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32)
    && objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "persistentStores"),  "indexOfObjectIdenticalTo:",  *(void *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = *(id *)(a1 + 32);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = -[NSPersistentStoreCoordinator _removePersistentStore:]( *(void *)(a1 + 40),  *(unint64_t **)(a1 + 32));
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v2 count:1];
    -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:]( *(void *)(a1 + 40),  (uint64_t)v4,  (uint64_t)@"removed",  0LL);

    if ((__CFString *)[*(id *)(a1 + 32) type] == @"SQLite"
      && !*(void *)(*(void *)(a1 + 40) + 64LL))
    {
      *(void *)(*(void *)(a1 + 40) + 64LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        unint64_t v6 = atomic_load((unint64_t *)(v5 + 176));
        if (v6) {
          objc_msgSend( *(id *)(*(void *)(a1 + 40) + 64),  "addObject:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:isDirectory:", v6, 1));
        }
      }
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03AB8];
  }

- (BOOL)_removePersistentStore:(unint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v10 = *(void *)(StatusReg + 712);
      if (!v10) {
        goto LABEL_32;
      }
      unint64_t v11 = 0LL;
      int v12 = 0;
      while (v10 != a1)
      {
        if (v10 == v11) {
          goto LABEL_23;
        }
        if (!v11) {
          unint64_t v11 = v10;
        }
        unint64_t v10 = atomic_load((unint64_t *)(v10 + 8));
        if (!v10) {
          goto LABEL_24;
        }
      }

      int v12 = 1;
LABEL_23:
      if (v12) {
        goto LABEL_3;
      }
LABEL_24:
      uint64_t v13 = *(void *)(StatusReg + 712);
      if (!v13) {
        goto LABEL_32;
      }
      unint64_t v14 = 0LL;
      int v15 = 0;
      unint64_t v16 = a1;
      while (v16 != v13)
      {
        if (v16 == v14) {
          goto LABEL_33;
        }
        if (!v14) {
          unint64_t v14 = v16;
        }
        unint64_t v16 = atomic_load((unint64_t *)(v16 + 8));
        if (!v16) {
          goto LABEL_32;
        }
      }

      int v15 = 1;
LABEL_33:
      while (!v15)
      {
LABEL_32:
        objc_opt_self();
        __break(1u);
      }
    }

- (NSPersistentStore)persistentStoreForURL:(NSURL *)URL
{
  if (URL)
  {
    uint64_t v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
    uint64_t v5 = [v4 count];
    if (v5 < 1)
    {
LABEL_6:
      id v8 = 0LL;
    }

    else
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0LL;
      while (1)
      {
        id v8 = (NSPersistentStore *)[v4 objectAtIndex:v7];
        if (v6 == ++v7) {
          goto LABEL_6;
        }
      }
    }

    return v8;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invalid store URL: nil" userInfo:0]);
    return (NSPersistentStore *)-[NSPersistentStoreCoordinator URLForPersistentStore:](v10, v11, v12);
  }

- (NSURL)URLForPersistentStore:(NSPersistentStore *)store
{
  if (!store)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil is not a valid store." userInfo:0]);
    uint64_t v6 = v5;
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }

  uint64_t v8 = 0LL;
  __int128 v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  SEL v11 = __Block_byref_object_copy__17;
  int v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke;
  v7[3] = &unk_189EA8C40;
  void v7[4] = &v8;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((unint64_t)self, (uint64_t)v7, (uint64_t)store);
  id v3 = (NSURL *)(id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v3;
}

id __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  id result = (id)[a2 URL];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

- (BOOL)setURL:(NSURL *)url forPersistentStore:(NSPersistentStore *)store
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke;
  void v6[3] = &unk_189EA8D68;
  v6[4] = url;
  v6[5] = &v7;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((unint64_t)self, (uint64_t)v6, (uint64_t)store);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke( uint64_t result,  void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    id result = objc_msgSend(a2, "setURL:");
    *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

- (NSPersistentStore)migratePersistentStore:(NSPersistentStore *)store toURL:(NSURL *)URL options:(NSDictionary *)options withType:(NSString *)storeType error:(NSError *)error
{
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  uint64_t v28 = __Block_byref_object_copy__17;
  uint64_t v29 = __Block_byref_object_dispose__17;
  uint64_t v30 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  uint64_t v22 = __Block_byref_object_copy__17;
  uint64_t v23 = __Block_byref_object_dispose__17;
  uint64_t v24 = 0LL;
  if (!store)
  {
    uint64_t v17 = @"nil is not a valid persistent store";
LABEL_10:
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  v17,  0,  storeType,  error));
    __break(1u);
    return result;
  }

  if (!URL && !-[NSString isEqualToString:](storeType, "isEqualToString:", @"InMemory"))
  {
    uint64_t v17 = @"nil is not a valid persistent store URL";
    goto LABEL_10;
  }

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke;
  v18[3] = &unk_189EA8D90;
  v18[4] = store;
  v18[5] = self;
  v18[6] = options;
  v18[7] = storeType;
  v18[8] = URL;
  v18[9] = &v25;
  v18[10] = &v19;
  v18[11] = error;
  _perform_0((unint64_t)self, (uint64_t)v18);
  id v13 = (id)v26[5];
  if (error)
  {
    unint64_t v14 = (NSError *)v26[5];
    if (v14) {
      *error = v14;
    }
  }

  int v15 = (NSPersistentStore *)v20[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke( uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v44 = 0LL;
  id v42 = (id)[*(id *)(a1 + 32) configurationName];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)objc_opt_self();
  objc_sync_enter(v3);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  char v4 = (void *)qword_18C4ABA48;
  uint64_t v5 = [(id)qword_18C4ABA48 countByEnumeratingWithState:&v49 objects:&v56 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v50;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
      uint64_t v9 = objc_opt_class();
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:&v56 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    char v10 = (void *)qword_18C4ABA50;
    if (!qword_18C4ABA50
      || (__int128 v47 = 0u,
          __int128 v48 = 0u,
          __int128 v45 = 0u,
          __int128 v46 = 0u,
          (uint64_t v11 = [(id)qword_18C4ABA50 countByEnumeratingWithState:&v45 objects:v55 count:16]) == 0))
    {
LABEL_18:
      objc_sync_exit(v3);
      int v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't find store type for store %@ (class == %@) in %@.", v2, objc_opt_class(), objc_msgSend(v3, "registeredStoreTypes")), 0 reason userInfo];
      objc_exception_throw(v15);
      __break(1u);
      return;
    }

    uint64_t v12 = *(void *)v46;
LABEL_12:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v46 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
      uint64_t v14 = objc_opt_class();
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v11) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
  }

  objc_sync_exit(v3);
  id v16 = v8;
  id v17 = (id)[*(id *)(a1 + 32) URL];
  char v18 = (void *)objc_msgSend( objc_allocWithZone((Class)NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  objc_msgSend(*(id *)(a1 + 40), "managedObjectModel"));
  uint64_t v19 = *(void **)(a1 + 48);
  if (v19) {
    id v20 = (id)[v19 mutableCopy];
  }
  else {
    id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  uint64_t v21 = v20;
  if (![v20 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
    [v21 setObject:&unk_189F04350 forKey:@"NSPersistentStoreRemoveUbiquitousMetadataOption"];
  }
  [v21 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
  uint64_t v22 = (void **)[v18 addPersistentStoreWithType:*(void *)(a1 + 56) configuration:v42 URL:*(void *)(a1 + 64) options:v21 error:&v44];

  if (v22)
  {
    uint64_t v23 = v22;
    id v24 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v56 = 0LL;
    __int128 v57 = &v56;
    uint64_t v58 = 0x3052000000LL;
    id v59 = __Block_byref_object_copy__17;
    uint64_t v60 = __Block_byref_object_dispose__17;
    uint64_t v61 = 0LL;
    v43[0] = MEMORY[0x1895F87A8];
    v43[1] = 3221225472LL;
    v43[2] = __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_343;
    v43[3] = &unk_189EA8700;
    uint64_t v25 = *(void *)(a1 + 32);
    v43[4] = v18;
    v43[5] = v25;
    v43[6] = v22;
    v43[7] = &v56;
    [v18 performBlockAndWait:v43];
    uint64_t v26 = (void *)v57[5];
    _Block_object_dispose(&v56, 8);
    id v27 = v44;

    [v24 drain];
    if (v44)
    {
      id v28 = v44;
      if (*(void *)(a1 + 88)) {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v44;
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = 0LL;
    }

    else if (v26)
    {
      id v29 = *(id *)(a1 + 32);
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:*(void *)(a1 + 48)];
      objc_msgSend( v30,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 0),  @"_NSNotifyObserversOfStoreChange");
      if (![v30 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
        [v30 setObject:&unk_189F04350 forKey:@"NSPersistentStoreRemoveUbiquitousMetadataOption"];
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [*(id *)(a1 + 40) addPersistentStoreWithType:*(void *)(a1 + 56) configuration:v42 URL:*(void *)(a1 + 64) options:v30 error:&v44];

      if (v44) {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v44;
      }
      unint64_t v31 = [v26 count];
      if (v31 >= 2)
      {
        for (unint64_t i = 1LL; i < v31; i += 2LL)
          objc_msgSend( v26,  "replaceObjectAtIndex:withObject:",  i,  objc_msgSend( *(id *)(a1 + 40),  "managedObjectIDForURIRepresentation:",  objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v26, "objectAtIndex:", i), "objectID"),  "URIRepresentation")));
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL))
      {
        uint64_t v33 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40),  v26,  0);
        -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:]( *(void *)(a1 + 40),  (uint64_t)v33,  (uint64_t)@"changedUUID",  0LL);

        if (*(void *)(a1 + 32))
        {
          uint64_t v34 = (void *)[MEMORY[0x189607958] defaultCenter];
          uint64_t v35 = *(void *)(a1 + 32);
          uint64_t v36 = *(void *)(a1 + 40);
          __int128 v53 = @"removed";
          uint64_t v54 = v35;
          objc_msgSend( v34,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  v36,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          uint64_t v37 = *(void **)(a1 + 32);
        }

        else
        {
          uint64_t v37 = 0LL;
        }

        -[NSPersistentStoreCoordinator _removePersistentStore:error:](*(void *)(a1 + 40), v37, &v44);
      }

      else
      {
      }
    }

    else
    {

      if (*(void *)(a1 + 88))
      {
        id v38 = (void *)MEMORY[0x189607870];
        if (v44) {
          uint64_t v39 = [MEMORY[0x189603F68] dictionaryWithObject:v44 forKey:*MEMORY[0x189607798]];
        }
        else {
          uint64_t v39 = 0LL;
        }
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v38 errorWithDomain:*MEMORY[0x189607460] code:134030 userInfo:v39];
      }
    }
  }

  else
  {
    if (*(void *)(a1 + 88)) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = v44;
    }

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = 0LL;
  }

  id v40 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v40) {
    id v41 = v40;
  }
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_343( uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v105 = *MEMORY[0x1895F89C0];
  -[NSPersistentStoreCoordinator _addPersistentStore:identifier:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  [*(id *)(a1 + 40) identifier]);
  unint64_t v2 = *(void *)(v1 + 32);
  if (!v2) {
    goto LABEL_102;
  }
  id v3 = *(void **)(v1 + 40);
  char v4 = *(void **)(v1 + 48);
  uint64_t v5 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  3LL);
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v5, "setPersistentStoreCoordinator:", v2);
  -[NSManagedObjectContext setRetainsRegisteredObjects:](v5, "setRetainsRegisteredObjects:", 1LL);
  -[NSManagedObjectContext setUndoManager:](v5, "setUndoManager:", 0LL);
  if (_PF_Threading_Debugging_level)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v64 = *(void *)(StatusReg + 712);
    if (!v64) {
      goto LABEL_95;
    }
    unint64_t v65 = 0LL;
    int v66 = 0;
    while (v64 != v2)
    {
      if (v64 == v65) {
        goto LABEL_86;
      }
      if (!v65) {
        unint64_t v65 = v64;
      }
      unint64_t v64 = atomic_load((unint64_t *)(v64 + 8));
      if (!v64) {
        goto LABEL_87;
      }
    }

    int v66 = 1;
LABEL_86:
    if (v66) {
      goto LABEL_3;
    }
LABEL_87:
    uint64_t v67 = *(void *)(StatusReg + 712);
    if (!v67) {
      goto LABEL_95;
    }
    unint64_t v68 = 0LL;
    int v69 = 0;
    unint64_t v70 = v2;
    while (v70 != v67)
    {
      if (v70 == v68) {
        goto LABEL_96;
      }
      if (!v68) {
        unint64_t v68 = v70;
      }
      unint64_t v70 = atomic_load((unint64_t *)(v70 + 8));
      if (!v70) {
        goto LABEL_95;
      }
    }

    int v69 = 1;
LABEL_96:
    while (!v69)
    {
LABEL_95:
      objc_opt_self();
      __break(1u);
    }
  }

- (NSPersistentHistoryToken)currentPersistentHistoryTokenFromStores:(NSArray *)stores
{
  if (!stores || (char v4 = stores, !-[NSArray count](stores, "count"))) {
    char v4 = -[NSPersistentStoreCoordinator persistentStores](self, "persistentStores");
  }
  return (NSPersistentHistoryToken *) -[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:]( (_NSPersistentHistoryToken *)self,  v4);
}

- (_NSPersistentHistoryToken)_retainedChangeTokenFromStores:(_NSPersistentHistoryToken *)result
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id result = (_NSPersistentHistoryToken *)[a2 count];
    if (result)
    {
      id v3 = (void *)[MEMORY[0x189603FC8] dictionary];
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v4 = [a2 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v25;
        do
        {
          for (uint64_t i = 0LL; i != v5; ++i)
          {
            if (*(void *)v25 != v6) {
              objc_enumerationMutation(a2);
            }
            uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v9 = [v8 currentChangeToken];
            if (v9) {
              objc_msgSend(v3, "setObject:forKey:", v9, objc_msgSend(v8, "identifier"));
            }
          }

          uint64_t v5 = [a2 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }

        while (v5);
      }

      id v23 = 0LL;
      if ([v3 count] == 1)
      {
        [v3 getObjects:&v23 andKeys:0 count:1];
        id v10 = v23;
        return (_NSPersistentHistoryToken *)v23;
      }

      else
      {
        id result = (_NSPersistentHistoryToken *)[v3 count];
        if (result)
        {
          uint64_t v11 = (void *)[MEMORY[0x189603FC8] dictionary];
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          uint64_t v12 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0LL; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v3);
                }
                uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                uint64_t v17 = (void *)[v3 objectForKey:v16];
                memset(v18, 0, sizeof(v18));
                if (objc_msgSend( (id)objc_msgSend(v17, "storeTokens", 0),  "countByEnumeratingWithState:objects:count:",  v18,  v28,  16))
                {
                  objc_msgSend( v11,  "setObject:forKey:",  objc_msgSend((id)objc_msgSend(v17, "storeTokens"), "objectForKey:", **((void **)&v18[0] + 1)),  v16);
                }
              }

              uint64_t v13 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
            }

            while (v13);
          }

          return -[_NSPersistentHistoryToken initWithDictionary:]( objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken),  "initWithDictionary:",  v11);
        }
      }
    }
  }

  return result;
}

- (NSManagedObjectID)managedObjectIDForURIRepresentation:(NSURL *)url
{
  if (!url) {
    return 0LL;
  }
  id v6 = 0LL;
  uint64_t v4 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](self, (CFURLRef)url, &v6);
  if (!v4 && (!v6 || [v6 code] != 134000))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"The specified URI is not a valid Core Data URI: %@", url), 0 reason userInfo]);
    return 0LL;
  }

  return &v4->super;
}

- (NSTemporaryObjectID)managedObjectIDForURIRepresentation:(void *)a3 error:
{
  id v3 = 0LL;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1 && url)
  {
    id v20 = 0LL;
    uint64_t v7 = buffer;
    CFIndex v8 = CFURLGetBytes(url, buffer, 511LL);
    if (v8 < 0)
    {
      CFIndex v9 = CFURLGetBytes(url, 0LL, 0LL);
      uint64_t v7 = (UInt8 *)malloc(v9 + 1);
      CFIndex v8 = CFURLGetBytes(url, v7, v9);
    }

    if (v8 <= 0)
    {
      if (v7 != buffer) {
        free(v7);
      }
      return 0LL;
    }

    else
    {
      v7[v8] = 0;
      if (a3) {
        id v10 = &v20;
      }
      else {
        id v10 = 0LL;
      }
      id v3 = -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](a1, (char *)v7, v8, v10);
      if (v7 != buffer) {
        free(v7);
      }
      if (a3 && !v3)
      {
        uint64_t v11 = (void *)MEMORY[0x189607870];
        if (v20)
        {
          uint64_t v12 = [v20 domain];
          uint64_t v13 = [v20 code];
          id v23 = @"URI is not a valid Core Data URI";
          CFURLRef v24 = url;
          uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          int v15 = v11;
          uint64_t v16 = v12;
          uint64_t v17 = v13;
        }

        else
        {
          uint64_t v18 = *MEMORY[0x189607460];
          __int128 v21 = @"URI is not a valid Core Data URI";
          CFURLRef v22 = url;
          uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          int v15 = v11;
          uint64_t v16 = v18;
          uint64_t v17 = 134060LL;
        }

        id v3 = 0LL;
        *a3 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14, v20);
      }
    }
  }

  return v3;
}

- (BOOL)finishDeferredLightweightMigration:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 1, error);
}

- (BOOL)_finishDeferredLightweightMigrationTasks:(void *)a3 withError:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  uint64_t v14 = __Block_byref_object_copy__17;
  int v15 = __Block_byref_object_dispose__17;
  uint64_t v16 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke;
  v9[3] = &unk_189EA9080;
  char v10 = a2;
  v9[4] = a1;
  void v9[5] = &v11;
  v9[6] = &v17;
  [a1 performBlockAndWait:v9];
  id v4 = (id)v12[5];
  uint64_t v5 = v18;
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = v12[5];
    int v6 = *((unsigned __int8 *)v5 + 24);
  }

  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)finishDeferredLightweightMigrationTask:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 0, error);
}

- (id)_exceptionNoStoreSaveFailureForError:(id)a3 recommendedFrame:(int *)a4
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    uint64_t v6 = [a3 code];
    BOOL v7 = (void *)[a3 domain];
    else {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSSQLiteErrorDomain");
    }
    uint64_t v16 = (void *)v8;
    uint64_t v17 = *MEMORY[0x189607688];
    else {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", v17);
    }
    uint64_t v19 = (void *)v18;
    if ([v7 isEqualToString:*MEMORY[0x189607460]])
    {
      if (v6 == 134020 || v6 == 134100)
      {
        if (!a4) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }

      unint64_t v20 = v6 - 134171;
      if (a4 && v20 >= 0xFFFFFFFFFFFFFFB9LL)
      {
LABEL_18:
        *a4 = 2;
LABEL_19:
        __int128 v21 = @"(schema mismatch or migration failure)";
LABEL_34:
        CFIndex v9 = (void *)[NSString stringWithFormat:@"This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation.", v21];
        [a3 domain];
        [a3 code];
        [a3 userInfo];
        _NSCoreDataLog( 1LL,  (uint64_t)@"Illegal attempt to save to a file that was never opened.  %@.  Last recorded error = %@(%ld) / %@\n",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v9);
        return v9;
      }

      if (v20 > 0xFFFFFFFFFFFFFFB8LL) {
        goto LABEL_19;
      }
    }

    if (v16)
    {
      int v22 = [v16 integerValue];
      switch(v22)
      {
        case 3:
          if (a4) {
            *a4 = 5;
          }
          __int128 v21 = @"(permission denied)";
          goto LABEL_34;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
          goto LABEL_31;
        case 10:
          if (a4) {
            *a4 = 8;
          }
          __int128 v21 = @"(I/O error)";
          goto LABEL_34;
        case 11:
          goto LABEL_28;
        case 13:
          if (a4) {
            *a4 = 7;
          }
          __int128 v21 = @"(disk full)";
          goto LABEL_34;
        case 14:
          if (a4) {
            *a4 = 6;
          }
          __int128 v21 = @"(can't open)";
          goto LABEL_34;
        default:
          if (v22 == 23)
          {
            if (a4) {
              *a4 = 3;
            }
            __int128 v21 = @"(device locked)";
          }

          else
          {
            if (v22 != 26) {
              goto LABEL_31;
            }
LABEL_28:
            if (a4) {
              *a4 = 1;
            }
            __int128 v21 = @"(corrupt file)";
          }

          break;
      }
    }

    else
    {
LABEL_31:
      if (v19) {
        [v19 integerValue];
      }
      __int128 v21 = @"(unknown)";
    }

    goto LABEL_34;
  }

  CFIndex v9 = (void *)[NSString stringWithFormat:@"This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation.", @"(unknown)"];
  _NSCoreDataLog( 1LL,  (uint64_t)@"Illegal attempt to save to a file that was never opened. %@. No last error recorded.",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v9);
  return v9;
}

- (void)_introspectLastErrorAndThrow
{
  if (a1)
  {
    int v2 = 0;
    uint64_t v1 = [a1 _exceptionNoStoreSaveFailureForError:a1[9] recommendedFrame:&v2];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v1 userInfo:0]);
  }

os_signpost_id_t __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_381( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  id v3 = (os_log_s *)PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "entity"), "name");
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_signpost_emit_with_name_impl( &dword_186681000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  v2,  "Fetch",  "%@",  (uint8_t *)&v6,  0xCu);
  }

  return v2;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_386( uint64_t a1,  void *a2)
{
  uint64_t v429 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) affectedStores];
  uint64_t v327 = a1;
  if ([v4 count])
  {
    obuint64_t j = (_WORD *)[MEMORY[0x189603FA8] array];
    __int128 v379 = 0u;
    __int128 v380 = 0u;
    __int128 v381 = 0u;
    __int128 v382 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v379 objects:v422 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v380;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v380 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v379 + 1) + 8 * i);
        }

        uint64_t v5 = [v4 countByEnumeratingWithState:&v379 objects:v422 count:16];
      }

      while (v5);
    }
  }

  else if ([*(id *)(a1 + 40) count])
  {
    obuint64_t j = (_WORD *)[MEMORY[0x189603FA8] array];
    __int128 v383 = 0u;
    __int128 v384 = 0u;
    __int128 v385 = 0u;
    __int128 v386 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v383 objects:v423 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v384;
      do
      {
        for (uint64_t j = 0LL; j != v9; ++j)
        {
          if (*(void *)v384 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void **)(*((void *)&v383 + 1) + 8 * j);
        }

        uint64_t v9 = [a2 countByEnumeratingWithState:&v383 objects:v423 count:16];
      }

      while (v9);
    }
  }

  else
  {
    obuint64_t j = a2;
  }

  unint64_t v13 = *(void *)(v327 + 88);
  BOOL v14 = v13 > 7;
  uint64_t v15 = (1LL << v13) & 0xE4;
  if (v14 || v15 == 0)
  {
    if (!*(void *)(v327 + 48))
    {
      obuint64_t j = 0LL;
      uint64_t v17 = [0 count];
      goto LABEL_29;
    }

    uint64_t v32 = (_WORD *)[*(id *)(v327 + 56) _queryGenerationToken];
    if ([v32 _isEnabled])
    {
      if (+[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken") == v32)
      {
        obuint64_t j = (_WORD *)NSArray_EmptyArray;
        uint64_t v17 = [(id)NSArray_EmptyArray count];
      }

      else
      {
        obuint64_t j = -[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:](v32, obj, 0LL);
        uint64_t v17 = [obj count];
      }

      goto LABEL_29;
    }
  }

  uint64_t v17 = [obj count];
LABEL_29:
  unint64_t v323 = v17;
  if ([obj count])
  {
    if ((*(void *)(v327 + 88) | 2LL) != 3
      || ((uint64_t v18 = (void *)[*(id *)(v327 + 32) entity],
           uint64_t v19 = [v18 managedObjectModel],
           uint64_t v20 = *(void *)(v327 + 48),
           v19 == *(void *)(v20 + 40))
       || (uint64_t v21 = *(void *)(v20 + 96), v22 = _PFModelMapPathForEntity(v18), v21)
       && [*(id *)(v21 + 56) objectForKey:v22])
      && *(_BYTE *)(v327 + 112))
    {
LABEL_37:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        [*(id *)(v327 + 32) _incrementInUseCounter];
      }
      if (v323 >= 2)
      {
        unint64_t v23 = *(void *)(v327 + 88);
        if (v23 > 7 || ((1LL << v23) & 0xEA) == 0)
        {
          id v370 = 0LL;
          goto LABEL_93;
        }

        uint64_t v24 = (void *)[obj mutableCopy];
        uint64_t v25 = *(void **)(v327 + 32);
        if (*(void *)(v327 + 88) == 7LL) {
          uint64_t v25 = (void *)[v25 fetchRequest];
        }
        uint64_t v26 = (void *)[v25 entity];
        if (objc_msgSend((id)objc_msgSend(v26, "managedObjectModel"), "_modelsReferenceIDOffset") < 15001)
        {
          __int128 v373 = 0uLL;
          __int128 v374 = 0uLL;
          __int128 v371 = 0uLL;
          __int128 v372 = 0uLL;
          uint64_t v33 = [obj countByEnumeratingWithState:&v371 objects:v418 count:16];
          if (v33)
          {
            unsigned int v34 = 0;
            uint64_t v35 = *(void *)v372;
            do
            {
              for (uint64_t k = 0LL; k != v33; ++k)
              {
                if (*(void *)v372 != v35) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v37 = (void *)[*(id *)(*((void *)&v371 + 1) + 8 * k) configurationName];
                if ([v37 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"]
                  || objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(v327 + 48) + 40), "entitiesForConfiguration:", v37),  "indexOfObjectIdenticalTo:",  v26) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  ++v34;
                }

                else
                {
                  [v24 removeObjectAtIndex:v34];
                }
              }

              uint64_t v33 = [obj countByEnumeratingWithState:&v371 objects:v418 count:16];
            }

            while (v33);
          }
        }

        else
        {
          __int128 v377 = 0uLL;
          __int128 v378 = 0uLL;
          __int128 v375 = 0uLL;
          __int128 v376 = 0uLL;
          uint64_t v27 = [obj countByEnumeratingWithState:&v375 objects:v419 count:16];
          if (v27)
          {
            unsigned int v28 = 0;
            uint64_t v29 = *(void *)v376;
            do
            {
              for (uint64_t m = 0LL; m != v27; ++m)
              {
                if (*(void *)v376 != v29) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v31 = *(_BYTE **)(*((void *)&v375 + 1) + 8 * m);
                if (objc_msgSend((id)objc_msgSend(v31, "type"), "isEqualToString:", @"SQLite")
                  && v31
                  && (v31[201] & 4) != 0)
                {
                  ++v28;
                }

                else
                {
                  [v24 removeObjectAtIndex:v28];
                }
              }

              uint64_t v27 = [obj countByEnumeratingWithState:&v375 objects:v419 count:16];
            }

            while (v27);
          }
        }

        if ([v24 count] == v323)
        {
        }

        else
        {
          obuint64_t j = v24;
          unint64_t v323 = [obj count];
        }
      }

      id v370 = 0LL;
      if (v323 == 1)
      {
        v338 = (void *)[obj objectAtIndex:0];
        if (*(void *)(v327 + 88) != 2LL)
        {
          __int128 v104 = (void *)v327;
          *(void *)(*(void *)(*(void *)(v327 + 64) + 8) + 40) = [v338 executeRequest:*(void *)(v327 + 32) withContext:*(void *)(v327 + 56) error:&v370];
          if (*(void *)(v327 + 88) == 1LL && *(void *)(v327 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1) {
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
            }
            __int128 v104 = (void *)v327;
            os_signpost_id_t v105 = *(void *)(v327 + 96);
            if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              uint64_t v106 = (os_log_s *)PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                int v107 = [*(id *)(*(void *)(*(void *)(v327 + 64) + 8) + 40) count];
                *(_DWORD *)buf = 67109120;
                LODWORD(v428) = v107;
                _os_signpost_emit_with_name_impl( &dword_186681000,  v106,  OS_SIGNPOST_INTERVAL_END,  v105,  "Fetch",  "%d",  buf,  8u);
                __int128 v104 = (void *)v327;
              }
            }
          }

          if (!*(void *)(*(void *)(v104[8] + 8LL) + 40LL) && v104[13]) {
            *(void *)(*(void *)(v104[10] + 8LL) + 40LL) = v370;
          }
          goto LABEL_414;
        }

        if ([v338 isReadOnly])
        {
          if (*(void *)(v327 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1) {
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
            }
            os_signpost_id_t v38 = *(void *)(v327 + 96);
            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              uint64_t v39 = (os_log_s *)PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl( &dword_186681000,  v39,  OS_SIGNPOST_INTERVAL_END,  v38,  "Save",  "",  buf,  2u);
              }
            }
          }

          if (objc_msgSend( (id)objc_msgSend(v338, "options"),  "objectForKey:",  @"NSReadOnlyPersistentStoreOption"))
          {
            id v40 = @"Unable to write to file opened Read Only.";
          }

          else
          {
            id v40 = @"File is in Read Only mode due to Persistent History being detected but NSPersistentHistoryTrackingKey was not included.";
          }

          uint64_t v41 = (void *)MEMORY[0x189603F68];
          uint64_t v42 = objc_msgSend((id)objc_msgSend(v338, "URL"), "path");
          uint64_t v43 = [v338 options];
          if (!v43) {
            uint64_t v43 = [MEMORY[0x189603FE8] null];
          }
          uint64_t v44 = objc_msgSend( v41,  "dictionaryWithObjectsAndKeys:",  v42,  @"storeURL",  v43,  @"NSPersistentStoreOptions",  v40,  @"reason",  0);
          *(void *)(*(void *)(*(void *)(v327 + 80) + 8) + 40) = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:513 userInfo:v44];
          uint64_t v45 = *(void *)(v327 + 64);
LABEL_400:
          *(void *)(*(void *)(v45 + 8) + 40LL) = 0LL;
          goto LABEL_414;
        }

        [v338 _preflightCrossCheck];
        contextb = (void *)[MEMORY[0x189603FA8] array];
        uint64_t v191 = *(void *)(v327 + 48);
        if (!v191) {
          goto LABEL_369;
        }
        v192 = *(void **)(v327 + 56);
        v333 = *(void **)(v327 + 32);
        if (_PF_Threading_Debugging_level) {
          _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)v192,  sel__checkRequestForStore_withContext_originalRequest_andOptimisticLocking_);
        }
        int v193 = [v338 isReadOnly];
        if (objc_msgSend((id)objc_msgSend(v333, "insertedObjects"), "count")) {
          int v194 = v193;
        }
        else {
          int v194 = 0;
        }
        if (v194 == 1)
        {
          v308 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v338),  @"NSAffectedStoresErrorKey",  0);
          id v309 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134030LL,  (uint64_t)@"Cannot insert objects into a read only store.",  v308);
          objc_exception_throw(v309);
          goto LABEL_502;
        }

        [v192 stalenessInterval];
        uint64_t v196 = v195;
        if (v192) {
          v192[18] = NSSQLDistantPastTimeInterval;
        }
        id v325 = objc_alloc_init(MEMORY[0x1896077E8]);
        v329 = (void *)[v192 _queryGenerationToken];
        int v331 = [v329 _isEnabled];
        if (v331) {
          objc_msgSend( v192,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken unpinnedQueryGenerationToken]( NSQueryGenerationToken,  "unpinnedQueryGenerationToken"),  0);
        }
        v197 = (void *)[v333 insertedObjects];
        if ([v197 count])
        {
          if ([v338 configurationName])
          {
            v198 = (const __CFSet *)[v338 _entitiesForConfiguration];
            __int128 v402 = 0u;
            __int128 v401 = 0u;
            __int128 v399 = 0u;
            __int128 v400 = 0u;
            uint64_t v199 = [v197 countByEnumeratingWithState:&v399 objects:buf count:16];
            if (v199)
            {
              uint64_t v200 = *(void *)v400;
              while (2)
              {
                for (uint64_t n = 0LL; n != v199; ++n)
                {
                  if (*(void *)v400 != v200) {
                    objc_enumerationMutation(v197);
                  }
                  v202 = *(void **)(*((void *)&v399 + 1) + 8 * n);
                  if (!CFSetContainsValue(v198, (const void *)[v202 entity]))
                  {
                    v291 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v202,  @"NSAffectedObjectsErrorKey",  0);
                    uint64_t v292 = [NSString stringWithFormat:@"Store %@ cannot hold instances of entity %@", v338, objc_msgSend(v202, "entity")];
                    id v293 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134020LL,  v292,  v291);
                    objc_exception_throw(v293);
                    goto LABEL_502;
                  }
                }

                uint64_t v199 = [v197 countByEnumeratingWithState:&v399 objects:buf count:16];
                if (v199) {
                  continue;
                }
                break;
              }
            }
          }
        }

        v203 = (void *)[v333 updatedObjects];
        if ([v203 count])
        {
          if (v193)
          {
            v313 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v338),  @"NSAffectedStoresErrorKey",  0);
            uint64_t v314 = *MEMORY[0x189603A60];
            v315 = @"Cannot update objects into a read only store.";
            goto LABEL_499;
          }

          __int128 v397 = 0u;
          __int128 v398 = 0u;
          __int128 v395 = 0u;
          __int128 v396 = 0u;
          uint64_t v204 = [v203 countByEnumeratingWithState:&v395 objects:v426 count:16];
          if (v204)
          {
            uint64_t v205 = *(void *)v396;
            while (2)
            {
              for (iuint64_t i = 0LL; ii != v204; ++ii)
              {
                if (*(void *)v396 != v205) {
                  objc_enumerationMutation(v203);
                }
                v207 = *(void **)(*((void *)&v395 + 1) + 8 * ii);
                v208 = (void *)MEMORY[0x186E3E5D8]();
                if (objc_msgSend((id)objc_msgSend(v207, "objectID"), "isTemporaryID"))
                {
                  v285 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v207),  @"NSAffectedObjectsErrorKey",  0);
                  id v286 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134030LL,  (uint64_t)@"Cannot update object that was never inserted.",  v285);
                  objc_exception_throw(v286);
                  goto LABEL_502;
                }

                uint64_t v209 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:]( v191,  v207,  (void **)v192,  v338);
                if (v209) {
                  [contextb addObject:v209];
                }
                objc_autoreleasePoolPop(v208);
              }

              uint64_t v204 = [v203 countByEnumeratingWithState:&v395 objects:v426 count:16];
              if (v204) {
                continue;
              }
              break;
            }
          }
        }

        v210 = (void *)[v333 deletedObjects];
        if (![v210 count]) {
          goto LABEL_349;
        }
        if (!v193)
        {
          __int128 v393 = 0u;
          __int128 v394 = 0u;
          __int128 v391 = 0u;
          __int128 v392 = 0u;
          uint64_t v211 = [v210 countByEnumeratingWithState:&v391 objects:v425 count:16];
          if (v211)
          {
            v212 = 0LL;
            uint64_t v213 = *(void *)v392;
            while (2)
            {
              for (juint64_t j = 0LL; jj != v211; ++jj)
              {
                if (*(void *)v392 != v213) {
                  objc_enumerationMutation(v210);
                }
                v215 = *(void **)(*((void *)&v391 + 1) + 8 * jj);
                v216 = (void *)MEMORY[0x186E3E5D8]();
                if (objc_msgSend((id)objc_msgSend(v215, "objectID"), "isTemporaryID"))
                {
                  v287 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v215),  @"NSAffectedObjectsErrorKey",  0);
                  id v288 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134030LL,  (uint64_t)@"Cannot delete object that was never inserted.",  v287);
                  objc_exception_throw(v288);
                  goto LABEL_502;
                }

                v217 = (void *)-[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:]( v191,  v215,  (void **)v192,  v338);
                v218 = v217;
                if (v217)
                {
                  if (objc_msgSend( (id)objc_msgSend(v217, "objectForKey:", @"newVersion"),  "intValue"))
                  {
                    [contextb addObject:v218];
                  }

                  else
                  {
                    v219 = v212;
                    if (!v212) {
                      v219 = (void *)objc_msgSend((id)objc_msgSend(v333, "deletedObjects"), "mutableCopy");
                    }
                    v212 = v219;
                    [v219 removeObject:v215];
                  }
                }

                objc_autoreleasePoolPop(v216);
              }

              uint64_t v211 = [v210 countByEnumeratingWithState:&v391 objects:v425 count:16];
              if (v211) {
                continue;
              }
              goto LABEL_350;
            }
          }

- (uint64_t)_doPreSaveAssignmentsForObjects:(void *)a3 intoStores:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  unsigned int v34 = (void *)result;
  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
LABEL_42:
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        unsigned int v28 = (void *)-[__objc2_class anyObject](a2, "anyObject");
      }
      else {
        unsigned int v28 = (void *)-[__objc2_class lastObject](a2, "lastObject");
      }
      _PFAssertSafeMultiThreadedAccess_impl( [v28 managedObjectContext],  sel__doPreSaveAssignmentsForObjects_intoStores_);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id result = -[__objc2_class countByEnumeratingWithState:objects:count:]( a2,  "countByEnumeratingWithState:objects:count:",  &v45,  v55,  16LL);
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v46;
      allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v29 = *(void *)v46;
      uint64_t v30 = a2;
      while (2)
      {
        uint64_t v6 = 0LL;
        uint64_t v31 = v4;
        do
        {
          if (*(void *)v46 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
          if (!objc_msgSend((id)objc_msgSend(v7, "objectID", v29, v30), "persistentStore"))
          {
            uint64_t v32 = v6;
            __int128 v43 = 0u;
            __int128 v44 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            uint64_t v8 = [a3 countByEnumeratingWithState:&v41 objects:v54 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v42;
              while (2)
              {
                uint64_t v11 = 0LL;
                uint64_t v35 = v9;
                do
                {
                  if (*(void *)v42 != v10) {
                    objc_enumerationMutation(a3);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
                  if (([v12 isReadOnly] & 1) == 0)
                  {
                    unint64_t v13 = v7;
                    BOOL v14 = (void *)objc_msgSend( (id)objc_msgSend(v34, "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(v12, "configurationName"));
                    Mutable = CFSetCreateMutable(allocator, 0LL, 0LL);
                    uint64_t v16 = CFSetCreateMutable(allocator, 0LL, 0LL);
                    __int128 v37 = 0u;
                    __int128 v38 = 0u;
                    __int128 v39 = 0u;
                    __int128 v40 = 0u;
                    uint64_t v17 = [v14 countByEnumeratingWithState:&v37 objects:v53 count:16];
                    if (v17)
                    {
                      uint64_t v18 = v17;
                      uint64_t v19 = *(void *)v38;
                      do
                      {
                        for (uint64_t i = 0LL; i != v18; ++i)
                        {
                          if (*(void *)v38 != v19) {
                            objc_enumerationMutation(v14);
                          }
                          CFSetAddValue(v16, *(const void **)(*((void *)&v37 + 1) + 8 * i));
                        }

                        uint64_t v18 = [v14 countByEnumeratingWithState:&v37 objects:v53 count:16];
                      }

                      while (v18);
                    }

                    uint64_t v7 = v13;
                    BOOL v21 = -[NSPersistentStoreCoordinator _canSaveGraphRootedAtObject:intoStore:withPreviouslyChecked:withAcceptableEntities:]( v13,  (uint64_t)v12,  Mutable,  v16);
                    CFRelease(v16);
                    if (v21)
                    {
                      __int128 v49 = 0u;
                      __int128 v50 = 0u;
                      __int128 v51 = 0u;
                      __int128 v52 = 0u;
                      uint64_t v22 = -[__CFSet countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v49,  v56,  16LL);
                      if (v22)
                      {
                        uint64_t v23 = v22;
                        uint64_t v24 = *(void *)v50;
                        do
                        {
                          for (uint64_t j = 0LL; j != v23; ++j)
                          {
                            if (*(void *)v50 != v24) {
                              objc_enumerationMutation(Mutable);
                            }
                            uint64_t v26 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * j) objectID];
                            if ([v26 isTemporaryID]
                              && ![v26 persistentStore])
                            {
                              [v26 _setPersistentStore:v12];
                            }
                          }

                          uint64_t v23 = -[__CFSet countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v49,  v56,  16LL);
                        }

                        while (v23);
                      }

                      CFRelease(Mutable);
                      uint64_t v5 = v29;
                      a2 = v30;
                      uint64_t v4 = v31;
                      uint64_t v6 = v32;
                      goto LABEL_38;
                    }

                    CFRelease(Mutable);
                    uint64_t v9 = v35;
                  }

                  ++v11;
                }

                while (v11 != v9);
                uint64_t v9 = [a3 countByEnumeratingWithState:&v41 objects:v54 count:16];
                if (v9) {
                  continue;
                }
                break;
              }
            }

            a2 = &OBJC_CLASS____NSCoreDataException;
            id v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134020LL,  (uint64_t)@"Can't resolve how to assign objects to stores; some objects may have been assigned to stores; use [[managedObject objectID] persistentStore] to find out what is going where now; use [managedObjectContext assignObject:toStore:] to straighten things out",
                    (void *)[MEMORY[0x189603F68] dictionaryWithObject:v7 forKey:@"problemObject"]);
            objc_exception_throw(v27);
            goto LABEL_42;
          }

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_429(uint64_t a1)
{
  os_signpost_id_t v2 = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:]( *(_NSQueryGenerationToken **)(a1 + 32),  *(void **)(a1 + 40));
  if (!v2)
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"Coordinator failed to create a new query generation post save",  v3,  v4,  v5,  v6,  v7,  v8,  v9);
    os_signpost_id_t v2 =  +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
  }

  uint64_t v10 = v2;
  [*(id *)(a1 + 48) _setQueryGenerationFromToken:v2 error:0];
}

- (_NSQueryGenerationToken)_retainedIdentifierFromStores:(_NSQueryGenerationToken *)result
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if ([a2 count])
    {
      uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      uint64_t v4 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v16;
        while (2)
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v16 != v6) {
              objc_enumerationMutation(a2);
            }
            uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * v7) currentQueryGeneration];
            if (!v8)
            {
              _NSCoreDataLog( 1LL,  (uint64_t)@"Store currentQueryGeneration returned nil unexpectedly",  v9,  v10,  v11,  v12,  v13,  v14,  v15);
              return 0LL;
            }

            [v3 addObject:v8];
            ++v7;
          }

          while (v5 != v7);
          uint64_t v5 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }

      if ([v3 count] == 1)
      {
        return (_NSQueryGenerationToken *)(id)[v3 lastObject];
      }

      else
      {
        id result = objc_alloc(&OBJC_CLASS____NSQueryGenerationToken);
        if (result)
        {
          id result = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken _initWithValue:singleton:](result, v3, 0);
          if (result) {
            *(_WORD *)&result->_flags |= 1u;
          }
        }
      }
    }

    else
    {
      return (_NSQueryGenerationToken *) +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken");
    }
  }

  return result;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_2(uint64_t a1)
{
  v2[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(_NSQueryGenerationToken **)(a1 + 32);
  v2[0] = *(void *)(a1 + 40);
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_3(uint64_t a1)
{
  os_signpost_id_t v2 = -[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:]( *(_NSPersistentHistoryToken **)(a1 + 32),  *(void **)(a1 + 40));
  [*(id *)(a1 + 48) _setChangeTrackingTokenFromToken:v2 error:0];
}

- (uint64_t)applyMigrationStage:(void *)a3 withContext:(void *)a4 error:
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  uint64_t v127 = 0LL;
  uint64_t v128 = &v127;
  uint64_t v129 = 0x2020000000LL;
  char v130 = 1;
  uint64_t v121 = 0LL;
  id v122 = &v121;
  uint64_t v123 = 0x3052000000LL;
  uint64_t v124 = __Block_byref_object_copy__17;
  uint64_t v125 = __Block_byref_object_dispose__17;
  uint64_t v126 = 0LL;
  uint64_t v8 = (void *)objc_opt_class();
  uint64_t v9 = [a3 storeType];
  uint64_t v10 = [a3 storeURL];
  uint64_t v11 = [a3 options];
  objc_msgSend( a3,  "setMetadata:",  objc_msgSend(v8, "metadataForPersistentStoreOfType:URL:options:error:", v9, v10, v11, v122 + 5));
  uint64_t v12 = v122;
  if (v122[5])
  {
    *((_BYTE *)v128 + 24) = 0;
    id v13 = (id)v12[5];
  }

  if (!*((_BYTE *)v128 + 24)) {
    goto LABEL_90;
  }
  if (!a2) {
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ([a2 subsequentStage])
    {
      [a2 subsequentStage];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v14 = (void *)[a2 subsequentStage];
        __int128 v15 = (void *)[v14 currentModel];
        if ([v15 resolve:v122 + 5])
        {
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "currentModel"), "resolvedModel");
LABEL_15:
          uint64_t v19 = v16;
          goto LABEL_24;
        }

        goto LABEL_22;
      }

      uint64_t v29 = [NSString stringWithUTF8String:"I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@"];
      _NSCoreDataLog(17LL, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
      id v27 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v132 = (const char *)a2;
        unsigned int v28 = "CoreData: I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@";
        goto LABEL_21;
      }
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v17 = (void *)[a2 currentModel];
      if (![v17 resolve:v122 + 5]
        || (__int128 v18 = (void *)[a2 nextModel], !objc_msgSend(v18, "resolve:", v122 + 5)))
      {
LABEL_22:
        *((_BYTE *)v128 + 24) = 0;
        id v36 = (id)v122[5];
        goto LABEL_23;
      }

      if ((objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel"), "versionHash"),  "isEqualToData:",  objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "versionHash")) & 1) == 0)
      {
        uint64_t v16 = objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel");
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"I don't know how to handle this type of stage yet: %@"];
      _NSCoreDataLog(17LL, v20, v21, v22, v23, v24, v25, v26, (uint64_t)a2);
      id v27 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v132 = (const char *)a2;
        unsigned int v28 = "CoreData: I don't know how to handle this type of stage yet: %@";
LABEL_21:
        _os_log_fault_impl(&dword_186681000, v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
      }
    }
  }

- (void)createPersistentContainerForMigrationContext:(void *)a1 withModel:(uint64_t)a2 andExecuteBlock:(uint64_t)a3
{
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  uint64_t v14 = 0LL;
  __int128 v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  __int128 v17 = __Block_byref_object_copy__17;
  __int128 v18 = __Block_byref_object_dispose__17;
  uint64_t v19 = 0LL;
  uint64_t v7 = +[NSPersistentContainer persistentContainerWithPath:managedObjectModel:]( NSPersistentContainer,  "persistentContainerWithPath:managedObjectModel:",  objc_msgSend((id)objc_msgSend(a1, "storeURL"), "path"),  a2);
  id v8 = -[NSArray firstObject]( -[NSPersistentContainer persistentStoreDescriptions](v7, "persistentStoreDescriptions"),  "firstObject");
  objc_msgSend(v8, "setType:", objc_msgSend(a1, "storeType"));
  objc_msgSend(v8, "setConfiguration:", objc_msgSend(a1, "configurationName"));
  uint64_t v9 = (void *)[a1 options];
  uint64_t v10 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke;
  v13[3] = &unk_189EA8E08;
  v13[4] = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  [v8 setShouldMigrateStoreAutomatically:0];
  [v8 setShouldInferMappingModelAutomatically:0];
  v12[0] = v10;
  v12[1] = 3221225472LL;
  v12[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2;
  v12[3] = &unk_189EA7A88;
  void v12[4] = &v20;
  v12[5] = &v14;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v7,  "loadPersistentStoresWithCompletionHandler:",  v12);
  if (*((_BYTE *)v21 + 24))
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v11 = v15[5];
  }

  (*(void (**)(uint64_t, NSPersistentContainer *, uint64_t))(a3 + 16))(a3, v7, v11);

  v15[5] = 0LL;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  objc_autoreleasePoolPop(v6);
}

uint64_t __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) setOption:a3 forKey:a2];
}

void *__103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2( void *result,  uint64_t a2,  void *a3)
{
  if (a3)
  {
    uint64_t v3 = result;
    *(_BYTE *)(*(void *)(result[4] + 8LL) + 24LL) = 0;
    id result = a3;
    *(void *)(*(void *)(v3[5] + 8LL) + 40LL) = result;
  }

  return result;
}

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    [*(id *)(a1 + 32) setContainer:a2];
    uint64_t v4 = [*(id *)(a1 + 40) willMigrateHandler];
    if ((*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))( v4,  [*(id *)(a1 + 48) stagedMigrationManager],  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      return (id)[*(id *)(a1 + 32) setContainer:0];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      return (id)[*(id *)(a1 + 32) setContainer:0];
    }

    uint64_t v7 = *MEMORY[0x189603A60];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = @"offendingStage";
    v10[0] = v8;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v7,  @"willMigrate must return YES or NO with an error",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
    return (id)-[NSPersistentStoreCoordinator _setIsMigrating:]();
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  }

  return result;
}

- (void)_setIsMigrating:(unint64_t)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    void v2[2] = __68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke;
    v2[3] = &unk_189EA8728;
    v2[4] = a1;
    char v3 = a2;
    _perform_0(a1, (uint64_t)v2);
  }

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    [*(id *)(a1 + 32) setContainer:a2];
    uint64_t v4 = [*(id *)(a1 + 40) didMigrateHandler];
    if ((*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))( v4,  [*(id *)(a1 + 48) stagedMigrationManager],  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      return (id)[*(id *)(a1 + 32) setContainer:0];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      return (id)[*(id *)(a1 + 32) setContainer:0];
    }

    uint64_t v7 = *MEMORY[0x189603A60];
    uint64_t v8 = *(void *)(a1 + 40);
    id v13 = @"offendingStage";
    v14[0] = v8;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v7,  @"didMigrate must return YES or NO with an error",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1)));
    return -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:](v9, v10, v11, v12);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  }

  return result;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  return -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](self, (char *)a3, a4, 0LL);
}

- (NSTemporaryObjectID)managedObjectIDFromUTF8String:(uint64_t)a3 length:(void *)a4 error:
{
  v36[256] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (a3 < 14 || __s1[a3] || strncmp(__s1, "x-coredata://", 0xDuLL))
  {
    if (a4)
    {
      uint64_t v8 = 0LL;
      *a4 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
      return v8;
    }

    return 0LL;
  }

  uint64_t v10 = 134060LL;
  uint64_t v11 = _PFStackAllocatorCreate(v36, 2048LL);
  unint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DC8];
  id v13 = CFStringCreateWithBytesNoCopy( v11,  (const UInt8 *)__s1 + 13,  a3 - 13,  0x8000100u,  0,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (__s1[13] == 47)
  {
    CFStringRef v14 = 0LL;
    uint64_t v15 = 14LL;
  }

  else
  {
    uint64_t v16 = strchr(__s1 + 13, 47);
    if (v16)
    {
      uint64_t v17 = v16 - __s1;
      v37.length = v16 - __s1 - 13;
      v37.locatiouint64_t n = 0LL;
      CFStringRef v14 = CFStringCreateWithSubstring(v11, v13, v37);
      uint64_t v15 = v17 + 1;
      if (v14)
      {
        __int128 v18 = (const __CFString *)-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]( (uint64_t)a1,  (uint64_t)v14);
        CFStringRef v19 = v14;
        CFStringRef v14 = v18;
        CFRelease(v19);
        if (!v14)
        {
          if (!a4)
          {
            uint64_t v8 = 0LL;
            goto LABEL_31;
          }

          uint64_t v10 = 134000LL;
          goto LABEL_30;
        }
      }
    }

    else
    {
      CFStringRef v14 = 0LL;
      uint64_t v15 = 13LL;
    }
  }

  if (v15 >= a3)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v20 = &__s1[v15];
    uint64_t v21 = strchr(&__s1[v15], 47);
    if (!v21) {
      goto LABEL_27;
    }
    uint64_t v34 = (__CFString *)v14;
    uint64_t v22 = v21 - v20;
    v38.locatiouint64_t n = v15 - 13;
    v38.length = v21 - v20;
    CFStringRef v23 = CFStringCreateWithSubstring(v11, v13, v38);
    if (!v23) {
      goto LABEL_27;
    }
    CFStringRef v24 = v23;
    uint64_t v35 = v22;
    uint64_t v25 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "entitiesByName"),  "objectForKey:",  v23);
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      CFRelease(v24);
      id v27 = v26;
      uint64_t v22 = v35;
    }

    else
    {
      unsigned int v28 = (void *)[a1 persistentStoreCoordinator];
      if (v28) {
        unsigned int v28 = (void *)v28[12];
      }
      id v27 = -[_PFModelMap ancillaryEntityWithName:](v28, (uint64_t)v24);
      CFRelease(v24);
      if (!v27) {
        goto LABEL_27;
      }
    }

    uint64_t v29 = v22 + 2;
    if (v22 + 2 > a3)
    {
LABEL_27:
      uint64_t v8 = 0LL;
      uint64_t v10 = 134060LL;
      goto LABEL_28;
    }

    int v30 = v20[v22 + 1];
    uint64_t v31 = &v20[v29];
    uint64_t v32 = (char *)(__s1 - &v20[v29] + a3);
    if (v30 == 116)
    {
      CFStringRef v33 = CFStringCreateWithBytesNoCopy(v11, (const UInt8 *)&v20[v29], (CFIndex)v32, 0x8000100u, 0, v12);
      uint64_t v8 =  -[NSTemporaryObjectID initWithEntity:andUUIDString:]( objc_alloc(&OBJC_CLASS___NSTemporaryObjectID),  "initWithEntity:andUUIDString:",  v27,  v33);
      if (v33) {
        CFRelease(v33);
      }
      uint64_t v10 = 134060LL;
      if (v34) {
        -[NSTemporaryObjectID _setPersistentStore:](v8, "_setPersistentStore:");
      }
    }

    else
    {
      uint64_t v8 = 0LL;
      uint64_t v10 = 134060LL;
      if (v30 == 112 && v34) {
        uint64_t v8 = (NSTemporaryObjectID *)objc_msgSend( (id)-[__CFString objectIDFactoryForEntity:](v34, "objectIDFactoryForEntity:", v27),  "managedObjectIDFromUTF8String:length:",  v31,  v32);
      }
    }
  }

- (void).cxx_destruct
{
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke( uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  byte_18C4ABA41 = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.PowerAssertionsDebug");
  os_signpost_id_t v2 = getprogname();
  if (strcmp("chronod", v2) && strcmp("SpringBoard", v2))
  {
    Class Class = objc_getClass("UIApplication");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = Class;
    if (Class)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        id v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), sel_sharedApplication);
      }
      else {
        id v4 = 0LL;
      }
      int v18 = 0;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      *(_OWORD *)str = 0u;
      __int128 v13 = 0u;
      __strlcpy_chk();
      qword_18C4ABA68 = (uint64_t)sel_registerName(str);
      char v11 = objc_opt_respondsToSelector();
      if (byte_18C4ABA41) {
        _NSCoreDataLog( 9LL,  (uint64_t)@"Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@",  v5,  v6,  v7,  v8,  v9,  v10,  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
      }
      if ((v11 & 1) != 0) {
        qword_18C4ABA60 = (uint64_t)v4;
      }
    }

    if (!qword_18C4ABA60 && !strcmp("Podcasts", v2)) {
      _MergedGlobals_75 = 1;
    }
  }

+ (uint64_t)_shouldDebugAllTaskAssertions
{
  return (char)+[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.PowerAssertionsDebug");
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
}

- (void)_persistentStoreForIdentifier:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  char v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](a1);
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v7 = (void *)[v3 objectAtIndex:v6];
      if (v5 == ++v6) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_6:
    uint64_t v7 = 0LL;
  }

  return v7;
}

id __110__NSPersistentStoreCoordinator__NSInternalMethods__newValueForRelationship_forObjectWithID_withContext_error___block_invoke( uint64_t a1,  void *a2)
{
  v7[3] = *MEMORY[0x1895F89C0];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    void v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
  }

  else
  {
    if ([*(id *)(a1 + 48) isTransient]) {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = NSArray_EmptyArray;
    }
    else {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 newValueForRelationship:*(void *)(a1 + 48) forObjectWithID:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    }
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  CFRange v38 = &v37;
  uint64_t v39 = 0x3052000000LL;
  __int128 v40 = __Block_byref_object_copy__17;
  __int128 v41 = __Block_byref_object_dispose__17;
  uint64_t v42 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3052000000LL;
  uint64_t v34 = __Block_byref_object_copy__17;
  uint64_t v35 = __Block_byref_object_dispose__17;
  uint64_t v36 = 0LL;
  uint64_t v11 = [a4 persistentStore];
  int v30 = 0LL;
  if (a5) {
    uint64_t v12 = *((void *)a5 + 20);
  }
  else {
    uint64_t v12 = 0LL;
  }
  __int128 v13 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
  if (v13 != (NSQueryGenerationToken *)[a5 _queryGenerationToken]) {
    goto LABEL_4;
  }
  id v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v12);
  if (!v18)
  {
    uint64_t v20 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134502 userInfo:0];
    int v30 = v20;
    if (!v20)
    {
LABEL_12:
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      unsigned int v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v45 = 1024;
        int v46 = 4741;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }

      goto LABEL_17;
    }

id __136__NSPersistentStoreCoordinator__NSInternalMethods___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke( uint64_t a1,  void *a2)
{
  void v7[5] = *MEMORY[0x1895F89C0];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    void v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 _newOrderedRelationshipInformationForRelationship:*(void *)(a1 + 48) fo rObjectWithID:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  }

  return result;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  uint64_t v22 = __Block_byref_object_copy__17;
  uint64_t v23 = __Block_byref_object_dispose__17;
  uint64_t v24 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  __int128 v16 = __Block_byref_object_copy__17;
  __int128 v17 = __Block_byref_object_dispose__17;
  uint64_t v18 = 0LL;
  uint64_t v9 = [a3 persistentStore];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke;
  v12[3] = &unk_189EA8EC8;
  void v12[4] = a3;
  v12[5] = a4;
  void v12[6] = &v19;
  v12[7] = &v13;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((unint64_t)self, (uint64_t)v12, v9);
  if (a5) {
    *a5 = (id)v14[5];
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

id __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke( void *a1,  void *a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 _allOrderKeysForDestination:a1[4] inRelationship:a1[5] error:*(void *)(a1[7] + 8) + 40];
  return *(id *)(*(void *)(a1[7] + 8LL) + 40LL);
}

void __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke( uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 56) == 1LL)
  {
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v2)
    {
      char v3 = (void *)v2;
      if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) indexOfObjectIdenticalTo:v2] != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v4 = [v3 supportsGenerationalQuerying];
        uint64_t v5 = *(void *)(a1 + 32);
        if (v4) {
          [v3 managedObjectContextDidUnregisterObjectsWithIDs:v5 generation:*(void *)(a1 + 40)];
        }
        else {
          [v3 managedObjectContextDidUnregisterObjectsWithIDs:v5];
        }
      }
    }
  }

  else
  {
    valueCallBacks.versiouint64_t n = 0LL;
    valueCallBacks.retaiuint64_t n = 0LL;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x189605250] + 16LL);
    valueCallBacks.equal = 0LL;
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, &valueCallBacks);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v13 = [v12 persistentStore];
          if (v13)
          {
            id v14 = (const void *)v13;
            if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) indexOfObjectIdenticalTo:v13] != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v6, v14);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0LL, 0LL);
                CFDictionarySetValue(v6, v14, Value);
              }

              CFArrayAppendValue((CFMutableArrayRef)Value, v12);
            }
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v9);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v16 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v32,  16LL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0LL; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v6);
          }
          uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          uint64_t v21 = CFDictionaryGetValue(v6, v20);
          else {
            [v20 managedObjectContextDidUnregisterObjectsWithIDs:v21];
          }
        }

        uint64_t v17 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v32,  16LL);
      }

      while (v17);
    }

    CFRelease(v6);
  }

- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (![a3 count]) {
    return 1;
  }
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)v39;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v39 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) managedObjectContext];
      uint64_t v12 = (void *)v11;
      if (v11)
      {
        uint64_t v37 = 0LL;
        if (_PF_Threading_Debugging_level) {
          _PFAssertSafeMultiThreadedAccess_impl(v11, a2);
        }
        uint64_t v31 = 0LL;
        uint64_t v32 = &v31;
        uint64_t v33 = 0x3052000000LL;
        uint64_t v34 = __Block_byref_object_copy__17;
        uint64_t v35 = __Block_byref_object_dispose__17;
        uint64_t v36 = 0LL;
        uint64_t v27 = 0LL;
        __int128 v28 = &v27;
        uint64_t v29 = 0x2020000000LL;
        char v30 = 0;
        __int128 v23 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Executing obtain objectID request",  &v37);
        uint64_t v26 = 0LL;
        uint64_t v16 = v12[20];
        uint64_t v17 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
        if (v17 != (NSQueryGenerationToken *)[v12 _queryGenerationToken]) {
          goto LABEL_22;
        }
        id v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:]( self,  "_retainedCurrentQueryGeneration:",  v16);
        if (v18)
        {
          char v19 = [v12 _setQueryGenerationFromToken:v18 error:&v26];

          if ((v19 & 1) != 0)
          {
LABEL_22:
            v25[0] = 0LL;
            v25[1] = v25;
            v25[2] = 0x3052000000LL;
            v25[3] = __Block_byref_object_copy__17;
            v25[4] = __Block_byref_object_dispose__17;
            v25[5] = [MEMORY[0x189603FA8] array];
            v24[0] = MEMORY[0x1895F87A8];
            v24[1] = 3221225472LL;
            v24[2] = __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke;
            v24[3] = &unk_189EA8F40;
            v24[4] = v16;
            v24[5] = self;
            v24[6] = a3;
            v24[7] = v12;
            v24[8] = &v31;
            v24[9] = v25;
            v24[10] = &v27;
            -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((unint64_t)self, (uint64_t)v24);
            _Block_object_dispose(v25, 8);
            +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v37,  v23);
            id v20 = (id)v32[5];
            if (a4)
            {
              uint64_t v21 = (void *)v32[5];
              if (v21) {
                *a4 = v21;
              }
            }

            BOOL v15 = *((_BYTE *)v28 + 24) != 0;
            _Block_object_dispose(&v27, 8);
            _Block_object_dispose(&v31, 8);
            return v15;
          }
        }

        else
        {
          uint64_t v26 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134502 userInfo:0];
        }

        objc_msgSend( v12,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken unpinnedQueryGenerationToken]( NSQueryGenerationToken,  "unpinnedQueryGenerationToken"),  0);
        goto LABEL_22;
      }
    }

    uint64_t v8 = [a3 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v8) {
      continue;
    }
    break;
  }

void __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) count]) {
    goto LABEL_14;
  }
  id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v49 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v6 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      }

      uint64_t v3 = [a2 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }

    while (v3);
  }

  if (v34)
  {
    uint64_t v33 = v34;
    if (![v34 count]) {
      goto LABEL_56;
    }
  }

  else
  {
LABEL_14:
    uint64_t v33 = a2;
    id v34 = 0LL;
  }

  if (![a2 count])
  {
LABEL_56:
    id v32 = objc_retain( +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134020LL,  (uint64_t)@"Can't resolve how to assign objects to stores; Coordinator does not have any stores",
              0LL));
    objc_exception_throw(v32);
    goto LABEL_58;
  }

  id v7 = 0LL;
  char v8 = 1;
  do
  {
    -[NSPersistentStoreCoordinator _doPreSaveAssignmentsForObjects:intoStores:]( *(void *)(a1 + 40),  *(__objc2_class **)(a1 + 48),  v33);
    if (v7) {

    }
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t j = 0LL; j != v10; ++j)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          uint64_t v14 = (void *)[v13 objectID];
          if ([v14 isTemporaryID])
          {
            uint64_t v15 = [v14 persistentStore];
            if (v15)
            {
              id v16 = (id)[v7 objectForKey:v15];
              if (!v16)
              {
                id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
                [v7 setObject:v16 forKey:v15];
              }

              [v16 addObject:v13];
            }

            else
            {
              char v8 = 0;
            }
          }
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }

      while (v10);
    }

    char v17 = v8;
    char v8 = 0;
  }

  while ((v17 & 1) == 0);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v41;
LABEL_35:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(v7);
      }
      uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
      uint64_t v22 = (void *)[v7 objectForKey:v21];
      __int128 v23 = (void *)[v21 obtainPermanentIDsForObjects:v22 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      __int128 v24 = v23;
      if (!v23) {
        break;
      }
      if ([v23 count])
      {
        __int128 v25 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](*(void *)(a1 + 56), v22, v24);
        if (v25)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v25];
        }
      }

      if (v18 == ++v20)
      {
        uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v53 count:16];
        if (v18) {
          goto LABEL_35;
        }
        goto LABEL_44;
      }
    }
  }

  else
  {
LABEL_44:
    LODWORD(v24) = 0;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
  }

  id v26 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
  {
    uint64_t v27 = (void *)MEMORY[0x186E3E5D8]();
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v28 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v37;
      do
      {
        for (uint64_t k = 0LL; k != v29; ++k)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotification:",  *(void *)(*((void *)&v36 + 1) + 8 * k));
        }

        uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v52 count:16];
      }

      while (v29);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeAllObjects];
    objc_autoreleasePoolPop(v27);
  }

  if ((_DWORD)v24)
  {
    objc_exception_rethrow();
LABEL_58:
    __break(1u);
  }

- (BOOL)_canSaveGraphRootedAtObject:(void *)value intoStore:(uint64_t)a2 withPreviouslyChecked:(CFSetRef)theSet withAcceptableEntities:(const __CFSet *)a4
{
  CFSetRef v48 = a4;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl( [value managedObjectContext],  sel__canSaveGraphRootedAtObject_intoStore_withPreviouslyChecked_withAcceptableEntities_);
    if (!value) {
      return 1LL;
    }
  }

  else if (!value)
  {
    return 1LL;
  }

  if (CFSetContainsValue(theSet, value)) {
    return 1LL;
  }
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  CFSetAddValue(Mutable, value);
  CFMutableSetRef v51 = theSet;
  do
  {
    CFIndex Count = CFSetGetCount(Mutable);
    BOOL v46 = Count == 0;
    if (!Count) {
      break;
    }
    CFIndex v10 = Count;
    __int128 v47 = v45;
    unint64_t v11 = MEMORY[0x1895F8858]();
    uint64_t v13 = (const void **)&v45[-v12];
    if (v11 > 0x200) {
      uint64_t v13 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero(&v45[-v12], 8 * v11);
    }
    CFSetGetValues(Mutable, v13);
    CFSetRemoveAllValues(Mutable);
    unint64_t v14 = 0LL;
    int v15 = 0;
    unint64_t v50 = v10;
    __int128 v49 = v13;
    while (1)
    {
      int v52 = v15;
      uint64_t v55 = (id **)v13[v14];
      if (!CFSetContainsValue(theSet, v55)) {
        break;
      }
LABEL_39:
      unint64_t v14 = (v52 + 1);
      int v15 = v52 + 1;
      unint64_t v43 = v50;
      theSet = v51;
      uint64_t v13 = v49;
      if (v50 <= v14)
      {
        char v44 = 1;
        goto LABEL_42;
      }
    }

    id v16 = v55;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v55, "objectID"), "persistentStore");
    uint64_t v18 = (unint64_t *)[v16 entity];
    if (v17) {
      BOOL v19 = v17 == a2;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
      uint64_t v20 = v18;
      if (CFSetContainsValue(v48, v18))
      {
        uint64_t v21 = v55;
        CFSetAddValue(v51, v55);
        if (([v21 isFault] & 1) == 0)
        {
          uint64_t v22 = (void *)v20[14];
          uint64_t v23 = *(void *)(v20[13] + 40);
          uint64_t v54 = _kvcPropertysPrimitiveGetters(v20);
          unint64_t v28 = v22[12];
          uint64_t v29 = v22[13];
          if (v28 < v29 + v28)
          {
            do
            {
              _PF_Handler_Primitive_GetProperty( v55,  v28,  *(void *)(v23 + 8 * v28),  *(void *)(v54 + 8 * v28),  v24,  v25,  v26,  v27);
              if (v30)
              {
                uint64_t v31 = v30;
                id v32 = (void *)[v30 objectID];
                if (([v32 isTemporaryID] & 1) != 0 || objc_msgSend(v32, "persistentStore") != a2) {
                  CFSetAddValue(Mutable, v31);
                }
              }

              ++v28;
              --v29;
            }

            while (v29);
          }

          unint64_t v33 = v22[18];
          unint64_t v53 = v22[19] + v33;
          if (v33 < v53)
          {
            do
            {
              uint64_t v34 = v23;
              _PF_Handler_Primitive_GetProperty( v55,  v33,  *(void *)(v23 + 8 * v33),  *(void *)(v54 + 8 * v33),  v24,  v25,  v26,  v27);
              __int128 v36 = v35;
              if (([v35 isFault] & 1) == 0)
              {
                if ([v36 count])
                {
                  __int128 v58 = 0u;
                  __int128 v59 = 0u;
                  __int128 v57 = 0u;
                  __int128 v56 = 0u;
                  uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v60 count:16];
                  if (v37)
                  {
                    uint64_t v38 = v37;
                    uint64_t v39 = *(void *)v57;
                    do
                    {
                      for (uint64_t i = 0LL; i != v38; ++i)
                      {
                        if (*(void *)v57 != v39) {
                          objc_enumerationMutation(v36);
                        }
                        __int128 v41 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                        __int128 v42 = (void *)[v41 objectID];
                        if (([v42 isTemporaryID] & 1) != 0 || objc_msgSend(v42, "persistentStore") != a2) {
                          CFSetAddValue(Mutable, v41);
                        }
                      }

                      uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v60 count:16];
                    }

                    while (v38);
                  }
                }
              }

              ++v33;
              uint64_t v23 = v34;
            }

            while (v33 != v53);
          }
        }

        goto LABEL_39;
      }
    }

    char v44 = 0;
    theSet = v51;
    unint64_t v43 = v50;
    uint64_t v13 = v49;
LABEL_42:
    if (v43 >= 0x201) {
      NSZoneFree(0LL, v13);
    }
  }

  while ((v44 & 1) != 0);
  CFRelease(Mutable);
  return v46;
}

- (uint64_t)_newConflictRecordForObject:(unint64_t)a3 andOriginalRow:(void *)a4 withContext:
{
  if (result)
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    if (a3 && [a2 managedObjectContext])
    {
      uint64_t v6 = (void *)[v5 entity];
      __int128 v40 = (void *)[v5 objectID];
      uint64_t v7 = [v40 persistentStore];
      char v8 = (void *)v7;
      if (v7) {
        uint64_t v38 = *(void *)(v7 + 48);
      }
      else {
        uint64_t v38 = 0LL;
      }
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "propertiesByName"), "values");
      CFIndex v10 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
      uint64_t v39 = v8;
      if (v6) {
        uint64_t v11 = v6[13];
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = -[NSKnownKeysDictionary initWithSearchStrategy:](v10, "initWithSearchStrategy:", v11);
      uint64_t v36 = -[NSKnownKeysDictionary values](v12, "values");
      uint64_t v13 = [(id)v4 knownKeyValuesPointer];
      uint64_t v14 = -[NSKnownKeysMappingStrategy keys](-[NSKnownKeysDictionary mapping](v12, "mapping"), "keys");
      uint64_t v15 = [MEMORY[0x189603FE8] null];
      id v16 = (void *)v6[14];
      unint64_t v17 = v16[6];
      uint64_t v18 = v16[7];
      uint64_t v37 = v12;
      if (v17 < v18 + v17)
      {
        uint64_t v34 = v9;
        BOOL v19 = (void *)(v14 + 8 * v17);
        uint64_t v20 = (void *)(v36 + 8 * v17);
        uint64_t v21 = (void **)(v13 + 8 * v17);
        do
        {
          if (v13) {
            uint64_t v22 = *v21;
          }
          else {
            uint64_t v22 = (void *)[(id)v4 valueForKey:*v19];
          }
          id v23 = (id)v15;
          if (v22) {
            id v23 = v22;
          }
          *v20++ = v23;
          ++v19;
          ++v21;
          --v18;
        }

        while (v18);
        id v16 = (void *)v6[14];
        uint64_t v12 = v37;
        uint64_t v9 = v34;
      }

      unint64_t v24 = v16[12];
      uint64_t v25 = v16[13];
      if (v24 < v25 + v24)
      {
        uint64_t v35 = v5;
        uint64_t v26 = (void *)(v9 + 8 * v24);
        uint64_t v27 = (uint64_t *)(v36 + 8 * v24);
        unint64_t v28 = (void **)(v13 + 8 * v24);
        do
        {
          if (v13) {
            uint64_t v29 = *v28;
          }
          else {
            uint64_t v29 = (void *)[v39 newValueForRelationship:*v26 forObjectWithID:v40 withContext:a4 error:0];
          }
          uint64_t v30 = v15;
          if (v29)
          {
            id v31 = (_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
                ? v29
                : -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a4, v29, v38);
            uint64_t v30 = (uint64_t)v31;
            if (!v13) {
          }
            }

          *v27++ = v30;
          ++v26;
          ++v28;
          --v25;
        }

        while (v25);
        uint64_t v5 = v35;
        uint64_t v12 = v37;
      }
    }

    else
    {
      uint64_t v12 = (NSKnownKeysDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
    }

    id v32 = objc_alloc(&OBJC_CLASS___NSMergeConflict);
    if (v4) {
      unint64_t v4 = [(id)v4 _versionNumber];
    }
    uint64_t v33 = -[NSMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:]( v32,  "initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:",  v5,  v4,  [v5 _versionReference],  v12,  0);

    return v33;
  }

  return result;
}

- (uint64_t)_conflictsWithRowCacheForObject:(void *)a3 withContext:(void *)a4 andStore:
{
  v26[2] = *MEMORY[0x1895F89C0];
  uint64_t v8 = [a2 objectID];
  unsigned int v9 = [a2 _versionReference];
  id v23 = 0LL;
  CFIndex v10 = (void *)[a4 newValuesForObjectWithID:v8 withContext:a3 error:&v23];
  uint64_t v11 = v10;
  if (v10)
  {
    if (v9 >= [v10 _versionNumber])
    {
      id v16 = 0LL;
      goto LABEL_12;
    }

    uint64_t v12 = a1;
    uint64_t v13 = a2;
    unint64_t v14 = (unint64_t)v11;
LABEL_10:
    id v16 = (void *)-[NSPersistentStoreCoordinator _newConflictRecordForObject:andOriginalRow:withContext:]( v12,  v13,  v14,  a3);
    id v17 = v16;
LABEL_12:

    return (uint64_t)v16;
  }

  if (!v23
    || (uint64_t v15 = (void *)[v23 domain],
        [v15 isEqualToString:*MEMORY[0x189607460]])
    && [v23 code] == 133000)
  {
    uint64_t v12 = a1;
    uint64_t v13 = a2;
    unint64_t v14 = 0LL;
    goto LABEL_10;
  }

  uint64_t v19 = *MEMORY[0x189603A60];
  uint64_t v20 = [v23 code];
  uint64_t v21 = *MEMORY[0x189607798];
  v26[0] = v23;
  v25[0] = v21;
  v25[1] = @"NSAffectedObjectsErrorKey";
  uint64_t v24 = v8;
  v26[1] = [MEMORY[0x189603F18] arrayWithObjects:&v24 count:1];
  id v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v19,  v20,  (uint64_t)@"An error occurred while trying to fetch a row for conflict detection.",  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2]);
  -[_NSCoreDataException _setDomain:]((uint64_t)v22, (void *)[v23 domain]);
  objc_exception_throw(v22);
  return -[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:]();
}

- (const)_storeClassForStoreWithType:(const char *)result URL:(uint64_t)a2 options:(void *)a3
{
  if (result)
  {
    unint64_t v4 = (char *)result;
    id result = (const char *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  a2);
    if (!result)
    {
      if (![v4 persistentStoreForURL:a3]) {
        return +[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  a3);
      }
      id result = (const char *)objc_opt_class();
      if (!result) {
        return +[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  a3);
      }
    }
  }

  return result;
}

- (void)_postStoreRemoteChangeNotificationsForStore:(uint64_t)a3 andState:
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = (void *)[MEMORY[0x189607958] defaultCenter];
    id v7 = (id)[a2 identifier];
    id v8 = (id)[a2 URL];
    id v9 = objc_alloc(MEMORY[0x189603FC8]);
    v21[0] = v7;
    uint64_t v10 = [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
    uint64_t v20 = @"NSStoreUUID";
    uint64_t v11 = (void *)objc_msgSend( v9,  "initWithObjects:forKeys:",  v10,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v20, 1));
    if (!v7)
    {
      uint64_t v13 = 0LL;
LABEL_12:

      return;
    }

    if (a3)
    {
      uint64_t v12 = objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken);
      uint64_t v13 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]( v12,  "initWithTransactionNumber:andStoreID:",  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3],  v7);
      [v11 setObject:v13 forKey:@"historyToken"];
      if (!v8) {
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
      if (!v8)
      {
LABEL_9:
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
          _NSCoreDataLog( 9LL,  (uint64_t)@"Remote Change Notification - posting for store  %@ with userInfo %@",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)v7);
        }
        [v6 postNotificationName:@"NSPersistentStoreRemoteChangeNotification" object:a1 userInfo:v11];
        goto LABEL_12;
      }
    }

    [v11 setObject:v8 forKey:@"storeURL"];
    goto LABEL_9;
  }

- (void)_copyMetadataFromStore:(void *)a3 toStore:(uint64_t)a4 migrationManager:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = (void *)[a2 metadata];
    id v7 = (void *)[a3 metadata];
    id v8 = (void *)[v6 mutableCopyWithZone:0];
    id v9 = v8;
    if (!a4) {
      [v8 removeObjectForKey:@"NSStoreUUID"];
    }
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v10 = (void *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"NSStoreModelVersionHashesVersion",  @"NSStoreModelVersionHashes",  @"NSStoreModelVersionIdentifiers",  @"NSPersistenceFrameworkVersion",  0,  0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v16 = [v7 objectForKey:v15];
          [v9 removeObjectForKey:v15];
          if (v16) {
            [v9 setObject:v16 forKey:v15];
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v12);
    }

    [a3 setMetadata:v9];
  }

uint64_t __68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke( uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 24LL) = *(_WORD *)(*(void *)(result + 32) + 24LL) & 0xFBFF | (*(unsigned __int8 *)(result + 40) << 10);
  return result;
}

+ (id)ubiquityStoreURLForStoreURL:(id)a3 ubiquityIdentityToken:(id)a4 ubiquityName:(id)a5
{
  return 0LL;
}

- (id)currentQueryGenerationTokenFromStores:(id)a3
{
  return  -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:]( self,  "_retainedCurrentQueryGeneration:",  a3);
}

- (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 storeType:(id)a7 error:(id *)a8
{
  v36[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v21 = (void *)MEMORY[0x189603F70];
    uint64_t v22 = *MEMORY[0x189603A60];
    id v23 = @"Invalid destination store URL: nil";
    goto LABEL_14;
  }

  if (!a5)
  {
    uint64_t v21 = (void *)MEMORY[0x189603F70];
    uint64_t v22 = *MEMORY[0x189603A60];
    id v23 = @"Invalid source store URL: nil";
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0, a6, a7, a8));
  }

  if (objc_msgSend(a5, "isEqual:")) {
    return 1;
  }
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  id v32 = __Block_byref_object_copy__17;
  uint64_t v33 = __Block_byref_object_dispose__17;
  uint64_t v34 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v16 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:", a3);
  if (v16)
  {
    __int128 v17 = (void *)[MEMORY[0x189607958] defaultCenter];
    uint64_t v35 = @"removed";
    v36[0] = v16;
    objc_msgSend( v17,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  }

  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke;
  v24[3] = &unk_189EA8F68;
  v24[4] = self;
  v24[5] = a7;
  v24[6] = a5;
  v24[7] = a6;
  v24[8] = a3;
  v24[9] = a4;
  v24[10] = &v29;
  void v24[11] = &v25;
  v24[12] = a8;
  _perform_0((unint64_t)self, (uint64_t)v24);
  id v18 = (id)v30[5];
  if (a8)
  {
    __int128 v19 = (void *)v30[5];
    if (v19) {
      *a8 = v19;
    }
  }

  BOOL v15 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v15;
}

void __182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:]( *(const char **)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48));
  if (!v2) {
    uint64_t v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:]( *(const char **)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 64));
  }
  uint64_t v3 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 64)];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if (!-[NSPersistentStoreCoordinator _removePersistentStore:error:]( *(void *)(a1 + 32),  v3,  (void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL)))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
      goto LABEL_25;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  uint64_t v5 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 48)];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = (void *)[*(id *)(a1 + 56) objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
    if (v7) {
      int v8 = [v7 BOOLValue];
    }
    else {
      int v8 = 0;
    }
    if (v4 && v6 && v4 != v6)
    {
      uint64_t v19 = [NSString stringWithFormat:@"source and destination store are different classes of store: %@ != %@", v4, v6];
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v19 userInfo:0]);
      __break(1u);
      return;
    }
  }

  else
  {
    int v8 = 0;
  }

  if (v2) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v2 _replacePersistentStoreAtURL:*(void *)(a1 + 64) destinationOptions:*(void *)(a1 + 72) withP ersistentStoreFromURL:*(void *)(a1 + 48) sourceOptions:*(void *)(a1 + 56) error:*(void *)(*(void *)(a1 + 80) + 8) + 40];
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL)) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(a1 + 32) setURL:*(void *)(a1 + 64) forPersistentStore:v5];
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL))
    {
      BOOL v15 = (void *)MEMORY[0x189607870];
      uint64_t v16 = (void *)MEMORY[0x189603F68];
      uint64_t v17 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", *(void *)(a1 + 48), *(void *)(a1 + 64), 0);
      uint64_t v18 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x189607760], 0);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v15 errorWithDomain:*MEMORY[0x189607460] code:134080 userInfo:v18];
    }
  }

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 options:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Invalid store URL: nil",  0,  a6));
  }
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  uint64_t v25 = __Block_byref_object_copy__17;
  uint64_t v26 = __Block_byref_object_dispose__17;
  uint64_t v27 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v11 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v11)
  {
    uint64_t v12 = (void *)[MEMORY[0x189607958] defaultCenter];
    char v28 = @"removed";
    v29[0] = v11;
    objc_msgSend( v12,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
  }

  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke;
  v17[3] = &unk_189EA8F90;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = a3;
  v17[7] = a5;
  v17[8] = &v22;
  v17[9] = &v18;
  v17[10] = a6;
  _perform_0((unint64_t)self, (uint64_t)v17);
  id v13 = (id)v23[5];
  if (a6)
  {
    uint64_t v14 = (void *)v23[5];
    if (v14) {
      *a6 = v14;
    }
  }

  char v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

id __129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:]( *(const char **)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48));
  id v3 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v7 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 48)];
  if (v7) {
    BOOL v8 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:]( *(void *)(a1 + 32),  v7,  (void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  [v6 drain];
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (!v8)
  {
    if (v2)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v2 _destroyPersistentStoreAtURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    }

    else if (*(void *)(a1 + 80))
    {
      uint64_t v11 = (void *)MEMORY[0x189607870];
      uint64_t v12 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  *(void *)(a1 + 48),  *MEMORY[0x189607760],  0);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v11 errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:v12];
    }
  }

  return *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
}

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5
{
  return -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:]( self,  "_destroyPersistentStoreAtURL:withType:options:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)_rekeyPersistentStoreAtURL:(id)a3 type:(id)a4 options:(id)a5 withKey:(id)a6 error:(id *)a7
{
  v49[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Invalid store URL: nil",  0,  a6,  a7));
  }
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3052000000LL;
  __int128 v41 = __Block_byref_object_copy__17;
  __int128 v42 = __Block_byref_object_dispose__17;
  uint64_t v43 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000LL;
  uint64_t v31 = __Block_byref_object_copy__17;
  id v32 = __Block_byref_object_dispose__17;
  uint64_t v33 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v29[5])
  {
    id v13 = (void *)[MEMORY[0x189607958] defaultCenter];
    uint64_t v14 = v29[5];
    CFSetRef v48 = @"removed";
    v49[0] = v14;
    objc_msgSend( v13,  "postNotificationName:object:userInfo:",  @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1));
  }

  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke;
  v27[3] = &unk_189EA8FB8;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = a3;
  v27[7] = a5;
  v27[10] = &v38;
  v27[11] = &v34;
  v27[8] = a6;
  void v27[9] = &v28;
  v27[12] = a7;
  _perform_0((unint64_t)self, (uint64_t)v27);
  id v15 = (id)v39[5];
  if (!*((_BYTE *)v35 + 24))
  {
    uint64_t v18 = (void *)v39[5];
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
    }

    else
    {
      uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v26 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v46 = 1024;
        int v47 = 6201;
        _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  char v16 = *((_BYTE *)v35 + 24);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return v16;
}

id __131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:]( *(const char **)(a1 + 32),  *(void *)(a1 + 40),  *(void **)(a1 + 48));
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v4) {
    BOOL v5 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:]( *(void *)(a1 + 32),  v4,  (void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL));
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
  [v3 drain];
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
  if (!v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8LL);
    uint64_t v10 = *(void *)(v8 + 40);
    uint64_t v9 = v8 + 40;
    if (!v10)
    {
      if (v2)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v2 _rekeyPersistentStoreAtURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56) withKey:*(void *)(a1 + 64) error:v9];
      }

      else if (*(void *)(a1 + 96))
      {
        uint64_t v12 = (void *)MEMORY[0x189607870];
        uint64_t v13 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  *(void *)(a1 + 48),  *MEMORY[0x189607760],  0);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v12 errorWithDomain:*MEMORY[0x189607460] code:134000 userInfo:v13];
      }
    }
  }

  return *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
}

- (id)persistentStoreForIdentifier:(id)a3
{
  id v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  uint64_t v5 = [v4 count];
  if (v5 < 1)
  {
LABEL_5:
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0LL;
    while (1)
    {
      uint64_t v8 = (void *)[v4 objectAtIndex:v7];
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke;
  v5[3] = &unk_189EA8FE0;
  void v5[5] = self;
  void v5[6] = &v6;
  v5[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((unint64_t)self, (uint64_t)v5);
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a2);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        }

        uint64_t v6 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  if (v4) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:]( *(_NSQueryGenerationToken **)(a1 + 40),  v10);
}

- (id)_reopenQueryGenerationWithIdentifier:(uint64_t)a3 inStoreWithIdentifier:(void *)a4 error:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  uint64_t v20 = __Block_byref_object_copy__17;
  uint64_t v21 = __Block_byref_object_dispose__17;
  uint64_t v22 = 0LL;
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  __int128 v14 = __Block_byref_object_copy__17;
  id v15 = __Block_byref_object_dispose__17;
  uint64_t v16 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  void v10[2] = __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke;
  v10[3] = &unk_189EA9008;
  v10[4] = a3;
  v10[5] = a2;
  v10[6] = &v17;
  v10[7] = &v11;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:](a1, (uint64_t)v10);
  uint64_t v5 = v12;
  uint64_t v6 = (void *)v12[5];
  if (v6)
  {
    if (a4)
    {
      *a4 = v6;
      uint64_t v6 = (void *)v5[5];
    }

    id v7 = v6;
  }

  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke( void *a1,  void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_msgSend((id)objc_msgSend(v8, "identifier"), "isEqual:", a1[4]))
        {
          *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[v8 reopenQueryGenerationWithIdentifier:a1[5] error:*(void *)(a1[7] + 8) + 40];
          uint64_t v9 = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
          if (v9) {
            id v10 = v9;
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = result;
    }

    while (result);
  }

  return result;
}

- (BOOL)_validateQueryGeneration:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (+[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken") == a3 || +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken") == a3)
  {
    return 1;
  }

  BOOL v7 = 1;
  if (+[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") != a3)
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    char v29 = 1;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3052000000LL;
    uint64_t v23 = __Block_byref_object_copy__17;
    uint64_t v24 = __Block_byref_object_dispose__17;
    uint64_t v25 = 0LL;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke;
    v19[3] = &unk_189EA9030;
    v19[4] = a3;
    v19[5] = &v20;
    v19[6] = &v26;
    -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((unint64_t)self, (uint64_t)v19);
    if (!*((_BYTE *)v27 + 24))
    {
      id v8 = (void *)v21[5];
      if (v8)
      {
        if (a4) {
          *a4 = v8;
        }
      }

      else
      {
        uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
        uint64_t v16 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
          __int16 v32 = 1024;
          int v33 = 6340;
          _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }

      id v17 = (id)v21[5];
      BOOL v7 = *((_BYTE *)v27 + 24) != 0;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

id __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke( uint64_t a1,  void *a2)
{
  id result = (id)objc_msgSend( -[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:]( *(_WORD **)(a1 + 32),  a2,  (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)),  "count");
  if (!result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      id result = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03AE0];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    return *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }
  return result;
}

- (BOOL)_refreshTriggerValuesInStore:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = __Block_byref_object_copy__17;
  uint64_t v27 = __Block_byref_object_dispose__17;
  uint64_t v28 = 0LL;
  BOOL v7 = (NSPersistentStoreCoordinator *)[a3 _persistentStoreCoordinator];
  if (v7 != self)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Provided persistent store must be from this coordinator: %@\n%@\n%@", self, v7, a3];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v20 userInfo:0]);
    goto LABEL_12;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Provided persistent store must be of type NSSQLiteStoreType: %@", a3];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v21 userInfo:0]);
LABEL_12:
    __break(1u);
  }

  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke;
  v22[3] = &unk_189EA9058;
  v22[4] = a3;
  v22[5] = &v29;
  v22[6] = &v23;
  -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v22);
  id v8 = (id)v24[5];
  if (!*((_BYTE *)v30 + 24))
  {
    uint64_t v11 = (void *)v24[5];
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
    }

    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v35 = 1024;
        int v36 = 6379;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  char v9 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v9;
}

id __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke( uint64_t *a1)
{
  *(_BYTE *)(*(void *)(a1[5] + 8) + 24LL) = v2;
  return *(id *)(*(void *)(a1[6] + 8) + 40LL);
}

+ (BOOL)removePersistentHistoryFromPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1895F89C0];
  if ([a3 isFileURL])
  {
    objc_opt_class();
    objc_opt_class();
    id v8 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v24 = 0LL;
    char v9 = (char *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  a3);
    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        char v10 = [v9 dropPersistentHistoryforPersistentStoreWithURL:a3 options:a4 error:&v24];
        goto LABEL_15;
      }

      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v27 = *MEMORY[0x1896074F8];
      if (objc_msgSend(a3, "path", v24)) {
        uint64_t v14 = [a3 path];
      }
      else {
        uint64_t v14 = [MEMORY[0x189603FE8] null];
      }
      uint64_t v28 = v14;
      uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v16 = (void *)[v13 errorWithDomain:*MEMORY[0x189607460] code:134091 userInfo:v15];
    }

    else
    {
      if (!a5) {
        goto LABEL_18;
      }
      uint64_t v11 = (void *)MEMORY[0x189607870];
      if (objc_msgSend(a3, "path", v24, *MEMORY[0x1896074F8])) {
        uint64_t v12 = [a3 path];
      }
      else {
        uint64_t v12 = [MEMORY[0x189603FE8] null];
      }
      uint64_t v26 = v12;
      uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v16 = (void *)[v11 errorWithDomain:*MEMORY[0x189607460] code:4 userInfo:v17];
    }

    char v10 = 0;
    id v24 = v16;
LABEL_15:
    if (!a5 || (v10 & 1) != 0)
    {
LABEL_19:
      objc_msgSend(v8, "drain", v24);
      if (a5) {
        char v19 = v10;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0) {
        *a5 = v24;
      }
      return v10;
    }

    id v18 = v24;
LABEL_18:
    char v10 = 0;
    goto LABEL_19;
  }

  uint64_t v21 = (void *)MEMORY[0x189603F70];
  uint64_t v29 = *MEMORY[0x1896074F8];
  if ([a3 path]) {
    uint64_t v22 = [a3 path];
  }
  else {
    uint64_t v22 = [MEMORY[0x189603FE8] null];
  }
  v30[0] = v22;
  uint64_t v23 = [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  objc_exception_throw((id)[v21 exceptionWithName:*MEMORY[0x189603A60] reason:@"Invalid store URL" userInfo:v23]);
  __break(1u);
  return result;
}

- (void)_setXPCBundleIdentifier:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(void *)(a1 + 80) = [a2 copy];
    os_unfair_lock_unlock(v4);
  }

- (void)_setXPCProcessName:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(void *)(a1 + 88) = [a2 copy];
    os_unfair_lock_unlock(v4);
  }

- (os_unfair_lock_s)_xpcBundleIdentifier
{
  if (result)
  {
    uint64_t v1 = result;
    char v2 = result + 8;
    os_unfair_lock_lock_with_options();
    id v3 = *(id *)&v1[20]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }

  return result;
}

- (os_unfair_lock_s)_xpcProcessName
{
  if (result)
  {
    uint64_t v1 = result;
    char v2 = result + 8;
    os_unfair_lock_lock_with_options();
    id v3 = *(id *)&v1[22]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }

  return result;
}

id __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  char v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStores", 0);
  id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (([*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) finishDeferredLightweightMigration:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(*(void *)(a1 + 40) + 8) + 40] & 1) == 0)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
          return *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (uint64_t)_handleFaultingError:(uint64_t)a3 fromContext:
{
  if (result)
  {
    uint64_t v5 = [(id)result delegate];
    else {
      return 1LL;
    }
  }

  return result;
}

@end