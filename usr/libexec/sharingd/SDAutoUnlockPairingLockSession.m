@interface SDAutoUnlockPairingLockSession
+ (int64_t)setupRequestVersion;
- (BOOL)canceled;
- (BOOL)keyDeviceLocked;
- (BOOL)ltkHashMatches;
- (BOOL)placeholder;
- (BOOL)receivedSetupACK;
- (BOOL)receivedTokenACK;
- (BOOL)setupRetryDevice;
- (BOOL)unlockEnabled;
- (BOOL)upsellDevice;
- (BOOL)useAttestedProtocol;
- (BOOL)validatePasscode:(id)a3;
- (BOOL)waitingForCloudPairing;
- (NSData)remoteLTKHash;
- (NSDate)keyExchangeDate;
- (NSDate)tokenExchangeDate;
- (NSError)setupError;
- (NSString)companionDeviceModel;
- (NSString)keyDeviceModel;
- (NSString)passcode;
- (NSString)setupMessageIdentifier;
- (NSString)tokenMessageIdentifier;
- (NSString)watchBuildVersion;
- (NSString)watchOSVersion;
- (OS_dispatch_source)ltkTimer;
- (SDAutoUnlockPairingLockSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDUnlockSetupSessionCreated)sessionCreatedMessage;
- (double)keyExchangeInterval;
- (double)tokenExchangeInterval;
- (id)generatedError;
- (id)userInfoCompanionViewNotSyncing;
- (id)userInfoForInternetSharing;
- (id)userInfoForKeychainMismatch;
- (id)userInfoForMacNotSignedIn;
- (id)userInfoForMissingLTK;
- (id)userInfoForNewProtocol;
- (id)userInfoForNoCommunincation;
- (id)userInfoForNoPasscode;
- (id)userInfoForNoWristDetection;
- (id)userInfoForNoWristDetectionNoPasscode;
- (id)userInfoForNotCloudPaired;
- (id)userInfoForOldProtocol;
- (id)userInfoForWatchLocked;
- (id)userInfoForWatchNotSignedIn;
- (id)userInfoForiPhoneNeedsUnlock;
- (int)watchNewLTKSyncStatus;
- (int)watchOldLTKSyncStatus;
- (int64_t)ltkTimerRetryCount;
- (int64_t)messageTimeout;
- (int64_t)messageTimeoutFromServer;
- (int64_t)responseTimeout;
- (int64_t)responseTimeoutFromServer;
- (int64_t)sendState;
- (unsigned)errorType;
- (void)cancel;
- (void)handleDeviceAuthenticationSetupRequest;
- (void)handleEscrowSessionRequest;
- (void)handleKeyDeviceLocked;
- (void)handleLTKTimerFired;
- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5;
- (void)handleSetupCreateRecord:(id)a3;
- (void)handleSetupSessionCreated:(id)a3 fromDeviceID:(id)a4;
- (void)handleSuccessfulPairing;
- (void)handleTimerFired;
- (void)invalidate;
- (void)invalidateLTKTimer;
- (void)notifyDelegateKeyDeviceIsLocked;
- (void)notifyDelegateWithError:(id)a3;
- (void)onqueue_cancel;
- (void)onqueue_start;
- (void)onqueue_updateForCloudPairing;
- (void)restartLTKTimer;
- (void)sendCreateSecretWithStepData:(id)a3 sessionID:(unsigned int)a4;
- (void)sendSetupRequest;
- (void)setCanceled:(BOOL)a3;
- (void)setCompanionDeviceModel:(id)a3;
- (void)setErrorType:(unsigned int)a3;
- (void)setKeyDeviceLocked:(BOOL)a3;
- (void)setKeyDeviceModel:(id)a3;
- (void)setKeyExchangeDate:(id)a3;
- (void)setKeyExchangeInterval:(double)a3;
- (void)setLtkTimer:(id)a3;
- (void)setLtkTimerRetryCount:(int64_t)a3;
- (void)setMessageTimeout:(int64_t)a3;
- (void)setMessageTimeoutFromServer:(int64_t)a3;
- (void)setPasscode:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setReceivedSetupACK:(BOOL)a3;
- (void)setReceivedTokenACK:(BOOL)a3;
- (void)setRemoteLTKHash:(id)a3;
- (void)setResponseTimeout:(int64_t)a3;
- (void)setResponseTimeoutFromServer:(int64_t)a3;
- (void)setSendState:(int64_t)a3;
- (void)setSessionCreatedMessage:(id)a3;
- (void)setSetupError:(id)a3;
- (void)setSetupMessageIdentifier:(id)a3;
- (void)setSetupRetryDevice:(BOOL)a3;
- (void)setTokenExchangeDate:(id)a3;
- (void)setTokenExchangeInterval:(double)a3;
- (void)setTokenMessageIdentifier:(id)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)setUpsellDevice:(BOOL)a3;
- (void)setWaitingForCloudPairing:(BOOL)a3;
- (void)setWatchBuildVersion:(id)a3;
- (void)setWatchNewLTKSyncStatus:(int)a3;
- (void)setWatchOSVersion:(id)a3;
- (void)setWatchOldLTKSyncStatus:(int)a3;
- (void)start;
- (void)transport:(id)a3 didReceiveMessageACKForIdentifier:(id)a4;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateForCloudPairing;
@end

@implementation SDAutoUnlockPairingLockSession

- (SDAutoUnlockPairingLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPairingLockSession;
  v7 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v38, "initWithDevice:sessionID:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_sendState = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 modelIdentifierForDeviceID:v6]);
    keyDeviceModel = v8->_keyDeviceModel;
    v8->_keyDeviceModel = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceForUniqueID:v13]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 autoUnlockDeviceForIDSDevice:v14 cloudPaired:0 cached:0]);

      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 productBuildVersion]);
      watchBuildVersion = v8->_watchBuildVersion;
      v8->_watchBuildVersion = (NSString *)v17;

      [v14 operatingSystemVersion];
      id v19 = sub_10008AD64(v37);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      watchOSVersion = v8->_watchOSVersion;
      v8->_watchOSVersion = (NSString *)v20;

      uint64_t v23 = auto_unlock_log(v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v8->_watchOSVersion;
        v26 = v8->_watchBuildVersion;
        *(_DWORD *)buf = 138412802;
        int64_t v40 = (int64_t)v25;
        __int16 v41 = 2112;
        v42 = (const __CFString *)v26;
        __int16 v43 = 2112;
        int64_t v44 = (int64_t)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Created session (OS version: %@, build: %@, device: %@)",  buf,  0x20u);
      }
    }

    unsigned __int8 v36 = 0;
    v8->_int64_t responseTimeout = (int64_t)sub_10008AF8C((char *)&v36);
    v8->_responseTimeoutFromServer = v36;
    unsigned __int8 v36 = 0;
    id v27 = sub_10008B27C((char *)&v36);
    v8->_int64_t messageTimeout = (int64_t)v27;
    v8->_int64_t messageTimeoutFromServer = v36;
    uint64_t v28 = auto_unlock_log(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int64_t responseTimeout = v8->_responseTimeout;
      v31 = @"YES";
      int64_t messageTimeout = v8->_messageTimeout;
      int64_t messageTimeoutFromServer = v8->_messageTimeoutFromServer;
      if (v8->_responseTimeoutFromServer) {
        v34 = @"YES";
      }
      else {
        v34 = @"NO";
      }
      *(_DWORD *)buf = 134218754;
      if (!messageTimeoutFromServer) {
        v31 = @"NO";
      }
      int64_t v40 = responseTimeout;
      __int16 v41 = 2112;
      v42 = v34;
      __int16 v43 = 2048;
      int64_t v44 = messageTimeout;
      __int16 v45 = 2112;
      v46 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Updated timeouts (responseTimeout: %ld, responseTimeoutFromServer: %@, messageTimeout: %ld, messageTimeoutFromServer: %@)",  buf,  0x2Au);
    }

    v8->_watchOldLTKSyncStatus = -1;
    v8->_watchNewLTKSyncStatus = -1;
  }

  return v8;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002570C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession generatedError](self, "generatedError"));
  if (!v3)
  {
    BOOL v4 = -[SDAutoUnlockPairingLockSession placeholder](self, "placeholder");
    if (v4)
    {
      uint64_t v5 = auto_unlock_log(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is placeholder", v44, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
      unsigned int v8 = [v7 localDeviceIDSRegistered];

      if (v8)
      {
        uint64_t v10 = SFAutoUnlockErrorDomain;
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForWatchNotSignedIn]( self,  "userInfoForWatchNotSignedIn"));
        uint64_t v12 = v10;
        uint64_t v13 = 150LL;
      }

      else
      {
        uint64_t v15 = auto_unlock_log(v9);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int64_t v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Mac not IDS registered", v44, 2u);
        }

        uint64_t v17 = SFAutoUnlockErrorDomain;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMacNotSignedIn](self, "userInfoForMacNotSignedIn"));
        uint64_t v12 = v17;
        uint64_t v13 = 178LL;
      }
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      if ([v14 viewSyncing])
      {
      }

      else
      {
        unsigned __int8 v18 = +[SDAutoUnlockAKSManager useKeychainForLTKSyncing]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "useKeychainForLTKSyncing");

        if ((v18 & 1) != 0)
        {
          uint64_t v20 = auto_unlock_log(v19);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10002A9B0();
          }

          uint64_t v22 = SFAutoUnlockErrorDomain;
          NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
          v46 = @"View not syncing";
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
          uint64_t v12 = v22;
          uint64_t v13 = 121LL;
          goto LABEL_31;
        }
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned __int8 v24 = [v23 internetSharingEnabled];

      if ((v24 & 1) != 0)
      {
        uint64_t v26 = auto_unlock_log(v25);
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10002A8AC();
        }

        uint64_t v28 = SFAutoUnlockErrorDomain;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForInternetSharing](self, "userInfoForInternetSharing"));
        uint64_t v12 = v28;
        uint64_t v13 = 146LL;
      }

      else
      {
        uint64_t v29 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
        if (v29
          && (v30 = (void *)v29,
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode")),
              id v32 = [v31 length],
              v31,
              v30,
              v32))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
          unsigned int v34 = -[SDAutoUnlockPairingLockSession validatePasscode:](self, "validatePasscode:", v33);

          if (v34)
          {
            -[SDAutoUnlockPairingLockSession sendSetupRequest](self, "sendSetupRequest");
            unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
            [v36 reloadPairingRecordsIfNeeded];

            goto LABEL_32;
          }

          uint64_t v40 = auto_unlock_log(v35);
          __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10002A984();
          }

          uint64_t v42 = SFAutoUnlockErrorDomain;
          v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForKeychainMismatch]( self,  "userInfoForKeychainMismatch"));
          uint64_t v12 = v42;
          uint64_t v13 = 174LL;
        }

        else
        {
          uint64_t v37 = auto_unlock_log(v29);
          objc_super v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_10002A8D8(self, v38);
          }

          uint64_t v39 = SFAutoUnlockErrorDomain;
          NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
          v48 = @"No password";
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
          uint64_t v12 = v39;
          uint64_t v13 = 112LL;
        }
      }
    }

