@interface NSComparisonPredicate
- (BOOL)_isForeignObjectExpression:(void *)a3 givenContext:;
@end

@implementation NSComparisonPredicate

- (BOOL)_isForeignObjectExpression:(void *)a3 givenContext:
{
  if (result)
  {
    if ([a2 expressionType]) {
      return 0LL;
    }
    uint64_t v5 = [a2 constantValue];
    if (!v5) {
      return 0LL;
    }
    v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)[v6 objectID];
      if (!v6) {
        return 0LL;
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0LL;
      }
    }

    if ([v6 isTemporaryID]) {
      return 1LL;
    }
    uint64_t v7 = [v6 persistentStore];
    return v7 != [a3 objectForKey:@"persistentStore"];
  }

  return result;
}

@end