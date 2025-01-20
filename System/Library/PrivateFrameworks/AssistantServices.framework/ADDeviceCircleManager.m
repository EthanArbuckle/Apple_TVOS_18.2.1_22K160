@interface ADDeviceCircleManager
+ (ADDeviceCircleManager)sharedInstance;
+ (id)_rapportLinkWithQueue:(id)a3;
- (BOOL)_isDeviceCircleTrialTreatmentConsensusAchieved:(id)a3 andRemotePeerInfo:(id)a4;
- (BOOL)_isLocalDeviceCollectorCandidate;
- (BOOL)_isRemoteDeviceCollectorCandidate:(id)a3;
- (id)_collectorDeviceIdentifiersWithFlags;
- (id)_handleDeviceCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_handlePeersAndSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_handleSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_initWithQueue:(id)a3 rapportLink:(id)a4;
- (id)_keepAliveLinkToDevice:(id)a3;
- (id)_localPeerData;
- (id)_localPeerInfo;
- (id)_managedPeerInfoForAssistantIdentifier:(id)a3;
- (id)_managedPeerInfoForHomeKitAccessoryIdentifier:(id)a3;
- (id)_managedPeerInfoForIDSDeviceUniqueIdentifier:(id)a3;
- (id)_managedPeerInfoForRapportEffectiveIdentifier:(id)a3;
- (id)_managedPeerInfoMatchingPeerInfo:(id)a3;
- (id)_rapportLinkMessageOptions;
- (id)_remotePeerInfoForAssistantIdentifier:(id)a3;
- (id)_remotePeerInfoForHomeKitAccessoryIdentifier:(id)a3;
- (id)_remotePeerInfoForIDSDeviceUniqueIdentifier:(id)a3;
- (id)_remotePeerInfoForRapportEffectiveIdentifier:(id)a3;
- (id)_rpDeviceMatchingPeerInfo:(id)a3;
- (id)_setUpOnDemandClientLinkToContextCollector;
- (id)_syncCompanionLinkDeviceLocalPeerData;
- (id)assistantIdForDeviceWithIdsDeviceUniqueIdentifier:(id)a3;
- (id)idsDeviceUniqueIdentifierForDeviceWithAssistantId:(id)a3;
- (id)localPeerInfo;
- (id)locationSharingDevice;
- (id)managedPeerInfoMatchingPeerInfo:(id)a3;
- (unint64_t)_rapportLinkInstabilityPenalty;
- (void)_activateOnDemandClientLinkToContextCollector:(id)a3 completion:(id)a4;
- (void)_checkForGuestHomePodsOnNetworkWithCompletion:(id)a3;
- (void)_checkForMyriadHomePodTrialTreatmentConsensus;
- (void)_cleanupOnDemandClientLinkToContextCollector:(id)a3;
- (void)_executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandConnectionToContextCollector:(BOOL)a6 completion:(id)a7;
- (void)_executeCommandThroughOnDemandClientLinkToContextCollector:(id)a3 onPeer:(id)a4 debugID:(id)a5 completion:(id)a6;
- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 completion:(id)a4;
- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 fromCollectorWithIndex:(unint64_t)a4 existingCapabilities:(id)a5 completion:(id)a6;
- (void)_fetchSyncTokenFromDeviceWithCompanionAssistantId:(id)a3 aceHost:(id)a4 clientLink:(id)a5 completion:(id)a6;
- (void)_forwardExecuteCommandToDevice:(id)a3 message:(id)a4 from:(id)a5 completion:(id)a6;
- (void)_handleExecuteCommand:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4;
- (void)_reelectCollectorIfNecessary;
- (void)_registerRequestHandlerForRequestId:(id)a3 messageType:(id)a4 handler:(id)a5;
- (void)_removeRemotePeerInfoWithRapportEffectiveIdentifier:(id)a3;
- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_setAssistantId:(id)a3 forDeviceWithIdsDeviceUniqueIdentifier:(id)a4;
- (void)_setupClientLink;
- (void)_startStationaryScoreTimer;
- (void)_stopStationaryScoreTimer;
- (void)_updateAssistantIdentifierAndSharedUserIdentifier;
- (void)_updateClientLinkSiriInfo;
- (void)_updateCollectorElectionVersion;
- (void)_updateContextCollectorStatusToRapport:(BOOL)a3;
- (void)_updateCurrentAccessoryInfo:(id)a3;
- (void)_updateDeviceCountTrend;
- (void)_updateLocalPeerInfo:(id)a3;
- (void)_updateRemotePeerInfo:(id)a3;
- (void)_updateSiriInfoWithDeviceCapabilities;
- (void)_updateSiriInfoWithLocalPeerData:(id)a3;
- (void)_updateStationaryScore;
- (void)_updateStationaryScoreAndResetTimer;
- (void)_updateStationaryScoreBroadcasting;
- (void)activeAccountIdentifierDidChange:(id)a3;
- (void)addListener:(id)a3;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandRapportConnection:(id)a6;
- (void)fetchSyncTokenForCompanionAssistantId:(id)a3 aceHost:(id)a4 completion:(id)a5;
- (void)getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:(id)a3;
- (void)getCapabilitiesForDevice:(id)a3 completion:(id)a4;
- (void)getCapabilitiesForReachableDevicesWithCompletion:(id)a3;
- (void)getContextCollectorDeviceIdentifiersWithCompletion:(id)a3;
- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3;
- (void)homeInfoManager:(id)a3 didUpdateCurrentAccessoryInfo:(id)a4;
- (void)isMeDeviceDidChange:(id)a3;
- (void)myriadTrialBoostsUpdated:(id)a3;
- (void)preferencesEnabledBitsDidChange:(id)a3;
- (void)preferencesSharedUserIdentifierDidChange:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4;
- (void)reelectContextCollectorWithBestScore;
- (void)removeListener:(id)a3;
- (void)sendRequestType:(id)a3 data:(id)a4 toDeviceWithAssistantIdentifier:(id)a5 onQueue:(id)a6 completion:(id)a7;
- (void)sharedDataDidChange:(id)a3;
- (void)updatePersonalRequestsEnabledAccessories:(id)a3;
- (void)wakeUpNearbyDevices;
@end

@implementation ADDeviceCircleManager

- (id)_initWithQueue:(id)a3 rapportLink:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___ADDeviceCircleManager;
  v9 = -[ADDeviceCircleManager init](&v50, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("ADDeviceCircleManagerMUXSync", v12);

    muxSyncQueue = v10->_muxSyncQueue;
    v10->_muxSyncQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v15;

    v10->_rollingRSSI = 0.0;
    v10->_rollingRSSICount = 0LL;
    v10->_currentStationaryScore = 0.0;
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    deviceCountTrend = v10->_deviceCountTrend;
    v10->_deviceCountTrend = v17;

    v10->_assistantIdMapLock._os_unfair_lock_opaque = 0;
    v10->_peerInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    svdCapabilities = v10->_svdCapabilities;
    v10->_svdCapabilities = (NSArray *)v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMapTable);
    requestHandlers = v10->_requestHandlers;
    v10->_requestHandlers = v21;

    v10->_consensusInProgress = 0;
    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v25 = dispatch_queue_create("ADDeviceCircleManagerConsensus", v24);

    consensusQueue = v10->_consensusQueue;
    v10->_consensusQueue = (OS_dispatch_queue *)v25;

    onDemandClientLinkToContextCollector = v10->_onDemandClientLinkToContextCollector;
    v10->_onDemandClientLinkToContextCollector = 0LL;

    objc_storeStrong((id *)&v10->_clientLink, a4);
    -[ADDeviceCircleManager _setupClientLink](v10, "_setupClientLink");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v10 selector:"preferencesEnabledBitsDidChange:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v10 selector:"activeAccountIdentifierDidChange:" name:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v30 addObserver:v10 selector:"preferencesSharedUserIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];

    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v31 addObserver:v10 selector:"myriadTrialBoostsUpdated:" name:@"AFMyriadTrialBoostsUpdatedNotification" object:0];

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v32 addObserver:v10 selector:"sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0];

    queue = (dispatch_queue_s *)v10->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10016A3A0;
    block[3] = &unk_1004FD940;
    v34 = v10;
    v49 = v34;
    dispatch_async(queue, block);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    [v35 addListener:v34];
    v36 = (dispatch_queue_s *)v10->_queue;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10016A3A8;
    v45[3] = &unk_1004FD968;
    id v46 = v35;
    v37 = v34;
    v47 = v37;
    id v38 = v35;
    dispatch_async(v36, v45);
    AFLogInitIfNeeded(-[ADDeviceCircleManager _setupMUXSupport](v37, "_setupMUXSupport"));
    v39 = v10->_queue;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10016A414;
    v43[3] = &unk_1004FBBD0;
    v44 = v39;
    v41 = v39;
    [v40 addQueue:v41 heartBeatInterval:v43 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v10;
}

- (void)updatePersonalRequestsEnabledAccessories:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016A398;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupClientLink
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100169EC4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_setUpOnDemandClientLinkToContextCollector
{
  id v3 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004F3350);
  v4 = -[ADRapportLink initWithQueue:configuration:]( objc_alloc(&OBJC_CLASS___ADRapportLink),  "initWithQueue:configuration:",  self->_queue,  v3);
  -[ADRapportLink addListener:](v4, "addListener:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _rapportLinkMessageOptions](self, "_rapportLinkMessageOptions"));
  -[ADRapportLink registerRequestID:options:]( v4,  "registerRequestID:options:",  @"com.apple.siri.rapport-link.request.device-circle-manager",  v5);

  return v4;
}

