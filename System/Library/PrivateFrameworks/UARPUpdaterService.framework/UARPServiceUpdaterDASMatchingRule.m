@interface UARPServiceUpdaterDASMatchingRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)matchingDictionary;
- (NSString)identifier;
- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterDASMatchingRule)initWithIdentifier:(id)a3 matchingDictionary:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterDASMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterDASMatchingRule)initWithIdentifier:(id)a3 matchingDictionary:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterDASMatchingRule;
  v6 = -[UARPServiceUpdaterDASMatchingRule init](&v8, sel_init);
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 copy];
    v6->_matchingDictionary = (NSDictionary *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterDASMatchingRule;
  -[UARPServiceUpdaterDASMatchingRule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3
{
  v8[4] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = (void *)MEMORY[0x189604010];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  return -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:]( self,  "initWithIdentifier:matchingDictionary:",  v5,  objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v8, 4)),  @"matchingDictionary"));
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      int v5 = -[NSString isEqual:](self->_identifier, "isEqual:", *((void *)a3 + 1));
      if (v5) {
        LOBYTE(v5) = -[NSDictionary isEqual:](self->_matchingDictionary, "isEqual:", *((void *)a3 + 2));
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: Identifier=%@, matchingDictionary=%@>", NSStringFromClass(v4), self->_identifier, self->_matchingDictionary];
}

- (unint64_t)hash
{
  return [(id)objc_msgSend(NSString stringWithFormat:@"%@", self->_identifier), "hash"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end