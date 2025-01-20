@interface NISession
+ (BOOL)_supportedPlatform:(id)a3;
+ (BOOL)isSupported;
+ (NIInternalDeviceCapability)internalDeviceCapabilities;
+ (NSArray)activelyInteractingDiscoveryTokens;
+ (NSArray)interactableDiscoveryTokens;
+ (NSDictionary)cachedPlatformCapabilities;
+ (id)_localDeviceLogger;
+ (id)deviceCapabilities;
+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4;
+ (id)generateFindingDiscoveryToken;
+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3;
+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3;
+ (id)localDevicePrintableState;
+ (id)observerSession;
+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4;
+ (id)setLocalDeviceDebugParameters:(id)a3;
+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3;
+ (void)_queryAndCacheCapabilities;
+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3;
+ (void)getAsyncInteractableDiscoveryTokens:(id)a3;
+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4;
+ (void)setCachedPlatformCapabilities:(id)a3;
- (BOOL)_isInternalClient;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedDistanceMeasurementAllowed;
- (BOOL)isPreciseRangingAllowed;
- (BOOL)isRangingLimitExceeded;
- (NIAcwgEventNotifier)acwgEventNotifier;
- (NICarKeyEventNotifier)carKeyEventNotifier;
- (NIConfiguration)configuration;
- (NIDevicePresenceNotifier)devicePresenceNotifier;
- (NIDiscoveryToken)discoveryToken;
- (NIFindingNotifier)findingNotifier;
- (NIInternalSessionDelegate)internalDelegate;
- (NISession)init;
- (NISystemEventNotifier)systemEventNotifier;
- (NSDictionary)activationResponse;
- (NSError)invalidationError;
- (NSString)description;
- (dispatch_queue_t)delegateQueue;
- (id).cxx_construct;
- (id)_getSessionFailureError;
- (id)_initAndConnectToServerWithOptions:(unint64_t)a3;
- (id)_remoteObject;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)_setURSKTTL:(unint64_t)a3;
- (id)_synchronousRemoteObject;
- (id)_verifyError:(id)a3;
- (id)delegate;
- (id)deleteURSKs;
- (id)getInternalConnectionQueue;
- (id)getInternalIdentifier;
- (id)getInternalLogObject;
- (int)internalState;
- (int64_t)motionState;
- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object;
- (unint64_t)hash;
- (void)_addObject:(id)a3;
- (void)_addRegionPredicate:(id)a3;
- (void)_handleActivationError:(id)a3;
- (void)_handleActivationSuccess:(id)a3;
- (void)_handlePauseSessionError:(id)a3;
- (void)_handlePauseSessionSuccess;
- (void)_handleRunSessionError:(id)a3;
- (void)_handleRunSessionSuccess;
- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4;
- (void)_invalidateInternal;
- (void)_invalidateSessionAndNotifyError:(id)a3;
- (void)_logDurationAndSubmit:(BOOL)a3;
- (void)_logTime;
- (void)_notifyDidInvalidateWithError:(id)a3;
- (void)_osLogNearbyObjectUpdate:(id)a3;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5;
- (void)_processUpdatedLockState:(unsigned __int16)a3;
- (void)_provideTruthTag:(id)a3;
- (void)_reinterruptSessionWithCachedInterruption;
- (void)_removeObject:(id)a3;
- (void)_removeRegionPredicate:(id)a3;
- (void)_serverConnectionInterrupted;
- (void)_serverConnectionInvalidated;
- (void)_submitErrorMetric:(id)a3;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)invalidate;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)pause;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4;
- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5;
- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5;
- (void)processDCKMessage:(id)a3 responseCallback:(id)a4;
- (void)processVisionInput:(id)a3;
- (void)relayDCKMessage:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)runWithConfiguration:(NIConfiguration *)configuration;
- (void)setActivationResponse:(id)a3;
- (void)setConfigurationForTesting:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue;
- (void)setInternalDelegate:(id)a3;
- (void)setInternalState:(int)a3;
- (void)setInvalidationError:(id)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NISession

+ (id)_localDeviceLogger
{
  if (qword_1007FB440 != -1) {
    dispatch_once(&qword_1007FB440, &stru_1007B7C08);
  }
  return (id)qword_1007FB438;
}

+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 copy];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v20 = [v7 count];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "setAsyncLocalDeviceInteractableDiscoveryTokens:completion: with %d tokens",  buf,  8u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxy]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002312B8;
  v15[3] = &unk_1007B7C30;
  id v12 = v8;
  id v16 = v12;
  id v13 = v6;
  id v18 = v13;
  id v14 = v10;
  id v17 = v14;
  [v11 setLocalDeviceInteractableDiscoveryTokens:v7 reply:v15];
}

+ (void)getAsyncInteractableDiscoveryTokens:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens:", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxy]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10023153C;
  v10[3] = &unk_1007B7C58;
  id v7 = v4;
  v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getInteractableDiscoveryTokens:v10];
}

+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "getAsyncActivelyInteractingDiscoveryTokens:",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxy]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100231800;
  v10[3] = &unk_1007B7C58;
  id v7 = v4;
  v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getActivelyInteractingDiscoveryTokens:v10];
}

+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [v5 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (v4) {
    id v8 = "YES";
  }
  else {
    id v8 = "NO";
  }
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v6 count];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceCanInteract:%s with %d tokens",  buf,  0x12u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxy]);
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  v35 = sub_100231D08;
  v36 = sub_100231D18;
  id v37 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100231D20;
  v20[3] = &unk_1007B7C80;
  v22 = &v24;
  v23 = buf;
  id v12 = dispatch_semaphore_create(0LL);
  v21 = v12;
  [v11 setLocalDeviceCanInteract:v4 withDiscoveryTokens:v6 reply:v20];
  dispatch_time_t v13 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v12, v13);
  [v10 invalidate];
  if (!*((_BYTE *)v25 + 24))
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    v33 = @"Server did not reply.";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v14));
    id v16 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v15;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)&buf[8] + 40LL);
    *(_DWORD *)v28 = 136315394;
    v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceCanInteract:%s return error: %@",  v28,  0x16u);
  }

  id v18 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v24, 8);

  return v18;
}

+ (id)setLocalDeviceDebugParameters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceDebugParameters:%@",  (uint8_t *)&buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxy]);
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000LL;
  __int16 v30 = sub_100231D08;
  uint64_t v31 = sub_100231D18;
  id v32 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002320FC;
  v16[3] = &unk_1007B7C80;
  id v18 = &v20;
  p___int128 buf = &buf;
  id v8 = dispatch_semaphore_create(0LL);
  uint64_t v17 = v8;
  [v7 setLocalDeviceDebugParameters:v4 reply:v16];
  dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v8, v9);
  [v6 invalidate];
  if (!*((_BYTE *)v21 + 24))
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    char v27 = @"Server did not reply.";
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v10));
    id v12 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v11;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40LL);
    *(_DWORD *)uint64_t v24 = 138412290;
    uint64_t v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceDebugParameters return error: %@",  v24,  0xCu);
  }

  id v14 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v20, 8);

  return v14;
}

