@interface IDSUTunController
+ (IDSUTunController)sharedInstance;
- (BOOL)handleIncomingPacket:(id *)a3 fromDeviceToken:(id)a4;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)setupIPsecLinkForDeviceConnectionInfo:(id)a3;
- (BOOL)setupUTunForDeviceConnectionInfo:(id)a3;
- (IDSLinkManager)linkManager;
- (IDSUTunController)init;
- (IDSUTunController)initWithName:(id)a3 address:(id)a4 andTestTransport:(id)a5;
- (id)_prepareConnectionInfoWithCBUUID:(id)a3 deviceUniqueID:(id)a4 shouldUseIPsecLink:(BOOL)a5 identityPair:(id)a6 remoteDeviceEncryptionInfo:(id)a7;
- (id)controlChannelVersionForCbuuid:(id)a3;
- (id)copyLinkStatsDict;
- (id)defaultPairedDeviceIdentityPair;
- (id)onTransportThread_PerServiceDataTransferredForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataReceivedForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataSentForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataTransferredForDevice:(id)a3 services:(id)a4;
- (id)setupNewDeviceConnectionInfoForCbuuid:(id)a3 deviceUniqueID:(id)a4 identityPair:(id)a5 remoteDeviceEncryptionInfo:(id)a6 shouldUseIPsecLink:(BOOL)a7;
- (id)stringComponentsForServiceConnectorService:(id)a3;
- (int)processCompressionRequest:(id)a3 fromDeviceConnectionInfo:(id)a4;
- (int)processCompressionResponse:(id)a3 fromDeviceConnectionInfo:(id)a4;
- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBuffer:(id *)a4;
- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBufferArray:(id *)a4 arraySize:(int)a5;
- (unint64_t)onTransportThread_SendWithConnectionContext:(id)a3 packetBuffer:(id *)a4;
- (unint64_t)onTransportThread_createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)onTransportThread_getLinkType:(id)a3;
- (unint64_t)onTransportThread_participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)totalPacketsReceivedForDevice:(id)a3 services:(id)a4;
- (unint64_t)totalPacketsSentForDevice:(id)a3 services:(id)a4;
- (unsigned)handleUtunChannelWrite:(id)a3 source:(sockaddr *)a4 destination:(sockaddr *)a5 upperProtocol:(unsigned __int8)a6 bytes:(const void *)a7 bytesLen:(unint64_t)a8;
- (void)_getStallDetectorForConnection:(id)a3 deviceConnecionInfo:(id)a4;
- (void)_reloadSettings;
- (void)addPairedDevice:(id)a3;
- (void)addPairedDevice:(id)a3 shouldPairDirectlyOverIPsec:(BOOL)a4;
- (void)checkSuspendTrafficForDevice:(id)a3 wait:(BOOL)a4;
- (void)cleanupSocketsForClient:(id)a3;
- (void)clearCellInterfaceName:(id)a3;
- (void)clearIDSContextBlob:(id)a3;
- (void)clearPluginCacheForSession:(id)a3;
- (void)clearReliableUnicastStateForSession:(id)a3;
- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3;
- (void)clearStats;
- (void)closeDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4;
- (void)closeSocketWithOptions:(id)a3;
- (void)closeSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6;
- (void)connectPairedDevice:(id)a3;
- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5;
- (void)deletePairedDevice:(id)a3;
- (void)didConnectControlChannelForDeviceConnectionInfo:(id)a3 connection:(id)a4 error:(id)a5;
- (void)didUpdatePairedDevice:(id)a3;
- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5;
- (void)doCheckSuspendTrafficForDevice:(id)a3;
- (void)getLinkInformationForDevice:(id)a3 completionHandler:(id)a4;
- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5;
- (void)handleIPPayload:(const void *)a3 bytesLength:(unint64_t)a4 source:(sockaddr *)a5 destination:(sockaddr *)a6 upperProtocol:(unsigned __int8)a7 forDeviceConnectionInfo:(id)a8 flush:(BOOL)a9 callerShouldStop:(BOOL *)a10;
- (void)handleUtunChannelRead:(id)a3 limit:(unsigned int)a4;
- (void)internalOpenSocketWithDestination:(id)a3 localSA:(id)a4 remoteSA:(id)a5 protocol:(int)a6 trafficClass:(int)a7 completionHandler:(id)a8;
- (void)internalStartConnectionWithEndpoint:(id)a3 service:(const char *)a4 parameters:(id)a5 serviceConnector:(id)a6 completionHandler:(id)a7;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)obliterateConnectionInfoForCBUUID:(id)a3;
- (void)obliterateConnectionInfoForCBUUID:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5;
- (void)obliterateConnectionInfoWithCompletionBlock:(id)a3 completionQueue:(id)a4;
- (void)onTransportThread_CurrentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6;
- (void)onTransportThread_DropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5;
- (void)onTransportThread_SendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7;
- (void)onTransportThread_SendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5;
- (void)onTransportThread_SetDefaultUnderlyingLink:(id)a3 linkID:(char)a4;
- (void)onTransportThread_SetPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6;
- (void)onTransportThread_StopBTDatagramLinkForDefaultPairedDevice;
- (void)onTransportThread_StopKeepAlive:(id)a3 linkIDs:(id)a4;
- (void)onTransportThread_UpdateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5;
- (void)onTransportThread_flushLinkProbingStatus:(id)a3 options:(id)a4;
- (void)onTransportThread_getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6;
- (void)onTransportThread_manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6;
- (void)onTransportThread_queryLinkProbingStatus:(id)a3 options:(id)a4;
- (void)onTransportThread_receiveJoinNotificationFromAParticipant:(id)a3;
- (void)onTransportThread_registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5;
- (void)onTransportThread_removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)onTransportThread_reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5;
- (void)onTransportThread_reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6;
- (void)onTransportThread_requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4;
- (void)onTransportThread_requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5;
- (void)onTransportThread_sendConnectedLinkInfoToAVCForSessionID:(id)a3;
- (void)onTransportThread_sendStatsRequest:(id)a3 options:(id)a4;
- (void)onTransportThread_sendStatsRequestWithOptions:(id)a3 options:(id)a4;
- (void)onTransportThread_setClientUniquePID:(unint64_t)a3 sessionID:(id)a4;
- (void)onTransportThread_setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4;
- (void)onTransportThread_setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5;
- (void)onTransportThread_setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4;
- (void)onTransportThread_setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4;
- (void)onTransportThread_startLinkProbing:(id)a3 options:(id)a4;
- (void)onTransportThread_stopLinkProbing:(id)a3 options:(id)a4;
- (void)onTransportThread_updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)onTransportThread_updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6;
- (void)onTransportThread_updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6;
- (void)openSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)prepareControlChannelForDeviceConnectionInfo:(id)a3 genericConnection:(id)a4;
- (void)prepareDefaultPairedConnectionInfoWithDeviceUniqueID:(id)a3 shouldUseIPsecLink:(BOOL)a4;
- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5;
- (void)receiveControlChannelMessage:(id)a3 fromCbuuid:(id)a4 deviceUniqueID:(id)a5;
- (void)releasePortIfNecessary:(IDSPortMap *)a3 port:(unsigned __int16)a4;
- (void)reloadSettings;
- (void)removeConnection:(id)a3 fromDeviceConnectionInfo:(id)a4 removeCode:(int64_t)a5 removeReason:(id)a6;
- (void)resetAllConnectionsForDevice:(id)a3;
- (void)resetIPsecTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resetTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resetUTunTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resumeSocketWithOptions:(id)a3 shouldLogCall:(BOOL)a4;
- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5;
- (void)sendSuspendOTRNegotiationMessage:(id)a3;
- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5;
- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4;
- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4;
- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4;
- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4;
- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5;
- (void)setLinkPreferences:(id)a3;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4;
- (void)setTimeBase:(id)a3 forIDSSession:(id)a4;
- (void)setupDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4;
- (void)startCompressionForConnection:(id)a3 deviceConnectionInfo:(id)a4;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
- (void)startControlChannelWithDevice:(id)a3 endpoint:(id)a4;
- (void)startDataChannelWithDevice:(id)a3 genericConnection:(id)a4 serviceConnectorService:(id)a5 endpoint:(id)a6;
- (void)startGlobalLinkForDevice:(id)a3;
- (void)startLocalSetup;
- (void)startUDPGlobalLinkForDevice:(id)a3;
- (void)stopGlobalLinkForDevice:(id)a3;
- (void)stopUDPGlobalLinkForDevice:(id)a3;
- (void)suspendSocketWithOptions:(id)a3;
- (void)tearDownEncryptionForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
@end

@implementation IDSUTunController

+ (IDSUTunController)sharedInstance
{
  if (qword_1009C0B70 != -1) {
    dispatch_once(&qword_1009C0B70, &stru_100901538);
  }
  return (IDSUTunController *)(id)qword_1009C0B78;
}

- (void)reloadSettings
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10032494C;
  v2[3] = &unk_1008F7948;
  v2[4] = self;
  IDSTransportThreadAddBlock(v2, a2);
}

- (void)_reloadSettings
{
  self->_BOOL logPackets = IMGetDomainBoolForKey(@"com.apple.ids", @"utunLogPackets");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    int v5 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"utunEncrypt", 1LL);
    self->_BOOL encryptionEnabled = v5;
    self->_BOOL encryptionEnabled = IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"DisableUTunDataChannelEncryption",  v5 ^ 1u) ^ 1;
    self->_BOOL controlChannelEncryptionDisabled = IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"DisableUTunControlChannelEncryption",  0LL);
    self->_BOOL vifShouldReadMultiple = IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"utunReadMultiple",  0LL);
    uint64_t v6 = IMGetDomainValueForKey(@"com.apple.ids", @"utunReadMultipleMaxPackets");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = 16;
    }
    self->_unsigned int vifMaxPendingPackets = v9;

    if (self->_vifMaxPendingPackets >= 0x41) {
      self->_unsigned int vifMaxPendingPackets = 64;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults fixedInterface](&OBJC_CLASS___IMUserDefaults, "fixedInterface"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserDefaults fixedInterfaceDestination]( &OBJC_CLASS___IMUserDefaults,  "fixedInterfaceDestination"));
      self->_hasFixedDestination = v11 != 0LL;
    }

    else
    {
      self->_hasFixedDestination = 0;
    }

    self->_ignoreUTunChannelWriteSignal = IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"IgnoreUTunChannelWriteSignal",  0LL);
  }

  else
  {
    *(_WORD *)&self->_BOOL encryptionEnabled = 1;
  }

  self->_BOOL vifUseChannel = IMGetDomainBoolForKey(@"com.apple.ids", @"DisableSkywalkChannelForUtun") ^ 1;
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL logPackets = self->_logPackets;
    BOOL encryptionEnabled = self->_encryptionEnabled;
    BOOL controlChannelEncryptionDisabled = self->_controlChannelEncryptionDisabled;
    BOOL vifUseChannel = self->_vifUseChannel;
    BOOL vifShouldReadMultiple = self->_vifShouldReadMultiple;
    unsigned int vifMaxPendingPackets = self->_vifMaxPendingPackets;
    v19 = @"YES";
    if (!self->_ignoreUTunChannelWriteSignal) {
      v19 = @"NO";
    }
    int elementCount = self->_deviceConnectionInfoTableByCbuuid.elementCount;
    *(_DWORD *)buf = 67110914;
    BOOL v23 = logPackets;
    __int16 v24 = 1024;
    BOOL v25 = encryptionEnabled;
    __int16 v26 = 1024;
    BOOL v27 = controlChannelEncryptionDisabled;
    __int16 v28 = 1024;
    BOOL v29 = vifUseChannel;
    __int16 v30 = 1024;
    BOOL v31 = vifShouldReadMultiple;
    __int16 v32 = 1024;
    unsigned int v33 = vifMaxPendingPackets;
    __int16 v34 = 2112;
    v35 = v19;
    __int16 v36 = 1024;
    int v37 = elementCount;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Loaded settings: utunLogPackets:%d dataChannelEncryptionEnabled:%d controlChannelEncryptionDisabled:%d utunChannel :%d readmultiple:%d/%d ignoreUTunChannelWriteSignal:%@ (devices:%d)",  buf,  0x36u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100325CE0;
  v21[3] = &unk_100901580;
  v21[4] = self;
  sub_1003BBD80((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v21);
}

- (void)_getStallDetectorForConnection:(id)a3 deviceConnecionInfo:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a4 cbuuid]);
  unsigned int v8 = [v7 isEqualToString:kIDSDefaultPairedDeviceID];

  if (!v8) {
    goto LABEL_18;
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v10 = [v9 isInternalInstall];

  if (!v10) {
    goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionID]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionID]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
    unsigned int v14 = [v13 isEqualToString:@"localdelivery"];

    if (!v14) {
      goto LABEL_18;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionID]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
    unsigned int v17 = [v16 isEqualToString:@"UTunDelivery-Default-Urgent"];

    if (v17)
    {
      v18 = @"kUTunConnectionDefaultUrgentOutgoingDetectorName";
    }

    else
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionID]);
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
      unsigned int v26 = [v25 isEqualToString:@"UTunDelivery-Default-Default"];

      if (!v26) {
        goto LABEL_14;
      }
      v18 = @"kUTunConnectionDefaultDefaultOutgoingDetectorName";
    }
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 addressPair]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localAddress]);
    if ([v20 saPortHostOrder] != 1024)
    {

      goto LABEL_14;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 addressPair]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 remoteAddress]);
    unsigned int v23 = [v22 saPortHostOrder];

    if (!v23) {
      goto LABEL_14;
    }
    v18 = @"kUTunConnectionControlChannelOutgoingDetectorName";
  }

  [v6 setOutgoingStallDetectorName:v18];
  [v6 _createStallDetectorWithName:v18];
LABEL_14:
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v6 outgoingStallDetectorName]);

  if (v27)
  {
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v6 outgoingStallDetectorName]);
      int v30 = 138412546;
      BOOL v31 = self;
      __int16 v32 = 2112;
      unsigned int v33 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: created the stall detector for %@",  (uint8_t *)&v30,  0x16u);
    }
  }

- (void)handleIPPayload:(const void *)a3 bytesLength:(unint64_t)a4 source:(sockaddr *)a5 destination:(sockaddr *)a6 upperProtocol:(unsigned __int8)a7 forDeviceConnectionInfo:(id)a8 flush:(BOOL)a9 callerShouldStop:(BOOL *)a10
{
  int v10 = a7;
  unsigned int v14 = a8;
  if (a10) {
    *a10 = 0;
  }
  if (v10 == 17) {
    kdebug_trace(722010164LL, 0LL, 0LL, 0LL, 0LL);
  }
  v193 = self;
  if (a4 > 7)
  {
    if (v10 != 6 && v10 != 17)
    {
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  a4,  0LL));
        LODWORD(buf[0]) = 138412802;
        *(void *)((char *)buf + 4) = v23;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v10;
        WORD1(buf[1]) = 2112;
        *(void *)((char *)&buf[1] + 4) = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: dropping unknown proto[%u] packet [%@]",  (uint8_t *)buf,  0x1Cu);
      }

      if (a9) {
        goto LABEL_64;
      }
      goto LABEL_240;
    }

    if (self->_logPackets && v10 == 17 && byte_1009C0B80)
    {
      if (qword_1009C0BE0 != -1) {
        dispatch_once(&qword_1009C0BE0, &stru_100901B20);
      }
      uint64_t v18 = mach_continuous_time();
      if (a4 <= 0x27)
      {
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  a4,  0LL));
          LODWORD(buf[0]) = 138412802;
          *(void *)((char *)buf + 4) = v20;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v21;
          WORD3(buf[1]) = 2048;
          *((void *)&buf[1] + 1) = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: dropping packet %@ of length %zu",  (uint8_t *)buf,  0x20u);
        }

        if (a9) {
          goto LABEL_64;
        }
        goto LABEL_240;
      }

      if ((void)xmmword_1009C0B90 == *((void *)a3 + 1)
        && *((void *)&xmmword_1009C0B90 + 1) == *((void *)a3 + 2)
        && qword_1009C0BA0 == *((void *)a3 + 3)
        && unk_1009C0BA8 == *((void *)a3 + 4))
      {
        byte_1009C0B80 = 0;
        *(double *)&qword_1009C0B88 = *(double *)&qword_1009C0B68 * (double)v18;
        v46 = (void *)qword_1009C7520;
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunTimingLogger kernelTestEventWithTimestamp:kernelTime:bytes:]( &OBJC_CLASS___IDSUTunTimingLogger,  "kernelTestEventWithTimestamp:kernelTime:bytes:",  a4 - 8));
        [v46 addEvent:v47];

        goto LABEL_240;
      }

      if (*(double *)&qword_1009C0B68 * (double)v18 - (double)(unint64_t)qword_1009C0BB0 > 5.0)
      {
        byte_1009C0B80 = 0;
        *(double *)&qword_1009C0B88 = *(double *)&qword_1009C0B68 * (double)v18;
        __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "udp timing test: kernel test timed out",  (uint8_t *)buf,  2u);
        }

        self = v193;
      }
    }

    if (v10 == 17 && self->_logPackets)
    {
      qword_1009C0BC0 = mach_continuous_time();
      qword_1009C0BB8 = qword_1009C0BC0;
      self = v193;
    }

    if (v10 == 6)
    {
      if (a4 <= 0x13)
      {
        BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
          BOOL v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  a4,  0LL));
          LODWORD(buf[0]) = 138412802;
          *(void *)((char *)buf + 4) = v30;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v31;
          WORD3(buf[1]) = 1024;
          DWORD2(buf[1]) = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%@: dropping packet %@ of length %u",  (uint8_t *)buf,  0x1Cu);
        }

        if (a9) {
          goto LABEL_64;
        }
        goto LABEL_240;
      }

      int v186 = (*((unsigned __int8 *)a3 + 12) >> 2) & 0x3C;
      LODWORD(v187) = bswap32(*((_DWORD *)a3 + 1));
      HIDWORD(v187) = *((unsigned __int8 *)a3 + 13);
    }

    else
    {
      uint64_t v187 = 0LL;
      int v186 = 0;
    }

    unsigned int v188 = __rev16(*((unsigned __int16 *)a3 + 1));
    unsigned int v190 = __rev16(*(unsigned __int16 *)a3);
    if (self->_logPackets)
    {
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (a4 >= 0x28) {
          unint64_t v33 = 40LL;
        }
        else {
          unint64_t v33 = a4;
        }
        id v34 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
        id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  v33,  0LL));
        __int16 v36 = v35;
        LODWORD(buf[0]) = 138413826;
        int v37 = " ...";
        *(void *)((char *)buf + 4) = v34;
        if (a4 < 0x29) {
          int v37 = "";
        }
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v190;
        WORD1(buf[1]) = 1024;
        DWORD1(buf[1]) = v188;
        WORD4(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 10) = v10;
        HIWORD(buf[1]) = 2048;
        *(void *)&buf[2] = a4;
        WORD4(buf[2]) = 2112;
        *(void *)((char *)&buf[2] + 10) = v35;
        WORD1(buf[3]) = 2080;
        *(void *)((char *)&buf[3] + 4) = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@: Payload Handler! %u => %u proto:%d (len=%ld)\n\t\t=> data[%@%s]",  (uint8_t *)buf,  0x3Cu);
      }
    }

    if ([v14 suspendTraffic])
    {
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
        uint64_t v40 = v14[1];
        LODWORD(buf[0]) = 138412546;
        *(void *)((char *)buf + 4) = v39;
        WORD6(buf[0]) = 2112;
        *(void *)((char *)buf + 14) = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%@: device %@ is suspending traffic",  (uint8_t *)buf,  0x16u);
      }

      if (a9) {
        goto LABEL_64;
      }
      goto LABEL_240;
    }

    uint64_t v44 = sub_1003BB3A8((uint64_t)[v14 connectionsTableByLocalRemotePortKey], v188 | (v190 << 16));
    v192 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if (v192)
    {
      uint64_t v45 = 0LL;
      if (v10 == 17 && v193->_logPackets) {
        uint64_t v45 = mach_continuous_time();
      }
    }

    else
    {
      if (v10 != 6 || (v187 & 0x400000000LL) == 0)
      {
        uint64_t v60 = OSLogHandleForIDSCategory("UTun-oversized");
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
          LODWORD(buf[0]) = 138413058;
          *(void *)((char *)buf + 4) = v62;
          WORD6(buf[0]) = 1024;
          *(_DWORD *)((char *)buf + 14) = v190;
          WORD1(buf[1]) = 1024;
          DWORD1(buf[1]) = v188;
          WORD4(buf[1]) = 2112;
          *(void *)((char *)&buf[1] + 10) = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%@: cannot find connection for outgoing packet [%u => %u] in [%@]",  (uint8_t *)buf,  0x22u);
        }

        if (os_log_shim_legacy_logging_enabled(v63)
          && _IDSShouldLog(0LL, @"UTun-oversized"))
        {
          v184 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun-oversized",  @"%@: cannot find connection for outgoing packet [%u => %u] in [%@]");
        }

        if (v10 == 6)
        {
          memset(__n_4, 170, sizeof(__n_4));
          unsigned int v64 = *((_DWORD *)a3 + 2);
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          int v66 = bswap32(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0]) = 67109376;
            DWORD1(buf[0]) = v187;
            WORD4(buf[0]) = 1024;
            *(_DWORD *)((char *)buf + 10) = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "reset TCP using seq:%08x ack:%08x",  (uint8_t *)buf,  0xEu);
          }

          if ((v187 & 0x200000000LL) != 0) {
            int v67 = v187;
          }
          else {
            int v67 = v187 + 1;
          }
          sub_100327784((uint64_t)__n_4, v188, v190, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteSA]);
          v69 = (char *)[v68 sa6];
          v70 = (void *)objc_claimAutoreleasedReturnValue([v14 localSA]);
          tcp6checksum( (int8x16_t *)(v69 + 8),  (int8x16_t *)((char *)[v70 sa6] + 8),  (int8x16_t *)__n_4,  0x14uLL);

          if (v14[2079])
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteSA]);
            id v72 = [v71 sa];
            v73 = (void *)objc_claimAutoreleasedReturnValue([v14 localSA]);
            unsigned int v74 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:]( v193,  "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:",  v14,  v72,  [v73 sa],  6,  __n_4,  20);
          }

          else
          {
            id v167 = [v14 vifRef];
            v71 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteSA]);
            id v168 = [v71 sa];
            v73 = (void *)objc_claimAutoreleasedReturnValue([v14 localSA]);
            unsigned int v74 = NEVirtualInterfaceWriteIPPayload(v167, v168, [v73 sa], 6, __n_4, 20);
          }

          unsigned int v169 = v74;

          v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
          {
            v171 = (void *)objc_claimAutoreleasedReturnValue([v14 vifName]);
            v172 = (void *)objc_claimAutoreleasedReturnValue([v14 localSA]);
            v173 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteSA]);
            v174 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  __n_4,  20LL,  0LL));
            LODWORD(buf[0]) = 138413314;
            *(void *)((char *)buf + 4) = v171;
            WORD6(buf[0]) = 2112;
            *(void *)((char *)buf + 14) = v172;
            WORD3(buf[1]) = 2112;
            *((void *)&buf[1] + 1) = v173;
            LOWORD(buf[2]) = 1024;
            *(_DWORD *)((char *)&buf[2] + 2) = v169;
            WORD3(buf[2]) = 2112;
            *((void *)&buf[2] + 1) = v174;
            _os_log_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_DEFAULT,  "%@: write generated reset %@ <= %@ neRet=%d\n\t\t<= data[%@]",  (uint8_t *)buf,  0x30u);
          }
        }

        if (a9)
        {
          linkManager = v193->_linkManager;
          v176 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceUniqueID]);
          v177 = (void *)objc_claimAutoreleasedReturnValue([v14 cbuuid]);
          -[IDSLinkManager flushBuffer:toDeviceUniqueID:cbuuid:]( linkManager,  "flushBuffer:toDeviceUniqueID:cbuuid:",  0LL,  v176,  v177);
        }

        goto LABEL_239;
      }

      uint64_t v45 = 0LL;
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v192 compressionInfo]);
    if ((uint64_t)[v48 state] <= 1)
    {
    }

    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue([v192 compressionInfo]);
      BOOL v50 = [v49 localContext] == 0;

      if (!v50)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue([v192 compressionInfo]);
        unsigned int v185 = [v52 localCID];

        *(void *)__n_4 = a3;
        int __n = a4;
        v53 = (void *)objc_claimAutoreleasedReturnValue([v192 compressionInfo]);
        uint64_t v54 = IDSHC_Compress([v53 localContext], __n_4, &__n);

        if (v54)
        {
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            id v56 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
            LODWORD(buf[0]) = 138412546;
            *(void *)((char *)buf + 4) = v56;
            WORD6(buf[0]) = 2048;
            *(void *)((char *)buf + 14) = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%@: IDSHC_Compress failed (%lu), revert back to un-compressed",  (uint8_t *)buf,  0x16u);
          }
        }

        uint64_t v57 = *(void *)__n_4;
        if (v185 < 0x10)
        {
          --*(void *)__n_4;
          ++__n;
          if (v10 == 6) {
            char v75 = -96;
          }
          else {
            char v75 = 0x80;
          }
          *(_BYTE *)(v57 - 1) = v185 | v75;
        }

        else
        {
          *(void *)__n_4 -= 3LL;
          __n += 3;
          if (v10 == 6) {
            char v58 = -80;
          }
          else {
            char v58 = -112;
          }
          *(_BYTE *)(v57 - 3) = v58;
          *(_BYTE *)(*(void *)__n_4 + 1LL) = BYTE1(v185);
          *(_BYTE *)(*(void *)__n_4 + 2LL) = v185;
        }

        BOOL v76 = v54 == 0;
        v77 = (void *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  2084LL);
        memcpy((void *)*v77, *(const void **)__n_4, __n);
        v77[2] = __n;
        if (v76)
        {
          char v79 = 0;
          goto LABEL_109;
        }

        unsigned int v59 = v185;