- (void)cancel
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025BE8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_cancel
{
  if (!-[SDAutoUnlockPairingLockSession canceled](self, "canceled"))
  {
    -[SDAutoUnlockPairingLockSession setCanceled:](self, "setCanceled:", 1LL);
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    uint64_t v3 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
    v7 = @"Pairing lock session canceled";
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  118LL,  v4));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);
  }

- (void)updateForCloudPairing
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025D4C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_updateForCloudPairing
{
  if (!-[SDAutoUnlockPairingLockSession canceled](self, "canceled")
    && !-[SDAutoUnlockPairingLockSession unlockEnabled](self, "unlockEnabled"))
  {
    if (-[SDAutoUnlockPairingLockSession waitingForCloudPairing](self, "waitingForCloudPairing")) {
      -[SDAutoUnlockPairingLockSession handleSuccessfulPairing](self, "handleSuccessfulPairing");
    }
  }

- (void)invalidate
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPairingLockSession;
  -[SDAutoUnlockPairingSession invalidate](&v9, "invalidate");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v4 = [v3 resetSession];

  uint64_t v6 = auto_unlock_log(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = @"NO";
    if (v4) {
      unsigned int v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (id)generatedError
{
  int v3 = sub_10008E24C(@"AUGenerateNoPasscode", 0LL);
  int v4 = sub_10008E24C(@"AUGenerateNoWristDetection", 0LL);
  int v5 = sub_10008E24C(@"AUGenerateNoCommunication", 0LL);
  if (v3 && v4)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForNoWristDetectionNoPasscode]( self,  "userInfoForNoWristDetectionNoPasscode"));
  }

  else if (v4)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoWristDetection](self, "userInfoForNoWristDetection"));
  }

  else if (v3)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoPasscode](self, "userInfoForNoPasscode"));
  }

  else
  {
    if (!v5)
    {
      objc_super v9 = 0LL;
      return v9;
    }

    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoCommunincation](self, "userInfoForNoCommunincation"));
  }

  unsigned int v8 = (void *)v7;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  119LL,  v7));

  return v9;
}

- (void)handleTimerFired
{
  uint64_t v3 = auto_unlock_log(self);
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response timer fired", v11, 2u);
  }

  -[SDAutoUnlockPairingLockSession setErrorType:](self, "setErrorType:", 1LL);
  if ((id)-[SDAutoUnlockPairingLockSession sendState](self, "sendState") == (id)1)
  {
    int v5 = @"Timeout waiting for response to initial request";
    uint64_t v6 = 153LL;
  }

  else
  {
    int64_t v7 = -[SDAutoUnlockPairingLockSession sendState](self, "sendState");
    int v5 = @"Request timeout";
    if (v7 == 2)
    {
      int v5 = @"Timeout waiting for response to token exchange request";
      uint64_t v6 = 154LL;
    }

    else
    {
      uint64_t v6 = 103LL;
    }
  }

  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  uint64_t v13 = v5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  if (-[SDAutoUnlockPairingLockSession waitingForCloudPairing](self, "waitingForCloudPairing"))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNotCloudPaired](self, "userInfoForNotCloudPaired"));

    uint64_t v6 = 134LL;
    unsigned int v8 = (void *)v9;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  v6,  v8));
  -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v10);
}

- (BOOL)validatePasscode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = auto_unlock_log(v3);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Validating passcode", (uint8_t *)v16, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
  uint64_t v7 = MKBUnlockDevice(v6, 0LL);
  int v8 = v7;
  uint64_t v9 = auto_unlock_log(v7);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v16[0] = 67109120;
      v16[1] = v8;
      NSErrorUserInfoKey v12 = "Passcode invalid (error: %d)";
      uint64_t v13 = v10;
      uint32_t v14 = 8;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v16, v14);
    }
  }

  else if (v11)
  {
    LOWORD(v16[0]) = 0;
    NSErrorUserInfoKey v12 = "Passcode validated";
    uint64_t v13 = v10;
    uint32_t v14 = 2;
    goto LABEL_8;
  }

  return v8 == 0;
}

+ (int64_t)setupRequestVersion
{
  return 1LL;
}

- (BOOL)useAttestedProtocol
{
  return 0;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Pairing lock session notifying delegate with error: %@",  buf,  0xCu);
  }

  if ([v4 code] == (id)134)
  {
    BOOL v7 = IsAppleInternalBuild() != 0;
    if (!v4) {
      goto LABEL_23;
    }
  }

  else
  {
    BOOL v7 = 0;
    if (!v4) {
      goto LABEL_23;
    }
  }

  if ([v4 code] != (id)119
    && [v4 code] != (id)150
    && [v4 code] != (id)178
    && [v4 code] != (id)148
    && [v4 code] != (id)125
    && [v4 code] != (id)129
    && [v4 code] != (id)146
    && [v4 code] != (id)173
    && [v4 code] != (id)174
    && [v4 code] != (id)177
    && [v4 code] != (id)196)
  {
    char v8 = [v4 code] == (id)205 || v7;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = SFAutoUnlockErrorDomain;
      id v10 = [v4 code];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoCommunincation](self, "userInfoForNoCommunincation"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v10,  v11));

      id v4 = (id)v12;
    }
  }

