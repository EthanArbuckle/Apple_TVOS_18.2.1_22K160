@interface IDSLinkManager
- (BOOL)_hasGlobalLinkConnectingOrConnected;
- (BOOL)_startUDPLinkHandshakeForDefaultDevice:(BOOL)a3 immediately:(BOOL)a4;
- (BOOL)isConnectedToDeviceID:(id)a3;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (IDSLinkManager)initWithDelegate:(id)a3;
- (id)_getIDSLinkTypeString:(unint64_t)a3;
- (id)_linkKeyForLink:(id)a3;
- (id)_newGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 options:(id)a5;
- (id)_newUDPGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (id)_newUDPLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 IPVersion:(unint64_t)a5 port:(unsigned __int16)a6;
- (id)_selectBestLink:(id)a3;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 forceReport:(BOOL)a4;
- (id)linkForCBUUID:(id)a3;
- (unint64_t)_getIDSLinkTypeFromWRMLinkType:(unint64_t)a3;
- (unint64_t)_getWRMLinkTypeFromIDSLinkType:(unint64_t)a3;
- (unint64_t)_sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5 link:(id)a6;
- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)currentDefaultDeviceLinkType;
- (unint64_t)currentLinkType:(id)a3;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)_addAllocateRequestForDevice:(id)a3 requestID:(id)a4;
- (void)_bringUpWiFi:(BOOL)a3;
- (void)_clearWiFiAssociationPowerAssertion;
- (void)_connectivityChangedForDefaultDevice:(BOOL)a3 isCloudConnected:(BOOL)a4;
- (void)_createWiFiAssociationPowerAssertion:(double)a3;
- (void)_createWiFiManagerClient;
- (void)_handleNetworkChanges:(id)a3;
- (void)_handleWRMLinkRecommendation:(unint64_t)a3;
- (void)_handleWiFiAutoJoinStatusChange:(int64_t)a3 WiFiSSID:(id)a4;
- (void)_nearbyChangedForDefaultDevice;
- (void)_processLMCommandPacket:(id *)a3 fromLink:(id)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)_processLinkChangeForDefaultDeviceFrom:(id)a3 to:(id)a4;
- (void)_removeAllLinksForDeviceID:(id)a3;
- (void)_removeAllocateRequestForDevice:(id)a3 requestID:(id)a4;
- (void)_removeLinkForDeviceID:(id)a3 linkKey:(id)a4 verifyWithLink:(id)a5;
- (void)_sendUDPLinkInterfaceAddresses:(id)a3 toDeviceID:(id)a4 isRetransmission:(BOOL)a5 isReply:(BOOL)a6;
- (void)_setBestLinkToCurrent:(id)a3;
- (void)_startAllocateRequestForDevice:(id)a3;
- (void)_startCellularDataStatusListener:(BOOL)a3;
- (void)_startNetworkInterfaceListener:(BOOL)a3;
- (void)_startReporter;
- (void)_subscribeToWRMForLinkRecommendation:(unint64_t)a3;
- (void)_suspendBTLink:(BOOL)a3 cbuuid:(id)a4;
- (void)_unsubscribeFromWRMForLinkRecommendation;
- (void)addPairedDevice:(id)a3;
- (void)cellularRadioAccessTechnologyDidChange:(BOOL)a3;
- (void)cellularSoMaskDidChange:(unsigned int)a3;
- (void)clearCellInterfaceName:(id)a3;
- (void)clearIDSContextBlob:(id)a3;
- (void)clearPluginCacheForSession:(id)a3;
- (void)clearReliableUnicastStateForSession:(id)a3;
- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3;
- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6;
- (void)connectPairedDevice:(id)a3;
- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5;
- (void)currentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6;
- (void)currentLinkType:(unint64_t *)a3 andRATType:(unsigned int *)a4 forDeviceID:(id)a5;
- (void)dealloc;
- (void)deletePairedDevice:(id)a3;
- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4;
- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5;
- (void)dropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5;
- (void)flushBuffer:(unint64_t)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)flushLinkProbingStatus:(id)a3 options:(id)a4;
- (void)getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6;
- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5;
- (void)injectFakePacketInBTLink:(id *)a3 cbuuid:(id)a4;
- (void)link:(id)a3 didAddQREvent:(id)a4;
- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4;
- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7;
- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6;
- (void)link:(id)a3 didFailToConnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4;
- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4;
- (void)link:(id)a3 didRATChange:(unsigned __int8)a4;
- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4;
- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4;
- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6;
- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5;
- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5;
- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4;
- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4;
- (void)link:(id)a3 didReceiveReportEvent:(id)a4;
- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4;
- (void)link:(id)a3 didReceiveSKEData:(id)a4;
- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7;
- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4;
- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7;
- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)link:(id)a3 hostAwakeDidChange:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6;
- (void)manager:(id)a3 didPairedDeviceChange:(BOOL)a4;
- (void)manager:(id)a3 didPowerStateChange:(BOOL)a4;
- (void)manager:(id)a3 linkDidConnect:(id)a4;
- (void)manager:(id)a3 linkDidDisconnect:(id)a4;
- (void)obliterateConnectionInfo;
- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5;
- (void)queryLinkProbingStatus:(id)a3 options:(id)a4;
- (void)receiveJoinNotificationFromAParticipant:(id)a3;
- (void)registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5;
- (void)removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5;
- (void)reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6;
- (void)requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4;
- (void)requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5;
- (void)sendConnectedLinkInfoToAVCForSessionID:(id)a3;
- (void)sendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7;
- (void)sendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5;
- (void)sendStatsRequest:(id)a3 options:(id)a4;
- (void)sendStatsRequestForClient:(id)a3 options:(id)a4;
- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5;
- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4;
- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4;
- (void)setClientUniquePID:(unint64_t)a3 sessionID:(id)a4;
- (void)setDefaultUnderlyingLink:(id)a3 linkID:(char)a4;
- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4;
- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4;
- (void)setIsOnPhoneCall:(BOOL)a3 forDeviceID:(id)a4;
- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5;
- (void)setLinkPreferences:(id)a3;
- (void)setPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4;
- (void)setRequireBT:(BOOL)a3;
- (void)setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5;
- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4;
- (void)setShouldStartBTLinkManager:(BOOL)a3;
- (void)setTimeBase:(id)a3 forIDSSession:(id)a4;
- (void)setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4;
- (void)setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4;
- (void)start;
- (void)startBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
- (void)startGlobalLinkForDevice:(id)a3;
- (void)startLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)startLinkProbing:(id)a3 options:(id)a4;
- (void)startLocalSetup;
- (void)startUDPGlobalLinkForDevice:(id)a3;
- (void)stopBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)stopGlobalLinkForDevice:(id)a3;
- (void)stopKeepAlive:(id)a3 linkIDs:(id)a4;
- (void)stopLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 disconnectWP:(BOOL)a5;
- (void)stopLinkProbing:(id)a3 options:(id)a4;
- (void)stopUDPGlobalLinkForDevice:(id)a3;
- (void)terminateCallDueToIdleClientForLink:(id)a3;
- (void)triggerBTCorruptionRecoveryForCBUUID:(id)a3;
- (void)triggerFixedInterfaceLinksDidConnect;
- (void)updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)updateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5;
- (void)updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6;
- (void)updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6;
@end

@implementation IDSLinkManager

- (IDSLinkManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___IDSLinkManager;
  v5 = -[IDSLinkManager init](&v46, "init");
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("LinkManager");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "============= New LinkManager %@ starting =============",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"LinkManager"))
    {
      v42 = v5;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"============= New LinkManager %@ starting =============");
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    cbuuidToLinks = v5->_cbuuidToLinks;
    v5->_cbuuidToLinks = (NSMutableDictionary *)Mutable;

    CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    deviceIDToCurrentLink = v5->_deviceIDToCurrentLink;
    v5->_deviceIDToCurrentLink = (NSMutableDictionary *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    v5->_isInternalInstall = [v13 isInternalInstall];

    v5->_demoMode = 0;
    if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0LL)
      && CFPreferencesGetAppIntegerValue(@"FProgramNumber", @"com.apple.demo-settings", 0LL) == 5)
    {
      v5->_demoMode = 1;
    }

    uint64_t v14 = IMGetDomainValueForKey(@"com.apple.ids", @"ReportFileOpenTimeInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v15) {
      double v17 = (double)[v15 unsignedIntValue];
    }
    else {
      double v17 = 1.0;
    }
    v5->_minReportFileOpenTimeInterval = v17;
    v5->_previousReportFileOpenTime = 0.0;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[IMUserDefaults fixedInterface](&OBJC_CLASS___IMUserDefaults, "fixedInterface", v42));
    fixedInterface = v5->_fixedInterface;
    v5->_fixedInterface = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[IMUserDefaults fixedInterfaceDestination](&OBJC_CLASS___IMUserDefaults, "fixedInterfaceDestination"));
    fixedInterfaceDestination = v5->_fixedInterfaceDestination;
    v5->_fixedInterfaceDestination = (NSString *)v20;

    v22 = v5->_fixedInterface;
    if (v22 && v5->_fixedInterfaceDestination)
    {
      uint64_t v23 = OSLogHandleForTransportCategory("LinkManager");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (IDSLinkManager *)v5->_fixedInterface;
        v26 = v5->_fixedInterfaceDestination;
        *(_DWORD *)buf = 138412546;
        v48 = v25;
        __int16 v49 = 2112;
        v50 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Both FixedInterface [%@] and FixedInterfaceDestination [%@] are set. Setting up UDPLink only.",  buf,  0x16u);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          v43 = v5->_fixedInterface;
          v45 = v5->_fixedInterfaceDestination;
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Both FixedInterface [%@] and FixedInterfaceDestination [%@] are set. Setting up UDPLink only.");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            v43 = v5->_fixedInterface;
            v45 = v5->_fixedInterfaceDestination;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Both FixedInterface [%@] and FixedInterfaceDestination [%@] are set. Setting up UDPLink only.");
          }
        }
      }

      v5->_hasFixedDestination = 1;
    }

    else
    {
      v5->_fixedInterface = 0LL;

      v29 = v5->_fixedInterfaceDestination;
      v5->_fixedInterfaceDestination = 0LL;

      v5->_hasFixedDestination = 0;
      v30 = -[IDSBTLinkManager initWithDelegate:pairedDevice:]( objc_alloc(&OBJC_CLASS___IDSBTLinkManager),  "initWithDelegate:pairedDevice:",  v5,  0LL);
      btLinkManager = v5->_btLinkManager;
      v5->_btLinkManager = v30;

      if (v5->_btLinkManager)
      {
        -[IDSLinkManager _startNetworkInterfaceListener:](v5, "_startNetworkInterfaceListener:", 1LL);
        -[IDSLinkManager _startCellularDataStatusListener:](v5, "_startCellularDataStatusListener:", 1LL);
      }
    }

    -[IDSLinkManager _startReporter](v5, "_startReporter", v43, v45);
    uint64_t v32 = IMGetDomainValueForKey(@"com.apple.ids", @"preferInfraWiFiConnectionTimeout");
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = v33;
    if (v33) {
      double v35 = (double)[v33 unsignedIntValue];
    }
    else {
      double v35 = 60.0;
    }
    v5->_int preferInfraWiFiConnectionTimeout = v35;
    uint64_t v36 = OSLogHandleForTransportCategory("LinkManager");
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int preferInfraWiFiConnectionTimeout = (int)v5->_preferInfraWiFiConnectionTimeout;
      *(_DWORD *)buf = 67109120;
      LODWORD(v48) = preferInfraWiFiConnectionTimeout;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Use preferInfraWiFiConnectionTimeout: %d seconds.",  buf,  8u);
    }

    uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
    if ((_DWORD)v40)
    {
      if (_IDSShouldLogTransport(v40))
      {
        uint64_t v44 = (int)v5->_preferInfraWiFiConnectionTimeout;
        _IDSLogTransport(@"LinkManager", @"IDS", @"Use preferInfraWiFiConnectionTimeout: %d seconds.");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v44 = (int)v5->_preferInfraWiFiConnectionTimeout;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Use preferInfraWiFiConnectionTimeout: %d seconds.");
        }
      }
    }

    -[IDSLinkManager _createWiFiManagerClient](v5, "_createWiFiManagerClient", v44);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForIDSCategory("LinkManager");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "============= Dealloc LinkManager %@ =============",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    v12 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"============= Dealloc LinkManager %@ =============");
  }

  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0LL, v12);
  if (self->_wifiDevice)
  {
    if (qword_1009C0698 != -1) {
      dispatch_once(&qword_1009C0698, &stru_1008FE650);
    }
    if (off_1009C0690) {
      off_1009C0690(self->_wifiDevice, 0LL, 0LL);
    }
    CFRelease(self->_wifiDevice);
  }

  if (self->_wifiManager)
  {
    if (qword_1009C06A8 != -1) {
      dispatch_once(&qword_1009C06A8, &stru_1008FE670);
    }
    v7 = (void (*)(void *, CFRunLoopRef, const CFRunLoopMode))off_1009C06A0;
    if (off_1009C06A0)
    {
      wifiManager = self->_wifiManager;
      CFRunLoopRef Main = CFRunLoopGetMain();
      v7(wifiManager, Main, kCFRunLoopDefaultMode);
    }

    CFRelease(self->_wifiManager);
  }

  -[IDSBTLinkManager stop](self->_btLinkManager, "stop");
  -[IDSWPLinkManager setDelegate:](self->_wpLinkManager, "setDelegate:", 0LL);
  reporterTimer = self->_reporterTimer;
  if (reporterTimer)
  {
    dispatch_source_cancel((dispatch_source_t)reporterTimer);
    CFMutableDictionaryRef v11 = self->_reporterTimer;
    self->_reporterTimer = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSLinkManager;
  -[IDSLinkManager dealloc](&v13, "dealloc");
}

- (void)start
{
  uint64_t v3 = (IDSWPLinkManager *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance"));
  wpLinkManager = self->_wpLinkManager;
  self->_wpLinkManager = v3;

  -[IDSWPLinkManager setDelegate:](self->_wpLinkManager, "setDelegate:", self);
  if (self->_hasFixedDestination)
  {
    BOOL v5 = -[NSString rangeOfString:](self->_fixedInterfaceDestination, "rangeOfString:", @":") != (id)0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = kIDSDefaultPairedDeviceID;
    id v13 = -[IDSLinkManager _newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:]( self,  "_newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:",  0LL,  kIDSDefaultPairedDeviceID,  v5,  49888LL);
    if (-[NSString rangeOfString:](self->_fixedInterfaceDestination, "rangeOfString:", @"=") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithAddressString:withPortHostOrder:withInterfaceName:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithAddressString:withPortHostOrder:withInterfaceName:",  self->_fixedInterfaceDestination,  49888LL,  self->_fixedInterface));
      [v13 setDestinationAddress:v7 isFixedDestination:self->_hasFixedDestination fromAddress:0];
    }

    else
    {
      uint64_t v8 = sub_100223CC0(self->_fixedInterfaceDestination, self->_fixedInterface);
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v8);
      deviceIDToUDPDestinations = self->_deviceIDToUDPDestinations;
      self->_deviceIDToUDPDestinations = v9;

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v12 = self->_deviceIDToUDPDestinations;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100224FC4;
      v14[3] = &unk_1008F8418;
      CFMutableDictionaryRef v15 = Mutable;
      v7 = Mutable;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v14);
      [v13 setDestinationAddressToDeviceIDMap:v7];
    }

    -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v6);
    self->_isDefaultDeviceNearby = 1;
    -[IDSLinkManager _nearbyChangedForDefaultDevice](self, "_nearbyChangedForDefaultDevice");
  }

- (void)triggerFixedInterfaceLinksDidConnect
{
  if (self->_hasFixedDestination)
  {
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      BOOL v4 = kIDSDefaultPairedDeviceID == 0LL;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      Value = 0LL;
    }
    else {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
    }
    id v6 = Value;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_deviceIDToUDPDestinations, "allKeys"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002250B8;
    v11[3] = &unk_1008F7900;
    id v12 = v7;
    id v13 = self;
    id v14 = v6;
    id v8 = v6;
    id v9 = v7;
    IDSTransportThreadAddBlock(v11, v10);
  }

- (id)copyLinkStatsDict
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Value = 0LL;
  if (self->_cbuuidToLinks) {
    BOOL v5 = kIDSDefaultPairedDeviceID == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, kIDSDefaultPairedDeviceID);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([Value allValues]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        CFMutableDictionaryRef v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = [v11 copyLinkStatsDict];
        if (v12) {
          CFDictionarySetValue(Mutable, [v11 linkTypeString], v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  id v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesReceived));
  CFMutableDictionaryRef v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesSent));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsDropped));
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsReceived));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsSent));
  v19 = -[NSDictionary initWithObjectsAndKeys:]( v13,  "initWithObjectsAndKeys:",  v14,  @"bytesReceived",  v15,  @"bytesSent",  v16,  @"packetsDropped",  v17,  @"packetsReceived",  v18,  @"packetsSent",  0LL);

  if (v19) {
    CFDictionarySetValue(Mutable, @"total", v19);
  }

  return Mutable;
}

- (id)generateLinkReport:(double)a3 forceReport:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  double v6 = a3 - previousReportTime;
  if (a4 || v6 >= 30.0)
  {
    if (previousReportTime == 0.0)
    {
LABEL_36:
      self->_double previousReportTime = a3;
      return 0LL;
    }

    int reporterFd = self->_reporterFd;
    if (reporterFd != -1)
    {
LABEL_5:
      *(void *)&v117[15] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)v117 = v8;
      __int128 v116 = v8;
      __int128 v115 = v8;
      __int128 v114 = v8;
      __int128 v113 = v8;
      __int128 v112 = v8;
      __int128 v111 = v8;
      __int128 v110 = v8;
      __int128 v109 = v8;
      __int128 v108 = v8;
      __int128 v107 = v8;
      __int128 v106 = v8;
      strcpy(__s, "=======================================================\n");
      size_t v9 = strlen(__s);
      if (write(reporterFd, __s, v9) <= 0)
      {
        close(self->_reporterFd);
        self->_int reporterFd = -1;
        uint64_t v10 = OSLogHandleForIDSCategory("LinkManager");
        CFMutableDictionaryRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          reporterFile = self->_reporterFile;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "closed FIFO file %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v12)
          && _IDSShouldLog(0LL, @"LinkManager"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"closed FIFO file %s");
        }

        dispatch_source_cancel((dispatch_source_t)self->_reporterTimer);
        reporterTimer = self->_reporterTimer;
        self->_reporterTimer = 0LL;
      }

- (void)_startReporter
{
  self->_int reporterFd = -1;
  if (self->_isInternalInstall)
  {
    memset(v36, 170, sizeof(v36));
    if (confstr(65537, v36, 0x401uLL))
    {
      uint64_t v3 = opendir(v36);
      BOOL v4 = v3;
      if (v3)
      {
        BOOL v5 = readdir(v3);
        if (v5)
        {
          *(void *)&__int128 v6 = 136315138LL;
          __int128 v31 = v6;
          do
          {
            d_name = v5->d_name;
            if (!strncmp(v5->d_name, "ids-report.", 0xBuLL))
            {
              size_t v8 = strlen(v36) + v5->d_namlen;
              size_t v9 = v8 + 1;
              unint64_t v10 = (v8 + 16) & 0xFFFFFFFFFFFFFFF0LL;
              CFMutableDictionaryRef v11 = (char *)&v31 - v10;
              if (v9) {
                memset((char *)&v31 - v10, 170, v9);
              }
              snprintf(v11, v9, "%s%s", v36, d_name);
              uint64_t v12 = OSLogHandleForIDSCategory("LinkManager");
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                int v32 = v31;
                uint64_t v33 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "removing old fifo file %s",  (uint8_t *)&v32,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v14)
                && _IDSShouldLog(0LL, @"LinkManager"))
              {
                _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"removing old fifo file %s");
              }

              unlink(v11);
            }

            BOOL v5 = readdir(v4);
          }

          while (v5);
        }

        closedir(v4);
        pid_t v15 = getpid();
        reporterFile = self->_reporterFile;
        snprintf(self->_reporterFile, 0x401uLL, "%s%s%u", v36, "ids-report.", v15);
        if (!mkfifo(self->_reporterFile, 0x1A4u))
        {
          int v17 = open(self->_reporterFile, 5);
          self->_int reporterFd = v17;
          if (v17 == -1)
          {
            int v27 = *__error();
            if (v27 != 6)
            {
              uint64_t v28 = OSLogHandleForIDSCategory("LinkManager");
              v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                int v32 = 136315394;
                uint64_t v33 = reporterFile;
                __int16 v34 = 1024;
                int v35 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "cannot open reporting FIFO file %s, errno=%d",  (uint8_t *)&v32,  0x12u);
              }

              if (os_log_shim_legacy_logging_enabled(v30)
                && _IDSShouldLog(0LL, @"LinkManager"))
              {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"cannot open reporting FIFO file %s, errno=%d");
              }
            }
          }

          else
          {
            uint64_t v18 = OSLogHandleForIDSCategory("LinkManager");
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              int v32 = 136315138;
              uint64_t v33 = reporterFile;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "opened FIFO file %s for writing",  (uint8_t *)&v32,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v20))
            {
            }
          }
        }
      }

      else
      {
        uint64_t v24 = OSLogHandleForIDSCategory("LinkManager");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 136315138;
          uint64_t v33 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "_startReporter cannot open %s",  (uint8_t *)&v32,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v26)
          && _IDSShouldLog(0LL, @"LinkManager"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"_startReporter cannot open %s");
        }
      }
    }

    else
    {
      uint64_t v21 = OSLogHandleForIDSCategory("LinkManager");
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "_startReporter cannot locate temporary directory",  (uint8_t *)&v32,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v23)
        && _IDSShouldLog(0LL, @"LinkManager"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startReporter cannot locate temporary directory");
      }
    }
  }

- (void)_createWiFiManagerClient
{
  if (self->_isCentral)
  {
    if (qword_1009C06B8 != -1) {
      dispatch_once(&qword_1009C06B8, &stru_1008FE690);
    }
    uint64_t v3 = (void *)off_1009C06B0(0LL, 0LL);
    self->_wifiManager = v3;
    if (v3)
    {
      if (qword_1009C06C8 != -1) {
        dispatch_once(&qword_1009C06C8, &stru_1008FE6B0);
      }
      BOOL v4 = (void *)off_1009C06C0(self->_wifiManager);
      BOOL v5 = v4;
      if (v4)
      {
        id v6 = [v4 count];
        if (v6) {
          id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
        }
        self->_wifiDevice = v6;
      }

      if (!self->_wifiDevice)
      {
        uint64_t v14 = OSLogHandleForTransportCategory("AutoJoin");
        pid_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No WifiDevice available!", buf, 2u);
        }

        uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
        if ((_DWORD)v17)
        {
          if (_IDSShouldLogTransport(v17))
          {
            _IDSLogTransport(@"AutoJoin", @"IDS", @"No WifiDevice available!");
          }
        }

        goto LABEL_46;
      }

      if (qword_1009C06D8 != -1) {
        dispatch_once(&qword_1009C06D8, &stru_1008FE6D0);
      }
      if (off_1009C06D0)
      {
        off_1009C06D0(self->_wifiDevice, sub_1002274D4, self);
        if (qword_1009C06E8 != -1) {
          dispatch_once(&qword_1009C06E8, &stru_1008FE6F0);
        }
        id v7 = (void (*)(void *, CFRunLoopRef, const CFRunLoopMode))off_1009C06E0;
        if (off_1009C06E0)
        {
          wifiManager = self->_wifiManager;
          CFRunLoopRef Main = CFRunLoopGetMain();
          v7(wifiManager, Main, kCFRunLoopDefaultMode);
LABEL_48:

          return;
        }

        uint64_t v23 = OSLogHandleForTransportCategory("AutoJoin");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v32 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "WiFiManagerClientScheduleWithRunLoop not found in MobileWiFi",  v32,  2u);
        }

        uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
        if (!(_DWORD)v26) {
          goto LABEL_44;
        }
        _IDSLogTransport( @"AutoJoin",  @"IDS",  @"WiFiManagerClientScheduleWithRunLoop not found in MobileWiFi");
        __int128 v22 = @"WiFiManagerClientScheduleWithRunLoop not found in MobileWiFi";
      }

      else
      {
        uint64_t v18 = OSLogHandleForTransportCategory("AutoJoin");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v31 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "WiFiDeviceClientRegisterAutoJoinNotificationCallback not found in MobileWiFi",  v31,  2u);
        }

        uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
        if (!(_DWORD)v21) {
          goto LABEL_44;
        }
        _IDSLogTransport( @"AutoJoin",  @"IDS",  @"WiFiDeviceClientRegisterAutoJoinNotificationCallback not found in MobileWiFi");
        __int128 v22 = @"WiFiDeviceClientRegisterAutoJoinNotificationCallback not found in MobileWiFi";
      }

      _IDSLogV(0LL, @"IDSFoundation", @"AutoJoin", v22);
