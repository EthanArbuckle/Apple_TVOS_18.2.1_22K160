@interface ADSyncCoordinatorCommunalDevices
+ (unint64_t)_computeLeeway:(unint64_t)a3;
+ (unint64_t)_timerIntervalNanosec;
+ (unint64_t)_timerStartNanosec;
- (ADSyncCoordinatorCommunalDevices)init;
- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3;
- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5 disableTimer:(BOOL)a6;
- (BOOL)_isDefaultUserAvailable;
- (BOOL)_sameItem:(id)a3 other:(id)a4;
- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4;
- (BOOL)addSeedForHome:(id)a3 seed:(id)a4;
- (BOOL)addSeedForUser:(id)a3 seed:(id)a4;
- (BOOL)isPartOfHome;
- (BOOL)multiUserDevice;
- (NSString)defaultUserId;
- (NSUUID)currentHomeId;
- (id)_fetchKnownAccounts;
- (id)_fetchKnownAccountsWithMultiUserService:(id)a3 userSeedStream:(id)a4;
- (id)_profileUserId;
- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3;
- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3;
- (void)_initConsistencyTimer;
- (void)_initHomeDetailsWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5;
- (void)_logTVOSMacroError;
- (void)_publishHomeSeed:(id)a3 forAccounts:(id)a4;
- (void)_publishHomeSeedToAllMembers;
- (void)_publishHomeSeedToAllMembers:(id)a3;
- (void)_refreshHomeAndUserDetailsWithHomeInfoManager:(id)a3 multiUserService:(id)a4;
- (void)refreshHomeAndUserDetails;
@end

@implementation ADSyncCoordinatorCommunalDevices

- (ADSyncCoordinatorCommunalDevices)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Initializing ADSyncCoordinatorCommunalDevices",  v5,  2u);
  }

  return -[ADSyncCoordinatorCommunalDevices initWithProfileUserId:](self, "initWithProfileUserId:", 0LL);
}

- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  v7 = -[ADSyncCoordinatorCommunalDevices initWithProfileUserId:homeInfoManager:multiUserService:disableTimer:]( self,  "initWithProfileUserId:homeInfoManager:multiUserService:disableTimer:",  v4,  v5,  v6,  0LL);

  return v7;
}

- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5 disableTimer:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADSyncCoordinatorCommunalDevices;
  v13 = -[ADSyncCoordinatorCommunalDevices init](&v19, "init");
  if (v13)
  {
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("ADAnalyticsIdentifiersHomeQueue", v15);

    backgroundQueue = v13->_backgroundQueue;
    v13->_backgroundQueue = (OS_dispatch_queue *)v16;

    v13->_multiUserDevice = 1;
    -[ADSyncCoordinatorCommunalDevices _initHomeDetailsWithProfileUserId:homeInfoManager:multiUserService:]( v13,  "_initHomeDetailsWithProfileUserId:homeInfoManager:multiUserService:",  v10,  v11,  v12);
    if (!a6) {
      -[ADSyncCoordinatorCommunalDevices _initConsistencyTimer](v13, "_initConsistencyTimer");
    }
  }

  return v13;
}

- (void)_initHomeDetailsWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 currentHome]);
  id v11 = v10;
  if (v10)
  {
    id v12 = (NSUUID *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
    currentHomeId = self->_currentHomeId;
    self->_currentHomeId = v12;

    dispatch_queue_attr_t v14 = (NSString *)objc_claimAutoreleasedReturnValue([v9 deviceOwner]);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString iCloudAltDSID](v14, "iCloudAltDSID"));
    defaultUserId = self->_defaultUserId;
    self->_defaultUserId = v15;

    int v17 = 1;
  }

  else
  {
    v18 = (NSString *)v8;
    int v17 = 0;
    dispatch_queue_attr_t v14 = self->_defaultUserId;
    self->_defaultUserId = v18;
  }

  if (!self->_currentHomeId)
  {
    objc_super v19 = (NSUUID *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "idWhenNotPartOfHome"));
    v20 = self->_currentHomeId;
    self->_currentHomeId = v19;
  }

  if (!self->_defaultUserId) {
    objc_storeStrong((id *)&self->_defaultUserId, @"userNotYetDetermined");
  }
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = self->_defaultUserId;
    v22 = self->_currentHomeId;
    v24[0] = 67109634;
    v24[1] = v17;
    __int16 v25 = 2112;
    v26 = v22;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Initializing Home details; partOfHome:%d currentHomeId:%@ defaultUserId:%@",
      (uint8_t *)v24,
      0x1Cu);
  }
}

