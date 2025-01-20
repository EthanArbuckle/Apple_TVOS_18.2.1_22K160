@interface HMDNaturalLightingCurve
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (int64_t)colorTemperatureMiredsFromKelvins:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingCurve)initWithCoder:(id)a3;
- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5;
- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8;
- (NSArray)transitionPoints;
- (id)attributeDescriptions;
- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)transitionPointsWithmillisecondsElapsedSinceStartOfDay:(unint64_t)a3;
- (int64_t)maximumBrightness;
- (int64_t)maximumColorTemperature;
- (int64_t)minimumBrightness;
- (int64_t)minimumColorTemperature;
- (unint64_t)checksum;
- (unint64_t)colorTemperatureNotifyIntervalThresholdInMilliseconds;
- (unint64_t)colorTemperatureNotifyValueChangeThreshold;
- (unint64_t)colorTemperatureUpdateIntervalInMilliseconds;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setColorTemperatureNotifyIntervalThresholdInMilliseconds:(unint64_t)a3;
- (void)setColorTemperatureNotifyValueChangeThreshold:(unint64_t)a3;
- (void)setColorTemperatureUpdateIntervalInMilliseconds:(unint64_t)a3;
@end

@implementation HMDNaturalLightingCurve

- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8
{
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___HMDNaturalLightingCurve;
  v15 = -[HMDNaturalLightingCurve init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    v15->_version = a3;
    v17 = (NSArray *)[v14 copy];
    transitionPoints = v16->_transitionPoints;
    v16->_transitionPoints = v17;

    v16->_minimumBrightness = a5;
    v16->_maximumBrightness = a6;
    v16->_minimumColorTemperature = a7;
    v16->_maximumColorTemperature = a8;
  }

  return v16;
}

- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionPoints]);
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 transitionPoints]);
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  if (v39)
  {
    uint64_t v36 = *(void *)v41;
    id v33 = v6;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "colorTemperatureForBrightness:", objc_msgSend(v6, "minimumBrightness"));
        int64_t v13 = (int64_t)v12;
        else {
          int64_t v14 = (int64_t)v12;
        }
        else {
          int64_t v15 = a5;
        }
        id v16 = objc_msgSend(v11, "colorTemperatureForBrightness:", objc_msgSend(v6, "maximumBrightness"));
        else {
          int64_t v17 = (int64_t)v16;
        }
        else {
          int64_t v18 = a5;
        }
        if ((uint64_t)v16 > a5 || (uint64_t)v16 < a4 || v13 > a5 || v13 < a4)
        {
          id v35 = [v6 minimumBrightness];
          id v22 = [v6 maximumBrightness];
          v23 = (void *)objc_claimAutoreleasedReturnValue([v11 targetCompletionDuration]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 value]);
          id v25 = (id)objc_claimAutoreleasedReturnValue( +[HAPCharacteristicValueLinearDerivedTransitionPoint transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:]( HAPCharacteristicValueLinearDerivedTransitionPoint,  "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximum BrightnessColorTemperature:targetCompletionDuration:",  v35,  v15,  v22,  v18,  [v24 unsignedLongLongValue]));

          id v6 = v33;
        }

        else
        {
          id v25 = [v11 copy];
        }

        [v38 addObject:v25];
        if (v15 >= v18) {
          int64_t v26 = v18;
        }
        else {
          int64_t v26 = v15;
        }
        if (v9 >= v26) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = v9;
        }
        if (v9 <= 0) {
          uint64_t v9 = v26;
        }
        else {
          uint64_t v9 = v27;
        }
        if (v18 <= v15) {
          int64_t v28 = v15;
        }
        else {
          int64_t v28 = v18;
        }
        if (v8 <= v28) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = v8;
        }
        if (v8 <= 0) {
          uint64_t v8 = v28;
        }
        else {
          uint64_t v8 = v29;
        }
      }

      id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v39);
  }

  v30 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]( self,  "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:",  [v6 version],  v38,  objc_msgSend(v6, "minimumBrightness"),  objc_msgSend(v6, "maximumBrightness"),  v9,  v8);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:]( v30,  "setColorTemperatureNotifyIntervalThresholdInMilliseconds:",  [v6 colorTemperatureNotifyIntervalThresholdInMilliseconds]);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:]( v30,  "setColorTemperatureNotifyValueChangeThreshold:",  [v6 colorTemperatureNotifyValueChangeThreshold]);
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:]( v30,  "setColorTemperatureUpdateIntervalInMilliseconds:",  [v6 colorTemperatureUpdateIntervalInMilliseconds]);

  return v30;
}

