@interface ADDeviceResolutionServiceListener
- (ADDeviceResolutionServiceListener)initWithInstanceContext:(id)a3 deviceCircleManager:(id)a4;
- (BOOL)_peerIsPairedPhone:(id)a3;
- (BOOL)_peerIsPairedWatch:(id)a3;
- (BOOL)_shouldLogAFAnalyticsCrossDeviceEvent:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (double)_generalizeTimeIntervalsForPrivacy:(double)a3;
- (id)_crossDeviceCommandExecutionEndedEvent:(int)a3 actionResult:(int)a4 halId:(id)a5 contextProximityPairs:(id)a6 homeKitTarget:(int)a7;
- (id)_crossDeviceCommandExecutionFailedEvent:(int)a3 action:(int)a4 halId:(id)a5;
- (id)_crossDeviceCommandExecutionStartedEvent:(int)a3 halId:(id)a4;
- (id)_devicesMatchingDescriptions:(id)a3 capabilitiesTuples:(id)a4 proximityMap:(id)a5;
- (id)_halDeviceFromContext:(id)a3 proximity:(int64_t)a4;
- (id)_resultStringFromHALAction:(int)a3 actionResult:(int)a4;
- (int)_halActionFromAction:(id)a3;
- (int)_halActionResultFromActionResult:(id)a3;
- (int)_halDeviceFamilyFromInterfaceIdiom:(id)a3;
- (int)_halDevicePowerStateFromSystemStateSnapshot:(id)a3;
- (int)_halDeviceProximityFromProximity:(int64_t)a3;
- (int)_halHomeKitTargetFromTarget:(id)a3;
- (int)_halMediaPlayerStateFromPlaybackState:(int64_t)a3;
- (void)_logAFAnalyticsCrossDeviceCommandHandledEventWithResult:(int)a3 halActionResult:(int)a4 contextProximityPairs:(id)a5;
- (void)_pairedCompanionDeviceFromSharedDataWithCompletion:(id)a3;
- (void)getAllReachableDevicesWithCompletion:(id)a3;
- (void)getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:(id)a3 serviceContexts:(id)a4 completion:(id)a5;
- (void)getDeviceContextAndProximityMapIncludingAllReachableDevice:(BOOL)a3 completion:(id)a4;
- (void)getDevicesMatchingCapabilityDescriptions:(id)a3 completion:(id)a4;
- (void)getSourceDeviceForContextWithIdentifiers:(id)a3 completion:(id)a4;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 actionResult:(id)a5 homeKitTarget:(id)a6 contextProximityPairs:(id)a7;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 contextProximityPairs:(id)a5;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 homeKitTarget:(id)a5 contextProximityPairs:(id)a6;
- (void)logCrossDeviceCommandFailed:(id)a3 action:(id)a4 reason:(id)a5;
- (void)logCrossDeviceCommandStarted:(id)a3 action:(id)a4;
- (void)logCrossDeviceRequestLink:(id)a3 halId:(id)a4;
- (void)logCrossDeviceRequestLink:(id)a3 halRequestId:(id)a4;
- (void)meDeviceWithCompletion:(id)a3;
- (void)pairedCompanionDeviceWithCompletion:(id)a3;
- (void)setupListener;
@end

@implementation ADDeviceResolutionServiceListener

- (ADDeviceResolutionServiceListener)initWithInstanceContext:(id)a3 deviceCircleManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADDeviceResolutionServiceListener;
  v8 = -[ADDeviceResolutionServiceListener init](&v21, "init");
  if (v8)
  {
    if (v6) {
      v9 = (AFInstanceContext *)v6;
    }
    else {
      v9 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    instanceContext = v8->_instanceContext;
    v8->_instanceContext = v9;

    objc_storeStrong((id *)&v8->_deviceCircleManager, a4);
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v19 = v8->_instanceContext;
      deviceCircleManager = v8->_deviceCircleManager;
      *(_DWORD *)buf = 136315650;
      v23 = "-[ADDeviceResolutionServiceListener initWithInstanceContext:deviceCircleManager:]";
      __int16 v24 = 2112;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = deviceCircleManager;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s instanceContext = %@, deviceCircleManager = %@",  buf,  0x20u);
    }

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);

    dispatch_queue_t v16 = dispatch_queue_create("ADDeviceResolutionServiceListener", v15);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v16;

    -[ADDeviceResolutionServiceListener setupListener](v8, "setupListener");
  }

  return v8;
}

