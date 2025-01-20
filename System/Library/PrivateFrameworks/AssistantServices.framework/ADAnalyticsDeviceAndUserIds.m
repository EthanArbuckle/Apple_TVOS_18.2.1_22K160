@interface ADAnalyticsDeviceAndUserIds
+ (id)_deviceAggregationIdNamespace;
+ (id)deviceAggregationIdWithDeviceId:(id)a3 forUserAggregationId:(id)a4;
- (ADAnalyticsDeviceAndUserIds)initWithFixedDeviceId:(id)a3 withUserEphemeralId:(id)a4 withUserAggregationId:(id)a5 withUserAggregationIdEffectiveFrom:(id)a6 withUserAggregationIdExpiration:(id)a7;
- (NSDate)userAggregationIdEffectiveFrom;
- (NSDate)userAggregationIdExpiration;
- (NSUUID)deviceAggregationId;
- (NSUUID)userAggregationId;
- (NSUUID)userEphemeralId;
@end

@implementation ADAnalyticsDeviceAndUserIds

- (ADAnalyticsDeviceAndUserIds)initWithFixedDeviceId:(id)a3 withUserEphemeralId:(id)a4 withUserAggregationId:(id)a5 withUserAggregationIdEffectiveFrom:(id)a6 withUserAggregationIdExpiration:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADAnalyticsDeviceAndUserIds;
  v17 = -[ADAnalyticsDeviceAndUserIds init](&v21, "init");
  if (v17)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:forUserAggregationId:]( &OBJC_CLASS___ADAnalyticsDeviceAndUserIds,  "deviceAggregationIdWithDeviceId:forUserAggregationId:",  v12,  v14));
    deviceAggregationId = v17->_deviceAggregationId;
    v17->_deviceAggregationId = (NSUUID *)v18;

    objc_storeStrong((id *)&v17->_userEphemeralId, a4);
    objc_storeStrong((id *)&v17->_userAggregationId, a5);
    objc_storeStrong((id *)&v17->_userAggregationIdEffectiveFrom, a6);
    objc_storeStrong((id *)&v17->_userAggregationIdExpiration, a7);
  }

  return v17;
}

- (NSUUID)deviceAggregationId
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSUUID)userEphemeralId
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSUUID)userAggregationId
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDate)userAggregationIdEffectiveFrom
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDate)userAggregationIdExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)_deviceAggregationIdNamespace
{
  if (qword_100577F70 != -1) {
    dispatch_once(&qword_100577F70, &stru_1004F3128);
  }
  return (id)qword_100577F68;
}

+ (id)deviceAggregationIdWithDeviceId:(id)a3 forUserAggregationId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _deviceAggregationIdNamespace]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSUUID ad_createV5UUIDWithNamespace:]( &OBJC_CLASS___NSUUID,  "ad_createV5UUIDWithNamespace:",  v8,  v6,  v7,  0LL));

  return v9;
}

@end