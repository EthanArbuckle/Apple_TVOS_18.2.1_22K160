@interface NSComparisonPredicate
+ (BOOL)supportsSecureCoding;
+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector;
+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5;
+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSComparisonPredicate)initWithCoder:(NSCoder *)coder;
- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector;
- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5;
- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5;
- (NSComparisonPredicate)predicateWithSubstitutionVariables:(id)a3;
- (NSComparisonPredicateModifier)comparisonPredicateModifier;
- (NSComparisonPredicateOptions)options;
- (NSExpression)leftExpression;
- (NSExpression)rightExpression;
- (NSPredicateOperatorType)predicateOperatorType;
- (SEL)customSelector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (id)keyPathExpressionForString:(id)a3;
- (id)predicateFormat;
- (id)predicateOperator;
- (unint64_t)hash;
- (void)_acceptExpressions:(id)a3 flags:(unint64_t)a4;
- (void)_acceptOperator:(id)a3 flags:(unint64_t)a4;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicateOperator:(id)a3;
@end

@implementation NSComparisonPredicate

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  return (NSComparisonPredicate *)(id)[objc_alloc((Class)a1) initWithLeftExpression:lhs rightExpression:rhs modifier:modifier type:type options:options];
}

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  return (NSComparisonPredicate *)(id)[objc_alloc((Class)a1) initWithLeftExpression:lhs rightExpression:rhs customSelector:selector];
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  id v10 = +[NSPredicateOperator _newOperatorWithType:modifier:options:]( &OBJC_CLASS___NSPredicateOperator,  "_newOperatorWithType:modifier:options:",  type,  modifier,  options);
  v11 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:]( self,  "initWithPredicateOperator:leftExpression:rightExpression:",  v10,  lhs,  rhs);

  return v11;
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  v8 = -[NSCustomPredicateOperator initWithCustomSelector:modifier:]( objc_alloc(&OBJC_CLASS___NSCustomPredicateOperator),  "initWithCustomSelector:modifier:",  selector,  0LL);
  v9 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:]( self,  "initWithPredicateOperator:leftExpression:rightExpression:",  v8,  lhs,  rhs);

  return v9;
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  return (NSComparisonPredicate *)(id)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftKeyPath:a4 rightValue:a5];
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  return (NSComparisonPredicate *)(id)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftKeyPath:a4 rightKeyPath:a5];
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  return (NSComparisonPredicate *)(id)[objc_alloc((Class)a1) initWithPredicateOperator:a3 leftExpression:a4 rightExpression:a5];
}

- (id)keyPathExpressionForString:(id)a3
{
  return  +[NSExpression _newKeyPathExpressionForString:]( &OBJC_CLASS___NSExpression,  "_newKeyPathExpressionForString:",  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSExpression allowEvaluation](self->_lhs, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_rhs, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSComparisonPredicate;
  -[NSPredicate allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSComparisonPredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSComparisonPredicate leftExpression](self, "leftExpression"),  @"NSLeftExpression");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSComparisonPredicate rightExpression](self, "rightExpression"),  @"NSRightExpression");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSComparisonPredicate predicateOperator](self, "predicateOperator"),  @"NSPredicateOperator");
}

