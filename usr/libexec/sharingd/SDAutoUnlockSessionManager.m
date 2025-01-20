@interface SDAutoUnlockSessionManager
+ (id)sharedManager;
- (BOOL)advertisingEnabled;
- (BOOL)attemptInProgress;
- (BOOL)attemptPrewarmed;
- (BOOL)autoRelockAssertionTimerActive;
- (BOOL)behaviorChangedAfterUpgrade;
- (BOOL)cachedDeviceWiFiState;
- (BOOL)cachedWatchWiFiState;
- (BOOL)currentlyAdvertising;
- (BOOL)deviceCurrentlyUnlockedByWatch;
- (BOOL)disablePairingForDeviceID:(id)a3 pairingID:(id)a4;
- (BOOL)doNotPostUnlockConfirmation;
- (BOOL)extendedTimer;
- (BOOL)isBeingUsedForSiri;
- (BOOL)isDisplayOff;
- (BOOL)lastLockedByRelock;
- (BOOL)lastUnlockedByWatch;
- (BOOL)needsArming;
- (BOOL)needsStrictMotionCheck;
- (BOOL)notifiedForProxy;
- (BOOL)phoneAutoUnlockSupportedByDevice:(id)a3;
- (BOOL)presentedBluetoothError;
- (BOOL)presentedWiFiError;
- (BOOL)preventRadarNotification;
- (BOOL)previousConnectedState;
- (BOOL)previousNearbyState;
- (BOOL)previousSessionExists:(id)a3;
- (BOOL)proxyAdvertisementForPeer:(id)a3;
- (BOOL)proxyNotAvailableForUnlock;
- (BOOL)shouldNotify;
- (BOOL)shouldShowErrorForBluetoothEnabled:(BOOL)a3;
- (BOOL)shouldShowErrorForWiFiEnabled:(BOOL)a3;
- (BOOL)suppressAlert;
- (BOOL)unlockEnabledForPeer:(id)a3;
- (BOOL)useBTPipe;
- (BOOL)watchLockedAndOnWrist;
- (BOOL)watchLockedOnWristForPeer:(id)a3;
- (BOOL)watchUnlockEnabled;
- (BOOL)wifiStateNeedsUpdating;
- (NSData)attemptExternalACMContext;
- (NSData)previousMacAddressData;
- (NSDate)advertisingChangedDate;
- (NSDate)attemptStart;
- (NSDate)lastUnlockDate;
- (NSDate)lockStateChangedDate;
- (NSDate)nearbyDeviceChangedDate;
- (NSDate)pipeConnectionChangedDate;
- (NSDate)prewarmStart;
- (NSDate)wristStateChangedDate;
- (NSDictionary)awdlInfo;
- (NSError)authSessionError;
- (NSHashTable)observerTable;
- (NSMutableArray)canceledAuthLockSessions;
- (NSMutableArray)canceledPairingKeySessions;
- (NSMutableArray)keysWithAKSTokens;
- (NSMutableArray)locksWithAKSTokens;
- (NSMutableArray)previousSessionIDs;
- (NSMutableDictionary)cachedMetrics;
- (NSMutableDictionary)keyAuthSessions;
- (NSMutableDictionary)keyPairingSessions;
- (NSMutableDictionary)keyRegistrationSessionsByDeviceID;
- (NSMutableDictionary)lockAuthSessions;
- (NSMutableDictionary)lockPairingSessions;
- (NSMutableDictionary)lockRegistrationSessionsByDeviceID;
- (NSMutableDictionary)proxySessions;
- (NSMutableSet)serviceClients;
- (NSSet)eligibleDevices;
- (NSSet)scanAutoUnlockDevices;
- (NSSet)scanPhoneIDs;
- (NSSet)scanWatchIDs;
- (NSString)attemptAppName;
- (NSString)attemptBundlePath;
- (NSString)attemptID;
- (NSString)attemptNavBarTitle;
- (NSString)incrementedCountID;
- (NSString)proxyDeviceModel;
- (NSString)scanErrorString;
- (NSString)state;
- (OS_dispatch_queue)sessionManagerQueue;
- (OS_dispatch_source)magnetLinkTimer;
- (OS_dispatch_source)nearbyPushTimer;
- (OS_dispatch_source)scanTimer;
- (SDAutoUnlockIconTransferStore)iconTransferStore;
- (SDAutoUnlockLocalDeviceController)localDeviceController;
- (SDAutoUnlockPeer)remotePeer;
- (SDAutoUnlockSessionManager)init;
- (SDAutoUnlockSessionManager)initWithTransport:(id)a3 magnetTransport:(id)a4 keyManager:(id)a5;
- (SDAutoUnlockSuggestionManager)suggestionManager;
- (SDAutoUnlockTransportProtocol)autoUnlockTransport;
- (SDKeyManaging)keyManager;
- (SDUnlockMagnetTransport)magnetTransport;
- (SFAutoUnlockDevice)attemptDevice;
- (SFDeviceDiscovery)scanner;
- (double)proxyConnectionTime;
- (double)proxyDiscoverTime;
- (id)attemptActivatedHandler;
- (id)baseResultsDictionaryForError:(id)a3;
- (id)errorStringForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5;
- (id)isActiveDeviceNearby;
- (id)isBluetoothEnabled;
- (id)isFaceIDEnabled;
- (id)isSignedIntoPrimaryiCloudAccount;
- (id)isWifiEnabled;
- (id)stringForState:(int64_t)a3;
- (id)unlockedOnWristDate;
- (int)proxyRSSI;
- (int64_t)attemptCount;
- (int64_t)attemptType;
- (int64_t)bluetoothErrorCount;
- (int64_t)connectedBluetoothDevices;
- (int64_t)errorCodeForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5;
- (int64_t)idsMacCount;
- (int64_t)idsMacCountCache;
- (int64_t)lastProxyState;
- (int64_t)lastSleepType;
- (int64_t)periocularStatus;
- (int64_t)proxyErrorCode;
- (int64_t)timeSinceLastMachineWake;
- (int64_t)wifiErrorCount;
- (os_state_data_s)dumpState;
- (unint64_t)stateHandle;
- (void)addNotificationsObservers;
- (void)addServiceClientForIdentifier:(id)a3;
- (void)armDevicesWaitingForUnlock;
- (void)attemptAutoUnlock;
- (void)attemptAutoUnlockForSiri;
- (void)attemptAutoUnlockForType:(int64_t)a3;
- (void)attemptAutoUnlockForType:(int64_t)a3 externalACMContext:(id)a4 preventRadarNotification:(BOOL)a5 bundlePath:(id)a6 appName:(id)a7 navBarTitle:(id)a8 reply:(id)a9;
- (void)attemptAutoUnlockForType:(int64_t)a3 preventRadarNotification:(BOOL)a4;
- (void)attemptAutoUnlockWithoutNotifyingWatch;
- (void)authPromptInfoWithCompletionHandler:(id)a3;
- (void)autoUnlockStateWithCompletionHandler:(id)a3;
- (void)beginKeyRegistrationIfNecessary;
- (void)cancelAllLockSessionsForScanTimeout;
- (void)cancelAttemptsForDeviceUnlocked;
- (void)cancelAutoUnlock;
- (void)cancelEnablingAllDevices;
- (void)cancelEnablingAutoUnlockForDevice:(id)a3;
- (void)cancelEnablingAutoUnlockForDeviceID:(id)a3;
- (void)cancelMagnetLinkTimer;
- (void)cancelParallelRegistrationSessionsForDeviceID:(id)a3 newSessionID:(id)a4;
- (void)cleanUpProxySessions;
- (void)clearAllKeysWithTokens;
- (void)clearPhoneAutoUnlockNotification:(BOOL)a3;
- (void)completeAutoUnlockWithNotification:(BOOL)a3;
- (void)createKeySessionWithBLEDevice:(id)a3 sessionID:(id)a4 wrapper:(id)a5 useEncryption:(BOOL)a6;
- (void)createLockSessionWithWatchDevice:(id)a3;
- (void)createPairingKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5;
- (void)createPairingLockSessionWithDevice:(id)a3 passcode:(id)a4;
- (void)createProxySessionWithDeviceID:(id)a3;
- (void)createRegistrationKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5 locallyGenerated:(BOOL)a6;
- (void)createRegistrationLockSessionWithDeviceID:(id)a3 sessionID:(id)a4 requestData:(id)a5;
- (void)decrementAttemptCount;
- (void)disableAutoUnlockForAllWatches;
- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4;
- (void)disableKeyPairingForDeviceID:(id)a3;
- (void)donateDeviceUnlockedWithMask:(BOOL)a3;
- (void)eligibleDevicesFilterCompatibleDevices:(id)a3;
- (void)eligibleDevicesRequestFromBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4;
- (void)failedAttemptBeforeStarting:(id)a3 metricErrorString:(id)a4;
- (void)generateAttemptForType:(int64_t)a3;
- (void)generateStateDump;
- (void)grabLanguageAssertionForAutoRelock;
- (void)handleAuthenticationSessionStarted;
- (void)handleBLEDataReceivedNotification:(id)a3;
- (void)handleBLEScanTimerFired;
- (void)handleBioLockout;
- (void)handleBluetoothPowerChanged:(id)a3;
- (void)handleDisableMessageForKey:(id)a3 fromDeviceID:(id)a4;
- (void)handleDisableMessageForLock:(id)a3 fromDeviceID:(id)a4;
- (void)handleDisplayStateChanged:(unint64_t)a3;
- (void)handleFoundPeer:(id)a3;
- (void)handleLockConnectionStartedForSession:(id)a3;
- (void)handleLockSessionCompleted:(id)a3 error:(id)a4;
- (void)handleLockStateChanged;
- (void)handlePairedDeviceLockStateChanged;
- (void)handleProxyConnectionStartedForSession:(id)a3;
- (void)handleProxySessionCompleted:(id)a3 error:(id)a4;
- (void)handleRelockMessage;
- (void)handleScanTimerFired;
- (void)handleUnexpectedDisablement:(id)a3;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6;
- (void)incrementAttemptCount;
- (void)initializeAttemptState;
- (void)initializeCaptureBlock;
- (void)initializeRemotePeer;
- (void)invalidateAttempt;
- (void)invalidateExistingSessionsForBLEDevice:(id)a3 incomingSessionID:(id)a4;
- (void)invalidateScanTimer;
- (void)invalidateScanner;
- (void)keyBagLockStateChange:(id)a3;
- (void)loadPresentedBluetoothError;
- (void)loadPresentedWiFiError;
- (void)loadPreviousSessionIDs;
- (void)logUnintentionalAutoUnlockAttempt:(unint64_t)a3;
- (void)notifyObserverOfAttemptBeganWithDevice:(id)a3;
- (void)notifyObserverOfEnabledDevice:(id)a3;
- (void)notifyObserverOfFailedToEnableDevice:(id)a3 error:(id)a4;
- (void)notifyObserverOfKeyDeviceLockWithDevice:(id)a3;
- (void)notifyObserversOfUnlockCompletionWithDevice:(id)a3;
- (void)notifyObserversOfUnlockFailureWithResults:(id)a3 error:(id)a4;
- (void)onqueue_keyBagLockStateChange:(id)a3;
- (void)onqueue_start;
- (void)performRegistrationIfNecessaryForLockSession:(id)a3 error:(id)a4;
- (void)pipeConnectionChanged:(id)a3;
- (void)prewarmAutoUnlock;
- (void)registerObserver:(id)a3;
- (void)releaseLanguageAssertionForAutoRelock;
- (void)removeServiceClientForIdentifier:(id)a3;
- (void)repairCloudPairing;
- (void)requestRelock;
- (void)restartScanTimer:(unint64_t)a3;
- (void)savePresentedBluetoothError;
- (void)savePresentedWiFiError;
- (void)sendDisableMessageToDeviceID:(id)a3 pairingID:(id)a4;
- (void)session:(id)a3 didCompleteWithError:(id)a4;
- (void)sessionDidReceiveKeyDeviceLocked:(id)a3;
- (void)sessionDidStartConnection:(id)a3;
- (void)setAdvertisingChangedDate:(id)a3;
- (void)setAttemptActivatedHandler:(id)a3;
- (void)setAttemptAppName:(id)a3;
- (void)setAttemptBundlePath:(id)a3;
- (void)setAttemptCount:(int64_t)a3;
- (void)setAttemptDevice:(id)a3;
- (void)setAttemptExternalACMContext:(id)a3;
- (void)setAttemptID:(id)a3;
- (void)setAttemptInProgress:(BOOL)a3;
- (void)setAttemptNavBarTitle:(id)a3;
- (void)setAttemptPrewarmed:(BOOL)a3;
- (void)setAttemptStart:(id)a3;
- (void)setAttemptType:(int64_t)a3;
- (void)setAuthSessionError:(id)a3;
- (void)setAutoRelockAssertionTimerActive:(BOOL)a3;
- (void)setAwdlInfo:(id)a3;
- (void)setBluetoothErrorCount:(int64_t)a3;
- (void)setCachedDeviceWiFiState:(BOOL)a3;
- (void)setCachedMetrics:(id)a3;
- (void)setCachedWatchWiFiState:(BOOL)a3;
- (void)setCanceledAuthLockSessions:(id)a3;
- (void)setCanceledPairingKeySessions:(id)a3;
- (void)setConnectedBluetoothDevices:(int64_t)a3;
- (void)setCurrentlyAdvertising:(BOOL)a3;
- (void)setDoNotPostUnlockConfirmation:(BOOL)a3;
- (void)setEligibleDevices:(id)a3;
- (void)setExtendedTimer:(BOOL)a3;
- (void)setIconTransferStore:(id)a3;
- (void)setIdsMacCountCache:(int64_t)a3;
- (void)setIncrementedCountID:(id)a3;
- (void)setIsActiveDeviceNearby:(id)a3;
- (void)setIsBeingUsedForSiri:(BOOL)a3;
- (void)setIsBluetoothEnabled:(id)a3;
- (void)setIsFaceIDEnabled:(id)a3;
- (void)setIsSignedIntoPrimaryiCloudAccount:(id)a3;
- (void)setIsWifiEnabled:(id)a3;
- (void)setKeyAuthSessions:(id)a3;
- (void)setKeyPairingSessions:(id)a3;
- (void)setKeyRegistrationSessionsByDeviceID:(id)a3;
- (void)setKeysWithAKSTokens:(id)a3;
- (void)setLastLockedByRelock:(BOOL)a3;
- (void)setLastProxyState:(int64_t)a3;
- (void)setLastSleepType:(int64_t)a3;
- (void)setLastUnlockDate:(id)a3;
- (void)setLastUnlockedByWatch:(BOOL)a3;
- (void)setLocalDeviceController:(id)a3;
- (void)setLockAuthSessions:(id)a3;
- (void)setLockPairingSessions:(id)a3;
- (void)setLockRegistrationSessionsByDeviceID:(id)a3;
- (void)setLockStateChangedDate:(id)a3;
- (void)setLocksWithAKSTokens:(id)a3;
- (void)setMagnetLinkTimer:(id)a3;
- (void)setNearbyDeviceChangedDate:(id)a3;
- (void)setNearbyPushTimer:(id)a3;
- (void)setNeedsArming:(BOOL)a3;
- (void)setNeedsStrictMotionCheck:(BOOL)a3;
- (void)setNotifiedForProxy:(BOOL)a3;
- (void)setObserverTable:(id)a3;
- (void)setPeriocularStatus:(int64_t)a3;
- (void)setPipeConnectionChangedDate:(id)a3;
- (void)setPresentedBluetoothError:(BOOL)a3;
- (void)setPresentedWiFiError:(BOOL)a3;
- (void)setPreventRadarNotification:(BOOL)a3;
- (void)setPreviousConnectedState:(BOOL)a3;
- (void)setPreviousMacAddressData:(id)a3;
- (void)setPreviousNearbyState:(BOOL)a3;
- (void)setPreviousSessionIDs:(id)a3;
- (void)setPrewarmStart:(id)a3;
- (void)setProxyConnectionTime:(double)a3;
- (void)setProxyDeviceModel:(id)a3;
- (void)setProxyDiscoverTime:(double)a3;
- (void)setProxyErrorCode:(int64_t)a3;
- (void)setProxyNotAvailableForUnlock:(BOOL)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setProxySessions:(id)a3;
- (void)setRemotePeer:(id)a3;
- (void)setScanAutoUnlockDevices:(id)a3;
- (void)setScanErrorString:(id)a3;
- (void)setScanPhoneIDs:(id)a3;
- (void)setScanTimer:(id)a3;
- (void)setScanWatchIDs:(id)a3;
- (void)setScanner:(id)a3;
- (void)setServiceClients:(id)a3;
- (void)setSessionManagerQueue:(id)a3;
- (void)setState:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setSuggestionManager:(id)a3;
- (void)setSuppressAlert:(BOOL)a3;
- (void)setTimeSinceLastMachineWake:(int64_t)a3;
- (void)setUpMagnetLinkTimer;
- (void)setUseBTPipe:(BOOL)a3;
- (void)setWatchUnlockEnabled:(BOOL)a3;
- (void)setWifiErrorCount:(int64_t)a3;
- (void)setWifiStateNeedsUpdating:(BOOL)a3;
- (void)setWristStateChangedDate:(id)a3;
- (void)start;
- (void)startScannerWithWatchBluetoothIDs:(id)a3 phoneBluetoothIDs:(id)a4;
- (void)storePreviousSessionID:(id)a3;
- (void)transport:(id)a3 didReceiveDisableMessage:(id)a4 fromDeviceID:(id)a5;
- (void)transport:(id)a3 didReceiveKeyOriginatingRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transport:(id)a3 didReceivePairingRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transport:(id)a3 didReceiveRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transportDidChangeDevices:(id)a3;
- (void)transportDidChangeNearbyState:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateStringForProxySession;
- (void)upsellBehaviorChangedAfterUpgradeIfNecessary;
@end

