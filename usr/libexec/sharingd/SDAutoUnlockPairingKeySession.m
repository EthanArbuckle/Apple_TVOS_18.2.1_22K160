@interface SDAutoUnlockPairingKeySession
- (BOOL)canCreatePairing;
- (BOOL)canceled;
- (BOOL)companionCurrentlySyncing;
- (BOOL)companionNeedsUnlock;
- (BOOL)companionViewNotSyncing;
- (BOOL)ltkHashMatches;
- (BOOL)requestedLTKForRemote;
- (BOOL)useAttestedProtocol;
- (BOOL)waitingForLTK;
- (BOOL)waitingForUnlock;
- (NSData)longTermKey;
- (NSData)requestData;
- (SDAutoUnlockPairingKeySession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDUnlockSetupRequest)request;
- (void)addObservers;
- (void)cancel;
- (void)handleCreateEscrowSecret:(id)a3;
- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5;
- (void)handleTimerFired;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
- (void)onqueue_cancel;
- (void)onqueue_start;
- (void)sendKeyDeviceLocked;
- (void)sendSetupCreateEscrowRecordStepData:(id)a3 error:(id)a4;
- (void)sendSetupSessionCreatedWithLocalAttestedKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6;
- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6 ltkSyncing:(id)a7;
- (void)setCanceled:(BOOL)a3;
- (void)setCompanionCurrentlySyncing:(BOOL)a3;
- (void)setCompanionNeedsUnlock:(BOOL)a3;
- (void)setCompanionViewNotSyncing:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setRequestedLTKForRemote:(BOOL)a3;
- (void)setWaitingForLTK:(BOOL)a3;
- (void)setWaitingForUnlock:(BOOL)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)watchLTKsChanged:(id)a3;
@end

@implementation SDAutoUnlockPairingKeySession

- (SDAutoUnlockPairingKeySession)initWithDevice:(id)a3 sessionID:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPairingKeySession;
  v4 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v7, "initWithDevice:sessionID:", a3, a4);
  v5 = v4;
  if (v4) {
    -[SDAutoUnlockPairingKeySession addObservers](v4, "addObservers");
  }
  return v5;
}

- (void)invalidate
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPairingKeySession;
  -[SDAutoUnlockPairingSession invalidate](&v10, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v5 = [v4 resetSession];

  uint64_t v7 = auto_unlock_log(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"NO";
    if (v5) {
      v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F638;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = objc_alloc(&OBJC_CLASS___SDUnlockSetupRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession requestData](self, "requestData"));
  unsigned int v5 = -[SDUnlockSetupRequest initWithData:](v3, "initWithData:", v4);
  -[SDAutoUnlockPairingKeySession setRequest:](self, "setRequest:", v5);

  -[SDAutoUnlockPairingKeySession handleSetupRequest](self, "handleSetupRequest");
}

- (void)cancel
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F718;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_cancel
{
  if (!-[SDAutoUnlockPairingKeySession canceled](self, "canceled"))
  {
    -[SDAutoUnlockPairingKeySession setCanceled:](self, "setCanceled:", 1LL);
    uint64_t v3 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
    uint64_t v7 = @"Pairing key session canceled";
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  118LL,  v4));
    -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);
  }

- (BOOL)canCreatePairing
{
  return 0;
}

- (BOOL)ltkHashMatches
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  unsigned int v4 = [v3 hasLtkHash];

  if (v4)
  {
    char v14 = 0;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    NSErrorUserInfoKey v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ltkHash]);
    unsigned int v9 = [v5 hashMatchesAnyRemoteLTKForDeviceID:v6 ltkHash:v8 isPreferred:&v14];

    if (v9 && !v14)
    {
      uint64_t v11 = auto_unlock_log(v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_100021400(v12);
      }
    }
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)useAttestedProtocol
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  BOOL v3 = [v2 version] == 2;

  return v3;
}

- (void)handleTimerFired
{
  uint64_t v3 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  v21 = @"Timeout waiting for response from Mac";
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  197LL,  v4));

  BOOL v6 = -[SDAutoUnlockPairingKeySession waitingForLTK](self, "waitingForLTK");
  if (v6)
  {
    uint64_t v7 = auto_unlock_log(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002143C(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = @"Timeout waiting for LTKs";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  196LL,  v16));

    -[SDAutoUnlockPairingKeySession sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:]( self,  "sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:",  0LL,  0LL,  v17,  0LL,  0LL);
    unsigned int v5 = (void *)v17;
  }

  -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v5);
  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
}

- (void)addObservers
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"watchLTKsChanged:" name:@"SDAutoUnlockAKSManagerWatchLTKsUpdatedNotification" object:0];
}

