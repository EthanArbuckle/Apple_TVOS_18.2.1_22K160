@interface PFCloudKitImportZoneContext
- (BOOL)linkInsertedObjectsAndMetadataInContext:(uint64_t *)a3 error:;
- (BOOL)populateUnresolvedIDsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:;
- (PFCloudKitImportZoneContext)initWithUpdatedRecords:(id)a3 deletedRecordTypeToRecordIDs:(id)a4 options:(id)a5 fileBackedFuturesDirectory:(id)a6;
- (uint64_t)addMirroredRelationshipToLink:(uint64_t)result;
- (uint64_t)addObjectID:(void *)a3 toCache:(uint64_t)a4 andRecordID:;
- (uint64_t)initializeCachesWithManagedObjectContext:(void *)a3 andObservedStore:(id *)a4 error:;
- (void)addObjectID:(void *)a3 toCache:(uint64_t)a4 forRecordWithType:(uint64_t)a5 andUniqueIdentifier:;
- (void)addUnresolvedRecordID:(uint64_t)a1 forRecordType:(uint64_t)a2 toCache:(void *)a3;
- (void)dealloc;
- (void)registerObject:(void *)a3 forInsertedRecord:(void *)a4 withMetadata:;
@end

@implementation PFCloudKitImportZoneContext

- (PFCloudKitImportZoneContext)initWithUpdatedRecords:(id)a3 deletedRecordTypeToRecordIDs:(id)a4 options:(id)a5 fileBackedFuturesDirectory:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PFCloudKitImportZoneContext;
  v10 = -[PFCloudKitImportZoneContext init](&v12, sel_init);
  if (v10)
  {
    v10->_updatedRecords = (NSArray *)a3;
    v10->_deletedRecordTypeToRecordID = (NSDictionary *)a4;
    v10->_recordTypeToUnresolvedRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v10->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a5;
    if (a6 && [a6 length]) {
      v10->_fileBackedFuturesDirectory = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a6];
    }
    v10->_metadatasToLink = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }

  return v10;
}

- (void)dealloc
{
  self->_updatedRecords = 0LL;
  self->_deletedRecordTypeToRecordID = 0LL;

  self->_deletedObjectIDs = 0LL;
  self->_deletedMirroredRelationshipRecordIDs = 0LL;

  self->_modifiedRecords = 0LL;
  self->_updatedRelationships = 0LL;

  self->_deletedRelationships = 0LL;
  self->_recordTypeToRecordIDToObjectID = 0LL;

  self->_recordTypeToUnresolvedRecordIDs = 0LL;
  self->_importOperations = 0LL;

  self->_mirroringOptions = 0LL;
  self->_fileBackedFuturesDirectory = 0LL;

  self->_metadatasToLink = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitImportZoneContext;
  -[PFCloudKitImportZoneContext dealloc](&v3, sel_dealloc);
}