LABEL_105:
        unsigned int v185 = v59;
        if (v10 == 6)
        {
          tcp6checksum(0LL, 0LL, (int8x16_t *)a3, a4);
          char v78 = 32;
        }

        else
        {
          udp6checksum(0LL, 0LL, (int8x16_t *)a3, a4, v51);
          char v78 = 0;
        }

        v77 = (void *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  2099LL);
        *(_BYTE *)void *v77 = v78;
        memcpy((void *)(*v77 + 1LL), a3, a4);
        v77[2] = a4 + 1;
        char v79 = 1;
LABEL_109:
        v80 = v193;
        BOOL logPackets = v193->_logPackets;
        if (v10 == 17 && v193->_logPackets)
        {
          qword_1009C0BD0 = mach_continuous_time() - v45;
          v80 = v193;
          BOOL logPackets = v193->_logPackets;
        }

        if (logPackets) {
          char v82 = v79;
        }
        else {
          char v82 = 1;
        }
        if ((v82 & 1) == 0)
        {
          unint64_t v83 = v77[2];
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            if (v83 >= 0x14) {
              uint64_t v85 = 20LL;
            }
            else {
              uint64_t v85 = v83;
            }
            id v86 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
            id v87 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  *v77,  v85,  0LL));
            v88 = v87;
            LODWORD(buf[0]) = 138414338;
            v89 = " ...";
            *(void *)((char *)buf + 4) = v86;
            *(_DWORD *)((char *)buf + 14) = 1;
            WORD6(buf[0]) = 1024;
            if (v83 < 0x15) {
              v89 = "";
            }
            WORD1(buf[1]) = 1024;
            DWORD1(buf[1]) = v10 == 6;
            WORD4(buf[1]) = 1024;
            *(_DWORD *)((char *)&buf[1] + 10) = v185;
            HIWORD(buf[1]) = 1024;
            LODWORD(buf[2]) = v190;
            WORD2(buf[2]) = 1024;
            *(_DWORD *)((char *)&buf[2] + 6) = v188;
            WORD5(buf[2]) = 2048;
            *(void *)((char *)&buf[2] + 12) = v83;
            WORD2(buf[3]) = 2112;
            *(void *)((char *)&buf[3] + 6) = v87;
            HIWORD(buf[3]) = 2080;
            *(void *)&uint8_t buf[4] = v89;
            _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "%@: outgoing header (compressed_bit:%d protocol_bit:%d local_cid:%d s_port:%u d_port:%u)\n \t\t=> c(%luB): [%@%s]",  (uint8_t *)buf,  0x48u);
          }

          v80 = v193;
        }

        if (v80->_encryptionEnabled && [v192 encryptionEnabled])
        {
          unsigned int v90 = [v192 seqSend];
          uint64_t v91 = sub_1001FD140((uint64_t)[v192 encryptionState], v90, (unsigned __int8 *)*v77, v77[2], 1);
          if ((_DWORD)v91)
          {
            id v92 = [v14 portMap];
            v93 = (void *)objc_claimAutoreleasedReturnValue([v192 addressPair]);
            v94 = (void *)objc_claimAutoreleasedReturnValue([v93 localAddress]);
            -[IDSUTunController releasePortIfNecessary:port:]( v193,  "releasePortIfNecessary:port:",  v92,  [v94 saPortHostOrder]);

            v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Encryption failure: %u",  v91));
            -[IDSUTunController removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:]( v193,  "removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:",  v192,  v14,  5301LL,  v95);

            _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  2122LL,  v77);
            if (a9)
            {
              v96 = v193->_linkManager;
              v97 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceUniqueID]);
              v98 = (void *)objc_claimAutoreleasedReturnValue([v14 cbuuid]);
              -[IDSLinkManager flushBuffer:toDeviceUniqueID:cbuuid:]( v96,  "flushBuffer:toDeviceUniqueID:cbuuid:",  0LL,  v97,  v98);
            }

            goto LABEL_239;
          }

          IDSLinkPacketBufferAddBufferStart(v77, 4294967288LL);
          v99 = (_BYTE *)*v77;
          v100 = (_BYTE *)*v77;
          *(_WORD *)void *v77 = 224;
          unsigned __int16 v101 = (unsigned __int16)[v192 seqSend];
          v100[2] = HIBYTE(v101);
          v99[3] = v101;
          unsigned int v102 = [v192 SSRCSend];
          v99[4] = HIBYTE(v102);
          v99[5] = BYTE2(v102);
          v99[6] = BYTE1(v102);
          v99[7] = v102;
          [v192 setSeqSend:(unsigned __int16)(v90 + 1)];
        }

        *((_BYTE *)v77 + 38) = [v192 isCloudEnabled];
        *((_BYTE *)v77 + 39) = [v192 isControlChannel];
        *((_BYTE *)v77 + 41) = [v192 isDefaultPairedDevice];
        else {
          unsigned __int8 v103 = [v192 isRealTime];
        }
        *((_BYTE *)v77 + 42) = v103;
        if (*((_BYTE *)v77 + 39))
        {
          char v104 = 99;
          goto LABEL_135;
        }

        *((_DWORD *)v77 + 305) = [v192 sdNumberNoClose];
        uint64_t v125 = (uint64_t)[v192 priority];
        if (v125 <= 299)
        {
          switch(v125)
          {
            case 0LL:
              char v104 = 45;
              goto LABEL_135;
            case 100LL:
              char v104 = 115;
              goto LABEL_135;
            case 200LL:
              char v104 = 100;
              goto LABEL_135;
          }
        }

        else if (v125 > 699)
        {
          if (v125 == 700)
          {
            char v104 = 118;
            goto LABEL_135;
          }

          if (v125 == 800)
          {
            char v104 = 97;
            goto LABEL_135;
          }
        }

        else
        {
          if (v125 == 300)
          {
            char v104 = 117;
            goto LABEL_135;
          }

          if (v125 == 600)
          {
            char v104 = 114;
            goto LABEL_135;
          }
        }

        char v104 = 63;
LABEL_135:
        *((_BYTE *)v77 + 1217) = v104;
        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        uint64_t v105 = mach_continuous_time();
        double v106 = *(double *)&qword_1009C0B68;
        v107 = (void *)objc_claimAutoreleasedReturnValue([v192 addressPair]);
        v108 = (void *)objc_claimAutoreleasedReturnValue([v107 localAddress]);
        double v109 = v106 * (double)v105;
        if ([v108 saPortHostOrder] == 1024)
        {
        }

        else
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue([v192 addressPair]);
          v111 = (void *)objc_claimAutoreleasedReturnValue([v110 remoteAddress]);
          BOOL v112 = [v111 saPortHostOrder] == 1024;

          if (!v112 && [v192 priority] != (id)300)
          {
            v113 = (void *)objc_claimAutoreleasedReturnValue([v14 highPriorityConnectionSendingSet]);
            BOOL v114 = [v113 count] == 0;

            if (!v114)
            {
              [v192 lastSuccessfulSentTime];
              BOOL v116 = v10 != 6;
              if (v109 - v115 > 0.5) {
                BOOL v116 = 1;
              }
              if (!v116)
              {
                if (v186 == (_DWORD)a4)
                {
                  if (!v193->_logPackets) {
                    goto LABEL_150;
                  }
                  v117 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                  {
                    id v118 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
                    id v119 = (id)objc_claimAutoreleasedReturnValue([v192 localConnectionGUID]);
                    v120 = (void *)objc_claimAutoreleasedReturnValue([v14 highPriorityConnectionSendingSet]);
                    LODWORD(buf[0]) = 138412802;
                    *(void *)((char *)buf + 4) = v118;
                    WORD6(buf[0]) = 2112;
                    *(void *)((char *)buf + 14) = v119;
                    WORD3(buf[1]) = 2112;
                    *((void *)&buf[1] + 1) = v120;
                    _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "%@: passing through low priority ack for [%@] - current busy high priority set(%@)",  (uint8_t *)buf,  0x20u);
                  }
                }

                else
                {
                  if (!v193->_logPackets) {
                    goto LABEL_150;
                  }
                  v117 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                  {
                    id v178 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
                    id v179 = (id)objc_claimAutoreleasedReturnValue([v192 localConnectionGUID]);
                    v180 = (void *)objc_claimAutoreleasedReturnValue([v14 highPriorityConnectionSendingSet]);
                    LODWORD(buf[0]) = 138412802;
                    *(void *)((char *)buf + 4) = v178;
                    WORD6(buf[0]) = 2112;
                    *(void *)((char *)buf + 14) = v179;
                    WORD3(buf[1]) = 2112;
                    *((void *)&buf[1] + 1) = v180;
                    _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "%@: cannot send low priority [%@] - current busy high priority set(%@)",  (uint8_t *)buf,  0x20u);
                  }
                }

LABEL_150:
                unsigned int v121 = [v192 stateFlags];
                uint64_t v122 = (int)v187 + (int)a4 - v186 + ((BYTE4(v187) & 2) >> 1);
                if ((v121 & 0x40) != 0)
                {
                }

                else
                {
                  [v192 setStateFlags:v121 | 0x40];
                  [v192 setExpectedNextOutgoingSequenceNumber:v122];
                  [v192 setConnectionSetupStartTime:sub_100321AD8()];
                  v123 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf[0]) = 138412290;
                    *(void *)((char *)buf + 4) = v192;
                    _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "First packet for connection %@",  (uint8_t *)buf,  0xCu);
                  }
                }

                v126 = v193;
                if (v193->_logPackets)
                {
                  v127 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                  {
                    id v128 = (id)objc_claimAutoreleasedReturnValue([v14 vifName]);
                    if ((v187 & 0x200000000LL) != 0) {
                      v129 = "S";
                    }
                    else {
                      v129 = "";
                    }
                    v130 = "R";
                    if ((v187 & 0x400000000LL) == 0) {
                      v130 = "";
                    }
                    v189 = v130;
                    v191 = v129;
                    if ((v187 & 0x800000000LL) != 0) {
                      v131 = "P";
                    }
                    else {
                      v131 = "";
                    }
                    if ((v187 & 0x1000000000LL) != 0) {
                      v132 = ".";
                    }
                    else {
                      v132 = "";
                    }
                    unsigned int v133 = [v192 expectedNextOutgoingSequenceNumber];
                    LODWORD(buf[0]) = 138414082;
                    *(void *)((char *)buf + 4) = v128;
                    WORD6(buf[0]) = 1024;
                    *(_DWORD *)((char *)buf + 14) = a4;
                    WORD1(buf[1]) = 1024;
                    DWORD1(buf[1]) = HIDWORD(v187);
                    WORD4(buf[1]) = 2080;
                    *(void *)((char *)&buf[1] + 10) = v191;
                    WORD1(buf[2]) = 2080;
                    *(void *)((char *)&buf[2] + 4) = v189;
                    WORD6(buf[2]) = 2080;
                    *(void *)((char *)&buf[2] + 14) = v131;
                    WORD3(buf[3]) = 2080;
                    *((void *)&buf[3] + 1) = v132;
                    LOWORD(buf[4]) = 1024;
                    *(_DWORD *)((char *)&buf[4] + 2) = v133;
                    _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "%@: Sending TCP %uB (flags[%02X] [%s%s%s%s])) noseq:%08x",  (uint8_t *)buf,  0x46u);
                  }

                  v126 = v193;
                }

                if (!v126->_isSimulateResetLoopTest && (v187 & 0x200000000LL) != 0 && (v187 & 0x1000000000LL) == 0)
                {
                  v134 = (void *)objc_claimAutoreleasedReturnValue([v14 controlChannel]);
                  unsigned int v135 = [v134 didReceiveReestablishmentRequest];

                  if (v135)
                  {
                    double v136 = sub_100321AD8();
                    v137 = (void *)objc_claimAutoreleasedReturnValue([v14 controlChannel]);
                    [v137 reestablishmentRequestReceiveTime];
                    BOOL v139 = v136 - v138 < 30.0;

                    if (v139)
                    {
                      v140 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
                      {
                        LODWORD(buf[0]) = 138412290;
                        *(void *)((char *)buf + 4) = v192;
                        _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEFAULT,  "Dropped SYN and wait for outgoing SYNACK for connection %@",  (uint8_t *)buf,  0xCu);
                      }

                      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  2274LL,  v77);
                      goto LABEL_239;
                    }

                    v141 = (void *)objc_claimAutoreleasedReturnValue([v14 controlChannel]);
                    [v141 setDidReceiveReestablishmentRequest:0];

                    v142 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
                    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0]) = 138412290;
                      *(void *)((char *)buf + 4) = v192;
                      _os_log_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_DEFAULT,  "Reset control channel didReceiveReestablishmentRequest for connection %@",  (uint8_t *)buf,  0xCu);
                    }
                  }
                }

- (void)handleUtunChannelRead:(id)a3 limit:(unsigned int)a4
{
  id v6 = a3;
  id v7 = [v6 utunChannel];
  id v8 = [v6 utunChannelRxRing];
  unsigned int v9 = os_channel_available_slot_count(v8);
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v23 = v10;
  __int128 v24 = v10;
  __int128 v21 = v10;
  __int128 v22 = v10;
  char v20 = 0;
  if (v9)
  {
    unsigned int v11 = v9;
    if (a4) {
      unsigned int v12 = a4;
    }
    else {
      unsigned int v12 = -1;
    }
    if (v9 >= v12) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v9;
    }
    uint64_t next_slot = os_channel_get_next_slot(v8, 0LL, &v21);
    if (!next_slot) {
      sub_1006A86AC();
    }
    unsigned int v15 = 1;
    do
    {
      uint64_t v16 = next_slot;
      ++v6[4166];
      if (WORD1(v21) >= 4uLL && *(_DWORD *)v22 == 503316480)
      {
        LOBYTE(v19) = v13 == v15;
        -[IDSUTunController handleIPPayload:bytesLength:source:destination:upperProtocol:forDeviceConnectionInfo:flush:callerShouldStop:]( self,  "handleIPPayload:bytesLength:source:destination:upperProtocol:forDeviceConnectionInfo:flush:callerShouldStop:",  (void)v22 + 44LL,  WORD1(v21) - 44LL,  0LL,  0LL,  *(unsigned __int8 *)(v22 + 10),  v6,  v19,  &v20);
      }

      uint64_t next_slot = os_channel_get_next_slot(v8, v16, &v21);
      if (!next_slot) {
        break;
      }
      if (v15 >= v13) {
        break;
      }
      ++v15;
    }

    while (!v20);
    os_channel_advance_slot(v8, v16);
    if (v20) {
      goto LABEL_17;
    }
    unsigned int v17 = [v6 utunChannelRxCount];
    unsigned int v18 = [v6 utunChannelRxRingSize] >> 1;
    if (v13 < v18) {
      unsigned int v18 = v13;
    }
    if (v11 < 2 || v17 >= v18)
    {
LABEL_17:
      [v6 setUtunChannelRxCount:0];
      os_channel_sync(v7, 1LL);
    }
  }
}

- (unsigned)handleUtunChannelWrite:(id)a3 source:(sockaddr *)a4 destination:(sockaddr *)a5 upperProtocol:(unsigned __int8)a6 bytes:(const void *)a7 bytesLen:(unint64_t)a8
{
  unsigned int v14 = (double *)a3;
  id v15 = [v14 utunChannel];
  id v16 = [v14 utunChannelTxRing];
  int v17 = os_channel_available_slot_count(v16);
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v41 = v18;
  __int128 v42 = v18;
  __int128 v39 = v18;
  __int128 v40 = v18;
  if (!v17)
  {
    if (v14[2084] == 0.0)
    {
      BOOL v33 = !self->_ignoreUTunChannelWriteSignal;
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v39));
      BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "handleUtunChannelWrite: utun has no slots",  buf,  2u);
        }

        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        v14[2084] = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
        uint64_t fd = os_channel_get_fd(*((void *)v14 + 2079), v36);
        IDSTransportThreadResumeSocket(fd, 2LL);
        goto LABEL_33;
      }

      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "handleUtunChannelWrite: utun has no slots but do not arm write signal for testing",  buf,  2u);
      }
    }

    else
    {
      if (qword_1009C0BE0 != -1) {
        dispatch_once(&qword_1009C0BE0, &stru_100901B20);
      }
      uint64_t v29 = mach_continuous_time();
      double v30 = *(double *)&qword_1009C0B68;
      double v31 = v14[2084];
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v39));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v44 = v30 * (double)v29 - v31;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "handleUtunChannelWrite: utun has no slots for %0.6lfs",  buf,  0xCu);
      }
    }

LABEL_33:
    unsigned __int8 v35 = 0;
    goto LABEL_34;
  }

  if (a4->sa_family != 30 || a5->sa_family != 30)
  {
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v39));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second",  buf,  2u);
    }

    uint64_t v25 = OSLogHandleForIDSCategory("Warning");
    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v27))
    {
      _IDSWarnV( @"IDSFoundation",  @"problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second");
      _IDSLogTransport( @"Warning",  @"IDS",  @"problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second");
    }

    uint64_t v28 = sleep(1u);
    throwsIDSAbortException();
    goto LABEL_33;
  }

  uint64_t next_slot = os_channel_get_next_slot(v16, 0LL, &v39);
  if (!next_slot) {
    sub_1006A86D4();
  }
  uint64_t v20 = v40;
  *(_DWORD *)__int128 v40 = 503316480;
  *(_OWORD *)(v20 + 4) = 0u;
  *(_OWORD *)(v20 + 20) = 0u;
  *(void *)(v20 + 36) = 0LL;
  *(sockaddr *)(v20 + 12) = *(sockaddr *)&a4->sa_data[6];
  *(sockaddr *)(v20 + 28) = *(sockaddr *)&a5->sa_data[6];
  *(_WORD *)(v20 + 8) = bswap32(a8) >> 16;
  *(_BYTE *)(v20 + 10) = a6;
  *(_BYTE *)(v20 + 4) |= 0x60u;
  *(void *)&double v21 = (v20 + 44 - v40 + a8);
  if (LODWORD(v21) > objc_msgSend(v14, "utunChannelMaxSlotSize", v39))
  {
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [v14 utunChannelMaxSlotSize];
      *(_DWORD *)buf = 134218240;
      double v44 = v21;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "problem: handleUtunChannelWrite: packet too large %lu > %lu",  buf,  0x16u);
    }

    goto LABEL_33;
  }

  memmove((void *)(v20 + 44), a7, a8);
  LOWORD(v39) = 0;
  WORD1(v39) = LOWORD(v21);
  os_channel_set_slot_properties(v16, next_slot, &v39);
  os_channel_advance_slot(v16, next_slot);
  os_channel_sync(v15, 0LL);
  unsigned __int8 v35 = 1;
