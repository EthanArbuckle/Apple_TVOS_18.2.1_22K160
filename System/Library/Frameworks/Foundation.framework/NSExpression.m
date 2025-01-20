@interface NSExpression
+ (BOOL)supportsSecureCoding;
+ (NSExpression)expressionForAggregate:(NSArray *)subexpressions;
+ (NSExpression)expressionForAnyKey;
+ (NSExpression)expressionForBlock:(void *)block arguments:(NSArray *)arguments;
+ (NSExpression)expressionForConstantValue:(id)obj;
+ (NSExpression)expressionForEvaluatedObject;
+ (NSExpression)expressionForFunction:(NSExpression *)target selectorName:(NSString *)name arguments:(NSArray *)parameters;
+ (NSExpression)expressionForFunction:(NSString *)name arguments:(NSArray *)parameters;
+ (NSExpression)expressionForIntersectSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForKeyPath:(NSString *)keyPath;
+ (NSExpression)expressionForMinusSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForSubquery:(NSExpression *)expression usingIteratorVariable:(NSString *)variable predicate:(NSPredicate *)predicate;
+ (NSExpression)expressionForUnionSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForVariable:(NSString *)string;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat argumentArray:(NSArray *)arguments;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat arguments:(va_list)argList;
+ (id)_newKeyPathExpressionForString:(id)a3;
+ (id)expressionForSymbolicString:(id)a3;
+ (id)expressionForTernaryWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5;
+ (id)expressionForVariableNameAssignment:(id)a3 expression:(id)a4;
- (BOOL)_allowsEvaluation;
- (BOOL)_shouldUseParensWithDescription;
- (NSArray)arguments;
- (NSExpression)falseExpression;
- (NSExpression)initWithCoder:(NSCoder *)coder;
- (NSExpression)initWithExpressionType:(NSExpressionType)type;
- (NSExpression)leftExpression;
- (NSExpression)operand;
- (NSExpression)rightExpression;
- (NSExpression)trueExpression;
- (NSExpressionType)expressionType;
- (NSPredicate)predicate;
- (NSString)function;
- (NSString)keyPath;
- (NSString)variable;
- (SEL)selector;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)collection;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)object context:(NSMutableDictionary *)context;
- (id)predicateFormat;
- (id)subexpression;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)encodeWithCoder:(id)a3;
- (void)expressionBlock;
@end

@implementation NSExpression

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat argumentArray:(NSArray *)arguments
{
  return (NSExpression *)-[NSPredicate leftExpression]( +[NSPredicate predicateWithFormat:argumentArray:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:argumentArray:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ == 1",  expressionFormat),  arguments),  "leftExpression");
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat
{
  return (NSExpression *)objc_msgSend(a1, "expressionWithFormat:arguments:", expressionFormat, va, va);
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat arguments:(va_list)argList
{
  return (NSExpression *)-[NSPredicate leftExpression]( +[NSPredicate predicateWithFormat:arguments:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:arguments:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ == 1",  expressionFormat),  argList),  "leftExpression");
}

+ (NSExpression)expressionForConstantValue:(id)obj
{
  return (NSExpression *) -[NSConstantValueExpression initWithObject:]( objc_alloc(&OBJC_CLASS___NSConstantValueExpression),  "initWithObject:",  obj);
}

+ (NSExpression)expressionForEvaluatedObject
{
  return (NSExpression *)objc_alloc_init(&OBJC_CLASS___NSSelfExpression);
}

+ (NSExpression)expressionForVariable:(NSString *)string
{
  return (NSExpression *) -[NSVariableExpression initWithObject:]( objc_alloc(&OBJC_CLASS___NSVariableExpression),  "initWithObject:",  string);
}

+ (id)expressionForSymbolicString:(id)a3
{
  return  -[NSSymbolicExpression initWithString:]( objc_alloc(&OBJC_CLASS___NSSymbolicExpression),  "initWithString:",  a3);
}

+ (NSExpression)expressionForAggregate:(NSArray *)subexpressions
{
  return (NSExpression *) -[NSAggregateExpression initWithCollection:]( objc_alloc(&OBJC_CLASS___NSAggregateExpression),  "initWithCollection:",  subexpressions);
}

+ (NSExpression)expressionForSubquery:(NSExpression *)expression usingIteratorVariable:(NSString *)variable predicate:(NSPredicate *)predicate
{
  return (NSExpression *) -[NSSubqueryExpression initWithExpression:usingIteratorVariable:predicate:]( objc_alloc(&OBJC_CLASS___NSSubqueryExpression),  "initWithExpression:usingIteratorVariable:predicate:",  expression,  variable,  predicate);
}

+ (NSExpression)expressionForFunction:(NSExpression *)target selectorName:(NSString *)name arguments:(NSArray *)parameters
{
  return (NSExpression *) -[NSFunctionExpression initWithTarget:selectorName:arguments:]( objc_alloc(&OBJC_CLASS___NSFunctionExpression),  "initWithTarget:selectorName:arguments:",  target,  name,  parameters);
}

+ (id)expressionForVariableNameAssignment:(id)a3 expression:(id)a4
{
  return  -[NSVariableAssignmentExpression initWithAssignmentVariable:expression:]( objc_alloc(&OBJC_CLASS___NSVariableAssignmentExpression),  "initWithAssignmentVariable:expression:",  a3,  a4);
}

+ (id)expressionForTernaryWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5
{
  return  -[NSTernaryExpression initWithPredicate:trueExpression:falseExpression:]( objc_alloc(&OBJC_CLASS___NSTernaryExpression),  "initWithPredicate:trueExpression:falseExpression:",  a3,  a4,  a5);
}

+ (id)_newKeyPathExpressionForString:(id)a3
{
  return -[NSKeyPathSpecifierExpression initWithObject:]( objc_alloc(&OBJC_CLASS___NSKeyPathSpecifierExpression),  "initWithObject:",  a3);
}

+ (NSExpression)expressionForKeyPath:(NSString *)keyPath
{
  v3 = (void *)[a1 _newKeyPathExpressionForString:keyPath];
  v4 = -[NSKeyPathExpression initWithKeyPath:](objc_alloc(&OBJC_CLASS___NSKeyPathExpression), "initWithKeyPath:", v3);

  return &v4->super.super;
}

+ (NSExpression)expressionForFunction:(NSString *)name arguments:(NSArray *)parameters
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  SEL v6 = NSSelectorFromString(name);
  objc_opt_self();
  if ([*(id *)_CFPredicatePolicyData() objectForKey:name])
  {
    LODWORD(v7) = 0;
  }

  else
  {
    objc_opt_self();
    v8 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = name;
      _os_log_fault_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_FAULT,  "NSPredicate: Use of '%{public}@' as an NSExpression function is forbidden.",  buf,  0xCu);
    }

    objc_opt_self();
    unint64_t v7 = ((unint64_t)_CFPredicatePolicyData_getFlags() >> 3) & 1;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0 || (_DWORD)v7) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ is not a supported method.", name), 0 reason userInfo]);
  }
  return (NSExpression *) -[NSFunctionExpression initWithSelector:argumentArray:]( objc_alloc(&OBJC_CLASS___NSFunctionExpression),  "initWithSelector:argumentArray:",  v6,  parameters);
}

+ (NSExpression)expressionForUnionSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *) -[NSSetExpression initWithType:leftExpression:rightExpression:]( objc_alloc(&OBJC_CLASS___NSSetExpression),  "initWithType:leftExpression:rightExpression:",  5LL,  left,  right);
}

