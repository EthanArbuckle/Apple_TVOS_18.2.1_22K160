@interface PFCloudKitMetadataCache
- (PFCloudKitMetadataCache)init;
- (uint64_t)cacheMetadataForObjectsWithIDs:(uint64_t)a3 andRecordsWithIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 mirroringOptions:(void *)a7 error:;
- (uint64_t)recordMetadataForRecordID:(uint64_t)a1;
- (void)_addMirroredRelationshipMTMKey:(uint64_t)a3 forObjectWithID:(uint64_t)a4 andRelationshipName:;
- (void)cacheZoneMetadata:(uint64_t)a1;
- (void)dealloc;
- (void)registerRecordMetadata:(void *)a3 forObject:;
@end

@implementation PFCloudKitMetadataCache

- (PFCloudKitMetadataCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataCache;
  v2 = -[PFCloudKitMetadataCache init](&v4, sel_init);
  if (v2)
  {
    v2->_recordZoneIDToZoneMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_objectIDToRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_recordIDToMirroredRelationshipOrRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_zoneIDToMtmKeyToMirroredRelationship = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_objectIDToRelationshipNameToExistingMTMKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_objectIDToChangedPropertyKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_invalidatedMTMKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v2->_mutableZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  }

  return v2;
}

- (void)dealloc
{
  self->_recordZoneIDToZoneMetadata = 0LL;
  self->_objectIDToRecordMetadata = 0LL;

  self->_recordIDToMirroredRelationshipOrRecordMetadata = 0LL;
  self->_zoneIDToMtmKeyToMirroredRelationship = 0LL;

  self->_objectIDToRelationshipNameToExistingMTMKeys = 0LL;
  self->_objectIDToChangedPropertyKeys = 0LL;

  self->_invalidatedMTMKeys = 0LL;
  self->_mutableZoneIDs = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitMetadataCache;
  -[PFCloudKitMetadataCache dealloc](&v3, sel_dealloc);
}

