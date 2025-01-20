@interface NSPredicate
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateWithBlock:(void *)block;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat argumentArray:(NSArray *)arguments;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList;
+ (NSPredicate)predicateWithValue:(BOOL)value;
+ (__CFLocale)retainedLocale;
+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4;
+ (void)initialize;
- (BOOL)_allowsEvaluation;
- (BOOL)evaluateWithObject:(id)object;
- (BOOL)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings;
- (NSPredicate)initWithCoder:(id)a3;
- (NSPredicate)predicateWithSubstitutionVariables:(NSDictionary *)variables;
- (NSString)predicateFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPredicate

- (id)generateMetadataDescription
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown kind of NSPredicate given to NSMetadataQuery (%@)",  self);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v2 userInfo:0]);
  return -[NSCompoundPredicate generateMetadataDescription](v3, v4);
}

+ (void)initialize
{
  if (!_qfqp_GlobalLock)
  {
    _qfqp_GlobalLock = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    _qfqp2_InitializedGlobalData();
  }

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  return +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "newStringFrom:usingUnicodeTransforms:",  a3,  a4);
}

+ (__CFLocale)retainedLocale
{
  return +[_NSPredicateOperatorUtilities retainedLocale](&OBJC_CLASS____NSPredicateOperatorUtilities, "retainedLocale");
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat argumentArray:(NSArray *)arguments
{
  v6 = (void *)MEMORY[0x186E1FF60](a1, a2);
  [(id)_qfqp_GlobalLock lock];
  v7 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, arguments, 0LL);
  [(id)_qfqp_GlobalLock unlock];
  objc_autoreleasePoolPop(v6);
  v8 = v7;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_exception_throw(v7);
      v11 = v10;
      objc_end_catch();
      _Unwind_Resume(v11);
    }
  }

  return v7;
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat
{
  return (NSPredicate *)objc_msgSend(a1, "predicateWithFormat:arguments:", predicateFormat, va, va);
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList
{
  v9[1] = *MEMORY[0x1895F89C0];
  v9[0] = argList;
  v5 = (void *)MEMORY[0x186E1FF60](a1, a2);
  [(id)_qfqp_GlobalLock lock];
  v6 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, 0LL, v9);
  [(id)_qfqp_GlobalLock unlock];
  objc_autoreleasePoolPop(v5);
  v7 = v6;
  if (!v6) {
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v6;
  }
  objc_exception_throw(v6);
  __break(1u);
  return result;
}

+ (NSPredicate)predicateWithValue:(BOOL)value
{
  v3 = &off_189C61E68;
  if (!value) {
    v3 = off_189C61798;
  }
  return (NSPredicate *)objc_alloc_init(*v3);
}

+ (NSPredicate)predicateWithBlock:(void *)block
{
  return (NSPredicate *) -[NSBlockPredicate initWithBlock:]( objc_alloc(&OBJC_CLASS___NSBlockPredicate),  "initWithBlock:",  block);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsEvaluation
{
  return (*(_BYTE *)&self->_predicateFlags & 1) == 0;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_predicateFlags &= ~1u;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
    -[NSPredicate initWithCoder:](v3, v4, v5);
  }

- (NSPredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSPredicate copyWithZone:](v7, v8, v9);
  }

  id v5 = -[NSPredicate init](self, "init");
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)evaluateWithObject:(id)object
{
  return -[NSPredicate evaluateWithObject:substitutionVariables:]( self,  "evaluateWithObject:substitutionVariables:",  object,  0LL);
}

- (BOOL)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings
{
  v6 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  v6 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSPredicate)predicateWithSubstitutionVariables:(NSDictionary *)variables
{
  if (!variables)
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Cannot substitute a nil substitution dictionary.",  0,  v3,  v4));
    return (NSPredicate *)-[NSPredicate description](v5, v6);
  }

  return self;
}

- (NSString)predicateFormat
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end