+ (NSExpression)expressionForIntersectSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *) -[NSSetExpression initWithType:leftExpression:rightExpression:]( objc_alloc(&OBJC_CLASS___NSSetExpression),  "initWithType:leftExpression:rightExpression:",  6LL,  left,  right);
}

+ (NSExpression)expressionForMinusSet:(NSExpression *)left with:(NSExpression *)right
{
  return (NSExpression *) -[NSSetExpression initWithType:leftExpression:rightExpression:]( objc_alloc(&OBJC_CLASS___NSSetExpression),  "initWithType:leftExpression:rightExpression:",  7LL,  left,  right);
}

+ (NSExpression)expressionForBlock:(void *)block arguments:(NSArray *)arguments
{
  return (NSExpression *) -[NSBlockExpression initWithType:block:arguments:]( objc_alloc(&OBJC_CLASS___NSBlockExpression),  "initWithType:block:arguments:",  19LL,  block,  arguments);
}

+ (NSExpression)expressionForAnyKey
{
  return (NSExpression *)objc_alloc_init(&OBJC_CLASS___NSAnyKeyExpression);
}

- (NSExpression)initWithExpressionType:(NSExpressionType)type
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSExpression;
  result = -[NSExpression init](&v5, sel_init);
  if (result) {
    result->_expressionType = type;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsEvaluation
{
  return (*(_BYTE *)&self->_expressionFlags & 1) == 0;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_expressionFlags &= ~1u;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSExpression expressionType](self, "expressionType"),  @"NSExpressionType");
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
    -[NSExpression initWithCoder:](v5, v6, v7);
  }

- (NSExpression)initWithCoder:(NSCoder *)coder
{
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSExpression copyWithZone:](v7, v8, v9);
  }

  objc_super v5 = -[NSExpression initWithExpressionType:]( self,  "initWithExpressionType:",  -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", @"NSExpressionType"));
  if (v5 && -[NSCoder requiresSecureCoding](coder, "requiresSecureCoding")) {
    *(_DWORD *)&v5->_expressionFlags |= 1u;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)expressionValueWithObject:(id)object context:(NSMutableDictionary *)context
{
  SEL v6 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)predicateFormat
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpressionType)expressionType
{
  return self->_expressionType;
}

- (NSString)keyPath
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)constantValue
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)variable
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)function
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)operand
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (SEL)selector
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)leftExpression
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)rightExpression
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSPredicate)predicate
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)collection
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)subexpression
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)trueExpression
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)falseExpression
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)expressionBlock
{
  v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)_shouldUseParensWithDescription
{
  return 0;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0) {
    [a3 visitPredicateExpression:self];
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Cannot substitute a nil substitution dictionary.",  0,  v3,  v4));
    return +[NSFalsePredicate allocWithZone:](v5, v6, v7);
  }

  return self;
}

@end