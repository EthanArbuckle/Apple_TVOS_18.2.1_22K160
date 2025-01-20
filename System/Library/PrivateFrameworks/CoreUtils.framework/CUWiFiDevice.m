@interface CUWiFiDevice
- (NSData)bssid;
- (NSData)deviceIDOUI;
- (NSData)deviceIDSetupHash;
- (NSData)deviceIEBluetoothMAC;
- (NSData)deviceIEDeviceID;
- (NSData)ieData;
- (NSDictionary)rawScanResult;
- (NSString)deviceIEManufacturer;
- (NSString)deviceIEModel;
- (NSString)deviceIEName;
- (NSString)ssid;
- (NSUUID)identifier;
- (id)description;
- (id)platformObject;
- (int)present;
- (int)rssi;
- (unsigned)_updateWithDeviceIE:(const char *)a3 end:(const char *)a4;
- (unsigned)deviceIECategory;
- (unsigned)deviceIEFlags;
- (void)setBssid:(id)a3;
- (void)setDeviceIDOUI:(id)a3;
- (void)setDeviceIDSetupHash:(id)a3;
- (void)setDeviceIEBluetoothMAC:(id)a3;
- (void)setDeviceIECategory:(unsigned int)a3;
- (void)setDeviceIEDeviceID:(id)a3;
- (void)setDeviceIEFlags:(unsigned int)a3;
- (void)setDeviceIEManufacturer:(id)a3;
- (void)setDeviceIEModel:(id)a3;
- (void)setDeviceIEName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIeData:(id)a3;
- (void)setPlatformObject:(id)a3;
- (void)setPresent:(int)a3;
- (void)setRawScanResult:(id)a3;
- (void)setRssi:(int)a3;
- (void)setSsid:(id)a3;
@end

@implementation CUWiFiDevice

- (id)description
{
  CFMutableStringRef v18 = 0LL;
  NSAppendPrintF(&v18);
  v3 = v18;
  if (-[NSData length](self->_bssid, "length", self) == 6)
  {
    CFMutableStringRef v17 = v3;
    v12 = -[NSData bytes](self->_bssid, "bytes");
    NSAppendPrintF(&v17);
    v4 = v17;

    v3 = v4;
  }

  ssid = self->_ssid;
  if (ssid)
  {
    CFMutableStringRef v16 = v3;
    v12 = ssid;
    NSAppendPrintF(&v16);
    v6 = v16;

    v3 = v6;
  }

  CFMutableStringRef v15 = v3;
  -[NSData length](self->_ieData, "length", v12);
  NSAppendPrintF(&v15);
  v7 = v15;

  CFMutableStringRef v14 = v7;
  NSAppendPrintF(&v14);
  v8 = v14;

  CFMutableStringRef v13 = v8;
  NSAppendPrintF(&v13);
  v9 = v13;

  return v9;
}

