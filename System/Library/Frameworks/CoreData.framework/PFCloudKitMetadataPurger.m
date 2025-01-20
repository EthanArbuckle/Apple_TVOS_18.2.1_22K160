@interface PFCloudKitMetadataPurger
- (BOOL)deleteZoneMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 forRecordZones:(uint64_t)a5 inDatabaseWithScope:(void *)a6 error:;
- (BOOL)purgeMetadataAfterAccountChangeFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 inDatabaseWithScope:(void *)a5 error:;
- (BOOL)purgeMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 withOptions:(uint64_t)a5 forRecordZones:(uint64_t)a6 inDatabaseWithScope:(__CFString *)a7 andTransactionAuthor:(void *)a8 error:;
- (BOOL)purgeMetadataMatchingObjectIDs:(uint64_t)a3 inRequest:(uint64_t)a4 inStore:(uint64_t)a5 withMonitor:(void *)a6 error:;
- (uint64_t)_purgeBatchOfObjectIDs:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
- (uint64_t)_purgeObjectsMatchingFetchRequest:(void *)a3 fromStore:usingContext:error:;
- (uint64_t)_purgeZoneRelatedObjectsInZoneWithID:(uint64_t)a1 inDatabaseWithScope:(void *)a2 withOptions:(char)a3 inStore:(uint64_t)a4 usingContext:(void *)a5 error:(void *)a6;
@end

@implementation PFCloudKitMetadataPurger

- (BOOL)purgeMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 withOptions:(uint64_t)a5 forRecordZones:(uint64_t)a6 inDatabaseWithScope:(__CFString *)a7 andTransactionAuthor:(void *)a8 error:
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 1;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  v32 = __Block_byref_object_copy__30;
  v33 = __Block_byref_object_dispose__30;
  uint64_t v34 = 0LL;
  v15 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  if (-[__CFString length](a7, "length")) {
    v16 = a7;
  }
  else {
    v16 = @"NSCloudKitMirroringDelegate.reset";
  }
  -[NSManagedObjectContext setTransactionAuthor:](v15, "setTransactionAuthor:", v16);
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke;
  v28[3] = &unk_189EAA588;
  v28[4] = a2;
  v28[5] = a5;
  v28[10] = a4;
  v28[11] = a6;
  v28[6] = v15;
  v28[7] = a1;
  v28[8] = &v35;
  v28[9] = &v29;
  -[NSManagedObjectContext performBlockAndWait:](v15, "performBlockAndWait:", v28);
  if (!*((_BYTE *)v36 + 24))
  {
    id v19 = (id)v30[5];
    if (v19)
    {
      if (a8) {
        *a8 = v19;
      }
    }

    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v27 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v41 = 1024;
        int v42 = 245;
        _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v30[5] = 0LL;
  BOOL v17 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v17;
}

