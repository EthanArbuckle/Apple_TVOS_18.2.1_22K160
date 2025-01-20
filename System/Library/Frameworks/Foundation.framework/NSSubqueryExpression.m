@interface NSSubqueryExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldUseParensWithDescription;
- (BOOL)isEqual:(id)a3;
- (NSSubqueryExpression)initWithCoder:(id)a3;
- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorExpression:(id)a4 predicate:(id)a5;
- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorVariable:(id)a4 predicate:(id)a5;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)collection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicate;
- (id)predicateFormat;
- (id)variable;
- (id)variableExpression;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSubqueryExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSubqueryExpression;
  -[NSSubqueryExpression dealloc](&v3, sel_dealloc);
}

- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorVariable:(id)a4 predicate:(id)a5
{
  if (a4 && a5)
  {
    v8 = -[NSVariableExpression initWithObject:](objc_alloc(&OBJC_CLASS___NSVariableExpression), "initWithObject:", a4);
    v9 = -[NSSubqueryExpression initWithExpression:usingIteratorExpression:predicate:]( self,  "initWithExpression:usingIteratorExpression:predicate:",  a3,  v8,  a5);

    return v9;
  }

  else
  {
    -[NSSubqueryExpression dealloc](self, "dealloc", a3);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSSubqueryExpression must be initialized with non-nil variable name and expression." userInfo:0]);
    return -[NSSubqueryExpression initWithExpression:usingIteratorExpression:predicate:](v11, v12, v13, v14, v15);
  }

- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorExpression:(id)a4 predicate:(id)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSubqueryExpression;
  v8 = -[NSExpression initWithExpressionType:](&v11, sel_initWithExpressionType_, 13LL);
  v9 = v8;
  if (!a4 || !a5)
  {
    -[NSSubqueryExpression dealloc](v8, "dealloc");
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSSubqueryExpression must be initialized with non-nil variable name and expression." userInfo:0]);
  }

  v8->_collection = (NSExpression *)a3;
  v9->_variableExpression = (NSExpression *)a4;
  v9->_subpredicate = (NSPredicate *)a5;
  return v9;
}

- (unint64_t)expressionType
{
  return 13LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSExpression allowEvaluation](self->_collection, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_variableExpression, "allowEvaluation");
  -[NSPredicate allowEvaluation](self->_subpredicate, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSubqueryExpression;
  -[NSExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSubqueryExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSubqueryExpression collection](self, "collection"),  @"NSExpression");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSubqueryExpression variable](self, "variable"), @"NSVariable");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSubqueryExpression predicate](self, "predicate"),  @"NSSubpredicate");
}

- (NSSubqueryExpression)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSSubqueryExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v18, sel_initWithCoder_, a3);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  v7 = v6;
  if (v6)
  {
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _expressionClassesForSecureCoding]( _NSPredicateUtilities,  "_expressionClassesForSecureCoding"));
    id v9 = (id)[v7 mutableCopy];
    objc_msgSend( v9,  "unionSet:",  +[_NSPredicateUtilities _predicateClassesForSecureCoding]( _NSPredicateUtilities,  "_predicateClassesForSecureCoding"));
  }

  else
  {
    id v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_expressionClassesForSecureCoding");
    id v9 = +[_NSPredicateUtilities _predicateClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_predicateClassesForSecureCoding");
  }

  v5->_collection = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSExpression"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSVariable"];
  objc_super v11 = -[NSVariableExpression initWithObject:](objc_alloc(&OBJC_CLASS___NSVariableExpression), "initWithObject:", v10);
  v5->_variableExpression = &v11->super;
  *(_DWORD *)&v11->super._expressionFlags |= 1u;
  v5->_subpredicate = (NSPredicate *)(id)[a3 decodeObjectOfClasses:v9 forKey:@"NSSubpredicate"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = @"Malformed subquery expression (bad collection)";
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = @"Malformed subquery expression (bad subpredicate)";
    goto LABEL_14;
  }

  if (!v10)
  {
    id v13 = @"Malformed subquery expression (bad variable)";
LABEL_14:
    uint64_t v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v13 userInfo:0];
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  uint64_t v12 = 0LL;
  if (v7)
  {
LABEL_15:
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)-[NSExpression copy](self->_collection, "copy", a3);
  objc_super v5 = (void *)-[NSExpression copy](self->_variableExpression, "copy");
  uint64_t v6 = (void *)-[NSPredicate copy](self->_subpredicate, "copy");
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExpression:v4 usingIteratorExpression:v5 predicate:v6];

  return v7;
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SUBQUERY(%@, %@, %@)",  objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "description"),  objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "description"),  objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "description"));
}

