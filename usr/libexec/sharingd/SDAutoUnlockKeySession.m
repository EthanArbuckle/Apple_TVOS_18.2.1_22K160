@interface SDAutoUnlockKeySession
- (BOOL)alerted;
- (BOOL)authenticatingForSiri;
- (BOOL)didDelayWorkDueToPowerAssertion;
- (BOOL)handleAWDLInfo:(id)a3;
- (BOOL)invalidated;
- (BOOL)keyInState;
- (BOOL)localDeviceNeedsArming;
- (BOOL)needsImageData;
- (BOOL)needsStrictMotionCheck;
- (BOOL)oldApproveProtocol;
- (BOOL)promptedForApproval;
- (BOOL)promptingForApproval;
- (BOOL)sentAWDLInfo;
- (BOOL)sessionCompleted;
- (BOOL)shouldAlertOnNotify;
- (BOOL)shouldDelayWorkDueToPowerAssertion;
- (BOOL)suppressWatchNotification;
- (BOOL)userRequestRequired;
- (BOOL)usingImageCache;
- (BOOL)wifiEnabled;
- (NSArray)peerList;
- (NSArray)wakeGestureDates;
- (NSData)authPromptIconHash;
- (NSData)proxyRequestData;
- (NSDate)phoneUnlockDate;
- (NSDate)unlockedOnWristDate;
- (NSMutableData)authPromptIconData;
- (NSNumber)unlockAllowed;
- (OS_dispatch_source)assertionTimer;
- (OS_os_transaction)transaction;
- (SDAutoUnlockKeySession)initWithBLEDevice:(id)a3 sessionID:(id)a4;
- (SDAutoUnlockMacIconCache)iconCache;
- (SDUnlockMotionDetector)motionDetector;
- (SDUnlockSessionKeyExchangeResponse)exchangeResponse;
- (id)wifiRequestStartedHandler;
- (int)errorRequestingUnlock;
- (int)powerAssertionState;
- (int64_t)remoteCacheID;
- (unsigned)powerAssertionID;
- (void)_invalidate;
- (void)addObservers;
- (void)alertOfUnlock;
- (void)createAuthTokenIfReady;
- (void)createWiFiRequest;
- (void)declareSystemActivityAssertion;
- (void)deviceDisconnected:(id)a3;
- (void)handleAuthPromptImageData:(id)a3;
- (void)handleAuthPromptRequest:(id)a3;
- (void)handleCleanUpAWDL;
- (void)handleMessageWithWrapper:(id)a3;
- (void)handleSessionKeyExchangeResponse:(id)a3;
- (void)handleUnlockConfirmation:(id)a3;
- (void)invalidate;
- (void)invalidateAssertionTimer;
- (void)invalidateOnQueue;
- (void)logAutoUnlockEnd;
- (void)logAutoUnlockStart;
- (void)notifyDelegateWithError:(id)a3;
- (void)nq_awdlNetworkStarted;
- (void)nq_handleWiFiRequestInvalidated;
- (void)nq_handleWiFiRequestStartedWithStartAWDLHandler:(id)a3;
- (void)postBeganUnlockingNotification;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)restartAssertionTimer;
- (void)sendAWDLInfoWithKeyData:(id)a3 error:(id)a4;
- (void)sendAuthPromptResponseWithData:(id)a3 error:(id)a4;
- (void)sendConfirmationACK;
- (void)sendKeyExchangeRequestWithData:(id)a3 error:(id)a4;
- (void)sendSessionAuthToken:(id)a3 error:(id)a4;
- (void)setAlerted:(BOOL)a3;
- (void)setAssertionTimer:(id)a3;
- (void)setAuthPromptIconData:(id)a3;
- (void)setAuthPromptIconHash:(id)a3;
- (void)setAuthenticatingForSiri:(BOOL)a3;
- (void)setDidDelayWorkDueToPowerAssertion:(BOOL)a3;
- (void)setErrorRequestingUnlock:(int)a3;
- (void)setExchangeResponse:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLocalDeviceNeedsArming:(BOOL)a3;
- (void)setMotionDetector:(id)a3;
- (void)setNeedsImageData:(BOOL)a3;
- (void)setNeedsStrictMotionCheck:(BOOL)a3;
- (void)setOldApproveProtocol:(BOOL)a3;
- (void)setPeerList:(id)a3;
- (void)setPhoneUnlockDate:(id)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setPowerAssertionState:(int)a3;
- (void)setPromptedForApproval:(BOOL)a3;
- (void)setPromptingForApproval:(BOOL)a3;
- (void)setProxyRequestData:(id)a3;
- (void)setRemoteCacheID:(int64_t)a3;
- (void)setSentAWDLInfo:(BOOL)a3;
- (void)setSessionCompleted:(BOOL)a3;
- (void)setShouldAlertOnNotify:(BOOL)a3;
- (void)setShouldDelayWorkDueToPowerAssertion:(BOOL)a3;
- (void)setSuppressWatchNotification:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setUnlockAllowed:(id)a3;
- (void)setUnlockedOnWristDate:(id)a3;
- (void)setUserRequestRequired:(BOOL)a3;
- (void)setUsingImageCache:(BOOL)a3;
- (void)setWakeGestureDates:(id)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)setWifiRequestStartedHandler:(id)a3;
- (void)systemIsActive:(id)a3;
@end

@implementation SDAutoUnlockKeySession

- (SDAutoUnlockKeySession)initWithBLEDevice:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SDAutoUnlockKeySession;
  v7 = -[SDAutoUnlockAuthSession initWithDevice:sessionID:bleDevice:]( &v22,  "initWithDevice:sessionID:bleDevice:",  0LL,  a4,  v6);
  v8 = v7;
  if (v7)
  {
    v7->_powerAssertionID = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cachedIDSDeviceIDsForBluetoothID:v10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    -[SDAutoUnlockPairingSession setDeviceID:](v8, "setDeviceID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceForBluetoothID:v15]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
      -[SDAutoUnlockPairingSession setDeviceID:](v8, "setDeviceID:", v17);
    }

    uint64_t v18 = auto_unlock_log(-[SDAutoUnlockKeySession addObservers](v8, "addObservers"));
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Key session initialized (device id: %@)",  buf,  0xCu);
    }
  }

  return v8;
}

