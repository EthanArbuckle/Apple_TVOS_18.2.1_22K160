@interface NSPersistentHistoryResult
+ (_NSPersistentHistoryChange)_changeFromResult:(uint64_t)a3 withTransaction:;
+ (_NSPersistentHistoryTransaction)_transactionFromResult:(void *)a3 withChanges:;
+ (id)_processResult:(id)a3 forRequest:(id)a4 withProvider:(id)a5;
- (NSPersistentHistoryResult)initWithResultType:(int64_t)a3 andResult:(id)a4;
- (NSPersistentHistoryResult)initWithSubresults:(id)a3;
- (NSPersistentHistoryResultType)resultType;
- (id)description;
- (id)result;
- (void)dealloc;
@end

@implementation NSPersistentHistoryResult

- (NSPersistentHistoryResult)initWithResultType:(int64_t)a3 andResult:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSPersistentHistoryResult;
  v6 = -[NSPersistentHistoryResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_resultType = a3;
    v6->_aggregatedResult = a4;
  }

  return v7;
}

- (NSPersistentHistoryResult)initWithSubresults:(id)a3
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  v78.receiver = self;
  v78.super_class = (Class)&OBJC_CLASS___NSPersistentHistoryResult;
  v4 = -[NSPersistentHistoryResult init](&v78, sel_init);
  if (!v4) {
    return v4;
  }
  if ([a3 count])
  {
    uint64_t resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v4->_uint64_t resultType = resultType;
  }

  else
  {
    uint64_t resultType = v4->_resultType;
  }

  switch(resultType)
  {
    case 0LL:
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      uint64_t v27 = [a3 countByEnumeratingWithState:&v74 objects:v95 count:16];
      if (!v27)
      {
        uint64_t v30 = 1LL;
        goto LABEL_50;
      }

      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v75;
      LOBYTE(v30) = 1;
      do
      {
        for (uint64_t i = 0LL; i != v28; ++i)
        {
          if (*(void *)v75 != v29) {
            objc_enumerationMutation(a3);
          }
          v32 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          int64_t v33 = v4->_resultType;
          if (v33 != [v32 resultType])
          {
            v52 = (void *)MEMORY[0x189603F70];
            uint64_t v53 = *MEMORY[0x189603A58];
            v93 = @"Results";
            id v94 = a3;
            uint64_t v54 = [MEMORY[0x189603F68] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            v55 = @"Mismatched result types during aggregation of history status results";
            goto LABEL_57;
          }

          if ((v30 & 1) != 0) {
            uint64_t v30 = objc_msgSend((id)objc_msgSend(v32, "result"), "BOOLValue");
          }
          else {
            uint64_t v30 = 0LL;
          }
        }

        uint64_t v28 = [a3 countByEnumeratingWithState:&v74 objects:v95 count:16];
      }

      while (v28);
LABEL_50:
      uint64_t v50 = [MEMORY[0x189607968] numberWithBool:v30];
LABEL_51:
      v4->_aggregatedResult = (id)v50;
      return v4;
    case 1LL:
      v61 = (void *)[MEMORY[0x189603FE0] set];
      v34 = (void *)[MEMORY[0x189603FE0] set];
      v35 = (void *)[MEMORY[0x189603FE0] set];
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      uint64_t v36 = [a3 countByEnumeratingWithState:&v66 objects:v89 count:16];
      if (!v36) {
        goto LABEL_46;
      }
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v67;
      while (1)
      {
        for (uint64_t j = 0LL; j != v37; ++j)
        {
          if (*(void *)v67 != v38) {
            objc_enumerationMutation(a3);
          }
          v40 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          int64_t v41 = v4->_resultType;
          if (v41 != [v40 resultType])
          {
            v52 = (void *)MEMORY[0x189603F70];
            uint64_t v53 = *MEMORY[0x189603A58];
            v87 = @"Results";
            id v88 = a3;
            uint64_t v54 = [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
            v55 = @"Mismatched result types during aggregation of history object IDs results";
LABEL_57:
            objc_exception_throw((id)[v52 exceptionWithName:v53 reason:v55 userInfo:v54]);
          }

          v42 = (void *)[v40 result];
          if (v42)
          {
            v43 = v42;
            objc_msgSend(v61, "unionSet:", objc_msgSend(v42, "objectForKey:", @"inserted_objectIDs"));
            objc_msgSend(v34, "unionSet:", objc_msgSend(v43, "objectForKey:", @"updated_objectIDs"));
            objc_msgSend(v35, "unionSet:", objc_msgSend(v43, "objectForKey:", @"deleted_objectIDs"));
          }
        }

        uint64_t v37 = [a3 countByEnumeratingWithState:&v66 objects:v89 count:16];
        if (!v37)
        {
LABEL_46:
          [v61 minusSet:v35];
          [v34 minusSet:v35];
          [v34 minusSet:v61];
          v44 = (void *)[v61 copy];
          v45 = (void *)[v34 copy];
          v46 = (void *)[v35 copy];
          id v47 = objc_alloc(MEMORY[0x189603F68]);
          v86[0] = v44;
          v86[1] = v45;
          v86[2] = v46;
          uint64_t v48 = [MEMORY[0x189603F18] arrayWithObjects:v86 count:3];
          v85[0] = @"inserted_objectIDs";
          v85[1] = @"updated_objectIDs";
          v85[2] = @"deleted_objectIDs";
          uint64_t v49 = objc_msgSend( v47,  "initWithObjects:forKeys:",  v48,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v85, 3));

          v4->_aggregatedResult = (id)v49;
          return v4;
        }
      }

    case 2LL:
    case 6LL:
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v70 objects:v92 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0LL;
        uint64_t v15 = *(void *)v71;
        do
        {
          for (uint64_t k = 0LL; k != v13; ++k)
          {
            if (*(void *)v71 != v15) {
              objc_enumerationMutation(a3);
            }
            v17 = *(void **)(*((void *)&v70 + 1) + 8 * k);
            int64_t v18 = v4->_resultType;
            if (v18 != [v17 resultType])
            {
              v52 = (void *)MEMORY[0x189603F70];
              uint64_t v53 = *MEMORY[0x189603A58];
              v90 = @"Results";
              id v91 = a3;
              uint64_t v54 = [MEMORY[0x189603F68] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
              v55 = @"Mismatched result types during aggregation of history count results";
              goto LABEL_57;
            }

            v14 += objc_msgSend((id)objc_msgSend(v17, "result"), "integerValue");
          }

          uint64_t v13 = [a3 countByEnumeratingWithState:&v70 objects:v92 count:16];
        }

        while (v13);
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      uint64_t v50 = [objc_alloc(MEMORY[0x189607968]) initWithInteger:v14];
      goto LABEL_51;
    case 3LL:
    case 5LL:
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      uint64_t v20 = [a3 countByEnumeratingWithState:&v62 objects:v82 count:16];
      if (!v20) {
        goto LABEL_23;
      }
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v63;
      while (1)
      {
        for (uint64_t m = 0LL; m != v21; ++m)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(a3);
          }
          v24 = *(void **)(*((void *)&v62 + 1) + 8 * m);
          int64_t v25 = v4->_resultType;
          if (v25 != [v24 resultType])
          {
            v52 = (void *)MEMORY[0x189603F70];
            uint64_t v53 = *MEMORY[0x189603A58];
            v80 = @"Results";
            id v81 = a3;
            uint64_t v54 = [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
            v55 = @"Mismatched result types during aggregation of history results";
            goto LABEL_57;
          }

          objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(v24, "result"));
        }

        uint64_t v21 = [a3 countByEnumeratingWithState:&v62 objects:v82 count:16];
        if (!v21)
        {
LABEL_23:
          v26 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"timestamp" ascending:1];
          v79 = v26;
          v4->_aggregatedResult = (id)objc_msgSend( v19,  "sortedArrayUsingDescriptors:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:count:",  &v79,  1));

          return v4;
        }
      }

    case 4LL:
      _NSCoreDataLog( 1LL,  (uint64_t)@"History Change Request failed NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores",  v5,  v6,  v7,  v8,  v9,  v10,  v60);
      uint64_t v56 = *MEMORY[0x189603A58];
      v83 = @"Results";
      id v84 = a3;
      id v57 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  v56,  134091,  (uint64_t)@"NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores",  (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v84 forKeys:&v83 count:1]);
      objc_exception_throw(v57);
      return (NSPersistentHistoryResult *)-[NSPersistentHistoryResult description](v58, v59);
    default:
      return v4;
  }

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%s <%p> with @property result: %@", class_getName(v4), self, self->_aggregatedResult];
}