LABEL_34:

  return v35;
}

- (BOOL)setupUTunForDeviceConnectionInfo:(id)a3
{
  v108 = (unsigned int *)a3;
  memset(v125, 170, 20);
  unint64_t v124 = 0xAAAAAAAAAAAAAAAALL;
  v3 = (const void *)NEVirtualInterfaceCreate(kCFAllocatorDefault, 1LL, 0LL, 0LL);
  if (v3)
  {
LABEL_7:
    id v7 = (os_log_s *)NEVirtualInterfaceCopyName(v3);
    [v108 setVifName:v7];
    [v108 setVifRef:v3];
    LODWORD(v125[2]) = 0;
    v125[1] = 0LL;
    unint64_t v124 = 7708LL;
    v125[0] = 33022LL;
    arc4random_buf(&v125[1], 8uLL);
    *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v135 + 14) = v8;
    *(_OWORD *)v134 = v8;
    v135[0] = v8;
    inet_ntop(30, v125, v134, 0x1Cu);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v134));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"%"]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:v7]);

    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v108 vifName]);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  &v124));
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(void *)v127 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: generated [%@] => [%@]", buf, 0x20u);
    }

    uint64_t v15 = NEVirtualInterfaceDupSocket(v3);
    if ((v15 & 0x80000000) == 0)
    {
      [v108 setUtunSocket:v15];
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v108 cbuuid]);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Get raw socket %d for device %@",  buf,  0x12u);
      }

      NEVirtualInterfaceSetReadAutomatically(v3, 0LL);
      __int128 v18 = self;
      if (!self->_vifUseChannel) {
        goto LABEL_35;
      }
      memset(buf, 170, 16);
      v116[0] = 16;
      int v123 = 1;
      if (setsockopt(v15, 2, 17, &v123, 4u) != -1)
      {
        if (getsockopt(v15, 2, 18, buf, v116) != -1)
        {
          uint64_t v19 = os_channel_attr_create();
          if (v19)
          {
            uint64_t extended = os_channel_create_extended(buf, 0LL, 0LL, 0xFFFFFFFFLL, v19);
            if (extended)
            {
              *(void *)&v117.ai_flags = 0LL;
              *(void *)uuid_string_t out = 0LL;
              os_channel_attr_get(v19, 4LL, &v117);
              if (*(void *)&v117.ai_flags <= 0x5DCuLL) {
                sub_1006A86FC();
              }
              os_channel_attr_get(v19, 3LL, out);
              if (!*(void *)out) {
                sub_1006A8724();
              }
              double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v122 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "use skywalk channel for utun",  v122,  2u);
              }

              [v108 setUtunNexusUUID:buf];
              [v108 setUtunChannel:extended];
              [v108 setUtunChannelMaxSlotSize:v117.ai_flags];
              uint64_t v22 = os_channel_ring_id(extended, 0LL);
              objc_msgSend(v108, "setUtunChannelTxRing:", os_channel_tx_ring(extended, v22));
              uint64_t v23 = os_channel_ring_id(extended, 2LL);
              objc_msgSend(v108, "setUtunChannelRxRing:", os_channel_rx_ring(extended, v23));
              [v108 setUtunChannelRxRingSize:*(unsigned int *)out];
              os_channel_attr_destroy(v19, v24);
LABEL_53:
              int v48 = NEVirtualInterfaceSetMTU(v3, 1380LL);
              int v49 = *__error();
              BOOL v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v51 = objc_claimAutoreleasedReturnValue([v108 vifName]);
                v52 = (void *)v51;
                if (v48) {
                  int v53 = 0;
                }
                else {
                  int v53 = v49;
                }
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v51;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1380;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v48;
                *(_WORD *)v127 = 1024;
                *(_DWORD *)&v127[2] = v53;
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%@: set mtu=%d %d (%d)",  buf,  0x1Eu);
              }

              int v54 = NEVirtualInterfaceAddAddress(v3, v11, 0LL);
              int v55 = *__error();
              id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v57 = objc_claimAutoreleasedReturnValue([v108 vifName]);
                char v58 = (void *)v57;
                if (v54) {
                  int v59 = 0;
                }
                else {
                  int v59 = v55;
                }
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v57;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v11;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)v127 = v54;
                *(_WORD *)&v127[4] = 1024;
                *(_DWORD *)&v127[6] = v59;
                _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%@: addaddress [%@] %d (%d)",  buf,  0x22u);
              }

              int v60 = NEVirtualInterfaceSetRankNever(v3, 1LL);
              int v61 = *__error();
              v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v63 = objc_claimAutoreleasedReturnValue([v108 vifName]);
                unsigned int v64 = (void *)v63;
                if (v60) {
                  int v65 = 0;
                }
                else {
                  int v65 = v61;
                }
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v63;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v60;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v65;
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%@: set rank never %d (%d)",  buf,  0x18u);
              }

              int updated = NEVirtualInterfaceUpdateAdHocService(v3);
              int v67 = *__error();
              v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v69 = objc_claimAutoreleasedReturnValue([v108 vifName]);
                v70 = (void *)v69;
                if (updated) {
                  int v71 = 0;
                }
                else {
                  int v71 = v67;
                }
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v69;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = updated;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v71;
                _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "%@: update adhoc service %d (%d)",  buf,  0x18u);
              }

              memset(&v117, 0, sizeof(v117));
              *(void *)BOOL v116 = 0xAAAAAAAAAAAAAAAALL;
              v117.ai_flags = 4;
              int v72 = getaddrinfo( (const char *)[v11 UTF8String], 0, &v117, (addrinfo **)v116);
              BOOL v27 = v72 == 0;
              if (v72)
              {
                v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue([v108 vifName]);
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v74;
                  _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "%@: getaddrinfo failed!!",  buf,  0xCu);
                }

                NEVirtualInterfaceInvalidate(v3);
                close(v15);
                CFRelease(v3);
              }

              else
              {
                char v75 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  *(void *)(*(void *)v116 + 32LL)));
                [v108 setLocalSA:v75];

                freeaddrinfo(*(addrinfo **)v116);
                BOOL v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  v77 = (void *)objc_claimAutoreleasedReturnValue([v108 vifName]);
                  char v78 = (void *)objc_claimAutoreleasedReturnValue([v108 localSA]);
                  char v79 = (void *)objc_claimAutoreleasedReturnValue([v108 localSA]);
                  int v80 = *((_DWORD *)[v79 sa6] + 6);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v77;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v78;
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)v127 = v80;
                  _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "%@: result localSA: [%@ @ %u]",  buf,  0x1Cu);
                }

                v81 = (void *)objc_claimAutoreleasedReturnValue([v108 localSA]);
                char v82 = [v81 sa6];
                LODWORD(v125[2]) = 0;
                v125[1] = 0LL;
                unint64_t v124 = 7708LL;
                v125[0] = 33022LL;
                if (v82) {
                  LODWORD(v125[2]) = v82[6];
                }
                arc4random_buf(&v125[1], 8uLL);

                unint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  &v124));
                [v108 setRemoteSA:v83];

                *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
                *(void *)&__int128 v84 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v84 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)uuid_string_t out = v84;
                *(_OWORD *)&out[16] = v84;
                uuid_unparse_upper((const unsigned __int8 *)[v108 selfInstanceID], out);
                uint64_t v85 = OSLogHandleForTransportCategory("UTun-oversized");
                id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  id v87 = (id)objc_claimAutoreleasedReturnValue([v108 vifName]);
                  id v88 = (id)objc_claimAutoreleasedReturnValue([v108 cbuuid]);
                  id v89 = (id)objc_claimAutoreleasedReturnValue([v108 deviceUniqueID]);
                  unsigned int v90 = (void *)objc_claimAutoreleasedReturnValue([v108 remoteSA]);
                  *(_DWORD *)buf = 138413570;
                  *(void *)&uint8_t buf[4] = v87;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v88;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)v127 = v89;
                  *(_WORD *)&v127[8] = 2112;
                  id v128 = v90;
                  __int16 v129 = 2080;
                  v130 = out;
                  __int16 v131 = 2112;
                  v132 = v108;
                  _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "%@: created mapping [%@ / %@] <=> [%@] (selfInstanceID[%s] %@)",  buf,  0x3Eu);
                }

                uint64_t v92 = os_log_shim_legacy_logging_enabled(v91);
                if ((_DWORD)v92)
                {
                  if (_IDSShouldLogTransport(v92))
                  {
                    v94 = (void *)objc_claimAutoreleasedReturnValue([v108 vifName]);
                    v95 = (void *)objc_claimAutoreleasedReturnValue([v108 cbuuid]);
                    unsigned __int8 v103 = (void *)objc_claimAutoreleasedReturnValue([v108 deviceUniqueID]);
                    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v108 remoteSA]);
                    _IDSLogTransport( @"UTun-oversized",  @"IDS",  @"%@: created mapping [%@ / %@] <=> [%@] (selfInstanceID[%s] %@)");

                    if (_IDSShouldLog(0LL, @"UTun-oversized"))
                    {
                      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "vifName", v94, v95, v103, v105, out, v108));
                      v97 = (void *)objc_claimAutoreleasedReturnValue([v108 cbuuid]);
                      char v104 = (void *)objc_claimAutoreleasedReturnValue([v108 deviceUniqueID]);
                      double v106 = (void *)objc_claimAutoreleasedReturnValue([v108 remoteSA]);
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun-oversized",  @"%@: created mapping [%@ / %@] <=> [%@] (selfInstanceID[%s] %@)");
                    }
                  }
                }

                v98 = v108;
                uint64_t v99 = *((void *)v108 + 2079);
                if (v99)
                {
                  uint64_t fd = os_channel_get_fd(v99, v93);
                  v98 = v108;
                }

                else
                {
                  uint64_t fd = v108[4152];
                }

                v112[0] = _NSConcreteStackBlock;
                v112[1] = 3221225472LL;
                v112[2] = sub_10032B028;
                v112[3] = &unk_1008F88C0;
                v113 = v98;
                BOOL v114 = self;
                int v115 = fd;
                v109[0] = _NSConcreteStackBlock;
                v109[1] = 3221225472LL;
                v109[2] = sub_10032B1D0;
                v109[3] = &unk_1008F78D8;
                unsigned __int16 v101 = v113;
                v110 = v101;
                int v111 = fd;
                IDSTransportThreadAddSocket(fd, v112, v109);
                objc_msgSend( v101,  "setLinkLayerConnected:",  -[IDSLinkManager isConnectedToDeviceID:]( self->_linkManager,  "isConnectedToDeviceID:",  *((void *)v101 + 1)));
              }

              goto LABEL_91;
            }

            int v123 = 0;
            setsockopt(v15, 2, 17, &v123, 4u);
            self->_BOOL vifUseChannel = 0;
            os_channel_attr_destroy(v19, v30);
            goto LABEL_34;
          }

          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v117.ai_flags) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "setupUTunForDeviceConnectionInfo: os_channel_attr_create failed",  (uint8_t *)&v117,  2u);
          }

LABEL_25:
          BOOL v27 = 0;
LABEL_91:

          goto LABEL_92;
        }

        int v123 = 0;
        setsockopt(v15, 2, 17, &v123, 4u);
        self->_BOOL vifUseChannel = 0;
      }

- (void)startDataChannelWithDevice:(id)a3 genericConnection:(id)a4 serviceConnectorService:(id)a5 endpoint:(id)a6
{
  id v10 = a3;
  unsigned int v11 = (nw_parameters *)a4;
  unsigned int v12 = (nw_parameters *)a5;
  unsigned int v13 = (nw_endpoint *)a6;
  __int128 v84 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunController stringComponentsForServiceConnectorService:]( self,  "stringComponentsForServiceConnectorService:",  v12));
  if ((unint64_t)[v84 count] <= 2)
  {
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      nw_parameters_t v97 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: service string %@ needs to have 3 components",  buf,  0xCu);
    }
  }

  unint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v84 objectAtIndex:0]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v84 objectAtIndex:1]);
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectAtIndex:2]);
  id v86 = v15;
  else {
    int v16 = 4;
  }
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceConnectionCache]);
    *(_DWORD *)buf = 138413058;
    nw_parameters_t v97 = v11;
    __int16 v98 = 2112;
    uint64_t v99 = v12;
    __int16 v100 = 2112;
    unsigned __int16 v101 = v13;
    __int16 v102 = 2112;
    unsigned __int8 v103 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: startDataChannelWithDevice called with generic connection %@ for service %@ and endpoint %@ connection-cache %@",  buf,  0x2Au);
  }

  char v82 = v13;
  int v80 = v12;
  if (![v10 shouldUseIPsecLink])
  {
    v81 = 0LL;
    v77 = 0LL;
    goto LABEL_33;
  }

  else {
    unsigned int v19 = 0;
  }
  id v20 = [v86 isEqualToString:@"localdelivery"];
  else {
    uint64_t v22 = 4LL;
  }
  if (_IDSSupportsDirectMessaging(v20, v21)
    && -[nw_parameters isDirectMsgChannel](v11, "isDirectMsgChannel"))
  {
    int v23 = v16;
    if (-[nw_parameters dataProtectionClass](v11, "dataProtectionClass") == 2)
    {
      uint64_t v22 = 4LL;
    }

    else if (-[nw_parameters dataProtectionClass](v11, "dataProtectionClass"))
    {
      uint64_t v22 = v22;
    }

    else
    {
      uint64_t v22 = 3LL;
    }
  }

  else
  {
    int v23 = v16;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "61314"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceConnector]);
  if (v19)
  {
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      nw_parameters_t v97 = (nw_parameters_t)v86;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: calling internalStartConnectionWithEndpoint with cloud option for service %@",  buf,  0xCu);
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "61315"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v10 cloudServiceConnector]);

    v81 = (void *)v27;
    uint64_t v24 = (void *)v26;
  }

  if (v82)
  {
    uint64_t v28 = v82;
LABEL_32:

    v77 = v28;
    int v16 = v23;
LABEL_33:
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472LL;
    v87[2] = sub_10032BC78;
    v87[3] = &unk_100901710;
    id v79 = v10;
    int v36 = (os_log_s *)v10;
    id v88 = v36;
    char v78 = v11;
    int v37 = v11;
    id v89 = v37;
    id v90 = v83;
    id v91 = v86;
    int v95 = v16;
    id v92 = v85;
    uint64_t v93 = self;
    int v38 = v12;
    v94 = v38;
    __int128 v39 = objc_retainBlock(v87);
    if (-[os_log_s shouldUseIPsecLink](v36, "shouldUseIPsecLink"))
    {
      if (v37)
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceConnectionCache](v36, "serviceConnectionCache"));
        nw_parameters_t v41 = (nw_parameters_t)objc_claimAutoreleasedReturnValue([v40 objectForKey:v38]);

        if (v41)
        {
          __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            nw_parameters_t v97 = v41;
            __int16 v98 = 2112;
            uint64_t v99 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: found service connection %@ in cache for service %@",  buf,  0x16u);
          }

          -[nw_parameters setServiceConnection:](v37, "setServiceConnection:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceConnectionCache](v36, "serviceConnectionCache"));
          [v43 removeObjectForKey:v38];

          ((void (*)(void *, void, void, void, void, uint64_t, void, nw_parameters_t, void))v39[2])( v39,  0LL,  0LL,  0LL,  0LL,  0xFFFFFFFFLL,  0LL,  v41,  0LL);
          goto LABEL_40;
        }

        if (-[nw_parameters protocol](v37, "protocol") == 17)
        {
          int v49 = (void *)objc_claimAutoreleasedReturnValue(-[nw_parameters addressPair](v37, "addressPair"));
          BOOL v50 = (void *)objc_claimAutoreleasedReturnValue([v49 remoteAddress]);
          uint64_t v51 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  [v50 saPortHostOrder]));

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[nw_parameters addressPair](v37, "addressPair"));
          int v53 = (void *)objc_claimAutoreleasedReturnValue([v52 localAddress]);
          uint64_t v54 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  [v53 saPortHostOrder]));

          int v55 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v56 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 pairedDeviceUUIDString]);
          char v58 = v55;
          int v59 = (void *)v54;
          int v60 = -[NSUUID initWithUUIDString:](v58, "initWithUUIDString:", v57);

          char v75 = v60;
          id v74 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]( &OBJC_CLASS___NRDeviceIdentifier,  "newDeviceIdentifierWithBluetoothUUID:",  v60);
          BOOL v76 = (void *)v51;
          id v61 = [[NREndpoint alloc] initWithDeviceIdentifier:v74 portString:v51 dataProtectionClass:4];
          id v72 = [[NRParametersPhoneCallRelay alloc] initWithLocalPort:v59];
          v62 = (nw_parameters *)[v72 copyParameters];
          v73 = v61;
          uint64_t v63 = (nw_endpoint *)[v61 copyEndpoint];
          unsigned int v64 = v62;
          nw_connection_t v65 = nw_connection_create(v63, v62);
          int v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            nw_parameters_t v97 = v65;
            __int16 v98 = 2112;
            uint64_t v99 = v38;
            __int16 v100 = 2112;
            unsigned __int16 v101 = v63;
            __int16 v102 = 2112;
            unsigned __int8 v103 = v59;
            __int16 v104 = 2112;
            uint64_t v105 = v76;
            _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: create udp connection %@ for service %@ endpoint %@ localPort %@ remotePort %@",  buf,  0x34u);
          }

          if (v65)
          {
            int v67 = 0LL;
          }

          else
          {
            uint64_t v69 = v59;
            v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to create udp connection for %@",  v38));
            int v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v70,  NSLocalizedDescriptionKey));
            int v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSUTun",  5071LL,  v71));

            int v59 = v69;
          }

          uint64_t v24 = v77;
          ((void (*)(void *, void, void, void, void, uint64_t, void, nw_connection_t, void *))v39[2])( v39,  0LL,  0LL,  0LL,  0LL,  0xFFFFFFFFLL,  0LL,  v65,  v67);

          int v48 = v81;
          goto LABEL_47;
        }
      }

      int v48 = v81;
      -[nw_parameters setServiceConnector:](v37, "setServiceConnector:", v81);
      uint64_t v24 = v77;
      -[nw_parameters setDefaultPairedDeviceEndpoint:](v37, "setDefaultPairedDeviceEndpoint:", v77);
      nw_parameters_t v41 = nw_parameters_create();
      nw_parameters_set_traffic_class(v41, 900LL);
      -[IDSUTunController internalStartConnectionWithEndpoint:service:parameters:serviceConnector:completionHandler:]( self, "internalStartConnectionWithEndpoint:service:parameters:serviceConnector:completionHandler:", v77, -[nw_parameters UTF8String](v38, "UTF8String"), v41, v81, v39);
      goto LABEL_47;
    }

    uint64_t v44 = *((void *)v36 + 1);
    nw_parameters_t v41 = (nw_parameters_t)objc_claimAutoreleasedReturnValue(-[nw_parameters addressPair](v37, "addressPair"));
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[nw_parameters localAddress](v41, "localAddress"));
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[nw_parameters addressPair](v37, "addressPair"));
    int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 remoteAddress]);
    -[IDSUTunController internalOpenSocketWithDestination:localSA:remoteSA:protocol:trafficClass:completionHandler:]( self,  "internalOpenSocketWithDestination:localSA:remoteSA:protocol:trafficClass:completionHandler:",  v44,  v45,  v47,  -[nw_parameters protocol](v37, "protocol"),  TrafficClassForIDSOpenSocketPriorityLevel(-[nw_parameters priority](v37, "priority")),  v39);

LABEL_40:
    int v48 = v81;
    uint64_t v24 = v77;
LABEL_47:

    v68 = v88;
    uint64_t v29 = v78;
    id v10 = v79;
    goto LABEL_48;
  }

  uint64_t v29 = v11;
  uint64_t v30 = objc_alloc(&OBJC_CLASS___NSUUID);
  double v31 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 pairedDeviceUUIDString]);
  int v33 = -[NSUUID initWithUUIDString:](v30, "initWithUUIDString:", v32);

  if (v33)
  {
    id v34 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]( &OBJC_CLASS___NRDeviceIdentifier,  "newDeviceIdentifierWithBluetoothUUID:",  v33);
    id v35 = [[NREndpoint alloc] initWithDeviceIdentifier:v34 portString:v24 dataProtectionClass:v22];
    uint64_t v28 = (nw_endpoint *)[v35 copyEndpoint];

    unsigned int v11 = v29;
    unsigned int v12 = v80;
    goto LABEL_32;
  }

  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  int v48 = v81;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Asked to set up a connection when we dont have a paired device!  Aborting...",  buf,  2u);
  }

- (BOOL)setupIPsecLinkForDeviceConnectionInfo:(id)a3
{
  id v4 = a3;
  [v4 setShouldUseIPsecLink:1];
  [v4 setVifName:@"IPsecLink"];
  *(_OWORD *)unsigned int v14 = xmmword_10071807C;
  *(_OWORD *)&v14[12] = *(__int128 *)((char *)&xmmword_10071807C + 12);
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  v14));
  [v4 setLocalSA:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  v14));
  [v4 setRemoteSA:v6];

  nw_parameters_t v7 = nw_parameters_create();
  nw_parameters_set_required_interface_subtype(v7, 5001LL);
  uint64_t v8 = nw_service_connector_create(61314LL, v7, self->_ipsecQueue);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setServiceConnector:v9];
  uint64_t v10 = nw_service_connector_create(61315LL, v7, self->_ipsecQueue);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v4 setCloudServiceConnector:v11];
  nw_service_connector_start(v9);
  nw_service_connector_start(v11);
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v16 = v9;
    __int16 v17 = 2112;
    __int128 v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setupIPsecLinkForDeviceConnectionInfo serviceConnector %@ cloudServiceConnector %@",  buf,  0x16u);
  }

  [v4 setLinkLayerConnected:1];
  return 1;
}