- (void)invalidate
{
  uint64_t v3 = SFHighPriorityQueue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000178BC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)invalidateOnQueue
{
  uint64_t v3 = SFHighPriorityQueue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  -[SDAutoUnlockKeySession _invalidate](self, "_invalidate");
}

- (void)_invalidate
{
  if (!-[SDAutoUnlockKeySession invalidated](self, "invalidated"))
  {
    -[SDAutoUnlockKeySession setInvalidated:](self, "setInvalidated:", 1LL);
    -[SDAutoUnlockKeySession setSuppressWatchNotification:](self, "setSuppressWatchNotification:", 0LL);
    -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](self, "setDidDelayWorkDueToPowerAssertion:", 0LL);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession motionDetector](self, "motionDetector"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession motionDetector](self, "motionDetector"));
      [v4 invalidate];

      -[SDAutoUnlockKeySession setMotionDetector:](self, "setMotionDetector:", 0LL);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
    [v5 cancelWiFiRequest:v6];

    -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", 0LL);
    -[SDAutoUnlockKeySession removeObservers](self, "removeObservers");
    BOOL v7 = -[SDAutoUnlockKeySession promptingForApproval](self, "promptingForApproval");
    if (v7)
    {
      uint64_t v8 = auto_unlock_log(v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing authorization request", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
      [v10 removeAuthorizationRequestNotification];
    }

    sub_10008AAE4(0LL);
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___SDAutoUnlockKeySession;
    -[SDAutoUnlockAuthSession invalidate](&v13, "invalidate");
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017AB4;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(v11, block);
  }

- (BOOL)keyInState
{
  if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") != (id)2) {
    return 1;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v3 = [v2 deviceKeyBagDisabled];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v5 = [v4 watchWristState];

  if ((v3 & 1) == 0 && v5 != (id)1) {
    return 1;
  }
  uint64_t v8 = auto_unlock_log(v6);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = @"YES";
    if (v3) {
      v11 = @"NO";
    }
    else {
      v11 = @"YES";
    }
    if (v5 == (id)1) {
      v10 = @"NO";
    }
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Watch not in state. Passcode enabled: %@, wrist detection enabled: %@",  (uint8_t *)&v13,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v12 deleteEscrowSecretForPhones];

  return 0;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Auth key session notifying delegate with error: %@",  (uint8_t *)&v13,  0xCu);
  }

  if (!-[SDAutoUnlockKeySession sessionCompleted](self, "sessionCompleted"))
  {
    -[SDAutoUnlockKeySession setSessionCompleted:](self, "setSessionCompleted:", 1LL);
    BOOL v7 = -[SDAutoUnlockKeySession shouldAlertOnNotify](self, "shouldAlertOnNotify");
    if (v7)
    {
      uint64_t v8 = auto_unlock_log(v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Alerting on notify", (uint8_t *)&v13, 2u);
      }

      -[SDAutoUnlockKeySession alertOfUnlock](self, "alertOfUnlock");
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    char v11 = objc_opt_respondsToSelector(v10, "session:didCompleteWithError:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
      [v12 session:self didCompleteWithError:v4];
    }
  }
}

- (void)postBeganUnlockingNotification
{
  if (-[SDAutoUnlockAuthSession isAuthenticatingForSiri](self, "isAuthenticatingForSiri"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    [v4 showAuthenticatedSiriForDeviceID:v3];
  }

- (void)addObservers
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"deviceDisconnected:" name:SFBluetoothNotificationNameDisconnected object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"systemIsActive:" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"systemIsActive:" name:@"com.apple.sharingd.SystemWillNotSleep" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)deviceDisconnected:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v11 = auto_unlock_log(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BLE peer disconnected (identifier: %@)",  buf,  0xCu);
    }

    uint64_t v15 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = @"BLE Peer disconnected";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  186LL,  v16));
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
  }
}

- (void)systemIsActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "System is active", buf, 2u);
  }

  BOOL v7 = self;
  objc_sync_enter(v7);
  BOOL v8 = -[SDAutoUnlockKeySession didDelayWorkDueToPowerAssertion](v7, "didDelayWorkDueToPowerAssertion");
  BOOL v9 = v8;
  if (v8)
  {
    uint64_t v10 = auto_unlock_log(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning delayed work", buf, 2u);
    }

    -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](v7, "setDidDelayWorkDueToPowerAssertion:", 0LL);
  }

  -[SDAutoUnlockKeySession setShouldDelayWorkDueToPowerAssertion:](v7, "setShouldDelayWorkDueToPowerAssertion:", 0LL);
  objc_sync_exit(v7);

  if (v9)
  {
    uint64_t v14 = SFHighPriorityQueue(v12, v13);
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018258;
    block[3] = &unk_1005CB2F8;
    block[4] = v7;
    dispatch_async(v15, block);
  }
}

- (void)alertOfUnlock
{
  BOOL v3 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");
  if (v3
    || (BOOL v3 = -[SDAutoUnlockKeySession alerted](self, "alerted"))
    || (BOOL v3 = -[SDAutoUnlockKeySession suppressWatchNotification](self, "suppressWatchNotification")))
  {
    uint64_t v4 = auto_unlock_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Authorization allowed by request, not showing alert",  buf,  2u);
    }
  }

  else
  {
    -[SDAutoUnlockKeySession setAlerted:](self, "setAlerted:", 1LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    [v7 showUnlockedByDeviceNotificationWithDeviceID:v6];
  }

- (void)createWiFiRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDAutoUnlockAuthSession setAwdlStart:](self, "setAwdlStart:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession localAWDLInfo](self, "localAWDLInfo"));
  [v5 setObject:v6 forKeyedSubscript:@"AWDL_INFO_SELF"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dispatchQueue]);

  location[0] = 0LL;
  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10001861C;
  v29[3] = &unk_1005CB348;
  id v9 = v8;
  id v30 = v9;
  objc_copyWeak(&v31, location);
  uint64_t v10 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100018740;
  v25[3] = &unk_1005CB398;
  id v11 = v9;
  id v26 = v11;
  objc_copyWeak(&v28, location);
  v27 = self;
  uint64_t v12 = objc_retainBlock(v25);
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_100018940;
  objc_super v22 = &unk_1005CB3C0;
  id v13 = v11;
  id v23 = v13;
  objc_copyWeak(&v24, location);
  uint64_t v14 = objc_retainBlock(&v19);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___SDAutoUnlockWiFiRequest);
  v16 = -[SDAutoUnlockWiFiRequest initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:]( v15,  "initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rang ingStartedHandler:rangingCompletedHandler:invalidationHandler:",  v5,  0LL,  0LL,  v10,  v12,  0LL,  0LL,  0LL,  v14,  v19,  v20,  v21,  v22);
  -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
  NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
  [v17 scheduleWiFiRequest:v18];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)nq_awdlNetworkStarted
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 dispatchQueue]);
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = kdebug_trace(725286944LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 awdlInfo]);
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AWDL network up with info %@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v11 = auto_unlock_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    [v13 timeIntervalSinceDate:v14];
    int v16 = 134217984;
    v17 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Automation: AWDL started %0.2f",  (uint8_t *)&v16,  0xCu);
  }
}