- (NSComparisonPredicate)initWithCoder:(NSCoder *)coder
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSComparisonPredicate;
  objc_super v5 = -[NSPredicate initWithCoder:](&v16, sel_initWithCoder_, coder);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = -[NSCoder allowedClasses](coder, "allowedClasses");
  uint64_t v7 = -[NSSet count](v6, "count");
  if (v7)
  {
    id v8 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding]( _NSPredicateUtilities,  "_extendedExpressionClassesForSecureCoding"));
    id v9 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
    objc_msgSend( v9,  "unionSet:",  +[_NSPredicateUtilities _operatorClassesForSecureCoding]( _NSPredicateUtilities,  "_operatorClassesForSecureCoding"));
  }

  else
  {
    id v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_extendedExpressionClassesForSecureCoding");
    id v9 = +[_NSPredicateUtilities _operatorClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_operatorClassesForSecureCoding");
  }

  v5->_lhs = (NSExpression *) -[NSCoder decodeObjectOfClasses:forKey:]( coder,  "decodeObjectOfClasses:forKey:",  v8,  @"NSLeftExpression");
  v5->_rhs = (NSExpression *) -[NSCoder decodeObjectOfClasses:forKey:]( coder,  "decodeObjectOfClasses:forKey:",  v8,  @"NSRightExpression");
  v5->_predicateOperator = (NSPredicateOperator *) -[NSCoder decodeObjectOfClasses:forKey:]( coder,  "decodeObjectOfClasses:forKey:",  v9,  @"NSPredicateOperator");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = @"Malformed comparison predicate (bad left expression)";
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = @"Malformed comparison predicate (bad right expression)";
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = @"Malformed comparison predicate (bad operator)";
LABEL_14:
    id v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v11 userInfo:0];
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  id v10 = 0LL;
  if (v7)
  {
LABEL_15:
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator", a3), "copy");
  objc_super v5 = (void *)-[NSExpression copy](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "copy");
  uint64_t v6 = (void *)-[NSExpression copy](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "copy");
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredicateOperator:v4 leftExpression:v5 rightExpression:v6];

  return v7;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  id v8 = -[NSKeyPathExpression initWithKeyPath:]( objc_alloc(&OBJC_CLASS___NSKeyPathExpression),  "initWithKeyPath:",  -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a4));
  id v9 = -[NSKeyPathExpression initWithKeyPath:]( objc_alloc(&OBJC_CLASS___NSKeyPathExpression),  "initWithKeyPath:",  -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a5));
  id v10 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:]( self,  "initWithPredicateOperator:leftExpression:rightExpression:",  a3,  v8,  v9);

  return v10;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  id v8 = -[NSKeyPathExpression initWithKeyPath:]( objc_alloc(&OBJC_CLASS___NSKeyPathExpression),  "initWithKeyPath:",  -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a4));
  id v9 = -[NSConstantValueExpression initWithObject:]( objc_alloc(&OBJC_CLASS___NSConstantValueExpression),  "initWithObject:",  a5);
  id v10 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:]( self,  "initWithPredicateOperator:leftExpression:rightExpression:",  a3,  v8,  v9);

  return v10;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!a3 || !a4 || !a5)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Cannot create a comparison predicate with nil operator or expression." userInfo:0]);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSComparisonPredicate;
  id v8 = -[NSComparisonPredicate init](&v10, sel_init);
  if (v8)
  {
    v8->_predicateOperator = (NSPredicateOperator *)a3;
    v8->_lhs = (NSExpression *)a4;
    v8->_rhs = (NSExpression *)a5;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_lhs = 0LL;
  self->_rhs = 0LL;

  self->_predicateOperator = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSComparisonPredicate;
  -[NSComparisonPredicate dealloc](&v3, sel_dealloc);
}

- (id)predicateFormat
{
  objc_super v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  -[NSComparisonPredicate leftExpression](self, "leftExpression"),  -[NSComparisonPredicate predicateOperator](self, "predicateOperator"),  -[NSComparisonPredicate rightExpression](self, "rightExpression"));
  if (-[NSComparisonPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier") == NSAllPredicateModifier)
  {
    uint64_t v4 = @"ALL ";
  }

  else
  {
    NSComparisonPredicateModifier v5 = -[NSComparisonPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier");
    uint64_t v4 = &stru_189CA6A28;
    if (v5 == NSAnyPredicateModifier) {
      uint64_t v4 = @"ANY ";
    }
  }

  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v4, v3);
}

- (NSPredicateOperatorType)predicateOperatorType
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "operatorType");
}

- (NSComparisonPredicateModifier)comparisonPredicateModifier
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "modifier");
}

- (NSExpression)leftExpression
{
  return self->_lhs;
}

- (NSExpression)rightExpression
{
  return self->_rhs;
}

- (SEL)customSelector
{
  return (SEL)objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "selector");
}

- (id)predicateOperator
{
  return self->_predicateOperator;
}

