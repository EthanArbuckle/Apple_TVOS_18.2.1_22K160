@interface NSEqualityPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegation;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSEqualityPredicateOperator)initWithCoder:(id)a3;
- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5;
- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5 options:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateFormat;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNegation:(BOOL)a3;
@end

@implementation NSEqualityPredicateOperator

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSEqualityPredicateOperator;
  result = -[NSPredicateOperator initWithOperatorType:modifier:](&v7, sel_initWithOperatorType_modifier_, a3, a4);
  if (result) {
    result->_negate = a5;
  }
  return result;
}

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5 options:(unint64_t)a6
{
  result = -[NSEqualityPredicateOperator initWithOperatorType:modifier:negate:]( self,  "initWithOperatorType:modifier:negate:",  a3,  a4,  a5);
  if (result) {
    result->_options = a6;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSEqualityPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeBool:self->_negate forKey:@"NSNegate"];
  [a3 encodeInteger:self->_options forKey:@"NSOptions"];
}

- (NSEqualityPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSEqualityPredicateOperator;
  objc_super v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_negate = [a3 decodeBoolForKey:@"NSNegate"];
    v5->_options = [a3 decodeIntegerForKey:@"NSOptions"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithOperatorType:modifier:negate:options:",  -[NSPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  self->_negate,  self->_options);
}

- (id)predicateFormat
{
  id v3 = -[NSPredicateOperator symbol](self, "symbol");
  if (self->_options) {
    id v4 = (id)[v3 mutableCopy];
  }
  else {
    id v4 = v3;
  }
  objc_super v5 = v4;
  if (self->_options)
  {
    [v4 appendString:@"["];
    unint64_t options = self->_options;
    if ((options & 1) != 0)
    {
      [v5 appendString:@"c"];
      unint64_t options = self->_options;
      if ((options & 2) == 0)
      {
LABEL_7:
        if ((options & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }

    else if ((options & 2) == 0)
    {
      goto LABEL_7;
    }

    [v5 appendString:@"d"];
    unint64_t options = self->_options;
    if ((options & 8) == 0)
    {
LABEL_8:
      if ((options & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }

- (BOOL)isNegation
{
  return self->_negate;
}

- (void)setNegation:(BOOL)a3
{
  self->_negate = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
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
  int v7 = -[NSEqualityPredicateOperator isNegation](self, "isNegation");
  unint64_t v9 = -[NSEqualityPredicateOperator options](self, "options");
  return v9 == [a3 options];
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  if (!a3 || !a4) {
    return self->_negate;
  }
  unint64_t options = self->_options;
  if ((options & 4) != 0)
  {
    CFStringCompareFlags v10 = 2LL;
  }

  else
  {
    unint64_t v9 = self->_options & 1 | (((self->_options >> 1) & 1) << 7);
    if (v9) {
      CFStringCompareFlags v10 = v9 | 0x100;
    }
    else {
      CFStringCompareFlags v10 = 0LL;
    }
  }

  if ((options & 8) != 0) {
    v11 = +[_NSPredicateOperatorUtilities retainedLocale](&OBJC_CLASS____NSPredicateOperatorUtilities, "retainedLocale");
  }
  else {
    v11 = 0LL;
  }
  v13.length = [a3 length];
  v13.location = 0LL;
  BOOL v12 = CFStringCompareWithOptionsAndLocale((CFStringRef)a3, (CFStringRef)a4, v13, v10, v11) != kCFCompareEqualTo;

  return v12 ^ !self->_negate;
}

@end