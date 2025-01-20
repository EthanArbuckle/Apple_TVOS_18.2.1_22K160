@interface NSCKRecordMetadata
+ (NSManagedObject)metadataForRecord:(void *)a3 inManagedObjectContext:(uint64_t)a4 fromStore:(void *)a5 error:;
+ (NSString)entityPath;
+ (id)batchUpdateMetadataMatchingEntityIdsAndPKs:(uint64_t)a3 withUpdates:(uint64_t)a4 inStore:(uint64_t)a5 withManagedObjectContext:(void *)a6 error:;
+ (id)createMapOfMetadataMatchingObjectIDs:(void *)a3 inStore:(void *)a4 inManagedObjectContext:(void *)a5 error:;
+ (id)encodeRecord:(id)a3 error:(id *)a4;
+ (id)insertMetadataForObject:(id)a3 setRecordName:(BOOL)a4 inZoneWithID:(id)a5 recordNamePrefix:(id)a6 error:(id *)a7;
+ (id)metadataForObjectIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:;
+ (id)metadataForRecordIDs:(void *)a3 fromStore:(void *)a4 inManagedObjectContext:(id *)a5 error:;
+ (id)recordFromEncodedData:(id)a3 error:(id *)a4;
+ (uint64_t)countRecordMetadataInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:;
+ (uint64_t)createMapOfMetadataMatchingRecords:(void *)a3 andRecordIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(id *)a6 error:;
+ (uint64_t)createObjectIDForEntityID:(void *)a3 primaryKey:(void *)a4 inSQLCore:;
+ (uint64_t)createObjectIDFromMetadataDictionary:(void *)a3 inSQLCore:;
+ (uint64_t)metadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:;
+ (uint64_t)purgeRecordMetadataWithRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(id *)a5 error:;
+ (void)enumerateRecordMetadataDictionariesMatchingObjectIDs:(void *)a3 withProperties:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 block:;
- (BOOL)mergeMoveReceiptsWithData:(id)a3 error:(id *)a4;
- (id)createEncodedMoveReceiptData:(id *)a3;
- (id)createRecordFromSystemFields;
- (uint64_t)createRecordID;
@end

@implementation NSCKRecordMetadata

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (uint64_t)createRecordID
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (![a1 recordZone]) {
    goto LABEL_8;
  }
  v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[a1 recordZone]);
  if (!v2 || ![a1 ckRecordName])
  {

    goto LABEL_8;
  }

  uint64_t v3 = objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  objc_msgSend(a1, "ckRecordName"),  v2);

  if (!v3)
  {
LABEL_8:
    uint64_t v4 = [NSString stringWithUTF8String:"createRecordID called before the record has the necessary properties: %@"];
    _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a1;
      _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: createRecordID called before the record has the necessary properties: %@",  buf,  0xCu);
    }

    return 0LL;
  }

  return v3;
}

- (id)createRecordFromSystemFields
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSCKRecordMetadata ckRecordSystemFields](self, "ckRecordSystemFields");
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v3 error:0];
    uint64_t v5 = (void *)[objc_alloc(getCloudKitCKRecordClass()) initWithCoder:v4];
    if (objc_msgSend( (id)-[NSCKRecordMetadata ckRecordName](self, "ckRecordName"),  "isEqualToString:",  objc_msgSend((id)objc_msgSend(v5, "recordID"), "recordName")))
    {
      if (objc_msgSend((id)objc_msgSend(v5, "recordType"), "hasPrefix:", @"CD_")) {
        goto LABEL_10;
      }
      uint64_t v16 = [NSString stringWithUTF8String:"NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@"];
      uint64_t v17 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      [v5 recordID];
      _NSCoreDataLog(17LL, v16, v18, v19, v20, v21, v22, v23, v17);
      v14 = (os_log_s *)__pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_9:

        uint64_t v5 = 0LL;
LABEL_10:
        [v4 finishDecoding];

        return v5;
      }

      *(_DWORD *)buf = 138412802;
      uint64_t v26 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      __int16 v27 = 2112;
      uint64_t v28 = [v5 recordID];
      __int16 v29 = 2112;
      v30 = self;
      uint64_t v15 = "CoreData: NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@";
    }

    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@"];
      uint64_t v7 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      [v5 recordID];
      _NSCoreDataLog(17LL, v6, v8, v9, v10, v11, v12, v13, v7);
      v14 = (os_log_s *)__pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = -[NSCKRecordMetadata ckRecordName](self, "ckRecordName");
      __int16 v27 = 2112;
      uint64_t v28 = [v5 recordID];
      __int16 v29 = 2112;
      v30 = self;
      uint64_t v15 = "CoreData: NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@";
    }

    _os_log_fault_impl(&dword_186681000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0x20u);
    goto LABEL_9;
  }

  return 0LL;
}

