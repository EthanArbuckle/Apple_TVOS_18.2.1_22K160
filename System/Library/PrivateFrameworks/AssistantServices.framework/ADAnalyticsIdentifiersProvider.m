@interface ADAnalyticsIdentifiersProvider
+ (ADAnalyticsIdentifiersProvider)sharedInstance;
+ (id)_alignToRotationCadence:(id)a3;
+ (id)_createHomeEphemeralIdWithHomeSeed:(id)a3 withCreationTime:(id)a4;
+ (id)_createUserEphemeralIdWithUserSeed:(id)a3 withCreationTime:(id)a4;
+ (id)_homeEphemeralIdNamespace;
+ (id)_timestampToNSString:(id)a3;
+ (id)_userEphemeralIdNamespace;
+ (int64_t)_computeSecondsSinceBirth:(id)a3;
+ (int64_t)_computeSecondsSinceBirth:(id)a3 forTimeInterval:(double)a4;
- (ADAnalyticsIdentifiersCheckpoint)checkpoint;
- (ADAnalyticsIdentifiersProvider)init;
- (ADSyncCoordinating)syncCoordinator;
- (ADSynchronizedHomeAnalyticsIds)analyticsIdsForCurrentHome;
- (ADSynchronizedUserAnalyticsIds)analyticsIdsForDefaultUser;
- (BOOL)ephemeralIdWasCreatedBySyncPath;
- (BOOL)firstRefresh;
- (NSDate)ephemeralIdCreationDate;
- (NSDate)localUserSeedCreationTime;
- (NSDate)syncPathExecutionTime;
- (NSUUID)fixedDeviceId;
- (NSUUID)lastCreatedHomeEphemeralId;
- (NSUUID)lastCreatedUserEphemeralId;
- (NSUUID)localUserSeed;
- (OS_dispatch_queue)queue;
- (id)_combineUUIDsWithUuid1:(id)a3 uuid2:(id)a4;
- (id)_createAndSaveFixedDeviceId;
- (id)_createDIMEphemeralIdentifiersEvent:(int64_t)a3;
- (id)_createDIMEphemeralToAggregationIdentifierMapEvent;
- (id)_fetchIdsForHomeWithCreationTime:(id)a3;
- (id)_fetchIdsForUser:(id)a3 creationTime:(id)a4;
- (id)_fetchOrCreateFixedDeviceId;
- (id)_initWithSyncCoordinator:(id)a3 withCheckpoint:(id)a4;
- (id)_readCheckpoint;
- (id)ephemeralIdForDefaultUser;
- (int64_t)_refreshEphemeralIdentifiers:(BOOL)a3;
- (os_unfair_lock_s)id_assignment_lock;
- (unsigned)_convertDataToScaledUInt32:(id)a3;
- (unsigned)experimentBucketId;
- (void)_asyncLogAnalyticsIdentifiersDIMEvents:(id)a3;
- (void)_createAndTestAndSetDefaultUserEphemeralId:(id)a3 expectedValue:(id)a4 expectedValueWasCreatedBySyncPath:(BOOL)a5;
- (void)_testAndSetDefaultUserEphemeralId:(id)a3 creationTime:(id)a4 syncPath:(BOOL)a5 expectedValue:(id)a6;
- (void)_writeCheckpoint:(id)a3;
- (void)asyncLogAnalyticsIdentifiersDIMEvents;
- (void)fetchDeviceAggregationIdWithCallback:(id)a3;
- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4;
- (void)fetchDeviceAndUserIdsForiCloudAltDSId:(id)a3 withCallback:(id)a4;
- (void)setFirstRefresh:(BOOL)a3;
- (void)setSyncPathExecutionTime:(id)a3;
@end

@implementation ADAnalyticsIdentifiersProvider

