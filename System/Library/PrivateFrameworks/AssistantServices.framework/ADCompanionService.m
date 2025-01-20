@interface ADCompanionService
+ (ADCompanionService)sharedInstance;
- (ADCompanionService)init;
- (ADRapportLink)clientAWDLTransportLink;
- (ADRapportLink)clientLink;
- (BOOL)_cancelTimerForMessage:(id)a3;
- (BOOL)_isDevicePartOfCurrentMediaSystem:(id)a3;
- (BOOL)_shouldLogDiscoveryContextForRequestId:(id)a3;
- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 heartbeat:(BOOL)a5 completion:(id)a6;
- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 timeout:(double)a5 heartbeat:(BOOL)a6 completion:(id)a7;
- (BOOL)_updateSharedData:(id)a3 forDevice:(id)a4;
- (BOOL)_updateSharedDataFromIDSWithIdentifier:(id)a3;
- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 assistantId:(id *)a6 idsDeviceId:(id *)a7 homeKitId:(id *)a8;
- (BOOL)doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:(id)a3;
- (BOOL)isListening;
- (BOOL)isReady;
- (BOOL)isStereoPairConfigured;
- (NSDictionary)cachedUTSInfo;
- (NSMapTable)handlerForMessageType;
- (NSMutableDictionary)deviceUpdateLog;
- (NSMutableDictionary)incomingRequestLog;
- (NSMutableDictionary)intermediateMessageIDs;
- (NSMutableDictionary)playbackDeviceIDs;
- (NSMutableDictionary)timerInfo;
- (NSMutableSet)discoveryContextLoggedForExecutionIds;
- (NSMutableSet)waitContexts;
- (NSString)cachedStoreFrontIdentifier;
- (NSString)clientAWDLTransportLinkDestinationId;
- (NSString)stereoPartnerIDSIdentifier;
- (OS_dispatch_queue)instrumentationQueue;
- (OS_dispatch_queue)serialQueue;
- (_ADPBDeviceSetDataRequest)cachedSharedData;
- (id)_companionDevice;
- (id)_companionLinkDeviceForHkIdentifier:(id)a3;
- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 allowsAWDLFallback:(BOOL)a5 error:(id *)a6 logDiscoveryContextFor:(id)a7;
- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 logDiscoveryContextFor:(id)a5;
- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3;
- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3 allowsAWDLFallback:(BOOL)a4;
- (id)_getExecutionIdFromRequest:(id)a3;
- (id)_initializeNewMessageWaitContext;
- (id)_newRequestDictionary;
- (id)_newRequestDictionaryWithRequestInfo:(id)a3;
- (id)_newRequestInfoWithRequestDictionary:(id)a3;
- (id)_rapportEffectiveIdForPeer:(id)a3;
- (id)_remotePlaybackDeviceForDevice:(id)a3;
- (id)_setUpNewIntermediateIDsSetForPeer:(id)a3;
- (id)_setupClientAWDLTransportLinkForDestination:(id)a3;
- (id)_transformedRequestDictionaryToForward:(id)a3;
- (id)discoveryTypeForPeer:(id)a3;
- (id)getDevicesDiscoveredNearbyForUserID:(id)a3;
- (id)getDevicesDiscoveredTypeCountForUserID:(id)a3;
- (id)getUserIDForDevice:(id)a3;
- (int64_t)deviceType:(id)a3;
- (void)_activateAWDLMessageLink:(id)a3 completion:(id)a4;
- (void)_cancelAWDLClientLinkTimer;
- (void)_checkCompanionIdentifierStatus;
- (void)_cleanUpMessageWaitContext:(id)a3;
- (void)_emitDevicesDiscoveredEventForRequestId:(id)a3 deviceTypeCount:(id)a4;
- (void)_encryptionKeyDidChange:(id)a3;
- (void)_executeRemoteRequest:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 throughProxyDevice:(id)a7 completion:(id)a8;
- (void)_getFilteredDevicesFromList:(id)a3 withAccessToSameHomeAsDevice:(id)a4 completion:(id)a5;
- (void)_getSharedDataFromCompanionLinkDevice:(id)a3 completion:(id)a4;
- (void)_handleAceCommandRequest:(id)a3 messageID:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_logCompanionDeviceCommunicationContextFor:(id)a3 executionId:(id)a4;
- (void)_logCompanionDeviceDiscoveryContextFor:(id)a3 executionId:(id)a4;
- (void)_logPersonalDevicesDiscoveredNearbyForRequestId:(id)a3;
- (void)_musicPersonalizationTokenChanged;
- (void)_postConfigurationChangedNotification;
- (void)_prepAWDLClientLinkIfMessageReceivedOverAWDL:(id)a3;
- (void)_recordIntermediateMessageID:(id)a3 forPeer:(id)a4;
- (void)_removeMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)_resetHashedRouteIDs;
- (void)_scheduleOrExtendAWDLClientLinkTimer;
- (void)_sendHeartbeatMessage:(id)a3 targetDeviceIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)_sendMessage:(id)a3 messageType:(id)a4 toTargetDevice:(id)a5 completion:(id)a6;
- (void)_setIsStereoPairConfigured:(BOOL)a3;
- (void)_setReadyState:(BOOL)a3;
- (void)_setupClientLink;
- (void)_sharedDataDidChange:(id)a3;
- (void)_startListening;
- (void)_startObservingDataChangedNotifications;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)_stopListening;
- (void)_stopObservingDataChangedNotifications;
- (void)_storeFrontDidChange:(id)a3;
- (void)_tearDownIntermediateMessageIDs:(id)a3 forPeer:(id)a4;
- (void)_unblockWaitContext:(id)a3 forMessageID:(id)a4;
- (void)_unblockWaitingForMessageIDs:(id)a3;
- (void)_updateAssistantIDMapForDevice:(id)a3;
- (void)_updateCompanionIdentifier;
- (void)_updateHashedRouteIDForDevice:(id)a3;
- (void)_updateMediaSystemState;
- (void)_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3;
- (void)_updateSharedDataForDevice:(id)a3 allowIDSFetch:(BOOL)a4 completion:(id)a5;
- (void)_updateSharedDataWithCompletion:(id)a3;
- (void)_updateSiriInfoDictionary;
- (void)_updateStoreFrontIdentifierWithCompletion:(id)a3;
- (void)_updateWatchListKitDataWithCompletion:(id)a3;
- (void)_waitForMessageIDs:(id)a3 withContext:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)_watchListKitStoredConfigurationTokenChanged;
- (void)getDeviceIdentifiersWithCompletion:(id)a3;
- (void)getPlaybackDeviceListWithCompletion:(id)a3;
- (void)getSharedCompanionInfoWithCompletion:(id)a3;
- (void)getStereoPartnerIdentifierWithCompletion:(id)a3;
- (void)invalidateClientAWDLTransportLink;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)removeMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithHKIdentifier:(id)a5 completion:(id)a6;
- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithIDSIdentifier:(id)a5 completion:(id)a6;
- (void)sendStereoPartnerMessage:(id)a3 messageType:(id)a4 completion:(id)a5;
- (void)setCachedSharedData:(id)a3;
- (void)setCachedStoreFrontIdentifier:(id)a3;
- (void)setCachedUTSInfo:(id)a3;
- (void)setClientAWDLTransportLink:(id)a3;
- (void)setClientAWDLTransportLinkDestinationId:(id)a3;
- (void)setClientLink:(id)a3;
- (void)setDeviceUpdateLog:(id)a3;
- (void)setDiscoveryContextLoggedForExecutionIds:(id)a3;
- (void)setHandlerForMessageType:(id)a3;
- (void)setIncomingRequestLog:(id)a3;
- (void)setInstrumentationQueue:(id)a3;
- (void)setIntermediateMessageIDs:(id)a3;
- (void)setMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)setPlaybackDeviceIDs:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStereoPartnerIDSIdentifier:(id)a3;
- (void)setTimerInfo:(id)a3;
- (void)setWaitContexts:(id)a3;
- (void)startListeningForRemote;
- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)stopListening;
- (void)updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3;
@end

@implementation ADCompanionService

- (void)_logCompanionDeviceDiscoveryContextFor:(id)a3 executionId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v18 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v7 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCompanionDeviceDiscoveryContext);
  [v7 setEnded:v6];

  [v7 setHasEnded:1];
  [v18 setCompanionDeviceDiscoveryContext:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v8];
  [v9 setHalId:v10];

  [v18 setEventMetadata:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedAnalytics](&OBJC_CLASS___AssistantSiriAnalytics, "sharedAnalytics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultMessageStream]);
  [v12 emitMessage:v18];

  uint64_t v13 = ADCreateRequestLinkInfo(v5, 1LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  uint64_t v16 = ADCreateRequestLinkInfo(v15, 17LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  ADEmitRequestLinkEventMessage(v14, v17);
}

- (void)_logCompanionDeviceCommunicationContextFor:(id)a3 executionId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v18 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v7 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCompanionDeviceCommunicationContext);
  [v7 setEnded:v6];

  [v7 setHasEnded:1];
  [v18 setCompanionDeviceCommunicationContext:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v8];
  [v9 setHalId:v10];

  [v18 setEventMetadata:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedAnalytics](&OBJC_CLASS___AssistantSiriAnalytics, "sharedAnalytics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultMessageStream]);
  [v12 emitMessage:v18];

  uint64_t v13 = ADCreateRequestLinkInfo(v5, 1LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  uint64_t v16 = ADCreateRequestLinkInfo(v15, 17LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  ADEmitRequestLinkEventMessage(v14, v17);
}

- (void)_logPersonalDevicesDiscoveredNearbyForRequestId:(id)a3
{
  id v4 = a3;
  if (AFIsHorseman(v4, v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _selectedSharedUserID]);

    if ([v7 length])
    {
      v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCompanionService instrumentationQueue](self, "instrumentationQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10004E5A8;
      block[3] = &unk_1004FD4C0;
      block[4] = self;
      id v10 = v4;
      id v11 = v7;
      dispatch_async(v8, block);
    }
  }
}

- (void)_emitDevicesDiscoveredEventForRequestId:(id)a3 deviceTypeCount:(id)a4
{
  id v30 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v7 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALNearbyPersonalDevicesReported);
  [v6 setNearbyPersonalDevicesReported:v7];
  [v6 setHasNearbyPersonalDevicesReported:1];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  v28 = (void *)v8;
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v8];
  [v9 setHalId:v10];

  v29 = v6;
  v27 = v9;
  [v6 setEventMetadata:v9];
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v15) integerValue];
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v17]);
        id v19 = [v18 integerValue];

        switch((unint64_t)v16)
        {
          case 0uLL:
            [v7 setIPhoneCount:v19];
            [v7 setHasIPhoneCount:1];
            break;
          case 1uLL:
            [v7 setIPadCount:v19];
            [v7 setHasIPadCount:1];
            break;
          case 2uLL:
            [v7 setWatchCount:v19];
            [v7 setHasWatchCount:1];
            break;
          case 3uLL:
            [v7 setMacBookCount:v19];
            [v7 setHasMacBookCount:1];
            break;
          case 4uLL:
            [v7 setMacStudioCount:v19];
            [v7 setHasMacStudioCount:1];
            break;
          case 5uLL:
            [v7 setIMacCount:v19];
            [v7 setHasIMacCount:1];
            break;
          default:
            break;
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedAnalytics](&OBJC_CLASS___AssistantSiriAnalytics, "sharedAnalytics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 defaultMessageStream]);
  [v21 emitMessage:v29];

  uint64_t v22 = ADCreateRequestLinkInfo(v30, 1LL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
  uint64_t v25 = ADCreateRequestLinkInfo(v24, 17LL);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  ADEmitRequestLinkEventMessage(v23, v26);
}

- (ADCompanionService)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADCompanionService;
  id v2 = -[ADCompanionService init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADCompanionService.Serial", v4);
    id v6 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("ADInstrumentationQueue", 0LL);
    uint64_t v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    id v9 = (dispatch_object_s *)*((void *)v2 + 5);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v9, v11);

    *((void *)v2 + 3) = -1LL;
    *((void *)v2 + 4) = off_100575020();
    id v12 = *((id *)v2 + 20);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10024639C;
    v16[3] = &unk_1004FBBD0;
    id v17 = v12;
    id v14 = v12;
    [v13 addQueue:v14 heartBeatInterval:v16 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return (ADCompanionService *)v2;
}

- (void)_setReadyState:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCompanionService _setReadyState:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isReady != v3)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[ADCompanionService _setReadyState:]";
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s companion service ready: %d",  (uint8_t *)&v8,  0x12u);
    }

    self->_isReady = v3;
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 postNotificationName:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];
  }

- (void)_updateCompanionIdentifier
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315138;
    v27 = "-[ADCompanionService _updateCompanionIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v26, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (AFIsHorseman(v4, v5))
  {
    clientLink = self->_clientLink;
    if (clientLink)
    {
      dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](clientLink, "localDevice"));
      id v8 = [v7 personalRequestsState];
      int v9 = (int)v8;
      uint64_t v10 = (_DWORD)v8 != 0;
      uint64_t v12 = AFIsHorseman(v8, v11);
      if ((_DWORD)v12)
      {
        unsigned int IsRunningAsInstance = AFProcessIsRunningAsInstance(v12, v13);
        if (v9) {
          uint64_t v10 = 1LL;
        }
        else {
          uint64_t v10 = IsRunningAsInstance;
        }
      }

      v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315394;
        v27 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v28 = 1024;
        LODWORD(v29) = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s companion link ready: %d",  (uint8_t *)&v26,  0x12u);
      }

      if (self->_isCompanionLinkReady != (_DWORD)v10)
      {
        self->_isCompanionLinkReady = v10;
        -[ADCompanionService _setReadyState:](self, "_setReadyState:", v10);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      if (![v7 personalDeviceState])
      {
        v21 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          v27 = "-[ADCompanionService _updateCompanionIdentifier]";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s companion identifier has not updated yet",  (uint8_t *)&v26,  0xCu);
        }

        [v16 setCompanionIdentifier:0];
        goto LABEL_41;
      }

      unsigned int v17 = [v7 personalDeviceState];
      objc_super v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315394;
        v27 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v28 = 1024;
        LODWORD(v29) = v17 == 6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s has companion device: %d",  (uint8_t *)&v26,  0x12u);
      }

      if (v17 == 6) {
        id v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 idsPersonalDeviceIdentifier]);
      }
      else {
        id v19 = 0LL;
      }
      uint64_t v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315394;
        v27 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s companion identifier has been updated: \"%@\"",  (uint8_t *)&v26,  0x16u);
      }

      v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 companionIdentifier]);
      if (v19 == v23 || (-[__CFString isEqualToString:](v19, "isEqualToString:", v23) & 1) != 0)
      {
        v24 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          v27 = "-[ADCompanionService _updateCompanionIdentifier]";
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s companion identifier was already set",  (uint8_t *)&v26,  0xCu);
        }

        if (v17 != 6) {
          goto LABEL_40;
        }
      }

      else
      {
        if (v17 != 6)
        {
          [v16 setCompanionIdentifier:0];
          goto LABEL_40;
        }

        if (v19) {
          uint64_t v25 = v19;
        }
        else {
          uint64_t v25 = &stru_1004FECA0;
        }
        [v16 setCompanionIdentifier:v25];
        if (v19)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_deviceUpdateLog, "removeObjectForKey:", v19);
          if (v23)
          {
            [v16 setLastCompanionRemoteDataFetchDate:0];
            [v16 synchronize];
          }
        }
      }

      -[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]( self,  "_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:",  1LL);