+ (uint64_t)createObjectIDForEntityID:(void *)a3 primaryKey:(void *)a4 inSQLCore:
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  unint64_t v7 = [a2 unsignedLongValue];
  uint64_t v8 = [a3 integerValue];
  if (v7)
  {
    uint64_t v9 = v8;
    uint64_t v10 = _sqlCoreLookupSQLEntityForEntityID(a4, v7);
    if (v10)
    {
      if (v9 >= 1) {
        return [a4 newObjectIDForEntity:v10 pk:v9];
      }
      uint64_t v31 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@"];
      _NSCoreDataLog(17LL, v31, v32, v33, v34, v35, v36, v37, (uint64_t)a2);
      uint64_t v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = a2;
        __int16 v40 = 2112;
        v41 = a4;
        uint64_t v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@";
        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v23 = [NSString stringWithUTF8String:"Cannot create objectID. Unable to find entity with id '%@' in store '%@'"];
      _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a2);
      uint64_t v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = a2;
        __int16 v40 = 2112;
        v41 = a4;
        uint64_t v20 = "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'";
LABEL_11:
        uint64_t v21 = (os_log_s *)v30;
        uint32_t v22 = 22;
        goto LABEL_12;
      }
    }
  }

  else
  {
    uint64_t v12 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties (entityID): %@"];
    _NSCoreDataLog(17LL, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a4);
    uint64_t v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = a4;
      uint64_t v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (entityID): %@";
      uint64_t v21 = (os_log_s *)v19;
      uint32_t v22 = 12;
LABEL_12:
      _os_log_fault_impl(&dword_186681000, v21, OS_LOG_TYPE_FAULT, v20, buf, v22);
    }
  }

  return 0LL;
}

+ (uint64_t)createObjectIDFromMetadataDictionary:(void *)a3 inSQLCore:
{
  return +[NSCKRecordMetadata createObjectIDForEntityID:primaryKey:inSQLCore:]( (uint64_t)NSCKRecordMetadata,  (void *)[a2 objectForKey:@"entityId"],  (void *)objc_msgSend(a2, "objectForKey:", @"entityPK"),  a3);
}

+ (uint64_t)metadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  v27[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v22 = 0LL;
  v27[0] = [a2 objectID];
  id v7 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  [MEMORY[0x189603F18] arrayWithObjects:v27 count:1],  objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"),  a3,  &v22);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v7 lastObject];
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Found more than one instance of NSCKRecordMetadata for object: %s\n%s"];
      uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
      objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
      _NSCoreDataLog(17LL, v10, v12, v13, v14, v15, v16, v17, v11);
      uint64_t v18 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
        uint64_t v20 = objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = v19;
        __int16 v25 = 2080;
        uint64_t v26 = v20;
        _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Found more than one instance of NSCKRecordMetadata for object: %s\n%s",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (a4 && v22) {
    *a4 = v22;
  }
  return v9;
}

