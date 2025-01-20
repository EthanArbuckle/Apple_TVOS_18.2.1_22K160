@interface NSPredicateOperator
+ (BOOL)supportsSecureCoding;
+ (NSPredicateOperator)operatorWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4;
+ (NSPredicateOperator)operatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
+ (SEL)_getSelectorForType:(unint64_t)a3;
+ (id)_getSymbolForType:(unint64_t)a3;
+ (id)_newOperatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)performOperationUsingObject:(id)a3 andObject:(id)a4;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSPredicateOperator)initWithCoder:(id)a3;
- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3;
- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbol;
- (unint64_t)hash;
- (unint64_t)modifier;
- (unint64_t)operatorType;
- (unint64_t)options;
- (void)_setModifier:(unint64_t)a3;
- (void)_setOptions:(unint64_t)a3;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPredicateOperator

+ (id)_getSymbolForType:(unint64_t)a3
{
  id result = @"<";
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      id result = @"<=";
      break;
    case 2uLL:
      id result = @">";
      break;
    case 3uLL:
      id result = @">=";
      break;
    case 4uLL:
      id result = @"==";
      break;
    case 5uLL:
      id result = @"!=";
      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      id result = @"IN";
      break;
    default:
      if (a3 == 99)
      {
        id result = @"CONTAINS";
      }

      else if (a3 == 100)
      {
        id result = @"BETWEEN";
      }

      else
      {
LABEL_12:
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Unknown predicate type %ld", a3), 0 reason userInfo]);
        id result = (id)+[NSPredicateOperator _getSelectorForType:](v4, v5, v6);
      }

      break;
  }

  return result;
}

+ (SEL)_getSelectorForType:(unint64_t)a3
{
  v3 = &selRef_compare_;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 < 4) {
      return *v3;
    }
  }

  else if ((uint64_t)a3 > 98)
  {
    if (a3 == 99) {
      goto LABEL_11;
    }
    if (a3 == 100) {
      return *v3;
    }
  }

  else
  {
    if (a3 - 4 < 2)
    {
      v3 = &selRef_isEqual_;
      return *v3;
    }

    if (a3 == 10)
    {
LABEL_11:
      v3 = &selRef_containsObject_;
      return *v3;
    }
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Unknown predicate type %ld", a3), 0 reason userInfo]);
  return (SEL)+[NSPredicateOperator operatorWithType:modifier:options:](v5, v6, v7, v8, v9);
}

+ (NSPredicateOperator)operatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  return (NSPredicateOperator *)(id)[a1 _newOperatorWithType:a3 modifier:a4 options:a5];
}