- (id)setupNewDeviceConnectionInfoForCbuuid:(id)a3 deviceUniqueID:(id)a4 identityPair:(id)a5 remoteDeviceEncryptionInfo:(id)a6 shouldUseIPsecLink:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v36 = 2112;
    if (v7) {
      __int16 v17 = @"YES";
    }
    id v37 = v13;
    __int16 v38 = 2112;
    __int128 v39 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "setupNewDeviceConnectionInfoForCbuuid %@ deviceUniqueID %@ shouldUseIPsecLink %@",  buf,  0x20u);
  }

  __int128 v18 = objc_alloc_init(&OBJC_CLASS___IDSDeviceConnectionInfo);
  -[IDSDeviceConnectionInfo setCbuuid:](v18, "setCbuuid:", v12);
  -[IDSDeviceConnectionInfo setDeviceUniqueID:](v18, "setDeviceUniqueID:", v13);
  if (v7)
  {
    -[IDSDeviceConnectionInfo setLinkLayerConnected:](v18, "setLinkLayerConnected:", 1LL);
  }

  else
  {
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunController linkManager](self, "linkManager"));
    -[IDSDeviceConnectionInfo setLinkLayerConnected:]( v18,  "setLinkLayerConnected:",  [v19 isConnectedToDeviceID:v12]);
  }

  pthread_mutex_lock(&self->_deviceConnectionInfoTableByCbuuidLock);
  sub_1003BB758(&self->_deviceConnectionInfoTableByCbuuid.tableSize, v12, v18);
  pthread_mutex_unlock(&self->_deviceConnectionInfoTableByCbuuidLock);
  unsigned __int8 v20 = [v12 isEqualToString:kIDSDefaultPairedDeviceID];
  -[IDSDeviceConnectionInfo setShouldUseIPsecLink:](v18, "setShouldUseIPsecLink:", v7);
  if (v7) {
    unsigned __int8 v21 = -[IDSUTunController setupIPsecLinkForDeviceConnectionInfo:]( self,  "setupIPsecLinkForDeviceConnectionInfo:",  v18);
  }
  else {
    unsigned __int8 v21 = -[IDSUTunController setupUTunForDeviceConnectionInfo:](self, "setupUTunForDeviceConnectionInfo:", v18);
  }
  if ((v21 & 1) != 0)
  {
    uint64_t v22 = objc_alloc(&OBJC_CLASS___IDSUTunControlChannel);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10032F528;
    v30[3] = &unk_100901760;
    unsigned __int8 v34 = v20;
    v30[4] = self;
    id v31 = v12;
    int v23 = v18;
    __int16 v32 = v23;
    id v33 = v13;
    uint64_t v24 = -[IDSUTunControlChannel initWithDeviceUniqueID:cbuuid:receiveHandler:]( v22,  "initWithDeviceUniqueID:cbuuid:receiveHandler:",  v33,  v31,  v30);
    -[IDSUTunControlChannel setRemoteDeviceEncryptionInfo:](v24, "setRemoteDeviceEncryptionInfo:", v15);
    -[IDSUTunControlChannel setDisableEncryption:]( v24,  "setDisableEncryption:",  self->_controlChannelEncryptionDisabled);
    if (v14 && !v7)
    {
      -[IDSUTunControlChannel setIdentityPair:](v24, "setIdentityPair:", v14);
      -[IDSUTunControlChannel encryptControlChannelForStoredIdentities](v24, "encryptControlChannelForStoredIdentities");
    }

    -[IDSDeviceConnectionInfo setControlChannel:](v23, "setControlChannel:", v24);
    if (-[IDSDeviceConnectionInfo linkLayerConnected](v23, "linkLayerConnected"))
    {
      -[IDSUTunController startControlChannelWithDevice:endpoint:]( self,  "startControlChannelWithDevice:endpoint:",  v23,  0LL);
    }

    else
    {
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Add a block for initial control channel setup on link connects.",  buf,  2u);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v23);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10032FCD0;
      v28[3] = &unk_100901738;
      objc_copyWeak(&v29, (id *)buf);
      v28[4] = self;
      -[IDSDeviceConnectionInfo addBlocksOnLinkConnect:](v23, "addBlocksOnLinkConnect:", v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }

    int v25 = v23;
  }

  else
  {
    IDSTransportThreadRemoveSocket(-[IDSDeviceConnectionInfo utunSocket](v18, "utunSocket"));
    -[IDSDeviceConnectionInfo cancelBlocksOnLinkConnect](v18, "cancelBlocksOnLinkConnect");
    -[IDSDeviceConnectionInfo invalidate](v18, "invalidate");
    sub_1003BBB68((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (const char *)v12);
    int v25 = 0LL;
  }

  return v25;
}

- (IDSUTunController)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSUTunController;
  v2 = -[IDSUTunController init](&v24, "init");
  if (!v2)
  {
LABEL_11:
    __int16 v17 = v2;
    goto LABEL_15;
  }

  if ((IDSTransportThreadInit() & 1) != 0)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___IDSUTunTimingLogger);
    id v4 = (void *)qword_1009C7520;
    qword_1009C7520 = (uint64_t)v3;

    sub_1003BB06C((uint64_t)&v2->_deviceConnectionInfoTableByCbuuid, 32);
    pthread_mutex_init(&v2->_deviceConnectionInfoTableByCbuuidLock, 0LL);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunController defaultPairedDeviceIdentityPair](v2, "defaultPairedDeviceIdentityPair"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100330000;
    v21[3] = &unk_1008F8960;
    id v6 = v2;
    uint64_t v22 = v6;
    BOOL v23 = v5 == 0LL;
    IDSTransportThreadAddSyncBlock(v21);
    -[IDSUTunController _reloadSettings](v6, "_reloadSettings");
    if (!v6->_controlChannelVersionCache)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      controlChannelVersionCache = v6->_controlChannelVersionCache;
      v6->_controlChannelVersionCache = (NSMutableDictionary *)Mutable;
    }

    v6->_controlChannelVersionCacheLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    id v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("ids multiplex ipsec queue", v12);
    ipsecQueue = v6->_ipsecQueue;
    v6->_ipsecQueue = (OS_dispatch_queue *)v13;

    if (IMGetDomainBoolForKey(@"com.apple.ids", @"enableSkywalkStat"))
    {
      int v20 = 1;
      if (sysctlbyname("kern.skywalk.ring_stat_enable", 0LL, 0LL, &v20, 4uLL))
      {
        int v15 = *__error();
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v26 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "sysctl for kern.skywalk.ring_stat_enable failed %d",  buf,  8u);
        }
      }
    }

    goto LABEL_11;
  }

  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "TransportThread initialization failed",  buf,  2u);
  }

  __int16 v17 = 0LL;
LABEL_15:

  return v17;
}

- (void)internalStartConnectionWithEndpoint:(id)a3 service:(const char *)a4 parameters:(id)a5 serviceConnector:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_retainBlock(a7);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unsigned __int8 v21 = a4;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: starting service connector for %s on %@ with parameters %@",  buf,  0x20u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003301BC;
  v17[3] = &unk_1009017B0;
  id v18 = v14;
  unsigned int v19 = a4;
  id v16 = v14;
  nw_service_connector_start_request(v13, v11, a4, v12, v17);
}

- (void)prepareControlChannelForDeviceConnectionInfo:(id)a3 genericConnection:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  [v5 setUint32Key:67109888];
  [v5 setIsCloudEnabled:1];
  [v5 setIsControlChannel:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 cbuuid]);
  objc_msgSend(v5, "setIsDefaultPairedDevice:", objc_msgSend(v6, "isEqualToString:", kIDSDefaultPairedDeviceID));

  uint64_t v7 = sub_1003BB3A8( (uint64_t)[v10 connectionsTableByLocalRemotePortKey],  (int)objc_msgSend(v5, "uint32Key"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_attr_t v9 = v8;
  if (v8) {
    [v8 invalidate];
  }
  sub_1003BB0A4( (int *)[v10 connectionsTableByLocalRemotePortKey],  (int)objc_msgSend(v5, "uint32Key"),  v5);
}

- (void)didConnectControlChannelForDeviceConnectionInfo:(id)a3 connection:(id)a4 error:(id)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didConnectControlChannelForDeviceConnectionInfo called: connection %@ error %@",  buf,  0x16u);
  }

  if (!v10)
  {
    dword_1009B87C8 = 4;
    qword_1009C0BD8 = 0LL;
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice: finished with [%@]",  buf,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 cbuuid]);
    uint64_t v19 = kIDSDefaultPairedDeviceID;
    unsigned int v20 = [v18 isEqualToString:kIDSDefaultPairedDeviceID];

    if (v20)
    {
      unsigned __int8 v21 = objc_alloc(&OBJC_CLASS___NSUUID);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceIdentifier]);
      id v74 = -[NSUUID initWithUUIDString:](v21, "initWithUUIDString:", v23);
    }

    else
    {
      memset(buf, 170, 16);
      uuid_clear(buf);
      id v74 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", buf);
    }

    uint64_t v69 = self;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 productName]);

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v32 productVersion]);

    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
    id v72 = (void *)objc_claimAutoreleasedReturnValue([v33 productBuildVersion]);

    unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
    int v71 = (void *)objc_claimAutoreleasedReturnValue([v34 model]);

    *(_DWORD *)buf = -1431655766;
    unsigned int v75 = -1431655766;
    unsigned int v76 = -1431655766;
    if (j__NRCompanionLinkIsEnabled( +[IDSPairingManager devicePairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:]( &OBJC_CLASS___IDSPairingManager,  "devicePairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:",  buf,  &v76,  &v75))) {
      uint64_t v35 = 1023LL;
    }
    else {
      uint64_t v35 = 767LL;
    }
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    unsigned int v37 = [v36 activePairedDeviceHasPairingType:1];

    if (v37) {
      uint64_t v40 = 1024LL;
    }
    else {
      uint64_t v40 = 0LL;
    }
    uint64_t v41 = 0LL;
    if (_IDSSupportsDirectMessaging(v38, v39))
    {
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v8 cbuuid]);
      unsigned int v43 = [v42 isEqualToString:v19];

      if (v43) {
        uint64_t v41 = 2048LL;
      }
      else {
        uint64_t v41 = 0LL;
      }
    }

    uint64_t v44 = objc_alloc_init(&OBJC_CLASS___IDSUTunControlMessage_Hello);
    -[IDSUTunControlMessage_Hello setControlChannelVersion:](v44, "setControlChannelVersion:", @"5");
    v70 = (void *)v31;
    -[IDSUTunControlMessage_Hello setProductName:](v44, "setProductName:", v31);
    -[IDSUTunControlMessage_Hello setProductVersion:](v44, "setProductVersion:", v73);
    -[IDSUTunControlMessage_Hello setProductBuildVersion:](v44, "setProductBuildVersion:", v72);
    -[IDSUTunControlMessage_Hello setModel:](v44, "setModel:", v71);
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)buf));
    -[IDSUTunControlMessage_Hello setPairingProtocolVersion:](v44, "setPairingProtocolVersion:", v45);

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v76));
    -[IDSUTunControlMessage_Hello setMinCompatibilityVersion:](v44, "setMinCompatibilityVersion:", v46);

    int v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v75));
    -[IDSUTunControlMessage_Hello setMaxCompatibilityVersion:](v44, "setMaxCompatibilityVersion:", v47);

    int v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v40 | v35 | v41));
    -[IDSUTunControlMessage_Hello setCapabilityFlags:](v44, "setCapabilityFlags:", v48);

    -[IDSUTunControlMessage_Hello setServiceMinCompatibilityVersion:]( v44,  "setServiceMinCompatibilityVersion:",  &off_100947A28);
    -[IDSUTunControlMessage_Hello setDeviceUniqueID:](v44, "setDeviceUniqueID:", v74);
    int v49 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc],  "initWithUUIDBytes:",  [v8 selfInstanceID]);
    -[IDSUTunControlMessage_Hello setInstanceID:](v44, "setInstanceID:", v49);
    BOOL v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello data](v44, "data"));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
    [v51 setConnecting:0];

    v52 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
    [v52 useConnection:v9 withFirstMessage:v50];

    int v53 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
    unsigned int v54 = [v53 isReadyForEncrypting];

    if (v54) {
      id v55 = -[IDSLinkManager setRequireBT:](v69->_linkManager, "setRequireBT:", 0LL);
    }
    if (_IDSSupportsDirectMessaging(v55, v56))
    {
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v8 cbuuid]);
      unsigned int v58 = [v57 isEqualToString:v19];

      if (v58)
      {
        char v80 = 14;
        int v59 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        id v60 = [v59 copyDirectMessagingInfo];

        if ((unint64_t)[v60 length] > 8)
        {
          v62 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
          -[NSMutableData appendBytes:length:](v62, "appendBytes:length:", &v80, 1LL);
          -[NSMutableData appendData:](v62, "appendData:", v60);
          id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v79 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "sending control message: direct msg info",  v79,  2u);
          }
        }

        else
        {
          id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v79 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "sending control message: invalid info length",  v79,  2u);
          }

          v62 = 0LL;
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
        [v68 sendMessage:v62];
      }
    }

    int v67 = v74;
    goto LABEL_60;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
  [v12 setConnecting:0];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 controlChannel]);
  unsigned int v14 = [v13 connected];

  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      uint64_t v24 = v8[1];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice: error creating control channel with [%@] [%@]",  buf,  0x16u);
    }

    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v8[1];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%@] creation failed: %@",  buf,  0x16u);
    }

    if (self->_hasFixedDestination)
    {
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "For the fixedInterface case, obliterate the connection.",  buf,  2u);
      }

      -[IDSUTunController obliterateConnectionInfoForCBUUID:completionBlock:completionQueue:]( self,  "obliterateConnectionInfoForCBUUID:completionBlock:completionQueue:",  v8[1],  0LL,  0LL);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 cbuuid]);
    unsigned int v29 = [v28 isEqualToString:kIDSDefaultPairedDeviceID];

    if (v29)
    {
      if (*(double *)&qword_1009C0BD8 == 0.0)
      {
        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        *(double *)&qword_1009C0BD8 = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
      }

      else
      {
        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        double v63 = *(double *)&qword_1009C0B68 * (double)mach_continuous_time() - *(double *)&qword_1009C0BD8;
        if (v63 > 30.0)
        {
          unsigned int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v63;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for default paired device could not be started for %0.3lf seconds",  buf,  0xCu);
          }
        }
      }
    }

    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_100330EA0;
    v77[3] = &unk_1008F8800;
    v77[4] = self;
    char v78 = v8;
    IDSTransportThreadAddBlockAfter(v77, (double)dword_1009B87C8);
    if (dword_1009B87C8 >= 0) {
      int v65 = dword_1009B87C8;
    }
    else {
      int v65 = dword_1009B87C8 + 1;
    }
    int v66 = dword_1009B87C8 + (v65 >> 1);
    if (v66 >= 60) {
      int v66 = 60;
    }
    dword_1009B87C8 = v66;
    int v67 = v78;
LABEL_60:

    goto LABEL_61;
  }

  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ids-ipsec: start_request returns error but control channel fine - assuming connected via available block. Error %@",  buf,  0xCu);
  }

LABEL_61:
}

- (void)startControlChannelWithDevice:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 controlChannel]);
  if ([v8 connecting])
  {
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 controlChannel]);
    unsigned int v10 = [v9 connected];

    if (!v10) {
      goto LABEL_8;
    }
  }

  int v11 = IMGetDomainBoolForKey(@"com.apple.ids", @"disableControlChannelLoopFix");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 cbuuid]);
      *(_DWORD *)buf = 138412290;
      unsigned int v76 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice called but already connecting/connected - force continue %@",  buf,  0xCu);
    }

LABEL_8:
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 controlChannel]);
    [v15 setConnecting:1];

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v6 localSA]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithWrapper:andPortHostOrder:",  v16,  1024LL));

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteSA]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithWrapper:andPortHostOrder:",  v17,  1024LL));

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:remoteAddress:]( &OBJC_CLASS___IDSSockAddrWrapperPair,  "wrapperPairWithLocalAddress:remoteAddress:",  v12,  v18));
    unsigned int v20 = -[IDSGenericConnection initWithAddressPair:protocol:]( objc_alloc(&OBJC_CLASS___IDSGenericConnection),  "initWithAddressPair:protocol:",  v19,  6LL);
    LODWORD(v17) = [v6 shouldUseIPsecLink];
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)v17)
    {
      if (v22)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 cbuuid]);
        *(_DWORD *)buf = 138412290;
        unsigned int v76 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice over utun/bt path for %@",  buf,  0xCu);
      }

      uint64_t v28 = v6[1];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_100331934;
      v68[3] = &unk_100901810;
      unsigned int v29 = v6;
      id v69 = v29;
      int v66 = v20;
      uint64_t v30 = v20;
      v70 = v30;
      int v71 = self;
      -[IDSUTunController internalOpenSocketWithDestination:localSA:remoteSA:protocol:trafficClass:completionHandler:]( self,  "internalOpenSocketWithDestination:localSA:remoteSA:protocol:trafficClass:completionHandler:",  v28,  v12,  v18,  6LL,  900LL,  v68);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);

      if (v31)
      {
        id v61 = v18;
        id v64 = v7;
        int v65 = self;
        double v63 = v19;
        if (v29[2079])
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue([v19 remoteAddress]);
          id v32 = [v62 sa];
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v19 localAddress]);
          id v34 = [v33 sa];
          id v35 = objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
          id v36 = [v35 bytes];
          unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
          unsigned int v38 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:]( v65,  "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:",  v29,  v32,  v34,  6,  v36,  [v37 length]);
        }

        else
        {
          id v60 = [v29 vifRef];
          v62 = (void *)objc_claimAutoreleasedReturnValue([v19 remoteAddress]);
          id v50 = [v62 sa];
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v19 localAddress]);
          id v51 = [v33 sa];
          id v35 = objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
          id v52 = [v35 bytes];
          unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
          unsigned int v38 = NEVirtualInterfaceWriteIPPayload(v60, v50, v51, 6, v52, [v37 length]);
        }

        unsigned int v53 = v38;

        unsigned int v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue([v29 vifName]);
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
          *(_DWORD *)buf = 138412802;
          unsigned int v76 = v55;
          __int16 v77 = 1024;
          unsigned int v78 = v53;
          __int16 v79 = 2112;
          char v80 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%@: write cached control channel syn neRet=%d\n\t\t<= data[%@]",  buf,  0x1Cu);
        }

        id v57 = objc_claimAutoreleasedReturnValue([v29 controlChannelCachedSYN]);
        unsigned int v58 = [v57 bytes];

        -[IDSGenericConnection setFirstIncomingSYNSequenceNumber:]( v30,  "setFirstIncomingSYNSequenceNumber:",  bswap32(v58[1]));
        [v29 setControlChannelCachedSYN:0];
        -[IDSGenericConnection setStateFlags:](v30, "setStateFlags:", 128LL);
        id v7 = v64;
        uint64_t v19 = v63;
        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        id v18 = v61;
        -[IDSGenericConnection setFirstPacketReceiveTime:]( v30,  "setFirstPacketReceiveTime:",  *(double *)&qword_1009C0B68 * (double)mach_continuous_time());
        -[IDSGenericConnection reportToAWD:connectionType:error:]( v30,  "reportToAWD:connectionType:error:",  -[IDSLinkManager currentLinkType:](v65->_linkManager, "currentLinkType:", v29[1]),  1LL,  0LL);
      }

      unsigned int v20 = v66;
      goto LABEL_30;
    }

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 cbuuid]);
      *(_DWORD *)buf = 138412290;
      unsigned int v76 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice over ipsec path for %@",  buf,  0xCu);
    }

    if (v7)
    {
      uint64_t v24 = v19;
      id v25 = v7;
    }

    else
    {
      int v67 = v20;
      uint64_t v39 = v18;
      uint64_t v40 = objc_alloc(&OBJC_CLASS___NSUUID);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 pairedDeviceUUIDString]);
      unsigned int v43 = -[NSUUID initWithUUIDString:](v40, "initWithUUIDString:", v42);

      if (!v43)
      {
        int v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        id v18 = v39;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice called but pairedDeviceUUIDString is nil.",  buf,  2u);
        }

        unsigned int v20 = v67;
        -[IDSGenericConnection invalidate](v67, "invalidate");
        goto LABEL_30;
      }

      uint64_t v24 = v19;
      id v44 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]( &OBJC_CLASS___NRDeviceIdentifier,  "newDeviceIdentifierWithBluetoothUUID:",  v43);
      id v45 = objc_alloc(&OBJC_CLASS___NREndpoint);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "61315"));
      id v47 = [v45 initWithDeviceIdentifier:v44 portString:v46 dataProtectionClass:4];

      id v25 = [v47 copyEndpoint];
      id v18 = v39;
      unsigned int v20 = v67;
    }

    nw_parameters_t v48 = nw_parameters_create();
    nw_parameters_set_traffic_class(v48, 900LL);
    int v49 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudServiceConnector]);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_1003318B8;
    v72[3] = &unk_100901810;
    v72[4] = self;
    v73 = v6;
    id v74 = v20;
    -[IDSUTunController internalStartConnectionWithEndpoint:service:parameters:serviceConnector:completionHandler:]( self,  "internalStartConnectionWithEndpoint:service:parameters:serviceConnector:completionHandler:",  v25,  "ids-control-channel",  v48,  v49,  v72);

    uint64_t v19 = v24;
LABEL_30:

    goto LABEL_31;
  }

  if (v13)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 cbuuid]);
    *(_DWORD *)buf = 138412290;
    unsigned int v76 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "startControlChannelWithDevice called but already connecting/connected - returning %@",  buf,  0xCu);
  }

- (void)resetTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 shouldUseIPsecLink]) {
    -[IDSUTunController resetIPsecTCPConnection:forDeviceConnectionInfo:]( self,  "resetIPsecTCPConnection:forDeviceConnectionInfo:",  v7,  v6);
  }
  else {
    -[IDSUTunController resetUTunTCPConnection:forDeviceConnectionInfo:]( self,  "resetUTunTCPConnection:forDeviceConnectionInfo:",  v7,  v6);
  }
}