@implementation SDAutoUnlockSessionManager

+ (id)sharedManager
{
  if (qword_100656E88 != -1) {
    dispatch_once(&qword_100656E88, &stru_1005CC220);
  }
  return (id)qword_100656E80;
}

- (SDAutoUnlockSessionManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](&OBJC_CLASS___SDUnlockIDSController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  v6 = -[SDAutoUnlockSessionManager initWithTransport:magnetTransport:keyManager:]( self,  "initWithTransport:magnetTransport:keyManager:",  v3,  v4,  v5);

  return v6;
}

- (SDAutoUnlockSessionManager)initWithTransport:(id)a3 magnetTransport:(id)a4 keyManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___SDAutoUnlockSessionManager;
  v11 = -[SDAutoUnlockSessionManager init](&v55, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_autoUnlockTransport, v8);
    id v13 = objc_storeWeak((id *)&v12->_magnetTransport, v9);
    [v9 addDelegate:v12];

    objc_storeWeak((id *)&v12->_keyManager, v10);
    id isSignedIntoPrimaryiCloudAccount = v12->_isSignedIntoPrimaryiCloudAccount;
    v12->_id isSignedIntoPrimaryiCloudAccount = &stru_1005CC260;

    id location = 0LL;
    objc_initWeak(&location, v12);
    id isFaceIDEnabled = v12->_isFaceIDEnabled;
    v12->_id isFaceIDEnabled = &stru_1005CC280;

    v49 = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472LL;
    v51 = sub_100058874;
    v52 = &unk_1005CC2A8;
    objc_copyWeak(&v53, &location);
    v16 = objc_retainBlock(&v49);
    id isWifiEnabled = v12->_isWifiEnabled;
    v12->_id isWifiEnabled = v16;

    id isBluetoothEnabled = v12->_isBluetoothEnabled;
    v12->_id isBluetoothEnabled = &stru_1005CC2C8;

    id isActiveDeviceNearby = v12->_isActiveDeviceNearby;
    v12->_id isActiveDeviceNearby = &stru_1005CC2E8;

    v12->_idsMacCountCache = -1LL;
    v12->_timeSinceLastMachineWake = -1LL;
    v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    lockAuthSessions = v12->_lockAuthSessions;
    v12->_lockAuthSessions = v20;

    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    keyAuthSessions = v12->_keyAuthSessions;
    v12->_keyAuthSessions = v22;

    v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    lockPairingSessions = v12->_lockPairingSessions;
    v12->_lockPairingSessions = v24;

    v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    keyPairingSessions = v12->_keyPairingSessions;
    v12->_keyPairingSessions = v26;

    v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    canceledAuthLockSessions = v12->_canceledAuthLockSessions;
    v12->_canceledAuthLockSessions = v28;

    v30 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    canceledPairingKeySessions = v12->_canceledPairingKeySessions;
    v12->_canceledPairingKeySessions = v30;

    v32 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    serviceClients = v12->_serviceClients;
    v12->_serviceClients = v32;

    v34 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    proxySessions = v12->_proxySessions;
    v12->_proxySessions = v34;

    v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    locksWithAKSTokens = v12->_locksWithAKSTokens;
    v12->_locksWithAKSTokens = v36;

    v38 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    keysWithAKSTokens = v12->_keysWithAKSTokens;
    v12->_keysWithAKSTokens = v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v49, v50, v51, v52));
    keyRegistrationSessionsByDeviceID = v12->_keyRegistrationSessionsByDeviceID;
    v12->_keyRegistrationSessionsByDeviceID = (NSMutableDictionary *)v40;

    uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    lockRegistrationSessionsByDeviceID = v12->_lockRegistrationSessionsByDeviceID;
    v12->_lockRegistrationSessionsByDeviceID = (NSMutableDictionary *)v42;

    dispatch_queue_t v44 = dispatch_queue_create("com.apple.sharingd.auto-unlock.session-manager-queue", 0LL);
    sessionManagerQueue = v12->_sessionManagerQueue;
    v12->_sessionManagerQueue = (OS_dispatch_queue *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    observerTable = v12->_observerTable;
    v12->_observerTable = (NSHashTable *)v46;

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058958;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session manager starting", buf, 2u);
  }

  -[SDAutoUnlockSessionManager addNotificationsObservers](self, "addNotificationsObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v7 setPrimaryClient:self];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v8 start];

  id v9 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSuggestionManager);
  suggestionManager = self->_suggestionManager;
  self->_suggestionManager = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  self->_previousNearbyState = [v11 deviceNearby];

  v12 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockIconTransferStore);
  iconTransferStore = self->_iconTransferStore;
  self->_iconTransferStore = v12;

  -[SDAutoUnlockSessionManager initializeAttemptState](self, "initializeAttemptState");
  -[SDAutoUnlockSessionManager initializeCaptureBlock](self, "initializeCaptureBlock");
  uint64_t v14 = auto_unlock_log(-[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising"));
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Resetting in progress state", buf, 2u);
  }

  sub_10008AAE4(0LL);
  -[SDAutoUnlockSessionManager loadPresentedBluetoothError](self, "loadPresentedBluetoothError");
  -[SDAutoUnlockSessionManager loadPresentedWiFiError](self, "loadPresentedWiFiError");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 autoUnlockEligibleWatchesWithCloudPairing:0]);

  uint64_t v19 = auto_unlock_log(v18);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Auto Unlock eligible devices %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
  [v21 start];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v22 updateApproveBluetoothIDs];

  v23 = objc_alloc(&OBJC_CLASS___SDAutoUnlockLocalDeviceController);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v25 = -[SDAutoUnlockLocalDeviceController initWithQueue:](v23, "initWithQueue:", v24);
  -[SDAutoUnlockSessionManager setLocalDeviceController:](self, "setLocalDeviceController:", v25);

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100058CA4;
  v27[3] = &unk_1005CB220;
  objc_copyWeak(&v28, (id *)buf);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  [v26 setDeviceEnteredBioLockoutHandler:v27];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)initializeAttemptState
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  self->_attemptCount = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  uint64_t v7 = auto_unlock_log(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device unlocked on start up", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAutoUnlockSessionManager setLastUnlockDate:](self, "setLastUnlockDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAutoUnlockSessionManager setLockStateChangedDate:](self, "setLockStateChangedDate:", v11);
  }

  else
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      *(_DWORD *)buf = 134217984;
      id v17 = [v12 deviceKeyBagState];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "### Device not unlocked on start up (state: %ld)",  buf,  0xCu);
    }

    dispatch_time_t v13 = dispatch_time(0LL, 5000000000LL);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100058EB0;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_after(v13, v14, block);
  }

- (void)addNotificationsObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleBLEDataReceivedNotification:" name:@"SDNearbyAgentNotificationUnlockBLEDataReceived" object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"handleWiFiPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"btPipeConnectionChanged:" name:SFNotificationNamePipeConnectionStateChanged object:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"handleAuthenticationSessionStarted" name:@"SDAuthenticationSessionStarted" object:0];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000591D0;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100059328;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfKeyDeviceLockWithDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100059480;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfEnabledDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000596AC;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfFailedToEnableDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000598FC;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)notifyObserverOfAttemptBeganWithDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100059B2C;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserversOfUnlockCompletionWithDevice:(id)a3
{
  id v4 = a3;
  if (!-[SDAutoUnlockSessionManager suppressAlert](self, "suppressAlert")) {
    -[SDAutoUnlockSessionManager completeSuccessfulAttempt](self, "completeSuccessfulAttempt");
  }
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100059D6C;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserversOfUnlockFailureWithResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059FBC;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)repairCloudPairing
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_async(v2, &stru_1005CC308);
}

- (void)eligibleDevicesFilterCompatibleDevices:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelIdentifier", (void)v16));
        char v12 = sub_10008B394();

        if ((v12 & 1) == 0)
        {
          uint64_t v14 = auto_unlock_log(v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100067980(v20, v10, &v21, v15);
          }

          -[NSMutableSet addObject:](v4, "addObject:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v7);
  }

  [v5 minusSet:v4];
}

- (BOOL)phoneAutoUnlockSupportedByDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modelIdentifier]);
  if ((sub_10008B394() & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
    char v6 = sub_10008B394();

    if ((v6 & 1) != 0)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }
  }

  else
  {
  }

  uint64_t v9 = auto_unlock_log(v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000679F4(v3, v10);
  }

  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (void)eligibleDevicesRequestFromBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A51C;
  block[3] = &unk_1005CB858;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_10008AF18();
  BOOL v9 = v8;
  uint64_t v10 = auto_unlock_log(v8);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "### Unable to enable Auto Unlock due to profile",  buf,  2u);
    }

    uint64_t v13 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v26 = @"Disabled due to profile";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  111LL,  v14));
    -[SDAutoUnlockSessionManager notifyObserverOfFailedToEnableDevice:error:]( self,  "notifyObserverOfFailedToEnableDevice:error:",  v6,  v15);
  }

  else
  {
    if (v12)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enabling device %@, id %@", buf, 0x16u);
    }

    __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005AA84;
    block[3] = &unk_1005CBC20;
    block[4] = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v17, block);
  }
}

- (void)cancelEnablingAllDevices
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AB00;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005ACE4;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelEnablingAutoUnlockForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cancel enabling device %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);

  if (v8 && (id v9 = [v8 canceled], (v9 & 1) == 0))
  {
    [v8 cancel];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionID]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    -[SDAutoUnlockSessionManager disablePairingForDeviceID:pairingID:]( self,  "disablePairingForDeviceID:pairingID:",  v4,  v12);
  }

  else
  {
    uint64_t v10 = auto_unlock_log(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "No pairing lock session to cancel (device id: %@)",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)disableAutoUnlockForAllWatches
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 enabledAutoUnlockDevicesUsingCache:1]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "type", (void)v12) == (id)1) {
          -[SDAutoUnlockSessionManager disableAutoUnlockForDevice:completionHandler:]( self,  "disableAutoUnlockForDevice:completionHandler:",  v11,  0LL);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = auto_unlock_log(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disabling Auto Unlock (device: %@)", buf, 0xCu);
  }

  LongHash.storage.getter(@"com.apple.watch.auto-unlock.disabled");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B130;
  block[3] = &unk_1005CB858;
  id v14 = v6;
  __int128 v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)attemptAutoUnlockForType:(int64_t)a3
{
}

- (void)attemptAutoUnlockForType:(int64_t)a3 preventRadarNotification:(BOOL)a4
{
}

- (void)attemptAutoUnlockForType:(int64_t)a3 externalACMContext:(id)a4 preventRadarNotification:(BOOL)a5 bundlePath:(id)a6 appName:(id)a7 navBarTitle:(id)a8 reply:(id)a9
{
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  uint64_t v21 = auto_unlock_log(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = a3 == 2;
    id v33 = v19;
    id v24 = v16;
    id v25 = v18;
    id v26 = v20;
    id v27 = v17;
    int64_t v28 = a3;
    BOOL v29 = v12;
    if (v23) {
      v30 = @"Approve with Apple Watch";
    }
    else {
      v30 = @"Auto Unlock";
    }
    v31 = (__CFString *)sub_10008E500(0LL);
    *(_DWORD *)buf = 138412546;
    v36 = v30;
    BOOL v12 = v29;
    a3 = v28;
    id v17 = v27;
    id v20 = v26;
    id v18 = v25;
    id v16 = v24;
    id v19 = v33;
    __int16 v37 = 2112;
    v38 = v31;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Begin %@: %@", buf, 0x16u);
  }

  kdebug_trace(725286912LL, 0LL, 0LL, 0LL, 0LL);
  -[SDAutoUnlockSessionManager setAttemptActivatedHandler:](self, "setAttemptActivatedHandler:", v16);

  -[SDAutoUnlockSessionManager setAttemptType:](self, "setAttemptType:", a3);
  -[SDAutoUnlockSessionManager setAttemptBundlePath:](self, "setAttemptBundlePath:", v19);

  -[SDAutoUnlockSessionManager setAttemptAppName:](self, "setAttemptAppName:", v18);
  -[SDAutoUnlockSessionManager setAttemptNavBarTitle:](self, "setAttemptNavBarTitle:", v17);

  -[SDAutoUnlockSessionManager setAttemptExternalACMContext:](self, "setAttemptExternalACMContext:", v20);
  -[SDAutoUnlockSessionManager setPreventRadarNotification:](self, "setPreventRadarNotification:", v12);
  v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B474;
  block[3] = &unk_1005CC330;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(v32, block);
}

