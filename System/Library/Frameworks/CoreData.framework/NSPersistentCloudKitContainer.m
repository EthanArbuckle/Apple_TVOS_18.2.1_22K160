@interface NSPersistentCloudKitContainer
+ (id)discoverDefaultContainerIdentifier;
- (BOOL)assignManagedObjects:(id)a3 toCloudKitRecordZone:(id)a4 inPersistentStore:(id)a5 error:(id *)a6;
- (BOOL)canDeleteRecordForManagedObjectWithID:(NSManagedObjectID *)objectID;
- (BOOL)canModifyManagedObjectsInStore:(NSPersistentStore *)store;
- (BOOL)canUpdateRecordForManagedObjectWithID:(NSManagedObjectID *)objectID;
- (BOOL)initializeCloudKitSchemaWithOptions:(NSPersistentCloudKitContainerSchemaInitializationOptions)options error:(NSError *)error;
- (CKRecord)recordForManagedObjectID:(NSManagedObjectID *)managedObjectID;
- (CKRecordID)recordIDForManagedObjectID:(NSManagedObjectID *)managedObjectID;
- (NSArray)fetchSharesInPersistentStore:(NSPersistentStore *)persistentStore error:(NSError *)error;
- (NSDictionary)fetchSharesMatchingObjectIDs:(NSArray *)objectIDs error:(NSError *)error;
- (NSDictionary)recordIDsForManagedObjectIDs:(NSArray *)managedObjectIDs;
- (NSDictionary)recordsForManagedObjectIDs:(NSArray *)managedObjectIDs;
- (NSPersistentCloudKitContainer)initWithName:(id)a3 managedObjectModel:(id)a4;
- (uint64_t)createTimeoutErrorForRequest:(uint64_t)a3 withLabel:;
- (void)_acceptShareInvitationsWithURLs:(void *)a3 shareMetadatas:(void *)a4 forPersistentStore:(uint64_t)a5 completion:;
- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4;
- (void)acceptShareInvitationsFromMetadata:(NSArray *)metadata intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)acceptShareInvitationsFromURLs:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5;
- (void)applyActivityVoucher:(id)a3 toStores:(id)a4;
- (void)dealloc;
- (void)doWorkOnMetadataContext:(uint64_t)a3 withBlock:;
- (void)eventUpdated:(id)a3;
- (void)expireActivityVoucher:(id)a3;
- (void)fetchParticipantsMatchingLookupInfos:(NSArray *)lookupInfos intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)persistUpdatedShare:(CKShare *)share inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)publishActivity:(id)a3;
- (void)purgeObjectsAndRecordsInZoneWithID:(CKRecordZoneID *)zoneID inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)setPersistentStoreDescriptions:(id)a3;
- (void)shareManagedObjects:(NSArray *)managedObjects toShare:(CKShare *)share completion:(void *)completion;
@end

@implementation NSPersistentCloudKitContainer

- (NSPersistentCloudKitContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainer;
  v4 = -[NSPersistentContainer initWithName:managedObjectModel:](&v10, sel_initWithName_managedObjectModel_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_operationTimeout = 30LL;
    v6 = (void *)MEMORY[0x186E3E5D8]();
    id v7 = +[NSPersistentCloudKitContainer discoverDefaultContainerIdentifier]( &OBJC_CLASS___NSPersistentCloudKitContainer,  "discoverDefaultContainerIdentifier");
    if (v7)
    {
      v8 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerOptions),  "initWithContainerIdentifier:",  v7);
      objc_msgSend( -[NSArray lastObject]( -[NSPersistentContainer persistentStoreDescriptions](v5, "persistentStoreDescriptions"),  "lastObject"),  "setCloudKitContainerOptions:",  v8);
    }

    v5->_metadataContext = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setPersistentStoreCoordinator:]( v5->_metadataContext,  "setPersistentStoreCoordinator:",  -[NSPersistentContainer persistentStoreCoordinator](v5, "persistentStoreCoordinator"));
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v5->_metadataContext, "_setAllowAncillaryEntities:", 1LL);
    -[NSManagedObjectContext setMergePolicy:]( v5->_metadataContext,  "setMergePolicy:",  NSMergeByPropertyObjectTrumpMergePolicy);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainer;
  -[NSPersistentContainer dealloc](&v3, sel_dealloc);
}

- (void)setPersistentStoreDescriptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "containerIdentifier");
        v11 = v10;
        if (v10 && [v10 length])
        {
          v12 = (void *)[v5 objectForKey:v11];
          if (v12)
          {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "cloudKitContainerOptions"), "databaseScope");
            if (v13 == objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "databaseScope"))
            {
              v14 = (void *)MEMORY[0x189603F70];
              v21 = @"storeURL";
              uint64_t v22 = [v9 URL];
              uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
              objc_exception_throw((id)[v14 exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot assign the same iCloud Container Identifier to multiple persistent stores with the same database scope." userInfo:v15]);
              __break(1u);
            }
          }

          else
          {
            [v5 setObject:v9 forKey:v11];
          }
        }
      }

      uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v6);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainer;
  -[NSPersistentContainer setPersistentStoreDescriptions:](&v16, sel_setPersistentStoreDescriptions_, a3);
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_super v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 cloudKitContainerOptions])
        {
          [v10 cloudKitContainerOptions];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v12 = (void *)[v10 cloudKitContainerOptions];
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v15 = (void *)MEMORY[0x189603F70];
              uint64_t v16 = *MEMORY[0x189603A60];
              __int128 v17 = (void *)NSString;
              __int128 v18 = (objc_class *)objc_opt_class();
              __int128 v19 = NSStringFromClass(v18);
              __int128 v20 = NSStringFromSelector(sel_cloudKitContainerOptions);
              v21 = (objc_class *)objc_opt_class();
              uint64_t v22 = [v17 stringWithFormat:@"%@.%@ must be of type '%@'", v19, v20, NSStringFromClass(v21)];
              v29 = @"offendingObject";
              uint64_t v30 = [v10 cloudKitContainerOptions];
              objc_exception_throw((id)objc_msgSend( v15,  "exceptionWithName:reason:userInfo:",  v16,  v22,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1)));
            }

            v12 = (void *)[v10 cloudKitContainerOptions];
          }

          [v12 setProgressProvider:self];
          uint64_t v13 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]( [NSCloudKitMirroringDelegate alloc],  "initWithCloudKitContainerOptions:",  [v10 cloudKitContainerOptions]);
          [v10 setMirroringDelegate:v13];
          if (!objc_msgSend((id)objc_msgSend(v10, "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey")) {
            [v10 setOption:MEMORY[0x189604A88] forKey:@"NSPersistentHistoryTrackingKey"];
          }
LABEL_17:

          continue;
        }

        if ([v10 mirroringDelegate])
        {
          [v10 mirroringDelegate];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (NSCloudKitMirroringDelegate *)(id)[v10 mirroringDelegate];
            uint64_t v13 = v14;
            if (v14) {
              v14 = (NSCloudKitMirroringDelegate *)v14->_options;
            }
            -[NSCloudKitMirroringDelegate setProgressProvider:](v14, "setProgressProvider:", self);
            goto LABEL_17;
          }
        }
      }

      uint64_t v7 = [a3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v7);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainer;
  -[NSPersistentContainer _loadStoreDescriptions:withCompletionHandler:]( &v24,  sel__loadStoreDescriptions_withCompletionHandler_,  a3,  a4);
}

+ (id)discoverDefaultContainerIdentifier
{
  uint64_t v2 = xpc_copy_entitlement_for_self();
  if (!v2) {
    return 0LL;
  }
  objc_super v3 = (void *)v2;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if ([v4 count]) {
    id v5 = (id)[v4 objectAtIndex:0];
  }
  else {
    id v5 = 0LL;
  }

  xpc_release(v3);
  return v5;
}

