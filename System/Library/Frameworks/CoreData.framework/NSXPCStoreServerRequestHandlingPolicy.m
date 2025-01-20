@interface NSXPCStoreServerRequestHandlingPolicy
+ (void)initialize;
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3;
- (id)_coreProcessFetchRequest:(void *)a3 fromClientWithContext:(void *)a4 error:;
- (id)allowableClassesForClientWithContext:(id)a3;
- (id)prefetchRelationships:(void *)a3 forFetch:(void *)a4 sourceOIDs:(void *)a5 fromClientWithContext:;
- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6;
- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (void)processObtainRequest:(void *)a3 inContext:(void *)a4 error:;
@end

@implementation NSXPCStoreServerRequestHandlingPolicy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_62 = [MEMORY[0x1896079C8] predicateWithValue:1];
    qword_18C4AB898 = [MEMORY[0x1896079C8] predicateWithValue:0];
  }

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return a3 != 0LL;
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  return 1;
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_62;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)_MergedGlobals_62;
}

- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id result = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  a3,  a4);
  if (result)
  {
    if ((id)qword_18C4AB898 != result && _MergedGlobals_62 != (void)result) {
      return (id)_MergedGlobals_62;
    }
  }

  return result;
}

- (id)_coreProcessFetchRequest:(void *)a3 fromClientWithContext:(void *)a4 error:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x3052000000LL;
  v82 = __Block_byref_object_copy__1;
  v83 = __Block_byref_object_dispose__1;
  uint64_t v84 = 0LL;
  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x3052000000LL;
  v76 = __Block_byref_object_copy__1;
  v77 = __Block_byref_object_dispose__1;
  uint64_t v78 = 0LL;
  id v51 = objc_alloc_init(MEMORY[0x1896077E8]);
  v7 = (void *)[a3 managedObjectContext];
  [a2 _resolveEntityWithContext:v7];
  if ([a2 resultType])
  {
    v8 = 0LL;
    BOOL v9 = 0;
  }

  else
  {
    BOOL v9 = objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count") != 0;
    v19 = (void *)[a2 relationshipKeyPathsForPrefetching];
    if (v19)
    {
      id v20 = +[_PFRoutines _coalescedPrefetchKeypaths:]((uint64_t)&OBJC_CLASS____PFRoutines, v19);
      if ([v20 count]) {
        v8 = v20;
      }
      else {
        v8 = 0LL;
      }
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Coalesced prefetch keypaths to : %@",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v8);
      }
    }

    else
    {
      v8 = 0LL;
    }
  }

  [a2 setRelationshipKeyPathsForPrefetching:0];
  char v10 = [a2 includesPropertyValues];
  if (v8) {
    char v11 = v10;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0 && [v8 count]) {
    [a2 setIncludesPropertyValues:1];
  }
  v12 = (void *)[v7 persistentStoreCoordinator];
  v13 = v12;
  if (a3) {
    uint64_t v14 = a3[4];
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x2020000000LL;
  char v72 = 0;
  v68[0] = MEMORY[0x1895F87A8];
  v68[1] = 3221225472LL;
  v68[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke;
  v68[3] = &unk_189EA7670;
  v68[4] = a2;
  v68[5] = v14;
  v68[8] = &v79;
  v68[9] = &v73;
  v68[10] = &v69;
  v68[6] = v7;
  v68[7] = a1;
  [v12 performBlockAndWait:v68];
  id v15 = (id)v80[5];
  id v16 = (id)v74[5];
  if (v80[5])
  {
    uint64_t v62 = 0LL;
    v63 = &v62;
    uint64_t v64 = 0x3052000000LL;
    v65 = __Block_byref_object_copy__1;
    v66 = __Block_byref_object_dispose__1;
    uint64_t v67 = 0LL;
    if (v8)
    {
      if (!v9) {
        [a2 setResultType:1];
      }
      id v17 = objc_alloc_init(MEMORY[0x1896077E8]);
      uint64_t v56 = 0LL;
      v57 = &v56;
      uint64_t v58 = 0x3052000000LL;
      v59 = __Block_byref_object_copy__1;
      v60 = __Block_byref_object_dispose__1;
      uint64_t v61 = 0LL;
      v54[0] = MEMORY[0x1895F87A8];
      v54[1] = 3221225472LL;
      v54[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2;
      v54[3] = &unk_189EA7698;
      BOOL v55 = v9;
      v54[6] = &v56;
      v54[7] = &v79;
      v54[4] = a2;
      v54[5] = v14;
      v54[8] = &v62;
      [v13 performBlockAndWait:v54];
      id v18 =  -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:]( a1,  v8,  a2,  (void *)v57[5],  a3);

      [v17 drain];
      _Block_object_dispose(&v56, 8);
    }

    else
    {
      id v18 = 0LL;
    }

    if (!*((_BYTE *)v70 + 24))
    {
      v34 = (void *)v80[5];
      [a2 resultType];
      uint64_t v35 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v34, v18, 0);
      v80[5] = v35;
    }

    if (v63[5])
    {
      v53[0] = MEMORY[0x1895F87A8];
      v53[1] = 3221225472LL;
      v53[2] = __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3;
      v53[3] = &unk_189EA7258;
      v53[4] = v14;
      v53[5] = &v62;
      [v13 performBlockAndWait:v53];
    }

    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
    {
      uint64_t v36 = [(id)v80[5] count];
      _NSCoreDataLog(8LL, (uint64_t)@"Process fetch request got %d results.", v37, v38, v39, v40, v41, v42, v36);
    }

    _Block_object_dispose(&v62, 8);
    int v33 = 0;
  }

  else
  {
    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
      _NSCoreDataLog( 8LL,  (uint64_t)@"Process fetch request got nil result (check system log for details).",  v27,  v28,  v29,  v30,  v31,  v32,  v50);
    }
    int v33 = 1;
  }

  _Block_object_dispose(&v69, 8);
  id v43 = (id)v80[5];
  id v44 = (id)v74[5];
  if (a4)
  {
    uint64_t v45 = v74[5];
    if (v45) {
      *a4 = v45;
    }
  }

  [v51 drain];
  id v46 = 0LL;
  id v47 = (id)v74[5];
  if (v33) {
    id v48 = 0LL;
  }
  else {
    id v48 = (id)v80[5];
  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  return v48;
}

