@interface NSFunctionExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsEvaluation;
- (BOOL)_shouldUseParensWithDescription;
- (BOOL)isEqual:(id)a3;
- (NSFunctionExpression)initWithCoder:(id)a3;
- (NSFunctionExpression)initWithExpressionType:(unint64_t)a3 operand:(id)a4 selector:(SEL)a5 argumentArray:(id)a6;
- (NSFunctionExpression)initWithSelector:(SEL)a3 argumentArray:(id)a4;
- (NSFunctionExpression)initWithTarget:(id)a3 selectorName:(id)a4 arguments:(id)a5;
- (SEL)selector;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)arguments;
- (id)binaryOperatorForSelector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)function;
- (id)operand;
- (id)predicateFormat;
- (uint64_t)_validateExpression;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFunctionExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  -[NSFunctionExpression dealloc](&v3, sel_dealloc);
}

- (uint64_t)_validateExpression
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    BOOL v7 = 0;
    result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  *(const char **)(v1 + 32),  *(void *)(v1 + 24),  &v7,  (uint64_t)@"NSFunctionExpression");
    if ((result & 1) == 0) {
      *(_DWORD *)(v1 + 8) |= 4u;
    }
    if (v7)
    {
      *(_DWORD *)(v1 + 8) |= 2u;
      result = [*(id *)(v1 + 40) firstObject];
      if (result)
      {
        v2 = (void *)result;
        if ([(id)result expressionType])
        {
          result = [v2 expressionType];
          if (result != 3) {
            return result;
          }
          result = [v2 keyPath];
          objc_super v3 = (void *)result;
        }

        else
        {
          objc_super v3 = (void *)[v2 constantValue];
          result = [v3 isNSString];
          if ((result & 1) == 0) {
            return result;
          }
        }

        if (v3)
        {
          result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  v3,  *(void *)(v1 + 24),  (uint64_t)@"NSFunctionExpression");
          int v4 = *(_DWORD *)(v1 + 8);
          int v5 = v4 | 8;
          unsigned int v6 = v4 & 0xFFFFFFF3;
          if (!(_DWORD)result) {
            unsigned int v6 = v5;
          }
          *(_DWORD *)(v1 + 8) = v6;
        }
      }
    }
  }

  return result;
}

- (NSFunctionExpression)initWithSelector:(SEL)a3 argumentArray:(id)a4
{
  BOOL v7 = -[NSConstantValueExpression initWithObject:]( objc_alloc(&OBJC_CLASS___NSConstantValueExpression),  "initWithObject:",  &OBJC_CLASS____NSPredicateUtilities);
  uint64_t v8 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:]( self,  "initWithExpressionType:operand:selector:argumentArray:",  4LL,  v7,  a3,  a4);

  return v8;
}

- (NSFunctionExpression)initWithExpressionType:(unint64_t)a3 operand:(id)a4 selector:(SEL)a5 argumentArray:(id)a6
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  v9 = -[NSExpression initWithExpressionType:](&v11, sel_initWithExpressionType_, a3);
  v9->_operand = (NSExpression *)a4;
  v9->_selector = a5;
  v9->_arguments = (NSArray *)a6;
  -[NSFunctionExpression _validateExpression]((uint64_t)v9);
  return v9;
}

- (NSFunctionExpression)initWithTarget:(id)a3 selectorName:(id)a4 arguments:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  SEL v9 = NSSelectorFromString((NSString *)a4);
  if (!v9) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Invalid selector name (%@)", a4), 0 reason userInfo]);
  }
  v10 = v9;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  objc_super v11 = -[NSExpression initWithExpressionType:](&v13, sel_initWithExpressionType_, 4LL);
  v11->_operand = (NSExpression *)a3;
  v11->_selector = v10;
  v11->_arguments = (NSArray *)a5;
  -[NSFunctionExpression _validateExpression]((uint64_t)v11);
  return v11;
}

- (unint64_t)expressionType
{
  return 4LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NSExpression allowEvaluation](self->_operand, "allowEvaluation");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  arguments = self->_arguments;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( arguments,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(arguments);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) allowEvaluation];
      }

      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( arguments,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  -[NSExpression allowEvaluation](&v8, sel_allowEvaluation);
}

