@interface NSSQLSavePlan
- (id)_correlationTableUpdateTrackerForRelationship:(uint64_t)a1;
- (id)_newRowCacheRowForToManyUpdatesForRelationship:(void *)a3 rowCacheOriginal:(void *)a4 originalOrderKeys:(void *)a5 originalSnapshot:(char *)a6 value:(void *)a7 added:(void *)a8 deleted:(char *)a9 sourceRowPK:(void *)a10 properties:(void *)a11 sourceObject:(void *)a12 newIndexes:(void *)a13 reorderedIndexes:;
- (id)initForRequestContext:(id)a3;
- (id)newObjectsForExhaustiveLockConflictDetection;
- (id)newObjectsForUniquenessConflictDetectionGivenReportedFailures:(uint64_t)a1;
- (uint64_t)_addFileBackedFutureToDelete:(uint64_t)a1;
- (uint64_t)_createRowsForSave;
- (uint64_t)_registerChangedFOKs:(uint64_t)a3 deletions:(const void *)a4 forSourceObject:(void *)a5 andRelationship:;
- (uint64_t)newCorrelationTableUpdates;
- (uint64_t)newInsertedRows;
- (void)_computeUpdatedRowSplit;
- (void)_createCorrelationTrackerUpdatesForDeletedObject:(uint64_t)a1;
- (void)_findOrCreateChangeSnapshotForGlobalID:(uint64_t)a1;
- (void)_populateOrderKeysInOrderedSet:(uint64_t)a3 usingSourceObjectID:(void *)a4 inverseRelationship:(void *)a5 newIndexes:(void *)a6 reorderedIndexes:;
- (void)_populateRow:(_BYTE *)a3 fromObject:(int)a4 timestamp:(_BYTE *)a5 inserted:(double)a6 shouldAddToRowCache:;
- (void)_prepareForDeletionOfDatabaseExternalPropertiesForObject:(uint64_t)a1;
- (void)_recordToManyChangesForObject:(uint64_t)a3 inRow:(int)a4 usingTimestamp:(double)a5 inserted:;
- (void)dealloc;
- (void)newObjectsForFastLockConflictDetection;
@end

@implementation NSSQLSavePlan

- (void)_populateOrderKeysInOrderedSet:(uint64_t)a3 usingSourceObjectID:(void *)a4 inverseRelationship:(void *)a5 newIndexes:(void *)a6 reorderedIndexes:
{
  v31[2] = *MEMORY[0x1895F89C0];
  if (!a2 || a6 || a5 || !*(void *)(a2 + 32))
  {
    if (a4) {
      uint64_t v11 = [a4 propertyDescription];
    }
    else {
      uint64_t v11 = 0LL;
    }
    v12 = objc_alloc(&OBJC_CLASS___NSSQLRelationshipFaultRequestContext);
    uint64_t v13 = *(void *)(a1 + 8);
    if (v13)
    {
      uint64_t v14 = *(void *)(v13 + 32);
      uint64_t v15 = *(void *)(v13 + 8);
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
    }

    uint64_t v16 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:]( v12,  "initWithObjectID:relationship:context:sqlCore:",  a3,  v11,  v14,  v15);
    -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v16, 0LL);
    uint64_t v17 = *(void *)(a1 + 8);
    if (v17) {
      uint64_t v18 = *(void *)(v17 + 8);
    }
    else {
      uint64_t v18 = 0LL;
    }
    -[NSSQLCore dispatchRequest:withRetries:](v18, (void *)v16, 0LL);
    id v19 = (id)[(id)v16 result];
    if (v16 && (v20 = *(void **)(v16 + 40)) != 0LL)
    {
      id v24 = v20;
      uint64_t v25 = [v24 code];
      uint64_t v26 = [v24 description];
      v30[0] = [v24 domain];
      uint64_t v27 = objc_msgSend(MEMORY[0x189607968], "numberWithLong:", objc_msgSend(v24, "code"));
      v30[1] = *MEMORY[0x189607798];
      v31[0] = v27;
      v31[1] = v24;
      v28 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:2];
      id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  v25,  v26,  v28);
      objc_exception_throw(v29);
      __break(1u);
    }

    else
    {

      BOOL v21 = [v19 count] == 2;
      v22 = (void *)[v19 firstObject];
      if (v21) {
        v23 = (void *)[v19 lastObject];
      }
      else {
        v23 = (void *)NSOrderedSet_EmptyOrderedSet;
      }
      -[_NSFaultingMutableOrderedSet _populateOrderKeysUsingSnapshot:orderKeys:newIndexes:reorderedIndexes:]( a2,  v22,  v23,  a5,  a6);
    }
  }

- (uint64_t)_registerChangedFOKs:(uint64_t)a3 deletions:(const void *)a4 forSourceObject:(void *)a5 andRelationship:
{
  uint64_t v8 = result;
  if (a2)
  {
    id v10 = (id)[*(id *)(result + 80) objectForKey:a4];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 80), a4, v10);
    }

    result = objc_msgSend(v10, "setValue:forKey:", a2, objc_msgSend(a5, "name"));
  }

  if (a3)
  {
    id v11 = (id)[*(id *)(v8 + 88) objectForKey:a4];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 88), a4, v11);
    }

    return objc_msgSend(v11, "setValue:forKey:", a3, objc_msgSend(a5, "name"));
  }

  return result;
}

