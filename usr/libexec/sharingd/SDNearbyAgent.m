@interface SDNearbyAgent
+ (SDNearbyAgent)sharedNearbyAgent;
- (BOOL)_bleNearbyActionAdvertiserShouldAdvertise;
- (BOOL)_bleNearbyActionScannerShouldScan;
- (BOOL)_bleNearbyInfoAdvertiserLingerIfNeeded;
- (BOOL)_bleNearbyInfoAdvertiserShouldAddField3;
- (BOOL)_bleNearbyInfoAdvertiserShouldAdvertise;
- (BOOL)_bleNearbyInfoScannerShouldScan;
- (BOOL)_bleProximityPairingScannerShouldScan;
- (BOOL)_deviceCanTriggerEnhancedDiscovery:(id)a3;
- (BOOL)_identificationIdentifyDevice:(id)a3 sfDevice:(id)a4;
- (BOOL)_idsHasActiveWatch;
- (BOOL)_idsShouldAdvertiseNearbyInfo;
- (BOOL)_shouldDeliverDonStateUpdates;
- (BOOL)autoUnlockActive;
- (BOOL)boostNearbyInfo;
- (BOOL)enhancedDiscovery;
- (BOOL)hasAdHocPairings;
- (BOOL)idsIsSignedIn;
- (BOOL)inDiscoverySession;
- (BOOL)isDeviceValidRIServer:(id)a3;
- (BOOL)isTempAuthTagKnown:(id)a3 bluetoothAddressData:(id)a4;
- (BOOL)isWifiCritical;
- (BOOL)preventNearbyActionAdvertising;
- (BOOL)screenOn;
- (CUBluetoothClient)btConnectedDeviceMonitor;
- (NSArray)adHocPairedDeviceIdentities;
- (NSData)bleAuthTag;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (RPIdentity)idSelfIdentity;
- (RPIdentity)temporarySelfIdentity;
- (SDNearbyAgent)init;
- (double)_activityMonitorLastUserEventDelta;
- (id)_bleUpdateUseCases:(id)a3;
- (id)_idsBluetoothDeviceIDsForAnnouncements;
- (id)_idsBluetoothDeviceIDsForHomePods;
- (id)_idsBluetoothDeviceIDsForLEPipe;
- (id)_idsBluetoothDeviceIDsForMe;
- (id)_idsBluetoothDeviceIDsForOneness;
- (id)_idsBluetoothDeviceIDsForSMSRelay;
- (id)_idsBluetoothDeviceIDsForSharing;
- (id)_idsBluetoothDeviceIDsForSharingLocked;
- (id)_idsBluetoothDeviceIDsForiMessage;
- (id)_idsDeviceArrayLocked;
- (id)_useCasesToHexString:(id)a3;
- (id)bleProximityEstimatorForActionType:(unsigned __int8)a3 device:(id)a4;
- (id)bleProximityInfo;
- (id)bleProximityInfoForActionType:(unsigned __int8)a3 device:(id)a4;
- (id)bleProximityInfoForType:(id)a3 device:(id)a4;
- (id)bleProximityInfoForType:(id)a3 device:(id)a4 allInfo:(id)a5;
- (id)bleProximityRSSIEstimatorInfo;
- (id)idsBluetoothDeviceIDsForLEPipe;
- (id)idsBluetoothDeviceIDsForRIServers;
- (id)idsBluetoothDeviceIDsForSharing;
- (id)idsBluetoothDeviceIDsForWatches;
- (id)idsDeviceArray;
- (id)idsDeviceForBluetoothDeviceID:(id)a3 conflictDetected:(BOOL *)a4;
- (id)idsDeviceIDsForFamily;
- (id)idsDeviceIDsForRIServers;
- (id)sharedNearbyPipe;
- (int)_allowEnhancedDiscovery;
- (int)_bleNearbyInfoReceivedFrameType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6;
- (int)_idsAppleTVCount;
- (int)_idsContinuityDeviceCount;
- (int)_idsHomePodCount;
- (int)_idsMacCount;
- (int)_idsShouldEncryptActivityLevel;
- (int)_idsVisionOS1Count;
- (int)_idsVisionOS2OrHigherCount;
- (int)_idsWatchCount;
- (int)_sendMessage:(id)a3 frameType:(unsigned __int8)a4 service:(id)a5 session:(id)a6;
- (int)_setupHandleCreateSession:(id)a3 data:(id)a4;
- (int)_setupHandleSessionCreated:(id)a3 data:(id)a4;
- (int)_setupHandleSessionEncryptedFrame:(id)a3 type:(unsigned __int8)a4 cnx:(id)a5;
- (int)_setupHandleSessionMessageType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6 session:(id)a7;
- (int)_setupSendCreateSession:(id)a3 cnx:(id)a4;
- (int)_setupSendData:(id)a3 sessionIdentifier:(id)a4 cnx:(id)a5 clientSession:(id)a6;
- (int)audioRoutingScore;
- (int)bleNearbyInfoSendFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6 isSession:(BOOL)a7;
- (int)bleNearbyInfoStartConnectionToDevice:(id)a3 owner:(id)a4 connected:(BOOL *)a5;
- (int)serviceStart:(id)a3;
- (int)sessionStart:(id)a3;
- (int64_t)bleProximityRSSIThreshold:(id)a3;
- (int64_t)bleProximityRSSIThresholdForType:(int64_t)a3 device:(id)a4;
- (unsigned)_activityMonitorCurrentLevelAndNeedsPoll:(BOOL *)a3 recentUserActivity:(BOOL *)a4;
- (unsigned)_bleEncryptActivityLevel:(unsigned __int8)a3;
- (unsigned)_bleProximityUpdateDeviceCloseNearbyActionDevice:(id)a3;
- (unsigned)_bleProximityUpdateNearbyActionDevice:(id)a3;
- (unsigned)_bleProximityUpdateNearbyInfoDevice:(id)a3;
- (unsigned)_identificationDecryptActivityLevel:(unsigned __int8)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (unsigned)hotspotInfo;
- (void)_activate;
- (void)_activityMonitorCarPlayStatusChanged:(id)a3;
- (void)_activityMonitorEnsureStarted;
- (void)_activityMonitorEnsureStopped;
- (void)_activityMonitorMediaAccessControlSettingChanged:(id)a3;
- (void)_activityMonitorMultipleUsersLoggedInChanged:(id)a3;
- (void)_activityMonitorScreenStateChanged:(id)a3;
- (void)_activityMonitorUILockStatusChanged:(id)a3;
- (void)_activityMonitorUpdate;
- (void)_activityMonitorUpdateUserActive:(BOOL)a3;
- (void)_activityMonitorWatchWristStateChanged:(id)a3;
- (void)_bleAdvertisingAddressChanged;
- (void)_bleNearbyActionAdvertiserEnsureStarted;
- (void)_bleNearbyActionAdvertiserEnsureStopped;
- (void)_bleNearbyActionScannerEnsureStarted;
- (void)_bleNearbyActionScannerEnsureStopped;
- (void)_bleNearbyInfoAdvertiserEnsureStarted;
- (void)_bleNearbyInfoAdvertiserEnsureStopped;
- (void)_bleNearbyInfoAdvertiserLingerStart:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdate;
- (void)_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:(id)a3;
- (void)_bleNearbyInfoAdvertiserUpdateAdvertiseReason:(id)a3;
- (void)_bleNearbyInfoReceivedData:(id)a3 cnx:(id)a4 peer:(id)a5;
- (void)_bleNearbyInfoScannerEnsureStarted;
- (void)_bleNearbyInfoScannerEnsureStopped;
- (void)_bleProximityPairingScannerEnsureStarted;
- (void)_bleProximityPairingScannerEnsureStopped;
- (void)_bleUpdateAuthTagIfNeeded;
- (void)_bleUpdateScanner:(id)a3 typeFlag:(unint64_t)a4;
- (void)_btPipeEnsureStopped;
- (void)_btPipeHandleFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)_btPipeStateChanged:(id)a3;
- (void)_cancelDonStateRetryTimers;
- (void)_deliverDoffedEvent;
- (void)_deliverDonnedEventToDevice:(id)a3 allowRetry:(BOOL)a4;
- (void)_deliverDonnedEventsStart;
- (void)_deviceDiscoveryBLEDeviceChanged:(id)a3 type:(int64_t)a4 changes:(unsigned int)a5;
- (void)_deviceDiscoveryBLEDeviceFound:(id)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryBLEDeviceLost:(id)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryBLEScanStateChanged:(int64_t)a3 type:(int64_t)a4;
- (void)_deviceDiscoveryFastScanEvaluate:(id)a3 device:(id)a4;
- (void)_deviceDiscoveryFastScanStart:(id)a3 device:(id)a4 reason:(id)a5;
- (void)_deviceDiscoveryFastScanStop:(id)a3 reset:(BOOL)a4 reason:(id)a5;
- (void)_deviceDiscoveryRequestStart:(id)a3;
- (void)_disableEnhancedDiscovery:(id)a3;
- (void)_discoverySessionStateChange:(BOOL)a3;
- (void)_enableEnhancedDiscovery:(id)a3;
- (void)_enableEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4;
- (void)_enhancedDiscoveryScreenChange:(BOOL)a3;
- (void)_enhancedDiscoveryTimerFired;
- (void)_handleAirDropDiscoverableModeChanged:(id)a3;
- (void)_handleAppleIDChanged:(id)a3;
- (void)_handleRetryTimerForDevice:(id)a3;
- (void)_identificationCheckFlagsAndACL;
- (void)_identificationDecryptAudioRoutingScoreData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (void)_identificationDecryptHotspotData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6;
- (void)_identificationEnsureStarted;
- (void)_identificationEnsureStopped;
- (void)_identificationGetIdentities;
- (void)_identificationHandleDeviceFound:(id)a3 flags:(unint64_t)a4;
- (void)_identificationHandleDeviceLost:(id)a3 flags:(unint64_t)a4;
- (void)_identificationHandleDiscoveryStop;
- (void)_identificationMaintenanceTimer;
- (void)_identificationReIdentify;
- (void)_identificationReIdentifySameAccountDevices:(id)a3 type:(int64_t)a4;
- (void)_idsEnsureStarted;
- (void)_idsEnsureStopped;
- (void)_idsMeDeviceChanged;
- (void)_invalidate;
- (void)_invalidateWatchDiscoveryIfNeeded;
- (void)_mirroringStateChanged:(id)a3;
- (void)_registerForWombatActivityNotification;
- (void)_sendUnlockData:(id)a3 toBLEDevice:(id)a4 direct:(BOOL)a5 completion:(id)a6;
- (void)_smartCoverStatusChanged:(id)a3;
- (void)_startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4;
- (void)_stopUnlockBLEConnectionWithDevice:(id)a3;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)_testPipePing;
- (void)_unlockApproveBluetoothIDsChanged:(id)a3;
- (void)_unlockDeviceFilterChangedForRequest:(id)a3;
- (void)_unlockReceivedFrameData:(id)a3 peer:(id)a4 device:(id)a5;
- (void)_unregisterForWombatActivityNotification;
- (void)_update;
- (void)_updateDonState;
- (void)_wirelessCriticalChanged:(id)a3;
- (void)activate;
- (void)activityStateWithCompletion:(id)a3;
- (void)bleNearbyInfoStopConnectionToDevice:(id)a3 owner:(id)a4;
- (void)bleProximityEstimatorsResetDeviceClose;
- (void)coordinatedAlertRequestCancel:(id)a3;
- (void)coordinatedAlertRequestFinish:(id)a3;
- (void)coordinatedAlertRequestStart:(id)a3;
- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4;
- (void)deviceDiscoveryFastScanCancel:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryFastScanTrigger:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryRequestStart:(id)a3;
- (void)deviceDiscoveryRequestStop:(id)a3;
- (void)deviceDiscoveryRequestUpdate:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4 useCase:(unsigned int)a5;
- (void)diagnosticBLEModeStart:(id)a3;
- (void)diagnosticBLEModeStop:(id)a3;
- (void)diagnosticMockChanged:(id)a3;
- (void)diagnosticMockFound:(id)a3;
- (void)diagnosticMockLost:(id)a3;
- (void)idsAddCachedIDSIdentifier:(id)a3 device:(id)a4;
- (void)idsAddCachedIDSIdentifierToDevice:(id)a3;
- (void)idsDevicesAppendDescription:(id *)a3;
- (void)invalidate;
- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)nearbyDidUpdateState:(id)a3;
- (void)prefillDefaultsForGenuineCheckIfNecessary;
- (void)prefsChanged;
- (void)sendUnlockData:(id)a3 toBLEDevice:(id)a4 completion:(id)a5;
- (void)sendUnlockDataDirect:(id)a3 toBLEDevice:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)serviceReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6;
- (void)serviceSendEvent:(id)a3 service:(id)a4;
- (void)serviceSendRequest:(id)a3 service:(id)a4;
- (void)serviceSendResponse:(id)a3 service:(id)a4;
- (void)serviceStop:(id)a3;
- (void)sessionReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6;
- (void)sessionSendEvent:(id)a3 session:(id)a4;
- (void)sessionSendRequest:(id)a3 session:(id)a4;
- (void)sessionSendResponse:(id)a3 session:(id)a4;
- (void)sessionStop:(id)a3;
- (void)setAudioRoutingScore:(int)a3;
- (void)setAutoUnlockActive:(BOOL)a3;
- (void)setBoostNearbyInfo:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnhancedDiscovery:(BOOL)a3;
- (void)setHotspotInfo:(unsigned int)a3;
- (void)setPreventNearbyActionAdvertising:(BOOL)a3;
- (void)startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4;
- (void)stopUnlockBLEConnectionWithDevice:(id)a3;
- (void)testPipePing;
- (void)unlockStartTestClientWithDevice:(id)a3;
- (void)unlockStartTestServer;
- (void)unlockStopTestClient;
- (void)unlockStopTestServer;
- (void)unlockUpdateAdvertising:(unsigned int)a3 mask:(unsigned int)a4;
- (void)update;
@end

@implementation SDNearbyAgent

+ (SDNearbyAgent)sharedNearbyAgent
{
  if (qword_100657208 != -1) {
    dispatch_once(&qword_100657208, &stru_1005CFA20);
  }
  return (SDNearbyAgent *)gSFNearbyAgent;
}

- (id)sharedNearbyPipe
{
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  int v5 = SFDeviceClassCodeGet(v3, v4);
  BOOL v7 = v5 == 1 || v5 == 7;
  v2->_btPipeForced = v7;
  if (v2->_activated)
  {
    -[SDNearbyAgent _btPipeEnsureStarted](v2, "_btPipeEnsureStarted");
    v8 = v2->_unlockBtPipe;
  }

  else
  {
    if (dword_100643B70 <= 90
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sharedNearbyPipe]",  90LL,  "### Ignoring pipe start before activate\n");
    }

    v8 = 0LL;
  }

  objc_sync_exit(v2);

  return v8;
}

- (SDNearbyAgent)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDNearbyAgent;
  v2 = -[SDNearbyAgent init](&v13, "init");
  uint64_t v4 = v2;
  if (v2)
  {
    v2->_activityLevelNotifyToken = -1;
    v2->_allowEnhancedDiscovery = -1;
    v2->_caForce = -1;
    uint64_t v5 = SFMainQueue(v2, v3);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    v4->_familyNotifyToken = -1;
    v4->_idIdentitiesChangedNotifyToken = -1;
    v4->_idsAppleTVCountCache = -1;
    v4->_idsContinuityDeviceCountCache = -1;
    v4->_idsWatchCountCache = -1;
    v4->_homePodModelCodeOverride = -1;
    *(void *)&__int128 v8 = -1LL;
    *((void *)&v8 + 1) = -1LL;
    *(_OWORD *)&v4->_idsHasActiveWatchCache = v8;
    *(_OWORD *)&v4->_idsIsSignedInCache = v8;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    enhancedDiscoveryUseCases = v4->_enhancedDiscoveryUseCases;
    v4->_enhancedDiscoveryUseCases = v9;

    v4->_wombatActivityToken = -1;
    -[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary](v4, "prefillDefaultsForGenuineCheckIfNecessary");
    v11 = v4;
  }

  return v4;
}

- (NSString)description
{
  id v214 = 0LL;
  NSAppendPrintF(&v214, "-- SDNearbyAgent --\n");
  id v2 = v214;
  id v213 = v2;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t activityLevel = self->_activityLevel;
  else {
    uint64_t v5 = off_1005D0678[(char)activityLevel];
  }
  v140 = v5;
  double startTime = self->_startTime;
  if (self->_activityTimer) {
    BOOL v7 = "on";
  }
  else {
    BOOL v7 = "off";
  }
  -[SDNearbyAgent _activityMonitorLastUserEventDelta](self, "_activityMonitorLastUserEventDelta");
  uint64_t v9 = v8;
  if (self->_bleNearbyInfoAdvertiseLingerTimer) {
    v10 = "on";
  }
  else {
    v10 = "off";
  }
  p_statusMonitor = &self->_statusMonitor;
  if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")) {
    v12 = "on";
  }
  else {
    v12 = "off";
  }
  if (-[SDStatusMonitor deviceUIUnlocked](*p_statusMonitor, "deviceUIUnlocked")) {
    objc_super v13 = "unlocked";
  }
  else {
    objc_super v13 = "locked";
  }
  if (-[SDStatusMonitor smartCoverIsClosed](*p_statusMonitor, "smartCoverIsClosed")) {
    v14 = "closed";
  }
  else {
    v14 = "not closed";
  }
  if (-[SDStatusMonitor multipleUsersLoggedIn](*p_statusMonitor, "multipleUsersLoggedIn")) {
    v15 = "yes";
  }
  else {
    v15 = "no";
  }
  id v16 = (id)-[SDStatusMonitor systemUIFlags](*p_statusMonitor, "systemUIFlags");
  id v17 = -[SDStatusMonitor pairedWatchWristState](*p_statusMonitor, "pairedWatchWristState");
  uint64_t audioRoutingScore = self->_audioRoutingScore;
  else {
    v19 = off_1005CFE68[audioRoutingScore];
  }
  NSAppendPrintF( &v213,  "Up %ll{dur}, level %d (%s), timer %s, last user %.2f secs, linger %s, screen %s (%s), cover %s, multiuser %s, sysUI 0x%X, watch %d, FamF 0x%llX, ARS %s",  (unint64_t)(Current - startTime),  activityLevel,  v140,  v7,  v9,  v10,  v12,  v13,  v14,  v15,  v16,  v17,  self->_familyFlags,  v19);
  id v20 = v213;

  v21 = objc_autoreleasePoolPush();
  id v22 = objc_alloc_init(&OBJC_CLASS___CUAppleIDClient);
  id v23 = [v22 copyMyAppleIDAndReturnError:0];
  id v212 = v20;
  NSAppendPrintF(&v212, ", AID '%@'", v23);
  id v24 = v212;

  id v211 = v24;
  unsigned int v25 = [v22 securityLevel];
  if (v25 > 5) {
    v26 = "?";
  }
  else {
    v26 = off_1005CFE38[v25];
  }
  NSAppendPrintF(&v211, " (%s)", v26);
  id v27 = v211;

  objc_autoreleasePoolPop(v21);
  v28 = objc_autoreleasePoolPush();
  id v29 = -[objc_class defaultStore](off_100643BE0(), "defaultStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 activeAccount]);

  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 altDSID]);
  if (!v32)
  {
    id v210 = v27;
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v31 accountName]);
LABEL_34:
    v37 = (void *)v39;
    v38 = "Unknown";
    goto LABEL_35;
  }

  v33 = -[objc_class sharedInstance](off_100643BE8(), "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 authKitAccountWithAltDSID:v32]);
  if (!v35)
  {

    id v210 = v27;
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v31 accountName]);
    goto LABEL_34;
  }

  unsigned int v36 = [v34 securityLevelForAccount:v35];

  id v210 = v27;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v31 accountName]);
  v38 = "Unknown";
  switch(v36)
  {
    case 0u:
      break;
    case 1u:
      v38 = "PWOnly";
      break;
    case 2u:
      v38 = "SA";
      break;
    case 3u:
      v38 = "HSA1";
      break;
    case 4u:
      v38 = "HSA2";
      break;
    case 5u:
      v38 = "Managed";
      break;
    default:
      v38 = "?";
      break;
  }

- (void)prefillDefaultsForGenuineCheckIfNecessary
{
  id v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.Sharing");
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    unsigned int v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"hasDoneGenuineDeviceCheck");
    uint64_t v4 = @"NO";
    if (v3) {
      uint64_t v4 = @"YES";
    }
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  30LL,  "GenuineCheckOnLaunch: hasDoneGenuineDeviceCheck %@",  v4);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"hasDoneGenuineDeviceCheck"));

  if (!v5)
  {
    id v29 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBDiscovery devicesWithDiscoveryFlags:error:]( &OBJC_CLASS___CBDiscovery,  "devicesWithDiscoveryFlags:error:",  0x800000LL,  &v29));
    id v7 = v29;
    uint64_t v8 = v7;
    if (!v7 || v6)
    {
      id v23 = v7;
      id v24 = v6;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
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
            v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            if ([v14 deviceFlags])
            {
              if (dword_100643B70 <= 30
                && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
              {
                LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  30LL,  "GenuineCheckOnLaunch: device info %@\n",  v14);
              }

              uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 btAddressData]);
              id v16 = (void *)v15;
              if (v15)
              {
                uint64_t v17 = CUPrintNSDataAddress(v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uppercaseString]);

                id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", v19));
                if (!v20)
                {
                  if (dword_100643B70 <= 30
                    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
                  {
                    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  30LL,  "GenuineCheckOnLaunch: setting device unknown %@\n",  v19);
                  }

                  -[NSUserDefaults setObject:forKey:](v2, "setObject:forKey:", &off_1005F9BD0, v19);
                }
              }
            }

            else if (dword_100643B70 <= 30 {
                   && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
            }
            {
              LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  30LL,  "GenuineCheckOnLaunch: device does not support AACP %@\n",  v14);
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v11);
      }

      -[NSUserDefaults setBool:forKey:](v2, "setBool:forKey:", 1LL, @"hasDoneGenuineDeviceCheck");
      -[NSUserDefaults synchronize](v2, "synchronize");
      uint64_t v8 = v23;
      uint64_t v6 = v24;
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        unsigned int v21 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"hasDoneGenuineDeviceCheck");
        id v22 = @"NO";
        if (v21) {
          id v22 = @"YES";
        }
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  30LL,  "GenuineCheckOnLaunch: finished genuine check %@",  v22);
      }
    }

    else if (dword_100643B70 <= 90 {
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
    }
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]",  90LL,  "### GenuineCheckOnLaunch CBDiscovery failed %@\n",  v8);
    }
  }
}

- (void)setAudioRoutingScore:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100150550;
  v4[3] = &unk_1005CFA70;
  int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setAutoUnlockActive:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001506AC;
  v4[3] = &unk_1005CC3A8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setBoostNearbyInfo:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001507E4;
  v4[3] = &unk_1005CC3A8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setEnhancedDiscovery:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10015091C;
  v4[3] = &unk_1005CC3A8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setHotspotInfo:(unsigned int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100150AF0;
  v4[3] = &unk_1005CFA70;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100150C14;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_activated = 1;
  self->_double startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleWPNearby)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](&OBJC_CLASS___SFBLEClient, "sharedClient"));
    uint64_t v4 = (WPNearby *)objc_claimAutoreleasedReturnValue([v3 addNearbyDelegate:self]);
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;
  }

  if (!self->_btConnectedDeviceMonitor)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClient);
    btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
    self->_btConnectedDeviceMonitor = v6;

    -[CUBluetoothClient setDispatchQueue:](self->_btConnectedDeviceMonitor, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setFlags:](self->_btConnectedDeviceMonitor, "setFlags:", 24LL);
    -[CUBluetoothClient setLabel:](self->_btConnectedDeviceMonitor, "setLabel:", @"Sharing-CA");
    -[CUBluetoothClient activate](self->_btConnectedDeviceMonitor, "activate");
  }

  if (self->_familyNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10015123C;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.familyFlagsChanged", &self->_familyNotifyToken, dispatchQueue, handler);
    int familyNotifyToken = self->_familyNotifyToken;
    uint64_t state64 = 0LL;
    notify_get_state(familyNotifyToken, &state64);
    self->_familyFlags = state64;
  }

  if (!self->_statusMonitor)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"_handleAirDropDiscoverableModeChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
    [v10 addObserver:self selector:"_handleAppleIDChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v10 addObserver:self selector:"_handleAppleIDChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorMediaAccessControlSettingChanged:" name:@"com.apple.sharingd.MediaAccessControlSettingChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorWatchWristStateChanged:" name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorScreenStateChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v10 addObserver:self selector:"_activityMonitorUILockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v10 addObserver:self selector:"_unlockApproveBluetoothIDsChanged:" name:@"ApproveBluetoothIDsChanged" object:0];
    [v10 addObserver:self selector:"_systemWillSleep" name:@"com.apple.sharingd.SystemWillSleep" object:0];
    [v10 addObserver:self selector:"_systemHasPoweredOn" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
    [v10 addObserver:self selector:"_btPipeStateChanged:" name:SFNotificationNamePipeConnectionStateChanged object:0];
    [v10 addObserver:self selector:"_smartCoverStatusChanged:" name:@"com.apple.sharingd.SmartCoverClosedChanged" object:0];
    [v10 addObserver:self selector:"_wirelessCriticalChanged:" name:@"com.apple.sharingd.WirelessCriticalChanged" object:0];
    [v10 addObserver:self selector:"_mirroringStateChanged:" name:@"com.apple.sharingd.MirroringStateChanged" object:0];
    id v11 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v11;

    self->_activityScreenOn = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    self->_activityUIUnlocked = -[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked");
  }

  if (!self->_systemMonitor)
  {
    objc_super v13 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v13;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001512E4;
    v32[3] = &unk_1005CB2F8;
    v32[4] = self;
    -[CUSystemMonitor setBluetoothAddressChangedHandler:]( self->_systemMonitor,  "setBluetoothAddressChangedHandler:",  v32);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100151354;
    v31[3] = &unk_1005CB2F8;
    v31[4] = self;
    -[CUSystemMonitor setCallChangedHandler:](self->_systemMonitor, "setCallChangedHandler:", v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001513C4;
    v30[3] = &unk_1005CB2F8;
    v30[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100151434;
    v29[3] = &unk_1005CB2F8;
    v29[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001514AC;
    v28[3] = &unk_1005CB2F8;
    v28[4] = self;
    -[CUSystemMonitor setMeDeviceChangedHandler:](self->_systemMonitor, "setMeDeviceChangedHandler:", v28);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10015151C;
    v27[3] = &unk_1005CB2F8;
    v27[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v27);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100151598;
    v26[3] = &unk_1005CB2F8;
    v26[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10015161C;
    v25[3] = &unk_1005CB2F8;
    v25[4] = self;
    -[CUSystemMonitor setScreenSaverChangedHandler:](self->_systemMonitor, "setScreenSaverChangedHandler:", v25);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10015168C;
    v24[3] = &unk_1005CB2F8;
    v24[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v24);
    uint64_t v15 = self->_systemMonitor;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001516FC;
    v23[3] = &unk_1005CB2F8;
    v23[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v15, "activateWithCompletion:", v23);
  }

  -[SDNearbyAgent _idsEnsureStarted](self, "_idsEnsureStarted");
  id v16 = -[SDNearbyAgent prefsChanged](self, "prefsChanged");
  if (!self->_wifiManager)
  {
    v18 = (CUTWiFiManager *)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](&OBJC_CLASS___CUTWiFiManager, "sharedInstance"));
    wifiManager = self->_wifiManager;
    self->_wifiManager = v18;

    id v16 = -[CUTWiFiManager addDelegate:](self->_wifiManager, "addDelegate:", self);
  }

  int DeviceClass = GestaltGetDeviceClass(v16, v17);
  if ((DeviceClass == 7 || DeviceClass == 4) && !self->_systemService)
  {
    unsigned int v21 = objc_alloc_init(&OBJC_CLASS___SFSystemService);
    systemService = self->_systemService;
    self->_systemService = v21;

    -[SFSystemService setDispatchQueue:](self->_systemService, "setDispatchQueue:", self->_dispatchQueue);
    -[SFSystemService activate](self->_systemService, "activate");
  }

  -[SDNearbyAgent _registerForWombatActivityNotification](self, "_registerForWombatActivityNotification");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015183C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0LL;

  if (self->_statusMonitor)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.MediaAccessControlSettingChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v4 removeObserver:self name:@"ApproveBluetoothIDsChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SystemWillSleep" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
    [v4 removeObserver:self name:SFNotificationNamePipeConnectionStateChanged object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.SmartCoverClosedChanged" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.WirelessCriticalChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0LL;
  }

  -[CUBluetoothClient invalidate](self->_btConnectedDeviceMonitor, "invalidate");
  btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
  self->_btConnectedDeviceMonitor = 0LL;

  -[SDNearbyAgent _activityMonitorEnsureStopped](self, "_activityMonitorEnsureStopped");
  -[SDNearbyAgent _identificationEnsureStopped](self, "_identificationEnsureStopped");
  -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped](self, "_bleNearbyActionAdvertiserEnsureStopped");
  -[SDNearbyAgent _bleNearbyActionScannerEnsureStopped](self, "_bleNearbyActionScannerEnsureStopped");
  -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
  -[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped](self, "_bleNearbyInfoScannerEnsureStopped");
  -[SDNearbyAgent _bleProximityPairingScannerEnsureStopped](self, "_bleProximityPairingScannerEnsureStopped");
  id v7 = self;
  objc_sync_enter(v7);
  -[SDNearbyAgent _btPipeEnsureStopped](v7, "_btPipeEnsureStopped");
  objc_sync_exit(v7);

  int familyNotifyToken = v7->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    v7->_int familyNotifyToken = -1;
  }

  -[SDNearbyAgent _idsEnsureStopped](v7, "_idsEnsureStopped");
  -[SDNearbyAgent _unregisterForWombatActivityNotification](v7, "_unregisterForWombatActivityNotification");
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v9 = v7->_bleConnections;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)i), "invalidate", (void)v36);
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
    }

    while (v10);
  }

  -[NSMutableDictionary removeAllObjects](v7->_bleConnections, "removeAllObjects");
  bleConnections = v7->_bleConnections;
  v7->_bleConnections = 0LL;

  -[NSMutableSet removeAllObjects](v7->_bleDiagnosticModeClients, "removeAllObjects");
  bleDiagnosticModeClients = v7->_bleDiagnosticModeClients;
  v7->_bleDiagnosticModeClients = 0LL;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](&OBJC_CLASS___SFBLEClient, "sharedClient"));
  [v15 removeNearbyDelegate:v7];

  bleWPNearby = v7->_bleWPNearby;
  v7->_bleWPNearby = 0LL;

  -[NSMutableSet removeAllObjects](v7->_caRequests, "removeAllObjects");
  caRequests = v7->_caRequests;
  v7->_caRequests = 0LL;

  -[NSMutableSet removeAllObjects](v7->_ddRequests, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v7->_caRequestsNoScans, "removeAllObjects");
  caRequestsNoScans = v7->_caRequestsNoScans;
  v7->_caRequestsNoScans = 0LL;

  ddRequests = v7->_ddRequests;
  v7->_ddRequests = 0LL;

  ddFastScanTimer = v7->_ddFastScanTimer;
  if (ddFastScanTimer)
  {
    unsigned int v21 = ddFastScanTimer;
    dispatch_source_cancel(v21);
    id v22 = v7->_ddFastScanTimer;
    v7->_ddFastScanTimer = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](v7->_ddNearbyActionDevices, "removeAllObjects", (void)v36);
  ddNearbyActionDevices = v7->_ddNearbyActionDevices;
  v7->_ddNearbyActionDevices = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_ddNearbyInfoDevices, "removeAllObjects");
  ddNearbyInfoDevices = v7->_ddNearbyInfoDevices;
  v7->_ddNearbyInfoDevices = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_ddProximityPairingDevices, "removeAllObjects");
  ddProximityPairingDevices = v7->_ddProximityPairingDevices;
  v7->_ddProximityPairingDevices = 0LL;

  -[NSMutableSet removeAllObjects](v7->_deliveredDonnedIdentifiers, "removeAllObjects");
  deliveredDonnedIdentifiers = v7->_deliveredDonnedIdentifiers;
  v7->_deliveredDonnedIdentifiers = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_donnedDevices, "removeAllObjects");
  donnedDevices = v7->_donnedDevices;
  v7->_donnedDevices = 0LL;

  -[SDNearbyAgent _cancelDonStateRetryTimers](v7, "_cancelDonStateRetryTimers");
  -[NSMutableDictionary removeAllObjects](v7->_donStateRetryTimerDictionary, "removeAllObjects");
  donStateRetryTimerDictionary = v7->_donStateRetryTimerDictionary;
  v7->_donStateRetryTimerDictionary = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_services, "removeAllObjects");
  services = v7->_services;
  v7->_services = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_sessions, "removeAllObjects");
  sessions = v7->_sessions;
  v7->_sessions = 0LL;

  -[NSMutableDictionary removeAllObjects](v7->_setupSessions, "removeAllObjects");
  setupSessions = v7->_setupSessions;
  v7->_setupSessions = 0LL;

  -[SFSystemService invalidate](v7->_systemService, "invalidate");
  systemService = v7->_systemService;
  v7->_systemService = 0LL;

  unlockTestClientTimer = v7->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    v34 = unlockTestClientTimer;
    dispatch_source_cancel(v34);
    v35 = v7->_unlockTestClientTimer;
    v7->_unlockTestClientTimer = 0LL;
  }

- (void)_handleAirDropDiscoverableModeChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151E00;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAppleIDChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151EE0;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)prefsChanged
{
  int v168 = 0;
  uint64_t v169 = 0LL;
  uint64_t v167 = 0LL;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"activityPollSeconds", &v168);
  uint64_t v4 = 5LL;
  if (!v168) {
    uint64_t v4 = Int64;
  }
  uint64_t v5 = 1000LL;
  if (v4 < 1000) {
    uint64_t v5 = v4;
  }
  if (v5 <= 1) {
    LODWORD(v5) = 1;
  }
  if (v4 < 0) {
    int v6 = -1;
  }
  else {
    int v6 = v5;
  }
  int activityPollSeconds = self->_activityPollSeconds;
  if (v6 != activityPollSeconds)
  {
    if (dword_100643B70 <= 40)
    {
      if (dword_100643B70 == -1)
      {
        int activityPollSeconds = self->_activityPollSeconds;
      }

      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent prefsChanged]",  40LL,  "Activity poll seconds: %d -> %d\n",  activityPollSeconds,  v6);
    }

- (void)update
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153584;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (self->_activated)
  {
    BOOL bleNearbyInfoAdvertiseAlways = self->_bleNearbyInfoAdvertiseAlways;
    if (!self->_caEnabled) {
      goto LABEL_11;
    }
    if (self->_caSingleDevice) {
      goto LABEL_12;
    }
    if (-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn"))
    {
      int v4 = -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount");
      if (!bleNearbyInfoAdvertiseAlways && v4 <= 0) {
        goto LABEL_7;
      }
    }

    else
    {
LABEL_11:
      if (!bleNearbyInfoAdvertiseAlways)
      {
LABEL_7:
        -[SDNearbyAgent _activityMonitorEnsureStopped](self, "_activityMonitorEnsureStopped");
        int v5 = 0;
LABEL_13:
        if (self->_idEnabled) {
          -[SDNearbyAgent _identificationEnsureStarted](self, "_identificationEnsureStarted");
        }
        else {
          -[SDNearbyAgent _identificationEnsureStopped](self, "_identificationEnsureStopped");
        }
        if (-[SDNearbyAgent _bleNearbyActionAdvertiserShouldAdvertise]( self,  "_bleNearbyActionAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted](self, "_bleNearbyActionAdvertiserEnsureStarted");
        }

        else
        {
          -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped](self, "_bleNearbyActionAdvertiserEnsureStopped");
        }

        if (-[SDNearbyAgent _bleNearbyActionScannerShouldScan](self, "_bleNearbyActionScannerShouldScan")) {
          -[SDNearbyAgent _bleNearbyActionScannerEnsureStarted](self, "_bleNearbyActionScannerEnsureStarted");
        }
        else {
          -[SDNearbyAgent _bleNearbyActionScannerEnsureStopped](self, "_bleNearbyActionScannerEnsureStopped");
        }
        if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise")
          || -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerIfNeeded](self, "_bleNearbyInfoAdvertiserLingerIfNeeded"))
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted](self, "_bleNearbyInfoAdvertiserEnsureStarted");
        }

        else
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
        }

        if (-[SDNearbyAgent _bleNearbyInfoScannerShouldScan](self, "_bleNearbyInfoScannerShouldScan")) {
          -[SDNearbyAgent _bleNearbyInfoScannerEnsureStarted](self, "_bleNearbyInfoScannerEnsureStarted");
        }
        else {
          -[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped](self, "_bleNearbyInfoScannerEnsureStopped");
        }
        if (-[SDNearbyAgent _bleProximityPairingScannerShouldScan](self, "_bleProximityPairingScannerShouldScan")) {
          -[SDNearbyAgent _bleProximityPairingScannerEnsureStarted](self, "_bleProximityPairingScannerEnsureStarted");
        }
        else {
          -[SDNearbyAgent _bleProximityPairingScannerEnsureStopped](self, "_bleProximityPairingScannerEnsureStopped");
        }
        int v6 = self;
        objc_sync_enter(v6);
        if (v6->_btPipeEnabled || v6->_btPipeForced) {
          -[SDNearbyAgent _btPipeEnsureStarted](v6, "_btPipeEnsureStarted");
        }
        else {
          -[SDNearbyAgent _btPipeEnsureStopped](v6, "_btPipeEnsureStopped");
        }
        objc_sync_exit(v6);

        if (v5)
        {
          -[SDNearbyAgent _activityMonitorUpdate](v6, "_activityMonitorUpdate");
        }

        else if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise]( v6,  "_bleNearbyInfoAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate](v6, "_bleNearbyInfoAdvertiserUpdate");
        }

        return;
      }
    }

- (id)_useCasesToHexString:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((v6 & 1) != 0)
        {
          uint64_t v9 = ", 0x%x";
        }

        else
        {
          char v6 = 1;
          uint64_t v9 = "0x%x";
        }

        NSAppendPrintF(&v17, v9, [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) unsignedIntValue]);
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v5);
  }

  int v10 = v17;
  if (!v17) {
    int v10 = &stru_1005E3958;
  }
  int v11 = v10;

  return v11;
}

- (void)_activityMonitorEnsureStarted
{
  if (!self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_activityMonitorCarPlayStatusChanged:" name:@"com.apple.sharingd.CarPlayStatusChanged" object:0];
  }

  if (!self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 1;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_activityMonitorMultipleUsersLoggedInChanged:" name:@"com.apple.sharingd.MultipleUsersLoggedInChanged" object:0];
  }

  int activityLevelNotifyToken = self->_activityLevelNotifyToken;
  p_int activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  *((_BYTE *)p_activityLevelNotifyToken + 5) = 1;
  if (activityLevelNotifyToken == -1) {
    notify_register_check("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken);
  }
}

- (void)_activityMonitorEnsureStopped
{
  if (self->_activityMonitorStarted) {
    *(_WORD *)&self->_uint64_t activityLevel = 0;
  }
  int activityLevelNotifyToken = self->_activityLevelNotifyToken;
  if (activityLevelNotifyToken != -1)
  {
    notify_set_state(activityLevelNotifyToken, self->_activityLevel);
    notify_post("com.apple.sharing.activity-level-changed");
    notify_cancel(self->_activityLevelNotifyToken);
    self->_int activityLevelNotifyToken = -1;
  }

  if (self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 0;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:@"com.apple.sharingd.CarPlayStatusChanged" object:0];
  }

  if (self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 removeObserver:self name:@"com.apple.sharingd.MultipleUsersLoggedInChanged" object:0];
  }

  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    uint64_t v8 = activityTimer;
    dispatch_source_cancel(v8);
    uint64_t v7 = self->_activityTimer;
    self->_activityTimer = 0LL;
  }

- (void)_activityMonitorUpdate
{
  char v15 = 0;
  -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:]( self,  "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:",  &v15,  0LL);
  activityTimer = self->_activityTimer;
  if (v15)
  {
    if (!activityTimer && self->_activityPollSeconds >= 1)
    {
      id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      id v5 = self->_activityTimer;
      self->_activityTimer = v4;

      uint64_t v7 = self->_activityTimer;
      if (!v7)
      {
        uint64_t v13 = FatalErrorF("Create activity timer failed", v6);
        sub_100153C34(v13);
        return;
      }

      unint64_t v8 = 1000000000LL * self->_activityPollSeconds;
      dispatch_time_t v9 = dispatch_time(0LL, v8);
      dispatch_source_set_timer((dispatch_source_t)v7, v9, v8, v8 >> 2);
      int v10 = self->_activityTimer;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100153C34;
      v14[3] = &unk_1005CB2F8;
      v14[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v10, v14);
      dispatch_resume((dispatch_object_t)self->_activityTimer);
    }
  }

  else if (activityTimer)
  {
    int v11 = activityTimer;
    dispatch_source_cancel(v11);
    uint64_t v12 = self->_activityTimer;
    self->_activityTimer = 0LL;
  }

  if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise"))
  {
    -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted](self, "_bleNearbyInfoAdvertiserEnsureStarted");
    -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate](self, "_bleNearbyInfoAdvertiserUpdate");
  }

  else
  {
    -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
  }

- (unsigned)_activityMonitorCurrentLevelAndNeedsPoll:(BOOL *)a3 recentUserActivity:(BOOL *)a4
{
  double v8 = v7;
  if (!self->_activityMonitorStarted
    || -[SDStatusMonitor multipleUsersLoggedIn](self->_statusMonitor, "multipleUsersLoggedIn"))
  {
    uint64_t v9 = 0LL;
    BOOL v10 = 0;
    unsigned __int8 v11 = 1;
    goto LABEL_17;
  }

  if ((int)-[CUSystemMonitor activeCallCount](self->_systemMonitor, "activeCallCount") >= 1
    && (!SFDeviceIsRealityDevice()
     || -[SDStatusMonitor deviceKeyBagUnlockedAndScreenOn](self->_statusMonitor, "deviceKeyBagUnlockedAndScreenOn")))
  {
    BOOL v10 = 0;
    unsigned __int8 v11 = 14;
LABEL_16:
    uint64_t v9 = 1LL;
    goto LABEL_17;
  }

  if (-[SDStatusMonitor carplayConnected](self->_statusMonitor, "carplayConnected"))
  {
    BOOL v10 = 0;
    unsigned __int8 v11 = 13;
    goto LABEL_16;
  }

  if (-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (v8 <= (double)self->_activityRecentSeconds)
    {
      unsigned __int8 v11 = 11;
      goto LABEL_34;
    }

    int64_t v12 = -[SDStatusMonitor pairedWatchWristState](self->_statusMonitor, "pairedWatchWristState");
    if (v12 == 3)
    {
      unsigned __int8 v11 = 10;
LABEL_34:
      uint64_t v9 = 1LL;
      BOOL v10 = 1;
      goto LABEL_17;
    }

    if (SFDeviceClassCodeGet(v12, v13) == 3
      && -[SDStatusMonitor smartCoverIsClosed](self->_statusMonitor, "smartCoverIsClosed"))
    {
      goto LABEL_42;
    }

    BOOL v20 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    if (v20)
    {
      uint64_t v9 = 0LL;
      BOOL v10 = 1;
      unsigned __int8 v11 = 7;
    }

    else
    {
      uint64_t v9 = 0LL;
      BOOL v10 = 0;
      else {
        unsigned __int8 v11 = 3;
      }
    }
  }

  else
  {
    int64_t v14 = -[SDStatusMonitor pairedWatchWristState](self->_statusMonitor, "pairedWatchWristState");
    if (v14 == 3)
    {
      BOOL v10 = 0;
      unsigned __int8 v11 = 10;
      goto LABEL_16;
    }

    if (SFDeviceClassCodeGet(v14, v15) == 3
      && -[SDStatusMonitor smartCoverIsClosed](self->_statusMonitor, "smartCoverIsClosed"))
    {
LABEL_42:
      uint64_t v9 = 0LL;
      BOOL v10 = 0;
      unsigned __int8 v11 = 2;
      goto LABEL_17;
    }

    uint64_t v9 = 0LL;
    BOOL v10 = 0;
    if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")) {
      unsigned __int8 v11 = 7;
    }
    else {
      unsigned __int8 v11 = 3;
    }
  }

- (void)_activityMonitorCarPlayStatusChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153F4C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (double)_activityMonitorLastUserEventDelta
{
  double v2 = CACurrentMediaTime();
  return v2 - BKSHIDServicesLastUserEventTime();
}

- (void)_activityMonitorMultipleUsersLoggedInChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154094;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorScreenStateChanged:(id)a3
{
  unsigned __int8 v4 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn", a3);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001541CC;
  v6[3] = &unk_1005CC3A8;
  v6[4] = self;
  unsigned __int8 v7 = v4;
  dispatch_async(dispatchQueue, v6);
}

- (void)_activityMonitorUILockStatusChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154270;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorUpdateUserActive:(BOOL)a3
{
  if (self->_activityUserActive != a3)
  {
    self->_activityUserActive = a3;
    if (!a3 && self->_bleNearbyInfoAdvertiseLingerSecs > 0.0) {
      -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:]( self,  "_bleNearbyInfoAdvertiserLingerStart:",  @"UserActive");
    }
  }

- (void)_activityMonitorMediaAccessControlSettingChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001543D4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorWatchWristStateChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001544DC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)activityStateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100154610;
  v7[3] = &unk_1005CB830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_bleNearbyActionAdvertiserEnsureStarted
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id v4 = self->_services;
  id v75 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v80,  v86,  16LL);
  if (!v75)
  {

    unsigned __int8 v7 = 0LL;
    BOOL v56 = 0LL;
    BOOL v42 = 0LL;
    goto LABEL_145;
  }

  uint64_t v65 = v3;
  uint64_t v77 = 0LL;
  uint64_t v78 = 0LL;
  unsigned __int8 v5 = 0;
  int v6 = 0;
  id v73 = 0LL;
  unsigned __int8 v7 = 0LL;
  unsigned __int8 v70 = 0;
  unsigned __int8 v72 = 0;
  id v8 = 0LL;
  uint64_t v9 = 0LL;
  unsigned __int8 v71 = SFDeviceColorCodeUnknown;
  uint64_t v74 = *(void *)v81;
  char v76 = 1;
  uint64_t v67 = self;
  obj = v4;
LABEL_3:
  uint64_t v10 = 0LL;
  while (2)
  {
    if (*(void *)v81 != v74) {
      objc_enumerationMutation(obj);
    }
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_services,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v80 + 1) + 8 * v10)));
    id v12 = [v11 deviceActionType];
    unsigned __int8 v13 = v12;
    int v14 = 990;
    switch((int)v12)
    {
      case 0:
        goto LABEL_45;
      case 1:
        if ((SFIsDeviceAudioAccessory(v12) & 1) != 0) {
          goto LABEL_101;
        }
        int v14 = 680;
LABEL_41:
        if (v14 >= v6) {
          unsigned __int8 v5 = v13;
        }
        if (v14 > v6) {
          int v6 = v14;
        }
LABEL_45:
        if ((!-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn")
           || -[CUSystemMonitor screenSaverActive](self->_systemMonitor, "screenSaverActive"))
          && ![v11 overrideScreenOff])
        {
          goto LABEL_101;
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 authTagOverride]);
        __int128 v16 = v15;
        if (v15)
        {
          uint64_t v17 = v8;
          uint64_t v18 = v15;

          unsigned __int8 v7 = v18;
          id v8 = v17;
        }

        int v19 = v78;
        unsigned __int16 v20 = (unsigned __int16)[v11 sessionFlags];
        char v21 = v20;
        if ((v20 & 0x200) != 0)
        {
          if ((id)-[SDStatusMonitor mediaAccessControlSetting](self->_statusMonitor, "mediaAccessControlSetting") == (id)1) {
            int v22 = 24;
          }
          else {
            int v22 = 16;
          }
          v19 |= v22;
        }

        LODWORD(v78) = v19;
        unint64_t v23 = (unint64_t)[v11 problemFlags];
        if (!v8)
        {
          if ([v11 deviceActionType] == 8)
          {
            int v24 = v9;
            __int128 v25 = v7;
            id v26 = objc_claimAutoreleasedReturnValue([v11 requestSSID]);
            id v8 = (const char *)[v26 UTF8String];

            if (v8)
            {
              *(_OWORD *)md = 0u;
              __int128 v85 = 0u;
              CC_LONG v27 = strlen(v8);
              CC_SHA256(v8, v27, md);
              id v8 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", md, 3LL);
            }

            unsigned __int8 v7 = v25;
            uint64_t v9 = v24;
            self = v67;
          }

          else
          {
            id v8 = 0LL;
          }
        }

        HIDWORD(v78) |= (v21 & 0x80) >> 7;
        if ((v76 & 1) == 0)
        {
          char v76 = 0;
          goto LABEL_99;
        }

        if ([v11 deviceActionType] != 51)
        {
          char v76 = 1;
          goto LABEL_99;
        }

        v68 = v8;
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);
        if (v28)
        {
          id v29 = (void *)v28;
          v30 = v9;
          uint64_t v31 = v7;
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);
          id v33 = [v32 length];

          if (v33 == (id)3)
          {
            unsigned __int8 v7 = v31;
            uint64_t v9 = v30;
            self = v67;
            if (!v9)
            {
              uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);
              HIDWORD(v78) |= 4u;
            }
          }

          else
          {
            unsigned __int8 v7 = v31;
            uint64_t v9 = v30;
            self = v67;
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);

        if (v34)
        {
          if (!v9 || (uint64_t v35 = objc_claimAutoreleasedReturnValue([v11 targetAuthTag])) == 0)
          {
            char v76 = 1;
            goto LABEL_88;
          }

          uint64_t v36 = (void *)v35;
          BOOL v66 = v7;
          BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);
          unsigned __int8 v38 = [v9 isEqual:v37];

          if ((v38 & 1) != 0)
          {
            char v76 = 1;
            unsigned __int8 v7 = v66;
            self = v67;
LABEL_88:
            id v8 = v68;
            goto LABEL_99;
          }

          unsigned __int8 v7 = v66;
          self = v67;
          id v8 = v68;
          if (dword_100643B70 <= 40
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
          {
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v11 targetAuthTag]);
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]",  40LL,  "Avoid setting target auth tag as there is more than one to set {%@, %@}",  v9,  v39);

            id v8 = v68;
          }
        }

        else
        {
          id v8 = v68;
          if (dword_100643B70 <= 40
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]",  40LL,  "Avoid setting target auth tag as there is a service with no target auth tag");
          }
        }

        char v76 = 0;
        uint64_t v9 = 0LL;
        HIDWORD(v78) &= ~4u;
LABEL_99:
        v77 |= v23;
        id v40 = [v11 deviceActionType];
        if ((_DWORD)v40 == 84)
        {
          unsigned __int8 v70 = SFDeviceClassCodeGet(v40, v41);
          unsigned __int8 v72 = SFDeviceModelCodeGet();
          unsigned __int8 v71 = SFDeviceColorCodeGet();
        }

- (void)_bleNearbyActionAdvertiserEnsureStopped
{
  self->_bleDiagnosticAdvSuppressLogged = 0;
  self->_bleNearbyActionAdvertiseActive = 0;
  if (self->_bleNearbyActionAdvertiser
    && dword_100643B70 <= 30
    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped]",  30LL,  "BLE NearbyAction advertiser stop\n");
  }

  -[SFBLEAdvertiser invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0LL;

  bleNearbyActionAdvertiseLingerTimer = self->_bleNearbyActionAdvertiseLingerTimer;
  if (bleNearbyActionAdvertiseLingerTimer)
  {
    int v6 = bleNearbyActionAdvertiseLingerTimer;
    dispatch_source_cancel(v6);
    unsigned __int8 v5 = self->_bleNearbyActionAdvertiseLingerTimer;
    self->_bleNearbyActionAdvertiseLingerTimer = 0LL;
  }

- (BOOL)_bleNearbyActionAdvertiserShouldAdvertise
{
  return !-[NSMutableSet count](self->_bleDiagnosticModeClients, "count")
      && !self->_bleNearbyActionAdvertiseDisabled
      && !self->_preventNearbyActionAdvertising;
}

- (void)_bleNearbyActionScannerEnsureStarted
{
  bleNearbyActionScanner = self->_bleNearbyActionScanner;
  if (bleNearbyActionScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleNearbyActionScanner, 16LL);
  }

  else
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyActionScannerEnsureStarted]",  30LL,  "BLE NearbyAction scanner start\n");
    }

    id v4 = -[SFBLEScanner initWithType:](objc_alloc(&OBJC_CLASS___SFBLEScanner), "initWithType:", 15LL);
    unsigned __int8 v5 = self->_bleNearbyActionScanner;
    self->_bleNearbyActionScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleNearbyActionScanner, "setDispatchQueue:", self->_dispatchQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100155750;
    v9[3] = &unk_1005CB958;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleNearbyActionScanner, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100155844;
    v8[3] = &unk_1005CB958;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleNearbyActionScanner, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100155904;
    v7[3] = &unk_1005CB9C0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleNearbyActionScanner, "setDeviceChangedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001559A8;
    v6[3] = &unk_1005CBB40;
    v6[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleNearbyActionScanner, "setScanStateChangedHandler:", v6);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:]( self,  "_bleUpdateScanner:typeFlag:",  self->_bleNearbyActionScanner,  16LL);
    if (self->_bleNearbyActionRSSILog) {
      -[SFBLEScanner setRssiLog:](self->_bleNearbyActionScanner, "setRssiLog:", 1LL);
    }
    -[SFBLEScanner activateWithCompletion:](self->_bleNearbyActionScanner, "activateWithCompletion:", &stru_1005CFAB0);
  }

- (void)_bleNearbyActionScannerEnsureStopped
{
  if (self->_bleNearbyActionScanner
    && dword_100643B70 <= 30
    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyActionScannerEnsureStopped]",  30LL,  "BLE NearbyAction scanner stop\n");
  }

  -[SFBLEScanner invalidate](self->_bleNearbyActionScanner, "invalidate");
  bleNearbyActionScanner = self->_bleNearbyActionScanner;
  self->_bleNearbyActionScanner = 0LL;

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleNearbyActionDevices, "allKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleNearbyActionDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i)));
        if (v9) {
          -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 15LL);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_bleNearbyActionDevices, "removeAllObjects");
  bleNearbyActionDevices = self->_bleNearbyActionDevices;
  self->_bleNearbyActionDevices = 0LL;
}

- (BOOL)_bleNearbyActionScannerShouldScan
{
  if (self->_bleNearbyActionScanNever || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count")) {
    return 0;
  }
  if (self->_bleNearbyActionScanAlways) {
    return 1;
  }
  if (!self->_ddNearbyActionEnabled) {
    return 0;
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = self->_ddRequests;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (!v5)
  {
LABEL_21:

    return 0;
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_10:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (void)v12) & 0x10) == 0
      || !self->_activityScreenOn && ![v9 overrideScreenOff])
    {
      goto LABEL_19;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceFilter]);
    __int128 v11 = v10;
    if (!v10 || [v10 count]) {
      break;
    }

LABEL_19:
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  if (!self->_ddNearbyActionScreenOff && -[SDNearbyAgent _idsAppleTVCount](self, "_idsAppleTVCount") <= 0) {
    return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
  }
  return 1;
}

- (void)_bleNearbyInfoAdvertiserEnsureStarted
{
  if (self->_bleNearbyInfoAdvertiser)
  {
    if (self->_bleNearbyInfoAdvertiseReasonChanged)
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted]",  30LL,  "BLE NearbyInfo advertiser advertising for reason: %@",  self->_bleNearbyInfoAdvertiseReason);
      }

      self->_bleNearbyInfoAdvertiseReasonChanged = 0;
    }
  }

  else
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted]",  30LL,  "BLE NearbyInfo advertiser created. Reason: %@\n",  self->_bleNearbyInfoAdvertiseReason);
    }

    id v3 = -[SFBLEAdvertiser initWithType:](objc_alloc(&OBJC_CLASS___SFBLEAdvertiser), "initWithType:", 16LL);
    bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
    self->_bleNearbyInfoAdvertiser = v3;

    -[SFBLEAdvertiser setDispatchQueue:](self->_bleNearbyInfoAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  }

- (void)_bleNearbyInfoAdvertiserEnsureStopped
{
  if (self->_bleNearbyInfoAdvertiser
    && dword_100643B70 <= 30
    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped]",  30LL,  "BLE NearbyInfo advertiser stop. Reason: %@\n",  self->_bleNearbyInfoAdvertiseReason);
  }

  -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", @"StopNearbyInfo");
  -[SFBLEAdvertiser invalidate](self->_bleNearbyInfoAdvertiser, "invalidate");
  bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
  self->_bleNearbyInfoAdvertiser = 0LL;

  self->_bleNearbyInfoAdvertised = 0;
  bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
  if (bleNearbyInfoAdvertiseLingerTimer)
  {
    id v6 = bleNearbyInfoAdvertiseLingerTimer;
    dispatch_source_cancel(v6);
    id v5 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = 0LL;
  }

- (BOOL)_bleNearbyInfoAdvertiserShouldAdvertise
{
  if (!-[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
  {
    if (self->_bleNearbyInfoAdvertiseDisabled)
    {
      id v4 = @"_bleNearbyInfoAdvertiseDisabled";
      goto LABEL_7;
    }

    if (self->_autoUnlockActive)
    {
      id v4 = @"_autoUnlockActive";
      goto LABEL_7;
    }

    if (self->_bleNearbyInfoAdvertiseAlways)
    {
      uint64_t v7 = @"_bleNearbyInfoAdvertiseAlways set";
LABEL_26:
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:]( self,  "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:",  v7);
      return 1;
    }

    if (self->_bleNearbyInfoAdvertiseLingerTimer)
    {
      uint64_t v7 = @"_bleNearbyInfoAdvertiseLingerTimer";
      goto LABEL_26;
    }

    if (self->_unlockAdvertiseAlways)
    {
      uint64_t v7 = @"_unlockAdvertiseAlways";
      goto LABEL_26;
    }

    if (self->_unlockAdvertiseEnabled)
    {
      uint64_t v7 = @"_unlockAdvertiseEnabled";
      goto LABEL_26;
    }

    if (self->_unlockAdvertiseWatch)
    {
      uint64_t v7 = @"_unlockAdvertiseWatch";
      goto LABEL_26;
    }

    if (self->_unlockAdvertiseWatchLocked)
    {
      uint64_t v7 = @"_unlockAdvertiseWatchLocked";
      goto LABEL_26;
    }

    if ((self->_familyFlags & 2) != 0)
    {
      uint64_t v7 = @"familyFlags set";
      goto LABEL_26;
    }

    int DeviceClass = GestaltGetDeviceClass(0LL, v3);
    if (DeviceClass == 7 || DeviceClass == 4)
    {
      uint64_t v7 = @"device is communal";
      goto LABEL_26;
    }

    unsigned int v9 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    unsigned __int8 v10 = -[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags");
    if (v9 && (v10 & 8) != 0)
    {
      uint64_t v7 = @"ShareAudio is ongoing while screen on";
      goto LABEL_26;
    }

    if (!-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn"))
    {
      id v4 = @"Not signed into iCloud";
      goto LABEL_7;
    }

    if (-[SDStatusMonitor iCloudSharedPhotoLibraryEnabled](self->_statusMonitor, "iCloudSharedPhotoLibraryEnabled"))
    {
      uint64_t v7 = @"Shared iCloud Photo Library is enabled";
      goto LABEL_26;
    }

    if (self->_coreDeviceEnabled)
    {
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned int v12 = [v11 supportsXcodePairing];

      if (v12)
      {
        uint64_t v7 = @"CoreDeviceEnabled";
        goto LABEL_26;
      }
    }

    if (self->_fitnessPairingEnabled)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      unsigned int v14 = [v13 supportsFitnessPlusPairing];

      if (v14)
      {
        uint64_t v7 = @"FitnessPairingEnabled";
        goto LABEL_26;
      }
    }

    if (self->_sessionPairingEnabled)
    {
      uint64_t v7 = @"SessionPairingEnabled";
      goto LABEL_26;
    }

    if (-[SDNearbyAgent _idsShouldAdvertiseNearbyInfo](self, "_idsShouldAdvertiseNearbyInfo"))
    {
      uint64_t v7 = @"Same account devices";
      goto LABEL_26;
    }

    if (v9)
    {
      uint64_t v7 = @"Screen on";
      goto LABEL_26;
    }

    uint64_t v25 = 0LL;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 0;
    uint64_t v19 = 0LL;
    unsigned __int16 v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    int v22 = sub_1001563B4;
    unint64_t v23 = sub_1001563C4;
    id v24 = 0LL;
    services = self->_services;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001563CC;
    v18[3] = &unk_1005CFAD8;
    v18[4] = &v19;
    v18[5] = &v25;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v18);
    if (*((_BYTE *)v26 + 24))
    {
      __int128 v16 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SFServiceType %s active",  sub_10015643C((int)[(id)v20[5] serviceType]));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:]( self,  "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:",  v17);
    }

    else
    {
      if (!self->_caEnabled
        || !self->_activityUserActive
        || !self->_caSingleDevice && -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount") < 1)
      {
        -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:]( self,  "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:",  @"Don't advertise by default");
        BOOL v5 = 0;
        goto LABEL_55;
      }

      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:]( self,  "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:",  @"caEnabled");
    }

    BOOL v5 = 1;
LABEL_55:
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
    return v5;
  }

  id v4 = @"_bleDiagnosticModeClients.count > 0";
LABEL_7:
  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:]( self,  "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:",  v4);
  return 0;
}

- (void)_bleNearbyInfoAdvertiserUpdate
{
  if (!self->_bleNearbyInfoAdvertiser) {
    return;
  }
  if (dword_100643B70 <= 9 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 9LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate]",  9LL,  "BLE NearbyInfo advertiser update\n");
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:]( self,  "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:",  0LL,  0LL);
  if (-[SDNearbyAgent _idsShouldEncryptActivityLevel](self, "_idsShouldEncryptActivityLevel") >= 1) {
    uint64_t v4 = -[SDNearbyAgent _bleEncryptActivityLevel:](self, "_bleEncryptActivityLevel:", v4);
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v4));
  [v3 setObject:v5 forKeyedSubscript:@"al"];

  if (-[SDStatusMonitor screenStateSupportsAirDrop](self->_statusMonitor, "screenStateSupportsAirDrop")
    && -[SDStatusMonitor currentConsoleUser](self->_statusMonitor, "currentConsoleUser")
    && -[SDStatusMonitor discoverableLevel](self->_statusMonitor, "discoverableLevel")
    && -[SDStatusMonitor wirelessEnabled](self->_statusMonitor, "wirelessEnabled")
    && !-[SDStatusMonitor isWifiPersonalHotspot](self->_statusMonitor, "isWifiPersonalHotspot"))
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"adU"];
    self->_bleNearbyInfoAirDropUsable = 1;
  }

  else
  {
    if (self->_bleNearbyInfoAirDropUsable) {
      -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:]( self,  "_bleNearbyInfoAdvertiserLingerStart:",  @"AirDropUsable");
    }
    self->_bleNearbyInfoAirDropUsable = 0;
  }

  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:]( self,  "_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:",  v3);
  if (!self->_bleNearbyActionAdvertiseActive)
  {
    -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
    bleAuthTagOverride = self->_bleAuthTagOverride;
    if (bleAuthTagOverride || (bleAuthTagOverride = self->_bleAuthTag) != 0LL) {
      [v3 setObject:bleAuthTagOverride forKeyedSubscript:@"at"];
    }
  }

  if (self->_enhancedDiscoveryAdvActive) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enD"];
  }
  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:]( self,  "_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:",  v3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForLEPipe](self, "_idsBluetoothDeviceIDsForLEPipe"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SFBLEAdvertiser lePipeDevices](self->_bleNearbyInfoAdvertiser, "lePipeDevices"));
  id v9 = v7;
  unsigned __int8 v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_29;
  }

  if ((v9 != 0LL) == (v8 == 0LL))
  {

    goto LABEL_28;
  }

  unsigned __int8 v11 = [v8 isEqual:v9];

  if ((v11 & 1) == 0) {
LABEL_28:
  }
    -[SFBLEAdvertiser setLePipeDevices:](self->_bleNearbyInfoAdvertiser, "setLePipeDevices:", v10);