- (BOOL)initializeCloudKitSchemaWithOptions:(NSPersistentCloudKitContainerSchemaInitializationOptions)options error:(NSError *)error
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  char v66 = 1;
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x3052000000LL;
  v60 = __Block_byref_object_copy__19;
  v61 = __Block_byref_object_dispose__19;
  uint64_t v62 = 0LL;
  group = dispatch_group_create();
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v5 = -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "persistentStores");
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v53,  v79,  16LL);
  NSPersistentCloudKitContainerSchemaInitializationOptions v48 = options;
  uint64_t v7 = 0LL;
  if (v6)
  {
    uint64_t v8 = *(void *)v54;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v53 + 1) + 8 * i) isCloudKitEnabled])
        {
          objc_super v10 = (void *)MEMORY[0x186E3E5D8]();
          unint64_t v11 = __ckLoggingOverride;
          uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: will initialize cloudkit schema for store: %@"];
          if (v11 >= 3) {
            uint64_t v19 = 3LL;
          }
          else {
            uint64_t v19 = v11;
          }
          _NSCoreDataLog( v19,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]");
          objc_autoreleasePoolPop(v10);
          dispatch_group_enter(group);
          ++v7;
        }
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v53,  v79,  16LL);
    }

    while (v6);
  }

  id v20 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v7)
  {
    *((_BYTE *)v64 + 24) = 0;
    id v32 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v71 = *MEMORY[0x1896075F0];
    uint64_t v72 = [NSString stringWithFormat:@"Couldn't initialize CloudKit schema because no stores in the coordinator are configured to use CloudKit: %@", -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores")];
    uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    uint64_t v34 = [v32 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v33];
    v58[5] = v34;
    goto LABEL_26;
  }

  id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v22 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringInitializeSchemaRequest);
  uint64_t v23 = MEMORY[0x1895F87A8];
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  v52[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke;
  v52[3] = &unk_189EA9218;
  v52[4] = v20;
  v52[5] = v21;
  v52[7] = &v63;
  v52[6] = group;
  objc_super v24 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:]( v22,  "initWithOptions:completionBlock:",  0LL,  v52);
  -[NSCloudKitMirroringInitializeSchemaRequest setSchemaInitializationOptions:]( v24,  "setSchemaInitializationOptions:",  v48);
  __int128 v25 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v51[0] = v23;
  v51[1] = 3221225472LL;
  v51[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_40;
  v51[3] = &unk_189EA7A60;
  v51[4] = v25;
  v51[5] = v24;
  v51[6] = &v63;
  v51[7] = &v57;
  -[NSManagedObjectContext performBlockAndWait:](v25, "performBlockAndWait:", v51);
  if (*((_BYTE *)v64 + 24))
  {
    dispatch_time_t v26 = dispatch_time(0LL, 1000000000 * self->_operationTimeout);
    if (dispatch_group_wait(group, v26))
    {
      *((_BYTE *)v64 + 24) = 0;
      id v27 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v77 = *MEMORY[0x1896075F0];
      uint64_t v78 = objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to initialize CloudKit schema because the requests timed out (a %lds wait failed).",  self->_operationTimeout);
      uint64_t v28 = [MEMORY[0x189603F68] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      v29 = (void *)[v27 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v28];
      [v21 addObject:v29];
    }

    if (!*((_BYTE *)v64 + 24)) {
      goto LABEL_35;
    }
    if (v7 == [v20 count])
    {
      *((_BYTE *)v64 + 24) = 0;
      id v30 = objc_alloc(MEMORY[0x189607870]);
      v75[0] = *MEMORY[0x1896075F0];
      v75[1] = @"NSDetailedErrors";
      v76[0] = @"Couldn't initialize CloudKit schema because no stores were able to succesfully initialize.";
      v76[1] = v20;
      uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:2];
LABEL_24:
      uint64_t v35 = [v30 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v31];
      v58[5] = v35;
      goto LABEL_25;
    }

    if (!*((_BYTE *)v64 + 24))
    {
LABEL_35:
      if ([v21 count])
      {
        id v30 = objc_alloc(MEMORY[0x189607870]);
        v73 = @"encounteredErrors";
        id v74 = v21;
        uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        goto LABEL_24;
      }
    }
  }

void __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if ([a2 success])
  {
    v4 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished initialize schema with result: %@"];
    _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
    objc_autoreleasePoolPop(v4);
    goto LABEL_15;
  }

  if (objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [a2 error];
    goto LABEL_13;
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (*(_BYTE *)(v15 + 24)) {
    *(_BYTE *)(v15 + 24) = 0;
  }
  uint64_t v16 = (void *)MEMORY[0x186E3E5D8]();
  BOOL v17 = __ckLoggingOverride != 0;
  uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Initialize schema request failed: %@"];
  _NSCoreDataLog( v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
  objc_autoreleasePoolPop(v16);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  if ([a2 error])
  {
    __int128 v25 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "userInfo");
    uint64_t v26 = *MEMORY[0x189607798];
    uint64_t v27 = [v25 objectForKey:*MEMORY[0x189607798]];
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v28 = (void *)[a2 error];
    v29 = v28;
    if (!v27)
    {
LABEL_14:
      [v13 addObject:v29];
      goto LABEL_15;
    }

    uint64_t v14 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", v26);
LABEL_13:
    v29 = (void *)v14;
    goto LABEL_14;
  }

  uint64_t v30 = [NSString stringWithUTF8String:"Initialize schema failed but did not set an error: %@"];
  _NSCoreDataLog(17LL, v30, v31, v32, v33, v34, v35, v36, (uint64_t)a2);
  v37 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = a2;
    _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: Initialize schema failed but did not set an error: %@",  buf,  0xCu);
  }

id __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_40( uint64_t a1)
{
  id v3 = 0LL;
  id result = (id)[*(id *)(a1 + 32) executeRequest:*(void *)(a1 + 40) error:&v3];
  if (!result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id result = v3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  }

  return result;
}

- (CKRecord)recordForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  uint64_t v36 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000LL;
  uint64_t v33 = __Block_byref_object_copy__19;
  uint64_t v34 = __Block_byref_object_dispose__19;
  uint64_t v35 = 0LL;
  v4 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS____PFRequestExecutor);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest);
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke;
  v29[3] = &unk_189EA9240;
  v29[5] = v5;
  v29[6] = &v30;
  v29[4] = managedObjectID;
  uint64_t v7 = -[NSCloudKitMirroringDelegateSerializationRequest initWithOptions:completionBlock:]( v6,  "initWithOptions:completionBlock:",  0LL,  v29);
  -[NSCloudKitMirroringDelegateSerializationRequest setResultType:](v7, "setResultType:", 1LL);
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:]( v7,  "setObjectIDsToSerialize:",  [MEMORY[0x189604010] setWithObject:managedObjectID]);
  if (-[_PFRequestExecutor executeRequest:inContext:error:](v5, "executeRequest:inContext:error:", v7, v4, &v36))
  {
    if (!-[_PFRequestExecutor wait](v5, "wait"))
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Wait timed out during call to recordForManagedObjectID"];
      _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, v27);
      uint64_t v15 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Wait timed out during call to recordForManagedObjectID",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v16 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v17 = __ckLoggingOverride;
    uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to retrieve record for object '%@'\n%@"];
    _NSCoreDataLog( v17 != 0,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]");
    objc_autoreleasePoolPop(v16);

    v31[5] = 0LL;
  }

  __int128 v25 = (CKRecord *)(id)v31[5];
  _Block_object_dispose(&v30, 8);
  return v25;
}

uint64_t __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 success])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", *(void *)(a1 + 32));
      if (v4) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v4;
      }
    }

    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializati onRequestResult' when asking about the record for a managed object id."];
      _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, v23);
      uint64_t v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSeria lizationRequestResult' when asking about the record for a managed object id.",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Record serialization failed with error: %@"];
    [a2 error];
    _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]_block_invoke");
    objc_autoreleasePoolPop(v5);
  }

  return [*(id *)(a1 + 40) requestFinished];
}

- (NSDictionary)recordsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  uint64_t v31 = 0LL;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  BOOL v6 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS____PFRequestExecutor);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegateSerializationRequest);
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke;
  v30[3] = &unk_189EA9268;
  v30[4] = v5;
  v30[5] = v7;
  uint64_t v9 = -[NSCloudKitMirroringDelegateSerializationRequest initWithOptions:completionBlock:]( v8,  "initWithOptions:completionBlock:",  0LL,  v30);
  -[NSCloudKitMirroringDelegateSerializationRequest setResultType:](v9, "setResultType:", 1LL);
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:]( v9,  "setObjectIDsToSerialize:",  [MEMORY[0x189604010] setWithArray:managedObjectIDs]);
  if (-[_PFRequestExecutor executeRequest:inContext:error:](v7, "executeRequest:inContext:error:", v9, v6, &v31))
  {
    if (!-[_PFRequestExecutor wait](v7, "wait"))
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Wait timed out during call to recordsForManagedObjectIDs"];
      _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, v28);
      uint64_t v17 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Wait timed out during call to recordsForManagedObjectIDs",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v19 = __ckLoggingOverride != 0;
    uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to retrieve records for objects %@"];
    _NSCoreDataLog( v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]");
    objc_autoreleasePoolPop(v18);

    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return (NSDictionary *)v5;
}

uint64_t __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if ([a2 success])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "request"), "objectIDsToSerialize");
      uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v32;
        do
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v32 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", v9);
            if (v10) {
              [*(id *)(a1 + 32) setObject:v10 forKey:v9];
            }
          }

          uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }

        while (v6);
      }
    }

    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializati onRequestResult' when asking about the records for a group of managed object ids."];
      _NSCoreDataLog(17LL, v20, v21, v22, v23, v24, v25, v26, v29);
      uint64_t v27 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSeria lizationRequestResult' when asking about the records for a group of managed object ids.",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v12 = __ckLoggingOverride != 0;
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Record serialization failed with error: %@"];
    [a2 error];
    _NSCoreDataLog( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]_block_invoke");
    objc_autoreleasePoolPop(v11);
  }

  return [*(id *)(a1 + 40) requestFinished];
}

- (CKRecordID)recordIDForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  return -[CKRecord recordID]( -[NSPersistentCloudKitContainer recordForManagedObjectID:]( self,  "recordForManagedObjectID:",  managedObjectID),  "recordID");
}

- (NSDictionary)recordIDsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = -[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]( self,  "recordsForManagedObjectIDs:",  managedObjectIDs);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( v4,  "setObject:forKey:",  objc_msgSend( -[NSDictionary objectForKey:](v3, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)),  "recordID"),  *(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return (NSDictionary *)v4;
}