- (id)_newRowCacheRowForToManyUpdatesForRelationship:(void *)a3 rowCacheOriginal:(void *)a4 originalOrderKeys:(void *)a5 originalSnapshot:(char *)a6 value:(void *)a7 added:(void *)a8 deleted:(char *)a9 sourceRowPK:(void *)a10 properties:(void *)a11 sourceObject:(void *)a12 newIndexes:(void *)a13 reorderedIndexes:
{
  v233 = a6;
  uint64_t v256 = *MEMORY[0x1895F89C0];
  id v219 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v224 = a11;
  id v226 = (id)[a11 objectID];
  unint64_t v20 = [a7 count];
  v222 = a8;
  unint64_t v230 = [a8 count];
  v223 = a2;
  int v21 = [a2 isOrdered];
  if (!a3)
  {
    uint64_t v208 = *MEMORY[0x189603A58];
    v209 = (void *)MEMORY[0x189603F68];
    uint64_t v210 = [MEMORY[0x189607968] numberWithInt:134030];
    id v211 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v208,  134030,  (uint64_t)@"Invalid rowCache row is nil",  (void *)[v209 dictionaryWithObject:v210 forKey:*MEMORY[0x189607460]]);
    objc_exception_throw(v211);
  }

  int v22 = v21;
  if (v21)
  {
    id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
  }

  else if ([a3 isNSArray])
  {
    id v23 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  }

  else
  {
    id v23 = (id)[a3 mutableCopy];
  }

  id v235 = v23;
  id v221 = a10;
  uint64_t v220 = [a3 count];
  MEMORY[0x1895F8858](v220);
  uint64_t v26 = (char *)&v212 - v25;
  unint64_t v218 = v27;
  if (v27 > 0x200)
  {
    uint64_t v28 = NSAllocateScannedUncollectable();
    uint64_t v26 = (char *)v28;
  }

  else
  {
    bzero((char *)&v212 - v25, 8 * v24);
  }

  int v229 = v22;
  v228 = v26;
  if (!v22)
  {
    if (v20)
    {
      MEMORY[0x1895F8858](v28);
      v32 = (char *)&v212 - v31;
      v33 = v26;
      if (v20 > 0x200) {
        v32 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v212 - v31, 8 * v20);
      }
      [a7 getObjects:v32];
      uint64_t v34 = 0LL;
      for (uint64_t i = 0LL; i != v20; ++i)
      {
        uint64_t v36 = [*(id *)&v32[8 * i] objectID];
        if (v36) {
          *(void *)&v33[8 * v34++] = v36;
        }
      }

      BOOL v37 = v20 < 0x201;
      v38 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v33 count:v34];
      [v235 addObjectsFromArray:v38];

      if (!v37) {
        NSZoneFree(0LL, v32);
      }
      uint64_t v26 = v33;
    }

    goto LABEL_216;
  }

  v227 = a13;
  v217 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, a5);
  if (([a3 isNSArray] & 1) == 0) {
    a3 = (void *)[a3 array];
  }
  if ([a3 isEqual:v217])
  {
    uint64_t v29 = [v223 name];
    v30 = (void *)[v221 objectForKey:v29];
    if ((*(_BYTE *)(a1 + 148) & 1) != 0) {
      id v234 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    else {
      id v234 = 0LL;
    }
    v39 = v227;
    id v215 = objc_alloc_init(MEMORY[0x189603FA8]);
    if ([v30 isToMany])
    {
      if (v30 && (uint64_t v40 = v30[7]) != 0) {
        v41 = *(void **)(v40 + 80);
      }
      else {
        v41 = 0LL;
      }
      LODWORD(v231) = [v41 slot];
    }

    else
    {
      LODWORD(v231) = 0;
    }

    size_t v54 = [v233 count];
    v55 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v55 = malloc_default_zone();
    }
    *v39 = malloc_zone_calloc(v55, v54, 1uLL);
    v56 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v56 = malloc_default_zone();
    }
    *a12 = malloc_zone_calloc(v56, v54, 8uLL);
    v57 = v233;
    id v225 = v30;
    -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:]( a1,  (uint64_t)v233,  (uint64_t)v226,  v30,  (void **)a12,  v39);
    v227 = (void **)[v57 count];
    id v58 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v248 = 0u;
    __int128 v249 = 0u;
    __int128 v250 = 0u;
    __int128 v251 = 0u;
    uint64_t v59 = [v57 countByEnumeratingWithState:&v248 objects:v255 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v249;
      do
      {
        for (uint64_t j = 0LL; j != v59; ++j)
        {
          if (*(void *)v249 != v60) {
            objc_enumerationMutation(v233);
          }
          uint64_t v62 = [*(id *)(*((void *)&v248 + 1) + 8 * j) objectID];
          [v235 addObject:v62];
        }

        uint64_t v59 = [v233 countByEnumeratingWithState:&v248 objects:v255 count:16];
      }

      while (v59);
    }

    if ([v225 isToMany])
    {
      if (v227)
      {
        for (k = 0LL; k != v227; k = (void **)((char *)k + 1))
        {
          v64 = (void *)MEMORY[0x186E3E5D8]();
          v65 = (const void *)objc_msgSend((id)objc_msgSend(v233, "objectAtIndex:", k), "objectID");
          if (!-[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v65)) {
            [v58 addObject:v65];
          }
          objc_autoreleasePoolPop(v64);
        }
      }

      id v232 = objc_alloc_init(MEMORY[0x189603FC8]);
      if ([v58 count])
      {
        v66 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        -[NSFetchRequest setEntity:]( v66,  "setEntity:",  objc_msgSend((id)objc_msgSend(v225, "destinationEntity"), "entityDescription"));
        -[NSFetchRequest setPredicate:]( v66,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", v58]);
        -[NSFetchRequest setAllocationType:](v66, "setAllocationType:", 1LL);
        -[NSFetchRequest setResultType:](v66, "setResultType:", 2LL);
        v67 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
        -[NSPropertyDescription setName:](v67, "setName:", @"self");
        -[NSExpressionDescription setExpression:]( v67,  "setExpression:",  [MEMORY[0x189607878] expressionForEvaluatedObject]);
        -[NSExpressionDescription setExpressionResultType:](v67, "setExpressionResultType:", 2000LL);
        v68 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
        -[NSPropertyDescription setName:](v68, "setName:", @"fok");
        if (v225 && (uint64_t v69 = *((void *)v225 + 7)) != 0) {
          v70 = *(void **)(v69 + 80);
        }
        else {
          v70 = 0LL;
        }
        uint64_t v71 = [v70 name];
        -[NSExpressionDescription setExpression:]( v68,  "setExpression:",  [MEMORY[0x189607878] expressionForKeyPath:v71]);
        -[NSExpressionDescription setExpressionResultType:](v68, "setExpressionResultType:", 200LL);
        -[NSFetchRequest setPropertiesToFetch:]( v66,  "setPropertiesToFetch:",  objc_msgSend(MEMORY[0x189603FA8], "arrayWithObjects:", v67, v68, 0));
        v72 = objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext);
        uint64_t v73 = *(void *)(a1 + 8);
        if (v73)
        {
          uint64_t v74 = *(void *)(v73 + 32);
          uint64_t v75 = *(void *)(v73 + 8);
        }

        else
        {
          uint64_t v74 = 0LL;
          uint64_t v75 = 0LL;
        }

        v76 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( v72,  "initWithRequest:context:sqlCore:",  v66,  v74,  v75);
        -[NSSQLStoreRequestContext setQueryGenerationToken:](v76, 0LL);
        uint64_t v77 = *(void *)(a1 + 8);
        if (v77) {
          uint64_t v78 = *(void *)(v77 + 8);
        }
        else {
          uint64_t v78 = 0LL;
        }
        -[NSSQLCore dispatchRequest:withRetries:](v78, v76, 0LL);
        id v79 = (id)[v76 result];

        __int128 v246 = 0u;
        __int128 v247 = 0u;
        __int128 v244 = 0u;
        __int128 v245 = 0u;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v244 objects:v254 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v245;
          do
          {
            for (uint64_t m = 0LL; m != v80; ++m)
            {
              if (*(void *)v245 != v81) {
                objc_enumerationMutation(v79);
              }
              v83 = *(void **)(*((void *)&v244 + 1) + 8 * m);
              uint64_t v84 = [v83 objectForKey:@"self"];
              [v232 setObject:v83 forKey:v84];
            }

            uint64_t v80 = [v79 countByEnumeratingWithState:&v244 objects:v254 count:16];
          }

          while (v80);
        }

        id v58 = 0LL;
      }
    }

    else
    {
      id v232 = 0LL;
    }

    if ([v225 isToMany])
    {
      id v214 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v87 = objc_alloc_init(MEMORY[0x189603FC8]);
      if (v227)
      {
        uint64_t v88 = 0LL;
        unint64_t v216 = v231;
        while (1)
        {
          v89 = (void *)MEMORY[0x186E3E5D8]();
          v90 = (void *)[v233 objectAtIndex:v88];
          v91 = (const void *)[v90 objectID];
          v92 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v91);
          v93 = v92 ? 0 : (void *)[v232 objectForKey:v91];
          -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:]( a1,  (uint64_t)v233,  (uint64_t)v226,  v225,  0LL,  0LL);
          uint64_t v94 = -[_NSFaultingMutableOrderedSet _orderKeyForObject:]((uint64_t)v233, (uint64_t)v90);
          uint64_t v95 = v94;
          if (v92) {
            break;
          }
          if (objc_msgSend((id)objc_msgSend(v93, "objectForKey:", @"fok"), "intValue") != (_DWORD)v94)
          {
            [v214 addObject:v91];
LABEL_90:
            objc_msgSend( v87,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v95),  v91);
          }