- (void)generateAttemptForType:(int64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Test mode attempt", buf, 2u);
  }

  BOOL v7 = a3 == 2;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SFAutoUnlockDevice);
  -[SFAutoUnlockDevice setName:](v8, "setName:", @"Apple Watch");
  -[SFAutoUnlockDevice setModelName:](v8, "setModelName:", @"Apple Watch");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  -[SFAutoUnlockDevice setUniqueID:](v8, "setUniqueID:", v10);

  -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:]( self,  "notifyObserverOfAttemptBeganWithDevice:",  v8);
  uint64_t v11 = variable initialization expression of SDAirDropHashStoreCDB.writer();
  uint64_t v12 = (uint64_t)sub_10008B29C();
  uint64_t v13 = variable initialization expression of SDAirDropHashStoreCDB.writer();
  id v14 = sub_10008A40C();
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)v15;
  id v17 = &off_1005FAFB8;
  if (v15) {
    id v17 = (_UNKNOWN **)v15;
  }
  id v18 = v17;

  [v18 doubleValue];
  dispatch_time_t v20 = dispatch_time(0LL, (uint64_t)(v19 * 1000000000.0));
  uint64_t v22 = SFMainQueue(v20, v21);
  BOOL v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B6C8;
  block[3] = &unk_1005CC358;
  id v27 = v8;
  id v28 = v18;
  uint64_t v31 = v12;
  uint64_t v32 = v13;
  BOOL v29 = self;
  uint64_t v30 = v11;
  BOOL v33 = v7;
  id v24 = v18;
  id v25 = v8;
  dispatch_after(v20, v23, block);
}

- (void)failedAttemptBeforeStarting:(id)a3 metricErrorString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  -[SDAutoUnlockSessionManager setAttemptStart:](self, "setAttemptStart:", 0LL);
  -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", 0LL);
  v15[0] = SDAutoUnlockManagerMetricSuccessKey;
  v15[1] = SDAutoUnlockManagerMetricErrorDomainKey;
  v16[0] = &off_1005F75B8;
  v16[1] = SFAutoUnlockErrorDomain;
  v15[2] = SDAutoUnlockManagerMetricErrorCodeKey;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]));
  v16[2] = v9;
  v16[3] = v6;
  v15[3] = SDAutoUnlockManagerMetricErrorStringKey;
  v15[4] = @"SDAutoUnlockBypassMetricLog";
  v16[4] = &__kCFBooleanTrue;
  v15[5] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  v16[5] = v10;
  v15[6] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  v16[6] = v11;
  v15[7] = SDAutoUnlockManagerMetricLastSleepTypeKey;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  v16[7] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  8LL));

  id v14 = [v13 mutableCopy];
  -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v14);

  -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v13,  v7);
  -[SDAutoUnlockSessionManager setLastSleepType:](self, "setLastSleepType:", 0LL);
  -[SDAutoUnlockSessionManager setTimeSinceLastMachineWake:](self, "setTimeSinceLastMachineWake:", -1LL);
  -[SDAutoUnlockSessionManager setConnectedBluetoothDevices:](self, "setConnectedBluetoothDevices:", 0LL);
}

- (void)attemptAutoUnlock
{
  if (-[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress")
    && -[SDAutoUnlockSessionManager attemptPrewarmed](self, "attemptPrewarmed"))
  {
    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0LL);
    BOOL v3 = -[SDAutoUnlockSessionManager isBeingUsedForSiri](self, "isBeingUsedForSiri");
    if (v3)
    {
      uint64_t v4 = auto_unlock_log(v3);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SPI attempt overlap with prewarm attempt",  buf,  2u);
      }

      uint64_t v6 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v169 = NSLocalizedDescriptionKey;
      v170 = @"SPI attempt overlap with prewarm attempt, try again when phone is not prewarming";
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v170,  &v169,  1LL));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  219LL,  v7));

      -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:]( self,  "failedAttemptBeforeStarting:metricErrorString:",  v8,  @"SPI attempt overlap with prewarm attempt, try again when phone is not prewarming");
    }

    else
    {
      __int128 v143 = 0u;
      __int128 v144 = 0u;
      __int128 v141 = 0u;
      __int128 v142 = 0u;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v52 allValues]);

      id v53 = [v8 countByEnumeratingWithState:&v141 objects:v171 count:16];
      if (v53)
      {
        id v54 = v53;
        uint64_t v55 = *(void *)v142;
        do
        {
          for (i = 0LL; i != v54; i = (char *)i + 1)
          {
            if (*(void *)v142 != v55) {
              objc_enumerationMutation(v8);
            }
            v57 = *(void **)(*((void *)&v141 + 1) + 8LL * (void)i);
            if ([v57 attemptPrewarmed])
            {
              objc_msgSend( v57,  "setDoNotPostUnlockConfirmation:",  -[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"));
              [v57 completeAttemptIfNecessary];
            }
          }

          id v54 = [v8 countByEnumeratingWithState:&v141 objects:v171 count:16];
        }

        while (v54);
      }
    }

- (void)prewarmAutoUnlock
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  unsigned int v4 = [v3 shouldPrewarmAttempt];

  if (v4)
  {
    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Beginning prewarming of unlock attempt",  v9,  2u);
    }

    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 1LL);
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", v8);

    -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1LL);
  }

  else
  {
    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0LL);
  }

- (void)attemptAutoUnlockForSiri
{
  uint64_t v3 = auto_unlock_log(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "attemptAutoUnlockForSiri", v5, 2u);
  }

  -[SDAutoUnlockSessionManager setIsBeingUsedForSiri:](self, "setIsBeingUsedForSiri:", 1LL);
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1LL);
}

- (void)attemptAutoUnlockWithoutNotifyingWatch
{
  uint64_t v3 = auto_unlock_log(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Calling attemptAutoUnlockWithoutNotifyingWatch",  v5,  2u);
  }

  -[SDAutoUnlockSessionManager setDoNotPostUnlockConfirmation:](self, "setDoNotPostUnlockConfirmation:", 1LL);
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1LL);
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = auto_unlock_log(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Complete Auto Unlock, Post Notification: %@",  buf,  0xCu);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005D12C;
  v9[3] = &unk_1005CC3A8;
  v9[4] = self;
  BOOL v10 = v3;
  dispatch_async(v8, v9);
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  BOOL v4 = !a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
  [v6 setObject:v5 forKeyedSubscript:SDAutoUnlockManagerMetricMaskKey];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  [v7 deviceUnlockedWithMask:v4];
}

- (void)invalidateAttempt
{
  uint64_t v3 = auto_unlock_log(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating attempt", buf, 2u);
  }

  -[SDAutoUnlockSessionManager setAttemptActivatedHandler:](self, "setAttemptActivatedHandler:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptType:](self, "setAttemptType:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptDevice:](self, "setAttemptDevice:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptExternalACMContext:](self, "setAttemptExternalACMContext:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptBundlePath:](self, "setAttemptBundlePath:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptAppName:](self, "setAttemptAppName:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptID:](self, "setAttemptID:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptStart:](self, "setAttemptStart:", 0LL);
  -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", 0LL);
  -[SDAutoUnlockSessionManager setAuthSessionError:](self, "setAuthSessionError:", 0LL);
  -[SDAutoUnlockSessionManager setIncrementedCountID:](self, "setIncrementedCountID:", 0LL);
  -[SDAutoUnlockSessionManager setLastSleepType:](self, "setLastSleepType:", 0LL);
  -[SDAutoUnlockSessionManager setTimeSinceLastMachineWake:](self, "setTimeSinceLastMachineWake:", -1LL);
  -[SDAutoUnlockSessionManager setConnectedBluetoothDevices:](self, "setConnectedBluetoothDevices:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0LL);
  -[SDAutoUnlockSessionManager setAttemptInProgress:](self, "setAttemptInProgress:", 0LL);
  -[SDAutoUnlockSessionManager setProxyNotAvailableForUnlock:](self, "setProxyNotAvailableForUnlock:", 0LL);
  -[SDAutoUnlockSessionManager setScanWatchIDs:](self, "setScanWatchIDs:", 0LL);
  -[SDAutoUnlockSessionManager setScanPhoneIDs:](self, "setScanPhoneIDs:", 0LL);
  -[SDAutoUnlockSessionManager setScanAutoUnlockDevices:](self, "setScanAutoUnlockDevices:", 0LL);
  -[SDAutoUnlockSessionManager setDoNotPostUnlockConfirmation:](self, "setDoNotPostUnlockConfirmation:", 0LL);
  -[SDAutoUnlockSessionManager invalidateScanner](self, "invalidateScanner");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  [v5 setAutoUnlockActive:0];

  -[SDAutoUnlockSessionManager setIsBeingUsedForSiri:](self, "setIsBeingUsedForSiri:", 0LL);
  -[SDAutoUnlockSessionManager cleanUpProxySessions](self, "cleanUpProxySessions");
  sub_10008AAE4(0LL);
  uint64_t v7 = auto_unlock_log(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting state changed: Attempt invalidated",  v14,  2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0LL, 0LL, 1u);
  BOOL v10 = -[SDAutoUnlockSessionManager wifiStateNeedsUpdating](self, "wifiStateNeedsUpdating");
  if (v10)
  {
    uint64_t v11 = auto_unlock_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating WiFi state after attempt", v13, 2u);
    }

    -[SDAutoUnlockSessionManager handleWiFiPowerChanged:](self, "handleWiFiPowerChanged:", 0LL);
  }

- (void)cancelAutoUnlock
{
}

- (void)cancelAttemptsForDeviceUnlocked
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) aksSuccess])
        {

          uint64_t v11 = auto_unlock_log(v10);
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v13 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Canceling attempt in progress – device unlocked",  v13,  2u);
          }

          -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
          return;
        }

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (void)logUnintentionalAutoUnlockAttempt:(unint64_t)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005DA54;
  v6[3] = &unk_1005CC330;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)incrementAttemptCount
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v4 = [v3 deviceKeyBagUnlocked];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptID](self, "attemptID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager incrementedCountID](self, "incrementedCountID"));
    unsigned __int8 v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptID](self, "attemptID"));
      -[SDAutoUnlockSessionManager setIncrementedCountID:](self, "setIncrementedCountID:", v8);

      uint64_t v9 = auto_unlock_log( -[SDAutoUnlockSessionManager setAttemptCount:]( self,  "setAttemptCount:",  (char *)-[SDAutoUnlockSessionManager attemptCount](self, "attemptCount") + 1));
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Incremented attempt count %d",  (uint8_t *)v11,  8u);
      }
    }
  }

- (void)decrementAttemptCount
{
  uint64_t v3 = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
  if (v3 >= 1)
  {
    uint64_t v4 = auto_unlock_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decrementing", v6, 2u);
    }

    -[SDAutoUnlockSessionManager setAttemptCount:]( self,  "setAttemptCount:",  (char *)-[SDAutoUnlockSessionManager attemptCount](self, "attemptCount") - 1);
  }

- (void)requestRelock
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending relock request", v8, 2u);
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockRelockRequest);
  -[SDAutoUnlockRelockRequest setVersion:](v5, "setVersion:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRelockRequest data](v5, "data"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetTransport](self, "magnetTransport"));
  [v7 sendProtocolBufferData:v6 withType:110 timeout:0 option:1 errorHandler:&stru_1005CC3C8];
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (v6) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
  }

  else
  {
    uint64_t v7 = 1LL;
  }

  uint64_t v8 = auto_unlock_log(v5);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (-[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress")) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager stringForState:](self, "stringForState:", v7));
    int v14 = 138412802;
    __int128 v15 = v10;
    __int16 v16 = 2112;
    __int128 v17 = v11;
    __int16 v18 = 2112;
    int64_t v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "State requested (attempt in progress: %@, device: %@, state: %@)",  (uint8_t *)&v14,  0x20u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
  v4[2](v4, v13, 0LL);
}

- (id)stringForState:(int64_t)a3
{
  else {
    return *(&off_1005CC530 + a3);
  }
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = auto_unlock_log(v3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning auth prompt info", v8, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationModel]);
  v3[2](v3, v7, 0LL);
}

- (BOOL)disablePairingForDeviceID:(id)a3 pairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = auto_unlock_log(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Disabling (device ID: %@, pairingID: %@)",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  unsigned __int8 v11 = [v10 disablePairingWithKeyDevice:v6];

  -[SDAutoUnlockSessionManager sendDisableMessageToDeviceID:pairingID:]( self,  "sendDisableMessageToDeviceID:pairingID:",  v6,  v7);
  return v11;
}

- (void)sendDisableMessageToDeviceID:(id)a3 pairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SDUnlockDisable);
  -[SDUnlockDisable setVersion:](v7, "setVersion:", 1LL);
  -[SDUnlockDisable setPairingID:](v7, "setPairingID:", v6);

  uint64_t v9 = auto_unlock_log(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class(v7, v11);
    int v13 = NSStringFromClass(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending %@ %@", buf, 0x16u);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockDisable data](v7, "data"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10005E3EC;
  v19[3] = &unk_1005CB3E8;
  id v20 = v5;
  id v18 = v5;
  [v15 sendPayload:v16 toDevice:v18 type:2 sessionID:0 timeout:v17 errorHandler:v19];
}

- (void)transport:(id)a3 didReceiveDisableMessage:(id)a4 fromDeviceID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005E504;
  v12[3] = &unk_1005CB480;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)handleDisableMessageForKey:(id)a3 fromDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyPairingIDForDeviceID:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

  if (v9)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);
    unsigned __int8 v13 = [v12 isEqualToString:v9];

    if ((v13 & 1) == 0 && !v11)
    {
      uint64_t v15 = auto_unlock_log(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);
      int v29 = 138412546;
      id v30 = v9;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Not disabling (local pairingID: %@, received pairingID: %@)",  (uint8_t *)&v29,  0x16u);
LABEL_6:

      goto LABEL_13;
    }
  }

  if (v11)
  {
    [v11 cancel];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);

    if (v18)
    {
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledPairingKeySessions](self, "canceledPairingKeySessions"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);
      [v19 addObject:v20];
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionID]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);
    unsigned int v24 = [v22 isEqualToString:v23];

    if (!v24)
    {
      uint64_t v26 = auto_unlock_log(v25);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 pairingID]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionID]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
      int v29 = 138412802;
      id v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      v34 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "### Received disable while enabling device but pairing IDs don't match (lock device: %@, received pairing ID: %@ , session ID: %@)",  (uint8_t *)&v29,  0x20u);

      goto LABEL_6;
    }
  }

  -[SDAutoUnlockSessionManager disableKeyPairingForDeviceID:](self, "disableKeyPairingForDeviceID:", v7);
