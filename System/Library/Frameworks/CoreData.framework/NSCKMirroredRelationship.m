@interface NSCKMirroredRelationship
+ (BOOL)updateMirroredRelationshipsMatchingRecords:(uint64_t)a3 forStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 usingBlock:(void *)a6 error:;
+ (NSManagedObject)insertMirroredRelationshipForManyToMany:(uint64_t)a3 inZoneWithMetadata:(uint64_t)a4 inStore:(void *)a5 withManagedObjectContext:;
+ (NSString)entityPath;
+ (id)fetchMirroredRelationshipsMatchingRelatingRecords:(void *)a3 andRelatingRecordIDs:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(void *)a6 error:;
+ (id)markRelationshipsForDeletedRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:;
+ (uint64_t)countMirroredRelationshipsInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:;
+ (uint64_t)fetchMirroredRelationshipsMatchingPredicate:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
+ (uint64_t)fetchPendingMirroredRelationshipsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:;
+ (uint64_t)purgeMirroredRelationshipsWithRecordIDs:(uint64_t)a3 fromStore:(void *)a4 withManagedObjectContext:(void *)a5 error:;
+ (void)mirroredRelationshipForManyToMany:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 error:;
- (BOOL)updateRelationshipValueUsingImportContext:(void *)a3 andManagedObjectContext:(int)a4 isDelete:(uint64_t *)a5 error:;
- (void)createRecordID;
- (void)createRecordIDForRecord;
- (void)createRecordIDForRelatedRecord;
@end

@implementation NSCKMirroredRelationship

- (void)createRecordID
{
  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[a1 recordZone]);
    if (v2) {
      v1 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v1, "ckRecordID"),  v2);
    }
    else {
      v1 = 0LL;
    }
  }

  return v1;
}

- (void)createRecordIDForRecord
{
  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[a1 recordZone]);
    if (v2) {
      v1 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v1, "recordName"),  v2);
    }
    else {
      v1 = 0LL;
    }
  }

  return v1;
}

- (void)createRecordIDForRelatedRecord
{
  v1 = a1;
  if (a1)
  {
    v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[a1 recordZone]);
    if (v2) {
      v1 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v1, "relatedRecordName"),  v2);
    }
    else {
      v1 = 0LL;
    }
  }

  return v1;
}

- (BOOL)updateRelationshipValueUsingImportContext:(void *)a3 andManagedObjectContext:(int)a4 isDelete:(uint64_t *)a5 error:
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v9 = (void *)result;
  id v10 = (id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  v11 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v10, "entitiesByName"),  "objectForKey:",  objc_msgSend(v9, "cdEntityName")),  "propertiesByName"),  "objectForKey:",  objc_msgSend(v9, "relationshipName"));
  v12 = -[NSCKMirroredRelationship createRecordIDForRecord](v9);
  v13 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v9);
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "entity"), "name");
  if (a2) {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 64), "objectForKey:", v14), "objectForKey:", v12);
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "inverseRelationship"), "entity"), "name");
  if (a2)
  {
    uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 64), "objectForKey:", v16), "objectForKey:", v13);
    if (v15)
    {
      uint64_t v18 = v17;
      if (v17)
      {
        v19 = (void *)[a3 objectWithID:v15];
        uint64_t v20 = [a3 objectWithID:v18];
        id v21 = (id)objc_msgSend((id)objc_msgSend(v19, "valueForKey:", objc_msgSend(v11, "name")), "mutableCopy");
        if (!v21) {
          id v21 = objc_alloc_init(MEMORY[0x189603FE0]);
        }
        if (a4) {
          [v21 removeObject:v20];
        }
        else {
          [v21 addObject:v20];
        }
        objc_msgSend(v19, "setValue:forKey:", v21, objc_msgSend(v11, "name"));

        uint64_t v22 = 0LL;
        char v23 = 1;
        goto LABEL_18;
      }

      goto LABEL_15;
    }