- (id)_correlationTableUpdateTrackerForRelationship:(uint64_t)a1
{
  v4 = (const void *)[a2 correlationTableName];
  id Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v4);
  if (!Value)
  {
    id Value = -[NSSQLCorrelationTableUpdateTracker initForRelationship:]( objc_alloc(&OBJC_CLASS___NSSQLCorrelationTableUpdateTracker),  "initForRelationship:",  a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, Value);
  }

  return Value;
}

- (void)_recordToManyChangesForObject:(uint64_t)a3 inRow:(int)a4 usingTimestamp:(double)a5 inserted:
{
  int v165 = a4;
  uint64_t v176 = a1;
  uint64_t v191 = *MEMORY[0x1895F89C0];
  uint64_t v153 = [(id)a2 managedObjectContext];
  uint64_t v167 = (unint64_t *)[(id)a2 entity];
  if (v167)
  {
    uint64_t v164 = [(id)v167[13] keys];
    uint64_t v8 = v167;
    uint64_t v166 = (void *)v167[14];
  }

  else
  {
    uint64_t v164 = [0 keys];
    uint64_t v8 = 0LL;
    uint64_t v166 = 0LL;
  }

  uint64_t v163 = _kvcPropertysPrimitiveGetters(v8);
  if ((*(_BYTE *)(a2 + 17) & 0x80) != 0) {
    [(id)a2 willAccessValueForKey:0];
  }
  v155 = (void *)[(id)a3 objectID];
  if (a3
    && (*(_BYTE *)(a3 + 16) & 1) == 0
    && (uint64_t v9 = [*(id *)(*(void *)(a3 + 40) + 16) _storeInfo1]) != 0)
  {
    int v150 = 0;
    uint64_t v149 = v9;
    v157 = *(void **)(v9 + 40);
  }

  else
  {
    uint64_t v149 = 0LL;
    v157 = 0LL;
    int v150 = 1;
  }

  v159 = (void *)a3;
  uint64_t v10 = *(void *)(a2 + 48);
  if (v10) {
    id v11 = *(void **)(v10 + 8);
  }
  else {
    id v11 = 0LL;
  }
  uint64_t v156 = [v11 values];
  if (!v156) {
    return;
  }
  v158 = (void *)[MEMORY[0x189603FE8] null];
  uint64_t v172 = v159 ? (char *)[*(id *)(v159[5] + 16) _referenceData64] : 0;
  unint64_t v12 = v166[18];
  unint64_t v13 = v166[19] + v12;
  unint64_t v178 = v12;
  unint64_t v162 = v13;
  if (v12 >= v13) {
    return;
  }
  int v14 = v165;
  if (!v159) {
    int v14 = 0;
  }
  int v154 = v14;
  uint64_t v15 = *MEMORY[0x189603A58];
  uint64_t v147 = *MEMORY[0x189607798];
  uint64_t v148 = v15;
  do
  {
    v170 = (void *)MEMORY[0x186E3E5D8]();
    v173 = *(void ***)(v164 + 8 * v178);
    id v174 = -[NSEntityDescription _relationshipNamed:](v167, (uint64_t)v173);
    unint64_t v20 = v166[16];
    BOOL v22 = v178 >= v20;
    unint64_t v21 = v178 - v20;
    BOOL v22 = !v22 || v21 >= v166[17];
    int v23 = !v22;
    LODWORD(v175) = v23;
    _PF_Handler_Primitive_GetProperty((id **)a2, v178, (uint64_t)v173, *(void *)(v163 + 8 * v178), v16, v17, v18, v19);
    uint64_t v25 = v24;
    if (v165)
    {
      uint64_t v26 = &NSOrderedSet_EmptyOrderedSet;
      if (!(_DWORD)v175) {
        uint64_t v26 = &NSSet_EmptySet;
      }
      unint64_t v27 = (void *)*v26;
    }

    else
    {
      unint64_t v27 = *(void **)(v156 + 8 * v178);
    }

    uint64_t v171 = v27;
    if (v24 == v27 || ([v24 isFault] & 1) != 0) {
      goto LABEL_214;
    }
    if (v158 == v25 || ![v25 count])
    {
      id v30 = (id)NSSet_EmptySet;
      if (v158 != v171 && [v171 count])
      {
        unint64_t v31 = [v171 count];
        unint64_t v32 = MEMORY[0x1895F8858](v31);
        v35 = (char *)&v147 - v34;
        if (v32 > 0x200) {
          v35 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v147 - v34, 8 * v33);
        }
        [v171 getObjects:v35];
        id v168 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v35 count:v31];
        if (v31 >= 0x201) {
          NSZoneFree(0LL, v35);
        }
        goto LABEL_53;
      }

      goto LABEL_49;
    }

    unint64_t v28 = [v25 count];
    uint64_t v29 = (uint64_t)v171;
    if (v158 == v171 || (uint64_t v29 = [v171 count]) == 0)
    {
      MEMORY[0x1895F8858](v29);
      v38 = (char *)&v147 - v37;
      if (v28 > 0x200) {
        v38 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v147 - v37, 8 * v36);
      }
      [v25 getObjects:v38];
      id v30 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v38 count:v28];
      if (v28 >= 0x201) {
        NSZoneFree(0LL, v38);
      }
LABEL_49:
      id v168 = (id)NSSet_EmptySet;
      goto LABEL_53;
    }

    id v168 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v171, v25);
    id v30 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)&OBJC_CLASS____PFRoutines, v25, v171);
LABEL_53:
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    uint64_t v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v181, v190, 16, v147);
    if (!v39) {
      goto LABEL_61;
    }
    uint64_t v40 = *(void *)v182;
    do
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v182 != v40) {
          objc_enumerationMutation(v30);
        }
        v42 = *(void **)(*((void *)&v181 + 1) + 8 * i);
        uint64_t v43 = objc_msgSend((id)objc_msgSend(v42, "objectID"), "persistentStore");
        if (v43 != objc_msgSend((id)objc_msgSend((id)a2, "objectID"), "persistentStore"))
        {
          uint64_t v132 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  a2,  @"Source object",  v42,  @"Destination Object",  v174,  @"Relationship",  0);
          id v133 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  133010LL,  (uint64_t)@"CoreData does not support persistent cross-store relationships",  v132);

          objc_exception_throw(v133);
          goto LABEL_229;
        }
      }

      uint64_t v39 = [v30 countByEnumeratingWithState:&v181 objects:v190 count:16];
    }

    while (v39);