+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v4 count];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceInteractableDiscoveryTokens with %d tokens",  buf,  8u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxy]);
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  *(void *)__int128 buf = 0LL;
  __int16 v30 = buf;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_100231D08;
  v33 = sub_100231D18;
  id v34 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002324F4;
  v17[3] = &unk_1007B7C80;
  v19 = &v21;
  uint64_t v20 = buf;
  dispatch_time_t v9 = dispatch_semaphore_create(0LL);
  id v18 = v9;
  [v8 setLocalDeviceInteractableDiscoveryTokens:v4 reply:v17];
  dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v9, v10);
  [v7 invalidate];
  if (!*((_BYTE *)v22 + 24))
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v28 = @"Server did not reply.";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v11));
    uint64_t v13 = (void *)*((void *)v30 + 5);
    *((void *)v30 + 5) = v12;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *((void *)v30 + 5);
    *(_DWORD *)uint64_t v25 = 138412290;
    uint64_t v26 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "setLocalDeviceInteractableDiscoveryTokens return error: %@",  v25,  0xCu);
  }

  id v15 = *((id *)v30 + 5);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v21, 8);

  return v15;
}

+ (NSArray)interactableDiscoveryTokens
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  *(void *)__int128 buf = 0LL;
  uint64_t v31 = buf;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100231D08;
  id v34 = sub_100231D18;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  NSErrorUserInfoKey v27 = sub_100231D08;
  v28 = sub_100231D18;
  id v29 = 0LL;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100232908;
  v19 = &unk_1007B7CA8;
  uint64_t v21 = &v36;
  uint64_t v22 = buf;
  uint64_t v23 = &v24;
  id v5 = dispatch_semaphore_create(0LL);
  uint64_t v20 = v5;
  [v4 getInteractableDiscoveryTokens:&v16];
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((_BYTE *)v37 + 24))
  {
    id v7 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = 0LL;

    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    v45 = @"Server did not reply.";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v8));
    dispatch_time_t v10 = (void *)v25[5];
    v25[5] = v9;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    uint64_t v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [*((id *)v31 + 5) count];
      uint64_t v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      unsigned int v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "interactableDiscoveryTokens return %d tokens. Server error: %@",  v40,  0x12u);
    }
  }

  id v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);
  return (NSArray *)v14;
}

+ (NSArray)activelyInteractingDiscoveryTokens
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  *(void *)__int128 buf = 0LL;
  uint64_t v31 = buf;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100231D08;
  id v34 = sub_100231D18;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  NSErrorUserInfoKey v27 = sub_100231D08;
  v28 = sub_100231D18;
  id v29 = 0LL;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100232D58;
  v19 = &unk_1007B7CA8;
  uint64_t v21 = &v36;
  uint64_t v22 = buf;
  uint64_t v23 = &v24;
  id v5 = dispatch_semaphore_create(0LL);
  uint64_t v20 = v5;
  [v4 getActivelyInteractingDiscoveryTokens:&v16];
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((_BYTE *)v37 + 24))
  {
    id v7 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = 0LL;

    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    v45 = @"Server did not reply.";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v8));
    dispatch_time_t v10 = (void *)v25[5];
    v25[5] = v9;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    uint64_t v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [*((id *)v31 + 5) count];
      uint64_t v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      unsigned int v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "activelyInteractingDiscoveryTokens return %d tokens. Server error: %@",  v40,  0x12u);
    }
  }

  id v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);
  return (NSArray *)v14;
}

+ (id)localDevicePrintableState
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](&OBJC_CLASS___NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  *(void *)__int128 buf = 0LL;
  id v29 = buf;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100231D08;
  uint64_t v32 = sub_100231D18;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100231D08;
  uint64_t v26 = sub_100231D18;
  id v27 = 0LL;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_100233178;
  uint64_t v17 = &unk_1007B7CD0;
  v19 = &v34;
  uint64_t v20 = buf;
  uint64_t v21 = &v22;
  id v5 = dispatch_semaphore_create(0LL);
  id v18 = v5;
  [v4 getLocalDevicePrintableState:&v14];
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v14, v15, v16, v17);
  if (!*((_BYTE *)v35 + 24))
  {
    id v7 = (void *)*((void *)v29 + 5);
    *((void *)v29 + 5) = 0LL;

    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    unsigned int v41 = @"Server did not reply.";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v8));
    dispatch_time_t v10 = (void *)v23[5];
    v23[5] = v9;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v23[5];
    *(_DWORD *)uint64_t v38 = 138412290;
    uint64_t v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState error: %@", v38, 0xCu);
  }

  id v12 = *((id *)v29 + 5);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v34, 8);
  return v12;
}

+ (NSDictionary)cachedPlatformCapabilities
{
  return (NSDictionary *)(id)qword_1007FC348;
}

+ (void)setCachedPlatformCapabilities:(id)a3
{
}

