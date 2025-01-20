@interface NSSQLFetchRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isFaultRequest;
- (BOOL)shouldUseBatches;
- (NSFetchRequest)request;
- (NSSQLFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (NSSQLiteStatement)fetchStatement;
- (id)_createStatement;
- (id)createChildContextForNestedFetchRequest:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (uint64_t)_fireFaultsForValue:(uint64_t)result;
- (uint64_t)addObjectIDsToRegister:(uint64_t)result;
- (uint64_t)addObjectsToAwaken:(uint64_t)result;
- (void)_setupBindVariablesForCachedStatement:(void *)a3 usingValues:;
- (void)addFaultsThatWereFired:(void *)result;
- (void)dealloc;
- (void)executeEpilogue;
- (void)executePrologue;
- (void)setFetchStatement:(id)a3;
- (void)setIsFaultRequest:(BOOL)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLFetchRequestContext

- (NSSQLFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  id v7 = a3;
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (BYTE1(dword_18C4ABDC0))
  {
    if ([a3 fetchBatchSize])
    {
      if ([v7 resultType] == 2 && !objc_msgSend((id)objc_msgSend(v7, "propertiesToGroupBy"), "count"))
      {
        int v9 = [v7 returnsDistinctResults];
        if ((v9 & 1) == 0)
        {
          int v26 = v9;
          if (!objc_msgSend((id)objc_msgSend(v7, "propertiesToFetch"), "count"))
          {
            int v10 = 1;
            goto LABEL_7;
          }

          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          id obj = (id)[v7 propertiesToFetch];
          uint64_t v27 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            BOOL v29 = 0;
            int v10 = v26 ^ 1;
            uint64_t v30 = *(void *)v71;
            while (2)
            {
              uint64_t v31 = 0LL;
              do
              {
                if (*(void *)v71 != v30) {
                  objc_enumerationMutation(obj);
                }
                v32 = *(void **)(*((void *)&v70 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend((id)objc_msgSend(v32, "expression"), "expressionType") == 14
                   || objc_msgSend((id)objc_msgSend(v32, "expression"), "expressionType") == 4))
                {
                  _NSCoreDataLog( 1LL,  (uint64_t)@"Returning unbatched results for unsupported NSExpression in propertiesToFetch: %@",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)v32);
                  [v7 setFetchBatchSize:0];
                  goto LABEL_6;
                }

                BOOL v29 = v29
                   || (objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"objectID") & 1) != 0
                   || objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"self");
                if (objc_msgSend((id)objc_msgSend(v32, "name"), "isEqualToString:", @"isDeleted"))
                {
                  if (!+[_PFRoutines BOOLValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BatchDictionaryFault"))
                  {
                    _NSCoreDataLog( 1LL,  (uint64_t)@"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@",  v55,  v56,  v57,  v58,  v59,  v60,  (uint64_t)v7);
                    goto LABEL_6;
                  }

                  uint64_t v61 = [NSString stringWithUTF8String:"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@"];
                  _NSCoreDataLog(17LL, v61, v62, v63, v64, v65, v66, v67, (uint64_t)v7);
                  v53 = (os_log_s *)__pflogFaultLog;
                  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_6;
                  }
                  *(_DWORD *)buf = 138412290;
                  id v75 = v7;
                  v54 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBa"
                        "tchSize > 0 however propertiesToFetch includes sentinel value 'isDeleted' property: %@";
                  goto LABEL_65;
                }

                ++v31;
              }

              while (v28 != v31);
              uint64_t v39 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
              uint64_t v28 = v39;
              if (v39) {
                continue;
              }
              break;
            }

            if (v29) {
              goto LABEL_7;
            }
          }

          if (+[_PFRoutines BOOLValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BatchDictionaryFault"))
          {
            uint64_t v46 = [NSString stringWithUTF8String:"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 ho wever propertiesToFetch does not include required 'self' or 'objectID' property: %@"];
            _NSCoreDataLog(17LL, v46, v47, v48, v49, v50, v51, v52, (uint64_t)v7);
            v53 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v75 = v7;
              v54 = "CoreData: Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchS"
                    "ize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@";
LABEL_65:
              _os_log_fault_impl(&dword_186681000, v53, OS_LOG_TYPE_FAULT, v54, buf, 0xCu);
            }
          }

          else
          {
            _NSCoreDataLog( 1LL,  (uint64_t)@"Returning unbatched results for NSFetchRequest with NSDictionaryResultType and fetchBatchSize > 0 however propertiesToFetch does not include required 'self' or 'objectID' property: %@",  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v7);
          }
        }
      }
    }
  }