- (HMDNaturalLightingCurve)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"HNLCurve.vk"];
  if (v5 != (id)1)
  {
    id v21 = v5;
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v22 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v23 = HMFGetLogIdentifier(self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138543874;
    v77 = v24;
    __int16 v78 = 2048;
    id v79 = v21;
    __int16 v80 = 2048;
    uint64_t v81 = 1LL;
    id v25 = "%{public}@Curve version is not equal to (%ld != %ld)";
    int64_t v26 = v15;
    uint32_t v27 = 32;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);

    goto LABEL_25;
  }

  id v6 = [v4 decodeIntegerForKey:@"HNLCurve.mabk"];
  if ((uint64_t)v6 <= 0)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v28 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v29 = HMFGetLogIdentifier(self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138543618;
    v77 = v24;
    __int16 v78 = 2048;
    id v79 = v6;
    id v25 = "%{public}@Maximum brightness is less than or equal to 0: %ld";
    int64_t v26 = v15;
    uint32_t v27 = 22;
    goto LABEL_14;
  }

  id v7 = [v4 decodeIntegerForKey:@"HNLCurve.mibk"];
  id v8 = v7;
  if ((uint64_t)v7 <= 0)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v30 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v31 = HMFGetLogIdentifier(self);
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 138543618;
    v77 = v17;
    __int16 v78 = 2048;
    id v79 = v8;
    int64_t v18 = "%{public}@Minimum brightness is less than or equal to 0: %ld";
LABEL_23:
    v19 = v15;
    uint32_t v20 = 22;
    goto LABEL_24;
  }

  if (v7 >= v6)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v32 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = HMFGetLogIdentifier(self);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138543874;
      v77 = v34;
      __int16 v78 = 2048;
      id v79 = v8;
      __int16 v80 = 2048;
      uint64_t v81 = (uint64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@Minimum brightness is greater than equal to maximum brightness (%ld:%ld)",  buf,  0x20u);
    }

    goto LABEL_25;
  }

  id v9 = [v4 decodeIntegerForKey:@"HNLCurve.mictk"];
  if ((uint64_t)v9 <= 0)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v35 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v36 = HMFGetLogIdentifier(self);
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v36);
    *(_DWORD *)buf = 138543618;
    v77 = v17;
    __int16 v78 = 2048;
    id v79 = v9;
    int64_t v18 = "%{public}@Minimum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }

  id v10 = [v4 decodeIntegerForKey:@"HNLCurve.mactk"];
  if (!v10)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v37 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v38 = HMFGetLogIdentifier(self);
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v38);
    *(_DWORD *)buf = 138543618;
    v77 = v17;
    __int16 v78 = 2048;
    id v79 = 0LL;
    int64_t v18 = "%{public}@Maximum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }

  uint64_t v12 = (uint64_t)v10;
  if ((uint64_t)v9 > (uint64_t)v10)
  {
    int64_t v13 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v14 = HMFGetOSLogHandle(self);
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier(self);
      int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138543874;
      v77 = v17;
      __int16 v78 = 2048;
      id v79 = v9;
      __int16 v80 = 2048;
      uint64_t v81 = v12;
      int64_t v18 = "%{public}@Minimum color temperature is greater than maximum color temperature (%ld:%ld)";
      v19 = v15;
      uint32_t v20 = 32;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve version](self, "version"), @"HNLCurve.vk");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"),  @"HNLCurve.mibk");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"),  @"HNLCurve.mabk");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"),  @"HNLCurve.mictk");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"),  @"HNLCurve.mactk");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold"),  @"HNLCurve.ctnvctk");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds"),  @"HNLCurve.ctnitk");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds"),  @"HNLCurve.ctuik");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        id v20 = 0LL;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serializeWithError:&v20]);
        id v13 = v20;
        if (!v12)
        {
          uint64_t v14 = objc_autoreleasePoolPush();
          int64_t v15 = self;
          uint64_t v16 = HMFGetOSLogHandle(v15);
          int64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = HMFGetLogIdentifier(v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            *(_DWORD *)buf = 138543874;
            int64_t v26 = v19;
            __int16 v27 = 2112;
            uint64_t v28 = v11;
            __int16 v29 = 2112;
            id v30 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to serialize transition point %@:%@",  buf,  0x20u);
          }

          objc_autoreleasePoolPop(v14);
          goto LABEL_13;
        }

        [v5 addObject:v12];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v6 = [v5 copy];
  [v4 encodeObject:v6 forKey:@"HNLCurve.tpk"];