- (void)notifyDelegateKeyDeviceIsLocked
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v3, "sessionDidReceiveKeyDeviceLocked:");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    [v5 sessionDidReceiveKeyDeviceLocked:self];
  }

- (void)restartLTKTimer
{
  uint64_t v3 = auto_unlock_log(self);
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting LTK timer", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  if (!v5)
  {
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100026A24;
    v12[3] = &unk_1005CB220;
    objc_copyWeak(&v13, (id *)buf);
    BOOL v7 = sub_100114598(0, v6, v12);
    char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDAutoUnlockPairingLockSession setLtkTimer:](self, "setLtkTimer:", v8);

    uint64_t v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
    dispatch_resume(v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  dispatch_time_t v11 = sub_100114580(15.0);
  sub_100114638(v10, v11);
}

- (void)invalidateLTKTimer
{
  uint64_t v3 = auto_unlock_log(self);
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidate LTK timer", v7, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
  if (v5)
  {
    uint64_t v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession ltkTimer](self, "ltkTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockPairingLockSession setLtkTimer:](self, "setLtkTimer:", 0LL);
  }

- (void)handleLTKTimerFired
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  [v3 checkRemoteLTKForDeviceID:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  [v5 updatePreferredRemoteLTKForDeviceID:v6];

  unsigned int v7 = -[SDAutoUnlockPairingLockSession ltkHashMatches](self, "ltkHashMatches");
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteLTKForDeviceID:v9]);

  if (v10 && v7)
  {
    -[SDAutoUnlockPairingLockSession handleEscrowSessionRequest](self, "handleEscrowSessionRequest");
  }

  else
  {
    uint64_t v11 = -[SDAutoUnlockPairingLockSession ltkTimerRetryCount](self, "ltkTimerRetryCount");
    if (v11 > 4)
    {
      uint64_t v12 = auto_unlock_log(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for LTK to sync",  v17,  2u);
      }

      uint64_t v14 = SFAutoUnlockErrorDomain;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  176LL,  v15));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);
    }

    else
    {
      -[SDAutoUnlockPairingLockSession setLtkTimerRetryCount:]( self,  "setLtkTimerRetryCount:",  (char *)-[SDAutoUnlockPairingLockSession ltkTimerRetryCount](self, "ltkTimerRetryCount") + 1);
      -[SDAutoUnlockPairingLockSession restartLTKTimer](self, "restartLTKTimer");
    }
  }

- (BOOL)ltkHashMatches
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));

  if (v3)
  {
    char v12 = 0;
    char v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession remoteLTKHash](self, "remoteLTKHash"));
    unsigned int v7 = [v4 hashMatchesAnyRemoteLTKForDeviceID:v5 ltkHash:v6 isPreferred:&v12];

    if (v7 && !v12)
    {
      uint64_t v9 = auto_unlock_log(v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10002A9DC();
      }
    }
  }

  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v10);

  if (v5 > 2001)
  {
    if (v5 != 2002)
    {
      if (v5 != 2004)
      {
        if (v5 != 2005) {
          goto LABEL_18;
        }
        goto LABEL_9;
      }

      goto LABEL_15;
    }
  }

  else if (v5 != 102)
  {
    if (v5 != 104)
    {
      if (v5 != 105) {
        goto LABEL_18;
      }
LABEL_9:
      uint64_t v11 = auto_unlock_log(-[SDAutoUnlockPairingLockSession setKeyDeviceLocked:](self, "setKeyDeviceLocked:", 1LL));
      char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockMessageTypePairingKeyDeviceLocked",  buf,  2u);
      }

      -[SDAutoUnlockPairingLockSession handleKeyDeviceLocked](self, "handleKeyDeviceLocked");
      goto LABEL_18;
    }

- (void)handleKeyDeviceLocked
{
  BOOL v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v3)
  {
    uint64_t v4 = auto_unlock_log(v3);
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not notified of locked device, session canceled",  buf,  2u);
    }
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForWatchLocked](self, "userInfoForWatchLocked"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  119LL,  v7));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v6);
  }