- (ADAnalyticsIdentifiersProvider)init
{
  return (ADAnalyticsIdentifiersProvider *)-[ADAnalyticsIdentifiersProvider _initWithSyncCoordinator:withCheckpoint:]( self,  "_initWithSyncCoordinator:withCheckpoint:",  0LL,  0LL);
}

- (id)_initWithSyncCoordinator:(id)a3 withCheckpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ADAnalyticsIdentifiersProvider;
  v8 = -[ADAnalyticsIdentifiersProvider init](&v25, "init");
  v9 = v8;
  if (v8)
  {
    v8->_id_assignment_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v8->_firstRefresh = 1;
    if (v7) {
      v10 = (ADAnalyticsIdentifiersCheckpoint *)v7;
    }
    else {
      v10 = (ADAnalyticsIdentifiersCheckpoint *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersProvider _readCheckpoint]( v8,  "_readCheckpoint"));
    }
    checkpoint = v9->_checkpoint;
    v9->_checkpoint = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    localUserSeed = v9->_localUserSeed;
    v9->_localUserSeed = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    localUserSeedCreationTime = v9->_localUserSeedCreationTime;
    v9->_localUserSeedCreationTime = (NSDate *)v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("ADAnalyticsIdentifiersProvider", v17);

    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

    v20 = (dispatch_queue_s *)v9->_queue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1002A27A8;
    v22[3] = &unk_1004FD968;
    id v23 = v6;
    v24 = v9;
    dispatch_async(v20, v22);
  }

  return v9;
}

- (id)ephemeralIdForDefaultUser
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  syncPathExecutionTime = self->_syncPathExecutionTime;
  self->_syncPathExecutionTime = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _alignToRotationCadence:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_alignToRotationCadence:",  self->_syncPathExecutionTime));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15[0]) = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Checkpoint has valid current user seed",  (uint8_t *)v15,  2u);
  }

  id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersCheckpoint currentUserSeed](self->_checkpoint, "currentUserSeed"));
  if (!v7)
  {
LABEL_17:
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15[0]) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Checkpoint has valid next user seed that is usable now",  (uint8_t *)v15,  2u);
    }

    id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersCheckpoint nextUserSeed](self->_checkpoint, "nextUserSeed"));
    if (!v7)
    {
LABEL_9:
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15[0]) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Using locally created seed",  (uint8_t *)v15,  2u);
      }

      id v7 = self->_localUserSeed;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _createUserEphemeralIdWithUserSeed:withCreationTime:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_createUserEphemeralIdWithUserSeed:withCreationTime:",  v7,  v5));
  -[ADAnalyticsIdentifiersProvider _testAndSetDefaultUserEphemeralId:creationTime:syncPath:expectedValue:]( self,  "_testAndSetDefaultUserEphemeralId:creationTime:syncPath:expectedValue:",  v10,  v5,  1LL,  0LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL ephemeralIdWasCreatedBySyncPath = self->_ephemeralIdWasCreatedBySyncPath;
    v15[0] = 67109120;
    v15[1] = ephemeralIdWasCreatedBySyncPath;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Synchronous path won race?%d",  (uint8_t *)v15,  8u);
  }

  v12 = self->_lastCreatedUserEphemeralId;
  return v12;
}

- (void)asyncLogAnalyticsIdentifiersDIMEvents
{
}

- (void)_asyncLogAnalyticsIdentifiersDIMEvents:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002A2628;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchDeviceAndUserIdsForiCloudAltDSId:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A234C;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A21C0;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchDeviceAggregationIdWithCallback:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1002A20F0;
  dispatch_queue_t v18 = sub_1002A2100;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds aggregationIds](self->_analyticsIdsForDefaultUser, "aggregationIds"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 current]);
  id v19 = (id)objc_claimAutoreleasedReturnValue([v6 value]);

  if (v15[5])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:forUserAggregationId:]( &OBJC_CLASS___ADAnalyticsDeviceAndUserIds,  "deviceAggregationIdWithDeviceId:forUserAggregationId:",  self->_fixedDeviceId));
    v4[2](v4, v7);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "userAggregationId not yet available. Dispatching to queue to fetch.",  buf,  2u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A2108;
    block[3] = &unk_1004FAFF0;
    void block[4] = self;
    id v12 = &v14;
    v11 = v4;
    dispatch_async(queue, block);
  }

  _Block_object_dispose(&v14, 8);
}