- (void)nq_handleWiFiRequestStartedWithStartAWDLHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 dispatchQueue]);
  dispatch_assert_queue_V2(v6);

  -[SDAutoUnlockKeySession setWifiRequestStartedHandler:](self, "setWifiRequestStartedHandler:", v4);
  -[SDAutoUnlockKeySession createAuthTokenIfReady](self, "createAuthTokenIfReady");
}

- (void)nq_handleWiFiRequestInvalidated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 dispatchQueue]);
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10001C510();
  }
}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messageType];
  switch((int)v5)
  {
    case 8:
      uint64_t v6 = auto_unlock_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received SDUnlockSessionKeyExchangeResponse",  (uint8_t *)&v50,  2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockKeySession handleSessionKeyExchangeResponse:](self, "handleSessionKeyExchangeResponse:", v8);

      break;
    case 9:
    case 11:
    case 13:
      break;
    case 10:
      uint64_t v27 = auto_unlock_log(v5);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Received SDUnlockSessionConfirmation",  (uint8_t *)&v50,  2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      v29 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockKeySession handleUnlockConfirmation:](self, "handleUnlockConfirmation:", v29);

      break;
    case 12:
      sub_10008AAE4(1LL);
      uint64_t v31 = auto_unlock_log(v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Finished setting in progress",  (uint8_t *)&v50,  2u);
      }

      id v33 = [v4 hasSenderID];
      if ((_DWORD)v33)
      {
        v34 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v35 = objc_claimAutoreleasedReturnValue([v4 senderID]);
        v36 = -[NSUUID initWithUUIDBytes:](v34, "initWithUUIDBytes:", [v35 bytes]);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v36, "UUIDString"));
        -[SDAutoUnlockPairingSession setDeviceID:](self, "setDeviceID:", v37);

        uint64_t v39 = auto_unlock_log(v38);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          int v50 = 138412290;
          v51 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Key session received device id: %@",  (uint8_t *)&v50,  0xCu);
        }
      }

      uint64_t v42 = auto_unlock_log(v33);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockAuthPromptRequest",  (uint8_t *)&v50,  2u);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockKeySession handleAuthPromptRequest:](self, "handleAuthPromptRequest:", v44);

      break;
    case 14:
      uint64_t v45 = auto_unlock_log(v5);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockAuthPromptImageData",  (uint8_t *)&v50,  2u);
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockKeySession handleAuthPromptImageData:](self, "handleAuthPromptImageData:", v47);

      break;
    case 15:
      uint64_t v48 = auto_unlock_log(v5);
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockMessageTypeCleanUpAWDL",  (uint8_t *)&v50,  2u);
      }

      -[SDAutoUnlockKeySession handleCleanUpAWDL](self, "handleCleanUpAWDL");
      break;
    default:
      if ((_DWORD)v5 == 301)
      {
        sub_10008AAE4(1LL);
        uint64_t v10 = auto_unlock_log(v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v50) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Finished setting in progress",  (uint8_t *)&v50,  2u);
        }

        id v12 = [v4 hasSenderID];
        if ((_DWORD)v12)
        {
          id v13 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v14 = objc_claimAutoreleasedReturnValue([v4 senderID]);
          uint64_t v15 = -[NSUUID initWithUUIDBytes:](v13, "initWithUUIDBytes:", [v14 bytes]);
          int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v15, "UUIDString"));
          -[SDAutoUnlockPairingSession setDeviceID:](self, "setDeviceID:", v16);

          uint64_t v18 = auto_unlock_log(v17);
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
            int v50 = 138412290;
            v51 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Key session received device id: %@",  (uint8_t *)&v50,  0xCu);
          }
        }

        uint64_t v21 = auto_unlock_log(v12);
        objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
          int v50 = 138412290;
          v51 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockMessageTypeAWDLInfo %@",  (uint8_t *)&v50,  0xCu);
        }

        kdebug_trace(725286920LL, 0LL, 0LL, 0LL, 0LL);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
        unsigned int v25 = -[SDAutoUnlockKeySession handleAWDLInfo:](self, "handleAWDLInfo:", v24);

        if (v25)
        {
          -[SDAutoUnlockKeySession postBeganUnlockingNotification](self, "postBeganUnlockingNotification");
          id v26 = self;
          objc_sync_enter(v26);
          if (-[SDAutoUnlockKeySession shouldDelayWorkDueToPowerAssertion](v26, "shouldDelayWorkDueToPowerAssertion"))
          {
            -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:]( v26,  "setDidDelayWorkDueToPowerAssertion:",  1LL);
            objc_sync_exit(v26);
          }

          else
          {
            objc_sync_exit(v26);

            -[SDAutoUnlockKeySession beginAKSSession](v26, "beginAKSSession");
          }
        }
      }

      break;
  }
}