- (NSFetchRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLFetchRequestContext;
  return (NSFetchRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (void)executePrologue
{
  objc_super v3 = -[NSFetchRequest predicate](-[NSSQLFetchRequestContext request](self, "request"), "predicate");
  if (self && v3) {
    -[NSPredicate acceptVisitor:flags:](v3, "acceptVisitor:flags:", self, 1LL);
  }
  v4 = -[NSFetchRequest havingPredicate](-[NSSQLFetchRequestContext request](self, "request"), "havingPredicate");
  if (self && v4) {
    -[NSPredicate acceptVisitor:flags:](v4, "acceptVisitor:flags:", self, 1LL);
  }
  -[NSSQLFetchRequestContext request](self, "request");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)-[NSFetchRequest substitutionVariables]( -[NSSQLFetchRequestContext request](self, "request"),  "substitutionVariables");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __43__NSSQLFetchRequestContext_executePrologue__block_invoke;
    v6[3] = &unk_189EA8E08;
    v6[4] = self;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5)
  {
    if (v5 == 3
      || v5 == 4
      && (sel_valueForKey_ == (char *)[a3 selector]
       || sel_valueForKeyPath_ == (char *)[a3 selector]))
    {
      v6 = (void *)[a3 operand];
      if (![v6 expressionType]) {
        -[NSSQLFetchRequestContext _fireFaultsForValue:]((uint64_t)self, (void *)[v6 constantValue]);
      }
    }
  }

  else
  {
    id v7 = (void *)[a3 constantValue];
    if ((([v7 isNSArray] & 1) != 0
       || ([v7 isNSSet] & 1) != 0
       || [v7 isNSOrderedSet])
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v7 isFault])
    {
      [v7 willRead];
    }
  }