+ (id)_newOperatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  if ((uint64_t)a3 > 98)
  {
    if ((uint64_t)a3 > 999)
    {
      if (a3 == 1000)
      {
        v18 = objc_alloc(&OBJC_CLASS___NSTokenMatchingPredicateOperator);
        uint64_t v19 = 1000LL;
        return -[NSStringPredicateOperator initWithOperatorType:modifier:variant:]( v18,  "initWithOperatorType:modifier:variant:",  v19,  a4,  a5);
      }

      if (a3 == 2000) {
        return -[NSPredicateOperator initWithOperatorType:modifier:]( objc_alloc(&OBJC_CLASS___NSBoundedByPredicateOperator),  "initWithOperatorType:modifier:",  2000LL,  a4);
      }
    }

    else
    {
      if (a3 == 99)
      {
        v11 = objc_alloc(&OBJC_CLASS___NSInPredicateOperator);
        uint64_t v12 = 99LL;
        return -[NSInPredicateOperator initWithOperatorType:modifier:options:]( v11,  "initWithOperatorType:modifier:options:",  v12,  a4,  a5);
      }

      if (a3 == 100)
      {
        v11 = objc_alloc(&OBJC_CLASS___NSBetweenPredicateOperator);
        uint64_t v12 = 100LL;
        return -[NSInPredicateOperator initWithOperatorType:modifier:options:]( v11,  "initWithOperatorType:modifier:options:",  v12,  a4,  a5);
      }
    }

+ (NSPredicateOperator)operatorWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  return (NSPredicateOperator *) -[NSCustomPredicateOperator initWithCustomSelector:modifier:]( objc_alloc(&OBJC_CLASS___NSCustomPredicateOperator),  "initWithCustomSelector:modifier:",  a3,  a4);
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3
{
  return -[NSPredicateOperator initWithOperatorType:modifier:](self, "initWithOperatorType:modifier:", a3, 0LL);
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPredicateOperator;
  id result = -[NSPredicateOperator init](&v7, sel_init);
  if (result)
  {
    result->_operatorType = a3;
    result->_modifier = a4;
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_operatorType forKey:@"NSOperatorType"];
    [a3 encodeInteger:self->_modifier forKey:@"NSModifier"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
    -[NSPredicateOperator initWithCoder:](v5, v6, v7);
  }

- (NSPredicateOperator)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSPredicateOperator copyWithZone:](v6, v7, v8);
  }

  return -[NSPredicateOperator initWithOperatorType:modifier:]( self,  "initWithOperatorType:modifier:",  [a3 decodeIntegerForKey:@"NSOperatorType"],  objc_msgSend(a3, "decodeIntegerForKey:", @"NSModifier"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (SEL)selector
{
  return +[NSPredicateOperator _getSelectorForType:]( &OBJC_CLASS___NSPredicateOperator,  "_getSelectorForType:",  self->_operatorType);
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (id)symbol
{
  return +[NSPredicateOperator _getSymbolForType:]( &OBJC_CLASS___NSPredicateOperator,  "_getSymbolForType:",  self->_operatorType);
}

- (unint64_t)modifier
{
  return self->_modifier;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != [a3 operatorType]) {
    return 0;
  }
  unint64_t v6 = -[NSPredicateOperator modifier](self, "modifier");
  return v6 == [a3 modifier];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return -[NSString hash](NSStringFromSelector(-[NSPredicateOperator selector](self, "selector")), "hash") ^ v3;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v6 = NSClassFromString((NSString *)@"NSPredicateOperator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (BOOL)performOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = (id)[MEMORY[0x189603FE8] null];
  if (v7 == a3) {
    id v8 = 0LL;
  }
  else {
    id v8 = a3;
  }
  if (v7 == a4) {
    a4 = 0LL;
  }
  unint64_t modifier = self->_modifier;
  if (!modifier)
  {
    LOBYTE(v10) = -[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:]( self,  "performPrimitiveOperationUsingObject:andObject:",  v8,  a4);
    return v10;
  }

  if (v8)
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
    {
      v18 = (void *)MEMORY[0x189603F70];
      uint64_t v19 = *MEMORY[0x189603A60];
      v20 = @"The left hand side for an ALL or ANY operator must be either an NSArray or an NSSet.";
      goto LABEL_42;
    }

    unint64_t modifier = self->_modifier;
  }

  else
  {
    a3 = 0LL;
  }

  if (modifier == 2)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (!v10) {
      return v10;
    }
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v28;
LABEL_31:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(a3);
      }
      if (-[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:]( self,  "performPrimitiveOperationUsingObject:andObject:",  *(void *)(*((void *)&v27 + 1) + 8 * v17),  a4))
      {
        break;
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
        LOBYTE(v10) = 0;
        if (v15) {
          goto LABEL_31;
        }
        return v10;
      }
    }

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 2) != 0) {
    [a3 visitPredicateOperator:self];
  }
}

- (void)_setOptions:(unint64_t)a3
{
  unint64_t v5 = NSClassFromString((NSString *)@"NSPredicateOperator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (unint64_t)options
{
  return 0LL;
}

- (void)_setModifier:(unint64_t)a3
{
  self->_unint64_t modifier = a3;
}

@end