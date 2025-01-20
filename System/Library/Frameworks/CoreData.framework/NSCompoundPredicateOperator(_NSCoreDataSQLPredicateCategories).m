@interface NSCompoundPredicateOperator(_NSCoreDataSQLPredicateCategories)
- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicates:;
@end

@implementation NSCompoundPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicates:
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  v7 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v8 = [a1 operatorType];
  switch(v8)
  {
    case 2LL:
      v32 = a1;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v14 = [a4 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v39;
        while (2)
        {
          uint64_t v17 = 0LL;
          do
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(a4);
            }
            v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
            v19 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v20 = [v18 minimalFormInContext:a3];
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x189607A48], "defaultInstance"), "isEqual:", v20))
            {
              v31 = (void *)MEMORY[0x189607A48];
LABEL_36:
              uint64_t v12 = [v31 defaultInstance];
              objc_autoreleasePoolPop(v19);
              return (id)v12;
            }

            if ((objc_msgSend((id)objc_msgSend(MEMORY[0x189607890], "defaultInstance"), "isEqual:", v20) & 1) == 0) {
              [v7 addObject:v20];
            }
            objc_autoreleasePoolPop(v19);
            ++v17;
          }

          while (v15 != v17);
          uint64_t v15 = [a4 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      uint64_t v21 = [v7 count];
      if (v21 != 1)
      {
        a1 = v32;
        if (!v21)
        {
          v22 = (void *)MEMORY[0x189607890];
          return (id)[v22 defaultInstance];
        }

        return (id)objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(a1, "operatorType"),  v7);
      }

      return (id)[v7 objectAtIndex:0];
    case 1LL:
      v33 = a1;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      uint64_t v23 = [a4 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        while (2)
        {
          uint64_t v26 = 0LL;
          do
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(a4);
            }
            v27 = *(void **)(*((void *)&v34 + 1) + 8 * v26);
            v19 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v28 = [v27 minimalFormInContext:a3];
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x189607890], "defaultInstance"), "isEqual:", v28))
            {
              v31 = (void *)MEMORY[0x189607890];
              goto LABEL_36;
            }

            if ((objc_msgSend((id)objc_msgSend(MEMORY[0x189607A48], "defaultInstance"), "isEqual:", v28) & 1) == 0) {
              [v7 addObject:v28];
            }
            objc_autoreleasePoolPop(v19);
            ++v26;
          }

          while (v24 != v26);
          uint64_t v24 = [a4 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      uint64_t v29 = [v7 count];
      if (v29 != 1)
      {
        a1 = v33;
        if (!v29)
        {
          v22 = (void *)MEMORY[0x189607A48];
          return (id)[v22 defaultInstance];
        }

        return (id)objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(a1, "operatorType"),  v7);
      }

      return (id)[v7 objectAtIndex:0];
    case 0LL:
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "minimalFormInContext:", a3);
      char v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x189607A48], "defaultInstance"), "isEqual:", v9);
      v11 = (void *)[MEMORY[0x189607890] defaultInstance];
      uint64_t v12 = (uint64_t)v11;
      if ((v10 & 1) != 0) {
        return (id)v12;
      }
      [v7 addObject:v9];
      return (id)objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(a1, "operatorType"),  v7);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Bad compound predicate predicateOperator type" userInfo:0]);
  return (id)-[NSComparisonPredicate(_NSCoreDataSQLPredicateCategories) minimalFormInContext:]();
}

@end