LABEL_44:
      wifiDevice = self->_wifiDevice;
      if (wifiDevice)
      {
        CFRelease(wifiDevice);
        self->_wifiDevice = 0LL;
      }

- (id)_linkKeyForLink:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSBTLink, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v7 = @"IDSLinkBTKey";
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___IDSBTDatagramLink, v6);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      id v7 = @"IDSLinkBTDatagramKey";
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___IDSBTLELink, v9);
      if ((objc_opt_isKindOfClass(v3, v10) & 1) != 0)
      {
        id v7 = @"IDSLinkBTLEKey";
      }

      else
      {
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___IDSUDPLink, v11);
        if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
        {
          id v7 = @"IDSLinkLocalUDPKey";
        }

        else
        {
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___IDSUDPGlobalLink, v13);
          if ((objc_opt_isKindOfClass(v3, v14) & 1) != 0)
          {
            id v7 = @"IDSLinkGlobalUDPKey";
          }

          else
          {
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v15);
            if ((objc_opt_isKindOfClass(v3, v16) & 1) != 0) {
              id v7 = @"IDSLinkGlobalKey";
            }
            else {
              id v7 = @"IDSLinkNoneKey";
            }
          }
        }
      }
    }
  }

  return (id)v7;
}

- (void)_suspendBTLink:(BOOL)a3 cbuuid:(id)a4
{
  BOOL v4 = a3;
  id v6 = kIDSDefaultPairedDeviceID;
  cbuuidToLinks = self->_cbuuidToLinks;
  if (cbuuidToLinks) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || (uint64_t v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6)) == 0LL)
  {
    uint64_t v10 = 0LL;
    self->_BOOL doesDefaultDevicePreferInfraWiFi = v4;
  }

  else
  {
    uint64_t v10 = v9;
    uint64_t v11 = (id)CFDictionaryGetValue(v9, @"IDSLinkBTKey");
    BOOL doesDefaultDevicePreferInfraWiFi = self->_doesDefaultDevicePreferInfraWiFi;
    self->_BOOL doesDefaultDevicePreferInfraWiFi = v4;
    if (v11)
    {
      uint64_t v13 = v11;
      unsigned int v14 = [v11 isLinkSuspended];
      uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = @"NO";
        if (v14) {
          uint64_t v18 = @"YES";
        }
        else {
          uint64_t v18 = @"NO";
        }
        if (v4) {
          uint64_t v17 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        __int128 v22 = v18;
        __int16 v23 = 2112;
        uint64_t v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_suspendBTLink %@ -> %@", buf, 0x16u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"_suspendBTLink %@ -> %@");
        }
      }

      if (v14 == v4)
      {
        if (doesDefaultDevicePreferInfraWiFi && !v4 && !self->_isCentral)
        {
          -[IDSLinkManager _startUDPLinkHandshakeForDefaultDevice:immediately:]( self,  "_startUDPLinkHandshakeForDefaultDevice:immediately:",  0LL,  1LL);
          if (self->_isDefaultDeviceUsingBTLink) {
            -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  1LL,  self->_lastSentDefaultDeviceCloudConnectivity);
          }
        }
      }

      else
      {
        [v13 suspendLink:v4];
        -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v6);
      }

      goto LABEL_24;
    }
  }

  if (!v4) {
    -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v6);
  }
  uint64_t v13 = 0LL;
LABEL_24:
}

- (void)injectFakePacketInBTLink:(id *)a3 cbuuid:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_isInternalInstall)
  {
    id key = kIDSDefaultPairedDeviceID;

    BOOL v8 = 0LL;
    if (self->_cbuuidToLinks)
    {
      Value = 0LL;
      if (key)
      {
        Value = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, key);
        BOOL v8 = Value;
        if (Value) {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, @"IDSLinkBTKey");
        }
      }
    }

    else
    {
      Value = 0LL;
    }

    [Value injectFakePacket:a3];

    id v6 = key;
  }
}

- (void)_connectivityChangedForDefaultDevice:(BOOL)a3 isCloudConnected:(BOOL)a4
{
  if (self->_shouldStartBTLinkManager)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    id v6 = self;
    if (a3) {
      self->_hasDelayedNoConnectivityNotification = 0;
    }
    if (self->_lastSentDefaultDeviceConnectivity != a3 || self->_lastSentDefaultDeviceCloudConnectivity != a4)
    {
      uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = @"YES";
        if (v6->_lastSentDefaultDeviceConnectivity) {
          uint64_t v10 = @"YES";
        }
        else {
          uint64_t v10 = @"NO";
        }
        BOOL lastSentDefaultDeviceCloudConnectivity = v6->_lastSentDefaultDeviceCloudConnectivity;
        if (v5) {
          uint64_t v12 = @"YES";
        }
        else {
          uint64_t v12 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        uint64_t v40 = v10;
        if (lastSentDefaultDeviceCloudConnectivity) {
          uint64_t v13 = @"YES";
        }
        else {
          uint64_t v13 = @"NO";
        }
        __int16 v41 = 2112;
        uint64_t v42 = v12;
        if (!v4) {
          uint64_t v9 = @"NO";
        }
        __int16 v43 = 2112;
        uint64_t v44 = v13;
        __int16 v45 = 2112;
        unint64_t v46 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_connectivityChangedForDefaultDevice: local(%@ -> %@), cloud(%@ -> %@).",  buf,  0x2Au);
      }

      uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
      if ((_DWORD)v15)
      {
        if (_IDSShouldLogTransport(v15))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"_connectivityChangedForDefaultDevice: local(%@ -> %@), cloud(%@ -> %@).");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_connectivityChangedForDefaultDevice: local(%@ -> %@), cloud(%@ -> %@).");
          }
        }
      }

      v6->_lastSentDefaultDeviceConnectivity = v5;
      v6->_BOOL lastSentDefaultDeviceCloudConnectivity = v4;
      if (v5 || v4)
      {
        uint64_t v24 = OSLogHandleForIDSCategory("LinkManager");
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "_connectivityChangedForDefaultDevice sending UTunController didConnectForDevice (default)",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v26)
          && _IDSShouldLog(0LL, @"LinkManager"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_connectivityChangedForDefaultDevice sending UTunController didConnectForDevice (default)");
        }

        id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
        [WeakRetained link:v6 didConnectForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID];
      }

      else
      {
        uint64_t v16 = OSLogHandleForIDSCategory("LinkManager");
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "_connectivityChangedForDefaultDevice sending UTunController didDisconnectForDevice (default)",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v18)
          && _IDSShouldLog(0LL, @"LinkManager"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_connectivityChangedForDefaultDevice sending UTunController didDisconnectForDevice (default)");
        }

        id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
        [WeakRetained link:v6 didDisconnectForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID];
      }
    }

    if (v6->_hasDelayedNoConnectivityNotification)
    {
      uint64_t v27 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = @"NO";
        if (v5) {
          v29 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "_connectivityChangedForDefaultDevice NOT(delay) sending legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@",  buf,  0xCu);
      }

      self = (IDSLinkManager *)os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)self)
      {
        self = (IDSLinkManager *)_IDSShouldLogTransport(self);
        if ((_DWORD)self)
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"_connectivityChangedForDefaultDevice NOT(delay) sending legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@");
          self = (IDSLinkManager *)_IDSShouldLog(0LL, @"LinkManager");
          if ((_DWORD)self) {
            self = (IDSLinkManager *)_IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_connectivityChangedForDefaultDevice NOT(delay) sending legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@");
          }
        }
      }
    }

    else if (v6->_lastSentDefaultPeerConnectivity != v5)
    {
      v6->_lastSentDefaultPeerConnectivity = v5;
      uint64_t v31 = im_primary_queue(self, a2);
      int v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002282EC;
      block[3] = &unk_1008FE710;
      BOOL v38 = v5;
      dispatch_async(v32, block);
    }

    uint64_t v33 = im_primary_queue(self, a2);
    __int16 v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v33);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100228480;
    v35[3] = &unk_1008FE710;
    BOOL v36 = v4;
    dispatch_async(v34, v35);
  }

  else
  {
    uint64_t v20 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Not processing _connectivityChangedForDefaultDevice in the IPsecLink path.",  buf,  2u);
    }

    uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
    if ((_DWORD)v23)
    {
      if (_IDSShouldLogTransport(v23))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"Not processing _connectivityChangedForDefaultDevice in the IPsecLink path.");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Not processing _connectivityChangedForDefaultDevice in the IPsecLink path.");
        }
      }
    }
  }

- (void)_nearbyChangedForDefaultDevice
{
  if (self->_lastSentDefaultDeviceNearby != self->_isDefaultDeviceNearby)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("LinkManager");
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = @"YES";
      if (self->_lastSentDefaultDeviceNearby) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      if (!self->_isDefaultDeviceNearby) {
        BOOL v5 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_nearbyChangedForDefaultDevice: %@ -> %@",  buf,  0x16u);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      uint64_t v8 = _IDSShouldLog(0LL, @"LinkManager");
      if ((_DWORD)v8) {
        uint64_t v8 = _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_nearbyChangedForDefaultDevice: %@ -> %@");
      }
    }

    self->_lastSentDefaultDeviceNearby = self->_isDefaultDeviceNearby;
    uint64_t v10 = im_primary_queue(v8, v9);
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002287D0;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_async(v11, block);
  }

- (void)_processLMCommandPacket:(id *)a3 fromLink:(id)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v10 = (__CFString *)a4;
  id v95 = a5;
  id v11 = a6;
  *(void *)&double v12 = *(unsigned __int8 *)a3->var0;
  switch(*a3->var0)
  {
    case '@':
    case 'B':
      uint64_t v13 = IMGetDomainValueForKey(@"com.apple.ids", @"DisableRangeExtension");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = v14;
      if (!v14 || ![v14 BOOLValue] || self->_doesDefaultDevicePreferInfraWiFi)
      {

        goto LABEL_6;
      }

      uint64_t v83 = OSLogHandleForTransportCategory("LinkManager");
      v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Ignore LMCommandUDPLinkAddress/Reply due to disabled range extension via defaults.",  buf,  2u);
      }

      uint64_t v86 = os_log_shim_legacy_logging_enabled(v85);
      if ((_DWORD)v86)
      {
        if (_IDSShouldLogTransport(v86))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Ignore LMCommandUDPLinkAddress/Reply due to disabled range extension via defaults.");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Ignore LMCommandUDPLinkAddress/Reply due to disabled range extension via defaults.");
          }
        }
      }

      goto LABEL_137;
    case 'A':
    case 'C':
      uint64_t v42 = OSLogHandleForTransportCategory("LinkManager");
      __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&uint64_t v44 = COERCE_DOUBLE(&stru_100912B50);
        if (LODWORD(v12) == 67) {
          *(double *)&uint64_t v44 = COERCE_DOUBLE(@"(reply) ");
        }
        *(_DWORD *)buf = 138412546;
        double v97 = *(double *)&v44;
        __int16 v98 = 2112;
        __int128 v99 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "received remote UDPLink interface down %@through %@",  buf,  0x16u);
      }

      uint64_t v46 = os_log_shim_legacy_logging_enabled(v45);
      if ((_DWORD)v46 && _IDSShouldLogTransport(v46))
      {
        *(double *)&uint64_t v47 = LODWORD(v12) == 67 ? COERCE_DOUBLE(@"(reply) ") : COERCE_DOUBLE(&stru_100912B50);
        double v87 = *(double *)&v47;
        v89 = v10;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"received remote UDPLink interface down %@through %@");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          double v87 = *(double *)&v47;
          v89 = v10;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"received remote UDPLink interface down %@through %@");
        }
      }

      if (self->_doesDefaultDevicePreferInfraWiFi) {
        -[IDSLinkManager _suspendBTLink:cbuuid:](self, "_suspendBTLink:cbuuid:", 0LL, v11);
      }
      id v15 = -[IDSLinkManager _newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:]( self,  "_newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:",  0LL,  v11,  0LL,  0LL,  *(void *)&v87,  v89);
      if (LODWORD(v12) == 65) {
        -[IDSLinkManager _sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:]( self,  "_sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:",  v15,  v11,  0LL,  1LL);
      }
      uint64_t v49 = objc_opt_class(&OBJC_CLASS___IDSUDPLink, v48);
      if ((objc_opt_isKindOfClass(v10, v49) & 1) == 0) {
        [v15 setDestinationAddress:0 isFixedDestination:self->_hasFixedDestination fromAddress:0];
      }
      if (self->_isCentral)
      {
        if (!self->_mayBringUpWiFi) {
          goto LABEL_137;
        }
        uint64_t v50 = OSLogHandleForTransportCategory("LinkManager");
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "will NOT bring up WiFi when losing BTLink",  buf,  2u);
        }

        uint64_t v53 = os_log_shim_legacy_logging_enabled(v52);
        if ((_DWORD)v53 && _IDSShouldLogTransport(v53))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"will NOT bring up WiFi when losing BTLink");
          BOOL v54 = 0;
          if ((_IDSShouldLog(0LL, @"LinkManager") & 1) == 0) {
            goto LABEL_136;
          }
          uint64_t v55 = @"will NOT bring up WiFi when losing BTLink";
LABEL_86:
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", v55);
          goto LABEL_136;
        }

        BOOL v54 = 0;
      }

      else
      {
        if (self->_mayBringUpWiFi) {
          goto LABEL_137;
        }
        uint64_t v64 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "will bring up WiFi when losing BTLink",  buf,  2u);
        }

        uint64_t v67 = os_log_shim_legacy_logging_enabled(v66);
        if ((_DWORD)v67 && _IDSShouldLogTransport(v67))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"will bring up WiFi when losing BTLink");
          BOOL v54 = 1;
          if ((_IDSShouldLog(0LL, @"LinkManager") & 1) == 0) {
            goto LABEL_136;
          }
          uint64_t v55 = @"will bring up WiFi when losing BTLink";
          goto LABEL_86;
        }

        BOOL v54 = 1;
      }

- (void)_sendUDPLinkInterfaceAddresses:(id)a3 toDeviceID:(id)a4 isRetransmission:(BOOL)a5 isReply:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  double v12 = v11;
  if (self->_hasFixedDestination) {
    goto LABEL_109;
  }
  uint64_t v13 = (const void *)kIDSDefaultPairedDeviceID;
  id v14 = [v10 isInvalidated];
  if ((_DWORD)v14)
  {
    uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "UDPLink invalidated - stop retransmitting local interface address",  buf,  2u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"UDPLink invalidated - stop retransmitting local interface address");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"UDPLink invalidated - stop retransmitting local interface address");
        }
      }
    }

- (void)_createWiFiAssociationPowerAssertion:(double)a3
{
  if (self->_isCentral)
  {
    id v5 = [[CUTPowerAssertion alloc] initWithIdentifier:@"IDSLinkManagerWiFiPowerAssertion" timeout:a3];
    id WiFiPowerAssertion = self->_WiFiPowerAssertion;
    self->_id WiFiPowerAssertion = v5;

    uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_WiFiPowerAssertion;
      *(_DWORD *)buf = 134218240;
      id v13 = v9;
      __int16 v14 = 1024;
      int v15 = (int)a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Created new power assertion %p for WiFi association with timeout %d.",  buf,  0x12u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11 && _IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"Created new power assertion %p for WiFi association with timeout %d.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Created new power assertion %p for WiFi association with timeout %d.");
      }
    }
  }

- (void)_clearWiFiAssociationPowerAssertion
{
  if (self->_isCentral && self->_WiFiPowerAssertion)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("LinkManager");
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WiFiPowerAssertion = self->_WiFiPowerAssertion;
      *(_DWORD *)buf = 134217984;
      id v10 = WiFiPowerAssertion;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Clearing power assertion %p for WiFi association",  buf,  0xCu);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7 && _IDSShouldLogTransport(v7))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"Clearing power assertion %p for WiFi association");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Clearing power assertion %p for WiFi association");
      }
    }

    id v8 = self->_WiFiPowerAssertion;
    self->_id WiFiPowerAssertion = 0LL;
  }

- (void)_handleWiFiAutoJoinStatusChange:(int64_t)a3 WiFiSSID:(id)a4
{
  id v18 = a4;
  self->_int64_t currentWiFiAutoJoinStatus = a3;
  if ((unint64_t)(a3 - 3) <= 1)
  {
    self->_isWiFiAssociated = 1;
    if (self->_isWiFiBroughtUp) {
      -[IDSLinkManager _clearWiFiAssociationPowerAssertion](self, "_clearWiFiAssociationPowerAssertion");
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }

  self->_isWiFiAssociated = 0;
  if ((unint64_t)(a3 - 1) >= 0xA || ((0x213u >> (a3 - 1)) & 1) == 0)
  {
    if (self->_isWiFiBroughtUp) {
      -[IDSLinkManager _clearWiFiAssociationPowerAssertion](self, "_clearWiFiAssociationPowerAssertion");
    }
    WiFiAssociationFailureHandler = (void (**)(void))self->_WiFiAssociationFailureHandler;
    if (WiFiAssociationFailureHandler)
    {
      WiFiAssociationFailureHandler[2]();
      id v8 = self->_WiFiAssociationFailureHandler;
      self->_WiFiAssociationFailureHandler = 0LL;
    }

    goto LABEL_10;
  }

  char v9 = 1;
LABEL_11:
  objc_storeStrong((id *)&self->_currentWiFiSSID, a4);
  if (self->_isCentral)
  {
    if (self->_isWiFiBroughtUp) {
      char v11 = v9;
    }
    else {
      char v11 = 1;
    }
    if ((v11 & 1) == 0 && self->_WiFiAssociationStartTime > 0.0)
    {
      BOOL v12 = !self->_doesDefaultDevicePreferInfraWiFi;
      unint64_t v13 = (unint64_t)(ids_monotonic_time(v10) - self->_WiFiAssociationStartTime);
      int64_t currentWiFiAutoJoinStatus = self->_currentWiFiAutoJoinStatus;
      id v15 = [[IDSWiFiSetupAttemptMetric alloc] initWithAttemptType:v12 msDuration:v13 result:currentWiFiAutoJoinStatus client:@"IDSLinkManager_WiFi"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v16 logMetric:v15];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
      [v17 wifiSetupAttemptType:v12 duration:v13 result:currentWiFiAutoJoinStatus client:@"IDSLinkManager_WiFi"];

      self->_WiFiAssociationStartTime = 0.0;
    }
  }
}

- (BOOL)_startUDPLinkHandshakeForDefaultDevice:(BOOL)a3 immediately:(BOOL)a4
{
  if (self->_requireBT)
  {
    uint64_t v4 = OSLogHandleForTransportCategory("LinkManager");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "LinkManager requires BT, skip WiFi handshake.",  buf,  2u);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7)
    {
      LODWORD(v7) = _IDSShouldLogTransport(v7);
      if ((_DWORD)v7)
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"LinkManager requires BT, skip WiFi handshake.");
        LODWORD(v7) = _IDSShouldLog(0LL, @"LinkManager");
        if ((_DWORD)v7)
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"LinkManager requires BT, skip WiFi handshake.");
LABEL_96:
          LOBYTE(v7) = 0;
          return v7;
        }
      }
    }

    return v7;
  }

  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = @"NO";
    if (v9) {
      __int16 v14 = @"YES";
    }
    else {
      __int16 v14 = @"NO";
    }
    BOOL mayBringUpWiFi = self->_mayBringUpWiFi;
    if (v8) {
      uint64_t v16 = @"YES";
    }
    else {
      uint64_t v16 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    double v71 = v14;
    __int16 v72 = 2112;
    unsigned __int8 v73 = v16;
    if (mayBringUpWiFi) {
      unint64_t v13 = @"YES";
    }
    __int16 v74 = 2112;
    uint64_t v75 = (uint64_t)v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "_startUDPLinkHandshakeForDefaultDevice wantsWiFi %@ immediately %@ mayBringUpWiFi %@",  buf,  0x20u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18 && _IDSShouldLogTransport(v18))
  {
    double v19 = v9 ? @"YES" : @"NO";
    double v20 = v8 ? @"YES" : @"NO";
    double v21 = self->_mayBringUpWiFi ? @"YES" : @"NO";
    uint64_t v61 = v20;
    uint64_t v62 = (uint64_t)v21;
    uint64_t v60 = v19;
    _IDSLogTransport( @"LinkManager",  @"IDS",  @"_startUDPLinkHandshakeForDefaultDevice wantsWiFi %@ immediately %@ mayBringUpWiFi %@");
    if (_IDSShouldLog(0LL, @"LinkManager"))
    {
      if (self->_mayBringUpWiFi) {
        double v22 = @"YES";
      }
      else {
        double v22 = @"NO";
      }
      uint64_t v61 = v20;
      uint64_t v62 = (uint64_t)v22;
      uint64_t v60 = v19;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startUDPLinkHandshakeForDefaultDevice wantsWiFi %@ immediately %@ mayBringUpWiFi %@");
    }
  }

  if (!v9)
  {
LABEL_45:
    int v29 = !v9 || v8;
    if (self->_isCentral) {
      int v30 = v9;
    }
    else {
      int v30 = !v9 || v8;
    }
    if (v9 && self->_isWiFiBroughtUp) {
      int v29 = 1;
    }
    unsigned int v31 = self->_handshakeCounter + 1;
    self->_handshakeCounter = v31;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_10022AF7C;
    v65[3] = &unk_1008FE760;
    v65[4] = self;
    unsigned int v66 = v31;
    BOOL v67 = v9;
    char v68 = v30;
    uint64_t v32 = objc_retainBlock(v65);
    if (v29)
    {
      uint64_t v33 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = @"down";
        if (v9) {
          uint64_t v35 = @"up";
        }
        uint64_t v36 = &stru_100912B50;
        if (!v30) {
          uint64_t v36 = @"don't ";
        }
        *(_DWORD *)buf = 138412546;
        double v71 = v35;
        __int16 v72 = 2112;
        unsigned __int8 v73 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake now",  buf,  0x16u);
      }

      uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
      if ((_DWORD)v38)
      {
        if (_IDSShouldLogTransport(v38))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake now");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake now");
          }
        }
      }

      ((void (*)(void *, void))v32[2])(v32, 0LL);
    }

    else
    {
      uint64_t v39 = OSLogHandleForTransportCategory("LinkManager");
      double v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = @"down";
        if (v9) {
          uint64_t v41 = @"up";
        }
        *(_DWORD *)buf = 138412802;
        double v71 = v41;
        if (v30) {
          uint64_t v42 = &stru_100912B50;
        }
        else {
          uint64_t v42 = @"don't ";
        }
        __int16 v72 = 2112;
        unsigned __int8 v73 = v42;
        __int16 v74 = 2048;
        uint64_t v75 = 0x4024000000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake in %.1f seconds",  buf,  0x20u);
      }

      uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
      if ((_DWORD)v44 && _IDSShouldLogTransport(v44))
      {
        uint64_t v45 = v9 ? @"up" : @"down";
        uint64_t v46 = v30 ? &stru_100912B50 : @"don't ";
        uint64_t v61 = v46;
        uint64_t v62 = 0x4024000000000000LL;
        uint64_t v60 = v45;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake in %.1f seconds");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v61 = v46;
          uint64_t v62 = 0x4024000000000000LL;
          uint64_t v60 = v45;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake in %.1f seconds");
        }
      }

      -[IDSLinkManager _createWiFiAssociationPowerAssertion:]( self,  "_createWiFiAssociationPowerAssertion:",  10.0,  v60,  v61,  v62);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_10022BD60;
      v63[3] = &unk_1008FE788;
      v63[4] = self;
      uint64_t v64 = v32;
      IDSTransportThreadAddBlockAfter(v63, 10.0);
    }

    LOBYTE(v7) = 1;
    return v7;
  }

  if (!self->_isCentral)
  {
    if (!self->_localWiFiAddressUsedForDefaultDevice)
    {
      uint64_t v56 = OSLogHandleForTransportCategory("LinkManager");
      unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "_startUDPLinkHandshakeForDefaultDevice !Central: wantsWiFi is YES but localWiFi has no IP - skip!",  buf,  2u);
      }

      uint64_t v7 = os_log_shim_legacy_logging_enabled(v58);
      if ((_DWORD)v7)
      {
        LODWORD(v7) = _IDSShouldLogTransport(v7);
        if ((_DWORD)v7)
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"_startUDPLinkHandshakeForDefaultDevice !Central: wantsWiFi is YES but localWiFi has no IP - skip!");
          LODWORD(v7) = _IDSShouldLog(0LL, @"LinkManager");
          if ((_DWORD)v7)
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startUDPLinkHandshakeForDefaultDevice !Central: wantsWiFi is YES but localWiFi has no IP - skip!");
            goto LABEL_96;
          }
        }
      }

      return v7;
    }

    goto LABEL_44;
  }

  if (self->_mayBringUpWiFi)
  {
LABEL_44:
    id v26 = objc_msgSend((id)IMWeakLinkClass(@"CUTWiFiManager", @"CommonUtilities"), "sharedInstance");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unsigned __int8 v28 = [v27 isWiFiEnabled];

    if ((v28 & 1) == 0)
    {
      uint64_t v47 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "wantsWiFi = YES but isWiFiEnabled = NO - not enabling WoW/AutoAssociation",  buf,  2u);
      }

      uint64_t v50 = os_log_shim_legacy_logging_enabled(v49);
      if ((_DWORD)v50)
      {
        if (_IDSShouldLogTransport(v50))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"wantsWiFi = YES but isWiFiEnabled = NO - not enabling WoW/AutoAssociation");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"wantsWiFi = YES but isWiFiEnabled = NO - not enabling WoW/AutoAssociation");
          }
        }
      }

      if (self->_doesDefaultDevicePreferInfraWiFi)
      {
        uint64_t v51 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "preferInfraWiFi was requested - reject it",  buf,  2u);
        }

        uint64_t v54 = os_log_shim_legacy_logging_enabled(v53);
        if ((_DWORD)v54)
        {
          if (_IDSShouldLogTransport(v54))
          {
            _IDSLogTransport(@"LinkManager", @"IDS", @"preferInfraWiFi was requested - reject it");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"preferInfraWiFi was requested - reject it");
            }
          }
        }

        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = sub_10022AED4;
        v69[3] = &unk_1008F7948;
        v69[4] = self;
        IDSTransportThreadAddBlock(v69, v55);
      }

      goto LABEL_96;
    }

    goto LABEL_45;
  }

  uint64_t v23 = OSLogHandleForTransportCategory("LinkManager");
  double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "_startUDPLinkHandshakeForDefaultDevice Central: wantsWiFi is YES but mayBringUpWiFi is NO - skip!",  buf,  2u);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v25);
  if ((_DWORD)v7)
  {
    LODWORD(v7) = _IDSShouldLogTransport(v7);
    if ((_DWORD)v7)
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"_startUDPLinkHandshakeForDefaultDevice Central: wantsWiFi is YES but mayBringUpWiFi is NO - skip!");
      LODWORD(v7) = _IDSShouldLog(0LL, @"LinkManager");
      if ((_DWORD)v7)
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_startUDPLinkHandshakeForDefaultDevice Central: wantsWiFi is YES but mayBringUpWiFi is NO - skip!");
        goto LABEL_96;
      }
    }
  }

  return v7;
}