id __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke( uint64_t a1)
{
  if ([*(id *)(a1 + 32) resultType] == 4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
    id v2 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)_NSXPCStoreUtilities,  [*(id *)(a1 + 48) executeFetchRequest:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 72) + 8) + 40]);
    uint64_t v3 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) resultType];
    if (v3) {
      uint64_t v4 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v2, 0, 0);
    }
    else {
      uint64_t v4 = 0LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v4;
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  else
  {
    -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:]( *(void *)(a1 + 40),  *(void **)(a1 + 32),  0LL,  *(void *)(a1 + 48),  (void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v6;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  }

  return *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
}

void __94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_2( uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 72))
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v3 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL),  *(NSFetchRequest **)(a1 + 32),  0LL,  *(NSPersistentStore **)(a1 + 40),  0LL,  (void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL),  0LL);
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "valueAtIndex:", 0));
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v2;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL)
                                                                             + 40LL),
                                                                    *(NSFetchRequest **)(a1 + 32),
                                                                    0LL,
                                                                    *(NSPersistentStore **)(a1 + 40),
                                                                    0LL,
                                                                    (void *)(*(void *)(*(void *)(a1 + 64) + 8LL)
                                                                             + 40LL),
                                                                    0LL);
    -[NSSQLCore _cacheRows:](*(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
  }

- (id)prefetchRelationships:(void *)a3 forFetch:(void *)a4 sourceOIDs:(void *)a5 fromClientWithContext:
{
  v241[1] = *MEMORY[0x1895F89C0];
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetching keypaths %@, for fetch %@, sources %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)a2);
  }
  obuint64_t j = a2;
  id result = (id)[a4 count];
  if (result)
  {
    id result = (id)[a2 count];
    if (result)
    {
      id v147 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v139 = objc_alloc_init(MEMORY[0x1896077E8]);
      v154 = (void *)[a3 entity];
      __int128 v178 = 0u;
      __int128 v179 = 0u;
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      uint64_t v141 = [a2 countByEnumeratingWithState:&v178 objects:v232 count:16];
      if (!v141) {
        goto LABEL_136;
      }
      uint64_t v140 = *(void *)v179;
      while (1)
      {
        for (uint64_t i = 0LL; i != v141; ++i)
        {
          if (*(void *)v179 != v140) {
            objc_enumerationMutation(obj);
          }
          uint64_t v165 = *(void *)(*((void *)&v178 + 1) + 8 * i);
          context = (void *)MEMORY[0x186E3E5D8]();
          id v15 = (void *)[obj objectForKey:v165];
          if ([v15 count]) {
            uint64_t v16 = (uint64_t)v15;
          }
          else {
            uint64_t v16 = 0LL;
          }
          uint64_t v146 = v16;
          if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
            _NSCoreDataLog(8LL, (uint64_t)@"Prefetching %@, subkeypaths = %@", v17, v18, v19, v20, v21, v22, v165);
          }
          id v159 = (id)[MEMORY[0x189603FC8] dictionary];
          if (v154 && objc_msgSend((id)objc_msgSend(v154, "propertiesByName"), "objectForKey:", v165))
          {
            objc_msgSend(v159, "setObject:forKey:", a4, objc_msgSend(v154, "name"));
          }

          else
          {
            if (!objc_msgSend((id)objc_msgSend(v154, "subentitiesByName"), "count")) {
              goto LABEL_134;
            }
            v125 = (void *)objc_msgSend((id)objc_msgSend(v154, "subentities"), "mutableCopy");
            id v156 = (id)[MEMORY[0x189603FA8] array];
            while ([v125 count])
            {
              v126 = (void *)[v125 objectAtIndex:0];
              [v125 removeObjectAtIndex:0];
              if (objc_msgSend((id)objc_msgSend(v126, "relationshipsByName"), "objectForKey:", v165))
              {
                [v156 addObject:v126];
              }

              else if (objc_msgSend((id)objc_msgSend(v126, "subentitiesByName"), "count"))
              {
                objc_msgSend(v125, "addObjectsFromArray:", objc_msgSend(v126, "subentities"));
              }
            }

            if ([v156 count])
            {
              __int128 v176 = 0u;
              __int128 v177 = 0u;
              __int128 v174 = 0u;
              __int128 v175 = 0u;
              uint64_t v161 = [v156 countByEnumeratingWithState:&v174 objects:v231 count:16];
              if (v161)
              {
                v127 = 0LL;
                uint64_t v158 = *(void *)v175;
                do
                {
                  uint64_t v128 = 0LL;
                  do
                  {
                    if (*(void *)v175 != v158)
                    {
                      uint64_t v129 = v128;
                      objc_enumerationMutation(v156);
                      uint64_t v128 = v129;
                    }

                    uint64_t v164 = v128;
                    v130 = *(void **)(*((void *)&v174 + 1) + 8 * v128);
                    id v131 = objc_alloc_init(MEMORY[0x189603FA8]);
                    __int128 v172 = 0u;
                    __int128 v173 = 0u;
                    __int128 v170 = 0u;
                    __int128 v171 = 0u;
                    uint64_t v132 = [a4 countByEnumeratingWithState:&v170 objects:v230 count:16];
                    if (v132)
                    {
                      uint64_t v133 = *(void *)v171;
                      do
                      {
                        for (uint64_t j = 0LL; j != v132; ++j)
                        {
                          if (*(void *)v171 != v133) {
                            objc_enumerationMutation(a4);
                          }
                          v135 = *(void **)(*((void *)&v170 + 1) + 8 * j);
                          v136 = (void *)[v135 entity];
                          v137 = v136;
                          BOOL v138 = v136 == v130 || v136 == v127;
                          if (v138 || [v136 isKindOfEntity:v130])
                          {
                            [v131 addObject:v135];
                            if (v137 != v130) {
                              v127 = v137;
                            }
                          }
                        }

                        uint64_t v132 = [a4 countByEnumeratingWithState:&v170 objects:v230 count:16];
                      }

                      while (v132);
                    }

                    if ([v131 count]) {
                      objc_msgSend(v159, "setObject:forKey:", v131, objc_msgSend(v130, "name"));
                    }

                    uint64_t v128 = v164 + 1;
                  }

                  while (v164 + 1 != v161);
                  uint64_t v161 = [v156 countByEnumeratingWithState:&v174 objects:v231 count:16];
                }

                while (v161);
              }
            }
          }

          if ([v159 count])
          {
            __int128 v168 = 0u;
            __int128 v169 = 0u;
            __int128 v166 = 0u;
            __int128 v167 = 0u;
            uint64_t v157 = [v159 countByEnumeratingWithState:&v166 objects:v229 count:16];
            if (v157)
            {
              uint64_t v153 = *(void *)v167;
              do
              {
                uint64_t v23 = 0LL;
                do
                {
                  if (*(void *)v167 != v153) {
                    objc_enumerationMutation(v159);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v166 + 1) + 8 * v23);
                  uint64_t v25 = (void *)MEMORY[0x186E3E5D8]();
                  uint64_t v26 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v154, "managedObjectModel"), "entitiesByName"),  "objectForKey:",  v24);
                  if (v26)
                  {
                    uint64_t v27 = (void *)[v159 objectForKey:v24];
                    v163 = (void *)[a5 managedObjectContext];
                    v151 = (void *)[v163 persistentStoreCoordinator];
                    if (a5 && (uint64_t v28 = (void *)a5[4]) != 0LL)
                    {
                      uint64_t v148 = v28[6];
                      uint64_t v150 = a5[4];
                      uint64_t v29 = _sqlCoreLookupSQLEntityForEntityDescription(v28, v26);
                      uint64_t v30 = v29;
                      if (v29)
                      {
                        uint64_t v160 = [*(id *)(v29 + 40) objectForKey:v165];
                        char v155 = 0;
LABEL_29:
                        id v31 = -[NSEntityDescription _relationshipNamed:](v26, v165);
                        if (!v160 || !v31 || ![v27 count])
                        {
                          v53 = (void *)MEMORY[0x189603F18];
                          uint64_t v54 = [v26 name];
                          uint64_t v55 = objc_msgSend(v53, "arrayWithObjects:", v165, v54, NSArray_EmptyArray, 0);
                          goto LABEL_95;
                        }

                        uint64_t v32 = *(_BYTE **)(v160 + 56);
                        uint64_t v223 = 0LL;
                        v224 = &v223;
                        uint64_t v225 = 0x3052000000LL;
                        v226 = __Block_byref_object_copy__1;
                        v227 = __Block_byref_object_dispose__1;
                        uint64_t v228 = 0LL;
                        uint64_t v217 = 0LL;
                        v218 = &v217;
                        uint64_t v219 = 0x3052000000LL;
                        v220 = __Block_byref_object_copy__1;
                        v221 = __Block_byref_object_dispose__1;
                        uint64_t v222 = 0LL;
                        uint64_t v211 = 0LL;
                        v212 = &v211;
                        uint64_t v213 = 0x3052000000LL;
                        v214 = __Block_byref_object_copy__1;
                        v215 = __Block_byref_object_dispose__1;
                        id v216 = (id)NSArray_EmptyArray;
                        uint64_t v205 = 0LL;
                        v206 = &v205;
                        uint64_t v207 = 0x3052000000LL;
                        v208 = __Block_byref_object_copy__1;
                        v209 = __Block_byref_object_dispose__1;
                        uint64_t v210 = 0LL;
                        v152 = v26;
                        if (v32 && v32[24] == 7)
                        {
                          if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
                          {
                            uint64_t v33 = [v32 name];
                            _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetching inverse to-one relationship %@.",  v34,  v35,  v36,  v37,  v38,  v39,  v33);
                          }

                          uint64_t v40 = [a5 inverseIsToOnePrefetchRequestForRelationshipNamed:v165 onEntity:v26];
                          v224[5] = v40;
                          v241[0] = @"destinations";
                          v240[0] = [MEMORY[0x189607878] expressionForConstantValue:v27];
                          uint64_t v41 = [MEMORY[0x189603F68] dictionaryWithObjects:v240 forKeys:v241 count:1];
LABEL_37:
                          v218[5] = v41;

                          v206[5] = 0LL;
                          uint64_t v199 = 0LL;
                          v200 = &v199;
                          uint64_t v201 = 0x3052000000LL;
                          v202 = __Block_byref_object_copy__1;
                          v203 = __Block_byref_object_dispose__1;
                          uint64_t v204 = 0LL;
                          uint64_t v193 = 0LL;
                          v194 = &v193;
                          uint64_t v195 = 0x3052000000LL;
                          v196 = __Block_byref_object_copy__1;
                          v197 = __Block_byref_object_dispose__1;
                          uint64_t v198 = 0LL;
                          uint64_t v187 = 0LL;
                          v188 = &v187;
                          uint64_t v189 = 0x3052000000LL;
                          v190 = __Block_byref_object_copy__1;
                          v191 = __Block_byref_object_dispose__1;
                          uint64_t v192 = 0LL;
                          uint64_t v183 = 0LL;
                          v184 = &v183;
                          uint64_t v185 = 0x2020000000LL;
                          char v186 = 0;
                          uint64_t v42 = (void *)v224[5];
                          if (!v42) {
                            goto LABEL_40;
                          }
                          uint64_t v43 = objc_msgSend( a1,  "restrictingReadPredicateForEntity:fromClientWithContext:",  objc_msgSend(v42, "entity"),  a5);
                          if (_MergedGlobals_62 != v43)
                          {
                            v224[5] = 0LL;
                            goto LABEL_40;
                          }

                          if (v224[5])
                          {
                            v182[0] = MEMORY[0x1895F87A8];
                            v182[1] = 3221225472LL;
                            v182[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2;
                            v182[3] = &unk_189EA7710;
                            v182[10] = &v223;
                            v182[11] = &v199;
                            v182[4] = v150;
                            v182[5] = v163;
                            v182[12] = &v217;
                            v182[13] = &v205;
                            v182[14] = &v193;
                            v182[15] = &v187;
                            v182[6] = v146;
                            v182[7] = v165;
                            v182[16] = &v211;
                            v182[17] = &v183;
                            v182[8] = v148;
                            v182[9] = v26;
                            [v151 performBlockAndWait:v182];
                            if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
                            {
                              uint64_t v106 = [v26 name];
                              [(id)v200[5] length];
                              _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetched for source entity %@, key '%@'.  Got data with length %lu.",  v107,  v108,  v109,  v110,  v111,  v112,  v106);
                            }

                            id v44 = v200;
                            if (*((_BYTE *)v184 + 24))
                            {

                              v200[5] = 0LL;
                              v82 = (void *)MEMORY[0x189603F18];
                              uint64_t v83 = [v26 name];
                              goto LABEL_85;
                            }
                          }

                          else
                          {
LABEL_40:
                            id v44 = v200;
                          }

                          if (v44[5])
                          {
                            if (v146)
                            {
                              if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                                _NSCoreDataLog( 8LL,  (uint64_t)@"Recursively prefetching subkeys %@ of fetch %@ using OIDs %@ for objects %@",  v45,  v46,  v47,  v48,  v49,  v50,  v146);
                              }
                              id v51 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (void *)v206[5]);
                              uint64_t v52 = -[NSXPCStoreServerRequestHandlingPolicy prefetchRelationships:forFetch:sourceOIDs:fromClientWithContext:]( a1,  v146,  v224[5],  v51,  a5);
                            }

                            else
                            {
                              uint64_t v52 = 0LL;
                            }

                            if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
                            {
                              uint64_t v113 = [v26 name];
                              _NSCoreDataLog( 8LL,  (uint64_t)@"Done prefetching for %@, %@",  v114,  v115,  v116,  v117,  v118,  v119,  v113);
                            }

                            v120 = (void *)MEMORY[0x189603F18];
                            uint64_t v121 = [v26 name];
                            uint64_t v55 = objc_msgSend(v120, "arrayWithObjects:", v165, v121, v212[5], v200[5], v52, 0);

                            if (v188[5])
                            {
                              *(void *)buf = MEMORY[0x1895F87A8];
                              uint64_t v234 = 3221225472LL;
                              v235 = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_79;
                              v236 = &unk_189EA7258;
                              uint64_t v237 = v150;
                              v238 = &v187;
                              [v151 performBlockAndWait:buf];
                            }
                          }

                          else
                          {

                            if (v188[5])
                            {
                              *(void *)buf = MEMORY[0x1895F87A8];
                              uint64_t v234 = 3221225472LL;
                              v235 = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_71;
                              v236 = &unk_189EA7258;
                              uint64_t v237 = v150;
                              v238 = &v187;
                              [v151 performBlockAndWait:buf];
                            }

                            v82 = (void *)MEMORY[0x189603F18];
                            uint64_t v83 = [v26 name];
LABEL_85:
                            uint64_t v55 = objc_msgSend(v82, "arrayWithObjects:", v165, v83, NSArray_EmptyArray, 0);
                          }

                          _Block_object_dispose(&v183, 8);
                          _Block_object_dispose(&v187, 8);
                          _Block_object_dispose(&v193, 8);
                          _Block_object_dispose(&v199, 8);
LABEL_94:
                          _Block_object_dispose(&v205, 8);
                          _Block_object_dispose(&v211, 8);
                          _Block_object_dispose(&v217, 8);
                          _Block_object_dispose(&v223, 8);
LABEL_95:
                          [v147 addObject:v55];
                          goto LABEL_96;
                        }

                        int v56 = *(unsigned __int8 *)(v160 + 24);
                        if (v56 != 7)
                        {
                          if (v56 == 9)
                          {
                            v57 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078E8]),  "initWithObject:",  objc_msgSend(*(id *)(v160 + 56), "name"));
                            uint64_t v58 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v57];

                            uint64_t v59 = [v27 objectAtIndex:0];
                            v60 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v59];
                            uint64_t v61 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v60 rightExpression:v58 modifier:0 type:10 options:0];

                            uint64_t v62 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
                            -[NSFetchRequest setEntity:]( v62,  "setEntity:",  objc_msgSend((id)objc_msgSend((id)v160, "destinationEntity"), "entityDescription"));
                            -[NSFetchRequest setPredicate:](v62, "setPredicate:", v61);

                            v63 = v62;
                            v212[5] = 0LL;
                            v240[0] = MEMORY[0x1895F87A8];
                            v240[1] = 3221225472LL;
                            v240[2] = __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke;
                            v240[3] = &unk_189EA76E8;
                            v240[4] = v150;
                            v240[5] = v62;
                            v240[6] = v27;
                            v240[7] = &v211;
                            [v151 performBlockAndWait:v240];
                            if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
                            {
                              uint64_t v64 = [(id)v160 name];
                              [(id)v212[5] count];
                              _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetched for many-to-many relationship %@.  Got %lu rows",  v65,  v66,  v67,  v68,  v69,  v70,  v64);
                              _NSCoreDataLog( 8LL,  (uint64_t)@"Which means oidSets %@",  v71,  v72,  v73,  v74,  v75,  v76,  v212[5]);
                            }

                            unint64_t v77 = [(id)v212[5] count];
                            uint64_t v78 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v77 + 256];
                            v206[5] = (uint64_t)v78;
                            if (v77)
                            {
                              for (unint64_t k = 0LL; k < v77; k += 2LL)
                              {
                                uint64_t v80 = [(id)v212[5] objectAtIndex:k + 1];
                                [(id)v206[5] addObjectsFromArray:v80];
                              }

                              uint64_t v78 = (void *)v206[5];
                            }

                            if ([v78 count])
                            {
                              uint64_t v81 = [a5 manyToManyPrefetchRequestsForRelationshipNamed:v165 onEntity:v26];
                              v224[5] = v81;
                              v239 = @"mtmObjects";
                              v241[0] = [MEMORY[0x189607878] expressionForConstantValue:v206[5]];
                              uint64_t v41 = [MEMORY[0x189603F68] dictionaryWithObjects:v241 forKeys:&v239 count:1];
                              goto LABEL_37;
                            }

                            goto LABEL_92;
                          }

                          v95 = (void *)MEMORY[0x189603F18];
                          uint64_t v96 = [v26 name];
                          uint64_t v97 = objc_msgSend(v95, "arrayWithObjects:", v165, v96, NSArray_EmptyArray, 0);