- (void)_activateOnDemandClientLinkToContextCollector:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100169B6C;
  v7[3] = &unk_1004FD740;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v6 activateWithCompletion:v7];
}

- (void)_cleanupOnDemandClientLinkToContextCollector:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[ADDeviceCircleManager _cleanupOnDemandClientLinkToContextCollector:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s #hal #on-demand clean up #on-demand connection: %@",  (uint8_t *)&v7,  0x16u);
  }

  [v4 invalidate];
  onDemandClientLinkToContextCollector = self->_onDemandClientLinkToContextCollector;
  self->_onDemandClientLinkToContextCollector = 0LL;
}

- (id)_rapportLinkMessageOptions
{
  uint64_t v3 = RPOptionStatusFlags;
  id v4 = &off_100513330;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)assistantIdForDeviceWithIdsDeviceUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_assistantIdMapLock = &self->_assistantIdMapLock;
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assistantIdsByDeviceIDSID, "objectForKey:", v4));
    os_unfair_lock_unlock(p_assistantIdMapLock);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_setAssistantId:(id)a3 forDeviceWithIdsDeviceUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uppercaseString]);
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    if (!assistantIdsByDeviceIDSID)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      dispatch_queue_attr_t v11 = self->_assistantIdsByDeviceIDSID;
      self->_assistantIdsByDeviceIDSID = v10;

      assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    }

    -[NSMutableDictionary setObject:forKey:](assistantIdsByDeviceIDSID, "setObject:forKey:", v8, v7);
    os_unfair_lock_unlock(&self->_assistantIdMapLock);
    v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      v14 = "-[ADDeviceCircleManager _setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:]";
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s #hal Updated assistantId %@ for device %@",  (uint8_t *)&v13,  0x20u);
    }
  }
}

- (id)idsDeviceUniqueIdentifierForDeviceWithAssistantId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);
    uint64_t v14 = 0LL;
    __int16 v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    __int16 v17 = sub_100164CA8;
    id v18 = sub_100164CB8;
    id v19 = 0LL;
    p_assistantIdMapLock = &self->_assistantIdMapLock;
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100169AFC;
    v11[3] = &unk_1004F8EB8;
    id v8 = v5;
    id v12 = v8;
    int v13 = &v14;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( assistantIdsByDeviceIDSID,  "enumerateKeysAndObjectsUsingBlock:",  v11);
    os_unfair_lock_unlock(p_assistantIdMapLock);
    id v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)getContextCollectorDeviceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((AFSupportsHALContextCollectorElection() & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10016973C;
      v6[3] = &unk_1004FD990;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(queue, v6);
    }

    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100169730;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100169724;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reelectContextCollectorWithBestScore
{
  if (AFSupportsHALContextCollectorElection(self, a2))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100169608;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (id)_rpDeviceMatchingPeerInfo:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoMatchingPeerInfo:]( self,  "_managedPeerInfoMatchingPeerInfo:",  a3));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 effectiveIdentifier]);
        dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportEffectiveIdentifier]);
        unsigned int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)getCapabilitiesForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001691E8;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async(queue, block);
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)getCapabilitiesForReachableDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100168F7C;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[ADDeviceCircleManager getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_6;
    }
  }

  else if (!v4)
  {
    goto LABEL_6;
  }

  if ((AFSupportsHALOnDemandRapportConnection(v6, v7) & 1) == 0) {
    v4[2](v4, 0LL);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@"-"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001684A0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v15 = v11;
  __int128 v16 = v4;
  id v13 = v11;
  dispatch_async(queue, block);

LABEL_6:
}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100168424;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)wakeUpNearbyDevices
{
  if (AFSupportsHALContextCollecting(self, a2))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100168228;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (id)locationSharingDevice
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siriInfo]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"peerData"]);

        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"isLocationSharingDevice"]);
          unsigned int v13 = [v12 BOOLValue];

          if (v13)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveIdentifier]);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remotePeerInfoByRapportEffectiveIdentifier,  "objectForKey:",  v15));

            goto LABEL_12;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  __int128 v14 = 0LL;
LABEL_12:

  return v14;
}

- (void)_registerRequestHandlerForRequestId:(id)a3 messageType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    uint64_t v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v8,  v9));
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v16 = "-[ADDeviceCircleManager _registerRequestHandlerForRequestId:messageType:handler:]";
      __int16 v17 = 2112;
      __int128 v18 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal combinedKey: %@", buf, 0x16u);
    }

    -[NSMapTable setObject:forKey:](self->_requestHandlers, "setObject:forKey:", v10, v11);
    unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      requestHandlers = self->_requestHandlers;
      *(_DWORD *)buf = 136315394;
      __int128 v16 = "-[ADDeviceCircleManager _registerRequestHandlerForRequestId:messageType:handler:]";
      __int16 v17 = 2112;
      __int128 v18 = requestHandlers;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s #hal registered handlers: %@",  buf,  0x16u);
    }
  }
}

- (void)_forwardExecuteCommandToDevice:(id)a3 message:(id)a4 from:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled") & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"type"]);
    unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v20 = "-[ADDeviceCircleManager _forwardExecuteCommandToDevice:message:from:completion:]";
      __int16 v21 = 2112;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s #hal Forward executeCommand of type: %@ to device: %@",  buf,  0x20u);
    }

    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100168124;
    v16[3] = &unk_1004F4150;
    id v17 = v9;
    id v18 = v11;
    -[ADDeviceCircleManager sendRequestType:data:toDeviceWithAssistantIdentifier:onQueue:completion:]( self,  "sendRequestType:data:toDeviceWithAssistantIdentifier:onQueue:completion:",  v12,  v10,  v17,  queue,  v16);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v15);
  }
}

- (void)sendRequestType:(id)a3 data:(id)a4 toDeviceWithAssistantIdentifier:(id)a5 onQueue:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  clientLink = self->_clientLink;
  id v16 = a4;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _rapportLinkMessageOptions](self, "_rapportLinkMessageOptions"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100167F64;
  v22[3] = &unk_1004F68A0;
  id v24 = v13;
  id v25 = v14;
  id v23 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  -[ADRapportLink sendRequestID:messageType:messagePayload:toDeviceWithAssistantIdentifier:options:completion:]( clientLink,  "sendRequestID:messageType:messagePayload:toDeviceWithAssistantIdentifier:options:completion:",  @"com.apple.siri.rapport-link.request.device-circle-manager",  v17,  v16,  v21,  v18,  v22);
}

- (id)managedPeerInfoMatchingPeerInfo:(id)a3
{
  if (a3)
  {
    p_peerInfoLock = &self->_peerInfoLock;
    id v5 = a3;
    os_unfair_lock_lock(p_peerInfoLock);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoMatchingPeerInfo:]( self,  "_managedPeerInfoMatchingPeerInfo:",  v5));

    os_unfair_lock_unlock(p_peerInfoLock);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)localPeerInfo
{
  p_peerInfoLock = &self->_peerInfoLock;
  os_unfair_lock_lock(&self->_peerInfoLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerInfo](self, "_localPeerInfo"));
  os_unfair_lock_unlock(p_peerInfoLock);
  return v4;
}

- (id)_syncCompanionLinkDeviceLocalPeerData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  os_unfair_lock_lock(&self->_peerInfoLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerData](self, "_localPeerData"));
  id v5 = v4;
  if (v3) {
    id v6 = sub_1001659FC(v3, v4);
  }
  else {
    id v6 = sub_100163C0C(v4);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[ADDeviceCircleManager _updateLocalPeerInfo:](self, "_updateLocalPeerInfo:", v7);
  os_unfair_lock_unlock(&self->_peerInfoLock);

  return v5;
}

- (void)_updateContextCollectorStatusToRapport:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled"))
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ADDeviceCircleManager _updateContextCollectorStatusToRapport:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v6, 0xCu);
    }

    -[ADRapportLink updateLocalDeviceIsContextCollector:](self->_clientLink, "updateLocalDeviceIsContextCollector:", v3);
  }

- (void)_updateClientLinkSiriInfo
{
  if ((AFIsNano(self) & 1) == 0)
  {
    BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      double currentStationaryScore = self->_currentStationaryScore;
      BOOL isCollector = self->_isCollector;
      int v9 = 136315650;
      id v10 = "-[ADDeviceCircleManager _updateClientLinkSiriInfo]";
      __int16 v11 = 2048;
      double v12 = currentStationaryScore;
      __int16 v13 = 1024;
      BOOL v14 = isCollector;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s #hal Updating score to %.2f, isCollector to %d",  (uint8_t *)&v9,  0x1Cu);
    }

    *(float *)&double v4 = self->_currentStationaryScore;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4));
    +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  v5,  @"stationaryScore");

    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isCollector));
    +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  v6,  @"isCollector");
  }

- (id)_collectorDeviceIdentifiersWithFlags
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADRapportLink siriInfoToBeBroadcasted](&OBJC_CLASS___ADRapportLink, "siriInfoToBeBroadcasted"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"isCollector"]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);

    if (v8) {
      -[NSMutableArray addObject:](v3, "addObject:", v8);
    }
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&__int128 v11 = 136315138LL;
    __int128 v23 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "siriInfo", v23));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"isCollector"]);
        unsigned int v18 = [v17 BOOLValue];

        if (v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDeviceIdentifier]);

          if (v19)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDeviceIdentifier]);
            -[NSMutableArray addObject:](v3, "addObject:", v20);
          }

          else
          {
            id v21 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v29 = "-[ADDeviceCircleManager _collectorDeviceIdentifiersWithFlags]";
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Collector device does not have idsDeviceIdentifier. Skipping.",  buf,  0xCu);
            }
          }
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v12);
  }

  return v3;
}