- (id)_createDIMEphemeralIdentifiersEvent:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMEphemeralIdentifiers);
  id v6 = [[SISchemaUUID alloc] initWithNSUUID:self->_lastCreatedUserEphemeralId];
  [v5 setUserEphemeralId:v6];

  if (AFIsInternalInstall([v5 setSecondsSinceEphemeralIdCreation:a3]))
  {
    id v7 = [[SISchemaUUID alloc] initWithNSUUID:self->_lastCreatedHomeEphemeralId];
    [v5 setHomeEphemeralId:v7];
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMClientEvent);
  [v8 setEphemeralIdentifiers:v5];

  return v8;
}

- (id)_createDIMEphemeralToAggregationIdentifierMapEvent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds aggregationIds](self->_analyticsIdsForDefaultUser, "aggregationIds"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 current]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 effectiveFrom]);
  [v5 timeIntervalSince1970];
  unint64_t v7 = (unint64_t)(v6 * 1000.0);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
  [v8 timeIntervalSince1970];
  unint64_t v10 = (unint64_t)(v9 * 1000.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:forUserAggregationId:]( &OBJC_CLASS___ADAnalyticsDeviceAndUserIds,  "deviceAggregationIdWithDeviceId:forUserAggregationId:",  self->_fixedDeviceId,  v11));
  id v13 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMEphemeralToAggregationIdentifierMap);
  id v14 = [[SISchemaUUID alloc] initWithNSUUID:self->_lastCreatedUserEphemeralId];
  [v13 setUserEphemeralId:v14];

  id v15 = [[SISchemaUUID alloc] initWithNSUUID:v11];
  [v13 setUserAggregationId:v15];

  id v16 = [[SISchemaUUID alloc] initWithNSUUID:v12];
  [v13 setDeviceAggregationId:v16];

  [v13 setUserAggregationIdRotationTimestampMs:v7];
  [v13 setUserAggregationIdExpirationTimestampMs:v10];
  id v17 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMClientEvent);
  [v17 setEphemeralToAggregationIdentifierMap:v13];

  return v17;
}

- (id)_readCheckpoint
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v10 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Reading checkpointed state from Keychain",  v10,  2u);
  }

  uint64_t v3 = AFKeychainValueForAccountAndKey(AFSiriGlobalKeychainAccountIdentifier, @"AnalyticsIdentifiers.checkpoint");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Checkpoint state keychain entry does not exist; will use local seed if needed",
        v8,
        2u);
    }

    goto LABEL_9;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersCheckpoint unarchive:]( &OBJC_CLASS___ADAnalyticsIdentifiersCheckpoint,  "unarchive:",  v4));
  if (!v5)
  {
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Checkpoint object not available; will assume that there was no prior state",
        buf,
        2u);
    }

- (void)_writeCheckpoint:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Checkpointing to Keychain", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 archive]);
  if (v5)
  {
    AFKeychainSetValueForAccountAndKey( v5,  AFSiriGlobalKeychainAccountIdentifier,  @"AnalyticsIdentifiers.checkpoint");
  }

  else
  {
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Checkpoint could not be archived and will not be saved to keychain",  v7,  2u);
    }
  }
}

- (id)_createAndSaveFixedDeviceId
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Saving fixed device identifier to Keychain",  buf,  2u);
  }

  id v8 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v8));
  id v5 = v8;
  if (v5)
  {
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Fixed device identifier keychain entry could not be archived. Error:%@",  buf,  0xCu);
    }
  }

  else
  {
    AFKeychainSetValueForAccountAndKey( v4,  AFSiriGlobalKeychainAccountIdentifier,  @"AnalyticsIdentifiers.fixedDeviceId");
  }

  return v2;
}

