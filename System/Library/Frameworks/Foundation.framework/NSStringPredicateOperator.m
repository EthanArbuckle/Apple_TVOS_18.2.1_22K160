@interface NSStringPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSStringPredicateOperator)initWithCoder:(id)a3;
- (NSStringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5;
- (id)_modifierString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)flags;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSStringPredicateOperator

- (NSStringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSStringPredicateOperator;
  v6 = -[NSPredicateOperator initWithOperatorType:modifier:](&v9, sel_initWithOperatorType_modifier_, a3, a4);
  v7 = v6;
  if (v6) {
    -[NSStringPredicateOperator _setOptions:](v6, "_setOptions:", a5);
  }
  return v7;
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
  v5.super_class = (Class)&OBJC_CLASS___NSStringPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeInteger:self->_flags forKey:@"NSFlags"];
}

- (NSStringPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSStringPredicateOperator;
  objc_super v5 = -[NSPredicateOperator initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5) {
    v5->_flags = [a3 decodeIntegerForKey:@"NSFlags"];
  }
  return v5;
}

- (id)_modifierString
{
  if (!self->_flags) {
    return &stru_189CA6A28;
  }
  v3 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"[");
  v4 = v3;
  unint64_t flags = self->_flags;
  if ((flags & 1) != 0)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"c");
    unint64_t flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_4:
      if ((flags & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }

  else if ((flags & 2) == 0)
  {
    goto LABEL_4;
  }

  -[NSMutableString appendString:](v4, "appendString:", @"d");
  unint64_t flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
LABEL_14:
    -[NSMutableString appendString:](v4, "appendString:", @"n");
    if ((self->_flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
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
  unint64_t v7 = -[NSStringPredicateOperator flags](self, "flags");
  return v7 == [a3 flags];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_opt_class(),  "_newOperatorWithType:modifier:options:",  -[NSPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  self->_flags);
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