@interface PFCloudKitStoreComparisonCache
- (BOOL)checkCloudKitMetadata;
- (BOOL)populate:(id *)a3;
- (NSManagedObjectContext)otherStoreMoc;
- (NSManagedObjectContext)storeMoc;
- (NSPersistentStore)otherStore;
- (NSPersistentStore)store;
- (PFCloudKitStoreComparisonCache)initWithStore:(id)a3 otherStore:(id)a4;
- (id)deriveIdentifierForNonCloudObjectID:(id)a3;
- (id)identifiersForStore:(id)a3;
- (id)identityRecordNameForStoreWithIdentifier:(id)a3;
- (id)metadataForObjectWithID:(id)a3;
- (id)metadataForRecordID:(id)a3 inStore:(id)a4;
- (id)mirroredRelationshipForObject:(id)a3 relatedToObject:(id)a4 byRelationship:(id)a5;
- (id)mtmKeysForRecordZone:(id)a3 inStore:(id)a4;
- (id)mtmKeysForStore:(id)a3;
- (id)objectIDForIdentifier:(id)a3 inStore:(id)a4;
- (id)objectIDForRecordID:(id)a3 inStore:(id)a4;
- (id)recordIDForObjectID:(id)a3;
- (id)recordIDsRelatedToRecordID:(id)a3 byRelationshipNamed:(id)a4 inStore:(id)a5;
- (id)recordIdsForStore:(id)a3;
- (id)sharedZoneIDsForStore:(id)a3;
- (int64_t)databaseScopeForStoreWithIdentifier:(id)a3;
- (void)_setCheckCloudKitMetadata:(BOOL)a3;
- (void)dealloc;
@end

@implementation PFCloudKitStoreComparisonCache

- (PFCloudKitStoreComparisonCache)initWithStore:(id)a3 otherStore:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PFCloudKitStoreComparisonCache;
  v6 = -[PFCloudKitStoreComparisonCache init](&v14, sel_init);
  if (v6)
  {
    v6->_store = (NSPersistentStore *)a3;
    v6->_otherStore = (NSPersistentStore *)a4;
    v6->_storeMoc = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setPersistentStoreCoordinator:]( v6->_storeMoc,  "setPersistentStoreCoordinator:",  [a3 persistentStoreCoordinator]);
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v6->_storeMoc, "_setAllowAncillaryEntities:", 1LL);
    storeMoc = v6->_storeMoc;
    v16[0] = [a3 identifier];
    v8 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
    if (storeMoc)
    {
      uint64_t v9 = [v8 copy];

      storeMoc->_persistentStoreIdentifiers = (NSArray *)v9;
    }

    v6->_otherStoreMoc = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setPersistentStoreCoordinator:]( v6->_otherStoreMoc,  "setPersistentStoreCoordinator:",  [a4 persistentStoreCoordinator]);
    -[NSManagedObjectContext _setAllowAncillaryEntities:](v6->_otherStoreMoc, "_setAllowAncillaryEntities:", 1LL);
    otherStoreMoc = v6->_otherStoreMoc;
    uint64_t v15 = [a4 identifier];
    v11 = (void *)[MEMORY[0x189603F18] arrayWithObjects:&v15 count:1];
    if (otherStoreMoc)
    {
      uint64_t v12 = [v11 copy];

      otherStoreMoc->_persistentStoreIdentifiers = (NSArray *)v12;
    }

    v6->_storeUUIDToStoreCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v6;
}

- (void)dealloc
{
  self->_storeUUIDToStoreCache = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitStoreComparisonCache;
  -[PFCloudKitStoreComparisonCache dealloc](&v3, sel_dealloc);
}