- (void)_processLinkChangeForDefaultDeviceFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSBTLink, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___IDSBTLink, v11);
  char v13 = objc_opt_isKindOfClass(v7, v12);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v14);
  int v16 = objc_opt_isKindOfClass(v7, v15);
  uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v53 = (unint64_t)v6;
    __int16 v54 = 2112;
    unint64_t v55 = (unint64_t)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "process link change for default paired device (oldLink:%@, newLink:%@).",  buf,  0x16u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      id v50 = v6;
      id v51 = v7;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"process link change for default paired device (oldLink:%@, newLink:%@).");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v50 = v6;
        id v51 = v7;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"process link change for default paired device (oldLink:%@, newLink:%@).");
      }
    }
  }

  uint64_t v21 = v13 & 1;
  char v22 = isKindOfClass ^ v13 & 1;
  if ((v22 & 1) != 0) {
    self->_isDefaultDeviceUsingBTLink = v13 & 1;
  }
  if (v7)
  {
    uint64_t v23 = kIDSDefaultPairedDeviceID;
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToCurrentLink, kIDSDefaultPairedDeviceID, v7);
    if (((v21 | v16) & 1) != 0)
    {
      -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  v21,  v16 & 1);
      if ((v22 & 1) == 0) {
        goto LABEL_24;
      }
      int v25 = 0;
      goto LABEL_18;
    }

    if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi) {
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v23 = kIDSDefaultPairedDeviceID;
    if (kIDSDefaultPairedDeviceID)
    {
      deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
      if (deviceIDToCurrentLink) {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
      }
    }
  }

  int v25 = 1;
  BOOL v27 = 1;
  if ((v22 & 1) == 0)
  {
LABEL_23:
    self->_hasDelayedNoConnectivityNotification = v27;
    -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  0LL,  self->_lastSentDefaultDeviceCloudConnectivity,  v50,  v51);
    goto LABEL_24;
  }

- (id)_selectBestLink:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v15;
    unint64_t v9 = 255LL;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v11 state] == (id)4 && (unint64_t)objc_msgSend(v11, "headerOverhead") < v9)
        {
          unint64_t v9 = (unint64_t)[v11 headerOverhead];
          id v12 = v11;

          id v7 = v12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_setBestLinkToCurrent:(id)a3
{
  uint64_t v4 = (NSMutableDictionary *)a3;
  Value = 0LL;
  if (v4 && self->_deviceIDToCurrentLink) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v4);
  }
  id v6 = Value;
  id v7 = 0LL;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    unint64_t v9 = 0LL;
    if (cbuuidToLinks)
    {
      id v7 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      if (v7) {
        unint64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[IDSLinkManager _selectBestLink:](self, "_selectBestLink:", v7));
      }
      else {
        unint64_t v9 = 0LL;
      }
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  uint64_t v10 = OSLogHandleForIDSCategory("LinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = self->_cbuuidToLinks;
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    *(_DWORD *)buf = 138413314;
    uint64_t v42 = v4;
    __int16 v43 = 2112;
    uint64_t v44 = deviceIDToCurrentLink;
    __int16 v45 = 2112;
    uint64_t v46 = v13;
    __int16 v47 = 2112;
    uint64_t v48 = v6;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "_setBestLinkToCurrent cbuuid %@ _deviceIDToCurrentLink %@ _cbuuidToLinks %@ oldlink %@ newlink %@",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    uint64_t v39 = v6;
    uint64_t v40 = v9;
    uint64_t v37 = self->_deviceIDToCurrentLink;
    uint64_t v38 = self->_cbuuidToLinks;
    uint64_t v35 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_setBestLinkToCurrent cbuuid %@ _deviceIDToCurrentLink %@ _cbuuidToLinks %@ oldlink %@ newlink %@");
  }

  if (v9 != v6)
  {
    uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary deviceUniqueID](v9, "deviceUniqueID"));
      *(_DWORD *)buf = 138413058;
      uint64_t v42 = v6;
      __int16 v43 = 2112;
      uint64_t v44 = v9;
      __int16 v45 = 2112;
      uint64_t v46 = v4;
      __int16 v47 = 2112;
      uint64_t v48 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "set current link from %@ to %@ for cbuuid %@ deviceUniqueID %@",  buf,  0x2Au);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        uint64_t v38 = v4;
        uint64_t v39 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary deviceUniqueID](v9, "deviceUniqueID"));
        uint64_t v35 = v6;
        uint64_t v37 = v9;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"set current link from %@ to %@ for cbuuid %@ deviceUniqueID %@");

        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary deviceUniqueID](v9, "deviceUniqueID", v6, v9, v4, v39));
          uint64_t v38 = v4;
          uint64_t v39 = v20;
          uint64_t v35 = v6;
          uint64_t v37 = v9;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"set current link from %@ to %@ for cbuuid %@ deviceUniqueID %@");
        }
      }
    }

    if (-[NSMutableDictionary isEqualToString:]( v4,  "isEqualToString:",  kIDSDefaultPairedDeviceID,  v35,  v37,  v38,  v39,  v40)
      && !self->_hasFixedDestination)
    {
      -[IDSLinkManager _processLinkChangeForDefaultDeviceFrom:to:]( self,  "_processLinkChangeForDefaultDeviceFrom:to:",  v6,  v9);
      goto LABEL_52;
    }

    if (v9)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToCurrentLink, v4, v9);
      if (self->_hasFixedDestination)
      {
        -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  1LL,  0LL);
        goto LABEL_52;
      }

      uint64_t v22 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sending UTunController didConnectForDevice %@",  buf,  0xCu);
      }

      uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
      if ((_DWORD)v25)
      {
        if (_IDSShouldLogTransport(v25))
        {
          uint64_t v36 = v4;
          _IDSLogTransport(@"LinkManager", @"IDS", @"sending UTunController didConnectForDevice %@");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            uint64_t v36 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sending UTunController didConnectForDevice %@");
          }
        }
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary alternateDelegate](v9, "alternateDelegate", v36));
      BOOL v27 = v26;
      if (v26)
      {
        [v26 link:self didConnectForDeviceUniqueID:0 cbuuid:v4];
      }

      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained link:self didConnectForDeviceUniqueID:0 cbuuid:v4];
      }
    }

    else
    {
      if (v4)
      {
        uint64_t v21 = self->_deviceIDToCurrentLink;
        if (v21) {
          CFDictionaryRemoveValue((CFMutableDictionaryRef)v21, v4);
        }
      }

      if (self->_hasFixedDestination)
      {
        -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  0LL,  0LL);
        goto LABEL_52;
      }

      uint64_t v28 = OSLogHandleForTransportCategory("LinkManager");
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "sending UTunController didDisconnectForDevice %@",  buf,  0xCu);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          uint64_t v36 = v4;
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"sending UTunController didDisconnectForDevice %@");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            uint64_t v36 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sending UTunController didDisconnectForDevice %@");
          }
        }
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary alternateDelegate](v6, "alternateDelegate", v36));
      BOOL v27 = v32;
      if (v32)
      {
        [v32 link:self didDisconnectForDeviceUniqueID:0 cbuuid:v4];
      }

      else
      {
        id v34 = objc_loadWeakRetained((id *)&self->_delegate);
        [v34 link:self didDisconnectForDeviceUniqueID:0 cbuuid:v4];
      }
    }
  }

- (id)_newUDPLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 IPVersion:(unint64_t)a5 port:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  uint64_t v11 = (__CFString *)a4;
  id v12 = 0LL;
  char v13 = 1;
  if (v11)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v11);
      id v12 = v15;
      if (v15)
      {
        __int128 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkLocalUDPKey");
        if (v16)
        {
          __int128 v17 = v16;
          goto LABEL_28;
        }

        char v13 = 0;
      }
    }
  }

  uint64_t v18 = -[IDSUDPLink initWithDeviceUniqueID:cbuuid:]( objc_alloc(&OBJC_CLASS___IDSUDPLink),  "initWithDeviceUniqueID:cbuuid:",  v10,  v11);
  -[IDSUDPLink setDelegate:](v18, "setDelegate:", self);
  if ((v13 & 1) != 0)
  {
    id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v18,  @"IDSLinkLocalUDPKey"));
    if (v12)
    {
      uint64_t v19 = self->_cbuuidToLinks;
      uint64_t v20 = v11;
      uint64_t v21 = (IDSUDPLink *)v12;
LABEL_12:
      CFDictionarySetValue((CFMutableDictionaryRef)v19, v20, v21);
    }
  }

  else if (v18)
  {
    uint64_t v20 = @"IDSLinkLocalUDPKey";
    uint64_t v19 = v12;
    uint64_t v21 = v18;
    goto LABEL_12;
  }

  -[IDSUDPLink setPort:](v18, "setPort:", v6);
  -[IDSUDPLink setAllowsLinkLocal:](v18, "setAllowsLinkLocal:", self->_hasFixedDestination);
  id v22 = -[IDSUDPLink newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:]( v18,  "newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:",  a5,  0LL,  1LL,  0LL);
  uint64_t v23 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSUDPLink state](v18, "state");
    else {
      uint64_t v25 = (const char *)_IDSLinkStateStrings[(void)-[IDSUDPLink state](v18, "state")];
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    id v34 = v25;
    __int16 v35 = 2048;
    id v36 = [v22 count];
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "created new UDPLink %@ state %s with %lu interfaces",  buf,  0x20u);
  }

  uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
  if ((_DWORD)v27 && _IDSShouldLogTransport(v27))
  {
    -[IDSUDPLink state](v18, "state");
    uint64_t v28 = (unint64_t)-[IDSUDPLink state](v18, "state") > 6
        ? "UnexpectedState"
        : (char *)_IDSLinkStateStrings[(void)-[IDSUDPLink state](v18, "state")];
    id v30 = [v22 count];
    _IDSLogTransport(@"LinkManager", @"IDS", @"created new UDPLink %@ state %s with %lu interfaces");
    if (_IDSShouldLog(0LL, @"LinkManager"))
    {
      -[IDSUDPLink state](v18, "state", v18, v28, v30);
      [v22 count];
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"created new UDPLink %@ state %s with %lu interfaces");
    }
  }

  __int128 v17 = v18;

LABEL_28:
  return v17;
}

- (id)_newUDPGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = 0LL;
  char v9 = 1;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    if (cbuuidToLinks)
    {
      uint64_t v11 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      uint64_t v8 = v11;
      if (v11)
      {
        id v12 = (id)CFDictionaryGetValue( (CFDictionaryRef)v11,  @"IDSLinkGlobalUDPKey");
        if (v12)
        {
          char v13 = v12;
          goto LABEL_23;
        }

        char v9 = 0;
      }
    }
  }

  char v13 = -[IDSUDPGlobalLink initWithDeviceUniqueID:cbuuid:]( objc_alloc(&OBJC_CLASS___IDSUDPGlobalLink),  "initWithDeviceUniqueID:cbuuid:",  v6,  v7);
  -[IDSUDPGlobalLink setDelegate:](v13, "setDelegate:", self);
  if ((v9 & 1) != 0)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v13,  @"IDSLinkGlobalUDPKey"));
    if (v8)
    {
      uint64_t v14 = self->_cbuuidToLinks;
      uint64_t v15 = v7;
      __int128 v16 = (IDSUDPGlobalLink *)v8;
LABEL_12:
      CFDictionarySetValue((CFMutableDictionaryRef)v14, v15, v16);
    }
  }

  else if (v13)
  {
    uint64_t v15 = @"IDSLinkGlobalUDPKey";
    uint64_t v14 = v8;
    __int128 v16 = v13;
    goto LABEL_12;
  }

  uint64_t v17 = OSLogHandleForIDSCategory("LinkManager");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSUDPGlobalLink state](v13, "state");
    if (-[IDSUDPGlobalLink state](v13, "state") > 6) {
      uint64_t v19 = "UnexpectedState";
    }
    else {
      uint64_t v19 = (const char *)_IDSLinkStateStrings[-[IDSUDPGlobalLink state](v13, "state")];
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v13;
    __int16 v25 = 2080;
    uint64_t v26 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "created new UDPGlobalLink %@ state %s",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    -[IDSUDPGlobalLink state](v13, "state");
    if (-[IDSUDPGlobalLink state](v13, "state") <= 6) {
      -[IDSUDPGlobalLink state](v13, "state");
    }
    _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"created new UDPGlobalLink %@ state %s");
  }

- (id)_newGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_hasFixedDestination)
  {
    id v11 = 0LL;
  }

  else
  {
    Value = 0LL;
    if (v9 && self->_sessionIDToPluginNameToPluginOptionsDict) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToPluginNameToPluginOptionsDict, v9);
    }
    id v13 = Value;
    uint64_t v14 = 0LL;
    if (v9 && self->_sessionIDToSharedSessionHasJoined) {
      uint64_t v14 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToSharedSessionHasJoined, v9);
    }
    id v15 = [v14 BOOLValue];
    __int128 v16 = 0LL;
    if (v9 && self->_sessionIDToCellInterfaceName) {
      __int128 v16 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToCellInterfaceName, v9);
    }
    id v44 = v16;
    uint64_t v17 = 0LL;
    if (v9 && self->_sessionIDToIDSContextBlob) {
      uint64_t v17 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToIDSContextBlob, v9);
    }
    id v45 = v17;
    uint64_t v18 = 0LL;
    LOBYTE(v19) = 1;
    if (v9
      && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
      && (uint64_t v21 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
          (uint64_t v18 = v21) != 0LL)
      && (id v22 = (id)CFDictionaryGetValue( (CFDictionaryRef)v21,  @"IDSLinkGlobalKey"),  (v19 = v22) != 0LL))
    {
      if (self->_timeBase) {
        objc_msgSend(v22, "setTimeBase:");
      }
      if (self->_isReliableUnicastSession) {
        [v19 setIsReliableUnicastSession:1 isClient:self->_isReliableUnicastClient];
      }
      if (v13) {
        [v19 setPluginCache:v13];
      }
      [v19 setSharedSessionHasJoined:v15];
      [v19 setCellInterfaceName:v44];
      [v19 setIDSContextBlob:v45];
      id v11 = v19;
    }

    else
    {
      id v23 = objc_msgSend( objc_alloc((Class)+[IDSGlobalLink getGLClassWithOptions:]( IDSGlobalLink,  "getGLClassWithOptions:",  v10)),  "initWithDeviceUniqueID:cbuuid:",  v8,  v9);
      [v23 setCellInterfaceName:v44];
      [v23 setIDSContextBlob:v45];
      [v23 setSharedSessionHasJoined:v15];
      [v23 setDelegate:self];
      [v23 setIsReliableUnicastSession:self->_isReliableUnicastSession isClient:self->_isReliableUnicastClient];
      if (v13) {
        [v23 setPluginCache:v13];
      }
      CFMutableDictionaryRef Mutable = (__CFDictionary *)[v10 mutableCopy];
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      timeBase = self->_timeBase;
      if (timeBase) {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionTimeBaseKey, timeBase);
      }
      id v26 =  [[IDSGlobalLinkBlocks alloc] initWithBlocks:&stru_1008FE7C8 qraAWDBlock:&stru_1008FE808 qraCONBlock:&stru_1008FE848 qraDISBlock:&stru_1008FE868];
      if (v26)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRABlockKey, v26);
      }

      else
      {
        BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v27) {
          sub_1006A4648(v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }

      [v23 startWithOptions:Mutable];
      if ((v19 & 1) != 0)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v23,  @"IDSLinkGlobalKey"));
        if (v18) {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_cbuuidToLinks, v9, v18);
        }
      }

      else if (v23)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v18, @"IDSLinkGlobalKey", v23);
      }

      uint64_t v35 = OSLogHandleForIDSCategory("LinkManager");
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        [v23 state];
        else {
          uint64_t v37 = (const char *)_IDSLinkStateStrings[(void)[v23 state]];
        }
        *(_DWORD *)buf = 138412802;
        id v47 = v23;
        __int16 v48 = 2112;
        id v49 = v9;
        __int16 v50 = 2080;
        id v51 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "created new GlobalLink %@ for session %@ (=> cbuuid), state %s.",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v38)
        && _IDSShouldLog(0LL, @"LinkManager"))
      {
        [v23 state];
        else {
          uint64_t v39 = (const char *)_IDSLinkStateStrings[(void)[v23 state]];
        }
        id v42 = v9;
        __int16 v43 = v39;
        id v41 = v23;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"created new GlobalLink %@ for session %@ (=> cbuuid), state %s.");
      }

      -[IDSLinkManager _startNetworkInterfaceListener:](self, "_startNetworkInterfaceListener:", 1LL, v41, v42, v43);
      -[IDSLinkManager _startCellularDataStatusListener:](self, "_startCellularDataStatusListener:", 1LL);
      id v11 = v23;
    }
  }

  return v11;
}

- (void)_bringUpWiFi:(BOOL)a3
{
  if (a3)
  {
    if (self->_shouldBringWiFiDown)
    {
      uint64_t v4 = OSLogHandleForTransportCategory("LinkManager");
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "resetting _shouldBringWiFiDown to NO",  buf,  2u);
      }

      uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
      if ((_DWORD)v7)
      {
        if (_IDSShouldLogTransport(v7))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"resetting _shouldBringWiFiDown to NO");
        }
      }

      self->_shouldBringWiFiDown = 0;
    }

    if (!self->_isWiFiBroughtUp)
    {
      uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "enable AutoAssociation and WoW now",  buf,  2u);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        uint64_t v11 = _IDSShouldLogTransport(v11);
        if ((_DWORD)v11)
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"enable AutoAssociation and WoW now");
          uint64_t v11 = _IDSShouldLog(0LL, @"LinkManager");
          if ((_DWORD)v11) {
            uint64_t v11 = _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"enable AutoAssociation and WoW now");
          }
        }
      }

      *(_WORD *)&self->_isWiFiBroughtUp = 1;
      if (self->_isCentral && self->_wifiDevice && !self->_isWiFiAssociated) {
        self->_WiFiAssociationStartTime = ids_monotonic_time(v11);
      }
      uint64_t v13 = im_primary_queue(v11, v12);
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10022DF34;
      block[3] = &unk_1008F6010;
      void block[4] = self;
      dispatch_async(v14, block);
    }
  }

  else if (self->_isWiFiBroughtUp)
  {
    deviceIDToGlobalLinkUp = self->_deviceIDToGlobalLinkUp;
    __int128 v16 = (const void *)kIDSDefaultPairedDeviceID;
    if (deviceIDToGlobalLinkUp) {
      BOOL v17 = kIDSDefaultPairedDeviceID == 0LL;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      Value = 0LL;
    }
    else {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToGlobalLinkUp, kIDSDefaultPairedDeviceID);
    }
    unsigned int v19 = [Value BOOLValue];
    if (self->_isDefaultDeviceOnPhoneCall)
    {
      uint64_t v20 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Deferring disabling AutoAssociation and WoW because we are on a phone call",  buf,  2u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Deferring disabling AutoAssociation and WoW because we are on a phone call");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Deferring disabling AutoAssociation and WoW because we are on a phone call");
          }
        }
      }

      self->_shouldBringWiFiDown = 1;
    }

    else if (v19)
    {
      if (self->_currentDefaultDeviceLinkType == 1)
      {
        uint64_t v24 = OSLogHandleForTransportCategory("LinkManager");
        __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Deferring disabling AutoAssociation and WoW, wait for GlobalLink disconnect.",  buf,  2u);
        }

        uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
        if ((_DWORD)v27)
        {
          if (_IDSShouldLogTransport(v27))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"Deferring disabling AutoAssociation and WoW, wait for GlobalLink disconnect.");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Deferring disabling AutoAssociation and WoW, wait for GlobalLink disconnect.");
            }
          }
        }

        -[IDSLinkManager disconnectGlobalLinkForDevice:isReinitiating:completionHandler:]( self,  "disconnectGlobalLinkForDevice:isReinitiating:completionHandler:",  v16,  0LL,  0LL);
      }

      else
      {
        uint64_t v37 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
          *(_DWORD *)buf = 67109120;
          int v47 = currentDefaultDeviceLinkType;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Deferring disabling AutoAssociation and WoW, current linkType:%d.",  buf,  8u);
        }

        uint64_t v41 = os_log_shim_legacy_logging_enabled(v40);
        if ((_DWORD)v41)
        {
          if (_IDSShouldLogTransport(v41))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"Deferring disabling AutoAssociation and WoW, current linkType:%d.");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Deferring disabling AutoAssociation and WoW, current linkType:%d.");
            }
          }
        }
      }
    }

    else
    {
      uint64_t v28 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Disable AutoAssociation and WoW now",  buf,  2u);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        uint64_t v31 = _IDSShouldLogTransport(v31);
        if ((_DWORD)v31)
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"Disable AutoAssociation and WoW now");
          uint64_t v31 = _IDSShouldLog(0LL, @"LinkManager");
          if ((_DWORD)v31) {
            uint64_t v31 = _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Disable AutoAssociation and WoW now");
          }
        }
      }

      *(_WORD *)&self->_isWiFiBroughtUp = 0;
      if (self->_isCentral)
      {
        uint64_t v33 = 0LL;
        self->_WiFiAssociationStartTime = 0.0;
        cbuuidToLinks = self->_cbuuidToLinks;
        if (cbuuidToLinks)
        {
          uint64_t v35 = 0LL;
          if (v16)
          {
            id v36 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v16);
            uint64_t v33 = v36;
            if (v36)
            {
              uint64_t v35 = (id)CFDictionaryGetValue( (CFDictionaryRef)v36,  @"IDSLinkLocalUDPKey");
              if (v35) {
                [v33 removeObjectForKey:@"IDSLinkLocalUDPKey"];
              }
            }

            else
            {
              uint64_t v35 = 0LL;
            }
          }
        }

        else
        {
          uint64_t v35 = 0LL;
        }
      }

      uint64_t v42 = im_primary_queue(v31, v32);
      __int16 v43 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v42);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10022DFB0;
      v44[3] = &unk_1008F6010;
      v44[4] = self;
      dispatch_async(v43, v44);
    }
  }

