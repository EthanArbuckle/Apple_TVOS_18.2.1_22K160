@interface NIFindingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)localDeviceConfiguration;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsCameraAssistanceInClientProcess;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isCameraAssistanceInClientProcess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinder;
- (BOOL)isObserver;
- (NIDiscoveryToken)findingDiscoveryToken;
- (NIDiscoveryToken)sessionDiscoveryToken;
- (NIDiscoveryToken)specifiedToken;
- (NIFindingConfiguration)initWithCoder:(id)a3;
- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5;
- (NSDictionary)debugParameters;
- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)configType;
- (int64_t)preferredUpdateRate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setCameraAssistanceInClientProcess:(BOOL)a3;
- (void)setConfigType:(int64_t)a3;
- (void)setDebugParameters:(id)a3;
- (void)setIsFinder:(BOOL)a3;
- (void)setIsObserver:(BOOL)a3;
- (void)setPreferredUpdateRate:(int64_t)a3;
- (void)setSpecifiedToken:(id)a3;
@end

@implementation NIFindingConfiguration

+ (id)localDeviceConfiguration
{
  return  -[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:]( objc_alloc(&OBJC_CLASS___NIFindingConfiguration),  "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:",  2LL,  0LL,  0LL,  0LL,  3LL);
}

- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5
{
  return (NIFindingConfiguration *)-[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:]( self,  "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:",  1LL,  (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0,  (a3 & 0xFFFFFFFFFFFFFFFELL) == 2,  a4,  a5);
}

- (NIDiscoveryToken)sessionDiscoveryToken
{
  return self->_specifiedToken;
}

- (NIDiscoveryToken)findingDiscoveryToken
{
  return self->_specifiedToken;
}

- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7
{
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NIFindingConfiguration;
  v14 = -[NIConfiguration initInternal](&v18, "initInternal");
  v15 = v14;
  if (v14)
  {
    *((_BYTE *)v14 + 34) = a4;
    *((_BYTE *)v14 + 35) = a5;
    v14[6] = (id)a3;
    objc_storeStrong(v14 + 7, a6);
    v15[5] = (id)a7;
    *((_BYTE *)v15 + 32) = 0;
    *((_BYTE *)v15 + 33) = 1;
    id v16 = v15[8];
    v15[8] = 0LL;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIFindingConfiguration;
  id v4 = -[NIConfiguration copyWithZone:](&v8, "copyWithZone:", a3);
  [v4 setIsFinder:self->_isFinder];
  [v4 setIsObserver:self->_isObserver];
  [v4 setConfigType:self->_configType];
  id v5 = -[NIDiscoveryToken copy](self->_specifiedToken, "copy");
  [v4 setSpecifiedToken:v5];

  [v4 setPreferredUpdateRate:self->_preferredUpdateRate];
  [v4 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v4 setCameraAssistanceInClientProcess:self->_cameraAssistanceInClientProcess];
  id v6 = -[NSDictionary copy](self->_debugParameters, "copy");
  [v4 setDebugParameters:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIFindingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeBool:self->_isFinder forKey:@"isFinder"];
  [v4 encodeBool:self->_isObserver forKey:@"isObserver"];
  [v4 encodeInteger:self->_configType forKey:@"configType"];
  [v4 encodeObject:self->_specifiedToken forKey:@"specifiedToken"];
  [v4 encodeInteger:self->_preferredUpdateRate forKey:@"preferredUpdateRate"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeBool:self->_cameraAssistanceInClientProcess forKey:@"cameraAssistanceInClientProcess"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
}

- (NIFindingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NIFindingConfiguration;
  objc_super v5 = -[NIConfiguration initWithCoder:](&v27, "initWithCoder:", v4);
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeBoolForKey:@"isFinder"];
    unsigned __int8 v7 = [v4 decodeBoolForKey:@"isObserver"];
    id v8 = [v4 decodeIntegerForKey:@"configType"];
    id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v9),  @"specifiedToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((!v12
       || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NIDiscoveryToken, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
      && (id v14 = [v4 decodeIntegerForKey:@"preferredUpdateRate"],
          +[NIInternalUtils isIntValidNearbyObjectUpdateRate:]( &OBJC_CLASS___NIInternalUtils,  "isIntValidNearbyObjectUpdateRate:",  v14)))
    {
      unsigned __int8 v25 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
      unsigned __int8 v26 = v6;
      unsigned __int8 v24 = [v4 decodeBoolForKey:@"cameraAssistanceInClientProcess"];
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString, v15);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

      uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeDictionaryWithKeysOfClasses:v17 objectsOfClasses:v20 forKey:@"debugParameters"]);
      v5->_isFinder = v26;
      v5->_isObserver = v7;
      if (v8 == (id)1)
      {
        v5->_configType = 1LL;
        objc_storeStrong((id *)&v5->_specifiedToken, v12);
        v5->_preferredUpdateRate = (int64_t)v14;
        v5->_cameraAssistanceEnabled = v25;
        v5->_cameraAssistanceInClientProcess = v24;
        objc_storeStrong((id *)&v5->_debugParameters, v21);
        v22 = v5;
      }

      else
      {
        v22 = 0LL;
      }
    }

    else
    {
      v22 = 0LL;
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIFindingConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v18 = 1;
    }

    else
    {
      unsigned int v6 = -[NIFindingConfiguration isFinder](v4, "isFinder");
      int isFinder = self->_isFinder;
      unsigned int v8 = -[NIFindingConfiguration isObserver](v5, "isObserver");
      BOOL isObserver = self->_isObserver;
      id v24 = -[NIFindingConfiguration configType](v5, "configType");
      int v23 = isObserver;
      int64_t configType = self->_configType;
      unint64_t specifiedToken = (unint64_t)v5->_specifiedToken;
      v12 = self->_specifiedToken;
      unsigned int v13 = [(id)specifiedToken isEqual:v12];
      else {
        int v14 = 1;
      }
      unsigned int v15 = -[NIFindingConfiguration isCameraAssistanceEnabled](v5, "isCameraAssistanceEnabled");
      int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      unsigned int v17 = -[NIFindingConfiguration isCameraAssistanceInClientProcess](v5, "isCameraAssistanceInClientProcess");
      BOOL v18 = 0;
      BOOL v20 = isFinder == v6 && v23 == v8 && v24 == (id)configType;
      if (v20 && ((v14 ^ 1) & 1) == 0) {
        BOOL v18 = cameraAssistanceEnabled == v15 && self->_cameraAssistanceInClientProcess == v17;
      }
    }
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    unsigned __int8 v7 = (NIFindingConfiguration *)v4;
    if (v7 == self)
    {
      BOOL v14 = 1;
    }

    else if (-[NIFindingConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v7))
    {
      id v8 = -[NIFindingConfiguration preferredUpdateRate](v7, "preferredUpdateRate");
      int64_t preferredUpdateRate = self->_preferredUpdateRate;
      debugParameters = v7->_debugParameters;
      uint64_t v11 = self->_debugParameters;
      unsigned __int8 v12 = -[NSDictionary isEqualToDictionary:](debugParameters, "isEqualToDictionary:", v11);
      else {
        char v13 = 1;
      }
      if (v8 == (id)preferredUpdateRate) {
        BOOL v14 = v13;
      }
      else {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_isFinder ^ self->_isObserver ^ 0x1Fu;
  int64_t configType = self->_configType;
  unint64_t v5 = configType ^ -[NIDiscoveryToken hash](self->_specifiedToken, "hash") ^ self->_preferredUpdateRate ^ v3;
  unint64_t v6 = self->_cameraAssistanceEnabled ^ (unint64_t)self->_cameraAssistanceInClientProcess;
  return v5 ^ v6 ^ (unint64_t)-[NSDictionary hash](self->_debugParameters, "hash");
}

- (id)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  unint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  unint64_t v6 = NSStringFromClass(v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIFindingConfiguration descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  BOOL isFinder = self->_isFinder;
  BOOL isObserver = self->_isObserver;
  int64_t configType = self->_configType;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_specifiedToken, "descriptionInternal"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<finder: %d [observer %d], cfg-type: %d, ses-token: %@, rate: %s, camera: %d [client %d], debug-params: %@>",  isFinder,  isObserver,  configType,  v6,  +[NIInternalUtils NINearbyObjectUpdateRateToString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToString:",  self->_preferredUpdateRate),  self->_cameraAssistanceEnabled,  self->_cameraAssistanceInClientProcess,  self->_debugParameters));

  return v7;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_int64_t preferredUpdateRate = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_int cameraAssistanceEnabled = a3;
}

- (BOOL)isCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (void)setCameraAssistanceInClientProcess:(BOOL)a3
{
  self->_cameraAssistanceInClientProcess = a3;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (void)setIsFinder:(BOOL)a3
{
  self->_BOOL isFinder = a3;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_BOOL isObserver = a3;
}

- (int64_t)configType
{
  return self->_configType;
}

- (void)setConfigType:(int64_t)a3
{
  self->_int64_t configType = a3;
}

- (NIDiscoveryToken)specifiedToken
{
  return self->_specifiedToken;
}

- (void)setSpecifiedToken:(id)a3
{
}

- (NSDictionary)debugParameters
{
  return self->_debugParameters;
}

- (void)setDebugParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end