- (id)_fetchOrCreateFixedDeviceId
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Reading fixed device identifier from Keychain",  buf,  2u);
  }

  uint64_t v4 = AFKeychainValueForAccountAndKey( AFSiriGlobalKeychainAccountIdentifier,  @"AnalyticsIdentifiers.fixedDeviceId");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Fixed device identifier keychain entry does not exist. Creating new UUID",  buf,  2u);
    }

    id v8 = 0LL;
    goto LABEL_13;
  }

  id v12 = 0LL;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSUUID),  v5,  &v12);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v12;
  if (v8)
  {
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Fixed device identifier keychain entry could not be fetched or saved; will use a temporary value. Error: %@",
        buf,
        0xCu);
    }
  }

  if (!v7) {
LABEL_13:
  }
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersProvider _createAndSaveFixedDeviceId](self, "_createAndSaveFixedDeviceId"));

  return v7;
}

- (int64_t)_refreshEphemeralIdentifiers:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_lastCreatedUserEphemeralId;
  BOOL ephemeralIdWasCreatedBySyncPath = self->_ephemeralIdWasCreatedBySyncPath;
  if (v5) {
    int64_t v7 = +[ADAnalyticsIdentifiersProvider _computeSecondsSinceBirth:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_computeSecondsSinceBirth:",  self->_ephemeralIdCreationDate);
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v43 = self->_analyticsIdsForDefaultUser == 0LL;
    BOOL v44 = self->_analyticsIdsForCurrentHome == 0LL;
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v56 = v3;
    *(_WORD *)&v56[4] = 2048;
    *(void *)&v56[6] = v7;
    *(_WORD *)&v56[14] = 1024;
    *(_DWORD *)&v56[16] = v43;
    LOWORD(v57) = 1024;
    *(_DWORD *)((char *)&v57 + 2) = v44;
    HIWORD(v57) = 1024;
    v58[0] = ephemeralIdWasCreatedBySyncPath;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Refreshing syncData force:%d secondsSinceBirth:%ld _analyticsIdsForDefaultUserNil:%d  _analyticsIdsForCurrentHomeN il:%d _lastCreatedBySyncPath:%d",  buf,  0x24u);
  }

  if (!v5 || v3 || !self->_analyticsIdsForDefaultUser)
  {
    if (v3 && !self->_firstRefresh)
    {
      -[ADSyncCoordinating refreshHomeAndUserDetails](self->_syncCoordinator, "refreshHomeAndUserDetails");
      self->_firstRefresh = 0;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    double v9 = (ADSynchronizedUserAnalyticsIds *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersProvider _fetchIdsForUser:creationTime:]( self,  "_fetchIdsForUser:creationTime:",  0LL));
    analyticsIdsForDefaultUser = self->_analyticsIdsForDefaultUser;
    self->_analyticsIdsForDefaultUser = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](self->_analyticsIdsForDefaultUser, "ephemeralSeeds"));
    v53 = v5;
    -[ADAnalyticsIdentifiersProvider _createAndTestAndSetDefaultUserEphemeralId:expectedValue:expectedValueWasCreatedBySyncPath:]( self,  "_createAndTestAndSetDefaultUserEphemeralId:expectedValue:expectedValueWasCreatedBySyncPath:",  v11,  v5,  ephemeralIdWasCreatedBySyncPath);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](self->_analyticsIdsForDefaultUser, "ephemeralSeeds"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 current]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](self->_analyticsIdsForDefaultUser, "ephemeralSeeds"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 next]);

    id v16 = objc_alloc(&OBJC_CLASS___ADAnalyticsIdentifiersCheckpoint);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
    v51 = v13;
    dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 expirationDate]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 effectiveFrom]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v15 expirationDate]);
    v22 = -[ADAnalyticsIdentifiersCheckpoint initWithCurrentUserSeed:currentUserSeedExpirationDate:nextUserSeed:nextUserSeedEffectiveFromDate:nextUserSeedExpirationDate:]( v16,  "initWithCurrentUserSeed:currentUserSeedExpirationDate:nextUserSeed:nextUserSeedEffectiveFromDate:nextUserSee dExpirationDate:",  v17,  v18,  v19,  v20,  v21);
    -[ADAnalyticsIdentifiersProvider _writeCheckpoint:](self, "_writeCheckpoint:", v22);

    int64_t v23 = +[ADAnalyticsIdentifiersProvider _computeSecondsSinceBirth:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_computeSecondsSinceBirth:",  self->_ephemeralIdCreationDate);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      ephemeralIdCreationDate = self->_ephemeralIdCreationDate;
      lastCreatedUserEphemeralId = self->_lastCreatedUserEphemeralId;
      BOOL v47 = !self->_ephemeralIdWasCreatedBySyncPath;
      *(_DWORD *)buf = 138413058;
      *(void *)v56 = lastCreatedUserEphemeralId;
      *(_WORD *)&v56[8] = 2112;
      *(void *)&v56[10] = ephemeralIdCreationDate;
      *(_WORD *)&v56[18] = 2048;
      int64_t v57 = v23;
      LOWORD(v58[0]) = 1024;
      *(_DWORD *)((char *)v58 + 2) = v47;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Created user ephemeral identifier for default user; uuid:%@ creationDate:%@ secondsSinceBirth:%ld wonRace?%d",
        buf,
        0x26u);
    }

    int64_t v52 = v23;

    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds aggregationIds](self->_analyticsIdsForDefaultUser, "aggregationIds"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 current]);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 effectiveFrom]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v26 expirationDate]);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:forUserAggregationId:]( &OBJC_CLASS___ADAnalyticsDeviceAndUserIds,  "deviceAggregationIdWithDeviceId:forUserAggregationId:",  self->_fixedDeviceId,  v27));
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)v56 = v30;
      *(_WORD *)&v56[8] = 2112;
      *(void *)&v56[10] = v27;
      *(_WORD *)&v56[18] = 2112;
      int64_t v57 = v28;
      LOWORD(v58[0]) = 2112;
      *(void *)((char *)v58 + 2) = v29;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Aggregation id details: device:%@ user:%@ effectiveFrom:%@ expirationDate:%@",  buf,  0x2Au);
    }

    v49 = (void *)v29;
    v50 = (void *)v28;

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersProvider _combineUUIDsWithUuid1:uuid2:]( self,  "_combineUUIDsWithUuid1:uuid2:",  v30,  v27));
    v33 = (void *)objc_claimAutoreleasedReturnValue([@"*^&9aM&A#^&Sn3" dataUsingEncoding:4]);
    uint64_t v34 = AFSecurityDigestData(v32, v33, 1LL, 0LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    self->_experimentBucketId = -[ADAnalyticsIdentifiersProvider _convertDataToScaledUInt32:]( self,  "_convertDataToScaledUInt32:",  v35);
    v36 = (ADSynchronizedHomeAnalyticsIds *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersProvider _fetchIdsForHomeWithCreationTime:]( self,  "_fetchIdsForHomeWithCreationTime:",  v54));
    analyticsIdsForCurrentHome = self->_analyticsIdsForCurrentHome;
    self->_analyticsIdsForCurrentHome = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds currentEphemeralSeed](self->_analyticsIdsForCurrentHome, "currentEphemeralSeed"));
    if (v38)
    {
      v39 = (NSUUID *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _createHomeEphemeralIdWithHomeSeed:withCreationTime:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_createHomeEphemeralIdWithHomeSeed:withCreationTime:",  v38,  self->_ephemeralIdCreationDate,  v49,  v50));
      lastCreatedHomeEphemeralId = self->_lastCreatedHomeEphemeralId;
      self->_lastCreatedHomeEphemeralId = v39;

      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v48 = self->_lastCreatedHomeEphemeralId;
        *(_DWORD *)buf = 138412290;
        *(void *)v56 = v48;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Created home ephemeral identifier for current home; uuid:%@",
          buf,
          0xCu);
      }
    }

    int64_t v7 = v52;
    id v5 = v53;
  }

  return v7;
}