- (BOOL)_isLocalDeviceCollectorCandidate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  if (AFSupportsHALContextCollecting(v2, v3))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v2 homeKitIdentifier]);
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 idsDeviceIdentifier]);
      if (v5)
      {
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
        unsigned __int8 v7 = [v6 assistantIsEnabled];
      }

      else
      {
        unsigned __int8 v7 = 0;
      }
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_isRemoteDeviceCollectorCandidate:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 siriInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"collectorElectionVersion"]);
  [v5 floatValue];
  float v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 homeKitIdentifier]);
  if (v8)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceIdentifier]);
    BOOL v11 = v7 >= 1.0 && v9 != 0LL;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updateCollectorElectionVersion
{
  if (AFSupportsHALContextCollectorElection(self, a2))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v3 = [v2 assistantIsEnabled];

    if (v3)
    {
      +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  &off_100513BA8,  @"collectorElectionVersion");
    }

    else
    {
      double v4 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        float v6 = "-[ADDeviceCircleManager _updateCollectorElectionVersion]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Siri is turned off", (uint8_t *)&v5, 0xCu);
      }

      +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  &off_100513BB8,  @"collectorElectionVersion");
    }
  }

- (void)_reelectCollectorIfNecessary
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _collectorDeviceIdentifiersWithFlags](self, "_collectorDeviceIdentifiersWithFlags"));
  id v3 = [v9 count];
  if (-[NSArray count](self->_currentCollectorIDs, "count")) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = 1LL;
LABEL_11:
    -[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]( self,  "_reelectCollectorDeviceForReason:completion:",  v5,  0LL);
    goto LABEL_12;
  }

  float v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->_currentCollectorIDs));
  unsigned int v8 = [v6 isEqualToSet:v7];

  if (!v8)
  {
    uint64_t v5 = 4LL;
    goto LABEL_11;
  }

  if ((unint64_t)v3 >= 2)
  {
    uint64_t v5 = 2LL;
    goto LABEL_11;
  }

- (void)_reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4
{
  float v6 = (void (**)(void))a4;
  if ((AFSupportsHALContextCollectorElection(v6, v7) & 1) != 0)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier]);
    v94 = self;
    unsigned int v10 = -[ADDeviceCircleManager _isLocalDeviceCollectorCandidate](self, "_isLocalDeviceCollectorCandidate");
    BOOL v11 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      else {
        id v12 = off_1004F3838[a3];
      }
      *(_DWORD *)buf = 136315394;
      v124 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
      __int16 v125 = 2112;
      v126 = v12;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #hal Re-election reason: %@", buf, 0x16u);
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](v94->_clientLink, "activeDevices"));

    if (!v14)
    {
      id v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v124 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s #hal No other devices nearby", buf, 0xCu);
      }

      if (v94->_isCollector)
      {
        BOOL isCollector = 1LL;
      }

      else
      {
        currentCollectorIDs = v94->_currentCollectorIDs;
        if (currentCollectorIDs)
        {
          v94->_currentCollectorIDs = 0LL;

          __int128 v119 = 0u;
          __int128 v120 = 0u;
          __int128 v117 = 0u;
          __int128 v118 = 0u;
          __int128 v24 = v94->_listeners;
          id v25 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v117,  v131,  16LL);
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v118;
            do
            {
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v118 != v27) {
                  objc_enumerationMutation(v24);
                }
                [*(id *)(*((void *)&v117 + 1) + 8 * (void)i) contextCollectorChangedToDevicesWithIdentifiers:v94->_currentCollectorIDs localDeviceIsCollector:v94->_isCollector];
              }

              id v26 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v117,  v131,  16LL);
            }

            while (v26);
          }

          BOOL isCollector = v94->_isCollector;
        }

        else
        {
          BOOL isCollector = 0LL;
        }
      }

      -[ADDeviceCircleManager _updateContextCollectorStatusToRapport:]( v94,  "_updateContextCollectorStatusToRapport:",  isCollector);
      if (v6) {
        v6[2](v6);
      }
      goto LABEL_71;
    }

    v86 = v6;
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v92 = v15;
    v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unint64_t v16 = 0LL;
    char v83 = v10;
    if (v10 && v9)
    {
      -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v8, v9);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADRapportLink siriInfoToBeBroadcasted](&OBJC_CLASS___ADRapportLink, "siriInfoToBeBroadcasted"));
      id v18 = [v17 mutableCopy];
      id v19 = v18;
      if (v18) {
        id v20 = (NSMutableDictionary *)v18;
      }
      else {
        id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }
      v29 = v20;

      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v9, @"idsDeviceIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"stationaryScore"]);
      if (!v30)
      {
        -[ADDeviceCircleManager _updateStationaryScore](v94, "_updateStationaryScore");
        *(float *)&double v31 = v94->_currentStationaryScore;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v31));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v32, @"stationaryScore");
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v29, "objectForKey:", @"isCollector"));
      unsigned int v34 = [v33 BOOLValue];

      -[NSMutableArray addObject:](v15, "addObject:", v29);
      unint64_t v16 = v34;
      v35 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v79 = v35;
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v29, "objectForKey:", @"stationaryScore"));
        [v80 floatValue];
        *(_DWORD *)buf = 136315906;
        v124 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
        __int16 v125 = 2112;
        v126 = v9;
        __int16 v127 = 2048;
        double v128 = v81;
        __int16 v129 = 1024;
        int v130 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEBUG,  "%s #hal Collector candidate (local) %@: score %.2f, isCollector %d",  buf,  0x26u);
      }
    }

    v84 = v9;
    v85 = v8;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    v36 = v94;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](v94->_clientLink, "activeDevices"));
    id v38 = [v37 countByEnumeratingWithState:&v113 objects:v122 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v114;
      do
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v114 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v113 + 1) + 8LL * (void)j);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 siriInfo]);
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue([v42 idsDeviceIdentifier]);
          if (-[ADDeviceCircleManager _isRemoteDeviceCollectorCandidate:]( v36,  "_isRemoteDeviceCollectorCandidate:",  v42))
          {
            BOOL v45 = v44 == 0LL;
          }

          else
          {
            BOOL v45 = 1;
          }

          if (!v45)
          {
            id v46 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"stationaryScore"]);

            if (v46)
            {
              -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v42, v44);
              id v47 = [v43 mutableCopy];
              [v47 setObject:v44 forKey:@"idsDeviceIdentifier"];
              -[NSMutableArray addObject:](v92, "addObject:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"isCollector"]);
              unsigned int v49 = [v48 BOOLValue];

              objc_super v50 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
              {
                v51 = v50;
                v90 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"stationaryScore"]);
                [v90 floatValue];
                *(_DWORD *)buf = 136315906;
                v124 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
                __int16 v125 = 2112;
                v126 = v44;
                __int16 v127 = 2048;
                double v128 = v52;
                __int16 v129 = 1024;
                int v130 = v49;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEBUG,  "%s #hal Collector candidate %@: score %.2f, isCollector %d",  buf,  0x26u);
              }

              v16 += v49;

              v36 = v94;
            }
          }
        }

        id v39 = [v37 countByEnumeratingWithState:&v113 objects:v122 count:16];
      }

      while (v39);
    }

    v53 = v92;
    -[NSMutableArray sortUsingComparator:](v92, "sortUsingComparator:", &stru_1004F3420);
    v54 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v91 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v89 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v55 = dispatch_group_create();
    v56 = &unk_1003C9000;
    if (v16 < 2)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v92, "firstObject"));

      unsigned int v8 = v85;
      float v6 = v86;
      id v9 = v84;
      char v73 = v83;
      if (!v75)
      {
LABEL_67:
        queue = (dispatch_queue_s *)v94->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = v56[280];
        block[2] = sub_100167950;
        block[3] = &unk_1004F5B98;
        void block[4] = v94;
        v96 = v54;
        v97 = v89;
        char v100 = v73;
        v98 = v9;
        v99 = v6;
        v77 = v89;
        v78 = v54;
        dispatch_group_notify(v55, queue, block);

LABEL_71:
        goto LABEL_72;
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v92, "firstObject"));
      v74 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v57 objectForKey:@"idsDeviceIdentifier"]);
      -[NSMutableArray addObject:](v54, "addObject:", v74);
    }

    else
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      obj = v92;
      id v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
      if (v58)
      {
        id v60 = v58;
        v88 = v57;
        uint64_t v61 = *(void *)v110;
        *(void *)&__int128 v59 = 136315394LL;
        __int128 v82 = v59;
LABEL_51:
        uint64_t v62 = 0LL;
        while (1)
        {
          if (*(void *)v110 != v61) {
            objc_enumerationMutation(obj);
          }
          v63 = *(void **)(*((void *)&v109 + 1) + 8 * v62);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", @"isCollector", v82));
          unsigned int v65 = [v64 BOOLValue];

          if (!v65) {
            break;
          }
          v66 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKey:@"idsDeviceIdentifier"]);
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v66));
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString homeKitIdentifier](v67, "homeKitIdentifier"));
          if (v68)
          {
            dispatch_group_enter(v55);
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString homeKitIdentifier](v67, "homeKitIdentifier"));
            v101[0] = _NSConcreteStackBlock;
            v101[1] = 3221225472LL;
            v101[2] = sub_10016783C;
            v101[3] = &unk_1004F3470;
            v101[4] = v36;
            v102 = v67;
            id v70 = v88;
            id v103 = v70;
            v104 = v54;
            id v105 = v66;
            v106 = v91;
            v107 = v89;
            v108 = v55;
            v71 = v70;
            v36 = v94;
            [v71 getHomeIdForAccessoryId:v69 completion:v101];
          }

          else
          {
            v72 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v82;
              v124 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
              __int16 v125 = 2112;
              v126 = v67;
              _os_log_error_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "%s Unable to get HomeKit identifier for %@",  buf,  0x16u);
            }

            -[NSMutableArray addObject:](v54, "addObject:", v66);
          }

          if (v60 == (id)++v62)
          {
            id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
            if (v60) {
              goto LABEL_51;
            }
            break;
          }
        }

        unsigned int v8 = v85;
        float v6 = v86;
        id v9 = v84;
        char v73 = v83;
        v56 = (void *)&unk_1003C9000;
        v74 = obj;
        v57 = v88;
      }

      else
      {
        unsigned int v8 = v85;
        float v6 = v86;
        id v9 = v84;
        char v73 = v83;
        v74 = obj;
      }
    }

    v53 = v92;
    goto LABEL_67;
  }

  if (v6) {
    v6[2](v6);
  }