+ (id)metadataForObjectIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:
{
  v41[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v35 = 0LL;
  id v30 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:]( &OBJC_CLASS___PFCloudKitMetadataModel,  "createMapOfEntityIDToPrimaryKeySetForObjectIDs:",  a2);
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  v41[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v9,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v41 count:1]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v10 = (void *)[v30 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
      uint64_t v15 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v16 = [v30 objectForKey:v14];
      -[NSFetchRequest setPredicate:]( v9,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = %@ and entityPK in %@", v14, v16]);
      -[NSFetchRequest setFetchBatchSize:](v9, "setFetchBatchSize:", 500LL);
      uint64_t v17 = [a4 executeFetchRequest:v9 error:&v35];
      if (v17)
      {
        [v8 addObjectsFromArray:v17];
      }

      else
      {
        id v18 = v35;

        id v8 = 0LL;
      }

      objc_autoreleasePoolPop(v15);
      if (!v17) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v8)
  {
    id v20 = v35;
    if (v20)
    {
      if (a5) {
        *a5 = v20;
      }
    }

    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v28 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v38 = 1024;
        int v39 = 179;
        _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  id v35 = 0LL;
  return v8;
}

+ (id)createMapOfMetadataMatchingObjectIDs:(void *)a3 inStore:(void *)a4 inManagedObjectContext:(void *)a5 error:
{
  v96[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v88 = 0LL;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  v72 = a3;
  v96[0] = a3;
  -[NSFetchRequest setAffectedStores:]( v8,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v96 count:1]);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v75 = objc_alloc_init(MEMORY[0x189603FC8]);
  v66 = v8;
  v67 = a4;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v85;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(a2);
        }
        uint64_t v13 = *(void **)(*((void *)&v84 + 1) + 8 * v12);
        if ([v13 isTemporaryID])
        {
          uint64_t v14 = [NSString stringWithUTF8String:"Somehow got a temporary objectID for export: %s"];
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
          _NSCoreDataLog(17LL, v14, v16, v17, v18, v19, v20, v21, v15);
          uint64_t v22 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v23 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
            *(_DWORD *)buf = 136315138;
            v90 = (const char *)v23;
            _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Somehow got a temporary objectID for export: %s",  buf,  0xCu);
          }
        }

        else
        {
          uint64_t v24 = _sqlEntityForEntityDescription([v72 model], (void *)objc_msgSend(v13, "entity"));
          if (v24) {
            uint64_t v25 = *(unsigned int *)(v24 + 184);
          }
          else {
            uint64_t v25 = 0LL;
          }
          uint64_t v26 = [MEMORY[0x189607968] numberWithUnsignedInt:v25];
          uint64_t v27 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
          id v28 = (id)[v75 objectForKey:v26];
          if (!v28)
          {
            id v28 = objc_alloc_init(MEMORY[0x189603FA8]);
            [v75 setObject:v28 forKey:v26];
          }

          [v28 addObject:v27];

          id v29 = (id)[v9 objectForKey:v26];
          if (!v29)
          {
            id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
            [v9 setObject:v29 forKey:v26];
          }

          [v29 setObject:v13 forKey:v27];
        }

        ++v12;
      }

      while (v10 != v12);
      uint64_t v30 = [a2 countByEnumeratingWithState:&v84 objects:v95 count:16];
      uint64_t v10 = v30;
    }

    while (v30);
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v31 = (void *)[v75 allKeys];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v94 count:16];
  __int128 v34 = v66;
  __int128 v33 = v67;
  if (v32)
  {
    id v68 = v31;
    uint64_t v70 = *(void *)v81;
    unint64_t v35 = 0x189607000uLL;
LABEL_22:
    uint64_t v73 = 0LL;
    uint64_t v69 = v32;
    while (1)
    {
      if (*(void *)v81 != v70) {
        objc_enumerationMutation(v68);
      }
      uint64_t v36 = *(void *)(*((void *)&v80 + 1) + 8 * v73);
      context = (void *)MEMORY[0x186E3E5D8]();
      -[NSFetchRequest setPredicate:]( v34,  "setPredicate:",  [*(id *)(v35 + 2504) predicateWithFormat:@"entityId = %@ and entityPK in %@", v36, objc_msgSend(v75, "objectForKey:", v36)]);
      -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 500LL);
      uint64_t v37 = (void *)[v33 executeFetchRequest:v34 error:&v88];
      __int16 v38 = v37;
      if (v37)
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        uint64_t v39 = [v37 countByEnumeratingWithState:&v76 objects:v93 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v77;
          do
          {
            for (uint64_t i = 0LL; i != v39; ++i)
            {
              if (*(void *)v77 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              uint64_t v43 = objc_msgSend( (id)objc_msgSend(v9, "objectForKey:", objc_msgSend(v42, "entityId")),  "objectForKey:",  objc_msgSend(v42, "entityPK"));
              if (v43)
              {
                [v7 setObject:v42 forKey:v43];
              }

              else
              {
                uint64_t v44 = [NSString stringWithUTF8String:"Exporter got record metadata back but doesn't have a corresponding objectID: %s"];
                uint64_t v45 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                _NSCoreDataLog(17LL, v44, v46, v47, v48, v49, v50, v51, v45);
                v52 = (os_log_s *)__pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v53 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                  *(_DWORD *)buf = 136315138;
                  v90 = (const char *)v53;
                  _os_log_fault_impl( &dword_186681000,  v52,  OS_LOG_TYPE_FAULT,  "CoreData: Exporter got record metadata back but doesn't have a corresponding objectID: %s",  buf,  0xCu);
                }
              }
            }

            uint64_t v39 = [v38 countByEnumeratingWithState:&v76 objects:v93 count:16];
          }

          while (v39);
          __int128 v34 = v66;
          __int128 v33 = v67;
          unint64_t v35 = 0x189607000LL;
          uint64_t v32 = v69;
        }

        else
        {
          uint64_t v32 = v69;
        }
      }

      else
      {
        id v54 = v88;

        id v7 = 0LL;
      }

      objc_autoreleasePoolPop(context);
      if (!v38) {
        break;
      }
      if (++v73 == v32)
      {
        uint64_t v32 = [v68 countByEnumeratingWithState:&v80 objects:v94 count:16];
        if (v32) {
          goto LABEL_22;
        }
        break;
      }
    }
  }

  if (!v7)
  {
    id v55 = v88;
    if (v55)
    {
      if (a5)
      {
        id v7 = 0LL;
        *a5 = v55;
        goto LABEL_50;
      }
    }

    else
    {
      uint64_t v56 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v56,  v57,  v58,  v59,  v60,  v61,  v62,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v63 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v91 = 1024;
        int v92 = 249;
        _os_log_fault_impl( &dword_186681000,  v63,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v7 = 0LL;
  }

+ (NSManagedObject)metadataForRecord:(void *)a3 inManagedObjectContext:(uint64_t)a4 fromStore:(void *)a5 error:
{
  v43[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = objc_opt_self();
  id v38 = 0LL;
  uint64_t v10 = (void *)MEMORY[0x186E3E5D8](v9);
  uint64_t v11 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"ckRecordName = %@ and recordZone.ckRecordZoneName = %@ and recordZone.ckOwnerName = %@", objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "ownerName")]);
  v43[0] = a4;
  -[NSFetchRequest setAffectedStores:]( v11,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v43 count:1]);
  uint64_t v12 = (void *)[a3 executeFetchRequest:v11 error:&v38];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (NSManagedObject *)(id)[v12 lastObject];
    if ((unint64_t)[v13 count] < 2
      || (uint64_t v15 = [NSString stringWithUTF8String:"Found more than one instance of NSCKRecordMetadata for record: %s\n%s"],  v16 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4),  objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4),  _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16),  v23 = (os_log_s *)__pflogFaultLog,  !os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      if (v14) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }

    uint64_t v36 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
    uint64_t v37 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = (const char *)v36;
    __int16 v41 = 2080;
    uint64_t v42 = v37;
    _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Found more than one instance of NSCKRecordMetadata for record: %s\n%s",  buf,  0x16u);
    if (!v14)
    {
LABEL_5:
      uint64_t v14 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"),  a3);
      -[NSManagedObject setCkRecordName:]( v14,  "setCkRecordName:",  objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"));
      [a3 assignObject:v14 toPersistentStore:a4];
      uint64_t v24 = v14;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

+ (id)metadataForRecordIDs:(void *)a3 fromStore:(void *)a4 inManagedObjectContext:(id *)a5 error:
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v70 = (uint64_t)a3;
  uint64_t v6 = [a3 mirroringDelegate];
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    uint64_t v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v81 = (const char *)v70;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@",  buf,  0xCu);
    }
  }

  id v79 = 0LL;
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  uint64_t v17 = [a2 countByEnumeratingWithState:&v75 objects:v86 count:16];
  if (!v17)
  {
    char v66 = 1;
    goto LABEL_25;
  }

  uint64_t v18 = *(void *)v76;
  char v66 = 1;
  do
  {
    uint64_t v19 = 0LL;
    do
    {
      if (*(void *)v76 != v18) {
        objc_enumerationMutation(a2);
      }
      uint64_t v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
      uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v22 = (void *)[v20 zoneID];
      id v23 = (id)[v15 objectForKey:v22];
      if (!v23)
      {
        id v23 = objc_alloc_init(MEMORY[0x189603FE0]);
        [v15 setObject:v23 forKey:v22];
      }

      objc_msgSend(v23, "addObject:", objc_msgSend(v20, "recordName"));

      if ([v16 objectForKey:v22]) {
        goto LABEL_16;
      }
      if (v6) {
        uint64_t v24 = *(void **)(v6 + 8);
      }
      else {
        uint64_t v24 = 0LL;
      }
      id v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)NSCKRecordZoneMetadata,  v22,  [v24 databaseScope],  v70,  a4,  (uint64_t)&v79);
      if (v25)
      {
        id v79 = 0LL;
        objc_msgSend(v16, "setObject:forKey:", -[NSManagedObject objectID](v25, "objectID"), v22);
LABEL_16:
        int v26 = 1;
        goto LABEL_17;
      }

      id v27 = v79;
      int v26 = 0;
      char v66 = 0;