- (BOOL)handleAWDLInfo:(id)a3
{
  id v4 = a3;
  id v5 = -[SDAutoUnlockAWDLInfo initWithData:](objc_alloc(&OBJC_CLASS___SDAutoUnlockAWDLInfo), "initWithData:", v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo awdlInfo](v5, "awdlInfo"));
  id v7 = sub_100089EF4(v6);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    id v10 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
    if ((_DWORD)v10 == 1)
    {
      uint64_t v11 = auto_unlock_log(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", v53, 2u);
      }

      uint64_t v13 = 0LL;
    }

    else
    {
      id v36 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
      int v37 = (int)v36;
      uint64_t v38 = auto_unlock_log(v36);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      BOOL v39 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v37 == 4LL)
      {
        if (v39)
        {
          *(_WORD *)v53 = 0;
          uint64_t v13 = 2LL;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using attested protocol", v53, 2u);
        }

        else
        {
          uint64_t v13 = 2LL;
        }
      }

      else
      {
        if (v39)
        {
          *(_WORD *)v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using modern protocol", v53, 2u);
        }

        uint64_t v13 = 1LL;
      }
    }

    -[SDAutoUnlockAuthSession setProtocol:](self, "setProtocol:", v13);
    -[SDAutoUnlockKeySession logAutoUnlockStart](self, "logAutoUnlockStart");
    -[SDAutoUnlockKeySession declareSystemActivityAssertion](self, "declareSystemActivityAssertion");
    if (-[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken")) {
      BOOL v40 = -[SDAutoUnlockAWDLInfo useToken](v5, "useToken");
    }
    else {
      BOOL v40 = 0LL;
    }
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", v40);
    -[SDAutoUnlockAuthSession setRemoteAWDLInfo:](self, "setRemoteAWDLInfo:", v8);
    if (-[SDAutoUnlockAWDLInfo authPrompt](v5, "authPrompt")) {
      uint64_t v41 = 2LL;
    }
    else {
      uint64_t v41 = 1LL;
    }
    -[SDAutoUnlockAuthSession setAttemptType:](self, "setAttemptType:", v41);
    if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2)
    {
      -[SDAutoUnlockKeySession setOldApproveProtocol:](self, "setOldApproveProtocol:", 1LL);
      -[SDAutoUnlockKeySession setUserRequestRequired:](self, "setUserRequestRequired:", 1LL);
    }

    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v42);

    -[SDAutoUnlockAWDLInfo phoneUnlockDate](v5, "phoneUnlockDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[SDAutoUnlockKeySession setPhoneUnlockDate:](self, "setPhoneUnlockDate:", v43);

    if (-[SDAutoUnlockAWDLInfo hasIsAuthenticatingForSiri](v5, "hasIsAuthenticatingForSiri")) {
      BOOL v44 = -[SDAutoUnlockAWDLInfo isAuthenticatingForSiri](v5, "isAuthenticatingForSiri");
    }
    else {
      BOOL v44 = 0LL;
    }
    -[SDAutoUnlockKeySession setAuthenticatingForSiri:](self, "setAuthenticatingForSiri:", v44);
    if (-[SDAutoUnlockAWDLInfo hasSkipMotionCheck](v5, "hasSkipMotionCheck")) {
      BOOL v45 = -[SDAutoUnlockAWDLInfo skipMotionCheck](v5, "skipMotionCheck");
    }
    else {
      BOOL v45 = 0LL;
    }
    -[SDAutoUnlockAuthSession setSkipMotionCheck:](self, "setSkipMotionCheck:", v45);
    if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") != (id)4
      || !-[SDAutoUnlockKeySession localDeviceNeedsArming](self, "localDeviceNeedsArming"))
    {
      BOOL v51 = 1;
      goto LABEL_39;
    }

    uint64_t v46 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    v55 = @"Key Needs To Be Armed";
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v46,  213LL,  v47));

    uint64_t v49 = auto_unlock_log(v48);
    int v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10001C614();
    }

    -[SDAutoUnlockKeySession sendKeyExchangeRequestWithData:error:]( self,  "sendKeyExchangeRequestWithData:error:",  0LL,  v35);
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  }

  else
  {
    uint64_t v14 = auto_unlock_log(v9);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001C5AC(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v24 = auto_unlock_log(v23);
    unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10001C53C(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    uint64_t v33 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    v57 = @"AWDL Info Failure";
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  114LL,  v34));
  }

  -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v35);

  BOOL v51 = 0;
LABEL_39:

  return v51;
}

- (void)handleAuthPromptRequest:(id)a3
{
  id v4 = a3;
  id v5 = -[SDAutoUnlockAuthPromptRequest initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAuthPromptRequest),  "initWithData:",  v4);
  BOOL v6 = -[SDAutoUnlockAuthPromptRequest hasIconHash](v5, "hasIconHash");
  if (v6)
  {
    -[SDAutoUnlockKeySession logAutoUnlockStart](self, "logAutoUnlockStart");
    -[SDAutoUnlockKeySession declareSystemActivityAssertion](self, "declareSystemActivityAssertion");
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", 0LL);
    -[SDAutoUnlockAuthSession setAttemptType:](self, "setAttemptType:", 2LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v7);

    -[SDAutoUnlockKeySession setUserRequestRequired:](self, "setUserRequestRequired:", 1LL);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest navBarTitle](v5, "navBarTitle"));
    -[SDAutoUnlockAuthSession setNavBarTitle:](self, "setNavBarTitle:", v8);

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockMacIconCache);
    -[SDAutoUnlockKeySession setIconCache:](self, "setIconCache:", v9);

    uint64_t v10 = sub_10008E24C(@"AUDisableIconCache", 0LL);
    if ((_DWORD)v10)
    {
      uint64_t v11 = auto_unlock_log(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Image caching disabled", v26, 2u);
      }
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession iconCache](self, "iconCache"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest iconHash](v5, "iconHash"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v17 iconImageDataForHash:v18]);

      if (v13)
      {
        uint64_t v20 = auto_unlock_log(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Prompting with cached image", v26, 2u);
        }

        -[SDAutoUnlockKeySession setUsingImageCache:](self, "setUsingImageCache:", 1LL);
        uint64_t v22 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v13);
        -[SDAutoUnlockKeySession setAuthPromptIconData:](self, "setAuthPromptIconData:", v22);

        -[SDAutoUnlockKeySession promptForApproval](self, "promptForApproval");
        goto LABEL_14;
      }
    }

    -[SDAutoUnlockKeySession setNeedsImageData:](self, "setNeedsImageData:", 1LL);
    uint64_t v13 = 0LL;