- (uint64_t)initializeCachesWithManagedObjectContext:(void *)a3 andObservedStore:(id *)a4 error:
{
  uint64_t v301 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v287 = 0LL;
  id v220 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v246 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v243 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v219 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v218 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v232 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v233 = objc_alloc_init(MEMORY[0x189603FC8]);
  v239 = a2;
  id v244 = (id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  id v247 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v234 = a3;
  if ([a3 configurationName]) {
    v6 = (void *)objc_msgSend(v244, "entitiesForConfiguration:", objc_msgSend(a3, "configurationName"));
  }
  else {
    v6 = (void *)objc_msgSend((id)objc_msgSend(v244, "entitiesByName"), "allValues");
  }
  v7 = v6;
  __int128 v285 = 0u;
  __int128 v286 = 0u;
  __int128 v283 = 0u;
  __int128 v284 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v283 objects:v300 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v284;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v284 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v247, "addObject:", objc_msgSend(*(id *)(*((void *)&v283 + 1) + 8 * i), "name"));
      }

      uint64_t v8 = [v7 countByEnumeratingWithState:&v283 objects:v300 count:16];
    }

    while (v8);
  }

  __int128 v281 = 0u;
  __int128 v282 = 0u;
  __int128 v279 = 0u;
  __int128 v280 = 0u;
  obuint64_t j = *(id *)(a1 + 8);
  uint64_t v11 = [obj countByEnumeratingWithState:&v279 objects:v299 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v280;
    do
    {
      for (uint64_t j = 0LL; j != v11; ++j)
      {
        if (*(void *)v280 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v279 + 1) + 8 * j);
        v15 = (void *)MEMORY[0x186E3E5D8]();
        v16 = (void *)[v14 recordType];
        v17 = (void *)[v14 recordType];
        if (([v16 hasPrefix:@"CD_M2M_"] & 1) != 0
          || [v16 isEqualToString:@"CDMR"])
        {
          v18 = (void *)MEMORY[0x186E3E5D8]();
          unint64_t v19 = __ckLoggingOverride;
          uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Updating relationship described by record: %@"];
          if (v19 >= 9) {
            uint64_t v27 = 9LL;
          }
          else {
            uint64_t v27 = v19;
          }
          _NSCoreDataLog( v27,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          objc_autoreleasePoolPop(v18);
          uint64_t v28 = (uint64_t)v14;
          if (!+[PFMirroredRelationship isValidMirroredRelationshipRecord:values:]( &OBJC_CLASS___PFMirroredRelationship,  "isValidMirroredRelationshipRecord:values:",  v14,  v28))
          {
            v32 = (void *)MEMORY[0x186E3E5D8]();
            unint64_t v33 = __ckLoggingOverride;
            uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Skipping invalid mirrored relationship record: %@"];
            if (v33 >= 3) {
              uint64_t v41 = 3LL;
            }
            else {
              uint64_t v41 = v33;
            }
LABEL_47:
            _NSCoreDataLog( v41,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
            objc_autoreleasePoolPop(v32);
            goto LABEL_48;
          }

          v29 = +[PFMirroredRelationship mirroredRelationshipWithManyToManyRecord:values:andManagedObjectModel:]( (uint64_t)&OBJC_CLASS___PFMirroredRelationship,  v14,  v28,  (uint64_t)v244);
          v30 = v29;
          if (v29)
          {
            if (v29->super._relationshipDescription && v29->super._inverseRelationshipDescription)
            {
              [v219 addObject:v29];
              v31 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](v30);
              v278[0] = MEMORY[0x1895F87A8];
              v278[1] = 3221225472LL;
              v278[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke;
              v278[3] = &unk_189EA78E8;
              v278[4] = v247;
              v278[5] = v246;
              v278[6] = a1;
              v278[7] = v14;
              [v31 enumerateKeysAndObjectsUsingBlock:v278];
              goto LABEL_48;
            }

            v43 = (void *)MEMORY[0x186E3E5D8]();
            unint64_t v44 = __ckLoggingOverride;
            uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping mirrored relationship for unknown relationships: %@"];
            if (v44 >= 0x10) {
              uint64_t v52 = 16LL;
            }
            else {
              uint64_t v52 = v44;
            }
            _NSCoreDataLog( v52,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }

          else
          {
            v43 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v53 = __ckLoggingOverride;
            uint64_t v54 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to serialize many to many relationship from record: %@"];
            _NSCoreDataLog( v53 != 0,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }

          objc_autoreleasePoolPop(v43);
        }

        else
        {
          if (![v247 containsObject:v17])
          {
            v32 = (void *)MEMORY[0x186E3E5D8]();
            unint64_t v61 = __ckLoggingOverride;
            uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown updated record: %@\nIt is not a part of: %@"];
            if (v61 >= 3) {
              uint64_t v41 = 3LL;
            }
            else {
              uint64_t v41 = v61;
            }
            goto LABEL_47;
          }

          id v42 = (id)[v246 objectForKey:v16];
          if (!v42)
          {
            id v42 = objc_alloc_init(MEMORY[0x189603FA8]);
            [v246 setObject:v42 forKey:v16];
          }

          [v220 addObject:v14];
          objc_msgSend(v42, "addObject:", objc_msgSend(v14, "recordID"));
        }

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v6 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v6)
    {
      id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 40) setObject:v16 forKey:a2];
      id v6 = v16;
    }

    id v17 = v6;
    [v6 addObjectsFromArray:a3];
  }

  else
  {
    v7 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown updated relationship record: %@"];
    _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v6 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v6)
    {
      id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 40) setObject:v16 forKey:a2];
      id v6 = v16;
    }

    id v17 = v6;
    [v6 addObjectsFromArray:a3];
  }

  else
  {
    v7 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown deleted relationship recordID: %@ - %@"];
    _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke_2");
    objc_autoreleasePoolPop(v7);
  }

- (uint64_t)addObjectID:(void *)a3 toCache:(uint64_t)a4 andRecordID:
{
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = (void *)[a2 entity];
    uint64_t v9 = [v8 name];
    do
    {
      -[PFCloudKitImportZoneContext addObjectID:toCache:forRecordWithType:andUniqueIdentifier:]( v7,  (uint64_t)a2,  a3,  v9,  a4);
      uint64_t v8 = (void *)[v8 superentity];
      result = [v8 name];
      uint64_t v9 = result;
    }

    while (result);
  }

  return result;
}

