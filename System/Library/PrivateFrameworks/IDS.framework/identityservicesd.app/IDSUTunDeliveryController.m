@interface IDSUTunDeliveryController
+ (IDSUTunDeliveryController)sharedInstance;
- (BOOL)defaultPeerIsCloudConnected;
- (BOOL)defaultPeerIsNearby;
- (BOOL)enableOTR;
- (BOOL)hasSpaceForCloudMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4;
- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4;
- (BOOL)isClassCConnected;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isLocalSetUpInProgress;
- (BOOL)isPeerForPhoneContinuityLocalMessage:(id)a3;
- (BOOL)isPresent;
- (BOOL)isTerminusConnected;
- (BOOL)isTerminusConnectedOverBluetooth;
- (BOOL)isTerminusNearby;
- (BOOL)isTerminusRegistered;
- (BOOL)localSetupInProgress;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice;
- (IDSConnectivityMonitor)connectivityMonitor;
- (IDSNRDeviceBridge)idsNRDeviceBridge;
- (IDSNRDevicePreferencesHandler)nrDevicePreferencesHandler;
- (IDSPairingManager)pairingManager;
- (IDSUTunDeliveryController)init;
- (IDSUTunDeliveryController)initWithBroadcastQueue:(id)a3 pairingManager:(id)a4;
- (IDSUTunDeliveryControllerDelegate)delegate;
- (NSDictionary)defaultPriorityMessageStatistics;
- (NSDictionary)queuedIncomingMessageDictionary;
- (NSDictionary)sendingMessageStatistics;
- (NSDictionary)syncPriorityMessageStatistics;
- (NSDictionary)urgentCloudPriorityMessageStatistics;
- (NSDictionary)urgentPriorityMessageStatistics;
- (NSSet)allowedTrafficClasses;
- (double)lastCloudConnectedTime;
- (double)notificationDelayInSeconds;
- (id)_copyPairedDevice;
- (id)_copyPeerWithID:(id)a3;
- (id)_createPeerFromDeviceID:(id)a3;
- (id)_createPeerFromDeviceInfo:(id)a3;
- (id)_currentOTRTimer;
- (id)_deviceIDForPeer:(id)a3;
- (id)_pairedDeviceUUID;
- (id)hashForString:(id)a3;
- (id)lockedContinuityPeerID:(id)a3;
- (id)pendingContinuityPeerID:(id)a3;
- (id)sessionIDforPeer:(id)a3;
- (id)topicForStreamID:(unsigned __int16)a3;
- (unsigned)_nextMessageID;
- (void)_OTREnableTimerFiredOnMain;
- (void)_cleanupContinuityPeerMaps:(id)a3;
- (void)_disableOTRForDefaultPairedPeer:(id)a3;
- (void)_enableOTRForDefaultPairedDevice;
- (void)_refreshIPsecStatus;
- (void)_removeDevicePreferencesHandler;
- (void)_removePeerFromDeviceID:(id)a3;
- (void)_setCloudConnectionConnected:(BOOL)a3 forPeer:(id)a4;
- (void)_setOTREnableTimer;
- (void)_updateLocalSetupInProgressState:(BOOL)a3;
- (void)addConnectivityDelegate:(id)a3;
- (void)addContinuityPeer:(id)a3 btUUID:(id)a4 connectBlock:(id)a5 failureBlock:(id)a6;
- (void)addUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)dealloc;
- (void)defaultPeerClassCConnectivityDidChange:(BOOL)a3;
- (void)defaultPeerCloudConnectivityChanged:(BOOL)a3;
- (void)defaultPeerConnectivityChanged:(BOOL)a3;
- (void)defaultPeerDropDisallowedMessages;
- (void)defaultPeerLinkTypeChanged:(unsigned __int8)a3;
- (void)defaultPeerMagnetIndicationOfAwakeStateChanged:(BOOL)a3;
- (void)defaultPeerNearbyChanged:(BOOL)a3;
- (void)defaultPeerSetLinkPreferences:(id)a3;
- (void)defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)defaultPeerSetWantsQuickRelayRequest:(BOOL)a3;
- (void)defaultPeerSupportsDirectMessaging:(BOOL)a3 isObliterating:(BOOL)a4;
- (void)defaultPeerUnpairStart;
- (void)deviceWithUniqueID:(id)a3 updatedUUID:(id)a4;
- (void)didAddPairedDevice:(id)a3;
- (void)didRemovePairedDevice:(id)a3;
- (void)didUpdatePairedDevice:(id)a3;
- (void)enableCloudConnectionForDefaultPairedDevice:(BOOL)a3;
- (void)enableConnectionForDefaultPairedDevice:(BOOL)a3;
- (void)enableOTRForDefaultPairedDevice;
- (void)ensureLocalSetupInProgressConsistencyAfterQWS;
- (void)findDefaultPeerToForceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged:(BOOL)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerConnectivityChanged:(BOOL)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerNearbyChanged:(BOOL)a3;
- (void)localAccountSetupCompleted;
- (void)localSetupCompleted;
- (void)localSetupStarted;
- (void)lockContinuityPeer:(id)a3 btUUID:(id)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerClassCConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerCloudConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerNearbyDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 deviceMagnetIndicationOfAwakeStateDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 linkType:(unsigned __int8)a4;
- (void)peer:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7 priority:(int64_t)a8 connectionType:(int64_t)a9;
- (void)peerCloudConnectivityChanged:(id)a3;
- (void)peerCloudConnectivityChanged:(id)a3 isCloudConnected:(BOOL)a4;
- (void)peerConnectivityChanged:(id)a3;
- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withTypes:(id)a6;
- (void)peerHasSpaceForUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 withTypes:(id)a5;
- (void)peerNearbyStateChanged:(id)a3 forceNotify:(BOOL)a4;
- (void)prepareForQuickSwitch;
- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4;
- (void)rapportClient:(id)a3 didLoseDevice:(id)a4;
- (void)removeConnectivityDelegate:(id)a3;
- (void)removeUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4 reason:(int64_t)a5 shouldWait:(BOOL)a6;
- (void)removeUTunPeerWithSessionID:(id)a3 reason:(int64_t)a4 shouldWait:(BOOL)a5;
- (void)sendData:(id)a3 service:(id)a4 protobuf:(id)a5 resourcePath:(id)a6 resourceMetadata:(id)a7 priority:(int64_t)a8 dataProtectionClass:(unsigned int)a9 nonWaking:(BOOL)a10 nonCloudWaking:(BOOL)a11 requireBluetooth:(BOOL)a12 requireLocalWiFi:(BOOL)a13 queueOneIdentifier:(id)a14 expirationDate:(id)a15 enforceRemoteTimeouts:(BOOL)a16 expectsPeerResponse:(BOOL)a17 wantsAppAck:(BOOL)a18 compressPayload:(BOOL)a19 compressed:(BOOL)a20 peerResponseIdentifier:(id)a21 messageID:(id)a22 topic:(id)a23 awdTopic:(id)a24 command:(id)a25 fromID:(id)a26 uriToDeviceID:(id)a27 localDeviceDestinationDeviceUUID:(id)a28 bypassDuet:(BOOL)a29 duetIdentifiersOverride:(id)a30 messageType:(int64_t)a31 fallbackBlock:(id)a32 progressBlock:(id)a33 completionBlock:(id)a34;
- (void)setAllowedTrafficClasses:(id)a3;
- (void)setConnectivityMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueIDToCBUUID:(id)a3;
- (void)setIdsNRDeviceBridge:(id)a3;
- (void)setIsClassCConnected:(BOOL)a3;
- (void)setIsCloudConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsLocalSetUpInProgress:(BOOL)a3;
- (void)setLastCloudConnectedTime:(double)a3;
- (void)setNotificationDelayInSeconds:(double)a3;
- (void)setNrDevicePreferencesHandler:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setPendingCloudFlagOnDefaultPeer;
- (void)setShouldUseIPsecLinkForDefaultPairedDevice:(BOOL)a3;
- (void)setTopics:(id)a3;
- (void)startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:(id)a3;
- (void)stopIdsNRDeviceBridgeAndPreferenceHandler;
- (void)systemScreenDidPowerDown;
- (void)tryNextContinuityPeer:(id)a3;
- (void)unlockAllContinuityPeers;
- (void)unlockContinuityPeer:(id)a3;
- (void)updatecloudDeliveryStateOnDefaultPeer;
@end

@implementation IDSUTunDeliveryController

+ (IDSUTunDeliveryController)sharedInstance
{
  if (qword_1009BED90 != -1) {
    dispatch_once(&qword_1009BED90, &stru_1008FD368);
  }
  return (IDSUTunDeliveryController *)(id)qword_1009BED98;
}

- (IDSUTunDeliveryController)initWithBroadcastQueue:(id)a3 pairingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  im_assert_primary_base_queue(v8, v9);
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___IDSUTunDeliveryController;
  v10 = -[IDSUTunDeliveryController init](&v66, "init");
  v11 = v10;
  if (v10)
  {
    if (!v10->_deviceIDToPeer)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      deviceIDToPeer = v11->_deviceIDToPeer;
      v11->_deviceIDToPeer = (NSMutableDictionary *)Mutable;
    }

    if (!v11->_btuuidToSessionID)
    {
      CFMutableDictionaryRef v14 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      btuuidToSessionID = v11->_btuuidToSessionID;
      v11->_btuuidToSessionID = (NSMutableDictionary *)v14;
    }

    pthread_mutex_init(&v11->_deviceIDToPeerLock, 0LL);
    pthread_mutex_init(&v11->_streamIDToTopicLock, 0LL);
    pthread_mutex_init(&v11->_trafficClassLock, 0LL);
    pthread_mutex_init(&v11->_continuityPeerLock, 0LL);
    v11->_notificationDelayInSeconds = 10.0;
    objc_storeStrong((id *)&v11->_broadcastQueue, a3);
    objc_storeStrong((id *)&v11->_pairingManager, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager cbuuidsOfPairingDevices](v11->_pairingManager, "cbuuidsOfPairingDevices"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager cbuuidsOfPairedDevices](v11->_pairingManager, "cbuuidsOfPairedDevices"));
    if ([v16 count]) {
      BOOL v18 = 1LL;
    }
    else {
      BOOL v18 = [v17 count] == 0;
    }
    uint64_t v19 = OSLogHandleForTransportCategory("Delivery");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = @"not ";
      if (v18) {
        v21 = &stru_100912B50;
      }
      *(_DWORD *)buf = 138412290;
      v68 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: at launch default local setup does %@need to happen.",  buf,  0xCu);
    }

    uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
    if ((_DWORD)v23 && _IDSShouldLogTransport(v23))
    {
      v24 = v18 ? &stru_100912B50 : @"not ";
      v61 = v24;
      _IDSLogTransport( @"Delivery",  @"IDS",  @"LOCALSETUP: at launch default local setup does %@need to happen.");
      if (_IDSShouldLog(0LL, @"Delivery"))
      {
        v61 = v24;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"LOCALSETUP: at launch default local setup does %@need to happen.");
      }
    }

    v11->_shouldUseIPsecLinkForDefaultPairedDevice = -[IDSPairingManager shouldUseIPsecLinkForDefaultPairedDevice]( v11->_pairingManager,  "shouldUseIPsecLinkForDefaultPairedDevice",  v61);
    v25 = objc_alloc(&OBJC_CLASS___IDSUTunPeer);
    uint64_t v26 = IDSDeviceDefaultPairedDeviceUniqueID;
    v27 = -[IDSUTunPeer initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:]( v25,  "initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:",  @"UTunDelivery-Default",  0LL,  IDSDeviceDefaultPairedDeviceUniqueID,  v11->_shouldUseIPsecLinkForDefaultPairedDevice,  0LL,  0LL);
    -[IDSUTunPeer setDelegate:](v27, "setDelegate:", v11);
    -[IDSUTunPeer setLocalSetupInProgress:](v27, "setLocalSetupInProgress:", v18);
    if (-[IDSPairingManager pairedDeviceServiceMinCompatibilityVersion]( v11->_pairingManager,  "pairedDeviceServiceMinCompatibilityVersion") >= 3)
    {
      uint64_t v28 = OSLogHandleForTransportCategory("Delivery");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: Enabling Cloud On This Device",  buf,  2u);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          _IDSLogTransport(@"Delivery", @"IDS", @"LOCALSETUP: Enabling Cloud On This Device");
        }
      }

      -[IDSUTunPeer setSupportsCloudConnections:](v27, "setSupportsCloudConnections:", 1LL);
    }

    -[NSMutableDictionary setObject:forKey:](v11->_deviceIDToPeer, "setObject:forKey:", v27, v26);
    if (v11->_shouldUseIPsecLinkForDefaultPairedDevice) {
      char v32 = 0;
    }
    else {
      char v32 = IMGetDomainBoolForKey(@"com.apple.ids", @"DisableOTR") ^ 1;
    }
    v11->_enableOTR = v32;
    uint64_t v33 = OSLogHandleForTransportCategory("Delivery");
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if (v11->_enableOTR) {
        v35 = @"YES";
      }
      else {
        v35 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v68 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EnableOTR: %@.", buf, 0xCu);
    }

    uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
    if ((_DWORD)v37 && _IDSShouldLogTransport(v37))
    {
      v38 = v11->_enableOTR ? @"YES" : @"NO";
      v62 = v38;
      _IDSLogTransport(@"Delivery", @"IDS", @"EnableOTR: %@.");
      if (_IDSShouldLog(0LL, @"Delivery"))
      {
        if (v11->_enableOTR) {
          v39 = @"YES";
        }
        else {
          v39 = @"NO";
        }
        v62 = (__CFString *)v39;
        _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"EnableOTR: %@.");
      }
    }

    if (-[IDSPairingManager isPaired](v11->_pairingManager, "isPaired", v62))
    {
      uint64_t v40 = OSLogHandleForTransportCategory("Delivery");
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        if (v11->_enableOTR) {
          v42 = @"YES";
        }
        else {
          v42 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v68 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Already paired, set OTR for default paired device: %@",  buf,  0xCu);
      }

      uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
      if ((_DWORD)v44 && _IDSShouldLogTransport(v44))
      {
        v45 = v11->_enableOTR ? @"YES" : @"NO";
        v63 = v45;
        _IDSLogTransport( @"Delivery",  @"IDS",  @"Already paired, set OTR for default paired device: %@");
        if (_IDSShouldLog(0LL, @"Delivery"))
        {
          if (v11->_enableOTR) {
            v46 = @"YES";
          }
          else {
            v46 = @"NO";
          }
          v63 = (__CFString *)v46;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"Already paired, set OTR for default paired device: %@");
        }
      }

      -[IDSUTunPeer setEnableOTR:](v27, "setEnableOTR:", v11->_enableOTR, v63);
      v11->_otrInitialized = 1;
    }

    -[IDSPairingManager addDelegate:](v11->_pairingManager, "addDelegate:", v11);
    v11->_messageID = 0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _pairedDeviceUUID](v11, "_pairedDeviceUUID"));
    -[IDSUTunDeliveryController startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:]( v11,  "startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:",  v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](v11, "idsNRDeviceBridge"));
    -[IDSUTunPeer setIsClassCConnected:](v27, "setIsClassCConnected:", [v48 isClassCConnected]);

    -[IDSUTunDeliveryController _updateLocalSetupInProgressState:](v11, "_updateLocalSetupInProgressState:", v18);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v49 setActive:1];

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v50 setWatchesScreenLightState:1];

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v51 addListener:v11];

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRapportClient sharedInstance](&OBJC_CLASS___IDSRapportClient, "sharedInstance"));
    [v52 addDelegate:v11];

    if (CUTIsInternalInstall())
    {
      v53 = objc_alloc_init(&OBJC_CLASS___IDSConnectivityMonitor);
      connectivityMonitor = v11->_connectivityMonitor;
      v11->_connectivityMonitor = v53;

      uint64_t v55 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      connectivityDelegates = v11->_connectivityDelegates;
      v11->_connectivityDelegates = (NSHashTable *)v55;

      -[NSHashTable addObject:](v11->_connectivityDelegates, "addObject:", v11->_connectivityMonitor);
    }

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_1001C0A34;
    v64[3] = &unk_1008FD390;
    v65 = v11;
    uint64_t v58 = im_primary_queue(v65, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    sub_100301AD8(v64, (uint64_t)@"IDS-Connectivity-Status", (uint64_t)v59);
  }

  return v11;
}