LABEL_14:
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest iconHash](v5, "iconHash"));
    -[SDAutoUnlockKeySession setAuthPromptIconHash:](self, "setAuthPromptIconHash:", v23);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v24);

    unsigned int v25 = self;
    objc_sync_enter(v25);
    if (-[SDAutoUnlockKeySession shouldDelayWorkDueToPowerAssertion](v25, "shouldDelayWorkDueToPowerAssertion"))
    {
      -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](v25, "setDidDelayWorkDueToPowerAssertion:", 1LL);
      objc_sync_exit(v25);
    }

    else
    {
      objc_sync_exit(v25);

      -[SDAutoUnlockKeySession beginAKSSession](v25, "beginAKSSession");
    }

    goto LABEL_17;
  }

  uint64_t v14 = auto_unlock_log(v6);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10001C640((uint64_t)v5, v15);
  }

  NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
  uint64_t v28 = @"Auth prompt request missing info";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  114LL,  v16));

  -[SDAutoUnlockKeySession sendAuthPromptResponseWithData:error:]( self,  "sendAuthPromptResponseWithData:error:",  0LL,  v13);
LABEL_17:
}

- (void)handleAuthPromptImageData:(id)a3
{
  id v4 = a3;
  id v5 = -[SDAutoUnlockAuthPromptImageData initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAuthPromptImageData),  "initWithData:",  v4);

  BOOL v6 = -[SDAutoUnlockAuthPromptImageData hasImageData](v5, "hasImageData");
  if (!v6)
  {
    uint64_t v10 = auto_unlock_log(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001C6F0();
    }
    goto LABEL_7;
  }

  BOOL v7 = -[SDAutoUnlockKeySession usingImageCache](self, "usingImageCache");
  if (v7)
  {
    uint64_t v8 = auto_unlock_log(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001C6C4();
    }
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));

  if (!v11)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[SDAutoUnlockKeySession setAuthPromptIconData:](self, "setAuthPromptIconData:", v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData imageData](v5, "imageData"));
  [v13 appendData:v14];

  uint64_t v16 = auto_unlock_log(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData imageData](v5, "imageData"));
    id v19 = [v18 length];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
    int v21 = 134218240;
    id v22 = v19;
    __int16 v23 = 2048;
    id v24 = [v20 length];
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received image data (length: %ld, total: %ld)",  (uint8_t *)&v21,  0x16u);
  }

  if (-[SDAutoUnlockAuthPromptImageData finalMessage](v5, "finalMessage")) {
    -[SDAutoUnlockKeySession promptForApproval](self, "promptForApproval");
  }
LABEL_8:
}

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  kdebug_trace(725286932LL, 0LL, 0LL, 0LL, 0LL);
  id v5 = -[SDUnlockSessionKeyExchangeResponse initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionKeyExchangeResponse),  "initWithData:",  v4);

  if (-[SDUnlockSessionKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    -[SDAutoUnlockKeySession setExchangeResponse:](self, "setExchangeResponse:", v5);
    if (-[SDUnlockSessionKeyExchangeResponse version](v5, "version") >= 2
      && -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
    {
      -[SDAutoUnlockKeySession createAuthTokenIfReady](self, "createAuthTokenIfReady");
    }

    else
    {
      -[SDAutoUnlockKeySession createWiFiRequest](self, "createWiFiRequest");
    }
  }

  else
  {
    BOOL v6 = -[SDUnlockSessionKeyExchangeResponse hasKeyFailed](v5, "hasKeyFailed");
    if (v6 && (BOOL v6 = -[SDUnlockSessionKeyExchangeResponse keyFailed](v5, "keyFailed"))) {
      uint64_t v7 = 101LL;
    }
    else {
      uint64_t v7 = 103LL;
    }
    uint64_t v8 = auto_unlock_log(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001C750();
    }

    uint64_t v10 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    uint64_t v14 = @"Exchange response failed";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v7,  v11));

    -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", 0LL, v12);
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);
  }
}

- (void)createAuthTokenIfReady
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
  if (!v4) {
    goto LABEL_9;
  }
  unsigned int v5 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");
  if (v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
    if ([v2 BOOLValue])
    {

LABEL_22:
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 key]);
      id v51 = 0LL;
      unsigned int v23 = [v20 stepSessionWithData:v22 outputData:&v51];
      NSErrorUserInfoKey v13 = (__CFString *)v51;

      if (v23)
      {
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
        if ([v25 version] < 2)
        {
        }

        else
        {
          unsigned int v26 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");

          if (v26)
          {
            uint64_t v28 = auto_unlock_log(v27);
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              sub_10001C810();
            }

            -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", v13, 0LL);
            goto LABEL_42;
          }
        }

        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 generateSessionToken]);
        -[SDAutoUnlockAuthSession setSessionRangingKey:](self, "setSessionRangingKey:", v36);

        int v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
        if (v37)
        {
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
          BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession peerListFromAWDLInfo:](self, "peerListFromAWDLInfo:", v39));
          -[SDAutoUnlockKeySession setPeerList:](self, "setPeerList:", v40);

          uint64_t v18 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockRangingPeer);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession peerList](self, "peerList"));
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
          -[SDAutoUnlockRangingPeer setNiRangingPeer:](v18, "setNiRangingPeer:", v42);

          v43 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockWiFiManager sharedManager]( &OBJC_CLASS___SDAutoUnlockWiFiManager,  "sharedManager"));
          BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
          [v43 updateWiFiRequest:v44 setRangingPeer:v18];

          uint64_t v46 = auto_unlock_log(v45);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            sub_10001C89C();
          }

          -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", v13, 0LL);
          goto LABEL_41;
        }

        uint64_t v48 = auto_unlock_log(v38);
        uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_10001C870();
        }

        uint64_t v32 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
        v57 = @"Failed to generate ranging session token";
        uint64_t v33 = &v57;
        v34 = &v56;
      }

      else
      {
        uint64_t v30 = auto_unlock_log(v24);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_10001C8FC();
        }

        uint64_t v32 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
        v55 = @"Creating auth token failed";
        uint64_t v33 = &v55;
        v34 = &v54;
      }

      int v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v34,  1LL));
      uint64_t v18 = (SDAutoUnlockRangingPeer *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v32,  101LL,  v50));