- (void)setupListener
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002BC318;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SVDDeviceResolutionXPCInterface entitlement]( &OBJC_CLASS___SVDDeviceResolutionXPCInterface,  "entitlement"));
  char HasEntitlement = AFConnectionHasEntitlement(v5, v6);

  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v8 = [v5 processIdentifier];
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADDeviceResolutionServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s %@ Device Resolution Service Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SVDDeviceResolutionXPCInterface xpcInterface]( &OBJC_CLASS___SVDDeviceResolutionXPCInterface,  "xpcInterface"));
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:self];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002BC1A8;
    v15[3] = &unk_1004F9D00;
    unsigned int v16 = v8;
    [v5 setInvalidationHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002BC260;
    v13[3] = &unk_1004F9D00;
    unsigned int v14 = v8;
    [v5 setInterruptionHandler:v13];
    [v5 resume];
  }

  else
  {
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADDeviceResolutionServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s %@ Device Resolution Service Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)logCrossDeviceRequestLink:(id)a3 halRequestId:(id)a4
{
}

- (void)logCrossDeviceRequestLink:(id)a3 halId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    uint64_t v7 = ADCreateRequestLinkInfo(v5, 1LL);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = ADCreateRequestLinkInfo(v6, 17LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    ADEmitRequestLinkEventMessage(v8, v10);
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      unsigned int v14 = "-[ADDeviceResolutionServiceListener logCrossDeviceRequestLink:halId:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #hal Emitted RequestLink event to sharedStream",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    dispatch_queue_attr_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      unsigned int v14 = "-[ADDeviceResolutionServiceListener logCrossDeviceRequestLink:halId:]";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s #hal RequestId %@ or halIdentifier %@ should not be nil.",  (uint8_t *)&v13,  0x20u);
    }
  }
}

- (void)logCrossDeviceCommandStarted:(id)a3 action:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceResolutionServiceListener _crossDeviceCommandExecutionStartedEvent:halId:]( self,  "_crossDeviceCommandExecutionStartedEvent:halId:",  -[ADDeviceResolutionServiceListener _halActionFromAction:](self, "_halActionFromAction:", a4),  v6));

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v8 emitMessage:v7];

  uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandStarted:action:]";
    __int16 v12 = 2112;
    int v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s #hal Emitted commandStarted event %@ to sharedStream",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 contextProximityPairs:(id)a5
{
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 homeKitTarget:(id)a5 contextProximityPairs:(id)a6
{
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 actionResult:(id)a5 homeKitTarget:(id)a6 contextProximityPairs:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = -[ADDeviceResolutionServiceListener _halActionFromAction:](self, "_halActionFromAction:", v15);
  uint64_t v18 = -[ADDeviceResolutionServiceListener _halActionResultFromActionResult:]( self,  "_halActionResultFromActionResult:",  v14);

  uint64_t v19 = -[ADDeviceResolutionServiceListener _halHomeKitTargetFromTarget:](self, "_halHomeKitTargetFromTarget:", v13);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceResolutionServiceListener _crossDeviceCommandExecutionEndedEvent:actionResult:halId:contextProximityPairs:homeKitTarget:]( self,  "_crossDeviceCommandExecutionEndedEvent:actionResult:halId:contextProximityPairs:homeKitTarget:",  v17,  v18,  v16,  v12,  v19));

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v21 emitMessage:v20];

  unsigned int v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    v25 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandEnded:action:actionResult:homeKitTarget:contextProximityPairs:]";
    __int16 v26 = 2112;
    v27 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s #hal Emitted commandEnded %@ to sharedStream",  (uint8_t *)&v24,  0x16u);
  }

  unsigned int v23 = -[ADDeviceResolutionServiceListener _shouldLogAFAnalyticsCrossDeviceEvent:]( self,  "_shouldLogAFAnalyticsCrossDeviceEvent:",  v15);

  if (v23) {
    -[ADDeviceResolutionServiceListener _logAFAnalyticsCrossDeviceCommandHandledEventWithResult:halActionResult:contextProximityPairs:]( self,  "_logAFAnalyticsCrossDeviceCommandHandledEventWithResult:halActionResult:contextProximityPairs:",  v17,  v18,  v12);
  }
}

