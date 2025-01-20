@interface SDAutoUnlockLockSession
- (BOOL)attemptPrewarmed;
- (BOOL)attemptTimedOut;
- (BOOL)awdlUp;
- (BOOL)canceled;
- (BOOL)chosenDevice;
- (BOOL)connected;
- (BOOL)deviceWasLocked;
- (BOOL)doNotPostUnlockConfirmation;
- (BOOL)foundPeer;
- (BOOL)handleFoundBLEDevice:(id)a3;
- (BOOL)handleFoundBLEDevice:(id)a3 available:(BOOL)a4 lockedOnWrist:(BOOL)a5;
- (BOOL)imageDataAlreadyCached;
- (BOOL)isAcceptor;
- (BOOL)isWaitingToCompleteUnlock;
- (BOOL)lockedKeyBag;
- (BOOL)needsNewImage;
- (BOOL)oldWatch;
- (BOOL)onlyRanging;
- (BOOL)otherProviderCancel;
- (BOOL)otherSessionCancel;
- (BOOL)peerInRange:(id)a3;
- (BOOL)receivedAWDLInfo;
- (BOOL)receivedAuthPromptResponse;
- (BOOL)receivedExchangeRequest;
- (BOOL)sendingConfirmation;
- (BOOL)sentExchangeResponse;
- (BOOL)sentImageData;
- (BOOL)shouldWaitToCompleteUnlock;
- (BOOL)supportsConfirmationACK;
- (BOOL)unlockSucceeded;
- (BOOL)useProxy;
- (BOOL)usingProxy;
- (BOOL)waitingForDisplayOrClamshell;
- (BOOL)wifiState;
- (NSArray)peerList;
- (NSData)externalACMContext;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)peerMacAddress;
- (NSDate)attemptStartDate;
- (NSDate)confirmationSendDate;
- (NSDate)connectionDate;
- (NSDate)discoveryDate;
- (NSDate)displayOrClamshellWaitingDate;
- (NSDate)exchageResponseDate;
- (NSDate)firstSend;
- (NSDate)prewarmIdleStartDate;
- (NSDate)prewarmStartDate;
- (NSString)proxyDeviceModel;
- (NSString)watchBuildVersion;
- (NSString)watchModelID;
- (NSString)watchOSVersion;
- (NSUUID)bluetoothID;
- (OS_dispatch_source)confirmationTimer;
- (OS_dispatch_source)displayTimer;
- (SDAutoUnlockIconTransferStore)iconTransferStore;
- (SDAutoUnlockLockSession)initWithAutoUnlockDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SDUnlockSessionAuthToken)sessionAuthToken;
- (SFAutoUnlockDevice)autoUnlockDevice;
- (double)attemptTime;
- (double)awdlInfoExchange;
- (double)awdlTotal;
- (double)btBootstrap;
- (double)btOverall;
- (double)completeExchange;
- (double)confirmation;
- (double)connectionTime;
- (double)connectionWaitTime;
- (double)discoveryTime;
- (double)displayClamshellWaitTime;
- (double)keyRequestExchange;
- (double)peerFoundInterval;
- (double)prewarmIdleTime;
- (double)proxyConnectionTime;
- (double)proxyDiscoveryTime;
- (double)tokenExchange;
- (id)aksPeerAvailable;
- (id)attemptResults;
- (id)getAppName;
- (id)hintToken;
- (int)proxyRSSI;
- (int)watchRSSI;
- (int64_t)configChangeType;
- (int64_t)displayCount;
- (int64_t)lastSleepType;
- (int64_t)timeSinceLastMachineWake;
- (unint64_t)connectedBluetoothDevices;
- (void)_cancel;
- (void)_handleCanceledAfterSuccess;
- (void)addObservers;
- (void)cancel;
- (void)cancelWiFiRequest;
- (void)clamshellStateChanged:(id)a3;
- (void)completeAttemptIfNecessary;
- (void)completeAttemptPostNotification:(BOOL)a3;
- (void)connectionActivated;
- (void)consumeAuthTokenIfReady;
- (void)deviceConnected:(id)a3;
- (void)displayConfigChanged:(id)a3;
- (void)handleAWDLInfo:(id)a3;
- (void)handleAWDLUp;
- (void)handleAuthPromptResponse:(id)a3;
- (void)handleCanceledAfterSuccess;
- (void)handleConfirmationACK;
- (void)handleDecryptionFailure:(int64_t)a3;
- (void)handleMessageWithWrapper:(id)a3;
- (void)handlePeerFound:(BOOL)a3;
- (void)handlePeerInRange;
- (void)handlePeerOutOfRange;
- (void)handleRangingResults:(id)a3 errorCode:(int64_t)a4;
- (void)handleRangingStarted;
- (void)handleSessionAuthToken:(id)a3;
- (void)handleSessionKeyExchangeRequest:(id)a3;
- (void)handleTimerFired;
- (void)handleWiFiRequestInvalidated;
- (void)invalidate;
- (void)invalidateConfirmationTimer;
- (void)invalidateNoDisconnect;
- (void)invalidateTimerIfReady;
- (void)lockKeyBagIfNeeded;
- (void)logResults;
- (void)notifyDelegateWithError:(id)a3;
- (void)removeObservers;
- (void)restartConfirmationTimer:(unint64_t)a3 error:(id)a4;
- (void)sendAWDLInfoData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5;
- (void)sendAuthPromptImageDataIfReady:(id)a3;
- (void)sendAuthPromptRequestWithImageHash:(id)a3 appName:(id)a4;
- (void)sendKeyExchangeResponseWithData:(id)a3;
- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4;
- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4 suppressNotification:(BOOL)a5;
- (void)setAttemptPrewarmed:(BOOL)a3;
- (void)setAttemptStartDate:(id)a3;
- (void)setAttemptTime:(double)a3;
- (void)setAttemptTimedOut:(BOOL)a3;
- (void)setAutoUnlockDevice:(id)a3;
- (void)setAwdlInfoExchange:(double)a3;
- (void)setAwdlTotal:(double)a3;
- (void)setAwdlUp:(BOOL)a3;
- (void)setBluetoothID:(id)a3;
- (void)setBtBootstrap:(double)a3;
- (void)setBtOverall:(double)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setChosenDevice:(BOOL)a3;
- (void)setCompleteExchange:(double)a3;
- (void)setConfigChangeType:(int64_t)a3;
- (void)setConfirmation:(double)a3;
- (void)setConfirmationSendDate:(id)a3;
- (void)setConfirmationTimer:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectedBluetoothDevices:(unint64_t)a3;
- (void)setConnectionDate:(id)a3;
- (void)setConnectionTime:(double)a3;
- (void)setConnectionWaitTime:(double)a3;
- (void)setDeviceWasLocked:(BOOL)a3;
- (void)setDiscoveryDate:(id)a3;
- (void)setDiscoveryTime:(double)a3;
- (void)setDisplayClamshellWaitTime:(double)a3;
- (void)setDisplayCount:(int64_t)a3;
- (void)setDisplayOrClamshellWaitingDate:(id)a3;
- (void)setDisplayTimer:(id)a3;
- (void)setDoNotPostUnlockConfirmation:(BOOL)a3;
- (void)setExchageResponseDate:(id)a3;
- (void)setExternalACMContext:(id)a3;
- (void)setFirstSend:(id)a3;
- (void)setFoundPeer:(BOOL)a3;
- (void)setIconTransferStore:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageDataAlreadyCached:(BOOL)a3;
- (void)setImageHash:(id)a3;
- (void)setKeyRequestExchange:(double)a3;
- (void)setLastSleepType:(int64_t)a3;
- (void)setLockedKeyBag:(BOOL)a3;
- (void)setNeedsNewImage:(BOOL)a3;
- (void)setOldWatch:(BOOL)a3;
- (void)setOnlyRanging:(BOOL)a3;
- (void)setOtherProviderCancel:(BOOL)a3;
- (void)setOtherSessionCancel:(BOOL)a3;
- (void)setPeerFoundInterval:(double)a3;
- (void)setPeerList:(id)a3;
- (void)setPeerMacAddress:(id)a3;
- (void)setPrewarmIdleStartDate:(id)a3;
- (void)setPrewarmIdleTime:(double)a3;
- (void)setPrewarmStartDate:(id)a3;
- (void)setProxyConnectionTime:(double)a3;
- (void)setProxyDeviceModel:(id)a3;
- (void)setProxyDiscoveryTime:(double)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setReceivedAWDLInfo:(BOOL)a3;
- (void)setReceivedAuthPromptResponse:(BOOL)a3;
- (void)setReceivedExchangeRequest:(BOOL)a3;
- (void)setSendingConfirmation:(BOOL)a3;
- (void)setSentExchangeResponse:(BOOL)a3;
- (void)setSentImageData:(BOOL)a3;
- (void)setSessionAuthToken:(id)a3;
- (void)setShouldWaitToCompleteUnlock:(BOOL)a3;
- (void)setSupportsConfirmationACK:(BOOL)a3;
- (void)setTimeSinceLastMachineWake:(int64_t)a3;
- (void)setTokenExchange:(double)a3;
- (void)setUnlockSucceeded:(BOOL)a3;
- (void)setUseProxy:(BOOL)a3;
- (void)setWaitingForDisplayOrClamshell:(BOOL)a3;
- (void)setWaitingToCompleteUnlock:(BOOL)a3;
- (void)setWatchBuildVersion:(id)a3;
- (void)setWatchModelID:(id)a3;
- (void)setWatchOSVersion:(id)a3;
- (void)setWatchRSSI:(int)a3;
- (void)setWifiState:(BOOL)a3;
- (void)startAWDL;
- (void)tearDownAWDLIfNecessary;
- (void)updateImageData:(id)a3 imageHash:(id)a4;
@end

@implementation SDAutoUnlockLockSession

- (SDAutoUnlockLockSession)initWithAutoUnlockDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a3;
  v10 = (NSString *)a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLockSession;
  v13 = -[SDAutoUnlockAuthSession initWithDevice:sessionID:bleDevice:]( &v41,  "initWithDevice:sessionID:bleDevice:",  v12,  v10,  v11);

  if (v13)
  {
    uint64_t v15 = auto_unlock_log(v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Creating lock session (session ID = %@)",  buf,  0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v13, "deviceID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 idsDeviceForUniqueID:v18]);

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
    watchModelID = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 productBuildVersion]);
    watchBuildVersion = v13->_watchBuildVersion;
    v13->_watchBuildVersion = (NSString *)v22;

    id obj = a3;
    if (v19) {
      objc_msgSend(v19, "operatingSystemVersion", a3);
    }
    else {
      memset(v40, 0, sizeof(v40));
    }
    id v24 = sub_10008AD64(v40);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    watchOSVersion = v13->_watchOSVersion;
    v13->_watchOSVersion = (NSString *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v13, "deviceID"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 modelIdentifierForDeviceID:v28]);
    v30 = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v29;

    uint64_t v32 = auto_unlock_log(v31);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v13->_watchModelID;
      v35 = v13->_watchBuildVersion;
      v36 = v13->_watchOSVersion;
      *(_DWORD *)buf = 138412802;
      v43 = v34;
      __int16 v44 = 2112;
      v45 = v35;
      __int16 v46 = 2112;
      v47 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Watch info (model ID: %@, build: %@, os version: %@)",  buf,  0x20u);
    }

    objc_storeStrong((id *)&v13->_autoUnlockDevice, obj);
    v13->_watchRSSI = [v11 rssi];
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockLockSession setDeviceWasLocked:]( v13,  "setDeviceWasLocked:",  [v37 deviceKeyBagUnlocked] ^ 1);

    -[SDAutoUnlockLockSession addObservers](v13, "addObservers");
  }

  return v13;
}

