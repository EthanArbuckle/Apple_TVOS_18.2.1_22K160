@interface ADDeviceProximityManager
+ (id)sharedManager;
- (id)_initWithQueue:(id)a3 donationService:(id)a4 deviceCircleManager:(id)a5;
- (id)_messageLink;
- (id)_proximityDiscoveryLink;
- (id)_queue;
- (id)_rapportLinkMessageOptions;
- (void)_clearProximityDiscoveryLink;
- (void)_fetchProximityObservationsFromCollectorsWithCompletion:(id)a3;
- (void)_getAggregatedProximityObservationsWithCompletion:(id)a3;
- (void)_insertProximityForRemoteDeviceID:(id)a3 rpProximity:(int)a4;
- (void)_pushProximityObservationToCollector:(id)a3;
- (void)_recordProximityObservation:(id)a3;
- (void)_resetMessageLinkAndReconnectNow:(BOOL)a3;
- (void)_setMessageLink:(id)a3;
- (void)_stopScanning;
- (void)_updateProximityForDevice:(id)a3;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)getDeviceProximityRelativeToLocalDeviceWithCompletion:(id)a3;
- (void)getDeviceProximityRelativeToLocalDeviceWithDeviceContexts:(id)a3 includesAllReachableDevices:(BOOL)a4 completion:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)performProximityScan;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADDeviceProximityManager

- (id)_initWithQueue:(id)a3 donationService:(id)a4 deviceCircleManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___ADDeviceProximityManager;
  v12 = -[ADDeviceProximityManager init](&v37, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_deviceCircleManager, a5);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    proximityObservations = v13->_proximityObservations;
    v13->_proximityObservations = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    timersByDeviceIDPair = v13->_timersByDeviceIDPair;
    v13->_timersByDeviceIDPair = v16;

    -[ADDeviceCircleManager addListener:](v13->_deviceCircleManager, "addListener:", v13);
    deviceCircleManager = v13->_deviceCircleManager;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001A0448;
    v35[3] = &unk_1004F46C8;
    v19 = v13;
    v36 = v19;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v35);
    v20 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    id v21 = +[AFSiriActivationContext newWithBuilder:]( &OBJC_CLASS___AFSiriActivationContext,  "newWithBuilder:",  &stru_1004F46E8);
    uint64_t DarwinNotificationNameFromContext = AFSiriActivationGetDarwinNotificationNameFromContext(v21, 0LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(DarwinNotificationNameFromContext);
    v24 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v20,  "initWithName:options:queue:delegate:",  v23,  0LL,  v13->_queue,  v19);
    id v25 = v19[12];
    v19[12] = v24;

    v26 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    id v27 = +[AFSiriActivationContext newWithBuilder:]( &OBJC_CLASS___AFSiriActivationContext,  "newWithBuilder:",  &stru_1004F4708);
    uint64_t v28 = AFSiriActivationGetDarwinNotificationNameFromContext(v27, 0LL);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v26,  "initWithName:options:queue:delegate:",  v29,  0LL,  v13->_queue,  v19);
    id v31 = v19[13];
    v19[13] = v30;

    id v32 = [v19 _messageLink];
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v33 addListener:v19];

    objc_storeStrong(v19 + 6, a4);
    [v19[6] registerContextTransformer:v19 forType:AFDeviceContextKeyHeardVoiceTrigger];
  }

  return v13;
}

- (void)performProximityScan
{
  if ((AFSupportsHALProximityScanning(self, a2) & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A019C;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(queue, block);
  }

  else
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[ADDeviceProximityManager performProximityScan]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s #hal Not supported on this platform",  buf,  0xCu);
    }
  }