LABEL_40:

LABEL_41:
      return;
    }

    v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315138;
      v27 = "-[ADCompanionService _updateCompanionIdentifier]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s unable to check companion identifier without client link established",  (uint8_t *)&v26,  0xCu);
    }
  }

- (void)_updateAssistantIDMapForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    id v16 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if ([v6 length])
  {
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_ad_siriSharedDataProtobuf"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assistantId]);

    if (!v8)
    {
      if (!AFSupportsMultiUser(v9, v10)
        || (id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService")),
            id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 getAssistantIdentifierForIDS:v6]),
            v14,
            !v8))
      {
        uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        int v15 = 136315394;
        id v16 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
        __int16 v17 = 2112;
        id v18 = v4;
        uint64_t v13 = "%s unable to find assistant identifier for device: %@";
LABEL_13:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x16u);
        goto LABEL_11;
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    [v11 _setAssistantId:v8 forDeviceWithIdsDeviceUniqueIdentifier:v6];
  }

  else
  {
    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
      __int16 v17 = 2112;
      id v18 = v4;
      uint64_t v13 = "%s unable to find IDS identifier for device: %@";
      goto LABEL_13;
    }
  }

- (BOOL)_updateSharedData:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315394;
    v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v23, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
    id v10 = [v9 length];
    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantId]);
      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
        [v14 _setAssistantId:v13 forDeviceWithIdsDeviceUniqueIdentifier:v9];
      }

      int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 peerInfoForIDSDeviceUniqueIdentifier:v9 allowNonPeers:1]);
      id v16 = v15;
      if (v15) {
        __int16 v17 = v15;
      }
      else {
        __int16 v17 = -[ADPeerInfo initWithUniqueIdentifer:]( objc_alloc(&OBJC_CLASS___ADPeerInfo),  "initWithUniqueIdentifer:",  v9);
      }
      v20 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      [v21 updateSharedDataWithCloudData:v6 fromPeer:v20];
    }

    else
    {
      id v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315394;
        v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s unable to find IDS identifier for device: %@",  (uint8_t *)&v23,  0x16u);
      }
    }
  }

  else
  {
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s shared data missing", (uint8_t *)&v23, 0xCu);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v7 = v6;
  if (v3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastCompanionRemoteDataFetchDate]);
    uint64_t v9 = v8;
    if (v8 && ([v8 timeIntervalSinceNow], v10 > -86400.0))
    {
      BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s preventing IDS fetch due to rate limiting",  buf,  0xCu);
      }

      uint64_t v12 = 0LL;
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _companionDevice](self, "_companionDevice"));
  if (v13)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002462F8;
    v18[3] = &unk_1004FB0E0;
    id v19 = v7;
    -[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]( self,  "_updateSharedDataForDevice:allowIDSFetch:completion:",  v13,  v12,  v18);
    id v14 = v19;
  }

  else
  {
    int v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s unable to find companion device in active devices",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 idsPersonalDeviceIdentifier]);

    if ((_DWORD)v12
      && -[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]( self,  "_updateSharedDataFromIDSWithIdentifier:",  v14))
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v7 setLastCompanionRemoteDataFetchDate:v17];

      [v7 synchronize];
    }
  }
}

- (void)updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3
{
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v10 = "-[ADCompanionService updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002462E8;
  v7[3] = &unk_1004FC4D0;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(serialQueue, v7);
}

- (void)_updateSharedDataForDevice:(id)a3 allowIDSFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  double v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier]);
  if (![v11 length])
  {
    int v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s unable to find IDS identifier for device: %@",  buf,  0x16u);
      if (!v9) {
        goto LABEL_24;
      }
    }

    else if (!v9)
    {
      goto LABEL_24;
    }

    v9[2](v9, 0LL);
    goto LABEL_24;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_ad_siriSharedDataProtobuf"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_ad_data"));

  if (-[ADCompanionService _updateSharedData:forDevice:](self, "_updateSharedData:forDevice:", v13, v8))
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s updated shared data from siriInfo dictionary",  buf,  0xCu);
    }

    if (v9) {
      v9[2](v9, 0LL);
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v16 systemUptime];
    double v18 = v17;

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceUpdateLog, "objectForKey:", v11));
    v20 = v19;
    if (v19 && ([v19 doubleValue], vabdd_f64(v18, v21) <= 3600.0))
    {
      if (v6)
      {
        BOOL v24 = -[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]( self,  "_updateSharedDataFromIDSWithIdentifier:",  v11);
        if (v9) {
          v9[2](v9, v24);
        }
      }

      else if (v9)
      {
        v9[2](v9, 0LL);
      }
    }

    else
    {
      if (!self->_deviceUpdateLog)
      {
        uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        deviceUpdateLog = self->_deviceUpdateLog;
        self->_deviceUpdateLog = v22;
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100246220;
      v25[3] = &unk_1004F7148;
      v25[4] = self;
      id v26 = v8;
      double v29 = v18;
      id v27 = v11;
      BOOL v30 = v6;
      __int16 v28 = v9;
      -[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]( self,  "_getSharedDataFromCompanionLinkDevice:completion:",  v26,  v25);
    }
  }

LABEL_24:
}

- (BOOL)_updateSharedDataFromIDSWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 length])
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peerInfoForIDSDeviceUniqueIdentifier:v4 allowNonPeers:1]);

    BOOL v8 = v7 != 0LL;
    if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
      [v9 updateSharedDataFromCloudPeers:v10 completion:0];
    }

    else
    {
      BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        id v14 = "-[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]";
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s unable to find peer for IDS identifier: (%@)",  (uint8_t *)&v13,  0x16u);
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_setupClientLink
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v28 = "-[ADCompanionService _setupClientLink]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_clientLink)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextPerformance);
    uint64_t v5 = (os_log_s *)AFSiriLogContextPerformance;
    BOOL v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "CompanionServiceClientLink",  "Creating CompanionService ClientLink",  buf,  2u);
    }

    id v7 = objc_alloc(&OBJC_CLASS___ADRapportLink);
    serialQueue = self->_serialQueue;
    id v9 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004F7168);
    double v10 = -[ADRapportLink initWithQueue:configuration:](v7, "initWithQueue:configuration:", serialQueue, v9);
    clientLink = self->_clientLink;
    self->_clientLink = v10;

    -[ADRapportLink addListener:](self->_clientLink, "addListener:", self);
    uint64_t v25 = RPOptionStatusFlags;
    id v26 = &off_100513678;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    int v13 = self->_clientLink;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100244798;
    v24[3] = &unk_1004F71D0;
    v24[4] = self;
    -[ADRapportLink registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"com.apple.siri.request.execute.ace.command",  v12,  v24);
    id v14 = self->_clientLink;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10024493C;
    v23[3] = &unk_1004F71D0;
    v23[4] = self;
    -[ADRapportLink registerRequestID:options:handler:]( v14,  "registerRequestID:options:handler:",  @"com.apple.siri.request.remote",  v12,  v23);
    __int16 v15 = self->_clientLink;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100244DA4;
    v22[3] = &unk_1004F71D0;
    v22[4] = self;
    -[ADRapportLink registerRequestID:options:handler:]( v15,  "registerRequestID:options:handler:",  @"com.apple.siri.request.shared.data",  v12,  v22);
    id v16 = self->_clientLink;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100245168;
    v21[3] = &unk_1004F71D0;
    v21[4] = self;
    -[ADRapportLink registerRequestID:options:handler:]( v16,  "registerRequestID:options:handler:",  @"com.apple.siri.request.generic",  v12,  v21);
    double v17 = self->_clientLink;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10024585C;
    v20[3] = &unk_1004F71D0;
    v20[4] = self;
    -[ADRapportLink registerRequestID:options:handler:]( v17,  "registerRequestID:options:handler:",  @"com.apple.siri.request.heartbeat",  v12,  v20);
    double v18 = self->_clientLink;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100245B28;
    v19[3] = &unk_1004F7248;
    v19[4] = self;
    v19[5] = v4;
    -[ADRapportLink activateWithCompletion:](v18, "activateWithCompletion:", v19);
  }

- (id)_setupClientAWDLTransportLinkForDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if (v5
    && (BOOL v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]),
        id v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if (v9)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      id v11 = [v10 length];

      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        unsigned int v13 = [v12 hasPrefix:@"device:"];

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        id v9 = v14;
        if (v13)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 _stripFZIDPrefix]);

          id v9 = (void *)v15;
        }
      }

      else
      {
        id v9 = 0LL;
      }
    }
  }

  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[ADCompanionService _setupClientAWDLTransportLinkForDestination:]";
    __int16 v34 = 2112;
    v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Creating AWDL client link for destination: %@",  buf,  0x16u);
  }

  clientAWDLTransportLink = self->_clientAWDLTransportLink;
  if (clientAWDLTransportLink)
  {
    -[ADRapportLink invalidate](clientAWDLTransportLink, "invalidate");
    double v18 = self->_clientAWDLTransportLink;
    self->_clientAWDLTransportLink = 0LL;
  }

  clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
  self->_clientAWDLTransportLinkDestinationId = 0LL;

  v20 = objc_alloc(&OBJC_CLASS___ADRapportLink);
  serialQueue = self->_serialQueue;
  id v22 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004F7268);
  int v23 = -[ADRapportLink initWithQueue:configuration:](v20, "initWithQueue:configuration:", serialQueue, v22);
  BOOL v24 = self->_clientAWDLTransportLink;
  self->_clientAWDLTransportLink = v23;

  -[ADRapportLink addListener:](self->_clientAWDLTransportLink, "addListener:", self);
  uint64_t v25 = self->_clientAWDLTransportLink;
  uint64_t v30 = RPOptionStatusFlags;
  __int128 v31 = &off_1005136C0;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100244564;
  v29[3] = &unk_1004F71D0;
  v29[4] = self;
  -[ADRapportLink registerRequestID:options:handler:]( v25,  "registerRequestID:options:handler:",  @"com.apple.siri.request.execute.ace.command",  v26,  v29);

  -[ADRapportLink setDestinationDevice:](self->_clientAWDLTransportLink, "setDestinationDevice:", v4);
  id v27 = self->_clientAWDLTransportLink;

  return v27;
}

- (void)_handleAceCommandRequest:(id)a3 messageID:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v9 = a3;
  double v10 = (NSMutableDictionary *)a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
    __int16 v158 = 2112;
    v159 = v10;
    __int16 v160 = 2112;
    id v161 = v9;
    __int16 v162 = 2112;
    id v163 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s incoming command request: %@ %@ %@",  buf,  0x2Au);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"messageLinkType"]);
  uint64_t v15 = v14;
  if (!v14 || ![v14 isEqualToString:@"AWDL"])
  {
    unsigned int v126 = 0;
LABEL_10:
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"forwardsToIDSDeviceId"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = 0LL;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"forwardsToAssistantId"]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
      unint64_t v22 = v20;
    }
    else {
      unint64_t v22 = 0LL;
    }

    id v132 = (id)v22;
    v133 = v10;
    if (v19 | v22)
    {
      v150[0] = _NSConcreteStackBlock;
      v150[1] = 3221225472LL;
      v150[2] = sub_100244084;
      v150[3] = &unk_1004F9010;
      uint64_t v129 = v19;
      id v151 = (id)v19;
      id v152 = (id)v22;
      int v23 = (NSMutableDictionary *)+[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v150);
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localPeerInfo]);

      if ((sub_10016A850(v23, v25) & 1) == 0)
      {
        v122 = v15;
        __int16 v34 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
          __int16 v158 = 2112;
          v159 = v23;
          __int16 v160 = 2112;
          id v161 = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "%s Forwarding request to %@: %@",  buf,  0x20u);
        }

        v35 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v23);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _getExecutionIdFromRequest:](self, "_getExecutionIdFromRequest:", v9));
        v37 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:",  v35,  1LL,  v36));

        if (v37)
        {
          clientLink = self->_clientLink;
          v39 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _transformedRequestDictionaryToForward:]( self,  "_transformedRequestDictionaryToForward:",  v9));
          v40 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
          uint64_t v154 = RPOptionStatusFlags;
          v155 = &off_100513678;
          id v41 = v9;
          v42 = v12;
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v155,  &v154,  1LL));
          v148[0] = _NSConcreteStackBlock;
          v148[1] = 3221225472LL;
          v148[2] = sub_1002440CC;
          v148[3] = &unk_1004F72B0;
          id v149 = v42;
          -[ADRapportLink sendRequestID:request:destinationID:options:responseHandler:]( clientLink,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.siri.request.execute.ace.command",  v39,  v40,  v43,  v148);

          id v12 = v42;
          id v9 = v41;

          v44 = v149;
        }

        else
        {
          v46 = (os_log_s *)AFSiriLogContextDaemon;
          BOOL v47 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
          if (v47)
          {
            *(_DWORD *)buf = 136315394;
            v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
            __int16 v158 = 2112;
            v159 = v23;
            _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s Unable to find destination from peer info %@.",  buf,  0x16u);
          }

          if (AFIsInternalInstall(v47))
          {
            v48 = (os_log_s *)AFSiriLogContextPerformance;
            os_signpost_id_t v49 = os_signpost_id_generate(AFSiriLogContextPerformance);
            if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v50 = v49;
              if (os_signpost_enabled(v48))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_EVENT,  v50,  "CompanionDeviceNotFound",  "ADCompanionService _handleAceCommandRequest",  buf,  2u);
              }
            }
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1017LL));
          (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v44);
        }

        id v29 = v151;
        uint64_t v15 = v122;
        uint64_t v19 = v129;
        goto LABEL_44;
      }

      uint64_t v19 = v129;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
    unsigned int v27 = [v26 isLostModeActive];

    if (!v27)
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"command"]);
      if (!v29)
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"serializedCommand"]);
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
        {
          __int128 v32 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s incoming command is serialized",  buf,  0xCu);
          }

          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v30));
          id v29 = (id)objc_claimAutoreleasedReturnValue([v33 dictionary]);
        }

        else
        {
          id v29 = 0LL;
        }
      }

      uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v29, v52) & 1) != 0)
      {
        uint64_t v130 = v19;
        v119 = (void (**)(void, void, void, void))v12;
        os_signpost_id_t v53 = os_signpost_id_generate(AFSiriLogContextPerformance);
        v54 = (os_log_s *)AFSiriLogContextPerformance;
        v55 = v54;
        os_signpost_id_t spid = v53;
        unint64_t v56 = v53 - 1;
        if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          v57 = (char *)objc_claimAutoreleasedReturnValue([v29 valueForKey:@"$class"]);
          *(_DWORD *)buf = 138412546;
          v157 = v57;
          __int16 v158 = 2112;
          v159 = v133;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "CompanionService",  "Received ACE Command Request: Class=%@, MessageID=%@",  buf,  0x16u);
        }

        id v146 = 0LL;
        id v147 = 0LL;
        id v144 = 0LL;
        id v145 = 0LL;
        unsigned __int8 v58 = -[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]( self,  "_validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:",  v9,  v11,  &v147,  &v146,  &v145,  &v144);
        v116 = (NSMutableDictionary *)v147;
        id v59 = v146;
        v118 = (NSMutableDictionary *)v145;
        id v117 = v144;
        id v115 = v59;
        if ((v58 & 1) != 0)
        {
          if (v59 && v118)
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[ADDeviceCircleManager sharedInstance]( &OBJC_CLASS___ADDeviceCircleManager,  "sharedInstance"));
            [v60 _setAssistantId:v59 forDeviceWithIdsDeviceUniqueIdentifier:v118];
          }

          v112 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[ADPeerCloudService sharedInstance]( &OBJC_CLASS___ADPeerCloudService,  "sharedInstance"));
          v61 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:]( v112,  "peerInfoForIDSDeviceUniqueIdentifier:allowNonPeers:",  v118,  1LL));
          if (!v61)
          {
            v62 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
              __int16 v158 = 2112;
              v159 = v118;
              _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "%s received command from peer IDS isn't aware of yet: %@",  buf,  0x16u);
            }

            v61 = -[ADPeerInfo initWithUniqueIdentifer:]( objc_alloc(&OBJC_CLASS___ADPeerInfo),  "initWithUniqueIdentifer:",  v118);
          }

          -[ADPeerInfo setAssistantIdentifier:](v61, "setAssistantIdentifier:", v59);
          -[ADPeerInfo setHomeKitAccessoryIdentifier:](v61, "setHomeKitAccessoryIdentifier:", v117);
          uint64_t v63 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"airPlayRouteIDs"]);
          v113 = v61;
          if (v63)
          {
            v64 = (void *)v63;
            uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v64, v65) & 1) != 0)
            {
              __int128 v142 = 0u;
              __int128 v143 = 0u;
              __int128 v140 = 0u;
              __int128 v141 = 0u;
              id obj = v64;
              id v66 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
              if (v66)
              {
                id v67 = v66;
                id v124 = v11;
                uint64_t v68 = *(void *)v141;
                while (2)
                {
                  for (i = 0LL; i != v67; i = (char *)i + 1)
                  {
                    if (*(void *)v141 != v68) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v70 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)i);
                    uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString);
                    if ((objc_opt_isKindOfClass(v70, v71) & 1) == 0)
                    {

                      v85 = (os_log_s *)AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315138;
                        v157 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                        _os_log_error_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_ERROR,  "%s received malformed route identifiers",  buf,  0xCu);
                      }

                      id obj = 0LL;
                      goto LABEL_88;
                    }
                  }

                  id v67 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
                  if (v67) {
                    continue;
                  }
                  break;
                }