- (IDSUTunDeliveryController)init
{
  uint64_t v3 = im_primary_queue(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v6 = -[IDSUTunDeliveryController initWithBroadcastQueue:pairingManager:]( self,  "initWithBroadcastQueue:pairingManager:",  v4,  v5);

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
  [v3 removeDelegate:self];

  -[IMTimer invalidate](self->_otrTimer, "invalidate");
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0LL;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRapportClient sharedInstance](&OBJC_CLASS___IDSRapportClient, "sharedInstance"));
  [v5 removeDelegate:self];

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_deviceIDToPeer,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1008FD3D0);
  pthread_mutex_destroy(&self->_deviceIDToPeerLock);
  pthread_mutex_destroy(&self->_streamIDToTopicLock);
  pthread_mutex_destroy(&self->_trafficClassLock);
  pthread_mutex_destroy(&self->_continuityPeerLock);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSUTunDeliveryController;
  -[IDSUTunDeliveryController dealloc](&v6, "dealloc");
}

- (id)_pairedDeviceUUID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
  unsigned int v4 = [v3 isPaired];

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSUUID);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedDeviceUUIDString]);
    id v8 = -[NSUUID initWithUUIDString:](v5, "initWithUUIDString:", v7);

    uint64_t v9 = OSLogHandleForTransportCategory("UTunDelivery");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Queried pairedDeviceUUIDString {pairedDeviceUUIDString: %@}",  buf,  0xCu);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"Queried pairedDeviceUUIDString {pairedDeviceUUIDString: %@}");
        if (_IDSShouldLog(0LL, @"UTunDelivery")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Queried pairedDeviceUUIDString {pairedDeviceUUIDString: %@}");
        }
      }
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("UTunDelivery");
    CFMutableDictionaryRef v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not query pairedDeviceUUIDString {isPaired: 0}",  buf,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"Could not query pairedDeviceUUIDString {isPaired: 0}");
        if (_IDSShouldLog(0LL, @"UTunDelivery")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Could not query pairedDeviceUUIDString {isPaired: 0}");
        }
      }
    }

    id v8 = 0LL;
  }

  return v8;
}

- (void)startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
  if (v5
    && (objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge")),
        unsigned int v7 = [v6 isDevicesIdentifierEqualTo:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "NRDeviceMonitor already running for {deviceIdentifier: %@}.",  buf,  0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"NRDeviceMonitor already running for {deviceIdentifier: %@}.");
        if (_IDSShouldLog(0LL, @"UTunDelivery")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"NRDeviceMonitor already running for {deviceIdentifier: %@}.");
        }
      }
    }
  }

  else
  {
    -[IDSUTunDeliveryController _removeDevicePreferencesHandler](self, "_removeDevicePreferencesHandler");
    -[IDSUTunDeliveryController setIdsNRDeviceBridge:](self, "setIdsNRDeviceBridge:", 0LL);
    if (v4)
    {
      uint64_t v12 = -[IDSNRDevicePreferencesHandler initWithDeviceIdentifier:]( objc_alloc(&OBJC_CLASS___IDSNRDevicePreferencesHandler),  "initWithDeviceIdentifier:",  v4);
      -[IDSUTunDeliveryController setNrDevicePreferencesHandler:](self, "setNrDevicePreferencesHandler:", v12);

      uint64_t v13 = -[IDSNRDeviceBridge initWithDeviceIdentifier:delegate:]( objc_alloc(&OBJC_CLASS___IDSNRDeviceBridge),  "initWithDeviceIdentifier:delegate:",  v4,  self);
      -[IDSUTunDeliveryController setIdsNRDeviceBridge:](self, "setIdsNRDeviceBridge:", v13);

      pthread_mutex_lock(&self->_trafficClassLock);
      CFMutableDictionaryRef v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      [v14 setAllowedTrafficClasses:self->_allowedTrafficClasses];

      pthread_mutex_unlock(&self->_trafficClassLock);
    }
  }
}

- (void)stopIdsNRDeviceBridgeAndPreferenceHandler
{
}

- (void)_removeDevicePreferencesHandler
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
    [v4 cancel];

    -[IDSUTunDeliveryController setNrDevicePreferencesHandler:](self, "setNrDevicePreferencesHandler:", 0LL);
  }

- (void)_refreshIPsecStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
  self->_shouldUseIPsecLinkForDefaultPairedDevice = [v3 shouldUseIPsecLinkForDefaultPairedDevice];

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _pairedDeviceUUID](self, "_pairedDeviceUUID"));
  v5 = (void *)v4;
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice && v4 != 0)
  {
    unsigned int v7 = (void *)v4;
    -[IDSUTunDeliveryController startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:]( self,  "startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:",  v4);
    v5 = v7;
  }
}

- (unsigned)_nextMessageID
{
  p_messageID = &self->_messageID;
  do
    unsigned int result = __ldaxr(p_messageID);
  while (__stlxr(result + 1, p_messageID));
  return result;
}

- (id)_copyPeerWithID:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v5));

  pthread_mutex_unlock(p_deviceIDToPeerLock);
  return v6;
}

- (id)_copyPairedDevice
{
  return -[IDSUTunDeliveryController _copyPeerWithID:](self, "_copyPeerWithID:", IDSDeviceDefaultPairedDeviceUniqueID);
}

- (id)hashForString:(id)a3
{
  uint64_t v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  bswap32(*(unsigned __int16 *)md) >> 16));
}

- (void)setDeviceUniqueIDToCBUUID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  uint64_t v6 = OSLogHandleForIDSCategory("UTunDelivery");
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received devices with unique ids -> cbuuids %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    id v9 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Received devices with unique ids -> cbuuids %@");
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001C1644;
  v10[3] = &unk_1008FD3F8;
  v10[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10, v9);
}

- (void)deviceWithUniqueID:(id)a3 updatedUUID:(id)a4
{
  uint64_t v6 = (IDSUTunPeer *)a3;
  unsigned int v7 = (IDSUTunPeer *)a4;
  im_assert_primary_base_queue(v7, v8);
  uint64_t v9 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received device with unique id %@ updated BTUUID: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v11) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    uint64_t v22 = v6;
    uint64_t v23 = v7;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Received device with unique id %@ updated BTUUID: %@");
  }

  if (v6
    && !-[IDSUTunPeer isEqualToString:](v6, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID))
  {
    pthread_mutex_lock(&self->_deviceIDToPeerLock);
    uint64_t v15 = (IDSUTunPeer *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v6));
    if (v15)
    {
      pthread_mutex_unlock(&self->_deviceIDToPeerLock);
      uint64_t v16 = OSLogHandleForIDSCategory("UTunDelivery");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        uint64_t v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating existing peer %@ for uniqueID %@ with btuuid %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v18)
        && _IDSShouldLog(0LL, @"UTunDelivery"))
      {
        uint64_t v23 = v6;
        v24 = v7;
        uint64_t v22 = v15;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Updating existing peer %@ for uniqueID %@ with btuuid %@");
      }

      -[IDSUTunPeer setBtUUID:](v15, "setBtUUID:", v7, v22, v23, v24);
    }

    else
    {
      uint64_t v15 = -[IDSUTunPeer initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:]( objc_alloc(&OBJC_CLASS___IDSUTunPeer),  "initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:",  @"UTunDelivery",  v7,  v6,  0LL,  0LL,  0LL);
      -[IDSUTunPeer setDelegate:](v15, "setDelegate:", self);
      -[NSMutableDictionary setObject:forKey:](self->_deviceIDToPeer, "setObject:forKey:", v15, v6);
      pthread_mutex_unlock(&self->_deviceIDToPeerLock);
      uint64_t v19 = OSLogHandleForIDSCategory("UTunDelivery");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        uint64_t v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Created new peer %@ for uniqueID %@ with btuuid %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v21)
        && _IDSShouldLog(0LL, @"UTunDelivery"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Created new peer %@ for uniqueID %@ with btuuid %@");
      }
    }
  }

  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Ignoring update for nil or default paired device BTUUID: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"UTunDelivery"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Ignoring update for nil or default paired device BTUUID: %@");
    }
  }
}

- (void)_updateLocalSetupInProgressState:(BOOL)a3
{
  BOOL v3 = a3;
  -[IDSUTunDeliveryController setIsLocalSetUpInProgress:](self, "setIsLocalSetUpInProgress:");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      id v7 = v6;
      if (v3) {
        [v6 localSetUpStarted];
      }
      else {
        [v6 localSetUpCompleted];
      }
    }
  }

- (void)localSetupStarted
{
  uint64_t v3 = OSLogHandleForTransportCategory("UTunDelivery");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: local setup started - clearing all stats",  v8,  2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"LOCALSETUP: local setup started - clearing all stats");
      if (_IDSShouldLog(0LL, @"UTunDelivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"LOCALSETUP: local setup started - clearing all stats");
      }
    }
  }

  id v7 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  [v7 clearStats];
  -[IDSUTunDeliveryController _updateLocalSetupInProgressState:](self, "_updateLocalSetupInProgressState:", 1LL);
}

- (void)localSetupCompleted
{
  uint64_t v3 = OSLogHandleForTransportCategory("Delivery");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: Informed that local setup has completed!",  v8,  2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"LOCALSETUP: Informed that local setup has completed!");
      if (_IDSShouldLog(0LL, @"Delivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"LOCALSETUP: Informed that local setup has completed!");
      }
    }
  }

  id v7 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  [v7 setLocalSetupInProgress:0];
  -[IDSUTunDeliveryController _updateLocalSetupInProgressState:](self, "_updateLocalSetupInProgressState:", 0LL);
}

- (BOOL)localSetupInProgress
{
  id v2 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  unsigned __int8 v3 = [v2 localSetupInProgress];

  return v3;
}