- (BOOL)canUpdateRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  v33[1] = *MEMORY[0x1895F89C0];
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  if (!-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID"))
  {
    uint64_t v6 = -[NSManagedObjectID persistentStore](objectID, "persistentStore");
    uint64_t v7 = v6;
    if (!v6
      || !-[NSString isEqualToString:](-[NSPersistentStore type](v6, "type"), "isEqualToString:", @"SQLite"))
    {
      *((_BYTE *)v26 + 24) = 1;
LABEL_20:

      BOOL v5 = *((_BYTE *)v26 + 24) != 0;
      goto LABEL_21;
    }

    uint64_t v8 = -[NSPersistentStore mirroringDelegate](v7, "mirroringDelegate");
    id v9 = v8;
    if (v8)
    {
      __int128 v10 = (void *)v8[1];
      if (*((_BYTE *)v9 + 89))
      {
        if ([v10 databaseScope] == 1)
        {
          if (*((void *)v9 + 19))
          {
            if (self) {
              metadataContext = self->_metadataContext;
            }
            else {
              metadataContext = 0LL;
            }
            __int128 v12 = metadataContext;
            v24[0] = MEMORY[0x1895F87A8];
            v24[1] = 3221225472LL;
            v24[2] = __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke;
            v24[3] = &unk_189EA9588;
            v24[4] = objectID;
            v24[5] = v7;
            v24[6] = v12;
            v24[7] = v9;
            v24[8] = &v25;
            -[NSManagedObjectContext performBlockAndWait:](v12, "performBlockAndWait:", v24);
          }

          goto LABEL_19;
        }

        if ([*((id *)v9 + 1) databaseScope] == 3)
        {
          uint64_t v23 = 0LL;
          v33[0] = objectID;
          id v13 = -[NSDictionary objectForKey:]( -[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:]( self,  "fetchSharesMatchingObjectIDs:error:",  [MEMORY[0x189603F18] arrayWithObjects:v33 count:1],  &v23),  "objectForKey:",  objectID);
          if (!v13)
          {
            uint64_t v15 = [NSString stringWithUTF8String:"Failed to fetch the CKShare for an object in the shared database: %@ - %@"];
            _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, (uint64_t)objectID);
            uint64_t v22 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = objectID;
              __int16 v31 = 2112;
              uint64_t v32 = v23;
              _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@",  buf,  0x16u);
            }

            goto LABEL_19;
          }

          if (objc_msgSend((id)objc_msgSend(v13, "currentUserParticipant"), "permission") != 3)
          {
LABEL_19:

            goto LABEL_20;
          }
        }
      }

      else if ([v10 databaseScope] != 2)
      {
        goto LABEL_19;
      }
    }

    *((_BYTE *)v26 + 24) = 1;
    goto LABEL_19;
  }

  BOOL v5 = 1;
  *((_BYTE *)v26 + 24) = 1;
LABEL_21:
  _Block_object_dispose(&v25, 8);
  return v5;
}

void __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  v23[0] = *(void *)(a1 + 32);
  uint64_t v2 = (void *)objc_msgSend( +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v23, 1),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  &v18),  "lastObject");
  if (v2)
  {
    id v3 = (void *)[v2 createRecordFromSystemFields];
    id v4 = v3;
    if (!v3
      || (BOOL v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "creatorUserRecordID"), "recordName"),
          ([v5 isEqualToString:getCloudKitCKCurrentUserDefaultName()] & 1) != 0)
      || ((uint64_t v6 = (void *)objc_msgSend((id)objc_msgSend(v4, "creatorUserRecordID"), "recordName"),
           (uint64_t v7 = *(void *)(a1 + 56)) == 0)
        ? (uint64_t v8 = 0LL)
        : (uint64_t v8 = *(void **)(v7 + 152)),
          objc_msgSend(v6, "isEqualToString:", objc_msgSend(v8, "recordName"))))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    }
  }

  else if (v18)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@"];
    _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
    uint64_t v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@",  buf,  0x16u);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

- (BOOL)canDeleteRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  v23[1] = *MEMORY[0x1895F89C0];
  BOOL v5 = (id *) -[NSPersistentStore mirroringDelegate]( -[NSManagedObjectID persistentStore](objectID, "persistentStore"),  "mirroringDelegate");
  uint64_t v6 = v5;
  if (!v5)
  {
    if ([0 databaseScope] != 1)
    {
      BOOL v7 = [0 databaseScope] != 3;
      goto LABEL_11;
    }

    goto LABEL_3;
  }

  if ([v5[1] databaseScope] != 1)
  {
    if ([v6[1] databaseScope] == 3)
    {
      if (!*((_BYTE *)v6 + 89)) {
        goto LABEL_3;
      }
      uint64_t v18 = 0LL;
      v23[0] = objectID;
      id v8 = -[NSDictionary objectForKey:]( -[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:]( self,  "fetchSharesMatchingObjectIDs:error:",  [MEMORY[0x189603F18] arrayWithObjects:v23 count:1],  &v18),  "objectForKey:",  objectID);
      if (v8)
      {
        BOOL v7 = objc_msgSend((id)objc_msgSend(v8, "currentUserParticipant"), "permission") == 3;
        goto LABEL_11;
      }

      uint64_t v9 = [NSString stringWithUTF8String:"Failed to fetch the CKShare for an object in the shared database: %@ - %@"];
      _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, (uint64_t)objectID);
      uint64_t v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = objectID;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@",  buf,  0x16u);
      }
    }

    BOOL v7 = 1;
    goto LABEL_11;
  }

- (BOOL)canModifyManagedObjectsInStore:(NSPersistentStore *)store
{
  if (-[NSString isEqualToString:](-[NSPersistentStore type](store, "type"), "isEqualToString:", @"SQLite"))
  {
    id v4 = (unsigned __int8 *)-[NSPersistentStore mirroringDelegate](store, "mirroringDelegate");
    BOOL v5 = v4;
    if (!v4) {
      goto LABEL_7;
    }
    int v6 = v4[89];
    uint64_t v7 = [*((id *)v4 + 1) databaseScope];
    if (!v6)
    {
      BOOL v8 = v7 == 2;
      goto LABEL_9;
    }

    if (v7 == 1) {
      BOOL v8 = v5[19] != 0LL;
    }
    else {
LABEL_7:
    }
      BOOL v8 = 1;
LABEL_9:

    return v8;
  }

  return 1;
}

- (void)eventUpdated:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  BOOL v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  int v6 = (void *)[MEMORY[0x189607958] defaultCenter];
  uint64_t v7 = @"event";
  v8[0] = a3;
  objc_msgSend( v6,  "postNotificationName:object:userInfo:",  @"NSPersistentCloudKitContainerEventChangedNotification",  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  objc_autoreleasePoolPop(v5);
}

- (void)publishActivity:(id)a3
{
  BOOL v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v7 = (void *)[a3 createDictionaryRepresentation];
  [v6 setObject:v7 forKey:@"activityDictionary"];
  objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSPersistentCloudKitContainerActivityChangedNotificationName",  self,  v6);

  objc_autoreleasePoolPop(v5);
}

- (BOOL)assignManagedObjects:(id)a3 toCloudKitRecordZone:(id)a4 inPersistentStore:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 1;
  uint64_t v27 = 0LL;
  char v28 = &v27;
  uint64_t v29 = 0x3052000000LL;
  uint64_t v30 = __Block_byref_object_copy__19;
  __int16 v31 = __Block_byref_object_dispose__19;
  uint64_t v32 = 0LL;
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v12 = (id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext");
  uint64_t v13 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke;
  v26[3] = &unk_189EA9290;
  v26[4] = v12;
  v26[5] = a3;
  v26[6] = v10;
  v26[7] = v11;
  v26[8] = &v33;
  v26[9] = &v27;
  [v12 performBlockAndWait:v26];
  v25[0] = v13;
  v25[1] = 3221225472LL;
  v25[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_77;
  v25[3] = &unk_189EA9308;
  v25[4] = v11;
  v25[5] = a4;
  v25[6] = v10;
  v25[7] = &v33;
  v25[8] = &v27;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v25);

  if (!*((_BYTE *)v34 + 24))
  {
    id v16 = (id)v28[5];
    if (v16)
    {
      if (a6) {
        *a6 = v16;
      }
    }

    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      uint64_t v24 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v39 = 1024;
        int v40 = 710;
        _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v28[5] = 0LL;
  char v14 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v14;
}

id __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke( uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v31 = 0LL;
  if ([*(id *)(a1 + 32) obtainPermanentIDsForObjects:*(void *)(a1 + 40) error:&v31])
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id obj = *(id *)(a1 + 40);
    id result = (id)[obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    id v25 = result;
    if (result)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        id v3 = 0LL;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v3);
          if ([v4 managedObjectContext] != *(void *)(a1 + 32))
          {
            uint64_t v5 = objc_msgSend( NSString,  "stringWithUTF8String:",  "Client passed in objects from multiple contexts, this should return an error.");
            _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, v22);
            id v12 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: Client passed in objects from multiple contexts, this should return an error.",  buf,  2u);
            }
          }

          id v13 = (id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "persistentStore");
          id v14 = (id)[v13 identifier];
          uint64_t v15 = (id)[v13 mirroringDelegate];
          id v16 = (id)[*(id *)(a1 + 48) objectForKey:v14];
          if (!v16)
          {
            id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
            [*(id *)(a1 + 48) setObject:v16 forKey:v14];
          }

          id v17 = (id)[*(id *)(a1 + 56) objectForKey:v14];
          if (!v17)
          {
            id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
            [*(id *)(a1 + 56) setObject:v17 forKey:v14];
          }

          objc_msgSend(v16, "addObject:", objc_msgSend(v4, "objectID"));

          uint64_t v18 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v4, "entity"), "attributesByName"),  "objectForKey:",  @"ckRecordID");
          if (!v18 || (id v19 = (id)[v4 valueForKey:@"ckRecordID"]) == 0)
          {
            id v19 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString");
            if (v18)
            {
              if (v15) {
                uint64_t v20 = (void *)v15[1];
              }
              else {
                uint64_t v20 = 0LL;
              }
            }
          }

          uint64_t v21 = -[_PFObjectCKRecordZoneLink initWithObjectID:recordName:]( [_PFObjectCKRecordZoneLink alloc],  "initWithObjectID:recordName:",  [v4 objectID],  v19);
          [v17 addObject:v21];

          id v3 = (char *)v3 + 1;
        }

        while (v25 != v3);
        id result = (id)[obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        id v25 = result;
      }

      while (result);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id result = v31;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = result;
  }

  return result;
}

