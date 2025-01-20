@interface UARPAccessoryHardwareUSB
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryHardwareUSB)init;
- (UARPAccessoryHardwareUSB)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4;
- (id)description;
- (unsigned)productID;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHardwareUSB

- (UARPAccessoryHardwareUSB)init
{
  return 0LL;
}

- (UARPAccessoryHardwareUSB)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPAccessoryHardwareUSB;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v7, sel_initWithTransport_, 2LL);
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareUSB *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      BOOL v9 = 1;
    }

    else
    {
      v5 = v4;
      int64_t v6 = -[UARPAccessoryHardwareID transport](self, "transport");
      if (v6 == -[UARPAccessoryHardwareID transport](v5, "transport")
        && (int vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareUSB vendorID](v5, "vendorID")))
      {
        int productID = self->_productID;
        BOOL v9 = productID == -[UARPAccessoryHardwareUSB productID](v5, "productID");
      }

      else
      {
        BOOL v9 = 0;
      }
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"USB, VendorID = 0x%04x, ProductID = 0x%04x",  self->_vendorID,  self->_productID);
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

@end