- (void)prepareForQuickSwitch
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  if ([v3 localSetupInProgress])
  {
    [v3 setLocalSetupInProgress:0];
    -[IDSUTunDeliveryController _updateLocalSetupInProgressState:](self, "_updateLocalSetupInProgressState:", 0LL);
  }

  uint64_t v4 = OSLogHandleForTransportCategory("Delivery");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: Disabling Cloud Connections for QWS",  v8,  2u);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7)
  {
    if (_IDSShouldLogTransport(v7))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"LOCALSETUP: Disabling Cloud Connections for QWS");
      if (_IDSShouldLog(0LL, @"Delivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"LOCALSETUP: Disabling Cloud Connections for QWS");
      }
    }
  }

  [v3 setSupportsCloudConnections:0];
}

- (void)updatecloudDeliveryStateOnDefaultPeer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
  unsigned int v4 = [v3 pairedDeviceServiceMinCompatibilityVersion];

  if (v4 >= 3)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("Delivery");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: Enabling Cloud Connections",  v10,  2u);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"LOCALSETUP: Enabling Cloud Connections");
    }

    id v9 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
    [v9 setSupportsCloudConnections:1];
  }

- (void)ensureLocalSetupInProgressConsistencyAfterQWS
{
  id v7 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  objc_msgSend( v7,  "setLocalSetupInProgress:",  -[IDSUTunDeliveryController isLocalSetUpInProgress](self, "isLocalSetUpInProgress"));
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

    if (v3)
    {
      unsigned int v4 = -[IDSUTunDeliveryController isLocalSetUpInProgress](self, "isLocalSetUpInProgress");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      uint64_t v6 = v5;
      if (v4) {
        [v5 localSetUpStarted];
      }
      else {
        [v5 localSetUpCompleted];
      }
    }
  }
}

- (void)setPendingCloudFlagOnDefaultPeer
{
  id v2 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  [v2 setPendingCloudEnable:1];
}

- (void)_removePeerFromDeviceID:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIDToPeer, "removeObjectForKey:", v5);

  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (id)_createPeerFromDeviceID:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a3,  IDSDevicePairedDeviceID));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _createPeerFromDeviceInfo:](self, "_createPeerFromDeviceInfo:", v4));

  return v5;
}

- (id)_createPeerFromDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePairedDeviceID]);
  uint64_t v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"bt-id"]);
  id v7 = (IDSUTunPeer *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"session-id"]);
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  if (v7 && -[IDSUTunPeer length](v7, "length"))
  {
    if ([v5 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
    {
      uint64_t v9 = OSLogHandleForTransportCategory("UTunDelivery");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        deviceIDToPeer = self->_deviceIDToPeer;
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = v7;
        __int16 v31 = 2112;
        id v32 = v4;
        __int16 v33 = 2112;
        v34 = deviceIDToPeer;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WARNING: Peer from sessionID %@ shouldn't be created for the default paired device! (deviceInfo: %@) (peer map: %@)",  buf,  0x20u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"WARNING: Peer from sessionID %@ shouldn't be created for the default paired device! (deviceInfo: %@) (peer map: %@)");
          if (_IDSShouldLog(0LL, @"UTunDelivery")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"WARNING: Peer from sessionID %@ shouldn't be created for the default paired device! (deviceInfo: %@) (peer map: %@)");
          }
        }
      }

      uint64_t v14 = 0LL;
      goto LABEL_31;
    }

    uint64_t v14 = (IDSUTunPeer *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v7));
    if (v14) {
      goto LABEL_31;
    }
    uint64_t v14 = -[IDSUTunPeer initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:]( objc_alloc(&OBJC_CLASS___IDSUTunPeer),  "initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:",  @"UTunDelivery",  v7,  v5,  0LL,  0LL,  0LL);
    -[IDSUTunPeer setOriginalbtUUID:](v14, "setOriginalbtUUID:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_deviceIDToPeer, "setObject:forKey:", v14, v7);
    -[NSMutableDictionary setObject:forKey:](self->_btuuidToSessionID, "setObject:forKey:", v7, v6);
    uint64_t v20 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Peer %@ is created from sessionID %@ (peer map: %@)",  buf,  0x20u);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"Peer %@ is created from sessionID %@ (peer map: %@)");
        if (_IDSShouldLog(0LL, @"UTunDelivery")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Peer %@ is created from sessionID %@ (peer map: %@)");
        }
      }
    }
  }

  else
  {
    uint64_t v14 = (IDSUTunPeer *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v5));
    if (v14) {
      goto LABEL_31;
    }
    uint64_t v14 = -[IDSUTunPeer initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:]( objc_alloc(&OBJC_CLASS___IDSUTunPeer),  "initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:",  @"UTunDelivery",  v6,  v5,  0LL,  0LL,  0LL);
    -[NSMutableDictionary setObject:forKey:](self->_deviceIDToPeer, "setObject:forKey:", v14, v5);
    uint64_t v15 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Peer %@ is created from btID %@ (peer map: %@)",  buf,  0x20u);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport(@"UTunDelivery", @"IDS", @"Peer %@ is created from btID %@ (peer map: %@)");
        if (_IDSShouldLog(0LL, @"UTunDelivery")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Peer %@ is created from btID %@ (peer map: %@)");
        }
      }
    }
  }

  if (v14)
  {
    -[IDSUTunPeer setDelegate:](v14, "setDelegate:", self);
    uint64_t v25 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v5;
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Created new peer %@ for uniqueID %@ with btuuid %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v27)
      && _IDSShouldLog(0LL, @"UTunDelivery"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Created new peer %@ for uniqueID %@ with btuuid %@");
    }
  }

- (void)sendData:(id)a3 service:(id)a4 protobuf:(id)a5 resourcePath:(id)a6 resourceMetadata:(id)a7 priority:(int64_t)a8 dataProtectionClass:(unsigned int)a9 nonWaking:(BOOL)a10 nonCloudWaking:(BOOL)a11 requireBluetooth:(BOOL)a12 requireLocalWiFi:(BOOL)a13 queueOneIdentifier:(id)a14 expirationDate:(id)a15 enforceRemoteTimeouts:(BOOL)a16 expectsPeerResponse:(BOOL)a17 wantsAppAck:(BOOL)a18 compressPayload:(BOOL)a19 compressed:(BOOL)a20 peerResponseIdentifier:(id)a21 messageID:(id)a22 topic:(id)a23 awdTopic:(id)a24 command:(id)a25 fromID:(id)a26 uriToDeviceID:(id)a27 localDeviceDestinationDeviceUUID:(id)a28 bypassDuet:(BOOL)a29 duetIdentifiersOverride:(id)a30 messageType:(int64_t)a31 fallbackBlock:(id)a32 progressBlock:(id)a33 completionBlock:(id)a34
{
  id v77 = a3;
  id v63 = a4;
  id v76 = a5;
  id v60 = a6;
  id v59 = a7;
  id v58 = a14;
  id v75 = a15;
  id v57 = a21;
  id v53 = a22;
  id v56 = a23;
  id v38 = a24;
  id v50 = a25;
  id v54 = a26;
  id v51 = a27;
  id v52 = a28;
  id v55 = a30;
  id v39 = a32;
  id v40 = a33;
  id v41 = a34;
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v79[0] = _NSConcreteStackBlock;
  v79[2] = sub_1001C2B44;
  v79[3] = &unk_1008FD470;
  BOOL v102 = a16;
  unsigned int v101 = a9;
  BOOL v103 = a10;
  BOOL v104 = a11;
  BOOL v105 = a17;
  BOOL v106 = a18;
  BOOL v107 = a19;
  BOOL v108 = a20;
  BOOL v109 = a12;
  BOOL v110 = a13;
  BOOL v111 = a29;
  v79[4] = self;
  id v80 = v56;
  int64_t v99 = a8;
  int64_t v100 = a31;
  v79[1] = 3221225472LL;
  id v81 = v53;
  id v82 = v77;
  id v83 = v76;
  id v84 = v75;
  id v85 = v50;
  id v86 = v51;
  id v87 = v52;
  id v88 = v60;
  id v89 = v59;
  id v90 = v57;
  id v91 = v38;
  id v92 = v54;
  id v97 = v39;
  id v98 = v40;
  id v93 = v58;
  id v94 = v55;
  id v95 = v63;
  id v96 = v41;
  id v66 = v63;
  id v68 = v55;
  id v71 = v58;
  id v74 = v40;
  id v72 = v39;
  id v70 = v54;
  id v69 = v38;
  id v67 = v57;
  id v65 = v59;
  id v64 = v60;
  id v62 = v41;
  id v42 = v52;
  id v43 = v51;
  id v44 = v50;
  id v45 = v75;
  id v46 = v76;
  id v47 = v77;
  id v48 = v53;
  id v49 = v56;
  [v61 performBlockWithPriority:v79 priority:a8];
}

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if ([v4 length])
  {
    uint64_t v6 = OSLogHandleForTransportCategory("Delivery");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to cancel message ID: %@",  buf,  0xCu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9)
    {
      if (_IDSShouldLogTransport(v9))
      {
        id v15 = v4;
        _IDSLogTransport(@"Delivery", @"IDS", @"Attempting to cancel message ID: %@");
        if (_IDSShouldLog(0LL, @"Delivery"))
        {
          id v15 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Attempting to cancel message ID: %@");
        }
      }
    }

    p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
    pthread_mutex_lock(&self->_deviceIDToPeerLock);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIDToPeer, "allValues"));
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "cancelMessageID:", v4, v15);
          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v12);
    }

    pthread_mutex_unlock(p_deviceIDToPeerLock);
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIDToPeer, "allValues", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) kickProgressBlockForMessageID:v4];
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }

  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (id)topicForStreamID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  p_streamIDToTopicLock = &self->_streamIDToTopicLock;
  pthread_mutex_lock(&self->_streamIDToTopicLock);
  streamIDToTopic = self->_streamIDToTopic;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](streamIDToTopic, "objectForKey:", v7));

  pthread_mutex_unlock(p_streamIDToTopicLock);
  return v8;
}

- (BOOL)isPresent
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  unsigned __int8 v4 = [v3 isConnected];

  return v4;
}

- (BOOL)defaultPeerIsNearby
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  unsigned __int8 v4 = [v3 isNearby];

  return v4;
}

- (BOOL)defaultPeerIsCloudConnected
{
  return 0;
}

- (void)localAccountSetupCompleted
{
  self->_localAccountSetupCompleted = 1;
  uint64_t v3 = OSLogHandleForTransportCategory("UTunDelivery");
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_defaultPeerConnectedDeferred) {
      uint64_t v5 = @"YES";
    }
    else {
      uint64_t v5 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    __int128 v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "local account setup complete - has deferred task? %@",  buf,  0xCu);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7 && _IDSShouldLogTransport(v7))
  {
    id v8 = self->_defaultPeerConnectedDeferred ? @"YES" : @"NO";
    __int128 v14 = v8;
    _IDSLogTransport(@"UTunDelivery", @"IDS", @"local account setup complete - has deferred task? %@");
    if (_IDSShouldLog(0LL, @"UTunDelivery"))
    {
      if (self->_defaultPeerConnectedDeferred) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      __int128 v14 = (__CFString *)v9;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"local account setup complete - has deferred task? %@");
    }
  }

  if (self->_defaultPeerConnectedDeferred)
  {
    self->_defaultPeerConnectedDeferred = 0;
    uint64_t v10 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "calling deferred default peer connected",  buf,  2u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
    {
      _IDSLogTransport(@"UTunDelivery", @"IDS", @"calling deferred default peer connected");
    }

    -[IDSUTunDeliveryController defaultPeerConnectivityChanged:](self, "defaultPeerConnectivityChanged:", 1LL, v14);
  }

- (void)enableConnectionForDefaultPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  uint64_t v5 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    __int128 v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "enableConnectionForDefaultPairedDevice %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    id v9 = @"NO";
    if (v3) {
      id v9 = @"YES";
    }
    __int128 v15 = v9;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"enableConnectionForDefaultPairedDevice %@");
  }

  id v10 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice", v15);
  uint64_t v11 = v10;
  if (v10)
  {
    if (v3) {
      [v10 enableConnection];
    }
    else {
      [v10 disableConnectionForReason:14 shouldWait:0];
    }
  }

  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v17 = (const __CFString *)IDSDeviceDefaultPairedDeviceUniqueID;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No connection found for default paired device %@.",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"UTunDelivery"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"No connection found for default paired device %@.");
    }
  }
}

- (void)enableCloudConnectionForDefaultPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  uint64_t v5 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    __int128 v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "enableCloudConnectionForDefaultPairedDevice %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    id v9 = @"NO";
    if (v3) {
      id v9 = @"YES";
    }
    __int128 v15 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"enableCloudConnectionForDefaultPairedDevice %@");
  }

  id v10 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice", v15);
  uint64_t v11 = v10;
  if (v10)
  {
    if (v3) {
      [v10 enableCloudConnection];
    }
    else {
      [v10 disableCloudConnectionForReason:14];
    }
  }

  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v17 = (const __CFString *)IDSDeviceDefaultPairedDeviceUniqueID;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No connection found for default paired device %@.",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"UTunDelivery"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"No connection found for default paired device %@.");
    }
  }
}

- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:a3];

  id v8 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  LOBYTE(v4) = [v8 hasSpaceForMessagesWithPriority:a3 dataProtectionClass:v4 messageType:4];

  return v4;
}

- (BOOL)hasSpaceForCloudMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:a3];

  id v8 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  LOBYTE(v4) = [v8 hasSpaceForMessagesWithPriority:a3 dataProtectionClass:v4 messageType:6];

  return v4;
}

- (void)setTopics:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  pthread_mutex_lock(&self->_streamIDToTopicLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_streamIDToTopic, "allValues"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

  if (v4 && v7 && [v7 isEqualToSet:v4])
  {
    pthread_mutex_unlock(&self->_streamIDToTopicLock);
  }

  else
  {
    streamIDToTopic = self->_streamIDToTopic;
    self->_streamIDToTopic = 0LL;

    if (!self->_streamIDToTopic)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      id v10 = self->_streamIDToTopic;
      self->_streamIDToTopic = Mutable;
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001C49C8;
    v16[3] = &unk_1008FD498;
    v16[4] = self;
    [v4 enumerateObjectsUsingBlock:v16];
    uint64_t v11 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_streamIDToTopic, "allKeys"));
      *(_DWORD *)buf = 138412290;
      __int128 v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Got topic set update %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(1LL, @"UTunDelivery"))
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_streamIDToTopic, "allKeys"));
      _IDSLogV(1LL, @"IDSFoundation", @"UTunDelivery", @"Got topic set update %@");
    }

    pthread_mutex_unlock(&self->_streamIDToTopicLock);
  }
}

- (NSDictionary)syncPriorityMessageStatistics
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 syncPriorityMessageStatistics]);

  return (NSDictionary *)v4;
}

- (NSDictionary)defaultPriorityMessageStatistics
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultPriorityMessageStatistics]);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentPriorityMessageStatistics
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 urgentPriorityMessageStatistics]);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentCloudPriorityMessageStatistics
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 urgentCloudPriorityMessageStatistics]);

  return (NSDictionary *)v4;
}

- (NSDictionary)sendingMessageStatistics
{
  id v3 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sendingMessageStatistics]);

  return (NSDictionary *)v4;
}

- (NSDictionary)queuedIncomingMessageDictionary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector(WeakRetained, "deliveryControllerQueuedIncomingMessageDictionary:");

  if ((v4 & 1) != 0)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deliveryControllerQueuedIncomingMessageDictionary:self]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return (NSDictionary *)v6;
}

- (void)setAllowedTrafficClasses:(id)a3
{
  id v5 = a3;
  im_assert_primary_base_queue(v5, v6);
  p_trafficClassLock = &self->_trafficClassLock;
  pthread_mutex_lock(&self->_trafficClassLock);
  if ((-[NSSet isEqual:](self->_allowedTrafficClasses, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allowedTrafficClasses, a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
    [v8 trafficClassesChanged];

    if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
        [v10 setAllowedTrafficClasses:v5];
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          id v12 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Warning: -[IDSUTunDeliveryController setAllowedTrafficClasses:] called but missing nrDevicePreferencesHandle r; allowedTrafficClasses %@",
            (uint8_t *)&v11,
            0xCu);
        }
      }
    }
  }

  pthread_mutex_unlock(p_trafficClassLock);
}

- (NSSet)allowedTrafficClasses
{
  p_trafficClassLock = &self->_trafficClassLock;
  pthread_mutex_lock(&self->_trafficClassLock);
  char v4 = self->_allowedTrafficClasses;
  pthread_mutex_unlock(p_trafficClassLock);
  return v4;
}

- (void)systemScreenDidPowerDown
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSUTunDeliveryController");
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System did lock", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(0LL, @"IDSUTunDeliveryController"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSUTunDeliveryController", @"System did lock");
  }

  deviceIDToPeer = self->_deviceIDToPeer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001C4E7C;
  v7[3] = &unk_1008FD4C0;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceIDToPeer, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (void)removeUTunPeerWithSessionID:(id)a3 reason:(int64_t)a4 shouldWait:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v8));
  [v10 disableConnectionForReason:a4 shouldWait:v5];
  [v10 setDelegate:0];
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToPeer, "objectForKey:", v8));

  if (v11) {
    -[NSMutableDictionary removeObjectForKey:](self->_deviceIDToPeer, "removeObjectForKey:", v8);
  }
  btuuidToSessionID = self->_btuuidToSessionID;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 originalbtUUID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](btuuidToSessionID, "objectForKey:", v13));

  if (v14 && [v14 isEqualToString:v8])
  {
    __int128 v15 = self->_btuuidToSessionID;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 originalbtUUID]);
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);
  }

  else
  {
    uint64_t v17 = OSLogHandleForIDSCategory("IDSUTunDeliveryController");
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "There is a new session for the local path, skipped removing...",  v20,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v19)
      && _IDSShouldLog(0LL, @"IDSUTunDeliveryController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunDeliveryController",  @"There is a new session for the local path, skipped removing...");
    }
  }

  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (void)removeUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4 reason:(int64_t)a5 shouldWait:(BOOL)a6
{
  BOOL v6 = a6;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  uint64_t v10 = IDSDeviceDefaultPairedDeviceUniqueID;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIDToPeer, "removeObjectForKey:", v10);
  pthread_mutex_unlock(p_deviceIDToPeerLock);
  -[IDSUTunDeliveryController _disableOTRForDefaultPairedPeer:](self, "_disableOTRForDefaultPairedPeer:", v11);
  [v11 disableConnectionForReason:a5 shouldWait:v6];
  [v11 setDelegate:0];
}

- (void)addUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  uint64_t v8 = IDSDeviceDefaultPairedDeviceUniqueID;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));

  if (v9)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSUTunDeliveryController");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      deviceIDToPeer = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138478339;
      __int16 v29 = v6;
      __int16 v30 = 2113;
      id v31 = v7;
      __int16 v32 = 2113;
      __int16 v33 = deviceIDToPeer;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Already have a peer ignoring call to add {deviceUniqueID: %{private}@, btuuid: %{private}@, deviceIDToPeer: %{private}@}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(0LL, @"IDSUTunDeliveryController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunDeliveryController",  @"Already have a peer ignoring call to add {deviceUniqueID: %{private}@, btuuid: %{private}@, deviceIDToPeer: %{private}@}");
    }

    pthread_mutex_unlock(&self->_deviceIDToPeerLock);
  }

  else
  {
    -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
    id v15 = [v14 isNearby];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
    id v17 = [v16 isClassCConnected];

    __int128 v18 = -[IDSUTunPeer initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:]( objc_alloc(&OBJC_CLASS___IDSUTunPeer),  "initWithIdentifier:btUUID:uniqueID:shouldUseIPsecLink:isNearby:isClassCConnected:",  @"UTunDelivery-Default",  0LL,  v8,  self->_shouldUseIPsecLinkForDefaultPairedDevice,  v15,  v17);
    -[IDSUTunPeer setDelegate:](v18, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_deviceIDToPeer, "setObject:forKey:", v18, v8);
    pthread_mutex_unlock(&self->_deviceIDToPeerLock);
    -[IDSUTunDeliveryController peerNearbyStateChanged:forceNotify:]( self,  "peerNearbyStateChanged:forceNotify:",  v18,  1LL);
    if (self->_shouldUseIPsecLinkForDefaultPairedDevice) {
      char v19 = 0;
    }
    else {
      char v19 = IMGetDomainBoolForKey(@"com.apple.ids", @"DisableOTR") ^ 1;
    }
    self->_enableOTR = v19;
    uint64_t v20 = OSLogHandleForTransportCategory("Delivery");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_enableOTR) {
        id v22 = @"YES";
      }
      else {
        id v22 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      __int16 v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "EnableOTR: %@.", buf, 0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24 && _IDSShouldLogTransport(v24))
    {
      uint64_t v25 = self->_enableOTR ? @"YES" : @"NO";
      uint64_t v27 = v25;
      _IDSLogTransport(@"Delivery", @"IDS", @"EnableOTR: %@.");
      if (_IDSShouldLog(0LL, @"Delivery"))
      {
        if (self->_enableOTR) {
          uint64_t v26 = @"YES";
        }
        else {
          uint64_t v26 = @"NO";
        }
        uint64_t v27 = (__CFString *)v26;
        _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"EnableOTR: %@.");
      }
    }

    -[IDSUTunPeer enableConnection](v18, "enableConnection", v27);
  }
}

- (void)addConnectivityDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    connectivityDelegates = self->_connectivityDelegates;
    id v8 = v4;
    if (!connectivityDelegates)
    {
      BOOL v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      id v7 = self->_connectivityDelegates;
      self->_connectivityDelegates = v6;

      connectivityDelegates = self->_connectivityDelegates;
    }

    -[NSHashTable addObject:](connectivityDelegates, "addObject:", v8);
    id v4 = v8;
  }
}

- (void)removeConnectivityDelegate:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_connectivityDelegates, "removeObject:");
  }
}

- (id)_deviceIDForPeer:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int128 v16 = sub_1001C565C;
  id v17 = sub_1001C566C;
  id v18 = 0LL;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  deviceIDToPeer = self->_deviceIDToPeer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001C5674;
  v10[3] = &unk_1008FD4E8;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceIDToPeer, "enumerateKeysAndObjectsUsingBlock:", v10);
  pthread_mutex_unlock(p_deviceIDToPeerLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)peer:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v27 assertRunningWithPriority:a13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a5) = objc_opt_respondsToSelector( WeakRetained,  "deliveryController:dataReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse :peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:");

  if ((a5 & 1) != 0)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _deviceIDForPeer:](self, "_deviceIDForPeer:", v36));
    LOBYTE(v33) = a16;
    LOBYTE(v32) = a14;
    LOWORD(v31) = __PAIR16__(a10, a9);
    objc_msgSend( v29,  "deliveryController:protobufReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerRe sponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:",  self,  v35,  v34,  v22,  v30,  v23,  v24,  v31,  v25,  v26,  a13,  v32,  a15,  v33);
  }
}

- (void)peer:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v27 assertRunningWithPriority:a13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a5) = objc_opt_respondsToSelector( WeakRetained,  "deliveryController:dataReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse :peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:");

  if ((a5 & 1) != 0)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _deviceIDForPeer:](self, "_deviceIDForPeer:", v36));
    LOBYTE(v33) = a16;
    LOBYTE(v32) = a14;
    LOWORD(v31) = __PAIR16__(a10, a9);
    objc_msgSend( v29,  "deliveryController:dataReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerRespon seIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:",  self,  v35,  v34,  v22,  v30,  v23,  v24,  v31,  v25,  v26,  a13,  v32,  a15,  v33);
  }
}

- (void)peer:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v27 assertRunningWithPriority:a13];

  uint64_t v28 = objc_claimAutoreleasedReturnValue([v42 originalbtUUID]);
  if (v28)
  {
    id v29 = (void *)v28;
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v42 btUUID]);
    unsigned int v31 = [v23 isEqualToString:v30];

    if (v31)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v42 originalbtUUID]);

      id v23 = (id)v32;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v34 = objc_opt_respondsToSelector( WeakRetained,  "deliveryController:messageReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:pee rResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:");

  if ((v34 & 1) != 0)
  {
    id v35 = objc_loadWeakRetained((id *)&self->_delegate);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _deviceIDForPeer:](self, "_deviceIDForPeer:", v42));
    LOBYTE(v39) = a16;
    LOBYTE(v38) = a14;
    LOWORD(v37) = __PAIR16__(a10, a9);
    objc_msgSend( v35,  "deliveryController:messageReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerRes ponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:",  self,  v41,  v40,  v22,  v36,  v23,  v24,  v37,  v25,  v26,  a13,  v38,  a15,  v39);
  }
}

- (void)peer:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7 priority:(int64_t)a8 connectionType:(int64_t)a9
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  char v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v19 assertRunningWithPriority:a8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector( WeakRetained,  "deliveryController:receivedAppLevelAckWithTopic:deviceID:btUUID:messageID:peerResponseIdentifier:priority:connectionType:");

  if ((v21 & 1) != 0)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _deviceIDForPeer:](self, "_deviceIDForPeer:", v24));
    [v22 deliveryController:self receivedAppLevelAckWithTopic:v15 deviceID:v23 btUUID:v16 messageID:v17 peerResponseIdentifier:v18 priority:a8 connectionType:a9];
  }
}