- (void)invalidate
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLockSession;
  -[SDAutoUnlockAuthSession invalidate](&v10, "invalidate");
  -[SDAutoUnlockPairingSession setDelegate:](self, "setDelegate:", 0LL);
  uint64_t v3 = auto_unlock_log(-[SDAutoUnlockLockSession removeObservers](self, "removeObservers"));
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping BLE connection", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  [v5 stopUnlockBLEConnectionWithDevice:v6];

  -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  [v7 removePreventExitForLocaleReason:@"AutoUnlockConfirmationTimerPreventExitReason"];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001786A0;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)invalidateNoDisconnect
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLockSession;
  -[SDAutoUnlockAuthSession invalidate](&v2, "invalidate");
}

- (void)completeAttemptIfNecessary
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001787A4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)tearDownAWDLIfNecessary
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017890C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancel
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100178A9C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_cancel
{
  if (!-[SDAutoUnlockLockSession canceled](self, "canceled"))
  {
    -[SDAutoUnlockLockSession setCanceled:](self, "setCanceled:", 1LL);
    BOOL v3 = -[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded");
    BOOL v4 = v3;
    uint64_t v5 = auto_unlock_log(v3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v7)
      {
LABEL_11:

        return;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Lock session canceled after success (device ID: %@, session ID: %@)",  buf,  0x16u);
    }

    else
    {
      if (v7)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        __int16 v22 = 2112;
        v23 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Lock session canceled (device ID: %@, session ID: %@)",  buf,  0x16u);
      }

      if (-[SDAutoUnlockLockSession otherSessionCancel](self, "otherSessionCancel"))
      {
        uint64_t v14 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
        v19 = @"Attempt Cancelled";
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  118LL,  v6));
        -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
      }

      else
      {
        -[SDAutoUnlockLockSession lockKeyBagIfNeeded](self, "lockKeyBagIfNeeded");
        uint64_t v15 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        v17 = @"Attempt Cancelled";
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  118LL,  v6));
        -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v8);
      }
    }

    goto LABEL_11;
  }

- (void)cancelWiFiRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));

  uint64_t v5 = auto_unlock_log(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling WiFi request: %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100178E88;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not Canceling WiFi request: nil", buf, 2u);
    }
  }

- (void)lockKeyBagIfNeeded
{
  if (!-[SDAutoUnlockLockSession lockedKeyBag](self, "lockedKeyBag")
    && !-[SDAutoUnlockLockSession otherProviderCancel](self, "otherProviderCancel"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    if ([v4 deviceKeyBagUnlocked]
      && -[SDAutoUnlockLockSession deviceWasLocked](self, "deviceWasLocked"))
    {
      unsigned int v3 = -[SDAutoUnlockAuthSession aksSuccess](self, "aksSuccess");

      if (v3) {
        sub_100011800((uint64_t)-[SDAutoUnlockLockSession setLockedKeyBag:](self, "setLockedKeyBag:", 1LL));
      }
    }

    else
    {
    }
  }

- (void)handleCanceledAfterSuccess
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100179000;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_handleCanceledAfterSuccess
{
  BOOL v3 = -[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded");
  if (v3)
  {
    -[SDAutoUnlockLockSession setCanceled:](self, "setCanceled:", 1LL);
    uint64_t v4 = auto_unlock_log(-[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 14LL));
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling cancel at end", buf, 2u);
    }

    -[SDAutoUnlockLockSession lockKeyBagIfNeeded](self, "lockKeyBagIfNeeded");
  }

  else
  {
    uint64_t v6 = auto_unlock_log(v3);
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not cancelled", v8, 2u);
    }
  }

- (void)handleDecryptionFailure:(int64_t)a3
{
  if (!-[SDAutoUnlockLockSession canceled](self, "canceled")
    && !-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded"))
  {
    switch(a3)
    {
      case 191LL:
        uint64_t v5 = @"Watch Missing Encryption Key";
        break;
      case 198LL:
        uint64_t v5 = @"Watch Missing IDS Device For BT UUID";
        break;
      case 195LL:
        uint64_t v5 = @"Watch Not First Unlocked";
        break;
      default:
        uint64_t v5 = @"Decryption failure";
        break;
    }

    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    objc_super v10 = v5;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  a3,  v7));

    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
  }

- (void)addObservers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"deviceConnected:" name:SFBluetoothNotificationNameConnected object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"displayConfigChanged:" name:@"com.apple.sharingd.ExternalDisplaysChanged" object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"clamshellStateChanged:" name:@"com.apple.sharingd.ClamshellStatusChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)clamshellStateChanged:(id)a3
{
  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell", a3))
  {
    uint64_t v4 = auto_unlock_log(-[SDAutoUnlockLockSession setConfigChangeType:](self, "setConfigChangeType:", 1LL));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clamshell changed", v6, 2u);
    }

    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }

- (void)displayConfigChanged:(id)a3
{
  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell", a3))
  {
    uint64_t v4 = auto_unlock_log(-[SDAutoUnlockLockSession setConfigChangeType:](self, "setConfigChangeType:", 2LL));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Display config changed", v6, 2u);
    }

    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }

- (void)logResults
{
  BOOL v3 = -[SDAutoUnlockLockSession attemptTimedOut](self, "attemptTimedOut");
  BOOL v4 = v3;
  uint64_t v5 = auto_unlock_log(v3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      LOWORD(v146) = 0;
      v8 = "Attempt timed out for session";
      NSErrorUserInfoKey v9 = v6;
      uint32_t v10 = 2;
LABEL_84:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v146, v10);
    }
  }

  else
  {
    if (v7)
    {
      unsigned int v11 = -[SDAutoUnlockLockSession usingProxy](self, "usingProxy");
      *(double *)&v12 = COERCE_DOUBLE(@"YES");
      if (!v11) {
        *(double *)&v12 = COERCE_DOUBLE(@"NO");
      }
      int v146 = 138412290;
      double v147 = *(double *)&v12;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Automation: Used Proxy Device %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v14 = auto_unlock_log(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchModelID](self, "watchModelID")));
      int v146 = 138412290;
      double v147 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Automation: Key Device Model %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v18 = auto_unlock_log(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel")));
      int v146 = 138412290;
      double v147 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Automation: Proxy Device Model %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v22 = auto_unlock_log(v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
      int v146 = 134217984;
      double v147 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Automation: Phone Bluetooth Discovery %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v26 = auto_unlock_log(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
      int v146 = 134217984;
      double v147 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Automation: Phone Connection Time %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v30 = auto_unlock_log(v29);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
      if (v32 == 0.0)
      {
        double v38 = 0.0;
      }

      else
      {
        -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
        double v34 = v33;
        -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
        double v36 = v34 - v35;
        -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
        double v38 = v36 - v37;
      }

      int v146 = 134217984;
      double v147 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Automation: Watch Bluetooth Discovery %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v40 = auto_unlock_log(v39);
    objc_super v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession connectionWaitTime](self, "connectionWaitTime");
      int v146 = 134217984;
      double v147 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Automation: Watch Connection Wait Time %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v44 = auto_unlock_log(v43);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession connectionTime](self, "connectionTime");
      int v146 = 134217984;
      double v147 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Automation: Watch Connection Time %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v48 = auto_unlock_log(v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession awdlInfoExchange](self, "awdlInfoExchange");
      int v146 = 134217984;
      double v147 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Info Exchange %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v52 = auto_unlock_log(v51);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession keyRequestExchange](self, "keyRequestExchange");
      int v146 = 134217984;
      double v147 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Key Exchange %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v56 = auto_unlock_log(v55);
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession tokenExchange](self, "tokenExchange");
      int v146 = 134217984;
      double v147 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Token Exchange %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v60 = auto_unlock_log(v59);
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession confirmation](self, "confirmation");
      int v146 = 134217984;
      double v147 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Unlock Confirmation %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v64 = auto_unlock_log(v63);
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
      int v146 = 134217984;
      double v147 = v66;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Automation: AWDL Bring Up %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v68 = auto_unlock_log(v67);
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
      int v146 = 134217984;
      double v147 = v70;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Automation: Peer Found %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v72 = auto_unlock_log(v71);
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockAuthSession rangingInterval](self, "rangingInterval");
      int v146 = 134217984;
      double v147 = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Automation: Ranging Results %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v76 = auto_unlock_log(v75);
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v78 = -[SDAutoUnlockLockSession configChangeType](self, "configChangeType");
      double v79 = 0.0;
      if (v78 == 2) {
        -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime", 0.0);
      }
      int v146 = 134217984;
      double v147 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Automation: Time Waiting For Display %0.2f",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v81 = auto_unlock_log(v80);
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v83 = -[SDAutoUnlockLockSession configChangeType](self, "configChangeType");
      double v84 = 0.0;
      if (v83 == 1) {
        -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime", 0.0);
      }
      int v146 = 134217984;
      double v147 = v84;
      _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Automation: Time Waiting For Clamshell %0.2f",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v86 = auto_unlock_log(v85);
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession awdlTotal](self, "awdlTotal");
      int v146 = 134217984;
      double v147 = v88;
      _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Automation: Wi-Fi Total %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v90 = auto_unlock_log(v89);
    v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btBootstrap](self, "btBootstrap");
      int v146 = 134217984;
      double v147 = v92;
      _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Bootstrap Total %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v94 = auto_unlock_log(v93);
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btBootstrap](self, "btBootstrap");
      double v97 = v96;
      -[SDAutoUnlockLockSession awdlTotal](self, "awdlTotal");
      double v99 = v97 + v98;
      -[SDAutoUnlockLockSession confirmation](self, "confirmation");
      int v146 = 134217984;
      double v147 = v99 + v100;
      _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "Automation: Bootstrap + Wi-Fi Total + Confirmation %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v102 = auto_unlock_log(v101);
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession btOverall](self, "btOverall");
      int v146 = 134217984;
      double v147 = v104;
      _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "Automation: Bluetooth Overall Total %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    BOOL v105 = -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed");
    if (v105)
    {
      uint64_t v106 = auto_unlock_log(v105);
      v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
        int v146 = 134217984;
        double v147 = v108;
        _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "Automation: Idle time due to prewarming %0.2fs",  (uint8_t *)&v146,  0xCu);
      }
    }

    uint64_t v109 = auto_unlock_log(v105);
    v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession completeExchange](self, "completeExchange");
      int v146 = 134217984;
      double v147 = v111;
      _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEFAULT,  "Automation: Complete exchange %0.2fs",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v113 = auto_unlock_log(v112);
    v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v115 = -[SDAutoUnlockLockSession watchRSSI](self, "watchRSSI");
      int v146 = 67109120;
      LODWORD(v147) = v115;
      _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "Automation: Key Device RSSI %d",  (uint8_t *)&v146,  8u);
    }

    uint64_t v117 = auto_unlock_log(v116);
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v119 = -[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI");
      int v146 = 67109120;
      LODWORD(v147) = v119;
      _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "Automation: Proxy Device RSSI %d",  (uint8_t *)&v146,  8u);
    }

    uint64_t v121 = auto_unlock_log(v120);
    v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v123 = -[SDAutoUnlockAuthSession shouldUnlock](self, "shouldUnlock");
      *(double *)&v124 = COERCE_DOUBLE(@"YES");
      if (!v123) {
        *(double *)&v124 = COERCE_DOUBLE(@"NO");
      }
      int v146 = 138412290;
      double v147 = *(double *)&v124;
      _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "Automation: Within Range %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v126 = auto_unlock_log(v125);
    v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v128 = -[SDAutoUnlockLockSession connectedBluetoothDevices](self, "connectedBluetoothDevices");
      int v146 = 67109120;
      LODWORD(v147) = v128;
      _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "Automation: Already Connected Bluetooth Devices %d",  (uint8_t *)&v146,  8u);
    }

    uint64_t v130 = auto_unlock_log(v129);
    v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&int64_t v132 = COERCE_DOUBLE((id)-[SDAutoUnlockLockSession timeSinceLastMachineWake]( self,  "timeSinceLastMachineWake"));
      int v146 = 134217984;
      double v147 = *(double *)&v132;
      _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "Automation: Time Since Last Wake %ld seconds",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v134 = auto_unlock_log(v133);
    v135 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      -[SDAutoUnlockLockSession lastSleepType](self, "lastSleepType");
      v136 = sub_10008B388();
      double v137 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue(v136));
      int v146 = 138412290;
      double v147 = v137;
      _os_log_impl( (void *)&_mh_execute_header,  v135,  OS_LOG_TYPE_DEFAULT,  "Automation: Last Sleep Type %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v139 = auto_unlock_log(v138);
    v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v141 = -[SDAutoUnlockLockSession canceled](self, "canceled");
      *(double *)&v142 = COERCE_DOUBLE(@"YES");
      if (!v141) {
        *(double *)&v142 = COERCE_DOUBLE(@"NO");
      }
      int v146 = 138412290;
      double v147 = *(double *)&v142;
      _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEFAULT,  "Automation: Cancelled %@",  (uint8_t *)&v146,  0xCu);
    }

    uint64_t v144 = auto_unlock_log(v143);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v145 = COERCE_DOUBLE(@"NO");
      if (-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded")
        && !-[SDAutoUnlockLockSession canceled](self, "canceled"))
      {
        *(double *)&v145 = COERCE_DOUBLE(@"YES");
      }

      int v146 = 138412290;
      double v147 = *(double *)&v145;
      v8 = "Automation: Successful Session %@";
      NSErrorUserInfoKey v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_84;
    }
  }
}