- (BOOL)_allowsEvaluation
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  return -[NSExpression _allowsEvaluation](&v3, sel__allowsEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeObject:forKey:",  NSStringFromSelector(-[NSFunctionExpression selector](self, "selector")),  @"NSSelectorName");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression operand](self, "operand"), @"NSOperand");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression arguments](self, "arguments"), @"NSArguments");
}

- (NSFunctionExpression)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    v21 = @"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers";
    goto LABEL_36;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSFunctionExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v23, sel_initWithCoder_, a3);
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  uint64_t v22 = [v6 count];
  if (v22)
  {
    id v7 = (id)[v6 mutableCopy];
    objc_msgSend( v7,  "unionSet:",  +[_NSPredicateUtilities _expressionClassesForSecureCoding]( _NSPredicateUtilities,  "_expressionClassesForSecureCoding"));
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend( v8,  "unionSet:",  +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding]( _NSPredicateUtilities,  "_extendedExpressionClassesForSecureCoding"));
  }

  else
  {
    id v7 = +[_NSPredicateUtilities _expressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_expressionClassesForSecureCoding");
    id v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding]( &OBJC_CLASS____NSPredicateUtilities,  "_extendedExpressionClassesForSecureCoding");
  }

  SEL v9 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSelectorName"];
  v5->_selector = NSSelectorFromString(v9);
  v5->_operand = (NSExpression *)(id)[a3 decodeObjectOfClasses:v7 forKey:@"NSOperand"];
  v5->_arguments = (NSArray *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSArguments"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int128 v10 = @"Malformed function expression (bad operator)";
    goto LABEL_14;
  }

  if (v5->_arguments && (_NSIsNSSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    __int128 v10 = @"Malformed function expression (bad arguments)";
LABEL_14:
    __int128 v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v10 userInfo:0];
    if (v11) {
      goto LABEL_26;
    }
    goto LABEL_15;
  }

  if (!v5->_selector)
  {
    __int128 v10 = @"Malformed function expression (bad selector)";
    goto LABEL_14;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)-[NSExpression copy](self->_operand, "copy", a3);
  id v5 = -[NSFunctionExpression arguments](self, "arguments");
  uint64_t v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](self->_arguments, "count"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v10) copy];
        [v6 addObject:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v8);
  }

  __int128 v12 = (void *)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithExpressionType:operand:selector:argumentArray:",  -[NSFunctionExpression expressionType](self, "expressionType"),  v4,  -[NSFunctionExpression selector](self, "selector"),  v6);

  return v12;
}

- (id)function
{
  return NSStringFromSelector(-[NSFunctionExpression selector](self, "selector"));
}