LABEL_17:
      objc_autoreleasePoolPop(v21);
      if (!v26) {
        goto LABEL_25;
      }
      ++v19;
    }

    while (v17 != v19);
    uint64_t v28 = [a2 countByEnumeratingWithState:&v75 objects:v86 count:16];
    uint64_t v17 = v28;
  }

  while (v28);
LABEL_25:
  id v29 = v79;
  if ((v66 & 1) == 0)
  {
    uint64_t v30 = 0LL;
    goto LABEL_46;
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obja = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  uint64_t v31 = (void *)[v15 allKeys];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v71 objects:v85 count:16];
  if (v32)
  {
    id v65 = v31;
    uint64_t v33 = *(void *)v72;
LABEL_29:
    uint64_t v34 = 0LL;
    while (1)
    {
      if (*(void *)v72 != v33) {
        objc_enumerationMutation(v65);
      }
      uint64_t v35 = *(void *)(*((void *)&v71 + 1) + 8 * v34);
      uint64_t v36 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v37 = [v16 objectForKey:v35];
      uint64_t v38 = [v15 objectForKey:v35];
      uint64_t v39 = v38;
      if (v37) {
        BOOL v40 = v38 == 0;
      }
      else {
        BOOL v40 = 1;
      }
      if (v40)
      {
        uint64_t v41 = [NSString stringWithUTF8String:"Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names"];
        _NSCoreDataLog(17LL, v41, v42, v43, v44, v45, v46, v47, v35);
        uint64_t v48 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v81 = (const char *)v35;
          _os_log_fault_impl( &dword_186681000,  v48,  OS_LOG_TYPE_FAULT,  "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names",  buf,  0xCu);
        }
      }

      uint64_t v49 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
      uint64_t v84 = v70;
      -[NSFetchRequest setAffectedStores:]( v49,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v84 count:1]);
      -[NSFetchRequest setPredicate:]( v49,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordZone = %@ AND ckRecordName in %@", v37, v39]);
      uint64_t v50 = [a4 executeFetchRequest:v49 error:&v79];
      if (v50)
      {
        id v79 = 0LL;
        [obja addObjectsFromArray:v50];
      }

      else
      {
        id v51 = v79;
        char v66 = 0;
      }

      objc_autoreleasePoolPop(v36);
      if (!v50) {
        break;
      }
      if (v32 == ++v34)
      {
        uint64_t v32 = [v65 countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v32) {
          goto LABEL_29;
        }
        break;
      }
    }
  }

  uint64_t v30 = obja;
  id v52 = v79;
  if ((v66 & 1) != 0)
  {
    uint64_t v53 = (void *)[obja copy];
    char v54 = 1;
  }

  else
  {
LABEL_46:
    uint64_t v53 = 0LL;
    char v54 = 0;
  }

  if ((v54 & 1) == 0)
  {
    if (v79)
    {
      if (a5) {
        *a5 = v79;
      }
    }

    else
    {
      uint64_t v55 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v55,  v56,  v57,  v58,  v59,  v60,  v61,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v62 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v82 = 1024;
        int v83 = 386;
        _os_log_fault_impl( &dword_186681000,  v62,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v53;
}

+ (uint64_t)createMapOfMetadataMatchingRecords:(void *)a3 andRecordIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(id *)a6 error:
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v8 = [a4 mirroringDelegate];
  if (v8)
  {
    uint64_t v9 = *(void **)(v8 + 8);
  }

  else
  {
    uint64_t v10 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17LL, v10, v11, v12, v13, v14, v15, v16, (uint64_t)a4);
    uint64_t v17 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v100 = (const char *)a4;
      _os_log_fault_impl( &dword_186681000,  v17,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@",  buf,  0xCu);
    }

    uint64_t v9 = 0LL;
  }

  context = (void *)[v9 databaseScope];
  id v98 = 0LL;
  id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v19 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v80 = (uint64_t)a4;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  uint64_t v21 = [a3 countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v95;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v95 != v22) {
          objc_enumerationMutation(a3);
        }
        uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        id v25 = (void *)[v24 zoneID];
        id v26 = (id)[v19 objectForKey:v25];
        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x189603FE0]);
          [v19 setObject:v26 forKey:v25];
        }

        objc_msgSend(v26, "addObject:", objc_msgSend(v24, "recordName"));

        if (![v20 objectForKey:v25])
        {
          id v27 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v25,  (uint64_t)context,  v80,  a5,  (uint64_t)&v98);
          if (!v27) {
            goto LABEL_59;
          }
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v27, "objectID"), v25);
        }
      }

      uint64_t v21 = [a3 countByEnumeratingWithState:&v94 objects:v107 count:16];
    }

    while (v21);
  }

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v28 = [a2 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v91;
    do
    {
      for (uint64_t j = 0LL; j != v28; ++j)
      {
        if (*(void *)v91 != v29) {
          objc_enumerationMutation(a2);
        }
        uint64_t v31 = *(void **)(*((void *)&v90 + 1) + 8 * j);
        uint64_t v32 = (void *)objc_msgSend((id)objc_msgSend(v31, "recordID"), "zoneID");
        id v33 = (id)[v19 objectForKey:v32];
        if (!v33)
        {
          id v33 = objc_alloc_init(MEMORY[0x189603FE0]);
          [v19 setObject:v33 forKey:v32];
        }

        objc_msgSend(v33, "addObject:", objc_msgSend((id)objc_msgSend(v31, "recordID"), "recordName"));

        if (![v20 objectForKey:v32])
        {
          uint64_t v34 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v32,  (uint64_t)context,  v80,  a5,  (uint64_t)&v98);
          if (!v34) {
            goto LABEL_59;
          }
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v34, "objectID"), v32);
        }
      }

      uint64_t v28 = [a2 countByEnumeratingWithState:&v90 objects:v106 count:16];
    }

    while (v28);
  }

  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  uint64_t v35 = (void *)[v19 allKeys];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v86 objects:v105 count:16];
  uint64_t v37 = v80;
  if (v36)
  {
    id obja = *(id *)v87;
    char v74 = 1;
    __int128 v72 = v35;
LABEL_32:
    uint64_t v38 = 0LL;
    uint64_t v75 = v36;
    while (1)
    {
      if (*(id *)v87 != obja) {
        objc_enumerationMutation(v35);
      }
      uint64_t v39 = *(void *)(*((void *)&v86 + 1) + 8 * v38);
      contexta = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v40 = [v20 objectForKey:v39];
      uint64_t v41 = [v19 objectForKey:v39];
      uint64_t v42 = v41;
      if (v40) {
        BOOL v43 = v41 == 0;
      }
      else {
        BOOL v43 = 1;
      }
      if (v43)
      {
        uint64_t v44 = [NSString stringWithUTF8String:"Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names"];
        _NSCoreDataLog(17LL, v44, v45, v46, v47, v48, v49, v50, v39);
        id v51 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v100 = (const char *)v39;
          _os_log_fault_impl( &dword_186681000,  v51,  OS_LOG_TYPE_FAULT,  "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names",  buf,  0xCu);
        }
      }

      id v52 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
      uint64_t v104 = v37;
      -[NSFetchRequest setAffectedStores:]( v52,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v104 count:1]);
      -[NSFetchRequest setPredicate:]( v52,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordZone = %@ AND ckRecordName in %@", v40, v42]);
      uint64_t v53 = (void *)[a5 executeFetchRequest:v52 error:&v98];
      char v54 = v53;
      if (v53)
      {
        id v98 = 0LL;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        uint64_t v55 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v83;
          do
          {
            for (uint64_t k = 0LL; k != v55; ++k)
            {
              if (*(void *)v83 != v56) {
                objc_enumerationMutation(v54);
              }
              uint64_t v58 = *(void **)(*((void *)&v82 + 1) + 8 * k);
              uint64_t v59 = (void *)-[NSCKRecordMetadata createRecordID](v58);
              [v18 setObject:v58 forKey:v59];
            }

            uint64_t v55 = [v54 countByEnumeratingWithState:&v82 objects:v103 count:16];
          }

          while (v55);
          uint64_t v37 = v80;
          uint64_t v35 = v72;
        }
      }

      else
      {
        id v60 = v98;
        char v74 = 0;
      }

      objc_autoreleasePoolPop(contexta);
      if (!v54) {
        break;
      }
      if (++v38 == v75)
      {
        uint64_t v36 = [v35 countByEnumeratingWithState:&v86 objects:v105 count:16];
        if (v36) {
          goto LABEL_32;
        }
        break;
      }
    }
  }

  else
  {
    char v74 = 1;
  }

  id v61 = v98;
  if ((v74 & 1) == 0)
  {
LABEL_59:
    if (v98)
    {
      if (a6)
      {
        uint64_t v62 = 0LL;
        *a6 = v98;
        goto LABEL_65;
      }
    }

    else
    {
      uint64_t v63 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v63,  v64,  v65,  v66,  v67,  v68,  v69,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v70 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v100 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v101 = 1024;
        int v102 = 500;
        _os_log_fault_impl( &dword_186681000,  v70,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    uint64_t v62 = 0LL;
    goto LABEL_65;
  }

  uint64_t v62 = [v18 copy];
LABEL_65:

  return v62;
}

+ (id)insertMetadataForObject:(id)a3 setRecordName:(BOOL)a4 inZoneWithID:(id)a5 recordNamePrefix:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  uint64_t v70 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v59 = 0LL;
  id v60 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3052000000LL;
  uint64_t v57 = __Block_byref_object_copy__3;
  uint64_t v58 = __Block_byref_object_dispose__3;
  uint64_t v11 = (void *)[a3 managedObjectContext];
  uint64_t v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore");
  uint64_t v13 = [v12 mirroringDelegate];
  if (v13)
  {
    uint64_t v14 = *(void **)(v13 + 8);
  }

  else
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17LL, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    uint64_t v22 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v65) = 138412290;
      *(void *)((char *)&v65 + 4) = v12;
      _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@",  (uint8_t *)&v65,  0xCu);
    }

    uint64_t v14 = 0LL;
  }

  uint64_t v23 = [v14 databaseScope];
  uint64_t v24 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"),  v11);
  uint64_t v25 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "entity"), "attributesByName"),  "objectForKey:",  @"ckRecordID");
  if (v25)
  {
    id v26 = (void *)[a3 managedObjectContext];
    *(void *)&__int128 v65 = MEMORY[0x1895F87A8];
    *((void *)&v65 + 1) = 3221225472LL;
    uint64_t v66 = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke;
    uint64_t v67 = &unk_189EA78C0;
    id v68 = a3;
    uint64_t v69 = &v54;
    [v26 performBlockAndWait:&v65];
  }

  if (!v55[5])
  {
    if ([a6 length])
    {
      uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
      uint64_t v28 = (void *)[a6 stringByAppendingFormat:@"%@_%@", v27, objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString")];
    }

    else
    {
      uint64_t v28 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString");
    }

    id v29 = v28;
    v55[5] = (uint64_t)v29;
    if (v25)
    {
      if (v9)
      {
        uint64_t v30 = (void *)[a3 managedObjectContext];
        v53[0] = MEMORY[0x1895F87A8];
        v53[1] = 3221225472LL;
        v53[2] = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2;
        v53[3] = &unk_189EA7258;
        v53[4] = a3;
        v53[5] = &v54;
        [v30 performBlockAndWait:v53];
      }
    }
  }

  [v11 assignObject:v24 toPersistentStore:v12];
  -[NSManagedObject setCkRecordName:](v24, "setCkRecordName:", v55[5]);
  uint64_t v31 = (void *)MEMORY[0x189607968];
  uint64_t v32 = _sqlEntityForEntityDescription( [v12 model],  (void *)objc_msgSend((id)objc_msgSend(a3, "objectID"), "entity"));
  if (v32) {
    uint64_t v33 = *(unsigned int *)(v32 + 184);
  }
  else {
    uint64_t v33 = 0LL;
  }
  -[NSManagedObject setEntityId:](v24, "setEntityId:", [v31 numberWithUnsignedInt:v33]);
  -[NSManagedObject setEntityPK:]( v24,  "setEntityPK:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData64")));
  -[NSManagedObject setRecordZone:]( v24,  "setRecordZone:",  +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  a5,  v23,  (uint64_t)v12,  v11,  (uint64_t)&v60));
  if (!-[NSManagedObject recordZone](v24, "recordZone"))
  {
    uint64_t v34 = (void *)MEMORY[0x186E3E5D8]([v11 deleteObject:v24]);
    uint64_t v35 = __ckLoggingOverride;
    uint64_t v36 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to get a metadata zone while creating metadata for object: %@\n%@"];
    _NSCoreDataLog( v35 != 0,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)"+[NSCKRecordMetadata insertMetadataForObject:usingMetadataContext:setRecordName:inZoneWithID:recordNamePrefix:error:]");
    uint64_t v24 = 0LL;
    objc_autoreleasePoolPop(v34);
  }

  v55[5] = 0LL;
  if (!v24)
  {
    if (v60)
    {
      if (a7) {
        *a7 = v60;
      }
    }

    else
    {
      uint64_t v44 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      id v51 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v63 = 1024;
        int v64 = 587;
        _os_log_fault_impl( &dword_186681000,  v51,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  _Block_object_dispose(&v54, 8);
  return v24;
}

id __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke( uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) valueForKey:@"ckRecordID"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

uint64_t __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"ckRecordID"];
}