- (void)watchLTKsChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch LTKs changed (user info: %@)", buf, 0xCu);
  }

  if (-[SDAutoUnlockPairingKeySession waitingForLTK](self, "waitingForLTK"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

    if (v8)
    {
      -[SDAutoUnlockPairingKeySession setWaitingForLTK:](self, "setWaitingForLTK:", 0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionViewSyncing"]);

      if (v11) {
        uint64_t v12 = [v11 BOOLValue] ^ 1;
      }
      else {
        uint64_t v12 = 0LL;
      }
      -[SDAutoUnlockPairingKeySession setCompanionViewNotSyncing:](self, "setCompanionViewNotSyncing:", v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionNeedsUnlock"]);
      -[SDAutoUnlockPairingKeySession setCompanionNeedsUnlock:]( self,  "setCompanionNeedsUnlock:",  [v15 BOOLValue]);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionCurrentlySyncing"]);
      -[SDAutoUnlockPairingKeySession setCompanionCurrentlySyncing:]( self,  "setCompanionCurrentlySyncing:",  [v17 BOOLValue]);

      NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      unsigned int v20 = [v18 ltkExistsForKeyDevice:v19];

      unsigned int v21 = -[SDAutoUnlockPairingKeySession ltkHashMatches](self, "ltkHashMatches");
      if (-[SDAutoUnlockPairingKeySession companionViewNotSyncing](self, "companionViewNotSyncing")
        || -[SDAutoUnlockPairingKeySession companionNeedsUnlock](self, "companionNeedsUnlock")
        || (BOOL v22 = -[SDAutoUnlockPairingKeySession companionCurrentlySyncing](self, "companionCurrentlySyncing"))
        || (v20 & v21) != 0)
      {
        -[SDAutoUnlockPairingKeySession handleSetupRequest](self, "handleSetupRequest");
      }

      else
      {
        uint64_t v23 = auto_unlock_log(v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v30 = (void *)v29;
          v31 = @"NO";
          if (v20) {
            v32 = @"YES";
          }
          else {
            v32 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          uint64_t v36 = v29;
          __int16 v37 = 2112;
          v38 = v32;
          if (v21) {
            v31 = @"YES";
          }
          __int16 v39 = 2112;
          v40 = v31;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Incorrect LTK (deviceID: %@, ltk exists: %@, hashes match: %@)",  buf,  0x20u);
        }

        if (v20) {
          uint64_t v25 = 129LL;
        }
        else {
          uint64_t v25 = 125LL;
        }
        uint64_t v26 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        v34 = @"Incorrect LTK";
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  v25,  v27));

        -[SDAutoUnlockPairingKeySession sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:]( self,  "sendSetupSessionCreatedWithLocalKey:stepData:error:failureReason:ltkSyncing:",  0LL,  0LL,  v28,  0LL,  0LL);
        -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v28);
        -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      }
    }

    else
    {
      uint64_t v13 = auto_unlock_log(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Response missing view syncing state",  buf,  2u);
      }
    }
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Pairing key session notifying delegate with error: %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "session:didCompleteWithError:");

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    [v9 session:self didCompleteWithError:v4];
  }
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5 = a5;
  id v7 = a3;
  char v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v8);

  if (v5 == 2003 || v5 == 103)
  {
    uint64_t v10 = auto_unlock_log(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupCreateSecret", v12, 2u);
    }

    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    -[SDAutoUnlockPairingKeySession handleCreateEscrowSecret:](self, "handleCreateEscrowSecret:", v7);
  }
}

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDAutoUnlockPairingKeySession canceled](self, "canceled");
  if (!v5)
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v9 = [v8 deviceKeyBagUnlocked];

    uint64_t v10 = -[SDUnlockSetupCreateSecret initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSetupCreateSecret),  "initWithData:",  v4);
    id v7 = v10;
    if (v9)
    {
      if (v10
        && (uint64_t v10 = (SDUnlockSetupCreateSecret *)-[SDUnlockSetupCreateSecret hasToken](v10, "hasToken"), (_DWORD)v10))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret token](v7, "token"));
        id v44 = 0LL;
        unsigned int v13 = [v11 stepSessionWithData:v12 outputData:&v44];
        id v14 = v44;

        if (v13)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 generateSessionToken]);

          if (v16)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
            NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
            unsigned int v19 = [v17 storeRangingKey:v16 forDeviceID:v18];

            if (v19)
            {
              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
              [v20 updateDynamicStoreEnabled];

              unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
              unsigned int v22 = [v21 version];

              if (v22 != 1LL)
              {
                -[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:]( self,  "sendSetupCreateEscrowRecordStepData:error:",  v14,  0LL);
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
                [v35 confirmSession];

                uint64_t v37 = auto_unlock_log(v36);
                v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                }

                -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL);
                goto LABEL_24;
              }

              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
              v24 = (void *)objc_claimAutoreleasedReturnValue([v23 generateEscrowSecret]);

              if (v24)
              {
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
                v43 = v24;
                unsigned int v29 = [v25 storeEscrowSecret:v24 pairingID:v27 deviceID:v28 requiresUnlock:1];

                if (v29)
                {
                  uint64_t v30 = auto_unlock_log( -[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:]( self,  "sendSetupCreateEscrowRecordStepData:error:",  v14,  0LL));
                  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                  }

                  -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL);
                  v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockAKSManager sharedManager]( &OBJC_CLASS___SDAutoUnlockAKSManager,  "sharedManager"));
                  [v32 updateDynamicStoreEnabled];