LABEL_13:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDNaturalLightingCurve, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }
  id v8 = v7;
  uint64_t v9 = v8;
  if (v8
    && (id v10 = [v8 version], v10 == (id)-[HMDNaturalLightingCurve version](self, "version"))
    && (id v11 = [v9 minimumBrightness],
        v11 == (id)-[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"))
    && (id v12 = [v9 maximumBrightness],
        v12 == (id)-[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness")))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 transitionPoints]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
    if ([v13 isEqual:v14]
      && (id v15 = [v9 minimumColorTemperature],
          v15 == (id)-[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"))
      && (id v16 = [v9 maximumColorTemperature],
          v16 == (id)-[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"))
      && (id v17 = [v9 colorTemperatureNotifyIntervalThresholdInMilliseconds],
          v17 == (id)-[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds"))
      && (id v18 = [v9 colorTemperatureNotifyValueChangeThreshold],
          v18 == (id)-[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold")))
    {
      id v19 = [v9 colorTemperatureUpdateIntervalInMilliseconds];
      BOOL v20 = v19 == (id)-[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds");
    }

    else
    {
      BOOL v20 = 0;
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = -[HMDNaturalLightingCurve version](self, "version");
  unint64_t v4 = -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness") ^ v3;
  unint64_t v5 = v4 ^ -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  unint64_t v7 = (unint64_t)[v6 count];

  unint64_t v8 = v5 ^ v7 ^ -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature");
  int64_t v9 = -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature");
  unint64_t v10 = v9 ^ -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds");
  unint64_t v11 = v10 ^ -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds");
  return v8 ^ v11 ^ -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[HMDMutableNaturalLightingCurve allocWithZone:]( &OBJC_CLASS___HMDMutableNaturalLightingCurve,  "allocWithZone:",  a3);
  unint64_t v5 = -[HMDNaturalLightingCurve version](self, "version");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  unint64_t v7 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]( v4,  "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:",  v5,  v6,  -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"),  -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"),  -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"),  -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));

  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:]( v7,  "setColorTemperatureNotifyIntervalThresholdInMilliseconds:",  -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:]( v7,  "setColorTemperatureNotifyValueChangeThreshold:",  -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold"));
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:]( v7,  "setColorTemperatureUpdateIntervalInMilliseconds:",  -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds"));
  return v7;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[HMDNaturalLightingCurve version](self, "version")));
  id v38 = [v3 initWithName:@"Version" value:v39];
  v40[0] = v38;
  id v4 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness")));
  id v36 = [v4 initWithName:@"Minimum Brightness" value:v37];
  v40[1] = v36;
  id v5 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness")));
  id v34 = [v5 initWithName:@"Maximum Brightness" value:v35];
  v40[2] = v34;
  id v6 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v33 count]));
  id v31 = [v6 initWithName:@"Transition Points Count" value:v32];
  v40[3] = v31;
  id v7 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]);
  id v28 = [v7 initWithName:@"Transition Start Point" value:v29];
  v40[4] = v28;
  id v8 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature")));
  id v26 = [v8 initWithName:@"Minimum Color Temperature" value:v27];
  v40[5] = v26;
  id v9 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature")));
  id v10 = [v9 initWithName:@"Maximum Color Temperature" value:v25];
  v40[6] = v10;
  id v11 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds")));
  id v13 = [v11 initWithName:@"Color Temperature Notify Interval Threshold In Milliseconds" value:v12];
  v40[7] = v13;
  id v14 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold")));
  id v16 = [v14 initWithName:@"Color Temperature Notify Value Change Threshold" value:v15];
  v40[8] = v16;
  id v17 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds")));
  id v19 = [v17 initWithName:@"Color Temperature Update Interval In Milliseconds" value:v18];
  v40[9] = v19;
  id v20 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[HMDNaturalLightingCurve checksum](self, "checksum")));
  id v22 = [v20 initWithName:@"Transition Checksum" value:v21];
  v40[10] = v22;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 11LL));

  return v23;
}

- (unint64_t)checksum
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        *(_DWORD *)data = objc_msgSend( v8,  "colorTemperatureForBrightness:",  -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
        CC_SHA256_Update(&c, data, 4u);
        LODWORD(v11) = objc_msgSend( v8,  "colorTemperatureForBrightness:",  -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
        CC_SHA256_Update(&c, &v11, 4u);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v5);
  }

  unsigned int v12 = -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold");
  CC_SHA256_Update(&c, &v12, 4u);
  unint64_t v11 = -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds");
  CC_SHA256_Update(&c, &v11, 8u);
  unint64_t v10 = -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds");
  CC_SHA256_Update(&c, &v10, 8u);
  CC_SHA256_Final(data, &c);
  return *(void *)data;
}

- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[HMDNaturalLightingCurve transitionPointsWithmillisecondsElapsedSinceStartOfDay:]( self,  "transitionPointsWithmillisecondsElapsedSinceStartOfDay:",  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  if (!v8)
  {
    unint64_t v10 = 0LL;
    goto LABEL_11;
  }

  if (-[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness") > a3)
  {
    int64_t v9 = -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness");
LABEL_7:
    a3 = v9;
    goto LABEL_8;
  }

  if (-[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness") < a3)
  {
    int64_t v9 = -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness");
    goto LABEL_7;
  }

- (id)transitionPointsWithmillisecondsElapsedSinceStartOfDay:(unint64_t)a3
{
  id v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  int64_t v6 = -[HMDNaturalLightingCurve minimumBrightness](v4, "minimumBrightness");
  int64_t v7 = -[HMDNaturalLightingCurve maximumBrightness](v4, "maximumBrightness");
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id obj = v5;
  id v8 = (char *)[obj countByEnumeratingWithState:&v88 objects:v96 count:16];
  if (v8)
  {
    int64_t v9 = v8;
    int64_t v79 = v7;
    int64_t v80 = v6;
    unint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v89;
    v84 = v4;
LABEL_3:
    __int128 v14 = 0LL;
    v86 = v10;
    v82 = &v9[(void)v10];
    unint64_t v15 = (unint64_t)v11;
    __int128 v16 = v12;
    while (1)
    {
      if (*(void *)v89 != v13) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)v14);
      int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "targetCompletionDuration", v79));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
      unint64_t v11 = (char *)[v19 unsignedLongLongValue] + v15;

      if (v11 == (char *)a3)
      {
        unint64_t v20 = (unint64_t)&v14[(void)v86];
        unint64_t v11 = (char *)a3;
        goto LABEL_16;
      }

      id v12 = v17;

      ++v14;
      unint64_t v15 = (unint64_t)v11;
      __int128 v16 = v12;
      if (v9 == v14)
      {
        int64_t v9 = (char *)[obj countByEnumeratingWithState:&v88 objects:v96 count:16];
        unint64_t v10 = v82;
        id v4 = v84;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    unint64_t v20 = (unint64_t)&v14[(void)v86];
LABEL_16:
    id v21 = v17;

    if (!v21)
    {
      id v4 = v84;
      goto LABEL_23;
    }

    __int16 v22 = &v11[-a3];
    if ((uint64_t)&v11[-a3] >= 0)
    {
      __int128 v23 = obj;
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[obj count] + 1));
      if (v11 == (char *)a3)
      {
        id v25 = [[HAPTLVUnsignedNumberValue alloc] initWithValue:&off_10002B440];
        id v26 = v21;
        id v27 = objc_alloc(&OBJC_CLASS___HAPCharacteristicValueLinearDerivedTransitionPoint);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 scale]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 offset]);
        id v30 = [v27 initWithScale:v28 offset:v29 targetCompletionDuration:v25 startDelayDuration:0];

        [v24 addObject:v30];
        for (unint64_t i = v20 + 1; i < (unint64_t)[obj count]; ++i)
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([obj objectAtIndex:i]);
          [v24 addObject:v32];
        }

        if (v20)
        {
          for (unint64_t j = 1LL; j <= v20; ++j)
          {
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([obj objectAtIndex:j]);
            [v24 addObject:v61];
          }
        }

        id v21 = v26;
      }

      else if (v16)
      {
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v21 targetCompletionDuration]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 value]);
        v49 = (char *)((_BYTE *)[v48 unsignedLongLongValue] - v22);

        id v50 = objc_alloc(&OBJC_CLASS___HAPTLVUnsignedNumberValue);
        id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22));
        id v52 = [v50 initWithValue:v51];

        v83 = v49;
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[HAPCharacteristicValueLinearDerivedTransitionPoint transitionPointWithPreviousTransitionPoint:nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:]( &OBJC_CLASS___HAPCharacteristicValueLinearDerivedTransitionPoint,  "transitionPointWithPreviousTransitionPoint:nextTransitionPoint:timeElapsedSincePreviousTransit ionPoint:minimumBrightness:maximumBrightness:",  v16,  v21,  v49,  v80,  v79));
        objc_msgSend(v24, "addObject:");
        id v54 = objc_alloc(&OBJC_CLASS___HAPCharacteristicValueLinearDerivedTransitionPoint);
        v55 = (void *)objc_claimAutoreleasedReturnValue([v21 scale]);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v21 offset]);
        v85 = v52;
        id v57 = [v54 initWithScale:v55 offset:v56 targetCompletionDuration:v52 startDelayDuration:0];

        uint64_t v81 = v57;
        [v24 addObject:v57];
        for (unint64_t k = v20 + 1; k < (unint64_t)[obj count]; ++k)
        {
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([obj objectAtIndex:k]);
          [v24 addObject:v59];
        }

        if (v20 >= 2)
        {
          uint64_t v62 = 1LL;
          do
          {
            id v63 = (void *)objc_claimAutoreleasedReturnValue([obj objectAtIndex:v62]);
            [v24 addObject:v63];

            ++v62;
          }

          while (&v14[(void)v86] != (char *)v62);
        }

        id v64 = objc_alloc(&OBJC_CLASS___HAPCharacteristicValueLinearDerivedTransitionPoint);
        v65 = v53;
        v66 = (void *)objc_claimAutoreleasedReturnValue([v53 scale]);
        v67 = (void *)objc_claimAutoreleasedReturnValue([v53 offset]);
        id v68 = objc_alloc(&OBJC_CLASS___HAPTLVUnsignedNumberValue);
        id v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v83));
        id v70 = [v68 initWithValue:v69];
        id v71 = [v64 initWithScale:v66 offset:v67 targetCompletionDuration:v70 startDelayDuration:0];

        [v24 addObject:v71];
        __int128 v23 = obj;
      }

      else
      {
        __int128 v72 = objc_autoreleasePoolPush();
        __int128 v73 = v84;
        uint64_t v74 = HMFGetOSLogHandle(v73);
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          uint64_t v76 = HMFGetLogIdentifier(v73);
          v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          *(_DWORD *)buf = 138543618;
          v93 = v77;
          __int16 v94 = 2048;
          unint64_t v95 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "%{public}@Next transition point for current time: %llums not found",  buf,  0x16u);
        }

        objc_autoreleasePoolPop(v72);
        __int128 v23 = obj;
      }

      id v39 = [v24 copy];

      goto LABEL_46;
    }

    __int128 v40 = v21;
    uint64_t v41 = objc_autoreleasePoolPush();
    __int128 v42 = v84;
    uint64_t v43 = HMFGetOSLogHandle(v42);
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = HMFGetLogIdentifier(v42);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138543618;
      v93 = v46;
      __int16 v94 = 2048;
      unint64_t v95 = (unint64_t)v22;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%{public}@Time to reach next transiton point is negative: %lldms",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v41);
  }

  else
  {
    id v12 = 0LL;
LABEL_13:

    __int128 v16 = v12;
LABEL_23:
    uint64_t v33 = objc_autoreleasePoolPush();
    id v34 = v4;
    uint64_t v35 = HMFGetOSLogHandle(v34);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = HMFGetLogIdentifier(v34);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138543618;
      v93 = v38;
      __int16 v94 = 2048;
      unint64_t v95 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@Next transition point for current time: %llums not found",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v33);
  }

  id v39 = &__NSArray0__struct;
  __int128 v23 = obj;
