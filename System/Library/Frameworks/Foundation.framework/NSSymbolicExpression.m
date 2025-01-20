@interface NSSymbolicExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSymbolicExpression)initWithCoder:(id)a3;
- (NSSymbolicExpression)initWithString:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSymbolicExpression

- (NSSymbolicExpression)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSymbolicExpression;
  v4 = -[NSExpression initWithExpressionType:](&v7, sel_initWithExpressionType_, 11LL);
  if (!a3 || (v5 = v4, (_NSIsNSString() & 1) == 0)) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't create a symbolic expression with a nil token" userInfo:0]);
  }
  v5->_token = (NSString *)a3;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 11LL;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSymbolicExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeObject:self->_token forKey:@"NSToken"];
}

- (NSSymbolicExpression)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSymbolicExpression;
  result = -[NSExpression initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (result) {
    return -[NSSymbolicExpression initWithString:]( result,  "initWithString:",  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSToken"]);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithString:self->_token];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSymbolicExpression;
  -[NSSymbolicExpression dealloc](&v3, sel_dealloc);
}

- (id)predicateFormat
{
  return self->_token;
}

- (id)constantValue
{
  return self->_token;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && -[NSString isEqual:](self->_token, "isEqual:", *((void *)a3 + 3));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_token, "hash");
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
    -[NSTask terminationHandler](v6, v7);
  }

  return self;
}

@end