- (uint64_t)cacheMetadataForObjectsWithIDs:(uint64_t)a3 andRecordsWithIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 mirroringOptions:(void *)a7 error:
{
  uint64_t v241 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v221 = 0LL;
  id v153 = objc_alloc_init(MEMORY[0x1896077E8]);
  v170 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  v156 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  id v171 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v172 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v173 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v174 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ([a2 count])
  {
    id v9 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKRecordMetadata,  a2,  a4,  a5,  &v221);
    v10 = v9;
    if (v9)
    {
      v220[0] = MEMORY[0x1895F87A8];
      v220[1] = 3221225472LL;
      v220[2] = __132__PFCloudKitMetadataCache_cacheMetadataForObjectsWithIDs_andRecordsWithIDs_inStore_withManagedObjectContext_mirroringOptions_error___block_invoke;
      v220[3] = &unk_189EAADE8;
      v220[4] = a1;
      v220[5] = v172;
      v220[6] = v173;
      v220[7] = v174;
      v220[8] = v156;
      v220[9] = v170;
      [v9 enumerateKeysAndObjectsUsingBlock:v220];
      int v157 = 1;
    }

    else
    {
      id v11 = v221;
      int v157 = 0;
    }
  }

  else
  {
    int v157 = 1;
  }

  if ([v156 count])
  {
    context = (void *)MEMORY[0x186E3E5D8]();
    id v12 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  (void *)[v156 allObjects],  a4,  a5,  &v221);
    v13 = v12;
    if (!v12)
    {
      int v157 = 0;
      id v25 = v221;
      goto LABEL_31;
    }

    __int128 v218 = 0u;
    __int128 v219 = 0u;
    __int128 v216 = 0u;
    __int128 v217 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v216 objects:v234 count:16];
    if (!v14) {
      goto LABEL_31;
    }
    id v166 = *(id *)v217;
    while (1)
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(id *)v217 != v166) {
          objc_enumerationMutation(v13);
        }
        v16 = *(void **)(*((void *)&v216 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x186E3E5D8]();
        v18 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v16);
        [a1[2] setObject:v16 forKey:v18];
        id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
        [a1[6] setObject:v19 forKey:v18];
        id v20 = (id)objc_msgSend(v172, "objectForKey:", objc_msgSend(v16, "entityId"));
        if (!v20)
        {
          id v20 = objc_alloc_init(MEMORY[0x189603FE0]);
          objc_msgSend(v172, "setObject:forKey:", v20, objc_msgSend(v16, "entityId"));
        }

        objc_msgSend(v20, "addObject:", objc_msgSend(v16, "entityPK"));

        v21 = (void *)[v16 lastExportedTransactionNumber];
        v22 = (void *)objc_msgSend(v173, "objectForKey:", objc_msgSend(v16, "entityId"));
        v23 = (void *)[v174 objectForKey:v18];
        if (v21)
        {
          if ([v22 compare:v21] != 1) {
            objc_msgSend(v173, "setObject:forKey:", v21, objc_msgSend(v16, "entityId"));
          }
          if ([v23 compare:v21] != 1) {
            goto LABEL_26;
          }
        }

        else
        {
          if (!v22) {
            objc_msgSend(v173, "setObject:forKey:", &unk_189F04560, objc_msgSend(v16, "entityId"));
          }
          if (!v23)
          {
            v21 = &unk_189F04560;
LABEL_26:
            [v174 setObject:v21 forKey:v18];
          }
        }

        v24 = (void *)-[NSCKRecordMetadata createRecordID](v16);
        [v170 addObject:v24];
        [a1[3] setObject:v16 forKey:v24];

        objc_autoreleasePoolPop(v17);
      }

      uint64_t v14 = [v13 countByEnumeratingWithState:&v216 objects:v234 count:16];
      if (!v14)
      {
LABEL_31:
        objc_autoreleasePoolPop(context);
        break;
      }
    }
  }

  if (!v157) {
    goto LABEL_102;
  }
  v26 = (void *)[v170 allObjects];
  id v27 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  MEMORY[0x189604A58],  v26,  (uint64_t)a4,  a5,  &v221);
  if (!v27)
  {
    LOBYTE(v157) = 0;
    id v92 = v221;
    goto LABEL_102;
  }

  id v167 = (id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel");
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  __int128 v212 = 0u;
  __int128 v213 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v212 objects:v233 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v213;
    do
    {
      for (uint64_t j = 0LL; j != v28; ++j)
      {
        if (*(void *)v213 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = *(void **)(*((void *)&v212 + 1) + 8 * j);
        v32 = (void *)MEMORY[0x186E3E5D8]();
        v33 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v167, "entitiesByName"),  "objectForKey:",  objc_msgSend(v31, "cdEntityName")),  "relationshipsByName"),  "objectForKey:",  objc_msgSend(v31, "relationshipName"));
        if (v33)
        {
          uint64_t v34 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]( (uint64_t)PFCloudKitSerializer,  [v31 recordName],  objc_msgSend(v31, "relatedRecordName"),  (uint64_t)v33,  objc_msgSend(v33, "inverseRelationship"));
          v35 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v31 recordZone]);
          if (objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34))
          {
            uint64_t v36 = [NSString stringWithUTF8String:"Already have a mirrored relationship registered for this key: %@\n%@\n%@"];
            objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34);
            _NSCoreDataLog(17LL, v36, v37, v38, v39, v40, v41, v42, v34);
            v43 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v48 = objc_msgSend((id)objc_msgSend(a1[4], "objectForKey:", v35), "objectForKey:", v34);
              *(_DWORD *)buf = 138412802;
              v236 = (const char *)v34;
              __int16 v237 = 2112;
              v238 = v31;
              __int16 v239 = 2112;
              uint64_t v240 = v48;
              _os_log_fault_impl( &dword_186681000,  v43,  OS_LOG_TYPE_FAULT,  "CoreData: Already have a mirrored relationship registered for this key: %@\n%@\n%@",  buf,  0x20u);
            }
          }

          id v44 = (id)[a1[4] objectForKey:v35];
          if (!v44)
          {
            id v44 = objc_alloc_init(MEMORY[0x189603FC8]);
            [a1[4] setObject:v44 forKey:v35];
          }

          [v44 setObject:v31 forKey:v34];

          v45 = -[NSCKMirroredRelationship createRecordID](v31);
          [a1[3] setObject:v31 forKey:v45];

          v46 = -[NSCKMirroredRelationship createRecordIDForRecord](v31);
          [v171 addObject:v46];

          v47 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v31);
          [v171 addObject:v47];
        }

        objc_autoreleasePoolPop(v32);
      }

      uint64_t v28 = [v27 countByEnumeratingWithState:&v212 objects:v233 count:16];
    }

    while (v28);
  }

  [v171 minusSet:v170];
  id v49 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]( (uint64_t)NSCKRecordMetadata,  (void *)[v171 allObjects],  a4,  a5,  &v221);
  v50 = v49;
  if (!v49)
  {
    LOBYTE(v157) = 0;
    id v93 = v221;
    goto LABEL_102;
  }

  __int128 v210 = 0u;
  __int128 v211 = 0u;
  __int128 v208 = 0u;
  __int128 v209 = 0u;
  uint64_t v51 = [v49 countByEnumeratingWithState:&v208 objects:v232 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v209;
    do
    {
      for (uint64_t k = 0LL; k != v51; ++k)
      {
        if (*(void *)v209 != v52) {
          objc_enumerationMutation(v50);
        }
        v54 = *(void **)(*((void *)&v208 + 1) + 8 * k);
        v55 = (void *)MEMORY[0x186E3E5D8]();
        v56 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v54);
        [a1[2] setObject:v54 forKey:v56];

        v57 = (void *)-[NSCKRecordMetadata createRecordID](v54);
        [a1[3] setObject:v54 forKey:v57];

        objc_autoreleasePoolPop(v55);
      }

      uint64_t v51 = [v50 countByEnumeratingWithState:&v208 objects:v232 count:16];
    }

    while (v51);
  }

  v58 = (void *)objc_msgSend((id)objc_msgSend(a4, "_persistentStoreCoordinator"), "managedObjectModel");
  __int128 v206 = 0u;
  __int128 v207 = 0u;
  __int128 v204 = 0u;
  __int128 v205 = 0u;
  obuint64_t j = a1[4];
  uint64_t v59 = [obj countByEnumeratingWithState:&v204 objects:v231 count:16];
  if (v59)
  {
    uint64_t v160 = *(void *)v205;
    do
    {
      v60 = 0LL;
      v162 = (char *)v59;
      do
      {
        if (*(void *)v205 != v160) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = *(void *)(*((void *)&v204 + 1) + 8LL * (void)v60);
        uint64_t v62 = MEMORY[0x186E3E5D8]();
        v63 = (void *)[a1[4] objectForKey:v61];
        contexta = (void *)v62;
        v168 = v60;
        __int128 v202 = 0u;
        __int128 v203 = 0u;
        __int128 v200 = 0u;
        __int128 v201 = 0u;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v200 objects:v230 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v201;
          do
          {
            for (uint64_t m = 0LL; m != v64; ++m)
            {
              if (*(void *)v201 != v65) {
                objc_enumerationMutation(v63);
              }
              uint64_t v67 = *(void *)(*((void *)&v200 + 1) + 8 * m);
              v68 = (void *)[v63 objectForKey:v67];
              v69 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v58, "entitiesByName"),  "objectForKey:",  objc_msgSend(v68, "cdEntityName")),  "relationshipsByName"),  "objectForKey:",  objc_msgSend(v68, "relationshipName"));
              v70 = -[NSCKMirroredRelationship createRecordIDForRecord](v68);
              v71 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)a1, (uint64_t)v70);
              if (v71)
              {
                v72 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v71);
                -[PFCloudKitMetadataCache _addMirroredRelationshipMTMKey:forObjectWithID:andRelationshipName:]( (uint64_t)a1,  v67,  (uint64_t)v72,  [v69 name]);
              }

              else
              {
                [a1[7] addObject:v67];
              }

              v73 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v68);
              v74 = (void *)-[PFCloudKitMetadataCache recordMetadataForRecordID:]((uint64_t)a1, (uint64_t)v73);
              if (v74)
              {
                v75 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v74);
                -[PFCloudKitMetadataCache _addMirroredRelationshipMTMKey:forObjectWithID:andRelationshipName:]( (uint64_t)a1,  v67,  (uint64_t)v75,  objc_msgSend((id)objc_msgSend(v69, "inverseRelationship"), "name"));
              }

              else
              {
                [a1[7] addObject:v67];
              }
            }

            uint64_t v64 = [v63 countByEnumeratingWithState:&v200 objects:v230 count:16];
          }

          while (v64);
        }

        objc_autoreleasePoolPop(contexta);
        v60 = v168 + 1;
      }

      while (v168 + 1 != v162);
      uint64_t v59 = [obj countByEnumeratingWithState:&v204 objects:v231 count:16];
    }

    while (v59);
  }

  v76 = (void *)MEMORY[0x186E3E5D8]();
  v77 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
  v229 = a4;
  -[NSFetchRequest setAffectedStores:]( v77,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v229 count:1]);
  v78 = (void *)[a5 executeFetchRequest:v77 error:&v221];
  v79 = v78;
  if (!v78)
  {
    LOBYTE(v157) = 0;
    id v94 = v221;
    goto LABEL_101;
  }

  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  uint64_t v80 = [v78 countByEnumeratingWithState:&v196 objects:v228 count:16];
  if (!v80) {
    goto LABEL_101;
  }
  uint64_t v81 = *(void *)v197;
  do
  {
    uint64_t v82 = 0LL;
    do
    {
      if (*(void *)v197 != v81) {
        objc_enumerationMutation(v79);
      }
      v83 = *(void **)(*((void *)&v196 + 1) + 8 * v82);
      v84 = (void *)MEMORY[0x186E3E5D8]();
      v85 = -[NSCKRecordZoneMetadata createRecordZoneID](v83);
      [a1[1] setObject:v83 forKey:v85];
      if (![v83 encodedShareData])
      {
        [a1[8] addObject:v85];
LABEL_90:

        int v89 = 1;
        goto LABEL_92;
      }

      if (a6) {
        uint64_t v86 = *(void *)(a6 + 136);
      }
      else {
        uint64_t v86 = 0LL;
      }
      v87 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( v86,  (void *)[v83 encodedShareData],  (char *)v85,  &v221);
      v88 = v87;
      if (v87)
      {
        if (objc_msgSend((id)objc_msgSend(v87, "currentUserParticipant"), "permission") != 2) {
          [a1[8] addObject:v85];
        }

        v85 = 0LL;
        goto LABEL_90;
      }

      id v90 = v221;
      LOBYTE(v157) = 0;

      int v89 = 0;
LABEL_92:
      objc_autoreleasePoolPop(v84);
      if (!v89) {
        goto LABEL_101;
      }
      ++v82;
    }

    while (v80 != v82);
    uint64_t v91 = [v79 countByEnumeratingWithState:&v196 objects:v228 count:16];
    uint64_t v80 = v91;
  }

  while (v91);
