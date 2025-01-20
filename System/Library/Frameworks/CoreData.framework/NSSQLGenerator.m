@interface NSSQLGenerator
+ (void)initialize;
- (NSSQLGenerator)initWithPersistentStore:(id)a3;
- (NSSQLiteStatement)newSQLStatementForRequest:(void *)a3 ignoreInheritance:(int)a4 countOnly:(uint64_t)a5 nestingLevel:(int)a6 nestIsWhereScoped:(uint64_t)a7 requestContext:;
- (NSSQLiteStatement)newSQLStatmentForBinaryIndex:(uint64_t)a3 inStore:;
- (id)initializeContextForRequest:(int)a3 ignoreInheritance:(uint64_t)a4 nestingLevel:;
- (void)generateGroupByIntermediatesForProperties:(uint64_t)a1 inContext:(void *)a2;
- (void)generateHavingIntermediateForPredicate:(uint64_t)a1 inContext:(void *)a2;
- (void)generateIntermediateForLimit:(uint64_t)a1 inContext:(void *)a2;
- (void)generateIntermediateForOffset:(uint64_t)a1 inContext:(void *)a2;
- (void)generateOrderIntermediateInContext:(void *)a1;
- (void)generateSelectIntermediateInContext:(void *)a1;
- (void)generateWhereIntermediatesInContext:(void *)a1;
@end

@implementation NSSQLGenerator

- (NSSQLGenerator)initWithPersistentStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLGenerator;
  result = -[NSSQLGenerator init](&v5, sel_init);
  if (result) {
    result->_persistentStore = (NSSQLCore *)a3;
  }
  return result;
}

- (NSSQLiteStatement)newSQLStatementForRequest:(void *)a3 ignoreInheritance:(int)a4 countOnly:(uint64_t)a5 nestingLevel:(int)a6 nestIsWhereScoped:(uint64_t)a7 requestContext:
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  LODWORD(v10) = a4;
  uint64_t v14 = [a2 requestType];
  v15 = (void *)MEMORY[0x186E3E5D8]();
  if (v14 == 1)
  {
    id v16 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, (int)a3, a5);
    id v17 = v16;
    if (a6) {
      [v16 setValue:MEMORY[0x189604A88] forKey:@"nestedWhereSelect"];
    }
    v18 = (void *)objc_msgSend((id)objc_msgSend(a2, "havingPredicate"), "minimalFormInContext:", v17);
    if (![v17 objectForKey:@"NSUnderlyingException"]
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x189607A48], "defaultInstance"), "isEqual:", v18) & 1) == 0
      && v18)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSSQLPredicateAnalyser);
      [v17 setObject:v19 forKey:@"havingPredicateAnalyser"];

      [v18 acceptVisitor:v19 flags:1];
      [v17 setObject:v18 forKey:@"havingPredicate"];
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    if (a7 && (uint64_t v20 = *(void *)(a7 + 216)) != 0)
    {
      [v17 setObject:v20 forKey:@"substitutionVariables"];
      uint64_t v21 = MEMORY[0x189604A88];
      v22 = @"duringPrefetching";
    }

    else
    {
      if (![a2 substitutionVariables]) {
        goto LABEL_17;
      }
      uint64_t v21 = [a2 substitutionVariables];
      v22 = @"substitutionVariables";
    }

    [v17 setObject:v21 forKey:v22];
LABEL_17:
    if ([v17 objectForKey:@"substitutionVariables"])
    {
      id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
      [v17 setObject:v23 forKey:@"subOrder"];

      id v24 = objc_alloc_init(MEMORY[0x189603FA8]);
      [v17 setObject:v24 forKey:@"columnSubOrder"];
    }

    goto LABEL_19;
  }

  id v17 = -[NSSQLGenerator initializeContextForRequest:ignoreInheritance:nestingLevel:](a1, a2, 0, 0LL);