void __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke( uint64_t a1)
{
  v200[1] = *MEMORY[0x1895F89C0];
  id v159 = 0LL;
  id v124 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v123 = (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  v2 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:*(void *)(a1 + 40)];
  uint64_t v130 = a1;
  if ((*(_BYTE *)(a1 + 80) & 4) != 0)
  {
    v3 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKDatabaseMetadata,  *(void *)(a1 + 88),  *(void *)(a1 + 32),  *(void **)(a1 + 48),  (uint64_t)&v159);
    if (v3)
    {
      __int128 v157 = 0u;
      __int128 v158 = 0u;
      __int128 v155 = 0u;
      __int128 v156 = 0u;
      v4 = (void *)-[NSManagedObject recordZones](v3, "recordZones");
      uint64_t v5 = [v4 countByEnumeratingWithState:&v155 objects:v192 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v156;
        do
        {
          for (uint64_t i = 0LL; i != v5; ++i)
          {
            if (*(void *)v156 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((void *)&v155 + 1) + 8 * i));
            [v2 addObject:v8];
          }

          uint64_t v5 = [v4 countByEnumeratingWithState:&v155 objects:v192 count:16];
        }

        while (v5);
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    }
  }

  uint64_t v9 = v130;
  if (*(_BYTE *)(*(void *)(*(void *)(v130 + 64) + 8LL) + 24LL))
  {
    uint64_t v10 = *(void *)(v130 + 80);
    if ((v10 & 1) == 0)
    {
      if ((v10 & 2) != 0)
      {
        if (![v2 count])
        {
          uint64_t v11 = [NSString stringWithUTF8String:"Asked to purge system fields without any zones from which to purge."];
          _NSCoreDataLog(17LL, v11, v12, v13, v14, v15, v16, v17, v122);
          v18 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v160 = 0;
            _os_log_fault_impl( &dword_186681000,  v18,  OS_LOG_TYPE_FAULT,  "CoreData: Asked to purge system fields without any zones from which to purge.",  v160,  2u);
          }
        }

        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        uint64_t v128 = [v2 countByEnumeratingWithState:&v147 objects:v190 count:16];
        if (v128)
        {
          uint64_t v126 = *(void *)v148;
LABEL_20:
          uint64_t v19 = 0LL;
          while (1)
          {
            if (*(void *)v148 != v126) {
              objc_enumerationMutation(v2);
            }
            uint64_t v20 = *(void **)(*((void *)&v147 + 1) + 8 * v19);
            uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v22 = (unint64_t)__ckLoggingOverride >= 3 ? 3LL : __ckLoggingOverride;
            uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Purging system fields from data in zone: %@"];
            [*(id *)(v130 + 48) transactionAuthor];
            _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabase WithScope:andTransactionAuthor:error:]_block_invoke");
            objc_autoreleasePoolPop(v21);
            if (!*(void *)(v130 + 56)) {
              break;
            }
            v30 = *(void **)(v130 + 32);
            uint64_t v31 = *(void **)(v130 + 48);
            uint64_t v182 = 0LL;
            v183 = &v182;
            uint64_t v184 = 0x2020000000LL;
            char v185 = 1;
            uint64_t v176 = 0LL;
            v177 = &v176;
            uint64_t v178 = 0x3052000000LL;
            v179 = __Block_byref_object_copy__30;
            v180 = __Block_byref_object_dispose__30;
            uint64_t v181 = 0LL;
            v32 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
            -[NSFetchRequest setReturnsObjectsAsFaults:](v32, "setReturnsObjectsAsFaults:", 0LL);
            -[NSFetchRequest setFetchBatchSize:](v32, "setFetchBatchSize:", 250LL);
            v33 = (void *)MEMORY[0x1896079C8];
            uint64_t v122 = [v20 zoneName];
            [v20 ownerName];
            -[NSFetchRequest setPredicate:]( v32,  "setPredicate:",  [v33 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
            v200[0] = v30;
            -[NSFetchRequest setAffectedStores:]( v32,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v200 count:1]);
            *(void *)v160 = MEMORY[0x1895F87A8];
            uint64_t v161 = 3221225472LL;
            v162 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke;
            v163 = &unk_189EA8828;
            uint64_t v164 = (uint64_t)v31;
            v165 = &v176;
            v166 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v32,  v31,  (uint64_t)v160);
            if (!*((_BYTE *)v183 + 24)) {
              goto LABEL_29;
            }
            uint64_t v34 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
            -[NSFetchRequest setReturnsObjectsAsFaults:](v34, "setReturnsObjectsAsFaults:", 0LL);
            -[NSFetchRequest setFetchBatchSize:](v34, "setFetchBatchSize:", 250LL);
            uint64_t v35 = (void *)MEMORY[0x1896079C8];
            uint64_t v122 = [v20 zoneName];
            [v20 ownerName];
            -[NSFetchRequest setPredicate:]( v34,  "setPredicate:",  [v35 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
            id v199 = v30;
            -[NSFetchRequest setAffectedStores:]( v34,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v199 count:1]);
            uint64_t v169 = MEMORY[0x1895F87A8];
            uint64_t v170 = 3221225472LL;
            v171 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2;
            v172 = &unk_189EA8828;
            id v173 = v31;
            v174 = &v176;
            v175 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v34,  v31,  (uint64_t)&v169);
            if (!*((_BYTE *)v183 + 24))
            {
LABEL_29:
              id v36 = (id)v177[5];
              if (v36)
              {
                id v159 = v36;
              }

              else
              {
                uint64_t v37 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog( 17LL,  v37,  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
                v44 = (os_log_s *)__pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v196 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
                  __int16 v197 = 1024;
                  int v198 = 615;
                  _os_log_fault_impl( &dword_186681000,  v44,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
                }
              }
            }

            v177[5] = 0LL;
            int v45 = *((unsigned __int8 *)v183 + 24);
            _Block_object_dispose(&v176, 8);
            _Block_object_dispose(&v182, 8);
            if (!v45) {
              break;
            }
            if (v128 == ++v19)
            {
              uint64_t v128 = [v2 countByEnumeratingWithState:&v147 objects:v190 count:16];
              if (v128) {
                goto LABEL_20;
              }
              goto LABEL_71;
            }
          }

- (uint64_t)_purgeZoneRelatedObjectsInZoneWithID:(uint64_t)a1 inDatabaseWithScope:(void *)a2 withOptions:(char)a3 inStore:(uint64_t)a4 usingContext:(void *)a5 error:(void *)a6
{
  v34[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v26 = 0LL;
  if ((a3 & 0x41) != 0)
  {
    uint64_t v11 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
    -[NSFetchRequest setFetchBatchSize:](v11, "setFetchBatchSize:", 1000LL);
    -[NSFetchRequest setPredicate:]( v11,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
    v34[0] = a4;
    -[NSFetchRequest setAffectedStores:]( v11,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1]);
    if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:]( (uint64_t)v11,  a5,  &v26)) {
      goto LABEL_7;
    }
  }

  if ((a3 & 0x81) == 0) {
    return 1LL;
  }
  uint64_t v12 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v12, "setFetchBatchSize:", 1000LL);
  -[NSFetchRequest setPredicate:]( v12,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
  uint64_t v33 = a4;
  -[NSFetchRequest setAffectedStores:]( v12,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v33 count:1]);
  if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:]( (uint64_t)v12,  a5,  &v26)) {
    goto LABEL_7;
  }
  uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKImportPendingRelationship entityPath]());
  -[NSFetchRequest setPredicate:]( v13,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordZoneName = %@ AND recordZoneOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
  uint64_t v32 = a4;
  uint64_t v14 = 1LL;
  -[NSFetchRequest setAffectedStores:]( v13,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v32 count:1]);
  uint64_t v15 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v13);
  -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0LL);
  uint64_t v31 = a4;
  -[NSPersistentStoreRequest setAffectedStores:]( v15,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v31 count:1]);
  -[NSBatchDeleteRequest setResultType:](v15, "setResultType:", 0LL);
  char v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "executeRequest:error:", v15, &v26), "result"), "BOOLValue");

  if ((v16 & 1) == 0)
  {
LABEL_7:
    if (v26)
    {
      if (a6)
      {
        uint64_t v14 = 0LL;
        *a6 = v26;
        return v14;
      }
    }

    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v24 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v29 = 1024;
        int v30 = 676;
        _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    return 0LL;
  }

  return v14;
}

