@interface PredicateValidator
- (PredicateValidator)init;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation PredicateValidator

- (PredicateValidator)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PredicateValidator;
  result = -[PredicateValidator init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->_acceptableExpressionTypes[16] = 0u;
    *(_OWORD *)result->_acceptableExpressionTypes = 0u;
  }

  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  id v12 = a3;
  v4 = [v12 expressionType];
  if (!v4[(void)self + 8])
  {
    errors = self->_errors;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid expression type '%lu' in expression: %@",  v4,  v12));
    -[NSMutableArray addObject:](errors, "addObject:", v9);
    goto LABEL_8;
  }

  if (v4 == (_BYTE *)10 || v4 == (_BYTE *)3)
  {
    acceptableKeyPaths = self->_acceptableKeyPaths;
    if (acceptableKeyPaths)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v12 keyPath]);
      unsigned __int8 v7 = -[NSArray containsObject:](acceptableKeyPaths, "containsObject:", v6);

      if ((v7 & 1) == 0)
      {
        v8 = self->_errors;
        v9 = (void *)objc_claimAutoreleasedReturnValue([v12 keyPath]);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid key path '%@' in expression: %@",  v9,  v12));
        -[NSMutableArray addObject:](v8, "addObject:", v10);

LABEL_8:
        self->_valid = 0;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end