LABEL_61:
    if ([v30 count]) {
      goto LABEL_85;
    }
    uint64_t v44 = [v168 count];
    if (v44) {
      int v45 = 0;
    }
    else {
      int v45 = (int)v175;
    }
    if (v45 != 1)
    {
      if (!v44) {
        goto LABEL_78;
      }
LABEL_85:
      if (v154 && *(_DWORD *)(v159[5] + 12LL) == 1)
      {
        id v160 = (id)NSArray_EmptyArray;
        if ((v175 & 1) != 0)
        {
          id v161 = (id)NSArray_EmptyArray;
          v179 = 0LL;
          uint64_t v180 = 0LL;
          id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:]( v176,  v174,  v160,  v161,  v171,  (char *)v25,  v30,  v168,  v172,  v157,  (void *)a2,  (void **)&v180,  (void **)&v179);
          goto LABEL_103;
        }

        v179 = 0LL;
        uint64_t v180 = 0LL;
        id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:]( v176,  v174,  v160,  0LL,  v171,  (char *)v25,  v30,  v168,  v172,  v157,  (void *)a2,  (void **)&v180,  (void **)&v179);
        id v161 = 0LL;
      }

      else
      {
        v55 = objc_alloc(&OBJC_CLASS___NSSQLRelationshipFaultRequestContext);
        uint64_t v56 = *(void *)(v176 + 8);
        if (v56) {
          uint64_t v57 = *(void *)(v56 + 8);
        }
        else {
          uint64_t v57 = 0LL;
        }
        uint64_t v58 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:]( v55,  "initWithObjectID:relationship:context:sqlCore:",  v155,  v174,  v153,  v57);
        -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v58, 0LL);
        uint64_t v59 = *(void *)(v176 + 8);
        if (v59) {
          uint64_t v60 = *(void *)(v59 + 8);
        }
        else {
          uint64_t v60 = 0LL;
        }
        -[NSSQLCore dispatchRequest:withRetries:](v60, (void *)v58, 0LL);
        v61 = (void *)[(id)v58 result];
        id v62 = v61;
        if (v58)
        {
          v63 = *(void **)(v58 + 40);
          if (v63)
          {
            id v125 = v63;
            uint64_t v126 = [v125 code];
            uint64_t v127 = [v125 description];
            v188[0] = [v125 domain];
            id v177 = (id)MEMORY[0x189607968];
            uint64_t v128 = [v125 code];
            uint64_t v129 = [v177 numberWithLong:v128];
            v188[1] = v147;
            v189[0] = v129;
            v189[1] = v125;
            id v130 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v189 forKeys:v188 count:2];
            id v131 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v148,  v126,  v127,  v130);
            objc_exception_throw(v131);
LABEL_229:
            __break(1u);
            return;
          }
        }

        if ([v61 count]) {
          id v160 = (id)[v61 firstObject];
        }
        else {
          id v160 = 0LL;
        }
        if ((_DWORD)v175) {
          id v161 = (id)[v61 lastObject];
        }
        else {
          id v161 = 0LL;
        }

        if (!v160)
        {
          if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") < 2)
          {
            if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
              _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  Original row was missing while recording to-many changes.",  v140,  v141,  v142,  v143,  v144,  v145,  (uint64_t)v155);
            }
          }

          else
          {
            _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  Original row was missing while recording to-many changes.  New row = %@",  v134,  v135,  v136,  v137,  v138,  v139,  (uint64_t)v155);
          }

          uint64_t v185 = v155;
          unint64_t v186 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
          uint64_t v187 = [MEMORY[0x189603F18] arrayWithObjects:&v185 count:1];
          uint64_t v146 = [MEMORY[0x189603F68] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
          objc_exception_throw( +[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:]( &OBJC_CLASS____NSCoreDataOptimisticLockingException,  "exceptionWithName:reason:userInfo:",  v148,  @"optimistic locking failure",  v146));
          goto LABEL_229;
        }

        v179 = 0LL;
        uint64_t v180 = 0LL;
        id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:]( v176,  v174,  v160,  v161,  v171,  (char *)v25,  v30,  v168,  v172,  v157,  (void *)a2,  (void **)&v180,  (void **)&v179);
        if ((_DWORD)v175)
        {
LABEL_103:
          uint64_t v64 = [v169 count];
          if (v64)
          {
            id v177 = objc_alloc_init(MEMORY[0x189603FA8]);
            for (uint64_t j = 0LL; j != v64; ++j)
            {
              uint64_t v66 = [MEMORY[0x189607968] numberWithUnsignedInteger:v180[j]];
              [v177 addObject:v66];
            }

            -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
            if (!(_DWORD)v175)
            {
LABEL_112:
              v173 = (void **)[v157 objectForKey:v173];
              uint64_t v67 = [v174 inverseRelationship];
              v68 = v173;
              if (!v67)
              {
                if (v173) {
                  uint64_t v69 = v173[7];
                }
                else {
                  uint64_t v69 = 0LL;
                }
                uint64_t v70 = objc_msgSend((id)objc_msgSend(v69, "foreignKey"), "slot");
                else {
                  uint64_t v72 = 0LL;
                }
                uint64_t v73 = [v30 count];
                unint64_t v74 = [v169 count];
                char v151 = &v147;
                MEMORY[0x1895F8858](v74);
                uint64_t v77 = (char *)&v147 - v76;
                unint64_t v152 = v78;
                if (v78 > 0x200) {
                  uint64_t v77 = (char *)NSAllocateScannedUncollectable();
                }
                else {
                  bzero((char *)&v147 - v76, 8 * v75);
                }
                if ((_DWORD)v175)
                {
                  uint64_t v79 = [v169 getObjects:v77];
                  if (v74)
                  {
                    for (uint64_t k = 0LL; k != v74; ++k)
                    {
                      uint64_t v81 = (void *)MEMORY[0x186E3E5D8](v79);
                      if (v179[k])
                      {
                        v82 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, *(void **)&v77[8 * k]);
                        [v82 setForeignKeySlot:v70 int64:v172];
                        [v82 setForeignOrderKeySlot:v72 orderKey:v180[k]];
                      }

                      objc_autoreleasePoolPop(v81);
                    }
                  }
                }

                else
                {
                  uint64_t v83 = [v30 getObjects:v77];
                  if (v73)
                  {
                    uint64_t v84 = (id *)v77;
                    do
                    {
                      id v85 = (void *)MEMORY[0x186E3E5D8](v83);
                      id v86 = (void *)[*v84 objectID];
                      id v87 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v86);
                      [v87 setForeignKeySlot:v70 int64:v172];
                      objc_autoreleasePoolPop(v85);
                      ++v84;
                      --v73;
                    }

                    while (v73);
                  }
                }

                if (v152 >= 0x201) {
                  NSZoneFree(0LL, v77);
                }
                unint64_t v88 = [v168 count];
                unint64_t v89 = v88;
                if (v88 <= v74) {
                  unint64_t v90 = v74;
                }
                else {
                  unint64_t v90 = v88;
                }
                MEMORY[0x1895F8858](v88);
                v93 = (id *)((char *)&v147 - v92);
                if (v90 > 0x200) {
                  v93 = (id *)NSAllocateScannedUncollectable();
                }
                else {
                  bzero((char *)&v147 - v92, 8 * v91);
                }
                if ((v175 & 1) == 0)
                {
                  uint64_t v94 = [v168 getObjects:v93];
                  if (v89)
                  {
                    uint64_t v95 = v93;
                    do
                    {
                      v96 = (void *)MEMORY[0x186E3E5D8](v94);
                      v97 = (void *)[*v95 objectID];
                      objc_msgSend( -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v97),  "setForeignKeySlot:int64:",  v70,  0);
                      objc_autoreleasePoolPop(v96);
                      ++v95;
                      --v89;
                    }

                    while (v89);
                  }
                }

                if (v90 >= 0x201) {
                  NSZoneFree(0LL, v93);
                }
                v68 = v173;
              }

              if (!v68 || *((_BYTE *)v68 + 24) != 9 || (v68[8] ? (int v98 = 1) : (int v98 = (int)v175), v98 != 1))
              {
                if ((*(_BYTE *)(v176 + 148) & 1) != 0 && v168 && [v168 count])
                {
                  uint64_t v100 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v168);
                  -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:]( v176,  0LL,  (uint64_t)v100,  v155,  v174);
                }

                uint64_t v101 = *(void *)(v176 + 8);
                if (!v101
                  || !*(_BYTE *)(v101 + 82)
                  || (_DWORD)v175
                  && ![v30 count]
                  && ![v168 count]
                  && ![v171 count])
                {
                  goto LABEL_206;
                }

                id v102 = objc_alloc(NSString);
                if ((v150 & 1) != 0) {
                  uint64_t v103 = 0LL;
                }
                else {
                  uint64_t v103 = *(unsigned int *)(v149 + 184);
                }
                id v104 = (void *)objc_msgSend( v102,  "initWithFormat:",  @"%u-%lld",  v103,  objc_msgSend(v155, "_referenceData64"));
                uint64_t v105 = (void *)[*(id *)(v176 + 128) objectForKey:v104];
                if (v105)
                {
                  objc_msgSend(v105, "addObject:", objc_msgSend(v174, "name"));
                }

                else
                {
                  id v120 = objc_alloc(MEMORY[0x189603FE0]);
                  v121 = (void *)objc_msgSend(v120, "initWithObjects:", objc_msgSend(v174, "name"), 0);
                  [*(id *)(v176 + 128) setObject:v121 forKey:v104];
                }