+ (id)fetchMirroredRelationshipsMatchingRelatingRecords:(void *)a3 andRelatingRecordIDs:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(void *)a6 error:
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v55 = 0LL;
  id v42 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }

        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));
      }

      uint64_t v9 = [a3 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v9);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v14 = [a2 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v48;
    do
    {
      for (uint64_t j = 0LL; j != v14; ++j)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(a2);
        }
        uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        id v18 = (id)objc_msgSend( v8,  "objectForKey:",  objc_msgSend((id)objc_msgSend(v17, "recordID"), "zoneID"));
        if (!v18)
        {
          id v18 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v8, "setObject:forKey:", v18, objc_msgSend((id)objc_msgSend(v17, "recordID"), "zoneID"));
        }

        objc_msgSend(v18, "addObject:", objc_msgSend((id)objc_msgSend(v17, "recordID"), "recordName"));
      }

      uint64_t v14 = [a2 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }

    while (v14);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v19 = [v8 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v44;
LABEL_21:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v8);
      }
      uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
      char v23 = (void *)MEMORY[0x186E3E5D8]();
      v24 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
      uint64_t v25 = [v8 objectForKey:v22];
      -[NSFetchRequest setPredicate:]( v24,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"(ckRecordID IN %@ OR recordName IN %@ OR relatedRecordName IN %@) AND recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@", v25, v25, v25, objc_msgSend(v22, "zoneName"), objc_msgSend(v22, "ownerName")]);
      uint64_t v60 = a4;
      -[NSFetchRequest setAffectedStores:]( v24,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v60 count:1]);
      -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v24,  "setRelationshipKeyPathsForPrefetching:",  &unk_189F0B370);
      -[NSFetchRequest setReturnsObjectsAsFaults:](v24, "setReturnsObjectsAsFaults:", 0LL);
      uint64_t v26 = [a5 executeFetchRequest:v24 error:&v55];
      if (v26)
      {
        [v42 addObjectsFromArray:v26];
      }

      else
      {
        id v27 = v55;

        id v42 = 0LL;
      }

      objc_autoreleasePoolPop(v23);
      if (!v26) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v8 countByEnumeratingWithState:&v43 objects:v61 count:16];
        if (v19) {
          goto LABEL_21;
        }
        break;
      }
    }
  }

  if (!v42)
  {
    id v28 = v55;
    if (v28)
    {
      if (a6)
      {
        id v42 = 0LL;
        *a6 = v28;
        goto LABEL_37;
      }
    }

    else
    {
      uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      v36 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        __int16 v58 = 1024;
        int v59 = 172;
        _os_log_fault_impl( &dword_186681000,  v36,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v42 = 0LL;
  }

+ (uint64_t)fetchPendingMirroredRelationshipsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:
{
  v23[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v18 = 0LL;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  v23[0] = a2;
  -[NSFetchRequest setAffectedStores:]( v7,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v23 count:1]);
  -[NSFetchRequest setPredicate:]( v7,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"isPending == 1"]);
  uint64_t v8 = [a3 executeFetchRequest:v7 error:&v18];
  if (!v8)
  {
    if (v18)
    {
      if (a4) {
        *a4 = v18;
      }
    }

    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      uint64_t v17 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        __int16 v21 = 1024;
        int v22 = 193;
        _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v8;
}

+ (void)mirroredRelationshipForManyToMany:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 error:
{
  v25[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  v25[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v25 count:1]);
  if (a2) {
    uint64_t v10 = *(void **)(a2 + 32);
  }
  else {
    uint64_t v10 = 0LL;
  }
  -[NSFetchRequest setPredicate:]( v9,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordID = %@", objc_msgSend(v10, "recordName")]);
  result = (void *)[a4 executeFetchRequest:v9 error:a5];
  if (result)
  {
    uint64_t v12 = result;
    if ((unint64_t)[result count] >= 2)
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Found more than one mirrored relationship matching a many to many: %@\n%@"];
      _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, a2);
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = a2;
        __int16 v23 = 2112;
        v24 = v12;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Found more than one mirrored relationship matching a many to many: %@\n%@",  buf,  0x16u);
      }
    }

    return (void *)[v12 lastObject];
  }

  return result;
}

+ (NSManagedObject)insertMirroredRelationshipForManyToMany:(uint64_t)a3 inZoneWithMetadata:(uint64_t)a4 inStore:(void *)a5 withManagedObjectContext:
{
  uint64_t v9 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"),  a5);
  [a5 assignObject:v9 toPersistentStore:a4];
  if (a2)
  {
    -[NSManagedObject setCkRecordID:](v9, "setCkRecordID:", [*(id *)(a2 + 32) recordName]);
    uint64_t v10 = *(void **)(a2 + 16);
  }

  else
  {
    -[NSManagedObject setCkRecordID:](v9, "setCkRecordID:", [0 recordName]);
    uint64_t v10 = 0LL;
  }

  -[NSManagedObject setCdEntityName:](v9, "setCdEntityName:", objc_msgSend((id)objc_msgSend(v10, "entity"), "name"));
  if (a2)
  {
    -[NSManagedObject setRecordName:](v9, "setRecordName:", [*(id *)(a2 + 48) recordName]);
    uint64_t v11 = *(void **)(a2 + 24);
  }

  else
  {
    -[NSManagedObject setRecordName:](v9, "setRecordName:", [0 recordName]);
    uint64_t v11 = 0LL;
  }

  -[NSManagedObject setRelatedEntityName:]( v9,  "setRelatedEntityName:",  objc_msgSend((id)objc_msgSend(v11, "entity"), "name"));
  if (a2)
  {
    -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", [*(id *)(a2 + 56) recordName]);
    uint64_t v12 = *(void **)(a2 + 16);
  }

  else
  {
    -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", [0 recordName]);
    uint64_t v12 = 0LL;
  }

  -[NSManagedObject setRelationshipName:](v9, "setRelationshipName:", [v12 name]);
  uint64_t v13 = MEMORY[0x189604A80];
  -[NSManagedObject setIsPending:](v9, "setIsPending:", MEMORY[0x189604A80]);
  -[NSManagedObject setIsUploaded:](v9, "setIsUploaded:", v13);
  -[NSManagedObject setNeedsDelete:](v9, "setNeedsDelete:", v13);
  -[NSManagedObject setRecordZone:](v9, "setRecordZone:", a3);
  return v9;
}

