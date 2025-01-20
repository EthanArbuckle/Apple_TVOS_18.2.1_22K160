@interface UARPServiceUpdaterMatchedEARule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accessorySerialNumber;
- (NSString)eaIdentifier;
- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3;
- (UARPServiceUpdaterMatchedEARule)initWithEAIdentifier:(id)a3 accessorySerialNumber:(id)a4;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterMatchedEARule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedEARule)initWithEAIdentifier:(id)a3 accessorySerialNumber:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterMatchedEARule;
  v6 = -[UARPServiceUpdaterMatchedEARule init](&v8, "init");
  if (v6)
  {
    v6->_eaIdentifier = (NSString *)[a3 copy];
    v6->_accessorySerialNumber = (NSString *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPServiceUpdaterMatchedEARule;
  -[UARPServiceUpdaterMatchedEARule dealloc](&v3, "dealloc");
}

- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"identifier"];
  return -[UARPServiceUpdaterMatchedEARule initWithEAIdentifier:accessorySerialNumber:]( self,  "initWithEAIdentifier:accessorySerialNumber:",  v5,  [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"serialNumber"]);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterMatchedEARule);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      unsigned int v6 = -[NSString isEqual:](self->_eaIdentifier, "isEqual:", *((void *)a3 + 1));
      if (v6) {
        LOBYTE(v6) = -[NSString isEqual:]( self->_accessorySerialNumber,  "isEqual:",  *((void *)a3 + 2));
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
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: EAIdentifier=%@, acessorySerialNumber=%@",  NSStringFromClass(v3),  self->_eaIdentifier,  self->_accessorySerialNumber);
}

- (NSString)eaIdentifier
{
  return self->_eaIdentifier;
}

- (NSString)accessorySerialNumber
{
  return self->_accessorySerialNumber;
}

@end