LABEL_93:
                          uint64_t v55 = v97;
                          goto LABEL_94;
                        }

                        uint64_t v149 = [v27 count];
                        uint64_t v84 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v149];
                        v206[5] = v84;
                        if (!v149)
                        {
LABEL_76:
                          if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
                          {
                            uint64_t v98 = [(id)v160 name];
                            [(id)v206[5] count];
                            _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetched for one-to-many relationship %@.  Got %lu rows",  v99,  v100,  v101,  v102,  v103,  v104,  v98);
                          }

                          if ([(id)v206[5] count])
                          {
                            uint64_t v105 = [a5 manyToOnePrefetchRequestForRelationshipNamed:v165 onEntity:v26];
                            v224[5] = v105;
                            v241[0] = @"objects";
                            v240[0] = [MEMORY[0x189607878] expressionForConstantValue:v206[5]];
                            uint64_t v41 = [MEMORY[0x189603F68] dictionaryWithObjects:v240 forKeys:v241 count:1];
                            goto LABEL_37;
                          }

void *__94__NSXPCStoreServerRequestHandlingPolicy__coreProcessFetchRequest_fromClientWithContext_error___block_invoke_3( uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

id __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke( uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) newValuesForObjectWithID:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _snapshot];
  return *(id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v48 = 0LL;
  id v9 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v10 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  [a3 entity],  a4);
  id v11 = v10;
  if (v10)
  {
    if ((id)qword_18C4AB898 == v10)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", &unk_189F04188, 0);
    }

    else
    {
      if ((id)_MergedGlobals_62 != v10)
      {
        uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
        -[NSFetchRequest setEntity:](v12, "setEntity:", [a3 entity]);
        uint64_t v13 = [MEMORY[0x189607878] expressionForEvaluatedObject];
        uint64_t v14 = [MEMORY[0x189607878] expressionForConstantValue:a3];
        uint64_t v15 = [MEMORY[0x189607818] predicateWithLeftExpression:v13 rightExpression:v14 modifier:0 type:4 options:0];
        uint64_t v16 = (void *)MEMORY[0x189607820];
        -[NSFetchRequest setPredicate:]( v12,  "setPredicate:",  objc_msgSend( MEMORY[0x189607820],  "andPredicateWithSubpredicates:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v15, v11, 0)));
        id v17 = -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:]( self,  v12,  a4,  &v48);
        int v18 = 1;
        goto LABEL_30;
      }

      uint64_t v20 = (void *)MEMORY[0x189603F18];
      if (self)
      {
        uint64_t v21 = (void *)[a4 managedObjectContext];
        uint64_t v22 = (void *)[v21 persistentStoreCoordinator];
        if (a4) {
          uint64_t v23 = *((void *)a4 + 4);
        }
        else {
          uint64_t v23 = 0LL;
        }
        uint64_t v62 = 0LL;
        v63 = &v62;
        uint64_t v64 = 0x3052000000LL;
        uint64_t v65 = __Block_byref_object_copy__1;
        uint64_t v66 = __Block_byref_object_dispose__1;
        uint64_t v67 = 0LL;
        uint64_t v56 = 0LL;
        v57 = &v56;
        uint64_t v58 = 0x3052000000LL;
        uint64_t v59 = __Block_byref_object_copy__1;
        v60 = __Block_byref_object_dispose__1;
        uint64_t v61 = 0LL;
        uint64_t v50 = 0LL;
        id v51 = &v50;
        uint64_t v52 = 0x3052000000LL;
        v53 = __Block_byref_object_copy__1;
        uint64_t v54 = __Block_byref_object_dispose__1;
        uint64_t v55 = 0LL;
        v49[0] = MEMORY[0x1895F87A8];
        v49[1] = 3221225472LL;
        v49[2] = __95__NSXPCStoreServerRequestHandlingPolicy__coreFaultForObjectWithID_fromClientWithContext_error___block_invoke;
        v49[3] = &unk_189EA76C0;
        v49[4] = v23;
        v49[5] = a3;
        v49[6] = v21;
        v49[7] = &v62;
        v49[8] = &v50;
        v49[9] = &v56;
        [v22 performBlockAndWait:v49];
        id v24 = (id)v51[5];
        if (v63[5])
        {
          uint64_t v25 = (void *)[MEMORY[0x189603FA8] array];
          uint64_t v26 = objc_msgSend((id)objc_msgSend(a3, "entity"), "_propertyRangesByType");
          uint64_t v33 = v26;
          uint64_t v34 = *(void *)(v26 + 56);
          if (v34)
          {
            uint64_t v35 = *(void *)(v26 + 48);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v35, v27, v28, v29, v30, v31, v32);
              uint64_t v37 = v36;
              if (!v36) {
                uint64_t v37 = [MEMORY[0x189603FE8] null];
              }
              [v25 addObject:v37];
              LODWORD(v35) = v35 + 1;
              --v34;
            }

            while (v34);
          }

          uint64_t v38 = *(void *)(v33 + 104);
          if (v38)
          {
            uint64_t v39 = *(void *)(v33 + 96);
            do
            {
              snapshot_get_value_as_object((id *)v57[5], v39, v27, v28, v29, v30, v31, v32);
              uint64_t v41 = v40;
              if (!v40) {
                uint64_t v41 = [MEMORY[0x189603FE8] null];
              }
              [v25 addObject:v41];
              LODWORD(v39) = v39 + 1;
              --v38;
            }

            while (v38);
          }

          objc_msgSend( v25,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", *(int *)(v57[5] + 12)));
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        if (v51[5]) {
          id v48 = (id)v51[5];
        }

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      uint64_t v19 = objc_msgSend(v20, "arrayWithObjects:", &unk_189F04188, v25, 0);
    }

    id v17 = (id)v19;
    int v18 = 0;
    uint64_t v16 = (void *)v19;
    goto LABEL_30;
  }

  int v18 = 0;
  id v17 = 0LL;
  uint64_t v16 = 0LL;
  if (a5) {
    id v48 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134092 userInfo:0];
  }
LABEL_30:
  id v42 = v17;
  id v43 = v48;
  if (a5 && v48) {
    *a5 = v48;
  }
  [v9 drain];
  id v44 = v48;
  id v45 = 0LL;
  id v46 = v17;
  if (v18) {
    return (id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", &unk_189F041A0, v17, 0);
  }
  return v16;
}

- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6
{
  v74[2] = *MEMORY[0x1895F89C0];
  id v72 = 0LL;
  id v71 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (!self) {
    goto LABEL_41;
  }
  id v11 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v12 = [a4 entity];
  if (v12)
  {
    if ((*(_BYTE *)(v12 + 120) & 4) != 0)
    {
      uint64_t v13 = *(void *)(v12 + 72);
    }

    else
    {
      do
      {
        uint64_t v13 = v12;
        uint64_t v12 = [(id)v12 superentity];
      }

      while (v12);
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v14 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  v13,  a5);
  if (v14)
  {
    uint64_t v15 = (void *)objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "existingObjectWithID:error:", a4, 0);
    if (v15)
    {
      if ([v14 evaluateWithObject:v15])
      {
        uint64_t v16 = 0LL;
        int v17 = 1;
      }

      else
      {
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Source object does not match restricting predicate, so returning an error",  v25,  v26,  v27,  v28,  v29,  v30,  v69);
        }
        uint64_t v16 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134093 userInfo:0];
        int v17 = 0;
      }

      goto LABEL_19;
    }

    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
      _NSCoreDataLog( 8LL,  (uint64_t)@"Source object %@ does not exist for relationship fault.",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)a4);
    }
    uint64_t v18 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134093 userInfo:0];
  }

  else
  {
    uint64_t v18 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134092 userInfo:0];
  }

  uint64_t v16 = (void *)v18;
  int v17 = 0;
  uint64_t v15 = 0LL;