- (int64_t)motionState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002795A0;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_initAndConnectToServerWithOptions:(unint64_t)a3
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NISession;
  id v4 = -[NISession init](&v33, "init");
  id v5 = v4;
  if (v4)
  {
    v4->_connectionOptions = a3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    internalID = v5->_internalID;
    v5->_internalID = (NSUUID *)v6;

    atomic_store(0, (unsigned __int8 *)&v5->_readyForCallbacks);
    v5->_startTime = 0.0;
    v5->_duration = 0.0;
    v5->_updatedNearbyObjects = 0;
    os_log_t v8 = os_log_create("com.apple.NearbyInteraction", "NISession");
    log = v5->_log;
    v5->_log = v8;

    -[NISession setInternalState:](v5, "setInternalState:", 0LL);
    -[NISession setInvalidationError:](v5, "setInvalidationError:", 0LL);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.NearbyInteraction", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v5->_delegateQueue, &_dispatch_main_q);
    id v14 = -[NIExportedObjectForwarder initWithExportedObject:]( objc_alloc(&OBJC_CLASS___NIExportedObjectForwarder),  "initWithExportedObject:",  v5);
    exportedObjectForwarder = v5->_exportedObjectForwarder;
    v5->_exportedObjectForwarder = v14;

    atomic_store(a3 & 1, (unsigned __int8 *)&v5->_isObserverSession);
    id v16 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:]( objc_alloc(&OBJC_CLASS___NIServerConnection),  "initWithSessionID:queue:exportedObject:options:",  v5->_internalID,  v5->_queue,  v5->_exportedObjectForwarder,  a3);
    connection = v5->_connection;
    v5->_connection = v16;

    dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
    discoveryTokenSemaphore = v5->_discoveryTokenSemaphore;
    v5->_discoveryTokenSemaphore = (OS_dispatch_semaphore *)v18;

    objc_initWeak(&location, v5);
    uint64_t v20 = v5->_connection;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10027993C;
    v30[3] = &unk_1007A1CA0;
    objc_copyWeak(&v31, &location);
    -[NIServerConnection setInterruptionHandler:](v20, "setInterruptionHandler:", v30);
    uint64_t v21 = v5->_connection;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100279984;
    v28[3] = &unk_1007A1CA0;
    objc_copyWeak(&v29, &location);
    -[NIServerConnection setInvalidationHandler:](v21, "setInvalidationHandler:", v28);
    -[NIServerConnection resume](v5->_connection, "resume");
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      uint64_t v22 = v5->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = v5->_internalID;
        *(_DWORD *)__int128 buf = 138412290;
        id v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NISession init [%@]", buf, 0xCu);
      }
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](v5, "_remoteObject"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1002799CC;
    v26[3] = &unk_1007B9EA8;
    id v27 = v5;
    [v24 activate:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (BOOL)_supportedPlatform:(id)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"SupportedPlatform"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

+ (void)_queryAndCacheCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerConnection createOneShotConnectionAndResume:]( &OBJC_CLASS___NIServerConnection,  "createOneShotConnectionAndResume:",  1LL));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxy]);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100279BFC;
  id v16 = sub_100279C0C;
  id v17 = 0LL;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  os_log_t v8 = sub_100279C14;
  uint64_t v9 = &unk_1007B9ED0;
  uint64_t v11 = &v12;
  unsigned __int8 v4 = dispatch_semaphore_create(0LL);
  dispatch_queue_attr_t v10 = v4;
  [v3 queryDeviceCapabilities:&v6];
  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v4, v5);
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);
  +[NISession setCachedPlatformCapabilities:](&OBJC_CLASS___NISession, "setCachedPlatformCapabilities:", v13[5]);

  _Block_object_dispose(&v12, 8);
}

- (void)_osLogNearbyObjectUpdate:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  ++self->_objectUpdateLogging.totalUpdates;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100279ED0;
  v14[3] = &unk_1007B52B0;
  v14[4] = self;
  [v4 enumerateObjectsUsingBlock:v14];
  if (self->_lastObjectUpdateLogTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    double v7 = v6;
    if (v6 < 5.0) {
      goto LABEL_13;
    }
  }

  else
  {
    double v7 = 0.0;
  }

  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, v5);
  os_log_t v8 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"DelegateProxy: nearbyObjectUpdates [last %0.1f s]. Updates %d, objects %d, w/dist %d, w/HA %d.",  *(void *)&v7,  self->_objectUpdateLogging.totalUpdates,  self->_objectUpdateLogging.totalObjects,  self->_objectUpdateLogging.objectsWithDistance,  self->_objectUpdateLogging.objectsWithHorizontalAngle);
  uint64_t v9 = v8;
  if (self->_objectUpdateLogging.objectsWithDistance >= 1) {
    -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @" Distance: first %0.2f m, last %0.2f m, min %0.2f m, max %0.2f m.",  self->_objectUpdateLogging.firstDistance,  self->_objectUpdateLogging.lastDistance,  self->_objectUpdateLogging.minDistance,  self->_objectUpdateLogging.maxDistance);
  }
  if (self->_objectUpdateLogging.objectsWithHorizontalAngle >= 1) {
    -[NSMutableString appendFormat:]( v9,  "appendFormat:",  @" HA: first %0.1f deg, last %0.1f deg.",  self->_objectUpdateLogging.firstHorizontalAngleRad * 57.2957795,  self->_objectUpdateLogging.lastHorizontalAngleRad * 57.2957795);
  }
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138477827;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
  }

  uint64_t v11 = &NINearbyObjectDistanceNotAvailable;
  float v12 = NINearbyObjectAngleNotAvailable;
  *(void *)&self->_objectUpdateLogging.totalUpdates = 0LL;
  *(void *)&self->_objectUpdateLogging.objectsWithDistance = 0LL;
  float32x4_t v13 = vld1q_dup_f32(v11);
  *(float32x4_t *)&self->_objectUpdateLogging.firstDistance = v13;
  self->_objectUpdateLogging.firstHorizontalAngleRad = v12;
  self->_objectUpdateLogging.lastHorizontalAngleRad = v12;

LABEL_13:
}

- (void)_logTime
{
  double v4 = v3;
  double startTime = self->_startTime;
  if (startTime != 0.0)
  {
    self->_duration = v4 - startTime + self->_duration;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10027A090;
    v6[3] = &unk_1007A2298;
    v6[4] = self;
    AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.session.duration", v6);
  }

  self->_double startTime = v4;
}

- (void)_logDurationAndSubmit:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_startTime != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_duration = self->_duration + v5 - self->_startTime;
    self->_double startTime = 0.0;
  }

  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10027A1E8;
    v6[3] = &unk_1007A2298;
    v6[4] = self;
    AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.session.duration", v6);
  }

- (void)_submitErrorMetric:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

    if (v5)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey]);

      if (!v7)
      {
        os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        double v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

        if (!v7) {
          double v7 = &stru_1007C41E0;
        }
      }
    }

    else
    {
      double v7 = &stru_1007C41E0;
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10027A438;
    v10[3] = &unk_1007B9EF8;
    id v11 = v4;
    float v12 = v7;
    uint64_t v9 = v7;
    AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.error", v10);
  }
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027A5C4;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  double v5 = delegateQueue;
  if (!v5)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"NISession.mm", 509, @"Invalid parameter not satisfying: %@", @"delegateQueue" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027A768;
  block[3] = &unk_1007A2248;
  block[4] = self;
  dispatch_queue_attr_t v10 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

+ (BOOL)isSupported
{
  if (+[NIPlatformInfo supportsUWB](&OBJC_CLASS___NIPlatformInfo, "supportsUWB")) {
    return 1;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));

  if (!v3) {
    +[NISession _queryAndCacheCapabilities](&OBJC_CLASS___NISession, "_queryAndCacheCapabilities");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  BOOL v2 = +[NISession _supportedPlatform:](&OBJC_CLASS___NISession, "_supportedPlatform:", v4);

  return v2;
}

+ (id)deviceCapabilities
{
  return  -[NIDeviceCapabilities initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]( objc_alloc(&OBJC_CLASS___NIDeviceCapabilities),  "initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:",  +[NIPlatformInfo supportsUWB](&OBJC_CLASS___NIPlatformInfo, "supportsUWB"),  +[NIPlatformInfo supportsAoA](&OBJC_CLASS___NIPlatformInfo, "supportsAoA"),  +[NIPlatformInfo supportsNBAMMS](&OBJC_CLASS___NIPlatformInfo, "supportsNBAMMS"),  +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture"));
}

- (NIConfiguration)configuration
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100279BFC;
  dispatch_queue_attr_t v10 = sub_100279C0C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10027A9E8;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NIConfiguration *)v3;
}

