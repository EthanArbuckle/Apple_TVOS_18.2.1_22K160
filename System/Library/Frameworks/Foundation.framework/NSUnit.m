@interface NSUnit
+ (BOOL)supportsSecureCoding;
+ (NSUnit)new;
- (BOOL)isEqual:(id)a3;
- (NSString)symbol;
- (NSUnit)init;
- (NSUnit)initWithCoder:(id)a3;
- (NSUnit)initWithSymbol:(NSString *)symbol;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSUnit

- (NSUnit)init
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"-init should never be called on NSUnit!" userInfo:0]);
  return +[NSUnit new](v2, v3);
}

+ (NSUnit)new
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"+new should never be called on NSUnit!" userInfo:0]);
  return -[NSUnit initWithSymbol:](v2, v3, v4);
}

- (NSUnit)initWithSymbol:(NSString *)symbol
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSUnit;
  v4 = -[NSUnit init](&v6, sel_init);
  if (v4) {
    v4->_symbol = (NSString *)-[NSString copy](symbol, "copy");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUnit;
  -[NSUnit dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)[a3 _effectiveUnitClass];
    if (v5 == -[NSUnit _effectiveUnitClass](self, "_effectiveUnitClass")) {
      return objc_msgSend((id)objc_msgSend(a3, "symbol"), "isEqual:", -[NSUnit symbol](self, "symbol"));
    }
  }

  return 0;
}

- (unint64_t)hash
{
  uint64_t v3 = -[objc_class hash](-[NSUnit _effectiveUnitClass](self, "_effectiveUnitClass"), "hash");
  return -[NSString hash](-[NSUnit symbol](self, "symbol"), "hash") ^ v3;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUnit;
  return (id)objc_msgSend( -[NSUnit description](&v3, sel_description),  "stringByAppendingString:",  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" %@", self->_symbol));
}

- (NSUnit)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.symbol"];
    if (v5)
    {
      return -[NSUnit initWithSymbol:](self, "initWithSymbol:", v5);
    }

    else
    {

      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4865,  0));
      return 0LL;
    }
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnit cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSUnit encodeWithCoder:](v7, v8, v9);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_symbol forKey:@"NS.symbol"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnit encoder does not allow non-keyed coding!" userInfo:0]);
    +[NSUnit supportsSecureCoding](v5, v6);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

@end