- (id)operand
{
  return self->_operand;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)arguments
{
  return self->_arguments;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v5 = -[NSFunctionExpression selector](self, "selector"), v5 == (const char *)[a3 selector])
    && objc_msgSend( -[NSFunctionExpression operand](self, "operand"),  "isEqual:",  objc_msgSend(a3, "operand")))
  {
    return objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "isEqual:", objc_msgSend(a3, "arguments"));
  }

  else
  {
    return 0;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](NSStringFromSelector(-[NSFunctionExpression selector](self, "selector")), "hash");
  uint64_t v4 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "hash");
  return v4 ^ objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "hash") ^ v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  if (!-[NSFunctionExpression _allowsEvaluation](self, "_allowsEvaluation")) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  *(void *)&v88[1] = 0LL;
  uint64_t v7 = (void *)MEMORY[0x186E1FF60]();
  id v8 = -[NSFunctionExpression arguments](self, "arguments");
  unint64_t v87 = [v8 count];
  uint64_t v9 = -[NSFunctionExpression selector](self, "selector");
  _expressionFlags expressionFlags = self->super._expressionFlags;
  *(void *)v88 = (*(_BYTE *)&expressionFlags & 2) != 0;
  v84 = v9;
  if (v9
    && (*(_BYTE *)&expressionFlags & 4) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  v84,  (uint64_t)-[NSFunctionExpression operand](self, "operand"),  v88,  (uint64_t)@"NSFunctionExpression"))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }

  __int128 v11 = (void *)objc_msgSend( -[NSFunctionExpression operand](self, "operand"),  "expressionValueWithObject:context:",  a3,  a4);
  *(void *)&__int128 v85 = v11;
  if (!v11)
  {
    objc_autoreleasePoolPop(v7);
    return 0LL;
  }

  id v12 = v11;
  BOOL isClass = object_isClass((id)v85);
  if (isClass)
  {
    Name = class_getName((Class)v85);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      objc_opt_self();
      __int128 v15 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v90 = 138543362;
        v91 = (NSString *)v85;
        _os_log_fault_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSFunctionExpression on a Class '%{public}@' is deprecated and will be removed in a future release.  NSFunctionExpression should operate on instances.",  (uint8_t *)&v90,  0xCu);
      }

      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        -[NSFunctionExpression operand](self, "operand");
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }

  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (objc_class *)v85,  (uint64_t)@"NSFunctionExpression")) {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  if (v87 >> 60)
  {
    CFStringRef v75 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v87);
    v76 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v75 userInfo:0];
    CFRelease(v75);
    objc_exception_throw(v76);