- (NIDiscoveryToken)discoveryToken
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100279BFC;
  uint64_t v26 = sub_100279C0C;
  id v27 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027ABA4;
  block[3] = &unk_1007B1E50;
  block[4] = self;
  void block[5] = &v22;
  dispatch_sync(queue, block);
  id v4 = (void *)v23[5];
  if (!v4)
  {
    double v5 = (dispatch_queue_s *)self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10027ABB8;
    v20[3] = &unk_1007A3000;
    void v20[4] = self;
    dispatch_sync(v5, v20);
    discoveryTokenSemaphore = self->_discoveryTokenSemaphore;
    dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait((dispatch_semaphore_t)discoveryTokenSemaphore, v7);
    uint64_t v8 = (dispatch_queue_s *)self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10027AC04;
    v19[3] = &unk_1007B1E50;
    v19[4] = self;
    v19[5] = &v22;
    dispatch_sync(v8, v19);
    if (!v23[5])
    {
      if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_1003A3FA4(log, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }

    id v4 = (void *)v23[5];
  }

  id v17 = v4;
  _Block_object_dispose(&v22, 8);

  return (NIDiscoveryToken *)v17;
}

- (BOOL)_isInternalClient
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[NISession activationResponse](self, "activationResponse"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"InternalClient"]);

  BOOL v6 = 0;
  if (v3)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  }

  return v6;
}

- (NISession)init
{
  return (NISession *)-[NISession _initAndConnectToServerWithOptions:](self, "_initAndConnectToServerWithOptions:", 0LL);
}

- (void)runWithConfiguration:(NIConfiguration *)configuration
{
  uint64_t v5 = configuration;
  if (!v5)
  {
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"NISession.mm", 626, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027ADA8;
  block[3] = &unk_1007A2248;
  block[4] = self;
  uint64_t v10 = v5;
  uint64_t v8 = v5;
  dispatch_sync(queue, block);
}

- (void)pause
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027B1E0;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027B49C;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      *(_DWORD *)__int128 buf = 138412290;
      dispatch_time_t v7 = internalID;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Client: dealloc [%@]", buf, 0xCu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NISession;
  -[NISession dealloc](&v5, "dealloc");
}

- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object
{
  simd_float4 v3 = NINearbyObjectWorldTransformNotAvailable.columns[0];
  simd_float4 v4 = NINearbyObjectWorldTransformNotAvailable.columns[1];
  simd_float4 v5 = NINearbyObjectWorldTransformNotAvailable.columns[2];
  simd_float4 v6 = NINearbyObjectWorldTransformNotAvailable.columns[3];
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  simd_float4 v4 = (NISession *)a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    if (v4 == self) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = -[NSUUID isEqual:](self->_internalID, "isEqual:", v4->_internalID);
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_internalID, "hash");
}

- (NSString)description
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100279BFC;
  uint64_t v23 = sub_100279C0C;
  simd_float4 v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v24 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@", v7, self->_internalID);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NISession deviceCapabilities](&OBJC_CLASS___NISession, "deviceCapabilities"));
  uint64_t v9 = (void *)v20[5];
  else {
    uint64_t v10 = @"NO";
  }
  [v9 appendFormat:@", preciseDistance: %@", v10];
  uint64_t v11 = (void *)v20[5];
  else {
    uint64_t v12 = @"NO";
  }
  [v11 appendFormat:@", direction: %@", v12];
  uint64_t v13 = (void *)v20[5];
  else {
    uint64_t v14 = @"NO";
  }
  [v13 appendFormat:@", cameraAssistance: %@", v14];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027B960;
  block[3] = &unk_1007B1E50;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(queue, block);
  [(id)v20[5] appendString:@">"];
  id v16 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return (NSString *)v16;
}

- (void)setConfigurationForTesting:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027BA7C;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)getInternalIdentifier
{
  return self->_internalID;
}

- (id)getInternalLogObject
{
  return self->_log;
}

- (id)getInternalConnectionQueue
{
  return self->_queue;
}

- (void)_serverConnectionInvalidated
{
  unsigned int v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1007BA310[v3 - 1];
      }
      *(_DWORD *)uint64_t v9 = 138412546;
      *(void *)&v9[4] = internalID;
      *(_WORD *)&v9[12] = 2112;
      *(void *)&v9[14] = v6;
      unsigned __int8 v7 = log;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Server connection invalidated [%@]. State: %@.",  v9,  0x16u);
    }
  }

  -[NISession setInternalState:](self, "setInternalState:", 8LL, *(_OWORD *)v9, *(void *)&v9[16]);
  if (v3 != 7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _getSessionFailureError](self, "_getSessionFailureError"));
    -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v8);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
}

- (void)_serverConnectionInterrupted
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1007BA310[v5];
      }
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v13 = internalID;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Server connection interrupted [%@]. State: %@.",  buf,  0x16u);
    }
  }

  v10[0] = NSLocalizedFailureReasonErrorKey;
  v10[1] = NSLocalizedRecoverySuggestionErrorKey;
  v11[0] = @"The session token has been invalidated. This session cannot be restarted.";
  v11[1] = @"Create a new session and exchange token again.";
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  id v8 = sub_100192A50(-5887LL, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v9);
}

