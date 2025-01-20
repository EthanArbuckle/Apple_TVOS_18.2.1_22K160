@interface NSCustomPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSCustomPredicateOperator)initWithCoder:(id)a3;
- (NSCustomPredicateOperator)initWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbol;
- (uint64_t)_validateOperator;
- (unint64_t)operatorType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCustomPredicateOperator

- (uint64_t)_validateOperator
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = 0;
    result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  *(const char **)(result + 24),  0LL,  &v2,  (uint64_t)@"NSCustomPredicateOperator");
    if ((result & 1) == 0) {
      *(_DWORD *)(v1 + 32) |= 2u;
    }
    if (v2) {
      *(_DWORD *)(v1 + 32) |= 1u;
    }
  }

  return result;
}

- (NSCustomPredicateOperator)initWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCustomPredicateOperator;
  v5 = -[NSPredicateOperator initWithOperatorType:modifier:](&v8, sel_initWithOperatorType_modifier_, 11LL, a4);
  v6 = v5;
  if (v5) {
    v5->_selector = a3;
  }
  -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCustomPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v6, sel_encodeWithCoder_, a3);
  [a3 encodeObject:NSStringFromSelector(self->_selector) forKey:@"NSSelectorName"];
  objc_opt_self();
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
  {
    objc_opt_self();
    v5 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_FAULT,  "NSPredicate: Archiving an NSCustomPredicateOperator is deprecated and secure coding support will be removed in a future release.",  buf,  2u);
    }
  }

- (NSCustomPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    v12 = @"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers";
    goto LABEL_11;
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSCustomPredicateOperator;
  v5 = -[NSPredicateOperator initWithCoder:](&v16, sel_initWithCoder_, a3);
  if (v5)
  {
    objc_super v6 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSelectorName"];
    SEL v7 = NSSelectorFromString(v6);
    v5->_selector = v7;
    if (v7)
    {
      -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
      goto LABEL_5;
    }

    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    v12 = @"Attempted to decode custom predicate operator with nil selector";
LABEL_11:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
    return (NSCustomPredicateOperator *)-[NSCustomPredicateOperator copyWithZone:](v13, v14, v15);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithCustomSelector:modifier:",  self->_selector,  -[NSPredicateOperator modifier](self, "modifier"));
}

- (unint64_t)operatorType
{
  return 11LL;
}

- (SEL)selector
{
  return self->_selector;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = -[NSCustomPredicateOperator operatorType](self, "operatorType");
  if (v5 != [a3 operatorType]) {
    return 0;
  }
  unint64_t v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != [a3 modifier]) {
    return 0;
  }
  SEL v7 = -[NSCustomPredicateOperator selector](self, "selector");
  return v7 == (const char *)[a3 selector];
}

- (id)symbol
{
  return NSStringFromSelector(-[NSCustomPredicateOperator selector](self, "selector"));
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v26 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Can't invoke the selector %@ on (nil)", NSStringFromSelector(-[NSCustomPredicateOperator selector](self, "selector", 0, a4))), 0 reason userInfo];
    objc_exception_throw(v26);
  }

  uint64_t v7 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 704);
  BOOL isClass = object_isClass(a3);
  if (isClass)
  {
    Name = class_getName((Class)a3);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      objc_opt_self();
      v10 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = a3;
        _os_log_fault_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSCustomPredicateOperator on a Class '%{public}@' is deprecated and will be removed in a fu ture release.  NSCustomPredicateOperator should operate on instances.",  buf,  0xCu);
      }

      if (v7 != 4211063755LL)
      {
        objc_opt_self();
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }

  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (objc_class *)a3,  (uint64_t)@"NSCustomPredicateOperator")) {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  uint64_t v11 = -[NSCustomPredicateOperator selector](self, "selector");
  v12 = v11;
  BOOL v27 = *(_BYTE *)&self->_operatorFlags & 1;
  if (v7 == 4211063755LL)
  {
    v13 = +[NSSelfExpression defaultInstance](&OBJC_CLASS___NSSelfExpression, "defaultInstance");
    if (!v12) {
      goto LABEL_19;
    }
  }

  else
  {
    v13 = 0LL;
    if (!v11) {
      goto LABEL_19;
    }
  }

  if ((*(_BYTE *)&self->_operatorFlags & 2) == 0)
  {
    if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  v12,  (uint64_t)v13,  &v27,  (uint64_t)@"NSCustomPredicateOperator"))
    {
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0) {
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
  }

@end