- (void)dealloc
{
  self->_aggregatedResult = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentHistoryResult;
  -[NSPersistentHistoryResult dealloc](&v3, sel_dealloc);
}

+ (_NSPersistentHistoryTransaction)_transactionFromResult:(void *)a3 withChanges:
{
  uint64_t v5 = -[_NSPersistentHistoryTransaction initWithDictionary:andObjectID:]( [_NSPersistentHistoryTransaction alloc],  "initWithDictionary:andObjectID:",  a2,  [a2 objectForKey:@"self"]);
  -[_NSPersistentHistoryTransaction _setChanges:](v5, a3);
  return v5;
}

+ (_NSPersistentHistoryChange)_changeFromResult:(uint64_t)a3 withTransaction:
{
  uint64_t v5 = -[_NSPersistentHistoryChange initWithDictionary:andChangeObjectID:]( [_NSPersistentHistoryChange alloc],  "initWithDictionary:andChangeObjectID:",  a2,  [a2 objectForKey:@"self"]);
  -[_NSPersistentHistoryChange _setTransaction:](v5, "_setTransaction:", a3);
  return v5;
}

+ (id)_processResult:(id)a3 forRequest:(id)a4 withProvider:(id)a5
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)MEMORY[0x186E3E5D8](a1, a2);
  if ([a4 resultType] == 2 || objc_msgSend(a4, "resultType") == 6 || !objc_msgSend(a4, "resultType"))
  {
    v26 = (_PFBatchHistoryFaultingArray *)[a3 firstObject];
LABEL_22:
    a3 = v26;
    goto LABEL_23;
  }

  if ([a4 resultType] != 1)
  {
    if (![a3 isNSArray])
    {
      a3 = 0LL;
      goto LABEL_23;
    }

    if ([a4 fetchBatchSize])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [a3 description];
        goto LABEL_23;
      }

      v26 =  -[_PFBatchHistoryFaultingArray initWithPFBatchFaultingArray:]( objc_alloc(&OBJC_CLASS____PFBatchHistoryFaultingArray),  "initWithPFBatchFaultingArray:",  a3);
      goto LABEL_22;
    }

    id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
    if ([a4 resultType] == 5 && objc_msgSend(a3, "count") == 2)
    {
      uint64_t v30 = (void *)[a3 objectAtIndexedSubscript:0];
      v31 = (void *)[a3 objectAtIndexedSubscript:1];
      v32 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v57 = v30;
      uint64_t v60 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v60)
      {
        id v55 = v29;
        id v50 = a4;
        v52 = v8;
        unint64_t v33 = 0LL;
        obuint64_t j = *(id *)v66;
        do
        {
          for (uint64_t i = 0LL; i != v60; ++i)
          {
            unint64_t v35 = v33;
            if (*(id *)v66 != obj) {
              objc_enumerationMutation(v57);
            }
            uint64_t v36 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            uint64_t v37 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v38 = (void *)[MEMORY[0x189603FA8] array];
            v39 = +[NSPersistentHistoryResult _transactionFromResult:withChanges:]( (uint64_t)&OBJC_CLASS___NSPersistentHistoryResult,  v36,  v38);
            uint64_t v40 = -[_NSPersistentHistoryTransaction transactionNumber](v39, "transactionNumber");
            if ([v31 count] > (unint64_t)v33)
            {
              unint64_t v33 = v33;
              while (1)
              {
                int64_t v41 = (void *)[v31 objectAtIndexedSubscript:v33];
                if (objc_msgSend((id)objc_msgSend(v41, "objectForKey:", @"TRANSACTIONID"), "_referenceData64") != v40) {
                  break;
                }
                v42 = +[NSPersistentHistoryResult _changeFromResult:withTransaction:]( (uint64_t)&OBJC_CLASS___NSPersistentHistoryResult,  v41,  (uint64_t)v39);
                [v38 addObject:v42];

                unint64_t v33 = (v35 + 1);
                unint64_t v35 = v33;
                if ([v31 count] <= v33) {
                  goto LABEL_42;
                }
              }
            }

            unint64_t v33 = v35;
LABEL_42:
            [v32 addObject:v39];

            objc_autoreleasePoolPop(v37);
          }

          uint64_t v60 = [v57 countByEnumeratingWithState:&v65 objects:v74 count:16];
        }

        while (v60);
        a4 = v50;
        uint64_t v8 = v52;
        id v29 = v55;
      }

- (id)result
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (NSPersistentHistoryResultType)resultType
{
  return self->_resultType;
}

@end