@interface ADSyncCoordinatorPersonalDevices
- (ADSyncCoordinatorPersonalDevices)init;
- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4;
- (BOOL)addSeedForHome:(id)a3 seed:(id)a4;
- (BOOL)addSeedForUser:(id)a3 seed:(id)a4;
- (BOOL)isPartOfHome;
- (BOOL)multiUserDevice;
- (NSString)defaultUserId;
- (NSUUID)currentHomeId;
- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3;
- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3;
@end

@implementation ADSyncCoordinatorPersonalDevices

- (ADSyncCoordinatorPersonalDevices)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADSyncCoordinatorPersonalDevices;
  v2 = -[ADSyncCoordinatorPersonalDevices init](&v15, "init");
  if (v2)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Initializing ADSyncCoordinatorPersonalDevices",  buf,  2u);
    }

    v2->_multiUserDevice = 0;
    defaultUserId = v2->_defaultUserId;
    v2->_defaultUserId = (NSString *)@"singleUserDevice";

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentHome]);

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
      currentHomeId = v2->_currentHomeId;
      v2->_currentHomeId = (NSUUID *)v7;

      int v9 = 1;
    }

    else
    {
      int v9 = 0;
    }

    if (!v2->_currentHomeId)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "idWhenNotPartOfHome"));
      v11 = v2->_currentHomeId;
      v2->_currentHomeId = (NSUUID *)v10;
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = v2->_currentHomeId;
      *(_DWORD *)buf = 67109378;
      int v17 = v9;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Initializing Home details; partOfHome:%d currentHomeId:%@",
        buf,
        0x12u);
    }
  }

  return v2;
}

- (BOOL)isPartOfHome
{
  return +[ADAnalyticsIdentifiersUtils isPartOfHome:]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "isPartOfHome:",  self->_currentHomeId);
}

- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4
{
  id v4 = a4;
  uint64_t v5 = BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Siri]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 AnalyticsIdentifiers]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UserAggregationId]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 source]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 toBMSiriUserAggregationId]);

  [v10 sendEvent:v11];
  return 1;
}

- (BOOL)addSeedForHome:(id)a3 seed:(id)a4
{
  return 0;
}

- (BOOL)addSeedForUser:(id)a3 seed:(id)a4
{
  id v4 = a4;
  uint64_t v5 = BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Siri]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 AnalyticsIdentifiers]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UserSeed]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 source]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 toBMSiriUserSeed]);

  [v10 sendEvent:v11];
  return 1;
}

- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3
{
  id v4 = (NSUUID *)a3;
  if (!v4) {
    id v4 = self->_currentHomeId;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "idWhenNotPartOfHome"));
  unsigned __int8 v6 = -[NSUUID isEqual:](v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:homeId:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriHomeSeed:homeId:userId:",  v8,  v4,  0LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fetchIdItemPair]);
    uint64_t v7 = -[ADSynchronizedHomeAnalyticsIds initWithHomeEphemeralSeeds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedHomeAnalyticsIds),  "initWithHomeEphemeralSeeds:",  v10);
  }

  return v7;
}

- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriUserSeed:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriUserSeed:userId:",  v3,  0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchIdItemPair]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriUserAggregationId:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriUserAggregationId:userId:",  v3,  0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchIdItemPair]);
  v8 = -[ADSynchronizedUserAnalyticsIds initWithUserEphemeralSeeds:andUserAggregationIds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedUserAnalyticsIds),  "initWithUserEphemeralSeeds:andUserAggregationIds:",  v5,  v7);

  return v8;
}

- (BOOL)multiUserDevice
{
  return self->_multiUserDevice;
}

- (NSString)defaultUserId
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSUUID)currentHomeId
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end