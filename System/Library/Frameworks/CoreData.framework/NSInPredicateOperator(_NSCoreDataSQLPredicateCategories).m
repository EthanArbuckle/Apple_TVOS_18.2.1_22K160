@interface NSInPredicateOperator(_NSCoreDataSQLPredicateCategories)
- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicate:;
@end

@implementation NSInPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicate:
{
  v4 = a4;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v7 = (void *)[a4 rightExpression];
  uint64_t v8 = [a1 operatorType];
  if (v8 == 99) {
    v7 = (void *)[v4 leftExpression];
  }
  uint64_t v9 = [v7 expressionType];
  uint64_t v10 = v9;
  if (v9 != 14 && v9) {
    return (uint64_t)v4;
  }
  v11 = (void *)[v7 constantValue];
  if ([v11 isNSString])
  {
    if ([v11 length]) {
      return (uint64_t)v4;
    }
    v12 = (void *)MEMORY[0x189607A48];
    return [v12 defaultInstance];
  }

  if (([v11 isNSArray] & 1) == 0
    && ([v11 isNSSet] & 1) == 0
    && ([v11 isNSOrderedSet] & 1) == 0
    && ![v11 isNSDictionary])
  {
    return (uint64_t)v4;
  }

  if (![v11 count])
  {
    v12 = (void *)MEMORY[0x189607890];
    return [v12 defaultInstance];
  }

  if (v10 || ([v11 isNSDictionary] & 1) != 0) {
    return (uint64_t)v4;
  }
  uint64_t v26 = v8;
  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
  objc_opt_class();
  objc_opt_class();
  uint64_t v14 = [a3 valueForKey:@"persistentStore"];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v15 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v15) {
    goto LABEL_29;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v28;
  do
  {
    for (uint64_t i = 0LL; i != v16; ++i)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v11);
      }
      v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_25:
          if ([v19 persistentStore] != v14) {
            continue;
          }
        }

@end