- (void)_removeLinkForDeviceID:(id)a3 linkKey:(id)a4 verifyWithLink:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v11 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v13 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      uint64_t v13 = v14;
      uint64_t v11 = 0LL;
      if (v9)
      {
        if (v14)
        {
          uint64_t v11 = (id)CFDictionaryGetValue(v14, v9);
          if (v11)
          {
            if (!v10 || -[__CFString isEqual:](v10, "isEqual:", v11))
            {
              uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
              __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v17 = @"a BT/BTLE link";
                if (v10) {
                  BOOL v17 = v10;
                }
                *(_DWORD *)buf = 138412546;
                uint64_t v21 = v17;
                __int16 v22 = 2112;
                id v23 = v8;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "removing %@ from links for device %@",  buf,  0x16u);
              }

              uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
              if ((_DWORD)v19)
              {
                if (_IDSShouldLogTransport(v19))
                {
                  _IDSLogTransport(@"LinkManager", @"IDS", @"removing %@ from links for device %@");
                  if (_IDSShouldLog(0LL, @"LinkManager")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"removing %@ from links for device %@");
                  }
                }
              }

              if ((objc_opt_respondsToSelector(v11, "invalidate") & 1) != 0) {
                [v11 invalidate];
              }
              CFDictionaryRemoveValue(v13, v9);
              -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v8);
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }
}

- (void)_removeAllLinksForDeviceID:(id)a3
{
  id key = a3;
  if (key && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL)
  {
    id v5 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, key);
    [v5 enumerateKeysAndObjectsUsingBlock:&stru_1008FE8A8];
  }

  else
  {
    [0 enumerateKeysAndObjectsUsingBlock:&stru_1008FE8A8];
    id v5 = 0LL;
    if (!key) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = self->_cbuuidToLinks;
  if (v6) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v6, key);
  }
LABEL_7:
  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:");
}

- (BOOL)_hasGlobalLinkConnectingOrConnected
{
  uint64_t v3 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = cbuuidToLinks;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_hasGlobalLinkConnectingOrConnected: _cbuuidToLinks: %@",  buf,  0xCu);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7)
  {
    if (_IDSShouldLogTransport(v7))
    {
      id v23 = self->_cbuuidToLinks;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"_hasGlobalLinkConnectingOrConnected: _cbuuidToLinks: %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v23 = self->_cbuuidToLinks;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_hasGlobalLinkConnectingOrConnected: _cbuuidToLinks: %@");
      }
    }
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cbuuidToLinks, "allValues", v23));
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(const __CFDictionary **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (v12)
        {
          uint64_t v14 = (id)CFDictionaryGetValue(v12, @"IDSLinkGlobalKey");
          if (v14)
          {
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v13);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
              && (unint64_t)-[NSMutableDictionary state](v14, "state") <= 4)
            {
              uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
              uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v30 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ is still connecting or connected.",  buf,  0xCu);
              }

              uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
              if ((_DWORD)v21)
              {
                if (_IDSShouldLogTransport(v21))
                {
                  _IDSLogTransport(@"LinkManager", @"IDS", @"%@ is still connecting or connected.");
                  if (_IDSShouldLog(0LL, @"LinkManager")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%@ is still connecting or connected.");
                  }
                }
              }

              BOOL v16 = 1;
              goto LABEL_28;
            }
          }
        }

        else
        {
          uint64_t v14 = 0LL;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (void)_startNetworkInterfaceListener:(BOOL)a3
{
  dynamicStore = self->_dynamicStore;
  if (a3)
  {
    if (!dynamicStore)
    {
      context.version = 0LL;
      context.info = self;
      context.retain = (const void *(__cdecl *)(const void *))&_CFRetain;
      context.release = (void (__cdecl *)(const void *))&_CFRelease;
      context.copyDescription = 0LL;
      id v5 = SCDynamicStoreCreate( 0LL,  @"com.apple.idslinkmanager.networkinterfacelistener",  (SCDynamicStoreCallBack)sub_10022E8B8,  &context);
      self->_dynamicStore = v5;
      if (v5)
      {
        uint64_t v6 = SCDynamicStoreSetNotificationKeys(v5, 0LL, (CFArrayRef)&off_1009488C8);
        id v8 = self->_dynamicStore;
        if ((_DWORD)v6)
        {
          uint64_t v9 = im_primary_queue(v6, v7);
          uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
          SCDynamicStoreSetDispatchQueue(v8, v10);

          uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "network interface listener started",  v20,  2u);
          }

          uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
          if ((_DWORD)v14)
          {
            if (_IDSShouldLogTransport(v14))
            {
              _IDSLogTransport(@"LinkManager", @"IDS", @"network interface listener started");
              if (_IDSShouldLog(0LL, @"LinkManager"))
              {
                uint64_t v15 = @"network interface listener started";
LABEL_18:
                _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", v15);
              }
            }
          }
        }

        else
        {
          CFRelease(self->_dynamicStore);
          self->_dynamicStore = 0LL;
        }
      }
    }
  }

  else if (dynamicStore)
  {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0LL);
    CFRelease(self->_dynamicStore);
    self->_dynamicStore = 0LL;
    uint64_t v16 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(context.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "network interface listener stopped",  (uint8_t *)&context,  2u);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"network interface listener stopped");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v15 = @"network interface listener stopped";
          goto LABEL_18;
        }
      }
    }
  }

- (void)_startCellularDataStatusListener:(BOOL)a3
{
  if (a3)
  {
    if (!self->_cellularDataStatusListenerStarted)
    {
      self->_cellularDataStatusListenerStarted = 1;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCellularLinkMonitor sharedInstance](&OBJC_CLASS___IDSCellularLinkMonitor, "sharedInstance"));
      [v4 addCellularLinkDelegate:self];

      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCellularLinkMonitor sharedInstance](&OBJC_CLASS___IDSCellularLinkMonitor, "sharedInstance"));
      [v5 registerCellularDataStatusNotification:1];

      uint64_t v6 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cellular data status listener started",  buf,  2u);
      }

      uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
      if ((_DWORD)v9)
      {
        if (_IDSShouldLogTransport(v9))
        {
          uint64_t v10 = @"cellular data status listener started";
          goto LABEL_14;
        }
      }
    }
  }

  else if (self->_cellularDataStatusListenerStarted)
  {
    self->_cellularDataStatusListenerStarted = 0;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCellularLinkMonitor sharedInstance](&OBJC_CLASS___IDSCellularLinkMonitor, "sharedInstance"));
    [v11 removeCellularLinkDelegate:self];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCellularLinkMonitor sharedInstance](&OBJC_CLASS___IDSCellularLinkMonitor, "sharedInstance"));
    [v12 registerCellularDataStatusNotification:0];

    uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "cellular data status listener stopped",  v17,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        uint64_t v10 = @"cellular data status listener stopped";
LABEL_14:
        _IDSLogTransport(@"LinkManager", @"IDS", v10);
        if ((_IDSShouldLog(0LL, @"LinkManager") & 1) != 0) {
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", v10);
        }
      }
    }
  }

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (a3->var0) {
    int v11 = (*(unsigned __int8 *)a3->var0 >> 5) & 1;
  }
  else {
    int v11 = 0;
  }
  if (self->_isInternalInstall || self->_demoMode)
  {
    if (!self->_reporterTimer) {
      id v12 =  -[IDSLinkManager generateLinkReport:forceReport:]( self,  "generateLinkReport:forceReport:",  0LL,  ids_monotonic_time(v9));
    }
    if (self->_hasFixedDestination)
    {
      int64_t var2 = a3->var2;
      if (!self->_deviceIDToUDPDestinations) {
        goto LABEL_30;
      }
      Value = 0LL;
      uint64_t v15 = kIDSDefaultPairedDeviceID;
      if (self->_deviceIDToCurrentLink && kIDSDefaultPairedDeviceID) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
      }
      id v16 = Value;
      if (v10)
      {
        deviceIDToUDPDestinations = self->_deviceIDToUDPDestinations;
        if (deviceIDToUDPDestinations)
        {
          uint64_t v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)deviceIDToUDPDestinations,  v10);
          if (v18)
          {
            uint64_t v19 = v18;
            unint64_t v20 = (unint64_t)[v16 sendPacketBuffer:a3 destination:v18 toDeviceID:0];
            uint64_t v21 = OSLogHandleForTransportCategory("LinkManager");
            __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              if (v20 > 0xF) {
                id v23 = "UnexpectedSendResult";
              }
              else {
                id v23 = (const char *)_IDSLinkSendResultStrings[v20];
              }
              *(_DWORD *)buf = 138412802;
              int64_t v85 = (int64_t)v16;
              __int16 v86 = 2048;
              *(void *)double v87 = var2;
              *(_WORD *)&v87[8] = 2080;
              *(void *)&v87[10] = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "sending a packet over %@ (%zdB) = %s",  buf,  0x20u);
            }

            uint64_t v54 = os_log_shim_legacy_logging_enabled(v53);
            if ((_DWORD)v54)
            {
              if (_IDSShouldLogTransport(v54))
              {
                _IDSLogTransport(@"LinkManager", @"IDS", @"sending a packet over %@ (%zdB) = %s");
                if (_IDSShouldLog(0LL, @"LinkManager")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sending a packet over %@ (%zdB) = %s");
                }
              }
            }

            goto LABEL_76;
          }
        }
      }

      unsigned __int8 v32 = [v10 isEqualToString:v15];

      if ((v32 & 1) == 0)
      {
LABEL_30:
        id v16 = 0LL;
        if (v10)
        {
          deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
          if (deviceIDToCurrentLink)
          {
            uint64_t v34 = (id)CFDictionaryGetValue( (CFDictionaryRef)deviceIDToCurrentLink,  v10);
            id v16 = v34;
            if (v34)
            {
              if ([v34 state] == (id)4)
              {
                unint64_t v20 = (unint64_t)[v16 sendPacketBuffer:a3 toDeviceUniqueID:v8 cbuuid:v10];
                uint64_t v35 = OSLogHandleForTransportCategory("LinkManager");
                id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  if (v20 > 0xF) {
                    uint64_t v37 = "UnexpectedSendResult";
                  }
                  else {
                    uint64_t v37 = (const char *)_IDSLinkSendResultStrings[v20];
                  }
                  *(_DWORD *)buf = 138412802;
                  int64_t v85 = (int64_t)v16;
                  __int16 v86 = 2048;
                  *(void *)double v87 = var2;
                  *(_WORD *)&v87[8] = 2080;
                  *(void *)&v87[10] = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "sending a packet over %@ (%zdB) = %s",  buf,  0x20u);
                }

                uint64_t v56 = os_log_shim_legacy_logging_enabled(v55);
                if ((_DWORD)v56)
                {
                  if (_IDSShouldLogTransport(v56))
                  {
                    _IDSLogTransport(@"LinkManager", @"IDS", @"sending a packet over %@ (%zdB) = %s");
                    if (_IDSShouldLog(0LL, @"LinkManager")) {
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sending a packet over %@ (%zdB) = %s");
                    }
                  }
                }

- (unint64_t)_sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5 link:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int64_t var2 = a3->var2;
  BOOL var10 = a3->var10;
  id v15 = [v12 sendPacketBuffer:a3 toDeviceUniqueID:v10 cbuuid:v11];
  unint64_t v16 = (unint64_t)v15;
  if (var10 && v15 != 0LL)
  {
    uint64_t v18 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (v16 > 0xF) {
        unint64_t v20 = "UnexpectedSendResult";
      }
      else {
        unint64_t v20 = (const char *)_IDSLinkSendResultStrings[v16];
      }
      *(_DWORD *)buf = 138412802;
      id v26 = v12;
      __int16 v27 = 2048;
      int64_t v28 = var2;
      __int16 v29 = 2080;
      uint64_t v30 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "sending a packet over %@ (%zdB) = %s",  buf,  0x20u);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"sending a packet over %@ (%zdB) = %s");
      }
    }
  }

  if (v16 != 13 && v16)
  {
    uint64_t v23 = 27LL;
  }

  else
  {
    self->_totalBytesSent += var2;
    uint64_t v23 = 24LL;
  }

  ++(&self->super.isa)[v23];

  return v16;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = 0LL;
  unint64_t v13 = 12LL;
  if (!v11)
  {
    id v15 = 0LL;
    goto LABEL_14;
  }

  cbuuidToLinks = self->_cbuuidToLinks;
  id v15 = 0LL;
  if (cbuuidToLinks)
  {
    unint64_t v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v11);
    id v12 = v16;
    if (v16)
    {
      uint64_t v17 = (id)CFDictionaryGetValue((CFDictionaryRef)v16, @"IDSLinkGlobalKey");
      id v15 = v17;
      if (v17)
      {
        if ([v17 state] == (id)4)
        {
          id v18 = v15;
          id v15 = v18;
          if ((int)v7 < 1)
          {
            uint64_t v19 = 0LL;
          }

          else
          {
            uint64_t v19 = 0LL;
            uint64_t v20 = v7;
            uint64_t v21 = a3;
            do
            {
              uint64_t v22 = (uint64_t)*v21++;
              v19 += *(void *)(v22 + 16);
              --v20;
            }

            while (v20);
          }

          unint64_t v13 = (unint64_t)[v18 sendPacketBufferArray:a3 arraySize:v7 toDeviceUniqueID:v10 cbuuid:v11];
          if (v13)
          {
            uint64_t v27 = 27LL;
          }

          else
          {
            self->_totalBytesSent += v19;
            uint64_t v27 = 24LL;
          }

          (&self->super.isa)[v27] = (Class)((char *)(&self->super.isa)[v27] + (int)v7);
          uint64_t v25 = v15;
          goto LABEL_18;
        }

        unint64_t v13 = 6LL;
        goto LABEL_14;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    unint64_t v13 = 12LL;
  }

- (void)flushBuffer:(unint64_t)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!self->_hasFixedDestination)
  {
    id v10 = 0LL;
    if (v8)
    {
      cbuuidToLinks = self->_cbuuidToLinks;
      id v12 = 0LL;
      if (cbuuidToLinks)
      {
        unint64_t v13 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9);
        id v10 = v13;
        if (v13)
        {
          uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v13, @"IDSLinkBTKey");
          id v12 = v14;
          if (v14) {
            [v14 flushBuffer:a3];
          }
        }

        else
        {
          id v12 = 0LL;
        }
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }
}

- (void)startLocalSetup
{
  if (!self->_hasFixedDestination)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "startLocalSetup called", v7, 2u);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6 && _IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"startLocalSetup called");
    }

    -[IDSLinkManager addPairedDevice:](self, "addPairedDevice:", @"LOCAL-SETUP-STARTED");
    -[IDSLinkManager _startNetworkInterfaceListener:](self, "_startNetworkInterfaceListener:", 1LL);
    -[IDSLinkManager _startCellularDataStatusListener:](self, "_startCellularDataStatusListener:", 1LL);
  }

- (void)obliterateConnectionInfo
{
  if (!self->_hasFixedDestination)
  {
    self->_BOOL mayBringUpWiFi = 0;
    -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0LL);
    uint64_t v3 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "obliterateConnectionInfo called", buf, 2u);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6)
    {
      if (_IDSShouldLogTransport(v6))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"obliterateConnectionInfo called");
      }
    }

    -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", kIDSDefaultPairedDeviceID);
    -[IDSLinkManager deletePairedDevice:](self, "deletePairedDevice:", 0LL);
    if (!-[IDSLinkManager _hasGlobalLinkConnectingOrConnected](self, "_hasGlobalLinkConnectingOrConnected"))
    {
      -[IDSLinkManager _startNetworkInterfaceListener:](self, "_startNetworkInterfaceListener:", 0LL);
      -[IDSLinkManager _startCellularDataStatusListener:](self, "_startCellularDataStatusListener:", 0LL);
    }

    localWiFiAddressUsedForDefaultDevice = self->_localWiFiAddressUsedForDefaultDevice;
    if (localWiFiAddressUsedForDefaultDevice)
    {
      self->_localWiFiAddressUsedForDefaultDevice = 0LL;
    }

    if (self->_doesDefaultDevicePreferInfraWiFi)
    {
      self->_BOOL doesDefaultDevicePreferInfraWiFi = 0;
      uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "reset preferInfraWiFi.", buf, 2u);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        if (_IDSShouldLogTransport(v11))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"reset preferInfraWiFi.");
        }
      }
    }

    uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = @"YES";
      if (self->_lastSentDefaultDeviceNearby) {
        id v15 = @"YES";
      }
      else {
        id v15 = @"NO";
      }
      if (self->_lastSentDefaultDeviceConnectivity) {
        unint64_t v16 = @"YES";
      }
      else {
        unint64_t v16 = @"NO";
      }
      BOOL lastSentDefaultPeerConnectivity = self->_lastSentDefaultPeerConnectivity;
      if (self->_lastSentDefaultDeviceCloudConnectivity) {
        id v18 = @"YES";
      }
      else {
        id v18 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if (!lastSentDefaultPeerConnectivity) {
        uint64_t v14 = @"NO";
      }
      id v26 = v15;
      __int16 v27 = 2112;
      int64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      unsigned __int8 v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "reset last sent default peer states (deviceNearby:%@, deviceConnectivity:%@, deviceCloudConnectivity:%@, peerConnectivity:%@).",  buf,  0x2Au);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"reset last sent default peer states (deviceNearby:%@, deviceConnectivity:%@, deviceCloudConnectivity:%@, peerConnectivity:%@).");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"reset last sent default peer states (deviceNearby:%@, deviceConnectivity:%@, deviceCloudConnectivity:%@, peerConnectivity:%@).");
        }
      }
    }

    *(_DWORD *)&self->_lastSentDefaultDeviceNearby = 0;
    if (self->_isDefaultDeviceOnPhoneCall)
    {
      self->_isDefaultDeviceOnPhoneCall = 0;
      uint64_t v21 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "reset phone call state.", buf, 2u);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24 && _IDSShouldLogTransport(v24))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"reset phone call state.");
      }
    }
  }

- (void)addPairedDevice:(id)a3
{
  id v4 = a3;
  if (!self->_hasFixedDestination)
  {
    btLinkManager = self->_btLinkManager;
    if (btLinkManager)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSBTLinkManager pairedDevice](btLinkManager, "pairedDevice"));
      unsigned int v7 = [v6 isEqualToString:v4];

      if (v7)
      {
        uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "addPairedDevice for the same UUID %@ - Ignoring",  buf,  0xCu);
        }

        uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
        if ((_DWORD)v13)
        {
          if (_IDSShouldLogTransport(v13))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"addPairedDevice for the same UUID %@ - Ignoring");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"addPairedDevice for the same UUID %@ - Ignoring");
            }
          }
        }
      }

      else
      {
        uint64_t v16 = im_primary_queue(v8, v9);
        uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100230574;
        block[3] = &unk_1008F6010;
        id v18 = v4;
        id v20 = v18;
        dispatch_async(v17, block);

        -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", kIDSDefaultPairedDeviceID);
        -[IDSBTLinkManager updatePairedDevice:](self->_btLinkManager, "updatePairedDevice:", v18);
      }
    }

    else
    {
      uint64_t v14 = -[IDSBTLinkManager initWithDelegate:pairedDevice:]( objc_alloc(&OBJC_CLASS___IDSBTLinkManager),  "initWithDelegate:pairedDevice:",  self,  v4);
      id v15 = self->_btLinkManager;
      self->_btLinkManager = v14;

      if (self->_shouldStartBTLinkManager) {
        -[IDSBTLinkManager start](self->_btLinkManager, "start");
      }
    }
  }
}

- (void)connectPairedDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_hasFixedDestination)
  {
    if (v4
      && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSBTLinkManager pairedDevice](self->_btLinkManager, "pairedDevice")),
          unsigned int v7 = [v5 isEqualToString:v6],
          v6,
          v7))
    {
      -[IDSBTLinkManager connect](self->_btLinkManager, "connect");
    }

    else
    {
      uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "connectPairedDevice for unknown UUID %@ - Ignoring",  buf,  0xCu);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        if (_IDSShouldLogTransport(v11))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"connectPairedDevice for unknown UUID %@ - Ignoring");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"connectPairedDevice for unknown UUID %@ - Ignoring");
          }
        }
      }
    }
  }
}

- (void)deletePairedDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_hasFixedDestination)
  {
    if (v4
      && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSBTLinkManager pairedDevice](self->_btLinkManager, "pairedDevice")),
          unsigned int v7 = [v5 isEqualToString:v6],
          v6,
          !v7))
    {
      uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "deletePairedDevice for unknown UUID %@ - Ignoring",  buf,  0xCu);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"deletePairedDevice for unknown UUID %@ - Ignoring");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"deletePairedDevice for unknown UUID %@ - Ignoring");
          }
        }
      }
    }

    else
    {
      uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "deletePairedDevice for %@", buf, 0xCu);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        uint64_t v11 = _IDSShouldLogTransport(v11);
        if ((_DWORD)v11)
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"deletePairedDevice for %@");
          uint64_t v11 = _IDSShouldLog(0LL, @"LinkManager");
          if ((_DWORD)v11) {
            uint64_t v11 = _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"deletePairedDevice for %@");
          }
        }
      }

      uint64_t v13 = im_primary_queue(v11, v12);
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100230B5C;
      block[3] = &unk_1008F6010;
      id v22 = v5;
      dispatch_async(v14, block);

      self->_isDefaultDeviceNearby = 0;
      -[IDSLinkManager _nearbyChangedForDefaultDevice](self, "_nearbyChangedForDefaultDevice");
      uint64_t v15 = kIDSDefaultPairedDeviceID;
      -[IDSLinkManager disconnectGlobalLinkForDevice:isReinitiating:completionHandler:]( self,  "disconnectGlobalLinkForDevice:isReinitiating:completionHandler:",  kIDSDefaultPairedDeviceID,  0LL,  0LL);
      -[IDSLinkManager stopGlobalLinkForDevice:](self, "stopGlobalLinkForDevice:", v15);
      -[IDSBTLinkManager obliterateConnectionInfo](self->_btLinkManager, "obliterateConnectionInfo");
      -[IDSBTLinkManager stop](self->_btLinkManager, "stop");
      btLinkManager = self->_btLinkManager;
      self->_btLinkManager = 0LL;

      -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v15);
    }
  }
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  if (self->_hasFixedDestination) {
    return;
  }
  if (self->_requireBT)
  {
    uint64_t v4 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "LinkManager requires BT, ignore preferInfraWiFi request.",  buf,  2u);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7)
    {
      if (_IDSShouldLogTransport(v7))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"LinkManager requires BT, ignore preferInfraWiFi request.");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v8 = @"LinkManager requires BT, ignore preferInfraWiFi request.";
LABEL_17:
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", v8);
        }
      }
    }
  }

  else if (self->_isCentral)
  {
    uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "preferInfraWiFi must not be initiated from this device",  v28,  2u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"preferInfraWiFi must not be initiated from this device");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v8 = @"preferInfraWiFi must not be initiated from this device";
          goto LABEL_17;
        }
      }
    }
  }

  else if (a3)
  {
    if (self->_doesDefaultDevicePreferInfraWiFi) {
      return;
    }
    if (self->_localWiFiAddressUsedForDefaultDevice)
    {
      uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v27 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "switching to preferInfraWiFi mode",  v27,  2u);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if ((_DWORD)v16)
      {
        if (_IDSShouldLogTransport(v16))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"switching to preferInfraWiFi mode");
        }
      }

      self->_BOOL doesDefaultDevicePreferInfraWiFi = 1;
      if (self->_isDefaultDeviceUsingBTLink) {
        -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  0LL,  self->_lastSentDefaultDeviceCloudConnectivity);
      }
      -[IDSLinkManager _startUDPLinkHandshakeForDefaultDevice:immediately:]( self,  "_startUDPLinkHandshakeForDefaultDevice:immediately:",  1LL,  1LL);
    }

    else
    {
      uint64_t v21 = OSLogHandleForTransportCategory("LinkManager");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "preferInfraWiFi requested but no local IP available - ignoring",  v26,  2u);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24)
      {
        if (_IDSShouldLogTransport(v24))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"preferInfraWiFi requested but no local IP available - ignoring");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            uint64_t v8 = @"preferInfraWiFi requested but no local IP available - ignoring";
            goto LABEL_17;
          }
        }
      }
    }
  }

  else if (self->_doesDefaultDevicePreferInfraWiFi)
  {
    uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "switching back to Magnet/InfraWiFi mode",  v25,  2u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"switching back to Magnet/InfraWiFi mode");
      }
    }

    -[IDSLinkManager _suspendBTLink:cbuuid:](self, "_suspendBTLink:cbuuid:", 0LL, kIDSDefaultPairedDeviceID);
  }

- (void)setLinkPreferences:(id)a3
{
}

- (BOOL)isConnectedToDeviceID:(id)a3
{
  BOOL result = 0;
  if (a3)
  {
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      return CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, a3) != 0LL;
    }
  }

  return result;
}

