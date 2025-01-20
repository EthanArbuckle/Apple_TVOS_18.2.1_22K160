@interface CBControllerInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fastLEConnectionAllowed;
- (BOOL)isEqual:(id)a3;
- (CBControllerInfo)initWithCoder:(id)a3;
- (CBControllerInfo)initWithDictionary:(id)a3 error:(id *)a4;
- (CBControllerInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)audioLinkQualityArray;
- (NSData)fastLEConnectionInfoData;
- (NSData)hardwareAddressData;
- (NSError)lastChipsetInitError;
- (NSString)chipsetID;
- (NSString)firmwareName;
- (NSString)firmwareVersion;
- (char)hciTransportType;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (int)discoverableState;
- (int)inquiryState;
- (int64_t)bluetoothState;
- (unsigned)cloudSyncStatus;
- (unsigned)fastLEConnectionInfoVersion;
- (unsigned)leaVersion;
- (unsigned)lmpVersion;
- (unsigned)productID;
- (unsigned)supportedServices;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAudioLinkQualityArray:(id)a3;
- (void)setBluetoothState:(int64_t)a3;
- (void)setChipsetID:(id)a3;
- (void)setCloudSyncStatus:(unsigned __int8)a3;
- (void)setDiscoverableState:(int)a3;
- (void)setFastLEConnectionAllowed:(BOOL)a3;
- (void)setFastLEConnectionInfoData:(id)a3;
- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3;
- (void)setFirmwareName:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHardwareAddressData:(id)a3;
- (void)setHciTransportType:(char)a3;
- (void)setInquiryState:(int)a3;
- (void)setLastChipsetInitError:(id)a3;
- (void)setLeaVersion:(unsigned __int8)a3;
- (void)setLmpVersion:(unsigned __int8)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setSupportedServices:(unsigned int)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int8)a3;
@end

@implementation CBControllerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBControllerInfo)initWithCoder:(id)a3
{
  v11[8] = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x189604010];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v11 count:8];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 decodeObjectOfClasses:v7 forKey:@"ctrI"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CBControllerInfo initWithDictionary:error:](self, "initWithDictionary:error:", v8, 0LL);
  return v9;
}

- (CBControllerInfo)initWithDictionary:(id)a3 error:(id *)a4
{
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = -[CBControllerInfo initWithXPCObject:error:](self, "initWithXPCObject:error:", v12, a4);
    v13 = self;
  }

  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBControllerInfo convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBControllerInfo encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
  v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x189604A60];
  }
  id v6 = v4;

  return v6;
}

- (CBControllerInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBControllerInfo init](self, "init");
  if (!v13)
  {
    if (!a4) {
      goto LABEL_53;
    }
    v28 = "CBControllerInfo init failed";
LABEL_52:
    CBErrorF(-6756, (uint64_t)v28, v7, v8, v9, v10, v11, v12, v29);
    v26 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_53;
    }
    v28 = "XPC non-dict";
    goto LABEL_52;
  }

  objc_opt_class();
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bluetoothState = 0LL;
  }

  else if (v14 == 5)
  {
    goto LABEL_53;
  }

  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_cloudSyncStatus = 0;
  }

  else if (v15 == 5)
  {
    goto LABEL_53;
  }

  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_discoverableState = 0;
  }

  else if (v16 == 5)
  {
    goto LABEL_53;
  }

  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_fastLEConnectionInfoVersion = 0;
  }

  else if (v17 == 5)
  {
    goto LABEL_53;
  }

  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_53;
  }

  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v13->_hciTransportType = 0;
  }

  else if (v18 == 5)
  {
    goto LABEL_53;
  }

  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_inquiryState = 0;
  }

  else if (v19 == 5)
  {
    goto LABEL_53;
  }

  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_leaVersion = 0;
  }

  else if (v20 == 5)
  {
    goto LABEL_53;
  }

  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v13->_lmpVersion = 0;
  }

  else if (v21 == 5)
  {
    goto LABEL_53;
  }

  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v13->_productID = 0;
  }

  else if (v22 == 5)
  {
    goto LABEL_53;
  }

  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v13->_supportedServices = 0;
  }

  else if (v23 == 5)
  {
    goto LABEL_53;
  }

  int v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v13->_vendorID = 0;
  }

  else if (v24 == 5)
  {
    goto LABEL_53;
  }

  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 != 6)
  {
    if (v25 != 5) {
      goto LABEL_46;
    }
LABEL_53:
    v26 = 0LL;
    goto LABEL_47;
  }

  v13->_vendorIDSource = 0;
LABEL_46:
  v26 = v13;