- (void)_findOrCreateChangeSnapshotForGlobalID:(uint64_t)a1
{
  id Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (!Value)
  {
    v5 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), a2);
    if (!v5)
    {
      v6 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:]( *(NSSQLObjectFaultRequestContext **)(a1 + 8),  (uint64_t)a2);
      -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v6->super.super.isa, 0LL);
      uint64_t v7 = *(void *)(a1 + 8);
      if (v7) {
        uint64_t v8 = *(void *)(v7 + 8);
      }
      else {
        uint64_t v8 = 0LL;
      }
      -[NSSQLCore dispatchRequest:withRetries:](v8, v6, 0LL);
      uint64_t v9 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v6, "result");
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 8);
        if (v10) {
          [*(id *)(v10 + 136) setObject:v9 forKey:a2];
        }
      }

      id v11 = v9;
      if (!v9)
      {
        uint64_t v14 = *(void *)(a1 + 8);
        if (v14) {
          uint64_t v15 = *(void **)(v14 + 8);
        }
        else {
          uint64_t v15 = 0LL;
        }
        uint64_t v16 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v15, (void *)[a2 entity]);
        unint64_t v12 = (void *)objc_msgSend( +[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v16),  "initWithSQLEntity:objectID:",  v16,  a2);
        goto LABEL_11;
      }

      v5 = v9;
    }

    unint64_t v12 = (void *)-[os_unfair_lock_s copy](v5, "copy");
LABEL_11:
    id Value = v12;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, v12);
  }

  return Value;
}

- (uint64_t)_addFileBackedFutureToDelete:(uint64_t)a1
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4) {
    v5 = *(void **)(v4 + 8);
  }
  else {
    v5 = 0LL;
  }
  uint64_t v6 = [v5 fileBackedFuturesDirectory];
  if (a2) {
    uint64_t v7 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v7, "path"), "hasPrefix:", v6);
  if ((_DWORD)result)
  {
    id v9 = *(id *)(a1 + 120);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(a1 + 120) = v9;
    }

    return [v9 addObject:a2];
  }

  return result;
}

- (void)_populateRow:(_BYTE *)a3 fromObject:(int)a4 timestamp:(_BYTE *)a5 inserted:(double)a6 shouldAddToRowCache:
{
  uint64_t v8 = a3;
  uint64_t v10 = (unint64_t *)[a3 entity];
  id v11 = v10;
  if (v10) {
    uint64_t v143 = (void *)v10[13];
  }
  else {
    uint64_t v143 = 0LL;
  }
  uint64_t v140 = _kvcPropertysPrimitiveGetters(v10);
  *a5 = 1;
  if ((v8[17] & 0x80) != 0) {
    [v8 willAccessValueForKey:0];
  }
  int v134 = a4;
  uint64_t v141 = (void *)a2;
  id v130 = v11;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 1) != 0) {
    unint64_t v12 = 0LL;
  }
  else {
    unint64_t v12 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v132 = v12;
  uint64_t v142 = (void *)[v12 foreignKeyColumns];
  uint64_t v13 = [v142 count];
  uint64_t v139 = (uint64_t)v8;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = &OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
    do
    {
      uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v18 = (void *)[v142 objectAtIndex:v15];
      uint64_t v19 = (void *)[v18 toOneRelationship];
      unint64_t v20 = v19;
      if (!v19 || !*((_BYTE *)v19 + v16[187]))
      {
        unint64_t v21 = v16;
        uint64_t v22 = [v19 name];
        unint64_t v23 = [v143 fastIndexForKnownKey:v22];
        if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v28 = (void *)[v8 primitiveValueForKey:v22];
        }
        else {
          _PF_Handler_Primitive_GetProperty((id **)v8, v23, v22, *(void *)(v140 + 8 * v23), v24, v25, v26, v27);
        }
        uint64_t v29 = v28;
        uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "objectID"), "persistentStore");
        if (v30)
        {
          uint64_t v31 = a1[1];
          if (!v31 || v30 != *(void *)(v31 + 8))
          {
            id v129 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A60],  133010,  (uint64_t)@"CoreData does not support persistent cross-store relationships",  (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v8,  @"Source object",  v29,  @"Destination Object",  objc_msgSend((id)objc_msgSend(v130, "propertiesByName"), "objectForKey:", v22),  @"Relationship",  0));
            objc_exception_throw(v129);
            -[NSSQLSavePlan _createCorrelationTrackerUpdatesForDeletedObject:]();
            return;
          }
        }

        isValidRelationshipDestinatiouint64_t n = -[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v29);
        BOOL v33 = !v29 || isValidRelationshipDestination == 0;
        uint64_t v34 = v33 ? 0 : objc_msgSend((id)objc_msgSend(v29, "objectID"), "_referenceData64");
        uint64_t v16 = v21;
        objc_msgSend(v141, "setForeignKeySlot:int64:", objc_msgSend(v18, "slot"), v34);
        if (v20)
        {
          v35 = (void *)v20[9];
          if (v35)
          {
            if (v29
              && ((uint64_t v37 = (void *)[v29 objectID], (v38 = a1[1]) == 0)
                ? (uint64_t v39 = 0LL)
                : (uint64_t v39 = *(void *)(v38 + 8)),
                  (uint64_t v40 = -[NSSQLCore entityForObjectID:](v39, v37)) != 0))
            {
              uint64_t v36 = *(unsigned int *)(v40 + 184);
            }

            else
            {
              uint64_t v36 = 0LL;
            }

            objc_msgSend(v141, "setForeignEntityKeySlot:entityKey:", objc_msgSend(v35, "slot"), v36);
            uint64_t v8 = (_BYTE *)v139;
          }

          v41 = (void *)v20[10];
          if (v41)
          {
            if (v29)
            {
              uint64_t v43 = (void *)v20[7];
              uint64_t v44 = [v29 entity];
              int v45 = (unint64_t *)v44;
              if (v44) {
                id v46 = *(void **)(v44 + 104);
              }
              else {
                id v46 = 0LL;
              }
              uint64_t v135 = v43;
              uint64_t v47 = [v43 name];
              uint64_t v48 = [v46 fastIndexForKnownKey:v47];
              if (v48 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v49 = (void *)[v29 primitiveValueForKey:v47];
              }

              else
              {
                unint64_t v50 = v48;
                uint64_t v51 = _kvcPropertysPrimitiveGetters(v45);
                _PF_Handler_Primitive_GetProperty((id **)v29, v50, v47, *(void *)(v51 + 8 * v50), v52, v53, v54, v55);
              }

              uint64_t v56 = (uint64_t)v49;
              uint64_t v8 = (_BYTE *)v139;
              if (v49)
              {
                uint64_t v42 = [v49 count];
                if (v42)
                {
                  -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:]( (uint64_t)a1,  v56,  [v29 objectID],  v135,  0,  0);
                  LODWORD(v42) = -[_NSFaultingMutableOrderedSet _orderKeyForObject:](v56, v139);
                }
              }

              else
              {
                LODWORD(v42) = 0;
              }

              uint64_t v16 = v21;
              if ((_DWORD)v42)
              {
LABEL_52:
                if (v34) {
                  uint64_t v57 = v42;
                }
                else {
                  uint64_t v57 = 0LL;
                }
                uint64_t v58 = [v41 slot];
                uint64_t v59 = v57;
                uint64_t v8 = (_BYTE *)v139;
                [v141 setForeignOrderKeySlot:v58 orderKey:v59];
                goto LABEL_14;
              }
            }

            else
            {
              LODWORD(v42) = 0;
            }

            if (!v34) {
              goto LABEL_52;
            }
          }
        }
      }

