@interface _RMPredicateVisitor
- (NSSet)statusKeyPaths;
- (_RMPredicateVisitor)initWithFormat:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _RMPredicateVisitor

- (NSSet)statusKeyPaths
{
  return (NSSet *)-[NSMutableSet copy](self->_statusKeyPaths, "copy");
}

- (_RMPredicateVisitor)initWithFormat:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____RMPredicateVisitor;
  v5 = -[_RMPredicateVisitor init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    format = v5->_format;
    v5->_format = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    statusKeyPaths = v5->_statusKeyPaths;
    v5->_statusKeyPaths = v8;
  }

  return v5;
}

- (void)visitPredicateExpression:(id)a3
{
  id v6 = a3;
  if ([v6 expressionType] == (id)3)
  {
    statusKeyPaths = self->_statusKeyPaths;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 keyPath]);
    -[NSMutableSet addObject:](statusKeyPaths, "addObject:", v5);
  }
}

- (void)visitPredicateOperator:(id)a3
{
  id v9 = a3;
  if ([v9 operatorType] == (id)11)
  {
    uint64_t v4 = RMErrorDomain;
    v10 = @"error";
    v5 = (void *)objc_claimAutoreleasedReturnValue([v9 symbol]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToParsePredicateErrorWithCustomOperator:predicateFormat:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToParsePredicateErrorWithCustomOperator:predicateFormat:",  v5,  self->_format));
    objc_super v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  v4,  &stru_10001DAB8,  v7));

    objc_exception_throw(v8);
  }
}

- (void).cxx_destruct
{
}

@end