LABEL_72:
}

- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 completion:(id)a6
{
}

- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandRapportConnection:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if (AFSupportsHALOnDemandRapportConnection(v12, v13))
  {
    -[ADDeviceCircleManager _executeCommand:onPeer:executionContext:throughOnDemandConnectionToContextCollector:completion:]( self,  "_executeCommand:onPeer:executionContext:throughOnDemandConnectionToContextCollector:completion:",  v15,  v10,  v11,  1LL,  v12);
  }

  else if (v12)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    v12[2](v12, 0LL, v14);
  }
}

- (void)_executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandConnectionToContextCollector:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  unint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[ADDeviceCircleManager _executeCommand:onPeer:executionContext:throughOnDemandConnectionToContextCollector:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v12 && v13)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100167268;
    v19[3] = &unk_1004F5B98;
    id v20 = v14;
    id v21 = self;
    id v22 = v12;
    id v23 = v13;
    BOOL v25 = a6;
    id v24 = v15;
    dispatch_async(queue, v19);

    id v18 = v20;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  31LL,  0LL));
    if (v15) {
      (*((void (**)(id, void *, void *))v15 + 2))(v15, &__NSDictionary0__struct, v18);
    }
  }
}

- (void)_executeCommandThroughOnDemandClientLinkToContextCollector:(id)a3 onPeer:(id)a4 debugID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((AFSupportsHALOnDemandRapportConnection(v13, v14) & 1) != 0)
  {
    id obj = (id)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _setUpOnDemandClientLinkToContextCollector]( self,  "_setUpOnDemandClientLinkToContextCollector"));
    -[ADRapportLink invalidate](self->_onDemandClientLinkToContextCollector, "invalidate");
    objc_storeStrong((id *)&self->_onDemandClientLinkToContextCollector, obj);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 assistantIdentifier]);

    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 assistantIdentifier]);
      [v15 setObject:v17 forKeyedSubscript:@"recipient_assistant_identifier"];
    }

    id v30 = v10;
    v49[0] = 0LL;
    v49[1] = v49;
    v49[2] = 0x3032000000LL;
    v49[3] = sub_100164CA8;
    v49[4] = sub_100164CB8;
    id v50 = 0LL;
    v47[0] = 0LL;
    v47[1] = v47;
    v47[2] = 0x3032000000LL;
    v47[3] = sub_100164CA8;
    v47[4] = sub_100164CB8;
    id v48 = 0LL;
    id v18 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100166CBC;
    v40[3] = &unk_1004F34C0;
    id v19 = v12;
    id v41 = v19;
    id v42 = 0LL;
    v43 = self;
    id v44 = v13;
    BOOL v45 = v49;
    id v46 = v47;
    id v20 = -[AFSafetyBlock initWithBlock:](v18, "initWithBlock:", v40);
    id v21 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100166E24;
    v38[3] = &unk_1004FD940;
    id v23 = v20;
    id v39 = v23;
    id v24 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v21,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v38,  1.7);
    -[AFWatchdogTimer start](v24, "start");
    BOOL v25 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v52 = "-[ADDeviceCircleManager _executeCommandThroughOnDemandClientLinkToContextCollector:onPeer:debugID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #hal activating #on-demand connection to context collector...",  buf,  0xCu);
    }

    onDemandClientLinkToContextCollector = self->_onDemandClientLinkToContextCollector;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100166E50;
    v32[3] = &unk_1004F3538;
    v32[4] = self;
    v36 = v47;
    uint64_t v27 = v23;
    v33 = v27;
    id v28 = v15;
    id v34 = v28;
    id v35 = v19;
    v37 = v49;
    -[ADDeviceCircleManager _activateOnDemandClientLinkToContextCollector:completion:]( self,  "_activateOnDemandClientLinkToContextCollector:completion:",  onDemandClientLinkToContextCollector,  v32);

    id v10 = v30;
    _Block_object_dispose(v47, 8);

    _Block_object_dispose(v49, 8);
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v29);
  }
}

- (void)_updateSiriInfoWithDeviceCapabilities
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  else {
    uint64_t v6 = 2LL;
  }

  id v7 = [[SVDAssistantEnabledCapability alloc] initWithStatus:v6];
  id v8 = -[NSMutableArray addObject:](v4, "addObject:", v7);
  uint64_t v10 = AFIsATV(v8, v9);
  if ((v10 & 1) == 0)
  {
    id v12 = [[SVDAlarmTimerIntentsHandlingCapability alloc] initWithStatus:1];
    -[NSMutableArray addObject:](v4, "addObject:", v12);
  }

  uint64_t v13 = AFIsATV(v10, v11);
  if ((_DWORD)v13)
  {
    id v15 = [[SVDAppLaunchCapability alloc] initWithStatus:1];
    -[NSMutableArray addObject:](v4, "addObject:", v15);
    id v16 = [[SVDVideoPlaybackCapability alloc] initWithStatus:1];
    -[NSMutableArray addObject:](v4, "addObject:", v16);
    id v17 = [[SVDSeymourRoutingCapability alloc] initWithStatus:1];
    -[NSMutableArray addObject:](v4, "addObject:", v17);
    if (+[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled"))
    {
      id v18 = [[SVDProfileSwitchingCapability alloc] initWithStatus:1];
      -[NSMutableArray addObject:](v4, "addObject:", v18);
    }
  }

  else
  {
    uint64_t v19 = AFIsHorseman(v13, v14);
    if ((v19 & 1) == 0)
    {
      uint64_t v19 = (uint64_t)[v3 isEndpoint];
      if (!(_DWORD)v19) {
        goto LABEL_17;
      }
    }

    id v15 = [[SVDCustomTimerIntentHandlingCapability alloc] initWithStatus:1];
    -[NSMutableArray addObject:](v4, "addObject:", v15);
  }

LABEL_17:
  svdCapabilities = self->_svdCapabilities;
  p_svdCapabilities = &self->_svdCapabilities;
  if (!-[NSArray isEqualToArray:](svdCapabilities, "isEqualToArray:", v4))
  {
    id v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 136315394;
      id v26 = "-[ADDeviceCircleManager _updateSiriInfoWithDeviceCapabilities]";
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s #hal Updating device capabilities V2 to %@",  (uint8_t *)&v25,  0x16u);
    }

    id v24 = -[NSMutableArray af_lenientMappedArray:](v4, "af_lenientMappedArray:", &stru_1004F7B70);
    +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  v24,  @"deviceCapabilitiesV2");
    objc_storeStrong((id *)p_svdCapabilities, v4);
  }
}

- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100166CB0;
    v9[3] = &unk_1004FC7E8;
    id v10 = v7;
    -[ADDeviceCircleManager _fetchDeviceCapabilitiesForDevices:fromCollectorWithIndex:existingCapabilities:completion:]( self,  "_fetchDeviceCapabilitiesForDevices:fromCollectorWithIndex:existingCapabilities:completion:",  v6,  0LL,  v8,  v9);
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 fromCollectorWithIndex:(unint64_t)a4 existingCapabilities:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (-[NSArray count](self->_currentCollectorIDs, "count") <= a4)
  {
    v12[2](v12, v11);
  }

  else if ([v10 count])
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_currentCollectorIDs, "objectAtIndex:", a4));
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100166500;
    v33[3] = &unk_1004F3A98;
    id v14 = v10;
    id v34 = v14;
    id v15 = v13;
    id v35 = v15;
    v36 = self;
    unint64_t v39 = a4;
    id v16 = v11;
    id v37 = v16;
    id v38 = v12;
    id v17 = objc_retainBlock(v33);
    int v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "af_lenientMappedArray:", &stru_1004F3578));
    clientLink = self->_clientLink;
    uint64_t v40 = @"get_capabilities_for_assistant_identifiers";
    id v41 = v25;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _rapportLinkMessageOptions](self, "_rapportLinkMessageOptions"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001665D0;
    v26[3] = &unk_1004F35E8;
    id v27 = v14;
    id v28 = v16;
    v29 = v15;
    id v30 = self;
    id v31 = v24;
    id v32 = v17;
    id v20 = v24;
    id v21 = v17;
    id v22 = v15;
    -[ADRapportLink sendRequestID:messageType:messagePayload:toDeviceWithIDSDeviceID:options:completion:]( clientLink,  "sendRequestID:messageType:messagePayload:toDeviceWithIDSDeviceID:options:completion:",  @"com.apple.siri.rapport-link.request.device-circle-manager",  @"svdCapabilities_fetch",  v18,  v20,  v19,  v26);
  }

  else
  {
    v12[2](v12, 0LL);
  }
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[ADDeviceCircleManager rapportLink:didFindDevice:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v16, 0x16u);
  }

  -[ADDeviceCircleManager _updateStationaryScoreBroadcasting](self, "_updateStationaryScoreBroadcasting");
  -[ADDeviceCircleManager _reelectCollectorIfNecessary](self, "_reelectCollectorIfNecessary");
  -[ADDeviceCircleManager _updateDeviceCountTrend](self, "_updateDeviceCountTrend");
  id v9 = sub_1001659FC(v7, 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  os_unfair_lock_lock(&self->_peerInfoLock);
  -[ADDeviceCircleManager _updateRemotePeerInfo:](self, "_updateRemotePeerInfo:", v10);
  os_unfair_lock_unlock(&self->_peerInfoLock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assistantIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceUniqueIdentifier]);
  -[ADDeviceCircleManager _setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:]( self,  "_setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:",  v11,  v12);

  uint64_t v14 = AFIsInternalInstall(v13);
  if ((_DWORD)v14 && AFIsHorseman(v14, v15)) {
    -[ADDeviceCircleManager _checkForMyriadHomePodTrialTreatmentConsensus]( self,  "_checkForMyriadHomePodTrialTreatmentConsensus");
  }
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "-[ADDeviceCircleManager rapportLink:didLoseDevice:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v15, 0x16u);
  }

  currentCollectorIDs = self->_currentCollectorIDs;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
  LODWORD(currentCollectorIDs) = -[NSArray containsObject:](currentCollectorIDs, "containsObject:", v10);

  if ((_DWORD)currentCollectorIDs) {
    -[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]( self,  "_reelectCollectorDeviceForReason:completion:",  3LL,  0LL);
  }
  else {
    -[ADDeviceCircleManager _updateStationaryScoreBroadcasting](self, "_updateStationaryScoreBroadcasting");
  }
  -[ADDeviceCircleManager _updateDeviceCountTrend](self, "_updateDeviceCountTrend");
  os_unfair_lock_lock(&self->_peerInfoLock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 effectiveIdentifier]);
  -[ADDeviceCircleManager _removeRemotePeerInfoWithRapportEffectiveIdentifier:]( self,  "_removeRemotePeerInfoWithRapportEffectiveIdentifier:",  v11);

  os_unfair_lock_unlock(&self->_peerInfoLock);
  uint64_t v13 = AFIsInternalInstall(v12);
  if ((_DWORD)v13 && AFIsHorseman(v13, v14)) {
    -[ADDeviceCircleManager _checkForMyriadHomePodTrialTreatmentConsensus]( self,  "_checkForMyriadHomePodTrialTreatmentConsensus");
  }
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315394;
    id v20 = "-[ADDeviceCircleManager rapportLink:didUpdateDevice:changes:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v19, 0x16u);
  }

  unsigned int v11 = -[ADDeviceCircleManager _isRemoteDeviceCollectorCandidate:](self, "_isRemoteDeviceCollectorCandidate:", v9);
  if ((v5 & 2) != 0 && v11) {
    -[ADDeviceCircleManager _reelectCollectorIfNecessary](self, "_reelectCollectorIfNecessary");
  }
  id v12 = sub_1001659FC(v9, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  os_unfair_lock_lock(&self->_peerInfoLock);
  -[ADDeviceCircleManager _updateRemotePeerInfo:](self, "_updateRemotePeerInfo:", v13);
  os_unfair_lock_unlock(&self->_peerInfoLock);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assistantIdentifier]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceUniqueIdentifier]);
  -[ADDeviceCircleManager _setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:]( self,  "_setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:",  v14,  v15);

  uint64_t v17 = AFIsInternalInstall(v16);
  if ((_DWORD)v17 && AFIsHorseman(v17, v18)) {
    -[ADDeviceCircleManager _checkForMyriadHomePodTrialTreatmentConsensus]( self,  "_checkForMyriadHomePodTrialTreatmentConsensus");
  }
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[ADDeviceCircleManager rapportLink:didUpdateLocalDevice:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v11, 0x16u);
  }

  -[ADDeviceCircleManager _updateStationaryScoreBroadcasting](self, "_updateStationaryScoreBroadcasting");
  -[ADDeviceCircleManager _reelectCollectorIfNecessary](self, "_reelectCollectorIfNecessary");
  uint64_t v9 = AFIsInternalInstall(-[ADDeviceCircleManager _syncCompanionLinkDeviceLocalPeerData](self, "_syncCompanionLinkDeviceLocalPeerData"));
  if ((_DWORD)v9 && AFIsHorseman(v9, v10)) {
    -[ADDeviceCircleManager _checkForMyriadHomePodTrialTreatmentConsensus]( self,  "_checkForMyriadHomePodTrialTreatmentConsensus");
  }
}

- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  currentCollectorIDs = self->_currentCollectorIDs;
  self->_currentCollectorIDs = 0LL;

  self->_BOOL isCollector = 0;
  -[ADRapportLink removeListener:](self->_clientLink, "removeListener:", self);
  -[ADRapportLink invalidate](self->_clientLink, "invalidate");
  clientLink = self->_clientLink;
  self->_clientLink = 0LL;

  self->_rapportInstabilityPenalty += 10LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100165998;
  v13[3] = &unk_1004FD940;
  v13[4] = self;
  id v7 = objc_retainBlock(v13);
  id v8 = v7;
  if (v3)
  {
    ((void (*)(void *))v7[2])(v7);
  }

  else
  {
    dispatch_time_t v9 = dispatch_time(0LL, 20000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001659E0;
    block[3] = &unk_1004FD990;
    void block[4] = self;
    id v12 = v8;
    dispatch_after(v9, queue, block);
  }
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceCircleManager rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s #hal", (uint8_t *)&v5, 0xCu);
  }

  -[ADDeviceCircleManager _resetRapportLinkAndReconnectNow:](self, "_resetRapportLinkAndReconnectNow:", 1LL);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceCircleManager rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s #hal", (uint8_t *)&v5, 0xCu);
  }

  -[ADDeviceCircleManager _resetRapportLinkAndReconnectNow:](self, "_resetRapportLinkAndReconnectNow:", 0LL);
}

- (id)_handleSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"get_capabilities_for_assistant_identifiers"]);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v31 = "-[ADDeviceCircleManager _handleSVDCapabilitiesFetch:fromPeer:]";
    __int16 v32 = 2112;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s #hal SVD capabilities fetch request from %@: %@",  buf,  0x20u);
  }

  id v23 = v6;
  id v24 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "effectiveIdentifier", v23));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForRapportEffectiveIdentifier:]( self,  "_managedPeerInfoForRapportEffectiveIdentifier:",  v15));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);

        if ([v7 containsObject:v17])
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 siriInfo]);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"deviceCapabilitiesV2"]);

          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
            -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v19, v17);
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v11);
  }

  id v21 = -[NSMutableDictionary copy](v24, "copy");
  return v21;
}

- (id)_handlePeersAndSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = +[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled");
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v49 = "-[ADDeviceCircleManager _handlePeersAndSVDCapabilitiesFetch:fromPeer:]";
      __int16 v50 = 2112;
      id v51 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #hal Peers and SVD capabilities fetch request from %@: ",  buf,  0x16u);
    }

    id v37 = v5;
    id v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    v36 = self;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
    id v9 = [v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);
          id v15 = sub_100165580(v14);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);
          id v18 = [v17 length];

          if (v18)
          {
            int v19 = (void *)objc_claimAutoreleasedReturnValue([v13 siriInfo]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"deviceCapabilitiesV2"]);

            uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
            {
              v45[0] = @"peerData";
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 buildDictionaryRepresentation]);
              v45[1] = @"deviceCapabilitiesV2";
              v46[0] = v22;
              v46[1] = v20;
              id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));

              id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);
              -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v23, v24);
            }
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }

      while (v10);
    }

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](v36->_clientLink, "localDevice"));
    if (v25)
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager localPeerInfo](v36, "localPeerInfo"));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](v36->_clientLink, "localDevice"));
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 siriInfo]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"deviceCapabilitiesV2"]);

      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      {
        v43[0] = @"peerData";
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v26 buildDictionaryRepresentation]);
        v43[1] = @"deviceCapabilitiesV2";
        v44[0] = v31;
        v44[1] = v29;
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));

        id v33 = (void *)objc_claimAutoreleasedReturnValue([v26 assistantIdentifier]);
        -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v32, v33);
      }
    }

    id v34 = -[NSMutableDictionary copy](v38, "copy");

    id v5 = v37;
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v49 = "-[ADDeviceCircleManager _handlePeersAndSVDCapabilitiesFetch:fromPeer:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s #hal Peers and SVD capabilities fetch request not supported on this device.",  buf,  0xCu);
    }

    id v34 = &__NSDictionary0__struct;
  }

  return v34;
}

- (id)_handleDeviceCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"get_capabilities_for_devices"]);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[ADDeviceCircleManager _handleDeviceCapabilitiesFetch:fromPeer:]";
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s #hal capabilities fetch request from %@: %@",  buf,  0x20u);
  }

  uint64_t v21 = v6;
  id v22 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceIdentifier", v21));
        if ([v7 containsObject:v15])
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 siriInfo]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"deviceCapabilities"]);

          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
            -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v17, v15);
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  id v19 = -[NSMutableDictionary copy](v22, "copy");
  return v19;
}