- (void)_createAndTestAndSetDefaultUserEphemeralId:(id)a3 expectedValue:(id)a4 expectedValueWasCreatedBySyncPath:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v5) {
    goto LABEL_8;
  }
  -[NSDate timeIntervalSinceNow](self->_syncPathExecutionTime, "timeIntervalSinceNow");
  double v11 = v10;
  BOOL v12 = v10 <= -5.0 || v10 > 0.0;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218240;
    double v20 = -v11;
    __int16 v21 = 1024;
    BOOL v22 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Current id was created by sync path. It was created %f seconds ago. Ignoring? %d",  (uint8_t *)&v19,  0x12u);
  }

  if (v12)
  {
LABEL_8:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _alignToRotationCadence:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_alignToRotationCadence:",  v14));

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 current]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);
    dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _createUserEphemeralIdWithUserSeed:withCreationTime:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_createUserEphemeralIdWithUserSeed:withCreationTime:",  v17,  v15));

    -[ADAnalyticsIdentifiersProvider _testAndSetDefaultUserEphemeralId:creationTime:syncPath:expectedValue:]( self,  "_testAndSetDefaultUserEphemeralId:creationTime:syncPath:expectedValue:",  v18,  v15,  0LL,  v9);
  }
}

- (void)_testAndSetDefaultUserEphemeralId:(id)a3 creationTime:(id)a4 syncPath:(BOOL)a5 expectedValue:(id)a6
{
  id v14 = a3;
  id v11 = a4;
  BOOL v12 = (NSUUID *)a6;
  os_unfair_lock_lock(&self->_id_assignment_lock);
  lastCreatedUserEphemeralId = self->_lastCreatedUserEphemeralId;

  if (lastCreatedUserEphemeralId == v12)
  {
    objc_storeStrong((id *)&self->_lastCreatedUserEphemeralId, a3);
    objc_storeStrong((id *)&self->_ephemeralIdCreationDate, a4);
    self->_BOOL ephemeralIdWasCreatedBySyncPath = a5;
  }

  os_unfair_lock_unlock(&self->_id_assignment_lock);
}