- (void)_prepAWDLClientLinkIfMessageReceivedOverAWDL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"messageLinkType"]);
  BOOL v6 = v5;
  if (v5 && [v5 isEqualToString:@"AWDL"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"idsDeviceId"]);
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (v7)
    {
      id v9 = (void *)v7;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Received message via AWDL for destinationId: %@",  buf,  0x16u);
      }

      if (self->_clientAWDLTransportLink
        && -[NSString isEqualToString:](self->_clientAWDLTransportLinkDestinationId, "isEqualToString:", v9))
      {
        double v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
          __int16 v19 = 2112;
          v20 = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Already activated AWDL link for destinationId: %@. Extending timer.",  buf,  0x16u);
        }

        -[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer](self, "_scheduleOrExtendAWDLClientLinkTimer");
      }

      else
      {
        id v11 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        -[RPCompanionLinkDevice setIdentifier:](v11, "setIdentifier:", v9);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100243F24;
        v14[3] = &unk_1004F7328;
        v14[4] = self;
        id v15 = v9;
        id v16 = (id)objc_claimAutoreleasedReturnValue( -[ADCompanionService _setupClientAWDLTransportLinkForDestination:]( self,  "_setupClientAWDLTransportLinkForDestination:",  v11));
        id v12 = v16;
        id v13 = v9;
        -[ADCompanionService _activateAWDLMessageLink:completion:]( self,  "_activateAWDLMessageLink:completion:",  v12,  v14);

        id v9 = v11;
      }
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Incoming request does not have device IDS id set.",  buf,  0xCu);
      }

      id v9 = 0LL;
    }
  }
}

- (void)_activateAWDLMessageLink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[ADCompanionService _activateAWDLMessageLink:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  os_signpost_id_t v9 = os_signpost_id_generate(AFSiriLogContextPerformance);
  double v10 = (os_log_s *)AFSiriLogContextPerformance;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "CompanionServiceAWDLClientLink",  "Creating AWDL Client link",  buf,  2u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100243BD8;
  block[3] = &unk_1004FB930;
  id v17 = v7;
  os_signpost_id_t v18 = v9;
  id v16 = v6;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_updateSiriInfoDictionary
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADCompanionService _updateSiriInfoDictionary]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100243260;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 assistantId:(id *)a6 idsDeviceId:(id *)a7 homeKitId:(id *)a8
{
  id v12 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  if (a8) {
    *a8 = 0LL;
  }
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 objectForKey:@"idsDeviceId"]);
    if (v14)
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
      {
        __int16 v28 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v35 = 136315138;
          v36 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s malformed IDS id",  (uint8_t *)&v35,  0xCu);
        }

        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed IDS id."));
        id v23 = v29;
        if (a5)
        {
          id v23 = v29;
          BOOL v27 = 0;
          *a5 = v23;
        }

        else
        {
          BOOL v27 = 0;
        }

        goto LABEL_59;
      }

      if (![(id)v14 length])
      {

        uint64_t v14 = 0LL;
      }
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 objectForKey:@"homeKitId"]);
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {
        uint64_t v30 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v35 = 136315138;
          v36 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s malformed HomeKit id",  (uint8_t *)&v35,  0xCu);
        }

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed HomeKit id."));
        id v23 = v31;
        if (a5)
        {
          id v23 = v31;
          BOOL v27 = 0;
          *a5 = v23;
        }

        else
        {
          BOOL v27 = 0;
        }

        goto LABEL_58;
      }

      if (![(id)v16 length])
      {

        uint64_t v16 = 0LL;
      }
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 objectForKey:@"assistantId"]);
    if (v18)
    {
      __int16 v19 = (void *)v18;
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        __int128 v32 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v35 = 136315138;
          v36 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s malformed Assistant id",  (uint8_t *)&v35,  0xCu);
        }

        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  11LL,  @"Malformed Assistant id."));
        id v23 = v33;
        if (a5)
        {
          id v24 = v33;
          id v23 = v24;
          goto LABEL_44;
        }

- (void)_sharedDataDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADCompanionService _sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100243250;
  v5[3] = &unk_1004FB0E0;
  v5[4] = self;
  -[ADCompanionService _updateSharedDataWithCompletion:](self, "_updateSharedDataWithCompletion:", v5);
}

- (void)_encryptionKeyDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCompanionService _encryptionKeyDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100243248;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_storeFrontDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADCompanionService _storeFrontDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100243238;
  v5[3] = &unk_1004FB0E0;
  v5[4] = self;
  -[ADCompanionService _updateStoreFrontIdentifierWithCompletion:]( self,  "_updateStoreFrontIdentifierWithCompletion:",  v5);
}

- (void)_watchListKitStoredConfigurationTokenChanged
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[ADCompanionService _watchListKitStoredConfigurationTokenChanged]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (AFSupportsWatchListKit())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100243228;
    v4[3] = &unk_1004FB0E0;
    v4[4] = self;
    -[ADCompanionService _updateWatchListKitDataWithCompletion:](self, "_updateWatchListKitDataWithCompletion:", v4);
  }

- (void)_musicPersonalizationTokenChanged
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADCompanionService _musicPersonalizationTokenChanged]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADCompanionService _updateSiriInfoDictionary](self, "_updateSiriInfoDictionary");
}

- (void)_startObservingDataChangedNotifications
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[ADCompanionService _startObservingDataChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isObservingDataChanges)
  {
    int v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[ADCompanionService _startObservingDataChangedNotifications]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Already observing data changes", buf, 0xCu);
    }
  }

  else
  {
    self->_isObservingDataChanges = 1;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    if (AFSupportsPlayThisOnThatPlayback( [v5 addObserver:self selector:"_sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0]))
    {
      objc_initWeak(&location, self);
      if (self->_musicPersonalizationNotificationToken == -1)
      {
        serialQueue = (dispatch_queue_s *)self->_serialQueue;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_1002431D0;
        handler[3] = &unk_1004F8E08;
        objc_copyWeak(&v14, &location);
        if (notify_register_dispatch( AFCachedFusePersonalizationTokenChanged,  &self->_musicPersonalizationNotificationToken,  serialQueue,  handler))
        {
          id v7 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v17 = "-[ADCompanionService _startObservingDataChangedNotifications]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed to register for music personalization token notification",  buf,  0xCu);
          }

          self->_musicPersonalizationNotificationToken = -1;
        }

        objc_destroyWeak(&v14);
      }

      if (AFSupportsWatchListKit())
      {
        if (self->_watchListKitStoredConfigurationNotificationToken == -1)
        {
          wlkStoredConfigurationDidChangeDispatchNotification = self->_wlkStoredConfigurationDidChangeDispatchNotification;
          if (wlkStoredConfigurationDidChangeDispatchNotification)
          {
            os_signpost_id_t v9 = (dispatch_queue_s *)self->_serialQueue;
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472LL;
            v11[2] = sub_1002431FC;
            v11[3] = &unk_1004F8E08;
            objc_copyWeak(&v12, &location);
            if (notify_register_dispatch( wlkStoredConfigurationDidChangeDispatchNotification,  &self->_watchListKitStoredConfigurationNotificationToken,  v9,  v11))
            {
              double v10 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v17 = "-[ADCompanionService _startObservingDataChangedNotifications]";
                _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to register for watch list kit stored configuration token notification",  buf,  0xCu);
              }

              self->_watchListKitStoredConfigurationNotificationToken = -1;
            }

            objc_destroyWeak(&v12);
          }
        }
      }

      [v5 addObserver:self selector:"_storeFrontDidChange:" name:@"ADAssistantDataManageriTunesStoreFrontIdentifierDidChangeNotification" object:0];
      objc_destroyWeak(&location);
    }
  }

- (void)_stopObservingDataChangedNotifications
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    os_signpost_id_t v9 = "-[ADCompanionService _stopObservingDataChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isObservingDataChanges)
  {
    self->_isObservingDataChanges = 0;
    uint64_t musicPersonalizationNotificationToken = self->_musicPersonalizationNotificationToken;
    if ((_DWORD)musicPersonalizationNotificationToken != -1)
    {
      uint64_t musicPersonalizationNotificationToken = notify_cancel(musicPersonalizationNotificationToken);
      self->_uint64_t musicPersonalizationNotificationToken = -1;
    }

    if (AFSupportsWatchListKit(musicPersonalizationNotificationToken))
    {
      int watchListKitStoredConfigurationNotificationToken = self->_watchListKitStoredConfigurationNotificationToken;
      if (watchListKitStoredConfigurationNotificationToken != -1)
      {
        notify_cancel(watchListKitStoredConfigurationNotificationToken);
        self->_int watchListKitStoredConfigurationNotificationToken = -1;
      }
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:@"ADAssistantDataManageriTunesStoreFrontIdentifierDidChangeNotification" object:0];
    [v6 removeObserver:self name:@"ADSharedDataDidChangeNotification" object:0];
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      os_signpost_id_t v9 = "-[ADCompanionService _stopObservingDataChangedNotifications]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Already not observing data changes",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)_startListening
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCompanionService _startListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_isListening)
  {
    if (!self->_incomingRequestLog)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      incomingRequestLog = self->_incomingRequestLog;
      self->_incomingRequestLog = v5;
    }

    if (AFSupportsPlayThisOnThat(v4))
    {
      if (!self->_playbackDeviceIDs)
      {
        id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        playbackDeviceIDs = self->_playbackDeviceIDs;
        self->_playbackDeviceIDs = v7;
      }

      os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 addObserver:self selector:"_encryptionKeyDidChange:" name:@"ADSecurityServiceEncryptionKeyDidChangeNotification" object:0];
    }

    -[ADCompanionService _setupClientLink](self, "_setupClientLink");
  }

- (void)stopListening
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002431C8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_stopListening
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v22 = "-[ADCompanionService _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isListening)
  {
    -[ADRapportLink invalidate](self->_clientLink, "invalidate");
    clientLink = self->_clientLink;
    self->_clientLink = 0LL;

    *(_WORD *)&self->_isListening = 0;
    playbackDeviceIDs = self->_playbackDeviceIDs;
    self->_playbackDeviceIDs = 0LL;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:@"ADSecurityServiceEncryptionKeyDidChangeNotification"];

    -[ADCompanionService _setReadyState:](self, "_setReadyState:", self->_isCompanionLinkReady);
    -[ADCompanionService setStereoPartnerIDSIdentifier:](self, "setStereoPartnerIDSIdentifier:", 0LL);
    -[NSMutableDictionary removeAllObjects](self->_incomingRequestLog, "removeAllObjects");
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_timerInfo, "allValues", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) heartbeatTimer]);
          [v12 stop];
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }

    -[ADCompanionService _stopObservingDataChangedNotifications](self, "_stopObservingDataChangedNotifications");
    cachedSharedData = self->_cachedSharedData;
    self->_cachedSharedData = 0LL;

    cachedStoreFrontIdentifier = self->_cachedStoreFrontIdentifier;
    self->_cachedStoreFrontIdentifier = 0LL;

    cachedUTSInfo = self->_cachedUTSInfo;
    self->_cachedUTSInfo = 0LL;
  }

- (BOOL)isListening
{
  return self->_isListening;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)getDeviceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100242FD0;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithIDSIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[ADCompanionService sendMessage:messageType:toDeviceWithIDSIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100242F80;
  block[3] = &unk_1004FCBB0;
  void block[4] = self;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(serialQueue, block);
}

- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithHKIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[ADCompanionService sendMessage:messageType:toDeviceWithHKIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100242F30;
  block[3] = &unk_1004FCBB0;
  void block[4] = self;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(serialQueue, block);
}

- (void)_sendMessage:(id)a3 messageType:(id)a4 toTargetDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v47 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2112;
    id v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v16 = [v15 isLostModeActive];

  if (v16)
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v47 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  buf,  0xCu);
      if (!v13) {
        goto LABEL_26;
      }
      goto LABEL_6;
    }

    if (v13)
    {
LABEL_6:
      uint64_t v18 = 1003LL;
LABEL_24:
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v18));
      v13[2](v13, 0LL, v19);