- (id)_remoteObject
{
  return -[NIServerConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)_synchronousRemoteObject
{
  return -[NIServerConnection synchronousRemoteObjectProxy](self->_connection, "synchronousRemoteObjectProxy");
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109379;
      int v19 = a4;
      __int16 v20 = 2113;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: removed objects with reason: %d. Objects: %{private}@",  buf,  0x12u);
    }
  }

  currentConfiguration = self->_currentConfiguration;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v7);
  if ((objc_opt_isKindOfClass(currentConfiguration, v10) & 1) != 0
    || (uint64_t v12 = self->_currentConfiguration,
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v11),
        (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    -[NISession setInternalState:](self, "setInternalState:", 5LL);
  }

  if (a4 == 1)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10027C048;
    v16[3] = &unk_1007A2248;
    __int16 v14 = v16;
    void v16[4] = self;
    v16[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v16,  "session:didRemoveNearbyObjects:withReason:");
    goto LABEL_11;
  }

  if (!a4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10027BFF0;
    v17[3] = &unk_1007A2248;
    __int16 v14 = v17;
    void v17[4] = self;
    v17[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v17,  "session:didRemoveNearbyObjects:withReason:");
LABEL_11:
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10027C0A0;
  v15[3] = &unk_1007B5580;
  void v15[4] = a4;
  AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.peerRemoved", v15);
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_10027C21C;
  uint64_t v9 = &unk_1007A2248;
  uint64_t v10 = self;
  id v5 = v4;
  id v11 = v5;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  &v6,  "session:didUpdateNearbyObjects:");
  self->_updatedNearbyObjects = 1;
  -[NISession _osLogNearbyObjectUpdate:](self, "_osLogNearbyObjectUpdate:", v5, v6, v7, v8, v9, v10);
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1003A3FD4((uint64_t)v4, log, v6);
    }
  }

  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1003A403C((uint64_t)v4, log, v6);
    }
  }

  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    uint64_t v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7) {
        uint64_t v9 = @"Activating";
      }
      else {
        uint64_t v9 = off_1007BA310[v8];
      }
      uint64_t v10 = sub_10029449C(a3);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)__int128 buf = 138478339;
      uint64_t v34 = v9;
      __int16 v35 = 2113;
      uint64_t v36 = v11;
      __int16 v37 = 2048;
      double v38 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: suspension reason started. State: %{private}@. Reason: %{private}@. Timestamp: %f",  buf,  0x20u);
    }
  }

  begin = (unint64_t *)self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  p_interruptions = &self->_interruptions;
  if (begin == (unint64_t *)end)
  {
    id v16 = &stru_1007C41E0;
    id v17 = self->_interruptions.__begin_;
  }

  else
  {
    uint64_t v15 = sub_10029449C(*begin);
    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = self->_interruptions.__end_;
  }

  value = self->_interruptions.__end_cap_.__value_;
  if (v17 >= value)
  {
    __int16 v20 = p_interruptions->__begin_;
    uint64_t v21 = (v17 - p_interruptions->__begin_) >> 4;
    unint64_t v22 = v21 + 1;
    uint64_t v23 = value - v20;
    if (v23 >> 3 > v22) {
      unint64_t v22 = v23 >> 3;
    }
    else {
      unint64_t v24 = v22;
    }
    if (v24)
    {
      uint64_t v25 = (char *)sub_10011E44C((uint64_t)&self->_interruptions.__end_cap_, v24);
      __int16 v20 = self->_interruptions.__begin_;
      id v17 = self->_interruptions.__end_;
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    uint64_t v26 = &v25[16 * v21];
    id v27 = (UWBSessionInterruptionBookkeeping *)&v25[16 * v24];
    *(void *)uint64_t v26 = a3;
    *((double *)v26 + 1) = a4;
    int v19 = (UWBSessionInterruptionBookkeeping *)(v26 + 16);
    if (v17 != v20)
    {
      do
      {
        *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
        v26 -= 16;
        id v17 = (UWBSessionInterruptionBookkeeping *)((char *)v17 - 16);
      }

      while (v17 != v20);
      __int16 v20 = p_interruptions->__begin_;
    }

    self->_interruptions.__begin_ = (UWBSessionInterruptionBookkeeping *)v26;
    self->_interruptions.__end_ = v19;
    self->_interruptions.__end_cap_.__value_ = v27;
    if (v20) {
      operator delete(v20);
    }
  }

  else
  {
    *(void *)id v17 = a3;
    *((double *)v17 + 1) = a4;
    int v19 = (UWBSessionInterruptionBookkeeping *)((char *)v17 + 16);
  }

  self->_interruptions.__end_ = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10027C688;
  v29[3] = &unk_1007B9F48;
  int64_t v31 = a3;
  BOOL v32 = begin != (unint64_t *)end;
  v28 = v16;
  uint64_t v30 = v28;
  AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.session.interruptionStart", v29);
  -[NISession _interruptSessionWithInternalReason:cachedInterruption:]( self,  "_interruptSessionWithInternalReason:cachedInterruption:",  a3,  0LL);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    uint64_t v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7) {
        uint64_t v9 = @"Activating";
      }
      else {
        uint64_t v9 = off_1007BA310[v8];
      }
      uint64_t v10 = sub_10029449C(a3);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)__int128 buf = 138478339;
      uint64_t v36 = (void *)v9;
      __int16 v37 = 2113;
      double v38 = v11;
      __int16 v39 = 2048;
      double v40 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: suspension reason ended. State: %{private}@. Reason: %{private}@. Timestamp: %f",  buf,  0x20u);
    }
  }

  begin = self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  if (begin == end)
  {
LABEL_12:
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1003A40A4(log, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    while (*(void *)((char *)begin + v14) != a3)
    {
      v14 += 16LL;
    }

    uint64_t v23 = (char *)begin + v14;
    uint64_t v24 = *(void *)((char *)begin + v14 + 8);
    uint64_t v25 = (UWBSessionInterruptionBookkeeping *)((char *)begin + v14 + 16);
    int64_t v26 = end - v25;
    if (end != v25)
    {
      memmove((char *)begin + v14, v25, end - v25);
      begin = self->_interruptions.__begin_;
    }

    self->_interruptions.__end_ = (UWBSessionInterruptionBookkeeping *)&v23[v26];
    BOOL v27 = begin == (UWBSessionInterruptionBookkeeping *)&v23[v26];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10027CAB4;
    v34[3] = &unk_1007A2518;
    v34[4] = a3;
    *(double *)&v34[5] = a4;
    v34[6] = v24;
    AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.session.interruptionEnd", v34);
    if (v27)
    {
      -[NISession setInternalState:](self, "setInternalState:", 5LL);
      if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
      {
        v28 = self->_log;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          internalID = self->_internalID;
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v36 = internalID;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Delegate: notify suspension ended [%@]",  buf,  0xCu);
        }
      }

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10027CBA8;
      v33[3] = &unk_1007A3000;
      v33[4] = self;
      -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v33,  "sessionSuspensionEnded:");
    }

    else {
      uint64_t v30 = qword_10042AED0[a3 - 1];
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10027CBFC;
    v31[3] = &unk_1007B9F70;
    v31[4] = self;
    v31[5] = v30;
    BOOL v32 = v27;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v31,  "session:suspensionReasonEnded:isNoLongerSuspended:");
  }

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138477827;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: updated token %{private}@",  buf,  0xCu);
    }
  }

  objc_storeStrong((id *)&self->_discoveryToken, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027CD90;
  v7[3] = &unk_1007A3000;
  v7[4] = self;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "sessionDidUpdateDiscoveryToken:");
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10027CEA4;
  v8[3] = &unk_1007B1690;
  v8[4] = self;
  BOOL v10 = a3;
  id v7 = v6;
  id v9 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v8,  "session:didReceiveRangingAuthRecommendation:forObject:");
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138477827;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: discovered object: %{private}@",  buf,  0xCu);
    }
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027D040;
  v7[3] = &unk_1007A2248;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "session:didDiscoverNearbyObject:");
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138478339;
      id v20 = v9;
      __int16 v21 = 2113;
      id v22 = v10;
      __int16 v23 = 2113;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: updated region %{private}@ (previous: %{private}@). Object: %{private}@",  buf,  0x20u);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10027D25C;
  v15[3] = &unk_1007B1AA0;
  void v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v15,  "session:object:didUpdateRegion:previousRegion:");
}

