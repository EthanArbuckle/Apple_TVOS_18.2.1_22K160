@interface NSInPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSInPredicateOperator)initWithCoder:(id)a3;
- (NSInPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringVersion;
- (id)symbol;
- (unint64_t)flags;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInPredicateOperator

- (NSInPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSInPredicateOperator;
  v6 = -[NSPredicateOperator initWithOperatorType:modifier:](&v9, sel_initWithOperatorType_modifier_, a3, a4);
  v7 = v6;
  if (v6) {
    -[NSInPredicateOperator _setOptions:](v6, "_setOptions:", a5);
  }
  return v7;
}

- (id)stringVersion
{
  p_stringVersion = &self->_stringVersion;
  if (!self->_stringVersion)
  {
    v3 = -[NSSubstringPredicateOperator initWithOperatorType:modifier:variant:position:]( objc_alloc(&OBJC_CLASS___NSSubstringPredicateOperator),  "initWithOperatorType:modifier:variant:position:",  -[NSPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  self->_flags,  2LL);
    while (!__ldaxr((unint64_t *)p_stringVersion))
    {
    }

    __clrex();
  }

  return *p_stringVersion;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  self->_stringVersion = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSInPredicateOperator;
  -[NSInPredicateOperator dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSInPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_flags forKey:@"NSFlags"];
}

- (NSInPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSInPredicateOperator;
  uint64_t v4 = -[NSPredicateOperator initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_flags = [a3 decodeIntegerForKey:@"NSFlags"];
  }
  return v4;
}

- (id)symbol
{
  unint64_t v3 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v3 == 10)
  {
    uint64_t v4 = @"IN";
LABEL_5:
    id v5 = (id)-[__CFString mutableCopy](v4, "mutableCopy");
    objc_super v6 = v5;
    if (!self->_flags) {
      return v6;
    }
    [v5 appendString:@"["];
    unint64_t flags = self->_flags;
    if ((flags & 1) != 0)
    {
      [v6 appendString:@"c"];
      unint64_t flags = self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_8:
        if ((flags & 8) == 0) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }

    else if ((flags & 2) == 0)
    {
      goto LABEL_8;
    }

    [v6 appendString:@"d"];
    unint64_t flags = self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }

- (unint64_t)flags
{
  return self->_flags;
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
  if (v6 != [a3 modifier]) {
    return 0;
  }
  unint64_t v7 = -[NSInPredicateOperator flags](self, "flags");
  return v7 == [a3 flags];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_opt_class(),  "_newOperatorWithType:modifier:options:",  -[NSPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  self->_flags);
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v7 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v7 == 10)
  {
    id v8 = a4;
    a4 = a3;
  }

  else
  {
    id v8 = a3;
    if (v7 != 99)
    {
      objc_super v9 = (void *)MEMORY[0x189603F70];
      id v8 = (id)*MEMORY[0x189603A58];
      SEL v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"In operator with invalid type %lu",  v7);
      v11 = v9;
      id i = v8;
      goto LABEL_20;
    }
  }

  BOOL result = 0;
  if (v8 && a4)
  {
    if (v8 == (id)[MEMORY[0x189603FE8] null])
    {
      return 0;
    }

    else if (_NSIsNSString())
    {
      if ((_NSIsNSString() & 1) == 0)
      {
        v14 = (void *)MEMORY[0x189603F70];
        v15 = (void *)*MEMORY[0x189603A60];
        SEL v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't look for value (%@) in string (%@); value is not a string ",
                a4,
                v8);
        v11 = v14;
        for (id i = v15; ; id i = v17)
        {
LABEL_20:
          objc_exception_throw((id)[v11 exceptionWithName:i reason:v10 userInfo:0]);
LABEL_21:
          v16 = (void *)MEMORY[0x189603F70];
          v17 = (void *)*MEMORY[0x189603A60];
          SEL v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use in/contains operator with collection %@ (not a collection)",  v8);
          v11 = v16;
        }
      }

      return objc_msgSend( -[NSInPredicateOperator stringVersion](self, "stringVersion"),  "performPrimitiveOperationUsingObject:andObject:",  v8,  a4);
    }

    else if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    {
      return [v8 containsObject:a4];
    }

    else
    {
      return objc_msgSend((id)objc_msgSend(v8, "allKeysForObject:", a4), "count") != 0;
    }
  }

  return result;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_unint64_t flags = a3 & 0x1F;
}

- (unint64_t)options
{
  return self->_flags;
}

@end