- (NSString)defaultUserId
{
  return self->_defaultUserId;
}

- (BOOL)isPartOfHome
{
  return +[ADAnalyticsIdentifiersUtils isPartOfHome:]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "isPartOfHome:",  self->_currentHomeId);
}

- (BOOL)_isDefaultUserAvailable
{
  defaultUserId = self->_defaultUserId;
  if (defaultUserId) {
    LOBYTE(defaultUserId) = -[NSString isEqual:]( defaultUserId,  "isEqual:",  @"userNotYetDetermined") ^ 1;
  }
  return (char)defaultUserId;
}

- (void)_initConsistencyTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_backgroundQueue);
  consistencyTimer = self->_consistencyTimer;
  self->_consistencyTimer = v3;

  if (self->_consistencyTimer)
  {
    int64_t v5 = +[ADSyncCoordinatorCommunalDevices _timerStartNanosec]( &OBJC_CLASS___ADSyncCoordinatorCommunalDevices,  "_timerStartNanosec");
    uint64_t v6 = +[ADSyncCoordinatorCommunalDevices _timerIntervalNanosec]( &OBJC_CLASS___ADSyncCoordinatorCommunalDevices,  "_timerIntervalNanosec");
    uint64_t v7 = +[ADSyncCoordinatorCommunalDevices _computeLeeway:]( &OBJC_CLASS___ADSyncCoordinatorCommunalDevices,  "_computeLeeway:",  v6);
    id v8 = self->_consistencyTimer;
    dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v5);
    dispatch_source_set_timer((dispatch_source_t)v8, v9, v6, v7);
    id v10 = self->_consistencyTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002D9578;
    handler[3] = &unk_1004FD940;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      int64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Starting consistency check timer start=%llu interval=%llu leeway=%llu",  buf,  0x20u);
    }

    dispatch_resume((dispatch_object_t)self->_consistencyTimer);
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Timer to ensure home seed and aggregation id is synced to all home members could not be started. If a newly crea ted id was not written to the stream of a home member, that member may not see the correct id and home-scoped an alytics will not work correctly for that user's devices",  buf,  2u);
    }
  }

- (void)refreshHomeAndUserDetails
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Checking to see if the device still belongs to the same home",  v6,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  -[ADSyncCoordinatorCommunalDevices _refreshHomeAndUserDetailsWithHomeInfoManager:multiUserService:]( self,  "_refreshHomeAndUserDetailsWithHomeInfoManager:multiUserService:",  v4,  v5);
}

- (void)_refreshHomeAndUserDetailsWithHomeInfoManager:(id)a3 multiUserService:(id)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADSyncCoordinatorCommunalDevices _profileUserId](self, "_profileUserId", a3, a4));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  -[ADSyncCoordinatorCommunalDevices _initHomeDetailsWithProfileUserId:homeInfoManager:multiUserService:]( self,  "_initHomeDetailsWithProfileUserId:homeInfoManager:multiUserService:",  v7,  v5,  v6);
}

- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4
{
  id v4 = a4;
  uint64_t v6 = BiomeLibrary(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 Siri]);
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 AnalyticsIdentifiers]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UserAggregationId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 source]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 toBMSiriUserAggregationId]);

  [v11 sendEvent:v12];
  return 1;
}

- (BOOL)addSeedForHome:(id)a3 seed:(id)a4
{
  uint64_t v6 = (NSUUID *)a3;
  id v7 = a4;
  if (!v6) {
    uint64_t v6 = self->_currentHomeId;
  }
  if (+[ADAnalyticsIdentifiersUtils isPartOfHome:](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "isPartOfHome:", v6)
    && -[ADSyncCoordinatorCommunalDevices _isDefaultUserAvailable](self, "_isDefaultUserAvailable"))
  {
    id v8 = -[BMAccount initWithAltDSID:](objc_alloc(&OBJC_CLASS___BMAccount), "initWithAltDSID:", self->_defaultUserId);
    id v10 = v8;
    if (v8)
    {
      uint64_t v11 = BiomeLibrary(v8, v9);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 Siri]);
      dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 AnalyticsIdentifiers]);
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 HomeSeed]);

      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sourceWithAccount:v10]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 toBMSiriHomeSeedWithHomeIdentifier:v6]);
      [v16 sendEvent:v17];

      -[ADSyncCoordinatorCommunalDevices _publishHomeSeedToAllMembers:](self, "_publishHomeSeedToAllMembers:", v7);
    }

    BOOL v18 = 1;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)addSeedForUser:(id)a3 seed:(id)a4
{
  return 0;
}

- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3
{
  if (-[ADSyncCoordinatorCommunalDevices isPartOfHome](self, "isPartOfHome", a3)
    && -[ADSyncCoordinatorCommunalDevices _isDefaultUserAvailable](self, "_isDefaultUserAvailable"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:homeId:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriHomeSeed:homeId:userId:",  v4,  self->_currentHomeId,  self->_defaultUserId));

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchIdItemPair]);
    id v7 = -[ADSynchronizedHomeAnalyticsIds initWithHomeEphemeralSeeds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedHomeAnalyticsIds),  "initWithHomeEphemeralSeeds:",  v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3
{
  id v4 = (NSString *)a3;
  if (!v4) {
    id v4 = self->_defaultUserId;
  }
  if (-[ADSyncCoordinatorCommunalDevices _isDefaultUserAvailable](self, "_isDefaultUserAvailable"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriUserSeed:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriUserSeed:userId:",  v5,  v4));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchIdItemPair]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriUserAggregationId:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriUserAggregationId:userId:",  v5,  v4));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchIdItemPair]);
    id v10 = -[ADSynchronizedUserAnalyticsIds initWithUserEphemeralSeeds:andUserAggregationIds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedUserAnalyticsIds),  "initWithUserEphemeralSeeds:andUserAggregationIds:",  v7,  v9);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_profileUserId
{
  return 0LL;
}

- (id)_fetchKnownAccounts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  uint64_t v5 = BiomeLibrary(v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Siri]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 AnalyticsIdentifiers]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UserSeed]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADSyncCoordinatorCommunalDevices _fetchKnownAccountsWithMultiUserService:userSeedStream:]( self,  "_fetchKnownAccountsWithMultiUserService:userSeedStream:",  v3,  v9));

  return v10;
}

- (id)_fetchKnownAccountsWithMultiUserService:(id)a3 userSeedStream:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allUsersBySharedUserID]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1002D94E4;
  v18[3] = &unk_1004FAAA8;
  uint64_t v9 = v7;
  uint64_t v19 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v18];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Home member accounts based on RMV:%@",  buf,  0xCu);
  }

  id v17 = 0LL;
  uint64_t v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v5 sharedDeviceAccountsWithError:&v17]);

  id v12 = (NSMutableSet *)v17;
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  dispatch_queue_attr_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Biome accounts could not be fetched. Will be able to share home id details only with RMV enabled home members. Error:%@",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Home member accounts based on inbound sync:%@",  buf,  0xCu);
    }

    -[NSMutableSet addObjectsFromArray:](v9, "addObjectsFromArray:", v11);
    dispatch_queue_attr_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Post merge %@", buf, 0xCu);
    }
  }

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects"));
  return v15;
}

- (void)_publishHomeSeedToAllMembers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:homeId:userId:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriHomeSeed:homeId:userId:",  v3,  self->_currentHomeId,  self->_defaultUserId));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchLocalIdItemPair]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 current]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 next]);
    if (v7 | v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncCoordinatorCommunalDevices _fetchKnownAccounts](self, "_fetchKnownAccounts"));
      if (v7) {
        -[ADSyncCoordinatorCommunalDevices _publishHomeSeed:forAccounts:]( self,  "_publishHomeSeed:forAccounts:",  v7,  v10);
      }
      if (v8) {
        -[ADSyncCoordinatorCommunalDevices _publishHomeSeed:forAccounts:]( self,  "_publishHomeSeed:forAccounts:",  v8,  v10);
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Both current and next seeds are nil. Nothing to publish",  v11,  2u);
      }
    }
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEBUG,  "There are no ephemeral home seeds. Nothing to publish",  buf,  2u);
    }
  }
}