LABEL_19:
  id v31 = v16;
  id v32 = v15;
  [v11 drain];
  if (v16) {
    id v72 = v16;
  }
  id v33 = v16;
  if (!v17) {
    goto LABEL_40;
  }
  id v34 = v15;
  if (!v34) {
    goto LABEL_40;
  }
  uint64_t v70 = (void *)[a5 managedObjectContext];
  id v35 = -[NSEntityDescription _relationshipNamed:]((void *)[a4 entity], (uint64_t)a3);
  uint64_t v36 = v35;
  if (v35)
  {
    uint64_t v37 = [v35 destinationEntity];
    uint64_t v38 = v37;
    if (v37)
    {
      if ((*(_BYTE *)(v37 + 120) & 4) != 0)
      {
        uint64_t v39 = *(void *)(v37 + 72);
      }

      else
      {
        do
        {
          uint64_t v39 = v37;
          uint64_t v37 = [(id)v37 superentity];
        }

        while (v37);
      }
    }

    else
    {
      uint64_t v39 = 0LL;
    }

    id v43 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  v39,  a5);
    if (v43)
    {
      if ((id)[MEMORY[0x1896079C8] predicateWithValue:1] == v43)
      {
        v57 = (void *)[v34 valueForKey:a3];
        if (v57)
        {
          uint64_t v58 = [v57 valueForKey:@"objectID"];
          goto LABEL_70;
        }

        if ([v36 isToMany])
        {
LABEL_51:
          uint64_t v58 = [MEMORY[0x189603F18] array];
          goto LABEL_70;
        }
      }

      else
      {
        if ((id)[MEMORY[0x1896079C8] predicateWithValue:0] != v43)
        {
          id v44 = (void *)[v36 inverseRelationship];
          id v45 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
          -[NSFetchRequest setResultType:](v45, "setResultType:", 1LL);
          -[NSFetchRequest setIncludesPropertyValues:](v45, "setIncludesPropertyValues:", 0LL);
          if (v44)
          {
            int v46 = [v44 isToMany];
            uint64_t v47 = (void *)MEMORY[0x1896079C8];
            if (v46)
            {
              id v48 = (void *)[v44 name];
              uint64_t v49 = @"%@ IN %K";
              id v50 = a4;
              a4 = v48;
            }

            else
            {
              id v50 = (id)[v44 name];
              uint64_t v49 = @"%K == %@";
            }

            uint64_t v65 = objc_msgSend(v47, "predicateWithFormat:", v49, v50, a4);
            uint64_t v66 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v65, v43, 0);
            uint64_t v67 = [MEMORY[0x189607820] andPredicateWithSubpredicates:v66];
            -[NSFetchRequest setEntity:](v45, "setEntity:", v38);
            -[NSFetchRequest setPredicate:](v45, "setPredicate:", v67);
          }

          else
          {
            if (a5) {
              uint64_t v59 = (void *)*((void *)a5 + 4);
            }
            else {
              uint64_t v59 = 0LL;
            }
            v60 = (void *)[v59 newValueForRelationship:v36 forObjectWithID:a4 withContext:v70 error:&v72];
            if (!v60 || (void *)[MEMORY[0x189603FE8] null] == v60)
            {
              id v64 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  v38,  a5);
            }

            else
            {
              else {
                uint64_t v61 = @"self == %@";
              }
              uint64_t v62 = objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", v61, v60);
              uint64_t v63 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v62, v43, 0);
              id v64 = (id)[MEMORY[0x189607820] andPredicateWithSubpredicates:v63];
            }

            id v68 = v64;
            -[NSFetchRequest setEntity:](v45, "setEntity:", v38);
            -[NSFetchRequest setPredicate:](v45, "setPredicate:", v68);
          }

          -[NSFetchRequest setResultType:](v45, "setResultType:", 1LL);
          id v51 = (void *)[v70 executeFetchRequest:v45 error:&v72];
          if ([v36 isToMany]) {
            goto LABEL_71;
          }
          if ([v51 count]) {
            uint64_t v58 = [v51 lastObject];
          }
          else {
            uint64_t v58 = [MEMORY[0x189603FE8] null];
          }