- (void)handleSetupSessionCreated:(id)a3 fromDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v8)
  {
    uint64_t v9 = auto_unlock_log(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v73) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Pairing session canceled for session created",  (uint8_t *)&v73,  2u);
    }

    goto LABEL_52;
  }

  uint64_t v11 = -[SDUnlockSetupSessionCreated initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSetupSessionCreated),  "initWithData:",  v6);
  -[SDAutoUnlockPairingLockSession setSessionCreatedMessage:](self, "setSessionCreatedMessage:", v11);

  char v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  unsigned int v13 = [v12 hasErrorCode];

  if (v13)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v16 = [v15 errorCode];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v18 = [v17 hasFailureReasons];

    if (!v18) {
      goto LABEL_32;
    }
    uint64_t v20 = auto_unlock_log(v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      int v73 = 67109120;
      LODWORD(v74) = [v22 failureReasons];
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received failure reasons %d",  (uint8_t *)&v73,  8u);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned __int8 v24 = [v23 failureReasons];

    if ((v24 & 4) != 0)
    {
      unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoCompanionViewNotSyncing]( self,  "userInfoCompanionViewNotSyncing"));
      v54 = self;
      uint64_t v55 = 7LL;
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      if ([v25 failureReasons])
      {
        id v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        unsigned __int8 v57 = [v56 failureReasons];

        if ((v57 & 2) != 0)
        {
          unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForNoWristDetectionNoPasscode]( self,  "userInfoForNoWristDetectionNoPasscode"));
          v54 = self;
          uint64_t v55 = 4LL;
          goto LABEL_48;
        }
      }

      else
      {
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      unsigned __int8 v59 = [v58 failureReasons];

      if ((v59 & 1) != 0)
      {
        unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNoPasscode](self, "userInfoForNoPasscode"));
        v54 = self;
        uint64_t v55 = 2LL;
      }

      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        unsigned __int8 v61 = [v60 failureReasons];

        if ((v61 & 2) == 0)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
          unsigned __int8 v63 = [v62 failureReasons];

          if ((v63 & 8) == 0)
          {
LABEL_32:
            switch(v16)
            {
              case 0x7Du:
                uint64_t v66 = auto_unlock_log(v19);
                v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                  sub_10002AAA4();
                }

                id v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                unsigned int v53 = v19;
                unsigned int v16 = 125;
                break;
              case 0x81u:
                uint64_t v68 = auto_unlock_log(v19);
                v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                  sub_10002AAD0();
                }

                id v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                unsigned int v53 = v19;
                unsigned int v16 = 129;
                break;
              case 0xC4u:
                uint64_t v64 = auto_unlock_log(v19);
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                  sub_10002AA78();
                }

                id v19 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
                unsigned int v53 = v19;
                unsigned int v16 = 196;
                break;
              default:
                unsigned int v53 = 0LL;
                break;
            }

            goto LABEL_49;
          }

          id v19 = (id)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForiPhoneNeedsUnlock]( self,  "userInfoForiPhoneNeedsUnlock"));
          unsigned int v53 = v19;
          unsigned int v16 = 177;
LABEL_49:
          uint64_t v70 = auto_unlock_log(v19);
          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
            sub_10002AA08(v16, v71);
          }

          v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  v16,  v53));
          -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v72);

          goto LABEL_52;
        }

        unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingLockSession userInfoForNoWristDetection]( self,  "userInfoForNoWristDetection"));
        v54 = self;
        uint64_t v55 = 3LL;
      }
    }

- (void)handleEscrowSessionRequest
{
  BOOL v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v3)
  {
    uint64_t v4 = auto_unlock_log(v3);
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Pairing session canceled for session request",  buf,  2u);
    }

    return;
  }

  if (sub_10008E24C(@"AURestrictOldWatch", 1LL))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v7 = [v6 version];

    if (v7 < 2uLL)
    {
      uint64_t v9 = auto_unlock_log(v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
        *(_DWORD *)buf = 67109120;
        LODWORD(v66) = [v11 version];
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setup received response from old watch (version: %d)",  buf,  8u);
      }

      char v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForOldProtocol](self, "userInfoForOldProtocol"));
      uint64_t v13 = SFAutoUnlockErrorDomain;
      uint64_t v14 = 126LL;
LABEL_14:
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  v12));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v21);

      goto LABEL_15;
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  unsigned int v16 = [v15 version];

  if (v16 > 3uLL)
  {
    uint64_t v18 = auto_unlock_log(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      *(_DWORD *)buf = 67109120;
      LODWORD(v66) = [v20 version];
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Setup received response from new watch (version: %d)",  buf,  8u);
    }

    char v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForNewProtocol](self, "userInfoForNewProtocol"));
    uint64_t v13 = SFAutoUnlockErrorDomain;
    uint64_t v14 = 173LL;
    goto LABEL_14;
  }

  uint64_t v62 = 0LL;
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
  unsigned int v23 = [v22 hasToken];

  if (!v23)
  {
    uint64_t v62 = 155LL;
    id v36 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    else {
      unsigned int v38 = @"NO";
    }
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 token]);
    char v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Auto Unlock: Missing information for escrow session (has token = %@, token = %@)",  v38,  v40));

    goto LABEL_27;
  }

  unsigned int v24 = -[SDAutoUnlockPairingLockSession ltkHashMatches](self, "ltkHashMatches");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteLTKForDeviceID:v26]);

  if (v27 && v24)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( [v28 aksPairingSessionForDeviceID:v29 originator:0 errorCode:&v62 requiresAttestation:0 requiresEscrow:1]);
    -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v30);

    double v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    LODWORD(v29) = [v31 sessionIsValid];

    if (!(_DWORD)v29)
    {
      if (v62 == 148)
      {
        char v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession userInfoForMissingLTK](self, "userInfoForMissingLTK"));
      }

      else
      {
        NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
        uint64_t v70 = @"Invalid AKS session";
        char v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
        uint64_t v59 = auto_unlock_log(v12);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          sub_10002AB5C();
        }
      }

      uint64_t v13 = SFAutoUnlockErrorDomain;
      uint64_t v14 = v62;
      goto LABEL_14;
    }

    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 token]);
    id v61 = 0LL;
    unsigned int v35 = [v32 stepSessionWithData:v34 outputData:&v61];
    id v36 = v61;

    if (v35)
    {
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
      -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:]( self,  "sendCreateSecretWithStepData:sessionID:",  v36,  [v37 sessionID]);

      char v12 = 0LL;
    }

    else
    {
      uint64_t v62 = 162LL;
      char v12 = @"Could not setup escrow session";
    }

