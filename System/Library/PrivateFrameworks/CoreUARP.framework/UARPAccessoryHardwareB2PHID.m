@interface UARPAccessoryHardwareB2PHID
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryHardwareB2PHID)init;
- (UARPAccessoryHardwareB2PHID)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4;
- (id)description;
- (unsigned)productID;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHardwareB2PHID

- (UARPAccessoryHardwareB2PHID)init
{
  return 0LL;
}

- (UARPAccessoryHardwareB2PHID)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPAccessoryHardwareB2PHID;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v7, sel_initWithTransport_, 9LL);
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareB2PHID *)a3;
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
        && (int vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareB2PHID vendorID](v5, "vendorID")))
      {
        int productID = self->_productID;
        BOOL v9 = productID == -[UARPAccessoryHardwareB2PHID productID](v5, "productID");
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
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"B2PHID, VendorID = 0x%04x, ProductID = 0x%04x",  self->_vendorID,  self->_productID);
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