- (BOOL)executeRequestCore:(id *)a3
{
  if (!self) {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }
  error = self->super._error;
  if (error && a3) {
    *a3 = error;
  }
  return !self->super._exception && !self->super._error && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (NSSQLiteStatement)fetchStatement
{
  statement = self->_statement;
  if (statement) {
    return statement;
  }
  if (!-[NSFetchRequest _isCachingFetchRequest]( -[NSSQLFetchRequestContext request](self, "request"),  "_isCachingFetchRequest"))
  {
    statement = -[NSSQLFetchRequestContext _createStatement](self, "_createStatement");
    self->_statement = statement;
    return statement;
  }

  v4 = -[NSSQLFetchRequestContext request](self, "request");
  uint64_t v5 = -[NSFetchRequest _cachedInfoForRequestor:](v4, "_cachedInfoForRequestor:", self->super._connection);
  if (v5)
  {
    uint64_t v6 = v5;
    if (-[NSFetchRequest fetchLimit](v4, "fetchLimit")
      && !objc_msgSend( (id)-[NSFetchRequest substitutionVariables](v4, "substitutionVariables"),  "objectForKey:",  @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
    {
      int v10 = *(void **)(v6 + 16);
      v8 = (void *)(v6 + 16);
      id v7 = v10;
      if (!v10 || !v7[8]) {
        goto LABEL_12;
      }
    }

    else
    {
      int v9 = *(void **)(v6 + 8);
      v8 = (void *)(v6 + 8);
      id v7 = v9;
      if (!v9 || !v7[8])
      {
LABEL_12:

        id v7 = 0LL;
        void *v8 = 0LL;
      }
    }

    char v11 = v7;
    statement = v11;
    if (v11)
    {
      self->_isUsingCachedStatement = 1;
      fetchPlan = self->_fetchPlan;
      $C6D29F7D67899FE11DE7F8953A7C3E5F flags = fetchPlan->flags;
      if ((*(_BYTE *)&flags & 0x18) == 0x10)
      {
        fetchPlan->statement_entity = v11->_fakeEntityForFetch;
        fetchPlan->$C6D29F7D67899FE11DE7F8953A7C3E5F flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
      }

      prefetchingSubstitutionVariables = self->_prefetchingSubstitutionVariables;
      if (prefetchingSubstitutionVariables) {
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]( (uint64_t)self,  v11,  prefetchingSubstitutionVariables);
      }
      else {
        -[NSSQLFetchRequestContext _setupBindVariablesForCachedStatement:usingValues:]( (uint64_t)self,  v11,  (void *)-[NSFetchRequest substitutionVariables]( -[NSSQLFetchRequestContext request](self, "request"),  "substitutionVariables"));
      }
    }

    v15 = statement;
    if (statement) {
      return statement;
    }
  }

  statement = -[NSSQLFetchRequestContext _createStatement](self, "_createStatement");
  self->_statement = statement;
  if (-[NSFetchRequest _isCachingFetchRequest]( -[NSSQLFetchRequestContext request](self, "request"),  "_isCachingFetchRequest"))
  {
    self->_isUsingCachedStatement = 1;
    v16 = -[NSSQLFetchRequestContext request](self, "request");
    id v17 = (id)-[NSFetchRequest _cachedInfoForRequestor:](v16, "_cachedInfoForRequestor:", self->super._connection);
    if (!v17)
    {
      id v17 = -[NSCachedFetchRequestThunk initForConnection:]( objc_alloc(&OBJC_CLASS___NSCachedFetchRequestThunk),  "initForConnection:",  self->super._connection);
      -[NSFetchRequest _cacheInfo:forRequestor:](v16, "_cacheInfo:forRequestor:", v17, self->super._connection);
    }

    if (-[NSFetchRequest fetchLimit](v16, "fetchLimit")
      && !objc_msgSend( (id)-[NSFetchRequest substitutionVariables](v16, "substitutionVariables"),  "objectForKey:",  @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
    {
      if (v17)
      {
        ptrdiff_t v19 = 16LL;
        goto LABEL_29;
      }
    }

    else if (v17)
    {
      ptrdiff_t v19 = 8LL;
LABEL_29:
      objc_setProperty_nonatomic(v17, v18, statement, v19);
    }
  }

  return statement;
}

- (id)_createStatement
{
  v2 = self;
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._sqlCore;
  }
  id result = -[NSSQLiteAdapter newSelectStatementWithFetchRequestContext:ignoreInheritance:]( -[NSSQLFetchRequestContext adapter](self, "adapter"),  v2,  (void *)v2->_isFaultRequest);
  if (result)
  {
    fetchPlan = v2->_fetchPlan;
    $C6D29F7D67899FE11DE7F8953A7C3E5F flags = fetchPlan->flags;
    if ((*(_BYTE *)&flags & 0x18) == 0x10)
    {
      fetchPlan->statement_entity = (NSSQLEntity *)*((void *)result + 6);
      fetchPlan->$C6D29F7D67899FE11DE7F8953A7C3E5F flags = ($C6D29F7D67899FE11DE7F8953A7C3E5F)(*(_DWORD *)&flags & 0xFFFFFFFE);
    }
  }

  return result;
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

- (void)executeEpilogue
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (self && -[NSMutableSet allObjects](self->_objectIDsToRegister, "allObjects")) {
    -[NSSQLCore managedObjectContextDidRegisterObjectsWithIDs:generation:]( self->super._sqlCore,  "managedObjectContextDidRegisterObjectsWithIDs:generation:",  -[NSMutableSet allObjects](self->_objectIDsToRegister, "allObjects"),  -[NSManagedObjectContext _queryGenerationToken](self->super._context, "_queryGenerationToken"));
  }
  if (!-[NSFetchRequest resultType](-[NSSQLFetchRequestContext request](self, "request"), "resultType")
    && !-[NSFetchRequest returnsObjectsAsFaults]( -[NSSQLFetchRequestContext request](self, "request"),  "returnsObjectsAsFaults")
    && objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"))
  {
    unint64_t v3 = 0LL;
    do
    {
      v4 = (_DWORD *)objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "objectAtIndex:", v3);
      -[NSMutableSet removeObject:](self->_objectsToAwaken, "removeObject:", v4);
      if (objc_msgSend( (id)-[NSMutableArray objectAtIndex:](self->_resultFaultsThatWereFired, "objectAtIndex:", v3),  "BOOLValue"))
      {
        v4[4] |= 0x1000u;
        [v4 awakeFromFetch];
        v4[4] &= ~0x1000u;
      }

      ++v3;
    }

    while (v3 < objc_msgSend(-[NSSQLStoreRequestContext result](self, "result"), "count"));
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  objectsToAwaken = self->_objectsToAwaken;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( objectsToAwaken,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(objectsToAwaken);
        }
        int v10 = *(_DWORD **)(*((void *)&v11 + 1) + 8 * v9);
        v10[4] |= 0x1000u;
        [v10 awakeFromFetch];
        v10[4] &= ~0x1000u;
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( objectsToAwaken,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

- (void)dealloc
{
  self->_externalDataReferencesDirectory = 0LL;
  self->_externalDataLinksDirectory = 0LL;

  self->_fileBackedFuturesDirectory = 0LL;
  self->_sqlEntity = 0LL;

  self->_faultHandler = 0LL;
  self->_sqlModel = 0LL;

  self->_objectIDsToRegister = 0LL;
  self->_objectsToAwaken = 0LL;

  self->_parentContext = 0LL;
  self->_statement = 0LL;

  self->_originalRequest = 0LL;
  fetchPlan = self->_fetchPlan;
  if (fetchPlan) {

  }
  self->_concurrentFetchingPipelineRows = 0LL;
  self->_prefetchingSubstitutionVariables = 0LL;

  self->_resultFaultsThatWereFired = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLFetchRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v4, sel_dealloc);
}

uint64_t __43__NSSQLFetchRequestContext_executePrologue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visitPredicateExpression:");
}

- (void)setIsFaultRequest:(BOOL)a3
{
  self->_isFaultRequest = a3;
}

- (void)setFetchStatement:(id)a3
{
  statement = self->_statement;
  self->_statement = (NSSQLiteStatement *)a3;
}

- (id)createChildContextForNestedFetchRequest:(id)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext);
  if (self)
  {
    connection = self->super._connection;
    context = self->super._context;
    sqlCore = self->super._sqlCore;
    if (v5) {
      goto LABEL_3;
    }
    return 0LL;
  }

  context = 0LL;
  connection = 0LL;
  sqlCore = 0LL;
  if (!v5) {
    return 0LL;
  }
LABEL_3:
  uint64_t v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( v5,  "initWithRequest:context:sqlCore:",  a3,  context,  sqlCore);
  if (v9)
  {
    v9->_parentContext = self;
    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v9, connection);
  }

  return v9;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  return -[NSSQLitePrefetchRequestCache inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:]( -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self),  "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  return -[NSSQLitePrefetchRequestCache manyToOnePrefetchRequestForRelationshipNamed:onEntity:]( -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self),  "manyToOnePrefetchRequestForRelationshipNamed:onEntity:",  a3,  a4);
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  if (self) {
    self = (NSSQLFetchRequestContext *)self->super._connection;
  }
  return -[NSSQLitePrefetchRequestCache manyToManyPrefetchRequestsForRelationshipNamed:onEntity:]( -[NSSQLiteConnection prefetchRequestCache]((NSSQLitePrefetchRequestCache *)self),  "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:",  a3,  a4);
}

- (uint64_t)addObjectIDsToRegister:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 152);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
      *(void *)(v3 + 152) = v4;
    }

    return [v4 addObjectsFromArray:a2];
  }

  return result;
}