LABEL_29:
  BOOL v42 = v10;
  if (self->_inDiscoverySession) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"iLagS"];
  }
  uint64_t v43 = v3;
  BOOL unlockAdvertiseEnabled = self->_unlockAdvertiseEnabled;
  BOOL unlockAdvertiseWatch = self->_unlockAdvertiseWatch;
  BOOL unlockAdvertiseWatchLocked = self->_unlockAdvertiseWatchLocked;
  int v15 = byte_100669395;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v16 = self->_services;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v45,  v49,  16LL);
  int v18 = unlockAdvertiseEnabled;
  int v19 = unlockAdvertiseWatch;
  int v44 = unlockAdvertiseWatchLocked;
  int v20 = v15 != 0;
  if (v17)
  {
    id v21 = v17;
    uint64_t v22 = 0LL;
    uint64_t v23 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_services,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v45 + 1) + 8LL * (void)i)));
        if (([v25 needsAWDL] & 1) == 0
          && ([v25 needsKeyboard] & 1) == 0
          && ([v25 needsSetup] & 1) == 0)
        {
          v18 |= [v25 autoUnlockEnabled];
          v19 |= [v25 autoUnlockWatch];
          v20 |= [v25 duetSync];
          v44 |= [v25 watchLocked];
        }
      }

      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v45,  v49,  16LL);
    }

    while (v21);
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  id v26 = v43;
  if ((v18 & 1) != 0) {
    [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ue"];
  }
  if ((v19 & 1) != 0) {
    [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:@"uw"];
  }
  if ((v44 & 1) != 0) {
    [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:@"wl"];
  }
  if ((v20 & 1) != 0) {
    [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ds"];
  }
  if (self->_bleNearbyInfoWiFiP2P)
  {
    unsigned int v27 = -[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable");
    int v28 = -[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState");
    unsigned int v29 = -[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags");
    if (_os_feature_enabled_impl("Sharing", "IgnoreWiFiP2PHostAPCheck"))
    {
      if (dword_100643B70 <= 30)
      {
        id v26 = v43;
        if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)) {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate]",  30LL,  "Ignoring host AP check for advertising WiFiP2P bit\n");
        }
        int v30 = 0;
        if (!v28) {
          goto LABEL_74;
        }
        goto LABEL_67;
      }

      int v30 = 0;
    }

    else
    {
      int v30 = (v29 >> 5) & 1;
    }

    id v26 = v43;
    if (!v28) {
      goto LABEL_74;
    }
LABEL_67:
    if (v28 != 10 && (v30 & 1) == 0)
    {
      unsigned int v31 = self->_bleNearbyActionScanner ? v27 : 0;
      if (v31 == 1)
      {
        [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:@"wp"];
        goto LABEL_101;
      }
    }

- (void)_bleNearbyInfoAdvertiserUpdateAdvertiseReason:(id)a3
{
  BOOL v5 = (NSString *)a3;
  if (self->_bleNearbyInfoAdvertiseReason != v5)
  {
    self->_bleNearbyInfoAdvertiseReasonChanged = 1;
    id v6 = v5;
    objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseReason, a3);
    BOOL v5 = v6;
  }
}

- (BOOL)_bleNearbyInfoAdvertiserShouldAddField3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
  if ([v3 isAdvertising])
  {
    bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;

    if (bleNearbyActionAdvertiser) {
      return 0;
    }
  }

  else
  {
  }

  return 1;
}

- (void)_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:(id)a3
{
  id v4 = a3;
  unsigned int audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAddField3](self, "_bleNearbyInfoAdvertiserShouldAddField3"))
    {
      p_bleAudioRoutingScoreEncryptedData = &self->_bleAudioRoutingScoreEncryptedData;
      uint64_t v7 = self->_bleAudioRoutingScoreEncryptedData;
      if (v7)
      {
LABEL_4:
        [v4 setObject:v7 forKeyedSubscript:@"ars"];

        goto LABEL_17;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
      if ([v8 length])
      {
        -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
        id v9 = self->_bleAuthTag;
        if (-[NSData length](v9, "length"))
        {
          memset(v17, 0, sizeof(v17));
          uint64_t v10 = kCryptoHashDescriptor_SHA512;
          id v11 = v8;
          id v12 = [v11 bytes];
          id v13 = [v11 length];
          unsigned int v14 = v9;
          CryptoHKDF( v10,  v12,  v13,  -[NSData bytes](v14, "bytes"),  -[NSData length](v14, "length"),  "BLEAdvKeyAudioRoutingScoreInfo",  30LL,  32LL,  v17);
          char v16 = audioRoutingScore & 7;
          ccchacha20(v17, &unk_1004CB4D3, 0LL, 1LL, &v16, &v16);
          uint64_t v7 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( &OBJC_CLASS___NSData,  "_newZeroingDataWithBytes:length:",  &v16,  1LL);
          objc_storeStrong((id *)p_bleAudioRoutingScoreEncryptedData, v7);
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            int v15 = sub_100150060(audioRoutingScore);
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:]",  30LL,  "Updated audio routing score: %s <%@>\n",  v15,  v7);
          }

          goto LABEL_4;
        }
      }

      goto LABEL_17;
    }

    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:]",  30LL,  "Skip adding field3 to NearbyInfo advertiser\n");
    }
  }

- (void)_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:(id)a3
{
  id v4 = a3;
  uint64_t hotspotInfo = self->_hotspotInfo;
  if (!(_DWORD)hotspotInfo) {
    goto LABEL_17;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
  unsigned int v7 = [v6 isAdvertising];

  if (!v7)
  {
    p_bleHotspotEncryptedData = &self->_bleHotspotEncryptedData;
    id v9 = self->_bleHotspotEncryptedData;
    if (v9)
    {
LABEL_7:
      [v4 setObject:v9 forKeyedSubscript:@"hsi"];

      goto LABEL_17;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
    if ([v10 length])
    {
      -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
      id v11 = self->_bleAuthTag;
      if (-[NSData length](v11, "length"))
      {
        memset(v18, 0, sizeof(v18));
        uint64_t v12 = kCryptoHashDescriptor_SHA512;
        id v13 = v10;
        id v14 = [v13 bytes];
        id v15 = [v13 length];
        char v16 = v11;
        CryptoHKDF( v12,  v14,  v15,  -[NSData bytes](v16, "bytes"),  -[NSData length](v16, "length"),  "BLEAdvKeyHotspotInfo",  20LL,  32LL,  v18);
        char v17 = hotspotInfo;
        ccchacha20(v18, &unk_1004CB4D3, 0LL, 1LL, &v17, &v17);
        id v9 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( &OBJC_CLASS___NSData,  "_newZeroingDataWithBytes:length:",  &v17,  1LL);
        objc_storeStrong((id *)p_bleHotspotEncryptedData, v9);
        if (dword_100643B70 <= 20
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:]",  20LL,  "Updated HotspotInfo: 0x%X <%@>\n",  hotspotInfo,  v9);
        }

        goto LABEL_7;
      }
    }

    goto LABEL_17;
  }

  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:]",  30LL,  "Skip adding hotspot info to NearbyInfo advertiser");
  }
LABEL_17:
}

- (unsigned)_bleEncryptActivityLevel:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
  if ([v5 length])
  {
    -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
    if (-[NSData length](self->_bleAuthTag, "length"))
    {
      memset(v12, 0, sizeof(v12));
      uint64_t v6 = kCryptoHashDescriptor_SHA512;
      id v7 = v5;
      CryptoHKDF( v6,  [v7 bytes],  objc_msgSend(v7, "length"),  -[NSData bytes](self->_bleAuthTag, "bytes"),  -[NSData length](self->_bleAuthTag, "length"),  "BLEAdvKeyActivityLevel",  22,  32,  v12);
      unsigned __int8 v11 = v3 & 0xF;
      ccchacha20(v12, &unk_1004CB4D3, 0LL, 1LL, &v11, &v11);
      int v8 = v11 & 0xF;
      v11 &= 0xFu;
      if (dword_100643B70 <= 20)
      {
        if (dword_100643B70 != -1 || (v9 = _LogCategory_Initialize(&dword_100643B70, 20LL), int v8 = v11, v9))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleEncryptActivityLevel:]",  20LL,  "NearbyInfo sending activity level, original: 0x%x encrypted:0x%x",  v3,  v8);
          LOBYTE(v8) = v11;
        }
      }

      LOBYTE(v3) = v8;
    }

    else if (dword_100643B70 <= 30 {
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    }
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleEncryptActivityLevel:]",  30LL,  "Not encrypting activity level because BLE AuthTag is not available");
    }
  }

  else if (dword_100643B70 <= 30 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleEncryptActivityLevel:]",  30LL,  "Not encrypting activity level because self IRK is not available");
  }

  return v3;
}

- (BOOL)_bleNearbyInfoAdvertiserLingerIfNeeded
{
  BOOL bleNearbyInfoAirDropUsable = self->_bleNearbyInfoAirDropUsable;
  if (self->_bleNearbyInfoAirDropUsable)
  {
    self->_BOOL bleNearbyInfoAirDropUsable = 0;
    -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:]( self,  "_bleNearbyInfoAdvertiserLingerStart:",  @"AirDropUsable");
  }

  return bleNearbyInfoAirDropUsable;
}

- (void)_bleNearbyInfoAdvertiserLingerStart:(id)a3
{
  id v4 = a3;
  double bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
  if (bleNearbyInfoAdvertiseLingerSecs > 0.0)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:]",  30LL,  "NearbyInfo Linger advertise start: %@, %.0f seconds\n",  v4,  *(void *)&bleNearbyInfoAdvertiseLingerSecs);
    }

    bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
    if (bleNearbyInfoAdvertiseLingerTimer)
    {
      id v7 = bleNearbyInfoAdvertiseLingerTimer;
      dispatch_source_cancel(v7);
      int v8 = self->_bleNearbyInfoAdvertiseLingerTimer;
      self->_bleNearbyInfoAdvertiseLingerTimer = 0LL;
    }

    int v9 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v10 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = v9;
    unsigned __int8 v11 = v9;

    CUDispatchTimerSet(v11, bleNearbyInfoAdvertiseLingerSecs, -1.0, 1.0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100157848;
    handler[3] = &unk_1005CBC20;
    handler[4] = v11;
    void handler[5] = self;
    id v13 = v4;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate(v11);
  }
}

- (void)_bleNearbyInfoReceivedData:(id)a3 cnx:(id)a4 peer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v34 = v8;
  unsigned __int8 v11 = (unsigned __int8 *)[v34 bytes];
  uint64_t v12 = (char *)[v34 length];
  if ((uint64_t)v12 <= 0)
  {
    if (dword_100643B70 > 50) {
      goto LABEL_23;
    }
    if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)) {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  50LL,  "### BLE NearbyInfo frame no type (%tu bytes)\n");
    }
  }

  else
  {
    id v14 = v11 + 1;
    uint64_t v13 = *v11;
    int v15 = 1;
    int v16 = 1;
    switch(*v11)
    {
      case 1u:
        if (dword_100643B70 <= 50
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  50LL,  "BLE NearbyInfo no-op frame\n");
        }

        goto LABEL_23;
      case 2u:
        if (dword_100643B70 <= 50
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  50LL,  "BLE NearbyInfo PingRequest: %'.32@\n",  v34);
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v34));
        if (!v33) {
          break;
        }
        id v28 = v33;
        *(_BYTE *)[v28 mutableBytes] = 3;
        [v9 sendData:v28 completion:0];
        goto LABEL_52;
      case 3u:
        if (dword_100643B70 <= 50
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  50LL,  "BLE NearbyInfo PingResponse: %'.32@\n",  v34);
        }

        goto LABEL_23;
      case 5u:
      case 6u:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x1Cu:
      case 0x1Du:
        goto LABEL_5;
      case 7u:
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 1, (char *)objc_msgSend(v34, "length") - 1));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDevice]);
        -[SDNearbyAgent _unlockReceivedFrameData:peer:device:]( self,  "_unlockReceivedFrameData:peer:device:",  v22,  v10,  v23);

        goto LABEL_23;
      case 8u:
      case 9u:
      case 0xAu:
        int v19 = &v12[(void)v11];
        if (dword_100643B70 <= 20
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  20,  "BLE NearbyInfo received frame type 0x%02X, %ld bytes\n",  v13,  [v34 length]);
        }

        if (-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]( self,  "_bleNearbyInfoReceivedFrameType:src:end:cnx:",  v13,  v14,  v19,  v9))
        {
          break;
        }

        goto LABEL_23;
      case 0xBu:
        remoteAppServiceUUID = self->_remoteAppServiceUUID;
        if (!remoteAppServiceUUID)
        {
          uint64_t v25 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1004CB4F4);
          id v26 = self->_remoteAppServiceUUID;
          self->_remoteAppServiceUUID = v25;

          remoteAppServiceUUID = self->_remoteAppServiceUUID;
        }

        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_services,  "objectForKeyedSubscript:",  remoteAppServiceUUID));
        id v28 = v27;
        if (v27)
        {
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v27 eventMessageHandler]);

          if (v29)
          {
            id v30 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
            unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 1, (char *)objc_msgSend(v34, "length") - 1));
            [v30 setBodyData:v31];

            BOOL v32 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v28 eventMessageHandler]);
            ((void (**)(void, id))v32)[2](v32, v30);
          }

          else if (dword_100643B70 <= 90 {
                 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
          }
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  90LL,  "### BLE Remote app frame with no service event handler\n");
          }
        }

        else if (dword_100643B70 <= 90 {
               && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
        }
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]",  90LL,  "### BLE Remote app frame with no service\n");
        }

- (int)_bleNearbyInfoReceivedFrameType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6
{
  int v8 = a3;
  __int128 v80 = a4;
  id v74 = a6;
  unsigned int v79 = 0;
  p_inst_meths = &OBJC_PROTOCOL___SDXPCProximityClientInterface.inst_meths;
  if (a5 - a4 <= 15)
  {
    unsigned int v79 = -6750;
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  50LL,  "### BLE NearbyInfo frame no session ID (%tu bytes)\n",  a5 - a4);
    }

    uint64_t v41 = 0LL;
    goto LABEL_103;
  }

  unsigned __int8 v72 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a4);
  __int128 v80 = a4 + 16;
  if (a5 - (a4 + 16) <= 15)
  {
    unsigned int v79 = -6750;
    if (dword_100643B70 > 50)
    {
      unsigned int v27 = 0LL;
      id v73 = 0LL;
      unsigned __int8 v11 = 0LL;
      goto LABEL_98;
    }

    uint64_t v41 = v72;
    if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)) {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  50LL,  "### BLE NearbyInfo frame no message ID (%tu bytes)\n",  a5 - (a4 + 16));
    }
LABEL_103:
    unsigned int v27 = 0LL;
    id v73 = 0LL;
    unsigned __int8 v11 = 0LL;
    id v69 = 0LL;
    int v19 = 0LL;
    uint64_t v17 = 0LL;
    int v18 = 0LL;
    BOOL v42 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_73;
  }

  id v73 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a4 + 16);
  __int128 v80 = a4 + 32;
  unsigned __int8 v11 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2(a4 + 32, a5 - (a4 + 32), 112LL, &v80, &v79);
  if (v79)
  {
    unsigned int v27 = 0LL;
LABEL_98:
    id v69 = 0LL;
    goto LABEL_99;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    unsigned int v27 = 0LL;
    id v69 = 0LL;
LABEL_96:
    int v19 = 0LL;
    uint64_t v17 = 0LL;
    int v18 = 0LL;
    BOOL v42 = 0LL;
    uint64_t v25 = 0LL;
    unsigned int v79 = -6756;
LABEL_100:
    uint64_t v41 = v72;
    goto LABEL_73;
  }

  uint64_t v13 = CFBinaryPlistStreamedCreateWithBytesEx2(v80, a5 - v80, 112LL, &v80, &v79);
  id v69 = (void *)v13;
  if (v79)
  {
    unsigned int v27 = 0LL;
LABEL_99:
    int v19 = 0LL;
    uint64_t v17 = 0LL;
    int v18 = 0LL;
    BOOL v42 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_100;
  }

  uint64_t v14 = v13;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    unsigned int v27 = 0LL;
    goto LABEL_96;
  }

  switch(v8)
  {
    case 10:
      id v16 = objc_alloc_init(&OBJC_CLASS___SFResponseMessage);
      int v19 = 0LL;
      uint64_t v17 = 0LL;
      int v18 = v16;
      break;
    case 9:
      id v16 = objc_alloc_init(&OBJC_CLASS___SFRequestMessage);
      int v19 = 0LL;
      int v18 = 0LL;
      uint64_t v17 = v16;
      break;
    case 8:
      id v16 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
      uint64_t v17 = 0LL;
      int v18 = 0LL;
      int v19 = v16;
      break;
    default:
      dispatch_time_t v63 = (SDNearbyAgent *)FatalErrorF("Bad frame type: %d", v8);
      return -[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:](v63, v64, v65, v66, v67);
  }

  id v20 = v16;
  [v20 setIdentifier:v73];
  unsigned __int8 v71 = v11;
  [v20 setHeaderFields:v11];
  [v20 setBodyData:v14];
  id v21 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v74 peerDevice]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
  -[SFDevice setIdentifier:](v21, "setIdentifier:", v23);

  id v70 = v20;
  id v24 = v20;
  uint64_t v25 = v21;
  [v24 setPeerDevice:v21];
  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v72));
  if (!v26)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v72, "UUIDString"));
    unsigned int v29 = [v28 isEqual:@"00000000-0000-0000-0000-000000000000"];

    if (v29)
    {
      v68 = v21;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      id v30 = self->_sessions;
      id v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v75,  v81,  16LL);
      if (!v31)
      {
        unsigned int v27 = 0LL;
        goto LABEL_54;
      }

      id v32 = v31;
      unsigned int v27 = 0LL;
      uint64_t v33 = *(void *)v76;
      while (1)
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          uint64_t v35 = v27;
          if (*(void *)v76 != v33) {
            objc_enumerationMutation(v30);
          }
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessions,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v75 + 1) + 8LL * (void)i)));

          if (v19)
          {
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v27 eventMessageHandler]);

            if (v36)
            {
              BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v27 eventMessageHandler]);
              unsigned __int8 v38 = (void (*)(void))v37[2];
LABEL_32:
              v38();

              continue;
            }
          }

          if (v17)
          {
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v27 requestMessageHandler]);

            if (v39)
            {
              BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v27 requestMessageHandler]);
              unsigned __int8 v38 = (void (*)(void))v37[2];
              goto LABEL_32;
            }
          }

          if (v18)
          {
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v27 responseMessageInternalHandler]);

            if (v40)
            {
              BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v27 responseMessageInternalHandler]);
              unsigned __int8 v38 = (void (*)(void))v37[2];
              goto LABEL_32;
            }
          }
        }

        id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v75,  v81,  16LL);
        if (!v32)
        {
LABEL_54:

          unsigned __int8 v11 = v71;
          uint64_t v41 = v72;
          p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDXPCProximityClientInterface + 24);
          BOOL v42 = v70;
          uint64_t v25 = v68;
          goto LABEL_73;
        }
      }
    }

    if (dword_100643B70 <= 20
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  20LL,  "BLE NearbyInfo received service frame type 0x%02X\n",  v8);
    }

    unsigned __int8 v11 = v71;
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKeyedSubscript:@"_serviceUUID"]);
    if (v48)
    {
      uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
      {
        if ([v48 length] == (id)16)
        {
          uint64_t v50 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v48 bytes]);
          if (v50)
          {
            BOOL v51 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_services,  "objectForKeyedSubscript:",  v50));
            BOOL v52 = v51;
            uint64_t v41 = v72;
            p_inst_meths = &OBJC_PROTOCOL___SDXPCProximityClientInterface.inst_meths;
            if (!v51)
            {
              unsigned int v79 = -6720;
              goto LABEL_72;
            }

            if (v19
              && (v53 = (void *)objc_claimAutoreleasedReturnValue([v51 eventMessageHandler]),
                  v53,
                  v53))
            {
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 eventMessageHandler]);
              uint64_t v55 = (void (*)(void))v54[2];
            }

            else if (v17 {
                   && (BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v52 requestMessageHandler]),
            }
                       v56,
                       v56))
            {
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 requestMessageHandler]);
              uint64_t v55 = (void (*)(void))v54[2];
            }

            else
            {
              if (!v18
                || (uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v52 responseMessageInternalHandler]),
                    v57,
                    !v57))
              {
                if (dword_100643B70 <= 50)
                {
                  unsigned __int8 v11 = v71;
                  if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)) {
                    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  50LL,  "### BLE NearbyInfo service receive with no handler: %@\n",  v70);
                  }
                  goto LABEL_72;
                }

                goto LABEL_71;
              }

              id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 responseMessageInternalHandler]);
              uint64_t v55 = (void (*)(void))v54[2];
            }

            v55();

LABEL_71:
            unsigned __int8 v11 = v71;
LABEL_72:

            unsigned int v27 = 0LL;
            BOOL v42 = v70;
            goto LABEL_73;
          }

          BOOL v52 = 0LL;
          int v62 = -6700;
        }

        else
        {
          uint64_t v50 = 0LL;
          BOOL v52 = 0LL;
          int v62 = -6743;
        }
      }

      else
      {
        uint64_t v50 = 0LL;
        BOOL v52 = 0LL;
        int v62 = -6756;
      }
    }

    else
    {
      uint64_t v50 = 0LL;
      BOOL v52 = 0LL;
      int v62 = -6727;
    }

    unsigned int v79 = v62;
    uint64_t v41 = v72;
    p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDXPCProximityClientInterface + 24);
    goto LABEL_72;
  }

  unsigned int v27 = (void *)v26;
  p_inst_meths = &OBJC_PROTOCOL___SDXPCProximityClientInterface.inst_meths;
  if (dword_100643B70 <= 20 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  20LL,  "BLE NearbyInfo received session frame type 0x%02X\n",  v8);
  }
  unsigned __int8 v11 = v71;
  uint64_t v41 = v72;
  BOOL v42 = v70;
  if (v19
    && (uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v27 eventMessageHandler]), v43,
                                                                                                   v43))
  {
    int v44 = (void *)objc_claimAutoreleasedReturnValue([v27 eventMessageHandler]);
    __int128 v45 = (void (*)(void))v44[2];
  }

  else if (v17 {
         && (__int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v27 requestMessageHandler]),
  }
             v46,
             v46))
  {
    int v44 = (void *)objc_claimAutoreleasedReturnValue([v27 requestMessageHandler]);
    __int128 v45 = (void (*)(void))v44[2];
  }

  else
  {
    if (!v18
      || (__int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v27 responseMessageInternalHandler]),
          v47,
          !v47))
    {
      if (dword_100643B70 <= 50
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  50LL,  "### BLE NearbyInfo session receive with no handler: %@\n",  v70);
      }

      goto LABEL_73;
    }

    int v44 = (void *)objc_claimAutoreleasedReturnValue([v27 responseMessageInternalHandler]);
    __int128 v45 = (void (*)(void))v44[2];
  }

  v45();

LABEL_73:
  uint64_t v58 = v79;
  if (v79)
  {
    int v59 = *((_DWORD *)p_inst_meths + 732);
    if (v59 <= 50)
    {
      if (v59 != -1 || (v60 = _LogCategory_Initialize(&dword_100643B70, 50LL), uint64_t v58 = v79, v60))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]",  50LL,  "### BLE NearbyInfo receive frame failed: %#m\n",  v58);
        LODWORD(v58) = v79;
      }
    }
  }

  return v58;
}

- (int)bleNearbyInfoStartConnectionToDevice:(id)a3 owner:(id)a4 connected:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v8));
  if (v10)
  {
    id v11 = (id)v10;
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      uint64_t v12 = (objc_class *)objc_opt_class(v9);
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:]",  30LL,  "Reusing BLE connection for %@\n",  v14);
    }

    [v11 addClient:v9];
    [v11 setAcceptor:0];
    if (a5) {
      *a5 = [v11 connectionState] == (id)1;
    }
  }

  else
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      uint64_t v15 = (objc_class *)objc_opt_class(v9);
      id v16 = NSStringFromClass(v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:]",  30LL,  "Creating BLE connection for %@\n",  v17);
    }

    int v18 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
    -[SFBLEDevice setIdentifier:](v18, "setIdentifier:", v8);
    -[SFBLEDevice setUseBTPipe:](v18, "setUseBTPipe:", 0LL);
    id v11 = [[SFBLEConnection alloc] initWithDevice:v18 acceptor:0];
    [v11 setDispatchQueue:self->_dispatchQueue];
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v21 = self->_bleConnections;
      self->_bleConnections = v20;

      bleConnections = self->_bleConnections;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v11, v8);
    [v11 addClient:v9];
    [v11 activateDirect];
    if (a5) {
      *a5 = 0;
    }
  }

  return 0;
}

- (void)bleNearbyInfoStopConnectionToDevice:(id)a3 owner:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v12));
  id v8 = v7;
  if (v7 && ([v7 removeClient:v6] & 1) == 0)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      id v9 = (objc_class *)objc_opt_class(v6);
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoStopConnectionToDevice:owner:]",  30LL,  "Invalidating BLE connection for %@\n",  v11);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v12);
    [v8 invalidate];
  }
}

- (int)bleNearbyInfoSendFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6 isSession:(BOOL)a7
{
  BOOL v7 = a7;
  int v9 = a4;
  unsigned int v10 = a3;
  v60[0] = a3;
  unsigned __int8 v59 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleConnections,  "objectForKeyedSubscript:",  v13));
    if (v36)
    {
      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      char v15 = 1;
      -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", v60, 1LL);
      -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", &v59, 1LL);
      -[NSMutableData appendData:](v14, "appendData:", v12);
      NSUInteger v16 = -[NSMutableData length](v14, "length");
      if (v16 < 0xEA41)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100159428;
        v37[3] = &unk_1005CFB48;
        unsigned __int8 v40 = v60[0];
        unsigned __int8 v41 = v59;
        id v38 = v12;
        id v39 = v13;
        [v36 sendData:v14 completion:v37];

        int v27 = 0;
      }

      else
      {
        unint64_t v17 = v16;
        uint64_t v35 = v13;
        if (v7) {
          char v18 = 64;
        }
        else {
          char v18 = 48;
        }
        if (v7) {
          char v19 = 65;
        }
        else {
          char v19 = 49;
        }
        char v33 = v19;
        id v34 = v14;
        id v20 = (char *)-[NSMutableData bytes](v34, "bytes");
        id v21 = 0LL;
        char v58 = 1;
        unint64_t v32 = v17;
        while (v15 != -1)
        {
          uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableData);

          char v57 = v18;
          -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", &v57, 1LL);
          -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", &v59, 1LL);
          -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", &v58, 1LL);
          -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", v20, 59968LL);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_100159230;
          v50[3] = &unk_1005CFB20;
          unsigned __int8 v54 = v60[0];
          char v55 = v58;
          unsigned __int8 v56 = v59;
          id v21 = v22;
          BOOL v51 = v21;
          id v23 = v12;
          id v52 = v23;
          id v24 = v35;
          id v53 = v24;
          [v36 sendData:v21 completion:v50];

          v20 += 59968;
          char v15 = ++v58;
          v17 -= 59968LL;
          if (v17 <= 0xEA40)
          {
            uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableData);

            char v49 = v33;
            -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v49, 1LL);
            -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v59, 1LL);
            -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v58, 1LL);
            -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", v20, v17);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_10015932C;
            v42[3] = &unk_1005CFB20;
            unsigned __int8 v46 = v60[0];
            char v47 = v58;
            unsigned __int8 v48 = v59;
            uint64_t v43 = v25;
            id v44 = v23;
            id v45 = v24;
            uint64_t v26 = v25;
            [v36 sendData:v26 completion:v42];

            int v27 = 0;
            goto LABEL_14;
          }
        }

        if (dword_100643B70 <= 60
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]",  60LL,  "### Can't send more than 255 fragments (%zu total bytes)\n",  v32);
        }

        int v27 = -6764;
LABEL_14:
        id v13 = v35;
      }
    }

    else
    {
      if (dword_100643B70 <= 60
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
      {
        id v30 = sub_100157FFC(v10);
        id v31 = sub_10015643C(v9);
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]",  60,  "### BLE Nearby send frame type %s, service %s, %ld bytes, unknown peer %@\n",  v30,  v31,  [v12 length],  v13);
      }

      int v27 = -6753;
    }
  }

  else
  {
    if (dword_100643B70 <= 60
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
    {
      unsigned int v29 = sub_100157FFC(v10);
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]",  60,  "### BLE Nearby send frame type %s, invalid service 0x%X, %ld bytes, peer %@\n",  v29,  0,  [v12 length],  v13);
    }

    int v27 = -6705;
  }

  return v27;
}

- (void)_bleNearbyInfoScannerEnsureStarted
{
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  if (bleNearbyInfoScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleNearbyInfoScanner, 1LL);
  }

  else
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoScannerEnsureStarted]",  50LL,  "BLE NearbyInfo scanner start\n");
    }

    id v4 = -[SFBLEScanner initWithType:](objc_alloc(&OBJC_CLASS___SFBLEScanner), "initWithType:", 16LL);
    BOOL v5 = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleNearbyInfoScanner, "setDispatchQueue:", self->_dispatchQueue);
    if (-[NSMutableSet count](self->_caRequests, "count"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](self, "_idsBluetoothDeviceIDsForSharing"));
      -[SFBLEScanner setDeviceFilter:](self->_bleNearbyInfoScanner, "setDeviceFilter:", v6);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001596F8;
    v10[3] = &unk_1005CB958;
    v10[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleNearbyInfoScanner, "setDeviceFoundHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001597EC;
    v9[3] = &unk_1005CB958;
    v9[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleNearbyInfoScanner, "setDeviceLostHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001598AC;
    v8[3] = &unk_1005CB9C0;
    v8[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleNearbyInfoScanner, "setDeviceChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100159950;
    v7[3] = &unk_1005CBB40;
    v7[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleNearbyInfoScanner, "setScanStateChangedHandler:", v7);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", self->_bleNearbyInfoScanner, 1LL);
    if (self->_bleNearbyInfoRSSILog) {
      -[SFBLEScanner setRssiLog:](self->_bleNearbyInfoScanner, "setRssiLog:", 1LL);
    }
    -[SFBLEScanner activateWithCompletion:](self->_bleNearbyInfoScanner, "activateWithCompletion:", &stru_1005CFB68);
  }

- (void)_bleNearbyInfoScannerEnsureStopped
{
  if (self->_bleNearbyInfoScanner
    && dword_100643B70 <= 50
    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped]",  50LL,  "BLE NearbyInfo scanner stop\n");
  }

  -[SFBLEScanner invalidate](self->_bleNearbyInfoScanner, "invalidate");
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0LL;

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleNearbyInfoDevices, "allKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleNearbyInfoDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i)));
        if (v9) {
          -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 16LL);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_bleNearbyInfoDevices, "removeAllObjects");
  bleNearbyInfoDevices = self->_bleNearbyInfoDevices;
  self->_bleNearbyInfoDevices = 0LL;
}

- (BOOL)_bleNearbyInfoScannerShouldScan
{
  if (self->_systemWillPowerDown || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count")) {
    return 0;
  }
  if (-[NSMutableSet count](self->_caRequests, "count")) {
    return 1;
  }
  if (!self->_ddNearbyInfoEnabled) {
    return 0;
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = self->_ddRequests;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (!v5)
  {
LABEL_21:

    return 0;
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_10:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (void)v12) & 1) == 0
      || !self->_activityScreenOn && ![v9 overrideScreenOff])
    {
      goto LABEL_19;
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceFilter]);
    __int128 v11 = v10;
    if (!v10 || [v10 count]) {
      break;
    }

LABEL_19:
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  if (self->_ddNearbyInfoScreenOff) {
    return 1;
  }
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

- (void)_bleProximityPairingScannerEnsureStarted
{
  bleProximityPairingScanner = self->_bleProximityPairingScanner;
  if (bleProximityPairingScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleProximityPairingScanner, 2LL);
  }

  else
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleProximityPairingScannerEnsureStarted]",  50LL,  "BLE Prox scanner start\n");
    }

    id v4 = -[SFBLEScanner initWithType:](objc_alloc(&OBJC_CLASS___SFBLEScanner), "initWithType:", 7LL);
    id v5 = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleProximityPairingScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFBLEScanner setChangeFlags:](self->_bleProximityPairingScanner, "setChangeFlags:", 13LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100159F78;
    v9[3] = &unk_1005CB958;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleProximityPairingScanner, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10015A0A8;
    v8[3] = &unk_1005CB958;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleProximityPairingScanner, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10015A1C0;
    v7[3] = &unk_1005CB9C0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleProximityPairingScanner, "setDeviceChangedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10015A300;
    v6[3] = &unk_1005CBB40;
    v6[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleProximityPairingScanner, "setScanStateChangedHandler:", v6);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:]( self,  "_bleUpdateScanner:typeFlag:",  self->_bleProximityPairingScanner,  2LL);
    if (self->_bleProximityRSSILog) {
      -[SFBLEScanner setRssiLog:](self->_bleProximityPairingScanner, "setRssiLog:", 1LL);
    }
    -[SFBLEScanner activateWithCompletion:]( self->_bleProximityPairingScanner,  "activateWithCompletion:",  &stru_1005CFB88);
  }

- (void)_bleProximityPairingScannerEnsureStopped
{
  if (self->_bleProximityPairingScanner)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleProximityPairingScannerEnsureStopped]",  50LL,  "BLE Prox scanner stop\n");
    }

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_ddProximityPairingDevices, "allKeys", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddProximityPairingDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i)));
          int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);

          if (v9) {
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 7LL);
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }

    -[SFBLEScanner invalidate](self->_bleProximityPairingScanner, "invalidate");
    bleProximityPairingScanner = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = 0LL;
  }

- (BOOL)_bleProximityPairingScannerShouldScan
{
  if (!self->_bleProximityEnabled
    || !self->_ddProximityPairingEnabled
    || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
  {
    return 0;
  }

  if (self->_ddProximityPairingScreenOff && !self->_systemWillPowerDown) {
    return 1;
  }
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

- (void)_btPipeEnsureStopped
{
  if (self->_unlockBtPipe)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent _btPipeEnsureStopped]", 50LL, "BTPipe stop\n");
    }

    -[SFBLEPipe invalidate](self->_unlockBtPipe, "invalidate");
    unlockBtPipe = self->_unlockBtPipe;
    self->_unlockBtPipe = 0LL;
  }

- (void)_btPipeStateChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFNotificationKeyConnectionState]);
  unint64_t v6 = (unint64_t)[v5 integerValue];

  uint64_t v8 = auto_unlock_log(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 2) {
      unsigned int v10 = "?";
    }
    else {
      unsigned int v10 = off_1005D0350[v6];
    }
    int v17 = 136315138;
    char v18 = (void *)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_btPipeStateChanged to %s",  (uint8_t *)&v17,  0xCu);
  }

  if (v6 == 1)
  {
    __int128 v11 = (SFBLEDevice *)objc_claimAutoreleasedReturnValue(-[SFBLEPipe getPeerUUID](self->_unlockBtPipe, "getPeerUUID"));
    __int128 v12 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
    -[SFBLEDevice setIdentifier:](v12, "setIdentifier:", v11);
    -[SFBLEDevice setUseBTPipe:](v12, "setUseBTPipe:", 1LL);
    btPipePeer = self->_btPipePeer;
    self->_btPipePeer = v12;

    uint64_t v15 = auto_unlock_log(v14);
    NSUInteger v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      char v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "connected to BT peer %@",  (uint8_t *)&v17,  0xCu);
    }
  }

  else
  {
    __int128 v11 = self->_btPipePeer;
    self->_btPipePeer = 0LL;
  }
}