LABEL_14:
}

- (void)handleDisableMessageForLock:(id)a3 fromDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pairingIDForWatchID:v6]);

  if (v8
    && [v5 hasPairingID]
    && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 pairingID]),
        unsigned int v10 = [v9 isEqualToString:v8],
        v9,
        !v10))
  {
    uint64_t v13 = auto_unlock_log(v11);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 pairingID]);
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not disabling (local pairingID: %@, received pairingID: %@)",  (uint8_t *)&v15,  0x16u);
    }
  }

  else
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    -[os_log_s disablePairingWithKeyDevice:](v12, "disablePairingWithKeyDevice:", v6);
  }
}

- (void)disableKeyPairingForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v5 deleteEscrowSecretForDeviceID:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v6 deleteRangingKeyForDeviceID:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v8 = [v7 deviceTypeForDeviceID:v4];

  if (v8 == (id)2)
  {
    uint64_t v10 = auto_unlock_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removing remote LTK for %@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    [v12 removeRemoteLTKForDeviceID:v4];
  }

  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");
}

- (void)createPairingLockSessionWithDevice:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (!v10)
  {
    int v15 = objc_alloc(&OBJC_CLASS___SDAutoUnlockPairingLockSession);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    int v13 = -[SDAutoUnlockPairingLockSession initWithDevice:sessionID:](v15, "initWithDevice:sessionID:", v16, v17);

    -[SDAutoUnlockPairingSession setDelegate:](v13, "setDelegate:", self);
    -[SDAutoUnlockPairingLockSession setPasscode:](v13, "setPasscode:", v7);
    -[SDAutoUnlockPairingLockSession setPlaceholder:](v13, "setPlaceholder:", [v6 placeholder]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 suggestedDeviceID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    id v21 = [v19 isEqualToString:v20];

    if ((_DWORD)v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      [v22 setSuggestedDeviceID:0];
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 setupRetryDeviceID]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    id v26 = [v24 isEqualToString:v25];

    if ((_DWORD)v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      [v27 setSetupRetryDeviceID:0];
    }

    -[SDAutoUnlockPairingLockSession setSetupRetryDevice:](v13, "setSetupRetryDevice:", v26);
    -[SDAutoUnlockPairingLockSession setUpsellDevice:](v13, "setUpsellDevice:", v21);
    -[SDAutoUnlockPairingLockSession start](v13, "start");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    [v14 setObject:v13 forKeyedSubscript:v28];

    goto LABEL_9;
  }

  uint64_t v12 = auto_unlock_log(v11);
  int v13 = (SDAutoUnlockPairingLockSession *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
    int v29 = 138412290;
    id v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Pairing lock session in progress %@",  (uint8_t *)&v29,  0xCu);
LABEL_9:
  }
}

- (void)createPairingKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);

    if (v13)
    {
      uint64_t v15 = auto_unlock_log(v14);
      id v16 = (SDAutoUnlockPairingKeySession *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }

      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
      int v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Pairing key session in progress %@",  (uint8_t *)&v21,  0xCu);
    }

    else
    {
      id v16 = -[SDAutoUnlockPairingKeySession initWithDevice:sessionID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockPairingKeySession),  "initWithDevice:sessionID:",  v9,  v8);
      -[SDAutoUnlockPairingSession setDelegate:](v16, "setDelegate:", self);
      -[SDAutoUnlockPairingKeySession setRequestData:](v16, "setRequestData:", v11);
      -[SDAutoUnlockPairingKeySession start](v16, "start");
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
      [v17 setObject:v16 forKeyedSubscript:v9];
    }

    goto LABEL_10;
  }

  uint64_t v18 = auto_unlock_log(v10);
  int64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100067BDC();
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v20 logDevices];

LABEL_11:
}

- (void)createLockSessionWithWatchDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothID]);
  -[SFBLEDevice setIdentifier:](v5, "setIdentifier:", v6);

  -[SFBLEDevice setUseBTPipe:](v5, "setUseBTPipe:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v5, "identifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (!v9)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___SDAutoUnlockLockSession);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v12 = -[SDAutoUnlockLockSession initWithAutoUnlockDevice:sessionID:bleDevice:]( v14,  "initWithAutoUnlockDevice:sessionID:bleDevice:",  v4,  v15,  v5);

    -[SDAutoUnlockLockSession setUseProxy:](v12, "setUseProxy:", 0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptStart](self, "attemptStart"));
    -[SDAutoUnlockLockSession setAttemptStartDate:](v12, "setAttemptStartDate:", v16);

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager prewarmStart](self, "prewarmStart"));
    -[SDAutoUnlockLockSession setPrewarmStartDate:](v12, "setPrewarmStartDate:", v17);

    -[SDAutoUnlockAuthSession setAttemptType:]( v12,  "setAttemptType:",  -[SDAutoUnlockSessionManager attemptType](self, "attemptType"));
    -[SDAutoUnlockAuthSession setUseEncryption:](v12, "setUseEncryption:", [v4 supportsEncryption]);
    -[SDAutoUnlockLockSession setConnectedBluetoothDevices:]( v12,  "setConnectedBluetoothDevices:",  -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices"));
    -[SDAutoUnlockLockSession setTimeSinceLastMachineWake:]( v12,  "setTimeSinceLastMachineWake:",  -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake"));
    -[SDAutoUnlockLockSession setLastSleepType:]( v12,  "setLastSleepType:",  -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType"));
    -[SDAutoUnlockLockSession setAttemptPrewarmed:]( v12,  "setAttemptPrewarmed:",  -[SDAutoUnlockSessionManager attemptPrewarmed](self, "attemptPrewarmed"));
    -[SDAutoUnlockLockSession setDoNotPostUnlockConfirmation:]( v12,  "setDoNotPostUnlockConfirmation:",  -[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"));
    -[SDAutoUnlockAuthSession setIsAuthenticatingForSiri:]( v12,  "setIsAuthenticatingForSiri:",  -[SDAutoUnlockSessionManager isBeingUsedForSiri](self, "isBeingUsedForSiri"));
    -[SDAutoUnlockPairingSession setDelegate:](v12, "setDelegate:", self);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
    -[SDAutoUnlockAuthSession setLastLocalUnlockDate:](v12, "setLastLocalUnlockDate:", v18);

    if ((id)-[SDAutoUnlockSessionManager attemptType](self, "attemptType") == (id)2)
    {
      uint64_t v19 = auto_unlock_log(2LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptExternalACMContext](self, "attemptExternalACMContext"));
        int v26 = 138412290;
        uint64_t v27 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Lock session setting context %@",  (uint8_t *)&v26,  0xCu);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptExternalACMContext](self, "attemptExternalACMContext"));
      -[SDAutoUnlockLockSession setExternalACMContext:](v12, "setExternalACMContext:", v22);
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    -[SDAutoUnlockAuthSession setUseAKSToken:](v12, "setUseAKSToken:", [v23 containsObject:v24]);

    -[SDAutoUnlockAuthSession start](v12, "start");
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v5, "identifier"));
    [v13 setObject:v12 forKeyedSubscript:v25];

    goto LABEL_9;
  }

  uint64_t v11 = auto_unlock_log(v10);
  uint64_t v12 = (SDAutoUnlockLockSession *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    int v26 = 138412290;
    uint64_t v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Auth lock session in progress %@",  (uint8_t *)&v26,  0xCu);
LABEL_9:
  }
}

- (void)createKeySessionWithBLEDevice:(id)a3 sessionID:(id)a4 wrapper:(id)a5 useEncryption:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[SDAutoUnlockSessionManager invalidateExistingSessionsForBLEDevice:incomingSessionID:]( self,  "invalidateExistingSessionsForBLEDevice:incomingSessionID:",  v10,  v11);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

  if (!v15)
  {
    uint64_t v18 = -[SDAutoUnlockKeySession initWithBLEDevice:sessionID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockKeySession),  "initWithBLEDevice:sessionID:",  v10,  v11);
    -[SDAutoUnlockPairingSession setDelegate:](v18, "setDelegate:", self);
    -[SDAutoUnlockAuthSession setUseEncryption:](v18, "setUseEncryption:", v6);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    -[SDAutoUnlockAuthSession setUseAKSToken:](v18, "setUseAKSToken:", [v20 containsObject:v21]);

    -[SDAutoUnlockKeySession setLocalDeviceNeedsArming:]( v18,  "setLocalDeviceNeedsArming:",  -[SDAutoUnlockSessionManager needsArming](self, "needsArming"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    [v22 removeObject:v23];

    -[SDAutoUnlockKeySession setWifiEnabled:]( v18,  "setWifiEnabled:",  -[SDAutoUnlockSessionManager cachedWatchWiFiState](self, "cachedWatchWiFiState"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 wakeGestureDates]);
    -[SDAutoUnlockKeySession setWakeGestureDates:](v18, "setWakeGestureDates:", v25);

    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager unlockedOnWristDate](self, "unlockedOnWristDate"));
    -[SDAutoUnlockKeySession setUnlockedOnWristDate:](v18, "setUnlockedOnWristDate:", v26);

    -[SDAutoUnlockKeySession setNeedsStrictMotionCheck:]( v18,  "setNeedsStrictMotionCheck:",  -[SDAutoUnlockSessionManager needsStrictMotionCheck](self, "needsStrictMotionCheck"));
    -[SDAutoUnlockAuthSession start](v18, "start");
    -[SDAutoUnlockKeySession handleMessageWithWrapper:](v18, "handleMessageWithWrapper:", v12);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    [v19 setObject:v18 forKeyedSubscript:v27];

    goto LABEL_5;
  }

  uint64_t v17 = auto_unlock_log(v16);
  uint64_t v18 = (SDAutoUnlockKeySession *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
    int v28 = 138412290;
    int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "Auth key session in progress %@",  (uint8_t *)&v28,  0xCu);
LABEL_5:
  }
}

- (void)createProxySessionWithDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bluetoothIDForIDSID:v4]);
  id v7 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFBLEDevice setIdentifier:](v7, "setIdentifier:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v7, "identifier"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    uint64_t v12 = auto_unlock_log(v11);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already sent trigger to device", v21, 2u);
    }
  }

  else
  {
    kdebug_trace(725286916LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v14 = objc_alloc(&OBJC_CLASS___SDAutoUnlockProxySession);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v16 = -[SDAutoUnlockProxySession initWithDevice:sessionID:bleDevice:]( v14,  "initWithDevice:sessionID:bleDevice:",  v4,  v15,  v7);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 modelIdentifierForDeviceID:v4]);
    -[SDAutoUnlockProxySession setModel:](v16, "setModel:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptStart](self, "attemptStart"));
    -[SDAutoUnlockProxySession setStartDate:](v16, "setStartDate:", v18);

    -[SDAutoUnlockPairingSession setDelegate:](v16, "setDelegate:", self);
    -[SDAutoUnlockProxySession start](v16, "start");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v7, "identifier"));
    [v19 setObject:v16 forKeyedSubscript:v20];
  }
}

- (void)updateStringForProxySession
{
  if (!-[SDAutoUnlockSessionManager proxyErrorCode](self, "proxyErrorCode"))
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions", 0LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v10 = [v9 state];
          else {
            id v11 = [v9 state];
          }
          -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", v11);
        }

        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }

    if ((id)-[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState") == (id)2)
    {
      uint64_t v12 = @"Trigger Send Failed With Timeout";
      uint64_t v13 = 142LL;
    }

    else
    {
      if ((id)-[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState") != (id)3) {
        return;
      }
      uint64_t v12 = @"Unable to Find Proxy Watch";
      uint64_t v13 = 132LL;
    }

    -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", v12);
    -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", v13);
  }

- (void)cleanUpProxySessions
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) invalidate];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
  [v9 removeAllObjects];

  -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", 0LL);
  -[SDAutoUnlockSessionManager setNotifiedForProxy:](self, "setNotifiedForProxy:", 0LL);
  -[SDAutoUnlockSessionManager setProxyDiscoverTime:](self, "setProxyDiscoverTime:", 0.0);
  -[SDAutoUnlockSessionManager setProxyDeviceModel:](self, "setProxyDeviceModel:", 0LL);
  -[SDAutoUnlockSessionManager setProxyConnectionTime:](self, "setProxyConnectionTime:", 0.0);
  -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", 0LL);
  -[SDAutoUnlockSessionManager setProxyRSSI:](self, "setProxyRSSI:", 0LL);
}

- (void)clearAllKeysWithTokens
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing all keys with tokens", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
  [v5 removeAllObjects];
}

- (void)cancelAllLockSessionsForScanTimeout
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        [v8 setAttemptTimedOut:1];
        [v8 cancel];
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)invalidateExistingSessionsForBLEDevice:(id)a3 incomingSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 cachedIDSDeviceIDsForBluetoothID:v9]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  int v28 = self;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
  id v12 = [v11 copy];

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
  __int128 v15 = v13;
  if (!v14)
  {
LABEL_16:

    goto LABEL_17;
  }

  id v16 = v14;
  id v27 = v6;
  char v29 = 0;
  uint64_t v17 = *(void *)v32;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v19]);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      if (([v21 isEqualToString:v19] & 1) == 0)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceID]);
        unsigned int v23 = [v22 isEqualToString:v30];

        if (!v23) {
          goto LABEL_12;
        }
        uint64_t v25 = auto_unlock_log(v24);
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Invalidating existing session: %@",  buf,  0xCu);
        }

        [v20 invalidateOnQueue];
        int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](v28, "keyAuthSessions"));
        [v21 setObject:0 forKeyedSubscript:v19];
        char v29 = 1;
      }

LABEL_12:
    }

    id v16 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
  }

  while (v16);

  id v6 = v27;
  if ((v29 & 1) != 0)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
    [v15 removeAutoUnlockNotification];
    goto LABEL_16;
  }

