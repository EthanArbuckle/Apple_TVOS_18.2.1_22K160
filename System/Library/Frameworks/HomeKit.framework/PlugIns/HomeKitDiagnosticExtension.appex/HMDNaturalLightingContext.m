@interface HMDNaturalLightingContext
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingContext)initWithCoder:(id)a3;
- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4;
- (HMDNaturalLightingCurve)curve;
- (NSTimeZone)timeZone;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDNaturalLightingContext

- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___HMDNaturalLightingContext;
  v8 = -[HMDNaturalLightingContext init](&v14, "init");
  if (v8)
  {
    v9 = (HMDNaturalLightingCurve *)[v6 copy];
    curve = v8->_curve;
    v8->_curve = v9;

    v11 = (NSTimeZone *)[v7 copy];
    timeZone = v8->_timeZone;
    v8->_timeZone = v11;
  }

  return v8;
}

- (HMDNaturalLightingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(HMDNaturalLightingCurve) forKey:@"HHNLC.cck"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSTimeZone) forKey:@"HHNLC.tzk"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = -[HMDNaturalLightingContext initWithCurve:timeZone:](self, "initWithCurve:timeZone:", v6, v8);
      v10 = v9;
    }

    else
    {
      v16 = objc_autoreleasePoolPush();
      v9 = self;
      uint64_t v17 = HMFGetOSLogHandle(v9);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier(v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        int v22 = 138543362;
        v23 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to decode time zone",  (uint8_t *)&v22,  0xCu);
      }

      objc_autoreleasePoolPop(v16);
      v10 = 0LL;
    }
  }

  else
  {
    v11 = objc_autoreleasePoolPush();
    v9 = self;
    uint64_t v12 = HMFGetOSLogHandle(v9);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v22 = 138543362;
      v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to decode curve",  (uint8_t *)&v22,  0xCu);
    }

    objc_autoreleasePoolPop(v11);
    v10 = 0LL;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext curve](self, "curve"));
  [v4 encodeObject:v5 forKey:@"HHNLC.cck"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext timeZone](self, "timeZone"));
  [v4 encodeObject:v6 forKey:@"HHNLC.tzk"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___HMDNaturalLightingContext);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 curve]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext curve](self, "curve"));
    if ([v9 isEqual:v10])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 timeZone]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 timeZone]);
      unsigned __int8 v13 = [v11 isEqual:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext curve](self, "curve"));
  unint64_t v4 = (unint64_t)[v3 hash];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext timeZone](self, "timeZone"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext curve](self, "curve"));
  id v5 = [v3 initWithName:@"Curve" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingContext timeZone](self, "timeZone"));
  id v8 = [v6 initWithName:@"Time Zone" value:v7];
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  return v9;
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (qword_100032D40 != -1) {
    dispatch_once(&qword_100032D40, &stru_100028AB8);
  }
  return (id)qword_100032D48;
}

@end