+ (uint64_t)purgeMirroredRelationshipsWithRecordIDs:(uint64_t)a3 fromStore:(void *)a4 withManagedObjectContext:(void *)a5 error:
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v57 = 0LL;
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v54;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }

        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));
      }

      uint64_t v9 = [a2 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }

    while (v9);
  }

  uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  uint64_t v65 = a3;
  -[NSFetchRequest setAffectedStores:]( v14,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v65 count:1]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v15 = [v8 countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v50;
LABEL_12:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v16) {
        objc_enumerationMutation(v8);
      }
      uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
      uint64_t v19 = [v8 objectForKey:v18];
      -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND (ckRecordID IN %@))", objc_msgSend(v18, "zoneName"), objc_msgSend(v18, "ownerName"), v19]);
      uint64_t v20 = (void *)[a4 executeFetchRequest:v14 error:&v57];
      __int16 v21 = v20;
      if (!v20) {
        goto LABEL_34;
      }
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v63 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v46;
        do
        {
          for (uint64_t j = 0LL; j != v22; ++j)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(v21);
            }
            [a4 deleteObject:*(void *)(*((void *)&v45 + 1) + 8 * j)];
          }

          uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v63 count:16];
        }

        while (v22);
      }

      if (++v17 == v15)
      {
        uint64_t v15 = [v8 countByEnumeratingWithState:&v49 objects:v64 count:16];
        if (v15) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"(needsDelete = 1 AND isUploaded = 1)"]);
  uint64_t v25 = (void *)[a4 executeFetchRequest:v14 error:&v57];
  uint64_t v26 = v25;
  if (!v25)
  {
LABEL_34:
    uint64_t v30 = 0LL;
    goto LABEL_35;
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t k = 0LL; k != v27; ++k)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v26);
        }
        [a4 deleteObject:*(void *)(*((void *)&v41 + 1) + 8 * k)];
      }

      uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v62 count:16];
    }

    while (v27);
  }

  uint64_t v30 = 1LL;