- (id)attemptResults
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  SDAutoUnlockManagerMetricDeviceIDKey);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchModelID](self, "watchModelID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  SDAutoUnlockManagerMetricKeyDeviceModelKey);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchBuildVersion](self, "watchBuildVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  SDAutoUnlockManagerMetricWatchBuildVersionKey);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession watchOSVersion](self, "watchOSVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  SDAutoUnlockManagerMetricWatchOSVersionKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
  if (v8)
  {
    NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  SDAutoUnlockManagerMetricProxyDeviceModelKey);
  }

  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDAutoUnlockLockSession usingProxy](self, "usingProxy")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  SDAutoUnlockManagerMetricUsingProxyDeviceKey);

  -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
  if (v11 == 0.0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &off_1005F7D80,  SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey);
  }

  else
  {
    -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
    double v13 = v12;
    -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
    double v15 = v13 - v14;
    -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 - v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v17,  SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey);
  }

  -[SDAutoUnlockLockSession proxyDiscoveryTime](self, "proxyDiscoveryTime");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);

  -[SDAutoUnlockLockSession connectionTime](self, "connectionTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v19,  SDAutoUnlockManagerMetricBluetoothKeyConnectionKey);

  -[SDAutoUnlockLockSession proxyConnectionTime](self, "proxyConnectionTime");
  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  SDAutoUnlockManagerMetricBluetoothProxyConnectionKey);

  -[SDAutoUnlockLockSession awdlInfoExchange](self, "awdlInfoExchange");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  SDAutoUnlockManagerMetricBluetoothAWDLExchangeKey);

  -[SDAutoUnlockLockSession keyRequestExchange](self, "keyRequestExchange");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  SDAutoUnlockManagerMetricBluetoothKeyRequestExchangeKey);

  -[SDAutoUnlockLockSession tokenExchange](self, "tokenExchange");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v23,  SDAutoUnlockManagerMetricBluetoothTokenExchangeKey);

  -[SDAutoUnlockLockSession confirmation](self, "confirmation");
  double v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v24,  SDAutoUnlockManagerMetricBluetoothConfirmationKey);

  if (-[SDAutoUnlockLockSession unlockSucceeded](self, "unlockSucceeded")) {
    uint64_t v25 = -[SDAutoUnlockLockSession canceled](self, "canceled") ^ 1;
  }
  else {
    uint64_t v25 = 0LL;
  }
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v25));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v26,  SDAutoUnlockManagerMetricSuccessKey);

  -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v27,  SDAutoUnlockManagerMetricAWDLBringUpKey);

  -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
  double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v28,  SDAutoUnlockManagerMetricAWDLPeerFoundKey);

  -[SDAutoUnlockAuthSession rangingInterval](self, "rangingInterval");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v29,  SDAutoUnlockManagerMetricAWDLRangingKey);

  if ((id)-[SDAutoUnlockLockSession configChangeType](self, "configChangeType") == (id)2)
  {
    uint64_t v30 = &SDAutoUnlockManagerMetricDisplayWaitKey;
  }

  else
  {
    if ((id)-[SDAutoUnlockLockSession configChangeType](self, "configChangeType") != (id)1) {
      goto LABEL_14;
    }
    uint64_t v30 = &SDAutoUnlockManagerMetricClamshellWaitKey;
  }

  -[SDAutoUnlockLockSession displayClamshellWaitTime](self, "displayClamshellWaitTime");
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v31, *v30);

LABEL_14:
  double v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));

  if (v32)
  {
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    double v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v33 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v34,  SDAutoUnlockManagerMetricErrorCodeKey);

    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    double v36 = (void *)objc_claimAutoreleasedReturnValue([v35 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v36,  SDAutoUnlockManagerMetricErrorDomainKey);

    double v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));
    double v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v38,  SDAutoUnlockManagerMetricErrorStringKey);
  }

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockAuthSession errorType](self, "errorType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v39,  SDAutoUnlockManagerMetricErrorTypeKey);

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SDAutoUnlockLockSession watchRSSI](self, "watchRSSI")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v40,  SDAutoUnlockManagerMetricKeyDeviceRSSIKey);

  if (-[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI"))
  {
    objc_super v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SDAutoUnlockLockSession proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v41,  SDAutoUnlockManagerMetricProxyDeviceRSSIKey);
  }

  double v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession distance](self, "distance"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v42,  SDAutoUnlockManagerMetricDistanceKey);

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDAutoUnlockAuthSession shouldUnlock](self, "shouldUnlock")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v43,  SDAutoUnlockManagerMetricWithinRangeKey);

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v44,  SDAutoUnlockManagerMetricPrewarmKey);

  -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v45,  SDAutoUnlockManagerMetricPrewarmTimeKey);

  -[SDAutoUnlockLockSession attemptTime](self, "attemptTime");
  double v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v46,  SDAutoUnlockManagerMetricAttemptTimeKey);

  -[SDAutoUnlockLockSession completeExchange](self, "completeExchange");
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v47,  SDAutoUnlockManagerMetricTimeKey);

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRangingResults](self, "wifiRangingResults"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v48,  SDAutoUnlockManagerMetricWiFiResultsKey);

  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[SDAutoUnlockLockSession connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v49,  SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  double v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockLockSession timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v50,  SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockLockSession lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v51,  SDAutoUnlockManagerMetricLastSleepTypeKey);

  return v3;
}

- (BOOL)isAcceptor
{
  return 0;
}

- (id)hintToken
{
  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2
    && (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession")),
        unsigned int v4 = [v3 sessionIsValid],
        v3,
        v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 generateACMContextData]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)usingProxy
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice"));
  if ([v3 supportsAlwaysDirect])
  {
    BOOL v4 = 0;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession proxyDeviceModel](self, "proxyDeviceModel"));
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (id)getAppName
{
  return 0LL;
}

- (void)updateImageData:(id)a3 imageHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
  if (v8 == 2)
  {
    uint64_t v10 = SFMainQueue(2LL, v9);
    double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10017AA90;
    block[3] = &unk_1005CBC20;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v11, block);
  }

  else
  {
    uint64_t v12 = auto_unlock_log(v8);
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100181344();
    }
  }
}

- (void)setChosenDevice:(BOOL)a3
{
  uint64_t v5 = SFMainQueue(self, a2);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017AD5C;
  v7[3] = &unk_1005CC3A8;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10017AEF8;
  v6[3] = &unk_1005CC3A8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10017AF94;
  v6[3] = &unk_1005CC3A8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)connectionActivated
{
  if (-[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    -[SDAutoUnlockAuthSession setUseAKSToken:]( self,  "setUseAKSToken:",  [v3 canCreateTokenSessionForDeviceID:v4]);

    uint64_t v6 = auto_unlock_log(v5);
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to create token session, using escrow",  (uint8_t *)&v18,  2u);
    }
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDAutoUnlockLockSession setFirstSend:](self, "setFirstSend:", v8);

  uint64_t v10 = auto_unlock_log(v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    int v18 = 138412290;
    v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Starting BLE connection %@",  (uint8_t *)&v18,  0xCu);
  }

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 17LL);
  uint64_t v13 = -[SDAutoUnlockAuthSession useEncryption](self, "useEncryption") ^ 1;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  [v14 startUnlockBLEConnectionWithDevice:v15 encrypted:v13];

  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)1
    || (id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice")),
        unsigned __int8 v17 = [v16 supportsApproveIcon],
        v16,
        (v17 & 1) == 0))
  {
    -[SDAutoUnlockAuthSession sendAWDLInfo](self, "sendAWDLInfo");
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)35LL));
  }

- (BOOL)handleFoundBLEDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10008A0A0(v4);
  LOBYTE(self) = -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:]( self,  "handleFoundBLEDevice:available:lockedOnWrist:",  v4,  v5,  sub_10008A0F8(v4));

  return (char)self;
}

- (BOOL)handleFoundBLEDevice:(id)a3 available:(BOOL)a4 lockedOnWrist:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = auto_unlock_log(self);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    if (v5) {
      double v11 = @"YES";
    }
    else {
      double v11 = @"NO";
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession autoUnlockDevice](self, "autoUnlockDevice"));
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    double v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Found Device {\n\tavailable: %@,\n\tlocked on wrist: %@\n\tdevice:%@\n}",  buf,  0x20u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
  if (!v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAutoUnlockLockSession setDiscoveryDate:](self, "setDiscoveryDate:", v15);

    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession aksPeerAvailable](self, "aksPeerAvailable"));
    if (v17)
    {
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
    }

    else
    {
      if (v6)
      {
        BOOL v14 = 1;
        -[SDAutoUnlockLockSession setFoundPeer:](self, "setFoundPeer:", 1LL);
        int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
        [v18 sessionDidStartConnection:self];

LABEL_20:
        return v14;
      }

      if (v5)
      {
        uint64_t v19 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_ON_WRIST", v16);
        double v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v21 = 135LL;
      }

      else
      {
        double v20 = @"Watch Not On Wrist";
        uint64_t v21 = 158LL;
      }

      uint64_t v22 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      v27 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      double v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v21,  v23));
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v24);
    }

    BOOL v14 = 0;
    goto LABEL_20;
  }

  return 1;
}

