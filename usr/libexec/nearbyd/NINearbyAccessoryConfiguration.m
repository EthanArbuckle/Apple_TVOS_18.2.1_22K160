@interface NINearbyAccessoryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)dataExchangeDisabledAndUsingParameterOverrides;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)accessoryDiscoveryToken;
- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error;
- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3;
- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error;
- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3;
- (NSData)accessoryConfigData;
- (NSDictionary)debugParameters;
- (NSUUID)bluetoothDeviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)backgroundMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setBluetoothDeviceIdentifier:(id)a3;
- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled;
- (void)setDebugParameters:(id)a3;
@end

@implementation NINearbyAccessoryConfiguration

- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error
{
  v7 = data;
  if (!v7)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v33 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 647, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NINearbyAccessoryConfiguration;
  v8 = -[NIConfiguration initInternal](&v37, "initInternal");
  if (!v8) {
    goto LABEL_22;
  }
  v9 = v7;
  id v10 = -[NSData bytes](v9, "bytes");
  int64_t v11 = -[NSData length](v9, "length");
  __p = 0LL;
  v35 = 0LL;
  uint64_t v36 = 0LL;
  sub_100030B3C(&__p, v10, (uint64_t)v10 + v11, v11);
  size_t v12 = v35 - (_BYTE *)__p;
  uint64_t v15 = 0LL;
  unsigned int v16 = *(unsigned __int16 *)__p;
  BOOL v17 = !*((_WORD *)__p + 1) && v16 == 1;
  BOOL v18 = *((_WORD *)__p + 1) && v16 == 1;
  unsigned int v19 = *((unsigned __int16 *)__p + 8);
  uint64_t v20 = *((unsigned __int16 *)__p + 9);
  do
  {
    if (__PAIR64__(v20, v19) == __PAIR64__( (unsigned __int16)word_100424918[v15 + 1],  (unsigned __int16)word_100424918[v15]))
    {
      int v23 = 1;
      goto LABEL_25;
    }

    v15 += 2LL;
  }

  while (v15 != 6);
  int v23 = 0;
LABEL_25:
  BOOL v24 = v19 == 1 && v20 > 2;
  int v25 = v24;
  int v26 = v19 <= 1 ? v25 : 1;
  int v27 = v16 > 1 || v17;
  if ((v27 | v18) != 1 || !(v23 | v26)) {
    goto LABEL_5;
  }
  if (v23)
  {
  }

  else if (v26)
  {
    size_t v12 = 39LL;
  }

  else
  {
    size_t v12 = 0LL;
  }

  int __dst = 0;
  int v42 = 0;
  int v45 = 0;
  uint64_t v40 = 0LL;
  __int16 v41 = 0;
  memcpy(&__dst, __p, v12);
  if (v39 <= 0x14u
    && ((1 << v39) & 0x100401) != 0
    && v43 <= 1u
    && BYTE2(v45) <= 1u
    && HIBYTE(v45) <= 8u
    && ((1 << SHIBYTE(v45)) & 0x10D) != 0)
  {
    uint64_t v28 = v44;
    id v29 = -[NSData copy](v9, "copy");
    v30 = (void *)v8[4];
    v8[4] = v29;

    v31 = -[NIDiscoveryToken initWithDeviceAddress:]( objc_alloc(&OBJC_CLASS___NIDiscoveryToken),  "initWithDeviceAddress:",  v28);
    v32 = (void *)v8[6];
    v8[6] = v31;

    *((_BYTE *)v8 + 40) = 0;
    v8[9] = 0LL;
    char v14 = 1;
    goto LABEL_19;
  }

- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error
{
  v9 = accessoryData;
  id v10 = identifier;
  int64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 680, @"Invalid parameter not satisfying: %@", @"accessoryData" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v17 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 681, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  size_t v12 = -[NINearbyAccessoryConfiguration initWithData:error:](self, "initWithData:error:", v9, error);
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothDeviceIdentifier, identifier);
    v13->_backgroundMode = 2LL;
    char v14 = v13;
  }

  return v13;
}

- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 702, @"Invalid parameter not satisfying: %@", @"parameterOverrides" object file lineNumber description];
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NINearbyAccessoryConfiguration;
  v6 = -[NIConfiguration initInternal](&v23, "initInternal");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  @"DisableDataExchangeAndUseParameterOverrides");
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v5);
    objc_storeStrong((id *)&v6->_debugParameters, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_debugParameters,  "objectForKeyedSubscript:",  @"UWBSessionIdOverride"));
    id v9 = [v8 unsignedLongLongValue];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_debugParameters,  "objectForKeyedSubscript:",  @"LocalAddressOverride"));
    id v11 = [v10 unsignedLongLongValue];
    size_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_debugParameters,  "objectForKeyedSubscript:",  @"PeerAddressOverride"));
    unint64_t v13 = ((void)v9 << 32) | ((void)v11 << 16) | (unint64_t)[v12 unsignedLongLongValue];

    unint64_t v22 = v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v22, 8LL));
    rawData = v6->_rawData;
    v6->_rawData = (NSData *)v14;

    unsigned int v16 = objc_alloc(&OBJC_CLASS___NIDiscoveryToken);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_debugParameters,  "objectForKeyedSubscript:",  @"PeerAddressOverride"));
    BOOL v18 = -[NIDiscoveryToken initWithDeviceAddress:]( v16,  "initWithDeviceAddress:",  [v17 unsignedShortValue]);
    accessoryDiscoveryToken = v6->_accessoryDiscoveryToken;
    v6->_accessoryDiscoveryToken = v18;

    v6->_cameraAssistanceEnabled = 0;
    v6->_backgroundMode = 0LL;
  }

  return v6;
}