LABEL_101:
  objc_autoreleasePoolPop(v76);
  if ((v157 & 1) != 0)
  {
    id v169 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v194 = 0u;
    __int128 v195 = 0u;
    __int128 v192 = 0u;
    __int128 v193 = 0u;
    uint64_t v106 = [v172 countByEnumeratingWithState:&v192 objects:v227 count:16];
    if (v106)
    {
      uint64_t v107 = *(void *)v193;
      do
      {
        for (uint64_t n = 0LL; n != v106; ++n)
        {
          if (*(void *)v193 != v107) {
            objc_enumerationMutation(v172);
          }
          uint64_t v109 = *(void *)(*((void *)&v192 + 1) + 8 * n);
          v110 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v111 = [v173 objectForKey:v109];
          [v169 addObject:objc_msgSend( MEMORY[0x1896079C8], "predicateWithFormat:", @"TRANSACTIONID > %@ AND ENTITY = %@ AND ENTITYPK IN %@", v111, v109, objc_msgSend(v172, "objectForKey:", v109))];
          objc_autoreleasePoolPop(v110);
        }

        uint64_t v106 = [v172 countByEnumeratingWithState:&v192 objects:v227 count:16];
      }

      while (v106);
    }

    __int128 v190 = 0u;
    __int128 v191 = 0u;
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    uint64_t v112 = [v169 countByEnumeratingWithState:&v188 objects:v226 count:16];
    if (v112)
    {
      uint64_t v145 = *(void *)v189;
LABEL_120:
      uint64_t v148 = 0LL;
      uint64_t v144 = v112;
      while (1)
      {
        if (*(void *)v189 != v145) {
          objc_enumerationMutation(v169);
        }
        uint64_t v113 = *(void *)(*((void *)&v188 + 1) + 8 * v148);
        v146 = (void *)MEMORY[0x186E3E5D8]();
        v114 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  -[NSEntityDescription name]( +[NSPersistentHistoryChange entityDescription]( &OBJC_CLASS___NSPersistentHistoryChange,  "entityDescription"),  "name"));
        -[NSFetchRequest setPredicate:](v114, "setPredicate:", v113);
        v115 = +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryWithFetchRequest:",  v114);
        -[NSPersistentHistoryChangeRequest setResultType:](v115, "setResultType:", 5LL);
        -[NSPersistentHistoryChangeRequest setUseQueryGenerationToken:](v115, "setUseQueryGenerationToken:", 1LL);
        v225 = a4;
        -[NSPersistentStoreRequest setAffectedStores:]( v115,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v225 count:1]);
        v116 = (void *)[a5 executeRequest:v115 error:&v221];
        v117 = v116;
        if (v116)
        {
          v118 = (void *)[v116 result];
          __int128 v186 = 0u;
          __int128 v187 = 0u;
          __int128 v184 = 0u;
          __int128 v185 = 0u;
          uint64_t v119 = [v118 countByEnumeratingWithState:&v184 objects:v224 count:16];
          if (v119)
          {
            id v147 = v118;
            v143 = v117;
            uint64_t v152 = *(void *)v185;
            do
            {
              uint64_t v161 = 0LL;
              uint64_t v149 = v119;
              do
              {
                if (*(void *)v185 != v152) {
                  objc_enumerationMutation(v147);
                }
                v120 = *(void **)(*((void *)&v184 + 1) + 8 * v161);
                id obja = (id)MEMORY[0x186E3E5D8]();
                if (!+[PFCloudKitHistoryAnalyzer isPrivateTransaction:]( &OBJC_CLASS___PFCloudKitHistoryAnalyzer,  "isPrivateTransaction:",  v120))
                {
                  __int128 v182 = 0u;
                  __int128 v183 = 0u;
                  __int128 v180 = 0u;
                  __int128 v181 = 0u;
                  v121 = (void *)[v120 changes];
                  uint64_t v122 = [v121 countByEnumeratingWithState:&v180 objects:v223 count:16];
                  if (v122)
                  {
                    uint64_t v123 = *(void *)v181;
                    contextb = v121;
                    do
                    {
                      for (iuint64_t i = 0LL; ii != v122; ++ii)
                      {
                        if (*(void *)v181 != v123) {
                          objc_enumerationMutation(contextb);
                        }
                        v125 = *(void **)(*((void *)&v180 + 1) + 8 * ii);
                        v126 = (void *)MEMORY[0x186E3E5D8]();
                        v127 = (void *)objc_msgSend(v174, "objectForKey:", objc_msgSend(v125, "changedObjectID"));
                        if (!v127)
                        {
                          uint64_t v128 = [NSString stringWithUTF8String:"Didn't get a minimum transaction number for change: %@"];
                          _NSCoreDataLog(17LL, v128, v129, v130, v131, v132, v133, v134, (uint64_t)v125);
                          v135 = (os_log_s *)__pflogFaultLog;
                          v127 = &unk_189F04560;
                          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v236 = (const char *)v125;
                            _os_log_fault_impl( &dword_186681000,  v135,  OS_LOG_TYPE_FAULT,  "CoreData: Didn't get a minimum transaction number for change: %@",  buf,  0xCu);
                          }
                        }

                        uint64_t v136 = [v120 transactionNumber];
                        if (v136 >= [v127 integerValue])
                        {
                          v137 = (void *)objc_msgSend(a1[6], "objectForKey:", objc_msgSend(v125, "changedObjectID"));
                          if (v137)
                          {
                            __int128 v178 = 0u;
                            __int128 v179 = 0u;
                            __int128 v176 = 0u;
                            __int128 v177 = 0u;
                            v138 = (void *)[v125 updatedProperties];
                            uint64_t v139 = [v138 countByEnumeratingWithState:&v176 objects:v222 count:16];
                            if (v139)
                            {
                              uint64_t v140 = *(void *)v177;
                              do
                              {
                                for (juint64_t j = 0LL; jj != v139; ++jj)
                                {
                                  if (*(void *)v177 != v140) {
                                    objc_enumerationMutation(v138);
                                  }
                                  objc_msgSend( v137,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v176 + 1) + 8 * jj), "name"));
                                }

                                uint64_t v139 = [v138 countByEnumeratingWithState:&v176 objects:v222 count:16];
                              }

                              while (v139);
                            }
                          }
                        }

                        objc_autoreleasePoolPop(v126);
                      }

                      uint64_t v122 = [contextb countByEnumeratingWithState:&v180 objects:v223 count:16];
                    }

                    while (v122);
                  }
                }

                objc_autoreleasePoolPop(obja);
                ++v161;
              }

              while (v161 != v149);
              uint64_t v119 = [v147 countByEnumeratingWithState:&v184 objects:v224 count:16];
            }

            while (v119);
            v117 = v143;
          }
        }

        else
        {
          LOBYTE(v157) = 0;
          id v142 = v221;
        }

        objc_autoreleasePoolPop(v146);
        if (!v117) {
          break;
        }
        if (++v148 == v144)
        {
          uint64_t v112 = [v169 countByEnumeratingWithState:&v188 objects:v226 count:16];
          if (v112) {
            goto LABEL_120;
          }
          break;
        }
      }
    }
  }

  else
  {
LABEL_102:
    id v169 = 0LL;
  }

  uint64_t v95 = v157 & 1;
  [v153 drain];

  if ((v157 & 1) == 0)
  {
    id v96 = v221;
    if (v96)
    {
      if (a7) {
        *a7 = v96;
      }
    }

    else
    {
      uint64_t v97 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataCache.m");
      v104 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v236 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataCache.m";
        __int16 v237 = 1024;
        LODWORD(v238) = 419;
        _os_log_fault_impl( &dword_186681000,  v104,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v95;
}

void __132__PFCloudKitMetadataCache_cacheMetadataForObjectsWithIDs_andRecordsWithIDs_inStore_withManagedObjectContext_mirroringOptions_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v12 = (id)-[NSCKRecordMetadata createRecordID](a3);
  id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v6 forKey:a2];

  id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(a3, "entityId"));
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, objc_msgSend(a3, "entityId"));
  }

  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "entityPK"));

  v8 = (void *)[a3 lastExportedTransactionNumber];
  id v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", objc_msgSend(a3, "entityId"));
  uint64_t v10 = [*(id *)(a1 + 56) objectForKey:a2];
  id v11 = (void *)v10;
  if (!v8)
  {
    if (v9)
    {
      if (v10) {
        goto LABEL_14;
      }
    }

    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", &unk_189F04560, objc_msgSend(a3, "entityId"));
      if (v11) {
        goto LABEL_14;
      }
    }

    v8 = &unk_189F04560;