+ (uint64_t)purgeRecordMetadataWithRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(id *)a5 error:
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v51 = 0LL;
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }

        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));
      }

      uint64_t v9 = [a2 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }

    while (v9);
  }

  uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  uint64_t v58 = a3;
  -[NSFetchRequest setAffectedStores:]( v14,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v58 count:1]);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v15 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v15)
  {
    char v37 = 1;
    uint64_t v38 = *(void *)v44;
LABEL_12:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v38) {
        objc_enumerationMutation(v8);
      }
      uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
      uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v19 = [v8 objectForKey:v17];
      -[NSFetchRequest setPredicate:]( v14,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND (ckRecordName IN %@)) OR (needsCloudDelete = 1 AND needsUpload = 0)", objc_msgSend(v17, "zoneName"), objc_msgSend(v17, "ownerName"), v19]);
      uint64_t v20 = (void *)[a4 executeFetchRequest:v14 error:&v51];
      uint64_t v21 = v20;
      if (v20)
      {
        id v51 = 0LL;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v40;
          do
          {
            for (uint64_t j = 0LL; j != v22; ++j)
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v21);
              }
              [a4 deleteObject:*(void *)(*((void *)&v39 + 1) + 8 * j)];
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v56 count:16];
          }

          while (v22);
        }
      }

      else
      {
        id v25 = v51;
        char v37 = 0;
      }

      objc_autoreleasePoolPop(v18);
      if (!v21) {
        break;
      }
      if (++v16 == v15)
      {
        uint64_t v15 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v15) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  else
  {
    char v37 = 1;
  }

  id v26 = v51;

  if ((v37 & 1) == 0)
  {
    if (v51)
    {
      if (a5) {
        *a5 = v51;
      }
    }

    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v34 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v54 = 1024;
        int v55 = 636;
        _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v37 & 1;
}