- (id)_fetchIdsForUser:(id)a3 creationTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v28) = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Fetching user seed and aggregation ids",  (uint8_t *)&v28,  2u);
  }

  id v9 = (ADSynchronizedUserAnalyticsIds *)objc_claimAutoreleasedReturnValue( -[ADSyncCoordinating fetchSynchronizedAnalyticsIdsForUser:]( self->_syncCoordinator,  "fetchSynchronizedAnalyticsIdsForUser:",  v7));
  if (v9)
  {
    if (v7) {
      goto LABEL_11;
    }
  }

  else
  {
    id v9 = -[ADSynchronizedUserAnalyticsIds initWithUserEphemeralSeeds:andUserAggregationIds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedUserAnalyticsIds),  "initWithUserEphemeralSeeds:andUserAggregationIds:",  0LL,  0LL);
    if (v7) {
      goto LABEL_11;
    }
  }

  if (-[ADSynchronizedIds setCurrentEphemeralSeedIfNil:andCreationTime:]( v9,  "setCurrentEphemeralSeedIfNil:andCreationTime:",  self->_localUserSeed,  self->_localUserSeedCreationTime))
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](v9, "ephemeralSeeds"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 current]);

    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412290;
      uint64_t v29 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Populated current user seed with local value %@",  (uint8_t *)&v28,  0xCu);
    }

    -[ADSyncCoordinating addSeedForUser:seed:](self->_syncCoordinator, "addSeedForUser:seed:", 0LL, v11);
  }