- (void)deviceConnected:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAutoUnlockLockSession setConnectionDate:](self, "setConnectionDate:", v10);

    double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectStart]);
    [v11 doubleValue];
    double v13 = v12;

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v13));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
    [v15 timeIntervalSinceDate:v14];
    -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
    if (v16)
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession discoveryDate](self, "discoveryDate"));
      [v17 timeIntervalSinceDate:v14];
      -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

      int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime]);
      [v18 doubleValue];
      double v20 = v19;
      -[SDAutoUnlockLockSession discoveryTime](self, "discoveryTime");
      double v22 = v20 - v21;
    }

    else
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime]);
      [v18 doubleValue];
    }

    -[SDAutoUnlockLockSession setConnectionTime:](self, "setConnectionTime:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
    [v14 timeIntervalSinceDate:v23];
    -[SDAutoUnlockLockSession setConnectionWaitTime:](self, "setConnectionWaitTime:");

    -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 9LL);
    uint64_t v24 = auto_unlock_log(-[SDAutoUnlockLockSession setConnected:](self, "setConnected:", 1LL));
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Device connected %@", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (id)aksPeerAvailable
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteLTKForDeviceID:v4]);

  uint64_t v6 = sub_10001204C(v5);
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v7 = 0LL;
  }

  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = auto_unlock_log(v6);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = sub_1000124BC(v8);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412290;
      double v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer not available %@", buf, 0xCu);
    }

    uint64_t v14 = sub_100089768(v8, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    double v20 = v15;
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  128LL,  v17));
  }

  return v7;
}

- (void)invalidateTimerIfReady
{
  if (-[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo"))
  {
    if (-[SDAutoUnlockLockSession receivedExchangeRequest](self, "receivedExchangeRequest")) {
      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    }
  }

- (void)handleTimerFired
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timer fired", buf, 2u);
  }

  if (-[SDAutoUnlockLockSession onlyRanging](self, "onlyRanging"))
  {
    id v5 = SFAutoUnlockErrorDomain;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));

    if (v6)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));
      uint64_t v8 = (uint64_t)[v7 code];

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession startAWDLError](self, "startAWDLError"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 domain]);

      double v11 = @"Failed to Start AWDL";
      id v5 = (id)v10;
    }

    else
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingStart](self, "rangingStart"));

      if (v20)
      {
        double v11 = @"Ranging Timeout: Results Not Returned";
        uint64_t v8 = 137LL;
      }

      else
      {
        -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 6LL);
        double v11 = @"Ranging Timeout: Couldn’t Find Peer";
        uint64_t v8 = 138LL;
      }
    }

    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    double v37 = v11;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  v8,  v25));

    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v26);
  }

  else
  {
    BOOL v12 = -[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell");
    if (v12)
    {
      uint64_t v13 = auto_unlock_log(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Timeout while waiting for a display or clamshell",  buf,  2u);
      }

      uint64_t v15 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      double v35 = @"Mac Clamshelled Without Display";
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  145LL,  v16));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v17);
      -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0LL);
      int v18 = objc_opt_new(&OBJC_CLASS___NSDate);
      NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession displayOrClamshellWaitingDate](self, "displayOrClamshellWaitingDate"));
      -[NSDate timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v19);
      -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");
    }

    else
    {
      if (-[SDAutoUnlockLockSession foundPeer](self, "foundPeer"))
      {
        if (-[SDAutoUnlockLockSession connected](self, "connected"))
        {
          -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 3LL);
          v28.receiver = self;
          v28.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLockSession;
          -[SDAutoUnlockPairingSession handleTimerFired](&v28, "handleTimerFired");
          return;
        }

        uint64_t v27 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
        uint64_t v31 = @"Watch Failed to Connect";
        double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
        uint64_t v23 = v27;
        uint64_t v24 = 186LL;
      }

      else
      {
        uint64_t v21 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        double v33 = @"Apple Watch Not Found";
        double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
        uint64_t v23 = v21;
        uint64_t v24 = 131LL;
      }

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  v24,  v22));

      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
    }
  }

- (void)restartConfirmationTimer:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v7 = auto_unlock_log(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restarting confirmation timer", buf, 2u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  if (!v9)
  {
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    uint64_t v10 = &_dispatch_main_q;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    unsigned __int8 v17 = sub_10017BED8;
    int v18 = &unk_1005CB140;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v6;
    double v11 = sub_100114598(0, &_dispatch_main_q, &v15);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[SDAutoUnlockLockSession setConfirmationTimer:](self, "setConfirmationTimer:", v12, v15, v16, v17, v18);

    uint64_t v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
    dispatch_resume(v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  uint64_t v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  sub_100114638(v14, a3);
}

- (void)invalidateConfirmationTimer
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating confirmation timer", v7, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationTimer](self, "confirmationTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockLockSession setConfirmationTimer:](self, "setConfirmationTimer:", 0LL);
  }

- (void)handleRangingResults:(id)a3 errorCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017C09C;
  block[3] = &unk_1005CBF30;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)peerInRange:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v6 = [v5 BOOLForKey:@"phoneAutoUnlockSkipRanging"];
    if ((_DWORD)v6)
    {
      uint64_t v7 = auto_unlock_log(v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping ranging due to default phoneAutoUnlockSkipRanging",  v12,  2u);
      }

      LOBYTE(v8) = 1;
      uint64_t v9 = self;
      uint64_t v10 = 1LL;
      goto LABEL_9;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 distanceMeters]);
  -[SDAutoUnlockAuthSession setDistance:](self, "setDistance:", v8);

  LODWORD(v8) = [v5 shouldUnlock];
  if ((_DWORD)v8)
  {
    uint64_t v10 = (uint64_t)[v5 shouldUnlock];
    uint64_t v9 = self;
LABEL_9:
    -[SDAutoUnlockAuthSession setShouldUnlock:](v9, "setShouldUnlock:", v10);
  }

  return (char)v8;
}

- (void)handlePeerInRange
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (!v4)
  {
    uint64_t v5 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (__CFString *)sub_10008E500(0LL);
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handlePeerInRange %@", buf, 0xCu);
    }

    id v8 = objc_opt_new(&OBJC_CLASS___NSDate);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v9);
    -[SDAutoUnlockLockSession setAwdlTotal:](self, "setAwdlTotal:");

    -[SDAutoUnlockLockSession setOnlyRanging:](self, "setOnlyRanging:", 0LL);
    if (-[SDAutoUnlockAuthSession isAuthenticatingForSiri](self, "isAuthenticatingForSiri"))
    {
      uint64_t v10 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      unsigned __int8 v17 = @"Siri SPI Succeeded";
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  218LL,  v11));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v12);
      -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);
LABEL_11:

      return;
    }

    if (-[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed"))
    {
      BOOL v13 = -[SDAutoUnlockLockSession shouldWaitToCompleteUnlock](self, "shouldWaitToCompleteUnlock");
      if (v13)
      {
        uint64_t v14 = auto_unlock_log(v13);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempt was prewarmed and not told to complete, waiting for trigger to complete unlock.",  buf,  2u);
        }

        -[SDAutoUnlockLockSession setWaitingToCompleteUnlock:](self, "setWaitingToCompleteUnlock:", 1LL);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[SDAutoUnlockLockSession setPrewarmIdleStartDate:](self, "setPrewarmIdleStartDate:", v12);
        goto LABEL_11;
      }
    }

    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
  }

- (void)handlePeerOutOfRange
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  if (!-[SDAutoUnlockLockSession canceled](self, "canceled"))
  {
    id v4 = SFAutoUnlockErrorDomain;
    if (-[SDAutoUnlockAuthSession rangingTimedOut](self, "rangingTimedOut"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingErrorString](self, "rangingErrorString"));
      uint64_t v6 = -[SDAutoUnlockAuthSession wifiRangingErrorCode](self, "wifiRangingErrorCode");
      if (v6)
      {
        int64_t v7 = -[SDAutoUnlockAuthSession wifiRangingErrorCode](self, "wifiRangingErrorCode");
        uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiErrorDomain](self, "wifiErrorDomain"));

        id v4 = (id)v8;
      }

      else
      {
        int64_t v7 = 139LL;
      }
    }

    else
    {
      -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 8LL);
      uint64_t v10 = SFLocalizedStringForKey(@"UNLOCK_OUT_OF_RANGE", v9);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v5 = (void *)v6;
      int64_t v7 = 130LL;
    }

    uint64_t v11 = auto_unlock_log(v6);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018139C();
    }

    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v16 = v5;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  v7,  v13));

    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v14);
  }

- (void)handleAWDLUp
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
  if (v3 && (v13 = v3, v4 = -[SDAutoUnlockLockSession awdlUp](self, "awdlUp"), uint64_t v3 = v13, (v4 & 1) == 0))
  {
    -[SDAutoUnlockLockSession peerFoundInterval](self, "peerFoundInterval");
    double v6 = v5;

    if (v6 == 0.0)
    {
      -[SDAutoUnlockLockSession setAwdlUp:](self, "setAwdlUp:", 1LL);
      int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
      [v7 timeIntervalSinceDate:v8];
      -[SDAutoUnlockAuthSession setAwdlInterval:](self, "setAwdlInterval:");

      uint64_t v10 = auto_unlock_log(v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AWDL up (%.2f)", buf, 0xCu);
      }
    }
  }

  else
  {
  }

- (void)handlePeerFound:(BOOL)a3
{
  if (a3)
  {
    -[SDAutoUnlockLockSession setPeerFoundInterval:](self, "setPeerFoundInterval:", 0.0);
  }

  else
  {
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSDate);
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v4);
    double v6 = v5;
    -[SDAutoUnlockAuthSession awdlInterval](self, "awdlInterval");
    -[SDAutoUnlockLockSession setPeerFoundInterval:](self, "setPeerFoundInterval:", v6 - v7);
  }

- (void)handleRangingStarted
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDAutoUnlockAuthSession setRangingStart:](self, "setRangingStart:", v3);

  kdebug_trace(725286948LL, 0LL, 0LL, 0LL, 0LL);
  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 12LL);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = [v4 integerForKey:@"phoneAutoUnlockAWDLRangingTimeout"];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t v7 = auto_unlock_log(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1001813FC();
    }

    double v9 = (double)v6;
  }

  else
  {
    double v9 = 10.0;
  }

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(v9));
}

- (void)handleWiFiRequestInvalidated
{
  uint64_t v2 = auto_unlock_log(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WiFi request invalidated", v4, 2u);
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession attemptError](self, "attemptError"));

  if (!v5) {
    id v6 = -[SDAutoUnlockAuthSession setAttemptError:](self, "setAttemptError:", v4);
  }
  uint64_t v7 = auto_unlock_log(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Auth lock session notifying delegate with error: %@",  (uint8_t *)&v18,  0xCu);
  }

  if (v4)
  {
    BOOL v10 = -[SDAutoUnlockLockSession otherSessionCancel](self, "otherSessionCancel");
    if (v10) {
      goto LABEL_12;
    }
    uint64_t v11 = auto_unlock_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      int v18 = 138412290;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Automation: Session Dismissed: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    uint64_t v14 = auto_unlock_log(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Automation: Success", (uint8_t *)&v18, 2u);
    }
  }

