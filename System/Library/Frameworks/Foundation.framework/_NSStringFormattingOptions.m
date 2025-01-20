@interface _NSStringFormattingOptions
- (BOOL)isEqual:(id)a3;
- (NSNumber)pluralizationNumber;
- (_NSStringFormattingOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setPluralizationNumber:(id)a3;
@end

@implementation _NSStringFormattingOptions

- (_NSStringFormattingOptions)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSStringFormattingOptions;
  result = -[_NSStringFormattingOptions init](&v3, sel_init);
  if (result) {
    result->_pluralizationNumber = 0LL;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSStringFormattingOptions;
  -[_NSStringFormattingOptions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS____NSStringFormattingOptions);
  -[_NSStringFormattingOptions setPluralizationNumber:]( v4,  "setPluralizationNumber:",  -[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"));
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return -[NSNumber hash](-[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"), "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber");
    if (v5 == (NSNumber *)[a3 pluralizationNumber])
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      uint64_t v6 = [a3 pluralizationNumber];
      if (v6) {
        LOBYTE(v6) = -[NSNumber isEqualToNumber:]( -[_NSStringFormattingOptions pluralizationNumber](self, "pluralizationNumber"),  "isEqualToNumber:",  [a3 pluralizationNumber]);
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSNumber)pluralizationNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPluralizationNumber:(id)a3
{
}

@end