LABEL_40:
      -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", 0LL, v18);
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
LABEL_41:

LABEL_42:
      return;
    }

    if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
    {

      goto LABEL_9;
    }
  }

  else if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
  {
LABEL_9:

    goto LABEL_10;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession wifiRequestStartedHandler](self, "wifiRequestStartedHandler"));

  if (v5) {
  if (v19)
  }
    goto LABEL_22;
LABEL_10:
  if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
      unsigned __int8 v9 = [v8 BOOLValue];

      if ((v9 & 1) == 0)
      {
        unsigned int v10 = -[SDAutoUnlockKeySession errorRequestingUnlock](self, "errorRequestingUnlock");
        uint64_t v11 = @"Error posting authorization request";
        if (v10)
        {
          uint64_t v12 = 180LL;
        }

        else
        {
          uint64_t v11 = @"User denied authorization request";
          uint64_t v12 = 179LL;
        }

        NSErrorUserInfoKey v13 = v11;
        uint64_t v14 = auto_unlock_log(v13);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10001C7B0();
        }

        uint64_t v16 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
        v53 = v13;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
        uint64_t v18 = (SDAutoUnlockRangingPeer *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  v12,  v17));

        goto LABEL_40;
      }
    }
  }

- (void)handleUnlockConfirmation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SDUnlockSessionConfirmation initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionConfirmation),  "initWithData:",  v4);

  BOOL v6 = -[SDUnlockSessionConfirmation success](v5, "success");
  if (v6)
  {
    -[SDAutoUnlockKeySession setSuppressWatchNotification:]( self,  "setSuppressWatchNotification:",  -[SDUnlockSessionConfirmation suppressNotification](v5, "suppressNotification"));
    if (-[SDUnlockSessionConfirmation hasSupportsACK](v5, "hasSupportsACK")
      && -[SDUnlockSessionConfirmation supportsACK](v5, "supportsACK"))
    {
      -[SDAutoUnlockKeySession sendConfirmationACK](self, "sendConfirmationACK");
      char v7 = 1;
    }

    else
    {
      char v7 = 0;
    }

    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    -[SDAutoUnlockAuthSession setAksSuccess:](self, "setAksSuccess:", [v13 confirmSession]);

    uint64_t v15 = auto_unlock_log(v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = -[SDAutoUnlockAuthSession aksSuccess](self, "aksSuccess");
      uint64_t v18 = @"NO";
      if (v17) {
        uint64_t v18 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session confirmed %@", buf, 0xCu);
    }

    if (!-[SDAutoUnlockKeySession usingImageCache](self, "usingImageCache"))
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconHash](self, "authPromptIconHash"));

        if (v21)
        {
          uint64_t v23 = auto_unlock_log(v22);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Caching image for app %@", buf, 0xCu);
          }

          iconCache = self->_iconCache;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconHash](self, "authPromptIconHash"));
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
          -[SDAutoUnlockMacIconCache cacheIconImageData:hash:appName:]( iconCache,  "cacheIconImageData:hash:appName:",  v27,  v28,  v29);
        }
      }
    }

    if ((v7 & 1) == 0) {
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL);
    }
  }

  else
  {
    uint64_t v8 = auto_unlock_log(v6);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001C928();
    }

    uint64_t v10 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    uint64_t v31 = @"Confirmation failed";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  101LL,  v11));
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);
  }
}

- (void)handleCleanUpAWDL
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
  [v3 cancelWiFiRequest:v4];

  -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", 0LL);
}

- (void)sendAWDLInfoWithKeyData:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (uint64_t)a4;
  if (!v7)
  {
    if (-[SDAutoUnlockKeySession wifiEnabled](self, "wifiEnabled")
      || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor")),
          unsigned __int8 v9 = [v8 wirelessEnabled],
          v8,
          (v9 & 1) != 0))
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      uint64_t v11 = auto_unlock_log(v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001C980();
      }

      uint64_t v13 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      uint64_t v32 = @"WiFi interface disabled on Watch";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  199LL,  v14));
    }
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlInfoData](self, "awdlInfoData"));
  uint64_t v16 = (void *)v15;
  if (!(v15 | v7))
  {
    uint64_t v17 = auto_unlock_log(v15);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001C954();
    }

    uint64_t v19 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v30 = @"Failed to serialize AWDL Info";
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  114LL,  v20));
  }

  uint64_t v21 = auto_unlock_log(v15);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
  }

  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockAWDLInfo);
  -[SDAutoUnlockAWDLInfo setVersion:](v23, "setVersion:", 3LL);
  -[SDAutoUnlockAWDLInfo setAwdlInfo:](v23, "setAwdlInfo:", v16);
  -[SDAutoUnlockAWDLInfo setUseToken:](v23, "setUseToken:", -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"));
  -[SDAutoUnlockAWDLInfo setKeyData:](v23, "setKeyData:", v6);
  -[SDAutoUnlockAWDLInfo setSupportsConfirmationACK:](v23, "setSupportsConfirmationACK:", 1LL);
  if (v7) {
    -[SDAutoUnlockAWDLInfo setErrorCode:](v23, "setErrorCode:", [(id)v7 code]);
  }
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo data](v23, "data"));
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v24, 301LL));

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10001AAA8;
  v27[3] = &unk_1005CB3E8;
  v27[4] = self;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:]( self,  "sendData:bleDevice:direct:completionHandler:",  v25,  v26,  1LL,  v27);

  if (v7)
  {
    if (!v16) {
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v7);
    }
  }

  else
  {
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)15LL));
  }

  kdebug_trace(725286924LL, 0LL, 0LL, 0LL, 0LL);
}