LABEL_12:
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  char v16 = objc_opt_respondsToSelector(v15, "session:didCompleteWithError:");

  if ((v16 & 1) != 0)
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    [v17 session:self didCompleteWithError:v4];
  }
}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messageType];
  switch((int)v5)
  {
    case 7:
      kdebug_trace(725286928LL, 0LL, 0LL, 0LL, 0LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
      [v6 timeIntervalSinceDate:v7];
      -[SDAutoUnlockLockSession setKeyRequestExchange:](self, "setKeyRequestExchange:");

      uint64_t v9 = auto_unlock_log(v8);
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received SDUnlockSessionKeyExchangeRequest",  buf,  2u);
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v11);
      goto LABEL_18;
    case 8:
    case 10:
    case 12:
      goto LABEL_19;
    case 9:
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      char v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession exchageResponseDate](self, "exchageResponseDate"));
      [v15 timeIntervalSinceDate:v16];
      -[SDAutoUnlockLockSession setTokenExchange:](self, "setTokenExchange:");

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
      [v17 timeIntervalSinceDate:v18];
      -[SDAutoUnlockLockSession setBtBootstrap:](self, "setBtBootstrap:");

      uint64_t v19 = kdebug_trace(725286936LL, 0LL, 0LL, 0LL, 0LL);
      uint64_t v20 = auto_unlock_log(v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received SDUnlockSessionAuthToken",  v24,  2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockLockSession handleSessionAuthToken:](self, "handleSessionAuthToken:", v11);
      goto LABEL_18;
    case 11:
      -[SDAutoUnlockLockSession invalidateConfirmationTimer](self, "invalidateConfirmationTimer");
      -[SDAutoUnlockLockSession handleConfirmationACK](self, "handleConfirmationACK");
      goto LABEL_19;
    case 13:
      uint64_t v22 = auto_unlock_log(v5);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockAuthPromptResponse",  v26,  2u);
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockLockSession handleAuthPromptResponse:](self, "handleAuthPromptResponse:", v11);
      goto LABEL_18;
    default:
      if ((_DWORD)v5 != 301) {
        goto LABEL_19;
      }
      kdebug_trace(725286924LL, 0LL, 0LL, 0LL, 0LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession connectionDate](self, "connectionDate"));
      uint64_t v14 = v13;
      if (!v13) {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession firstSend](self, "firstSend"));
      }
      [v12 timeIntervalSinceDate:v14];
      -[SDAutoUnlockLockSession setAwdlInfoExchange:](self, "setAwdlInfoExchange:");
      if (!v13) {

      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
      -[SDAutoUnlockLockSession handleAWDLInfo:](self, "handleAWDLInfo:", v11);
LABEL_18:

LABEL_19:
      return;
  }

- (void)handleAWDLInfo:(id)a3
{
  id v4 = a3;
  if (!-[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo"))
  {
    -[SDAutoUnlockLockSession setReceivedAWDLInfo:](self, "setReceivedAWDLInfo:", 1LL);
    if (!-[SDAutoUnlockLockSession sentExchangeResponse](self, "sentExchangeResponse")) {
      -[SDAutoUnlockLockSession invalidateTimerIfReady](self, "invalidateTimerIfReady");
    }
    id v5 = -[SDAutoUnlockAWDLInfo initWithData:](objc_alloc(&OBJC_CLASS___SDAutoUnlockAWDLInfo), "initWithData:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo awdlInfo](v5, "awdlInfo"));
    id v7 = sub_100089EF4(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    uint64_t v10 = auto_unlock_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v42 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received AWDL Info %@", buf, 0xCu);
    }

    if (!v8)
    {
      uint64_t v28 = auto_unlock_log(v12);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10018145C();
      }

      goto LABEL_36;
    }

    -[SDAutoUnlockAuthSession setRemoteAWDLInfo:](self, "setRemoteAWDLInfo:", v8);
    if (sub_10008E24C(@"AURestrictOldWatch", 1LL)
      && -[SDAutoUnlockAWDLInfo version](v5, "version") < 3uLL)
    {
      -[SDAutoUnlockLockSession setOldWatch:](self, "setOldWatch:", 1LL);
      id v13 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Watch using old protocol (version: %d)",  -[SDAutoUnlockAWDLInfo version](v5, "version")));
      uint64_t v14 = auto_unlock_log(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100181488();
      }

      uint64_t v16 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      uint64_t v40 = v13;
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
      uint64_t v18 = v16;
      uint64_t v19 = 126LL;
    }

    else
    {
      if (-[SDAutoUnlockAWDLInfo hasSupportsConfirmationACK](v5, "hasSupportsConfirmationACK"))
      {
        BOOL v20 = -[SDAutoUnlockAWDLInfo supportsConfirmationACK](v5, "supportsConfirmationACK");
        if (v20)
        {
          uint64_t v21 = auto_unlock_log(v20);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Session supports confirmation ACK",  buf,  2u);
          }

          -[SDAutoUnlockLockSession setSupportsConfirmationACK:]( self,  "setSupportsConfirmationACK:",  -[SDAutoUnlockAWDLInfo supportsConfirmationACK](v5, "supportsConfirmationACK"));
        }
      }

      if (-[SDAutoUnlockAWDLInfo hasKeyData](v5, "hasKeyData")
        || -[SDAutoUnlockAWDLInfo hasErrorCode](v5, "hasErrorCode"))
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest);
        -[SDUnlockSessionKeyExchangeRequest setVersion:]( v13,  "setVersion:",  -[SDAutoUnlockAWDLInfo version](v5, "version"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo keyData](v5, "keyData"));
        -[SDUnlockSessionKeyExchangeRequest setKey:](v13, "setKey:", v23);

        -[SDUnlockSessionKeyExchangeRequest setUsingRecord:]( v13,  "setUsingRecord:",  -[SDAutoUnlockAWDLInfo useToken](v5, "useToken") ^ 1);
        if (-[SDAutoUnlockAWDLInfo hasErrorCode](v5, "hasErrorCode")) {
          -[SDUnlockSessionKeyExchangeRequest setErrorCode:]( v13,  "setErrorCode:",  -[SDAutoUnlockAWDLInfo errorCode](v5, "errorCode"));
        }
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v13, "data"));
        -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v24);

        uint64_t v26 = auto_unlock_log(v25);
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using new protocol", buf, 2u);
        }

        goto LABEL_35;
      }

      id v30 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
      if ((_DWORD)v30 == 1)
      {
        uint64_t v31 = auto_unlock_log(v30);
        NSErrorUserInfoKey v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", buf, 2u);
        }

        -[SDAutoUnlockAuthSession setProtocol:](self, "setProtocol:", 0LL);
        goto LABEL_36;
      }

      id v13 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received AWDL Info message missing information (info: %@)",  v5));
      uint64_t v33 = auto_unlock_log(v13);
      NSErrorUserInfoKey v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100181488();
      }

      uint64_t v35 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      double v38 = v13;
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      uint64_t v18 = v35;
      uint64_t v19 = 103LL;
    }

    NSErrorUserInfoKey v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  v19,  v17));
    -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v36);

LABEL_35:
LABEL_36:
  }
}

- (void)handleAuthPromptResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDAutoUnlockLockSession receivedAuthPromptResponse](self, "receivedAuthPromptResponse");
  if (v5)
  {
    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001814E8();
    }
  }

  else
  {
    -[SDAutoUnlockLockSession setReceivedAuthPromptResponse:](self, "setReceivedAuthPromptResponse:", 1LL);
    id v7 = -[SDAutoUnlockAuthPromptResponse initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAuthPromptResponse),  "initWithData:",  v4);
    if ((-[os_log_s hasKeyData](v7, "hasKeyData") & 1) != 0
      || -[os_log_s hasErrorCode](v7, "hasErrorCode"))
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest);
      -[SDUnlockSessionKeyExchangeRequest setVersion:](v8, "setVersion:", -[os_log_s version](v7, "version"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s keyData](v7, "keyData"));
      -[SDUnlockSessionKeyExchangeRequest setKey:](v8, "setKey:", v9);

      -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v8, "setUsingRecord:", 1LL);
      -[SDAutoUnlockLockSession setNeedsNewImage:]( self,  "setNeedsNewImage:",  -[os_log_s needsImageData](v7, "needsImageData"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
      -[SDAutoUnlockLockSession sendAuthPromptImageDataIfReady:](self, "sendAuthPromptImageDataIfReady:", v10);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v8, "data"));
      -[SDAutoUnlockLockSession handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v11);
    }

    else
    {
      uint64_t v8 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received auth prompt response missing information: %@"),  v7));
      uint64_t v12 = auto_unlock_log(v8);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100181488();
      }

      uint64_t v14 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      uint64_t v18 = v8;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  103LL,  v15));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v16);
    }
  }
}

- (void)handleSessionKeyExchangeRequest:(id)a3
{
  id v4 = a3;
  -[SDAutoUnlockLockSession setReceivedExchangeRequest:](self, "setReceivedExchangeRequest:", 1LL);
  -[SDAutoUnlockLockSession invalidateTimerIfReady](self, "invalidateTimerIfReady");
  BOOL v5 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (!v5)
  {
    id v7 = -[SDUnlockSessionKeyExchangeRequest initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest),  "initWithData:",  v4);
    if (!-[SDUnlockSessionKeyExchangeRequest hasErrorCode](v7, "hasErrorCode")
      && -[SDUnlockSessionKeyExchangeRequest hasKey](v7, "hasKey")
      && -[SDUnlockSessionKeyExchangeRequest hasUsingRecord](v7, "hasUsingRecord"))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
      unsigned __int8 v9 = -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:]( self,  "handleFoundBLEDevice:available:lockedOnWrist:",  v8,  1LL,  0LL);

      if ((v9 & 1) == 0)
      {
        uint64_t v33 = auto_unlock_log(v10);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "Found device is not available",  buf,  2u);
        }

        goto LABEL_29;
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));

      if (v11)
      {
        uint64_t v13 = auto_unlock_log(v12);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received fallback AKS session", buf, 2u);
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        [v15 resetSession];

        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", 0LL);
      }

      if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)1)
      {
        unint64_t v16 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
        unsigned int v17 = -[SDUnlockSessionKeyExchangeRequest usingRecord](v7, "usingRecord");
        BOOL v18 = v16 == 2;
        if (v16 == 2) {
          uint64_t v19 = 0LL;
        }
        else {
          uint64_t v19 = v17;
        }
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [v20 aksAuthSessionForDeviceID:v21 originator:0 usingEscrow:v19 attestation:v18 sessionType:2]);
        -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v22);
      }

      else
      {
        int64_t v39 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
        if (v39 == 2)
        {
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          objc_super v41 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
          double v42 = (void *)objc_claimAutoreleasedReturnValue([v41 attemptExternalACMContext]);
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v20 aksAuthorizationSessionForDeviceID:v40 attestation:0 originator:0 externalACMContext:v42 sessionType:3]);
          -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v43);
        }

        else
        {
          uint64_t v44 = auto_unlock_log(v39);
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
            sub_1001815A0(self, (os_log_s *)v20);
          }
        }
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      unsigned int v46 = [v45 sessionIsValid];

      if (v46)
      {
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest key](v7, "key"));
        id v51 = 0LL;
        unsigned int v49 = [v47 stepSessionWithData:v48 outputData:&v51];
        id v50 = v51;

        if (v49)
        {
          -[SDAutoUnlockLockSession sendKeyExchangeResponseWithData:](self, "sendKeyExchangeResponseWithData:", v50);
          uint64_t v25 = 0LL;
          uint64_t v27 = 0LL;
        }

        else
        {
          uint64_t v27 = @"Exchange request step failed";
          uint64_t v25 = 101LL;
        }

        goto LABEL_25;
      }

      uint64_t v27 = @"Lock session invalid";
      uint64_t v25 = 101LL;
LABEL_26:
      uint64_t v28 = auto_unlock_log(v23);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100181514();
      }

      uint64_t v30 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      double v54 = v27;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      NSErrorUserInfoKey v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  v25,  v31));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v32);

