@interface NSVariableExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSVariableExpression)initWithCoder:(id)a3;
- (NSVariableExpression)initWithObject:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (id)variable;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSVariableExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSVariableExpression;
  -[NSVariableExpression dealloc](&v3, sel_dealloc);
}

- (NSVariableExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSVariableExpression;
  uint64_t v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 2LL);
  v4->_variable = (NSString *)a3;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 2LL;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSVariableExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeObject:self->_variable forKey:@"NSVariable"];
}

- (NSVariableExpression)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSVariableExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5) {
    v5->_variable = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSVariable"];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithObject:self->_variable];
}

- (id)predicateFormat
{
  id v2 = -[NSVariableExpression variable](self, "variable");
  BOOL v3 = +[_NSPredicateUtilities _isReservedWordInParser:]( &OBJC_CLASS____NSPredicateUtilities,  "_isReservedWordInParser:",  v2);
  uint64_t v4 = &stru_189CA6A28;
  if (v3) {
    uint64_t v4 = @"#";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"$%@%@", v4, v2);
}

- (id)variable
{
  return self->_variable;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return objc_msgSend( (id)objc_msgSend(a3, "variable"),  "isEqual:",  -[NSVariableExpression variable](self, "variable"));
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSVariableExpression variable](self, "variable"), "hash");
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A58];
    v12 = (NSString *)@"This expression has evaluation disabled";
LABEL_10:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
    return -[NSVariableExpression _expressionWithSubstitutionVariables:](v15, v16, v17);
  }

  uint64_t v7 = [a4 objectForKey:self->_variable];
  if (!v7)
  {
    v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't get value for '%@' in bindings %@.",  self->_variable,  a4);
    v10 = v13;
    uint64_t v11 = v14;
    goto LABEL_10;
  }

  uint64_t v8 = (void *)v7;
  if ([MEMORY[0x189603FE8] null] == v7) {
    return 0LL;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return (id)[v8 expressionValueWithObject:a3 context:a4];
  }
  return v8;
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (a3)
  {
    BOOL v3 = self;
    uint64_t v4 = [a3 objectForKey:self->_variable];
    if (!v4) {
      return v3;
    }
    objc_super v5 = (void *)v4;
    if ([MEMORY[0x189603FE8] null] == v4)
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        return v5;
      }
      uint64_t v7 = v5;
    }

    return +[NSExpression expressionForConstantValue:](&OBJC_CLASS___NSExpression, "expressionForConstantValue:", v7);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
    return (id)NSExtensionMain();
  }

@end