LABEL_25:
    }
  }

  else
  {
    if (!self->_isListening)
    {
      BOOL v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        BOOL v47 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s companion service is disabled",  buf,  0xCu);
        if (!v13) {
          goto LABEL_26;
        }
      }

      else if (!v13)
      {
        goto LABEL_26;
      }

      uint64_t v18 = 1009LL;
      goto LABEL_24;
    }

    if (v12)
    {
      id v19 = -[ADCompanionService _newRequestDictionary](self, "_newRequestDictionary");
      [v19 setObject:v11 forKey:@"type"];
      id v34 = v10;
      [v19 setObject:v10 forKey:@"payload"];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100242934;
      v41[3] = &unk_1004FD990;
      id v20 = (id)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"messageID"]);
      id v42 = v20;
      id v21 = v13;
      id v43 = v21;
      unsigned __int8 v33 = -[ADCompanionService _startTimerForMessage:targetDevice:heartbeat:completion:]( self,  "_startTimerForMessage:targetDevice:heartbeat:completion:",  v20,  v12,  1LL,  v41);
      id v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v47 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
        __int16 v48 = 2112;
        id v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
      }

      clientLink = self->_clientLink;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      uint64_t v44 = RPOptionStatusFlags;
      v45 = &off_100513678;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100242AA8;
      v35[3] = &unk_1004F7378;
      id v36 = v20;
      unsigned __int8 v40 = v33;
      id v37 = v12;
      v38 = self;
      v39 = v21;
      id v26 = v20;
      -[ADRapportLink sendRequestID:request:destinationID:options:responseHandler:]( clientLink,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.siri.request.generic",  v19,  v24,  v25,  v35);

      id v10 = v34;
      goto LABEL_25;
    }

    __int16 v28 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v29 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      *(_DWORD *)buf = 136315138;
      BOOL v47 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s unable to find remote device for execution",  buf,  0xCu);
    }

    if (AFIsInternalInstall(v29))
    {
      uint64_t v30 = (os_log_s *)AFSiriLogContextPerformance;
      os_signpost_id_t v31 = os_signpost_id_generate(AFSiriLogContextPerformance);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v32 = v31;
        if (os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_EVENT,  v32,  "CompanionDeviceNotFound",  "ADCompanionService _sendMessage",  buf,  2u);
        }
      }
    }

    if (v13)
    {
      uint64_t v18 = 1000LL;
      goto LABEL_24;
    }
  }

- (void)setMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v16 = "-[ADCompanionService setMessageHandler:forMessageType:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@, delegate: %@", buf, 0x20u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002428E0;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_removeMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_handlerForMessageType, "objectForKey:", v7));
  unsigned int v9 = [v8 isEqual:v6];

  if (v9)
  {
    -[NSMapTable removeObjectForKey:](self->_handlerForMessageType, "removeObjectForKey:", v7);
    if (!-[NSMapTable count](self->_handlerForMessageType, "count"))
    {
      handlerForMessageType = self->_handlerForMessageType;
      self->_handlerForMessageType = 0LL;
    }
  }

  else
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      id v13 = "-[ADCompanionService _removeMessageHandler:forMessageType:]";
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %@ is not registered to handle message type: %@",  (uint8_t *)&v12,  0x20u);
    }
  }
}

- (void)removeMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[ADCompanionService removeMessageHandler:forMessageType:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@, delegate: %@", buf, 0x20u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002428D0;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_updateMediaSystemState
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[ADCompanionService _updateMediaSystemState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (AFIsHorseman(v4, v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaSystemIdentifier]);

    if (v7)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices", 0LL));
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v8);
            }
            int v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
            if (-[ADCompanionService _isDevicePartOfCurrentMediaSystem:]( self,  "_isDevicePartOfCurrentMediaSystem:",  v12))
            {
              id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
              unsigned int v14 = [v12 hasValidDiscoveryTypeForLocalDevice:v13];

              if (v14)
              {
                id v9 = v12;
                goto LABEL_17;
              }
            }
          }

          id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

- (void)setStereoPartnerIDSIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  uint64_t v5 = v4;
  if (self->_stereoPartnerIDSIdentifier != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    id v6 = (NSString *)-[NSString copy](v5, "copy");
    stereoPartnerIDSIdentifier = self->_stereoPartnerIDSIdentifier;
    self->_stereoPartnerIDSIdentifier = v6;

    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_stereoPartnerIDSIdentifier;
      int v10 = 136315394;
      id v11 = "-[ADCompanionService setStereoPartnerIDSIdentifier:]";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s stereo partner has changed: %@",  (uint8_t *)&v10,  0x16u);
    }

    -[ADCompanionService _setIsStereoPairConfigured:]( self,  "_setIsStereoPairConfigured:",  self->_stereoPartnerIDSIdentifier != 0LL);
    -[ADCompanionService _postConfigurationChangedNotification](self, "_postConfigurationChangedNotification");
  }
}

- (BOOL)isStereoPairConfigured
{
  return self->_isStereoPairConfigured;
}

- (void)_setIsStereoPairConfigured:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isStereoPairConfigured != v3)
  {
    self->_isStereoPairConfigured = v3;
    uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADCompanionService _setIsStereoPairConfigured:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s media system is configured: %d",  (uint8_t *)&v6,  0x12u);
    }
  }

- (void)_postConfigurationChangedNotification
{
  if (AFIsHorseman(self, a2))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    uint64_t v4 = &off_100513690;
    if (!self->_isStereoPairConfigured) {
      uint64_t v4 = &off_1005136A8;
    }
    __int16 v8 = @"deviceCount";
    BOOL v9 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    [v3 logEventWithType:5101 context:v5];
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  kAFStereoConfigurationaDidChangeDarwinNotification,  0LL,  0LL,  1u);
}

- (void)getStereoPartnerIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10024288C;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (BOOL)_isDevicePartOfCurrentMediaSystem:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaSystemIdentifier]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaSystemIdentifier]);
    unsigned __int8 v9 = [v6 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)sendStereoPartnerMessage:(id)a3 messageType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[ADCompanionService sendStereoPartnerMessage:messageType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002427FC;
  v16[3] = &unk_1004FDA30;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(serialQueue, v16);
}

- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    os_signpost_id_t v32 = "-[ADCompanionService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1002426E0;
  v24[3] = &unk_1004F73A0;
  v24[4] = self;
  id v25 = v14;
  BOOL v29 = a5;
  id v26 = v16;
  id v27 = v15;
  BOOL v30 = a6;
  id v28 = v17;
  id v20 = v17;
  id v21 = v15;
  id v22 = v16;
  id v23 = v14;
  dispatch_async(serialQueue, v24);
}

- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v34 = "-[ADCompanionService startRemoteExecution:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]";
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 2112;
    id v40 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s command = %@, peer = %@, executionContext = %@",  buf,  0x2Au);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002425B4;
  block[3] = &unk_1004F73C8;
  void block[4] = self;
  id v27 = v14;
  BOOL v32 = a5;
  id v28 = v15;
  id v29 = v17;
  id v30 = v16;
  id v31 = v18;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(serialQueue, block);
}

- (void)_executeRemoteRequest:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 throughProxyDevice:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v52 = a7;
  id v16 = (void (**)(id, void, void *))a8;
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
    __int16 v82 = 2112;
    id v83 = v14;
    __int16 v84 = 2112;
    id v85 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }

  os_signpost_id_t v53 = v14;
  v54 = v15;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v19 = [v18 isLostModeActive];

  if (v19)
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  buf,  0xCu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1003LL));
    v16[2](v16, 0LL, v21);
    goto LABEL_48;
  }

  -[ADCompanionService _checkCompanionIdentifierStatus](self, "_checkCompanionIdentifierStatus");
  if (self->_isListening)
  {
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_1002410B4;
    v75[3] = &unk_1004F7440;
    id v22 = v14;
    id v76 = v22;
    v77 = self;
    __int16 v48 = v16;
    id v79 = v48;
    id v23 = v15;
    id v78 = v23;
    id v51 = objc_retainBlock(v75);
    id v74 = 0LL;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _getExecutionIdFromRequest:](self, "_getExecutionIdFromRequest:", v22));
    id v25 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:log DiscoveryContextFor:",  v23,  1LL,  v10,  &v74,  v24));
    id v50 = v74;

    if (v25) {
      unsigned int v26 = -[RPCompanionLinkDevice isDiscoveredOverWifiP2P](v25, "isDiscoveredOverWifiP2P", v48, v50);
    }
    else {
      unsigned int v26 = 0;
    }
    clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
    if (clientAWDLTransportLinkDestinationId)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v23 idsDeviceUniqueIdentifier]);
      unsigned int v30 = -[NSString isEqualToString:](clientAWDLTransportLinkDestinationId, "isEqualToString:", v29);

      if (!v25) {
        goto LABEL_23;
      }
    }

    else
    {
      unsigned int v30 = 0;
      if (!v25) {
        goto LABEL_23;
      }
    }

    if (-[RPCompanionLinkDevice isDiscoveredOverInfraWifi](v25, "isDiscoveredOverInfraWifi", v48)
      || (id v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice")),
          unsigned int v32 = -[RPCompanionLinkDevice willUseProxyCommunicationWithLocalDevice:]( v25,  "willUseProxyCommunicationWithLocalDevice:",  v31),  v31,  v32))
    {
      unsigned __int8 v33 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s Device found over iWifi or destination device is a proxyHost on local device.",  buf,  0xCu);
      }

      ((void (*)(void *, RPCompanionLinkDevice *, void))v51[2])(v51, v25, 0LL);
      goto LABEL_47;
    }

- (BOOL)_shouldLogDiscoveryContextForRequestId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    discoveryContextLoggedForExecutionIds = self->_discoveryContextLoggedForExecutionIds;
    if (!discoveryContextLoggedForExecutionIds)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v7 = self->_discoveryContextLoggedForExecutionIds;
      self->_discoveryContextLoggedForExecutionIds = v6;

      discoveryContextLoggedForExecutionIds = self->_discoveryContextLoggedForExecutionIds;
    }

    unsigned int v8 = -[NSMutableSet containsObject:](discoveryContextLoggedForExecutionIds, "containsObject:", v4);
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
      {
        int v14 = 136315394;
        id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Event has already been logged once for %@",  (uint8_t *)&v14,  0x16u);
      }
    }

    else
    {
      if (v10)
      {
        int v14 = 136315394;
        id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Logging event for: %@",  (uint8_t *)&v14,  0x16u);
      }

      -[NSMutableSet addObject:](self->_discoveryContextLoggedForExecutionIds, "addObject:", v4);
    }

    char v12 = v8 ^ 1;
  }

  else
  {
    BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Received nil execution id, skip logging discovery event.",  (uint8_t *)&v14,  0xCu);
    }

    char v12 = 0;
  }

  return v12;
}

- (id)_getExecutionIdFromRequest:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"executionContext"]);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"executionID"]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_rapportEffectiveIdForPeer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rapportEffectiveIdentifier]);
  if (![v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 afPeerInfo]);
    id v6 = sub_10016563C(v5, 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 rapportEffectiveIdentifier]);

    uint64_t v4 = (void *)v8;
  }

  return v4;
}

- (id)_setUpNewIntermediateIDsSetForPeer:(id)a3
{
  id v4 = a3;
  if (!self->_intermediateMessageIDs)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    intermediateMessageIDs = self->_intermediateMessageIDs;
    self->_intermediateMessageIDs = v5;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _rapportEffectiveIdForPeer:](self, "_rapportEffectiveIdForPeer:", v4));
  if ([v7 length])
  {
    uint64_t v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_intermediateMessageIDs, "objectForKey:", v7));
    if (!v8)
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      -[NSMutableDictionary setObject:forKey:](self->_intermediateMessageIDs, "setObject:forKey:", v8, v7);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableSet addObject:](v8, "addObject:", v9);
  }

  else
  {
    BOOL v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[ADCompanionService _setUpNewIntermediateIDsSetForPeer:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Unable to get rapportEffectiveIdentifier for peer %@",  (uint8_t *)&v12,  0x16u);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (void)_recordIntermediateMessageID:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _rapportEffectiveIdForPeer:](self, "_rapportEffectiveIdForPeer:", v7));
    if ([v9 length])
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_intermediateMessageIDs, "objectForKey:", v9));
      BOOL v11 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        id v18 = v11;
        *(_DWORD *)buf = 136316162;
        id v25 = "-[ADCompanionService _recordIntermediateMessageID:forPeer:]";
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v9;
        __int16 v32 = 2048;
        id v33 = [v10 count];
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Recorded %@ for peer: %@, rapportEffectiveIdentifier=%@, messageIDSets count: %lu",  buf,  0x34u);
      }

      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "addObject:", v6, (void)v19);
          }

          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v14);
      }
    }

    else
    {
      id v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "-[ADCompanionService _recordIntermediateMessageID:forPeer:]";
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unable to get rapportEffectiveIdentifier for peer %@",  buf,  0x16u);
      }
    }
  }
}

- (void)_tearDownIntermediateMessageIDs:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _rapportEffectiveIdForPeer:](self, "_rapportEffectiveIdForPeer:", v7));
  id v9 = [v8 length];
  BOOL v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      id v13 = "-[ADCompanionService _tearDownIntermediateMessageIDs:forPeer:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Removed %@", (uint8_t *)&v12, 0x16u);
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_intermediateMessageIDs, "objectForKey:", v8));
    [v11 removeObject:v6];
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    id v13 = "-[ADCompanionService _tearDownIntermediateMessageIDs:forPeer:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Unable to get rapportEffectiveIdentifier for peer %@",  (uint8_t *)&v12,  0x16u);
  }
}

- (id)_initializeNewMessageWaitContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ADCompanionServiceMessageWaitContext);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    BOOL v10 = "-[ADCompanionService _initializeNewMessageWaitContext]";
    __int16 v11 = 2112;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  waitContexts = self->_waitContexts;
  if (!waitContexts)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = self->_waitContexts;
    self->_waitContexts = v6;

    waitContexts = self->_waitContexts;
  }

  -[NSMutableSet addObject:](waitContexts, "addObject:", v3);
  return v3;
}

- (void)_unblockWaitingForMessageIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    waitContexts = self->_waitContexts;
    if (waitContexts)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](waitContexts, "allObjects", 0LL));
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          BOOL v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            -[ADCompanionService _unblockWaitContext:forMessageID:]( self,  "_unblockWaitContext:forMessageID:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  v4);
            BOOL v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v8);
      }
    }
  }
}

- (void)_unblockWaitContext:(id)a3 forMessageID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    __int16 v16 = "-[ADCompanionService _unblockWaitContext:forMessageID:]";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Unblocking %@ with %@", (uint8_t *)&v15, 0x20u);
  }

  if (v6)
  {
    id v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v5 seenMessageIDs]);
    if (!v8)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [v5 setSeenMessageIDs:v8];
    }

    -[NSMutableArray addObject:](v8, "addObject:", v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 waitingOnMessageIDs]);
    [v9 removeObject:v6];
  }

  BOOL v10 = (void (**)(void))objc_claimAutoreleasedReturnValue([v5 completion]);
  if (v10)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 waitingOnMessageIDs]);
    id v12 = [v11 count];

    if (!v12)
    {
      __int128 v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        __int16 v16 = "-[ADCompanionService _unblockWaitContext:forMessageID:]";
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Invoking wait context completion %@",  (uint8_t *)&v15,  0x16u);
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 timer]);
      [v14 cancel];

      [v5 setCompletion:0];
      v10[2](v10);
    }
  }
}

