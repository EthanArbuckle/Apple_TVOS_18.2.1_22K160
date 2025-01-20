@interface PDPredicateValidationResult
- (BOOL)isValid;
- (NSSet)usedKeys;
- (NSSet)usedOperators;
- (PDPredicateValidationResult)init;
- (PDPredicateValidationResult)initWithValid:(BOOL)a3 usedKeys:(id)a4;
@end

@implementation PDPredicateValidationResult

- (PDPredicateValidationResult)init
{
  return -[PDPredicateValidationResult initWithValid:usedKeys:](self, "initWithValid:usedKeys:", 0LL, 0LL);
}

- (PDPredicateValidationResult)initWithValid:(BOOL)a3 usedKeys:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPredicateValidationResult;
  v8 = -[PDPredicateValidationResult init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_valid = a3;
    objc_storeStrong((id *)&v8->_usedKeys, a4);
  }

  return v9;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSSet)usedKeys
{
  return self->_usedKeys;
}

- (NSSet)usedOperators
{
  return self->_usedOperators;
}

- (void).cxx_destruct
{
}

@end