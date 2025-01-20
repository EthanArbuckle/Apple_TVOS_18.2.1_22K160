@interface NSComparisonPredicate
- (id)_checkTypeForValue:(id)a3 inKeyPath:(id)a4;
- (id)passd_sqlPredicateForSelect;
@end

@implementation NSComparisonPredicate

- (id)passd_sqlPredicateForSelect
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSComparisonPredicate leftExpression](self, "leftExpression"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSComparisonPredicate rightExpression](self, "rightExpression"));
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = 3LL;
  switch(-[NSComparisonPredicate predicateOperatorType](self, "predicateOperatorType"))
  {
    case NSLessThanPredicateOperatorType:
      break;
    case NSLessThanOrEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 4LL;
      break;
    case NSGreaterThanPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 5LL;
      break;
    case NSGreaterThanOrEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 6LL;
      break;
    case NSEqualToPredicateOperatorType:
      int v6 = 0;
      int v5 = 1;
      uint64_t v7 = 1LL;
      break;
    case NSNotEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 1;
      uint64_t v7 = 2LL;
      break;
    default:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 0LL;
      break;
  }

  if ([v3 expressionType] == (id)3) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 keyPath]);
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 description]);
  }
  v9 = (void *)v8;
  if ([v4 expressionType]
    || (uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 constantValue])) == 0)
  {
    if (v5)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  v9));
    }

    else
    {
      if (!v6)
      {
        v14 = 0LL;
        goto LABEL_20;
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  v9));
    }

    v14 = (void *)v10;
  }

  else
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSComparisonPredicate _checkTypeForValue:inKeyPath:]( self,  "_checkTypeForValue:inKeyPath:",  v11,  v9));

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  v9,  v13,  v7));
  }

- (id)_checkTypeForValue:(id)a3 inKeyPath:(id)a4
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = (id)_SQLValueForDate(v4);
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSUUID, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      id v8 = (id)_SQLValueForUUID(v4);
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL, v10);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        id v8 = (id)_SQLValueForURL(v4);
      }

      else
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
        if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0) {
          id v8 = (id)_SQLValueForString(v4);
        }
        else {
          id v8 = v4;
        }
      }
    }
  }

  v14 = v8;

  return v14;
}

@end