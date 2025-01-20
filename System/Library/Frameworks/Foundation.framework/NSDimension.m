@interface NSDimension
+ (BOOL)supportsRegionalPreference;
+ (BOOL)supportsSecureCoding;
+ (NSDimension)baseUnit;
+ (NSString)icuType;
+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSDimension)initWithCoder:(id)a3;
- (NSDimension)initWithDimension:(id)a3;
- (NSDimension)initWithSpecifier:(unint64_t)a3 symbol:(id)a4 converter:(id)a5;
- (NSDimension)initWithSymbol:(NSString *)symbol converter:(NSUnitConverter *)converter;
- (NSString)icuSubtype;
- (NSUnitConverter)converter;
- (unint64_t)hash;
- (unint64_t)specifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDimension

+ (BOOL)supportsRegionalPreference
{
  return 0;
}

- (NSDimension)initWithSymbol:(NSString *)symbol converter:(NSUnitConverter *)converter
{
  return -[NSDimension initWithSpecifier:symbol:converter:]( self,  "initWithSpecifier:symbol:converter:",  -1LL,  symbol,  converter);
}

- (NSDimension)initWithSpecifier:(unint64_t)a3 symbol:(id)a4 converter:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSDimension;
  v7 = -[NSUnit initWithSymbol:](&v10, sel_initWithSymbol_, a4);
  v8 = v7;
  if (v7)
  {
    v7->_reserved = a3;
    v7->_converter = (NSUnitConverter *)[a5 copy];
  }

  return v8;
}

- (NSDimension)initWithDimension:(id)a3
{
  v4 = -[NSDimension initWithSpecifier:symbol:converter:]( self,  "initWithSpecifier:symbol:converter:",  [a3 specifier],  objc_msgSend(a3, "symbol"),  objc_msgSend(a3, "converter"));
  if (v4) {
    v4->_icuSubtype = (NSString *)objc_msgSend((id)objc_msgSend(a3, "icuSubtype"), "copy");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDimension;
  -[NSUnit dealloc](&v3, sel_dealloc);
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  return a3;
}

+ (NSDimension)baseUnit
{
  Name = sel_getName(a2);
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** You must override %s in your class %s to define its base unit.", Name, _NSNameOfClass(v3)), 0 reason userInfo];
  objc_exception_throw(v4);
  return (NSDimension *)-[NSDimension specifier](v5, v6);
}

- (unint64_t)specifier
{
  return self->_reserved;
}

- (NSUnitConverter)converter
{
  return self->_converter;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSDimension;
  unsigned int v5 = -[NSUnit isEqual:](&v7, sel_isEqual_);
  if (v5) {
    LOBYTE(v5) = objc_msgSend( (id)objc_msgSend(a3, "converter"),  "isEqual:",  -[NSDimension converter](self, "converter"));
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDimension;
  unint64_t v3 = -[NSUnit hash](&v5, sel_hash);
  return -[NSUnitConverter hash](-[NSDimension converter](self, "converter"), "hash") ^ v3;
}

- (NSDimension)initWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDimension cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSDimension;
  objc_super v5 = -[NSUnit initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (v5)
  {
    uint64_t v6 = [a3 decodeIntegerForKey:@"NS.specifier"];
    objc_super v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.converter"];
    if (v7)
    {
      v5->_reserved = v6;
      v5->_converter = (NSUnitConverter *)[v7 copy];
    }

    else
    {

      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4865,  0));
      return 0LL;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDimension;
  -[NSUnit encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDimension encoder does not allow non-keyed coding!" userInfo:0]);
  }
  [a3 encodeInteger:self->_reserved forKey:@"NS.specifier"];
  [a3 encodeObject:self->_converter forKey:@"NS.converter"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)icuType
{
  return 0LL;
}

- (NSString)icuSubtype
{
  return self->_icuSubtype;
}

@end