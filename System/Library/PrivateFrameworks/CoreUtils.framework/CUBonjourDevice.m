@interface CUBonjourDevice
- (NSData)txtData;
- (NSDictionary)deviceInfo;
- (NSDictionary)txtDictionary;
- (NSString)identifierStr;
- (NSString)model;
- (NSString)name;
- (NSString)serviceType;
- (NSUUID)identifier;
- (NSUUID)identifierUUID;
- (id)copyConnectionInfoWithFlags:(unint64_t)a3 interfaceName:(id)a4 error:(id *)a5;
- (id)copyConnectionStringWithFlags:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)shortDescription;
- (unsigned)updateWithBonjourDeviceInfo:(id)a3;
- (void)_updateTXTDictionary:(id)a3;
- (void)reconfirm;
- (void)setDeviceInfo:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierStr:(id)a3;
- (void)setIdentifierUUID:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTxtData:(id)a3;
@end

@implementation CUBonjourDevice

- (id)shortDescription
{
  return NSPrintF();
}

- (id)description
{
  return -[CUBonjourDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v23 = 0LL;
  deviceIDBytes = self->_deviceIDBytes;
  NSAppendPrintF(&v23);
  v5 = v23;
  v6 = v5;
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v22 = v5;
    deviceIDBytes = (unsigned __int8 *)name;
    NSAppendPrintF(&v22);
    v8 = v22;

    v6 = v8;
  }

  model = self->_model;
  if (model)
  {
    CFMutableStringRef v21 = v6;
    deviceIDBytes = (unsigned __int8 *)model;
    NSAppendPrintF(&v21);
    v10 = v21;

    v6 = v10;
  }

  int64_t Int64Ranged = CFDictionaryGetInt64Ranged( (const __CFDictionary *)self->_deviceInfo,  @"TrTy",  0LL,  0xFFFFFFFFLL,  0LL);
  if ((_DWORD)Int64Ranged)
  {
    CFMutableStringRef v20 = v6;
    deviceIDBytes = (unsigned __int8 *)Int64Ranged;
    NSAppendPrintF(&v20);
    v12 = v20;

    v6 = v12;
  }

  if (a3 <= 30)
  {
    v13 = self->_txtDictionary;
    if (-[NSDictionary count](v13, "count", deviceIDBytes))
    {
      CFMutableStringRef v19 = v6;
      NSAppendPrintF(&v19);
      v14 = v19;

      v6 = v14;
    }

    if (a3 <= 20)
    {
      CFMutableStringRef v18 = v6;
      NSAppendPrintF(&v18);
      v15 = v18;

      v6 = v15;
    }
  }

  return v6;
}

- (id)copyConnectionInfoWithFlags:(unint64_t)a3 interfaceName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = self->_deviceInfo;
  v10 = v9;
  if (v9)
  {
    v11 = BonjourDevice_CopyConnectionInfo((const __CFDictionary *)v9, a3, v8, (int *)&v16);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }

    else if (a5)
    {
      if (v16) {
        uint64_t v15 = v16;
      }
      else {
        uint64_t v15 = 4294960596LL;
      }
      NSErrorWithOSStatusF((const char *)v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (a5)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5A7LL);
    v12 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)copyConnectionStringWithFlags:(unint64_t)a3 error:(id *)a4
{
  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    if (a4)
    {
      uint64_t v11 = 4294960551LL;
LABEL_11:
      NSErrorWithOSStatusF((const char *)v11);
      v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }

    return 0LL;
  }

  v6 = (const char *)BonjourDevice_CopyDNSNames((const __CFDictionary *)deviceInfo, a3, (int *)&v13);
  if (!v6)
  {
    if (a4)
    {
      if (v13) {
        uint64_t v11 = v13;
      }
      else {
        uint64_t v11 = 4294960596LL;
      }
      goto LABEL_11;
    }

    return 0LL;
  }

  v7 = (char *)v6;
  id v8 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:v6 length:strlen(v6) encoding:4 freeWhenDone:1];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    free(v7);
    if (a4)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (void)reconfirm
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    BonjourDevice_Reconfirm((const __CFDictionary *)deviceInfo);
  }
}

- (void)_updateTXTDictionary:(id)a3
{
  id v15 = a3;
  v4 = (unsigned __int8 *)[v15 bytes];
  v5 = &v4[[v15 length]];
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  while (v5 - v4 >= 1)
  {
    id v8 = v4 + 1;
    unint64_t v7 = *v4;
    if (v5 - (v4 + 1) < v7) {
      break;
    }
    v4 += v7 + 1;
    v9 = v8;
    if ((_DWORD)v7)
    {
      while (*v9 != 61)
      {
        ++v9;
        if (!--v7)
        {
          v9 = v4;
          break;
        }
      }
    }

    id v10 = (void *)[objc_alloc(NSString) initWithBytes:v8 length:v9 - v8 encoding:4];
    if (v10)
    {
      if (v9 >= v4) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v9 + 1;
      }
      v12 = (void *)[objc_alloc(NSString) initWithBytes:v11 length:v4 - v11 encoding:4];
      if (v12) {
        [v6 setObject:v12 forKeyedSubscript:v10];
      }
    }
  }

  unsigned int v13 = (NSDictionary *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v6];
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v13;
}

- (unsigned)updateWithBonjourDeviceInfo:(id)a3
{
  v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_deviceInfo, a3);
  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, @"name", TypeID, 0LL);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  name = self->_name;
  id v10 = v7;
  uint64_t v11 = name;
  if (v10 == v11)
  {

    goto LABEL_7;
  }

  v12 = v11;
  if (v11)
  {
    char v13 = -[NSString isEqual:](v10, "isEqual:", v11);

    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_name, v8);
  unsigned int v14 = 2;
LABEL_10:
  CFTypeID v15 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v5, @"txt", v15, 0LL);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    CFMutableStringRef v18 = self->_name;
    CFMutableStringRef v19 = v16;
    CFMutableStringRef v20 = v18;
    if (v19 == v20)
    {
    }

    else
    {
      CFMutableStringRef v21 = v20;
      if (v20)
      {
        char v22 = -[NSString isEqual:](v19, "isEqual:", v20);

        if ((v22 & 1) != 0) {
          goto LABEL_18;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_txtData, v17);
      -[CUBonjourDevice _updateTXTDictionary:](self, "_updateTXTDictionary:", v19);
      v14 |= 1u;
    }
  }

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSData)txtData
{
  return self->_txtData;
}

- (void)setTxtData:(id)a3
{
}

- (NSDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setIdentifierStr:(id)a3
{
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end