- (void)_handleExecuteCommand:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v13 = [v12 isLostModeActive];

  if (!v13)
  {
    if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled"))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"recipient_assistant_identifier"]);
      if ([v15 length])
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerData](self, "_localPeerData"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);
        unsigned __int8 v18 = [v15 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          __int16 v32 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
            __int16 v49 = 2112;
            __int16 v50 = v15;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%s #hal Received execute command with recipient of %@. Will attempt to forward.",  buf,  0x16u);
          }

          id v33 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForAssistantIdentifier:]( self,  "_managedPeerInfoForAssistantIdentifier:",  v15));
          if (v33)
          {
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_1001653A8;
            v42[3] = &unk_1004F4150;
            id v43 = v15;
            id v44 = v10;
            -[ADDeviceCircleManager _forwardExecuteCommandToDevice:message:from:completion:]( self,  "_forwardExecuteCommandToDevice:message:from:completion:",  v43,  v8,  v9,  v42);

            id v34 = v43;
          }

          else
          {
            id v38 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
              __int16 v49 = 2112;
              __int16 v50 = v15;
              _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s #hal Unable to find recipient peerInfo with assistantId: %@.",  buf,  0x16u);
            }

            id v34 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1017LL));
            (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v34);
          }

          goto LABEL_45;
        }
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"serialized_command"]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v15, v19) & 1) == 0)
    {
      id v22 = 0LL;
      goto LABEL_16;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v15));
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___AceObject);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 dictionary]);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
      {
        id v35 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Invalid command received. Ignoring.",  buf,  0xCu);
        }

        BOOL v45 = @"execute_command_response";
        id v36 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 dictionary]);
        id v46 = v37;
        __int16 v30 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));

        if (v10) {
          (*((void (**)(id, ADPeerInfo *, void))v10 + 2))(v10, v30, 0LL);
        }
        goto LABEL_43;
      }

LABEL_16:
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"execution_context"]);
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v20, v24) & 1) == 0)
      {
        __int128 v25 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Received malformed execution context. Continuing with execution.",  buf,  0xCu);
        }

        uint64_t v20 = 0LL;
      }

      __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s Dispatching commandDict to ADCommandCenter",  buf,  0xCu);
        if (v20) {
          goto LABEL_22;
        }
      }

      else if (v20)
      {
LABEL_22:
        __int128 v27 = -[AFCommandExecutionInfo initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___AFCommandExecutionInfo),  "initWithDictionaryRepresentation:",  v20);
        __int128 v28 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[AFCommandExecutionInfo originPeerInfo](v27, "originPeerInfo"));
        __int16 v30 = -[ADPeerInfo initWithAFPeerInfo:](v28, "initWithAFPeerInfo:", v29);

LABEL_42:
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_1001654A8;
        v40[3] = &unk_1004F4150;
        void v40[4] = self;
        id v41 = v10;
        [v39 executeCommand:v22 fromPeer:v30 remoteExecutionInfo:v20 reply:v40];

        goto LABEL_43;
      }

      __int16 v30 = 0LL;
      goto LABEL_42;
    }

    id v31 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Invalid command received. Ignoring.",  buf,  0xCu);
      if (v10) {
        goto LABEL_25;
      }
    }

    else if (v10)
    {
LABEL_25:
      __int16 v30 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1015LL));
      (*((void (**)(id, void, ADPeerInfo *))v10 + 2))(v10, 0LL, v30);
      id v22 = 0LL;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }

    id v22 = 0LL;
    goto LABEL_44;
  }

  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v48 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, rejecting incoming request",  buf,  0xCu);
    if (!v10) {
      goto LABEL_46;
    }
    goto LABEL_6;
  }

  if (v10)
  {
LABEL_6:
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1003LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
LABEL_45:
  }

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t, void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v12 isEqualToString:@"svdCapabilities_fetch"] && self->_isCollector)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _handleSVDCapabilitiesFetch:fromPeer:]( self,  "_handleSVDCapabilitiesFetch:fromPeer:",  v11,  v13));
LABEL_9:
    uint64_t v16 = (void *)v15;
    v14[2](v14, v15, 0LL);
LABEL_10:

    goto LABEL_11;
  }

  if ([v12 isEqualToString:@"device_capabilities_fetch"] && self->_isCollector)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _handleDeviceCapabilitiesFetch:fromPeer:]( self,  "_handleDeviceCapabilitiesFetch:fromPeer:",  v11,  v13));
    goto LABEL_9;
  }

  if ([v12 isEqualToString:@"peers_svdCapabilities_fetch"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _handlePeersAndSVDCapabilitiesFetch:fromPeer:]( self,  "_handlePeersAndSVDCapabilitiesFetch:fromPeer:",  v11,  v13));
    goto LABEL_9;
  }

  if ([v12 isEqualToString:@"execute_command_request"])
  {
    -[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]( self,  "_handleExecuteCommand:fromPeer:completion:",  v11,  v13,  v14);
    goto LABEL_11;
  }

  if ([v12 isEqualToString:@"siriMux_tokenExchange"])
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADMUXSyncTokenManager sharedInstance](&OBJC_CLASS___ADMUXSyncTokenManager, "sharedInstance"));
    [v16 handleMuxTokenExchangeMessage:v11 fromPeer:v13 completion:v14];
    goto LABEL_10;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_requestHandlers, "keyEnumerator"));
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001652A8;
  v25[3] = &unk_1004F3610;
  id v19 = v12;
  id v26 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "af_firstObjectPassingTest:", v25));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_requestHandlers, "objectForKey:", v20));
  id v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v28 = "-[ADDeviceCircleManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v29 = 2112;
    id v30 = v21;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s #myriad #feedback handler:%@",  buf,  0x16u);
  }

  if ([v21 conformsToProtocol:&OBJC_PROTOCOL___ADDeviceCircleRequestHandler])
  {
    id v23 = v21;
    if ((objc_opt_respondsToSelector(v23, "handle:fromPeer:completion:") & 1) != 0) {
      [v23 handle:v11 fromPeer:v13 completion:v14];
    }
  }

  else
  {
    uint64_t v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v28 = "-[ADDeviceCircleManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s #hal Unexpected message type: %@",  buf,  0x16u);
    }

    id v23 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1014LL));
    ((void (**)(id, uint64_t, id))v14)[2](v14, 0LL, v23);
  }

LABEL_11:
}

- (void)homeInfoManager:(id)a3 didUpdateCurrentAccessoryInfo:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10016529C;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_checkForMyriadHomePodTrialTreatmentConsensus
{
  uint64_t v3 = AFIsInternalInstall(self);
  if ((_DWORD)v3)
  {
    if (AFIsHorseman(v3, v4))
    {
      consensusQueue = (dispatch_queue_s *)self->_consensusQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100164E78;
      block[3] = &unk_1004FD940;
      void block[4] = self;
      dispatch_async(consensusQueue, block);
    }
  }

- (BOOL)_isDeviceCircleTrialTreatmentConsensusAchieved:(id)a3 andRemotePeerInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = AFIsHorseman(v6, v7);
  if ((_DWORD)v8 && AFIsInternalInstall(v8))
  {
    id v9 = [v6 mutableCopy];
    [v9 addObject:v5];
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 1;
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x3032000000LL;
    v13[3] = sub_100164CA8;
    v13[4] = sub_100164CB8;
    id v14 = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100164CC0;
    v12[3] = &unk_1004F3680;
    v12[4] = v13;
    v12[5] = &v15;
    [v9 enumerateObjectsUsingBlock:v12];
    BOOL v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(v13, 8);

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_checkForGuestHomePodsOnNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFIsInternalInstall(v4);
  if ((_DWORD)v5 && AFIsHorseman(v5, v6))
  {
    consensusQueue = (dispatch_queue_s *)self->_consensusQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100164718;
    v8[3] = &unk_1004FD990;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(consensusQueue, v8);
  }
}

- (void)preferencesEnabledBitsDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001646F0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)activeAccountIdentifierDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001646E8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)preferencesSharedUserIdentifierDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001646E0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateAssistantIdentifierAndSharedUserIdentifier
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100164450;
  v9[3] = &unk_1004F36F8;
  void v9[4] = self;
  uint64_t v3 = objc_retainBlock(v9);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v5 = [v4 assistantIsEnabled];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001645D0;
    v7[3] = &unk_1004F8FE8;
    v7[4] = self;
    uint64_t v8 = v3;
    [v6 fetchActiveAccount:v7];
  }

  else
  {
    ((void (*)(void *, void, void))v3[2])(v3, 0LL, 0LL);
  }
}