- (void)_stopScanning
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADDeviceProximityManager _stopScanning]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019FF80;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getDeviceProximityRelativeToLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if ((AFSupportsHALProximityScanning(v4, v5) & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10019FE98;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }

  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)getDeviceProximityRelativeToLocalDeviceWithDeviceContexts:(id)a3 includesAllReachableDevices:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10019E278;
  v13[3] = &unk_1004FBFC0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)_getAggregatedProximityObservationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary af_lenientMappedDictionary:]( self->_proximityObservations,  "af_lenientMappedDictionary:",  &stru_1004F4800));
  v6 = v5;
  if (self->_localIsCollector)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v8 = sub_10019DF50(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v4[2](v4, v9);
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10019E00C;
    v10[3] = &unk_1004FD6C8;
    id v11 = v5;
    id v12 = v4;
    -[ADDeviceProximityManager _fetchProximityObservationsFromCollectorsWithCompletion:]( self,  "_fetchProximityObservationsFromCollectorsWithCompletion:",  v10);
  }
}

- (id)_rapportLinkMessageOptions
{
  uint64_t v3 = RPOptionStatusFlags;
  id v4 = &off_100513438;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)_messageLink
{
  messageLink = self->_messageLink;
  if (!messageLink)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADRapportLinkConfiguration);
    id v5 = +[ADRapportLinkDiscoveryOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkDiscoveryOptions,  "newWithBuilder:",  &stru_1004F4848);
    id v6 = +[ADRapportLinkTransportOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkTransportOptions,  "newWithBuilder:",  &stru_1004F4868);
    id v7 = +[ADRapportLinkConnectionOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConnectionOptions,  "newWithBuilder:",  &stru_1004F48A8);
    id v8 = -[ADRapportLinkConfiguration initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:]( v4,  "initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:",  v5,  v6,  v7,  1LL);

    id v9 = -[ADRapportLink initWithQueue:configuration:]( objc_alloc(&OBJC_CLASS___ADRapportLink),  "initWithQueue:configuration:",  self->_queue,  v8);
    id v10 = self->_messageLink;
    self->_messageLink = v9;

    -[ADRapportLink addListener:](self->_messageLink, "addListener:", self);
    id v11 = self->_messageLink;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceProximityManager _rapportLinkMessageOptions](self, "_rapportLinkMessageOptions"));
    -[ADRapportLink registerRequestID:options:]( v11,  "registerRequestID:options:",  @"com.apple.siri.rapport-link.request.device-proximity-manager",  v12);

    -[ADRapportLink setRequestHandler:forRequestID:messageType:]( self->_messageLink,  "setRequestHandler:forRequestID:messageType:",  self,  @"com.apple.siri.rapport-link.request.device-proximity-manager",  @"device_proximity_fetch");
    -[ADRapportLink setRequestHandler:forRequestID:messageType:]( self->_messageLink,  "setRequestHandler:forRequestID:messageType:",  self,  @"com.apple.siri.rapport-link.request.device-proximity-manager",  @"device_proximity_push");
    -[ADRapportLink activateWithCompletion:](self->_messageLink, "activateWithCompletion:", &stru_1004F48C8);

    messageLink = self->_messageLink;
  }

  return messageLink;
}

- (id)_proximityDiscoveryLink
{
  proximityDiscoveryLink = self->_proximityDiscoveryLink;
  if (!proximityDiscoveryLink)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADRapportLinkConfiguration);
    id v5 = +[ADRapportLinkDiscoveryOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkDiscoveryOptions,  "newWithBuilder:",  &stru_1004F48E8);
    id v6 = +[ADRapportLinkTransportOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkTransportOptions,  "newWithBuilder:",  &stru_1004F4908);
    id v7 = +[ADRapportLinkConnectionOptions newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConnectionOptions,  "newWithBuilder:",  &stru_1004F4928);
    id v8 = -[ADRapportLinkConfiguration initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:]( v4,  "initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:",  v5,  v6,  v7,  2LL);

    id v9 = -[ADRapportLink initWithQueue:configuration:]( objc_alloc(&OBJC_CLASS___ADRapportLink),  "initWithQueue:configuration:",  self->_queue,  v8);
    id v10 = self->_proximityDiscoveryLink;
    self->_proximityDiscoveryLink = v9;

    -[ADRapportLink addListener:](self->_proximityDiscoveryLink, "addListener:", self);
    -[ADRapportLink activateWithCompletion:](self->_proximityDiscoveryLink, "activateWithCompletion:", &stru_1004F4948);

    proximityDiscoveryLink = self->_proximityDiscoveryLink;
  }

  return proximityDiscoveryLink;
}