- (BOOL)_shouldLogAFAnalyticsCrossDeviceEvent:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 integerValue];
  return (v3 < 0x16) & (0x2FC01Fu >> v3);
}

- (void)_logAFAnalyticsCrossDeviceCommandHandledEventWithResult:(int)a3 halActionResult:(int)a4 contextProximityPairs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceResolutionServiceListener _resultStringFromHALAction:actionResult:]( self,  "_resultStringFromHALAction:actionResult:",  v6,  v5));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 productType]);

  id v15 = [v12 integerValue];
  if (v14) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
  }
  else {
    id v16 = 0LL;
  }
  uint64_t v17 = AFAnalyticsContextCreateForCrossDeviceCommandHandled(v16, v15, v9);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v19 logEventWithType:4560 context:v18];

  id v20 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315394;
    unsigned int v22 = "-[ADDeviceResolutionServiceListener _logAFAnalyticsCrossDeviceCommandHandledEventWithResult:halActionResult:co"
          "ntextProximityPairs:]";
    __int16 v23 = 2112;
    int v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s #hal Emitted AFAnalyticsEventTypeDaemonContextCrossDeviceCommandHandled event with context: %@",  (uint8_t *)&v21,  0x16u);
  }
}

- (void)logCrossDeviceCommandFailed:(id)a3 action:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = -[ADDeviceResolutionServiceListener _halActionFromAction:](self, "_halActionFromAction:", a4);
  id v11 = [v8 integerValue];

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADDeviceResolutionServiceListener _crossDeviceCommandExecutionFailedEvent:action:halId:]( self,  "_crossDeviceCommandExecutionFailedEvent:action:halId:",  v11,  v10,  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v13 emitMessage:v12];

  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    id v16 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandFailed:action:reason:]";
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s #hal Emitted commandFailed %@ to sharedStream",  (uint8_t *)&v15,  0x16u);
  }
}

- (void)getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:(id)a3 serviceContexts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v22 = "-[ADDeviceResolutionServiceListener getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:serviceConte"
          "xts:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002BBF4C;
  v16[3] = &unk_1004F9DA8;
  id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "af_mappedArray:", &stru_1004F9D40));
  id v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "af_mappedArray:", &stru_1004F9D80));
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v20 = v10;
  id v12 = v10;
  id v13 = v19;
  id v14 = v18;
  id v15 = v17;
  -[ADDeviceResolutionServiceListener getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:]( self,  "getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:",  1LL,  v16);
}

- (void)getAllReachableDevicesWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002BBDB4;
  v5[3] = &unk_1004F9E10;
  id v6 = a3;
  id v4 = v6;
  -[ADDeviceResolutionServiceListener getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:]( self,  "getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:",  1LL,  v5);
}

- (void)getSourceDeviceForContextWithIdentifiers:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002BBB2C;
  v8[3] = &unk_1004F9E38;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[ADDeviceResolutionServiceListener getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:]( self,  "getDeviceContextAndProximityMapIncludingAllReachableDevice:completion:",  0LL,  v8);
}

- (void)getDevicesMatchingCapabilityDescriptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    *(_DWORD *)buf = 136315138;
    int v24 = "-[ADDeviceResolutionServiceListener getDevicesMatchingCapabilityDescriptions:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }

  if (AFSupportsHALOnDemandRapportConnection(v9, v10))
  {
    deviceCircleManager = self->_deviceCircleManager;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002BB8F4;
    v20[3] = &unk_1004FC770;
    v20[4] = self;
    id v21 = v6;
    id v22 = v7;
    id v12 = v7;
    id v13 = v6;
    -[ADDeviceCircleManager getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:]( deviceCircleManager,  "getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:",  v20);
  }

  else
  {
    uint64_t v14 = SVDCapabilityDescriptionsGroupedByCapabilityKey(v6);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    id v15 = self->_deviceCircleManager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002BBA18;
    v17[3] = &unk_1004FC770;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v16 = v7;
    id v12 = v6;
    -[ADDeviceCircleManager getCapabilitiesForReachableDevicesWithCompletion:]( v15,  "getCapabilitiesForReachableDevicesWithCompletion:",  v17);
  }
}