uint64_t __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_77( uint64_t a1,  uint64_t a2)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2;
  v4[3] = &unk_189EA92B8;
  uint64_t v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = a2;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:*(void *)(a1 + 32)];
  id v45 = 0LL;
  uint64_t v7 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"),  "persistentStoreForIdentifier:",  a2);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (id *)(id)[v7 mirroringDelegate];
    uint64_t v10 = v9;
    if (v9)
    {
      v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  *(void **)(a1 + 32),  [v9[1] databaseScope],  (uint64_t)v8,  *(void **)(a1 + 40),  (uint64_t)&v45);
      if (v38)
      {
        id v11 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  (void *)[*(id *)(a1 + 48) objectForKey:a2],  v8,  *(void **)(a1 + 40),  &v45);
        if (!v11) {
          goto LABEL_24;
        }
        uint64_t v35 = v10;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v42;
          uint64_t v37 = *MEMORY[0x189607460];
          uint64_t v36 = *MEMORY[0x1896075E8];
LABEL_7:
          uint64_t v15 = 0LL;
          while (1)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(a3);
            }
            id v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
            id v17 = (void *)objc_msgSend(v11, "objectForKey:", objc_msgSend(v16, "objectID"));
            if (v17)
            {
              uint64_t v18 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v17 recordZone]);
              if (([v18 isEqual:*(void *)(a1 + 32)] & 1) == 0)
              {
                *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
                id v19 = objc_alloc(MEMORY[0x189607870]);
                uint64_t v50 = v36;
                uint64_t v51 = [NSString stringWithFormat:@"The object %@ is already assigned to the zone '%@' and cannot be moved to '%@'.", objc_msgSend(v16, "objectID"), v18, *(void *)(a1 + 32)];
                *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( v19,  "initWithDomain:code:userInfo:",  v37,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1));
                *a4 = 1;
              }
            }

            else
            {
              uint64_t v20 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"),  *(void *)(a1 + 40));
              [*(id *)(a1 + 40) assignObject:v20 toPersistentStore:v8];
              -[NSManagedObject setCkRecordName:](v20, "setCkRecordName:", [v16 recordName]);
              uint64_t v21 = (void *)MEMORY[0x189607968];
              uint64_t v22 = _sqlEntityForEntityDescription( [v8 model],  (void *)objc_msgSend((id)objc_msgSend(v16, "objectID"), "entity"));
              uint64_t v23 = v22 ? *(unsigned int *)(v22 + 184) : 0LL;
              -[NSManagedObject setEntityId:](v20, "setEntityId:", [v21 numberWithUnsignedInt:v23]);
              -[NSManagedObject setEntityPK:]( v20,  "setEntityPK:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  objc_msgSend((id)objc_msgSend(v16, "objectID"), "_referenceData64")));
              -[NSManagedObject setRecordZone:](v20, "setRecordZone:", v38);
              -[NSManagedObject setNeedsUpload:](v20, "setNeedsUpload:", 1LL);
            }

            if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v24 = [a3 countByEnumeratingWithState:&v41 objects:v52 count:16];
              uint64_t v13 = v24;
              if (v24) {
                goto LABEL_7;
              }
              break;
            }
          }
        }

        uint64_t v10 = v35;
        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
        {
          if (([*(id *)(a1 + 40) save:&v45] & 1) == 0)
          {
LABEL_24:
            *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
            *a4 = 1;
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v45;
          }
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v45;
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      id v25 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v26 = *MEMORY[0x189607460];
      uint64_t v48 = *MEMORY[0x1896075E8];
      v49 = @"Target store has no mirroring delegate.";
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( v25,  "initWithDomain:code:userInfo:",  v26,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1));
      uint64_t v27 = [NSString stringWithUTF8String:"Target store has no mirroring delegate: %@"];
      _NSCoreDataLog(17LL, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v8);
      __int128 v34 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v8;
        _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Target store has no mirroring delegate: %@",  buf,  0xCu);
      }
    }
  }
}

- (void)doWorkOnMetadataContext:(uint64_t)a3 withBlock:
{
  if (a1)
  {
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = v5;
    if (a2)
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      void v8[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke;
      v8[3] = &unk_189EA9538;
      v8[4] = v5;
      v8[5] = a3;
      [v5 performBlock:v8];
    }

    else
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_170;
      v7[3] = &unk_189EA9538;
      v7[4] = v5;
      v7[5] = a3;
      [v5 performBlockAndWait:v7];
    }
  }

- (void)acceptShareInvitationsFromMetadata:(NSArray *)metadata intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
}

- (void)_acceptShareInvitationsWithURLs:(void *)a3 shareMetadatas:(void *)a4 forPersistentStore:(uint64_t)a5 completion:
{
  v27[2] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v9 = (NSPersistentStoreResult *)(id)[a4 mirroringDelegate];
  uint64_t v10 = v9;
  if (!v9)
  {
    id v16 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189607760];
    uint64_t v25 = [a4 URL];
    uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v18 = (void *)[v16 exceptionWithName:*MEMORY[0x189603A60] reason:@"Provided persistent store is not backed by CloudKit." userInfo:v17];
    goto LABEL_11;
  }

  if (-[objc_class databaseScope](v9[1].super.isa, "databaseScope") != 3)
  {
    id v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = [NSString stringWithFormat:@"Provided persistent store is not set to the shared database scope and cannot accept share invitation."];
    v26[0] = *MEMORY[0x189607760];
    v27[0] = [a4 URL];
    v26[1] = @"databaseScope";
    v27[1] = softLinkCKDatabaseScopeString(-[objc_class databaseScope](v10[1].super.isa, "databaseScope"));
    uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v18 = (void *)[v19 exceptionWithName:*MEMORY[0x189603A60] reason:v20 userInfo:v21];
LABEL_11:
    objc_exception_throw(v18);
    __break(1u);
  }

  id v11 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsRequest);
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  void v23[2] = __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke;
  v23[3] = &unk_189EA92E0;
  v23[4] = a5;
  uint64_t v12 = -[NSCloudKitMirroringAcceptShareInvitationsRequest initWithOptions:completionBlock:]( v11,  "initWithOptions:completionBlock:",  0LL,  v23);
  uint64_t v14 = v12;
  if (v12)
  {
    v12->super._isContainerRequest = 1;
    objc_setProperty_nonatomic_copy(v12, v13, a2, 80LL);
    objc_setProperty_nonatomic_copy(v14, v15, a3, 88LL);
  }

  uint64_t v22 = 0LL;
  if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](v10, v14, &v22)) {
    (*(void (**)(uint64_t, void, uint64_t))(a5 + 16))(a5, 0LL, v22);
  }
}

- (void)acceptShareInvitationsFromURLs:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5
{
}

void __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if ([a2 success])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4) {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))( v4,  [a2 acceptedShareMetadatas],  objc_msgSend(a2, "error"));
      }
    }

    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@"];
      uint64_t v7 = [a2 request];
      _NSCoreDataLog(17LL, v6, v8, v9, v10, v11, v12, v13, v7);
      uint64_t v14 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = [a2 request];
        _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@",  buf,  0xCu);
      }

      uint64_t v15 = *(void *)(a1 + 32);
      if (v15)
      {
        uint64_t v16 = *MEMORY[0x189607460];
        uint64_t v17 = *MEMORY[0x1896075F0];
        uint64_t v18 = @"Share acceptance succeeded but did not return an acceptance result.";
        (*(void (**)(uint64_t, void, uint64_t))(v15 + 16))( v15,  0,  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v16,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
      }
    }
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, 0, [a2 error]);
    }
  }

