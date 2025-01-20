@interface NSComparisonPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSComparisonPredicateOperator)initWithCoder:(id)a3;
- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5;
- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5 options:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateFormat;
- (unint64_t)options;
- (unint64_t)variant;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSComparisonPredicateOperator

- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSComparisonPredicateOperator;
  result = -[NSPredicateOperator initWithOperatorType:modifier:](&v7, sel_initWithOperatorType_modifier_, a3, a4);
  if (result) {
    result->_variant = a5;
  }
  return result;
}

- (NSComparisonPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5 options:(unint64_t)a6
{
  result = -[NSComparisonPredicateOperator initWithOperatorType:modifier:variant:]( self,  "initWithOperatorType:modifier:variant:",  a3,  a4,  a5);
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
  v5.super_class = (Class)&OBJC_CLASS___NSComparisonPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeInteger:self->_variant forKey:@"NSVariant"];
  [a3 encodeInteger:self->_options forKey:@"NSOptions"];
}

- (NSComparisonPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSComparisonPredicateOperator;
  objc_super v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_variant = [a3 decodeIntegerForKey:@"NSVariant"];
    v5->_options = [a3 decodeIntegerForKey:@"NSOptions"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithOperatorType:modifier:variant:options:",  -[NSPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  self->_variant,  self->_options);
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
        goto LABEL_14;
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
      if ((options & 4) == 0)
      {
LABEL_10:
        [v5 appendString:@"]"];
        return v5;
      }

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)options
{
  return self->_options;
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
  unint64_t v7 = -[NSComparisonPredicateOperator variant](self, "variant");
  if (v7 != [a3 variant]) {
    return 0;
  }
  unint64_t v8 = -[NSComparisonPredicateOperator options](self, "options");
  return v8 == [a3 options];
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    if (self->_options && _NSIsNSString() && _NSIsNSString())
    {
      unint64_t options = self->_options;
      if ((options & 4) != 0)
      {
        CFStringCompareFlags v11 = 2LL;
      }

      else
      {
        unint64_t v10 = self->_options & 1 | (((self->_options >> 1) & 1) << 7);
        if (v10) {
          CFStringCompareFlags v11 = v10 | 0x100;
        }
        else {
          CFStringCompareFlags v11 = 0LL;
        }
      }

      if ((options & 8) != 0) {
        v15 = +[_NSPredicateOperatorUtilities retainedLocale]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "retainedLocale");
      }
      else {
        v15 = 0LL;
      }
      v16.length = [a3 length];
      v16.location = 0LL;
      v12 = (char *)CFStringCompareWithOptionsAndLocale((CFStringRef)a3, (CFStringRef)a4, v16, v11, v15);
    }

    else
    {
      v12 = (char *)objc_msgSend(a3, -[NSPredicateOperator selector](self, "selector"), a4);
    }

    unint64_t variant = self->_variant;
    switch(variant)
    {
      case 2uLL:
        return v12 == (char *)1;
      case 1uLL:
        BOOL v14 = (unint64_t)(v12 + 1) >= 2;
        break;
      case 0uLL:
        return v12 + 1 == 0LL;
      default:
        BOOL v14 = (unint64_t)v12 >= 2;
        break;
    }

    return !v14;
  }

  return result;
}

@end