LABEL_19:
  v25 = (void *)[v17 objectForKey:@"NSUnderlyingException"];
  if ([v17 objectForKey:@"NSUnderlyingException"])
  {
    id v102 = v25;

    objc_exception_throw(v25);
  }

  v26 = -[NSSQLiteAdapter newStatementWithEntity:]( (NSSQLiteStatement *)[*(id *)(a1 + 8) adapter],  objc_msgSend(v17, "objectForKey:", @"entity"));
  if (objc_msgSend( (id)objc_msgSend(MEMORY[0x189607890], "defaultInstance"),  "isEqual:",  objc_msgSend(v17, "objectForKey:", @"predicate")))
  {
LABEL_128:
    if (v26) {
      v26->_isImpossibleCondition = 1;
    }
    uint64_t v95 = [NSString stringWithFormat:@"SELECT 0 FROM %@ WHERE 0 = 1", objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"entity"), "tableName")];
    if (v26)
    {
      v96 = (void *)v95;
      sqlString = v26->_sqlString;
      if (sqlString != (NSString *)v95)
      {

        v26->_sqlString = (NSString *)[v96 copy];
      }
    }

    goto LABEL_138;
  }

  if (v14 != 8 && v14 != 1)
  {
    uint64_t v36 = [v17 objectForKey:@"entity"];
    if ([v17 objectForKey:@"outerFetch"])
    {
      v27 = (NSSQLUpdateIntermediate *)*MEMORY[0x189603A60];
      [v17 setValue:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported nested update inside of %@", objc_msgSend(v17, "objectForKey:", @"outerFetch")), 0), @"NSUnderlyingException" forKey];
      goto LABEL_109;
    }

    v27 = objc_alloc(&OBJC_CLASS___NSSQLUpdateIntermediate);
    v37 = -[NSSQLUpdateIntermediate initWithEntity:alias:inScope:]( v27,  "initWithEntity:alias:inScope:",  v36,  objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"aliasGenerator"), "generateTableAlias"),  0);
    [v17 setObject:v37 forKey:@"outerFetch"];

    -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
    if ([v17 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_108;
    }
    v106 = (NSSQLFetchDictionaryCountIntermediate *)v37;
    v38 = (void *)[v17 objectForKey:@"storeRequest"];
    uint64_t v105 = [v17 objectForKey:@"outerFetch"];
    v39 = (void *)[v38 propertiesToUpdate];
    keyCallBacks.version = *MEMORY[0x189605240];
    keyCallBacks.retain = 0LL;
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
    v40 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x189605240] + 40LL);
    keyCallBacks.release = 0LL;
    keyCallBacks.hash = v40;
    CFIndex v41 = *MEMORY[0x189605250];
    *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
    v42 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605250] + 24LL);
    valueCallBacks.version = v41;
    valueCallBacks.copyDescription = v42;
    valueCallBacks.equal = 0LL;
    v43 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &keyCallBacks, &valueCallBacks);
    v10 = CFDictionaryCreateMutable(v43, 0LL, &keyCallBacks, &valueCallBacks);
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    uint64_t v44 = [v39 countByEnumeratingWithState:&v128 objects:v136 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v129;
      do
      {
        for (uint64_t i = 0LL; i != v45; ++i)
        {
          if (*(void *)v129 != v46) {
            objc_enumerationMutation(v39);
          }
          CFDictionarySetValue( v10,  *(const void **)(*((void *)&v128 + 1) + 8 * i),  (const void *)[v39 objectForKey:*(void *)(*((void *)&v128 + 1) + 8 * i)]);
        }

        uint64_t v45 = [v39 countByEnumeratingWithState:&v128 objects:v136 count:16];
      }

      while (v45);
    }

    v107 = v26;
    v108 = v15;
    id v110 = v17;
    if (CFDictionaryGetCount(v10) >= 1)
    {
      unint64_t v48 = 0x189607000uLL;
      do
      {
        context = (void *)MEMORY[0x186E3E5D8]();
        v49 = (void *)+[_PFRoutines anyObjectFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v10);
        Value = (void *)CFDictionaryGetValue(v10, v49);
        if ([v49 attributeType] == 2100)
        {
          a3 = (void *)[Value constantValue];
          __int128 v124 = 0u;
          __int128 v125 = 0u;
          __int128 v126 = 0u;
          __int128 v127 = 0u;
          uint64_t v117 = [a3 countByEnumeratingWithState:&v124 objects:v135 count:16];
          if (v117)
          {
            v51 = 0LL;
            v115 = v49;
            uint64_t v116 = *(void *)v125;
            v114 = a3;
            do
            {
              for (uint64_t j = 0LL; j != v117; ++j)
              {
                v119 = v51;
                if (*(void *)v125 != v116) {
                  objc_enumerationMutation(a3);
                }
                uint64_t v53 = *(void *)(*((void *)&v124 + 1) + 8 * j);
                v54 = (void *)MEMORY[0x186E3E5D8]();
                v55 = (const void *)[a3 objectForKey:v53];
                __int128 v120 = 0u;
                __int128 v121 = 0u;
                __int128 v122 = 0u;
                __int128 v123 = 0u;
                v56 = (void *)[v49 elements];
                uint64_t v57 = [v56 countByEnumeratingWithState:&v120 objects:v134 count:16];
                if (!v57)
                {
                  v51 = v119;
                  goto LABEL_65;
                }

                uint64_t v58 = v57;
                v118 = v54;
                unint64_t v59 = v48;
                v60 = v10;
                uint64_t v61 = *(void *)v121;
LABEL_55:
                uint64_t v62 = 0LL;
                while (1)
                {
                  if (*(void *)v121 != v61) {
                    objc_enumerationMutation(v56);
                  }
                  v63 = *(void **)(*((void *)&v120 + 1) + 8 * v62);
                  if (objc_msgSend((id)objc_msgSend(v63, "name"), "isEqualToString:", v53)) {
                    break;
                  }
                  if (v58 == ++v62)
                  {
                    uint64_t v58 = [v56 countByEnumeratingWithState:&v120 objects:v134 count:16];
                    if (!v58)
                    {
                      v10 = v60;
                      unint64_t v48 = v59;
                      a3 = v114;
                      v49 = v115;
                      v51 = v119;
                      goto LABEL_63;
                    }

                    goto LABEL_55;
                  }
                }

                v51 = v63;
                v10 = v60;
                unint64_t v48 = v59;
                a3 = v114;
                v49 = v115;
LABEL_63:
                v54 = v118;
LABEL_65:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  CFDictionarySetValue(v10, v51, v55);
                }

                else
                {
                  v64 = (void *)[objc_alloc(*(Class *)(v48 + 2096)) initWithObject:v55];
                  CFDictionarySetValue(v10, v51, v64);
                }

                objc_autoreleasePoolPop(v54);
              }

              uint64_t v117 = [a3 countByEnumeratingWithState:&v124 objects:v135 count:16];
            }

            while (v117);
          }
        }

        else
        {
          CFDictionarySetValue(theDict, v49, Value);
        }

        CFDictionaryRemoveValue(v10, v49);
        objc_autoreleasePoolPop(context);
      }

      while (CFDictionaryGetCount(v10) > 0);
    }

    CFRelease(v10);
    v27 = (NSSQLUpdateIntermediate *)v105;
    v65 = -[NSSQLUpdateColumnsIntermediate initWithPropertiesToUpdate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLUpdateColumnsIntermediate),  "initWithPropertiesToUpdate:inScope:",  theDict,  v105);
    -[NSSQLUpdateIntermediate setUpdateColumnsIntermediate:](v105, v65);

    CFRelease(theDict);
    v15 = v108;
    id v17 = v110;
    v66 = v106;
    v26 = v107;
    if (v106 && v106->_realFetch) {
      goto LABEL_110;
    }
    goto LABEL_108;
  }

  a3 = (void *)[v17 objectForKey:@"storeRequest"];
  v27 = (NSSQLUpdateIntermediate *)[v17 objectForKey:@"informationGatherer"];
  v28 = (void *)[v17 objectForKey:@"havingPredicateAnalyser"];
  if (!v27) {
    goto LABEL_143;
  }
  for (k = v27->super._governingAlias; ; k = 0LL)
  {
    if (-[NSString count](k, "count") || (!v28 ? (v30 = 0) : (v30 = (void *)v28[3]), [v30 count]))
    {
      if (v27) {
        governingAlias = v27->super._governingAlias;
      }
      else {
        governingAlias = 0LL;
      }
      uint64_t v32 = -[NSString count](governingAlias, "count");
      v27 = (NSSQLUpdateIntermediate *)MEMORY[0x189603F70];
      uint64_t v33 = *MEMORY[0x189603A60];
      v34 = (void *)NSString;
      if (v32) {
        uint64_t v35 = objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"storeRequest"), "predicate");
      }
      else {
        uint64_t v35 = [v17 objectForKey:@"havingPredicate"];
      }
      [v17 setObject:-[NSSQLUpdateIntermediate exceptionWithName:reason:userInfo:]( v27, "exceptionWithName:reason:userInfo:", v33, objc_msgSend(v34, "stringWithFormat:", @"Unsupported predicate %@", v35), 0), @"NSUnderlyingException" forKey];
      goto LABEL_109;
    }

    if ((_DWORD)v10 && !objc_msgSend((id)objc_msgSend(a3, "propertiesToFetch"), "count")) {
      v67 = off_189EA5570;
    }
    else {
      v67 = off_189EA5578;
    }
    id v68 = objc_alloc(*v67);
    v27 = (NSSQLUpdateIntermediate *)[v17 objectForKey:@"entity"];
    v66 = (NSSQLFetchDictionaryCountIntermediate *)objc_msgSend( v68,  "initWithEntity:alias:inScope:",  v27,  objc_msgSend( (id)objc_msgSend(v17, "objectForKey:", @"aliasGenerator"),  "generateTableAlias"),  0);
    [v17 setObject:v66 forKey:@"outerFetch"];

    -[NSSQLGenerator generateWhereIntermediatesInContext:](v17);
    if ([v17 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_108;
    }
    v27 = (NSSQLUpdateIntermediate *)[a3 propertiesToGroupBy];
    uint64_t v69 = [v17 objectForKey:@"havingPredicate"];
    uint64_t v70 = v69;
    if (!v27 && v69)
    {
      v71 = (void *)MEMORY[0x189603F70];
      uint64_t v72 = *MEMORY[0x189603A60];
      v73 = @"Invalid fetch request: HAVING with no GROUP BY";
LABEL_107:
      objc_msgSend( v17,  "setObject:forKey:",  objc_msgSend(v71, "exceptionWithName:reason:userInfo:", v72, v73, 0),  @"NSUnderlyingException");
LABEL_108:
      [v17 removeObjectForKey:@"outerFetch"];
LABEL_109:
      v66 = 0LL;
      goto LABEL_110;
    }

    if (v27)
    {
      if ([a3 resultType] != 2)
      {
        v71 = (void *)MEMORY[0x189603F70];
        uint64_t v72 = *MEMORY[0x189603A60];
        v73 = @"Invalid fetch request: GROUP BY requires NSDictionaryResultType";
        goto LABEL_107;
      }

      -[NSSQLGenerator generateGroupByIntermediatesForProperties:inContext:]((uint64_t)v27, v17);
      if (!v66) {
        goto LABEL_108;
      }
      if (!v66[1].super.super.super.isa) {
        goto LABEL_108;
      }
      if (v70)
      {
        -[NSSQLGenerator generateHavingIntermediateForPredicate:inContext:](v70, v17);
        if (!v66[1].super.super._scope || [v17 objectForKey:@"NSUnderlyingException"]) {
          goto LABEL_108;
        }
      }
    }

    -[NSSQLGenerator generateSelectIntermediateInContext:](v17);
    if (!-[NSSQLFetchDictionaryCountIntermediate selectIntermediate](v66, "selectIntermediate")) {
      goto LABEL_108;
    }
    -[NSSQLGenerator generateOrderIntermediateInContext:](v17);
    v74 = (void *)[v17 valueForKey:@"substitutionVariables"];
    if ([a3 fetchLimit] || objc_msgSend(v74, "valueForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION")) {
      -[NSSQLGenerator generateIntermediateForLimit:inContext:]([a3 fetchLimit], v17);
    }
    if ([a3 fetchOffset]
      || [v74 valueForKey:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"])
    {
      if (!v66 || !v66->super._limitClause) {
        -[NSSQLGenerator generateIntermediateForLimit:inContext:](0LL, v17);
      }
      -[NSSQLGenerator generateIntermediateForOffset:inContext:]([a3 fetchOffset], v17);
    }

    if ((_DWORD)v10 && objc_msgSend((id)objc_msgSend(a3, "propertiesToFetch"), "count"))
    {
      if (v66) {
        LOBYTE(v66[1].super._correlationToken) = 1;
      }
      v66 =  -[NSSQLFetchDictionaryCountIntermediate initWithFetchIntermediate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLFetchDictionaryCountIntermediate),  "initWithFetchIntermediate:inScope:",  v66,  0LL);
    }

- (id)initializeContextForRequest:(int)a3 ignoreInheritance:(uint64_t)a4 nestingLevel:
{
  v8 = (void *)MEMORY[0x186E3E5D8]();
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v9 setObject:a2 forKey:@"storeRequest"];
  [v9 setObject:*(void *)(a1 + 8) forKey:@"persistentStore"];
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]);
  if (v10) {
    [v9 setObject:v10 forKey:@"entity"];
  }
  objc_msgSend( v9,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", a4),  @"nestingLevel");
  [v9 setObject:supportedFunctions forKey:@"supportedKVCAggregates"];
  v11 = -[NSSQLAliasGenerator initWithNestingLevel:]( objc_alloc(&OBJC_CLASS___NSSQLAliasGenerator),  "initWithNestingLevel:",  a4);
  [v9 setObject:v11 forKey:@"aliasGenerator"];

  if (a3)
  {
    uint64_t v12 = [a2 predicate];
  }

  else
  {
    v13 = (void *)[v9 objectForKey:@"storeRequest"];
    uint64_t v14 = (void *)[v13 predicate];
    uint64_t v15 = [v9 objectForKey:@"entity"];
    uint64_t v16 = v15;
    v18 = v15 && (id v17 = *(void **)(v15 + 152)) != 0 && [v17 count] != 0;
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"ignoreInheritance"), "BOOLValue")) {
      int v19 = 0;
    }
    else {
      int v19 = [v13 includesSubentities];
    }
    if (!v16 || *(void *)(v16 + 160) || ((v19 | !v18) & 1) == 0)
    {
      int v20 = v18 & v19;
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1896078E8]) initWithObject:@"_ent"];
      v22 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v21];

      id v23 = objc_alloc(MEMORY[0x189607968]);
      if (v20 == 1)
      {
        if (v16) {
          uint64_t v24 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v24 = 0LL;
        }
        v25 = (void *)[v23 initWithUnsignedInt:v24];
        v26 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v25];

        uint64_t v27 = [MEMORY[0x189607818] predicateWithLeftExpression:v22 rightExpression:v26 modifier:0 type:3 options:0];
        v28 = (void *)[objc_alloc(MEMORY[0x1896078E8]) initWithObject:@"_ent"];
        v29 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v28];

        id v30 = objc_alloc(MEMORY[0x189607968]);
        if (v16) {
          uint64_t v31 = *(unsigned int *)(v16 + 188);
        }
        else {
          uint64_t v31 = 0LL;
        }
        uint64_t v32 = (void *)[v30 initWithUnsignedInt:v31];
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v32];

        uint64_t v34 = [MEMORY[0x189607818] predicateWithLeftExpression:v29 rightExpression:v33 modifier:0 type:1 options:0];
        id v35 = objc_alloc(MEMORY[0x189603F18]);
        if (v14) {
          uint64_t v36 = objc_msgSend(v35, "initWithObjects:", v14, v27, v34, 0);
        }
        else {
          uint64_t v36 = objc_msgSend(v35, "initWithObjects:", v27, v34, 0, v52);
        }
        v43 = (void *)v36;
        uint64_t v14 = (void *)[MEMORY[0x189607820] andPredicateWithSubpredicates:v36];

        uint64_t v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v27, v34, 0);
        uint64_t v40 = [MEMORY[0x189607820] andPredicateWithSubpredicates:v44];
      }

      else
      {
        if (v16) {
          uint64_t v37 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v37 = 0LL;
        }
        v38 = (void *)[v23 initWithUnsignedInt:v37];
        v39 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v38];

        uint64_t v40 = [MEMORY[0x189607818] predicateWithLeftExpression:v22 rightExpression:v39 modifier:0 type:4 options:0];
        id v41 = objc_alloc(MEMORY[0x189603F18]);
        if (v14) {
          uint64_t v42 = objc_msgSend(v41, "initWithObjects:", v14, v40, 0);
        }
        else {
          uint64_t v42 = objc_msgSend(v41, "initWithObjects:", v40, 0, v51);
        }
        uint64_t v44 = (void *)v42;
        uint64_t v14 = (void *)[MEMORY[0x189607820] andPredicateWithSubpredicates:v42];
      }

      [v9 setObject:v40 forKey:@"restrictingEntityPredicate"];
    }

    uint64_t v12 = [v14 minimalFormInContext:v9];
  }

  uint64_t v45 = (void *)v12;
  if (![v9 objectForKey:@"NSUnderlyingException"]
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x189607A48], "defaultInstance"), "isEqual:", v45) & 1) == 0
    && v45)
  {
    uint64_t v46 = (void *)MEMORY[0x186E3E5D8]();
    v47 = objc_alloc_init(&OBJC_CLASS___NSSQLPredicateAnalyser);
    [v9 setObject:v47 forKey:@"informationGatherer"];
    [v45 acceptVisitor:v47 flags:1];
    [v9 setObject:v45 forKey:@"predicate"];

    objc_autoreleasePoolPop(v46);
  }

  if (![v9 objectForKey:@"NSUnderlyingException"])
  {
    id v48 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v9 setObject:v48 forKey:@"bindVars"];

    id v49 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v9 setObject:v49 forKey:@"selectBindVars"];
  }

  objc_autoreleasePoolPop(v8);
  return v9;
}