- (void)triggerBTCorruptionRecoveryForCBUUID:(id)a3
{
  uint64_t v4 = 0LL;
  id key = a3;
  if (!key)
  {
    Value = 0LL;
LABEL_8:
    [Value triggerBTCorruptionRecovery];
    goto LABEL_9;
  }

  Value = 0LL;
  if (!self->_cbuuidToLinks) {
    goto LABEL_8;
  }
  Value = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, key);
  uint64_t v4 = (const __CFDictionary *)Value;
  if (!Value) {
    goto LABEL_8;
  }
  uint64_t v6 = (id)CFDictionaryGetValue((CFDictionaryRef)Value, @"IDSLinkBTKey");
  if (!v6)
  {
    Value = (void *)CFDictionaryGetValue(v4, @"IDSLinkBTLEKey");
    goto LABEL_8;
  }

  uint64_t v7 = v6;
  [v6 triggerBTCorruptionRecovery];

LABEL_9:
}

- (void)setRequireBT:(BOOL)a3
{
  if (self->_requireBT != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v3) {
        uint64_t v7 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LinkManager requires BT: %@.", buf, 0xCu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"LinkManager requires BT: %@.");
    }

    self->_requireBT = v3;
  }

- (void)setShouldStartBTLinkManager:(BOOL)a3
{
  if (self->_shouldStartBTLinkManager != a3)
  {
    self->_shouldStartBTLinkManager = a3;
    uint64_t v4 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldStartBTLinkManager) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "LinkManager shouldStartBTLinkManager: %@.",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"LinkManager shouldStartBTLinkManager: %@.");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"LinkManager shouldStartBTLinkManager: %@.");
        }
      }
    }

    btLinkManager = self->_btLinkManager;
    if (self->_shouldStartBTLinkManager)
    {
      if (btLinkManager) {
        -[IDSBTLinkManager start](btLinkManager, "start");
      }
    }

    else if (btLinkManager)
    {
      -[IDSBTLinkManager obliterateConnectionInfo](btLinkManager, "obliterateConnectionInfo");
      -[IDSBTLinkManager stop](self->_btLinkManager, "stop");
    }
  }

- (void)startLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7
    && ([v7 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0
    && !self->_hasFixedDestination)
  {
    deviceIDToCurrentLink = (const __CFDictionary *)self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      deviceIDToCurrentLink = (const __CFDictionary *)CFDictionaryGetValue(deviceIDToCurrentLink, v8);
    }
    uint64_t v10 = deviceIDToCurrentLink;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___IDSBTLELink, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v8;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Already have BTLE link for cbuuid %@ deviceUniqueID %@",  buf,  0x16u);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if ((_DWORD)v16)
      {
        if (_IDSShouldLogTransport(v16))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Already have BTLE link for cbuuid %@ deviceUniqueID %@");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Already have BTLE link for cbuuid %@ deviceUniqueID %@");
          }
        }
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v8;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No connected BTLE link for cbuuid %@ deviceUniqueID %@ -- asking WiProx to connect.",  buf,  0x16u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          id v22 = v8;
          id v23 = v6;
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"No connected BTLE link for cbuuid %@ deviceUniqueID %@ -- asking WiProx to connect.");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            id v22 = v8;
            id v23 = v6;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"No connected BTLE link for cbuuid %@ deviceUniqueID %@ -- asking WiProx to connect.");
          }
        }
      }

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance", v22, v23));
      [v21 connectToPeer:v8];
    }
  }
}

- (void)stopLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 disconnectWP:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9
    && ([v9 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0
    && !self->_hasFixedDestination)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect from cbuuid %@ deviceUniqueID %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        uint64_t v16 = v10;
        id v17 = v8;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"Asked to disconnect from cbuuid %@ deviceUniqueID %@");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v16 = v10;
          id v17 = v8;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Asked to disconnect from cbuuid %@ deviceUniqueID %@");
        }
      }
    }

    -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v10, v16, v17);
    if (v5)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance"));
      [v15 disconnectFromPeer:v10];
    }
  }
}

- (void)startUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "startUDPGlobalLinkForDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    id v8 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"startUDPGlobalLinkForDevice %@");
  }
}

- (void)stopUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stopUDPGlobalLinkForDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    id v15 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"stopUDPGlobalLinkForDevice %@");
  }

  id v8 = 0LL;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v10 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v11 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      id v8 = v11;
      if (v11)
      {
        id v10 = (id)CFDictionaryGetValue(v11, @"IDSLinkGlobalUDPKey");
        if (v10)
        {
          uint64_t v12 = OSLogHandleForIDSCategory("LinkManager");
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Remove UDPGlobalLink for device %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v14)
            && _IDSShouldLog(0LL, @"LinkManager"))
          {
            id v15 = v4;
            _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"Remove UDPGlobalLink for device %@");
          }

          if ((objc_opt_respondsToSelector(v10, "invalidate") & 1) != 0) {
            [v10 invalidate];
          }
          CFDictionaryRemoveValue(v8, @"IDSLinkGlobalUDPKey");
        }
      }

      else
      {
        id v10 = 0LL;
      }
    }
  }

  else
  {
    id v10 = 0LL;
  }

  -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v4, v15);
}

- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "createConnectionDataForDevice - deviceID=%@, localPartyID=%@",  buf,  0x16u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v29 = v8;
      id v30 = v9;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"createConnectionDataForDevice - deviceID=%@, localPartyID=%@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v29 = v8;
        id v30 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"createConnectionDataForDevice - deviceID=%@, localPartyID=%@");
      }
    }
  }

  id v15 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v15 = v17) != 0LL)
    && (id v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalUDPKey")) != 0LL)
  {
    uint64_t v19 = v18;
    if ((objc_opt_respondsToSelector(v18, "createConnectionData:dataReadyHandler:") & 1) != 0) {
      [v19 createConnectionData:v9 dataReadyHandler:v10];
    }
  }

  else
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"No UDPGlobalLink is found",  NSLocalizedDescriptionKey,  v29,  v30));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8006LL,  v20));

    uint64_t v22 = OSLogHandleForTransportCategory("LinkManager");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No UDPGlobalLink is found.", buf, 2u);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      uint64_t v25 = _IDSShouldLogTransport(v25);
      if ((_DWORD)v25)
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"No UDPGlobalLink is found.");
        uint64_t v25 = _IDSShouldLog(0LL, @"LinkManager");
        if ((_DWORD)v25) {
          uint64_t v25 = _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"No UDPGlobalLink is found.");
        }
      }
    }

    if (v10)
    {
      uint64_t v27 = im_primary_queue(v25, v26);
      int64_t v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10023209C;
      block[3] = &unk_1008F6358;
      id v33 = v10;
      id v32 = v21;
      dispatch_async(v28, block);
    }

    uint64_t v19 = 0LL;
  }
}

- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "processRemoteConnectionDataForDevice - %@",  buf,  0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v29 = v8;
      _IDSLogTransport(@"LinkManager", @"IDS", @"processRemoteConnectionDataForDevice - %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v29 = v8;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"processRemoteConnectionDataForDevice - %@");
      }
    }
  }

  id v15 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v15 = v17) != 0LL)
    && (id v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalUDPKey")) != 0LL)
  {
    uint64_t v19 = v18;
    if ((objc_opt_respondsToSelector(v18, "processRemoteConnectionData:completionHandler:") & 1) != 0) {
      [v19 processRemoteConnectionData:v9 completionHandler:v10];
    }
  }

  else
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"No UDPGlobalLink is found",  NSLocalizedDescriptionKey,  v29));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8006LL,  v20));

    uint64_t v22 = OSLogHandleForTransportCategory("LinkManager");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No UDPGlobalLink is found.", buf, 2u);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      uint64_t v25 = _IDSShouldLogTransport(v25);
      if ((_DWORD)v25)
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"No UDPGlobalLink is found.");
        uint64_t v25 = _IDSShouldLog(0LL, @"LinkManager");
        if ((_DWORD)v25) {
          uint64_t v25 = _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"No UDPGlobalLink is found.");
        }
      }
    }

    if (v10)
    {
      uint64_t v27 = im_primary_queue(v25, v26);
      int64_t v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100232424;
      block[3] = &unk_1008F6358;
      id v32 = v10;
      id v31 = v21;
      dispatch_async(v28, block);
    }

    uint64_t v19 = 0LL;
  }
}

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    if (v8) {
      uint64_t v14 = @"YES";
    }
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@",  buf,  0x20u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16)
  {
    if (_IDSShouldLogTransport(v16))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@");
      }
    }
  }

  id v17 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v19 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v20 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v17 = v20;
      if (v20)
      {
        id v21 = (id)CFDictionaryGetValue( (CFDictionaryRef)v20,  @"IDSLinkGlobalUDPKey");
        uint64_t v19 = v21;
        if (v21
          && (objc_opt_respondsToSelector(v21, "startConnectionForDevice:isInitiator:remotePartyID:useStunMICheck:") & 1) != 0)
        {
          [v19 startConnectionForDevice:v10 isInitiator:v8 remotePartyID:v11 useStunMICheck:v6];
        }
      }

      else
      {
        uint64_t v19 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v19 = 0LL;
  }
}

- (void)startBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "startBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      id v12 = v6;
      id v13 = v7;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"startBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v12 = v6;
        id v13 = v7;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"startBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@");
      }
    }
  }

  -[IDSBTLinkManager startDatagramLink](self->_btLinkManager, "startDatagramLink", v12, v13);
}

- (void)stopBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "stopBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      id v12 = v6;
      id v13 = v7;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"stopBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v12 = v6;
        id v13 = v7;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"stopBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@");
      }
    }
  }

  -[IDSBTLinkManager stopDatagramLink](self->_btLinkManager, "stopDatagramLink", v12, v13);
}

- (void)_startAllocateRequestForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_hasFixedDestination)
  {
    unsigned int v6 = [v4 isEqualToString:kIDSDefaultPairedDeviceID];
    if (v6 && self->_currentDefaultDeviceLinkType == 1)
    {
      uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "skip allocate request for %@, BT is connected.",  buf,  0xCu);
      }

      uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
      if ((_DWORD)v10)
      {
        if (_IDSShouldLogTransport(v10))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"skip allocate request for %@, BT is connected.");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip allocate request for %@, BT is connected.");
          }
        }
      }
    }

    else
    {
      id v11 = -[IDSLinkManager _newGlobalLinkForDeviceUniqueID:cbuuid:options:]( self,  "_newGlobalLinkForDeviceUniqueID:cbuuid:options:",  0LL,  v5,  0LL);
      id v12 = [v11 state];
      if ((unint64_t)v12 < 2)
      {
        if (([v11 hasReachableInterface:0] & 1) != 0
          || ([v11 hasReachableInterface:1] & 1) != 0)
        {
          Value = 0LL;
          if (v5 && self->_deviceIDToGlobalLinkUp) {
            Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v5);
          }
          if ([Value BOOLValue])
          {
            uint64_t v20 = OSLogHandleForTransportCategory("LinkManager");
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v39 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "skip allocate request for %@, link is already up.",  buf,  0xCu);
            }

            uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
            if ((_DWORD)v23)
            {
              if (_IDSShouldLogTransport(v23))
              {
                _IDSLogTransport( @"LinkManager",  @"IDS",  @"skip allocate request for %@, link is already up.");
                if (_IDSShouldLog(0LL, @"LinkManager")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip allocate request for %@, link is already up.");
                }
              }
            }
          }

          else
          {
            if (!self->_deviceIDToGlobalLinkUp)
            {
              CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              deviceIDToGlobalLinkUp = self->_deviceIDToGlobalLinkUp;
              self->_deviceIDToGlobalLinkUp = Mutable;
            }

            CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToGlobalLinkUp, v5, &__kCFBooleanTrue);
            if (v6) {
              self->_delayedDefaultDeviceAllocateRequest = 0;
            }
            uint64_t v28 = im_primary_queue(v26, v27);
            id v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v28);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100232E8C;
            block[3] = &unk_1008F5F80;
            id v36 = v5;
            id v37 = self;
            dispatch_block_t v30 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
            dispatch_async(v29, v30);
          }
        }

        else
        {
          uint64_t v31 = OSLogHandleForTransportCategory("LinkManager");
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "skip allocate request for %@, no local interface.",  buf,  0xCu);
          }

          uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
          if ((_DWORD)v34)
          {
            if (_IDSShouldLogTransport(v34))
            {
              _IDSLogTransport( @"LinkManager",  @"IDS",  @"skip allocate request for %@, no local interface.");
              if (_IDSShouldLog(0LL, @"LinkManager")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip allocate request for %@, no local interface.");
              }
            }
          }
        }
      }

      else
      {
        id v13 = v12;
        uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = _IDSLinkStateStrings[(void)v13];
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = v5;
          __int16 v40 = 2080;
          uint64_t v41 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "skip allocate request for %@, link is in state [%s].",  buf,  0x16u);
        }

        uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
        if ((_DWORD)v18)
        {
          if (_IDSShouldLogTransport(v18))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"skip allocate request for %@, link is in state [%s].");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip allocate request for %@, link is in state [%s].");
            }
          }
        }
      }
    }
  }
}

- (void)startGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_hasFixedDestination)
  {
    unsigned int v6 = [v4 isEqualToString:kIDSDefaultPairedDeviceID];
    if (v6 && self->_currentDefaultDeviceLinkType == 1)
    {
      uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "skip starting GlobalLink for %@, BT is connected.",  buf,  0xCu);
      }

      uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
      if ((_DWORD)v10)
      {
        if (_IDSShouldLogTransport(v10))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"skip starting GlobalLink for %@, BT is connected.");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip starting GlobalLink for %@, BT is connected.");
          }
        }
      }
    }

    else
    {
      id v11 = -[IDSLinkManager _newGlobalLinkForDeviceUniqueID:cbuuid:options:]( self,  "_newGlobalLinkForDeviceUniqueID:cbuuid:options:",  0LL,  v5,  0LL);
      id v12 = (char *)[v11 state];
      id v13 = v12;
      if ((unint64_t)v12 < 2)
      {
        uint64_t v19 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = _IDSLinkStateStrings[(void)v13];
          *(_DWORD *)buf = 138412802;
          id v33 = v11;
          __int16 v34 = 2112;
          id v35 = v5;
          __int16 v36 = 2080;
          uint64_t v37 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "start new GlobalLink %@ for %@, link state [%s].",  buf,  0x20u);
        }

        uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
        if ((_DWORD)v23)
        {
          if (_IDSShouldLogTransport(v23))
          {
            dispatch_block_t v30 = v5;
            uint64_t v31 = _IDSLinkStateStrings[(void)v13];
            id v29 = v11;
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"start new GlobalLink %@ for %@, link state [%s].");
            if (_IDSShouldLog(0LL, @"LinkManager"))
            {
              dispatch_block_t v30 = v5;
              uint64_t v31 = _IDSLinkStateStrings[(void)v13];
              id v29 = v11;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"start new GlobalLink %@ for %@, link state [%s].");
            }
          }
        }

        if (v6)
        {
          -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 1LL);
          self->_delayedDefaultDeviceAllocateRequest = 1;
          -[IDSLinkManager _startCellularDataStatusListener:](self, "_startCellularDataStatusListener:", 1LL);
        }

        -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v5, v29, v30, v31);
      }

      else if ((unint64_t)(v12 - 7) > 0xFFFFFFFFFFFFFFFDLL)
      {
        if (v6 && !self->_delayedDefaultDeviceAllocateRequest)
        {
          self->_delayedDefaultDeviceAllocateRequest = 1;
          uint64_t v24 = OSLogHandleForTransportCategory("LinkManager");
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = (void *)_IDSLinkStateStrings[(void)v13];
            *(_DWORD *)buf = 138412546;
            id v33 = v5;
            __int16 v34 = 2080;
            id v35 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "delayed allcoate request for %@, link state is [%s].",  buf,  0x16u);
          }

          uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
          if ((_DWORD)v28)
          {
            if (_IDSShouldLogTransport(v28))
            {
              _IDSLogTransport( @"LinkManager",  @"IDS",  @"delayed allcoate request for %@, link state is [%s].");
              if (_IDSShouldLog(0LL, @"LinkManager")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"delayed allcoate request for %@, link state is [%s].");
              }
            }
          }
        }
      }

      else
      {
        uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = (void *)_IDSLinkStateStrings[(void)v13];
          *(_DWORD *)buf = 138412546;
          id v33 = v5;
          __int16 v34 = 2080;
          id v35 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "skip starting GlobalLink for %@, link state is [%s].",  buf,  0x16u);
        }

        uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
        if ((_DWORD)v18)
        {
          if (_IDSShouldLogTransport(v18))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"skip starting GlobalLink for %@, link state is [%s].");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"skip starting GlobalLink for %@, link state is [%s].");
            }
          }
        }
      }
    }
  }
}

- (void)stopGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "stopGlobalLinkForDevice %@ (=> cbuuid)",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v27 = v4;
      _IDSLogTransport(@"LinkManager", @"IDS", @"stopGlobalLinkForDevice %@ (=> cbuuid)");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v27 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"stopGlobalLinkForDevice %@ (=> cbuuid)");
      }
    }
  }

  uint64_t v9 = 0LL;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0LL;
    if (cbuuidToLinks)
    {
      id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      uint64_t v9 = v12;
      if (v12)
      {
        id v11 = (id)CFDictionaryGetValue(v12, @"IDSLinkGlobalKey");
        if (v11)
        {
          uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v11;
            __int16 v32 = 2112;
            id v33 = v4;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove %@ for session %@", buf, 0x16u);
          }

          uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
          if ((_DWORD)v16)
          {
            if (_IDSShouldLogTransport(v16))
            {
              id v27 = v11;
              id v29 = v4;
              _IDSLogTransport(@"LinkManager", @"IDS", @"Remove %@ for session %@");
              if (_IDSShouldLog(0LL, @"LinkManager"))
              {
                id v27 = v11;
                id v29 = v4;
                _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"Remove %@ for session %@");
              }
            }
          }

          objc_msgSend(v11, "invalidate", v27, v29);
          CFDictionaryRemoveValue(v9, @"IDSLinkGlobalKey");
        }
      }

      else
      {
        id v11 = 0LL;
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  if (!self->_btLinkManager
    && !-[IDSLinkManager _hasGlobalLinkConnectingOrConnected](self, "_hasGlobalLinkConnectingOrConnected"))
  {
    -[IDSLinkManager _startNetworkInterfaceListener:](self, "_startNetworkInterfaceListener:", 0LL);
    -[IDSLinkManager _startCellularDataStatusListener:](self, "_startCellularDataStatusListener:", 0LL);
  }

  Value = 0LL;
  if (v4 && self->_deviceIDToGlobalLinkUp) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v4);
  }
  if ([v4 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    self->_delayedDefaultDeviceAllocateRequest = 0;
    uint64_t v18 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "IDSGlobalLink is brought down for %@.",  buf,  0xCu);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        unint64_t v28 = (unint64_t)v4;
        _IDSLogTransport(@"LinkManager", @"IDS", @"IDSGlobalLink is brought down for %@.");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          unint64_t v28 = (unint64_t)v4;
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"IDSGlobalLink is brought down for %@.");
        }
      }
    }

    if (self->_currentDefaultDeviceLinkType != 2)
    {
      uint64_t v22 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = currentDefaultDeviceLinkType;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Bring down WiFi (currentLinkType:%d).",  buf,  8u);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          unint64_t v28 = self->_currentDefaultDeviceLinkType;
          _IDSLogTransport(@"LinkManager", @"IDS", @"Bring down WiFi (currentLinkType:%d).");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            unint64_t v28 = self->_currentDefaultDeviceLinkType;
            _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"Bring down WiFi (currentLinkType:%d).");
          }
        }
      }

      -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0LL, v28);
    }
  }

  else
  {
    -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v4);
  }
}

- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v10 = (__CFString *)a3;
  id v11 = (const __CFDictionary *)a4;
  id v12 = a5;
  if (!self->_hasFixedDestination)
  {
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", kIDSDefaultPairedDeviceID)
      && self->_currentDefaultDeviceLinkType == 1)
    {
      uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Magent is connected, skip connecting GlobalLink for %@.",  buf,  0xCu);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if ((_DWORD)v16)
      {
        if (_IDSShouldLogTransport(v16))
        {
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Magent is connected, skip connecting GlobalLink for %@.");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Magent is connected, skip connecting GlobalLink for %@.");
          }
        }
      }
    }

    else
    {
      Value = 0LL;
      if (v11 && kIDSQRAllocateKey_RequestID) {
        Value = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_RequestID);
      }
      uint64_t v18 = Value;
      -[IDSLinkManager _removeAllocateRequestForDevice:requestID:]( self,  "_removeAllocateRequestForDevice:requestID:",  v10,  v18);
      uint64_t v19 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v58 = v18;
        __int16 v59 = 2112;
        id v60 = v10;
        __int16 v61 = 2112;
        char v62 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Receive allocate response for request %@, device %@. connectGlobalLinkForDevice with sessionInfo %@.",  buf,  0x20u);
      }

      uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
      if ((_DWORD)v22)
      {
        if (_IDSShouldLogTransport(v22))
        {
          __int16 v50 = v10;
          uint64_t v52 = v11;
          __int16 v48 = v18;
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"Receive allocate response for request %@, device %@. connectGlobalLinkForDevice with sessionInfo %@.");
          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            __int16 v50 = v10;
            uint64_t v52 = v11;
            __int16 v48 = v18;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Receive allocate response for request %@, device %@. connectGlobalLinkForDevice with sessionInfo %@.");
          }
        }
      }

      uint64_t v23 = OSLogHandleForTransportCategory("LinkManager");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_StreamInfoSubscribedStreams));
        *(_DWORD *)buf = 138412290;
        id v58 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "connectGlobalLinkForDevice: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@",  buf,  0xCu);
      }

      uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
      if ((_DWORD)v27)
      {
        if (_IDSShouldLogTransport(v27))
        {
          uint64_t v28 = kIDSQRAllocateKey_StreamInfoSubscribedStreams;
          __int16 v48 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_StreamInfoSubscribedStreams));
          _IDSLogTransport( @"LinkManager",  @"IDS",  @"connectGlobalLinkForDevice: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@");

          if (_IDSShouldLog(0LL, @"LinkManager"))
          {
            __int16 v48 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v28, v48));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"connectGlobalLinkForDevice: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@");
          }
        }
      }

      id v29 = -[IDSLinkManager _newGlobalLinkForDeviceUniqueID:cbuuid:options:]( self,  "_newGlobalLinkForDeviceUniqueID:cbuuid:options:",  0LL,  v10,  v11,  v48,  v50,  v52);
      if (kIDSQRAllocateKey_AlternateDelegate) {
        BOOL v30 = v11 != 0LL;
      }
      else {
        BOOL v30 = 0;
      }
      if (v30) {
        id v31 = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_AlternateDelegate);
      }
      else {
        id v31 = 0LL;
      }
      __int16 v32 = v31;
      uint64_t v33 = OSLogHandleForIDSCategory("LinkManager");
      __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v58 = v32;
        __int16 v59 = 2112;
        id v60 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Set alternateDelegate %@ for %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v35)
        && _IDSShouldLog(0LL, @"LinkManager"))
      {
        id v49 = v32;
        id v51 = v10;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"Set alternateDelegate %@ for %@");
      }

      objc_msgSend(v29, "setAlternateDelegate:", v32, v49, v51);
      if (kIDSQRAllocateKey_ClientUniquePID) {
        BOOL v36 = v11 != 0LL;
      }
      else {
        BOOL v36 = 0;
      }
      if (v36) {
        uint64_t v37 = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_ClientUniquePID);
      }
      else {
        uint64_t v37 = 0LL;
      }
      id v38 = v37;
      objc_msgSend(v29, "setClientUniquePID:", objc_msgSend(v38, "unsignedLongLongValue"));
      if (v29)
      {
        [v29 connectWithSessionInfo:v11 interfaceAddress:0 joinSession:1 completionHandler:v12 withLocalInterfacePreference:v6];
      }

      else
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"No GlobalLink is found.",  NSLocalizedDescriptionKey));
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GlobalLink",  8006LL,  v39));

        uint64_t v40 = OSLogHandleForTransportCategory("LinkManager");
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = @"No GlobalLink is found.";
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
        if ((_DWORD)v43)
        {
          uint64_t v43 = _IDSShouldLogTransport(v43);
          if ((_DWORD)v43)
          {
            _IDSLogTransport(@"LinkManager", @"IDS", @"%@");
            uint64_t v43 = _IDSShouldLog(0LL, @"LinkManager");
            if ((_DWORD)v43) {
              uint64_t v43 = _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%@");
            }
          }
        }

        if (v12)
        {
          uint64_t v45 = im_primary_queue(v43, v44);
          uint64_t v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v45);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1002343AC;
          block[3] = &unk_1008F6358;
          id v56 = v12;
          id v55 = v53;
          dispatch_block_t v47 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
          dispatch_async(v46, v47);
        }
      }
    }
  }
}

- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  cbuuidToLinks = (NSMutableDictionary *)a5;
  id v11 = cbuuidToLinks;
  id v12 = 0LL;
  if (!v8)
  {
    uint64_t v13 = 0LL;
    goto LABEL_14;
  }

  cbuuidToLinks = self->_cbuuidToLinks;
  uint64_t v13 = 0LL;
  if (!cbuuidToLinks) {
    goto LABEL_14;
  }
  cbuuidToLinks = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
  id v12 = cbuuidToLinks;
  if (!cbuuidToLinks)
  {
    uint64_t v13 = 0LL;
    if (!v11) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  cbuuidToLinks = (id)CFDictionaryGetValue( (CFDictionaryRef)cbuuidToLinks,  @"IDSLinkGlobalKey");
  uint64_t v13 = cbuuidToLinks;
  if (!cbuuidToLinks) {
    goto LABEL_14;
  }
  uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "disconnectGlobalLinkForDevice for  %@",  buf,  0xCu);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      id v21 = v8;
      _IDSLogTransport(@"LinkManager", @"IDS", @"disconnectGlobalLinkForDevice for  %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v21 = v8;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"disconnectGlobalLinkForDevice for  %@");
      }
    }
  }

  cbuuidToLinks = (NSMutableDictionary *)-[NSMutableDictionary state](v13, "state", v21);
  if ((unint64_t)cbuuidToLinks > 4)
  {
LABEL_14:
    if (!v11) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v18 = im_primary_queue(cbuuidToLinks, v10);
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100234624;
    block[3] = &unk_1008F6330;
    uint64_t v23 = v11;
    dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v19, v20);

    goto LABEL_16;
  }

  -[NSMutableDictionary disconnectWithCompletionHandler:isReinitiating:]( v13,  "disconnectWithCompletionHandler:isReinitiating:",  v11,  v6);
LABEL_16:
}

- (void)_addAllocateRequestForDevice:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || (deviceIDToAllocRequests = self->_deviceIDToAllocRequests) == 0LL
    || (uint64_t v9 = (id)CFDictionaryGetValue((CFDictionaryRef)deviceIDToAllocRequests, v6)) == 0LL)
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  if (v7 && v9) {
    CFArrayAppendValue((CFMutableArrayRef)v9, v7);
  }
  if (!self->_deviceIDToAllocRequests)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v11 = self->_deviceIDToAllocRequests;
    self->_deviceIDToAllocRequests = Mutable;
  }

  id v12 = v9;
  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToAllocRequests, v6, v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A46D4();
  }

  uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "allocate request %@ is pending for %@",  buf,  0x16u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16)
  {
    if (_IDSShouldLogTransport(v16))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"allocate request %@ is pending for %@");
    }
  }
}

- (void)_removeAllocateRequestForDevice:(id)a3 requestID:(id)a4
{
  id v6 = a4;
  Value = 0LL;
  id v8 = v6;
  if (a3 && self->_deviceIDToAllocRequests)
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToAllocRequests, a3);
    id v6 = v8;
  }

  [Value removeObject:v6];
}

- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 1024;
    int v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "handleAllocateRequestFailureForDevice - deviceID %@, requestID %@, erroCode %d",  buf,  0x1Cu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      id v16 = v9;
      uint64_t v17 = v5;
      id v15 = v8;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"handleAllocateRequestFailureForDevice - deviceID %@, requestID %@, erroCode %d");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v16 = v9;
        uint64_t v17 = v5;
        id v15 = v8;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"handleAllocateRequestFailureForDevice - deviceID %@, requestID %@, erroCode %d");
      }
    }
  }

  -[IDSLinkManager _removeAllocateRequestForDevice:requestID:]( self,  "_removeAllocateRequestForDevice:requestID:",  v8,  v9,  v15,  v16,  v17);
  Value = 0LL;
  if (v8 && self->_deviceIDToGlobalLinkUp) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v8);
  }
}

- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setAcceptedRelaySession - sessionID %@, relaySessionID %@.",  buf,  0x16u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"setAcceptedRelaySession - sessionID %@, relaySessionID %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setAcceptedRelaySession - sessionID %@, relaySessionID %@.");
      }
    }
  }

  id v15 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v17 = 0LL;
    if (cbuuidToLinks)
    {
      id v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v15 = v18;
      if (v18)
      {
        id v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey");
        uint64_t v17 = v19;
        if (v19) {
          [v19 setAcceptedRelaySession:v9 options:v10];
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    *(_DWORD *)buf = 136315650;
    id v18 = "-[IDSLinkManager setHasPendingAllocation:forIDSSession:]";
    __int16 v19 = 2112;
    id v20 = v6;
    if (v4) {
      id v9 = @"YES";
    }
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, hasPendingAllocation %@.",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, hasPendingAllocation %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, hasPendingAllocation %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        id v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setHasPendingAllocation:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setTimeBase:(id)a3 forIDSSession:(id)a4
{
  id v6 = (NSDate *)a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[IDSLinkManager setTimeBase:forIDSSession:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, timeBase %@.", buf, 0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, timeBase %@.");
    }
  }

  timeBase = self->_timeBase;
  self->_timeBase = v6;
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[IDSLinkManager setIsReliableUnicastSession:isClient:forIDSSession:]";
    __int16 v16 = 2112;
    id v17 = v8;
    if (v6) {
      uint64_t v11 = @"YES";
    }
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, isReliableUnicastSession %@.",  buf,  0x20u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, isReliableUnicastSession %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, isReliableUnicastSession %@.");
      }
    }
  }

  self->_isReliableUnicastSession = v6;
  self->_isReliableUnicastClient = a4;
}

- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[IDSLinkManager setAllowP2PforIDSSession:isEnabled:]";
    __int16 v19 = 2112;
    id v20 = v6;
    if (v4) {
      uint64_t v9 = @"YES";
    }
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, setAllowP2PforIDSSession: %@",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, setAllowP2PforIDSSession: %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, setAllowP2PforIDSSession: %@");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setAllowP2P:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[IDSLinkManager setForceTCPFallbackOnWiFi:forceTCPFallbackOnWiFi:]";
    __int16 v19 = 2112;
    id v20 = v6;
    if (v4) {
      uint64_t v9 = @"YES";
    }
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, setForceTCPFallbackOnWiFi: %@",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, setForceTCPFallbackOnWiFi: %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, setForceTCPFallbackOnWiFi: %@");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setForceTCPFallbackOnWiFi:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[IDSLinkManager setForceTCPFallbackOnCell:forceTCPFallbackOnCell:]";
    __int16 v19 = 2112;
    id v20 = v6;
    if (v4) {
      uint64_t v9 = @"YES";
    }
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, setForceTCPFallbackOnCell: %@",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, setForceTCPFallbackOnCell: %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, setForceTCPFallbackOnCell: %@");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setForceTCPFallbackOnCell:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    *(_DWORD *)buf = 136315650;
    id v25 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
    __int16 v26 = 2112;
    id v27 = v6;
    if (v4) {
      uint64_t v9 = @"YES";
    }
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, sharedSessionHasJoined %@.",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11 && _IDSShouldLogTransport(v11))
  {
    uint64_t v12 = v4 ? @"YES" : @"NO";
    id v22 = v6;
    id v23 = v12;
    __int16 v21 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
    _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, sharedSessionHasJoined %@.");
    if (_IDSShouldLog(0LL, @"LinkManager"))
    {
      id v22 = v6;
      id v23 = v12;
      __int16 v21 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, sharedSessionHasJoined %@.");
    }
  }

  if (!self->_sessionIDToSharedSessionHasJoined)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
    self->_sessionIDToSharedSessionHasJoined = Mutable;
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4, v21, v22, v23));
  if (v15)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToSharedSessionHasJoined, v6, v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4748();
  }

  __int16 v16 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v18 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v19 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      __int16 v16 = v19;
      if (v19)
      {
        id v20 = (id)CFDictionaryGetValue( (CFDictionaryRef)v19,  @"IDSLinkGlobalKey");
        __int16 v18 = v20;
        if (v20) {
          [v20 setSharedSessionHasJoined:v4];
        }
      }

      else
      {
        __int16 v18 = 0LL;
      }
    }
  }

  else
  {
    __int16 v18 = 0LL;
  }
}

- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      uint64_t v12 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
      id v13 = v4;
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        uint64_t v12 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
        id v13 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%s - sessionID %@");
      }
    }
  }

  sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
  if (!sessionIDToSharedSessionHasJoined)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v11 = self->_sessionIDToSharedSessionHasJoined;
    self->_sessionIDToSharedSessionHasJoined = Mutable;

    sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( sessionIDToSharedSessionHasJoined,  "setObject:forKeyedSubscript:",  0LL,  v4,  v12,  v13);
}

- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[IDSLinkManager setCellInterfaceName:forIDSSession:]";
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, setCellInterfaceName %@.",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, setCellInterfaceName %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"%s - sessionID %@, setCellInterfaceName %@.");
      }
    }
  }

  if (!self->_sessionIDToCellInterfaceName)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
    self->_sessionIDToCellInterfaceName = Mutable;
  }

  id v14 = v6;
  if (v14)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToCellInterfaceName, v7, v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A47BC();
  }

  __int16 v15 = 0LL;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v17 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      __int16 v15 = v18;
      if (v18)
      {
        __int16 v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey");
        id v17 = v19;
        if (v19) {
          [v19 setCellInterfaceName:v14];
        }
      }

      else
      {
        id v17 = 0LL;
      }
    }
  }

  else
  {
    id v17 = 0LL;
  }
}

- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[IDSLinkManager setIDSContextBlob:forIDSSession:]";
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s - sessionID %@, setIDSContextBlob %@.",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@, setIDSContextBlob %@.");
    }
  }

  if (!self->_sessionIDToIDSContextBlob)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
    self->_sessionIDToIDSContextBlob = Mutable;
  }

  id v14 = v6;
  if (v14)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToIDSContextBlob, v7, v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4830();
  }

  __int16 v15 = 0LL;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v17 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      __int16 v15 = v18;
      if (v18)
      {
        __int16 v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey");
        id v17 = v19;
        if (v19) {
          [v19 setIDSContextBlob:v14];
        }
      }

      else
      {
        id v17 = 0LL;
      }
    }
  }

  else
  {
    id v17 = 0LL;
  }
}

- (void)clearCellInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[IDSLinkManager clearCellInterfaceName:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      uint64_t v12 = "-[IDSLinkManager clearCellInterfaceName:]";
      id v13 = v4;
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        uint64_t v12 = "-[IDSLinkManager clearCellInterfaceName:]";
        id v13 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%s - sessionID %@");
      }
    }
  }

  sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
  if (!sessionIDToCellInterfaceName)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v11 = self->_sessionIDToCellInterfaceName;
    self->_sessionIDToCellInterfaceName = Mutable;

    sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( sessionIDToCellInterfaceName,  "setObject:forKeyedSubscript:",  0LL,  v4,  v12,  v13);
}

- (void)clearIDSContextBlob:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[IDSLinkManager clearIDSContextBlob:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      uint64_t v12 = "-[IDSLinkManager clearIDSContextBlob:]";
      id v13 = v4;
      _IDSLogTransport(@"LinkManager", @"IDS", @"%s - sessionID %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        uint64_t v12 = "-[IDSLinkManager clearIDSContextBlob:]";
        id v13 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%s - sessionID %@");
      }
    }
  }

  sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
  if (!sessionIDToIDSContextBlob)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v11 = self->_sessionIDToIDSContextBlob;
    self->_sessionIDToIDSContextBlob = Mutable;

    sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( sessionIDToIDSContextBlob,  "setObject:forKeyedSubscript:",  0LL,  v4,  v12,  v13);
}

- (void)sendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 1024;
    LODWORD(v30) = [v9 length];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "sendSKEData - sessionID %@, skeData %d Bytes.",  buf,  0x12u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v25 = v8;
      id v26 = [v9 length];
      _IDSLogTransport(@"LinkManager", @"IDS", @"sendSKEData - sessionID %@, skeData %d Bytes.");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v15 = objc_msgSend(v9, "length", v8, v26);
        id v25 = v8;
        id v26 = v15;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendSKEData - sessionID %@, skeData %d Bytes.");
      }
    }
  }

  __int16 v16 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (__int16 v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (__int16 v16 = v18) != 0LL)
    && (__int16 v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey")) != 0LL)
  {
    id v20 = v19;
    [v19 sendSKEData:v9];
  }

  else
  {
    uint64_t v21 = OSLogHandleForIDSCategory("LinkManager");
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      BOOL v30 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "sendSKEData - sessionID %@, there is no link for sendSKEData (links:%@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v23) && _IDSShouldLog(0LL, @"LinkManager"))
    {
      id v25 = v8;
      id v26 = v16;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendSKEData - sessionID %@, there is no link for sendSKEData (links:%@)");
    }

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"there is no link for sendSKEData",  NSLocalizedDescriptionKey,  v25,  v26));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"LinkManager",  8006LL,  v24));

    if (v10) {
      v10[2](v10, v20);
    }
  }
}

- (void)sendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, uint64_t))a7;
  uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialMessage - sessionID %@, groupID %@",  buf,  0x16u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"sendKeyMaterialMessage - sessionID %@, groupID %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendKeyMaterialMessage - sessionID %@, groupID %@");
      }
    }
  }

  uint64_t v21 = 0LL;
  if (v12
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (uint64_t v23 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v12),
        (uint64_t v21 = v23) != 0LL)
    && (__int16 v24 = (id)CFDictionaryGetValue( (CFDictionaryRef)v23,  @"IDSLinkGlobalKey")) != 0LL)
  {
    id v25 = v24;
    [v24 sendKeyMaterialMessageData:v14 relayGroupID:v13 destinationURIs:v15 completionHandler:v16];
  }

  else
  {
    uint64_t v26 = OSLogHandleForIDSCategory("LinkManager");
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialMessage - sessionID %@, there is no link (links:%@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v28) && _IDSShouldLog(0LL, @"LinkManager")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendKeyMaterialMessage - sessionID %@, there is no link (links:%@)");
    }
    if (v16) {
      v16[2](v16, 33LL);
    }
  }
}

- (void)setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setDesiredMaterialsForSession - sessionID %@",  buf,  0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"setDesiredMaterialsForSession - sessionID %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setDesiredMaterialsForSession - sessionID %@");
      }
    }
  }

  id v15 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (uint64_t v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v15 = v17) != 0LL)
    && (__int16 v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalKey")) != 0LL)
  {
    uint64_t v19 = v18;
    [v18 setServerDesiredMaterialsForSession:v8 materials:v9 signer:v10];
  }

  else
  {
    uint64_t v20 = OSLogHandleForIDSCategory("LinkManager");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"LinkManager")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)");
    }
  }
}

- (void)requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "requestMaterialsForParticipantIDs - sessionID %@",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"requestMaterialsForParticipantIDs - sessionID %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"requestMaterialsForParticipantIDs - sessionID %@");
      }
    }
  }

  uint64_t v14 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (__int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (uint64_t v14 = v16) != 0LL)
    && (uint64_t v17 = (id)CFDictionaryGetValue( (CFDictionaryRef)v16,  @"IDSLinkGlobalKey")) != 0LL)
  {
    __int16 v18 = v17;
    [v17 requestMaterialsForSession:v8 participantIDs:v9 materialType:v5];
  }

  else
  {
    uint64_t v19 = OSLogHandleForIDSCategory("LinkManager");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      __int16 v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v21) && _IDSShouldLog(0LL, @"LinkManager")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)");
    }
  }
}

- (void)setDefaultUnderlyingLink:(id)a3 linkID:(char)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setDefaultUnderlyingLink - sessionID %@, linkID:%d.",  buf,  0x12u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"setDefaultUnderlyingLink - sessionID %@, linkID:%d.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setDefaultUnderlyingLink - sessionID %@, linkID:%d.");
      }
    }
  }

  uint64_t v11 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v13 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v11 = v14;
      if (v14)
      {
        id v15 = (id)CFDictionaryGetValue( (CFDictionaryRef)v14,  @"IDSLinkGlobalKey");
        uint64_t v13 = v15;
        if (v15) {
          [v15 setDefaultUnderlyingLink:v4];
        }
      }

      else
      {
        uint64_t v13 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }
}

- (void)setPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v22 = v10;
    if (v6) {
      uint64_t v13 = @"YES";
    }
    __int16 v23 = 1024;
    int v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setPacketNotificationFilter - sessionID %@, linkID:%d, enable:%@.",  buf,  0x1Cu);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15)
  {
    if (_IDSShouldLogTransport(v15))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"setPacketNotificationFilter - sessionID %@, linkID:%d, enable:%@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setPacketNotificationFilter - sessionID %@, linkID:%d, enable:%@.");
      }
    }
  }

  __int16 v16 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v18 = 0LL;
    if (cbuuidToLinks)
    {
      int v19 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      __int16 v16 = v19;
      if (v19)
      {
        uint64_t v20 = (id)CFDictionaryGetValue( (CFDictionaryRef)v19,  @"IDSLinkGlobalKey");
        __int16 v18 = v20;
        if (v20) {
          [v20 setPacketNotificationFilter:v8 uniqueTag:v7 isEnabled:v6];
        }
      }

      else
      {
        __int16 v18 = 0LL;
      }
    }
  }

  else
  {
    __int16 v18 = 0LL;
  }
}

- (void)dropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "dropIPPackets - sessionID %@, linkID:%d, payloadArray:%@.",  buf,  0x1Cu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"dropIPPackets - sessionID %@, linkID:%d, payloadArray:%@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"dropIPPackets - sessionID %@, linkID:%d, payloadArray:%@.");
      }
    }
  }

  uint64_t v14 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v16 = 0LL;
    if (cbuuidToLinks)
    {
      id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      uint64_t v14 = v17;
      if (v17)
      {
        __int16 v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalKey");
        __int16 v16 = v18;
        if (v18) {
          [v18 dropIPPackets:v6 payloadArray:v9];
        }
      }

      else
      {
        __int16 v16 = 0LL;
      }
    }
  }

  else
  {
    __int16 v16 = 0LL;
  }
}

- (void)updateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    if (v5) {
      uint64_t v11 = @"YES";
    }
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "updateProtocolQualityOfService - sessionID %@, linkID:%d, isGood:%@.",  buf,  0x1Cu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"updateProtocolQualityOfService - sessionID %@, linkID:%d, isGood:%@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"updateProtocolQualityOfService - sessionID %@, linkID:%d, isGood:%@.");
      }
    }
  }

  uint64_t v14 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v16 = 0LL;
    if (cbuuidToLinks)
    {
      id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      uint64_t v14 = v17;
      if (v17)
      {
        __int16 v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalKey");
        __int16 v16 = v18;
        if (v18) {
          [v18 updateProtocolQualityOfService:v6 isGood:v5];
        }
      }

      else
      {
        __int16 v16 = 0LL;
      }
    }
  }

  else
  {
    __int16 v16 = 0LL;
  }
}

- (void)stopKeepAlive:(id)a3 linkIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "stopKeepAlive - sessionID %@, linkIDs:%@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"stopKeepAlive - sessionID %@, linkIDs:%@.");
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 stopKeepAlive:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v4) {
      uint64_t v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WiFiAssist enabled: %@", buf, 0xCu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"WiFiAssist enabled: %@");
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setWiFiAssistState:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)currentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6
{
  id v10 = a3;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "currentCellularSignalStrength - sessionID %@.",  buf,  0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"currentCellularSignalStrength - sessionID %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"currentCellularSignalStrength - sessionID %@.");
      }
    }
  }

  uint64_t v15 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v17 = 0LL;
    if (cbuuidToLinks)
    {
      id v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      uint64_t v15 = v18;
      if (v18)
      {
        __int16 v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey");
        id v17 = v19;
        if (v19) {
          [v19 currentCellularSignalStrength:a4 signalStrength:a5 signalGrade:a6];
        }
      }

      else
      {
        id v17 = 0LL;
      }
    }
  }

  else
  {
    id v17 = 0LL;
  }
}

- (void)startLinkProbing:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "startLinkProbing - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"startLinkProbing - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"startLinkProbing - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 startLinkProbing:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)stopLinkProbing:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "stopLinkProbing - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"stopLinkProbing - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"stopLinkProbing - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 stopLinkProbing:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)queryLinkProbingStatus:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "queryLinkProbingStatus - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"queryLinkProbingStatus - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"queryLinkProbingStatus - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 queryLinkProbingStatus:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)flushLinkProbingStatus:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "flushLinkProbingStatus - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"flushLinkProbingStatus - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"flushLinkProbingStatus - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 flushLinkProbingStatus:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)sendStatsRequestForClient:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "sendStatsRequestForSessionID - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"sendStatsRequestForSessionID - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendStatsRequestForSessionID - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 sendStatsRequestForClient:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)sendStatsRequest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "sendStatsRequest - sessionID %@, options: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"sendStatsRequest - sessionID %@, options: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"sendStatsRequest - sessionID %@, options: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 sendStatsRequest:v7];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setRemoteDeviceVersion - sessionID %@, version: %u.",  buf,  0x12u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"setRemoteDeviceVersion - sessionID %@, version: %u.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setRemoteDeviceVersion - sessionID %@, version: %u.");
      }
    }
  }

  uint64_t v11 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v13 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v11 = v14;
      if (v14)
      {
        uint64_t v15 = (id)CFDictionaryGetValue( (CFDictionaryRef)v14,  @"IDSLinkGlobalKey");
        uint64_t v13 = v15;
        if (v15) {
          [v15 setRemoteDeviceVersion:v4];
        }
      }

      else
      {
        uint64_t v13 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }
}

- (void)receiveJoinNotificationFromAParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "receiveJoinNotificationFromAParticipant - sessionID %@.",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"receiveJoinNotificationFromAParticipant - sessionID %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"receiveJoinNotificationFromAParticipant - sessionID %@.");
      }
    }
  }

  uint64_t v9 = 0LL;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v11 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      uint64_t v9 = v12;
      if (v12)
      {
        uint64_t v13 = (id)CFDictionaryGetValue( (CFDictionaryRef)v12,  @"IDSLinkGlobalKey");
        uint64_t v11 = v13;
        if (v13) {
          [v13 receiveJoinNotificationFromAParticipant];
        }
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }
}

- (void)setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v4) {
      uint64_t v9 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setUPlusOneModeForSessionID - sessionID %@, isUPlusOneEnabled: %@.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"setUPlusOneModeForSessionID - sessionID %@, isUPlusOneEnabled: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setUPlusOneModeForSessionID - sessionID %@, isUPlusOneEnabled: %@.");
      }
    }
  }

  uint64_t v12 = 0LL;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0LL;
    if (cbuuidToLinks)
    {
      id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      uint64_t v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue( (CFDictionaryRef)v15,  @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 enableUPlusOneSessionForTransition:v4];
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }
}

- (void)manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v22 = v10;
    __int16 v23 = 1024;
    int v24 = v6;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 1024;
    int v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "manageDesignatedDestinationsWithSessionID - sessionID %@, sessionStateCounter: %u, destinations: %@, withType: %u",  buf,  0x22u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15)
  {
    if (_IDSShouldLogTransport(v15))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"manageDesignatedDestinationsWithSessionID - sessionID %@, sessionStateCounter: %u, destinations: %@, withType: %u");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"manageDesignatedDestinationsWithSessionID - sessionID %@, sessionStateCounter: %u, destinations: %@, withType: %u");
      }
    }
  }

  __int16 v16 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v18 = 0LL;
    if (cbuuidToLinks)
    {
      __int16 v19 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      __int16 v16 = v19;
      if (v19)
      {
        id v20 = (id)CFDictionaryGetValue( (CFDictionaryRef)v19,  @"IDSLinkGlobalKey");
        id v18 = v20;
        if (v20) {
          [v20 manageDesignatedDestinations:v11 relayGroupID:v10 withType:v7 sessionStateCounter:v6];
        }
      }

      else
      {
        id v18 = 0LL;
      }
    }
  }

  else
  {
    id v18 = 0LL;
  }
}

- (void)removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = v5;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "removeParticipantIDsWithSessionID - sessionID %@, sessionStateCounter: %u, participantIDs: %@",  buf,  0x1Cu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"removeParticipantIDsWithSessionID - sessionID %@, sessionStateCounter: %u, participantIDs: %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"removeParticipantIDsWithSessionID - sessionID %@, sessionStateCounter: %u, participantIDs: %@");
      }
    }
  }

  uint64_t v14 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v16 = 0LL;
    if (cbuuidToLinks)
    {
      id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      uint64_t v14 = v17;
      if (v17)
      {
        id v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalKey");
        __int16 v16 = v18;
        if (v18) {
          [v18 removeParticipantIDs:v9 relayGroupID:v8 sessionStateCounter:v5];
        }
      }

      else
      {
        __int16 v16 = 0LL;
      }
    }
  }

  else
  {
    __int16 v16 = 0LL;
  }
}