- (void)createRegistrationKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5 locallyGenerated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID]( self,  "keyRegistrationSessionsByDeviceID"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);

    if (v15)
    {
      uint64_t v17 = auto_unlock_log(v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID]( self,  "keyRegistrationSessionsByDeviceID"));
        int v25 = 138412290;
        int v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Registration key session in progress %@",  (uint8_t *)&v25,  0xCu);
      }
    }

    else
    {
      unsigned int v23 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockRegistrationKeySession),  "initWithDevice:sessionID:",  v11,  v10);
      -[SDAutoUnlockPairingSession setDelegate:](v23, "setDelegate:", self);
      -[SDAutoUnlockRegistrationKeySession setRequestData:](v23, "setRequestData:", v13);
      -[SDAutoUnlockRegistrationKeySession setLocallyGenerated:](v23, "setLocallyGenerated:", v6);
      -[SDAutoUnlockRegistrationKeySession start](v23, "start");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID]( self,  "keyRegistrationSessionsByDeviceID"));
      [v24 setObject:v23 forKeyedSubscript:v11];
    }
  }

  else
  {
    uint64_t v20 = auto_unlock_log(v12);
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100067C08();
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v22 logDevices];
  }
}

- (void)createRegistrationLockSessionWithDeviceID:(id)a3 sessionID:(id)a4 requestData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

    if (v13)
    {
      uint64_t v15 = auto_unlock_log(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID"));
        int v24 = 138412290;
        int v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Registration lock session in progress %@",  (uint8_t *)&v24,  0xCu);
      }
    }

    else
    {
      if (v9) {
        int v21 = (os_log_s *)v9;
      }
      else {
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      }
      uint64_t v16 = v21;
      uint64_t v22 = -[SDAutoUnlockRegistrationLockSession initWithDevice:sessionID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockRegistrationLockSession),  "initWithDevice:sessionID:",  v8,  v21);
      -[SDAutoUnlockPairingSession setDelegate:](v22, "setDelegate:", self);
      -[SDAutoUnlockRegistrationLockSession setRequestData:](v22, "setRequestData:", v11);
      -[SDAutoUnlockRegistrationLockSession start](v22, "start");
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID"));
      [v23 setObject:v22 forKeyedSubscript:v8];
    }
  }

  else
  {
    uint64_t v18 = auto_unlock_log(v10);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100067C34();
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v20 logDevices];
  }
}

- (void)armDevicesWaitingForUnlock
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    [v6 handleDeviceUnlocked];
  }

- (void)initializeRemotePeer
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeDevice]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIDOverride]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyManager](self, "keyManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteLTKForDeviceID:v6]);

    uint64_t v10 = auto_unlock_log(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        int v14 = 138412290;
        uint64_t v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Initialized remote peer to %@",  (uint8_t *)&v14,  0xCu);
      }

      id v13 = -[SDAutoUnlockPeer initWithDeviceID:](objc_alloc(&OBJC_CLASS___SDAutoUnlockPeer), "initWithDeviceID:", v6);
      -[SDAutoUnlockSessionManager setRemotePeer:](self, "setRemotePeer:", v13);
    }

    else
    {
      if (v12)
      {
        int v14 = 138412290;
        uint64_t v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Could not find remote LTK for active device: %@",  (uint8_t *)&v14,  0xCu);
      }

      -[SDAutoUnlockSessionManager setRemotePeer:](self, "setRemotePeer:", 0LL);
    }
  }
}

- (void)cancelParallelRegistrationSessionsForDeviceID:(id)a3 newSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  id v11 = v10;
  if (v10)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    id v15 = [v13 compare:v14];

    if (v15 == (id)1)
    {
      uint64_t v17 = auto_unlock_log(v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Invalidating existing registration session: %@",  (uint8_t *)&v19,  0xCu);
      }

      [v11 invalidate];
      [v9 setObject:0 forKeyedSubscript:v6];
    }
  }
}

- (void)session:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060878;
  block[3] = &unk_1005CBC20;
  id v12 = v6;
  id v13 = v7;
  int v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleLockSessionCompleted:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 autoUnlockDevice]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
  unsigned int v12 = [v10 containsObject:v11];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
    [v13 removeObject:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    [v15 setLastSuccessfulDevice:0];

    if (v7)
    {
      -[SDAutoUnlockSessionManager performRegistrationIfNecessaryForLockSession:error:]( self,  "performRegistrationIfNecessaryForLockSession:error:",  v6,  v7);
    }

    else
    {
      uint64_t v24 = auto_unlock_log(v16);
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Canceled at end", buf, 2u);
      }

      [v6 handleCanceledAfterSuccess];
    }

    if ([v6 otherSessionCancel])
    {
      int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
      [v26 removeObject:v27];

LABEL_31:
    }
  }

  else if (v7)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    id v18 = [v17 count];

    if ((unint64_t)v18 <= 1)
    {
      [v6 logResults];
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 autoUnlockDevice]);
      v72 = v31;
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v6 wifiRangingResults]);
      -[SDAutoUnlockSessionManager createRadarForError:devices:rangingResults:]( self,  "createRadarForError:devices:rangingResults:",  v7,  v32,  v33);

      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 attemptResults]);
      id v35 = [v34 mutableCopy];
      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v35);

      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v34,  v7);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
      [v36 removeObject:v37];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      [v38 setLastSuccessfulDevice:0];

      if ([v7 code] == (id)145) {
        -[SDAutoUnlockSessionManager decrementAttemptCount](self, "decrementAttemptCount");
      }
      else {
        -[SDAutoUnlockSessionManager performRegistrationIfNecessaryForLockSession:error:]( self,  "performRegistrationIfNecessaryForLockSession:error:",  v6,  v7);
      }
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
    }

    else
    {
      uint64_t v20 = auto_unlock_log(v19);
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
        *(_DWORD *)buf = 138412802;
        v67 = v22;
        __int16 v68 = 2112;
        id v69 = v7;
        __int16 v70 = 2112;
        v71 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Session failed (id: %@, error: %@, outstanding sessions: %@)",  buf,  0x20u);
      }

      -[SDAutoUnlockSessionManager setAuthSessionError:](self, "setAuthSessionError:", v7);
    }

    if ([v7 code] == (id)101) {
      -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
    }
  }

  else
  {
    if ((id)-[SDAutoUnlockSessionManager attemptType](self, "attemptType") == (id)1)
    {
      int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v28 = [v26 BOOLForKey:@"phoneAutoUnlockSkipPrewarmOnNextUnlock"];
      if ((_DWORD)v28)
      {
        uint64_t v29 = auto_unlock_log(v28);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Skipped donating positive mask signal due to default phoneAutoUnlockSkipPrewarmOnNextUnlock",  buf,  2u);
        }
      }

      else
      {
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
        -[os_log_s deviceUnlockedWithMask:](v30, "deviceUnlockedWithMask:", 1LL);
      }

      [v6 logResults];
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v6 attemptResults]);
      [v9 setResults:v46];

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
      id v48 = [v47 mutableCopy];
      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
      [v49 addObject:v50];

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      [v51 setLastSuccessfulDevice:v9];

      -[SDAutoUnlockSessionManager notifyObserversOfUnlockCompletionWithDevice:]( self,  "notifyObserversOfUnlockCompletionWithDevice:",  v9);
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
      goto LABEL_31;
    }

    int64_t v39 = -[SDAutoUnlockSessionManager attemptType](self, "attemptType");
    if (v39 != 2)
    {
      uint64_t v52 = auto_unlock_log(v39);
      int v26 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
        sub_100067D00(self);
      }
      goto LABEL_31;
    }

    [v6 logResults];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v6 attemptResults]);
    [v9 setResults:v40];

    v41 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
    id v42 = [v41 mutableCopy];
    -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue([v6 hintToken]);
    [v9 setHintToken:v43];

    dispatch_queue_t v44 = (void *)objc_claimAutoreleasedReturnValue([v9 hintToken]);
    if (v44)
    {
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockCompletionWithDevice:]( self,  "notifyObserversOfUnlockCompletionWithDevice:",  v9);
    }

    else
    {
      uint64_t v56 = auto_unlock_log(v45);
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_100067C8C(self);
      }

      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
      uint64_t v59 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
      BOOL v65 = @"Missing authorization token";
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v59,  185LL,  v60));
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v58,  v61);
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
    [v62 removeObject:v63];

    -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
  }

  [v6 invalidate];
  id v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  id v54 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
  [v53 removeObjectForKey:v55];

  -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", 0LL);
}

- (void)handleProxySessionCompleted:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [v15 connectionTime];
  -[SDAutoUnlockSessionManager setProxyConnectionTime:](self, "setProxyConnectionTime:");
  if (!v6)
  {
    -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", [v15 state]);
    goto LABEL_8;
  }

  -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", [v6 code]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
  -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", v7);

  -[SDAutoUnlockSessionManager setProxyNotAvailableForUnlock:]( self,  "setProxyNotAvailableForUnlock:",  [v6 code] == (id)144);
  if ([v6 code] == (id)135)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    if ((unint64_t)[v8 count] >= 2)
    {
LABEL_6:

      goto LABEL_8;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
    id v10 = [v9 count];

    if (v10 == (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager baseResultsDictionaryForError:]( self,  "baseResultsDictionaryForError:",  v6));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 results]);
      [v8 addEntriesFromDictionary:v11];

      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v8);
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v8,  v6);
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
      goto LABEL_6;
    }
  }

- (void)sessionDidStartConnection:(id)a3
{
  id v8 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SDAutoUnlockLockSession, v4);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    -[SDAutoUnlockSessionManager handleLockConnectionStartedForSession:]( self,  "handleLockConnectionStartedForSession:",  v8);
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___SDAutoUnlockProxySession, v6);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      -[SDAutoUnlockSessionManager handleProxyConnectionStartedForSession:]( self,  "handleProxyConnectionStartedForSession:",  v8);
    }
  }
}

- (void)handleLockConnectionStartedForSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SDAutoUnlockSessionManager cachedDeviceWiFiState](self, "cachedDeviceWiFiState");
  int64_t v6 = -[SDAutoUnlockSessionManager attemptType](self, "attemptType");
  if (v6 == 2) {
    int v7 = 1;
  }
  else {
    int v7 = v5;
  }
  uint64_t v8 = auto_unlock_log(v6);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v5) {
      id v10 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wi-Fi powered on: %@", buf, 0xCu);
  }

  id v11 = -[SDAutoUnlockSessionManager invalidateScanner](self, "invalidateScanner");
  if (v7)
  {
    unsigned int v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 autoUnlockDevice]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (v13)
    {
      uint64_t v15 = auto_unlock_log(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
        *(_DWORD *)buf = 138412546;
        uint64_t v58 = v12;
        __int16 v59 = 2112;
        uint64_t v60 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Already connected (new device: %@, attempt device: %@)",  buf,  0x16u);
      }
    }

    else
    {
      -[SDAutoUnlockSessionManager setAttemptDevice:](self, "setAttemptDevice:", v12);
      [v4 setChosenDevice:1];
      id v33 = (id)-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy");
      if ((v33 & 1) == 0)
      {
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
        -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:]( self,  "notifyObserverOfAttemptBeganWithDevice:",  v34);

        id v33 = -[SDAutoUnlockSessionManager incrementAttemptCount](self, "incrementAttemptCount");
      }

      uint64_t v35 = auto_unlock_log(v33);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Posting state changed: Scan stopped - session in progress",  buf,  2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0LL, 0LL, 1u);
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 allValues]);

      id v39 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v49,  v61,  16LL);
      if (v39)
      {
        id v40 = v39;
        id v48 = v12;
        uint64_t v41 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v50 != v41) {
              objc_enumerationMutation(v16);
            }
            v43 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
            dispatch_queue_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 sessionID]);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
            unsigned __int8 v46 = [v44 isEqual:v45];

            if ((v46 & 1) == 0)
            {
              uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
              [v47 addObject:v44];

              [v43 setOtherSessionCancel:1];
              [v43 cancel];
            }
          }

          id v40 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v49,  v61,  16LL);
        }

        while (v40);
        unsigned int v12 = v48;
      }
    }
  }

  else
  {
    uint64_t v18 = auto_unlock_log(v11);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "### Discovered peer but Wi-Fi is off",  buf,  2u);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v21 = [v20 bluetoothEnabled];

    int64_t v22 = -[SDAutoUnlockSessionManager errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:]( self,  "errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:",  v21,  0LL,  1LL);
    unsigned int v12 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:]( self,  "errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:",  v21,  0LL,  1LL));
    BOOL v23 = -[SDAutoUnlockSessionManager shouldShowErrorForWiFiEnabled:](self, "shouldShowErrorForWiFiEnabled:", 0LL);
    uint64_t v24 = SFAutoUnlockErrorDomain;
    v55[0] = NSLocalizedDescriptionKey;
    v55[1] = @"SDAutoUnlockShowScreenLockError";
    v56[0] = v12;
    int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v23));
    v56[1] = v25;
    int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  v22,  v26));

    v53[0] = SDAutoUnlockManagerMetricSuccessKey;
    v53[1] = SDAutoUnlockManagerMetricErrorDomainKey;
    v54[0] = &off_1005F75B8;
    v54[1] = v24;
    v53[2] = SDAutoUnlockManagerMetricErrorCodeKey;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v22));
    v54[2] = v27;
    v54[3] = v12;
    v53[3] = SDAutoUnlockManagerMetricErrorStringKey;
    v53[4] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
    v54[4] = v28;
    v53[5] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
    v54[5] = v29;
    v53[6] = SDAutoUnlockManagerMetricLastSleepTypeKey;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
    v54[6] = v30;
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  7LL));

    id v32 = [v31 mutableCopy];
    -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v32);

    -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v31,  v16);
    -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
  }
}

- (void)handleProxyConnectionStartedForSession:(id)a3
{
  id v4 = a3;
  if (!-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (!v5)
    {
      int64_t v6 = objc_alloc_init(&OBJC_CLASS___SFAutoUnlockDevice);
      -[SFAutoUnlockDevice setName:](v6, "setName:", @"Proxied Apple Watch");
      -[SFAutoUnlockDevice setModelName:](v6, "setModelName:", @"Apple Watch");
      -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:]( self,  "notifyObserverOfAttemptBeganWithDevice:",  v6);
      -[SDAutoUnlockSessionManager setNotifiedForProxy:](self, "setNotifiedForProxy:", 1LL);
      -[SDAutoUnlockSessionManager incrementAttemptCount](self, "incrementAttemptCount");
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));

      if (v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
        [v8 setTimeout:0.0];

        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
        [v9 setTimeoutHandler:0];

        -[SDAutoUnlockSessionManager restartScanTimer:](self, "restartScanTimer:", sub_100114580(12.0));
      }

      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions", 0LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);

      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0LL;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v15);
            [v4 connectionTime];
            objc_msgSend(v16, "setProxyConnectionTime:");
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
            [v16 setProxyDeviceModel:v17];

            uint64_t v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v13);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
      -[SDAutoUnlockSessionManager setProxyDeviceModel:](self, "setProxyDeviceModel:", v18);

      -[SDAutoUnlockSessionManager setProxyRSSI:](self, "setProxyRSSI:", [v4 proxyRSSI]);
      [v4 proxyDiscoveryTime];
      -[SDAutoUnlockSessionManager setProxyDiscoverTime:](self, "setProxyDiscoverTime:");
    }
  }
}