- (void)handleDeviceAuthenticationSetupRequest
{
  BOOL v3 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (!v3)
  {
    *(void *)buf = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
    unsigned int v7 = [v6 hasToken];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteLTKForDeviceID:v9]);

      if (v10)
      {
        char v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v12 aksPairingSessionForDeviceID:v13 originator:0 errorCode:buf requiresAttestation:0 requiresEscrow:1]);
        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v14);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        LODWORD(v13) = [v15 sessionIsValid];

        if ((_DWORD)v13)
        {
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 token]);
          id v40 = 0LL;
          unsigned int v19 = [v16 stepSessionWithData:v18 outputData:&v40];
          id v20 = v40;

          if (v19)
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession sessionCreatedMessage](self, "sessionCreatedMessage"));
            -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:]( self,  "sendCreateSecretWithStepData:sessionID:",  v20,  [v21 sessionID]);

            unsigned int v22 = 0LL;
          }

          else
          {
            *(void *)buf = 162LL;
            unsigned int v22 = @"Could not setup device authentication session";
          }

- (void)handleSetupCreateRecord:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDAutoUnlockPairingLockSession canceled](self, "canceled");
  if (v5)
  {
    uint64_t v6 = auto_unlock_log(v5);
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Pairing session canceled for session request",  buf,  2u);
    }

    goto LABEL_15;
  }

  uint64_t v8 = -[SDUnlockSetupCreateRecord initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSetupCreateRecord),  "initWithData:",  v4);
  unsigned int v7 = (os_log_s *)v8;
  if (v8
    && -[SDUnlockSetupCreateRecord hasToken](v8, "hasToken")
    && (-[os_log_s hasErrorCode](v7, "hasErrorCode") & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s token](v7, "token"));
    unsigned int v19 = [v17 stepSessionWithData:v18 outputData:0];

    if (!v19)
    {
      uint64_t v11 = @"Final step failed";
      uint64_t v9 = 164LL;
      goto LABEL_11;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession passcode](self, "passcode"));
    uint64_t v9 = (uint64_t)[v20 finalizeEscrowPairing:v21];

    if (v9)
    {
      uint64_t v11 = @"Finalizing pairing failed";
LABEL_11:
      uint64_t v12 = auto_unlock_log(v10);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002ABB4();
      }

      uint64_t v14 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v44 = @"Record failure";
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  v9,  v15));
      -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);

      goto LABEL_14;
    }

    id v10 = (__CFString *)-[os_log_s hasPairedDeviceID](v7, "hasPairedDeviceID");
    if (!(_DWORD)v10)
    {
      uint64_t v11 = @"Pairing response missing companion device ID";
      uint64_t v9 = 156LL;
      goto LABEL_11;
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s pairedDeviceID](v7, "pairedDeviceID"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    [v22 setCompanionID:v23 forWatchID:v24];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    [v25 setPairingID:v27 forWatchID:v28];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s pairedDeviceID](v7, "pairedDeviceID"));
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v29 idsDeviceForUniqueID:v30]);

    double v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString modelIdentifier](v11, "modelIdentifier"));
    -[SDAutoUnlockPairingLockSession setCompanionDeviceModel:](self, "setCompanionDeviceModel:", v31);

    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v32 generateSessionToken]);

    if (v15)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      unsigned int v35 = [v33 storeRangingKey:v15 forDeviceID:v34];

      if (v35)
      {
        -[SDAutoUnlockPairingLockSession handleSuccessfulPairing](self, "handleSuccessfulPairing");
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v40 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      v48 = @"Failed to store session token";
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
      uint64_t v38 = v40;
      uint64_t v39 = 168LL;
    }

    else
    {
      uint64_t v36 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
      unsigned int v46 = @"Failed to create session token";
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
      uint64_t v38 = v36;
      uint64_t v39 = 167LL;
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v38,  v39,  v37));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v41);

    goto LABEL_14;
  }

  else {
    uint64_t v9 = 171LL;
  }
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Auto Unlock: Creating escrow record failed (error code: %d)",  -[os_log_s errorCode](v7, "errorCode")));
  uint64_t v11 = v10;
  if (v10) {
    goto LABEL_11;
  }
LABEL_15:
}

- (void)handleSuccessfulPairing
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceForUniqueID:v4]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 autoUnlockDeviceForIDSDevice:v5 cloudPaired:0 cached:0]);

  if ([v7 unlockEnabled])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 bluetoothID]);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyBluetoothID]);
      if (v10)
      {

        goto LABEL_6;
      }

      unsigned int v11 = [v7 supportsAlwaysDirect];

      if (v11)
      {
LABEL_6:
        -[SDAutoUnlockPairingLockSession setUnlockEnabled:](self, "setUnlockEnabled:", 1LL);
        uint64_t v12 = auto_unlock_log(-[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL));
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          *(_DWORD *)buf = 138412290;
          NSErrorUserInfoKey v44 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enabled for device: %@", buf, 0xCu);
        }

        goto LABEL_27;
      }
    }
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 bluetoothID]);
  if (v15
    && (unsigned int v16 = (void *)v15,
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyBluetoothID]),
        v17,
        v16,
        v17))
  {
    uint64_t v18 = auto_unlock_log(v15);
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002AC40();
    }

    uint64_t v20 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v42 = @"Unlock not enabled after pairing";
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  133LL,  v13));
    -[SDAutoUnlockPairingLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v21);
  }

  else
  {
    uint64_t v22 = auto_unlock_log(v15);
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v7 bluetoothID]);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyBluetoothID]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
      *(_DWORD *)buf = 138412546;
      NSErrorUserInfoKey v44 = v25;
      __int16 v45 = 2112;
      unsigned int v46 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Waiting for cloud pairing (Watch ID: %@, Companion ID: %@)",  buf,  0x16u);
    }

    -[SDAutoUnlockPairingLockSession setWaitingForCloudPairing:](self, "setWaitingForCloudPairing:", 1LL);
    uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 bluetoothID]);

    if (!v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      -[os_log_s addObject:](v13, "addObject:", v29);
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyBluetoothID]);

    if (!v30)
    {
      double v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v32 companionIDForWatchID:v33]);

      if (v34)
      {
        -[os_log_s addObject:](v13, "addObject:", v34);
      }

      else
      {
        uint64_t v36 = auto_unlock_log(v35);
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          sub_10002AC14();
        }
      }
    }

    uint64_t v38 = auto_unlock_log(v31);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      NSErrorUserInfoKey v44 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Retrying cloud pairing for specific devices %@",  buf,  0xCu);
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v40 triggerCloudPairRetryWithShortRetryDeviceIDs:v13];

    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(480.0));
  }