- (void)getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v46 = a4;
  id v11 = a5;
  uint64_t v12 = (const __CFDictionary *)a6;
  Value = 0LL;
  if (v12 && IDSGlobalLinkOptionSessionInfoRequestTypeKey) {
    Value = (void *)CFDictionaryGetValue(v12, IDSGlobalLinkOptionSessionInfoRequestTypeKey);
  }
  unsigned int v14 = [Value unsignedIntValue];
  uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v48 = v46;
    __int16 v49 = 2112;
    id v50 = v11;
    __int16 v51 = 2112;
    uint64_t v52 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "get session info for group %@, session %@, options %@",  buf,  0x20u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      id v43 = v11;
      uint64_t v45 = v12;
      id v41 = v46;
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"get session info for group %@, session %@, options %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v43 = v11;
        uint64_t v45 = v12;
        id v41 = v46;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"get session info for group %@, session %@, options %@");
      }
    }
  }

  __int16 v19 = 0LL;
  if (v10)
  {
    id v20 = 0LL;
    if (self->_cbuuidToLinks)
    {
      id v20 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, v10);
      __int16 v19 = v20;
      if (v20) {
        id v20 = (void *)CFDictionaryGetValue((CFDictionaryRef)v20, @"IDSLinkGlobalKey");
      }
    }
  }

  else
  {
    id v20 = 0LL;
  }

  id v21 = v20;
  id v22 = v21;
  if (v21 || v14 != 1)
  {
    if (v21)
    {
      if (v14 != 1)
      {
        __int16 v27 = v12;
LABEL_58:
        objc_msgSend(v22, "getSessionInfo:relaySessionID:requestType:options:", v46, v11, v14, v27, v41, v43);

        goto LABEL_59;
      }

- (void)updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "update session participants for group %@, session %@",  buf,  0x16u);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"update session participants for group %@, session %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"update session participants for group %@, session %@");
      }
    }
  }

  uint64_t v18 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v20 = 0LL;
    if (cbuuidToLinks)
    {
      id v21 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      uint64_t v18 = v21;
      if (v21)
      {
        id v22 = (id)CFDictionaryGetValue( (CFDictionaryRef)v21,  @"IDSLinkGlobalKey");
        id v20 = v22;
        if (v22) {
          [v22 updateSessionParticipants:v11 relaySessionID:v12 participants:v13];
        }
      }

      else
      {
        id v20 = 0LL;
      }
    }
  }

  else
  {
    id v20 = 0LL;
  }
}

- (void)registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (const __CFDictionary *)a5;
  if (!self->_sessionIDToPluginNameToPluginOptionsDict)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
    self->_sessionIDToPluginNameToPluginOptionsDict = Mutable;
  }

  id v13 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v10 && IDSGlobalLinkOptionPluginNameKey)
  {
    uint64_t v14 = (id)CFDictionaryGetValue(v10, IDSGlobalLinkOptionPluginNameKey);
    uint64_t v15 = v10;
LABEL_8:
    CFDictionarySetValue(v13, v14, v10);
    goto LABEL_9;
  }

  uint64_t v16 = v10;
  if (v10)
  {
    uint64_t v14 = 0LL;
    goto LABEL_8;
  }

  BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v27) {
    sub_1006A498C(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  uint64_t v14 = 0LL;
LABEL_9:

  uint64_t v17 = v13;
  if (v17)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToPluginNameToPluginOptionsDict, v8, v17);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4918();
  }

  uint64_t v18 = 0LL;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v20 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (uint64_t v18 = v20) != 0LL)
    && (id v21 = (id)CFDictionaryGetValue( (CFDictionaryRef)v20,  @"IDSLinkGlobalKey")) != 0LL)
  {
    id v22 = v21;
    [v21 registerPluginWithOptions:v10 relayGroupID:v9];
  }

  else
  {
    uint64_t v23 = OSLogHandleForTransportCategory("LinkManager");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "registerPluginForGroup could not find GlobalLink for session %@",  buf,  0xCu);
    }

    uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
    if ((_DWORD)v26)
    {
      if (_IDSShouldLogTransport(v26))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"registerPluginForGroup could not find GlobalLink for session %@");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"registerPluginForGroup could not find GlobalLink for session %@");
        }
      }
    }
  }
}

- (void)clearPluginCacheForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "clearPluginCacheForSession for session %@",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v12 = v4;
      _IDSLogTransport(@"LinkManager", @"IDS", @"clearPluginCacheForSession for session %@");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v12 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"clearPluginCacheForSession for session %@");
      }
    }
  }

  sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
  if (!sessionIDToPluginNameToPluginOptionsDict)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v11 = self->_sessionIDToPluginNameToPluginOptionsDict;
    self->_sessionIDToPluginNameToPluginOptionsDict = Mutable;

    sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( sessionIDToPluginNameToPluginOptionsDict,  "setObject:forKeyedSubscript:",  0LL,  v4,  v12);
}

- (void)clearReliableUnicastStateForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "clearReliableUnicastStateForSession for session %@",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"clearReliableUnicastStateForSession for session %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"clearReliableUnicastStateForSession for session %@");
      }
    }
  }

  *(_WORD *)&self->_isReliableUnicastSession = 0;
}

- (void)updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "updateSessionURIToParticipantIDs for group %@, session %@",  buf,  0x16u);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"updateSessionURIToParticipantIDs for group %@, session %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"updateSessionURIToParticipantIDs for group %@, session %@");
      }
    }
  }

  uint64_t v18 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v20 = 0LL;
    if (cbuuidToLinks)
    {
      id v21 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      uint64_t v18 = v21;
      if (v21)
      {
        id v22 = (id)CFDictionaryGetValue( (CFDictionaryRef)v21,  @"IDSLinkGlobalKey");
        id v20 = v22;
        if (v22) {
          [v22 updateURIToParticipantIDs:v11 relaySessionID:v12 sessionInfo:v13];
        }
      }

      else
      {
        id v20 = 0LL;
      }
    }
  }

  else
  {
    id v20 = 0LL;
  }
}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = 0LL;
  if (v9
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
        (id v10 = v12) != 0LL)
    && (id v13 = (id)CFDictionaryGetValue( (CFDictionaryRef)v12,  @"IDSLinkGlobalKey")) != 0LL)
  {
    uint64_t v14 = v13;
    id v15 = [v13 createAliasForParticipantID:a3 salt:v8 relayGroupID:v9];
  }

  else
  {
    uint64_t v16 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "createAliasForParticipantID could not find GlobalLink for session %@",  buf,  0xCu);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"createAliasForParticipantID could not find GlobalLink for session %@");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"createAliasForParticipantID could not find GlobalLink for session %@");
        }
      }
    }

    id v15 = 0LL;
  }

  return (unint64_t)v15;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = 0LL;
  if (v9
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
        (id v10 = v12) != 0LL)
    && (id v13 = (id)CFDictionaryGetValue( (CFDictionaryRef)v12,  @"IDSLinkGlobalKey")) != 0LL)
  {
    uint64_t v14 = v13;
    id v15 = [v13 participantIDForAlias:a3 salt:v8 relayGroupID:v9];
  }

  else
  {
    uint64_t v16 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "participantIDForAlias could not find GlobalLink for session %@",  buf,  0xCu);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"participantIDForAlias could not find GlobalLink for session %@");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"participantIDForAlias could not find GlobalLink for session %@");
        }
      }
    }

    id v15 = 0LL;
  }

  return (unint64_t)v15;
}

- (void)updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a3;
  id v8 = a4;
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "updateParticipantType %u - sessionID %@",  buf,  0x12u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"updateParticipantType %u - sessionID %@");
    }
  }

  id v13 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v15 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v13 = v16;
      if (v16)
      {
        uint64_t v17 = (id)CFDictionaryGetValue( (CFDictionaryRef)v16,  @"IDSLinkGlobalKey");
        id v15 = v17;
        if (v17) {
          [v17 setParticipantType:v6 relayGroupID:v8 sessionStateCounter:v5];
        }
      }

      else
      {
        id v15 = 0LL;
      }
    }
  }

  else
  {
    id v15 = 0LL;
  }
}

- (void)sendConnectedLinkInfoToAVCForSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "sendConnectedLinkInfoToAVCForSessionID %@",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"sendConnectedLinkInfoToAVCForSessionID %@");
    }
  }

  uint64_t v9 = 0LL;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v11 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      uint64_t v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue( (CFDictionaryRef)v12,  @"IDSLinkGlobalKey");
        uint64_t v11 = v13;
        if (v13) {
          [v13 sendConnectedLinkInfoToAVC];
        }
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }
}

- (void)reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 1024;
    int v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "reportLinkEventForSessionID %@, eventName:%@, linkID: %d",  buf,  0x1Cu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"reportLinkEventForSessionID %@, eventName:%@, linkID: %d");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"reportLinkEventForSessionID %@, eventName:%@, linkID: %d");
      }
    }
  }

  uint64_t v14 = 0LL;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v16 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      uint64_t v14 = v17;
      if (v17)
      {
        uint64_t v18 = (id)CFDictionaryGetValue( (CFDictionaryRef)v17,  @"IDSLinkGlobalKey");
        uint64_t v16 = v18;
        if (v18) {
          [v18 reportLinkEvent:v9 linkID:v5];
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }
}

- (void)reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v21 = v10;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 2048;
    double v25 = a5;
    __int16 v26 = 2048;
    double v27 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "reportLinkMetricsForSessionID %@, linkID: %d, lastPacketReceivedTime: %f, lastPacketSentTime: %f",  buf,  0x26u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"reportLinkMetricsForSessionID %@, linkID: %d, lastPacketReceivedTime: %f, lastPacketSentTime: %f");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"reportLinkMetricsForSessionID %@, linkID: %d, lastPacketReceivedTime: %f, lastPacketSentTime: %f");
      }
    }
  }

  id v15 = 0LL;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v17 = 0LL;
    if (cbuuidToLinks)
    {
      uint64_t v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v15 = v18;
      if (v18)
      {
        int v19 = (id)CFDictionaryGetValue( (CFDictionaryRef)v18,  @"IDSLinkGlobalKey");
        uint64_t v17 = v19;
        if (v19) {
          [v19 reportLinkMetricsForLinkID:v8 lastPacketReceivedTime:a5 lastPacketSentTime:a6];
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }
}

- (void)setClientUniquePID:(unint64_t)a3 sessionID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0LL;
  if (v6
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6),
        (uint64_t v7 = v9) != 0LL)
    && (id v10 = (id)CFDictionaryGetValue( (CFDictionaryRef)v9,  @"IDSLinkGlobalKey")) != 0LL)
  {
    uint64_t v11 = v10;
    [v10 setClientUniquePID:a3];
  }

  else
  {
    uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setClientUniquePID could not find GlobalLink for session %@",  buf,  0xCu);
    }

    uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
    if ((_DWORD)v15)
    {
      if (_IDSShouldLogTransport(v15))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"setClientUniquePID could not find GlobalLink for session %@");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"setClientUniquePID could not find GlobalLink for session %@");
        }
      }
    }
  }
}

- (void)requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = 0LL;
  if (v6
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0LL
    && (id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6),
        (uint64_t v7 = v9) != 0LL)
    && (id v10 = (id)CFDictionaryGetValue( (CFDictionaryRef)v9,  @"IDSLinkGlobalKey")) != 0LL)
  {
    uint64_t v11 = v10;
    [v10 requestChildConnectionIDForLinkID:v4 relayGroupID:v6];
  }

  else
  {
    uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "requestChildConnectionIDForLinkID could not find GlobalLink for session %@",  buf,  0xCu);
    }

    uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
    if ((_DWORD)v15)
    {
      if (_IDSShouldLogTransport(v15))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"requestChildConnectionIDForLinkID could not find GlobalLink for session %@");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"requestChildConnectionIDForLinkID could not find GlobalLink for session %@");
        }
      }
    }
  }
}

- (void)setIsOnPhoneCall:(BOOL)a3 forDeviceID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setIsOnPhoneCall %@ for deviceID %@",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11 && _IDSShouldLogTransport(v11))
  {
    uint64_t v12 = v4 ? @"YES" : @"NO";
    uint64_t v14 = v12;
    id v15 = v6;
    _IDSLogTransport(@"LinkManager", @"IDS", @"setIsOnPhoneCall %@ for deviceID %@");
    if (_IDSShouldLog(0LL, @"LinkManager"))
    {
      uint64_t v14 = v12;
      id v15 = v6;
      _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"setIsOnPhoneCall %@ for deviceID %@");
    }
  }

  if (objc_msgSend(v6, "isEqualToString:", kIDSDefaultPairedDeviceID, v14, v15))
  {
    BOOL isDefaultDeviceOnPhoneCall = self->_isDefaultDeviceOnPhoneCall;
    self->_BOOL isDefaultDeviceOnPhoneCall = v4;
    if (isDefaultDeviceOnPhoneCall && !v4 && self->_shouldBringWiFiDown) {
      -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0LL);
    }
  }
}

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v22 = a4;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForIDSCategory("LinkManager");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ didConnectForDevice %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    id v20 = v8;
    id v21 = v9;
    _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%@ didConnectForDevice %@");
  }

  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v9, v20, v21);
  if (self->_hasFixedDestination)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_deviceIDToUDPDestinations, "allKeys"));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance"));
          [v18 setAlwaysConnectedForCBUUID:v17];
        }

        id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v14);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10023B0C0;
    v23[3] = &unk_1008F7900;
    id v24 = v13;
    double v25 = self;
    id v26 = v8;
    id v19 = v13;
    IDSTransportThreadAddBlockAfter(v23, 3.0);
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ didDisconnectForDevice %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"LinkManager"))
  {
    id v15 = v8;
    id v16 = v10;
    _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"%@ didDisconnectForDevice %@");
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLinkManager _linkKeyForLink:](self, "_linkKeyForLink:", v8, v15, v16));
  -[IDSLinkManager _removeLinkForDeviceID:linkKey:verifyWithLink:]( self,  "_removeLinkForDeviceID:linkKey:verifyWithLink:",  v10,  v14,  v8);
  if (([v14 isEqualToString:@"IDSLinkBTKey"] & 1) != 0
    || [v14 isEqualToString:@"IDSLinkBTLEKey"])
  {
    -[IDSBTLinkManager removeLink:](self->_btLinkManager, "removeLink:", v8);
    -[IDSWPLinkManager removeLink:](self->_wpLinkManager, "removeLink:", v8);
  }
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int64_t var2 = a4->var2;
  int64x2_t v14 = vdupq_n_s64(1uLL);
  v14.i64[0] = var2;
  *(int64x2_t *)&self->_unint64_t totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v14);
  if (var2 >= 1)
  {
    if ((*a4->var0 & 0xE0) == 0x40 && !a4->var6)
    {
      -[IDSLinkManager _processLMCommandPacket:fromLink:deviceUniqueID:cbuuid:]( self,  "_processLMCommandPacket:fromLink:deviceUniqueID:cbuuid:",  a4,  v10,  v11,  v12);
      unsigned __int8 v17 = 1;
      goto LABEL_10;
    }

    if ((*a4->var0 & 0x20) != 0) {
      kdebug_trace(722010184LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 alternateDelegate]);
  id v16 = v15;
  if (v15)
  {
    unsigned __int8 v17 = [v15 link:self didReceivePacket:a4 fromDeviceUniqueID:v11 cbuuid:v12];
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v17 = [WeakRetained link:self didReceivePacket:a4 fromDeviceUniqueID:v11 cbuuid:v12];
  }

LABEL_10:
  return v17;
}

- (void)link:(id)a3 hostAwakeDidChange:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 cbuuid]);
  unsigned int v8 = [v7 isEqualToString:kIDSDefaultPairedDeviceID];

  if (v8)
  {
    uint64_t v11 = im_primary_queue(v9, v10);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10023B570;
    block[3] = &unk_1008FE710;
    BOOL v14 = a4;
    dispatch_async(v12, block);
  }

- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi && self->_currentDefaultDeviceLinkType == 1)
  {
    uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "default device is in preferInfraWiFi handshake, skip notifying BTLink hasSpaceAvailable.",  v18,  2u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"default device is in preferInfraWiFi handshake, skip notifying BTLink hasSpaceAvailable.");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"default device is in preferInfraWiFi handshake, skip notifying BTLink hasSpaceAvailable.");
        }
      }
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self hasSpaceAvailable:v8 deviceUniqueID:v11 cbuuid:v12];
  }
}

- (void)link:(id)a3 didReceiveSKEData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = [v7 length];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "didReceiveSKEData - alternateDelegate:%@, skeData:%d bytes.",  buf,  0x12u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      id v13 = [v7 length];
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveSKEData - alternateDelegate:%@, skeData:%d bytes.");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        objc_msgSend(v7, "length", v8, v13);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveSKEData - alternateDelegate:%@, skeData:%d bytes.");
      }
    }
  }

  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceiveSKEData:") & 1) != 0) {
    [v8 link:self didReceiveSKEData:v7];
  }
}

- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 alternateDelegate]);
  uint64_t v15 = OSLogHandleForTransportCategory("LinkManager");
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v14;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "didReceiveKeyMaterialMessage - alternateDelegate:%@ from %@ to %@",  buf,  0x20u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveKeyMaterialMessage - alternateDelegate:%@ from %@ to %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveKeyMaterialMessage - alternateDelegate:%@ from %@ to %@");
      }
    }
  }

  if (v14
    && (objc_opt_respondsToSelector(v14, "link:didReceiveKeyMaterialMessageData:fromParticipantIDs:toParticipantID:") & 1) != 0)
  {
    [v14 link:self didReceiveKeyMaterialMessageData:v11 fromParticipantIDs:v12 toParticipantID:v13];
  }
}

- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 alternateDelegate]);
  uint64_t v12 = OSLogHandleForTransportCategory("LinkManager");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo - alternateDelegate:%@ materialInfo:%@",  buf,  0x16u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15)
  {
    if (_IDSShouldLogTransport(v15))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveMaterialInfo - alternateDelegate:%@ materialInfo:%@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveMaterialInfo - alternateDelegate:%@ materialInfo:%@");
      }
    }
  }

  if (v11 && (objc_opt_respondsToSelector(v11, "link:didReceiveMaterialInfo:material:") & 1) != 0) {
    [v11 link:self didReceiveMaterialInfo:v9 material:v10];
  }
}

- (void)link:(id)a3 didConnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_shouldStartBTLinkManager)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didConnectOverCloud for %@.", buf, 0xCu);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        id v23 = v10;
        _IDSLogTransport(@"LinkManager", @"IDS", @"didConnectOverCloud for %@.");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          id v23 = v10;
          _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"didConnectOverCloud for %@.");
        }
      }
    }

    -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v10, v23);
    id v15 = [v10 isEqualToString:kIDSDefaultPairedDeviceID];
    if ((_DWORD)v15)
    {
      -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  self->_lastSentDefaultDeviceConnectivity,  1LL);
    }

    else
    {
      uint64_t v21 = im_primary_queue(v15, v16);
      id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10023BF30;
      block[3] = &unk_1008F6010;
      id v25 = v10;
      dispatch_async(v22, block);
    }
  }

  else
  {
    uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Not processing didConnectOverCloud in the IPsecLink path.",  buf,  2u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"Not processing didConnectOverCloud in the IPsecLink path.");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Not processing didConnectOverCloud in the IPsecLink path.");
        }
      }
    }
  }
}

- (void)link:(id)a3 didFailToConnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didFailToConnectOverCloud for %@.", buf, 0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v19 = v10;
      _IDSLogTransport(@"LinkManager", @"IDS", @"didFailToConnectOverCloud for %@.");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v19 = v10;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"didFailToConnectOverCloud for %@.");
      }
    }
  }

  -[IDSLinkManager disconnectGlobalLinkForDevice:isReinitiating:completionHandler:]( self,  "disconnectGlobalLinkForDevice:isReinitiating:completionHandler:",  v10,  0LL,  0LL,  v19);
  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v10);
  id v15 = [v10 isEqualToString:kIDSDefaultPairedDeviceID];
  if ((_DWORD)v15)
  {
    -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  self->_lastSentDefaultDeviceConnectivity,  0LL);
  }

  else
  {
    uint64_t v17 = im_primary_queue(v15, v16);
    __int16 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10023C188;
    block[3] = &unk_1008F6010;
    id v21 = v10;
    dispatch_async(v18, block);
  }
}

- (void)link:(id)a3 didDisconnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didDisconnectOverCloud for %@.", buf, 0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v26 = v10;
      _IDSLogTransport(@"LinkManager", @"IDS", @"didDisconnectOverCloud for %@.");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        id v26 = v10;
        _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"didDisconnectOverCloud for %@.");
      }
    }
  }

  -[IDSLinkManager stopGlobalLinkForDevice:](self, "stopGlobalLinkForDevice:", v10, v26);
  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 cbuuid]);
  uint64_t v16 = kIDSDefaultPairedDeviceID;
  unsigned int v17 = [v15 isEqualToString:kIDSDefaultPairedDeviceID];

  if (v17)
  {
    -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  self->_lastSentDefaultDeviceConnectivity,  0LL);
    if (self->_delayedDefaultDeviceAllocateRequest)
    {
      uint64_t v20 = OSLogHandleForTransportCategory("LinkManager");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "allocation request was delayed, retry...",  buf,  2u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport(@"LinkManager", @"IDS", @"allocation request was delayed, retry...");
          if (_IDSShouldLog(0LL, @"LinkManager")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"allocation request was delayed, retry...");
          }
        }
      }

      -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v16);
    }
  }

  else
  {
    uint64_t v24 = im_primary_queue(v18, v19);
    id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10023C4CC;
    block[3] = &unk_1008F6010;
    id v28 = v10;
    dispatch_async(v25, block);
  }
}

- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 alternateDelegate]);
  uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v22 = v16;
    __int16 v23 = 1024;
    int v24 = v10;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "didConnectUnderlyingLink - alternateDelegate:%@, linkID:%d, linkUUID:%@.",  buf,  0x1Cu);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didConnectUnderlyingLink - alternateDelegate:%@, linkID:%d, linkUUID:%@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didConnectUnderlyingLink - alternateDelegate:%@, linkID:%d, linkUUID:%@.");
      }
    }
  }

  if (v16
    && (objc_opt_respondsToSelector(v16, "link:didConnectUnderlyingLink:linkUUID:localAttributes:remoteAttributes:") & 1) != 0)
  {
    [v16 link:self didConnectUnderlyingLink:v10 linkUUID:v13 localAttributes:v14 remoteAttributes:v15];
  }
}

- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 alternateDelegate]);
  uint64_t v11 = OSLogHandleForTransportCategory("LinkManager");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 1024;
    int v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "didReceiveChildConnectionID - alternateDelegate:%@, connections:%@ linkID:%d",  buf,  0x1Cu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveChildConnectionID - alternateDelegate:%@, connections:%@ linkID:%d");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveChildConnectionID - alternateDelegate:%@, connections:%@ linkID:%d");
      }
    }
  }

  if (v10 && (objc_opt_respondsToSelector(v10, "link:didReceiveChildConnections:forLinkID:") & 1) != 0) {
    [v10 link:self didReceiveChildConnections:v9 forLinkID:v5];
  }
}

- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "didReceiveReliableUnicastServerMaterial - material: %@",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveReliableUnicastServerMaterial - material: %@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveReliableUnicastServerMaterial - material: %@");
      }
    }
  }

  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceiveReliableUnicastServerMaterial:") & 1) != 0) {
    [v8 link:self didReceiveReliableUnicastServerMaterial:v7];
  }
}

- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 alternateDelegate]);
  uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = v12;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 1024;
    int v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "didDisconnectUnderlyingLinkID - alternateDelegate:%@, linkID:%d, linkUUID:%@, reason: %d",  buf,  0x22u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16)
  {
    if (_IDSShouldLogTransport(v16))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didDisconnectUnderlyingLinkID - alternateDelegate:%@, linkID:%d, linkUUID:%@, reason: %d");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didDisconnectUnderlyingLinkID - alternateDelegate:%@, linkID:%d, linkUUID:%@, reason: %d");
      }
    }
  }

  if (v12 && (objc_opt_respondsToSelector(v12, "link:didDisconnectUnderlyingLinkID:linkUUID:reason:") & 1) != 0) {
    [v12 link:self didDisconnectUnderlyingLinkID:v8 linkUUID:v11 reason:v6];
  }
}

- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 alternateDelegate]);
  uint64_t v10 = OSLogHandleForTransportCategory("LinkManager");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didDefaultUnderlyingLinkChangeSucceeded - alternateDelegate:%@, currentDefaultLinkID:%d.",  buf,  0x12u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didDefaultUnderlyingLinkChangeSucceeded - alternateDelegate:%@, currentDefaultLinkID:%d.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didDefaultUnderlyingLinkChangeSucceeded - alternateDelegate:%@, currentDefaultLinkID:%d.");
      }
    }
  }

  if (v9
    && (objc_opt_respondsToSelector(v9, "link:didDefaultUnderlyingLinkChangeSucceeded:currentDefaultLinkID:") & 1) != 0)
  {
    [v9 link:self didDefaultUnderlyingLinkChangeSucceeded:v6 currentDefaultLinkID:v5];
  }
}

- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "didWiFiNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.",  buf,  0x12u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didWiFiNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didWiFiNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.");
      }
    }
  }

  if (v7 && (objc_opt_respondsToSelector(v7, "link:didWiFiNWPathFlagsChanged:") & 1) != 0) {
    [v7 link:self didWiFiNWPathFlagsChanged:v4];
  }
}

- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "didCellularNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.",  buf,  0x12u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didCellularNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didCellularNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.");
      }
    }
  }

  if (v7 && (objc_opt_respondsToSelector(v7, "link:didCellularNWPathFlagsChanged:") & 1) != 0) {
    [v7 link:self didCellularNWPathFlagsChanged:v4];
  }
}

- (void)link:(id)a3 didRATChange:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2080;
    uint64_t v15 = IDSRadioAccessTechnologyToString(v4);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "didRATChange - alternateDelegate:%@, newRAT:%s.",  buf,  0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      IDSRadioAccessTechnologyToString(v4);
      _IDSLogTransport(@"LinkManager", @"IDS", @"didRATChange - alternateDelegate:%@, newRAT:%s.");
      if (_IDSShouldLog(0LL, @"LinkManager"))
      {
        IDSRadioAccessTechnologyToString(v4);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didRATChange - alternateDelegate:%@, newRAT:%s.");
      }
    }
  }

  if (v7 && (objc_opt_respondsToSelector(v7, "link:didRATChange:") & 1) != 0) {
    [v7 link:self didRATChange:v4];
  }
}

- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v8 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "didCellularMTUChange - alternateDelegate:%@, cellular MTU:%u.",  buf,  0x12u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didCellularMTUChange - alternateDelegate:%@, cellular MTU:%u.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didCellularMTUChange - alternateDelegate:%@, cellular MTU:%u.");
      }
    }
  }

  if (v7 && (objc_opt_respondsToSelector(v7, "link:didCellularMTUChange:") & 1) != 0) {
    [v7 link:self didCellularMTUChange:v4];
  }
}

- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4
{
  id v8 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "link:didGetLinkProbingStatus:") & 1) != 0) {
    [v7 link:self didGetLinkProbingStatus:v8];
  }
}

- (void)terminateCallDueToIdleClientForLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 alternateDelegate]);
  uint64_t v6 = OSLogHandleForTransportCategory("LinkManager");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "terminateCallDueToIdleClientForLink - alternateDelegate:%@",  buf,  0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"terminateCallDueToIdleClientForLink - alternateDelegate:%@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"terminateCallDueToIdleClientForLink - alternateDelegate:%@");
      }
    }
  }

  if (v5 && (objc_opt_respondsToSelector(v5, "terminateCallDueToIdleClientForLink:") & 1) != 0) {
    [v5 terminateCallDueToIdleClientForLink:self];
  }
}

- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 alternateDelegate]);
  uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v15;
    __int16 v25 = 1024;
    int v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "receive session-info for group %@, session %@, status: %u.",  buf,  0x1Cu);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"receive session-info for group %@, session %@, status: %u.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"receive session-info for group %@, session %@, status: %u.");
      }
    }
  }

  if (v16
    && (objc_opt_respondsToSelector(v16, "link:didReceiveSessionInfo:relayGroupID:relaySessionID:status:") & 1) != 0)
  {
    [v16 link:self didReceiveSessionInfo:v13 relayGroupID:v14 relaySessionID:v15 status:v7];
  }
}

- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "didFinishConvergenceForRelaySessionID: %@.",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"didFinishConvergenceForRelaySessionID: %@.");
    }
  }

  if (v8 && (objc_opt_respondsToSelector(v8, "link:didFinishConvergenceForRelaySessionID:") & 1) != 0) {
    [v8 link:self didFinishConvergenceForRelaySessionID:v7];
  }
}

- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 alternateDelegate]);
  uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v23 = v14;
    __int16 v24 = 2112;
    if (v7) {
      uint64_t v19 = @"YES";
    }
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "receive session stats for group %@, session %@, success: %@.",  buf,  0x20u);
  }

  uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
  if ((_DWORD)v21)
  {
    if (_IDSShouldLogTransport(v21))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"receive session stats for group %@, session %@, success: %@.");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"receive session stats for group %@, session %@, success: %@.");
      }
    }
  }

  if (v16
    && (objc_opt_respondsToSelector(v16, "link:didReceiveSessionStats:relayGroupID:relaySessionID:success:") & 1) != 0)
  {
    [v16 link:self didReceiveSessionStats:v13 relayGroupID:v14 relaySessionID:v15 success:v7];
  }
}

- (void)link:(id)a3 didReceiveReportEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateDelegate]);
  uint64_t v9 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "didReceiveReportEvent - alternateDelegate:%@, eventDictionary:%@",  buf,  0x16u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport( @"LinkManager",  @"IDS",  @"didReceiveReportEvent - alternateDelegate:%@, eventDictionary:%@");
      if (_IDSShouldLog(0LL, @"LinkManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"didReceiveReportEvent - alternateDelegate:%@, eventDictionary:%@");
      }
    }
  }

  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceiveReportEvent:") & 1) != 0) {
    [v8 link:self didReceiveReportEvent:v7];
  }
}

- (void)link:(id)a3 didAddQREvent:(id)a4
{
  id v8 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "link:didAddQREvent:") & 1) != 0) {
    [v7 link:self didAddQREvent:v8];
  }
}

- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v10 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  uint64_t v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceiveParticipantUpdate:status:") & 1) != 0) {
    [v9 link:self didReceiveParticipantUpdate:v10 status:v5];
  }
}

- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5
{
  id v10 = a5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  uint64_t v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceivePluginRegistration:pluginName:") & 1) != 0) {
    [v9 link:self didReceivePluginRegistration:a4 pluginName:v10];
  }
}

- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5
{
  id v10 = a5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  uint64_t v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceivePluginUnregistration:pluginName:") & 1) != 0) {
    [v9 link:self didReceivePluginUnregistration:a4 pluginName:v10];
  }
}

- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4
{
  id v8 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "link:didReceiveRequestToPurgeRegistration:") & 1) != 0) {
    [v7 link:self didReceiveRequestToPurgeRegistration:v8];
  }
}

- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4
{
  id v8 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "link:didReceivePluginDisconnect:") & 1) != 0) {
    [v7 link:self didReceivePluginDisconnect:v8];
  }
}

- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v10 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  uint64_t v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "link:didReceiveMappedParticipantsDict:forLinkID:") & 1) != 0) {
    [v9 link:self didReceiveMappedParticipantsDict:v10 forLinkID:v5];
  }
}

- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector(v6, "link:didReceiveSessionStateCounter:");
    id v7 = v9;
    if ((v8 & 1) != 0)
    {
      [v9 link:self didReceiveSessionStateCounter:v4];
      id v7 = v9;
    }
  }
}

- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector(v6, "didReceiveBlockedIndicationForLink:reason:");
    id v7 = v9;
    if ((v8 & 1) != 0)
    {
      [v9 didReceiveBlockedIndicationForLink:self reason:v4];
      id v7 = v9;
    }
  }
}

- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4
{
  id v8 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "link:didReceiveEncryptedDataBlobs:") & 1) != 0) {
    [v7 link:self didReceiveEncryptedDataBlobs:v8];
  }
}

- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 alternateDelegate]);
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector(v6, "link:didReceiveErrorIndicationWithCode:");
    id v7 = v9;
    if ((v8 & 1) != 0)
    {
      [v9 link:self didReceiveErrorIndicationWithCode:v4];
      id v7 = v9;
    }
  }
}

- (void)manager:(id)a3 didPowerStateChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
  char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"OFF";
    if (v4) {
      uint64_t v9 = @"ON";
    }
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ reported power state change: %@", buf, 0x16u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"%@ reported power state change: %@");
    }
  }

  if (!v4)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10023E404;
    v13[3] = &unk_1008F8800;
    id v14 = v6;
    __int16 v15 = self;
    IDSTransportThreadAddBlock(v13, v12);
  }
}

- (void)manager:(id)a3 linkDidConnect:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10023E668;
  v7[3] = &unk_1008F8800;
  id v8 = a4;
  uint64_t v9 = self;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)manager:(id)a3 linkDidDisconnect:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10023E86C;
  v7[3] = &unk_1008F8800;
  id v8 = a4;
  uint64_t v9 = self;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)manager:(id)a3 didPairedDeviceChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && !self->_isCentral)
  {
    uint64_t v7 = OSLogHandleForTransportCategory("LinkManager");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ reported paired device change.", buf, 0xCu);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"%@ reported paired device change.");
      }
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10023EB60;
    v12[3] = &unk_1008F8800;
    id v13 = v6;
    id v14 = self;
    IDSTransportThreadAddBlock(v12, v11);
  }
}

- (void)_handleNetworkChanges:(id)a3
{
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = a3;
  int v4 = 0;
  id v5 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v5)
  {
    int v71 = 0;
    int v69 = 0;
    uint64_t v6 = *(void *)v77;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v77 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(__CFString **)(*((void *)&v76 + 1) + 8LL * (void)i);
        if ((-[__CFString hasPrefix:](v8, "hasPrefix:", @"State:/Network/Interface/utun", v67) & 1) == 0)
        {
          unsigned int v9 = -[__CFString hasPrefix:](v8, "hasPrefix:", @"State:/Network/Interface/pdp_ip");
          uint64_t v10 = (void *)SCDynamicStoreCopyValue(self->_dynamicStore, v8);
          v4 |= v9 ^ 1;
          if (v10)
          {
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (TypeID == CFGetTypeID(v10)) {
              uint64_t v12 = v10;
            }
            else {
              uint64_t v12 = 0LL;
            }
            uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
            __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              if (v12) {
                Value = CFDictionaryGetValue(v12, @"Addresses");
              }
              else {
                Value = 0LL;
              }
              *(_DWORD *)buf = 138412546;
              id v82 = v8;
              __int16 v83 = 2112;
              id v84 = Value;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "_handleNetworkChanges %@ = %@",  buf,  0x16u);
            }

            uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
            if ((_DWORD)v21 && _IDSShouldLogTransport(v21))
            {
              id v22 = v12 ? CFDictionaryGetValue(v12, @"Addresses") : 0LL;
              uint64_t v67 = (IDSSockAddrWrapper *)v8;
              uint64_t v68 = v22;
              _IDSLogTransport(@"LinkManager", @"IDS", @"_handleNetworkChanges %@ = %@");
              if (_IDSShouldLog(0LL, @"LinkManager"))
              {
                if (v12) {
                  id v23 = CFDictionaryGetValue(v12, @"Addresses");
                }
                else {
                  id v23 = 0LL;
                }
                uint64_t v67 = (IDSSockAddrWrapper *)v8;
                uint64_t v68 = v23;
                _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"_handleNetworkChanges %@ = %@");
              }
            }

            CFRelease(v10);
            else {
              v71 |= -[__CFString hasSuffix:](v8, "hasSuffix:", @"/IPv6");
            }
          }

          else
          {
            uint64_t v13 = OSLogHandleForTransportCategory("LinkManager");
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v82 = v8;
              __int16 v83 = 2112;
              id v84 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "_handleNetworkChanges %@ = %@",  buf,  0x16u);
            }

            uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
            if ((_DWORD)v16)
            {
              if (_IDSShouldLogTransport(v16))
              {
                uint64_t v67 = (IDSSockAddrWrapper *)v8;
                uint64_t v68 = 0LL;
                _IDSLogTransport(@"LinkManager", @"IDS", @"_handleNetworkChanges %@ = %@");
                if (_IDSShouldLog(0LL, @"LinkManager"))
                {
                  uint64_t v67 = (IDSSockAddrWrapper *)v8;
                  uint64_t v68 = 0LL;
                  _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"_handleNetworkChanges %@ = %@");
                }
              }
            }

            else {
              v71 |= -[__CFString hasSuffix:](v8, "hasSuffix:", @"/IPv6");
            }
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
    }

    while (v5);
  }

  else
  {
    LOBYTE(v71) = 0;
    int v69 = 0;
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_cbuuidToLinks, "allKeys"));
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v25 = v24;
  __int16 v26 = 0LL;
  id v27 = [v25 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v73;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v73 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(const void **)(*((void *)&v72 + 1) + 8LL * (void)j);
        cbuuidToLinks = self->_cbuuidToLinks;
        if (cbuuidToLinks) {
          BOOL v32 = v30 == 0LL;
        }
        else {
          BOOL v32 = 1;
        }
        if (v32)
        {
          id v33 = 0LL;
        }

        else
        {
          __int16 v34 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v30);
          id v33 = v34;
          if (v34)
          {
            id v35 = (id)CFDictionaryGetValue( (CFDictionaryRef)v34,  @"IDSLinkGlobalKey");

            if (v35)
            {
              uint64_t v37 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v36);
              if ((objc_opt_isKindOfClass(v35, v37) & 1) != 0)
              {
                [v35 handleNetworkAddressChanges:v69 & 1 hasIPv6AddressChange:v71 & 1];
              }

              __int16 v26 = v35;
            }

            else
            {
              __int16 v26 = 0LL;
            }
          }
        }
      }

      id v27 = [v25 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }

    while (v27);
  }

  if ((v4 & v69 & 1) != 0)
  {
    uint64_t v38 = kIDSDefaultPairedDeviceID;
    id v39 = -[IDSLinkManager _newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:]( self,  "_newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:",  0LL,  kIDSDefaultPairedDeviceID,  0LL,  0LL);
    id v40 = [v39 copyCurrentNetworkInterfaces];
    id v41 = v40;
    if (self->_isDefaultDeviceUsingBTLink)
    {
      if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi && ![v40 count])
      {
        -[IDSLinkManager _suspendBTLink:cbuuid:](self, "_suspendBTLink:cbuuid:", 0LL, v38);
LABEL_100:
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject", v67));
        unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue([v65 address]);
        [v39 reconnectWithLocalAddress:v66];

        goto LABEL_101;
      }

      goto LABEL_66;
    }

    uint64_t v48 = OSLogHandleForTransportCategory("LinkManager");
    __int16 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      localWiFiAddressUsedForDefaultDevice = self->_localWiFiAddressUsedForDefaultDevice;
      *(_DWORD *)buf = 138412290;
      id v82 = localWiFiAddressUsedForDefaultDevice;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "_handleNetworkChanges _localWiFiAddressUsedForDefaultDevice = %@",  buf,  0xCu);
    }

    uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
    if ((_DWORD)v52)
    {
      if (_IDSShouldLogTransport(v52))
      {
        uint64_t v67 = self->_localWiFiAddressUsedForDefaultDevice;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"_handleNetworkChanges _localWiFiAddressUsedForDefaultDevice = %@");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          uint64_t v67 = self->_localWiFiAddressUsedForDefaultDevice;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"_handleNetworkChanges _localWiFiAddressUsedForDefaultDevice = %@");
        }
      }
    }

    if (!objc_msgSend(v41, "count", v67))
    {
      if (self->_doesDefaultDevicePreferInfraWiFi)
      {
        id v58 = -[IDSLinkManager _suspendBTLink:cbuuid:](self, "_suspendBTLink:cbuuid:", 0LL, v38);
        if (self->_isCentral)
        {
          self->_rejectedPreferInfraWiFi = ids_monotonic_time(v58);
          -[IDSLinkManager _sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:]( self,  "_sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:",  v39,  v38,  0LL,  0LL);
        }
      }

      else
      {
        -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  0LL,  self->_lastSentDefaultDeviceCloudConnectivity);
      }

      goto LABEL_100;
    }

    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
    uint64_t v54 = v53;
    if (self->_isWiFiBroughtUp)
    {
      id v55 = self->_localWiFiAddressUsedForDefaultDevice;
      if (!self->_isCentral)
      {
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v53 address]);
        unsigned __int8 v62 = -[IDSSockAddrWrapper isEqualToWrapper:](v55, "isEqualToWrapper:", v61);

        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 address]);
        [v39 reconnectWithLocalAddress:v64];

        if ((v62 & 1) == 0) {
          goto LABEL_101;
        }
LABEL_67:
        if (v39) {
          -[IDSLinkManager _sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:]( self,  "_sendUDPLinkInterfaceAddresses:toDeviceID:isRetransmission:isReply:",  v39,  v38,  0LL,  0LL);
        }
        if (self->_delayedDefaultDeviceAllocateRequest)
        {
          uint64_t v44 = OSLogHandleForTransportCategory("LinkManager");
          uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "receive WiFi IP address, start QR allocation.",  buf,  2u);
          }

          uint64_t v47 = os_log_shim_legacy_logging_enabled(v46);
          if ((_DWORD)v47)
          {
            if (_IDSShouldLogTransport(v47))
            {
              _IDSLogTransport( @"LinkManager",  @"IDS",  @"receive WiFi IP address, start QR allocation.");
              if (_IDSShouldLog(0LL, @"LinkManager")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"receive WiFi IP address, start QR allocation.");
              }
            }
          }

          -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v38);
        }

        goto LABEL_101;
      }

      if (!v55
        || (id v56 = (void *)objc_claimAutoreleasedReturnValue([v53 address]),
            unsigned int v57 = -[IDSSockAddrWrapper isEqualToWrapper:](v55, "isEqualToWrapper:", v56),
            v56,
            v57))
      {
        self->_shouldKeepWiFiUp = 1;

LABEL_66:
        id v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject", v67));
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 address]);
        [v39 reconnectWithLocalAddress:v43];

        goto LABEL_67;
      }
    }

    else
    {
      -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:]( self,  "_connectivityChangedForDefaultDevice:isCloudConnected:",  0LL,  self->_lastSentDefaultDeviceCloudConnectivity);
    }

    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
    id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 address]);
    [v39 reconnectWithLocalAddress:v60];

LABEL_101:
  }
}

- (void)currentLinkType:(unint64_t *)a3 andRATType:(unsigned int *)a4 forDeviceID:(id)a5
{
  id v8 = a5;
  *a3 = 0LL;
  *a4 = 0;
  if ([v8 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    *a3 = self->_currentDefaultDeviceLinkType;
  }

  else
  {
    Value = 0LL;
    if (v8 && self->_deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v8);
    }
    id v10 = Value;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      id v14 = [v10 defaultLinkType];
      *a3 = (unint64_t)v14;
      if (v14 == (id)4)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCellularLinkMonitor sharedInstance](&OBJC_CLASS___IDSCellularLinkMonitor, "sharedInstance"));
        *a4 = [v15 radioAccessTechnology];
      }

      else
      {
        *a4 = 0;
      }
    }

    else
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSUDPLink, v13);
      if ((objc_opt_isKindOfClass(v10, v16) & 1) != 0
        || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___IDSUDPGlobalLink, v17), (objc_opt_isKindOfClass(v10, v18) & 1) != 0))
      {
        *a3 = 2LL;
      }
    }

    uint64_t v19 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = *a3;
      uint64_t v22 = *a4;
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "LinkType %lu, RATType %lu for non-FaceTime clients",  buf,  0x16u);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"LinkType %lu, RATType %lu for non-FaceTime clients");
        if (_IDSShouldLog(0LL, @"LinkManager")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"LinkType %lu, RATType %lu for non-FaceTime clients");
        }
      }
    }
  }
}

- (id)linkForCBUUID:(id)a3
{
  Value = 0LL;
  if (a3)
  {
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, a3);
    }
  }

  return Value;
}

- (unint64_t)currentLinkType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
  }

  else
  {
    Value = 0LL;
    if (v4 && self->_deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v4);
    }
    id v7 = Value;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      unint64_t currentDefaultDeviceLinkType = (unint64_t)[v7 defaultLinkType];
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___IDSUDPLink, v10);
      if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0
        || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___IDSUDPGlobalLink, v12), (objc_opt_isKindOfClass(v7, v13) & 1) != 0))
      {
        unint64_t currentDefaultDeviceLinkType = 2LL;
      }

      else
      {
        unint64_t currentDefaultDeviceLinkType = 0LL;
      }
    }

    uint64_t v14 = OSLogHandleForTransportCategory("LinkManager");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = currentDefaultDeviceLinkType;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "current link type for %@ is %d.", buf, 0x12u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        _IDSLogTransport(@"LinkManager", @"IDS", @"current link type for %@ is %d.");
      }
    }
  }

  return currentDefaultDeviceLinkType;
}

- (id)_getIDSLinkTypeString:(unint64_t)a3
{
  if (a3 > 6) {
    return @"UnexpectedType";
  }
  else {
    return *(&off_1008FE978 + a3);
  }
}

- (unint64_t)_getIDSLinkTypeFromWRMLinkType:(unint64_t)a3
{
  if (a3 > 3) {
    return 6LL;
  }
  else {
    return qword_100717BE8[a3];
  }
}

- (unint64_t)_getWRMLinkTypeFromIDSLinkType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 2LL;
  }
  else {
    return qword_100717C08[a3 - 1];
  }
}

- (void)_handleWRMLinkRecommendation:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory("LinkManager");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WRM recommends the link type %u, but IDS ignores WRM recommendations per rdar://problem/33602915 discussion",  buf,  8u);
  }

  if (os_log_shim_legacy_logging_enabled(v6))
  {
    if (_IDSShouldLog(0LL, @"LinkManager")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"WRM recommends the link type %u, but IDS ignores WRM recommendations per rdar://problem/33602915 discussion");
    }
  }

- (void)_subscribeToWRMForLinkRecommendation:(unint64_t)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10023FE54;
  v8[3] = &unk_1008FE8F0;
  v8[4] = self;
  uint64_t v4 = objc_retainBlock(v8);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  [v5 subscribeForRecommendation:v7 recommendationType:a3 block:v4];
}

- (void)_unsubscribeFromWRMForLinkRecommendation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
  [v2 unsubscribeForRecommendation];
}

- (void)cellularRadioAccessTechnologyDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cellular RAT changed, usable: %@.", buf, 0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    uint64_t v10 = v3 ? @"YES" : @"NO";
    uint64_t v31 = v10;
    _IDSLogTransport(@"LinkManager", @"IDS", @"cellular RAT changed, usable: %@.");
    if (_IDSShouldLog(0LL, @"LinkManager"))
    {
      uint64_t v31 = v10;
      _IDSLogV(0LL, @"IDSFoundation", @"LinkManager", @"cellular RAT changed, usable: %@.");
    }
  }

  if (v3)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_cbuuidToLinks, "allKeys"));
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v12 = v11;
    uint64_t v13 = 0LL;
    id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v33;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(const void **)(*((void *)&v32 + 1) + 8LL * (void)v16);
          cbuuidToLinks = self->_cbuuidToLinks;
          if (cbuuidToLinks) {
            BOOL v19 = v17 == 0LL;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            id v20 = 0LL;
          }

          else
          {
            __int16 v21 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v17);
            id v20 = v21;
            if (v21)
            {
              int v22 = (id)CFDictionaryGetValue( (CFDictionaryRef)v21,  @"IDSLinkGlobalKey");

              if (v22)
              {
                uint64_t v24 = objc_opt_class(&OBJC_CLASS___IDSGlobalLink, v23);
                if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0) {
                  [v22 handleCellularRATChange];
                }
                uint64_t v13 = v22;
              }

              else
              {
                uint64_t v13 = 0LL;
              }
            }
          }

          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v14);
    }

    if (!self->_delayedDefaultDeviceAllocateRequest) {
      goto LABEL_41;
    }
    uint64_t v25 = OSLogHandleForTransportCategory("LinkManager");
    unint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (const __CFString *)kIDSDefaultPairedDeviceID;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "celluar data is usable, retry QR allocation for %@.",  buf,  0xCu);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((v28 & 1) != 0)
    {
      int v29 = _IDSShouldLogTransport(v28);
      uint64_t v30 = kIDSDefaultPairedDeviceID;
      if (v29)
      {
        uint64_t v31 = (__CFString *)kIDSDefaultPairedDeviceID;
        _IDSLogTransport( @"LinkManager",  @"IDS",  @"celluar data is usable, retry QR allocation for %@.");
        if (_IDSShouldLog(0LL, @"LinkManager"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"celluar data is usable, retry QR allocation for %@.");
          -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v30, v30);
LABEL_41:

          return;
        }
      }
    }

    else
    {
      uint64_t v30 = kIDSDefaultPairedDeviceID;
    }

    -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v30, v31);
    goto LABEL_41;
  }

- (void)cellularSoMaskDidChange:(unsigned int)a3
{
  uint64_t v5 = OSLogHandleForTransportCategory("LinkManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cellular SoMask changed: %u.", buf, 8u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"LinkManager", @"IDS", @"cellular SoMask changed: %u.");
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100240438;
  v10[3] = &unk_1008FE738;
  v10[4] = self;
  unsigned int v11 = a3;
  IDSTransportThreadAddBlock(v10, v9);
}

- (unint64_t)currentDefaultDeviceLinkType
{
  return self->_currentDefaultDeviceLinkType;
}

- (void).cxx_destruct
{
}

@end