LABEL_13:
    [*(id *)(a1 + 56) setObject:v8 forKey:a2];
    goto LABEL_14;
  }

  if ([v9 compare:v8] != 1) {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, objc_msgSend(a3, "entityId"));
  }
  if ([v11 compare:v8] != 1) {
    goto LABEL_13;
  }
LABEL_14:
  [*(id *)(a1 + 64) removeObject:v12];
  [*(id *)(a1 + 72) addObject:v12];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:a3 forKey:v12];
}

- (uint64_t)recordMetadataForRecordID:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = [*(id *)(a1 + 24) objectForKey:a2];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = [NSString stringWithUTF8String:"Expected to get an instance of NSCKRecordMetadata for this recordID: %@ but got: %@"];
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, a2);
      id v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = a2;
        __int16 v15 = 2112;
        uint64_t v16 = v3;
        _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Expected to get an instance of NSCKRecordMetadata for this recordID: %@ but got: %@",  buf,  0x16u);
      }
    }
  }

  return v3;
}

- (void)_addMirroredRelationshipMTMKey:(uint64_t)a3 forObjectWithID:(uint64_t)a4 andRelationshipName:
{
  id v8 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:"), "objectForKey:", a4);
  if (!v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v9 = (id)[*(id *)(a1 + 40) objectForKey:a3];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
      [*(id *)(a1 + 40) setObject:v9 forKey:a3];
    }

    [v9 setObject:v10 forKey:a4];

    id v8 = v10;
  }

  id v11 = v8;
  [v8 addObject:a2];
}

- (void)registerRecordMetadata:(void *)a3 forObject:
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", a2, objc_msgSend(a3, "objectID"));
    id v5 = (id)-[NSCKRecordMetadata createRecordID](a2);
    [*(id *)(a1 + 24) setObject:a2 forKey:v5];
  }

- (void)cacheZoneMetadata:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = -[NSCKRecordZoneMetadata createRecordZoneID](a2);
    if ([*(id *)(a1 + 8) objectForKey:v4])
    {
      uint64_t v5 = [NSString stringWithUTF8String:"Attempting to cache zone metadata but already have one: %@\n%@"];
      _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, (uint64_t)a2);
      id v12 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = *(void *)(a1 + 8);
        *(_DWORD *)buf = 138412546;
        __int16 v15 = a2;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: Attempting to cache zone metadata but already have one: %@\n%@",  buf,  0x16u);
      }
    }

    [*(id *)(a1 + 8) setObject:a2 forKey:v4];
  }

@end