- (unsigned)_updateWithDeviceIE:(const char *)a3 end:(const char *)a4
{
  v5 = (unsigned __int8 *)a3;
  v7 = a3;
  while (1)
  {
    unsigned int v8 = 0;
    uint64_t v9 = *((unsigned __int8 *)v7 + 1);
    if (&v7[v9 + 2] > a4) {
      goto LABEL_11;
    }
    int v10 = *(unsigned __int8 *)v7;
    v7 += v9 + 2;
    if (v10 == 6)
    {
      if (v9 != 6)
      {
LABEL_11:
        unsigned int v8 = 0;
        break;
      }

      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIEBluetoothMAC = self->_deviceIEBluetoothMAC;
      CFMutableStringRef v13 = v11;
      CFMutableStringRef v14 = deviceIEBluetoothMAC;
      if (v13 == v14)
      {

        unsigned int v8 = 0;
        CFMutableStringRef v17 = v13;
      }

      else
      {
        CFMutableStringRef v15 = v14;
        if ((v13 == 0LL) != (v14 != 0LL))
        {
          char v16 = -[NSData isEqual:](v13, "isEqual:", v14);

          if ((v16 & 1) != 0)
          {
            unsigned int v8 = 0;
LABEL_16:

            break;
          }
        }

        else
        {
        }

        CFMutableStringRef v18 = v13;
        CFMutableStringRef v17 = self->_deviceIEBluetoothMAC;
        self->_deviceIEBluetoothMAC = v18;
        unsigned int v8 = 1;
      }

      goto LABEL_16;
    }
  }

  unsigned int UInt64 = TLV8GetUInt64(v5, (unsigned __int8 *)a4, 8, 0LL, 0LL);
  if (self->_deviceIECategory != UInt64)
  {
    self->_deviceIECategory = UInt64;
    unsigned int v8 = 1;
  }

  unint64_t v20 = (unint64_t)v5;
  while ((unint64_t)a4 > v20)
  {
    uint64_t v21 = *(unsigned __int8 *)(v20 + 1);
    int v22 = *(unsigned __int8 *)v20;
    v20 += 2 + v21;
    if (v22 == 7)
    {
      if (v21 != 6) {
        break;
      }
      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIEDeviceID = self->_deviceIEDeviceID;
      v25 = v23;
      v26 = deviceIEDeviceID;
      if (v25 == v26)
      {

        v29 = v25;
      }

      else
      {
        v27 = v26;
        if ((v25 == 0LL) != (v26 != 0LL))
        {
          char v28 = -[NSData isEqual:](v25, "isEqual:", v26);

          if ((v28 & 1) != 0) {
            goto LABEL_33;
          }
        }

        else
        {
        }

        v30 = v25;
        v29 = self->_deviceIEDeviceID;
        self->_deviceIEDeviceID = v30;
        unsigned int v8 = 1;
      }

LABEL_33:
      break;
    }
  }

  unint64_t v31 = (unint64_t)v5;
  do
  {
    unsigned int v32 = 0;
    v33 = (char *)(v31 + 2);
    unint64_t v34 = *(unsigned __int8 *)(v31 + 1);
    int v35 = *(unsigned __int8 *)v31;
    v31 += 2 + v34;
  }

  while (v35);
  if (v34 <= 1)
  {
    if (v34)
    {
      int v39 = (*v33 < 0) << 31;
      goto LABEL_48;
    }

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSData)deviceIEBluetoothMAC
{
  return self->_deviceIEBluetoothMAC;
}

- (void)setDeviceIEBluetoothMAC:(id)a3
{
}

- (unsigned)deviceIECategory
{
  return self->_deviceIECategory;
}

- (void)setDeviceIECategory:(unsigned int)a3
{
  self->_deviceIECategory = a3;
}

- (NSData)deviceIEDeviceID
{
  return self->_deviceIEDeviceID;
}

- (void)setDeviceIEDeviceID:(id)a3
{
}

- (unsigned)deviceIEFlags
{
  return self->_deviceIEFlags;
}

- (void)setDeviceIEFlags:(unsigned int)a3
{
  self->_deviceIEFlags = a3;
}

- (NSString)deviceIEManufacturer
{
  return self->_deviceIEManufacturer;
}

- (void)setDeviceIEManufacturer:(id)a3
{
}

- (NSString)deviceIEModel
{
  return self->_deviceIEModel;
}

- (void)setDeviceIEModel:(id)a3
{
}

- (NSString)deviceIEName
{
  return self->_deviceIEName;
}

- (void)setDeviceIEName:(id)a3
{
}

- (NSData)deviceIDOUI
{
  return self->_deviceIDOUI;
}

- (void)setDeviceIDOUI:(id)a3
{
}

- (NSData)deviceIDSetupHash
{
  return self->_deviceIDSetupHash;
}

- (void)setDeviceIDSetupHash:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)ieData
{
  return self->_ieData;
}

- (void)setIeData:(id)a3
{
}

- (id)platformObject
{
  return self->_platformObject;
}

- (void)setPlatformObject:(id)a3
{
}

- (NSDictionary)rawScanResult
{
  return self->_rawScanResult;
}

- (void)setRawScanResult:(id)a3
{
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (int)present
{
  return self->_present;
}

- (void)setPresent:(int)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
}

@end