LABEL_24:
LABEL_33:

                  goto LABEL_34;
                }

                NSErrorUserInfoKey v33 = @"Failed to store escrow secret";
                uint64_t v34 = 170LL;
                v24 = v43;
              }

              else
              {
                NSErrorUserInfoKey v33 = @"Failed to create escrow secret";
                uint64_t v34 = 169LL;
              }
            }

            else
            {
              NSErrorUserInfoKey v33 = @"Failed to store session token";
              uint64_t v34 = 166LL;
            }
          }

          else
          {
            NSErrorUserInfoKey v33 = @"Failed to create session token";
            uint64_t v34 = 165LL;
          }
        }

        else
        {
          NSErrorUserInfoKey v33 = @"Could not complete step";
          uint64_t v34 = 163LL;
        }
      }

      else
      {
        NSErrorUserInfoKey v33 = @"No remote step data in message";
        uint64_t v34 = 160LL;
      }
    }

    else
    {
      NSErrorUserInfoKey v33 = @"Device locked";
      uint64_t v34 = 102LL;
    }

    uint64_t v39 = auto_unlock_log(v10);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10002146C((uint64_t)v33, v40);
    }

    uint64_t v41 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    v47 = @"Request failure";
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v41,  v34,  v42));

    -[SDAutoUnlockPairingKeySession sendSetupCreateEscrowRecordStepData:error:]( self,  "sendSetupCreateEscrowRecordStepData:error:",  0LL,  v14);
    -[SDAutoUnlockPairingKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v14);
    goto LABEL_33;
  }

  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (SDUnlockSetupCreateSecret *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Pairing canceled for create secret",  buf,  2u);
  }

- (void)sendKeyDeviceLocked
{
  id v11 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockKeyDeviceLocked);
  -[SDAutoUnlockKeyDeviceLocked setVersion:](v11, "setVersion:", 1LL);
  unsigned int v3 = -[SDAutoUnlockPairingKeySession useAttestedProtocol](self, "useAttestedProtocol");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeyDeviceLocked data](v11, "data"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 45LL));
  if (v3) {
    uint64_t v9 = 2005LL;
  }
  else {
    uint64_t v9 = 105LL;
  }
  id v10 =  [v4 sendAutoUnlockPayload:v5 toDevice:v6 type:v9 sessionID:v7 queueOneID:0 timeout:v8 completion:&stru_1005CB4C0];
}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6 ltkSyncing:(id)a7
{
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  id v11 = a7;
  else {
    int v12 = 2;
  }
  else {
    unsigned int v13 = v12;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v15 = [v14 deviceRequiresNewRanging];

  if (v15) {
    uint64_t v17 = 3LL;
  }
  else {
    uint64_t v17 = v13;
  }
  uint64_t v18 = auto_unlock_log(v16);
  unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = @"NO";
    if (v15) {
      unsigned int v20 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v45 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device using new ranging: %@", buf, 0xCu);
  }

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 ltkHash]);
  id v25 = [v21 ltkSyncStatusForDeviceID:v22 hash:v24 modern:0];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingKeySession request](self, "request"));
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 ltkHash]);
  id v30 = [v26 ltkSyncStatusForDeviceID:v27 hash:v29 modern:1];

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 ltkHashForLocalLTK]);

  NSErrorUserInfoKey v33 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v33, "setVersion:", v17);
  if (v42) {
    -[SDUnlockSetupSessionCreated setLongTermKey:](v33, "setLongTermKey:");
  }
  if (v41) {
    -[SDUnlockSetupSessionCreated setToken:](v33, "setToken:");
  }
  if (v40) {
    -[SDUnlockSetupSessionCreated setErrorCode:](v33, "setErrorCode:", [v40 code]);
  }
  if (a6) {
    -[SDUnlockSetupSessionCreated setFailureReasons:](v33, "setFailureReasons:");
  }
  if (v11) {
    -[SDUnlockSetupSessionCreated setLtkSyncing:](v33, "setLtkSyncing:", [v11 BOOLValue]);
  }
  if (v32) {
    -[SDUnlockSetupSessionCreated setLtkHash:](v33, "setLtkHash:", v32);
  }
  -[SDUnlockSetupSessionCreated setWatchOldLTKSyncStatus:](v33, "setWatchOldLTKSyncStatus:", v25);
  -[SDUnlockSetupSessionCreated setWatchNewLTKSyncStatus:](v33, "setWatchNewLTKSyncStatus:", v30);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v33, "data"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 45LL));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100020B78;
  v43[3] = &unk_1005CB3E8;
  v43[4] = self;
  [v34 sendPayload:v35 toDevice:v36 type:102 sessionID:v37 timeout:v38 errorHandler:v43];

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)60LL));
}