- (void)sendAuthPromptResponseWithData:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockAuthPromptResponse);
  -[SDAutoUnlockAuthPromptResponse setVersion:](v8, "setVersion:", 1LL);
  -[SDAutoUnlockAuthPromptResponse setKeyData:](v8, "setKeyData:", v7);

  id v9 = -[SDAutoUnlockAuthPromptResponse setNeedsImageData:]( v8,  "setNeedsImageData:",  -[SDAutoUnlockKeySession needsImageData](self, "needsImageData"));
  if (v6) {
    id v9 = -[SDAutoUnlockAuthPromptResponse setErrorCode:](v8, "setErrorCode:", [v6 code]);
  }
  uint64_t v10 = auto_unlock_log(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending SDAutoUnlockAuthPromptResponse",  buf,  2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptResponse data](v8, "data"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001AD54;
  v13[3] = &unk_1005CB3E8;
  v13[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v12, 13LL, v13);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)15LL));
}

- (void)sendKeyExchangeRequestWithData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest);
  -[SDUnlockSessionKeyExchangeRequest setVersion:](v8, "setVersion:", 1LL);
  id v9 = -[SDUnlockSessionKeyExchangeRequest setUsingRecord:]( v8,  "setUsingRecord:",  -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken") ^ 1);
  if (v6) {
    id v9 = -[SDUnlockSessionKeyExchangeRequest setKey:](v8, "setKey:", v6);
  }
  if (v7) {
    id v9 = -[SDUnlockSessionKeyExchangeRequest setErrorCode:](v8, "setErrorCode:", [v7 code]);
  }
  uint64_t v10 = auto_unlock_log(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending SDUnlockSessionKeyExchangeRequest",  buf,  2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v8, "data"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001AFF4;
  v13[3] = &unk_1005CB3E8;
  v13[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v12, 7LL, v13);

  kdebug_trace(725286928LL, 0LL, 0LL, 0LL, 0LL);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)15LL));
}

- (void)sendSessionAuthToken:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___SDUnlockSessionAuthToken);
  id v9 = -[SDUnlockSessionAuthToken setVersion:](v8, "setVersion:", 2LL);
  if (v6) {
    id v9 = -[SDUnlockSessionAuthToken setAuthToken:](v8, "setAuthToken:", v6);
  }
  if (v7) {
    id v9 = -[SDUnlockSessionAuthToken setErrorCode:](v8, "setErrorCode:", [v7 code]);
  }
  uint64_t v10 = auto_unlock_log(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionAuthToken", buf, 2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken data](v8, "data"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v12, 9LL));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001B2D8;
  v17[3] = &unk_1005CB410;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:]( self,  "sendData:bleDevice:direct:completionHandler:",  v13,  v14,  1LL,  v17);

  kdebug_trace(725286936LL, 0LL, 0LL, 0LL, 0LL);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)15LL));
}

- (void)sendConfirmationACK
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionConfirmationACK);
  -[SDAutoUnlockSessionConfirmationACK setVersion:](v3, "setVersion:", 1LL);
  -[SDAutoUnlockSessionConfirmationACK setSuccess:](v3, "setSuccess:", 1LL);
  uint64_t v4 = auto_unlock_log(-[SDAutoUnlockKeySession setShouldAlertOnNotify:](self, "setShouldAlertOnNotify:", 1LL));
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending SDAutoUnlockSessionConfirmationACK",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionConfirmationACK data](v3, "data"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v6, 11LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001B5F0;
  v9[3] = &unk_1005CB3E8;
  v9[4] = self;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:]( self,  "sendData:bleDevice:direct:completionHandler:",  v7,  v8,  1LL,  v9);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)2LL));
}

- (void)declareSystemActivityAssertion
{
  BOOL v3 = (OS_os_transaction *)os_transaction_create("SDAutoUnlockKeySession");
  transaction = self->_transaction;
  self->_transaction = v3;

  p_powerAssertionID = &self->_powerAssertionID;
  if (self->_powerAssertionID)
  {
    uint64_t v7 = auto_unlock_log(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Grabbing assertion we already have",  (uint8_t *)&v23,  2u);
    }
  }

  else
  {
    p_powerAssertionState = &self->_powerAssertionState;
    self->_powerAssertionState = 1;
    uint64_t v10 = auto_unlock_log(v5);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Grabbing system activity assertion for Auto Unlock key session",  (uint8_t *)&v23,  2u);
    }

    uint64_t v12 = IOPMAssertionDeclareSystemActivity( @"AutoUnlock-Key",  &self->_powerAssertionID,  &self->_powerAssertionState);
    if ((_DWORD)v12 && *p_powerAssertionState)
    {
      int v13 = v12;
      uint64_t v14 = auto_unlock_log(v12);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10001CA6C(v13, v15);
      }

      unsigned int *p_powerAssertionID = 0;
      -[SDAutoUnlockKeySession releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
    }

    else
    {
      uint64_t v16 = auto_unlock_log(v12);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *p_powerAssertionID;
        int v19 = *p_powerAssertionState;
        int v23 = 134218240;
        uint64_t v24 = v18;
        __int16 v25 = 1024;
        int v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Power assertion (assertion %ld, state %d)",  (uint8_t *)&v23,  0x12u);
      }

      if (*p_powerAssertionState)
      {
        uint64_t v20 = auto_unlock_log( -[SDAutoUnlockKeySession setShouldDelayWorkDueToPowerAssertion:]( self,  "setShouldDelayWorkDueToPowerAssertion:",  1LL));
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *p_powerAssertionState;
          int v23 = 67109120;
          LODWORD(v24) = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "System wake scheduled for key session (state %d)",  (uint8_t *)&v23,  8u);
        }
      }

      -[SDAutoUnlockKeySession restartAssertionTimer](self, "restartAssertionTimer");
    }
  }

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    uint64_t v3 = auto_unlock_log(self);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing key power assertion", v6, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
  }

  transaction = self->_transaction;
  self->_transaction = 0LL;
}

- (void)restartAssertionTimer
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting assertion timer", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  if (!v5)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001BA88;
    v12[3] = &unk_1005CB2F8;
    v12[4] = self;
    uint64_t v7 = sub_100114598(0, v6, v12);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDAutoUnlockKeySession setAssertionTimer:](self, "setAssertionTimer:", v8);

    id v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
    dispatch_resume(v9);
  }

  uint64_t v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  dispatch_time_t v11 = sub_100114580(20.0);
  sub_100114638(v10, v11);
}