- (BOOL)purgeMetadataMatchingObjectIDs:(uint64_t)a3 inRequest:(uint64_t)a4 inStore:(uint64_t)a5 withMonitor:(void *)a6 error:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v28 = 0LL;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  uint64_t v25 = __Block_byref_object_copy__30;
  uint64_t v26 = __Block_byref_object_dispose__30;
  uint64_t v27 = 0LL;
  uint64_t v9 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a5);
  -[NSManagedObjectContext setMergePolicy:](v9, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke;
  v21[3] = &unk_189EA96B8;
  v21[4] = a2;
  v21[5] = a4;
  v21[6] = v9;
  v21[7] = &v28;
  v21[8] = &v22;
  -[NSManagedObjectContext performBlockAndWait:](v9, "performBlockAndWait:", v21);

  if (!*((_BYTE *)v29 + 24))
  {
    id v12 = (id)v23[5];
    if (v12)
    {
      if (a6) {
        *a6 = v12;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v34 = 1024;
        int v35 = 329;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v23[5] = 0LL;
  BOOL v10 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

void __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke( uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v2 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:fromStore:]( &OBJC_CLASS___PFCloudKitMetadataModel,  "createMapOfEntityIDToPrimaryKeySetForObjectIDs:fromStore:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  obuint64_t j = v2;
  uint64_t v26 = [v2 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v38;
LABEL_3:
    uint64_t v3 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v4 = *(void *)(*((void *)&v37 + 1) + 8 * v3);
      context = (void *)MEMORY[0x186E3E5D8]();
      id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordMetadata entityPath](&OBJC_CLASS___NSCKRecordMetadata, "entityPath"));
      -[NSFetchRequest setPredicate:]( v6,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"entityId = %@ AND entityPK IN %@", v4, objc_msgSend(obj, "objectForKey:", v4)]);
      -[NSFetchRequest setFetchBatchSize:](v6, "setFetchBatchSize:", 100LL);
      uint64_t v45 = *(void *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:]( v6,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v45 count:1]);
      v7 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v6 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      if (v7)
      {
        v8 = v7;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v13 ckRecordName]) {
                objc_msgSend(v5, "addObject:", objc_msgSend(v13, "ckRecordName"));
              }
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setCurrentChangeToken:", 0);
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setLastFetchDate:", 0);
              objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"),  "setCurrentChangeToken:",  0);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"), "setLastFetchDate:", 0);
              [*(id *)(a1 + 48) deleteObject:v13];
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }

          while (v10);
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
        id v14 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
      {
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        v42[0] = +[NSCKMirroredRelationship entityPath](&OBJC_CLASS___NSCKMirroredRelationship, "entityPath");
        v42[1] = +[NSCKImportPendingRelationship entityPath]();
        uint64_t v15 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v42 count:2];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0LL; j != v17; ++j)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  *(void *)(*((void *)&v29 + 1) + 8 * j));
              -[NSFetchRequest setPredicate:]( v20,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"recordName IN %@ OR relatedRecordName IN %@", v5, v5]);
              uint64_t v21 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v20);
              -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0LL);
              uint64_t v41 = *(void *)(a1 + 40);
              -[NSPersistentStoreRequest setAffectedStores:]( v21,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v41 count:1]);
              -[NSBatchDeleteRequest setResultType:](v21, "setResultType:", 0LL);
              if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 48),  "executeRequest:error:",  v21,  *(void *)(*(void *)(a1 + 64) + 8) + 40),  "result"),  "BOOLValue") & 1) == 0)
              {
                *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
                id v22 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);

                goto LABEL_29;
              }
            }

            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v43 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
      }

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a3;
    *a4 = 1;
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0LL;
      id v10 = 0LL;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (!v10
            || (uint64_t v14 = [v10 integerValue],
                v14 != objc_msgSend((id)objc_msgSend(v13, "entityId"), "integerValue")))
          {

            id v10 = (id)[v13 entityId];
            id v15 = (id)[*(id *)(a1 + 32) objectForKey:v10];
            if (v15)
            {
              id v9 = v15;
            }

            else
            {
              id v9 = objc_alloc_init(MEMORY[0x189603FE0]);
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, objc_msgSend(v13, "entityId"));
            }
          }

          objc_msgSend(v9, "addObject:", objc_msgSend(v13, "entityPK"));
        }

        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    else
    {
      id v9 = 0LL;
      id v10 = 0LL;
    }
  }

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)_sqlCoreLookupSQLEntityForEntityID(*(void **)(a1 + 32), [a2 unsignedLongValue]);
  if (v8)
  {
    id v9 = v8;
    __int128 v39 = a4;
    id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
LABEL_4:
      uint64_t v14 = 0LL;
      while (1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(a3);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        if ([v15 longValue] < 1)
        {
          uint64_t v17 = [NSString stringWithUTF8String:"Cannot create objectID: got a 0 pk for entity: %@"];
          uint64_t v18 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
          _NSCoreDataLog(17LL, v17, v19, v20, v21, v22, v23, v24, v18);
          uint64_t v25 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_fault_impl( &dword_186681000,  v25,  OS_LOG_TYPE_FAULT,  "CoreData: Cannot create objectID: got a 0 pk for entity: %@",  buf,  0xCu);
          }
        }

        else
        {
          __int128 v16 = (void *)objc_msgSend(*(id *)(a1 + 32), "newObjectIDForEntity:pk:", v9, objc_msgSend(v15, "longValue"));
          [v10 addObject:v16];
        }

        if ((unint64_t)[v10 count] >= 0x1F4)
        {
          uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
          *(void *)buf = 0LL;
          if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:]( *(void *)(a1 + 40),  v10,  *(void *)(a1 + 32),  *(void **)(a1 + 48),  (uint64_t)buf) & 1) == 0)
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = *(id *)buf;
          }

          objc_autoreleasePoolPop(v26);
        }

        if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [v10 count])
    {
      uint64_t v28 = (void *)MEMORY[0x186E3E5D8]();
      *(void *)buf = 0LL;
      if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:]( *(void *)(a1 + 40),  v10,  *(void *)(a1 + 32),  *(void **)(a1 + 48),  (uint64_t)buf) & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = *(id *)buf;
      }

      objc_autoreleasePoolPop(v28);
    }

    a4 = v39;
  }

  else
  {
    uint64_t v29 = [NSString stringWithUTF8String:"Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@"];
    _NSCoreDataLog(17LL, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
    __int128 v36 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = a2;
      __int16 v45 = 2112;
      uint64_t v46 = v37;
      __int16 v47 = 2112;
      uint64_t v48 = v38;
      _os_log_fault_impl( &dword_186681000,  v36,  OS_LOG_TYPE_FAULT,  "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@",  buf,  0x20u);
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

- (uint64_t)_purgeBatchOfObjectIDs:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v9 = -[NSFetchRequest initWithEntityName:]( [NSFetchRequest alloc],  "initWithEntityName:",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "anyObject"), "entity"), "name"));
  -[NSFetchRequest setPredicate:]( v9,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"SELF IN %@", a2]);
  id v10 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v9);
  -[NSBatchDeleteRequest setResultType:](v10, "setResultType:", 0LL);
  v13[0] = a3;
  -[NSPersistentStoreRequest setAffectedStores:]( v10,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1]);
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "executeRequest:error:", v10, a5), "result"), "BOOLValue");

  return v11;
}