- (void)_btPipeHandleFrameType:(unsigned __int8)a3 data:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  switch(v4)
  {
    case 3:
      id v24 = v6;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEPipe getPeerUUID](self->_unlockBtPipe, "getPeerUUID"));
      int v9 = self->_btPipePeer;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v9, "identifier"));

      if (v8 != v10
        && dword_100643B70 <= 60
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v9, "identifier"));
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _btPipeHandleFrameType:data:]",  60LL,  "Received message from unexpected device with BT UUID %@. Expected: %@",  v8,  v11);
      }

      -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](self, "_unlockReceivedFrameData:peer:device:", v24, v8, v9);

      goto LABEL_23;
    case 2:
      id v24 = v6;
      if ((unint64_t)[v6 length] <= 7)
      {
        uint64_t v7 = v24;
        if (dword_100643B70 <= 60)
        {
          if (dword_100643B70 != -1 || (v20 = _LogCategory_Initialize(&dword_100643B70, 60LL), uint64_t v7 = v24, v20))
          {
            id v22 = [v7 length];
            NSUInteger v16 = "### Ping response too small: %ld bytes\n";
LABEL_32:
            uint64_t v17 = 60LL;
            goto LABEL_15;
          }
        }
      }

      else
      {
        double Current = CFAbsoluteTimeGetCurrent();
        id v13 = v24;
        uint64_t v14 = (double *)[v13 bytes];
        uint64_t v7 = v24;
        if (dword_100643B70 <= 50)
        {
          double v15 = *v14;
          if (dword_100643B70 != -1 || (v19 = _LogCategory_Initialize(&dword_100643B70, 50LL), uint64_t v7 = v24, v19))
          {
            double v23 = (Current - v15) * 1000.0;
            id v22 = [v13 length];
            NSUInteger v16 = "BTPipe ping response: %ld bytes, %.0f ms\n";
            uint64_t v17 = 50LL;
LABEL_15:
            LogPrintF(&dword_100643B70, "-[SDNearbyAgent _btPipeHandleFrameType:data:]", v17, v16, v22, *(void *)&v23);
LABEL_24:
            uint64_t v7 = v24;
          }
        }
      }

      break;
    case 1:
      id v24 = v6;
      if (dword_100643B70 <= 50)
      {
        if (dword_100643B70 != -1 || (v18 = _LogCategory_Initialize(&dword_100643B70, 50LL), uint64_t v7 = v24, v18))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _btPipeHandleFrameType:data:]",  50,  "BTPipe ping request: %ld bytes\n",  [v7 length]);
          uint64_t v7 = v24;
        }
      }

      if ((unint64_t)[v7 length] > 7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subdataWithRange:", 0, 8));
        -[SFBLEPipe sendFrameType:payload:completion:]( self->_unlockBtPipe,  "sendFrameType:payload:completion:",  2LL,  v8,  &stru_1005CFBA8);
LABEL_23:

        goto LABEL_24;
      }

      uint64_t v7 = v24;
      if (dword_100643B70 <= 60)
      {
        if (dword_100643B70 != -1 || (v21 = _LogCategory_Initialize(&dword_100643B70, 60LL), uint64_t v7 = v24, v21))
        {
          id v22 = [v7 length];
          NSUInteger v16 = "### Ping request too small: %ld bytes\n";
          goto LABEL_32;
        }
      }

      break;
  }
}

- (void)_smartCoverStatusChanged:(id)a3
{
  id v4 = a3;
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _smartCoverStatusChanged:]",  30LL,  "smartCoverStatusChanged notification");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015ACE8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_wirelessCriticalChanged:(id)a3
{
  id v6 = a3;
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    unsigned int v4 = -[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical");
    id v5 = @"NO";
    if (v4) {
      id v5 = @"YES";
    }
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _wirelessCriticalChanged:]",  30LL,  "wirelessCriticalChanged notification, wifiCritical=%@",  v5,  v6);
  }

  if (-[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical"))
  {
    if (dword_100643B70 <= 40
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent _wirelessCriticalChanged:]", 40LL, "Disabling enhanced discovery\n");
    }

    -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", @"WirelessCritical");
  }
}

- (void)_mirroringStateChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015AE54;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bleAdvertisingAddressChanged
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
  unsigned int v4 = v3;
  id obj = v3;
  if (v3)
  {
    bleAdvertisingAddress = self->_bleAdvertisingAddress;
    id v6 = v3;
    uint64_t v7 = bleAdvertisingAddress;
    if (v6 == v7)
    {

      unsigned int v4 = obj;
    }

    else
    {
      uint64_t v8 = v7;
      if (!v7)
      {

        goto LABEL_12;
      }

      unsigned int v9 = -[NSData isEqual:](v6, "isEqual:", v7);

      unsigned int v4 = obj;
      if (!v9)
      {
LABEL_12:
        if (dword_100643B70 <= 30
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
        {
          if ((id)-[NSData length](v6, "length") == (id)6) {
            id v11 = -[NSData bytes](v6, "bytes");
          }
          else {
            id v11 = 0LL;
          }
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleAdvertisingAddressChanged]",  30LL,  "BLE address changed: %.6a\n",  *(double *)&v11);
        }

        objc_storeStrong((id *)&self->_bleAdvertisingAddress, obj);
        bleAudioRoutingScoreEncryptedData = self->_bleAudioRoutingScoreEncryptedData;
        self->_bleAudioRoutingScoreEncryptedData = 0LL;

        bleAuthTag = self->_bleAuthTag;
        self->_bleAuthTag = 0LL;

        bleHotspotEncryptedData = self->_bleHotspotEncryptedData;
        self->_bleHotspotEncryptedData = 0LL;

        -[SDNearbyAgent _update](self, "_update");
        goto LABEL_25;
      }
    }
  }

  if (dword_100643B70 <= 30)
  {
    if (dword_100643B70 != -1 || (v12 = _LogCategory_Initialize(&dword_100643B70, 30LL), unsigned int v4 = obj, v12))
    {
      if ([v4 length] == (id)6) {
        id v10 = [obj bytes];
      }
      else {
        id v10 = 0LL;
      }
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleAdvertisingAddressChanged]",  30LL,  "BLE address unchanged: %.6a\n",  *(double *)&v10);
LABEL_25:
      unsigned int v4 = obj;
    }
  }
}

- (void)_bleUpdateAuthTagIfNeeded
{
  if (!self->_bleAuthTag && self->_idSelfIdentity)
  {
    int v3 = self->_bleAdvertisingAddress;
    if ((id)-[NSData length](v3, "length") != (id)6)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));

      int v3 = (NSData *)v4;
    }

    if ((id)-[NSData length](v3, "length") != (id)6) {
      goto LABEL_13;
    }
    idSelfIdentity = self->_idSelfIdentity;
    id v11 = 0LL;
    id v6 = (NSData *)objc_claimAutoreleasedReturnValue( -[RPIdentity authTagForData:type:error:]( idSelfIdentity,  "authTagForData:type:error:",  v3,  2LL,  &v11));
    id v7 = v11;
    bleAuthTag = self->_bleAuthTag;
    self->_bleAuthTag = v6;

    unsigned int v9 = self->_bleAuthTag;
    if (!v9)
    {
      if (dword_100643B70 <= 90
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleUpdateAuthTagIfNeeded]",  90LL,  "### Generate BLE Auth Tag failed: %{error}\n",  v7);
      }

      goto LABEL_12;
    }

    if (dword_100643B70 <= 30)
    {
      if (dword_100643B70 == -1)
      {
        unsigned int v9 = self->_bleAuthTag;
      }

      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleUpdateAuthTagIfNeeded]",  30LL,  "Updated BLE Auth Tag: <%@>\n",  v9);
    }

- (void)_bleUpdateScanner:(id)a3 typeFlag:(unint64_t)a4
{
  id v54 = a3;
  if ((a4 & 1) != 0)
  {
    id v6 = -[NSMutableSet count](self->_caRequests, "count");
    uint64_t v7 = 40LL;
    if (!v6) {
      uint64_t v7 = 0LL;
    }
    uint64_t v69 = v7;
  }

  else
  {
    uint64_t v69 = 0LL;
  }

  char v86 = 0;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id obj = self->_ddRequests;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v87,  16LL);
  if (!v8)
  {
    LOBYTE(v10) = 0;
    id v65 = 0LL;
    LOBYTE(v11) = 0;
    BOOL v61 = 0LL;
    int v62 = 0LL;
    int v12 = 0;
    uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
    int v60 = 0LL;
    char v68 = 1;
    goto LABEL_60;
  }

  id v9 = v8;
  int v10 = 0;
  id v65 = 0LL;
  int v11 = 0;
  BOOL v61 = 0LL;
  int v62 = 0LL;
  int v12 = 0;
  uint64_t v13 = *(void *)v83;
  uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
  int v60 = 0LL;
  char v67 = 0;
  char v68 = 1;
  unint64_t v57 = a4;
  char v58 = self;
  uint64_t v56 = *(void *)v83;
  do
  {
    uint64_t v14 = 0LL;
    id v64 = v9;
    do
    {
      if (*(void *)v83 != v13) {
        objc_enumerationMutation(obj);
      }
      double v15 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)v14);
      unint64_t v16 = (unint64_t)objc_msgSend(v15, "discoveryFlags", v54);
      if ((v16 & a4) != 0)
      {
        char v17 = v16;
        if (self->_activityScreenOn || [v15 overrideScreenOff])
        {
          int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceFilter]);
          int v19 = v18;
          if (v18)
          {
            if (![v18 count]) {
              goto LABEL_52;
            }
            if ((v67 & 1) == 0)
            {
              int v20 = v61;
              if (!v61) {
                int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              }
              BOOL v61 = v20;
              -[NSMutableSet unionSet:](v20, "unionSet:", v19);
              char v67 = 0;
LABEL_23:
              int v21 = v11 | ((v17 & 0x40) == 0LL);
              if ((v21 & 1) == 0) {
                v86 |= 0x20u;
              }
              unsigned int v22 = [v15 trackPeers];
              int v66 = v21;
              if (v19 && v22)
              {
                double v23 = v60;
                if (!v60) {
                  double v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                }
                int v24 = v10;
                int v60 = v23;
                -[NSMutableSet unionSet:](v23, "unionSet:", v19);
              }

              else
              {
                int v24 = v10;
              }

              unsigned int v25 = [v15 changeFlags];
              if ((v25 & 0x10) != 0) {
                int v26 = 4;
              }
              else {
                int v26 = (2 * v25) & 4;
              }
              BOOL v27 = [v15 rssiThreshold] == 0;
              int v28 = v12;
              unsigned __int8 v29 = [v15 scanCache];
              id v30 = (id)v69;
              uint64_t v69 = (uint64_t)v30;
              if ([v15 overrideScreenOff])
              {
                uint64_t v31 = (uint64_t)[v15 overrideScreenOffRescanInterval];
                uint64_t v32 = 10LL;
                if (v31 > 10) {
                  uint64_t v32 = v31;
                }
                uint64_t v33 = v59;
                if (v59 >= v32) {
                  uint64_t v33 = v32;
                }
                uint64_t v59 = v33;
              }

              int v12 = v28 | v25 | v26;
              int v10 = v27 | v24;
              v68 &= v29;
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v15 useCases]);

              if (v34)
              {
                uint64_t v35 = objc_claimAutoreleasedReturnValue([v15 useCases]);
                uint64_t v36 = (void *)v35;
                a4 = v57;
                self = v58;
                int v11 = v66;
                uint64_t v13 = v56;
                if (v62)
                {
                  if (v35) {
                    goto LABEL_49;
                  }
                }

                else
                {
                  int v62 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                  if (v36) {
LABEL_49:
                  }
                    -[NSMutableSet unionSet:](v62, "unionSet:", v36);
                }
              }

              else
              {
                a4 = v57;
                self = v58;
                int v11 = v66;
                uint64_t v13 = v56;
              }

- (id)_bleUpdateUseCases:(id)a3
{
  uint64_t v4 = (NSMutableSet *)[a3 mutableCopy];
  if (!v4) {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  if (-[NSMutableSet count](self->_enhancedDiscoveryUseCases, "count")) {
    -[NSMutableSet unionSet:](v4, "unionSet:", self->_enhancedDiscoveryUseCases);
  }
  return v4;
}

- (id)bleProximityEstimatorForActionType:(unsigned __int8)a3 device:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDNearbyAgent bleProximityInfoForActionType:device:]( self,  "bleProximityInfoForActionType:device:",  a3,  a4));
  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SFProximityEstimator proximityEstimatorWithProximityInfo:]( &OBJC_CLASS___SFProximityEstimator,  "proximityEstimatorWithProximityInfo:",  v4));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)bleProximityEstimatorsResetDeviceClose
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_ddNearbyActionDevices, "allValues"));
  int v3 = v2;
  if (v2)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "bleDevice", (void)v11));
          if (!v9)
          {
            while (1)
              +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"CUGuardLetNoReturn",  @"CUGuardLet with no return");
          }

          int v10 = v9;
          [v9 setInsideMediumBubble:0];
          [v10 setInsideSmallBubble:0];
          [v10 setCloseProximityEstimatorMedium:0];
          [v10 setCloseProximityEstimatorSmall:0];

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }
}

- (id)bleProximityInfo
{
  double v2 = self;
  objc_sync_enter(v2);
  bleProximityInfo = v2->_bleProximityInfo;
  if (!bleProximityInfo)
  {
    v2->_bleProximityInfo = (NSDictionary *)&off_1005FAC88;

    bleProximityInfo = v2->_bleProximityInfo;
  }

  id v4 = bleProximityInfo;
  objc_sync_exit(v2);

  return v4;
}

- (id)bleProximityInfoForActionType:(unsigned __int8)a3 device:(id)a4
{
  else {
    id v4 = (const __CFString *)*((void *)&off_1005D0368 + (char)(a3 - 1));
  }
  return -[SDNearbyAgent bleProximityInfoForType:device:](self, "bleProximityInfoForType:device:", v4, a4);
}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_bleProximityInfoOverride;
  if (!v8
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDNearbyAgent bleProximityInfoForType:device:allInfo:]( self,  "bleProximityInfoForType:device:allInfo:",  v6,  v7,  v8))) == 0LL)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDNearbyAgent bleProximityInfoForType:device:allInfo:]( self,  "bleProximityInfoForType:device:allInfo:",  v6,  v7,  v10));
  }

  return v9;
}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4 allInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SFDeviceModel();
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  __int128 v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 model]);
  if (v11
    && (__int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet decimalDigitCharacterSet]( NSCharacterSet,  "decimalDigitCharacterSet")),  v14 = [v11 rangeOfCharacterFromSet:v13],  v13,  v14 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v11 substringToIndex:v14]);
    if (v12)
    {
LABEL_4:
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet"));
      id v17 = -[__CFString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", v16);

      if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v12, "substringToIndex:", v17));
        goto LABEL_21;
      }

      goto LABEL_17;
    }
  }

  else
  {
    double v15 = 0LL;
    if (v12) {
      goto LABEL_4;
    }
  }

  unsigned int v19 = [v8 deviceModelCode];
  switch(v19)
  {
    case 4u:
      __int128 v12 = @"iPod9,1";
      goto LABEL_14;
    case 6u:
      int v20 = "B620ish";
      goto LABEL_13;
    case 5u:
      int v20 = "B520ish";
LABEL_13:
      __int128 v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
      goto LABEL_14;
  }

  if ([v8 deviceActionType] == 5)
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
    int v44 = (void *)objc_claimAutoreleasedReturnValue([v43 name]);

    if ((unint64_t)[v44 length] < 8)
    {
      __int128 v12 = 0LL;
    }

    else
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "substringWithRange:", 7, 1));
      else {
        __int128 v12 = 0LL;
      }
    }
  }

  else
  {
    __int128 v12 = 0LL;
  }

- (id)bleProximityRSSIEstimatorInfo
{
  id v2 = -[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  return (id)CFDictionaryGetTypedValue(v2, @"rEst", TypeID, 0LL);
}

- (int64_t)bleProximityRSSIThresholdForType:(int64_t)a3 device:(id)a4
{
  id v6 = a4;
  uint64_t v7 = SFDeviceModel();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 model]);

  if ((unint64_t)(a3 - 1) > 6)
  {
LABEL_11:
    int64_t v12 = 0LL;
    goto LABEL_12;
  }

  uint64_t v10 = *((void *)&off_1005D0560 + a3 - 1);
  if (v8 && v9)
  {
    __int128 v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-%@-%@",  v10,  v8,  v9);
    int64_t v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v11);

    if (v12) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }

  if (v9)
  {
LABEL_7:
    __int128 v13 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-%@", v10, v9);
    int64_t v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v13);

    if (v12) {
      goto LABEL_12;
    }
  }

  if (!v8
    || (v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-%@",  v10,  v8),  int64_t v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v14),  v14,  !v12))
  {
    double v15 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@", v10);
    int64_t v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v15);

    if (!v12) {
      goto LABEL_11;
    }
  }

- (int64_t)bleProximityRSSIThreshold:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo"));
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v5, v4, TypeID, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  int64_t Int64Ranged = (int)CFDictionaryGetInt64Ranged(v8, @"rssi", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  return Int64Ranged;
}

- (unsigned)_bleProximityUpdateDeviceCloseNearbyActionDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bleDevice]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  unsigned __int8 v6 = [v5 isEqualToString:@"AudioAccessory5,1"];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = @"b520ho";
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    unsigned int v9 = [v8 isEqualToString:@"AudioAccessory6,1"];

    if (v9) {
      uint64_t v7 = @"b620ho";
    }
    else {
      uint64_t v7 = @"ho";
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bleProximityInfoForType:v7 device:v3]);

  if (v11)
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 closeProximityEstimatorSmall]);
    if (!v12)
    {
      uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v11, @"algo", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      uint64_t Int64 = CFDictionaryGetInt64(v11, @"rssiSmallEnter", 0LL);
      uint64_t v15 = CFDictionaryGetInt64(v11, @"rssiSmallExit", 0LL);
      uint64_t v16 = CFDictionaryGetInt64Ranged(v11, @"sc", 0LL, 0xFFFFFFFFLL, 0LL);
      v38[0] = @"algo";
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", Int64Ranged));
      v39[0] = v17;
      v38[1] = @"rssi";
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", Int64));
      v39[1] = v18;
      v38[2] = @"rssiExit";
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
      v39[2] = v19;
      v38[3] = @"sc";
      int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v16));
      v39[3] = v20;
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL));
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SFProximityEstimator proximityEstimatorWithProximityInfo:]( &OBJC_CLASS___SFProximityEstimator,  "proximityEstimatorWithProximityInfo:",  v21));

      [v4 setCloseProximityEstimatorSmall:v12];
    }

    unsigned int v22 = [v12 updateWithSFBLEDevice:v4];
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v4 closeProximityEstimatorMedium]);
    if (!v23)
    {
      uint64_t v24 = CFDictionaryGetInt64Ranged(v11, @"algo", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      uint64_t v25 = CFDictionaryGetInt64(v11, @"rssiMediumEnter", 0LL);
      uint64_t v26 = CFDictionaryGetInt64(v11, @"rssiMediumExit", 0LL);
      uint64_t v27 = CFDictionaryGetInt64Ranged(v11, @"sc", 0LL, 0xFFFFFFFFLL, 0LL);
      v36[0] = @"algo";
      unsigned int v35 = v22;
      int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24));
      v37[0] = v28;
      v36[1] = @"rssi";
      CFTypeID v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v25));
      v37[1] = v29;
      v36[2] = @"rssiExit";
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v26));
      v37[2] = v30;
      v36[3] = @"sc";
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v27));
      v37[3] = v31;
      CFTypeID v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  4LL));
      double v23 = (void *)objc_claimAutoreleasedReturnValue( +[SFProximityEstimator proximityEstimatorWithProximityInfo:]( &OBJC_CLASS___SFProximityEstimator,  "proximityEstimatorWithProximityInfo:",  v32));

      unsigned int v22 = v35;
      [v4 setCloseProximityEstimatorMedium:v23];
    }

    unsigned int v33 = [v23 updateWithSFBLEDevice:v4] | v22;
  }

  else
  {
    if (dword_100643B70 <= 90
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _bleProximityUpdateDeviceCloseNearbyActionDevice:]",  90LL,  "### No ble proximity info found for %@\n",  v3);
    }

    unsigned int v33 = 0;
  }

  return v33;
}

- (unsigned)_bleProximityUpdateNearbyActionDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 setupProximityEstimator]);
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "bleProximityEstimatorForActionType:device:",  objc_msgSend(v4, "deviceActionType"),  v4));

    if (!v6)
    {
      unsigned int v8 = 0;
      goto LABEL_9;
    }

    [v5 setSetupProximityEstimator:v6];
  }

  unsigned int v8 = [v6 updateWithSFBLEDevice:v5];
  if ((v8 & 2) != 0) {
    objc_msgSend(v4, "setDistance:", objc_msgSend(v5, "distance"));
  }
  if (([v4 deviceFlags] & 0x200) != 0) {
    v8 |= -[SDNearbyAgent _bleProximityUpdateDeviceCloseNearbyActionDevice:]( self,  "_bleProximityUpdateDeviceCloseNearbyActionDevice:",  v4);
  }
LABEL_9:

  return v8;
}

- (unsigned)_bleProximityUpdateNearbyInfoDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 infoProximityEstimator]);
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDNearbyAgent bleProximityInfoForType:device:]( self,  "bleProximityInfoForType:device:",  @"info",  v4));
    if (!v7
      || (uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SFProximityEstimator proximityEstimatorWithProximityInfo:]( &OBJC_CLASS___SFProximityEstimator,  "proximityEstimatorWithProximityInfo:",  v7))) == 0)
    {

      unsigned int v9 = 0;
      unsigned __int8 v6 = 0LL;
      goto LABEL_8;
    }

    unsigned __int8 v6 = (void *)v8;
    [v5 setInfoProximityEstimator:v8];
  }

  unsigned int v9 = [v6 updateWithSFBLEDevice:v5];
  if ((v9 & 2) != 0) {
    objc_msgSend(v4, "setDistance:", objc_msgSend(v5, "distance"));
  }
LABEL_8:

  return v9;
}

- (void)_registerForWombatActivityNotification
{
  if (self->_wombatActivityToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10015D184;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.wombat-activity", &self->_wombatActivityToken, dispatchQueue, handler);
  }

- (void)_unregisterForWombatActivityNotification
{
  int wombatActivityToken = self->_wombatActivityToken;
  if (wombatActivityToken != -1)
  {
    notify_cancel(wombatActivityToken);
    self->_int wombatActivityToken = -1;
  }

- (void)_discoverySessionStateChange:(BOOL)a3
{
  BOOL inDiscoverySession = self->_inDiscoverySession;
  if (inDiscoverySession != a3)
  {
    BOOL v4 = a3;
    id v5 = self;
    if (dword_100643B70 <= 30)
    {
      if (dword_100643B70 != -1)
      {
LABEL_4:
        unsigned __int8 v6 = "yes";
        if (inDiscoverySession) {
          uint64_t v7 = "yes";
        }
        else {
          uint64_t v7 = "no";
        }
        if (!v4) {
          unsigned __int8 v6 = "no";
        }
        self = (SDNearbyAgent *)LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _discoverySessionStateChange:]",  30LL,  "Discovery session state changed %s -> %s\n",  v7,  v6);
        goto LABEL_11;
      }

      self = (SDNearbyAgent *)_LogCategory_Initialize(&dword_100643B70, 30LL);
      if ((_DWORD)self)
      {
        BOOL inDiscoverySession = v5->_inDiscoverySession;
        goto LABEL_4;
      }
    }

- (void)_cancelDonStateRetryTimers
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_donStateRetryTimerDictionary, "allKeys", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        unsigned int v9 = (dispatch_source_s *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_donStateRetryTimerDictionary,  "objectForKeyedSubscript:",  v8));
        uint64_t v10 = v9;
        if (v9)
        {
          dispatch_source_cancel(v9);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_donStateRetryTimerDictionary,  "setObject:forKeyedSubscript:",  0LL,  v8);
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

- (void)_deliverDonnedEventToDevice:(id)a3 allowRetry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  -[RPCompanionLinkClient setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[RPCompanionLinkClient setUseCase:](v7, "setUseCase:", 131100LL);
  -[RPCompanionLinkClient setControlFlags:](v7, "setControlFlags:", 6291712LL);
  -[RPCompanionLinkClient setDestinationDevice:](v7, "setDestinationDevice:", v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10015D524;
  v10[3] = &unk_1005CFC20;
  BOOL v14 = a4;
  __int128 v11 = v7;
  id v12 = v6;
  __int128 v13 = self;
  id v8 = v6;
  unsigned int v9 = v7;
  -[RPCompanionLinkClient activateWithCompletion:](v9, "activateWithCompletion:", v10);
}

- (void)_deliverDonnedEventsStart
{
  if (-[SDNearbyAgent _idsWatchCount](self, "_idsWatchCount") >= 1)
  {
    activeWatchDiscovery = self->_activeWatchDiscovery;
    if (activeWatchDiscovery) {
      -[RPCompanionLinkClient invalidate](activeWatchDiscovery, "invalidate");
    }
    id v4 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    id v5 = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = v4;

    -[RPCompanionLinkClient setControlFlags:](self->_activeWatchDiscovery, "setControlFlags:", 2LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10015DA38;
    v9[3] = &unk_1005CC598;
    v9[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_activeWatchDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10015DB2C;
    v8[3] = &unk_1005CC598;
    v8[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_activeWatchDiscovery, "setDeviceLostHandler:", v8);
    id v6 = self->_activeWatchDiscovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10015DB7C;
    v7[3] = &unk_1005CB3E8;
    v7[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }

- (void)_deliverDoffedEvent
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_deliveredDonnedIdentifiers, "allObjects"));
  id v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v6);
        id v8 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
        -[RPCompanionLinkClient setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
        -[RPCompanionLinkClient setUseCase:](v8, "setUseCase:", 131100LL);
        -[RPCompanionLinkClient setControlFlags:](v8, "setControlFlags:", 6291712LL);
        unsigned int v9 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        -[RPCompanionLinkDevice setIdentifier:](v9, "setIdentifier:", v7);
        -[RPCompanionLinkClient setDestinationDevice:](v8, "setDestinationDevice:", v9);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10015DDF0;
        v13[3] = &unk_1005CFC48;
        BOOL v14 = v8;
        uint64_t v15 = v7;
        uint64_t v16 = self;
        id v17 = v9;
        uint64_t v10 = v9;
        __int128 v11 = v8;
        -[RPCompanionLinkClient activateWithCompletion:](v11, "activateWithCompletion:", v13);

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }
}

- (void)_handleRetryTimerForDevice:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
  uint64_t v5 = (dispatch_source_s *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_donStateRetryTimerDictionary,  "objectForKeyedSubscript:",  v4));
  id v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_donStateRetryTimerDictionary,  "setObject:forKeyedSubscript:",  0LL,  v4);
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _handleRetryTimerForDevice:]",  30LL,  "Retrying to send DONNED state to %@\n",  v7);
  }
  -[SDNearbyAgent _deliverDonnedEventToDevice:allowRetry:](self, "_deliverDonnedEventToDevice:allowRetry:", v7, 0LL);
}

- (void)_invalidateWatchDiscoveryIfNeeded
{
  if (!-[NSMutableSet count](self->_deliveredDonnedIdentifiers, "count"))
  {
    -[RPCompanionLinkClient invalidate](self->_activeWatchDiscovery, "invalidate");
    activeWatchDiscovery = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = 0LL;
  }

- (BOOL)_shouldDeliverDonStateUpdates
{
  return GestaltGetDeviceClass(self, a2) == 11 || self->_simulateDonStateChanges;
}

- (void)_updateDonState
{
  else {
    -[SDNearbyAgent _deliverDoffedEvent](self, "_deliverDoffedEvent");
  }
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v18 = a4;
  id v8 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:"));
    if (v9)
    {
      id v10 = (id)v9;
      if (v8)
      {
        if (dword_100643B70 <= 50
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]",  50LL,  "### Connect to existing %@ failed %@\n",  v18,  v8);
        }
      }

      else if (dword_100643B70 <= 30 {
             && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      }
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]",  30LL,  "Connect to existing %@ succeeded\n",  v18);
      }
    }

    else if (v8)
    {
      if (dword_100643B70 <= 50
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]",  50LL,  "### Connect to new %@ failed %@\n",  v18,  v8);
      }

      id v10 = 0LL;
    }

    else
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]",  30LL,  "Connect to new %@ succeeded\n",  v18);
      }

      __int128 v11 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
      -[SFBLEDevice setIdentifier:](v11, "setIdentifier:", v18);
      id v10 = [[SFBLEConnection alloc] initWithDevice:v11 acceptor:1];
      [v10 setDispatchQueue:self->_dispatchQueue];
      bleConnections = self->_bleConnections;
      if (!bleConnections)
      {
        __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        BOOL v14 = self->_bleConnections;
        self->_bleConnections = v13;

        bleConnections = self->_bleConnections;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v10, v18);
      [v10 addClient:self];
      [v10 activateDirect];
    }

    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = v15;
    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v8,  @"SDBluetoothNotificationKeyError");
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v18,  @"SDBluetoothNotificationKeyPeerIdentifier");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 postNotificationName:@"SDNotificationNameNearbyBLEConnected" object:self userInfo:v16];
  }

  else if (dword_100643B70 <= 60 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]",  60LL,  "### DidConnect with NULL peer, error %@\n",  v8);
  }
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]",  50LL,  "### Disconnect from %@, error %@\n",  v7,  v8);
    }
  }

  else if (dword_100643B70 <= 30 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]",  30LL,  "Disconnect from %@ success\n",  v7);
  }

  id v54 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7));
  id v10 = v9;
  if (v9 && ([v9 removeClient:self] & 1) == 0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v7);
    [v10 invalidate];
  }

  uint64_t v51 = v10;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_setupSessions, "allKeys"));
  id v12 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v64 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setupSessions,  "objectForKeyedSubscript:",  v16));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 peerIdentifier]);
        unsigned int v19 = [v18 isEqual:v7];

        if (v19)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]",  30LL,  "Removing session %@ on disconnect from peer %@\n",  v16,  v7);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_setupSessions, "removeObjectForKey:", v16);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }

    while (v13);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = self->_services;
  id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v72,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_services,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v59 + 1) + 8LL * (void)j)));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 peerDisconnectedHandler]);

        if (v25)
        {
          uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v24 peerDisconnectedHandler]);
          ((void (**)(void, id, id))v26)[2](v26, v7, v54);
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v24 errorHandler]);

        if (v27)
        {
          int v28 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v24 errorHandler]);
          NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
          CFTypeID v29 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960543LL, 0LL, 0LL));
          uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
          uint64_t v31 = (void *)v30;
          CFTypeID v32 = @"?";
          if (v30) {
            CFTypeID v32 = (const __CFString *)v30;
          }
          id v71 = v32;
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
          id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6753LL,  v33));
          ((void (**)(void, void *))v28)[2](v28, v34);
        }
      }

      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v72,  16LL);
    }

    while (v21);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  CFTypeID v53 = self->_sessions;
  id v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v55,  v69,  16LL);
  uint64_t v36 = v54;
  if (v35)
  {
    id v37 = v35;
    uint64_t v38 = *(void *)v56;
    do
    {
      for (k = 0LL; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(v53);
        }
        unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessions,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)k)));
        CFTypeID v41 = (void *)objc_claimAutoreleasedReturnValue([v40 peerDevice]);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);

        if ([v42 isEqual:v7])
        {
          NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
          char v68 = @"kConnectionErr";
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
          id v44 = [v43 mutableCopy];

          if (v36) {
            [v44 setObject:v36 forKeyedSubscript:NSUnderlyingErrorKey];
          }
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6753LL,  v44));
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v40 errorHandler]);

          if (v46)
          {
            CFTypeID v47 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v40 errorHandler]);
            ((void (**)(void, void *))v47)[2](v47, v45);
          }

          uint64_t v36 = v54;
        }
      }

      id v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v55,  v69,  16LL);
    }

    while (v37);
  }

  uint64_t v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  char v49 = v48;
  if (v36) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v36,  @"SDBluetoothNotificationKeyError");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v7,  @"SDBluetoothNotificationKeyPeerIdentifier");
  CFTypeID v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v50 postNotificationName:@"SDNotificationNameNearbyBLEDisconnected" object:self userInfo:v49];
}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]",  30,  "Received data from %@: %'.32@ (%ld bytes)\n",  v7,  v10,  [v10 length]);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      -[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:](self, "_bleNearbyInfoReceivedData:cnx:peer:", v10, v8, v7);
    }

    else if (dword_100643B70 <= 50 {
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    }
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]",  50LL,  "### No connection for received data from %@\n",  v7);
    }
  }

  else if (dword_100643B70 <= 60 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]",  60LL,  "### DidReceiveData with NULL peer\n");
  }
}