- (void)_updateCurrentAccessoryInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[ADDeviceCircleManager _updateCurrentAccessoryInfo:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s currentAccessoryInfo = %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  uint64_t v7 = self->_currentAccessoryInfo;
  uint64_t v8 = (AFHomeAccessoryInfo *)v4;
  id v9 = v8;
  if (v7 == v8)
  {
  }

  else
  {
    if (v8 && v7)
    {
      unsigned __int8 v10 = -[AFHomeAccessoryInfo isEqual:](v7, "isEqual:", v8);

      if ((v10 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    id v11 = (AFHomeAccessoryInfo *)-[AFHomeAccessoryInfo copy](v9, "copy");
    currentAccessoryInfo = self->_currentAccessoryInfo;
    self->_currentAccessoryInfo = v11;

    id v13 =  -[ADDeviceCircleManager _syncCompanionLinkDeviceLocalPeerData]( self,  "_syncCompanionLinkDeviceLocalPeerData");
  }

- (void)myriadTrialBoostsUpdated:(id)a3
{
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADMyriadSettingsManager sharedSettingsManager]( &OBJC_CLASS___ADMyriadSettingsManager,  "sharedSettingsManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 treatmentId]);
    int v10 = 136315394;
    id v11 = "-[ADDeviceCircleManager myriadTrialBoostsUpdated:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Trial Boost Notification Recieved For TreatmentID: %@",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = -[ADDeviceCircleManager _syncCompanionLinkDeviceLocalPeerData](self, "_syncCompanionLinkDeviceLocalPeerData");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerData](self, "_localPeerData"));
  -[ADDeviceCircleManager _updateSiriInfoWithLocalPeerData:](self, "_updateSiriInfoWithLocalPeerData:", v9);
}

- (void)sharedDataDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADDeviceCircleManager sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ((AFIsNano(v6) & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001642F0;
    v8[3] = &unk_1004FBF48;
    v8[4] = self;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(queue, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)isMeDeviceDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADDeviceCircleManager isMeDeviceDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001642A0;
  block[3] = &unk_1004FAF58;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_startStationaryScoreTimer
{
  if (!self->_stationaryScoreTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    id v9 = sub_100164274;
    int v10 = &unk_1004FAF58;
    objc_copyWeak(&v11, &location);
    unsigned int v5 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v3,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  &v7,  600.0);
    stationaryScoreTimer = self->_stationaryScoreTimer;
    self->_stationaryScoreTimer = v5;

    -[AFWatchdogTimer start](self->_stationaryScoreTimer, "start", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)_stopStationaryScoreTimer
{
  stationaryScoreTimer = self->_stationaryScoreTimer;
  if (stationaryScoreTimer)
  {
    -[AFWatchdogTimer cancel](stationaryScoreTimer, "cancel");
    id v4 = self->_stationaryScoreTimer;
    self->_stationaryScoreTimer = 0LL;
  }

- (void)_updateStationaryScoreBroadcasting
{
  if (-[ADDeviceCircleManager _isLocalDeviceCollectorCandidate](self, "_isLocalDeviceCollectorCandidate")
    && (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices")),
        id v4 = [v3 count],
        v3,
        v4))
  {
    if (!self->_stationaryScoreTimer) {
      -[ADDeviceCircleManager _updateStationaryScoreAndResetTimer](self, "_updateStationaryScoreAndResetTimer");
    }
  }

  else
  {
    -[ADDeviceCircleManager _stopStationaryScoreTimer](self, "_stopStationaryScoreTimer");
  }

- (void)_updateStationaryScoreAndResetTimer
{
}

- (void)_updateStationaryScore
{
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v27 = 0LL;
  char v26 = 0;
  id v3 = objc_alloc_init(&OBJC_CLASS___SiriCoreWiFiManagerClient);
  id v24 = 0LL;
  id v25 = 0LL;
  [v3 hasAssociatedNetworkWithRSSI:&v29 andSNR:&v28 andCCA:&v27 andPhyMode:&v25 andChannelInfo:&v24 isCaptive:&v26];
  id v4 = v25;
  id v5 = v24;
  id v6 = sub_1001EBCFC(@"assistantdDidLaunch");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:v7];
  float v10 = v9 / 3600.0;

  float v11 = log((float)((float)(v10 * 2.0) + 1.0));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v13 = [v12 count];

  else {
    unint64_t v16 = 0LL;
  }
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    unint64_t rapportInstabilityPenalty = self->_rapportInstabilityPenalty;
    *(_DWORD *)buf = 136316162;
    id v31 = "-[ADDeviceCircleManager _updateStationaryScore]";
    __int16 v32 = 2048;
    double v33 = v11;
    __int16 v34 = 2048;
    unint64_t v35 = rapportInstabilityPenalty;
    __int16 v36 = 2048;
    id v37 = v13;
    __int16 v38 = 2048;
    unint64_t v39 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s #hal normalized assistantd longevity score: %f, rapport link penalty: %lu, # devices seen: %lu, device boost: %lu",  buf,  0x34u);
  }

  unint64_t rollingRSSICount = self->_rollingRSSICount;
  self->_float currentStationaryScore = (float)((float)((float)(self->_rollingRSSI + v11)
                                                - (float)((float)self->_rapportInstabilityPenalty - v11))
  self->_unint64_t rollingRSSICount = rollingRSSICount + 1;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADRapportLink siriInfoToBeBroadcasted](&OBJC_CLASS___ADRapportLink, "siriInfoToBeBroadcasted"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"stationaryScore"]);

  if (!v20
    || (float currentStationaryScore = self->_currentStationaryScore,
        [v20 floatValue],
        vabds_f32(currentStationaryScore, v22) >= 25.0))
  {
    -[ADDeviceCircleManager _updateClientLinkSiriInfo](self, "_updateClientLinkSiriInfo");
  }
}

- (void)_updateDeviceCountTrend
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v4 = [v3 count];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceCountAndTimestamp);
  -[ADDeviceCountAndTimestamp setDeviceCount:](v6, "setDeviceCount:", v4);
  -[ADDeviceCountAndTimestamp setTimestamp:](v6, "setTimestamp:", v5);
  id v7 = -[NSMutableArray count](self->_deviceCountTrend, "count");
  deviceCountTrend = self->_deviceCountTrend;
  if (v7)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](deviceCountTrend, "lastObject"));
    float v10 = [v9 deviceCount];
    float v11 = (void *)objc_claimAutoreleasedReturnValue([v9 timestamp]);
    [v5 timeIntervalSinceDate:v11];
    double v13 = v12;
    if (-[NSMutableArray indexOfObjectPassingTest:]( self->_deviceCountTrend,  "indexOfObjectPassingTest:",  &stru_1004F3760) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v4 > v10 || v13 > 60.0) {
        -[NSMutableArray removeAllObjects](self->_deviceCountTrend, "removeAllObjects");
      }
      -[NSMutableArray addObject:](self->_deviceCountTrend, "addObject:", v6);
      goto LABEL_23;
    }

    if (v4 < v10)
    {
LABEL_23:

      goto LABEL_24;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_deviceCountTrend, "firstObject"));
    uint64_t v15 = [v14 deviceCount];
    unint64_t v16 = v4 - v15;
    if (v4 - v15 < 0) {
      unint64_t v16 = v15 - v4;
    }
    if (v16 <= 1 && (unint64_t)v4 > 2 || v4 == (_BYTE *)2 && v15 == (_BYTE *)2)
    {
      if (v13 <= 60.0)
      {
        id v17 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315138;
          id v19 = "-[ADDeviceCircleManager _updateDeviceCountTrend]";
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s #hal Local device likely has dropped out of network and back in. Adding 5 point penalty",  (uint8_t *)&v18,  0xCu);
        }

        self->_rapportInstabilityPenalty += 5LL;
      }
    }

    else if (!v10 || v13 <= 60.0)
    {
      goto LABEL_22;
    }

    -[NSMutableArray removeAllObjects](self->_deviceCountTrend, "removeAllObjects");
LABEL_22:
    -[NSMutableArray addObject:](self->_deviceCountTrend, "addObject:", v6);

    goto LABEL_23;
  }

  -[NSMutableArray addObject:](deviceCountTrend, "addObject:", v6);
LABEL_24:
}

- (id)_keepAliveLinkToDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004F3780);
  id v6 = -[ADRapportLink initWithQueue:configuration:]( objc_alloc(&OBJC_CLASS___ADRapportLink),  "initWithQueue:configuration:",  self->_queue,  v5);
  -[ADRapportLink setServiceType:](v6, "setServiceType:", @"com.apple.siri.wakeup");
  -[ADRapportLink setDestinationDevice:](v6, "setDestinationDevice:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001640DC;
  v9[3] = &unk_1004FBD90;
  id v10 = v4;
  id v7 = v4;
  -[ADRapportLink activateWithCompletion:](v6, "activateWithCompletion:", v9);

  return v6;
}

- (id)_managedPeerInfoForAssistantIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2237, @"Invalid parameter not satisfying: %@", @"[assistantIdentifier length] > 0" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uppercaseString]);
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForAssistantIdentifier:]( self,  "_remotePeerInfoForAssistantIdentifier:",  v6));
  if (!v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerInfo](self, "_localPeerInfo"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistantIdentifier]);
    unsigned int v10 = [v9 isEqualToString:v6];

    if (v10) {
      id v7 = v8;
    }
    else {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)_managedPeerInfoForIDSDeviceUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2250, @"Invalid parameter not satisfying: %@", @"[idsDeviceUniqueIdentifier length] > 0" object file lineNumber description];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForIDSDeviceUniqueIdentifier:]( self,  "_remotePeerInfoForIDSDeviceUniqueIdentifier:",  v5));
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerInfo](self, "_localPeerInfo"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceUniqueIdentifier]);
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)_managedPeerInfoForHomeKitAccessoryIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2262, @"Invalid parameter not satisfying: %@", @"[homeKitAccessoryIdentifier length] > 0" object file lineNumber description];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForHomeKitAccessoryIdentifier:]( self,  "_remotePeerInfoForHomeKitAccessoryIdentifier:",  v5));
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerInfo](self, "_localPeerInfo"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 homeKitAccessoryIdentifier]);
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)_managedPeerInfoForRapportEffectiveIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2274, @"Invalid parameter not satisfying: %@", @"[rapportEffectiveIdentifier length] > 0" object file lineNumber description];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForRapportEffectiveIdentifier:]( self,  "_remotePeerInfoForRapportEffectiveIdentifier:",  v5));
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerInfo](self, "_localPeerInfo"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rapportEffectiveIdentifier]);
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)_managedPeerInfoMatchingPeerInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2286, @"Invalid parameter not satisfying: %@", @"peerInfoToMatch != nil" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
  if ([v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForAssistantIdentifier:]( self,  "_managedPeerInfoForAssistantIdentifier:",  v6));

    if (v7) {
      goto LABEL_19;
    }
  }

  else
  {
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 rapportEffectiveIdentifier]);
  if ([v8 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForRapportEffectiveIdentifier:]( self,  "_managedPeerInfoForRapportEffectiveIdentifier:",  v8));

    if (v7) {
      goto LABEL_19;
    }
  }

  else
  {
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceUniqueIdentifier]);
  if ([v9 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForIDSDeviceUniqueIdentifier:]( self,  "_managedPeerInfoForIDSDeviceUniqueIdentifier:",  v9));

    if (v7) {
      goto LABEL_19;
    }
  }

  else
  {
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitAccessoryIdentifier]);
  if ([v10 length]) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _managedPeerInfoForHomeKitAccessoryIdentifier:]( self,  "_managedPeerInfoForHomeKitAccessoryIdentifier:",  v10));
  }
  else {
    id v7 = 0LL;
  }