LABEL_29:
      goto LABEL_30;
    }

    if (!-[SDUnlockSessionKeyExchangeRequest hasErrorCode](v7, "hasErrorCode"))
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Key exhange request is missing information (request: %@)",  v7));
      uint64_t v27 = (__CFString *)v23;
      uint64_t v25 = 103LL;
      goto LABEL_25;
    }

    uint64_t v23 = -[SDUnlockSessionKeyExchangeRequest errorCode](v7, "errorCode");
    uint64_t v25 = v23;
    if ((int)v23 <= 183)
    {
      if ((int)v23 <= 118)
      {
        if ((_DWORD)v23 == 102)
        {
          uint64_t v37 = auto_unlock_log(v23);
          double v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_100181574();
          }

          uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
          -[SDAutoUnlockLockSession handleFoundBLEDevice:available:lockedOnWrist:]( self,  "handleFoundBLEDevice:available:lockedOnWrist:",  v27,  0LL,  1LL);
          goto LABEL_29;
        }

        if ((_DWORD)v23 == 114)
        {
          uint64_t v27 = @"Remote WiFi failure";
          uint64_t v25 = 114LL;
          goto LABEL_26;
        }
      }

      else
      {
        switch((_DWORD)v23)
        {
          case 0x77:
            uint64_t v27 = @"Watch not in state to perform Auto Unlock";
            uint64_t v25 = 119LL;
            goto LABEL_26;
          case 0x9E:
            uint64_t v27 = @"Watch off wrist";
            uint64_t v25 = 158LL;
            goto LABEL_26;
          case 0x9F:
            uint64_t v27 = @"Watch locked and off wrist";
            goto LABEL_26;
        }
      }
    }

    else if ((int)v23 > 209)
    {
      switch((_DWORD)v23)
      {
        case 0xD2:
          uint64_t v27 = @"Not enough motion detected";
          uint64_t v25 = 210LL;
          goto LABEL_26;
        case 0xD5:
          uint64_t v27 = @"Watch Not Armed";
          uint64_t v25 = 213LL;
          goto LABEL_26;
        case 0xD7:
          uint64_t v27 = @"Phone needs to be unlocked after Watch unlocked and on wrist";
          uint64_t v25 = 215LL;
          goto LABEL_26;
      }
    }

    else
    {
      switch((_DWORD)v23)
      {
        case 0xB8:
          uint64_t v27 = @"Auth prompts disabled on remote";
          uint64_t v25 = 184LL;
          goto LABEL_26;
        case 0xC7:
          else {
            uint64_t v35 = @"UNLOCK_WATCH_WIFI_DISABLED";
          }
          uint64_t v36 = SFLocalizedStringForKey(v35, v34);
          uint64_t v23 = objc_claimAutoreleasedReturnValue(v36);
          uint64_t v27 = (__CFString *)v23;
          uint64_t v25 = 199LL;
LABEL_25:
          if (!v27) {
            goto LABEL_30;
          }
          goto LABEL_26;
        case 0xCC:
          uint64_t v26 = SFLocalizedStringForKey(@"UNLOCK_WATCH_IN_SLEEP_MODE", v24);
          uint64_t v23 = objc_claimAutoreleasedReturnValue(v26);
          uint64_t v27 = (__CFString *)v23;
          uint64_t v25 = 204LL;
          goto LABEL_25;
      }
    }

    uint64_t v27 = @"Remote AKS session failed";
    goto LABEL_26;
  }

  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Key exchange request: attempt cancelled",  buf,  2u);
  }

- (void)handleSessionAuthToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDAutoUnlockLockSession canceled](self, "canceled");
  if (v5)
  {
    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auth token: attempt cancelled", v30, 2u);
    }

    goto LABEL_28;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));

  if (v8)
  {
    uint64_t v10 = auto_unlock_log(v9);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001816E4();
    }
    goto LABEL_28;
  }

  id v7 = -[SDUnlockSessionAuthToken initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionAuthToken),  "initWithData:",  v4);
  if ((-[os_log_s hasErrorCode](v7, "hasErrorCode") & 1) != 0
    || !-[os_log_s hasAuthToken](v7, "hasAuthToken"))
  {
    id v13 = -[os_log_s hasErrorCode](v7, "hasErrorCode");
    if ((_DWORD)v13)
    {
      id v13 = -[os_log_s errorCode](v7, "errorCode");
      uint64_t v14 = v13;
      if ((_DWORD)v13 == 179)
      {
        uint64_t v15 = @"User denied authorization request";
        goto LABEL_25;
      }

      if ((_DWORD)v13 == 180)
      {
        uint64_t v15 = @"Error posting authorization request";
        uint64_t v14 = 180LL;
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v14 = 103LL;
    }

    uint64_t v15 = @"Auth token transfer failed";
    goto LABEL_25;
  }

  -[SDAutoUnlockLockSession setSessionAuthToken:](self, "setSessionAuthToken:", v7);
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSDate);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
  -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v12);
  -[SDAutoUnlockLockSession setBtOverall:](self, "setBtOverall:");

  if (-[os_log_s version](v7, "version") >= 2
    && (id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2)
  {
    -[SDAutoUnlockLockSession consumeAuthTokenIfReady](self, "consumeAuthTokenIfReady");
    goto LABEL_28;
  }

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 generateSessionToken]);
  -[SDAutoUnlockAuthSession setSessionRangingKey:](self, "setSessionRangingKey:", v17);

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
  if (v18)
  {
    -[SDAutoUnlockLockSession startAWDL](self, "startAWDL");
    -[SDAutoUnlockLockSession setOnlyRanging:](self, "setOnlyRanging:", 1LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v20 = (uint64_t)[v19 integerForKey:@"phoneAutoUnlockPeerDiscoveryTimeout"];
    if (v20 < 1)
    {
      double v24 = 10.0;
    }

    else
    {
      uint64_t v21 = v20;
      uint64_t v22 = auto_unlock_log(v20);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_100181684();
      }

      double v24 = (double)v21;
    }

    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(v24));

    goto LABEL_28;
  }

  uint64_t v15 = @"Failed to generate ranging token";
  uint64_t v14 = 101LL;
LABEL_25:
  uint64_t v25 = auto_unlock_log(v13);
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_100181624();
  }

  uint64_t v27 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
  NSErrorUserInfoKey v32 = v15;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  v14,  v28));
  -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v29);

LABEL_28:
}

- (void)handleConfirmationACK
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received SDAutoUnlockSessionConfirmationACK",  v16,  2u);
  }

  BOOL v5 = objc_opt_new(&OBJC_CLASS___NSDate);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession confirmationSendDate](self, "confirmationSendDate"));
  -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
  -[SDAutoUnlockLockSession setConfirmation:](self, "setConfirmation:");

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession attemptStartDate](self, "attemptStartDate"));
  [v7 timeIntervalSinceDate:v8];
  -[SDAutoUnlockLockSession setAttemptTime:](self, "setAttemptTime:");

  LODWORD(v7) = -[SDAutoUnlockLockSession attemptPrewarmed](self, "attemptPrewarmed");
  -[SDAutoUnlockLockSession attemptTime](self, "attemptTime");
  double v10 = v9;
  if ((_DWORD)v7)
  {
    -[SDAutoUnlockLockSession prewarmIdleTime](self, "prewarmIdleTime");
    double v10 = v10 - v11;
  }

  -[SDAutoUnlockLockSession setCompleteExchange:](self, "setCompleteExchange:", v10);
  -[SDAutoUnlockLockSession setUnlockSucceeded:](self, "setUnlockSucceeded:", 1LL);
  if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2
    && -[SDAutoUnlockLockSession sentImageData](self, "sentImageData"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession iconTransferStore](self, "iconTransferStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageHash](self, "imageHash"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
    [v12 storeCachedImageForHash:v13 device:v14 appName:v15];
  }

  -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL);
}

- (void)startAWDL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession peerListFromAWDLInfo:](self, "peerListFromAWDLInfo:", v3));
  -[SDAutoUnlockLockSession setPeerList:](self, "setPeerList:", v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AWDL_IF_MAC_ADDRESS"]);
  -[SDAutoUnlockLockSession setPeerMacAddress:](self, "setPeerMacAddress:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession localAWDLInfo](self, "localAWDLInfo"));
  [v8 setObject:v9 forKeyedSubscript:@"AWDL_INFO_SELF"];

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 11LL);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SDAutoUnlockAuthSession setAwdlStart:](self, "setAwdlStart:", v10);

  double v11 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockRangingPeer);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession peerList](self, "peerList"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  -[SDAutoUnlockRangingPeer setNiRangingPeer:](v11, "setNiRangingPeer:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession peerMacAddress](self, "peerMacAddress"));
  -[SDAutoUnlockRangingPeer setMacAddressData:](v11, "setMacAddressData:", v14);

  location[0] = 0LL;
  objc_initWeak(location, self);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v16 = [v15 BOOLForKey:@"phoneAutoUnlockSkipRanging"];
  int v17 = (int)v16;
  uint64_t v18 = auto_unlock_log(v16);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100181710(v17, v19);
  }

  if (v17)
  {
    uint64_t v21 = auto_unlock_log(v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skipping ranging due to default phoneAutoUnlockSkipRanging",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained handleRangingResults:0 errorCode:0];
  }

  else
  {
    NSErrorUserInfoKey v32 = v8;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10017EA10;
    v41[3] = &unk_1005D0890;
    v41[4] = self;
    objc_copyWeak(&v42, location);
    NSErrorUserInfoKey v31 = objc_retainBlock(v41);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10017EBA0;
    v39[3] = &unk_1005D08B8;
    objc_copyWeak(&v40, location);
    double v24 = objc_retainBlock(v39);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10017EC7C;
    v37[3] = &unk_1005CB220;
    objc_copyWeak(&v38, location);
    uint64_t v25 = objc_retainBlock(v37);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10017ECF8;
    v35[3] = &unk_1005D08E0;
    objc_copyWeak(&v36, location);
    uint64_t v26 = objc_retainBlock(v35);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10017EDB0;
    v33[3] = &unk_1005CB220;
    objc_copyWeak(&v34, location);
    uint64_t v27 = objc_retainBlock(v33);
    uint64_t v28 = -[SDAutoUnlockWiFiRequest initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockWiFiRequest),  "initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:ra ngingStartedHandler:rangingCompletedHandler:invalidationHandler:",  v32,  1LL,  v11,  &stru_1005D0868,  v31,  v24,  v25,  v26,  v27);
    -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", v28);

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
    [v29 scheduleWiFiRequest:v30];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v42);
    uint64_t v8 = v32;
  }

  objc_destroyWeak(location);
}

- (void)consumeAuthTokenIfReady
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 currentConsoleUser];

  int v5 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  int v6 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "isDisplayOff");

  if ((v8 & 1) != 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    unsigned int v11 = [v10 isDisplayOff];
  }

  else
  {
    unsigned int v11 = 0;
  }

  uint64_t v12 = auto_unlock_log(v9);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"NO";
    if (v4) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    if (v5) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    uint64_t v55 = v15;
    if (v6) {
      int v17 = @"YES";
    }
    else {
      int v17 = @"NO";
    }
    __int16 v56 = 2112;
    v57 = v16;
    __int16 v58 = 2112;
    uint64_t v59 = v17;
    if (v11) {
      uint64_t v14 = @"YES";
    }
    __int16 v60 = 2112;
    v61 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Current user: %@, clamshell closed: %@, display connected: %@ display off: %@",  buf,  0x2Au);
  }

  if (((v4 & v5 & (v6 ^ 1) | v11) & 1) != 0)
  {
    if (v11)
    {
      uint64_t v19 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      id v51 = @"Device display is off";
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  217LL,  v20));

      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v21);