LABEL_70:
          id v51 = (void *)v58;
LABEL_71:
          LODWORD(self) = 1;
          goto LABEL_42;
        }
      }

      uint64_t v58 = [MEMORY[0x189603FE8] null];
      goto LABEL_70;
    }

    if (a6)
    {
      id v42 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134092 userInfo:0];
      goto LABEL_39;
    }

    goto LABEL_40;
  }

  if (!a6)
  {
LABEL_40:
    LODWORD(self) = 0;
LABEL_41:
    id v51 = 0LL;
    goto LABEL_42;
  }

  uint64_t v40 = (void *)MEMORY[0x189607870];
  v73[0] = @"relationship name";
  v73[1] = @"objectID";
  v74[0] = a3;
  v74[1] = a4;
  uint64_t v41 = [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:2];
  id v42 = (void *)[v40 errorWithDomain:*MEMORY[0x189607460] code:134094 userInfo:v41];
LABEL_39:
  LODWORD(self) = 0;
  id v51 = 0LL;
  id v72 = v42;
LABEL_42:
  id v52 = v51;
  id v53 = v72;
  [v71 drain];
  id v54 = v72;
  if (a6 && v72) {
    *a6 = v72;
  }
  id v55 = v54;
  if ((_DWORD)self) {
    return v51;
  }
  else {
    return 0LL;
  }
}

