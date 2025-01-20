@interface PDPredicateValidator
+ (id)validatePredicate:(id)a3 allowedKeysAndOperators:(id)a4 error:(id *)a5;
- (PDPredicateValidator)init;
- (PDPredicateValidator)initWithPredicate:(id)a3 allowedKeysAndOperators:(id)a4;
- (id)validateWithError:(id *)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation PDPredicateValidator

+ (id)validatePredicate:(id)a3 allowedKeysAndOperators:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = -[PDPredicateValidator initWithPredicate:allowedKeysAndOperators:]( objc_alloc(&OBJC_CLASS___PDPredicateValidator),  "initWithPredicate:allowedKeysAndOperators:",  v8,  v7);

  if (v9)
  {
    v10 = (PDPredicateValidationResult *)objc_claimAutoreleasedReturnValue(-[PDPredicateValidator validateWithError:](v9, "validateWithError:", a5));
  }

  else
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKRulesErrorDomain,  4LL,  0LL));
    }
    v10 = -[PDPredicateValidationResult initWithValid:usedKeys:]( objc_alloc(&OBJC_CLASS___PDPredicateValidationResult),  "initWithValid:usedKeys:",  0LL,  0LL);
  }

  v11 = v10;

  return v11;
}

- (PDPredicateValidator)init
{
  return 0LL;
}

- (PDPredicateValidator)initWithPredicate:(id)a3 allowedKeysAndOperators:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PDPredicateValidator;
    id v8 = -[PDPredicateValidator init](&v15, "init");
    if (v8)
    {
      v9 = (NSPredicate *)[v6 copy];
      predicate = v8->_predicate;
      v8->_predicate = v9;

      if (v7)
      {
        v11 = (NSDictionary *)[v7 copy];
        allowedKeysAndOperators = v8->_allowedKeysAndOperators;
        v8->_allowedKeysAndOperators = v11;
      }
    }

    self = v8;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)validateWithError:(id *)a3
{
  *(_WORD *)&self->_validatedPredicate = 257;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  usedKeys = self->_usedKeys;
  self->_usedKeys = v5;

  self->_allowedOperators = 0LL;
  predicate = self->_predicate;
  if (predicate)
  {
    if (self->_allowedKeysAndOperators)
    {
      -[NSPredicate acceptVisitor:flags:](predicate, "acceptVisitor:flags:", self, 3LL);
      if (a3)
      {
        error = self->_error;
        if (error) {
          *a3 = error;
        }
      }
    }
  }

  v9 = objc_alloc(&OBJC_CLASS___PDPredicateValidationResult);
  BOOL v10 = self->_validatedPredicate && self->_validatedOperator;
  return -[PDPredicateValidationResult initWithValid:usedKeys:](v9, "initWithValid:usedKeys:", v10, self->_usedKeys);
}

- (void)visitPredicateExpression:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_validatedPredicate)
  {
    id v16 = v4;
    uint64_t v6 = (uint64_t)[v4 expressionType];
    if (v6 <= 9)
    {
      v5 = v16;
      if (v6 != 3)
      {
        if (v6 != 4) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }

      goto LABEL_8;
    }

    v5 = v16;
    if (v6 == 19)
    {
LABEL_12:
      self->_validatedPredicate = 0;
      v13 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKRulesErrorDomain,  6LL,  0LL));
      error = self->_error;
      self->_error = v13;
      goto LABEL_15;
    }

    if (v6 == 10)
    {
LABEL_8:
      error = (NSError *)objc_claimAutoreleasedReturnValue([v5 keyPath]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
      if ((objc_opt_isKindOfClass(error, v9) & 1) != 0)
      {
        if ((-[NSError hasPrefix:](error, "hasPrefix:", @"@") & 1) == 0)
        {
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_allowedKeysAndOperators, "allKeys"));
          unsigned __int8 v11 = [v10 containsObject:error];

          if ((v11 & 1) != 0)
          {
            -[NSMutableSet addObject:](self->_usedKeys, "addObject:", error);
            v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_allowedKeysAndOperators,  "objectForKeyedSubscript:",  error));
            self->_allowedOperators |= (unint64_t)[v12 unsignedIntegerValue];

LABEL_15:
            v5 = v16;
            goto LABEL_16;
          }
        }
      }

      else
      {
        v14 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  5LL,  0LL));
        objc_super v15 = self->_error;
        self->_error = v14;
      }

      self->_validatedPredicate = 0;
      goto LABEL_15;
    }
  }

- (void)visitPredicateOperator:(id)a3
{
  id v4 = a3;
  if (self->_validatedOperator)
  {
    id v12 = v4;
    id v5 = [v4 operatorType];
    switch((unint64_t)v5)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        id v4 = v12;
        if ((self->_allowedOperators & 1) == 0) {
          goto LABEL_11;
        }
        break;
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
        goto LABEL_10;
      case 0xAuLL:
        id v4 = v12;
        if ((self->_allowedOperators & 8) != 0) {
          break;
        }
        goto LABEL_11;
      case 0xBuLL:
        error = self->_error;
        p_error = &self->_error;
        *((_BYTE *)p_error - 39) = 0;
        id v4 = v12;
        if (!error) {
          goto LABEL_12;
        }
        break;
      default:
        if (v5 == (id)99)
        {
LABEL_10:
          id v4 = v12;
          if ((self->_allowedOperators & 4) != 0) {
            break;
          }
        }

        else
        {
          BOOL v6 = v5 == (id)100;
          id v4 = v12;
          if (!v6 || (self->_allowedOperators & 2) != 0) {
            break;
          }
        }

- (void).cxx_destruct
{
}

@end