- (void)setPredicateOperator:(id)a3
{
  predicateOperator = self->_predicateOperator;
  if (predicateOperator != a3)
  {

    self->_predicateOperator = (NSPredicateOperator *)a3;
  }

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( -[NSComparisonPredicate predicateOperator](self, "predicateOperator"),  "isEqual:",  objc_msgSend(a3, "predicateOperator"))
    && -[NSExpression isEqual:]( -[NSComparisonPredicate leftExpression](self, "leftExpression"),  "isEqual:",  [a3 leftExpression]))
  {
    return -[NSExpression isEqual:]( -[NSComparisonPredicate rightExpression](self, "rightExpression"),  "isEqual:",  [a3 rightExpression]);
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "hash");
  uint64_t v4 = -[NSExpression hash](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "hash") ^ v3;
  return v4 ^ -[NSExpression hash](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "hash");
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation")) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  uint64_t v7 = (void *)MEMORY[0x186E1FF60]();
  if (!a4 || (id v8 = (id *)a4, object_getClass(a4) != (Class)&OBJC_CLASS____NSNestedDictionary))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = (objc_class *)objc_opt_class();
    id v8 = (id *)&v19;
    object_setClass(&v19, v9);
    *(void *)&__int128 v20 = a4;
  }

  objc_super v10 = -[NSComparisonPredicate leftExpression](self, "leftExpression", v19, v20, v21, v22, v23, v24);
  id v11 = -[NSComparisonPredicate predicateOperator](self, "predicateOperator");
  uint64_t v12 = [v11 operatorType];
  if (v12 == 11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v13 = 4211063755LL;
    }
    else {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  uint64_t v14 = -[NSExpression expressionValueWithObject:context:](v10, "expressionValueWithObject:context:", a3, v8);
  id v15 = -[NSExpression expressionValueWithObject:context:]( -[NSComparisonPredicate rightExpression](self, "rightExpression"),  "expressionValueWithObject:context:",  a3,  v8);
  if (v12 == 11)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 704) = v13;
    char v17 = [v11 performOperationUsingObject:v14 andObject:v15];
    *(void *)(StatusReg + 704) = 0LL;
  }

  else
  {
    char v17 = [v11 performOperationUsingObject:v14 andObject:v15];
  }

  if (v8 != a4) {

  }
  objc_autoreleasePoolPop(v7);
  return v17;
}

- (void)_acceptOperator:(id)a3 flags:(unint64_t)a4
{
}

- (void)_acceptExpressions:(id)a3 flags:(unint64_t)a4
{
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v7 = (void *)MEMORY[0x186E1FF60](self, a2);
  if ((a4 & 4) != 0) {
    [a3 visitPredicate:self];
  }
  if ((a4 & 0xA) == 0xA) {
    -[NSComparisonPredicate _acceptOperator:flags:](self, "_acceptOperator:flags:", a3, a4);
  }
  if ((a4 & 1) != 0) {
    -[NSComparisonPredicate _acceptExpressions:flags:](self, "_acceptExpressions:flags:", a3, a4);
  }
  if ((a4 & 0xA) == 2) {
    -[NSComparisonPredicate _acceptOperator:flags:](self, "_acceptOperator:flags:", a3, a4);
  }
  if ((a4 & 4) == 0) {
    [a3 visitPredicate:self];
  }
  objc_autoreleasePoolPop(v7);
}

- (NSComparisonPredicate)predicateWithSubstitutionVariables:(id)a3
{
  if (a3)
  {
    NSComparisonPredicateModifier v5 = (void *)MEMORY[0x186E1FF60](self, a2);
    uint64_t v6 = (void *)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithPredicateOperator:leftExpression:rightExpression:",  -[NSComparisonPredicate predicateOperator](self, "predicateOperator"),  -[NSExpression _expressionWithSubstitutionVariables:]( -[NSComparisonPredicate leftExpression](self, "leftExpression"),  "_expressionWithSubstitutionVariables:",  a3),  -[NSExpression _expressionWithSubstitutionVariables:]( -[NSComparisonPredicate rightExpression](self, "rightExpression"),  "_expressionWithSubstitutionVariables:",  a3));
    objc_autoreleasePoolPop(v5);
    return (NSComparisonPredicate *)v6;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
    return (NSComparisonPredicate *)-[NSComparisonPredicate options](v8, v9);
  }

- (NSComparisonPredicateOptions)options
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "options");
}

