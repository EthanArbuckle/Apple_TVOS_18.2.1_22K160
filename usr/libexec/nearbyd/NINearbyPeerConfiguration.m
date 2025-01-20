@interface NINearbyPeerConfiguration
+ (BOOL)supportsSecureCoding;
+ (NINearbyPeerConfiguration)new;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsExtendedDistanceMeasurementEnabled;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedDistanceMeasurementEnabled;
- (BOOL)isLongRangeEnabled;
- (NIDiscoveryToken)peerDiscoveryToken;
- (NINearbyPeerConfiguration)init;
- (NINearbyPeerConfiguration)initWithCoder:(id)a3;
- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken;
- (NSDictionary)debugParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)backgroundMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled;
- (void)setDebugParameters:(id)a3;
- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled;
- (void)setLongRangeEnabled:(BOOL)a3;
- (void)setPeerDiscoveryToken:(id)a3;
@end

@implementation NINearbyPeerConfiguration

- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken
{
  v6 = peerToken;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 461, @"Invalid parameter not satisfying: %@", @"peerToken" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NINearbyPeerConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (NINearbyPeerConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, peerToken);
    v8->_longRangeEnabled = 1;
    v8->_cameraAssistanceEnabled = 0;
    v8->_backgroundMode = 0LL;
    debugParameters = v8->_debugParameters;
    v8->_debugParameters = 0LL;

    v8->_extendedDistanceMeasurementEnabled = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NINearbyPeerConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v10, "copyWithZone:");
  [v5 setLongRangeEnabled:self->_longRangeEnabled];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v5 setBackgroundMode:self->_backgroundMode];
  id v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v6;

  if (self->_debugParameters)
  {
    v8 = -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self->_debugParameters,  1LL);
    [v5 setDebugParameters:v8];
  }

  *((_BYTE *)v5 + 33) = self->_extendedDistanceMeasurementEnabled;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NINearbyPeerConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeObject:self->_peerDiscoveryToken forKey:@"peerDiscoveryToken"];
  [v4 encodeBool:self->_longRangeEnabled forKey:@"longRangeEnabled"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeInteger:self->_backgroundMode forKey:@"backgroundMode"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
  [v4 encodeBool:self->_extendedDistanceMeasurementEnabled forKey:@"extendedDistanceMeasurementEnabled"];
}

- (NINearbyPeerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v5),  @"peerDiscoveryToken");
  id obj = (id)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v7 = [v4 decodeBoolForKey:@"longRangeEnabled"];
  unsigned __int8 v8 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
  id v9 = [v4 decodeIntegerForKey:@"backgroundMode"];
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeDictionaryWithKeysOfClasses:v12 objectsOfClasses:v15 forKey:@"debugParameters"]);
  unsigned __int8 v17 = [v4 decodeBoolForKey:@"extendedDistanceMeasurementEnabled"];
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NINearbyPeerConfiguration;
  v18 = -[NIConfiguration initWithCoder:](&v23, "initWithCoder:", v4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerDiscoveryToken, obj);
    v19->_longRangeEnabled = v7;
    v19->_cameraAssistanceEnabled = v8;
    objc_storeStrong((id *)&v19->_debugParameters, v16);
    else {
      int64_t v20 = (int64_t)v9;
    }
    v19->_backgroundMode = v20;
    v19->_extendedDistanceMeasurementEnabled = v17;
  }

  return v19;
}

- (NINearbyPeerConfiguration)init
{
}

+ (NINearbyPeerConfiguration)new
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    unsigned __int8 v7 = (NINearbyPeerConfiguration *)v4;
    unsigned __int8 v8 = v7;
    if (v7 == self)
    {
      BOOL v22 = 1;
LABEL_16:

      goto LABEL_17;
    }

    peerDiscoveryToken = self->_peerDiscoveryToken;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](v7, "peerDiscoveryToken"));
    unsigned int v11 = -[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v10);

    int longRangeEnabled = self->_longRangeEnabled;
    unsigned int v13 = -[NINearbyPeerConfiguration isLongRangeEnabled](v8, "isLongRangeEnabled");
    int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
    unsigned int v15 = -[NINearbyPeerConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
    int64_t backgroundMode = self->_backgroundMode;
    id v24 = -[NINearbyPeerConfiguration backgroundMode](v8, "backgroundMode");
    debugParameters = self->_debugParameters;
    if (!debugParameters)
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](v8, "debugParameters"));

      if (!v17)
      {
        unsigned __int8 v19 = 1;
        goto LABEL_7;
      }

      debugParameters = self->_debugParameters;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](v8, "debugParameters", v24));
    unsigned __int8 v19 = -[NSDictionary isEqual:](debugParameters, "isEqual:", v18);

LABEL_7:
    int extendedDistanceMeasurementEnabled = self->_extendedDistanceMeasurementEnabled;
    unsigned int v21 = -[NINearbyPeerConfiguration isExtendedDistanceMeasurementEnabled]( v8,  "isExtendedDistanceMeasurementEnabled",  v24);
    BOOL v22 = 0;
    if (v11 && longRangeEnabled == v13 && cameraAssistanceEnabled == v15 && backgroundMode == v25)
    {
      if (extendedDistanceMeasurementEnabled == v21) {
        BOOL v22 = v19;
      }
      else {
        BOOL v22 = 0;
      }
    }

    goto LABEL_16;
  }

  BOOL v22 = 0;
LABEL_17:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  BOOL longRangeEnabled = self->_longRangeEnabled;
  BOOL cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
  int64_t backgroundMode = self->_backgroundMode;
  return v3 ^ longRangeEnabled ^ cameraAssistanceEnabled ^ backgroundMode ^ (unint64_t)-[NSDictionary hash]( self->_debugParameters,  "hash") ^ self->_extendedDistanceMeasurementEnabled ^ 0x1F;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration descriptionInternal](self, "descriptionInternal"));
  id v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  unint64_t v3 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", &stru_1007C41E0);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Peer Token: %@", v5);
  }

  else
  {
    -[NSMutableString appendString:](v3, "appendString:", @"Peer Token: null");
  }

  if (self->_cameraAssistanceEnabled) {
    uint64_t v6 = "Yes";
  }
  else {
    uint64_t v6 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", isCameraAssistanceEnabled: %s", v6);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", backgroundMode: %s",  +[NIInternalUtils NISessionBackgroundModeToString:]( &OBJC_CLASS___NIInternalUtils,  "NISessionBackgroundModeToString:",  self->_backgroundMode));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](self->_debugParameters, "description"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", debugParameters:%@", v7);

  if (self->_longRangeEnabled) {
    unsigned __int8 v8 = "Yes";
  }
  else {
    unsigned __int8 v8 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", isLongRangeEnabled: %s", v8);
  if (self->_extendedDistanceMeasurementEnabled) {
    id v9 = "Yes";
  }
  else {
    id v9 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", isExtendedDistanceMeasurementEnabled: %s", v9);
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (void)setPeerDiscoveryToken:(id)a3
{
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_BOOL cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled
{
  self->_int extendedDistanceMeasurementEnabled = extendedDistanceMeasurementEnabled;
}

- (BOOL)isLongRangeEnabled
{
  return self->_longRangeEnabled;
}

- (void)setLongRangeEnabled:(BOOL)a3
{
  self->_BOOL longRangeEnabled = a3;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_int64_t backgroundMode = a3;
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDebugParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end