- (void)generateWhereIntermediatesInContext:(void *)a1
{
  uint64_t v2 = [a1 objectForKey:@"outerFetch"];
  uint64_t v3 = [a1 objectForKey:@"predicate"];
  if (v3)
  {
    uint64_t v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_super v5 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSimpleWhereIntermediate),  "initWithPredicate:inScope:",  v4,  v2);
      v8 = v5;
      uint64_t v6 = v2;
LABEL_7:
      -[NSSQLStatementIntermediate setWhereIntermediate:](v6, v5);

      return;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]( objc_alloc(&OBJC_CLASS___NSSQLCompoundWhereIntermediate),  "initWithPredicate:inScope:inContext:",  v4,  v2,  a1);
      if (v7)
      {
        objc_super v5 = (NSSQLSimpleWhereIntermediate *)v7;
        uint64_t v6 = v2;
        v8 = v5;
        goto LABEL_7;
      }
    }

    else
    {
      [a1 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend(NSString, "stringWithFormat:", @"Unknown predicate type for predicate: %@", v4), 0), @"NSUnderlyingException" forKey];
    }
  }

- (void)generateSelectIntermediateInContext:(void *)a1
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)[a1 objectForKey:@"outerFetch"];
  uint64_t v3 = (void *)[a1 objectForKey:@"entity"];
  uint64_t v4 = (void *)[a1 objectForKey:@"storeRequest"];
  uint64_t v5 = [v4 resultType];
  int v6 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"nestingLevel"), "unsignedIntValue");
  if (objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "count")) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 2;
  }
  int v8 = v7;
  if (!v6)
  {
    if (v8)
    {
      BOOL v18 = (void *)objc_msgSend((id)objc_msgSend(v4, "propertiesToFetch"), "mutableCopy");
      if ([v18 count])
      {
        if (!v5)
        {
          uint64_t v46 = v3;
          v47 = v2;
          uint64_t v19 = [v18 count];
          if (v19 - 1 >= 0)
          {
            uint64_t v20 = v19;
            do
            {
            }

            while (v20 > 0);
          }

          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          uint64_t v21 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v49;
            while (2)
            {
              for (uint64_t i = 0LL; i != v22; ++i)
              {
                if (*(void *)v49 != v23) {
                  objc_enumerationMutation(v18);
                }
                v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                unint64_t v26 = [v25 _propertyType];
                if (v26 > 7 || ((1LL << v26) & 0xD4) == 0)
                {
                  [a1 setValue:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Bad fetch request (NSManagedObjectResultType not compatible with contents of propertiesToFetch - property %@)", objc_msgSend(v25, "name")), 0), @"NSUnderlyingException" forKey];

                  return;
                }
              }

              uint64_t v22 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          v28 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
          -[NSPropertyDescription setName:](v28, "setName:", @"ZZ_PK");
          -[NSExpressionDescription setExpression:]( v28,  "setExpression:",  [MEMORY[0x189607878] expressionForEvaluatedObject]);
          -[NSExpressionDescription setExpressionResultType:](v28, "setExpressionResultType:", 2000LL);
          [v18 insertObject:v28 atIndex:0];

          uint64_t v3 = v46;
          uint64_t v2 = v47;
        }

- (void)generateOrderIntermediateInContext:(void *)a1
{
  uint64_t v2 = (void *)[a1 objectForKey:@"storeRequest"];
  if ([v2 sortDescriptors])
  {
    uint64_t v3 = [a1 objectForKey:@"outerFetch"];
    uint64_t v4 = -[NSSQLOrderIntermediate initWithSortDescriptors:inScope:]( [NSSQLOrderIntermediate alloc],  "initWithSortDescriptors:inScope:",  [v2 sortDescriptors],  v3);
    -[NSSQLStatementIntermediate setOrderIntermediate:](v3, v4);
  }

- (void)generateIntermediateForLimit:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = -[NSSQLLimitIntermediate initWithLimit:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLLimitIntermediate),  "initWithLimit:inScope:",  a1,  v3);
  -[NSSQLStatementIntermediate setLimitIntermediate:](v3, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_self();
    supportedFunctions = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"@min",  @"@max",  @"@sum",  @"@avg",  0);
  }

- (void)generateIntermediateForOffset:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = -[NSSQLOffsetIntermediate initWithOffset:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLOffsetIntermediate),  "initWithOffset:inScope:",  a1,  v3);
  -[NSSQLFetchIntermediate setOffsetIntermediate:](v3, v4);
}

- (void)generateGroupByIntermediatesForProperties:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v3 = [a2 objectForKey:@"outerFetch"];
  uint64_t v4 = -[NSSQLGroupByIntermediate initWithProperties:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLGroupByIntermediate),  "initWithProperties:inScope:",  a1,  v3);
  -[NSSQLFetchIntermediate setGroupByIntermediate:](v3, v4);
}

