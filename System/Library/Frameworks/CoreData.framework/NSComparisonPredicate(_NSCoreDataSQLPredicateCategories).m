@interface NSComparisonPredicate(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSComparisonPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v4 = a1;
  id v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "minimalFormInContext:", a3);
  id v6 = (id)objc_msgSend((id)objc_msgSend(v4, "rightExpression"), "minimalFormInContext:", a3);
  uint64_t v7 = [v4 leftExpression];
  uint64_t v8 = [v4 rightExpression];
  uint64_t v9 = [v4 predicateOperatorType];
  if (![v5 expressionType] && !objc_msgSend(v6, "expressionType"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      [v4 allowEvaluation];
    }
    goto LABEL_24;
  }

  if ([v6 expressionType])
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_5;
  }

  if ([v6 constantValue])
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (!objc_msgSend( (id)objc_msgSend(MEMORY[0x189603FE8], "null"),  "isEqual:",  objc_msgSend(v6, "constantValue"))
      || v10 == 4)
    {
LABEL_5:
      if ([v6 expressionType]
        || v10 != 6
        || !objc_msgSend(&stru_189EAC2E8, "isEqual:", objc_msgSend(v6, "constantValue")))
      {
        if (v9 == 99 || v9 == 10) {
          return objc_msgSend((id)objc_msgSend(v4, "predicateOperator"), "minimalFormInContext:ofPredicate:", a3, v4);
        }
        if (!-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((BOOL)v4, v5, a3)
          && !-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((BOOL)v4, v6, a3))
        {
          if (v5 != (id)v7 || v6 != (id)v8)
          {
            v13 = (void *)objc_msgSend((id)objc_msgSend(v4, "predicateOperator"), "copy");
            if (v5 == (id)v7) {
              id v5 = (id)[v5 copy];
            }
            if (v6 == (id)v8) {
              id v6 = (id)[v6 copy];
            }
            id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithPredicateOperator:v13 leftExpression:v5 rightExpression:v6];
          }

          return (uint64_t)v4;
        }

        if (v9 != 5)
        {
          if (v9 != 4) {
            return (uint64_t)v4;
          }
          goto LABEL_24;
        }

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v13 = 0LL;
  id v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "rightExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v6)
  {
    id v5 = 0LL;
LABEL_6:
    uint64_t v7 = 0LL;
    goto LABEL_7;
  }

  id v5 = v5;
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "allObjects"));
  uint64_t v7 = v5;
LABEL_7:
  id v8 = v13;
  if (a3 && v13) {
    *a3 = v13;
  }
  [0 drain];
  id v9 = 0LL;
  id v10 = v13;
  id v11 = v7;
  return v5;
}

@end