- (void)_waitForMessageIDs:(id)a3 withContext:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  if ([v10 count])
  {
    __int128 v13 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v10);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 seenMessageIDs]);
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        __int16 v17 = 0LL;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableSet removeObject:](v13, "removeObject:", *(void *)(*((void *)&v30 + 1) + 8LL * (void)v17));
          __int16 v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }

      while (v15);
    }

    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v35 = "-[ADCompanionService _waitForMessageIDs:withContext:timeout:completion:]";
      __int16 v36 = 2112;
      id v37 = v11;
      __int16 v38 = 2112;
      __int16 v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s %@ waiting on %@", buf, 0x20u);
    }

    [v11 setWaitingOnMessageIDs:v13];
    [v11 setCompletion:v12];
    -[ADCompanionService _unblockWaitContext:forMessageID:](self, "_unblockWaitContext:forMessageID:", v11, 0LL);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 completion]);

    if (v19)
    {
      objc_initWeak((id *)buf, v11);
      id v20 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      serialQueue = self->_serialQueue;
      id v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472LL;
      __int16 v26 = sub_100240F38;
      id v27 = &unk_1004FBF48;
      objc_copyWeak(&v29, (id *)buf);
      __int16 v28 = self;
      __int128 v22 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v20,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  serialQueue,  &v24,  a5);
      objc_msgSend(v11, "setTimer:", v22, v24, v25, v26, v27);
      -[AFWatchdogTimer start](v22, "start");

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v35 = "-[ADCompanionService _waitForMessageIDs:withContext:timeout:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Nothing to wait on invoking now", buf, 0xCu);
    }

    v12[2](v12);
  }
}

- (void)_cleanUpMessageWaitContext:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCompanionService _cleanUpMessageWaitContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[NSMutableSet removeObject:](self->_waitContexts, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_waitContexts, "count"))
  {
    waitContexts = self->_waitContexts;
    self->_waitContexts = 0LL;
  }
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v21 = "-[ADCompanionService startRemoteRequest:onPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (!v8 && v10) {
    v10[2](v10, 0LL);
  }
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100240F28;
  v16[3] = &unk_1004FDA30;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  __int128 v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(serialQueue, v16);
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v42 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v13 = [v12 isLostModeActive];

  if (!v13)
  {
    -[ADCompanionService _checkCompanionIdentifierStatus](self, "_checkCompanionIdentifierStatus");
    id v15 = -[ADCompanionService _newRequestDictionaryWithRequestInfo:](self, "_newRequestDictionaryWithRequestInfo:", v8);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService _getExecutionIdFromRequest:](self, "_getExecutionIdFromRequest:", v15));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:",  v9,  1LL,  v16));

    if (self->_isListening)
    {
      if (v17)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"messageID"]);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100240D74;
        v37[3] = &unk_1004FC838;
        id v19 = v10;
        id v38 = v19;
        unsigned __int8 v31 = -[ADCompanionService _startTimerForMessage:targetDevice:heartbeat:completion:]( self,  "_startTimerForMessage:targetDevice:heartbeat:completion:",  v18,  v17,  1LL,  v37);
        id v20 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v42 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
          __int16 v43 = 2112;
          id v44 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
        }

        clientLink = self->_clientLink;
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        uint64_t v39 = RPOptionStatusFlags;
        id v40 = &off_100513678;
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100240D8C;
        v32[3] = &unk_1004F7530;
        unsigned __int8 v36 = v31;
        id v33 = v18;
        id v34 = self;
        id v35 = v19;
        id v23 = v18;
        -[ADRapportLink sendRequestID:request:destinationID:options:responseHandler:]( clientLink,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.siri.request.remote",  v15,  v21,  v22,  v32);

        goto LABEL_22;
      }

      uint64_t v25 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v26 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        *(_DWORD *)buf = 136315138;
        id v42 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s unable to find remote device for execution",  buf,  0xCu);
      }

      if (AFIsInternalInstall(v26))
      {
        id v27 = (os_log_s *)AFSiriLogContextPerformance;
        os_signpost_id_t v28 = os_signpost_id_generate(AFSiriLogContextPerformance);
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v29 = v28;
          if (os_signpost_enabled(v27))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_EVENT,  v29,  "CompanionDeviceNotFound",  "ADCompanionService _startRemoteRequest",  buf,  2u);
          }
        }
      }
    }

    else
    {
      id v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v42 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s companion service is disabled",  buf,  0xCu);
      }
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
LABEL_22:

    goto LABEL_23;
  }

  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v42 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  buf,  0xCu);
  }

  (*((void (**)(id, void))v10 + 2))(v10, 0LL);
LABEL_23:
}

- (void)startListeningForRemote
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100240D6C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_getSharedDataFromCompanionLinkDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v10 = [v9 isLostModeActive];

  if (v10)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  buf,  0xCu);
    }

    uint64_t v12 = 1003LL;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceIdentifier]);
    id v15 = [v14 length];

    if (v15)
    {
      id v13 = -[ADCompanionService _newRequestDictionary](self, "_newRequestDictionary");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"messageID"]);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100240990;
      v30[3] = &unk_1004FC838;
      id v17 = v7;
      id v31 = v17;
      unsigned __int8 v18 = -[ADCompanionService _startTimerForMessage:targetDevice:heartbeat:completion:]( self,  "_startTimerForMessage:targetDevice:heartbeat:completion:",  v16,  v6,  1LL,  v30);
      id v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
        __int16 v36 = 2112;
        id v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
      }

      clientLink = self->_clientLink;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      uint64_t v32 = RPOptionStatusFlags;
      id v33 = &off_100513678;
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100240A6C;
      v25[3] = &unk_1004F7530;
      unsigned __int8 v29 = v18;
      id v26 = v16;
      id v27 = self;
      id v28 = v17;
      id v23 = v16;
      -[ADRapportLink sendRequestID:request:destinationID:options:responseHandler:]( clientLink,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.siri.request.shared.data",  v13,  v21,  v22,  v25);

      goto LABEL_12;
    }

    id v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s device does not have an IDS identifier: %@",  buf,  0x16u);
      if (!v7) {
        goto LABEL_13;
      }
    }

    else if (!v7)
    {
      goto LABEL_13;
    }

    uint64_t v12 = 0LL;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v12));
  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v13);
LABEL_12:

LABEL_13:
}

- (void)_updateSharedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService _updateSharedDataWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100240898;
  v8[3] = &unk_1004F7558;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getSharedDataForPeer:v8];
}

- (void)_updateStoreFrontIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService _updateStoreFrontIdentifierWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100240640;
  v8[3] = &unk_1004FCFD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getiTunesStoreFrontIdentifierWithCompletion:v8];
}

- (void)_updateWatchListKitDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCompanionService _updateWatchListKitDataWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  if (AFSupportsWatchListKit(v6))
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10023FFCC;
    v20[3] = &unk_1004F7580;
    objc_copyWeak(&v21, &location);
    id v7 = objc_retainBlock(v20);
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x2050000000LL;
    id v8 = (void *)qword_100578240;
    uint64_t v26 = qword_100578240;
    if (!qword_100578240)
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      id v28 = sub_10024015C;
      unsigned __int8 v29 = &unk_1004FDB20;
      __int128 v30 = &v23;
      sub_10024015C((uint64_t)&buf);
      id v8 = (void *)v24[3];
    }

    id v9 = v8;
    _Block_object_dispose(&v23, 8);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sharedInstance]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 storedConfiguration]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requiredRequestKeyValuePairs]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 requiredRequestKeyValuePairs]);
      ((void (*)(void *, void *, id))v7[2])(v7, v13, v4);
    }

    else
    {
      uint64_t v23 = 0LL;
      id v24 = &v23;
      uint64_t v25 = 0x2050000000LL;
      id v14 = (void *)qword_100578248;
      uint64_t v26 = qword_100578248;
      if (!qword_100578248)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        id v28 = sub_100240220;
        unsigned __int8 v29 = &unk_1004FDB20;
        __int128 v30 = &v23;
        sub_100240220((uint64_t)&buf);
        id v14 = (void *)v24[3];
      }

      id v15 = v14;
      _Block_object_dispose(&v23, 8);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sharedInstance]);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1002402E4;
      v17[3] = &unk_1004F75D0;
      v17[4] = self;
      id v18 = v4;
      id v19 = v7;
      [v16 fetchConfigurationWithCompletionHandler:v17];
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (id)_remotePlaybackDeviceForDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_ad_siriSharedDataProtobuf"));
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SARemotePlaybackDevice);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantId]);
    [v6 setAssistantId:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userAssignedName]);
    [v6 setDeviceName:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 languageCode]);
    [v6 setLanguage:v9];

    objc_msgSend(v6, "setSiriEnabled:", objc_msgSend(v5, "siriEnabled"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userAgent]);
    [v6 setUserAgent:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 storeFrontId]);
    [v6 setStorefront:v11];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userToken]);
    [v6 setUserToken:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 utsRequiredRequestData]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_ad_dictionaryRepresentation"));
    [v6 setUtsRequiredRequestKeyValuePairs:v14];

    playbackDeviceIDs = self->_playbackDeviceIDs;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v16));

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 airplayRouteId]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v18]);
    [v6 setHashedRouteId:v19];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_resetHashedRouteIDs
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v21 = "-[ADCompanionService _resetHashedRouteIDs]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        playbackDeviceIDs = self->_playbackDeviceIDs;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v11));

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
          unsigned int v14 = [v9 hasValidDiscoveryTypeForLocalDevice:v13];

          if (v14)
          {
            [v12 removeAllObjects];
            -[ADCompanionService _updateHashedRouteIDForDevice:](self, "_updateHashedRouteIDForDevice:", v9);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }
}

- (void)_updateHashedRouteIDForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v20 = "-[ADCompanionService _updateHashedRouteIDForDevice:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  playbackDeviceIDs = self->_playbackDeviceIDs;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v7));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_ad_siriSharedDataProtobuf"));
    unsigned int v10 = v9;
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 airplayRouteId]);
    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v11]);

      if (!v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSecurityService sharedService](&OBJC_CLASS___ADSecurityService, "sharedService"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10023FC54;
        v15[3] = &unk_1004F75F8;
        id v16 = v4;
        __int128 v17 = self;
        id v18 = v11;
        [v14 processData:v13 usingProcedure:1 completion:v15];

LABEL_10:
      }
    }

    else if ([v8 count])
    {
      [v8 removeAllObjects];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v13 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
      goto LABEL_10;
    }

    goto LABEL_12;
  }

- (void)getPlaybackDeviceListWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADCompanionService getPlaybackDeviceListWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10023FA10;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)getSharedCompanionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADCompanionService getSharedCompanionInfoWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10023F990;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 heartbeat:(BOOL)a5 completion:(id)a6
{
  return -[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]( self,  "_startTimerForMessage:targetDevice:timeout:heartbeat:completion:",  a3,  a4,  a5,  a6,  10.0);
}

- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 timeout:(double)a5 heartbeat:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int128 v15 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v50 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
    __int16 v51 = 2112;
    double v52 = *(double *)&v12;
    __int16 v53 = 2112;
    id v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v12)
  {
    __int16 v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v50 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
      id v18 = "%s message ID is null";
      id v19 = v21;
      uint32_t v20 = 12;
      goto LABEL_17;
    }

- (BOOL)_cancelTimerForMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timerInfo, "objectForKey:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 heartbeatTimer]);
    [v6 cancelIfNotAlreadyCanceled];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 requestTimer]);
    unsigned __int8 v8 = [v7 cancelIfNotAlreadyCanceled];
    -[NSMutableDictionary removeObjectForKey:](self->_timerInfo, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_timerInfo, "count"))
    {
      timerInfo = self->_timerInfo;
      self->_timerInfo = 0LL;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_sendHeartbeatMessage:(id)a3 targetDeviceIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"messageID"]);
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
    __int16 v47 = 2112;
    double v48 = *(double *)&v13;
    __int16 v49 = 2112;
    id v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMDMonitor sharedManager](&OBJC_CLASS___ADFMDMonitor, "sharedManager"));
  unsigned int v16 = [v15 isLostModeActive];

  if (!v16)
  {
    uint64_t v19 = 0LL;
    if (v11 && self->_clientAWDLTransportLink)
    {
      if (-[NSString isEqualToString:](self->_clientAWDLTransportLinkDestinationId, "isEqualToString:", v11, 0LL))
      {
        -[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer](self, "_scheduleOrExtendAWDLClientLinkTimer");
        uint64_t v19 = 1LL;
      }

      else
      {
        uint64_t v19 = 0LL;
      }
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForUniqueIDSIdentifier:allowsAWDLFallback:]( self,  "_companionLinkDeviceForUniqueIDSIdentifier:allowsAWDLFallback:",  v11,  v19));
    id v18 = (void *)v20;
    if (self->_isListening)
    {
      if (v20)
      {
        if (a5 > 0.0)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_10023F174;
          v41[3] = &unk_1004FC838;
          id v21 = v12;
          id v42 = v21;
          unsigned __int8 v35 = -[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]( self,  "_startTimerForMessage:targetDevice:timeout:heartbeat:completion:",  v13,  v18,  0LL,  v41,  a5);
          id v22 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315394;
            id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
            __int16 v47 = 2112;
            double v48 = *(double *)&v13;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
          }

          clientLink = self->_clientLink;
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          uint64_t v43 = RPOptionStatusFlags;
          id v44 = &off_100513678;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_10023F1D8;
          v36[3] = &unk_1004F7530;
          unsigned __int8 v40 = v35;
          id v37 = v13;
          id v38 = self;
          id v39 = v21;
          -[ADRapportLink sendRequestID:request:destinationID:options:responseHandler:]( clientLink,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.siri.request.heartbeat",  v10,  v24,  v25,  v36);

          uint64_t v26 = v42;
          goto LABEL_34;
        }

        id v34 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315650;
          id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
          __int16 v47 = 2048;
          double v48 = a5;
          __int16 v49 = 2112;
          id v50 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s invalid timeout (%f) for message: %@",  buf,  0x20u);
          if (!v12) {
            goto LABEL_35;
          }
        }

        else if (!v12)
        {
          goto LABEL_35;
        }

        uint64_t v28 = 50LL;
      }

      else
      {
        unsigned __int8 v29 = (os_log_s *)AFSiriLogContextDaemon;
        BOOL v30 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
        if (v30)
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s unable to find remote device for execution",  buf,  0xCu);
        }

        if (AFIsInternalInstall(v30))
        {
          id v31 = (os_log_s *)AFSiriLogContextPerformance;
          os_signpost_id_t v32 = os_signpost_id_generate(AFSiriLogContextPerformance);
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v33 = v32;
            if (os_signpost_enabled(v31))
            {
              *(_WORD *)__int128 buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_EVENT,  v33,  "CompanionDeviceNotFound",  "ADCompanionService _sendHeartbeatMessage",  buf,  2u);
            }
          }
        }

        if (!v12)
        {
          id v18 = 0LL;
          goto LABEL_35;
        }

        uint64_t v28 = 1000LL;
      }
    }

    else
    {
      id v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s companion service is disabled",  buf,  0xCu);
        if (!v12) {
          goto LABEL_35;
        }
      }

      else if (!v12)
      {
        goto LABEL_35;
      }

      uint64_t v28 = 1009LL;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v28));
    (*((void (**)(id, void *))v12 + 2))(v12, v26);