- (id)_fetchIdsForHomeWithCreationTime:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[ADSyncCoordinating isPartOfHome](self->_syncCoordinator, "isPartOfHome");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Fetching home seed", (uint8_t *)&v17, 2u);
    }

    id v8 = (ADSynchronizedHomeAnalyticsIds *)objc_claimAutoreleasedReturnValue( -[ADSyncCoordinating fetchSynchronizedAnalyticsIdsForHome:]( self->_syncCoordinator,  "fetchSynchronizedAnalyticsIdsForHome:",  0LL));
    if (!v8) {
      id v8 = -[ADSynchronizedHomeAnalyticsIds initWithHomeEphemeralSeeds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedHomeAnalyticsIds),  "initWithHomeEphemeralSeeds:",  0LL);
    }
    unsigned __int8 v9 = -[ADSynchronizedIds populateNullsWithCreationTime:](v8, "populateNullsWithCreationTime:", v4);
    if ((v9 & 1) != 0)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](v8, "ephemeralSeeds"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 current]);

      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        dispatch_queue_t v18 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Created current home seed %@",  (uint8_t *)&v17,  0xCu);
      }

      -[ADSyncCoordinating addSeedForHome:seed:](self->_syncCoordinator, "addSeedForHome:seed:", 0LL, v11);
    }

    if ((v9 & 2) != 0)
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIds ephemeralSeeds](v8, "ephemeralSeeds"));
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 next]);

      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        dispatch_queue_t v18 = v14;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Created next home seed %@",  (uint8_t *)&v17,  0xCu);
      }

      -[ADSyncCoordinating addSeedForHome:seed:](self->_syncCoordinator, "addSeedForHome:seed:", 0LL, v14);
    }
  }

  else
  {
    if (v7)
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Not part of home. Will not fetch home seed",  (uint8_t *)&v17,  2u);
    }

    id v8 = -[ADSynchronizedHomeAnalyticsIds initWithHomeEphemeralSeeds:]( objc_alloc(&OBJC_CLASS___ADSynchronizedHomeAnalyticsIds),  "initWithHomeEphemeralSeeds:",  0LL);
  }

  return v8;
}

- (id)_combineUUIDsWithUuid1:(id)a3 uuid2:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  id v10 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", 16LL));
  id v11 = [v10 mutableBytes];
  id v12 = v7;
  unsigned __int8 v13 = [v12 bytes];
  id v14 = v9;
  id v15 = [v14 bytes];
  for (uint64_t i = 0LL; i != 16; ++i)
    v11[i] = v15[i] ^ v13[i];

  return v10;
}

- (unsigned)_convertDataToScaledUInt32:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 bytes];
  if ([v3 length])
  {
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    do
      unsigned int v5 = v4[v6++] | (v5 << 8);
    while (v6 < (unint64_t)[v3 length]);
    unsigned int v7 = v5 % 0x14;
  }

  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)fixedDeviceId
{
  return self->_fixedDeviceId;
}

- (ADSyncCoordinating)syncCoordinator
{
  return self->_syncCoordinator;
}

- (BOOL)firstRefresh
{
  return self->_firstRefresh;
}

- (void)setFirstRefresh:(BOOL)a3
{
  self->_firstRefresh = a3;
}

- (ADSynchronizedUserAnalyticsIds)analyticsIdsForDefaultUser
{
  return self->_analyticsIdsForDefaultUser;
}

- (ADSynchronizedHomeAnalyticsIds)analyticsIdsForCurrentHome
{
  return self->_analyticsIdsForCurrentHome;
}

- (NSDate)ephemeralIdCreationDate
{
  return self->_ephemeralIdCreationDate;
}

