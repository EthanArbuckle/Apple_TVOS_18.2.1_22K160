@interface NSTernaryExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSTernaryExpression)initWithCoder:(id)a3;
- (NSTernaryExpression)initWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)falseExpression;
- (id)predicate;
- (id)predicateFormat;
- (id)trueExpression;
- (unint64_t)expressionType;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTernaryExpression

- (NSTernaryExpression)initWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSTernaryExpression;
  v8 = -[NSExpression initWithExpressionType:](&v10, sel_initWithExpressionType_, 20LL);
  if (v8)
  {
    v8->_predicate = (NSPredicate *)a3;
    v8->_trueExpression = (NSExpression *)a4;
    v8->_falseExpression = (NSExpression *)a5;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_predicate = 0LL;
  self->_trueExpression = 0LL;

  self->_falseExpression = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTernaryExpression;
  -[NSTernaryExpression dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 20LL;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_trueExpression, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_falseExpression, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTernaryExpression;
  -[NSExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSTernaryExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTernaryExpression predicate](self, "predicate"), @"NSPredicate");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTernaryExpression trueExpression](self, "trueExpression"),  @"NSTrueExpression");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTernaryExpression falseExpression](self, "falseExpression"),  @"NSFalseExpression");
}

- (NSTernaryExpression)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSTernaryExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v16, sel_initWithCoder_, a3);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _expressionClassesForSecureCoding]( _NSPredicateUtilities,  "_expressionClassesForSecureCoding"));
    id v9 = (id)[v6 mutableCopy];
    objc_msgSend( v9,  "unionSet:",  +[_NSPredicateUtilities _predicateClassesForSecureCoding]( _NSPredicateUtilities,  "_predicateClassesForSecureCoding"));
  }

  else
  {
    id v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_expressionClassesForSecureCoding");
    id v9 = +[_NSPredicateUtilities _predicateClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_predicateClassesForSecureCoding");
  }

  v5->_predicate = (NSPredicate *)(id)[a3 decodeObjectOfClasses:v9 forKey:@"NSPredicate"];
  v5->_trueExpression = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSTrueExpression"];
  v5->_falseExpression = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSFalseExpression"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = @"Malformed ternary expression (bad true expression)";
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = @"Malformed ternary expression (bad false expression)";
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = @"Malformed ternary expression (bad subpredicate)";
LABEL_14:
    objc_super v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v11 userInfo:0];
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  objc_super v10 = 0LL;
  if (v7)
  {
LABEL_15:
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_msgSend(-[NSTernaryExpression predicate](self, "predicate", a3), "copy");
  objc_super v5 = (void *)objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "copy");
  uint64_t v6 = (void *)objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "copy");
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredicate:v4 trueExpression:v5 falseExpression:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[NSTernaryExpression expressionType](self, "expressionType"), v5 == [a3 expressionType])
    && objc_msgSend( -[NSTernaryExpression predicate](self, "predicate"),  "isEqual:",  objc_msgSend(a3, "predicate"))
    && objc_msgSend( -[NSTernaryExpression trueExpression](self, "trueExpression"),  "isEqual:",  objc_msgSend(a3, "trueExpression")))
  {
    return objc_msgSend( -[NSTernaryExpression falseExpression](self, "falseExpression"),  "isEqual:",  objc_msgSend(a3, "falseExpression"));
  }

  else
  {
    return 0;
  }

- (id)predicateFormat
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"TERNARY(%@, %@, %@)",  objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "predicateFormat"),  objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "predicateFormat"),  objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "predicateFormat"));
}

- (id)predicate
{
  return self->_predicate;
}

- (id)trueExpression
{
  return self->_trueExpression;
}

- (id)falseExpression
{
  return self->_falseExpression;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "acceptVisitor:flags:", a3, a4);
    }

    else
    {
      objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "acceptVisitor:flags:", a3, a4);
      [a3 visitPredicateExpression:self];
    }
  }

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (a3) {
    return  -[NSTernaryExpression initWithPredicate:trueExpression:falseExpression:]( [NSTernaryExpression alloc],  "initWithPredicate:trueExpression:falseExpression:",  objc_msgSend( -[NSTernaryExpression predicate](self, "predicate"),  "predicateWithSubstitutionVariables:",  a3),  objc_msgSend( -[NSTernaryExpression trueExpression](self, "trueExpression"),  "_expressionWithSubstitutionVariables:",  a3),  objc_msgSend( -[NSTernaryExpression falseExpression](self, "falseExpression"),  "_expressionWithSubstitutionVariables:",  a3));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  return -[NSTernaryExpression expressionValueWithObject:context:](v4, v5, v6, v7);
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    if (objc_msgSend( -[NSTernaryExpression predicate](self, "predicate"),  "evaluateWithObject:substitutionVariables:",  a3,  a4)) {
      id v7 = -[NSTernaryExpression trueExpression](self, "trueExpression");
    }
    else {
      id v7 = -[NSTernaryExpression falseExpression](self, "falseExpression");
    }
    return (id)[v7 expressionValueWithObject:a3 context:a4];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
    return -[NSInflectionRule _init](v9, v10);
  }

@end