@interface NSKeyPathExpression
- (NSKeyPathExpression)initWithKeyPath:(id)a3;
- (NSKeyPathExpression)initWithOperand:(id)a3 andKeyPath:(id)a4;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)keyPath;
- (id)pathExpression;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
@end

@implementation NSKeyPathExpression

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  -[NSFunctionExpression dealloc](&v2, sel_dealloc);
}

- (NSKeyPathExpression)initWithKeyPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v5 = objc_alloc_init(&OBJC_CLASS___NSSelfExpression);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", a3, 0);
  v7 = sel_valueForKeyPath_;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "keyPath"), "rangeOfString:", @".");
    if (!v8) {
      v7 = sel_valueForKey_;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  v9 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:]( &v11,  sel_initWithExpressionType_operand_selector_argumentArray_,  3LL,  v5,  v7,  v6);

  return v9;
}

- (NSKeyPathExpression)initWithOperand:(id)a3 andKeyPath:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", a4, 0);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  v7 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:]( &v9,  sel_initWithExpressionType_operand_selector_argumentArray_,  4LL,  a3,  sel_valueForKeyPath_,  v6);

  return v7;
}

- (id)pathExpression
{
  return (id)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
}

- (unint64_t)expressionType
{
  if (self->super.super._expressionType == 4) {
    return 4LL;
  }
  else {
    return 3LL;
  }
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  -[NSFunctionExpression acceptVisitor:flags:](&v4, sel_acceptVisitor_flags_, a3, a4);
}

- (id)predicateFormat
{
  id v3 = -[NSKeyPathExpression pathExpression](self, "pathExpression");
  -[NSFunctionExpression operand](self, "operand");
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0) {
    return (id)[v3 predicateFormat];
  }
  else {
    return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%@",  objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "predicateFormat"),  objc_msgSend(v3, "predicateFormat"));
  }
}

- (id)keyPath
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  -[NSFunctionExpression operand](self, "operand");
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return (id)objc_msgSend( (id)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0),  "keyPath");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  return -[NSExpression keyPath](&v4, sel_keyPath);
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!-[NSFunctionExpression _allowsEvaluation](self, "_allowsEvaluation")) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  v7 = -[NSFunctionExpression selector](self, "selector");
  if (v7 != sel_valueForKeyPath_ && v7 != sel_valueForKey_)
  {
    objc_opt_self();
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    {
      objc_opt_self();
      objc_super v9 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_FAULT,  "NSPredicate: NSKeyPathExpression: malformed selector",  buf,  2u);
      }

      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSKeyPathExpression;
  return -[NSFunctionExpression expressionValueWithObject:context:]( &v11,  sel_expressionValueWithObject_context_,  a3,  a4);
}

@end