- (void)resetIPsecTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceConnection]);
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "reset TCP for genericConnection %@ serviceConnection %@",  (uint8_t *)&v8,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceConnection]);
  if (v7)
  {
    [v4 _closeSockets];
    objc_msgSend(v4, "setStateFlags:", objc_msgSend(v4, "stateFlags") | 0x200);
  }
}

- (void)resetUTunTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v79, 170, sizeof(v79));
  int v7 = [v5 expectedNextIncomingSequenceNumber];
  int v8 = [v5 expectedNextOutgoingSequenceNumber];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "reset TCP for genericConnection %@ using seq:%08x ack:%08x",  buf,  0x18u);
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 addressPair]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteAddress]);
  __int16 v12 = (unsigned __int16)[v11 saPortHostOrder];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v5 addressPair]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localAddress]);
  sub_100327784((uint64_t)v79, v12, (__int16)[v14 saPortHostOrder], v7, v8);

  id v15 = v5;
  int v16 = [v15 sdCopy];
  if (v16 != -1)
  {
    unint64_t v103 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v101 = v17;
    __int128 v102 = v17;
    __int128 v99 = v17;
    __int128 v100 = v17;
    __int128 v97 = v17;
    __int128 v98 = v17;
    __int128 v95 = v17;
    __int128 v96 = v17;
    __int128 v93 = v17;
    __int128 v94 = v17;
    __int128 v91 = v17;
    __int128 v92 = v17;
    __int128 v89 = v17;
    __int128 v90 = v17;
    __int128 v87 = v17;
    __int128 v88 = v17;
    __int128 v85 = v17;
    __int128 v86 = v17;
    __int128 v83 = v17;
    __int128 v84 = v17;
    __int128 v82 = v17;
    *(_OWORD *)&uint8_t buf[32] = v17;
    __int128 v81 = v17;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    socklen_t v73 = 408;
    if (!getsockopt(v16, 6, 512, buf, &v73))
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = buf[0];
        int v20 = DWORD1(v81);
        int v21 = DWORD2(v81);
        unsigned int v22 = [v15 expectedNextIncomingSequenceNumber];
        unsigned int v23 = [v15 expectedNextOutgoingSequenceNumber];
        *(_DWORD *)id v74 = 67110144;
        *(_DWORD *)unsigned int v75 = v19;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v20;
        LOWORD(v76) = 1024;
        *(_DWORD *)((char *)&v76 + 2) = v21;
        HIWORD(v76) = 1024;
        *(_DWORD *)__int16 v77 = v22;
        *(_WORD *)&v77[4] = 1024;
        v78[0] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "TCP info (%u) tcpi_snd_nxt:%08x tcpi_rcv_nxt:%08x (connection: in:%08x out:%08x)",  v74,  0x20u);
      }
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 remoteAddress]);
  uint64_t v26 = (int8x16_t *)((char *)[v25 sa6] + 8);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 localAddress]);
  tcp6checksum(v26, (int8x16_t *)((char *)[v28 sa6] + 8), (int8x16_t *)v79, 0x14uLL);

  if (v6[2079])
  {
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 remoteAddress]);
    id v31 = [v30 sa];
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localAddress]);
    unsigned int v34 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:]( self,  "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:",  v6,  v31,  [v33 sa],  6,  v79,  20);
  }

  else
  {
    id v35 = [v6 vifRef];
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 remoteAddress]);
    id v36 = [v30 sa];
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localAddress]);
    unsigned int v34 = NEVirtualInterfaceWriteIPPayload(v35, v36, [v33 sa], 6, v79, 20);
  }

  unsigned int v37 = v34;

  unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 shortDescription]);
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v79,  20LL,  0LL));
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v39;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v41;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v37;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%@: write generated reset ports[%@] neRet=%d\n\t\t<= data[%@]",  buf,  0x26u);
  }

  int connected_socket = [v15 sdCopy];
  if (connected_socket != -1
    || (int connected_socket = [v15 sdOriginal], connected_socket != -1)
    || (int connected_socket = [v15 sd], connected_socket != -1)
    || (uint64_t v70 = objc_claimAutoreleasedReturnValue([v15 serviceConnection])) != 0
    && (int v71 = (void *)v70,
        int connected_socket = nw_connection_get_connected_socket(v70),
        v71,
        connected_socket != -1))
  {
    unint64_t v103 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v44 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v101 = v44;
    __int128 v102 = v44;
    __int128 v99 = v44;
    __int128 v100 = v44;
    __int128 v97 = v44;
    __int128 v98 = v44;
    __int128 v95 = v44;
    __int128 v96 = v44;
    __int128 v93 = v44;
    __int128 v94 = v44;
    __int128 v91 = v44;
    __int128 v92 = v44;
    __int128 v89 = v44;
    __int128 v90 = v44;
    __int128 v87 = v44;
    __int128 v88 = v44;
    __int128 v85 = v44;
    __int128 v86 = v44;
    __int128 v83 = v44;
    __int128 v84 = v44;
    __int128 v82 = v44;
    *(_OWORD *)&uint8_t buf[32] = v44;
    __int128 v81 = v44;
    *(_OWORD *)buf = v44;
    *(_OWORD *)&buf[16] = v44;
    socklen_t v73 = 408;
    if (!getsockopt(connected_socket, 6, 512, buf, &v73))
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 remoteAddress]);
      __int16 v47 = (unsigned __int16)[v46 saPortHostOrder];
      nw_parameters_t v48 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
      int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 localAddress]);
      __int16 v50 = (unsigned __int16)[v49 saPortHostOrder];
      sub_100327784((uint64_t)v79, v47, v50, SDWORD2(v81), SDWORD1(v81));

      id v51 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 remoteAddress]);
      unsigned int v53 = (int8x16_t *)((char *)[v52 sa6] + 8);
      unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
      id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 localAddress]);
      tcp6checksum(v53, (int8x16_t *)((char *)[v55 sa6] + 8), (int8x16_t *)v79, 0x14uLL);

      if (v6[2079])
      {
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 remoteAddress]);
        id v58 = [v57 sa];
        int v59 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 localAddress]);
        unsigned int v61 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:]( self,  "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:",  v6,  v58,  [v60 sa],  6,  v79,  20);
      }

      else
      {
        id v62 = [v6 vifRef];
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 remoteAddress]);
        id v63 = [v57 sa];
        int v59 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 localAddress]);
        unsigned int v61 = NEVirtualInterfaceWriteIPPayload(v62, v63, [v60 sa], 6, v79, 20);
      }

      unsigned int v64 = v61;

      int v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        int v66 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
        int v67 = (void *)objc_claimAutoreleasedReturnValue([v15 addressPair]);
        v68 = (void *)objc_claimAutoreleasedReturnValue([v67 shortDescription]);
        id v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v79,  20LL,  0LL));
        *(_DWORD *)id v74 = 138413058;
        *(void *)unsigned int v75 = v66;
        *(_WORD *)&v75[8] = 2112;
        unsigned int v76 = v68;
        *(_WORD *)__int16 v77 = 1024;
        *(_DWORD *)&v77[2] = v64;
        LOWORD(v78[0]) = 2112;
        *(void *)((char *)v78 + 2) = v69;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%@: write generated reset ports[%@] neRet=%d\n\t\t<= data[%@]",  v74,  0x26u);
      }
    }
  }

  objc_msgSend(v15, "setStateFlags:", objc_msgSend(v15, "stateFlags", self) | 0x20);
}

- (IDSUTunController)initWithName:(id)a3 address:(id)a4 andTestTransport:(id)a5
{
  return 0LL;
}

- (void)removeConnection:(id)a3 fromDeviceConnectionInfo:(id)a4 removeCode:(int64_t)a5 removeReason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: closing connection %@", buf, 0x16u);
    }

    if ([v10 protocol] == 6) {
      -[IDSUTunController resetTCPConnection:forDeviceConnectionInfo:]( self,  "resetTCPConnection:forDeviceConnectionInfo:",  v10,  v11);
    }
    -[IDSUTunController resetIPsecTCPConnection:forDeviceConnectionInfo:]( self,  "resetIPsecTCPConnection:forDeviceConnectionInfo:",  v10,  v11);
    if ([v10 priority] == (id)300)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 highPriorityConnectionSendingSet]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localConnectionGUID]);
      [v14 removeObject:v15];
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 compressionInfo]);
    uint64_t v17 = (uint64_t)[v16 state];

    if (v17 >= 1)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 compressionInfo]);
      objc_msgSend(v11, "clearLocalCID:", objc_msgSend(v18, "localCID"));
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue([v10 connectionID]);

    if (v19)
    {
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v11 connectionsByID]);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 connectionID]);
      [v20 removeObjectForKey:v21];
    }

    if (([v10 stateFlags] & 2) == 0)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v10 openSocketCompletionHandler]);

      if (v22)
      {
        objc_msgSend(v10, "setStateFlags:", objc_msgSend(v10, "stateFlags") | 2);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v10 openSocketCompletionHandler]);
        [v10 setOpenSocketCompletionHandler:0];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v12,  NSLocalizedDescriptionKey));
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSUTun",  a5,  v24));

        uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 completionQueue]);
        id v33 = _NSConcreteStackBlock;
        uint64_t v34 = 3221225472LL;
        id v35 = sub_100332C94;
        id v36 = &unk_1008F6358;
        id v37 = v25;
        id v38 = v23;
        id v27 = v25;
        id v28 = v23;
        dispatch_async(v26, &v33);
      }
    }

    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressPair", v33, v34, v35, v36));

    if (v29) {
      sub_1003BB494( (uint64_t)[v11 connectionsTableByLocalRemotePortKey],  (int)objc_msgSend(v10, "uint32Key"));
    }
    if ([v10 encryptionEnabled])
    {
      sub_1003BB494((uint64_t)[v11 outgoingEncryptionTableBySSRC], (int)objc_msgSend(v10, "SSRCSend"));
      sub_1003BB494((uint64_t)[v11 incomingEncryptionTableBySSRC], (int)objc_msgSend(v10, "SSRCRecv"));
    }

    [v10 invalidate];
    if ([v10 shouldStopBTDatagramLink])
    {
      [v10 setShouldStopBTDatagramLink:0];
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v10 connectionID]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 service]);
        *(_DWORD *)buf = 138412290;
        id v40 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "closeSocket for %@ using BT datagram link - stop",  buf,  0xCu);
      }

      -[IDSLinkManager stopBTDatagramLinkForDeviceUniqueID:cbuuid:]( self->_linkManager,  "stopBTDatagramLinkForDeviceUniqueID:cbuuid:",  IDSDeviceDefaultPairedDeviceUniqueID,  kIDSDefaultPairedDeviceID);
    }
  }
}

- (void)resetAllConnectionsForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionsByID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  id v7 = [v6 _copyForEnumerating];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        id v13 = [v4 portMap];
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 addressPair]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localAddress]);
        -[IDSUTunController releasePortIfNecessary:port:]( self,  "releasePortIfNecessary:port:",  v13,  [v15 saPortHostOrder]);

        -[IDSUTunController removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:]( self,  "removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:",  v12,  v4,  5031LL,  @"resetting all connections");
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  -[IDSUTunController checkSuspendTrafficForDevice:wait:](self, "checkSuspendTrafficForDevice:wait:", v4, 1LL);
}

- (BOOL)handleIncomingPacket:(id *)a3 fromDeviceToken:(id)a4
{
  id v186 = a4;
  BOOL logPackets = self->_logPackets;
  if (self->_logPackets) {
    uint64_t v184 = mach_continuous_time();
  }
  else {
    uint64_t v184 = 0xAAAAAAAAAAAAAAAALL;
  }
  testDeviceConnectionInfo = self->_testDeviceConnectionInfo;
  if (testDeviceConnectionInfo)
  {
    id v8 = testDeviceConnectionInfo;
  }

  else
  {
    uint64_t v10 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v186);
    id v8 = (IDSDeviceConnectionInfo *)objc_claimAutoreleasedReturnValue(v10);
    if (!v8)
    {
      id v8 = (IDSDeviceConnectionInfo *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController"));
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v186;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "%@: waiting for first openSocket",  buf,  0xCu);
      }

      BOOL v15 = 1;
      goto LABEL_244;
    }
  }

  unint64_t var2 = a3->var2;
  if (var2)
  {
    var0 = a3->var0;
    if (self->_encryptionEnabled && (unsigned int v13 = *var0, v13 >= 0xE0))
    {
      if (var2 <= 7)
      {
        unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v186;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = var2;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: incoming packet not enough bytes for encryption header %d",  buf,  0x12u);
        }

- (void)internalOpenSocketWithDestination:(id)a3 localSA:(id)a4 remoteSA:(id)a5 protocol:(int)a6 trafficClass:(int)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (a6 == 17) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  uint64_t v18 = socket(30, v17, 0);
  if ((_DWORD)v18 == -1)
  {
    int v21 = __error();
    uint64_t v22 = *v21;
    BOOL v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"device %@: socket() failed: errno=%d: %s",  v13,  v22,  strerror(*v21));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v24,  NSLocalizedDescriptionKey));
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSUTun",  5001LL,  v25));

    (*((void (**)(id, void, void, void, void, uint64_t, void, void, void *))v16 + 2))( v16,  0LL,  0LL,  0LL,  0LL,  0xFFFFFFFFLL,  0LL,  0LL,  v26);
    IDSAssertNonFatalErrnoWithSource( v22,  "UTunController internalOpenSocketWithDestination socket() failed",  "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  4373LL);

    goto LABEL_25;
  }

  uint64_t v19 = v18;
  IDSCheckFileDescriptorUsageWithSource("IDSUTunController.m", 4377LL, 0LL);
  int v20 = fcntl(v19, 3, 0LL);
  fcntl(v19, 4, v20 | 4u);
  int v46 = 1;
  setsockopt(v19, 0xFFFF, 4130, &v46, 4u);
  int v45 = 1;
  setsockopt(v19, 0xFFFF, 4, &v45, 4u);
  int v44 = 1;
  setsockopt(v19, 0xFFFF, 512, &v44, 4u);
  if (a6 == 6)
  {
    *(_DWORD *)buf = 1;
    setsockopt(v19, 6, 521, buf, 4u);
    if (a7 <= 699)
    {
      if (a7 != 500 && a7 != 600) {
        goto LABEL_15;
      }
    }

    else if (a7 != 700 && a7 != 900 && a7 != 800)
    {
      goto LABEL_15;
    }

    int v43 = 1;
    setsockopt(v19, 6, 1, &v43, 4u);
  }

- (int)processCompressionRequest:(id)a3 fromDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    *(_DWORD *)buf = 138412546;
    unsigned int v84 = v8;
    __int16 v85 = 2112;
    *(void *)uint64_t v86 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: got control message: compression_req %@",  buf,  0x16u);
  }

  id v9 = [v5 length];
  id v10 = v5;
  id v11 = (char *)[v10 bytes];
  if ((unint64_t)v9 > 0xA)
  {
    int v17 = v11;
    __int128 v81 = v6;
    uint64_t v18 = bswap32(*(unsigned __int16 *)(v11 + 1)) >> 16;
    uint64_t v19 = bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16;
    uint64_t v20 = bswap32(*(unsigned __int16 *)(v11 + 5)) >> 16;
    uint64_t v21 = bswap32(*(unsigned __int16 *)(v11 + 7)) >> 16;
    uint64_t v22 = bswap32(*(unsigned __int16 *)(v11 + 9)) >> 16;
    uint64_t v23 = v18 + v19 + v20 + v21 + v22 + 23;
    if (v9 != (id)v23)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v61 = 1;
        id v6 = v81;
        goto LABEL_52;
      }

      id v6 = v81;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
      *(_DWORD *)buf = 138412802;
      unsigned int v84 = v13;
      __int16 v85 = 1024;
      *(_DWORD *)uint64_t v86 = (_DWORD)v9;
      *(_WORD *)&v86[4] = 2048;
      *(void *)&v86[6] = v23;
      id v14 = "%@: invalid message size for UTCMType_CompressionRequest (%u != %lu)";
      id v15 = v12;
      uint32_t v16 = 28;
      goto LABEL_24;
    }

    uint64_t v24 = v11 + 23;
    id v12 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v11 + 23,  v18,  4LL);
    if (!v12)
    {
      int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        unsigned int v84 = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest cannot decode remoteConnectionGUID",  buf,  0xCu);

        int v61 = 2;
      }

      else
      {
        int v61 = 2;
        id v6 = v81;
      }

      goto LABEL_51;
    }

    uint64_t v25 = &v24[v18];
    unint64_t v26 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v25,  v19,  4LL);
    int v27 = (os_log_s *)v26;
    if (!v26)
    {
      int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        unsigned int v84 = v64;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest cannot decode localConnectionGUID",  buf,  0xCu);

        int v61 = 2;
      }

      else
      {
        int v61 = 2;
        id v6 = v81;
      }

      goto LABEL_50;
    }

    char v80 = v26;
    int v78 = bswap32(*(unsigned __int16 *)(v17 + 11)) >> 16;
    unsigned int v79 = bswap32(*(unsigned __int16 *)(v17 + 13)) >> 16;
    unsigned int v76 = bswap32(*(_DWORD *)(v17 + 19));
    unsigned int v77 = bswap32(*(_DWORD *)(v17 + 15));
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
      *(_DWORD *)buf = 138413314;
      unsigned int v84 = v29;
      __int16 v85 = 1024;
      *(_DWORD *)uint64_t v86 = v78;
      *(_WORD *)&v86[4] = 1024;
      *(_DWORD *)&v86[6] = v79;
      *(_WORD *)&v86[10] = 1024;
      *(_DWORD *)&v86[12] = v77;
      *(_WORD *)&v86[16] = 1024;
      unsigned int v87 = v76;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: recv compression_req (#:%u remoteCID:%u seq:%u ack:%u)",  buf,  0x24u);
    }

    uint64_t v30 = &v25[v19];
    int v31 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &v25[v19],  v20,  4LL);
    if (!v31)
    {
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      id v6 = v81;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v65 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        unsigned int v84 = v65;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest cannot decode account",  buf,  0xCu);
      }

      int v61 = 2;
      int v27 = (os_log_s *)v80;
      goto LABEL_49;
    }

    uint64_t v32 = (uint64_t)&v30[v20];
    id v33 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v32,  v21,  4LL);
    id v6 = v81;
    if (!v33)
    {
      unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v66 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        unsigned int v84 = v66;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest cannot decode service",  buf,  0xCu);
      }

      int v61 = 2;
      int v27 = (os_log_s *)v80;
      goto LABEL_48;
    }

    unsigned int v34 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v32 + v21,  v22,  4LL);
    if (!v34)
    {
      id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      int v27 = (os_log_s *)v80;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        int v67 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        unsigned int v84 = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest cannot decode name",  buf,  0xCu);
      }

      int v61 = 2;
      goto LABEL_47;
    }

    uint64_t v35 = objc_claimAutoreleasedReturnValue( +[IDSGenericConnectionID idWithAccount:service:name:]( &OBJC_CLASS___IDSGenericConnectionID,  "idWithAccount:service:name:",  v31,  v33,  v34));
    int v36 = (void *)objc_claimAutoreleasedReturnValue([v81 connectionsByID]);
    unsigned int v75 = (os_log_s *)v35;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v35]);

    id v38 = v37;
    int v27 = (os_log_s *)v80;
    if (v37)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 localConnectionGUID]);
      if ([v39 isEqualToString:v80])
      {
        id v74 = v38;
        int v40 = (void *)objc_claimAutoreleasedReturnValue([v38 remoteConnectionGUID]);
        unsigned __int8 v41 = [v40 isEqualToString:v12];

        id v38 = v74;
        if ((v41 & 1) != 0)
        {
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
            int v44 = (void *)objc_claimAutoreleasedReturnValue([v74 addressPair]);
            int v45 = (void *)objc_claimAutoreleasedReturnValue([v44 shortDescription]);
            *(_DWORD *)buf = 138412546;
            unsigned int v84 = v43;
            __int16 v85 = 2112;
            *(void *)uint64_t v86 = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%@: processCompressionRequest resolved connection ports[%@]",  buf,  0x16u);

            id v38 = v74;
          }

          int v46 = v38;
          __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v38 compressionInfo]);
          [v47 setRemoteCID:v79];

          uint64_t v82 = 0LL;
          unsigned __int8 v73 = [v46 protocol];
          id v48 = (void *)objc_claimAutoreleasedReturnValue([v46 addressPair]);
          __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 remoteAddress]);
          unsigned int v72 = [v49 saPortHostOrder];

          __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v46 addressPair]);
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 localAddress]);
          id v52 = [v51 saPortHostOrder];

          IDSHC_CreateContext(&v82, v73, v79, v72, v52, v77, v76);
          int v53 = (void *)objc_claimAutoreleasedReturnValue([v46 compressionInfo]);
          [v53 setRemoteContext:v82];

          __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v46 localConnectionGUID]);
          int v55 = (void *)objc_claimAutoreleasedReturnValue([v46 remoteConnectionGUID]);
          __int16 v56 = sub_100335BE0(v78, v54, v55, v31, v33, v34);
          int v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

          id v6 = v81;
          unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue([v81 controlChannel]);
          [v58 sendMessage:v57];

          unsigned int v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
            *(_DWORD *)buf = 138412546;
            unsigned int v84 = v60;
            __int16 v85 = 2112;
            *(void *)uint64_t v86 = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%@: sending control message: compression_resp %@",  buf,  0x16u);
          }

          int v61 = 0;
          id v38 = v74;
          id v62 = v75;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
      }

      else
      {
      }
    }

    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      id v69 = v38;
      char v70 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
      *(_DWORD *)buf = 138412802;
      unsigned int v84 = v70;
      __int16 v85 = 2112;
      *(void *)uint64_t v86 = v80;
      *(_WORD *)&v86[8] = 2112;
      *(void *)&v86[10] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionRequest found connection mismatch! (localGUID:%@ remoteGUID:%@)",  buf,  0x20u);

      id v38 = v69;
    }

    int v61 = 2;
    id v62 = v75;
    goto LABEL_46;
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    *(_DWORD *)buf = 138412546;
    unsigned int v84 = v13;
    __int16 v85 = 2048;
    *(void *)uint64_t v86 = v9;
    id v14 = "%@: UTCMType_CompressionRequest has invalid header length (%lu)";
    id v15 = v12;
    uint32_t v16 = 22;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }

  int v61 = 1;