- (void)addUnresolvedRecordID:(uint64_t)a1 forRecordType:(uint64_t)a2 toCache:(void *)a3
{
  id v6 = (id)[a3 objectForKey:a2];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    [a3 setObject:v7 forKey:a2];
    id v6 = v7;
  }

  id v8 = v6;
  [v6 addObject:a1];
}

uint64_t __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_46( uint64_t a1,  void *a2,  void *a3)
{
  v4 = a2;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", v4),  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * v9));
        if (v10) {
          [*(id *)(a1 + 40) addObject:v10];
        }
        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (void)registerObject:(void *)a3 forInsertedRecord:(void *)a4 withMetadata:
{
  if (a1)
  {
    -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:]( a1,  (void *)[a2 objectID],  *(void **)(a1 + 64),  objc_msgSend(a3, "recordID"));
    uint64_t v7 = objc_alloc(&OBJC_CLASS____PFCKInsertedMetadataLink);
    if (v7
      && (v18.receiver = v7,
          v18.super_class = (Class)&OBJC_CLASS____PFCKInsertedMetadataLink,
          (id v17 = objc_msgSendSuper2(&v18, sel_init)) != 0))
    {
      v17[2] = a2;
      v17[1] = a4;
    }

    else
    {
      id v17 = 0LL;
    }

    uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v9 = __ckLoggingOverride;
    }
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Linking %@ to %@"];
    [a2 objectID];
    _NSCoreDataLog( v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:]");
    objc_autoreleasePoolPop(v8);
    [*(id *)(a1 + 80) addObject:v17];
  }

- (uint64_t)addMirroredRelationshipToLink:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 40) addObject:a2];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = -[PFMirroredOneToManyRelationship recordTypesToRecordIDs](a2);
      uint64_t v11 = MEMORY[0x1895F87A8];
      uint64_t v12 = 3221225472LL;
      uint64_t v13 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke;
      uint64_t v14 = &unk_189EA7938;
      uint64_t v15 = v3;
      v5 = &v11;
    }

    else
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if ((result & 1) == 0) {
        return result;
      }
      v4 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](a2);
      uint64_t v6 = MEMORY[0x1895F87A8];
      uint64_t v7 = 3221225472LL;
      uint64_t v8 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2;
      uint64_t v9 = &unk_189EA7938;
      uint64_t v10 = v3;
      v5 = &v6;
    }

    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  }

  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", a2),  "objectForKey:",  v10))
        {
          id v11 = (id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:a2];
          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
            [*(id *)(*(void *)(a1 + 32) + 72) setObject:v11 forKey:a2];
          }

          [v11 addObject:v10];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", a2),  "objectForKey:",  v10))
        {
          id v11 = (id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:a2];
          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
            [*(id *)(*(void *)(a1 + 32) + 72) setObject:v11 forKey:a2];
          }

          [v11 addObject:v10];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (BOOL)populateUnresolvedIDsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 1;
  uint64_t v17 = 0LL;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  uint64_t v20 = __Block_byref_object_copy__4;
  uint64_t v21 = __Block_byref_object_dispose__4;
  uint64_t v22 = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke;
  v16[3] = &unk_189EA7960;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = &v17;
  v16[8] = &v23;
  [a3 performBlockAndWait:v16];
  if (!*((_BYTE *)v24 + 24))
  {
    id v7 = (id)v18[5];
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
    }

    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      __int128 v15 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v29 = 1024;
        int v30 = 590;
        _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v18[5] = 0LL;
  BOOL v5 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v5;
}

void __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke( uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Populating unresolved relationships:\n%@"];
  _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  uint64_t v11 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithArray:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allKeys"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v12)
  {
    uint64_t v29 = *(void *)v35;
LABEL_6:
    uint64_t v13 = 0LL;
    uint64_t v28 = v12;
    while (1)
    {
      if (*(void *)v35 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * v13);
      __int128 v15 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v16 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v14];
      uint64_t v17 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  MEMORY[0x189604A58],  v16,  *(void **)(a1 + 40),  *(void **)(a1 + 48),  (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
      if (v17)
      {
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v22 = (void *)[v17 objectForKey:v21];
              uint64_t v23 = v22;
              if (v22 && ([v22 isInserted] & 1) == 0)
              {
                uint64_t v24 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v23);
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:]( *(void *)(a1 + 32),  v24,  *(void **)(*(void *)(a1 + 32) + 64LL),  v21);
              }
            }

            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }

          while (v18);
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
        id v25 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      }

      int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      objc_autoreleasePoolPop(v15);
      if (!v26) {
        break;
      }
      if (++v13 == v28)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (void)addObjectID:(void *)a3 toCache:(uint64_t)a4 forRecordWithType:(uint64_t)a5 andUniqueIdentifier:
{
  if (a1)
  {
    id v9 = (id)[a3 objectForKey:a4];
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
      [a3 setObject:v10 forKey:a4];
      id v9 = v10;
    }

    id v11 = v9;
    [v9 setObject:a2 forKey:a5];
  }

