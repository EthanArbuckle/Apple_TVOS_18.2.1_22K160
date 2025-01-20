@interface NSVariableAssignmentExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSVariableAssignmentExpression)initWithAssignmentExpression:(id)a3 expression:(id)a4;
- (NSVariableAssignmentExpression)initWithAssignmentVariable:(id)a3 expression:(id)a4;
- (NSVariableAssignmentExpression)initWithCoder:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)assignmentVariable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (id)subexpression;
- (id)variable;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSVariableAssignmentExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSVariableAssignmentExpression;
  -[NSVariableAssignmentExpression dealloc](&v3, sel_dealloc);
}

- (NSVariableAssignmentExpression)initWithAssignmentVariable:(id)a3 expression:(id)a4
{
  v6 = -[NSVariableExpression initWithObject:]( +[NSVariableExpression allocWithZone:]( &OBJC_CLASS___NSVariableExpression,  "allocWithZone:",  -[NSVariableAssignmentExpression zone](self, "zone")),  "initWithObject:",  a3);
  v7 = -[NSVariableAssignmentExpression initWithAssignmentExpression:expression:]( self,  "initWithAssignmentExpression:expression:",  v6,  a4);

  return v7;
}

- (NSVariableAssignmentExpression)initWithAssignmentExpression:(id)a3 expression:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSVariableAssignmentExpression;
  v6 = -[NSExpression initWithExpressionType:](&v8, sel_initWithExpressionType_, 12LL);
  v6->_assignmentVariable = (NSVariableExpression *)a3;
  v6->_subexpression = (NSExpression *)a4;
  return v6;
}

- (unint64_t)expressionType
{
  return 12LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSExpression allowEvaluation](self->_assignmentVariable, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_subexpression, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSVariableAssignmentExpression;
  -[NSExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSVariableAssignmentExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSVariableExpression variable](self->_assignmentVariable, "variable"),  @"NSAssignmentVariable");
  [a3 encodeObject:self->_subexpression forKey:@"NSSubexpression"];
}

- (NSVariableAssignmentExpression)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSVariableAssignmentExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v17, sel_initWithCoder_, a3);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _expressionClassesForSecureCoding]( _NSPredicateUtilities,  "_expressionClassesForSecureCoding"));
  }

  else
  {
    id v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_expressionClassesForSecureCoding");
  }

  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSAssignmentVariable"];
  v10 = -[NSVariableExpression initWithObject:](objc_alloc(&OBJC_CLASS___NSVariableExpression), "initWithObject:", v9);
  v5->_assignmentVariable = v10;
  *(_DWORD *)&v10->super._expressionFlags |= 1u;
  v5->_subexpression = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSSubexpression"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = @"Malformed assignment expression (bad expression)";
    goto LABEL_12;
  }

  if (!v9)
  {
    v12 = @"Malformed assignment expression (bad variable)";
LABEL_12:
    v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v12 userInfo:0];
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  v11 = 0LL;
  if (v7) {
LABEL_13:
  }

LABEL_14:
  if (!v11) {
    return v5;
  }

  objc_exception_throw(v11);
  return (NSVariableAssignmentExpression *)-[NSVariableAssignmentExpression copyWithZone:](v14, v15, v16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)-[NSVariableExpression copy](self->_assignmentVariable, "copy", a3);
  objc_super v5 = (void *)-[NSExpression copy](self->_subexpression, "copy");
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssignmentExpression:v4 expression:v5];

  return v6;
}

- (id)assignmentVariable
{
  return self->_assignmentVariable;
}

- (id)variable
{
  return -[NSVariableExpression variable](self->_assignmentVariable, "variable");
}

- (id)subexpression
{
  return self->_subexpression;
}

- (id)predicateFormat
{
  BOOL v3 = -[NSExpression _shouldUseParensWithDescription](self->_subexpression, "_shouldUseParensWithDescription");
  if (v3) {
    uint64_t v4 = CFSTR("(");
  }
  else {
    uint64_t v4 = &stru_189CA6A28;
  }
  if (v3) {
    objc_super v5 = @"");
  }
  else {
    objc_super v5 = &stru_189CA6A28;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ := %@%@%@",  -[NSExpression description](self->_assignmentVariable, "description"),  v4,  -[NSExpression description](self->_subexpression, "description"),  v5);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( (id)objc_msgSend(a3, "variable"),  "isEqual:",  -[NSVariableAssignmentExpression variable](self, "variable")))
  {
    return objc_msgSend( (id)objc_msgSend(a3, "subexpression"),  "isEqual:",  -[NSVariableAssignmentExpression subexpression](self, "subexpression"));
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[NSVariableAssignmentExpression variable](self, "variable"), "hash");
  return objc_msgSend(-[NSVariableAssignmentExpression subexpression](self, "subexpression"), "hash") ^ v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    if (a4)
    {
      id v7 = -[NSExpression expressionValueWithObject:context:]( self->_subexpression,  "expressionValueWithObject:context:",  a3,  a4);
      objc_msgSend(a4, "setObject:forKey:", v7, -[NSVariableAssignmentExpression variable](self, "variable"));
      return v7;
    }

    uint64_t v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A58];
    v11 = @"must have a bindings dictionary to do variable assignments";
  }

  else
  {
    uint64_t v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A58];
    v11 = @"This expression has evaluation disabled";
  }

  objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  -[NSVariableAssignmentExpression acceptVisitor:flags:](v12, v13, v14, v15);
  return result;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      -[NSExpression acceptVisitor:flags:](self->_assignmentVariable, "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](self->_subexpression, "acceptVisitor:flags:", a3, a4);
    }

    else
    {
      -[NSExpression acceptVisitor:flags:](self->_assignmentVariable, "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](self->_subexpression, "acceptVisitor:flags:", a3, a4);
      [a3 visitPredicateExpression:self];
    }
  }

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (a3) {
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithAssignmentExpression:expression:",  objc_msgSend( -[NSVariableAssignmentExpression assignmentVariable](self, "assignmentVariable"),  "_expressionWithSubstitutionVariables:",  a3),  objc_msgSend( -[NSVariableAssignmentExpression subexpression](self, "subexpression"),  "_expressionWithSubstitutionVariables:",  a3));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  -[NSVariableExpression dealloc](v4, v5);
  return result;
}

@end