- (id)collection
{
  return self->_collection;
}

- (id)variableExpression
{
  return self->_variableExpression;
}

- (id)variable
{
  return (id)objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "variable");
}

- (id)predicate
{
  return self->_subpredicate;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( -[NSSubqueryExpression variable](self, "variable"),  "isEqual:",  objc_msgSend(a3, "variable")))
  {
    return objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "isEqual:", objc_msgSend(a3, "predicate"));
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[NSSubqueryExpression variable](self, "variable"), "hash");
  return objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "hash") ^ v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A58];
    v22 = @"This expression has evaluation disabled";
    goto LABEL_24;
  }

  uint64_t v7 = objc_msgSend( -[NSSubqueryExpression collection](self, "collection"),  "expressionValueWithObject:context:",  a3,  a4);
  if (!v7) {
    return 0LL;
  }
  id v8 = (void *)v7;
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A58];
    v22 = @"Can't perform collection evaluate with non-collection object.";
LABEL_24:
    objc_exception_throw((id)[v20 exceptionWithName:v21 reason:v22 userInfo:0]);
  }

  id v9 = (void *)[MEMORY[0x189603FA8] array];
  id v10 = v8;
  v23 = (void *)objc_msgSend(a4, "objectForKey:", -[NSSubqueryExpression variable](self, "variable"));
  id v11 = v23;
  id v12 = a4;
  if (!a4) {
    id v12 = (id)[MEMORY[0x189603FC8] dictionary];
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "setObject:forKey:", v17, -[NSSubqueryExpression variable](self, "variable"));
        if (objc_msgSend( -[NSSubqueryExpression predicate](self, "predicate"),  "evaluateWithObject:substitutionVariables:",  a3,  v12)) {
          [v9 addObject:v17];
        }
      }

      uint64_t v14 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }

    while (v14);
  }

  id v18 = -[NSSubqueryExpression variable](self, "variable");
  if (v23) {
    [a4 setObject:v23 forKey:v18];
  }
  else {
    [a4 removeObjectForKey:v18];
  }

  return v9;
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (a3) {
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithExpression:usingIteratorExpression:predicate:",  objc_msgSend( -[NSSubqueryExpression collection](self, "collection"),  "_expressionWithSubstitutionVariables:",  a3),  objc_msgSend( -[NSSubqueryExpression variableExpression](self, "variableExpression"),  "_expressionWithSubstitutionVariables:",  a3),  objc_msgSend( -[NSSubqueryExpression predicate](self, "predicate"),  "predicateWithSubstitutionVariables:",  a3));
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  return (id)-[NSSubqueryExpression _shouldUseParensWithDescription](v4, v5);
}

- (BOOL)_shouldUseParensWithDescription
{
  return 0;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend( -[NSSubqueryExpression variableExpression](self, "variableExpression"),  "acceptVisitor:flags:",  a3,  a4);
      objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
    }

    else
    {
      objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend( -[NSSubqueryExpression variableExpression](self, "variableExpression"),  "acceptVisitor:flags:",  a3,  a4);
      objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      [a3 visitPredicateExpression:self];
    }
  }

@end