+ (uint64_t)countRecordMetadataInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:
{
  v13[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
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

+ (id)batchUpdateMetadataMatchingEntityIdsAndPKs:(uint64_t)a3 withUpdates:(uint64_t)a4 inStore:(uint64_t)a5 withManagedObjectContext:(void *)a6 error:
{
  v39[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  uint64_t v28 = __Block_byref_object_copy__3;
  uint64_t v29 = __Block_byref_object_dispose__3;
  uint64_t v30 = 0LL;
  id v11 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v12 = -[NSBatchUpdateRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest),  "initWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  v39[0] = a4;
  -[NSPersistentStoreRequest setAffectedStores:]( v12,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v39 count:1]);
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v12, "setPropertiesToUpdate:", a3);
  -[NSBatchUpdateRequest setResultType:](v12, "setResultType:", 1LL);
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke;
  v24[3] = &unk_189EA7870;
  v24[4] = v12;
  v24[5] = a5;
  v24[6] = a4;
  v24[7] = v11;
  v24[8] = &v25;
  v24[9] = &v31;
  [a2 enumerateKeysAndObjectsUsingBlock:v24];
  if (!*((_BYTE *)v32 + 24))
  {

    id v13 = (id)v26[5];
    if (v13)
    {
      if (a6)
      {
        id v11 = 0LL;
        *a6 = v13;
        goto LABEL_8;
      }
    }

    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v37 = 1024;
        int v38 = 793;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v11 = 0LL;
  }

void __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v8 = (void *)MEMORY[0x186E3E5D8]();
  [*(id *)(a1 + 32) setPredicate:objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"entityId = %@ AND entityPK IN %@", a2, a3)];
  uint64_t v9 = objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 40),  "executeRequest:error:",  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "result");
  if (!v9)
  {
    *a4 = 1;
LABEL_13:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    id v19 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    goto LABEL_14;
  }

  uint64_t v10 = v9;
  id v11 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF IN %@", v10]);
  -[NSFetchRequest setPropertiesToFetch:](v11, "setPropertiesToFetch:", &unk_189F0B0A0);
  v25[0] = *(void *)(a1 + 48);
  -[NSFetchRequest setAffectedStores:]( v11,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v25 count:1]);
  -[NSFetchRequest setReturnsObjectsAsFaults:](v11, "setReturnsObjectsAsFaults:", 0LL);
  uint64_t v12 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v11 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  if (!v12)
  {
    *a4 = 1;
    goto LABEL_13;
  }

  id v13 = v12;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = -[NSCKRecordMetadata createObjectIDForLinkedRow](*(void **)(*((void *)&v20 + 1) + 8 * i));
        [*(id *)(a1 + 56) addObject:v18];
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