id __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke( uint64_t a1)
{
  id result = -[NSSQLCore newObjectIDSetsForToManyPrefetchingRequest:andSourceObjectIDs:orderColumnName:]( *(void **)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  0LL);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
  return result;
}

void __141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_2( uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog( 8LL,  (uint64_t)@"Decoding prefetched rows for fetch %@",  v2,  v3,  v4,  v5,  v6,  v7,  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL));
  }
  -[NSSQLCore _newRowDataForXPCFetch:variables:context:error:]( *(void *)(a1 + 32),  *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL),  *(void **)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL),  *(void *)(a1 + 40),  0LL);
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL) = v8;
  if ([*(id *)(a1 + 48) count])
  {

    *(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL) = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 40LL) = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  *(void **)(*(void *)(*(void *)(a1 + 88) + 8LL)
                                                                              + 40LL),
                                                                     *(NSFetchRequest **)(*(void *)(*(void *)(a1 + 80) + 8LL)
                                                                                        + 40LL),
                                                                     0LL,
                                                                     *(NSPersistentStore **)(a1 + 32),
                                                                     *(NSManagedObjectContext **)(a1 + 40),
                                                                     (void *)(*(void *)(*(void *)(a1 + 120) + 8LL)
                                                                              + 40LL),
                                                                     0LL);
    -[NSSQLCore _cacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 120) + 8LL) + 40LL));
    if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 40LL)) {
      uint64_t v9 = [objc_alloc(MEMORY[0x189603FE0]) initWithArray:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    }
    else {
      uint64_t v9 = 0LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL) = v9;
    if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
    {
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) entity];
        _NSCoreDataLog(8LL, (uint64_t)@"Prefetched %@/%@ and got %@", v11, v12, v13, v14, v15, v16, v10);
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 120) + 8LL) + 40LL))
      {
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        int v17 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8LL) + 40LL);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = 0LL;
          uint64_t v20 = *(void *)v30;
          do
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              _PFFaultHandlerFulfillFault( *(void *)(a1 + 64),  *(void *)(*((void *)&v29 + 1) + 8 * i),  *(void *)(a1 + 40),  (void *)[*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) objectAtIndex:v19 + i],  0);
            }

            uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
            v19 += i;
          }

          while (v18);
        }
      }
    }

    else
    {
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) entity];
        _NSCoreDataLog( 8LL,  (uint64_t)@"Prefetched %@/%@ and got no results, stopping now",  v23,  v24,  v25,  v26,  v27,  v28,  v22);
      }

      -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 120) + 8LL) + 40LL));
      *(_BYTE *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) = 1;
    }
  }