- (uint64_t)addObjectsToAwaken:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 160);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
      *(void *)(v3 + 160) = v4;
    }

    return [v4 addObjectsFromArray:a2];
  }

  return result;
}

- (void)_setupBindVariablesForCachedStatement:(void *)a3 usingValues:
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (a2 && (uint64_t v4 = a2[7]) != 0)
  {
    uint64_t v5 = *(void **)(v4 + 8);
    uint64_t v51 = *(void **)(v4 + 16);
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v51 = 0LL;
  }

  uint64_t v6 = (void *)[a2 bindVariables];
  unint64_t v52 = [v5 count];
  if (v52)
  {
    unint64_t v7 = 0LL;
    uint64_t v49 = v5;
    do
    {
      uint64_t v8 = (void *)[v5 objectAtIndex:v7];
      unint64_t v9 = v7 + 1;
      int v10 = (void *)[v5 objectAtIndex:v9];
      __int128 v11 = (void *)[a3 valueForKey:v8];
      if (!v11)
      {
        uint64_t v40 = (void *)MEMORY[0x189603F70];
        uint64_t v41 = *MEMORY[0x189603A58];
        uint64_t v43 = (void *)NSString;
        uint64_t v45 = v8;
        goto LABEL_66;
      }

      __int128 v12 = v11;
      if ([v11 expressionType])
      {
        uint64_t v40 = (void *)MEMORY[0x189603F70];
        uint64_t v41 = *MEMORY[0x189603A60];
        uint64_t v43 = (void *)NSString;
        uint64_t v45 = v8;
        goto LABEL_68;
      }

      __int128 v13 = (void *)[v12 constantValue];
      if (([v13 isNSArray] & 1) != 0
        || ([v13 isNSSet] & 1) != 0
        || [v13 isNSOrderedSet])
      {
LABEL_62:
        uint64_t v40 = (void *)MEMORY[0x189603F70];
        uint64_t v41 = *MEMORY[0x189603A60];
        uint64_t i = [NSString stringWithFormat:@"bad substitution variable for %@, must not be a collection", v8, ClassName, v47];
        goto LABEL_70;
      }

      __int128 v14 = (void *)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v6;
        uint64_t v16 = (void *)[v13 objectID];
        id v17 = v16;
        uint64_t v18 = a1;
        if (a1) {
          a1 = *(void *)(a1 + 8);
        }
        if (a1 == [v16 persistentStore]) {
          uint64_t v19 = [v17 _referenceData64];
        }
        else {
          uint64_t v19 = 0LL;
        }
        a1 = v18;
        uint64_t v6 = v15;
        uint64_t v5 = v49;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v21 = [v13 longLongValue];
LABEL_26:
          uint64_t v19 = v21;
          goto LABEL_27;
        }

        if (a1) {
          uint64_t v20 = *(void *)(a1 + 8);
        }
        else {
          uint64_t v20 = 0LL;
        }
        if (v20 == [v13 persistentStore])
        {
          uint64_t v21 = [v13 _referenceData64];
          goto LABEL_26;
        }

        uint64_t v19 = 0LL;
      }

- (uint64_t)_fireFaultsForValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      return [a2 willAccessValueForKey:0];
    }

    else if (([a2 isNSArray] & 1) != 0 {
           || ([a2 isNSSet] & 1) != 0
    }
           || (id result = [a2 isNSOrderedSet], (_DWORD)result))
    {
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3221225472LL;
      v4[2] = __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke;
      v4[3] = &unk_189EABAE0;
      v4[4] = v3;
      return [a2 enumerateObjectsUsingBlock:v4];
    }
  }

  return result;
}

uint64_t __48__NSSQLFetchRequestContext__fireFaultsForValue___block_invoke(uint64_t a1)
{
  return -[NSSQLFetchRequestContext _fireFaultsForValue:](*(void *)(a1 + 32));
}

- (void)addFaultsThatWereFired:(void *)result
{
  if (result)
  {
    v2 = result;
    uint64_t v3 = (void *)result[21];
    if (v3)
    {
      return (void *)[v3 addObjectsFromArray:a2];
    }

    else
    {
      id result = a2;
      v2[21] = result;
    }
  }

  return result;
}

- (BOOL)isFaultRequest
{
  return self->_isFaultRequest;
}

@end