- (void)_publishHomeSeedToAllMembers:(id)a3
{
  id v4 = a3;
  if (+[ADAnalyticsIdentifiersUtils isPartOfHome:]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "isPartOfHome:",  self->_currentHomeId))
  {
    backgroundQueue = (dispatch_queue_s *)self->_backgroundQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002D94A0;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(backgroundQueue, v7);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Won't run publish seed to home members as device is not part of a home",  buf,  2u);
    }
  }
}

- (BOOL)_sameItem:(id)a3 other:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 value]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);

  LOBYTE(v5) = [v6 isEqual:v7];
  return (char)v5;
}

- (void)_publishHomeSeed:(id)a3 forAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Going to publish seed to %@", buf, 0xCu);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v7;
  id v37 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v39;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v32 = v9;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now", v32));
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:homeId:account:]( &OBJC_CLASS___ADBiomeStreamProcessor,  "processorForBMSiriHomeSeed:homeId:account:",  v12,  self->_currentHomeId,  v11));

        dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fetchLocalIdItemPair]);
        int64_t v15 = v14;
        if (v14)
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 current]);
          if (-[ADSyncCoordinatorCommunalDevices _sameItem:other:](self, "_sameItem:other:", v6, v16))
          {

LABEL_12:
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersUtils logger]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "logger"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v32;
              id v43 = v11;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Account %@ already has the seed!",  buf,  0xCu);
            }

            goto LABEL_17;
          }

          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 next]);
          unsigned int v18 = -[ADSyncCoordinatorCommunalDevices _sameItem:other:](self, "_sameItem:other:", v6, v17);

          if (v18) {
            goto LABEL_12;
          }
        }

        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v15 current]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v34 createdOn]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v15 next]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v33 createdOn]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v6 createdOn]);
          *(_DWORD *)buf = 138413058;
          id v43 = v11;
          __int16 v44 = 2112;
          v45 = v29;
          __int16 v46 = 2112;
          v47 = v30;
          __int16 v48 = 2112;
          v49 = v31;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Account %@ does not have the seed. current:%@ next:%@ expected:%@",  buf,  0x2Au);
        }

        uint64_t v23 = BiomeLibrary(v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 Siri]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 AnalyticsIdentifiers]);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 HomeSeed]);

        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sourceWithAccount:](v19, "sourceWithAccount:", v11));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v6 toBMSiriHomeSeedWithHomeIdentifier:self->_currentHomeId]);
        [v27 sendEvent:v28];

LABEL_17:
        id v10 = (char *)v10 + 1;
      }

      while (v37 != v10);
      id v37 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }

    while (v37);
  }
}

- (void)_logTVOSMacroError
{
  if (!self->_macroErrorLogged)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "TVOS macro is false in communal devices sync coordinator!",  v4,  2u);
    }

    self->_macroErrorLogged = 1;
  }

- (BOOL)multiUserDevice
{
  return self->_multiUserDevice;
}

- (NSUUID)currentHomeId
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

+ (unint64_t)_timerStartNanosec
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unint64_t v3 = (unint64_t)[v2 siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec];

  int v5 = AFIsInternalInstall(v4) ^ 1;
  if (!v3) {
    int v5 = 1;
  }
  if (v3 > 0x493E0) {
    int v5 = 1;
  }
  if (v5) {
    return 300000000000LL;
  }
  else {
    return 1000000 * v3;
  }
}

+ (unint64_t)_timerIntervalNanosec
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unint64_t v3 = (unint64_t)[v2 siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec];

  int v5 = AFIsInternalInstall(v4) ^ 1;
  if (!v3) {
    int v5 = 1;
  }
  if (v3 > 0x1B7740) {
    int v5 = 1;
  }
  if (v5) {
    return 1800000000000LL;
  }
  else {
    return 1000000 * v3;
  }
}

+ (unint64_t)_computeLeeway:(unint64_t)a3
{
  unint64_t v3 = a3 / 0xA;
  if (a3 / 0xA <= 0xF4240) {
    unint64_t v3 = 1000000LL;
  }
  if (v3 >= 0xDF8475800LL) {
    return 60000000000LL;
  }
  else {
    return v3;
  }
}

@end