LABEL_41:

      return;
    }

    uint64_t v35 = auto_unlock_log(v18);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Waiting for a display or clamshell change",  buf,  2u);
    }

    if (!-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell"))
    {
      -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 1LL);
      uint64_t v37 = objc_opt_new(&OBJC_CLASS___NSDate);
      -[SDAutoUnlockLockSession setDisplayOrClamshellWaitingDate:](self, "setDisplayOrClamshellWaitingDate:", v37);

      -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(5.0));
    }

    return;
  }

  if (-[SDAutoUnlockLockSession waitingForDisplayOrClamshell](self, "waitingForDisplayOrClamshell"))
  {
    uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSDate);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession displayOrClamshellWaitingDate](self, "displayOrClamshellWaitingDate"));
    -[NSDate timeIntervalSinceDate:](v22, "timeIntervalSinceDate:", v23);
    -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
  if (!v24) {
    return;
  }
  uint64_t v21 = (void *)v24;
  if (-[SDAutoUnlockAuthSession inRange](self, "inRange"))
  {

LABEL_25:
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
    -[SDAutoUnlockLockSession setWaitingForDisplayOrClamshell:](self, "setWaitingForDisplayOrClamshell:", 0LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockLockSession setDeviceWasLocked:]( self,  "setDeviceWasLocked:",  [v25 deviceKeyBagUnlocked] ^ 1);

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 authToken]);
    unsigned int v29 = [v26 stepSessionWithData:v28 outputData:0];

    uint64_t v31 = auto_unlock_log(v30);
    NSErrorUserInfoKey v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = v32;
    if (v29)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AKS Unlock succeeded", buf, 2u);
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      [v34 addPreventExitForLocaleReason:@"AutoUnlockConfirmationTimerPreventExitReason"];

      -[SDAutoUnlockAuthSession setAksSuccess:](self, "setAksSuccess:", 1LL);
      -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 13LL);
      if (!-[SDAutoUnlockLockSession doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation")) {
        -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:]( self,  "sendUnlockConfirmation:withError:",  1LL,  0LL);
      }
    }

    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100181784(v33, v40, v41, v42, v43, v44, v45, v46);
      }

      uint64_t v47 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v53 = @"Auth token failed";
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v47,  101LL,  v48));
      -[SDAutoUnlockLockSession sendUnlockConfirmation:withError:](self, "sendUnlockConfirmation:withError:", 0LL, v49);
    }

    return;
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession sessionAuthToken](self, "sessionAuthToken"));
  if ([v38 version] <= 1)
  {

    goto LABEL_41;
  }

  int64_t v39 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");

  if (v39 == 2) {
    goto LABEL_25;
  }
}

- (void)sendAWDLInfoData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localDeviceID]);

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:]( self,  "wrapPayload:withType:useProxy:senderID:",  v8,  v6,  -[SDAutoUnlockLockSession useProxy](self, "useProxy"),  v11));
    uint64_t v14 = auto_unlock_log(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
      *(_DWORD *)buf = 67109120;
      unsigned int v27 = [v16 useBTPipe];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending with useBTPipe %d", buf, 8u);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10017F560;
    v22[3] = &unk_1005D0908;
    v22[4] = self;
    id v23 = v9;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:]( self,  "sendData:bleDevice:completionHandler:",  v13,  v17,  v22);

    goto LABEL_9;
  }

  uint64_t v18 = auto_unlock_log(v12);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1001817F4();
  }

  if (v9)
  {
    uint64_t v20 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    uint64_t v25 = @"Missing local IDS ID";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  194LL,  v13));
    (*((void (**)(id, void *))v9 + 2))(v9, v21);

LABEL_9:
  }
}

- (void)sendAuthPromptRequestWithImageHash:(id)a3 appName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localDeviceID]);

  if (v9)
  {
    unsigned int v11 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockAuthPromptRequest);
    -[SDAutoUnlockAuthPromptRequest setVersion:](v11, "setVersion:", 1LL);
    -[SDAutoUnlockAuthPromptRequest setIconHash:](v11, "setIconHash:", v6);
    -[SDAutoUnlockAuthPromptRequest setAppName:](v11, "setAppName:", v7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession navBarTitle](self, "navBarTitle"));
    -[SDAutoUnlockAuthPromptRequest setNavBarTitle:](v11, "setNavBarTitle:", v12);

    uint64_t v14 = auto_unlock_log(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001818AC();
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest data](v11, "data"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:]( self,  "wrapPayload:withType:useProxy:senderID:",  v16,  12LL,  0LL,  v9));

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10017F850;
    v22[3] = &unk_1005CB3E8;
    v22[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:]( self,  "sendData:bleDevice:completionHandler:",  v17,  v18,  v22);
  }

  else
  {
    uint64_t v19 = auto_unlock_log(v10);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100181880();
    }

    uint64_t v21 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v24 = @"Missing local IDS ID";
    unsigned int v11 = (SDAutoUnlockAuthPromptRequest *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v21,  194LL,  v11));
    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);
  }

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(30.0));
}

- (void)sendAuthPromptImageDataIfReady:(id)a3
{
  id v4 = a3;
  int v5 = sub_10008E24C(@"AUDisableIconCache", 0LL);
  unsigned int v6 = 0;
  if (!v5) {
    unsigned int v6 = -[SDAutoUnlockLockSession imageDataAlreadyCached](self, "imageDataAlreadyCached");
  }
  BOOL v7 = -[SDAutoUnlockLockSession sentImageData](self, "sentImageData");
  if (v7) {
    goto LABEL_10;
  }
  BOOL v7 = -[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice");
  if (!v7) {
    goto LABEL_10;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
  id v9 = v8;
  if (v8) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 == 1)
  {
    unsigned __int8 v11 = -[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage");

    if ((v11 & 1) == 0)
    {
LABEL_10:
      uint64_t v12 = auto_unlock_log(v7);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (-[SDAutoUnlockLockSession sentImageData](self, "sentImageData")) {
          uint64_t v14 = @"YES";
        }
        else {
          uint64_t v14 = @"NO";
        }
        if (-[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice")) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
        if (v16) {
          int v17 = @"YES";
        }
        else {
          int v17 = @"NO";
        }
        if (-[SDAutoUnlockLockSession imageDataAlreadyCached](self, "imageDataAlreadyCached")) {
          uint64_t v18 = @"YES";
        }
        else {
          uint64_t v18 = @"NO";
        }
        *(_DWORD *)buf = 138413314;
        if (-[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage")) {
          uint64_t v19 = @"YES";
        }
        else {
          uint64_t v19 = @"NO";
        }
        *(void *)unsigned int v49 = v14;
        *(_WORD *)&v49[8] = 2112;
        *(void *)&v49[10] = v15;
        __int16 v50 = 2112;
        id v51 = v17;
        __int16 v52 = 2112;
        NSErrorUserInfoKey v53 = v18;
        __int16 v54 = 2112;
        uint64_t v55 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Not sending image data (already sent %@, chosen: %@, data %@, already cached %@, needs new image: %@)",  buf,  0x34u);
      }

      goto LABEL_28;
    }
  }

  else
  {

    if (!v9) {
      goto LABEL_10;
    }
  }

  uint64_t v20 = auto_unlock_log(v7);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (-[SDAutoUnlockLockSession chosenDevice](self, "chosenDevice")) {
      uint64_t v22 = @"YES";
    }
    else {
      uint64_t v22 = @"NO";
    }
    NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLockSession imageData](self, "imageData"));
    if (v23) {
      NSErrorUserInfoKey v24 = @"YES";
    }
    else {
      NSErrorUserInfoKey v24 = @"NO";
    }
    if (v6) {
      uint64_t v25 = @"YES";
    }
    else {
      uint64_t v25 = @"NO";
    }
    if (v5) {
      uint64_t v26 = @"YES";
    }
    else {
      uint64_t v26 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    if (-[SDAutoUnlockLockSession needsNewImage](self, "needsNewImage")) {
      unsigned int v27 = @"YES";
    }
    else {
      unsigned int v27 = @"NO";
    }
    *(void *)unsigned int v49 = v22;
    *(_WORD *)&v49[8] = 2112;
    *(void *)&v49[10] = v24;
    __int16 v50 = 2112;
    id v51 = v25;
    __int16 v52 = 2112;
    NSErrorUserInfoKey v53 = v26;
    __int16 v54 = 2112;
    uint64_t v55 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Sending image data (chosen: %@, data: %@, already cached: %@, cache disabled: %@ needs new image: %@)",  buf,  0x34u);
  }

  unsigned int v29 = 0;
  int v30 = 1;
  *(void *)&__int128 v31 = 67109376LL;
  __int128 v46 = v31;
  do
  {
    uint64_t v32 = auto_unlock_log(v28);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)unsigned int v49 = 10000LL;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Using max size %ld", buf, 0xCu);
    }

    id v34 = (char *)[v4 length];
    else {
      uint64_t v35 = (uint64_t)&v34[-v29];
    }
    id v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", v29, v35, v46));
    unsigned int v37 = [v36 length];
    unint64_t v38 = (unint64_t)[v36 length] >> 4;
    int64_t v39 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockAuthPromptImageData);
    -[SDAutoUnlockAuthPromptImageData setVersion:](v39, "setVersion:", 1LL);
    -[SDAutoUnlockAuthPromptImageData setImageData:](v39, "setImageData:", v36);
    uint64_t v40 = auto_unlock_log(-[SDAutoUnlockAuthPromptImageData setFinalMessage:](v39, "setFinalMessage:", v38 < 0x271));
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [v36 length];
      *(_DWORD *)buf = v46;
      *(_DWORD *)unsigned int v49 = v30;
      *(_WORD *)&v49[4] = 2048;
      *(void *)&v49[6] = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Sending SDAutoUnlockAuthPromptImageData (message count: %u, size: %ld)",  buf,  0x12u);
    }

    v29 += v37;

    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData data](v39, "data"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v43, 14LL));

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10017FDF4;
    v47[3] = &unk_1005CB3E8;
    v47[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:]( self,  "sendData:bleDevice:direct:completionHandler:",  v44,  v45,  1LL,  v47);

    ++v30;
  }

  while (v38 > 0x270);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(30.0));
  -[SDAutoUnlockLockSession setSentImageData:](self, "setSentImageData:", 1LL);
LABEL_28:
}

- (void)sendKeyExchangeResponseWithData:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new(&OBJC_CLASS___SDUnlockSessionKeyExchangeResponse);
  -[SDUnlockSessionKeyExchangeResponse setVersion:](v5, "setVersion:", 2LL);
  -[SDUnlockSessionKeyExchangeResponse setKey:](v5, "setKey:", v4);

  -[SDAutoUnlockAuthSession setErrorType:](self, "setErrorType:", 10LL);
  unsigned int v6 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[SDAutoUnlockLockSession setExchageResponseDate:](self, "setExchageResponseDate:", v6);

  uint64_t v8 = auto_unlock_log(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending SDUnlockSessionKeyExchangeResponse",  buf,  2u);
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse data](v5, "data"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001800B8;
  v11[3] = &unk_1005CB3E8;
  v11[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v10, 8LL, v11);

  kdebug_trace(725286932LL, 0LL, 0LL, 0LL, 0LL);
  -[SDAutoUnlockLockSession setSentExchangeResponse:](self, "setSentExchangeResponse:", 1LL);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)35LL));
}

