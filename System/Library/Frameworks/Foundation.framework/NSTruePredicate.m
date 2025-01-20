@interface NSTruePredicate
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
- (BOOL)_allowsEvaluation;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSTruePredicate)initWithCoder:(id)a3;
- (id)predicateFormat;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTruePredicate

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSTheOneTruePredicate;
}

+ (id)defaultInstance
{
  return &__NSTheOneTruePredicate;
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

- (BOOL)_allowsEvaluation
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
  v5.super_class = (Class)&OBJC_CLASS___NSTruePredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSTruePredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    JUMPOUT(0x18362E2E0LL);
  }

  return (NSTruePredicate *)&__NSTheOneTruePredicate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 1LL;
}

- (id)predicateFormat
{
  return @"TRUEPREDICATE";
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return 1;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

@end