- (void)invalidateAssertionTimer
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating aggressive advertising timer",  v7,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockKeySession setAssertionTimer:](self, "setAssertionTimer:", 0LL);
  }

- (void)logAutoUnlockStart
{
  uint64_t v3 = sub_10008AEC8(1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
  id v6 = @"Mac";
  if (v5 == 2) {
    id v6 = @"Phone";
  }
  v13[0] = @"Start";
  v12[0] = @"State";
  v12[1] = @"DeviceID";
  uint64_t v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  v12[2] = @"UnlockPeerType";
  v13[1] = v10;
  v13[2] = v7;
  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));

  SFPowerLogTimeSensitiveEvent(v4, v11);
}

- (void)logAutoUnlockEnd
{
  uint64_t v3 = sub_10008AEC8(1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
  id v6 = @"Mac";
  if (v5 == 2) {
    id v6 = @"Phone";
  }
  v14[0] = @"End";
  v13[0] = @"State";
  v13[1] = @"DeviceID";
  uint64_t v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  v14[1] = v10;
  v14[2] = v7;
  v13[2] = @"UnlockPeerType";
  void v13[3] = @"Success";
  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDAutoUnlockKeySession alerted](self, "alerted")));
  v14[3] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

  SFPowerLogTimeSensitiveEvent(v4, v12);
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
}

- (NSDate)unlockedOnWristDate
{
  return self->_unlockedOnWristDate;
}

- (void)setUnlockedOnWristDate:(id)a3
{
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (BOOL)localDeviceNeedsArming
{
  return self->_localDeviceNeedsArming;
}

- (void)setLocalDeviceNeedsArming:(BOOL)a3
{
  self->_localDeviceNeedsArming = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSDate)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (void)setPhoneUnlockDate:(id)a3
{
}

- (BOOL)sentAWDLInfo
{
  return self->_sentAWDLInfo;
}

- (void)setSentAWDLInfo:(BOOL)a3
{
  self->_sentAWDLInfo = a3;
}

- (BOOL)userRequestRequired
{
  return self->_userRequestRequired;
}

- (void)setUserRequestRequired:(BOOL)a3
{
  self->_userRequestRequired = a3;
}

- (BOOL)sessionCompleted
{
  return self->_sessionCompleted;
}

- (void)setSessionCompleted:(BOOL)a3
{
  self->_sessionCompleted = a3;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (void)setAlerted:(BOOL)a3
{
  self->_alerted = a3;
}

- (BOOL)shouldAlertOnNotify
{
  return self->_shouldAlertOnNotify;
}

- (void)setShouldAlertOnNotify:(BOOL)a3
{
  self->_shouldAlertOnNotify = a3;
}

- (BOOL)promptedForApproval
{
  return self->_promptedForApproval;
}

- (void)setPromptedForApproval:(BOOL)a3
{
  self->_promptedForApproval = a3;
}

- (BOOL)promptingForApproval
{
  return self->_promptingForApproval;
}

- (void)setPromptingForApproval:(BOOL)a3
{
  self->_promptingForApproval = a3;
}

- (BOOL)oldApproveProtocol
{
  return self->_oldApproveProtocol;
}

- (void)setOldApproveProtocol:(BOOL)a3
{
  self->_oldApproveProtocol = a3;
}

- (NSNumber)unlockAllowed
{
  return self->_unlockAllowed;
}

- (void)setUnlockAllowed:(id)a3
{
}

- (int)errorRequestingUnlock
{
  return self->_errorRequestingUnlock;
}

- (void)setErrorRequestingUnlock:(int)a3
{
  self->_errorRequestingUnlock = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (int)powerAssertionState
{
  return self->_powerAssertionState;
}

- (void)setPowerAssertionState:(int)a3
{
  self->_powerAssertionState = a3;
}

- (id)wifiRequestStartedHandler
{
  return self->_wifiRequestStartedHandler;
}

- (void)setWifiRequestStartedHandler:(id)a3
{
}

- (int64_t)remoteCacheID
{
  return self->_remoteCacheID;
}

- (void)setRemoteCacheID:(int64_t)a3
{
  self->_remoteCacheID = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
}

- (NSData)proxyRequestData
{
  return self->_proxyRequestData;
}

- (void)setProxyRequestData:(id)a3
{
}

- (OS_dispatch_source)assertionTimer
{
  return self->_assertionTimer;
}

- (void)setAssertionTimer:(id)a3
{
}

- (SDUnlockSessionKeyExchangeResponse)exchangeResponse
{
  return self->_exchangeResponse;
}

- (void)setExchangeResponse:(id)a3
{
}

- (NSMutableData)authPromptIconData
{
  return self->_authPromptIconData;
}

- (void)setAuthPromptIconData:(id)a3
{
}

- (SDAutoUnlockMacIconCache)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
}

- (NSData)authPromptIconHash
{
  return self->_authPromptIconHash;
}

- (void)setAuthPromptIconHash:(id)a3
{
}

- (BOOL)needsImageData
{
  return self->_needsImageData;
}

- (void)setNeedsImageData:(BOOL)a3
{
  self->_needsImageData = a3;
}

- (BOOL)usingImageCache
{
  return self->_usingImageCache;
}

- (void)setUsingImageCache:(BOOL)a3
{
  self->_usingImageCache = a3;
}

- (BOOL)shouldDelayWorkDueToPowerAssertion
{
  return self->_shouldDelayWorkDueToPowerAssertion;
}

- (void)setShouldDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_shouldDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)didDelayWorkDueToPowerAssertion
{
  return self->_didDelayWorkDueToPowerAssertion;
}

- (void)setDidDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_didDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)suppressWatchNotification
{
  return self->_suppressWatchNotification;
}

- (void)setSuppressWatchNotification:(BOOL)a3
{
  self->_suppressWatchNotification = a3;
}

- (BOOL)authenticatingForSiri
{
  return self->_authenticatingForSiri;
}

- (void)setAuthenticatingForSiri:(BOOL)a3
{
  self->_authenticatingForSiri = a3;
}

- (SDUnlockMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end