- (void)sessionDidReceiveKeyDeviceLocked:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 autoUnlockDeviceForDeviceID:v6]);
  -[SDAutoUnlockSessionManager notifyObserverOfKeyDeviceLockWithDevice:]( self,  "notifyObserverOfKeyDeviceLockWithDevice:",  v7);
}

- (BOOL)isDisplayOff
{
  return 0;
}

- (void)performRegistrationIfNecessaryForLockSession:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 code];
  if (v9 == (id)136)
  {
    BOOL v10 = -[SDAutoUnlockSessionManager suppressAlert](self, "suppressAlert");
    if (!v10)
    {
      uint64_t v11 = auto_unlock_log(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Locking device on confirmation failed error",  v15,  2u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
      [v13 lockDevice];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    [v14 handleConfirmationFailed];

    -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
  }

  else if ([v6 aksSuccess])
  {
    [v6 unlockSucceeded];
  }
}

- (void)transportDidChangeDevices:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006269C;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)transportDidChangeNearbyState:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062748;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)transport:(id)a3 didReceivePairingRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100062870;
  v16[3] = &unk_1005CC3F0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)transport:(id)a3 didReceiveRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100062964;
  v16[3] = &unk_1005CC3F0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)transport:(id)a3 didReceiveKeyOriginatingRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100062A7C;
  v16[3] = &unk_1005CC3F0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v7 == 2001)
  {
    id v17 = -[SDAutoUnlockSessionWrapper initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockSessionWrapper),  "initWithData:",  v11);
    BOOL v18 = -[SDAutoUnlockSessionWrapper hasSessionID](v17, "hasSessionID");
    if (v18
      && (id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper sessionID](v17, "sessionID")),
          id v20 = [v19 length],
          v19,
          v20 == (id)16))
    {
      __int128 v21 = objc_alloc(&OBJC_CLASS___NSUUID);
      id v22 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper sessionID](v17, "sessionID"));
      BOOL v23 = -[NSUUID initWithUUIDBytes:](v21, "initWithUUIDBytes:", [v22 bytes]);

      uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100062DD8;
      v27[3] = &unk_1005CC3F0;
      void v27[4] = self;
      id v28 = v23;
      id v29 = v13;
      id v30 = v17;
      int v25 = v23;
      dispatch_async(v24, v27);
    }

    else
    {
      uint64_t v26 = auto_unlock_log(v18);
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100067D74(v17, (uint64_t)v11, v25);
      }
    }
  }

  else if (v7 == 110)
  {
    uint64_t v14 = auto_unlock_log(v12);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received relock request", buf, 2u);
    }

    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100062D2C;
    block[3] = &unk_1005CB480;
    void block[4] = self;
    id v32 = v13;
    dispatch_async(v16, block);
  }
}

- (void)startScannerWithWatchBluetoothIDs:(id)a3 phoneBluetoothIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0LL;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    [v9 invalidate];
  }

  id v10 = objc_opt_new(&OBJC_CLASS___SFDeviceDiscovery);
  -[SDAutoUnlockSessionManager setScanner:](self, "setScanner:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v11 setDiscoveryFlags:1];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  [v12 setDispatchQueue:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v14 setScanRate:50];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000632F0;
  v38[3] = &unk_1005CC418;
  objc_copyWeak(&v39, &location);
  [v15 setDeviceFoundHandler:v38];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v16 setChangeFlags:1];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100063360;
  v36[3] = &unk_1005CC440;
  objc_copyWeak(&v37, &location);
  [v17 setDeviceChangedHandler:v36];

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v18 setInvalidationHandler:&stru_1005CC460];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 setByAddingObjectsFromSet:v7]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v20 setDeviceFilter:v19];

  uint64_t v22 = auto_unlock_log(v21);
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v42 = *(double *)&v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Scanning for bluetooth IDs %@", buf, 0xCu);
  }

  -[SDAutoUnlockSessionManager setScanWatchIDs:](self, "setScanWatchIDs:", v6);
  -[SDAutoUnlockSessionManager setScanPhoneIDs:](self, "setScanPhoneIDs:", v7);
  uint64_t v24 = (void *)sub_10008E36C(@"AUBLEScanTimeout");
  int v25 = v24;
  if (v24) {
    double v26 = (double)(uint64_t)[v24 integerValue];
  }
  else {
    double v26 = 4.0;
  }
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  [v27 setTimeout:v26];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100063434;
  v34[3] = &unk_1005CB220;
  objc_copyWeak(&v35, &location);
  [v28 setTimeoutHandler:v34];

  uint64_t v30 = auto_unlock_log(v29);
  __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v42 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Using BLE scan timeout %.2f seconds",  buf,  0xCu);
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100063500;
  v33[3] = &unk_1005CB3E8;
  v33[4] = self;
  [v32 activateWithCompletion:v33];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)invalidateScanner
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));

  if (v3)
  {
    uint64_t v5 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating scanner", v11, 2u);
    }

    -[SDAutoUnlockSessionManager setExtendedTimer:](self, "setExtendedTimer:", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    [v7 setTimeout:0.0];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    [v8 setTimeoutHandler:0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    [v9 setInvalidationHandler:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    [v10 invalidate];

    -[SDAutoUnlockSessionManager setScanner:](self, "setScanner:", 0LL);
    -[SDAutoUnlockSessionManager invalidateScanTimer](self, "invalidateScanTimer");
  }

- (void)handleFoundPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found BLE peer: %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanWatchIDs](self, "scanWatchIDs"));
  unsigned int v9 = [v8 containsObject:v7];

  if (v9)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);

    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bleDevice]);
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
          unsigned int v19 = [v18 isEqual:v7];

          if (v19) {
            [v16 handleFoundBLEDevice:v4];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v13);
    }

- (void)restartScanTimer:(unint64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting scan timer", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  if (!v7)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100063BB4;
    v13[3] = &unk_1005CB2F8;
    v13[4] = self;
    unsigned int v9 = sub_100114598(0, v8, v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSessionManager setScanTimer:](self, "setScanTimer:", v10);

    id v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
    dispatch_resume(v11);
  }

  id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  sub_100114638(v12, a3);
}

- (void)invalidateScanTimer
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating scan timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSessionManager setScanTimer:](self, "setScanTimer:", 0LL);
  }

- (void)handleBLEScanTimerFired
{
}

- (void)handleScanTimerFired
{
  id v3 = SFAutoUnlockErrorDomain;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanErrorString](self, "scanErrorString"));
  uint64_t v5 = (void *)v4;
  id v6 = @"Apple Watch Not Found";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v3,  SDAutoUnlockManagerMetricErrorDomainKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_1005F75B8,  SDAutoUnlockManagerMetricSuccessKey);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v9,  SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v11,  SDAutoUnlockManagerMetricLastSleepTypeKey);

  if (-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy"))
  {
    int64_t v12 = -[SDAutoUnlockSessionManager proxyErrorCode](self, "proxyErrorCode");
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 143LL;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  SDAutoUnlockManagerMetricUsingProxyDeviceKey);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxyDeviceModel](self, "proxyDeviceModel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v14,  SDAutoUnlockManagerMetricProxyDeviceModelKey);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SDAutoUnlockSessionManager proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v15,  SDAutoUnlockManagerMetricProxyDeviceRSSIKey);

    -[SDAutoUnlockSessionManager proxyDiscoverTime](self, "proxyDiscoverTime");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v16,  SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_1005F75E8,  SDAutoUnlockManagerMetricErrorTypeKey);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));

    if (v17)
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));
      uint64_t v13 = (uint64_t)[v21 code];

      id v7 = (__CFString *)v20;
    }

    else if (-[SDAutoUnlockSessionManager proxyNotAvailableForUnlock](self, "proxyNotAvailableForUnlock"))
    {

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_1005F7600,  SDAutoUnlockManagerMetricErrorTypeKey);
      id v7 = @"Watch Not On Wrist";
      uint64_t v13 = 144LL;
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_1005F7618,  SDAutoUnlockManagerMetricErrorTypeKey);
      uint64_t v13 = 131LL;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v7,  SDAutoUnlockManagerMetricErrorStringKey);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v22,  SDAutoUnlockManagerMetricErrorCodeKey);

  NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
  id v28 = v7;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  v13,  v23));

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanAutoUnlockDevices](self, "scanAutoUnlockDevices"));
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allObjects]);
  -[SDAutoUnlockSessionManager createRadarForError:devices:rangingResults:]( self,  "createRadarForError:devices:rangingResults:",  v24,  v26,  0LL);

  -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v8);
  -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:]( self,  "notifyObserversOfUnlockFailureWithResults:error:",  v8,  v24);
}

- (BOOL)unlockEnabledForPeer:(id)a3
{
  return CFDictionaryGetInt64([a3 advertisementFields], @"ue", 0) != 0;
}

- (BOOL)proxyAdvertisementForPeer:(id)a3
{
  return CFDictionaryGetInt64([a3 advertisementFields], @"uw", 0) != 0;
}

- (BOOL)watchLockedOnWristForPeer:(id)a3
{
  return CFDictionaryGetInt64([a3 advertisementFields], @"wl", 0) != 0;
}

- (BOOL)advertisingEnabled
{
  return 0;
}

- (BOOL)watchLockedAndOnWrist
{
  return 0;
}

- (int64_t)idsMacCount
{
  if (-[SDAutoUnlockSessionManager idsMacCountCache](self, "idsMacCountCache") < 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsMacDeviceIDs]);
    -[SDAutoUnlockSessionManager setIdsMacCountCache:](self, "setIdsMacCountCache:", [v4 count]);
  }

  return -[SDAutoUnlockSessionManager idsMacCountCache](self, "idsMacCountCache");
}

- (void)addServiceClientForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager serviceClients](self, "serviceClients"));
  [v5 addObject:v4];

  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");
}

- (void)removeServiceClientForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager serviceClients](self, "serviceClients"));
  [v5 removeObject:v4];

  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");
}

- (void)handleBLEDataReceivedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (SDAutoUnlockSessionWrapper *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"SDNearbyAgentNotificationInfoKeyBLEDevice"]);

  uint64_t v8 = auto_unlock_log(v7);
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v6;
    __int16 v49 = 1024;
    LODWORD(v50) = -[SDAutoUnlockSessionWrapper useBTPipe](v6, "useBTPipe");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received message from bleDevice %@, useBTPipe %d",  buf,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"SDNearbyAgentNotificationInfoKeyBLEData"]);

  int64_t v12 = -[SDAutoUnlockSessionWrapper initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockSessionWrapper),  "initWithData:",  v11);
  uint64_t v13 = auto_unlock_log(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received wrapper %@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000647B4;
  v44[3] = &unk_1005CC488;
  v44[4] = self;
  id v15 = v6;
  uint64_t v45 = v15;
  uint64_t v16 = v12;
  unsigned __int8 v46 = v16;
  id v17 = objc_retainBlock(v44);
  if (-[SDAutoUnlockSessionWrapper hasEncryptedPayload](v16, "hasEncryptedPayload"))
  {
    uint64_t v43 = 0LL;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper encryptedPayload](v16, "encryptedPayload"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper authTag](v16, "authTag"));
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper nonce](v16, "nonce"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper identifier](v15, "identifier"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( [v18 decryptMessage:v19 authTag:v20 nonce:v21 bluetoothID:v22 cachedDevices:1 errorCode:&v43]);

    if (v23)
    {
      uint64_t v25 = -[SDAutoUnlockSessionWrapper initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockSessionWrapper),  "initWithData:",  v23);
      ((void (*)(void *, SDAutoUnlockSessionWrapper *, uint64_t))v17[2])(v17, v25, 1LL);
    }

    else
    {
      uint64_t v26 = auto_unlock_log(v24);
      NSErrorUserInfoKey v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100067F34((uint64_t)&v43, v27, v28, v29, v30, v31, v32, v33);
      }

      uint64_t v25 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockDecryptionFailed);
      -[SDAutoUnlockSessionWrapper setVersion:](v25, "setVersion:", 1LL);
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      else {
        uint64_t v35 = 195LL;
      }
      -[SDAutoUnlockSessionWrapper setErrorCode:](v25, "setErrorCode:", v35);

      __int128 v36 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionWrapper);
      -[SDAutoUnlockSessionWrapper setVersion:](v36, "setVersion:", 1LL);
      -[SDAutoUnlockSessionWrapper setMessageType:](v36, "setMessageType:", 309LL);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v25, "data"));
      -[SDAutoUnlockSessionWrapper setPayload:](v36, "setPayload:", v37);

      uint64_t v39 = auto_unlock_log(v38);
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v48 = v25;
        __int16 v49 = 2112;
        __int128 v50 = v36;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sending %@ Wrapper %@", buf, 0x16u);
      }

      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v36, "data"));
      [v41 sendUnlockData:v42 toBLEDevice:v15 completion:&stru_1005CC4A8];
    }
  }

  else
  {
    ((void (*)(void *, SDAutoUnlockSessionWrapper *, void))v17[2])(v17, v16, 0LL);
  }
}

- (void)handleRelockMessage
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v2);
}

- (void)keyBagLockStateChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100064B3C;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)onqueue_keyBagLockStateChange:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  dispatch_assert_queue_V2(v4);

  uint64_t v6 = auto_unlock_log(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v9 = sub_100112D38((unint64_t)[v8 deviceKeyBagState]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v13 = 138412290;
    uint64_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Keybag state changed to %@",  (uint8_t *)&v13,  0xCu);
  }

  id v11 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[SDAutoUnlockSessionManager setLockStateChangedDate:](self, "setLockStateChangedDate:", v11);

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v12 handleKeyBagLockStateChanged];
}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v4 = auto_unlock_log(self);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User declined to enable Phone Auto Unlock",  v8,  2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v6 setBool:1 forKey:@"AutoUnlockDeclinedToEnablePAU"];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
  [v7 clearPhoneAutoUnlockUpsellNotification:v3];
}

- (BOOL)behaviorChangedAfterUpgrade
{
  return 0;
}

