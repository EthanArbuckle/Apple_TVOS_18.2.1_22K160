@interface NSSetExpression(_NSCoreDataSQLPredicateCategories)
- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (void)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSSetExpression(_NSCoreDataSQLPredicateCategories)

- (void)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "minimalFormInContext:", a3);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "rightExpression"), "minimalFormInContext:", a3);
  uint64_t v7 = [v5 expressionType];
  if (v7 == 14)
  {
    v8 = (void *)[v5 collection];
  }

  else
  {
    if (v7) {
      goto LABEL_9;
    }
    v8 = (void *)[v5 constantValue];
  }

  v9 = v8;
  if (([v8 isNSSet] & 1) != 0
    || ([v9 isNSArray] & 1) != 0
    || [v9 isNSOrderedSet])
  {
    BOOL v10 = [v9 count] == 0;
    goto LABEL_10;
  }

- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "_keypathsForDerivedPropertyValidation:", a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "rightExpression"), "_keypathsForDerivedPropertyValidation:", a3);
    if (v6) {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "allObjects"));
    }
    else {
      return 0LL;
    }
  }

  return v5;
}

@end