LABEL_34:

    goto LABEL_35;
  }

  __int128 v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v46 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Lost mode is active, not sending any outbound requests",  buf,  0xCu);
    if (!v12) {
      goto LABEL_36;
    }
    goto LABEL_6;
  }

  if (v12)
  {
LABEL_6:
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1003LL));
    (*((void (**)(id, void *))v12 + 2))(v12, v18);
LABEL_35:
  }

- (void)_checkCompanionIdentifierStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  id v4 = v3;
  if (v3 && ![v3 personalDeviceState])
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      unsigned __int8 v8 = "-[ADCompanionService _checkCompanionIdentifierStatus]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s posting notification to request companion update",  (uint8_t *)&v7,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.siri.personal.requests.companion.update",  0LL,  0LL,  1u);
  }
}

- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 logDiscoveryContextFor:(id)a5
{
  return -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:",  a3,  a4,  0LL,  0LL,  a5);
}

- (id)discoveryTypeForPeer:(id)a3
{
  id v45 = (ADPeerInfo *)a3;
  if (v45)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo idsDeviceUniqueIdentifier](v45, "idsDeviceUniqueIdentifier"));
    if ([v4 length])
    {

LABEL_7:
      char v50 = 0;
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo afPeerInfo](v45, "afPeerInfo"));
      id v9 = sub_10016563C(v8, &v50);
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

      id v37 = (void *)v10;
      if (v50)
      {
        id v11 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v10);

        id v12 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 136315394;
          double v52 = "-[ADCompanionService discoveryTypeForPeer:]";
          __int16 v53 = 2112;
          id v54 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Improved peer info from Device Circle Manager: %@",  buf,  0x16u);
        }

        id v45 = v11;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
      id v14 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        id v34 = v14;
        unsigned __int8 v35 = (ADPeerInfo *)[v13 count];
        *(_DWORD *)__int128 buf = 136315394;
        double v52 = "-[ADCompanionService discoveryTypeForPeer:]";
        __int16 v53 = 2048;
        id v54 = v35;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "%s Found %lu active devices",  buf,  0x16u);
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id obj = v13;
      id v15 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
      if (!v15)
      {
        id v5 = 0LL;
        goto LABEL_34;
      }

      id v17 = v15;
      id v5 = 0LL;
      uint64_t v18 = *(void *)v47;
      *(void *)&__int128 v16 = 136315650LL;
      __int128 v36 = v16;
      uint64_t v42 = *(void *)v47;
      while (1)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v5;
        id v43 = v17;
        do
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v19);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "idsDeviceIdentifier", v36));
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo idsDeviceUniqueIdentifier](v45, "idsDeviceUniqueIdentifier"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_ad_siriSharedDataProtobuf"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 assistantId]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo assistantIdentifier](v45, "assistantIdentifier"));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v21 effectiveIdentifier]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo rapportEffectiveIdentifier](v45, "rapportEffectiveIdentifier"));
          id v41 = v27;
          if ([v27 isEqualToString:v28])
          {

LABEL_22:
            uint64_t v18 = v42;
            id v17 = v43;
LABEL_23:

            goto LABEL_24;
          }

          id v39 = (void *)objc_claimAutoreleasedReturnValue([v21 homeKitIdentifier]);
          id v38 = v28;
          BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
          id v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo homeKitAccessoryIdentifier](v45, "homeKitAccessoryIdentifier"));
          unsigned __int8 v40 = [v30 isEqualToString:v31];

          uint64_t v18 = v42;
          id v17 = v43;
          if ((v40 & 1) == 0)
          {
            id v5 = v20;
            goto LABEL_27;
          }

- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 allowsAWDLFallback:(BOOL)a5 error:(id *)a6 logDiscoveryContextFor:(id)a7
{
  BOOL v127 = a5;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a6) {
    *a6 = 0LL;
  }
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v114 = (id)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    *(_DWORD *)__int128 buf = 136315394;
    v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v154 = 2112;
    id v155 = v114;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s local device: %@", buf, 0x16u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCompanionDeviceDiscoveryEnded);
  objc_msgSend( v14,  "setHasOtheriOSActiveDevices:",  -[ADCompanionService doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:]( self,  "doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:",  v11));
  unsigned int v15 = -[ADCompanionService _shouldLogDiscoveryContextForRequestId:]( self,  "_shouldLogDiscoveryContextForRequestId:",  v12);
  unsigned int v16 = v15;
  if (!v11)
  {
    [v14 setDiscoveryType:0];
    [v14 setHasNullPeerIdentityServicesId:1];
    if (v16) {
      -[ADCompanionService _logCompanionDeviceDiscoveryContextFor:executionId:]( self,  "_logCompanionDeviceDiscoveryContextFor:executionId:",  v14,  v12);
    }
    id v34 = 0LL;
    goto LABEL_157;
  }

  BOOL v122 = v9;
  v121 = a6;
  unsigned int v124 = v15;
  id v125 = v12;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v17 count];
    *(_DWORD *)__int128 buf = 136315394;
    v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v154 = 2048;
    id v155 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Found %lu active devices", buf, 0x16u);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceUniqueIdentifier]);
  objc_msgSend(v14, "setHasNullPeerIdentityServicesId:", objc_msgSend(v20, "length") == 0);

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v11 idsDeviceUniqueIdentifier]);
  if (v21
    && (id v22 = (void *)v21,
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceUniqueIdentifier]),
        id v24 = [v23 length],
        v23,
        v22,
        v24))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceUniqueIdentifier]);
  }

  else
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v11 idsIdentifier]);
    if (v26
      && (id v27 = (void *)v26,
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 idsIdentifier]),
          id v29 = [v28 length],
          v28,
          v27,
          v29))
    {
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v11 idsIdentifier]);
      unsigned int v31 = [v30 hasPrefix:@"device:"];

      id v32 = (void *)objc_claimAutoreleasedReturnValue([v11 idsIdentifier]);
      uint64_t v25 = v32;
      if (v31)
      {
        uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 _stripFZIDPrefix]);

        uint64_t v25 = (void *)v33;
      }
    }

    else
    {
      uint64_t v25 = 0LL;
    }
  }

  uint64_t v130 = v14;
  unsigned __int8 v35 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    id v36 = (id)objc_claimAutoreleasedReturnValue([v11 homeKitAccessoryIdentifier]);
    id v37 = (id)objc_claimAutoreleasedReturnValue([v11 rapportEffectiveIdentifier]);
    *(_DWORD *)__int128 buf = 136315906;
    v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v154 = 2112;
    id v155 = v25;
    __int16 v156 = 2112;
    id v157 = v36;
    __int16 v158 = 2112;
    id v159 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s Looking for device with ids id: %@, homekitID : %@, rapportEffectiveID: %@",  buf,  0x2Au);
  }

  id v38 = self;
  unsigned int v126 = v17;
  if (![v25 length])
  {
    unint64_t v128 = 0LL;
    id v129 = 0LL;
    goto LABEL_54;
  }

  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  id v39 = v17;
  id v40 = [v39 countByEnumeratingWithState:&v144 objects:v151 count:16];
  if (!v40)
  {
    unint64_t v128 = 0LL;
    id v129 = 0LL;
    goto LABEL_53;
  }

  id v41 = v40;
  unint64_t v128 = 0LL;
  id v129 = 0LL;
  uint64_t v42 = *(void *)v145;
  do
  {
    for (i = 0LL; i != v41; i = (char *)i + 1)
    {
      if (*(void *)v145 != v42) {
        objc_enumerationMutation(v39);
      }
      id v44 = *(void **)(*((void *)&v144 + 1) + 8LL * (void)i);
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 idsDeviceIdentifier]);
      unsigned int v46 = [v45 isEqualToString:v25];

      if (v46)
      {
        __int128 v47 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315138;
          v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logD"
                 "iscoveryContextFor:]";
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "%s Found the matching device using ids id.",  buf,  0xCu);
        }

        objc_msgSend(v130, "setDiscoveryType:", objc_msgSend(v44, "getHALDiscoveryType"));
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](v38->_clientLink, "localDevice"));
        unsigned int v49 = [v44 hasValidDiscoveryTypeForLocalDevice:v48];

        if (!v49)
        {
          double v52 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:lo"
                   "gDiscoveryContextFor:]";
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
          }

          if ([v44 isDiscoveredOverWifiP2P])
          {
            __int16 v53 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 136315138;
              v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:"
                     "logDiscoveryContextFor:]";
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "%s Found device over wifiP2P",  buf,  0xCu);
            }

            uint64_t v54 = 1019LL;
          }

          else
          {
            __int16 v55 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 136315138;
              v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:"
                     "logDiscoveryContextFor:]";
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s Found device over BLE", buf, 0xCu);
            }

            uint64_t v54 = 1020LL;
          }

          uint64_t v56 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v54));
          __int16 v51 = v129;
          id v129 = (id)v56;
          goto LABEL_45;
        }

        if (![v44 isDiscoveredOverWifiP2P])
        {
          uint64_t v57 = v44;

          if (!v57)
          {
            self = v38;
            id v17 = v126;
            goto LABEL_55;
          }

          BOOL v58 = 1;
LABEL_131:
          id v12 = v125;
          id v17 = v126;
          self = v38;
          id v14 = v130;
          goto LABEL_145;
        }

        if (v127)
        {
          id v50 = v44;
          __int16 v51 = (void *)v128;
          unint64_t v128 = (unint64_t)v50;
LABEL_45:

          continue;
        }
      }
    }

    id v41 = [v39 countByEnumeratingWithState:&v144 objects:v151 count:16];
  }

  while (v41);
LABEL_53:

  self = v38;
  id v17 = v126;
LABEL_54:

LABEL_55:
  id v59 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Searching using Rapport Identifier", buf, 0xCu);
  }

  id v60 = (void *)objc_claimAutoreleasedReturnValue([v11 rapportEffectiveIdentifier]);
  id v123 = v11;
  if (![v60 length])
  {
LABEL_81:

    goto LABEL_82;
  }

  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v61 = v17;
  id v62 = [v61 countByEnumeratingWithState:&v140 objects:v150 count:16];
  if (!v62) {
    goto LABEL_80;
  }
  id v63 = v62;
  uint64_t v64 = *(void *)v141;
  while (2)
  {
    uint64_t v65 = 0LL;
LABEL_61:
    if (*(void *)v141 != v64) {
      objc_enumerationMutation(v61);
    }
    id v66 = *(void **)(*((void *)&v140 + 1) + 8 * v65);
    id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 effectiveIdentifier]);
    unsigned int v68 = [v67 isEqualToString:v60];

    if (!v68) {
      goto LABEL_78;
    }
    objc_msgSend(v130, "setDiscoveryType:", objc_msgSend(v66, "getHALDiscoveryType"));
    v69 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_INFO,  "%s Found the matching device using rapportEffectiveIdentifier",  buf,  0xCu);
    }

    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](v38->_clientLink, "localDevice"));
    unsigned int v71 = [v66 hasValidDiscoveryTypeForLocalDevice:v70];

    if (!v71)
    {
      id v74 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDis"
               "coveryContextFor:]";
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
      }

      if ([v66 isDiscoveredOverWifiP2P])
      {
        uint64_t v75 = 1019LL;
      }

      else
      {
        uint64_t v75 = 1020LL;
      }

      uint64_t v76 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v75));
      char v73 = v129;
      id v129 = (id)v76;
LABEL_77:

LABEL_78:
      if (v63 == (id)++v65)
      {
        id v63 = [v61 countByEnumeratingWithState:&v140 objects:v150 count:16];
        if (!v63)
        {
LABEL_80:

          id v11 = v123;
          self = v38;
          id v17 = v126;
          goto LABEL_81;
        }

        continue;
      }

      goto LABEL_61;
    }

    break;
  }

  if ([v66 isDiscoveredOverWifiP2P])
  {
    if (v127)
    {
      id v72 = v66;
      char v73 = (void *)v128;
      unint64_t v128 = (unint64_t)v72;
      goto LABEL_77;
    }

    goto LABEL_78;
  }

  uint64_t v57 = v66;

  if (v57)
  {
LABEL_130:
    BOOL v58 = 1;
    id v11 = v123;
    goto LABEL_131;
  }

  id v11 = v123;
  self = v38;
  id v17 = v126;
LABEL_82:
  v77 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s Searching using HomeKit Identifier", buf, 0xCu);
  }

  id v78 = (void *)objc_claimAutoreleasedReturnValue([v11 homeKitAccessoryIdentifier]);
  if (![v78 length])
  {
LABEL_108:

    goto LABEL_109;
  }

  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  id v79 = v17;
  id v80 = [v79 countByEnumeratingWithState:&v136 objects:v149 count:16];
  if (!v80)
  {
LABEL_107:

    id v11 = v123;
    self = v38;
    id v17 = v126;
    goto LABEL_108;
  }

  id v81 = v80;
  uint64_t v82 = *(void *)v137;
LABEL_87:
  uint64_t v83 = 0LL;
  while (1)
  {
    if (*(void *)v137 != v82) {
      objc_enumerationMutation(v79);
    }
    __int16 v84 = *(void **)(*((void *)&v136 + 1) + 8 * v83);
    id v85 = (void *)objc_claimAutoreleasedReturnValue([v84 homeKitIdentifier]);
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v85 UUIDString]);
    unsigned int v87 = [v86 isEqualToString:v78];

    if (!v87) {
      goto LABEL_105;
    }
    objc_msgSend(v130, "setDiscoveryType:", objc_msgSend(v84, "getHALDiscoveryType"));
    v88 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_INFO,  "%s Found the matching device using homeKitAccessoryIdentifier",  buf,  0xCu);
    }

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](v38->_clientLink, "localDevice"));
    unsigned int v90 = [v84 hasValidDiscoveryTypeForLocalDevice:v89];

    if (v90) {
      break;
    }
    uint64_t v93 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v153 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
    }

    if ([v84 isDiscoveredOverWifiP2P])
    {
      uint64_t v94 = 1019LL;
      goto LABEL_103;
    }

    if ([v84 isDiscoveredOverBLE])
    {
      uint64_t v94 = 1020LL;
LABEL_103:
      uint64_t v95 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v94));
      v92 = v129;
      id v129 = (id)v95;
LABEL_104:
    }

- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3
{
  return -[ADCompanionService _companionLinkDeviceForUniqueIDSIdentifier:allowsAWDLFallback:]( self,  "_companionLinkDeviceForUniqueIDSIdentifier:allowsAWDLFallback:",  a3,  0LL);
}

- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3 allowsAWDLFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 length])
  {
    id v7 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10023F168;
    v12[3] = &unk_1004FD2E8;
    id v13 = v6;
    id v8 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v12);
    BOOL v9 = -[ADPeerInfo initWithAFPeerInfo:](v7, "initWithAFPeerInfo:", v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:",  v9,  1LL,  v4,  0LL,  0LL));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)_companionLinkDeviceForHkIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 length])
  {
    id v5 = objc_alloc(&OBJC_CLASS___ADPeerInfo);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10023F15C;
    v10[3] = &unk_1004FD2E8;
    id v11 = v4;
    id v6 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v10);
    id v7 = -[ADPeerInfo initWithAFPeerInfo:](v5, "initWithAFPeerInfo:", v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:]( self,  "_companionLinkDeviceForPeer:allowsDeviceCircleLookup:logDiscoveryContextFor:",  v7,  1LL,  0LL));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_companionDevice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsPersonalDeviceIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService _companionLinkDeviceForUniqueIDSIdentifier:]( self,  "_companionLinkDeviceForUniqueIDSIdentifier:",  v4));

  return v5;
}

- (id)_newRequestDictionary
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"messageID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localPeerInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceUniqueIdentifier]);

  BOOL v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (v8)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s localPeerUniqueIdentifier: %@",  buf,  0x16u);
    }

    id v10 = -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"idsDeviceId");
  }

  else
  {
    id v10 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v10)
    {
      *(_DWORD *)__int128 buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s unable to retrieve local IDS identifier",  buf,  0xCu);
    }
  }

  if (AFSupportsAirPlayEndpointRoute(v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaRouteIdentifier]);

    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (v12)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315394;
        unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s routeIdentifier: %@", buf, 0x16u);
      }

      uint64_t v33 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, @"airPlayRouteIDs");
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s unable to retrieve AirPlay route identifier",  buf,  0xCu);
    }
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getAssistantIdentifier]);

  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (v16)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      __int16 v36 = 2112;
      id v37 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s assistantId: %@", buf, 0x16u);
    }

    id v18 = -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v16, @"assistantId");
  }

  else
  {
    id v18 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v18)
    {
      *(_DWORD *)__int128 buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s unable to retrieve assistantd identifier",  buf,  0xCu);
    }
  }

  uint64_t v19 = AFCurrentUserInterfaceIdiom(v18);
  uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = (void *)v20;
  if (v20)
  {
    uint64_t v22 = AFCurrentUserInterfaceIdiom(v20);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v23, @"userInterfaceIdiom");
  }

  else
  {
    id v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s unable to retrieve user interface idiom",  buf,  0xCu);
    }
  }

  id v25 = SAAceVersionCurrent;
  if (v25)
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v25, @"aceVersion");
  }

  else
  {
    uint64_t v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s unable to retrieve ACE version",  buf,  0xCu);
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 mediaSystemIdentifier]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);

  if (v29) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v29, @"mediaSystemId");
  }
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v27 homeKitIdentifier]);
  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);

  if (v31) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v31, @"homeKitId");
  }

  return v3;
}

- (id)_transformedRequestDictionaryToForward:(id)a3
{
  id v4 = [a3 mutableCopy];
  id v5 = -[ADCompanionService _newRequestDictionary](self, "_newRequestDictionary");
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

- (void)_getFilteredDevicesFromList:(id)a3 withAccessToSameHomeAsDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 homeKitIdentifier]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10023EE0C;
    v14[3] = &unk_1004F76E8;
    id v18 = v9;
    id v15 = v8;
    id v16 = v11;
    id v17 = self;
    id v13 = v11;
    [v13 getHomeIdForAccessoryId:v12 completion:v14];
  }
}

- (id)_newRequestInfoWithRequestDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"text"]);
  id v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) == 0)
  {
    id v34 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
      __int16 v56 = 2112;
      uint64_t v57 = @"text";
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
    }

    BOOL v23 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffRequestData"]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
    {
      unsigned __int8 v35 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
        __int16 v56 = 2112;
        uint64_t v57 = @"handoffRequestData";
        _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
      }

      BOOL v23 = 0LL;
    }

    else
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffOriginDeviceName"]);
      id v10 = (void *)v9;
      if (v9 && (objc_opt_isKindOfClass(v9, v4) & 1) == 0)
      {
        __int16 v36 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315394;
          __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
          __int16 v56 = 2112;
          uint64_t v57 = @"handoffOriginDeviceName";
          _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
        }

        BOOL v23 = 0LL;
      }

      else
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffURLString"]);
        id v12 = (void *)v11;
        if (v11 && (objc_opt_isKindOfClass(v11, v4) & 1) == 0)
        {
          id v37 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315394;
            __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
            __int16 v56 = 2112;
            uint64_t v57 = @"handoffURLString";
            _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
          }

          BOOL v23 = 0LL;
        }

        else
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffTurnIdentifier"]);
          if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSUUID), (objc_opt_isKindOfClass(v13, v14) & 1) == 0))
          {
            id v38 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 136315394;
              __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
              __int16 v56 = 2112;
              uint64_t v57 = @"handoffTurnIdentifier";
              _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
            }

            BOOL v23 = 0LL;
          }

          else
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffRequiresUserInteraction"]);
            if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
            {
              id v39 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 136315394;
                __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                __int16 v56 = 2112;
                uint64_t v57 = @"handoffRequiresUserInteraction";
                _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
              }

              BOOL v23 = 0LL;
            }

            else
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"handoffNotification"]);
              id v18 = (void *)v17;
              if (v17 && (objc_opt_isKindOfClass(v17, v4) & 1) == 0)
              {
                id v40 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int128 buf = 136315394;
                  __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                  __int16 v56 = 2112;
                  uint64_t v57 = @"handoffNotification";
                  _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
                }

                BOOL v23 = 0LL;
              }

              else
              {
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"isSiriXRequest"]);
                if (v19 && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v19, v20) & 1) == 0))
                {
                  unsigned int v49 = v19;
                  id v41 = (os_log_s *)AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)__int128 buf = 136315394;
                    __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                    __int16 v56 = 2112;
                    uint64_t v57 = @"isSiriXRequest";
                    _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
                  }

                  BOOL v23 = 0LL;
                  uint64_t v19 = v49;
                }

                else
                {
                  __int16 v51 = v15;
                  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"isATVHandoff"]);
                  __int128 v47 = v21;
                  if (v21
                    && (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v21, v22) & 1) == 0))
                  {
                    id v50 = v19;
                    uint64_t v42 = (os_log_s *)AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)__int128 buf = 136315394;
                      __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                      __int16 v56 = 2112;
                      uint64_t v57 = @"isATVHandoff";
                      _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s malformed remote request key: %@",  buf,  0x16u);
                    }

                    BOOL v23 = 0LL;
                    uint64_t v19 = v50;
                  }

                  else
                  {
                    BOOL v23 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
                    -[AFRequestInfo setText:](v23, "setText:", v6);
                    -[AFRequestInfo setHandoffOriginDeviceName:](v23, "setHandoffOriginDeviceName:", v10);
                    -[AFRequestInfo setHandoffURLString:](v23, "setHandoffURLString:", v12);
                    -[AFRequestInfo setTurnIdentifier:](v23, "setTurnIdentifier:", v13);
                    -[AFRequestInfo setHandoffRequiresUserInteraction:]( v23,  "setHandoffRequiresUserInteraction:",  [v51 BOOLValue]);
                    -[AFRequestInfo setHandoffNotification:](v23, "setHandoffNotification:", v18);
                    -[AFRequestInfo setActivationEvent:](v23, "setActivationEvent:", 1LL);
                    -[AFRequestInfo setIsSiriXRequest:](v23, "setIsSiriXRequest:", [v19 BOOLValue]);
                    -[AFRequestInfo setIsATVHandoff:](v23, "setIsATVHandoff:", [v21 BOOLValue]);
                    unsigned int v24 = [v19 BOOLValue];
                    if (!v7 || !v24) {
                      goto LABEL_49;
                    }
                    __int128 v48 = v19;
                    unsigned int v46 = v18;
                    id v25 = (os_log_s *)AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)__int128 buf = 136315138;
                      __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s Handoff request is SiriX, unpacking RunSiriKitExecutor command and wrapping in a StartLocalRequest",  buf,  0xCu);
                    }

                    id v52 = 0LL;
                    uint64_t v26 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v7,  &v52);
                    id v27 = (__CFString *)v52;
                    id v28 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v26,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___SAIntentGroupRunSiriKitExecutor),  NSKeyedArchiveRootObjectKey);
                    id v45 = (void *)objc_claimAutoreleasedReturnValue(v28);
                    id v29 = v27;
                    if (v27)
                    {
                      BOOL v30 = (os_log_s *)AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)__int128 buf = 136315394;
                        __int16 v55 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                        __int16 v56 = 2112;
                        uint64_t v57 = v29;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Error unpacking RunSiriKitExecutor command from handoff data: %@",  buf,  0x16u);
                      }
                    }

                    id v18 = v46;
                    uint64_t v19 = v48;
                    if (v45)
                    {
                      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                      id v44 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);

                      id v32 = objc_alloc_init(&OBJC_CLASS___SAStartLocalRequest);
                      -[SAStartLocalRequest setAceId:](v32, "setAceId:", v44);
                      [v45 setRefId:v44];
                      __int16 v53 = v45;
                      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v53,  1LL));
                      -[SAStartLocalRequest setClientBoundCommands:](v32, "setClientBoundCommands:", v33);

                      id v18 = v46;
                      -[AFRequestInfo setStartLocalRequest:](v23, "setStartLocalRequest:", v32);

                      uint64_t v19 = v48;
                    }

                    else
                    {
LABEL_49:
                      -[AFRequestInfo setHandoffRequestData:](v23, "setHandoffRequestData:", v7);
                    }
                  }

                  id v15 = v51;
                }
              }
            }
          }
        }
      }
    }
  }

  return v23;
}

- (id)_newRequestDictionaryWithRequestInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = -[ADCompanionService _newRequestDictionary](self, "_newRequestDictionary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  if (v6) {
    [v5 setObject:v6 forKey:@"text"];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffRequestData]);
  if (v7) {
    [v5 setObject:v7 forKey:@"handoffRequestData"];
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffOriginDeviceName]);
  if (v8) {
    [v5 setObject:v8 forKey:@"handoffOriginDeviceName"];
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffURLString]);
  if (v9) {
    [v5 setObject:v9 forKey:@"handoffURLString"];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 turnIdentifier]);
  if (v10) {
    [v5 setObject:v10 forKey:@"handoffTurnIdentifier"];
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 handoffRequiresUserInteraction]));
  [v5 setObject:v11 forKey:@"handoffRequiresUserInteraction"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffNotification]);
  if (v12) {
    [v5 setObject:v12 forKey:@"handoffNotification"];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isSiriXRequest]));
  [v5 setObject:v13 forKey:@"isSiriXRequest"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isATVHandoff]));
  [v5 setObject:v14 forKey:@"isATVHandoff"];

  return v5;
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v12 = "-[ADCompanionService rapportLinkDidInterrupt:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10023ECB8;
  v8[3] = &unk_1004FD968;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v12 = "-[ADCompanionService rapportLinkDidInvalidate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10023EB10;
  v8[3] = &unk_1004FD968;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v9)
  {
    int v14 = 136315394;
    id v15 = "-[ADCompanionService rapportLink:didUpdateLocalDevice:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s companion service updated local device: %@",  (uint8_t *)&v14,  0x16u);
  }

  if (AFIsHorseman(v9, v10))
  {
    -[ADCompanionService _updateCompanionIdentifier](self, "_updateCompanionIdentifier");
    if (AFSupportsAirPlayEndpointRoute(-[ADCompanionService _updateMediaSystemState](self, "_updateMediaSystemState")))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest airplayRouteId](self->_cachedSharedData, "airplayRouteId"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaRouteIdentifier]);
    }
  }
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    unsigned int v10 = [v7 isPersonal];
    uint64_t v11 = @"standard";
    *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
    *(_DWORD *)__int16 v36 = 136315650;
    *(_WORD *)&v36[12] = 2112;
    if (v10) {
      uint64_t v11 = @"companion capable";
    }
    *(void *)&v36[14] = v11;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ device found: %@", v36, 0x20u);
  }

  if (self->_siriInfoDictNeedsInit) {
    -[ADCompanionService _updateSiriInfoDictionary](self, "_updateSiriInfoDictionary");
  }
  id v12 = -[ADCompanionService _updateAssistantIDMapForDevice:]( self,  "_updateAssistantIDMapForDevice:",  v7,  *(_OWORD *)v36);
  if (AFIsHorseman(v12, v13))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink localDevice](self->_clientLink, "localDevice"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 idsPersonalDeviceIdentifier]);
    unsigned int v17 = [v14 isEqualToString:v16];

    if (v17)
    {
      id v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v36 = 136315394;
        *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
        *(_WORD *)&v36[12] = 2112;
        *(void *)&v36[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s companion device found: %@", v36, 0x16u);
      }

      -[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]( self,  "_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:",  1LL);
    }

    if (-[ADCompanionService _isDevicePartOfCurrentMediaSystem:](self, "_isDevicePartOfCurrentMediaSystem:", v7))
    {
      uint64_t v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v36 = 136315394;
        *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
        *(_WORD *)&v36[12] = 2112;
        *(void *)&v36[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s media system device found: %@", v36, 0x16u);
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
      -[ADCompanionService setStereoPartnerIDSIdentifier:](self, "setStereoPartnerIDSIdentifier:", v20);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if (AFSupportsPlayThisOnThat(v21))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_ad_siriSharedDataProtobuf"));
    BOOL v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v36 = 136315394;
      *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
      *(_WORD *)&v36[12] = 2112;
      *(void *)&v36[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s siriInfo: %@", v36, 0x16u);
    }

    unsigned int v24 = [v22 isRemotePlaybackDevice];
    playbackDeviceIDs = self->_playbackDeviceIDs;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v26));
    id v28 = v27;
    if (v24)
    {

      if (!v28)
      {
        id v29 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v36 = 136315394;
          *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
          *(_WORD *)&v36[12] = 2112;
          *(void *)&v36[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s playback device found: %@", v36, 0x16u);
        }

        BOOL v30 = self->_playbackDeviceIDs;
        unsigned int v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, v32);

        -[ADCompanionService _updateHashedRouteIDForDevice:](self, "_updateHashedRouteIDForDevice:", v7);
LABEL_28:
        [v21 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
      }
    }

    else
    {

      if (v28)
      {
        uint64_t v33 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v36 = 136315394;
          *(void *)&void v36[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
          *(_WORD *)&v36[12] = 2112;
          *(void *)&v36[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s playback device lost: %@", v36, 0x16u);
        }

        id v34 = self->_playbackDeviceIDs;
        unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        -[NSMutableDictionary removeObjectForKey:](v34, "removeObjectForKey:", v35);

        goto LABEL_28;
      }
    }
  }

  [v21 postNotificationName:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315650;
    unsigned __int8 v35 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 2048;
    uint64_t v39 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s device updated: %@ with changes: %ld",  (uint8_t *)&v34,  0x20u);
  }

  if (self->_siriInfoDictNeedsInit) {
    -[ADCompanionService _updateSiriInfoDictionary](self, "_updateSiriInfoDictionary");
  }
  uint64_t v11 = AFSupportsPlayThisOnThat(-[ADCompanionService _updateAssistantIDMapForDevice:](self, "_updateAssistantIDMapForDevice:", v9));
  if ((a5 & 2) != 0 && (_DWORD)v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_ad_siriSharedDataProtobuf"));
    int v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v34 = 136315394;
      unsigned __int8 v35 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s siriInfo: %@", (uint8_t *)&v34, 0x16u);
    }

    unsigned int v15 = [v13 isRemotePlaybackDevice];
    playbackDeviceIDs = self->_playbackDeviceIDs;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v17));

    if (v15)
    {
      uint64_t v19 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v20 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v20)
        {
          int v34 = 136315394;
          unsigned __int8 v35 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
          __int16 v36 = 2112;
          id v37 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s playback device updated: %@",  (uint8_t *)&v34,  0x16u);
        }
      }

      else
      {
        if (v20)
        {
          int v34 = 136315394;
          unsigned __int8 v35 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
          __int16 v36 = 2112;
          id v37 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s playback device added: %@",  (uint8_t *)&v34,  0x16u);
        }

        unsigned int v24 = self->_playbackDeviceIDs;
        id v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v25, v26);
      }

      -[ADCompanionService _updateHashedRouteIDForDevice:](self, "_updateHashedRouteIDForDevice:", v9);
    }

    else
    {
      if (!v18)
      {
LABEL_22:

        goto LABEL_23;
      }

      uint64_t v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v34 = 136315394;
        unsigned __int8 v35 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
        __int16 v36 = 2112;
        id v37 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s playback device removed: %@",  (uint8_t *)&v34,  0x16u);
      }

      uint64_t v22 = self->_playbackDeviceIDs;
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      -[NSMutableDictionary removeObjectForKey:](v22, "removeObjectForKey:", v23);
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];

    goto LABEL_22;
  }

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  id v9 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((_DWORD)v9)
  {
    int v18 = 136315394;
    uint64_t v19 = "-[ADCompanionService rapportLink:didLoseDevice:]";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s device lost: %@", (uint8_t *)&v18, 0x16u);
  }

  if (self->_siriInfoDictNeedsInit) {
    id v9 = -[ADCompanionService _updateSiriInfoDictionary](self, "_updateSiriInfoDictionary");
  }
  if (AFIsHorseman(v9, v10)
    && -[ADCompanionService _isDevicePartOfCurrentMediaSystem:](self, "_isDevicePartOfCurrentMediaSystem:", v7))
  {
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[ADCompanionService rapportLink:didLoseDevice:]";
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s media system device lost: %@",  (uint8_t *)&v18,  0x16u);
    }

    -[ADCompanionService setStereoPartnerIDSIdentifier:](self, "setStereoPartnerIDSIdentifier:", 0LL);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if (AFSupportsPlayThisOnThat(v12))
  {
    playbackDeviceIDs = self->_playbackDeviceIDs;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](playbackDeviceIDs, "objectForKey:", v14));

    if (v15)
    {
      __int16 v16 = self->_playbackDeviceIDs;
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

      [v12 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
    }
  }

  [v12 postNotificationName:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];
}