- (void)_createCorrelationTrackerUpdatesForDeletedObject:(uint64_t)a1
{
  v2 = a2;
  uint64_t v50 = a1;
  uint64_t v65 = *MEMORY[0x1895F89C0];
  uint64_t v3 = [a2 entity];
  uint64_t v4 = (unint64_t *)v3;
  if (v3)
  {
    uint64_t v5 = [*(id *)(v3 + 104) keys];
    unint64_t v6 = v4[14];
  }

  else
  {
    uint64_t v5 = [0 keys];
    unint64_t v6 = 0LL;
  }

  uint64_t v53 = _kvcPropertysPrimitiveGetters(v4);
  if ((*((_BYTE *)v2 + 17) & 0x80) != 0) {
    [v2 willAccessValueForKey:0];
  }
  uint64_t v49 = [v2 objectID];
  uint64_t v7 = [v2 entity];
  if (v7
    && ((uint64_t v8 = (void *)v7, (v9 = *(void *)(v50 + 8)) == 0) ? (v10 = 0LL) : (v10 = *(void **)(v9 + 8)),
        (uint64_t v11 = _sqlCoreLookupSQLEntityForEntityDescription(v10, v8)) != 0))
  {
    id v54 = *(id *)(v11 + 40);
  }

  else
  {
    id v54 = 0LL;
  }

  uint64_t v12 = *((void *)v2 + 6);
  if (v12) {
    uint64_t v13 = *(void **)(v12 + 8);
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v52 = [v13 values];
  if (v52)
  {
    uint64_t v51 = [MEMORY[0x189603FE8] null];
    unint64_t v15 = *(void *)(v6 + 144);
    uint64_t v14 = *(void *)(v6 + 152);
    uint64_t v16 = v14 + v15;
    if (v15 < v14 + v15)
    {
      uint64_t v17 = &OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
      uint64_t v47 = v5;
      uint64_t v48 = v2;
      while (1)
      {
        uint64_t v18 = *(void *)(v5 + 8 * v15);
        uint64_t v19 = objc_msgSend(v54, "objectForKey:", v18, v47, v48);
        if (v19)
        {
          uint64_t v24 = (void *)v19;
          if (*(_BYTE *)(v19 + 24) == 9)
          {
            if (*(void *)(v19 + v17[68]))
            {
              _PF_Handler_Primitive_GetProperty((id **)v2, v15, v18, *(void *)(v53 + 8 * v15), v20, v21, v22, v23);
              uint64_t v26 = *(void **)(v52 + 8 * v15);
              if (v25 != v26)
              {
                uint64_t v27 = v25;
                if (([v25 isFault] & 1) == 0) {
                  break;
                }
              }
            }
          }
        }

- (void)_prepareForDeletionOfDatabaseExternalPropertiesForObject:(uint64_t)a1
{
  uint64_t v4 = (void *)[a2 entity];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 8);
    }
    else {
      uint64_t v7 = 0LL;
    }
    uint64_t v4 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v7, v5);
  }

  uint64_t v8 = (unint64_t *)[v4 entityDescription];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)v8[13];
    uint64_t v11 = [v8 propertiesByName];
    unint64_t v12 = v9[14];
    unint64_t v13 = *(void *)(v12 + 48);
    uint64_t v14 = *(void *)(v12 + 56);
    uint64_t v15 = _kvcPropertysPrimitiveGetters(v9);
    if (v13 < v14 + v13)
    {
      uint64_t v16 = v15;
      uint64_t v17 = (id *)(v11 + 8 * v13 + 24);
      do
      {
        uint64_t v18 = (void *)MEMORY[0x186E3E5D8]();
        id v19 = *v17;
        if ([*v17 storesBinaryDataExternally]
          && ([v19 isFileBackedFuture] & 1) == 0)
        {
          uint64_t v27 = [v19 name];
          unint64_t v28 = [v10 fastIndexForKnownKey:v27];
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v33 = [a2 primitiveValueForKey:v27];
          }
          else {
            _PF_Handler_Primitive_GetProperty((id **)a2, v28, v27, *(void *)(v16 + 8 * v28), v29, v30, v31, v32);
          }
          uint64_t v34 = v33;
          if (v33)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v35 = *(id *)(a1 + 104);
              if (!v35)
              {
                id v35 = objc_alloc_init(MEMORY[0x189603FA8]);
                *(void *)(a1 + 104) = v35;
              }

              [v35 addObject:v34];
            }
          }

          uint64_t v36 = (id *)-[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](a1, (void *)[a2 objectID]);
          id v37 = (const __CFDate *)v36;
          if (v36)
          {
            if (((_BYTE)v36[2] & 1) != 0)
            {
              uint64_t v36 = 0LL;
            }

            else
            {
              uint64_t v36 = (id *)[*((id *)v36[5] + 2) _storeInfo1];
              if (v36) {
                uint64_t v36 = (id *)[v36[5] objectForKey:v27];
              }
            }
          }

          CFDateRef v38 = -[NSSQLRow attributeValueForSlot:](v37, [v36 slot]);
          if (v38)
          {
            CFDateRef v39 = v38;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v40 = *(id *)(a1 + 104);
              if (!v40)
              {
                id v40 = objc_alloc_init(MEMORY[0x189603FA8]);
                *(void *)(a1 + 104) = v40;
              }

              [v40 addObject:v39];
            }
          }
        }

        else if ([v19 isFileBackedFuture])
        {
          uint64_t v20 = [v19 name];
          unint64_t v21 = [v10 fastIndexForKnownKey:v20];
          if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v26 = [a2 primitiveValueForKey:v20];
          }
          else {
            _PF_Handler_Primitive_GetProperty((id **)a2, v21, v20, *(void *)(v16 + 8 * v21), v22, v23, v24, v25);
          }
          if (v26) {
            -[NSSQLSavePlan _addFileBackedFutureToDelete:](a1, v26);
          }
        }

        objc_autoreleasePoolPop(v18);
        ++v17;
        --v14;
      }

      while (v14);
    }
  }

  else
  {
    [0 propertiesByName];
    __break(1u);
  }

