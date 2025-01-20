@interface NSCKRecordZoneMetadata
+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(int)a6 createIfMissing:(uint64_t)a7 error:;
+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(uint64_t)a6 error:;
+ (NSString)entityPath;
+ (id)fetchZoneIDsAssignedToObjectsWithIDs:(id)a3 fromStore:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)hasRecordZone;
- (BOOL)hasSubscription;
- (void)createRecordZoneID;
- (void)setHasRecordZone:(BOOL)a3;
- (void)setHasSubscription:(BOOL)a3;
@end

@implementation NSCKRecordZoneMetadata

- (BOOL)hasRecordZone
{
  return objc_msgSend((id)-[NSCKRecordZoneMetadata hasRecordZoneNum](self, "hasRecordZoneNum"), "BOOLValue");
}

- (void)setHasRecordZone:(BOOL)a3
{
}

- (BOOL)hasSubscription
{
  return objc_msgSend((id)-[NSCKRecordZoneMetadata hasSubscriptionNum](self, "hasSubscriptionNum"), "BOOLValue");
}

- (void)setHasSubscription:(BOOL)a3
{
}

- (void)createRecordZoneID
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    if (![result ckRecordZoneName]
      || ![v1 ckOwnerName]
      || (result = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend(v1, "ckRecordZoneName"),  objc_msgSend(v1, "ckOwnerName"))) == 0)
    {
      uint64_t v2 = [NSString stringWithUTF8String:"createRecordZoneID called before object has an owner name and zone name: %@"];
      _NSCoreDataLog(17LL, v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
      v9 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v1;
        _os_log_fault_impl( &dword_186681000,  v9,  OS_LOG_TYPE_FAULT,  "CoreData: createRecordZoneID called before object has an owner name and zone name: %@",  buf,  0xCu);
      }

      return 0LL;
    }
  }

  return result;
}

+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(uint64_t)a6 error:
{
  return +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  a2,  a3,  a4,  a5,  1,  a6);
}

+ (NSManagedObject)zoneMetadataForZoneID:(uint64_t)a3 inDatabaseWithScope:(uint64_t)a4 forStore:(void *)a5 inContext:(int)a6 createIfMissing:(uint64_t)a7 error:
{
  v43[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a3 == 3)
  {
    if ((objc_msgSend((id)objc_msgSend(a2, "zoneName"), "isEqualToString:", @"com.apple.coredata.cloudkit.zone") & 1) != 0
      || (uint64_t v12 = (void *)[a2 zoneName],
          [v12 isEqualToString:getCloudKitCKRecordZoneDefaultName()]))
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to work with the core-data or default zone in the shared database: %@"];
      _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, a4);
      v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = a4;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to work with the core-data or default zone in the shared database: %@",  buf,  0xCu);
      }
    }
  }

  v21 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  v43[0] = a4;
  -[NSFetchRequest setAffectedStores:]( v21,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v43 count:1]);
  v22 = (void *)MEMORY[0x1896079C8];
  uint64_t v23 = [a2 zoneName];
  uint64_t v24 = [a2 ownerName];
  -[NSFetchRequest setPredicate:]( v21,  "setPredicate:",  [v22 predicateWithFormat:@"%K = %@ AND %K = %@ AND database.databaseScopeNum = %@", @"ckRecordZoneName", v23, @"ckOwnerName", v24, objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a3)]);
  v25 = (NSManagedObject *)[a5 executeFetchRequest:v21 error:a7];
  v26 = v25;
  if (v25)
  {
    if ((unint64_t)-[NSManagedObject count](v25, "count") >= 2)
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Multiple zone entires discovered for a single record zone: %@\n%@"];
      _NSCoreDataLog(17LL, v27, v28, v29, v30, v31, v32, v33, (uint64_t)a2);
      v34 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = (uint64_t)a2;
        __int16 v41 = 2112;
        v42 = v26;
        _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Multiple zone entires discovered for a single record zone: %@\n%@",  buf,  0x16u);
      }
    }

    v26 = (NSManagedObject *)-[NSManagedObject lastObject](v26, "lastObject");
    if (!v26 && a6)
    {
      v35 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  a3,  a4,  a5,  a7);
      if (v35)
      {
        v36 = v35;
        v26 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"),  a5);
        -[NSManagedObject setCkRecordZoneName:](v26, "setCkRecordZoneName:", [a2 zoneName]);
        -[NSManagedObject setCkOwnerName:](v26, "setCkOwnerName:", [a2 ownerName]);
        -[NSManagedObject setDatabase:](v26, "setDatabase:", v36);
        [a5 assignObject:v26 toPersistentStore:a4];
      }

      else
      {
        return 0LL;
      }
    }
  }

  return v26;
}

+ (id)fetchZoneIDsAssignedToObjectsWithIDs:(id)a3 fromStore:(id)a4 inContext:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  v42 = 0LL;
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:]( &OBJC_CLASS___PFCloudKitMetadataModel,  "createMapOfEntityIDToPrimaryKeySetForObjectIDs:",  a3);
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v9)
  {
    uint64_t v29 = *(void *)v39;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v10);
        uint64_t v12 = [obj objectForKey:v11];
        uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
        -[NSFetchRequest setPredicate:]( v13,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = %@ and entityPK IN %@", v11, v12]);
        -[NSFetchRequest setResultType:](v13, "setResultType:", 2LL);
        -[NSFetchRequest setPropertiesToFetch:](v13, "setPropertiesToFetch:", &unk_189F0B1C0);
        -[NSFetchRequest setPropertiesToGroupBy:](v13, "setPropertiesToGroupBy:", &unk_189F0B1D8);
        id v48 = a4;
        -[NSFetchRequest setAffectedStores:]( v13,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v48 count:1]);
        uint64_t v14 = (void *)[a5 executeFetchRequest:v13 error:&v42];
        uint64_t v15 = v14;
        if (!v14)
        {
          if (v42)
          {
            if (a6) {
              *a6 = v42;
            }
          }

          else
          {
            uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog( 17LL,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMetadata.m");
            uint64_t v27 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMetadata.m";
              __int16 v45 = 1024;
              int v46 = 172;
              _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
            }
          }

          id v8 = 0LL;
          goto LABEL_23;
        }

        uint64_t v33 = v10;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v35;
          do
          {
            for (uint64_t i = 0LL; i != v16; ++i)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordZoneIDClass()),  "initWithZoneName:ownerName:",  objc_msgSend( *(id *)(*((void *)&v34 + 1) + 8 * i),  "objectForKey:",  @"recordZone.ckRecordZoneName"),  objc_msgSend( *(id *)(*((void *)&v34 + 1) + 8 * i),  "objectForKey:",  @"recordZone.ckOwnerName"));
              [v8 addObject:v19];
            }

            uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v47 count:16];
          }

          while (v16);
        }

        uint64_t v10 = v33 + 1;
      }

      while (v33 + 1 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

+ (NSString)entityPath
{
  uint64_t v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

@end