- (id)generateMetadataDescription
{
  NSPredicateOperatorType v3 = -[NSComparisonPredicate predicateOperatorType](self, "predicateOperatorType");
  unint64_t v4 = v3;
  if (v3 > NSCustomSelectorPredicateOperatorType)
  {
    if (v3 - 99 >= 2)
    {
      id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown type of NSComparisonPredicate given to NSMetadataQuery (%@)",  self);
      goto LABEL_78;
    }
  }

  else if (((1LL << v3) & 0x7BF) == 0)
  {
    if (v3 == NSMatchesPredicateOperatorType) {
      id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSMatchesPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)",  self);
    }
    else {
      id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSCustomSelectorPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)",  self);
    }
    goto LABEL_78;
  }

  NSComparisonPredicateModifier v5 = -[NSComparisonPredicate leftExpression](self, "leftExpression");
  uint64_t v6 = -[NSExpression expressionType](v5, "expressionType");
  if (v6 != 3)
  {
    if (v6 == 15)
    {
      uint64_t v7 = @"*";
      switch(v4)
      {
        case 0uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSLessThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)",  self);
          goto LABEL_78;
        case 1uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSLessThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)",  self);
          goto LABEL_78;
        case 2uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSGreaterThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)",  self);
          goto LABEL_78;
        case 3uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSGreaterThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)",  self);
          goto LABEL_78;
        case 5uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSNotEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)",  self);
          goto LABEL_78;
        default:
          goto LABEL_8;
      }
    }

    id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with left expression which is not NSKeyPathExpressionType or NSAnyKeyExpressionType given to NSMetadataQuery (%@)",  self);
    goto LABEL_78;
  }

  uint64_t v7 = -[NSExpression keyPath](v5, "keyPath");
LABEL_8:
  SEL v9 = -[NSComparisonPredicate rightExpression](self, "rightExpression");
  uint64_t v10 = -[NSExpression expressionType](v9, "expressionType");
  if (v10 && v10 != 14)
  {
    id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with right expression which is not NSConstantValueExpressionType or NSAggregateExpressionType given to NSMetadataQuery (%@)",  self);
    goto LABEL_78;
  }

  id v11 = -[NSExpression constantValue](v9, "constantValue");
  if (!_NSIsNSString())
  {
    if (_NSIsNSNumber())
    {
      switch(v4)
      {
        case 7uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)",  self);
          break;
        case 8uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)",  self);
          break;
        case 9uLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)",  self);
          break;
        case 0xAuLL:
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)",  self);
          break;
        default:
          if (v4 != 99)
          {
            v18 = (NSString *)[v11 description];
            goto LABEL_21;
          }

          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)",  self);
          break;
      }
    }

    else
    {
      if (_NSIsNSDate())
      {
        switch(v4)
        {
          case 7uLL:
            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)",  self);
            goto LABEL_78;
          case 8uLL:
            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)",  self);
            goto LABEL_78;
          case 9uLL:
            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)",  self);
            goto LABEL_78;
          case 0xAuLL:
            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)",  self);
            goto LABEL_78;
          default:
            if (v4 == 99)
            {
              id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)",  self);
              goto LABEL_78;
            }

            [v11 timeIntervalSinceReferenceDate];
            v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", v19);
LABEL_21:
            __int128 v20 = v18;
            break;
        }

        goto LABEL_41;
      }

      if (_NSIsNSArray())
      {
        if (v4 == 100)
        {
          if ([v11 count] == 2)
          {
            __int128 v21 = (void *)[v11 objectAtIndex:0];
            __int128 v22 = (void *)[v11 objectAtIndex:1];
            if (_NSIsNSNumber() && (_NSIsNSNumber() & 1) != 0)
            {
              __int128 v20 = (NSString *)[v21 description];
              uint64_t v23 = [v22 description];
              return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"InRange(%@,%@,%@)",  v7,  v20,  v23);
            }

            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array containing other than numbers given to NSMetadataQuery (%@)",  self);
          }

          else
          {
            id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array with an invalid count given to NSMetadataQuery (%@)",  self);
          }
        }

        else
        {
          id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with type other than NSBetweenPredicateOperatorType and right expression which is an array given to NSMetadataQuery (%@)",  self);
        }
      }

      else
      {
        id v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSComparisonPredicate with a right expression which is not a string, number, or date given to NSMetadataQuery (%@)",  self);
      }
    }

@end