- (void)_clearProximityDiscoveryLink
{
  proximityDiscoveryLink = self->_proximityDiscoveryLink;
  self->_proximityDiscoveryLink = 0LL;
}

- (void)_resetMessageLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  -[ADRapportLink removeListener:](self->_messageLink, "removeListener:", self);
  -[ADRapportLink invalidate](self->_messageLink, "invalidate");
  messageLink = self->_messageLink;
  self->_messageLink = 0LL;

  if (v3)
  {
    id v6 = -[ADDeviceProximityManager _messageLink](self, "_messageLink");
  }

  else
  {
    dispatch_time_t v7 = dispatch_time(0LL, 20000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019DCDC;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_after(v7, queue, block);
  }

- (void)_updateProximityForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  id v6 = [v4 proximity];
  dispatch_time_t v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    int v10 = 136315906;
    id v11 = "-[ADDeviceProximityManager _updateProximityForDevice:]";
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    int v17 = (int)v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s #hal device: %@ (%@) proximity: %d",  (uint8_t *)&v10,  0x26u);
  }

  -[ADDeviceProximityManager _insertProximityForRemoteDeviceID:rpProximity:]( self,  "_insertProximityForRemoteDeviceID:rpProximity:",  v5,  v6);
}

- (void)_insertProximityForRemoteDeviceID:(id)a3 rpProximity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  localDeviceIDSIdentifier = self->_localDeviceIDSIdentifier;
  if (v6 && localDeviceIDSIdentifier)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", localDeviceIDSIdentifier, v6, 0LL));
    id v9 = objc_alloc(&OBJC_CLASS___ADRapportProximityObservation);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = -[ADRapportProximityObservation initWithDeviceIDPair:proximity:observationDate:]( v9,  "initWithDeviceIDPair:proximity:observationDate:",  v8,  v4,  v10);

    -[ADDeviceProximityManager _recordProximityObservation:](self, "_recordProximityObservation:", v11);
    if (!self->_localIsCollector) {
      -[ADDeviceProximityManager _pushProximityObservationToCollector:]( self,  "_pushProximityObservationToCollector:",  v11);
    }
  }

  else
  {
    __int16 v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[ADDeviceProximityManager _insertProximityForRemoteDeviceID:rpProximity:]";
      __int16 v15 = 2112;
      __int16 v16 = localDeviceIDSIdentifier;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s #hal Invalid proximity observation for identifier(s): local %@, remote %@",  buf,  0x20u);
    }
  }
}

- (void)_recordProximityObservation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIDPair]);
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adpm_sortedKeyString"));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_proximityObservations,  "objectForKeyedSubscript:",  v7));
    id v9 = [v8 mutableCopy];
    int v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    __int16 v12 = v11;

    [v12 addObject:v5];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 indexesOfObjectsPassingTest:&stru_1004F4988]);
    if ([v13 count])
    {
      __int16 v14 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        id v21 = v14;
        *(_DWORD *)v22 = 136315650;
        *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
        *(_WORD *)&v22[12] = 2048;
        *(void *)&v22[14] = [v13 count];
        *(_WORD *)&v22[22] = 2048;
        id v23 = [v12 count];
        _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s #hal removing %lu expired keys of %lu",  v22,  0x20u);
      }

      [v12 removeObjectsAtIndexes:v13];
    }

    [v12 sortUsingComparator:&stru_1004F49C8];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);
    unsigned int v16 = [v15 isEqual:v5];

    __int16 v17 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)v22 = 136315394;
        *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
        *(_WORD *)&v22[12] = 2112;
        *(void *)&v22[14] = v5;
        v19 = "%s #hal Recorded latest observation: %@";
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v19, v22, 0x16u);
      }
    }

    else if (v18)
    {
      *(_DWORD *)v22 = 136315394;
      *(void *)&v22[4] = "-[ADDeviceProximityManager _recordProximityObservation:]";
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v5;
      v19 = "%s #hal Recorded stale observation: %@";
      goto LABEL_16;
    }

    id v20 = objc_msgSend(v12, "copy", *(_OWORD *)v22, *(void *)&v22[16]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_proximityObservations,  "setObject:forKeyedSubscript:",  v20,  v7);
  }
}