- (void)sendSetupRequest
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100028D5C;
  v3[3] = &unk_1005CB5B0;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  ((void (*)(void *, void))v2[2])(v2, 0LL);
}

- (void)sendCreateSecretWithStepData:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = auto_unlock_log(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSetupCreateSecret", buf, 2u);
  }

  -[SDAutoUnlockPairingLockSession setSendState:](self, "setSendState:", 2LL);
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupCreateSecret);
  -[SDUnlockSetupCreateSecret setSessionID:](v9, "setSessionID:", v4);
  -[SDUnlockSetupCreateSecret setToken:](v9, "setToken:", v6);

  id v10 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[SDAutoUnlockPairingLockSession setTokenExchangeDate:](self, "setTokenExchangeDate:", v10);

  unsigned int v11 = -[SDAutoUnlockPairingLockSession useAttestedProtocol](self, "useAttestedProtocol");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret data](v9, "data"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockPairingLockSession messageTimeout](self, "messageTimeout")));
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = sub_100029328;
  uint64_t v22 = &unk_1005CB4E8;
  unsigned int v23 = self;
  unsigned int v19 = _NSConcreteStackBlock;
  if (v11) {
    uint64_t v17 = 2003LL;
  }
  else {
    uint64_t v17 = 103LL;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:",  v13,  v14,  v17,  v15,  0,  v16,  &v19,  v19,  v20,  v21,  v22,  v23));
  -[SDAutoUnlockPairingLockSession setTokenMessageIdentifier:](self, "setTokenMessageIdentifier:", v18);

  -[SDAutoUnlockPairingSession restartResponseTimer:]( self,  "restartResponseTimer:",  sub_100114580((double)-[SDAutoUnlockPairingLockSession responseTimeout](self, "responseTimeout")));
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000294EC;
  v14[3] = &unk_1005CB248;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unsigned __int16 v17 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (void)transport:(id)a3 didReceiveMessageACKForIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = auto_unlock_log(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession setupMessageIdentifier](self, "setupMessageIdentifier"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession tokenMessageIdentifier](self, "tokenMessageIdentifier"));
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    unsigned __int16 v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received ACK (identifier: %@, setup ID: %@, token ID: %@)",  (uint8_t *)&v12,  0x20u);
  }

  if (-[SDAutoUnlockPairingLockSession receivedSetupACK](self, "receivedSetupACK"))
  {
    -[SDAutoUnlockPairingLockSession setReceivedSetupACK:](self, "setReceivedSetupACK:", 1LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession setupMessageIdentifier](self, "setupMessageIdentifier"));
    -[SDAutoUnlockPairingLockSession setReceivedSetupACK:]( self,  "setReceivedSetupACK:",  [v5 isEqualToString:v10]);
  }

  if (-[SDAutoUnlockPairingLockSession receivedTokenACK](self, "receivedTokenACK"))
  {
    -[SDAutoUnlockPairingLockSession setReceivedTokenACK:](self, "setReceivedTokenACK:", 1LL);
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingLockSession tokenMessageIdentifier](self, "tokenMessageIdentifier"));
    -[SDAutoUnlockPairingLockSession setReceivedTokenACK:]( self,  "setReceivedTokenACK:",  [v5 isEqualToString:v11]);
  }
}

