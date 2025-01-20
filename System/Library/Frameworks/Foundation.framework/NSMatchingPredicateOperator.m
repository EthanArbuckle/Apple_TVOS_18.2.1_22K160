@interface NSMatchingPredicateOperator
- (BOOL)_shouldEscapeForLike;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSMatchingPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5;
- (SEL)selector;
- (id)symbol;
- (void)_clearContext;
- (void)dealloc;
@end

@implementation NSMatchingPredicateOperator

- (NSMatchingPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMatchingPredicateOperator;
  result = -[NSStringPredicateOperator initWithOperatorType:modifier:variant:]( &v6,  sel_initWithOperatorType_modifier_variant_,  a3,  a4,  a5);
  if (result) {
    result->_regexContext = 0LL;
  }
  return result;
}

- (void)_clearContext
{
  regexContext = self->_regexContext;
  var1 = (URegularExpression *)regexContext->var1;
  if (var1)
  {
    uregex_close(var1);
    self->_regexContext->var1 = 0LL;
    regexContext = self->_regexContext;
  }

  if (regexContext->var0)
  {
    CFRelease(regexContext->var0);
    self->_regexContext->var0 = 0LL;
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self->_regexContext)
  {
    -[NSMatchingPredicateOperator _clearContext](self, "_clearContext");
    free(self->_regexContext);
    self->_regexContext = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMatchingPredicateOperator;
  -[NSMatchingPredicateOperator dealloc](&v3, sel_dealloc);
}

- (id)symbol
{
  return (id)objc_msgSend( @"MATCHES",  "stringByAppendingString:",  -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

- (SEL)selector
{
  return sel_matches_;
}

- (BOOL)_shouldEscapeForLike
{
  return 0;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL v4 = 0;
  if (!a3 || !a4) {
    return v4;
  }
  if ([&stru_189CA6A28 isEqual:a4]) {
    return 0;
  }
  if ((_NSIsNSString() & 1) != 0)
  {
    if ((_NSIsNSString() & 1) != 0)
    {
      OSSpinLockLock(&self->_contextLock);
      regexContext = self->_regexContext;
      if (regexContext)
      {
        if (regexContext->var0)
        {
          if (([regexContext->var0 isEqual:a4] & 1) == 0) {
            -[NSMatchingPredicateOperator _clearContext](self, "_clearContext");
          }
        }
      }

      else
      {
        v9 = ($A49329C8146B1EC4AD674567B469C590 *)calloc(1uLL, 0x18uLL);
        self->_regexContext = v9;
        v9->var0 = 0LL;
        v9->var1 = 0LL;
      }

      BOOL v4 = +[_NSPredicateOperatorUtilities doRegexForString:pattern:likeProtect:flags:context:]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "doRegexForString:pattern:likeProtect:flags:context:",  a3,  a4,  -[NSMatchingPredicateOperator _shouldEscapeForLike](self, "_shouldEscapeForLike"),  -[NSStringPredicateOperator flags](self, "flags"),  self->_regexContext);
      OSSpinLockUnlock(&self->_contextLock);
      return v4;
    }

    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't do regex matching on object %@.",  a3);
  }

  else
  {
    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't create a regex expression from object %@.",  a4);
  }

  objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  objc_exception_rethrow();
  __break(1u);
  return result;
}

@end