- (void)_pushProximityObservationToCollector:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v6 = [v5 assistantIsEnabled];

  if ((v6 & 1) != 0)
  {
    deviceCircleManager = self->_deviceCircleManager;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10019D8F8;
    v9[3] = &unk_1004F49F0;
    v9[4] = self;
    id v10 = v4;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v9);
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[ADDeviceProximityManager _pushProximityObservationToCollector:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s #hal Skip pushing proximity info as Siri is disabled",  buf,  0xCu);
    }
  }
}

- (void)_fetchProximityObservationsFromCollectorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[ADDeviceProximityManager _fetchProximityObservationsFromCollectorsWithCompletion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    }

    deviceCircleManager = self->_deviceCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10019D154;
    v7[3] = &unk_1004F4A80;
    v7[4] = self;
    id v8 = v4;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v7);
  }
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = (ADRapportLink *)a3;
  id v5 = v4;
  if (self->_messageLink == v4)
  {
    dispatch_time_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADDeviceProximityManager rapportLinkDidInterrupt:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s #hal message link interrupted",  (uint8_t *)&v8,  0xCu);
    }

    -[ADDeviceProximityManager _resetMessageLinkAndReconnectNow:](self, "_resetMessageLinkAndReconnectNow:", 1LL);
  }

  else if (self->_proximityDiscoveryLink == v4)
  {
    unsigned __int8 v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADDeviceProximityManager rapportLinkDidInterrupt:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s #hal proximity link interrupted",  (uint8_t *)&v8,  0xCu);
    }

    -[ADDeviceProximityManager _clearProximityDiscoveryLink](self, "_clearProximityDiscoveryLink");
  }
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = (ADRapportLink *)a3;
  id v5 = v4;
  if (self->_messageLink == v4)
  {
    dispatch_time_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADDeviceProximityManager rapportLinkDidInvalidate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #hal message link invalidated",  (uint8_t *)&v8,  0xCu);
    }

    -[ADDeviceProximityManager _resetMessageLinkAndReconnectNow:](self, "_resetMessageLinkAndReconnectNow:", 0LL);
  }

  else if (self->_proximityDiscoveryLink == v4)
  {
    unsigned __int8 v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADDeviceProximityManager rapportLinkDidInvalidate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s #hal proximity link invalidated",  (uint8_t *)&v8,  0xCu);
    }

    -[ADDeviceProximityManager _clearProximityDiscoveryLink](self, "_clearProximityDiscoveryLink");
  }
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "idsDeviceIdentifier", a3));
  localDeviceIDSIdentifier = self->_localDeviceIDSIdentifier;
  self->_localDeviceIDSIdentifier = v5;
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  unsigned __int8 v6 = (ADRapportLink *)a3;
  id v7 = a4;
  if (self->_proximityDiscoveryLink == v6)
  {
    int v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[ADDeviceProximityManager rapportLink:didFindDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v9, 0xCu);
    }

    -[ADDeviceProximityManager _updateProximityForDevice:](self, "_updateProximityForDevice:", v7);
  }
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v7 = (ADRapportLink *)a3;
  id v8 = a4;
  if (self->_proximityDiscoveryLink == v7)
  {
    int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315138;
      id v11 = "-[ADDeviceProximityManager rapportLink:didUpdateDevice:changes:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v10, 0xCu);
    }

    -[ADDeviceProximityManager _updateProximityForDevice:](self, "_updateProximityForDevice:", v8);
  }
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADDeviceProximityManager rapportLink:didLoseDevice:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
  if (v9 && self->_localDeviceIDSIdentifier)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v9, 0LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adpm_sortedKeyString"));

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_proximityObservations,  "objectForKeyedSubscript:",  v11));
    if (v12)
    {
      v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[ADDeviceProximityManager rapportLink:didLoseDevice:]";
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s #hal removing observations for lost device: %@",  buf,  0x16u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_proximityObservations,  "setObject:forKeyedSubscript:",  0LL,  v11);
    }
  }
}

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, void, void *))a7;
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (!self->_localIsCollector)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s #hal Local device is not collector for message %@",  buf,  0x16u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1014LL));
    v16[2](v16, 0LL, v19);
    goto LABEL_11;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v27 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s #hal Received %@ from %@: %@",  buf,  0x2Au);
  }

  if ([v14 isEqualToString:@"device_proximity_fetch"])
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_proximityObservations, "allValues"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "af_lenientMappedArray:", &stru_1004F4AA0));

    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADDeviceProximityManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s #hal Sending observations: %@",  buf,  0x16u);
    }

    v24 = @"proximity_observations";
    id v25 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    ((void (**)(id, void *, void *))v16)[2](v16, v21, 0LL);