void *__141__NSXPCStoreServerRequestHandlingPolicy__prefetchRelationshipKey_sourceEntityDescription_sourceObjectIDs_prefetchRelationshipKeys_inContext___block_invoke_79( uint64_t a1)
{
  return -[NSSQLCore _uncacheRows:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  v142[16] = *(id *)MEMORY[0x1895F89C0];
  switch([a3 requestType])
  {
    case 1LL:
      if (!self) {
        return 0LL;
      }
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel");
      uint64_t v9 = [a3 entityName];
      if (v8) {
        uint64_t v10 = [*(id *)(v8 + 32) objectForKey:v9];
      }
      else {
        uint64_t v10 = 0LL;
      }
      id v11 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  v10,  a4);
      if (!v11)
      {
        if (a5) {
          *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134092 userInfo:0];
        }
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Process fetch request aborting (predicate is nil)",  v68,  v69,  v70,  v71,  v72,  v73,  v118);
        }
        return 0LL;
      }

      id v12 = v11;
      if ([(id)qword_18C4AB898 isEqual:v11])
      {
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Process fetch request returning no results (predicate is false)",  v13,  v14,  v15,  v16,  v17,  v18,  v118);
        }
        return (id)[MEMORY[0x189603F18] array];
      }

      else
      {
        if (([(id)_MergedGlobals_62 isEqual:v12] & 1) == 0)
        {
          uint64_t v96 = [a3 predicate];
          if (v96)
          {
            uint64_t v97 = objc_msgSend( MEMORY[0x189607820],  "andPredicateWithSubpredicates:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v96, v12, 0));
            id v98 = a3;
          }

          else
          {
            id v98 = a3;
            uint64_t v97 = (uint64_t)v12;
          }

          [v98 setPredicate:v97];
        }

        return -[NSXPCStoreServerRequestHandlingPolicy _coreProcessFetchRequest:fromClientWithContext:error:]( self,  a3,  a4,  a5);
      }

    case 2LL:
      if (!self) {
        return 0LL;
      }
      id v140 = 0LL;
      id v120 = objc_alloc_init(MEMORY[0x1896077E8]);
      id v131 = (id)[MEMORY[0x189603FC8] dictionary];
      uint64_t v119 = (void *)[a4 managedObjectContext];
      id v129 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v32 = objc_alloc_init(MEMORY[0x189603FA8]);
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects"));
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "updatedObjects"), "allObjects"));
      objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "lockedObjects"), "allObjects"));
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      obuint64_t j = v32;
      uint64_t v33 = 0LL;
      uint64_t v34 = [v32 countByEnumeratingWithState:&v136 objects:v142 count:16];
      if (!v34) {
        goto LABEL_87;
      }
      uint64_t v35 = *(void *)v137;
      uint64_t v122 = *MEMORY[0x189607460];
      do
      {
        uint64_t v124 = v33;
        uint64_t v36 = 0LL;
        do
        {
          if (*(void *)v137 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v136 + 1) + 8 * v36);
          uint64_t v38 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v39 = (void *)[v37 objectID];
          uint64_t v40 = [v39 entity];
          if (v40)
          {
            if ((*(_BYTE *)(v40 + 120) & 4) != 0)
            {
              uint64_t v41 = *(void **)(v40 + 72);
            }

            else
            {
              do
              {
                uint64_t v41 = (void *)v40;
                uint64_t v40 = [(id)v40 superentity];
              }

              while (v40);
            }
          }

          else
          {
            uint64_t v41 = 0LL;
          }

          uint64_t v42 = [v41 name];
          id v43 = -[NSXPCStoreServerRequestHandlingPolicy restrictingWritePredicateForEntity:fromClientWithContext:]( self,  "restrictingWritePredicateForEntity:fromClientWithContext:",  v41,  a4);
          id v44 = v43;
          if (v43)
          {
            if (([v43 evaluateWithObject:v37] & 1) == 0)
            {
              if (![v129 count]) {
                objc_msgSend( v129,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189603FA8], "array"),  @"NSAffectedObjectsErrorKey");
              }
              objc_msgSend( (id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"),  "addObject:",  v37);
            }

            id v45 = (id)[v131 objectForKey:v42];
            if (!v45)
            {
              id v45 = objc_alloc_init(MEMORY[0x189603FA8]);
              [v131 setObject:v45 forKey:v42];
            }

            [v45 addObject:v39];
          }

          else
          {
            if (a5) {
              id v140 = (id)[MEMORY[0x189607870] errorWithDomain:v122 code:134092 userInfo:0];
            }
            uint64_t v124 = [MEMORY[0x189607968] numberWithBool:0];
            uint64_t v128 = (void *)v124;
          }

          objc_autoreleasePoolPop(v38);
          if (!v44)
          {
            v57 = (void *)v124;
            uint64_t v56 = obj;
            goto LABEL_157;
          }

          ++v36;
        }

        while (v36 != v34);
        uint64_t v46 = [obj countByEnumeratingWithState:&v136 objects:v142 count:16];
        uint64_t v34 = v46;
        uint64_t v33 = v124;
      }

      while (v46);
