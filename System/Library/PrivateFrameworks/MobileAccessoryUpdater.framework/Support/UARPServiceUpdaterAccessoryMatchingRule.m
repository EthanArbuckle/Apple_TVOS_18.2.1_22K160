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
  v8 = -[UARPServiceUpdaterAccessoryMatchingRule init](&v10, "init");
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
  -[UARPServiceUpdaterAccessoryMatchingRule dealloc](&v3, "dealloc");
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"identifier"];
  id v6 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"xpcEventStream"];
  v8[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v8[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v8[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v8[3] = objc_opt_class(&OBJC_CLASS___NSData);
  return -[UARPServiceUpdaterAccessoryMatchingRule initWithIdentifier:xpcEventStream:matchingDictionary:]( self,  "initWithIdentifier:xpcEventStream:matchingDictionary:",  v5,  v6,  objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithArray:]( NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4)),  @"matchingDictionary"));
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterAccessoryMatchingRule);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      unsigned int v6 = -[NSString isEqual:](self->_identifier, "isEqual:", *((void *)a3 + 1));
      if (v6)
      {
        unsigned int v6 = -[NSString isEqual:](self->_xpcEventStream, "isEqual:", *((void *)a3 + 2));
        if (v6) {
          LOBYTE(v6) = -[NSDictionary isEqual:]( self->_matchingDictionary,  "isEqual:",  *((void *)a3 + 3));
        }
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (const)transportDescription
{
  return "";
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Identifier=%@, Event Stream=%@>",  NSStringFromClass(v3),  self->_identifier,  self->_xpcEventStream);
}

- (unint64_t)hash
{
  return -[NSString hash]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  self->_identifier,  self->_xpcEventStream),  "hash");
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