LABEL_46:

  return v39;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)transitionPoints
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (int64_t)minimumBrightness
{
  return self->_minimumBrightness;
}

- (int64_t)maximumBrightness
{
  return self->_maximumBrightness;
}

- (int64_t)minimumColorTemperature
{
  return self->_minimumColorTemperature;
}

- (int64_t)maximumColorTemperature
{
  return self->_maximumColorTemperature;
}

- (unint64_t)colorTemperatureNotifyValueChangeThreshold
{
  return self->_colorTemperatureNotifyValueChangeThreshold;
}

- (void)setColorTemperatureNotifyValueChangeThreshold:(unint64_t)a3
{
  self->_colorTemperatureNotifyValueChangeThreshold = a3;
}

- (unint64_t)colorTemperatureNotifyIntervalThresholdInMilliseconds
{
  return self->_colorTemperatureNotifyIntervalThresholdInMilliseconds;
}

- (void)setColorTemperatureNotifyIntervalThresholdInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureNotifyIntervalThresholdInMilliseconds = a3;
}

- (unint64_t)colorTemperatureUpdateIntervalInMilliseconds
{
  return self->_colorTemperatureUpdateIntervalInMilliseconds;
}

- (void)setColorTemperatureUpdateIntervalInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureUpdateIntervalInMilliseconds = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)colorTemperatureMiredsFromKelvins:(int64_t)a3
{
  if (a3) {
    return 1000000 / a3;
  }
  id v4 = (void *)_HMFPreconditionFailure(@"colorTemperatureInKelvin", a2);
  return (int64_t)+[HMDNaturalLightingCurve logCategory](v4, v5);
}

+ (id)logCategory
{
  if (qword_100032CA0 != -1) {
    dispatch_once(&qword_100032CA0, &stru_100028958);
  }
  return (id)qword_100032CA8;
}

@end