LABEL_87:

      v125 = (void *)v33;
      uint64_t v80 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      uint64_t v81 =  -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  3LL);
      -[NSManagedObjectContext setUndoManager:](v81, "setUndoManager:", 0LL);
      -[NSManagedObjectContext setPersistentStoreCoordinator:]( v81,  "setPersistentStoreCoordinator:",  [v119 persistentStoreCoordinator]);
      id obja = (id)objc_msgSend((id)objc_msgSend(v119, "persistentStoreCoordinator"), "managedObjectModel");
      __int128 v134 = 0u;
      __int128 v135 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      uint64_t v82 = [v131 countByEnumeratingWithState:&v132 objects:v141 count:16];
      if (!v82) {
        goto LABEL_117;
      }
      uint64_t v123 = *(void *)v133;
      uint64_t v121 = *MEMORY[0x189607460];
      while (1)
      {
        for (uint64_t i = 0LL; i != v82; ++i)
        {
          if (*(void *)v133 != v123) {
            objc_enumerationMutation(v131);
          }
          uint64_t v84 = *(void *)(*((void *)&v132 + 1) + 8 * i);
          uint64_t v85 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v86 = objc_msgSend((id)objc_msgSend(obja, "entitiesByName"), "objectForKey:", v84);
          -[NSFetchRequest setEntity:](v80, "setEntity:", v86);
          uint64_t v87 = (void *)[v131 objectForKey:v84];
          id v88 = -[NSXPCStoreServerRequestHandlingPolicy restrictingReadPredicateForEntity:fromClientWithContext:]( self,  "restrictingReadPredicateForEntity:fromClientWithContext:",  v86,  a4);
          if (v88)
          {
            if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896079C8], "predicateWithValue:", 0),  "isEqual:",  v88))
            {
              if (![v129 count]) {
                objc_msgSend( v129,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189603FA8], "array"),  @"NSAffectedObjectsErrorKey");
              }
              objc_msgSend( (id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"),  "addObjectsFromArray:",  v87);
            }

            else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1896079C8], "predicateWithValue:", 1), "isEqual:", v88))
            {
              goto LABEL_109;
            }

            if ([v87 count]) {
              uint64_t v91 = [MEMORY[0x1896079C8] predicateWithFormat:@"SELF IN %@", v87];
            }
            else {
              uint64_t v91 = [MEMORY[0x1896079C8] predicateWithValue:0];
            }
            uint64_t v92 = v91;
            uint64_t v93 = [MEMORY[0x189607820] notPredicateWithSubpredicate:v88];
            uint64_t v118 = v92;
            -[NSFetchRequest setPredicate:]( v80,  "setPredicate:",  objc_msgSend( MEMORY[0x189607820],  "andPredicateWithSubpredicates:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v93)));
            unint64_t v94 = -[NSManagedObjectContext executeFetchRequest:error:](v81, "executeFetchRequest:error:", v80, &v140);
            if (v94)
            {
              if (-[NSArray count](v94, "count"))
              {
                if (![v129 count]) {
                  objc_msgSend( v129,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189603FA8], "array"),  @"NSAffectedObjectsErrorKey");
                }
                objc_msgSend( (id)objc_msgSend(v129, "objectForKey:", @"NSAffectedObjectsErrorKey"),  "addObjectsFromArray:",  v87);
              }

- (id)allowableClassesForClientWithContext:(id)a3
{
  return (id)NSSet_EmptySet;
}

- (void)processObtainRequest:(void *)a3 inContext:(void *)a4 error:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v39 = (void *)[MEMORY[0x189603FC8] dictionary];
  context = (void *)MEMORY[0x186E3E5D8]();
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obuint64_t j = a2;
  uint64_t v38 = [a2 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v38)
  {
    id v5 = 0LL;
    uint64_t v36 = *(void *)v43;
    uint64_t v35 = *MEMORY[0x189607460];
    while (1)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v42 + 1) + 8 * v6);
        uint64_t v8 = (void *)[obj objectForKey:v7];
        id v50 = 0LL;
        id v9 = objc_alloc_init(MEMORY[0x1896077E8]);
        uint64_t v10 = (void *)[a3 managedObjectContext];
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "persistentStoreCoordinator"), "managedObjectModel");
        if (!v11)
        {
          uint64_t v13 = 0LL;
LABEL_38:
          uint64_t v14 = 0LL;
          goto LABEL_13;
        }

        uint64_t v12 = [*(id *)(v11 + 32) objectForKey:v7];
        uint64_t v13 = v12;
        if (!v12) {
          goto LABEL_38;
        }
        if ((*(_BYTE *)(v12 + 120) & 4) != 0)
        {
          uint64_t v14 = *(void *)(v12 + 72);
        }

        else
        {
          do
          {
            uint64_t v14 = v12;
            uint64_t v12 = [(id)v12 superentity];
          }

          while (v12);
        }

@end