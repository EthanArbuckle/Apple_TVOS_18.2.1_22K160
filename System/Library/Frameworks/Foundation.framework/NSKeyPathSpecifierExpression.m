@interface NSKeyPathSpecifierExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSKeyPathSpecifierExpression)initWithCoder:(id)a3;
- (NSKeyPathSpecifierExpression)initWithObject:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)keyPath;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSKeyPathSpecifierExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyPathSpecifierExpression;
  -[NSKeyPathSpecifierExpression dealloc](&v3, sel_dealloc);
}

- (NSKeyPathSpecifierExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSKeyPathSpecifierExpression;
  uint64_t v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 10LL);
  v4->_value = (NSString *)a3;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 10LL;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSKeyPathSpecifierExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  [a3 encodeObject:self->_value forKey:@"NSKeyPath"];
}

- (NSKeyPathSpecifierExpression)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyPathSpecifierExpression;
  objc_super v5 = -[NSExpression initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5) {
    v5->_value = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSKeyPath"];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithObject:self->_value];
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if ((a4 & 1) != 0) {
    [a3 visitPredicateExpression:self];
  }
  if ((v4 & 0x10) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_super v7 = (void *)MEMORY[0x186E1FF60]();
    uint64_t v8 = (void *)objc_msgSend( -[NSKeyPathSpecifierExpression keyPath](self, "keyPath"),  "componentsSeparatedByString:",  @".");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      v12 = &stru_189CA6A28;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [a3 visitPredicateExpression:self keyPathScope:v12 key:v14];
          if (-[__CFString length](v12, "length")) {
            v12 = (__CFString *)-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", @".");
          }
          v12 = (__CFString *)-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v14);
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }

      while (v10);
    }

    objc_autoreleasePoolPop(v7);
  }

- (id)predicateFormat
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_super v3 = -[NSString componentsSeparatedByString:](self->_value, "componentsSeparatedByString:", @".");
  char v4 = +[NSMutableString stringWithCapacity:]( &OBJC_CLASS___NSMutableString,  "stringWithCapacity:",  -[NSString length](self->_value, "length"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if ((v7 & 1) != 0) {
          -[NSMutableString appendString:](v4, "appendString:", @".");
        }
        if (+[_NSPredicateUtilities _isReservedWordInParser:]( &OBJC_CLASS____NSPredicateUtilities,  "_isReservedWordInParser:",  v10))
        {
          -[NSMutableString appendString:](v4, "appendString:", @"#");
        }

        -[NSMutableString appendString:](v4, "appendString:", v10);
        ++v9;
        char v7 = 1;
      }

      while (v6 != v9);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    }

    while (v6);
  }

  return v4;
}

- (id)constantValue
{
  return self->_value;
}

- (id)keyPath
{
  return self->_value;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4)) {
    return self->_value;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"This expression has evaluation disabled" userInfo:0]);
  return (id)-[NSKeyPathSpecifierExpression isEqual:](v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return objc_msgSend( (id)objc_msgSend(a3, "keyPath"),  "isEqual:",  -[NSKeyPathSpecifierExpression keyPath](self, "keyPath"));
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSKeyPathSpecifierExpression keyPath](self, "keyPath"), "hash");
}

@end