LABEL_52:

  return v61;
}

- (int)processCompressionResponse:(id)a3 fromDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v83 = 2112;
    *(void *)unsigned int v84 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: got control message: compression_resp %@",  buf,  0x16u);
  }

  id v9 = [v5 length];
  id v10 = v5;
  id v11 = (char *)[v10 bytes];
  if ((unint64_t)v9 > 0xA)
  {
    id v15 = v11;
    id v16 = v10;
    __int128 v81 = v6;
    uint64_t v17 = bswap32(*(unsigned __int16 *)(v11 + 1)) >> 16;
    uint64_t v18 = bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16;
    uint64_t v19 = bswap32(*(unsigned __int16 *)(v11 + 5)) >> 16;
    uint64_t v20 = bswap32(*(unsigned __int16 *)(v11 + 7)) >> 16;
    uint64_t v21 = bswap32(*(unsigned __int16 *)(v11 + 9)) >> 16;
    uint64_t v22 = v17 + v18 + v19 + v20 + v21 + 13;
    if (v9 != (id)v22)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        id v62 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v62;
        __int16 v83 = 1024;
        *(_DWORD *)unsigned int v84 = (_DWORD)v9;
        *(_WORD *)&v84[4] = 2048;
        *(void *)&v84[6] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: invalid message size for UTCMType_CompressionResponse (%u != %lu)",  buf,  0x1Cu);

        int v14 = 1;
      }

      else
      {
        int v14 = 1;
        id v6 = v81;
      }

      id v10 = v16;
      goto LABEL_54;
    }

    uint64_t v23 = v11 + 13;
    char v80 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v11 + 13,  v17,  4LL);
    if (!v80)
    {
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      id v10 = v16;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse cannot decode remoteConnectionGUID",  buf,  0xCu);

        int v14 = 2;
        id v12 = 0LL;
      }

      else
      {
        int v14 = 2;
        id v12 = 0LL;
        id v6 = v81;
      }

      goto LABEL_53;
    }

    uint64_t v24 = &v23[v17];
    uint64_t v25 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v24,  v18,  4LL);
    id v10 = v16;
    if (!v25)
    {
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v64;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse cannot decode localConnectionGUID",  buf,  0xCu);

        int v14 = 2;
        id v12 = (os_log_s *)v80;
      }

      else
      {
        int v14 = 2;
        id v12 = (os_log_s *)v80;
        id v6 = v81;
      }

      goto LABEL_52;
    }

    unsigned int v78 = bswap32(*(unsigned __int16 *)(v15 + 11)) >> 16;
    unint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = v25;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v83 = 1024;
      *(_DWORD *)unsigned int v84 = v78;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@: recv compression_resp (#:%u)",  buf,  0x12u);

      uint64_t v25 = v27;
    }

    unsigned int v29 = &v24[v18];
    uint64_t v30 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v29,  v19,  4LL);
    if (!v30)
    {
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        int v65 = v25;
        int v66 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v66;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse cannot decode account",  buf,  0xCu);

        uint64_t v25 = v65;
        int v14 = 2;
        id v12 = (os_log_s *)v80;
      }

      else
      {
        int v14 = 2;
        id v12 = (os_log_s *)v80;
        id v6 = v81;
      }

      goto LABEL_51;
    }

    uint64_t v31 = (uint64_t)&v29[v19];
    uint64_t v32 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v31,  v20,  4LL);
    if (!v32)
    {
      unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v81;
        int v67 = v25;
        v68 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v68;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse cannot decode service",  buf,  0xCu);

        uint64_t v25 = v67;
        int v14 = 2;
        id v12 = (os_log_s *)v80;
      }

      else
      {
        int v14 = 2;
        id v12 = (os_log_s *)v80;
        id v6 = v81;
      }

      goto LABEL_50;
    }

    id v33 = v25;
    unsigned int v34 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v31 + v20,  v21,  4LL);
    if (!v34)
    {
      id v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      id v6 = v81;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        char v70 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v70;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse cannot decode name",  buf,  0xCu);
      }

      int v14 = 2;
      id v12 = (os_log_s *)v80;
      uint64_t v25 = v33;
      goto LABEL_49;
    }

    uint64_t v35 = objc_claimAutoreleasedReturnValue( +[IDSGenericConnectionID idWithAccount:service:name:]( &OBJC_CLASS___IDSGenericConnectionID,  "idWithAccount:service:name:",  v30,  v32,  v34));
    int v36 = (void *)objc_claimAutoreleasedReturnValue([v81 connectionsByID]);
    unsigned int v77 = (os_log_s *)v35;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v35]);

    if (v37)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localConnectionGUID]);
      if ([v38 isEqualToString:v33])
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 remoteConnectionGUID]);
        unsigned __int8 v40 = [v39 isEqualToString:v80];

        if ((v40 & 1) != 0)
        {
          unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            log = v41;
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
            int v43 = (void *)objc_claimAutoreleasedReturnValue([v37 addressPair]);
            int v44 = (void *)objc_claimAutoreleasedReturnValue([v43 shortDescription]);
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v42;
            __int16 v83 = 2112;
            *(void *)unsigned int v84 = v44;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%@: processCompressionResponse resolved connection ports[%@]",  buf,  0x16u);

            unsigned __int8 v41 = log;
          }

          int v45 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          unsigned int v46 = [v45 reqCount];

          if (v46 <= v78)
          {
            __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v48;
              __int16 v83 = 1024;
              *(_DWORD *)unsigned int v84 = v78;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%@: compression_req (%u) acknowledged!",  buf,  0x12u);
            }

            __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
            [v49 setReqCount:v78];
          }

          *(void *)buf = 0LL;
          unsigned __int8 v50 = [v37 protocol];
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          unsigned int v79 = [v51 localCID];

          id v52 = (void *)objc_claimAutoreleasedReturnValue([v37 addressPair]);
          int v53 = (void *)objc_claimAutoreleasedReturnValue([v52 localAddress]);
          unsigned int loga = [v53 saPortHostOrder];

          __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v37 addressPair]);
          int v55 = (void *)objc_claimAutoreleasedReturnValue([v54 remoteAddress]);
          unsigned int v74 = [v55 saPortHostOrder];

          __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          id v57 = [v56 lastSentSeq];

          unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          id v59 = [v58 lastSentAck];

          IDSHC_CreateContext(buf, v50, v79, loga, v74, v57, v59);
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          [v60 setLocalContext:*(void *)buf];

          int v61 = (void *)objc_claimAutoreleasedReturnValue([v37 compressionInfo]);
          [v61 setState:2];

          int v14 = 0;
          id v12 = (os_log_s *)v80;
          id v6 = v81;
LABEL_48:

          uint64_t v25 = v33;
          id v69 = v77;
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

          goto LABEL_54;
        }
      }

      else
      {
      }
    }

    int v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    id v12 = (os_log_s *)v80;
    id v6 = v81;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v81 vifName]);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v72;
      __int16 v83 = 2112;
      *(void *)unsigned int v84 = v33;
      *(_WORD *)&v84[8] = 2112;
      *(void *)&v84[10] = v80;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse found connection mismatch! (localGUID:%@ remoteGUID:%@)",  buf,  0x20u);
    }

    int v14 = 2;
    goto LABEL_48;
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    __int16 v83 = 2048;
    *(void *)unsigned int v84 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: UTCMType_CompressionResponse has invalid header length (%lu)",  buf,  0x16u);
  }

  int v14 = 1;
LABEL_54:

  return v14;
}

- (void)startCompressionForConnection:(id)a3 deviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 && v6)
  {
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 addressPair]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 shortDescription]);
      *(_DWORD *)buf = 138412290;
      unint64_t v54 = (unint64_t)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "startCompressionForConnection ports[%@]",  buf,  0xCu);
    }

    id v11 = [v6 nextAvailableLocalCID];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v11 == 0xFFFF)
    {
      if (v12)
      {
        unsigned __int8 v41 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
        *(_DWORD *)buf = 138412290;
        unint64_t v54 = (unint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: failed to get local CID", buf, 0xCu);
      }
    }

    else
    {
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
        *(_DWORD *)buf = 138412546;
        unint64_t v54 = (unint64_t)v13;
        __int16 v55 = 1024;
        LODWORD(v56) = (_DWORD)v11;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: resolved next available localCID 0x%04x",  buf,  0x12u);
      }

      int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 compressionInfo]);
      [v14 setLocalCID:v11];

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 compressionInfo]);
      objc_msgSend(v15, "setReqCount:", (unsigned __int16)((unsigned __int16)objc_msgSend(v15, "reqCount") + 1));

      [v5 setCompressionState:1];
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 compressionInfo]);
      unsigned int v51 = [v16 reqCount];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 compressionInfo]);
      HIDWORD(v49) = [v17 lastSentSeq];

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 compressionInfo]);
      LODWORD(v49) = [v18 lastSentAck];

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionID]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 account]);

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionID]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionID]);
      id v52 = v6;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 localConnectionGUID]);
      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteConnectionGUID]);
      id v47 = v25;
      id v27 = v20;
      id v28 = v22;
      id v29 = v24;
      int v45 = (const char *)[v47 UTF8String];
      unsigned int v42 = v11;
      LODWORD(v22) = strlen(v45);
      id v46 = v26;
      int v44 = (const char *)[v46 UTF8String];
      unsigned int v30 = strlen(v44);
      id v7 = (os_log_s *)v27;
      int v43 = (const char *)-[os_log_s UTF8String](v7, "UTF8String");

      LODWORD(v26) = strlen(v43);
      id v31 = v28;
      uint64_t v32 = (const char *)[v31 UTF8String];
      unsigned __int8 v50 = v31;

      unsigned int v33 = strlen(v32);
      id v34 = v29;
      uint64_t v35 = (const char *)[v34 UTF8String];
      id v48 = v34;

      unsigned int v36 = strlen(v35);
      LOWORD(v34) = v36;
      char v57 = 4;
      __int16 v58 = bswap32(v22) >> 16;
      LOWORD(v24) = v30;
      __int16 v59 = bswap32(v30) >> 16;
      __int16 v60 = bswap32(v26) >> 16;
      __int16 v61 = bswap32(v33) >> 16;
      __int16 v62 = bswap32(v36) >> 16;
      *(_WORD *)buf = __rev16(v51);
      *(_WORD *)&buf[2] = __rev16(v42);
      unint64_t v54 = _byteswap_uint64(v49);
      uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", &v57, 11LL);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", buf, 12LL);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", v45, (unsigned __int16)v22);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", v44, (unsigned __int16)v24);
      id v6 = v52;
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", v43, (unsigned __int16)v26);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", v32, (unsigned __int16)v33);
      -[NSMutableData appendBytes:length:](v37, "appendBytes:length:", v35, (unsigned __int16)v34);

      id v38 = (void *)objc_claimAutoreleasedReturnValue([v52 controlChannel]);
      [v38 sendMessage:v37];

      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v52 vifName]);
        *(_DWORD *)buf = 138412546;
        unint64_t v54 = (unint64_t)v40;
        __int16 v55 = 2112;
        __int16 v56 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%@: sending control message: compression_req (%@)",  buf,  0x16u);
      }
    }
  }

  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "startCompressionForConnection failed due to invalid parameters",  buf,  2u);
  }
}

- (id)stringComponentsForServiceConnectorService:(id)a3
{
  return [a3 componentsSeparatedByString:@"/"];
}

- (void)receiveControlChannelMessage:(id)a3 fromCbuuid:(id)a4 deviceUniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v390 = self;
  id v391 = a5;
  v392 = v9;
  uint64_t v10 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v9);
  v393 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v393 vifName]);
    *(_DWORD *)buf = 138412290;
    v401 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: control message parsing..", buf, 0xCu);
  }

  id v394 = v8;
  id v13 = (unsigned __int8 *)[v394 bytes];
  int v14 = (char *)[v394 length];
  id v16 = v14;
  if (!v14)
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v393 vifName]);
      *(_DWORD *)buf = 138412290;
      v401 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: control message too small", buf, 0xCu);
    }

    goto LABEL_11;
  }

  int v17 = *v13;
  switch(*v13)
  {
    case 1u:
      uint64_t v24 = objc_alloc(&OBJC_CLASS___IDSUTunControlMessage_Hello);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v393 vifName]);
      unint64_t v26 = -[IDSUTunControlMessage_Hello initWithBytes:length:loggingPrefixString:]( v24,  "initWithBytes:length:loggingPrefixString:",  v13,  v16,  v25);

      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello controlChannelVersion](v26, "controlChannelVersion"));
      LODWORD(v25) = v27 == 0LL;

      if ((_DWORD)v25)
      {
        __int128 v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v98 = (void *)objc_claimAutoreleasedReturnValue([v393 vifName]);
          *(_DWORD *)buf = 138412290;
          v401 = v98;
          _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "%@: control message: hello control channel version is nil",  buf,  0xCu);
        }
      }

      else
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello instanceID](v26, "instanceID"));
        objc_msgSend(v28, "getUUIDBytes:", objc_msgSend(v393, "instanceID"));

        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello capabilityFlags](v26, "capabilityFlags"));
        objc_msgSend(v393, "setCapabilityFlags:", objc_msgSend(v29, "unsignedLongLongValue"));

        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunControlMessage_Hello serviceMinCompatibilityVersion]( v26,  "serviceMinCompatibilityVersion"));
        objc_msgSend( v393,  "setServiceMinCompatibilityVersion:",  (unsigned __int16)objc_msgSend(v30, "unsignedIntValue"));

        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v393 vifName]);
          *(_DWORD *)buf = 138412546;
          v401 = v32;
          __int16 v402 = 2112;
          *(void *)v403 = v26;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: got control message: %@", buf, 0x16u);
        }

        if (([v393 capabilityFlags] & 0x80) != 0)
        {
          uint64_t v33 = sub_1003BB3A8((uint64_t)[v393 connectionsTableByLocalRemotePortKey], 67109888);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if ([v34 checksumFailed])
          {
            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v401 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Control channel checksum failed while receiving Hello. Resetting connection %@",  buf,  0xCu);
            }

            -[IDSLinkManager triggerBTCorruptionRecoveryForCBUUID:]( v390->_linkManager,  "triggerBTCorruptionRecoveryForCBUUID:",  v9);
            -[IDSUTunController resetTCPConnection:forDeviceConnectionInfo:]( v390,  "resetTCPConnection:forDeviceConnectionInfo:",  v34,  v393);

            goto LABEL_113;
          }

          unint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v393 controlChannel]);
          [v103 setChecksumEnabled:1];
        }

        __int16 v104 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello controlChannelVersion](v26, "controlChannelVersion"));
        [v393 setControlChannelVersion:v104];

        os_unfair_lock_lock(&v390->_controlChannelVersionCacheLock);
        controlChannelVersionCache = v390->_controlChannelVersionCache;
        uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlMessage_Hello controlChannelVersion](v26, "controlChannelVersion"));
        -[NSMutableDictionary setObject:forKey:](controlChannelVersionCache, "setObject:forKey:", v106, v9);

        os_unfair_lock_unlock(&v390->_controlChannelVersionCacheLock);
        id v107 = [v9 isEqualToString:kIDSDefaultPairedDeviceID];
        if ((_DWORD)v107)
        {
          uint64_t v109 = im_primary_queue(v107, v108);
          v110 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v109);
          v397[0] = _NSConcreteStackBlock;
          v397[1] = 3221225472LL;
          v397[2] = sub_10033AE18;
          v397[3] = &unk_1008F5F80;
          id v398 = v393;
          v399 = v26;
          dispatch_async(v110, v397);
        }

        double v111 = (void *)objc_claimAutoreleasedReturnValue([v393 controlChannel]);
        unsigned int v112 = [v111 didReceiveReestablishmentRequest];

        if (v112)
        {
          BOOL v113 = (void *)objc_claimAutoreleasedReturnValue([v393 controlChannel]);
          [v113 setDidReceiveReestablishmentRequest:0];

          uint64_t v114 = OSLogHandleForTransportCategory("UTun-oversized");
          double v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v401 = v393;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "%@: reset control channel didReceiveReestablishmentRequest NO",  buf,  0xCu);
          }

          uint64_t v117 = os_log_shim_legacy_logging_enabled(v116);
          if ((_DWORD)v117)
          {
            if (_IDSShouldLogTransport(v117))
            {
              _IDSLogTransport( @"UTun-oversized",  @"IDS",  @"%@: reset control channel didReceiveReestablishmentRequest NO");
              if (_IDSShouldLog(0LL, @"UTun-oversized")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun-oversized",  @"%@: reset control channel didReceiveReestablishmentRequest NO");
              }
            }
          }
        }
      }

- (id)controlChannelVersionForCbuuid:(id)a3
{
  p_controlChannelVersionCacheLock = &self->_controlChannelVersionCacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_controlChannelVersionCacheLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_controlChannelVersionCache, "objectForKey:", v5));

  os_unfair_lock_unlock(p_controlChannelVersionCacheLock);
  return v6;
}

- (void)setupDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v147 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"account"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"service"]);
  if (v7)
  {
    int v144 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionStreamNameKey]);
    uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"protocol"]);
    uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionClientIDKey]);
    BOOL v139 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionConnectionUUIDKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionPriorityKey]);
    v141 = v8;
    if (v8) {
      uint64_t v134 = (uint64_t)[v8 integerValue];
    }
    else {
      uint64_t v134 = 200LL;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionCloudEnabledKey]);
    unsigned int v130 = [v10 BOOLValue];

    if (_IDSSupportsDirectMessaging(v11, v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionIsDirectMsgSocket]);
      char v128 = [v13 BOOLValue];

      switch(v134)
      {
        case 100LL:
          uint64_t v14 = 16LL;
          break;
        case 200LL:
          uint64_t v14 = 4LL;
          break;
        case 300LL:
          uint64_t v14 = 8LL;
          break;
        default:
          uint64_t v14 = 0LL;
          break;
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionDataProtectionClass]);
      unsigned int v16 = [v15 unsignedIntValue];

      if (v16 == 2)
      {
        v14 |= 1uLL;
      }

      else if (!v16)
      {
        v14 |= 2uLL;
      }

      int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionDirectMsgType]);
      int v18 = [v17 unsignedShortValue];
      switch(v18)
      {
        case 1:
          v14 |= 0x20uLL;
          break;
        case 5:
          v14 |= 0x80uLL;
          break;
        case 3:
          v14 |= 0x40uLL;
          break;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      char v128 = 0;
    }

    if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.siri.proxy"])
    {
      uint64_t v19 = 600LL;
    }

    else if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"])
    {
      uint64_t v19 = 800LL;
    }

    else
    {
      if (([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.fignero"] & 1) == 0)
      {
        uint64_t v131 = v134;
      }

      uint64_t v19 = 700LL;
    }

    uint64_t v131 = v19;
LABEL_35:
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionEncryptionMethodKey]);
    unsigned int v140 = v20;
    if (v20) {
      id v21 = [v20 integerValue];
    }
    else {
      id v21 = 0LL;
    }
    uint64_t v22 = IMGetCachedDomainValueForKey(@"com.apple.ids", @"UTunSocketProtocolOverride");
    uint64_t v145 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v145)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
      if ((objc_opt_isKindOfClass(v145, v24) & 1) != 0)
      {
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
          *(_DWORD *)buf = 138412802;
          uint64_t v159 = v26;
          __int16 v160 = 2112;
          *(void *)int v161 = v145;
          *(_WORD *)&v161[8] = 2112;
          *(void *)double v162 = v143;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: UTunSocketProtocolOverride [%@] instead of specified [%@]",  buf,  0x20u);
        }
      }
    }

    else {
      int v27 = 6;
    }
    unsigned int v129 = v27;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionRealTimeKey]);
    unsigned int v133 = [v28 BOOLValue];

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 cbuuid]);
    if ([v29 isEqualToString:kIDSDefaultPairedDeviceID])
    {
      unsigned int v138 = 1;
    }

    else
    {
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyDefaultPairedDevice]);
      unsigned int v138 = [v30 BOOLValue];
    }

    uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionCBUUIDKey]);
    if (v138) {
      id v135 = IDSDeviceDefaultPairedDeviceUniqueID;
    }
    else {
      id v135 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionDeviceUniqueIDKey]);
    }
    v146 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGenericConnectionID idWithAccount:service:name:]( &OBJC_CLASS___IDSGenericConnectionID,  "idWithAccount:service:name:",  v147,  v7,  v144));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionsByID]);
    uint64_t v32 = (IDSGenericConnection *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v146]);

    if (v32)
    {
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
        *(_DWORD *)buf = 138412802;
        uint64_t v159 = v34;
        __int16 v160 = 2112;
        *(void *)int v161 = v32;
        *(_WORD *)&v161[8] = 2112;
        *(void *)double v162 = v146;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@: found connection [%@] for ID [%@]",  buf,  0x20u);
      }

      if ((-[IDSGenericConnection stateFlags](v32, "stateFlags") & 1) == 0)
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"connectionContext"]);
        unsigned int v36 = v35;
        if (v35)
        {
          [v35 setDeviceConnectionInfo:v5];
          [v36 setConnection:v32];
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 readHandler]);
          -[IDSGenericConnection setReadHandler:](v32, "setReadHandler:", v37);

          unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
            unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v36 readHandler]);
            id v41 = objc_retainBlock(v40);
            *(_DWORD *)buf = 138412802;
            uint64_t v159 = v39;
            __int16 v160 = 2048;
            *(void *)int v161 = v41;
            *(_WORD *)&v161[8] = 2112;
            *(void *)double v162 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%@: early return: bypass utun with readHandler %p for connection [%@]",  buf,  0x20u);
          }
        }

        -[IDSGenericConnection setClientID:](v32, "setClientID:", v137);
        -[IDSGenericConnection setPriority:](v32, "setPriority:", v134);
        -[IDSGenericConnection setSocketTrafficClass:](v32, "setSocketTrafficClass:", v131);
        -[IDSGenericConnection setStateFlags:]( v32,  "setStateFlags:",  -[IDSGenericConnection stateFlags](v32, "stateFlags") | 1);
        -[IDSGenericConnection setIsCloudEnabled:](v32, "setIsCloudEnabled:", v130);
        -[IDSGenericConnection setIsDefaultPairedDevice:](v32, "setIsDefaultPairedDevice:", v138);
        -[IDSGenericConnection setIsRealTime:](v32, "setIsRealTime:", v133);
        if (v139)
        {
          -[IDSGenericConnection setIdsDeviceConnectionUUID:](v32, "setIdsDeviceConnectionUUID:", v139);
          unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceConnectionAWDMetrics sharedInstance]( &OBJC_CLASS___IDSDeviceConnectionAWDMetrics,  "sharedInstance"));
          -[IDSGenericConnection connectionInitTime](v32, "connectionInitTime");
          double v44 = v43;
          int v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection idsDeviceConnectionUUID](v32, "idsDeviceConnectionUUID"));
          [v42 setConnectionInitTime:v45 forConnectionUUID:v44];

          -[IDSGenericConnection firstDataPacketReceiveTime](v32, "firstDataPacketReceiveTime");
          if (v46 != 0.0)
          {
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceConnectionAWDMetrics sharedInstance]( &OBJC_CLASS___IDSDeviceConnectionAWDMetrics,  "sharedInstance"));
            -[IDSGenericConnection firstDataPacketReceiveTime](v32, "firstDataPacketReceiveTime");
            double v49 = v48;
            unsigned __int8 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection idsDeviceConnectionUUID](v32, "idsDeviceConnectionUUID"));
            [v47 setFirstPacketReceiveTime:v50 forConnectionUUID:v49];
          }
        }

        if (-[IDSGenericConnection sd](v32, "sd") == -1
          && (unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection connectError](v32, "connectError")),
              BOOL v52 = v51 == 0LL,
              v51,
              v52))
        {
          unsigned int v119 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket]);
          unsigned int v120 = [v119 BOOLValue];

          if (v120) {
            -[IDSGenericConnection setShouldSetAllowlistUUIDForStreamingSocket:]( v32,  "setShouldSetAllowlistUUIDForStreamingSocket:",  1LL);
          }
          uint64_t v62 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandler"]);
          id v63 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandlerQueue"]);
          -[IDSGenericConnection setCompletionQueue:](v32, "setCompletionQueue:", v63);
          -[IDSGenericConnection setOpenSocketCompletionHandler:](v32, "setOpenSocketCompletionHandler:", v62);
        }

        else
        {
          -[IDSGenericConnection setStateFlags:]( v32,  "setStateFlags:",  -[IDSGenericConnection stateFlags](v32, "stateFlags") | 2);
          int v53 = -[IDSGenericConnection sd](v32, "sd");
          unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection connectError](v32, "connectError"));
          -[IDSGenericConnection setSd:](v32, "setSd:", 0xFFFFFFFFLL);
          -[IDSGenericConnection setConnectError:](v32, "setConnectError:", 0LL);
          int v55 = TrafficClassForIDSOpenSocketPriorityLevel(v131);
          sub_10032CF20(v53, v55);
          unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket]);
          unsigned int v57 = [v56 BOOLValue];

          if (v57) {
            sub_10032D08C(v53);
          }
          if (v133)
          {
            -[IDSGenericConnection setShouldStopBTDatagramLink:](v32, "setShouldStopBTDatagramLink:", 1LL);
            __int16 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v159 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "openSocket for %@ using BT datagram link - start",  buf,  0xCu);
            }

            -[IDSLinkManager startBTDatagramLinkForDeviceUniqueID:cbuuid:]( self->_linkManager,  "startBTDatagramLinkForDeviceUniqueID:cbuuid:",  v135,  v136);
          }

          linkManager = self->_linkManager;
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v5 cbuuid]);
          unint64_t v61 = -[IDSLinkManager currentLinkType:](linkManager, "currentLinkType:", v60);

          uint64_t v62 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandlerQueue"]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10033C550;
          block[3] = &unk_100901860;
          id v153 = v6;
          int v157 = v53;
          id v155 = v54;
          unint64_t v156 = v61;
          id v154 = v5;
          id v63 = v54;
          dispatch_async(v62, block);
        }