- (void)sendSetupSessionCreatedWithLocalAttestedKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v13, "setVersion:", 4LL);
  -[SDUnlockSetupSessionCreated setLongTermKey:](v13, "setLongTermKey:", v12);

  -[SDUnlockSetupSessionCreated setToken:](v13, "setToken:", v11);
  if (v10) {
    -[SDUnlockSetupSessionCreated setErrorCode:](v13, "setErrorCode:", [v10 code]);
  }
  if ((_DWORD)v6) {
    -[SDUnlockSetupSessionCreated setFailureReasons:](v13, "setFailureReasons:", v6);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v13, "data"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 45LL));
  v20[1] = 3221225472LL;
  v20[2] = sub_100020E20;
  v20[3] = &unk_1005CB4E8;
  v20[4] = self;
  v20[0] = _NSConcreteStackBlock;
  id v19 =  [v14 sendAutoUnlockPayload:v15 toDevice:v16 type:2002 sessionID:v17 queueOneID:0 timeout:v18 completion:v20];

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)60LL));
}

- (void)sendSetupCreateEscrowRecordStepData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupCreateRecord);
  uint64_t v9 = v8;
  if (v6) {
    -[SDUnlockSetupCreateRecord setToken:](v8, "setToken:", v6);
  }
  if (v7) {
    -[SDUnlockSetupCreateRecord setErrorCode:](v9, "setErrorCode:", [v7 code]);
  }
  unsigned int v10 = -[SDAutoUnlockPairingKeySession useAttestedProtocol](self, "useAttestedProtocol");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession transport](self, "transport"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord data](v9, "data"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 45LL));
  uint64_t v19 = 3221225472LL;
  unsigned int v20 = sub_100021088;
  unsigned int v21 = &unk_1005CB4E8;
  unsigned int v22 = self;
  uint64_t v18 = _NSConcreteStackBlock;
  if (v10) {
    uint64_t v16 = 2004LL;
  }
  else {
    uint64_t v16 = 104LL;
  }
  id v17 =  objc_msgSend( v11,  "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:",  v12,  v13,  v16,  v14,  0,  v15,  &v18,  v18,  v19,  v20,  v21,  v22);
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100021238;
  v14[3] = &unk_1005CB248;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unsigned __int16 v17 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (BOOL)waitingForUnlock
{
  return self->_waitingForUnlock;
}

- (void)setWaitingForUnlock:(BOOL)a3
{
  self->_waitingForUnlock = a3;
}

- (BOOL)waitingForLTK
{
  return self->_waitingForLTK;
}

- (void)setWaitingForLTK:(BOOL)a3
{
  self->_waitingForLTK = a3;
}

- (BOOL)requestedLTKForRemote
{
  return self->_requestedLTKForRemote;
}

- (void)setRequestedLTKForRemote:(BOOL)a3
{
  self->_requestedLTKForRemote = a3;
}

- (BOOL)companionViewNotSyncing
{
  return self->_companionViewNotSyncing;
}

- (void)setCompanionViewNotSyncing:(BOOL)a3
{
  self->_companionViewNotSyncing = a3;
}

- (BOOL)companionNeedsUnlock
{
  return self->_companionNeedsUnlock;
}

- (void)setCompanionNeedsUnlock:(BOOL)a3
{
  self->_companionNeedsUnlock = a3;
}

- (BOOL)companionCurrentlySyncing
{
  return self->_companionCurrentlySyncing;
}

- (void)setCompanionCurrentlySyncing:(BOOL)a3
{
  self->_companionCurrentlySyncing = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (SDUnlockSetupRequest)request
{
  return (SDUnlockSetupRequest *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end