- (void)upsellBehaviorChangedAfterUpgradeIfNecessary
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 enabledAutoUnlockDevicesUsingCache:1]);
  id v6 = [v5 count];

  BOOL v7 = -[SDAutoUnlockSessionManager behaviorChangedAfterUpgrade](self, "behaviorChangedAfterUpgrade");
  BOOL v8 = v7;
  uint64_t v9 = auto_unlock_log(v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      int64_t v12 = @"YES";
    }
    else {
      int64_t v12 = @"NO";
    }
    if (v8) {
      id v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AutoUnlock Enabled: %@, behavior changed after upgrade: %@",  buf,  0x16u);
  }

  if (v6) {
    BOOL v13 = v8;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v15 = SFDeviceProductVersion();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v16 floatValue];
    objc_msgSend(v14, "setFloat:forKey:", @"AutoUnlockLastSeenVersion");

    dispatch_time_t v17 = dispatch_time(0LL, 3000000000LL);
    BOOL v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100064F08;
    block[3] = &unk_1005CC4C8;
    char v20 = 0;
    dispatch_after(v17, v18, block);
  }

- (BOOL)shouldNotify
{
  return 0;
}

- (void)handleUnexpectedDisablement:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", a3));
  id v4 = [v3 BOOLForKey:@"AutoUnlockAlreadyEnabledBefore"];
  int v5 = (int)v4;
  uint64_t v6 = auto_unlock_log(v4);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Resetting upsell notification defaults",  buf,  2u);
    }

    [v3 removeObjectForKey:@"AutoUnlockLastUpsellState"];
    [v3 removeObjectForKey:@"AutoUnlockLastUpsellDate"];
    [v3 removeObjectForKey:@"AutoUnlockDeclinedToEnablePAU"];
    [v3 removeObjectForKey:@"AutoUnlockAlreadyEnabledBefore"];
  }

  else
  {
    if (v8)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keeping upsell notification defaults", v9, 2u);
    }
  }
}

- (void)handleLockStateChanged
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v6 updateApproveBluetoothIDs];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SDAutoUnlockSessionManager setLastUnlockDate:](self, "setLastUnlockDate:", v7);

    uint64_t v8 = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
    if (v8 >= 1)
    {
      uint64_t v9 = auto_unlock_log(v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting attempt count", v11, 2u);
      }

      -[SDAutoUnlockSessionManager setAttemptCount:](self, "setAttemptCount:", 0LL);
    }
  }

- (id)unlockedOnWristDate
{
  return 0LL;
}

- (void)pipeConnectionChanged:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100065288;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDisplayStateChanged:(unint64_t)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v5);

  if (!a3)
  {
    BOOL v6 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
    if (v6)
    {
      uint64_t v7 = auto_unlock_log(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Canceling attempt in progress – device screen turned off",  v9,  2u);
      }

      -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
    }
  }

- (void)beginKeyRegistrationIfNecessary
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  id v16 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v16 deviceKeyBagUnlocked])
  {
    unsigned int v4 = -[SDAutoUnlockSessionManager needsArming](self, "needsArming");

    if (v4)
    {
      uint64_t v5 = auto_unlock_log(-[SDAutoUnlockSessionManager setNeedsArming:](self, "setNeedsArming:", 0LL));
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking if key originated registration is needed",  buf,  2u);
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      [v7 updateLTKs];

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pairedDeviceID]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteLTKForDeviceID:v9]);

      uint64_t v13 = auto_unlock_log(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning key originated registration",  buf,  2u);
        }

        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        -[SDAutoUnlockSessionManager createRegistrationKeySessionWithIdentifier:deviceID:requestData:locallyGenerated:]( self,  "createRegistrationKeySessionWithIdentifier:deviceID:requestData:locallyGenerated:",  v14,  v9,  0LL,  1LL);
      }

      else if (v15)
      {
        *(_DWORD *)buf = 138412290;
        BOOL v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not find remote LTK for %@",  buf,  0xCu);
      }
    }
  }

  else
  {
  }

- (void)handleBioLockout
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device entered bio lockout, resetting all key devices",  buf,  2u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID",  0LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) invalidate];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v10);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  [v13 handleBioLockout];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID]( self,  "lockRegistrationSessionsByDeviceID"));
  [v14 removeAllObjects];

  -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
  -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
}

- (void)handlePairedDeviceLockStateChanged
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000657B4;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleAuthenticationSessionStarted
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000658A0;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)grabLanguageAssertionForAutoRelock
{
  uint64_t v2 = auto_unlock_log(self);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = 70LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Delay releasing language assertion for Auto Relock for %ld seconds",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:70.0]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  [v6 addPreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  [v7 pushDateForPreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason" expirationDate:v5];
}

- (void)releaseLanguageAssertionForAutoRelock
{
  uint64_t v2 = auto_unlock_log(self);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Release language assertion for Auto Relock",  v5,  2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  [v4 removePreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason"];
}

- (BOOL)deviceCurrentlyUnlockedByWatch
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setUpMagnetLinkTimer
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
  -[SDAutoUnlockSessionManager setMagnetLinkTimer:](self, "setMagnetLinkTimer:", v4);

  uint64_t v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100065D08;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);

  BOOL v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);

  int v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  dispatch_source_set_cancel_handler(v8, &stru_1005CC4E8);

  uint64_t v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  dispatch_activate(v9);

  uint64_t v11 = auto_unlock_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Magnet Link Timer Activated", v13, 2u);
  }
}

- (void)cancelMagnetLinkTimer
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  if (v3)
  {
    dispatch_source_t v4 = (void *)v3;
    uint64_t v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
    uint64_t v6 = dispatch_source_testcancel(v5);

    if (!v6)
    {
      dispatch_time_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
      dispatch_source_cancel(v7);

      -[SDAutoUnlockSessionManager setMagnetLinkTimer:](self, "setMagnetLinkTimer:", 0LL);
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
      uint64_t v9 = SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
      uint64_t v12 = v11;
      if (v10)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
        unsigned int v14 = [v13 intValue];

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14 + 1));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
        [v15 setObject:v12 forKeyedSubscript:v9];
      }

      else
      {
        [v11 setObject:&off_1005F75D0 forKeyedSubscript:v9];
      }

      uint64_t v17 = auto_unlock_log(v16);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cancelled Magnet Link Timer", v19, 2u);
      }
    }
  }

- (id)baseResultsDictionaryForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  SDAutoUnlockManagerMetricErrorDomainKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_1005F75B8,  SDAutoUnlockManagerMetricSuccessKey);
  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v9,  SDAutoUnlockManagerMetricLastSleepTypeKey);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v10,  SDAutoUnlockManagerMetricErrorStringKey);

  id v11 = [v4 code];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v12,  SDAutoUnlockManagerMetricErrorCodeKey);

  return v5;
}

- (void)handleBluetoothPowerChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor", a3));
  unsigned int v5 = [v4 bluetoothEnabled];

  uint64_t v7 = auto_unlock_log(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Bluetooth power changed (interface on: %@)",  (uint8_t *)&v10,  0xCu);
  }

  if (v5)
  {
    -[SDAutoUnlockSessionManager setBluetoothErrorCount:](self, "setBluetoothErrorCount:", 0LL);
    -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", 0LL);
    -[SDAutoUnlockSessionManager savePresentedBluetoothError](self, "savePresentedBluetoothError");
  }

- (id)errorStringForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  if (!a5) {
    return @"### FaceID needs to be enabled for this feature to work";
  }
  if (!a3 && !a4)
  {
    int v5 = SFIsGreenTeaDevice(self, a2);
    uint64_t v6 = @"UNLOCK_WIFI_BLUETOOTH_DISABLED";
    uint64_t v7 = @"UNLOCK_WLAN_BLUETOOTH_DISABLED";
LABEL_11:
    if (v5) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v6;
    }
    goto LABEL_14;
  }

  if (a3)
  {
    if (a4) {
      return 0LL;
    }
    int v5 = SFIsGreenTeaDevice(self, a2);
    uint64_t v6 = @"UNLOCK_WIFI_DISABLED";
    uint64_t v7 = @"UNLOCK_WLAN_DISABLED";
    goto LABEL_11;
  }

  uint64_t v9 = @"UNLOCK_BLUETOOTH_DISABLED";
LABEL_14:
  uint64_t v10 = SFLocalizedStringForKey(v9, a2);
  return (id)objc_claimAutoreleasedReturnValue(v10);
}

- (int64_t)errorCodeForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  int64_t v5 = 123LL;
  if (!a3 && !a4) {
    int64_t v5 = 124LL;
  }
  uint64_t v6 = 120LL;
  if (a4) {
    uint64_t v6 = 0LL;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  if (a5) {
    return v5;
  }
  else {
    return 205LL;
  }
}

- (BOOL)shouldShowErrorForBluetoothEnabled:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  BOOL v4 = -[SDAutoUnlockSessionManager presentedBluetoothError](self, "presentedBluetoothError");
  if (v4)
  {
    uint64_t v5 = auto_unlock_log(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Already presented Bluetooth off error",  (uint8_t *)v10,  2u);
    }

    return 0;
  }

  if (-[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount") >= 5)
  {
    -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", 1LL);
    -[SDAutoUnlockSessionManager savePresentedBluetoothError](self, "savePresentedBluetoothError");
    return 0;
  }

  uint64_t v8 = auto_unlock_log( -[SDAutoUnlockSessionManager setBluetoothErrorCount:]( self,  "setBluetoothErrorCount:",  (char *)-[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount") + 1));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = -[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "### Bluetooth error count: %d",  (uint8_t *)v10,  8u);
  }

  return 1;
}

- (BOOL)shouldShowErrorForWiFiEnabled:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  BOOL v4 = -[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError");
  if (v4)
  {
    uint64_t v5 = auto_unlock_log(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Already presented Wi-Fi off error",  (uint8_t *)v10,  2u);
    }

    return 0;
  }

  if (-[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount") >= 5)
  {
    -[SDAutoUnlockSessionManager setPresentedWiFiError:](self, "setPresentedWiFiError:", 1LL);
    -[SDAutoUnlockSessionManager savePresentedWiFiError](self, "savePresentedWiFiError");
    return 0;
  }

  uint64_t v8 = auto_unlock_log( -[SDAutoUnlockSessionManager setWifiErrorCount:]( self,  "setWifiErrorCount:",  (char *)-[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount") + 1));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = -[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### WiFi error count: %d", (uint8_t *)v10, 8u);
  }

  return 1;
}

- (void)loadPresentedBluetoothError
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  -[SDAutoUnlockSessionManager setPresentedBluetoothError:]( self,  "setPresentedBluetoothError:",  [v3 BOOLForKey:@"AutoUnlockPresentedBluetoothError"]);
}

- (void)loadPresentedWiFiError
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  -[SDAutoUnlockSessionManager setPresentedWiFiError:]( self,  "setPresentedWiFiError:",  [v3 BOOLForKey:@"AutoUnlockPresentedWiFiError"]);
}

- (void)savePresentedBluetoothError
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  objc_msgSend( v3,  "setBool:forKey:",  -[SDAutoUnlockSessionManager presentedBluetoothError](self, "presentedBluetoothError"),  @"AutoUnlockPresentedBluetoothError");
  [v3 synchronize];
}

- (void)savePresentedWiFiError
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  objc_msgSend( v3,  "setBool:forKey:",  -[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError"),  @"AutoUnlockPresentedWiFiError");
  [v3 synchronize];
}

- (void)generateStateDump
{
  uint64_t v2 = auto_unlock_log(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100068144();
  }
}

- (void)initializeCaptureBlock
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006687C;
  v4[3] = &unk_1005CC510;
  v4[4] = self;
  -[SDAutoUnlockSessionManager setStateHandle:](self, "setStateHandle:", os_state_add_handler(v3, v4));
}

- (os_state_data_s)dumpState
{
  uint64_t v3 = auto_unlock_log(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  id v25 = 0LL;
  NSAppendPrintF(&v25, "\n");
  id v5 = v25;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager state](self, "state"));
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    id v24 = v5;
    NSAppendPrintF(&v24, "%@\n", v6);
    id v8 = v24;

    id v5 = v8;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 state]);

  if (v10)
  {
    id v23 = v5;
    NSAppendPrintF(&v23, "%@\n", v10);
    id v11 = v23;

    id v5 = v11;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 state]);

  if (v13)
  {
    id v22 = v5;
    NSAppendPrintF(&v22, "%@\n", v13);
    id v14 = v22;

    id v5 = v14;
  }

  id v21 = v5;
  NSAppendPrintF(&v21, "Auto Unlock State End\n");
  id v15 = v21;

  if (v15)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  200LL,  0LL,  0LL));
    id v17 = [v16 length];
    __int128 v18 = (os_state_data_s *)calloc(1uLL, (size_t)v17 + 200);
    unsigned int v19 = v18;
    if (v18)
    {
      v18->var0 = 1;
      v18->var1.var1 = v17;
      __strlcpy_chk(v18->var3, "Auto Unlock State", 64LL, 64LL);
      id v16 = v16;
      memcpy(v19->var4, [v16 bytes], (size_t)v17);
    }
  }

  else
  {
    id v16 = 0LL;
    unsigned int v19 = 0LL;
  }

  return v19;
}

- (NSString)state
{
  id v38 = 0LL;
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  BOOL v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v38, "%@\n", v5);
  id v6 = v38;

  id v37 = v6;
  NSAppendPrintF(&v37, "-------------\n");
  id v7 = v37;

  id v36 = v7;
  id v8 = objc_opt_new(&OBJC_CLASS___NSDate);
  id v9 = sub_10008A124(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  NSAppendPrintF(&v36, "Current Date: %@\n", v10);
  id v11 = v36;

  id v35 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  else {
    uint64_t v13 = @"NO";
  }
  NSAppendPrintF(&v35, "Ranging Supported: %@\n", v13);
  id v14 = v35;

  id v34 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 modelCode]);
  NSAppendPrintF(&v34, "Model Identifier: %@\n", v16);
  id v17 = v34;

  id v33 = v17;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  else {
    unsigned int v19 = @"YES";
  }
  NSAppendPrintF(&v33, "Device Has Passcode: %@\n", v19);
  id v20 = v33;

  id v32 = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  else {
    id v22 = @"NO";
  }
  NSAppendPrintF(&v32, "Unlocked: %@\n", v22);
  id v23 = v32;

  id v31 = v23;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockStateChangedDate](self, "lockStateChangedDate"));
  id v25 = sub_10008A124(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  NSAppendPrintF(&v31, "Lock State Changed: %@\n", v26);
  id v27 = v31;

  id v30 = v27;
  NSAppendPrintF(&v30, "\n");
  id v28 = v30;

  return (NSString *)v28;
}