LABEL_117:
        id v9 = v144;
        goto LABEL_118;
      }

      id v64 = [v5 portMap];
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection addressPair](v32, "addressPair"));
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 localAddress]);
      -[IDSUTunController releasePortIfNecessary:port:]( self,  "releasePortIfNecessary:port:",  v64,  [v66 saPortHostOrder]);

      -[IDSUTunController removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:]( self,  "removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:",  v32,  v5,  5102LL,  @"replace existing connection");
    }

    unsigned __int16 v151 = -21846;
    if (sub_1002A3D14((uint64_t)[v5 portMap], &v151))
    {
      uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
        *(_DWORD *)buf = 138412802;
        uint64_t v159 = v68;
        __int16 v160 = 2112;
        *(void *)int v161 = v7;
        *(_WORD *)&v161[8] = 2112;
        *(void *)double v162 = v144;
        _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%@: cannot allocate new port for service %@ name %@",  buf,  0x20u);
      }

      queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandlerQueue"]);
      v148[0] = _NSConcreteStackBlock;
      v148[1] = 3221225472LL;
      v148[2] = sub_10033C5F8;
      v148[3] = &unk_1008F5F80;
      id v149 = v5;
      id v150 = v6;
      dispatch_block_t v69 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v148);
      dispatch_async(queue, v69);

      uint64_t v70 = v149;
      uint64_t v71 = v32;
    }

    else
    {
      else {
        __int16 v72 = 1025;
      }
      unsigned __int16 v127 = v72;
      size_t v73 = (void *)objc_claimAutoreleasedReturnValue([v5 localSA]);
      queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithWrapper:andPortHostOrder:",  v73,  v151));

      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteSA]);
      uint64_t v126 = objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithWrapper:andPortHostOrder:",  v74,  v127));

      uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:remoteAddress:]( &OBJC_CLASS___IDSSockAddrWrapperPair,  "wrapperPairWithLocalAddress:remoteAddress:",  queue,  v126));
      BOOL v76 = self->_encryptionEnabled && v21 == 0LL;
      unsigned int v77 = objc_alloc(&OBJC_CLASS___IDSGenericConnection);
      if (v76)
      {
        uint64_t v71 = -[IDSGenericConnection initWithConnectionID:protocol:keyMaterialLength:isCloudEnabled:]( v77,  "initWithConnectionID:protocol:keyMaterialLength:isCloudEnabled:",  v146,  v129,  60LL,  v130);

        do
        {
          uint64_t v78 = arc4random();
          uint64_t v79 = sub_1003BB3A8((uint64_t)[v5 outgoingEncryptionTableBySSRC], v78);
          char v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
          BOOL v81 = v80 == 0LL;
        }

        while (!v81);
        -[IDSGenericConnection setSSRCSend:](v71, "setSSRCSend:", v78);
        -[IDSGenericConnection setSeqSendStart:](v71, "setSeqSendStart:", (unsigned __int16)arc4random());
        -[IDSGenericConnection setSeqSend:]( v71,  "setSeqSend:",  -[IDSGenericConnection seqSendStart](v71, "seqSendStart"));
        -[IDSGenericConnection setKeyMaterialLength:](v71, "setKeyMaterialLength:", 60LL);
        -[IDSGenericConnection setEncryptionEnabled:](v71, "setEncryptionEnabled:", 1LL);
        uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v83 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
          int v84 = v151;
          id v85 = objc_claimAutoreleasedReturnValue(-[IDSGenericConnection localConnectionGUID](v71, "localConnectionGUID"));
          id v86 = [v85 UTF8String];
          unsigned int v87 = -[IDSGenericConnection seqSendStart](v71, "seqSendStart");
          *(_DWORD *)buf = 138413570;
          uint64_t v159 = v83;
          __int16 v160 = 1024;
          *(_DWORD *)int v161 = v84;
          *(_WORD *)&v161[4] = 1024;
          *(_DWORD *)&v161[6] = v127;
          *(_WORD *)double v162 = 2080;
          *(void *)&v162[2] = v86;
          LOWORD(v163) = 1024;
          *(_DWORD *)((char *)&v163 + 2) = v78;
          HIWORD(v163) = 1024;
          unsigned int v164 = v87;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "%@: send setup encrypted channel message ports[%u:::%u] guid[%s] ssrc:%08x startSeq:%04x",  buf,  0x2Eu);
        }

        __int16 v88 = v151;
        uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection localConnectionGUID](v71, "localConnectionGUID"));
        unsigned __int16 v90 = -[IDSGenericConnection seqSendStart](v71, "seqSendStart");
        uint64_t v91 = sub_10033AB74( v129,  v88,  v127,  v89,  0LL,  v147,  v7,  v144,  v78,  SBYTE1(v78),  SBYTE2(v78),  SBYTE3(v78),  v90,  SHIBYTE(v90),  (uint64_t)-[IDSGenericConnection localKeyMaterial](v71, "localKeyMaterial"),  (unsigned __int16)-[IDSGenericConnection keyMaterialLength](v71, "keyMaterialLength"));
        __int128 v92 = (void *)objc_claimAutoreleasedReturnValue(v91);

        sub_1003BB0A4( (int *)[v5 outgoingEncryptionTableBySSRC],  -[IDSGenericConnection SSRCSend](v71, "SSRCSend"),  v71);
      }

      else
      {
        uint64_t v71 = -[IDSGenericConnection initWithConnectionID:protocol:isCloudEnabled:]( v77,  "initWithConnectionID:protocol:isCloudEnabled:",  v146,  v129,  v130);

        BOOL v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v94 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
          int v95 = v151;
          id v96 = objc_claimAutoreleasedReturnValue(-[IDSGenericConnection localConnectionGUID](v71, "localConnectionGUID"));
          id v97 = [v96 UTF8String];
          *(_DWORD *)buf = 138413058;
          uint64_t v159 = v94;
          __int16 v160 = 1024;
          *(_DWORD *)int v161 = v95;
          *(_WORD *)&v161[4] = 1024;
          *(_DWORD *)&v161[6] = v127;
          *(_WORD *)double v162 = 2080;
          *(void *)&v162[2] = v97;
          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%@: send setup channel message ports[%u:::%u] guid[%s]",  buf,  0x22u);
        }

        __int16 v98 = v151;
        unsigned int v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection localConnectionGUID](v71, "localConnectionGUID"));
        int v100 = sub_10033A8F0(v129, v98, v127, v99, 0LL, v147, v7, v144, v128, v14);
        __int128 v92 = (void *)objc_claimAutoreleasedReturnValue(v100);
      }

      __int128 v101 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"connectionContext"]);
      __int128 v102 = v101;
      if (v101)
      {
        [v101 setDeviceConnectionInfo:v5];
        [v102 setConnection:v71];
        unint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v102 readHandler]);
        -[IDSGenericConnection setReadHandler:](v71, "setReadHandler:", v103);

        __int16 v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
          uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v102 readHandler]);
          id v107 = objc_retainBlock(v106);
          *(_DWORD *)buf = 138412802;
          uint64_t v159 = v105;
          __int16 v160 = 2048;
          *(void *)int v161 = v107;
          *(_WORD *)&v161[8] = 2112;
          *(void *)double v162 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "%@: bypass utun with readHandler %p for connection [%@]",  buf,  0x20u);
        }
      }

      -[IDSGenericConnection setPriority:](v71, "setPriority:", v134);
      -[IDSGenericConnection setSocketTrafficClass:](v71, "setSocketTrafficClass:", v131);
      -[IDSGenericConnection setHasMoreData:](v71, "setHasMoreData:", 1LL);
      -[IDSGenericConnection setStateFlags:](v71, "setStateFlags:", 1LL);
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandler"]);
      -[IDSGenericConnection setOpenSocketCompletionHandler:](v71, "setOpenSocketCompletionHandler:", v108);
      uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"completionHandlerQueue"]);
      -[IDSGenericConnection setCompletionQueue:](v71, "setCompletionQueue:", v109);
      -[IDSGenericConnection setAddressPair:](v71, "setAddressPair:", v125);
      -[IDSGenericConnection setClientID:](v71, "setClientID:", v137);
      if (v139) {
        -[IDSGenericConnection setIdsDeviceConnectionUUID:](v71, "setIdsDeviceConnectionUUID:", v139);
      }
      v110 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionsByID]);
      [v110 setObject:v71 forKey:v146];

      uint64_t v111 = OSLogHandleForIDSCategory("UTun-oversized");
      unsigned int v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v113 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
        *(_DWORD *)buf = 138413058;
        uint64_t v159 = v113;
        __int16 v160 = 2112;
        *(void *)int v161 = v71;
        *(_WORD *)&v161[8] = 2112;
        *(void *)double v162 = v146;
        *(_WORD *)&v162[8] = 2112;
        id v163 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "%@: setting up new connection [%@] for ID [%@] deviceInfo[%@]",  buf,  0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled(v114)
        && _IDSShouldLog(0LL, @"UTun-oversized"))
      {
        uint64_t v123 = v146;
        id v124 = v5;
        unsigned int v121 = (void *)objc_claimAutoreleasedReturnValue([v5 vifName]);
        uint64_t v122 = v71;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun-oversized",  @"%@: setting up new connection [%@] for ID [%@] deviceInfo[%@]");
      }

      double v115 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "objectForKey:",  IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket,  v121,  v122,  v123,  v124));
      unsigned int v116 = [v115 BOOLValue];

      if (v116) {
        -[IDSGenericConnection setShouldSetAllowlistUUIDForStreamingSocket:]( v71,  "setShouldSetAllowlistUUIDForStreamingSocket:",  1LL);
      }
      uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue([v5 controlChannel]);
      [v117 sendMessage:v92];

      -[IDSGenericConnection setStateFlags:]( v71,  "setStateFlags:",  -[IDSGenericConnection stateFlags](v71, "stateFlags") | 4);
      if (qword_1009C0BE0 != -1) {
        dispatch_once(&qword_1009C0BE0, &stru_100901B20);
      }
      -[IDSGenericConnection setConnectionSetupStartTime:]( v71,  "setConnectionSetupStartTime:",  *(double *)&qword_1009C0B68 * (double)mach_continuous_time());
      -[IDSGenericConnection setIsDefaultPairedDevice:](v71, "setIsDefaultPairedDevice:", v138);
      -[IDSGenericConnection setIsRealTime:](v71, "setIsRealTime:", v133);
      if (v133)
      {
        -[IDSGenericConnection setShouldStopBTDatagramLink:](v71, "setShouldStopBTDatagramLink:", 1LL);
        id v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v159 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "openSocket for %@ using BT datagram link - start",  buf,  0xCu);
        }

        -[IDSLinkManager startBTDatagramLinkForDeviceUniqueID:cbuuid:]( self->_linkManager,  "startBTDatagramLinkForDeviceUniqueID:cbuuid:",  v135,  v136);
      }

      uint64_t v70 = (void *)v126;
    }

    uint64_t v32 = v71;
    goto LABEL_117;
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Service is nil, please provide a valid service name.",  buf,  2u);
  }

- (void)closeDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"account"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"service"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:IDSOpenSocketOptionStreamNameKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGenericConnectionID idWithAccount:service:name:]( &OBJC_CLASS___IDSGenericConnectionID,  "idWithAccount:service:name:",  v8,  v9,  v10));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionsByID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
    *(_DWORD *)buf = 138412802;
    id v31 = v15;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v7;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: closeSocketWithOptions called with options [%@] (connection %@)",  buf,  0x20u);
  }

  if (v13 && ([v13 stateFlags] & 1) != 0)
  {
    unsigned int v16 = v8;
    int v17 = self;
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 localConnectionGUID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteConnectionGUID]);
    id v29 = v16;
    uint64_t v20 = sub_10032ED20(v18, v19, v16, v9, v10);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    if (v21)
    {
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 vifName]);
        *(_DWORD *)buf = 138412802;
        id v31 = v23;
        __int16 v32 = 2112;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        uint64_t v35 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: close channel control message [%@] created for connection %@",  buf,  0x20u);
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 controlChannel]);
      [v24 sendMessage:v21];
    }

    id v25 = [v6 portMap];
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 addressPair]);
    id v28 = (void *)v21;
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localAddress]);
    -[IDSUTunController releasePortIfNecessary:port:]( v17,  "releasePortIfNecessary:port:",  v25,  [v27 saPortHostOrder]);

    -[IDSUTunController removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:]( v17,  "removeConnection:fromDeviceConnectionInfo:removeCode:removeReason:",  v13,  v6,  5103LL,  @"closeSocketWithOptions called");
    id v8 = v29;
  }
}

- (id)defaultPairedDeviceIdentityPair
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v3 = [v2 latestCopyMessageProtectionIdentityForDataProtectionClass:2];

  if (v3)
  {
    id v4 = -[IDSMPFullLegacyIdentity initWithFullIdentity:]( objc_alloc(&OBJC_CLASS___IDSMPFullLegacyIdentity),  "initWithFullIdentity:",  v3);
    CFRelease(v3);
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed creating local identity because latestCopyMessageProtectionIdentity is nil",  buf,  2u);
    }

    id v4 = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedDevicePublicKey]);

  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPPublicLegacyIdentity identityWithData:error:]( &OBJC_CLASS___IDSMPPublicLegacyIdentity,  "identityWithData:error:",  v7,  &v13));
  id v9 = v13;
  if (!v8)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed creating public identity from data: %@  (Error: %@)",  buf,  0x16u);
    }

    goto LABEL_12;
  }

  if (!v4)
  {
LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_13;
  }

  uint64_t v10 = -[IDSUTunControlChannelIdentityPair initWithLocalFullIdentity:remotePublicIdentity:]( objc_alloc(&OBJC_CLASS___IDSUTunControlChannelIdentityPair),  "initWithLocalFullIdentity:remotePublicIdentity:",  v4,  v8);
LABEL_13:

  return v10;
}

- (id)_prepareConnectionInfoWithCBUUID:(id)a3 deviceUniqueID:(id)a4 shouldUseIPsecLink:(BOOL)a5 identityPair:(id)a6 remoteDeviceEncryptionInfo:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunController setupNewDeviceConnectionInfoForCbuuid:deviceUniqueID:identityPair:remoteDeviceEncryptionInfo:shouldUseIPsecLink:]( self,  "setupNewDeviceConnectionInfoForCbuuid:deviceUniqueID:identityPair:remoteDeviceEncryptionInfo:shouldUseIPsecLink:",  v12,  a4,  a6,  a7,  v9));
  if (v13)
  {
    -[IDSLinkManager triggerFixedInterfaceLinksDidConnect](self->_linkManager, "triggerFixedInterfaceLinksDidConnect");
    id v14 = v13;
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: UTunController unable to create new device - cannot continue",  (uint8_t *)&v17,  0xCu);
    }
  }

  return v13;
}

- (void)prepareDefaultPairedConnectionInfoWithDeviceUniqueID:(id)a3 shouldUseIPsecLink:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10033CD94;
  v6[3] = &unk_100901888;
  BOOL v8 = a4;
  v6[4] = self;
  id v7 = a3;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)openSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (__CFDictionary *)[v8 mutableCopy];
  id v12 = [v10 copy];

  id v13 = objc_retainBlock(v12);
  if (v13) {
    CFDictionarySetValue(v11, @"completionHandler", v13);
  }

  if (v9)
  {
    id v16 = v9;
  }

  else
  {
    uint64_t v17 = im_primary_queue(v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (!v16) {
      goto LABEL_7;
    }
  }

  CFDictionarySetValue(v11, @"completionHandlerQueue", v16);

LABEL_7:
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", IDSOpenSocketOptionCBUUIDKey));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", IDSDevicePropertyDefaultPairedDevice));
  unsigned int v20 = [v19 BOOLValue];

  if (v20)
  {
    id v21 = IDSDeviceDefaultPairedDeviceUniqueID;
    LOBYTE(v22) = 1;
  }

  else
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", IDSOpenSocketOptionDeviceUniqueIDKey));
    int v22 = [v21 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", IDSOpenSocketOptionCloudEnabledKey));
  unsigned __int8 v24 = [v23 BOOLValue];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", IDSOpenSocketOptionIsIDSDSessionSocket));
  unsigned __int8 v26 = [v25 BOOLValue];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10033D388;
  v33[3] = &unk_1009018D8;
  id v34 = v18;
  uint64_t v35 = v11;
  char v40 = v22;
  unsigned int v36 = self;
  id v37 = v8;
  id v38 = v21;
  id v39 = (id)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey));
  unsigned __int8 v41 = v24;
  unsigned __int8 v42 = v26;
  id v27 = v39;
  id v28 = v21;
  id v29 = v8;
  unsigned int v30 = v11;
  id v31 = v18;
  IDSTransportThreadAddBlock(v33, v32);
}

- (void)cleanupSocketsForClient:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10033E15C;
  v6[3] = &unk_1008F8800;
  id v7 = a3;
  id v8 = self;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)closeSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10033E9A8;
  v12[3] = &unk_100901978;
  id v13 = a3;
  uint64_t v14 = self;
  id v15 = a4;
  id v16 = a5;
  id v8 = v15;
  id v9 = v16;
  id v10 = v13;
  IDSTransportThreadAddBlock(v12, v11);
}

- (void)closeSocketWithOptions:(id)a3
{
}