- (void)nearbyDidUpdateState:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unint64_t v6 = (unint64_t)[v5 state];

  if (dword_100643B70 <= 40 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
  {
    if (v6 > 5) {
      id v7 = "?";
    }
    else {
      id v7 = off_1005D0598[v6];
    }
    LogPrintF(&dword_100643B70, "-[SDNearbyAgent nearbyDidUpdateState:]", 40LL, "Bluetooth state updated: %s\n", v7);
  }

  sessions = self->_sessions;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015EE68;
  v9[3] = &unk_1005CFC68;
  v9[4] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v9);
}

- (void)coordinatedAlertRequestStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 50)
  {
    if (dword_100643B70 != -1 || (uint64_t v5 = _LogCategory_Initialize(&dword_100643B70, 50LL), (_DWORD)v5)) {
      uint64_t v5 = LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: start\n");
    }
  }

  if (!self->_caEnabled)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: skipping when disabled\n");
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v12 = 0LL;
    unsigned int v42 = 1;
    if (!v9) {
      goto LABEL_51;
    }
LABEL_50:
    id v21 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v4 completionHandler]);
    v21[2](v21, 0LL, 1LL, 0LL);

    uint64_t v8 = v10;
    uint64_t v12 = v11;
    goto LABEL_51;
  }

  int DeviceClass = GestaltGetDeviceClass(v5, v6);
  uint64_t v8 = 1LL;
  if ([v4 type] != (id)6) {
    goto LABEL_39;
  }
  if (DeviceClass != 1 && DeviceClass != 100)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: skipping Oneness coordinated alert on unsupported platform.\n");
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    if (v8)
    {
      id v13 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v4 completionHandler]);
      v13[2](v13, 0LL, 0LL, 0LL);

      uint64_t v8 = 0LL;
    }
  }

  if (DeviceClass == 100 || DeviceClass == 1)
  {
LABEL_39:
    if (!self->_caSingleDevice
      && (!-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn")
       || -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount") <= 0))
    {
      if (dword_100643B70 <= 50
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: always alerting when no other devices registered\n");
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      unsigned int v42 = 0;
      uint64_t v8 = 0LL;
      uint64_t v12 = 0LL;
      if (!v20) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }

  if (!(_DWORD)v8)
  {
    uint64_t v12 = 0LL;
    unsigned int v42 = 0;
LABEL_51:
    if ([v4 type] != (id)1)
    {
LABEL_54:
      v43[0] = @"eventType";
      CFTypeID v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 type]));
      v44[0] = v41;
      v43[1] = @"activityLevel";
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v42));
      v44[1] = v25;
      v44[2] = &off_1005F7D50;
      v43[2] = @"otherDevicesCount";
      v43[3] = @"bestIsMe";
      v44[3] = &__kCFBooleanTrue;
      v43[4] = @"skipScanBcPhoneCall";
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      v44[4] = v26;
      v43[5] = @"skipScanBcVeryActive";
      uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      int v28 = v12;
      CFTypeID v29 = v4;
      int v30 = v8;
      uint64_t v31 = (void *)v27;
      v44[5] = v27;
      v43[6] = @"MsgScans";
      CFTypeID v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_caMessageScans));
      v44[6] = v32;
      v43[7] = @"MsgNoScans";
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_caMessageNoScans));
      v44[7] = v33;
      id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  8LL));
      SFMetricsLog(@"com.apple.sharing.Coordinated.AlertResult", v34);

      int v35 = v30;
      id v4 = v29;

      if (dword_100643B70 <= 50
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50,  "CA: Start, type %ld, level %d, devices %d, best %d, skipP %d, skipA %d, scans %u, noScans %u",  [v29 type],  v42,  -1,  1,  v35,  v28,  self->_caMessageScans,  self->_caMessageNoScans);
      }

      goto LABEL_58;
    }

    char v18 = 0;
    uint64_t caMessageNoScans = self->_caMessageNoScans + 1;
    self->_uint64_t caMessageNoScans = caMessageNoScans;
LABEL_53:
    v45[0] = @"noScans";
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  caMessageNoScans));
    v45[1] = @"scans";
    v46[0] = v22;
    double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_caMessageScans));
    v46[1] = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
    SFPowerLogEvent(@"CoordinatedAlertiMessage", v24);

    if ((v18 & 1) != 0) {
      goto LABEL_58;
    }
    goto LABEL_54;
  }

  if (!self->_caPhoneCalls
    && [v4 type] == (id)2
    && ((SFIsDevicePhone() & 1) != 0 || SFDeviceIsRealityDevice()))
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: always alerting for phone calls\n");
    }

    unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    uint64_t v11 = 0LL;
    unsigned int v42 = 0;
    uint64_t v12 = 0LL;
    uint64_t v10 = 1LL;
    uint64_t v8 = 1LL;
    if (!v40) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  if (self->_caScanIfVeryActive)
  {
    unsigned int v42 = 0;
    goto LABEL_34;
  }

  unsigned int v42 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:]( self,  "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:",  0LL,  0LL);
  if (-[SDNearbyAgent _idsVisionOS2OrHigherCount](self, "_idsVisionOS2OrHigherCount") < 1)
  {
    BOOL caScanIfHasVisionOS1 = 0;
  }

  else if (-[SDNearbyAgent _idsVisionOS1Count](self, "_idsVisionOS1Count"))
  {
    BOOL caScanIfHasVisionOS1 = self->_caScanIfHasVisionOS1;
  }

  else
  {
    BOOL caScanIfHasVisionOS1 = 1;
  }

  unsigned __int8 v36 = -[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags");
  id v37 = [v4 type];
  BOOL v38 = (v36 & 1) == 0 && caScanIfHasVisionOS1;
  if (v37 != (id)2) {
    BOOL v38 = 0;
  }
  if (v42 != 14) {
    BOOL v38 = 0;
  }
  if (v42 >= 0xB && !v38)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: skipping when very active\n");
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    uint64_t v10 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v11 = 1LL;
    uint64_t v12 = 1LL;
    if (!v39) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  if (v38)
  {
    if (dword_100643B70 <= 50
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestStart:]",  50LL,  "CoordinatedAlert: scanning due to visionOS 2.0 or above on account\n");
    }

    unsigned int v42 = 14;
  }

- (void)coordinatedAlertRequestFinish:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v64 = v4;
  if ([v4 type] == (id)1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForiMessage](self, "_idsBluetoothDeviceIDsForiMessage"));
    goto LABEL_9;
  }

  if ([v4 type] == (id)3)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSMSRelay](self, "_idsBluetoothDeviceIDsForSMSRelay"));
    goto LABEL_9;
  }

  if ([v4 type] == (id)4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForAnnouncements](self, "_idsBluetoothDeviceIDsForAnnouncements"));
    goto LABEL_9;
  }

  if ([v4 type] == (id)6)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForOneness](self, "_idsBluetoothDeviceIDsForOneness"));
LABEL_9:
    uint64_t v6 = (void *)v5;
    if (v5) {
      goto LABEL_11;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](self, "_idsBluetoothDeviceIDsForSharing"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

  id v4 = v64;
LABEL_11:
  uint64_t v8 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:]( self,  "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:",  0LL,  0LL);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  uint64_t v9 = self->_bleNearbyInfoDevices;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v69,  v75,  16LL);
  uint64_t v67 = v8;
  char v68 = v6;
  if (v10)
  {
    id v11 = v10;
    id obj = v9;
    char v12 = 0;
    uint64_t v61 = (char)v8;
    char v62 = 1;
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v70;
    uint64_t v59 = v13;
    uint64_t v60 = v13;
    while (1)
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v70 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleNearbyInfoDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v69 + 1) + 8LL * (void)v15)));
        else {
          id v17 = [v16 decryptedActivityLevel];
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 identifier]);
        unsigned int v19 = (void *)v18;
        if (!v6 || v18 && ([v6 containsObject:v18] & 1) != 0)
        {
          if ((_DWORD)v17 == 14)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue( -[SDNearbyAgent idsDeviceForBluetoothDeviceID:conflictDetected:]( self,  "idsDeviceForBluetoothDeviceID:conflictDetected:",  v19,  0LL));
            id v21 = v20;
            if (v20)
            {
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 productName]);
              unsigned int v23 = [v22 isEqualToString:@"xrOS"];

              if (v23)
              {
                id v4 = v64;
                if (dword_100643B70 <= 50
                  && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
                {
                  LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestFinish:]",  50LL,  "CoordinatedAlert finish: device %@ is visionOS and activity level 0x%02X (%s) indicates it is donned\n",  v19,  14LL,  "PhoneCall",  v57,  v58);
                }

                goto LABEL_91;
              }

              id v4 = v64;
            }
          }

          else
          {
            id v21 = 0LL;
          }

          if ([v4 type] != (id)6 || (_DWORD)v17 != (_DWORD)v67) {
            goto LABEL_53;
          }
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 modelIdentifier]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lowercaseString]);

          id DeviceClass = (id)GestaltGetDeviceClass(v28, v29);
          if ((_DWORD)DeviceClass == 100
            && (id DeviceClass = [v27 containsString:@"iphone"], (_DWORD)DeviceClass))
          {
            if (dword_100643B70 <= 50
              && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
            {
              CFTypeID v32 = "?";
              LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestFinish:]",  50LL,  "CoordinatedAlert finish: Oneness phone %@ activity level 0x%02X (%s) equals local mac activity level.\n",  v19,  v17,  v32);
            }

            char v62 = 0;
            int v39 = 2;
          }

          else
          {
            if (GestaltGetDeviceClass(DeviceClass, v31) != 1
              || ([v27 containsString:@"mac"] & 1) == 0
              && ![v27 containsString:@"imac"])
            {

              id v4 = v64;
LABEL_53:
              if (v17 <= 9)
              {
                if (dword_100643B70 <= 50
                  && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
                {
                  LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestFinish:]",  50LL,  "CoordinatedAlert finish: device %@ activity level too low: 0x%02X (%s)\n",  v19,  v17,  off_1005D0600[(char)v17]);
                }

                goto LABEL_83;
              }

              if (v17 <= v67)
              {
                if (dword_100643B70 <= 50
                  && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
                {
                  id v37 = "?";
                  BOOL v38 = "?";
                  __int128 v58 = v38;
                  uint64_t v57 = v60;
                  LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestFinish:]",  50LL,  "CoordinatedAlert finish: device %@ activity level 0x%02X (%s) is lower than ours 0x%02X (%s)\n",  v19,  v17,  v37);
                }
              }

              else
              {
                unsigned int v34 = (_DWORD)v17 - 10;
                if ((_DWORD)v17 != 10
                  || (-[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags") & 1) == 0)
                {
                  if (dword_100643B70 <= 50
                    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
                  {
                    int v35 = "?";
                    if (v34 <= 4) {
                      int v35 = off_1005D0650[(char)v34];
                    }
                    unsigned __int8 v36 = "?";
                    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent coordinatedAlertRequestFinish:]",  50LL,  "CoordinatedAlert finish: device %@ activity level 0x%02X (%s) is higher than ours 0x%02X (%s)\n",  v19,  v17,  v35,  v59,  v36);
                  }

- (void)coordinatedAlertRequestCancel:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[NSMutableSet removeObject:](self->_caRequests, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_caRequestsNoScans, "removeObject:", v5);

  -[SDNearbyAgent _update](self, "_update");
}

- (BOOL)isWifiCritical
{
  return -[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical");
}

- (void)_enableEnhancedDiscovery:(id)a3
{
}

- (void)_enableEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    enhancedDiscoveryUseCases = self->_enhancedDiscoveryUseCases;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    -[NSMutableSet addObject:](enhancedDiscoveryUseCases, "addObject:", v8);
  }

  else if (-[SDNearbyAgent isWifiCritical](self, "isWifiCritical"))
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _enableEnhancedDiscovery:useCase:]",  30LL,  "Skip enhanced discovery, WiFi is critical\n");
    }
  }

  else
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      if ((int)v4 >= 0x20000)
      {
        if ((int)v4 >= 327680)
        {
          if ((int)v4 > 589824)
          {
            if ((int)v4 <= 2147418111)
            {
              switch((_DWORD)v4)
              {
                case 0x90001:
                  uint64_t v9 = "FindNearbyPencil";
                  break;
                case 0xA0000:
                  uint64_t v9 = "AccessDigitalHomeKey";
                  break;
                case 0xC0000:
                  uint64_t v9 = "ProxControlDeviceClose";
                  break;
                default:
LABEL_127:
                  uint64_t v9 = "?";
                  break;
              }
            }

            else
            {
              switch((int)v4)
              {
                case 2147418112:
                  uint64_t v9 = "InternalTestNoLockScan";
                  break;
                case 2147418113:
                  uint64_t v9 = "InternalTestNoScreenOffScan";
                  break;
                case 2147418114:
                  uint64_t v9 = "InternalTestScanWithNoDups";
                  break;
                case 2147418115:
                  uint64_t v9 = "InternalTestScanWithDups";
                  break;
                case 2147418116:
                  uint64_t v9 = "InternalTestScanFor20Seconds";
                  break;
                case 2147418117:
                  uint64_t v9 = "InternalTestActiveScan";
                  break;
                case 2147418118:
                  uint64_t v9 = "InternalTestUUIDScan";
                  break;
                case 2147418119:
                  uint64_t v9 = "InternalTestScanFor10ClockSeconds";
                  break;
                case 2147418120:
                  uint64_t v9 = "InternalTestScanBoost";
                  break;
                default:
                  goto LABEL_127;
              }
            }
          }

          else if ((int)v4 > 458752)
          {
            switch((int)v4)
            {
              case 524288:
                uint64_t v9 = "ADPD";
                break;
              case 524289:
                uint64_t v9 = "ADPDBuffer";
                break;
              case 524290:
                uint64_t v9 = "MicroLocation";
                break;
              case 524291:
                uint64_t v9 = "MicroLocationLeech";
                break;
              default:
                if ((_DWORD)v4 == 458753)
                {
                  uint64_t v9 = "PrecisionFindingFindee";
                }

                else
                {
                  if ((_DWORD)v4 != 589824) {
                    goto LABEL_127;
                  }
                  uint64_t v9 = "FindNearbyRemote";
                }

                break;
            }
          }

          else
          {
            switch((int)v4)
            {
              case 393216:
                uint64_t v9 = "CaptiveNetworkJoin";
                break;
              case 393217:
                uint64_t v9 = "UseCaseSIMTransfer";
                break;
              case 393218:
                uint64_t v9 = "MacSetup";
                break;
              case 393219:
                uint64_t v9 = "AppleIDSignIn";
                break;
              case 393220:
                uint64_t v9 = "AppleIDSignInSettings";
                break;
              default:
                if ((_DWORD)v4 == 327680)
                {
                  uint64_t v9 = "RapportThirdParty";
                }

                else
                {
                  if ((_DWORD)v4 != 458752) {
                    goto LABEL_127;
                  }
                  uint64_t v9 = "PrecisionFindingFinder";
                }

                break;
            }
          }
        }

        else
        {
          switch((int)v4)
          {
            case 131072:
              uint64_t v9 = "SharingDefault";
              break;
            case 131073:
              uint64_t v9 = "SharingPhoneAutoUnlock";
              break;
            case 131074:
              uint64_t v9 = "SharingSiriWatchAuth";
              break;
            case 131075:
              uint64_t v9 = "SharingMacAutoUnlock";
              break;
            case 131076:
              uint64_t v9 = "SharingEDTScreenOn";
              break;
            case 131077:
              uint64_t v9 = "SharingEDTWiFiDisabled";
              break;
            case 131078:
              uint64_t v9 = "SharingEDTWombatEligibleAsDefaultCamera";
              break;
            case 131079:
              uint64_t v9 = "SharingEDTWombatCameraPicker";
              break;
            case 131080:
              uint64_t v9 = "SharingWombatBackground";
              break;
            case 131081:
              uint64_t v9 = "SharingUniversalControl";
              break;
            case 131082:
              uint64_t v9 = "SharingPeopleProximity";
              break;
            case 131083:
              uint64_t v9 = "SharingEDTEnsembleOpenDisplayPrefs";
              break;
            case 131084:
              uint64_t v9 = "SharingEDTNearbydMotionStopped";
              break;
            case 131085:
              uint64_t v9 = "SharingDoubleBoostGenericScan";
              break;
            case 131086:
              uint64_t v9 = "SharingEDTIncomingAdvertisement ";
              break;
            case 131087:
              uint64_t v9 = "SharingEDTWombatStreamStart";
              break;
            case 131088:
              uint64_t v9 = "SharingOYAutoUnlock";
              break;
            case 131089:
              goto LABEL_127;
            case 131090:
              uint64_t v9 = "SharingAirDrop";
              break;
            case 131091:
              uint64_t v9 = "SharingNearbyInvitationHost";
              break;
            case 131092:
              uint64_t v9 = "SharingNearbyInvitationParticipant";
              break;
            case 131093:
              uint64_t v9 = "SharingAirDropAskToAirDrop";
              break;
            case 131094:
              uint64_t v9 = "SharingAirDropTempIdentity";
              break;
            case 131095:
              uint64_t v9 = "SharingAirDropNeedsCLink";
              break;
            case 131096:
              uint64_t v9 = "SharingRemoteWidgetUpdate";
              break;
            case 131097:
              uint64_t v9 = "SharingCountryCodeUpdate";
              break;
            case 131098:
              uint64_t v9 = "SharingMacPhoneAutoUnlock";
              break;
            case 131099:
              uint64_t v9 = "SharingVisionProDiscovery";
              break;
            case 131100:
              uint64_t v9 = "SharingVisionProStateChange";
              break;
            case 131101:
              uint64_t v9 = "SharingContinuityScreen";
              break;
            case 131102:
              uint64_t v9 = "SharingEDTRemoteDisplay";
              break;
            default:
              if ((_DWORD)v4 == 196608)
              {
                uint64_t v9 = "DigitalIDTSA";
              }

              else
              {
                if ((_DWORD)v4 != 0x40000) {
                  goto LABEL_127;
                }
                uint64_t v9 = "DigitalCarKeyThirdParty";
              }

              break;
          }
        }
      }

      else
      {
        uint64_t v9 = "Unspecified";
        switch((int)v4)
        {
          case 0:
            break;
          case 1:
            uint64_t v9 = "HealthKit";
            break;
          case 2:
            uint64_t v9 = "HomeKit";
            break;
          case 3:
            uint64_t v9 = "FindMyObjectConnection";
            break;
          case 4:
            uint64_t v9 = "FindMyObjectConnectionTransient";
            break;
          case 5:
            uint64_t v9 = "MIDI";
            break;
          case 6:
            uint64_t v9 = "Continuity";
            break;
          case 7:
            uint64_t v9 = "InstantHotSpot";
            break;
          case 8:
            uint64_t v9 = "NearBy";
            break;
          case 9:
            uint64_t v9 = "Sharing";
            break;
          case 10:
            uint64_t v9 = "HearingSupport";
            break;
          case 11:
            uint64_t v9 = "Magnet";
            break;
          case 12:
            uint64_t v9 = "HID";
            break;
          case 13:
            uint64_t v9 = "LEA";
            break;
          case 14:
            uint64_t v9 = "External";
            break;
          case 15:
            uint64_t v9 = "ExternalMedical";
            break;
          case 16:
            uint64_t v9 = "ExternalLock";
            break;
          case 17:
            uint64_t v9 = "ExternalWatch";
            break;
          case 18:
            uint64_t v9 = "SmartRouting";
            break;
          case 19:
            uint64_t v9 = "DigitalID";
            break;
          case 20:
            uint64_t v9 = "DigitalKey";
            break;
          case 21:
            uint64_t v9 = "DigitalCarKey";
            break;
          case 22:
            uint64_t v9 = "HeySiri";
            break;
          case 23:
            uint64_t v9 = "ThirdPartyApp";
            break;
          case 24:
            uint64_t v9 = "CNJ";
            break;
          default:
            switch((int)v4)
            {
              case 256:
                uint64_t v9 = "DevicePresenceDetection";
                break;
              case 257:
                uint64_t v9 = "AudioBox";
                break;
              case 258:
                uint64_t v9 = "SIMTransfer";
                break;
              case 259:
                uint64_t v9 = "ProximityScreenOnLeechScan";
                break;
              case 260:
                uint64_t v9 = "MacMigrate";
                break;
              case 263:
                uint64_t v9 = "HIDUARTService";
                break;
              case 264:
                uint64_t v9 = "AccessibilitySwitchControlPairing";
                break;
              case 265:
                uint64_t v9 = "BaseBandFastConnect";
                break;
              case 266:
                uint64_t v9 = "SafetyAlerts";
                break;
              case 267:
                uint64_t v9 = "LECarPlay";
                break;
              case 268:
                uint64_t v9 = "TCCBluetooth";
                break;
              case 269:
                uint64_t v9 = "AOPBufferLeech";
                break;
              default:
                goto LABEL_127;
            }

            break;
        }
      }

      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _enableEnhancedDiscovery:useCase:]",  30LL,  "Enable enhanced discovery for reason '%@' use case '%s' (0x%x)\n",  v6,  v9,  v4);
    }

    self->_BOOL enhancedDiscoveryShouldRun = 1;
    self->_enhancedDiscoveryAdvActive = 1;
    id v10 = self->_enhancedDiscoveryUseCases;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    -[NSMutableSet addObject:](v10, "addObject:", v11);

    v19[0] = v6;
    v18[0] = @"Reason";
    v18[1] = @"Enabled";
    char v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_enhancedDiscoveryShouldRun));
    v19[1] = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
    SFPowerLogEvent(@"EnhancedDiscovery", v13);

    if (!self->_enhancedDiscoveryTimer)
    {
      uint64_t v14 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = v14;

      uint64_t v16 = self->_enhancedDiscoveryTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100160CE8;
      handler[3] = &unk_1005CB2F8;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v16, handler);
      SFDispatchTimerSet(self->_enhancedDiscoveryTimer, 5.0, -1.0, -10.0);
      dispatch_resume((dispatch_object_t)self->_enhancedDiscoveryTimer);
    }
  }
}

- (void)_disableEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _disableEnhancedDiscovery:]",  30LL,  "Disable enhanced discovery for reason: %@\n",  v4);
    }

    self->_BOOL enhancedDiscoveryShouldRun = 0;
    self->_enhancedDiscoveryAdvActive = 0;
    -[NSMutableSet removeAllObjects](self->_enhancedDiscoveryUseCases, "removeAllObjects");
    enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
    if (enhancedDiscoveryTimer)
    {
      id v6 = enhancedDiscoveryTimer;
      dispatch_source_cancel(v6);
      id v7 = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = 0LL;
    }

    v10[1] = @"Enabled";
    v11[0] = v4;
    v10[0] = @"Reason";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_enhancedDiscoveryShouldRun));
    v11[1] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
    SFPowerLogEvent(@"EnhancedDiscovery", v9);
  }
}

- (void)_enhancedDiscoveryScreenChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (!v3)
    {
      -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", @"ScreenOff");
      return;
    }

    -[SDNearbyAgent _activityMonitorLastUserEventDelta](self, "_activityMonitorLastUserEventDelta");
    double v6 = v5;
    BOOL v7 = v5 < 5.0 && v5 > 0.0;
    if (dword_100643B70 <= 20
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
    {
      uint64_t v8 = "no";
      if (v7) {
        uint64_t v8 = "yes";
      }
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _enhancedDiscoveryScreenChange:]",  20LL,  "Checking user interaction last user=%.2f, within leeway=%s\n",  v6,  v8);
    }

    if (v7)
    {
      if (-[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical"))
      {
        if (dword_100643B70 <= 40
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
        {
          uint64_t v9 = "Skip enhanced discovery, wireless is critical\n";
LABEL_26:
          LogPrintF(&dword_100643B70, "-[SDNearbyAgent _enhancedDiscoveryScreenChange:]", 40LL, v9);
        }
      }

      else
      {
        if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:]( self,  "_enableEnhancedDiscovery:useCase:",  @"UserInitiatedScreenOn",  131076LL);
          return;
        }

        if (dword_100643B70 <= 40
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
        {
          uint64_t v9 = "Skip enhanced discovery, nearbyinfo advertiser is disabled\n";
          goto LABEL_26;
        }
      }
    }

    else if (dword_100643B70 <= 40 {
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
    }
    {
      uint64_t v9 = "Skip enhanced discovery, not user initiated activity\n";
      goto LABEL_26;
    }
  }

- (int)_allowEnhancedDiscovery
{
  uint64_t allowEnhancedDiscovery = self->_allowEnhancedDiscovery;
  if ((allowEnhancedDiscovery & 0x80000000) != 0)
  {
    uint64_t v4 = SFDeviceClassCodeGet(allowEnhancedDiscovery, a2);
    int v5 = v4;
    uint64_t v7 = SFDeviceClassCodeGet(v4, v6);
    int v8 = v7;
    uint64_t v10 = SFDeviceClassCodeGet(v7, v9);
    int v11 = v10;
    int v13 = SFDeviceClassCodeGet(v10, v12);
    int v43 = v5;
    int v39 = v8;
    int v40 = v11;
    BOOL v17 = v5 == 5 || v8 == 3 || v11 == 1 || v13 == 6;
    BOOL v41 = v17;
    BOOL v42 = self;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v19 = [v18 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v19)
    {
      id v20 = v19;
      int v21 = 0;
      int v44 = 0;
      int v45 = 0;
      int v22 = 0;
      uint64_t v23 = *(void *)v47;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 modelIdentifier]);
          uint64_t v27 = GestaltProductTypeStringToDeviceClass();

          if (v25) {
            [v25 operatingSystemVersion];
          }
          if (DeviceOSVersionAtOrLater(v27, 0LL, 0LL, 0LL, 150400LL, 120300LL, 150400LL, 80500LL))
          {
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 modelIdentifier]);
            unsigned int v29 = [v28 containsString:@"Mac"];

            if (v29)
            {
              ++v21;
            }

            else
            {
              int v30 = (void *)objc_claimAutoreleasedReturnValue([v25 modelIdentifier]);
              unsigned int v31 = [v30 containsString:@"iPad"];

              if (v31)
              {
                ++v44;
              }

              else
              {
                CFTypeID v32 = (void *)objc_claimAutoreleasedReturnValue([v25 modelIdentifier]);
                unsigned int v33 = [v32 containsString:@"iPhone"];

                v45 += v33;
              }
            }
          }

          if (DeviceOSVersionAtOrLater(v27, 0LL, 0LL, 0LL, 170000LL, 140000LL, 170000LL, 100000LL))
          {
            unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v25 modelIdentifier]);
            unsigned int v35 = [v34 containsString:@"AppleTV"];

            v22 += v35;
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }

      while (v20);
    }

    else
    {
      int v21 = 0;
      int v44 = 0;
      int v45 = 0;
      int v22 = 0;
    }

    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _allowEnhancedDiscovery]",  30LL,  "Devices of required software version for enhanced discovery; macCount=%d, iPadCount=%d, iPhoneCount=%d, tvCount=%d\n",
        v21,
        v44,
        v45,
        v22);
    }

    if (v43 != 5 || v21 || v44 || v45)
    {
      if (v40 == 1 || v39 == 3)
      {
        unsigned __int8 v36 = v42;
        int v37 = v41;
        if (!(v21 | v22))
        {
          if (dword_100643B70 <= 40
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _allowEnhancedDiscovery]",  40LL,  "On iOS but no other devices available, disable enhanced discovery\n");
          }

          int v37 = 0;
        }

        if (v42->_inDiscoverySession && (v37 & 1) == 0)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _allowEnhancedDiscovery]",  30LL,  "Enabling enhanced discovery because the device is in a discovery session\n");
          }

          int v37 = 1;
        }
      }

      else
      {
        unsigned __int8 v36 = v42;
        int v37 = v41;
      }
    }

    else if (dword_100643B70 > 40)
    {
      int v37 = 0;
      unsigned __int8 v36 = v42;
    }

    else
    {
      unsigned __int8 v36 = v42;
      if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 40LL)) {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _allowEnhancedDiscovery]",  40LL,  "On Mac but no other devices available, disable enhanced discovery\n");
      }
      int v37 = 0;
    }

    v36->_uint64_t allowEnhancedDiscovery = v37;

    LODWORD(allowEnhancedDiscovery) = v36->_allowEnhancedDiscovery;
  }

  return allowEnhancedDiscovery;
}

- (void)_enhancedDiscoveryTimerFired
{
}

- (BOOL)_deviceCanTriggerEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  if (!self->_enhancedDiscoveryShouldRun
    && -[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery")
    && !-[SDNearbyAgent isWifiCritical](self, "isWifiCritical")
    && [v4 enhancedDiscovery]
    && [v4 paired])
  {
    uint64_t v7 = SFDeviceModel();
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    if ([v9 containsString:@"iPhone"])
    {
      if (([v8 containsString:@"iPhone"] & 1) == 0)
      {
        unsigned __int8 v10 = [v8 containsString:@"Mac"];

        if ((v10 & 1) == 0) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }

    else
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
      if (([v11 containsString:@"Mac"] & 1) == 0)
      {

        goto LABEL_20;
      }

      if (![v8 containsString:@"iPhone"])
      {
        unsigned __int8 v15 = [v8 containsString:@"Mac"];

        if ((v15 & 1) == 0)
        {
LABEL_20:
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
          if ([v12 containsString:@"iPad"])
          {
            if (([v8 containsString:@"iPad"] & 1) == 0)
            {
              unsigned __int8 v13 = [v8 containsString:@"Mac"];

              if ((v13 & 1) == 0) {
                goto LABEL_38;
              }
              goto LABEL_28;
            }

            goto LABEL_27;
          }

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
          if ([v14 containsString:@"Mac"])
          {
            if ([v8 containsString:@"iPad"])
            {

LABEL_27:
LABEL_28:
              if (dword_100643B70 <= 30
                && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
              {
                LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:]",  30LL,  "Device triggered enhanced discovery for Ensemble: %@\n",  v4);
              }

- (void)deviceDiscoveryRequestStart:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100161884;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_deviceDiscoveryRequestStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ddRequests = self->_ddRequests;
  if (!ddRequests)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = self->_ddRequests;
    self->_ddRequests = v6;

    ddRequests = self->_ddRequests;
  }

  -[NSMutableSet addObject:](ddRequests, "addObject:", v4);
  if (([v4 discoveryFlags] & 0x20) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForSharing](self, "idsBluetoothDeviceIDsForSharing"));
LABEL_15:
    id v8 = (void *)v10;
    [v4 setDeviceFilter:v10];
    goto LABEL_16;
  }

  if (([v4 discoveryFlags] & 0x100000) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](self, "_idsBluetoothDeviceIDsForMe"));
    goto LABEL_15;
  }

  if (([v4 discoveryFlags] & 0x200000) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForHomePods](self, "_idsBluetoothDeviceIDsForHomePods"));
    goto LABEL_15;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 approveBluetoothIDs]);
  [v4 setDeviceFilter:v9];

LABEL_16:
LABEL_17:
  CFTypeID v32 = self;
  if (([v4 discoveryFlags] & 0x10) != 0)
  {
    id v12 = -[SFBLEScanner scanState](self->_bleNearbyActionScanner, "scanState");
    self->_ddNearbyActionEnabled = 1;
    Class v11 = (Class)objc_claimAutoreleasedReturnValue([v4 deviceFoundHandler]);

    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v13 = 48LL;
    goto LABEL_35;
  }

  if ([v4 discoveryFlags])
  {
    id v12 = -[SFBLEScanner scanState](self->_bleNearbyInfoScanner, "scanState");
    self->_ddNearbyInfoEnabled = 1;
    Class v11 = (Class)objc_claimAutoreleasedReturnValue([v4 deviceFoundHandler]);

    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v13 = 50LL;
    goto LABEL_35;
  }

  if (([v4 discoveryFlags] & 2) == 0)
  {
    Class v11 = 0LL;
    goto LABEL_39;
  }

  id v12 = -[SFBLEScanner scanState](self->_bleProximityPairingScanner, "scanState");
  if (![v4 rssiThreshold]) {
    [v4 setRssiThreshold:-60];
  }
  self->_ddProximityPairingEnabled = 1;
  Class v11 = (Class)objc_claimAutoreleasedReturnValue([v4 deviceFoundHandler]);

  if (v11)
  {
    uint64_t v13 = 52LL;
LABEL_35:
    Class v11 = (&self->super.isa)[v13];
  }

- (void)deviceDiscoveryRequestStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_ddRequests, "removeObject:", v4);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  BOOL v5 = self->_ddRequests;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (!v6)
  {

    LOBYTE(v12) = 0;
    char v11 = 0;
    LOBYTE(v10) = 0;
    char v16 = 0;
    LOBYTE(v9) = 0;
    goto LABEL_23;
  }

  id v7 = v6;
  id v20 = v4;
  uint64_t v21 = self;
  char v8 = 0;
  int v9 = 0;
  char v22 = 0;
  int v10 = 0;
  char v11 = 0;
  int v12 = 0;
  uint64_t v13 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v5);
      }
      unsigned __int8 v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      if (([v15 discoveryFlags] & 0x10) != 0)
      {
        v9 |= [v15 overrideScreenOff];
        char v8 = 1;
      }

      if ([v15 discoveryFlags])
      {
        v10 |= [v15 overrideScreenOff];
        char v22 = 1;
      }

      if (([v15 discoveryFlags] & 2) != 0)
      {
        v12 |= [v15 overrideScreenOff];
        char v11 = 1;
      }
    }

    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  }

  while (v7);

  if ((v8 & 1) == 0)
  {
    id v4 = v20;
    self = v21;
    char v16 = v22;
LABEL_23:
    self->_ddNearbyActionEnabled = 0;
    -[NSMutableDictionary removeAllObjects](self->_ddNearbyActionDevices, "removeAllObjects");
    ddNearbyActionDevices = self->_ddNearbyActionDevices;
    self->_ddNearbyActionDevices = 0LL;

    self->_ddNearbyActionScreenOff = v9 & 1;
    if ((v16 & 1) != 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  id v4 = v20;
  self = v21;
  v21->_ddNearbyActionScreenOff = v9 & 1;
  if ((v22 & 1) == 0)
  {
LABEL_24:
    self->_ddNearbyInfoEnabled = 0;
    -[NSMutableDictionary removeAllObjects](self->_ddNearbyInfoDevices, "removeAllObjects");
    ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
    self->_ddNearbyInfoDevices = 0LL;
  }

- (void)deviceDiscoveryRequestUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100162068;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)deviceDiscoveryFastScanTrigger:(id)a3 reason:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]( self,  "_deviceDiscoveryFastScanStart:device:reason:",  v8,  0LL,  v7);
}

