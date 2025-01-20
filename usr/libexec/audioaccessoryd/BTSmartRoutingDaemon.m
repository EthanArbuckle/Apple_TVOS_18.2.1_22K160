@interface BTSmartRoutingDaemon
+ (id)sharedBTSmartRoutingDaemon;
- (BOOL)_aacpConnectedCheck:(id)a3;
- (BOOL)_arbitrationTimeout:(id)a3 withScore:(int)a4;
- (BOOL)_bluetoothProductIDNoEarDetect:(unsigned int)a3;
- (BOOL)_bluetoothProductIDNoUTP:(unsigned int)a3;
- (BOOL)_checkValidBatteryValue:(id)a3;
- (BOOL)_deviceSupportsHijackV2:(id)a3 withDevice:(id)a4;
- (BOOL)_getForceDisconnectBit:(id)a3;
- (BOOL)_inCaseLidClosed:(id)a3;
- (BOOL)_inEarConnectedCheck:(id)a3;
- (BOOL)_inEarNearbyCheck:(id)a3;
- (BOOL)_isAddDeviceToBackoffDueToDisconnect;
- (BOOL)_isAllWxEnabledInEarDetection;
- (BOOL)_isAnyConnectedWxInEarCheck;
- (BOOL)_isAnyHRMEnabledDeviceConnected;
- (BOOL)_isAnyWxStream;
- (BOOL)_isConnectionTipiv2;
- (BOOL)_isDevicePairedCheck:(id)a3;
- (BOOL)_isEligibleForPreemptiveBanner:(BOOL)a3 firstPreemptiveBanner:(BOOL)a4 inEarState:(BOOL)a5 srDeviceCount:(unint64_t)a6 audioState:(int64_t)a7 inAddress:(id)a8;
- (BOOL)_isEligibleForTipiV2:(id)a3 firstDeviceTipiScore:(int)a4 secondDeviceTipiScore:(int)a5 currentDeviceScore:(int)a6 sourceDeviceCount:(unsigned int)a7 isOnDemandConnect:(BOOL)a8 address:(id)a9 lastConnectedHost:(id)a10;
- (BOOL)_isForceRejectPipe;
- (BOOL)_isForceTipiv2;
- (BOOL)_isInEarDetectionDisabled:(id)a3;
- (BOOL)_isInEarToOutOfEar:(id)a3;
- (BOOL)_isInHijackBlockingMode;
- (BOOL)_isInTipi;
- (BOOL)_isManualConnection:(id)a3;
- (BOOL)_isMyAddress:(id)a3;
- (BOOL)_isOnDemandConnectInProgress;
- (BOOL)_isOtherTipiDeviceBeforeTrain:(id)a3 withIOS:(unsigned int)a4 withMacOS:(unsigned int)a5;
- (BOOL)_isPhoneCall:(id)a3;
- (BOOL)_isReceivedLegacyTipiConnect:(id)a3;
- (BOOL)_isSmartRoutingCapableDevice:(id)a3;
- (BOOL)_lastConnectIsWatchCheck:(id)a3;
- (BOOL)_lowBatteryClearSFDevice:(id)a3 reason:(const char *)a4;
- (BOOL)_lowBatteryTrackSFDevice:(id)a3 batteryLevel:(double)a4 batteryType:(int64_t)a5;
- (BOOL)_productColorAssetExists:(unsigned int)a3 withColor:(char)a4;
- (BOOL)_productHasColors:(unsigned int)a3;
- (BOOL)_shouldDelayRouteToSpeaker:(id)a3;
- (BOOL)_supportsPhoneWatchTipi:(unsigned int)a3;
- (BOOL)_supportsSR:(id)a3 andProductID:(unsigned int)a4;
- (BOOL)_supportsTipi:(id)a3;
- (BOOL)_verifyWxConnectedRouted:(id)a3;
- (BOOL)allowHijackWithAudioScore:(unsigned int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5;
- (BOOL)diagnosticControl:(id)a3 completion:(id)a4;
- (BOOL)isInAnyTipi;
- (BTSmartRoutingDaemon)init;
- (BTSmartRoutingRouteRequest)pipePendingRequest;
- (double)_lowestBatteryInfoForCBDevice:(id)a3;
- (double)_lowestBatteryInfoForSFDevice:(id)a3;
- (id)_bluetoothProductDefaultAsset:(unsigned int)a3;
- (id)_bluetoothProductIDToAsset:(unsigned int)a3;
- (id)_bluetoothProductIDToCaseAsset:(unsigned int)a3 andAddress:(id)a4;
- (id)_bluetoothProductIDToColorAsset:(unsigned int)a3 withColor:(unsigned __int8)a4;
- (id)_bluetoothProductIDToLocalizationString:(unsigned int)a3 withActionButton:(BOOL)a4;
- (id)_descriptionWithLevel:(int)a3;
- (id)_findActiveWxDevice;
- (id)_getActiveNearbyWxAdress;
- (id)_getCurrentRoute;
- (id)_getIDSDeviceFromBtAddress:(id)a3;
- (id)_getInEarSrWxDevice;
- (id)_getJsonStringFromDictionary:(id)a3;
- (id)_getWxChipVersion:(unsigned int)a3;
- (id)_getWxFWVersion:(id)a3;
- (id)_myBluetoothAddressString;
- (id)_nearbyMacAddressTranslate:(id)a3;
- (id)_productColorAssetLookup:(unsigned int)a3 andAddress:(id)a4;
- (id)_verifyWxConnectedBTAddress:(id)a3 withVersion:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (int)_nearbyDeviceType:(id)a3;
- (int64_t)_checkTickswithinWindow:(unint64_t)a3 withWindow:(unint64_t)a4;
- (int64_t)_getRssiNearby:(id)a3;
- (unsigned)_getWxColorCode:(id)a3;
- (unsigned)_getWxProductID:(id)a3;
- (void)_TUMonitorEnsureStarted;
- (void)_TUMonitorEnsureStopped;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_activate;
- (void)_activityMonitorEnsureStarted;
- (void)_activityMonitorEnsureStopped;
- (void)_anyPairedDeviceSupportsSmartRouting;
- (void)_budSwapDetectionStartTimer:(id)a3;
- (void)_cacheBudswapInfo:(id)a3;
- (void)_callMonitorEnsureStarted;
- (void)_callMonitorEnsureStopped;
- (void)_cancelInUseBannerForCallTimer;
- (void)_cancelRingtoneTimer;
- (void)_cancelTriangleRecoveryTimer;
- (void)_checkTriangleRecovery;
- (void)_connectedDeviceFound:(id)a3;
- (void)_connectedDeviceLost:(id)a3;
- (void)_connectedDeviceMonitorEnsureStarted;
- (void)_connectedDeviceMonitorEnsureStopped;
- (void)_disconnectOtherTipiDevice:(id)a3;
- (void)_disconnectReason:(id)a3 reason:(unint64_t)smartRoutingDisconnectReason;
- (void)_dumpNearbyWxDevice;
- (void)_dumpSrWxDevice;
- (void)_evaluatorEnsureStarted;
- (void)_evaluatorEnsureStopped;
- (void)_evaluatorRun;
- (void)_evaluatorRunTipiElection:(id)a3 nearbyInfoDevicesMap:(id)a4 localScore:(int)a5;
- (void)_evaluatorRunforTVOS:(id)a3;
- (void)_handleCallStateChange:(id)a3;
- (void)_handleHRMSessionChanged:(BOOL)a3;
- (void)_handleHighestAudioCategoryChange:(id)a3;
- (void)_handleHijackBlockingwithDevice:(id)a3;
- (void)_handleMediaPauseStateChanged;
- (void)_handleMediaPlayStateChange:(id)a3;
- (void)_handleMediaServerConnectionDied:(id)a3;
- (void)_handlePhoneOwnershipTriangleTimer;
- (void)_handleProactiveRoutingRouteCheck:(id)a3;
- (void)_handleSmartRoutingDisabled:(id)a3;
- (void)_handleTUCallStateChange:(id)a3;
- (void)_hijackBackoffReset:(id)a3 withReason:(id)a4;
- (void)_hijackBlockingModeChangedFromClient:(id)a3 mode:(BOOL)a4 completion:(id)a5;
- (void)_iPhoneScreenOnPowerEvent;
- (void)_logEvalError:(id)a3;
- (void)_logEvalWxError:(id)a3 withError:(id)a4;
- (void)_logPreemptiveBannerEvalError:(id)a3;
- (void)_lowBatteryDeviceFound:(id)a3;
- (void)_lowBatteryDeviceLost:(id)a3;
- (void)_lowBatteryLoad;
- (void)_lowBatteryReportGood:(id)a3;
- (void)_lowBatteryReset;
- (void)_lowBatterySave:(BOOL)a3;
- (void)_lowBatteryShowAlertWithLowBatteryDevice:(id)a3;
- (void)_lowBatteryUpdate;
- (void)_mediaRouteDiscoveryStarted;
- (void)_mediaRouteDiscoveryStopped;
- (void)_mediaRouteHijackResponse:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5 andAllowedToHijack:(BOOL)a6 withReason:(id)a7;
- (void)_mediaRouteHijackResponseHandlerFor:(id)a3 allowedToHijack:(BOOL)a4 withReason:(id)a5;
- (void)_mediaRouteHijackWithAudioScore:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5;
- (void)_mediaRouteMonitorActiveAudioRouteChanged:(id)a3;
- (void)_mediaRouteMonitorActivityLevelUpdate:(id)a3;
- (void)_mediaRouteMonitorEnsureStarted;
- (void)_mediaRouteMonitorEnsureStopped;
- (void)_mediaRouteMonitorSpeakRoute;
- (void)_nearbyDeviceInfoCheck;
- (void)_nearbyDeviceInfoTriangleRecoveryTimer;
- (void)_nearbyInfoActivityChanged;
- (void)_nearbyInfoActivityCriticalStart;
- (void)_nearbyInfoActivityDelayCheck:(unint64_t)a3;
- (void)_nearbyInfoDeviceFound:(id)a3;
- (void)_nearbyInfoDeviceLost:(id)a3;
- (void)_nearbyInfoDiscoveryEnsureStarted;
- (void)_nearbyInfoDiscoveryEnsureStopped;
- (void)_nearbyInfoSetAudioRoutingScore;
- (void)_nearbyWxChanged:(id)a3;
- (void)_notifyOtherTipiDeviceTipiScoreChanged:(int)a3 andNewScore:(int)a4;
- (void)_otherTipiDeviceTipiScoreChanged:(id)a3 withOptions:(id)a4;
- (void)_pairedDeviceMonitorEnsureStarted;
- (void)_pairedDeviceMonitorEnsureStopped;
- (void)_pipeEnsureStarted;
- (void)_pipeEnsureStopped;
- (void)_postNotification:(const char *)a3;
- (void)_powerLogSmartIncomingConnection;
- (void)_powerLogSmartRoutingScanStarted:(unsigned __int8)a3;
- (void)_powerLogSmartRoutingScanStopped:(unsigned __int8)a3;
- (void)_powerMonitorEnsureStarted;
- (void)_powerMonitorEnsureStopped;
- (void)_powerMonitorScreenLockChanged;
- (void)_prefsChanged;
- (void)_proactivelyTakeOwnership;
- (void)_receivedAudioCategory:(id)a3 withOptions:(id)a4;
- (void)_receivedRelinquishOwnership:(id)a3 wxAddress:(id)a4;
- (void)_relayConduitMessageEnsureStarted;
- (void)_relayConduitMessageEnsureStopped;
- (void)_relayConduitMessageReceived:(id)a3 andSourceDevice:(id)a4 messageType:(unsigned __int8)a5 messageData:(id)a6;
- (void)_relayConduitMessageSend:(unsigned __int8)a3 withOptions:(id)a4 andWxAddress:(id)a5 andOtherAddress:(id)a6;
- (void)_relayConduitMessageStartTimer:(id)a3 withOptions:(id)a4;
- (void)_removeTiPiState:(id)a3;
- (void)_resetInUserBannerShown;
- (void)_respondRoutingRequest:(id)a3 withResponseHandler:(id)a4 wxAddress:(id)a5;
- (void)_routeIndicationConnectDevice:(id)a3;
- (void)_routeIndicationShowBanner:(int)a3 withDevice:(id)a4 andCentralContentItemTxt:(id)a5 andTimeout:(double)a6;
- (void)_sendAudioCategory:(id)a3 withAudioCategory:(id)a4;
- (void)_sendAudioCategoryToAllTipiDevices;
- (void)_sendAudioScoreChanged:(BOOL)a3;
- (void)_sendTipiHealingRequest:(id)a3 andOtherTipiAddress:(id)a4;
- (void)_sendTipiScoreUpdateToWx;
- (void)_setAutoRoute:(id)a3 withAutoRoute:(BOOL)a4;
- (void)_setConnectedBannerTick:(unint64_t)a3;
- (void)_setHighPriorityTag:(id)a3 withHighPriority:(BOOL)a4;
- (void)_setIsFirstConnentionAfterSREnable:(BOOL)a3 forDevice:(id)a4;
- (void)_setIsHiddenProperty:(id)a3 withIsHidden:(BOOL)a4;
- (void)_setManualRouteFlag:(id)a3 withManualRoute:(BOOL)a4;
- (void)_setOtherTipiDeviceBTAddress:(id)a3 andName:(id)a4 sourceVersion:(id)a5 withResult:(id)a6;
- (void)_setOwnership:(id)a3 withHijackRequest:(id)a4 withOwnership:(BOOL)a5;
- (void)_setPhase1ConnectConfig:(id)a3 andType:(int)a4;
- (void)_setPipeMessageStats:(unint64_t)a3;
- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3 forDevice:(id)a4;
- (void)_setTipiElectionInProgress:(BOOL)a3;
- (void)_setTipiElectionReceivedLePipe:(id)a3;
- (void)_setTipiElectionType:(BOOL)a3 withDevice:(id)a4;
- (void)_setTotalCountIDSDevices:(id)a3;
- (void)_sigTermReceived;
- (void)_smartRoutingAddWxMapDevice:(id)a3 routingAction:(int)a4 otherAddress:(id)a5 otherName:(id)a6 otherSourceVersion:(id)a7 isRoutingInitialized:(BOOL)a8 newWx:(BOOL)a9;
- (void)_smartRoutingAddWxMapDeviceFromConnectedDevice:(id)a3;
- (void)_smartRoutingAudioRoutingRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_smartRoutingChangeRoute:(id)a3;
- (void)_smartRoutingConnectionCompleted:(id)a3;
- (void)_smartRoutingLowerRateScan;
- (void)_smartRoutingModeCheck:(id)a3;
- (void)_startHighActivityLevelTimer:(unint64_t)a3;
- (void)_startHijackMetricSubmission:(int64_t)a3 wxAddress:(id)a4 version:(id)a5;
- (void)_startIdleActivityScoreTimer:(unint64_t)a3;
- (void)_startManualRouteChangeDetectionTimer:(id)a3;
- (void)_startPhoneTriangleOwnershipTimer:(unint64_t)a3;
- (void)_startPlaybackTimer;
- (void)_startRingtoneTimer;
- (void)_startRouteChangeDetectionTimer:(id)a3 andAnswer:(int64_t)a4;
- (void)_startRouteCheckTimer:(id)a3 andType:(int)a4;
- (void)_startTipiHealing:(id)a3 withLastConnect:(id)a4;
- (void)_startTipiSetupTicks;
- (void)_statsEnsureStarted;
- (void)_submitConnectionMetric:(id)a3 andError:(id)a4;
- (void)_submitHijackBlockMetric:(id)a3 withReason:(id)a4;
- (void)_submitManualConnectionMetric:(id)a3;
- (void)_submitManualRouteDetectionMetric:(id)a3;
- (void)_submitMetric:(id)a3;
- (void)_submitMetricNearby:(unsigned int)a3;
- (void)_submitMetricTipiHealingforDevice:(id)a3 withDuration:(double)a4 andLegacy:(BOOL)a5;
- (void)_submitNearbyDeviceMetric:(unsigned int)a3;
- (void)_submitRouteChangeDetectionMetric:(id)a3 andAnswer:(int64_t)a4;
- (void)_submitRouteCheckMetric:(id)a3 andType:(int)a4;
- (void)_submitUIMetricforTVOS:(unsigned int)a3;
- (void)_tipiHealing:(id)a3 withDevice:(id)a4;
- (void)_tipiHealingAttempt;
- (void)_tipiHealingHijackTimerStart:(id)a3 withScore:(int)a4;
- (void)_tipiHealingStartTimer:(id)a3;
- (void)_tipihHealingV2Handling:(id)a3;
- (void)_triggerTipiTableUpdate:(id)a3;
- (void)_update;
- (void)_updateAccessoryID:(id)a3 connectionDeviceAddresses:(id)a4 completion:(id)a5;
- (void)_updateAudioRoute:(int)a3 withUUID:(id)a4;
- (void)_updateLocalAudioCategory:(id)a3;
- (void)_updateNearbyDeviceState:(id)a3 withAddress:(id)a4 withEasyPairing:(BOOL)a5 withState:(int)a6;
- (void)_updateOtherTipiBuildVersion:(id)a3;
- (void)_updateOtherTipiDevice:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6 withResult:(id)a7;
- (void)_updateOtherTipiDevicewithAudioCategory:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6;
- (void)_updateRoutingActionForManuallyRoute;
- (void)_updateSRDiscoveredDeviceForCBDeviceChanged:(id)a3 connectionStatus:(unsigned __int8)a4;
- (void)_updateSRDiscoveredDeviceForNearbyWxChanged:(id)a3 isNearby:(BOOL)a4;
- (void)_watchHintingRecovery;
- (void)_watchMediaControl;
- (void)_watchRecoveryStartTimer;
- (void)_wxDeviceFound:(id)a3;
- (void)_wxDeviceFoundforTVOS:(id)a3;
- (void)_wxDeviceLost:(id)a3;
- (void)_wxDiscoveryEnsureStarted;
- (void)_wxDiscoveryEnsureStopped;
- (void)_wxDiscoveryWatchRecoveryEnsureStarted;
- (void)_wxDiscoveryWatchRecoveryEnsureStopped;
- (void)_wxDiscoveryWatchRecoveryFoundDevice:(id)a3;
- (void)_wxDiscoveryWatchRecoveryLostDevice:(id)a3;
- (void)activate;
- (void)getHijackAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getHijackedAwayAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getLocalAudioInfofromSnapshot:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7;
- (void)getSmartRoutingStateForDeviceAddress:(id)a3;
- (void)handleActivityScoreUpdate:(int)a3;
- (void)invalidate;
- (void)setPipePendingRequest:(id)a3;
- (void)submitHijackMetric:(id)a3 withV1:(BOOL)a4;
- (void)submitRouteActivityMetric:(id)a3 activity:(id)a4;
- (void)updateCurrentAudioSnapshot;
@end

@implementation BTSmartRoutingDaemon

+ (id)sharedBTSmartRoutingDaemon
{
  if (qword_100237218 != -1) {
    dispatch_once(&qword_100237218, &stru_100206A20);
  }
  return (id)qword_100237210;
}

- (BTSmartRoutingDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___BTSmartRoutingDaemon;
  v2 = -[BTSmartRoutingDaemon init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_activityLevel = 0;
    v2->_activityLevelDeltaInSeconds = 25LL;
    v2->_activityLevelNotifyToken = -1;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("BTSmartRouting", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("BTSmartRoutingAVSys", v9);
    dispatchQueueAVSys = v3->_dispatchQueueAVSys;
    v3->_dispatchQueueAVSys = (OS_dispatch_queue *)v10;

    v3->_forcedDisconnectionRSSI = -60;
    v3->_lowBatteryResetNotifyToken = -1;
    uint64_t v12 = GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    myModel = v3->_myModel;
    v3->_myModel = (NSString *)v12;

    v3->_ownershipToken = -1;
    v3->_prefsChangedNotifyToken = -1;
    v3->_prefSmartRoutingForcedDisconnectionStartSeconds = 1.0;
    v3->_ringerStateToken = -1;
    v3->_splitterStateOnToken = -1;
    v3->_smartRoutingDisconnectToken = -1;
    v3->_cbDaemonNotifyToken = -1;
    v3->_tipiElectionPhase1 = 0;
    v14 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_100019A08;
  uint64_t v12 = sub_100019A18;
  id v13 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019A20;
  block[3] = &unk_100206A48;
  block[4] = self;
  block[5] = &v8;
  int v7 = a3;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)_descriptionWithLevel:(int)a3
{
  uint64_t v107 = 0LL;
  v108 = &v107;
  uint64_t v109 = 0x3032000000LL;
  v110 = sub_100019A08;
  v111 = sub_100019A18;
  id v112 = 0LL;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd");
  v79 = self->_myAddress;
  id obj = (id)v108[5];
  unint64_t activityLevel = (char)self->_activityLevel;
  if (activityLevel > 0xE) {
    dispatch_queue_t v6 = "?";
  }
  else {
    dispatch_queue_t v6 = off_100207898[activityLevel];
  }
  uint64_t score = self->_score;
  else {
    uint64_t v8 = off_1002079F0[score];
  }
  if (self->_prefSmartRoutingEnabledPhase3) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  if (self->_sleeping) {
    uint64_t v10 = "yes";
  }
  else {
    uint64_t v10 = "no";
  }
  int sleepWakeState = self->_sleepWakeState;
  v68 = v4;
  location = (id *)(v108 + 5);
  v77 = v8;
  v78 = v6;
  v75 = v10;
  v76 = v9;
  if (sleepWakeState > 29)
  {
    switch(sleepWakeState)
    {
      case 30:
        uint64_t v12 = "FullWake";
        goto LABEL_27;
      case 40:
        uint64_t v12 = "Restart";
        goto LABEL_27;
      case 50:
        uint64_t v12 = "PowerOff";
        goto LABEL_27;
    }
  }

  else
  {
    switch(sleepWakeState)
    {
      case 0:
        uint64_t v12 = "Unknown";
        goto LABEL_27;
      case 10:
        uint64_t v12 = "Sleep";
        goto LABEL_27;
      case 20:
        uint64_t v12 = "DarkWake";
        goto LABEL_27;
    }
  }

  uint64_t v12 = "?";
LABEL_27:
  v73 = v12;
  int v74 = -[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount");
  BOOL activityLevelMediaPlaying = self->_activityLevelMediaPlaying;
  BOOL isBTRoute = self->_isBTRoute;
  BOOL isSpeakerRoute = self->_isSpeakerRoute;
  BOOL isBuiltInReceiverRoute = self->_isBuiltInReceiverRoute;
  BOOL pairedDeviceSupportsSmartRouting = self->_pairedDeviceSupportsSmartRouting;
  BOOL isHSA2Account = self->_isHSA2Account;
  BOOL ringerState = self->_ringerState;
  unint64_t prefSmartRoutingBlockHijackWindowinSeconds = self->_prefSmartRoutingBlockHijackWindowinSeconds;
  int64_t totalCloudDeviceCount = self->_totalCloudDeviceCount;
  uint64_t v19 = objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
  v20 = (void *)v19;
  if (ringerState) {
    v21 = "yes";
  }
  else {
    v21 = "no";
  }
  if (isHSA2Account) {
    v22 = "yes";
  }
  else {
    v22 = "no";
  }
  if (pairedDeviceSupportsSmartRouting) {
    v23 = "yes";
  }
  else {
    v23 = "no";
  }
  if (isBuiltInReceiverRoute) {
    v24 = "yes";
  }
  else {
    v24 = "no";
  }
  if (isSpeakerRoute) {
    v25 = "yes";
  }
  else {
    v25 = "no";
  }
  if (isBTRoute) {
    v26 = "yes";
  }
  else {
    v26 = "no";
  }
  if (activityLevelMediaPlaying) {
    v27 = "yes";
  }
  else {
    v27 = "no";
  }
  if (v74 <= 0) {
    v28 = "no";
  }
  else {
    v28 = "yes";
  }
  NSAppendPrintF_safe( &obj,  "-- BTSmartRouting: Addr %@ AcLv %s, Score %s, Phase3 %s, Sleeping %s (%s), Call %s StreamPlayback %s isRouteBT %s is RouteSpeaker %s isRouteInBandReceiver %s PairedDeviceSRFlagFound %s isHSA2Enabled %s TotaliCloudDevicesFound %d Ring erState %s BlockHijackWindowinSeconds %llu isFirstConnectionAfterSREnable %@ last SR active Date %@--\n",  v79,  v78,  v77,  v76,  v75,  v73,  v28,  v27,  v26,  v25,  v24,  v23,  v22,  totalCloudDeviceCount,  v21,  prefSmartRoutingBlockHijackWindowinSeconds,  v19,  @"n/a");
  objc_storeStrong(location, obj);

  v29 = self->_uiLowBatteryBanner;
  v30 = v29;
  if (v29)
  {
    v31 = (id *)(v108 + 5);
    id v105 = (id)v108[5];
    NSAppendPrintF(&v105, "Banner: LowBattery: %@\n", v29);
    objc_storeStrong(v31, v105);
  }

  v32 = self->_uiSmartRoutingBanner;
  v33 = v32;
  if (v32)
  {
    v34 = (id *)(v108 + 5);
    id v104 = (id)v108[5];
    NSAppendPrintF(&v104, "Banner: Routing: %@\n", v32);
    objc_storeStrong(v34, v104);
  }

  v35 = self->_uiNoteSessionLowBattery;
  v36 = v35;
  if (v35)
  {
    v37 = (id *)(v108 + 5);
    id v103 = (id)v108[5];
    NSAppendPrintF(&v103, "UINote: LowBattery: %@\n", v35);
    objc_storeStrong(v37, v103);
  }

  v38 = self->_uiNoteSessionSmartRouting;
  v39 = v38;
  if (v38)
  {
    v40 = (id *)(v108 + 5);
    id v102 = (id)v108[5];
    NSAppendPrintF(&v102, "UINote: Routing: %@\n", v38);
    objc_storeStrong(v40, v102);
  }

  v41 = (id *)(v108 + 5);
  id v101 = (id)v108[5];
  NSAppendPrintF(&v101, "\n");
  objc_storeStrong(v41, v101);
  v42 = (id *)(v108 + 5);
  id v100 = (id)v108[5];
  NSAppendPrintF( &v100,  "Connected: %d, %@\n",  -[NSMutableDictionary count](self->_connectedDevices, "count"),  self->_connectedDiscovery);
  objc_storeStrong(v42, v100);
  connectedDevices = self->_connectedDevices;
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_10001A2F8;
  v99[3] = &unk_100206A70;
  v99[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v99);
  v44 = (id *)(v108 + 5);
  id v98 = (id)v108[5];
  NSAppendPrintF(&v98, "\n");
  objc_storeStrong(v44, v98);
  v45 = (id *)(v108 + 5);
  id v97 = (id)v108[5];
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  NSAppendPrintF(&v97, "Paired: %d, %@\n", [v46 count], self->_pairedDiscovery);
  objc_storeStrong(v45, v97);

  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  id v48 = [v47 countByEnumeratingWithState:&v93 objects:v113 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v94;
    do
    {
      v50 = 0LL;
      do
      {
        if (*(void *)v94 != v49) {
          objc_enumerationMutation(v47);
        }
        uint64_t v51 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)v50);
        v52 = (id *)(v108 + 5);
        id v92 = (id)v108[5];
        NSAppendPrintF(&v92, "    %@\n", v51);
        objc_storeStrong(v52, v92);
        v50 = (char *)v50 + 1;
      }

      while (v48 != v50);
      id v48 = [v47 countByEnumeratingWithState:&v93 objects:v113 count:16];
    }

    while (v48);
  }

  v53 = (id *)(v108 + 5);
  id v91 = (id)v108[5];
  NSAppendPrintF(&v91, "\n");
  objc_storeStrong(v53, v91);
  v54 = (id *)(v108 + 5);
  id v90 = (id)v108[5];
  NSAppendPrintF( &v90,  "NearbyInfo: %d, %@\n",  -[NSMutableDictionary count](self->_nearbyInfoDevices, "count"),  self->_nearbyInfoDiscovery);
  objc_storeStrong(v54, v90);
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_10001A344;
  v89[3] = &unk_100206A98;
  v89[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v89);
  v56 = (id *)(v108 + 5);
  id v88 = (id)v108[5];
  NSAppendPrintF(&v88, "\n");
  objc_storeStrong(v56, v88);
  v57 = (id *)(v108 + 5);
  id v87 = (id)v108[5];
  NSAppendPrintF( &v87,  "-- SmartRouting Devices: %d, --\n",  -[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"));
  objc_storeStrong(v57, v87);
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_10001A3A8;
  v86[3] = &unk_100206AC0;
  v86[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v86);
  v59 = (id *)(v108 + 5);
  id v85 = (id)v108[5];
  NSAppendPrintF(&v85, "Wx: %d, %@\n", -[NSMutableDictionary count](self->_wxDevices, "count"), self->_wxDiscovery);
  objc_storeStrong(v59, v85);
  wxDevices = self->_wxDevices;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_10001A704;
  v84[3] = &unk_100206A98;
  v84[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", v84);
  v61 = (id *)(v108 + 5);
  id v83 = (id)v108[5];
  NSAppendPrintF(&v83, "\n");
  objc_storeStrong(v61, v83);
  v62 = (id *)(v108 + 5);
  id v82 = (id)v108[5];
  NSAppendPrintF( &v82,  "-- BTLowBattery (devices %d) --\n",  -[NSMutableDictionary count](self->_lowBatteryDeviceMap, "count"));
  objc_storeStrong(v62, v82);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_10001A768;
  v81[3] = &unk_100206AE8;
  *(CFAbsoluteTime *)&v81[5] = Current;
  v81[4] = &v107;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( lowBatteryDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v81);
  v65 = (id *)(v108 + 5);
  id v80 = (id)v108[5];
  NSAppendPrintF(&v80, "\n");
  objc_storeStrong(v65, v80);
  id v66 = (id)v108[5];

  _Block_object_dispose(&v107, 8);
  return v66;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A904;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_smartRoutingCapable = 0;
  v3 = (AADeviceManagerDaemon *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
  aaDeviceManagerDaemon = self->_aaDeviceManagerDaemon;
  self->_aaDeviceManagerDaemon = v3;

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _activate]",  30LL,  "AADeviceManagerDaemon shared instance %@",  self->_aaDeviceManagerDaemon);
  }
  if (self->_lowBatteryResetNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001AD64;
    handler[3] = &unk_100206308;
    handler[4] = self;
    notify_register_dispatch( "com.apple.bluetooth.lowBatteryReset",  &self->_lowBatteryResetNotifyToken,  dispatchQueue,  handler);
  }

  if (!self->_sourceDevice)
  {
    dispatch_queue_t v6 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingSourceDevice);
    sourceDevice = self->_sourceDevice;
    self->_sourceDevice = v6;
  }

  if (!self->_srDiscoveredDeviceMap)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    self->_srDiscoveredDeviceMap = v8;
  }

  -[BTSmartRoutingDaemon _statsEnsureStarted](self, "_statsEnsureStarted");
  if (self->_prefsChangedNotifyToken == -1)
  {
    uint64_t v10 = (dispatch_queue_s *)self->_dispatchQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10001ADD4;
    v30[3] = &unk_100206308;
    v30[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, v10, v30);
  }

  -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
  if (!self->_sigTermSource)
  {
    v11 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v11;

    id v13 = self->_sigTermSource;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001AE44;
    v29[3] = &unk_100206058;
    v29[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, v29);
    dispatch_activate((dispatch_object_t)self->_sigTermSource);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
  self->_int64_t totalCloudDeviceCount = (int64_t)[v14 totalCloudDeviceCount];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 addObserver:self selector:"_setTotalCountIDSDevices:" name:@"BTTotalIDSDeviceCountChanged" object:0];
  if (!self->_localDeviceAudioCatogory) {
    -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", &off_100219050);
  }
  objc_super v16 = (dispatch_queue_s *)self->_dispatchQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10001AE4C;
  v28[3] = &unk_100206308;
  v28[4] = self;
  notify_register_dispatch("com.apple.bluetooth.daemonStarted", &self->_cbDaemonNotifyToken, v16, v28);
  v17 = (dispatch_queue_s *)self->_dispatchQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10001AF98;
  v27[3] = &unk_100206308;
  v27[4] = self;
  notify_register_dispatch( "com.apple.bluetooth.SmartRoutingDisconnectReason",  &self->_smartRoutingDisconnectToken,  v17,  v27);
  v18 = (dispatch_queue_s *)self->_dispatchQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001B3CC;
  v26[3] = &unk_100206308;
  v26[4] = self;
  notify_register_dispatch("com.apple.BluetoothServices.AudioRoutingOwnershipTaken", &self->_ownershipToken, v18, v26);
  if (self->_ringerStateToken == -1)
  {
    uint64_t v19 = (dispatch_queue_s *)self->_dispatchQueue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10001B76C;
    v25[3] = &unk_100206308;
    v25[4] = self;
    notify_register_dispatch("com.apple.springboard.ringerstate", &self->_ringerStateToken, v19, v25);
  }

  if (self->_splitterStateOnToken == -1)
  {
    v20 = (dispatch_queue_s *)self->_dispatchQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001B834;
    v24[3] = &unk_100206308;
    v24[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &self->_splitterStateOnToken, v20, v24);
  }

  v21 = (dispatch_queue_s *)self->_dispatchQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001B8FC;
  v23[3] = &unk_100206308;
  v23[4] = self;
  notify_register_dispatch("com.apple.bluetooth.magnet", &self->_magnetStateToken, v21, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"Zoom",  @"Webex",  @"google.Tachyon",  @"google.meetings",  0LL));
  -[BTSmartRoutingSourceDevice setConferencingCallSets:](self->_sourceDevice, "setConferencingCallSets:", v22);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BA20;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_input", TypeID, 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (!v10) {
    goto LABEL_4;
  }
  if (![v10 caseInsensitiveCompare:@"lbReset"])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001BF18;
    v18[3] = &unk_100205F68;
    v18[4] = self;
    id v13 = &v19;
    id v19 = v6;
    v14 = v18;
LABEL_7:
    dispatch_async(dispatchQueue, v14);

    BOOL v11 = 1;
    goto LABEL_8;
  }

  if (![v10 caseInsensitiveCompare:@"lbSave"])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001BFA0;
    v16[3] = &unk_100205F68;
    v16[4] = self;
    id v13 = &v17;
    id v17 = v6;
    v14 = v16;
    goto LABEL_7;
  }

- (id)_myBluetoothAddressString
{
  myAddress = self->_myAddress;
  if (!myAddress
    || (id)-[NSString length](myAddress, "length") != (id)17
    || !strcmp(-[NSString UTF8String](self->_myAddress, "UTF8String"), "00:00:00:00:00:00"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBController controllerInfoAndReturnError:]( &OBJC_CLASS___CBController,  "controllerInfoAndReturnError:",  0LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareAddressData]);
    uint64_t v6 = CUPrintNSDataAddress();
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = self->_myAddress;
    self->_myAddress = v7;

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _myBluetoothAddressString]",  30LL,  "myBluetoothAddressString is %@",  self->_myAddress);
    }
  }

  return self->_myAddress;
}

- (void)_prefsChanged
{
  if (v157) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 < 5.0;
  }
  if (v4) {
    double v5 = 57600.0;
  }
  else {
    double v5 = v3;
  }
  double prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
  if (v5 != prefLowBatteryDelaySeconds)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        double prefLowBatteryDelaySeconds = self->_prefLowBatteryDelaySeconds;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _prefsChanged]",  30LL,  "LowBatteryDelaySeconds: %.0f -> %.0f",  prefLowBatteryDelaySeconds,  v5);
    }

- (void)_sigTermReceived
{
  v2 = self;
  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1
      || (self = (BTSmartRoutingDaemon *)_LogCategory_Initialize(&dword_100234408, 30LL), (_DWORD)self))
    {
      self = (BTSmartRoutingDaemon *)LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sigTermReceived]",  30LL,  "SIGTERM received\n");
    }
  }

  if (v2->_lowBatterySaveTimer) {
    self = (BTSmartRoutingDaemon *)-[BTSmartRoutingDaemon _lowBatterySave:](v2, "_lowBatterySave:", 1LL);
  }
  xpc_transaction_exit_clean(self);
}

- (void)_update
{
  unsigned int v3 = -[CUSystemMonitor screenLocked](self->_powerMonitor, "screenLocked");
  if (self->_effectiveScreenLocked != v3)
  {
    BOOL v4 = v3;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      double v5 = "yes";
      if (v4) {
        uint64_t v6 = "no";
      }
      else {
        uint64_t v6 = "yes";
      }
      if (!v4) {
        double v5 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _update]",  30LL,  "Effective ScreenLocked changed: %s -> %s",  v6,  v5);
    }

    self->_effectiveScreenLocked = v4;
    if (v4)
    {
      -[BTSmartRoutingDaemon _nearbyInfoActivityChanged](self, "_nearbyInfoActivityChanged");
      -[BTSmartRoutingDaemon _resetInUserBannerShown](self, "_resetInUserBannerShown");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getActiveNearbyWxAdress](self, "_getActiveNearbyWxAdress"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v7));
      uint64_t v9 = mach_absolute_time();
      if (UpTicksToSecondsF(v9 - (void)[v8 inUseBannerBackoffTick]) < 1.5)
      {
        [v8 _setInUseBannerBackoffReason:0];
        -[SmartRoutingStats setBannerAction:](self->_stats, "setBannerAction:", @"ScreenLocked");
      }

      objc_msgSend(v8, "_setNearbyPrevInEar:", objc_msgSend(v8, "nearbyInEar"));

      -[BTSmartRoutingDaemon _powerMonitorScreenLockChanged](self, "_powerMonitorScreenLockChanged");
    }

    else
    {
      -[BTSmartRoutingDaemon _powerMonitorScreenLockChanged](self, "_powerMonitorScreenLockChanged");
      if (self->_prefSmartRoutingEnabledPhase3)
      {
        -[BTSmartRoutingDaemon _startHighActivityLevelTimer:](self, "_startHighActivityLevelTimer:", 1LL);
        -[SmartRoutingStats setProactiveRoutingTrigger:](self->_stats, "setProactiveRoutingTrigger:", @"Unlock");
      }
    }
  }

  -[BTSmartRoutingDaemon _powerMonitorEnsureStarted](self, "_powerMonitorEnsureStarted");
  if (!self->_sleeping
    && -[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn")
    && self->_pineBoardServiceReady)
  {
    -[BTSmartRoutingDaemon _wxDiscoveryEnsureStarted](self, "_wxDiscoveryEnsureStarted");
    -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStarted](self, "_mediaRouteMonitorEnsureStarted");
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      if (self->_sleeping) {
        uint64_t v10 = "yes";
      }
      else {
        uint64_t v10 = "no";
      }
      else {
        BOOL v11 = "no";
      }
      if (self->_pineBoardServiceReady) {
        uint64_t v12 = "yes";
      }
      else {
        uint64_t v12 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _update]",  30LL,  "Device _sleep %s, screenOn %s, PineBoard Service %s",  v10,  v11,  v12);
    }

    routeIndicationBackOffMap = self->_routeIndicationBackOffMap;
    if (routeIndicationBackOffMap) {
      -[NSMutableDictionary removeAllObjects](routeIndicationBackOffMap, "removeAllObjects");
    }
    routeIndicationQualifiedTickMap = self->_routeIndicationQualifiedTickMap;
    if (routeIndicationQualifiedTickMap) {
      -[NSMutableDictionary removeAllObjects](routeIndicationQualifiedTickMap, "removeAllObjects");
    }
    -[BTSmartRoutingDaemon _wxDiscoveryEnsureStopped](self, "_wxDiscoveryEnsureStopped");
    -[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStopped](self, "_mediaRouteMonitorEnsureStopped");
  }

  -[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStarted](self, "_pairedDeviceMonitorEnsureStarted");
  -[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStarted](self, "_connectedDeviceMonitorEnsureStarted");
  -[BTSmartRoutingDaemon _evaluatorRun](self, "_evaluatorRun");
}

- (void)_routeIndicationConnectDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bluetoothAddress]);

  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  BOOL v24 = sub_100019A08;
  BOOL v25 = sub_100019A18;
  id v8 = [v7 length];
  uint64_t v9 = 0LL;
  if (v8 == (id)6)
  {
    uint64_t v10 = NSPrintF("%.6a", COERCE_DOUBLE([v7 bytes]));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  id v26 = v9;
  objc_storeStrong((id *)&self->_connectDevice, a3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 advertisementFields]);

  int Int64Ranged = CFDictionaryGetInt64Ranged(v12, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
  unsigned int v15 = [v14 rssi];

  uint64_t v16 = mach_absolute_time();
  double v17 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClassicConnection);
  objc_storeStrong((id *)&self->_connectSession, v17);
  -[CUBluetoothClassicConnection setConnectionFlags:](v17, "setConnectionFlags:", 3LL);
  -[CUBluetoothClassicConnection setDestinationPeer:](v17, "setDestinationPeer:", v22[5]);
  -[CUBluetoothClassicConnection setDispatchQueue:](v17, "setDispatchQueue:", self->_dispatchQueue);
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _routeIndicationConnectDevice:]",  30LL,  "Evaluator: connect start: %@, %@",  v22[5],  v5);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001DCFC;
  v18[3] = &unk_100206B60;
  v18[4] = self;
  void v18[5] = v17;
  v18[6] = &v21;
  v18[7] = v16;
  int v19 = Int64Ranged;
  unsigned int v20 = v15;
  -[CUBluetoothClassicConnection activateWithCompletion:](v17, "activateWithCompletion:", v18);

  _Block_object_dispose(&v21, 8);
}

- (void)_routeIndicationShowBanner:(int)a3 withDevice:(id)a4 andCentralContentItemTxt:(id)a5 andTimeout:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 name]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 UUIDString]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 advertisementFields]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v14, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _routeIndicationShowBanner:withDevice:andCentralContentItemTxt:andTimeout:]",  30LL,  "_routeIndicationShowBanner: Time to post the banner for device %@ , product Id %u",  v9,  Int64Ranged);
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bluetoothAddress]);

  id v18 = v17;
  uint64_t v19 = NSPrintF("%.6a", COERCE_DOUBLE([v18 bytes]));
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ((_DWORD)Int64Ranged == 8228) {
    unsigned int v21 = 8212;
  }
  else {
    unsigned int v21 = Int64Ranged;
  }
  if ((v21 & 0xFFFFFFFD) == 0x2019 || v21 == 8222 || v21 == 8224) {
    uint64_t v24 = 8217LL;
  }
  else {
    uint64_t v24 = v21;
  }
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:]( self,  "_productColorAssetLookup:andAddress:",  v24,  v20));
  id v26 = objc_alloc_init(&OBJC_CLASS___BTBannerUISession);
  objc_storeStrong((id *)&self->_uiSmartRoutingBanner, v26);
  if (v40) {
    v27 = v40;
  }
  else {
    v27 = &stru_100212678;
  }
  -[BTBannerUISession setCenterContentText:](v26, "setCenterContentText:", v27);
  -[BTBannerUISession setCenterContentItemsText:](v26, "setCenterContentItemsText:", v10);

  -[BTBannerUISession setDispatchQueue:](v26, "setDispatchQueue:", self->_dispatchQueue);
  -[BTBannerUISession setLeadingAccessoryImagePID:](v26, "setLeadingAccessoryImagePID:", v24);
  -[BTBannerUISession setLeadingAccessoryImageName:](v26, "setLeadingAccessoryImageName:", v25);
  -[BTBannerUISession setTimeoutSeconds:](v26, "setTimeoutSeconds:", a6);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10001E5CC;
  v42[3] = &unk_100206B88;
  v42[4] = v26;
  v42[5] = self;
  id v28 = v9;
  id v43 = v28;
  -[BTBannerUISession setActionHandler:](v26, "setActionHandler:", v42);
  double v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_routeIndicationQualifiedTickMap,  "objectForKeyedSubscript:",  v12));

  if (v29
    && (uint64_t v30 = mach_absolute_time(),
        int v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_routeIndicationQualifiedTickMap,  "objectForKeyedSubscript:",  v12)),  v32 = UpTicksToSeconds(v30 - (void)[v31 unsignedLongLongValue]),  v31,  v32 >= 2))
  {
    v39 = (void *)v12;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _routeIndicationShowBanner:withDevice:andCentralContentItemTxt:andTimeout:]",  30LL,  "_routeIndicationShowBanner: The device has been qualified for %ll{dur}, post banner now",  v32);
    }

    -[BTBannerUISession activate](v26, "activate");
  }

  else
  {
    routeIndicationBulletinTimer = self->_routeIndicationBulletinTimer;
    if (routeIndicationBulletinTimer)
    {
      v34 = routeIndicationBulletinTimer;
      dispatch_source_cancel(v34);
      uint64_t v35 = self->_routeIndicationBulletinTimer;
      self->_routeIndicationBulletinTimer = 0LL;
    }

    BOOL v36 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v37 = self->_routeIndicationBulletinTimer;
    self->_routeIndicationBulletinTimer = v36;
    v38 = v36;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001E7BC;
    handler[3] = &unk_100206358;
    handler[4] = v26;
    void handler[5] = self;
    dispatch_source_set_event_handler(v38, handler);
    CUDispatchTimerSet(v38, 2.0, -1.0, -10.0);
    dispatch_activate(v38);

    v39 = (void *)v12;
  }
}

- (void)_evaluatorRunforTVOS:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefRouteIndicationEnable)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bluetoothAddress]);

    id v8 = v7;
    uint64_t v9 = NSPrintF("%.6a", COERCE_DOUBLE([v8 bytes]));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (self->_screenSaver)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRunforTVOS:]",  30LL,  "Evaluator: Skip bulletin when screensaver is on");
      }
    }

    else
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPSPeripheralService sharedInstance](&OBJC_CLASS___TVPSPeripheralService, "sharedInstance"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10001E9CC;
      v12[3] = &unk_100206BB0;
      v12[4] = self;
      id v13 = v5;
      v14 = v10;
      [v11 shouldConnectToAudioDeviceWithCompletionHandler:v12];
    }
  }
}

- (void)_submitUIMetricforTVOS:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[0] = @"nearbyAction";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerActionCount));
  v11[0] = v5;
  v10[1] = @"nearbyDimissed";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerDismissCount));
  v11[1] = v6;
  v10[2] = @"nearbyIgnored";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerTimeoutCount));
  v11[2] = v7;
  v10[3] = @"wxPD";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  v11[3] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.RouteIndicationUI", v9);

  *(void *)&self->_nearbyBannerActionCount = 0LL;
  self->_nearbyBannerTimeoutCount = 0;
}

- (void)_evaluatorEnsureStarted
{
  if (!self->_evaluatorCoalescer)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _evaluatorEnsureStarted]", 30LL, "Start");
    }

    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    evaluatorCoalescer = self->_evaluatorCoalescer;
    self->_evaluatorCoalescer = v3;
    id v5 = v3;

    -[CUCoalescer setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v5, "setMinDelay:", 0.05);
    -[CUCoalescer setMaxDelay:](v5, "setMaxDelay:", 0.1);
    -[CUCoalescer setLeeway:](v5, "setLeeway:", 0.05);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001EDE4;
    v6[3] = &unk_100206358;
    v6[4] = v5;
    v6[5] = self;
    -[CUCoalescer setActionHandler:](v5, "setActionHandler:", v6);
  }

- (void)_evaluatorEnsureStopped
{
  if (self->_evaluatorCoalescer
    && dword_100234408 <= 30
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _evaluatorEnsureStopped]", 30LL, "Stop");
  }

  -[CUCoalescer invalidate](self->_evaluatorCoalescer, "invalidate");
  evaluatorCoalescer = self->_evaluatorCoalescer;
  self->_evaluatorCoalescer = 0LL;

  connectDevice = self->_connectDevice;
  self->_connectDevice = 0LL;

  -[CUBluetoothClassicConnection invalidate](self->_connectSession, "invalidate");
  connectSession = self->_connectSession;
  self->_connectSession = 0LL;

  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    id v8 = smartRoutingLowerScanRateTimer;
    dispatch_source_cancel(v8);
    id v7 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = 0LL;
  }

- (void)_evaluatorRun
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    unsigned int v4 = [v3 count];
    unsigned int v5 = -[NSMutableDictionary count](self->_connectedDevices, "count");
    unsigned int v6 = -[NSMutableDictionary count](self->_nearbyInfoDevices, "count");
    unsigned int v7 = -[NSMutableDictionary count](self->_wxDevices, "count");
    unint64_t v8 = (unint64_t)-[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState");
    if (v8 > 0xA) {
      uint64_t v9 = "?";
    }
    else {
      uint64_t v9 = off_1002076E0[v8];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: Paired %d Connected %d, NearbyInfo %d, Wx %d BluetoothState %s",  v4,  v5,  v6,  v7,  v9);
  }

  id v10 = -[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState");
  if (v10) {
    BOOL v11 = v10 == (id)5;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = (unint64_t)v10;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      if (v12 - 1 > 9) {
        id v13 = "?";
      }
      else {
        id v13 = off_1002075E0[v12 - 1];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: skip, Bluetooth unsupported state: %s",  v13);
    }

    -[BTSmartRoutingDaemon _postNotification:]( self,  "_postNotification:",  "com.apple.BluetoothServices.PreemptivePortDisconnected");
    connectedDevices = self->_connectedDevices;
    if (connectedDevices)
    {
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](connectedDevices, "allValues"));
      id v19 = [v18 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v63;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v63 != v20) {
              objc_enumerationMutation(v18);
            }
            -[BTSmartRoutingDaemon _connectedDeviceLost:]( self,  "_connectedDeviceLost:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)i));
          }

          id v19 = [v18 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }

        while (v19);
      }

      v22 = self->_connectedDevices;
      self->_connectedDevices = 0LL;
    }

    disconnectTicksMap = self->_disconnectTicksMap;
    if (disconnectTicksMap)
    {
      -[NSMutableDictionary removeAllObjects](disconnectTicksMap, "removeAllObjects");
      uint64_t v24 = self->_disconnectTicksMap;
    }

    else
    {
      uint64_t v24 = 0LL;
    }

    self->_disconnectTicksMap = 0LL;

    if (self->_connectTicks) {
      self->_connectTicks = 0LL;
    }
    if (self->_tipiSetupTicks) {
      self->_tipiSetupTicks = 0LL;
    }
    uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
    if (uiSmartRoutingBanner)
    {
      -[BTBannerUISession invalidate](uiSmartRoutingBanner, "invalidate");
      id v26 = self->_uiSmartRoutingBanner;
      self->_uiSmartRoutingBanner = 0LL;
    }

    if (self->_tipiElectionInProgress) {
      self->_tipiElectionInProgress = 0;
    }
    -[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:](self, "_setTipiElectionReceivedLePipe:", &stru_100212678);
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      id v28 = tipiHealingTimer;
      dispatch_source_cancel(v28);
      double v29 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0LL;
    }

    smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
    if (smartRoutingManualDisconnectionList)
    {
      -[NSMutableArray removeAllObjects](smartRoutingManualDisconnectionList, "removeAllObjects");
      int v31 = self->_smartRoutingManualDisconnectionList;
    }

    else
    {
      int v31 = 0LL;
    }

    self->_smartRoutingManualDisconnectionList = 0LL;

    srBudswapDeviceMap = self->_srBudswapDeviceMap;
    if (srBudswapDeviceMap)
    {
      -[NSMutableDictionary removeAllObjects](srBudswapDeviceMap, "removeAllObjects");
      v33 = self->_srBudswapDeviceMap;
    }

    else
    {
      v33 = 0LL;
    }

    self->_srBudswapDeviceMap = 0LL;

    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    if (smartRoutingWxDeviceMap)
    {
      -[NSMutableDictionary removeAllObjects](smartRoutingWxDeviceMap, "removeAllObjects");
      uint64_t v35 = self->_smartRoutingWxDeviceMap;
    }

    else
    {
      uint64_t v35 = 0LL;
    }

    self->_smartRoutingWxDeviceMap = 0LL;

    smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
    if (smartRoutingBackOffMap)
    {
      -[NSMutableDictionary removeAllObjects](smartRoutingBackOffMap, "removeAllObjects");
      uint64_t v37 = self->_smartRoutingBackOffMap;
    }

    else
    {
      uint64_t v37 = 0LL;
    }

    self->_smartRoutingBackOffMap = 0LL;

    v38 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
      [v39 removeAllObjects];
    }

    -[BTSmartRoutingSourceDevice setIsFirstConnectionAfterSREnable:]( self->_sourceDevice,  "setIsFirstConnectionAfterSREnable:",  0LL);
    highActivityLevelTimer = self->_highActivityLevelTimer;
    if (highActivityLevelTimer)
    {
      uint64_t v41 = highActivityLevelTimer;
      dispatch_source_cancel(v41);
      BOOL v42 = self->_highActivityLevelTimer;
      self->_highActivityLevelTimer = 0LL;
    }

    phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
    if (phoneOwnershipTriangleTimer)
    {
      v44 = phoneOwnershipTriangleTimer;
      dispatch_source_cancel(v44);
      v45 = self->_phoneOwnershipTriangleTimer;
      self->_phoneOwnershipTriangleTimer = 0LL;
    }

    idleActivityScoreTimer = self->_idleActivityScoreTimer;
    if (idleActivityScoreTimer)
    {
      BOOL v47 = idleActivityScoreTimer;
      dispatch_source_cancel(v47);
      BOOL v48 = self->_idleActivityScoreTimer;
      self->_idleActivityScoreTimer = 0LL;
    }

    phase1ConnectConfig = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = 0LL;

    -[BTSmartRoutingSourceDevice setAudioRoute:](self->_sourceDevice, "setAudioRoute:", 1LL);
    if (v12 > 0xA) {
      v50 = "?";
    }
    else {
      v50 = off_1002076E0[v12];
    }
    unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v50));
    double v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bluetooth unsupported state: %@",  v51));
    -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v52);

    return;
  }

  if (!self->_prefSmartRoutingEnabledPhase3) {
    return;
  }
  if (self->_connectSession)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: skip, already connecting: %@",  self->_connectDevice);
    }

    v53 = @"Already connecting to headset";
LABEL_81:
    -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", v53);
    return;
  }

  if (self->_connectTicks)
  {
    uint64_t v14 = mach_absolute_time();
    unint64_t v15 = UpTicksToSeconds(v14 - self->_connectTicks);
    if (v15 <= 0x1DF)
    {
      if (dword_100234408 <= 30)
      {
        unint64_t v54 = v15;
        if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)) {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: skip, too soon, %ll{dur} remaining",  480 - v54);
        }
      }

      v53 = @"Too soon since last connection";
      goto LABEL_81;
    }
  }

  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  uint64_t v59 = sub_100019A08;
  BOOL v60 = sub_100019A18;
  id v61 = 0LL;
  self->_connected3rdPartyDevice = 0;
  uint64_t v16 = self->_connectedDevices;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_10001F634;
  v55[3] = &unk_100206BD8;
  v55[4] = self;
  v55[5] = &v56;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v55);
  if (self->_connected3rdPartyDevice
    && dword_100234408 <= 30
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: already connected to 3rd party device, allowing SR device to connect");
  }

  if (v57[5]
    && dword_100234408 <= 30
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRun]",  30LL,  "Evaluator: already connected to SR device, allowing another SR connection.");
  }

  -[CUSystemMonitor connectedCallCount](self->_callMonitor, "connectedCallCount");
  -[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]( self,  "_evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:",  self->_wxDevices,  self->_nearbyInfoDevices,  self->_score);
  _Block_object_dispose(&v56, 8);
}

- (void)_evaluatorRunTipiElection:(id)a3 nearbyInfoDevicesMap:(id)a4 localScore:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 > 1 || self->_playbackStart || -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue") > 300)
  {
    if (self->_tipiElectionInProgress && !self->_callConnected && !self->_playbackStart)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]",  30LL,  "Evaluator: tipi election already in progress back off. ");
      }

      v27 = @"Tipi election already in progress back off";
      goto LABEL_72;
    }

    self->_tipiElectionThroughLEPipe = 0;
    v47[0] = 0LL;
    v47[1] = v47;
    v47[2] = 0x2020000000LL;
    int v48 = 0;
    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x3032000000LL;
    v45[3] = sub_100019A08;
    v45[4] = sub_100019A18;
    id v46 = 0LL;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10001FF0C;
    v43[3] = &unk_100206C00;
    int v44 = a5;
    v43[4] = v47;
    v43[5] = v45;
    [v9 enumerateKeysAndObjectsUsingBlock:v43];
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = sub_100019A08;
    uint64_t v41 = sub_100019A18;
    id v42 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100020088;
    v31[3] = &unk_100206C50;
    int v32 = a5;
    v31[4] = self;
    v31[5] = &v37;
    v31[6] = v47;
    v31[7] = &v33;
    [v8 enumerateKeysAndObjectsUsingBlock:v31];
    id v10 = v38;
    if (v38[5] && self->_tipiElectionPhase1) {
      *((_BYTE *)v34 + 24) = 1;
    }
    self->_tipiElectionPhase1 = 0;
    BOOL v11 = (void *)v10[5];
    if (!v11)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]",  30LL,  "Evaluator: skip, no eligible headset.");
      }

      self->_callConnected = 0;
      self->_playbackStart = 0;
      -[BTSmartRoutingDaemon _logEvalError:](self, "_logEvalError:", @"No eligible headset");
      goto LABEL_83;
    }

    if (self->_eligibleHeadsetTicks)
    {
      uint64_t v12 = mach_absolute_time();
      unint64_t v13 = UpTicksToSeconds(v12 - self->_eligibleHeadsetTicks);
      if (v13 < 0x78)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]",  30LL,  "Evaluator: skip tipi selection, too soon, %ll{dur} remaining",  120 - v13);
        }

        goto LABEL_83;
      }

      BOOL v11 = (void *)v38[5];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bleDevice]);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bluetoothAddress]);

    if ([v15 length] == (id)6)
    {
      uint64_t v16 = NSPrintF("%.6a", COERCE_DOUBLE([v15 bytes]));
      double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }

    else
    {
      double v17 = 0LL;
    }

    phase1ConnectConfig = self->_phase1ConnectConfig;
    if (phase1ConnectConfig && dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        phase1ConnectConfig = self->_phase1ConnectConfig;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingConnectConfig address](phase1ConnectConfig, "address"));
      unsigned int v20 = -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type");
      if (v20 > 3) {
        unsigned int v21 = "?";
      }
      else {
        unsigned int v21 = off_100207A70[v20];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _evaluatorRunTipiElection:nearbyInfoDevicesMap:localScore:]",  30LL,  "Evaluator: Phase1Config Wx %@ type %s",  v19,  v21);
    }

- (void)_resetInUserBannerShown
{
  if (self->_prefSmartRoutingInUseBanner) {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_srDiscoveredDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_100206CB8);
  }
}

- (void)_smartRoutingAddWxMapDevice:(id)a3 routingAction:(int)a4 otherAddress:(id)a5 otherName:(id)a6 otherSourceVersion:(id)a7 isRoutingInitialized:(BOOL)a8 newWx:(BOOL)a9
{
  BOOL v9 = a8;
  id v65 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingWxDevice);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v65 bleDevice]);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bluetoothAddress]);

  if ([v20 length] == (id)6
    && (uint64_t v21 = NSPrintF("%.6a", COERCE_DOUBLE([v20 bytes])),
        (uint64_t v22 = objc_claimAutoreleasedReturnValue(v21)) != 0))
  {
    uint64_t v23 = (void *)v22;
    BOOL v62 = v9;
    unsigned int v63 = a4;
    id v64 = v15;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v65 bleDevice]);
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 advertisementFields]);
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v25, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

    if (-[BTSmartRoutingDaemon _supportsSR:andProductID:](self, "_supportsSR:andProductID:", v23, Int64Ranged))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v23));

      if (!v27 || a9)
      {
        if (a9)
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v23));

          if (v29)
          {
            if (dword_100234408 <= 90
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
            {
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersi on:isRoutingInitialized:newWx:]",  90LL,  "Wx exists before we create! Cleanup device %@ first",  v23);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v23);
          }
        }

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v65 identifier]);
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 UUIDString]);

        int v32 = (void *)v31;
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v31));
        unsigned int v34 = [v33 isInEar];

        if (dword_100234408 <= 50
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
        {
          if (v63 > 5) {
            uint64_t v35 = "?";
          }
          else {
            uint64_t v35 = off_100207BA8[v63];
          }
          char v36 = "no";
          if (v62) {
            uint64_t v37 = "yes";
          }
          else {
            uint64_t v37 = "no";
          }
          if (a9) {
            v38 = "yes";
          }
          else {
            v38 = "no";
          }
          if (v34) {
            char v36 = "yes";
          }
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:i sRoutingInitialized:newWx:]",  50LL,  "Creating SR WX device %@ with action %s otherAddress %@ otherName %@ routingInitialized %s newWx %s inEar %s , Tipi connection!",  v23,  v35,  v64,  v16,  v37,  v38,  v36);
        }

        unsigned int v61 = v34;
        id v28 = v32;
        uint64_t v39 = v63;
        if (-[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v23))
        {
          if (dword_100234408 <= 50
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion :isRoutingInitialized:newWx:]",  50LL,  "Marking the reconnection state as isConnected - _srBudswapDeviceMap");
          }

          if (self->_hfpBudswapDetected) {
            self->_hfpBudswapDetected = 0;
          }
          v40 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srBudswapDeviceMap,  "objectForKeyedSubscript:",  v23));
          if (!v40) {
            v40 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingBudswapDevice);
          }
          -[BTSmartRoutingBudswapDevice setReconnectionState:](v40, "setReconnectionState:", 1LL);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v40, "otherTipiDeviceBTAddress"));

          if (v41)
          {
            BOOL v60 = v28;
            id v42 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v40, "otherTipiDeviceBTAddress"));
            id v43 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTName](v40, "otherTipiDeviceBTName"));
            int v44 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceVersion](v40, "otherTipiDeviceVersion"));
            -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:]( self,  "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:",  v23,  v42,  v43,  v44);

            id v28 = v60;
          }

          budSwapAddress = self->_budSwapAddress;
          self->_budSwapAddress = 0LL;

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_srBudswapDeviceMap,  "setObject:forKeyedSubscript:",  v40,  v23);
          budSwapTimer = self->_budSwapTimer;
          if (budSwapTimer)
          {
            BOOL v47 = budSwapTimer;
            dispatch_source_cancel(v47);
            int v48 = self->_budSwapTimer;
            self->_budSwapTimer = 0LL;
          }

          uint64_t v39 = v63;
        }

        -[BTSmartRoutingWxDevice setDeviceAddress:](v18, "setDeviceAddress:", v23);
        -[BTSmartRoutingWxDevice setDeviceVersion:](v18, "setDeviceVersion:", 0LL);
        -[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:](v18, "_setOtherTipiAudioCategory:", 0LL);
        -[BTSmartRoutingWxDevice _setHijackBackoffTick:](v18, "_setHijackBackoffTick:", 0LL);
        -[BTSmartRoutingWxDevice _setRoutedState:](v18, "_setRoutedState:", (_DWORD)v39 == 1);
        -[BTSmartRoutingWxDevice setConnected:](v18, "setConnected:", 0LL);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v65 name]);
        -[BTSmartRoutingWxDevice setDeviceName:](v18, "setDeviceName:", v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue([v65 identifier]);
        unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 UUIDString]);
        -[BTSmartRoutingWxDevice setConduitDeviceID:](v18, "setConduitDeviceID:", v51);

        double v52 = (void *)objc_claimAutoreleasedReturnValue([v65 identifier]);
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 UUIDString]);
        -[BTSmartRoutingWxDevice setIdentifier:](v18, "setIdentifier:", v53);

        unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v65 bleDevice]);
        BOOL v55 = (void *)objc_claimAutoreleasedReturnValue([v54 advertisementFields]);
        -[BTSmartRoutingWxDevice setProductID:]( v18,  "setProductID:",  CFDictionaryGetInt64Ranged(v55, @"pid", 0LL, 0xFFFFFFFFLL, 0LL));

        -[BTSmartRoutingWxDevice setInEar:](v18, "setInEar:", v61);
        -[BTSmartRoutingWxDevice setIsTipiHealingV2Eligible:](v18, "setIsTipiHealingV2Eligible:", 0LL);
        -[BTSmartRoutingWxDevice _setRoutingInitialized:](v18, "_setRoutingInitialized:", v62);
        -[BTSmartRoutingWxDevice setTipitableUpdated:](v18, "setTipitableUpdated:", 0LL);
        -[BTSmartRoutingWxDevice _setRoutingAction:](v18, "_setRoutingAction:", v39);
        id v15 = v64;
        -[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:]( v18,  "_setOtherTipiDeviceInfo:andName:andVersion:",  v64,  v16,  v17);
        -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](self, "_lowestBatteryInfoForSFDevice:", v65);
        -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v18, "setLowestBudBatteryInfo:");
        if (v61) {
          uint64_t v56 = 1LL;
        }
        else {
          uint64_t v56 = 3LL;
        }
        -[BTSmartRoutingWxDevice _setRoutingUI:](v18, "_setRoutingUI:", v56);
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        if (!smartRoutingWxDeviceMap)
        {
          uint64_t v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v59 = self->_smartRoutingWxDeviceMap;
          self->_smartRoutingWxDeviceMap = v58;

          smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( smartRoutingWxDeviceMap,  "setObject:forKeyedSubscript:",  v18,  v23);
        self->_autoRoutingTicks = mach_absolute_time();
      }

      else
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v23));
        id v15 = v64;
        [v28 _setOtherTipiDeviceInfo:v64 andName:v16 andVersion:v17];
      }

      if (-[BTSmartRoutingWxDevice routingAction](v18, "routingAction") == 2) {
        ++self->_autoRoutingSingle;
      }
      else {
        ++self->_autoRoutingTipi;
      }
    }

    else
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isR outingInitialized:newWx:]",  30LL,  "Skip creating SR Wx device since headset doesn't support SR");
      }

      id v15 = v64;
    }
  }

  else
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRou tingInitialized:newWx:]",  90LL,  "No deviceAddressStr while creating SR WX device");
    }

    uint64_t v23 = 0LL;
  }
}

- (void)_smartRoutingAddWxMapDeviceFromConnectedDevice:(id)a3
{
  id v4 = a3;
  if (!self->_smartRoutingWxDeviceMap)
  {
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    self->_smartRoutingWxDeviceMap = v5;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 btAddressData]);
  uint64_t v8 = CUPrintNSDataAddress();
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (-[BTSmartRoutingDaemon _supportsSR:andProductID:]( self,  "_supportsSR:andProductID:",  v9,  [v4 productID]))
  {
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v9));

      if (!v10)
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice audioDestination](self->_sourceDevice, "audioDestination"));
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  30LL,  "Creating SR WX device with address %@ from CONNECTED event. Current audio route %@",  v9,  v11);
        }

        self->_smartRoutingDisconnectReason = 0LL;
        uint64_t v34 = 0LL;
        uint64_t v35 = &v34;
        uint64_t v36 = 0x2020000000LL;
        char v37 = 0;
        uint64_t v12 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingWxDevice);
        if (-[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v9))
        {
          *((_BYTE *)v35 + 24) = 1;
          if (dword_100234408 <= 50
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  50LL,  "Marking the reconnection state as isConnected - _srBudswapDeviceMap");
          }

          unint64_t v13 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srBudswapDeviceMap,  "objectForKeyedSubscript:",  v9));
          if (!v13) {
            unint64_t v13 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingBudswapDevice);
          }
          -[BTSmartRoutingBudswapDevice setReconnectionState:](v13, "setReconnectionState:", 1LL);
          if (self->_hfpBudswapDetected) {
            self->_hfpBudswapDetected = 0;
          }
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v13, "otherTipiDeviceBTAddress"));

          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTAddress](v13, "otherTipiDeviceBTAddress"));
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceBTName](v13, "otherTipiDeviceBTName"));
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingBudswapDevice otherTipiDeviceVersion](v13, "otherTipiDeviceVersion"));
            -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:]( self,  "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:",  v9,  v15,  v16,  v17);
          }

          budSwapTimer = self->_budSwapTimer;
          if (budSwapTimer)
          {
            id v19 = budSwapTimer;
            dispatch_source_cancel(v19);
            unsigned int v20 = self->_budSwapTimer;
            self->_budSwapTimer = 0LL;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_srBudswapDeviceMap,  "setObject:forKeyedSubscript:",  v13,  v9);
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  30LL,  "SmartRouting budswap re-connection, set routing appropriately");
          }
        }

        if (-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count"))
        {
          uint64_t v21 = self->_smartRoutingWxDeviceMap;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_100022DB8;
          v33[3] = &unk_100206AC0;
          v33[4] = &v34;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v33);
        }

        BOOL v22 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:]( self,  "_bluetoothProductIDNoEarDetect:",  [v4 productID])
           || [v4 primaryPlacement] == 1
           || [v4 secondaryPlacement] == 1;
        -[BTSmartRoutingWxDevice setDeviceAddress:](v12, "setDeviceAddress:", v9);
        -[BTSmartRoutingWxDevice setDeviceVersion:](v12, "setDeviceVersion:", 0LL);
        -[BTSmartRoutingWxDevice _setHijackBackoffTick:](v12, "_setHijackBackoffTick:", 0LL);
        -[BTSmartRoutingWxDevice setConnected:](v12, "setConnected:", 1LL);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        -[BTSmartRoutingWxDevice setDeviceName:](v12, "setDeviceName:", v23);

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        -[BTSmartRoutingWxDevice setConduitDeviceID:](v12, "setConduitDeviceID:", v24);

        -[BTSmartRoutingWxDevice setProductID:](v12, "setProductID:", [v4 productID]);
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        -[BTSmartRoutingWxDevice setIdentifier:](v12, "setIdentifier:", v25);

        -[BTSmartRoutingWxDevice setInEar:](v12, "setInEar:", v22);
        -[BTSmartRoutingWxDevice setInEarDisabled:]( v12,  "setInEarDisabled:",  [v4 primaryPlacement] == 7);
        -[BTSmartRoutingWxDevice setIsTipiHealingV2Eligible:](v12, "setIsTipiHealingV2Eligible:", 0LL);
        -[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:](v12, "_setOtherTipiAudioCategory:", 0LL);
        -[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:](self, "_lowestBatteryInfoForCBDevice:", v4);
        -[BTSmartRoutingWxDevice setLowestBudBatteryInfo:](v12, "setLowestBudBatteryInfo:");
        -[BTSmartRoutingWxDevice _setRoutingInitialized:]( v12,  "_setRoutingInitialized:",  -[NSString isEqualToString:](self->_budSwapAddress, "isEqualToString:", v9));
        -[BTSmartRoutingWxDevice setTipitableUpdated:](v12, "setTipitableUpdated:", 0LL);
        else {
          unsigned int v26 = 3;
        }
        if (*((_BYTE *)v35 + 24)) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = 2LL;
        }
        -[BTSmartRoutingWxDevice _setRoutingAction:](v12, "_setRoutingAction:", v27);
        if (v22) {
          uint64_t v28 = 1LL;
        }
        else {
          uint64_t v28 = 3LL;
        }
        -[BTSmartRoutingWxDevice _setRoutingUI:](v12, "_setRoutingUI:", v28);
        -[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:]( v12,  "_setOtherTipiDeviceInfo:andName:andVersion:",  0LL,  0LL,  0LL);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "setObject:forKeyedSubscript:",  v12,  v9);
        self->_autoRoutingTicks = mach_absolute_time();
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          unsigned int v29 = -[BTSmartRoutingWxDevice routingAction](v12, "routingAction");
          if (v29 > 5) {
            uint64_t v30 = "?";
          }
          else {
            uint64_t v30 = off_100207BA8[v29];
          }
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  30LL,  "Current device route decision is %s",  v30);
        }

        if (self->_prefSmartRoutingEnabledPhase3
          && !self->_tipiElectionInProgress
          && -[BTSmartRoutingDaemon _aacpConnectedCheck:](self, "_aacpConnectedCheck:", v4))
        {
          -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
        }

        if (-[NSMutableArray containsObject:]( self->_smartRoutingManualDisconnectionList,  "containsObject:",  v9))
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  30LL,  "Remove Wx from manual disconnect list");
          }

          -[NSMutableArray removeObject:](self->_smartRoutingManualDisconnectionList, "removeObject:", v9);
        }

        unsigned int v31 = -[BTSmartRoutingWxDevice routingAction](v12, "routingAction");
        uint64_t v32 = 96LL;
        if (v31 == 2) {
          uint64_t v32 = 84LL;
        }
        ++*(_DWORD *)((char *)&self->super.isa + v32);

        _Block_object_dispose(&v34, 8);
      }
    }

    else if (dword_100234408 <= 90 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  90LL,  "No address found when creating Wx");
    }
  }

  else if (dword_100234408 <= 30 {
         && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  }
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]",  30LL,  "Skip creating SR Wx device since headset doesn't support SR");
  }
}

- (void)_smartRoutingConnectionCompleted:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bluetoothAddress]);

  if ([v6 length] == (id)6)
  {
    uint64_t v7 = NSPrintF("%.6a", COERCE_DOUBLE([v6 bytes]));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementFields]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v10, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

  unsigned int v12 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
  if (dword_100234408 <= 30)
  {
    unsigned int v13 = v12;
    if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))
    {
      uint64_t v14 = "yes";
      if (self->_forcedConnection) {
        id v15 = "yes";
      }
      else {
        id v15 = "no";
      }
      if (self->_tipiElectionInProgress) {
        id v16 = "yes";
      }
      else {
        id v16 = "no";
      }
      if (!v13) {
        uint64_t v14 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]",  30LL,  "Evaluator: smartRoutingConnectionCompleted cleaning up items, FD %s, tipi election %s OnDemand %s",  v15,  v16,  v14);
    }
  }

  connectDevice = self->_connectDevice;
  if (connectDevice)
  {
    self->_connectDevice = 0LL;
  }

  connectSession = self->_connectSession;
  if (connectSession)
  {
    -[CUBluetoothClassicConnection invalidate](connectSession, "invalidate");
    id v19 = self->_connectSession;
    self->_connectSession = 0LL;
  }

  if (!self->_disconnectTicksMap)
  {
    unsigned int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    disconnectTicksMap = self->_disconnectTicksMap;
    self->_disconnectTicksMap = v20;
  }

  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_disconnectTicksMap,  "setObject:forKeyedSubscript:",  &off_100219050,  v8);
  }
  self->_connectTicks = 0LL;
  self->_eligibleHeadsetTicks = 0LL;
  if (v4)
  {
    if (self->_prefSmartRoutingNoBackOffTimers) {
      goto LABEL_64;
    }
    if (self->_prefSmartRoutingEnabledPhase3 && self->_tipiElectionInProgress)
    {
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 otherTipiDeviceVersion]);
      [v23 doubleValue];
      double v25 = v24;

      if (v25 >= 1.2)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]",  30LL,  "Sending connection failure reuslt");
        }

        char v37 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self->_lePipeDevice, "idsIdentifier"));
        smartRoutingPipe = self->_smartRoutingPipe;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100023428;
        v43[3] = &unk_100206080;
        v43[4] = self;
        -[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:]( smartRoutingPipe,  "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:",  v37,  v8,  0LL,  @"connectionResultError",  v43);
      }

      else if (dword_100234408 <= 30 {
             && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      }
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]",  30LL,  "Phase 1/Legacy pipes connection failure, skip sending connection result");
      }

      -[BTSmartRoutingDaemon _postNotification:]( self,  "_postNotification:",  "com.apple.BluetoothServices.PreemptivePortDisconnected");
    }
  }

  else if (self->_prefSmartRoutingEnabledPhase3 && self->_tipiElectionInProgress)
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 otherTipiDeviceVersion]);
    [v27 doubleValue];
    double v29 = v28;

    if (v29 >= 1.2)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]",  30LL,  "Version 1.2 cleanup pipes....");
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self->_lePipeDevice, "idsIdentifier"));
      unsigned int v31 = self->_smartRoutingPipe;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1000234D4;
      v42[3] = &unk_100206380;
      v42[4] = self;
      v42[5] = v8;
      -[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:]( v31,  "_pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:",  v30,  v8,  0LL,  @"connectionResultSuccess",  v42);
    }

    else if (dword_100234408 <= 30 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    }
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _smartRoutingConnectionCompleted:]", 30LL, "Legacy pipes.");
    }

    if (v8)
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v8));

      if (v32)
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
        [v33 setConnected:1];
      }

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
      if ([v34 routingAction] == 3)
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srBudswapDeviceMap,  "objectForKeyedSubscript:",  v8));
        [v35 reconnectionState];
      }
    }

    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000235A8;
    v41[3] = &unk_100206D20;
    v41[4] = v8;
    v41[5] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v41);
  }

  self->_tipiElectionInProgress = 0;
  eligibleHeadset = self->_eligibleHeadset;
  self->_eligibleHeadset = 0LL;

  -[BTSmartRoutingDaemon _submitConnectionMetric:andError:](self, "_submitConnectionMetric:andError:", v8, v4);
  if (v4)
  {
    self->_forcedConnection = 0;
    phase1ConnectConfig = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = 0LL;

    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v8);
    }
  }

  -[BTSmartRoutingDaemon _submitNearbyDeviceMetric:](self, "_submitNearbyDeviceMetric:", Int64Ranged);
LABEL_64:
}

- (void)_respondRoutingRequest:(id)a3 withResponseHandler:(id)a4 wxAddress:(id)a5
{
  id v19 = a3;
  uint64_t v8 = (void (**)(id, id))a4;
  id v9 = a5;
  if (v8)
  {
    if (v19)
    {
      if (dword_100234408 <= 50
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
      {
        unsigned int v10 = [v19 action];
        if (v10 > 5) {
          BOOL v11 = "?";
        }
        else {
          BOOL v11 = off_100207BA8[v10];
        }
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v19 reason]);
        id v13 = [v19 clientID];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceAddress]);
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]",  50LL,  "RoutingRequestResponse: Action %s reason %@ CID 0x%X address %@",  v11,  v12,  v13,  v14);
      }

      tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
      if (tipiHealingHijackTimer)
      {
        id v16 = tipiHealingHijackTimer;
        dispatch_source_cancel(v16);
        id v17 = self->_tipiHealingHijackTimer;
        self->_tipiHealingHijackTimer = 0LL;
      }

      v8[2](v8, v19);
      if (v9)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v9));
        [v18 setAudioRoutingResponse:0];
        [v18 setAudioRoutingClientID:0];
      }
    }

    else if (dword_100234408 <= 90 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]",  90LL,  "RoutingRequestResponse: Skip, response is  null");
    }
  }

  else if (dword_100234408 <= 90 {
         && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  }
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]",  90LL,  "RoutingRequestResponse: Skip, no response handler");
  }
}

- (void)_hijackBlockingModeChangedFromClient:(id)a3 mode:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v17 = a3;
  uint64_t v8 = (void (**)(id, void))a5;
  if (dword_100234408 <= 50 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v17 deviceAddress]);
    unsigned int v10 = (void *)v9;
    BOOL v11 = "no";
    if (v6) {
      BOOL v11 = "yes";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _hijackBlockingModeChangedFromClient:mode:completion:]",  50LL,  "HijackBlockingModeChangedFromClient: Wx %@ mode %s control %@",  v9,  v11,  v17);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v17 appBundleID]);

  if (v12)
  {
    sourceDevice = self->_sourceDevice;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v17 appBundleID]);
    -[BTSmartRoutingSourceDevice _updateHijackBlockingClientWithBundleID:mode:]( sourceDevice,  "_updateHijackBlockingClientWithBundleID:mode:",  v14,  v6);

    v8[2](v8, 0LL);
    -[BTSmartRoutingDaemon _sendAudioCategoryToAllTipiDevices](self, "_sendAudioCategoryToAllTipiDevices");
  }

  else
  {
    if (dword_100234408 <= 50
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _hijackBlockingModeChangedFromClient:mode:completion:]",  50LL,  "HijackBlockingModeChangedFromClient: Update failed. bundle ID is NULL");
    }

    id v15 = objc_alloc(&OBJC_CLASS___NSError);
    id v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", off_100234400, 1LL, 0LL);
    ((void (**)(id, NSError *))v8)[2](v8, v16);
  }
}

- (void)_smartRoutingAudioRoutingRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___BTAudioRoutingResponse);
  uint64_t v59 = 0LL;
  BOOL v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  char v62 = 0;
  uint64_t v53 = 0LL;
  unint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  uint64_t v56 = sub_100019A08;
  v57 = sub_100019A18;
  id v58 = (id)objc_claimAutoreleasedReturnValue([v6 deviceAddress]);
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x3032000000LL;
  v51[3] = sub_100019A08;
  v51[4] = sub_100019A18;
  id v52 = 0LL;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x3032000000LL;
  v49[3] = sub_100019A08;
  v49[4] = sub_100019A18;
  id v50 = 0LL;
  v47[0] = 0LL;
  v47[1] = v47;
  v47[2] = 0x3032000000LL;
  void v47[3] = sub_100019A08;
  v47[4] = sub_100019A18;
  id v48 = 0LL;
  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  int v44 = sub_100019A08;
  v45 = sub_100019A18;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, @"AudioRequestCategory", TypeID, 0LL);
  BOOL v11 = @"Not set";
  if (TypedValue) {
    BOOL v11 = (__CFString *)TypedValue;
  }
  id v46 = v11;

  if (dword_100234408 <= 50 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceAddress]);
    id v27 = [v6 audioScore];
    id v13 = [v6 flags];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 appBundleID]);
    else {
      id v15 = "no";
    }
    unsigned __int8 v16 = [v6 flags];
    id v17 = [v6 clientID];
    if ((v16 & 0x20) != 0) {
      id v18 = "yes";
    }
    else {
      id v18 = "no";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]",  50LL,  "Routing request Wx %@ score %d flag %d app %@ fake hijack %s wentInEar %s, CID 0x%X, category %@",  v12,  v27,  v13,  v14,  v15,  v18,  v17,  v42[5]);
  }

  if (v54[5]) {
    goto LABEL_36;
  }
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100024144;
  v40[3] = &unk_100206D48;
  v40[4] = self;
  v40[5] = &v53;
  v40[6] = v51;
  v40[7] = v49;
  v40[8] = v47;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v40);
  if (v54[5])
  {
LABEL_36:
    else {
      LOBYTE(v20) = 0;
    }
    uint64_t v21 = self->_smartRoutingWxDeviceMap;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000242DC;
    v29[3] = &unk_100206D70;
    uint64_t v34 = &v53;
    id v22 = v6;
    id v30 = v22;
    unsigned int v31 = self;
    id v32 = v7;
    id v23 = v28;
    id v33 = v23;
    uint64_t v35 = &v59;
    uint64_t v36 = &v41;
    char v37 = v47;
    v38 = v51;
    char v39 = v20;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (!*((_BYTE *)v60 + 24))
    {
      budSwapAddress = self->_budSwapAddress;
      double v25 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceAddress]);
      LODWORD(budSwapAddress) = -[NSString isEqualToString:](budSwapAddress, "isEqualToString:", v25);

      if ((_DWORD)budSwapAddress)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]",  30LL,  "Hijack: Budswap reconnect in progress. Respond DontRoute before Wx connected. Budswap Wx %@",  self->_budSwapAddress);
        }

        [v7 setAction:3];
        [v7 setDeviceAddress:0];
        unsigned int v26 = @"Budswap reconnect will happen soon";
      }

      else
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]",  30LL,  "Hijack: respond MX to route if we don't find any SR Wx");
        }

        [v7 setAction:2];
        [v7 setDeviceAddress:0];
        unsigned int v26 = @"Not tipi device";
      }

      [v7 setReason:v26];
      objc_msgSend(v7, "setClientID:", objc_msgSend(v22, "clientID"));
      -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]( self,  "_respondRoutingRequest:withResponseHandler:wxAddress:",  v7,  v23,  v54[5]);
    }
  }

  else
  {
    [v7 setAction:3];
    [v7 setDeviceAddress:0];
    objc_msgSend(v7, "setReason:", @"Tipi device, do not route, not inEar and/or inEar is not disabled.");
    objc_msgSend(v7, "setClientID:", objc_msgSend(v6, "clientID"));
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]( self,  "_respondRoutingRequest:withResponseHandler:wxAddress:",  v7,  v28,  v54[5]);
  }

  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
}

- (void)_submitNearbyDeviceMetric:(unsigned int)a3
{
  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  int v44 = 0;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  int v40 = 0;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  int v32 = 0;
  uint64_t v25 = 0LL;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = 0;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002587C;
  v16[3] = &unk_100206D98;
  v16[4] = &v41;
  void v16[5] = &v37;
  v16[6] = &v33;
  v16[7] = &v29;
  v16[8] = &v25;
  v16[9] = &v21;
  v16[10] = &v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v16);
  v45[0] = @"iPhoneNearby";
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v42 + 6)));
  v46[0] = v5;
  v45[1] = @"iPadNearby";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v38 + 6)));
  v46[1] = v6;
  v45[2] = @"iPodNearby";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v34 + 6)));
  v46[2] = v7;
  v45[3] = @"macNearby";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v30 + 6)));
  v46[3] = v8;
  v45[4] = @"watchNearby";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v26 + 6)));
  v46[4] = v9;
  void v45[5] = @"appleTvNearby";
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v22 + 6)));
  v46[5] = v10;
  v45[6] = @"homePodNearby";
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v18 + 6)));
  v46[6] = v11;
  v45[7] = @"totalNearby";
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_nearbyInfoDevices, "count")));
  v46[7] = v12;
  v45[8] = @"wxPD";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
  v46[8] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  9LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.nearbyDevice", v14);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)submitHijackMetric:(id)a3 withV1:(BOOL)a4
{
  if (a3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:"));
    if (a4)
    {
      id v7 = @"V1";
    }

    else
    {
      -[SmartRoutingStats setHijackContinuousTimeoutCount:](self->_stats, "setHijackContinuousTimeoutCount:", 0LL);
      -[SmartRoutingStats setHijackRelaySent:](self->_stats, "setHijackRelaySent:", 0LL);
      -[SmartRoutingStats setHijackRoundTripTime:](self->_stats, "setHijackRoundTripTime:", 0LL);
      id v7 = @"V2";
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
    uint64_t v9 = (void *)v8;
    if (v8) {
      unsigned int v10 = (__CFString *)v8;
    }
    else {
      unsigned int v10 = @"NA";
    }
    BOOL v11 = v10;

    unsigned int v12 = v11;
    int v36 = v11;
    else {
      id v13 = v7;
    }
    v39[0] = @"askForHijack";
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SmartRoutingStats hijackRelaySent](self->_stats, "hijackRelaySent")));
    v40[0] = v38;
    v39[1] = @"audioScore";
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
    v40[1] = v37;
    v39[2] = @"otherTipiDeviceScore";
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 otherTipiAudioCategory]));
    v40[2] = v35;
    v39[3] = @"otherTipiDevicePlayingApp";
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 otherTipiDevicePlayingApp]);
    id v15 = (void *)v14;
    if (v14) {
      unsigned __int8 v16 = (const __CFString *)v14;
    }
    else {
      unsigned __int8 v16 = @"NA";
    }
    v40[3] = v16;
    v40[4] = v12;
    v39[4] = @"hijackAnswer";
    v39[5] = @"hijackVersion";
    v40[5] = v13;
    v39[6] = @"hijackContinousCount";
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SmartRoutingStats hijackContinuousTimeoutCount](self->_stats, "hijackContinuousTimeoutCount")));
    v40[6] = v34;
    v39[7] = @"hijackRoundTripTime";
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SmartRoutingStats hijackRoundTripTime](self->_stats, "hijackRoundTripTime")));
    v40[7] = v17;
    v39[8] = @"playingApp";
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp"));
    uint64_t v19 = (void *)v18;
    if (v18) {
      int v20 = (const __CFString *)v18;
    }
    else {
      int v20 = &stru_100212678;
    }
    v40[8] = v20;
    v39[9] = @"playingCategory";
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingCategory](self->_stats, "hijackPlayingCategory"));
    id v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (const __CFString *)v21;
    }
    else {
      uint64_t v23 = &stru_100212678;
    }
    void v40[9] = v23;
    v39[10] = @"theOtherTipiDevice";
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v6 otherTipiDeviceBTName]);
    uint64_t v25 = (void *)v24;
    if (v24) {
      unsigned int v26 = (const __CFString *)v24;
    }
    else {
      unsigned int v26 = &stru_100212678;
    }
    v40[10] = v26;
    v39[11] = @"wxPD";
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 productID]));
    v40[11] = v27;
    v39[12] = @"wxStreamState";
    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats wxStreamState](self->_stats, "wxStreamState"));
    int v32 = v6;
    uint64_t v29 = (void *)v28;
    if (v28) {
      id v30 = (const __CFString *)v28;
    }
    else {
      id v30 = &stru_100212678;
    }
    v40[12] = v30;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  13LL,  v32));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.hijack", v31);

    -[SmartRoutingStats setHijackRoundTripTime:](self->_stats, "setHijackRoundTripTime:", 0LL);
  }

- (void)submitRouteActivityMetric:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v54 = 0LL;
    unsigned int v53 = 0;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    if ([v7 isEqualToString:@"Manual_Route"])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteDestination](self->_stats, "manualRouteDestination"));
      unsigned int v10 = [v9 isEqualToString:@"Non-BT"];

      if (v10)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _findActiveWxDevice](self, "_findActiveWxDevice"));

        uint64_t v12 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
        uint64_t v8 = (void *)v12;
        id v6 = (id)v11;
      }
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
    uint64_t v14 = (void *)v13;
    id v15 = @"Unknown";
    if (v8)
    {
      if (v13)
      {
        unsigned int v16 = -[BTSmartRoutingDaemon _deviceSupportsHijackV2:withDevice:]( self,  "_deviceSupportsHijackV2:withDevice:",  v13,  v8);
        id v15 = @"V1";
        if (v16) {
          id v15 = @"V2";
        }
      }
    }

    uint64_t v17 = v15;
    v45 = v14;
    id v46 = v6;
    if ([v7 isEqualToString:@"Hijack_Away"])
    {
      unint64_t v51 = &stru_100212678;
      id v52 = &stru_100212678;
      uint64_t v18 = &v52;
      uint64_t v19 = &v51;
      -[BTSmartRoutingDaemon getHijackedAwayAudioInfo:appCount:playingApp:route:remote:]( self,  "getHijackedAwayAudioInfo:appCount:playingApp:route:remote:",  &v54,  (char *)&v54 + 4,  &v52,  &v51,  &v53);
    }

    else if ([v7 hasPrefix:@"Hijack_"])
    {
      uint64_t v49 = &stru_100212678;
      id v50 = &stru_100212678;
      uint64_t v18 = &v50;
      uint64_t v19 = &v49;
      -[BTSmartRoutingDaemon getHijackAudioInfo:appCount:playingApp:route:remote:]( self,  "getHijackAudioInfo:appCount:playingApp:route:remote:",  &v54,  (char *)&v54 + 4,  &v50,  &v49,  &v53);
    }

    else
    {
      if (([v7 isEqualToString:@"Remote_Manual_Route"] & 1) == 0
        && ([v7 hasPrefix:@"Manual_Route"] & 1) == 0
        && ![v7 isEqualToString:@"Reverse"])
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon submitRouteActivityMetric:activity:]",  30LL,  "Metric submit unsupported activity %@",  v7);
        }

        v38 = &stru_100212678;
        uint64_t v35 = &stru_100212678;
        goto LABEL_32;
      }

      BOOL v47 = &stru_100212678;
      id v48 = &stru_100212678;
      uint64_t v18 = &v48;
      uint64_t v19 = &v47;
      -[BTSmartRoutingDaemon getLocalAudioInfofromSnapshot:appCount:playingApp:route:remote:]( self,  "getLocalAudioInfofromSnapshot:appCount:playingApp:route:remote:",  &v54,  (char *)&v54 + 4,  &v48,  &v47,  &v53);
    }

    id v42 = (id)*v18;
    uint64_t v39 = (id)*v19;
    v55[0] = @"Activity";
    v55[1] = @"BundleID";
    v56[0] = v7;
    v56[1] = v42;
    v55[2] = @"DestinationRoute";
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteDestination](self->_stats, "manualRouteDestination"));
    uint64_t v21 = (void *)v20;
    if (v20) {
      id v22 = (const __CFString *)v20;
    }
    else {
      id v22 = @"NA";
    }
    v56[2] = v22;
    v56[3] = v17;
    v55[3] = @"HijackVersion";
    v55[4] = @"InTipi";
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v8 otherTipiDeviceBTAddress]);
    uint64_t v23 = @"YES";
    if (!v41) {
      uint64_t v23 = @"NO";
    }
    v56[4] = v23;
    v55[5] = @"LocalScore";
    id v44 = v7;
    int v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v54));
    v56[5] = v40;
    void v55[6] = @"ManualRouteInputOutput";
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteInputOutput](self->_stats, "manualRouteInputOutput"));
    uint64_t v43 = v17;
    uint64_t v25 = (void *)v24;
    if (v24) {
      unsigned int v26 = (const __CFString *)v24;
    }
    else {
      unsigned int v26 = @"NA";
    }
    v56[6] = v26;
    v55[7] = @"ManualRouteUISource";
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats manualRouteUISource](self->_stats, "manualRouteUISource"));
    uint64_t v28 = (void *)v27;
    if (v27) {
      uint64_t v29 = (const __CFString *)v27;
    }
    else {
      uint64_t v29 = @"NA";
    }
    v56[7] = v29;
    v55[8] = @"NumOfApps";
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", HIDWORD(v54)));
    v56[8] = v30;
    v55[9] = @"OtherTipiDeviceModel";
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v8 otherTipiDeviceBTName]);
    int v32 = (void *)v31;
    if (v31) {
      id v33 = (const __CFString *)v31;
    }
    else {
      id v33 = @"NA";
    }
    v56[9] = v33;
    v55[10] = @"RemoteScore";
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v53));
    uint64_t v35 = v39;
    v56[10] = v34;
    v56[11] = v39;
    v55[11] = @"Route";
    v55[12] = @"ProductID";
    int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v8 productID]));
    v56[12] = v36;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  13LL));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.RouteActivity", v37);

    id v7 = v44;
    v38 = v42;

    uint64_t v17 = v43;
    uint64_t v14 = v45;
    id v6 = v46;
LABEL_32:
  }
}

- (void)_smartRoutingChangeRoute:(id)a3
{
  id v10 = a3;
  if (!-[__CFArray count](self->_mediaRemoteOutputDevices, "count")) {
    goto LABEL_13;
  }
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(self->_mediaRemoteOutputDevices, v4);
    if (ValueAtIndex) {
      break;
    }
LABEL_6:
  }

  id v6 = ValueAtIndex;
  id v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
  id v8 = [v7 containsString:v10];
  if (!(_DWORD)v8)
  {

    goto LABEL_6;
  }

  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1 || (id v8 = (id)_LogCategory_Initialize(&dword_100234408, 30LL), (_DWORD)v8)) {
      id v8 = (id)LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingChangeRoute:]",  30LL,  "Set Route for device: %@",  v6);
    }
  }

  self->_routeChangeInProgress = 1;
  uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext(v8);
  MRAVOutputContextSetOutputDevice(SharedAudioPresentationContext, v6, self->_dispatchQueue, &stru_100206DD8);

LABEL_13:
}

- (void)_smartRoutingLowerRateScan
{
  dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
  smartRoutingLowerScanRateTimer = self->_smartRoutingLowerScanRateTimer;
  if (smartRoutingLowerScanRateTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    unsigned int v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    id v6 = self->_smartRoutingLowerScanRateTimer;
    self->_smartRoutingLowerScanRateTimer = v5;

    id v7 = self->_smartRoutingLowerScanRateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000264A0;
    handler[3] = &unk_100206058;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_smartRoutingLowerScanRateTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_smartRoutingLowerScanRateTimer);
  }

- (void)_lowBatteryLoad
{
  if (!self->_lowBatteryLoaded)
  {
    v2 = self;
    CFTypeID TypeID = CFArrayGetTypeID();
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obj = (id)CFPrefs_CopyTypedValue(@"com.apple.bluetooth", @"lowBatteryDevices", TypeID, 0LL);
    id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    unsigned int v5 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
    if (v4)
    {
      id v6 = v4;
      int v7 = 0;
      uint64_t v8 = *(void *)v34;
      id v30 = v2;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            CFTypeID v12 = CFStringGetTypeID();
            uint64_t TypedValue = CFDictionaryGetTypedValue(v10, @"id", v12, 0LL);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
            if (v14)
            {
              id v15 = objc_alloc_init(&OBJC_CLASS___BTLowBatteryDevice);
              CFTypeID v16 = CFStringGetTypeID();
              -[BTLowBatteryDevice setDeviceAddress:]( v15,  "setDeviceAddress:",  CFDictionaryGetTypedValue(v10, @"deviceAddress", v16, 0LL));
              -[BTLowBatteryDevice setIdentifier:](v15, "setIdentifier:", v14);
              CFTypeID v17 = CFStringGetTypeID();
              -[BTLowBatteryDevice setName:](v15, "setName:", CFDictionaryGetTypedValue(v10, @"name", v17, 0LL));
              CFDictionaryGetDouble(v10, @"batteryLevel", 0LL);
              -[BTLowBatteryDevice setLastBatteryLevel:](v15, "setLastBatteryLevel:");
              -[BTLowBatteryDevice setLastBatteryType:]( v15,  "setLastBatteryType:",  (int)CFDictionaryGetInt64Ranged(v10, @"batteryType", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL));
              CFDictionaryGetDouble(v10, @"lastSeen", 0LL);
              -[BTLowBatteryDevice setLastSeenTime:](v15, "setLastSeenTime:");
              -[BTLowBatteryDevice setProductID:]( v15,  "setProductID:",  CFDictionaryGetInt64Ranged(v10, @"productID", 0LL, 0xFFFFFFFFLL, 0LL));
              CFDictionaryGetDouble(v10, @"reportTime", 0LL);
              -[BTLowBatteryDevice setReportTime:](v15, "setReportTime:");
              lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              if (!lowBatteryDeviceMap)
              {
                uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                uint64_t v20 = v2->_lowBatteryDeviceMap;
                v2->_lowBatteryDeviceMap = v19;

                lowBatteryDeviceMap = v2->_lowBatteryDeviceMap;
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( lowBatteryDeviceMap,  "setObject:forKeyedSubscript:",  v15,  v14);
              int inst_meths = (int)v5[14].inst_meths;
              if (inst_meths <= 30
                && (inst_meths != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
              {
                int v31 = v7;
                id v22 = (void *)objc_claimAutoreleasedReturnValue(-[BTLowBatteryDevice deviceAddress](v15, "deviceAddress"));
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTLowBatteryDevice name](v15, "name"));
                -[BTLowBatteryDevice lastBatteryLevel](v15, "lastBatteryLevel");
                double v25 = v24;
                unsigned int v26 = -[BTLowBatteryDevice lastBatteryType](v15, "lastBatteryType");
                uint64_t v27 = "?";
                -[BTLowBatteryDevice reportTime](v15, "reportTime");
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryLoad]",  30LL,  "Low battery loaded: DA %@, Name '%@', Battery %.0f%% (%s), ReportTime %{DateCF}",  v22,  v23,  v25 * 100.0,  v27,  v28);

                v2 = v30;
                int v7 = v31;
                unsigned int v5 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
              }

              ++v7;
            }
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v6);
    }

    else
    {
      int v7 = 0;
    }

    v2->_lowBatteryLoaded = 1;
    int v29 = (int)v5[14].inst_meths;
  }

- (void)_lowBatterySave:(BOOL)a3
{
  p_lowBatterySaveTimer = (id *)&self->_lowBatterySaveTimer;
  lowBatterySaveTimer = self->_lowBatterySaveTimer;
  if (a3)
  {
    if (lowBatterySaveTimer)
    {
      id v6 = lowBatterySaveTimer;
      dispatch_source_cancel(v6);
      id v7 = *p_lowBatterySaveTimer;
      id *p_lowBatterySaveTimer = 0LL;
    }

    uint64_t v11 = 0LL;
    CFTypeID v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    uint64_t v14 = sub_100019A08;
    id v15 = sub_100019A18;
    id v16 = 0LL;
    lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100026B6C;
    v10[3] = &unk_100206E00;
    void v10[4] = &v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( lowBatteryDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v10);
    CFPrefs_SetValue(@"com.apple.bluetooth", @"lowBatteryDevices", v12[5]);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatterySave:]",  30,  "Low battery saved: %d total",  [(id)v12[5] count]);
    }

    _Block_object_dispose(&v11, 8);
  }

  else if (!lowBatterySaveTimer)
  {
    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong(p_lowBatterySaveTimer, v9);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100026B60;
    handler[3] = &unk_100206058;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    CUDispatchTimerSet(v9, self->_prefLowBatterySaveSeconds, -1.0, -10.0);
    dispatch_activate(v9);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatterySave:]",  30LL,  "Low battery save in %ll{dur}",  (unint64_t)self->_prefLowBatterySaveSeconds);
    }
  }

- (void)_lowBatteryUpdate
{
  if (self->_prefLowBatteryEnabled)
  {
    -[BTSmartRoutingDaemon _lowBatteryLoad](self, "_lowBatteryLoad");
    uint64_t v55 = 0LL;
    uint64_t v56 = &v55;
    uint64_t v57 = 0x2020000000LL;
    int v58 = 0;
    uint64_t v51 = 0LL;
    id v52 = &v51;
    uint64_t v53 = 0x2020000000LL;
    int v54 = 0;
    uint64_t v47 = 0LL;
    id v48 = &v47;
    uint64_t v49 = 0x2020000000LL;
    int v50 = 0;
    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x2020000000LL;
    int v46 = 0;
    uint64_t v39 = 0LL;
    int v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    id v42 = sub_100019A08;
    uint64_t v43 = sub_100019A18;
    id v44 = 0LL;
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100027348;
    v38[3] = &unk_100206E28;
    v38[4] = self;
    v38[5] = v45;
    v38[6] = &v55;
    v38[7] = &v51;
    v38[8] = &v47;
    v38[9] = &v39;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( lowBatteryWxDevices,  "enumerateKeysAndObjectsUsingBlock:",  v38);
    double Current = CFAbsoluteTimeGetCurrent();
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_lowBatteryDeviceMap, "allKeys"));
    id v6 = [v5 countByEnumeratingWithState:&v34 objects:v60 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lowBatteryDeviceMap,  "objectForKeyedSubscript:",  v10));
          [v11 lastSeenTime];
          if (vabdd_f64(Current, v12) >= self->_prefLowBatteryStaleSeconds)
          {
            [v11 reportTime];
            if (vabdd_f64(Current, v13) >= self->_prefLowBatteryStaleSeconds)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lowBatteryDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v10);
              ++v7;
              if (dword_100234408 <= 30
                && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
              {
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceAddress]);
                id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryUpdate]",  30LL,  "Low battery removed stale: %@ '%@'",  v14,  v15);
              }
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v34 objects:v60 count:16];
      }

      while (v6);

      if (v7 >= 1) {
        -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0LL);
      }
    }

    else
    {

      int v7 = 0;
    }

    if (-[CUSystemMonitor screenOn](self->_powerMonitor, "screenOn")
      && !self->_effectiveScreenLocked
      && !self->_uiLowBatteryBanner
      && !self->_uiNoteSessionLowBattery
      && !self->_systemUIProxCardPresent)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v16 = (id)v40[5];
      CFTypeID v17 = 0LL;
      id v18 = [v16 countByEnumeratingWithState:&v30 objects:v59 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v31;
        do
        {
          for (j = 0LL; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
            if ([v21 lastBatteryType])
            {
              [v17 lastBatteryLevel];
              double v23 = v22;
              if (v22 == 0.0 || ([v21 lastBatteryLevel], v23 >= v24))
              {
                id v25 = v21;

                CFTypeID v17 = v25;
              }
            }
          }

          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v59 count:16];
        }

        while (v18);
      }

      id v26 = v17;
      if (v26) {
        -[BTSmartRoutingDaemon _lowBatteryShowAlertWithLowBatteryDevice:]( self,  "_lowBatteryShowAlertWithLowBatteryDevice:",  v26);
      }
    }

    if (self->_uiLowBatteryBanner && self->_systemUIProxCardPresent)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryUpdate]",  30LL,  "Low battery dismiss on prox card");
      }

      -[BTBannerUISession invalidate](self->_uiLowBatteryBanner, "invalidate");
      uiLowBatteryBanner = self->_uiLowBatteryBanner;
      self->_uiLowBatteryBanner = 0LL;
    }

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      unsigned int v28 = -[NSMutableDictionary count](self->_lowBatteryWxDevices, "count");
      int v29 = "yes";
      if (!self->_systemUIProxCardPresent) {
        int v29 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryUpdate]",  30LL,  "Low battery update: %d total, %d AC, %d high, %d low, %d stale, Prox %s",  v28,  *((_DWORD *)v56 + 6),  *((_DWORD *)v52 + 6),  *((_DWORD *)v48 + 6),  v7,  v29);
    }

    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
  }

- (void)_lowBatteryDeviceFound:(id)a3
{
  id v4 = a3;
  if (self->_prefLowBatteryEnabled)
  {
    id v10 = v4;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    if (v6)
    {
      lowBatteryWxDevices = self->_lowBatteryWxDevices;
      if (!lowBatteryWxDevices)
      {
        uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        dispatch_source_t v9 = self->_lowBatteryWxDevices;
        self->_lowBatteryWxDevices = v8;

        lowBatteryWxDevices = self->_lowBatteryWxDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryWxDevices, "setObject:forKeyedSubscript:", v10, v6);
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    }

    id v4 = v10;
  }
}

- (void)_lowBatteryDeviceLost:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  unsigned int v5 = v6;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lowBatteryWxDevices,  "setObject:forKeyedSubscript:",  0LL,  v6);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    unsigned int v5 = v6;
  }
}

- (BOOL)_lowBatteryTrackSFDevice:(id)a3 batteryLevel:(double)a4 batteryType:(int64_t)a5
{
  id v8 = a3;
  dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  if (v10)
  {
    int64_t v26 = a5;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v27 advertisementFields]);
    uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v11, @"publicAddress", 6LL, 0LL);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = NSPrintF("%.6a", COERCE_DOUBLE([v13 bytes]));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    }

    else
    {
      id v16 = 0LL;
    }

    CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v11, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lowBatteryDeviceMap, "objectForKeyedSubscript:", v10));
    uint64_t v20 = (BTLowBatteryDevice *)v19;
    if (!v19)
    {
      uint64_t v20 = objc_alloc_init(&OBJC_CLASS___BTLowBatteryDevice);
      -[BTLowBatteryDevice setIdentifier:](v20, "setIdentifier:", v10);
      lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      if (!lowBatteryDeviceMap)
      {
        double v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        double v23 = self->_lowBatteryDeviceMap;
        self->_lowBatteryDeviceMap = v22;

        lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](lowBatteryDeviceMap, "setObject:forKeyedSubscript:", v20, v10);
    }

    -[BTLowBatteryDevice setDeviceAddress:](v20, "setDeviceAddress:", v16);
    -[BTLowBatteryDevice setLastBatteryLevel:](v20, "setLastBatteryLevel:", a4);
    -[BTLowBatteryDevice setLastBatteryType:](v20, "setLastBatteryType:", v26);
    -[BTLowBatteryDevice setLastSeenTime:](v20, "setLastSeenTime:", CFAbsoluteTimeGetCurrent());
    -[BTLowBatteryDevice setName:](v20, "setName:", v17);
    -[BTLowBatteryDevice setProductID:](v20, "setProductID:", Int64Ranged);
    -[BTLowBatteryDevice setReportTime:](v20, "setReportTime:", 0.0);
    if (!v19
      && dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryTrackSFDevice:batteryLevel:batteryType:]",  30LL,  "Low battery tracked: DA %@, PID %u, Name '%@', %@",  v16,  Int64Ranged,  v17,  v27);
    }

    -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0LL);

    BOOL v24 = v19 == 0;
  }

  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_lowBatteryClearSFDevice:(id)a3 reason:(const char *)a4
{
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  if (v8)
  {
    dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lowBatteryDeviceMap,  "objectForKeyedSubscript:",  v8));
    id v10 = v9;
    BOOL v11 = v9 != 0LL;
    if (v9)
    {
      [v9 setLastBatteryLevel:0.0];
      [v10 setLastBatteryType:0];
      [v10 setLastSeenTime:CFAbsoluteTimeGetCurrent()];
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceAddress]);
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryClearSFDevice:reason:]",  30LL,  "Low battery cleared: DA %@, Name '%@', %@, %s",  v12,  v13,  v14,  a4);
      }

      -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 0LL);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_lowBatteryReportGood:(id)a3
{
  id v12 = a3;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id v4 = (void *)CFPrefs_CopyTypedValue(@"com.apple.bluetooth", @"lowBatteryInfo", TypeID, 0LL);
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);

      if (v8)
      {
        id v8 = [v4 mutableCopy];
        [v8 setObject:0 forKeyedSubscript:v7];
      }
    }

    else
    {
      id v8 = 0LL;
    }

    dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 counterpartIdentifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

    if (v10)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);

      if (v11)
      {
        if (!v8) {
          id v8 = [v4 mutableCopy];
        }
        [v8 setObject:0 forKeyedSubscript:v10];
      }
    }

    if (v8)
    {
      CFPrefs_SetValue(@"com.apple.bluetooth", @"lowBatteryInfo", v8);
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryReportGood:]",  30LL,  "Low battery cleared: %@",  v5);
      }
    }
  }
}

- (void)_lowBatteryReset
{
  lowBatteryDeviceMap = self->_lowBatteryDeviceMap;
  self->_lowBatteryDeviceMap = 0LL;

  self->_lowBatteryLoaded = 0;
  -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
}

- (void)_lowBatteryShowAlertWithLowBatteryDevice:(id)a3
{
  id v4 = a3;
  [v4 lastBatteryLevel];
  double v6 = v5;
  int v7 = (char *)[v4 lastBatteryType];
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v9 = [v4 productID];
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceAddress]);
    else {
      BOOL v11 = off_100207950[(void)(v7 - 1)];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowBatteryShowAlertWithLowBatteryDevice:]",  30LL,  "Low Battery banner: DA %@, PID %u, Name '%@', Battery %.0f%% (%s)",  v10,  v9,  v8,  v6 * 100.0,  v11);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___BTBannerUISession);
  objc_storeStrong((id *)&self->_uiLowBatteryBanner, v12);
  -[BTBannerUISession setDispatchQueue:](v12, "setDispatchQueue:", self->_dispatchQueue);
  -[BTBannerUISession setLowBatteryLevel:](v12, "setLowBatteryLevel:", v6);
  -[BTBannerUISession setTimeoutSeconds:](v12, "setTimeoutSeconds:", 4.0);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceAddress]);
  if (v7 == (char *)1)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _bluetoothProductIDToCaseAsset:andAddress:]( self,  "_bluetoothProductIDToCaseAsset:andAddress:",  v9,  v13));
    uint64_t v15 = @"AirPods Case";
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToAsset:](self, "_bluetoothProductIDToAsset:", v9));
    uint64_t v15 = v8;
  }

  -[BTBannerUISession setCenterContentText:](v12, "setCenterContentText:", v15);
  -[BTBannerUISession setLeadingAccessoryImageName:](v12, "setLeadingAccessoryImageName:", v14);
  -[BTBannerUISession setCenterContentItemsIcon:](v12, "setCenterContentItemsIcon:", @"LowBattery");
  id v16 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v16, "setNumberStyle:", 3LL);
  -[NSNumberFormatter setMaximumFractionDigits:](v16, "setMaximumFractionDigits:", 0LL);
  CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v16, "stringFromNumber:", v17));
  -[BTBannerUISession setCenterContentItemsText:](v12, "setCenterContentItemsText:", v18);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000282A0;
  v19[3] = &unk_100206770;
  v19[4] = v12;
  v19[5] = self;
  -[BTBannerUISession setActionHandler:](v12, "setActionHandler:", v19);
  -[BTBannerUISession activate](v12, "activate");
  [v4 setReportTime:CFAbsoluteTimeGetCurrent()];
  -[BTSmartRoutingDaemon _lowBatterySave:](self, "_lowBatterySave:", 1LL);
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  id v4 = self->_aaController;
  if (!v4)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_100206E48);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100028494;
    v6[3] = &unk_100206380;
    id v4 = v5;
    int v7 = v4;
    id v8 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v6);
  }
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    id v4 = self->_aaController;
    self->_aaController = 0LL;
  }

- (void)_activityMonitorEnsureStarted
{
  p_int activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  if (self->_activityLevelNotifyToken == -1)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _activityMonitorEnsureStarted]",  30LL,  "Activity Monitor Ensure Started");
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000286D0;
    v6[3] = &unk_100206308;
    void v6[4] = self;
    notify_register_dispatch("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken, dispatchQueue, v6);
    int activityLevelNotifyToken = self->_activityLevelNotifyToken;
    uint64_t state64 = 0LL;
    notify_get_state(activityLevelNotifyToken, &state64);
    self->_unint64_t activityLevel = state64;
    -[BTSmartRoutingDaemon _nearbyInfoActivityChanged](self, "_nearbyInfoActivityChanged");
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
  }

- (void)_activityMonitorEnsureStopped
{
  if (self->_activityLevelNotifyToken != -1)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _activityMonitorEnsureStopped]",  30LL,  "Activity Monitor Ensure Stopped");
    }

    self->_unint64_t activityLevel = 0;
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
    int activityLevelNotifyToken = self->_activityLevelNotifyToken;
    if (activityLevelNotifyToken != -1)
    {
      notify_cancel(activityLevelNotifyToken);
      self->_int activityLevelNotifyToken = -1;
    }
  }

  smartRoutingController = self->_smartRoutingController;
  if (smartRoutingController)
  {
    -[CBController invalidate](smartRoutingController, "invalidate");
    double v5 = self->_smartRoutingController;
    self->_smartRoutingController = 0LL;
  }

- (void)_callMonitorEnsureStarted
{
  if (!self->_callMonitor)
  {
    dispatch_time_t v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    callMonitor = self->_callMonitor;
    self->_callMonitor = v3;
    double v5 = v3;

    -[CUSystemMonitor setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100028964;
    v7[3] = &unk_100206358;
    v7[4] = v5;
    v7[5] = self;
    double v6 = objc_retainBlock(v7);
    -[CUSystemMonitor setCallChangedHandler:](v5, "setCallChangedHandler:", v6);
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_callMonitorEnsureStopped
{
  callMonitor = self->_callMonitor;
  self->_callMonitor = 0LL;
}

- (void)_connectedDeviceMonitorEnsureStarted
{
  if (!self->_connectedDiscovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStarted]",  30LL,  "_connectedDeviceMonitorEnsureStarted");
    }

    dispatch_time_t v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = v3;
    double v5 = v3;

    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setLabel:](v5, "setLabel:", @"SmartRouting");
    -[CBDiscovery setDiscoveryFlags:]( v5,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](v5, "discoveryFlags") | 0x80000200000LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100028CD8;
    v9[3] = &unk_100206E70;
    v9[4] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100028CE4;
    v8[3] = &unk_100206058;
    v8[4] = self;
    -[CBDiscovery setBluetoothStateChangedHandler:](v5, "setBluetoothStateChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100028DFC;
    v7[3] = &unk_100206E70;
    v7[4] = self;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100028E08;
    v6[3] = &unk_100206380;
    void v6[4] = self;
    void v6[5] = v5;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_connectedDeviceMonitorEnsureStopped
{
  if (self->_connectedDiscovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _connectedDeviceMonitorEnsureStopped]",  30LL,  "_connectedDeviceMonitorEnsureStopped");
    }

    -[CBDiscovery invalidate](self->_connectedDiscovery, "invalidate");
    connectedDiscovery = self->_connectedDiscovery;
    self->_connectedDiscovery = 0LL;
  }

- (void)_connectedDeviceFound:(id)a3
{
  id v157 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v157 btAddressData]);
  uint64_t v5 = CUPrintNSDataAddress();
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v157 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v157 identifier]);
    [v8 connectionUpdatedForBluetoothIdentifier:v9 connected:1];

    if (([v157 connectedServices] & 0x11) == 0)
    {
LABEL_233:

      goto LABEL_234;
    }

    if (!self->_connectedDevices)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      connectedDevices = self->_connectedDevices;
      self->_connectedDevices = v10;
    }

    if (!self->_connectedDevicesInEarCache)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      connectedDevicesInEarCache = self->_connectedDevicesInEarCache;
      self->_connectedDevicesInEarCache = v12;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6));

    uint64_t v15 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
    if (v14)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _connectedDeviceFound:]",  30LL,  "Connected device updated: %@",  v157);
      }

- (void)_connectedDeviceLost:(id)a3
{
  id v31 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v31 btAddressData]);
  uint64_t v5 = CUPrintNSDataAddress();
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
    [v7 connectionUpdatedForBluetoothIdentifier:v8 connected:0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6));
    if (v9)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _connectedDeviceLost:]",  30LL,  "Connected device lost: disconnectReason %llu, device %@",  self->_smartRoutingDisconnectReason,  v31);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_connectedDevices,  "setObject:forKeyedSubscript:",  0LL,  v6);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceManager]);
      [v11 deviceDisconnectedWithAddress:v6];

      -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]( self,  "_hijackBackoffReset:withReason:",  v6,  @"wxDisconnected");
      -[NSMutableDictionary removeObjectForKey:](self->_smartRoutingWxStatsMap, "removeObjectForKey:", v6);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
      if (v31)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v13));
        [v14 setPreemptiveBannerShown:0];

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v13));
        [v15 setFirstPreemptiveBannerShown:0];

        -[BTSmartRoutingDaemon _submitMetric:](self, "_submitMetric:", v31);
        if ([@"6A221" compare:v12 options:64] != (id)-1)
        {
          if (!self->_disconnectTicksMap)
          {
            id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            disconnectTicksMap = self->_disconnectTicksMap;
            self->_disconnectTicksMap = v16;
          }

          uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_disconnectTicksMap,  "setObject:forKeyedSubscript:",  v19,  v6);
        }

        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smartRoutingWxDeviceMap, "objectForKey:", v6));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 audioRoutingResponse]);

        if (v21)
        {
          id v22 = objc_alloc_init(&OBJC_CLASS___BTAudioRoutingResponse);
          [v22 setAction:3];
          [v22 setReason:@"Wx disconnecting"];
          objc_msgSend(v22, "setClientID:", objc_msgSend(v20, "audioRoutingClientID"));
          double v23 = (void *)objc_claimAutoreleasedReturnValue([v20 audioRoutingResponse]);
          -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]( self,  "_respondRoutingRequest:withResponseHandler:wxAddress:",  v22,  v23,  v6);
        }

        -[NSMutableDictionary removeObjectForKey:](self->_smartRoutingWxDeviceMap, "removeObjectForKey:", v6);
        if (self->_tipiElectionInProgress) {
          self->_tipiElectionInProgress = 0;
        }
        tipiHealingTimer = self->_tipiHealingTimer;
        if (tipiHealingTimer)
        {
          id v25 = tipiHealingTimer;
          dispatch_source_cancel(v25);
          int64_t v26 = self->_tipiHealingTimer;
          self->_tipiHealingTimer = 0LL;
        }

        hijackBackOffTimer = self->_hijackBackOffTimer;
        if (hijackBackOffTimer)
        {
          unsigned int v28 = hijackBackOffTimer;
          dispatch_source_cancel(v28);
          int v29 = self->_hijackBackOffTimer;
          self->_hijackBackOffTimer = 0LL;
        }

        -[BTSmartRoutingSourceDevice _setShouldStayOnVirtual:](self->_sourceDevice, "_setShouldStayOnVirtual:", 0LL);
      }

      if (!-[NSMutableDictionary count](self->_connectedDevices, "count") && !self->_tipiElectionInProgress)
      {
        -[BTSmartRoutingDaemon _mediaRouteDiscoveryStopped](self, "_mediaRouteDiscoveryStopped");
        smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
        self->_smartRoutingWxDeviceMap = 0LL;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "setObject:forKeyedSubscript:",  0LL,  v6);
      -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:]( self,  "_updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:",  v31,  0LL);
      -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    }
  }
}

- (void)_mediaRouteDiscoveryStarted
{
  if (!self->_discoverySession && !self->_discoverySessionInitializing)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteDiscoveryStarted]",  30LL,  "Media Route Discovery Started");
    }

    self->_discoverySessionInitializing = 1;
    dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002A73C;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(dispatchQueueAVSys, block);
  }

- (void)_mediaRouteDiscoveryStopped
{
  discoverySessionToken = self->_discoverySessionToken;
  self->_discoverySessionToken = 0LL;
  discoverySession = self->_discoverySession;
  self->_discoverySession = 0LL;
  if (discoverySession)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteDiscoveryStopped]",  30LL,  "Media Route Discovery Stop");
    }

    dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002A9BC;
    v7[3] = &unk_100206F08;
    v7[4] = discoverySession;
    void v7[5] = discoverySessionToken;
    dispatch_async(dispatchQueueAVSys, v7);
  }

  mediaRemoteOutputDevices = self->_mediaRemoteOutputDevices;
  if (mediaRemoteOutputDevices) {
    CFRelease(mediaRemoteOutputDevices);
  }
  self->_mediaRemoteOutputDevices = 0LL;
}

- (void)_mediaRouteMonitorEnsureStarted
{
  if (!self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStarted]",  30LL,  "Media Ensure Started");
    }

    if (self->_prefSmartRoutingEnabledPhase3)
    {
      self->_mediaRouteMonitorObservingActiveAudioRoute = 1;
      dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  AVSystemController_SomeSessionIsPlayingDidChangeNotification,  AVSystemController_NowPlayingAppIsPlayingDidChangeNotification,  AVSystemController_CallIsActiveDidChangeNotification,  AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification,  0LL));
      [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
      [v4 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_CallIsActiveDidChangeNotification object:v3];
      [v4 removeObserver:self name:AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification object:v3];
      [v4 removeObserver:self name:@"CdSignalAudioInterruptedChanged" object:0];
      [v4 addObserver:self selector:"_mediaRouteMonitorActivityLevelUpdate:" name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaServerConnectionDied:" name:AVSystemController_ServerConnectionDiedNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaPlayStateChange:" name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleCallStateChange:" name:AVSystemController_CallIsActiveDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleHighestAudioCategoryChange:" name:AVSystemController_HighestArbitrationPriorityForTipiDidChangeNotification object:v3];
      [v4 addObserver:self selector:"_handleMediaPauseStateChanged" name:@"CdSignalAudioInterruptedChanged" object:0];
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_HighestArbitrationPriorityForTipiAttribute]);
      int v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKeyedSubscript:AVSystemController_HighestArbitrationPriorityForTipi_AudioScore]);
      -[BTSmartRoutingDaemon _updateLocalAudioCategory:](self, "_updateLocalAudioCategory:", v7);
      dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002AD08;
      block[3] = &unk_100206058;
      block[4] = self;
      dispatch_async(dispatchQueueAVSys, block);
    }
  }

- (void)_mediaRouteMonitorEnsureStopped
{
  if (self->_mediaRouteMonitorObservingActiveAudioRoute)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteMonitorEnsureStopped]",  30LL,  "Media Ensure Stopped");
    }

    self->_mediaRouteMonitorObservingActiveAudioRoute = 0;
    self->_BOOL activityLevelMediaPlaying = 0;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:kMRMediaRemotePickableRoutesDidChangeNotification object:0];
    [v3 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:0];
    objc_msgSend( v3,  "removeObserver:name:object:",  self,  @"MRAVOutputContextOutputDevicesDidChangeNotification",  MRAVOutputContextGetSharedSystemAudioContext(objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, 0)));
  }

- (void)_mediaRouteMonitorActiveAudioRouteChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AF34;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_mediaRouteMonitorSpeakRoute
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/UserNotifications/Bundles/com.apple.BTUserNotifications.bundle"));
  id v4 = (void *)v3;
  if (!v3)
  {
    int v7 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
    goto LABEL_9;
  }

  uint64_t v5 = CULocalizedStringEx(v3, @"Localizable", @"SPEAK_CONNECTED_FORMAT");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
  if (!v6)
  {
LABEL_9:
    id v8 = @"?";
    goto LABEL_10;
  }

  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v7));

LABEL_10:
  id v9 = objc_alloc_init(&OBJC_CLASS___CUVoiceSession);
  [v9 setDispatchQueue:self->_dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002BD10;
  v10[3] = &unk_100206080;
  void v10[4] = v9;
  [v9 speakText:v8 flags:0 completion:v10];
}

- (void)_mediaRouteMonitorActivityLevelUpdate:(id)a3
{
  dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BDF8;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueueAVSys, block);
}

- (void)_mediaRouteHijackResponseHandlerFor:(id)a3 allowedToHijack:(BOOL)a4 withReason:(id)a5
{
  BOOL v6 = a4;
  id v31 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___BTAudioRoutingResponse);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v31));
  if (v6)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]",  30LL,  "SmartRoutingAudioHijackAnswerAccepted");
    }

    uint64_t v11 = 1LL;
    [v9 setAction:1];
    [v9 setDeviceAddress:v31];
    [v9 setReason:@"Tipi device hijack was successful"];
    self->_autoRoutingResponseTicks = mach_absolute_time();
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]",  30LL,  "SmartRoutingAudioHijackAnswerRejected");
    }

    uint64_t v12 = 3LL;
    [v9 setAction:3];
    [v9 setDeviceAddress:0];
    [v9 setReason:v8];
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v9 reason]);
    unsigned int v14 = [v13 isEqualToString:@"Backoff"];

    if (v14)
    {
      uint64_t v12 = 4LL;
      [v9 setAction:4];
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 reason]);
    unsigned int v16 = [v15 isEqualToString:@"Ambiguity"];

    if (v16) {
      uint64_t v11 = 2LL;
    }
    else {
      uint64_t v11 = v12;
    }
  }

  objc_msgSend(v9, "setClientID:", objc_msgSend(v10, "audioRoutingClientID"));
  CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue([v10 audioRoutingResponse]);

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 audioRoutingResponse]);
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]( self,  "_respondRoutingRequest:withResponseHandler:wxAddress:",  v9,  v18,  v31);
  }

  if (v6)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceBTAddress]);

    if (v19)
    {
      unint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:]( v20,  "setObject:forKey:",  &__kCFBooleanTrue,  @"audioRoutingSetOwnershipToFalse");
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", @"Hijackv2", @"reason");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 otherTipiAudioCategory]));
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v21, @"localscore");

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v22, @"audioRoutingScore");

      double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SmartRoutingStats hijackScore](self->_stats, "hijackScore")));
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v23, @"remotescore");

      if ([v10 otherTipiAudioCategory] >= 0xC9) {
        -[NSMutableDictionary setObject:forKey:]( v20,  "setObject:forKey:",  &__kCFBooleanTrue,  @"SmartRoutingKeyShowNearbyUI");
      }
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceBTAddress]);
      -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v20,  v31,  v24);
    }

    uint64_t v25 = mach_absolute_time();
    unint64_t v26 = UpTicksToSeconds(v25 - self->_showBannerConnectedLastTicks);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      unsigned int v27 = [v10 routed];
      unsigned int v28 = "no";
      if (v27) {
        unsigned int v28 = "yes";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]",  30LL,  "Show connected banner after hijack routed %s secondSinceLastBanner %d",  v28,  v26);
    }

    if ((([v10 routed] & 1) != 0
       || self->_showBannerConnectedLastTicks && self->_secondsBetweenConnectBanner > (double)v26)
      && dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      else {
        int v29 = "no";
      }
      else {
        __int128 v30 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponseHandlerFor:allowedToHijack:withReason:]",  30LL,  "Connected banner cool off period is %llus, inEar state is %s inEar state disabled %s",  v26,  v29,  v30);
    }
  }

  -[BTSmartRoutingDaemon _startHijackMetricSubmission:wxAddress:version:]( self,  "_startHijackMetricSubmission:wxAddress:version:",  v11,  v31,  @"V2");
}

- (void)_mediaRouteHijackResponse:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5 andAllowedToHijack:(BOOL)a6 withReason:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a3;
  id v32 = a4;
  id v12 = a7;
  id v13 = a5;
  unsigned int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, @"audioRoutingRequestID");

  -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  self->_localDeviceAudioCatogory,  @"remotescore");
  if (v8)
  {
    if (self->_audioScoreOtherTipiDevice != (_DWORD)v10) {
      self->_uint64_t audioScoreOtherTipiDevice = v10;
    }
    if (dword_100234408 > 30) {
      goto LABEL_11;
    }
    uint64_t audioScoreOtherTipiDevice = v10;
    if (dword_100234408 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100234408, 30LL))
      {
LABEL_11:
        self->_autoRoutingTicks = mach_absolute_time();
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
        CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceVersion]);

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 otherTipiDeviceVersion]);
        [v19 doubleValue];
        unint64_t v20 = "yes";
        if (v21 >= 1.2 && [@"3E725" compare:v17 options:64] != (id)1) {
          unint64_t v20 = "no";
        }

        if (dword_100234408 <= 30)
        {
          if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
            double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 otherTipiDeviceVersion]);
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]",  30LL,  "Legacy routing behavior = %s %@ %@",  v20,  v23,  v17);
          }

          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]",  30LL,  "Hijacking passed for address %@",  v32);
          }
        }

        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v26, @"audioRoutingHijackAnswer");

        if (self->_score > 3 || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") >= 1)
        {
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
          [v27 routed];
        }

        -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:]( self,  "_setManualRouteFlag:withManualRoute:",  v32,  0LL);
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
        unsigned int v29 = [v28 routed];

        if (v29)
        {
          -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v14,  v32,  0LL);
          -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", v10);
          -[SmartRoutingStats setHijackAwayLocalScore:]( self->_stats,  "setHijackAwayLocalScore:",  -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue"));
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

          if (!v30) {
            -[SmartRoutingStats setFalseRouteCheckReason:]( self->_stats,  "setFalseRouteCheckReason:",  @"Hijacked_Away");
          }
          -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:]( self,  "submitRouteActivityMetric:activity:",  v32,  @"Hijack_Away");
          -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v32, 8LL);
        }

        else
        {
          id v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v32));
          [v31 routed];
        }

        goto LABEL_36;
      }

      uint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    }

    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]",  30LL,  "Allowed hijacking for address %@, now set ownership to false with score %u",  v32,  audioScoreOtherTipiDevice);
    goto LABEL_11;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackResponse:wxAddress:andAudioResponseID:andAllowedToHijack:withReason:]",  30LL,  "Hijacking is not allowed with address %@ with reason %@",  v32,  v12);
  }
  if ([v12 isEqual:@"LowerPriority"])
  {
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v24, @"audioRoutingHijackAnswer");

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v14,  v32,  0LL);
  }

  if ([v12 isEqual:@"AmbiguousPriority"])
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v25, @"audioRoutingHijackAnswer");

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v14,  v32,  0LL);
  }

- (void)_mediaRouteHijackWithAudioScore:(int)a3 wxAddress:(id)a4 andAudioResponseID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_100019A08;
  v39[4] = sub_100019A18;
  id v40 = 0LL;
  if (!v9)
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  90LL,  "No valid audioResponseID found");
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", 0LL, @"audioRoutingRequestID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, @"audioRoutingHijackAnswer");

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v12,  v8,  0LL);
    goto LABEL_28;
  }

  if (!v8)
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  90LL,  "No valid Wx address passed for hijacking request");
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, @"audioRoutingRequestID");
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v20, @"audioRoutingHijackAnswer");

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v12,  0LL,  0LL);
LABEL_28:

    goto LABEL_45;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceBTAddress]);

  if (v11)
  {
    if (dword_100234408 <= 50
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  50LL,  "Received request to hijack audio for Wx %@ audioID %@ and audioScore %u",  v8,  v9,  v6);
    }

    v37[0] = 0LL;
    v37[1] = v37;
    v37[2] = 0x2020000000LL;
    char v38 = 0;
    if (!self->_prefSmartRoutingBlockHijackWindowinSeconds) {
      goto LABEL_43;
    }
    unsigned int v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
    if (-[NSMutableDictionary hijackBackoffTicks](v14, "hijackBackoffTicks"))
    {
      BOOL hijackBackOffInitiator = self->_hijackBackOffInitiator;

      if (!hijackBackOffInitiator)
      {
LABEL_43:
        dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002D03C;
        block[3] = &unk_100206FD0;
        unsigned int v34 = v37;
        int v36 = v6;
        __int128 v35 = v39;
        id v31 = (NSMutableDictionary *)v8;
        id v32 = self;
        id v33 = v9;
        dispatch_async(dispatchQueueAVSys, block);

        unsigned int v14 = v31;
LABEL_44:

        _Block_object_dispose(v37, 8);
        goto LABEL_45;
      }

      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
      uint64_t v17 = -[BTSmartRoutingDaemon _checkTickswithinWindow:withWindow:]( self,  "_checkTickswithinWindow:withWindow:",  [v16 hijackBackoffTicks],  self->_prefSmartRoutingBlockHijackWindowinSeconds);

      unsigned int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (v17 >= 1)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          uint64_t v19 = UpTicksToSeconds(v17);
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  30LL,  "###Hijackblocking: Hijack request from remote, device %@ hijack block with %ll{dur} remaining with ticks %lld",  v8,  v19,  v17);
        }

        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v17));
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v26, @"hijackBackoffTicks");
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v9, @"audioRoutingRequestID");
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v27, @"audioRoutingHijackAnswer");

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v14,  v8,  0LL);
        goto LABEL_44;
      }

      if (v17 + SecondsToUpTicks(1LL, v18))
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          uint64_t v22 = SecondsToUpTicks(1LL, v21);
          uint64_t v23 = UpTicksToSeconds(v22 + v17);
          uint64_t v25 = SecondsToUpTicks(1LL, v24);
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  30LL,  "###Hijackblocking: Tick has exhausted but timer has not fired yet. Tick expires less than 1s, remaining %ll{ dur}, ticks %lld",  v23,  v25 + v17);
        }

        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v9, @"audioRoutingRequestID");
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v29, @"audioRoutingHijackAnswer");

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v14,  v8,  0LL);
        goto LABEL_44;
      }

      -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]( self,  "_hijackBackoffReset:withReason:",  v8,  @"tickerExhausted");
      if (dword_100234408 <= 90
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  90LL,  "###Hijackblocking: Tick has exhausted but timer has not fired yet. Tick expires more than 1s. Cancel hijackblocking");
      }
    }

    goto LABEL_43;
  }

  if (dword_100234408 <= 90 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]",  90LL,  "Wrong state please file radar under 'Smart Routing|All'. We are not in Tipi with Wx address %@",  v8);
  }
  if (!self->_tipiElectionInProgress) {
    -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
  }
LABEL_45:
  _Block_object_dispose(v39, 8);
}

- (void)_updateRoutingActionForManuallyRoute
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002D1B4;
  v3[3] = &unk_100206F58;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v3);
}

- (void)_nearbyInfoDiscoveryEnsureStarted
{
  if (!self->_nearbyInfoDiscovery)
  {
    p_nearbyInfoDiscovery = &self->_nearbyInfoDiscovery;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStarted]",  30LL,  "NearbyInfo discovery start");
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    objc_storeStrong((id *)p_nearbyInfoDiscovery, v4);
    -[SFDeviceDiscovery setChangeFlags:](v4, "setChangeFlags:", 9LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](v4, "setDiscoveryFlags:", 33LL);
    -[SFDeviceDiscovery setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v4, "setPurpose:", @"SmartRouting");
    -[SFDeviceDiscovery setScanRate:](v4, "setScanRate:", 20LL);
    id v5 = -[SFDeviceDiscovery setRssiThreshold:](v4, "setRssiThreshold:", -75LL);
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 16LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002D584;
    v13[3] = &unk_100206FF8;
    v13[4] = self;
    v13[5] = v4;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v4, "setDeviceFoundHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002D5A8;
    v12[3] = &unk_100206FF8;
    v12[4] = self;
    void v12[5] = v4;
    -[SFDeviceDiscovery setDeviceLostHandler:](v4, "setDeviceLostHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002D5CC;
    v11[3] = &unk_100207020;
    void v11[4] = self;
    v11[5] = v4;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v4, "setDeviceChangedHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002D5F0;
    v10[3] = &unk_100206380;
    void v10[4] = self;
    void v10[5] = v4;
    -[SFDeviceDiscovery activateWithCompletion:](v4, "activateWithCompletion:", v10);
    self->_prefSmartRoutingForcedDisconnectionTicks = mach_absolute_time();
    uint64_t v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    self->_prefSmartRoutingForcedDisconnectionStartTimer = v6;
    id v8 = v6;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002D6A4;
    v9[3] = &unk_100206358;
    v9[4] = v8;
    void v9[5] = self;
    dispatch_source_set_event_handler(v8, v9);
    CUDispatchTimerSet(v8, self->_prefSmartRoutingForcedDisconnectionStartSeconds + 1.0, -1.0, -10.0);
    dispatch_activate(v8);
    -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
  }

- (void)_nearbyInfoDiscoveryEnsureStopped
{
  if (self->_nearbyInfoDiscovery)
  {
    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 16LL);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDiscoveryEnsureStopped]",  30LL,  "NearbyInfo discovery stop");
    }

    -[SFDeviceDiscovery invalidate](self->_nearbyInfoDiscovery, "invalidate");
    nearbyInfoDiscovery = self->_nearbyInfoDiscovery;
    self->_nearbyInfoDiscovery = 0LL;

    self->_prefSmartRoutingForcedDisconnectionTicks = 0LL;
    if (self->_tipiElectionInProgress) {
      self->_tipiElectionInProgress = 0;
    }
    tipiHealingTimer = self->_tipiHealingTimer;
    if (tipiHealingTimer)
    {
      id v5 = tipiHealingTimer;
      dispatch_source_cancel(v5);
      uint64_t v6 = self->_tipiHealingTimer;
      self->_tipiHealingTimer = 0LL;
    }

    if (self->_prefSmartRoutingWatchTriangleMagnet)
    {
      nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      if (nearbyInfoDevicesTriangleRecoveryTimer)
      {
        id v8 = nearbyInfoDevicesTriangleRecoveryTimer;
        dispatch_source_cancel(v8);
        id v9 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
      }
    }

    prefSmartRoutingForcedDisconnectionStartTimer = self->_prefSmartRoutingForcedDisconnectionStartTimer;
    if (prefSmartRoutingForcedDisconnectionStartTimer)
    {
      uint64_t v11 = prefSmartRoutingForcedDisconnectionStartTimer;
      dispatch_source_cancel(v11);
      id v12 = self->_prefSmartRoutingForcedDisconnectionStartTimer;
      self->_prefSmartRoutingForcedDisconnectionStartTimer = 0LL;
    }

    nearbyInfoDevices = self->_nearbyInfoDevices;
    if (nearbyInfoDevices)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](nearbyInfoDevices, "allValues", 0LL));
      id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            -[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]( self,  "_nearbyInfoDeviceLost:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
          }

          id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v16);
      }

      uint64_t v19 = self->_nearbyInfoDevices;
      self->_nearbyInfoDevices = 0LL;
    }
  }

- (BOOL)_checkValidBatteryValue:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 batteryType] == (id)2
    || [v3 batteryType] == (id)3
    || [v3 batteryType] == (id)4;

  return v4;
}

- (BOOL)_isSmartRoutingCapableDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 model]);
  if (([v3 containsString:@"Mac"] & 1) != 0
    || ([v3 hasPrefix:@"iPhone"] & 1) != 0
    || ([v3 hasPrefix:@"iPad"] & 1) != 0
    || ([v3 hasPrefix:@"Watch"] & 1) != 0
    || ([v3 hasPrefix:@"iPod"] & 1) != 0)
  {
    BOOL v4 = 1;
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isSmartRoutingCapableDevice:]",  30LL,  "Device is %@, should not add to nearby device map",  v3);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)_checkTriangleRecovery
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  nearbyInfoDevices = self->_nearbyInfoDevices;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002DC24;
  v11[3] = &unk_100206A98;
  void v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v11);
  unsigned int v4 = -[BTSmartRoutingDaemon isInAnyTipi](self, "isInAnyTipi");
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    int v5 = *((unsigned __int8 *)v13 + 24);
    unsigned int v6 = -[BTSmartRoutingSourceDevice magnetConnected](self->_sourceDevice, "magnetConnected");
    int v7 = "yes";
    if (v5) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (v6) {
      id v9 = "yes";
    }
    else {
      id v9 = "no";
    }
    if (!v4) {
      int v7 = "no";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _checkTriangleRecovery]",  30LL,  "TriangleRecovery: SrDeviceNearby %s magnet %s inAnyTipi %s timeout %d",  v8,  v9,  v7,  self->_prefSmartRoutingWatchTriangleMagnet);
  }

  if (*((_BYTE *)v13 + 24)) {
    char v10 = 1;
  }
  else {
    char v10 = v4;
  }
  if ((v10 & 1) != 0 || !-[BTSmartRoutingSourceDevice magnetConnected](self->_sourceDevice, "magnetConnected")) {
    -[BTSmartRoutingDaemon _cancelTriangleRecoveryTimer](self, "_cancelTriangleRecoveryTimer");
  }
  else {
    -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_cancelTriangleRecoveryTimer
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _cancelTriangleRecoveryTimer]",  30LL,  "TriangleRecovery: cancel timer");
  }
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    int v5 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v5);
    unsigned int v4 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
  }

- (void)_nearbyInfoDeviceFound:(id)a3
{
  id v18 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    id v6 = [v18 audioRoutingScore];
    if (dword_100234408 <= 30)
    {
      id v7 = v6;
      if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v18 name]);
        id v9 = (void *)v8;
        else {
          char v10 = off_1002079F0[(int)v7];
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]",  30LL,  "NearbyInfo device found/updated: ID %@, Name '%@', audio score %d (%s)",  v5,  v8,  v7,  v10);
      }
    }

    id v11 = (id)-[BTSmartRoutingDaemon _isSmartRoutingCapableDevice:](self, "_isSmartRoutingCapableDevice:", v18);
    if ((_DWORD)v11)
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      if (!nearbyInfoDevices)
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v14 = self->_nearbyInfoDevices;
        self->_nearbyInfoDevices = v13;

        nearbyInfoDevices = self->_nearbyInfoDevices;
      }

      id v11 = -[NSMutableDictionary setObject:forKeyedSubscript:]( nearbyInfoDevices,  "setObject:forKeyedSubscript:",  v18,  v5);
    }

    if (GestaltGetDeviceClass(v11) == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        -[BTSmartRoutingDaemon _checkTriangleRecovery](self, "_checkTriangleRecovery");
      }

      else if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]",  30LL,  "Smart Routing starting timer for legacy triangle recovery.");
        }

        -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
      }

      else
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceFound:]",  30LL,  "Smart Routing cancelling legacy triangle recovery.");
        }

        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          id v16 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v16);
          uint64_t v17 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
        }
      }
    }

    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }
}

- (void)_nearbyInfoDeviceLost:(id)a3
{
  id v11 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 idsIdentifier]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]",  30LL,  "NearbyInfo device lost: ID %@, IDS %@, Name '%@'",  v5,  v6,  v7);
    }

    if (GestaltGetDeviceClass( -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_nearbyInfoDevices,  "setObject:forKeyedSubscript:",  0LL,  v5)) == 1)
    {
      if (self->_prefSmartRoutingWatchTriangleMagnet)
      {
        -[BTSmartRoutingDaemon _checkTriangleRecovery](self, "_checkTriangleRecovery");
      }

      else if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]",  30LL,  "Smart Routing starting timer for legacy triangle recovery.");
        }

        -[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer](self, "_nearbyDeviceInfoTriangleRecoveryTimer");
      }

      else
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoDeviceLost:]",  30LL,  "Smart Routing cancelling legacy triangle recovery.");
        }

        nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
        if (nearbyInfoDevicesTriangleRecoveryTimer)
        {
          id v9 = nearbyInfoDevicesTriangleRecoveryTimer;
          dispatch_source_cancel(v9);
          char v10 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
          self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
        }
      }
    }

    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }
}

- (void)_nearbyInfoSetAudioRoutingScore
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore]",  30LL,  "NearbyInfo set audio routing score: %d",  self->_score);
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___SFClient);
  if (-[CBDiscovery bluetoothState](self->_connectedDiscovery, "bluetoothState") == (id)5) {
    uint64_t score = self->_score;
  }
  else {
    uint64_t score = 0LL;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002E2E4;
  v5[3] = &unk_100206380;
  v5[4] = v3;
  v5[5] = self;
  -[SFClient setAudioRoutingScore:completion:](v3, "setAudioRoutingScore:completion:", score, v5);
  -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
}

- (void)_nearbyInfoActivityChanged
{
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  int v34 = 0;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t score = self->_score;
    else {
      unsigned int v4 = off_1002079F0[score];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]",  30LL,  "NearbyInfoActivityChanged: AL %d, current score is %d (%s)",  self->_activityLevel,  self->_score,  v4);
  }

  if (self->_activityLevelTicks)
  {
    uint64_t v5 = mach_absolute_time();
    unint64_t activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds + UpTicksToSeconds(v5 - self->_activityLevelTicks);
    self->_unint64_t activityLevelDeltaInSeconds = activityLevelDeltaInSeconds;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_12:
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoActivityChanged]",  30LL,  "NearbyInfoActivityChanged: activity evaluation ALDS %ll{dur}, AL %d",  activityLevelDeltaInSeconds,  self->_activityLevel);
        goto LABEL_14;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        unint64_t activityLevelDeltaInSeconds = self->_activityLevelDeltaInSeconds;
        goto LABEL_12;
      }
    }
  }

- (void)_nearbyInfoActivityCriticalStart
{
  p_activityCriticalTimer = &self->_activityCriticalTimer;
  unsigned int v4 = self->_activityCriticalTimer;
  if (v4)
  {
    uint64_t v5 = (dispatch_source_s *)v4;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoActivityCriticalStart]",  30LL,  "Activity critical timer extend: %d seconds",  5);
    }

    CUDispatchTimerSet(v5, 5.0, -1.0, -10.0);
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoActivityCriticalStart]",  30LL,  "Activity critical timer start: %d seconds",  5);
    }

    dispatch_source_t v6 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_activityCriticalTimer, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002EAD0;
    handler[3] = &unk_100206358;
    uint64_t v5 = v6;
    uint64_t v8 = v5;
    id v9 = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 5.0, -1.0, -10.0);
    dispatch_activate(v5);
  }
}

- (void)_pairedDeviceMonitorEnsureStarted
{
  if (!self->_pairedDiscovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStarted]",  30LL,  "Pairing Monitor Started.");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = v3;
    uint64_t v5 = v3;

    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setLabel:](v5, "setLabel:", @"SmartRouting");
    -[CBDiscovery setDiscoveryFlags:]( v5,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](v5, "discoveryFlags") | 0x80000800000LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002ED2C;
    v8[3] = &unk_100206330;
    v8[4] = self;
    void v8[5] = v5;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002EDCC;
    v7[3] = &unk_100206330;
    v7[4] = self;
    void v7[5] = v5;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10002EE6C;
    v6[3] = &unk_100206380;
    void v6[4] = self;
    void v6[5] = v5;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_pairedDeviceMonitorEnsureStopped
{
  if (self->_pairedDiscovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _pairedDeviceMonitorEnsureStopped]",  30LL,  "Pairing Monitor Ended.");
    }

    -[CBDiscovery invalidate](self->_pairedDiscovery, "invalidate");
    pairedDiscovery = self->_pairedDiscovery;
    self->_pairedDiscovery = 0LL;
  }

- (void)_nearbyInfoActivityDelayCheck:(unint64_t)a3
{
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000 * a3);
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyInfoActivityDelayCheck:]",  30LL,  "Check activity in %llus",  a3);
  }
  activityLevelDelayTimer = self->_activityLevelDelayTimer;
  if (activityLevelDelayTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)activityLevelDelayTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    unint64_t v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v8 = self->_activityLevelDelayTimer;
    self->_activityLevelDelayTimer = v7;

    id v9 = self->_activityLevelDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002F104;
    handler[3] = &unk_100206058;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_activityLevelDelayTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_activityLevelDelayTimer);
  }

- (void)_pipeEnsureStarted
{
  if (!self->_smartRoutingPipe)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingPipe);
    smartRoutingPipe = self->_smartRoutingPipe;
    self->_smartRoutingPipe = v3;

    -[BTSmartRoutingPipe _activateWithDispatch:]( self->_smartRoutingPipe,  "_activateWithDispatch:",  self->_dispatchQueue);
  }

- (void)_pipeEnsureStopped
{
  smartRoutingPipe = self->_smartRoutingPipe;
  if (smartRoutingPipe)
  {
    -[BTSmartRoutingPipe _invalidate](smartRoutingPipe, "_invalidate");
    unsigned int v4 = self->_smartRoutingPipe;
    self->_smartRoutingPipe = 0LL;
  }

- (void)_powerMonitorEnsureStarted
{
  if (!self->_powerMonitor)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _powerMonitorEnsureStarted]", 30LL, "Power monitor start");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = v3;
    dispatch_time_t v5 = v3;

    -[CUSystemMonitor setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002F424;
    v12[3] = &unk_100206358;
    v12[4] = v5;
    void v12[5] = self;
    dispatch_source_t v6 = objc_retainBlock(v12);
    -[CUSystemMonitor setScreenOnChangedHandler:](v5, "setScreenOnChangedHandler:", v6);
    -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v6);
    -[CUSystemMonitor setFirstUnlockHandler:](v5, "setFirstUnlockHandler:", v6);
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](v5, "setPrimaryAppleIDChangedHandler:", v6);
    -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v6);
    -[CUSystemMonitor setScreenSaverChangedHandler:](v5, "setScreenSaverChangedHandler:", v6);
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

  if (!self->_sleepWakeMonitor)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _powerMonitorEnsureStarted]",  30LL,  "sleep/wake monitor start");
    }

    unint64_t v7 = objc_alloc_init(&OBJC_CLASS___CUSleepWakeMonitor);
    sleepWakeMonitor = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = v7;
    id v9 = v7;

    -[CUSleepWakeMonitor setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
    -[CUSleepWakeMonitor setLabel:](v9, "setLabel:", @"SmartRouting");
    self->_sleeping = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002F774;
    v11[3] = &unk_100207098;
    void v11[4] = v9;
    void v11[5] = self;
    -[CUSleepWakeMonitor setSleepWakeHandler:](v9, "setSleepWakeHandler:", v11);
    -[CUSleepWakeMonitor activateWithCompletion:](v9, "activateWithCompletion:", 0LL);
  }

  if (!self->_pineBoardServiceMonitor)
  {
    self->_pineBoardServiceMonitor = 1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002F910;
    v10[3] = &unk_100206058;
    void v10[4] = self;
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  1LL,  1LL,  v10);
  }

- (void)_powerMonitorEnsureStopped
{
  if (self->_powerMonitor)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _powerMonitorEnsureStopped]", 30LL, "Power monitor stop");
    }

    -[CUSystemMonitor invalidate](self->_powerMonitor, "invalidate");
    powerMonitor = self->_powerMonitor;
    self->_powerMonitor = 0LL;
  }

  screenLockedLingerTimer = self->_screenLockedLingerTimer;
  if (screenLockedLingerTimer)
  {
    dispatch_time_t v5 = screenLockedLingerTimer;
    dispatch_source_cancel(v5);
    dispatch_source_t v6 = self->_screenLockedLingerTimer;
    self->_screenLockedLingerTimer = 0LL;
  }

  sleepWakeMonitor = self->_sleepWakeMonitor;
  if (sleepWakeMonitor)
  {
    -[CUSleepWakeMonitor invalidate](sleepWakeMonitor, "invalidate");
    uint64_t v8 = self->_sleepWakeMonitor;
    self->_sleepWakeMonitor = 0LL;

    self->_sleeping = 0;
    self->_int sleepWakeState = 0;
  }

- (void)_powerMonitorScreenLockChanged
{
  if (self->_powerMonitor)
  {
    screenLockedLingerTimer = self->_screenLockedLingerTimer;
    if (self->_effectiveScreenLocked)
    {
      if (!screenLockedLingerTimer)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _powerMonitorScreenLockChanged]",  30LL,  "Screen locked linger timer start: %d seconds",  60);
        }

        dispatch_time_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        dispatch_source_t v6 = self->_screenLockedLingerTimer;
        self->_screenLockedLingerTimer = v5;
        unsigned int v4 = v5;

        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_10002FD68;
        handler[3] = &unk_100206058;
        void handler[4] = self;
        dispatch_source_set_event_handler(v4, handler);
        CUDispatchTimerSet(v4, 60.0, -1.0, 1.0);
        dispatch_activate(v4);
LABEL_17:
      }
    }

    else if (screenLockedLingerTimer)
    {
      if (dword_100234408 >= 31)
      {
        unsigned int v4 = screenLockedLingerTimer;
      }

      else
      {
        if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)) {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _powerMonitorScreenLockChanged]",  30LL,  "Screen locked linger timer stop on screen unlock");
        }
        unsigned int v4 = self->_screenLockedLingerTimer;
        if (!v4) {
          goto LABEL_18;
        }
      }

      dispatch_source_cancel(v4);
      unint64_t v7 = self->_screenLockedLingerTimer;
      self->_screenLockedLingerTimer = 0LL;

      goto LABEL_17;
    }

- (void)_relayConduitMessageEnsureStarted
{
  id v3 = self->_smartRoutingController;
  if (!v3)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v3);
    -[CBController setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
  }

  if (!self->_relayConduitMessageEnsureStarted)
  {
    self->_relayConduitMessageEnsureStarted = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002FFA0;
    v9[3] = &unk_1002070C0;
    v9[4] = self;
    -[CBController setRelayMessageHandler:](v3, "setRelayMessageHandler:", v9);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageEnsureStarted]",  30LL,  "Listening for relay/Tipi update message");
    }

    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100030098;
    v8[3] = &unk_100206F58;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000300A4;
    v7[3] = &unk_100206E70;
    v7[4] = self;
    -[CBController setTipiChangedHandler:](v3, "setTipiChangedHandler:", v7);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000308E0;
    v5[3] = &unk_100206080;
    dispatch_source_t v6 = v3;
    -[CBController activateWithCompletion:](v6, "activateWithCompletion:", v5);
  }
}

- (void)_relayConduitMessageEnsureStopped
{
  self->_relayConduitMessageEnsureStarted = 0;
}

- (void)_relayConduitMessageSend:(unsigned __int8)a3 withOptions:(id)a4 andWxAddress:(id)a5 andOtherAddress:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_smartRoutingController)
  {
    unsigned int v34 = 0;
    int v13 = (void *)OPACKEncoderCreateData(v10, 0LL, &v34);
    uint64_t v14 = v34;
    if (!v34)
    {
      uint64_t v28 = 0LL;
      unsigned int v29 = &v28;
      uint64_t v30 = 0x3032000000LL;
      uint64_t v31 = sub_100019A08;
      id v32 = sub_100019A18;
      id v33 = 0LL;
      uint64_t v22 = 0LL;
      __int128 v23 = &v22;
      uint64_t v24 = 0x3032000000LL;
      uint64_t v25 = sub_100019A08;
      unint64_t v26 = sub_100019A18;
      id v27 = 0LL;
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100030D68;
      v16[3] = &unk_1002070E8;
      id v17 = v11;
      int v20 = &v22;
      uint64_t v21 = &v28;
      id v18 = v12;
      id v19 = v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v16);
      if (v23[5])
      {
        if (v29[5])
        {
          -[CBController sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:]( self->_smartRoutingController,  "sendRelayMessageType:messageData:conduitDevice:destinationDevice:completionHandler:",  v8,  v13);
        }

        else if (dword_100234408 <= 90 {
               && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
        }
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]",  90LL,  "Other tipi device address not found");
        }
      }

      else if (dword_100234408 <= 90 {
             && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      }
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]",  90LL,  "Wx headset not found not able to relay the message");
      }

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);

      goto LABEL_27;
    }

    if (dword_100234408 <= 90)
    {
      if (dword_100234408 == -1)
      {
        uint64_t v14 = v34;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]",  90LL,  "Error %@ encoding options into relay message",  v14);
    }

- (void)_relayConduitMessageReceived:(id)a3 andSourceDevice:(id)a4 messageType:(unsigned __int8)a5 messageData:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30LL,  "Received message: %@",  v12);
  }
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 btAddressData]);
  uint64_t v14 = CUPrintNSDataAddress();
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    if (v7)
    {
      if (v7 == 1)
      {
        BOOL v104 = (void *)OPACKDecodeData(v12, 0LL, &v122);
        if (v122)
        {
          if (dword_100234408 > 90
            || dword_100234408 == -1 && !_LogCategory_Initialize(&dword_100234408, 90LL))
          {
            goto LABEL_59;
          }

          uint64_t v16 = CUPrintErrorCode();
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  90LL,  "Unable to decode relay message with %@",  v17);
LABEL_12:

LABEL_59:
          goto LABEL_60;
        }

        if (!v104) {
          goto LABEL_59;
        }
        if (dword_100234408 <= 40
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 40LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  40LL,  "Receive relay message with dictionary %@",  v104);
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingHijackRequest"]);
        BOOL v19 = v18 == 0LL;

        if (!v19)
        {
          int v20 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingScore"]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingRequestID"]);
          if (dword_100234408 <= 40
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 40LL)))
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 otherTipiDeviceBTAddress]);
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  40,  "Received Hijack request from %@ audioScore %u",  v23,  [v20 intValue]);
          }

          -[BTSmartRoutingDaemon _mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:]( self,  "_mediaRouteHijackWithAudioScore:wxAddress:andAudioResponseID:",  [v20 intValue],  v15,  v21);

          goto LABEL_52;
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingHijackAnswer"]);
        BOOL v25 = v24 == 0LL;

        if (!v25)
        {
          if (dword_100234408 <= 40
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 40LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  40LL,  "SmartRoutingKeyAudioHijackAnswer");
          }

          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"remotescore"]);
          -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", 0xFFFFFFFFLL);
          if (v30) {
            -[SmartRoutingStats setHijackActiveRemoteScore:]( self->_stats,  "setHijackActiveRemoteScore:",  [v30 intValue]);
          }
          -[BTSmartRoutingDaemon _setHighPriorityTag:withHighPriority:]( self,  "_setHighPriorityTag:withHighPriority:",  v15,  0LL);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingRequestID"]);
          smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
          v117[0] = _NSConcreteStackBlock;
          v117[1] = 3221225472LL;
          v117[2] = sub_100031E90;
          v117[3] = &unk_100207130;
          id v118 = v15;
          unsigned int v119 = v31;
          id v120 = v104;
          v121 = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v117);

          goto LABEL_52;
        }

        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"callState"]);
        BOOL v27 = v26 == 0LL;

        if (!v27)
        {
LABEL_52:
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"hijackBackoffTicks"]);
          BOOL v34 = v33 == 0LL;

          if (v34) {
            goto LABEL_59;
          }
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"hijackBackoffTicks"]);
          id v17 = v35;
          if (self->_prefSmartRoutingBlockHijackWindowinSeconds && v35)
          {
            if ([v35 unsignedLongLongValue])
            {
              int v36 = (char *)[v17 unsignedLongLongValue];
              __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
              uint64_t v38 = mach_absolute_time();
              objc_msgSend( v37,  "_setHijackBackoffTick:",  &v36[v38 - SecondsToUpTicks(self->_prefSmartRoutingBlockHijackWindowinSeconds, v39)]);

              if (dword_100234408 <= 30
                && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
              {
                uint64_t v40 = UpTicksToSeconds(v36);
                uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30,  "Hijackblocking: Relay message from remote updates hijack blocking ticks, device %@ hijack block with % ll{dur} remaining, last ticks %llu",  v15,  v40,  [v41 hijackBackoffTicks]);
              }
            }

            else
            {
              if (dword_100234408 <= 30
                && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
              {
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30LL,  "Hijackblocking: Clear Block ticks because remaining timer is zero");
              }

              id v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
              id v43 = [v42 hijackBackoffTicks];

              if (v43) {
                -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]( self,  "_hijackBackoffReset:withReason:",  v15,  @"relayTimerZero");
              }
            }
          }

          goto LABEL_12;
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"audioRoutingSetOwnershipToFalse"]);
        BOOL v29 = v28 == 0LL;

        if (!v29)
        {
          -[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]( self,  "_receivedRelinquishOwnership:wxAddress:",  v104,  v15);
          goto LABEL_52;
        }

        BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"tipiHealingAttempt"]);
        BOOL v45 = v44 == 0LL;

        if (!v45)
        {
          CFTypeID TypeID = CFStringGetTypeID();
          uint64_t TypedValue = CFDictionaryGetTypedValue(v104, @"tipiHealingStreaming", TypeID, 0LL);
          id v97 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          CFTypeID v48 = CFStringGetTypeID();
          uint64_t v49 = CFDictionaryGetTypedValue(v104, @"tipiHealingPreferMac", v48, 0LL);
          __int128 v96 = (void *)objc_claimAutoreleasedReturnValue(v49);
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30LL,  "Tipi healing attempt from remote side, send an ACK. otherSideHasRoute %@ allowPreferOnMac %@",  v97,  v96);
          }

          CFTypeID v55 = CFStringGetTypeID();
          uint64_t v56 = CFDictionaryGetTypedValue(v104, @"tipiHealingAttempt", v55, 0LL);
          id v102 = (void *)objc_claimAutoreleasedReturnValue(v56);
          CFTypeID v57 = CFStringGetTypeID();
          uint64_t v58 = CFDictionaryGetTypedValue(v104, @"tipiHealingName", v57, 0LL);
          BOOL v100 = (void *)objc_claimAutoreleasedReturnValue(v58);
          uint64_t NSNumber = NSDictionaryGetNSNumber(v104, @"version", 0LL);
          int v98 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
          BOOL v60 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
          [v60 _setOtherTipiDeviceInfo:v102 andName:v100 andVersion:v98];

          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
          [v61 _setRoutingInitialized:1];

          if (self->_activityLevelMediaPlaying)
          {
            char v62 = @"YES";
          }

          else
          {
            char v62 = @"YES";
            if ((int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") <= 0
              && !-[NSString isEqualToString:](self->_cdDeviceIdentifier, "isEqualToString:", v15))
            {
              char v62 = @"NO";
            }
          }

          v123[0] = @"tipiHealingAck";
          uint64_t v63 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
          unsigned int v64 = (void *)v63;
          id v65 = &stru_100212678;
          if (v63) {
            id v65 = (const __CFString *)v63;
          }
          myModel = self->_myModel;
          v124[0] = v65;
          v124[1] = myModel;
          v123[1] = @"tipiHealingName";
          v123[2] = @"version";
          v123[3] = @"tipiHealingStreaming";
          v124[2] = &off_100218938;
          v124[3] = v62;
          v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v124,  v123,  4LL));

          -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v67,  v15,  0LL);
          self->_tipiElectionInProgress = 0;
          unsigned __int8 v68 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
          int v69 = (void *)objc_claimAutoreleasedReturnValue([v68 otherTipiDeviceBTAddress]);

          -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v15,  v69,  0LL,  1LL);
          uint64_t v113 = 0LL;
          int v114 = &v113;
          uint64_t v115 = 0x2020000000LL;
          char v116 = 0;
          v70 = self->_smartRoutingWxDeviceMap;
          v109[0] = _NSConcreteStackBlock;
          v109[1] = 3221225472LL;
          v109[2] = sub_1000323B0;
          v109[3] = &unk_100207158;
          id v110 = v15;
          int v111 = self;
          int v112 = &v113;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v70, "enumerateKeysAndObjectsUsingBlock:", v109);
          if (*((_BYTE *)v114 + 24)) {
            -[BTSmartRoutingDaemon _postNotification:]( self,  "_postNotification:",  "com.apple.BluetoothServices.AudioRoutingChanged");
          }

          _Block_object_dispose(&v113, 8);
          goto LABEL_52;
        }

        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"tipiHealingAck"]);
        if (!v50
          || (uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15)),  v52 = [v51 isTipiHealingV2Eligible],  v51,  v50,  (v52 & 1) != 0))
        {
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"nearbyAudioScore"]);
          BOOL v54 = v53 == 0LL;

          if (v54)
          {
            BOOL v80 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"otherDeviceAudioCategory"]);
            BOOL v81 = v80 == 0LL;

            if (v81)
            {
              id v82 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"disableSmartRouting"]);
              BOOL v83 = v82 == 0LL;

              if (!v83)
              {
                if (dword_100234408 <= 30
                  && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
                {
                  LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30LL,  "Other Tipi device disabled SR, disconnect it since I'm routed");
                }

                -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v15);
              }
            }

            else
            {
              -[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]( self,  "_receivedAudioCategory:withOptions:",  v15,  v104);
            }
          }

          else
          {
            -[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]( self,  "_otherTipiDeviceTipiScoreChanged:withOptions:",  v15,  v104);
          }

          goto LABEL_52;
        }

        double v71 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
        CFTypeID v72 = CFStringGetTypeID();
        uint64_t v73 = CFDictionaryGetTypedValue(v104, @"tipiHealingAck", v72, 0LL);
        int v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        CFTypeID v75 = CFStringGetTypeID();
        uint64_t v76 = CFDictionaryGetTypedValue(v104, @"tipiHealingName", v75, 0LL);
        uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(v76);
        uint64_t v77 = NSDictionaryGetNSNumber(v104, @"version", 0LL);
        unsigned int v101 = (void *)objc_claimAutoreleasedReturnValue(v77);
        [v71 _setOtherTipiDeviceInfo:v74 andName:v103 andVersion:v101];
        CFTypeID v78 = CFStringGetTypeID();
        uint64_t v79 = CFDictionaryGetTypedValue(v104, @"tipiHealingStreaming", v78, 0LL);
        BOOL v99 = (void *)objc_claimAutoreleasedReturnValue(v79);
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  30LL,  "Tipi healing attempt succeeded! Booyaaa!!! otherSideRoute %@",  v99);
        }

        [v71 _setRoutingInitialized:1];
        BOOL v84 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxStatsMap,  "objectForKeyedSubscript:",  v15));

        if (v84)
        {
          uint64_t v85 = mach_absolute_time();
          unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxStatsMap,  "objectForKeyedSubscript:",  v15));
          double v87 = UpTicksToSecondsF(v85 - (void)[v86 thV2Ticks]);

          -[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]( self,  "_submitMetricTipiHealingforDevice:withDuration:andLegacy:",  v71,  1LL,  v87);
        }

        self->_tipiElectionInProgress = 0;
        -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v15,  v74,  0LL,  1LL);
        tipiHealingTimer = self->_tipiHealingTimer;
        if (tipiHealingTimer)
        {
          BOOL v89 = tipiHealingTimer;
          dispatch_source_cancel(v89);
          BOOL v90 = self->_tipiHealingTimer;
          self->_tipiHealingTimer = 0LL;
        }

        uint64_t v113 = 0LL;
        int v114 = &v113;
        uint64_t v115 = 0x2020000000LL;
        char v116 = 0;
        id v91 = (void *)objc_claimAutoreleasedReturnValue([v71 otherTipiDeviceVersion]);
        [v91 doubleValue];
        if (v92 < 1.2)
        {
        }

        else
        {
          uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue([v71 otherTipiDeviceVersion]);
          BOOL v94 = v93 == 0LL;

          if (!v94)
          {
LABEL_111:
            if (*((_BYTE *)v114 + 24)) {
              -[BTSmartRoutingDaemon _postNotification:]( self,  "_postNotification:",  "com.apple.BluetoothServices.AudioRoutingChanged");
            }
            _Block_object_dispose(&v113, 8);

            goto LABEL_52;
          }
        }

        if (dword_100234408 <= 40
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 40LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  40LL,  "Tipi healing legacy behavior");
        }

        int v95 = self->_smartRoutingWxDeviceMap;
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472LL;
        v105[2] = sub_1000324F4;
        v105[3] = &unk_100207158;
        id v106 = v15;
        unsigned int v107 = self;
        uint64_t v108 = &v113;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v95, "enumerateKeysAndObjectsUsingBlock:", v105);

        goto LABEL_111;
      }

      if (dword_100234408 <= 90
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  90LL,  "Received unknown value for relay message type");
      }
    }

    else if (dword_100234408 <= 90 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  90LL,  "Received CBRelayMessageTypeInvalid");
    }
  }

  else if (dword_100234408 <= 90 {
         && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  }
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _relayConduitMessageReceived:andSourceDevice:messageType:messageData:]",  90LL,  "ConduitID passed does not match any connected Wx.");
  }

- (BOOL)_shouldDelayRouteToSpeaker:(id)a3
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  id v5 = a3;
  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v5));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v5));

  if (dword_100234408 <= 90 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  {
    unsigned int v8 = [v6 audioRoutingScore];
    unsigned int v9 = [v6 otherTipiAudioCategory];
    unsigned int v10 = [v7 audioStreamState];
    if (v10 > 3) {
      id v11 = "?";
    }
    else {
      id v11 = off_100207B40[v10];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _shouldDelayRouteToSpeaker:]",  90LL,  "Checking delay speaker route routingScore %d remoteScore %d WxSt %s",  v8,  v9,  v11);
  }

  BOOL v12 = [v6 audioRoutingScore] == 201
     && [v6 otherTipiAudioCategory] != 501

  return v12;
}

- (void)_updateAccessoryID:(id)a3 connectionDeviceAddresses:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = self->_smartRoutingController;
  if (!v9)
  {
    unsigned int v9 = objc_alloc_init(&OBJC_CLASS___CBController);
    objc_storeStrong((id *)&self->_smartRoutingController, v9);
    -[CBController setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100032920;
  v10[3] = &unk_100206080;
  void v10[4] = self;
  -[CBController modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:]( v9,  "modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:",  v7,  v8,  v10,  4.0);
}

- (void)_updateNearbyDeviceState:(id)a3 withAddress:(id)a4 withEasyPairing:(BOOL)a5 withState:(int)a6
{
  BOOL v7 = a5;
  id v18 = (__CFString *)a3;
  unsigned int v10 = (__CFString *)a4;
  id v11 = v10;
  if (a6 == 3)
  {

    id v11 = @"FF:FF:FF:FF:FF:FF";
  }

  if (v18 && v11)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      else {
        BOOL v12 = off_1002076A0[a6];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]",  30LL,  "NearbyDevice State updated to %s with Wx address %@ and nearbyAddress %@",  v12,  v18,  v11);
    }

    BOOL v15 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    -[CBDevice setIdentifier:](v15, "setIdentifier:", v18);
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    -[CBDevice setIdentifier:](v16, "setIdentifier:", v11);
    if (v7) {
      uint64_t v17 = 0LL;
    }
    else {
      uint64_t v17 = 16LL;
    }
    -[CBController modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:]( self->_smartRoutingController,  "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:",  v15,  v16,  (char)a6,  v17,  &stru_100207178);
  }

  else if (dword_100234408 <= 90 {
         && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  }
  {
    int v13 = &stru_100212678;
    if (v18) {
      uint64_t v14 = v18;
    }
    else {
      uint64_t v14 = &stru_100212678;
    }
    if (v11) {
      int v13 = v11;
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]",  90LL,  "NearbyDevice State update failed wxAddress %@ nearbyAddress %@",  v14,  v13);
  }
}

- (void)_wxDeviceFoundforTVOS:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 bluetoothAddress]);

    CFTypeID v57 = (void *)v8;
    uint64_t v9 = CUPrintNSDataAddress(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    uint64_t v68 = 0LL;
    int v69 = &v68;
    uint64_t v70 = 0x2020000000LL;
    int v71 = 1;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100033890;
    v64[3] = &unk_1002071A0;
    v67 = &v68;
    v64[4] = self;
    uint64_t v58 = v6;
    id v56 = v6;
    id v65 = v56;
    uint64_t v66 = v10;
    char v62 = (void *)v10;
    unsigned int v59 = objc_retainBlock(v64);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]", 30LL, "Wx Device found: %@", v11);
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 advertisementFields]);

    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v13, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL);
    unsigned int v55 = CFDictionaryGetInt64Ranged(v13, @"aState", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
    uint64_t v60 = CFDictionaryGetInt64Ranged(v13, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t v15 = CFDictionaryGetInt64Ranged(v13, @"asCount", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v13, @"lch", 3LL, 0LL);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    char v17 = CFDictionaryGetInt64Ranged(v13, @"srAudioRoutingScore1", 0LL, 255LL, 0LL);
    char v18 = CFDictionaryGetInt64Ranged(v13, @"srAudioRoutingScore2", 0LL, 255LL, 0LL);
    unsigned __int8 v19 = CFDictionaryGetInt64Ranged(v13, @"audioIdleTime", 0LL, 255LL, 0LL);
    uint64_t v63 = v4;
    unsigned __int8 v20 = CFDictionaryGetInt64Ranged(v13, @"budsOutofCaseTime", 0LL, 255LL, 0LL);
    uint64_t Int64 = CFDictionaryGetInt64(v13, @"primaryiCloudSignIn", 0LL);
    if (dword_100234408 <= 30)
    {
      uint64_t v22 = Int64;
      if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
        uint64_t v24 = @"Primary";
        if ((Int64Ranged & 0x100) == 0) {
          uint64_t v24 = @"Secondary";
        }
        BOOL v25 = @"Right";
        if ((Int64Ranged & 0x80) != 0) {
          BOOL v25 = @"Left";
        }
        if (v55 >> 2) {
          unint64_t v26 = "?";
        }
        else {
          unint64_t v26 = off_100207970[v55];
        }
        if ((v17 & 0xF0) != 0) {
          BOOL v27 = "?";
        }
        else {
          BOOL v27 = off_1002079F0[v17];
        }
        if ((v18 & 0xF0) != 0) {
          uint64_t v28 = "?";
        }
        else {
          uint64_t v28 = off_1002079F0[v18];
        }
        BOOL v29 = @"YES";
        if (!v22) {
          BOOL v29 = @"NO";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Wx Device found/updated: %@, headphone Status 0x%0X, bud is %@/%@, source device count: %u audio state: %s las tConnect: %@, tipiScore1: %s, tipiScore2: %s, idle time: %d, outofCaseTime %d, icloud Signed in %@",  v23,  Int64Ranged,  v24,  v25,  v15,  v26,  v61,  v27,  v28,  v19,  v20,  v29);
      }
    }

    int v30 = CFDictionaryGetInt64Ranged(v13, @"paired", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t v31 = CFDictionaryGetInt64Ranged(v13, @"CnSv", 0LL, 0xFFFFFFFFLL, 0LL);
    if (v30 && v31)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 deviceManager]);
      [v33 deviceConnectedWithAddress:v62];

LABEL_29:
      if (dword_100234408 > 30
        || dword_100234408 == -1 && !_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        goto LABEL_80;
      }

      BOOL v34 = "Ignoring devices that is not paired or already connected: %@";
      goto LABEL_32;
    }

    if (v31 || !v30) {
      goto LABEL_29;
    }
    if (!-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v60)) {
      goto LABEL_44;
    }
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Current headset status is %u",  Int64Ranged);
    }

    if ((Int64Ranged & 0x400) == 0)
    {
LABEL_44:
      if ((Int64Ranged & 0x24) != 0
        || -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v60))
      {
        if (!v55)
        {
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v63 bleDevice]);
          id v36 = [v35 rssi];

          if ((v36 & 0x80000000) == 0)
          {
            if (dword_100234408 <= 30
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
            {
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Ignoring invalid RSSI: %d, %@",  v36,  v63);
            }

            goto LABEL_80;
          }

          if (v36 <= 0xFFFFFFBA)
          {
            if (dword_100234408 <= 30
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
            {
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Ignoring Devices not close enough. RSSI: %d < %d, %@",  v36,  4294967226LL,  v63);
            }

            goto LABEL_80;
          }

          wxDevices = self->_wxDevices;
          if (!wxDevices)
          {
            uint64_t v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            uint64_t v39 = self->_wxDevices;
            self->_wxDevices = v38;

            wxDevices = self->_wxDevices;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](wxDevices, "setObject:forKeyedSubscript:", v63, v56);
          routeIndicationQualifiedTickMap = self->_routeIndicationQualifiedTickMap;
          if (!routeIndicationQualifiedTickMap)
          {
            uint64_t v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v42 = self->_routeIndicationQualifiedTickMap;
            self->_routeIndicationQualifiedTickMap = v41;

            routeIndicationQualifiedTickMap = self->_routeIndicationQualifiedTickMap;
          }

          id v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( routeIndicationQualifiedTickMap,  "objectForKeyedSubscript:",  v56));

          if (!v43)
          {
            BOOL v44 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
            BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_routeIndicationQualifiedTickMap,  "setObject:forKeyedSubscript:",  v45,  v56);
          }

          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            double v46 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_routeIndicationBackOffMap,  "objectForKeyedSubscript:",  v62));
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Evaluator: current device %@ with timestamp %@ seconds between banner %d s",  v62,  v46,  (int)self->_secondsBetweenConnectBanner);
          }

          routeIndicationBackOffMap = self->_routeIndicationBackOffMap;
          if (!routeIndicationBackOffMap)
          {
            CFTypeID v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            uint64_t v49 = self->_routeIndicationBackOffMap;
            self->_routeIndicationBackOffMap = v48;

            routeIndicationBackOffMap = self->_routeIndicationBackOffMap;
          }

          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( routeIndicationBackOffMap,  "objectForKeyedSubscript:",  v62));

          if (v50)
          {
            uint64_t v51 = mach_absolute_time();
            unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_routeIndicationBackOffMap,  "objectForKeyedSubscript:",  v62));
            unint64_t v53 = UpTicksToSeconds(v51 - (void)[v52 unsignedLongLongValue]);

            if (!-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v60))
            {
              double secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
              if (secondsBetweenConnectBanner > (double)v53)
              {
                if (dword_100234408 <= 30)
                {
                  if (dword_100234408 == -1)
                  {
                    double secondsBetweenConnectBanner = self->_secondsBetweenConnectBanner;
                  }

                  LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFoundforTVOS:]",  30LL,  "Evaluator: skip, too soon, %ll{dur} remaining",  (int)secondsBetweenConnectBanner - v53);
                }

- (void)_wxDiscoveryEnsureStarted
{
  wxDiscovery = self->_wxDiscovery;
  if (wxDiscovery)
  {
    if (self->_prefSmartRoutingEnabledPhase3)
    {
      BOOL v4 = GestaltGetDeviceClass(wxDiscovery) != 6;
    }

    else
    {
      BOOL v4 = 0LL;
    }

    -[SFDeviceDiscovery setOverrideScreenOff:](self->_wxDiscovery, "setOverrideScreenOff:", v4);
    return;
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
  -[SFDeviceDiscovery setChangeFlags:](v5, "setChangeFlags:", 9LL);
  -[SFDeviceDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", 2LL);
  -[SFDeviceDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setPurpose:](v5, "setPurpose:", @"SmartRouting");
  -[SFDeviceDiscovery setScanRate:](v5, "setScanRate:", 20LL);
  if (self->_prefSmartRoutingEnabledPhase3) {
    -[SFDeviceDiscovery setOverrideScreenOff:](v5, "setOverrideScreenOff:", 1LL);
  }
  dispatch_source_t v6 = self->_wxDiscovery;
  self->_wxDiscovery = v5;
  BOOL v7 = v5;

  -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 7LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100033CC4;
  v12[3] = &unk_100206FF8;
  v12[4] = self;
  void v12[5] = v7;
  -[SFDeviceDiscovery setDeviceFoundHandler:](v7, "setDeviceFoundHandler:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100033CE8;
  v11[3] = &unk_100206FF8;
  void v11[4] = self;
  void v11[5] = v7;
  -[SFDeviceDiscovery setDeviceLostHandler:](v7, "setDeviceLostHandler:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100033D50;
  v10[3] = &unk_100207020;
  void v10[4] = self;
  void v10[5] = v7;
  -[SFDeviceDiscovery setDeviceChangedHandler:](v7, "setDeviceChangedHandler:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100033D74;
  v9[3] = &unk_100206358;
  v9[4] = self;
  void v9[5] = v7;
  -[SFDeviceDiscovery setInvalidationHandler:](v7, "setInvalidationHandler:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100033D90;
  v8[3] = &unk_100206380;
  v8[4] = self;
  void v8[5] = v7;
  -[SFDeviceDiscovery activateWithCompletion:](v7, "activateWithCompletion:", v8);
}

- (void)_wxDiscoveryEnsureStopped
{
  if (self->_wxDiscovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _wxDiscoveryEnsureStopped]", 30LL, "Wx discovery stop");
    }

    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 7LL);
    -[SFDeviceDiscovery invalidate](self->_wxDiscovery, "invalidate");
    wxDiscovery = self->_wxDiscovery;
    self->_wxDiscovery = 0LL;

    wxDevices = self->_wxDevices;
    if (wxDevices)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](wxDevices, "allValues", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
            -[BTSmartRoutingDaemon _wxDeviceLost:]( self,  "_wxDeviceLost:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i));
          }

          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v7);
      }

      uint64_t v10 = self->_wxDevices;
      self->_wxDevices = 0LL;
    }

    -[NSMutableDictionary removeAllObjects](self->_lowBatteryWxDevices, "removeAllObjects");
    lowBatteryWxDevices = self->_lowBatteryWxDevices;
    self->_lowBatteryWxDevices = 0LL;
  }

- (void)_wxDeviceFound:(id)a3
{
  id v101 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v101 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    if (!self->_wxDevices)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      wxDevices = self->_wxDevices;
      self->_wxDevices = v6;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v101 bleDevice]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 advertisementFields]);
    if (!CFDictionaryGetInt64(v9, @"paired", 0LL)) {
      goto LABEL_153;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v9, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t v94 = CFDictionaryGetInt64Ranged(v9, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v9, @"publicAddress", 6LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    __int128 v96 = v11;
    id v97 = v8;
    if (v11)
    {
      uint64_t v12 = NSPrintF("%.6a", COERCE_DOUBLE([v11 bytes]));
      id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    }

    else
    {
      id v13 = 0LL;
    }

    uint64_t v95 = CFDictionaryGetInt64Ranged(v9, @"asCount", 0LL, 0xFFFFFFFFLL, 0LL);
    unsigned int v14 = CFDictionaryGetInt64Ranged(v9, @"aState", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
    uint64_t v15 = CFDictionaryGetCFDataOfLength(v9, @"lch", 3LL, 0LL);
    int v98 = (void *)objc_claimAutoreleasedReturnValue(v15);
    char v16 = CFDictionaryGetInt64Ranged(v9, @"srAudioRoutingScore1", 0LL, 255LL, 0LL);
    char v17 = CFDictionaryGetInt64Ranged(v9, @"srAudioRoutingScore2", 0LL, 255LL, 0LL);
    unsigned __int8 v18 = CFDictionaryGetInt64Ranged(v9, @"audioIdleTime", 0LL, 255LL, 0LL);
    char v19 = CFDictionaryGetInt64Ranged(v9, @"budsOutofCaseTime", 0LL, 255LL, 0LL);
    uint64_t Int64 = CFDictionaryGetInt64(v9, @"primaryiCloudSignIn", 0LL);
    if (dword_100234408 <= 30)
    {
      uint64_t v21 = Int64;
      if (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))
      {
        uint64_t v93 = v5;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v101 bleDevice]);
        __int128 v23 = @"Primary";
        if ((Int64Ranged & 0x100) == 0) {
          __int128 v23 = @"Secondary";
        }
        uint64_t v24 = @"Right";
        if ((Int64Ranged & 0x80) != 0) {
          uint64_t v24 = @"Left";
        }
        if (v14 >> 2) {
          BOOL v25 = "?";
        }
        else {
          BOOL v25 = off_100207970[v14];
        }
        if ((v16 & 0xF0) != 0) {
          unint64_t v26 = "?";
        }
        else {
          unint64_t v26 = off_1002079F0[v16];
        }
        if ((v17 & 0xF0) != 0) {
          BOOL v27 = "?";
        }
        else {
          BOOL v27 = off_1002079F0[v17];
        }
        if ((v19 & 0xFC) != 0) {
          uint64_t v28 = "?";
        }
        else {
          uint64_t v28 = off_1002076C0[v19];
        }
        BOOL v29 = @"YES";
        if (!v21) {
          BOOL v29 = @"NO";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFound:]",  30LL,  "Wx Device found/updated: %@, headphone Status 0x%0X, bud is %@/%@, source device count: %u audio state: %s las tConnect: %@, tipiScore1: %s, tipiScore2: %s, idle time: %d, outofCaseTime %s, icloud Signed in %@",  v22,  Int64Ranged,  v23,  v24,  v95,  v25,  v98,  v26,  v27,  v18,  v28,  v29);

        id v5 = v93;
      }
    }

    -[BTSmartRoutingDaemon _nearbyWxChanged:](self, "_nearbyWxChanged:", v101);
    -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:]( self,  "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:",  v101,  1LL);
    if (v13)
    {
      int v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));

      if (v30)
      {
        -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](self, "_lowestBatteryInfoForSFDevice:", v101);
        double v32 = v31;
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFound:]",  30LL,  "_wxDeviceFound, Adding battery info to SR map, Address %@ batteryLevel: %f",  v13,  *(void *)&v32);
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
        [v33 setLowestBudBatteryInfo:v32];
      }
    }

    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v5));
    __int128 v35 = v34;
    if (!v13 || !v34)
    {

      if (!v13) {
        goto LABEL_63;
      }
      goto LABEL_53;
    }

    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:", v13));
    if (v36)
    {
      __int128 v37 = (void *)v36;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
      uint64_t v39 = v38;
      if (v38 && (_DWORD)v95 == 1)
      {
        uint64_t v40 = v5;
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
        unsigned int v42 = [v41 tipiHealingBackoff];

        id v5 = v40;
        if (!v42) {
          goto LABEL_53;
        }
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFound:]",  30LL,  "_wxDeviceFound, resetting Tipi Backoff flag here!");
        }

        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
        [v35 setTipiHealingBackoff:0];
      }

      else
      {
      }
    }

LABEL_53:
    uint64_t v43 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
    if (v43)
    {
      BOOL v44 = (void *)v43;
      BOOL v45 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v13));
      if ([v45 hijackBackoffTicks])
      {
        BOOL hijackBackOffInitiator = self->_hijackBackOffInitiator;

        if (!hijackBackOffInitiator && v95 <= 1)
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDeviceFound:]",  30LL,  "_wxDeviceFound, hijackblocking resetting hijackBackoffTicks");
          }

          -[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]( self,  "_hijackBackoffReset:withReason:",  v13,  @"wxtipiGone");
        }
      }

      else
      {
      }
    }

- (void)_wxDeviceLost:(id)a3
{
  id v13 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 bleDevice]);
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 name]);
      uint64_t v8 = (void *)v7;
      uint64_t v9 = &stru_100212678;
      if (v7) {
        uint64_t v9 = (const __CFString *)v7;
      }
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _wxDeviceLost:]", 30LL, "Wx Device lost: %@ %@", v5, v9);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 bleDevice]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 advertisementFields]);
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v11, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

    if (self->_nearbyBannerActionCount || self->_nearbyBannerDismissCount || self->_nearbyBannerTimeoutCount) {
      -[BTSmartRoutingDaemon _submitUIMetricforTVOS:](self, "_submitUIMetricforTVOS:", Int64Ranged);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wxDevices, "setObject:forKeyedSubscript:", 0LL, v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_nearbyWxDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v5);
    -[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:]( self,  "_updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:",  v13,  0LL);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }
}

- (void)_wxDiscoveryWatchRecoveryEnsureStarted
{
  if (!self->_wxDiscoveryWatchRecovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStarted]",  30LL,  "Wx discovery for watch recovery started");
    }

    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStarted:](self, "_powerLogSmartRoutingScanStarted:", 7LL);
    id v3 = objc_alloc_init(&OBJC_CLASS___CUBLEScanner);
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = v3;
    id v5 = v3;

    -[CUBLEScanner setChangeFlags:](v5, "setChangeFlags:", 16LL);
    -[CUBLEScanner setScanFlags:](v5, "setScanFlags:", 16LL);
    -[CUBLEScanner setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEScanner setLabel:](v5, "setLabel:", @"SmartRouting");
    -[CUBLEScanner setScanRate:](v5, "setScanRate:", 50LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10003512C;
    v8[3] = &unk_1002071C8;
    v8[4] = self;
    -[CUBLEScanner setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100035138;
    v7[3] = &unk_1002071C8;
    v7[4] = self;
    -[CUBLEScanner setDeviceLostHandler:](v5, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100035144;
    v6[3] = &unk_100206358;
    void v6[4] = v5;
    void v6[5] = self;
    -[CUBLEScanner setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
    -[CUBLEScanner activate](v5, "activate");
  }

- (void)_wxDiscoveryWatchRecoveryEnsureStopped
{
  if (self->_wxDiscoveryWatchRecovery)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryEnsureStopped]",  30LL,  "Wx discovery for watch recovery stopped");
    }

    -[BTSmartRoutingDaemon _powerLogSmartRoutingScanStopped:](self, "_powerLogSmartRoutingScanStopped:", 7LL);
    -[CUBLEScanner invalidate](self->_wxDiscoveryWatchRecovery, "invalidate");
    wxDiscoveryWatchRecovery = self->_wxDiscoveryWatchRecovery;
    self->_wxDiscoveryWatchRecovery = 0LL;

    watchWxDevices = self->_watchWxDevices;
    if (watchWxDevices)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](watchWxDevices, "allValues", 0LL));
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            -[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryLostDevice:]( self,  "_wxDiscoveryWatchRecoveryLostDevice:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i));
          }

          id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v7);
      }

      uint64_t v10 = self->_watchWxDevices;
      self->_watchWxDevices = 0LL;
    }
  }

- (void)_wxDiscoveryWatchRecoveryFoundDevice:(id)a3
{
  id v17 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
  if (v4)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryFoundDevice:]",  30LL,  "Wx watch recovery device found/updated: %@",  v17);
    }

    watchWxDevices = self->_watchWxDevices;
    if (!watchWxDevices)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v7 = self->_watchWxDevices;
      self->_watchWxDevices = v6;

      watchWxDevices = self->_watchWxDevices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](watchWxDevices, "setObject:forKeyedSubscript:", v17, v4);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v17 addressData]);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = NSPrintF("%.6a", COERCE_DOUBLE([v8 bytes]));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (v11)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
        if (v12)
        {
          __int128 v13 = (void *)v12;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 otherTipiDeviceBTAddress]);
          if (v15)
          {
          }

          else
          {
            BOOL tipiElectionInProgress = self->_tipiElectionInProgress;

            if (!tipiElectionInProgress) {
              -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
            }
          }
        }
      }
    }

    else
    {
      __int128 v11 = 0LL;
    }

    if (-[NSMutableDictionary count](self->_watchWxDevices, "count") == (id)1) {
      -[BTSmartRoutingDaemon _update](self, "_update");
    }
  }
}

- (void)_wxDiscoveryWatchRecoveryLostDevice:(id)a3
{
  id v5 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if (v4)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _wxDiscoveryWatchRecoveryLostDevice:]",  30LL,  "Wx watch recovery device lost: %@",  v5);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchWxDevices, "setObject:forKeyedSubscript:", 0LL, v4);
    -[CUCoalescer trigger](self->_evaluatorCoalescer, "trigger");
  }
}

- (void)_setConnectedBannerTick:(unint64_t)a3
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setConnectedBannerTick:]",  30LL,  "Setting connected banner tick %u",  a3);
  }
  self->_showBannerConnectedLastTicks = a3;
}

- (BOOL)_isInHijackBlockingMode
{
  if (self->_splitterStateOn || self->_hijackBackOffInitiator) {
    return 1;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice hijackBlockingClientSet](self->_sourceDevice, "hijackBlockingClientSet"));
  BOOL v2 = [v4 count] != 0;

  return v2;
}

- (void)getLocalAudioInfofromSnapshot:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
  if (v13)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
    *a3 = [v14 intValue];
  }

  else
  {
    *a3 = -1;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v15)
  {
    char v16 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = [v16 intValue];
  }

  else
  {
    *a4 = 0;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
  if (v17)
  {
    id v18 = objc_claimAutoreleasedReturnValue( -[SmartRoutingStats snapshotLocalPlayingApp]( self->_stats, "snapshotLocalPlayingApp"));
    *a5 = v18;
  }

  else
  {
    *a5 = @"NA";
  }

  char v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute"));
  if (v19)
  {
    id v20 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute"));
    *a6 = v20;
  }

  else
  {
    *a6 = @"NA";
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotRemoteDeviceAudioScore](self->_stats, "snapshotRemoteDeviceAudioScore"));
  if (v21)
  {
    __int128 v23 = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotRemoteDeviceAudioScore](self->_stats, "snapshotRemoteDeviceAudioScore"));
    *a7 = [v22 intValue];

    uint64_t v21 = v23;
  }

  else
  {
    *a7 = -1;
  }
}

- (void)getHijackAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v13)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = [v14 intValue];
  }

  else
  {
    *a4 = 0;
  }

  *a3 = -[SmartRoutingStats hijackScore](self->_stats, "hijackScore");
  unsigned int v15 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
  if (v15 > 4) {
    char v16 = "?";
  }
  else {
    char v16 = off_100207B60[v15];
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
  *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v17));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp"));
  if (v18)
  {
    id v19 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackPlayingApp](self->_stats, "hijackPlayingApp"));
    *a5 = v19;
  }

  else
  {
    *a5 = @"NA";
  }

  *a7 = -[SmartRoutingStats hijackActiveRemoteScore](self->_stats, "hijackActiveRemoteScore");
  -[SmartRoutingStats setManualRouteDestination:](self->_stats, "setManualRouteDestination:", @"NA");
  -[SmartRoutingStats setManualRouteInputOutput:](self->_stats, "setManualRouteInputOutput:", @"NA");
  -[SmartRoutingStats setManualRouteUISource:](self->_stats, "setManualRouteUISource:", @"NA");
}

- (void)getHijackedAwayAudioInfo:(int *)a3 appCount:(int *)a4 playingApp:(id *)a5 route:(id *)a6 remote:(int *)a7
{
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
  if (v13)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
    *a4 = [v14 intValue];
  }

  else
  {
    *a4 = 0;
  }

  *a3 = -[SmartRoutingStats hijackAwayLocalScore](self->_stats, "hijackAwayLocalScore");
  unsigned int v15 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
  if (v15 > 4) {
    char v16 = "?";
  }
  else {
    char v16 = off_100207B60[v15];
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
  *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v17));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
  if (v18)
  {
    id v19 = objc_claimAutoreleasedReturnValue( -[SmartRoutingStats snapshotLocalPlayingApp]( self->_stats, "snapshotLocalPlayingApp"));
    *a5 = v19;
  }

  else
  {
    *a5 = @"NA";
  }

  *a7 = -[SmartRoutingStats hijackAwayRemoteScore](self->_stats, "hijackAwayRemoteScore");
  -[SmartRoutingStats setManualRouteDestination:](self->_stats, "setManualRouteDestination:", @"NA");
  -[SmartRoutingStats setManualRouteInputOutput:](self->_stats, "setManualRouteInputOutput:", @"NA");
  -[SmartRoutingStats setManualRouteUISource:](self->_stats, "setManualRouteUISource:", @"NA");
}

- (void)_startHijackMetricSubmission:(int64_t)a3 wxAddress:(id)a4 version:(id)a5
{
  id v23 = a4;
  id v8 = a5;
  uint64_t v9 = mach_absolute_time();
  unint64_t v10 = UpTicksToSeconds(v9 - -[SmartRoutingStats hijackInputTick](self->_stats, "hijackInputTick"));
  uint64_t v11 = mach_absolute_time();
  unint64_t v12 = UpTicksToSeconds(v11 - -[SmartRoutingStats hijackAmbientTick](self->_stats, "hijackAmbientTick"));
  uint64_t v13 = mach_absolute_time();
  unint64_t v14 = UpTicksToSeconds(v13 - -[SmartRoutingStats hijackMediaTick](self->_stats, "hijackMediaTick"));
  uint64_t v15 = mach_absolute_time();
  unint64_t v16 = UpTicksToSeconds(v15 - -[SmartRoutingStats hijackCallTick](self->_stats, "hijackCallTick"));
  uint64_t v17 = mach_absolute_time();
  unint64_t v18 = UpTicksToSeconds(v17 - -[BTSmartRoutingSourceDevice predictiveRouteTicks]( self->_sourceDevice,  "predictiveRouteTicks"));
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startHijackMetricSubmission:wxAddress:version:]",  30LL,  "HijackStats: Version %@ lastMediaSubmission %us lastCallSubmission %us lastAmbientSubmission %us lastsInputSubmiss ion %us lastPredictiveRoute %us",  v8,  v14,  v16,  v12,  v10,  v18);
  }
  if (v18 >= 3)
  {
    if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 200)
    {
      if (v10 < 3) {
        goto LABEL_27;
      }
      -[SmartRoutingStats setHijackInputTick:](self->_stats, "setHijackInputTick:", mach_absolute_time());
    }

    if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 201)
    {
      if (v12 < 3) {
        goto LABEL_27;
      }
      -[SmartRoutingStats setHijackAmbientTick:](self->_stats, "setHijackAmbientTick:", mach_absolute_time());
    }

    else if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 301)
    {
      if (v14 < 3) {
        goto LABEL_27;
      }
      -[SmartRoutingStats setHijackMediaTick:](self->_stats, "setHijackMediaTick:", mach_absolute_time());
    }

    else if (-[SmartRoutingStats hijackScore](self->_stats, "hijackScore") == 501)
    {
      if (v16 < 3) {
        goto LABEL_27;
      }
      -[SmartRoutingStats setHijackCallTick:](self->_stats, "setHijackCallTick:", mach_absolute_time());
    }

    switch(a3)
    {
      case 1LL:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats reverseRouteReason](self->_stats, "reverseRouteReason"));

        if (!v19) {
          -[SmartRoutingStats setReverseRouteReason:](self->_stats, "setReverseRouteReason:", @"Hijack");
        }
        id v20 = "Accepted";
        uint64_t v21 = @"Hijack_Accepted";
        break;
      case 2LL:
        id v20 = "Ambiguity";
        uint64_t v21 = @"Hijack_Ambiguity";
        break;
      case 3LL:
        id v20 = "Rejected";
        uint64_t v21 = @"Hijack_Rejected";
        break;
      case 4LL:
        id v20 = "Backoff";
        uint64_t v21 = @"Hijack_Backoff";
        break;
      default:
        id v20 = "?";
        uint64_t v21 = @"NA";
        break;
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
    -[SmartRoutingStats setHijackAnswer:](self->_stats, "setHijackAnswer:", v22);

    -[SmartRoutingStats setHijackVersion:](self->_stats, "setHijackVersion:", @"V2");
    -[BTSmartRoutingDaemon submitHijackMetric:withV1:]( self,  "submitHijackMetric:withV1:",  v23,  [v8 isEqualToString:@"V1"]);
    -[BTSmartRoutingDaemon _startRouteChangeDetectionTimer:andAnswer:]( self,  "_startRouteChangeDetectionTimer:andAnswer:",  v23,  a3);
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v23, 5LL);
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v23, 6LL);
    -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:](self, "submitRouteActivityMetric:activity:", v23, v21);
  }

- (void)_statsEnsureStarted
{
  if (!self->_stats)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SmartRoutingStats);
    stats = self->_stats;
    self->_stats = v3;
  }

  if (!self->_smartRoutingWxStatsMap)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    smartRoutingWxStatsMap = self->_smartRoutingWxStatsMap;
    self->_smartRoutingWxStatsMap = v5;
  }

- (void)_submitManualConnectionMetric:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t score = self->_score;
    else {
      id v6 = off_1002079F0[score];
    }
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    uint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    else {
      uint64_t v9 = off_1002079F0[audioScoreOtherTipiDevice];
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    unsigned int v12 = [v11 routingAction];
    if (v12 > 5) {
      uint64_t v13 = "?";
    }
    else {
      uint64_t v13 = off_100207BA8[v12];
    }
    unsigned __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    uint64_t v14 = mach_absolute_time();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    uint64_t v58 = UpTicksToMilliseconds(v14 - (void)[v15 lastConnectionTicks]);

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 otherTipiDeviceBTName]);
    uint64_t v17 = (void *)v16;
    unint64_t v18 = @"NA";
    if (v16) {
      unint64_t v18 = (__CFString *)v16;
    }
    uint64_t v61 = v18;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));
    id v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = (__CFString *)v19;
    }
    else {
      uint64_t v21 = &stru_100212678;
    }
    __int16 v59 = v21;

    uint64_t v60 = v11;
    if (-[BTSmartRoutingSourceDevice evalTicks](self->_sourceDevice, "evalTicks"))
    {
      uint64_t v22 = mach_absolute_time();
      uint64_t v23 = UpTicksToMilliseconds(v22 - -[BTSmartRoutingSourceDevice evalTicks](self->_sourceDevice, "evalTicks"));
    }

    else
    {
      uint64_t v23 = -1LL;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v4]);

    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v4]);
    if ([v27 lastEvalTicks])
    {
      uint64_t v28 = mach_absolute_time();
      uint64_t v29 = UpTicksToMilliseconds(v28 - (void)[v25 lastEvalTicks]);
    }

    else
    {
      uint64_t v29 = -1LL;
    }

    if ([v25 lastConnectTicks])
    {
      uint64_t v30 = mach_absolute_time();
      uint64_t v31 = UpTicksToSeconds(v30 - (void)[v25 lastConnectTicks]);
    }

    else
    {
      uint64_t v31 = -1LL;
    }

    v64[0] = v7;
    v63[0] = @"audioScore";
    v63[1] = @"forceConnect";
    CFTypeID v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_forcedConnection));
    v64[1] = v57;
    v63[2] = @"lastConnectSecond";
    id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v31));
    v64[2] = v56;
    v63[3] = @"lastConnectResult";
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v25 lastConnectResult]);
    unsigned int v55 = (void *)v32;
    if (v32) {
      id v33 = (const __CFString *)v32;
    }
    else {
      id v33 = &stru_100212678;
    }
    v64[3] = v33;
    v63[4] = @"lastEvalSourceResult";
    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalResult](self->_sourceDevice, "evalResult"));
    BOOL v54 = (void *)v34;
    if (v34) {
      __int128 v35 = (const __CFString *)v34;
    }
    else {
      __int128 v35 = &stru_100212678;
    }
    v64[4] = v35;
    v63[5] = @"lastEvalSourceMS";
    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v23));
    void v64[5] = v53;
    v63[6] = @"lastEvalWxResult";
    unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v4]);
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v51 lastEvalResult]);
    __int128 v37 = (void *)v36;
    if (v36) {
      uint64_t v38 = (const __CFString *)v36;
    }
    else {
      uint64_t v38 = &stru_100212678;
    }
    v64[6] = v38;
    v63[7] = @"lastEvalWxMS";
    CFTypeID v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v29));
    v64[7] = v48;
    v63[8] = @"nearbyDeviceCount";
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_nearbyInfoDevices, "count")));
    v64[8] = v39;
    v63[9] = @"nearbyWxCount";
    uint64_t v49 = v25;
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_wxDevices, "count")));
    v64[9] = v40;
    v64[10] = v10;
    v63[10] = @"peerAudioScore";
    v63[11] = @"peerConnectTime";
    v64[11] = &off_100219068;
    v64[12] = v61;
    v63[12] = @"peerModel";
    v63[13] = @"peerConnectTry";
    v64[13] = &off_100219068;
    v64[14] = v62;
    v63[14] = @"routingAction";
    v63[15] = @"tipiConnect";
    uint64_t v50 = (void *)v7;
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v60 otherTipiDeviceBTAddress]);
    unsigned int v42 = @"Yes";
    if (!v41) {
      unsigned int v42 = @"No";
    }
    v64[15] = v42;
    v63[16] = @"wxConnectTime";
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v58));
    v64[16] = v43;
    v63[17] = @"wxProductID";
    uint64_t v47 = (void *)v10;
    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v60 productID]));
    v64[17] = v44;
    v63[18] = @"srCapable";
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_prefSmartRoutingEnabledPhase3));
    v64[18] = v45;
    v64[19] = &off_100219080;
    v63[19] = @"wxConnectTry";
    v63[20] = @"wxBuildVersion";
    v64[20] = v59;
    double v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  21LL));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.ManualConnect", v46);
  }
}

- (void)_submitConnectionMetric:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v80 = a4;
  BOOL v81 = v6;
  if (v6)
  {
    uint64_t score = self->_score;
    else {
      id v8 = off_1002079F0[score];
    }
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
    uint64_t audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    else {
      uint64_t v10 = off_1002079F0[audioScoreOtherTipiDevice];
    }
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
    id v82 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    BOOL v83 = (void *)objc_claimAutoreleasedReturnValue([v82 identifier]);
    unsigned int v11 = [v82 routingAction];
    if (v11 > 5) {
      unsigned int v12 = "?";
    }
    else {
      unsigned int v12 = off_100207BA8[v11];
    }
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    uint64_t v13 = mach_absolute_time();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));
    uint64_t v57 = UpTicksToMilliseconds(v13 - (void)[v14 lastConnectionTicks]);

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v82 otherTipiDeviceBTName]);
    uint64_t v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = (__CFString *)v15;
    }
    else {
      uint64_t v17 = @"NA";
    }
    uint64_t v70 = v17;

    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));
    unsigned int v19 = [v18 preemptiveBannerShown];

    if (v19)
    {
      uint64_t v20 = mach_absolute_time();
      unint64_t v79 = UpTicksToMilliseconds(v20 - self->_preemptiveBannerShownTicks);
      if (v79 >> 5 >= 0x271) {
        unint64_t v79 = UpTicksToMilliseconds(20LL);
      }
      self->_preemptiveBannerShownTicks = 0LL;
      if (self->_preemptiveBannerConnectionInProgress) {
        self->_preemptiveBannerConnectionInProgress = 0;
      }
    }

    else
    {
      unint64_t v79 = 0LL;
    }

    uint64_t v21 = CUPrintNSError(v80);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v21);
    unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v81));
    uint64_t v23 = (void *)v22;
    if (v22) {
      uint64_t v24 = (__CFString *)v22;
    }
    else {
      uint64_t v24 = &stru_100212678;
    }
    unsigned __int16 v62 = v24;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats onDemandCategory](self->_stats, "onDemandCategory"));
    unint64_t v26 = (void *)v25;
    if (v25) {
      BOOL v27 = (__CFString *)v25;
    }
    else {
      BOOL v27 = @"NA";
    }
    CFTypeID v72 = v27;

    if (-[SmartRoutingStats pipeStartTime](self->_stats, "pipeStartTime"))
    {
      uint64_t v28 = mach_absolute_time();
      uint64_t v29 = UpTicksToMilliseconds(v28 - -[SmartRoutingStats pipeStartTime](self->_stats, "pipeStartTime"));
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    unint64_t v30 = -[SmartRoutingStats firstPipeMessageRTT](self->_stats, "firstPipeMessageRTT");
    unsigned int v55 = -[BTSmartRoutingDaemon _inEarNearbyCheck:](self, "_inEarNearbyCheck:", v81);
    BOOL v31 = -[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress");
    unsigned int v32 = -[BTSmartRoutingDaemon _isConnectionTipiv2](self, "_isConnectionTipiv2");
    unsigned int v33 = v32;
    if (v29 != 0 && ~v31) {
      uint64_t v34 = @"Legacy Tipi";
    }
    else {
      uint64_t v34 = @"Phase 1";
    }
    if (v32) {
      uint64_t v34 = @"Tipi2.0";
    }
    uint64_t v66 = v34;
    unsigned int v78 = -[BTSmartRoutingDaemon _inCaseLidClosed:](self, "_inCaseLidClosed:", v81);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));
    unsigned int v56 = [v35 preemptiveBannerShown];

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));
    unsigned __int8 v54 = [v36 sourceCount];

    if (v78
      && dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitConnectionMetric:andError:]",  90LL,  "### Shall not connect when buds in case and case is closed");
    }

    if (v33)
    {
      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0LL;
    }

    uint64_t v85 = 0LL;
    unsigned int v86 = &v85;
    uint64_t v87 = 0x2020000000LL;
    int v88 = 0;
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_100036E94;
    v84[3] = &unk_100206A98;
    v84[4] = &v85;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v84);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));

    if (v39)
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v83));
      unint64_t v41 = (unint64_t)[v40 audioState];
      if (v41 > 3) {
        unsigned int v42 = "?";
      }
      else {
        unsigned int v42 = off_100207970[v41];
      }
      uint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v42));
    }

    else
    {
      uint64_t v58 = @"Unknown";
    }

    v90[0] = v77;
    v89[0] = @"audioScore";
    v89[1] = @"firstPipeMessageRTT";
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v30));
    v90[1] = v76;
    v89[2] = @"forceConnect";
    id v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_forcedConnection));
    v90[2] = v75;
    v89[3] = @"localAudioScore";
    int v74 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats localAudioScore](self->_stats, "localAudioScore"));
    id v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v74 intValue]));
    v90[3] = v71;
    v89[4] = @"nearbyDeviceCount";
    unint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v86 + 6)));
    v90[4] = v68;
    void v89[5] = @"nearbyWxCount";
    id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_wxDevices, "count")));
    v90[5] = v65;
    v90[6] = v72;
    v89[6] = @"onDemandCategory";
    v89[7] = @"onDemandConnect";
    unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v31));
    v90[7] = v64;
    v89[8] = @"setupSupportsTipiv2";
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SmartRoutingStats setupSupportsTipiv2](self->_stats, "setupSupportsTipiv2")));
    v90[8] = v61;
    v90[9] = v73;
    v89[9] = @"peerAudioScore";
    v89[10] = @"peerModel";
    v90[10] = v70;
    v89[11] = @"pipeToConnectionCompleteTime";
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v29));
    v90[11] = v60;
    v89[12] = @"preemptiveBannerFailureReason";
    __int16 v59 = (__CFString *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice evalPreemptiveBannerResult]( self->_sourceDevice,  "evalPreemptiveBannerResult"));
    uint64_t v43 = v59;
    if (!v59) {
      uint64_t v43 = &stru_100212678;
    }
    if (v56) {
      BOOL v44 = @"Yes";
    }
    else {
      BOOL v44 = @"No";
    }
    v90[12] = v43;
    v90[13] = v44;
    v89[13] = @"preemptiveBannerShown";
    v89[14] = @"preemptiveBannerTime";
    if (v79) {
      BOOL v45 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:"));
    }
    else {
      BOOL v45 = @"Not initialized";
    }
    v90[14] = v45;
    v90[15] = v69;
    v89[15] = @"routingAction";
    v89[16] = @"systemAudioRoute";
    v90[16] = v67;
    v89[17] = @"tipiConnect";
    double v46 = (void *)objc_claimAutoreleasedReturnValue([v82 otherTipiDeviceBTAddress]);
    if (v46) {
      uint64_t v47 = @"Yes";
    }
    else {
      uint64_t v47 = @"No";
    }
    v90[17] = v47;
    v90[18] = v66;
    v89[18] = @"tipiConnectType";
    v89[19] = @"wxConnectTime";
    CFTypeID v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v57));
    v90[19] = v48;
    v89[20] = @"wxProductID";
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v82 productID]));
    v90[20] = v49;
    v90[21] = v63;
    v89[21] = @"wxConnectResult";
    v89[22] = @"wxConnectResult2";
    v90[22] = v63;
    v90[23] = v62;
    v89[23] = @"wxBuildVersion";
    v89[24] = @"wxInEar";
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v55));
    v90[24] = v50;
    v89[25] = @"wxInCasewithLidClosed";
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v78));
    v90[25] = v51;
    v89[26] = @"wxSourceCount";
    unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v54));
    v89[27] = @"wxStreamState";
    v90[26] = v52;
    v90[27] = v58;
    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v90,  v89,  28LL));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.headsetConnection", v53);

    if (v79) {
    if (v80)
    }
      -[SmartRoutingStats setOnDemandCategory:](self->_stats, "setOnDemandCategory:", 0LL);

    _Block_object_dispose(&v85, 8);
  }
}

- (void)_submitHijackBlockMetric:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
  unsigned int v11 = (void *)v10;
  unsigned int v12 = &stru_100212678;
  if (v10) {
    unsigned int v12 = (__CFString *)v10;
  }
  uint64_t v13 = v12;

  BOOL v14 = -[SmartRoutingStats mediaPlaying](self->_stats, "mediaPlaying")
     || -[SmartRoutingStats callConnected](self->_stats, "callConnected");
  uint64_t v15 = mach_absolute_time();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
  unint64_t v17 = UpTicksToSeconds(v15 - (void)[v16 hijackBackoffTicks])
      + self->_prefSmartRoutingBlockHijackWindowinSeconds * self->_hijackBackoffCount;

  v23[0] = @"initiator";
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_hijackBackOffInitiator));
  v24[0] = v18;
  v23[1] = @"isPlaying";
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  v24[1] = v19;
  v24[2] = v9;
  v23[2] = @"route";
  v23[3] = @"terminateReason";
  v24[3] = v7;
  v23[4] = @"blockTimeSeconds";
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v17));
  v24[4] = v20;
  void v24[5] = v13;
  void v23[5] = @"wxBuildVersion";
  v23[6] = @"wxProductID";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v24[6] = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  7LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.PreventRepetitiveHijacking", v22);
}

- (void)_submitRouteCheckMetric:(id)a3 andType:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    unsigned int v93 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);
    unsigned int v7 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
    if (v7 > 4) {
      uint64_t v8 = "?";
    }
    else {
      uint64_t v8 = off_100207B60[v7];
    }
    id v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6));

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats onDemandCategory](self->_stats, "onDemandCategory"));
    unsigned int v11 = (void *)v10;
    if (v10) {
      unsigned int v12 = (__CFString *)v10;
    }
    else {
      unsigned int v12 = @"NA";
    }
    int v105 = v12;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
    BOOL v14 = (void *)v13;
    uint64_t v15 = &stru_100212678;
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    BOOL v104 = v15;

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    signed int v90 = -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue");
    else {
      unint64_t v17 = off_100207A90[a4];
    }
    id v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 otherTipiDeviceBTName]);
    unsigned int v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    else {
      uint64_t v20 = @"NA";
    }
    unsigned int v107 = v20;

    unint64_t v21 = -[BTSmartRoutingSourceDevice bluetoothState](self->_sourceDevice, "bluetoothState");
    if (v21 > 0xA) {
      uint64_t v22 = "?";
    }
    else {
      uint64_t v22 = off_1002076E0[v21];
    }
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6));
    uint64_t v92 = v24;
    if (v24)
    {
      unsigned int v25 = [v24 audioStreamState];
      if (v25 > 3) {
        unint64_t v26 = "?";
      }
      else {
        unint64_t v26 = off_100207B40[v25];
      }
      id v100 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26));
    }

    else
    {
      id v100 = @"NA";
    }

    uint64_t v108 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackVersion](self->_stats, "hijackVersion"));
    uint64_t v28 = (void *)v27;
    if (v27) {
      uint64_t v29 = (__CFString *)v27;
    }
    else {
      uint64_t v29 = @"NA";
    }
    unint64_t v30 = v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
    unsigned int v32 = (void *)v31;
    if (v31) {
      unsigned int v33 = (__CFString *)v31;
    }
    else {
      unsigned int v33 = @"NA";
    }
    BOOL v99 = v33;

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v6));
    __int128 v35 = v34;
    id v84 = v6;
    id v101 = (void *)v23;
    if (v9 && v16)
    {
      unsigned int v36 = [v16 inEar];
    }

    else
    {
      if (v9)
      {
        id v97 = @"NA";
LABEL_43:
        uint64_t v38 = 0LL;
        uint64_t v39 = 0LL;
        uint64_t v40 = @"NA";
        id v82 = v35;
        BOOL v109 = @"NA";
        switch(a4)
        {
          case 5:
          case 6:
            uint64_t v39 = -[SmartRoutingStats hijackScore](self->_stats, "hijackScore");
            goto LABEL_45;
          case 7:
          case 9:
          case 10:
          case 11:
            goto LABEL_68;
          case 8:
            uint64_t v41 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats reverseRouteReason](self->_stats, "reverseRouteReason"));

            uint64_t v39 = 0LL;
            uint64_t v38 = 0LL;
            uint64_t v40 = @"NA";
            uint64_t v108 = (__CFString *)v41;
            goto LABEL_67;
          case 12:
            if (v16)
            {
              if ([v16 otherTipiDeviceIdleTick])
              {
                uint64_t v42 = mach_absolute_time();
                uint64_t v39 = 0LL;
                uint64_t v38 = UpTicksToSeconds(v42 - (void)[v16 otherTipiDeviceIdleTick]) - 25;
              }

              else
              {
                uint64_t v39 = 0LL;
LABEL_45:
                uint64_t v38 = 0LL;
              }

              uint64_t v40 = @"NA";
            }

            else
            {
              uint64_t v39 = 0LL;
              uint64_t v38 = 0LL;
            }

            goto LABEL_67;
          case 13:

            uint64_t v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            uint64_t v44 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerAction](self->_stats, "bannerAction"));
            uint64_t v95 = v30;
            BOOL v45 = (void *)v44;
            if (v44) {
              double v46 = (const __CFString *)v44;
            }
            else {
              double v46 = @"NA";
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v43,  "setObject:forKeyedSubscript:",  v46,  @"BannerAction",  v82);

            uint64_t v47 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerTrigger](self->_stats, "bannerTrigger"));
            CFTypeID v48 = (void *)v47;
            if (v47) {
              uint64_t v49 = (const __CFString *)v47;
            }
            else {
              uint64_t v49 = @"NA";
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v43,  "setObject:forKeyedSubscript:",  v49,  @"BannerTrigger");

            uint64_t v50 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getJsonStringFromDictionary:](self, "_getJsonStringFromDictionary:", v43));
            uint64_t v51 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerTrigger](self->_stats, "bannerTrigger"));
            unsigned __int8 v52 = (void *)v51;
            if (v51) {
              unint64_t v53 = (__CFString *)v51;
            }
            else {
              unint64_t v53 = @"NA";
            }
            unsigned __int8 v54 = v53;

            uint64_t v55 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats bannerAction](self->_stats, "bannerAction"));
            unsigned int v56 = (void *)v55;
            if (v55) {
              uint64_t v57 = (__CFString *)v55;
            }
            else {
              uint64_t v57 = @"NA";
            }
            BOOL v109 = v57;

            uint64_t v40 = v54;
            uint64_t v39 = 0LL;
            uint64_t v38 = 0LL;
            unsigned int v107 = @"NA";
            uint64_t v108 = (__CFString *)v50;
            unint64_t v30 = v95;
            goto LABEL_68;
          default:
LABEL_67:
            BOOL v109 = @"NA";
LABEL_68:
            int v98 = (__CFString *)v40;
            uint64_t v103 = v16;
            int v94 = a4;
            if (-[__CFString isEqualToString:](v99, "isEqualToString:", @"Backoff", v82))
            {

              __int128 v96 = @"All";
            }

            else
            {
              __int128 v96 = v30;
            }

            BOOL v58 = v90 > 100;
            BOOL v59 = v9 != 0LL;
            v110[0] = @"ActivePlayingApp";
            uint64_t v60 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
            id v91 = (void *)v60;
            if (v60) {
              uint64_t v61 = (const __CFString *)v60;
            }
            else {
              uint64_t v61 = @"NA";
            }
            v111[0] = v61;
            v111[1] = v109;
            v110[1] = @"BannerAction";
            v110[2] = @"BluetoothState";
            v111[2] = v101;
            v110[3] = @"HijackAnswer";
            uint64_t v62 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackAnswer](self->_stats, "hijackAnswer"));
            BOOL v89 = (void *)v62;
            if (v62) {
              uint64_t v63 = (const __CFString *)v62;
            }
            else {
              uint64_t v63 = @"NA";
            }
            v111[3] = v63;
            v110[4] = @"HijackScore";
            int v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v39));
            v111[4] = v88;
            v110[5] = @"HijackVersion";
            uint64_t v64 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats hijackVersion](self->_stats, "hijackVersion"));
            id v65 = (void *)v64;
            if (v64) {
              uint64_t v66 = (const __CFString *)v64;
            }
            else {
              uint64_t v66 = @"NA";
            }
            v111[5] = v66;
            v111[6] = v97;
            v110[6] = @"InEar";
            v110[7] = @"IsConnected";
            uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v59));
            v111[7] = v87;
            v110[8] = @"IsPlaying";
            unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v58));
            v111[8] = v86;
            v110[9] = @"LocalAudioCategory";
            uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue")));
            v111[9] = v85;
            v111[10] = v105;
            v110[10] = @"OnDemandCategory";
            v110[11] = @"OtherTipiDevice";
            v111[11] = v107;
            v110[12] = @"OtherTipiDeviceIdleTime";
            unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v38));
            v111[12] = v67;
            v110[13] = @"OtherTipiAudioCategory";
            unint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v16 otherTipiAudioCategory]));
            v111[13] = v68;
            v110[14] = @"OtherTipiDevicePlayingApp";
            uint64_t v69 = objc_claimAutoreleasedReturnValue([v16 otherTipiDevicePlayingApp]);
            uint64_t v70 = (void *)v69;
            if (v69) {
              id v71 = (const __CFString *)v69;
            }
            else {
              id v71 = @"NA";
            }
            v111[14] = v71;
            v110[15] = @"ProactiveRoutingTrigger";
            uint64_t v72 = objc_claimAutoreleasedReturnValue(-[SmartRoutingStats proactiveRoutingTrigger](self->_stats, "proactiveRoutingTrigger"));
            uint64_t v73 = (void *)v72;
            if (v72) {
              int v74 = (const __CFString *)v72;
            }
            else {
              int v74 = @"NA";
            }
            v111[15] = v74;
            v110[16] = @"ProactiveRoutingWxRSSI";
            uint64_t v75 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SmartRoutingStats proactiveRoutingWxRSSI](self->_stats, "proactiveRoutingWxRSSI")));
            uint64_t v76 = (void *)v75;
            uint64_t v77 = v108;
            if (!v108) {
              uint64_t v77 = @"NA";
            }
            v111[16] = v75;
            v111[17] = v77;
            v110[17] = @"Reason";
            v110[18] = @"Route";
            v111[18] = v106;
            v111[19] = v98;
            v110[19] = @"Trigger";
            v110[20] = @"Type";
            v111[20] = v102;
            v111[21] = v104;
            v110[21] = @"WxBuildVersion";
            v110[22] = @"WxProductID";
            unsigned int v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v93));
            v110[23] = @"WxStreamState";
            v111[22] = v78;
            v111[23] = v100;
            unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v111,  v110,  24LL));
            CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.RouteCheck", v79);

            if (v94 == 6)
            {
              -[SmartRoutingStats setHijackAnswer:](self->_stats, "setHijackAnswer:", 0LL);
              id v80 = v83;
              id v6 = v84;
              BOOL v81 = (__CFString *)v96;
            }

            else
            {
              id v80 = v83;
              id v6 = v84;
              BOOL v81 = (__CFString *)v96;
              if (v94 == 10) {
                -[SmartRoutingStats setOnDemandCategory:](self->_stats, "setOnDemandCategory:", 0LL);
              }
            }

            break;
        }

        goto LABEL_93;
      }

      unsigned int v36 = [v34 nearbyInEar] == 1;
    }

    __int128 v37 = @"NO";
    if (v36) {
      __int128 v37 = @"YES";
    }
    id v97 = v37;
    goto LABEL_43;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitRouteCheckMetric:andType:]",  30LL,  "Failed to submit route check metric since Wx is null");
  }
LABEL_93:
}

- (void)updateCurrentAudioSnapshot
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
  -[SmartRoutingStats setSnapshotRemoteDeviceAudioScore:](self->_stats, "setSnapshotRemoteDeviceAudioScore:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _findActiveWxDevice](self, "_findActiveWxDevice"));
  BOOL v14 = v4;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    id v6 = v5;
    if (v5)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 otherTipiAudioCategory]));
      -[SmartRoutingStats setSnapshotRemoteDeviceAudioScore:](self->_stats, "setSnapshotRemoteDeviceAudioScore:", v7);
    }

    id v4 = v14;
  }

  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1 || (v13 = _LogCategory_Initialize(&dword_100234408, 30LL), id v4 = v14, v13))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalRoute](self->_stats, "snapshotLocalRoute"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalPlayingApp](self->_stats, "snapshotLocalPlayingApp"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalDeviceAudioScore](self->_stats, "snapshotLocalDeviceAudioScore"));
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats snapshotRemoteDeviceAudioScore]( self->_stats,  "snapshotRemoteDeviceAudioScore"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats snapshotLocalNumOfApps](self->_stats, "snapshotLocalNumOfApps"));
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon updateCurrentAudioSnapshot]",  30LL,  "AudioStateSnapshot: Route:%@ App %@, Score %@, Remote %@NumofApp %@",  v8,  v9,  v10,  v11,  v12);

      id v4 = v14;
    }
  }
}

- (void)_updateSRDiscoveredDeviceForCBDeviceChanged:(id)a3 connectionStatus:(unsigned __int8)a4
{
  if (self->_prefSmartRoutingInUseBanner)
  {
    uint64_t v4 = a4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 btAddressData]);
    uint64_t v7 = CUPrintNSDataAddress(v6);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v7);

    uint64_t v8 = (void *)v11;
    if (v11)
    {
      uint64_t v9 = (SRDiscoveredDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v11));
      if (!v9) {
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SRDiscoveredDevice);
      }
      -[SRDiscoveredDevice _setBtAddress:](v9, "_setBtAddress:", v11);
      -[SRDiscoveredDevice _setConnectionState:](v9, "_setConnectionState:", v4);
      uint64_t v10 = v11;
      if (!(_DWORD)v4)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForCBDeviceChanged:connectionStatus:]",  30LL,  "SRDiscoveredDevice: Clearing Wx %@ state for disconnection",  v11);
        }

        -[SRDiscoveredDevice _setRouteToWxAfterUnhide:](v9, "_setRouteToWxAfterUnhide:", 0LL);
        uint64_t v10 = v11;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "setObject:forKeyedSubscript:",  v9,  v10);

      uint64_t v8 = (void *)v11;
    }
  }

- (void)_updateSRDiscoveredDeviceForNearbyWxChanged:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_prefSmartRoutingInUseBanner)
  {
    uint64_t v41 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v41 bleDevice]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementFields]);

      uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v10, @"publicAddress", 6LL, 0LL);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
      int v13 = v12;
      if (v12)
      {
        uint64_t v14 = NSPrintF("%.6a", COERCE_DOUBLE([v12 bytes]));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          BOOL v37 = v4;
          unsigned int v36 = v8;
          unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v10, @"aState", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
          uint64_t Int64 = CFDictionaryGetInt64(v10, @"paired", 0LL);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v41 bleDevice]);
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 advertisementFields]);
          uint64_t v40 = CFDictionaryGetInt64Ranged(v19, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

          uint64_t v20 = CFDictionaryGetInt64(v10, @"primaryiCloudSignIn", 0LL);
          CFTypeID TypeID = CFStringGetTypeID();
          uint64_t TypedValue = CFDictionaryGetTypedValue(v10, @"name", TypeID, 0LL);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          uint64_t v23 = CFDictionaryGetCFDataOfLength(v10, @"lch", 3LL, 0LL);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v41 bleDevice]);
          unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 advertisementFields]);
          char v27 = CFDictionaryGetInt64Ranged(v26, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL);

          uint64_t v28 = 1LL;
          if ((v27 & 0x24) == 0)
          {
            if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v40)) {
              uint64_t v28 = 1LL;
            }
            else {
              uint64_t v28 = 2LL;
            }
          }

          unsigned __int8 v34 = CFDictionaryGetInt64Ranged(v10, @"budsOutofCaseTime", 0LL, 255LL, 0LL);
          unsigned __int8 v35 = CFDictionaryGetInt64Ranged(v10, @"asCount", 0LL, 0xFFFFFFFFLL, 0LL);
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            uint64_t v29 = "no";
            if (v37) {
              unint64_t v30 = "yes";
            }
            else {
              unint64_t v30 = "no";
            }
            if (Int64Ranged >> 2) {
              uint64_t v31 = "?";
            }
            else {
              uint64_t v31 = off_100207970[Int64Ranged];
            }
            if (Int64) {
              unsigned int v32 = "yes";
            }
            else {
              unsigned int v32 = "no";
            }
            if (v20) {
              uint64_t v29 = "yes";
            }
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateSRDiscoveredDeviceForNearbyWxChanged:isNearby:]",  30LL,  "SRDiscoveredDevice: Nearby Wx changed addr %@ name %@ found %s streamState %s productID %u paired %s iClou dSignedIn %s lastConnect %@",  v16,  v38,  v30,  v31,  v40,  v32,  v29,  v24);
          }

          unsigned int v33 = (SRDiscoveredDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v16));
          if (!v33) {
            unsigned int v33 = objc_alloc_init(&OBJC_CLASS___SRDiscoveredDevice);
          }
          -[SRDiscoveredDevice _setBtAddress:](v33, "_setBtAddress:", v16);
          -[SRDiscoveredDevice _setIsNearby:](v33, "_setIsNearby:", v37);
          -[SRDiscoveredDevice _setNearbyiCloudSignIn:](v33, "_setNearbyiCloudSignIn:", v20 != 0);
          -[SRDiscoveredDevice _setNearbyName:](v33, "_setNearbyName:", v38);
          -[SRDiscoveredDevice _setNearbyPaired:](v33, "_setNearbyPaired:", Int64 != 0);
          -[SRDiscoveredDevice _setNearbyProductID:](v33, "_setNearbyProductID:", v40);
          -[SRDiscoveredDevice _setNearbyWxDevice:](v33, "_setNearbyWxDevice:", v41);
          -[SRDiscoveredDevice _setNearbyLastRouteHost:](v33, "_setNearbyLastRouteHost:", v24);
          -[SRDiscoveredDevice _setNearbyPrevInEar:]( v33,  "_setNearbyPrevInEar:",  -[SRDiscoveredDevice nearbyInEar](v33, "nearbyInEar"));
          -[SRDiscoveredDevice _setNearbyInEar:](v33, "_setNearbyInEar:", v28);
          -[SRDiscoveredDevice _setNearbyOutOfCaseTime:](v33, "_setNearbyOutOfCaseTime:", v34);
          -[SRDiscoveredDevice _setNearbyStreamState:](v33, "_setNearbyStreamState:", (int)Int64Ranged);
          -[SRDiscoveredDevice _setNearbyConnectedSourceCount:](v33, "_setNearbyConnectedSourceCount:", v35);
          if (!v37) {
            -[SRDiscoveredDevice _setNearbyPrevInEar:](v33, "_setNearbyPrevInEar:", 0LL);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "setObject:forKeyedSubscript:",  v33,  v16);

          uint64_t v8 = v36;
        }
      }
    }

    id v6 = v41;
  }
}

- (void)_cancelInUseBannerForCallTimer
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _cancelInUseBannerForCallTimer]",  30LL,  "Cancel InUseBanner timer");
  }
  inUseBannerTimer = self->_inUseBannerTimer;
  if (inUseBannerTimer)
  {
    id v5 = inUseBannerTimer;
    dispatch_source_cancel(v5);
    BOOL v4 = self->_inUseBannerTimer;
    self->_inUseBannerTimer = 0LL;
  }

- (void)_cancelRingtoneTimer
{
  ringtoneTimer = self->_ringtoneTimer;
  if (ringtoneTimer)
  {
    id v5 = ringtoneTimer;
    dispatch_source_cancel(v5);
    BOOL v4 = self->_ringtoneTimer;
    self->_ringtoneTimer = 0LL;
  }

- (void)_handleTUCallStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000383F0;
  v7[3] = &unk_100206358;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_isPhoneCall:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice conferencingCallSets](self->_sourceDevice, "conferencingCallSets"));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
        if (v11)
        {
          unsigned int v12 = (void *)v11;
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
          id v15 = [v14 rangeOfString:v9 options:1];

          if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (dword_100234408 <= 30
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
            {
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isPhoneCall:]",  30LL,  "TUNotification: New Call is conferencing call %@",  v9);
            }

            BOOL v16 = 0;
            goto LABEL_18;
          }
        }

        else
        {
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (void)_startRingtoneTimer
{
  dispatch_source_t v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_ringtoneTimer, v3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000391D4;
  handler[3] = &unk_100206058;
  void handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  CUDispatchTimerSet(v3, 40.0, -1.0, -10.0);
  dispatch_activate(v3);
}

- (void)_TUMonitorEnsureStarted
{
  if (!self->_tuCallCenter)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _TUMonitorEnsureStarted]", 30LL, "TU Monitor start");
    }

    dispatch_source_t v3 = (TUCallCenter *)objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  self->_dispatchQueue));
    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = v3;

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"_handleTUCallStateChange:" name:TUCallCenterCallStatusChangedNotification object:0];

    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"_handleTUCallStateChange:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
  }

- (void)_TUMonitorEnsureStopped
{
  if (self->_tuCallCenter)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _TUMonitorEnsureStopped]", 30LL, "TU Monitor stop");
    }

    tuCallCenter = self->_tuCallCenter;
    self->_tuCallCenter = 0LL;

    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:TUCallCenterCallStatusChangedNotification object:0];
    [v4 removeObserver:self name:TUCallCenterVideoCallStatusChangedNotification object:0];
  }

- (void)_anyPairedDeviceSupportsSmartRouting
{
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  dispatch_source_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  id v4 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (([v9 deviceFlags] & 0x10) != 0)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 btAddressData]);
          if ([v10 length] == (id)6)
          {
            uint64_t v11 = NSPrintF("%.6a", COERCE_DOUBLE([v10 bytes]));
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            if (v12)
            {
              uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v12));
              if (v13)
              {
                uint64_t v14 = (void *)v13;
                id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v12));

                if (!v15)
                {
                  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v12));
                  -[BTSmartRoutingDaemon _smartRoutingAddWxMapDeviceFromConnectedDevice:]( self,  "_smartRoutingAddWxMapDeviceFromConnectedDevice:",  v16);
                  -[BTSmartRoutingDaemon _triggerTipiTableUpdate:](self, "_triggerTipiTableUpdate:", v12);
                }
              }
            }
          }

          else
          {
            unsigned int v12 = 0LL;
          }

          char v6 = 1;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v5);
  }

  else
  {
    char v6 = 0;
  }

  if (self->_pairedDeviceSupportsSmartRouting != (v6 & 1))
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      unint64_t v17 = "not found";
      if ((v6 & 1) != 0) {
        unint64_t v17 = "found";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _anyPairedDeviceSupportsSmartRouting]",  30LL,  "Tipi paired device %s.",  v17);
    }

    self->_BOOL pairedDeviceSupportsSmartRouting = v6 & 1;
    if ((v6 & 1) == 0)
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_100039874;
      v44[3] = &unk_100206F58;
      v44[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v44);
      uiSmartRoutingBanner = self->_uiSmartRoutingBanner;
      if (uiSmartRoutingBanner)
      {
        -[BTBannerUISession invalidate](uiSmartRoutingBanner, "invalidate");
        __int128 v20 = self->_uiSmartRoutingBanner;
        self->_uiSmartRoutingBanner = 0LL;
      }

      disconnectTicksMap = self->_disconnectTicksMap;
      if (disconnectTicksMap)
      {
        -[NSMutableDictionary removeAllObjects](disconnectTicksMap, "removeAllObjects");
        __int128 v22 = self->_disconnectTicksMap;
      }

      else
      {
        __int128 v22 = 0LL;
      }

      self->_disconnectTicksMap = 0LL;

      self->_connectTicks = 0LL;
      self->_tipiSetupTicks = 0LL;
      if (self->_tipiElectionInProgress) {
        self->_BOOL tipiElectionInProgress = 0;
      }
      -[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:](self, "_setTipiElectionReceivedLePipe:", &stru_100212678);
      tipiHealingTimer = self->_tipiHealingTimer;
      if (tipiHealingTimer)
      {
        uint64_t v24 = tipiHealingTimer;
        dispatch_source_cancel(v24);
        unsigned int v25 = self->_tipiHealingTimer;
        self->_tipiHealingTimer = 0LL;
      }

      smartRoutingManualDisconnectionList = self->_smartRoutingManualDisconnectionList;
      if (smartRoutingManualDisconnectionList)
      {
        -[NSMutableArray removeAllObjects](smartRoutingManualDisconnectionList, "removeAllObjects");
        char v27 = self->_smartRoutingManualDisconnectionList;
      }

      else
      {
        char v27 = 0LL;
      }

      self->_smartRoutingManualDisconnectionList = 0LL;

      srBudswapDeviceMap = self->_srBudswapDeviceMap;
      if (srBudswapDeviceMap)
      {
        -[NSMutableDictionary removeAllObjects](srBudswapDeviceMap, "removeAllObjects");
        uint64_t v29 = self->_srBudswapDeviceMap;
      }

      else
      {
        uint64_t v29 = 0LL;
      }

      self->_srBudswapDeviceMap = 0LL;

      unint64_t v30 = self->_smartRoutingWxDeviceMap;
      if (v30)
      {
        -[NSMutableDictionary removeAllObjects](v30, "removeAllObjects");
        uint64_t v31 = self->_smartRoutingWxDeviceMap;
      }

      else
      {
        uint64_t v31 = 0LL;
      }

      self->_smartRoutingWxDeviceMap = 0LL;

      smartRoutingBackOffMap = self->_smartRoutingBackOffMap;
      if (smartRoutingBackOffMap)
      {
        -[NSMutableDictionary removeAllObjects](smartRoutingBackOffMap, "removeAllObjects");
        unsigned int v33 = self->_smartRoutingBackOffMap;
      }

      else
      {
        unsigned int v33 = 0LL;
      }

      self->_smartRoutingBackOffMap = 0LL;

      highActivityLevelTimer = self->_highActivityLevelTimer;
      if (highActivityLevelTimer)
      {
        unsigned __int8 v35 = highActivityLevelTimer;
        dispatch_source_cancel(v35);
        unsigned int v36 = self->_highActivityLevelTimer;
        self->_highActivityLevelTimer = 0LL;
      }

      phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
      if (phoneOwnershipTriangleTimer)
      {
        uint64_t v38 = phoneOwnershipTriangleTimer;
        dispatch_source_cancel(v38);
        uint64_t v39 = self->_phoneOwnershipTriangleTimer;
        self->_phoneOwnershipTriangleTimer = 0LL;
      }

      idleActivityScoreTimer = self->_idleActivityScoreTimer;
      if (idleActivityScoreTimer)
      {
        uint64_t v41 = idleActivityScoreTimer;
        dispatch_source_cancel(v41);
        uint64_t v42 = self->_idleActivityScoreTimer;
        self->_idleActivityScoreTimer = 0LL;
      }

      phase1ConnectConfig = self->_phase1ConnectConfig;
      self->_phase1ConnectConfig = 0LL;
    }

    -[BTSmartRoutingDaemon _prefsChanged](self, "_prefsChanged");
  }

- (BOOL)_aacpConnectedCheck:(id)a3
{
  return ([a3 connectedServices] >> 19) & 1;
}

- (BOOL)allowHijackWithAudioScore:(unsigned int)a3 hijackRoute:(id)a4 hijackDeniedReason:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
  if (v6 <= 0xC7)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]",  30LL,  "[Hijackv2] Dont allow hijack for score < %d ",  200);
    }

    LOBYTE(v15) = 0;
    goto LABEL_36;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v8));
  id v11 = [v10 audioStreamState];

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
  id v13 = [v12 otherTipiAudioCategory];
  -[SmartRoutingStats setHijackActiveRemoteScore:](self->_stats, "setHijackActiveRemoteScore:", v13);
  unsigned int v14 = [v12 otherTipiDeviceIsWatch];
  if (!v8)
  {
    BOOL v15 = 0;
    __int128 v19 = @"WxAddress is NULL";
    goto LABEL_13;
  }

  BOOL v15 = v14;
  id v16 = v11;
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v8));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 otherTipiDeviceBTAddress]);

  if (v18)
  {
    if ((_DWORD)v6 == 401)
    {
      if (!v15)
      {
        __int128 v20 = @"3rd Party ringtone shall not hijack non-watch tipi device";
        goto LABEL_22;
      }

      if ((_DWORD)v13)
      {
        LODWORD(v11) = (_DWORD)v16;
        if (v13 > 0x190)
        {
          id v31 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Rejected, Remote Category %d >= Local Category %d", v13, 401LL));
          *a5 = v31;

          BOOL v15 = 0;
        }

        else
        {
          *a5 = @"Allowed";
          BOOL v15 = 1;
        }

        goto LABEL_24;
      }

      goto LABEL_20;
    }

    if (!(_DWORD)v13)
    {
LABEL_20:
      BOOL v15 = 0;
      __int128 v20 = @"Fall back to legacy hijack";
      goto LABEL_22;
    }

    BOOL v15 = v13 <= v6;
    if (v13 > v6)
    {
      id v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Rejected, Remote Category %d > Local Category %d, audio streaming state %d", v13, v6, v16));
      *a5 = v25;
    }

    else
    {
      *a5 = @"Allowed";
    }

    id v26 = [v12 otherTipiDeviceMajorBuildVersion];
    if (self->_prefSmartRoutingPrioritizedCall)
    {
      uint64_t v27 = (uint64_t)v26;
      int DeviceClass = GestaltGetDeviceClass(v26);
      unsigned int v29 = 0;
      if ((_DWORD)v6 == 501 && DeviceClass == 1)
      {
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice TUCallMap](self->_sourceDevice, "TUCallMap"));
        if ([v44 count])
        {
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v12 otherTipiDeviceBTName]);
          unsigned int v30 = [v42 isEqualToString:@"Mac"];
          if (v27 > 14) {
            unsigned int v29 = v30;
          }
          else {
            unsigned int v29 = 0;
          }
        }

        else
        {
          unsigned int v29 = 0;
        }
      }
    }

    else
    {
      unsigned int v29 = 0;
    }

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      unsigned int v32 = "no";
      if (v29) {
        unsigned int v32 = "yes";
      }
      uint64_t v43 = v32;
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice TUCallMap](self->_sourceDevice, "TUCallMap"));
      id v41 = [v45 count];
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v12 otherTipiDeviceBTName]);
      id v40 = [v12 otherTipiDeviceMajorBuildVersion];
      id v34 = [v12 otherTipiDeviceMinorBuildVersion];
      unsigned __int8 v35 = "no";
      if (self->_prefSmartRoutingPrioritizedCall) {
        unsigned __int8 v35 = "yes";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]",  30LL,  "[Hijackv2] local %u vs remote %u isPhoneCallHijack %s CallCount %d otherTipi %@ %d.%d prioritizedCall %s",  v6,  v13,  v43,  v41,  v33,  v40,  v34,  v35);
    }

    else {
      char v38 = 1;
    }
    if ((v38 & 1) == 0)
    {
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Ambiguity"));
    }

    if ((v29 & 1) != 0) {
      goto LABEL_23;
    }
    LODWORD(v11) = (_DWORD)v16;
    if ((_DWORD)v16 == 3)
    {
      uint64_t v9 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
      if ((_DWORD)v13 == 121
        || (_DWORD)v13 == 501
        || -[BTSmartRoutingSourceDevice incomingCallRingtone](self->_sourceDevice, "incomingCallRingtone"))
      {
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v9 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
      if ((_DWORD)v11 != 2 || (_DWORD)v13 != 501) {
        goto LABEL_25;
      }
    }

    int inst_meths = (int)v9[14].inst_meths;
    if (inst_meths <= 30 && (inst_meths != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]",  30LL,  "[Hijackv2] Wx stream state not matches remote score, fallback to legacy hijack");
    }
    BOOL v15 = 0;
    __int128 v19 = @"Fall back to legacy hijack";
LABEL_13:
    *a5 = v19;
    goto LABEL_25;
  }

  BOOL v15 = 0;
  __int128 v20 = @"Other Tipi device does not exist";
LABEL_22:
  *a5 = v20;
LABEL_23:
  LODWORD(v11) = (_DWORD)v16;
LABEL_24:
  uint64_t v9 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
LABEL_25:
  int v21 = (int)v9[14].inst_meths;
  if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    __int128 v22 = "no";
    if (v15) {
      __int128 v22 = "yes";
    }
    else {
      uint64_t v23 = off_100207B40[(int)v11];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]",  30LL,  "[Hijackv2] Allow hijack=%s, Local audio category=%u, Remote audio category=%u, wx stream state=%s, Deny reason=%@",  v22,  v6,  v13,  v23,  *a5);
  }

LABEL_36:
  return v15;
}

- (BOOL)_bluetoothProductIDNoEarDetect:(unsigned int)a3
{
  return (a3 - 8195 < 0x24) & (0xC0090064DuLL >> (a3 - 3));
}

- (id)_bluetoothProductIDToAsset:(unsigned int)a3
{
  if (a3 == 8228) {
    unsigned int v3 = 8212;
  }
  else {
    unsigned int v3 = a3;
  }
  if ((v3 & 0xFFFFFFFD) == 0x2019 || v3 == 8222 || v3 == 8224) {
    uint64_t v6 = 8217LL;
  }
  else {
    uint64_t v6 = v3;
  }
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u",  v6);
}

- (id)_bluetoothProductIDToColorAsset:(unsigned int)a3 withColor:(unsigned __int8)a4
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u-%d",  *(void *)&a3,  a4);
}

- (id)_bluetoothProductIDToCaseAsset:(unsigned int)a3 andAddress:(id)a4
{
  id v6 = a4;
  if (a3 == 8216 || a3 == 8213 || a3 == 8228) {
    unsigned int v9 = 8212;
  }
  else {
    unsigned int v9 = a3;
  }
  if (v9 - 8219 < 2 || v9 == 8222 || v9 == 8224) {
    uint64_t v12 = 8217LL;
  }
  else {
    uint64_t v12 = v9;
  }
  if ((v12 - 8210) > 0xB || ((1 << (v12 - 18)) & 0x811) == 0)
  {
    BOOL v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u-Case",  v12,  v18);
  }

  else
  {
    unsigned int v14 = -[BTSmartRoutingDaemon _getWxColorCode:](self, "_getWxColorCode:", v6);
    if (!-[BTSmartRoutingDaemon _productColorAssetExists:withColor:]( self,  "_productColorAssetExists:withColor:",  v12,  (char)v14)
      || v14 == 255)
    {
      BOOL v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u-default-Case",  v12,  v18);
    }

    else
    {
      BOOL v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u-%d-Case",  v12,  v14);
    }
  }

  id v16 = v15;

  return v16;
}

- (id)_bluetoothProductIDToLocalizationString:(unsigned int)a3 withActionButton:(BOOL)a4
{
  char v4 = a3 - 2;
  if (a3 - 8194 > 0x24) {
    goto LABEL_10;
  }
  if (((1LL << v4) & 0x145A977A0BLL) != 0)
  {
    id v5 = @"CONNECTED_EARBUDS";
LABEL_4:
    id v6 = @"CONNECT";
    goto LABEL_7;
  }

  if (((1LL << v4) & 0x820200594LL) == 0)
  {
LABEL_10:
    id v5 = @"CONNECTED";
    goto LABEL_4;
  }

  id v5 = @"CONNECTED_OVEREAR_HEADPHONES";
  id v6 = @"CONNECT_OVEREAR_HEADPHONES";
LABEL_7:
  if (a4) {
    return (id)v6;
  }
  else {
    return (id)v5;
  }
}

- (id)_bluetoothProductDefaultAsset:(unsigned int)a3
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Banner-PID-%u-default",  *(void *)&a3);
}

- (BOOL)_bluetoothProductIDNoUTP:(unsigned int)a3
{
  return (a3 - 8197 < 0x21) & (0x1042409B3uLL >> (a3 - 5));
}

- (void)_budSwapDetectionStartTimer:(id)a3
{
  id v4 = a3;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _budSwapDetectionStartTimer:]",  30LL,  "Start budswap timer. Cache will be cleared in %us",  20);
  }
  dispatch_time_t v5 = dispatch_time(0LL, 20000000000LL);
  budSwapTimer = self->_budSwapTimer;
  if (budSwapTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    uint64_t v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    id v8 = self->_budSwapTimer;
    self->_budSwapTimer = v7;

    unsigned int v9 = self->_budSwapTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003A304;
    handler[3] = &unk_1002071F0;
    void handler[4] = self;
    uint64_t v12 = 20LL;
    id v11 = v4;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_budSwapTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_budSwapTimer);
  }
}

- (void)_cacheBudswapInfo:(id)a3
{
  id v4 = a3;
  srBudswapDeviceMap = self->_srBudswapDeviceMap;
  id v15 = v4;
  if (!srBudswapDeviceMap)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = self->_srBudswapDeviceMap;
    self->_srBudswapDeviceMap = v6;

    id v4 = v15;
    srBudswapDeviceMap = self->_srBudswapDeviceMap;
  }

  id v8 = (BTSmartRoutingBudswapDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( srBudswapDeviceMap,  "objectForKeyedSubscript:",  v4));
  if (!v8) {
    id v8 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingBudswapDevice);
  }
  -[BTSmartRoutingBudswapDevice setReconnectionState:](v8, "setReconnectionState:", 0LL);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v15));
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 otherTipiDeviceBTAddress]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceBTAddress]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceBTName]);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 otherTipiDeviceVersion]);
      -[BTSmartRoutingBudswapDevice _cacheInfo:andAddress:andName:andVersion:]( v8,  "_cacheInfo:andAddress:andName:andVersion:",  v15,  v12,  v13,  v14);
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_srBudswapDeviceMap,  "setObject:forKeyedSubscript:",  v8,  v15);
}

- (int64_t)_checkTickswithinWindow:(unint64_t)a3 withWindow:(unint64_t)a4
{
  uint64_t v5 = SecondsToUpTicks(a4, a2);
  return v5 + a3 - mach_absolute_time();
}

- (void)_disconnectOtherTipiDevice:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v8[0] = v5;
    v8[1] = @"FF:FF:FF:FF:FF:FF";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _disconnectOtherTipiDevice:]",  30LL,  "Disconnect other Tipi device with Tipi table %@",  v6);
    }

    -[BTSmartRoutingDaemon _updateAccessoryID:connectionDeviceAddresses:completion:]( self,  "_updateAccessoryID:connectionDeviceAddresses:completion:",  v7,  v6,  &stru_100207210);
  }

- (void)_disconnectReason:(id)a3 reason:(unint64_t)smartRoutingDisconnectReason
{
  id v6 = a3;
  uint64_t v7 = v6;
  self->_smartRoutingDisconnectReason = smartRoutingDisconnectReason;
  if (dword_100234408 <= 30)
  {
    id v9 = v6;
    if (dword_100234408 == -1)
    {
      int v8 = _LogCategory_Initialize(&dword_100234408, 30LL);
      uint64_t v7 = v9;
      if (!v8) {
        goto LABEL_5;
      }
      smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
    }

    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _disconnectReason:reason:]",  30LL,  "Smart Routing disconnect reason %llu",  smartRoutingDisconnectReason);
    uint64_t v7 = v9;
  }

- (void)_dumpNearbyWxDevice
{
}

- (void)_dumpSrWxDevice
{
}

- (id)_findActiveWxDevice
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100019A08;
  uint64_t v10 = sub_100019A18;
  id v11 = 0LL;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003AAD0;
  v5[3] = &unk_100206B10;
  void v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_isDevicePairedCheck:(id)a3
{
  id v3 = a3;
  id v4 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.icloudpairing");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSService devices](v4, "devices"));
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v27 = v4;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = obj;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 publicAddressForIDSDevice:v12]);

        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = NSDataWithHex([v14 UTF8String], -1, 22, 0, 0);
          id v16 = objc_claimAutoreleasedReturnValue(v15);
          unint64_t v17 = (char *)[v16 bytes];
          if (v17)
          {
            uint64_t v18 = v17;
            if (dword_100234408 <= 30
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
            {
              id v19 = v3;
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 modelIdentifier]);
              int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isDevicePairedCheck:]",  30LL,  "Evaluator: comparing, Wx: %@, IDS: %@, Model: %u, name: %@",  v19,  v16,  v20,  v21);

              id v3 = v19;
              uint64_t v8 = obj;
            }

            __int128 v22 = (unsigned __int16 *)[v3 bytes];
            if (*v22 == *(unsigned __int16 *)(v18 + 3) && *((unsigned __int8 *)v22 + 2) == v18[5])
            {

              BOOL v24 = 1;
              goto LABEL_21;
            }
          }
        }
      }

      id v6 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    BOOL v24 = 0;
LABEL_21:
    id v4 = v27;
  }

  else
  {
    BOOL v24 = 0;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v25 = "no";
    if (v24) {
      id v25 = "yes";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isDevicePairedCheck:]",  30LL,  "Evaluator: Found paired Device %s",  v25);
  }

  return v24;
}

- (BOOL)_isOnDemandConnectInProgress
{
  return -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type") == 2;
}

- (BOOL)_isConnectionTipiv2
{
  return -[SmartRoutingConnectConfig type](self->_phase1ConnectConfig, "type") == 3;
}

- (id)_getActiveNearbyWxAdress
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100019A08;
  uint64_t v10 = sub_100019A18;
  id v11 = 0LL;
  srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003B00C;
  v5[3] = &unk_1002072B8;
  void v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( srDiscoveredDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getCurrentRoute
{
  if (self->_isBTRoute) {
    return @"Bluetooth";
  }
  if (self->_isSpeakerRoute) {
    return @"Speaker";
  }
  if (self->_isBuiltInReceiverRoute) {
    return @"Receiver";
  }
  return @"NA";
}

- (BOOL)_getForceDisconnectBit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v4));
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 advertisementFields]);

      BOOL v9 = CFDictionaryGetInt64(v8, @"srConnected", 0LL) != 0;
    }

    else
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _getForceDisconnectBit:]",  30LL,  "Couldn't find Wx SfDevice with uuid %@",  v4);
      }

      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_getIDSDeviceFromBtAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.icloudpairing");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v4, "devices"));
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v14 = v4;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 publicAddressForIDSDevice:v11]);

          if (v12 && ([v12 isEqualToString:v3] & 1) != 0)
          {
            id v6 = v9;

            goto LABEL_16;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }

- (id)_getInEarSrWxDevice
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_100019A08;
  uint64_t v10 = sub_100019A18;
  id v11 = 0LL;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003B4A0;
  v5[3] = &unk_100206AC0;
  void v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getJsonStringFromDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  a3,  1LL,  0LL));
  id v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);

  return v4;
}

- (int64_t)_getRssiNearby:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wxDevices, "objectForKeyedSubscript:", v4));
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
      id v8 = [v7 rssi];
    }

    else
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _getRssiNearby:]",  30LL,  "Couldn't find Wx SfDevice with uuid %@",  v4);
      }

      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (void)getSmartRoutingStateForDeviceAddress:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003B6B4;
  v7[3] = &unk_100206358;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)_getWxChipVersion:(unsigned int)a3
{
  if (a3 - 8194 > 0x24) {
    return @"NA";
  }
  else {
    return (id)*((void *)&off_100207770 + (int)(a3 - 8194));
  }
}

- (unsigned)_getWxColorCode:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = -1;
  wxDevices = self->_wxDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003B95C;
  v13[3] = &unk_1002072E0;
  id v6 = v4;
  id v14 = v6;
  __int128 v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  int v7 = *((unsigned __int8 *)v17 + 24);
  if (v7 == 255)
  {
    connectedDevices = self->_connectedDevices;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003BAE8;
    v10[3] = &unk_100206BD8;
    id v11 = v6;
    uint64_t v12 = &v16;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( connectedDevices,  "enumerateKeysAndObjectsUsingBlock:",  v10);

    LOBYTE(v7) = *((_BYTE *)v17 + 24);
  }

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_getWxFWVersion:(id)a3
{
  id v4 = a3;
  wxFirmwareCache = self->_wxFirmwareCache;
  if (!wxFirmwareCache)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v7 = self->_wxFirmwareCache;
    self->_wxFirmwareCache = v6;

    wxFirmwareCache = self->_wxFirmwareCache;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](wxFirmwareCache, "objectForKeyedSubscript:", v4));

  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_wxFirmwareCache,  "objectForKeyedSubscript:",  v4));
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 btAddressData]);
          uint64_t v18 = CUPrintNSDataAddress(v17);
          char v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          if (v4)
          {
            if (v19)
            {
              if ([v4 isEqualToString:v19])
              {
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 firmwareVersion]);
                unsigned __int8 v21 = [v20 isEqualToString:@"0.0.1"];

                if ((v21 & 1) == 0)
                {
                  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v16 firmwareVersion]);
                  if (dword_100234408 <= 30
                    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
                  {
                    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _getWxFWVersion:]",  30LL,  "Airpods fw version is %@, pairing record %@",  v9,  v16,  (void)v23);
                  }

                  goto LABEL_22;
                }
              }
            }
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    BOOL v9 = 0LL;
LABEL_22:
  }

  return v9;
}

- (unsigned)_getWxProductID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btAddressData", (void)v15));
          uint64_t v12 = CUPrintNSDataAddress(v11);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

          if (v13 && ([v4 isEqualToString:v13] & 1) != 0)
          {
            LODWORD(v7) = [v10 productID];

            goto LABEL_14;
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)handleActivityScoreUpdate:(int)a3
{
  int score = self->_score;
  if (score != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        int score = self->_score;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon handleActivityScoreUpdate:]",  30LL,  "Tipi score changed from %d -> %d ",  score,  a3);
    }

- (void)_handleCallStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C0AC;
  v7[3] = &unk_100206358;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_handleMediaPlayStateChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C240;
  v7[3] = &unk_100206358;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_handleMediaPauseStateChanged
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]",  30LL,  "Handle _handleMediaPauseStateChanged");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AAConversationDetectSessionManager sharedCDSessionManager]( &OBJC_CLASS___AAConversationDetectSessionManager,  "sharedCDSessionManager"));
  unsigned int v4 = [v3 cdSignalAudioInterrupted];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AAConversationDetectSessionManager sharedCDSessionManager]( &OBJC_CLASS___AAConversationDetectSessionManager,  "sharedCDSessionManager"));
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 currentCDDeviceIdentifier]);
    cdDeviceIdentifier = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = v6;

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]",  30LL,  "cdDeviceIdentifier: %@",  self->_cdDeviceIdentifier);
    }
  }

  else
  {
    id v8 = self->_cdDeviceIdentifier;
    self->_cdDeviceIdentifier = 0LL;

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleMediaPauseStateChanged]",  30LL,  "cdDeviceIdentifier is nil!");
    }
  }

- (void)_handleHighestAudioCategoryChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C5C4;
  v7[3] = &unk_100206358;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_handleHRMSessionChanged:(BOOL)a3
{
  if (a3)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _handleHRMSessionChanged:]", 30LL, "HRM session started");
    }

    if (-[BTSmartRoutingDaemon _isAnyHRMEnabledDeviceConnected](self, "_isAnyHRMEnabledDeviceConnected"))
    {
      if (!self->_isActiveHRMSession)
      {
        self->_int score = 7;
        -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
        self->_isActiveHRMSession = 1;
      }
    }
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _handleHRMSessionChanged:]", 30LL, "HRM session ended");
    }

    if (self->_isActiveHRMSession)
    {
      self->_isActiveHRMSession = 0;
      -[BTSmartRoutingDaemon _nearbyInfoSetAudioRoutingScore](self, "_nearbyInfoSetAudioRoutingScore");
    }
  }

- (void)_handleMediaServerConnectionDied:(id)a3
{
}

- (void)_handleHijackBlockingwithDevice:(id)a3
{
  id v4 = a3;
  if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
  {
    p_hijackBackOffTimer = &self->_hijackBackOffTimer;
    hijackBackOffTimer = self->_hijackBackOffTimer;
    if (hijackBackOffTimer)
    {
      id v7 = hijackBackOffTimer;
      dispatch_source_cancel(v7);
      id v8 = *p_hijackBackOffTimer;
      *p_hijackBackOffTimer = 0LL;
    }

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_hijackBackOffTimer, v9);
    self->_hijackBackoffCount = 0;
    uint64_t v10 = self->_hijackBackOffTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003CA38;
    handler[3] = &unk_100206490;
    void handler[4] = v9;
    void handler[5] = self;
    id v11 = v4;
    id v15 = v11;
    dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
    dispatch_time_t v12 = dispatch_time(0x8000000000000000LL, 1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds);
    dispatch_source_set_timer( (dispatch_source_t)self->_hijackBackOffTimer,  v12,  1000000000 * self->_prefSmartRoutingBlockHijackWindowinSeconds,  0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_hijackBackOffTimer);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
    [v13 _setHijackBackoffTick:mach_absolute_time()];

    self->_BOOL hijackBackOffInitiator = 1;
    -[BTSmartRoutingDaemon _updateLocalAudioCategory:]( self,  "_updateLocalAudioCategory:",  self->_localDeviceAudioCatogory);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleHijackBlockingwithDevice:]",  30LL,  "Start hijackblocking backoff timer");
    }
  }
}

- (void)_handlePhoneOwnershipTriangleTimer
{
  uint64_t v18 = 0LL;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned __int8 v21 = sub_100019A08;
  __int128 v22 = sub_100019A18;
  id v23 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003CF9C;
  v17[3] = &unk_100206B38;
  v17[4] = self;
  v17[5] = &v18;
  id v3 = objc_retainBlock(v17);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  id v5 = v4;
  if (!v4)
  {
    uint64_t v10 = v19;
    id v6 = (void *)v19[5];
    id v11 = @"Couldn't find inEar Wx";
LABEL_15:
    void v10[5] = (uint64_t)v11;
    goto LABEL_12;
  }

  if ([v4 proactiveRoutingBackoff])
  {
    uint64_t v10 = v19;
    id v6 = (void *)v19[5];
    id v11 = @"Proactive Routing backoff is in effect!";
    goto LABEL_15;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceAddress]);
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Already routed: %@",  v6);
  if ([v5 routed])
  {
    dispatch_time_t v12 = v19;
    id v13 = v7;
    uint64_t v14 = (void *)v12[5];
    void v12[5] = (uint64_t)v13;
  }

  else
  {
    if ([v5 otherTipiDeviceIsWatch])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);

      if (v8)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handlePhoneOwnershipTriangleTimer]",  30LL,  "PhoneTriangleOwnershipTimer: Taking the route");
        }

        self->_proactiveRoutingInProgress = 1;
        dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v6,  @"-tacl"));
        -[BTSmartRoutingDaemon _smartRoutingChangeRoute:](self, "_smartRoutingChangeRoute:", v9);

        -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  &off_100218D00,  v6,  0LL);
        -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 12LL);
        goto LABEL_11;
      }

      id v15 = v19;
      uint64_t v14 = (void *)v19[5];
      __int128 v16 = @"Not in Tipi";
    }

    else
    {
      id v15 = v19;
      uint64_t v14 = (void *)v19[5];
      __int128 v16 = @"Other tipi device is not watch";
    }

    v15[5] = (uint64_t)v16;
  }

LABEL_11:
LABEL_12:

  ((void (*)(void *))v3[2])(v3);
  _Block_object_dispose(&v18, 8);
}

- (void)_handleProactiveRoutingRouteCheck:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  if (([v4 isEqualToString:@"Bluetooth"] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    if (v5)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleProactiveRoutingRouteCheck:]",  30LL,  "ProactiveRouting: Backoff proactive routing for %@ current route %@",  v6,  v4);
      }

      [v5 setProactiveRoutingBackoff:1];
    }
  }
}

- (void)_handleSmartRoutingDisabled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    if (v5)
    {
      -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesInEarCache,  "objectForKeyedSubscript:",  v4));
      unsigned int v9 = [v8 BOOLValue];

      unsigned int v10 = -[BTSmartRoutingDaemon _isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:]( self,  "_isOtherTipiDeviceBeforeTrain:withIOS:withMacOS:",  v7,  16LL,  13LL);
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        unsigned int v11 = [v5 routed];
        dispatch_time_t v12 = "no";
        if (v11) {
          id v13 = "yes";
        }
        else {
          id v13 = "no";
        }
        if (v9) {
          uint64_t v14 = "yes";
        }
        else {
          uint64_t v14 = "no";
        }
        if (v10) {
          dispatch_time_t v12 = "yes";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]",  30LL,  "SR disabled: routed %s otherTipi %@ inEar %s isOtherTipiLegacyBuild %s",  v13,  v7,  v14,  v12);
      }

      if ([v5 otherTipiDeviceIsWatch])
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]",  30LL,  "SR disabled: Other tipi device is watch; do not disconnect either device");
        }
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);
        int v16 = v9 ^ 1;
        if (!v15) {
          int v16 = 1;
        }
        int v17 = v16 | v10;

        if (v17 == 1)
        {
LABEL_26:
          -[BTSmartRoutingDaemon _disconnectOtherTipiDevice:](self, "_disconnectOtherTipiDevice:", v4);
        }

        else
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]",  30LL,  "SR disabled: Not routed, ask the other Tipi device to disconnect ME");
          }

          __int128 v22 = @"disableSmartRouting";
          id v23 = v6;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
          char v19 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);
          -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v18,  v4,  v19);

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
          if (!v20)
          {
            unsigned __int8 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[BTSmartRoutingSourceDevice setIsFirstConnectionAfterSREnable:]( self->_sourceDevice,  "setIsFirstConnectionAfterSREnable:",  v21);
          }

          -[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:]( self,  "_setIsFirstConnentionAfterSREnable:forDevice:",  1LL,  v4);
        }
      }
    }

    else if (dword_100234408 <= 30 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _handleSmartRoutingDisabled:]",  30LL,  "SR disabled: srWxDevice %@ not found",  v4);
    }
  }
}

- (void)_hijackBackoffReset:(id)a3 withReason:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _hijackBackoffReset:withReason:]",  30LL,  "Hijackblocking: Reset hijackBackOffTimer for wx %@ with reason %@",  v11,  v6);
  }
  -[BTSmartRoutingDaemon _submitHijackBlockMetric:withReason:](self, "_submitHijackBlockMetric:withReason:", v11, v6);
  hijackBackOffTimer = self->_hijackBackOffTimer;
  if (hijackBackOffTimer)
  {
    id v8 = hijackBackOffTimer;
    dispatch_source_cancel(v8);
    unsigned int v9 = self->_hijackBackOffTimer;
    self->_hijackBackOffTimer = 0LL;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
  [v10 _setHijackBackoffTick:0];

  self->_BOOL hijackBackOffInitiator = 0;
  -[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]( self,  "_sendAudioCategory:withAudioCategory:",  v11,  self->_localDeviceAudioCatogory);
}

- (BOOL)_isAnyWxStream
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003D660;
  v5[3] = &unk_100206B10;
  void v5[4] = self;
  void v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAddDeviceToBackoffDueToDisconnect
{
  unint64_t smartRoutingDisconnectReason = self->_smartRoutingDisconnectReason;
  return smartRoutingDisconnectReason == 10720 || smartRoutingDisconnectReason == 328;
}

- (BOOL)_isForceRejectPipe
{
  return self->_prefSmartRoutingForceRejectLePipe;
}

- (BOOL)_isForceTipiv2
{
  return self->_prefSmartRoutingForceTipiv2;
}

- (BOOL)_isEligibleForTipiV2:(id)a3 firstDeviceTipiScore:(int)a4 secondDeviceTipiScore:(int)a5 currentDeviceScore:(int)a6 sourceDeviceCount:(unsigned int)a7 isOnDemandConnect:(BOOL)a8 address:(id)a9 lastConnectedHost:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v17));
  char v19 = v18;
  if (v18)
  {
    unsigned int v39 = a7;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 address]);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      else {
        unsigned __int8 v21 = off_1002079F0[a4];
      }
      BOOL v37 = v21;
      else {
        __int128 v22 = off_1002079F0[a5];
      }
      unsigned int v36 = v22;
      int v38 = a5;
      else {
        id v23 = off_1002079F0[a6];
      }
      unsigned __int8 v35 = v23;
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v20]);
      if (v10) {
        __int128 v26 = "yes";
      }
      else {
        __int128 v26 = "no";
      }
      unint64_t v27 = (unint64_t)[v19 audioState];
      if (v27 > 3) {
        uint64_t v28 = "?";
      }
      else {
        uint64_t v28 = off_100207970[v27];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:source DeviceCount:isOnDemandConnect:address:lastConnectedHost:]",  30LL,  "Evaluator: Evaluating Tipi2.0 eligibility: address %@, identifier %@, fwVersion %@, tipiScore1 %s, tipiScore2 %s , inScore %s, first connection after SR enable %@, connectForCallA2DP %s, wx streaming state %s",  v20,  v17,  v16,  v37,  v36,  v35,  v25,  v26,  v28);

      a5 = v38;
      if (v10) {
        goto LABEL_43;
      }
    }

    else if (v10)
    {
      goto LABEL_43;
    }

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v20]);

    if (!v30)
    {
      if (!v16
        || [@"5A187" compare:v16 options:64] != (id)-1
        || !-[BTSmartRoutingDaemon _isForceTipiv2](self, "_isForceTipiv2"))
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          if (self->_prefSmartRoutingForceTipiv2) {
            __int128 v32 = "yes";
          }
          else {
            __int128 v32 = "no";
          }
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isEligibleForTipiV2:firstDeviceTipiScore:secondDeviceTipiScore:currentDeviceScore:so urceDeviceCount:isOnDemandConnect:address:lastConnectedHost:]",  30LL,  "Evaluator: Tipi 2.0 failing firmware version check fwVersion %@, _prefSmartRoutingForceTipiv2 %s",  v16,  v32);
        }

        goto LABEL_43;
      }

      if (v39 != 1)
      {
        BOOL v31 = 0;
        goto LABEL_44;
      }

      BOOL v31 = (a4 - 1) < 7;
      if (a4 != 12)
      {
LABEL_44:

        goto LABEL_45;
      }

      if ([v19 outOfCaseTime] <= 2)
      {
        BOOL v31 = [v19 audioState] == 0;
        goto LABEL_44;
      }
    }

- (BOOL)_isEligibleForPreemptiveBanner:(BOOL)a3 firstPreemptiveBanner:(BOOL)a4 inEarState:(BOOL)a5 srDeviceCount:(unint64_t)a6 audioState:(int64_t)a7 inAddress:(id)a8
{
  BOOL v10 = a4;
  id v13 = a8;
  if (a3 || v10)
  {
    uint64_t v18 = @"Preemptive Banner shown already";
    goto LABEL_13;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v13));

  if (v14)
  {
    uint64_t v18 = @"Device already connected";
    goto LABEL_13;
  }

  if (-[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue") >= 201
    && !-[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress"))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_localDeviceAudioCatogory check failed, _localDeviceAudioCatogory : %u",  -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue")));
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v22);
LABEL_27:

    goto LABEL_14;
  }

  if (self->_playbackStart && !self->_playbackStartTimer)
  {
    uint64_t v18 = @"Playback start timer has expired";
LABEL_13:
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v18);
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }

  if (!a5)
  {
    uint64_t v18 = @"inEar state is NO";
    goto LABEL_13;
  }

  if (a7 >= 2)
  {
    uint64_t v20 = "?";
    if (a7 == 2) {
      uint64_t v20 = "HFP Call";
    }
    if (a7 == 3) {
      unsigned __int8 v21 = "HFP Other";
    }
    else {
      unsigned __int8 v21 = v20;
    }
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v21));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"audioState is %@",  v22));
    -[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:](self, "_logPreemptiveBannerEvalError:", v23);

    goto LABEL_27;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srBudswapDeviceMap,  "objectForKeyedSubscript:",  v13));
  unsigned int v16 = [v15 reconnectionState];

  if (v16 == 1)
  {
    uint64_t v18 = @"Budswap reconnection";
    goto LABEL_13;
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)_isInEarToOutOfEar:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 btAddressData]);
  uint64_t v6 = CUPrintNSDataAddress(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v7));
  unsigned __int8 v9 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:]( self,  "_bluetoothProductIDNoEarDetect:",  [v8 productID]);

  BOOL v10 = (v9 & 1) == 0
     && -[BTSmartRoutingDaemon _inEarConnectedCheck:](self, "_inEarConnectedCheck:", v7)
     && [v4 primaryPlacement] != 1
     && [v4 secondaryPlacement] != 1;

  return v10;
}

- (BOOL)isInAnyTipi
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003DDC4;
  v5[3] = &unk_100206B10;
  void v5[4] = self;
  void v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInTipi
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003DFE0;
  v5[3] = &unk_100206AC0;
  void v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_inEarConnectedCheck:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
    if (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:]( self,  "_bluetoothProductIDNoEarDetect:",  [v6 productID]))
    {
      BOOL v7 = 1;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
      if ([v8 primaryPlacement] == 1)
      {
        BOOL v7 = 1;
      }

      else
      {
        char v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
        if ([v9 secondaryPlacement] == 1)
        {
          BOOL v7 = 1;
        }

        else
        {
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
          if ([v10 primaryPlacement] == 7)
          {
            BOOL v7 = 1;
          }

          else
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
            BOOL v7 = [v11 secondaryPlacement] == 7;
          }
        }
      }
    }

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      if (v7) {
        dispatch_time_t v12 = "yes";
      }
      else {
        dispatch_time_t v12 = "no";
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
      unsigned int v14 = [v13 primaryPlacement];
      if (v14 > 7) {
        id v15 = "?";
      }
      else {
        id v15 = off_100207910[v14];
      }
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
      unsigned int v17 = [v16 secondaryPlacement];
      if (v17 > 7) {
        uint64_t v18 = "?";
      }
      else {
        uint64_t v18 = off_100207910[v17];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _inEarConnectedCheck:]",  30LL,  "SmartRouting CONNECTED STATE shows inEar: %s for device %@ primary:%s secondary:%s",  v12,  v4,  v15,  v18);
    }
  }

  else
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _inEarConnectedCheck:]",  90LL,  "SmartRouting have not found connected Wx device, assume not routed");
    }

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_inEarNearbyCheck:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  __int128 v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  wxDevices = self->_wxDevices;
  char v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10003E40C;
  dispatch_time_t v12 = &unk_100207308;
  id v6 = v4;
  id v13 = v6;
  unsigned int v14 = self;
  id v15 = &v21;
  unsigned int v16 = &v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wxDevices, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (!*((_BYTE *)v18 + 24)
    && dword_100234408 <= 90
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _inEarNearbyCheck:]",  90LL,  "SmartRouting have not found nearby Wx device, assume routing is NO",  v9,  v10,  v11,  v12);
  }

  char v7 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

- (BOOL)_inCaseLidClosed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  if (v6)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    uint64_t v8 = v7;
    if (v7)
    {
      else {
        unsigned int v9 = 0;
      }
      unsigned int v10 = [v8 lidClosed];
    }

    else
    {
      unsigned int v10 = 0;
      unsigned int v9 = 0;
    }

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v11 = "no";
      if (v9) {
        dispatch_time_t v12 = "yes";
      }
      else {
        dispatch_time_t v12 = "no";
      }
      if (v10) {
        id v11 = "yes";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _inCaseLidClosed:]",  30LL,  "_inCaseLidClose: device %@ prox status shows buds in case: %s, lid status: %s",  v4,  v12,  v11);
    }

    char v13 = v9 & v10;
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_isAnyConnectedWxInEarCheck
{
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003E80C;
  v5[3] = &unk_100206BD8;
  void v5[4] = self;
  void v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAllWxEnabledInEarDetection
{
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003E96C;
  v5[3] = &unk_100206B10;
  void v5[4] = self;
  void v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAnyHRMEnabledDeviceConnected
{
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  connectedDevices = self->_connectedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003EA54;
  v5[3] = &unk_100206A70;
  void v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isInEarDetectionDisabled:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = v5;
  if (v5
    && (-[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:]( self,  "_bluetoothProductIDNoEarDetect:",  [v5 productID])
     || [v6 primaryPlacement] == 7
     || [v6 secondaryPlacement] == 7))
  {
    if (dword_100234408 > 30)
    {
      BOOL v7 = 1;
    }

    else
    {
      if (dword_100234408 == -1)
      {
        BOOL v7 = 1;
      }

      else
      {
        BOOL v7 = 1;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _isInEarDetectionDisabled:]",  30LL,  "Device %@ IED disabled",  v4);
    }
  }

  else if (dword_100234408 > 30)
  {
    BOOL v7 = 0;
  }

  else
  {
    if (dword_100234408 == -1)
    {
      BOOL v7 = 0;
    }

    else
    {
      BOOL v7 = 0;
    }

    LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _isInEarDetectionDisabled:]", 30LL, "Device %@ IED enabled", v4);
  }

- (BOOL)_isManualConnection:(id)a3
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = ((unint64_t)[v3 deviceFlags] >> 18) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isMyAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _myBluetoothAddressString]( self, "_myBluetoothAddressString"));
    uint64_t v6 = (const char *)[v5 UTF8String];
    if (!v6) {
      uint64_t v6 = "";
    }
    uint64_t v7 = NSDataWithHex(v6, -1LL, 22LL, 0LL, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ([v8 length] == (id)6)
    {
      char v9 = (char *)[v8 bytes];
      unsigned int v10 = (unsigned __int16 *)[v4 bytes];
      BOOL v12 = *v10 == *(unsigned __int16 *)(v9 + 3) && *((unsigned __int8 *)v10 + 2) == v9[5];
    }

    else
    {
      if (dword_100234408 <= 90
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      {
        LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _isMyAddress:]", 90LL, "Address length not correct");
      }

      BOOL v12 = 0;
    }
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _isMyAddress:]", 30LL, "lastRoutedHost is null");
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_isOtherTipiDeviceBeforeTrain:(id)a3 withIOS:(unsigned int)a4 withMacOS:(unsigned int)a5
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.icloudpairing");
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v8, "devices"));
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v21 = v8;
      uint64_t v11 = *(void *)v26;
      uint64_t v22 = a5;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          char v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 publicAddressForIDSDevice:v15]);

          if (v16 && [v16 isEqualToString:v7])
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 productName]);
            if ([v17 isEqualToString:@"iPhone OS"])
            {
              if (v13)
              {
                [v13 operatingSystemVersion];
                uint64_t v18 = v24;
              }

              else
              {
                uint64_t v18 = 0LL;
                uint64_t v24 = 0LL;
              }

              if (v18 < a4)
              {

LABEL_27:
                LOBYTE(v10) = 1;
                goto LABEL_28;
              }
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 modelIdentifier]);
            if ([v19 containsString:@"Mac"])
            {
              if (v13)
              {
                [v13 operatingSystemVersion];
                char v13 = v23;
              }

              else
              {
                uint64_t v23 = 0LL;
              }
            }

            else
            {
            }
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }

- (BOOL)_isReceivedLegacyTipiConnect:(id)a3
{
  return -[NSString isEqualToString:](self->_tipiElectionReceivedLePipe, "isEqualToString:", a3);
}

- (void)_iPhoneScreenOnPowerEvent
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    if (self->_uiSmartRoutingBanner) {
      char v3 = @"YES";
    }
    else {
      char v3 = @"NO";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]",  30LL,  "Smart Routing Screen On. Existing banner %@",  v3);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTBannerUISession trailingAccessoryText](self->_uiSmartRoutingBanner, "trailingAccessoryText"));
  unsigned int v5 = [v4 isEqualToString:@"Reverse"];

  if (v5)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      uint64_t v6 = "Screen on, not showing connected banner since reverse is shown";
LABEL_16:
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30LL, v6);
      return;
    }

    return;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTBannerUISession centerContentItemsText](self->_uiSmartRoutingBanner, "centerContentItemsText"));
  unsigned int v8 = [v7 isEqualToString:@"Connected"];

  if (!v8)
  {
    uint64_t v32 = 0LL;
    unsigned int v33 = &v32;
    uint64_t v34 = 0x3032000000LL;
    unsigned __int8 v35 = sub_100019A08;
    unsigned int v36 = sub_100019A18;
    id v37 = 0LL;
    uint64_t v26 = 0LL;
    __int128 v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    __int128 v29 = sub_100019A08;
    __int128 v30 = sub_100019A18;
    id v31 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10003F478;
    v22[3] = &unk_100206B10;
    v22[4] = self;
    v22[5] = &v32;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v22);
    if (!v33[5]) {
      goto LABEL_37;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 deviceName]);
    BOOL v12 = (void *)v27[5];
    void v27[5] = v11;

    char v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v33[5]));
    unsigned int v14 = [v13 productID];
    *((_DWORD *)v24 + 6) = v14;

    if (!v33[5])
    {
LABEL_37:
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _iPhoneScreenOnPowerEvent]", 30LL, "No inEar SR device");
      }

      connectedDevices = self->_connectedDevices;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10003F644;
      v21[3] = &unk_100207330;
      v21[4] = self;
      v21[5] = &v32;
      v21[6] = &v26;
      v21[7] = &v23;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( connectedDevices,  "enumerateKeysAndObjectsUsingBlock:",  v21);
      if (!v33[5]) {
        goto LABEL_34;
      }
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:"));
    if (!v16) {
      goto LABEL_34;
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v33[5]));
    if ([v17 hijackBackoffTicks])
    {
      BOOL isBTRoute = self->_isBTRoute;

      if (!isBTRoute) {
        goto LABEL_34;
      }
    }

    else
    {
    }

    dispatchQueueAVSys = (dispatch_queue_s *)self->_dispatchQueueAVSys;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003F77C;
    block[3] = &unk_100207358;
    void block[4] = self;
    void block[5] = &v32;
    dispatch_async(dispatchQueueAVSys, block);
LABEL_34:
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    return;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t v6 = "Screen on, not showing connected banner since one is shown already";
    goto LABEL_16;
  }

- (BOOL)_lastConnectIsWatchCheck:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  if (v4)
  {
    nearbyInfoDevices = self->_nearbyInfoDevices;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10003FA14;
    v9[3] = &unk_1002072E0;
    id v10 = v4;
    uint64_t v11 = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v9);
    LODWORD(nearbyInfoDevices) = *((unsigned __int8 *)v13 + 24);

    BOOL v7 = (_DWORD)nearbyInfoDevices != 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_logEvalError:(id)a3
{
  uint64_t v4 = mach_absolute_time();
  -[BTSmartRoutingSourceDevice setEvalTicks:](self->_sourceDevice, "setEvalTicks:", v4);
}

- (void)_logPreemptiveBannerEvalError:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1 || (v5 = _LogCategory_Initialize(&dword_100234408, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _logPreemptiveBannerEvalError:]",  30LL,  "Preemptive banner error: %@",  v4);
      id v4 = v6;
    }
  }

  -[BTSmartRoutingSourceDevice setEvalPreemptiveBannerResult:]( self->_sourceDevice,  "setEvalPreemptiveBannerResult:",  v4);
}

- (void)_logEvalWxError:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));

    if (!v7)
    {
      unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[BTSmartRoutingSourceDevice setEvalWxMap:](self->_sourceDevice, "setEvalWxMap:", v8);
    }

    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    id v10 = (SmartRoutingWxInfo *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);

    if (!v10) {
      id v10 = objc_alloc_init(&OBJC_CLASS___SmartRoutingWxInfo);
    }
    -[SmartRoutingWxInfo setLastEvalResult:](v10, "setLastEvalResult:", v6);
    -[SmartRoutingWxInfo setLastEvalTicks:](v10, "setLastEvalTicks:", mach_absolute_time());
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice evalWxMap](self->_sourceDevice, "evalWxMap"));
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (double)_lowestBatteryInfoForCBDevice:(id)a3
{
  id v4 = a3;
  if (-[BTSmartRoutingDaemon _bluetoothProductIDNoUTP:]( self,  "_bluetoothProductIDNoUTP:",  [v4 productID]))
  {
    [v4 batteryLevelMain];
    if (v5 == 0.0)
    {
      double v7 = 0.0;
    }

    else
    {
      [v4 batteryLevelMain];
      double v7 = v6;
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]",  30LL,  "cbDevice found main battery, LowestBatteryInfo: %f");
      }
    }

    goto LABEL_27;
  }

  [v4 batteryLevelLeft];
  if (v8 != 0.0)
  {
    [v4 batteryLevelRight];
    if (v9 != 0.0)
    {
      [v4 batteryLevelLeft];
      float v11 = v10;
      [v4 batteryLevelRight];
      id v12 = v4;
      if (v11 <= v13) {
        goto LABEL_17;
      }
      goto LABEL_11;
    }
  }

  [v4 batteryLevelRight];
  id v12 = v4;
  if (v14 != 0.0)
  {
LABEL_11:
    [v12 batteryLevelRight];
    double v7 = v15;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]",  30LL,  "cbDevice found right battery, LowestBatteryInfo: %f");
    }

    goto LABEL_27;
  }

  [v4 batteryLevelLeft];
  if (v16 != 0.0)
  {
    id v12 = v4;
LABEL_17:
    [v12 batteryLevelLeft];
    double v7 = v17;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]",  30LL,  "cbDevice found left battery, LowestBatteryInfo: %f");
    }

    goto LABEL_27;
  }

  double v7 = 0.0;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowestBatteryInfoForCBDevice:]",  30LL,  "no battery level found for cbDevice , LowestBatteryInfo: %f");
  }
LABEL_27:

  return v7;
}

- (double)_lowestBatteryInfoForSFDevice:(id)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 batteryInfo]);
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 1.1;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        float v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        [v10 batteryLevel];
        double v12 = v11;
        if (-[BTSmartRoutingDaemon _checkValidBatteryValue:](self, "_checkValidBatteryValue:", v10)) {
          BOOL v13 = v12 < v8;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13 && v12 != 0.0)
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            float v14 = (char *)[v10 batteryType];
            float v15 = "?";
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:]",  30LL,  "wxDevice found %s battery, LowestBatteryInfo: %f",  v15,  v12);
          }

          double v8 = v12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  else
  {
    double v8 = 1.1;
  }

  return v8;
}

- (void)_nearbyDeviceInfoTriangleRecoveryTimer
{
  dispatch_time_t v3 = dispatch_time(0LL, 120000000000LL);
  unint64_t prefSmartRoutingWatchTriangleMagnet = self->_prefSmartRoutingWatchTriangleMagnet;
  if (prefSmartRoutingWatchTriangleMagnet)
  {
    dispatch_time_t v5 = dispatch_time(0x8000000000000000LL, 1000000000 * prefSmartRoutingWatchTriangleMagnet);
  }

  else
  {
    dispatch_time_t v5 = v3;
    LODWORD(prefSmartRoutingWatchTriangleMagnet) = 120;
  }

  if (self->_nearbyInfoDevicesTriangleRecoveryTimer)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer]",  30LL,  "TriangleRecovery: Skip, timer exists");
    }
  }

  else
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = v6;

    double v8 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000402DC;
    handler[3] = &unk_100206058;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyDeviceInfoTriangleRecoveryTimer]",  30LL,  "TriangleRecovery: Start in %us",  prefSmartRoutingWatchTriangleMagnet);
    }

    dispatch_source_set_timer( (dispatch_source_t)self->_nearbyInfoDevicesTriangleRecoveryTimer,  v5,  0xFFFFFFFFFFFFFFFFLL,  0LL);
    dispatch_resume((dispatch_object_t)self->_nearbyInfoDevicesTriangleRecoveryTimer);
  }

- (void)_nearbyDeviceInfoCheck
{
  if (self->_nearbyInfoDiscovery && !self->_tipiElectionInProgress)
  {
    uint64_t v10 = 0LL;
    double v11 = &v10;
    uint64_t v12 = 0x2020000000LL;
    char v13 = 0;
    if (-[NSMutableDictionary count](self->_nearbyInfoDevices, "count") == (id)1)
    {
      nearbyInfoDevices = self->_nearbyInfoDevices;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100040640;
      v9[3] = &unk_100206A98;
      void v9[4] = &v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoDevices,  "enumerateKeysAndObjectsUsingBlock:",  v9);
    }

    if (*((_BYTE *)v11 + 24))
    {
      smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      void v8[2] = sub_1000406F4;
      v8[3] = &unk_100206F58;
      v8[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v8);
    }

    nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    if (nearbyInfoDevicesTriangleRecoveryTimer)
    {
      id v6 = nearbyInfoDevicesTriangleRecoveryTimer;
      dispatch_source_cancel(v6);
      uint64_t v7 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
      self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
    }

    _Block_object_dispose(&v10, 8);
  }

- (id)_nearbyMacAddressTranslate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 publicAddressForIDSDevice:v5]);

    if (v7)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]",  30LL,  "Evaluator: publicDeviceAddress %@",  v7);
      }

      uint64_t v8 = NSDataWithHex([v7 UTF8String], -1, 22, 0, 0);
      float v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }

      else if (dword_100234408 <= 90 {
             && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      }
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]",  90LL,  "Evaluator: Translation of public address mapping for %@ failed.",  0LL);
      }
    }

    else
    {
      if (dword_100234408 <= 90
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]",  90LL,  "Evaluator: No public address mapping for %@",  v5);
      }

      uint64_t v10 = 0LL;
    }
  }

  else
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:]",  90LL,  "Evaluator: Skip translation. Ids ID is null");
    }

    uint64_t v10 = 0LL;
  }

  return v10;
}

- (int)_nearbyDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"iPhone"])
  {
    int v4 = 1;
  }

  else if ([v3 containsString:@"iPad"])
  {
    int v4 = 2;
  }

  else if ([v3 containsString:@"Mac"])
  {
    int v4 = 3;
  }

  else if ([v3 containsString:@"Watch"])
  {
    int v4 = 4;
  }

  else if ([v3 containsString:@"iPod"])
  {
    int v4 = 5;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_nearbyWxChanged:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    if (!self->_nearbyWxDeviceMap)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      nearbyWxDeviceMap = self->_nearbyWxDeviceMap;
      self->_nearbyWxDeviceMap = v7;
    }

    float v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementFields]);
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v10, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 advertisementFields]);
    uint64_t v14 = CFDictionaryGetInt64Ranged(v13, @"pid", 0LL, 0xFFFFFFFFLL, 0LL);

    float v15 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    float v16 = (void *)objc_claimAutoreleasedReturnValue([v15 advertisementFields]);

    uint64_t v65 = CFDictionaryGetInt64Ranged(v16, @"asCount", 0LL, 0xFFFFFFFFLL, 0LL);
    uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v16, @"lch", 3LL, 0LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(CFDataOfLength);
    uint64_t v19 = CFDictionaryGetCFDataOfLength(v16, @"publicAddress", 6LL, 0LL);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v74 = v4;
    unint64_t v68 = v20;
    if (v20)
    {
      uint64_t v21 = NSPrintF("%.6a", COERCE_DOUBLE([v20 bytes]));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    int v23 = CFDictionaryGetInt64Ranged(v16, @"aState", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
    uint64_t v63 = v14;
    uint64_t Int64 = CFDictionaryGetInt64(v16, @"paired", 0LL);
    int v58 = CFDictionaryGetInt64Ranged(v16, @"lc", 0LL, 0xFFFFFFFFLL, 0LL);
    if ((Int64Ranged & 0x24) != 0) {
      unsigned int v56 = 1;
    }
    else {
      unsigned int v56 = -[BTSmartRoutingDaemon _bluetoothProductIDNoEarDetect:](self, "_bluetoothProductIDNoEarDetect:", v14);
    }
    unsigned __int8 v61 = CFDictionaryGetInt64Ranged(v16, @"audioIdleTime", 0LL, 255LL, 0LL);
    unsigned __int8 v59 = CFDictionaryGetInt64Ranged(v16, @"budsOutofCaseTime", 0LL, 255LL, 0LL);
    uint64_t v24 = CFDictionaryGetInt64(v16, @"primaryiCloudSignIn", 0LL);
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v16, @"name", TypeID, 0LL);
    __int128 v27 = &stru_100212678;
    if (TypedValue) {
      __int128 v27 = (__CFString *)TypedValue;
    }
    uint64_t v69 = v27;
    id v71 = v6;
    uint64_t v28 = (NearbyWxDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    if (!v28) {
      uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NearbyWxDevice);
    }
    uint64_t v72 = self;
    uint64_t v70 = (void *)v18;
    unint64_t v67 = (void *)v22;
    -[NearbyWxDevice setAddress:](v28, "setAddress:", v22);
    -[NearbyWxDevice setAudioState:](v28, "setAudioState:", v23);
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v74 batteryInfo]);
    id v30 = [v29 countByEnumeratingWithState:&v75 objects:v79 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v76;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v76 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
          if ([v34 batteryType] == (id)2)
          {
            [v34 batteryLevel];
            -[NearbyWxDevice setBatteryLeft:](v28, "setBatteryLeft:");
          }

          if ([v34 batteryType] == (id)3)
          {
            [v34 batteryLevel];
            -[NearbyWxDevice setBatteryRight:](v28, "setBatteryRight:");
          }

          if ([v34 batteryType] == (id)4)
          {
            [v34 batteryLevel];
            -[NearbyWxDevice setBatteryMain:](v28, "setBatteryMain:");
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v75 objects:v79 count:16];
      }

      while (v31);
    }

    id v4 = v74;
    -[BTSmartRoutingDaemon _lowestBatteryInfoForSFDevice:](v72, "_lowestBatteryInfoForSFDevice:", v74);
    -[NearbyWxDevice setLowestBudBatteryInfo:](v28, "setLowestBudBatteryInfo:");
    -[NearbyWxDevice setPaired:](v28, "setPaired:", Int64 != 0);
    -[NearbyWxDevice setProductID:](v28, "setProductID:", v63);
    -[NearbyWxDevice setSourceCount:](v28, "setSourceCount:", v65);
    unsigned __int8 v35 = v70;
    -[NearbyWxDevice setLastConnectHost:](v28, "setLastConnectHost:", v70);
    -[NearbyWxDevice setLidClosed:](v28, "setLidClosed:", v58 == 1);
    -[NearbyWxDevice setPrimaryInEar:](v28, "setPrimaryInEar:", (Int64Ranged >> 2) & 1);
    -[NearbyWxDevice setSecondaryInEar:](v28, "setSecondaryInEar:", (Int64Ranged >> 5) & 1);
    -[NearbyWxDevice setPrimaryInCase:](v28, "setPrimaryInCase:", (Int64Ranged >> 1) & 1);
    -[NearbyWxDevice setSecondaryInCase:](v28, "setSecondaryInCase:", (Int64Ranged >> 4) & 1);
    -[NearbyWxDevice setIsInEar:](v28, "setIsInEar:", v56);
    -[NearbyWxDevice setIsUTPConnected:](v28, "setIsUTPConnected:", Int64Ranged & 1);
    -[NearbyWxDevice setIdleTime:](v28, "setIdleTime:", v61);
    -[NearbyWxDevice setOutOfCaseTime:](v28, "setOutOfCaseTime:", v59);
    -[NearbyWxDevice setIcloudSignedIn:](v28, "setIcloudSignedIn:", v24 != 0);
    unsigned int v36 = v69;
    -[NearbyWxDevice setName:](v28, "setName:", v69);
    -[NearbyWxDevice setLastWxAdvTicks:](v28, "setLastWxAdvTicks:", mach_absolute_time());
    if ((_DWORD)v65 == 1)
    {
      -[NearbyWxDevice setOneSourceLastRouteHost:](v28, "setOneSourceLastRouteHost:", v70);
      id v6 = v71;
    }

    else
    {
      id v6 = v71;
      if (!(_DWORD)v65) {
        -[NearbyWxDevice setZeroSourceLastRouteHost:](v28, "setZeroSourceLastRouteHost:", v70);
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v72->_nearbyWxDeviceMap,  "setObject:forKeyedSubscript:",  v28,  v6);
    if (dword_100234408 <= 50
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
    {
      uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NearbyWxDevice address](v28, "address"));
      int v38 = "yes";
      if (-[NearbyWxDevice isUTPConnected](v28, "isUTPConnected")) {
        unsigned int v39 = "yes";
      }
      else {
        unsigned int v39 = "no";
      }
      id v40 = (id)-[NearbyWxDevice sourceCount](v28, "sourceCount");
      unint64_t v41 = -[NearbyWxDevice audioState](v28, "audioState");
      uint64_t v73 = (void *)v37;
      id v64 = v40;
      uint64_t v66 = v39;
      if (v41 > 3) {
        uint64_t v42 = "?";
      }
      else {
        uint64_t v42 = off_100207970[v41];
      }
      uint64_t v60 = v42;
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice lastConnectHost](v28, "lastConnectHost"));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice zeroSourceLastRouteHost](v28, "zeroSourceLastRouteHost"));
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyWxDevice oneSourceLastRouteHost](v28, "oneSourceLastRouteHost"));
      if (-[NearbyWxDevice lidClosed](v28, "lidClosed")) {
        __int128 v45 = "yes";
      }
      else {
        __int128 v45 = "no";
      }
      if (-[NearbyWxDevice primaryInEar](v28, "primaryInEar")) {
        __int128 v46 = "yes";
      }
      else {
        __int128 v46 = "no";
      }
      if (-[NearbyWxDevice secondaryInEar](v28, "secondaryInEar")) {
        __int128 v47 = "yes";
      }
      else {
        __int128 v47 = "no";
      }
      if (-[NearbyWxDevice primaryInCase](v28, "primaryInCase")) {
        __int128 v48 = "yes";
      }
      else {
        __int128 v48 = "no";
      }
      if (!-[NearbyWxDevice secondaryInCase](v28, "secondaryInCase")) {
        int v38 = "no";
      }
      -[NearbyWxDevice batteryLeft](v28, "batteryLeft");
      uint64_t v50 = v49;
      -[NearbyWxDevice batteryRight](v28, "batteryRight");
      uint64_t v52 = v51;
      -[NearbyWxDevice batteryMain](v28, "batteryMain");
      uint64_t v55 = v38;
      unsigned __int8 v54 = v45;
      id v6 = v71;
      unsigned int v36 = v69;
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _nearbyWxChanged:]",  50LL,  "Nearby Wx device %@ changed, name %@, addr %@, UTP %s, sourceCount %u, audioState %s, lastRoute %@, zeroLastRout e %@, oneLastRoute %@, lidClosed %s, primaryInEar %s, secondaryInEar %s, primaryInCase %s, secondaryInCase %s, b attery Left %f, battery right %f, battery main %f",  v71,  v69,  v73,  v66,  v64,  v60,  v62,  v43,  v44,  v54,  v46,  v47,  v48,  v55,  v50,  v52,  v53);

      id v4 = v74;
      unsigned __int8 v35 = v70;
    }
  }
}

- (void)_notifyOtherTipiDeviceTipiScoreChanged:(int)a3 andNewScore:(int)a4
{
  if (self->_prefProactiveOwnershipArbitration)
  {
    int v7 = a4 | a3;
    if (!(a4 | a3)) {
      goto LABEL_9;
    }
    if (-[BTSmartRoutingDaemon _isInTipi](self, "_isInTipi"))
    {
      nearbyDeviceNotificationTimer = self->_nearbyDeviceNotificationTimer;
      if (nearbyDeviceNotificationTimer)
      {
        float v9 = nearbyDeviceNotificationTimer;
        dispatch_source_cancel(v9);
        uint64_t v10 = self->_nearbyDeviceNotificationTimer;
        self->_nearbyDeviceNotificationTimer = 0LL;
      }

      if ((a4 - 1) < 2 || (a3 - 1) <= 1) {
LABEL_9:
      }
        -[BTSmartRoutingDaemon _sendAudioScoreChanged:](self, "_sendAudioScoreChanged:", v7 == 0);
    }
  }

- (void)_otherTipiDeviceTipiScoreChanged:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  if (self->_prefProactiveOwnershipArbitration)
  {
    id v33 = v6;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  a3));
    uint64_t NSNumber = NSDictionaryGetNSNumber(v33, @"nearbyAudioScore", 0LL);
    float v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    id v10 = [v9 intValue];

    unsigned int v11 = [v7 otherTipiDeviceAudioScore];
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v33, @"btAddress", TypeID, 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    float v15 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"newTipi"]);

    float v16 = (void *)objc_claimAutoreleasedReturnValue([v7 otherTipiDeviceBTAddress]);
    if (v16)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        if (v11 > 0xF) {
          __int128 v17 = "?";
        }
        else {
          __int128 v17 = off_1002079F0[v11];
        }
        else {
          uint64_t v18 = off_1002079F0[(int)v10];
        }
        uint64_t v19 = "yes";
        if (!v15) {
          uint64_t v19 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]",  30LL,  "ProactiveRouting: Received other Tipi device update %@ %s -> %s newTipi %s",  v14,  v17,  v18,  v19);
      }

      [v7 setOtherTipiDeviceAudioScore:v10];
      if ((_DWORD)v10 == 1)
      {
        if (v11 != 1)
        {
          uint64_t v20 = NSDictionaryGetNSNumber(v33, @"idleTime", 0LL);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = [v21 intValue];

          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 otherTipiDeviceBTAddress]);
            uint64_t v24 = (void *)v23;
            uint64_t score = self->_score;
            else {
              uint64_t v26 = off_1002079F0[score];
            }
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]",  30LL,  "ProactiveRouting: Other Tipi %@ has been idle for %ds, my audio score %s",  v23,  v22,  v26);
          }

          uint64_t v28 = mach_absolute_time();
          objc_msgSend(v7, "setOtherTipiDeviceIdleTick:", v28 - SecondsToUpTicks((int)v22, v29));
          if (v15)
          {
            -[BTSmartRoutingDaemon _startHighActivityLevelTimer:](self, "_startHighActivityLevelTimer:", 1LL);
            -[SmartRoutingStats setProactiveRoutingTrigger:]( self->_stats,  "setProactiveRoutingTrigger:",  @"Tipi connection");
          }
        }
      }

      else if ((int)v10 >= 3)
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          else {
            __int128 v27 = off_100207990[(int)v10 - 4];
          }
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]",  30LL,  "ProactiveRouting: Cancel high activity timer since other Tipi device is %s",  v27);
        }

        highActivityLevelTimer = self->_highActivityLevelTimer;
        if (highActivityLevelTimer)
        {
          id v31 = highActivityLevelTimer;
          dispatch_source_cancel(v31);
          uint64_t v32 = self->_highActivityLevelTimer;
          self->_highActivityLevelTimer = 0LL;
        }
      }
    }

    else if (dword_100234408 <= 30 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _otherTipiDeviceTipiScoreChanged:withOptions:]",  30LL,  "ProactiveRouting: Not in Tipi with %@",  v14);
    }

    id v6 = v33;
  }
}

- (void)_postNotification:(const char *)a3
{
}

- (void)_powerLogSmartRoutingScanStarted:(unsigned __int8)a3
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    uint64_t v3 = a3;
    double Current = CFAbsoluteTimeGetCurrent();
    v9[0] = @"ScanStart";
    v8[0] = @"kEventType";
    v8[1] = @"kScanType";
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v3));
    v9[1] = v5;
    void v8[2] = @"timestamp";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
    v9[2] = v6;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));

    PLLogRegisteredEvent(99LL, @"SmartRouting", v7, 0LL);
  }

- (void)_powerLogSmartRoutingScanStopped:(unsigned __int8)a3
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    uint64_t v3 = a3;
    double Current = CFAbsoluteTimeGetCurrent();
    v9[0] = @"ScanStop";
    v8[0] = @"kEventType";
    v8[1] = @"kScanType";
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v3));
    v9[1] = v5;
    void v8[2] = @"timestamp";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
    v9[2] = v6;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));

    PLLogRegisteredEvent(99LL, @"SmartRouting", v7, 0LL);
  }

- (void)_powerLogSmartIncomingConnection
{
  if (self->_prefSmartRoutingEnabledPhase3)
  {
    v5[0] = @"kIncomingLEPipe";
    v5[1] = @"timestamp";
    v6[0] = &__kCFBooleanTrue;
    BOOL v2 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v6[1] = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));

    PLLogRegisteredEvent(99LL, @"SmartRouting", v4, 0LL);
  }

- (void)_proactivelyTakeOwnership
{
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100019A08;
  uint64_t v29 = sub_100019A18;
  id v30 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100041E04;
  v24[3] = &unk_100206B38;
  v24[4] = self;
  void v24[5] = &v25;
  uint64_t v3 = objc_retainBlock(v24);
  uint64_t v23 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  id v5 = v4;
  if (!v4)
  {
    id v6 = (void *)v26[5];
    void v26[5] = (uint64_t)@"Couldn't find inEar Wx";
    goto LABEL_33;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceAddress]);
  int v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Already has ownership: %@",  v6);
  if ([v5 hasOwnership])
  {
    uint64_t v20 = v26;
    uint64_t v21 = v7;
LABEL_38:
    int v7 = v21;
    id v10 = (void *)v20[5];
    v20[5] = (uint64_t)v21;
    goto LABEL_32;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);

  if (!v8)
  {
    id v10 = (void *)v26[5];
    void v26[5] = (uint64_t)@"Not in Tipi";
    goto LABEL_32;
  }

  BOOL v9 = ([v5 otherTipiDeviceAudioScore] == 1
  id v22 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"The other Tipi device is not idle, audioScore %d idleTick %llu",  [v5 otherTipiDeviceAudioScore],  objc_msgSend(v5, "otherTipiDeviceIdleTick"));

  if (!v9)
  {
    uint64_t v20 = v26;
    uint64_t v21 = v22;
    goto LABEL_38;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6));
  uint64_t v12 = -[BTSmartRoutingDaemon _getRssiNearby:](self, "_getRssiNearby:", v10);
  uint64_t v13 = mach_absolute_time();
  uint64_t v14 = UpTicksToSeconds(v13 - (void)[v5 otherTipiDeviceIdleTick]);
  if (v10)
  {
    float v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v10));
    id v16 = [v15 audioState];
  }

  else
  {
    id v16 = 0LL;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    unsigned int v17 = [v11 audioStreamState];
    if (v17 > 3) {
      uint64_t v18 = "?";
    }
    else {
      uint64_t v18 = off_100207B40[v17];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _proactivelyTakeOwnership]",  30,  "ProactiveRouting: StreamState %s otherTipiDeviceIdle %llus, wxRssiConnected %d wxRssiNearby %d ",  v18,  v14,  [v11 rssi],  v12);
  }

  if ([v11 audioStreamState] != 1)
  {
LABEL_26:
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _proactivelyTakeOwnership]",  30LL,  "ProactiveRouting: Taking the route");
    }

    self->_proactiveRoutingInProgress = 1;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v6,  @"-tacl"));
    -[BTSmartRoutingDaemon _smartRoutingChangeRoute:](self, "_smartRoutingChangeRoute:", v19);

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  &off_100218D28,  v6,  0LL);
    -[SmartRoutingStats setProactiveRoutingWxRSSI:]( self->_stats,  "setProactiveRoutingWxRSSI:",  [v11 rssi]);
    -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 12LL);
    goto LABEL_31;
  }

  if (v12 >= -69) {
    goto LABEL_26;
  }
LABEL_31:

  int v7 = v22;
  uint64_t v3 = v23;
LABEL_32:

LABEL_33:
  ((void (*)(void *))v3[2])(v3);

  _Block_object_dispose(&v25, 8);
}

- (BOOL)_productColorAssetExists:(unsigned int)a3 withColor:(char)a4
{
  unsigned int v4 = a4;
  switch(a3)
  {
    case 0x2011u:
      if (a4 == 1) {
        goto LABEL_17;
      }
      goto LABEL_21;
    case 0x2012u:
      goto LABEL_17;
    case 0x2013u:
    case 0x2014u:
    case 0x2015u:
    case 0x2018u:
    case 0x2019u:
    case 0x201Bu:
    case 0x201Cu:
    case 0x201Eu:
    case 0x2020u:
    case 0x2021u:
    case 0x2022u:
    case 0x2023u:
    case 0x2024u:
      goto LABEL_21;
    case 0x2016u:
      goto LABEL_14;
    case 0x2017u:
      unsigned int v5 = 762;
      return (v5 >> a4) & 1;
    case 0x201Au:
      goto LABEL_18;
    case 0x201Du:
    case 0x2026u:
      goto LABEL_17;
    case 0x201Fu:
      unsigned int v4 = a4 - 18;
LABEL_14:
      if (v4 >= 5) {
        goto LABEL_21;
      }
      goto LABEL_17;
    case 0x2025u:
      if (a4 >= 3u)
      {
LABEL_18:
        if (a4 >= 8u)
        {
LABEL_21:
          LOBYTE(v6) = 0;
        }

        else
        {
          unsigned int v5 = 214;
          return (v5 >> a4) & 1;
        }
      }

      else
      {
LABEL_17:
        LOBYTE(v6) = 1;
      }

      return v6;
    default:
      unsigned int v5 = 229388;
      return (v5 >> a4) & 1;
  }

- (id)_productColorAssetLookup:(unsigned int)a3 andAddress:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (-[BTSmartRoutingDaemon _productHasColors:](self, "_productHasColors:", v4))
  {
    wxAssetCache = self->_wxAssetCache;
    if (!wxAssetCache)
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      BOOL v9 = self->_wxAssetCache;
      self->_wxAssetCache = v8;

      wxAssetCache = self->_wxAssetCache;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](wxAssetCache, "objectForKeyedSubscript:", v6));

    if (v10)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_wxAssetCache,  "objectForKeyedSubscript:",  v6));
      if (dword_100234408 <= 50
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
      {
        id v15 = v6;
        id v16 = v11;
        uint64_t v12 = "%@ banner asset found in cache %@";
LABEL_14:
        LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:]", 50LL, v12, v15, v16);
      }
    }

    else
    {
      uint64_t v13 = -[BTSmartRoutingDaemon _getWxColorCode:](self, "_getWxColorCode:", v6);
      if (!-[BTSmartRoutingDaemon _productColorAssetExists:withColor:]( self,  "_productColorAssetExists:withColor:",  v4,  (char)v13)
        || (_DWORD)v13 == 255)
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _bluetoothProductDefaultAsset:]( self,  "_bluetoothProductDefaultAsset:",  v4));
        if (dword_100234408 <= 60
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 60LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _productColorAssetLookup:andAddress:]",  60LL,  "%@ banner asset and color not found using default %@",  v6,  v11);
        }
      }

      else
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _bluetoothProductIDToColorAsset:withColor:]( self,  "_bluetoothProductIDToColorAsset:withColor:",  v4,  v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_wxAssetCache,  "setObject:forKeyedSubscript:",  v11,  v6);
        if (dword_100234408 <= 50
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
        {
          id v15 = v6;
          id v16 = v11;
          uint64_t v12 = "%@ new banner asset, caching it now %@";
          goto LABEL_14;
        }
      }
    }
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _bluetoothProductIDToAsset:](self, "_bluetoothProductIDToAsset:", v4));
  }

  return v11;
}

- (BOOL)_productHasColors:(unsigned int)a3
{
  return (a3 - 8202 < 0x1D) & (0x18293181u >> (a3 - 10));
}

- (void)_receivedAudioCategory:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  id v8 = a4;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"otherDeviceAudioCategory"]);
  id v11 = [v10 unsignedIntValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"btAddress"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"btName"]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"playingApp"]);

  if (v9)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 otherTipiDeviceBTAddress]);
    unsigned __int8 v16 = [v15 isEqualToString:v12];

    if ((v16 & 1) == 0)
    {
      if (dword_100234408 <= 90
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 otherTipiDeviceBTAddress]);
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]",  90LL,  "Host device address does not match, current cached host address %@, the other device address %@; Updated the Tipi info!",
          v17,
          v12);
      }

      -[BTSmartRoutingDaemon _updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:]( self,  "_updateOtherTipiDevicewithAudioCategory:otherAddress:otherName:otherVersion:",  v6,  v12,  v13,  &off_100218938);
      -[BTSmartRoutingDaemon _tipihHealingV2Handling:](self, "_tipihHealingV2Handling:", v6);
    }
  }

  if (!self->_prefSmartRoutingForcedHijackv2) {
    goto LABEL_12;
  }
  id v18 = 0LL;
  if (![v9 otherTipiAudioCategory] && v11 >= 0x12D)
  {
    if ([v9 routingAction] == 1)
    {
LABEL_12:
      id v18 = 0LL;
      goto LABEL_13;
    }

    [v9 _setOtherTipiAudioCategory:v11];
    NSInteger v22 = -[NSNumber integerValue](self->_localDeviceAudioCatogory, "integerValue");
    id v27 = 0LL;
    unsigned int v23 = -[BTSmartRoutingDaemon allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:]( self,  "allowHijackWithAudioScore:hijackRoute:hijackDeniedReason:",  v22,  v6,  &v27);
    id v18 = v27;
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      uint64_t v24 = "no";
      if (v23) {
        uint64_t v24 = "yes";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedAudioCategory:withOptions:]",  90LL,  "[HijackV2]: Arbitrate again while receiving audio score of other Tipi device for the first time. ShouldHijack %s",  v24);
    }

    if (v23) {
      [v9 _setRoutingAction:1];
    }
  }

- (void)_receivedRelinquishOwnership:(id)a3 wxAddress:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"reason"]);
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: Reason %@",  v7);
  }
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    if (!v8)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: No Wx SR device");
      }

      goto LABEL_88;
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"audioRoutingScore"]);
    int audioScoreOtherTipiDevice = self->_audioScoreOtherTipiDevice;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"localscore"]);
    id v12 = [v11 intValue];

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      if (self->_activityLevelMediaPlaying
        || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") >= 1)
      {
        uint64_t v13 = "yes";
      }

      else
      {
        uint64_t v13 = "no";
      }

      id v31 = v13;
      uint64_t v32 = v9;
      uint64_t score = self->_score;
      else {
        id v15 = off_1002079F0[score];
      }
      uint64_t v16 = self->_audioScoreOtherTipiDevice;
      else {
        unsigned int v17 = "no";
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](self->_uiNoteSessionSmartRouting, "identifier"));
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: Reason %@ hijackedScoreFromRemote %u activeAudio %s localTipiScore %s OtherTipiDeviceScor e %u wxRouteState %s bannerType %@",  v7,  v12,  v31,  v15,  v16,  v17,  v11);

      BOOL v9 = v32;
    }

    if (![v8 routed])
    {
LABEL_58:
      uiNoteSessionSmartRouting = self->_uiNoteSessionSmartRouting;
      if (uiNoteSessionSmartRouting)
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](uiNoteSessionSmartRouting, "identifier"));
        unsigned __int8 v24 = [v23 isEqualToString:@"ReverseRoute"];

        if ([v7 isEqualToString:@"AutoResume"])
        {
          if ((v24 & 1) != 0) {
            goto LABEL_87;
          }
LABEL_63:
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: Show reverse banner for autoResume");
          }

          goto LABEL_87;
        }
      }

      else if ([v7 isEqualToString:@"AutoResume"])
      {
        goto LABEL_63;
      }

      if ([v7 isEqualToString:@"Hijackv2"])
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"localscore"]);
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: Hijackv2 localScore %@ remoteHijackScore %@",  v25,  v9);
        }

        -[SmartRoutingStats setHijackAwayLocalScore:](self->_stats, "setHijackAwayLocalScore:", 0xFFFFFFFFLL);
        -[SmartRoutingStats setHijackAwayRemoteScore:](self->_stats, "setHijackAwayRemoteScore:", 0xFFFFFFFFLL);
        if (v25) {
          -[SmartRoutingStats setHijackAwayLocalScore:]( self->_stats,  "setHijackAwayLocalScore:",  [v25 intValue]);
        }
        if (v9) {
          -[SmartRoutingStats setHijackAwayRemoteScore:]( self->_stats,  "setHijackAwayRemoteScore:",  [v9 intValue]);
        }
        -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:]( self,  "submitRouteActivityMetric:activity:",  v6,  @"Hijack_Away");
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (!v30) {
          -[SmartRoutingStats setFalseRouteCheckReason:]( self->_stats,  "setFalseRouteCheckReason:",  @"Hijacked_Away");
        }
        -[BTSmartRoutingDaemon _startRouteCheckTimer:andType:](self, "_startRouteCheckTimer:andType:", v6, 8LL);

        goto LABEL_87;
      }

      if ([v7 isEqualToString:@"ManualRoute"])
      {
        -[BTSmartRoutingDaemon submitRouteActivityMetric:activity:]( self,  "submitRouteActivityMetric:activity:",  v6,  @"Remote_Manual_Route");
        [v8 _setOtherTipiManuallyRouteTick:mach_absolute_time()];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (v26)
        {
LABEL_87:

LABEL_88:
          goto LABEL_89;
        }

        stats = self->_stats;
        uint64_t v28 = @"Remote_Manual_Route";
      }

      else
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckReason](self->_stats, "falseRouteCheckReason"));

        if (v29) {
          goto LABEL_87;
        }
        stats = self->_stats;
        uint64_t v28 = @"Remote_reverse_banner_tapped";
      }

      -[SmartRoutingStats setFalseRouteCheckReason:](stats, "setFalseRouteCheckReason:", v28);
      goto LABEL_87;
    }

    id v18 = v33;
    if (self->_prefSmartRoutingBlockHijackWindowinSeconds)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"audioRoutingShowReverseUI"]);

      id v18 = v33;
      if (v12)
      {
        [v8 _setHijackBackoffTick:mach_absolute_time()];
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "Hijackblocking: Hijack backoff starts due to the other device clicks the revserse banner");
        }

        self->_BOOL hijackBackOffInitiator = 0;
        id v18 = v33;
      }
    }

    int v19 = self->_audioScoreOtherTipiDevice;
    if (v19 <= 0)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"audioRoutingShowReverseUI"]);
      if (v12)
      {
        int v20 = 0;
      }

      else
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v33 objectForKey:@"SmartRoutingKeyShowNearbyUI"]);
        if (!v21)
        {
LABEL_56:

          goto LABEL_57;
        }

        id v11 = (void *)v21;
        int v20 = 1;
      }
    }

    else
    {
      int v20 = 0;
    }

    if (self->_score <= 3 && (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") < 1)
    {
      if (v20)
      {
LABEL_49:

        if (v19 < 1) {
          goto LABEL_56;
        }
LABEL_57:
        [v8 _setRoutedState:0];
        [v8 _setRoutingAction:3];
        -[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:]( self,  "_setManualRouteFlag:withManualRoute:",  v6,  0LL);
        goto LABEL_58;
      }
    }

    else
    {
      [v9 intValue];
      if ((v20 & 1) != 0) {
        goto LABEL_49;
      }
    }

    if (v19 <= 0) {
      goto LABEL_56;
    }
    goto LABEL_57;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _receivedRelinquishOwnership:wxAddress:]",  30LL,  "ReceivedOwnershipLost: No Wx address");
  }
LABEL_89:
}

- (void)_removeTiPiState:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1 || (v5 = _LogCategory_Initialize(&dword_100234408, 30LL), id v4 = v13, v5))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _removeTiPiState:]", 30LL, "Evaluator: Delete tipi states.");
      id v4 = v13;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioRoutingResponse]);

  if (v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___BTAudioRoutingResponse);
    [v8 setAction:1];
    [v8 setDeviceAddress:v13];
    [v8 setReason:@"Tipi device should be routed"];
    objc_msgSend(v8, "setClientID:", objc_msgSend(v6, "audioRoutingClientID"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 audioRoutingResponse]);
    -[BTSmartRoutingDaemon _respondRoutingRequest:withResponseHandler:wxAddress:]( self,  "_respondRoutingRequest:withResponseHandler:wxAddress:",  v8,  v9,  v13);
  }

  [v6 _setOtherTipiDeviceInfo:0 andName:0 andVersion:0];
  [v6 _setOtherTipiAudioCategory:0];
  [v6 _setOtherTipiDeviceIsWatch:0];
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  if (phoneOwnershipTriangleTimer)
  {
    id v11 = phoneOwnershipTriangleTimer;
    dispatch_source_cancel(v11);
    id v12 = self->_phoneOwnershipTriangleTimer;
    self->_phoneOwnershipTriangleTimer = 0LL;
  }

  if (-[NSMutableDictionary count](self->_smartRoutingWxDeviceMap, "count") == (id)1) {
    -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v13,  &stru_100212678,  0LL,  3LL);
  }
}

- (void)_relayConduitMessageStartTimer:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0LL, 3500000000LL);
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  int v20 = sub_100019A08;
  uint64_t v21 = sub_100019A18;
  id v22 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
  BOOL v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  [(id)v18[5] setConduitMessageTimer:v9];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100042F58;
  handler[3] = &unk_100207380;
  void handler[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v17;
  uint64_t v16 = 0x400C000000000000LL;
  id v10 = v7;
  id v11 = v6;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_source_set_timer(v9, v8, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)_setOwnership:(id)a3 withHijackRequest:(id)a4 withOwnership:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v10 = "no";
    if (v5) {
      id v10 = "yes";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setOwnership:withHijackRequest:withOwnership:]",  30LL,  "Setting ownership for Wx %@ %s",  v8,  v10);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  id v12 = v11;
  if (v5) {
    uint64_t v13 = 2LL;
  }
  else {
    uint64_t v13 = 1LL;
  }
  [v11 setRelinquishAudioRoute:v13];
  id v14 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v14, "setIdentifier:", v8);
  smartRoutingController = self->_smartRoutingController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000434AC;
  v18[3] = &unk_1002073A8;
  id v19 = v9;
  int v20 = self;
  id v21 = v8;
  id v16 = v8;
  id v17 = v9;
  -[CBController modifyDevice:settings:completion:]( smartRoutingController,  "modifyDevice:settings:completion:",  v14,  v12,  v18);
}

- (void)_sendAudioCategory:(id)a3 withAudioCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    unsigned __int8 v11 = [v10 otherTipiDeviceIsWatch];

    unsigned int v12 = [v9 intValue];
    if (-[BTSmartRoutingSourceDevice incomingCallRingtone](self->_sourceDevice, "incomingCallRingtone"))
    {
      signed int v13 = -[NSNumber intValue](self->_localDeviceAudioCatogory, "intValue");
      if (!-[BTSmartRoutingDaemon _isInHijackBlockingMode](self, "_isInHijackBlockingMode"))
      {
        BOOL v14 = v13 > 500;
        if (v12 == 401) {
          BOOL v14 = v11;
        }
        if (v14) {
          goto LABEL_19;
        }
LABEL_17:
        id v15 = &off_1002190C8;
        goto LABEL_18;
      }
    }

    else if (!-[BTSmartRoutingDaemon _isInHijackBlockingMode](self, "_isInHijackBlockingMode"))
    {
      if (v12 == 401) {
        char v16 = v11;
      }
      else {
        char v16 = 1;
      }
      if ((v16 & 1) != 0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }

    id v15 = &off_1002190B0;
LABEL_18:

    id v9 = v15;
LABEL_19:
    id v17 = @"YES";
    if (!self->_activityLevelMediaPlaying
      && (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") <= 0)
    {
      id v17 = @"NO";
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 otherTipiDeviceBTAddress]);

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]",  30,  "[Hijackv2] Send audio category through relay message via %@ to device %@ with score %d",  v6,  v20,  [v9 integerValue]);
    }

    v26[0] = @"btAddress";
    v26[1] = @"btName";
    myModel = self->_myModel;
    v27[0] = v18;
    v27[1] = myModel;
    v26[2] = @"hostStreamingState";
    v26[3] = @"otherDeviceAudioCategory";
    v27[2] = v17;
    v27[3] = v9;
    v26[4] = @"playingApp";
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
    unsigned int v23 = (void *)v22;
    unsigned __int8 v24 = @"NA";
    if (v22) {
      unsigned __int8 v24 = (const __CFString *)v22;
    }
    v27[4] = v24;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  5LL));

    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v25,  v6,  v20);
    goto LABEL_29;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]",  30LL,  "[Hijackv2] Error: audioCategory is nil");
  }
LABEL_29:
}

- (void)_sendAudioCategoryToAllTipiDevices
{
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004395C;
  v3[3] = &unk_100206F58;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v3);
}

- (void)_sendTipiHealingRequest:(id)a3 andOtherTipiAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tipiElectionInProgress)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendTipiHealingRequest:andOtherTipiAddress:]",  30LL,  "Evaluator: Tipi election in progress, Tipi healing attempt back off");
    }
  }

  else
  {
    self->_BOOL tipiElectionInProgress = 1;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendTipiHealingRequest:andOtherTipiAddress:]",  30LL,  "Evaluator: Initiating tipi healing request");
    }

    -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v6,  v7,  0LL,  1LL);
    id v8 = @"YES";
    if (!self->_activityLevelMediaPlaying)
    {
      else {
        id v8 = @"YES";
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    v14[0] = @"tipiHealingAttempt";
    v14[1] = @"tipiHealingName";
    myModel = self->_myModel;
    v15[0] = v9;
    v15[1] = myModel;
    v14[2] = @"version";
    v14[3] = @"tipiHealingStreaming";
    v15[2] = &off_100218938;
    v15[3] = v8;
    v14[4] = @"tipiHealingPreferMac";
    unsigned int v11 = -[BTSmartRoutingDaemon _isManualConnection:](self, "_isManualConnection:", v6);
    unsigned int v12 = @"Don't route for manual connection";
    if (!v11) {
      unsigned int v12 = @"YES";
    }
    v15[4] = v12;
    signed int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));
    -[BTSmartRoutingDaemon _relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:]( self,  "_relayConduitMessageSend:withOptions:andWxAddress:andOtherAddress:",  1LL,  v13,  v6,  v7);
    -[BTSmartRoutingDaemon _tipiHealingStartTimer:](self, "_tipiHealingStartTimer:", v6);
  }
}

- (void)_sendAudioScoreChanged:(BOOL)a3
{
  if (self->_startIdleTicks)
  {
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = UpTicksToSeconds(v5 - self->_startIdleTicks);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendAudioScoreChanged:]",  30LL,  "ProactiveRouting: I'm idle for %llus",  v6);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  void v8[2] = sub_100043CF0;
  void v8[3] = &unk_1002073D0;
  v8[4] = self;
  void v8[5] = v6;
  BOOL v9 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v8);
}

- (void)_sendTipiScoreUpdateToWx
{
  if (self->_isActiveHRMSession)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx]",  30LL,  "SendTipiScoreToWx: Active HRM session, skip sending score to the buds");
    }
  }

  else
  {
    uint64_t v3 = self->_smartRoutingController;
    if (!v3)
    {
      uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CBController);
      objc_storeStrong((id *)&self->_smartRoutingController, v3);
      -[CBController setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
    }

    srDiscoveredDeviceMap = self->_srDiscoveredDeviceMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_10004403C;
    v6[3] = &unk_100207420;
    void v6[4] = self;
    id v7 = v3;
    uint64_t v5 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( srDiscoveredDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v6);
  }

- (void)_setAutoRoute:(id)a3 withAutoRoute:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  id v8 = v7;
  if (v4) {
    uint64_t v9 = 2LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
  [v7 setAllowsAutoRoute:v9];
  id v10 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v10, "setIdentifier:", v6);

  smartRoutingController = self->_smartRoutingController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004437C;
  v12[3] = &unk_100206080;
  v12[4] = self;
  -[CBController modifyDevice:settings:completion:]( smartRoutingController,  "modifyDevice:settings:completion:",  v10,  v8,  v12);
}

- (void)_setIsHiddenProperty:(id)a3 withIsHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v6 = "no";
    if (v4) {
      id v6 = "yes";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setIsHiddenProperty:withIsHidden:]",  30LL,  "Setting isHidden for Wx %@ %s",  v11,  v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  id v8 = v7;
  if (v4) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = 2LL;
  }
  [v7 setAudioRouteHidden:v9];
  id v10 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v10, "setIdentifier:", v11);
  -[CBController modifyDevice:settings:completion:]( self->_smartRoutingController,  "modifyDevice:settings:completion:",  v10,  v8,  &stru_100207440);
}

- (void)_setHighPriorityTag:(id)a3 withHighPriority:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  id v8 = v7;
  if (a4)
  {
    uint64_t v9 = 80LL;
LABEL_5:
    [v7 setAclPriority:v9];
    goto LABEL_6;
  }

  if (self->_highPriorityTagSent)
  {
    uint64_t v9 = 1LL;
    goto LABEL_5;
  }

- (void)_setManualRouteFlag:(id)a3 withManualRoute:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  [v6 setDeviceFlagsMask:0x400000];
  [v6 setDeviceFlagsValue:v4];
  id v7 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v7, "setIdentifier:", v11);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v11));
  [v9 _setManualRoute:0];

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v10 = "no";
    if (v4) {
      id v10 = "yes";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setManualRouteFlag:withManualRoute:]",  30LL,  "Setting manual route flag %s",  v10);
  }

  -[CBController modifyDevice:settings:completion:]( self->_smartRoutingController,  "modifyDevice:settings:completion:",  v7,  v6,  &stru_100207460);
}

- (void)_setOtherTipiDeviceBTAddress:(id)a3 andName:(id)a4 sourceVersion:(id)a5 withResult:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  signed int v13 = v12;
  if (self->_eligibleHeadset)
  {
    if (v12)
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self->_eligibleHeadset, "bleDevice"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bluetoothAddress]);

      if ([v15 length] == (id)6)
      {
        uint64_t v16 = NSPrintF("%.6a", COERCE_DOUBLE([v15 bytes]));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v17));
          if (v18)
          {
          }

          else if (!-[BTSmartRoutingDaemon _isOnDemandConnectInProgress](self, "_isOnDemandConnectInProgress"))
          {
            if (dword_100234408 <= 30
              && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
            {
              LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setOtherTipiDeviceBTAddress:andName:sourceVersion:withResult:]",  30LL,  "Deleting SR Wx %@",  v17);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v17);
          }
        }
      }

      else
      {
        id v17 = 0LL;
      }
    }

    else
    {
      LOBYTE(v19) = 0;
      -[BTSmartRoutingDaemon _smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:]( self,  "_smartRoutingAddWxMapDevice:routingAction:otherAddress:otherName:otherSourceVersion:isRoutingInitialized:newWx:",  v19);
    }
  }
}

- (void)_setPhase1ConnectConfig:(id)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    else {
      id v6 = off_100207A70[(int)v4];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setPhase1ConnectConfig:andType:]",  30LL,  "Setting phase1 connect Wx %@ type %s",  v10,  v6);
  }

  phase1ConnectConfig = self->_phase1ConnectConfig;
  if (!phase1ConnectConfig)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SmartRoutingConnectConfig);
    uint64_t v9 = self->_phase1ConnectConfig;
    self->_phase1ConnectConfig = v8;

    phase1ConnectConfig = self->_phase1ConnectConfig;
  }

  -[SmartRoutingConnectConfig setAddress:](phase1ConnectConfig, "setAddress:", v10);
  -[SmartRoutingConnectConfig setType:](self->_phase1ConnectConfig, "setType:", v4);
}

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3 forDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v6 _setTipiAndRoutedStateFlags:v4];

  -[AADeviceManagerDaemon smartRoutingStateUpdated:ForDeviceIdentifier:]( self->_aaDeviceManagerDaemon,  "smartRoutingStateUpdated:ForDeviceIdentifier:",  v4,  v7);
}

- (void)_setTipiElectionInProgress:(BOOL)a3
{
  self->_BOOL tipiElectionInProgress = a3;
}

- (void)_setIsFirstConnentionAfterSREnable:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
  id v7 = v6;
  if (v4)
  {
    [v6 setValue:@"YES" forKey:v13];

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:]",  30LL,  "Marking _isFirstConnectionAfterSREnable as YES for %@ %@",  v13,  v9);

LABEL_13:
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v13]);

    if (v10)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v13]);
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setIsFirstConnentionAfterSREnable:forDevice:]",  30LL,  "Marking _isFirstConnectionAfterSREnable as NO for %@ %@",  v13,  v12);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingSourceDevice isFirstConnectionAfterSREnable]( self->_sourceDevice,  "isFirstConnectionAfterSREnable"));
      [v8 removeObjectForKey:v13];
      goto LABEL_13;
    }
  }
}

- (void)_setTipiElectionReceivedLePipe:(id)a3
{
  id v6 = a3;
  else {
    BOOL v4 = v6;
  }
  p_tipiElectionReceivedLePipe = &self->_tipiElectionReceivedLePipe;
  objc_storeStrong((id *)p_tipiElectionReceivedLePipe, v4);
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setTipiElectionReceivedLePipe:]",  30LL,  "Setting legacy Tipi connect Wx %@",  *p_tipiElectionReceivedLePipe);
  }
}

- (void)_setTotalCountIDSDevices:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100044EB0;
  v7[3] = &unk_100206358;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_smartRoutingModeCheck:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 btAddressData]);
  uint64_t v5 = CUPrintNSDataAddress(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v6));
  if (v7)
  {
    id v8 = (BTSmartRoutingModeDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v6));
    unsigned int v9 = -[BTSmartRoutingModeDevice mode](v8, "mode");
    if ([v15 smartRoutingMode] != v9)
    {
      if (v9 == 2)
      {
        if ([v15 smartRoutingMode] == 1)
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingModeCheck:]",  30LL,  "SR enabled for %@",  v6);
          }

          -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", 1LL);
          -[BTSmartRoutingModeDevice setEnableCount:]( v8,  "setEnableCount:",  -[BTSmartRoutingModeDevice enableCount](v8, "enableCount") + 1);
          -[BTSmartRoutingDaemon _sendTipiScoreUpdateToWx](self, "_sendTipiScoreUpdateToWx");
        }
      }

      else if (v9 == 1)
      {
        if ([v15 smartRoutingMode] == 2)
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _smartRoutingModeCheck:]",  30LL,  "SR disabled for %@",  v6);
          }

          -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", 2LL);
          -[BTSmartRoutingModeDevice setDisableCount:]( v8,  "setDisableCount:",  -[BTSmartRoutingModeDevice disableCount](v8, "disableCount") + 1);
          -[BTSmartRoutingDaemon _handleSmartRoutingDisabled:](self, "_handleSmartRoutingDisabled:", v6);
        }
      }

      else if (!(_BYTE)v9 && [v15 smartRoutingMode])
      {
        id v10 = [v15 smartRoutingMode];
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v6));
        [v11 setMode:v10];
      }
    }
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingModeDevice);
    -[BTSmartRoutingModeDevice setMode:](v8, "setMode:", [v15 smartRoutingMode]);
    -[BTSmartRoutingModeDevice setEnableCount:](v8, "setEnableCount:", 0LL);
    -[BTSmartRoutingModeDevice setDisableCount:](v8, "setDisableCount:", 0LL);
    connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    if (!connectedDevicesSrModeCache)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      BOOL v14 = self->_connectedDevicesSrModeCache;
      self->_connectedDevicesSrModeCache = v13;

      connectedDevicesSrModeCache = self->_connectedDevicesSrModeCache;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( connectedDevicesSrModeCache,  "setObject:forKeyedSubscript:",  v8,  v6);
  }
}

- (void)_startIdleActivityScoreTimer:(unint64_t)a3
{
  idleActivityScoreTimer = self->_idleActivityScoreTimer;
  if (idleActivityScoreTimer)
  {
    id v6 = idleActivityScoreTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_idleActivityScoreTimer;
    self->_idleActivityScoreTimer = 0LL;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startIdleActivityScoreTimer:]",  30LL,  "Idle activity score timer: Start timer with delay %us",  a3);
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  unsigned int v9 = self->_idleActivityScoreTimer;
  self->_idleActivityScoreTimer = v8;
  id v10 = v8;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10004535C;
  handler[3] = &unk_100206058;
  void handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  CUDispatchTimerSet(v10, (double)a3, -1.0, -10.0);
  dispatch_activate(v10);
}

- (void)_startHighActivityLevelTimer:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getInEarSrWxDevice](self, "_getInEarSrWxDevice"));
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]",  30LL,  "ProactiveRouting: Start high acitivity timer with device %@",  v5);
  }
  if ([v5 proactiveRoutingBackoff])
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]",  30LL,  "ProactiveRouting: Skip, backoff for %@",  v6);
    }
  }

  else if (v5 && !self->_highActivityLevelTimer)
  {
    if ([v5 otherTipiDeviceAudioScore] == 1
      || [v5 otherTipiDeviceAudioScore] == 2)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]",  30LL,  "ProactiveRouting: Start high activity level timer with delay %us",  a3);
      }

      id v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      highActivityLevelTimer = self->_highActivityLevelTimer;
      self->_highActivityLevelTimer = v8;
      id v10 = v8;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10004568C;
      handler[3] = &unk_100206E98;
      void handler[4] = self;
      void handler[5] = a3;
      dispatch_source_set_event_handler(v10, handler);
      CUDispatchTimerSet(v10, (double)a3, -1.0, -10.0);
      dispatch_activate(v10);
    }

    else if (dword_100234408 <= 30 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    }
    {
      id v7 = sub_10001A2D4([v5 otherTipiDeviceAudioScore]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startHighActivityLevelTimer:]",  30LL,  "ProactiveRouting: Skip, other Tipi device score %s",  v7);
    }
  }
}

- (void)_startPhoneTriangleOwnershipTimer:(unint64_t)a3
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startPhoneTriangleOwnershipTimer:]",  30LL,  "PhoneTriangleOwnershipTimer: Start timer with delay %us",  a3);
  }
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  phoneOwnershipTriangleTimer = self->_phoneOwnershipTriangleTimer;
  self->_phoneOwnershipTriangleTimer = v5;
  id v7 = v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100045868;
  handler[3] = &unk_100206058;
  void handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  CUDispatchTimerSet(v7, (double)a3, -1.0, -10.0);
  dispatch_activate(v7);
}

- (void)_startManualRouteChangeDetectionTimer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats manualRouteChangeDetectionTimer]( self->_stats,  "manualRouteChangeDetectionTimer"));
  id v6 = v5;
  if (v5) {
    dispatch_source_cancel(v5);
  }
  id v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  -[SmartRoutingStats setManualRouteChangeDetectionTimer:](self->_stats, "setManualRouteChangeDetectionTimer:", v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000459BC;
  void v9[3] = &unk_100206358;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, v9);
  CUDispatchTimerSet(v7, 4.0, -1.0, -10.0);
  dispatch_activate(v7);
}

- (void)_startPlaybackTimer
{
  playbackStartTimer = self->_playbackStartTimer;
  if (playbackStartTimer)
  {
    id v4 = playbackStartTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_playbackStartTimer;
    self->_playbackStartTimer = 0LL;
  }

  id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v7 = self->_playbackStartTimer;
  self->_playbackStartTimer = v6;
  id v8 = v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100045AE4;
  handler[3] = &unk_100206058;
  void handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet(v8, 0.5, -1.0, -10.0);
  dispatch_activate(v8);
}

- (void)_startRouteChangeDetectionTimer:(id)a3 andAnswer:(int64_t)a4
{
  id v6 = a3;
  routeChangeDetectionTimer = self->_routeChangeDetectionTimer;
  if (routeChangeDetectionTimer)
  {
    id v8 = routeChangeDetectionTimer;
    dispatch_source_cancel(v8);
    unsigned int v9 = self->_routeChangeDetectionTimer;
    self->_routeChangeDetectionTimer = 0LL;
  }

  id v10 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v11 = self->_routeChangeDetectionTimer;
  self->_routeChangeDetectionTimer = v10;
  id v12 = v10;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100045C48;
  handler[3] = &unk_1002071F0;
  void handler[4] = self;
  id v15 = v6;
  int64_t v16 = a4;
  id v13 = v6;
  dispatch_source_set_event_handler(v12, handler);
  CUDispatchTimerSet(v12, 5.0, -1.0, -10.0);
  dispatch_activate(v12);
}

- (void)_startRouteCheckTimer:(id)a3 andType:(int)a4
{
  id v6 = a3;
  id v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  double v8 = 0.0;
  switch(a4)
  {
    case 1:
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckOwnLostTimer](self->_stats, "routeCheckOwnLostTimer"));
      -[SmartRoutingStats setRouteCheckOwnLostTimer:](self->_stats, "setRouteCheckOwnLostTimer:", v7);

      goto LABEL_3;
    case 2:
LABEL_3:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats falseRouteCheckOwnLostTimer](self->_stats, "falseRouteCheckOwnLostTimer"));
      -[SmartRoutingStats setFalseRouteCheckOwnLostTimer:](self->_stats, "setFalseRouteCheckOwnLostTimer:", v7);

      goto LABEL_4;
    case 4:
LABEL_4:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats falseRouteCheckForceDisconnectTimer]( self->_stats,  "falseRouteCheckForceDisconnectTimer"));
      -[SmartRoutingStats setFalseRouteCheckForceDisconnectTimer:]( self->_stats,  "setFalseRouteCheckForceDisconnectTimer:",  v7);
      goto LABEL_11;
    case 5:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckHijackTimer](self->_stats, "routeCheckHijackTimer"));
      -[SmartRoutingStats setRouteCheckHijackTimer:](self->_stats, "setRouteCheckHijackTimer:", v7);
      goto LABEL_24;
    case 6:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats falseRouteCheckHijackTimer]( self->_stats,  "falseRouteCheckHijackTimer"));
      -[SmartRoutingStats setFalseRouteCheckHijackTimer:](self->_stats, "setFalseRouteCheckHijackTimer:", v7);
      goto LABEL_11;
    case 8:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats falseRouteCheckHijackAwayTimer]( self->_stats,  "falseRouteCheckHijackAwayTimer"));
      -[SmartRoutingStats setFalseRouteCheckHijackAwayTimer:](self->_stats, "setFalseRouteCheckHijackAwayTimer:", v7);
      -[SmartRoutingStats setReverseRouteReason:](self->_stats, "setReverseRouteReason:", 0LL);
      goto LABEL_12;
    case 9:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SmartRoutingStats routeCheckOnDemandTimer](self->_stats, "routeCheckOnDemandTimer"));
      -[SmartRoutingStats setRouteCheckOnDemandTimer:](self->_stats, "setRouteCheckOnDemandTimer:", v7);
      goto LABEL_24;
    case 10:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats falseRouteCheckOnDemandTimer]( self->_stats,  "falseRouteCheckOnDemandTimer"));
      -[SmartRoutingStats setFalseRouteCheckOnDemandTimer:](self->_stats, "setFalseRouteCheckOnDemandTimer:", v7);
      goto LABEL_11;
    case 12:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats falseRouteCheckProactiveRoutingTimer]( self->_stats,  "falseRouteCheckProactiveRoutingTimer"));
      -[SmartRoutingStats setFalseRouteCheckProactiveRoutingTimer:]( self->_stats,  "setFalseRouteCheckProactiveRoutingTimer:",  v7);
LABEL_11:
      -[SmartRoutingStats setFalseRouteCheckReason:](self->_stats, "setFalseRouteCheckReason:", 0LL);
LABEL_12:
      double v8 = 25.0;
      if (v11) {
        goto LABEL_13;
      }
      break;
    case 13:
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[SmartRoutingStats routeCheckInUseBannerTimer]( self->_stats,  "routeCheckInUseBannerTimer"));
      -[SmartRoutingStats setRouteCheckInUseBannerTimer:](self->_stats, "setRouteCheckInUseBannerTimer:", v7);
LABEL_24:
      double v8 = 5.0;
      if (!v11) {
        break;
      }
LABEL_13:
      dispatch_source_cancel(v11);

      break;
    default:
      break;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    else {
      id v12 = off_100207A90[a4];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startRouteCheckTimer:andType:]",  30LL,  "Start route check timer for Wx %@ type %s timeout %fs score %u",  v6,  v12,  *(void *)&v8,  -[SmartRoutingStats hijackScore](self->_stats, "hijackScore"));
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100045FA8;
  handler[3] = &unk_1002066B0;
  int v16 = a4;
  void handler[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_source_set_event_handler(v7, handler);
  CUDispatchTimerSet(v7, v8, -1.0, -10.0);
  dispatch_activate(v7);
}

- (void)_startTipiHealing:(id)a3 withLastConnect:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  if (!v6)
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]",  90LL,  "Evaluator: Failed to tipi healing, invalid lastConnected device address");
    }

    goto LABEL_51;
  }

  if (-[BTSmartRoutingDaemon _isMyAddress:](self, "_isMyAddress:", v6))
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]",  30LL,  "Evaluator: Wx is advertising my address, back off");
    }

    goto LABEL_51;
  }

  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  __int128 v47 = sub_100019A08;
  __int128 v48 = sub_100019A18;
  id v49 = 0LL;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  unsigned int v36 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (!v8) {
    goto LABEL_47;
  }
  uint64_t v9 = *(void *)v41;
  id obj = v7;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceID]);
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]",  30LL,  "Evaluator: Tipi healing PD %@ idsId %@",  v11,  v12);
      }

      id v13 = objc_claimAutoreleasedReturnValue([v11 btAddressData]);
      BOOL v14 = (char *)[v13 bytes];
      uint64_t v15 = CUPrintNSDataAddress(v13);
      int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceID]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _nearbyMacAddressTranslate:](v36, "_nearbyMacAddressTranslate:", v17));

      id v19 = v18;
      id v20 = (char *)[v19 bytes];
      uint64_t v21 = CUPrintNSDataAddress(v19);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]",  30LL,  "Evaluator: Tipi healing comparing, Wx lastConnect: %@, PdAddr %@ transAddr %@",  v6,  v16,  v22);
      }

      if (v13
        && ((unsigned int v23 = (unsigned __int16 *)[v6 bytes],
             *v23 == *(unsigned __int16 *)(v14 + 3))
          ? (BOOL v24 = *((unsigned __int8 *)v23 + 2) == v14[5])
          : (BOOL v24 = 0),
            uint64_t v25 = v16,
            v24)
        || v19
        && ((uint64_t v26 = (unsigned __int16 *)[v6 bytes],
             *v26 == *(unsigned __int16 *)(v20 + 3))
          ? (BOOL v27 = *((unsigned __int8 *)v26 + 2) == v20[5])
          : (BOOL v27 = 0),
            uint64_t v25 = v22,
            v27))
      {
        uint64_t v28 = v45;
        id v29 = v25;
        id v30 = (void *)v28[5];
        void v28[5] = (uint64_t)v29;
      }

      uint64_t v31 = v45[5];
      if (v31)
      {
        if (dword_100234408 <= 30)
        {
          if (dword_100234408 == -1)
          {
            uint64_t v31 = v45[5];
          }

          LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]",  30LL,  "Evaluator: Tipi healing found via PD %@",  v31);
        }

- (void)_startTipiSetupTicks
{
  self->_tipiSetupTicks = mach_absolute_time();
}

- (void)_submitMetric:(id)a3
{
  id v4 = a3;
  v59[0] = @"nearbyAction";
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerActionCount));
  v60[0] = v52;
  v59[1] = @"nearbyIgnored";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerTimeoutCount));
  v60[1] = v5;
  v59[2] = @"connectIgnored";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_connectedBannerTimeoutCount));
  v60[2] = v6;
  v59[3] = @"connectDismissed";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_connectedBannerDismissedCount));
  v60[3] = v7;
  v59[4] = @"reverseAudioIgnored";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_reverseBannerTimeoutCount));
  v60[4] = v8;
  v59[5] = @"reverseAudioAction";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_reverseBannerActionCount));
  v60[5] = v9;
  v59[6] = @"wxPD";
  __int128 v48 = v4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 productID]));
  v60[6] = v10;
  v59[7] = @"wxBuildVersion";
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 firmwareVersion]);
  id v12 = (void *)v11;
  id v13 = &stru_100212678;
  if (v11) {
    id v13 = (const __CFString *)v11;
  }
  v60[7] = v13;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  8LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRoutingUI", v14);

  v57[0] = @"nearbyRouting";
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_nearbyBannerRouting));
  v58[0] = v53;
  v57[1] = @"autoRoutingSingle";
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_autoRoutingSingle));
  v58[1] = v50;
  v57[2] = @"autoRoutingTipi";
  id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_autoRoutingTipi));
  v58[2] = v49;
  v57[3] = @"autoRoutingHijack";
  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_autoRoutingHijack));
  v58[3] = v47;
  v57[4] = @"autoRoutingHijackError";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_autoRoutingHijackError));
  v58[4] = v15;
  v57[5] = @"reverseRouting";
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_reverseRoutingCount));
  v58[5] = v16;
  v57[6] = @"routingManual";
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_routingManualCount));
  v58[6] = v17;
  v57[7] = @"wxPD";
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v48 productID]));
  v58[7] = v18;
  v57[8] = @"fakeHfpSession";
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_fakeHfpSessionCount));
  v58[8] = v19;
  v57[9] = @"fakeHfpSessionReject";
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_fakeHfpSessionRejectCount));
  v58[9] = v20;
  v57[10] = @"wxBuildVersion";
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v48 firmwareVersion]);
  uint64_t v22 = (void *)v21;
  unsigned int v23 = &stru_100212678;
  if (v21) {
    unsigned int v23 = (const __CFString *)v21;
  }
  v58[10] = v23;
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  11LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRoutingAudioRouting", v24);

  uint64_t v25 = v48;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v48 btAddressData]);
  uint64_t v27 = CUPrintNSDataAddress(v26);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  if (v28)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v28));
    unsigned int v30 = [v29 mode];
    if (v30 > 2) {
      uint64_t v31 = "?";
    }
    else {
      uint64_t v31 = off_100207B08[v30];
    }
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));

    id v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v28));
    unsigned int v34 = [v33 mode];

    if (v34 == 1)
    {
      uint64_t v35 = 1LL;
    }

    else
    {
      unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v28));
      unsigned int v37 = [v36 mode];

      if (v37 == 2) {
        uint64_t v35 = 4294957297LL;
      }
      else {
        uint64_t v35 = 0LL;
      }
    }

    v55[0] = @"enableSR";
    unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v28));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v54 enableCount]));
    v56[0] = v51;
    v55[1] = @"disableSR";
    id v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevicesSrModeCache,  "objectForKeyedSubscript:",  v28));
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v38 disableCount]));
    v56[1] = v39;
    v56[2] = v32;
    v55[2] = @"mode";
    v55[3] = @"modeOffset";
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v35));
    v56[3] = v40;
    v55[4] = @"srCapable";
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_prefSmartRoutingEnabledPhase3));
    v56[4] = v41;
    v55[5] = @"wxBuildVersion";
    uint64_t v42 = objc_claimAutoreleasedReturnValue([v48 firmwareVersion]);
    __int128 v43 = (void *)v42;
    uint64_t v44 = &stru_100212678;
    if (v42) {
      uint64_t v44 = (const __CFString *)v42;
    }
    v56[5] = v44;
    void v55[6] = @"wxPD";
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v48 productID]));
    v56[6] = v45;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  7LL));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRoutingMode", v46);

    uint64_t v25 = v48;
  }

  self->_nearbyBannerActionCount = 0;
  *(void *)&self->_connectedBannerDismissedCount = 0LL;
  *(void *)&self->_reverseBannerActionCount = 0LL;
  *(void *)&self->_nearbyBannerTimeoutCount = 0LL;
  self->_autoRoutingSingle = 0;
  *(void *)&self->_autoRoutingTipi = 0LL;
  self->_autoRoutingHijackError = 0;
  self->_reverseRoutingCount = 0;
  self->_routingManualCount = 0;
  *(void *)&self->_fakeHfpSessionCount = 0LL;
}

- (void)_submitMetricNearby:(unsigned int)a3
{
  nearByStats = self->_nearByStats;
  if (nearByStats)
  {
    uint64_t v5 = *(void *)&a3;
    v11[0] = @"noNB";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[BTSmartRoutingNearbyStats noNearbyDeviceFoundCount](nearByStats, "noNearbyDeviceFoundCount")));
    v12[0] = v6;
    v11[1] = @"nbTp";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[BTSmartRoutingNearbyStats nearbyDeviceNoTipiScoreCount]( self->_nearByStats,  "nearbyDeviceNoTipiScoreCount")));
    v12[1] = v7;
    v11[2] = @"wxPD";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    v12[2] = v8;
    v11[3] = @"FDBT";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[BTSmartRoutingNearbyStats SRConnectedSetCount](self->_nearByStats, "SRConnectedSetCount")));
    v12[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
    CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.backOff", v10);

    -[BTSmartRoutingNearbyStats setNoNearbyDeviceFoundCount:](self->_nearByStats, "setNoNearbyDeviceFoundCount:", 0LL);
    -[BTSmartRoutingNearbyStats setNearbyDeviceNoTipiScoreCount:]( self->_nearByStats,  "setNearbyDeviceNoTipiScoreCount:",  0LL);
    -[BTSmartRoutingNearbyStats setSRConnectedSetCount:](self->_nearByStats, "setSRConnectedSetCount:", 0LL);
    -[BTSmartRoutingNearbyStats setMinRSSIHeadset:](self->_nearByStats, "setMinRSSIHeadset:", 0LL);
  }

- (void)_submitMetricTipiHealingforDevice:(id)a3 withDuration:(double)a4 andLegacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceAddress]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:"));
  id v10 = (void *)v9;
  uint64_t v11 = &stru_100212678;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  id v12 = v11;

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 otherTipiDeviceBTName]);
  BOOL v14 = (void *)v13;
  uint64_t v15 = @"Null";
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  int v16 = v15;

  LODWORD(v17) = vcvtpd_s64_f64(a4);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)(a4 * 1000.0)));
  if (a4 > 10.0
    && dword_100234408 <= 90
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  {
    id v20 = "yes";
    if (v5) {
      id v20 = "no";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]",  90LL,  "### Tipi healing duration %@ is larger than 10s, isV2 %s",  v18,  v20);
  }

  BOOL v21 = -[SmartRoutingStats mediaPlaying](self->_stats, "mediaPlaying")
     || -[SmartRoutingStats callConnected](self->_stats, "callConnected");
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t v22 = "yes";
    if (v5) {
      unsigned int v23 = "no";
    }
    else {
      unsigned int v23 = "yes";
    }
    if (!v21) {
      uint64_t v22 = "no";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]",  30LL,  "Submit TiPiHealing stats, duration: %@s, TH V2: %s, audio playing: %s",  v18,  v23,  v22);
  }

  v30[0] = @"Thv2";
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !v5));
  v31[0] = v24;
  v31[1] = v18;
  v30[1] = @"duration";
  v30[2] = @"durationMS";
  v31[2] = v19;
  v30[3] = @"isPlaying";
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21));
  v31[3] = v25;
  v31[4] = v16;
  v30[4] = @"otherTiPiDevice";
  void v30[5] = @"tipiV2Eligible";
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 isTipiHealingV2Eligible]));
  v31[5] = v26;
  v31[6] = v12;
  v30[6] = @"wxBuildVersion";
  void v30[7] = @"wxPD";
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v8 productID]));
  v31[7] = v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  8LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.TiPiHealing", v28);
}

- (void)_submitManualRouteDetectionMetric:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));

  id v8 = &stru_100212678;
  if (v7) {
    id v8 = v7;
  }
  uint64_t v9 = v8;

  uint64_t v10 = mach_absolute_time();
  uint64_t v11 = UpTicksToSeconds(v10 - self->_hijackAcceptedTime);
  if ([v6 containsString:@"Speaker"]
    && dword_100234408 <= 30
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitManualRouteDetectionMetric:]",  30LL,  "Route check after manual routing action is Speaker");
  }

  v17[0] = v6;
  v16[0] = @"route";
  v16[1] = @"srCapable";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_prefSmartRoutingEnabledPhase3));
  v17[1] = v12;
  v16[2] = @"wxProductID";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  v17[2] = v13;
  v16[3] = @"timeSinceLastHijack";
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
  void v16[4] = @"wxFWVersion";
  v17[3] = v14;
  v17[4] = v9;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  5LL));

  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.ManualRoute", v15);
}

- (void)_submitRouteChangeDetectionMetric:(id)a3 andAnswer:(int64_t)a4
{
  else {
    uint64_t v5 = off_100207B20[a4 - 1];
  }
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  uint64_t v8 = -[BTSmartRoutingDaemon _getWxProductID:](self, "_getWxProductID:", v6);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getCurrentRoute](self, "_getCurrentRoute"));
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _submitRouteChangeDetectionMetric:andAnswer:]",  30LL,  "Route check after hijack %@ for %ds current route %@",  v7,  5LL,  v9);
  }
  v12[0] = @"hijackAnswer";
  v12[1] = @"route";
  v13[0] = v7;
  v13[1] = v9;
  v12[2] = @"wxProductID";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v13[2] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));
  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRouting.hijackRouteDetection", v11);
}

- (BOOL)_supportsSR:(id)a3 andProductID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = -[BTSmartRoutingDaemon _supportsTipi:](self, "_supportsTipi:", a3);
  if (v6) {
    return 1;
  }
  uint64_t DeviceClass = GestaltGetDeviceClass(v6);
  else {
    return 0;
  }
}

- (BOOL)_supportsTipi:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 btAddressData]);
        uint64_t v13 = CUPrintNSDataAddress(v12);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)_supportsPhoneWatchTipi:(unsigned int)a3
{
  unsigned int v3 = a3 - 8194;
  if (a3 - 8194 <= 0xE) {
    unsigned int v4 = (0x3F64u >> (a3 - 2)) & 1;
  }
  else {
    LOBYTE(v4) = 1;
  }
  BOOL v5 = v3 > 0x22;
  uint64_t v6 = (1LL << v3) & 0x47A877F9BLL;
  if (v5 || v6 == 0) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)_setTipiElectionType:(BOOL)a3 withDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = v6;
  if (v4)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setTipiElectionType:withDevice:]",  30LL,  "Start Phase1 TiPi connection");
    }

    self->_tipiElectionThroughLEPipe = 0;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = 0LL;
  }

  else
  {
    id v7 = v6;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1 || (v9 = _LogCategory_Initialize(&dword_100234408, 30LL), id v7 = v11, v9))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setTipiElectionType:withDevice:]",  30LL,  "Start LE Pipe TiPi connection");
        id v7 = v11;
      }
    }

    self->_tipiElectionThroughLEPipe = 1;
    uint64_t v10 = v7;
    lePipeDevice = self->_lePipeDevice;
    self->_lePipeDevice = v10;
  }
}

- (void)_tipiHealingAttempt
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_100019A08;
  __int128 v18 = sub_100019A18;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100019A08;
  id v12 = sub_100019A18;
  id v13 = 0LL;
  smartRoutingWxDeviceMap = self->_smartRoutingWxDeviceMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100047DDC;
  v7[3] = &unk_1002074B0;
  void v7[4] = self;
  void v7[5] = &v8;
  void v7[6] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( smartRoutingWxDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v7);
  if (v9[5])
  {
    if (v15[5])
    {
      if (-[BTSmartRoutingDaemon _lastConnectIsWatchCheck:](self, "_lastConnectIsWatchCheck:"))
      {
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          BOOL v4 = "Evaluator: Skip tipi healing, lastConnected device address is Watch";
LABEL_14:
          LogPrintF(&dword_100234408, "-[BTSmartRoutingDaemon _tipiHealingAttempt]", 30LL, v4);
        }
      }

      else
      {
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v9[5]));
        unsigned int v6 = [v5 tipiHealingBackoff];

        if (v6)
        {
          if (dword_100234408 <= 30
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
          {
            BOOL v4 = "Tipi healing backoff for ongoing FD";
            goto LABEL_14;
          }
        }

        else
        {
          -[BTSmartRoutingDaemon _startTipiHealing:withLastConnect:]( self,  "_startTipiHealing:withLastConnect:",  v9[5],  v15[5]);
        }
      }
    }

    else if (dword_100234408 <= 90 {
           && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    }
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipiHealingAttempt]",  90LL,  "Unable to heal Tipi, lastConnected device address is not valid.");
    }
  }

  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (void)_tipiHealing:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v6));
  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v6));
  if ([@"5A187" compare:v8 options:64] == (id)1)
  {
    [v9 setIsTipiHealingV2Eligible:0];
    if (dword_100234408 <= 60
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 60LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]",  60LL,  "###TipiTableEvent: Skip tipi healing, wx fw version is %@ < %@",  v8,  @"5A187");
    }

    -[BTSmartRoutingDaemon _tipiHealingAttempt](self, "_tipiHealingAttempt");
    goto LABEL_47;
  }

  id v49 = self;
  id v52 = v6;
  uint64_t v53 = v9;
  uint64_t v51 = v8;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  uint64_t v50 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.icloudpairing");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v50, "devices"));
  id v11 = [v10 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (!v11) {
    goto LABEL_46;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v63;
  while (2)
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v63 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 publicAddressForIDSDevice:v17]);

      if (v18 && [v18 isEqualToString:v7])
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 productName]);
        if (![v19 isEqualToString:@"iPhone OS"]
          || v15 && ([v15 operatingSystemVersion], v61 >= 16))
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 modelIdentifier]);
          if (([v20 containsString:@"Mac"] & 1) == 0)
          {

            goto LABEL_23;
          }

          if (v15)
          {
            [v15 operatingSystemVersion];

            if (v60 < 13)
            {
LABEL_36:
              [v53 setIsTipiHealingV2Eligible:0];
              if (dword_100234408 <= 60
                && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 60LL)))
              {
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipiHealing:withDevice:]",  60LL,  "###TipiTableEvent: Skip tipi healing, other source device is not running eligible software; Use legacy Tipi Healing");
              }

              -[BTSmartRoutingDaemon _tipiHealingAttempt](v49, "_tipiHealingAttempt");
LABEL_45:

              goto LABEL_46;
            }

- (void)_tipihHealingV2Handling:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getWxFWVersion:](self, "_getWxFWVersion:", v4));
  if (self->_activityLevelMediaPlaying
    || (int)-[CUSystemMonitor activeCallCount](self->_callMonitor, "activeCallCount") > 0)
  {
    LODWORD(v7) = 1;
  }

  else
  {
    LODWORD(v7) = -[NSString isEqualToString:](self->_cdDeviceIdentifier, "isEqualToString:", v4);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyWxDeviceMap,  "objectForKeyedSubscript:",  v8));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 zeroSourceLastRouteHost]);

  __int128 v65 = (void *)v10;
  unsigned int v64 = -[BTSmartRoutingDaemon _isMyAddress:](self, "_isMyAddress:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v4));
  unsigned int v12 = [v11 userConnectedState];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
  if ([v13 audioStreamState])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v4));
    BOOL v15 = (int)[v14 audioStreamState] > 1;
  }

  else
  {
    BOOL v15 = 1;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    if (self->_isBTRoute) {
      uint64_t v16 = "yes";
    }
    else {
      uint64_t v16 = "no";
    }
    if ((_DWORD)v7) {
      __int128 v17 = "yes";
    }
    else {
      __int128 v17 = "no";
    }
    uint64_t v61 = v17;
    __int128 v62 = v16;
    if (v64) {
      __int128 v18 = "yes";
    }
    else {
      __int128 v18 = "no";
    }
    uint64_t v60 = v18;
    else {
      id v19 = "no";
    }
    uint64_t v59 = v19;
    char v63 = (char)v7;
    id v7 = v8;
    else {
      id v20 = "no";
    }
    if (v15) {
      BOOL v21 = "yes";
    }
    else {
      BOOL v21 = "no";
    }
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srBudswapDeviceMap,  "objectForKeyedSubscript:",  v4));
    if (v22) {
      unsigned int v23 = "yes";
    }
    else {
      unsigned int v23 = "no";
    }
    if (v12) {
      unsigned int v24 = "yes";
    }
    else {
      unsigned int v24 = "no";
    }
    uint64_t v58 = v20;
    uint64_t v8 = v7;
    LOBYTE(v7) = v63;
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]",  30LL,  "TipiTableEvent: isBTRoute %s streaming %s isLastRoute %s isLastPlay %s otherLastPlay %s audioState %s budswap %s UserConnected %s",  v62,  v61,  v60,  v59,  v58,  v21,  v23,  v24);
  }

  if (self->_isBTRoute) {
    char v25 = (char)v7;
  }
  else {
    char v25 = 0;
  }
  if ((v25 & 1) != 0
    || (v8 ? (unsigned int v26 = v64) : (unsigned int v26 = 0),
        v26 == 1 && ![v5 otherTipiDeviceLastPlay]
     || self->_callConnected
     || (self->_splitterStateOn ? (int v27 = 1) : (int v27 = v12), v27 == 1)))
  {
    [v5 _setRoutingAction:1];
    uint64_t v28 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
    if (v12)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_srDiscoveredDeviceMap,  "objectForKeyedSubscript:",  v4));
      [v29 _setUserConnectedState:0];
    }
  }

  else
  {
    [v5 _setRoutingAction:3];
    uint64_t v28 = &OBJC_PROTOCOL___AAServicesXPCClientInterface;
  }

  [v5 setIsTipiHealingV2Eligible:1];
  nearbyInfoDevicesTriangleRecoveryTimer = self->_nearbyInfoDevicesTriangleRecoveryTimer;
  if (nearbyInfoDevicesTriangleRecoveryTimer)
  {
    uint64_t v31 = nearbyInfoDevicesTriangleRecoveryTimer;
    dispatch_source_cancel(v31);
    uint64_t v32 = self->_nearbyInfoDevicesTriangleRecoveryTimer;
    self->_nearbyInfoDevicesTriangleRecoveryTimer = 0LL;
  }

  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    int inst_meths = (int)v28[14].inst_meths;
    if (inst_meths >= 31)
    {
      uint64_t v35 = tipiHealingTimer;
    }

    else
    {
      if (inst_meths != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)) {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]",  30LL,  "TipiTableEvent: Cancel legacy Tipi healing timer");
      }
      uint64_t v35 = self->_tipiHealingTimer;
      if (!v35) {
        goto LABEL_62;
      }
    }

    dispatch_source_cancel((dispatch_source_t)v35);
    unsigned int v36 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = 0LL;

LABEL_62:
    self->_BOOL tipiElectionInProgress = 0;
  }

  -[BTSmartRoutingDaemon _notifyOtherTipiDeviceTipiScoreChanged:andNewScore:]( self,  "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:",  0LL,  0LL);
  [v5 _setRoutingInitialized:1];
  if (self->_tipiHealingHijackTimer
    && !-[BTSmartRoutingDaemon _deviceSupportsHijackV2:withDevice:](self, "_deviceSupportsHijackV2:withDevice:", v6, v5))
  {
    tipiHealingHijackTimer = self->_tipiHealingHijackTimer;
    if (tipiHealingHijackTimer)
    {
      id v38 = tipiHealingHijackTimer;
      dispatch_source_cancel(v38);
      unsigned int v39 = self->_tipiHealingHijackTimer;
      self->_tipiHealingHijackTimer = 0LL;
    }

    int v40 = (int)v28[14].inst_meths;
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]",  30LL,  "TipiTableEvent: Tipi healing complete now but device FW does not support HijackV2, service pending MX request");
    }
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v5 audioRoutingRequest]);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v5 audioRoutingResponse]);
    -[BTSmartRoutingDaemon _smartRoutingAudioRoutingRequest:withResponseHandler:]( self,  "_smartRoutingAudioRoutingRequest:withResponseHandler:",  v41,  v42);
  }

  if (([v5 tipitableUpdated] & 1) == 0)
  {
    char v43 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _myBluetoothAddressString](self, "_myBluetoothAddressString"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceBTAddress]);
    uint64_t v45 = v8;
    if ([v5 routingAction] == 1)
    {
      id v71 = v43;
      uint64_t v46 = &v71;
      __int128 v47 = v44;
    }

    else
    {
      uint64_t v70 = v44;
      uint64_t v46 = &v70;
      __int128 v47 = v43;
    }

    v46[1] = v47;
    unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
    id v49 = (void *)objc_claimAutoreleasedReturnValue( -[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:]( self,  "_verifyWxConnectedBTAddress:withVersion:",  v4,  &off_1002190E0));
    int v50 = (int)v28[14].inst_meths;
    if (v50 <= 90 && (v50 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL))) {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]",  90LL,  "TipiTableEvent: update wx Tipi table for Wx %@, addresses %@",  v4,  v48);
    }
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100049080;
    v66[3] = &unk_1002073A8;
    id v67 = v4;
    unint64_t v68 = v48;
    id v69 = v5;
    -[BTSmartRoutingDaemon _updateAccessoryID:connectionDeviceAddresses:completion:]( self,  "_updateAccessoryID:connectionDeviceAddresses:completion:",  v49,  v48,  v66);

    uint64_t v8 = v45;
  }

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxStatsMap,  "objectForKeyedSubscript:",  v4));

  if (v51)
  {
    uint64_t v52 = mach_absolute_time();
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxStatsMap,  "objectForKeyedSubscript:",  v4));
    double v54 = UpTicksToSecondsF(v52 - (void)[v53 thV2Ticks]);

    -[BTSmartRoutingDaemon _submitMetricTipiHealingforDevice:withDuration:andLegacy:]( self,  "_submitMetricTipiHealingforDevice:withDuration:andLegacy:",  v5,  0LL,  v54);
  }

  int v55 = (int)v28[14].inst_meths;
  if (v55 <= 30 && (v55 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    unsigned int v56 = [v5 routingAction];
    if (v56 > 5) {
      uint64_t v57 = "?";
    }
    else {
      uint64_t v57 = off_100207BA8[v56];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipihHealingV2Handling:]",  30LL,  "TipiTableEvent: current route action is %s",  v57);
  }
}

- (void)_tipiHealingStartTimer:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, 10000000000LL);
  tipiHealingTimer = self->_tipiHealingTimer;
  if (tipiHealingTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    id v7 = self->_tipiHealingTimer;
    self->_tipiHealingTimer = v6;

    uint64_t v8 = self->_tipiHealingTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100049208;
    handler[3] = &unk_100206058;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_tipiHealingTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_tipiHealingTimer);
  }

- (void)_triggerTipiTableUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v11 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectedDevices, "objectForKeyedSubscript:"));
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      aaController = self->_aaController;
      unsigned int v8 = -[BTSmartRoutingDaemon _aacpConnectedCheck:](self, "_aacpConnectedCheck:", v6);
      int v9 = "no";
      if (v8) {
        int v9 = "yes";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _triggerTipiTableUpdate:]",  30LL,  "TriggerTipiTableUpdate: aaController %@ AACP connected %s",  aaController,  v9);
    }

    -[AAController sendGetTipiTableMessageToDestinationIdentifier:completionHandler:]( self->_aaController,  "sendGetTipiTableMessageToDestinationIdentifier:completionHandler:",  v11,  &stru_1002074D0);

    goto LABEL_12;
  }

  if (dword_100234408 <= 90)
  {
    id v11 = 0LL;
    if (dword_100234408 != -1 || (int v10 = _LogCategory_Initialize(&dword_100234408, 90LL), v5 = 0LL, v10))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _triggerTipiTableUpdate:]",  90LL,  "TriggerTipiTableUpdate: Skip, no wx address ");
LABEL_12:
      BOOL v5 = v11;
    }
  }
}

- (BOOL)_deviceSupportsHijackV2:(id)a3 withDevice:(id)a4
{
  id v5 = a4;
  if ([@"5E135" compare:a3 options:64] == (id)1)
  {
    BOOL v6 = 0;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 otherTipiDeviceVersion]);
    BOOL v6 = (int)[v7 intValue] > 1;
  }

  return v6;
}

- (void)_tipiHealingHijackTimerStart:(id)a3 withScore:(int)a4
{
  id v6 = a3;
  id v7 = self->_tipiHealingHijackTimer;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  void v13[3] = sub_100019A08;
  void v13[4] = sub_100019A18;
  id v14 = 0LL;
  if (v7)
  {
    dispatch_source_t v8 = (dispatch_source_t)v7;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipiHealingHijackTimerStart:withScore:]",  30LL,  "Tipi Healing hijack timer already running!");
    }
  }

  else
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _tipiHealingHijackTimerStart:withScore:]",  30LL,  "Tipi Healing hijack timer start : %d seconds, waiting for Tipi healing",  2);
    }

    dispatch_source_t v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_tipiHealingHijackTimer, v8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000496A4;
    handler[3] = &unk_1002074F8;
    void handler[4] = self;
    int v12 = a4;
    id v10 = v6;
    id v11 = v13;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(v8, 2.0, -1.0, -10.0);
    dispatch_activate(v8);
  }

  _Block_object_dispose(v13, 8);
}

- (BOOL)_arbitrationTimeout:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  connectedDevices = self->_connectedDevices;
  id v7 = a3;
  dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](connectedDevices, "objectForKeyedSubscript:", v7));
  unsigned int v9 = [v8 audioStreamState];

  if (v9 - 1 > 2) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = dword_1001A5D5C[v9 - 1];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v7));

  id v12 = [v11 hijackBackoffTicks];
  BOOL v14 = (_DWORD)v4 == 501 || (int)v10 <= (int)v4;
  if (v12) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v14;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t v16 = @"DontRoute";
    if (v15) {
      uint64_t v16 = @"Route";
    }
    if (v9 > 3) {
      __int128 v17 = "?";
    }
    else {
      __int128 v17 = off_100207B40[v9];
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _arbitrationTimeout:withScore:]",  30LL,  "Arbitration timeout: Decision is %@, remote category %d, local category %d wxStreamState %s",  v16,  v10,  v4,  v17);
  }

  return v15;
}

- (void)_setPipeMessageStats:(unint64_t)a3
{
  if ((unint64_t)UpTicksToSeconds(-[SmartRoutingStats firstPipeMessageRTT](self->_stats, "firstPipeMessageRTT")) >= 4
    && dword_100234408 <= 90
    && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _setPipeMessageStats:]",  90LL,  "First Pipe message took more than 3 seconds!");
  }

- (void)_updateAudioRoute:(int)a3 withUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  if ((_DWORD)v4 && -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute") != (_DWORD)v4)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      unsigned int v6 = -[BTSmartRoutingSourceDevice audioRoute](self->_sourceDevice, "audioRoute");
      if (v6 > 4) {
        id v7 = "?";
      }
      else {
        id v7 = off_100207B60[v6];
      }
      else {
        dispatch_source_t v8 = off_100207B88[(int)v4 - 1];
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateAudioRoute:withUUID:]",  30LL,  "Device audio route changed: %s -> %s %@",  v7,  v8,  v9);
    }

    -[BTSmartRoutingSourceDevice setAudioRoute:](self->_sourceDevice, "setAudioRoute:", v4);
    -[BTSmartRoutingSourceDevice setAudioDestination:](self->_sourceDevice, "setAudioDestination:", v9);
  }
}

- (void)_updateLocalAudioCategory:(id)a3
{
  id v5 = (NSNumber *)a3;
  localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
  if (localDeviceAudioCatogory != v5)
  {
    id v11 = v5;
    if (dword_100234408 <= 90)
    {
      if (dword_100234408 == -1)
      {
        localDeviceAudioCatogory = self->_localDeviceAudioCatogory;
      }

      id v7 = (id)-[NSNumber intValue](localDeviceAudioCatogory, "intValue");
      id v8 = (id)-[NSNumber intValue](v11, "intValue");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingSourceDevice activePlayingApp](self->_sourceDevice, "activePlayingApp"));
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateLocalAudioCategory:]",  90LL,  "Updating local audio category %d -> %d app %@",  v7,  v8,  v9);
    }

- (void)_updateOtherTipiBuildVersion:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 otherTipiDeviceBTAddress]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 otherTipiDeviceBTAddress]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTSmartRoutingDaemon _getIDSDeviceFromBtAddress:](self, "_getIDSDeviceFromBtAddress:", v6));

    if (v7)
    {
      [v7 operatingSystemVersion];
      uint64_t v8 = v13;
      [v7 operatingSystemVersion];
      uint64_t v9 = v11;
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v10 = 0LL;
    }

    objc_msgSend(v4, "_setOtherTipiDeviceBuildVersion:andMinorBuildVersion:", v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (void)_updateOtherTipiDevice:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6 withResult:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v19));
  uint64_t v16 = v15;
  if (v15)
  {
    if (a7)
    {
      [v15 _setRoutingAction:2];
      [v16 _setOtherTipiDeviceInfo:0 andName:0 andVersion:0];
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v19,  &stru_100212678,  0LL,  3LL);
    }

    else
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:]",  30LL,  "Smart Routing updating device %@ with otherAddress %@ otherName %@ otherVersion %@",  v19,  v12,  v13,  v14);
      }

      id v17 = v12;
      [v16 _setOtherTipiDeviceInfo:v17 andName:v13 andVersion:v14];
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v19,  v17,  0LL,  1LL);

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v19));
      [v18 _setOtherTipiAudioCategory:0];
    }

    -[BTSmartRoutingDaemon _postNotification:]( self,  "_postNotification:",  "com.apple.BluetoothServices.AudioRoutingChanged");
  }

  else if (dword_100234408 <= 90 {
         && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
  }
  {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:]",  90LL,  "SR device not found. Something went wrong please file a radar.");
  }
}

- (void)_updateOtherTipiDevicewithAudioCategory:(id)a3 otherAddress:(id)a4 otherName:(id)a5 otherVersion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v17));
  id v14 = v10;
  if (v13)
  {
    [v13 _setOtherTipiDeviceInfo:v14 andName:v11 andVersion:v12];
    if (self->_isBTRoute) {
      uint64_t v15 = 1LL;
    }
    else {
      uint64_t v15 = 3LL;
    }
    [v13 _setRoutingAction:v15];
    if (v14)
    {
      -[BTSmartRoutingDaemon _updateNearbyDeviceState:withAddress:withEasyPairing:withState:]( self,  "_updateNearbyDeviceState:withAddress:withEasyPairing:withState:",  v17,  v14,  0LL,  1LL);
      [v12 doubleValue];
      if (v16 >= 2.0)
      {
        if (self->_localDeviceAudioCatogory) {
          -[BTSmartRoutingDaemon _sendAudioCategory:withAudioCategory:]( self,  "_sendAudioCategory:withAudioCategory:",  v17);
        }
      }
    }
  }
}

- (id)_verifyWxConnectedBTAddress:(id)a3 withVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedDevices,  "objectForKeyedSubscript:",  v6)),  v8,  !v8))
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:]",  30LL,  "Wx %@ is not connected",  v6);
    }

    unsigned int v22 = 0LL;
  }

  else
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDiscovery discoveredDevices](self->_pairedDiscovery, "discoveredDevices"));
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      char v25 = self;
      uint64_t v12 = *(void *)v27;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 btAddressData]);
          if ([v15 length] != (id)6)
          {
            [v7 doubleValue];
            __int128 v18 = 0LL;
LABEL_14:

            goto LABEL_15;
          }

          id v16 = v15;
          uint64_t v17 = NSPrintF("%.6a", COERCE_DOUBLE([v16 bytes]));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          [v7 doubleValue];
          if (v19 < 1.1)
          {
            id v20 = (CBDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v25->_connectedDevices,  "objectForKeyedSubscript:",  v18));
            goto LABEL_26;
          }

          if (!v18) {
            goto LABEL_14;
          }
          if ([v6 isEqualToString:v18]
            && ([v14 deviceFlags] & 0x10) != 0)
          {
            id v20 = v14;
LABEL_26:
            unsigned int v22 = v20;
            goto LABEL_29;
          }

          if (![v6 isEqualToString:v18]
            || ([v14 deviceFlags] & 0x10) != 0)
          {
            goto LABEL_14;
          }

          BOOL v21 = objc_alloc_init(&OBJC_CLASS___CBDevice);
          -[CBDevice setIdentifier:](v21, "setIdentifier:", @"FF:FF:FF:FF:FF:FF");
          unsigned int v22 = v21;
          if (dword_100234408 <= 50
            && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 50LL)))
          {
            LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _verifyWxConnectedBTAddress:withVersion:]",  50LL,  "Source is connected to headset %@ however Tipi flag is missing",  v6);
          }

LABEL_29:
          if (v22) {
            goto LABEL_33;
          }
LABEL_15:
          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v23 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        id v11 = v23;
      }

      while (v23);
    }

    unsigned int v22 = 0LL;
LABEL_33:
  }

  return v22;
}

- (BOOL)_verifyWxConnectedRouted:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
  unsigned int v6 = [v5 routed];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
  if ([v7 inEar])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 otherTipiDeviceBTAddress]);

    if (!v9) {
      unsigned int v6 = 1;
    }
  }

  else
  {
    unsigned int v6 = 1;
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    id v10 = "yes";
    if (v6) {
      id v11 = "yes";
    }
    else {
      id v11 = "no";
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_smartRoutingWxDeviceMap,  "objectForKeyedSubscript:",  v4));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 otherTipiDeviceBTAddress]);
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _verifyWxConnectedRouted:]",  30LL,  "Smart Routing %@ routed %s inEar %s otherTipiAddress %@",  v4,  v11,  v10,  v14);
  }

  return v6;
}

- (void)_watchHintingRecovery
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A4D0;
  block[3] = &unk_100206058;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchMediaControl
{
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingDaemon _watchMediaControl]",  30LL,  "Watch being used as media remote to control music..");
  }
}

- (void)_watchRecoveryStartTimer
{
  dispatch_time_t v3 = dispatch_time(0LL, 120000000000LL);
  watchRecoveryTimer = self->_watchRecoveryTimer;
  if (watchRecoveryTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    unsigned int v6 = self->_watchRecoveryTimer;
    self->_watchRecoveryTimer = v5;

    id v7 = self->_watchRecoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10004A760;
    handler[3] = &unk_100206058;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_watchRecoveryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_watchRecoveryTimer);
  }

- (BTSmartRoutingRouteRequest)pipePendingRequest
{
  return self->_pipePendingRequest;
}

- (void)setPipePendingRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end