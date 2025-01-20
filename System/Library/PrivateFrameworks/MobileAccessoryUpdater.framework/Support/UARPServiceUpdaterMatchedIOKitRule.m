@interface UARPServiceUpdaterMatchedIOKitRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (UARPServiceUpdaterMatchedIOKitRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterMatchedIOKitRule)initWithIdentifier:(id)a3 registryEntryID:(unint64_t)a4;
- (id)description;
- (unint64_t)registryEntryID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterMatchedIOKitRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithIdentifier:(id)a3 registryEntryID:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterMatchedIOKitRule;
  v6 = -[UARPServiceUpdaterMatchedIOKitRule init](&v8, "init");
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 copy];
    v6->_registryEntryID = a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterMatchedIOKitRule;
  -[UARPServiceUpdaterMatchedIOKitRule dealloc](&v3, "dealloc");
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"identifier"];
  return -[UARPServiceUpdaterMatchedIOKitRule initWithIdentifier:registryEntryID:]( self,  "initWithIdentifier:registryEntryID:",  v5,  objc_msgSend( objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber),  @"registryEntryID"),  "unsignedLongLongValue"));
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterMatchedIOKitRule);
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
        LOBYTE(v6) = self->_registryEntryID == *((void *)a3 + 2);
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Identifier=%@, Registry Entry ID=0x%llx",  NSStringFromClass(v3),  self->_identifier,  self->_registryEntryID);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

@end