- (id)userInfoForiPhoneNeedsUnlock
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_IPHONE_UNLOCK_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_IPHONE_UNLOCK_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForKeychainMismatch
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_KEYCHAIN_MISMATCH_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_KEYCHAIN_MISMATCH_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForInternetSharing
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_INTERNET_SHARING_SETUP_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_INTERNET_SHARING_SETUP_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForMissingLTK
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_FAILED_COMMUNICATION_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_FAILED_COMMUNICATION_KEY_SYNC_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForWatchNotSignedIn
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_PHONE_NOT_SIGNED_IN_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_PHONE_NOT_SIGNED_IN_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForMacNotSignedIn
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_PHONE_NOT_SIGNED_IN_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_PHONE_NOT_SIGNED_IN_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNotCloudPaired
{
  v3[0] = NSLocalizedDescriptionKey;
  v3[1] = SFAutoUnlockManagerErrorTitleKey;
  v4[0] = @"[Internal] Bluetooth cloud pairing in progress.";
  v4[1] = @"[Internal] Bluetooth cloud pairing in progress.";
  v3[2] = SFAutoUnlockManagerErrorBodyKey;
  v4[2] = @"Auto Unlock can't be set up when your Mac is bluetooth cloud pairing to your Apple Watch. Please try again later.";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

- (id)userInfoForWatchLocked
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_BODY_PHONE", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoCompanionViewNotSyncing
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_IPHONE_SIGN_IN_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_IPHONE_SIGN_IN_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNoWristDetectionNoPasscode
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_AND_WRIST_DETECTION_REQUIRED_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_AND_WRIST_DETECTION_REQUIRED_BODY_PHONE", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNoWristDetection
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_WRIST_DETECTION_REQUIRED_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_WRIST_DETECTION_REQUIRED_BODY_PHONE", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNoPasscode
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_REQUIRED_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_REQUIRED_BODY_PHONE", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNoCommunincation
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_FAILED_COMMUNICATION_TITLE_PHONE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_FAILED_COMMUNICATION_BODY_PHONE", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForOldProtocol
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_OLD_PROTOCOL_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_OLD_PROTOCOL_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)userInfoForNewProtocol
{
  uint64_t v2 = SFLocalizedStringForKey(@"UNLOCK_NEW_PROTOCOL_TITLE", a2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = SFLocalizedStringForKey(@"UNLOCK_NEW_PROTOCOL_BODY", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = SFAutoUnlockManagerErrorTitleKey;
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = SFAutoUnlockManagerErrorBodyKey;
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)upsellDevice
{
  return self->_upsellDevice;
}

- (void)setUpsellDevice:(BOOL)a3
{
  self->_upsellDevice = a3;
}

- (BOOL)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(BOOL)a3
{
  self->_setupRetryDevice = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)waitingForCloudPairing
{
  return self->_waitingForCloudPairing;
}

- (void)setWaitingForCloudPairing:(BOOL)a3
{
  self->_waitingForCloudPairing = a3;
}

- (int64_t)sendState
{
  return self->_sendState;
}

- (void)setSendState:(int64_t)a3
{
  self->_sendState = a3;
}

- (NSString)keyDeviceModel
{
  return self->_keyDeviceModel;
}

- (void)setKeyDeviceModel:(id)a3
{
}

- (NSString)watchBuildVersion
{
  return self->_watchBuildVersion;
}

- (void)setWatchBuildVersion:(id)a3
{
}

- (NSString)watchOSVersion
{
  return self->_watchOSVersion;
}

- (void)setWatchOSVersion:(id)a3
{
}

- (NSString)companionDeviceModel
{
  return self->_companionDeviceModel;
}

- (void)setCompanionDeviceModel:(id)a3
{
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
}

- (BOOL)keyDeviceLocked
{
  return self->_keyDeviceLocked;
}

- (void)setKeyDeviceLocked:(BOOL)a3
{
  self->_keyDeviceLocked = a3;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (OS_dispatch_source)ltkTimer
{
  return self->_ltkTimer;
}

- (void)setLtkTimer:(id)a3
{
}

- (unsigned)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(unsigned int)a3
{
  self->_errorType = a3;
}

- (SDUnlockSetupSessionCreated)sessionCreatedMessage
{
  return self->_sessionCreatedMessage;
}

- (void)setSessionCreatedMessage:(id)a3
{
}

- (int64_t)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(int64_t)a3
{
  self->_int64_t responseTimeout = a3;
}

- (int64_t)responseTimeoutFromServer
{
  return self->_responseTimeoutFromServer;
}

- (void)setResponseTimeoutFromServer:(int64_t)a3
{
  self->_responseTimeoutFromServer = a3;
}

- (int64_t)messageTimeout
{
  return self->_messageTimeout;
}

- (void)setMessageTimeout:(int64_t)a3
{
  self->_int64_t messageTimeout = a3;
}

- (int64_t)messageTimeoutFromServer
{
  return self->_messageTimeoutFromServer;
}

- (void)setMessageTimeoutFromServer:(int64_t)a3
{
  self->_int64_t messageTimeoutFromServer = a3;
}

- (int64_t)ltkTimerRetryCount
{
  return self->_ltkTimerRetryCount;
}

- (void)setLtkTimerRetryCount:(int64_t)a3
{
  self->_ltkTimerRetryCount = a3;
}

- (NSDate)keyExchangeDate
{
  return self->_keyExchangeDate;
}

- (void)setKeyExchangeDate:(id)a3
{
}

- (NSDate)tokenExchangeDate
{
  return self->_tokenExchangeDate;
}

- (void)setTokenExchangeDate:(id)a3
{
}

- (double)keyExchangeInterval
{
  return self->_keyExchangeInterval;
}

- (void)setKeyExchangeInterval:(double)a3
{
  self->_keyExchangeInterval = a3;
}

- (double)tokenExchangeInterval
{
  return self->_tokenExchangeInterval;
}

- (void)setTokenExchangeInterval:(double)a3
{
  self->_tokenExchangeInterval = a3;
}

- (NSData)remoteLTKHash
{
  return self->_remoteLTKHash;
}

- (void)setRemoteLTKHash:(id)a3
{
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  self->_watchOldLTKSyncStatus = a3;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  self->_watchNewLTKSyncStatus = a3;
}

- (BOOL)receivedSetupACK
{
  return self->_receivedSetupACK;
}

- (void)setReceivedSetupACK:(BOOL)a3
{
  self->_receivedSetupACK = a3;
}

- (BOOL)receivedTokenACK
{
  return self->_receivedTokenACK;
}

- (void)setReceivedTokenACK:(BOOL)a3
{
  self->_receivedTokenACK = a3;
}

- (NSString)setupMessageIdentifier
{
  return self->_setupMessageIdentifier;
}

- (void)setSetupMessageIdentifier:(id)a3
{
}

- (NSString)tokenMessageIdentifier
{
  return self->_tokenMessageIdentifier;
}

- (void)setTokenMessageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end