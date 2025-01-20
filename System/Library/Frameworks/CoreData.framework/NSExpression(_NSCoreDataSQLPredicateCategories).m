@interface NSExpression(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSExpression(_NSCoreDataSQLPredicateCategories)

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v26 = 0LL;
  uint64_t v6 = [a1 expressionType];
  if (v6 > 9)
  {
    if (v6 == 10)
    {
      uint64_t v7 = [a1 keyPath];
      goto LABEL_19;
    }

    if (v6 != 14) {
      goto LABEL_27;
    }
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v8 = (void *)objc_msgSend(a1, "collection", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      int v11 = 1;
LABEL_9:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * v12) _keypathsForDerivedPropertyValidation:&v26];
        v14 = v13;
        if (!v13) {
          goto LABEL_29;
        }
        if ([v13 count]) {
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
        }
        if (v9 == ++v12)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
          if (v9) {
            goto LABEL_9;
          }
          goto LABEL_21;
        }
      }
    }
  }

  else if ((unint64_t)v6 >= 2)
  {
    if (v6 == 2)
    {
      uint64_t v7 = [a1 predicateFormat];
LABEL_19:
      [v5 addObject:v7];
      goto LABEL_20;
    }

@end