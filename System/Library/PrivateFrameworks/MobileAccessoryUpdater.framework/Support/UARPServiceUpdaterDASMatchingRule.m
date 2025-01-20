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
  v6 = -[UARPServiceUpdaterDASMatchingRule init](&v8, "init");
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
  -[UARPServiceUpdaterDASMatchingRule dealloc](&v3, "dealloc");
}

- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"identifier"];
  v7[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v7[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v7[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v7[3] = objc_opt_class(&OBJC_CLASS___NSData);
  return -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:]( self,  "initWithIdentifier:matchingDictionary:",  v5,  objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithArray:]( NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 4)),  @"matchingDictionary"));
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterDASMatchingRule);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      unsigned int v6 = -[NSString isEqual:](self->_identifier, "isEqual:", *((void *)a3 + 1));
      if (v6) {
        LOBYTE(v6) = -[NSDictionary isEqual:]( self->_matchingDictionary,  "isEqual:",  *((void *)a3 + 2));
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Identifier=%@, matchingDictionary=%@>",  NSStringFromClass(v3),  self->_identifier,  self->_matchingDictionary);
}

- (unint64_t)hash
{
  return -[NSString hash]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", self->_identifier),  "hash");
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