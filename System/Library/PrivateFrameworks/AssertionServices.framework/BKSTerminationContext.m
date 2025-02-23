@interface BKSTerminationContext
+ (id)context;
+ (id)terminationAssertionContext;
- (BOOL)_isEqualToTerminationContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)explanation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)exceptionCode;
- (void)setExceptionCode:(int64_t)a3;
- (void)setExplanation:(id)a3;
@end

@implementation BKSTerminationContext

+ (id)terminationAssertionContext
{
  v2 = objc_alloc_init(&OBJC_CLASS___BKSTerminationContext);
  -[BKSTerminationContext setExplanation:](v2, "setExplanation:", @"Termination assertion");
  -[BKSTerminationContext setExceptionCode:](v2, "setExceptionCode:", 3735905538LL);
  return v2;
}

+ (id)context
{
  return objc_alloc_init(&OBJC_CLASS___BKSTerminationContext);
}

- (BOOL)_isEqualToTerminationContext:(id)a3
{
  id v4 = a3;
  int64_t exceptionCode = self->_exceptionCode;
  if (exceptionCode == [v4 exceptionCode])
  {
    explanation = self->_explanation;
    [v4 explanation];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = -[NSString isEqualToString:](explanation, "isEqualToString:", v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[BKSTerminationContext init]( +[BKSTerminationContext allocWithZone:](&OBJC_CLASS___BKSTerminationContext, "allocWithZone:", a3),  "init");
  -[BKSTerminationContext setExceptionCode:](v4, "setExceptionCode:", self->_exceptionCode);
  -[BKSTerminationContext setExplanation:](v4, "setExplanation:", self->_explanation);
  return v4;
}

- (int64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(int64_t)a3
{
  self->_int64_t exceptionCode = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end