- (NSUUID)lastCreatedUserEphemeralId
{
  return self->_lastCreatedUserEphemeralId;
}

- (NSUUID)lastCreatedHomeEphemeralId
{
  return self->_lastCreatedHomeEphemeralId;
}

- (BOOL)ephemeralIdWasCreatedBySyncPath
{
  return self->_ephemeralIdWasCreatedBySyncPath;
}

- (ADAnalyticsIdentifiersCheckpoint)checkpoint
{
  return self->_checkpoint;
}

- (NSUUID)localUserSeed
{
  return self->_localUserSeed;
}

- (NSDate)localUserSeedCreationTime
{
  return self->_localUserSeedCreationTime;
}

- (os_unfair_lock_s)id_assignment_lock
{
  return self->_id_assignment_lock;
}

- (NSDate)syncPathExecutionTime
{
  return self->_syncPathExecutionTime;
}

- (void)setSyncPathExecutionTime:(id)a3
{
}

- (unsigned)experimentBucketId
{
  return self->_experimentBucketId;
}

- (void).cxx_destruct
{
}

+ (id)_homeEphemeralIdNamespace
{
  if (qword_100578388 != -1) {
    dispatch_once(&qword_100578388, &stru_1004F9788);
  }
  return (id)qword_100578380;
}

+ (id)_userEphemeralIdNamespace
{
  if (qword_100578398 != -1) {
    dispatch_once(&qword_100578398, &stru_1004F97A8);
  }
  return (id)qword_100578390;
}

+ (id)_timestampToNSString:(id)a3
{
  uint64_t v3 = qword_1005783A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1005783A8, &stru_1004F97C8);
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1005783A0 stringFromDate:v4]);

  return v5;
}

+ (id)_createUserEphemeralIdWithUserSeed:(id)a3 withCreationTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _userEphemeralIdNamespace]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_userEphemeralIdNamespace"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _timestampToNSString:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_timestampToNSString:",  v5));

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSUUID ad_createV5UUIDWithNamespace:]( &OBJC_CLASS___NSUUID,  "ad_createV5UUIDWithNamespace:",  v7,  v6,  v8,  0LL));
  return v9;
}

+ (id)_createHomeEphemeralIdWithHomeSeed:(id)a3 withCreationTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _homeEphemeralIdNamespace]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_homeEphemeralIdNamespace"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider _timestampToNSString:]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "_timestampToNSString:",  v5));

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSUUID ad_createV5UUIDWithNamespace:]( &OBJC_CLASS___NSUUID,  "ad_createV5UUIDWithNamespace:",  v7,  v6,  v8,  0LL));
  return v9;
}

+ (int64_t)_computeSecondsSinceBirth:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  id v6 = objc_msgSend(a1, "_computeSecondsSinceBirth:forTimeInterval:", v4);

  return (int64_t)v6;
}

+ (int64_t)_computeSecondsSinceBirth:(id)a3 forTimeInterval:(double)a4
{
  return (uint64_t)(a4 - v5);
}

+ (id)_alignToRotationCadence:(id)a3
{
  id v3 = a3;
  [v3 timeIntervalSince1970];
  unint64_t v5 = (unint64_t)(v4 * 1000.0);
  unint64_t v6 = 900 * (v5 / 0xDBBA0);
  if (1000 * (v5 / 0x3E8) == v5 && v6 == v5 / 0x3E8) {
    id v8 = (NSDate *)v3;
  }
  else {
    id v8 = -[NSDate initWithTimeIntervalSince1970:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSince1970:",  (double)v6);
  }
  unsigned __int8 v9 = v8;

  return v9;
}

+ (ADAnalyticsIdentifiersProvider)sharedInstance
{
  if (qword_1005783B8 != -1) {
    dispatch_once(&qword_1005783B8, &stru_1004F97E8);
  }
  return (ADAnalyticsIdentifiersProvider *)(id)qword_1005783B0;
}

@end