- (void)deviceDiscoveryFastScanCancel:(id)a3 reason:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v8 setFastScanMode:0];
  -[SDNearbyAgent _deviceDiscoveryFastScanStop:reset:reason:]( self,  "_deviceDiscoveryFastScanStop:reset:reason:",  v8,  1LL,  v7);
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (dword_100643B70 <= 60
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:]",  60LL,  "Deprecated method - applying fallback use case CBUseCaseUnspecified\n");
    }

    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", v5, 0LL);
    -[SDNearbyAgent _update](self, "_update");
  }

  else if (dword_100643B70 <= 30 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:]",  30LL,  "Skip enhanced discovery as the account state does not allow it.\n");
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4 useCase:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v12 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (dword_100643B70 <= 10
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 10LL)))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v12 useCases]);
      id v10 = [v9 count];
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v12 useCases]);
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:]",  10LL,  "Incoming enhanced discovery trigger for reason '%@' with %ld use cases: %@\n",  v8,  v10,  v11);
    }

    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", v8, v5);
    -[SDNearbyAgent _update](self, "_update");
  }

  else if (dword_100643B70 <= 30 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:]",  30LL,  "Skip enhanced discovery as the account state does not allow it.\n");
  }
}

- (void)_deviceDiscoveryFastScanEvaluate:(id)a3 device:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked && [v15 fastScanMode] == (id)2)
  {
    if ([v15 rssiThreshold])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
      if ([v7 rssi])
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
        id v9 = [v8 rssi];
        id v10 = [v15 rssiThreshold];
      }

      else
      {
      }
    }

    unint64_t v11 = (unint64_t)[v15 discoveryFlags];
    if (v11 & 0x20000) != 0 && ([v6 needsAWDL])
    {
      id v12 = @"MatchAWDL";
LABEL_22:
      -[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]( self,  "_deviceDiscoveryFastScanStart:device:reason:",  v15,  v6,  v12);
      goto LABEL_23;
    }

    if (v11 & 0x40) != 0 && ([v6 needsKeyboardOnly])
    {
      id v12 = @"MatchKeyboard";
      goto LABEL_22;
    }

    if ((v11 & 2) != 0)
    {
      id v12 = @"MatchProx";
      goto LABEL_22;
    }

    if ((v11 & 0x601FF80) != 0 && [v6 needsSetup])
    {
      int v13 = [v6 deviceActionType];
      if (v13 > 32)
      {
        if (v13 == 33)
        {
          uint64_t v14 = 0x2000000LL;
        }

        else if (v13 == 36)
        {
          uint64_t v14 = 0x4000000LL;
        }

        else
        {
LABEL_32:
          uint64_t v14 = 0LL;
        }
      }

      else
      {
        switch(v13)
        {
          case 8:
            uint64_t v14 = 2048LL;
            break;
          case 9:
            uint64_t v14 = 512LL;
            break;
          case 10:
          case 12:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            goto LABEL_32;
          case 11:
            uint64_t v14 = 256LL;
            break;
          case 13:
            uint64_t v14 = 1024LL;
            break;
          case 20:
            uint64_t v14 = 0x4000LL;
            break;
          case 21:
            uint64_t v14 = 0x8000LL;
            break;
          default:
            if (v13 != 1) {
              goto LABEL_32;
            }
            uint64_t v14 = 128LL;
            break;
        }
      }

      if ((v14 & v11) != 0)
      {
        id v12 = @"MatchSetup";
        goto LABEL_22;
      }
    }

    else if ((v11 & 0x800000) != 0 && ([v6 deviceFlags] & 0x200) != 0)
    {
      id v12 = @"MatchClose";
      goto LABEL_22;
    }
  }

- (void)_deviceDiscoveryFastScanStart:(id)a3 device:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked)
  {
    uint64_t v11 = mach_absolute_time();
    if ((unint64_t)UpTicksToSeconds(v11 - self->_ddFastScanLastEndTicks) > 0x63)
    {
      if (![v8 scanRateOverride])
      {
        if (v9)
        {
          if (dword_100643B70 <= 50
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]",  50LL,  "Fast scan rate start '%@' for %@\n",  v10,  v12);
          }
        }

        else if (dword_100643B70 <= 50 {
               && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
        }
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]",  50LL,  "Fast scan rate start '%@'\n",  v10);
        }

        [v8 setScanRateOverride:50];
        -[SDNearbyAgent _update](self, "_update");
      }

      if (!self->_ddFastScanTimer)
      {
        int v13 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        ddFastScanTimer = self->_ddFastScanTimer;
        self->_ddFastScanTimer = v13;

        id v15 = self->_ddFastScanTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_100162C10;
        handler[3] = &unk_1005CBC20;
        handler[4] = self;
        id v17 = v8;
        id v18 = v10;
        dispatch_source_set_event_handler((dispatch_source_t)v15, handler);
        SFDispatchTimerSet(self->_ddFastScanTimer, 10.0, -1.0, -10.0);
        dispatch_resume((dispatch_object_t)self->_ddFastScanTimer);
      }
    }

    else if (!v9 {
           && dword_100643B70 <= 30
    }
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]",  30LL,  "Fast scan start too soon (%llu < %u seconds)\n");
    }
  }

  else if (!v9 {
         && dword_100643B70 <= 30
  }
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]",  30LL,  "Fast scan start ignored for UI state (screen %s, unlocked %s)\n");
  }
}

- (void)_deviceDiscoveryFastScanStop:(id)a3 reset:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v8 scanRateOverride]) {
    BOOL v10 = v6;
  }
  else {
    BOOL v10 = 0;
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v11 = self->_ddRequests;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v12)
  {
    id v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ([v17 scanRateOverride])
        {
          [v17 setScanRateOverride:0];
          char v14 = 1;
        }
      }

      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v13);

    if ((v14 & 1) != 0)
    {
      if (dword_100643B70 <= 50
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryFastScanStop:reset:reason:]",  50LL,  "Fast scan rate stop '%@'\n",  v9);
      }

      if (!v10)
      {
        uint64_t v18 = mach_absolute_time();
        goto LABEL_24;
      }

- (void)_deviceDiscoveryBLEDeviceFound:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  int v45 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v44 = v6;
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v46)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SFDevice);
    -[SFDevice updateWithBLEDevice:](v7, "updateWithBLEDevice:", v6);
    int v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](self, "_idsBluetoothDeviceIDsForMe"));
    if ([v43 containsObject:v46])
    {
      if ((-[SFDevice autoUnlockEnabled](v7, "autoUnlockEnabled") & 1) != 0
        || (id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice model](v7, "model")),
            unsigned __int8 v9 = [v8 hasPrefix:@"Watch"],
            v8,
            (v9 & 1) == 0))
      {
        -[SFDevice setDeviceFlags:](v7, "setDeviceFlags:", -[SFDevice deviceFlags](v7, "deviceFlags") | 1);
      }
    }

    unint64_t v10 = a4 - 7;
    if (a4 == 7)
    {
      ddProximityPairingDevices = self->_ddProximityPairingDevices;
      if (!ddProximityPairingDevices)
      {
        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v20 = self->_ddProximityPairingDevices;
        self->_ddProximityPairingDevices = v19;

        ddProximityPairingDevices = self->_ddProximityPairingDevices;
      }

      BOOL v42 = ddProximityPairingDevices;
      uint64_t v17 = 2LL;
    }

    else
    {
      uint64_t v11 = self;
      if (a4 == 16)
      {
        -[SDNearbyAgent _bleProximityUpdateNearbyInfoDevice:](self, "_bleProximityUpdateNearbyInfoDevice:", v7);
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:]( self,  "_identificationHandleDeviceFound:flags:",  v7,  1LL);
        ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        if (!ddNearbyInfoDevices)
        {
          __int128 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v23 = self->_ddNearbyInfoDevices;
          self->_ddNearbyInfoDevices = v22;

          ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        }

        BOOL v42 = ddNearbyInfoDevices;
        if (-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:](self, "_deviceCanTriggerEnhancedDiscovery:", v7))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:]( self,  "_enableEnhancedDiscovery:useCase:",  @"IncomingAdv",  131086LL);
          self->_enhancedDiscoveryAdvActive = 0;
          -[SDNearbyAgent update](self, "update");
        }

        uint64_t v17 = 1LL;
      }

      else
      {
        if (a4 != 15)
        {
LABEL_59:

          goto LABEL_60;
        }

        if (-[SFDevice deviceActionType](v7, "deviceActionType") == 10)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](v7, "idsIdentifier"));
          id v13 = [v12 length];

          uint64_t v11 = self;
          if (!v13) {
            -[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:](self, "idsAddCachedIDSIdentifierToDevice:", v7);
          }
        }

        -[SDNearbyAgent _bleProximityUpdateNearbyActionDevice:](v11, "_bleProximityUpdateNearbyActionDevice:", v7);
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:]( v11,  "_identificationHandleDeviceFound:flags:",  v7,  16LL);
        ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        if (!ddNearbyActionDevices)
        {
          uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          char v16 = v11->_ddNearbyActionDevices;
          v11->_ddNearbyActionDevices = v15;

          ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        }

        BOOL v42 = ddNearbyActionDevices;
        uint64_t v17 = 16LL;
      }
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[SFDevice rapportIdentifier](v7, "rapportIdentifier"));
    __int128 v25 = (void *)v24;
    if (v24)
    {
      uint64_t v54 = 0LL;
      __int128 v55 = &v54;
      uint64_t v56 = 0x3032000000LL;
      uint64_t v57 = sub_1001563B4;
      __int128 v58 = sub_1001563C4;
      id v59 = 0LL;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_10016347C;
      v51[3] = &unk_1005CFC90;
      v51[4] = v24;
      id v52 = v46;
      CFTypeID v53 = &v54;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v42, "enumerateKeysAndObjectsUsingBlock:", v51);
      __int128 v26 = (void *)v55[5];
      if (v26
        && ([v26 paired] & 1) == 0
        && ([(id)v55[5] deviceFlags] & 0x8000) == 0)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v55[5] bleDevice]);
        [(id)v55[5] setIsBLEDeviceReplaced:1];
        if (dword_100643B70 <= 30
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
        {
          if (v10 > 9) {
            id v28 = "?";
          }
          else {
            id v28 = off_1005D06F0[v10];
          }
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:]",  30LL,  "Replace old device: %s, %@ -> %@\n",  v28,  v55[5],  v7);
        }

        -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v27, a4);
      }

      _Block_object_dispose(&v54, 8);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v7, v46);
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v29 = self->_ddRequests;
    id v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v47,  v60,  16LL);
    if (v30)
    {
      uint64_t v31 = *(void *)v48;
      do
      {
        CFTypeID v32 = 0LL;
        do
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v29);
          }
          __int128 v33 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v32);
          if (((unint64_t)[v33 discoveryFlags] & v17) != 0)
          {
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceFilter]);
            if (!v34
              || (__int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceFilter]),
                  unsigned int v36 = [v35 containsObject:v46],
                  v35,
                  v34,
                  v36))
            {
              if ([v33 rssiThreshold]
                && (int v37 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](v7, "bleDevice")),
                    id v38 = [v37 rssi],
                    LODWORD(v38) = (uint64_t)v38 < (uint64_t)[v33 rssiThreshold],
                    v37,
                    (_DWORD)v38))
              {
                if (dword_100643B70 <= 10
                  && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 10LL)))
                {
                  LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:]",  10LL,  "Skip reporting device found %@ with low RSSI to %@\n",  v7,  v33);
                }
              }

              else
              {
                int v39 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceFoundHandler]);

                if (v39)
                {
                  int v40 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v33 deviceFoundHandler]);
                  ((void (**)(void, SFDevice *))v40)[2](v40, v7);
                }

                -[SDNearbyAgent _deviceDiscoveryFastScanEvaluate:device:]( v45,  "_deviceDiscoveryFastScanEvaluate:device:",  v33,  v7);
              }
            }
          }

          CFTypeID v32 = (char *)v32 + 1;
        }

        while (v30 != v32);
        id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v47,  v60,  16LL);
        id v30 = v41;
      }

      while (v41);
    }

    goto LABEL_59;
  }

- (void)_deviceDiscoveryBLEDeviceLost:(id)a3 type:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v6)
  {
    if (a4 == 7)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddProximityPairingDevices,  "objectForKeyedSubscript:",  v6));
      if (!v13) {
        goto LABEL_23;
      }
      id v8 = (void *)v13;
      -[NSMutableDictionary removeObjectForKey:](self->_ddProximityPairingDevices, "removeObjectForKey:", v6);
      uint64_t v9 = 2LL;
    }

    else
    {
      if (a4 == 16)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyInfoDevices,  "objectForKeyedSubscript:",  v6));
        if (!v14) {
          goto LABEL_23;
        }
        id v8 = (void *)v14;
        -[NSMutableDictionary removeObjectForKey:](self->_ddNearbyInfoDevices, "removeObjectForKey:", v6);
        uint64_t v9 = 1LL;
        unint64_t v10 = self;
        uint64_t v11 = v8;
        uint64_t v12 = 1LL;
      }

      else
      {
        if (a4 != 15) {
          goto LABEL_23;
        }
        uint64_t v7 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyActionDevices,  "objectForKeyedSubscript:",  v6));
        if (!v7) {
          goto LABEL_23;
        }
        id v8 = (void *)v7;
        -[NSMutableDictionary removeObjectForKey:](self->_ddNearbyActionDevices, "removeObjectForKey:", v6);
        uint64_t v9 = 16LL;
        unint64_t v10 = self;
        uint64_t v11 = v8;
        uint64_t v12 = 16LL;
      }

      -[SDNearbyAgent _identificationHandleDeviceLost:flags:](v10, "_identificationHandleDeviceLost:flags:", v11, v12);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v15 = self->_ddRequests;
    id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if (((unint64_t)objc_msgSend(v20, "discoveryFlags", (void)v23) & v9) != 0)
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceLostHandler]);

            if (v21)
            {
              __int128 v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v20 deviceLostHandler]);
              ((void (**)(void, void *))v22)[2](v22, v8);
            }
          }
        }

        id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      }

      while (v17);
    }
  }

- (void)_deviceDiscoveryBLEDeviceChanged:(id)a3 type:(int64_t)a4 changes:(unsigned int)a5
{
  uint64_t v40 = *(void *)&a5;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v39 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v39)
  {
    switch(a4)
    {
      case 7LL:
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddProximityPairingDevices,  "objectForKeyedSubscript:",  v39));
        if (!v14) {
          goto LABEL_43;
        }
        id v37 = v7;
        id v38 = v14;
        [v14 updateWithBLEDevice:v7];
        uint64_t v15 = 2LL;
        break;
      case 16LL:
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyInfoDevices,  "objectForKeyedSubscript:",  v39));
        if (!v16) {
          goto LABEL_43;
        }
        id v17 = v16;
        [v16 updateWithBLEDevice:v7];
        LODWORD(v40) = -[SDNearbyAgent _bleProximityUpdateNearbyInfoDevice:]( self,  "_bleProximityUpdateNearbyInfoDevice:",  v17) | v40;
        uint64_t v15 = 1LL;
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:]( self,  "_identificationHandleDeviceFound:flags:",  v17,  1LL);
        id v37 = v7;
        id v38 = v17;
        if (-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:](self, "_deviceCanTriggerEnhancedDiscovery:", v17))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:]( self,  "_enableEnhancedDiscovery:useCase:",  @"IncomingAdv",  131086LL);
          self->_enhancedDiscoveryAdvActive = 0;
          -[SDNearbyAgent update](self, "update");
          uint64_t v15 = 1LL;
        }

        break;
      case 15LL:
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyActionDevices,  "objectForKeyedSubscript:",  v39));
        if (!v8) {
          goto LABEL_43;
        }
        uint64_t v9 = v8;
        int v10 = [v8 deviceActionType];
        [v9 updateWithBLEDevice:v7];
        int v11 = [v9 deviceActionType];
        if (v11 != v10)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            uint64_t v12 = sub_100163B64(v10);
            uint64_t v13 = sub_100163B64(v11);
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]",  30LL,  "BLE action type changed: %s -> %s, cflags %#{flags}, %@\n",  v12,  v13,  v40,  &unk_1004CB505,  v7);
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
          [v18 setSetupProximityEstimator:0];
          [v18 setTriggered:0];
        }

        if (v11 == 10)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 idsIdentifier]);
          id v20 = [v19 length];

          if (!v20) {
            -[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:](self, "idsAddCachedIDSIdentifierToDevice:", v9);
          }
        }

        LODWORD(v40) = -[SDNearbyAgent _bleProximityUpdateNearbyActionDevice:]( self,  "_bleProximityUpdateNearbyActionDevice:",  v9) | v40;
        id v37 = v7;
        id v38 = v9;
        uint64_t v15 = 16LL;
        if ((v40 & 1) != 0) {
          -[SDNearbyAgent _identificationHandleDeviceFound:flags:]( self,  "_identificationHandleDeviceFound:flags:",  v9,  16LL);
        }
        break;
      default:
        goto LABEL_43;
    }

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v21 = self;
    __int128 v22 = self->_ddRequests;
    id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          if (((unint64_t)[v27 discoveryFlags] & v15) != 0)
          {
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 deviceFilter]);
            if (!v28
              || (id v29 = (void *)v28,
                  id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceFilter]),
                  unsigned int v31 = [v30 containsObject:v39],
                  v30,
                  v29,
                  v31))
            {
              unsigned int v32 = [v27 changeFlags];
              if (([v27 discoveryFlags] & 1) != 0
                && [v27 rssiChangeDetection])
              {
                v32 |= 4u;
              }

              uint64_t v33 = v32 & v40;
              if (v32 == -1 || (_DWORD)v33 != 0)
              {
                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceChangedHandler]);

                if (v35)
                {
                  unsigned int v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v27 deviceChangedHandler]);
                  ((void (**)(void, void *, uint64_t))v36)[2](v36, v38, v33);
                }

                -[SDNearbyAgent _deviceDiscoveryFastScanEvaluate:device:]( v21,  "_deviceDiscoveryFastScanEvaluate:device:",  v27,  v38);
              }
            }
          }
        }

        id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
      }

      while (v24);
    }

    id v7 = v37;
  }

- (void)_deviceDiscoveryBLEScanStateChanged:(int64_t)a3 type:(int64_t)a4
{
  switch(a4)
  {
    case 7LL:
      uint64_t v5 = 2LL;
      break;
    case 15LL:
      uint64_t v5 = 16LL;
      break;
    case 16LL:
      uint64_t v5 = 1LL;
      break;
    default:
      return;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_ddRequests;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (((unint64_t)objc_msgSend(v11, "discoveryFlags", (void)v14) & v5) != 0)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 scanStateChangedHandler]);

          if (v12)
          {
            uint64_t v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v11 scanStateChangedHandler]);
            v13[2](v13, a3);
          }
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }
}

- (void)diagnosticBLEModeStart:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  if (!bleDiagnosticModeClients)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v6 = self->_bleDiagnosticModeClients;
    self->_bleDiagnosticModeClients = v5;

    bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  }

  -[NSMutableSet addObject:](bleDiagnosticModeClients, "addObject:", v7);
  -[SDNearbyAgent _update](self, "_update");
}

- (void)diagnosticBLEModeStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_bleDiagnosticModeClients, "removeObject:", v4);
  -[SDNearbyAgent _update](self, "_update");
}

- (void)diagnosticMockChanged:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100643B70 <= 30)
  {
    if (dword_100643B70 != -1 || (v5 = _LogCategory_Initialize(&dword_100643B70, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent diagnosticMockChanged:]",  30LL,  "Mocking changed event with device: %@\n",  v4);
      id v4 = v6;
    }
  }

  -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]( self,  "_deviceDiscoveryBLEDeviceChanged:type:changes:",  v4,  15LL,  0LL);
}

- (void)diagnosticMockFound:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100643B70 <= 30)
  {
    if (dword_100643B70 != -1 || (v5 = _LogCategory_Initialize(&dword_100643B70, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent diagnosticMockFound:]",  30LL,  "Mocking found event with device: %@\n",  v4);
      id v4 = v6;
    }
  }

  -[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:](self, "_deviceDiscoveryBLEDeviceFound:type:", v4, 15LL);
}

- (void)diagnosticMockLost:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100643B70 <= 30)
  {
    if (dword_100643B70 != -1 || (v5 = _LogCategory_Initialize(&dword_100643B70, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent diagnosticMockLost:]",  30LL,  "Mocking lost event with device: %@\n",  v4);
      id v4 = v6;
    }
  }

  -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v4, 15LL);
}

- (void)_identificationCheckFlagsAndACL
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = self->_idIdentityArray;
  id v2 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (!v2)
  {
    uint64_t v18 = 0LL;
    id v4 = 0LL;
    int v5 = 0;
    goto LABEL_35;
  }

  id v3 = v2;
  uint64_t v18 = 0LL;
  id v4 = 0LL;
  LOBYTE(v5) = 0;
  uint64_t v6 = *(void *)v21;
  do
  {
    for (i = 0LL; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      if (([v8 featureFlags] & 4) != 0)
      {
        if (dword_100643B70 <= 30
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationCheckFlagsAndACL]",  30LL,  "enabled fitness pairing with identity: %@\n",  v8);
        }

        BYTE4(v18) = 1;
      }

      if ((v5 & 1) != 0) {
        goto LABEL_13;
      }
      if ([v8 type] == 13)
      {
        if (dword_100643B70 <= 30
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
        {
          LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationCheckFlagsAndACL]",  30LL,  "enabled session pairing with identity: %@\n",  v8);
        }

- (void)_identificationEnsureStarted
{
  if (self->_idIdentitiesChangedNotifyToken == -1)
  {
    if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF(&dword_100643B70, "-[SDNearbyAgent _identificationEnsureStarted]", 30LL, "Identification start\n");
      }

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100164738;
      handler[3] = &unk_1005CB7B8;
      handler[4] = self;
      notify_register_dispatch( "com.apple.rapport.identitiesChanged",  &self->_idIdentitiesChangedNotifyToken,  dispatchQueue,  handler);
      -[SDNearbyAgent _identificationGetIdentities](self, "_identificationGetIdentities");
    }

    else if (dword_100643B70 <= 20 {
           && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
    }
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationEnsureStarted]",  20LL,  "Deferring identification start until FirstUnlock\n");
    }
  }

- (void)_identificationEnsureStopped
{
  int idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
  if (idIdentitiesChangedNotifyToken != -1)
  {
    if (dword_100643B70 > 30) {
      goto LABEL_7;
    }
    int idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
    if (idIdentitiesChangedNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(idIdentitiesChangedNotifyToken);
      self->_int idIdentitiesChangedNotifyToken = -1;
    }
  }

  idMaintenanceTimer = self->_idMaintenanceTimer;
  if (idMaintenanceTimer)
  {
    int v5 = idMaintenanceTimer;
    dispatch_source_cancel(v5);
    uint64_t v6 = self->_idMaintenanceTimer;
    self->_idMaintenanceTimer = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_idDevices, "removeAllObjects");
  idDevices = self->_idDevices;
  self->_idDevices = 0LL;
}

- (void)_identificationGetIdentities
{
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationGetIdentities]",  30LL,  "Identification get identities\n");
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___RPClient);
  [v3 setDispatchQueue:self->_dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100164948;
  v5[3] = &unk_1005CFCB8;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 getIdentitiesWithFlags:28075 completion:v5];
}

- (id)idsDeviceIDsForRIServers
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = self->_idIdentityArray;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model", (void)v14));
        unsigned int v11 = [v10 hasPrefix:@"AppleTV"];

        if (v11)
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceID]);
          if (v12) {
            -[NSMutableSet addObject:](v3, "addObject:", v12);
          }
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)idsDeviceIDsForFamily
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = self->_idIdentityArray;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
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
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "type", (void)v15) == 4 || objc_msgSend(v9, "type") == 2)
        {
          int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 model]);
          unsigned int v11 = [v10 hasPrefix:@"AppleTV"];

          if (v11)
          {
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 idsDeviceID]);
            if (v12)
            {
              uint64_t v13 = (void *)v12;
              -[NSMutableSet addObject:](v3, "addObject:", v12);
            }
          }
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)_identificationHandleDeviceFound:(id)a3 flags:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if (!v6) {
    goto LABEL_99;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 advertisementFields]);
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, @"at", TypeID, 0LL);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v12 = (SDBLEIdentifiedDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_idDevices,  "objectForKeyedSubscript:",  v6));
  if (v12)
  {
    uint64_t v13 = v12;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEIdentifiedDevice authTag](v12, "authTag"));
    __int128 v15 = v11;
    id v16 = v11;
    id v17 = v14;
    if (v16 == v17)
    {
    }

    else
    {
      __int128 v18 = v17;
      if ((v16 == 0LL) != (v17 != 0LL))
      {
        unsigned __int8 v19 = [v16 isEqual:v17];

        if ((v19 & 1) != 0) {
          goto LABEL_13;
        }
      }

      else
      {
      }

      -[SDBLEIdentifiedDevice setAuthTag:](v13, "setAuthTag:", v16);
      CFTypeID v21 = CFDataGetTypeID();
      -[SDBLEIdentifiedDevice setBtAddr:](v13, "setBtAddr:", CFDictionaryGetTypedValue(v8, @"bdAddr", v21, 0LL));
    }

- (void)_identificationHandleDeviceLost:(id)a3 flags:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v6)
  {
    unsigned int v11 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v6));
    id v8 = v7;
    if (v7)
    {
      unint64_t v9 = (unint64_t)[v7 discoveryFlags];
      unint64_t v10 = v9 & ~a4;
      if (v10 != v9)
      {
        [v8 setDiscoveryFlags:v10];
        if (!v10) {
          [v8 setLastUpdateTicks:mach_absolute_time()];
        }
      }
    }

    id v6 = v11;
  }
}

- (void)_identificationHandleDiscoveryStop
{
  uint64_t v2 = !self->_ddNearbyInfoEnabled | (16LL * !self->_ddNearbyActionEnabled);
  idDevices = self->_idDevices;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100165B60;
  v4[3] = &unk_1005CFCD8;
  v4[4] = v2;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idDevices, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_identificationMaintenanceTimer
{
  uint64_t v3 = mach_absolute_time();
  unint64_t v4 = SecondsToUpTicks(60LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_idDevices, "allKeys"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_idDevices,  "objectForKeyedSubscript:",  v10));
        if (![v11 discoveryFlags] && v3 - (unint64_t)objc_msgSend(v11, "lastUpdateTicks") >= v4)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_idDevices, "removeObjectForKey:", v10);
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationMaintenanceTimer]",  30LL,  "Identification removed stale %@\n",  v10);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  if (!-[NSMutableDictionary count](self->_idDevices, "count"))
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationMaintenanceTimer]",  30LL,  "Identification stopping maintenance timer\n");
    }

    idMaintenanceTimer = self->_idMaintenanceTimer;
    if (idMaintenanceTimer)
    {
      uint64_t v13 = idMaintenanceTimer;
      dispatch_source_cancel(v13);
      __int128 v14 = self->_idMaintenanceTimer;
      self->_idMaintenanceTimer = 0LL;
    }
  }

- (void)_identificationReIdentify
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_idDevices, "allKeys", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v8));
        if (-[SDNearbyAgent _identificationIdentifyDevice:sfDevice:]( self,  "_identificationIdentifyDevice:sfDevice:",  v9,  0LL))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyActionDevices,  "objectForKeyedSubscript:",  v8));
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bleDevice]);

          if (v11) {
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]( self,  "_deviceDiscoveryBLEDeviceChanged:type:changes:",  v11,  15LL,  1LL);
          }

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyInfoDevices,  "objectForKeyedSubscript:",  v8));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);

          if (v13) {
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]( self,  "_deviceDiscoveryBLEDeviceChanged:type:changes:",  v13,  16LL,  1LL);
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }
}

- (void)_identificationReIdentifySameAccountDevices:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  id v27 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v6 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v35;
    uint64_t v24 = *(void *)v35;
    id v25 = v5;
    do
    {
      unint64_t v9 = 0LL;
      id v26 = v7;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * (void)v9)]);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsIdentifier]);
        if (!v11) {
          goto LABEL_29;
        }
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 bleDevice]);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        uint64_t v12 = v27->_idIdentityArray;
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
        if (!v13) {
          goto LABEL_28;
        }
        id v14 = v13;
        uint64_t v15 = *(void *)v31;
        while (2)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            __int128 v17 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            if ([v17 type] == 2)
            {
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 idsDeviceID]);
              unsigned int v19 = [v18 isEqual:v11];

              if (v19)
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v29 rpIdentity]);
                CFTypeID v21 = v20;
                if (v20)
                {
                  unsigned int v22 = [v20 compareWithRPIdentity:v17];
                  [v29 setRpIdentity:v17];
                  if (!v22)
                  {
LABEL_27:

                    goto LABEL_28;
                  }
                }

                else
                {
                  [v29 setRpIdentity:v17];
                }

                if (dword_100643B70 <= 30
                  && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
                {
                  LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationReIdentifySameAccountDevices:type:]",  30LL,  "Identification identified device: %@, %@, %@\n",  v10,  v29,  v17);
                }

                -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]( v27,  "_deviceDiscoveryBLEDeviceChanged:type:changes:",  v29,  a4,  1LL);
                goto LABEL_27;
              }
            }
          }

          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
          if (v14) {
            continue;
          }
          break;
        }

- (BOOL)_identificationIdentifyDevice:(id)a3 sfDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 authTag]);
  if (v8)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 btAddr]);
    if (v9)
    {
      id v25 = v6;
      uint64_t v24 = mach_absolute_time();
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v10 = self->_idIdentityArray;
      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      if (v11)
      {
        id v12 = v11;
        id v13 = 0LL;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v10);
            }
            __int128 v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            if ([v16 verifyAuthTag:v8 data:v9 type:2 error:0])
            {
              if (dword_100643B70 <= 30
                && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
              {
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
                uint64_t v18 = mach_absolute_time();
                uint64_t v19 = UpTicksToMicroseconds(v18 - v24);
                LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _identificationIdentifyDevice:sfDevice:]",  30LL,  "Identification identified device %@ -> %@, %llu mus\n",  v17,  v16,  v19);
              }

              if (v13)
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 contactID]);

                if (!v20)
                {
                  CFTypeID v21 = (void *)objc_claimAutoreleasedReturnValue([v16 contactID]);
                  [v13 setContactID:v21];
                }
              }

              else
              {
                id v13 = v16;
                [v25 setIdentity:v13];
              }

              [v7 updateWithRPIdentity:v16];
            }
          }

          id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        }

        while (v12);
      }

      else
      {
        id v13 = 0LL;
      }

      BOOL v22 = v13 != 0LL;
      id v6 = v25;
    }

    else
    {
      BOOL v22 = 0;
    }
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_identificationDecryptAudioRoutingScoreData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a6 deviceIRKData]);
  if ([v12 length])
  {
    id v13 = v11;
    if ([v13 length])
    {
      memset(v20, 0, sizeof(v20));
      uint64_t v14 = kCryptoHashDescriptor_SHA512;
      id v15 = v12;
      id v16 = [v15 bytes];
      id v17 = [v15 length];
      id v18 = v13;
      CryptoHKDF( v14,  v16,  v17,  [v18 bytes],  objc_msgSend(v18, "length"),  "BLEAdvKeyAudioRoutingScoreInfo",  30,  32,  v20);
      if ([v9 length])
      {
        char v19 = 0;
        ccchacha20(v20, &unk_1004CB4D3, 0, 1, [v9 bytes], &v19);
        [v10 setAudioRoutingScore:v19 & 7];
      }
    }
  }
}

- (void)_identificationDecryptHotspotData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a6 deviceIRKData]);
  if ([v12 length])
  {
    id v13 = v11;
    if ([v13 length])
    {
      memset(v20, 0, sizeof(v20));
      uint64_t v14 = kCryptoHashDescriptor_SHA512;
      id v15 = v12;
      id v16 = [v15 bytes];
      id v17 = [v15 length];
      id v18 = v13;
      CryptoHKDF( v14,  v16,  v17,  [v18 bytes],  objc_msgSend(v18, "length"),  "BLEAdvKeyHotspotInfo",  20,  32,  v20);
      if ([v9 length])
      {
        unsigned __int8 v19 = 0;
        ccchacha20(v20, &unk_1004CB4D3, 0, 1, [v9 bytes], &v19);
        [v10 setHotspotInfo:v19 | 0x100u];
      }
    }
  }
}

