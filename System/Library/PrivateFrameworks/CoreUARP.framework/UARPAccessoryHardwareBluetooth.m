@interface UARPAccessoryHardwareBluetooth
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryHardwareBluetooth)init;
- (UARPAccessoryHardwareBluetooth)initWithVendorIDSource:(int64_t)a3 vendorID:(unsigned __int16)a4 productID:(unsigned __int16)a5 productVersion:(unsigned __int16)a6;
- (id)description;
- (int64_t)vendorIDSource;
- (unsigned)productID;
- (unsigned)productVersion;
- (unsigned)vendorID;
@end

@implementation UARPAccessoryHardwareBluetooth

- (UARPAccessoryHardwareBluetooth)init
{
  return 0LL;
}

- (UARPAccessoryHardwareBluetooth)initWithVendorIDSource:(int64_t)a3 vendorID:(unsigned __int16)a4 productID:(unsigned __int16)a5 productVersion:(unsigned __int16)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPAccessoryHardwareBluetooth;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v11, sel_initWithTransport_, 3LL);
  if (result)
  {
    result->_vendorIDSource = a3;
    result->_vendorID = a4;
    result->_productID = a5;
    result->_productVersion = a6;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareBluetooth *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      BOOL v11 = 1;
    }

    else
    {
      v5 = v4;
      int64_t vendorIDSource = self->_vendorIDSource;
      if (vendorIDSource == -[UARPAccessoryHardwareBluetooth vendorIDSource](v5, "vendorIDSource")
        && (int64_t v7 = -[UARPAccessoryHardwareID transport](self, "transport"),
            v7 == -[UARPAccessoryHardwareID transport](v5, "transport"))
        && (int vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareBluetooth vendorID](v5, "vendorID"))
        && (int productID = self->_productID, productID == -[UARPAccessoryHardwareBluetooth productID](v5, "productID")))
      {
        int productVersion = self->_productVersion;
        BOOL v11 = productVersion == -[UARPAccessoryHardwareBluetooth productVersion](v5, "productVersion");
      }

      else
      {
        BOOL v11 = 0;
      }
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"Bluetooth, VendorID = 0x%04x, ProductID = 0x%04x, VendorID Source = %s, Product Version = 0x%04x",  self->_vendorID,  self->_productID,  UARPAccessoryVendorIDSourceToString(self->_vendorIDSource),  self->_productVersion);
}

- (int64_t)vendorIDSource
{
  return self->_vendorIDSource;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)productVersion
{
  return self->_productVersion;
}

@end