+ (void)enumerateRecordMetadataDictionariesMatchingObjectIDs:(void *)a3 withProperties:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 block:
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  objc_opt_self();
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  obuint64_t j = a2;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * v13);
        uint64_t v15 = (void *)MEMORY[0x189607968];
        uint64_t v16 = _sqlEntityForEntityDescription([a4 model], (void *)objc_msgSend(v14, "entity"));
        if (v16) {
          uint64_t v17 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v17 = 0LL;
        }
        uint64_t v18 = [v15 numberWithUnsignedInt:v17];
        uint64_t v19 = objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v14, "_referenceData64"));
        id v20 = (id)[v9 objectForKey:v18];
        if (!v20)
        {
          id v20 = objc_alloc_init(MEMORY[0x189603FE0]);
          [v9 setObject:v20 forKey:v18];
        }

        [v20 addObject:v19];

        ++v13;
      }

      while (v11 != v13);
      uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      uint64_t v11 = v21;
    }

    while (v21);
  }

  id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  uint64_t v23 = [a3 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (!v23) {
    goto LABEL_22;
  }
  uint64_t v24 = v23;
  int v25 = 0;
  uint64_t v26 = *(void *)v59;
  do
  {
    for (uint64_t i = 0LL; i != v24; ++i)
    {
      if (*(void *)v59 != v26) {
        objc_enumerationMutation(a3);
      }
      uint64_t v28 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      [v22 addObject:v28];
      v25 |= [v28 isEqualToString:@"objectID"];
    }

    uint64_t v24 = [a3 countByEnumeratingWithState:&v58 objects:v68 count:16];
  }

  while (v24);
  if ((v25 & 1) == 0) {
LABEL_22:
  }
    [v22 addObject:@"objectID"];
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  uint64_t v29 = [v9 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    id v44 = 0LL;
    id obja = *(id *)v55;
    do
    {
      for (uint64_t j = 0LL; j != v30; ++j)
      {
        if (*(id *)v55 != obja) {
          objc_enumerationMutation(v9);
        }
        uint64_t v32 = *(void *)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v33 = (void *)MEMORY[0x186E3E5D8]();
        char v34 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
        -[NSFetchRequest setResultType:](v34, "setResultType:", 2LL);
        -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 1000LL);
        -[NSFetchRequest setPropertiesToFetch:](v34, "setPropertiesToFetch:", v22);
        uint64_t v35 = [v9 objectForKey:v32];
        -[NSFetchRequest setPredicate:]( v34,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = %@ AND entityPK IN %@", v32, v35]);
        id v53 = 0LL;
        uint64_t v36 = (void *)[a5 executeFetchRequest:v34 error:&v53];
        if (v36)
        {
          __int16 v37 = v36;
          id v53 = 0LL;
          char v52 = 0;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          uint64_t v38 = [v36 countByEnumeratingWithState:&v48 objects:v66 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v49;
LABEL_31:
            uint64_t v41 = 0LL;
            while (1)
            {
              if (*(void *)v49 != v40) {
                objc_enumerationMutation(v37);
              }
              (*(void (**)(uint64_t, void, void, char *))(a6 + 16))( a6,  *(void *)(*((void *)&v48 + 1) + 8 * v41),  0LL,  &v52);
              if (v52) {
                break;
              }
              if (v39 == ++v41)
              {
                uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v66 count:16];
                if (v39) {
                  goto LABEL_31;
                }
                break;
              }
            }
          }
        }

        else if (!v44)
        {
          id v44 = v53;
        }

        objc_autoreleasePoolPop(v33);
      }

      uint64_t v30 = [v9 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }

    while (v30);
  }

  else
  {
    id v44 = 0LL;
  }

  id v42 = v44;
}

