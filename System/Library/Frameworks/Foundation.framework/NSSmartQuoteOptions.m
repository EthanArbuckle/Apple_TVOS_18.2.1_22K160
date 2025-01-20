@interface NSSmartQuoteOptions
+ (BOOL)supportsSecureCoding;
+ (id)smartQuoteOptionsForLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSmartQuoteOptions)initWithCoder:(id)a3;
- (NSSmartQuoteOptions)initWithLeftSingleQuote:(id)a3 rightSingleQuote:(id)a4 apostrophe:(id)a5 leftDoubleQuote:(id)a6 rightDoubleQuote:(id)a7;
- (NSString)apostrophe;
- (NSString)leftDoubleQuote;
- (NSString)leftSingleQuote;
- (NSString)rightDoubleQuote;
- (NSString)rightSingleQuote;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSmartQuoteOptions

- (NSSmartQuoteOptions)initWithLeftSingleQuote:(id)a3 rightSingleQuote:(id)a4 apostrophe:(id)a5 leftDoubleQuote:(id)a6 rightDoubleQuote:(id)a7
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSSmartQuoteOptions;
  v12 = -[NSSmartQuoteOptions init](&v14, sel_init);
  if (v12)
  {
    v12->_leftSingleQuote = (NSString *)[a3 copy];
    v12->_rightSingleQuote = (NSString *)[a4 copy];
    v12->_apostrophe = (NSString *)[a5 copy];
    v12->_leftDoubleQuote = (NSString *)[a6 copy];
    v12->_rightDoubleQuote = (NSString *)[a7 copy];
  }

  return v12;
}

+ (id)smartQuoteOptionsForLocale:(id)a3
{
  return  -[NSSmartQuoteOptions initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:]( objc_alloc(&OBJC_CLASS___NSSmartQuoteOptions),  "initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:",  @"‘",  @"’",  @"’",  @"“",  @"”");
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSmartQuoteOptions;
  -[NSSmartQuoteOptions dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      BOOL v5 = -[NSString isEqualToString:](self->_leftSingleQuote, "isEqualToString:", [a3 leftSingleQuote]);
      if (v5)
      {
        BOOL v5 = -[NSString isEqualToString:]( self->_rightSingleQuote,  "isEqualToString:",  [a3 rightSingleQuote]);
        if (v5)
        {
          BOOL v5 = -[NSString isEqualToString:](self->_apostrophe, "isEqualToString:", [a3 apostrophe]);
          if (v5)
          {
            BOOL v5 = -[NSString isEqualToString:]( self->_leftDoubleQuote,  "isEqualToString:",  [a3 leftDoubleQuote]);
            if (v5) {
              LOBYTE(v5) = -[NSString isEqualToString:]( self->_rightDoubleQuote,  "isEqualToString:",  [a3 rightDoubleQuote]);
            }
          }
        }
      }
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_leftSingleQuote, "hash");
  NSUInteger v4 = -[NSString hash](self->_rightSingleQuote, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_apostrophe, "hash");
  NSUInteger v6 = v4 ^ v5 ^ -[NSString hash](self->_leftDoubleQuote, "hash");
  return v6 ^ -[NSString hash](self->_rightDoubleQuote, "hash");
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSmartQuoteOptions;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{%@xy%@/x%@y/%@xy%@}",  -[NSSmartQuoteOptions description](&v3, sel_description),  -[NSSmartQuoteOptions leftSingleQuote](self, "leftSingleQuote"),  -[NSSmartQuoteOptions rightSingleQuote](self, "rightSingleQuote"),  -[NSSmartQuoteOptions apostrophe](self, "apostrophe"),  -[NSSmartQuoteOptions leftDoubleQuote](self, "leftDoubleQuote"),  -[NSSmartQuoteOptions rightDoubleQuote](self, "rightDoubleQuote"));
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSmartQuoteOptions leftSingleQuote](self, "leftSingleQuote"),  @"NSLeftSingleQuote");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSmartQuoteOptions rightSingleQuote](self, "rightSingleQuote"),  @"NSRightSingleQuote");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSmartQuoteOptions apostrophe](self, "apostrophe"),  @"NSApostrophe");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSmartQuoteOptions leftDoubleQuote](self, "leftDoubleQuote"),  @"NSLeftDoubleQuote");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSSmartQuoteOptions rightDoubleQuote](self, "rightDoubleQuote"),  @"NSRightDoubleQuote");
  }

  else
  {
    NSUInteger v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v5);
    -[NSSmartQuoteOptions initWithCoder:](v6, v7, v8);
  }

- (NSSmartQuoteOptions)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLeftSingleQuote"];
    if ((_NSIsNSString() & 1) != 0)
    {
      uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRightSingleQuote"];
      if ((_NSIsNSString() & 1) != 0)
      {
        uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSApostrophe"];
        if ((_NSIsNSString() & 1) != 0)
        {
          uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLeftDoubleQuote"];
          if ((_NSIsNSString() & 1) != 0)
          {
            uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRightDoubleQuote"];
            if ((_NSIsNSString() & 1) != 0) {
              return -[NSSmartQuoteOptions initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:]( self,  "initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:",  v5,  v6,  v7,  v8,  v9);
            }

            v11 = @"Smart quote right double quote is not a string";
          }

          else
          {

            v11 = @"Smart quote left double quote is not a string";
          }
        }

        else
        {

          v11 = @"Smart quote apostrophe is not a string";
        }
      }

      else
      {

        v11 = @"Smart quote right single quote is not a string";
      }
    }

    else
    {

      v11 = @"Smart quote left single quote is not a string";
    }

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v11));
    return 0LL;
  }

  else
  {
    v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v12);
    return (NSSmartQuoteOptions *)+[NSSmartQuoteOptions supportsSecureCoding](v13, v14);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)leftSingleQuote
{
  return self->_leftSingleQuote;
}

- (NSString)rightSingleQuote
{
  return self->_rightSingleQuote;
}

- (NSString)apostrophe
{
  return self->_apostrophe;
}

- (NSString)leftDoubleQuote
{
  return self->_leftDoubleQuote;
}

- (NSString)rightDoubleQuote
{
  return self->_rightDoubleQuote;
}

@end