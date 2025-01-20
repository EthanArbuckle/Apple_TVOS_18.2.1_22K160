@interface NSCompoundPredicate(_NSCoreDataSQLPredicateCategories)
- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSCompoundPredicate(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  v5 = (void *)MEMORY[0x186E3E5D8]();
  v6 = (void *)objc_msgSend( (id)objc_msgSend(a1, "predicateOperator"),  "minimalFormInContext:ofPredicates:",  a3,  objc_msgSend(a1, "subpredicates"));
  id v7 = v6;
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v19 = 0LL;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v4 = (void *)objc_msgSend(a1, "subpredicates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    id v6 = 0LL;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v8) _keypathsForDerivedPropertyValidation:&v19];
      v10 = v9;
      if (!v9) {
        break;
      }
      if ([v9 count])
      {
        if (v6) {
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v10, "allObjects"));
        }
        else {
          id v6 = v10;
        }
      }

      if (v5 == ++v8)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }
        if (v6) {
          break;
        }
        goto LABEL_14;
      }
    }
  }

  else
  {
LABEL_14:
    id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
  }

  id v11 = v19;
  if (a3 && v19) {
    *a3 = v19;
  }
  [0 drain];
  id v12 = 0LL;
  id v13 = v19;
  id v14 = v6;
}

@end