- (id)createEncodedMoveReceiptData:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v19 = 0LL;
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  uint64_t v6 = -[NSCKRecordMetadataReceiptArchive initWithReceiptsToEncode:]( objc_alloc(&OBJC_CLASS___NSCKRecordMetadataReceiptArchive),  "initWithReceiptsToEncode:",  -[NSCKRecordMetadata moveReceipts](self, "moveReceipts"));
  id v7 = (id)[MEMORY[0x1896078F8] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v19];
  if (v7)
  {

    objc_autoreleasePoolPop(v5);
  }

  else
  {
    id v9 = v19;

    objc_autoreleasePoolPop(v5);
    id v10 = v19;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
    }

    else
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v18 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v22 = 1024;
        int v23 = 903;
        _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v7;
}

- (BOOL)mergeMoveReceiptsWithData:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v43 = 0LL;
  id v7 = -[NSManagedObjectID persistentStore](-[NSManagedObject objectID](self, "objectID"), "persistentStore");
  id v8 = -[NSManagedObject managedObjectContext](self, "managedObjectContext");
  if (!v7)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to merge move receipts before assigning a record metadata to a store: %@"];
    _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, (uint64_t)self);
    uint64_t v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v45 = self;
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to merge move receipts before assigning a record metadata to a store: %@",  buf,  0xCu);
    }
  }

  uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
  id v18 = (id)[MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v43];
  if (v18)
  {
    __int16 v37 = v8;
    id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v20 = (void *)-[NSCKRecordMetadata moveReceipts](self, "moveReceipts");
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) createRecordIDForMovedRecord];
          [v19 addObject:v25];
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }

      while (v22);
    }

    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    v38[2] = __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke;
    v38[3] = &unk_189EA7898;
    id v8 = v37;
    v38[4] = v19;
    v38[5] = v37;
    v38[6] = self;
    v38[7] = v7;
    [v18 enumerateArchivedRecordIDsUsingBlock:v38];

    objc_autoreleasePoolPop(v17);
  }

  else
  {
    id v27 = v43;
    objc_autoreleasePoolPop(v17);
    id v28 = v43;
    if (v28)
    {
      if (a4) {
        *a4 = v28;
      }
    }

    else
    {
      uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v36 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v45 = (NSCKRecordMetadata *)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v46 = 1024;
        int v47 = 957;
        _os_log_fault_impl( &dword_186681000,  v36,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  id v43 = 0LL;
  return v18 != 0LL;
}

uint64_t __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    id v7 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordZoneMoveReceipt entityPath](&OBJC_CLASS___NSCKRecordZoneMoveReceipt, "entityPath"),  *(void *)(a1 + 40));
    -[NSManagedObject setRecordMetadata:](v7, "setRecordMetadata:", *(void *)(a1 + 48));
    -[NSManagedObject setMovedAt:](v7, "setMovedAt:", a3);
    -[NSManagedObject setNeedsCloudDelete:](v7, "setNeedsCloudDelete:", 0LL);
    -[NSManagedObject setZoneName:](v7, "setZoneName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"));
    -[NSManagedObject setOwnerName:](v7, "setOwnerName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "ownerName"));
    -[NSManagedObject setRecordName:](v7, "setRecordName:", [a2 recordName]);
    [*(id *)(a1 + 40) assignObject:v7 toPersistentStore:*(void *)(a1 + 56)];
    return [*(id *)(a1 + 32) addObject:a2];
  }

  return result;
}

+ (id)encodeRecord:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v21 = 0LL;
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](a1, a2);
  id v7 = (void *)[MEMORY[0x1896078F8] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v21];
  if (!v7 || (id v8 = (id)[v7 compressedDataUsingAlgorithm:0 error:&v21]) == 0)
  {
    id v10 = v21;
    objc_autoreleasePoolPop(v6);
    id v11 = v21;
    if (v11)
    {
      if (a4)
      {
        uint64_t v9 = 0LL;
        *a4 = v11;
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      id v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v24 = 1024;
        int v25 = 987;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    uint64_t v9 = 0LL;
    goto LABEL_10;
  }

  uint64_t v9 = v8;
  objc_autoreleasePoolPop(v6);
LABEL_10:

  return v9;
}

+ (id)recordFromEncodedData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v23 = 0LL;
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](a1, a2);
  uint64_t v7 = [a3 decompressedDataUsingAlgorithm:0 error:&v23];
  if (!v7
    || (uint64_t v8 = v7,
        uint64_t v9 = (void *)MEMORY[0x189607908],
        getCloudKitCKRecordClass(),
        (id v10 = (id)[v9 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v23]) == 0))
  {
    id v12 = v23;
    objc_autoreleasePoolPop(v6);
    id v13 = v23;
    if (v13)
    {
      if (a4)
      {
        id v11 = 0LL;
        *a4 = v13;
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      id v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v26 = 1024;
        int v27 = 1013;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v11 = 0LL;
    goto LABEL_10;
  }

  id v11 = v10;
  objc_autoreleasePoolPop(v6);
LABEL_10:

  return v11;
}

@end