- (id)_devicesMatchingDescriptions:(id)a3 capabilitiesTuples:(id)a4 proximityMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  __int16 v23 = v7;
  uint64_t v9 = SVDCapabilityDescriptionsGroupedByCapabilityKey(v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v24 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 content]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "af_lenientMappedDictionary:", &stru_1004F9E78));
        uint64_t v31 = 0LL;
        v32 = &v31;
        uint64_t v33 = 0x2020000000LL;
        char v34 = 1;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_1002BB7B0;
        v28[3] = &unk_1004F9EA0;
        id v16 = v15;
        id v29 = v16;
        v30 = &v31;
        [v27 enumerateKeysAndObjectsUsingBlock:v28];
        if (*((_BYTE *)v32 + 24))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 info]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assistantIdentifier]);
          if (v18) {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v18]);
          }
          else {
            id v19 = 0LL;
          }
          id v20 = sub_1002BAF88(v17, (uint64_t)[v19 integerValue]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21) {
            -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v14, v21);
          }
        }

        _Block_object_dispose(&v31, 8);
      }

      id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v10);
  }

  return v24;
}

- (void)pairedCompanionDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[ADDeviceResolutionServiceListener pairedCompanionDeviceWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_7;
    }
  }

  else if (!v4)
  {
    goto LABEL_7;
  }

  uint64_t v6 = AFIsIOS();
  if ((v6 & 1) != 0 || AFIsNano(v6))
  {
    deviceCircleManager = self->_deviceCircleManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002BB538;
    v8[3] = &unk_1004F9EF0;
    void v8[4] = self;
    id v9 = v4;
    -[ADDeviceCircleManager getManagedLocalAndRemotePeerInfoWithCompletion:]( deviceCircleManager,  "getManagedLocalAndRemotePeerInfoWithCompletion:",  v8);
  }

  else
  {
    -[ADDeviceResolutionServiceListener _pairedCompanionDeviceFromSharedDataWithCompletion:]( self,  "_pairedCompanionDeviceFromSharedDataWithCompletion:",  v4);
  }

- (void)_pairedCompanionDeviceFromSharedDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADDeviceResolutionServiceListener _pairedCompanionDeviceFromSharedDataWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v3)
  {
LABEL_3:
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _sharedDataService]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002BB2F8;
    v7[3] = &unk_1004F9F40;
    id v8 = v3;
    [v6 getSharedDataFromPeerUseCache:1 completion:v7];
  }

- (void)meDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADDeviceResolutionServiceListener meDeviceWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    deviceCircleManager = self->_deviceCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002BADA8;
    v7[3] = &unk_1004F9F90;
    id v8 = v4;
    -[ADDeviceCircleManager getManagedLocalAndRemotePeerInfoWithCompletion:]( deviceCircleManager,  "getManagedLocalAndRemotePeerInfoWithCompletion:",  v7);
  }

- (BOOL)_peerIsPairedWatch:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rapportEffectiveIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Watch"];

  return v4;
}

- (BOOL)_peerIsPairedPhone:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rapportEffectiveIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Phone"];

  return v4;
}

- (void)getDeviceContextAndProximityMapIncludingAllReachableDevice:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002BACC0;
    v7[3] = &unk_1004F9FB8;
    BOOL v9 = a3;
    id v8 = v5;
    [v6 getCurrentContextSnapshotWithCompletion:v7];
  }
}

- (void).cxx_destruct
{
}