- (void)peerNearbyStateChanged:(id)a3 forceNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  im_assert_primary_base_queue(v6, v7);
  unsigned int v8 = [v6 isNearby];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned int v11 = [v10 isScreenLit];

  uint64_t v12 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = -[NSMutableDictionary count](self->_deviceIDToPeer, "count");
    id v15 = @"NO";
    *(_DWORD *)buf = 138413058;
    if (v11) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    if (v8) {
      id v15 = @"YES";
    }
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    unsigned int v31 = v9;
    __int16 v32 = 2048;
    id v33 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "peer nearby state changed:%@    screenLit:%@   uniqueID:%@   peer-count:%lu",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v17) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    -[NSMutableDictionary count](self->_deviceIDToPeer, "count");
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"peer nearby state changed:%@    screenLit:%@   uniqueID:%@   peer-count:%lu");
  }

  if ((v4 | v11) == 1)
  {
    if ((v8 & 1) != 0)
    {
      int64_t v18 = 0LL;
    }

    else
    {
      -[IDSUTunDeliveryController notificationDelayInSeconds](self, "notificationDelayInSeconds");
      int64_t v18 = 1000000000LL * (int)v19;
    }

    dispatch_time_t v20 = dispatch_time(0LL, v18);
    broadcastQueue = (dispatch_queue_s *)self->_broadcastQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001C600C;
    block[3] = &unk_1008F5F58;
    block[4] = self;
    id v24 = v6;
    id v25 = v9;
    dispatch_after(v20, broadcastQueue, block);
    if (v8)
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      self->_lastIsNearbyBecameTrue = v22;
    }
  }
}

- (void)peerConnectivityChanged:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  unsigned int v6 = [v4 isConnected];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  unsigned int v8 = [v7 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
  if ((v8 & v6) == 1) {
    uint64_t isLinkForDefaultPeerConnected = self->_isLinkForDefaultPeerConnected;
  }
  else {
    uint64_t isLinkForDefaultPeerConnected = v6 & ~v8;
  }
  -[IDSUTunDeliveryController setIsConnected:](self, "setIsConnected:", isLinkForDefaultPeerConnected);
  uint64_t v10 = OSLogHandleForIDSCategory("UTunDelivery");
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = @"NO";
    deviceIDToPeer = self->_deviceIDToPeer;
    *(_DWORD *)buf = 138412802;
    if ((_DWORD)isLinkForDefaultPeerConnected) {
      uint64_t v12 = @"YES";
    }
    double v40 = *(double *)&v12;
    __int16 v41 = 2112;
    id v42 = v7;
    __int16 v43 = 2112;
    id v44 = deviceIDToPeer;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "peer connectivity changed: %@    uniqueID: %@   map: %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    id v15 = @"NO";
    if ((_DWORD)isLinkForDefaultPeerConnected) {
      id v15 = @"YES";
    }
    id v35 = v7;
    id v36 = self->_deviceIDToPeer;
    double v34 = *(double *)&v15;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"peer connectivity changed: %@    uniqueID: %@   map: %@");
  }

  if ((isLinkForDefaultPeerConnected & 1) != 0)
  {
    int v16 = 0;
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
    if ([v17 latestLinkType] == 2)
    {
      int v16 = 0;
    }

    else
    {
      -[IDSUTunDeliveryController notificationDelayInSeconds](self, "notificationDelayInSeconds");
      int v16 = (int)v18;
    }
  }

  dispatch_time_t v19 = dispatch_time(0LL, 1000000000LL * v16);
  broadcastQueue = (dispatch_queue_s *)self->_broadcastQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C6730;
  block[3] = &unk_1008F5F80;
  block[4] = self;
  id v21 = v7;
  id v38 = v21;
  dispatch_after(v19, broadcastQueue, block);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v23 = v22;
  double lastConnectedTime = self->_lastConnectedTime;
  double v25 = v23 - lastConnectedTime;
  if ((_DWORD)isLinkForDefaultPeerConnected) {
    double v25 = 0.0;
  }
  if (lastConnectedTime <= 0.0) {
    double v26 = 0.0;
  }
  else {
    double v26 = v25;
  }
  if ((isLinkForDefaultPeerConnected & 1) != 0)
  {
    self->_double lastConnectedTime = v23;
    if ((isLinkForDefaultPeerConnected & [v4 isNearby]) == 1)
    {
      uint64_t v27 = (unint64_t)((v23 - self->_lastIsNearbyBecameTrue) * 1000.0);
      if (v27 >= 1)
      {
        uint64_t v28 = OSLogHandleForIDSCategory("UTunDelivery");
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v40 = *(double *)&v27;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Submitting AWD metric {nearbyToConnectedDurationInMs: %lld ms}.",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v30)
          && _IDSShouldLog(0LL, @"UTunDelivery"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Submitting AWD metric {nearbyToConnectedDurationInMs: %lld ms}.");
        }

        IMSubmitSimpleAWDMetric(2588694LL, v27);
      }
    }
  }

  else
  {
    self->_double lastConnectedTime = 0.0;
    if (v26 > 0.0)
    {
      uint64_t v31 = OSLogHandleForIDSCategory("UTunDelivery");
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v40 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Submitting aggd metric for connected time %f seconds.",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v33)
        && _IDSShouldLog(0LL, @"UTunDelivery"))
      {
        double v34 = v26;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Submitting aggd metric for connected time %f seconds.");
      }

      IMSubmitSimpleAggegateMetric(@"com.apple.IDS.LocalConnectedTime", (uint64_t)v26);
    }

    objc_msgSend(v4, "isNearby", *(void *)&v34, v35, v36);
  }
}

- (void)peerCloudConnectivityChanged:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  id v6 = [v4 isCloudConnected];
  uint64_t v30 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  -[IDSUTunDeliveryController setIsCloudConnected:](self, "setIsCloudConnected:", v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_connectivityDelegates, "allObjects"));
  id v9 = [v8 copy];

  uint64_t v10 = OSLogHandleForTransportCategory("UTunDelivery");
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = @"NO";
    if ((_DWORD)v6) {
      uint64_t v12 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v12;
    __int16 v38 = 2112;
    uint64_t v39 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Broadcasting isCloudConnected %@ for %@",  buf,  0x16u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14 && _IDSShouldLogTransport(v14))
  {
    id v15 = (_DWORD)v6 ? @"YES" : @"NO";
    uint64_t v28 = v15;
    id v29 = v7;
    _IDSLogTransport(@"UTunDelivery", @"IDS", @"Broadcasting isCloudConnected %@ for %@");
    if (_IDSShouldLog(0LL, @"UTunDelivery"))
    {
      uint64_t v28 = v15;
      id v29 = v7;
      _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"Broadcasting isCloudConnected %@ for %@");
    }
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        dispatch_time_t v20 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v20, "deliveryController:uniqueID:isCloudConnected:") & 1) != 0) {
          [v20 deliveryController:self uniqueID:v7 isCloudConnected:v6];
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v17);
  }

  if (![v30 isCloudConnected]
    || (-[IDSUTunDeliveryController lastCloudConnectedTime](self, "lastCloudConnectedTime"), v21 == 0.0))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", v28, v29);
    -[IDSUTunDeliveryController setLastCloudConnectedTime:](self, "setLastCloudConnectedTime:");
  }

  else
  {
    id v22 = objc_alloc(&OBJC_CLASS___IDSCloudMessagingLinkReEstablishedMetric);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v24 = v23;
    -[IDSUTunDeliveryController lastCloudConnectedTime](self, "lastCloudConnectedTime");
    id v26 = [v22 initWithInactiveTime:0 linkType:0 priorLinkType:v24 - v25];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogger logger](&OBJC_CLASS___IDSAWDLogger, "logger"));
    [v27 logMetric:v26];
  }
}

- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withTypes:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  im_assert_primary_base_queue(v11, v12);
  id v13 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  uint64_t v14 = OSLogHandleForIDSCategory("UTunDelivery");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = @"Sync";
    if (a4 == 200) {
      id v16 = @"Default";
    }
    id v17 = @"Class D";
    if (a4 == 300) {
      id v16 = @"URGENT";
    }
    if ((_DWORD)v7 == 1) {
      id v17 = @"Class A";
    }
    if (!(_DWORD)v7) {
      id v17 = @"Class C";
    }
    *(_DWORD *)buf = 138413058;
    id v24 = v10;
    id v26 = v16;
    __int16 v25 = 2112;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    if (v13 == v10) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    __int16 v29 = 2112;
    uint64_t v30 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"UTunDelivery")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@");
  }
  if (v13 == v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector( WeakRetained,  "deliveryControllerHasSpaceforNonUrgentMessages:priority:dataProtectionClass:ofTypes:");

    if ((v21 & 1) != 0)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 deliveryControllerHasSpaceforNonUrgentMessages:self priority:a4 dataProtectionClass:v7 ofTypes:v11];
    }
  }
}

- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  im_assert_primary_base_queue(v8, v9);
  id v10 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  uint64_t v11 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = @"Sync";
    if (a4 == 200) {
      id v13 = @"Default";
    }
    uint64_t v14 = @"Class D";
    if (a4 == 300) {
      id v13 = @"URGENT";
    }
    if ((_DWORD)v5 == 1) {
      uint64_t v14 = @"Class A";
    }
    if (!(_DWORD)v5) {
      uint64_t v14 = @"Class C";
    }
    *(_DWORD *)buf = 138413058;
    id v21 = v8;
    double v23 = v13;
    __int16 v22 = 2112;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    if (v10 == v8) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v16) && _IDSShouldLog(0LL, @"UTunDelivery")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@");
  }
  if (v10 == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector( WeakRetained,  "deliveryControllerHasSpaceforNonUrgentMessages:priority:dataProtectionClass:");

    if ((v18 & 1) != 0)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      [v19 deliveryControllerHasSpaceforNonUrgentMessages:self priority:a4 dataProtectionClass:v5];
    }
  }
}

- (void)peerHasSpaceForUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 withTypes:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  im_assert_primary_base_queue(v9, v10);
  id v11 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  uint64_t v12 = OSLogHandleForIDSCategory("UTunDelivery");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"Class D";
    if ((_DWORD)v6 == 1) {
      uint64_t v14 = @"Class A";
    }
    *(_DWORD *)buf = 138413058;
    id v21 = v8;
    if (!(_DWORD)v6) {
      uint64_t v14 = @"Class C";
    }
    double v23 = @"URGENT";
    __int16 v22 = 2112;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    if (v11 == v8) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "peerHasSpaceForUrgentMessages %@ %@ %@ isDefaultPeer? %@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v16) && _IDSShouldLog(0LL, @"UTunDelivery")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"peerHasSpaceForUrgentMessages %@ %@ %@ isDefaultPeer? %@");
  }
  if (v11 == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector( WeakRetained,  "deliveryControllerHasSpaceforUrgentMessages:dataProtectionClass:ofTypes:");

    if ((v18 & 1) != 0)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      [v19 deliveryControllerHasSpaceforUrgentMessages:self dataProtectionClass:v6 ofTypes:v9];
    }
  }
}

- (void)defaultPeerConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
  if (!v3)
  {
    self->_defaultPeerConnectedDeferred = 0;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

    if (v7)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      [v6 annouceAvailabilityForCloudMessaging];
      goto LABEL_7;
    }

- (void)legacyUTunBTLinkManagerDefaultPeerConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@ but using IPsec link - drop callback",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    -[IDSUTunDeliveryController defaultPeerConnectivityChanged:](self, "defaultPeerConnectivityChanged:", v3);
  }

- (void)defaultPeerNearbyChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  id v5 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 isNearby];
    if (v7 != v3)
    {
      unsigned int v8 = v7;
      [v6 setIsNearby:v3];
      uint64_t v9 = OSLogHandleForTransportCategory("UTunDelivery");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = @"NO";
        if (v8) {
          uint64_t v12 = @"YES";
        }
        else {
          uint64_t v12 = @"NO";
        }
        if (v3) {
          id v11 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        dispatch_time_t v20 = v12;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "default peer nearby changed: %@ -> %@",  buf,  0x16u);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14 && _IDSShouldLogTransport(v14))
      {
        if (v8) {
          id v15 = @"YES";
        }
        else {
          id v15 = @"NO";
        }
        if (v3) {
          uint64_t v16 = @"YES";
        }
        else {
          uint64_t v16 = @"NO";
        }
        id v17 = v15;
        char v18 = v16;
        _IDSLogTransport(@"UTunDelivery", @"IDS", @"default peer nearby changed: %@ -> %@");
        if (_IDSShouldLog(0LL, @"UTunDelivery"))
        {
          id v17 = v15;
          char v18 = v16;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"default peer nearby changed: %@ -> %@");
        }
      }

      -[IDSUTunDeliveryController peerNearbyStateChanged:forceNotify:]( self,  "peerNearbyStateChanged:forceNotify:",  v6,  1LL,  v17,  v18);
    }
  }
}

- (void)defaultPeerLinkTypeChanged:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  im_assert_primary_base_queue(self, a2);
  id v5 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  if (!v5)
  {
    uint64_t v6 = OSLogHandleForTransportCategory("UTunDelivery");
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ Did not find default peer device.",  buf,  0xCu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9)
    {
      if (_IDSShouldLogTransport(v9))
      {
        uint64_t v10 = self;
        _IDSLogTransport(@"UTunDelivery", @"IDS", @"%@ Did not find default peer device.");
        if (_IDSShouldLog(0LL, @"UTunDelivery"))
        {
          uint64_t v10 = self;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"%@ Did not find default peer device.");
        }
      }
    }
  }

  objc_msgSend(v5, "logCurrentTransportStatsAndResetTimers", v10);
}