LABEL_47:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = -[CBControllerInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  if (v4) {
    [v5 encodeObject:v4 forKey:@"ctrI"];
  }
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  CUXPCEncodeNSArrayOfObjects();
  int64_t bluetoothState = self->_bluetoothState;
  if (bluetoothState) {
    xpc_dictionary_set_int64(v4, "pwrS", bluetoothState);
  }
  chipsetID = self->_chipsetID;
  id v7 = v4;
  uint64_t v8 = -[NSString UTF8String](chipsetID, "UTF8String");
  if (v8) {
    xpc_dictionary_set_string(v7, "chip", v8);
  }

  if (self->_cloudSyncStatus) {
    xpc_dictionary_set_uint64(v7, "clSy", self->_cloudSyncStatus);
  }
  int64_t discoverableState = self->_discoverableState;
  if ((_DWORD)discoverableState) {
    xpc_dictionary_set_int64(v7, "dsSt", discoverableState);
  }
  if (self->_fastLEConnectionAllowed) {
    xpc_dictionary_set_BOOL(v7, "fLEal", 1);
  }
  if (self->_fastLEConnectionInfoVersion) {
    xpc_dictionary_set_uint64(v7, "fLEVe", self->_fastLEConnectionInfoVersion);
  }
  fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
  if (fastLEConnectionInfoData)
  {
    uint64_t v11 = fastLEConnectionInfoData;
    id v12 = v7;
    v13 = v11;
    uint64_t v14 = -[NSData bytes](v13, "bytes");
    if (v14) {
      int v15 = (const char *)v14;
    }
    else {
      int v15 = "";
    }
    size_t v16 = -[NSData length](v13, "length");

    xpc_dictionary_set_data(v12, "fLEDt", v15, v16);
  }

  firmwareName = self->_firmwareName;
  id v18 = v7;
  int v19 = -[NSString UTF8String](firmwareName, "UTF8String");
  if (v19) {
    xpc_dictionary_set_string(v18, "frmN", v19);
  }

  firmwareVersion = self->_firmwareVersion;
  xpc_object_t xdict = v18;
  int v21 = -[NSString UTF8String](firmwareVersion, "UTF8String");
  if (v21) {
    xpc_dictionary_set_string(xdict, "frmV", v21);
  }

  hardwareAddressData = self->_hardwareAddressData;
  if (hardwareAddressData)
  {
    int v23 = hardwareAddressData;
    id v24 = xdict;
    int v25 = v23;
    uint64_t v26 = -[NSData bytes](v25, "bytes");
    if (v26) {
      v27 = (const char *)v26;
    }
    else {
      v27 = "";
    }
    size_t v28 = -[NSData length](v25, "length");

    xpc_dictionary_set_data(v24, "btAd", v27, v28);
  }

  if (self->_hciTransportType) {
    xpc_dictionary_set_int64(xdict, "hciT", self->_hciTransportType);
  }
  int64_t inquiryState = self->_inquiryState;
  v30 = xdict;
  if ((_DWORD)inquiryState)
  {
    xpc_dictionary_set_int64(xdict, "inqS", inquiryState);
    v30 = xdict;
  }

  if (self->_leaVersion)
  {
    xpc_dictionary_set_uint64(xdict, "fLEAVe", self->_leaVersion);
    v30 = xdict;
  }

  if (self->_lmpVersion)
  {
    xpc_dictionary_set_uint64(xdict, "lmpV", self->_lmpVersion);
    v30 = xdict;
  }

  uint64_t productID = self->_productID;
  if ((_DWORD)productID)
  {
    xpc_dictionary_set_uint64(xdict, "pid", productID);
    v30 = xdict;
  }

  uint64_t supportedServices = self->_supportedServices;
  if ((_DWORD)supportedServices)
  {
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
    v30 = xdict;
  }

  if (self->_vendorID)
  {
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
    v30 = xdict;
  }

  if (self->_vendorIDSource)
  {
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
    v30 = xdict;
  }
}