- (BOOL)dataExchangeDisabledAndUsingParameterOverrides
{
  if (!+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_debugParameters,  "objectForKeyedSubscript:",  @"DisableDataExchangeAndUseParameterOverrides"));
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSData)accessoryConfigData
{
  return self->_rawData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NINearbyAccessoryConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v13, "copyWithZone:");
  [v5 setBluetoothDeviceIdentifier:self->_bluetoothDeviceIdentifier];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v5 setBackgroundMode:self->_backgroundMode];
  id v6 = -[NSData copyWithZone:](self->_rawData, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NIDiscoveryToken copyWithZone:](self->_accessoryDiscoveryToken, "copyWithZone:", a3);
  id v9 = (void *)v5[6];
  v5[6] = v8;

  if (self->_debugParameters)
  {
    id v10 = -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self->_debugParameters,  1LL);
    id v11 = (void *)v5[8];
    v5[8] = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NINearbyAccessoryConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeObject:self->_rawData forKey:@"rawData"];
  [v4 encodeObject:self->_accessoryDiscoveryToken forKey:@"accessoryDiscoveryToken"];
  [v4 encodeObject:self->_bluetoothDeviceIdentifier forKey:@"bluetoothDeviceIdentifier"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeInteger:self->_backgroundMode forKey:@"backgroundMode"];
}

- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v5),  @"accessoryDiscoveryToken");
  id obj = (id)objc_claimAutoreleasedReturnValue(v6);
  id v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v7), @"rawData");
  id v27 = (id)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v9),  @"bluetoothDeviceIdentifier");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString, v12);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  v30[0] = objc_opt_class(&OBJC_CLASS___NSString, v15);
  v30[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v16);
  v30[2] = objc_opt_class(&OBJC_CLASS___NSData, v17);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeDictionaryWithKeysOfClasses:v14 objectsOfClasses:v19 forKey:@"debugParameters"]);
  unsigned __int8 v21 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
  id v22 = [v4 decodeIntegerForKey:@"backgroundMode"];
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NINearbyAccessoryConfiguration;
  objc_super v23 = -[NIConfiguration initWithCoder:](&v29, "initWithCoder:", v4);
  BOOL v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_accessoryDiscoveryToken, obj);
    objc_storeStrong((id *)&v24->_debugParameters, v20);
    objc_storeStrong((id *)&v24->_rawData, v27);
    objc_storeStrong((id *)&v24->_bluetoothDeviceIdentifier, v11);
    v24->_cameraAssistanceEnabled = v21;
    else {
      int64_t v25 = (int64_t)v22;
    }
    v24->_backgroundMode = v25;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NINearbyAccessoryConfiguration *)v4;
    id v8 = v7;
    if (v7 == self)
    {
      char v14 = 1;
    }

    else
    {
      rawData = self->_rawData;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryConfigData](v7, "accessoryConfigData"));
      unsigned int v11 = -[NSData isEqualToData:](rawData, "isEqualToData:", v10);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v8, "bluetoothDeviceIdentifier"));
      if (v12) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = self->_bluetoothDeviceIdentifier == 0LL;
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v8, "bluetoothDeviceIdentifier"));
      unsigned int v16 = [v15 isEqual:self->_bluetoothDeviceIdentifier];

      int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      unsigned int v18 = -[NINearbyAccessoryConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
      int64_t backgroundMode = self->_backgroundMode;
      id v26 = -[NINearbyAccessoryConfiguration backgroundMode](v8, "backgroundMode");
      id v27 = (id)backgroundMode;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration debugParameters](v8, "debugParameters"));
      unsigned int v21 = v11;
      if (v20) {
        BOOL v25 = 0;
      }
      else {
        BOOL v25 = self->_debugParameters == 0LL;
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration debugParameters](v8, "debugParameters"));
      unsigned __int8 v23 = [v22 isEqualToDictionary:self->_debugParameters];

      char v14 = 0;
      if ((v21 & (v13 | v16)) == 1 && cameraAssistanceEnabled == v18)
      {
        if (v27 == v26) {
          char v14 = v25 | v23;
        }
        else {
          char v14 = 0;
        }
      }
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_rawData, "hash");
  unint64_t v4 = -[NIDiscoveryToken hash](self->_accessoryDiscoveryToken, "hash");
  return v3 ^ v4 ^ (unint64_t)-[NSUUID hash](self->_bluetoothDeviceIdentifier, "hash") ^ self->_cameraAssistanceEnabled ^ self->_backgroundMode ^ 0x1F;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  unint64_t v3 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", &stru_1007C41E0);
  accessoryDiscoveryToken = self->_accessoryDiscoveryToken;
  if (accessoryDiscoveryToken)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](accessoryDiscoveryToken, "descriptionInternal"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Device Token: %@", v5);
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @"Device Token: null");
  }

  bluetoothDeviceIdentifier = self->_bluetoothDeviceIdentifier;
  if (bluetoothDeviceIdentifier)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](bluetoothDeviceIdentifier, "UUIDString"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", Bluetooth Device: %@", v7);
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @", Bluetooth Device: null");
  }

  if (self->_cameraAssistanceEnabled) {
    id v8 = "Yes";
  }
  else {
    id v8 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", isCameraAssistanceEnabled: %s", v8);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", backgroundMode: %s",  +[NIInternalUtils NISessionBackgroundModeToString:]( &OBJC_CLASS___NIInternalUtils,  "NISessionBackgroundModeToString:",  self->_backgroundMode));
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (NIDiscoveryToken)accessoryDiscoveryToken
{
  return self->_accessoryDiscoveryToken;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_int cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (NSUUID)bluetoothDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDebugParameters:(id)a3
{
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_int64_t backgroundMode = a3;
}

- (void).cxx_destruct
{
}

@end