- (uint64_t)_purgeObjectsMatchingFetchRequest:(void *)a3 fromStore:usingContext:error:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 1;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000LL;
  uint64_t v19 = __Block_byref_object_copy__30;
  uint64_t v20 = __Block_byref_object_dispose__30;
  uint64_t v21 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke;
  v15[3] = &unk_189EA8828;
  v15[4] = a2;
  v15[5] = &v16;
  v15[6] = &v22;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a1,  a2,  (uint64_t)v15);
  if (!*((_BYTE *)v23 + 24))
  {
    id v6 = (id)v17[5];
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
    }

    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v14 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v28 = 1024;
        int v29 = 542;
        _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v17[5] = 0LL;
  uint64_t v4 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v4;
}

uint64_t __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4,  _BYTE *a5)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(a1 + 32) deleteObject:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
        }

        while (v11 != v13);
        uint64_t v11 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v11);
    }

    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if ((_DWORD)result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        *a4 = 1;
        *a5 = 1;
      }
    }
  }

  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v12 setEncodedRecord:0];
          [v12 setCkRecordSystemFields:0];
          [v12 setCkShare:0];
        }

        uint64_t v9 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }

    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if ((_DWORD)result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        *a4 = 1;
      }
    }
  }

  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      uint64_t v11 = MEMORY[0x189604A80];
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(a2);
          }
          __int128 v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v13 setCkRecordSystemFields:0];
          [v13 setIsUploaded:v11];
        }

        uint64_t v9 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }

    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if ((_DWORD)result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        *a4 = 1;
      }
    }
  }

  return result;
}