- (id)description
{
  return -[CBControllerInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  xpc_object_t v3 = self;
  uint64_t v122 = *MEMORY[0x1895F89C0];
  if (a3 <= 0x14u)
  {
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    id v4 = self->_audioLinkQualityArray;
    uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v116,  v121,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0LL;
      uint64_t v8 = *(void *)v117;
      do
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = v7;
        do
        {
          if (*(void *)v117 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void **)(*((void *)&v116 + 1) + 8 * v9);
          CUDescriptionWithLevel();
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v10;
          [v11 deviceName];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          id v14 = v12;
          [v14 UTF8String];
          CUPrintText();
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          id v7 = v10;

          ++v9;
          uint64_t v10 = v7;
        }

        while (v6 != v9);
        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v116,  v121,  16LL,  v13,  v87);
      }

      while (v6);
    }

    else
    {
      id v7 = 0LL;
    }

    id v114 = v7;
    NSAppendPrintF_safe();
    id v36 = v7;

    chipsetID = self->_chipsetID;
    if (chipsetID)
    {
      id v113 = v36;
      v83 = chipsetID;
      NSAppendPrintF_safe();
      id v38 = v36;

      id v36 = v38;
    }

    id v112 = v36;
    uint64_t discoverableState = self->_discoverableState;
    else {
      v40 = off_189FB2DE0[discoverableState];
    }
    v84 = v40;
    NSAppendPrintF_safe();
    id v41 = v112;

    v42 = self->_firmwareName;
    v43 = self->_firmwareVersion;
    size_t v16 = v42;
    v44 = v43;
    v45 = v44;
    if (v16 == v44)
    {
    }

    else
    {
      if ((v16 == 0LL) == (v44 != 0LL))
      {

        if (!v16) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }

      char v46 = -[NSArray isEqual:](v16, "isEqual:", v44, v84);

      if ((v46 & 1) == 0)
      {
        if (!v16)
        {
LABEL_43:
          if (!v45)
          {
LABEL_48:
            hardwareAddressData = self->_hardwareAddressData;
            if (hardwareAddressData)
            {
              id v109 = v41;
              v51 = hardwareAddressData;
              CUPrintNSDataAddress();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              id v52 = v41;

              id v41 = v52;
            }

            id v108 = v41;
            NSAppendPrintF_safe();
            id v53 = v41;

            if (self->_hciTransportType)
            {
              id v107 = v53;
              NSAppendPrintF_safe();
              id v63 = v53;

              id v53 = v63;
            }

            id v106 = v53;
            NSAppendPrintF_safe();
            id v64 = v53;

            id v105 = v64;
            NSAppendPrintF_safe();
            id v65 = v64;

            id v104 = v65;
            CUPrintFlags32();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            NSAppendPrintF_safe();
            v66 = (__CFString *)v65;
            goto LABEL_83;
          }

          v110[0] = v41;
          v48 = (id *)v110;
LABEL_47:
          NSAppendPrintF_safe();
          id v49 = *v48;

          id v41 = v49;
          goto LABEL_48;
        }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    audioLinkQualityArray = self->_audioLinkQualityArray;
    [v5 audioLinkQualityArray];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = audioLinkQualityArray;
    uint64_t v9 = v7;
    if (v8 == v9)
    {

      int64_t bluetoothState = self->_bluetoothState;
      if (bluetoothState != [v5 bluetoothState]) {
        goto LABEL_49;
      }
    }

    else
    {
      uint64_t v10 = v9;
      if ((v8 == 0LL) == (v9 != 0LL)) {
        goto LABEL_50;
      }
      int v11 = -[NSArray isEqual:](v8, "isEqual:", v9);

      if (!v11) {
        goto LABEL_49;
      }
      int64_t v12 = self->_bluetoothState;
      if (v12 != [v5 bluetoothState]) {
        goto LABEL_49;
      }
    }

    chipsetID = self->_chipsetID;
    [v5 chipsetID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = chipsetID;
    size_t v16 = v15;
    if (v8 == v16)
    {

      int cloudSyncStatus = self->_cloudSyncStatus;
    }

    else
    {
      uint64_t v10 = v16;
      if ((v8 == 0LL) == (v16 != 0LL)) {
        goto LABEL_50;
      }
      int v17 = -[NSArray isEqual:](v8, "isEqual:", v16);

      if (!v17) {
        goto LABEL_49;
      }
      int v18 = self->_cloudSyncStatus;
    }

    int discoverableState = self->_discoverableState;
    int fastLEConnectionAllowed = self->_fastLEConnectionAllowed;
    int fastLEConnectionInfoVersion = self->_fastLEConnectionInfoVersion;
    fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
    [v5 fastLEConnectionInfoData];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = fastLEConnectionInfoData;
    id v25 = v24;
    if (v8 == v25)
    {
    }

    else
    {
      uint64_t v10 = v25;
      if ((v8 == 0LL) == (v25 != 0LL)) {
        goto LABEL_50;
      }
      int v26 = -[NSArray isEqual:](v8, "isEqual:", v25);

      if (!v26) {
        goto LABEL_49;
      }
    }

    firmwareName = self->_firmwareName;
    [v5 firmwareName];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = firmwareName;
    uint64_t v29 = v28;
    if (v8 == v29)
    {
    }

    else
    {
      uint64_t v10 = v29;
      if ((v8 == 0LL) == (v29 != 0LL)) {
        goto LABEL_50;
      }
      int v30 = -[NSArray isEqual:](v8, "isEqual:", v29);

      if (!v30) {
        goto LABEL_49;
      }
    }

    firmwareVersion = self->_firmwareVersion;
    [v5 firmwareVersion];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = firmwareVersion;
    id v33 = v32;
    if (v8 == v33)
    {
    }

    else
    {
      uint64_t v10 = v33;
      if ((v8 == 0LL) == (v33 != 0LL)) {
        goto LABEL_50;
      }
      int v34 = -[NSArray isEqual:](v8, "isEqual:", v33);

      if (!v34) {
        goto LABEL_49;
      }
    }

    hardwareAddressData = self->_hardwareAddressData;
    [v5 hardwareAddressData];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = hardwareAddressData;
    v37 = v36;
    if (v8 == v37)
    {
    }

    else
    {
      uint64_t v10 = v37;
      if ((v8 == 0LL) == (v37 != 0LL)) {
        goto LABEL_50;
      }
      int v38 = -[NSArray isEqual:](v8, "isEqual:", v37);

      if (!v38) {
        goto LABEL_49;
      }
    }

    int hciTransportType = self->_hciTransportType;
    if (hciTransportType == [v5 hciTransportType])
    {
      int inquiryState = self->_inquiryState;
      if (inquiryState == [v5 inquiryState])
      {
        int leaVersion = self->_leaVersion;
        if (leaVersion == [v5 leaVersion])
        {
          int lmpVersion = self->_lmpVersion;
          if (lmpVersion == [v5 lmpVersion])
          {
            unsigned int productID = self->_productID;
            if (productID == [v5 productID])
            {
              unsigned int supportedServices = self->_supportedServices;
              if (supportedServices == [v5 supportedServices])
              {
                int vendorID = self->_vendorID;
                if (vendorID == [v5 vendorID])
                {
                  int vendorIDSource = self->_vendorIDSource;
                  if (vendorIDSource == [v5 vendorIDSource])
                  {
                    lastChipsetInitError = self->_lastChipsetInitError;
                    [v5 lastChipsetInitError];
                    id v49 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v8 = lastChipsetInitError;
                    v50 = v49;
                    uint64_t v10 = v50;
                    if (v8 == v50)
                    {
                      char v39 = 1;
                      goto LABEL_51;
                    }

                    if ((v8 == 0LL) != (v50 != 0LL))
                    {
                      char v39 = -[NSArray isEqual:](v8, "isEqual:", v50);
LABEL_51:

                      goto LABEL_52;
                    }

- (NSArray)audioLinkQualityArray
{
  return self->_audioLinkQualityArray;
}

- (void)setAudioLinkQualityArray:(id)a3
{
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_int64_t bluetoothState = a3;
}

- (NSString)chipsetID
{
  return self->_chipsetID;
}

- (void)setChipsetID:(id)a3
{
}

- (unsigned)cloudSyncStatus
{
  return self->_cloudSyncStatus;
}

- (void)setCloudSyncStatus:(unsigned __int8)a3
{
  self->_int cloudSyncStatus = a3;
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (void)setDiscoverableState:(int)a3
{
  self->_int discoverableState = a3;
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_int fastLEConnectionInfoVersion = a3;
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
}

- (NSString)firmwareName
{
  return self->_firmwareName;
}

- (void)setFirmwareName:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSData)hardwareAddressData
{
  return self->_hardwareAddressData;
}

- (void)setHardwareAddressData:(id)a3
{
}

- (char)hciTransportType
{
  return self->_hciTransportType;
}

- (void)setHciTransportType:(char)a3
{
  self->_int hciTransportType = a3;
}

- (int)inquiryState
{
  return self->_inquiryState;
}

- (void)setInquiryState:(int)a3
{
  self->_int inquiryState = a3;
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8)a3
{
  self->_int leaVersion = a3;
}

- (unsigned)lmpVersion
{
  return self->_lmpVersion;
}

- (void)setLmpVersion:(unsigned __int8)a3
{
  self->_int lmpVersion = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_unsigned int productID = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_unsigned int supportedServices = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_int vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_int vendorIDSource = a3;
}

- (NSError)lastChipsetInitError
{
  return self->_lastChipsetInitError;
}

- (void)setLastChipsetInitError:(id)a3
{
}

- (BOOL)fastLEConnectionAllowed
{
  return self->_fastLEConnectionAllowed;
}

- (void)setFastLEConnectionAllowed:(BOOL)a3
{
  self->_int fastLEConnectionAllowed = a3;
}

- (void).cxx_destruct
{
}

@end