- (void)legacyUTunBTLinkManagerDefaultPeerNearbyChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "legacyUTunBTLinkManagerDefaultPeerNearbyChanged: %@ but using IPsec link - drop callback",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    -[IDSUTunDeliveryController defaultPeerNearbyChanged:](self, "defaultPeerNearbyChanged:", v3);
  }

- (void)defaultPeerCloudConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  id v5 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  uint64_t v6 = OSLogHandleForTransportCategory("UTunDelivery");
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v3) {
      uint64_t v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cloud connectivity changed for default peer: %@.",  buf,  0xCu);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10 && _IDSShouldLogTransport(v10))
  {
    if (v3) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    uint64_t v12 = v11;
    _IDSLogTransport(@"UTunDelivery", @"IDS", @"cloud connectivity changed for default peer: %@.");
    if (_IDSShouldLog(0LL, @"UTunDelivery"))
    {
      uint64_t v12 = v11;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"cloud connectivity changed for default peer: %@.");
    }
  }

  -[IDSUTunDeliveryController _setCloudConnectionConnected:forPeer:]( self,  "_setCloudConnectionConnected:forPeer:",  v3,  v5,  v12);
}

- (void)legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged: %@ but using IPsec link - drop callback",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    -[IDSUTunDeliveryController defaultPeerCloudConnectivityChanged:](self, "defaultPeerCloudConnectivityChanged:", v3);
  }

- (void)defaultPeerMagnetIndicationOfAwakeStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  uint64_t v5 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "defaultPeerMagnetIndicationOfAwakeStateChanged %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    uint64_t v9 = @"NO";
    if (v3) {
      uint64_t v9 = @"YES";
    }
    id v11 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"defaultPeerMagnetIndicationOfAwakeStateChanged %@");
  }

  id v10 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice", v11);
  [v10 setIsMagnetIndicatingPeerIsAwake:v3];
}

- (void)defaultPeerClassCConnectivityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  uint64_t v5 = OSLogHandleForIDSCategory("UTunDelivery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "defaultPeerClassCConnectivityDidChange %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunDelivery"))
  {
    uint64_t v9 = @"NO";
    if (v3) {
      uint64_t v9 = @"YES";
    }
    id v11 = v9;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"defaultPeerClassCConnectivityDidChange %@");
  }

  id v10 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice", v11);
  [v10 setIsClassCConnected:v3];
  -[IDSUTunDeliveryController setIsClassCConnected:](self, "setIsClassCConnected:", v3);
  -[IDSUTunDeliveryController peerConnectivityChanged:](self, "peerConnectivityChanged:", v10);
}

- (void)defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  im_assert_primary_base_queue(v6, v7);
  uint64_t v8 = OSLogHandleForTransportCategory("UTunDelivery");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v4) {
      id v10 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSetPreferInfraWiFi: %@ services: %@",  buf,  0x16u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport(@"UTunDelivery", @"IDS", @"defaultPeerSetPreferInfraWiFi: %@ services: %@");
      if (_IDSShouldLog(0LL, @"UTunDelivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"defaultPeerSetPreferInfraWiFi: %@ services: %@");
      }
    }
  }

  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
    BOOL v14 = v13 == 0LL;

    if (v14)
    {
      uint64_t v17 = OSLogHandleForTransportCategory("UTunDelivery");
      char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSetPreferInfraWiFi failed due to nil device identifier.",  buf,  2u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"defaultPeerSetPreferInfraWiFi failed due to nil device identifier.");
          if (_IDSShouldLog(0LL, @"UTunDelivery")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"defaultPeerSetPreferInfraWiFi failed due to nil device identifier.");
          }
        }
      }
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      [v15 setPreferInfraWiFiRequest:v4 services:v6];
    }
  }

  else
  {
    id v16 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
    [v16 setPreferInfraWiFi:v4 services:v6];
  }
}

- (void)defaultPeerSetLinkPreferences:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLinkPreferencesManager sharedInstance]( &OBJC_CLASS___IDSLinkPreferencesManager,  "sharedInstance"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accumulativePreferencesForAllServices]);

      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"PacketsPerSecond"]);
      id v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (_UNKNOWN **)v9;
      }
      else {
        uint64_t v11 = &off_100947470;
      }
      uint64_t v12 = v11;

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"InputBytesPerSecond"]);
      BOOL v14 = (void *)v13;
      if (v13) {
        id v15 = (_UNKNOWN **)v13;
      }
      else {
        id v15 = &off_100947470;
      }
      id v16 = v15;

      uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"OutputBytesPerSecond"]);
      char v18 = (void *)v17;
      if (v17) {
        uint64_t v19 = (_UNKNOWN **)v17;
      }
      else {
        uint64_t v19 = &off_100947470;
      }
      uint64_t v20 = v19;

      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Intent"]);
      if ([v21 isEqualToString:@"forceBTClassic"]
        && [v12 unsignedIntValue] <= 0xC7)
      {

        uint64_t v12 = &off_100947488;
      }

      uint64_t v22 = OSLogHandleForTransportCategory("UTunDelivery");
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        id v46 = v4;
        __int16 v47 = 1024;
        unsigned int v48 = [v12 unsignedIntValue];
        __int16 v49 = 1024;
        unsigned int v50 = [v16 unsignedIntValue];
        __int16 v51 = 1024;
        unsigned int v52 = [v20 unsignedIntValue];
        __int16 v53 = 2114;
        id v54 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "setBluetoothLinkPreferences: service: %{public}@, pps: %d input bps: %d output bps: %d intent: %{public}@",  buf,  0x28u);
      }

      uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
      if ((_DWORD)v25)
      {
        if (_IDSShouldLogTransport(v25))
        {
          id v26 = [v12 unsignedIntValue];
          id v27 = [v16 unsignedIntValue];
          id v43 = [v20 unsignedIntValue];
          id v44 = v21;
          id v41 = v26;
          id v42 = v27;
          id v40 = v4;
          _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"setBluetoothLinkPreferences: service: %{public}@, pps: %d input bps: %d output bps: %d intent: %{public}@");
          if (_IDSShouldLog(0LL, @"UTunDelivery"))
          {
            id v28 = objc_msgSend(v12, "unsignedIntValue", v4, v26, v27, v43, v21);
            id v29 = [v16 unsignedIntValue];
            id v43 = [v20 unsignedIntValue];
            id v44 = v21;
            id v41 = v28;
            id v42 = v29;
            id v40 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"setBluetoothLinkPreferences: service: %{public}@, pps: %d input bps: %d output bps: %d intent: %{public}@");
          }
        }
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunDeliveryController nrDevicePreferencesHandler]( self,  "nrDevicePreferencesHandler",  v40,  v41,  v42,  v43,  v44));
      [v30 setBluetoothLinkPreferences:v12 inputbps:v16 outputbps:v20];
    }

    else
    {
      uint64_t v36 = OSLogHandleForTransportCategory("UTunDelivery");
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSetLinkPreferences failed due to nil device identifier.",  buf,  2u);
      }

      uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
      if ((_DWORD)v39)
      {
        if (_IDSShouldLogTransport(v39))
        {
          _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"defaultPeerSetLinkPreferences failed due to nil device identifier.");
          if (_IDSShouldLog(0LL, @"UTunDelivery")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"defaultPeerSetLinkPreferences failed due to nil device identifier.");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v31 = OSLogHandleForTransportCategory("UTunDelivery");
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSetLinkPreferences, service: %{public}@",  buf,  0xCu);
    }

    uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
    if ((_DWORD)v34)
    {
      if (_IDSShouldLogTransport(v34))
      {
        id v40 = v4;
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"defaultPeerSetLinkPreferences, service: %{public}@");
        if (_IDSShouldLog(0LL, @"UTunDelivery"))
        {
          id v40 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"defaultPeerSetLinkPreferences, service: %{public}@");
        }
      }
    }

    id v35 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice", v40);
    [v35 setLinkPreferences:v4];
  }
}

- (void)defaultPeerSetWantsQuickRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("UTunDelivery");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v3) {
        uint64_t v7 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSetWantsQuickRelayRequest: %@",  buf,  0xCu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
    {
      id v10 = v3 ? @"YES" : @"NO";
      uint64_t v13 = v10;
      _IDSLogTransport(@"UTunDelivery", @"IDS", @"defaultPeerSetWantsQuickRelayRequest: %@");
      if (_IDSShouldLog(0LL, @"UTunDelivery"))
      {
        uint64_t v13 = v10;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"defaultPeerSetWantsQuickRelayRequest: %@");
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler", v13));

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController nrDevicePreferencesHandler](self, "nrDevicePreferencesHandler"));
      [v12 setQuickRelayRequest:v3];
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "[IDSUTunDeliveryController defaultPeerSetWantsQuickRelayRequest:] called but missing nrDevicePreferencesHandler",  buf,  2u);
      }
    }
  }

- (void)defaultPeerSupportsDirectMessaging:(BOOL)a3 isObliterating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  im_assert_primary_base_queue(self, a2);
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v7 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"NO";
      if (v5) {
        uint64_t v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "defaultPeerSupportsDirectMessaging: %@",  buf,  0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"UTunDelivery", @"IDS", @"defaultPeerSupportsDirectMessaging: %@");
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector(WeakRetained, "deliveryController:device:supportsDirectMessaging:isObliterating:");

    if ((v13 & 1) != 0)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 deliveryController:self device:0 supportsDirectMessaging:v5 isObliterating:v4];
    }
  }

- (void)defaultPeerUnpairStart
{
  uint64_t v3 = OSLogHandleForTransportCategory("UTunDelivery");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "defaultPeerUnpairStart", v8, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"UTunDelivery", @"IDS", @"defaultPeerUnpairStart");
    }
  }

  id v7 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  [v7 unpairStart];
  -[IDSUTunDeliveryController _updateLocalSetupInProgressState:](self, "_updateLocalSetupInProgressState:", 1LL);
}

- (void)defaultPeerDropDisallowedMessages
{
  uint64_t v3 = OSLogHandleForTransportCategory("UTunDelivery");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "defaultPeerDropDisallowedMessages", v8, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"UTunDelivery", @"IDS", @"defaultPeerDropDisallowedMessages");
    }
  }

  id v7 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  [v7 dropDisallowedMessages];
}

- (void)peerCloudConnectivityChanged:(id)a3 isCloudConnected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (__CFString *)a3;
  im_assert_primary_base_queue(v6, v7);
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", kIDSDefaultPairedDeviceID))
  {
    -[IDSUTunDeliveryController _refreshIPsecStatus](self, "_refreshIPsecStatus");
    if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = @"NO";
        if (v4) {
          uint64_t v9 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "peerCloudConnectivityChanged: %@ but using IPsec link - drop callback",  buf,  0xCu);
      }

      goto LABEL_20;
    }

    uint64_t v10 = (__CFString *)IDSDeviceDefaultPairedDeviceUniqueID;

    uint64_t v6 = v10;
  }

  uint64_t v11 = OSLogHandleForTransportCategory("UTunDelivery");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = @"NO";
    if (v4) {
      char v13 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "cloud connectivity changed for peer %@: %@.",  buf,  0x16u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15 && _IDSShouldLogTransport(v15))
  {
    id v16 = v4 ? @"YES" : @"NO";
    uint64_t v17 = v6;
    char v18 = v16;
    _IDSLogTransport(@"UTunDelivery", @"IDS", @"cloud connectivity changed for peer %@: %@.");
    if (_IDSShouldLog(0LL, @"UTunDelivery"))
    {
      uint64_t v17 = v6;
      char v18 = v16;
      _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"cloud connectivity changed for peer %@: %@.");
    }
  }

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSUTunDeliveryController _createPeerFromDeviceID:]( self,  "_createPeerFromDeviceID:",  v6,  v17,  v18));
  -[IDSUTunDeliveryController _setCloudConnectionConnected:forPeer:]( self,  "_setCloudConnectionConnected:forPeer:",  v4,  v8);
LABEL_20:
}

- (void)_setCloudConnectionConnected:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    if (v4) {
      [v6 enableCloudConnection];
    }
    unsigned int v8 = [v7 isCloudConnected];
    if (v8 != v4)
    {
      unsigned int v9 = v8;
      [v7 setIsCloudConnected:v4];
      uint64_t v10 = OSLogHandleForTransportCategory("UTunDelivery");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = @"NO";
        if (v9) {
          char v13 = @"YES";
        }
        else {
          char v13 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v7;
        id v27 = v13;
        __int16 v26 = 2112;
        if (v4) {
          uint64_t v12 = @"YES";
        }
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ cloud connectivity changed: %@ -> %@",  buf,  0x20u);
      }

      uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
      if ((_DWORD)v15 && _IDSShouldLogTransport(v15))
      {
        if (v9) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        if (v4) {
          uint64_t v17 = @"YES";
        }
        else {
          uint64_t v17 = @"NO";
        }
        uint64_t v22 = v16;
        __int16 v23 = v17;
        __int16 v21 = v7;
        _IDSLogTransport(@"UTunDelivery", @"IDS", @"%@ cloud connectivity changed: %@ -> %@");
        if (_IDSShouldLog(0LL, @"UTunDelivery"))
        {
          uint64_t v22 = v16;
          __int16 v23 = v17;
          __int16 v21 = v7;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunDelivery", @"%@ cloud connectivity changed: %@ -> %@");
        }
      }

      -[IDSUTunDeliveryController peerCloudConnectivityChanged:]( self,  "peerCloudConnectivityChanged:",  v7,  v21,  v22,  v23);
    }
  }

  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory("UTunDelivery");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Tried to process cloud connectivity change with nil peer.",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v20)
      && _IDSShouldLog(0LL, @"UTunDelivery"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Tried to process cloud connectivity change with nil peer.");
    }
  }
}