- (id)_resultStringFromHALAction:(int)a3 actionResult:(int)a4
{
  switch(a3)
  {
    case 0:
      id result = @"unknown";
      break;
    case 1:
      id result = @"appLaunch-Launch";
      break;
    case 2:
      id result = @"appLaunch-DeviceDisambiguation";
      break;
    case 3:
      id result = @"media-PlayContent";
      break;
    case 4:
      id result = @"media-DeviceDisambiguation";
      break;
    case 5:
      id result = @"resumeMedia";
      break;
    case 6:
      id result = @"skipContent";
      break;
    case 7:
      id result = @"skipTime";
      break;
    case 8:
      id result = @"seekTime";
      break;
    case 9:
      id result = @"setRepeatState";
      break;
    case 10:
      id result = @"setSubtitleState";
      break;
    case 11:
      id result = @"setShuffleState";
      break;
    case 12:
      id result = @"setAudioLanguage";
      break;
    case 13:
      id result = @"whatDidTheySay";
      break;
    case 14:
      id result = @"QuickStop.QuickStopCompleted-confirmation";
      break;
    case 15:
      id result = off_1004FB720[a4];
      break;
    case 16:
      id result = @"SAAlarmDismiss.CommandSucceeded";
      break;
    case 17:
      id result = @"SAAlarmSnooze.CommandSucceeded";
      break;
    case 18:
      id result = @"QuickStop.QuickStopCompleted-Timer";
      break;
    case 19:
      id result = @"SATimerDismiss.CommandSucceeded";
      break;
    case 20:
      id result = @"pauseMedia";
      break;
    case 21:
      id result = @"QuickStop.announcement";
      break;
    default:
LABEL_11:
      id result = 0LL;
      break;
  }

  return result;
}

- (int)_halActionResultFromActionResult:(id)a3
{
  id v3 = (char *)[a3 integerValue];
  return (int)v3;
}

- (int)_halActionFromAction:(id)a3
{
  id v3 = (char *)[a3 integerValue];
  return (int)v3;
}

- (int)_halHomeKitTargetFromTarget:(id)a3
{
  id v3 = (char *)[a3 integerValue];
  return (int)v3;
}

- (id)_crossDeviceCommandExecutionStartedEvent:(int)a3 halId:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v6 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionStarted);
  id v7 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionContext);
  [v7 setStartedOrChanged:v6];
  [v5 setCrossDeviceCommandContext:v7];
  id v8 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  if ([v4 length]) {
    BOOL v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
  }
  else {
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
  id v10 = v9;
  id v11 = [[SISchemaUUID alloc] initWithNSUUID:v9];
  [v8 setHalId:v11];

  [v5 setEventMetadata:v8];
  return v5;
}

- (id)_crossDeviceCommandExecutionFailedEvent:(int)a3 action:(int)a4 halId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionFailed);
  [v8 setReason:v6];
  [v8 setAction:v5];
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v10 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionContext);
  [v10 setFailed:v8];
  [v9 setCrossDeviceCommandContext:v10];
  id v11 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  if ([v7 length]) {
    id v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
  }
  else {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
  id v13 = v12;
  id v14 = [[SISchemaUUID alloc] initWithNSUUID:v12];
  [v11 setHalId:v14];

  [v9 setEventMetadata:v11];
  return v9;
}

- (id)_crossDeviceCommandExecutionEndedEvent:(int)a3 actionResult:(int)a4 halId:(id)a5 contextProximityPairs:(id)a6 homeKitTarget:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionEnded);
  [v14 setAction:v10];
  if ((_DWORD)v9) {
    [v14 setActionResult:v9];
  }
  [v14 setHomeKitTarget:v7];
  id v15 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v16 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALCrossDeviceCommandExecutionContext);
  [v16 setEnded:v14];
  [v15 setCrossDeviceCommandContext:v16];
  id v17 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  if ([v12 length]) {
    id v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v12);
  }
  else {
    id v18 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
  id v19 = v18;
  id v20 = [[SISchemaUUID alloc] initWithNSUUID:v18];
  [v17 setHalId:v20];

  [v15 setEventMetadata:v17];
  int v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  __int16 v26 = sub_1002FE50C;
  v27 = &unk_1004FB6D8;
  v28 = self;
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v21 = v29;
  [v13 enumerateKeysAndObjectsUsingBlock:&v24];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v21, v24, v25, v26, v27, v28));
  [v14 setSelecteds:v22];

  return v15;
}

