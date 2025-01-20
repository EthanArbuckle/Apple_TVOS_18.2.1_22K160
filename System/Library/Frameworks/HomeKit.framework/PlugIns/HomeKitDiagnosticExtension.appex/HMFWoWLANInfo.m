@interface HMFWoWLANInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSleepConfig;
- (HMFWoWLANInfo)initWithCoder:(id)a3;
- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4;
- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8;
- (NSArray)additionalMACAddresses;
- (NSData)primaryMACAddress;
- (NSData)wakeAddress;
- (NSData)wakePattern;
- (NSString)wakeAddressString;
- (id)description;
- (int64_t)wakePacketType;
- (int64_t)wakeType;
- (unint64_t)hash;
- (unsigned)version;
- (unsigned)wakePort;
- (void)encodeWithCoder:(id)a3;
- (void)setWakeAddress:(id)a3;
- (void)setWakePattern:(id)a3;
@end

@implementation HMFWoWLANInfo

- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 || [v8 count])
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___HMFWoWLANInfo;
    v10 = -[HMFWoWLANInfo init](&v19, "init");
    v11 = (id *)v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_primaryMACAddress, a3);
      objc_storeStrong(v11 + 3, a4);
    }

    self = v11;
    v12 = self;
  }

  else
  {
    v14 = objc_autoreleasePoolPush();
    uint64_t v15 = HMFGetOSLogHandle(0LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier(0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@Invalid inputs for HMFWoWLANInfo.",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v14);
    v12 = 0LL;
  }

  return v12;
}

- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8
{
  id v15 = a5;
  id v16 = a8;
  if (v15)
  {
    v27.receiver = self;
    v27.super_class = (Class)&OBJC_CLASS___HMFWoWLANInfo;
    uint64_t v17 = -[HMFWoWLANInfo init](&v27, "init");
    v18 = v17;
    if (v17)
    {
      v17->_supportsSleepConfig = 1;
      v17->_version = a3;
      v17->_wakePort = a4;
      objc_storeStrong((id *)&v17->_wakeAddress, a5);
      v18->_wakeType = a6;
      v18->_wakePacketType = a7;
      objc_storeStrong((id *)&v18->_wakePattern, a8);
    }

    objc_super v19 = v18;
    v20 = v19;
  }

  else
  {
    v21 = objc_autoreleasePoolPush();
    objc_super v19 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier(v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake address", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v21);
    v20 = 0LL;
  }

  return v20;
}

- (unint64_t)hash
{
  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"))
  {
    uint64_t v3 = -[HMFWoWLANInfo version](self, "version");
    int64_t v4 = -[HMFWoWLANInfo wakeType](self, "wakeType");
    unint64_t v5 = v4 ^ -[HMFWoWLANInfo wakePacketType](self, "wakePacketType") ^ v3;
    uint64_t v6 = -[HMFWoWLANInfo wakePort](self, "wakePort");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern"));
    unint64_t v8 = v5 ^ v6 ^ (unint64_t)[v7 hash];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));
    id v10 = (id)(v8 ^ (unint64_t)[v9 hash]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress"));
    id v10 = [v7 hash];
  }

  return (unint64_t)v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (HMFWoWLANInfo *)a3;
  if (self == v5)
  {
    char v25 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMFWoWLANInfo, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      id v7 = v5;
    }
    else {
      id v7 = 0LL;
    }
    unint64_t v8 = v7;
    if (!v8) {
      goto LABEL_15;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](v8, "primaryMACAddress"));
    int v11 = HMFEqualObjects(v9, v10);

    if (!v11) {
      goto LABEL_15;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo additionalMACAddresses](v8, "additionalMACAddresses"));
    int v14 = HMFEqualObjects(v12, v13);

    if (!v14) {
      goto LABEL_15;
    }
    unsigned int v15 = -[HMFWoWLANInfo version](self, "version");
    if (v15 != -[HMFWoWLANInfo version](v8, "version")) {
      goto LABEL_15;
    }
    id v16 = -[HMFWoWLANInfo wakeType](self, "wakeType");
    if (v16 != (id)-[HMFWoWLANInfo wakeType](v8, "wakeType")) {
      goto LABEL_15;
    }
    unsigned int v17 = -[HMFWoWLANInfo wakePort](self, "wakePort");
    if (v17 != -[HMFWoWLANInfo wakePort](v8, "wakePort")) {
      goto LABEL_15;
    }
    id v18 = -[HMFWoWLANInfo wakePacketType](self, "wakePacketType");
    if (v18 == (id)-[HMFWoWLANInfo wakePacketType](v8, "wakePacketType")
      && (unsigned int v19 = -[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"),
          v19 == -[HMFWoWLANInfo supportsSleepConfig](v8, "supportsSleepConfig"))
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern")),
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](v8, "wakePattern")),
          int v22 = HMFEqualObjects(v20, v21),
          v21,
          v20,
          v22))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](v8, "wakeAddress"));
      char v25 = HMFEqualObjects(v23, v24);
    }

    else
    {
LABEL_15:
      char v25 = 0;
    }
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress"));

  if (v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress"));
    [v12 encodeObject:v5 forKey:@"HMFCI.woWLAN.pID"];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses"));
    [v12 encodeObject:v7 forKey:@"HMFCI.woWLAN.sIDs"];
  }

  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"))
  {
    [v12 encodeBool:1 forKey:@"HMFCI.woWLAN.sleepConfig"];
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo version](self, "version"), @"HMFCI.woWLAN.version");
    objc_msgSend( v12,  "encodeInteger:forKey:",  -[HMFWoWLANInfo wakePort](self, "wakePort"),  @"HMFCI.woWLAN.WakePort");
    objc_msgSend( v12,  "encodeInteger:forKey:",  -[HMFWoWLANInfo wakeType](self, "wakeType"),  @"HMFCI.woWLAN.wakeType");
    objc_msgSend( v12,  "encodeInteger:forKey:",  -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"),  @"HMFCI.woWLAN.wakePacketType");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));
      [v12 encodeObject:v9 forKey:@"HMFCI.woWLAN.WakeAddress"];
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern"));

    if (v10)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern"));
      [v12 encodeObject:v11 forKey:@"HMFCI.woWLAN.wakePattern"];
    }
  }
}

