@interface NSFalsePredicate
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
- (BOOL)_allowsEvaluation;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSFalsePredicate)initWithCoder:(id)a3;
- (id)predicateFormat;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFalsePredicate

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSTheOneFalsePredicate;
}

+ (id)defaultInstance
{
  return &__NSTheOneFalsePredicate;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
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
  v5.super_class = (Class)&OBJC_CLASS___NSFalsePredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFalsePredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    JUMPOUT(0x18356C460LL);
  }

  return (NSFalsePredicate *)&__NSTheOneFalsePredicate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 0LL;
}

- (id)predicateFormat
{
  return @"FALSEPREDICATE";
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return 0;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

@end