LABEL_35:

  if ((v30 & 1) == 0)
  {
    if (v57)
    {
      if (a5) {
        *a5 = v57;
      }
    }

    else
    {
      uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      int v38 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        __int16 v60 = 1024;
        int v61 = 332;
        _os_log_fault_impl( &dword_186681000,  v38,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v30;
}

+ (id)markRelationshipsForDeletedRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v57 = 0LL;
  if (![a2 count]) {
    return (id)NSSet_EmptySet;
  }
  uint64_t v39 = a5;
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v54;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(a2);
        }
        id v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v14 = (id)objc_msgSend(v9, "objectForKey:", objc_msgSend(v13, "zoneID"));
        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v9, "setObject:forKey:", v14, objc_msgSend(v13, "zoneID"));
        }

        objc_msgSend(v14, "addObject:", objc_msgSend(v13, "recordName"));
      }

      uint64_t v10 = [a2 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }

    while (v10);
  }

  uint64_t v15 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  uint64_t v64 = a3;
  -[NSFetchRequest setAffectedStores:]( v15,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v64 count:1]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v16 = [v9 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v16)
  {
    uint64_t v42 = *(void *)v50;
    uint64_t v17 = MEMORY[0x189604A88];
    uint64_t v18 = MEMORY[0x189604A80];
    v40 = v15;
LABEL_13:
    uint64_t v19 = 0LL;
    uint64_t v41 = v16;
    while (1)
    {
      if (*(void *)v50 != v42) {
        objc_enumerationMutation(v9);
      }
      uint64_t v44 = v19;
      uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * v19);
      uint64_t v21 = [v9 objectForKey:v20];
      -[NSFetchRequest setPredicate:]( v15,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND ((recordName IN %@) OR (relatedRecordName IN %@))) OR needsDelete = 1", objc_msgSend(v20, "zoneName"), objc_msgSend(v20, "ownerName"), v21, v21]);
      uint64_t v22 = (void *)[a4 executeFetchRequest:v15 error:&v57];
      uint64_t v23 = v22;
      if (!v22) {
        break;
      }
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v62 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v46;
        do
        {
          for (uint64_t j = 0LL; j != v24; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            uint64_t v28 = -[NSCKMirroredRelationship createRecordID](v27);
            [v8 addObject:v28];

            [v27 setNeedsDelete:v17];
            [v27 setIsUploaded:v18];
          }

          uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v62 count:16];
        }

        while (v24);
      }

      uint64_t v19 = v44 + 1;
      uint64_t v15 = v40;
      if (v44 + 1 == v41)
      {
        uint64_t v16 = [v9 countByEnumeratingWithState:&v49 objects:v63 count:16];
        if (v16) {
          goto LABEL_13;
        }
        goto LABEL_26;
      }
    }

    if (v57)
    {
      if (v39)
      {
        id v29 = 0LL;
        *uint64_t v39 = v57;
        goto LABEL_34;
      }
    }

    else
    {
      uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      int v38 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v59 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
        __int16 v60 = 1024;
        int v61 = 386;
        _os_log_fault_impl( &dword_186681000,  v38,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v29 = 0LL;
  }

  else
  {
LABEL_26:
    id v29 = (id)[v8 copy];
  }

+ (BOOL)updateMirroredRelationshipsMatchingRecords:(uint64_t)a3 forStore:(void *)a4 withManagedObjectContext:(uint64_t)a5 usingBlock:(void *)a6 error:
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v62 = 0LL;
  obuint64_t j = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  a2,  MEMORY[0x189604A58],  a3,  a4,  &v62);
  if (obj)
  {
    __int128 v46 = a6;
    uint64_t v47 = a5;
    id v11 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v48 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v12 = [a2 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v59;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(a2);
          }
          uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v16, "recordType"), "isEqualToString:", @"CDMR"))
          {
            objc_msgSend(v48, "setObject:forKey:", v16, objc_msgSend(v16, "recordID"));
            objc_msgSend(v11, "addObject:", objc_msgSend(v16, "recordID"));
          }

          else
          {
            uint64_t v17 = [NSString stringWithUTF8String:"Attempted to update a mirrored relationship with a non-mirrored-relationship record: %@"];
            _NSCoreDataLog(17LL, v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
            uint64_t v24 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v64 = (const char *)v16;
              _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Attempted to update a mirrored relationship with a non-mirrored-relationship record: %@",  buf,  0xCu);
            }
          }
        }

        uint64_t v13 = [a2 countByEnumeratingWithState:&v58 objects:v69 count:16];
      }

      while (v13);
    }

    id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    uint64_t v26 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v55;
      do
      {
        for (uint64_t j = 0LL; j != v27; ++j)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v31 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend((id)objc_msgSend(v30, "recordZone"), "ckRecordZoneName"),  objc_msgSend((id)objc_msgSend(v30, "recordZone"), "ckOwnerName"));
          uint64_t v32 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(v30, "ckRecordID"),  v31);
          [v25 setObject:v30 forKey:v32];
          [v11 addObject:v32];
        }

        uint64_t v27 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
      }

      while (v27);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    uint64_t v33 = [v11 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v51;
      while (2)
      {
        for (uint64_t k = 0LL; k != v34; ++k)
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v11);
          }
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v47 + 16))( v47,  [v25 objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * k)],  objc_msgSend(v48, "objectForKey:", *(void *)(*((void *)&v50 + 1) + 8 * k)),  &v62))
          {

            a6 = v46;
            goto LABEL_30;
          }
        }

        uint64_t v34 = [v11 countByEnumeratingWithState:&v50 objects:v67 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    return 1LL;
  }

  else
  {
LABEL_30:
    if (v62)
    {
      if (a6)
      {
        BOOL result = 0LL;
        *a6 = v62;
        return result;
      }
    }

    else
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v38,  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m");
      __int128 v45 = (os_log_s *)__pflogFaultLog;
      BOOL result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMirroredRelationship.m";
      __int16 v65 = 1024;
      int v66 = 456;
      _os_log_fault_impl( &dword_186681000,  v45,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    return 0LL;
  }

+ (uint64_t)fetchMirroredRelationshipsMatchingPredicate:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  v11[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  v11[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v11 count:1]);
  -[NSFetchRequest setFetchBatchSize:](v9, "setFetchBatchSize:", 1000LL);
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", a2);
  return [a4 executeFetchRequest:v9 error:a5];
}

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

+ (uint64_t)countMirroredRelationshipsInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:
{
  v13[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", a3);
  -[NSFetchRequest setResultType:](v9, "setResultType:", 4LL);
  v13[0] = a2;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1]);
  if (a4)
  {
    -[NSManagedObjectContext _countForFetchRequest_:error:](a4, v9, a5);
    uint64_t v11 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return [MEMORY[0x189607968] numberWithUnsignedInteger:v11];
}

@end