- (void)didUpdateMotionState:(int64_t)a3
{
  self->_motionState = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10027D330;
  v5[3] = &unk_1007B14E0;
  v5[4] = self;
  v5[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v5,  "session:didUpdateLocalMotionState:");
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10027D400;
  v5[3] = &unk_1007B9F98;
  v5[4] = self;
  BOOL v6 = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v5,  "session:didUpdateHomeDeviceUWBRangingAvailability:");
}

- (void)relayDCKMessage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10027D4FC;
  v4[3] = &unk_1007A2248;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( v5,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v4,  "session:relayDCKMessage:");
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10027D5AC;
  v3[3] = &unk_1007B14E0;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v3,  "session:didUpdateHealthStatus:");
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027D6DC;
  v7[3] = &unk_1007B14B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( v8,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "session:didProcessAcwgM1MsgWithResponse:error:");
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027D810;
  v7[3] = &unk_1007B14B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( v8,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "session:didProcessAcwgM3MsgWithResponse:error:");
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027D944;
  v7[3] = &unk_1007B14B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( v8,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10027D9FC;
  v4[3] = &unk_1007B2E28;
  unsigned int v5 = a3;
  void v4[4] = self;
  v4[5] = a4;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v4,  "session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10027DAB0;
  v3[3] = &unk_1007B14E0;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v3,  "session:didStartAcwgRanging:");
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10027DB60;
  v3[3] = &unk_1007B14E0;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v3,  "session:didSuspendAcwgRanging:");
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10027DC60;
  v5[3] = &unk_1007B6578;
  unsigned int v8 = a3;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( v6,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v5,  "session:didPrefetchAcwgUrsk:error:");
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138478083;
      id v15 = v6;
      __int16 v16 = 2113;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: generated shareable config: %{private}@. Object: %{private}@",  buf,  0x16u);
    }
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_10027DE38;
  v11[3] = &unk_1007B14B8;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v11,  "session:didGenerateShareableConfigurationData:forObject:");
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138477827;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: system updated state: %{private}@",  buf,  0xCu);
    }
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027DFCC;
  v7[3] = &unk_1007A2248;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "systemConfigurator:didUpdateState:");
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  BOOL v4 = a3;
  id v6 = (NSString *)a4;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67174915;
      BOOL v12 = v4;
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: system updated resource usage limit exceeded: %{private}d. Configuration type: %{private}@",  buf,  0x12u);
    }
  }

  Class v8 = NSClassFromString(v6);
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10027E160;
    v9[3] = &unk_1007B37F0;
    BOOL v10 = v4;
    v9[4] = self;
    v9[5] = v8;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v9,  "systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
  }
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 convergence];
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109635;
      int v23 = (int)v8;
      __int16 v24 = 2113;
      id v25 = v7;
      __int16 v26 = 2113;
      BOOL v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "DelegateProxy: algorithm convergence status: %d. Object: %{private}@. Reasons: %{private}@",  buf,  0x1Cu);
    }
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10027E498;
  v18[3] = &unk_1007B9FC0;
  v18[4] = self;
  id v21 = v8;
  id v11 = v9;
  uint64_t v19 = v11;
  id v12 = v7;
  id v20 = v12;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v18,  "session:didUpdateAlgorithmConvergence:forObject:");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10027E530;
  v15[3] = &unk_1007B14B8;
  void v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v15,  "session:didUpdateAlgorithmState:forObject:");
}

- (void)_invalidateSessionAndNotifyError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v4);
  -[NISession _invalidateInternal](self, "_invalidateInternal");
}

- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") != 6 || v4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 6LL);
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        internalID = self->_internalID;
        *(_DWORD *)__int128 buf = 138412290;
        id v13 = internalID;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Delegate: notify suspension started [%@]",  buf,  0xCu);
      }
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_10027E778;
    v11[3] = &unk_1007A3000;
    v11[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v11,  "sessionWasSuspended:");
  }

  else {
    uint64_t v9 = qword_10042AED0[a3 - 1];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_10027E7CC;
  v10[3] = &unk_1007B14E0;
  void v10[4] = self;
  v10[5] = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v10,  "session:suspendedWithReason:");
}

- (void)_reinterruptSessionWithCachedInterruption
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      int v14 = 138412290;
      id v15 = internalID;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Reinterrupting session [%@]",  (uint8_t *)&v14,  0xCu);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  begin = self->_interruptions.__begin_;
  if (begin == self->_interruptions.__end_)
  {
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      id v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1003A40D4(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  else
  {
    -[NISession _interruptSessionWithInternalReason:cachedInterruption:]( self,  "_interruptSessionWithInternalReason:cachedInterruption:",  *(void *)begin,  1LL);
  }

- (void)_invalidateInternal
{
  unsigned int v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1007BA310[v3 - 1];
      }
      int v9 = 138412546;
      uint64_t v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      uint64_t v7 = log;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "invalidateInternal [%@]. State: %@.",  (uint8_t *)&v9,  0x16u);
    }
  }

  if (v3 <= 6)
  {
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", self->_updatedNearbyObjects);
    -[NISession setInternalState:](self, "setInternalState:", 7LL);
    -[NIServerConnection invalidate](self->_connection, "invalidate");
    currentConfiguration = self->_currentConfiguration;
    self->_currentConfiguration = 0LL;
  }

- (void)_handleActivationError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7) {
        uint64_t v8 = @"Activating";
      }
      else {
        uint64_t v8 = off_1007BA310[v7];
      }
      int v9 = 138412802;
      uint64_t v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activation error [%@]. State: %@. Error: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);
}

- (void)_handleActivationSuccess:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7) {
        uint64_t v8 = @"Activating";
      }
      else {
        uint64_t v8 = off_1007BA310[v7];
      }
      int v9 = 138412802;
      uint64_t v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activation success [%@]. State: %@. Response: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4) {
    __assert_rtn("-[NISession _handleActivationSuccess:]", "NISession.mm", 1772, "activationResponse != nil");
  }
  -[NISession setActivationResponse:](self, "setActivationResponse:", v4);
}

- (void)_handleRunSessionError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7) {
        uint64_t v8 = @"Activating";
      }
      else {
        uint64_t v8 = off_1007BA310[v7];
      }
      int v9 = 138412802;
      uint64_t v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Run session error [%@]. State: %@. Error: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);
}