- (BOOL)linkInsertedObjectsAndMetadataInContext:(uint64_t *)a3 error:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v49 = 0LL;
    if (!objc_msgSend( a2,  "obtainPermanentIDsForObjects:error:",  objc_msgSend((id)objc_msgSend(a2, "insertedObjects"), "allObjects"),  &v49)) {
      goto LABEL_31;
    }
    uint64_t v41 = a3;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    obuint64_t j = *(id *)(v5 + 80);
    uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v46;
      uint64_t v43 = *MEMORY[0x189607460];
      uint64_t v42 = *MEMORY[0x1896075F0];
      char v9 = 1;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = *(void **)(v11 + 16);
          }
          else {
            uint64_t v12 = 0LL;
          }
          uint64_t v13 = (char *)[v12 objectID];
          if ([v13 isTemporaryID])
          {
            uint64_t v14 = [NSString stringWithUTF8String:"Found temporary objectID for metadata link: %@\n%@\n%@\n%@"];
            [a2 insertedObjects];
            uint64_t v40 = v49;
            _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
            uint64_t v21 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v30 = [a2 insertedObjects];
              *(_DWORD *)buf = 138413058;
              uint64_t v53 = v13;
              __int16 v54 = 2112;
              uint64_t v55 = v11;
              __int16 v56 = 2112;
              uint64_t v57 = v30;
              __int16 v58 = 2112;
              uint64_t v59 = v49;
              _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Found temporary objectID for metadata link: %@\n%@\n%@\n%@",  buf,  0x2Au);
            }

            uint64_t v22 = (void *)MEMORY[0x189607870];
            uint64_t v50 = v42;
            uint64_t v51 = [NSString stringWithFormat:@"Found temporary objectID for metadata link: %@\n%@\n%@", v13, v11, objc_msgSend(a2, "insertedObjects"), v40];
            char v9 = 0;
            uint64_t v49 = objc_msgSend( v22,  "errorWithDomain:code:userInfo:",  v43,  134410,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
          }

          else
          {
            uint64_t v23 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
            if (v11) {
              uint64_t v24 = *(void **)(v11 + 8);
            }
            else {
              uint64_t v24 = 0LL;
            }
            [v24 setEntityPK:v23];
            uint64_t v25 = _sqlEntityForEntityDescription( objc_msgSend((id)objc_msgSend(v13, "persistentStore"), "model"),  (void *)objc_msgSend(v13, "entity"));
            if (v25) {
              uint64_t v26 = *(unsigned int *)(v25 + 184);
            }
            else {
              uint64_t v26 = 0LL;
            }
            uint64_t v27 = [MEMORY[0x189607968] numberWithUnsignedInt:v26];
            if (v11)
            {
              [*(id *)(v11 + 8) setEntityId:v27];
              uint64_t v28 = *(void **)(v11 + 8);
            }

            else
            {
              [0 setEntityId:v27];
              uint64_t v28 = 0LL;
            }

            uint64_t v29 = (void *)-[NSCKRecordMetadata createRecordID](v28);
            -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v5, v13, *(void **)(v5 + 64), (uint64_t)v29);
          }

          ++v10;
        }

        while (v7 != v10);
        uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
        uint64_t v7 = v31;
      }

      while (v31);
    }

    else
    {
      char v9 = 1;
    }

    *(void *)(v5 + 80) = 0LL;
    a3 = v41;
    if ((v9 & 1) != 0)
    {
      return 1LL;
    }

    else
    {
LABEL_31:
      if (v49)
      {
        if (a3)
        {
          uint64_t result = 0LL;
          *a3 = v49;
          return result;
        }
      }

      else
      {
        uint64_t v32 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
        uint64_t v39 = (os_log_s *)__pflogFaultLog;
        uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v54 = 1024;
        LODWORD(v55) = 674;
        _os_log_fault_impl( &dword_186681000,  v39,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }

      return 0LL;
    }
  }

  return result;
}

@end