- (BOOL)populate:(id *)a3
{
  v65[1] = *MEMORY[0x1895F89C0];
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  char v57 = 1;
  v4 = dispatch_group_create();
  v5 = objc_alloc_init(&OBJC_CLASS___PFCloudKitStoreComparisonCacheStoreCache);
  v6 = v5;
  if (v5) {
    v5->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  }
  -[NSMutableDictionary setObject:forKey:]( self->_storeUUIDToStoreCache,  "setObject:forKey:",  v5,  -[NSPersistentStore identifier](self->_store, "identifier"));
  v7 = objc_alloc_init(&OBJC_CLASS___PFCloudKitStoreComparisonCacheStoreCache);
  v8 = v7;
  if (v7) {
    v7->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  }
  -[NSMutableDictionary setObject:forKey:]( self->_storeUUIDToStoreCache,  "setObject:forKey:",  v7,  -[NSPersistentStore identifier](self->_otherStore, "identifier"));
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3052000000LL;
  v51 = __Block_byref_object_copy__13;
  v52 = __Block_byref_object_dispose__13;
  uint64_t v53 = 0LL;
  dispatch_group_enter(v4);
  storeMoc = self->_storeMoc;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  v47[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke;
  v47[3] = &unk_189EA8800;
  v47[4] = v6;
  v47[5] = self;
  v47[7] = &v48;
  v47[8] = &v54;
  v47[6] = v4;
  -[NSManagedObjectContext performBlock:](storeMoc, "performBlock:", v47);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3052000000LL;
  v44 = __Block_byref_object_copy__13;
  v45 = __Block_byref_object_dispose__13;
  uint64_t v46 = 0LL;
  dispatch_group_enter(v4);
  otherStoreMoc = self->_otherStoreMoc;
  v40[0] = v10;
  v40[1] = 3221225472LL;
  v40[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2;
  v40[3] = &unk_189EA8800;
  v40[4] = v8;
  v40[5] = self;
  v40[7] = &v41;
  v40[8] = &v54;
  v40[6] = v4;
  -[NSManagedObjectContext performBlock:](otherStoreMoc, "performBlock:", v40);
  dispatch_time_t v12 = dispatch_time(0LL, 180000000000LL);
  if (dispatch_group_wait(v4, v12))
  {
    *((_BYTE *)v55 + 24) = 0;
    v13 = (void *)MEMORY[0x189607870];
    uint64_t v64 = *MEMORY[0x1896075F0];
    v65[0] = @"Failed to intialize caches in a reasonable amount of time.";
    uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v65 forKeys:&v64 count:1];
    uint64_t v15 = (void *)[v13 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v14];
  }

  else
  {
    if (*((_BYTE *)v55 + 24)) {
      goto LABEL_22;
    }
    id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
    v17 = v16;
    if (v49[5]) {
      objc_msgSend(v16, "addObject:");
    }
    if (v42[5]) {
      objc_msgSend(v17, "addObject:");
    }
    if (![v17 count])
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Stores failed to initialize but did not return an error."];
      _NSCoreDataLog(17LL, v18, v19, v20, v21, v22, v23, v24, v38);
      v25 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Stores failed to initialize but did not return an error.",  buf,  2u);
      }
    }

    v26 = (void *)MEMORY[0x189607870];
    v62 = @"NSDetailedErrors";
    v63 = v17;
    uint64_t v27 = [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v15 = (void *)[v26 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v27];
  }

  if (!*((_BYTE *)v55 + 24))
  {
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
    }

    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m");
      v35 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m";
        __int16 v60 = 1024;
        int v61 = 163;
        _os_log_fault_impl( &dword_186681000,  v35,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke(uint64_t a1)
{
  if (!-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:]( *(void *)(a1 + 32),  *(void **)(*(void *)(a1 + 40) + 24LL),  *(void **)(*(void *)(a1 + 40) + 40LL),  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2(uint64_t a1)
{
  if (!-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:]( *(void *)(a1 + 32),  *(void **)(*(void *)(a1 + 40) + 32LL),  *(void **)(*(void *)(a1 + 40) + 48LL),  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)mirroredRelationshipForObject:(id)a3 relatedToObject:(id)a4 byRelationship:(id)a5
{
  uint64_t v7 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]( (uint64_t)PFCloudKitSerializer,  objc_msgSend( -[PFCloudKitStoreComparisonCache recordIDForObjectID:]( self,  "recordIDForObjectID:",  objc_msgSend(a3, "objectID")),  "recordName"),  objc_msgSend( -[PFCloudKitStoreComparisonCache recordIDForObjectID:]( self,  "recordIDForObjectID:",  objc_msgSend(a4, "objectID")),  "recordName"),  (uint64_t)a5,  objc_msgSend(a5, "inverseRelationship"));
  v8 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore"), "identifier"));
  if (v8) {
    v8 = (void *)v8[3];
  }
  return (id)[v8 objectForKey:v7];
}

- (id)mtmKeysForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 32);
  }
  else {
    v4 = 0LL;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)recordIDsRelatedToRecordID:(id)a3 byRelationshipNamed:(id)a4 inStore:(id)a5
{
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a5 identifier]);
  if (v7) {
    uint64_t v7 = (void *)v7[6];
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", a3), "objectForKey:", a4);
  if (!result) {
    return (id)NSSet_EmptySet;
  }
  return result;
}

- (id)metadataForObjectWithID:(id)a3
{
  v4 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4) {
    v4 = (void *)v4[8];
  }
  return (id)[v4 objectForKey:a3];
}

- (id)recordIdsForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 72);
  }
  else {
    v4 = 0LL;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)objectIDForRecordID:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[10];
  }
  return (id)[v5 objectForKey:a3];
}

- (id)recordIDForObjectID:(id)a3
{
  v4 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4) {
    v4 = (void *)v4[11];
  }
  return (id)[v4 objectForKey:a3];
}

- (id)identityRecordNameForStoreWithIdentifier:(id)a3
{
  id result = (id)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", a3);
  if (result) {
    return (id)*((void *)result + 16);
  }
  return result;
}

- (int64_t)databaseScopeForStoreWithIdentifier:(id)a3
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", a3);
  if (v3) {
    uint64_t v3 = (void *)v3[17];
  }
  return [v3 unsignedIntegerValue];
}

- (id)sharedZoneIDsForStore:(id)a3
{
  id result = (id)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a3 identifier]);
  if (result) {
    return (id)*((void *)result + 13);
  }
  return result;
}

- (id)mtmKeysForRecordZone:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[5];
  }
  id result = (id)[v5 objectForKey:a3];
  if (!result) {
    return (id)NSSet_EmptySet;
  }
  return result;
}

- (id)objectIDForIdentifier:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[2];
  }
  return (id)[v5 objectForKey:a3];
}

- (id)identifiersForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0LL;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)metadataForRecordID:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:]( self->_storeUUIDToStoreCache,  "objectForKey:",  [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[7];
  }
  return (id)[v5 objectForKeyedSubscript:a3];
}

- (id)deriveIdentifierForNonCloudObjectID:(id)a3
{
  uint64_t v3 = (void *)[a3 URIRepresentation];
  return (id)[NSString stringWithFormat:@"%@/%@", objc_msgSend((id)objc_msgSend(v3, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v3, "lastPathComponent")];
}

- (void)_setCheckCloudKitMetadata:(BOOL)a3
{
  self->_checkCloudKitMetadata = a3;
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (NSPersistentStore)otherStore
{
  return self->_otherStore;
}

- (NSManagedObjectContext)storeMoc
{
  return self->_storeMoc;
}

- (NSManagedObjectContext)otherStoreMoc
{
  return self->_otherStoreMoc;
}

- (BOOL)checkCloudKitMetadata
{
  return self->_checkCloudKitMetadata;
}

@end