- (void)_handleRunSessionSuccess
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1007BA310[v5];
      }
      *(_DWORD *)__int128 buf = 138412546;
      int v9 = internalID;
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Run session succeeded [%@]. State: %@",  buf,  0x16u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 2)
  {
    -[NISession setInternalState:](self, "setInternalState:", 3LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10027EFDC;
    v7[3] = &unk_1007A3000;
    void v7[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  v7,  "sessionDidStartRunning:");
  }

- (void)_handlePauseSessionError:(id)a3
{
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7) {
        uint64_t v8 = @"Activating";
      }
      else {
        uint64_t v8 = off_1007BA310[v7];
      }
      int v9 = 138412802;
      __int16 v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Pause session error [%@]. State: %@. Error: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);
}

- (void)_handlePauseSessionSuccess
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1007BA310[v5];
      }
      int v7 = 138412546;
      uint64_t v8 = internalID;
      __int16 v9 = 2112;
      __int16 v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Pause session success [%@]. State: %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 5LL);
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", 0LL);
  }

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4
{
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  __int16 v9 = v8;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_readyForCallbacks);
  if ((v10 & 1) != 0 || v5)
  {
    dispatch_block_t block = v8;
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector(WeakRetained, a4) & 1) == 0)
      {

        goto LABEL_10;
      }

      delegateQueue = self->_delegateQueue;

      __int16 v9 = block;
      if (delegateQueue)
      {
        __int16 v13 = (dispatch_queue_s *)self->_delegateQueue;
LABEL_8:
        dispatch_async(v13, block);
LABEL_10:
        __int16 v9 = block;
      }
    }

    else
    {
      __int16 v13 = (dispatch_queue_s *)self->_delegateQueue;
      if (v13) {
        goto LABEL_8;
      }
    }
  }
}

- (id)_verifyError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 code];
  if ((unint64_t)v5 + 5889 < 8)
  {
    id v6 = [v4 code];
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = sub_100192A50((uint64_t)v6, v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
LABEL_5:
    __int16 v11 = (void *)v9;

    goto LABEL_6;
  }

  if ((unint64_t)v5 + 10017 < 2)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v10 = sub_100192A50(-5887LL, v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_5;
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    __int16 v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid error code blocked from being sent to NISessionDelegate.  Error: %@",  v4));
      sub_1003A4104(v14, (uint64_t)v16, v13);
    }
  }

  id v15 = sub_100192A50(-5887LL, 0LL);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
LABEL_6:

  return v11;
}

- (void)_notifyDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  if (-[NISession _isInternalClient](self, "_isInternalClient")) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NISession _verifyError:](self, "_verifyError:", v4));
  }
  id v6 = v5;
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1003A4150((uint64_t)v4, (uint64_t)v6, log);
    }
  }

  -[NISession setInvalidationError:](self, "setInvalidationError:", v6);
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  __int16 v11 = sub_10027F624;
  uint64_t v12 = &unk_1007A2248;
  __int16 v13 = self;
  id v8 = v6;
  id v14 = v8;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:]( self,  "_performBlockOnDelegateQueue:ifRespondsToSelector:",  &v9,  "session:didInvalidateWithError:");
  -[NISession _submitErrorMetric:](self, "_submitErrorMetric:", v4, v9, v10, v11, v12, v13);
}

- (id)_getSessionFailureError
{
  NSErrorUserInfoKey v6 = NSLocalizedFailureReasonErrorKey;
  int v7 = @"This session object is invalidated. Dispose of it and create a new one instead.";
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v3 = sub_100192A50(-5887LL, v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (int)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int)a3
{
  self->_internalState = a3;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setInvalidationError:(id)a3
{
}

- (NSDictionary)activationResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setActivationResponse:(id)a3
{
}

- (NIInternalSessionDelegate)internalDelegate
{
  return (NIInternalSessionDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_interruptions.__begin_;
  if (begin)
  {
    self->_interruptions.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_discoveryTokenSemaphore, 0LL);
  objc_storeStrong((id *)&self->_currentConfiguration, 0LL);
  objc_storeStrong((id *)&self->_exportedObjectForwarder, 0LL);
  objc_storeStrong((id *)&self->_connection, 0LL);
  objc_storeStrong((id *)&self->_internalID, 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 25) = 0LL;
  *((void *)self + 26) = 0LL;
  BOOL v2 = &NINearbyObjectDistanceNotAvailable;
  float32x4_t v3 = vld1q_dup_f32(v2);
  *(float32x4_t *)((char *)self + 216) = v3;
  v3.f32[0] = NINearbyObjectAngleNotAvailable;
  *((float *)self + 58) = NINearbyObjectAngleNotAvailable;
  *((_DWORD *)self + 59) = v3.i32[0];
  return self;
}

+ (NIInternalDeviceCapability)internalDeviceCapabilities
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));

  if (!v2) {
    +[NISession _queryAndCacheCapabilities](&OBJC_CLASS___NISession, "_queryAndCacheCapabilities");
  }
  float32x4_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"UWBSupportedPlatform"]);
  id v5 = [v4 BOOLValue];

  NSErrorUserInfoKey v6 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"WifiSupportedPlatform"]);
  id v8 = [v7 BOOLValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"UWBSupportedPlatformPDOA"]);
  id v11 = [v10 BOOLValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"UWBSupportedPlatformSyntheticAperture"]);
  id v14 = [v13 BOOLValue];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](&OBJC_CLASS___NISession, "cachedPlatformCapabilities"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"UWBSupportedPlatformExtendedDistance"]);
  id v17 = [v16 BOOLValue];

  return (NIInternalDeviceCapability *) -[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]( objc_alloc(&OBJC_CLASS___NIDeviceCapabilities),  "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMe asurementSupport:syntheticApertureSupport:",  v5,  v8,  v11,  v17,  v14);
}

- (void)_addObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"NISession.mm", 1982, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100280068;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (void)_removeObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"NISession.mm", 1996, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002802D8;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (void)_addRegionPredicate:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2010 description:@"_addRegionPredicate is deprecated"];
}

- (void)_removeRegionPredicate:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2014 description:@"_removeRegionPredicate is deprecated"];
}

+ (id)observerSession
{
  return  -[NISession _initAndConnectToServerWithOptions:]( objc_alloc(&OBJC_CLASS___NISession),  "_initAndConnectToServerWithOptions:",  1LL);
}

- (BOOL)isPreciseRangingAllowed
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002805FC;
  v5[3] = &unk_1007BA010;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExtendedDistanceMeasurementAllowed
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10028077C;
  v5[3] = &unk_1007BA010;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002808C8;
  v6[3] = &unk_1007BA060;
  v6[4] = self;
  void v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(queue, v6);
}

- (void)processDCKMessage:(id)a3 responseCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"NISession.mm", 2182, @"Invalid parameter not satisfying: %@", @"dckMessage" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v16 handleFailureInMethod:a2, self, @"NISession.mm", 2183, @"Invalid parameter not satisfying: %@", @"responseCallback" object file lineNumber description];