- (uint64_t)_createRowsForSave
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 8);
    if (v2) {
      v2 = (void *)[v2 persistentStoreRequest];
    }
    uint64_t v3 = (void *)[v2 insertedObjects];
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v5 = v4;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v65;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v65 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v64 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v11 = (const void *)[v9 objectID];
          unint64_t v12 = (void *)[v9 entity];
          if (v12)
          {
            uint64_t v14 = *(void *)(v1 + 8);
            if (v14) {
              uint64_t v15 = *(void **)(v14 + 8);
            }
            else {
              uint64_t v15 = 0LL;
            }
            unint64_t v13 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v15, v12);
          }

          else
          {
            unint64_t v13 = 0LL;
          }

          uint64_t v16 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(v1 + 8), v11);
          uint64_t v17 = (void *)objc_msgSend( +[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v13),  "initWithSQLEntity:objectID:",  v13,  v11);
          uint64_t v18 = v17;
          if (v16) {
            uint64_t v19 = *(unsigned int *)(*(void *)&v16[10]._os_unfair_lock_opaque + 12LL) + 1LL;
          }
          else {
            uint64_t v19 = 1LL;
          }
          [v17 setOptLock:v19];
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 16), v11, v18);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 24), v11, v18);

          objc_autoreleasePoolPop(v10);
          ++v8;
        }

        while (v6 != v8);
        uint64_t v20 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
        uint64_t v6 = v20;
      }

      while (v20);
    }

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v21 = [v3 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v61;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v3);
          }
          uint64_t v24 = *(_BYTE **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
          id Value = (void *)CFDictionaryGetValue( *(CFDictionaryRef *)(v1 + 16),  (const void *)[v24 objectID]);
          char v59 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]( (void *)v1,  (uint64_t)Value,  v24,  1,  &v59,  v5);
          if (v59) {
            [*(id *)(v1 + 64) addObject:Value];
          }
          else {
            objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(Value, "objectID"));
          }
          objc_autoreleasePoolPop(v25);
        }

        uint64_t v21 = [v3 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }

      while (v21);
    }

    uint64_t v27 = *(void **)(v1 + 8);
    if (v27) {
      uint64_t v27 = (void *)[v27 persistentStoreRequest];
    }
    unint64_t v28 = (void *)[v27 updatedObjects];
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v56;
      do
      {
        for (uint64_t j = 0LL; j != v29; ++j)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(_BYTE **)(*((void *)&v55 + 1) + 8 * j);
          uint64_t v33 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v34 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, (void *)[v32 objectID]);
          char v59 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]( (void *)v1,  (uint64_t)v34,  v32,  0,  &v59,  v5);
          if (v59) {
            [*(id *)(v1 + 64) addObject:v34];
          }
          else {
            objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(v34, "objectID"));
          }
          objc_autoreleasePoolPop(v33);
        }

        uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }

      while (v29);
    }

    id v35 = *(void **)(v1 + 8);
    if (v35) {
      id v35 = (void *)[v35 persistentStoreRequest];
    }
    uint64_t v36 = (void *)[v35 deletedObjects];
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t result = [v36 countByEnumeratingWithState:&v51 objects:v68 count:16];
    uint64_t v37 = result;
    if (result)
    {
      uint64_t v38 = *(void *)v52;
      do
      {
        uint64_t v39 = 0LL;
        do
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(v36);
          }
          id v40 = *(void **)(*((void *)&v51 + 1) + 8 * v39);
          v41 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v42 = (void *)[v40 objectID];
          uint64_t v43 = (void *)[v40 entity];
          if (v43)
          {
            uint64_t v44 = *(void *)(v1 + 8);
            int v45 = v44 ? *(void **)(v44 + 8) : 0LL;
            uint64_t v46 = _sqlCoreLookupSQLEntityForEntityDescription(v45, v43);
            uint64_t v47 = v46;
            if (v46)
            {
              int v48 = *(_DWORD *)(v46 + 280);
              if ((v48 & 1) != 0)
              {
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v40);
                int v48 = *(_DWORD *)(v47 + 280);
              }

              if ((v48 & 2) != 0) {
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v40);
              }
            }
          }

          -[NSSQLSavePlan _createCorrelationTrackerUpdatesForDeletedObject:](v1, v40);
          uint64_t v49 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, v42);
          id v50 = v49;
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 16), v42);
          if (v49) {
            [*(id *)(v1 + 40) addObject:v49];
          }

          objc_autoreleasePoolPop(v41);
          ++v39;
        }

        while (v37 != v39);
        uint64_t result = [v36 countByEnumeratingWithState:&v51 objects:v68 count:16];
        uint64_t v37 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)_computeUpdatedRowSplit
{
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2) {
      v2 = (void *)[v2 persistentStoreRequest];
    }
    uint64_t v3 = (void *)[v2 updatedObjects];
    if (v3)
    {
      double v4 = v3;
      if ([v3 count])
      {
        double v5 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v4);
        uint64_t v14 = 0LL;
        uint64_t v15 = &v14;
        uint64_t v16 = 0x3052000000LL;
        uint64_t v17 = __Block_byref_object_copy__43;
        uint64_t v18 = __Block_byref_object_dispose__43;
        id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
        uint64_t v8 = 0LL;
        uint64_t v9 = &v8;
        uint64_t v10 = 0x3052000000LL;
        uint64_t v11 = __Block_byref_object_copy__43;
        unint64_t v12 = __Block_byref_object_dispose__43;
        id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
        uint64_t v6 = (void *)a1[2];
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke;
        v7[3] = &unk_189EAB780;
        v7[4] = a1;
        v7[5] = v5;
        v7[6] = &v14;
        v7[7] = &v8;
        [v6 enumerateKeysAndObjectsUsingBlock:v7];

        a1[6] = v15[5];
        a1[7] = v9[5];
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v14, 8);
      }
    }
  }

const void *__40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke( uint64_t a1,  const void *a2,  uint64_t a3)
{
  uint64_t result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24LL), a2);
  if (!result)
  {
    else {
      uint64_t v7 = *(void *)(a1 + 56);
    }
    return (const void *)[*(id *)(*(void *)(v7 + 8) + 40) addObject:a3];
  }

  return result;
}