- (BOOL)doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    char v20 = 0;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = v4;
          if (v10)
          {
            [v10 operatingSystemVersion];
            uint64_t v13 = v24;
            [v10 operatingSystemVersion];
            uint64_t v14 = v23;
            [v10 operatingSystemVersion];
            uint64_t v15 = v22;
          }

          else
          {
            uint64_t v15 = 0LL;
            uint64_t v14 = 0LL;
            uint64_t v13 = 0LL;
            uint64_t v24 = 0LL;
            uint64_t v23 = 0LL;
            uint64_t v22 = 0LL;
          }

          *(_DWORD *)__int128 buf = 136316162;
          BOOL v30 = "-[ADCompanionService doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:]";
          __int16 v31 = 2112;
          unsigned int v32 = v10;
          __int16 v33 = 2048;
          uint64_t v34 = v13;
          __int16 v35 = 2048;
          uint64_t v36 = v14;
          __int16 v37 = 2048;
          uint64_t v38 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s DEVICE: %@, OS major version %ld, OS minor version %ld, OS patch version %ld,",  buf,  0x34u);
          id v4 = v12;
        }

        if ([v10 isOwner]
          && [v10 isDiscoveredOverInfraWifi]
          && [v10 hasIOS])
        {
          if (v4)
          {
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceIdentifier]);
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceUniqueIdentifier]);
            unsigned int v18 = [v16 isEqualToString:v17] ^ 1;
          }

          else
          {
            LOBYTE(v18) = 1;
          }

          v20 |= v18;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
    }

    while (v7);
  }

  else
  {
    char v20 = 0;
  }

  return v20 & 1;
}

- (void)invalidateClientAWDLTransportLink
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[ADCompanionService invalidateClientAWDLTransportLink]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  clientAWDLTransportLink = self->_clientAWDLTransportLink;
  if (clientAWDLTransportLink)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
      int v9 = 136315394;
      uint64_t v10 = "-[ADCompanionService invalidateClientAWDLTransportLink]";
      __int16 v11 = 2112;
      id v12 = clientAWDLTransportLinkDestinationId;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s _clientAWDLTransportLink exists for %@. Invalidating it.",  (uint8_t *)&v9,  0x16u);
      clientAWDLTransportLink = self->_clientAWDLTransportLink;
    }

    -[ADRapportLink removeListener:](clientAWDLTransportLink, "removeListener:", self);
    -[ADRapportLink invalidate](self->_clientAWDLTransportLink, "invalidate");
    id v7 = self->_clientAWDLTransportLink;
    self->_clientAWDLTransportLink = 0LL;
  }

  uint64_t v8 = self->_clientAWDLTransportLinkDestinationId;
  self->_clientAWDLTransportLinkDestinationId = 0LL;

  -[ADCompanionService _cancelAWDLClientLinkTimer](self, "_cancelAWDLClientLinkTimer");
}

- (void)_scheduleOrExtendAWDLClientLinkTimer
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v12 = "-[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  awdlClientLinkTimer = self->_awdlClientLinkTimer;
  if (awdlClientLinkTimer)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v12 = "-[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Extending time out.", buf, 0xCu);
      awdlClientLinkTimer = self->_awdlClientLinkTimer;
    }

    -[AFWatchdogTimer reset](awdlClientLinkTimer, "reset");
  }

  id v6 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  serialQueue = self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10023EA60;
  v10[3] = &unk_1004FD940;
  void v10[4] = self;
  uint64_t v8 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v6,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  serialQueue,  v10,  45.0);
  int v9 = self->_awdlClientLinkTimer;
  self->_awdlClientLinkTimer = v8;

  -[AFWatchdogTimer start](self->_awdlClientLinkTimer, "start");
}

- (void)_cancelAWDLClientLinkTimer
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCompanionService _cancelAWDLClientLinkTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  awdlClientLinkTimer = self->_awdlClientLinkTimer;
  if (awdlClientLinkTimer)
  {
    -[AFWatchdogTimer cancel](awdlClientLinkTimer, "cancel");
    id v5 = self->_awdlClientLinkTimer;
    self->_awdlClientLinkTimer = 0LL;
  }

- (id)getDevicesDiscoveredTypeCountForUserID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v27 = "-[ADCompanionService getDevicesDiscoveredTypeCountForUserID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADCompanionService getDevicesDiscoveredNearbyForUserID:]( self,  "getDevicesDiscoveredNearbyForUserID:",  v4));
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        int64_t v12 = -[ADCompanionService deviceType:]( self,  "deviceType:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        if (v14)
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v15));

          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v16 integerValue] + 1));
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, v18);

          uint64_t v15 = v16;
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1005136A8, v15);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v6));
  return v19;
}

- (id)getDevicesDiscoveredNearbyForUserID:(id)a3
{
  id v25 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_clientLink, "activeDevices"));
  id v5 = [v4 copy];

  if (!v5)
  {
    id v21 = &__NSArray0__struct;
    goto LABEL_24;
  }

  __int128 v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  group = dispatch_group_create();
  queue = dispatch_queue_create("ADInstrumentationDeviceDiscoveryQueue", 0LL);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v23 = v5;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v7 = *(void *)v53;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v53 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionService getUserIDForDevice:](self, "getUserIDForDevice:", v9, v23));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceIdentifier]);
      if (v11)
      {
        uint64_t v32 = 0LL;
        __int16 v33 = &v32;
        uint64_t v34 = 0x2020000000LL;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10023E870;
        block[3] = &unk_1004FBE80;
        __int16 v51 = &v32;
        int64_t v12 = v27;
        unsigned int v49 = v12;
        id v13 = v11;
        id v50 = v13;
        dispatch_sync(queue, block);
        if (!*((_BYTE *)v33 + 24))
        {
          unsigned int v14 = [v9 isDiscoveredOverInfraWifi];
          if (v10) {
            unsigned int v15 = v14;
          }
          else {
            unsigned int v15 = 0;
          }
          if (v15 == 1 && [v25 isEqualToString:v10])
          {
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_10023E8B0;
            v45[3] = &unk_1004FD4C0;
            unsigned int v46 = v12;
            v47[0] = v13;
            v47[1] = v9;
            dispatch_async(queue, v45);
            __int16 v16 = (id *)v47;
            unsigned int v17 = (id *)&v46;
            goto LABEL_18;
          }

          if ([v9 hasWatchOS] && objc_msgSend(v9, "isOwner"))
          {
            dispatch_group_enter(group);
            unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472LL;
            v38[2] = sub_10023E8C0;
            v38[3] = &unk_1004F7710;
            id v39 = v25;
            id v40 = queue;
            id v41 = v12;
            id v42 = v13;
            id v43 = v9;
            id v44 = group;
            [v18 showPrimaryUserSharedUserIDWithCompletion:v38];

            __int16 v16 = (id *)&v40;
            unsigned int v17 = &v39;
LABEL_18:
          }
        }

        _Block_object_dispose(&v32, 8);
      }
    }

    id v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  }

  while (v6);
LABEL_22:

  dispatch_time_t v19 = dispatch_time(0LL, 1000000000LL);
  dispatch_group_wait(group, v19);
  uint64_t v32 = 0LL;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  __int16 v35 = sub_10023E960;
  uint64_t v36 = sub_10023E970;
  id v37 = 0LL;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10023E978;
  v29[3] = &unk_1004FCDB0;
  BOOL v30 = v27;
  __int16 v31 = &v32;
  char v20 = v27;
  dispatch_sync(queue, v29);
  id v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  id v5 = v23;
LABEL_24:

  return v21;
}

- (id)getUserIDForDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 siriInfo]);
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"peerData"]);
    if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"sharedUserIdentifier"]);
      id v8 = v7;
      if (v7 && [v7 length])
      {
        id v9 = v8;
      }

      else
      {
        int64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315138;
          unsigned int v15 = "-[ADCompanionService getUserIDForDevice:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s deviceSiriInfo sharedUserIdentifier nil",  (uint8_t *)&v14,  0xCu);
        }

        id v9 = 0LL;
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        unsigned int v15 = "-[ADCompanionService getUserIDForDevice:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s deviceSiriInfo peerData nil",  (uint8_t *)&v14,  0xCu);
      }

      id v9 = 0LL;
    }
  }

  else
  {
    __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      unsigned int v15 = "-[ADCompanionService getUserIDForDevice:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s deviceSiriInfo nil",  (uint8_t *)&v14,  0xCu);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (int64_t)deviceType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "model") & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
      if ([v7 hasPrefix:@"iphone"])
      {
        int64_t v8 = 0LL;
      }

      else if ([v7 hasPrefix:@"ipad"])
      {
        int64_t v8 = 1LL;
      }

      else if ([v7 hasPrefix:@"watch"])
      {
        int64_t v8 = 2LL;
      }

      else if ([v7 hasPrefix:@"macbook"])
      {
        int64_t v8 = 3LL;
      }

      else if ([v7 hasPrefix:@"macstudio"])
      {
        int64_t v8 = 4LL;
      }

      else if ([v7 hasPrefix:@"imac"])
      {
        int64_t v8 = 5LL;
      }

      else
      {
        int64_t v8 = 6LL;
      }
    }

    else
    {
      int64_t v8 = 6LL;
    }
  }

  else
  {
    int64_t v8 = 6LL;
  }

  return v8;
}

- (OS_dispatch_queue)instrumentationQueue
{
  return self->_instrumentationQueue;
}

- (void)setInstrumentationQueue:(id)a3
{
}

- (NSMutableDictionary)timerInfo
{
  return self->_timerInfo;
}

- (void)setTimerInfo:(id)a3
{
}

- (NSMutableDictionary)incomingRequestLog
{
  return self->_incomingRequestLog;
}

- (void)setIncomingRequestLog:(id)a3
{
}

- (NSMutableDictionary)deviceUpdateLog
{
  return self->_deviceUpdateLog;
}

- (void)setDeviceUpdateLog:(id)a3
{
}

- (NSString)stereoPartnerIDSIdentifier
{
  return self->_stereoPartnerIDSIdentifier;
}

- (NSMapTable)handlerForMessageType
{
  return self->_handlerForMessageType;
}

- (void)setHandlerForMessageType:(id)a3
{
}

- (NSMutableDictionary)playbackDeviceIDs
{
  return self->_playbackDeviceIDs;
}

- (void)setPlaybackDeviceIDs:(id)a3
{
}

- (_ADPBDeviceSetDataRequest)cachedSharedData
{
  return self->_cachedSharedData;
}

- (void)setCachedSharedData:(id)a3
{
}

- (NSString)cachedStoreFrontIdentifier
{
  return self->_cachedStoreFrontIdentifier;
}

- (void)setCachedStoreFrontIdentifier:(id)a3
{
}

- (NSDictionary)cachedUTSInfo
{
  return self->_cachedUTSInfo;
}

- (void)setCachedUTSInfo:(id)a3
{
}

- (NSMutableSet)waitContexts
{
  return self->_waitContexts;
}

- (void)setWaitContexts:(id)a3
{
}

- (NSMutableDictionary)intermediateMessageIDs
{
  return self->_intermediateMessageIDs;
}

- (void)setIntermediateMessageIDs:(id)a3
{
}

- (NSMutableSet)discoveryContextLoggedForExecutionIds
{
  return self->_discoveryContextLoggedForExecutionIds;
}

- (void)setDiscoveryContextLoggedForExecutionIds:(id)a3
{
}

- (ADRapportLink)clientAWDLTransportLink
{
  return self->_clientAWDLTransportLink;
}

- (void)setClientAWDLTransportLink:(id)a3
{
}

- (NSString)clientAWDLTransportLinkDestinationId
{
  return self->_clientAWDLTransportLinkDestinationId;
}

- (void)setClientAWDLTransportLinkDestinationId:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (ADRapportLink)clientLink
{
  return self->_clientLink;
}

- (void)setClientLink:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (ADCompanionService)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100246588;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100578210 != -1) {
    dispatch_once(&qword_100578210, block);
  }
  return (ADCompanionService *)(id)qword_100578208;
}

@end