LABEL_11:
    goto LABEL_12;
  }

  if ([v14 isEqualToString:@"device_proximity_push"])
  {
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v13, v22) & 1) != 0)
    {
      id v23 = -[ADRapportProximityObservation initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADRapportProximityObservation),  "initWithDictionaryRepresentation:",  v13);
      -[ADDeviceProximityManager _recordProximityObservation:](self, "_recordProximityObservation:", v23);
    }

    v16[2](v16, 0LL, 0LL);
  }

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10019CB68;
  v5[3] = &unk_1004FC4D0;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10019CB34;
  v10[3] = &unk_1004FD968;
  void v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019CA68;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v5 = (AFNotifyObserver *)a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self->_heardVoiceTriggerObserver == v5)
  {
    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[ADDeviceProximityManager notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #hal Heard Voice Trigger", buf, 0xCu);
    }

    id v17 = (NSDate *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:15.0]);
    id v18 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
    id v10 = [v18 initWithType:AFDeviceContextKeyHeardVoiceTrigger deliveryDate:v6 expirationDate:v17 redactedKeyPaths:0 historyConfiguration:0];
    -[AFContextDonationService donateContext:withMetadata:pushToRemote:]( self->_donationService,  "donateContext:withMetadata:pushToRemote:",  &off_100513450,  v10,  1LL);
    currentVoiceTriggerExpirationDate = self->_currentVoiceTriggerExpirationDate;
    self->_currentVoiceTriggerExpirationDate = v17;
    id v12 = v17;

    dispatch_time_t v13 = dispatch_time(0LL, 15100000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019C770;
    block[3] = &unk_1004FD940;
    block[4] = self;
    id v15 = block;
    goto LABEL_9;
  }

  if (self->_voiceTriggerFirstPassObserver == v5)
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[ADDeviceProximityManager notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #hal Voice Trigger first pass",  buf,  0xCu);
    }

    id v8 = (NSDate *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:5.0]);
    id v9 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
    id v10 = [v9 initWithType:AFDeviceContextKeyHeardVoiceTrigger deliveryDate:v6 expirationDate:v8 redactedKeyPaths:0 historyConfiguration:0];
    -[AFContextDonationService donateContext:withMetadata:pushToRemote:]( self->_donationService,  "donateContext:withMetadata:pushToRemote:",  &off_100513450,  v10,  0LL);
    id v11 = self->_currentVoiceTriggerExpirationDate;
    self->_currentVoiceTriggerExpirationDate = v8;
    id v12 = v8;

    dispatch_time_t v13 = dispatch_time(0LL, 5100000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10019C8EC;
    v20[3] = &unk_1004FD940;
    v20[4] = self;
    id v15 = v20;
LABEL_9:
    dispatch_after(v13, queue, v15);
  }
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (id)_queue
{
  return self->_queue;
}

- (void)_setMessageLink:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_100578018 != -1) {
    dispatch_once(&qword_100578018, &stru_1004F46A0);
  }
  return (id)qword_100578020;
}

@end