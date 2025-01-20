@interface NSTernaryExpression(_NSCoreDataSQLPredicateCategories)
- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSTernaryExpression(_NSCoreDataSQLPredicateCategories)

- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v15 = 0LL;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "predicate"), "_keypathsForDerivedPropertyValidation:", &v15);
  if (v6
    && (v7 = (void *)objc_msgSend( (id)objc_msgSend(a1, "trueExpression"),  "_keypathsForDerivedPropertyValidation:",  &v15)) != 0 && (v8 = (void *)objc_msgSend( (id)objc_msgSend(a1, "falseExpression"),  "_keypathsForDerivedPropertyValidation:",  &v15)) != 0)
  {
    v9 = (void *)[v6 mutableCopy];
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v7, "allObjects"));
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
    v10 = v9;
  }

  else
  {
    v10 = 0LL;
  }

  id v11 = v15;
  if (a3 && v15) {
    *a3 = v15;
  }
  [v5 drain];
  id v12 = 0LL;
  id v13 = v15;
  id v14 = v10;
}

@end