- (void)doCheckSuspendTrafficForDevice:(id)a3
{
  id v4 = a3;
  if (qword_1009C0BE0 != -1) {
    dispatch_once(&qword_1009C0BE0, &stru_100901B20);
  }
  double v5 = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
  [v4 suspendTrafficCheckTime];
  if (v6 <= v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionsByID]);
    uint64_t v11 = (char *)[v10 count];

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectionsByID", 0));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);

    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = 0LL;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v13);
          }
          v16 += [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) suspended];
        }

        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }

      while (v15);
    }

    else
    {
      id v16 = 0LL;
    }

    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v30 = *(double *)&v11;
      __int16 v31 = 2048;
      uint64_t v32 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Suspend traffic check: connections %lu =? suspended connections %lu",  buf,  0x16u);
    }

    if (v11 == v16)
    {
      uint64_t v21 = v4[2079];
      if (v21) {
        id fd = (id)os_channel_get_fd(v21, v20);
      }
      else {
        id fd = [v4 utunSocket];
      }
      IDSTransportThreadSuspendSocket(fd, 1LL);
      [v4 setSuspendTraffic:1];
      -[IDSLinkManager stopLinkForDeviceUniqueID:cbuuid:disconnectWP:]( self->_linkManager,  "stopLinkForDeviceUniqueID:cbuuid:disconnectWP:",  v4[2],  v4[1],  1LL);
    }

    else
    {
      [v4 setSuspendTraffic:0];
    }

    [v4 setSuspendTrafficCheckTime:0.0];
  }

  else
  {
    [v4 suspendTrafficCheckTime];
    double v8 = v7 - v5 + 0.5;
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v30 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Rescheduling suspend traffic check in %0.2lf seconds",  buf,  0xCu);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10033F27C;
    v27[3] = &unk_1008F8800;
    v27[4] = self;
    id v28 = v4;
    IDSTransportThreadAddBlockAfter(v27, v8);
  }
}

- (void)checkSuspendTrafficForDevice:(id)a3 wait:(BOOL)a4
{
  id v6 = a3;
  if (qword_1009C0BE0 != -1) {
    dispatch_once(&qword_1009C0BE0, &stru_100901B20);
  }
  uint64_t v7 = mach_continuous_time();
  if (a4)
  {
    double v8 = *(double *)&qword_1009C0B68 * (double)v7;
    [v6 suspendTrafficCheckTime];
    if (v9 == 0.0)
    {
      [v6 setSuspendTrafficCheckTime:v8 + 15.0];
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = 15.5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Scheduling a suspend traffic check in %0.2lf seconds",  buf,  0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10033F498;
      v14[3] = &unk_1008F8800;
      v14[4] = self;
      id v15 = v6;
      IDSTransportThreadAddBlockAfter(v14, 15.5);
    }

    else
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      double v12 = v8 + 15.0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [v6 suspendTrafficCheckTime];
        *(_DWORD *)buf = 134217984;
        double v17 = v12 - v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Extending suspend traffic check by %0.2lf seconds",  buf,  0xCu);
      }

      [v6 setSuspendTrafficCheckTime:v12];
    }
  }

  else
  {
    [v6 setSuspendTrafficCheckTime:0.0];
    -[IDSUTunController doCheckSuspendTrafficForDevice:](self, "doCheckSuspendTrafficForDevice:", v6);
  }
}

- (void)suspendSocketWithOptions:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10033F518;
  v6[3] = &unk_1008F8800;
  id v7 = a3;
  double v8 = self;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)resumeSocketWithOptions:(id)a3 shouldLogCall:(BOOL)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10033F7EC;
  v8[3] = &unk_100901888;
  id v9 = a3;
  id v10 = self;
  BOOL v11 = a4;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)releasePortIfNecessary:(IDSPortMap *)a3 port:(unsigned __int16)a4
{
  int v4 = a4;
  if ((a4 & 0xFFFE) == 0x400)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", a3));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "can't release a reserved port: %u",  (uint8_t *)v6,  8u);
    }
  }

  else
  {
    sub_1002A44F8((uint64_t)a3, a4);
  }

- (void)startUDPGlobalLinkForDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033FCBC;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)stopUDPGlobalLinkForDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033FD4C;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10033FF9C;
  v11[3] = &unk_1008F9038;
  v11[4] = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  IDSTransportThreadAddBlock(v11, v10);
}

- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10034007C;
  v11[3] = &unk_1008F9038;
  v11[4] = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  IDSTransportThreadAddBlock(v11, v10);
}

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100340154;
  v12[3] = &unk_1009019A0;
  void v12[4] = self;
  id v13 = a3;
  BOOL v15 = a4;
  id v14 = a5;
  BOOL v16 = a6;
  id v9 = v14;
  id v10 = v13;
  IDSTransportThreadAddBlock(v12, v11);
}

- (void)stopGlobalLinkForDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003401EC;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBuffer:(id *)a4
{
  linkManager = self->_linkManager;
  if (linkManager) {
    return -[IDSLinkManager sendPacketBuffer:toDeviceUniqueID:cbuuid:]( linkManager,  "sendPacketBuffer:toDeviceUniqueID:cbuuid:",  a4,  a3);
  }
  else {
    return 11LL;
  }
}

- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBufferArray:(id *)a4 arraySize:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  linkManager = self->_linkManager;
  if (linkManager)
  {
    unint64_t v10 = -[IDSLinkManager sendPacketBufferArray:arraySize:toDeviceUniqueID:cbuuid:]( linkManager,  "sendPacketBufferArray:arraySize:toDeviceUniqueID:cbuuid:",  a4,  v5,  v8,  v8);
  }

  else if ((int)v5 < 1)
  {
    unint64_t v10 = 11LL;
  }

  else
  {
    uint64_t v11 = v5;
    unint64_t v10 = 11LL;
    do
    {
      uint64_t v12 = (uint64_t)*a4++;
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  6396LL,  v12);
      --v11;
    }

    while (v11);
  }

  return v10;
}

- (void)startGlobalLinkForDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003404B0;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10034059C;
  v12[3] = &unk_1009019C8;
  int v16 = a6;
  void v12[4] = self;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  IDSTransportThreadAddBlock(v12, v11);
}

- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100340710;
  v10[3] = &unk_1009019F0;
  v10[4] = self;
  id v11 = a3;
  BOOL v13 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  IDSTransportThreadAddBlock(v10, v9);
}

- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003408A8;
  v11[3] = &unk_1008F8A00;
  v11[4] = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  IDSTransportThreadAddBlock(v11, v10);
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100340938;
  v6[3] = &unk_100901888;
  BOOL v8 = a3;
  void v6[4] = self;
  id v7 = a4;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)setTimeBase:(id)a3 forIDSSession:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003409EC;
  v8[3] = &unk_1008F7900;
  void v8[4] = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100340A8C;
  v7[3] = &unk_1008F8F98;
  BOOL v9 = a3;
  BOOL v10 = a4;
  v7[4] = self;
  id v8 = a5;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100340B20;
  v7[3] = &unk_100901888;
  v7[4] = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100340BB0;
  v7[3] = &unk_100901888;
  v7[4] = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100340C40;
  v7[3] = &unk_100901888;
  v7[4] = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  IDSTransportThreadAddBlock(v7, v6);
}

- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100340CD0;
  v6[3] = &unk_100901888;
  BOOL v8 = a3;
  void v6[4] = self;
  id v7 = a4;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100340D84;
  v8[3] = &unk_1008F7900;
  void v8[4] = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100340E38;
  v8[3] = &unk_1008F7900;
  void v8[4] = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100340EC0;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)clearCellInterfaceName:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100341038;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)clearIDSContextBlob:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003411B0;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10034135C;
  v10[3] = &unk_1008FB180;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  int v13 = a5;
  id v7 = v12;
  id v8 = v11;
  IDSTransportThreadAddBlock(v10, v9);
}

- (void)getLinkInformationForDevice:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100341414;
  v8[3] = &unk_1008F9778;
  void v8[4] = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)onTransportThread_SendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5
{
}

- (void)onTransportThread_SendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7
{
}

- (void)onTransportThread_setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
}

- (void)onTransportThread_requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5
{
}

- (void)onTransportThread_SetDefaultUnderlyingLink:(id)a3 linkID:(char)a4
{
}

- (void)onTransportThread_SetPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6
{
}

- (void)onTransportThread_DropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5
{
}

- (void)onTransportThread_UpdateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5
{
}

- (void)onTransportThread_StopKeepAlive:(id)a3 linkIDs:(id)a4
{
}

- (void)onTransportThread_setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4
{
}

- (void)onTransportThread_receiveJoinNotificationFromAParticipant:(id)a3
{
}

- (void)onTransportThread_CurrentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6
{
  uint64_t v10 = 0LL;
  int v9 = 0;
  -[IDSLinkManager currentCellularSignalStrength:signalRaw:signalStrength:signalGrade:]( self->_linkManager,  "currentCellularSignalStrength:signalRaw:signalStrength:signalGrade:",  a3,  (char *)&v10 + 4,  &v10,  &v9);
  if (a4) {
    *a4 = HIDWORD(v10);
  }
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = v9;
  }
}

- (void)onTransportThread_startLinkProbing:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_stopLinkProbing:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_queryLinkProbingStatus:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_flushLinkProbingStatus:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_sendStatsRequest:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_sendStatsRequestWithOptions:(id)a3 options:(id)a4
{
}

- (unint64_t)onTransportThread_getLinkType:(id)a3
{
  return -[IDSLinkManager currentLinkType:](self->_linkManager, "currentLinkType:", a3);
}

- (void)onTransportThread_manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
}

- (void)onTransportThread_removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5
{
}

- (void)onTransportThread_setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4
{
}

- (void)onTransportThread_getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6
{
}

- (void)onTransportThread_updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6
{
}

- (void)onTransportThread_updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6
{
}

- (void)onTransportThread_setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4
{
}

- (void)onTransportThread_registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5
{
}

- (unint64_t)onTransportThread_participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  return -[IDSLinkManager participantIDForAlias:salt:sessionID:]( self->_linkManager,  "participantIDForAlias:salt:sessionID:",  a3,  a4,  a5);
}

- (unint64_t)onTransportThread_createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  return -[IDSLinkManager createAliasForParticipantID:salt:sessionID:]( self->_linkManager,  "createAliasForParticipantID:salt:sessionID:",  a3,  a4,  a5);
}

- (void)onTransportThread_updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5
{
}

- (void)onTransportThread_sendConnectedLinkInfoToAVCForSessionID:(id)a3
{
}

- (void)onTransportThread_reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5
{
}

- (void)onTransportThread_reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6
{
}

- (void)onTransportThread_setClientUniquePID:(unint64_t)a3 sessionID:(id)a4
{
}

- (void)onTransportThread_requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4
{
}

- (void)startLocalSetup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1003416AC;
  v2[3] = &unk_1008F7948;
  v2[4] = self;
  IDSTransportThreadAddBlock(v2, a2);
}

- (void)obliterateConnectionInfoForCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedDeviceUUIDString]);
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    -[IDSUTunController obliterateConnectionInfoWithCompletionBlock:completionQueue:]( self,  "obliterateConnectionInfoWithCompletionBlock:completionQueue:",  0LL,  0LL);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "obliterateConnectionInfo called on a device that isnt the default paired device.  Ignoring...",  v9,  2u);
    }
  }

- (void)obliterateConnectionInfoWithCompletionBlock:(id)a3 completionQueue:(id)a4
{
}

- (void)obliterateConnectionInfoForCBUUID:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003418D4;
  v14[3] = &unk_100901978;
  v14[4] = self;
  id v15 = v8;
  id v16 = a5;
  id v17 = v9;
  id v10 = v16;
  id v11 = v9;
  id v12 = v8;
  IDSTransportThreadAddBlock(v14, v13);
}

- (void)tearDownEncryptionForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100341C58;
  v4[3] = &unk_1008F7948;
  v4[4] = self;
  IDSTransportThreadAddBlock(v4, a2);
}

- (void)addPairedDevice:(id)a3
{
}

- (void)addPairedDevice:(id)a3 shouldPairDirectlyOverIPsec:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100341DEC;
  v6[3] = &unk_100901888;
  BOOL v8 = a4;
  void v6[4] = self;
  id v7 = a3;
  id v4 = v7;
  IDSTransportThreadAddBlock(v6, v5);
}

- (void)connectPairedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100341F88;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)deletePairedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100342100;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (id)copyLinkStatsDict
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  BOOL v8 = sub_100334B1C;
  id v9 = sub_100334B2C;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003422C8;
  v4[3] = &unk_100901A60;
  v4[4] = self;
  void v4[5] = &v5;
  IDSTransportThreadAddSyncBlock(v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)clearPluginCacheForSession:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003423F0;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)clearReliableUnicastStateForSession:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100342568;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (id)onTransportThread_PerServiceDataTransferredForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    *(void *)&__int128 v28 = 0LL;
    *((void *)&v28 + 1) = &v28;
    uint64_t v29 = 0x3032000000LL;
    double v30 = sub_100334B1C;
    __int16 v31 = sub_100334B2C;
    id v32 = 0LL;
    uint64_t v8 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1009C0BE8);
      id v10 = [(id)qword_1009C0B58 mutableCopy];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009C0BE8);
      id v11 = [v9 connectionsTableByLocalRemotePortKey];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1003428FC;
      v20[3] = &unk_100901A88;
      id v21 = v7;
      __int128 v23 = &v28;
      id v12 = v10;
      id v22 = v12;
      sub_1003BB694((uint64_t)v11, (uint64_t)v20);
    }

    uint64_t v13 = OSLogHandleForIDSCategory("IDSUTunController");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 40LL);
      *(_DWORD *)buf = 136315394;
      __int128 v25 = "-[IDSUTunController onTransportThread_PerServiceDataTransferredForDevice:services:]";
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s: reporting service stats %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(1LL, @"IDSUTunController"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"IDSUTunController", @"%s: reporting service stats %@");
    }

    id v17 = *(id *)(*((void *)&v28 + 1) + 40LL);

    _Block_object_dispose(&v28, 8);
  }

  else
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v28) = 136315138;
      *(void *)((char *)&v28 + 4) = "-[IDSUTunController onTransportThread_PerServiceDataTransferredForDevice:services:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: invalid arguments",  (uint8_t *)&v28,  0xCu);
    }

    id v17 = 0LL;
  }

  return v17;
}

- (id)perServiceDataTransferredForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000LL;
    id v17 = sub_100334B1C;
    id v18 = sub_100334B2C;
    id v19 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100342CA4;
    v11[3] = &unk_100901AB0;
    p___int128 buf = &buf;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    IDSTransportThreadAddSyncBlock(v11);
    id v8 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataTransferredForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (id)perServiceDataSentForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000LL;
    id v17 = sub_100334B1C;
    id v18 = sub_100334B2C;
    id v19 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100342E9C;
    v11[3] = &unk_100901B00;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    p___int128 buf = &buf;
    IDSTransportThreadAddSyncBlock(v11);
    id v8 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataSentForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (id)perServiceDataReceivedForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000LL;
    id v17 = sub_100334B1C;
    id v18 = sub_100334B2C;
    id v19 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003432E8;
    v11[3] = &unk_100901B00;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    p___int128 buf = &buf;
    IDSTransportThreadAddSyncBlock(v11);
    id v8 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataReceivedForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (unint64_t)totalPacketsSentForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100343678;
  v12[3] = &unk_100901B00;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  IDSTransportThreadAddSyncBlock(v12);
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (unint64_t)totalPacketsReceivedForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100343928;
  v12[3] = &unk_100901B00;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  IDSTransportThreadAddSyncBlock(v12);
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100343B34;
  v3[3] = &unk_1008F8960;
  v3[4] = self;
  BOOL v4 = a3;
  IDSTransportThreadAddBlock(v3, a2);
}

- (void)setLinkPreferences:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100343CC8;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100343E04;
  v10[3] = &unk_1008FB180;
  v10[4] = self;
  id v11 = a3;
  unsigned int v13 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  IDSTransportThreadAddBlock(v10, v9);
}

- (void)sendSuspendOTRNegotiationMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100343F94;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return -[IDSUTunController handleIncomingPacket:fromDeviceToken:]( self,  "handleIncomingPacket:fromDeviceToken:",  a4,  a6,  a5);
}

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = a5;
  uint64_t v11 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = OSLogHandleForIDSCategory("UTun-oversized");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[throughput] Now can send to device %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"UTun-oversized"))
  {
    uint64_t v27 = v12;
    _IDSLogV(0LL, @"IDSFoundation", @"UTun-oversized", @"[throughput] Now can send to device %@");
  }

  if (v12)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePolicyController sharedInstance]( &OBJC_CLASS___IDSDevicePolicyController,  "sharedInstance"));
    unsigned int v17 = [v16 shouldBlackOutDeviceWithCbuuid:v10];

    if (v17)
    {
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 controlChannel]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceUniqueID]);
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v29 = v10;
        __int16 v30 = 2112;
        __int16 v31 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Device %@/%@ is blacked out due to fairplay failures",  buf,  0x16u);
      }

      -[IDSLinkManager stopLinkForDeviceUniqueID:cbuuid:disconnectWP:]( self->_linkManager,  "stopLinkForDeviceUniqueID:cbuuid:disconnectWP:",  v9,  v10,  1LL);
    }

    else
    {
      id v21 = objc_claimAutoreleasedReturnValue([v12 vifName]);
      sub_10034409C((const char *)[v21 UTF8String], 1);

      if (([v12 linkLayerConnected] & 1) == 0)
      {
        [v12 setLinkLayerConnected:1];
        if (qword_1009C0BE0 != -1) {
          dispatch_once(&qword_1009C0BE0, &stru_100901B20);
        }
        mach_continuous_time();
        [v12 linkLayerDisconnectTime];
        if ([v10 isEqualToString:kIDSDefaultPairedDeviceID])
        {
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "link is connected for default paired device, check suspended OTR sessions...",  buf,  2u);
          }

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v12 controlChannel]);
          [v23 resumeOTRNegotiation];
        }
      }

      objc_msgSend(v12, "setSuspendTraffic:", 0, v27);
      uint64_t v25 = v12[2079];
      if (v25) {
        id fd = (id)os_channel_get_fd(v25, v24);
      }
      else {
        id fd = [v12 utunSocket];
      }
      IDSTransportThreadResumeSocket(fd, 1LL);
      [v12 performBlocksOnLinkConnect];
    }
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = OSLogHandleForIDSCategory("UTun-oversized");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[throughput] Now cannot send to device %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"UTun-oversized"))
  {
    __int128 v23 = v12;
    _IDSLogV(0LL, @"IDSFoundation", @"UTun-oversized", @"[throughput] Now cannot send to device %@");
  }

  if (v12)
  {
    id v16 = objc_claimAutoreleasedReturnValue([v12 vifName]);
    sub_10034409C((const char *)[v16 UTF8String], 0);

    if ([v12 linkLayerConnected])
    {
      [v12 setLinkLayerConnected:0];
      if (qword_1009C0BE0 != -1) {
        dispatch_once(&qword_1009C0BE0, &stru_100901B20);
      }
      [v12 setLinkLayerDisconnectTime:*(double *)&qword_1009C0B68 * (double)mach_continuous_time()];
    }

    if (objc_msgSend(v10, "isEqualToString:", kIDSDefaultPairedDeviceID, v23))
    {
      uint64_t v18 = v12[2079];
      if (v18)
      {
        uint64_t fd = os_channel_get_fd(v18, v17);
        IDSTransportThreadSuspendSocket(fd, 1LL);
      }

      else
      {
        IDSTransportThreadSuspendSocket([v12 utunSocket], 1);
      }
    }

    else if (([v12 suspendTraffic] & 1) == 0)
    {
      uint64_t v21 = v12[2079];
      if (v21)
      {
        uint64_t v22 = os_channel_get_fd(v21, v20);
        IDSTransportThreadResumeSocket(v22, 1LL);
      }

      else
      {
        IDSTransportThreadResumeSocket([v12 utunSocket], 1);
      }
    }
  }
}

- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v6 = a4;
  uint64_t v7 = sub_1003BBA5C((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)a6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v8[1];
      v15[0] = 67109378;
      v15[1] = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[throughput] Has space available(%d) for device %@",  (uint8_t *)v15,  0x12u);
    }

    uint64_t v12 = v8[2079];
    if (v6)
    {
      if (v12) {
        id fd = (id)os_channel_get_fd(v12, v11);
      }
      else {
        id fd = [v8 utunSocket];
      }
      IDSTransportThreadResumeSocket(fd, 1LL);
    }

    else
    {
      if (v12) {
        id v14 = (id)os_channel_get_fd(v12, v11);
      }
      else {
        id v14 = [v8 utunSocket];
      }
      IDSTransportThreadSuspendSocket(v14, 1LL);
    }
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunController defaultPairedDeviceIdentityPair](self, "defaultPairedDeviceIdentityPair", a3));
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "localdevicecontroller callback [%@]", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100344B88;
  v8[3] = &unk_1008F8800;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)clearStats
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1009C0B58 allValues]);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)v6);
        if (v7)
        {
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) setPacketsSent:0];
          [v7 setPacketsReceived:0];
          [v7 setBytesSent:0];
          [v7 setBytesReceived:0];
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009C0BE8);
}

- (unint64_t)onTransportThread_SendWithConnectionContext:(id)a3 packetBuffer:(id *)a4
{
  id v6 = a3;
  IDSLinkPacketBufferAddBufferStart(a4, 4294967288LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  unsigned int v8 = [v7 uint32Key];

  *a4->var0 = HIBYTE(v8);
  a4->var0[1] = BYTE2(v8);
  a4->var0[2] = BYTE1(v8);
  a4->var0[3] = v8;
  a4->var0[4] = BYTE1(a4->var2);
  a4->var0[5] = a4->var2;
  a4->var0[7] = 0;
  a4->var0[6] = 0;
  var0 = a4->var0;
  int64_t var2 = a4->var2;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceConnectionInfo]);

  LOBYTE(v13) = 1;
  -[IDSUTunController handleIPPayload:bytesLength:source:destination:upperProtocol:forDeviceConnectionInfo:flush:callerShouldStop:]( self,  "handleIPPayload:bytesLength:source:destination:upperProtocol:forDeviceConnectionInfo:flush:callerShouldStop:",  var0,  var2,  0LL,  0LL,  17LL,  v11,  v13,  0LL);

  _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunController.m",  7368LL,  a4);
  return 0LL;
}

- (void)onTransportThread_StopBTDatagramLinkForDefaultPairedDevice
{
}

- (IDSLinkManager)linkManager
{
  return self->_linkManager;
}

- (void).cxx_destruct
{
}

@end