- (void)persistUpdatedShare:(CKShare *)share inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 1;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000LL;
  uint64_t v31 = __Block_byref_object_copy__19;
  uint64_t v32 = __Block_byref_object_dispose__19;
  uint64_t v33 = 0LL;
  id v8 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke;
  void v27[3] = &unk_189EA9308;
  v27[4] = share;
  v27[5] = persistentStore;
  v27[6] = v8;
  v27[7] = &v28;
  v27[8] = &v34;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
  if (completion && *((_BYTE *)v35 + 24))
  {
    unint64_t v9 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    do
    {
      *((_BYTE *)v35 + 24) = 1;
      uint64_t v10 = (void *)v29[5];
      if (v10)
      {

        v29[5] = 0LL;
      }

      id v22 = 0LL;
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS____PFRequestExecutor);
      objc_initWeak(&location, self);
      uint64_t v12 = -[NSPersistentStore identifier](persistentStore, "identifier");
      uint64_t v13 = -[CKShare recordID](share, "recordID");
      uint64_t v14 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportRequest);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2;
      v19[3] = &unk_189EA9330;
      v19[4] = v12;
      objc_copyWeak(&v20, &location);
      v19[7] = completion;
      v19[8] = &v23;
      v19[5] = v13;
      v19[6] = v11;
      uint64_t v15 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:]( v14,  "initWithOptions:completionBlock:",  0LL,  v19);
      uint64_t v16 = (void *)v15;
      if (v15) {
        *(_BYTE *)(v15 + 56) = 1;
      }
      if (*((_BYTE *)v35 + 24))
      {
        if (-[_PFRequestExecutor executeRequest:inContext:error:]( v11,  "executeRequest:inContext:error:",  v15,  self->_metadataContext,  &v22))
        {
          if (!-[_PFRequestExecutor wait](v11, "wait"))
          {
            *((_BYTE *)v24 + 24) = 1;
            id v22 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:]( (uint64_t)self,  (uint64_t)v16,  (uint64_t)@"Persist-Share-Export");
            (*((void (**)(void *, void, id))completion + 2))(completion, 0LL, v22);

            id v22 = 0LL;
          }
        }

        else
        {
          *((_BYTE *)v35 + 24) = 0;
          (*((void (**)(void *, void, id))completion + 2))(completion, 0LL, v22);
          *((_BYTE *)v24 + 24) = 1;
        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      if (*((_BYTE *)v24 + 24)) {
        break;
      }
    }

    while (v9++ < 9);
    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordID"), "zoneID");
  uint64_t v5 = (void *)[*(id *)(a1 + 40) mirroringDelegate];
  if (v5) {
    uint64_t v5 = (void *)v5[7];
  }
  uint64_t v6 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v4,  [v5 databaseScope],  *(void *)(a1 + 40),  a2,  *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v6)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    return;
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7
    && (uint64_t v8 = *(void *)(v7 + 8)) != 0
    && (v9 = v6, (uint64_t v10 = *(void *)(v8 + 136)) != 0)
    && (id v11 = -[PFCloudKitArchivingUtilities encodeRecord:error:]( v10,  *(void *)(a1 + 32),  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))) != 0LL)
  {
    id v14 = v11;
    -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v11);
    -[NSManagedObject setNeedsShareUpdate:](v9, "setNeedsShareUpdate:", 1LL);
    if ([a2 save:*(void *)(*(void *)(a1 + 56) + 8) + 40]) {
      goto LABEL_13;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
LABEL_13:
}

uint64_t __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "storeIdentifier"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    if ([a2 success])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      uint64_t v5 = WeakRetained;
      if (WeakRetained)
      {
        uint64_t v6 = *(void *)(a1 + 56);
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke;
        v10[3] = &unk_189EA9358;
        __int128 v11 = *(_OWORD *)(a1 + 32);
        uint64_t v12 = v6;
        -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)WeakRetained, 0, (uint64_t)v10);
      }
    }

    else
    {
      uint64_t v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if ([v7 isEqual:*MEMORY[0x189607460]]
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        char v8 = 0;
LABEL_11:
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v8;
        return [*(id *)(a1 + 48) requestFinished];
      }

      (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 56) + 16))( *(void *)(a1 + 56),  0,  [a2 error]);
    }

    char v8 = 1;
    goto LABEL_11;
  }

  return [*(id *)(a1 + 48) requestFinished];
}

- (uint64_t)createTimeoutErrorForRequest:(uint64_t)a3 withLabel:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer timed out waiting for request: %@ - %@"];
    _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, a3);
    uint64_t v12 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = a2;
      _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: NSPersistentCloudKitContainer timed out waiting for request: %@ - %@",  buf,  0x16u);
    }

    id v13 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v14 = *MEMORY[0x189607460];
    v15[0] = @"request";
    v15[1] = @"label";
    v16[0] = a2;
    v16[1] = a3;
    return objc_msgSend( v13,  "initWithDomain:code:userInfo:",  v14,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  }

  return result;
}

void __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_msgSend( (id)objc_msgSend(a2, "persistentStoreCoordinator"),  "persistentStoreForIdentifier:",  *(void *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Unsupported store type for CloudKit request %@"];
      _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      id v13 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Unsupported store type for CloudKit request %@",  buf,  0xCu);
      }
    }

    uint64_t v14 = [v5 mirroringDelegate];
    if (!v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Store is not mirrored %@"];
      _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v5);
      id v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_fault_impl(&dword_186681000, v22, OS_LOG_TYPE_FAULT, "CoreData: Store is not mirrored %@", buf, 0xCu);
      }
    }

    *(void *)buf = 0LL;
    uint64_t v23 = (void *)[*(id *)(a1 + 40) zoneID];
    uint64_t v24 = (void *)[v5 mirroringDelegate];
    if (v24) {
      uint64_t v24 = (void *)v24[1];
    }
    uint64_t v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v23,  [v24 databaseScope],  (uint64_t)v5,  a2,  (uint64_t)buf);
    if (v25)
    {
      if (v14 && (uint64_t v26 = *(void *)(v14 + 8)) != 0) {
        uint64_t v27 = *(void *)(v26 + 136);
      }
      else {
        uint64_t v27 = 0LL;
      }
      uint64_t v28 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( v27,  (void *)-[NSManagedObject encodedShareData](v25, "encodedShareData"),  (char *)[*(id *)(a1 + 40) zoneID],  buf);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

- (void)fetchParticipantsMatchingLookupInfos:(NSArray *)lookupInfos intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (-[NSArray count](lookupInfos, "count"))
  {
    id v8 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v10 = (void *)[objc_alloc((Class)getCloudKitCKFetchShareParticipantsOperationClass[0]()) initWithUserIdentityLookupInfos:lookupInfos];
      uint64_t v11 = MEMORY[0x1895F87A8];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      void v16[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke;
      v16[3] = &unk_189EA9380;
      v16[4] = v9;
      [v10 setPerShareParticipantCompletionBlock:v16];
      v15[0] = v11;
      v15[1] = 3221225472LL;
      void v15[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2;
      v15[3] = &unk_189EA93A8;
      v15[4] = v9;
      v15[5] = completion;
      [v10 setFetchShareParticipantsCompletionBlock:v15];
      uint64_t v12 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
      if (v12) {
        uint64_t v12 = (void *)v12[6];
      }
      [v12 addOperation:v10];
    }

    else
    {
      id v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = *MEMORY[0x189607460];
      uint64_t v18 = @"NSAffectedStoresErrorKey";
      if (!persistentStore) {
        persistentStore = (NSPersistentStore *)[MEMORY[0x189603FE8] null];
      }
      uint64_t v17 = persistentStore;
      v19[0] = [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
      (*((void (**)(void *, void, uint64_t))completion + 2))( completion,  0,  objc_msgSend( v13,  "errorWithDomain:code:userInfo:",  v14,  134091,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1)));
    }
  }

  else
  {
    (*((void (**)(void *, void, void))completion + 2))(completion, MEMORY[0x189604A58], 0LL);
  }

void __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }

  else
  {
    id v3 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v4 = __ckLoggingOverride != 0;
    uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch participant with lookup info: %@\n%@"];
    _NSCoreDataLog( v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[NSPersistentCloudKitContainer fetchParticipantsMatchingLookupInfos:intoPersistentStore:completion:]_block_invoke");
    objc_autoreleasePoolPop(v3);
  }

uint64_t __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2);
}

- (void)purgeObjectsAndRecordsInZoneWithID:(CKRecordZoneID *)zoneID inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  v35[4] = *MEMORY[0x1895F89C0];
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v10 = -[CKRecordZoneID ownerName](zoneID, "ownerName");
  if (-[NSString isEqualToString:](v10, "isEqualToString:", getCloudKitCKCurrentUserDefaultName())) {
    uint64_t v11 = 2LL;
  }
  else {
    uint64_t v11 = 3LL;
  }
  if (persistentStore)
  {
    if (!-[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate"))
    {
      uint64_t v19 = (void *)MEMORY[0x189603F70];
      uint64_t v32 = *MEMORY[0x189607760];
      uint64_t v33 = -[NSPersistentStore URL](persistentStore, "URL");
      uint64_t v20 = [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v21 = *MEMORY[0x189603A60];
      id v22 = @"Provided persistent store is not backed by CloudKit.";
      goto LABEL_24;
    }

    uint64_t v12 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
    if (v12) {
      uint64_t v12 = (void *)v12[1];
    }
    if (v11 != [v12 databaseScope])
    {
      while (1)
      {
        uint64_t v19 = (void *)MEMORY[0x189603F70];
        v34[0] = @"storeURL";
        v35[0] = -[NSPersistentStore URL](persistentStore, "URL");
        v34[1] = @"databaseScope";
        uint64_t v23 = (void *)MEMORY[0x189607968];
        uint64_t v24 = -[NSPersistentStore mirroringDelegate](persistentStore, "mirroringDelegate");
        if (v24) {
          uint64_t v24 = (void *)v24[1];
        }
        v35[1] = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "databaseScope"));
        v34[2] = @"requiredDatabaseScope";
        uint64_t v25 = softLinkCKDatabaseScopeString(v11);
        v34[3] = @"zoneID";
        v35[2] = v25;
        v35[3] = zoneID;
        uint64_t v20 = [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:4];
        uint64_t v21 = *MEMORY[0x189603A60];
        id v22 = @"Illegal attempt to purge a zone from the wrong store";
LABEL_24:
        objc_exception_throw((id)[v19 exceptionWithName:v21 reason:v22 userInfo:v20]);
        __break(1u);
      }
    }

    [v9 addObject:persistentStore];
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v13 = -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "persistentStores");
    uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v17 mirroringDelegate])
          {
            uint64_t v18 = (void *)[v17 mirroringDelegate];
            if (v18) {
              uint64_t v18 = (void *)v18[1];
            }
            if (v11 == [v18 databaseScope]) {
              [v9 addObject:v17];
            }
          }
        }

        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      }

      while (v14);
    }
  }

  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  void v26[2] = __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke;
  v26[3] = &unk_189EA93D0;
  v26[4] = v9;
  v26[5] = self;
  v26[6] = zoneID;
  v26[7] = completion;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 1, (uint64_t)v26);
}