- (void)storePreviousSessionID:(id)a3
{
  id v13 = a3;
  -[SDAutoUnlockSessionManager loadPreviousSessionIDs](self, "loadPreviousSessionIDs");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  [v4 insertObject:v5 atIndex:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  id v7 = [v6 count];

  if ((unint64_t)v7 >= 0x65)
  {
    do
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
      [v8 removeLastObject];

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
      id v10 = [v9 count];
    }

    while ((unint64_t)v10 > 0x64);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  [v11 setObject:v12 forKey:@"ApproveSessionIDs"];

  [v11 synchronize];
}

- (BOOL)previousSessionExists:(id)a3
{
  id v4 = a3;
  -[SDAutoUnlockSessionManager loadPreviousSessionIDs](self, "loadPreviousSessionIDs");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)loadPreviousSessionIDs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));

  if (!v3)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ApproveSessionIDs"]);
    id v5 = [v4 mutableCopy];
    -[SDAutoUnlockSessionManager setPreviousSessionIDs:](self, "setPreviousSessionIDs:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
    if (!v6)
    {
      id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[SDAutoUnlockSessionManager setPreviousSessionIDs:](self, "setPreviousSessionIDs:", v7);
    }
  }

- (void)setState:(id)a3
{
}

- (BOOL)attemptInProgress
{
  return self->_attemptInProgress;
}

- (void)setAttemptInProgress:(BOOL)a3
{
  self->_attemptInProgress = a3;
}

- (NSData)attemptExternalACMContext
{
  return self->_attemptExternalACMContext;
}

- (void)setAttemptExternalACMContext:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSDictionary)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (OS_dispatch_queue)sessionManagerQueue
{
  return self->_sessionManagerQueue;
}

- (void)setSessionManagerQueue:(id)a3
{
}

- (NSHashTable)observerTable
{
  return self->_observerTable;
}

- (void)setObserverTable:(id)a3
{
}

- (SDAutoUnlockSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setSuggestionManager:(id)a3
{
}

- (NSMutableDictionary)lockAuthSessions
{
  return self->_lockAuthSessions;
}

- (void)setLockAuthSessions:(id)a3
{
}

- (NSMutableArray)canceledPairingKeySessions
{
  return self->_canceledPairingKeySessions;
}

- (void)setCanceledPairingKeySessions:(id)a3
{
}

- (NSMutableArray)canceledAuthLockSessions
{
  return self->_canceledAuthLockSessions;
}

- (void)setCanceledAuthLockSessions:(id)a3
{
}

- (NSMutableDictionary)keyAuthSessions
{
  return self->_keyAuthSessions;
}

- (void)setKeyAuthSessions:(id)a3
{
}

- (NSMutableDictionary)lockPairingSessions
{
  return self->_lockPairingSessions;
}

- (void)setLockPairingSessions:(id)a3
{
}

- (NSMutableDictionary)keyPairingSessions
{
  return self->_keyPairingSessions;
}

- (void)setKeyPairingSessions:(id)a3
{
}

- (NSMutableDictionary)proxySessions
{
  return self->_proxySessions;
}

- (void)setProxySessions:(id)a3
{
}

- (NSMutableArray)locksWithAKSTokens
{
  return self->_locksWithAKSTokens;
}

- (void)setLocksWithAKSTokens:(id)a3
{
}

- (NSMutableArray)keysWithAKSTokens
{
  return self->_keysWithAKSTokens;
}

- (void)setKeysWithAKSTokens:(id)a3
{
}

- (NSMutableDictionary)keyRegistrationSessionsByDeviceID
{
  return self->_keyRegistrationSessionsByDeviceID;
}

- (void)setKeyRegistrationSessionsByDeviceID:(id)a3
{
}

- (NSMutableDictionary)lockRegistrationSessionsByDeviceID
{
  return self->_lockRegistrationSessionsByDeviceID;
}

- (void)setLockRegistrationSessionsByDeviceID:(id)a3
{
}

- (NSMutableSet)serviceClients
{
  return self->_serviceClients;
}

- (void)setServiceClients:(id)a3
{
}

- (BOOL)watchUnlockEnabled
{
  return self->_watchUnlockEnabled;
}

- (void)setWatchUnlockEnabled:(BOOL)a3
{
  self->_watchUnlockEnabled = a3;
}

- (NSData)previousMacAddressData
{
  return self->_previousMacAddressData;
}

- (void)setPreviousMacAddressData:(id)a3
{
}

- (BOOL)previousNearbyState
{
  return self->_previousNearbyState;
}

- (void)setPreviousNearbyState:(BOOL)a3
{
  self->_previousNearbyState = a3;
}

- (OS_dispatch_source)nearbyPushTimer
{
  return self->_nearbyPushTimer;
}

- (void)setNearbyPushTimer:(id)a3
{
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  self->_attemptPrewarmed = a3;
}

- (NSDate)prewarmStart
{
  return self->_prewarmStart;
}

- (void)setPrewarmStart:(id)a3
{
}

- (NSDate)attemptStart
{
  return self->_attemptStart;
}

- (void)setAttemptStart:(id)a3
{
}

- (BOOL)extendedTimer
{
  return self->_extendedTimer;
}

- (void)setExtendedTimer:(BOOL)a3
{
  self->_extendedTimer = a3;
}

- (SFDeviceDiscovery)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (SFAutoUnlockDevice)attemptDevice
{
  return self->_attemptDevice;
}

- (void)setAttemptDevice:(id)a3
{
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (NSString)attemptBundlePath
{
  return self->_attemptBundlePath;
}

- (void)setAttemptBundlePath:(id)a3
{
}

- (NSString)attemptAppName
{
  return self->_attemptAppName;
}

- (void)setAttemptAppName:(id)a3
{
}

- (NSString)attemptNavBarTitle
{
  return self->_attemptNavBarTitle;
}

- (void)setAttemptNavBarTitle:(id)a3
{
}

- (id)attemptActivatedHandler
{
  return self->_attemptActivatedHandler;
}

- (void)setAttemptActivatedHandler:(id)a3
{
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (double)proxyDiscoverTime
{
  return self->_proxyDiscoverTime;
}

- (void)setProxyDiscoverTime:(double)a3
{
  self->_proxyDiscoverTime = a3;
}

- (BOOL)notifiedForProxy
{
  return self->_notifiedForProxy;
}

- (void)setNotifiedForProxy:(BOOL)a3
{
  self->_notifiedForProxy = a3;
}

- (NSString)scanErrorString
{
  return self->_scanErrorString;
}

- (void)setScanErrorString:(id)a3
{
}

- (NSError)authSessionError
{
  return self->_authSessionError;
}

- (void)setAuthSessionError:(id)a3
{
}

- (int64_t)proxyErrorCode
{
  return self->_proxyErrorCode;
}

- (void)setProxyErrorCode:(int64_t)a3
{
  self->_proxyErrorCode = a3;
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

- (int64_t)lastProxyState
{
  return self->_lastProxyState;
}

- (void)setLastProxyState:(int64_t)a3
{
  self->_lastProxyState = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (BOOL)proxyNotAvailableForUnlock
{
  return self->_proxyNotAvailableForUnlock;
}

- (void)setProxyNotAvailableForUnlock:(BOOL)a3
{
  self->_proxyNotAvailableForUnlock = a3;
}

- (NSSet)scanAutoUnlockDevices
{
  return self->_scanAutoUnlockDevices;
}

- (void)setScanAutoUnlockDevices:(id)a3
{
}

- (NSSet)scanWatchIDs
{
  return self->_scanWatchIDs;
}

- (void)setScanWatchIDs:(id)a3
{
}

- (NSSet)scanPhoneIDs
{
  return self->_scanPhoneIDs;
}

- (void)setScanPhoneIDs:(id)a3
{
}

- (int64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(int64_t)a3
{
  self->_attemptCount = a3;
}

- (NSString)attemptID
{
  return self->_attemptID;
}

- (void)setAttemptID:(id)a3
{
}

- (NSString)incrementedCountID
{
  return self->_incrementedCountID;
}

- (void)setIncrementedCountID:(id)a3
{
}

- (int64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(int64_t)a3
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

- (NSSet)eligibleDevices
{
  return self->_eligibleDevices;
}

- (void)setEligibleDevices:(id)a3
{
}

- (int64_t)wifiErrorCount
{
  return self->_wifiErrorCount;
}

- (void)setWifiErrorCount:(int64_t)a3
{
  self->_wifiErrorCount = a3;
}

- (int64_t)bluetoothErrorCount
{
  return self->_bluetoothErrorCount;
}

- (void)setBluetoothErrorCount:(int64_t)a3
{
  self->_bluetoothErrorCount = a3;
}

- (BOOL)presentedBluetoothError
{
  return self->_presentedBluetoothError;
}

- (void)setPresentedBluetoothError:(BOOL)a3
{
  self->_presentedBluetoothError = a3;
}

- (BOOL)presentedWiFiError
{
  return self->_presentedWiFiError;
}

- (void)setPresentedWiFiError:(BOOL)a3
{
  self->_presentedWiFiError = a3;
}

- (BOOL)currentlyAdvertising
{
  return self->_currentlyAdvertising;
}

- (void)setCurrentlyAdvertising:(BOOL)a3
{
  self->_currentlyAdvertising = a3;
}

- (int64_t)idsMacCountCache
{
  return self->_idsMacCountCache;
}

- (void)setIdsMacCountCache:(int64_t)a3
{
  self->_idsMacCountCache = a3;
}

- (NSDate)advertisingChangedDate
{
  return self->_advertisingChangedDate;
}

- (void)setAdvertisingChangedDate:(id)a3
{
}

- (NSDate)wristStateChangedDate
{
  return self->_wristStateChangedDate;
}

- (void)setWristStateChangedDate:(id)a3
{
}

- (NSDate)lockStateChangedDate
{
  return self->_lockStateChangedDate;
}

- (void)setLockStateChangedDate:(id)a3
{
}

- (NSDate)nearbyDeviceChangedDate
{
  return self->_nearbyDeviceChangedDate;
}

- (void)setNearbyDeviceChangedDate:(id)a3
{
}

- (NSDate)pipeConnectionChangedDate
{
  return self->_pipeConnectionChangedDate;
}

- (void)setPipeConnectionChangedDate:(id)a3
{
}

- (BOOL)previousConnectedState
{
  return self->_previousConnectedState;
}

- (void)setPreviousConnectedState:(BOOL)a3
{
  self->_previousConnectedState = a3;
}

- (BOOL)autoRelockAssertionTimerActive
{
  return self->_autoRelockAssertionTimerActive;
}

- (void)setAutoRelockAssertionTimerActive:(BOOL)a3
{
  self->_autoRelockAssertionTimerActive = a3;
}

- (BOOL)cachedDeviceWiFiState
{
  return self->_cachedDeviceWiFiState;
}

- (void)setCachedDeviceWiFiState:(BOOL)a3
{
  self->_cachedDeviceWiFiState = a3;
}

- (BOOL)cachedWatchWiFiState
{
  return self->_cachedWatchWiFiState;
}

- (void)setCachedWatchWiFiState:(BOOL)a3
{
  self->_cachedWatchWiFiState = a3;
}

- (BOOL)wifiStateNeedsUpdating
{
  return self->_wifiStateNeedsUpdating;
}

- (void)setWifiStateNeedsUpdating:(BOOL)a3
{
  self->_wifiStateNeedsUpdating = a3;
}

- (BOOL)useBTPipe
{
  return self->_useBTPipe;
}

- (void)setUseBTPipe:(BOOL)a3
{
  self->_useBTPipe = a3;
}

- (BOOL)preventRadarNotification
{
  return self->_preventRadarNotification;
}

- (void)setPreventRadarNotification:(BOOL)a3
{
  self->_preventRadarNotification = a3;
}

- (NSMutableDictionary)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
}

- (NSMutableArray)previousSessionIDs
{
  return self->_previousSessionIDs;
}

- (void)setPreviousSessionIDs:(id)a3
{
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
{
}

- (SDAutoUnlockLocalDeviceController)localDeviceController
{
  return self->_localDeviceController;
}

- (void)setLocalDeviceController:(id)a3
{
}

- (OS_dispatch_source)magnetLinkTimer
{
  return self->_magnetLinkTimer;
}

- (void)setMagnetLinkTimer:(id)a3
{
}

- (NSDate)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (void)setLastUnlockDate:(id)a3
{
}

- (BOOL)lastUnlockedByWatch
{
  return self->_lastUnlockedByWatch;
}

- (void)setLastUnlockedByWatch:(BOOL)a3
{
  self->_lastUnlockedByWatch = a3;
}

- (BOOL)lastLockedByRelock
{
  return self->_lastLockedByRelock;
}

- (void)setLastLockedByRelock:(BOOL)a3
{
  self->_lastLockedByRelock = a3;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  self->_doNotPostUnlockConfirmation = a3;
}

- (BOOL)suppressAlert
{
  return self->_suppressAlert;
}

- (void)setSuppressAlert:(BOOL)a3
{
  self->_suppressAlert = a3;
}

- (int64_t)periocularStatus
{
  return self->_periocularStatus;
}

- (void)setPeriocularStatus:(int64_t)a3
{
  self->_periocularStatus = a3;
}

- (BOOL)needsArming
{
  return self->_needsArming;
}

- (void)setNeedsArming:(BOOL)a3
{
  self->_needsArming = a3;
}

- (BOOL)isBeingUsedForSiri
{
  return self->_isBeingUsedForSiri;
}

- (void)setIsBeingUsedForSiri:(BOOL)a3
{
  self->_isBeingUsedForSiri = a3;
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (SDAutoUnlockTransportProtocol)autoUnlockTransport
{
  return (SDAutoUnlockTransportProtocol *)objc_loadWeakRetained((id *)&self->_autoUnlockTransport);
}

- (SDUnlockMagnetTransport)magnetTransport
{
  return (SDUnlockMagnetTransport *)objc_loadWeakRetained((id *)&self->_magnetTransport);
}

- (SDKeyManaging)keyManager
{
  return (SDKeyManaging *)objc_loadWeakRetained((id *)&self->_keyManager);
}

- (id)isSignedIntoPrimaryiCloudAccount
{
  return self->_isSignedIntoPrimaryiCloudAccount;
}

- (void)setIsSignedIntoPrimaryiCloudAccount:(id)a3
{
}

- (id)isFaceIDEnabled
{
  return self->_isFaceIDEnabled;
}

- (void)setIsFaceIDEnabled:(id)a3
{
}

- (id)isWifiEnabled
{
  return self->_isWifiEnabled;
}

- (void)setIsWifiEnabled:(id)a3
{
}

- (id)isBluetoothEnabled
{
  return self->_isBluetoothEnabled;
}

- (void)setIsBluetoothEnabled:(id)a3
{
}

- (id)isActiveDeviceNearby
{
  return self->_isActiveDeviceNearby;
}

- (void)setIsActiveDeviceNearby:(id)a3
{
}

- (SDAutoUnlockPeer)remotePeer
{
  return self->_remotePeer;
}

- (void)setRemotePeer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end