LABEL_3:
  if ([v7 length])
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100281A74;
    block[3] = &unk_1007BA198;
    block[4] = self;
    id v18 = v7;
    id v19 = v9;
    id v11 = v9;
    dispatch_sync(queue, block);

    uint64_t v12 = v18;
  }

  else
  {
    delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100281978;
    v20[3] = &unk_1007B2198;
    id v21 = v9;
    id v14 = v9;
    dispatch_async(delegateQueue, v20);
    uint64_t v12 = v21;
  }
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4
{
}

- (id)deleteURSKs
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  char v9 = sub_100279BFC;
  id v10 = sub_100279C0C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100281CB8;
  v5[3] = &unk_1007BA010;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v16 = 0LL;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_100279BFC;
    id v20 = sub_100279C0C;
    id v21 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100281EF0;
    block[3] = &unk_1007BA1C0;
    block[4] = self;
    unsigned int v15 = a4;
    id v13 = v6;
    id v14 = &v16;
    dispatch_sync(queue, block);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    int v23 = @"Given nil URSK.";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  v10));
  }

  return v9;
}

- (BOOL)isRangingLimitExceeded
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100282018;
  v5[3] = &unk_1007BA010;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NICarKeyEventNotifier)carKeyEventNotifier
{
  carKeyEventNotifier = self->_carKeyEventNotifier;
  if (!carKeyEventNotifier)
  {
    id v4 = -[NICarKeyEventNotifier initWithParentSession:]( objc_alloc(&OBJC_CLASS___NICarKeyEventNotifier),  "initWithParentSession:",  self);
    id v5 = self->_carKeyEventNotifier;
    self->_carKeyEventNotifier = v4;

    carKeyEventNotifier = self->_carKeyEventNotifier;
  }

  return carKeyEventNotifier;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100279BFC;
  id v11 = sub_100279C0C;
  id v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100282208;
  block[3] = &unk_1007BA1E8;
  void block[5] = &v7;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NIAcwgEventNotifier)acwgEventNotifier
{
  acwgEventNotifier = self->_acwgEventNotifier;
  if (!acwgEventNotifier)
  {
    id v4 = -[NIAcwgEventNotifier initWithParentSession:]( objc_alloc(&OBJC_CLASS___NIAcwgEventNotifier),  "initWithParentSession:",  self);
    id v5 = self->_acwgEventNotifier;
    self->_acwgEventNotifier = v4;

    acwgEventNotifier = self->_acwgEventNotifier;
  }

  return acwgEventNotifier;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, self, @"NISession.mm", 2355, @"Invalid parameter not satisfying: %@", @"m1Msg" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002825B0;
  block[3] = &unk_1007B6360;
  block[4] = self;
  id v12 = v7;
  int64_t v13 = a4;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (void)processAcwgM3Msg:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"NISession.mm", 2365, @"Invalid parameter not satisfying: %@", @"m3Msg" object file lineNumber description];
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002826EC;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028279C;
  block[3] = &unk_1007B2E28;
  unsigned int v6 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(queue, block);
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100282850;
  block[3] = &unk_1007B2E28;
  unsigned int v6 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(queue, block);
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100282904;
  v4[3] = &unk_1007B2EE0;
  void v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_processUpdatedLockState:(unsigned __int16)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002829B4;
  v4[3] = &unk_1007BA210;
  void v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (!v10)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 2410, @"Invalid parameter not satisfying: %@", @"deviceIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, self, @"NISession.mm", 2411, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v7[2](v7, 1LL, 0LL);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100282BA8;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NIDevicePresenceNotifier)devicePresenceNotifier
{
  devicePresenceNotifier = self->_devicePresenceNotifier;
  if (!devicePresenceNotifier)
  {
    id v4 = -[NIDevicePresenceNotifier initWithParentSession:]( objc_alloc(&OBJC_CLASS___NIDevicePresenceNotifier),  "initWithParentSession:",  self);
    unsigned __int16 v5 = self->_devicePresenceNotifier;
    self->_devicePresenceNotifier = v4;

    devicePresenceNotifier = self->_devicePresenceNotifier;
  }

  return devicePresenceNotifier;
}

+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, a1, @"NISession.mm", 2471, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }

  if ([v8 length] != (id)16)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, a1, @"NISession.mm", 2472, @"Invalid parameter not satisfying: %@", @"[IRK length] == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }

  v16[0] = &off_1007D2688;
  v16[1] = &off_1007D26A0;
  v17[0] = v8;
  v17[1] = v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  Data = (void *)OPACKEncoderCreateData(v9, 8LL, 0LL);
  if (!Data)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, a1, @"NISession.mm", 2478, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }

  id v11 = -[NIDiscoveryToken initWithBytes:](objc_alloc(&OBJC_CLASS___NIDiscoveryToken), "initWithBytes:", Data);

  return v11;
}

+ (id)generateFindingDiscoveryToken
{
  uint64_t v2 = NSRandomData(16LL, 0LL);
  char v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIDiscoveryToken generateFindingTokenWithIRK:]( &OBJC_CLASS___NIDiscoveryToken,  "generateFindingTokenWithIRK:",  v3));

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3
{
  id v3 = a3;
  if ([v3 length] == (id)16) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIDiscoveryToken generateFindingTokenWithIRK:]( &OBJC_CLASS___NIDiscoveryToken,  "generateFindingTokenWithIRK:",  v3));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NISession generateFindingDiscoveryTokenWithSharedSecret:]( &OBJC_CLASS___NISession,  "generateFindingDiscoveryTokenWithSharedSecret:",  a3));
}

- (NIFindingNotifier)findingNotifier
{
  findingNotifier = self->_findingNotifier;
  if (!findingNotifier)
  {
    id v4 = -[NIFindingNotifier initWithParentSession:]( objc_alloc(&OBJC_CLASS___NIFindingNotifier),  "initWithParentSession:",  self);
    unsigned __int16 v5 = self->_findingNotifier;
    self->_findingNotifier = v4;

    findingNotifier = self->_findingNotifier;
  }

  return findingNotifier;
}

- (void)_provideTruthTag:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002842FC;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NISystemEventNotifier)systemEventNotifier
{
  systemEventNotifier = self->_systemEventNotifier;
  if (!systemEventNotifier)
  {
    id v4 = -[NISystemEventNotifier initWithParentSession:]( objc_alloc(&OBJC_CLASS___NISystemEventNotifier),  "initWithParentSession:",  self);
    unsigned __int16 v5 = self->_systemEventNotifier;
    self->_systemEventNotifier = v4;

    systemEventNotifier = self->_systemEventNotifier;
  }

  return systemEventNotifier;
}

@end