- (void)generateHavingIntermediateForPredicate:(uint64_t)a1 inContext:(void *)a2
{
  uint64_t v4 = [a2 objectForKey:@"outerFetch"];
  uint64_t v5 = -[NSSQLHavingIntermediate initWithPredicate:inScope:inContext:]( objc_alloc(&OBJC_CLASS___NSSQLHavingIntermediate),  "initWithPredicate:inScope:inContext:",  a1,  v4,  a2);
  -[NSSQLFetchIntermediate setHavingIntermediate:](v4, v5);
}

- (NSSQLiteStatement)newSQLStatmentForBinaryIndex:(uint64_t)a3 inStore:
{
  uint64_t v3 = a1;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(a2, "sqlEntity"), @"entity");
    [v7 setObject:a3 forKey:@"persistentStore"];
    uint64_t v8 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "indexDescription"), "partialIndexPredicate"),  "minimalFormInContext:",  v7);
    uint64_t v9 = [MEMORY[0x1896079C8] predicateWithValue:1];
    if (v8 && v9 != v8) {
      [v7 setObject:v8 forKey:@"predicate"];
    }
    uint64_t v10 = (void *)[v7 objectForKey:@"NSUnderlyingException"];
    if ([v7 objectForKey:@"NSUnderlyingException"])
    {
      _NSCoreDataLog(2LL, (uint64_t)@"Unable to generate index for %@", v11, v12, v13, v14, v15, v16, (uint64_t)a2);
      uint64_t v17 = [v10 reason];
      [v10 userInfo];
      _NSCoreDataLog(2LL, (uint64_t)@"Reason: %@, %@", v18, v19, v20, v21, v22, v23, v17);
    }

    else if (objc_msgSend( (id)objc_msgSend(MEMORY[0x189607890], "defaultInstance"),  "isEqual:",  objc_msgSend(v7, "objectForKey:", @"predicate")))
    {
      _NSCoreDataLog(2LL, (uint64_t)@"Unable to generate index for %@", v24, v25, v26, v27, v28, v29, (uint64_t)a2);
      _NSCoreDataLog( 2LL,  (uint64_t)@"Reason: predicate always evaluates to false",  v30,  v31,  v32,  v33,  v34,  v35,  v54);
    }

    else
    {
      uint64_t v3 = -[NSSQLiteAdapter newStatementWithEntity:]( (NSSQLiteStatement *)-[NSSQLEntity adapter](v3->_entity, "adapter"),  [v7 objectForKey:@"entity"]);
      id v37 = -[NSSQLIndexIntermediate initForIndex:withScope:]( objc_alloc(&OBJC_CLASS___NSSQLIndexIntermediate),  "initForIndex:withScope:",  a2,  0LL);
      uint64_t v38 = (NSString *)[v37 generateSQLStringInContext:v7];

      uint64_t v39 = (void *)[v7 objectForKey:@"NSUnderlyingException"];
      if (![v7 objectForKey:@"NSUnderlyingException"])
      {
        if (v3)
        {
          sqlString = v3->_sqlString;
          if (sqlString != v38)
          {

            v3->_sqlString = (NSString *)-[NSString copy](v38, "copy");
          }
        }

        goto LABEL_10;
      }

      _NSCoreDataLog(2LL, (uint64_t)@"Unable to generate index for %@", v40, v41, v42, v43, v44, v45, (uint64_t)a2);
      uint64_t v46 = [v39 reason];
      [v39 userInfo];
      _NSCoreDataLog(2LL, (uint64_t)@"Reason: %@, %@", v47, v48, v49, v50, v51, v52, v46);
    }

    uint64_t v3 = 0LL;
LABEL_10:

    [v6 drain];
  }

  return v3;
}

@end