@interface NSConstantValueExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSConstantValueExpression)initWithCoder:(id)a3;
- (NSConstantValueExpression)initWithObject:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSConstantValueExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConstantValueExpression;
  -[NSConstantValueExpression dealloc](&v3, sel_dealloc);
}

- (NSConstantValueExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSConstantValueExpression;
  uint64_t v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 0LL);
  v4->constantValue = a3;
  return v4;
}

- (unint64_t)expressionType
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSConstantValueExpression;
  -[NSExpression encodeWithCoder:](&v9, sel_encodeWithCoder_, a3);
  uint64_t v5 = objc_opt_self();
  uint64_t v6 = objc_opt_class();
  constantValue = self->constantValue;
  if (v5 == v6)
  {
    constantValue = NSStringFromClass((Class)self->constantValue);
    v8 = @"NSConstantValueClassName";
  }

  else
  {
    v8 = @"NSConstantValue";
  }

  [a3 encodeObject:constantValue forKey:v8];
}

- (NSConstantValueExpression)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSConstantValueExpression;
  id v5 = -[NSExpression initWithCoder:](&v15, sel_initWithCoder_, a3);
  if (v5)
  {
    uint64_t v6 = (void *)[a3 allowedClasses];
    id v7 = +[_NSPredicateUtilities _constantValueClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_constantValueClassesForSecureCoding");
    if (v6 && [v6 count])
    {
      id v7 = (id)[v7 mutableCopy];
      [v7 unionSet:v6];
      [v7 removeObject:objc_opt_class()];
      [v7 removeObject:objc_opt_class()];
    }

    else
    {
      id v8 = v7;
    }

    *((void *)v5 + 3) = (id)[a3 decodeObjectOfClasses:v7 forKey:@"NSConstantValue"];

    Class v9 = (Class)*((void *)v5 + 3);
    if (!v9)
    {
      uint64_t v10 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSConstantValueClassName"];
      if (v10)
      {
        Class v9 = NSClassFromString(v10);
        *((void *)v5 + 3) = v9;
        if (!v9) {
          return (NSConstantValueExpression *)v5;
        }
      }

      else
      {
        Class v9 = (Class)*((void *)v5 + 3);
        if (!v9) {
          return (NSConstantValueExpression *)v5;
        }
      }
    }

    if (!object_isClass(v9)
      || (Name = class_getName(*((Class *)v5 + 3)), !strncmp("_NSPredicateUtilities", Name, 0x15uLL)))
    {
      if (!+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  *((objc_class **)v5 + 3),  (uint64_t)@"NSConstantValueExpression")) {
        return (NSConstantValueExpression *)v5;
      }
    }

    else
    {
      objc_opt_self();
      v12 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = *((void *)v5 + 3);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v14;
        _os_log_fault_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSConstantValueExpression on a Class '%{public}@' is deprecated and will be removed in a fu ture release.  NSConstantValueExpression should operate on instances.",  buf,  0xCu);
      }

      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) == 0) {
        return (NSConstantValueExpression *)v5;
      }
    }

    +[_NSPredicateUtilities _predicateSecurityAction]();
  }

  return (NSConstantValueExpression *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithObject:self->constantValue];
}

- (id)predicateFormat
{
  id constantValue = self->constantValue;
  if (!constantValue) {
    return @"nil";
  }
  if (_NSIsNSString()) {
    return +[_NSPredicateUtilities _parserableStringDescription:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (uint64_t)constantValue);
  }
  if (_NSIsNSDate()) {
    return +[_NSPredicateUtilities _parserableDateDescription:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  constantValue);
  }
  if ((_NSIsNSArray() & 1) == 0
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && !_NSIsNSDictionary())
  {
    return (id)[constantValue description];
  }

  return +[_NSPredicateUtilities _parserableCollectionDescription:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  constantValue);
}

- (id)constantValue
{
  return self->constantValue;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unint64_t v5 = -[NSConstantValueExpression constantValue](self, "constantValue");
    uint64_t v6 = [a3 constantValue];
    if (!(v5 | v6) || v6 && (LODWORD(v6) = [(id)v6 isEqual:v5], (_DWORD)v6)) {
      LOBYTE(v6) = 1;
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSConstantValueExpression constantValue](self, "constantValue"), "hash");
}

- (id)expressionValueWithObject:(id)a3
{
  if (-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3)) {
    return self->constantValue;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
  return -[NSConstantValueExpression expressionValueWithObject:context:](v5, v6, v7, v8);
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4)) {
    return self->constantValue;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
  return (id)-[NSCustomPredicateOperator _validateOperator]();
}

@end