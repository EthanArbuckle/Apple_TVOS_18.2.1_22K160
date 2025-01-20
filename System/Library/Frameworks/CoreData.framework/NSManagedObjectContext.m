@interface NSManagedObjectContext
+ (BOOL)accessInstanceVariablesDirectly;
+ (NSManagedObjectContext)alloc;
+ (NSManagedObjectContext)allocWithZone:(_NSZone *)a3;
+ (id)createFutureForFileAtURL:(id)a3;
+ (uint64_t)_handleError:(uint64_t *)a3 withError:;
+ (void)_mergeChangesFromRemoteContextSave:(id)a3 intoContexts:(id)a4;
+ (void)_mergeChangesFromRemoteContextSave:(void *)a3 intoContexts:(uint64_t)a4 withClientQueryGeneration:;
+ (void)initialize;
- (BOOL)_allowAncillaryEntities;
- (BOOL)_attemptCoalesceChangesForFetch;
- (BOOL)_disableDiscardEditing;
- (BOOL)_isSwiftBound;
- (BOOL)_parentObtainPermanentIDsForObjects:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)_performImmediate:(id)a3;
- (BOOL)_setChangeTrackingTokenFromToken:(id)a3 error:(id *)a4;
- (BOOL)_setQueryGenerationFromToken:(id)a3 error:(id *)a4;
- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 onObjectWithID:(id)a5 error:(id *)a6;
- (BOOL)automaticallyMergesChangesFromParent;
- (BOOL)commitEditing;
- (BOOL)commitEditingAndReturnError:(id *)a3;
- (BOOL)evictFuture:(id)a3 withError:(id *)a4;
- (BOOL)hasChanges;
- (BOOL)isEditing;
- (BOOL)obtainPermanentIDsForObjects:(NSArray *)objects error:(NSError *)error;
- (BOOL)propagatesDeletesAtEndOfEvent;
- (BOOL)retainsRegisteredObjects;
- (BOOL)save:(NSError *)error;
- (BOOL)setQueryGenerationFromToken:(NSQueryGenerationToken *)generation error:(NSError *)error;
- (BOOL)shouldDeleteInaccessibleFaults;
- (BOOL)shouldPerformSecureOperation;
- (BOOL)shouldRefreshAfterSave;
- (BOOL)trackSQLiteDatabaseStatistics;
- (BOOL)tryLock;
- (NSArray)executeFetchRequest:(NSFetchRequest *)request error:(NSError *)error;
- (NSManagedObject)existingObjectWithID:(NSManagedObjectID *)objectID error:(NSError *)error;
- (NSManagedObject)objectRegisteredForID:(NSManagedObjectID *)objectID;
- (NSManagedObject)objectWithID:(NSManagedObjectID *)objectID;
- (NSManagedObjectContext)init;
- (NSManagedObjectContext)initWithCoder:(id)a3;
- (NSManagedObjectContext)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)ct;
- (NSManagedObjectContext)parentContext;
- (NSManagedObjectContextConcurrencyType)concurrencyType;
- (NSMutableDictionary)userInfo;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSPersistentStoreResult)executeRequest:(NSPersistentStoreRequest *)request error:(NSError *)error;
- (NSQueryGenerationToken)queryGenerationToken;
- (NSSaveChangesRequest)_newSaveRequestForCurrentState;
- (NSSet)deletedObjects;
- (NSSet)insertedObjects;
- (NSSet)registeredObjects;
- (NSSet)updatedObjects;
- (NSString)name;
- (NSString)transactionAuthor;
- (NSTimeInterval)stalenessInterval;
- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError *)error;
- (NSUndoManager)undoManager;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_changeTrackingToken__;
- (id)_createStoreFetchRequestForFetchRequest:(id *)a1;
- (id)_delegate;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_orderKeysForRelationshipWithName__:(id)a3 onObjectWithID:(id)a4;
- (id)_orderedSetWithResultsFromFetchRequest:(id)a3;
- (id)_queryGenerationToken__;
- (id)_retainedCurrentQueryGeneration:(id)a3;
- (id)_retainedObjectWithID:(void *)a1 optionalHandler:(void *)a2 withInlineStorage:(uint64_t)a3;
- (id)_retainedObjectsFromRemovedStore:(id)a3;
- (id)databaseStatistics;
- (id)description;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)mergePolicy;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)performBlockWithResult:(id)a3;
- (int64x2_t)_updateDatabaseStaticsWithCacheStats:(uint64_t)a1;
- (uint64_t)_addObjectIDsInsertUpdatedByDATriggers:(uint64_t)result;
- (uint64_t)_addObjectIDsUpdatedByDATriggers:(uint64_t)result;
- (uint64_t)_addObjectIDsUpdatedByTriggers:(uint64_t)result;
- (uint64_t)_batchRetainedObjects:(uint64_t)a1 forCount:(uint64_t)a2 withIDs:(uint64_t)a3 optionalHandler:(id *)a4 withInlineStorage:(uint64_t)a5;
- (uint64_t)_changeIDsForManagedObjects:(void *)a3 toIDs:;
- (uint64_t)_checkObjectForExistenceAndCacheRow:(uint64_t)a1;
- (uint64_t)_clearDeletions;
- (uint64_t)_clearInsertions;
- (uint64_t)_clearUnprocessedDeletions;
- (uint64_t)_clearUnprocessedInsertions;
- (uint64_t)_clearUnprocessedUpdates;
- (uint64_t)_clearUpdates;
- (uint64_t)_committedSnapshotForObject:(uint64_t)result;
- (uint64_t)_countWithNoChangesForRequest:(id *)a3 error:;
- (uint64_t)_dispose:(uint64_t)result;
- (uint64_t)_enqueueEndOfEventNotification;
- (uint64_t)_generateOptLockExceptionForConstraintFailure:(uint64_t)result;
- (uint64_t)_handleError:(uint64_t *)a3 withError:;
- (uint64_t)_implicitObservationInfoForEntity:(void *)a3 forResultingClass:;
- (uint64_t)_initWithParentObjectStore:(void *)a1;
- (uint64_t)_mergeRefreshEpilogueForObject:(uint64_t)a3 mergeChanges:;
- (uint64_t)_mergeRefreshObject:(char)a3 mergeChanges:(NSKnownKeysDictionary *)a4 withPersistentSnapshot:;
- (uint64_t)_parentProcessSaveRequest:(uint64_t)result inContext:(void *)a2 error:;
- (uint64_t)_postContextDidSaveNotificationWithUserInfo:(uint64_t)a1;
- (uint64_t)_postObjectsDidChangeNotificationWithUserInfo:(uint64_t)result;
- (uint64_t)_processPendingDeletions:(void *)a3 withInsertions:(void *)a4 withUpdates:withNewlyForgottenList:withRemovedChangedObjects:;
- (uint64_t)_registerClearStateWithUndoManager;
- (uint64_t)_registerForNotificationsWithCoordinator:(uint64_t)result;
- (uint64_t)_registerUndoForOperation:(void *)a3 withObjects:(uint64_t)a4 withExtraArguments:;
- (uint64_t)_retainedRegisteredObjects;
- (uint64_t)_sendCommitEditingSelectorToTarget:(uint64_t)a3 sender:(uint64_t)a4 selector:(char)a5 flag:(uint64_t)a6 contextInfo:(int)a7 delayed:;
- (uint64_t)_setPersistentStoreCoordinator:(uint64_t)result;
- (uint64_t)_startObservingUndoManagerNotifications;
- (uint64_t)_stopObservingUndoManagerNotifications;
- (uint64_t)_validateObjects:(int)a3 forOperation:(uint64_t *)a4 error:(int)a5 exhaustive:(int)a6 forSave:;
- (uint64_t)lockObjectStore;
- (uint64_t)unlockObjectStore;
- (unsigned)_setParentContext:(unsigned __int8 *)result;
- (void)_PFAutoreleasePoolReferenceQueueTrampoline;
- (void)_advanceQueryGenerationForSave;
- (void)_automaticallyMergeChangesFromContextDidSaveNotification:(id)a3;
- (void)_clearChangedThisTransaction:(id)a3;
- (void)_clearOriginalSnapshotAndInitializeRec:(void *)result;
- (void)_copyChildObject:(uint64_t)a1 toParentObject:(_BYTE *)a2 fromChildContext:(void *)a3;
- (void)_coreMergeChangesFromDidSaveDictionary:(int)a3 usingObjectIDs:(uint64_t)a4 withClientQueryGeneration:;
- (void)_countForFetchRequest_:(id *)a3 error:;
- (void)_createAndPostChangeNotification:(void *)a3 deletions:(void *)a4 updates:(void *)a5 refreshes:(void *)a6 deferrals:(int)a7 wasMerge:;
- (void)_dealloc__;
- (void)_didSaveChanges;
- (void)_establishEventSnapshotsForObject:(uint64_t)a1;
- (void)_forceInsertionForObject:(id)a3;
- (void)_forceMoveInsertToUpdatedList:(uint64_t)a1;
- (void)_forceRegisterLostFault:(uint64_t)a1;
- (void)_forgetObject:(id)a3 propagateToObjectStore:(BOOL)a4 removeFromRegistry:(BOOL)a5;
- (void)_informParentStoreNoLongerInterestedInObjectIDs:(uint64_t)a3 generation:;
- (void)_insertObjectWithGlobalID:(void *)a3 globalID:;
- (void)_managedObjectContextEditor:(id)a3 didCommit:(BOOL)a4 contextInfo:(id *)a5;
- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4;
- (void)_mergeChangesFromRemoteContextSave:(id)a3;
- (void)_mergeChangesFromRemoteContextSave:(id)a3 presupposingQueryGeneration:(id)a4;
- (void)_newUnchangedLockedObjects;
- (void)_persistentStoreDidUpdateAdditionalRows:(void *)a1;
- (void)_postRefreshedObjectsNotificationAndClearList;
- (void)_prepareForPushChanges:(uint64_t)a1;
- (void)_prepareUnprocessedDeletionAfterRefresh:(_DWORD *)a1;
- (void)_processChangedStoreConfigurationNotification:(id)a3;
- (void)_processPendingInsertions:(id *)a1 withDeletions:(void *)a2 withUpdates:(void *)a3;
- (void)_processPendingUpdates:(uint64_t)a1;
- (void)_processRecentChanges:(uint64_t)a1;
- (void)_processRecentlyForgottenObjects:(void *)a1;
- (void)_processReferenceQueue:(uint64_t)a1;
- (void)_refaultObject:(id *)a1 globalID:(uint64_t)a2 BOOLean:(int)a3;
- (void)_registerAsyncReferenceCallback;
- (void)_registerObject:(void *)a3 withID:;
- (void)_resetAllChanges;
- (void)_setAllowAncillaryEntities:(BOOL)a3;
- (void)_setAllowsExpandedUserInfoKeys:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDisableDiscardEditing:(BOOL)a3;
- (void)_setFaultingError:(id)a3;
- (void)_setRetainsRegisteredObjects:(uint64_t)a1;
- (void)_setUndoManager:(uint64_t)a1;
- (void)_stopConflictDetectionForObject:(id)a3;
- (void)_storeConfigurationChanged:(id)a3;
- (void)_thereIsNoSadnessLikeTheDeathOfOptimism;
- (void)_undoDeletions:(id)a3;
- (void)_undoDeletionsMovedToUpdates:(id)a3;
- (void)_undoInsertions:(id)a3;
- (void)_undoManagerCheckpoint:(id)a3;
- (void)_undoUpdates:(id)a3;
- (void)_unlimitRequest:(void *)a1;
- (void)assignObject:(id)object toPersistentStore:(NSPersistentStore *)store;
- (void)commitEditingWithDelegate:(id)a3 didCommitSelector:(SEL)a4 contextInfo:(void *)a5;
- (void)dealloc;
- (void)deleteObject:(NSManagedObject *)object;
- (void)detectConflictsForObject:(NSManagedObject *)object;
- (void)discardEditing;
- (void)encodeWithCoder:(id)a3;
- (void)insertObject:(NSManagedObject *)object;
- (void)lock;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)mergeChangesFromContextDidSaveNotification:(NSNotification *)notification;
- (void)objectDidBeginEditing:(id)a3;
- (void)objectDidEndEditing:(id)a3;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
- (void)performBlock:(void *)block;
- (void)performBlockAndWait:(void *)block;
- (void)performWithOptions:(unint64_t)a3 andBlock:(id)a4;
- (void)processPendingChanges;
- (void)redo;
- (void)refreshAllObjects;
- (void)refreshObject:(NSManagedObject *)object mergeChanges:(BOOL)flag;
- (void)reset;
- (void)rollback;
- (void)setAutomaticallyMergesChangesFromParent:(BOOL)automaticallyMergesChangesFromParent;
- (void)setMergePolicy:(id)mergePolicy;
- (void)setName:(NSString *)name;
- (void)setParentContext:(NSManagedObjectContext *)parentContext;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (void)setPropagatesDeletesAtEndOfEvent:(BOOL)propagatesDeletesAtEndOfEvent;
- (void)setRetainsRegisteredObjects:(BOOL)retainsRegisteredObjects;
- (void)setShouldDeleteInaccessibleFaults:(BOOL)shouldDeleteInaccessibleFaults;
- (void)setShouldPerformSecureOperation:(BOOL)a3;
- (void)setShouldRefreshAfterSave:(BOOL)a3;
- (void)setStalenessInterval:(NSTimeInterval)stalenessInterval;
- (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3;
- (void)setTransactionAuthor:(NSString *)transactionAuthor;
- (void)setUndoManager:(NSUndoManager *)undoManager;
- (void)set_isSwiftBound:(BOOL)a3;
- (void)undo;
- (void)unlock;
@end

@implementation NSManagedObjectContext

- (void)performBlockAndWait:(void *)block
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
  }
  v4 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  context[0] = block;
  context[1] = self;
  uint64_t v14 = 0LL;
  v15 = v4;
  if (byte_18C4ABA02) {
    uint64_t v14 = 4LL;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
  if ((v5 & 1) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_26:
      developerSubmittedBlockToNSManagedObjectContextPerform(context);
      return;
    }
  }

  else if (v4)
  {
    unint64_t v6 = 0LL;
    int v7 = 0;
    unint64_t v8 = (unint64_t)v4;
    while ((NSManagedObjectContext *)v8 != self)
    {
      if (v8 == v6) {
        goto LABEL_16;
      }
      if (!v6) {
        unint64_t v6 = v8;
      }
      unint64_t v8 = atomic_load((unint64_t *)(v8 + 8));
      if (!v8) {
        goto LABEL_17;
      }
    }

    int v7 = 1;
LABEL_16:
    if (v7) {
      goto LABEL_26;
    }
LABEL_17:
    v9 = 0LL;
    int v10 = 0;
    v11 = self;
    while (v11 != v4)
    {
      if (v11 == v9) {
        goto LABEL_25;
      }
      if (!v9) {
        v9 = v11;
      }
      v11 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v11->_queueOwner);
      if (!v11) {
        goto LABEL_27;
      }
    }

    int v10 = 1;
LABEL_25:
    if (v10) {
      goto LABEL_26;
    }
  }

- (BOOL)retainsRegisteredObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (NSArray)executeFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  unint64_t v6 = a2;
  uint64_t v169 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v160 = 0LL;
  if (!request)
  {
    request = (NSFetchRequest *)@"<null>";
    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:
    v34 = (char *)MEMORY[0x189603F70];
    uint64_t v35 = *MEMORY[0x189603A60];
    uint64_t v36 = [NSString stringWithFormat:@"%@ %@ is not a valid NSFetchRequest.", NSStringFromSelector(v6), request];
    goto LABEL_27;
  }

  unint64_t v8 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v8)
  {
    if (error)
    {
      v9 = v8;
      result = 0LL;
      *error = v9;
      return result;
    }

    return 0LL;
  }

  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  -[NSFetchRequest _resolveEntityWithContext:](request, "_resolveEntityWithContext:", self);
  if (!-[NSFetchRequest entity](request, "entity")) {
    goto LABEL_29;
  }
  v11 = -[NSPersistentStoreCoordinator managedObjectModel]( -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "managedObjectModel");
  if (v11 != -[NSEntityDescription managedObjectModel]( -[NSFetchRequest entity](request, "entity"),  "managedObjectModel")
    && !-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
  {
    uint64_t v12 = (void *)NSString;
    v118 = -[NSFetchRequest entity](request, "entity");
    -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name");
    uint64_t v13 = [v12 stringWithFormat:@"The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's"];
    id v14 = -[NSDictionary objectForKey:]( -[NSManagedObjectModel entitiesByName]( -[NSPersistentStoreCoordinator managedObjectModel]( -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name"));
    if (!v14)
    {
      unint64_t v6 = (const char *)MEMORY[0x189603F70];
      uint64_t v40 = *MEMORY[0x189603A60];
      uint64_t v37 = [NSString stringWithFormat:@"The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's", -[NSFetchRequest entity](request, "entity"), -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name")];
      v38 = (char *)v6;
      for (uint64_t i = v40; ; uint64_t i = v35)
      {
        objc_exception_throw((id)[v38 exceptionWithName:i reason:v37 userInfo:0]);
LABEL_29:
        v34 = (char *)MEMORY[0x189603F70];
        uint64_t v35 = *MEMORY[0x189603A60];
        uint64_t v36 = [NSString stringWithFormat:@"%@ A fetch request must have an entity.", NSStringFromSelector(v6), v119];
LABEL_27:
        uint64_t v37 = v36;
        v38 = v34;
      }
    }

    id v21 = v14;
    _NSCoreDataLog(1LL, v13, v15, v16, v17, v18, v19, v20, (uint64_t)v118);
    request = (NSFetchRequest *)(id)-[NSFetchRequest copy](request, "copy");
    -[NSFetchRequest setEntity:](request, "setEntity:", v21);
  }

  -[NSFetchRequest allowEvaluation](request, "allowEvaluation");
  NSFetchRequestResultType v22 = -[NSFetchRequest resultType](request, "resultType");
  if (v22 == 4)
  {
    NSUInteger v23 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", request, error);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = [MEMORY[0x189607968] numberWithUnsignedInteger:v23];
      return (NSArray *)[MEMORY[0x189603F18] arrayWithObject:v24];
    }

    return 0LL;
  }

  NSFetchRequestResultType v25 = v22;
  id v26 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (v25 != 2
    && -[NSFetchRequest includesPendingChanges](request, "includesPendingChanges")
    && -[NSManagedObjectContext hasChanges](self, "hasChanges"))
  {
    if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((BOOL)self)) {
      -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0LL);
    }
    int v27 = 1;
  }

  else
  {
    int v27 = 0;
  }

  v125 = request;
  v28 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, request);
  uint64_t v129 = [v28 resultType];
  int v29 = [v28 includesPropertyValues];
  -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
  v126 = self;
  int v124 = v29;
  v30 = (void *)[self->_parentObjectStore executeRequest:v28 withContext:self error:&v160];
  id v31 = v30;
  if (v30)
  {
    id v32 = v30;
    int v33 = 1;
  }

  else
  {
    int v33 = 0;
  }

  id v41 = v160;

  [v26 drain];
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  id v42 = v160;
  if (v160)
  {
    if (v31)
    {
      uint64_t v43 = [NSString stringWithUTF8String:"Fetching generated an error AND a result: %@"];
      _NSCoreDataLog(17LL, v43, v44, v45, v46, v47, v48, v49, (uint64_t)v160);
      v50 = (os_log_s *)__pflogFaultLog;
      BOOL v51 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      id v42 = v160;
      if (v51)
      {
        LODWORD(callBacks.version) = 138412290;
        *(CFIndex *)((char *)&callBacks.version + 4) = (CFIndex)v160;
        _os_log_fault_impl( &dword_186681000,  v50,  OS_LOG_TYPE_FAULT,  "CoreData: Fetching generated an error AND a result: %@",  (uint8_t *)&callBacks,  0xCu);
        id v42 = v160;
      }
    }

    id v52 = v42;
    if (error) {
      *error = (NSError *)v160;
    }
    return 0LL;
  }

  if (!v31)
  {
    uint64_t v53 = [NSString stringWithUTF8String:"Fetching failed to generate a result OR an error OR an exception"];
    _NSCoreDataLog(17LL, v53, v54, v55, v56, v57, v58, v59, v117);
    v60 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(callBacks.version) = 0;
      _os_log_fault_impl( &dword_186681000,  v60,  OS_LOG_TYPE_FAULT,  "CoreData: Fetching failed to generate a result OR an error OR an exception",  (uint8_t *)&callBacks,  2u);
    }
  }

  if (!v33) {
    return 0LL;
  }
  if (!v31) {
    id v31 = (id)NSArray_EmptyArray;
  }
  id v127 = v31;
  if (v27)
  {
    id v121 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v61 = -[NSFetchRequest predicate](v125, "predicate");
    v120 = -[NSFetchRequest sortDescriptors](v125, "sortDescriptors");
    v62 = -[NSFetchRequest affectedStores](v125, "affectedStores");
    v131 = -[NSFetchRequest entity](v125, "entity");
    if (-[NSDictionary count](-[NSEntityDescription subentitiesByName](v131, "subentitiesByName"), "count")) {
      BOOL v130 = -[NSFetchRequest includesSubentities](v125, "includesSubentities");
    }
    else {
      BOOL v130 = 0;
    }
    if (v61) {
      id v128 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v61,  0LL);
    }
    else {
      id v128 = (id)[MEMORY[0x1896079C8] predicateWithValue:1];
    }
    if (-[NSArray count](v62, "count")) {
      v63 = v62;
    }
    else {
      v63 = 0LL;
    }
    CFIndex v64 = *MEMORY[0x189605258];
    *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    v65 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    callBacks.versiouint64_t n = v64;
    callBacks.copyDescriptiouint64_t n = v65;
    callBacks.equal = 0LL;
    callBacks.hash = 0LL;
    uint64_t v66 = -[NSMutableSet count](self->_unprocessedChanges, "count");
    changedObjects = (__CFSet *)self->_changedObjects;
    if (v66)
    {
      if (-[NSMutableSet count](self->_changedObjects, "count"))
      {
        changedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
        __int128 v158 = 0u;
        __int128 v159 = 0u;
        __int128 v156 = 0u;
        __int128 v157 = 0u;
        unprocessedChanges = self->_unprocessedChanges;
        uint64_t v69 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unprocessedChanges,  "countByEnumeratingWithState:objects:count:",  &v156,  v167,  16LL);
        if (v69)
        {
          uint64_t v70 = *(void *)v157;
          do
          {
            for (uint64_t j = 0LL; j != v69; ++j)
            {
              if (*(void *)v157 != v70) {
                objc_enumerationMutation(unprocessedChanges);
              }
              CFSetAddValue(changedObjects, *(const void **)(*((void *)&v156 + 1) + 8 * j));
            }

            uint64_t v69 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unprocessedChanges,  "countByEnumeratingWithState:objects:count:",  &v156,  v167,  16LL);
          }

          while (v69);
        }

        __int128 v154 = 0u;
        __int128 v155 = 0u;
        __int128 v152 = 0u;
        __int128 v153 = 0u;
        v72 = self->_changedObjects;
        uint64_t v73 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v72,  "countByEnumeratingWithState:objects:count:",  &v152,  v166,  16LL);
        if (v73)
        {
          uint64_t v74 = *(void *)v153;
          do
          {
            for (uint64_t k = 0LL; k != v73; ++k)
            {
              if (*(void *)v153 != v74) {
                objc_enumerationMutation(v72);
              }
              CFSetAddValue(changedObjects, *(const void **)(*((void *)&v152 + 1) + 8 * k));
            }

            uint64_t v73 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v72,  "countByEnumeratingWithState:objects:count:",  &v152,  v166,  16LL);
          }

          while (v73);
        }

        int v122 = 1;
      }

      else
      {
        int v122 = 0;
        changedObjects = (__CFSet *)self->_unprocessedChanges;
      }
    }

    else
    {
      int v122 = 0;
    }

    __int128 v150 = 0u;
    __int128 v151 = 0u;
    __int128 v148 = 0u;
    __int128 v149 = 0u;
    v76 = 0LL;
    uint64_t v77 = -[__CFSet countByEnumeratingWithState:objects:count:]( changedObjects,  "countByEnumeratingWithState:objects:count:",  &v148,  v165,  16LL);
    if (v77)
    {
      uint64_t v78 = *(void *)v149;
      do
      {
        for (uint64_t m = 0LL; m != v77; ++m)
        {
          if (*(void *)v149 != v78) {
            objc_enumerationMutation(changedObjects);
          }
          v80 = *(void **)(*((void *)&v148 + 1) + 8 * m);
          v81 = (void *)[v80 objectID];
          v82 = v81;
          if (!v63
            || -[NSArray indexOfObjectIdenticalTo:]( v63,  "indexOfObjectIdenticalTo:",  [v81 persistentStore]) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v83 = [v80 entity];
            if ((NSEntityDescription *)v83 == v131
              || v130 && -[NSEntityDescription _subentitiesIncludes:](v131, "_subentitiesIncludes:", v83))
            {
              if (!v76) {
                v76 = (void *)[MEMORY[0x189603FE0] setWithArray:v127];
              }
              v84 = (void *)MEMORY[0x186E3E5D8]();
              int v85 = [v128 evaluateWithObject:v80];
              if (v129) {
                v86 = v82;
              }
              else {
                v86 = v80;
              }
              if (v85) {
                [v76 addObject:v86];
              }
              else {
                [v76 removeObject:v86];
              }
              objc_autoreleasePoolPop(v84);
            }
          }
        }

        uint64_t v77 = -[__CFSet countByEnumeratingWithState:objects:count:]( changedObjects,  "countByEnumeratingWithState:objects:count:",  &v148,  v165,  16LL);
      }

      while (v77);
    }

    if (v122) {
      CFRelease(changedObjects);
    }
    uint64_t v87 = -[NSMutableSet count](v126->_unprocessedInserts, "count");
    insertedObjects = (__CFSet *)v126->_insertedObjects;
    if (v87)
    {
      if (-[NSMutableSet count](v126->_insertedObjects, "count"))
      {
        insertedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        __int128 v144 = 0u;
        __int128 v145 = 0u;
        unprocessedInserts = v126->_unprocessedInserts;
        uint64_t v90 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unprocessedInserts,  "countByEnumeratingWithState:objects:count:",  &v144,  v164,  16LL);
        if (v90)
        {
          uint64_t v91 = *(void *)v145;
          do
          {
            for (uint64_t n = 0LL; n != v90; ++n)
            {
              if (*(void *)v145 != v91) {
                objc_enumerationMutation(unprocessedInserts);
              }
              CFSetAddValue(insertedObjects, *(const void **)(*((void *)&v144 + 1) + 8 * n));
            }

            uint64_t v90 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unprocessedInserts,  "countByEnumeratingWithState:objects:count:",  &v144,  v164,  16LL);
          }

          while (v90);
        }

        __int128 v142 = 0u;
        __int128 v143 = 0u;
        __int128 v140 = 0u;
        __int128 v141 = 0u;
        v93 = v126->_insertedObjects;
        uint64_t v94 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v140,  v163,  16LL);
        if (v94)
        {
          uint64_t v95 = *(void *)v141;
          do
          {
            for (iuint64_t i = 0LL; ii != v94; ++ii)
            {
              if (*(void *)v141 != v95) {
                objc_enumerationMutation(v93);
              }
              CFSetAddValue(insertedObjects, *(const void **)(*((void *)&v140 + 1) + 8 * ii));
            }

            uint64_t v94 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v140,  v163,  16LL);
          }

          while (v94);
        }

        int v123 = 1;
      }

      else
      {
        int v123 = 0;
        insertedObjects = (__CFSet *)v126->_unprocessedInserts;
      }
    }

    else
    {
      int v123 = 0;
    }

    __int128 v138 = 0u;
    __int128 v139 = 0u;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    uint64_t v97 = -[__CFSet countByEnumeratingWithState:objects:count:]( insertedObjects,  "countByEnumeratingWithState:objects:count:",  &v136,  v162,  16LL);
    if (v97)
    {
      uint64_t v98 = *(void *)v137;
      do
      {
        for (juint64_t j = 0LL; jj != v97; ++jj)
        {
          if (*(void *)v137 != v98) {
            objc_enumerationMutation(insertedObjects);
          }
          v100 = *(void **)(*((void *)&v136 + 1) + 8 * jj);
          v101 = (void *)[v100 objectID];
          v102 = v101;
          if (v63)
          {
            uint64_t v103 = [v101 persistentStore];
            if (!v103
              || -[NSArray indexOfObjectIdenticalTo:](v63, "indexOfObjectIdenticalTo:", v103) == 0x7FFFFFFFFFFFFFFFLL)
            {
              continue;
            }
          }

          uint64_t v104 = [v100 entity];
          if ((NSEntityDescription *)v104 == v131
            || v130 && -[NSEntityDescription _subentitiesIncludes:](v131, "_subentitiesIncludes:", v104))
          {
            if (!v76) {
              v76 = (void *)[MEMORY[0x189603FE0] setWithArray:v127];
            }
            v105 = (void *)MEMORY[0x186E3E5D8]();
            if ([v128 evaluateWithObject:v100])
            {
              if (v129) {
                v106 = v102;
              }
              else {
                v106 = v100;
              }
              [v76 addObject:v106];
            }

            objc_autoreleasePoolPop(v105);
          }
        }

        uint64_t v97 = -[__CFSet countByEnumeratingWithState:objects:count:]( insertedObjects,  "countByEnumeratingWithState:objects:count:",  &v136,  v162,  16LL);
      }

      while (v97);
    }

    if (v123) {
      CFRelease(insertedObjects);
    }
    __int128 v134 = 0u;
    __int128 v135 = 0u;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    deletedObjects = v126->_deletedObjects;
    uint64_t v108 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( deletedObjects,  "countByEnumeratingWithState:objects:count:",  &v132,  v161,  16LL);
    if (v108)
    {
      uint64_t v109 = *(void *)v133;
      do
      {
        for (kuint64_t k = 0LL; kk != v108; ++kk)
        {
          if (*(void *)v133 != v109) {
            objc_enumerationMutation(deletedObjects);
          }
          v111 = *(void **)(*((void *)&v132 + 1) + 8 * kk);
          if (!v63
            || -[NSArray indexOfObjectIdenticalTo:]( v63,  "indexOfObjectIdenticalTo:",  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * kk), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v112 = [v111 entity];
            if ((NSEntityDescription *)v112 == v131
              || v130 && -[NSEntityDescription _subentitiesIncludes:](v131, "_subentitiesIncludes:", v112))
            {
              if (!v76) {
                v76 = (void *)[MEMORY[0x189603FE0] setWithArray:v127];
              }
              if (v129) {
                v111 = (void *)objc_msgSend(v111, "objectID", v112);
              }
              [v76 removeObject:v111];
            }
          }
        }

        uint64_t v108 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( deletedObjects,  "countByEnumeratingWithState:objects:count:",  &v132,  v161,  16LL);
      }

      while (v108);
    }

    if (v76)
    {
      v113 = (void *)[v76 allObjects];
      if (-[NSArray count](v120, "count")) {
        BOOL v114 = v129 != 0;
      }
      else {
        BOOL v114 = 1;
      }
      if (!v114 && ((v124 ^ 1) & 1) == 0) {
        v113 = (void *)[v113 sortedArrayUsingDescriptors:v120];
      }

      id v127 = v113;
    }

    [v121 drain];
  }

  unint64_t v115 = -[NSFetchRequest fetchLimit](v125, "fetchLimit");
  if (v115 && [v127 count] > v115)
  {
    id v116 = (id)objc_msgSend(v127, "subarrayWithRange:", 0, v115);
  }

  else
  {
    id v116 = v127;
  }

  if (v126->_dispatchQueue && !-[NSFetchRequest resultType](v125, "resultType") && [v116 count]) {
    -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)v126);
  }
  return (NSArray *)v116;
}

- (void)_PFAutoreleasePoolReferenceQueueTrampoline
{
  if (val)
  {
    if (val[3]) {
      BOOL v1 = _MergedGlobals_71 == 0;
    }
    else {
      BOOL v1 = 1;
    }
    if (!v1)
    {
      objc_initWeak(&location, val);
      v2[0] = MEMORY[0x1895F87A8];
      v2[1] = 3221225472LL;
      v2[2] = __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke;
      v2[3] = &unk_189EA8330;
      objc_copyWeak(&v3, &location);
      +[_PFAutoreleasePoolThunk thunkWithBlock:]((uint64_t)&OBJC_CLASS____PFAutoreleasePoolThunk, v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  result = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
  if ((v2 & 1) != 0) {
    return (NSPersistentStoreCoordinator *)-[NSPersistentStoreCoordinator persistentStoreCoordinator]( result,  "persistentStoreCoordinator");
  }
  return result;
}

- (BOOL)hasChanges
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)_createStoreFetchRequestForFetchRequest:(id *)a1
{
  unsigned __int8 v2 = a1;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v4 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v5 = [a2 resultType];
    if (v5 == 2) {
      int v6 = 0;
    }
    else {
      int v6 = [a2 includesPendingChanges];
    }
    uint64_t v7 = [a2 fetchLimit];
    unint64_t v8 = (void *)[a2 propertiesToFetch];
    v9 = (void *)[a2 relationshipKeyPathsForPrefetching];
    if ([v8 count])
    {
      id v10 = (id)[a2 copy];
      a2 = v10;
      if (v5 == 4 || v5 == 1)
      {
        [v10 setPropertiesToFetch:0];
        [a2 setRelationshipKeyPathsForPrefetching:0];
      }

      else if (!v5 && [v9 count])
      {
        int v39 = v6;
        uint64_t v40 = v2;
        uint64_t v41 = v7;
        id v42 = a2;
        uint64_t v43 = v4;
        v11 = (void *)objc_msgSend((id)objc_msgSend(a2, "entity"), "relationshipsByName");
        id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        uint64_t v13 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v50;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(v9);
              }
              uint64_t v17 = *(const __CFString **)(*((void *)&v49 + 1) + 8 * i);
              if (v17
                && (v56.length = CFStringGetLength(*(CFStringRef *)(*((void *)&v49 + 1) + 8 * i)),
                    v56.locatiouint64_t n = 0LL,
                    CFStringFindWithOptions(v17, @".", v56, 0LL, &result)))
              {
                v57.length = result.location;
                v57.locatiouint64_t n = 0LL;
                CFStringRef v18 = CFStringCreateWithSubstring(0LL, v17, v57);
                uint64_t v17 = v18;
              }

              else
              {
                CFStringRef v18 = 0LL;
              }

              uint64_t v19 = (void *)[v11 objectForKey:v17];
              if (v19)
              {
                uint64_t v20 = v19;
                if (([v19 _isToManyRelationship] & 1) == 0) {
                  [v12 addObject:v20];
                }
              }

              if (v18) {
                CFRelease(v18);
              }
            }

            uint64_t v14 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }

          while (v14);
        }

        a2 = v42;
        if ([v12 count])
        {
          id v21 = (void *)[MEMORY[0x189603FA8] arrayWithArray:v8];
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          uint64_t v22 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v45;
            do
            {
              for (uint64_t j = 0LL; j != v23; ++j)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                if ([v8 indexOfObjectIdenticalTo:v26] == 0x7FFFFFFFFFFFFFFFLL) {
                  [v21 addObject:v26];
                }
              }

              uint64_t v23 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }

            while (v23);
          }

          [v42 setPropertiesToFetch:v21];
        }

        v4 = v43;
        unsigned __int8 v2 = v40;
        uint64_t v7 = v41;
        int v6 = v39;
      }
    }

    if (v7) {
      int v27 = v6;
    }
    else {
      int v27 = 0;
    }
    if (v27 == 1
      && (*((_BYTE *)v2 + 41) & 4) != 0
      && (uint64_t v28 = [v2[12] count],
          uint64_t v29 = [v2[7] count] + v28,
          (uint64_t v30 = v29 + [v2[11] count]) != 0))
    {
      unsigned __int8 v2 = (id *)[a2 _copyForDirtyContext];
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v31 = (void *)objc_msgSend((id)objc_msgSend(v2, "substitutionVariables"), "mutableCopy");
        id v32 = (void *)objc_msgSend( (id)objc_msgSend(v31, "objectForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION"),  "constantValue");
        if (v32) {
          uint64_t v7 = [v32 unsignedIntegerValue];
        }
        uint64_t v33 = [MEMORY[0x189607968] numberWithUnsignedInteger:v7 + v30];
        objc_msgSend( v31,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", v33),  @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
        [v2 setSubstitutionVariables:v31];
      }

      else
      {
        [v2 setFetchLimit:v30 + v7];
      }
    }

    else if ([a2 resultType] == 2 {
           && [a2 fetchBatchSize]
    }
           && !objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count"))
    {
      id v35 = (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName"),  "allValues"),  "mutableCopy");
      [v35 sortUsingFunction:_comparePropertiesByName context:0];
      uint64_t v36 = [v35 count];
      uint64_t v37 = v36 - 1;
      if (v36 != 1)
      {
        do
        {
          --v37;
        }

        while (v37);
      }

      v38 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
      -[NSPropertyDescription setName:](v38, "setName:", @"objectID");
      -[NSExpressionDescription setExpression:]( v38,  "setExpression:",  [MEMORY[0x189607878] expressionForEvaluatedObject]);
      -[NSExpressionDescription setExpressionResultType:](v38, "setExpressionResultType:", 2000LL);
      [v35 addObject:v38];

      unsigned __int8 v2 = (id *)[a2 copy];
      [v2 setPropertiesToFetch:v35];
    }

    else
    {
      unsigned __int8 v2 = a2;
    }

    objc_autoreleasePoolPop(v4);
  }

  return v2;
}

- (uint64_t)lockObjectStore
{
  if (result && _PF_Threading_Debugging_level)
  {
    BOOL v1 = (unint64_t *)result;
    if (*(void *)(result + 24))
    {
      CFRange result = _PFAssertSafeMultiThreadedAccess_impl(result, sel_lockObjectStore);
    }

    else
    {
      CFRange result = [*(id *)(result + 136) tryLock];
      if ((result & 1) == 0)
      {
        CFRange result = objc_opt_self();
        __break(1u);
        return result;
      }
    }

    if (!v1[3])
    {
      if (atomic_load(v1 + 1))
      {
        return [*(id *)(*(void *)(v1[21] + 56) + 32) addObject:NSKeyValueCoding_NullValue];
      }

      else
      {
        CFRange result = _PF_actor_set_owner(0LL, (uint64_t)v1, v1[4]);
        if ((result & 1) == 0)
        {
          if (_PF_Threading_Debugging_level) {
            return _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v1, sel_lockObjectStore);
          }
        }
      }
    }
  }

  return result;
}

- (id)_queryGenerationToken__
{
  if (self->_parentObjectStore && (unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext), (v2 & 1) != 0)) {
    id v3 = +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken");
  }
  else {
    id v3 = (id)*((void *)self->_additionalPrivateIvars + 12);
  }
  return v3;
}

- (id)_delegate
{
  return (id)*((void *)self->_additionalPrivateIvars + 2);
}

- (uint64_t)unlockObjectStore
{
  if (result && _PF_Threading_Debugging_level)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 24)) {
      return _PFAssertSafeMultiThreadedAccess_impl(v1, sel_unlockObjectStore);
    }
    if ([*(id *)(*(void *)(*(void *)(result + 168) + 56) + 32) count])
    {
      CFRange result = [*(id *)(*(void *)(*(void *)(v1 + 168) + 56) + 32) removeLastObject];
    }

    else
    {
      CFRange result = _PF_actor_set_owner(*(void *)(v1 + 32), v1, 0LL);
      if ((result & 1) == 0)
      {
        if (_PF_Threading_Debugging_level) {
          CFRange result = _PFAssertSafeMultiThreadedAccess_impl(v1, sel_unlockObjectStore);
        }
      }
    }

    if (!*(void *)(v1 + 24)) {
      return [*(id *)(v1 + 136) unlock];
    }
    if (_PF_Threading_Debugging_level) {
      return _PFAssertSafeMultiThreadedAccess_impl(v1, sel_unlockObjectStore);
    }
  }

  return result;
}

- (void)reset
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v24 = objc_alloc_init(MEMORY[0x1896077E8]);
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  unint64_t Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  v4 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:Count];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  v23[1] = v23;
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = (const void **)((char *)v23 - v7);
  if (Count >= 0x201) {
    unint64_t v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v23 - v7, 8 * v6);
  }
  unint64_t v9 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v8);
  if (v9)
  {
    uint64_t v10 = 0LL;
    unsigned int v11 = 1;
    do
    {
      uint64_t v12 = (uint64_t)v8[v10];
      uint64_t v13 = (void *)[(id)v12 objectID];
      id v14 = (id)v12;
      int v15 = [v13 isTemporaryID];
      if (v12 && ((*(_BYTE *)(v12 + 17) & 2) == 0 ? (char v16 = 1) : (char v16 = v15), (v16 & 1) == 0))
      {
        [v4 addObject:v13];
        *(_DWORD *)(v12 + 16) &= ~0x200u;
      }

      else if (v15)
      {
        [v5 addObject:v13];
      }

      if (v12) {
        uint64_t v17 = _insertion_fault_handler;
      }
      else {
        uint64_t v17 = 0LL;
      }
      -[NSFaultHandler turnObject:intoFaultWithContext:](v17, v12, (uint64_t)self);
      -[NSManagedObjectContext _forgetObject:propagateToObjectStore:removeFromRegistry:]( self,  "_forgetObject:propagateToObjectStore:removeFromRegistry:",  v12,  0LL,  0LL);

      uint64_t v10 = v11;
    }

    while (v9 > v11++);
  }

  if (Count >= 0x201) {
    NSZoneFree(0LL, v8);
  }
  _PFCMT_RemoveAllValues(&self->_infoByGID->super.isa);
  -[NSManagedObjectContext _resetAllChanges](self);
  if ([v4 count])
  {
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    objc_msgSend( self->_parentObjectStore,  "managedObjectContextDidUnregisterObjectsWithIDs:generation:",  v4,  -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  }

  if ([v5 count])
  {
    [v5 addObjectsFromArray:v4];
  }

  else
  {

    id v5 = v4;
  }

  if (byte_18C4ABDBE) {
    uint64_t v19 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v5,  @"invalidatedAll",  +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self),  @"managedObjectContext",  0);
  }
  else {
    uint64_t v19 = (void *)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", v5, @"invalidatedAll", 0);
  }
  -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v19);
  additionalPrivateIvars = self->_additionalPrivateIvars;
  id v21 = (id *)additionalPrivateIvars[1];
  if (v21)
  {

    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars[1]);
    *((void *)self->_additionalPrivateIvars + 1) = 0LL;
    additionalPrivateIvars = self->_additionalPrivateIvars;
  }

  *self->_additionalPrivateIvars = 0LL;
  *((void *)self->_additionalPrivateIvars + 17) = 0LL;

  *((void *)self->_additionalPrivateIvars + 18) = 0LL;
  *((void *)self->_additionalPrivateIvars + 14) = 0LL;

  *((void *)self->_additionalPrivateIvars + 19) = 0LL;
  if (objc_msgSend( (id)-[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"),  "_isEnabled")) {
    -[NSManagedObjectContext _setQueryGenerationFromToken:error:]( self,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken"),  0LL);
  }

  [v24 drain];
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
  id v22 = 0LL;
}

- (void)discardEditing
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL);
    id v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }

  if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
  {
    if (-[NSManagedObjectContext isEditing](self, "isEditing"))
    {
      CFIndex Count = CFArrayGetCount(v3);
      CFIndex v5 = Count - 1;
      if (Count >= 1)
      {
        do
          objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5--), "discardEditing");
        while (v5 != -1);
      }
    }
  }

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_resetAllChanges
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    -[NSManagedObjectContext _clearUnprocessedUpdates]((uint64_t)result);
    -[NSManagedObjectContext _clearUpdates](v1);
    -[NSManagedObjectContext _clearUnprocessedInsertions](v1);
    -[NSManagedObjectContext _clearInsertions](v1);
    -[NSManagedObjectContext _clearUnprocessedDeletions](v1);
    -[NSManagedObjectContext _clearDeletions](v1);
    [*(id *)(v1 + 104) removeAllObjects];
    [*(id *)(v1 + 112) removeAllObjects];
    CFRange result = *(void **)(*(void *)(v1 + 168) + 40LL);
    if (result)
    {
      CFRange result = (void *)[result isUndoRegistrationEnabled];
      if ((_DWORD)result) {
        CFRange result = (void *)[*(id *)(*(void *)(v1 + 168) + 40) removeAllActions];
      }
    }

    ++*(_WORD *)(v1 + 44);
    int v2 = *(_DWORD *)(v1 + 40);
    *(_DWORD *)(v1 + 40) = v2 & 0xFFFFFCDF;
    if ((v2 & 0x400) != 0)
    {
      [(id)v1 willChangeValueForKey:@"hasChanges"];
      *(_DWORD *)(v1 + 40) &= ~0x400u;
      return (void *)[(id)v1 didChangeValueForKey:@"hasChanges"];
    }
  }

  return result;
}

- (uint64_t)_clearUnprocessedUpdates
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 56) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 56) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 56) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 56) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~1u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 56) removeAllObjects];
}

- (uint64_t)_clearUpdates
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 96) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 96) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 96) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 96) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~8u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 96) removeAllObjects];
}

- (uint64_t)_clearUnprocessedInsertions
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 72) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 72) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 72) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 72) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~2u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 72) removeAllObjects];
}

- (uint64_t)_clearInsertions
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 80) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 80) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 80) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 80) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~0x10u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 80) removeAllObjects];
}

- (uint64_t)_clearUnprocessedDeletions
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 64) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 64) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 64) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 64) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~4u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 64) removeAllObjects];
}

- (uint64_t)_clearDeletions
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = [*(id *)(a1 + 88) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 88) getObjects:v6];
  }

  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    [*(id *)(a1 + 88) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 88) removeAllObjects];
    }
  }

  uint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~0x20u;
    }
    ++v7;
  }

  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return [*(id *)(a1 + 88) removeAllObjects];
}

- (uint64_t)_postObjectsDidChangeNotificationWithUserInfo:(uint64_t)result
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[a2 mutableCopy];
    if (byte_18C4ABDBE) {
      objc_msgSend( v4,  "setObject:forKey:",  +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, v3),  @"managedObjectContext");
    }
    for (uint64_t i = 0LL; i != 4; ++i)
    {
      uint64_t v6 = (void *)[a2 objectForKey:off_189EA8490[i]];
      if ([v6 count])
      {
        uint64_t v7 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v6);
        [v4 setObject:v7 forKey:off_189EA84B0[i]];
      }
    }

    id v8 = (id)[v4 copy];

    unint64_t v9 = (void *)[a2 mutableCopy];
    [v9 removeObjectForKey:@"refreshed_objectIDs"];
    id v10 = (id)[v9 copy];

    unsigned int v11 = (void *)[MEMORY[0x189607958] defaultCenter];
    [v11 postNotificationName:@"_NSObjectsChangedInManagingContextPrivateNotification" object:v3 userInfo:v8];
    [v11 postNotificationName:@"NSObjectsChangedInManagingContextNotification" object:v3 userInfo:v10];
    CFRange result = +[NSManagedObject instancesRespondToSelector:]( &OBJC_CLASS___NSManagedObject,  "instancesRespondToSelector:",  sel__willChange_Swift_Trampoline);
    if ((_DWORD)result)
    {
      for (uint64_t j = 0LL; j != 4; ++j)
      {
        uint64_t v13 = (void *)[a2 objectForKey:off_189EA8490[j]];
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            for (uint64_t k = 0LL; k != v15; ++k)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              CFStringRef v18 = *(void **)(*((void *)&v28 + 1) + 8 * k);
              if ([v18 bindableObjectPublisher]) {
                objc_msgSend(v18, "_willChange_Swift_Trampoline");
              }
            }

            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }

          while (v15);
        }
      }

      uint64_t v19 = (void *)[a2 objectForKey:@"refreshed"];
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      CFRange result = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (result)
      {
        uint64_t v20 = result;
        uint64_t v21 = *(void *)v25;
        do
        {
          uint64_t v22 = 0LL;
          do
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void **)(*((void *)&v24 + 1) + 8 * v22);
            if ([v23 bindableObjectPublisher]) {
              objc_msgSend(v23, "_willChange_Swift_Trampoline");
            }
            ++v22;
          }

          while (v20 != v22);
          CFRange result = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
          uint64_t v20 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (void)_processReferenceQueue:(uint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level && (a2 & 1) == 0)
    {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processReferenceQueue_);
      if ((a2 & 1) != 0) {
        goto LABEL_6;
      }
    }

    else if ((a2 & 1) != 0)
    {
LABEL_6:
      -[_PFManagedObjectReferenceQueue _processReferenceQueue:](*(void *)(a1 + 152), a2);
      return;
    }

    if ((*(_BYTE *)(a1 + 42) & 4) == 0) {
      goto LABEL_6;
    }
  }

void __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = (uint64_t)Weak;
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)Weak, sel_processPendingChanges);
    }
    -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
  }

- (void)_registerAsyncReferenceCallback
{
  if (a1)
  {
    if (_PF_shouldAsyncProcessReferenceQueue)
    {
      if (*(void *)(a1 + 24))
      {
        if (!*(_DWORD *)(a1 + 16) && ([(id)a1 _isDeallocating] & 1) == 0)
        {
          uint64_t v2 = (unsigned __int8 *)(a1 + 51);
          do
            int v3 = __ldaxr(v2);
          while (__stlxr(v3 + 1, v2));
          if (!v3)
          {
            uint64_t v4 = *(const void **)(a1 + 152);
            if (v4)
            {
              uint64_t v5 = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  a1);
              if (v5)
              {
                uint64_t v6 = v5;
                CFRetain(v4);
                v7[0] = MEMORY[0x1895F87A8];
                v7[1] = 3221225472LL;
                v7[2] = __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke;
                v7[3] = &unk_189EA86D8;
                v7[4] = v6;
                v7[5] = v4;
                [(id)a1 performWithOptions:24577 andBlock:v7];
              }
            }
          }
        }
      }
    }
  }

- (void)performWithOptions:(unint64_t)a3 andBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!self || self->_wasDisposed || -[NSManagedObjectContext _isDeallocating](self, "_isDeallocating"))
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x189607A40], "callStackSymbols", a3, a4);
    _NSCoreDataLog( 1LL,  (uint64_t)@"illegally invoked -performWithOptions* on dying NSManagedObjectContext at:\n\t%@",  v20,  v21,  v22,  v23,  v24,  v25,  v19);
    __break(1u);
  }

  if (!self->_dispatchQueue)
  {
    if ((a3 & 0x8000) != 0)
    {
      (*((void (**)(id))a4 + 2))(a4);
      return;
    }

    if ((a3 & 0x4000) != 0) {
      return;
    }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"-performWithOptions:andBlock: was called on a MOC of NSConfinementConcurrencyType unexpectedly." userInfo:0]);
LABEL_19:
    uint64_t v12 = malloc(0x20uLL);
    *uint64_t v12 = _Block_copy(a4);
    if ((a3 & 0x1000) != 0) {
      CFTypeRef v13 = 0LL;
    }
    else {
      CFTypeRef v13 = CFRetain(self);
    }
    v12[1] = v13;
    v12[2] = a3 | 0x2001;
    v12[3] = 0LL;
    dispatch_async_f( (dispatch_queue_t)self->_dispatchQueue,  v12,  (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    return;
  }

  if ((a3 & 1) != 0) {
    goto LABEL_19;
  }
  uint64_t v7 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
  if ((v8 & 1) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_36:
      if ((a3 & 0x1000) == 0) {
        uint64_t v17 = self;
      }
      id context = a4;
      __int128 v27 = self;
      unint64_t v28 = a3;
      __int128 v29 = v7;
      developerSubmittedBlockToNSManagedObjectContextPerform(&context);
      return;
    }
  }

  else if (v7)
  {
    unint64_t v9 = 0LL;
    int v10 = 0;
    unint64_t v11 = (unint64_t)v7;
    while ((NSManagedObjectContext *)v11 != self)
    {
      if (v11 == v9) {
        goto LABEL_26;
      }
      if (!v9) {
        unint64_t v9 = v11;
      }
      unint64_t v11 = atomic_load((unint64_t *)(v11 + 8));
      if (!v11) {
        goto LABEL_27;
      }
    }

    int v10 = 1;
LABEL_26:
    if (v10) {
      goto LABEL_36;
    }
LABEL_27:
    uint64_t v14 = 0LL;
    int v15 = 0;
    uint64_t v16 = self;
    while (v16 != v7)
    {
      if (v16 == v14) {
        goto LABEL_35;
      }
      if (!v14) {
        uint64_t v14 = v16;
      }
      uint64_t v16 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v16->_queueOwner);
      if (!v16) {
        goto LABEL_39;
      }
    }

    int v15 = 1;
LABEL_35:
    if (v15) {
      goto LABEL_36;
    }
  }

- (id)_retainedObjectWithID:(void *)a1 optionalHandler:(void *)a2 withInlineStorage:(uint64_t)a3
{
  if (!a1) {
    return 0LL;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a1, sel__retainedObjectWithID_optionalHandler_withInlineStorage_);
  }
  Value = (void *)_PFCMT_GetValue(a1[15], a2);
  if (Value) {
    return Value;
  }
  unsigned __int8 v8 = (unint64_t *)[a2 entity];
  unint64_t v9 = (void *)[_PFFastEntityClass(v8) allocWithEntity:v8];
  _PFfastOidRetain(0, (unint64_t)a2);
  int v10 = (void *)[v9 _initWithEntity:v8 withID:a2 withHandler:a3 withContext:a1];
  -[NSManagedObjectContext _registerObject:withID:]((uint64_t)a1, (uint64_t)v10, a2);
  unint64_t v11 = (void *)*a1[21];
  if (v11 && [v11 containsObject:a2])
  {
    if (![v10 managedObjectContext]) {
      -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)a1, v10);
    }
    [a1 deleteObject:v10];
  }

  return v10;
}

- (void)_registerObject:(void *)a3 withID:
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v6 = *(void *)(a2 + 32);
      if (v6)
      {
        if (v6 != a1)
        {
          uint64_t v7 = (void *)MEMORY[0x189603F70];
          uint64_t v8 = *MEMORY[0x189603A60];
          unint64_t v9 = @"An NSManagedObject may only be in (or observed by) a single NSManagedObjectContext.";
LABEL_20:
          objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
LABEL_17:
          _PFCMT_SetValue(v14, v15, v16);
          return;
        }
      }

      else
      {
        *(void *)(a2 + 32) = a1;
      }

      int v10 = *(void **)(a2 + 40);
      if (!v10 || v10 == a3)
      {
        *(void *)(a2 + 40) = a3;
      }

      else
      {
        -[NSManagedObject _setObjectID__:]((void *)a2, a3);
        uint64_t v11 = *(void *)(a2 + 24);
        if (v11) {
          snapshot_set_objectID(v11, a3);
        }
      }

      if (!*(void *)(a2 + 56))
      {
        uint64_t v12 = (unsigned int *)(*(void *)(a1 + 152) + 8LL);
        do
          unsigned int v13 = __ldaxr(v12);
        while (__stlxr(v13 + 1, v12));
        *(void *)(a2 + 56) = *(void *)(a1 + 152);
      }

      *(_DWORD *)(a2 + 16) &= 0xFFF7FF7F;
      uint64_t v14 = *(void *)(a1 + 120);
      int v15 = a3;
      uint64_t v16 = (const void *)a2;
      goto LABEL_17;
    }

    uint64_t v7 = (void *)MEMORY[0x189603F70];
    uint64_t v8 = *MEMORY[0x189603A60];
    unint64_t v9 = @"cannot record object with null globalID";
    goto LABEL_20;
  }

- (NSManagedObjectContextConcurrencyType)concurrencyType
{
  if (!self->_dispatchQueue) {
    return 0LL;
  }
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0) {
    return 1LL;
  }
  return 2LL;
}

- (NSTimeInterval)stalenessInterval
{
  return self->_fetchTimestamp;
}

- (void)_forgetObject:(id)a3 propagateToObjectStore:(BOOL)a4 removeFromRegistry:(BOOL)a5
{
  v21[128] = *MEMORY[0x1895F89C0];
  uint64_t v20 = a3;
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    uint64_t v7 = a3;
    unint64_t v9 = (void *)[a3 objectID];
    int v10 = v7[4];
    int v11 = v10 | 0x80;
    v7[4] = v10 | 0x80;
    if (v5 && (v10 & 0x80000) == 0)
    {
      _PFCMT_RemoveValue(&self->_infoByGID->super.isa, v9);
      int v11 = v7[4];
    }

    v7[4] = v11 | 0x80080;
    if (!v6 || (v11 & 0x200) == 0 || ([v9 isTemporaryID] & 1) != 0) {
      goto LABEL_30;
    }
    uint64_t v12 = _PFStackAllocatorCreate(v21, 1024LL);
    CFArrayRef v13 = CFArrayCreate(v12, (const void **)&v20, 1LL, 0LL);
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    id parentObjectStore = self->_parentObjectStore;
    if (-[__CFArray count](v13, "count"))
    {
      int v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", -[__CFArray count](v13, "count"));
      uint64_t v16 = -[__CFArray count](v13, "count");
      if (v16)
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          CFStringRef v18 = (_DWORD *)-[__CFArray objectAtIndex:](v13, "objectAtIndex:", i, v20);
          uint64_t v19 = (void *)[v18 objectID];
          if (([v19 isTemporaryID] & 1) == 0)
          {
            [v15 addObject:v19];
            if (v18) {
              v18[4] &= ~0x200u;
            }
          }
        }
      }

      objc_msgSend( parentObjectStore,  "managedObjectContextDidUnregisterObjectsWithIDs:generation:",  v15,  -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken", v20));
    }

    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    if (v21[3])
    {
      if (v13) {
        CFRelease(v13);
      }
    }

    else
    {
      v21[1] = v21[0];
    }

    uint64_t v7 = v20;
    if (v20)
    {
LABEL_30:
      if ((v7[4] & 9) == 0
        || (-[NSMutableSet removeObject:](self->_unprocessedChanges, "removeObject:", v7),
            -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", v20),
            (uint64_t v7 = v20) != 0LL))
      {
        if ((v7[4] & 0x12) == 0
          || (-[NSMutableSet removeObject:](self->_unprocessedInserts, "removeObject:", v7),
              -[NSMutableSet removeObject:](self->_insertedObjects, "removeObject:", v20),
              (uint64_t v7 = v20) != 0LL))
        {
          if ((v7[4] & 0x24) == 0
            || (-[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", v7),
                -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", v20),
                (uint64_t v7 = v20) != 0LL))
          {
            v7[4] &= 0xFFFFFFC0;
          }
        }
      }
    }
  }

void __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(v2 + 8));
    uint64_t v4 = WeakRetained;
    BOOL v5 = *(const void **)(a1 + 40);
    if (WeakRetained)
    {
      if ((WeakRetained[42] & 4) == 0)
      {
        BOOL v6 = (void *)MEMORY[0x186E3E5D8]();
        -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)v5, 0);
        objc_autoreleasePoolPop(v6);
        if (*((void *)v4 + 3))
        {
          atomic_store(0, v4 + 51);
          __dmb(0xBu);
        }
      }
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    BOOL v5 = *(const void **)(a1 + 40);
  }

  CFRelease(v5);
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    return;
  }
  objc_opt_self();
  qword_18C4ABA08 = (uint64_t)@"ImplicitObservation";
  objc_opt_class();
  _PF_Threading_Debugging_level = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.ConcurrencyDebug");
  int v3 = +[_PFRoutines stringValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.Logging.oslog");
  if ([v3 length]) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = -1;
  }
  BOOL v5 = +[_PFRoutines stringValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.Logging.stderr");
  if (![v5 length])
  {
    int v6 = -1;
    if (v4 < 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  int v6 = [v5 intValue];
  if ((v4 & 0x80000000) == 0) {
LABEL_8:
  }
    _pflogging_enable_oslog = v4;
LABEL_9:
  if ((v6 & 0x80000000) == 0) {
    _pflogging_enable_stderr = v6;
  }
  _PF_shouldAsyncProcessReferenceQueue = byte_18C4ABDBA;
  byte_18C4ABA02 = byte_18C4ABDBB;
  _MergedGlobals_71 = dword_18C4ABDC0;
  byte_18C4ABA01 = +[_PFRoutines insecureBoolValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.Toolchain.EnableToolchainBehaviors");
  uint64_t v7 = getprogname();
  if (v7)
  {
    uint64_t v14 = v7;
    if (*v7)
    {
      if (!strncmp("CommCenter", v7, 0xAuLL)) {
        _PF_Threading_Debugging_level = 0;
      }
      if (!strncmp("SpringBoard", v14, 0xBuLL)) {
        _PF_Threading_Debugging_level = 0;
      }
      if (_PF_USE_IOS_PLATFORM == 1 && !strncmp("News", v14, 4uLL)) {
        byte_18C4ABA03 = 1;
      }
      if (!strncmp("assetsd", v14, 7uLL) || !strncmp("photolibraryd", v14, 0xDuLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_18C4ABA04 = 1;
      }

      if (!strncmp("xctest", v14, 6uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_18C4ABA02 = 1;
      }

      if (!strncmp("accountsd", v14, 9uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 0;
        byte_18C4ABA04 = 1;
      }

      if (!strncmp("CalendarAgent", v14, 0xDuLL)) {
        byte_18C4ABA04 = 1;
      }
      if (!strncmp("soagent", v14, 7uLL)) {
        byte_18C4ABA04 = 1;
      }
      if (!strncmp("Music", v14, 5uLL))
      {
        byte_18C4ABA02 = 0;
        _MergedGlobals_71 = 0;
      }

      if (!strncmp("Radio", v14, 5uLL))
      {
        byte_18C4ABA02 = 0;
        _MergedGlobals_71 = 0;
      }

      if (!strncmp("Podcasts", v14, 8uLL)) {
        _MergedGlobals_71 = 0;
      }
    }
  }

  if (!byte_18C4ABA02) {
    _MergedGlobals_71 = 0;
  }
  if (_PF_Threading_Debugging_level >= 1) {
    _NSCoreDataLog( 4LL,  (uint64_t)@"Core Data multi-threading assertions enabled.",  v8,  v9,  v10,  v11,  v12,  v13,  v15);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
  if (persistentStoreCoordinator)
  {
    id parentObjectStore = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
    if (parentObjectStore != persistentStoreCoordinator)
    {
      if (parentObjectStore)
      {
        objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Context already has a coordinator;  cannot replace.",
                                   0LL));
        __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke(v4);
      }

      else if (self->_dispatchQueue)
      {
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke;
        v7[3] = &unk_189EA7648;
        v7[4] = self;
        v7[5] = persistentStoreCoordinator;
        -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v7);
      }

      else if (_PF_Threading_Debugging_level)
      {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
        -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)self, persistentStoreCoordinator);
      }

      else
      {
        -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)self, persistentStoreCoordinator);
      }
    }
  }

uint64_t __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setPersistentStoreCoordinator:](*(void *)(a1 + 32), *(CFTypeRef *)(a1 + 40));
}

- (uint64_t)_setPersistentStoreCoordinator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(result + 32) = cf;
    if (cf)
    {
      CFRetain(cf);
      -[_PFContextMapTable setForUseWithCoordinator:](*(void **)(v3 + 120), (uint64_t)cf);
      CFRange result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, (uint64_t)cf);
      uint64_t v4 = *((void *)cf + 12);
      if (v4) {
        uint64_t v4 = *(void *)(v4 + 48);
      }
    }

    else
    {
      -[_PFContextMapTable setForUseWithCoordinator:](*(void **)(result + 120), 0LL);
      CFRange result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, 0LL);
      uint64_t v4 = 0LL;
    }

    *(void *)(*(void *)(v3 + 168) + 80LL) = v4;
  }

  return result;
}

- (void)_setRetainsRegisteredObjects:(uint64_t)a1
{
  if (a1)
  {
    if (_PFCMT_GetCount(*(void **)(a1 + 120)))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"An NSManagedObjectContext's retain policy cannot be changed while it has registered objects.  Trying using reset() first." userInfo:0]);
      -[NSManagedObjectContext setRetainsRegisteredObjects:](v6, v7, v8);
    }

    else if (((((*(_DWORD *)(a1 + 40) & 0x40) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFFBF | v4;
      CFRelease(*(CFTypeRef *)(a1 + 120));
      BOOL v5 = -[_PFContextMapTable initWithWeaksReferences:](objc_alloc(&OBJC_CLASS____PFContextMapTable), a2 ^ 1u);
      *(void *)(a1 + 120) = v5;
      -[_PFContextMapTable setForUseWithCoordinator:](v5, [(id)a1 persistentStoreCoordinator]);
      CFRetain(*(CFTypeRef *)(a1 + 120));
    }
  }

- (void)setRetainsRegisteredObjects:(BOOL)retainsRegisteredObjects
{
  BOOL v3 = retainsRegisteredObjects;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke;
    v5[3] = &unk_189EA8728;
    v5[4] = self;
    BOOL v6 = retainsRegisteredObjects;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    -[NSManagedObjectContext _setRetainsRegisteredObjects:]((uint64_t)self, v3);
  }

void __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke(uint64_t a1)
{
}

- (void)setShouldDeleteInaccessibleFaults:(BOOL)shouldDeleteInaccessibleFaults
{
  BOOL v3 = shouldDeleteInaccessibleFaults;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke;
    v6[3] = &unk_189EA8728;
    v6[4] = self;
    BOOL v7 = shouldDeleteInaccessibleFaults;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x100000;
    }
    else {
      int v5 = 0;
    }
    self->_flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v5);
  }

uint64_t __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40LL) = *(_DWORD *)(*(void *)(result + 32) + 40LL) & 0xFFEFFFFF | (*(unsigned __int8 *)(result + 40) << 20);
  return result;
}

- (BOOL)shouldDeleteInaccessibleFaults
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (void)setMergePolicy:(id)mergePolicy
{
  if (self->_dispatchQueue)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __41__NSManagedObjectContext_setMergePolicy___block_invoke;
    v8[3] = &unk_189EA7648;
    v8[4] = mergePolicy;
    v8[5] = self;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v8);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    id v5 = (id)*((void *)self->_additionalPrivateIvars + 3);
    if (v5 != mergePolicy)
    {

      id v6 = NSErrorMergePolicy;
      if (mergePolicy) {
        id v6 = mergePolicy;
      }
      *((void *)self->_additionalPrivateIvars + 3) = v6;
      id v7 = self->_additionalPrivateIvars[3];
    }
  }

void *__41__NSManagedObjectContext_setMergePolicy___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(*(void *)(result[5] + 168LL) + 24LL);
  if ((void *)result[4] != v1)
  {
    uint64_t v2 = result;

    id v3 = NSErrorMergePolicy;
    if (v2[4]) {
      id v3 = (id)v2[4];
    }
    *(void *)(*(void *)(v2[5] + 168LL) + 24LL) = v3;
    return *(id *)(*(void *)(v2[5] + 168LL) + 24LL);
  }

  return result;
}

- (id)mergePolicy
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (id)*((void *)self->_additionalPrivateIvars + 3);
}

+ (NSManagedObjectContext)alloc
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0LL);
}

+ (NSManagedObjectContext)allocWithZone:(_NSZone *)a3
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0LL);
}

- (NSManagedObjectContext)init
{
  return -[NSManagedObjectContext initWithConcurrencyType:](self, "initWithConcurrencyType:", 0LL);
}

- (id)description
{
  id v3 = (id)[self->_additionalPrivateIvars[21] copy];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSManagedObjectContext;
    return (id)[NSString stringWithFormat:@"%@: %@", -[NSManagedObjectContext description](&v6, sel_description), v3];
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSManagedObjectContext;
    return -[NSManagedObjectContext description](&v5, sel_description);
  }

- (void)_dealloc__
{
  if (!a1) {
    return;
  }
  if (!*(void *)(a1 + 168))
  {
    *(void *)(a1 + 168) = PF_CALLOC_OBJECT_ARRAY(22LL);
    if (!*(void *)(a1 + 136))
    {
      uint64_t v2 = (Class *)0x1896079F8LL;
      if (_PF_Threading_Debugging_level <= 0) {
        uint64_t v2 = (Class *)off_189EA56D0;
      }
      *(void *)(a1 + 136) = objc_alloc_init(*v2);
    }

    if (!_PF_Threading_Debugging_level) {
      goto LABEL_11;
    }
    uint64_t v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v12 = malloc_default_zone();
    }
    *(void *)(*(void *)(a1 + 168) + 56LL) = malloc_zone_malloc(v12, 0x30uLL);
    pthread_t v13 = pthread_self();
    **(void **)(*(void *)(a1 + 168) + 56LL) = v13;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 8LL) = v13;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 16LL) = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 24LL) = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 32LL) = objc_alloc_init(MEMORY[0x189603FA8]);
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)(a1 + 49));
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = (void *)[MEMORY[0x189607988] currentQueue];
      if ([v15 maxConcurrentOperationCount] == 1) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0LL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 16LL) = v16;
      current_queue = (dispatch_queue_global_s *)dispatch_get_current_queue();
      if (current_queue == dispatch_get_global_queue(0LL, 0LL)) {
        CFStringRef v18 = 0LL;
      }
      else {
        CFStringRef v18 = current_queue;
      }
      *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 24LL) = v18;
    }
  }

  if (_PF_Threading_Debugging_level)
  {
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56LL) + 8LL) = pthread_self();
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__dealloc__);
    }
  }

- (uint64_t)_dispose:(uint64_t)result
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  [*(id *)(result + 136) lock];
  ++*(_DWORD *)(v1 + 52);
  *(_DWORD *)(v1 + 16) = 1;
  if (_PF_Threading_Debugging_level && *(void *)(*(void *)(v1 + 168) + 56LL)) {
    *(void *)(*(void *)(*(void *)(v1 + 168) + 56LL) + 8LL) = pthread_self();
  }
  uint64_t v2 = *(const void **)(v1 + 32);
  if (v2) {
    BOOL v3 = CFGetRetainCount(v2) == 1;
  }
  else {
    BOOL v3 = 0;
  }
  ++*(_WORD *)(v1 + 46);
  -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](*(void *)(v1 + 152));
  unint64_t Count = _PFCMT_GetCount(*(void **)(v1 + 120));
  uint64_t v48 = (uint64_t)&v48;
  unint64_t v5 = MEMORY[0x1895F8858](Count);
  uint64_t v8 = (const void **)((char *)&v48 - v7);
  if (v5 >= 0x201) {
    uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v48 - v7, 8 * v6);
  }
  CFIndex v9 = -[_PFContextMapTable getAllObjects:](*(void *)(v1 + 120), v8);
  -[NSManagedObjectContext lockObjectStore](v1);
  id v49 = objc_alloc_init(MEMORY[0x1896077E8]);
  *(void *)&__int128 v50 = v8;
  *(_OWORD *)&callBacks.versiouint64_t n = xmmword_189EA8440;
  *(_OWORD *)&callBacks.release = *(_OWORD *)&off_189EA8450;
  callBacks.equal = 0LL;
  if (v3)
  {
    uint64_t v10 = 0LL;
    if (!v9) {
      goto LABEL_28;
    }
  }

  else
  {
    uint64_t v10 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], v9, &callBacks);
    if (!v9) {
      goto LABEL_28;
    }
  }

  uint64_t v11 = (id *)v50;
  do
  {
    uint64_t v12 = *v11;
    pthread_t v13 = (void *)objc_msgSend(*v11, "objectID", v48, v49);
    if (v12) {
      char v14 = v3;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0 && (*((_BYTE *)v12 + 17) & 2) != 0)
    {
      uint64_t v15 = v13;
      if (([v13 isTemporaryID] & 1) == 0)
      {
        CFArrayAppendValue(v10, v15);
        v12[4] &= ~0x200u;
      }
    }

    unsigned int v16 = v12[4];
    unsigned int v17 = v16 & 0xFFFFFFC0;
    v12[4] = v16 & 0xFFFFFFC0;
    int v18 = (v16 >> 15) & 7;
    if (v18 == 5 || v18 == 0)
    {
      -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)v12, 0LL);
      unsigned int v17 = v12[4];
    }

    *((void *)v12 + 4) = 0LL;
    v12[4] = v17 | 0x80080;
    ++v11;
    --v9;
  }

  while (v9);
LABEL_28:
  if (!v3 && CFArrayGetCount(v10) >= 1) {
    objc_msgSend( *(id *)(v1 + 32),  "managedObjectContextDidUnregisterObjectsWithIDs:generation:",  v10,  objc_msgSend((id)v1, "_queryGenerationToken"));
  }
  if (v10) {
    CFRelease(v10);
  }
  -[_PFManagedObjectReferenceQueue _processReferenceQueue:](*(void *)(v1 + 152), 1);
  if (Count >= 0x201) {
    NSZoneFree(0LL, (void *)v50);
  }
  uint64_t v20 = *(void *)(v1 + 152);
  if (v20)
  {
    *(_DWORD *)(v20 + 20) = -1;
    os_unfair_lock_lock_with_options();
    *(void *)(v20 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 12));
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](v20);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](v20, 1);
    CFRelease((CFTypeRef)v20);
  }

  -[NSManagedObjectContext unlockObjectStore](v1);
  uint64_t v21 = *(const void **)(v1 + 152);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(v1 + 152) = 0LL;
  }

  *(_DWORD *)(v1 + 16) = 1;
  uint64_t v22 = *(const void **)(v1 + 120);
  *(void *)(v1 + 120) = 0LL;
  *(_DWORD *)(v1 + 40) = *(_DWORD *)(v1 + 40) & 0xFFFFF8BF | 0x40;
  __dmb(0xBu);
  if (v22) {
    CFRelease(v22);
  }

  *(void *)(v1 + 72) = 0LL;
  *(void *)(v1 + 64) = 0LL;

  *(void *)(v1 + 56) = 0LL;
  *(void *)(v1 + 80) = 0LL;

  *(void *)(v1 + 88) = 0LL;
  *(void *)(v1 + 96) = 0LL;

  *(void *)(v1 + 104) = 0LL;
  *(void *)(v1 + 112) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 24LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 96LL) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 120LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 128LL) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 88LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 104LL) = 0LL;
  uint64_t v23 = *(void **)(v1 + 128);
  if (v23)
  {
    uint64_t v24 = *(void *)(*(void *)(v1 + 168) + 80LL);
    if (v24)
    {
      unint64_t v25 = 0LL;
      unint64_t v26 = 2 * v24;
      do
      {

        v25 += 2LL;
      }

      while (v25 < v26);
      uint64_t v23 = *(void **)(v1 + 128);
    }

    PF_FREE_OBJECT_ARRAY(v23);
  }

  *(void *)(v1 + 128) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 32LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 16LL) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 48LL) = 0LL;
  **(void **)(v1 + 168) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 136LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 144LL) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 112LL) = 0LL;
  *(void *)(*(void *)(v1 + 168) + 152LL) = 0LL;

  *(void *)(*(void *)(v1 + 168) + 160LL) = 0LL;
  uint64_t v27 = *(void *)(v1 + 168);
  unint64_t v28 = *(id **)(v27 + 8);
  if (v28)
  {

    PF_FREE_OBJECT_ARRAY(*(void **)(*(void *)(v1 + 168) + 8LL));
    *(void *)(*(void *)(v1 + 168) + 8LL) = 0LL;
    uint64_t v27 = *(void *)(v1 + 168);
  }

  uint64_t v29 = *(void *)(v27 + 56);
  if (v29)
  {

    *(void *)(*(void *)(*(void *)(v1 + 168) + 56LL) + 32LL) = 85LL;
    *(void *)(*(void *)(*(void *)(v1 + 168) + 56LL) + 40LL) = 85LL;
    uint64_t v30 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v30 = malloc_default_zone();
    }
    malloc_zone_free(v30, *(void **)(*(void *)(v1 + 168) + 56LL));
    *(void *)(*(void *)(v1 + 168) + 56LL) = 0LL;
    uint64_t v27 = *(void *)(v1 + 168);
  }

  *(void *)(*(void *)(v1 + 168) + 168LL) = @"deallocated NSManagedObjectContext";
  PF_FREE_OBJECT_ARRAY(*(void **)(v1 + 168));
  *(void *)(v1 + 168) = 0LL;
  [*(id *)(v1 + 136) unlock];
  id v32 = *(dispatch_object_s **)(v1 + 24);
  if (v32) {
    dispatch_release(v32);
  }
  *(void *)(v1 + 24) = 0LL;
  uint64_t v33 = (unint64_t *)(v1 + 8);
  unint64_t v34 = atomic_load((unint64_t *)(v1 + 8));
  do
  {
    unint64_t v35 = __ldaxr(v33);
    if (v35 != v34)
    {
      *(void *)&__int128 v31 = 134218752LL;
      __int128 v50 = v31;
      while (1)
      {
        __clrex();
        uint64_t v38 = objc_msgSend( NSString,  "stringWithUTF8String:",  "Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)",  v48);
        atomic_load((unint64_t *)(v1 + 8));
        _NSCoreDataLog(17LL, v38, v39, v40, v41, v42, v43, v44, v1);
        __int128 v45 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          unint64_t v47 = atomic_load((unint64_t *)(v1 + 8));
          *(_DWORD *)buf = v50;
          uint64_t v53 = v1;
          __int16 v54 = 2048;
          uint64_t v55 = 0LL;
          __int16 v56 = 2048;
          unint64_t v57 = v34;
          __int16 v58 = 2048;
          unint64_t v59 = v47;
          _os_log_fault_impl( &dword_186681000,  v45,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)",  buf,  0x2Au);
        }

        unint64_t v34 = atomic_load(v33);
        while (1)
        {
          unint64_t v46 = __ldaxr(v33);
          if (v46 != v34) {
            break;
          }
          if (!__stlxr(0LL, v33)) {
            goto LABEL_58;
          }
        }
      }
    }
  }

  while (__stlxr(0LL, v33));
LABEL_58:
  uint64_t v36 = *(const void **)(v1 + 136);
  if (v36) {
    CFRelease(v36);
  }
  *(void *)(v1 + 136) = 0LL;
  uint64_t v37 = *(const void **)(v1 + 32);
  if (v37) {
    CFRelease(v37);
  }
  *(void *)(v1 + 32) = 0LL;
  return MEMORY[0x186E3F1B4]();
}

- (void)dealloc
{
  if (self->_dispatchQueue)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
    if ((v3 & 1) != 0 && _PFIsSerializedWithMainQueue())
    {
      int wasDisposed = self->_wasDisposed;
      -[NSManagedObjectContext _dealloc__]((uint64_t)self);
      internal_PF_actor_clear_for_dealloc((uint64_t)self);
      if (!wasDisposed)
      {
        objc_destructInstance(self);
        dispatch_time_t v5 = dispatch_time(0LL, 3000000000LL);
        v9[0] = MEMORY[0x1895F87A8];
        v9[1] = 3221225472LL;
        v9[2] = __33__NSManagedObjectContext_dealloc__block_invoke;
        v9[3] = &__block_descriptor_40_e5_v8__0l;
        v9[4] = self;
        dispatch_after(v5, MEMORY[0x1895F8AE0], v9);
      }
    }

    else
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      int v7 = self->_wasDisposed;
      dispatch_retain(dispatchQueue);
      MEMORY[0x186E3F1A8]();
      internal_PF_actor_clear_for_dealloc((uint64_t)self);
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __internalBlockToDeallocNSManagedObjectContext_block_invoke;
      aBlock[3] = &unk_189EA8690;
      int v11 = v7;
      aBlock[4] = dispatchQueue;
      aBlock[5] = self;
      uint64_t v8 = malloc(0x20uLL);
      *uint64_t v8 = _Block_copy(aBlock);
      v8[1] = self;
      v8[2] = 12289LL;
      v8[3] = 0LL;
      dispatch_async_f(dispatchQueue, v8, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    }
  }

  else
  {
    -[NSManagedObjectContext _dealloc__]((uint64_t)self);
  }

void __33__NSManagedObjectContext_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  malloc_zone_free(v2, *(void **)(a1 + 32));
}

- (void)setStalenessInterval:(NSTimeInterval)stalenessInterval
{
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __47__NSManagedObjectContext_setStalenessInterval___block_invoke;
    v5[3] = &unk_189EA86D8;
    v5[4] = self;
    *(NSTimeInterval *)&void v5[5] = stalenessInterval;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    self->_fetchTimestamp = stalenessInterval;
  }

double __47__NSManagedObjectContext_setStalenessInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 144LL) = result;
  return result;
}

- (void)_setUndoManager:(uint64_t)a1
{
  if (a1 && *(void **)(*(void *)(a1 + 168) + 40LL) != a2)
  {
    -[NSManagedObjectContext _stopObservingUndoManagerNotifications](a1);

    *(void *)(*(void *)(a1 + 168) + 40LL) = a2;
    if (a2)
    {
      id v4 = a2;
      -[NSManagedObjectContext _startObservingUndoManagerNotifications](a1);
    }
  }

- (uint64_t)_stopObservingUndoManagerNotifications
{
  if (*(void *)(*(void *)(result + 168) + 40LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x189607958] defaultCenter];
    [v2 removeObserver:v1 name:*MEMORY[0x1896077A8] object:*(void *)(*(void *)(v1 + 168) + 40)];
    return [*(id *)(*(void *)(v1 + 168) + 40) removeAllActionsWithTarget:v1];
  }

  return result;
}

- (uint64_t)_startObservingUndoManagerNotifications
{
  if (*(void *)(*(void *)(result + 168) + 40LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x189607958] defaultCenter];
    return [v2 addObserver:v1 selector:sel__undoManagerCheckpoint_ name:*MEMORY[0x1896077A8] object:*(void *)(*(void *)(v1 + 168) + 40)];
  }

  return result;
}

- (void)setUndoManager:(NSUndoManager *)undoManager
{
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __41__NSManagedObjectContext_setUndoManager___block_invoke;
    v5[3] = &unk_189EA7648;
    v5[4] = self;
    void v5[5] = undoManager;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    -[NSManagedObjectContext _setUndoManager:]((uint64_t)self, undoManager);
  }

void __41__NSManagedObjectContext_setUndoManager___block_invoke(uint64_t a1)
{
}

- (NSUndoManager)undoManager
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (NSUndoManager *)*((void *)self->_additionalPrivateIvars + 5);
}

- (void)processPendingChanges
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0LL);
}

- (void)_processRecentChanges:(uint64_t)a1
{
  uint64_t v123 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = a1;
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processRecentChanges_);
    }
    int v3 = *(_DWORD *)(v2 + 40);
    if ((v3 & 8) == 0)
    {
      if ((v3 & 0x100) == 0)
      {
        -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
        -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
        return;
      }

      char v83 = 0;
      id v74 = 0LL;
      *(_DWORD *)(v2 + 40) = v3 | 0x808;
      id v97 = 0LL;
      v72 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x189605258] + 8LL);
      CFIndex v73 = *MEMORY[0x189605258];
      uint64_t v70 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      v71 = *(void (__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x189605258] + 16LL);
      uint64_t v69 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v76 = v2;
      while (1)
      {
        uint64_t v4 = [*(id *)(v2 + 56) count];
        uint64_t v5 = [*(id *)(v2 + 72) count];
        if (!(v5 + v4 + [*(id *)(v2 + 64) count]))
        {
          if ([*(id *)(v2 + 112) count])
          {
            if (!v74) {
              id v74 = objc_alloc_init(MEMORY[0x1896077E8]);
            }
            -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
          }

          if ((v83 & 1) == 0) {
            *(_DWORD *)(v2 + 40) &= 0xFFFFF6F6;
          }
          id v65 = v97;
          [v74 drain];
          id v66 = v97;
          if (a2 && v97) {
            *a2 = v97;
          }
          id v67 = 0LL;
          -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
          return;
        }

        if (!v74) {
          id v74 = objc_alloc_init(MEMORY[0x1896077E8]);
        }
        callBacks.versiouint64_t n = v73;
        callBacks.retaiuint64_t n = v72;
        callBacks.release = v71;
        callBacks.copyDescriptiouint64_t n = v70;
        callBacks.equal = 0LL;
        callBacks.hash = 0LL;
        CFMutableSetRef v6 = CFSetCreateMutable(v69, 0LL, &callBacks);
        CFMutableSetRef v7 = CFSetCreateMutable(v69, 0LL, &callBacks);
        CFMutableSetRef v8 = CFSetCreateMutable(v69, 0LL, &callBacks);
        CFMutableSetRef v9 = CFSetCreateMutable(v69, 0LL, &callBacks);
        CFMutableSetRef v10 = CFSetCreateMutable(v69, 0LL, &callBacks);
        -[NSManagedObjectContext _registerClearStateWithUndoManager](v76);
        CFMutableSetRef v81 = v10;
        CFMutableSetRef v82 = v6;
        CFMutableSetRef v79 = v8;
        CFMutableSetRef v80 = v7;
        CFMutableSetRef v78 = v9;
        uint64_t v2 = v76;
        if ((*(_BYTE *)(v76 + 40) & 2) == 0) {
          goto LABEL_70;
        }
        if ([*(id *)(v76 + 64) count] || objc_msgSend(*(id *)(v76 + 88), "count")) {
          break;
        }
        CFMutableSetRef v37 = v10;
        uint64_t v2 = v76;
LABEL_71:
        uint64_t v38 = (void *)-[NSManagedObjectContext _processPendingDeletions:withInsertions:withUpdates:withNewlyForgottenList:withRemovedChangedObjects:]( v2,  v80,  v78,  v37);
        uint64_t v39 = -[NSManagedObjectContext _processPendingInsertions:withDeletions:withUpdates:]((id *)v2, v82, v79);
        uint64_t v40 = -[NSManagedObjectContext _processPendingUpdates:](v2, v79);
        if (v40) {
          -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:]( v2,  (uint64_t)sel__undoUpdates_,  v40,  0LL);
        }
        if (v39) {
          -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:]( v2,  (uint64_t)sel__undoInsertions_,  v39,  0LL);
        }
        if (v38)
        {
          uint64_t v41 = [v38 count];
          v75 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2];
          uint64_t v42 = -[__CFSet count](v81, "count");
          if (v42) {
            uint64_t v77 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v41];
          }
          else {
            uint64_t v77 = 0LL;
          }
          id v43 = objc_alloc(MEMORY[0x189603F18]);
          if (v77) {
            uint64_t v44 = (uint64_t)v77;
          }
          else {
            uint64_t v44 = NSKeyValueCoding_NullValue;
          }
          __int128 v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, 0);

          [v75 addObject:v45];
          unint64_t v46 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v41];
          [v75 addObject:v46];

          if (*(void *)(*(void *)(v2 + 168) + 40LL) && v41)
          {
            for (uint64_t i = 0LL; i != v41; ++i)
            {
              uint64_t v48 = (void *)[v38 objectAtIndex:i];
              id v49 = v48;
              if (v48
                && (__int128 v50 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( v48,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  1)) != 0LL)
              {
                [v46 addObject:v50];
              }

              else
              {
                [v46 addObject:NSKeyValueCoding_NullValue];
                __int128 v50 = 0LL;
              }

              if (v42)
              {
                uint64_t v51 = -[__CFSet member:](v81, "member:", v49);
                __int128 v52 = &NSKeyValueCoding_NullValue;
                if (v51) {
                  __int128 v52 = &NSArray_EmptyArray;
                }
                [v77 addObject:*v52];
              }
            }
          }

          -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:]( v2,  (uint64_t)sel__undoDeletions_,  v38,  (uint64_t)v75);
        }

        if (([*(id *)(*(void *)(v2 + 168) + 40) groupsByEvent] & 1) == 0)
        {
          if (([*(id *)(*(void *)(v2 + 168) + 40) isUndoing] & 1) == 0
            && ([*(id *)(*(void *)(v2 + 168) + 40) isRedoing] & 1) == 0)
          {
            [*(id *)(*(void *)(v2 + 168) + 40) endUndoGrouping];
          }

          *(_DWORD *)(v2 + 40) &= ~0x20u;
        }

        [*(id *)(v2 + 72) removeAllObjects];
        [*(id *)(v2 + 64) removeAllObjects];
        [*(id *)(v2 + 56) removeAllObjects];
        uint64_t v53 = (void *)[*(id *)(v2 + 112) copy];
        [*(id *)(v2 + 112) removeAllObjects];
        if ((v83 & 1) == 0) {
          *(_DWORD *)(v2 + 40) &= 0xFFFFF6F6;
        }
        uint64_t v54 = *(void *)(v2 + 168);
        uint64_t v55 = *(void **)(v54 + 88);
        if (v55)
        {
          *(void *)(v54 + 88) = 0LL;
          uint64_t v54 = *(void *)(v2 + 168);
        }

        -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]( (void *)v2,  v82,  v80,  v79,  v53,  v55,  *(void *)(v54 + 104) != 0LL);
        -[NSManagedObjectContext _processRecentlyForgottenObjects:]((void *)v2, v78);
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        uint64_t v56 = [v40 countByEnumeratingWithState:&v92 objects:v118 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v93;
          do
          {
            for (uint64_t j = 0LL; j != v56; ++j)
            {
              if (*(void *)v93 != v57) {
                objc_enumerationMutation(v40);
              }
              -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v92 + 1) + 8 * j));
            }

            uint64_t v56 = [v40 countByEnumeratingWithState:&v92 objects:v118 count:16];
          }

          while (v56);
        }

        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        uint64_t v59 = [v39 countByEnumeratingWithState:&v88 objects:v117 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v89;
          do
          {
            for (uint64_t k = 0LL; k != v59; ++k)
            {
              if (*(void *)v89 != v60) {
                objc_enumerationMutation(v39);
              }
              -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v88 + 1) + 8 * k));
            }

            uint64_t v59 = [v39 countByEnumeratingWithState:&v88 objects:v117 count:16];
          }

          while (v59);
        }

        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        uint64_t v62 = [v38 countByEnumeratingWithState:&v84 objects:v116 count:16];
        if (v62)
        {
          uint64_t v63 = *(void *)v85;
          do
          {
            for (uint64_t m = 0LL; m != v62; ++m)
            {
              if (*(void *)v85 != v63) {
                objc_enumerationMutation(v38);
              }
              -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v84 + 1) + 8 * m));
            }

            uint64_t v62 = [v38 countByEnumeratingWithState:&v84 objects:v116 count:16];
          }

          while (v62);
        }

        char v83 = 1;
      }

      v110.versiouint64_t n = v73;
      v110.retaiuint64_t n = v72;
      v110.release = v71;
      v110.copyDescriptiouint64_t n = v70;
      v110.equal = 0LL;
      v110.hash = 0LL;
      uint64_t v2 = v76;
      CFMutableSetRef v11 = CFSetCreateMutable(v69, 0LL, &v110);
      if ([*(id *)(v76 + 64) count])
      {
        __int128 v108 = 0u;
        __int128 v109 = 0u;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        uint64_t v12 = *(void **)(v76 + 64);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v106 objects:v121 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v107;
          do
          {
            for (uint64_t n = 0LL; n != v13; ++n)
            {
              if (*(void *)v107 != v14) {
                objc_enumerationMutation(v12);
              }
              -[__CFSet addObject:](v11, "addObject:", *(void *)(*((void *)&v106 + 1) + 8 * n));
            }

            uint64_t v13 = [v12 countByEnumeratingWithState:&v106 objects:v121 count:16];
          }

          while (v13);
        }
      }

      if ([*(id *)(v76 + 56) count])
      {
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        __int128 v102 = 0u;
        __int128 v103 = 0u;
        unsigned int v16 = *(void **)(v76 + 56);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v102 objects:v120 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v103;
          do
          {
            for (iuint64_t i = 0LL; ii != v17; ++ii)
            {
              if (*(void *)v103 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void *)(*((void *)&v102 + 1) + 8 * ii);
              if (v20 && (*(_BYTE *)(v20 + 16) & 0x20) != 0) {
                -[__CFSet addObject:](v11, "addObject:");
              }
            }

            uint64_t v17 = [v16 countByEnumeratingWithState:&v102 objects:v120 count:16];
          }

          while (v17);
        }
      }

      if ([*(id *)(v76 + 112) count])
      {
        __int128 v100 = 0u;
        __int128 v101 = 0u;
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        uint64_t v21 = *(void **)(v76 + 112);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v98 objects:v119 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v99;
          do
          {
            for (juint64_t j = 0LL; jj != v22; ++jj)
            {
              if (*(void *)v99 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = [(id)v76 objectRegisteredForID:*(void *)(*((void *)&v98 + 1) + 8 * jj)];
              if (v25 && (*(_BYTE *)(v25 + 16) & 0x20) != 0) {
                -[__CFSet addObject:](v11, "addObject:", v25);
              }
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v98 objects:v119 count:16];
          }

          while (v22);
        }
      }

      unsigned __int8 v26 = atomic_load((unsigned __int8 *)(v76 + 48));
      if ((v26 & 1) == 0 && [(id)v76 persistentStoreCoordinator] && -[__CFSet count](v11, "count"))
      {
        uint64_t v27 = +[_PFRoutines createDictionaryPartitioningObjectsByEntity:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v11);
        unint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        -[NSFetchRequest setResultType:](v28, "setResultType:", 0LL);
        -[NSFetchRequest setIncludesPendingChanges:](v28, "setIncludesPendingChanges:", 0LL);
        -[NSFetchRequest setIncludesSubentities:](v28, "setIncludesSubentities:", 0LL);
        v115.versiouint64_t n = MEMORY[0x1895F87A8];
        v115.retaiuint64_t n = (CFSetRetainCallBack)3221225472LL;
        v115.release = (CFSetReleaseCallBack)__92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke;
        v115.copyDescriptiouint64_t n = (CFSetCopyDescriptionCallBack)&unk_189EA8470;
        v115.equal = (CFSetEqualCallBack)v28;
        v115.hash = (CFSetHashCallBack)v76;
        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", &v115);
        CFRelease(v27);
      }

      if (-[__CFSet count](v11, "count"))
      {
        id v29 = objc_alloc_init(MEMORY[0x1896077E8]);
        ++*(_WORD *)(v76 + 46);
        *(_DWORD *)(v76 + 40) |= 0x1000u;
        v115.versiouint64_t n = v73;
        v115.retaiuint64_t n = v72;
        v115.release = v71;
        v115.copyDescriptiouint64_t n = v70;
        v115.equal = 0LL;
        v115.hash = 0LL;
        CFMutableSetRef v30 = CFSetCreateMutable(v69, 0LL, &v115);
        __int128 v31 = (void *)-[__CFSet mutableCopy](v11, "mutableCopy");
        unint64_t v32 = 0LL;
        while ([v31 count])
        {
          [*(id *)(v76 + 64) removeAllObjects];
          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v111 = 0u;
          __int128 v112 = 0u;
          uint64_t v33 = [v31 countByEnumeratingWithState:&v111 objects:v122 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v112;
            do
            {
              for (kuint64_t k = 0LL; kk != v33; ++kk)
              {
                if (*(void *)v112 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void **)(*((void *)&v111 + 1) + 8 * kk);
                -[__CFSet addObject:](v30, "addObject:", v36);
                if (v36) {
                  -[NSManagedObject _propagateDelete:](v36, 1);
                }
              }

              uint64_t v33 = [v31 countByEnumeratingWithState:&v111 objects:v122 count:16];
            }

            while (v33);
          }

          if (v32 < 0x1E)
          {
            ++v32;
          }

          else
          {
            if ([*(id *)(v76 + 64) isSubsetOfSet:v30]) {
              break;
            }
            unint64_t v32 = 0LL;
          }

          __int128 v31 = (void *)[*(id *)(v76 + 64) mutableCopy];
        }

        *(void *)(v76 + 64) = v30;
        *(_DWORD *)(v76 + 40) &= ~0x1000u;
        --*(_WORD *)(v76 + 46);
        [v29 drain];
      }

      if (a2) {
        -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]( (char *)v76,  *(void **)(v76 + 64),  2,  (uint64_t *)&v97,  (*(_DWORD *)(v76 + 40) >> 2) & 1,  0);
      }

LABEL_70:
      CFMutableSetRef v37 = v81;
      goto LABEL_71;
    }
  }

- (void)assignObject:(id)object toPersistentStore:(NSPersistentStore *)store
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      return;
    }
  }

  else if (!object)
  {
    return;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFMutableSetRef v7 = (void *)[object objectID];
    if ([v7 isTemporaryID])
    {
      CFMutableSetRef v8 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
      if (v8) {
        uint64_t modelMap = (uint64_t)v8->_modelMap;
      }
      else {
        uint64_t modelMap = 0LL;
      }
      if (objc_msgSend( -[_PFModelMap entitiesForContext:configuration:]( modelMap,  self,  (uint64_t)-[NSPersistentStore configurationName](store, "configurationName")),  "containsObject:",  objc_msgSend(v7, "entity")))
      {
        [v7 _setPersistentStore:store];
        return;
      }

      uint64_t v14 = (void *)MEMORY[0x189603F70];
      uint64_t v15 = *MEMORY[0x189603A60];
      uint64_t v13 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  -[NSPersistentStore URL](store, "URL"),  @"storeURL",  objc_msgSend((id)objc_msgSend(v7, "entity"), "name"),  @"entityName",  v7,  @"objectID",  0);
      uint64_t v12 = @"Can't assign an object to a store that does not contain the object's entity.";
    }

    else
    {
      uint64_t v14 = (void *)MEMORY[0x189603F70];
      uint64_t v15 = *MEMORY[0x189603A60];
      uint64_t v13 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  -[NSPersistentStore URL](store, "URL"),  @"newStoreURL",  objc_msgSend((id)objc_msgSend(v7, "persistentStore"), "URL"),  @"originalStoreURL",  v7,  @"objectID",  0);
      uint64_t v12 = @"Can't reassign an object to a different store once it has been saved.";
    }

    CFMutableSetRef v10 = v14;
    uint64_t v11 = v15;
  }

  else
  {
    CFMutableSetRef v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    uint64_t v12 = @"Parameter #1 to -assignObject:toPersistentStore: must be an NSManagedObject or subclass.";
    uint64_t v13 = 0LL;
  }

  objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:v13]);
  -[NSManagedObjectContext updatedObjects](v16, v17);
}

- (NSSet)updatedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithCapacity:",  -[NSMutableSet count](self->_unprocessedChanges, "count")
               + -[NSMutableSet count](self->_changedObjects, "count"));
  [v3 setSet:self->_changedObjects];
  [v3 unionSet:self->_unprocessedChanges];
  return (NSSet *)v3;
}

- (NSSet)registeredObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (NSSet *)(id)-[NSManagedObjectContext _retainedRegisteredObjects]((uint64_t)self);
}

- (uint64_t)_retainedRegisteredObjects
{
  uint64_t v1 = a1;
  v8[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    -[NSManagedObjectContext _processReferenceQueue:](a1, 0);
    unint64_t Count = _PFCMT_GetCount(*(void **)(v1 + 120));
    unint64_t v3 = Count;
    if (Count <= 1) {
      uint64_t v4 = 1LL;
    }
    else {
      uint64_t v4 = Count;
    }
    if (Count >= 0x201) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = v4;
    }
    CFMutableSetRef v6 = (const void **)((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (Count > 0x200) {
      CFMutableSetRef v6 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
    }
    uint64_t v1 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:count:",  v6,  -[_PFContextMapTable getAllObjects:](*(void *)(v1 + 120), v6));
    if (v3 >= 0x201) {
      NSZoneFree(0LL, v6);
    }
  }

  return v1;
}

- (NSSet)insertedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  unint64_t v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithCapacity:",  -[NSMutableSet count](self->_unprocessedInserts, "count")
               + -[NSMutableSet count](self->_insertedObjects, "count"));
  [v3 setSet:self->_insertedObjects];
  [v3 unionSet:self->_unprocessedInserts];
  return (NSSet *)v3;
}

- (NSSet)deletedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  unint64_t v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithCapacity:",  -[NSMutableSet count](self->_unprocessedDeletes, "count")
               + -[NSMutableSet count](self->_deletedObjects, "count"));
  [v3 setSet:self->_deletedObjects];
  [v3 unionSet:self->_unprocessedDeletes];
  return (NSSet *)v3;
}

- (BOOL)propagatesDeletesAtEndOfEvent
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setPropagatesDeletesAtEndOfEvent:(BOOL)propagatesDeletesAtEndOfEvent
{
  BOOL v3 = propagatesDeletesAtEndOfEvent;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke;
    v6[3] = &unk_189EA8728;
    v6[4] = self;
    BOOL v7 = propagatesDeletesAtEndOfEvent;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    self->_flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v5);
  }

uint64_t __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40LL) = *(_DWORD *)(*(void *)(result + 32) + 40LL) & 0xFFFFFFFD | (2 * *(unsigned __int8 *)(result + 40));
  return result;
}

- (NSManagedObject)objectRegisteredForID:(NSManagedObjectID *)objectID
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, objectID);
  if (!Value)
  {
    CFMutableSetRef v6 = -[NSManagedObjectID persistentStore](objectID, "persistentStore");
    uint64_t v7 = -[NSPersistentStore _persistentStoreCoordinator](v6, "_persistentStoreCoordinator");
    CFMutableSetRef v8 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    BOOL v9 = -[NSManagedObjectID _isPersistentStoreAlive](objectID, "_isPersistentStoreAlive");
    if (((NSPersistentStoreCoordinator *)v7 != v8 || !v9)
      && (v6 || !-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID")))
    {
      CFMutableSetRef v10 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v11 = -[NSManagedObjectID URIRepresentation](objectID, "URIRepresentation");
      if (-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]( (uint64_t)v8,  (uint64_t)-[NSManagedObjectID _storeIdentifier](objectID, "_storeIdentifier")))
      {
        uint64_t v12 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v8, (CFURLRef)v11, 0LL);
        uint64_t v13 = v12;
        if (v12)
        {
          Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v12);
LABEL_14:

          objc_autoreleasePoolPop(v10);
          return Value;
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      Value = 0LL;
      goto LABEL_14;
    }

    return 0LL;
  }

  return Value;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if ((void *)qword_18C4ABA08 == context
    && (!self || self->_ignoreChangeNotification <= 0)
    && (*((_BYTE *)object + 17) & 0x20) == 0)
  {
    uint64_t v11 = (unint64_t *)[object entity];
    uint64_t v12 = v11;
    if (v11) {
      uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", keyPath);
    }
    else {
      uint64_t v13 = 0LL;
    }
    if ([v13 _propertyType] != 4) {
      uint64_t v13 = 0LL;
    }
    if (v13) {
      uint64_t v14 = [v13 inverseRelationship];
    }
    else {
      uint64_t v14 = 0LL;
    }
    if ([v13 _isToManyRelationship]
      && (unint64_t v15 = [v13 _entitysReferenceID],
          uint64_t v16 = _kvcPropertysPrimitiveGetters(v12),
          (Property = _PF_Handler_Public_GetProperty((id **)object, v15, (uint64_t)keyPath, *(void *)(v16 + 8 * v15))) != 0LL)
      && ((uint64_t v18 = Property, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v18 _shouldProcessKVOChange] & 1) == 0)
    {
      _PFFastMOCObjectWillChange((uint64_t)self, object);
    }

    else
    {
      [object _didChangeValue:change forRelationship:v13 named:keyPath withInverse:v14];
    }
  }

- (void)insertObject:(NSManagedObject *)object
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  CFMutableSetRef v6 = -[NSManagedObject entity](object, "entity");
  if (!v6)
  {
    uint64_t v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    uint64_t v13 = @"An NSManagedObject must have a valid NSEntityDescription.";
    goto LABEL_14;
  }

  BOOL v3 = v6;
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    uint64_t v7 = -[NSPersistentStoreCoordinator managedObjectModel]( -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "managedObjectModel");
    uint64_t v8 = -[NSEntityDescription name](v3, "name");
    if ((!v7 || !-[NSMutableDictionary objectForKey:](v7->_entities, "objectForKey:", v8))
      && !-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
    {
      while (1)
      {
        uint64_t v14 = (void *)MEMORY[0x189603F70];
        uint64_t v15 = *MEMORY[0x189603A60];
        uint64_t v16 = (void *)NSString;
        if (-[NSEntityDescription name](v3, "name")) {
          uint64_t v17 = -[NSEntityDescription name](v3, "name");
        }
        else {
          uint64_t v17 = [MEMORY[0x189603FE8] null];
        }
        uint64_t v13 = (const __CFString *)[v16 stringWithFormat:@"Cannot insert '%@' in this managed object context because it is not found in the associated managed object model.", v17];
        uint64_t v11 = v14;
        uint64_t v12 = v15;
LABEL_14:
        objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
      }
    }
  }

  BOOL v9 = -[NSManagedObject objectID](object, "objectID");
  if (v9)
  {
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:]((uint64_t)self, (uint64_t)object, v9);
    if (object)
    {
LABEL_10:
      object->_cd_stateFlags |= 0x1000u;
      -[NSManagedObject awakeFromInsert](object, "awakeFromInsert");
      object->_cd_stateFlags &= ~0x1000u;
      return;
    }
  }

  else
  {
    CFMutableSetRef v10 = -[NSTemporaryObjectID initWithEntity:]( objc_alloc(&OBJC_CLASS___NSTemporaryObjectID),  "initWithEntity:",  -[NSManagedObject entity](object, "entity"));
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:]((uint64_t)self, (uint64_t)object, v10);

    if (object) {
      goto LABEL_10;
    }
  }

  [0 awakeFromInsert];
}

- (void)_insertObjectWithGlobalID:(void *)a3 globalID:
{
  if (a1)
  {
    if (a2)
    {
      -[NSManagedObjectContext _registerClearStateWithUndoManager](a1);
      int v6 = *(_DWORD *)(a2 + 16);
      if ((v6 & 0x80) != 0) {
        uint64_t v7 = 0LL;
      }
      else {
        uint64_t v7 = *(void *)(a2 + 32);
      }
      if (v7 != a1)
      {
        -[NSManagedObjectContext _registerObject:withID:](a1, a2, a3);
        int v6 = *(_DWORD *)(a2 + 16);
      }

      *(_DWORD *)(a2 + 16) = v6 | 2;
      _PFFaultHandlerFulfillFault(0LL, a2, a1, 0LL, 1);
      -[NSManagedObjectContext _establishEventSnapshotsForObject:](a1, (void *)a2);
      int v8 = *(_DWORD *)(a1 + 40);
      if ((v8 & 0x200) != 0 && (v8 & 0x100) == 0)
      {
        _PFFaultLogExcessivePrepareForPendingChangesAttempts();
        int v8 = *(_DWORD *)(a1 + 40);
      }

      *(_DWORD *)(a1 + 40) = v8 | 0x100;
      [*(id *)(a1 + 72) addObject:a2];
      -[NSManagedObjectContext _enqueueEndOfEventNotification](a1);
      if ((*(_BYTE *)(a1 + 41) & 4) == 0)
      {
        [(id)a1 willChangeValueForKey:@"hasChanges"];
        *(_DWORD *)(a1 + 40) |= 0x400u;
        [(id)a1 didChangeValueForKey:@"hasChanges"];
      }

      BOOL v9 = **(void ***)(a1 + 168);
      if (v9) {
        [v9 removeObject:a3];
      }
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"attempt to insert a null object into this context" userInfo:0]);
      -[NSManagedObjectContext deleteObject:](v10, v11, v12);
    }
  }

- (void)deleteObject:(NSManagedObject *)object
{
  if (!_PF_Threading_Debugging_level)
  {
    if (object) {
      goto LABEL_3;
    }
LABEL_14:
    int v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    int v8 = @"-deleteObject: requires a non-nil argument";
LABEL_15:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
LABEL_16:
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      _managedObjectContextFlags flags = self->_flags;
    }

    goto LABEL_10;
  }

  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!object) {
    goto LABEL_14;
  }
LABEL_3:
  if ((object->_cd_stateFlags & 0x80) != 0)
  {
    if (self) {
      return;
    }
  }

  else
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    if (cd_managedObjectContext != self)
    {
      if (!cd_managedObjectContext) {
        return;
      }
      int v6 = (void *)MEMORY[0x189603F70];
      uint64_t v7 = *MEMORY[0x189603A60];
      int v8 = @"An NSManagedObjectContext cannot delete objects in other contexts.";
      goto LABEL_15;
    }
  }

  -[NSManagedObjectContext _registerClearStateWithUndoManager]((uint64_t)self);
  object->_cd_stateFlags |= 4u;
  -[NSManagedObjectContext _establishEventSnapshotsForObject:]((uint64_t)self, object);
  _managedObjectContextFlags flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0) {
    goto LABEL_16;
  }
LABEL_10:
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&flags | 0x100);
  -[NSMutableSet addObject:](self->_unprocessedDeletes, "addObject:", object);
  -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
  if ((*((_BYTE *)&self->_flags + 1) & 4) == 0)
  {
    -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", @"hasChanges");
    *(_DWORD *)&self->_flags |= 0x400u;
    -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", @"hasChanges");
  }

  -[NSManagedObject prepareForDeletion](object, "prepareForDeletion");
}

- (uint64_t)_registerClearStateWithUndoManager
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 40) & 0x20) == 0)
    {
      uint64_t v2 = [MEMORY[0x189607968] numberWithShort:*(__int16 *)(result + 44)];
      double result = *(void *)(*(void *)(v1 + 168) + 40LL);
      if (result)
      {
        if (([(id)result groupsByEvent] & 1) == 0
          && ([*(id *)(*(void *)(v1 + 168) + 40) isUndoing] & 1) == 0
          && ([*(id *)(*(void *)(v1 + 168) + 40) isRedoing] & 1) == 0)
        {
          *(_DWORD *)(v1 + 40) |= 0x800u;
          [*(id *)(*(void *)(v1 + 168) + 40) beginUndoGrouping];
          *(_DWORD *)(v1 + 40) &= ~0x800u;
        }

        BOOL v3 = (void *)[*(id *)(v1 + 96) copy];
        uint64_t v4 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithObjects:", v2, v3, 0);

        double result = [*(id *)(*(void *)(v1 + 168) + 40) registerUndoWithTarget:v1 selector:sel__clearChangedThisTransaction_ object:v4];
      }

      *(_DWORD *)(v1 + 40) |= 0x20u;
    }
  }

  return result;
}

- (void)_establishEventSnapshotsForObject:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__establishEventSnapshotsForObject_);
    if (a2) {
      goto LABEL_4;
    }
LABEL_18:
    uint64_t v4 = 0LL;
LABEL_9:
    -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

    if (a2)
    {
      uint64_t v5 = a2[6];
      if (v5 && *(void *)(v5 + 16)) {
        return;
      }
      if (!v4)
      {
LABEL_15:
        int v6 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( a2,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  1);
LABEL_16:
        uint64_t v7 = v6;
        -[NSManagedObject _setLastSnapshot__:](a2, v6);

        return;
      }
    }

    else if (!v4)
    {
      int v6 = 0LL;
      goto LABEL_16;
    }

    -[NSManagedObject _setLastSnapshot__:](a2, v4);
    return;
  }

  if (!a2) {
    goto LABEL_18;
  }
LABEL_4:
  uint64_t v3 = a2[6];
  if (!v3 || !*(void *)(v3 + 8))
  {
    uint64_t v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( a2,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  1);
    goto LABEL_9;
  }

  if (!*(void *)(v3 + 16)) {
    goto LABEL_15;
  }
}

- (uint64_t)_enqueueEndOfEventNotification
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 40) & 9) == 0)
    {
      double result = [*(id *)(*(void *)(result + 168) + 40) groupsByEvent];
      if ((_DWORD)result) {
        double result = [*(id *)(*(void *)(v1 + 168) + 40) registerUndoWithTarget:v1 selector:sel__noop_ object:NSArray_EmptyArray];
      }
      *(_DWORD *)(v1 + 40) |= 1u;
    }
  }

  return result;
}

- (void)_prepareUnprocessedDeletionAfterRefresh:(_DWORD *)a1
{
  if (a1 && [a2 isDeleted])
  {
    int v3 = a1[10];
    if ((v3 & 0x200) != 0 && (v3 & 0x100) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      int v3 = a1[10];
    }

    a1[10] = v3 | 0x100;
    if ((v3 & 0x400) == 0)
    {
      [a1 willChangeValueForKey:@"hasChanges"];
      a1[10] |= 0x400u;
      [a1 didChangeValueForKey:@"hasChanges"];
    }
  }

- (BOOL)obtainPermanentIDsForObjects:(NSArray *)objects error:(NSError *)error
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (!self->_parentObjectStore) {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Context does not have a coordinator;  cannot obtain permenant ids without a coordinator.",
  }
                               0LL));
  uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (!v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( objects,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(objects);
          }
          uint64_t v13 = *(id **)(*((void *)&v22 + 1) + 8 * i);
          if ([v13[5] isTemporaryID]
            && (NSManagedObjectContext *)[v13 managedObjectContext] == self
            && ([v13 isDeleted] & 1) == 0)
          {
            [v9 addObject:v13];
          }
        }

        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( objects,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v10);
    }

    if (![v9 count])
    {

      return 1;
    }

    id v21 = 0LL;
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if ((v14 & 1) != 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      char v8 = [self->_parentObjectStore _parentObtainPermanentIDsForObjects:v9 context:self error:error];
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

      return v8;
    }

    id v15 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v16 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    BOOL v17 = -[NSPersistentStoreCoordinator obtainPermanentIDsForObjects:error:]( v16,  "obtainPermanentIDsForObjects:error:",  v9,  &v21);
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

    id v18 = v21;
    [v15 drain];
    if (!v21) {
      return v17;
    }
    id v19 = v21;
    if (error) {
      *error = (NSError *)v21;
    }
    return 0;
  }

  if (!error) {
    return 0;
  }
  char v8 = 0;
  *error = (NSError *)v7;
  return v8;
}

- (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  if (a1) {
    +[NSManagedObjectContext _handleError:withError:]((uint64_t)&OBJC_CLASS___NSManagedObjectContext, a2, a3);
  }
  return 0LL;
}

- (void)_thereIsNoSadnessLikeTheDeathOfOptimism
{
  if (a1)
  {
    objc_opt_class();
    _NSCoreDataLog( 1LL,  (uint64_t)@"fatal: Unable to recover from optimistic locking failure.\n",  v1,  v2,  v3,  v4,  v5,  v6,  vars0);
    __break(1u);
  }

- (uint64_t)_generateOptLockExceptionForConstraintFailure:(uint64_t)result
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if ([a2 code] == 1551)
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"Conflicts");
      uint64_t v4 = *MEMORY[0x189603A58];
      uint64_t v11 = @"conflictList";
      uint64_t v12 = v3;
      uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      uint64_t v6 = @"constraint validation failure";
      uint64_t v7 = &OBJC_CLASS____NSCoreDataOptimisticLockingException;
      uint64_t v8 = v4;
    }

    else
    {
      id v9 = (__objc2_class *)MEMORY[0x189603F70];
      uint64_t v10 = *MEMORY[0x189603A58];
      uint64_t v13 = *MEMORY[0x189607798];
      v14[0] = a2;
      uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v6 = @"Attempting to generate a constraint exception for non constraint error.";
      uint64_t v7 = v9;
      uint64_t v8 = v10;
    }

    return -[__objc2_class exceptionWithName:reason:userInfo:](v7, "exceptionWithName:reason:userInfo:", v8, v6, v5);
  }

  return result;
}

- (void)_advanceQueryGenerationForSave
{
  if (a1)
  {
    uint64_t v2 = [a1 _retainedCurrentQueryGeneration:a1[20]];
    if (v2)
    {
      [a1 _setQueryGenerationFromToken:v2 error:0];
      char v3 = 1;
      uint64_t v4 = (void *)v2;
    }

    else
    {
      char v3 = 0;
      uint64_t v4 = 0LL;
    }

    if ((v3 & 1) == 0) {
      objc_msgSend( a1,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken unpinnedQueryGenerationToken]( NSQueryGenerationToken,  "unpinnedQueryGenerationToken"),  0);
    }
  }

- (BOOL)save:(NSError *)error
{
  v66[2] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if ((*(_WORD *)&self->_flags & 0x8080) != 0)
  {
    if (error)
    {
      v65[0] = @"message";
      v65[1] = @"stack trace";
      v66[0] = @"attempt to recursively call -save: on the context aborted";
      v66[1] = [MEMORY[0x189607A40] callStackSymbols];
      uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:2];
      uint64_t v6 = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:132001 userInfo:v5];
LABEL_9:
      BOOL v8 = 0;
      *error = v6;
      return v8;
    }

    return 0;
  }

  uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      uint64_t v6 = v7;
      goto LABEL_9;
    }

    return 0;
  }

  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  id v63 = 0LL;
  _managedObjectContextFlags flags = self->_flags;
  id v10 = objc_alloc_init(MEMORY[0x1896077E8]);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v11 & 1) == 0) {
    [self->_additionalPrivateIvars[12] _isEnabled];
  }
  *(_DWORD *)&self->_flags |= 0x8000u;
  uint64_t v54 = v10;
  uint64_t v55 = error;
  char v53 = (char)flags;
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0LL);
  _managedObjectContextFlags v12 = self->_flags;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSManagingContextWillSaveChangesNotification",  self,  0);
    _managedObjectContextFlags v12 = self->_flags;
  }

  if (error)
  {
    _managedObjectContextFlags v12 = (_managedObjectContextFlags)(*(_DWORD *)&v12 | 4);
    self->__managedObjectContextFlags flags = v12;
    uint64_t v13 = &v63;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&v12 | 0x80);
  -[NSManagedObjectContext _prepareForPushChanges:]((uint64_t)self, v13);
  if (!v14)
  {
    int v43 = 0;
    int v44 = 0;
    uint64_t v56 = 0LL;
    int v37 = 1;
    goto LABEL_70;
  }

  ++self->_ignoreChangeNotification;
  uint64_t v56 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)self);
  uint64_t v15 = 0LL;
  int v57 = 0;
  char v16 = 1;
  while ((v16 & 1) != 0)
  {
    id v63 = 0LL;
    if ((v57 & 1) == 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      int v57 = 1;
    }

    id v17 = objc_alloc_init(MEMORY[0x1896077E8]);
    ++v15;
    if (-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
    {
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v18 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
      if (v18 && (uint64_t modelMap = v18->_modelMap) != 0LL) {
        models = modelMap->_models;
      }
      else {
        models = 0LL;
      }
      uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( models,  "countByEnumeratingWithState:objects:count:",  &v59,  v64,  16LL);
      if (v21)
      {
        uint64_t v22 = *(void *)v60;
        while (2)
        {
          for (uint64_t i = 0LL; i != v21; ++i)
          {
            if (*(void *)v60 != v22) {
              objc_enumerationMutation(models);
            }
            if ((-[NSManagedObjectModel _hasEntityWithUniquenessConstraints](*(void *)(*((void *)&v59 + 1) + 8 * i)) & 1) != 0)
            {
              int hasEntityWithUniqueness = 1;
              goto LABEL_39;
            }
          }

          uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( models,  "countByEnumeratingWithState:objects:count:",  &v59,  v64,  16LL);
          int hasEntityWithUniqueness = 0;
          if (v21) {
            continue;
          }
          break;
        }
      }

      else
      {
        int hasEntityWithUniqueness = 0;
      }
    }

    else
    {
      int hasEntityWithUniqueness = -[NSManagedObjectModel _hasEntityWithUniquenessConstraints]((uint64_t)-[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"), "managedObjectModel"));
    }

- (void)_prepareForPushChanges:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 discardEditing];
    unsigned int v4 = *(_DWORD *)(a1 + 40);
    if (((v4 >> 1) & 1) == 0) {
      *(_DWORD *)(a1 + 40) = v4 | 2;
    }
    int v5 = (v4 >> 1) & 1;
    -[NSManagedObjectContext _processRecentChanges:](a1, a2);
    if ((v6 & 1) == 0)
    {
      *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFDF5 | (2 * v5);
      return;
    }

    [*(id *)(*(void *)(a1 + 168) + 40) disableUndoRegistration];
    int v7 = 0;
    int v8 = 1;
    while (1)
    {
      if (v7)
      {
        -[NSManagedObjectContext _processRecentChanges:](a1, a2);
        if (!v9)
        {
LABEL_29:
          [*(id *)(*(void *)(a1 + 168) + 40) enableUndoRegistration];
          *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFDF5 | (2 * v5);
          return;
        }
      }

      unsigned int v10 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(a1 + 40) = v10 | 8;
      int v11 = (v10 >> 2) & 1;
      char v16 = 0LL;
      if (-[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]( (char *)a1,  *(void **)(a1 + 88),  2,  (uint64_t *)&v16,  v11,  1))
      {
        int v12 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]( (char *)a1,  *(void **)(a1 + 80),  0,  (uint64_t *)&v16,  (v10 >> 2) & 1,  1);
        if ((v10 & 4) == 0) {
          goto LABEL_12;
        }
      }

      else
      {
        int v12 = 0;
        if ((v10 & 4) == 0)
        {
LABEL_12:
          if (!v12) {
            goto LABEL_20;
          }
        }
      }

      if ([*(id *)(a1 + 96) count])
      {
        if ([*(id *)(a1 + 88) count] || objc_msgSend(*(id *)(a1 + 80), "count"))
        {
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:*(void *)(a1 + 96)];
          [v13 minusSet:*(void *)(a1 + 88)];
          [v13 minusSet:*(void *)(a1 + 80)];
        }

        else
        {
          uint64_t v13 = *(void **)(a1 + 96);
          id v15 = v13;
        }

        if (v12) {
          int v12 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]( (char *)a1,  v13,  1,  (uint64_t *)&v16,  v11,  1);
        }
      }

- (NSSaveChangesRequest)_newSaveRequestForCurrentState
{
  if (!a1) {
    return 0LL;
  }
  if ([*(id *)(a1 + 80) count]) {
    uint64_t v2 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v2 = 0LL;
  }
  if ([*(id *)(a1 + 96) count]) {
    uint64_t v3 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if ([*(id *)(a1 + 88) count]) {
    uint64_t v4 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v4 = 0LL;
  }
  if ([*(id *)(a1 + 104) count])
  {
    int v5 = -[NSManagedObjectContext _newUnchangedLockedObjects](a1);
    if ([v5 count]) {
      char v6 = v5;
    }
    else {
      char v6 = 0LL;
    }
  }

  else
  {
    char v6 = 0LL;
    int v5 = 0LL;
  }

  int v7 = -[NSSaveChangesRequest initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:]( objc_alloc(&OBJC_CLASS___NSSaveChangesRequest),  "initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:",  v2,  v3,  v4,  v6);
  int v8 = v7;
  if ((*(_BYTE *)(a1 + 43) & 2) != 0) {
    -[NSSaveChangesRequest _setSecureOperation:](v7, "_setSecureOperation:", 1LL);
  }
  if (v5) {

  }
  return v8;
}

- (void)_didSaveChanges
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  CFMutableSetRef v81 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:5];
  uint64_t v2 = *(void **)(*(void *)(a1 + 168) + 136LL);
  if ([v2 count])
  {
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v102;
      do
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v102 != v4) {
            objc_enumerationMutation(v2);
          }
          char v6 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          int v7 = (void *)objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v6, "firstObject"));
          int v8 = v7;
          if (v7)
          {
            int v9 = (void *)[v7 entity];
            uint64_t v10 = [v6 objectAtIndex:1];
            if (v9)
            {
              if (objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v10))
              {
                [v6 lastObject];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0) {
                  uint64_t v11 = 0LL;
                }
                else {
                  uint64_t v11 = [v6 lastObject];
                }
                objc_msgSend(v8, "setValue:forKey:", v11, objc_msgSend(v6, "objectAtIndex:", 1));
              }
            }
          }
        }

        uint64_t v3 = [v2 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }

      while (v3);
    }

    *(_DWORD *)(a1 + 40) &= 0xFFFFFCFF;
  }

  int v12 = *(void **)(*(void *)(a1 + 168) + 144LL);
  if ([v12 count])
  {
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v98;
      do
      {
        for (uint64_t j = 0LL; j != v13; ++j)
        {
          if (*(void *)v98 != v14) {
            objc_enumerationMutation(v12);
          }
          char v16 = *(void **)(*((void *)&v97 + 1) + 8 * j);
          id v17 = (void *)objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v16, "firstObject"));
          id v18 = v17;
          if (v17)
          {
            id v19 = (void *)[v17 entity];
            uint64_t v20 = [v16 objectAtIndex:1];
            if (v19)
            {
              if (objc_msgSend((id)objc_msgSend(v19, "propertiesByName"), "objectForKey:", v20))
              {
                [v16 lastObject];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0) {
                  uint64_t v21 = 0LL;
                }
                else {
                  uint64_t v21 = [v16 lastObject];
                }
                objc_msgSend(v18, "setValue:forKey:", v21, objc_msgSend(v16, "objectAtIndex:", 1));
              }
            }
          }
        }

        uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v108 count:16];
      }

      while (v13);
    }

    *(_DWORD *)(a1 + 40) &= 0xFFFFFCFF;
  }

  uint64_t v22 = (void *)[*(id *)(a1 + 80) copy];
  unint64_t v84 = [v22 count];
  CFMutableSetRef v78 = v76;
  MEMORY[0x1895F8858](v84);
  char v25 = (uint64_t *)&v76[-v24];
  if (v26 >= 0x201)
  {
    char v83 = (uint64_t *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 80) getObjects:v83];
  }

  else
  {
    bzero(&v76[-v24], 8 * v23);
    uint64_t v27 = *(void **)(a1 + 80);
    char v83 = v25;
    [v27 getObjects:v25];
    if (!v84)
    {
      int v79 = 1;
      goto LABEL_41;
    }
  }

  uint64_t v28 = 0LL;
  do
  {
    id v29 = (void *)v83[v28];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v29);
    objc_msgSend(v29, "_setVersionReference__:", 1);
    ++v28;
  }

  while (v84 != v28);
  int v79 = 0;
LABEL_41:
  [v81 setObject:v22 forKey:@"inserted"];

  unint64_t v30 = [*(id *)(a1 + 96) count];
  __int128 v31 = (void *)[*(id *)(a1 + 96) copy];
  MEMORY[0x1895F8858](v31);
  uint64_t v34 = (uint64_t *)&v76[-v33];
  if (v30 >= 0x201)
  {
    CFMutableSetRef v82 = (uint64_t *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 96) getObjects:v82];
  }

  else
  {
    bzero(&v76[-v33], 8 * v32);
    unint64_t v35 = *(void **)(a1 + 96);
    CFMutableSetRef v82 = v34;
    [v35 getObjects:v34];
    if (!v30)
    {
      int v77 = 1;
      goto LABEL_48;
    }
  }

  for (uint64_t k = 0LL; k != v30; ++k)
  {
    int v37 = (void *)v82[k];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v37);
    objc_msgSend(v37, "_setVersionReference__:", objc_msgSend(v37, "_versionReference") + 1);
  }

  int v77 = 0;
LABEL_48:
  [v81 setObject:v31 forKey:@"updated"];

  unint64_t v38 = [*(id *)(a1 + 88) count];
  unint64_t v39 = MEMORY[0x1895F8858](v38);
  uint64_t v42 = &v76[-v41];
  if (v39 >= 0x201)
  {
    uint64_t v42 = (_BYTE *)NSAllocateScannedUncollectable();
LABEL_52:
    id v80 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v38];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 88), "allObjects"), "getObjects:range:", v42, 0, v38);
    int v43 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v42 count:v38];
    [v81 setObject:v43 forKey:@"deleted"];

    uint64_t v44 = 0LL;
    do
      -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](*(void **)&v42[8 * v44++]);
    while (v38 != v44);
    goto LABEL_54;
  }

  bzero(&v76[-v41], 8 * v40);
  if (v38) {
    goto LABEL_52;
  }
  id v80 = 0LL;
LABEL_54:
  -[NSManagedObjectContext _clearInsertions](a1);
  -[NSManagedObjectContext _clearUnprocessedInsertions](a1);
  -[NSManagedObjectContext _clearDeletions](a1);
  -[NSManagedObjectContext _clearUnprocessedDeletions](a1);
  -[NSManagedObjectContext _clearUpdates](a1);
  -[NSManagedObjectContext _clearUnprocessedUpdates](a1);
  int v45 = *(_DWORD *)(a1 + 40);
  ++*(_WORD *)(a1 + 44);
  *(_DWORD *)(a1 + 40) = v45 & 0xFFFFFFDF;
  [*(id *)(a1 + 104) removeAllObjects];
  [*(id *)(a1 + 112) removeAllObjects];

  **(void **)(a1 + 168) = 0LL;
  if ((*(_BYTE *)(a1 + 41) & 4) != 0)
  {
    [(id)a1 willChangeValueForKey:@"hasChanges"];
    *(_DWORD *)(a1 + 40) &= ~0x400u;
    [(id)a1 didChangeValueForKey:@"hasChanges"];
  }

  id v46 = (void *)[v81 objectForKey:@"inserted"];
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v94;
    do
    {
      for (uint64_t m = 0LL; m != v47; ++m)
      {
        if (*(void *)v94 != v48) {
          objc_enumerationMutation(v46);
        }
        id v50 = *(_DWORD **)(*((void *)&v93 + 1) + 8 * m);
        uint64_t v51 = v50 + 4;
        v50[4] |= 0x10u;
        [v50 didSave];
        *v51 &= ~0x10u;
      }

      uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
    }

    while (v47);
  }

  __int128 v52 = (void *)[v81 objectForKey:@"deleted"];
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v89 objects:v106 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v90;
    do
    {
      for (uint64_t n = 0LL; n != v53; ++n)
      {
        if (*(void *)v90 != v54) {
          objc_enumerationMutation(v52);
        }
        uint64_t v56 = *(_DWORD **)(*((void *)&v89 + 1) + 8 * n);
        int v57 = v56 + 4;
        v56[4] |= 0x20u;
        [v56 didSave];
        *v57 &= ~0x20u;
      }

      uint64_t v53 = [v52 countByEnumeratingWithState:&v89 objects:v106 count:16];
    }

    while (v53);
  }

  __int16 v58 = (void *)[v81 objectForKey:@"updated"];
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v86;
    do
    {
      for (iuint64_t i = 0LL; ii != v59; ++ii)
      {
        if (*(void *)v86 != v60) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v85 + 1) + 8 * ii) didSave];
      }

      uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
    }

    while (v59);
  }

  if ([*(id *)(*(void *)(a1 + 168) + 96) _isEnabled])
  {
    __int128 v62 = *(NSQueryGenerationToken **)(*(void *)(a1 + 168) + 96LL);
    if (v62 != +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken")) {
      [v81 setValue:*(void *)(*(void *)(a1 + 168) + 96) forKey:@"newQueryGeneration"];
    }
  }

  uint64_t v63 = *(void *)(*(void *)(a1 + 168) + 120LL);
  if (v63) {
    [v81 setValue:v63 forKey:@"newChangeToken"];
  }
  if (byte_18C4ABDBE)
  {
    id v64 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)&OBJC_CLASS____PFWeakReference, a1);
    [v81 setValue:v64 forKey:@"managedObjectContext"];
  }

  if ((*(_BYTE *)(a1 + 42) & 2) != 0) {
    -[NSManagedObjectContext _postContextDidSaveNotificationWithUserInfo:](a1, v81);
  }

  if ((v79 & 1) == 0)
  {
    id v65 = v83;
    unint64_t v66 = v84;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v65++);
      --v66;
    }

    while (v66);
  }

  if (v84 >= 0x201) {
    NSZoneFree(0LL, v83);
  }
  if ((v77 & 1) == 0)
  {
    id v67 = v82;
    unint64_t v68 = v30;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v67++);
      --v68;
    }

    while (v68);
  }

  if (v30 >= 0x201) {
    NSZoneFree(0LL, v82);
  }
  if (v38)
  {
    for (juint64_t j = 0LL; jj != v38; ++jj)
    {
      uint64_t v70 = *(_BYTE **)&v42[8 * jj];
      v71 = (void *)[v70 objectID];
      if (v70)
      {
        if ((v70[17] & 2) != 0)
        {
          v72 = v71;
          if (([v71 isTemporaryID] & 1) == 0) {
            [v80 addObject:v72];
          }
        }
      }

      if (v70) {
        uint64_t v73 = _insertion_fault_handler;
      }
      else {
        uint64_t v73 = 0LL;
      }
      -[NSFaultHandler turnObject:intoFaultWithContext:](v73, (uint64_t)v70, a1);
      [(id)a1 _forgetObject:v70 propagateToObjectStore:0 removeFromRegistry:1];
    }

    if (v38 >= 0x201) {
      NSZoneFree(0LL, v42);
    }
  }

  if ([v80 count])
  {
    -[NSManagedObjectContext lockObjectStore](a1);
    id v74 = *(void **)(a1 + 32);
    uint64_t v75 = [(id)a1 _queryGenerationToken];
    [v74 managedObjectContextDidUnregisterObjectsWithIDs:v80 generation:v75];
    -[NSManagedObjectContext unlockObjectStore](a1);
  }
}

void __31__NSManagedObjectContext_save___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3[21] + 96LL) == v2)
  {
    objc_msgSend( v3,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  0);
    uint64_t v2 = *(void **)(a1 + 40);
  }
}

- (NSManagedObject)objectWithID:(NSManagedObjectID *)objectID
{
  uint64_t v3 = objectID;
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID) {
      goto LABEL_3;
    }
LABEL_16:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil is not a valid object ID" userInfo:0]);
    int v12 = v11;
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v12);
  }

  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!v3) {
    goto LABEL_16;
  }
LABEL_3:
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v5 & 1) == 0) {
    return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0LL, 1);
  }
  Value = -[NSManagedObjectContext objectRegisteredForID:](self, "objectRegisteredForID:", v3);
  if (!Value)
  {
    if (-[NSManagedObjectID isTemporaryID](v3, "isTemporaryID"))
    {
      uint64_t v15 = 0LL;
      char v16 = &v15;
      uint64_t v17 = 0x3052000000LL;
      id v18 = __Block_byref_object_copy__11;
      id v19 = __Block_byref_object_dispose__11;
      uint64_t v20 = 0LL;
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      id parentObjectStore = self->_parentObjectStore;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      void v14[2] = __39__NSManagedObjectContext_objectWithID___block_invoke;
      v14[3] = &unk_189EA8358;
      v14[5] = v3;
      v14[6] = &v15;
      v14[4] = self;
      _perform((unint64_t)parentObjectStore, (uint64_t)v14);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      if (v16[5]) {
        uint64_t v3 = (NSManagedObjectID *)v16[5];
      }
      goto LABEL_12;
    }

    uint64_t v15 = 0LL;
    char v16 = &v15;
    uint64_t v17 = 0x3052000000LL;
    id v18 = __Block_byref_object_copy__11;
    id v19 = __Block_byref_object_dispose__11;
    uint64_t v20 = 0LL;
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    id v8 = self->_parentObjectStore;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __39__NSManagedObjectContext_objectWithID___block_invoke_2;
    v13[3] = &unk_189EA8358;
    v13[5] = v3;
    v13[6] = &v15;
    v13[4] = self;
    _perform((unint64_t)v8, (uint64_t)v13);
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    int v9 = (void *)v16[5];
    if (!v9 || (Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v9)) == 0LL)
    {
LABEL_12:
      _Block_object_dispose(&v15, 8);
      return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0LL, 1);
    }

    _Block_object_dispose(&v15, 8);
  }

  return Value;
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(id **)(*(void *)(*(void *)(*(void *)(result + 32) + 32LL) + 168LL) + 8LL);
  if (v1)
  {
    uint64_t v2 = result;
    BOOL result = [*v1 objectForKey:*(void *)(result + 40)];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8LL) + 40LL) = result;
  }

  return result;
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(*(void *)(result + 32) + 32LL) + 168LL) + 8LL);
  if (v1)
  {
    uint64_t v2 = result;
    BOOL result = [*(id *)(v1 + 8) objectForKey:*(void *)(result + 40)];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8LL) + 40LL) = result;
  }

  return result;
}

- (NSManagedObject)existingObjectWithID:(NSManagedObjectID *)objectID error:(NSError *)error
{
  v35[1] = *MEMORY[0x1895F89C0];
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID) {
      goto LABEL_3;
    }
LABEL_27:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil is not a valid object ID" userInfo:0]);
  }

  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!objectID) {
    goto LABEL_27;
  }
LABEL_3:
  int v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      id v8 = v7;
LABEL_16:
      uint64_t v10 = 0LL;
      *error = v8;
      return v10;
    }

    return 0LL;
  }

  if (!-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID"))
  {
    char v16 = (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, objectID, error, 0);
    if (v16)
    {
      uint64_t v17 = v16;
      id v29 = 0LL;
      -[NSFaultHandler fulfillFault:withContext:error:](_insertion_fault_handler, v16, (uint64_t)self, (id *)&v29);
      uint64_t v10 = v18;
      if (v18 == v17) {
        id v19 = v17;
      }
      else {

      }
      if (v29)
      {
        if (error)
        {
          uint64_t v10 = 0LL;
          *error = v29;
          return v10;
        }
      }

      else
      {
        if (v10) {
          return v10;
        }
        uint64_t v20 = [NSString stringWithUTF8String:"existingObjectWithID incorrectly returned nil without an error set for objectID %@"];
        _NSCoreDataLog(17LL, v20, v21, v22, v23, v24, v25, v26, (uint64_t)objectID);
        uint64_t v27 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = objectID;
          _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: existingObjectWithID incorrectly returned nil without an error set for objectID %@",  buf,  0xCu);
        }
      }

      return 0LL;
    }

    if (!error) {
      return 0LL;
    }
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607460];
    unint64_t v30 = @"objectID";
    __int128 v31 = objectID;
    uint64_t v13 = (void *)MEMORY[0x189603F68];
    uint64_t v14 = &v31;
    uint64_t v15 = &v30;
LABEL_15:
    id v8 = (NSError *)objc_msgSend( v11,  "errorWithDomain:code:userInfo:",  v12,  133000,  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    goto LABEL_16;
  }

  int v9 = -[NSManagedObjectContext objectRegisteredForID:](self, "objectRegisteredForID:", objectID);
  uint64_t v10 = v9;
  if (error && !v9)
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607460];
    uint64_t v34 = @"objectID";
    v35[0] = objectID;
    uint64_t v13 = (void *)MEMORY[0x189603F68];
    uint64_t v14 = (NSManagedObjectID **)v35;
    uint64_t v15 = &v34;
    goto LABEL_15;
  }

  return v10;
}

- (uint64_t)_checkObjectForExistenceAndCacheRow:(uint64_t)a1
{
  uint64_t v4 = (void *)[(id)a2 objectID];
  int v5 = *(_DWORD *)(a2 + 16);
  if ([v4 isTemporaryID])
  {
    if (!*(void *)(a2 + 32) || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 48)), (v6 & 1) == 0))
    {
      uint64_t v12 = 0LL;
      [(id)a1 stalenessInterval];
      return [(id)a2 isFault];
    }
  }

  uint64_t v12 = 0LL;
  [(id)a1 stalenessInterval];
  if ((v5 & 0x12) != 0) {
    return [(id)a2 isFault];
  }
  uint64_t v9 = v7;
  *(void *)(a1 + 144) = 0LL;
  -[NSManagedObjectContext lockObjectStore](a1);
  uint64_t v10 = (void *)[*(id *)(a1 + 32) newValuesForObjectWithID:v4 withContext:a1 error:&v12];
  if (v10)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  *(void *)(a1 + 144) = v9;

  -[NSManagedObjectContext unlockObjectStore](a1);
  return v8;
}

- (NSPersistentStoreResult)executeRequest:(NSPersistentStoreRequest *)request error:(NSError *)error
{
  uint64_t v132 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      uint64_t v8 = v7;
LABEL_6:
      uint64_t v9 = 0LL;
LABEL_7:
      *error = v8;
      return v9;
    }

    return 0LL;
  }

  NSPersistentStoreRequestType v10 = -[NSPersistentStoreRequest requestType](request, "requestType");
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSPersistentStoreRequest _resolveEntityWithContext:](request, "_resolveEntityWithContext:", self);
  }
  if (v10 == NSSaveRequestType)
  {
    if (error)
    {
      uint64_t v8 = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03748];
      goto LABEL_6;
    }

    return 0LL;
  }

  if (v10 != NSFetchRequestType) {
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (_PF_Threading_Debugging_level) {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__executeAsynchronousFetchRequest_);
      }
      uint64_t v28 = (void *)-[NSPersistentStoreRequest fetchRequest](request, "fetchRequest");
      uint64_t v118 = 0LL;
      uint64_t v114 = 0LL;
      CFSetCallBacks v115 = &v114;
      uint64_t v116 = 0x2020000000LL;
      uint64_t v117 = &v118;
      [v28 _resolveEntityWithContext:self];
      if ([v28 entity])
      {
        if (self->_dispatchQueue)
        {
          uint64_t v29 = [v28 resultType];
          if (v29 == 4)
          {
            NSUInteger v30 = -[NSManagedObjectContext countForFetchRequest:error:]( self,  "countForFetchRequest:error:",  v28,  v115[3]);
            if (v30 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v9 = 0LL;
            }

            else
            {
              uint64_t v74 = [MEMORY[0x189607968] numberWithUnsignedInteger:v30];
              uint64_t v9 = (NSPersistentStoreResult *)[MEMORY[0x189603F18] arrayWithObject:v74];
            }
          }

          else
          {
            id v65 = objc_alloc_init(MEMORY[0x1896077E8]);
            if (-[NSManagedObjectContext hasChanges](self, "hasChanges")
              && ((int v66 = [v28 includesPendingChanges], v29 != 2) ? (v67 = v66) : (v67 = 0), v67 == 1))
            {
              if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((BOOL)self)) {
                -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0LL);
              }
              char v68 = 1;
            }

            else
            {
              char v68 = 0;
            }

            uint64_t v69 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, v28);
            v113[0] = 0LL;
            v113[1] = v113;
            v113[2] = (id)0x3052000000LL;
            v113[3] = __Block_byref_object_copy__11;
            v113[4] = __Block_byref_object_dispose__11;
            v113[5] = 0LL;
            BOOL v70 = [v69 resultType] == 0;
            char v104 = [v69 includesPropertyValues];
            v112[0] = 0LL;
            v112[1] = v112;
            v112[2] = 0x3052000000LL;
            v112[3] = __Block_byref_object_copy__11;
            v112[4] = __Block_byref_object_dispose__11;
            v112[5] = 0LL;
            [v65 drain];
            v71 = (void *)[MEMORY[0x1896079E0] currentProgress];
            if (v71
              && (v71 = (void *)[objc_alloc(MEMORY[0x1896079E0]) initWithParent:v71 userInfo:0]) != 0)
            {
              if (-[NSPersistentStoreRequest estimatedResultCount](request, "estimatedResultCount") < 1) {
                uint64_t v72 = -1LL;
              }
              else {
                uint64_t v72 = -[NSPersistentStoreRequest estimatedResultCount](request, "estimatedResultCount");
              }
              [v71 setTotalUnitCount:v72];
              [v71 setKind:@"managed objects"];
              char v73 = 0;
            }

            else
            {
              char v73 = 1;
            }

            uint64_t v106 = 0LL;
            __int128 v107 = &v106;
            uint64_t v108 = 0x3052000000LL;
            __int128 v109 = __Block_byref_object_copy__11;
            uint64_t v110 = __Block_byref_object_dispose__11;
            id v111 = -[NSAsynchronousFetchResult initForFetchRequest:withContext:andProgress:completetionBlock:]( objc_alloc(&OBJC_CLASS___NSAsynchronousFetchResult),  "initForFetchRequest:withContext:andProgress:completetionBlock:",  request,  self,  v71,  -[NSPersistentStoreRequest completionBlock](request, "completionBlock"));
            [v69 _setAsyncResultHandle:v107[5]];
            uint64_t v95 = MEMORY[0x1895F87A8];
            if ((v73 & 1) == 0)
            {
              id v96 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)&OBJC_CLASS____PFWeakReference, v107[5]);
              v105[0] = v95;
              v105[1] = 3221225472LL;
              v105[2] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke;
              v105[3] = &unk_189EA7758;
              v105[4] = v96;
              [v71 setCancellationHandler:v105];
            }

            id parentObjectStore = self->_parentObjectStore;
            *(void *)buf = v95;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2;
            v120 = &unk_189EA83D0;
            id v121 = self;
            int v122 = v69;
            v125 = v112;
            v126 = v113;
            id v127 = &v114;
            id v128 = &v106;
            char v129 = v68;
            uint64_t v123 = request;
            int v124 = v28;
            BOOL v130 = v70;
            char v131 = v104;
            [parentObjectStore performBlock:buf];
            uint64_t v9 = (NSPersistentStoreResult *)v107[5];
            _Block_object_dispose(&v106, 8);
            _Block_object_dispose(v112, 8);
            _Block_object_dispose(v113, 8);
          }

          _Block_object_dispose(&v114, 8);
          return v9;
        }

        __int128 v99 = (void *)MEMORY[0x189603F70];
        uint64_t v100 = [NSString stringWithFormat:@"NSConfinementConcurrencyType context %@ cannot support asynchronous fetch request %@.", self, request];
      }

      else
      {
        __int128 v99 = (void *)MEMORY[0x189603F70];
        uint64_t v100 = [NSString stringWithFormat:@"%@ A fetch request must have an entity.", NSStringFromSelector(sel__executeAsynchronousFetchRequest_)];
      }

      objc_exception_throw((id)[v99 exceptionWithName:*MEMORY[0x189603A60] reason:v100 userInfo:0]);
      __break(1u);
      JUMPOUT(0x186755388LL);
    }

- (void)_countForFetchRequest_:(id *)a3 error:
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__countForFetchRequest__error_);
    }
    int v5 = *(void **)(*(void *)(a1 + 168) + 152LL);
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
    }

    else
    {
      [a2 _resolveEntityWithContext:a1];
      if (![(id)a1 hasChanges]
        || ![a2 includesPendingChanges]
        || [a2 resultType] == 2)
      {
        -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)a1, a2, a3);
        return;
      }

      if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch](a1)) {
        -[NSManagedObjectContext _processRecentChanges:](a1, 0LL);
      }
      uint64_t v60 = a1;
      unsigned __int8 v6 = (void *)[a2 affectedStores];
      uint64_t v7 = (void *)[a2 entity];
      uint64_t v59 = a2;
      if (objc_msgSend((id)objc_msgSend(v7, "subentitiesByName"), "count")) {
        int v8 = [a2 includesSubentities];
      }
      else {
        int v8 = 0;
      }
      uint64_t v9 = 0LL;
      NSPersistentStoreRequestType v10 = 0LL;
      callBacks.versiouint64_t n = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
      uint64_t v11 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      callBacks.equal = 0LL;
      callBacks.hash = 0LL;
      callBacks.copyDescriptiouint64_t n = v11;
      uint64_t v12 = *(void *)(v60 + 56);
      v93[0] = *(void *)(v60 + 96);
      v93[1] = v12;
      allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
      char v13 = 1;
      do
      {
        uint64_t v14 = (void *)v93[v9];
        char v65 = v13;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v92 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v74;
          do
          {
            for (uint64_t i = 0LL; i != v15; ++i)
            {
              if (*(void *)v74 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              if (!v6
                || objc_msgSend( v6,  "indexOfObjectIdenticalTo:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * i), "objectID"),  "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v19 = [v18 entity];
                if ((void *)v19 == v7 || v8 && [v7 _subentitiesIncludes:v19])
                {
                  if (!v10) {
                    NSPersistentStoreRequestType v10 = CFSetCreateMutable(allocator, 0LL, &callBacks);
                  }
                  CFSetAddValue(v10, v18);
                }
              }
            }

            uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v92 count:16];
          }

          while (v15);
        }

        char v13 = 0;
        uint64_t v9 = 1LL;
      }

      while ((v65 & 1) != 0);
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      uint64_t v20 = *(void **)(v60 + 88);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v69 objects:v91 count:16];
      if (v21)
      {
        cf = 0LL;
        uint64_t v22 = *(void *)v70;
        do
        {
          for (uint64_t j = 0LL; j != v21; ++j)
          {
            if (*(void *)v70 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            uint64_t v25 = [v24 entity];
            if ((void *)v25 == v7 || v8 && [v7 _subentitiesIncludes:v25])
            {
              uint64_t v26 = cf;
              if (!cf) {
                uint64_t v26 = CFSetCreateMutable(allocator, 0LL, &callBacks);
              }
              cf = v26;
              CFSetAddValue(v26, v24);
            }
          }

          uint64_t v21 = [v20 countByEnumeratingWithState:&v69 objects:v91 count:16];
        }

        while (v21);
      }

      else
      {
        cf = 0LL;
      }

      if (-[__CFSet count](v10, "count") || -[__CFSet count](cf, "count"))
      {
        [v59 fetchLimit];
        id v90 = 0LL;
        if (![v59 entity])
        {
          uint64_t v57 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"%@ A fetch request must have an entity.", NSStringFromSelector(sel__countWithMergedChangesForRequest_possibleChanges_possibleDeletes_error_)), 0 reason userInfo];
          objc_exception_throw(v57);
          __break(1u);
          return;
        }

        id v27 = objc_alloc_init(MEMORY[0x1896077E8]);
        if ([(id)v60 hasChanges]
          && [v59 includesPendingChanges]
          && [v59 resultType] != 2
          && !-[NSManagedObjectContext _attemptCoalesceChangesForFetch](v60))
        {
          -[NSManagedObjectContext _processRecentChanges:](v60, 0LL);
        }

        uint64_t v28 = (void *)[v59 copy];
        -[NSManagedObjectContext _unlimitRequest:](v28);
        [v28 setIncludesPropertyValues:0];
        [v28 setResultType:1];
        [v28 setSortDescriptors:0];
        -[NSManagedObjectContext lockObjectStore](v60);
        uint64_t v29 = (void *)[*(id *)(v60 + 32) executeRequest:v28 withContext:v60 error:&v90];
        id v30 = v90;
        id v31 = v29;

        [v27 drain];
        -[NSManagedObjectContext unlockObjectStore](v60);
        if (v90)
        {
          id v32 = v90;
          if (a3) {
            *a3 = v90;
          }
        }

        else if (v29)
        {
          uint64_t v63 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:v29];

          id v58 = objc_alloc_init(MEMORY[0x1896077E8]);
          uint64_t v33 = [v59 predicate];
          uint64_t v34 = (void *)[v59 affectedStores];
          unint64_t v35 = (void *)[v59 entity];
          if (objc_msgSend((id)objc_msgSend(v35, "subentitiesByName"), "count")) {
            int allocatora = [v59 includesSubentities];
          }
          else {
            int allocatora = 0;
          }
          if (v33)
          {
            id v66 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v33,  0LL);
            id v36 = v66;
          }

          else
          {
            id v66 = (id)[MEMORY[0x1896079C8] predicateWithValue:1];
          }

          if ([v34 count]) {
            int v37 = v34;
          }
          else {
            int v37 = 0LL;
          }
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          uint64_t v38 = -[__CFSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v86,  v97,  16LL);
          if (v38)
          {
            uint64_t v39 = *(void *)v87;
            do
            {
              for (uint64_t k = 0LL; k != v38; ++k)
              {
                if (*(void *)v87 != v39) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v41 = *(void **)(*((void *)&v86 + 1) + 8 * k);
                uint64_t v42 = [v41 objectID];
                else {
                  [v63 removeObject:v42];
                }
              }

              uint64_t v38 = -[__CFSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v86,  v97,  16LL);
            }

            while (v38);
          }

          uint64_t v43 = 0LL;
          int8x16_t v96 = vextq_s8(*(int8x16_t *)(v60 + 72), *(int8x16_t *)(v60 + 72), 8uLL);
          char v44 = 1;
          do
          {
            int v45 = (void *)v96.i64[v43];
            char v61 = v44;
            __int128 v82 = 0u;
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v85 = 0u;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v82 objects:v95 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v83;
              do
              {
                for (uint64_t m = 0LL; m != v46; ++m)
                {
                  if (*(void *)v83 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v49 = *(void **)(*((void *)&v82 + 1) + 8 * m);
                  uint64_t v50 = (void *)[v49 objectID];
                  uint64_t v51 = v50;
                  if (v37)
                  {
                    uint64_t v52 = [v50 persistentStore];
                    if (!v52 || [v37 indexOfObjectIdenticalTo:v52] == 0x7FFFFFFFFFFFFFFFLL) {
                      continue;
                    }
                  }

                  uint64_t v53 = [v49 entity];
                  if ((void *)v53 == v35 || allocatora && [v35 _subentitiesIncludes:v53])
                  {
                  }
                }

                uint64_t v46 = [v45 countByEnumeratingWithState:&v82 objects:v95 count:16];
              }

              while (v46);
            }

            char v44 = 0;
            uint64_t v43 = 1LL;
          }

          while ((v61 & 1) != 0);
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          uint64_t v54 = -[__CFSet countByEnumeratingWithState:objects:count:]( cf,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
          if (v54)
          {
            uint64_t v55 = *(void *)v79;
            do
            {
              for (uint64_t n = 0LL; n != v54; ++n)
              {
                if (*(void *)v79 != v55) {
                  objc_enumerationMutation(cf);
                }
                objc_msgSend(v63, "removeObject:", objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * n), "objectID"));
              }

              uint64_t v54 = -[__CFSet countByEnumeratingWithState:objects:count:]( cf,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
            }

            while (v54);
          }

          [v58 drain];
          [v63 count];
        }
      }

      else
      {
        -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)v60, v59, a3);
      }

      if (v10) {
        CFRelease(v10);
      }
      if (cf) {
        CFRelease(cf);
      }
    }
  }

- (BOOL)_attemptCoalesceChangesForFetch
{
  if (result)
  {
    uint64_t v1 = result;
    return ![*(id *)(result + 64) count]
        && (![*(id *)(v1 + 72) count]
         || ([*(id *)(v1 + 88) intersectsSet:*(void *)(v1 + 72)] & 1) == 0);
  }

  return result;
}

- (uint64_t)_countWithNoChangesForRequest:(id *)a3 error:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( (id)objc_msgSend(a2, "substitutionVariables"),  "objectForKey:",  @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
  {
    uint64_t v39 = 1LL;
  }

  else
  {
    uint64_t v39 = [a2 fetchLimit];
  }

  id v54 = 0LL;
  if (![a2 entity])
  {
    id v36 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"%@ A fetch request must have an entity.", NSStringFromSelector(sel__countWithNoChangesForRequest_error_)), 0 reason userInfo];
    objc_exception_throw(v36);
  }

  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v7 = (void *)[a2 copy];
  [v7 setResultType:4];
  -[NSManagedObjectContext lockObjectStore]((uint64_t)a1);
  int v8 = (void *)[a1[4] executeRequest:v7 withContext:a1 error:&v54];
  id v9 = v54;
  id v10 = v8;

  [v6 drain];
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)a1);
  if (v54)
  {
    id v11 = v54;
    if (a3) {
      *a3 = v54;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v8 count]) {
    unint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "lastObject"), "unsignedIntValue");
  }
  else {
    unint64_t v12 = 0LL;
  }

  if ([a1 hasChanges] && objc_msgSend(a2, "includesPendingChanges"))
  {
    id v38 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v14 = [a2 predicate];
    uint64_t v15 = (void *)[a2 affectedStores];
    uint64_t v16 = (void *)[a2 entity];
    if (objc_msgSend((id)objc_msgSend(v16, "subentitiesByName"), "count"))
    {
      int v17 = [a2 includesSubentities];
      if (v14)
      {
LABEL_22:
        id v40 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v14,  0LL);
        id v18 = v40;
LABEL_25:
        if (![v15 count]) {
          uint64_t v15 = 0LL;
        }
        callBacks.versiouint64_t n = *MEMORY[0x189605258];
        *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
        uint64_t v19 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
        callBacks.equal = 0LL;
        callBacks.hash = 0LL;
        callBacks.copyDescriptiouint64_t n = v19;
        uint64_t v20 = [a1[9] count];
        uint64_t v21 = (__CFSet *)a1[10];
        if (v20)
        {
          if ([a1[10] count])
          {
            uint64_t v21 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            id v22 = a1[9];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v50;
              do
              {
                for (uint64_t i = 0LL; i != v23; ++i)
                {
                  if (*(void *)v50 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  CFSetAddValue(v21, *(const void **)(*((void *)&v49 + 1) + 8 * i));
                }

                uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }

              while (v23);
            }

            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            id v26 = a1[10];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v56 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v46;
              do
              {
                for (uint64_t j = 0LL; j != v27; ++j)
                {
                  if (*(void *)v46 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  CFSetAddValue(v21, *(const void **)(*((void *)&v45 + 1) + 8 * j));
                }

                uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v56 count:16];
              }

              while (v27);
            }

            int v37 = 1;
          }

          else
          {
            int v37 = 0;
            uint64_t v21 = (__CFSet *)a1[9];
          }
        }

        else
        {
          int v37 = 0;
        }

        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        uint64_t v30 = -[__CFSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
        if (v30)
        {
          uint64_t v31 = *(void *)v42;
          do
          {
            for (uint64_t k = 0LL; k != v30; ++k)
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v21);
              }
              uint64_t v33 = *(void **)(*((void *)&v41 + 1) + 8 * k);
              if (v15)
              {
                uint64_t v34 = objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * k), "objectID"),  "persistentStore");
                if (!v34 || [v15 indexOfObjectIdenticalTo:v34] == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
              }

              uint64_t v35 = [v33 entity];
            }

            uint64_t v30 = -[__CFSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
          }

          while (v30);
        }

        if (v37) {
          CFRelease(v21);
        }
        [v38 drain];
        goto LABEL_63;
      }
    }

    else
    {
      int v17 = 0;
      if (v14) {
        goto LABEL_22;
      }
    }

    id v40 = (id)[MEMORY[0x1896079C8] predicateWithValue:1];
    goto LABEL_25;
  }

- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  if (error)
  {
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      *error = 0LL;
    }
  }

  return result;
}

void *__59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    NSUInteger result = objc_loadWeak((id *)(v1 + 8));
    if (result) {
      return (void *)[result _cancelProgress];
    }
  }

  return result;
}

uint64_t __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v32 = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) executeRequest:*(void *)(a1 + 40) withContext:*(void *)(a1 + 32) error:&v32];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  if (!v4)
  {
    *(void *)(v3 + 40) = 0LL;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  id v5 = v4;
  id v6 = v32;

  [v2 drain];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v7) {
    id v8 = v7;
  }
  if (v32)
  {
    id v9 = v32;
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
    if (v10) {
      *id v10 = v32;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = 0LL;
  }

  uint64_t v11 = *(void *)(a1 + 64);
  unint64_t v12 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(v11 + 8) + 40LL))
  {
    uint64_t v17 = MEMORY[0x1895F87A8];
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4;
    uint64_t v20 = &unk_189EA83A8;
    char v24 = *(_BYTE *)(a1 + 96);
    uint64_t v13 = *(void *)(a1 + 56);
    __int16 v25 = *(_WORD *)(a1 + 97);
    uint64_t v14 = *(void *)(a1 + 88);
    v23[1] = v11;
    void v23[2] = v14;
    uint64_t v15 = v23;
    uint64_t v21 = v13;
    id v22 = v12;
  }

  else
  {
    uint64_t v26 = MEMORY[0x1895F87A8];
    uint64_t v27 = 3221225472LL;
    uint64_t v28 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3;
    uint64_t v29 = &unk_189EA8380;
    v31[1] = *(void *)(a1 + 88);
    id v30 = v32;
    uint64_t v15 = v31;
  }

  void *v15 = *(void *)(a1 + 48);
  return objc_msgSend(v12, "performBlock:", v17, v18, v19, v20, v21, v22);
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 40) completionBlock])
  {
    uint64_t v2 = [*(id *)(a1 + 40) completionBlock];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }

  return *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v113 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = (id)NSArray_EmptyArray;
  }
  if (*(_BYTE *)(v1 + 72))
  {
    id v73 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v2 = [*(id *)(v1 + 32) predicate];
    __int128 v70 = (void *)[*(id *)(v1 + 32) sortDescriptors];
    uint64_t v3 = (void *)[*(id *)(v1 + 32) affectedStores];
    uint64_t v4 = (void *)[*(id *)(v1 + 32) entity];
    if (objc_msgSend((id)objc_msgSend(v4, "subentitiesByName"), "count"))
    {
      int v76 = [*(id *)(v1 + 32) includesSubentities];
      if (v2)
      {
LABEL_6:
        id v74 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v2,  0LL);
        id v5 = v74;
LABEL_9:
        if (![v3 count]) {
          uint64_t v3 = 0LL;
        }
        callBacks.versiouint64_t n = *MEMORY[0x189605258];
        *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
        id v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
        callBacks.hash = 0LL;
        callBacks.copyDescriptiouint64_t n = v6;
        callBacks.equal = 0LL;
        uint64_t v7 = [*(id *)(*(void *)(v1 + 40) + 56) count];
        id v8 = *(__CFSet **)(*(void *)(v1 + 40) + 96LL);
        uint64_t v75 = v1;
        if (v7)
        {
          if (-[__CFSet count](v8, "count"))
          {
            id v8 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
            __int128 v101 = 0u;
            __int128 v102 = 0u;
            __int128 v103 = 0u;
            __int128 v104 = 0u;
            id v9 = *(void **)(*(void *)(v1 + 40) + 56LL);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v101 objects:v112 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v102;
              do
              {
                for (uint64_t i = 0LL; i != v11; ++i)
                {
                  if (*(void *)v102 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  CFSetAddValue(v8, *(const void **)(*((void *)&v101 + 1) + 8 * i));
                }

                uint64_t v11 = [v9 countByEnumeratingWithState:&v101 objects:v112 count:16];
              }

              while (v11);
            }

            __int128 v99 = 0u;
            __int128 v100 = 0u;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            uint64_t v14 = *(void **)(*(void *)(v75 + 40) + 96LL);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v97 objects:v111 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v98;
              do
              {
                for (uint64_t j = 0LL; j != v16; ++j)
                {
                  if (*(void *)v98 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  CFSetAddValue(v8, *(const void **)(*((void *)&v97 + 1) + 8 * j));
                }

                uint64_t v16 = [v14 countByEnumeratingWithState:&v97 objects:v111 count:16];
              }

              while (v16);
            }

            int v71 = 1;
          }

          else
          {
            int v71 = 0;
            id v8 = *(__CFSet **)(*(void *)(v1 + 40) + 56LL);
          }
        }

        else
        {
          int v71 = 0;
        }

        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        uint64_t v19 = -[__CFSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v93,  v110,  16LL);
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = 0LL;
          uint64_t v22 = *(void *)v94;
          do
          {
            for (uint64_t k = 0LL; k != v20; ++k)
            {
              if (*(void *)v94 != v22) {
                objc_enumerationMutation(v8);
              }
              char v24 = *(void **)(*((void *)&v93 + 1) + 8 * k);
              __int16 v25 = (void *)[v24 objectID];
              uint64_t v26 = v25;
              if (!v3
                || objc_msgSend(v3, "indexOfObjectIdenticalTo:", objc_msgSend(v25, "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v27 = [v24 entity];
                if ((void *)v27 == v4 || v76 && [v4 _subentitiesIncludes:v27])
                {
                  if (!v21) {
                    uint64_t v21 = (void *)[MEMORY[0x189603FE0] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  int v28 = [v74 evaluateWithObject:v24];
                  if (*(_BYTE *)(v75 + 73)) {
                    uint64_t v29 = v24;
                  }
                  else {
                    uint64_t v29 = v26;
                  }
                  if (v28) {
                    [v21 addObject:v29];
                  }
                  else {
                    [v21 removeObject:v29];
                  }
                }
              }
            }

            uint64_t v20 = -[__CFSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v93,  v110,  16LL);
          }

          while (v20);
        }

        else
        {
          uint64_t v21 = 0LL;
        }

        if (v71) {
          CFRelease(v8);
        }
        uint64_t v30 = [*(id *)(*(void *)(v75 + 40) + 72) count];
        uint64_t v31 = *(void *)(v75 + 40);
        id v32 = *(__CFSet **)(v31 + 80);
        if (v30)
        {
          if ([*(id *)(v31 + 80) count])
          {
            id v32 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
            __int128 v89 = 0u;
            __int128 v90 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            uint64_t v33 = *(void **)(*(void *)(v75 + 40) + 72LL);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v89 objects:v109 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v90;
              do
              {
                for (uint64_t m = 0LL; m != v35; ++m)
                {
                  if (*(void *)v90 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  CFSetAddValue(v32, *(const void **)(*((void *)&v89 + 1) + 8 * m));
                }

                uint64_t v35 = [v33 countByEnumeratingWithState:&v89 objects:v109 count:16];
              }

              while (v35);
            }

            __int128 v87 = 0u;
            __int128 v88 = 0u;
            __int128 v85 = 0u;
            __int128 v86 = 0u;
            id v38 = *(void **)(*(void *)(v75 + 40) + 80LL);
            uint64_t v39 = [v38 countByEnumeratingWithState:&v85 objects:v108 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v86;
              do
              {
                for (uint64_t n = 0LL; n != v40; ++n)
                {
                  if (*(void *)v86 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  CFSetAddValue(v32, *(const void **)(*((void *)&v85 + 1) + 8 * n));
                }

                uint64_t v40 = [v38 countByEnumeratingWithState:&v85 objects:v108 count:16];
              }

              while (v40);
            }

            int v72 = 1;
          }

          else
          {
            int v72 = 0;
            id v32 = *(__CFSet **)(*(void *)(v75 + 40) + 72LL);
          }
        }

        else
        {
          int v72 = 0;
        }

        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        uint64_t v43 = -[__CFSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v81,  v107,  16LL);
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v82;
          do
          {
            for (iuint64_t i = 0LL; ii != v44; ++ii)
            {
              if (*(void *)v82 != v45) {
                objc_enumerationMutation(v32);
              }
              __int128 v47 = *(void **)(*((void *)&v81 + 1) + 8 * ii);
              __int128 v48 = (void *)[v47 objectID];
              __int128 v49 = v48;
              if (v3)
              {
                uint64_t v50 = [v48 persistentStore];
                if (!v50 || [v3 indexOfObjectIdenticalTo:v50] == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
              }

              uint64_t v51 = [v47 entity];
              if ((void *)v51 == v4 || v76 && [v4 _subentitiesIncludes:v51])
              {
                if ([v74 evaluateWithObject:v47])
                {
                  if (!v21) {
                    uint64_t v21 = (void *)[MEMORY[0x189603FE0] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  if (*(_BYTE *)(v75 + 73)) {
                    __int128 v52 = v47;
                  }
                  else {
                    __int128 v52 = v49;
                  }
                  [v21 addObject:v52];
                }
              }
            }

            uint64_t v44 = -[__CFSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v81,  v107,  16LL);
          }

          while (v44);
        }

        if (v72) {
          CFRelease(v32);
        }
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        uint64_t v1 = v75;
        uint64_t v53 = *(void **)(*(void *)(v75 + 40) + 88LL);
        uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v106 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v78;
          do
          {
            for (juint64_t j = 0LL; jj != v55; ++jj)
            {
              if (*(void *)v78 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v58 = *(void **)(*((void *)&v77 + 1) + 8 * jj);
              if (!v3
                || objc_msgSend( v3,  "indexOfObjectIdenticalTo:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * jj), "objectID"),  "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v59 = [v58 entity];
                if ((void *)v59 == v4 || v76 && [v4 _subentitiesIncludes:v59])
                {
                  if (!v21) {
                    uint64_t v21 = (void *)[MEMORY[0x189603FE0] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  if (!*(_BYTE *)(v75 + 73)) {
                    uint64_t v58 = (void *)[v58 objectID];
                  }
                  [v21 removeObject:v58];
                }
              }
            }

            uint64_t v55 = [v53 countByEnumeratingWithState:&v77 objects:v106 count:16];
          }

          while (v55);
        }

        if (v21)
        {
          uint64_t v60 = (void *)[v21 allObjects];
          if ([v70 count] && *(_BYTE *)(v75 + 73) && *(_BYTE *)(v75 + 74)) {
            uint64_t v60 = (void *)[v60 sortedArrayUsingDescriptors:v70];
          }

          *(void *)(*(void *)(*(void *)(v75 + 56) + 8LL) + 40LL) = v60;
        }

        [v73 drain];
        goto LABEL_119;
      }
    }

    else
    {
      int v76 = 0;
      if (v2) {
        goto LABEL_6;
      }
    }

    id v74 = (id)[MEMORY[0x1896079C8] predicateWithValue:1];
    goto LABEL_9;
  }

- (void)rollback
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  BOOL v3 = -[NSManagedObjectContext propagatesDeletesAtEndOfEvent](self, "propagatesDeletesAtEndOfEvent");
  -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", 0LL);
  -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");

  *self->_additionalPrivateIvars = 0LL;
  if (-[NSMutableSet count](self->_changedObjects, "count")
    || -[NSMutableSet count](self->_insertedObjects, "count")
    || -[NSMutableSet count](self->_deletedObjects, "count"))
  {
    id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v5 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4];
    id v6 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:self->_changedObjects];
    [v6 unionSet:self->_deletedObjects];
    unint64_t v7 = [v6 count];
    unint64_t v8 = v7;
    if (v7 <= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v7 >= 0x201) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = (char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v7 >= 0x201) {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v9);
    }
    [v6 getObjects:v11];
    if (v8)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        uint64_t v13 = *(void **)&v11[8 * i];
        uint64_t v14 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)self, v13);
        if (v14)
        {
          -[NSManagedObject _updateFromSnapshot:]((uint64_t)v13, v14);
          [v13 awakeFromSnapshotEvents:16];
        }
      }

      if (v8 >= 0x201) {
        NSZoneFree(0LL, v11);
      }
    }

    uint64_t v15 = (void *)-[NSMutableSet allObjects](self->_changedObjects, "allObjects");
    uint64_t v16 = (void *)-[NSMutableSet allObjects](self->_insertedObjects, "allObjects");
    uint64_t v17 = [v16 count];
    if (v17)
    {
      for (uint64_t j = 0LL; j != v17; ++j)
        -[NSManagedObjectContext deleteObject:](self, "deleteObject:", [v16 objectAtIndex:j]);
    }

    uint64_t v19 = (void *)-[NSMutableSet allObjects](self->_deletedObjects, "allObjects");
    uint64_t v20 = [v19 count];
    if (v20)
    {
      for (uint64_t k = 0LL; k != v20; ++k)
        -[NSManagedObjectContext insertObject:](self, "insertObject:", [v19 objectAtIndex:k]);
    }

    if ([v15 count])
    {
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:v15];
      [v5 setObject:v22 forKey:@"updated"];
    }

    if ([v16 count])
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:v16];
      [v5 setObject:v23 forKey:@"deleted"];
    }

    if ([v19 count])
    {
      char v24 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:v19];
      [v5 setObject:v24 forKey:@"inserted"];
    }

    id v25 = 0LL;
    if ([v5 count])
    {
      if (byte_18C4ABDBE) {
        objc_msgSend( v5,  "setObject:forKey:",  +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self),  @"managedObjectContext");
      }
      -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v5);
    }

    [v4 drain];
    -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");
    -[NSManagedObjectContext _resetAllChanges](self);
    -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", v3);
  }

  else
  {
    -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", v3);
  }

- (uint64_t)_committedSnapshotForObject:(uint64_t)result
{
  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__committedSnapshotForObject_);
      if (a2)
      {
LABEL_4:
        uint64_t v3 = a2[6];
        if (v3 && *(void *)(v3 + 8)) {
          return *(void *)(v3 + 8);
        }
        id v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( a2,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  1);
        -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

        uint64_t v3 = a2[6];
        if (v3) {
          return *(void *)(v3 + 8);
        }
      }
    }

    else if (a2)
    {
      goto LABEL_4;
    }

    return 0LL;
  }

  return result;
}

- (void)refreshObject:(NSManagedObject *)object mergeChanges:(BOOL)flag
{
  BOOL v8 = flag;
  v35[128] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      goto LABEL_6;
    }
  }

  else if (!object)
  {
LABEL_6:
    cd_managedObjectContext = 0LL;
    goto LABEL_7;
  }

  if ((object->_cd_stateFlags & 0x80) != 0) {
    goto LABEL_6;
  }
  cd_managedObjectContext = object->_cd_managedObjectContext;
LABEL_7:
  if (cd_managedObjectContext != self)
  {
    if (!cd_managedObjectContext) {
      return;
    }
    if (BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"An NSManagedObjectContext cannot refresh objects in other contexts." userInfo:0]);
      goto LABEL_64;
    }
  }

  unsigned int v12 = (object->_cd_stateFlags >> 15) & 7;
  if (v12 == 5 || v12 == 0)
  {
    uint64_t v14 = -[NSManagedObject objectID](object, "objectID");
    values = v14;
    if (!v8)
    {
      -[NSManagedObject willRefresh:](object, "willRefresh:", 0LL);
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 1);
LABEL_60:
      -[NSManagedObject awakeFromSnapshotEvents:](object, "awakeFromSnapshotEvents:", 32LL);
      -[NSManagedObject didRefresh:](object, "didRefresh:", v8);
      -[NSManagedObjectContext _prepareUnprocessedDeletionAfterRefresh:](self, object);
      -[NSMutableSet addObject:](self->_refreshedObjects, "addObject:", -[NSManagedObject objectID](object, "objectID"));
      if ((*(_BYTE *)&self->_flags & 1) == 0) {
        -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
      }
      return;
    }

    uint64_t v15 = v14;
    -[NSManagedObject willRefresh:](object, "willRefresh:", 1LL);
    refreshed = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)object);
    id v5 = -[NSManagedObject _changedTransientProperties__](object);
    if (object) {
      uint64_t v16 = _insertion_fault_handler;
    }
    else {
      uint64_t v16 = 0LL;
    }
    uint64_t v17 = -[NSManagedObject entity](object, "entity");
    cd_extras = object->_cd_extras;
    uint64_t v33 = v16;
    if (cd_extras)
    {
      var0 = cd_extras->var0;
      unsigned int cd_stateFlags = object->_cd_stateFlags;
      uint64_t v4 = 0LL;
      int v7 = 1;
      if (var0)
      {
        if ((cd_stateFlags & 0x2000) == 0)
        {
          if (v17)
          {
            uint64_t v4 = *((void *)v17->_kvcPropertyAccessors + 6);
            if (v4)
            {
              object->_unsigned int cd_stateFlags = cd_stateFlags | 0x1000;
              -[NSManagedObject _willChangeValuesForKeys:](object, "_willChangeValuesForKeys:", v4);
              int v7 = 0;
              unsigned int cd_stateFlags = object->_cd_stateFlags & 0xFFFFEFFF;
            }
          }
        }
      }
    }

    else
    {
      uint64_t v4 = 0LL;
      unsigned int cd_stateFlags = object->_cd_stateFlags;
      int v7 = 1;
    }

    object->_unsigned int cd_stateFlags = cd_stateFlags | 0x2000;
    -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 0);
    unsigned int v21 = object->_cd_stateFlags & 0x12;
    BOOL v22 = v21 != 0;
    if (-[NSManagedObjectID isTemporaryID](v15, "isTemporaryID"))
    {
      unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
      BOOL v22 = (v23 & 1) == 0 || v21 != 0;
    }

    if (v22 || ((v7 ^ 1) & 1) != 0)
    {
      if (!v22)
      {
LABEL_37:
        -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
        if (self)
        {
          id parentObjectStore = self->_parentObjectStore;
LABEL_39:
          uint64_t v26 = [parentObjectStore newValuesForObjectWithID:values withContext:self error:0];
          BOOL v27 = v26 != 0;
          if (v26)
          {
            int v28 = (void *)v26;
            if ((object->_cd_stateFlags & 0x200) == 0 && ([values isTemporaryID] & 1) == 0)
            {
              uint64_t v29 = _PFStackAllocatorCreate(v35, 1024LL);
              CFArrayRef v30 = CFArrayCreate(v29, (const void **)&values, 1LL, 0LL);
              if (self) {
                id v32 = self->_parentObjectStore;
              }
              else {
                id v32 = 0LL;
              }
              objc_msgSend( v32,  "managedObjectContextDidRegisterObjectsWithIDs:generation:",  v30,  -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
              if (v35[3] && v30) {
                CFRelease(v30);
              }
              object->_cd_stateFlags |= 0x200u;
            }

            _PFFaultHandlerFulfillFault(v33, (uint64_t)object, (uint64_t)self, v28, 0);
          }

          -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
          goto LABEL_52;
        }

- (void)_refaultObject:(id *)a1 globalID:(uint64_t)a2 BOOLean:(int)a3
{
  if (a1)
  {
    if ((a3 & 1) != 0 || (*(_BYTE *)(a2 + 16) & 0x3F) == 0)
    {
      int v7 = 0LL;
      uint64_t v11 = 0LL;
    }

    else
    {
      id v6 = *(void **)(a2 + 48);
      if (v6) {
        id v6 = (void *)v6[1];
      }
      int v7 = v6;
      BOOL v8 = *(void **)(a2 + 48);
      if (v8) {
        BOOL v8 = (void *)v8[2];
      }
      uint64_t v11 = v8;
    }

    if (a2) {
      uint64_t v9 = _insertion_fault_handler;
    }
    else {
      uint64_t v9 = 0LL;
    }
    -[NSFaultHandler turnObject:intoFaultWithContext:](v9, a2, (uint64_t)a1);
    if (a2 && a3)
    {
      int v10 = *(_DWORD *)(a2 + 16);
      if ((v10 & 9) != 0)
      {
        [a1[7] removeObject:a2];
        [a1[12] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }

      if ((v10 & 0x12) != 0)
      {
        [a1[9] removeObject:a2];
        [a1[10] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }

      if ((v10 & 0x24) != 0)
      {
        [a1[11] removeObject:a2];
        [a1[8] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }

      *(_DWORD *)(a2 + 16) = v10 & 0xFFFFFFC0;
      -[NSManagedObject _setOriginalSnapshot__:]((void *)a2, 0LL);
      -[NSManagedObject _setLastSnapshot__:]((void *)a2, 0LL);
    }

    if (v7)
    {
      -[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)a1, (void *)a2);
    }

    if (v11)
    {
      -[NSManagedObject _setLastSnapshot__:]((void *)a2, v11);
    }
  }

- (uint64_t)_mergeRefreshObject:(char)a3 mergeChanges:(NSKnownKeysDictionary *)a4 withPersistentSnapshot:
{
  v35[128] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__mergeRefreshObject_mergeChanges_withPersistentSnapshot_);
    if (a2)
    {
LABEL_3:
      unsigned int v8 = *(_DWORD *)(a2 + 16);
      if ((v8 & 0x80) != 0 || !*(void *)(a2 + 32)) {
        return 0LL;
      }
      int v9 = (v8 >> 15) & 7;
      if (v9 != 5 && v9 != 0) {
        return 0LL;
      }
      uint64_t v11 = (void *)[(id)a2 objectID];
      values = v11;
      if ((a3 & 1) == 0)
      {
        [(id)a2 willRefresh:0];
        -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 1);
        return 1LL;
      }

      unsigned int v12 = v11;
      [(id)a2 willRefresh:1];
      refreshed = a4;
      if (!a4) {
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](a2);
      }
      uint64_t v14 = -[NSManagedObject _changedTransientProperties__]((void *)a2);
      uint64_t v15 = _insertion_fault_handler;
      uint64_t v16 = [(id)a2 entity];
      uint64_t v17 = *(uint64_t **)(a2 + 48);
      uint64_t v33 = v15;
      if (v17)
      {
        uint64_t v18 = *v17;
        unsigned int v19 = *(_DWORD *)(a2 + 16);
        uint64_t v20 = 0LL;
        int v21 = 1;
        if (v18)
        {
          if ((v19 & 0x2000) == 0)
          {
            if (v16)
            {
              uint64_t v20 = *(void *)(*(void *)(v16 + 152) + 48LL);
              if (v20)
              {
                *(_DWORD *)(a2 + 16) = v19 | 0x1000;
                [(id)a2 _willChangeValuesForKeys:v20];
                int v21 = 0;
                unsigned int v19 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
              }
            }
          }
        }
      }

      else
      {
        uint64_t v20 = 0LL;
        unsigned int v19 = *(_DWORD *)(a2 + 16);
        int v21 = 1;
      }

      *(_DWORD *)(a2 + 16) = v19 | 0x2000;
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 0);
      int v22 = *(_DWORD *)(a2 + 16) & 0x12;
      BOOL v23 = v22 != 0;
      if ([v12 isTemporaryID])
      {
        unsigned __int8 v24 = atomic_load((unsigned __int8 *)(a1 + 48));
        BOOL v23 = (v24 & 1) == 0 || v22 != 0;
      }

      if (v23 || ((v21 ^ 1) & 1) != 0)
      {
        if (!v23) {
          goto LABEL_31;
        }
      }

      else if ([(id)a2 hasChanges])
      {
LABEL_31:
        -[NSManagedObjectContext lockObjectStore](a1);
        uint64_t v26 = [*(id *)(a1 + 32) newValuesForObjectWithID:values withContext:a1 error:0];
        BOOL v27 = v26 != 0;
        if (v26)
        {
          int v28 = (void *)v26;
          if ((*(_BYTE *)(a2 + 17) & 2) == 0 && ([values isTemporaryID] & 1) == 0)
          {
            uint64_t v29 = _PFStackAllocatorCreate(v35, 1024LL);
            CFArrayRef v30 = CFArrayCreate(v29, (const void **)&values, 1LL, 0LL);
            objc_msgSend( *(id *)(a1 + 32),  "managedObjectContextDidRegisterObjectsWithIDs:generation:",  v30,  objc_msgSend((id)a1, "_queryGenerationToken"));
            if (v35[3] && v30) {
              CFRelease(v30);
            }
            *(_DWORD *)(a2 + 16) |= 0x200u;
          }

          _PFFaultHandlerFulfillFault(v33, a2, a1, v28, 0);
        }

        -[NSManagedObjectContext unlockObjectStore](a1);
        goto LABEL_42;
      }

      BOOL v27 = 0;
LABEL_42:
      if (-[NSKnownKeysDictionary count](refreshed, "count")) {
        -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:]((void *)a2, refreshed, 0);
      }
      if (!a4) {

      }
      if (-[NSKnownKeysDictionary count](v14, "count")) {
        -[NSManagedObject _updateFromSnapshot:](a2, v14);
      }
      unsigned int v31 = *(_DWORD *)(a2 + 16);
      if (v27)
      {
        *(_DWORD *)(a2 + 16) = v31 | 0x1000;
        [(id)a2 awakeFromFetch];
        unsigned int v31 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
      }

      *(_DWORD *)(a2 + 16) = v31 & 0xFFFFDFFF;
      if ((v21 & 1) == 0) {
        [(id)a2 _didChangeValuesForKeys:v20];
      }
      return 1LL;
    }
  }

  else if (a2)
  {
    goto LABEL_3;
  }

  return 0LL;
}

- (uint64_t)_mergeRefreshEpilogueForObject:(uint64_t)a3 mergeChanges:
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 112), "addObject:", objc_msgSend(a2, "objectID"));
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    return -[NSManagedObjectContext _enqueueEndOfEventNotification](a1);
  }
  return result;
}

- (void)undo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  if (*((void *)self->_additionalPrivateIvars + 5))
  {
    id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
    [self->_additionalPrivateIvars[5] undo];
    [v3 drain];
  }

- (void)redo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  if (*((void *)self->_additionalPrivateIvars + 5))
  {
    id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
    [self->_additionalPrivateIvars[5] redo];
    [v3 drain];
  }

- (NSManagedObjectContext)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSManagedObjectContext;
  id v5 = -[NSManagedObjectContext init](&v19, sel_init);
  if (v5)
  {
    int v6 = [a3 decodeIntForKey:@"NSConcurrencyType"];
    int v7 = v6;
    if (v6 == 2LL)
    {
      char v9 = 3;
    }

    else if (v6 == 1LL)
    {
      char v9 = 2;
    }

    else
    {
      char v9 = !v6
        && (byte_18C4ABA04 & 1) == 0
        && (current_queue = (dispatch_queue_global_s *)dispatch_get_current_queue(), pthread_main_np())
        && (current_queue == dispatch_get_global_queue(0LL, 0LL)
         || current_queue == (dispatch_queue_global_s *)MEMORY[0x1895F8AE0]);
    }

    uint64_t v10 = -[NSManagedObjectContext _initWithParentObjectStore:](v5, v9);
    if (v5 == (void *)v10 || (v11 = (void *)v10, v5, (id v5 = v11) != 0LL))
    {
      if (v7 == 2)
      {
        uint64_t v13 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
        v5[3] = MEMORY[0x1895F8AE0];
        if (!dispatch_queue_get_specific(v13, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
        {
          uint64_t v14 = (void *)objc_opt_class();
          dispatch_queue_set_specific( MEMORY[0x1895F8AE0],  "com.apple.CoreData.NSManagedObjectContext.mainQueue",  v14,  0LL);
          uint64_t v13 = (dispatch_queue_s *)v5[3];
        }

        dispatch_retain(v13);
        unsigned int v12 = v5[5] & 0xFFF7FFFF;
      }

      else
      {
        if (v7 != 1)
        {
LABEL_22:
          atomic_store(0LL, v5 + 1);
          [a3 decodeFloatForKey:@"NSFetchTimestamp"];
          *((double *)v5 + 18) = v15;
          else {
            int v16 = 0;
          }
          *((_DWORD *)v5 + 10) = v5[5] & 0xFFFFFFBF | v16;
          else {
            int v17 = 0;
          }
          *((_DWORD *)v5 + 10) = v5[5] & 0xFFFFFFFD | v17;
          objc_msgSend(v5, "setMergePolicy:", objc_msgSend(a3, "decodeObjectForKey:", @"NSMergePolicy"));
          return (NSManagedObjectContext *)v5;
        }

        v5[3] = createQueueForMOC(v5);
        unsigned int v12 = *((_DWORD *)v5 + 10) | 0x80000;
      }

      *((_DWORD *)v5 + 10) = v12;
      goto LABEL_22;
    }
  }

  return (NSManagedObjectContext *)v5;
}

- (uint64_t)_initWithParentObjectStore:(void *)a1
{
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_CLASS___NSManagedObjectContext;
  uint64_t v4 = objc_msgSendSuper2(&v29, sel_init);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4[4] = 0LL;
    v4[21] = PF_CALLOC_OBJECT_ARRAY(22LL);
    int v6 = -[_PFContextMapTable initWithWeaksReferences:](objc_alloc(&OBJC_CLASS____PFContextMapTable), 1);
    *(void *)(v5 + 120) = v6;
    CFRetain(v6);

    v28.versiouint64_t n = *MEMORY[0x189605258];
    *(_OWORD *)&v28.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    int v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    v28.equal = 0LL;
    v28.hash = 0LL;
    v28.copyDescriptiouint64_t n = v7;
    unsigned int v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    *(void *)(v5 + 72) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v28);
    *(void *)(v5 + 64) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 56) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 80) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 88) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 96) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 104) = CFSetCreateMutable(v8, 0LL, &v28);
    *(void *)(v5 + 112) = CFSetCreateMutable(v8, 0LL, &v28);
    atomic_store(a2 & 1, (unsigned __int8 *)(v5 + 49));
    if ((_PF_USE_IOS_PLATFORM & 1) != 0)
    {
      *(void *)(*(void *)(v5 + 168) + 40LL) = 0LL;
      *(_WORD *)(v5 + 44) = 0;
    }

    else
    {
      if (byte_18C4ABDBB)
      {
        *(void *)(*(void *)(v5 + 168) + 40LL) = 0LL;
      }

      else
      {
        *(void *)(*(void *)(v5 + 168) + 40LL) = objc_alloc_init(MEMORY[0x189607AC8]);
        unsigned __int8 v9 = atomic_load((unsigned __int8 *)(v5 + 49));
        if ((v9 & 1) == 0) {
          [*(id *)(*(void *)(v5 + 168) + 40) setGroupsByEvent:0];
        }
      }

      *(_WORD *)(v5 + 44) = 0;
      if (*(void *)(*(void *)(v5 + 168) + 40LL)) {
        -[NSManagedObjectContext _startObservingUndoManagerNotifications](v5);
      }
    }

    if ((a2 & 2) == 0)
    {
      uint64_t v10 = (Class *)0x1896079F8LL;
      if (_PF_Threading_Debugging_level <= 0) {
        uint64_t v10 = (Class *)off_189EA56D0;
      }
      id v11 = objc_alloc_init(*v10);
      *(void *)(v5 + 136) = v11;
      CFRetain(v11);
    }

    *(_DWORD *)(v5 + 52) = 0;
    *(_DWORD *)(v5 + 20) = 0;
    unsigned int v12 = objc_alloc(&OBJC_CLASS____PFManagedObjectReferenceQueue);
    if (v12)
    {
      v31.receiver = v12;
      v31.super_class = (Class)&OBJC_CLASS____PFManagedObjectReferenceQueue;
      uint64_t v13 = objc_msgSendSuper2(&v31, sel_init);
      uint64_t v14 = v13;
      v13[2] = 0LL;
      v13[3] = v5;
      v13[4] = 0LL;
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88 && (unsigned __int8 v15 = atomic_load((unsigned __int8 *)(v5 + 49)), (v15 & 1) != 0))
      {
        Maiuint64_t n = CFRunLoopGetMain();
        context.versiouint64_t n = 0LL;
        memset(&context.retain, 0, 24);
        context.info = v14;
        int v17 = CFRunLoopObserverCreate(0LL, 0xA0uLL, 1u, 0LL, (CFRunLoopObserverCallBack)_performRunLoopAction, &context);
        CFRunLoopAddObserver(Main, v17, (CFRunLoopMode)*MEMORY[0x1896051A8]);
        v14[5] = v17;
        CFRetain(v14);
      }

      else
      {
        v13[5] = 0LL;
      }

      CFRetain(v14);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    *(void *)(v5 + 152) = v14;
    CFRetain(v14);

    *(void *)(v5 + 24) = 0LL;
    atomic_store(0LL, (unint64_t *)(v5 + 8));
    *(void *)(v5 + 144) = 0xBFF0000000000000LL;
    *(void *)(*(void *)(v5 + 168) + 16LL) = 0LL;
    *(_WORD *)(v5 + 46) = 0;
    atomic_store(0, (unsigned __int8 *)(v5 + 51));
    int v18 = *(_DWORD *)(v5 + 40);
    *(_DWORD *)(v5 + 16) = 0;
    if (byte_18C4ABA03) {
      int v19 = 0x4000000;
    }
    else {
      int v19 = 0;
    }
    *(_DWORD *)(v5 + 40) = v18 & 0xFBE9E000 | v19 | 0x120002;
    *(void *)(*(void *)(v5 + 168) + 24LL) = NSErrorMergePolicy;
    *(void *)(*(void *)(v5 + 168) + 96LL) =  +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken");
    *(void *)(*(void *)(v5 + 168) + 32LL) = 0LL;
    *(_DWORD *)(v5 + 40) &= ~0x2000u;
    **(void **)(v5 + 168) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 8LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 136LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 144LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 112LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 152LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 56LL) = 0LL;
    *(void *)(v5 + 128) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 48LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 80LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 120LL) = 0LL;
    *(void *)(*(void *)(v5 + 168) + 128LL) = 0LL;
    *(_DWORD *)(v5 + 40) = *(_DWORD *)(v5 + 40) & 0xE7FFFFFF | 0x10000000;
    if (_PF_Threading_Debugging_level)
    {
      int v21 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        int v21 = malloc_default_zone();
      }
      *(void *)(*(void *)(v5 + 168) + 56LL) = malloc_zone_malloc(v21, 0x30uLL);
      pthread_t v22 = pthread_self();
      **(void **)(*(void *)(v5 + 168) + 56LL) = v22;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 8LL) = v22;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 16LL) = 0LL;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 24LL) = 0LL;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 32LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      unsigned __int8 v23 = atomic_load((unsigned __int8 *)(v5 + 49));
      if ((v23 & 1) == 0)
      {
        unsigned __int8 v24 = (void *)[MEMORY[0x189607988] currentQueue];
        if ([v24 maxConcurrentOperationCount] == 1) {
          id v25 = v24;
        }
        else {
          id v25 = 0LL;
        }
        *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 16LL) = v25;
        current_queue = (dispatch_queue_global_s *)dispatch_get_current_queue();
        if (current_queue == dispatch_get_global_queue(0LL, 0LL)) {
          BOOL v27 = 0LL;
        }
        else {
          BOOL v27 = current_queue;
        }
        *(void *)(*(void *)(*(void *)(v5 + 168) + 56LL) + 24LL) = v27;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  double fetchTimestamp = self->_fetchTimestamp;
  *(float *)&double fetchTimestamp = fetchTimestamp;
  [a3 encodeFloat:@"NSFetchTimestamp" forKey:fetchTimestamp];
  [a3 encodeBool:(*(_DWORD *)&self->_flags >> 6) & 1 forKey:@"NSRetainsRegisteredObjects"];
  [a3 encodeBool:(*(_DWORD *)&self->_flags >> 1) & 1 forKey:@"NSPropagatesDeleted"];
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSManagedObjectContext mergePolicy](self, "mergePolicy"),  @"NSMergePolicy");
  objc_msgSend( a3,  "encodeInt:forKey:",  -[NSManagedObjectContext concurrencyType](self, "concurrencyType"),  @"NSConcurrencyType");
}

- (void)detectConflictsForObject:(NSManagedObject *)object
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      goto LABEL_6;
    }
  }

  else if (!object)
  {
    goto LABEL_6;
  }

  if ((object->_cd_stateFlags & 0x80) == 0)
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    goto LABEL_7;
  }

- (void)lock
{
  if (!self->_dispatchQueue)
  {
    [self->_lock lock];
    ++self->_lockCount;
    if (!self->_dispatchQueue)
    {
      unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
      if ((v3 & 1) != 0 && !pthread_main_np())
      {
        -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self->_referenceQueue);
        atomic_store(0, (unsigned __int8 *)&self->_isMainThreadBlessed);
      }
    }

    if (_PF_Threading_Debugging_level)
    {
      if (*((void *)self->_additionalPrivateIvars + 7)) {
        *(void *)(*((void *)self->_additionalPrivateIvars + 7) + 8LL) = pthread_self();
      }
    }
  }

- (BOOL)tryLock
{
  if (self->_dispatchQueue)
  {
    uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
    if (v3)
    {
      unint64_t v4 = 0LL;
      int v5 = 0;
      unint64_t v6 = v3;
      while ((NSManagedObjectContext *)v6 != self)
      {
        if (v6 == v4) {
          goto LABEL_13;
        }
        if (!v4) {
          unint64_t v4 = v6;
        }
        unint64_t v6 = atomic_load((unint64_t *)(v6 + 8));
        if (!v6) {
          goto LABEL_15;
        }
      }

      int v5 = 1;
LABEL_13:
      if (v5)
      {
        uint64_t v3 = 1LL;
        goto LABEL_27;
      }

- (void)unlock
{
  if (!self->_dispatchQueue)
  {
    lockunint64_t Count = self->_lockCount;
    if (lockCount >= 1) {
      self->_lockunint64_t Count = --lockCount;
    }
    if (_PF_Threading_Debugging_level)
    {
      uint64_t v3 = (void *)*((void *)self->_additionalPrivateIvars + 7);
      if (v3) {
        BOOL v4 = lockCount == 0;
      }
      else {
        BOOL v4 = 0;
      }
      if (v4) {
        v3[1] = *v3;
      }
    }

    [self->_lock unlock];
  }

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
}

- (void)_coreMergeChangesFromDidSaveDictionary:(int)a3 usingObjectIDs:(uint64_t)a4 withClientQueryGeneration:
{
  int v153 = a3;
  id v150 = a2;
  uint64_t v154 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( a1,  sel__coreMergeChangesFromDidSaveDictionary_usingObjectIDs_withClientQueryGeneration_);
  }
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v7 = [v150 objectForKey:@"managedObjectContext"];
  if (!v7) {
    goto LABEL_11;
  }
  Weauint64_t k = objc_loadWeak((id *)(v7 + 8));
  if (!Weak)
  {
    int v9 = 0LL;
    goto LABEL_12;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    int v9 = 0LL;
    Weauint64_t k = 0LL;
    goto LABEL_12;
  }

  int v9 = (void *)[MEMORY[0x189603FE0] set];
  uint64_t v10 = Weak;
  do
  {
    [v9 addObject:v10];
    uint64_t v10 = (void *)[v10 parentContext];
  }

  while (v10);
LABEL_12:
  if (Weak == (id)a1 || v9 && [v9 containsObject:a1])
  {
    [v6 drain];
    return;
  }

  BOOL v11 = (void *)[v150 objectForKey:@"newQueryGeneration"];
  else {
    unsigned __int8 v12 = 0LL;
  }
  id v142 = (id)[(id)a1 _queryGenerationToken];
  if (!a4 && [v142 _isEnabled]) {
    objc_msgSend( (id)a1,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  0);
  }
  unsigned __int8 v13 = (void *)[v150 objectForKey:@"inserted"];
  uint64_t v14 = (void *)[v150 objectForKey:@"inserted_objectIDs"];
  uint64_t v15 = [v13 count];
  int v16 = v14;
  uint64_t v17 = [v14 count];
  __int128 v138 = &v128;
  uint64_t v135 = v17;
  uint64_t v136 = v15;
  unint64_t v18 = v17 + v15;
  else {
    uint64_t v19 = v17 + v15;
  }
  if (v18 >= 0x201) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v19;
  }
  size_t v152 = v17 + v15;
  id v140 = v6;
  if (v18 > 0x200)
  {
    __int128 v147 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    __int128 v147 = (char *)&v128 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v147, 8 * v19);
  }

  id v21 = v150;
  pthread_t v22 = (void *)[v150 objectForKey:@"updated"];
  unsigned __int8 v23 = (void *)[v21 objectForKey:@"updated_objectIDs"];
  unsigned __int8 v24 = v22;
  uint64_t v25 = [v22 count];
  id v132 = v23;
  uint64_t v26 = [v23 count];
  uint64_t v134 = v25;
  uint64_t v133 = v26;
  unint64_t v27 = v26 + v25;
  else {
    uint64_t v28 = v26 + v25;
  }
  if (v27 >= 0x201) {
    uint64_t v29 = 1LL;
  }
  else {
    uint64_t v29 = v28;
  }
  unint64_t v148 = v26 + v25;
  if (v27 > 0x200)
  {
    __int128 v146 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    __int128 v146 = (char *)&v128 - ((8 * v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v146, 8 * v28);
  }

  id v30 = v150;
  objc_super v31 = (void *)[v150 objectForKey:@"deleted"];
  id v32 = (void *)[v30 objectForKey:@"deleted_objectIDs"];
  uint64_t v33 = [v31 count];
  id v131 = v32;
  uint64_t v34 = [v32 count];
  unint64_t v35 = v34 + v33;
  else {
    uint64_t v36 = v34 + v33;
  }
  if (v35 >= 0x201) {
    uint64_t v37 = 1LL;
  }
  else {
    uint64_t v37 = v36;
  }
  unint64_t v145 = v34 + v33;
  char v129 = v12;
  if (v35 > 0x200)
  {
    __int128 v144 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    __int128 v144 = (char *)&v128 - ((8 * v37 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v144, 8 * v36);
  }

  size_t v38 = v148;
  if (v145 > v148) {
    size_t v38 = v145;
  }
  if (v38 <= v152) {
    unint64_t v39 = v152;
  }
  else {
    unint64_t v39 = v38;
  }
  if (v39 <= 1) {
    uint64_t v40 = 1LL;
  }
  else {
    uint64_t v40 = v39;
  }
  if (v39 >= 0x201) {
    uint64_t v41 = 1LL;
  }
  else {
    uint64_t v41 = v40;
  }
  __int128 v42 = (char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v139 = v39;
  if (v39 > 0x200) {
    __int128 v42 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v40);
  }
  unint64_t v43 = v148 + v152;
  if (v148 + v152 <= 1) {
    uint64_t v44 = 1LL;
  }
  else {
    uint64_t v44 = v148 + v152;
  }
  if (v43 >= 0x201) {
    uint64_t v45 = 1LL;
  }
  else {
    uint64_t v45 = v44;
  }
  size_t v143 = v148 + v152;
  if (v43 > 0x200)
  {
    __int128 v151 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    __int128 v151 = (char *)&v128 - ((8 * v45 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v151, 8 * v44);
  }

  __int128 v149 = (unsigned __int8 *)calloc(1uLL, v143);
  int v141 = *(_DWORD *)(a1 + 40) & 0x40000;
  uint64_t v128 = a4;
  __int128 v46 = (void *)[(id)a1 persistentStoreCoordinator];
  *(_DWORD *)(a1 + 40) |= 0x41000u;
  id v130 = v31;
  if (v152)
  {
    uint64_t v47 = [v13 count];
    __int128 v48 = v13;
    unint64_t v49 = v47;
    uint64_t v50 = v24;
    [v48 getObjects:v42];
    [v16 getObjects:&v42[8 * v49]];
    unint64_t v51 = 0LL;
    while (1)
    {
      __int128 v52 = *(void **)&v42[8 * v51];
      if ((v153 & 1) == 0 && v51 < v49) {
        __int128 v52 = (void *)[*(id *)&v42[8 * v51] objectID];
      }
      if (([v52 _isPersistentStoreAlive] & 1) == 0
        && ([v52 isTemporaryID] & 1) == 0
        && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v52, "_storeIdentifier")))
      {
        break;
      }

      id v53 = (id)[(id)a1 objectWithID:v52];
      uint64_t v54 = (uint64_t)v53;
      *(void *)&v147[8 * v51] = v53;
      if (v53)
      {
        if (([v53 hasChanges] & 1) != 0
          || (uint64_t v55 = *(void **)(v54 + 48)) != 0LL && (uint64_t v55 = (void *)*v55) != 0LL)
        {
          if ((*(_BYTE *)(v54 + 16) & 0x24) != 0)
          {
            [*(id *)(a1 + 64) removeObject:v54];
            [*(id *)(a1 + 88) removeObject:v54];
            *(_DWORD *)(v54 + 16) &= 0xFFFFFFDB;
          }

          uint64_t v56 = **(void ***)(a1 + 168);
          if (v56) {
            objc_msgSend(v56, "removeObject:", objc_msgSend((id)v54, "objectID"));
          }
          LOBYTE(v55) = 1;
        }
      }

      else
      {
        LOBYTE(v55) = 0;
      }

      v149[v51] = v55;
      if ([(id)v54 isFault]) {
        refreshed = 0LL;
      }
      else {
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](v54);
      }
      if (!-[NSKnownKeysDictionary count](refreshed, "count"))
      {

        refreshed = 0LL;
      }

      *(void *)&v151[8 * v51++] = refreshed;
      if (v152 == v51)
      {
        id v58 = objc_alloc(MEMORY[0x189604010]);
        id v137 = (id)[v58 initWithObjects:v147 count:v152];
        goto LABEL_98;
      }
    }

    id v109 = 0LL;
  }

  else
  {
    id v137 = 0LL;
    uint64_t v50 = v24;
LABEL_98:
    if (v148)
    {
      unint64_t v59 = [v50 count];
      [v50 getObjects:v42];
      [v132 getObjects:&v42[8 * v59]];
      unint64_t v60 = 0LL;
      unint64_t v61 = (char *)&v149[v152];
      while (1)
      {
        unint64_t v62 = *(void **)&v42[8 * v60];
        if ((v153 & 1) == 0 && v60 < v59) {
          unint64_t v62 = (void *)[*(id *)&v42[8 * v60] objectID];
        }
        if (([v62 _isPersistentStoreAlive] & 1) == 0
          && ([v62 isTemporaryID] & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v62, "_storeIdentifier")))
        {
          break;
        }

        id v63 = (NSKnownKeysDictionary *)(id)[(id)a1 objectRegisteredForID:v62];
        uint64_t v64 = v63;
        if (v63)
        {
          if ((-[NSKnownKeysDictionary hasChanges](v63, "hasChanges") & 1) != 0)
          {
            LOBYTE(p_isa) = 1;
          }

          else
          {
            p_isa = &v64[6].super.super.super.isa->isa;
            if (p_isa) {
              LOBYTE(p_isa) = *p_isa != 0LL;
            }
          }

          *(void *)&v146[8 * v60] = v64;
          v61[v60] = (char)p_isa;
          char v67 = -[NSKnownKeysDictionary isFault](v64, "isFault");
          unint64_t v66 = v152 + v60;
          if ((v67 & 1) != 0) {
            uint64_t v64 = 0LL;
          }
          else {
            uint64_t v64 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)v64);
          }
        }

        else
        {
          *(void *)&v146[8 * v60] = 0LL;
          unint64_t v66 = v60 + v152;
          v61[v60] = 0;
        }

        if (!-[NSKnownKeysDictionary count](v64, "count"))
        {

          uint64_t v64 = 0LL;
        }

        *(void *)&v151[8 * v66] = v64;
        if (v148 == ++v60) {
          goto LABEL_118;
        }
      }
    }

    else
    {
LABEL_118:
      if (!v145)
      {
LABEL_134:
        if (v152)
        {
          uint64_t v75 = (uint64_t *)v147;
          int v76 = v149;
          __int128 v77 = (void **)v151;
          size_t v78 = v152;
          do
          {
            int v79 = *v76;
            __int128 v80 = *v77;
            if (*v75)
            {
              if (v80) {
                __int128 v81 = (NSKnownKeysDictionary *)*v77;
              }
              else {
                __int128 v81 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              }
              int v82 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:]( a1,  *v75,  v79 != 0,  v81);
            }

            else
            {
              int v82 = 0;
            }

            *v77++ = 0LL;
            unsigned __int8 v83 = v79 | 2;
            if (!v82) {
              unsigned __int8 v83 = v79;
            }
            *v76++ = v83;
            ++v75;
            --v78;
          }

          while (v78);
        }

        if (v152 < v143)
        {
          uint64_t v84 = v133 + v134;
          __int128 v85 = (void **)&v151[8 * v152];
          __int128 v86 = &v149[v136 + v135];
          __int128 v87 = (uint64_t *)v146;
          do
          {
            int v88 = *v86;
            __int128 v89 = *v85;
            if (*v87)
            {
              if (v89) {
                __int128 v90 = (NSKnownKeysDictionary *)*v85;
              }
              else {
                __int128 v90 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              }
              int v91 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:]( a1,  *v87,  v88 != 0,  v90);
            }

            else
            {
              int v91 = 0;
            }

            *v85++ = 0LL;
            unsigned __int8 v92 = v88 | 2;
            if (!v91) {
              unsigned __int8 v92 = v88;
            }
            *v86++ = v92;
            ++v87;
            --v84;
          }

          while (v84);
        }

        if (v152)
        {
          __int128 v93 = (void **)v147;
          __int128 v94 = (char *)v149;
          size_t v95 = v152;
          do
          {
            char v97 = *v94++;
            char v96 = v97;
            int v98 = v97 & 2;
            if (*v93) {
              BOOL v99 = v98 == 0;
            }
            else {
              BOOL v99 = 1;
            }
            if (!v99) {
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v93, v96 & 1);
            }
            ++v93;
            --v95;
          }

          while (v95);
        }

        if (v152 < v143)
        {
          uint64_t v100 = v133 + v134;
          __int128 v101 = (char *)&v149[v136 + v135];
          __int128 v102 = (void **)v146;
          do
          {
            char v104 = *v101++;
            char v103 = v104;
            int v105 = v104 & 2;
            if (*v102) {
              BOOL v106 = v105 == 0;
            }
            else {
              BOOL v106 = 1;
            }
            if (!v106) {
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v102, v103 & 1);
            }
            ++v102;
            --v100;
          }

          while (v100);
        }

        int v107 = 1;
        char v108 = 0;
        *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFBEFFF | v141;
        goto LABEL_176;
      }

      id v68 = v130;
      unint64_t v69 = [v130 count];
      [v68 getObjects:v42];
      [v131 getObjects:&v42[8 * v69]];
      unint64_t v70 = 0LL;
      while (1)
      {
        int v71 = *(void **)&v42[8 * v70];
        if ((v153 & 1) == 0 && v70 < v69) {
          int v71 = (void *)[*(id *)&v42[8 * v70] objectID];
        }
        if (([v71 _isPersistentStoreAlive] & 1) == 0
          && ([v71 isTemporaryID] & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v71, "_storeIdentifier")))
        {
          break;
        }

        if (v71)
        {
          int v72 = **(void ***)(a1 + 168);
          if (!v72)
          {
            **(void **)(a1 + 168) = objc_alloc_init(MEMORY[0x189603FE0]);
            int v72 = **(void ***)(a1 + 168);
          }

          [v72 addObject:v71];
        }

        id v73 = (id)[(id)a1 objectRegisteredForID:v71];
        id v74 = v73;
        if (v73 && (v73[16] & 0x20) == 0) {
          [(id)a1 deleteObject:v73];
        }
        *(void *)&v144[8 * v70++] = v74;
        if (v145 == v70) {
          goto LABEL_134;
        }
      }
    }

    id v109 = v137;
  }

  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFBEFFF | v141;

  int v107 = 0;
  id v137 = 0LL;
  char v108 = 1;
LABEL_176:
  if ((uint64_t)v143 >= 1)
  {
    uint64_t v110 = (id *)v151;
    size_t v111 = v143;
    do
    {
      if (*v110) {

      }
      ++v110;
      --v111;
    }

    while (v111);
  }

  __int128 v112 = v140;
  if (v143 >= 0x201) {
    NSZoneFree(0LL, v151);
  }
  if (v145 >= 0x201) {
    NSZoneFree(0LL, v144);
  }
  if (v152 >= 0x201) {
    NSZoneFree(0LL, v147);
  }
  if (v148 >= 0x201) {
    NSZoneFree(0LL, v146);
  }
  if (v139 >= 0x201) {
    NSZoneFree(0LL, v42);
  }
  if (v149) {
    free(v149);
  }
  if (v112) {
    [v112 drain];
  }
  if (v107)
  {
    if ((v108 & 1) == 0)
    {
      id v113 = objc_alloc_init(MEMORY[0x1896077E8]);
      if (v137)
      {
        id v114 = *(id *)(*(void *)(a1 + 168) + 88LL);
        if (!v114)
        {
          id v114 = objc_alloc_init(MEMORY[0x189603FE0]);
          *(void *)(*(void *)(a1 + 168) + 88LL) = v114;
        }

        [v114 unionSet:v137];
        id v115 = v137;
      }

      id v116 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v117 = v116;
      if (v129) {
        [v116 setObject:v129 forKey:@"newQueryGeneration"];
      }
      for (uint64_t i = 0LL; i != 40; i += 8LL)
      {
        uint64_t v119 = (void *)[v150 objectForKey:*(__CFString **)((char *)&off_189EA83F0 + i)];
        uint64_t v120 = *(uint64_t *)((char *)&off_189EA8418 + i);
        id v121 = (void *)[v150 objectForKey:v120];
        if ([v119 count] || objc_msgSend(v121, "count"))
        {
          if (v119) {
            int v122 = v119;
          }
          else {
            int v122 = (void *)NSSet_EmptySet;
          }
          if (v121) {
            uint64_t v123 = v121;
          }
          else {
            uint64_t v123 = (void *)NSSet_EmptySet;
          }
          if (v153) {
            id v124 = v122;
          }
          else {
            id v124 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v122);
          }
          v125 = v124;
          id v126 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v124, v123);

          [v117 setObject:v126 forKey:v120];
        }
      }

      BOOL v127 = v128 == 0;
      *(void *)(*(void *)(a1 + 168) + 104) = [v117 copy];

      if (v127 && [v142 _isEnabled]) {
        objc_msgSend( (id)a1,  "_setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  0);
      }
      [(id)a1 processPendingChanges];
      if (v113) {
        [v113 drain];
      }
      if (*(void *)(a1 + 24)) {
        -[NSManagedObjectContext _registerAsyncReferenceCallback](a1);
      }
    }
  }

- (void)mergeChangesFromContextDidSaveNotification:(NSNotification *)notification
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v5 = -[NSNotification object](notification, "object");
  if (v5 != self)
  {
    id v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[NSString isEqualToString:]( -[NSNotification name](notification, "name"),  "isEqualToString:",  @"com.apple.coredata.ubiquity.importer.didfinishimport"))
    {
      uint64_t v7 = (void *)objc_opt_class();
      unsigned int v8 = -[NSNotification userInfo](notification, "userInfo");
      v14[0] = self;
      int v9 = (void *)MEMORY[0x189603F18];
      uint64_t v10 = (NSManagedObjectContext **)v14;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (BOOL v11 = -[NSManagedObjectContext persistentStoreCoordinator](v6, "persistentStoreCoordinator"),
            v11 == -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator")))
      {
        id v12 = objc_alloc_init(MEMORY[0x1896077E8]);
        -[NSManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:]( self,  "_mergeChangesFromDidSaveDictionary:usingObjectIDs:",  -[NSNotification userInfo](notification, "userInfo"),  0LL);
        [v12 drain];
        return;
      }

      uint64_t v7 = (void *)objc_opt_class();
      unsigned int v8 = -[NSNotification userInfo](notification, "userInfo");
      unsigned __int8 v13 = self;
      int v9 = (void *)MEMORY[0x189603F18];
      uint64_t v10 = &v13;
    }

    objc_msgSend( v7,  "_mergeChangesFromRemoteContextSave:intoContexts:",  v8,  objc_msgSend(v9, "arrayWithObjects:count:", v10, 1));
  }

- (void)refreshAllObjects
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  BOOL v4 = -[NSManagedObjectContext registeredObjects](self, "registeredObjects");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSManagedObjectContext refreshObject:mergeChanges:]( self,  "refreshObject:mergeChanges:",  *(void *)(*((void *)&v9 + 1) + 8 * v8),  [*(id *)(*((void *)&v9 + 1) + 8 * v8) hasChanges]);
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

  -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");
  [v3 drain];
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
}

- (NSManagedObjectContext)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)ct
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSManagedObjectContext;
  uint64_t v5 = -[NSManagedObjectContext init](&v14, sel_init);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  if (ct == NSMainQueueConcurrencyType)
  {
    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 3);
    dispatchQueue = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    v6->_dispatchQueue = (void *)MEMORY[0x1895F8AE0];
    if (!dispatch_queue_get_specific(dispatchQueue, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
    {
      __int128 v10 = (void *)objc_opt_class();
      dispatch_queue_set_specific(MEMORY[0x1895F8AE0], "com.apple.CoreData.NSManagedObjectContext.mainQueue", v10, 0LL);
      dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
    }

    dispatch_retain(dispatchQueue);
    unsigned int v11 = *(_DWORD *)&v6->_flags & 0xFFF7FFFF;
  }

  else
  {
    if (ct != NSPrivateQueueConcurrencyType)
    {
      if (ct)
      {
        char v8 = 0;
      }

      else
      {
        char v8 = (byte_18C4ABA04 & 1) == 0
          && (current_queue = (dispatch_queue_global_s *)dispatch_get_current_queue(), pthread_main_np())
          && (current_queue == dispatch_get_global_queue(0LL, 0LL)
           || current_queue == (dispatch_queue_global_s *)MEMORY[0x1895F8AE0]);
        uint64_t v5 = v6;
      }

      -[NSManagedObjectContext _initWithParentObjectStore:](v5, v8);
      goto LABEL_19;
    }

    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 2);
    v6->_dispatchQueue = createQueueForMOC(v6);
    unsigned int v11 = *(_DWORD *)&v6->_flags | 0x80000;
  }

  v6->__managedObjectContextFlags flags = (_managedObjectContextFlags)v11;
LABEL_19:
  atomic_store(0LL, (unint64_t *)&v6->_queueOwner);
  if (+[NSSQLCore trackSQLiteDatabaseStatistics](&OBJC_CLASS___NSSQLCore, "trackSQLiteDatabaseStatistics")) {
    int v12 = 0x40000000;
  }
  else {
    int v12 = 0;
  }
  v6->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&v6->_flags & 0xBFFFFFFF | v12);
  return v6;
}

- (void)performBlock:(void *)block
{
  if (self->_dispatchQueue)
  {
    -[NSManagedObjectContext performWithOptions:andBlock:](self, "performWithOptions:andBlock:", 8199LL, block);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can only use -performBlock: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
    -[NSManagedObjectContext userInfo](v3, v4);
  }

- (NSMutableDictionary)userInfo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t result = (NSMutableDictionary *)*((void *)self->_additionalPrivateIvars + 6);
  if (!result)
  {
    *((void *)self->_additionalPrivateIvars + 6) = objc_alloc_init(MEMORY[0x189603FC8]);
    return (NSMutableDictionary *)*((void *)self->_additionalPrivateIvars + 6);
  }

  return result;
}

- (unsigned)_setParentContext:(unsigned __int8 *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    atomic_store(1u, result + 48);
    uint64_t v4 = [a2 persistentStoreCoordinator];
    *(void *)(v3 + 32) = a2;
    if (a2) {
      CFRetain(a2);
    }
    -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, v4);
    uint64_t result = (unsigned __int8 *)-[_PFContextMapTable setForUseWithCoordinator:](*(void **)(v3 + 120), v4);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 96);
      if (v5) {
        uint64_t v5 = *(void *)(v5 + 48);
      }
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    *(void *)(*(void *)(v3 + 168) + 80LL) = v5;
  }

  return result;
}

- (uint64_t)_registerForNotificationsWithCoordinator:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v2 = result;
      uint64_t result = objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  result,  sel__storeConfigurationChanged_,  @"_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification",  a2);
      if ((*(_BYTE *)(v2 + 42) & 0x80) != 0)
      {
        if (*(void *)(v2 + 24))
        {
          if (*(void *)(v2 + 32)) {
            return objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v2,  sel__automaticallyMergeChangesFromContextDidSaveNotification_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  *(void *)(v2 + 32));
          }
        }
      }
    }
  }

  return result;
}

- (void)setParentContext:(NSManagedObjectContext *)parentContext
{
  if (!parentContext)
  {
    uint64_t v4 = (void *)MEMORY[0x189603F70];
    uint64_t v5 = *MEMORY[0x189603A60];
    uint64_t v6 = @"Parent NSManagedObjectContext must not be nil.";
LABEL_15:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
    __43__NSManagedObjectContext_setParentContext___block_invoke(v7);
    return;
  }

  id parentObjectStore = (NSManagedObjectContext *)self->_parentObjectStore;
  if (parentObjectStore == parentContext) {
    return;
  }
  if (parentObjectStore)
  {
    uint64_t v4 = (void *)MEMORY[0x189603F70];
    uint64_t v5 = *MEMORY[0x189603A58];
    uint64_t v6 = @"Context already has a coordinator;  cannot replace.";
    goto LABEL_15;
  }

  if (!parentContext->_dispatchQueue)
  {
    uint64_t v4 = (void *)MEMORY[0x189603F70];
    uint64_t v5 = *MEMORY[0x189603A60];
    uint64_t v6 = @"Parent NSManagedObjectContext must use either NSPrivateQueueConcurrencyType or NSMainQueueConcurrencyType.";
    goto LABEL_15;
  }

  if (self->_dispatchQueue)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    void v10[2] = __43__NSManagedObjectContext_setParentContext___block_invoke;
    v10[3] = &unk_189EA7648;
    v10[4] = self;
    v10[5] = parentContext;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v10);
  }

  else if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    -[NSManagedObjectContext _setParentContext:]((unsigned __int8 *)self, parentContext);
  }

  else
  {
    -[NSManagedObjectContext _setParentContext:]((unsigned __int8 *)self, parentContext);
  }

unsigned __int8 *__43__NSManagedObjectContext_setParentContext___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setParentContext:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 40));
}

- (NSManagedObjectContext)parentContext
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v2 & 1) != 0) {
    return (NSManagedObjectContext *)self->_parentObjectStore;
  }
  else {
    return 0LL;
  }
}

- (void)setName:(NSString *)name
{
  uint64_t v5 = -[NSString copy](name, "copy");
  uint64_t v6 = v5;
  if (self->_dispatchQueue)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __34__NSManagedObjectContext_setName___block_invoke;
    v7[3] = &unk_189EA7648;
    v7[4] = self;
    v7[5] = v5;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v7);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }

    *((void *)self->_additionalPrivateIvars + 21) = v6;
  }

void __34__NSManagedObjectContext_setName___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 168LL) + 168LL) = *(void *)(a1 + 40);
  unsigned __int8 v2 = *(_BYTE **)(a1 + 32);
  if ((v2[42] & 8) != 0)
  {
    __str[0] = 0;
    if (*(void *)(a1 + 40))
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p: ", v2);
      [*(id *)(a1 + 40) UTF8String];
      __strlcat_chk();
    }

    else
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p", v2);
    }

    uint64_t v3 = strdup(__str);
    __dmb(0xBu);
    uint64_t v4 = (unint64_t *)(*(void *)(*(void *)(a1 + 32) + 24LL) + *(unsigned __int16 *)(MEMORY[0x1895FADB0] + 2LL));
    unint64_t v5 = *v4;
    do
    {
      unint64_t v6 = __ldaxr(v4);
      if (v6 != v5)
      {
        __clrex();
        blocuint64_t k = MEMORY[0x1895F87A8];
        uint64_t v7 = __34__NSManagedObjectContext_setName___block_invoke_2;
        p_blocuint64_t k = &block;
        goto LABEL_11;
      }
    }

    while (__stlxr((unint64_t)v3, v4));
    if (!v5) {
      return;
    }
    uint64_t v9 = MEMORY[0x1895F87A8];
    uint64_t v7 = __34__NSManagedObjectContext_setName___block_invoke_3;
    p_blocuint64_t k = &v9;
    uint64_t v3 = (char *)v5;
LABEL_11:
    p_block[1] = 3221225472LL;
    p_block[2] = (uint64_t)v7;
    p_block[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
    p_block[4] = (uint64_t)v3;
    dispatch_async(MEMORY[0x1895F8AE0], p_block);
  }

void __34__NSManagedObjectContext_setName___block_invoke_2(uint64_t a1)
{
}

void __34__NSManagedObjectContext_setName___block_invoke_3(uint64_t a1)
{
}

- (NSString)name
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__11;
  __int128 v10 = __Block_byref_object_dispose__11;
  uint64_t v11 = 0LL;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __30__NSManagedObjectContext_name__block_invoke;
    v5[3] = &unk_189EA78C0;
    v5[4] = self;
    void v5[5] = &v6;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
    unsigned __int8 v2 = (void *)v7[5];
  }

  else
  {
    unsigned __int8 v2 = (void *)[self->_additionalPrivateIvars[21] copy];
    v7[5] = (uint64_t)v2;
  }

  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__NSManagedObjectContext_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 168) + 168) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (void)setTransactionAuthor:(NSString *)transactionAuthor
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __47__NSManagedObjectContext_setTransactionAuthor___block_invoke;
  v3[3] = &unk_189EA7648;
  v3[4] = transactionAuthor;
  v3[5] = self;
  if (self->_dispatchQueue) {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v3);
  }
  else {
    __47__NSManagedObjectContext_setTransactionAuthor___block_invoke((uint64_t)v3);
  }
}

void __47__NSManagedObjectContext_setTransactionAuthor___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 128)] & 1) == 0)
  {
    unsigned __int8 v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 168LL);
    uint64_t v4 = *(void **)(v3 + 128);
    if (v2)
    {
      unint64_t v5 = *(void **)(v3 + 128);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 128) = [v2 copy];
    }

    else
    {
      *(void *)(v3 + 128) = 0LL;
    }
  }

- (NSString)transactionAuthor
{
  uint64_t v12 = 0LL;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  uint64_t v15 = __Block_byref_object_copy__11;
  int v16 = __Block_byref_object_dispose__11;
  uint64_t v17 = 0LL;
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = __43__NSManagedObjectContext_transactionAuthor__block_invoke;
  uint64_t v9 = &unk_189EA78C0;
  __int128 v10 = self;
  uint64_t v11 = &v12;
  if (self->_dispatchQueue)
  {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", &v6);
    unsigned __int8 v2 = v13;
  }

  else
  {
    uint64_t v3 = objc_msgSend(self->_additionalPrivateIvars[16], "copy", v6, v7, v8, v9, v10, v11, v12);
    unsigned __int8 v2 = v13;
    v13[5] = v3;
  }

  uint64_t v4 = (NSString *)(id)v2[5];
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __43__NSManagedObjectContext_transactionAuthor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 168) + 128) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  if (!self->_parentObjectStore) {
    return  +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken",  a3);
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v3 & 1) != 0) {
    return  +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken",  a3);
  }
  else {
    return (id)[self->_parentObjectStore _retainedCurrentQueryGeneration:a3];
  }
}

- (BOOL)_setQueryGenerationFromToken:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (self->_parentObjectStore)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if ((v5 & 1) != 0) {
      return 0;
    }
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  pthread_t v22 = __Block_byref_object_copy__11;
  unsigned __int8 v23 = __Block_byref_object_dispose__11;
  uint64_t v24 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke;
  v18[3] = &unk_189EA7A60;
  v18[4] = a3;
  v18[5] = self;
  v18[6] = &v25;
  v18[7] = &v19;
  if (self->_dispatchQueue) {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v18);
  }
  else {
    __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke((uint64_t)v18);
  }
  if (*((_BYTE *)v26 + 24))
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v7 = (void *)v20[5];
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
    }

    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      uint64_t v15 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v30 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        __int16 v31 = 1024;
        int v32 = 4387;
        _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v16 = (id)v20[5];
    BOOL v6 = *((_BYTE *)v26 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v6;
}

void __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 168LL) + 96LL);
  if (*(void **)(a1 + 32) != v1)
  {
    unsigned __int8 v3 = +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken");
    uint64_t v4 = *(NSQueryGenerationToken **)(a1 + 32);
    if (v4) {
      BOOL v5 = v3 == v4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5
      || (unsigned __int8 v3 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken"),  v3 == *(NSQueryGenerationToken **)(a1 + 32))
      || (unsigned __int8 v3 = +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken"),  v3 == *(NSQueryGenerationToken **)(a1 + 32)))
    {
      uint64_t v9 = v3;
    }

    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) persistentStoreCoordinator];
      id v8 = *(id *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      if (v6)
      {
        if (v6 != *(void *)(v7 + 32))
        {
          id v8 = (id)[*(id *)(a1 + 32) copy];
          uint64_t v7 = *(void *)(a1 + 40);
        }
      }

      id v10 = 0LL;
      if (![*(id *)(v7 + 32) _validateQueryGeneration:v8 error:&v10])
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v10;
        goto LABEL_15;
      }

      uint64_t v9 = (NSQueryGenerationToken *)v8;
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 96LL) = v9;
LABEL_15:
  }

- (BOOL)setQueryGenerationFromToken:(NSQueryGenerationToken *)generation error:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (self->_parentObjectStore)
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if ((v7 & 1) != 0)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Child contexts inherit parent context generations and may not have their own" userInfo:0]);
      return -[NSManagedObjectContext _setChangeTrackingTokenFromToken:error:](v9, v10, v11, v12);
    }

    else
    {
      if (-[NSManagedObjectContext automaticallyMergesChangesFromParent](self, "automaticallyMergesChangesFromParent")
        && +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken") != generation && +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") != generation)
      {
        -[NSManagedObjectContext setAutomaticallyMergesChangesFromParent:]( self,  "setAutomaticallyMergesChangesFromParent:",  0LL);
      }

      return -[NSManagedObjectContext _setQueryGenerationFromToken:error:]( self,  "_setQueryGenerationFromToken:error:",  generation,  error);
    }
  }

  else
  {
    if (error) {
      *error = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03770];
    }
    return 0;
  }

- (BOOL)_setChangeTrackingTokenFromToken:(id)a3 error:(id *)a4
{
  if (self->_parentObjectStore)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if ((v4 & 1) != 0) {
      return 0;
    }
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke;
  v6[3] = &unk_189EA7648;
  v6[4] = a3;
  void v6[5] = self;
  if (self->_dispatchQueue) {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6, a4);
  }
  else {
    __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke((uint64_t)v6);
  }
  return 1;
}

void __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 168LL);
  unsigned __int8 v4 = *(void **)(v3 + 120);
  if (v2 != v4)
  {
    if (v2)
    {
      BOOL v5 = *(void **)(v3 + 120);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 120LL) = v2;
      unsigned __int8 v4 = v5;
    }

    else
    {
      *(void *)(v3 + 120) = 0LL;
    }
  }

- (id)_changeTrackingToken__
{
  return self->_additionalPrivateIvars[15];
}

- (NSQueryGenerationToken)queryGenerationToken
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  uint64_t v17 = __Block_byref_object_copy__11;
  unint64_t v18 = __Block_byref_object_dispose__11;
  uint64_t v19 = 0LL;
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  SEL v10 = __46__NSManagedObjectContext_queryGenerationToken__block_invoke;
  id v11 = &unk_189EA78C0;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  if (self->_dispatchQueue)
  {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", &v8);
    unsigned __int8 v2 = v15;
  }

  else
  {
    id v3 = (id)-[NSManagedObjectContext _queryGenerationToken]( self,  "_queryGenerationToken",  v8,  v9,  v10,  v11,  v12,  v13,  v14);
    unsigned __int8 v2 = v15;
    v15[5] = (uint64_t)v3;
  }

  char v4 = objc_msgSend((id)v2[5], "_isEnabled", v8, v9, v10, v11, v12, v13, v14);
  BOOL v5 = (void *)v15[5];
  if ((v4 & 1) == 0)
  {

    BOOL v5 = 0LL;
    v15[5] = 0LL;
  }

  uint64_t v6 = v5;
  _Block_object_dispose(&v14, 8);
  return v6;
}

id __46__NSManagedObjectContext_queryGenerationToken__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _queryGenerationToken];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (BOOL)automaticallyMergesChangesFromParent
{
  if (self->_dispatchQueue) {
    return *((unsigned __int8 *)&self->_flags + 2) >> 7;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)setAutomaticallyMergesChangesFromParent:(BOOL)automaticallyMergesChangesFromParent
{
  if (self->_dispatchQueue)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke;
    v4[3] = &unk_189EA8728;
    BOOL v5 = automaticallyMergesChangesFromParent;
    v4[4] = self;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v4);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Automatic merging is not supported by contexts using NSConfinementConcurrencyType" userInfo:0]);
    __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke(v3);
  }

uint64_t __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  unsigned int v3 = *(_DWORD *)(v2 + 40);
  if (((v3 >> 23) & 1) != v1)
  {
    *(_DWORD *)(v2 + 40) = v3 & 0xFF7FFFFF | (v1 << 23);
    uint64_t v4 = *(void *)(result + 32);
    if ((*(_BYTE *)(v4 + 42) & 0x80) != 0)
    {
      if (*(void *)(v4 + 32))
      {
        if (*(void *)(v4 + 24)) {
          return objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  *(void *)(result + 32),  sel__automaticallyMergeChangesFromContextDidSaveNotification_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  *(void *)(*(void *)(result + 32) + 32));
        }
      }
    }

    else
    {
      return objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  *(void *)(result + 32),  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  *(void *)(*(void *)(result + 32) + 32));
    }
  }

  return result;
}

- (void)_automaticallyMergeChangesFromContextDidSaveNotification:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke;
  v3[3] = &unk_189EA7648;
  v3[4] = self;
  v3[5] = a3;
  -[NSManagedObjectContext performBlock:](self, "performBlock:", v3);
}

_BYTE *__83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke( uint64_t a1)
{
  id result = *(_BYTE **)(a1 + 32);
  if ((result[42] & 0x80) != 0) {
    return (_BYTE *)[result mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)objectDidBeginEditing:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  BOOL v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL);
    BOOL v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }

  v6.length = CFArrayGetCount(v5);
  v6.locatiouint64_t n = 0LL;
  if (CFArrayGetFirstIndexOfValue(v5, v6, a3) == -1)
  {
    CFArrayAppendValue(v5, a3);
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) == 0 && CFArrayGetCount(v5) >= 1)
    {
      -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", @"isEditing");
      *(_DWORD *)&self->_flags |= 0x2000u;
      -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", @"isEditing");
    }
  }

- (void)objectDidEndEditing:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  BOOL v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL);
    BOOL v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }

  v7.length = CFArrayGetCount(v5);
  v7.locatiouint64_t n = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v7, a3);
  if (FirstIndexOfValue != -1)
  {
    CFArrayRemoveValueAtIndex(v5, FirstIndexOfValue);
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0 && !CFArrayGetCount(v5))
    {
      -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", @"isEditing");
      *(_DWORD *)&self->_flags &= ~0x2000u;
      -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", @"isEditing");
    }
  }

- (BOOL)commitEditingAndReturnError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  BOOL v4 = -[NSManagedObjectContext commitEditing](self, "commitEditing");
  if (!v4)
  {
    BOOL v5 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
    }

    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      uint64_t v13 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        __int16 v17 = 1024;
        int v18 = 4598;
        _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v4;
}

- (BOOL)commitEditing
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  unsigned int v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL);
    unsigned int v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }

  if (-[NSManagedObjectContext isEditing](self, "isEditing")
    && (Count = CFArrayGetCount(v3), CFIndex v5 = Count - 1, Count >= 1))
  {
    do
    {
      int v6 = objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5), "commitEditing");
      BOOL v8 = v5-- != 0;
    }

    while (v6 && v8);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (uint64_t)_sendCommitEditingSelectorToTarget:(uint64_t)a3 sender:(uint64_t)a4 selector:(char)a5 flag:(uint64_t)a6 contextInfo:(int)a7 delayed:
{
  uint64_t v13 = a3;
  char v12 = a5;
  uint64_t v11 = a6;
  if (result)
  {
    uint64_t v10 = (void *)objc_msgSend( MEMORY[0x189603F88],  "invocationWithMethodSignature:",  objc_msgSend(a2, "methodSignatureForSelector:", a4));
    [v10 setSelector:a4];
    [v10 setArgument:&v13 atIndex:2];
    [v10 setArgument:&v12 atIndex:3];
    [v10 setArgument:&v11 atIndex:4];
    if (a7) {
      return objc_msgSend( v10,  "performSelector:withObject:afterDelay:inModes:",  sel_invokeWithTarget_,  a2,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", *MEMORY[0x1896051A8]),  0.0);
    }
    else {
      return [v10 invokeWithTarget:a2];
    }
  }

  return result;
}

- (void)commitEditingWithDelegate:(id)a3 didCommitSelector:(SEL)a4 contextInfo:(void *)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v9 = PF_CALLOC_SCANNED_BYTES(0x18uLL);
  void *v9 = a3;
  v9[1] = a4;
  v9[2] = a5;
  -[NSManagedObjectContext _sendCommitEditingSelectorToTarget:sender:selector:flag:contextInfo:delayed:]( (uint64_t)self,  self,  0LL,  (uint64_t)sel__managedObjectContextEditor_didCommit_contextInfo_,  1,  (uint64_t)v9,  1);
}

- (void)_managedObjectContextEditor:(id)a3 didCommit:(BOOL)a4 contextInfo:(id *)a5
{
  BOOL v6 = a4;
  BOOL v8 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (v8)
  {
    if (!a4) {
      goto LABEL_8;
    }
  }

  else
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL);
    BOOL v8 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
    if (!v6) {
      goto LABEL_8;
    }
  }

  if (-[NSManagedObjectContext isEditing](self, "isEditing", a3))
  {
    CFIndex Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      objc_msgSend( (id)CFArrayGetValueAtIndex(v8, Count - 1),  "commitEditingWithDelegate:didCommitSelector:contextInfo:",  self,  sel__managedObjectContextEditor_didCommit_contextInfo_,  a5);
      return;
    }
  }

- (void)_forceMoveInsertToUpdatedList:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      a2[4] &= 0xFFFFFFED;
    }
    [*(id *)(a1 + 72) removeObject:a2];
    [*(id *)(a1 + 80) removeObject:a2];
    _PFFastMOCObjectWillChange(a1, a2);
  }

- (void)_newUnchangedLockedObjects
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = [*(id *)(a1 + 104) count];
  unsigned int v3 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v2];
  MEMORY[0x1895F8858](v3);
  BOOL v6 = (id *)((char *)v11 - v5);
  else {
    bzero((char *)v11 - v5, 8 * v4);
  }
  [*(id *)(a1 + 104) getObjects:v6];
  if (v2 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v2;
    do
    {
      uint64_t v9 = *v7;
      if (([*v7 hasChanges] & 1) == 0)
      {
        [v3 addObject:v9];
        if ((v9[17] & 0x80) != 0) {
          -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, v9, a1);
        }
      }

      ++v7;
      --v8;
    }

    while (v8);
  }

  return v3;
}

- (void)_unlimitRequest:(void *)a1
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = (id)objc_msgSend((id)objc_msgSend(a1, "substitutionVariables"), "mutableCopy");
    objc_msgSend( v2,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", 0),  @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
    [a1 setSubstitutionVariables:v2];
  }

  else
  {
    [a1 setFetchLimit:0];
  }

- (void)_forceRegisterLostFault:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)[a2 objectID];
    Value = _PFCMT_GetValue(*(void **)(a1 + 120), v4);
    if (Value) {
      BOOL v6 = Value == a2;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      -[NSManagedObjectContext _registerObject:withID:](a1, (uint64_t)a2, v4);
    }

    else
    {
      [a2 managedObjectContext];
      _NSCoreDataLog( 1LL,  (uint64_t)@"fatal: Failed to re-registered lost fault. fault %p with oid %@ has a moc of %p but we expected %p\n",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)a2);
      __break(1u);
    }
  }

- (uint64_t)_changeIDsForManagedObjects:(void *)a3 toIDs:
{
  uint64_t v3 = a1;
  v24[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = [a2 count];
    if (v6 < 1)
    {
      return 0LL;
    }

    else
    {
      unint64_t v7 = v6;
      unsigned __int8 v8 = atomic_load((unsigned __int8 *)(v3 + 50));
      if ((v8 & 1) != 0)
      {
        uint64_t v6 = (uint64_t)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v9 = (void *)v6;
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      uint64_t v22 = (uint64_t)&v22;
      MEMORY[0x1895F8858](v6);
      uint64_t v11 = (char *)&v22 - v10;
      if (v7 > 0x200)
      {
        uint64_t v11 = (char *)NSAllocateScannedUncollectable();
        uint64_t v13 = (char *)NSAllocateScannedUncollectable();
      }

      else
      {
        bzero((char *)&v22 - v10, 8 * v7);
        MEMORY[0x1895F8858](v12);
        uint64_t v13 = (char *)&v22 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v13, 8 * v7);
      }

      objc_msgSend(a2, "getObjects:range:", v11, 0, v7, v22);
      objc_msgSend(a3, "getObjects:range:", v13, 0, objc_msgSend(a3, "count"));
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v15 = *(void **)&v11[8 * i];
        id v16 = (id)[v15 objectID];
        id v17 = *(id *)&v13[8 * i];
        if (v17 != v16)
        {
          [v9 setObject:*(void *)&v13[8 * i] forKey:v16];
          _PFCMT_RemoveValue(*(void **)(v3 + 120), v16);
          -[NSManagedObject _setObjectID__:](v15, v17);
          uint64_t v18 = v15[3];
          if (v18) {
            snapshot_set_objectID(v18, v17);
          }
          _PFCMT_SetValue(*(void *)(v3 + 120), v17, v15);
          uint64_t v19 = *(id **)(*(void *)(v3 + 168) + 8LL);
          if (v19)
          {
            [*v19 setObject:v17 forKey:v16];
            [*(id *)(*(void *)(*(void *)(v3 + 168) + 8) + 8) setObject:v16 forKey:v17];
          }
        }
      }

      if (v7 >= 0x201)
      {
        NSZoneFree(0LL, v11);
        NSZoneFree(0LL, v13);
      }

      if ((v8 & 1) != 0)
      {
        if ([v9 count])
        {
          id v20 = objc_alloc(MEMORY[0x189607950]);
          unsigned __int8 v23 = @"_NSManagedObjectContextObjectIDMutationMappingKey";
          v24[0] = v9;
          uint64_t v3 = objc_msgSend( v20,  "initWithName:object:userInfo:",  @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification",  v3,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
        }

        else
        {
          uint64_t v3 = 0LL;
        }
      }

      else
      {
        uint64_t v3 = 0LL;
      }
    }
  }

  return v3;
}

- (uint64_t)_batchRetainedObjects:(uint64_t)a1 forCount:(uint64_t)a2 withIDs:(uint64_t)a3 optionalHandler:(id *)a4 withInlineStorage:(uint64_t)a5
{
  uint64_t v32 = a5;
  uint64_t result = 0LL;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1 && (_DWORD)a3)
  {
    unint64_t v10 = 0LL;
    uint64_t v11 = 8LL * a3;
    uint64_t v12 = a3;
    do
    {
      id Value = (id)_PFCMT_GetValue(*(void **)(a1 + 120), a4[v10 / 8]);
      if (Value)
      {
        id Value = Value;
        uint64_t v12 = (v12 - 1);
      }

      *(void *)(a2 + v10) = Value;
      v10 += 8LL;
    }

    while (v11 != v10);
    if ((_DWORD)v12)
    {
      __int16 v31 = (unint64_t *)[*a4 entity];
      uint64_t v14 = _PFFastEntityClass(v31);
      uint64_t v28 = (uint64_t)&v28;
      uint64_t v30 = v12;
      MEMORY[0x1895F8858](v14);
      id v16 = (char *)&v28 - v15;
      else {
        bzero((char *)&v28 - v15, 8LL * v12);
      }
      uint64_t v29 = a3;
      if (objc_msgSend(v14, "allocBatch:withEntity:count:", v16, v31, v12, v28) < v12) {
        [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"Could not allocate memory." userInfo:0];
      }
      uint64_t v17 = 0LL;
      unsigned int v18 = 0;
      do
      {
        uint64_t v19 = *(void **)&v16[8 * v17];
        do
          unsigned int v20 = v18;
        while (*(void *)(a2 + 8LL * v18++));
        uint64_t v22 = v20;
        id v23 = a4[v20];
        _PFfastOidRetain(0, (unint64_t)v23);
        [v19 _initWithEntity:v31 withID:v23 withHandler:v32 withContext:a1];
        v19[7] = *(void *)(a1 + 152);
        *(void *)(a2 + 8 * v22) = v19;
        _PFCMT_SetValue(*(void *)(a1 + 120), v23, v19);
        uint64_t v24 = **(void ***)(a1 + 168);
        if (v24 && [v24 containsObject:v23])
        {
          if (![v19 managedObjectContext]) {
            -[NSManagedObjectContext _forceRegisterLostFault:](a1, v19);
          }
          [(id)a1 deleteObject:v19];
        }

        ++v17;
      }

      while (v17 != v30);
      uint64_t v25 = (unsigned int *)(*(void *)(a1 + 152) + 8LL);
      do
        unsigned int v26 = __ldaxr(v25);
      while (__stlxr(v26 + v12, v25));
      uint64_t v27 = v29;
      return v27;
    }

    else
    {
      return a3;
    }
  }

  return result;
}

+ (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = (void *)[a2 userInfo];
  uint64_t v6 = [v5 objectForKey:@"NSCoreDataPrimaryError"];
  if (v6)
  {
    *a3 = v6;
    return 0LL;
  }

  unint64_t v7 = (void *)[v5 mutableCopy];
  if (v7)
  {
    unsigned __int8 v8 = v7;
    [v7 setObject:a2 forKey:@"NSUnderlyingException"];
    if (a2) {
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  a2,  @"NSUnderlyingException",  0);
    if (a2)
    {
LABEL_6:
      if (a2[5]) {
        uint64_t v9 = a2[5];
      }
      else {
        uint64_t v9 = 134060LL;
      }
      goto LABEL_9;
    }
  }

  uint64_t v9 = 0LL;
LABEL_9:
  uint64_t v10 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:v9 userInfo:v8];
  if (v10)
  {
    *a3 = v10;
  }

  else
  {
    uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
    unsigned int v18 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
      __int16 v22 = 1024;
      int v23 = 6271;
      _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }
  }

  return 0LL;
}

- (uint64_t)_validateObjects:(int)a3 forOperation:(uint64_t *)a4 error:(int)a5 exhaustive:(int)a6 forSave:
{
  int v117 = a6;
  int v122 = a5;
  uint64_t v119 = a4;
  int v126 = a3;
  unint64_t v139 = (int *)a1;
  v156[1] = *MEMORY[0x1895F89C0];
  unint64_t v7 = [a2 count];
  if (v7 <= 1) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v7 >= 0x201) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = &v116[-((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  unint64_t v128 = v7;
  id v120 = a2;
  if (v7 >= 0x201)
  {
    BOOL v127 = (void *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:");
    goto LABEL_12;
  }

  bzero(&v116[-((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)], 8 * v8);
  BOOL v127 = v10;
  [a2 getObjects:v10];
  if (v128)
  {
LABEL_12:
    id v124 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v12 = v139 + 10;
    uint64_t v121 = *MEMORY[0x189607460];
    uint64_t v118 = @"NSDetailedErrors";
    uint64_t v135 = @"NSValidationErrorKey";
    int v123 = 1;
    while (1)
    {
      id v15 = objc_alloc_init(MEMORY[0x1896077E8]);
      __int128 v138 = (void *)v127[v14];
      v152[0] = 0LL;
      uint64_t v129 = v14;
      id v130 = v15;
      if (v126 == 2)
      {
        int v125 = [v138 validateForDelete:v152];
      }

      else
      {
        if (v126 != 1)
        {
          if (v126) {
            goto LABEL_20;
          }
          char v16 = [v138 validateForInsert:v152];
          goto LABEL_21;
        }

        int v125 = [v138 validateForUpdate:v152];
      }

      if ((v125 & 1) != 0) {
        goto LABEL_20;
      }
      unint64_t v25 = objc_msgSend((id)objc_msgSend(v139, "mergePolicy"), "mergeType");
      if (v25 > 4)
      {
        char v16 = 0;
        goto LABEL_21;
      }

      char v16 = 0;
      if (((1LL << v25) & 0x16) != 0)
      {
        if ((-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v139, (uint64_t)v138) & 1) == 0)
        {
          *v12 |= 0x1000u;
          if (v152[0]) {
            uint64_t v29 = (const __CFString *)v152[0];
          }
          else {
            uint64_t v29 = @"null";
          }
          [v152[0] userInfo];
          [v138 objectID];
          _NSCoreDataLog( 4LL,  (uint64_t)@"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v29);
          if (![v138 managedObjectContext]) {
            -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v138);
          }
          [v139 deleteObject:v138];
          -[NSManagedObject _propagateDelete:](v138, 3);
          *v12 &= ~0x1000u;
          v152[0] = 0LL;
LABEL_20:
          char v16 = 1;
          goto LABEL_21;
        }

        if (objc_msgSend( (id)objc_msgSend(v152[0], "userInfo"),  "objectForKey:",  @"NSValidationErrorShouldAttemptRecoveryKey"))
        {
          unsigned int v26 = (void *)[v152[0] domain];
          if ([v26 isEqualToString:v121] && objc_msgSend(v152[0], "code") == 1560)
          {
            uint64_t v27 = (void *)[v152[0] userInfo];
            uint64_t v28 = (void *)[v27 objectForKey:v118];
          }

          else
          {
            v156[0] = v152[0];
            uint64_t v28 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v156 count:1];
          }

          uint64_t v36 = v28;
          __int128 v150 = 0u;
          __int128 v151 = 0u;
          __int128 v148 = 0u;
          __int128 v149 = 0u;
          uint64_t v37 = [v28 countByEnumeratingWithState:&v148 objects:v155 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v149;
            uint64_t v131 = *(void *)v149;
            id v132 = v36;
            do
            {
              uint64_t v39 = 0LL;
              uint64_t v133 = v37;
              do
              {
                if (*(void *)v149 != v38) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v40 = (void *)[*(id *)(*((void *)&v148 + 1) + 8 * v39) userInfo];
                _NSCoreDataLog( 2LL,  (uint64_t)@"checkpoint attempting validation failure recovery with error %@",  v41,  v42,  v43,  v44,  v45,  v46,  (uint64_t)v40);
                uint64_t v47 = [v40 objectForKey:v135];
                id v48 = -[NSEntityDescription _relationshipNamed:]((void *)[v138 entity], v47);
                unint64_t v49 = v48;
                if (v48 && ([v48 isToMany] & 1) == 0)
                {
                  uint64_t v68 = [v49 name];
                  unint64_t v69 = (void *)[v138 valueForKey:v68];
                  if ([v69 isFault]
                    && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v139, (uint64_t)v69) & 1) == 0)
                  {
                    *v12 |= 0x1000u;
                    if (v152[0]) {
                      unint64_t v70 = (const __CFString *)v152[0];
                    }
                    else {
                      unint64_t v70 = @"null";
                    }
                    [v152[0] userInfo];
                    [v69 objectID];
                    _NSCoreDataLog( 4LL,  (uint64_t)@"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it",  v71,  v72,  v73,  v74,  v75,  v76,  (uint64_t)v70);
                    if (![v69 managedObjectContext]) {
                      -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v69);
                    }
                    [v139 deleteObject:v69];
                    -[NSManagedObject _propagateDelete:](v69, 3);
                    *v12 &= ~0x1000u;
                  }
                }

                else if ([v49 isToMany])
                {
                  int v137 = [v49 isOrdered];
                  uint64_t v50 = [v49 name];
                  unint64_t v51 = (void *)[v138 valueForKey:v50];
                  if ([v51 count])
                  {
                    __int128 v52 = (void *)[v51 copy];
                    id v136 = v49;
                    uint64_t v134 = v39;
                    __int128 v146 = 0u;
                    __int128 v147 = 0u;
                    __int128 v144 = 0u;
                    __int128 v145 = 0u;
                    uint64_t v53 = [v52 countByEnumeratingWithState:&v144 objects:v154 count:16];
                    if (v53)
                    {
                      uint64_t v54 = 0LL;
                      uint64_t v55 = *(void *)v145;
                      do
                      {
                        for (uint64_t i = 0LL; i != v53; ++i)
                        {
                          if (*(void *)v145 != v55) {
                            objc_enumerationMutation(v52);
                          }
                          uint64_t v57 = *(void **)(*((void *)&v144 + 1) + 8 * i);
                          if ([v57 isFault]
                            && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]( (uint64_t)v139,  (uint64_t)v57) & 1) == 0)
                          {
                            *v12 |= 0x1000u;
                            if (v152[0]) {
                              id v58 = (const __CFString *)v152[0];
                            }
                            else {
                              id v58 = @"null";
                            }
                            [v152[0] userInfo];
                            [v57 objectID];
                            _NSCoreDataLog( 4LL,  (uint64_t)@"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it",  v59,  v60,  v61,  v62,  v63,  v64,  (uint64_t)v58);
                            if (![v57 managedObjectContext]) {
                              -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v57);
                            }
                            [v139 deleteObject:v57];
                            if (!v54)
                            {
                              if (v137)
                              {
                                uint64_t v65 = [v136 name];
                                uint64_t v66 = [v138 mutableOrderedSetValueForKey:v65];
                              }

                              else
                              {
                                uint64_t v67 = [v136 name];
                                uint64_t v66 = [v138 mutableSetValueForKey:v67];
                              }

                              uint64_t v54 = (void *)v66;
                            }

                            [v54 removeObject:v57];
                            -[NSManagedObject _propagateDelete:](v57, 3);
                            *v12 &= ~0x1000u;
                          }
                        }

                        uint64_t v53 = [v52 countByEnumeratingWithState:&v144 objects:v154 count:16];
                      }

                      while (v53);
                    }

                    uint64_t v38 = v131;
                    uint64_t v36 = v132;
                    uint64_t v37 = v133;
                    uint64_t v39 = v134;
                  }
                }

                ++v39;
              }

              while (v39 != v37);
              uint64_t v37 = [v36 countByEnumeratingWithState:&v148 objects:v155 count:16];
            }

            while (v37);
          }
        }

        v152[0] = 0LL;
        if (v126 == 2)
        {
          int v125 = [v138 validateForDelete:v152];
        }

        else
        {
          if (v126 != 1) {
            goto LABEL_20;
          }
          int v125 = [v138 validateForUpdate:v152];
        }

        if ((v125 & 1) != 0) {
          goto LABEL_20;
        }
        __int128 v77 = (void *)[v152[0] domain];
        if ([v77 isEqualToString:v121] && objc_msgSend(v152[0], "code") == 1560)
        {
          id v78 = v152[0];
          [v152[0] userInfo];
          _NSCoreDataLog( 2LL,  (uint64_t)@"validation recovery attempt FAILED with multiple errors %@ and %@.",  v79,  v80,  v81,  v82,  v83,  v84,  (uint64_t)v78);
          __int128 v85 = (void *)[v152[0] userInfo];
          __int128 v86 = (void *)[v85 objectForKey:v118];
          __int128 v142 = 0u;
          __int128 v143 = 0u;
          __int128 v140 = 0u;
          __int128 v141 = 0u;
          uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v153 count:16];
          if (v87)
          {
            uint64_t v88 = *(void *)v141;
            do
            {
              for (uint64_t j = 0LL; j != v87; ++j)
              {
                if (*(void *)v141 != v88) {
                  objc_enumerationMutation(v86);
                }
                __int128 v90 = *(void **)(*((void *)&v140 + 1) + 8 * j);
                [v90 userInfo];
                _NSCoreDataLog( 2LL,  (uint64_t)@"validation recovery attempt FAILED with %@ and %@.",  v91,  v92,  v93,  v94,  v95,  v96,  (uint64_t)v90);
              }

              uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v153 count:16];
              char v16 = 0;
            }

            while (v87);
            goto LABEL_21;
          }
        }

        else
        {
          id v97 = v152[0];
          [v152[0] userInfo];
          _NSCoreDataLog( 2LL,  (uint64_t)@"validation recovery attempt FAILED with %@ and %@.",  v98,  v99,  v100,  v101,  v102,  v103,  (uint64_t)v97);
        }

        char v16 = 0;
      }

- (void)_clearOriginalSnapshotAndInitializeRec:(void *)result
{
  if (result)
  {
    int v1 = result;
    -[NSManagedObject _setOriginalSnapshot__:](result, 0LL);
    return -[NSManagedObject _setLastSnapshot__:](v1, 0LL);
  }

  return result;
}

- (uint64_t)_postContextDidSaveNotificationWithUserInfo:(uint64_t)a1
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (byte_18C4ABDBE)
  {
    uint64_t v5 = [a2 objectForKey:@"managedObjectContext"];
    if (v5)
    {
      id v6 = (id)v5;
      unint64_t v7 = v4;
    }

    else
    {
      id v8 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)&OBJC_CLASS____PFWeakReference, a1);
      [v4 setObject:v8 forKey:@"managedObjectContext"];
      if ((*(_BYTE *)(a1 + 43) & 0x20) == 0) {
        goto LABEL_7;
      }
      unint64_t v7 = a2;
      id v6 = v8;
    }

    [v7 setObject:v6 forKey:@"managedObjectContext"];
  }

- (void)_informParentStoreNoLongerInterestedInObjectIDs:(uint64_t)a3 generation:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1 && [a2 count])
  {
    id v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(a2);
          }
          unsigned int v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v11 isTemporaryID] & 1) == 0) {
            [v6 addObject:v11];
          }
        }

        uint64_t v8 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }

    [*(id *)(a1 + 32) managedObjectContextDidUnregisterObjectsWithIDs:v6 generation:a3];
  }

- (id)_retainedObjectsFromRemovedStore:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  unint64_t Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  unint64_t v6 = Count;
  if (Count <= 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (const void **)((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (Count > 0x200) {
    uint64_t v9 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v7);
  }
  unint64_t v10 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v9);
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v10];
  if (v10)
  {
    __int128 v12 = (id *)v9;
    do
    {
      id v13 = *v12;
      if ((id)objc_msgSend((id)objc_msgSend(*v12, "objectID"), "persistentStore") == a3) {
        [v11 addObject:v13];
      }
      ++v12;
      --v10;
    }

    while (v10);
  }

  if (v6 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
  return v11;
}

- (void)_setDisableDiscardEditing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)_disableDiscardEditing
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (void)_persistentStoreDidUpdateAdditionalRows:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a2 count];
    id v10 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v4];
    if (v4)
    {
      for (uint64_t i = 0LL; v4 != i; ++i)
      {
        uint64_t v6 = [a2 objectAtIndex:i];
        uint64_t v7 = (_DWORD *)[a1 objectRegisteredForID:v6];
        if (v7)
        {
          uint64_t v8 = v7;
          if ([v7 hasChanges])
          {
            objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Objects should not be both modified and additional" userInfo:0]);
            return;
          }

          int v9 = v8[4];
          if ((v9 & 0x200) == 0) {
            v8[4] = v9 | 0x200;
          }
          [a1 refreshObject:v8 mergeChanges:0];
        }

        else
        {
          [v10 addObject:v6];
        }
      }
    }

    if ([v10 count]) {
      -[NSManagedObjectContext _informParentStoreNoLongerInterestedInObjectIDs:generation:]( (uint64_t)a1,  v10,  [a1 queryGenerationToken]);
    }
  }

- (BOOL)_allowAncillaryEntities
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (void)_setAllowAncillaryEntities:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xF7FFFFFF | v3);
}

- (void)_setFaultingError:(id)a3
{
  if (self->_additionalPrivateIvars[19] != a3)
  {
    id v5 = a3;

    *((void *)self->_additionalPrivateIvars + 19) = a3;
  }

- (int64x2_t)_updateDatabaseStaticsWithCacheStats:(uint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__updateDatabaseStaticsWithCacheStats_);
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 168) + 160LL);
    if (v4
      || (*(void *)(*(void *)(a1 + 168) + 160LL) = -[NSSQLiteDatabaseStatistics initWithPageSize:]( objc_alloc(&OBJC_CLASS___NSSQLiteDatabaseStatistics),  "initWithPageSize:",  a2[1].i64[1]),  (uint64_t v4 = *(void *)(*(void *)(a1 + 168) + 160LL)) != 0))
    {
      uint64_t v6 = a2[1].i64[0];
      int64x2_t result = vaddq_s64(*(int64x2_t *)(v4 + 8), (int64x2_t)vextq_s8(*a2, *a2, 8uLL));
      *(int64x2_t *)(v4 + 8) = result;
      *(void *)(v4 + 24) += v6;
    }
  }

  return result;
}

- (void)_undoInsertions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  id v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      id v10 = (NSManagedObject *)[v5 objectAtIndex:i];
      unsigned int v11 = (void *)[v6 objectAtIndex:i];
      if (!-[NSManagedObject managedObjectContext](v10, "managedObjectContext")) {
        id v10 = -[NSManagedObjectContext objectWithID:]( self,  "objectWithID:",  -[NSManagedObject objectID](v10, "objectID"));
      }
      -[NSManagedObjectContext deleteObject:](self, "deleteObject:", v10);
    }
  }

  if (self) {
    --self->_ignoreChangeNotification;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) awakeFromSnapshotEvents:2];
      }

      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }

- (uint64_t)_registerUndoForOperation:(void *)a3 withObjects:(uint64_t)a4 withExtraArguments:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (*(void *)(*(void *)(a1 + 168) + 40LL))
  {
    uint64_t v8 = [a3 count];
    uint64_t result = [MEMORY[0x189603FA8] arrayWithCapacity:v8];
    if (v8)
    {
      id v10 = (void *)result;
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        uint64_t v12 = (void *)[a3 objectAtIndex:i];
        uint64_t v13 = -[NSManagedObject _newSnapshotForUndo__](v12);
        if (-[NSKnownKeysDictionary count](v13, "count")) {
          uint64_t v14 = (uint64_t)v13;
        }
        else {
          uint64_t v14 = NSKeyValueCoding_NullValue;
        }
        [v10 addObject:v14];

        -[NSManagedObject _setLastSnapshot__:](v12, 0LL);
      }

      if (a4) {
        uint64_t v15 = a4;
      }
      else {
        uint64_t v15 = NSKeyValueCoding_NullValue;
      }
      return objc_msgSend( *(id *)(*(void *)(a1 + 168) + 40),  "registerUndoWithTarget:selector:object:",  a1,  a2,  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  a3,  v10,  v15,  objc_msgSend(MEMORY[0x189607968], "numberWithShort:", *(__int16 *)(a1 + 44)),  0));
    }
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (result)
    {
      uint64_t v16 = result;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(a3);
          }
          -[NSManagedObject _setLastSnapshot__:](*(void **)(*((void *)&v19 + 1) + 8 * v18++), 0LL);
        }

        while (v16 != v18);
        uint64_t result = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v16 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)_undoDeletionsMovedToUpdates:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:i];
      -[NSManagedObjectContext deleteObject:](self, "deleteObject:", v8);
      [v8 awakeFromSnapshotEvents:4];
    }
  }

- (void)_undoDeletions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  uint64_t v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 0),  "objectAtIndex:",  0);
  unint64_t v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 1);
  uint64_t v8 = (void *)[a3 objectAtIndex:3];
  if (v7 == NSKeyValueCoding_NullValue) {
    int v9 = 0LL;
  }
  else {
    int v9 = (void *)v7;
  }
  int undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  else {
    unsigned int v11 = 0LL;
  }
  if (v11) {
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  else {
    id v12 = 0LL;
  }
  uint64_t v13 = [v5 count];
  if (!v13) {
    goto LABEL_30;
  }
  uint64_t v14 = v13;
  uint64_t v24 = v12;
  for (uint64_t i = 0LL; i != v14; ++i)
  {
    uint64_t v16 = (_DWORD *)objc_msgSend(v5, "objectAtIndex:", i, v24);
    uint64_t v17 = (void *)[v6 objectAtIndex:i];
    if (v11) {
      uint64_t v18 = [v11 objectAtIndex:i];
    }
    else {
      uint64_t v18 = 0LL;
    }
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:]( (uint64_t)self,  (uint64_t)v16,  (void *)[v16 objectID]);
    if (v17 != (void *)NSKeyValueCoding_NullValue)
    {
      -[NSManagedObject _updateFromUndoSnapshot:]((id **)v16, v17);
      uint64_t v17 = (void *)[v25 objectAtIndex:i];
      if ((void *)NSKeyValueCoding_NullValue != v17)
      {
        -[NSManagedObject _setLastSnapshot__:](v16, v17);
        uint64_t v17 = (void *)NSKeyValueCoding_NullValue;
      }
    }

    if (v18 && (void *)v18 != v17 && (objc_msgSend((id)objc_msgSend(v16, "objectID"), "isTemporaryID") & 1) == 0)
    {
      if (v16)
      {
        v16[4] &= 0xFFFFFFDB;
        -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", v16);
        -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", v16);
        v16[4] &= 0xFFFFFFED;
      }

      else
      {
        -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", 0LL);
        -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", 0LL);
      }

      -[NSMutableSet removeObject:](self->_unprocessedInserts, "removeObject:", v16);
      _PFFastMOCObjectWillChange((uint64_t)self, v16);
      [v24 addObject:v16];
    }
  }

  id v12 = v24;
  if (self) {
LABEL_30:
  }
    --self->_ignoreChangeNotification;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0LL; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * j) awakeFromSnapshotEvents:4];
      }

      uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v20);
  }

  if ([v12 count])
  {
    [self->_additionalPrivateIvars[5] registerUndoWithTarget:self selector:sel__undoDeletionsMovedToUpdates_ object:v12];
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:v12];
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]( self,  v23,  0LL,  0LL,  0LL,  0LL,  0);
  }
}

- (void)_createAndPostChangeNotification:(void *)a3 deletions:(void *)a4 updates:(void *)a5 refreshes:(void *)a6 deferrals:(int)a7 wasMerge:
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v56 = a1;
  if (!a1) {
    return;
  }
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v57 = v13;
  int v53 = a7;
  id v55 = a3;
  if (![a6 count])
  {
    uint64_t v19 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_50;
  }

  uint64_t v54 = a5;
  if ([a3 count])
  {
    uint64_t v14 = (void *)[a6 mutableCopy];
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    uint64_t v15 = [a3 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v67;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(a3);
          }
          [v14 removeObject:*(void *)(*((void *)&v66 + 1) + 8 * i)];
        }

        uint64_t v16 = [a3 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }

      while (v16);
    }

    if ([a2 count])
    {
      a5 = v54;
      if (v14) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    a5 = v54;
  }

  else
  {
    if ([a2 count])
    {
LABEL_16:
      uint64_t v14 = (void *)[a6 mutableCopy];
LABEL_17:
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      uint64_t v20 = [a2 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v63;
        do
        {
          for (uint64_t j = 0LL; j != v21; ++j)
          {
            if (*(void *)v63 != v22) {
              objc_enumerationMutation(a2);
            }
            [v14 addObject:*(void *)(*((void *)&v62 + 1) + 8 * j)];
          }

          uint64_t v21 = [a2 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }

        while (v21);
        a2 = v14;
        a5 = v54;
      }

      else
      {
        a2 = v14;
      }

      goto LABEL_31;
    }

    uint64_t v14 = 0LL;
  }

  if (v14) {
    a2 = v14;
  }
  else {
    a2 = a6;
  }
LABEL_31:
  if ([a4 count])
  {
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    uint64_t v24 = [a4 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v19 = 0LL;
      uint64_t v26 = *(void *)v59;
      if (v14) {
        a6 = v14;
      }
      do
      {
        for (uint64_t k = 0LL; k != v25; ++k)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v58 + 1) + 8 * k);
          if ([a6 containsObject:v28])
          {
            if (!v19) {
              uint64_t v19 = (void *)[a4 mutableCopy];
            }
            [v19 removeObject:v28];
          }
        }

        uint64_t v25 = [a4 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }

      while (v25);
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    if (v19) {
      a4 = v19;
    }
    id v13 = v57;
    a5 = v54;
  }

  else
  {
    uint64_t v19 = 0LL;
    id v13 = v57;
  }

- (void)_undoUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  uint64_t v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      id v10 = (NSManagedObject *)[v5 objectAtIndex:i];
      unsigned int v11 = (void *)[v6 objectAtIndex:i];
      if (!-[NSManagedObject managedObjectContext](v10, "managedObjectContext")) {
        id v10 = -[NSManagedObjectContext objectWithID:]( self,  "objectWithID:",  -[NSManagedObject objectID](v10, "objectID"));
      }
      if (v11 != (void *)NSKeyValueCoding_NullValue)
      {
        _PFFastMOCObjectWillChange((uint64_t)self, v10);
        -[NSManagedObject _updateFromUndoSnapshot:]((id **)v10, v11);
      }
    }
  }

  if (self) {
    --self->_ignoreChangeNotification;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) awakeFromSnapshotEvents:8];
      }

      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }

- (void)_forceInsertionForObject:(id)a3
{
  if (a3)
  {
    int v5 = *((_DWORD *)a3 + 4);
    if ((v5 & 0x24) != 0)
    {
      -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", a3);
      -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", a3);
      int v5 = *((_DWORD *)a3 + 4);
    }

    if ((v5 & 9) != 0)
    {
      -[NSMutableSet removeObject:](self->_unprocessedChanges, "removeObject:", a3);
      -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", a3);
      int v5 = *((_DWORD *)a3 + 4);
    }

    *((_DWORD *)a3 + 4) = v5 & 0xFFFFFFC0;
  }

  uint64_t v6 = (void *)[a3 objectID];
  -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:]((uint64_t)self, (uint64_t)a3, v6);
  -[NSMutableSet addObject:](self->_insertedObjects, "addObject:", a3);
  if (a3) {
    *((_DWORD *)a3 + 4) |= 0x10u;
  }
  id v7 = *self->_additionalPrivateIvars;
  if (v7) {
    [v7 removeObject:v6];
  }
}

- (void)_clearChangedThisTransaction:(id)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0LL);
  int v5 = (void *)[a3 objectAtIndex:0];
  int undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  if (undoTransactionID == (unsigned __int16)[v5 shortValue])
  {
    id v7 = (void *)[a3 objectAtIndex:1];
    uint64_t v8 = -[NSMutableSet count](self->_changedObjects, "count");
    if (v8)
    {
      unint64_t v9 = v8;
      unint64_t v10 = MEMORY[0x1895F8858](v8);
      uint64_t v12 = (char *)v16 - v11;
      if (v10 > 0x200) {
        uint64_t v12 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v16 - v11, 8 * v10);
      }
      -[NSMutableSet getObjects:](self->_changedObjects, "getObjects:", v12);
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        uint64_t v14 = *(void *)&v12[8 * i];
        if (([v7 containsObject:v14] & 1) == 0)
        {
          if (v14) {
            *(_DWORD *)(v14 + 16) &= ~8u;
          }
          -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", v14);
        }
      }

      if (v9 >= 0x201) {
        NSZoneFree(0LL, v12);
      }
    }
  }

  *(_DWORD *)&self->_flags &= ~0x20u;
  BOOL v15 = -[NSMutableSet count](self->_insertedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedInserts, "count")
     || -[NSMutableSet count](self->_deletedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedDeletes, "count")
     || -[NSMutableSet count](self->_changedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedChanges, "count") != 0;
  if (((*(_DWORD *)&self->_flags >> 10) & 1) != v15)
  {
    -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", @"hasChanges");
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | (v15 << 10));
    -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", @"hasChanges");
  }

- (void)_postRefreshedObjectsNotificationAndClearList
{
  if ([*(id *)(a1 + 112) count]
    || (uint64_t v2 = *(void *)(a1 + 168), *(void *)(v2 + 88))
    || *(void *)(v2 + 104))
  {
    int v3 = (void *)MEMORY[0x186E3E5D8]();
    if ([*(id *)(a1 + 112) count]) {
      uint64_t v4 = (void *)[*(id *)(a1 + 112) copy];
    }
    else {
      uint64_t v4 = 0LL;
    }
    int v5 = *(void **)(*(void *)(a1 + 168) + 88LL);
    [*(id *)(a1 + 112) removeAllObjects];
    *(void *)(*(void *)(a1 + 168) + 88LL) = 0LL;
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]( (void *)a1,  0LL,  0LL,  0LL,  v4,  v5,  *(void *)(*(void *)(a1 + 168) + 104LL) != 0LL);

    objc_autoreleasePoolPop(v3);
  }

- (uint64_t)_processPendingDeletions:(void *)a3 withInsertions:(void *)a4 withUpdates:withNewlyForgottenList:withRemovedChangedObjects:
{
  v21[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = [*(id *)(a1 + 64) count];
  if (!v8) {
    return 0LL;
  }
  unint64_t v9 = v8;
  uint64_t v10 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v8];
  if (v9 >= 0x201) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v9;
  }
  unint64_t v12 = (8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = (char *)v21 - v12;
  if (v9 > 0x200) {
    uint64_t v13 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v21 - v12, 8 * v9);
  }
  [*(id *)(a1 + 64) getObjects:v13];
  for (uint64_t i = 0LL; i != v9; ++i)
  {
    uint64_t v15 = *(void *)&v13[8 * i];
    if (v15)
    {
      *(_DWORD *)(v15 + 16) &= ~4u;
      if (![*(id *)(a1 + 72) containsObject:v15])
      {
        unsigned int v18 = *(_DWORD *)(v15 + 16);
        if ((v18 & 0x10) != 0)
        {
          [*(id *)(a1 + 80) removeObject:v15];
          *(_DWORD *)(v15 + 16) &= ~0x10u;
          __int128 v19 = a3;
        }

        else
        {
          if ((v18 & 8) != 0)
          {
            [*(id *)(a1 + 96) removeObject:v15];
            [a4 addObject:v15];
            unsigned int v18 = *(_DWORD *)(v15 + 16) & 0xFFFFFFF7;
          }

          *(_DWORD *)(v15 + 16) = v18 | 0x20;
LABEL_19:
          __int128 v19 = *(void **)(a1 + 88);
        }

        [v19 addObject:v15];
        __int128 v17 = (void *)v10;
LABEL_22:
        [v17 addObject:v15];
        [*(id *)(a1 + 56) removeObject:v15];
        if (v15) {
          *(_DWORD *)(v15 + 16) &= ~1u;
        }
        goto LABEL_24;
      }
    }

    else if (([*(id *)(a1 + 72) containsObject:0] & 1) == 0)
    {
      goto LABEL_19;
    }

    [*(id *)(a1 + 64) removeObject:v15];
    [*(id *)(a1 + 72) removeObject:v15];
    if (v15)
    {
      int v16 = *(_DWORD *)(v15 + 16);
      *(_DWORD *)(v15 + 16) = v16 & 0xFFFFFFFD;
      __int128 v17 = a3;
      if ((v16 & 0x38) != 0) {
        continue;
      }
      goto LABEL_22;
    }

    [a3 addObject:0];
    [*(id *)(a1 + 56) removeObject:0];
LABEL_24:
    [a2 addObject:v15];
  }

  if (v9 >= 0x201) {
    NSZoneFree(0LL, v13);
  }
  return v10;
}

- (void)_processPendingInsertions:(id *)a1 withDeletions:(void *)a2 withUpdates:(void *)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = [a1[9] count];
  if (!v6) {
    return 0LL;
  }
  unint64_t v7 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v6];
  if (v7 >= 0x201) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v7;
  }
  unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v11 = (char *)v17 - v10;
  if (v7 > 0x200) {
    uint64_t v11 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v17 - v10, 8 * v7);
  }
  [a1[9] getObjects:v11];
  for (uint64_t i = 0LL; i != v7; ++i)
  {
    uint64_t v13 = *(void *)&v11[8 * i];
    if (!v13)
    {
      [a1[10] addObject:0];
      goto LABEL_19;
    }

    int v14 = *(_DWORD *)(v13 + 16);
    *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFFD;
    if ((v14 & 8) != 0)
    {
      uint64_t v15 = a3;
LABEL_17:
      [v15 addObject:v13];
      continue;
    }

    if ((v14 & 0x10) != 0)
    {
      uint64_t v15 = a2;
      goto LABEL_17;
    }

    if ((v14 & 0x20) != 0)
    {
      *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFDD;
      [a1[11] removeObject:v13];
    }

    else
    {
      [a1[10] addObject:v13];
      *(_DWORD *)(v13 + 16) |= 0x10u;
    }

- (void)_processPendingUpdates:(uint64_t)a1
{
  v14[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = [*(id *)(a1 + 56) count];
  if (!v4) {
    return 0LL;
  }
  unint64_t v5 = v4;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v4];
  if (v5 >= 0x201) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = v5;
  }
  unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)v14 - v8;
  if (v5 > 0x200) {
    uint64_t v9 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v14 - v8, 8 * v5);
  }
  [*(id *)(a1 + 56) getObjects:v9];
  for (uint64_t i = 0LL; i != v5; ++i)
  {
    uint64_t v11 = *(void *)&v9[8 * i];
    if (v11)
    {
      int v12 = *(_DWORD *)(v11 + 16);
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFFE;
      if ((v12 & 0x30) != 0) {
        goto LABEL_14;
      }
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFF6 | 8;
    }

    [*(id *)(a1 + 96) addObject:v11];
LABEL_14:
    [v6 addObject:v11];
    [a2 addObject:v11];
  }

  if (v5 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
  return v6;
}

- (void)_processRecentlyForgottenObjects:(void *)a1
{
  v12[1] = *MEMORY[0x1895F89C0];
  unint64_t v4 = [a2 count];
  unint64_t v5 = MEMORY[0x1895F8858]();
  unint64_t v8 = (char *)v12 - v7;
  if (v5 >= 0x201)
  {
    unint64_t v8 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v8];
  }

  else
  {
    bzero((char *)v12 - v7, 8 * v6);
    [a2 getObjects:v8];
    if (!v4) {
      return;
    }
  }

  uint64_t v9 = 0LL;
  do
  {
    uint64_t v10 = *(void *)&v8[8 * v9];
    if (v10) {
      uint64_t v11 = _insertion_fault_handler;
    }
    else {
      uint64_t v11 = 0LL;
    }
    -[NSFaultHandler turnObject:intoFaultWithContext:](v11, *(void *)&v8[8 * v9], (uint64_t)a1);
    [a1 _forgetObject:v10 propagateToObjectStore:0 removeFromRegistry:1];
    ++v9;
  }

  while (v4 != v9);
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v8);
  }
}

void __92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  unint64_t v8 = (void *)-[NSEntityDescription _keypathsToPrefetchForDeletePropagation](a2);
  if ([v8 count])
  {
    [*(id *)(a1 + 32) setRelationshipKeyPathsForPrefetching:v8];
    uint64_t v15 = 0LL;
    if (![*(id *)(a1 + 40) executeFetchRequest:*(void *)(a1 + 32) error:&v15])
    {
      _NSCoreDataLog( 2LL,  (uint64_t)@"Delete propagation prefetching failed with error: %@",  v9,  v10,  v11,  v12,  v13,  v14,  v15);
      *a4 = 1;
    }
  }

- (uint64_t)_addObjectIDsInsertUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 136LL);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 136LL) = objc_alloc_init(MEMORY[0x189603FA8]);
        unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 136LL);
      }

      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }

          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (uint64_t)_addObjectIDsUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 144LL);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 144LL) = objc_alloc_init(MEMORY[0x189603FA8]);
        unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 144LL);
      }

      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }

          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (uint64_t)_addObjectIDsUpdatedByTriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 112LL);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 112LL) = objc_alloc_init(MEMORY[0x189603FE0]);
        unint64_t v4 = *(void **)(*(void *)(v3 + 168) + 112LL);
      }

      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }

          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (void)_undoManagerCheckpoint:(id)a3
{
  if ((*((_BYTE *)&self->_flags + 1) & 8) == 0)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__processEndOfEventNotification_);
    }
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke;
    v6[3] = &unk_189EA7758;
    v6[4] = self;
    dispatchQueue = self->_dispatchQueue;
    BOOL v5 = -[NSManagedObjectContext tryLock](self, "tryLock", a3);
    if (!dispatchQueue)
    {
      if (!v5) {
        return;
      }
      __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke((uint64_t)v6);
      goto LABEL_9;
    }

    if (v5)
    {
      -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
LABEL_9:
      -[NSManagedObjectContext unlock](self, "unlock");
      return;
    }

    -[NSManagedObjectContext performBlock:](self, "performBlock:", v6);
  }

uint64_t __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result && !*(_DWORD *)(result + 16))
  {
    uint64_t result = [(id)result _isDeallocating];
    if ((result & 1) == 0)
    {
      id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
      [*(id *)(a1 + 32) processPendingChanges];
      [v3 drain];
      return (uint64_t)0LL;
    }
  }

  return result;
}

- (void)_storeConfigurationChanged:(id)a3
{
  if (self && !self->_wasDisposed && (-[NSManagedObjectContext _isDeallocating](self, "_isDeallocating") & 1) == 0)
  {
    uint64_t v4 = [a3 userInfo];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = NSDictionary_EmptyDictionary;
    }
    if (self->_dispatchQueue)
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      void v11[2] = __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke;
      v11[3] = &unk_189EA7B70;
      v11[5] = v5;
      v11[6] = sel__processChangedStoreConfigurationNotification_;
      v11[4] = self;
      uint64_t v6 = self;
      BOOL v7 = -[NSManagedObjectContext tryLock](self, "tryLock");
      __int128 v8 = self;
      if (v7)
      {
        -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v11);
        -[NSManagedObjectContext unlock](self, "unlock");
      }

      else
      {
        -[NSManagedObjectContext performBlock:](self, "performBlock:", v11);
      }
    }

    else
    {
      __int128 v9 = self;
      if (-[NSManagedObjectContext tryLock](self, "tryLock"))
      {
        if (!self->_wasDisposed && (-[NSManagedObjectContext _isDeallocating](self, "_isDeallocating") & 1) == 0)
        {
          -[NSManagedObjectContext performSelector:withObject:]( self,  "performSelector:withObject:",  sel__processChangedStoreConfigurationNotification_,  [MEMORY[0x189603F18] arrayWithObject:v5]);
          -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
        }

        -[NSManagedObjectContext unlock](self, "unlock");
      }

      else
      {
        objc_msgSend( (id)objc_msgSend(MEMORY[0x189607960], "defaultQueue"),  "enqueueNotification:postingStyle:",  a3,  2);
      }
    }
  }

- (void)_processChangedStoreConfigurationNotification:(id)a3
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v5 = (void *)[a3 lastObject];
  uint64_t v6 = self;
  id v83 = objc_alloc_init(MEMORY[0x1896077E8]);
  BOOL v7 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v8 = (void *)[v5 objectForKey:@"changedUUID"];
  if (v8)
  {
    __int128 v9 = v8;
    uint64_t v82 = v5;
    id v97 = 0LL;
    __int128 v10 = (void *)[v8 objectAtIndex:0];
    uint64_t v11 = [v9 objectAtIndex:1];
    __int128 v86 = (_PFArray *)[v9 objectAtIndex:2];
    uint64_t v12 = -[NSMutableSet count](self->_insertedObjects, "count");
    uint64_t v13 = -[NSMutableSet count](self->_unprocessedInserts, "count");
    unint64_t v14 = v13 + v12;
    if (v13 + v12)
    {
      __int128 v85 = &v78;
      MEMORY[0x1895F8858](v13);
      int v16 = (char *)&v78 - v15;
      if (v14 > 0x200) {
        int v16 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v78 - v15, 8 * v14);
      }
      -[NSMutableSet getObjects:](self->_insertedObjects, "getObjects:", v16);
      -[NSMutableSet getObjects:]( self->_unprocessedInserts,  "getObjects:",  &v16[8 * -[NSMutableSet count](self->_insertedObjects, "count")]);
      uint64_t v17 = 0LL;
      uint64_t v87 = v10;
      do
      {
        id v97 = *(void **)&v16[8 * v17];
        unsigned int v18 = (void *)[v97 objectID];
        if ((void *)[v18 persistentStore] == v10)
        {
          if ([v18 isTemporaryID])
          {
            [v18 _setPersistentStore:v11];
          }

          else
          {
            v96.versiouint64_t n = (CFIndex)-[NSTemporaryObjectID initWithEntity:]( [NSTemporaryObjectID alloc],  "initWithEntity:",  [v18 entity]);
            uint64_t v19 = v11;
            [(id)v96.version _setPersistentStore:v11];
            uint64_t v20 = _PFStackAllocatorCreate((unint64_t *)v100, 1024LL);
            CFArrayRef v21 = CFArrayCreate(v20, (const void **)&v97, 1LL, 0LL);
            CFArrayRef v22 = CFArrayCreate(v20, (const void **)&v96, 1LL, 0LL);
            uint64_t v23 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)self, v21, v22);
            if (v23)
            {
              uint64_t v24 = (void *)v23;
              [v7 addObject:v23];
            }

            if (v100[0].copyDescription)
            {
              uint64_t v11 = v19;
              if (v21) {
                CFRelease(v21);
              }
              __int128 v10 = v87;
              if (v22) {
                CFRelease(v22);
              }
            }

            else
            {
              v100[0].retaiuint64_t n = (CFDictionaryRetainCallBack)v100[0].version;
              uint64_t v11 = v19;
              __int128 v10 = v87;
            }
          }
        }

        ++v17;
      }

      while (v14 != v17);
      if (v14 >= 0x201) {
        NSZoneFree(0LL, v16);
      }
    }

    unint64_t v25 = -[_PFArray count](v86, "count");
    uint64_t v81 = &v78;
    unint64_t v26 = MEMORY[0x1895F8858](v25);
    __int128 v29 = (char *)&v78 - v28;
    size_t v30 = 8 * v27;
    if (v26 >= 0x402)
    {
      __int128 v29 = (char *)NSAllocateScannedUncollectable();
      uint64_t v87 = (void *)NSAllocateScannedUncollectable();
      __int128 v85 = (uint64_t *)NSAllocateScannedUncollectable();
      uint64_t v84 = (void *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v78 - v28, 8 * v27);
      MEMORY[0x1895F8858](v31);
      unint64_t v32 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v87 = (uint64_t *)((char *)&v78 - v32);
      bzero((char *)&v78 - v32, v30);
      MEMORY[0x1895F8858](v33);
      __int128 v85 = (uint64_t *)((char *)&v78 - v32);
      bzero((char *)&v78 - v32, v30);
      MEMORY[0x1895F8858](v34);
      uint64_t v84 = (uint64_t *)((char *)&v78 - v32);
      bzero((char *)&v78 - v32, v30);
      if (!v25)
      {
        CFIndex v35 = 0LL;
        goto LABEL_35;
      }
    }

    unint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    CFIndex v35 = 0LL;
    do
    {
      unint64_t v38 = v25;
      uint64_t v39 = v29;
      id v40 = v86;
      id v41 = -[_PFArray objectAtIndex:](v86, "objectAtIndex:", v36);
      unint64_t v42 = v36 + 1;
      uint64_t v43 = -[_PFArray objectAtIndex:](v40, "objectAtIndex:", v42);
      id Value = (void *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v41);
      id v97 = Value;
      if (Value)
      {
        v85[v37] = (uint64_t)Value;
        v84[v37] = v43;
        objc_msgSend(v97, "_setVersionReference__:", 1);
        ++v37;
      }

      *(void *)&v39[8 * v35] = v41;
      __int128 v29 = v39;
      v87[v35++] = v43;
      unint64_t v36 = v42 + 1;
      unint64_t v25 = v38;
    }

    while (v36 < v38);
    if (v37)
    {
      uint64_t v45 = objc_alloc(&OBJC_CLASS____PFArray);
      uint64_t v46 = -[_PFArray initWithObjects:count:andFlags:andContext:]( v45,  "initWithObjects:count:andFlags:andContext:",  v85,  v37,  48LL,  self);
      id v47 = objc_alloc(&OBJC_CLASS____PFArray);
      id v48 = -[_PFArray initWithObjects:count:andFlags:](v47, "initWithObjects:count:andFlags:", v84, v37, 0LL);
      __int128 v86 = v46;
      uint64_t v80 = v48;
      uint64_t v49 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)self, v46, v48);
      if (v49)
      {
        uint64_t v50 = (void *)v49;
        [v7 addObject:v49];
      }

      goto LABEL_36;
    }

- (uint64_t)_implicitObservationInfoForEntity:(void *)a3 forResultingClass:
{
  if (result)
  {
    uint64_t v5 = result;
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__implicitObservationInfoForEntity_forResultingClass_);
    }
    if (*(__int16 *)(v5 + 46) <= 0)
    {
      uint64_t v16 = 0LL;
      uint64_t v6 = [(id)v5 persistentStoreCoordinator];
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 96);
      }
      else {
        uint64_t v7 = 0LL;
      }
      if (!*(void *)(v5 + 128))
      {
        uint64_t v8 = *(void *)(*(void *)(v5 + 168) + 80LL);
        if (!v8)
        {
          *(void *)(*(void *)(v5 + 168) + 80) = _PFModelMapTotalEntityCountForModel((void *)[a2 managedObjectModel]);
          uint64_t v8 = *(void *)(*(void *)(v5 + 168) + 80LL);
        }

        *(void *)(v5 + 128) = PF_CALLOC_OBJECT_ARRAY(2 * v8);
      }

      uint64_t v9 = _PFModelMapSlotForEntity(v7, a2);
      uint64_t v10 = 2 * v9;
      uint64_t v11 = *(void *)(v5 + 128);
      uint64_t v12 = *(void *)(v11 + 16 * v9);
      if (v12)
      {
        uint64_t v16 = *(void *)(v11 + ((16 * v9) | 8));
      }

      else
      {
        id v13 = -[NSEntityDescription _new_implicitlyObservedKeys](a2);
        _PFFastEntityClass(a2);
        unint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo();
        objc_autoreleasePoolPop(v14);

        uint64_t v12 = NSKeyValueCoding_NullValue;
        if (ImplicitObservationInfo) {
          uint64_t v12 = ImplicitObservationInfo;
        }
        *(void *)(*(void *)(v5 + 128) + 8 * v10) = v12;
        *(void *)(*(void *)(v5 + 128) + ((8 * v10) | 8)) = 0LL;
      }

      if (v12 == NSKeyValueCoding_NullValue) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = v12;
      }
      if (result) {
        *a3 = v16;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke( uint64_t a1)
{
  int v1 = *(_DWORD **)(a1 + 32);
  if (v1)
  {
    if (!v1[4])
    {
      char v3 = [*(id *)(a1 + 32) _isDeallocating];
      int v1 = *(_DWORD **)(a1 + 32);
      if ((v3 & 1) == 0)
      {
        objc_msgSend( *(id *)(a1 + 32),  "performSelector:withObject:",  *(void *)(a1 + 48),  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", *(void *)(a1 + 40)));
        -[NSManagedObjectContext _processReferenceQueue:](*(void *)(a1 + 32), 0);
        int v1 = *(_DWORD **)(a1 + 32);
      }
    }
  }
}

- (void)_setAllowsExpandedUserInfoKeys:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke;
    v6[3] = &unk_189EA8728;
    v6[4] = self;
    BOOL v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x20000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xDFFFFFFF | v5);
  }

uint64_t __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke( uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40LL) = *(_DWORD *)(*(void *)(result + 32) + 40LL) & 0xDFFFFFFF | (*(unsigned __int8 *)(result + 40) << 29);
  return result;
}

- (void)setShouldRefreshAfterSave:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke;
    v6[3] = &unk_189EA8728;
    v6[4] = self;
    BOOL v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x4000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFBFFFFFF | v5);
  }

uint64_t __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke( uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40LL) = *(_DWORD *)(*(void *)(result + 32) + 40LL) & 0xFBFFFFFF | (*(unsigned __int8 *)(result + 40) << 26);
  return result;
}

- (BOOL)shouldRefreshAfterSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (void)setShouldPerformSecureOperation:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke;
    v6[3] = &unk_189EA8728;
    v6[4] = self;
    BOOL v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }

  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x2000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFDFFFFFF | v5);
  }

uint64_t __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke( uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40LL) = *(_DWORD *)(*(void *)(result + 32) + 40LL) & 0xFDFFFFFF | (*(unsigned __int8 *)(result + 40) << 25);
  return result;
}

- (BOOL)shouldPerformSecureOperation
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)trackSQLiteDatabaseStatistics
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  BOOL v3 = a3;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (v3) {
    int v5 = 0x40000000;
  }
  else {
    int v5 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xBFFFFFFF | v5);
}

- (id)databaseStatistics
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (id)[self->_additionalPrivateIvars[20] copy];
}

- (id)performBlockWithResult:(id)a3
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke;
  v5[3] = &unk_189EA8578;
  v5[4] = a3;
  void v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  return *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
}

- (void)_setDelegate:(id)a3
{
  *((void *)self->_additionalPrivateIvars + 2) = a3;
}

- (id)_orderedSetWithResultsFromFetchRequest:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return  -[_PFFetchedResultOrderedSetWrapper initWithArray:andContext:]( objc_alloc(&OBJC_CLASS____PFFetchedResultOrderedSetWrapper),  "initWithArray:andContext:",  a3,  self);
}

- (void)_stopConflictDetectionForObject:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  -[NSMutableSet removeObject:](self->_lockedObjects, "removeObject:", a3);
}

+ (void)_mergeChangesFromRemoteContextSave:(id)a3 intoContexts:(id)a4
{
}

+ (void)_mergeChangesFromRemoteContextSave:(void *)a3 intoContexts:(uint64_t)a4 withClientQueryGeneration:
{
  uint64_t v67 = a4;
  id v68 = a2;
  uint64_t v107 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a3 && [a3 count])
  {
    id v61 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v76 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v5 = [v68 objectForKey:@"managedObjectContext"];
    if (v5
      && (Weauint64_t k = objc_loadWeak((id *)(v5 + 8))) != 0LL
      && (BOOL v7 = Weak, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = (void *)[MEMORY[0x189603FE0] set];
      do
      {
        [v8 addObject:v7];
        BOOL v7 = (void *)[v7 parentContext];
      }

      while (v7);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v100 objects:v106 count:16];
    if (v9)
    {
      uint64_t v75 = 0LL;
      uint64_t v10 = *(void *)v101;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v101 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  *(void *)(*((void *)&v100 + 1) + 8 * v11));
          id v13 = v12;
          if (v12)
          {
            id WeakRetained = objc_loadWeakRetained(&v12->_object);
            if (WeakRetained && (!v8 || ([v8 containsObject:WeakRetained] & 1) == 0))
            {
              [v76 addObject:WeakRetained];
              if (!v75) {
                uint64_t v75 = (void *)[WeakRetained persistentStoreCoordinator];
              }
            }
          }

          else
          {
            id WeakRetained = 0LL;
          }

          ++v11;
        }

        while (v9 != v11);
        uint64_t v15 = [a3 countByEnumeratingWithState:&v100 objects:v106 count:16];
        uint64_t v9 = v15;
      }

      while (v15);
    }

    else
    {
      uint64_t v75 = 0LL;
    }

    uint64_t v16 = [v76 count];
    while (v16 > 0)
    {
      if (v75 != (void *)objc_msgSend((id)objc_msgSend(v76, "objectAtIndex:", --v16), "persistentStoreCoordinator"))
      {

        [v61 drain];
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Mismatched PSCs in parameter contexts" userInfo:0]);
        __break(1u);
        return;
      }
    }

    if (v75 && [v76 count])
    {
      uint64_t v17 = (void *)[v68 objectForKey:@"newQueryGeneration"];
      else {
        unsigned int v18 = 0LL;
      }
      id v63 = v18;
      id v66 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  @"inserted",  @"inserted_objectIDs",  @"deleted",  @"deleted_objectIDs",  @"updated",  @"updated_objectIDs",  @"refreshed",  @"refreshed_objectIDs",  @"invalidated",  @"invalidated_objectIDs",  @"invalidatedAll",  0);
      id v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v68, "count"));
      id v70 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v71 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v96 = 0LL;
      id v97 = &v96;
      uint64_t v98 = 0x2020000000LL;
      uint64_t v99 = 0LL;
      uint64_t v90 = 0LL;
      __int128 v91 = &v90;
      uint64_t v92 = 0x3052000000LL;
      __int128 v93 = __Block_byref_object_copy__11;
      __int128 v94 = __Block_byref_object_dispose__11;
      id v95 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v60 = [v75 managedObjectModel];
      uint64_t v19 = [v66 count];
      uint64_t v20 = v19;
      if (v19)
      {
        unint64_t v21 = 0LL;
        uint64_t v62 = v19;
LABEL_38:
        uint64_t v22 = [v66 objectAtIndex:v21];
        uint64_t v23 = (void *)[v68 objectForKey:v22];
        unint64_t v74 = [v23 count];
        if (!v23 || !v74) {
          goto LABEL_95;
        }
        unint64_t v72 = v21;
        uint64_t v64 = v22;
        uint64_t v65 = &v59;
        if (v74 >= 0x201) {
          uint64_t v24 = 1LL;
        }
        else {
          uint64_t v24 = v74;
        }
        unint64_t v25 = (8 * v24 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        unint64_t v26 = (char *)&v59 - v25;
        if (v74 > 0x200) {
          unint64_t v26 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v59 - v25, 8 * v74);
        }
        [v23 getObjects:v26];
        size_t v27 = 0LL;
        uint64_t v28 = 0LL;
        while (1)
        {
          __int128 v29 = *(const __CFURL **)&v26[8 * v28];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              unint64_t v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v29, 0LL);
              goto LABEL_53;
            }

            __int128 v29 = (const __CFURL *)-[__CFURL objectID](v29, "objectID");
          }

          size_t v30 = (void *)objc_msgSend( (id)-[__CFURL persistentStore](v29, "persistentStore"),  "_persistentStoreCoordinator");
          if (v30 != v75)
          {
            uint64_t v31 = (const __CFURL *)-[__CFURL URIRepresentation](v29, "URIRepresentation");
            unint64_t v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v31, 0LL);
LABEL_53:
            __int128 v29 = (const __CFURL *)v32;
          }

          if (v29) {
            *(void *)&v26[8 * v27++] = v29;
          }
          if (v74 == ++v28)
          {
            if (v72 >= 4)
            {
              uint64_t v33 = calloc(1uLL, v27);
              v97[3] = (uint64_t)v33;
              __int128 v86 = 0u;
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              __int128 v89 = 0u;
              uint64_t v34 = [v76 countByEnumeratingWithState:&v86 objects:v105 count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v87;
                do
                {
                  for (uint64_t i = 0LL; i != v34; ++i)
                  {
                    if (*(void *)v87 != v35) {
                      objc_enumerationMutation(v76);
                    }
                    uint64_t v37 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                    v85[0] = MEMORY[0x1895F87A8];
                    v85[1] = 3221225472LL;
                    v85[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke;
                    v85[3] = &unk_189EA85A0;
                    v85[6] = v27;
                    v85[7] = v26;
                    v85[4] = v37;
                    v85[5] = &v96;
                    if (v37[3]) {
                      [v37 performBlockAndWait:v85];
                    }
                    else {
                      __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke((uint64_t)v85);
                    }
                  }

                  uint64_t v34 = [v76 countByEnumeratingWithState:&v86 objects:v105 count:16];
                }

                while (v34);
              }
            }

            if (v27)
            {
              uint64_t v38 = 0LL;
              uint64_t v73 = 0LL;
              while (1)
              {
                uint64_t v39 = *(void *)&v26[8 * v38];
                if (v39) {
                  break;
                }
LABEL_84:
                if (++v38 == v27) {
                  goto LABEL_88;
                }
              }

              if (v72 >= 6)
              {
                if (!*(_BYTE *)(v97[3] + v38))
                {
LABEL_83:
                  [v71 addObject:v39];
                  uint64_t v44 = v73;
                  *(void *)&v26[8 * v73] = v39;
                  uint64_t v73 = v44 + 1;
                  goto LABEL_84;
                }
              }

              else if (v72 == 1)
              {
                goto LABEL_83;
              }

              uint64_t v40 = [*(id *)&v26[8 * v38] entity];
              if (v40)
              {
                if ((*(_BYTE *)(v40 + 120) & 4) != 0)
                {
                  id v41 = *(void **)(v40 + 72);
                }

                else
                {
                  do
                  {
                    id v41 = (void *)v40;
                    uint64_t v40 = [(id)v40 superentity];
                  }

                  while (v40);
                }
              }

              else
              {
                id v41 = 0LL;
              }

              uint64_t v42 = [v41 name];
              id v43 = (id)[v70 objectForKey:v42];
              if (!v43)
              {
                id v43 = objc_alloc_init(MEMORY[0x189603FA8]);
                [v70 setObject:v43 forKey:v42];
              }

              [v43 addObject:v39];
              goto LABEL_83;
            }

            uint64_t v73 = 0LL;
LABEL_88:
            uint64_t v45 = (void *)v97[3];
            if (v45)
            {
              free(v45);
              v97[3] = 0LL;
            }

            id v46 = objc_alloc(MEMORY[0x189603F18]);
            uint64_t v20 = v62;
            unint64_t v21 = v72;
            id v47 = (void *)[v46 initWithObjects:v26 count:v73];
            if ([v47 count])
            {
              [v69 setValue:v47 forKey:v64];
              if (v63) {
                [v69 setObject:v63 forKey:@"newQueryGeneration"];
              }
            }

            if (v74 >= 0x201) {
              NSZoneFree(0LL, v26);
            }
LABEL_95:
            if (++v21 == v20) {
              break;
            }
            goto LABEL_38;
          }
        }
      }

      if ([v70 count])
      {
        id v48 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](v48, "setPersistentStoreCoordinator:", v75);
        -[NSManagedObjectContext setUndoManager:](v48, "setUndoManager:", 0LL);
        v84[0] = MEMORY[0x1895F87A8];
        v84[1] = 3221225472LL;
        v84[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2;
        v84[3] = &unk_189EA85C8;
        v84[4] = v60;
        v84[5] = v48;
        v84[6] = &v90;
        [v70 enumerateKeysAndObjectsUsingBlock:v84];
      }

      else
      {
        id v48 = 0LL;
      }

      uint64_t v49 = [v76 count];
      if (v49)
      {
        for (uint64_t j = 0LL; j != v49; ++j)
        {
          uint64_t v51 = (void *)[v76 objectAtIndex:j];
          if (![v51 parentContext])
          {
            v83[0] = MEMORY[0x1895F87A8];
            v83[1] = 3221225472LL;
            v83[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4;
            v83[3] = &unk_189EA7A38;
            v83[4] = v51;
            v83[5] = v69;
            v83[6] = v67;
            if (v51[3]) {
              [v51 performBlockAndWait:v83];
            }
            else {
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4((uint64_t)v83);
            }
          }
        }

        for (uint64_t k = 0LL; k != v49; ++k)
        {
          int v53 = (void *)[v76 objectAtIndex:k];
          if ([v53 parentContext])
          {
            v82[0] = MEMORY[0x1895F87A8];
            v82[1] = 3221225472LL;
            v82[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5;
            v82[3] = &unk_189EA7A38;
            v82[4] = v53;
            v82[5] = v69;
            v82[6] = v67;
            if (v53[3]) {
              [v53 performBlockAndWait:v82];
            }
            else {
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5((uint64_t)v82);
            }
          }
        }
      }

      uint64_t v54 = (void *)v97[3];
      if (v54)
      {
        free(v54);
        v97[3] = 0LL;
      }

      if (v48)
      {
        v81[0] = MEMORY[0x1895F87A8];
        v81[1] = 3221225472LL;
        v81[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6;
        v81[3] = &unk_189EA7758;
        v81[4] = v48;
        -[NSManagedObjectContext performBlockAndWait:](v48, "performBlockAndWait:", v81);
      }

      [v61 drain];
      id v55 = 0LL;
      if (v48) {

      }
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      uint64_t v56 = [v76 countByEnumeratingWithState:&v77 objects:v104 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v78;
        do
        {
          for (uint64_t m = 0LL; m != v56; ++m)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(v76);
            }
            -[NSManagedObjectContext _registerAsyncReferenceCallback](*(void *)(*((void *)&v77 + 1) + 8 * m));
          }

          uint64_t v56 = [v76 countByEnumeratingWithState:&v77 objects:v104 count:16];
        }

        while (v56);
      }

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v96, 8);
    }

    else
    {

      [v61 drain];
    }
  }

- (void)_mergeChangesFromRemoteContextSave:(id)a3 presupposingQueryGeneration:(id)a4
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    v7[0] = self;
    +[NSManagedObjectContext _mergeChangesFromRemoteContextSave:intoContexts:withClientQueryGeneration:]( (uint64_t)NSManagedObjectContext,  a3,  (void *)[MEMORY[0x189603F18] arrayWithObjects:v7 count:1],  (uint64_t)a4);
  }

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke( uint64_t result)
{
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0LL;
    do
    {
      if (*(void *)(*(void *)(v1 + 56) + 8 * v2))
      {
        uint64_t result = objc_msgSend(*(id *)(v1 + 32), "objectRegisteredForID:");
        if (result)
        {
          uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 24LL);
          *(_BYTE *)(v3 + v2) |= 1u;
        }
      }

      ++v2;
    }

    while (v2 < *(void *)(v1 + 48));
  }

  return result;
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2( void *a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t v6 = [*(id *)(v3 + 32) objectForKey:a2];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      -[NSFetchRequest setEntity:](v10, "setEntity:", v7);
      -[NSFetchRequest setIncludesSubentities:](v10, "setIncludesSubentities:", 1LL);
      -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0LL);
      -[NSFetchRequest setPredicate:]( v10,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", a3]);
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      void v11[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3;
      v11[3] = &unk_189EA72B0;
      uint64_t v8 = (void *)a1[5];
      uint64_t v9 = a1[6];
      v11[4] = v8;
      v11[5] = v10;
      v11[6] = v9;
      if (v8[3]) {
        [v8 performBlockAndWait:v11];
      }
      else {
        __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3((uint64_t)v11);
      }
    }
  }

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3( uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v5 = 0LL;
  uint64_t v3 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:&v5];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  }
  return [v2 drain];
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4( uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]( (uint64_t)v3,  *(void **)(a1 + 40),  1,  v4);
    }
    else {
      [v3 _mergeChangesFromDidSaveDictionary:*(void *)(a1 + 40) usingObjectIDs:1];
    }
  }

  [v2 drain];
  -[NSManagedObjectContext _processReferenceQueue:](*(void *)(a1 + 32), 0);
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5( uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]( (uint64_t)v3,  *(void **)(a1 + 40),  1,  v4);
    }
    else {
      [v3 _mergeChangesFromDidSaveDictionary:*(void *)(a1 + 40) usingObjectIDs:1];
    }
  }

  [v2 drain];
  -[NSManagedObjectContext _processReferenceQueue:](*(void *)(a1 + 32), 0);
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6( uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)_mergeChangesFromRemoteContextSave:(id)a3
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    v5[0] = self;
    objc_msgSend( (id)objc_opt_class(),  "mergeChangesFromRemoteContextSave:intoContexts:",  a3,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v5, 1));
  }

- (void)_copyChildObject:(uint64_t)a1 toParentObject:(_BYTE *)a2 fromChildContext:(void *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__copyChildObject_toParentObject_fromChildContext_);
  }
  uint64_t v6 = -[NSManagedObject _newNestedSaveChangedValuesForParent:](a2, a3);
  if (v6)
  {
    size_t v30 = v6;
    uint64_t v7 = [a3 entity];
    uint64_t v8 = *(void *)(v7 + 112);
    uint64_t v9 = *(void *)(v8 + 136);
    if (!v9)
    {
      -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
LABEL_26:

      return;
    }

    uint64_t v10 = v7;
    unint64_t v11 = *(void *)(v8 + 128);
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__currentEventSnapshotForObject_);
      if (a3) {
        goto LABEL_7;
      }
    }

    else if (a3)
    {
LABEL_7:
      uint64_t v12 = a3[6];
      goto LABEL_14;
    }

    id v13 = 0LL;
LABEL_14:
    unint64_t v14 = *(void **)(v10 + 104);
    uint64_t v15 = [v14 keys];
    uint64_t v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v14, "length"));
    unint64_t v28 = v11;
    uint64_t v29 = v9;
    unint64_t v27 = v9 + v11;
    if (v11 < v9 + v11)
    {
      uint64_t v17 = v9;
      unsigned int v18 = (uint64_t *)(v15 + 8 * v11);
      do
      {
        uint64_t v19 = *v18;
        uint64_t v20 = (void *)[a3 valueForKey:*v18];
        unint64_t v21 = (void *)[v13 valueForKey:v19];
        if ((void *)[MEMORY[0x189603FE8] null] == v21)
        {
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
        }

        else
        {
          id v22 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v20,  v21);
          [v16 addObject:v22];

          objc_msgSend( (id)objc_msgSend(a3, "primitiveValueForKey:", v19),  "removeObjectsInArray:",  objc_msgSend(v22, "array"));
        }

        ++v18;
        --v17;
      }

      while (v17);
    }

    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
    uint64_t v23 = [v14 keys];
    if (v28 < v27)
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = v23 + 8 * v28;
      do
      {
        unint64_t v26 = (void *)[v16 objectAtIndex:v24];
        if ((void *)[MEMORY[0x189603FE8] null] != v26) {
          objc_msgSend( (id)objc_msgSend(a3, "primitiveValueForKey:", *(void *)(v25 + 8 * v24)),  "addObjectsFromArray:",  objc_msgSend(v26, "array"));
        }
        ++v24;
      }

      while (v29 != v24);
    }

    goto LABEL_26;
  }

- (uint64_t)_parentProcessSaveRequest:(uint64_t)result inContext:(void *)a2 error:
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (void *)result;
    id v47 = objc_alloc_init(MEMORY[0x1896077E8]);
    [v3 processPendingChanges];
    uint64_t v4 = (void *)[a2 insertedObjects];
    uint64_t v5 = (void *)[a2 updatedObjects];
    uint64_t v6 = (void *)[a2 deletedObjects];
    unint64_t v7 = [v4 count];
    unint64_t v49 = [v5 count];
    unint64_t v48 = [v6 count];
    uint64_t v46 = (uint64_t)&v46;
    if (v7 <= 1) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v7 >= 0x201) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v8;
    }
    unint64_t v50 = v7;
    if (v7 > 0x200)
    {
      int v53 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      int v53 = (char *)&v46 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v53, 8 * v8);
    }

    if (v49 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v49;
    }
    if (v49 >= 0x201) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v49 > 0x200)
    {
      __int128 v52 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      __int128 v52 = (char *)&v46 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v52, 8 * v10);
    }

    if (v48 <= 1) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = v48;
    }
    if (v48 >= 0x201) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v48 > 0x200)
    {
      uint64_t v51 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      uint64_t v51 = (char *)&v46 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v51, 8 * v12);
    }

    if (v50)
    {
      uint64_t v14 = v50 >= 0x201 ? 1LL : v50;
      unint64_t v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v16 = (char *)&v46 - v15;
      if (v50 > 0x200) {
        uint64_t v16 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v46 - v15, 8 * v50);
      }
      objc_msgSend(v4, "getObjects:", v16, v46);
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        id v18 = _PFRetainedObjectForMappedChildObjectIDInParentContext( (void *)[*(id *)&v16[8 * i] objectID],  (uint64_t)v3);
        *(void *)&v53[8 * i] = v18;
        [v3 insertObject:v18];
      }

      for (uint64_t j = 0LL; j != v8; ++j)
        -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]( (uint64_t)v3,  *(_BYTE **)&v16[8 * j],  *(void **)&v53[8 * j]);
      if (v50 >= 0x201) {
        NSZoneFree(0LL, v16);
      }
    }

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    uint64_t v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16, v46);
    if (v20)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = *(void *)v59;
      do
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = &v52[8 * v21];
        do
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v5);
          }
          uint64_t v25 = *(_BYTE **)(*((void *)&v58 + 1) + 8 * v23);
          unint64_t v26 = _PFRetainedObjectForMappedChildObjectIDInParentContext( (void *)[v25 objectID],  (uint64_t)v3);
          *(void *)&v24[8 * v23] = v26;
          -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]((uint64_t)v3, v25, v26);
          ++v23;
        }

        while (v20 != v23);
        uint64_t v20 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
        v21 += v23;
      }

      while (v20);
    }

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v27 = [v6 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = 0LL;
      uint64_t v29 = *(void *)v55;
      do
      {
        uint64_t v30 = 0LL;
        uint64_t v31 = &v51[8 * v28];
        do
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v6);
          }
          id v32 = _PFRetainedObjectForMappedChildObjectIDInParentContext( (void *)[*(id *)(*((void *)&v54 + 1) + 8 * v30) objectID],  (uint64_t)v3);
          *(void *)&v31[8 * v30] = v32;
          [v3 deleteObject:v32];
          ++v30;
        }

        while (v27 != v30);
        uint64_t v27 = [v6 countByEnumeratingWithState:&v54 objects:v62 count:16];
        v28 += v30;
      }

      while (v27);
    }

    if (v50)
    {
      uint64_t v33 = (id *)v53;
      unint64_t v34 = v50;
      do
      {
        [*v33++ awakeFromSnapshotEvents:128];
        --v34;
      }

      while (v34);
    }

    if (v49)
    {
      uint64_t v35 = (id *)v52;
      unint64_t v36 = v49;
      do
      {
        [*v35++ awakeFromSnapshotEvents:128];
        --v36;
      }

      while (v36);
    }

    if (v48)
    {
      uint64_t v37 = (id *)v51;
      unint64_t v38 = v48;
      do
      {
        [*v37++ awakeFromSnapshotEvents:128];
        --v38;
      }

      while (v38);
    }

    [v3 processPendingChanges];
    if (v50)
    {
      uint64_t v39 = (id *)v53;
      unint64_t v40 = v50;
      do
      {

        --v40;
      }

      while (v40);
    }

    if (v49)
    {
      id v41 = (id *)v52;
      unint64_t v42 = v49;
      do
      {

        --v42;
      }

      while (v42);
    }

    if (v48)
    {
      id v43 = (id *)v51;
      unint64_t v44 = v48;
      do
      {

        --v44;
      }

      while (v44);
    }

    if (v50 >= 0x201) {
      NSZoneFree(0LL, v53);
    }
    if (v49 >= 0x201) {
      NSZoneFree(0LL, v52);
    }
    if (v48 >= 0x201) {
      NSZoneFree(0LL, v51);
    }
    [v47 drain];
    id v45 = 0LL;
    return NSArray_EmptyArray;
  }

  return result;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  id v32 = __Block_byref_object_copy__11;
  uint64_t v33 = __Block_byref_object_dispose__11;
  uint64_t v34 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  unint64_t v26 = __Block_byref_object_copy__11;
  uint64_t v27 = __Block_byref_object_dispose__11;
  uint64_t v28 = 0LL;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke;
  v22[3] = &unk_189EA7960;
  v22[4] = self;
  v22[5] = a3;
  v22[6] = a4;
  v22[7] = &v23;
  v22[8] = &v29;
  _perform((unint64_t)self, (uint64_t)v22);
  id v7 = (id)v24[5];
  id v8 = (id)v30[5];
  if (a5)
  {
    uint64_t v9 = (void *)v24[5];
    if (v9) {
      *a5 = v9;
    }
  }

  if ([a3 requestType] != 4)
  {
    uint64_t v10 = v24[5];
    if (v30[5])
    {
      if (!v10) {
        goto LABEL_11;
      }
    }

    else if (v10)
    {
      goto LABEL_11;
    }

    uint64_t v11 = [NSString stringWithUTF8String:"Either a non nil result OR an error in nexted context"];
    _NSCoreDataLog(17LL, v11, v12, v13, v14, v15, v16, v17, v21);
    id v18 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Either a non nil result OR an error in nexted context",  (uint8_t *)&v21,  2u);
    }
  }

uint64_t __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke( uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v101 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 168LL) + 8LL))
  {
    id v2 = PF_CALLOC_OBJECT_ARRAY(2LL);
    *id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
    v2[1] = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(v1 + 32) + 168LL) + 8LL) = v2;
  }

  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v89 = 0LL;
  uint64_t v4 = 0LL;
  switch([*(id *)(v1 + 40) requestType])
  {
    case 1LL:
      if ([*(id *)(v1 + 40) resultType] == 4) {
        goto LABEL_8;
      }
      uint64_t v4 = *(_PFBatchFaultingArray **)(v1 + 32);
      if (!v4) {
        goto LABEL_6;
      }
      id v77 = v3;
      uint64_t v78 = v1;
      uint64_t v11 = *(void **)(v1 + 40);
      uint64_t v12 = *(void **)(v1 + 48);
      id v13 = objc_alloc_init(MEMORY[0x1896077E8]);
      uint64_t v14 = (void *)[v11 copy];
      id v76 = v11;
      uint64_t v15 = [v11 resultType];
      id v98 = 0LL;
      if ([v14 predicate])
      {
        uint64_t v16 = -[_NSChildContextPredicateRemapper initWithContext:]( objc_alloc(&OBJC_CLASS____NSChildContextPredicateRemapper),  "initWithContext:",  v4);
        id v17 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:]( v16,  "createPredicateForFetchFromPredicate:withContext:",  [v14 predicate],  v4);
        [v14 setPredicate:v17];
      }

      __int128 v80 = v14;
      id v79 = v13;
      if (![v14 fetchBatchSize]) {
        goto LABEL_33;
      }
      uint64_t v85 = [v14 entity];
      id v18 = (void *)[v14 affectedStores];
      if (!v18) {
        id v18 = (void *)objc_msgSend( (id)-[_PFBatchFaultingArray persistentStoreCoordinator](v4, "persistentStoreCoordinator"),  "persistentStores");
      }
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v100 count:16];
      if (!v19) {
        goto LABEL_33;
      }
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v95;
      uint64_t v81 = v15;
      break;
    case 2LL:
      uint64_t v5 = (_PFBatchFaultingArray *)-[NSManagedObjectContext _parentProcessSaveRequest:inContext:error:]( *(void *)(v1 + 32),  *(void **)(v1 + 40));
      goto LABEL_5;
    case 3LL:
LABEL_8:
      id v7 = (id)[*(id *)(v1 + 40) copy];
      if ([v7 predicate])
      {
        id v8 = -[_NSChildContextPredicateRemapper initWithContext:]( objc_alloc(&OBJC_CLASS____NSChildContextPredicateRemapper),  "initWithContext:",  *(void *)(v1 + 32));
        id v9 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:]( v8,  "createPredicateForFetchFromPredicate:withContext:",  [v7 predicate],  *(void *)(v1 + 32));
        [v7 setPredicate:v9];
      }

      uint64_t v10 = [*(id *)(v1 + 32) countForFetchRequest:v7 error:&v89];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v4 = 0LL;
      }

      else
      {
        uint64_t v5 = (_PFBatchFaultingArray *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v10));
LABEL_5:
        uint64_t v4 = v5;
      }

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_189EA7A38;
  v4[4] = self;
  void v4[5] = a3;
  v4[6] = a4;
  _perform((unint64_t)self, (uint64_t)v4);
}

uint64_t __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke( uint64_t *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[NSManagedObjectContext lockObjectStore](a1[4]);
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v4 = (void *)a1[5];
    uint64_t v3 = a1[6];
    if ([v4 count])
    {
      uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v4);
            }
            uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (([v10 isTemporaryID] & 1) == 0) {
              [v5 addObject:v10];
            }
          }

          uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v7);
      }

      [*(id *)(v2 + 32) managedObjectContextDidRegisterObjectsWithIDs:v5 generation:v3];
    }
  }

  return -[NSManagedObjectContext unlockObjectStore](a1[4]);
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_189EA7A38;
  v4[4] = self;
  void v4[5] = a3;
  v4[6] = a4;
  _perform((unint64_t)self, (uint64_t)v4);
}

uint64_t __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke( uint64_t a1)
{
  return -[NSManagedObjectContext unlockObjectStore](*(void *)(a1 + 32));
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = __Block_byref_object_copy__11;
  __int128 v12 = __Block_byref_object_dispose__11;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke;
  v7[3] = &unk_189EA8700;
  v7[4] = a3;
  v7[5] = self;
  void v7[6] = a4;
  v7[7] = &v8;
  _perform((unint64_t)self, (uint64_t)v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 8LL))
  {
    uint64_t v3 = PF_CALLOC_OBJECT_ARRAY(2LL);
    *uint64_t v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v3[1] = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 8LL) = v3;
  }

  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(*(void *)(a1 + 40) + 168) + 8) objectForKey:v2];
    if (v4) {
      uint64_t v2 = (void *)v4;
    }
  }

  uint64_t v5 = (void *)[*(id *)(a1 + 40) objectRegisteredForID:v2];
  if (v5)
  {
    uint64_t v6 = v5;
    if (([v5 isFault] & 1) == 0)
    {
      -[NSFaultHandler fulfillFault:withContext:error:](_insertion_fault_handler, v6, *(void *)(a1 + 40), 0LL);
      if (v7)
      {
        uint64_t v8 = (unint64_t *)[v6 entity];
        unint64_t v9 = v8[13];
        uint64_t v10 = (void *)v8[14];
        uint64_t v11 = *(void *)(v9 + 40);
        uint64_t v12 = _kvcPropertysPrimitiveGetters(v8);
        uint64_t v13 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v9);
        uint64_t v18 = -[NSKnownKeysDictionary values](v13, "values");
        unint64_t v19 = v10[6];
        uint64_t v20 = v10[7];
        if (v19 < v20 + v19)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty( (id **)v6,  v19,  *(void *)(v11 + 8 * v19),  *(void *)(v12 + 8 * v19),  v14,  v15,  v16,  v17);
            *(void *)(v18 + 8 * v19++) = v21;
            --v20;
          }

          while (v20);
        }

        unint64_t v22 = v10[12];
        uint64_t v23 = v10[13];
        if (v22 < v23 + v22)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty( (id **)v6,  v22,  *(void *)(v11 + 8 * v22),  *(void *)(v12 + 8 * v22),  v14,  v15,  v16,  v17);
            *(void *)(v18 + 8 * v22++) = (id)[v24 objectID];
            --v23;
          }

          while (v23);
        }

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[_PFTempNestedSnapshot initWithOwnedKKsD:andVersion:]( [_PFTempNestedSnapshot alloc],  "initWithOwnedKKsD:andVersion:",  v13,  [v6 _versionReference]);
      }
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    -[NSManagedObjectContext lockObjectStore](*(void *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 32) newValuesForObjectWithID:v2 withContext:*(void *)(a1 + 48) error:0];
    -[NSManagedObjectContext unlockObjectStore](*(void *)(a1 + 40));
  }

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  uint64_t v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  uint64_t v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  void v8[2] = __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke;
  v8[3] = &unk_189EA85F0;
  v8[4] = a4;
  v8[5] = self;
  v8[7] = a5;
  v8[8] = &v9;
  void v8[6] = a3;
  _perform((unint64_t)self, (uint64_t)v8);
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke( uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 8LL))
  {
    uint64_t v3 = PF_CALLOC_OBJECT_ARRAY(2LL);
    *uint64_t v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v3[1] = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 168LL) + 8LL) = v3;
  }

  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(*(void *)(a1 + 40) + 168) + 8) objectForKey:v2];
    if (v4) {
      uint64_t v2 = (void *)v4;
    }
  }

  uint64_t v5 = (unsigned int *)[*(id *)(a1 + 40) objectRegisteredForID:v2];
  if (v5)
  {
    uint64_t v6 = v5;
    if (([v5 isFault] & 1) == 0)
    {
      uint64_t v7 = [*(id *)(a1 + 48) _entitysReferenceID];
      unint64_t v8 = v7;
      uint64_t v9 = v6[5];
      uint64_t v10 = (_DWORD)v9 ? (char *)v6 + v9 : 0LL;
      if (((v10[(v7 >> 3) - (((unint64_t)v6[4] >> 22) & 0x3FC)] >> (v7 & 7)) & 1) != 0)
      {
        uint64_t v11 = (unint64_t *)[v6 entity];
        uint64_t v12 = _kvcPropertysPrimitiveGetters(v11);
        _PF_Handler_Primitive_GetProperty( (id **)v6,  v8,  *(void *)(*(void *)(v11[13] + 40) + 8 * v8),  *(void *)(v12 + 8 * v8),  v13,  v14,  v15,  v16);
        uint64_t v18 = v17;
        unint64_t v19 = [v17 count];
        v30[1] = v30;
        unint64_t v20 = MEMORY[0x1895F8858](v19);
        uint64_t v23 = (char *)v30 - v22;
        if (v20 > 0x200) {
          uint64_t v23 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)v30 - v22, 8 * v21);
        }
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v32 = 0u;
        __int128 v31 = 0u;
        uint64_t v24 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = 0LL;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (uint64_t i = 0LL; i != v25; ++i)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v18);
              }
              *(void *)&v23[8 * v26 + 8 * i] = *(void *)(*(void *)(*((void *)&v31 + 1) + 8 * i) + 40LL);
            }

            uint64_t v25 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
            v26 += i;
          }

          while (v25);
        }

        uint64_t v29 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v23 count:v19];
        if (v19 >= 0x201) {
          NSZoneFree(0LL, v23);
        }
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v29;
      }
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    -[NSManagedObjectContext lockObjectStore](*(void *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 32) newValueForRelationship:*(void *)(a1 + 48) forObjectWithID:v2 withContext:*(void *)(a1 + 56) error:0];
    -[NSManagedObjectContext unlockObjectStore](*(void *)(a1 + 40));
  }

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v19 = 0LL;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  uint64_t v22 = __Block_byref_object_copy__11;
  uint64_t v23 = __Block_byref_object_dispose__11;
  uint64_t v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  uint64_t v16 = __Block_byref_object_copy__11;
  uint64_t v17 = __Block_byref_object_dispose__11;
  uint64_t v18 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke;
  v12[3] = &unk_189EA8618;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  v12[7] = a5;
  v12[8] = &v19;
  v12[9] = &v13;
  _perform((unint64_t)self, (uint64_t)v12);
  uint64_t v7 = v14;
  unint64_t v8 = (void *)v14[5];
  if (v8)
  {
    if (a6)
    {
      *a6 = v8;
      unint64_t v8 = (void *)v7[5];
    }

    id v9 = v8;
  }

  uint64_t v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke( void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (!*(void *)(*(void *)(a1[5] + 168LL) + 8LL))
  {
    uint64_t v3 = PF_CALLOC_OBJECT_ARRAY(2LL);
    *uint64_t v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v3[1] = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(a1[5] + 168LL) + 8LL) = v3;
  }

  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(a1[5] + 168) + 8) objectForKey:v2];
    if (v4) {
      uint64_t v2 = (void *)v4;
    }
  }

  -[NSManagedObjectContext lockObjectStore](a1[5]);
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[5] + 32) _newOrderedRelationshipInformationForRelationship:a1[6] forObjectWithID:v2 withContext:a1[7] error:*(void *)(a1[9] + 8) + 40];
  if (!*(void *)(*(void *)(a1[8] + 8LL) + 40LL)) {
    id v5 = *(id *)(*(void *)(a1[9] + 8LL) + 40LL);
  }
  return -[NSManagedObjectContext unlockObjectStore](a1[5]);
}

- (BOOL)_parentObtainPermanentIDsForObjects:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000LL;
  uint64_t v30 = __Block_byref_object_copy__11;
  __int128 v31 = __Block_byref_object_dispose__11;
  uint64_t v32 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  void v26[2] = 0x3052000000LL;
  v26[3] = __Block_byref_object_copy__11;
  v26[4] = __Block_byref_object_dispose__11;
  v26[5] = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000LL;
  uint64_t v23 = __Block_byref_object_copy__11;
  uint64_t v24 = __Block_byref_object_dispose__11;
  uint64_t v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  uint64_t v17 = __Block_byref_object_copy__11;
  uint64_t v18 = __Block_byref_object_dispose__11;
  uint64_t v19 = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke;
  v13[3] = &unk_189EA8640;
  v13[4] = self;
  v13[5] = a3;
  v13[8] = &v14;
  v13[9] = &v33;
  v13[10] = &v27;
  v13[11] = v26;
  v13[12] = a5;
  v13[6] = a4;
  void v13[7] = &v20;
  _perform((unint64_t)self, (uint64_t)v13);
  if ([(id)v21[5] count])
  {
    uint64_t v7 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]( (uint64_t)a4,  (void *)v21[5],  (void *)v15[5]);
    if (v7)
    {
      unint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
      objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v7);
      objc_autoreleasePoolPop(v8);
    }
  }

  v21[5] = 0LL;
  v15[5] = 0LL;
  id v9 = (id)v28[5];
  if (a5)
  {
    uint64_t v10 = (void *)v28[5];
    if (v10) {
      *a5 = v10;
    }
  }

  char v11 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v11;
}

void __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke( uint64_t *a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1[4] + 168) + 8LL))
  {
    uint64_t v2 = PF_CALLOC_OBJECT_ARRAY(2LL);
    *uint64_t v2 = objc_alloc_init(MEMORY[0x189603FC8]);
    v2[1] = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)(*(void *)(a1[4] + 168) + 8LL) = v2;
  }

  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  obuint64_t j = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = (void *)[v8 objectID];
        if ([v9 isTemporaryID])
        {
          uint64_t v10 = (void *)[**(id **)(*(void *)(a1[4] + 168) + 8) objectForKey:v9];
          char v11 = v10;
          if (v10 && ([v10 isTemporaryID] & 1) == 0)
          {
            if (!*(void *)(*(void *)(a1[7] + 8) + 40LL)) {
              *(void *)(*(void *)(a1[7] + 8) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
            }
            if (!*(void *)(*(void *)(a1[8] + 8) + 40LL)) {
              *(void *)(*(void *)(a1[8] + 8) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
            }
            [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v8];
            [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v11];
          }

          else
          {
            [v3 addObject:v8];
            [obj addObject:v9];
          }
        }
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v5);
  }

  if ([v3 count])
  {
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)(a1[4] + 48));
    uint64_t v13 = (void *)a1[4];
    if ((v12 & 1) != 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)v13);
      *(_BYTE *)(*(void *)(a1[9] + 8) + 24) = [*(id *)(a1[4] + 32) _parentObtainPermanentIDsForObjects:v3 context:a1[6] error:a1[12]];
      -[NSManagedObjectContext unlockObjectStore](a1[4]);
    }

    else
    {
      uint64_t v14 = (void *)[v13 persistentStoreCoordinator];
      -[NSManagedObjectContext lockObjectStore](a1[4]);
      *(_BYTE *)(*(void *)(a1[9] + 8) + 24) = [v14 obtainPermanentIDsForObjects:v3 error:*(void *)(a1[10] + 8) + 40];
      -[NSManagedObjectContext unlockObjectStore](a1[4]);

      uint64_t v15 = *(void *)(*(void *)(a1[10] + 8) + 40LL);
      if (v15)
      {
        uint64_t v16 = (void *)a1[12];
        if (v16) {
          *uint64_t v16 = v15;
        }
        *(_BYTE *)(*(void *)(a1[9] + 8) + 24LL) = 0;
      }

      id v17 = *(id *)(*(void *)(a1[11] + 8) + 40LL);
      obuint64_t j = 0LL;
      id v3 = 0LL;
    }

    if (*(_BYTE *)(*(void *)(a1[9] + 8) + 24LL))
    {
      id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = 0LL;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t j = 0LL; j != v20; ++j)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            uint64_t v25 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v21 + j, v29), "objectID");
            if (v24 != v25)
            {
              uint64_t v26 = [(id)a1[4] objectRegisteredForID:v24];
              if (v26)
              {
                [v29 addObject:v26];
                [v19 addObject:v25];
              }

              [**(id **)(*(void *)(a1[4] + 168) + 8) setObject:v25 forKey:v24];
              [*(id *)(*(void *)(*(void *)(a1[4] + 168) + 8) + 8) setObject:v24 forKey:v25];
            }
          }

          uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
          v21 += j;
        }

        while (v20);
      }

      if (objc_msgSend(v29, "count", v29)) {
        uint64_t v18 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](a1[4], v30, v19);
      }
      else {
        uint64_t v18 = 0LL;
      }
    }

    else
    {
      uint64_t v18 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
    *(_BYTE *)(*(void *)(a1[9] + 8) + 24LL) = 1;
  }

  id v27 = *(id *)(*(void *)(a1[10] + 8) + 40LL);
  if (v18)
  {
    uint64_t v28 = (void *)MEMORY[0x186E3E5D8](v27);
    objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v18);
    objc_autoreleasePoolPop(v28);
  }

- (id)_orderKeysForRelationshipWithName__:(id)a3 onObjectWithID:(id)a4
{
  return -[NSManagedObject _orderKeysForRelationshipWithName__:]( -[NSManagedObjectContext objectWithID:](self, "objectWithID:", a4),  "_orderKeysForRelationshipWithName__:",  a3);
}

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 onObjectWithID:(id)a5 error:(id *)a6
{
  return -[NSManagedObject _updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:error:]( -[NSManagedObjectContext objectWithID:](self, "objectWithID:", a5),  "_updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:error:",  a3,  a4,  a6);
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  uint64_t v25 = __Block_byref_object_copy__11;
  uint64_t v26 = __Block_byref_object_dispose__11;
  uint64_t v27 = 0LL;
  uint64_t v9 = [a4 destinationEntity];
  if (-[NSManagedObjectContext hasChanges](self, "hasChanges"))
  {
    id v10 = 0LL;
    if (a5) {
      *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03798];
    }
LABEL_11:
    _Block_object_dispose(&v22, 8);
    return v10;
  }

  if (objc_msgSend((id)objc_msgSend(a3, "entity"), "isKindOfEntity:", v9))
  {
    if ([a4 isToMany])
    {
      if ([a4 isOrdered])
      {
        uint64_t v16 = 0LL;
        id v17 = &v16;
        uint64_t v18 = 0x3052000000LL;
        id v19 = __Block_byref_object_copy__11;
        uint64_t v20 = __Block_byref_object_dispose__11;
        uint64_t v21 = 0LL;
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        void v15[2] = __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke;
        v15[3] = &unk_189EA8668;
        v15[4] = self;
        v15[5] = a3;
        v15[6] = a4;
        v15[7] = &v22;
        v15[8] = &v16;
        -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v15);
        char v11 = (void *)v17[5];
        if (v11)
        {
          id v12 = v11;
          if (a5) {
            *a5 = (id)v17[5];
          }
        }

        id v10 = (id)v23[5];
        _Block_object_dispose(&v16, 8);
        goto LABEL_11;
      }

      uint64_t v14 = @"Can't find the order of objects in an unordered relationship";
    }

    else
    {
      uint64_t v14 = @"Relationship must be a to-many.";
    }
  }

  else
  {
    uint64_t v14 = @"Destination object is not kind of [relationship destinationEntity]";
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
  __break(1u);
  return result;
}

id __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke( void *a1)
{
  id result = (id)[*(id *)(a1[4] + 32) _allOrderKeysForDestination:a1[5] inRelationship:a1[6] error:*(void *)(a1[8] + 8) + 40];
  *(void *)(*(void *)(a1[7] + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(a1[8] + 8LL) + 40LL)) {
    return 0LL;
  }
  return result;
}

- (BOOL)_isSwiftBound
{
  return *(_DWORD *)&self->_flags >> 31;
}

- (void)set_isSwiftBound:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(v3 & 0x80000000 | *(_DWORD *)&self->_flags & 0x7FFFFFFF);
  if (a3) {
    atomic_store(1u, (unsigned __int8 *)&self->_generatedMutatedIDsNotification);
  }
}

- (BOOL)_performImmediate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
  }
  uint64_t v4 = self;
  uint64_t v5 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  uint64_t v6 = self;
  v14[0] = a3;
  v14[1] = v6;
  uint64_t v15 = 0LL;
  uint64_t v16 = v5;
  if (byte_18C4ABA02) {
    uint64_t v15 = 4LL;
  }
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&v4->_isMainThreadBlessed);
  if ((v7 & 1) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_26:
      developerSubmittedBlockToNSManagedObjectContextPerform(v14);
      return 1;
    }
  }

  else if (v5)
  {
    unint64_t v8 = 0LL;
    int v9 = 0;
    unint64_t v10 = (unint64_t)v5;
    while ((NSManagedObjectContext *)v10 != v4)
    {
      if (v10 == v8) {
        goto LABEL_16;
      }
      if (!v8) {
        unint64_t v8 = v10;
      }
      unint64_t v10 = atomic_load((unint64_t *)(v10 + 8));
      if (!v10) {
        goto LABEL_17;
      }
    }

    int v9 = 1;
LABEL_16:
    if (v9) {
      goto LABEL_26;
    }
LABEL_17:
    char v11 = 0LL;
    int v12 = 0;
    while (v4 != v5)
    {
      if (v4 == v11) {
        goto LABEL_25;
      }
      if (!v11) {
        char v11 = v4;
      }
      uint64_t v4 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v4->_queueOwner);
      if (!v4) {
        goto LABEL_27;
      }
    }

    int v12 = 1;
LABEL_25:
    if (v12) {
      goto LABEL_26;
    }
  }

+ (id)createFutureForFileAtURL:(id)a3
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS____NSDataFileBackedFuture);
    if (!v4) {
      return v4;
    }
    if (([a3 isFileURL] & 1) == 0)
    {

      return 0LL;
    }

    v18.receiver = v4;
    v18.super_class = (Class)&OBJC_CLASS____NSDataFileBackedFuture;
    uint64_t v4 = objc_msgSendSuper2(&v18, sel_init);
    if (!v4) {
      return v4;
    }
    uint64_t v17 = 0LL;
    uint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "attributesOfItemAtPath:error:",  objc_msgSend(a3, "path"),  &v17);
    if (v5)
    {
      uint64_t v6 = v5;
      if ([v5 valueForKey:@"NSFileSize"])
      {
        v4->_fileSize = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", @"NSFileSize"), "unsignedIntegerValue");
        v4->_originalFileURL = (NSURL *)a3;
        v4->_uuid = (NSUUID *)(id)[MEMORY[0x189607AB8] UUID];
        return v4;
      }
    }

    char v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    unint64_t v10 = (const __CFString *)[NSString stringWithFormat:@"No file exists at URL '%@'", a3];
    unint64_t v8 = v11;
    uint64_t v9 = v12;
  }

  else
  {
    unint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    unint64_t v10 = @"Illegal attempt to pass a non-file URL to a file backed NSData";
  }

  objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  return (id)-[NSManagedObjectContext evictFuture:withError:](v13, v14, v15, v16);
}

- (BOOL)evictFuture:(id)a3 withError:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x189607460];
    __int128 v32 = @"message";
    char v11 = (void *)NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v33 = [v11 stringWithFormat:@"%@ does not support eviction.", NSStringFromClass(v12)];
    uint64_t v13 = objc_msgSend( v9,  "errorWithDomain:code:userInfo:",  v10,  3328,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    if (v13)
    {
      if (a4)
      {
        id v14 = (id)v13;
LABEL_15:
        LOBYTE(v7) = 0;
        *a4 = v14;
        return v7;
      }

@end