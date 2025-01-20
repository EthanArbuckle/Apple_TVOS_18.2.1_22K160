@interface NSSelfExpression
+ (BOOL)_allowsEvaluation;
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (NSSelfExpression)initWithCoder:(id)a3;
- (id)_initPrivate;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSelfExpression

+ (void)initialize
{
  if (!_NSSelfExpressionSingleton)
  {
    _NSSelfExpressionSingleton = (uint64_t)NSAllocateObject((Class)a1, 0LL, 0LL);
    [(id)_NSSelfExpressionSingleton _initPrivate];
  }

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSSelfExpressionSingleton;
}

+ (id)defaultInstance
{
  return (id)_NSSelfExpressionSingleton;
}

- (unint64_t)expressionType
{
  return 1LL;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_allowsEvaluation
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSelfExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSSelfExpression)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    JUMPOUT(0x183610AE4LL);
  }

  return (NSSelfExpression *)_NSSelfExpressionSingleton;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 8421LL;
}

- (id)_initPrivate
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSelfExpression;
  return -[NSExpression initWithExpressionType:](&v3, sel_initWithExpressionType_, 1LL);
}

- (id)predicateFormat
{
  return @"SELF";
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (&OBJC_CLASS____NSPredicateUtilities == a3) {
    return 0LL;
  }
  else {
    return a3;
  }
}

@end