- (HMFWoWLANInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"HMFCI.woWLAN.sleepConfig"])
  {
    unsigned __int16 v6 = (unsigned __int16)[v4 decodeIntegerForKey:@"HMFCI.woWLAN.WakePort"];
    unsigned __int8 v7 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.version"];
    id v8 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakeType"];
    id v9 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakePacketType"];
    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v10),  @"HMFCI.woWLAN.wakePattern");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v14 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v13),  @"HMFCI.woWLAN.WakeAddress");
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    id v16 = -[HMFWoWLANInfo initWithWakeVersion:wakePort:wakeAddress:wakeType:wakePacketType:wakePattern:]( self,  "initWithWakeVersion:wakePort:wakeAddress:wakeType:wakePacketType:wakePattern:",  v7,  v6,  v15,  v8,  v9,  v12);
  }

  else
  {
    id v17 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v5),  @"HMFCI.woWLAN.pID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NSData, v18),  @"HMFCI.woWLAN.sIDs");
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v19);

    id v16 = -[HMFWoWLANInfo initWithPrimaryIdentifier:wifiIdentifiers:]( self,  "initWithPrimaryIdentifier:wifiIdentifiers:",  v12,  v15);
  }

  v20 = v16;

  return v20;
}

- (NSString)wakeAddressString
{
  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig")
    && (id)-[HMFWoWLANInfo wakePacketType](self, "wakePacketType") == (id)1)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));

    if (v3)
    {
      id v4 = objc_alloc(&OBJC_CLASS___HMFMACAddress);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddress](self, "wakeAddress"));
      id v6 = [v4 initWithAddressData:v5];

      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 formattedString]);
    }

    else
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern"));

      if (v7)
      {
        id v9 = (id)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakePattern](self, "wakePattern"));
        uint64_t v10 = v9;
        if (v9 && (unint64_t)[v9 length] >= 0x66)
        {
          id v11 = [v10 bytes];
          uint64_t v12 = 0LL;
          while (v11[v12] == 255)
          {
            if (++v12 == 6)
            {
              for (uint64_t i = 0LL; i != 6; ++i)
                v20[i] = v11[i + 6];
              id v14 = v11 + 6;
              uint64_t v15 = 1LL;
LABEL_18:
              uint64_t v16 = 0LL;
              while (v14[v16] == v20[v16])
              {
                if (++v16 == 6)
                {
                  ++v15;
                  v14 += 6;
                  if (v15 != 16) {
                    goto LABEL_18;
                  }
                  id v17 = objc_alloc(&OBJC_CLASS___HMFMACAddress);
                  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v20,  6LL));
                  id v19 = [v17 initWithAddressData:v18];

                  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v19 formattedString]);
                  goto LABEL_11;
                }
              }

              break;
            }
          }
        }

        unsigned __int8 v7 = 0LL;
LABEL_11:
      }
    }
  }

  else
  {
    unsigned __int8 v7 = 0LL;
  }

  return (NSString *)v7;
}

- (id)description
{
  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[HMFWoWLANInfo version](self, "version")));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMFWoWLANInfo wakeType](self, "wakeType")));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[HMFWoWLANInfo wakePort](self, "wakePort")));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo wakeAddressString](self, "wakeAddressString"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMFWoWLANInfo wakePacketType](self, "wakePacketType")));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Version: %@, Wake Type: %@, Wake Port: %@, Wake Address: %@, Wake Packet Type: %@>",  v3,  v4,  v5,  v6,  v7));
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Primary Address: %@, Additional MAC Addresses: %@>",  v3,  v4));
  }

  return v8;
}

- (NSData)primaryMACAddress
{
  return self->_primaryMACAddress;
}

- (NSArray)additionalMACAddresses
{
  return self->_additionalMACAddresses;
}

- (BOOL)supportsSleepConfig
{
  return self->_supportsSleepConfig;
}

- (unsigned)wakePort
{
  return self->_wakePort;
}

- (NSData)wakeAddress
{
  return self->_wakeAddress;
}

- (void)setWakeAddress:(id)a3
{
}

- (int64_t)wakeType
{
  return self->_wakeType;
}

- (int64_t)wakePacketType
{
  return self->_wakePacketType;
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void)setWakePattern:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end