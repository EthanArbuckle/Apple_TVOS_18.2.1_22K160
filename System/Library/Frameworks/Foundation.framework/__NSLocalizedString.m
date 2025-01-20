@interface __NSLocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDirectEncoding;
- (BOOL)isEqualToString:(id)a3;
- (Class)classForCoder;
- (__NSLocalizedString)initWithCoder:(id)a3;
- (__NSLocalizedString)initWithString:(id)a3 withFormatConfiguration:(id)a4;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (id)baseString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatConfiguration;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)substringFromIndex:(unint64_t)a3;
- (id)substringToIndex:(unint64_t)a3;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setString:(id)a3;
@end

@implementation __NSLocalizedString

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (__NSLocalizedString)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"__NSLocalizedString cannot be decoded by non-keyed archivers!" userInfo:0]);
  }

  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.originalString"];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0),  @"NS.configDict");
    if (v13 || ![a3 containsValueForKey:@"NS.configDict"]) {
      return -[__NSLocalizedString initWithString:withFormatConfiguration:]( self,  "initWithString:withFormatConfiguration:",  v6,  v13);
    }

    v18 = @"NSDebugDescription";
    v19 = @"Unable to decode NS.configDict as a plist type despite data being present.";
    uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v15 = 4864LL;
  }

  else
  {
    else {
      uint64_t v17 = 4865LL;
    }

    v20 = @"NSDebugDescription";
    v21[0] = @"Unable to decode NS.originalString.";
    uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v15 = v17;
  }

  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v15,  v14));
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->original forKey:@"NS.originalString"];
    config = self->config;
    if (config) {
      [a3 encodeObject:config forKey:@"NS.configDict"];
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Encoder does not allow keyed coding!" userInfo:0]);
    -[__NSLocalizedString initWithString:withFormatConfiguration:](v6, v7, v8, v9);
  }

- (__NSLocalizedString)initWithString:(id)a3 withFormatConfiguration:(id)a4
{
  self->original = (NSMutableString *)[a3 mutableCopyWithZone:0];
  self->config = (NSDictionary *)[a4 copyWithZone:0];
  return self;
}

- (id)formatConfiguration
{
  return self->config;
}

- (id)baseString
{
  return self->original;
}

- (unint64_t)length
{
  return -[NSString length](self->original, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->original, "characterAtIndex:", a3);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSLocalizedString;
  -[__NSLocalizedString dealloc](&v3, sel_dealloc);
}

- (unint64_t)fastestEncoding
{
  return -[NSString fastestEncoding](self->original, "fastestEncoding");
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (id)substringFromIndex:(unint64_t)a3
{
  return -[NSString substringFromIndex:](self->original, "substringFromIndex:", a3);
}

- (id)substringToIndex:(unint64_t)a3
{
  return -[NSString substringToIndex:](self->original, "substringToIndex:", a3);
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->original, "substringWithRange:", a3.location, a3.length);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:]( self->original,  "compare:options:range:locale:",  a3,  a4,  a5.location,  a5.length,  a6);
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->original, "isEqualToString:", a3);
}

- (const)_fastCharacterContents
{
  return CFStringGetCharactersPtr((CFStringRef)self->original);
}

- (const)_fastCStringContents:(BOOL)a3
{
  return -[NSString _fastCStringContents:](self->original, "_fastCStringContents:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]( objc_alloc(&OBJC_CLASS_____NSLocalizedString),  "initWithString:withFormatConfiguration:",  self->original,  self->config);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]( objc_alloc(&OBJC_CLASS_____NSLocalizedString),  "initWithString:withFormatConfiguration:",  self->original,  self->config);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  config = self->config;
  self->config = 0LL;

  -[NSMutableString replaceCharactersInRange:withString:]( self->original,  "replaceCharactersInRange:withString:",  location,  length,  a4);
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  config = self->config;
  self->config = 0LL;

  -[NSMutableString insertString:atIndex:](self->original, "insertString:atIndex:", a3, a4);
}

- (void)appendString:(id)a3
{
  config = self->config;
  self->config = 0LL;

  -[NSMutableString appendString:](self->original, "appendString:", a3);
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  config = self->config;
  self->config = 0LL;

  -[NSMutableString deleteCharactersInRange:](self->original, "deleteCharactersInRange:", location, length);
}

- (void)appendFormat:(id)a3
{
  config = self->config;
  self->config = 0LL;

  _CFStringAppendFormatAndArgumentsAux2();
}

- (void)setString:(id)a3
{
  config = self->config;
  self->config = 0LL;

  -[NSMutableString setString:](self->original, "setString:", a3);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  config = self->config;
  self->config = 0LL;

  -[NSMutableString replaceCharactersInRange:withCharacters:length:]( self->original,  "replaceCharactersInRange:withCharacters:length:",  -[NSString length](self->original, "length"),  0LL,  a3,  a4);
}

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  config = self->config;
  self->config = 0LL;

  return -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self->original,  "replaceOccurrencesOfString:withString:options:range:",  a3,  a4,  a5,  location,  length);
}

@end