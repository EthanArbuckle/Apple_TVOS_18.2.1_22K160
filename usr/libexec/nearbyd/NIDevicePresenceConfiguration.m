@interface NIDevicePresenceConfiguration
+ (BOOL)_validateRegionIsPreset:(id)a3;
+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3;
+ (float)_radiusFromDevicePresencePreset:(int64_t)a3;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (NIDevicePresenceConfiguration)initWithCoder:(id)a3;
- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6;
- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5;
- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7;
- (NIDiscoveryToken)token;
- (NIRegionPredicate)innerBoundary;
- (NIRegionPredicate)outerBoundary;
- (NSArray)monitoredRegions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)allowedDevices;
- (unint64_t)hash;
- (unint64_t)monitoringOption;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedDevices:(unint64_t)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setMonitoringOption:(unint64_t)a3;
@end

@implementation NIDevicePresenceConfiguration

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIDevicePresenceConfiguration;
  v10 = -[NIConfiguration initInternal](&v22, "initInternal");
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = [v8 copy];
  v12 = (void *)v10[7];
  v10[7] = v11;

  id v13 = [v9 copy];
  v14 = (void *)v10[8];
  v10[8] = v13;

  v10[5] = 1LL;
  v10[6] = 2LL;
  if (!v9)
  {
    v15 = -[NIRegionPredicate initWithName:devicePresencePreset:]( objc_alloc(&OBJC_CLASS___NIRegionPredicate),  "initWithName:devicePresencePreset:",  @"default-max-sensor-region",  5LL);
    v16 = (void *)v10[8];
    v10[8] = v15;
  }

  v23[0] = v10[7];
  v23[1] = v10[8];
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  v18 = (void *)v10[9];
  v10[9] = v17;

  if (+[NIDevicePresenceConfiguration _validateRegionPredicates:outer:]( &OBJC_CLASS___NIDevicePresenceConfiguration,  "_validateRegionPredicates:outer:",  v10[7],  v10[8]))
  {
    *((_BYTE *)v10 + 32) = 0;
LABEL_6:
    v19 = v10;
    goto LABEL_10;
  }

  if (a5)
  {
    id v20 = sub_100192BA4(-10013LL, 0LL);
    v19 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v20);
  }

  else
  {
    v19 = 0LL;
  }

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v15 = (NIDevicePresenceConfiguration *)objc_msgSend( objc_alloc((Class)objc_opt_class(self, v14)),  "initWithInnerBoundary:outerBoundary:error:",  v12,  v13,  a7);

  if (v15)
  {
    v15->_allowedDevices = a6;
    v15->_monitoringOption = a5;
  }

  return v15;
}

- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v14 = objc_alloc((Class)objc_opt_class(self, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);
  uint64_t v17 = (NIDevicePresenceConfiguration *)[v14 initWithInnerBoundary:v15 outerBoundary:v16 error:a6];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_token, a3);
    v17->_allowedDevices = 2LL;
    v17->_monitoringOption = 1LL;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v18 = v12;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      do
      {
        v21 = 0LL;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v21), "setPreferredUpdateRate:", a5, (void)v25);
          v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v19);
    }

    objc_super v22 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v18, 1LL);
    monitoredRegions = v17->_monitoredRegions;
    v17->_monitoredRegions = v22;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NIDevicePresenceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v15, "copyWithZone:");
  [v5 setAllowedDevices:self->_allowedDevices];
  [v5 setMonitoringOption:self->_monitoringOption];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  id v6 = -[NIRegionPredicate copyWithZone:](self->_innerBoundary, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = -[NIRegionPredicate copyWithZone:](self->_outerBoundary, "copyWithZone:", a3);
  id v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = -[NSArray copyWithZone:](self->_monitoredRegions, "copyWithZone:", a3);
  id v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = -[NIDiscoveryToken copyWithZone:](self->_token, "copyWithZone:", a3);
  uint64_t v13 = (void *)v5[10];
  v5[10] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIDevicePresenceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeObject:self->_innerBoundary forKey:@"innerboundary"];
  [v4 encodeObject:self->_outerBoundary forKey:@"outerboundary"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
  [v4 encodeObject:self->_token forKey:@"token"];
  [v4 encodeInteger:self->_allowedDevices forKey:@"allowedDevices"];
  [v4 encodeInteger:self->_monitoringOption forKey:@"monitoringOption"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
}

- (NIDevicePresenceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NIDevicePresenceConfiguration;
  id v6 = -[NIConfiguration initWithCoder:](&v26, "initWithCoder:", v4);
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(NIRegionPredicate, v5),  @"monitoredRegions");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  monitoredRegions = v6->_monitoredRegions;
  v6->_monitoredRegions = (NSArray *)v8;

  id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIRegionPredicate, v10),  @"innerboundary");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  innerBoundary = v6->_innerBoundary;
  v6->_innerBoundary = (NIRegionPredicate *)v12;

  id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIRegionPredicate, v14),  @"outerboundary");
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  outerBoundary = v6->_outerBoundary;
  v6->_outerBoundary = (NIRegionPredicate *)v16;

  id v18 = [v4 decodeIntegerForKey:@"allowedDevices"];
  if (!+[NIInternalUtils isIntValidRelationshipSpecifier:]( &OBJC_CLASS___NIInternalUtils,  "isIntValidRelationshipSpecifier:",  v18)) {
    goto LABEL_5;
  }
  v6->_allowedDevices = (unint64_t)v18;
  id v19 = (char *)[v4 decodeIntegerForKey:@"monitoringOption"];
  if ((unint64_t)(v19 - 1) < 3)
  {
    v6->_monitoringOption = (unint64_t)v19;
    id v21 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v20),  @"token");
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    token = v6->_token;
    v6->_token = (NIDiscoveryToken *)v22;

    v6->_cameraAssistanceEnabled = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
    v24 = v6;
  }

  else
  {
LABEL_5:
    v24 = 0LL;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (NIDevicePresenceConfiguration *)v4;
    uint64_t v8 = v7;
    if (v7 == self)
    {
      BOOL v15 = 1;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration innerBoundary](v7, "innerBoundary"));
      unsigned int v10 = [v9 isEqual:self->_innerBoundary];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration outerBoundary](v8, "outerBoundary"));
      unsigned int v12 = [v11 isEqual:self->_outerBoundary];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration outerBoundary](v8, "outerBoundary"));
      if (v13) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = self->_outerBoundary == 0LL;
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration monitoredRegions](v8, "monitoredRegions"));
      unsigned int v17 = [v16 isEqualToArray:self->_monitoredRegions];

      id v18 = -[NIDevicePresenceConfiguration allowedDevices](v8, "allowedDevices");
      unsigned int v25 = v17;
      unint64_t allowedDevices = self->_allowedDevices;
      id v26 = -[NIDevicePresenceConfiguration monitoringOption](v8, "monitoringOption");
      unint64_t monitoringOption = self->_monitoringOption;
      uint64_t v20 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration token](v8, "token"));
      LODWORD(v16) = v10;
      token = self->_token;

      unsigned int v21 = -[NIDevicePresenceConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
      BOOL v15 = 0;
      if ((v16 & (v12 | v14)) == 1
        && v18 == (id)allowedDevices
        && v26 == (id)monitoringOption
        && ((v25 ^ 1) & 1) == 0)
      {
        BOOL v15 = v20 == token && self->_cameraAssistanceEnabled == v21;
      }
    }
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NIRegionPredicate hash](self->_innerBoundary, "hash");
  unint64_t v4 = -[NIRegionPredicate hash](self->_outerBoundary, "hash") ^ v3;
  unint64_t v5 = self->_allowedDevices ^ self->_monitoringOption;
  unint64_t v6 = v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_token, "hash");
  return v6 ^ (unint64_t)-[NSArray hash](self->_monitoredRegions, "hash") ^ self->_cameraAssistanceEnabled;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  unint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  unint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDevicePresenceConfiguration descriptionInternal](self, "descriptionInternal"));
  id v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  innerBoundary = self->_innerBoundary;
  outerBoundary = self->_outerBoundary;
  unint64_t v5 = +[NIInternalUtils NIRelationshipSpecifierToString:]( &OBJC_CLASS___NIInternalUtils,  "NIRelationshipSpecifierToString:",  self->_allowedDevices);
  unint64_t v6 = +[NIDevicePresenceConfiguration _NIDevicePresenceMonitoringOptionToString:]( &OBJC_CLASS___NIDevicePresenceConfiguration,  "_NIDevicePresenceMonitoringOptionToString:",  self->_monitoringOption);
  if (self->_cameraAssistanceEnabled) {
    id v7 = "Yes";
  }
  else {
    id v7 = "No";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<innerboundary: %@, outerboundary: %@, allowedDevices: %s, monitoringOption: %s>, isCameraAssistanceEnabled: %s",  innerBoundary,  outerBoundary,  v5,  v6,  v7);
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[NIDevicePresenceConfiguration _validateRegionIsPreset:]( &OBJC_CLASS___NIDevicePresenceConfiguration,  "_validateRegionIsPreset:",  v5)
    && +[NIDevicePresenceConfiguration _validateRegionIsPreset:]( &OBJC_CLASS___NIDevicePresenceConfiguration,  "_validateRegionIsPreset:",  v6))
  {
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:]( NIDevicePresenceConfiguration,  "_radiusFromDevicePresencePreset:",  [v6 devicePresencePreset]);
    float v8 = v7;
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:]( NIDevicePresenceConfiguration,  "_radiusFromDevicePresencePreset:",  [v5 devicePresencePreset]);
    BOOL v10 = v8 >= v9;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateRegionIsPreset:(id)a3
{
  return [a3 devicePresencePreset] != 0;
}

+ (float)_radiusFromDevicePresencePreset:(int64_t)a3
{
  else {
    return flt_1004281B0[a3 - 1];
  }
}

+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return "N/A";
  }
  else {
    return (&off_1007B6488)[a3 - 1];
  }
}

- (unint64_t)monitoringOption
{
  return self->_monitoringOption;
}

- (void)setMonitoringOption:(unint64_t)a3
{
  self->_unint64_t monitoringOption = a3;
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_unint64_t allowedDevices = a3;
}

- (NIRegionPredicate)innerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 56LL, 1);
}

- (NIRegionPredicate)outerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (NIDiscoveryToken)token
{
  return (NIDiscoveryToken *)objc_getProperty(self, a2, 80LL, 1);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (void).cxx_destruct
{
}

@end