- (unsigned)_identificationDecryptActivityLevel:(unsigned __int8)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  unsigned __int8 v18 = a3;
  id v7 = a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a6 deviceIRKData]);
  if ([v8 length])
  {
    id v9 = v7;
    if ([v9 length])
    {
      memset(v19, 0, sizeof(v19));
      uint64_t v10 = kCryptoHashDescriptor_SHA512;
      id v11 = v8;
      id v12 = [v11 bytes];
      id v13 = [v11 length];
      id v14 = v9;
      CryptoHKDF( v10,  v12,  v13,  [v14 bytes],  objc_msgSend(v14, "length"),  "BLEAdvKeyActivityLevel",  22,  32,  v19);
      char v17 = 0;
      ccchacha20(v19, &unk_1004CB4D3, 0LL, 1LL, &v18, &v17);
      unsigned __int8 v15 = v17 & 0xF;
    }

    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)_idsEnsureStarted
{
  if (!self->_idsService)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent _idsEnsureStarted]", 30LL, "IDS start\n");
    }

    uint64_t v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.nearby");
    idsService = self->_idsService;
    self->_idsService = v3;

    -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_dispatchQueue);
  }

- (void)_idsEnsureStopped
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesArray = v2->_idsBluetoothDevicesArray;
  v2->_idsBluetoothDevicesArray = 0LL;

  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  v2->_idsBluetoothDevicesSet = 0LL;

  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  v2->_idsBluetoothDeviceIDsForLEPipe = 0LL;

  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  v2->_idsBluetoothDeviceIDsForMe = 0LL;

  idsDeviceBTDictionary = v2->_idsDeviceBTDictionary;
  v2->_idsDeviceBTDictionary = 0LL;

  idsDeviceCountBTDictionary = v2->_idsDeviceCountBTDictionary;
  v2->_idsDeviceCountBTDictionary = 0LL;

  objc_sync_exit(v2);
  if (v2->_idsService)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent _idsEnsureStopped]", 30LL, "IDS stop\n");
    }

    -[IDSService removeDelegate:](v2->_idsService, "removeDelegate:", v2);
    idsService = v2->_idsService;
    v2->_idsService = 0LL;
  }

- (void)idsAddCachedIDSIdentifier:(id)a3 device:(id)a4
{
  id v21 = a3;
  id v22 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = mach_absolute_time();
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6->_idsBTtoIDSInfoMap, "allKeys"));
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v6->_idsBTtoIDSInfoMap,  "objectForKeyedSubscript:",  v12));
        uint64_t Int64 = CFDictionaryGetInt64(v13, @"addTicks", 0LL);
        if ((unint64_t)UpTicksToSeconds(v7 - Int64) >= 0x385)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]",  30LL,  "Remove old IDS cache entry: %@ : %##@\n",  v12,  v13);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v6->_idsBTtoIDSInfoMap,  "setObject:forKeyedSubscript:",  0LL,  v12);
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }

    while (v9);
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
  if (v15)
  {
    if (!v6->_idsBTtoIDSInfoMap)
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      idsBTtoIDSInfoMap = v6->_idsBTtoIDSInfoMap;
      v6->_idsBTtoIDSInfoMap = v16;
    }

    v27[0] = @"addTicks";
    unsigned __int8 v18 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v27[1] = @"idsID";
    v28[0] = v19;
    v28[1] = v21;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));

    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]",  30LL,  "Add IDS cache entry: %@ : %##@\n",  v15,  v20);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6->_idsBTtoIDSInfoMap,  "setObject:forKeyedSubscript:",  v20,  v15);
  }

  else if (dword_100643B70 <= 90 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 90LL)))
  }
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]",  90LL,  "### No BT UUID for %@\n",  v21);
  }

  objc_sync_exit(v6);
}

- (void)idsAddCachedIDSIdentifierToDevice:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 idsIdentifier]);

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4->_idsBTtoIDSInfoMap,  "objectForKeyedSubscript:",  v6));
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"idsID"]);
        if (v9)
        {
          [v10 setIdsIdentifier:v9];
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:]",  30LL,  "Found IDS cache entry for device: %@\n",  v10);
          }
        }
      }
    }
  }

  objc_sync_exit(v4);
}

- (int)_idsAppleTVCount
{
  int result = self->_idsAppleTVCountCache;
  if (result < 0)
  {
    self->_idsAppleTVCountCache = 0;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) modelIdentifier]);
          unsigned int v10 = [v9 hasPrefix:@"AppleTV"];

          if (v10) {
            ++self->_idsAppleTVCountCache;
          }
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    return self->_idsAppleTVCountCache;
  }

  return result;
}

- (id)idsBluetoothDeviceIDsForRIServers
{
  __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelIdentifier]);
        if ([v9 hasPrefix:@"AppleTV"])
        {
        }

        else
        {
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 modelIdentifier]);
          unsigned int v11 = -[SDNearbyAgent isDeviceValidRIServer:](self, "isDeviceValidRIServer:", v10);

          if (!v11) {
            continue;
          }
        }

        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 nsuuid]);
        if (v12) {
          -[NSMutableSet addObject:](v14, "addObject:", v12);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  return v14;
}

- (id)_idsBluetoothDeviceIDsForHomePods
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
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
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
        unsigned int v11 = [v10 hasPrefix:@"AudioAccessory"];

        if (v11)
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 nsuuid]);
          if (v12) {
            -[NSMutableSet addObject:](v3, "addObject:", v12);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForiMessage
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v3 = objc_alloc(&OBJC_CLASS___IDSService);
  id v4 = -[IDSService initWithService:](v3, "initWithService:", IDSServiceNameiMessage);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v4, "devices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) nsuuid]);
        if (v10) {
          -[NSMutableSet addObject:](v2, "addObject:", v10);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v2;
}

- (id)idsBluetoothDeviceIDsForLEPipe
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  if (!idsBluetoothDeviceIDsForLEPipe)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForLEPipe](v2, "_idsBluetoothDeviceIDsForLEPipe"));
    id v5 = v2->_idsBluetoothDeviceIDsForLEPipe;
    v2->_idsBluetoothDeviceIDsForLEPipe = (NSArray *)v4;

    idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  }

  id v6 = idsBluetoothDeviceIDsForLEPipe;
  objc_sync_exit(v2);

  return v6;
}

- (id)_idsBluetoothDeviceIDsForLEPipe
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
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
        if (v9) {
          [v9 operatingSystemVersion];
        }
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
        if (([v10 hasPrefix:@"Mac"] & 1) == 0
          && ![v10 hasPrefix:@"iMac"])
        {
          [v10 hasPrefix:@"Watch"];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  if (-[NSMutableArray count](v3, "count")) {
    unsigned int v11 = v3;
  }
  else {
    unsigned int v11 = 0LL;
  }
  __int128 v12 = v11;

  return v12;
}

- (id)_idsBluetoothDeviceIDsForMe
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id obj = (id *)&v2->super.isa;
  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  if (idsBluetoothDeviceIDsForMe)
  {
    uint64_t v4 = idsBluetoothDeviceIDsForMe;
  }

  else
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](v2->_systemMonitor, "meDeviceIDSDeviceID"));
    if (v6)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](v2, "idsDeviceArray"));
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v7);
            }
            unsigned int v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);
            if (v12)
            {
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
              unsigned __int8 v14 = [v13 isEqual:v6];

              if ((v14 & 1) != 0
                || (__int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]),
                    unsigned int v16 = [v15 hasPrefix:@"Watch"],
                    v15,
                    v16))
              {
                -[NSMutableSet addObject:](v5, "addObject:", v12);
              }
            }
          }

          id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v8);
      }
    }

    id v17 = -[NSMutableSet copy](v5, "copy");
    id v18 = obj[70];
    obj[70] = v17;

    uint64_t v4 = (NSSet *)obj[70];
  }

  objc_sync_exit(obj);

  return v4;
}

- (id)_idsBluetoothDeviceIDsForOneness
{
  __int128 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t DeviceClass = GestaltGetDeviceClass(v3, v4);
  if ((_DWORD)DeviceClass == 1)
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    id v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v8)
    {
      id v9 = v8;
      __int128 v35 = self;
      uint64_t v10 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v46 != v10) {
            objc_enumerationMutation(v7);
          }
          __int128 v12 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelIdentifier", v35));
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);

          if (([v14 containsString:@"mac"] & 1) != 0
            || [v14 containsString:@"imac"])
          {
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
            -[NSMutableSet addObject:](v3, "addObject:", v15);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }

      while (v9);
      self = v35;
    }
  }

  else
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    id v16 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v16)
    {
      id v17 = v16;
      id v18 = self;
      uint64_t v19 = *(void *)v42;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v7);
          }
          __int128 v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 modelIdentifier]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lowercaseString]);

          if ([v23 containsString:@"iphone"])
          {
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
            -[NSMutableSet addObject:](v3, "addObject:", v24);
          }
        }

        id v17 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }

      while (v17);
      self = v18;
    }
  }

LABEL_25:
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  id v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (k = 0LL; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        __int128 v30 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)k);
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueID]);
        unsigned int v32 = -[NSMutableSet containsObject:](v3, "containsObject:", v31);

        if (v32)
        {
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 nsuuid]);
          if (v33) {
            -[NSMutableSet addObject:](v36, "addObject:", v33);
          }
        }
      }

      id v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }

    while (v27);
  }

  return v36;
}

- (id)idsBluetoothDeviceIDsForSharing
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  if (!idsBluetoothDevicesSet)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSSet);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharingLocked](v2, "_idsBluetoothDeviceIDsForSharingLocked"));
    uint64_t v6 = -[NSSet initWithArray:](v4, "initWithArray:", v5);
    uint64_t v7 = v2->_idsBluetoothDevicesSet;
    v2->_idsBluetoothDevicesSet = v6;

    idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  }

  id v8 = idsBluetoothDevicesSet;
  objc_sync_exit(v2);

  return v8;
}

- (id)idsBluetoothDeviceIDsForWatches
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
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
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
        unsigned int v11 = [v10 hasPrefix:@"Watch"];

        if (v11)
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 nsuuid]);
          if (v12) {
            -[NSMutableSet addObject:](v3, "addObject:", v12);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharing
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharingLocked](v2, "_idsBluetoothDeviceIDsForSharingLocked"));
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharingLocked
{
  idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  if (!idsBluetoothDevicesArray)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) nsuuid]);
          if (v10) {
            -[NSMutableArray addObject:](v4, "addObject:", v10);
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    unsigned int v11 = self->_idsBluetoothDevicesArray;
    self->_idsBluetoothDevicesArray = &v4->super;

    idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  }

  return idsBluetoothDevicesArray;
}

- (id)_idsBluetoothDeviceIDsForSMSRelay
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v3 = objc_alloc(&OBJC_CLASS___IDSService);
  uint64_t v4 = -[IDSService initWithService:](v3, "initWithService:", IDSServiceNameSMSRelay);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v4, "devices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (([v10 supportsSMSRelay] & 1) != 0
          || [v10 supportsMMSRelay])
        {
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nsuuid]);
          if (v11) {
            -[NSMutableSet addObject:](v2, "addObject:", v11);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v2;
}

- (id)_idsBluetoothDeviceIDsForAnnouncements
{
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  __int128 v14 = sub_1001563B4;
  __int128 v15 = sub_1001563C4;
  __int128 v16 = 0LL;
  __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  id v3 = objc_alloc_init(off_100643BF0());
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001683B4;
  v8[3] = &unk_1005CFD00;
  uint64_t v10 = &v11;
  uint64_t v4 = v2;
  id v9 = v4;
  [v3 getScanningDeviceCandidates:v8];
  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int)_idsContinuityDeviceCount
{
  int result = self->_idsContinuityDeviceCountCache;
  if (result < 0)
  {
    if (self->_idsService)
    {
      self->_idsContinuityDeviceCountCache = 0;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = (char *)v8 + 1;
          }

          while (v6 != v8);
          id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }

        while (v6);
      }

      return self->_idsContinuityDeviceCountCache;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (id)idsDeviceArray
{
  dispatch_semaphore_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsDeviceArrayLocked](v2, "_idsDeviceArrayLocked"));
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsDeviceArrayLocked
{
  idsDeviceArray = self->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent _idsDeviceArrayLocked]", 30LL, "Get IDSDevices\n");
    }

    uint64_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
    id v5 = self->_idsDeviceArray;
    self->_idsDeviceArray = v4;

    idsDeviceArray = self->_idsDeviceArray;
  }

  return idsDeviceArray;
}

- (id)idsDeviceForBluetoothDeviceID:(id)a3 conflictDetected:(BOOL *)a4
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
  if (!idsDeviceBTDictionary)
  {
    id v27 = v5;
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](v6, "idsDeviceArray"));
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v10);
          }
          __int128 v14 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nsuuid]);
          if (v15)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v15);
            __int128 v16 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  CFDictionaryGetInt64Ranged(v9, v15, 0LL, 0xFFFFFFFFLL, 0LL) + 1);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v15);
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v11);
    }

    id v18 = v6->_idsDeviceBTDictionary;
    v6->_idsDeviceBTDictionary = &v8->super;
    uint64_t v19 = v8;

    idsDeviceCountBTDictionary = v6->_idsDeviceCountBTDictionary;
    v6->_idsDeviceCountBTDictionary = &v9->super;

    idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
    id v5 = v27;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](idsDeviceBTDictionary, "objectForKeyedSubscript:", v5));
  __int128 v22 = v5;
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v6->_idsDeviceCountBTDictionary, v5, 0LL, 0xFFFFFFFFLL, 0LL);
  BOOL v24 = (Int64Ranged & 0xFFFFFFFE) == 0 || v21 == 0LL;
  BOOL v25 = !v24;
  if (!v24
    && dword_100643B70 <= 30
    && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent idsDeviceForBluetoothDeviceID:conflictDetected:]",  30LL,  "Multiple (%ld) IDS devices are associated with BT ID %@. Picking %@, some info may be inaccurate",  Int64Ranged,  v22,  v21);
  }

  if (a4) {
    *a4 = v25;
  }
  objc_sync_exit(v6);

  return v21;
}

- (void)idsDevicesAppendDescription:(id *)a3
{
  id v5 = -[NSData bytes](self->_bleAdvertisingAddress, "bytes");
  id v6 = (void *)IDSCopyLocalDeviceUniqueID();
  uint64_t v7 = SFDeviceModel();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(a3, "Local BT Addr %.6a, Local IDS UniqueID: %@ (%@)\n", v5, v6, v8);

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  id v57 = [v9 countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v71;
    uint64_t v54 = IDSServiceNameiMessage;
    uint64_t v53 = IDSServiceNameSMSRelay;
    CFTypeID v60 = a3;
    BOOL v56 = v9;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v71 != v55) {
          objc_enumerationMutation(v9);
        }
        uint64_t v61 = v10;
        id v11 = *(void **)(*((void *)&v70 + 1) + 8 * v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 productBuildVersion]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);
        NSAppendPrintF(a3, "%''@, %@, %@, %@, BT=%@", v12, v13, v14, v15, v16);

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);
        if (v17)
        {
          id v18 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", v54);
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v58 = v18;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v18, "devices"));
          id v20 = [v19 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v67;
            while (2)
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v67 != v22) {
                  objc_enumerationMutation(v19);
                }
                BOOL v24 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
                uint64_t v25 = objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
                if (v25)
                {
                  id v26 = (void *)v25;
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueIDOverride]);
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIDOverride]);
                  unsigned int v29 = [v27 isEqual:v28];

                  if (!v29) {
                    continue;
                  }
                }

                uint64_t v30 = objc_claimAutoreleasedReturnValue([v11 nsuuid]);
                if (v30)
                {
                  __int128 v31 = (void *)v30;
                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v24 nsuuid]);
                  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);
                  unsigned __int8 v34 = [v32 isEqual:v33];

                  if ((v34 & 1) == 0) {
                    continue;
                  }
                }

                a3 = v60;
                NSAppendPrintF(v60, ", iMessage");
                goto LABEL_20;
              }

              id v21 = [v19 countByEnumeratingWithState:&v66 objects:v75 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }

          a3 = v60;
        }

- (BOOL)_idsHasActiveWatch
{
  if (self->_idsHasActiveWatchCache < 0)
  {
    self->_idsHasActiveWatchCache = 0;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          if ([v8 isLocallyPaired])
          {
            if ([v8 isActive] && (objc_msgSend(v8, "isConnected") & 1) != 0
              || [v8 isConnected]
              && (__int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 productBuildVersion]),
                  unint64_t v10 = (unint64_t)[v9 compare:@"14S" options:65],
                  v9,
                  (v10 & 0x8000000000000000LL) != 0))
            {
              self->_idsHasActiveWatchCache = 1;
              goto LABEL_16;
            }
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (int)_idsHomePodCount
{
  int result = self->_idsHomePodCountCache;
  if (result < 0)
  {
    self->_idsHomePodCountCache = 0;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v5) {
      goto LABEL_13;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
        if ([v10 hasPrefix:@"AudioAccessory"])
        {
        }

        else
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
          unsigned int v12 = [v11 hasPrefix:@"HomePod1,"];

          if (!v12) {
            continue;
          }
        }

        ++self->_idsHomePodCountCache;
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v6)
      {
LABEL_13:

        return self->_idsHomePodCountCache;
      }
    }
  }

  return result;
}

- (int)_idsVisionOS1Count
{
  int result = self->_idsVisionOS1CountCache;
  if (result < 0)
  {
    self->_idsVisionOS1CountCache = 0;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 productName]);
        if (!v9)
        {
          uint64_t v11 = 0LL;
LABEL_12:

          continue;
        }

        [v9 operatingSystemVersion];

        if (v11 == 1) {
          ++self->_idsVisionOS1CountCache;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS1CountCache;
      }
    }
  }

  return result;
}

- (int)_idsVisionOS2OrHigherCount
{
  int result = self->_idsVisionOS2OrHigherCountCache;
  if (result < 0)
  {
    self->_idsVisionOS2OrHigherCountCache = 0;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 productName]);
        if (!v9)
        {
          uint64_t v11 = 0LL;
LABEL_12:

          continue;
        }

        [v9 operatingSystemVersion];

        if (v11 >= 2) {
          ++self->_idsVisionOS2OrHigherCountCache;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS2OrHigherCountCache;
      }
    }
  }

  return result;
}

- (BOOL)idsIsSignedIn
{
  dispatch_semaphore_t v2 = self;
  objc_sync_enter(v2);
  if ((v2->_idsIsSignedInCache & 0x80000000) == 0) {
    goto LABEL_27;
  }
  v2->_idsIsSignedInCache = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](v2->_idsService, "accounts"));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) isActive])
        {
          v2->_idsIsSignedInCache = 1;
          goto LABEL_12;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (int)_idsMacCount
{
  int result = self->_idsMacCountCache;
  if (result < 0)
  {
    self->_idsMacCountCache = 0;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) modelIdentifier]);
          unsigned int v10 = [v9 containsString:@"Mac"];

          if (v10) {
            ++self->_idsMacCountCache;
          }
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    return self->_idsMacCountCache;
  }

  return result;
}

- (void)_idsMeDeviceChanged
{
  id v3 = self;
  objc_sync_enter(v3);
  idsBluetoothDeviceIDsForMe = v3->_idsBluetoothDeviceIDsForMe;
  v3->_idsBluetoothDeviceIDsForMe = 0LL;

  objc_sync_exit(v3);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v3->_ddRequests;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "discoveryFlags", (void)v12) & 0x100000) != 0)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](v3, "_idsBluetoothDeviceIDsForMe"));
          [v10 setDeviceFilter:v11];
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  -[SDNearbyAgent _update](v3, "_update");
}

- (BOOL)_idsShouldAdvertiseNearbyInfo
{
  int idsShouldAdvertiseNearbyInfo = self->_idsShouldAdvertiseNearbyInfo;
  if ((idsShouldAdvertiseNearbyInfo & 0x80000000) == 0) {
    return idsShouldAdvertiseNearbyInfo > 0;
  }
  self->_int idsShouldAdvertiseNearbyInfo = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  int DeviceClass = GestaltGetDeviceClass(v5, v6);
  if (DeviceClass == 6)
  {
    if ((unint64_t)[v5 count] < 2)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v8 = v5;
      id v15 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v21;
LABEL_19:
        uint64_t v18 = 0LL;
        while (1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v8);
          }
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "modelIdentifier", (void)v20));
          __int128 v14 = v19;
          if (v19)
          {
          }

          if (v16 == (id)++v18)
          {
            id v16 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v16) {
              goto LABEL_19;
            }
            goto LABEL_26;
          }
        }
      }

      goto LABEL_26;
    }
  }

  else if (DeviceClass == 1)
  {
    if ((unint64_t)[v5 count] < 2)
    {
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v25;
LABEL_8:
        uint64_t v12 = 0LL;
        while (1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * v12) modelIdentifier]);
          __int128 v14 = v13;
          if (v13)
          {
          }

          if (v10 == (id)++v12)
          {
            id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
            if (v10) {
              goto LABEL_8;
            }
            goto LABEL_26;
          }
        }

- (int)_idsShouldEncryptActivityLevel
{
  int idsShouldEncryptActivityLevel = self->_idsShouldEncryptActivityLevel;
  if (idsShouldEncryptActivityLevel < 0)
  {
    if ((-[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable") & 1) != 0)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
            uint64_t v11 = GestaltProductTypeStringToDeviceClass();

            if (v9) {
              [v9 operatingSystemVersion];
            }
            if ((_DWORD)v11
              && (DeviceOSVersionAtOrLater(v11, 0LL, 0LL, 0LL, 130202LL, 101504LL, 130202LL, 60102LL) & 1) == 0)
            {
              if (dword_100643B70 <= 20
                && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
              {
                LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _idsShouldEncryptActivityLevel]",  20LL,  "Not encrypting activity level; IDS device %@ is incompatible with encryption",
                  v9);
              }

              int idsShouldEncryptActivityLevel = 0;
              goto LABEL_25;
            }
          }

          id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      int idsShouldEncryptActivityLevel = 1;
LABEL_25:
    }

    else
    {
      if (dword_100643B70 <= 20
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _idsShouldEncryptActivityLevel]",  20LL,  "Not encrypting activity level because Manatee is not available.");
      }

      int idsShouldEncryptActivityLevel = 0;
    }

    self->_int idsShouldEncryptActivityLevel = idsShouldEncryptActivityLevel;
  }

  return idsShouldEncryptActivityLevel;
}

- (int)_idsWatchCount
{
  int result = self->_idsWatchCountCache;
  if (result < 0)
  {
    self->_idsWatchCountCache = 0;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v18 = self;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
          unsigned int v11 = [v10 containsString:@"Watch"];

          if (v11)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 modelIdentifier]);
            uint64_t v13 = GestaltProductTypeStringToDeviceClass();
            if (v9)
            {
              [v9 operatingSystemVersion];
              uint64_t v14 = v21;
              [v9 operatingSystemVersion];
              uint64_t v15 = v20;
              [v9 operatingSystemVersion];
              uint64_t v16 = v19;
            }

            else
            {
              uint64_t v16 = 0LL;
              uint64_t v15 = 0LL;
              uint64_t v14 = 0LL;
              uint64_t v21 = 0LL;
              uint64_t v20 = 0LL;
              uint64_t v19 = 0LL;
            }

            int v17 = DeviceOSVersionAtOrLaterEx(v13, v14, v15, v16, 170400LL, 140400LL, 170400LL, 100400LL, 10100);

            if (v17) {
              ++v18->_idsWatchCountCache;
            }
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v6);
    }

    return v18->_idsWatchCountCache;
  }

  return result;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v18 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 20 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:account:identifier:didSendWithSuccess:error:context:]",  20LL,  "IDS service %@, account %@, identifier %@, success %d, error %@, context @\n",  v18,  v14,  v15,  v10,  v16,  v17);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 20 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:account:identifier:hasBeenDeliveredWithContext:]",  20LL,  "IDS service %@, account %@, identifier %@, context @\n",  v13,  v10,  v11,  v12);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 20 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:account:incomingMessage:fromID:context:]",  20LL,  "IDS service %@, account %@, message %@, fromID %@, context %@\n",  v16,  v12,  v13,  v14,  v15);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:activeAccountsChanged:]",  30LL,  "IDS service %@ activeAccountsChanged %@\n",  v9,  v6);
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"SDNotificationNameIDSAccountsChanged" object:v7];

  -[SDNearbyAgent service:devicesChanged:](v7, "service:devicesChanged:", v9, 0LL);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 20 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:connectedDevicesChanged:]",  20LL,  "IDS service %@ connectedDevicesChanged %@\n",  v7,  v6);
  }
  self->_idsHasActiveWatchCache = -1;
  -[SDNearbyAgent _update](self, "_update");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent service:devicesChanged:]",  30,  "IDS devicesChanged: %d device(s)\n",  [v6 count]);
  }
  id v7 = self;
  objc_sync_enter(v7);
  idsBluetoothDevicesArray = v7->_idsBluetoothDevicesArray;
  v7->_idsBluetoothDevicesArray = 0LL;

  idsBluetoothDevicesSet = v7->_idsBluetoothDevicesSet;
  v7->_idsBluetoothDevicesSet = 0LL;

  idsBluetoothDeviceIDsForLEPipe = v7->_idsBluetoothDeviceIDsForLEPipe;
  v7->_idsBluetoothDeviceIDsForLEPipe = 0LL;

  idsBluetoothDeviceIDsForMe = v7->_idsBluetoothDeviceIDsForMe;
  v7->_idsBluetoothDeviceIDsForMe = 0LL;

  objc_storeStrong((id *)&v7->_idsDeviceArray, a4);
  idsDeviceBTDictionary = v7->_idsDeviceBTDictionary;
  v7->_idsDeviceBTDictionary = 0LL;

  idsDeviceCountBTDictionary = v7->_idsDeviceCountBTDictionary;
  v7->_idsDeviceCountBTDictionary = 0LL;

  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  v7->_uint64_t allowEnhancedDiscovery = -1;
  v7->_idsAppleTVCountCache = -1;
  v7->_idsContinuityDeviceCountCache = -1;
  v7->_idsMacCountCache = -1;
  *(void *)&v7->_int idsShouldAdvertiseNearbyInfo = -1LL;
  v7->_idsWatchCountCache = -1;
  *(void *)&v7->_idsHasActiveWatchCache = -1LL;
  *(void *)&v7->_idsVisionOS1CountCache = -1LL;
  if (v7->_bleNearbyInfoScanner)
  {
    if (-[NSMutableSet count](v7->_caRequests, "count"))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](v7, "_idsBluetoothDeviceIDsForSharing"));
      -[SFBLEScanner setDeviceFilter:](v7->_bleNearbyInfoScanner, "setDeviceFilter:", v14);
    }

    else
    {
      -[SFBLEScanner setDeviceFilter:](v7->_bleNearbyInfoScanner, "setDeviceFilter:", 0LL);
    }
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v15 = v7->_ddRequests;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (([v20 discoveryFlags] & 0x20) != 0)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForSharing](v7, "idsBluetoothDeviceIDsForSharing"));
LABEL_22:
          __int128 v22 = (void *)v21;
          [v20 setDeviceFilter:v21];

          continue;
        }

        if (([v20 discoveryFlags] & 0x100000) != 0)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](v7, "_idsBluetoothDeviceIDsForMe"));
          goto LABEL_22;
        }

        if (([v20 discoveryFlags] & 0x200000) != 0)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForHomePods](v7, "_idsBluetoothDeviceIDsForHomePods"));
          goto LABEL_22;
        }
      }

      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    }

    while (v17);
  }

  -[SDNearbyAgent _update](v7, "_update");
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v23 postNotificationName:@"SDNotificationNameIDSDevicesChanged" object:v7];
}

- (BOOL)isDeviceValidRIServer:(id)a3
{
  if (self->_isRIClientEnabled) {
    return [a3 hasPrefix:@"iProd"];
  }
  else {
    return 0;
  }
}

- (BOOL)isTempAuthTagKnown:(id)a3 bluetoothAddressData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_idIdentityArray;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "verifyAuthTag:data:type:error:",  v6,  v7,  2,  0,  (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (int)serviceStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceUUID]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v5));

    if (!v6)
    {
      if ([v4 needsSetup]
        && ((unsigned int v7 = [v4 deviceActionType], v7 == 11)
         || v7 == 33
         || [v4 deviceActionType] == 9
         || [v4 deviceActionType] == 10
         || [v4 deviceActionType] == 36
         || [v4 deviceActionType] == 1)
        || [v4 deviceActionType] == 19
        || [v4 deviceActionType] == 22)
      {
        id v8 = [v4 deviceClassCode];
        if (!(_DWORD)v8) {
          objc_msgSend(v4, "setDeviceClassCode:", SFDeviceClassCodeGet(v8, v9));
        }
        unsigned int v10 = [v4 deviceColorCode];
        if (v10 == SFDeviceColorCodeUnknown) {
          [v4 setDeviceColorCode:SFDeviceColorCodeGet()];
        }
        if (self->_homePodIdentifiesAsB520)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent serviceStart:]",  30LL,  "Forcing this device to identify as a B520\n",  v4);
          }

          [v4 setDeviceModelCode:5];
        }

        if (self->_homePodIdentifiesAsB620)
        {
          if (dword_100643B70 <= 30
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent serviceStart:]",  30LL,  "Forcing this device to identify as a B620\n",  v4);
          }

          [v4 setDeviceModelCode:6];
        }

        int homePodModelCodeOverride = self->_homePodModelCodeOverride;
        if (homePodModelCodeOverride < 0) {
          goto LABEL_45;
        }
        if (dword_100643B70 <= 30)
        {
          if (dword_100643B70 != -1
            || (int v16 = _LogCategory_Initialize(&dword_100643B70, 30LL),
                int homePodModelCodeOverride = self->_homePodModelCodeOverride,
                v16))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent serviceStart:]",  30LL,  "Forcing this device to identify with model code %d\n",  homePodModelCodeOverride);
            int homePodModelCodeOverride = self->_homePodModelCodeOverride;
          }
        }
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        id v12 = (void *)SFServiceIdentifierProxHandoff;

        if (v11 != v12) {
          goto LABEL_45;
        }
        id v13 = [v4 deviceClassCode];
        if (!(_DWORD)v13) {
          objc_msgSend(v4, "setDeviceClassCode:", SFDeviceClassCodeGet(v13, v14));
        }
        LOBYTE(homePodModelCodeOverride) = SFDeviceModelCodeGet();
      }

      [v4 setDeviceModelCode:homePodModelCodeOverride];
LABEL_45:
      services = self->_services;
      if (!services)
      {
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v19 = self->_services;
        self->_services = v18;

        services = self->_services;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](services, "setObject:forKeyedSubscript:", v4, v5);
      -[SDNearbyAgent _update](self, "_update");
      LODWORD(self) = 0;
      goto LABEL_48;
    }

    self = (SDNearbyAgent *)4294960575LL;
  }

  else
  {
    self = (SDNearbyAgent *)4294960551LL;
  }

- (void)serviceStop:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceUUID]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_services, "removeObjectForKey:", v4);
    -[SDNearbyAgent _update](self, "_update");
  }

  else if (dword_100643B70 <= 60 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
  }
  {
    LogPrintF(&dword_100643B70, "-[SDNearbyAgent serviceStop:]", 60LL, "### Service stop failed: %#m\n", 4294960551LL);
  }
}

- (void)serviceReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  services = self->_services;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10016AF44;
  v15[3] = &unk_1005CFD28;
  unsigned __int8 v18 = a4;
  unsigned __int8 v19 = a3;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v15);
}

- (void)serviceSendEvent:(id)a3 service:(id)a4
{
}

- (void)serviceSendRequest:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[SDNearbyAgent _sendMessage:frameType:service:session:]( self,  "_sendMessage:frameType:service:session:",  v6,  9LL,  v7,  0LL);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 responseMessageInternalHandler]);

    if (v10)
    {
      if (dword_100643B70 <= 60
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent serviceSendRequest:service:]",  60LL,  "### Completing error response for service request %@ for service %@\n",  v11,  v12);
      }

      id v13 = [[SFResponseMessage alloc] initWithRequestMessage:v6];
      id v17 = @"error";
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
      unsigned __int8 v18 = v14;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      [v13 setHeaderFields:v15];

      id v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v7 responseMessageInternalHandler]);
      ((void (**)(void, id))v16)[2](v16, v13);
    }
  }
}

- (void)serviceSendResponse:(id)a3 service:(id)a4
{
}