LABEL_19:
  return v7;
}

- (id)_localPeerData
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100163EF0;
  v3[3] = &unk_1004F37C8;
  v3[4] = self;
  return +[ADDeviceCirclePeerData newWithBuilder:](&OBJC_CLASS___ADDeviceCirclePeerData, "newWithBuilder:", v3);
}

- (void)_updateSiriInfoWithLocalPeerData:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 buildDictionaryRepresentation]);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADDeviceCircleManager _updateSiriInfoWithLocalPeerData:]";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Publish peer data %@ to others...",  (uint8_t *)&v5,  0x16u);
  }

  +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  v3,  @"peerData");
}

- (id)_localPeerInfo
{
  localPeerInfo = self->_localPeerInfo;
  if (!localPeerInfo)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _localPeerData](self, "_localPeerData"));
    id v5 = sub_100163C0C(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    -[ADDeviceCircleManager _updateLocalPeerInfo:](self, "_updateLocalPeerInfo:", v6);
    localPeerInfo = self->_localPeerInfo;
  }

  return localPeerInfo;
}

- (void)_updateLocalPeerInfo:(id)a3
{
  id v4 = (AFPeerInfo *)a3;
  localPeerInfo = self->_localPeerInfo;
  if (localPeerInfo != v4 && (-[AFPeerInfo isEqual:](localPeerInfo, "isEqual:", v4) & 1) == 0)
  {
    id v6 = self->_localPeerInfo;
    __int16 v7 = v4;
    uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v18 = "-[ADDeviceCircleManager _updateLocalPeerInfo:]";
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      float v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
    }

    unsigned int v9 = (AFPeerInfo *)-[AFPeerInfo copy](v7, "copy");
    unsigned int v10 = self->_localPeerInfo;
    self->_localPeerInfo = v9;

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100163AEC;
    block[3] = &unk_1004FD4C0;
    void block[4] = self;
    uint64_t v15 = v6;
    unint64_t v16 = v7;
    double v12 = v7;
    double v13 = v6;
    dispatch_async(queue, block);
  }
}

- (void)_updateRemotePeerInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 rapportEffectiveIdentifier]);
    if (![v6 length])
    {
      id v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315650;
        char v26 = "-[ADDeviceCircleManager _updateRemotePeerInfo:]";
        __int16 v27 = 2112;
        uint64_t v28 = v5;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Unable to add or update remote peer info %@ because its rapportEffectiveIdentifier is %@.",  (uint8_t *)&v25,  0x20u);
      }

      goto LABEL_24;
    }

    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remotePeerInfoByRapportEffectiveIdentifier,  "objectForKey:",  v6));
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 isEqual:v5])
      {
LABEL_21:

LABEL_24:
        goto LABEL_25;
      }

      -[ADDeviceCircleManager _removeRemotePeerInfoWithRapportEffectiveIdentifier:]( self,  "_removeRemotePeerInfoWithRapportEffectiveIdentifier:",  v6);
    }

    remotePeerInfoByRapportEffectiveIdentifier = self->_remotePeerInfoByRapportEffectiveIdentifier;
    if (!remotePeerInfoByRapportEffectiveIdentifier)
    {
      unsigned int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      float v11 = self->_remotePeerInfoByRapportEffectiveIdentifier;
      self->_remotePeerInfoByRapportEffectiveIdentifier = v10;

      remotePeerInfoByRapportEffectiveIdentifier = self->_remotePeerInfoByRapportEffectiveIdentifier;
    }

    -[NSMutableDictionary setObject:forKey:](remotePeerInfoByRapportEffectiveIdentifier, "setObject:forKey:", v5, v6);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceUniqueIdentifier]);
    if ([v12 length])
    {
      rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
      if (!rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier)
      {
        uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v15 = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
        self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = v14;

        rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
      }

      -[NSMutableDictionary setObject:forKey:]( rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier,  "setObject:forKey:",  v6,  v12);
    }

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
    if ([v16 length])
    {
      rapportEffectiveIdentifiersByAssistantIdentifier = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
      if (!rapportEffectiveIdentifiersByAssistantIdentifier)
      {
        int v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int16 v19 = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
        self->_rapportEffectiveIdentifiersByAssistantIdentifier = v18;

        rapportEffectiveIdentifiersByAssistantIdentifier = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
      }

      -[NSMutableDictionary setObject:forKey:]( rapportEffectiveIdentifiersByAssistantIdentifier,  "setObject:forKey:",  v6,  v16);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitAccessoryIdentifier]);
    if ([v20 length])
    {
      rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
      if (!rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier)
      {
        float v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v23 = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
        self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = v22;

        rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
      }

      -[NSMutableDictionary setObject:forKey:]( rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier,  "setObject:forKey:",  v6,  v20);
    }

    goto LABEL_21;
  }

- (void)_fetchSyncTokenFromDeviceWithCompanionAssistantId:(id)a3 aceHost:(id)a4 clientLink:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v15 timeIntervalSince1970];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, @"SiriMuxEventTimestamp");

  if (v11) {
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v11, @"SiriMuxTokenHost");
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager _rapportLinkMessageOptions](self, "_rapportLinkMessageOptions"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10016387C;
  v21[3] = &unk_1004F68A0;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  [v13 sendRequestID:@"com.apple.siri.mux.token.exchange" messageType:@"siriMux_tokenExchange" messagePayload:v14 toDeviceWithAssistantIdentifier:v19 options:v17 completion:v21];
}

- (void)fetchSyncTokenForCompanionAssistantId:(id)a3 aceHost:(id)a4 completion:(id)a5
{
}

- (void)_removeRemotePeerInfoWithRapportEffectiveIdentifier:(id)a3
{
  id v11 = a3;
  id v4 = [v11 length];
  id v5 = v11;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remotePeerInfoByRapportEffectiveIdentifier,  "objectForKey:",  v11));
    __int16 v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceUniqueIdentifier]);
      if ([v8 length]) {
        -[NSMutableDictionary removeObjectForKey:]( self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier,  "removeObjectForKey:",  v8);
      }
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assistantIdentifier]);
      if ([v9 length]) {
        -[NSMutableDictionary removeObjectForKey:]( self->_rapportEffectiveIdentifiersByAssistantIdentifier,  "removeObjectForKey:",  v9);
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 homeKitAccessoryIdentifier]);
      if ([v10 length]) {
        -[NSMutableDictionary removeObjectForKey:]( self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier,  "removeObjectForKey:",  v10);
      }
      -[NSMutableDictionary removeObjectForKey:]( self->_remotePeerInfoByRapportEffectiveIdentifier,  "removeObjectForKey:",  v11);
    }

    id v5 = v11;
  }
}

- (id)_remotePeerInfoForAssistantIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_rapportEffectiveIdentifiersByAssistantIdentifier,  "objectForKey:",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForRapportEffectiveIdentifier:]( self,  "_remotePeerInfoForRapportEffectiveIdentifier:",  v5));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_remotePeerInfoForIDSDeviceUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier,  "objectForKey:",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForRapportEffectiveIdentifier:]( self,  "_remotePeerInfoForRapportEffectiveIdentifier:",  v5));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_remotePeerInfoForHomeKitAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier,  "objectForKey:",  v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceCircleManager _remotePeerInfoForRapportEffectiveIdentifier:]( self,  "_remotePeerInfoForRapportEffectiveIdentifier:",  v5));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_remotePeerInfoForRapportEffectiveIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remotePeerInfoByRapportEffectiveIdentifier,  "objectForKey:",  v4));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001635B8;
  v8[3] = &unk_1004FC7E8;
  id v9 = a3;
  id v4 = v9;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001635CC;
  v6[3] = &unk_1004F9F90;
  __int16 v7 = objc_retainBlock(v8);
  id v5 = v7;
  -[ADDeviceCircleManager getManagedLocalAndRemotePeerInfoWithCompletion:]( self,  "getManagedLocalAndRemotePeerInfoWithCompletion:",  v6);
}

- (void)reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001635A8;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (unint64_t)_rapportLinkInstabilityPenalty
{
  return self->_rapportInstabilityPenalty;
}

- (void).cxx_destruct
{
}

+ (ADDeviceCircleManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016A7C0;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100577F80 != -1) {
    dispatch_once(&qword_100577F80, block);
  }
  return (ADDeviceCircleManager *)(id)qword_100577F78;
}

+ (id)_rapportLinkWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___ADRapportLink);
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004F32F0);
  id v6 = -[ADRapportLink initWithQueue:configuration:](v4, "initWithQueue:configuration:", v3, v5);

  return v6;
}

@end