- (id)initForRequestContext:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSSQLSavePlan;
  double v4 = -[NSSQLSavePlan init](&v21, sel_init);
  double v5 = v4;
  if (v4)
  {
    v4->_requestContext = (NSSQLSaveChangesRequestContext *)a3;
    if (a3)
    {
      uint64_t v6 = *((void *)a3 + 1);
      if (v6) {
        LODWORD(v6) = (*(_DWORD *)(v6 + 200) >> 5) & 1;
      }
    }

    else
    {
      LODWORD(v6) = 0;
    }

    v4->_flags = (_sqlSaveFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | v6);
    CFIndex v7 = *MEMORY[0x189605240];
    keyCallBacks.retaiuint64_t n = 0LL;
    keyCallBacks.release = 0LL;
    keyCallBacks.versiouint64_t n = v7;
    *(_OWORD *)&keyCallBacks.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
    valueCallBacks.versiouint64_t n = *MEMORY[0x189605250];
    *(_OWORD *)&valueCallBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
    valueCallBacks.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605250] + 24LL);
    valueCallBacks.equal = 0LL;
    uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v4->_changeCache = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  &keyCallBacks,  &valueCallBacks);
    requestContext = v5->_requestContext;
    if (requestContext) {
      requestContext = -[NSSQLStoreRequestContext persistentStoreRequest](requestContext, "persistentStoreRequest");
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](requestContext, "insertedObjects"), "count");
    uint64_t v10 = v5->_requestContext;
    if (v10) {
      uint64_t v10 = -[NSSQLStoreRequestContext persistentStoreRequest](v10, "persistentStoreRequest");
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v10, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_insertCache = CFDictionaryCreateMutable(v8, 0LL, &keyCallBacks, &valueCallBacks);
    uint64_t v11 = v5->_requestContext;
    if (v11) {
      uint64_t v11 = -[NSSQLStoreRequestContext persistentStoreRequest](v11, "persistentStoreRequest");
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v11, "insertedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyCache = CFDictionaryCreateMutable(v8, 0LL, &keyCallBacks, &valueCallBacks);
    unint64_t v12 = v5->_requestContext;
    if (v12) {
      unint64_t v12 = -[NSSQLStoreRequestContext persistentStoreRequest](v12, "persistentStoreRequest");
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v12, "insertedObjects"), "count");
    id v13 = v5->_requestContext;
    if (v13) {
      id v13 = -[NSSQLStoreRequestContext persistentStoreRequest](v13, "persistentStoreRequest");
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v13, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyRelationshipChanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v5->_rowsToDelete = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    if ((*(_BYTE *)&v5->_flags & 1) != 0)
    {
      v5->_updatedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0LL, &keyCallBacks, &valueCallBacks);
      v5->_deletedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0LL, &keyCallBacks, &valueCallBacks);
    }

    v5->_rowsToAddToRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v5->_objectIDsToRemoveFromRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    if (a3) {
      uint64_t v14 = *((void *)a3 + 1);
    }
    else {
      uint64_t v14 = 0LL;
    }
    v5->_usedIndexes = (NSMutableDictionary *)-[NSSQLCore harvestIndexStatisticsFromConnections](v14);
    uint64_t v15 = v5->_requestContext;
    if (v15) {
      uint64_t v15 = -[NSSQLStoreRequestContext persistentStoreRequest](v15, "persistentStoreRequest");
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v15, "insertedObjects"), "count")) {
      goto LABEL_29;
    }
    uint64_t v16 = v5->_requestContext;
    if (v16) {
      uint64_t v16 = -[NSSQLStoreRequestContext persistentStoreRequest](v16, "persistentStoreRequest");
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v16, "updatedObjects"), "count")) {
      goto LABEL_29;
    }
    uint64_t v17 = v5->_requestContext;
    if (v17) {
      uint64_t v17 = -[NSSQLStoreRequestContext persistentStoreRequest](v17, "persistentStoreRequest");
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext deletedObjects](v17, "deletedObjects"), "count")
      || -[NSMutableDictionary count](v5->_usedIndexes, "count"))
    {
LABEL_29:
      *(_DWORD *)&v5->_flags |= 2u;
    }
  }

  return v5;
}

- (void)dealloc
{
  self->_changeCache = 0LL;
  CFRelease(self->_toManyCache);
  self->_toManyCache = 0LL;
  CFRelease(self->_insertCache);
  self->_insertCache = 0LL;

  self->_toManyRelationshipChanges = 0LL;
  self->_rowsToDelete = 0LL;

  self->_externalDataReferencesToDelete = 0LL;
  self->_externalDataReferencesToSave = 0LL;

  self->_fileBackedFuturesToCopy = 0LL;
  self->_fileBackedFuturesToDelete = 0LL;

  self->_updatedByRequest = 0LL;
  self->_updatedByForeignKey = 0LL;

  self->_rowsToAddToRowCache = 0LL;
  self->_objectIDsToRemoveFromRowCache = 0LL;

  self->_usedIndexes = 0LL;
  updatedFOKRowsInCurrentSave = self->_updatedFOKRowsInCurrentSave;
  if (updatedFOKRowsInCurrentSave)
  {
    CFRelease(updatedFOKRowsInCurrentSave);
    self->_updatedFOKRowsInCurrentSave = 0LL;
    CFRelease(self->_deletedFOKRowsInCurrentSave);
    self->_deletedFOKRowsInCurrentSave = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLSavePlan;
  -[NSSQLSavePlan dealloc](&v4, sel_dealloc);
}

- (void)newObjectsForFastLockConflictDetection
{
  if (result)
  {
    uint64_t v1 = (void *)result[1];
    if (v1) {
      uint64_t v1 = (void *)[v1 persistentStoreRequest];
    }
    return (id)[v1 lockedObjects];
  }

  return result;
}

- (id)newObjectsForExhaustiveLockConflictDetection
{
  if (!a1) {
    return 0LL;
  }
  v2 = *(void **)(a1 + 8);
  if (v2) {
    v2 = (void *)[v2 persistentStoreRequest];
  }
  uint64_t v3 = (void *)[v2 updatedObjects];
  objc_super v4 = v3;
  if (v3)
  {
    if ([v3 count]) {
      objc_super v4 = (void *)[v4 mutableCopy];
    }
    else {
      objc_super v4 = 0LL;
    }
  }

  double v5 = *(void **)(a1 + 8);
  if (v5) {
    double v5 = (void *)[v5 persistentStoreRequest];
  }
  uint64_t v6 = (void *)[v5 deletedObjects];
  if (v6)
  {
    CFIndex v7 = v6;
    if ([v6 count])
    {
      if (v4) {
        [v4 unionSet:v7];
      }
      else {
        objc_super v4 = (void *)[v7 mutableCopy];
      }
    }
  }

  uint64_t v8 = *(void **)(a1 + 8);
  if (v8) {
    uint64_t v8 = (void *)[v8 persistentStoreRequest];
  }
  uint64_t v9 = (void *)[v8 lockedObjects];
  if (v9)
  {
    uint64_t v10 = v9;
    if ([v9 count])
    {
      if (v4)
      {
        [v4 unionSet:v10];
        return v4;
      }

      objc_super v4 = (void *)[v10 mutableCopy];
    }
  }

  if (v4) {
    return v4;
  }
  return objc_alloc_init(MEMORY[0x189603FE0]);
}

- (id)newObjectsForUniquenessConflictDetectionGivenReportedFailures:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
  if ([a2 count])
  {
    __int128 v36 = 0uLL;
    __int128 v37 = 0uLL;
    __int128 v34 = 0uLL;
    __int128 v35 = 0uLL;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(a2);
          }
          uint64_t v9 = *(void *)(a1 + 8);
          if (v9 && (uint64_t v10 = *(void *)(v9 + 32)) != 0) {
            id v11 = _PFRetainedObjectIDCore(v10, *(void **)(*((void *)&v34 + 1) + 8 * v8), 0LL, 1);
          }
          else {
            id v11 = 0LL;
          }
          [v4 addObject:v11];

          ++v8;
        }

        while (v6 != v8);
        uint64_t v12 = [a2 countByEnumeratingWithState:&v34 objects:v40 count:16];
        uint64_t v6 = v12;
      }

      while (v12);
    }
  }

  else
  {
    __int128 v32 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    id v13 = *(void **)(a1 + 8);
    if (v13) {
      id v13 = (void *)[v13 persistentStoreRequest];
    }
    uint64_t v14 = (void *)[v13 updatedObjects];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          [v4 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }

      while (v16);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v19 = *(void **)(a1 + 8);
    if (v19) {
      id v19 = (void *)objc_msgSend(v19, "persistentStoreRequest", (void)v26);
    }
    uint64_t v20 = (void *)objc_msgSend(v19, "insertedObjects", (void)v26);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t j = 0LL; j != v22; ++j)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [v4 addObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }

      while (v22);
    }
  }

  return v4;
}

- (uint64_t)newInsertedRows
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(void **)(a1 + 24);
  unint64_t v2 = [v1 count];
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
  uint64_t v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 > 0x200) {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
  }
  [v1 getObjects:v6 andKeys:0 count:v3];
  uint64_t v7 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v6 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return v7;
}

- (uint64_t)newCorrelationTableUpdates
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(void **)(a1 + 32);
  unint64_t v2 = [v1 count];
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
  uint64_t v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v2 > 0x200) {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v4);
  }
  [v1 getObjects:v6 andKeys:0 count:v3];
  uint64_t v7 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v6 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  return v7;
}

@end