- (int)sessionStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerDevice]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceUUID]);
    LogPrintF(&dword_100643B70, "-[SDNearbyAgent sessionStart:]", 30LL, "Session start: service %@, %@\n", v8, v7);
  }

  id v9 = 0LL;
  uint64_t v10 = 4294960588LL;
  if (!v6 || !v7) {
    goto LABEL_38;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v7));

  if (v11)
  {
    id v9 = 0LL;
    uint64_t v10 = 4294960575LL;
    goto LABEL_38;
  }

  if ((unint64_t)-[NSMutableDictionary count](self->_sessions, "count") > 0x7F)
  {
    id v9 = 0LL;
    uint64_t v10 = 4294960532LL;
    goto LABEL_38;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v6));
  if (v12)
  {
    id v9 = (id)v12;
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF(&dword_100643B70, "-[SDNearbyAgent sessionStart:]", 30LL, "Reusing BLE connection for session %@\n", v4);
    }

    [v9 addClient:v4];
    [v9 setAcceptor:0];
  }

  else
  {
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionStart:]",  30LL,  "Create new BLE connection for session %@\n",  v4);
    }

    id v13 = (SFBLEDevice *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
    if (!v13)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
      -[SFBLEDevice setIdentifier:](v13, "setIdentifier:", v6);
    }

    id v9 = [[SFBLEConnection alloc] initWithDevice:v13 acceptor:0];
    [v9 setDispatchQueue:self->_dispatchQueue];
    objc_msgSend(v9, "setSessionFlags:", objc_msgSend(v4, "sessionFlags"));
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v16 = self->_bleConnections;
      self->_bleConnections = v15;

      bleConnections = self->_bleConnections;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v9, v6);
    [v9 addClient:v4];
    [v9 activateDirect];
  }

  if (![v4 serviceType])
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceUUID]);
    [v17 getUUIDBytes:&v28];

    if (v28 == 0x10000001000000LL && v29 == 0xDF80FBF31F000080LL)
    {
      uint64_t v27 = -[SDNearbyAgent _setupSendCreateSession:cnx:](self, "_setupSendCreateSession:cnx:", v4, v9);
      if ((_DWORD)v27)
      {
        uint64_t v10 = v27;
LABEL_38:
        if (dword_100643B70 <= 60
          && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
        {
          LogPrintF(&dword_100643B70, "-[SDNearbyAgent sessionStart:]", 60LL, "### Session start failed: %#m\n", v10);
        }

        goto LABEL_35;
      }
    }
  }

  id v19 = -[WPNearby state](self->_bleWPNearby, "state");
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothStateChangedHandler]);

    if (v21)
    {
      __int128 v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 bluetoothStateChangedHandler]);
      ((void (**)(void, id))v22)[2](v22, v20);
    }
  }

  sessions = self->_sessions;
  if (!sessions)
  {
    __int128 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v25 = self->_sessions;
    self->_sessions = v24;

    sessions = self->_sessions;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v4, v7);
  -[SDNearbyAgent _update](self, "_update");
  LODWORD(v10) = 0;
LABEL_35:

  return v10;
}

- (void)sessionStop:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 peerDevice]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleConnections,  "objectForKeyedSubscript:",  v5));
    if (dword_100643B70 <= 30
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionStop:]",  30LL,  "Session stop: %@, peer %@, connection %@\n",  v8,  v5,  v6);
    }

    if (v6 && ([v6 removeClient:v8] & 1) == 0)
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionStop:]",  30LL,  "Invalidating BLE connection for session %@\n",  v8);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v5);
      [v6 invalidate];
    }
  }

  else if (dword_100643B70 <= 30 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  }
  {
    LogPrintF(&dword_100643B70, "-[SDNearbyAgent sessionStop:]", 30LL, "Session stop: %@ (no peer/connection)\n", v8);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  if (v7) {
    -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v7);
  }
  -[SDNearbyAgent _update](self, "_update");
}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  sessions = self->_sessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10016B890;
  v15[3] = &unk_1005CFD50;
  unsigned __int8 v18 = a4;
  unsigned __int8 v19 = a3;
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v15);
}

- (void)sessionSendEvent:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceUUID]);
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  if (v8)
  {
    id v9 = v8;
    [v8 getUUIDBytes:&v23];
    BOOL v10 = v23 == 0x10000006000000LL && v24 == 0xDF80FBF31F000080LL;
    BOOL v11 = !v10;

    if (!v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDevice]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

      if (v13)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v13));
        if (v14)
        {
          __int128 v15 = (void *)v14;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 headerFields]);

          if (!v16)
          {
            id v17 = (id)objc_claimAutoreleasedReturnValue([v6 bodyData]);
            if ([v17 length])
            {
              unsigned __int8 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
              char v22 = 11;
              -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", &v22, 1LL);
              -[NSMutableData appendData:](v18, "appendData:", v17);
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472LL;
              _OWORD v19[2] = sub_10016BC94;
              v19[3] = &unk_1005CBE78;
              id v17 = v17;
              id v20 = v17;
              uint64_t v21 = v13;
              [v15 sendData:v18 completion:v19];
            }

            else if (dword_100643B70 <= 60 {
                   && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
            }
            {
              LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionSendEvent:session:]",  60LL,  "### Attempt to send Remote app message with no body\n");
            }

            goto LABEL_15;
          }

          if (dword_100643B70 <= 60
            && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
          {
            LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionSendEvent:session:]",  60LL,  "### Attempt to send Remote app message with header fields\n");
          }

- (void)sessionSendRequest:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[SDNearbyAgent _sendMessage:frameType:service:session:]( self,  "_sendMessage:frameType:service:session:",  v6,  9LL,  0LL,  v7);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 responseMessageInternalHandler]);

    if (v10)
    {
      if (dword_100643B70 <= 60
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent sessionSendRequest:session:]",  60LL,  "### Completing error response for request %@ for session %@\n",  v11,  v12);
      }

      id v13 = [[SFResponseMessage alloc] initWithRequestMessage:v6];
      id v17 = @"error";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
      unsigned __int8 v18 = v14;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      [v13 setHeaderFields:v15];

      id v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v7 responseMessageInternalHandler]);
      ((void (**)(void, id))v16)[2](v16, v13);
    }
  }
}

- (void)sessionSendResponse:(id)a3 session:(id)a4
{
}

- (int)_sendMessage:(id)a3 frameType:(unsigned __int8)a4 service:(id)a5 session:(id)a6
{
  id v10 = a3;
  unsigned __int8 v77 = a4;
  id v11 = a5;
  id v12 = a6;
  __int128 v65 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  unsigned int v76 = 0;
  uint64_t v80 = 0LL;
  uint64_t v81 = 0LL;
  v79[0] = 0LL;
  v79[1] = 0LL;
  __int128 v63 = v13;
  if (!-[NSMutableDictionary count](self->_bleConnections, "count"))
  {
    id v15 = 0LL;
    id v16 = 0LL;
    char v22 = 0LL;
    uint64_t v23 = 0LL;
    __int128 v32 = 0LL;
    __int128 v33 = 0LL;
    unsigned __int8 v34 = 0LL;
    __int128 v31 = 0LL;
    unsigned int v76 = 0;
    goto LABEL_48;
  }

  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 peerDevice]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v14 identifier]);

    id v16 = (NSUUID *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v17 = v12;
  }

  else
  {
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v65 peerDevice]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v18 identifier]);

    if (!v15)
    {
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleConnections, "allValues"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 peerDevice]);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v21 identifier]);
    }

    id v16 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1004CB63B);
    id v17 = v11;
  }

  char v22 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceUUID]);
  if (!v15)
  {
    unsigned int v76 = 0;
    if (dword_100643B70 <= 20
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 20LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _sendMessage:frameType:service:session:]",  20LL,  "### Send message no device\n");
    }

    id v15 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_72;
  }

  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[NSMutableData appendBytes:length:](v23, "appendBytes:length:", &v77, 1LL);
  if (!v16)
  {
    unsigned int v76 = -6708;
    if (dword_100643B70 <= 60
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _sendMessage:frameType:service:session:]",  60LL,  "### Send message no session\n");
    }

    id v16 = 0LL;
    goto LABEL_72;
  }

  -[NSUUID getUUIDBytes:](v16, "getUUIDBytes:", v79);
  -[NSMutableData appendBytes:length:](v23, "appendBytes:length:", v79, 16LL);
  if (!v13)
  {
    unsigned int v76 = -6708;
    if (dword_100643B70 <= 60
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _sendMessage:frameType:service:session:]",  60LL,  "### Send message no message identifier\n");
    }

- (int)_setupHandleCreateSession:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)[v7 bytes];
  uint64_t v9 = (uint64_t)[v7 length];
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDevice]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleCreateSession:data:]",  50LL,  "BLE SetupCreateSession received from %@: %'.32@\n",  v11,  v7);
  }

  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  id v12 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1004CB62A);
  if (!v12)
  {
    id v13 = 0LL;
LABEL_18:
    uint64_t v16 = 4294960596LL;
    goto LABEL_21;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v12));
  if (!v13)
  {
    uint64_t v16 = 4294960569LL;
    goto LABEL_21;
  }

  if (v9 > 16)
  {
    if ((unint64_t)v9 < 0x31)
    {
      uint64_t v16 = 4294960553LL;
      goto LABEL_21;
    }

    uint64_t v14 = v8 + 1;
    id v15 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v8 + 1);
    if (v15)
    {
      uint64_t v16 = (uint64_t)v15;
      uint64_t v30 = v13;
      id v17 = v6;
      unsigned __int8 v18 = v8 + 17;
      unsigned __int8 v19 = (SDSession *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setupSessions,  "objectForKeyedSubscript:",  v15));
      if (!v19)
      {
        unsigned __int8 v19 = objc_alloc_init(&OBJC_CLASS___SDSession);
        -[SDSession setIdentifier:](v19, "setIdentifier:", v16);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDevice]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
        -[SDSession setPeerIdentifier:](v19, "setPeerIdentifier:", v21);

        setupSessions = self->_setupSessions;
        if (!setupSessions)
        {
          uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v24 = self->_setupSessions;
          self->_setupSessions = v23;

          setupSessions = self->_setupSessions;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v19, v16);
      }

      -[SDSession setSessionCreated:](v19, "setSessionCreated:", 1LL);
      RandomBytes(v34, 32LL);
      cccurve25519_make_pub(v35, v34);
      cccurve25519(v33, v34, v18);
      uint64_t v25 = kCryptoHashDescriptor_SHA512;
      CryptoHKDF(kCryptoHashDescriptor_SHA512, v33, 32LL, "WriteSalt", 9LL, "WriteKey", 8LL, 32LL, v32);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v32, 32LL));
      -[SDSession setReadKey:](v19, "setReadKey:", v26);

      -[SDSession setReadNonce:](v19, "setReadNonce:", 0LL);
      CryptoHKDF(v25, v33, 32LL, "ReadSalt", 8LL, "ReadKey", 7LL, 32LL, v32);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v32, 32LL));
      -[SDSession setWriteKey:](v19, "setWriteKey:", v27);

      -[SDSession setWriteNonce:](v19, "setWriteNonce:", 0LL);
      uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      char v31 = 33;
      -[NSMutableData appendBytes:length:](v28, "appendBytes:length:", &v31, 1LL);
      -[NSMutableData appendBytes:length:](v28, "appendBytes:length:", v14, 16LL);
      -[NSMutableData appendBytes:length:](v28, "appendBytes:length:", v35, 32LL);
      id v6 = v17;
      [v17 sendData:v28 completion:0];

      LODWORD(v16) = 0;
      id v13 = v30;
      goto LABEL_15;
    }

    goto LABEL_18;
  }

  uint64_t v16 = 4294960588LL;
LABEL_21:
  if (dword_100643B70 <= 60 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleCreateSession:data:]",  60LL,  "### BLE SetupCreateSession failed: %#m\n",  v16);
  }
LABEL_15:

  return v16;
}

- (int)_setupHandleSessionCreated:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (char *)[v7 bytes];
  uint64_t v9 = (uint64_t)[v7 length];
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDevice]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleSessionCreated:data:]",  50LL,  "BLE SetupSessionCreated received from %@: %'.32@\n",  v11,  v7);
  }

  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  if (v9 <= 16)
  {
    id v12 = 0LL;
    uint64_t v14 = 0LL;
    int v25 = -6708;
  }

  else if ((unint64_t)v9 < 0x31)
  {
    id v12 = 0LL;
    uint64_t v14 = 0LL;
    int v25 = -6743;
  }

  else
  {
    id v12 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v8 + 1);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setupSessions,  "objectForKeyedSubscript:",  v12));
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = objc_claimAutoreleasedReturnValue([v13 dhSecretKey]);
        id v16 = [v15 bytes];

        if (v16)
        {
          cccurve25519(v28, v16, v8 + 17);
          uint64_t v17 = kCryptoHashDescriptor_SHA512;
          CryptoHKDF(kCryptoHashDescriptor_SHA512, v28, 32LL, "ReadSalt", 8LL, "ReadKey", 7LL, 32LL, v27);
          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v27, 32LL));
          [v14 setReadKey:v18];

          [v14 setReadNonce:0];
          CryptoHKDF(v17, v28, 32LL, "WriteSalt", 9LL, "WriteKey", 8LL, 32LL, v27);
          unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v27, 32LL));
          [v14 setWriteKey:v19];

          [v14 setWriteNonce:0];
          [v14 setSessionCreated:1];
          while (1)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
            id v21 = [v20 count];

            if (!v21) {
              break;
            }
            char v22 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

            id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
            [v24 removeObjectAtIndex:0];

            -[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]( self,  "_setupSendData:sessionIdentifier:cnx:clientSession:",  v23,  v12,  v6,  0LL);
          }

          int v25 = 0;
        }

        else
        {
          int v25 = -6745;
        }
      }

      else
      {
        int v25 = -6727;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      int v25 = -6700;
    }
  }

  return v25;
}

- (int)_setupHandleSessionEncryptedFrame:(id)a3 type:(unsigned __int8)a4 cnx:(id)a5
{
  unsigned int v31 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = (char *)[v9 bytes];
  uint64_t v11 = (uint64_t)[v9 length];
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 peerDevice]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:]",  30LL,  "BLE SetupEMsg type 0x%02X received from %@: %'.32@\n",  v31,  v13,  v9);
  }

  memset(v32, 0, 12);
  if (v11 <= 16)
  {
    char v22 = 0LL;
    uint64_t v17 = 0LL;
    id v15 = 0LL;
    uint64_t v25 = 4294960588LL;
    goto LABEL_13;
  }

  id v30 = v9;
  uint64_t v14 = v11 - 33;
  if ((unint64_t)v11 < 0x21)
  {
    char v22 = 0LL;
    uint64_t v17 = 0LL;
    id v15 = 0LL;
    uint64_t v25 = 4294960553LL;
LABEL_22:
    id v9 = v30;
    goto LABEL_13;
  }

  id v15 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v10 + 1);
  if (!v15)
  {
    char v22 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v25 = 4294960596LL;
    goto LABEL_22;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v15));
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v29 = v15;
    id v18 = v8;
    id v19 = objc_claimAutoreleasedReturnValue([v16 readKey]);
    id v20 = [v19 bytes];

    if (v20)
    {
      uint64_t v21 = (uint64_t)&v10[v11 - 16];
      LODWORD(v32[0]) = 0;
      *(void *)((char *)v32 + 4) = [v17 readNonce];
      char v22 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v11 - 33);
      uint64_t v23 = -[NSMutableData mutableBytes](v22, "mutableBytes");
      uint64_t v24 = chacha20_poly1305_decrypt_all_96x32(v20, v32, v10, 17LL, v10 + 17, v14, v23, v21);
      if ((_DWORD)v24)
      {
        uint64_t v25 = v24;
        id v8 = v18;
      }

      else
      {
        objc_msgSend(v17, "setReadNonce:", (char *)objc_msgSend(v17, "readNonce") + 1);
        id v8 = v18;
        uint64_t v25 = -[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]( self,  "_setupHandleSessionMessageType:src:end:cnx:session:",  v31,  v23,  &v23[v14],  v18,  v17);
        if (!(_DWORD)v25)
        {
          id v15 = v29;
          id v9 = v30;
          goto LABEL_18;
        }
      }

      id v15 = v29;
      id v9 = v30;
    }

    else
    {
      char v22 = 0LL;
      uint64_t v25 = 4294960551LL;
      id v8 = v18;
      id v15 = v29;
      id v9 = v30;
    }
  }

  else
  {
    if (dword_100643B70 > 60)
    {
      char v22 = 0LL;
      uint64_t v17 = 0LL;
      LODWORD(v25) = -6727;
      id v9 = v30;
      goto LABEL_18;
    }

    id v9 = v30;
    if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)) {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:]",  60LL,  "### BLE SetupEMsg session %@ not found\n",  v15);
    }
    char v22 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v25 = 4294960569LL;
  }

- (int)_setupHandleSessionMessageType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6 session:(id)a7
{
  int v10 = a3;
  id v58 = a4;
  id v56 = a6;
  id v55 = a7;
  unsigned int v57 = 0;
  if (a5 - a4 <= 15)
  {
    unsigned int v57 = -6750;
    if (dword_100643B70 <= 60
      && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
    {
      LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]",  60LL,  "### BLE SetupRecvMsg no message ID (%tu bytes)\n",  a5 - a4);
    }

    id v12 = 0LL;
    uint64_t v53 = 0LL;
    goto LABEL_65;
  }

  id v12 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a4);
  id v58 = a4 + 16;
  uint64_t v13 = CFBinaryPlistStreamedCreateWithBytesEx2(a4 + 16, a5 - (a4 + 16), 112LL, &v58, &v57);
  uint64_t v53 = (void *)v13;
  if (v57)
  {
LABEL_65:
    id v16 = 0LL;
    goto LABEL_66;
  }

  uint64_t v14 = v13;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    id v16 = 0LL;
    goto LABEL_59;
  }

  id v16 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2(v58, a5 - v58, 112LL, &v58, &v57);
  if (v57)
  {
LABEL_66:
    uint64_t v21 = 0LL;
    id v20 = 0LL;
    __int128 v33 = 0LL;
    id v22 = 0LL;
    uint64_t v24 = 0LL;
    goto LABEL_35;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
LABEL_59:
    uint64_t v21 = 0LL;
    id v20 = 0LL;
    __int128 v33 = 0LL;
    id v22 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v28 = 0LL;
    unsigned int v57 = -6756;
    goto LABEL_36;
  }

  switch(v10)
  {
    case '$':
      id v18 = self;
      id v19 = objc_alloc_init(&OBJC_CLASS___SFResponseMessage);
      uint64_t v21 = 0LL;
      id v20 = 0LL;
      id v54 = v19;
      break;
    case '#':
      id v18 = self;
      id v19 = objc_alloc_init(&OBJC_CLASS___SFRequestMessage);
      uint64_t v21 = 0LL;
      id v54 = 0LL;
      id v20 = v19;
      break;
    case '""':
      id v18 = self;
      id v19 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
      id v20 = 0LL;
      id v54 = 0LL;
      uint64_t v21 = v19;
      break;
    default:
      __int128 v49 = (SDNearbyAgent *)FatalErrorF("Bad frame type: %d", v10);
      return -[SDNearbyAgent _setupSendCreateSession:cnx:](v49, v50, v51, v52);
  }

  id v22 = v19;
  uint64_t v23 = v12;
  [v22 setIdentifier:v12];
  [v22 setHeaderFields:v14];
  [v22 setBodyData:v16];
  uint64_t v24 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v56 peerDevice]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
  -[SFDevice setIdentifier:](v24, "setIdentifier:", v26);

  [v22 setPeerDevice:v24];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v55 clientSession]);
  if (!v27)
  {
    unsigned __int8 v34 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1004CB62A);
    if (v34)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18->_services, "objectForKeyedSubscript:", v34));
      __int128 v36 = v35;
      if (v35)
      {
        if (v21
          && (__int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v35 eventMessageHandler]),
              v37,
              v37))
        {
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 eventMessageHandler]);
          id v39 = (void (*)(void))v38[2];
        }

        else
        {
          if (!v20
            || (uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v36 requestMessageHandler]),
                v42,
                !v42))
          {
            if (v54)
            {
              __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v36 responseMessageInternalHandler]);

              if (v44)
              {
                __int128 v45 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v36 responseMessageInternalHandler]);
                __int128 v33 = v54;
                ((void (**)(void, id))v45)[2](v45, v54);

                id v12 = v23;
                goto LABEL_34;
              }
            }

            if (dword_100643B70 <= 60)
            {
              id v12 = v23;
              if (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)) {
                LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]",  60LL,  "### BLE NearbyInfo setup service receive with no handler: %@\n",  v22);
              }
              goto LABEL_33;
            }

- (int)_setupSendCreateSession:(id)a3 cnx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendCreateSession:cnx:]",  50LL,  "BLE SetupSendCreateSession %@\n",  v8);
  }
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  v20[0] = 0LL;
  v20[1] = 0LL;
  if (v8)
  {
    id v9 = (SDSession *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setupSessions,  "objectForKeyedSubscript:",  v8));
    if (!v9)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___SDSession);
      -[SDSession setIdentifier:](v9, "setIdentifier:", v8);
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDevice]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      -[SDSession setPeerIdentifier:](v9, "setPeerIdentifier:", v11);

      setupSessions = self->_setupSessions;
      if (!setupSessions)
      {
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v14 = self->_setupSessions;
        self->_setupSessions = v13;

        setupSessions = self->_setupSessions;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v9, v8);
    }

    -[SDSession setClientSession:](v9, "setClientSession:", v6);
    RandomBytes(v21, 32LL);
    cccurve25519_make_pub(v22, v21);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, 32LL));
    -[SDSession setDhSecretKey:](v9, "setDhSecretKey:", v15);

    id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    char v19 = 32;
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v19, 1LL);
    [v8 getUUIDBytes:v20];
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", v20, 16LL);
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", v22, 32LL);
    [v7 sendData:v16 completion:0];

    int v17 = 0;
  }

  else if (dword_100643B70 <= 60 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL)))
  }
  {
    int v17 = -6705;
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendCreateSession:cnx:]",  60LL,  "### BLE SetupSendCreateSession failed: %#m\n",  4294960591LL);
  }

  else
  {
    int v17 = -6705;
  }

  return v17;
}

- (int)_setupSendData:(id)a3 sessionIdentifier:(id)a4 cnx:(id)a5 clientSession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v36[0] = 0LL;
  v36[1] = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v11));
  if (v14
    || (id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_setupSessions, "allValues")),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]),
        v30,
        !v13)
    || v14)
  {
LABEL_2:
    if ([v14 sessionCreated])
    {
      id v15 = objc_claimAutoreleasedReturnValue([v14 writeKey]);
      id v16 = [v15 bytes];

      if (!v16)
      {
        uint64_t v32 = 4294960551LL;
        goto LABEL_25;
      }

      int v37 = 0;
      id v38 = [v14 writeNonce];
      objc_msgSend(v14, "setWriteNonce:", (char *)objc_msgSend(v14, "writeNonce") + 1);
      if ((unint64_t)[v10 length] < 0x11)
      {
        uint64_t v32 = 4294960553LL;
        goto LABEL_25;
      }

      id v17 = [v10 mutableCopy];
      id v18 = (char *)[v17 mutableBytes];
      char v19 = (char *)[v17 length];
      if (*(_OWORD *)(v18 + 1) == 0LL)
      {
        id v35 = v10;
        id v20 = v11;
        id v21 = v12;
        id v22 = v13;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        [v23 getUUIDBytes:v18 + 1];

        id v13 = v22;
        id v12 = v21;
        id v11 = v20;
        id v10 = v35;
      }

      chacha20_poly1305_encrypt_all_96x32(v16, &v37, v18, 17LL, v18 + 17, v19 - 17, v18 + 17, v36);
      [v17 appendBytes:v36 length:16];
      [v12 sendData:v17 completion:0];
    }

    else
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
      id v25 = [v24 count];

      if ((unint64_t)v25 > 0x7F)
      {
        uint64_t v32 = 4294960532LL;
        goto LABEL_25;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);

      if (!v26)
      {
        uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        [v14 setSendDataQueue:v27];
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
      [v28 addObject:v10];

      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 sendDataQueue]);
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]",  30,  "BLE SetupSendMsg queuing data until session created (%ld)\n",  [v29 count]);
      }
    }

    LODWORD(v32) = 0;
    goto LABEL_21;
  }

  id v31 = v13;
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]",  50LL,  "BLE Setup re-creating lost session ID %@\n",  v11);
  }
  uint64_t v32 = -[SDNearbyAgent _setupSendCreateSession:cnx:](self, "_setupSendCreateSession:cnx:", v31, v12);
  if ((_DWORD)v32) {
    goto LABEL_24;
  }
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v11));
  if (v34)
  {
    uint64_t v14 = (void *)v34;

    goto LABEL_2;
  }

  if (dword_100643B70 <= 60 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]",  60LL,  "### BLE SetupSendMsg no setup session after re-create?\n");
  }
  uint64_t v32 = 4294960534LL;
LABEL_24:

  uint64_t v14 = 0LL;
LABEL_25:
  if (dword_100643B70 <= 60 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 60LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]",  60LL,  "### BLE SetupSendMsg failed: %#m\n",  v32);
  }
LABEL_21:

  return v32;
}

- (void)startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016E294;
  block[3] = &unk_1005CBF80;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v17 identifier]);
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v6));
    if (v8)
    {
      id v9 = (id)v8;
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _startUnlockBLEConnectionWithDevice:encrypted:]",  30LL,  "Reusing BLE connection for unlock\n");
      }

      [v9 addClient:self];
      [v9 setAcceptor:0];
    }

    else
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _startUnlockBLEConnectionWithDevice:encrypted:]",  30LL,  "Creating BLE connection for unlock\n");
      }

      id v9 = [[SFBLEConnection alloc] initWithDevice:v17 acceptor:0];
      [v9 setBleEncrypted:v4];
      [v9 setDispatchQueue:self->_dispatchQueue];
      [v9 setLatencyCritical:1];
      [v9 setUseCase:131075];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForLEPipe](self, "idsBluetoothDeviceIDsForLEPipe"));
      bleConnections = self->_bleConnections;
      if (!bleConnections)
      {
        id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v13 = self->_bleConnections;
        self->_bleConnections = v12;

        bleConnections = self->_bleConnections;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v9, v7);
      [v9 addClient:self];
      [v9 activateDirect];
    }
  }

  else
  {
    uint64_t v14 = (SDNearbyAgent *)FatalErrorF("Start unlock connection with no identifier");
    -[SDNearbyAgent stopUnlockBLEConnectionWithDevice:](v14, v15, v16);
  }

- (void)stopUnlockBLEConnectionWithDevice:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016E508;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_stopUnlockBLEConnectionWithDevice:(id)a3
{
  id v13 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v13 identifier]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleConnections,  "objectForKeyedSubscript:",  v4));
    id v7 = v6;
    if (v6 && ([v6 removeClient:self] & 1) == 0)
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _stopUnlockBLEConnectionWithDevice:]",  30LL,  "Invalidating BLE connection for unlock\n");
      }

      -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v5);
      [v7 invalidate];
    }
  }

  else
  {
    id v8 = (SDNearbyAgent *)FatalErrorF("Stop unlock connection with no identifier");
    -[SDNearbyAgent sendUnlockData:toBLEDevice:completion:](v8, v9, v10, v11, v12);
  }

- (void)sendUnlockData:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10016E6C4;
  v15[3] = &unk_1005CC188;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendUnlockDataDirect:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
}

- (void)_sendUnlockData:(id)a3 toBLEDevice:(id)a4 direct:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v13)
  {
    id v14 = (void *)v13;
    if (self->_unlockBtPipe && [v11 useBTPipe])
    {
      if (dword_100643B70 <= 30
        && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL)))
      {
        LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _sendUnlockData:toBLEDevice:direct:completion:]",  30,  "Send data req: %@ (%ld bytes)\n",  v10,  [v10 length]);
      }

      unlockBtPipe = self->_unlockBtPipe;
      if (v7) {
        -[SFBLEPipe sendFrameTypeDirect:payload:completion:]( unlockBtPipe,  "sendFrameTypeDirect:payload:completion:",  3LL,  v10,  v12);
      }
      else {
        -[SFBLEPipe sendFrameType:payload:completion:](unlockBtPipe, "sendFrameType:payload:completion:", 3LL, v10, v12);
      }
    }

    else
    {
      SEL v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleConnections,  "objectForKeyedSubscript:",  v14));
      if (v15)
      {
        char v24 = 7;
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v24,  1LL));
        [v16 appendData:v10];
        if (v7) {
          [v15 sendDataDirect:v16 completion:v12];
        }
        else {
          [v15 sendData:v16 completion:v12];
        }
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6745LL,  0LL));
        v12[2](v12, v17);
      }
    }
  }

  else
  {
    char v19 = (SDNearbyAgent *)FatalErrorF("Send unlock data to BLE device with no identifier");
    -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](v19, v20, v21, v22, v23);
  }

- (void)_unlockReceivedFrameData:(id)a3 peer:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100643B70 <= 30 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 30LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent _unlockReceivedFrameData:peer:device:]",  30,  "AutoUnlock received %ld bytes from %@\n",  [v8 length],  v9);
  }
  services = self->_services;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10016EA6C;
  v16[3] = &unk_1005CFD78;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v16);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v19[0] = @"SDNearbyAgentNotificationInfoKeyBLEDevice";
  v19[1] = @"SDNearbyAgentNotificationInfoKeyBLEData";
  v20[0] = v10;
  v20[1] = v13;
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  [v14 postNotificationName:@"SDNearbyAgentNotificationUnlockBLEDataReceived" object:self userInfo:v15];
}

- (void)_unlockApproveBluetoothIDsChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016EB50;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_unlockDeviceFilterChangedForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceFilter]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 approveBluetoothIDs]);
  [v4 setDeviceFilter:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceFilter]);
  if (!v8)
  {
    id v9 = objc_opt_new(&OBJC_CLASS___NSSet);
    [v4 setDeviceFilter:v9];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceFilter]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceLostHandler]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v5));
    [v12 minusSet:v10];
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyInfoDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v17)));
          if (v18)
          {
            char v19 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 deviceLostHandler]);
            ((void (**)(void, void *))v19)[2](v19, v18);
          }

          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v15);
    }
  }

  SEL v20 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceFoundHandler]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v10));
    [v21 minusSet:v5];
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        id v26 = 0LL;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ddNearbyInfoDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v26),  (void)v29));
          if (v27)
          {
            uint64_t v28 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 deviceFoundHandler]);
            ((void (**)(void, void *))v28)[2](v28, v27);
          }

          id v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v24);
    }
  }
}

- (void)unlockUpdateAdvertising:(unsigned int)a3 mask:(unsigned int)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10016EFBC;
  v5[3] = &unk_1005CC330;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

- (void)unlockStartTestClientWithDevice:(id)a3
{
  id v4 = a3;
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent unlockStartTestClientWithDevice:]",  50LL,  "Unlock test client with device: %@\n",  v4);
  }
  -[SDNearbyAgent startUnlockBLEConnectionWithDevice:encrypted:]( self,  "startUnlockBLEConnectionWithDevice:encrypted:",  v4,  1LL);
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    unsigned int v6 = unlockTestClientTimer;
    dispatch_source_cancel(v6);
    unsigned int v7 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0LL;
  }

  id v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v9 = self->_unlockTestClientTimer;
  self->_unlockTestClientTimer = v8;

  id v10 = self->_unlockTestClientTimer;
  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v10, v11, 0x3B9ACA00uLL, 0xEE6B280uLL);
  id v12 = self->_unlockTestClientTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10016F2EC;
  handler[3] = &unk_1005CB480;
  handler[4] = self;
  id v13 = v4;
  id v19 = v13;
  dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
  id v14 = self->_unlockTestClientTimer;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10016F3EC;
  v16[3] = &unk_1005CB480;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  dispatch_source_set_cancel_handler((dispatch_source_t)v14, v16);
  dispatch_resume((dispatch_object_t)self->_unlockTestClientTimer);
}

- (void)unlockStopTestClient
{
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    id v5 = unlockTestClientTimer;
    dispatch_source_cancel(v5);
    id v4 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0LL;
  }

- (void)unlockStartTestServer
{
}

- (void)unlockStopTestServer
{
}

- (void)_systemWillSleep
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016F654;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016F6C0;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)screenOn
{
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

- (BOOL)hasAdHocPairings
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  dispatch_semaphore_t v2 = self->_idIdentityArray;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)i), "type", (void)v7) == 15)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSArray)adHocPairedDeviceIdentities
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = self->_idIdentityArray;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100643B70 <= 50 && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL))) {
    LogPrintF( &dword_100643B70,  "-[SDNearbyAgent cutWiFiManagerLinkDidChange:context:]",  50LL,  "WifiManager cutWiFiManagerLinkDidChange");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016F9CC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPipePing
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016FA2C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_testPipePing
{
  if (self->_unlockBtPipe)
  {
    uint64_t v4 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 8LL);
    id v3 = -[NSMutableData mutableBytes](v4, "mutableBytes");
    *id v3 = CFAbsoluteTimeGetCurrent();
    -[SFBLEPipe sendFrameType:payload:completion:]( self->_unlockBtPipe,  "sendFrameType:payload:completion:",  1LL,  v4,  &stru_1005CFDB8);
  }

  else if (dword_100643B70 <= 50 {
         && (dword_100643B70 != -1 || _LogCategory_Initialize(&dword_100643B70, 50LL)))
  }
  {
    LogPrintF(&dword_100643B70, "-[SDNearbyAgent _testPipePing]", 50LL, "### BT Pipe not enabled\n");
  }

- (BOOL)autoUnlockActive
{
  return self->_autoUnlockActive;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (BOOL)boostNearbyInfo
{
  return self->_boostNearbyInfo;
}

- (CUBluetoothClient)btConnectedDeviceMonitor
{
  return self->_btConnectedDeviceMonitor;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)enhancedDiscovery
{
  return self->_enhancedDiscovery;
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (RPIdentity)idSelfIdentity
{
  return self->_idSelfIdentity;
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (BOOL)preventNearbyActionAdvertising
{
  return self->_preventNearbyActionAdvertising;
}

- (void)setPreventNearbyActionAdvertising:(BOOL)a3
{
  self->_preventNearbyActionAdvertising = a3;
}

- (RPIdentity)temporarySelfIdentity
{
  return self->_temporarySelfIdentity;
}

- (void).cxx_destruct
{
}

@end