uint64_t __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke( void *a1,  void *a2)
{
  v83[1] = *MEMORY[0x1895F89C0];
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = (id)a1[4];
  uint64_t v3 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
  if (v3)
  {
    id v56 = 0LL;
    uint64_t v4 = *(void *)v58;
    uint64_t v52 = *MEMORY[0x189607460];
    uint64_t v53 = *MEMORY[0x189607798];
LABEL_3:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v58 != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = a1[5];
      if (!v6)
      {
LABEL_49:
        uint64_t result = a1[7];
        if (result) {
          return (*(uint64_t (**)(uint64_t, void, id))(result + 16))(result, 0LL, v56);
        }
        return result;
      }

      uint64_t v7 = *(void **)(*((void *)&v57 + 1) + 8 * v5);
      uint64_t v8 = (void *)a1[6];
      uint64_t v71 = 0LL;
      uint64_t v72 = &v71;
      uint64_t v73 = 0x2020000000LL;
      char v74 = 1;
      uint64_t v65 = 0LL;
      char v66 = &v65;
      uint64_t v67 = 0x3052000000LL;
      v68 = __Block_byref_object_copy__19;
      __int16 v69 = __Block_byref_object_dispose__19;
      uint64_t v70 = 0LL;
      id v9 = (id *)(id)[v7 mirroringDelegate];
      if (v9) {
        break;
      }
      uint64_t v16 = [NSString stringWithUTF8String:"Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@"];
      _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v7);
      uint64_t v23 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@",  buf,  0xCu);
      }

      char v24 = 0;
      BOOL v75 = *((_BYTE *)v72 + 24) != 0;
LABEL_35:

      if ((v24 & 1) != 0)
      {
        if (*((_BYTE *)v72 + 24)) {
          goto LABEL_37;
        }
        id v40 = (id)v66[5];
        if (!v40)
        {
          uint64_t v42 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog( 17LL,  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
          v49 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
            __int16 v78 = 1024;
            int v79 = 1134;
            _os_log_fault_impl( &dword_186681000,  v49,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
          }

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke( uint64_t a1,  void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[a2 error];
  }

  return [*(id *)(a1 + 32) requestFinished];
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_2( uint64_t a1,  void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[a2 error];
  }

  return [*(id *)(a1 + 32) requestFinished];
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_3( uint64_t a1,  void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[a2 error];
  }

  return [*(id *)(a1 + 32) requestFinished];
}

- (NSDictionary)fetchSharesMatchingObjectIDs:(NSArray *)objectIDs error:(NSError *)error
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3052000000LL;
  uint64_t v50 = __Block_byref_object_copy__19;
  uint64_t v51 = __Block_byref_object_dispose__19;
  uint64_t v52 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000LL;
  uint64_t v44 = __Block_byref_object_copy__19;
  uint64_t v45 = __Block_byref_object_dispose__19;
  uint64_t v46 = 0LL;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( objectIDs,  "countByEnumeratingWithState:objects:count:",  &v37,  v57,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(objectIDs);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v10 = (id)[v9 persistentStore];
        if (objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", @"SQLite"))
        {
          if (objc_msgSend( (id)objc_msgSend(v10, "ancillaryModels"),  "objectForKey:",  @"NSPersistentStoreMirroringDelegateOptionKey"))
          {
            uint64_t v11 = [v10 mirroringDelegate];
            if (v11)
            {
              if (*(_BYTE *)(v11 + 144))
              {
                id v12 = (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(v10, "identifier"));
                if (!v12)
                {
                  id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
                  objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v10, "identifier"));
                }

                [v12 addObject:v9];
              }
            }
          }
        }
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( objectIDs,  "countByEnumeratingWithState:objects:count:",  &v37,  v57,  16LL);
    }

    while (v6);
  }

  if ([v5 count])
  {
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke;
    v36[3] = &unk_189EA9420;
    v36[4] = v5;
    v36[5] = &v41;
    v36[6] = &v47;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v36);
    id v13 = (id)v48[5];
  }

  else
  {
    id v13 = objc_alloc_init(MEMORY[0x189603F68]);
    v48[5] = (uint64_t)v13;
  }

  if (!v13)
  {
    uint64_t v14 = (NSError *)(id)v42[5];
    if (v14)
    {
      if (error) {
        *error = v14;
      }
    }

    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      uint64_t v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v55 = 1024;
        int v56 = 1218;
        _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    if (!v42[5])
    {
      uint64_t v23 = [NSString stringWithUTF8String:"fetchSharesMatchingObjectIDs failed but did not set an error."];
      _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, v33);
      uint64_t v30 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v30,  OS_LOG_TYPE_FAULT,  "CoreData: fetchSharesMatchingObjectIDs failed but did not set an error.",  buf,  2u);
      }
    }
  }

  v42[5] = 0LL;
  uint64_t v31 = (NSDictionary *)(id)v48[5];
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v31;
}

void __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v38;
LABEL_3:
    uint64_t v4 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = v4;
      uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * v4);
      uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];
      uint64_t v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "persistentStoreForIdentifier:", v5);
      id v8 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  v6,  (uint64_t)v7,  a2,  (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      if (v8)
      {
        id v9 = v8;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          do
          {
            uint64_t v13 = 0LL;
            do
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
              uint64_t v15 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v14 recordZone]);
              uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "recordZone"), "encodedShareData");
              if (v16)
              {
                uint64_t v17 = (void *)v16;
                uint64_t v18 = [v7 mirroringDelegate];
                if (v18)
                {
                  uint64_t v19 = *(void *)(v18 + 8);
                  if (v19) {
                    uint64_t v18 = *(void *)(v19 + 136);
                  }
                  else {
                    uint64_t v18 = 0LL;
                  }
                }

                uint64_t v20 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( v18,  v17,  v15,  (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v14);
                  [v3 setObject:v21 forKey:v22];
                }

                else
                {
                  uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
                  if (v23)
                  {
                    id v27 = v23;

                    goto LABEL_27;
                  }
                }
              }

              ++v13;
            }

            while (v11 != v13);
            uint64_t v24 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            uint64_t v11 = v24;
          }

          while (v24);
        }
      }

      else
      {
        uint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        if (v25) {
          id v26 = v25;
        }
      }

- (NSArray)fetchSharesInPersistentStore:(NSPersistentStore *)persistentStore error:(NSError *)error
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3052000000LL;
  uint64_t v47 = __Block_byref_object_copy__19;
  uint64_t v48 = __Block_byref_object_dispose__19;
  uint64_t v49 = 0LL;
  uint64_t v38 = 0LL;
  __int128 v39 = &v38;
  uint64_t v40 = 0x3052000000LL;
  uint64_t v41 = __Block_byref_object_copy__19;
  uint64_t v42 = __Block_byref_object_dispose__19;
  uint64_t v43 = 0LL;
  if (persistentStore) {
    uint64_t v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", persistentStore, 0);
  }
  else {
    uint64_t v4 =  -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "persistentStores");
  }
  uint64_t v5 = v4;
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v34,  v54,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", @"SQLite"))
        {
          if (objc_msgSend( (id)objc_msgSend(v10, "ancillaryModels"),  "objectForKey:",  @"NSPersistentStoreMirroringDelegateOptionKey"))
          {
            uint64_t v11 = [v10 mirroringDelegate];
            if (v11)
            {
              if (*(_BYTE *)(v11 + 144)) {
                [v6 addObject:v10];
              }
            }
          }
        }
      }

      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v34,  v54,  16LL);
    }

    while (v7);
  }

  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000LL;
  uint64_t v31 = __Block_byref_object_copy__19;
  uint64_t v32 = __Block_byref_object_dispose__19;
  uint64_t v33 = 0LL;
  if ([v6 count])
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke;
    void v27[3] = &unk_189EA9448;
    v27[4] = v6;
    v27[5] = &v38;
    v27[6] = &v44;
    v27[7] = &v28;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
    if (v45[5]) {
      goto LABEL_21;
    }
  }

  else
  {
    id v12 = objc_alloc_init(MEMORY[0x189603F18]);
    v45[5] = (uint64_t)v12;
    if (v12) {
      goto LABEL_21;
    }
  }

  if (!v29[5])
  {
    uint64_t v16 = (NSError *)(id)v39[5];
    if (v16)
    {
      if (error) {
        *error = v16;
      }
    }

    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      uint64_t v24 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v51 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v52 = 1024;
        int v53 = 1303;
        _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

void __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke( void *a1,  void *a2)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v4 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"encodedShareData != nil"]);
  -[NSFetchRequest setAffectedStores:](v4, "setAffectedStores:", a1[4]);
  uint64_t v5 = (void *)[a2 executeFetchRequest:v4 error:*(void *)(a1[5] + 8) + 40];
  id v6 = v5;
  if (v5)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
          uint64_t v11 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v10);
          id v12 = (id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "persistentStore");
          uint64_t v13 = [v12 mirroringDelegate];
          if (v13)
          {
            uint64_t v14 = *(void **)(v13 + 8);
            if (v14) {
              uint64_t v14 = (void *)v14[17];
            }
          }

          else
          {
            uint64_t v14 = 0LL;
          }

          uint64_t v15 = v14;
          if (!v15)
          {
            uint64_t v16 = [NSString stringWithUTF8String:"Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have an asso ciated mirroring delegate: %@ - %@"];
            _NSCoreDataLog(17LL, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v12);
            uint64_t v23 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v35 = v12;
              __int16 v36 = 2112;
              __int128 v37 = v10;
              _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have a n associated mirroring delegate: %@ - %@",  buf,  0x16u);
            }
          }

          uint64_t v24 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( (uint64_t)v15,  (void *)[v10 encodedShareData],  v11,  (void *)(*(void *)(a1[5] + 8) + 40));

          if (v24)
          {
            [v29 addObject:v24];
          }

          else
          {
            uint64_t v25 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
            if (v25)
            {
              id v28 = v25;
              goto LABEL_23;
            }
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v26 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v7 = v26;
      }

      while (v26);
    }