- (id)_halDeviceFromContext:(id)a3 proximity:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALDevice);
  objc_msgSend( v7,  "setDeviceProximity:",  -[ADDeviceResolutionServiceListener _halDeviceProximityFromProximity:]( self,  "_halDeviceProximityFromProximity:",  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 buildVersion]);
  [v7 setSystemBuild:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 userInterfaceIdiom]);
  objc_msgSend( v7,  "setDeviceFamily:",  -[ADDeviceResolutionServiceListener _halDeviceFamilyFromInterfaceIdiom:]( self,  "_halDeviceFamilyFromInterfaceIdiom:",  v10));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackStateSnapshot]);
  if (v11)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALMediaPlayerContext);
    objc_msgSend( v12,  "setState:",  -[ADDeviceResolutionServiceListener _halMediaPlayerStateFromPlaybackState:]( self,  "_halMediaPlayerStateFromPlaybackState:",  objc_msgSend(v11, "playbackState")));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaType]);
    unsigned __int8 v14 = [v13 isEqualToString:kMRMediaRemoteMediaTypeMusic];

    if ((v14 & 1) != 0)
    {
      uint64_t v15 = 10LL;
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaType]);
      unsigned __int8 v17 = [v16 isEqualToString:kMRMediaRemoteNowPlayingInfoTypeVideo];

      if ((v17 & 1) != 0)
      {
        uint64_t v15 = 28LL;
      }

      else
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaType]);
        unsigned __int8 v19 = [v18 isEqualToString:kMRMediaRemoteMediaTypePodcast];

        if ((v19 & 1) != 0)
        {
          uint64_t v15 = 16LL;
        }

        else
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaType]);
          unsigned __int8 v21 = [v20 isEqualToString:kMRMediaRemoteMediaTypeAudioBook];

          if ((v21 & 1) != 0)
          {
            uint64_t v15 = 3LL;
          }

          else
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaType]);
            unsigned int v23 = [v22 isEqualToString:kMRMediaRemoteMediaTypeITunesU];

            if (v23) {
              uint64_t v15 = 8LL;
            }
            else {
              uint64_t v15 = 0LL;
            }
          }
        }
      }
    }

    [v12 setType:v15];
    if ([v12 state] == 1)
    {
      uint64_t v24 = 0LL;
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingTimestamp]);

      if (!v25)
      {
LABEL_18:
        [v7 setMediaPlayerContext:v12];

        goto LABEL_19;
      }

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingTimestamp]);
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;

      -[ADDeviceResolutionServiceListener _generalizeTimeIntervalsForPrivacy:]( self,  "_generalizeTimeIntervalsForPrivacy:",  v29);
      uint64_t v24 = v30;
    }

    [v12 setTimeSinceLastMediaPlaybackInSeconds:v24];
    goto LABEL_18;
  }

- (double)_generalizeTimeIntervalsForPrivacy:(double)a3
{
  return fmin(round(a3 / 5.0) * 5.0, 3600.0);
}

- (int)_halDeviceProximityFromProximity:(int64_t)a3
{
  if (a3 == 4000) {
    int v3 = 1;
  }
  else {
    int v3 = 4;
  }
  if (a3 == 3000) {
    int v4 = 2;
  }
  else {
    int v4 = v3;
  }
  if (a3 == 2000) {
    int v5 = 3;
  }
  else {
    int v5 = 4;
  }
  if (!a3) {
    int v5 = 0;
  }
  if (a3 <= 2999) {
    return v5;
  }
  else {
    return v4;
  }
}

- (int)_halMediaPlayerStateFromPlaybackState:(int64_t)a3
{
  else {
    return dword_1003CA1EC[a3];
  }
}

- (int)_halDeviceFamilyFromInterfaceIdiom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAUserInterfaceIdiomPHONEValue])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:SAUserInterfaceIdiomPADValue])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:SAUserInterfaceIdiomCAMEOValue])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:SAUserInterfaceIdiomHORSEMANValue])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:SAUserInterfaceIdiomZEUSValue])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:SAUserInterfaceIdiomWATCHValue])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)_halDevicePowerStateFromSystemStateSnapshot:(id)a3
{
  id v3 = [a3 sleepState];
  else {
    return 0;
  }
}

@end