- (void)completeAttemptPostNotification:(BOOL)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100180220;
  v6[3] = &unk_1005CC3A8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4
{
}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4 suppressNotification:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (-[SDAutoUnlockLockSession connected](self, "connected")
    || -[SDAutoUnlockLockSession receivedAWDLInfo](self, "receivedAWDLInfo")
    || (BOOL v9 = -[SDAutoUnlockLockSession receivedAuthPromptResponse](self, "receivedAuthPromptResponse")))
  {
    BOOL v10 = -[SDAutoUnlockLockSession sendingConfirmation](self, "sendingConfirmation");
    if (v10)
    {
      uint64_t v11 = auto_unlock_log(v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Already sending confirmation", buf, 2u);
      }
    }

    else
    {
      -[SDAutoUnlockLockSession setSendingConfirmation:](self, "setSendingConfirmation:", 1LL);
      uint64_t v13 = objc_opt_new(&OBJC_CLASS___SDUnlockSessionConfirmation);
      -[SDUnlockSessionConfirmation setVersion:](v13, "setVersion:", 1LL);
      -[SDUnlockSessionConfirmation setSuccess:](v13, "setSuccess:", v6);
      -[SDUnlockSessionConfirmation setSupportsACK:]( v13,  "setSupportsACK:",  -[SDAutoUnlockLockSession supportsConfirmationACK](self, "supportsConfirmationACK"));
      -[SDUnlockSessionConfirmation setSuppressNotification:](v13, "setSuppressNotification:", v5);
      uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSDate);
      -[SDAutoUnlockLockSession setConfirmationSendDate:](self, "setConfirmationSendDate:", v14);

      uint64_t v16 = auto_unlock_log(v15);
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Sending SDUnlockSessionConfirmation",  buf,  2u);
      }

      uint64_t v18 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      id v34 = @"Confirmation failed";
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  136LL,  v19));

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionConfirmation data](v13, "data"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100180554;
      v28[3] = &unk_1005CB410;
      id v22 = v8;
      id v29 = v22;
      int v30 = self;
      id v31 = v20;
      id v23 = v20;
      -[SDAutoUnlockAuthSession sendData:type:completionHandler:]( self,  "sendData:type:completionHandler:",  v21,  10LL,  v28);

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      dispatch_time_t v24 = sub_100114580(5.0);
      if (v22) {
        id v25 = v22;
      }
      else {
        id v25 = v23;
      }
      -[SDAutoUnlockLockSession restartConfirmationTimer:error:](self, "restartConfirmationTimer:error:", v24, v25);
    }
  }

  else
  {
    uint64_t v26 = auto_unlock_log(v9);
    unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Never connected, skipping confirmation",  buf,  2u);
    }

    -[SDAutoUnlockLockSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v8);
  }
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (void)setUseProxy:(BOOL)a3
{
  self->_useProxy = a3;
}

- (BOOL)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(BOOL)a3
{
  self->_wifiState = a3;
}

- (BOOL)otherSessionCancel
{
  return self->_otherSessionCancel;
}

- (void)setOtherSessionCancel:(BOOL)a3
{
  self->_otherSessionCancel = a3;
}

- (BOOL)otherProviderCancel
{
  return self->_otherProviderCancel;
}

- (void)setOtherProviderCancel:(BOOL)a3
{
  self->_otherProviderCancel = a3;
}

- (BOOL)attemptTimedOut
{
  return self->_attemptTimedOut;
}

- (void)setAttemptTimedOut:(BOOL)a3
{
  self->_attemptTimedOut = a3;
}

- (BOOL)chosenDevice
{
  return self->_chosenDevice;
}

- (BOOL)unlockSucceeded
{
  return self->_unlockSucceeded;
}

- (void)setUnlockSucceeded:(BOOL)a3
{
  self->_unlockSucceeded = a3;
}

- (NSDate)attemptStartDate
{
  return self->_attemptStartDate;
}

- (void)setAttemptStartDate:(id)a3
{
}

- (NSDate)prewarmStartDate
{
  return self->_prewarmStartDate;
}

- (void)setPrewarmStartDate:(id)a3
{
}

- (double)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(double)a3
{
  self->_discoveryTime = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSString)proxyDeviceModel
{
  return self->_proxyDeviceModel;
}

- (void)setProxyDeviceModel:(id)a3
{
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (unint64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(unint64_t)a3
{
  self->_connectedBluetoothDevices = a3;
}

- (int64_t)timeSinceLastMachineWake
{
  return self->_timeSinceLastMachineWake;
}

- (void)setTimeSinceLastMachineWake:(int64_t)a3
{
  self->_timeSinceLastMachineWake = a3;
}

- (int64_t)lastSleepType
{
  return self->_lastSleepType;
}

- (void)setLastSleepType:(int64_t)a3
{
  self->_lastSleepType = a3;
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (SFAutoUnlockDevice)autoUnlockDevice
{
  return self->_autoUnlockDevice;
}

- (void)setAutoUnlockDevice:(id)a3
{
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
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

- (BOOL)oldWatch
{
  return self->_oldWatch;
}

- (void)setOldWatch:(BOOL)a3
{
  self->_oldWatch = a3;
}

- (BOOL)onlyRanging
{
  return self->_onlyRanging;
}

- (void)setOnlyRanging:(BOOL)a3
{
  self->_onlyRanging = a3;
}

- (BOOL)foundPeer
{
  return self->_foundPeer;
}

- (void)setFoundPeer:(BOOL)a3
{
  self->_foundPeer = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)lockedKeyBag
{
  return self->_lockedKeyBag;
}

- (void)setLockedKeyBag:(BOOL)a3
{
  self->_lockedKeyBag = a3;
}

- (BOOL)deviceWasLocked
{
  return self->_deviceWasLocked;
}

- (void)setDeviceWasLocked:(BOOL)a3
{
  self->_deviceWasLocked = a3;
}

- (BOOL)receivedAWDLInfo
{
  return self->_receivedAWDLInfo;
}

- (void)setReceivedAWDLInfo:(BOOL)a3
{
  self->_receivedAWDLInfo = a3;
}

- (BOOL)receivedAuthPromptResponse
{
  return self->_receivedAuthPromptResponse;
}

- (void)setReceivedAuthPromptResponse:(BOOL)a3
{
  self->_receivedAuthPromptResponse = a3;
}

- (BOOL)sendingConfirmation
{
  return self->_sendingConfirmation;
}

- (void)setSendingConfirmation:(BOOL)a3
{
  self->_sendingConfirmation = a3;
}

- (BOOL)sentExchangeResponse
{
  return self->_sentExchangeResponse;
}

- (void)setSentExchangeResponse:(BOOL)a3
{
  self->_sentExchangeResponse = a3;
}

- (BOOL)receivedExchangeRequest
{
  return self->_receivedExchangeRequest;
}

- (void)setReceivedExchangeRequest:(BOOL)a3
{
  self->_receivedExchangeRequest = a3;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  self->_supportsConfirmationACK = a3;
}

- (BOOL)waitingForDisplayOrClamshell
{
  return self->_waitingForDisplayOrClamshell;
}

- (void)setWaitingForDisplayOrClamshell:(BOOL)a3
{
  self->_waitingForDisplayOrClamshell = a3;
}

- (BOOL)sentImageData
{
  return self->_sentImageData;
}

- (void)setSentImageData:(BOOL)a3
{
  self->_sentImageData = a3;
}

- (BOOL)imageDataAlreadyCached
{
  return self->_imageDataAlreadyCached;
}

- (void)setImageDataAlreadyCached:(BOOL)a3
{
  self->_imageDataAlreadyCached = a3;
}

- (BOOL)needsNewImage
{
  return self->_needsNewImage;
}

- (void)setNeedsNewImage:(BOOL)a3
{
  self->_needsNewImage = a3;
}

- (BOOL)shouldWaitToCompleteUnlock
{
  return self->_shouldWaitToCompleteUnlock;
}

- (void)setShouldWaitToCompleteUnlock:(BOOL)a3
{
  self->_shouldWaitToCompleteUnlock = a3;
}

- (BOOL)isWaitingToCompleteUnlock
{
  return self->_waitingToCompleteUnlock;
}

- (void)setWaitingToCompleteUnlock:(BOOL)a3
{
  self->_waitingToCompleteUnlock = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
}

- (NSData)peerMacAddress
{
  return self->_peerMacAddress;
}

- (void)setPeerMacAddress:(id)a3
{
}

- (SDUnlockSessionAuthToken)sessionAuthToken
{
  return self->_sessionAuthToken;
}

- (void)setSessionAuthToken:(id)a3
{
}

- (int)watchRSSI
{
  return self->_watchRSSI;
}

- (void)setWatchRSSI:(int)a3
{
  self->_watchRSSI = a3;
}

- (int64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(int64_t)a3
{
  self->_displayCount = a3;
}

- (int64_t)configChangeType
{
  return self->_configChangeType;
}

- (void)setConfigChangeType:(int64_t)a3
{
  self->_configChangeType = a3;
}

- (OS_dispatch_source)displayTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)setDisplayTimer:(id)a3
{
}

- (OS_dispatch_source)confirmationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 504LL, 1);
}

- (void)setConfirmationTimer:(id)a3
{
}

- (BOOL)awdlUp
{
  return self->_awdlUp;
}

- (void)setAwdlUp:(BOOL)a3
{
  self->_awdlUp = a3;
}

- (NSString)watchModelID
{
  return self->_watchModelID;
}

- (void)setWatchModelID:(id)a3
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

- (NSDate)discoveryDate
{
  return self->_discoveryDate;
}

- (void)setDiscoveryDate:(id)a3
{
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (void)setConnectionDate:(id)a3
{
}

- (NSDate)firstSend
{
  return self->_firstSend;
}

- (void)setFirstSend:(id)a3
{
}

- (NSDate)exchageResponseDate
{
  return self->_exchageResponseDate;
}

- (void)setExchageResponseDate:(id)a3
{
}

- (NSDate)displayOrClamshellWaitingDate
{
  return self->_displayOrClamshellWaitingDate;
}

- (void)setDisplayOrClamshellWaitingDate:(id)a3
{
}

- (NSDate)confirmationSendDate
{
  return self->_confirmationSendDate;
}

- (void)setConfirmationSendDate:(id)a3
{
}

- (NSDate)prewarmIdleStartDate
{
  return self->_prewarmIdleStartDate;
}

- (void)setPrewarmIdleStartDate:(id)a3
{
}

- (double)btOverall
{
  return self->_btOverall;
}

- (void)setBtOverall:(double)a3
{
  self->_btOverall = a3;
}

- (double)btBootstrap
{
  return self->_btBootstrap;
}

- (void)setBtBootstrap:(double)a3
{
  self->_btBootstrap = a3;
}

- (double)awdlInfoExchange
{
  return self->_awdlInfoExchange;
}

- (void)setAwdlInfoExchange:(double)a3
{
  self->_awdlInfoExchange = a3;
}

- (double)keyRequestExchange
{
  return self->_keyRequestExchange;
}

- (void)setKeyRequestExchange:(double)a3
{
  self->_keyRequestExchange = a3;
}

- (double)tokenExchange
{
  return self->_tokenExchange;
}

- (void)setTokenExchange:(double)a3
{
  self->_tokenExchange = a3;
}

- (double)confirmation
{
  return self->_confirmation;
}

- (void)setConfirmation:(double)a3
{
  self->_confirmation = a3;
}

- (double)peerFoundInterval
{
  return self->_peerFoundInterval;
}

- (void)setPeerFoundInterval:(double)a3
{
  self->_peerFoundInterval = a3;
}

- (double)awdlTotal
{
  return self->_awdlTotal;
}

- (void)setAwdlTotal:(double)a3
{
  self->_awdlTotal = a3;
}

- (double)attemptTime
{
  return self->_attemptTime;
}

- (void)setAttemptTime:(double)a3
{
  self->_attemptTime = a3;
}

- (double)completeExchange
{
  return self->_completeExchange;
}

- (void)setCompleteExchange:(double)a3
{
  self->_completeExchange = a3;
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (double)connectionWaitTime
{
  return self->_connectionWaitTime;
}

- (void)setConnectionWaitTime:(double)a3
{
  self->_connectionWaitTime = a3;
}

- (double)displayClamshellWaitTime
{
  return self->_displayClamshellWaitTime;
}

- (void)setDisplayClamshellWaitTime:(double)a3
{
  self->_displayClamshellWaitTime = a3;
}

- (double)prewarmIdleTime
{
  return self->_prewarmIdleTime;
}

- (void)setPrewarmIdleTime:(double)a3
{
  self->_prewarmIdleTime = a3;
}

- (void).cxx_destruct
{
}

@end