- (void)shareManagedObjects:(NSArray *)managedObjects toShare:(CKShare *)share completion:(void *)completion
{
  uint64_t v113 = *MEMORY[0x1895F89C0];
  id v64 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v65 = (id)objc_msgSend(-[NSArray lastObject](managedObjects, "lastObject"), "managedObjectContext");
  if (share)
  {
    uint64_t v7 = (void *)objc_msgSend((id)objc_msgSend((id)-[CKShare recordID](share, "recordID"), "zoneID"), "ownerName");
    int v8 = [v7 isEqualToString:getCloudKitCKCurrentUserDefaultName()];
    uint64_t v9 = 2LL;
    if (!v8) {
      uint64_t v9 = 3LL;
    }
  }

  else
  {
    uint64_t v9 = 2LL;
  }

  uint64_t v67 = v9;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  uint64_t v10 = -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"),  "persistentStores");
  uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v106,  v112,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v107;
LABEL_8:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v107 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v106 + 1) + 8 * v13);
      uint64_t v15 = (void *)[v14 mirroringDelegate];
      if (v15) {
        uint64_t v15 = (void *)v15[1];
      }
      if ([v15 databaseScope] == v67) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v106,  v112,  16LL);
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
  }

  else
  {
LABEL_16:
    uint64_t v14 = 0LL;
  }

  uint64_t v16 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v17 = __ckLoggingOverride;
  }
  uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Sharing %lu objects from store: %@ to share: %@"];
  uint64_t v62 = share;
  NSUInteger v61 = -[NSArray count](managedObjects, "count");
  _NSCoreDataLog( v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]");
  objc_autoreleasePoolPop(v16);
  id v25 = (id)[v14 mirroringDelegate];
  uint64_t v26 = v25;
  if (v25) {
    id v27 = (void *)*((void *)v25 + 6);
  }
  else {
    id v27 = 0LL;
  }
  id v28 = v27;
  uint64_t v100 = 0LL;
  v101 = &v100;
  uint64_t v102 = 0x3052000000LL;
  v103 = __Block_byref_object_copy__19;
  v104 = __Block_byref_object_dispose__19;
  uint64_t v105 = 0LL;
  uint64_t v96 = 0LL;
  v97 = &v96;
  uint64_t v98 = 0x2020000000LL;
  char v99 = 1;
  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x3052000000LL;
  v93 = __Block_byref_object_copy__19;
  v94 = __Block_byref_object_dispose__19;
  uint64_t v95 = 0LL;
  uint64_t v84 = 0LL;
  v85 = &v84;
  uint64_t v86 = 0x3052000000LL;
  v87 = __Block_byref_object_copy__19;
  v88 = __Block_byref_object_dispose__19;
  uint64_t v89 = 0LL;
  uint64_t v78 = 0LL;
  int v79 = &v78;
  uint64_t v80 = 0x3052000000LL;
  uint64_t v81 = __Block_byref_object_copy__19;
  uint64_t v82 = __Block_byref_object_dispose__19;
  uint64_t v83 = 0LL;
  id v29 = objc_alloc_init(MEMORY[0x189603FE0]);
  if (!v14)
  {
    *((_BYTE *)v97 + 24) = 0;
    id v35 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v110 = *MEMORY[0x1896075F0];
    v111 = @"Could not locate private store in which to share.";
    uint64_t v36 = [MEMORY[0x189603F68] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    uint64_t v37 = [v35 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v36];
    v101[5] = v37;
    goto LABEL_38;
  }

  id v30 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v31 = objc_alloc_init(MEMORY[0x189603FA8]);
  v77[0] = MEMORY[0x1895F87A8];
  v77[1] = 3221225472LL;
  v77[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke;
  v77[3] = &unk_189EA9560;
  v77[4] = managedObjects;
  v77[5] = v65;
  v77[6] = v31;
  v77[7] = v14;
  v77[8] = v30;
  v77[9] = &v96;
  v77[10] = &v100;
  [v65 performBlockAndWait:v77];
  if (*((_BYTE *)v97 + 24))
  {
    if (share)
    {
      __int128 v32 = share;
      v85[5] = (uint64_t)v32;
      id v33 = (id)objc_msgSend((id)-[CKShare recordID](v32, "recordID"), "zoneID");
      __int128 v34 = v79;
    }

    else
    {
      if ([v30 count])
      {
        uint64_t v38 = [v30 allObjects];
        uint64_t v39 = -[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:]( self,  "fetchSharesMatchingObjectIDs:error:",  v38,  v101 + 5);
        uint64_t v40 = v39;
        if (v39)
        {
          if (-[NSDictionary count](v39, "count"))
          {
            id v41 =  -[NSDictionary objectForKey:]( v40,  "objectForKey:",  -[NSArray lastObject](-[NSDictionary allKeys](v40, "allKeys"), "lastObject"));
            v85[5] = (uint64_t)v41;
            id v42 = (id)objc_msgSend((id)objc_msgSend(v41, "recordID"), "zoneID");
            v79[5] = (uint64_t)v42;
          }
        }

        else
        {
          *((_BYTE *)v97 + 24) = 0;
          id v43 = (id)v101[5];
        }

        if (*((_BYTE *)v97 + 24) && !v79[5])
        {
          v76[0] = MEMORY[0x1895F87A8];
          v76[1] = 3221225472LL;
          void v76[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_147;
          v76[3] = &unk_189EA9470;
          v76[4] = v30;
          v76[5] = v14;
          v76[6] = &v78;
          v76[7] = &v84;
          v76[8] = &v96;
          v76[9] = &v100;
          -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v76);
        }
      }

      if (v85[5]) {
        goto LABEL_37;
      }
      id v57 = objc_alloc(getCloudKitCKRecordZoneIDClass());
      uint64_t v58 = [NSString stringWithFormat:@"%@%@", @"com.apple.coredata.cloudkit.share.", objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString"), self, v61, v14, v62];
      uint64_t v59 = [v57 initWithZoneName:v58 ownerName:getCloudKitCKCurrentUserDefaultName()];
      v79[5] = v59;
      id v60 = objc_alloc(getCloudKitCKShareClass());
      id v33 = (id)[v60 initWithRecordZoneID:v79[5]];
      __int128 v34 = v85;
    }

    v34[5] = (uint64_t)v33;
  }

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke( uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v40;
    uint64_t v31 = *MEMORY[0x1896075F0];
    uint64_t v32 = *MEMORY[0x189607460];
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        if ([v6 managedObjectContext] != *(void *)(a1 + 40))
        {
          uint64_t v7 = objc_msgSend( NSString,  "stringWithUTF8String:",  "Client attempting to share objects from multiple contexts, this should return an error.");
          _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, v30);
          uint64_t v14 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Client attempting to share objects from multiple contexts, this should return an error.",  buf,  2u);
          }
        }

        if (objc_msgSend((id)objc_msgSend(v6, "objectID"), "isTemporaryID"))
        {
          [*(id *)(a1 + 48) addObject:v6];
          [*(id *)(a1 + 40) assignObject:v6 toPersistentStore:*(void *)(a1 + 56)];
          id v15 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  v6);
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (uint64_t i = 0LL; i != v17; ++i)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (([v20 isTemporaryID] & 1) == 0) {
                  [*(id *)(a1 + 64) addObject:v20];
                }
              }

              uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
            }

            while (v17);
          }
        }

        else
        {
          uint64_t v21 = *(void *)(a1 + 56);
          if (v21 == objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"))
          {
            objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v6, "objectID"));
          }

          else
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
            uint64_t v22 = (void *)NSString;
            uint64_t v23 = (objc_class *)objc_opt_class();
            uint64_t v24 = NSStringFromClass(v23);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_assignObject_toPersistentStore_);
            uint64_t v30 = (uint64_t)v24;
            uint64_t v25 = [v22 stringWithFormat:@"%@ does not support sharing objects across persistent stores. %@ needs to be called with objects that are either inserted (with temporary objectIDs) or objects assigned to the correct desination store. Objects that exist in the 'wrong' store must be cloned (and their originals deleted) after which they can be assigned to the correct store by %@ or %@."];
            id v26 = objc_alloc(MEMORY[0x189607870]);
            v44[0] = v25;
            v43[0] = v31;
            v43[1] = @"offendingObject";
            if ([v6 objectID]) {
              id v27 = (const __CFString *)[v6 objectID];
            }
            else {
              id v27 = @"nil";
            }
            v44[1] = v27;
            v43[2] = @"destinationStoreURL";
            if ([*(id *)(a1 + 56) URL]) {
              id v28 = (const __CFString *)[*(id *)(a1 + 56) URL];
            }
            else {
              id v28 = @"nil";
            }
            v44[2] = v28;
            v43[3] = @"storeURL";
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"), "URL")) {
              id v29 = (const __CFString *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"),  "URL");
            }
            else {
              id v29 = @"nil";
            }
            v44[3] = v29;
            *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = objc_msgSend( v26,  "initWithDomain:code:userInfo:",  v32,  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  4));
          }
        }

        ++v5;
      }

      while (v5 != v3);
      uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      uint64_t v3 = result;
    }

    while (result);
  }

  return result;
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_147( void *a1,  uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v16 = 0LL;
  id v3 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:]( &OBJC_CLASS___NSCKRecordZoneMetadata,  "fetchZoneIDsAssignedToObjectsWithIDs:fromStore:inContext:error:",  a1[4],  a1[5],  a2,  &v16);
  uint64_t v4 = v3;
  if (v3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend( (id)objc_msgSend(v9, "zoneName"),  "hasPrefix:",  @"com.apple.coredata.cloudkit.share."))
          {
            *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = v9;
            id v10 = (id)[objc_alloc(getCloudKitCKShareClass()) initWithRecordZoneID:v9];
            uint64_t v11 = a1[7];
            goto LABEL_13;
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 0;
    id v10 = v16;
    uint64_t v11 = a1[9];
LABEL_13:
    *(void *)(*(void *)(v11 + 8) + 40LL) = v10;
  }
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v23 = 0LL;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Found %lu inserted objects to share."];
    [*(id *)(a1 + 40) count];
    _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
    if (objc_msgSend( *(id *)(a1 + 32),  "assignManagedObjects:toCloudKitRecordZone:inPersistentStore:error:",  *(void *)(a1 + 40),  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "recordID"),  "zoneID"),  *(void *)(a1 + 48),  &v23))
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v12 = *(void **)(a1 + 56);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v11, "containsObject:", objc_msgSend(v17, "objectID")) & 1) == 0)
            {
              id v18 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  v17);
              [v11 unionSet:v18];
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }

        while (v14);
      }

      objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", objc_msgSend(v11, "allObjects"));
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = v23;
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)
    && [*(id *)(a1 + 72) hasChanges]
    && ([*(id *)(a1 + 72) save:&v23] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL) = v23;
  }

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v2 = a2;
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v49 = 0LL;
  uint64_t v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  (void *)objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"),  "zoneID"),  *(void *)(a1 + 96),  *(void *)(a1 + 32),  a2,  (uint64_t)&v49);
  if (!v38)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = v49;
    goto LABEL_43;
  }

  id v4 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  *(void **)(a1 + 40),  *(void **)(a1 + 32),  v2,  &v49);
  if (!v4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = v49;
    goto LABEL_42;
  }

  __int128 v40 = v2;
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v6 = __ckLoggingOverride;
  }
  uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Got zone and metadatas: %@\n%@"];
  _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_3");
  objc_autoreleasePoolPop(v5);
  id v37 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        __int128 v19 = (void *)[v4 objectForKey:v18];
        [*(id *)(a1 + 56) addObject:v18];
        if (v19)
        {
          __int128 v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          if ((objc_msgSend( (id)objc_msgSend(v20, "zoneID"),  "isEqual:",  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"),  "zoneID")) & 1) == 0)
          {
            [v19 setNeedsCloudDelete:0];
            [v19 setNeedsLocalDelete:0];
            [v19 setNeedsUpload:1];
            [v19 setCkRecordSystemFields:0];
            [v19 setEncodedRecord:0];
            __int128 v21 = (void *)[v19 recordZone];
            __int128 v22 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordZoneMoveReceipt entityPath](&OBJC_CLASS___NSCKRecordZoneMoveReceipt, "entityPath"),  v40);
            [v40 assignObject:v22 toPersistentStore:*(void *)(a1 + 32)];
            -[NSManagedObject setRecordMetadata:](v22, "setRecordMetadata:", v19);
            -[NSManagedObject setMovedAt:](v22, "setMovedAt:", [MEMORY[0x189603F50] date]);
            -[NSManagedObject setNeedsCloudDelete:](v22, "setNeedsCloudDelete:", 1LL);
            -[NSManagedObject setZoneName:](v22, "setZoneName:", [v21 ckRecordZoneName]);
            -[NSManagedObject setOwnerName:](v22, "setOwnerName:", [v21 ckOwnerName]);
            -[NSManagedObject setRecordName:](v22, "setRecordName:", [v19 ckRecordName]);
            [v19 setRecordZone:v38];
            [v37 addObject:v20];
          }
        }

        else
        {
          uint64_t v23 = [v40 existingObjectWithID:v18 error:&v49];
          if (!v23
            || (id v24 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:]( NSCKRecordMetadata,  "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:",  v23,  1,  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"),  "zoneID"),  0,  &v49)) == 0)
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = v49;
            goto LABEL_23;
          }

          [v24 setNeedsUpload:1];
        }
      }

      uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_4( uint64_t a1,  void *a2)
{
  if (objc_msgSend( (id)objc_msgSend(a2, "storeIdentifier"),  "isEqualToString:",  objc_msgSend(*(id *)(a1 + 32), "identifier")))
  {
    char v4 = [a2 success];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    if ((v4 & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v6 = __ckLoggingOverride != 0;
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to export for share (%lu): %@"];
      [a2 error];
      _NSCoreDataLog( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_4");
      objc_autoreleasePoolPop(v5);
      uint64_t v14 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if ([v14 isEqualToString:*MEMORY[0x189607460]]
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = (id)[a2 error];
    }
  }

  return [*(id *)(a1 + 48) requestFinished];
}

id __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_5( uint64_t *a1,  void *a2)
{
  id v8 = 0LL;
  uint64_t v3 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  *(void **)(*(void *)(a1[6] + 8) + 40LL),  a1[10],  a1[4],  a2,  (uint64_t)&v8);
  if (!v3
    || ((v4 = a1[5]) == 0 || (v5 = *(void *)(v4 + 8)) == 0 ? (uint64_t v6 = 0LL) : (uint64_t v6 = *(void *)(v5 + 136)),
        id result = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( v6,  (void *)-[NSManagedObject encodedShareData](v3, "encodedShareData"),  *(char **)(*(void *)(a1[6] + 8) + 40LL),  &v8),  (*(void *)(*(void *)(a1[7] + 8) + 40LL) = result) == 0LL))
  {
    *(_BYTE *)(*(void *)(a1[8] + 8) + 24LL) = 0;
    id result = v8;
    *(void *)(*(void *)(a1[9] + 8) + 40LL) = result;
  }

  return result;
}

- (void)applyActivityVoucher:(id)a3 toStores:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator", a3, a4, 0LL),  "persistentStores");
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "mirroringDelegate"),  "addActivityVoucher:",  a3);
      }

      while (v7 != v9);
      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (void)expireActivityVoucher:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = -[NSPersistentStoreCoordinator persistentStores]( -[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator", 0LL),  "persistentStores");
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
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
        objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "mirroringDelegate"),  "expireActivityVoucher:",  a3);
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    uint64_t v2 = [NSString stringWithUTF8String:"An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@"];
    uint64_t v3 = [*(id *)(a1 + 32) registeredObjects];
    _NSCoreDataLog(17LL, v2, v4, v5, v6, v7, v8, v9, v3);
    __int128 v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [*(id *)(a1 + 32) registeredObjects];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v20;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@",  buf,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v11 = [NSString stringWithUTF8String:"An operation left NSPersistentCloudKitContainer's metadata context dirty: %@"];
    _NSCoreDataLog(17LL, v11, v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
    uint64_t v18 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@",  buf,  0xCu);
    }
  }

  return [*(id *)(a1 + 32) reset];
}

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_170(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    uint64_t v2 = [NSString stringWithUTF8String:"An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@"];
    uint64_t v3 = [*(id *)(a1 + 32) registeredObjects];
    _NSCoreDataLog(17LL, v2, v4, v5, v6, v7, v8, v9, v3);
    __int128 v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [*(id *)(a1 + 32) registeredObjects];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v20;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@",  buf,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v11 = [NSString stringWithUTF8String:"An operation left NSPersistentCloudKitContainer's metadata context dirty: %@"];
    _NSCoreDataLog(17LL, v11, v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
    uint64_t v18 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@",  buf,  0xCu);
    }
  }

  return [*(id *)(a1 + 32) reset];
}

@end