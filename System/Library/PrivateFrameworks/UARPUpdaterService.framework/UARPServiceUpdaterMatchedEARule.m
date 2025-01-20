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
  v6 = -[UARPServiceUpdaterMatchedEARule init](&v8, sel_init);
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
  -[UARPServiceUpdaterMatchedEARule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  return -[UARPServiceUpdaterMatchedEARule initWithEAIdentifier:accessorySerialNumber:]( self,  "initWithEAIdentifier:accessorySerialNumber:",  v5,  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"]);
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
      int v5 = -[NSString isEqual:](self->_eaIdentifier, "isEqual:", *((void *)a3 + 1));
      if (v5) {
        LOBYTE(v5) = -[NSString isEqual:](self->_accessorySerialNumber, "isEqual:", *((void *)a3 + 2));
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: EAIdentifier=%@, acessorySerialNumber=%@", NSStringFromClass(v4), self->_eaIdentifier, self->_accessorySerialNumber];
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