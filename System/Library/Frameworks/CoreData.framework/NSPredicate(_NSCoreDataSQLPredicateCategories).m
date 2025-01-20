@interface NSPredicate(_NSCoreDataSQLPredicateCategories)
- (uint64_t)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  v8[1] = *MEMORY[0x1895F89C0];
  if ([MEMORY[0x189607A48] defaultInstance] == a1
    || [MEMORY[0x189607890] defaultInstance] == a1)
  {
    return [MEMORY[0x189603FE0] set];
  }

  if (a3)
  {
    uint64_t v5 = *MEMORY[0x189607460];
    v7 = @"expression";
    v8[0] = a1;
    *a3 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v5,  134097,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }

  return 0LL;
}

@end