- (BOOL)purgeMetadataAfterAccountChangeFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 inDatabaseWithScope:(void *)a5 error:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v27 = 0LL;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  uint64_t v24 = __Block_byref_object_copy__30;
  char v25 = __Block_byref_object_dispose__30;
  uint64_t v26 = 0LL;
  uint64_t v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  -[NSManagedObjectContext setTransactionAuthor:]( v8,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.reset");
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke;
  v20[3] = &unk_189EA9EB8;
  v20[4] = a2;
  v20[5] = v8;
  v20[6] = &v27;
  v20[7] = &v21;
  v20[8] = a4;
  -[NSManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v20);
  if (!*((_BYTE *)v28 + 24))
  {
    id v11 = (id)v22[5];
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
    }

    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v33 = 1024;
        int v34 = 795;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v22[5] = 0LL;
  BOOL v9 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke( uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  id v84 = 0LL;
  id v2 = (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  obuint64_t j = v2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v80 objects:v94 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v81;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v81 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x186E3E5D8]();
        else {
          uint64_t v9 = __ckLoggingOverride;
        }
        uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Removing rows after account change: %@"];
        [*(id *)(a1 + 40) transactionAuthor];
        [v7 name];
        _NSCoreDataLog( v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:err or:]_block_invoke");
        objc_autoreleasePoolPop(v8);
        uint64_t v17 = -[NSBatchDeleteRequest initWithFetchRequest:]( [NSBatchDeleteRequest alloc],  "initWithFetchRequest:",  +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  [v7 name]));
        uint64_t v93 = *(void *)(a1 + 32);
        -[NSPersistentStoreRequest setAffectedStores:]( v17,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v93 count:1]);
        -[NSBatchDeleteRequest setResultType:](v17, "setResultType:", 0LL);
        if ((objc_msgSend( (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", v17, &v84), "result"),  "BOOLValue") & 1) == 0)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;

          goto LABEL_14;
        }
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)deleteZoneMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 forRecordZones:(uint64_t)a5 inDatabaseWithScope:(void *)a6 error:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v29 = 0LL;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = __Block_byref_object_copy__30;
  uint64_t v27 = __Block_byref_object_dispose__30;
  uint64_t v28 = 0LL;
  uint64_t v10 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  -[NSManagedObjectContext setTransactionAuthor:]( v10,  "setTransactionAuthor:",  @"NSCloudKitMirroringDelegate.reset");
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke;
  v22[3] = &unk_189EA9B78;
  v22[4] = a4;
  v22[5] = a2;
  v22[6] = v10;
  v22[7] = &v29;
  v22[8] = &v23;
  v22[9] = a5;
  -[NSManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v22);
  if (!*((_BYTE *)v30 + 24))
  {
    id v13 = (id)v24[5];
    if (v13)
    {
      if (a6) {
        *a6 = v13;
      }
    }

    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v35 = 1024;
        int v36 = 849;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v24[5] = 0LL;
  BOOL v11 = *((_BYTE *)v30 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke( uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v34 = 0LL;
  id v2 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:*(void *)(a1 + 32)];
  if (![v2 count])
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge."];
    _NSCoreDataLog(17LL, v3, v4, v5, v6, v7, v8, v9, v29);
    uint64_t v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.",  buf,  2u);
    }
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v11 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
LABEL_6:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v2);
      }
      uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      uint64_t v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordZoneMetadata,  v15,  *(void *)(a1 + 72),  *(void *)(a1 + 40),  *(void **)(a1 + 48),  (uint64_t)&v34);
      if (v16)
      {
        uint64_t v17 = v16;
        if (objc_msgSend((id)-[NSManagedObject records](v16, "records"), "count"))
        {
          uint64_t v18 = [NSString stringWithUTF8String:"Attempting to delete a zone metadata that has records (%ld): %@ - %@"];
          uint64_t v19 = *(void *)(a1 + 72);
          [*(id *)(a1 + 40) URL];
          _NSCoreDataLog(17LL, v18, v20, v21, v22, v23, v24, v25, v19);
          uint64_t v26 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = *(void *)(a1 + 72);
            uint64_t v28 = [*(id *)(a1 + 40) URL];
            *(_DWORD *)buf = 134218498;
            uint64_t v36 = v27;
            __int16 v37 = 2112;
            uint64_t v38 = v28;
            __int16 v39 = 2112;
            __int128 v40 = v15;
            _os_log_fault_impl( &dword_186681000,  v26,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to delete a zone metadata that has records (%ld): %@ - %@",  buf,  0x20u);
          }
        }

        [*(id *)(a1 + 48) deleteObject:v17];
      }

      else if (v34)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      }

      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)
    || (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) save:&v34]) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v34;
  }
}

@end