- (BOOL)isTerminusConnected
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (BOOL)isTerminusNearby
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (BOOL)isTerminusRegistered
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
  unsigned __int8 v3 = [v2 isRegistered];

  return v3;
}

- (BOOL)isTerminusConnectedOverBluetooth
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
  if ([v3 isConnected])
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController idsNRDeviceBridge](self, "idsNRDeviceBridge"));
    BOOL v5 = [v4 latestLinkType] == 1;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)nrDeviceBridge:(id)a3 defaultPeerConnectivityDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 defaultPeerNearbyDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  -[IDSUTunDeliveryController defaultPeerNearbyChanged:](self, "defaultPeerNearbyChanged:", v4);
  id v6 = -[IDSUTunDeliveryController _copyPairedDevice](self, "_copyPairedDevice");
  if (v6 && v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_connectivityDelegates, "allObjects"));
    id v8 = [v7 copy];

    uint64_t v9 = OSLogHandleForTransportCategory("UTunDelivery");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Broadcasting found nearby IPsec device {uniqueID: %@}",  buf,  0xCu);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
        _IDSLogTransport( @"UTunDelivery",  @"IDS",  @"Broadcasting found nearby IPsec device {uniqueID: %@}");

        if (_IDSShouldLog(0LL, @"UTunDelivery"))
        {
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID", v20));
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunDelivery",  @"Broadcasting found nearby IPsec device {uniqueID: %@}");
        }
      }
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v18, "deliveryController:foundNearbyIPsecCapableDeviceWithUniqueID:") & 1) != 0)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
            [v18 deliveryController:self foundNearbyIPsecCapableDeviceWithUniqueID:v19];
          }
        }

        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v15);
    }

    -[IDSUTunDeliveryController peerNearbyStateChanged:forceNotify:]( self,  "peerNearbyStateChanged:forceNotify:",  v6,  1LL);
  }
}

- (void)nrDeviceBridge:(id)a3 defaultPeerCloudConnectivityDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 deviceMagnetIndicationOfAwakeStateDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 linkType:(unsigned __int8)a4
{
}

- (void)nrDeviceBridge:(id)a3 defaultPeerClassCConnectivityDidChange:(BOOL)a4
{
}

- (void)_setOTREnableTimer
{
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0LL;

  uint64_t v4 = OSLogHandleForTransportCategory("Delivery");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set Enable OTR Timer for 60.0 seconds", v14, 2u);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7)
  {
    if (_IDSShouldLogTransport(v7))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"Set Enable OTR Timer for 60.0 seconds");
    }
  }

  id v8 = objc_alloc(&OBJC_CLASS___IMTimer);
  uint64_t v10 = im_primary_queue(v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v8,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"OTREnableTimer",  1LL,  self,  "_enableOTRForDefaultPairedDevice",  0LL,  v11,  60.0);
  uint64_t v13 = self->_otrTimer;
  self->_otrTimer = v12;
}

- (void)_OTREnableTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C9AF0;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_enableOTRForDefaultPairedDevice
{
  if (self->_enableOTR)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("Delivery");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Set OTR for defaultPairedDevice: YES.",  v9,  2u);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6 && _IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"Set OTR for defaultPairedDevice: YES.");
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
    [v7 resetAllSessions];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
    [v8 setEnableOTR:1];
    self->_otrInitialized = 1;
  }

- (void)_disableOTRForDefaultPairedPeer:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  uint64_t v6 = OSLogHandleForTransportCategory("Delivery");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set OTR for defaultPairedDevice: NO.", v11, 2u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"Set OTR for defaultPairedDevice: NO.");
    }
  }

  -[IMTimer invalidate](self->_otrTimer, "invalidate");
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0LL;

  [v4 setEnableOTR:0];
  self->_otrInitialized = 0;
}

- (void)didAddPairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  uint64_t v6 = OSLogHandleForTransportCategory("Delivery");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didAddPairedDevice is called.", v12, 2u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"didAddPairedDevice is called.");
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  [v10 removeSessionKeyForAllTokenFromMainQueue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v11 removeAllCachedSessionsFromMainQueue];

  if (self->_enableOTR) {
    -[IDSUTunDeliveryController _setOTREnableTimer](self, "_setOTREnableTimer");
  }
}

- (void)didRemovePairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  uint64_t v6 = OSLogHandleForTransportCategory("Delivery");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didRemovePairedDevice is called.", v13, 2u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      _IDSLogTransport(@"Delivery", @"IDS", @"didRemovePairedDevice is called.");
    }
  }

  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
  pthread_mutex_unlock(&self->_deviceIDToPeerLock);
  -[IDSUTunDeliveryController _disableOTRForDefaultPairedPeer:](self, "_disableOTRForDefaultPairedPeer:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  [v11 removeSessionKeyForAllTokenFromMainQueue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v12 removeAllCachedSessionsFromMainQueue];
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  uint64_t v6 = OSLogHandleForTransportCategory("Delivery");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"YES";
    if (self->_enableOTR) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    if (!self->_otrInitialized) {
      uint64_t v8 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "didUpdatePairedDevice is called, enable OTR %@, otrInitialized %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"Delivery",  @"IDS",  @"didUpdatePairedDevice is called, enable OTR %@, otrInitialized %@.");
      if (_IDSShouldLog(0LL, @"Delivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"didUpdatePairedDevice is called, enable OTR %@, otrInitialized %@.");
      }
    }
  }

  if (self->_enableOTR && self->_otrInitialized)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
    [v12 setEnableOTR:1];
  }
}

- (void)findDefaultPeerToForceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  id v10 = [v9 _copyPairedDevice];

  [v10 forceOTRNegotiationForTopic:v8 priority:a4 completionBlock:v7];
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  id v6 = a3;
  im_assert_primary_base_queue(v6, v7);
  deviceIDToPeer = self->_deviceIDToPeer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001CA328;
  v10[3] = &unk_1008FD510;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceIDToPeer, "enumerateKeysAndObjectsUsingBlock:", v10);
}

- (void)_cleanupContinuityPeerMaps:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerListMap, "objectForKey:", v4));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[IDSUTunDeliveryController _copyPeerWithID:]( self,  "_copyPeerWithID:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9));
        [v10 setContinuityConnectCount:0];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_peerListMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_pendingPeerMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_peerConnectBlocksMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_peerFailureBlocksMap, "removeObjectForKey:", v4);
}

- (void)lockContinuityPeer:(id)a3 btUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lockedPeerMap, "objectForKey:", v7));
  id v10 = v9;
  if (v9)
  {
    if (([v9 isEqualToString:v6] & 1) == 0)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("Delivery");
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v23 = v10;
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Peer %@ is already locked for btUUID %@, ignore peer %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"Delivery")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"Peer %@ is already locked for btUUID %@, ignore peer %@");
      }
    }
  }

  else
  {
    lockedPeerMap = self->_lockedPeerMap;
    if (!lockedPeerMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v16 = self->_lockedPeerMap;
      self->_lockedPeerMap = Mutable;

      lockedPeerMap = self->_lockedPeerMap;
    }

    -[NSMutableDictionary setObject:forKey:](lockedPeerMap, "setObject:forKey:", v6, v7);
    uint64_t v17 = OSLogHandleForIDSCategory("Delivery");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Lock peer %@ for btUUID %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"Delivery"))
    {
      id v20 = v6;
      id v21 = v7;
      _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Lock peer %@ for btUUID %@.");
    }

    -[IDSUTunDeliveryController _cleanupContinuityPeerMaps:](self, "_cleanupContinuityPeerMaps:", v7, v20, v21);
  }

  pthread_mutex_unlock(p_continuityPeerLock);
}

- (void)unlockContinuityPeer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_continuityPeerLock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lockedPeerMap, "objectForKey:", v4));
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("Delivery");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v12 = v5;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Remove locked peer %@ for btUUID %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"Delivery"))
    {
      id v9 = v5;
      id v10 = v4;
      _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Remove locked peer %@ for btUUID %@");
    }

    -[NSMutableDictionary removeObjectForKey:](self->_lockedPeerMap, "removeObjectForKey:", v4, v9, v10);
  }

  -[IDSUTunDeliveryController _cleanupContinuityPeerMaps:](self, "_cleanupContinuityPeerMaps:", v4);
  pthread_mutex_unlock(&self->_continuityPeerLock);
}

- (void)unlockAllContinuityPeers
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  uint64_t v4 = OSLogHandleForIDSCategory("Delivery");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unlock all peers, clean up.", v12, 2u);
  }

  lockedPeerMap = self->_lockedPeerMap;
  self->_lockedPeerMap = 0LL;

  peerListMap = self->_peerListMap;
  self->_peerListMap = 0LL;

  pendingPeerMap = self->_pendingPeerMap;
  self->_pendingPeerMap = 0LL;

  peerConnectBlocksMap = self->_peerConnectBlocksMap;
  self->_peerConnectBlocksMap = 0LL;

  peerFailureBlocksMap = self->_peerFailureBlocksMap;
  self->_peerFailureBlocksMap = 0LL;

  pthread_mutex_unlock(p_continuityPeerLock);
}

- (id)lockedContinuityPeerID:(id)a3
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_continuityPeerLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lockedPeerMap, "objectForKey:", v5));

  pthread_mutex_unlock(p_continuityPeerLock);
  return v6;
}

- (id)pendingContinuityPeerID:(id)a3
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_continuityPeerLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_pendingPeerMap, "objectForKey:", v5));

  pthread_mutex_unlock(p_continuityPeerLock);
  return v6;
}

- (void)addContinuityPeer:(id)a3 btUUID:(id)a4 connectBlock:(id)a5 failureBlock:(id)a6
{
  id v10 = (NSMutableArray *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[NSMutableArray isEqualToString:](v10, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID))
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "addContinuityPeer is called for default paired device, please file a bug.",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16))
    {
      _IDSWarnV( @"IDSFoundation",  @"addContinuityPeer is called for default paired device, please file a bug.");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"addContinuityPeer is called for default paired device, please file a bug.");
      _IDSLogTransport( @"Warning",  @"IDS",  @"addContinuityPeer is called for default paired device, please file a bug.");
    }
  }

  else
  {
    p_continuityPeerLock = &self->_continuityPeerLock;
    pthread_mutex_lock(&self->_continuityPeerLock);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerListMap, "objectForKey:", v11));
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    uint64_t v18 = v17;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v57,  v67,  16LL);
    if (v19)
    {
      uint64_t v20 = *(void *)v58;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v58 != v20) {
            objc_enumerationMutation(v18);
          }
          if ([*(id *)(*((void *)&v57 + 1) + 8 * (void)i) isEqualToString:v10])
          {
            pthread_mutex_unlock(p_continuityPeerLock);
            uint64_t v34 = v18;
            goto LABEL_48;
          }
        }

        id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v57,  v67,  16LL);
        if (v19) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = OSLogHandleForIDSCategory("Delivery");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v62 = v10;
      __int16 v63 = 2112;
      id v64 = v11;
      __int16 v65 = 2112;
      id v66 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Add new peer %@ for btUUID %@, list %@.",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v24) && _IDSShouldLog(0LL, @"Delivery"))
    {
      id v53 = v11;
      id v55 = v18;
      unsigned int v50 = v10;
      _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Add new peer %@ for btUUID %@, list %@.");
    }

    if (!v18) {
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    -[NSMutableArray addObject:](v18, "addObject:", v10, v50, v53, v55);
    peerListMap = self->_peerListMap;
    if (!peerListMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      id v27 = self->_peerListMap;
      self->_peerListMap = Mutable;

      peerListMap = self->_peerListMap;
    }

    -[NSMutableDictionary setObject:forKey:](peerListMap, "setObject:forKey:", v18, v11);
    uint64_t v28 = OSLogHandleForIDSCategory("Delivery");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "current peer list:%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v30) && _IDSShouldLog(0LL, @"Delivery"))
    {
      __int16 v51 = v18;
      _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"current peer list:%@");
    }

    pendingPeerMap = self->_pendingPeerMap;
    if (!pendingPeerMap)
    {
      __int128 v32 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v33 = self->_pendingPeerMap;
      self->_pendingPeerMap = v32;

      pendingPeerMap = self->_pendingPeerMap;
    }

    uint64_t v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pendingPeerMap, "objectForKey:", v11, v51));
    if (!v34)
    {
      -[NSMutableDictionary setObject:forKey:](self->_pendingPeerMap, "setObject:forKey:", v10, v11);
      uint64_t v35 = OSLogHandleForIDSCategory("Delivery");
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v62 = v10;
        __int16 v63 = 2112;
        id v64 = v11;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Enable peer %@ for btUUID %@.", buf, 0x16u);
      }

      uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
      if ((_DWORD)v38)
      {
        uint64_t v38 = _IDSShouldLog(0LL, @"Delivery");
        if ((_DWORD)v38)
        {
          unsigned int v52 = v10;
          id v54 = v11;
          uint64_t v38 = _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Enable peer %@ for btUUID %@.");
        }
      }

      if (v12)
      {
        uint64_t v40 = im_primary_queue(v38, v39);
        id v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v40);
        dispatch_async(v41, v12);
      }
    }

    id v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_peerConnectBlocksMap,  "objectForKey:",  v11,  v52,  v54));
    if (!v42) {
      id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    if (!self->_peerConnectBlocksMap)
    {
      id v43 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      peerConnectBlocksMap = self->_peerConnectBlocksMap;
      self->_peerConnectBlocksMap = v43;
    }

    id v45 = [v12 copy];
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v45, v10);

    -[NSMutableDictionary setObject:forKey:](self->_peerConnectBlocksMap, "setObject:forKey:", v42, v11);
    id v46 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_peerFailureBlocksMap,  "objectForKey:",  v11));
    if (!v46) {
      id v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    if (!self->_peerFailureBlocksMap)
    {
      __int16 v47 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      peerFailureBlocksMap = self->_peerFailureBlocksMap;
      self->_peerFailureBlocksMap = v47;
    }

    id v49 = [v13 copy];
    -[NSMutableDictionary setObject:forKey:](v46, "setObject:forKey:", v49, v10);

    -[NSMutableDictionary setObject:forKey:](self->_peerFailureBlocksMap, "setObject:forKey:", v46, v11);
    pthread_mutex_unlock(p_continuityPeerLock);

LABEL_48:
  }
}

