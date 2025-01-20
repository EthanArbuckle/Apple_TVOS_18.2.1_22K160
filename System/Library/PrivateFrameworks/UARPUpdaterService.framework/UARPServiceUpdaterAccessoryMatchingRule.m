@interface UARPServiceUpdaterAccessoryMatchingRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)matchingDictionary;
- (NSString)identifier;
- (NSString)xpcEventStream;
- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterAccessoryMatchingRule)initWithIdentifier:(id)a3 xpcEventStream:(id)a4 matchingDictionary:(id)a5;
- (const)transportDescription;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterAccessoryMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithIdentifier:(id)a3 xpcEventStream:(id)a4 matchingDictionary:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterAccessoryMatchingRule;
  v8 = -[UARPServiceUpdaterAccessoryMatchingRule init](&v10, sel_init);
  if (v8)
  {
    v8->_identifier = (NSString *)[a3 copy];
    v8->_xpcEventStream = (NSString *)[a4 copy];
    v8->_matchingDictionary = (NSDictionary *)[a5 copy];
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterAccessoryMatchingRule;
  -[UARPServiceUpdaterAccessoryMatchingRule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3
{
  v9[4] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"xpcEventStream"];
  v7 = (void *)MEMORY[0x189604010];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  return -[UARPServiceUpdaterAccessoryMatchingRule initWithIdentifier:xpcEventStream:matchingDictionary:]( self,  "initWithIdentifier:xpcEventStream:matchingDictionary:",  v5,  v6,  objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v9, 4)),  @"matchingDictionary"));
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
      if (v5)
      {
        int v5 = -[NSString isEqual:](self->_xpcEventStream, "isEqual:", *((void *)a3 + 2));
        if (v5) {
          LOBYTE(v5) = -[NSDictionary isEqual:](self->_matchingDictionary, "isEqual:", *((void *)a3 + 3));
        }
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (const)transportDescription
{
  return (const char *)&unk_1881FDD2A;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: Identifier=%@, Event Stream=%@>", NSStringFromClass(v4), self->_identifier, self->_xpcEventStream];
}

- (unint64_t)hash
{
  return [(id)objc_msgSend( NSString stringWithFormat:@"%@%@", self->_identifier, self->_xpcEventStream), "hash"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)xpcEventStream
{
  return self->_xpcEventStream;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end