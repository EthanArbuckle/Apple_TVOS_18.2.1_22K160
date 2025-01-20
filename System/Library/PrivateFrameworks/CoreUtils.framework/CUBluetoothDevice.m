@interface CUBluetoothDevice
- ($D91DDCA3822F03E96939068EA8DE741A)address;
- (BOOL)isEqual:(id)a3;
- (BOOL)magicPaired;
- (BOOL)present;
- (BOOL)supportsAACPService;
- (CUBluetoothDevice)init;
- (NSString)addressString;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)modelNumber;
- (NSString)name;
- (NSUUID)identifier;
- (id)description;
- (int)colorCode;
- (int)disconnectReason;
- (int)primaryPlacement;
- (int)secondaryPlacement;
- (int)streamState;
- (unint64_t)hash;
- (unsigned)connectedServices;
- (unsigned)deviceFlags;
- (unsigned)deviceType;
- (unsigned)productIdentifier;
- (unsigned)versionID;
- (void)setAddress:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setColorCode:(int)a3;
- (void)setConnectedServices:(unsigned int)a3;
- (void)setDeviceFlags:(unsigned int)a3;
- (void)setDeviceType:(unsigned int)a3;
- (void)setDisconnectReason:(int)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMagicPaired:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setPresent:(BOOL)a3;
- (void)setPrimaryPlacement:(int)a3;
- (void)setProductIdentifier:(unsigned int)a3;
- (void)setSecondaryPlacement:(int)a3;
- (void)setStreamState:(int)a3;
- (void)setSupportsAACPService:(BOOL)a3;
- (void)setVersionID:(unsigned int)a3;
@end

@implementation CUBluetoothDevice

- (CUBluetoothDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUBluetoothDevice;
  v2 = -[CUBluetoothDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_colorCode = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  CFMutableStringRef v47 = 0LL;
  v28 = -[CUBluetoothDevice addressString](self, "addressString");
  NSAppendPrintF(&v47);
  v3 = v47;
  v4 = -[CUBluetoothDevice identifier](self, "identifier", v28);
  if (v4)
  {
    CFMutableStringRef v46 = v3;
    NSAppendPrintF(&v46);
    v5 = v46;

    v3 = v5;
  }

  -[CUBluetoothDevice name](self, "name");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFMutableStringRef v45 = v3;
    NSAppendPrintF(&v45);
    v7 = v45;

    v3 = v7;
  }
  v8 = -[CUBluetoothDevice manufacturer](self, "manufacturer");
  if (v8)
  {
    CFMutableStringRef v44 = v3;
    NSAppendPrintF(&v44);
    v9 = v44;

    v3 = v9;
  }
  v10 = -[CUBluetoothDevice modelNumber](self, "modelNumber");
  if (v10)
  {
    CFMutableStringRef v43 = v3;
    NSAppendPrintF(&v43);
    v11 = v43;

    v3 = v11;
  }

  if (self->_productIdentifier)
  {
    CFMutableStringRef v42 = v3;
    NSAppendPrintF(&v42);
    v12 = v42;

    v3 = v12;
  }

  if (self->_versionID)
  {
    CFMutableStringRef v41 = v3;
    NSAppendPrintF(&v41);
    v13 = v41;

    v3 = v13;
  }

  if (self->_deviceType)
  {
    CFMutableStringRef v40 = v3;
    NSAppendPrintF(&v40);
    v14 = v40;

    v3 = v14;
  }

  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
  {
    CFMutableStringRef v39 = v3;
    v29 = firmwareVersion;
    NSAppendPrintF(&v39);
    v16 = v39;

    v3 = v16;
  }

  if (self->_connectedServices)
  {
    CFMutableStringRef v38 = v3;
    NSAppendPrintF(&v38);
    v17 = v38;

    v3 = v17;
  }

  if (self->_primaryPlacement)
  {
    CFMutableStringRef v37 = v3;
    NSAppendPrintF(&v37);
    v18 = v37;

    v3 = v18;
  }

  if (self->_secondaryPlacement)
  {
    CFMutableStringRef v36 = v3;
    NSAppendPrintF(&v36);
    v19 = v36;

    v3 = v19;
  }

  if (self->_streamState)
  {
    CFMutableStringRef v35 = v3;
    NSAppendPrintF(&v35);
    v20 = v35;

    v3 = v20;
  }

  if (self->_magicPaired)
  {
    CFMutableStringRef v34 = v3;
    NSAppendPrintF(&v34);
    v21 = v34;

    v3 = v21;
  }

  if (self->_supportsAACPService)
  {
    CFMutableStringRef v33 = v3;
    NSAppendPrintF(&v33);
    v22 = v33;

    v3 = v22;
  }

  int colorCode = self->_colorCode;
  if (colorCode != -1)
  {
    CFMutableStringRef v32 = v3;
    NSAppendPrintF(&v32);
    v24 = v32;

    v3 = v24;
  }

  if (self->_deviceFlags)
  {
    CFMutableStringRef v31 = v3;
    NSAppendPrintF(&v31);
    v25 = v31;

    v3 = v25;
  }

  if (self->_disconnectReason)
  {
    CFMutableStringRef v30 = v3;
    NSAppendPrintF(&v30);
    v26 = v30;

    v3 = v26;
  }

  return v3;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CUBluetoothDevice addressString](self, "addressString");
    [v4 addressString];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }

    else if ((v7 == 0LL) == (v8 != 0LL))
    {
      char v10 = 0;
    }

    else
    {
      char v10 = [v7 isEqual:v8];
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- ($D91DDCA3822F03E96939068EA8DE741A)address
{
  return ($D91DDCA3822F03E96939068EA8DE741A)(*(unsigned int *)self->_address.bytes | ((unint64_t)*(unsigned __int16 *)&self->_address.bytes[4] << 32));
}

- (void)setAddress:(id)a3
{
  self->_address = ($F37A0EEEFB629DA6F1DB93542131767D)a3;
}

- (NSString)addressString
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAddressString:(id)a3
{
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (int)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(int)a3
{
  self->_int colorCode = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (int)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(int)a3
{
  self->_disconnectReason = a3;
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)magicPaired
{
  return self->_magicPaired;
}

- (void)setMagicPaired:(BOOL)a3
{
  self->_magicPaired = a3;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setName:(id)a3
{
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_secondaryPlacement = a3;
}

- (unsigned)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(unsigned int)a3
{
  self->_productIdentifier = a3;
}

- (int)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(int)a3
{
  self->_streamState = a3;
}

- (BOOL)supportsAACPService
{
  return self->_supportsAACPService;
}

- (void)setSupportsAACPService:(BOOL)a3
{
  self->_supportsAACPService = a3;
}

- (unsigned)versionID
{
  return self->_versionID;
}

- (void)setVersionID:(unsigned int)a3
{
  self->_versionID = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
}

@end