LABEL_151:
    __break(1u);
    return result;
  }

  v80[1] = v80;
  if (v87 <= 1) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = v87;
  }
  MEMORY[0x1895F8858](v16);
  __int128 v18 = (char *)v80 - v17;
  if (v19 >= 0x101)
  {
    __int128 v18 = (char *)_CFCreateArrayStorage();
    v83 = v18;
  }

  else
  {
    v83 = 0LL;
  }

  LODWORD(v81) = isClass;
  v86 = v18;
  v82 = v7;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  uint64_t v21 = [v8 countByEnumeratingWithState:&v95 objects:v94 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v96;
    objc_super v23 = v86;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v96 != v22) {
          objc_enumerationMutation(v8);
        }
        __int128 v25 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * i) expressionValueWithObject:a3 context:a4];
        id v26 = v25;
        *v23++ = v25;
      }

      uint64_t v21 = [v8 countByEnumeratingWithState:&v95 objects:v94 count:16];
    }

    while (v21);
  }

  if (v88[0]
    && v87
    && (*(_BYTE *)&self->super._expressionFlags & 8) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (void *)*v86,  (uint64_t)-[NSFunctionExpression operand](self, "operand"),  (uint64_t)@"NSFunctionExpression"))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }

  __int128 v27 = (void *)v85;
  Class = object_getClass((id)v85);
  uint64_t v29 = v82;
  v30 = v84;
  v31 = Class;
  if ((_DWORD)v81) {
    ClassMethod = class_getClassMethod(Class, v84);
  }
  else {
    ClassMethod = class_getInstanceMethod(Class, v84);
  }
  v33 = ClassMethod;
  unint64_t v34 = v87;
  if (ClassMethod)
  {
    if (v34 + 2 != method_getNumberOfArguments(ClassMethod))
    {
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        objc_opt_self();
        v36 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v90) = 0;
          _os_log_fault_impl( &dword_182EB1000,  v36,  OS_LOG_TYPE_FAULT,  "NSPredicate: NSFunctionExpression incorrect number of arguments passed to method",  (uint8_t *)&v90,  2u);
        }

        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }

    if (v34)
    {
      uint64_t v37 = 0LL;
      *(void *)&__int128 v35 = 138412546LL;
      __int128 v81 = v35;
      unsigned int v38 = 1;
      while (1)
      {
        BYTE4(v89) = 0;
        LODWORD(v89) = 0;
        method_getArgumentType(v33, v38 + 1, (char *)&v89, 4uLL);
        BOOL v39 = ((char)v89 - 78) > 0x24 || ((1LL << (v89 - 78)) & 0x1300000113LL) == 0;
        int v40 = v39 ? v89 : BYTE1(v89);
        if (v40 == 35) {
          break;
        }
        if (v40 != 64)
        {
          objc_opt_self();
          v41 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            v45 = (NSString *)@"<unknown>";
            if (v84) {
              v45 = NSStringFromSelector(v84);
            }
            int v90 = v81;
            v91 = v45;
            __int16 v92 = 2080;
            v93 = &v89;
            _os_log_fault_impl( &dword_182EB1000,  v41,  OS_LOG_TYPE_FAULT,  "NSPredicate: Using NSFunctionExpression with selector '%@' and parameter encoding '%s' is forbidden",  (uint8_t *)&v90,  0x16u);
          }

- (id)binaryOperatorForSelector
{
  v2 = -[NSFunctionExpression selector](self, "selector");
  if (v2 == sel_add_to_) {
    return @"+";
  }
  if (v2 == sel_from_subtract_) {
    return @"-";
  }
  if (v2 == sel_multiply_by_) {
    return @"*";
  }
  if (v2 == sel_divide_by_) {
    return @"/";
  }
  if (v2 == sel_raise_toPower_) {
    return @"e";
  }
  if (v2 == sel_objectFrom_withIndex_) {
    return @"[";
  }
  if (v2 == sel_bitwiseAnd_with_) {
    return @"&";
  }
  if (v2 == sel_bitwiseOr_with_) {
    return @"|";
  }
  if (v2 == sel_bitwiseXor_with_) {
    return @"^";
  }
  if (v2 == sel_leftshift_by_) {
    return @"<<";
  }
  if (v2 == sel_rightshift_by_) {
    return @">>";
  }
  return 0LL;
}

- (id)predicateFormat
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v3 = -[NSFunctionExpression binaryOperatorForSelector](self, "binaryOperatorForSelector");
  uint64_t v4 = -[NSFunctionExpression selector](self, "selector");
  if (v3)
  {
    id v5 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
    uint64_t v6 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 1);
    int v7 = [v5 _shouldUseParensWithDescription];
    int v8 = [v6 _shouldUseParensWithDescription];
    BOOL v9 = v7 == 0;
    if (v7) {
      uint64_t v10 = CFSTR("(");
    }
    else {
      uint64_t v10 = &stru_189CA6A28;
    }
    if (v9) {
      __int128 v11 = &stru_189CA6A28;
    }
    else {
      __int128 v11 = @"");
    }
    if (v8) {
      id v12 = CFSTR("(");
    }
    else {
      id v12 = &stru_189CA6A28;
    }
    if (v8) {
      uint64_t v13 = @"");
    }
    else {
      uint64_t v13 = &stru_189CA6A28;
    }
    unsigned int v14 = [v3 characterAtIndex:0] << 24;
    if (v14 == 1526726656)
    {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@[%@]",  v10,  v5,  v11,  v6,  v49,  v50,  v51);
    }

    else if (v14 == 1694498816)
    {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ ** %@%@%@",  v10,  v5,  v11,  v12,  v6,  v13,  v51);
    }

    else
    {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ %@ %@%@%@",  v10,  v5,  v11,  v3,  v12,  v6,  v13);
    }
  }

  else
  {
    uint64_t v16 = v4;
    if (v4 == sel_onesComplement_)
    {
      __int128 v27 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
      int v28 = [v27 _shouldUseParensWithDescription];
      uint64_t v29 = &stru_189CA6A28;
      v30 = CFSTR("(");
      if (v28) {
        uint64_t v29 = @"");
      }
      else {
        v30 = &stru_189CA6A28;
      }
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~%@%@",  v30,  v27,  v29,  v48,  v49,  v50,  v51);
    }

    else
    {
      id v17 = -[NSFunctionExpression operand](self, "operand");
      if (!v17
        || (__int128 v18 = v17, (objc_opt_isKindOfClass() & 1) != 0)
        && _NSPredicateUtilities == (__objc2_class *)[v18 constantValue])
      {
        if (v16 == sel_castObject_toType_)
        {
          id v26 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"CAST(");
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          id v40 = -[NSFunctionExpression arguments](self, "arguments");
          uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v57 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = 0LL;
            uint64_t v44 = *(void *)v59;
            do
            {
              for (uint64_t i = 0LL; i != v42; ++i)
              {
                if (*(void *)v59 != v44) {
                  objc_enumerationMutation(v40);
                }
                v46 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                if (-v43 != i) {
                  -[NSMutableString appendString:](v26, "appendString:", @", ");
                }
                -[NSMutableString appendString:](v26, "appendString:", [v46 predicateFormat]);
              }

              v43 += v42;
              uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v57 count:16];
            }

            while (v42);
          }
        }

        else
        {
          v31 = NSStringFromSelector(v16);
          if (+[_NSPredicateUtilities _isReservedWordInParser:]( &OBJC_CLASS____NSPredicateUtilities,  "_isReservedWordInParser:",  v31))
          {
            v32 = @"#";
          }

          else
          {
            v32 = &stru_189CA6A28;
          }

          id v26 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v32);
          -[NSMutableString appendString:](v26, "appendString:", v31);
          -[NSMutableString appendString:](v26, "appendString:", @"(");
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          id v33 = -[NSFunctionExpression arguments](self, "arguments");
          uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v62 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = 0LL;
            uint64_t v37 = *(void *)v64;
            do
            {
              for (uint64_t j = 0LL; j != v35; ++j)
              {
                if (*(void *)v64 != v37) {
                  objc_enumerationMutation(v33);
                }
                BOOL v39 = *(void **)(*((void *)&v63 + 1) + 8 * j);
                if (-v36 != j) {
                  -[NSMutableString appendString:](v26, "appendString:", @", ");
                }
                -[NSMutableString appendString:](v26, "appendString:", [v39 predicateFormat]);
              }

              v36 += v35;
              uint64_t v35 = [v33 countByEnumeratingWithState:&v63 objects:v62 count:16];
            }

            while (v35);
          }
        }

        -[NSMutableString appendString:](v26, "appendString:", @""));
      }

      else
      {
        if (!objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "count")) {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FUNCTION(%@, %@)",  v18,  NSStringFromSelector(v16),  v47,  v48,  v49,  v50,  v51);
        }
        unint64_t v19 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        id v20 = -[NSFunctionExpression arguments](self, "arguments");
        uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v52 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v54;
          do
          {
            for (uint64_t k = 0LL; k != v22; ++k)
            {
              if (*(void *)v54 != v23) {
                objc_enumerationMutation(v20);
              }
              __int128 v25 = *(void **)(*((void *)&v53 + 1) + 8 * k);
              -[NSString appendString:](v19, "appendString:", @", ");
              -[NSString appendString:](v19, "appendString:", [v25 predicateFormat]);
            }

            uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v52 count:16];
          }

          while (v22);
        }

        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FUNCTION(%@, %@ %@)",  v18,  NSStringFromSelector(v16),  v19);
      }

      return v26;
    }
  }

- (BOOL)_shouldUseParensWithDescription
{
  unsigned int v2 = objc_msgSend( -[NSFunctionExpression binaryOperatorForSelector](self, "binaryOperatorForSelector"),  "characterAtIndex:",  0) << 24;
  if (v2) {
    BOOL v3 = v2 == 1526726656;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0) {
      [a3 visitPredicateExpression:self];
    }
    objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "acceptVisitor:flags:", a3, a4);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = -[NSFunctionExpression arguments](self, "arguments");
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) acceptVisitor:a3 flags:a4];
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v9);
    }

    if ((a4 & 4) == 0) {
      [a3 visitPredicateExpression:self];
    }
  }

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  uint64_t v5 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "_expressionWithSubstitutionVariables:", a3);
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v7 = -[NSFunctionExpression arguments](self, "arguments");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( v6,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "_expressionWithSubstitutionVariables:", a3));
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v9);
  }

  id v12 = (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithExpressionType:operand:selector:argumentArray:",  -[NSFunctionExpression expressionType](self, "expressionType"),  v5,  -[NSFunctionExpression selector](self, "selector"),  v6);

  return v12;
}

@end