- (void)tryNextContinuityPeer:(id)a3
{
  id v4 = a3;
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  v61 = self;
  __int128 v58 = v4;
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lockedPeerMap, "objectForKey:", v4));
  if (!v59)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_pendingPeerMap, "objectForKey:", v4));
    if (!v8)
    {
      uint64_t v46 = OSLogHandleForIDSCategory("Warning");
      __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "No pending peer, bail out.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v48))
      {
        _IDSWarnV(@"IDSFoundation", @"No pending peer, bail out.");
        _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"No pending peer, bail out.");
        _IDSLogTransport(@"Warning", @"IDS", @"No pending peer, bail out.");
      }

      pthread_mutex_unlock(p_continuityPeerLock);
      goto LABEL_62;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerListMap, "objectForKey:", v4));
    id v10 = -[IDSUTunDeliveryController _copyPeerWithID:](self, "_copyPeerWithID:", v8);
    id v11 = [v10 continuityConnectCount];

    uint64_t v12 = OSLogHandleForIDSCategory("Delivery");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v69 = v9;
      __int16 v70 = 2112;
      id v71 = v8;
      __int16 v72 = 1024;
      int v73 = (int)v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Search peer in %@. (current peer %@, count %d)",  buf,  0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"Delivery"))
    {
      id v54 = v8;
      id v56 = v11;
      unsigned int v52 = v9;
      _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Search peer in %@. (current peer %@, count %d)");
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obj = v9;
    id v15 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v15)
    {
      __int128 v60 = 0LL;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v18, "isEqualToString:", v8, v52, v54, v56) & 1) == 0)
          {
            id v19 = -[IDSUTunDeliveryController _copyPeerWithID:](v61, "_copyPeerWithID:", v18);
            id v20 = [v19 continuityConnectCount];
            uint64_t v21 = OSLogHandleForIDSCategory("Delivery");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v69 = v18;
              __int16 v70 = 1024;
              LODWORD(v71) = (_DWORD)v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "peer %@ has count %d", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled(v23)
              && _IDSShouldLog(0LL, @"Delivery"))
            {
              unsigned int v52 = v18;
              id v54 = v20;
              _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"peer %@ has count %d");
            }

            if ((int)v20 >= (int)v11)
            {
              id v20 = v11;
            }

            else
            {
              id v24 = v18;

              __int128 v60 = v24;
            }

            id v11 = v20;
          }
        }

        id v15 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      }

      while (v15);

      if (v60)
      {
        uint64_t v25 = OSLogHandleForIDSCategory("Delivery");
        __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v69 = v60;
          __int16 v70 = 2112;
          id v71 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Try new peer %@, disable peer %@.",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v27)
          && _IDSShouldLog(0LL, @"Delivery"))
        {
          unsigned int v52 = v60;
          id v54 = v8;
          _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Try new peer %@, disable peer %@.");
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v61->_peerFailureBlocksMap, "objectForKey:", v58, v52, v54));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v8]);

        if (v29)
        {
          uint64_t v32 = im_primary_queue(v30, v31);
          uint64_t v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v32);
          dispatch_async(v33, v29);
        }

        pendingPeerMap = v61->_pendingPeerMap;
        if (!pendingPeerMap)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          uint64_t v36 = v61->_pendingPeerMap;
          v61->_pendingPeerMap = (NSMutableDictionary *)Mutable;

          pendingPeerMap = v61->_pendingPeerMap;
        }

        -[NSMutableDictionary setObject:forKey:](pendingPeerMap, "setObject:forKey:", v60, v58);
        uint64_t v37 = OSLogHandleForIDSCategory("Delivery");
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v69 = v60;
          __int16 v70 = 2112;
          id v71 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Enable peer %@ for btUUID %@.",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v39)
          && _IDSShouldLog(0LL, @"Delivery"))
        {
          id v53 = v60;
          id v55 = v58;
          _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Enable peer %@ for btUUID %@.");
        }

        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v61->_peerConnectBlocksMap, "objectForKey:", v58, v53, v55));
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:v60]);

        if (v41)
        {
          uint64_t v44 = im_primary_queue(v42, v43);
          id v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v44);
          dispatch_async(v45, v41);
        }

        pthread_mutex_unlock(p_continuityPeerLock);

LABEL_61:
LABEL_62:

        goto LABEL_63;
      }
    }

    else
    {
    }

    uint64_t v49 = OSLogHandleForIDSCategory("Delivery");
    unsigned int v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Found no other peer, stick with peer %@",  buf,  0xCu);
    }

    pthread_mutex_unlock(p_continuityPeerLock);
    __int128 v60 = 0LL;
    goto LABEL_61;
  }

  uint64_t v5 = OSLogHandleForIDSCategory("Delivery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v69 = v59;
    __int16 v70 = 2112;
    id v71 = v58;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Peer %@ is already locked for btUUID %@, skip other peers.",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"Delivery")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"Peer %@ is already locked for btUUID %@, skip other peers.");
  }
  pthread_mutex_unlock(p_continuityPeerLock);
LABEL_63:
}

- (BOOL)isPeerForPhoneContinuityLocalMessage:(id)a3
{
  id v4 = a3;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceIDToPeer, "allValues"));
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 btUUID]);
        if ([v11 isEqualToString:v4])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 originalbtUUID]);
          BOOL v13 = v12 == 0LL;

          if (!v13)
          {
            uint64_t v15 = OSLogHandleForTransportCategory("Delivery");
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 btUUID]);
              *(_DWORD *)buf = 138412290;
              id v29 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Peer's session ID %@ is for the phone continuity local message.",  buf,  0xCu);
            }

            uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
            if ((_DWORD)v20)
            {
              if (_IDSShouldLogTransport(v20))
              {
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 btUUID]);
                _IDSLogTransport( @"Delivery",  @"IDS",  @"Peer's session ID %@ is for the phone continuity local message.");

                if (_IDSShouldLog(0LL, @"Delivery"))
                {
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btUUID", v22));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"Peer's session ID %@ is for the phone continuity local message.");
                }
              }
            }

            BOOL v14 = 1;
            goto LABEL_20;
          }
        }

        else
        {
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_20:

  pthread_mutex_unlock(p_deviceIDToPeerLock);
  return v14;
}

- (id)sessionIDforPeer:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_btuuidToSessionID, "objectForKey:", v5));

  pthread_mutex_unlock(p_deviceIDToPeerLock);
  return v6;
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (id)_currentOTRTimer
{
  return self->_otrTimer;
}

- (void)enableOTRForDefaultPairedDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _currentOTRTimer](self, "_currentOTRTimer"));

  if (!v3)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController pairingManager](self, "pairingManager"));
    if ([v10 isPaired])
    {
      BOOL enableOTR = self->_enableOTR;

      if (enableOTR)
      {
        uint64_t v5 = OSLogHandleForTransportCategory("Delivery");
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Told to enable OTR for default paired device",  buf,  2u);
        }

        uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
        if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
        {
          _IDSLogTransport(@"Delivery", @"IDS", @"Told to enable OTR for default paired device");
          if (_IDSShouldLog(0LL, @"Delivery")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Delivery",  @"Told to enable OTR for default paired device");
          }
        }

        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceIDToPeer,  "objectForKey:",  IDSDeviceDefaultPairedDeviceUniqueID));
        [v9 setEnableOTR:1];
        self->_otrInitialized = 1;
      }
    }

    else
    {
    }
  }

- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue(v7, v8);
  id v9 = -[IDSUTunDeliveryController _copyPeerWithID:](self, "_copyPeerWithID:", v7);
  if (!v9) {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSUTunDeliveryController _createPeerFromDeviceID:](self, "_createPeerFromDeviceID:", v7));
  }
  uint64_t v10 = OSLogHandleForIDSCategory("Delivery");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rapport discovered device. {Peer:%@, deviceID:%@}",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"Delivery"))
  {
    id v14 = v9;
    id v15 = v7;
    _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Rapport discovered device. {Peer:%@, deviceID:%@}");
  }

  if (+[IMUserDefaults isLiveDeliveryWarmUpEnabled]( &OBJC_CLASS___IMUserDefaults,  "isLiveDeliveryWarmUpEnabled",  v14,  v15))
  {
    if (([v9 isCloudConnected] & 1) == 0)
    {
      [v9 enableCloudConnection];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      [v13 startGlobalLinkForDevice:v7];
    }

    [v9 setIsPeerAlwaysConnected:1];
  }
}

- (void)rapportClient:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue(v7, v8);
  id v9 = -[IDSUTunDeliveryController _copyPeerWithID:](self, "_copyPeerWithID:", v7);
  uint64_t v10 = OSLogHandleForIDSCategory("Delivery");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rapport lost device. {Peer:%@, deviceID:%@}",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"Delivery"))
  {
    id v13 = v9;
    id v14 = v7;
    _IDSLogV(0LL, @"IDSFoundation", @"Delivery", @"Rapport lost device. {Peer:%@, deviceID:%@}");
  }

  if (+[IMUserDefaults isLiveDeliveryWarmUpEnabled]( &OBJC_CLASS___IMUserDefaults,  "isLiveDeliveryWarmUpEnabled",  v13,  v14)) {
    [v9 setIsPeerAlwaysConnected:0];
  }
}

- (IDSUTunDeliveryControllerDelegate)delegate
{
  return (IDSUTunDeliveryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableOTR
{
  return self->_enableOTR;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isCloudConnected
{
  return self->_isCloudConnected;
}

- (void)setIsCloudConnected:(BOOL)a3
{
  self->_isCloudConnected = a3;
}

- (BOOL)isClassCConnected
{
  return self->_isClassCConnected;
}

- (void)setIsClassCConnected:(BOOL)a3
{
  self->_isClassCConnected = a3;
}

- (double)lastCloudConnectedTime
{
  return self->_lastCloudConnectedTime;
}

- (void)setLastCloudConnectedTime:(double)a3
{
  self->_lastCloudConnectedTime = a3;
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice
{
  return self->_shouldUseIPsecLinkForDefaultPairedDevice;
}

- (void)setShouldUseIPsecLinkForDefaultPairedDevice:(BOOL)a3
{
  self->_shouldUseIPsecLinkForDefaultPairedDevice = a3;
}

- (IDSNRDeviceBridge)idsNRDeviceBridge
{
  return self->_idsNRDeviceBridge;
}

- (void)setIdsNRDeviceBridge:(id)a3
{
}

- (IDSNRDevicePreferencesHandler)nrDevicePreferencesHandler
{
  return self->_nrDevicePreferencesHandler;
}

- (void)setNrDevicePreferencesHandler:(id)a3
{
}

- (IDSConnectivityMonitor)connectivityMonitor
{
  return self->_connectivityMonitor;
}

- (void)setConnectivityMonitor:(id)a3
{
}

- (double)notificationDelayInSeconds
{
  return self->_notificationDelayInSeconds;
}

- (void)setNotificationDelayInSeconds:(double)a3
{
  self->_notificationDelayInSeconds = a3;
}

- (BOOL)isLocalSetUpInProgress
{
  return self->_isLocalSetUpInProgress;
}

- (void)setIsLocalSetUpInProgress:(BOOL)a3
{
  self->_isLocalSetUpInProgress = a3;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end