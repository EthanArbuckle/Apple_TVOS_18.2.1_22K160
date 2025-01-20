@interface IDSDSession
- (BOOL)_checkAndSendCachedDataForClient:(id)a3;
- (BOOL)_shouldEnableCellularSlicingAfterDiceRoll;
- (BOOL)_shouldSubmitMetricsBasedOnDate:(id)a3 isInitiator:(BOOL)a4;
- (BOOL)_shouldSubmitMetricsForThisSession;
- (BOOL)_shouldUseIPsecLink;
- (BOOL)_useBTDatagramPipe;
- (BOOL)destinationsContainFromURI:(id)a3;
- (BOOL)disallowCellularInterface;
- (BOOL)disallowWifiInterface;
- (BOOL)enableQuickRelay;
- (BOOL)handOffOverQREnabled;
- (BOOL)isInitiator;
- (BOOL)isLightweightParticipant;
- (BOOL)isScreenSharingSession;
- (BOOL)isWithDefaultPairedDevice;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)sessionIsActive;
- (BOOL)sharedSessionHasJoined;
- (BOOL)shouldAllocateForInvitee;
- (BOOL)shouldConnectToQRServer;
- (BOOL)shouldReportToClient:(id)a3 timeStamp:(double)a4 type:(unint64_t)a5;
- (BOOL)shouldReportUPlusOneKey;
- (BOOL)shouldVerifySignatureForMaterialType:(int)a3;
- (IDSDAccountController)accountController;
- (IDSDGroupStatusNotificationController)groupStatusNotificationController;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6 accountController:(id)a7 utunController:(id)a8;
- (IDSDSessionInvitationManager)invitationManager;
- (IDSDSessionMessenger)messenger;
- (IDSDSessionSharedState)sharedState;
- (IDSGFTMetricsCollector)metricsCollector;
- (IDSQuickRelayAllocator)qrAllocator;
- (IDSUTunController)utunController;
- (IDSXPCGroupSessionKeyValueDelivery)keyValueDelivery;
- (NSArray)requiredCapabilities;
- (NSArray)requiredLackOfCapabilities;
- (NSData)encryptedDataBlob;
- (NSData)encryptedMirageHandshakeBlob;
- (NSNumber)qrError;
- (NSNumber)qrReason;
- (NSSet)destinations;
- (NSSet)serverDesiredMaterials;
- (NSString)clientID;
- (NSString)description;
- (NSString)instanceID;
- (NSString)serviceIdentifier;
- (char)keyMaterial;
- (double)_serverSpecifiedJoinNotificationDeliveryTimeout;
- (double)getIDSContextTimeStamp;
- (id)_acceptedDeviceToken;
- (id)_acceptedDeviceUniqueID;
- (id)_breakDictionaryIntoMultipleChunks:(id)a3 chunkSize:(int)a4;
- (id)_checkIfPushMessageSizeGreaterThanMaxLimit:(id)a3 maxLimit:(unint64_t)a4;
- (id)_createGroupSessionActiveParticipantsFromParticipants:(id)a3 pushTokenForParticipants:(id)a4;
- (id)_createOneWayParticipantDictionaryFromMappedParticipantsDict:(id)a3;
- (id)_createStreamSubscriptionRequest:(id)a3;
- (id)_extractFieldBytesFromMetadata:(const void *)a3 ofSize:(unsigned int)a4 packetBuffer:(id *)a5;
- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3;
- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3 timeStamp:(double)a4;
- (id)_getNewLinkOptionsForActiveParticipantInfoRequest;
- (id)_getPushTokenFromParticipantID:(unint64_t)a3;
- (id)_getPushTokenFromParticipantIDNumber:(id)a3;
- (id)_getPushTokensFromParticipantIDArray:(id)a3 useNullPlaceholder:(BOOL)a4;
- (id)_getURIFromParticipantIDNumber:(id)a3;
- (id)_socketOptionsForDevice:(id)a3 uniqueID:(id)a4 pushToken:(id)a5 connectionSuffix:(id)a6;
- (id)accountID;
- (id)buildRTCSummaryReport;
- (id)clientChannelUUID;
- (id)connectDuration;
- (id)destinationsLightweightStatus;
- (id)formAndEncryptDataBlob:(id)a3 type:(int)a4;
- (id)fromURI;
- (id)getAppID;
- (id)getCallerCert;
- (id)getCellularNetworkInfo:(id)a3;
- (id)getDesiredMaterialSetForEncryptedData;
- (id)getEncryptedDataBlob;
- (id)getEncryptedMirageHandshakeBlob;
- (id)getFromService;
- (id)getLinkIDToLocalRemoteEndpointPairDictionary;
- (id)groupID;
- (id)participantID;
- (id)rtcNormalizeTime:(double)a3;
- (id)serverDesiredKeyMaterials;
- (id)sessionDuration;
- (id)uniqueID;
- (int64_t)_loggingFlags;
- (int64_t)clientType;
- (unint64_t)_getExperimentGroupThresholdForCellularSlicing;
- (unint64_t)connectionCountHint;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)globalLinkErrorToSessionEndReason:(int64_t)a3;
- (unsigned)groupSessionState;
- (unsigned)state;
- (void)InvalidateStableKeyMaterialInFrameworkCache:(id)a3;
- (void)_broadcastSessionStartWithSocket:(int)a3;
- (void)_checkAndRunClientChannelTests:(id)a3;
- (void)_checkAndUnassertRealTimeMode;
- (void)_cleanupQuickRelaySession;
- (void)_cleanupSessionConnection;
- (void)_cleanupSocketPairConnection;
- (void)_closeSocketToDevice:(id)a3;
- (void)_connectQRDirectlyToClientChannel:(id)a3;
- (void)_connectSocketDescriptor:(int)a3 toClientChannel:(id)a4;
- (void)_decryptReceivedDataBlobsUsingSKMs;
- (void)_endSession;
- (void)_generateKeys:(id)a3;
- (void)_invalidateClientChannel:(id)a3;
- (void)_lightweightParticipantSync:(unsigned __int8)a3;
- (void)_noteJoinNotificationDidDeliverWithSuccess:(BOOL)a3;
- (void)_noteJoinNotificationWillSend;
- (void)_notifyClientsSessionStopped;
- (void)_processParticipantInfo:(id)a3 type:(unint64_t)a4;
- (void)_receivedReinitiateBringupAckMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateBringupMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateRequestMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateTeardownAckMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateTeardownMessage:(id)a3 fromURI:(id)a4;
- (void)_reportRTC;
- (void)_resetPreferences:(id)a3;
- (void)_sendClientDecryptedDatabBlobs:(id)a3 type:(int)a4 forParticipant:(id)a5;
- (void)_sendConnectedLinkInfoToAVC;
- (void)_sendLinkSelectionPreference:(id)a3 linkScore:(id)a4 ipPreference:(id)a5 uplinkNackDisabled:(id)a6;
- (void)_sendParticipantMappingUpdateToClient:(id)a3 forLinkID:(char)a4 shouldReplace:(BOOL)a5;
- (void)_sendQREventToAVC:(id)a3;
- (void)_sendRemoteParticipantInfoEventToClient:(id)a3 forParticipant:(id)a4;
- (void)_sendSessionEndWithData:(id)a3;
- (void)_sendSessionInfoResponseErrorToClient:(unsigned int)a3;
- (void)_sendStreamSubscriptionRequest:(id)a3;
- (void)_sendingOfflineActiveParticipantInfoRequest:(id)a3;
- (void)_sessionStartWithSocketDescriptor:(int)a3;
- (void)_setClientType:(int64_t)a3;
- (void)_setInitialLinkType:(unint64_t)a3;
- (void)_setLinkProtocol:(id)a3;
- (void)_startReinitiateAsInitiator;
- (void)_updateActiveLightweightParticipants:(id)a3;
- (void)_updateActiveParticipants:(id)a3;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)addQREventForRTCReport:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)checkAndCallSessionStart;
- (void)cleanupSessionWithCleanStatus:(BOOL)a3;
- (void)connectQRServer:(id)a3 withPreferredLocalInterface:(int)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)connection:(id)a3 receivedData:(id)a4;
- (void)connectionDidStop:(id)a3 error:(id)a4;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4;
- (void)dealloc;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5;
- (void)didCreateMKM:(id)a3;
- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4;
- (void)didReceiveCurrentCellularSignalRaw:(int)a3 signalStrength:(int)a4 signalGrade:(int)a5;
- (void)didSendKeyMaterial:(id)a3 duration:(double)a4;
- (void)didSessionReinitiated;
- (void)enableP2Plinks;
- (void)endSession;
- (void)endSessionWithData:(id)a3;
- (void)endSessionWithReason:(unsigned int)a3;
- (void)getActiveParticipants:(id)a3 pushTokenForParticipants:(id)a4 isLightweightParticipant:(BOOL)a5;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (void)hasOutdatedSKI:(id)a3;
- (void)invalidateKeyMaterialByKeyIndexes:(id)a3;
- (void)invitationDeclined;
- (void)joinWithOptions:(id)a3;
- (void)joinWithOptions:(id)a3 messageContext:(id)a4;
- (void)leaveGroupSession:(id)a3 options:(id)a4;
- (void)link:(id)a3 didAddQREvent:(id)a4;
- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4;
- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7;
- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6;
- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4;
- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4;
- (void)link:(id)a3 didRATChange:(unsigned __int8)a4;
- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveDebugDataForClient:(id)a4 dataType:(unsigned __int8)a5;
- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4;
- (void)link:(id)a3 didReceiveEncryptionInformation:(id)a4;
- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4;
- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6;
- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5;
- (void)link:(id)a3 didReceiveMembershipChangedInformation:(unsigned __int8)a4;
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
- (void)link:(id)a3 didSoMaskChange:(unsigned int)a4;
- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4;
- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4;
- (void)mapMKIFromMaterial:(id)a3 token:(id)a4;
- (void)materialInfoError:(id)a3;
- (void)networkingIsAvailable:(id)a3;
- (void)onParticipantID2PushTokenMappingChange:(id)a3;
- (void)onURI2ParticipantIDMappingChange:(id)a3 allocateResponse:(id)a4;
- (void)openSocketToDevice:(id)a3;
- (void)processAllocationErrorStatus:(int)a3 errorCode:(int)a4;
- (void)qrAllocatorDidReceiveAllocateResponse:(id)a3;
- (void)receiveAndDecryptEncryptedDataBlobs:(id)a3;
- (void)receiveJoinNotificationFromAParticipant;
- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4;
- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4;
- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4;
- (void)receivedEndMessage:(id)a3 fromURI:(id)a4;
- (void)receivedReinitiateMessage:(id)a3 fromURI:(id)a4;
- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4;
- (void)reconnectSession;
- (void)recvKeyMaterial:(id)a3;
- (void)recvMembershipChangeEventWithReason:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)recvStableKeyMaterialForFrameworkCache:(id)a3;
- (void)registerClientChannel;
- (void)registerMultiplexerTransport;
- (void)registerPluginWithOptions:(id)a3 messageContext:(id)a4;
- (void)reinitiate;
- (void)rejectedKeyRecoveryRequestFromURI:(id)a3 reason:(unsigned int)a4;
- (void)removeParticipantIDs:(id)a3;
- (void)reportFirstMKMReceivedFromPush:(double)a3;
- (void)reportFirstMKMReceivedFromQR:(double)a3;
- (void)reportJoinReceivedOverPushFromToken:(id)a3;
- (void)reportMKMReceivedOverPushFromToken:(id)a3 material:(id)a4;
- (void)reportMKMReceivedOverPushViaCacheForParticipantID:(unint64_t)a3 material:(id)a4;
- (void)reportMKMReceivedOverQRFromToken:(id)a3 material:(id)a4;
- (void)reportPreKeyReceivedOverPushFromToken:(id)a3;
- (void)reportSendRatchetedMKMToAVCForParticipantID:(unint64_t)a3 mki:(id)a4;
- (void)requestEncryptionKeyForParticipantIDs:(id)a3;
- (void)requestKeyValueDeliveryDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)requestMaterialsForParticipantIDs:(id)a3 materialType:(int)a4;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4;
- (void)runConnectivityCheckWithCompletionBlock:(id)a3;
- (void)sendAllocationRequest:(id)a3;
- (void)sendCancelInvitationMessage;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4;
- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4;
- (void)sendKeyMaterialMessageDataOverQR:(id)a3 toDestination:(id)a4 completionBlock:(id)a5;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)setAcceptedRelaySession:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3;
- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3;
- (void)setGroupStatusNotificationController:(id)a3;
- (void)setGroupStreamInfo:(id)a3 sessionInfo:(id)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setInvitationManager:(id)a3;
- (void)setInviteTimeout:(int64_t)a3;
- (void)setMessenger:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setParticipantIDToURI:(id)a3 participantID:(id)a4;
- (void)setPreferences:(id)a3;
- (void)setQrAllocator:(id)a3;
- (void)setQrError:(id)a3;
- (void)setQrReason:(id)a3;
- (void)setQuickRelaySessionToken:(id)a3;
- (void)setQuickRelayUserTypeForSession:(unsigned __int16)a3;
- (void)setRemoteBlob:(id)a3;
- (void)setRemoteUseCloudPairedControlChannel:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSeqRecvStart:(unsigned int)a3;
- (void)setServerDesiredKeyMaterials:(id)a3 signer:(id)a4;
- (void)setServiceIdentifier:(id)a3;
- (void)setSharedSessionHasJoined:(BOOL)a3;
- (void)setSharedState:(id)a3;
- (void)setShouldConnectToQRServer:(BOOL)a3;
- (void)setUtunController:(id)a3;
- (void)startListeningOnClientSocket:(int)a3 isRawSocket:(BOOL)a4;
- (void)startQRSession;
- (void)submitAWDMetricsForIDSSessionAcceptReceived;
- (void)submitAWDMetricsForIDSSessionAcceptSent;
- (void)submitAWDMetricsForIDSSessionCancelReceived;
- (void)submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:(unsigned int)a3 numberOfRecipients:(id)a4;
- (void)submitAWDMetricsForIDSSessionCompleted;
- (void)submitAWDMetricsForIDSSessionConnected;
- (void)submitAWDMetricsForIDSSessionDeclineReceived;
- (void)submitAWDMetricsForIDSSessionDeclineSent;
- (void)submitAWDMetricsForIDSSessionInvitationReceived;
- (void)submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:(id)a3;
- (void)submitAWDMetricsForIDSSessionReinitiateConnected;
- (void)submitAWDMetricsForIDSSessionReinitiateRequested;
- (void)submitAWDMetricsForIDSSessionReinitiateStarted;
- (void)submitAWDMetricsForIDSSessionStarted;
- (void)submitAWDMetricsForIDSSessionWithEndReason:(unsigned int)a3;
- (void)terminateCallDueToIdleClientForLink:(id)a3;
- (void)unregisterClientChannel;
- (void)unregisterPluginWithOptions:(id)a3 messageContext:(id)a4;
- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6 lightweightStatusDict:(id)a7;
- (void)updateParticipantData:(id)a3 withContext:(id)a4;
- (void)updateParticipantInfo:(id)a3;
- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 triggeredLocally:(BOOL)a5 withContext:(id)a6 lightweightStatusDict:(id)a7;
- (void)updateRelevantEncryptedDataBlob;
- (void)updateServerDesiredKeyMaterials;
- (void)updateServerDesiredKeyValueDeliveryMaterialsNeeded;
- (void)writeToClientChannel:(id)a3 packetBuffer:(id *)a4 metaData:(const char *)a5 metadataSize:(unsigned int)a6;
@end

@implementation IDSDSession

- (int64_t)_loggingFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v3 = [v2 isScreenSharingSession];

  if (v3) {
    return 8703LL;
  }
  else {
    return 511LL;
  }
}

- (void)_generateKeys:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  id v6 = [v5 createRealTimeEncryptionFullIdentityForDevice:v4 completionBlock:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 stableKeyMaterialForGroup:v9 sessionID:v11]);

  if (v12)
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
      *(_DWORD *)buf = 138412802;
      v56 = v16;
      __int16 v57 = 2112;
      v58 = v12;
      __int16 v59 = 2112;
      v60 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ has valid SKM: %@ for sessionID: %@",  buf,  0x20u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 groupID]);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        v53 = v12;
        v54 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
        v52 = v22;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"%@ has valid SKM: %@ for sessionID: %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v22, v12, v54));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 groupID]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          v53 = v12;
          v54 = (void *)objc_claimAutoreleasedReturnValue([v26 uniqueID]);
          v52 = v25;
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"%@ has valid SKM: %@ for sessionID: %@");
        }
      }
    }
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 groupID]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueID]);
    [v27 createStableKeyMaterialAndSendToFrameworkForGroup:v29 sessionID:v31];
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance",  v52,  v53,  v54));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 groupID]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 uniqueID]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v32 stableKeyMaterialForGroup:v34 sessionID:v36]);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 uniqueID]);

  id v40 = objc_claimAutoreleasedReturnValue([v39 stringByAppendingString:@"datablob-context"]);
  v41 = (const char *)[v40 UTF8String];

  v42 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v41, strlen(v41));
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  os_unfair_lock_lock(&self->_lock);
  v44 = -[IDSGroupEncryptionKeyManager initWithEncryptionContext:encryptionKeySize:]( objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyManager),  "initWithEncryptionContext:encryptionKeySize:",  v43,  32LL);
  dataBlobEncryptionManager = self->_dataBlobEncryptionManager;
  self->_dataBlobEncryptionManager = v44;

  uint64_t v46 = OSLogHandleForTransportCategory("IDSDSession");
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v37;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "SKM: %@", buf, 0xCu);
  }

  uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
  if ((_DWORD)v49)
  {
    if (_IDSShouldLogTransport(v49))
    {
      _IDSLogTransport(@"IDSDSession", @"IDS", @"SKM: %@");
    }
  }

  if (v37)
  {
    -[IDSGroupEncryptionKeyManager recvKeyMaterial:](self->_dataBlobEncryptionManager, "recvKeyMaterial:", v37);
    v50 = -[IDSGroupSessionDataCryptor initWithTopic:keyManager:]( objc_alloc(&OBJC_CLASS___IDSGroupSessionDataCryptor),  "initWithTopic:keyManager:",  @"dataBlobEncryption",  self->_dataBlobEncryptionManager);
    cryptorForBlobs = self->_cryptorForBlobs;
    self->_cryptorForBlobs = v50;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___IDSDSessionDefaultAvailabilityCheck);
  v12 = -[IDSDSession initWithAccount:destinations:options:availabilityCheck:]( self,  "initWithAccount:destinations:options:availabilityCheck:",  v10,  v9,  v8,  v11);

  return v12;
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
  v16 = -[IDSDSession initWithAccount:destinations:options:availabilityCheck:accountController:utunController:]( self,  "initWithAccount:destinations:options:availabilityCheck:accountController:utunController:",  v13,  v12,  v11,  v10,  v14,  v15);

  return v16;
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6 accountController:(id)a7 utunController:(id)a8
{
  id v386 = a3;
  v391 = (__CFString *)a4;
  id v14 = a5;
  id v378 = a6;
  id v387 = a7;
  id v379 = a8;
  v402.receiver = self;
  v402.super_class = (Class)&OBJC_CLASS___IDSDSession;
  v15 = -[IDSDSession init](&v402, "init");

  if (!v15) {
    goto LABEL_229;
  }
  v388 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionUniqueIDKey]);
  v376 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionTransportTypeKey]);
  v384 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionConnectionCountHintKey]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionInstanceIDKey]);
  instanceID = v15->_instanceID;
  v15->_instanceID = (NSString *)v16;

  uint64_t v18 = IDSSessionIsInitiatorKey;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionIsInitiatorKey]);
  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v18]);
    uint64_t v21 = (uint64_t)[v20 BOOLValue];
  }

  else
  {
    uint64_t v21 = 1LL;
  }

  objc_storeStrong((id *)&v15->_accountController, a7);
  objc_storeStrong((id *)&v15->_utunController, a8);
  v377 = (void *)objc_claimAutoreleasedReturnValue([v387 accountWithUniqueID:v386]);
  v385 = (void *)objc_claimAutoreleasedReturnValue([v377 service]);
  v390 = (void *)objc_claimAutoreleasedReturnValue([v385 identifier]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(+[IDSQuickRelayAllocator sharedInstance](&OBJC_CLASS___IDSQuickRelayAllocator, "sharedInstance"));
  qrAllocator = v15->_qrAllocator;
  v15->_qrAllocator = (IDSQuickRelayAllocator *)v22;

  v24 = objc_alloc(&OBJC_CLASS___IDSDSessionSharedState);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v385 displayName]);
  v26 = -[IDSDSessionSharedState initWithDictionary:serviceName:isInitiator:uniqueID:accountID:destinations:]( v24,  "initWithDictionary:serviceName:isInitiator:uniqueID:accountID:destinations:",  v14,  v25,  v21,  v388,  v386,  v391);
  sharedState = v15->_sharedState;
  v15->_sharedState = v26;

  v28 = objc_alloc(&OBJC_CLASS___IDSDSessionMessenger);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  v30 = -[IDSDSessionMessenger initWithDictionary:sharedState:accountController:]( v28,  "initWithDictionary:sharedState:accountController:",  v14,  v29,  v387);
  messenger = v15->_messenger;
  v15->_messenger = v30;

  v32 = objc_alloc(&OBJC_CLASS___IDSDSessionInvitationManager);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](v15, "messenger"));
  v35 = -[IDSDSessionInvitationManager initWithDictionary:sharedState:messenger:]( v32,  "initWithDictionary:sharedState:messenger:",  v14,  v33,  v34);
  invitationManager = v15->_invitationManager;
  v15->_invitationManager = v35;

  uint64_t v37 = OSLogHandleForTransportCategory("IDSDSession");
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
    uint64_t v40 = IDSLoggableDescriptionForObjectOnService(v39, v390);
    v41 = (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue(v40);
    *(_DWORD *)buf = 138412290;
    v405 = v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "*** options : %@", buf, 0xCu);
  }

  uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
  if ((_DWORD)v43)
  {
    if (_IDSShouldLogTransport(v43))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
      uint64_t v45 = IDSLoggableDescriptionForObjectOnService(v44, v390);
      *(void *)&__int128 v370 = objc_claimAutoreleasedReturnValue(v45);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"*** options : %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description", (void)v370));
        uint64_t v47 = IDSLoggableDescriptionForObjectOnService(v46, v390);
        *(void *)&__int128 v370 = objc_claimAutoreleasedReturnValue(v47);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"*** options : %@");
      }
    }
  }

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](v15, "messenger", (void)v370));
  if (v48)
  {
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](v15, "invitationManager"));
    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
      BOOL v51 = v50 == 0LL;

      if (!v51) {
        goto LABEL_19;
      }
    }

    else
    {
    }
  }

  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "There was an error creating the managers for IDSDSession.  Aborting...",  buf,  2u);
  }

LABEL_19:
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](v15, "messenger"));
  [v53 setDelegate:v15];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](v15, "invitationManager"));
  [v54 setDelegate:v15];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  [v55 setDelegate:v15];

  v15->_lock._os_unfair_lock_opaque = 0;
  v15->_clientChannelLock._os_unfair_lock_opaque = 0;
  v56 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionDisallowCellularInterfaceKey]);
  v15->_disallowCellularInterface = [v56 BOOLValue];

  __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionDisallowWifiInterfaceKey]);
  v15->_disallowWifiInterface = [v57 BOOLValue];

  v58 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionCallScreeningMode]);
  v15->_disableP2PLinks = [v58 BOOLValue];

  __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionPreferredAddressFamilyKey]);
  v15->_preferredAddressFamily = [v59 unsignedIntValue];

  v60 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionPreferCellularForCallSetupKey]);
  v15->_preferCellularForCallSetup = [v60 BOOLValue];

  uint64_t v61 = objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionReliableUnicastRegistrationCompletionBlockKey]);
  id v62 = [(id)v61 copy];
  id reliableUnicastRegistrationCompletionBlock = v15->_reliableUnicastRegistrationCompletionBlock;
  v15->_id reliableUnicastRegistrationCompletionBlock = v62;

  LOBYTE(v61) = _os_feature_enabled_impl("IDS", "HandOffOverQR");
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:@"ids-disable-hand-off-over-qr"]);
  unsigned __int8 v66 = [v65 BOOLValue];

  v15->_handOffOverQREnabled = v61 & (v66 ^ 1);
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    if (v15->_handOffOverQREnabled) {
      v68 = @"YES";
    }
    else {
      v68 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v405 = (_UNKNOWN **)v68;
    _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Handoff Over QR Feature is Enabled: %@",  buf,  0xCu);
  }

  uint64_t v69 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  awdUniqueId = v15->_awdUniqueId;
  v15->_awdUniqueId = (NSString *)v69;

  uint64_t v71 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  awdStartTimestamp = v15->_awdStartTimestamp;
  v15->_awdStartTimestamp = (NSDate *)v71;

  if (qword_1009BE930 != -1) {
    dispatch_once(&qword_1009BE930, &stru_1008F91C0);
  }
  v15->_summaryReportBaseTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  objc_storeStrong((id *)&v15->_availabilityCheck, a6);
  skeData = v15->_skeData;
  v15->_skeData = 0LL;

  v74 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionSuppressClientNotificationsKey]);
  v15->_supressClientNotifications = [v74 BOOLValue];

  v75 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionStartedAsUPlusOneKey]);
  v15->_BOOL startedAsUPlusOneSession = [v75 BOOLValue];

  v15->_switchedToUPlusMany = 0;
  v76 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionIsLightweightParticipantKey]);
  v15->_isLightweightParticipant = [v76 BOOLValue];

  v15->_isServerMaterialExchangeEnabled = 1;
  v77 = objc_alloc_init(&OBJC_CLASS___IDSGFTMetricsCollector);
  metricsCollector = v15->_metricsCollector;
  v15->_metricsCollector = v77;

  -[IDSGFTMetricsCollector setIsInitiator:](v15->_metricsCollector, "setIsInitiator:", v21);
  uint64_t v79 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  participantIDToPushToken = v15->_participantIDToPushToken;
  v15->_participantIDToPushToken = (NSMutableDictionary *)v79;

  uint64_t v81 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  participantIDToURI = v15->_participantIDToURI;
  v15->_participantIDToURI = (NSMutableDictionary *)v81;

  if (qword_1009BE930 != -1) {
    dispatch_once(&qword_1009BE930, &stru_1008F91C0);
  }
  v15->_timeBase = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  v15->_connectedLinkCount = 0;
  v383 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionClientUUIDKey]);
  if (v383)
  {
    v83 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v383);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v84 setClientUUID:v83];
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v86 groupID]);
  [v85 resetKeyMaterialLocalSentStatus:v87];

  v88 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionIsMultiwayKey]);
  unsigned int v380 = [v88 BOOLValue];

  if (v380
    && (v89 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( IDSGroupEncryptionController,  "sharedInstance")),  unsigned int v90 = [v89 shouldUseGecko],  v89,  v90))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController2Shim sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController2Shim,  "sharedInstance"));
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 internal]);
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v94 = (void *)objc_claimAutoreleasedReturnValue([v93 groupID]);
    uint64_t v95 = objc_claimAutoreleasedReturnValue([v92 groupForID:v94]);
    group = v15->_group;
    v15->_group = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)v95;

    if (_os_feature_enabled_impl("IDS", "ShortMKI"))
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionShortMKIEnabledKey]);
      v15->_isShortMKIEnabled = [v97 BOOLValue];
    }

    if (v15->_isShortMKIEnabled && _os_feature_enabled_impl("IDS", "TransportLevelEncryption"))
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionTLEEnabledKey]);
      v15->_isTLEEnabled = [v98 BOOLValue];
    }

    int v99 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"forceShortMKI", 0LL);
    int v100 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"forceTLE", 0LL);
    if (v99)
    {
      uint64_t v101 = OSLogHandleForTransportCategory("IDSDSession");
      v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        if (v15->_isShortMKIEnabled) {
          v103 = @"YES";
        }
        else {
          v103 = @"NO";
        }
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
        v105 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v104 groupID]);
        *(_DWORD *)buf = 138412802;
        v405 = (_UNKNOWN **)v103;
        __int16 v406 = 2112;
        v407 = @"YES";
        __int16 v408 = 2112;
        v409 = v105;
        _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::init _isShortMKIEnabled:%@ shouldForceShortMKI:%@ for groupID:%@",  buf,  0x20u);
      }

      uint64_t v107 = os_log_shim_legacy_logging_enabled(v106);
      if ((_DWORD)v107 && _IDSShouldLogTransport(v107))
      {
        v108 = @"NO";
        v109 = v15->_isShortMKIEnabled ? @"YES" : @"NO";
        v110 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
        *((void *)&v370 + 1) = @"YES";
        v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v110 groupID]);
        *(void *)&__int128 v370 = v109;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::init _isShortMKIEnabled:%@ shouldForceShortMKI:%@ for groupID:%@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          if (v15->_isShortMKIEnabled) {
            v108 = @"YES";
          }
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v109, @"YES", v372));
          *((void *)&v370 + 1) = @"YES";
          v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue( [v111 groupID]);
          *(void *)&__int128 v370 = v108;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::init _isShortMKIEnabled:%@ shouldForceShortMKI:%@ for groupID:%@");
        }
      }

      v15->_isShortMKIEnabled = v99;
    }

    if (v100)
    {
      uint64_t v112 = OSLogHandleForTransportCategory("IDSDSession");
      v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        if (v15->_isTLEEnabled) {
          v114 = @"YES";
        }
        else {
          v114 = @"NO";
        }
        v115 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v370, v372));
        v116 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v115 groupID]);
        *(_DWORD *)buf = 138412802;
        v405 = (_UNKNOWN **)v114;
        __int16 v406 = 2112;
        v407 = @"YES";
        __int16 v408 = 2112;
        v409 = v116;
        _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::init _isTLEEnabled:%@ shouldForceTLE:%@ for groupID:%@",  buf,  0x20u);
      }

      uint64_t v118 = os_log_shim_legacy_logging_enabled(v117);
      if ((_DWORD)v118 && _IDSShouldLogTransport(v118))
      {
        v119 = v15->_isTLEEnabled ? @"YES" : @"NO";
        v120 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", (void)v370));
        *((void *)&v370 + 1) = @"YES";
        v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v120 groupID]);
        *(void *)&__int128 v370 = v119;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::init _isTLEEnabled:%@ shouldForceTLE:%@ for groupID:%@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          if (v15->_isTLEEnabled) {
            v121 = @"YES";
          }
          else {
            v121 = @"NO";
          }
          v122 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v119, @"YES", v372));
          *((void *)&v370 + 1) = @"YES";
          v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue( [v122 groupID]);
          *(void *)&__int128 v370 = v121;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::init _isTLEEnabled:%@ shouldForceTLE:%@ for groupID:%@");
        }
      }

      v15->_isTLEEnabled = v100;
    }

    uint64_t v123 = OSLogHandleForTransportCategory("IDSDSession");
    v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      if (v15->_isShortMKIEnabled) {
        v125 = @"YES";
      }
      else {
        v125 = @"NO";
      }
      if (v15->_isTLEEnabled) {
        v126 = @"YES";
      }
      else {
        v126 = @"NO";
      }
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v370, v372));
      v128 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v127 groupID]);
      *(_DWORD *)buf = 138412802;
      v405 = (_UNKNOWN **)v125;
      __int16 v406 = 2112;
      v407 = v126;
      __int16 v408 = 2112;
      v409 = v128;
      _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::init _isShortMKIEnabled:%@ _isTLEEnabled:%@ for groupID:%@",  buf,  0x20u);
    }

    uint64_t v130 = os_log_shim_legacy_logging_enabled(v129);
    if ((_DWORD)v130 && _IDSShouldLogTransport(v130))
    {
      v131 = v15->_isShortMKIEnabled ? @"YES" : @"NO";
      v132 = v15->_isTLEEnabled ? @"YES" : @"NO";
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", (void)v370));
      *((void *)&v370 + 1) = v132;
      v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v133 groupID]);
      *(void *)&__int128 v370 = v131;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::init _isShortMKIEnabled:%@ _isTLEEnabled:%@ for groupID:%@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        if (v15->_isShortMKIEnabled) {
          v134 = @"YES";
        }
        else {
          v134 = @"NO";
        }
        if (v15->_isTLEEnabled) {
          v135 = @"YES";
        }
        else {
          v135 = @"NO";
        }
        v136 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", (void)v370, v132, v372));
        *((void *)&v370 + 1) = v135;
        v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)objc_claimAutoreleasedReturnValue([v136 groupID]);
        *(void *)&__int128 v370 = v134;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::init _isShortMKIEnabled:%@ _isTLEEnabled:%@ for groupID:%@");
      }
    }

    -[IDSGroupEncryptionControllerGroup setShortMKIEnabled:]( v15->_group,  "setShortMKIEnabled:",  v15->_isShortMKIEnabled,  v370,  v372);
    v137 = v15->_group;
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v139 = (void *)objc_claimAutoreleasedReturnValue([v138 uniqueID]);
    uint64_t v140 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionControllerGroup ensureSessionForID:](v137, "ensureSessionForID:", v139));
    groupSession = v15->_groupSession;
    v15->_groupSession = (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession *)v140;

    v142 = objc_alloc(&OBJC_CLASS____TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController);
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionControllerGroup config](v15->_group, "config"));
    v144 = v15->_groupSession;
    v145 = (void *)objc_claimAutoreleasedReturnValue([v385 identifier]);
    v146 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController2Shim sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController2Shim,  "sharedInstance"));
    v147 = -[IDSGroupDefaultRootMaterialExchangeController initWithConfig:session:serviceID:pushHandler:]( v142,  "initWithConfig:session:serviceID:pushHandler:",  v143,  v144,  v145,  v146);
    exchangeController = v15->_exchangeController;
    v15->_exchangeController = v147;

    -[IDSGroupEncryptionControllerGroupSession setRootExchangeController:]( v15->_groupSession,  "setRootExchangeController:",  v15->_exchangeController);
    v149 = v15->_groupSession;
    v150 = v15->_metricsCollector;
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession groupStatusNotificationController](v15, "groupStatusNotificationController"));
    v152 = (OldIDSDSessionKeyValueDelivery *)objc_claimAutoreleasedReturnValue( +[IDSDSessionKeyValueDelivery createWithDelegate:session:metricsCollector:pushTokensForCapabilityProvider:]( &OBJC_CLASS____TtC17identityservicesd27IDSDSessionKeyValueDelivery,  "createWithDelegate:session:metricsCollector:pushTokensForCapabilityProvider:",  v15,  v149,  v150,  v151));

    objc_storeStrong((id *)&v15->_keyValueDelivery, v152);
    -[OldIDSDSessionKeyValueDelivery addMaterialProviderToSession:]( v152,  "addMaterialProviderToSession:",  v15->_groupSession);
    uint64_t v153 = OSLogHandleForTransportCategory("IDSDSession");
    v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      v155 = v15->_group;
      v156 = v15->_groupSession;
      v157 = v15->_exchangeController;
      *(_DWORD *)buf = 138412802;
      v405 = (_UNKNOWN **)v155;
      __int16 v406 = 2112;
      v407 = (const __CFString *)v156;
      __int16 v408 = 2112;
      v409 = v157;
      _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::init group:%@ session:%@ exchangeController:%@",  buf,  0x20u);
    }

    uint64_t v159 = os_log_shim_legacy_logging_enabled(v158);
    if ((_DWORD)v159)
    {
      if (_IDSShouldLogTransport(v159))
      {
        v372 = v15->_exchangeController;
        __int128 v370 = *(_OWORD *)&v15->_group;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::init group:%@ session:%@ exchangeController:%@");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v372 = v15->_exchangeController;
          __int128 v370 = *(_OWORD *)&v15->_group;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::init group:%@ session:%@ exchangeController:%@");
        }
      }
    }
  }

  else
  {
    v160 = objc_alloc(&OBJC_CLASS___OldIDSDSessionKeyValueDelivery);
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v162 = (void *)objc_claimAutoreleasedReturnValue([v161 groupID]);
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v164 = (void *)objc_claimAutoreleasedReturnValue([v163 uniqueID]);
    v152 = -[OldIDSDSessionKeyValueDelivery initWithDelegate:forGroupID:sessionID:metricsCollector:]( v160,  "initWithDelegate:forGroupID:sessionID:metricsCollector:",  v15,  v162,  v164,  v15->_metricsCollector);

    objc_storeStrong((id *)&v15->_keyValueDelivery, v152);
  }

  v15->_multiplexerEnabled = 1;
  uint64_t v165 = OSLogHandleForTransportCategory("IDSDSession");
  v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
  if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
  {
    v167 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    uint64_t v168 = objc_claimAutoreleasedReturnValue([v167 uniqueID]);
    v169 = (void *)v168;
    v170 = v15->_instanceID;
    v171 = @"YES";
    if (!v15->_isLightweightParticipant) {
      v171 = @"NO";
    }
    *(_DWORD *)buf = 134218754;
    v405 = (_UNKNOWN **)v15;
    __int16 v406 = 2112;
    v407 = (const __CFString *)v168;
    __int16 v408 = 2112;
    v409 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)v170;
    __int16 v410 = 2112;
    v411 = v171;
    _os_log_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::init { self: %p, uniqueID: %@, instanceID: %@, isLightweightParticipant: %@}",  buf,  0x2Au);
  }

  uint64_t v173 = os_log_shim_legacy_logging_enabled(v172);
  if ((_DWORD)v173 && _IDSShouldLogTransport(v173))
  {
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v175 = (void *)objc_claimAutoreleasedReturnValue([v174 uniqueID]);
    v176 = v15->_isLightweightParticipant ? @"YES" : @"NO";
    v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)v15->_instanceID;
    v373 = v176;
    *(void *)&__int128 v370 = v15;
    *((void *)&v370 + 1) = v175;
    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::init { self: %p, uniqueID: %@, instanceID: %@, isLightweightParticipant: %@}");

    if (_IDSShouldLog(0LL, @"IDSDSession"))
    {
      v177 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v15, v175, v372, v373));
      uint64_t v178 = objc_claimAutoreleasedReturnValue([v177 uniqueID]);
      v179 = (void *)v178;
      if (v15->_isLightweightParticipant) {
        v180 = @"YES";
      }
      else {
        v180 = @"NO";
      }
      v372 = (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)v15->_instanceID;
      v373 = (__CFString *)v180;
      *(void *)&__int128 v370 = v15;
      *((void *)&v370 + 1) = v178;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::init { self: %p, uniqueID: %@, instanceID: %@, isLightweightParticipant: %@}");
    }
  }

  if (v15->_supressClientNotifications)
  {
    uint64_t v181 = OSLogHandleForTransportCategory("IDSDSession");
    v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
    {
      v183 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
      v184 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v183 uniqueID]);
      *(_DWORD *)buf = 138412290;
      v405 = v184;
      _os_log_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_DEFAULT,  "[!] This session will be suppressing client notifications { self.sharedState.uniqueID: %@ }",  buf,  0xCu);
    }

    uint64_t v186 = os_log_shim_legacy_logging_enabled(v185);
    if ((_DWORD)v186)
    {
      if (_IDSShouldLogTransport(v186))
      {
        v187 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
        *(void *)&__int128 v370 = objc_claimAutoreleasedReturnValue([v187 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"[!] This session will be suppressing client notifications { self.sharedState.uniqueID: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v188 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", (void)v370));
          *(void *)&__int128 v370 = objc_claimAutoreleasedReturnValue([v188 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"[!] This session will be suppressing client notifications { self.sharedState.uniqueID: %@ }");
        }
      }
    }
  }

  v15->_verboseFunctionalLogging = IMGetDomainBoolForKey(@"com.apple.ids", @"SessionFunctionalLogging");
  v15->_verbosePerformanceLogging = IMGetDomainBoolForKey(@"com.apple.ids", @"SessionPerformanceLogging");
  unsigned int v189 = [v390 isEqualToIgnoringCase:@"com.apple.private.alloy.screensharing"];
  v190 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  v191 = v190;
  if (v189)
  {
    [v190 setIsScreenSharingSession:1];

    dispatch_queue_attr_t v192 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v193 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v192);
    v194 = objc_alloc(&OBJC_CLASS___NSString);
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v196 = (void *)objc_claimAutoreleasedReturnValue([v195 uniqueID]);
    v197 = -[NSString initWithFormat:](v194, "initWithFormat:", @"com.apple.ids.Session-ConnectionQueue-%@", v196);

    v198 = v197;
    dispatch_queue_t v199 = dispatch_queue_create(-[NSString UTF8String](v198, "UTF8String"), v193);
    v200 = -[_IDSSessionConnection initWithQueue:]( objc_alloc(&OBJC_CLASS____IDSSessionConnection),  "initWithQueue:",  v199);
    v201 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v201 setConnection:v200];

    v202 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v203 = (void *)objc_claimAutoreleasedReturnValue([v202 connection]);
    [v203 setDelegate:v15];

    v204 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v204 setInviteTimeout:30.0];

    v205 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v205 setEndSessionTimeout:5.0];

    goto LABEL_151;
  }

  [v190 setIsScreenSharingSession:0];

  if (([v390 isEqualToString:@"com.apple.private.alloy.facetime.multi"] & 1) != 0
    || ([v390 isEqualToString:@"com.apple.private.alloy.arcade.fastsync"] & 1) != 0
    || ([v390 isEqualToString:@"com.apple.private.alloy.airdrop.walkaway"] & 1) != 0
    || ([v390 isEqualToString:@"com.apple.private.alloy.groupRemoteControl.cloud"] & 1) != 0
    || [v390 isEqualToString:@"com.apple.private.alloy.groupRemoteControl.session"])
  {
    v206 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v370, v372, v373));
    [v206 setClientType:6];

    v207 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v207 setUseQRDirectly:1];

    v15->_shouldAssertRealTimeMode = 1;
    v15->_supportUnauthenticatedUser = 1;
    goto LABEL_131;
  }

  if ([v390 isEqualToString:@"com.apple.private.alloy.facetime.video"])
  {
    v355 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v355 setClientType:1];

    v356 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v356 setUseQRDirectly:1];

LABEL_236:
    v15->_shouldAssertRealTimeMode = 1;
    goto LABEL_131;
  }

  if ([v390 isEqualToString:@"com.apple.private.alloy.facetime.audio"])
  {
    v357 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v357 setClientType:5];

    v358 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v358 setUseQRDirectly:1];

    goto LABEL_236;
  }

  if (([v390 isEqualToString:@"com.apple.private.alloy.willow.stream"] & 1) != 0
    || ([v390 isEqualToString:@"com.apple.private.alloy.amp.potluck"] & 1) != 0
    || [v390 isEqualToString:@"com.apple.private.alloy.itunes"])
  {
    v359 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v370, v372, v373));
    [v359 setClientType:2];

    goto LABEL_131;
  }

  if ([v390 isEqualToString:@"com.apple.private.alloy.safeview"])
  {
    v360 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v360 setClientType:3];

    goto LABEL_131;
  }

  if ([v390 isEqualToString:@"com.apple.private.alloy.screensharing.qr"])
  {
    v361 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v361 setClientType:7];

    goto LABEL_131;
  }

  if ([v390 isEqualToString:@"com.apple.private.alloy.tincan.audio"])
  {
    v362 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v362 setClientType:100];

    goto LABEL_131;
  }

  if (![v390 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"])
  {
    if (![v390 isEqualToString:@"com.apple.private.alloy.carmelsync"]
      && ![v390 isEqualToString:@"com.apple.private.alloy.notes"]
      && ![v390 isEqualToString:@"com.apple.private.alloy.dropin.communication"]
      && ![v390 isEqualToString:@"com.apple.private.alloy.safari.groupactivities"]
      && ![v390 isEqualToString:@"com.apple.private.alloy.gftaastest.communication"])
    {
      goto LABEL_131;
    }

    v368 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v368 setClientType:6];

    v369 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v369 setUseQRDirectly:1];

    goto LABEL_236;
  }

  v363 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
  [v363 setClientType:4];

  uint64_t v364 = OSLogHandleForTransportCategory("IDSDSession");
  v365 = (os_log_s *)objc_claimAutoreleasedReturnValue(v364);
  if (os_log_type_enabled(v365, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v405 = &off_100946930;
    _os_log_impl( (void *)&_mh_execute_header,  v365,  OS_LOG_TYPE_DEFAULT,  "com.apple.private.alloy.phonecontinuity: set connectionCountHint to: %@",  buf,  0xCu);
  }

  uint64_t v367 = os_log_shim_legacy_logging_enabled(v366);
  if ((_DWORD)v367)
  {
    v384 = &off_100946930;
    *(void *)&__int128 v370 = &off_100946930;
    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"com.apple.private.alloy.phonecontinuity: set connectionCountHint to: %@");
    v384 = &off_100946930;
    *(void *)&__int128 v370 = &off_100946930;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"com.apple.private.alloy.phonecontinuity: set connectionCountHint to: %@");
  }

  v384 = &off_100946930;
LABEL_131:
  v208 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", (void)v370));
  unsigned int v209 = [v208 enableSingleChannelDirectMode];

  if (v209)
  {
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    [v210 setUseQRDirectly:1];

    v15->_shouldAssertRealTimeMode = 1;
    uint64_t v211 = OSLogHandleForTransportCategory("IDSDSession");
    v212 = (os_log_s *)objc_claimAutoreleasedReturnValue(v211);
    if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v405 = (_UNKNOWN **)v390;
      _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_DEFAULT, "use QR directly for %@.", buf, 0xCu);
    }

    uint64_t v214 = os_log_shim_legacy_logging_enabled(v213);
    if ((_DWORD)v214)
    {
      if (_IDSShouldLogTransport(v214))
      {
        v371 = v390;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"use QR directly for %@.");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v371 = v390;
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"use QR directly for %@.");
        }
      }
    }
  }

  __int128 v400 = 0u;
  __int128 v401 = 0u;
  __int128 v398 = 0u;
  __int128 v399 = 0u;
  v215 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState", v371));
  v216 = (void *)objc_claimAutoreleasedReturnValue([v215 destinations]);

  id v217 = [v216 countByEnumeratingWithState:&v398 objects:v403 count:16];
  if (v217)
  {
    uint64_t v218 = *(void *)v399;
LABEL_140:
    uint64_t v219 = 0LL;
    while (1)
    {
      if (*(void *)v399 != v218) {
        objc_enumerationMutation(v216);
      }
      uint64_t v220 = *(void *)(*((void *)&v398 + 1) + 8 * v219);
      v221 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
      LODWORD(v220) = [v221 destinationIsDefaultPairedDevice:v220];

      if (!(_DWORD)v220) {
        break;
      }
      if (v217 == (id)++v219)
      {
        id v217 = [v216 countByEnumeratingWithState:&v398 objects:v403 count:16];
        if (v217) {
          goto LABEL_140;
        }
        goto LABEL_149;
      }
    }

    v222 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    unsigned __int8 v223 = [v222 enableQuickRelay];

    if ((v223 & 1) != 0) {
      goto LABEL_150;
    }
    v216 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](v15, "utunController"));
    v224 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v15, "sharedState"));
    v225 = (void *)objc_claimAutoreleasedReturnValue([v224 uniqueID]);
    [v216 startUDPGlobalLinkForDevice:v225];
  }

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForTransportCategory("IDSDSession");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession instanceID](self, "instanceID"));
    *(_DWORD *)buf = 134218498;
    v52 = self;
    __int16 v53 = 2112;
    v54 = v6;
    __int16 v55 = 2112;
    v56 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IDSDSession::dealloc { self: %p, uniqueID: %@, instanceID: %@ }",  buf,  0x20u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession instanceID](self, "instanceID"));
      uint64_t v46 = self;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSDSession::dealloc { self: %p, uniqueID: %@, instanceID: %@ }");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", self, v48, v49));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession instanceID](self, "instanceID"));
        uint64_t v46 = self;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSDSession::dealloc { self: %p, uniqueID: %@, instanceID: %@ }");
      }
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v46, v48, v49));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
  [v12 clearPluginCacheForSession:v14];

  *(_OWORD *)&self->_keyMaterial[16] = 0u;
  *(_OWORD *)&self->_keyMaterial[32] = 0u;
  *(_OWORD *)self->_keyMaterial = 0u;
  *(_OWORD *)&self->_keyMaterial[44] = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v16 = [v15 encryptionState];

  sub_1001FD114((uint64_t)v16);
  uint64_t v17 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v20 = (IDSDSession *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
    *(_DWORD *)buf = 138412290;
    v52 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Destroyed session %@", buf, 0xCu);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceName]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
  DLCSessionLogWithLevel(v22, @"IDSDSession", 0LL, 0LL, @"Destroyed session %@");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v47));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 serviceName]);
  DLCSessionEndSession(v25, @"IDSDSession");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 serviceName]);

  if (v27)
  {
    v28 = objc_alloc(&OBJC_CLASS___NSString);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 serviceName]);
    v31 = -[NSString initWithString:](v28, "initWithString:", v30);

    -[IDSDSession _resetPreferences:](self, "_resetPreferences:", v31);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v32 setState:8];

  -[IDSDSession _cleanupSessionConnection](self, "_cleanupSessionConnection");
  -[IDSBaseSocketPairConnection endSession](self->_baseSocketPairConnection, "endSession");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  [v33 updateCriticalReliabilityState];

  extraConnections = self->_extraConnections;
  self->_extraConnections = 0LL;

  participantIDToAVCBlob = self->_participantIDToAVCBlob;
  self->_participantIDToAVCBlob = 0LL;

  participantIDToTypeToEncryptedIDSContextBlobs = self->_participantIDToTypeToEncryptedIDSContextBlobs;
  self->_participantIDToTypeToEncryptedIDSContextBlobs = 0LL;

  id reliableUnicastRegistrationCompletionBlock = self->_reliableUnicastRegistrationCompletionBlock;
  if (reliableUnicastRegistrationCompletionBlock)
  {
    self->_id reliableUnicastRegistrationCompletionBlock = 0LL;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueID]);
  [v38 clearReliableUnicastStateForSession:v40];

  -[IDSDSession _checkAndUnassertRealTimeMode](self, "_checkAndUnassertRealTimeMode");
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v41 clearAllTimers];

  ctClient = self->_ctClient;
  self->_ctClient = 0LL;

  cellularNetworkInterfaceBringupTime = self->_cellularNetworkInterfaceBringupTime;
  self->_cellularNetworkInterfaceBringupTime = 0LL;

  cellularNetworkInfoSessionEvent = self->_cellularNetworkInfoSessionEvent;
  self->_cellularNetworkInfoSessionEvent = 0LL;

  self->_cellularSlicingFlags = 0;
  networkSlicingReportingQueue = self->_networkSlicingReportingQueue;
  self->_networkSlicingReportingQueue = 0LL;

  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___IDSDSession;
  -[IDSDSession dealloc](&v50, "dealloc");
}

- (char)keyMaterial
{
  v2 = (char *)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  uint64_t v3 = v2 + 8;

  return v3;
}

- (IDSXPCGroupSessionKeyValueDelivery)keyValueDelivery
{
  return self->_keyValueDelivery;
}

- (NSString)description
{
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v17 accountID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 accountWithUniqueID:v5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 service]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 destinations]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v12 = [v11 transportType];
  id v13 = @"Unreliable";
  if (v12 == (id)1) {
    id v13 = @"Reliable";
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p> - uniqueID: %@   accountID: %@   service: %@   destinations: %@   transportType: %@",  self,  v3,  v4,  v8,  v10,  v13));

  return (NSString *)v14;
}

- (BOOL)sessionIsActive
{
  return -[IDSDSession groupSessionState](self, "groupSessionState") == 1;
}

- (unint64_t)_getExperimentGroupThresholdForCellularSlicing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-threshold-percentage-for-cellular-slicing"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 100LL;
  }

  return v6;
}

- (BOOL)_shouldEnableCellularSlicingAfterDiceRoll
{
  unint64_t v3 = -[IDSDSession _getExperimentGroupThresholdForCellularSlicing]( self,  "_getExperimentGroupThresholdForCellularSlicing");
  uint64_t v4 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random_uniform(0x64u));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v7 = [v6 isCarrierInstall];

  else {
    BOOL v8 = v7;
  }
  if (v8) {
    self->_cellularSlicingFlags |= 0x40u;
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    int v12 = 138412802;
    id v13 = v10;
    __int16 v14 = 2048;
    unint64_t v15 = v3;
    __int16 v16 = 1024;
    unsigned int v17 = [v5 unsignedIntValue];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sliced cellular interface - isCarrierInstall (%@), currentServerBagPercentage (%lu), diceRoll (%u)",  (uint8_t *)&v12,  0x1Cu);
  }

  return v8;
}

- (id)rtcNormalizeTime:(double)a3
{
  if (a3 <= 0.0) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = (int)((a3 - self->_summaryReportBaseTime) * 1000.0);
  }
  return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3);
}

- (id)buildRTCSummaryReport
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946960,  IDSDSessionReportQREventSubTypeKey);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_startedAsUPlusOneSession));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v4,  IDSDSessionReportSummaryStartedAsUPlusOne);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_switchedToUPlusMany));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v5,  IDSDSessionReportSummarySwitchedToUPlusMany);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_joinStartTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v6,  IDSDSessionReportSummaryJoinStartTimeKey);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_joinSendStartTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v7,  IDSDSessionReportSummaryJoinPushSendStartTimeKey);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_joinSendEndTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v8,  IDSDSessionReportSummaryJoinPushSendEndTimeKey);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_joinRecvTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v9,  IDSDSessionReportSummaryJoinPushRecvTimeKey);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_clientChannelConnectTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v10,  IDSDSessionReportSummaryClientChannelConnectedTimeKey);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_firstMKMReceivedTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v11,  IDSDSessionReportSummaryFirstMKMReceivedTimeKey);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_firstMKMSentTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v12,  IDSDSessionReportSummaryFirstMKMSentTimeKey);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession rtcNormalizeTime:](self, "rtcNormalizeTime:", self->_firstPacketReceivedTime));
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v13,  IDSDSessionReportSummaryFirstPacketReceivedTimeKey);

  return Mutable;
}

- (void)_reportRTC
{
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGFTMetricsCollector collectForTimeBase:anonymize:]( self->_metricsCollector,  "collectForTimeBase:anonymize:",  1LL,  self->_timeBase));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGFTMetricsCollector collectForTimeBase:anonymize:]( self->_metricsCollector,  "collectForTimeBase:anonymize:",  0LL,  self->_timeBase));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v56 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(double *)(*((void *)&v55 + 1) + 8LL * (void)i);
        uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v60 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GFTMetrics will report %@", buf, 0xCu);
        }

        uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
        if ((_DWORD)v11)
        {
          if (_IDSShouldLogTransport(v11))
          {
            double v45 = v7;
            _IDSLogTransport(@"IDSDSession", @"IDS", @"GFTMetrics will report %@");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              double v45 = v7;
              _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"GFTMetrics will report %@");
            }
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    }

    while (v4);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v12 = v49;
  id v13 = [v12 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v52;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v12);
        }
        -[NSMutableArray addObject:]( self->_qrEventsForRTCReports,  "addObject:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)j),  *(void *)&v45);
      }

      id v13 = [v12 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v13);
  }

  double v16 = self->_MKMOverPushTime - self->_MKMOverQRQUICTime;
  uint64_t v17 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v60 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "time difference between MKM over push and MKM over QR QUIC: %.3f",  buf,  0xCu);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      double v45 = v16;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"time difference between MKM over push and MKM over QR QUIC: %.3f");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        double v45 = v16;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"time difference between MKM over push and MKM over QR QUIC: %.3f");
      }
    }
  }

  if (-[NSMutableArray count](self->_qrEventsForRTCReports, "count", *(void *)&v45))
  {
    double v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[IDSDSession buildRTCSummaryReport](self, "buildRTCSummaryReport")));
    uint64_t v22 = OSLogHandleForTransportCategory("IDSDSession");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v60 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_reportRTC summary: %@", buf, 0xCu);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      if (_IDSShouldLogTransport(v25))
      {
        double v46 = v21;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"_reportRTC summary: %@");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          double v46 = v21;
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"_reportRTC summary: %@");
        }
      }
    }

    -[NSMutableArray addObject:](self->_qrEventsForRTCReports, "addObject:", *(void *)&v21, *(void *)&v46);
    v26 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v26, "setShouldBoost:", 1LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 pushTopic]);
    double v30 = COERCE_DOUBLE( objc_claimAutoreleasedReturnValue( [v27 broadcasterForTopic:v29 entitlement:kIDSSessionEntitlement command:0 messageContext:v26]));

    uint64_t v31 = OSLogHandleForTransportCategory("IDSDSession");
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
      *(_DWORD *)buf = 134218242;
      double v60 = v30;
      __int16 v61 = 2112;
      id v62 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "didReceiveReport, broadcaster: %p for session: %@",  buf,  0x16u);
    }

    uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
    if ((_DWORD)v36)
    {
      if (_IDSShouldLogTransport(v36))
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        double v47 = v30;
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
        _IDSLogTransport(@"IDSDSession", @"IDS", @"didReceiveReport, broadcaster: %p for session: %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", *(void *)&v30, v48));
          double v47 = v30;
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v38 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveReport, broadcaster: %p for session: %@");
        }
      }
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", *(void *)&v47, v48));
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueID]);
    [*(id *)&v30 session:v40 didReceiveReport:self->_qrEventsForRTCReports];
  }

  else
  {
    uint64_t v41 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No valid RTC reports to report", buf, 2u);
    }

    uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
    if ((_DWORD)v44)
    {
      if (_IDSShouldLogTransport(v44))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"No valid RTC reports to report");
      }
    }
  }
}

- (void)_cleanupSessionConnection
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);

  if (v4)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 connection]);
      *(_DWORD *)buf = 136315650;
      v26 = "-[IDSDSession _cleanupSessionConnection]";
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2048;
      double v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: session %@ connection %p", buf, 0x20u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12 && _IDSShouldLogTransport(v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v23 = v14;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 connection]);
      uint64_t v22 = "-[IDSDSession _cleanupSessionConnection]";
      _IDSLogTransport(@"IDSDSession", @"IDS", @"%s: session %@ connection %p");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession sharedState]( self,  "sharedState",  "-[IDSDSession _cleanupSessionConnection]",  v14,  v24));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        v23 = v17;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 connection]);
        uint64_t v22 = "-[IDSDSession _cleanupSessionConnection]";
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"%s: session %@ connection %p");
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v22, v23, v24));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 connection]);
    [v20 setDelegate:0];

    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v21 setConnection:0];
  }

- (void)reportFirstMKMReceivedFromPush:(double)a3
{
  if (!self->_hasReportedReceivedMKM)
  {
    self->_hasReportedReceivedMKM = 1;
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v32 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "reportMKMReceived received first MKM at %f time",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        double v26 = a3;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"reportMKMReceived received first MKM at %f time");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          double v26 = a3;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"reportMKMReceived received first MKM at %f time");
        }
      }
    }

    self->_MKMOverPushTime = a3;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v9 = self->_qrEventsForRTCReports;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = IDSDSessionReportQREventSubTypeKey;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12, *(void *)&v26));
          BOOL v16 = [v15 integerValue] == (id)311;

          if (v16)
          {
            uint64_t v17 = IDSDSessionReportDurationKey;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionReportDurationKey]);
            [v18 doubleValue];
            double v20 = v19;

            double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)((a3 - v20) * 1000.0)));
            [v14 setObject:v21 forKeyedSubscript:v17];

            uint64_t v22 = OSLogHandleForTransportCategory("IDSDSession");
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              double v32 = v20;
              __int16 v33 = 1024;
              int v34 = (int)((a3 - v20) * 1000.0);
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "reportFirstMKMReceivedFromPush: get allocbind RTC report, time of allocbind response: %f, set the duration to %d ms",  buf,  0x12u);
            }

            uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
            if ((_DWORD)v25)
            {
              if (_IDSShouldLogTransport(v25))
              {
                _IDSLogTransport( @"IDSDSession",  @"IDS",  @"reportFirstMKMReceivedFromPush: get allocbind RTC report, time of allocbind response: %f, set the duration to %d ms");
                if (_IDSShouldLog(0LL, @"IDSDSession")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"reportFirstMKMReceivedFromPush: get allocbind RTC report, time of allocbind response: %f, set the duration to %d ms");
                }
              }
            }

            goto LABEL_23;
          }
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
        if (v10) {
          continue;
        }
        break;
      }
    }

- (void)reportFirstMKMReceivedFromQR:(double)a3
{
  self->_MKMOverQRTime = a3;
}

- (void)reportJoinReceivedOverPushFromToken:(id)a3
{
}

- (void)reportPreKeyReceivedOverPushFromToken:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector joinCycleForToken:](self->_metricsCollector, "joinCycleForToken:", a3));
  [v3 receivedPreKeyOverPush];
}

- (void)reportMKMReceivedOverPushFromToken:(id)a3 material:(id)a4
{
  metricsCollector = self->_metricsCollector;
  id v7 = a4;
  id v11 = a3;
  -[IDSGFTMetricsCollector receivedKMOverPushFromToken:](metricsCollector, "receivedKMOverPushFromToken:", v11);
  uint64_t v8 = self->_metricsCollector;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector getOrCreateMKICycleFor:](v8, "getOrCreateMKICycleFor:", v9));
  [v10 receivedFromPush];

  -[IDSDSession mapMKIFromMaterial:token:](self, "mapMKIFromMaterial:token:", v7, v11);
}

- (void)reportMKMReceivedOverPushViaCacheForParticipantID:(unint64_t)a3 material:(id)a4
{
  id v6 = a4;
  id v11 = v6;
  if (a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getPushTokenFromParticipantID:](self, "_getPushTokenFromParticipantID:", a3));
    metricsCollector = self->_metricsCollector;
    if (v7)
    {
      -[IDSGFTMetricsCollector receivedKMOverPushViaCacheForToken:]( self->_metricsCollector,  "receivedKMOverPushViaCacheForToken:",  v7);
      -[IDSDSession mapMKIFromMaterial:token:](self, "mapMKIFromMaterial:token:", v11, v7);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
      -[IDSGFTMetricsCollector receivedUnknownKMOverPushViaCache:]( metricsCollector,  "receivedUnknownKMOverPushViaCache:",  v10);
    }
  }

  else
  {
    uint64_t v9 = self->_metricsCollector;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
    -[IDSGFTMetricsCollector receivedUnknownKMOverPushViaCache:](v9, "receivedUnknownKMOverPushViaCache:", v7);
  }
}

- (void)reportMKMReceivedOverQRFromToken:(id)a3 material:(id)a4
{
  metricsCollector = self->_metricsCollector;
  id v7 = a4;
  id v11 = a3;
  -[IDSGFTMetricsCollector receivedKMOverQRFromToken:](metricsCollector, "receivedKMOverQRFromToken:", v11);
  uint64_t v8 = self->_metricsCollector;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector getOrCreateMKICycleFor:](v8, "getOrCreateMKICycleFor:", v9));
  [v10 receivedFromQR];

  -[IDSDSession mapMKIFromMaterial:token:](self, "mapMKIFromMaterial:token:", v7, v11);
}

- (void)reportSendRatchetedMKMToAVCForParticipantID:(unint64_t)a3 mki:(id)a4
{
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getPushTokenFromParticipantID:](self, "_getPushTokenFromParticipantID:", a3));
  if (v6)
  {
    -[IDSGFTMetricsCollector sendRatchetedKMtoAVCForToken:]( self->_metricsCollector,  "sendRatchetedKMtoAVCForToken:",  v6);
    metricsCollector = self->_metricsCollector;
    uint64_t v8 = IDSGetUUIDDataFromNSUUID(v11);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector getOrCreateMKICycleFor:](metricsCollector, "getOrCreateMKICycleFor:", v9));
    [v10 receivedFromRatcheting];
  }
}

- (void)mapMKIFromMaterial:(id)a3 token:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
    uint64_t v8 = v7;

    id v6 = v9;
  }
}

- (void)_lightweightParticipantSync:(unsigned __int8)a3
{
  if (self->_isLightweightParticipant)
  {
    unsigned int currentGenerationCounter = self->_currentGenerationCounter;
    if ((currentGenerationCounter - a3) >= 0x81u)
    {
      uint64_t v6 = im_primary_queue(self, a2);
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000786F0;
      v9[3] = &unk_1008F87D8;
      v9[4] = self;
      unsigned __int8 v10 = a3;
      char v11 = currentGenerationCounter;
      dispatch_block_t v8 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v9);
      dispatch_async(v7, v8);
    }
  }

- (id)getCellularNetworkInfo:(id)a3
{
  return 0LL;
}

- (id)_getPushTokensFromParticipantIDArray:(id)a3 useNullPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokenFromParticipantIDNumber:]( self,  "_getPushTokenFromParticipantIDNumber:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16));
        if (v13)
        {
          [v7 addObject:v13];
        }

        else
        {
          if (v4)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [v7 addObject:v14];
          }

          -[IDSGFTMetricsCollector participantIdUnknown](self->_metricsCollector, "participantIdUnknown");
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)_getPushTokenFromParticipantID:(unint64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getPushTokenFromParticipantIDNumber:](self, "_getPushTokenFromParticipantIDNumber:", v4));

  return v5;
}

- (id)_getPushTokenFromParticipantIDNumber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantIDToPushToken,  "objectForKeyedSubscript:",  v4));
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rawToken]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 getPushTokenFromParticipantID:v9 participantID:v4]);

    if (!v6)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDSDSession: _getPushTokenFromParticipantID: token not found for participantID %@",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

  return v6;
}

- (id)_getURIFromParticipantIDNumber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantIDToURI,  "objectForKeyedSubscript:",  v4));
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 prefixedURI]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 getURIFromParticipantID:v9 participantID:v4]);

    if (!v6)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDSDSession: _getURIFromParticipantID: URI not found for participantID %@",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

  return v6;
}

- (void)setQrAllocator:(id)a3
{
}

- (void)setParticipantIDToURI:(id)a3 participantID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  participantIDToURI = self->_participantIDToURI;
  if (!participantIDToURI)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v9 = self->_participantIDToURI;
    self->_participantIDToURI = Mutable;

    participantIDToURI = self->_participantIDToURI;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](participantIDToURI, "setObject:forKeyedSubscript:", v10, v6);
}

- (void)registerClientChannel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([@"session:" stringByAppendingString:v5]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100078DE4;
  v7[3] = &unk_1008F8850;
  v7[4] = self;
  [v3 registerClientChannelDestination:v6 connectHandler:v7];
}

- (void)unregisterClientChannel
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"session:" stringByAppendingString:v4]);
  [v6 unregisterClientChannelDestination:v5 clientUUID:self->_clientChannelUUID];
}

- (void)_invalidateClientChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  if ([v5 isInternalInstall])
  {
    int idsDataChannelClientPID = self->_idsDataChannelClientPID;

    if (idsDataChannelClientPID >= 1)
    {
      if (qword_1009BE928 != -1) {
        dispatch_once(&qword_1009BE928, &stru_1008F8870);
      }
      if (off_1009BE920 && (byte_1009BE918 & 1) == 0)
      {
        if (off_1009BE920( @"The client stopped reading incoming packets",  0LL,  self->_idsDataChannelClientPID))
        {
          byte_1009BE918 = 1;
          uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = self->_idsDataChannelClientPID;
            *(_DWORD *)buf = 67109120;
            int v27 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully got the stack shot for the client PID: %d",  buf,  8u);
          }

          if (os_log_shim_legacy_logging_enabled(v10)
            && _IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v24 = self->_idsDataChannelClientPID;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Successfully got the stack shot for the client PID: %d");
          }
        }

        else if ((byte_1009BE918 & 1) == 0)
        {
          uint64_t v20 = OSLogHandleForIDSCategory("IDSDSession");
          double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = self->_idsDataChannelClientPID;
            *(_DWORD *)buf = 67109120;
            int v27 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Couldn't get the stack shot for the client PID: %d",  buf,  8u);
          }

          if (os_log_shim_legacy_logging_enabled(v23)
            && _IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v24 = self->_idsDataChannelClientPID;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Couldn't get the stack shot for the client PID: %d");
          }
        }
      }
    }
  }

  else
  {
  }

  uint64_t v11 = OSLogHandleForTransportCategory("IDSDSession");
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "IDSClientChannel has excessively cached too many packets. Invalidating IDSClientChannel...",  buf,  2u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSClientChannel has excessively cached too many packets. Invalidating IDSClientChannel...");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSClientChannel has excessively cached too many packets. Invalidating IDSClientChannel...");
      }
    }
  }

  id v15 = objc_msgSend(v4, "invalidate", v24);
  uint64_t v17 = im_primary_queue(v15, v16);
  __int128 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100079A50;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_block_t v19 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v18, v19);
}

- (void)writeToClientChannel:(id)a3 packetBuffer:(id *)a4 metaData:(const char *)a5 metadataSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v10 = (IDSClientChannel *)a3;
  if (!v10)
  {
    if (self->_isLightweightParticipant)
    {
LABEL_5:
      uint64_t v11 = 0LL;
      goto LABEL_95;
    }

    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v12 useQRDirectly])
    {
    }

    else
    {
      BOOL bypassUTun = self->_bypassUTun;

      if (!bypassUTun)
      {
        uint64_t v57 = OSLogHandleForTransportCategory("IDSDSession");
        __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          if (a4) {
            int64_t var2 = a4->var2;
          }
          else {
            int64_t var2 = 0LL;
          }
          *(_DWORD *)buf = 134218752;
          *(void *)&uint8_t buf[4] = a4;
          __int16 v97 = 2048;
          double v98 = *(double *)&var2;
          __int16 v99 = 2048;
          int v100 = a5;
          __int16 v101 = 1024;
          LODWORD(v102) = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "IDSClientChannel is nil - dropping packetBuffer %p (length %lu) metadata %p metadataSize %d",  buf,  0x26u);
        }

        uint64_t v76 = os_log_shim_legacy_logging_enabled(v75);
        if ((_DWORD)v76)
        {
          if (_IDSShouldLogTransport(v76))
          {
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IDSClientChannel is nil - dropping packetBuffer %p (length %lu) metadata %p metadataSize %d");
            if (_IDSShouldLog(0LL, @"IDSDSession")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IDSClientChannel is nil - dropping packetBuffer %p (length %lu) metadata %p metadataSize %d");
            }
          }
        }

        goto LABEL_5;
      }
    }

    os_unfair_lock_lock(&self->_clientChannelLock);
    uint64_t v14 = objc_alloc(&OBJC_CLASS___IDSClientChannel);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([@"session:" stringByAppendingString:v16]);
    __int128 v18 = -[IDSClientChannel initWithDestination:](v14, "initWithDestination:", v17);
    clientChannel = self->_clientChannel;
    self->_clientChannel = v18;

    uint64_t v11 = v18;
    os_unfair_lock_unlock(&self->_clientChannelLock);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[IDSClientChannel setCachedDataForClient:](v11, "setCachedDataForClient:", v20);

    goto LABEL_10;
  }

  uint64_t v11 = v10;
  if (self->_isLightweightParticipant) {
    goto LABEL_95;
  }
LABEL_10:
  if (-[IDSClientChannel closed](v11, "closed"))
  {
    uint64_t v21 = OSLogHandleForTransportCategory("IDSDSession");
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "IDSClientChannel %p closed", buf, 0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"IDSClientChannel %p closed");
      }
    }

    goto LABEL_95;
  }

  if ((_DWORD)v6 || a4 && a4->var2)
  {
    if (-[IDSDSession _checkAndSendCachedDataForClient:](self, "_checkAndSendCachedDataForClient:", v11)
      && -[IDSClientChannel writePacketBuffer:metaData:metadataSize:moreComing:]( v11,  "writePacketBuffer:metaData:metadataSize:moreComing:",  a4,  a5,  v6,  0LL))
    {
      self->_double channelDataCachedTime = 0.0;
      goto LABEL_95;
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSClientChannel cachedDataForClient](v11, "cachedDataForClient"));
    v86 = -[IDSClientChannelData initWithPacketBuffer:metadata:metadataSize:]( objc_alloc(&OBJC_CLASS___IDSClientChannelData),  "initWithPacketBuffer:metadata:metadataSize:",  a4,  a5,  v6);
    objc_msgSend(v25, "addObject:");
    v85 = (char *)[v25 count];
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    if ([v26 isInternalInstall])
    {
      unsigned int v27 = -[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount");

      if (v27)
      {
LABEL_37:
        if (!-[IDSClientChannel excessiveCachingReportCounter](v11, "excessiveCachingReportCounter"))
        {
          uint64_t v40 = OSLogHandleForIDSCategory("IDSDSession");
          uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v85;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Added cachedData - total %lu cached client data to send",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v42)
            && _IDSShouldLog(0LL, @"IDSDSession"))
          {
            v77 = v85;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Added cachedData - total %lu cached client data to send");
          }
        }

        -[IDSClientChannel setExcessiveCachingReportCounter:]( v11,  "setExcessiveCachingReportCounter:",  ((-[IDSClientChannel excessiveCachingReportCounter](v11, "excessiveCachingReportCounter", v77)
                        + 1)
                       % 20));
        -[IDSClientChannel setExcessiveCachingCount:]( v11,  "setExcessiveCachingCount:",  -[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount") + 1);
        if (-[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount") >= 161)
        {
          uint64_t v43 = OSLogHandleForTransportCategory("IDSDSession");
          uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v45 = -[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "greater than threshold:  [clientChannel excessiveCachingCount]: %d",  buf,  8u);
          }

          uint64_t v47 = os_log_shim_legacy_logging_enabled(v46);
          if ((_DWORD)v47)
          {
            if (_IDSShouldLogTransport(v47))
            {
              double v78 = COERCE_DOUBLE((id)-[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount"));
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"greater than threshold:  [clientChannel excessiveCachingCount]: %d");
              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                double v78 = COERCE_DOUBLE((id)-[IDSClientChannel excessiveCachingCount]( v11,  "excessiveCachingCount",  *(void *)&v78));
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"greater than threshold:  [clientChannel excessiveCachingCount]: %d");
              }
            }
          }

          if (self->_channelDataCachedTime == 0.0)
          {
            self->_double channelDataCachedTime = sub_1000766FC();
            uint64_t v48 = OSLogHandleForTransportCategory("IDSDSession");
            uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              double channelDataCachedTime = self->_channelDataCachedTime;
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = channelDataCachedTime;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "writeToClientChannel: current data cached time: %f",  buf,  0xCu);
            }

            uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
            if ((_DWORD)v52)
            {
              if (_IDSShouldLogTransport(v52))
              {
                _IDSLogTransport( @"IDSDSession",  @"IDS",  @"writeToClientChannel: current data cached time: %f");
                if (_IDSShouldLog(0LL, @"IDSDSession")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"writeToClientChannel: current data cached time: %f");
                }
              }
            }

            goto LABEL_94;
          }

          double v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          else {
            double v61 = 2.0;
          }

          double v62 = sub_1000766FC();
          double v63 = v62 - self->_channelDataCachedTime;
          if (v63 <= v61 && -[IDSClientChannel excessiveCachingCount](v11, "excessiveCachingCount") < 1601)
          {
LABEL_94:

            goto LABEL_95;
          }

          uint64_t v64 = OSLogHandleForTransportCategory("IDSDSession");
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            double v66 = self->_channelDataCachedTime;
            *(_DWORD *)buf = 134218752;
            *(double *)&uint8_t buf[4] = v62;
            __int16 v97 = 2048;
            double v98 = v66;
            __int16 v99 = 2048;
            int v100 = *(const char **)&v63;
            __int16 v101 = 2048;
            double v102 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "invalid client channel: currentTime: %f, _channelDataCachedTime: %f, dataCachedDuration: %f, clientChannelTimedout: %f",  buf,  0x2Au);
          }

          uint64_t v68 = os_log_shim_legacy_logging_enabled(v67);
          if ((_DWORD)v68)
          {
            if (_IDSShouldLogTransport(v68))
            {
              double v80 = v63;
              double v81 = v61;
              double v78 = v62;
              double v79 = self->_channelDataCachedTime;
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"invalid client channel: currentTime: %f, _channelDataCachedTime: %f, dataCachedDuration: %f, clientChannelTimedout: %f");
              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                double v80 = v63;
                double v81 = v61;
                double v78 = v62;
                double v79 = self->_channelDataCachedTime;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"invalid client channel: currentTime: %f, _channelDataCachedTime: %f, dataCachedDuration: %f, clientChannelTimedout: %f");
              }
            }
          }

          self->_double channelDataCachedTime = 0.0;
          -[IDSDSession _invalidateClientChannel:]( self,  "_invalidateClientChannel:",  v11,  *(void *)&v78,  *(void *)&v79,  *(void *)&v80,  *(void *)&v81);
        }

        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id v69 = v25;
        v70 = (char *)[v69 countByEnumeratingWithState:&v91 objects:v95 count:16];
        if (v70)
        {
          uint64_t v71 = 0LL;
          uint64_t v72 = *(void *)v92;
          while (2)
          {
            v73 = 0LL;
            v74 = &v70[(void)v71];
            do
            {
              if (*(void *)v92 != v72) {
                objc_enumerationMutation(v69);
              }
              if ([*(id *)(*((void *)&v91 + 1) + 8 * (void)v73) packetBuffer])
              {
                v74 = &v73[(void)v71];
                goto LABEL_91;
              }

              ++v73;
            }

            while (v70 != v73);
            v70 = (char *)[v69 countByEnumeratingWithState:&v91 objects:v95 count:16];
            uint64_t v71 = v74;
            if (v70) {
              continue;
            }
            break;
          }
        }

        else
        {
          v74 = 0LL;
        }

- (BOOL)_checkAndSendCachedDataForClient:(id)a3
{
  id v4 = a3;
  p_clientChannelLock = &self->_clientChannelLock;
  os_unfair_lock_lock(&self->_clientChannelLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 cachedDataForClient]);
  uint64_t v7 = (char *)[v6 count];
  if (!v7)
  {
    if (self->_channelDataCachedTime != 0.0)
    {
      uint64_t v10 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "_checkAndSendCachedDataForClient: clear cached data time",  buf,  2u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"_checkAndSendCachedDataForClient: clear cached data time");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"_checkAndSendCachedDataForClient: clear cached data time");
          }
        }
      }

      self->_double channelDataCachedTime = 0.0;
      [v4 setExcessiveCachingCount:0];
    }

- (void)_checkAndRunClientChannelTests:(id)a3
{
  id v4 = a3;
  if (IMGetDomainBoolForKey(@"com.apple.ids", @"generateClientChannelDataTest"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007AE10;
    v12[3] = &unk_1008F7948;
    id v13 = v4;
    IDSTransportThreadAddBlockAfter(v12, 2.0);
  }

  if (IMGetDomainBoolForKey(@"com.apple.ids", @"overflowClientChannelDataTest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10007B00C;
    v9[3] = &unk_1008F8800;
    id v5 = v4;
    id v10 = v5;
    uint64_t v11 = self;
    IDSTransportThreadAddBlockAfter(v9, 2.0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10007B228;
    v6[3] = &unk_1008F8800;
    id v7 = v5;
    id v8 = self;
    IDSTransportThreadAddBlockAfter(v6, 4.0);
  }
}

- (void)_connectSocketDescriptor:(int)a3 toClientChannel:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([v6 transportType] == (id)1)
  {
    uint64_t v8 = im_primary_queue(1LL, v7);
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007B890;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v9, v10);
  }

  else
  {
    [v6 setClientReady:1];
    id v11 = [v6 connectWithTransportThread];
    if ((v11 & 1) != 0)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10007B8A8;
      v37[3] = &unk_1008F88C0;
      int v39 = v4;
      v37[4] = self;
      id v13 = (dispatch_queue_s *)v6;
      unsigned int v38 = v13;
      IDSTransportThreadAddSocket(v4, v37, 0LL);
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v13);
      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10007BE0C;
      v29[3] = &unk_1008F88E8;
      objc_copyWeak(&v32, &from);
      uint64_t v14 = v13;
      int v34 = v4;
      __int128 v30 = v14;
      uint64_t v31 = self;
      objc_copyWeak(&v33, &location);
      -[dispatch_queue_s setPacketBufferHandler:](v14, "setPacketBufferHandler:", v29);
      if (-[dispatch_queue_s hasMetadata](v14, "hasMetadata"))
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10007CAB4;
        v27[3] = &unk_1008F8910;
        v27[4] = self;
        __int128 v28 = v14;
        id v15 = objc_retainBlock(v27);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
        [v16 getLinkInformationForDevice:v18 completionHandler:v15];
      }

      uint64_t v19 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int socketDescriptor = self->_socketDescriptor;
        clientChannel = self->_clientChannel;
        *(_DWORD *)buf = 67109376;
        int v43 = socketDescriptor;
        __int16 v44 = 2048;
        unsigned int v45 = clientChannel;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "socket %d connected to IDSClientChannel %p",  buf,  0x12u);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24)
      {
        if (_IDSShouldLogTransport(v24))
        {
          _IDSLogTransport(@"IDSDSession", @"IDS", @"socket %d connected to IDSClientChannel %p");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"socket %d connected to IDSClientChannel %p");
          }
        }
      }

      objc_destroyWeak(&v33);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      BOOL v9 = v38;
    }

    else
    {
      uint64_t v25 = im_primary_queue(v11, v12);
      BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v25);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10007B89C;
      v40[3] = &unk_1008F6010;
      v40[4] = self;
      dispatch_block_t v26 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v40);
      dispatch_async(v9, v26);
    }
  }
}

- (id)_extractFieldBytesFromMetadata:(const void *)a3 ofSize:(unsigned int)a4 packetBuffer:(id *)a5
{
  unsigned __int8 v669 = -86;
  v668 = (char *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v667 = -21846;
  unint64_t v666 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v665[0] = v7;
  v665[1] = v7;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  IDSByteBufferInitForRead(v665, a3, a4);
  if (IDSByteBufferReadField(v665, &v669, &v668, &v667))
  {
    LODWORD(v641) = 0;
    double v642 = 0.0;
    LODWORD(v643) = 0;
    char v640 = 0;
    uint64_t v645 = 0LL;
    uint64_t v639 = IDSDataChannelEventNameKey;
    uint64_t v644 = IDSDataChannelLinkIDKey;
    uint64_t v646 = IDSDataChannelMKIUUIDKey;
    uint64_t v635 = IDSDataChannelMKIArrivalTimeKey;
    uint64_t v636 = IDSDataChannelPacketArrivalTimeKey;
    uint64_t v633 = IDSDataChannelIsLocallyGeneratedKey;
    uint64_t v638 = IDSDataChannelLastPacketReceivedTimeKey;
    uint64_t v637 = IDSDataChannelLastPacketSentTimeKey;
    uint64_t v634 = IDSGlobalLinkOptionSessionInfoRequestTypeKey;
    uint64_t v650 = IDSDataChannelQualityOfServiceTimestampValueKey;
    uint64_t v651 = IDSDataChannelQualityOfServicePayloadTypeKey;
    uint64_t v648 = IDSDataChannelQualityOfServiceTransactionIDKey;
    uint64_t v649 = IDSDataChannelQualityOfServiceOffsetBytesKey;
    uint64_t v647 = IDSDataChannelQualityOfServiceDropOperationKey;
    do
    {
      if (v669 > 0xFBu)
      {
        switch(v669)
        {
          case 0xFCu:
            if (v667 == 4)
            {
              self->_int idsDataChannelClientPID = bswap32(*(_DWORD *)v668);
              uint64_t v345 = OSLogHandleForIDSCategory("IDSDSession");
              v346 = (os_log_s *)objc_claimAutoreleasedReturnValue(v345);
              if (os_log_type_enabled(v346, OS_LOG_TYPE_DEFAULT))
              {
                int idsDataChannelClientPID = self->_idsDataChannelClientPID;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = idsDataChannelClientPID;
                _os_log_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_DEFAULT, "got the process PID %d", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled(v348)
                && _IDSShouldLog(0LL, @"IDSDSession"))
              {
                uint64_t v628 = self->_idsDataChannelClientPID;
                _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"got the process PID %d");
              }
            }

            else
            {
              uint64_t v509 = OSLogHandleForTransportCategory("IDSDSession");
              v510 = (os_log_s *)objc_claimAutoreleasedReturnValue(v509);
              if (os_log_type_enabled(v510, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 4;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v667;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v669;
                _os_log_impl( (void *)&_mh_execute_header,  v510,  OS_LOG_TYPE_DEFAULT,  "kClientChannelMetadataType_ProcessIDKey should be %d byte, not %u bytes, field: %u",  buf,  0x14u);
              }

              uint64_t v512 = os_log_shim_legacy_logging_enabled(v511);
              if ((_DWORD)v512)
              {
                if (_IDSShouldLogTransport(v512))
                {
                  *(void *)&double v629 = v667;
                  *(void *)&double v630 = v669;
                  uint64_t v628 = 4LL;
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"kClientChannelMetadataType_ProcessIDKey should be %d byte, not %u bytes, field: %u");
                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    *(void *)&double v629 = v667;
                    *(void *)&double v630 = v669;
                    uint64_t v628 = 4LL;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"kClientChannelMetadataType_ProcessIDKey should be %d byte, not %u bytes, field: %u");
                  }
                }
              }
            }

            break;
          case 0xFDu:
            if (v667 == 1)
            {
              uint64_t v643 = *v668;
              uint64_t v349 = OSLogHandleForTransportCategory("IDSDSession");
              v350 = (os_log_s *)objc_claimAutoreleasedReturnValue(v349);
              if (os_log_type_enabled(v350, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v643;
                _os_log_impl( (void *)&_mh_execute_header,  v350,  OS_LOG_TYPE_DEFAULT,  "kClientChannelMetadataType_DebugDataTransferTypeKey %d",  buf,  8u);
              }

              uint64_t v352 = os_log_shim_legacy_logging_enabled(v351);
              if ((_DWORD)v352)
              {
                if (_IDSShouldLogTransport(v352))
                {
                  uint64_t v628 = v643;
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"kClientChannelMetadataType_DebugDataTransferTypeKey %d");
                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    uint64_t v628 = v643;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"kClientChannelMetadataType_DebugDataTransferTypeKey %d");
                  }
                }
              }
            }

            else
            {
              uint64_t v513 = OSLogHandleForTransportCategory("IDSDSession");
              v514 = (os_log_s *)objc_claimAutoreleasedReturnValue(v513);
              if (os_log_type_enabled(v514, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v667;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v669;
                _os_log_impl( (void *)&_mh_execute_header,  v514,  OS_LOG_TYPE_DEFAULT,  "kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 bytes, not %u bytes, field: %u",  buf,  0xEu);
              }

              uint64_t v516 = os_log_shim_legacy_logging_enabled(v515);
              if ((_DWORD)v516)
              {
                if (_IDSShouldLogTransport(v516))
                {
                  uint64_t v628 = v667;
                  *(void *)&double v629 = v669;
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 bytes, not %u bytes, field: %u");
                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    uint64_t v628 = v667;
                    *(void *)&double v629 = v669;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 bytes, not %u bytes, field: %u");
                  }
                }
              }
            }

            break;
          case 0xFEu:
            dispatch_block_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v668, v667));
            unsigned int v27 = v26;
            if ((_DWORD)v643 == 1)
            {
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( NSString, "stringWithCString:encoding:", [v26 bytes], 1));
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              [v29 setGroupID:v28];

              uint64_t v30 = OSLogHandleForTransportCategory("IDSDSession");
              uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 groupID]);
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v33;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "kClientChannelMetadataType_DebugDataTransferKey got the group ID %@",  buf,  0xCu);
              }

              uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
              if ((_DWORD)v35)
              {
                if (_IDSShouldLogTransport(v35))
                {
                  int v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                  uint64_t v628 = objc_claimAutoreleasedReturnValue([v36 groupID]);
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"kClientChannelMetadataType_DebugDataTransferKey got the group ID %@");

                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    int v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v628));
                    uint64_t v628 = objc_claimAutoreleasedReturnValue([v37 groupID]);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"kClientChannelMetadataType_DebugDataTransferKey got the group ID %@");
                  }
                }
              }
            }

- (void)_connectQRDirectlyToClientChannel:(id)a3
{
  id v4 = a3;
  [v4 setClientReady:1];
  id v5 = [v4 connectWithTransportThread];
  if ((v5 & 1) != 0)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10008505C;
    v14[3] = &unk_1008F8988;
    v14[4] = self;
    objc_copyWeak(&v15, &location);
    [v4 setPacketBufferHandler:v14];
    uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "QR directly connected to IDSClientChannel %p",  buf,  0xCu);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"QR directly connected to IDSClientChannel %p");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"QR directly connected to IDSClientChannel %p");
        }
      }
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v11 = im_primary_queue(v5, v6);
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100085050;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v12, v13);
  }
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  id v83 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey]);
  uint64_t v7 = (char *)[v6 unsignedIntegerValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fromURI]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 unprefixedURI]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _bestGuessURI]);

  if (!v11
    || !IMStringIsPseudonymID(v11)
    || (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator")),
        dispatch_block_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState")),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]),
        id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v12 findAllocateResponseForSessionID:v14 FromURI:v11]),
        v14,
        v13,
        v12,
        !v15)
    && v7 == (char *)2)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 groupID]);
    id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v16 getAllocateResponse:v18 groupID:v20]);
  }

  if (v15)
  {
    if (kIDSQRAllocateKey_RelaySessionID) {
      Value = (void *)CFDictionaryGetValue(v15, kIDSQRAllocateKey_RelaySessionID);
    }
    else {
      Value = 0LL;
    }
    id v36 = Value;
    if (kIDSQRAllocateKey_GroupID) {
      int v37 = (void *)CFDictionaryGetValue(v15, kIDSQRAllocateKey_GroupID);
    }
    else {
      int v37 = 0LL;
    }
    id v38 = v37;
    uint64_t v39 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v42 = (char *)objc_claimAutoreleasedReturnValue([v41 groupID]);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      __int16 v96 = 2112;
      __int16 v97 = v42;
      __int16 v98 = 2112;
      id v99 = v38;
      __int16 v100 = 2112;
      id v101 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%@: requestSessionInfoWithOptions for groupID %@ relayGroupID %@ relaySessionID %@",  buf,  0x2Au);
    }

    uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
    if ((_DWORD)v44)
    {
      if (_IDSShouldLogTransport(v44))
      {
        unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v81 = v38;
        id v82 = v36;
        uint64_t v79 = self;
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v45 groupID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@: requestSessionInfoWithOptions for groupID %@ relayGroupID %@ relaySessionID %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", self, v80, v38, v36));
          id v81 = v38;
          id v82 = v36;
          uint64_t v79 = self;
          uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v46 groupID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@: requestSessionInfoWithOptions for groupID %@ relayGroupID %@ relaySessionID %@");
        }
      }
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
    if (v48)
    {
      CFDictionarySetValue(Mutable, v5, v48);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100696CA0();
    }

    uint64_t v49 = self->_metricsCollector;
    if (v49)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v49);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100696D9C();
    }

    double v50 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 p2pNegotiatorProvider]);

    if (v51)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v51);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100696D1C();
    }

    if (v7 == (char *)2)
    {
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _createStreamSubscriptionRequest:](self, "_createStreamSubscriptionRequest:", v83));
      uint64_t v57 = (__CFDictionary *)[v56 copy];

      CFMutableDictionaryRef Mutable = v57;
    }

    else if (v7 == (char *)1)
    {
      uint64_t v52 = (const void *)IDSGlobalLinkOptionSessionInfoCommandFlagKey;
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:IDSGlobalLinkOptionSessionInfoCommandFlagKey]);
      id v54 = [v53 unsignedIntValue];

      if ((_DWORD)v54)
      {
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v54));
        if (v55)
        {
          CFDictionarySetValue(Mutable, v52, v55);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100696CA0();
        }
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getNewLinkOptionsForActiveParticipantInfoRequest]( self,  "_getNewLinkOptionsForActiveParticipantInfoRequest",  v79,  v80,  v81,  v82));
      if (v74)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionNewLinkOptionsKey, v74);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100696C20();
      }

      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRSessionInfoKey, v15);
    }

    else
    {
      uint64_t v58 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v96 = 2048;
        __int16 v97 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%@: requestSessionInfoWithOptions doesn't support the requestType: %ld",  buf,  0x16u);
      }

      uint64_t v61 = os_log_shim_legacy_logging_enabled(v60);
      if ((_DWORD)v61)
      {
        if (_IDSShouldLogTransport(v61))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@: requestSessionInfoWithOptions doesn't support the requestType: %ld");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@: requestSessionInfoWithOptions doesn't support the requestType: %ld");
          }
        }
      }
    }

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_100086C80;
    v84[3] = &unk_1008F8A00;
    v84[4] = self;
    id v85 = v38;
    id v86 = v36;
    uint64_t v87 = Mutable;
    uint64_t v75 = Mutable;
    id v76 = v36;
    id v77 = v38;
    IDSTransportThreadAddBlock(v84, v78);
  }

  else
  {
    uint64_t v22 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "cachedSessionInfo is nil, requestType: %lu",  buf,  0xCu);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      if (_IDSShouldLogTransport(v25))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"cachedSessionInfo is nil, requestType: %lu");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"cachedSessionInfo is nil, requestType: %lu");
        }
      }
    }

    if ((unint64_t)(v7 - 1) > 1)
    {
      uint64_t v62 = OSLogHandleForTransportCategory("IDSDSession");
      double v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "%@: requestSessionInfoWithOptions failed! Couldn't get the cached response from QRAllocator.",  buf,  0xCu);
      }

      uint64_t v65 = os_log_shim_legacy_logging_enabled(v64);
      if ((_DWORD)v65)
      {
        if (_IDSShouldLogTransport(v65))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@: requestSessionInfoWithOptions failed! Couldn't get the cached response from QRAllocator.");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@: requestSessionInfoWithOptions failed! Couldn't get the cached response from QRAllocator.");
          }
        }
      }
    }

    else
    {
      dispatch_block_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 accountID]);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 accountWithUniqueID:v28]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 service]);

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v33 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v32 getQuickRelayAllocateOptions:&off_1009469A8]);

      CFDictionarySetValue(v33, kIDSQRAllocateKey_AllocateType, &off_1009469A8);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 groupID]);

      if (v35)
      {
        CFDictionarySetValue(v33, kIDSQRAllocateKey_GroupID, v35);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100696BA0();
      }

      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isLightweightParticipant));
      if (v66) {
        CFDictionarySetValue(v33, kIDSQRAllocateKey_IsLightweightParticipant, v66);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      uint64_t v67 = im_primary_base_queue(-[IDSGFTMetricsCollector sendAllocationRequest](self->_metricsCollector, "sendAllocationRequest"));
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100086918;
      block[3] = &unk_1008F89D8;
      id v89 = v31;
      unsigned int v90 = self;
      id v91 = v30;
      __int128 v92 = v33;
      id v69 = v33;
      id v70 = v30;
      id v71 = v31;
      objc_copyWeak(v94, (id *)buf);
      v94[1] = v7;
      id v93 = v83;
      unsigned int v72 = v68;
      dispatch_block_t v73 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
      dispatch_async(v72, v73);

      objc_destroyWeak(v94);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (int i = 0LL; i != v10; int i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        dispatch_block_t v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v13));
        if (v14)
        {
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, v13);
        }

        else
        {
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "requestURIsForParticipantIDs: could not find URI for participant id: %@",  buf,  0xCu);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v10);
  }

  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = -[NSMutableDictionary count](v7, "count");
    *(_DWORD *)buf = 138412546;
    id v33 = v24;
    __int16 v34 = 2048;
    id v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "requestURIsForParticipantIDs: request id %@ found %lu participants.",  buf,  0x16u);
  }

  uint64_t v20 = im_primary_queue(v18, v19);
  uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086F8C;
  block[3] = &unk_1008F5F58;
  void block[4] = self;
  dispatch_block_t v26 = v7;
  id v27 = v24;
  id v22 = v24;
  uint64_t v23 = v7;
  dispatch_async(v21, block);
}

- (void)registerPluginWithOptions:(id)a3 messageContext:(id)a4
{
  id v6 = (const __CFDictionary *)a3;
  id v7 = a4;
  Value = 0LL;
  if (v6 && IDSGroupSessionPluginNameKey) {
    Value = (void *)CFDictionaryGetValue(v6, IDSGroupSessionPluginNameKey);
  }
  id v9 = Value;
  id v10 = 0LL;
  if (v6 && IDSGroupSessionRawPublicKeyKey) {
    id v10 = (void *)CFDictionaryGetValue(v6, IDSGroupSessionRawPublicKeyKey);
  }
  id v11 = v10;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v13 = v9;
  if (v13)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginNameKey, v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696E1C();
  }

  CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginOperationKey, &off_1009469C0);
  if (v11) {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginRawPublicKeyKey, v11);
  }
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = sub_100087270;
  id v22 = &unk_1008F8800;
  uint64_t v23 = self;
  id v24 = Mutable;
  uint64_t v14 = Mutable;
  IDSTransportThreadAddBlock(&v19, v15);
  objc_msgSend(v7, "setReply:", 1, v19, v20, v21, v22, v23);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 localObject]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 broadcasterForLocalObject:v17 messageContext:v7]);

  [v18 emptyXPCReply];
}

- (void)unregisterPluginWithOptions:(id)a3 messageContext:(id)a4
{
  id v6 = (const __CFDictionary *)a3;
  id v7 = a4;
  Value = 0LL;
  if (v6 && IDSGroupSessionPluginNameKey) {
    Value = (void *)CFDictionaryGetValue(v6, IDSGroupSessionPluginNameKey);
  }
  id v9 = Value;
  id v10 = 0LL;
  if (v6 && IDSGroupSessionRawPublicKeyKey) {
    id v10 = (void *)CFDictionaryGetValue(v6, IDSGroupSessionRawPublicKeyKey);
  }
  id v11 = v10;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v13 = v9;
  if (v13)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginNameKey, v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696E1C();
  }

  CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginOperationKey, &off_100946978);
  if (v11) {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginRawPublicKeyKey, v11);
  }
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = sub_10008750C;
  id v22 = &unk_1008F8800;
  uint64_t v23 = self;
  id v24 = Mutable;
  uint64_t v14 = Mutable;
  IDSTransportThreadAddBlock(&v19, v15);
  objc_msgSend(v7, "setReply:", 1, v19, v20, v21, v22, v23);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 localObject]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 broadcasterForLocalObject:v17 messageContext:v7]);

  [v18 emptyXPCReply];
}

- (void)_sendingOfflineActiveParticipantInfoRequest:(id)a3
{
  id v4 = a3;
  id v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey]);
  id v7 = [v6 unsignedIntegerValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupID]);
  id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v8 getAllocateResponse:v10 groupID:v12]);

  Value = 0LL;
  if (v13 && kIDSQRAllocateKey_RelaySessionID) {
    Value = (void *)CFDictionaryGetValue(v13, kIDSQRAllocateKey_RelaySessionID);
  }
  id v15 = Value;
  uint64_t v16 = 0LL;
  if (v13 && kIDSQRAllocateKey_GroupID) {
    uint64_t v16 = (void *)CFDictionaryGetValue(v13, kIDSQRAllocateKey_GroupID);
  }
  id v17 = v16;
  uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 groupID]);
    *(_DWORD *)buf = 138413058;
    unsigned int v45 = self;
    __int16 v46 = 2112;
    uint64_t v47 = v21;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 2112;
    id v51 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: _sendingOfflineActiveParticipantInfoRequest for groupID %@ relayGroupID %@ relaySessionID %@",  buf,  0x2Au);
  }

  uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
  if ((_DWORD)v23)
  {
    if (_IDSShouldLogTransport(v23))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v24 groupID]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@: _sendingOfflineActiveParticipantInfoRequest for groupID %@ relayGroupID %@ relaySessionID %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", self, v38, v17, v15));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v25 groupID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@: _sendingOfflineActiveParticipantInfoRequest for groupID %@ relayGroupID %@ relaySessionID %@");
      }
    }
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
  if (v27)
  {
    CFDictionarySetValue(Mutable, v5, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696CA0();
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getNewLinkOptionsForActiveParticipantInfoRequest]( self,  "_getNewLinkOptionsForActiveParticipantInfoRequest"));
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionNewLinkOptionsKey, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696C20();
  }

  BOOL v29 = v13 != 0LL;

  __int128 v30 = v13;
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRSessionInfoKey, v30);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696E9C();
  }

  __int128 v31 = self->_metricsCollector;
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696D9C();
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 p2pNegotiatorProvider]);

  if (v33)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v33);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696D1C();
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100087AC0;
  v40[3] = &unk_1008F8A00;
  v40[4] = self;
  id v41 = v17;
  id v42 = v15;
  uint64_t v43 = Mutable;
  __int16 v34 = Mutable;
  id v35 = v15;
  id v36 = v17;
  IDSTransportThreadAddBlock(v40, v37);
}

- (id)_createStreamSubscriptionRequest:(id)a3
{
  id v4 = a3;
  id v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey]);
  id v7 = [v6 unsignedIntegerValue];

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
  if (v9)
  {
    CFDictionarySetValue(Mutable, v5, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696CA0();
  }

  id v10 = self->_metricsCollector;
  if (v10)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696D9C();
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 p2pNegotiatorProvider]);

  if (v12)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696D1C();
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelLinkIDToQueryKey]);
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelLinkIDKey]);
  }
  uint64_t v14 = IDSDataChannelPublishedStreamsKey;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelPublishedStreamsKey]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
  {

    goto LABEL_19;
  }

  uint64_t v18 = v13;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v14]);
  unsigned __int8 v20 = [v19 isEqualToString:IDSDataChannelNoStreamsKey];

  id v13 = v18;
  if ((v20 & 1) == 0)
  {
LABEL_19:
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v14]);
    goto LABEL_20;
  }

  uint64_t v21 = &__NSArray0__struct;
LABEL_20:
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelSubscribedStreamsKey]);
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v23 = IDSDataChannelAllParticipantsKey;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:IDSDataChannelAllParticipantsKey]);

  if (v24)
  {
    uint64_t v25 = v21;
    dispatch_block_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
    if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
    {
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
      unsigned int v30 = [v29 isEqualToString:IDSDataChannelAllStreamsKey];

      if (v30)
      {
        uint64_t v31 = 1LL;
LABEL_42:
        uint64_t v52 = objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  0LL,  0LL,  1LL,  v31));
LABEL_45:
        [v65 addObject:v52];
        uint64_t v21 = v25;
        id v32 = (void *)v52;
        goto LABEL_46;
      }
    }

    else
    {
    }

    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString, v48);
    if ((objc_opt_isKindOfClass(v47, v49) & 1) != 0)
    {
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
      unsigned int v51 = [v50 isEqualToString:IDSDataChannelNoStreamsKey];

      if (v51)
      {
        uint64_t v31 = 0LL;
        goto LABEL_42;
      }
    }

    else
    {
    }

    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
    uint64_t v52 = objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  0LL,  v53,  1LL,  0LL));

    goto LABEL_45;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
  id v33 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (!v33) {
    goto LABEL_46;
  }
  id v34 = v33;
  uint64_t v60 = v13;
  uint64_t v61 = v21;
  uint64_t v62 = Mutable;
  id v63 = v4;
  uint64_t v35 = *(void *)v67;
  uint64_t v64 = IDSDataChannelAllStreamsKey;
  do
  {
    for (int i = 0LL; i != v34; int i = (char *)i + 1)
    {
      if (*(void *)v67 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v37, v60, v61, v62, v63));
      uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString, v39);
      if ((objc_opt_isKindOfClass(v38, v40) & 1) != 0)
      {
        id v41 = v32;
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v37]);
        unsigned int v43 = [v42 isEqualToString:v64];

        id v32 = v41;
        if (v43)
        {
          id v44 = (id)objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  v37,  0LL,  0LL,  1LL));
          [v65 addObject:v44];
          goto LABEL_34;
        }
      }

      else
      {
      }

      unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v37]);
      id v44 = [v45 mutableCopy];

      __int16 v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  v37,  v44,  0LL,  0LL));
      [v65 addObject:v46];

LABEL_34:
    }

    id v34 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
  }

  while (v34);
  CFMutableDictionaryRef Mutable = v62;
  id v4 = v63;
  id v13 = v60;
  uint64_t v21 = v61;
LABEL_46:

  id v54 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelLinkIDKey]);
  if (v54)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionLinkIDKey, v54);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069709C();
  }

  id v55 = v13;
  if (v55)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionSessionInfoLinkIDToQueryKey, v55);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069701C();
  }

  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelParticipantGenerationCounterKey]);
  if (v56)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoGenerationCounter, v56);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696F9C();
  }

  id v57 = v65;
  if (v57)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoSubscribedStreams, v57);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696F1C();
  }

  if (v21) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoPublishedStreams, v21);
  }
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSDataChannelMaxConcurrentStreamsKey]);
  if (v58) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams, v58);
  }

  return Mutable;
}

- (void)_sendStreamSubscriptionRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
  id v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v5 getAllocateResponse:v7 groupID:v9]);

  Value = 0LL;
  if (v10 && kIDSQRAllocateKey_RelaySessionID) {
    Value = (void *)CFDictionaryGetValue(v10, kIDSQRAllocateKey_RelaySessionID);
  }
  id v12 = Value;
  id v13 = 0LL;
  if (v10 && kIDSQRAllocateKey_GroupID) {
    id v13 = (void *)CFDictionaryGetValue(v10, kIDSQRAllocateKey_GroupID);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100088494;
  v18[3] = &unk_1008F8A00;
  v18[4] = self;
  id v19 = v13;
  id v20 = v12;
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession _createStreamSubscriptionRequest:](self, "_createStreamSubscriptionRequest:", v4));
  id v14 = v21;
  id v15 = v12;
  id v16 = v19;
  IDSTransportThreadAddBlock(v18, v17);
}

- (id)_getNewLinkOptionsForActiveParticipantInfoRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSSessionIsMultiwayKey, &__kCFBooleanTrue);
  id v4 = self;
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_AlternateDelegate, v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069759C();
  }

  os_unfair_lock_lock(&v4->_clientChannelLock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IDSClientChannel clientUniquePID](v4->_clientChannel, "clientUniquePID")));
  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ClientUniquePID, v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069751C();
  }

  os_unfair_lock_unlock(&v4->_clientChannelLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSDSession disallowCellularInterface](v4, "disallowCellularInterface")));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionDisallowCellularKey, v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069749C();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSDSession disallowWifiInterface](v4, "disallowWifiInterface")));
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionDisallowWiFiKey, v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069741C();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v4, "sharedState"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 clientType]));

  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionClientTypeKey, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069739C();
  }

  callType = v4->_callType;
  if (callType) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionCallTypeKey, callType);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v4, "sharedState"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientUUID]);

  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_RelayClientUUID, v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_isLightweightParticipant));
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionIsLightweightParticipantKey, v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069731C();
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_startedAsUPlusOneSession));
  if (v14)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionStartedAsUPlusOneKey, v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069729C();
  }

  id v15 = v4->_metricsCollector;
  if (v15)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionMetricsCollectorKey, v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069721C();
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 p2pNegotiatorProvider]);

  if (v17)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionP2PNegotiatorKey, v17);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069719C();
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v4->_isAutoDisconnectSupportedForGFTService));
  if (v18)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionIsGFTServiceKey, v18);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069711C();
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_forceTCPFallbackOnCell));
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionForceTCPFallbackOnCellKey, v19);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_forceTCPFallbackOnWiFi));
  if (v20) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionForceTCPFallbackOnWiFiKey, v20);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_disableP2PLinks));
  if (v21) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkDisableP2PLinks, v21);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_forceIPv6));
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGlobalLinkOptionForceIPv6Key, v22);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_isShortMKIEnabled));
  if (v23) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionShortMKIEnabledKey, v23);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4->_isTLEEnabled));
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionTLEEnabledKey, v24);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  dispatch_block_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v25 shouldUseGecko]));

  if (v26) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSGroupSessionGeckoEnabledKey, v26);
  }

  return v3;
}

- (void)didReceiveCurrentCellularSignalRaw:(int)a3 signalStrength:(int)a4 signalGrade:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = OSLogHandleForIDSCategory("IDSDSession");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v31 = self;
    LOWORD(v32[0]) = 1024;
    *(_DWORD *)((char *)v32 + 2) = v7;
    WORD3(v32[0]) = 1024;
    DWORD2(v32[0]) = v6;
    WORD6(v32[0]) = 1024;
    *(_DWORD *)((char *)v32 + 14) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<%@> didReceiveCurrentCellularSignalRaw:%d signalStrength:%d signalGrade:%d",  buf,  0x1Eu);
  }

  if (os_log_shim_legacy_logging_enabled(v11) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    uint64_t v25 = v6;
    uint64_t v26 = v5;
    uint64_t v23 = self;
    uint64_t v24 = v7;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> didReceiveCurrentCellularSignalRaw:%d signalStrength:%d signalGrade:%d");
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v23, v24, v25, v26));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v13 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v14 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v19 = [v18 clientType] == (id)6;

  if (v19)
  {
LABEL_12:
    if (-[IDSClientChannel hasMetadata](self->_clientChannel, "hasMetadata"))
    {
      unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v27 = v15;
      __int128 v28 = v15;
      id v16 = malloc(0x1000uLL);
      IDSByteBufferInitForWriteWithAllocatedSpace(&v27, v16, 4096LL);
      int v33 = -1431655766;
      *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v32[1] = v17;
      v32[0] = v17;
      buf[0] = BYTE3(v7);
      buf[1] = BYTE2(v7);
      buf[2] = BYTE1(v7);
      buf[3] = v7;
      LOBYTE(v31) = BYTE3(v6);
      BYTE1(v31) = BYTE2(v6);
      BYTE2(v31) = BYTE1(v6);
      BYTE3(v31) = v6;
      BYTE4(v31) = BYTE3(v5);
      BYTE5(v31) = BYTE2(v5);
      BYTE6(v31) = BYTE1(v5);
      HIBYTE(v31) = v5;
      IDSByteBufferWriteField(&v27, 13LL, buf, 12LL);
      -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL,  v16,  (unsigned __int16)(v28 - v27));
      IDSByteBufferRelease(&v27);
    }

    return;
  }

  uint64_t v20 = OSLogHandleForIDSCategory("IDSDSession");
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to get cellular signals",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to get cellular signals");
  }
}

- (void)_sendLinkSelectionPreference:(id)a3 linkScore:(id)a4 ipPreference:(id)a5 uplinkNackDisabled:(id)a6
{
  id v10 = (IDSDSession *)a3;
  id v11 = a4;
  id v69 = a5;
  id v12 = a6;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v15 clientType] == (id)1)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v16 clientType] == (id)5)
  {

    goto LABEL_5;
  }

  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v61 = [v60 clientType];

  if (v61 == (id)6)
  {
LABEL_7:
    if (v10 && v11)
    {
      __int128 v17 = (const char *)-[IDSDSession unsignedCharValue](v10, "unsignedCharValue");
      uint64_t v18 = (__CFString *)[v11 unsignedCharValue];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v17));
      if (v19)
      {
        CFDictionarySetValue(Mutable, IDSLinkSuggestionKey, v19);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10069779C();
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v18));
      if (v24)
      {
        CFDictionarySetValue(Mutable, IDSLinkScoreKey, v24);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10069771C();
      }

      uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v76 = 1024;
        *(_DWORD *)id v77 = (_DWORD)v17;
        *(_WORD *)&v77[4] = 1024;
        *(_DWORD *)&v77[6] = (_DWORD)v18;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "<%@> _sendLinkSelectionPreference: linkSuggestion: %u, linkScore: %u",  buf,  0x18u);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          __int128 v66 = (const char *)v17;
          __int128 v68 = (__CFString *)v18;
          uint64_t v65 = self;
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> _sendLinkSelectionPreference: linkSuggestion: %u, linkScore: %u");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            __int128 v66 = v17;
            __int128 v68 = v18;
            uint64_t v65 = self;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> _sendLinkSelectionPreference: linkSuggestion: %u, linkScore: %u");
          }
        }
      }
    }

    else
    {
      uint64_t v20 = OSLogHandleForTransportCategory("IDSDSession");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        __int16 v76 = 2112;
        *(void *)id v77 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No linkSuggestion: %@ or linkScore: %@",  buf,  0x16u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          uint64_t v65 = v10;
          __int128 v66 = (const char *)v11;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"No linkSuggestion: %@ or linkScore: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v65 = v10;
            __int128 v66 = (const char *)v11;
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"No linkSuggestion: %@ or linkScore: %@");
          }
        }
      }
    }

    if (v69)
    {
      unint64_t v29 = (__CFString *)[v69 unsignedCharValue];
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v29));
      if (v30)
      {
        CFDictionarySetValue(Mutable, IDSLinkIPPreferenceKey, v30);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10069769C();
      }

      uint64_t v35 = OSLogHandleForTransportCategory("IDSDSession");
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v76 = 2080;
        *(void *)id v77 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        *(_WORD *)&v77[8] = 1024;
        LODWORD(v78) = (_DWORD)v29;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<%@> %s: ipPreference: %u", buf, 0x1Cu);
      }

      uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
      if ((_DWORD)v38)
      {
        if (_IDSShouldLogTransport(v38))
        {
          __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          __int128 v68 = (__CFString *)v29;
          uint64_t v65 = self;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> %s: ipPreference: %u");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            __int128 v68 = v29;
            uint64_t v65 = self;
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> %s: ipPreference: %u");
          }
        }
      }
    }

    else
    {
      uint64_t v31 = OSLogHandleForTransportCategory("IDSDSession");
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v76 = 2080;
        *(void *)id v77 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "<%@> %s: ipPreferenceObj is nil.",  buf,  0x16u);
      }

      uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
      if ((_DWORD)v34)
      {
        if (_IDSShouldLogTransport(v34))
        {
          uint64_t v65 = self;
          __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> %s: ipPreferenceObj is nil.");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v65 = self;
            __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> %s: ipPreferenceObj is nil.");
          }
        }
      }
    }

    if (v12)
    {
      id v39 = [v12 BOOLValue];
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
      if (v40)
      {
        CFDictionarySetValue(Mutable, IDSUplinkNackDisabledKey, v40);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10069761C();
      }

      uint64_t v45 = OSLogHandleForTransportCategory("IDSDSession");
      __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = @"NO";
        if ((_DWORD)v39) {
          uint64_t v47 = @"YES";
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v76 = 2080;
        *(void *)id v77 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        *(_WORD *)&v77[8] = 2112;
        uint64_t v78 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "<%@> %s: uplinkNackDisabled: %@",  buf,  0x20u);
      }

      uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
      if ((_DWORD)v49 && _IDSShouldLogTransport(v49))
      {
        __int16 v50 = (_DWORD)v39 ? @"YES" : @"NO";
        __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        __int128 v68 = v50;
        uint64_t v65 = self;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> %s: uplinkNackDisabled: %@");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          __int128 v68 = v50;
          uint64_t v65 = self;
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> %s: uplinkNackDisabled: %@");
        }
      }
    }

    else
    {
      uint64_t v41 = OSLogHandleForTransportCategory("IDSDSession");
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v76 = 2080;
        *(void *)id v77 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "<%@> %s: uplinkNackDisabledObj is nil.",  buf,  0x16u);
      }

      uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
      if ((_DWORD)v44)
      {
        if (_IDSShouldLogTransport(v44))
        {
          uint64_t v65 = self;
          __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> %s: uplinkNackDisabledObj is nil.");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v65 = self;
            __int128 v66 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> %s: uplinkNackDisabledObj is nil.");
          }
        }
      }
    }

    if (-[__CFDictionary count](Mutable, "count", v65, v66, v68))
    {
      id v74 = 0LL;
      unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  Mutable,  0LL,  &v74));
      uint64_t v52 = (__CFString *)v74;
      if (v52)
      {
        uint64_t v53 = OSLogHandleForIDSCategory("IDSDSession");
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v55 groupID]);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          __int16 v76 = 2112;
          *(void *)id v77 = v56;
          *(_WORD *)&v77[8] = 2112;
          uint64_t v78 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "<%@> _sendLinkSelectionPreference failed to encode linkSelectionEvents for group %@ (error: %@)",  buf,  0x20u);
        }

        if (os_log_shim_legacy_logging_enabled(v57)
          && _IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v58 groupID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> _sendLinkSelectionPreference failed to encode linkSelectionEvents for group %@ (error: %@)");
        }
      }

      else
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self->_clientChannel);
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472LL;
        v70[2] = sub_100089A1C;
        v70[3] = &unk_1008F8A28;
        objc_copyWeak(&v73, (id *)buf);
        id v71 = v51;
        unsigned int v72 = self;
        IDSTransportThreadAddBlock(v70, v59);

        objc_destroyWeak(&v73);
        objc_destroyWeak((id *)buf);
      }
    }

    goto LABEL_77;
  }

  uint64_t v62 = OSLogHandleForIDSCategory("IDSDSession");
  id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_LinkSuggestion",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v64) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_LinkSuggestion");
  }
LABEL_77:
}

- (void)updateRelevantEncryptedDataBlob
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue(-[IDSDSession formAndEncryptDataBlob:type:](self, "formAndEncryptDataBlob:type:", v4, 12LL));

    os_unfair_lock_lock(&self->_lock);
    encryptedDataBlob = self->_encryptedDataBlob;
    self->_encryptedDataBlob = v5;

    os_unfair_lock_unlock(&self->_lock);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantMirageHandshakeBlob]( self->_groupStatusNotificationParams,  "participantMirageHandshakeBlob"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantMirageHandshakeBlob]( self->_groupStatusNotificationParams,  "participantMirageHandshakeBlob"));
    uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue(-[IDSDSession formAndEncryptDataBlob:type:](self, "formAndEncryptDataBlob:type:", v8, 6LL));

    os_unfair_lock_lock(&self->_lock);
    encryptedMirageHandshakeBlob = self->_encryptedMirageHandshakeBlob;
    self->_encryptedMirageHandshakeBlob = v9;

    os_unfair_lock_unlock(&self->_lock);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
  [v15 updateServerDesiredKeyMaterialsForGroup:v12 sessionID:v14];
}

- (id)getEncryptedDataBlob
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_encryptedDataBlob;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)getEncryptedMirageHandshakeBlob
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_encryptedMirageHandshakeBlob;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)formAndEncryptDataBlob:(id)a3 type:(int)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    cryptorForBlobs = self->_cryptorForBlobs;
    id v17 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupSessionDataCryptor encryptData:sequenceNumber:error:]( cryptorForBlobs,  "encryptData:sequenceNumber:error:",  v6,  0LL,  &v17));
    id v10 = v17;
    if (v10)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10069781C();
      }

      os_unfair_lock_unlock(&self->_lock);
      id v12 = 0LL;
    }

    else
    {
      v28[0] = 0xAAAAAAAAAAAAAAAALL;
      v28[1] = 0xAAAAAAAAAAAAAAAALL;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionDataCryptor getEncryptionKeyID](self->_cryptorForBlobs, "getEncryptionKeyID"));
      os_unfair_lock_unlock(p_lock);
      [v14 getUUIDBytes:v28];
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v28,  16LL));
      [v12 appendData:v9];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110146;
        int v19 = a4;
        __int16 v20 = 2112;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "type: %d, encrypted blob: %@ plain blob: %@, localSKI: %@, encryptedData: %@",  buf,  0x30u);
      }
    }
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "formAndEncryptDataBlob: no valid plainDataBlob",  buf,  2u);
    }

    os_unfair_lock_unlock(&self->_lock);
    id v12 = 0LL;
  }

  return v12;
}

- (void)connectQRServer:(id)a3 withPreferredLocalInterface:(int)a4
{
  id v6 = (const __CFDictionary *)a3;
  theDict = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v191 = a4;
    -[IDSGFTMetricsCollector connectQRServer](self->_metricsCollector, "connectQRServer");
    CFMutableDictionaryRef v198 = (CFMutableDictionaryRef)-[__CFDictionary mutableCopy](v7, "mutableCopy");
    v196 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v198, "objectForKey:", kIDSQRAllocateKey_LinkSuggestion));
    uint64_t v195 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v198, "objectForKey:", kIDSQRAllocateKey_LinkScore));
    uint64_t v194 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v198, "objectForKey:", kIDSQRAllocateKey_RelayIPPreference));
    uint64_t v193 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v198, "objectForKey:", kIDSQRAllocateKey_UplinkNackDisabled));
    -[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]( self,  "_sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:",  v196,  v195,  v194,  v193);
    uint64_t v8 = kIDSQRAllocateKey_AllocateType;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v198, "objectForKey:", kIDSQRAllocateKey_AllocateType));
    unsigned int v10 = [v9 intValue];

    if (v10 != 3)
    {
      BOOL v190 = 0;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v198, "objectForKeyedSubscript:", v8));
      unsigned int v24 = [v23 intValue];
      if (v24 == 2)
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v26 = (uint64_t)[v25 sharedSession];
      }

      else
      {
        uint64_t v26 = 0LL;
      }

      goto LABEL_23;
    }

    if (self->_groupSessionState == 2)
    {
      uint64_t v11 = OSLogHandleForTransportCategory("IDSDSession");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "User already left group %@; don't connect",
          buf,
          0xCu);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if ((_DWORD)v16)
      {
        if (_IDSShouldLogTransport(v16))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          v180 = (void *)objc_claimAutoreleasedReturnValue([v17 groupID]);
          _IDSLogTransport(@"IDSDSession", @"IDS", @"User already left group %@; don't connect");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v180));
            uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue([v18 groupID]);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"User already left group %@; don't connect");
          }
        }
      }

      goto LABEL_241;
    }

    if (kIDSQRAllocateKey_RecipientID) {
      Value = CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RecipientID);
    }
    else {
      Value = 0LL;
    }
    -[IDSGroupStatusNotificationParameters setParticipantID:]( self->_groupStatusNotificationParams,  "setParticipantID:",  Value);
    BOOL v190 = v10 == 3;
    if (kIDSQRAllocateKey_RelaySessionID) {
      __int128 v94 = CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelaySessionID);
    }
    else {
      __int128 v94 = 0LL;
    }
    -[IDSGroupStatusNotificationParameters setRelaySessionID:]( self->_groupStatusNotificationParams,  "setRelaySessionID:",  v94);
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantID]( self->_groupStatusNotificationParams,  "participantID"));
    if (v95)
    {
      __int16 v96 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters relaySessionID]( self->_groupStatusNotificationParams,  "relaySessionID"));
      if (v96)
      {
        __int16 v97 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantData]( self->_groupStatusNotificationParams,  "participantData"));

        if (v97)
        {
          __int16 v98 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
          id v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          __int16 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 groupID]);
          id v101 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          double v102 = (void *)objc_claimAutoreleasedReturnValue([v101 uniqueID]);
          [v98 updateServerDesiredKeyMaterialsForGroup:v100 sessionID:v102];

          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
          LODWORD(v99) = [v103 shouldUseGecko];

          if ((_DWORD)v99)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupDefaultRootMaterialExchangeController quicMaterialExchangeProvider]( self->_exchangeController,  "quicMaterialExchangeProvider"));
            if (v104)
            {
              CFDictionarySetValue(v198, IDSGroupSessionQUICExchangeProviderKey, v104);
            }

            else
            {
              id v177 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10069847C();
              }
            }
          }

          else
          {
            os_unfair_lock_lock(&self->_lock);
            uint64_t v174 = self->_serverDesiredKeyMaterialsFromGroupEncryptionController;
            if (v174)
            {
              CFDictionarySetValue(v198, IDSGroupSessionInitialMaterialsKey, v174);
            }

            else
            {
              id v175 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10069857C();
              }
            }

            id v176 = [self->_serverDesiredKeyMaterialsSigner copy];
            if (v176)
            {
              CFDictionarySetValue(v198, IDSGroupSessionInitialMaterialsSignerKey, v176);
            }

            else
            {
              id v178 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006984FC();
              }
            }

            os_unfair_lock_unlock(&self->_lock);
          }

          uint64_t v26 = 1LL;
LABEL_23:
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 clientType]));

          if (v29)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionClientTypeKey, v29);
          }

          else
          {
            id v30 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006983FC();
            }
          }

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_preferredAddressFamily));
          if (v31)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionPreferredAddressFamilyKey, v31);
          }

          else
          {
            id v32 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10069837C();
            }
          }

          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_disallowCellularInterface));
          if (v33)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionDisallowCellularKey, v33);
          }

          else
          {
            id v34 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006982FC();
            }
          }

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_disallowWifiInterface));
          if (v35)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionDisallowWiFiKey, v35);
          }

          else
          {
            id v36 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10069827C();
            }
          }

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_preferCellularForCallSetup));
          if (v37)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionPreferCellularForCallSetupKey, v37);
          }

          else
          {
            id v38 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006981FC();
            }
          }

          id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 clientUUID]);

          if (v40)
          {
            CFDictionarySetValue(v198, kIDSQRAllocateKey_RelayClientUUID, v40);
          }

          else
          {
            id v41 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10069817C();
            }
          }

          id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26));
          if (v42)
          {
            CFDictionarySetValue(v198, IDSSessionIsMultiwayKey, v42);
          }

          else
          {
            id v43 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006980FC();
            }
          }

          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isLightweightParticipant));
          if (v44)
          {
            CFDictionarySetValue(v198, IDSGroupSessionIsLightweightParticipantKey, v44);
          }

          else
          {
            id v45 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10069807C();
            }
          }

          __int16 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_startedAsUPlusOneSession));
          if (v46)
          {
            CFDictionarySetValue(v198, IDSGroupSessionStartedAsUPlusOneKey, v46);
          }

          else
          {
            id v47 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100697FFC();
            }
          }

          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isAutoDisconnectSupportedForGFTService));
          if (v48)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionIsGFTServiceKey, v48);
          }

          else
          {
            id v49 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100697F7C();
            }
          }

          __int16 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_forceTCPFallbackOnCell));
          if (v50) {
            CFDictionarySetValue(v198, IDSGroupSessionForceTCPFallbackOnCellKey, v50);
          }

          unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_forceTCPFallbackOnWiFi));
          if (v51) {
            CFDictionarySetValue(v198, IDSGroupSessionForceTCPFallbackOnWiFiKey, v51);
          }

          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_sessionIsNonUserParticipantInitiated));
          if (v52)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionSessionIsNonUserParticipantInitiated, v52);
          }

          else
          {
            id v53 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100697EFC();
            }
          }

          id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_handOffOverQREnabled));
          if (v54)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionSessionHandOffOverQREnabled, v54);
          }

          else
          {
            id v55 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100697E7C();
            }
          }

          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  self->_cellularSlicingFlags));
          if (v56)
          {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionSessionCellularSlicingFlags, v56);
          }

          else
          {
            id v57 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100697DFC();
            }
          }

          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_disableP2PLinks));
          if (v58) {
            CFDictionarySetValue(v198, IDSGlobalLinkDisableP2PLinks, v58);
          }

          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_forceIPv6));
          if (v59) {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionForceIPv6Key, v59);
          }

          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isShortMKIEnabled));
          if (v60) {
            CFDictionarySetValue(v198, IDSGroupSessionShortMKIEnabledKey, v60);
          }

          id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isTLEEnabled));
          if (v61) {
            CFDictionarySetValue(v198, IDSGroupSessionTLEEnabledKey, v61);
          }

          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
          id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v62 shouldUseGecko]));

          if (v63) {
            CFDictionarySetValue(v198, IDSGroupSessionGeckoEnabledKey, v63);
          }

          uint64_t v64 = self->_callType;
          if (v64) {
            CFDictionarySetValue(v198, IDSGlobalLinkOptionCallTypeKey, v64);
          }

          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));
          BOOL v66 = [v65 length] == 0;

          if (!v66)
          {
            __int128 v67 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));
            if (v67)
            {
              CFDictionarySetValue(v198, IDSGroupSessionParticipantDataKey, v67);
            }

            else
            {
              id v68 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100697D7C();
              }
            }
          }

          id v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          if (([v69 useQRDirectly] & 1) == 0)
          {
            id v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            if ([v70 clientType] != (id)1)
            {
              id v71 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              if ([v71 clientType] != (id)5)
              {
                BOOL v105 = v10 == 3;
                uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                if ([v106 clientType] == (id)6) {
                  BOOL v105 = 1;
                }

                if (!v105)
                {
LABEL_123:
                  __int16 v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_linkProtocol));
                  if (v76)
                  {
                    CFDictionarySetValue(v198, kIDSQRAllocateKey_RelayLinkProtocol, v76);
                  }

                  else
                  {
                    id v77 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_100697C7C();
                    }
                  }

                  if (self->_linkProtocol != 2)
                  {
                    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  self->_relayPort));
                    if (v78)
                    {
                      CFDictionarySetValue(v198, kIDSQRAllocateKey_RelayPort, v78);
                    }

                    else
                    {
                      id v79 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100697BFC();
                      }
                    }
                  }

                  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                  unsigned int v192 = [v80 isInitiator];

                  if (v10 == 3)
                  {
                    if (!self->_startedAsUPlusOneSession)
                    {
LABEL_198:
                      -[IDSGFTMetricsCollector setIsInitiator:](self->_metricsCollector, "setIsInitiator:", v192);
                      uint64_t v130 = self->_metricsCollector;
                      if (v130)
                      {
                        CFDictionarySetValue(v198, IDSGlobalLinkOptionMetricsCollectorKey, v130);
                      }

                      else
                      {
                        id v131 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_10069797C();
                        }
                      }

                      v132 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
                      uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue([v132 p2pNegotiatorProvider]);

                      if (v133)
                      {
                        CFDictionarySetValue(v198, IDSGlobalLinkOptionP2PNegotiatorKey, v133);
                      }

                      else
                      {
                        id v134 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_1006978FC();
                        }
                      }

                      os_unfair_lock_lock(&self->_clientChannelLock);
                      uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IDSClientChannel clientUniquePID](self->_clientChannel, "clientUniquePID")));
                      if (v135)
                      {
                        CFDictionarySetValue(v198, kIDSQRAllocateKey_ClientUniquePID, v135);
                      }

                      else
                      {
                        id v136 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_10069787C();
                        }
                      }

                      os_unfair_lock_unlock(&self->_clientChannelLock);
                      uint64_t v137 = OSLogHandleForTransportCategory("IDSDSession");
                      v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
                      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int v139 = v10;
                        uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        uint64_t v141 = (void *)objc_claimAutoreleasedReturnValue([v140 uniqueID]);
                        v142 = @"YES";
                        if (v10 == 3) {
                          uint64_t v143 = @"YES";
                        }
                        else {
                          uint64_t v143 = @"NO";
                        }
                        if (v192) {
                          v144 = @"YES";
                        }
                        else {
                          v144 = @"NO";
                        }
                        uint64_t v145 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        uint64_t v146 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        *(_DWORD *)buf = 138413314;
                        *(void *)&uint8_t buf[4] = v141;
                        __int16 v206 = 2112;
                        int v207 = (void *)v143;
                        __int16 v208 = 2112;
                        uint64_t v209 = v144;
                        __int16 v210 = 2112;
                        uint64_t v211 = v142;
                        __int16 v212 = 1024;
                        LODWORD(v213) = [v146 clientType];
                        _os_log_impl( (void *)&_mh_execute_header,  v138,  OS_LOG_TYPE_DEFAULT,  "Connect to QR server for %@. (sharedSession:%@, isInitiator:%@, isLegacy:%@, clientType:%d)",  buf,  0x30u);

                        unsigned int v10 = v139;
                      }

                      uint64_t v148 = os_log_shim_legacy_logging_enabled(v147);
                      if ((_DWORD)v148 && _IDSShouldLogTransport(v148))
                      {
                        uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue([v149 uniqueID]);
                        v151 = @"NO";
                        uint64_t v152 = v10 == 3 ? @"YES" : @"NO";
                        BOOL v153 = v192 ? @"YES" : @"NO";
                        v154 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        v155 = [v154 isScreenSharingSession] ? @"YES" : @"NO";
                        v156 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                        v184 = v155;
                        id v187 = [v156 clientType];
                        v182 = v152;
                        v183 = v153;
                        v179 = v150;
                        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Connect to QR server for %@. (sharedSession:%@, isInitiator:%@, isLegacy:%@, clientType:%d)");

                        if (_IDSShouldLog(0LL, @"IDSDSession"))
                        {
                          uint64_t v157 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v150, v152, v153, v155, v187));
                          uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue([v157 uniqueID]);
                          uint64_t v159 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                          v160 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                          v184 = (__CFString *)v151;
                          id v187 = [v160 clientType];
                          v182 = v152;
                          v183 = v153;
                          v179 = v158;
                          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Connect to QR server for %@. (sharedSession:%@, isInitiator:%@, isLegacy:%@, clientType:%d)");
                        }
                      }

                      uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator", v179, v182, v183, v184, v187));
                      uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue([v162 uniqueID]);
                      id v164 = [v161 getLocalParticipantIDForRelaySessionID:v163];

                      uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
                      v166 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue([v166 uniqueID]);
                      uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      unint64_t v169 = (void *)objc_claimAutoreleasedReturnValue([v168 uniqueID]);
                      id v170 = [v165 setLocalParticipantID:v164 forGroupID:v167 sessionID:v169];

                      if (v170 == (id)2) {
                        -[IDSGFTMetricsCollector participantIdChanged](self->_metricsCollector, "participantIdChanged");
                      }
                      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
                      objc_initWeak((id *)buf, self);
                      uint64_t v171 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
                      uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      uint64_t v173 = (void *)objc_claimAutoreleasedReturnValue([v172 uniqueID]);
                      v199[0] = _NSConcreteStackBlock;
                      v199[1] = 3221225472LL;
                      v199[2] = sub_10008BA6C;
                      v199[3] = &unk_1008F8AC8;
                      objc_copyWeak(&v202, (id *)buf);
                      v200 = v198;
                      uint64_t v201 = self;
                      char v203 = v192;
                      BOOL v204 = v190;
                      [v171 connectGlobalLinkForDevice:v173 sessionInfo:v200 connectReadyHandler:v199 withLocalInterfacePreference:v191];

                      objc_destroyWeak(&v202);
                      objc_destroyWeak((id *)buf);
LABEL_241:

                      goto LABEL_242;
                    }

                    id v81 = 0LL;
                    if (v198 && kIDSQRAllocateKey_isInitiator) {
                      id v81 = (void *)CFDictionaryGetValue(v198, kIDSQRAllocateKey_isInitiator);
                    }
                    if ([v81 BOOLValue])
                    {
                      if (qword_1009BE930 != -1) {
                        dispatch_once(&qword_1009BE930, &stru_1008F91C0);
                      }
                      uint64_t v82 = mach_continuous_time();
                      double v83 = *(double *)&qword_1009BE938;
                      char v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      [v84 setInviteSentTime:v83 * (double)v82];

                      id v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      [v85 inviteSentTime];
                      id v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

                      if (v86) {
                        goto LABEL_144;
                      }
                      id v129 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_1006979FC();
                      }
                      goto LABEL_195;
                    }

                    id v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_inviteRecvTime));
                    if (v86)
                    {
LABEL_159:
                      CFDictionarySetValue(v198, IDSGlobalLinkOptionInviteRecvTimeKey, v86);
LABEL_192:
                      unsigned int v192 = 0;
LABEL_197:

                      goto LABEL_198;
                    }

                    id v128 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_100697A7C();
                    }
                  }

                  else
                  {
                    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                    unsigned int v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v87 enableSKE]));

                    if (v88)
                    {
                      CFDictionarySetValue(v198, IDSGlobalLinkOptionEnableSKEKey, v88);
                    }

                    else
                    {
                      id v89 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100697B7C();
                      }
                    }

                    unsigned int v90 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                    id v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v90 useSecureQRControlMessage]));

                    if (v91)
                    {
                      CFDictionarySetValue(v198, IDSGlobalLinkOptionUseSecureControlMessageKey, v91);
                    }

                    else
                    {
                      id v92 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100697AFC();
                      }
                    }

                    if (v192)
                    {
                      id v93 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      [v93 inviteSentTime];
                      id v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

                      if (v86)
                      {
LABEL_144:
                        CFDictionarySetValue(v198, IDSGlobalLinkOptionInviteSentTimeKey, v86);
LABEL_196:
                        unsigned int v192 = 1;
                        goto LABEL_197;
                      }

                      id v127 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_1006979FC();
                      }
LABEL_195:

                      goto LABEL_196;
                    }

                    id v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_inviteRecvTime));
                    if (v86) {
                      goto LABEL_159;
                    }
                    id v126 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_100697A7C();
                    }
                  }

                  goto LABEL_192;
                }

- (void)_noteJoinNotificationWillSend
{
  if (self->_joinSendStartTime == 0.0)
  {
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_joinSendStartTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  }

  -[IDSDSession _serverSpecifiedJoinNotificationDeliveryTimeout]( self,  "_serverSpecifiedJoinNotificationDeliveryTimeout");
  double v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 destinations]);
  id v7 = [v6 count];

  if (v7 && v4 > 2.22044605e-16)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    block = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472LL;
    unsigned int v51 = sub_10008DB50;
    uint64_t v52 = &unk_1008F8A78;
    objc_copyWeak(&v53, &location);
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    id joinNotificationDeliveryTimeoutBlock = self->_joinNotificationDeliveryTimeoutBlock;
    self->_id joinNotificationDeliveryTimeoutBlock = v8;

    uint64_t v10 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
      id v14 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 destinations]);
      *(_DWORD *)buf = 138413058;
      uint64_t v56 = v13;
      __int16 v57 = 2048;
      double v58 = v4;
      __int16 v59 = 2112;
      id v60 = v14;
      __int16 v61 = 2112;
      uint64_t v62 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, timeoutBlock: %@ destinations: %@ }",  buf,  0x2Au);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 groupID]);
        id v21 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v47 = v21;
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v22 destinations]);
        double v46 = v4;
        id v45 = v20;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, timeoutBlock: %@ destinations: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession sharedState]( self,  "sharedState",  v20,  *(void *)&v4,  v21,  v48,  block,  v50,  v51,  v52));
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 groupID]);
          id v25 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v47 = v25;
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v26 destinations]);
          double v46 = v4;
          id v45 = v24;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, timeoutBlock: %@ destinations: %@ }");
        }
      }
    }

    dispatch_time_t v27 = dispatch_walltime(0LL, (uint64_t)(v4 * 1000000000.0));
    uint64_t v29 = im_primary_queue(v27, v28);
    id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v29);
    dispatch_after(v27, v30, self->_joinNotificationDeliveryTimeoutBlock);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v31 = OSLogHandleForTransportCategory("IDSDSession");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 groupID]);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 destinations]);
      *(_DWORD *)buf = 138412802;
      uint64_t v56 = v34;
      __int16 v57 = 2048;
      double v58 = v4;
      __int16 v59 = 2112;
      id v60 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Not starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, destinations: %@ }",  buf,  0x20u);
    }

    uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
    if ((_DWORD)v38)
    {
      if (_IDSShouldLogTransport(v38))
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 groupID]);
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v41 destinations]);
        double v46 = v4;
        id v45 = v40;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Not starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, destinations: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v40, *(void *)&v4, v47));
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 groupID]);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v44 destinations]);
          double v46 = v4;
          id v45 = v43;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Not starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, destinations: %@ }");
        }
      }
    }
  }

  -[IDSGFTMetricsCollector willSendJoin](self->_metricsCollector, "willSendJoin", v45, *(void *)&v46, v47, v48);
}

- (void)_noteJoinNotificationDidDeliverWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_joinSendEndTime == 0.0)
  {
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_joinSendEndTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  }

  if (v3)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 groupID]);
      id v9 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      *(_DWORD *)buf = 138412546;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceling timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }",  buf,  0x16u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
        id v28 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Canceling timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v27, v28));
          dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
          id v28 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Canceling timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }");
        }
      }
    }

    p_id joinNotificationDeliveryTimeoutBlock = &self->_joinNotificationDeliveryTimeoutBlock;
    id joinNotificationDeliveryTimeoutBlock = self->_joinNotificationDeliveryTimeoutBlock;
    if (joinNotificationDeliveryTimeoutBlock)
    {
      dispatch_block_cancel(joinNotificationDeliveryTimeoutBlock);
LABEL_22:
      id v26 = *p_joinNotificationDeliveryTimeoutBlock;
      *p_id joinNotificationDeliveryTimeoutBlock = 0LL;
    }
  }

  else
  {
    uint64_t v16 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 groupID]);
      id v20 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      *(_DWORD *)buf = 138412546;
      id v30 = v19;
      __int16 v31 = 2112;
      id v32 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Triggering early execution of timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }",  buf,  0x16u);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue([v23 groupID]);
        id v28 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Triggering early execution of timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v27, v28));
          dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue([v24 groupID]);
          id v28 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Triggering early execution of timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }");
        }
      }
    }

    p_id joinNotificationDeliveryTimeoutBlock = &self->_joinNotificationDeliveryTimeoutBlock;
    id v25 = (void (**)(void))self->_joinNotificationDeliveryTimeoutBlock;
    if (v25)
    {
      v25[2]();
      goto LABEL_22;
    }
  }

  -[IDSGFTMetricsCollector didSendJoin](self->_metricsCollector, "didSendJoin", v27, v28);
}

- (double)_serverSpecifiedJoinNotificationDeliveryTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-session-join-reliability-timeout"]);

  double v5 = 30.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v5 = v7;
    }
  }

  return v5;
}

- (BOOL)shouldAllocateForInvitee
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-session-allocate-for-invitee"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)openSocketToDevice:(id)a3
{
  id v91 = (__CFString *)a3;
  if (self->_shouldAssertRealTimeMode && !self->_assertedRealTimeMode)
  {
    self->_assertedRealTimeMode = 1;
    IDSTransportThreadAddBlock(&stru_1008F8B08, v4);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountWithUniqueID:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  unsigned int v90 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v11 = [v10 clientType];

  if (v11 == (id)4) {
    self->_BOOL bypassUTun = 1;
  }
  if (-[IDSDSession _shouldUseIPsecLink](self, "_shouldUseIPsecLink"))
  {
    self->_BOOL bypassUTun = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v12 setUseBTDatagramPipe:0];

    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bypassUTun) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
      *(_DWORD *)buf = 138412802;
      __int16 v97 = v15;
      __int16 v98 = 2112;
      id v99 = v90;
      __int16 v100 = 2112;
      id v101 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "IPsecLink is enabled. UTun bypass: %@ service: %@, session: %@.",  buf,  0x20u);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19 && _IDSShouldLogTransport(v19))
    {
      id v20 = @"YES";
      uint64_t v21 = self->_bypassUTun ? @"YES" : @"NO";
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v88 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
      double v83 = v21;
      id v86 = v90;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"IPsecLink is enabled. UTun bypass: %@ service: %@, session: %@.");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        if (!self->_bypassUTun) {
          id v20 = @"NO";
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v21, v90, v88));
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
        id v86 = v90;
        unsigned int v88 = v24;
        double v83 = (__CFString *)v20;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"IPsecLink is enabled. UTun bypass: %@ service: %@, session: %@.");
LABEL_35:
      }
    }
  }

  else
  {
    self->_BOOL bypassUTun = IMGetDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"SessionBypassUTun",  self->_bypassUTun);
    uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bypassUTun) {
        dispatch_time_t v27 = @"YES";
      }
      else {
        dispatch_time_t v27 = @"NO";
      }
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 uniqueID]);
      *(_DWORD *)buf = 138412802;
      __int16 v97 = v27;
      __int16 v98 = 2112;
      id v99 = v90;
      __int16 v100 = 2112;
      id v101 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "UTun bypass: %@ service: %@, session: %@.",  buf,  0x20u);
    }

    uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
    if ((_DWORD)v31 && _IDSShouldLogTransport(v31))
    {
      id v32 = @"YES";
      uint64_t v33 = self->_bypassUTun ? @"YES" : @"NO";
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v88 = (void *)objc_claimAutoreleasedReturnValue([v34 uniqueID]);
      double v83 = v33;
      id v86 = v90;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"UTun bypass: %@ service: %@, session: %@.");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        if (!self->_bypassUTun) {
          id v32 = @"NO";
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v33, v90, v88));
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
        id v86 = v90;
        unsigned int v88 = v24;
        double v83 = (__CFString *)v32;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"UTun bypass: %@ service: %@, session: %@.");
        goto LABEL_35;
      }
    }
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v83, v86, v88));
  if ([v35 clientType] == (id)1)
  {
    BOOL v36 = 1;
  }

  else
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v37 clientType] == (id)5)
    {
      BOOL v36 = 1;
    }

    else
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      BOOL v36 = [v38 clientType] == (id)6;
    }
  }

  id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v40 = [v39 useQRDirectly];

  if (v40 | v36)
  {
    uint64_t v41 = OSLogHandleForTransportCategory("IDSDSession");
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v44 = [v43 useQRDirectly];
      id v45 = @"NO";
      if (v44) {
        double v46 = @"YES";
      }
      else {
        double v46 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      __int16 v97 = v91;
      id v99 = v46;
      __int16 v98 = 2112;
      if (v36) {
        id v45 = @"YES";
      }
      __int16 v100 = 2112;
      id v101 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "openSocketToDevice deviceID %@, self.sharedState.useQRDirectly %@, _isFaceTime %@",  buf,  0x20u);
    }

    uint64_t v48 = os_log_shim_legacy_logging_enabled(v47);
    if ((_DWORD)v48 && _IDSShouldLogTransport(v48))
    {
      id v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v50 = [v49 useQRDirectly] ? @"YES" : @"NO";
      unsigned int v51 = v36 ? @"YES" : @"NO";
      uint64_t v87 = v50;
      id v89 = v51;
      char v84 = v91;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"openSocketToDevice deviceID %@, self.sharedState.useQRDirectly %@, _isFaceTime %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v91, v87, v51));
        else {
          id v53 = @"NO";
        }
        uint64_t v87 = (__CFString *)v53;
        id v89 = v51;
        char v84 = v91;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"openSocketToDevice deviceID %@, self.sharedState.useQRDirectly %@, _isFaceTime %@");
      }
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v84, v87, v89));
    [v54 clearAllTimers];

    -[IDSDSession startQRSession](self, "startQRSession");
  }

  else
  {
    uint64_t v55 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      BOOL bypassUTun = self->_bypassUTun;
      *(_DWORD *)buf = 67109120;
      LODWORD(v97) = bypassUTun;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "open socket for session, byPassUtun: %d",  buf,  8u);
    }

    double v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 serviceName]);
    BOOL v85 = self->_bypassUTun;
    DLCSessionLogWithLevel(v59, @"IDSDSession", 0LL, 0LL, @"open socket for session, byPassUtun: %d");

    if (self->_bypassUTun)
    {
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472LL;
      v95[2] = sub_10008EC90;
      v95[3] = &unk_1008F8B30;
      v95[4] = self;
      id v60 = -[IDSConnectionContext initWithReadHandler:]( objc_alloc(&OBJC_CLASS___IDSConnectionContext),  "initWithReadHandler:",  v95,  v85);
      connectionContext = self->_connectionContext;
      self->_connectionContext = v60;
    }

    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v85));
    id v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceUniqueID](self, "_acceptedDeviceUniqueID"));
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceToken](self, "_acceptedDeviceToken"));
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 rawToken]);
    BOOL v66 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:]( self,  "_socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:",  v91,  v63,  v65,  0LL));
    uint64_t v68 = im_primary_queue(v66, v67);
    id v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    id v94[2] = sub_10008ED04;
    v94[3] = &unk_1008F8B58;
    v94[4] = self;
    [v62 openSocketWithOptions:v66 queue:v69 completionHandler:v94];

    id v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v71 = (unint64_t)[v70 connectionCountHint] > 1;

    if (v71)
    {
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      self->_extraConnectionCount = (unint64_t)[v72 connectionCountHint] - 1;

      if (self->_extraConnectionCount)
      {
        unint64_t v73 = 0LL;
        do
        {
          id v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
          id v75 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceUniqueID](self, "_acceptedDeviceUniqueID"));
          __int16 v76 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceToken](self, "_acceptedDeviceToken"));
          id v77 = (void *)objc_claimAutoreleasedReturnValue([v76 rawToken]);
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"-%d", v73));
          id v79 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:]( self,  "_socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:",  v91,  v75,  v77,  v78));
          uint64_t v81 = im_primary_queue(v79, v80);
          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
          v92[0] = _NSConcreteStackBlock;
          v92[1] = 3221225472LL;
          v92[2] = sub_10008EEEC;
          v92[3] = &unk_1008F8B80;
          int v93 = v73;
          v92[4] = self;
          [v74 openSocketWithOptions:v79 queue:v82 completionHandler:v92];

          ++v73;
        }

        while (self->_extraConnectionCount > v73);
      }
    }
  }
}

- (void)startQRSession
{
}

- (void)_broadcastSessionStartWithSocket:(int)a3
{
  if (a3 == -1) {
    xpc_object_t value = 0LL;
  }
  else {
    xpc_object_t value = xpc_fd_create(a3);
  }
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v4, "setShouldBoost:", 1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushTopic]);
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 broadcasterForTopic:v7 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v4]);

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v10 = v9;
  if (v9)
  {
    IMInsertBoolsToXPCDictionary(v9, "xpc-object");
    xpc_dictionary_set_value(v10, "object", value);
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", 1LL, 0LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);

    if (v13) {
      CFDictionarySetValue((CFMutableDictionaryRef)v11, @"sessionID", v13);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v11, @"object-type", @"session-device-socket");
    id v14 = -[NSMutableDictionary copy](v11, "copy");
    IMInsertKeyedCodableObjectsToXPCDictionary(v10, "object-context");

    objc_msgSend(v8, "sendXPCObject:", v10, v14, 0);
  }
}

- (BOOL)_shouldUseIPsecLink
{
  BOOL v2 = -[IDSDSession isWithDefaultPairedDevice](self, "isWithDefaultPairedDevice");
  if (v2)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    unsigned __int8 v4 = [v3 shouldUseIPsecLinkForDefaultPairedDevice];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (void)_sessionStartWithSocketDescriptor:(int)a3
{
  if (!self->_sessionStartedCalled)
  {
    self->_sessionStartedCalled = 1;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v6 = [v5 useBTDatagramPipe];

    if (-[IDSDSession _shouldUseIPsecLink](self, "_shouldUseIPsecLink") | v6) {
      unsigned int v7 = -1;
    }
    else {
      unsigned int v7 = a3;
    }
    if (self->_bypassUTun) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"YES";
      if (!self->_bypassUTun) {
        id v11 = @"NO";
      }
      *(_DWORD *)buf = 67109378;
      int v37 = v8;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "sessionStartWithSocketDescriptor socketDescriptor %d, bypassUtun: %@",  buf,  0x12u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
    {
      id v14 = self->_bypassUTun ? @"YES" : @"NO";
      uint64_t v33 = v8;
      id v34 = v14;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"sessionStartWithSocketDescriptor socketDescriptor %d, bypassUtun: %@");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        if (self->_bypassUTun) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        uint64_t v33 = v8;
        id v34 = (__CFString *)v15;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"sessionStartWithSocketDescriptor socketDescriptor %d, bypassUtun: %@");
      }
    }

    -[IDSDSession _broadcastSessionStartWithSocket:](self, "_broadcastSessionStartWithSocket:", v8, v33, v34);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v17 = [v16 sharedSession];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v18 setState:5];
    }

    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSDate);
    startDate = self->_startDate;
    self->_startDate = v19;

    -[IDSDSession submitAWDMetricsForIDSSessionConnected](self, "submitAWDMetricsForIDSSessionConnected");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v22 = [v21 isInternalInstall];

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if (([v23 useQRDirectly] & 1) == 0)
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        if ([v24 clientType] != (id)1)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          if ([v25 clientType] != (id)5)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            BOOL v32 = [v31 clientType] == (id)6;

            if (!v32) {
              return;
            }
            goto LABEL_31;
          }
        }
      }

LABEL_31:
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
      id v29 = [v26 getServerProviderForIDSSessionID:v28];

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10008F6BC;
      v35[3] = &unk_1008F8BA8;
      v35[4] = self;
      v35[5] = v29;
      IDSTransportThreadAddBlock(v35, v30);
    }
  }

- (void)checkAndCallSessionStart
{
  if (self->_extraConnectionCount)
  {
    BOOL v3 = self;
    objc_sync_enter(v3);
    BOOL v4 = (unint64_t)-[NSMutableDictionary count](v3->_extraConnections, "count") < self->_extraConnectionCount;
    objc_sync_exit(v3);
  }

  else
  {
    BOOL v4 = 0;
  }

  if (self->_socketDescriptor != -1 && !v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v5 clearAllTimers];

    -[IDSDSession _sessionStartWithSocketDescriptor:]( self,  "_sessionStartWithSocketDescriptor:",  self->_socketDescriptor);
  }

- (void)_setInitialLinkType:(unint64_t)a3
{
  if (a3 && !self->_initialLinkType)
  {
    self->_initialLinkType = a3;
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
      *(_DWORD *)buf = 67109378;
      int v28 = a3;
      __int16 v29 = 2112;
      uint64_t v30 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "set initial link type %d for session %@.",  buf,  0x12u);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
        _IDSLogTransport(@"IDSDSession", @"IDS", @"set initial link type %d for session %@.");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", a3, v25));
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"set initial link type %d for session %@.");
        }
      }
    }

    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v13, "setShouldBoost:", 1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pushTopic]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( [v14 broadcasterForTopic:v16 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v13]);

    xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v19 = v18;
    if (v18)
    {
      IMInsertBoolsToXPCDictionary(v18, "xpc-object");
      xpc_object_t v20 = xpc_int64_create(a3);
      xpc_dictionary_set_value(v19, "object", v20);

      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", 1LL, 0LL));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);

      if (v23) {
        CFDictionarySetValue((CFMutableDictionaryRef)v21, @"sessionID", v23);
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v21, @"object-type", @"session-initial-link-type");
      id v24 = -[NSMutableDictionary copy](v21, "copy");
      IMInsertKeyedCodableObjectsToXPCDictionary(v19, "object-context");

      objc_msgSend(v17, "sendXPCObject:", v19, v24, 0);
    }
  }

- (void)setAcceptedRelaySession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "received delayed QR connection %@ for an accepted session",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"received delayed QR connection %@ for an accepted session");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"received delayed QR connection %@ for an accepted session");
        }
      }
    }

    if (self->_skeData)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10008FE40;
      v16[3] = &unk_1008F8C10;
      objc_copyWeak(&v17, (id *)buf);
      v16[4] = self;
      IDSTransportThreadAddBlock(v16, v9);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 useSecureQRControlMessage]));

    if (v12)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v12);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100698778();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
    [v13 setAcceptedRelaySession:v15 relaySessionID:v4 options:Mutable];
  }
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
    [v7 setHasPendingAllocation:v4 forIDSSession:v6];
  }

  else
  {
    uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[IDSDSession setHasPendingAllocation:forIDSSession:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s IDSSessionID is nil!", buf, 0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"%s IDSSessionID is nil!");
      }
    }
  }
}

- (id)getCallerCert
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accountWithUniqueID:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _registrationCert]);

  return v7;
}

- (id)getFromService
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accountWithUniqueID:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 service]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  return v8;
}

- (id)getAppID
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushTopic]);

  return v3;
}

- (BOOL)shouldReportUPlusOneKey
{
  return self->_startedAsUPlusOneSession && !self->_switchedToUPlusMany;
}

- (unsigned)globalLinkErrorToSessionEndReason:(int64_t)a3
{
  else {
    return dword_1007173A8[a3];
  }
}

- (void)networkingIsAvailable:(id)a3
{
}

- (void)runConnectivityCheckWithCompletionBlock:(id)a3
{
  id v4 = a3;
  availabilityCheck = self->_availabilityCheck;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000903C0;
  v7[3] = &unk_1008F8C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[IDSDSessionAvailabilityCheck checkLocalConnectivityForSession:withCompletionBlock:]( availabilityCheck,  "checkLocalConnectivityForSession:withCompletionBlock:",  self,  v7);
}

- (void)startListeningOnClientSocket:(int)a3 isRawSocket:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", *(void *)&a3, a4));
  unsigned int v7 = [v6 isScreenSharingSession];

  if (v7)
  {
    if (self->_baseSocketPairConnection)
    {
      uint64_t v8 = OSLogHandleForIDSCategory("Warning");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        unsigned int v10 = -[IDSBaseSocketPairConnection socket](self->_baseSocketPairConnection, "socket");
        *(_DWORD *)buf = 136315394;
        dispatch_time_t v27 = "IDSDSession";
        __int16 v28 = 1024;
        unsigned int v29 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s - We're already listening on socket %d",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v11))
      {
        baseSocketPairConnection = self->_baseSocketPairConnection;
        p_baseSocketPairConnection = &self->_baseSocketPairConnection;
        id v24 = -[IDSBaseSocketPairConnection socket](baseSocketPairConnection, "socket");
        _IDSWarnV(@"IDSFoundation", @"%s - We're already listening on socket %d");
        id v25 = -[IDSBaseSocketPairConnection socket](*p_baseSocketPairConnection, "socket", "IDSDSession", v24);
        _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"%s - We're already listening on socket %d");
        -[IDSBaseSocketPairConnection socket](*p_baseSocketPairConnection, "socket", "IDSDSession", v25);
        _IDSLogTransport(@"Warning", @"IDS", @"%s - We're already listening on socket %d");
      }
    }

    else
    {
      uint64_t v14 = OSLogHandleForIDSCategory("IDSDSession");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Starting to listen on raw client socket %d",  buf,  8u);
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceName]);
      DLCSessionLogWithLevel(v17, @"IDSDSession", 0LL, 0LL, @"Starting to listen on raw client socket %d");

      xpc_object_t v18 = objc_alloc(&OBJC_CLASS___IDSBaseSocketPairConnection);
      uint64_t v20 = im_primary_queue(v18, v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      unsigned int v22 = -[IDSBaseSocketPairConnection initWithSocket:queue:delegate:]( v18,  "initWithSocket:queue:delegate:",  v4,  v21,  self,  v4);
      id v23 = self->_baseSocketPairConnection;
      self->_baseSocketPairConnection = v22;
    }
  }

  else if ((int)v4 >= 1)
  {
    close(v4);
  }

- (void)cleanupSessionWithCleanStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v115 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleanup session: %@", buf, 0xCu);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 serviceName]);
  DLCSessionLogWithLevel(v8, @"IDSDSession", 0LL, 0LL, @"Cleanup session: %@");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", self));
  LOBYTE(v8) = [v9 sharedSession];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v115 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "REPORT RTC: %@", buf, 0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceName]);
    DLCSessionLogWithLevel(v13, @"IDSDSession", 0LL, 0LL, @"REPORT RTC: %@");

    -[IDSDSession _reportRTC](self, "_reportRTC", self);
  }

  -[IDSDSession unregisterClientChannel](self, "unregisterClientChannel");
  uint64_t v14 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    clientChannel = self->_clientChannel;
    *(_DWORD *)buf = 134217984;
    uint64_t v115 = (IDSDSession *)clientChannel;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Releasing the client channel %p", buf, 0xCu);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      v108 = self->_clientChannel;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Releasing the client channel %p");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        v108 = self->_clientChannel;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Releasing the client channel %p");
      }
    }
  }

  -[IDSClientChannel invalidate](self->_clientChannel, "invalidate", v108);
  os_unfair_lock_lock(&self->_clientChannelLock);
  uint64_t v19 = self->_clientChannel;
  self->_clientChannel = 0LL;

  os_unfair_lock_unlock(&self->_clientChannelLock);
  uint64_t v20 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = @"NO";
    BOOL isLightweightParticipant = self->_isLightweightParticipant;
    if (v3) {
      id v24 = @"YES";
    }
    else {
      id v24 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v115 = self;
    __int16 v116 = 2112;
    if (isLightweightParticipant) {
      unsigned int v22 = @"YES";
    }
    uint64_t v117 = v24;
    __int16 v118 = 2112;
    uint64_t v119 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ cleanupSessionWithCleanStatus: shouldCleanStatus: %@, _isLightweightParticipant: %@",  buf,  0x20u);
  }

  uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
  if ((_DWORD)v26 && _IDSShouldLogTransport(v26))
  {
    dispatch_time_t v27 = v3 ? @"YES" : @"NO";
    __int16 v28 = self->_isLightweightParticipant ? @"YES" : @"NO";
    v111 = v27;
    uint64_t v112 = v28;
    uint64_t v109 = self;
    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@ cleanupSessionWithCleanStatus: shouldCleanStatus: %@, _isLightweightParticipant: %@");
    if (_IDSShouldLog(0LL, @"IDSDSession"))
    {
      if (self->_isLightweightParticipant) {
        unsigned int v29 = @"YES";
      }
      else {
        unsigned int v29 = @"NO";
      }
      v111 = v27;
      uint64_t v112 = (__CFString *)v29;
      uint64_t v109 = self;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@ cleanupSessionWithCleanStatus: shouldCleanStatus: %@, _isLightweightParticipant: %@");
    }
  }

  if (v3)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueID]);
    [v30 clearSharedSessionHasJoinedForIDSSession:v32];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 uniqueID]);
    [v33 clearIDSContextBlob:v35];

    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    LODWORD(v34) = [v36 isScreenSharingSession];

    int v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v38 = v37;
    if ((_DWORD)v34)
    {
      [v37 setState:8];

      -[IDSDSession _cleanupSessionConnection](self, "_cleanupSessionConnection");
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v39 clearAllTimers];

      -[IDSDSession _cleanupSocketPairConnection](self, "_cleanupSocketPairConnection");
      -[IDSDSession _notifyClientsSessionStopped](self, "_notifyClientsSessionStopped");
    }

    else
    {
      int v45 = [v37 sharedSession];

      if ((v45 & 1) != 0)
      {
        double v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 groupID]);
        [v46 resetKeyMaterialLocalSentStatus:v48];

        id v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue([v50 groupID]);
        [v49 unsubscribeEndpointsForGroup:v51];
      }

      else
      {
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 uniqueID]);
        -[IDSDSession _closeSocketToDevice:](self, "_closeSocketToDevice:", v53);

        -[IDSDSession _closeSocketToDevice:](self, "_closeSocketToDevice:", kIDSDefaultPairedDeviceID);
      }

      id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v109, v111, v112));
      unsigned int v55 = [v54 enableQuickRelay];

      if (v55)
      {
        -[IDSDSession _cleanupQuickRelaySession](self, "_cleanupQuickRelaySession");
      }

      else
      {
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
        __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        double v58 = (void *)objc_claimAutoreleasedReturnValue([v57 uniqueID]);
        [v56 stopUDPGlobalLinkForDevice:v58];
      }

      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v59 setState:8];
    }

    IDSTransportThreadAddBlock(&stru_1008F8C58, v40);
    if (self->_multiplexerEnabled)
    {
      id v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupSessionMultiplexer sharedInstance]( &OBJC_CLASS___IDSGroupSessionMultiplexer,  "sharedInstance"));
      [v60 unregisterMultiplexerTransport:self->_multiplexerTransport];

      multiplexerTransport = self->_multiplexerTransport;
      self->_multiplexerTransport = 0LL;
    }

    dataBlobEncryptionManager = self->_dataBlobEncryptionManager;
    self->_dataBlobEncryptionManager = 0LL;

    cryptorForBlobs = self->_cryptorForBlobs;
    self->_cryptorForBlobs = 0LL;

    typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
    self->_typeToKeyIDToEncryptedData = 0LL;

    typeToParticipantIDToDecryptedDataBlob = self->_typeToParticipantIDToDecryptedDataBlob;
    self->_typeToParticipantIDToDecryptedDataBlob = 0LL;

    keyIDToParticipantID = self->_keyIDToParticipantID;
    self->_keyIDToParticipantID = 0LL;

    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 localUnauthenticatedFullIdentity]);

    if (v68)
    {
      id v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v70 = (void *)objc_claimAutoreleasedReturnValue([v69 localUnauthenticatedFullIdentity]);
      BOOL v71 = (IDSDSession *)objc_claimAutoreleasedReturnValue([v70 description]);

      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v72 localUnauthenticatedFullIdentity]);
      id v113 = 0LL;
      unsigned int v74 = [v73 purgeFromKeychain:&v113];
      id v75 = (IDSDSession *)v113;

      if (v74)
      {
        uint64_t v76 = OSLogHandleForTransportCategory("IDSDSession");
        id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v115 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Deleted localUnauthenticatedFullIdentity from keychain {identity: %@}",  buf,  0xCu);
        }

        uint64_t v79 = os_log_shim_legacy_logging_enabled(v78);
        if ((_DWORD)v79)
        {
          if (_IDSShouldLogTransport(v79))
          {
            uint64_t v109 = v71;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Deleted localUnauthenticatedFullIdentity from keychain {identity: %@}");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v109 = v71;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Deleted localUnauthenticatedFullIdentity from keychain {identity: %@}");
            }
          }
        }
      }

      else
      {
        uint64_t v80 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v115 = v75;
          __int16 v116 = 2112;
          uint64_t v117 = (const __CFString *)v71;
          _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Failed to delete localUnauthenticatedFullIdentity from keychain {error: %@, identity: %@}",  buf,  0x16u);
        }

        uint64_t v83 = os_log_shim_legacy_logging_enabled(v82);
        if ((_DWORD)v83)
        {
          if (_IDSShouldLogTransport(v83))
          {
            uint64_t v109 = v75;
            v111 = (__CFString *)v71;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Failed to delete localUnauthenticatedFullIdentity from keychain {error: %@, identity: %@}");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v109 = v75;
              v111 = (__CFString *)v71;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Failed to delete localUnauthenticatedFullIdentity from keychain {error: %@, identity: %@}");
            }
          }
        }
      }

      char v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v109, v111));
      [v84 setLocalUnauthenticatedFullIdentity:0];

      BOOL v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v85 setRemoteUnauthenticatedPublicIdentity:0];
    }

    id v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v109));
    unsigned int v87 = [v86 sharedSession];

    if (v87)
    {
      unsigned int v88 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v89 = [v88 isInUPlusOneMode];

      if (v89)
      {
        uint64_t v90 = OSLogHandleForTransportCategory("IDSDSession");
        id v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          id v92 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          int v93 = (IDSDSession *)objc_claimAutoreleasedReturnValue([v92 groupID]);
          *(_DWORD *)buf = 138412290;
          uint64_t v115 = v93;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "reset keys for U + 1 session: %@",  buf,  0xCu);
        }

        uint64_t v95 = os_log_shim_legacy_logging_enabled(v94);
        if ((_DWORD)v95)
        {
          if (_IDSShouldLogTransport(v95))
          {
            __int16 v96 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            v110 = (void *)objc_claimAutoreleasedReturnValue([v96 groupID]);
            _IDSLogTransport(@"IDSDSession", @"IDS", @"reset keys for U + 1 session: %@");

            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              __int16 v97 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v110));
              v110 = (void *)objc_claimAutoreleasedReturnValue([v97 groupID]);
              _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"reset keys for U + 1 session: %@");
            }
          }
        }

        __int16 v98 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance",  v110));
        id v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 groupID]);
        [v98 resetKeysForGroup:v100 shouldRemoveCurrentParticipants:0];
      }

      uint64_t v101 = IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.ids",  @"SessionEncryptionKeyExpireDuration",  1200LL);
      double v102 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v104 = (void *)objc_claimAutoreleasedReturnValue([v103 groupID]);
      [v102 resetMKMCacheAfterTimeoutForGroup:v104 interval:v101];
    }

    if (_os_feature_enabled_impl("IDS", "PrioritizedActiveParticipants"))
    {
      BOOL v105 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDSessionActiveParticipantsCache sharedInstance]( &OBJC_CLASS___IDSDSessionActiveParticipantsCache,  "sharedInstance"));
      uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue([v106 uniqueID]);
      [v105 removeParticipantsForSessionID:v107];
    }
  }

  else
  {
    uint64_t v41 = OSLogHandleForTransportCategory("IDSDSession");
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v115 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%@ cleanupSessionWithCleanStatus: no need to clean session status",  buf,  0xCu);
    }

    uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
    if ((_DWORD)v44)
    {
      if (_IDSShouldLogTransport(v44))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"%@ cleanupSessionWithCleanStatus: no need to clean session status");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"%@ cleanupSessionWithCleanStatus: no need to clean session status");
        }
      }
    }
  }

- (void)_cleanupQuickRelaySession
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100091500;
  v6[3] = &unk_1008F8C80;
  void v6[4] = self;
  [v3 disconnectGlobalLinkForDevice:v5 isReinitiating:0 completionHandler:v6];
}

- (void)reconnectSession
{
  uint64_t v3 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reconnect initiated By TU", buf, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Reconnect initiated By TU");
    }
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v7 clearAllTimers];

  -[IDSDSession reinitiate](self, "reinitiate");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000917C4;
  v9[3] = &unk_1008F7948;
  void v9[4] = self;
  IDSTransportThreadAddBlock(v9, v8);
}

- (void)endSession
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  else {
    uint64_t v4 = 12LL;
  }

  -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", v4);
}

- (void)_sendSessionEndWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = _IDSSessionProtocolVersionNumber();
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageVersion, v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695F34();
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);

  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageSessionID, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695EB4();
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 participantID]);

  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageParticipantID, v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695E34();
  }

  if (v4) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageContext, v4);
  }
  uint64_t v12 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 destinations]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
    *(_DWORD *)buf = 138412802;
    BOOL v32 = v15;
    __int16 v33 = 2112;
    id v34 = v17;
    __int16 v35 = 2112;
    BOOL v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending END to %@, %@ <%@>", buf, 0x20u);
  }

  uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
  if ((_DWORD)v19)
  {
    if (_IDSShouldLogTransport(v19))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 destinations]);
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
      uint64_t v30 = v5;
      __int16 v28 = v21;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Sending END to %@, %@ <%@>");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v21, v29, v5));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 destinations]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
        uint64_t v30 = v5;
        __int16 v28 = v24;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Sending END to %@, %@ <%@>");
      }
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger", v28, v29, v30));
  dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 237LL));
  [v26 sendMessage:v5 withCommand:v27];
}

- (void)endSessionWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ending session with data", v13, 2u);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  DLCSessionLogWithLevel(v8, @"IDSDSession", 0LL, 0LL, @"Ending session with data");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v9 setState:8];

  -[IDSDSession _sendSessionEndWithData:](self, "_sendSessionEndWithData:", v4);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  LODWORD(v8) = [v10 isScreenSharingSession];

  if ((_DWORD)v8)
  {
    -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 11LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v11 clearAllTimers];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v12 setEndSessionTimeoutTimer];
  }
}

- (void)_endSession
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSDSession");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending session", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  DLCSessionLogWithLevel(v6, @"IDSDSession", 0LL, 0LL, @"Ending session");

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);

  if (v8)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceName]);
    uint64_t v12 = -[NSString initWithString:](v9, "initWithString:", v11);

    -[IDSDSession _resetPreferences:](self, "_resetPreferences:", v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"-"]);

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_1009469F0);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( self->_serviceIdentifier,  "substringFromIndex:",  [@"com.apple.private.alloy." length]));
  if (v17) {
    CFDictionarySetValue(Mutable, @"serviceName", v17);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
  if (v18) {
    CFDictionarySetValue(Mutable, @"sessionID", v18);
  }

  IDSPowerLogDictionary(@"IDSDSession", Mutable);
  -[IDSDSession unregisterClientChannel](self, "unregisterClientChannel");
  uint64_t v19 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    clientChannel = self->_clientChannel;
    *(_DWORD *)buf = 134217984;
    id v127 = clientChannel;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Releasing the client channel %p", buf, 0xCu);
  }

  uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
  if ((_DWORD)v23)
  {
    if (_IDSShouldLogTransport(v23))
    {
      uint64_t v109 = self->_clientChannel;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Releasing the client channel %p");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v109 = self->_clientChannel;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Releasing the client channel %p");
      }
    }
  }

  -[IDSClientChannel invalidate](self->_clientChannel, "invalidate", v109);
  os_unfair_lock_lock(&self->_clientChannelLock);
  id v24 = self->_clientChannel;
  self->_clientChannel = 0LL;

  os_unfair_lock_unlock(&self->_clientChannelLock);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v26 = [v25 isScreenSharingSession];

  if (v26)
  {
    dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 connection]);
    [v28 stopConnection:0];

    -[IDSDSession _cleanupSocketPairConnection](self, "_cleanupSocketPairConnection");
    -[IDSDSession _notifyClientsSessionStopped](self, "_notifyClientsSessionStopped");
    -[IDSDSession _cleanupQuickRelaySession](self, "_cleanupQuickRelaySession");
    goto LABEL_65;
  }

  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueID]);
  [v29 invalidateSession:v31 isExpiryPurging:0];

  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v32 sharedSession])
  {
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantID]( self->_groupStatusNotificationParams,  "participantID"));
    BOOL v34 = v33 == 0LL;

    if (!v34)
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v35 groupID]);

      if (!v36)
      {
        uint64_t v46 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Cannot fan out the endSession leave notification to the group, no groupID!",  buf,  2u);
        }

        uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
        if ((_DWORD)v49)
        {
          if (_IDSShouldLogTransport(v49))
          {
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Cannot fan out the endSession leave notification to the group, no groupID!");
            if (_IDSShouldLog(0LL, @"IDSDSession")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Cannot fan out the endSession leave notification to the group, no groupID!");
            }
          }
        }

        goto LABEL_49;
      }

      if (self->_groupSessionState > 1)
      {
        uint64_t v50 = OSLogHandleForTransportCategory("IDSDSession");
        unsigned int v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v53 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue([v52 groupID]);
          *(_DWORD *)buf = 138412290;
          id v127 = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Didn't fan out the leave notification, the group session %@ is already ended!",  buf,  0xCu);
        }

        uint64_t v55 = os_log_shim_legacy_logging_enabled(v54);
        if (!(_DWORD)v55) {
          goto LABEL_48;
        }
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        v110 = (IMMessageContext *)objc_claimAutoreleasedReturnValue([v56 groupID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Didn't fan out the leave notification, the group session %@ is already ended!");

        v120 = (NSError *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v110));
        __int16 v57 = (IMMessageContext *)objc_claimAutoreleasedReturnValue(-[NSError groupID](v120, "groupID"));
        v110 = v57;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Didn't fan out the leave notification, the group session %@ is already ended!");
      }

      else
      {
        uint64_t v37 = OSLogHandleForTransportCategory("IDSDSession");
        __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v40 = (IDSClientChannel *)objc_claimAutoreleasedReturnValue([v39 groupID]);
          *(_DWORD *)buf = 138412290;
          id v127 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "notifyLeaveToGroup and sessionDidLeaveGroup for group session %@",  buf,  0xCu);
        }

        uint64_t v42 = os_log_shim_legacy_logging_enabled(v41);
        if ((_DWORD)v42)
        {
          if (_IDSShouldLogTransport(v42))
          {
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            v110 = (IMMessageContext *)objc_claimAutoreleasedReturnValue([v43 groupID]);
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"notifyLeaveToGroup and sessionDidLeaveGroup for group session %@");

            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v110));
              v110 = (IMMessageContext *)objc_claimAutoreleasedReturnValue([v44 groupID]);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"notifyLeaveToGroup and sessionDidLeaveGroup for group session %@");
            }
          }
        }

        if (self->_startedAsUPlusOneSession && self->_reason == 45)
        {
          int v45 = objc_alloc(&OBJC_CLASS___NSError);
          v120 = -[NSError initWithDomain:code:userInfo:]( v45,  "initWithDomain:code:userInfo:",  IDSSessionErrorDomain,  45LL,  0LL);
        }

        else
        {
          v120 = 0LL;
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession groupStatusNotificationController]( self,  "groupStatusNotificationController",  v110));
        uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v113 = (void *)objc_claimAutoreleasedReturnValue([v119 groupID]);
        __int16 v118 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue([v118 destinations]);
        uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue([v117 allObjects]);
        groupStatusNotificationParams = self->_groupStatusNotificationParams;
        __int16 v116 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
        double v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 accountID]);
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v116 accountWithUniqueID:v59]);
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 fromURI]);
        id v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 uniqueID]);
        LOBYTE(v111) = -[IDSDSession shouldReportUPlusOneKey](self, "shouldReportUPlusOneKey");
        [v114 notifyLeaveToGroup:v113 members:v115 params:groupStatusNotificationParams fromAccount:v60 fromURI:v62 sessionID:v64 isUPlusOne:v111];

        __int16 v57 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
        -[IMMessageContext setShouldBoost:](v57, "setShouldBoost:", 1LL);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        BOOL v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v66 pushTopic]);
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( [v65 broadcasterForTopic:v67 entitlement:kIDSSessionEntitlement command:0 messageContext:v57]);

        id v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v70 = (void *)objc_claimAutoreleasedReturnValue([v69 uniqueID]);
        [v68 sessionDidLeaveGroup:v70 error:v120];

        if (v120) {
          self->_reason = -[IDSDSession globalLinkErrorToSessionEndReason:]( self,  "globalLinkErrorToSessionEndReason:",  -[NSError code](v120, "code"));
        }
        -[IDSDSession _reportRTC](self, "_reportRTC");
        self->_groupSessionState = 2;
      }

LABEL_48:
      BOOL v71 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance",  v110));
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v72 groupID]);
      [v71 removeAccountForGroup:v73];
    }
  }

  else
  {
  }

- (void)_resetPreferences:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_100946A08, @"PacketsPerSecond");
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_100946A08, @"InputBytesPerSecond");
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_100946A08, @"OutputBytesPerSecond");
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", @"Intent");
  uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Resetting preferences for service %{public}@",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v17 = v3;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Resetting preferences for service %{public}@");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v17 = v3;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Resetting preferences for service %{public}@");
      }
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLinkPreferencesManager sharedInstance]( &OBJC_CLASS___IDSLinkPreferencesManager,  "sharedInstance",  v17));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
  [v9 updateService:v3 withPreferences:v10];

  uint64_t v13 = im_primary_queue(v11, v12);
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009300C;
  block[3] = &unk_1008F6010;
  id v19 = v3;
  id v15 = v3;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v14, v16);
}

- (void)_closeSocketToDevice:(id)a3
{
  id v4 = a3;
  -[IDSDSession _checkAndUnassertRealTimeMode](self, "_checkAndUnassertRealTimeMode");
  if (self->_bypassUTun)
  {
    connectionContext = self->_connectionContext;
    self->_connectionContext = 0LL;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned __int8 v7 = [v6 useQRDirectly];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Closing socket for session", buf, 2u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceName]);
    DLCSessionLogWithLevel(v11, @"IDSDSession", 0LL, 0LL, @"Closing socket for session");

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceUniqueID](self, "_acceptedDeviceUniqueID"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceToken](self, "_acceptedDeviceToken"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rawToken]);
    dispatch_block_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:]( self,  "_socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:",  v4,  v13,  v15,  0LL));
    [v12 closeSocketWithOptions:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v18 = [v17 connectionCountHint];

    if ((unint64_t)v18 >= 2)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      self->_extraConnectionCount = (unint64_t)[v19 connectionCountHint] - 1;

      if (self->_extraConnectionCount)
      {
        unint64_t v20 = 0LL;
        do
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceUniqueID](self, "_acceptedDeviceUniqueID"));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _acceptedDeviceToken](self, "_acceptedDeviceToken"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 rawToken]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"-%d", v20));
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:]( self,  "_socketOptionsForDevice:uniqueID:pushToken:connectionSuffix:",  v4,  v22,  v24,  v25));
          [v21 closeSocketWithOptions:v26];

          ++v20;
        }

        while (self->_extraConnectionCount > v20);
      }
    }

    dispatch_time_t v27 = self;
    objc_sync_enter(v27);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v27->_extraConnections, "allValues"));
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v28));

    if (v27->_socketDescriptor != -1)
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v29 addObject:v30];

      v27->_int socketDescriptor = -1;
    }

    -[NSMutableDictionary removeAllObjects](v27->_extraConnections, "removeAllObjects");
    objc_sync_exit(v27);

    if ([v29 count])
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      _OWORD v32[2] = sub_1000933FC;
      v32[3] = &unk_1008F7948;
      id v33 = v29;
      IDSTransportThreadAddBlock(v32, v31);
    }
  }

  -[IDSDSession _notifyClientsSessionStopped](self, "_notifyClientsSessionStopped");
}

- (id)_socketOptionsForDevice:(id)a3 uniqueID:(id)a4 pushToken:(id)a5 connectionSuffix:(id)a6
{
  id value = a3;
  id v10 = a4;
  id v66 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 accountWithUniqueID:v14]);
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);

  dispatch_block_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v17 = (__CFDictionary *)v16;
  if (IDSOpenSocketOptionAccountDefault) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"account", IDSOpenSocketOptionAccountDefault);
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v68 identifier]);
  if (v18) {
    CFDictionarySetValue(v17, @"service", v18);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
  id v21 = v20;
  if (v11)
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v20 stringByAppendingString:v11]);

    id v21 = (void *)v22;
  }

  if (v21) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionStreamNameKey, v21);
  }

  if (value) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionCBUUIDKey, value);
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 remoteUseCloudPairedControlChannel]);

  if (v24 && v10) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionDeviceUniqueIDKey, v10);
  }
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  else {
    unsigned int v26 = &off_100946A38;
  }

  CFDictionarySetValue(v17, IDSOpenSocketOptionPriorityKey, v26);
  CFDictionarySetValue(v17, IDSOpenSocketOptionPhoneCallKey, &__kCFBooleanTrue);
  CFDictionarySetValue(v17, IDSOpenSocketOptionIsIDSDSessionSocket, &__kCFBooleanTrue);
  dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v28 = [v27 peerProtocolVersion];

  if (v28 >= 2) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionSRTPProtocolVersionKey, &off_100946930);
  }
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 localUnauthenticatedFullIdentity]);
  if (v30)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 remoteUnauthenticatedPublicIdentity]);

    if (v32)
    {
      id v33 = objc_alloc(&OBJC_CLASS___IDSUTunControlChannelIdentityPair);
      BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 localUnauthenticatedFullIdentity]);
      BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 remoteUnauthenticatedPublicIdentity]);
      __int16 v38 = -[IDSUTunControlChannelIdentityPair initWithLocalFullIdentity:remotePublicIdentity:]( v33,  "initWithLocalFullIdentity:remotePublicIdentity:",  v35,  v37);

      id v39 = v38;
      if (v39)
      {
        CFDictionarySetValue(v17, IDSOpenSocketOptionUnauthenticatedIdentityPair, v39);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006987F8();
      }
    }
  }

  else
  {
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v41 = [v40 transportType] == 0;

  if (v41) {
    CFDictionarySetValue(v17, @"protocol", @"udp");
  }
  if (!v10 && !-[IDSDSession isWithDefaultPairedDevice](self, "isWithDefaultPairedDevice"))
  {
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v43 = [v42 disableRemoteDeviceEncryption];

    if (v43)
    {
      uint64_t v73 = IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key;
      unsigned int v74 = &__kCFBooleanTrue;
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
      if (v44) {
        CFDictionarySetValue(v17, IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey, v44);
      }
    }

    else
    {
      int v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 destinations]);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v46 anyObject]);

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession getFromService](self, "getFromService"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 fromURI]);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 unprefixedURI]);
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v50 _bestGuessURI]);

      uint64_t v51 = objc_claimAutoreleasedReturnValue(-[IDSDSession getCallerCert](self, "getCallerCert"));
      uint64_t v52 = (void *)v51;
      if (v44 && v68 && v65 && v51)
      {
        v71[0] = IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey;
        id v53 = (void *)objc_claimAutoreleasedReturnValue([v44 prefixedURI]);
        v72[0] = v53;
        v72[1] = v47;
        v71[1] = IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey;
        v71[2] = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey;
        v71[3] = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey;
        v72[2] = v65;
        v72[3] = v52;
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  4LL));

        if (v54) {
          CFDictionarySetValue(v17, IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey, v54);
        }
      }
    }
  }

  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v56 = [v55 disableEncryption];

  if (v56) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionEncryptionMethodKey, &off_100946978);
  }
  connectionContext = self->_connectionContext;
  if (connectionContext) {
    CFDictionarySetValue(v17, @"connectionContext", connectionContext);
  }
  double v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v59 = [v58 useBTDatagramPipe];

  if (v59) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionRealTimeKey, &__kCFBooleanTrue);
  }
  uint64_t v60 = OSLogHandleForTransportCategory("IDSDSession");
  __int16 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v70 = v17;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Made options to open socket %@", buf, 0xCu);
  }

  uint64_t v63 = os_log_shim_legacy_logging_enabled(v62);
  if ((_DWORD)v63)
  {
    if (_IDSShouldLogTransport(v63))
    {
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Made options to open socket %@");
    }
  }

  return v17;
}

- (id)_acceptedDeviceUniqueID
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device unique ID in: %@", buf, 0xCu);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v18 = v7;
    while (2)
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v10), "pushToken", v18));
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
        }

        if (v11)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 rawToken]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceIDForPushToken:v14]);

          dispatch_block_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v25 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "    => Found unique ID: %@", buf, 0xCu);
          }

          if ([v15 length])
          {

            goto LABEL_21;
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "  => No unique ID found", buf, 2u);
  }

  id v15 = 0LL;
LABEL_21:

  return v15;
}

- (id)_acceptedDeviceToken
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
    *(_DWORD *)buf = 138412290;
    __int128 v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device token in: %@", buf, 0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v14 = v7;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "pushToken", v14));
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v14;
        __int128 v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
      }

      if (v11) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "  => No token found", buf, 2u);
    }

    id v11 = 0LL;
  }

  return v11;
}

- (void)_checkAndUnassertRealTimeMode
{
  if (self->_assertedRealTimeMode)
  {
    self->_assertedRealTimeMode = 0;
    IDSTransportThreadAddBlock(&stru_1008F8CA0, a2);
  }

- (void)_cleanupSocketPairConnection
{
  baseSocketPairConnection = self->_baseSocketPairConnection;
  self->_baseSocketPairConnection = 0LL;
}

- (void)_notifyClientsSessionStopped
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v4 = [v3 state];

  if (v4 != 8)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    unint64_t reason = self->_reason;
    if (qword_1009BE950 != -1) {
      dispatch_once(&qword_1009BE950, &stru_1008F91E0);
    }
    if ((unint64_t)[(id)qword_1009BE940 count] <= reason)
    {
      if (!byte_1009BE948)
      {
        id v11 = 0LL;
        goto LABEL_10;
      }

      throwsIDSAbortException();
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1009BE940 objectAtIndex:reason]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%d)",  v10,  reason));

LABEL_10:
    *(_DWORD *)buf = 138412546;
    unsigned int v43 = v8;
    __int16 v44 = 2112;
    int v45 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying client session %@ stopped with reason %@",  buf,  0x16u);

LABEL_11:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceName]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
    unint64_t v16 = self->_reason;
    if (qword_1009BE950 != -1) {
      dispatch_once(&qword_1009BE950, &stru_1008F91E0);
    }
    if ((unint64_t)[(id)qword_1009BE940 count] <= v16)
    {
      if (!byte_1009BE948)
      {
        __int128 v18 = 0LL;
LABEL_18:
        DLCSessionLogWithLevel( v13,  @"IDSDSession",  0LL,  0LL,  @"Notifying client session %@ stopped with reason %@");

        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946A50,  IDSDSessionReportQREventSubTypeKey,  v15,  v18);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_reason));
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v20,  IDSDSessionReportResultCodeKey);

        -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", Mutable);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        [v21 setState:8];

        if (self->_supressClientNotifications)
        {
          uint64_t v22 = OSLogHandleForIDSCategory("IDSDSession");
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Session stopped notification suppressed",  buf,  2u);
          }

          id v24 = (IMMessageContext *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[IMMessageContext serviceName](v24, "serviceName"));
          DLCSessionLogWithLevel(v25, @"IDSDSession", 0LL, 0LL, @"Session stopped notification suppressed");
LABEL_34:

          -[IDSDSessionAvailabilityCheck availabilityTimerCancel](self->_availabilityCheck, "availabilityTimerCancel");
          self->_shouldConnectToQRServer = 0;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_10009494C;
          v41[3] = &unk_1008F7948;
          v41[4] = self;
          IDSTransportThreadAddBlock(v41, v40);

          return;
        }

        id v24 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
        -[IMMessageContext setShouldBoost:](v24, "setShouldBoost:", 1LL);
        unsigned int v26 = objc_alloc(&OBJC_CLASS___NSDictionary);
        unint64_t v27 = self->_reason;
        if (qword_1009BE950 != -1) {
          dispatch_once(&qword_1009BE950, &stru_1008F91E0);
        }
        if ((unint64_t)[(id)qword_1009BE940 count] <= v27)
        {
          if (!byte_1009BE948)
          {
            unsigned int v29 = 0LL;
            goto LABEL_29;
          }

          throwsIDSAbortException();
        }

        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1009BE940 objectAtIndex:v27]);
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%d)",  v28,  v27));

LABEL_29:
        uint64_t v25 = -[NSDictionary initWithObjectsAndKeys:]( v26,  "initWithObjectsAndKeys:",  v29,  NSLocalizedDescriptionKey,  0LL);

        uint64_t v30 = objc_alloc(&OBJC_CLASS___NSError);
        uint64_t v31 = -[NSError initWithDomain:code:userInfo:]( v30,  "initWithDomain:code:userInfo:",  IDSSessionErrorDomain,  self->_reason,  v25);
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v33 pushTopic]);
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( [v32 broadcasterForTopic:v34 entitlement:kIDSSessionEntitlement command:0 messageContext:v24]);

        BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        LODWORD(v34) = [v36 sharedSession];

        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
        uint64_t v39 = self->_reason;
        if ((_DWORD)v34) {
          [v35 groupSessionEnded:v38 withReason:v39 error:v31];
        }
        else {
          [v35 sessionEnded:v38 withReason:v39 error:v31];
        }

        goto LABEL_34;
      }

      throwsIDSAbortException();
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1009BE940 objectAtIndex:v16]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%d)",  v17,  v16));

    goto LABEL_18;
  }

- (void)endSessionWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
  endDate = self->_endDate;
  self->_endDate = v6;

  os_unfair_lock_unlock(p_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v8 clearAllTimers];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v10 = [v9 isScreenSharingSession];

  if (v10) {
    -[IDSDSession submitAWDMetricsForIDSSessionWithEndReason:](self, "submitAWDMetricsForIDSSessionWithEndReason:", v3);
  }
  self->_unint64_t reason = v3;
  -[IDSDSession _endSession](self, "_endSession");
}

- (id)sessionDuration
{
  if (self->_startDate)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    endDate = self->_endDate;
    if (endDate) {
      uint64_t v5 = endDate;
    }
    else {
      uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    __int128 v7 = v5;
    os_unfair_lock_unlock(p_lock);
    -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", self->_startDate);
    double v6 = v8;
  }

  else
  {
    double v6 = 0.0;
  }

  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6);
}

- (id)connectDuration
{
  uint64_t v3 = self->_startDate;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startConnectingDate]);

  if (v5)
  {
    if (!v3) {
      uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 startConnectingDate]);
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", v7);
    double v9 = v8;
  }

  else
  {
    double v9 = 0.0;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));

  return v10;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v6 = [v5 isScreenSharingSession];

  if (v6)
  {
    uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = @"NO";
      if (v3) {
        double v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabling audio ? %@", buf, 0xCu);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 serviceName]);
    uint64_t v12 = (void *)v11;
    uint64_t v13 = @"NO";
    if (v3) {
      uint64_t v13 = @"YES";
    }
    uint64_t v25 = v13;
    DLCSessionLogWithLevel(v11, @"IDSDSession", 0LL, 0LL, @"Enabling audio ? %@");

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v25));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 connection]);
    [v15 setAudioEnabled:v3];

    unint64_t v16 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v16, "setShouldBoost:", 1LL);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pushTopic]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [v17 broadcasterForTopic:v19 entitlement:kIDSSessionEntitlement command:0 messageContext:v16]);

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 connection]);
    objc_msgSend(v20, "session:audioEnabled:", v22, objc_msgSend(v24, "getAudioEnabled"));
  }

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v6 = [v5 isScreenSharingSession];

  if (v6)
  {
    uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = @"NO";
      if (v3) {
        double v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Muting ? %@", buf, 0xCu);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 serviceName]);
    uint64_t v12 = (void *)v11;
    uint64_t v13 = @"NO";
    if (v3) {
      uint64_t v13 = @"YES";
    }
    uint64_t v25 = v13;
    DLCSessionLogWithLevel(v11, @"IDSDSession", 0LL, 0LL, @"Muting ? %@");

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v25));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 connection]);
    [v15 setMuted:v3];

    unint64_t v16 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v16, "setShouldBoost:", 1LL);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pushTopic]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [v17 broadcasterForTopic:v19 entitlement:kIDSSessionEntitlement command:0 messageContext:v16]);

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 connection]);
    objc_msgSend(v20, "session:muted:", v22, objc_msgSend(v24, "muted"));
  }

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting preferences %@", buf, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  DLCSessionLogWithLevel(v8, @"IDSDSession", 0LL, 0LL, @"Setting preferences %@");

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager", v4));
  [v9 setPreferences:v4];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RelayLinkProtocol]);
  if (v10) {
    -[IDSDSession _setLinkProtocol:](self, "_setLinkProtocol:", v10);
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionDisallowWifiInterfaceKey]);
  self->_disallowWifiInterface = [v11 BOOLValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionDisallowCellularInterfaceKey]);
  self->_disallowCellularInterface = [v12 BOOLValue];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionPreferCellularForCallSetupKey]);
  self->_preferCellularForCallSetup = [v13 BOOLValue];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionForceInternetInvitationKey]);
  id v15 = [v14 BOOLValue];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v16 setForceInternetInvitation:v15];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionClientUUIDKey]);
  if (v17)
  {
    __int128 v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v17);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v19 setClientUUID:v18];
  }
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v82 = a3;
  id v81 = a4;
  context = objc_autoreleasePoolPush();
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requiredCapabilities]);
  id v8 = [v7 count];

  id v9 = [v82 count];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 requiredCapabilities]);
  id v102 = 0LL;
  uint64_t v103 = 0LL;
  id v101 = 0LL;
  int v12 = sub_100095C1C(v11, v82, &v103, &v102, &v101);
  uint64_t v76 = v103;
  id v78 = v102;
  id v77 = v101;

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v13 setRequiredCapabilities:v82];
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 requiredLackOfCapabilities]);
  id v16 = [v15 count];

  id v17 = [v81 count];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 requiredLackOfCapabilities]);
  id v99 = 0LL;
  id v100 = 0LL;
  id v98 = 0LL;
  int v20 = sub_100095C1C(v19, v81, &v100, &v99, &v98);
  uint64_t v73 = v100;
  id v75 = v99;
  id v74 = v98;

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v21 setRequiredLackOfCapabilities:v81];
  }

  if (!v12)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    id v24 = 0LL;
    uint64_t v80 = 0LL;
    if (!v20) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v96 = 0LL;
  uint64_t v97 = 0LL;
  uint64_t v94 = 0LL;
  uint64_t v95 = 0LL;
  sub_100095E9C(v8 != 0LL, v9 != 0LL, v76, v78, v77, &v97, &v96, &v95, &v94);
  uint64_t v22 = v97;
  uint64_t v23 = v96;
  uint64_t v80 = v95;
  id v24 = v94;
  if (v20)
  {
LABEL_9:
    uint64_t v25 = v23;
    BOOL v92 = v22;
    uint64_t v93 = v23;
    uint64_t v90 = v80;
    id v91 = v24;
    sub_100095E9C(v16 != 0LL, v17 != 0LL, v73, v75, v74, &v93, &v92, &v91, &v90);
    uint64_t v23 = v93;

    unsigned int v26 = v92;
    unint64_t v27 = v91;

    unsigned int v28 = v90;
    uint64_t v22 = v26;
    id v24 = v27;
    uint64_t v80 = v28;
  }

- (void)setQuickRelayUserTypeForSession:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    int v9 = 138412546;
    unsigned int v10 = v7;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "setQuickRelayUserTypeForSession called for session: %@ with userType: %u",  (uint8_t *)&v9,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  -[IDSGroupStatusNotificationParameters setQuickRelayUserType:]( self->_groupStatusNotificationParams,  "setQuickRelayUserType:",  v8);
}

- (void)enableP2Plinks
{
  self->_disableP2PLinks = 0;
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    int v9 = 138412290;
    unsigned int v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "enableP2Plinks called for session: %@",  (uint8_t *)&v9,  0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  [v6 setAllowP2PforIDSSession:v8 isEnabled:1];
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceTCPFallbackOnWiFint i = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  [v5 setForceTCPFallbackOnWiFi:v7 forceTCPFallbackOnWiFi:v3];

  -[IDSDSession reconnectSession](self, "reconnectSession");
}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceTCPFallbackOnCell = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  [v5 setForceTCPFallbackOnCell:v7 forceTCPFallbackOnCell:v3];

  -[IDSDSession reconnectSession](self, "reconnectSession");
}

- (void)connection:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
    __int128 v14 = @"NO";
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    if (v6) {
      __int128 v14 = @"YES";
    }
    uint64_t v39 = v14;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ session did start %@ with error %@",  buf,  0x20u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceName]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 uniqueID]);
  __int128 v19 = (void *)v18;
  int v20 = @"NO";
  if (v6) {
    int v20 = @"YES";
  }
  __int16 v35 = v20;
  uint64_t v34 = v18;
  DLCSessionLogWithLevel(v16, @"IDSDSession", 0LL, 0LL, @"%@ session did start %@ with error %@");

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v34, v35, v9));
  [v21 clearAllTimers];

  if (v6)
  {
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v22, "setShouldBoost:", 1LL);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pushTopic]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( [v23 broadcasterForTopic:v25 entitlement:kIDSSessionEntitlement command:0 messageContext:v22]);

    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
    [v26 sessionStarted:v28];

    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v29 setState:5];

    BOOL v30 = objc_alloc_init(&OBJC_CLASS___NSDate);
    startDate = self->_startDate;
    self->_startDate = v30;
  }

  else
  {
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v33 = [v32 isScreenSharingSession];

    if (v33) {
      -[IDSDSession handleAVConferenceError:](self, "handleAVConferenceError:", v9);
    }
    -[IDSDSession _notifyClientsSessionStopped](self, "_notifyClientsSessionStopped");
  }

  -[IDSDSession submitAWDMetricsForIDSSessionConnected](self, "submitAWDMetricsForIDSSessionConnected");
}

- (void)connectionDidStop:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    *(_DWORD *)buf = 138412546;
    __int128 v19 = v11;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ session did stop with error %@", buf, 0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
      id v17 = v7;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"%@ session did stop with error %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v16, v7));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
        id v17 = v7;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"%@ session did stop with error %@");
      }
    }
  }

  if (v7) {
    -[IDSDSession handleAVConferenceError:](self, "handleAVConferenceError:", v7);
  }
  -[IDSDSession _cleanupSessionConnection](self, "_cleanupSessionConnection", v16, v17);
  -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 12LL);
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_baseSocketPairConnection) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v9 = [v8 encryptionInitialized];

  if (!v9)
  {
    id v15 = v7;
    goto LABEL_8;
  }

  uint64_t v10 = (uint64_t)[v7 length];
  if (v10 >= 1473)
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = 1472;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Data size is bigger than %d, ending call...",  buf,  8u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceName]);
    DLCSessionLogWithLevel(v14, @"IDSDSession", 0LL, 0LL, @"Data size is bigger than %d, ending call...");

    -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 19LL, 1472LL);
    goto LABEL_9;
  }

  size_t v16 = v10 - 4;
  if (v10 <= 4)
  {
    uint64_t v17 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Data size is too small, ending call...",  buf,  2u);
    }

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceName]);
    DLCSessionLogWithLevel(v20, @"IDSDSession", 0LL, 0LL, @"Data size is too small, ending call...");

    -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 19LL);
    goto LABEL_9;
  }

  id v7 = v7;
  id v21 = (unsigned __int16 *)[v7 bytes];
  unsigned int v22 = __rev16(*v21);
  if (v22 == 57344)
  {
    uint64_t v23 = v21;
    int v24 = *((unsigned __int8 *)v21 + 2);
    int v25 = *((unsigned __int8 *)v21 + 3);
    unsigned int v26 = (unsigned __int8 *)malloc(v16);
    if (v26)
    {
      unint64_t v27 = v26;
      memcpy(v26, v23 + 2, v16);
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v29 = v25 | (v24 << 8);
      id v30 = [v28 encryptionState];

      int v31 = sub_1001FD140((uint64_t)v30, v29, v27, v16, 0);
      if (v31)
      {
        int v32 = v31;
        if (v31 != 4)
        {
          uint64_t v33 = OSLogHandleForIDSCategory("IDSDSession");
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v52) = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Stream decryption transform error %d",  buf,  8u);
          }

          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 serviceName]);
          DLCSessionLogWithLevel(v36, @"IDSDSession", 0LL, 0LL, @"Stream decryption transform error %d");
        }

        free(v27);
        goto LABEL_9;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v27,  v16,  1LL));

      uint64_t v45 = OSLogHandleForIDSCategory("IDSDSession");
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v52 = [v15 hash];
        __int16 v53 = 2048;
        id v54 = [v15 length];
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Received data Viceroy -> Daemon  (after decrypt data hash: %lu)  (length: %lu)",  buf,  0x16u);
      }

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 serviceName]);
      id v49 = [v15 hash];
      id v50 = [v15 length];
      DLCSessionLogWithLevel( v48,  @"IDSDSession",  0LL,  0LL,  @"Received data Viceroy -> Daemon  (after decrypt data hash: %lu)  (length: %lu)");

LABEL_8:
      -[IDSBaseSocketPairConnection sendData:](self->_baseSocketPairConnection, "sendData:", v15, v49, v50);
      id v7 = v15;
      goto LABEL_9;
    }

    uint64_t v41 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Malloc error while decrypting, ending call...",  buf,  2u);
    }

    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 serviceName]);
    DLCSessionLogWithLevel(v44, @"IDSDSession", 0LL, 0LL, @"Malloc error while decrypting, ending call...");

    -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 19LL);
  }

  else
  {
    uint64_t v37 = OSLogHandleForIDSCategory("IDSDSession");
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Magic number doesn't match 0x%04x, ignoring...",  buf,  8u);
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 serviceName]);
    DLCSessionLogWithLevel(v40, @"IDSDSession", 0LL, 0LL, @"Magic number doesn't match 0x%04x, ignoring...");
  }

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("IDSDSession");
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 hash];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    *(_DWORD *)buf = 134218496;
    id v42 = v10;
    __int16 v43 = 1024;
    unsigned int v44 = [v11 seqSend];
    __int16 v45 = 2048;
    id v46 = [v7 length];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending data Daemon -> Viceroy  (before encrypt data hash: %lu seq: %u)  (length: %lu)",  buf,  0x1Cu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceName]);
  id v14 = [v7 hash];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v16 = [v15 seqSend];
  id v40 = [v7 length];
  DLCSessionLogWithLevel( v13,  @"IDSDSession",  0LL,  0LL,  @"Sending data Daemon -> Viceroy  (before encrypt data hash: %lu seq: %u)  (length: %lu)");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v14, v16, v40));
  LODWORD(v13) = [v17 encryptionInitialized];

  if (!(_DWORD)v13) {
    goto LABEL_15;
  }
  uint64_t v18 = (char *)[v7 length];
  __int128 v19 = v18 + 4;
  __int16 v20 = malloc((size_t)(v18 + 4));
  if (v20)
  {
    id v21 = v20;
    id v7 = v7;
    memcpy(v21 + 4, [v7 bytes], (size_t)v18);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v23 = [v22 encryptionState];

    int v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v25 = sub_1001FD140((uint64_t)v23, (unsigned __int16)[v24 seqSend], v21 + 4, (signed int)v18, 1);

    if ((_DWORD)v25)
    {
      if ((_DWORD)v25 != 4)
      {
        uint64_t v26 = OSLogHandleForIDSCategory("IDSDSession");
        unint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Stream encryption transform error %d",  buf,  8u);
        }

        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceName]);
        DLCSessionLogWithLevel(v29, @"IDSDSession", 0LL, 0LL, @"Stream encryption transform error %d");

        -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 18LL, v25);
      }

      free(v21);
      goto LABEL_16;
    }

    *(_WORD *)id v21 = 224;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int16 v35 = (unsigned __int16)[v34 seqSend];

    v21[2] = HIBYTE(v35);
    v21[3] = v35;
    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v21,  v19,  1LL));

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    objc_msgSend(v37, "setSeqSend:", objc_msgSend(v37, "seqSend") + 1);

    id v7 = (id)v36;
LABEL_15:
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 connection]);
    [v39 sendData:v7];

    goto LABEL_16;
  }

  uint64_t v30 = OSLogHandleForIDSCategory("IDSDSession");
  int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Malloc error while encrypting, ending call...",  buf,  2u);
  }

  int v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceName]);
  DLCSessionLogWithLevel(v33, @"IDSDSession", 0LL, 0LL, @"Malloc error while encrypting, ending call...");

  -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 18LL);
LABEL_16:
}

- (void)_setLinkProtocol:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  self->_linkProtocol = 2LL;
  if (v4)
  {
    id v6 = (const char *)[v4 UTF8String];
    if (strncasecmp(v6, "tcp", 3uLL) || !strncasecmp(v6, "tcpssl", 6uLL))
    {
      if (!strncasecmp(v6, "tcpssl", 6uLL) && sub_10009797C((uint64_t)(v6 + 6), &self->_relayPort))
      {
        uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int relayPort = self->_relayPort;
          *(_DWORD *)buf = 67109120;
          int v20 = relayPort;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "use TCPSSL for QR, port: %u", buf, 8u);
        }

        uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
        if (!(_DWORD)v11 || !_IDSShouldLogTransport(v11))
        {
          int64_t v12 = 4LL;
          goto LABEL_22;
        }

        _IDSLogTransport(@"IDSDSession", @"IDS", @"use TCPSSL for QR, port: %u");
        int64_t v12 = 4LL;
        if ((_IDSShouldLog(0LL, @"IDSDSession") & 1) != 0)
        {
          uint64_t v13 = @"use TCPSSL for QR, port: %u";
LABEL_19:
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", v13);
        }

- (void)addQREventForRTCReport:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097C40;
  block[3] = &unk_1008F5F80;
  void block[4] = self;
  id v8 = v4;
  id v17 = v8;
  dispatch_async(v7, block);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IDSDSessionReportQREventSubTypeKey]);
  unsigned int v10 = [v9 unsignedIntValue];

  BOOL v11 = v10 - 312 > 0x15 || ((1 << (v10 - 56)) & 0x380003) == 0;
  if (!v11 || (v10 - 202 <= 0x14 ? (BOOL v12 = ((1 << (v10 + 54)) & 0x101081) == 0) : (BOOL v12 = 1), !v12 || v10 - 402 < 2))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100097DB4;
    v14[3] = &unk_1008F8800;
    v14[4] = self;
    id v15 = v8;
    IDSTransportThreadAddBlock(v14, v13);
  }
}

- (void)_sendQREventToAVC:(id)a3
{
  id v4 = a3;
  id v20 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  0LL,  &v20));
  id v6 = v20;
  if (v6)
  {
    uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupID]);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&_BYTE buf[24] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> _sendQREventToAVC failed to encode qrEvent for group %@ (error: %@)",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v11) && _IDSShouldLog(0LL, @"IDSDSession"))
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> _sendQREventToAVC failed to encode qrEvent for group %@ (error: %@)");
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> _sendQREventToAVC: %@", buf, 0x16u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> _sendQREventToAVC: %@");
      }
    }

    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&uint8_t buf[16] = v17;
    IDSByteBufferInitForWrite(buf);
    id v18 = v5;
    IDSByteBufferWriteField(buf, 73, [v18 bytes], (unsigned __int16)objc_msgSend(v18, "length"));
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("IDSDSession");
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didDisconnectForDeviceUniqueID:%@ cbuuid:%@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didDisconnectForDeviceUniqueID:%@ cbuuid:%@");
  }
}

- (void)link:(id)a3 didReceiveSKEData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = [v7 length];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveSKEData %d bytes.",  buf,  0x1Cu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      id v24 = v6;
      id v25 = [v7 length];
      id v23 = self;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"<%@> link:%@ didReceiveSKEData %d bytes.");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v12 = objc_msgSend(v7, "length", self, v6, v25);
        id v24 = v6;
        id v25 = v12;
        id v23 = self;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didReceiveSKEData %d bytes.");
      }
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v23, v24, v25));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v14 clientType] == (id)1)
  {
LABEL_11:

LABEL_12:
LABEL_13:
    unsigned __int8 v26 = [v7 length];
    unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&uint8_t buf[16] = v16;
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 10LL, &v26, 1LL);
    id v17 = [v7 bytes];
    IDSByteBufferWriteField(buf, 11LL, v17, v26);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_14;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v15 clientType] == (id)5)
  {

    goto LABEL_11;
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v19 = [v18 clientType] == (id)6;

  if (v19) {
    goto LABEL_13;
  }
  uint64_t v20 = OSLogHandleForIDSCategory("IDSDSession");
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_PreConnectionDataKey",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_PreConnectionDataKey");
  }
LABEL_14:
}

- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (IDSDSession *)a5;
  id v13 = a6;
  uint64_t v14 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v54 = self;
    __int16 v55 = 2112;
    id v56 = v10;
    __int16 v57 = 2112;
    double v58 = v12;
    __int16 v59 = 2112;
    id v60 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@",  buf,  0x2Au);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      __int16 v45 = v12;
      id v46 = v13;
      __int16 v43 = self;
      id v44 = v10;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        __int16 v45 = v12;
        id v46 = v13;
        __int16 v43 = self;
        id v44 = v10;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@");
      }
    }
  }

  if (IMGetDomainBoolForKey(@"com.apple.ids", @"DisableQRMaterialMessage"))
  {
    uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v54 = self;
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      double v58 = v12;
      __int16 v59 = 2112;
      id v60 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@: ignoring because disableQRMaterialMessage is set",  buf,  0x2Au);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@: ignoring because disableQRMaterialMessage is set");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@: ignoring because disableQRMaterialMessage is set");
        }
      }
    }

    goto LABEL_38;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v22 useQRDirectly] & 1) == 0)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v23 clientType] != (id)1)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v24 clientType] != (id)5)
      {
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v42 = [v41 clientType] == (id)6;

        if (!v42) {
          goto LABEL_38;
        }
        goto LABEL_20;
      }
    }
  }

LABEL_20:
  id v25 = (IDSDSession *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokensFromParticipantIDArray:useNullPlaceholder:]( self,  "_getPushTokensFromParticipantIDArray:useNullPlaceholder:",  v12,  0LL,  v43,  v44,  v45,  v46));
  if (-[IDSDSession count](v25, "count"))
  {
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession firstObject](v12, "firstObject"));
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v26));
    unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v27));

    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v13));
    uint64_t v30 = (IDSDSession *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v29));

    if (v28 && v30)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      int v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100098BF0;
      block[3] = &unk_1008F8D18;
      id v48 = v11;
      id v49 = self;
      id v50 = v28;
      uint64_t v51 = v30;
      id v52 = v25;
      dispatch_async(v32, block);
    }

    else
    {
      uint64_t v37 = OSLogHandleForTransportCategory("IDSDSession");
      __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v54 = v25;
        __int16 v55 = 2112;
        id v56 = v28;
        __int16 v57 = 2112;
        double v58 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Could not process remote key material message from tokens %@ fromURI %@ toURI %@ (invalid)",  buf,  0x20u);
      }

      uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
      if ((_DWORD)v40)
      {
        if (_IDSShouldLogTransport(v40))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Could not process remote key material message from tokens %@ fromURI %@ toURI %@ (invalid)");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Could not process remote key material message from tokens %@ fromURI %@ toURI %@ (invalid)");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v33 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "didReceiveKeyMaterialMessageData couldn't find push tokens for participantIDs %@",  buf,  0xCu);
    }

    uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
    if ((_DWORD)v36)
    {
      if (_IDSShouldLogTransport(v36))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveKeyMaterialMessageData couldn't find push tokens for participantIDs %@");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveKeyMaterialMessageData couldn't find push tokens for participantIDs %@");
        }
      }
    }
  }

LABEL_38:
}

- (BOOL)shouldVerifySignatureForMaterialType:(int)a3
{
  return a3 != 6 && a3 != 12;
}

- (void)materialInfoError:(id)a3
{
  metricsCollector = self->_metricsCollector;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector error:](metricsCollector, "error:", @"m"));
  [v5 event:v4];
}

- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isServerMaterialExchangeEnabled)
  {
    if ([v9 materialType] == 12 || objc_msgSend(v9, "materialType") == 6)
    {
      uint64_t v11 = OSLogHandleForTransportCategory("IDSDSession");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v212) = [v9 materialType];
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo type: %d, ignoring (handled separately)",  buf,  8u);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          id v157 = [v9 materialType];
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo type: %d, ignoring (handled separately)");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            objc_msgSend(v9, "materialType", v157);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo type: %d, ignoring (handled separately)");
          }
        }
      }

      goto LABEL_89;
    }

    uint64_t v19 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v212 = (id *)v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo received material info: %@",  buf,  0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        id v156 = v9;
        _IDSLogTransport(@"IDSDSession", @"IDS", @"didReceiveMaterialInfo received material info: %@");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v156 = v9;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo received material info: %@");
        }
      }
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "materialContent", v156));
    uint64_t v24 = ((uint64_t (*)(void))JWDecodeDictionary)();
    BOOL v190 = (id *)objc_claimAutoreleasedReturnValue(v24);

    if (!v190)
    {
      uint64_t v36 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v38 = (id *)objc_claimAutoreleasedReturnValue([v9 materialContent]);
        *(_DWORD *)buf = 138412290;
        __int16 v212 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not decode content. Data: %@",  buf,  0xCu);
      }

      uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
      if ((_DWORD)v40)
      {
        if (_IDSShouldLogTransport(v40))
        {
          uint64_t v158 = (id *)objc_claimAutoreleasedReturnValue([v9 materialContent]);
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not decode content. Data: %@");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v158 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "materialContent", v158));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not decode content. Data: %@");
          }
        }
      }

      -[IDSDSession materialInfoError:](self, "materialInfoError:", @"couldNotDecodeContent", v158);
      goto LABEL_88;
    }

    uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
    unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v212 = v190;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo received material info content: %@",  buf,  0xCu);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        uint64_t v158 = v190;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo received material info content: %@");
        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v158 = v190;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo received material info content: %@");
        }
      }
    }

    unsigned int v187 = -[IDSDSession shouldVerifySignatureForMaterialType:]( self,  "shouldVerifySignatureForMaterialType:",  objc_msgSend(v9, "materialType", v158));
    if (v187)
    {
      unsigned int v189 = (void *)objc_claimAutoreleasedReturnValue([v190 objectForKeyedSubscript:@"payload"]);
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData, v29);
      if ((objc_opt_isKindOfClass(v189, v30) & 1) == 0)
      {
        uint64_t v74 = OSLogHandleForTransportCategory("IDSDSession");
        id v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v212 = v190;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not read data from payload. Content: %@",  buf,  0xCu);
        }

        uint64_t v77 = os_log_shim_legacy_logging_enabled(v76);
        if ((_DWORD)v77)
        {
          if (_IDSShouldLogTransport(v77))
          {
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not read data from payload. Content: %@");
            if (_IDSShouldLog(0LL, @"IDSDSession")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not read data from payload. Content: %@");
            }
          }
        }

        goto LABEL_87;
      }

      uint64_t v31 = JWDecodeDictionary(v189);
      uint64_t v186 = (id *)objc_claimAutoreleasedReturnValue(v31);
      if (!v186)
      {
        uint64_t v32 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v212 = v190;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not decode payload. Content: %@",  buf,  0xCu);
        }

        uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
        if ((_DWORD)v35)
        {
          if (_IDSShouldLogTransport(v35))
          {
            uint64_t v159 = v190;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not decode payload. Content: %@");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v159 = v190;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not decode payload. Content: %@");
            }
          }
        }

        -[IDSDSession materialInfoError:](self, "materialInfoError:", @"couldNotDecodePayload", v159);
LABEL_87:

LABEL_88:
        goto LABEL_89;
      }
    }

    else
    {
      uint64_t v186 = v190;
      unsigned int v189 = 0LL;
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 ownerParticipantId]));
    BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v41));
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 serviceName]);
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v42,  v44));

    id v46 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokenFromParticipantID:]( self,  "_getPushTokenFromParticipantID:",  [v10 ownerParticipantId]));
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 serviceName]);
    id v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v46,  v48));

    if (!v45)
    {
      uint64_t v50 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        id v52 = (id *)[v10 ownerParticipantId];
        participantIDToURI = self->_participantIDToURI;
        *(_DWORD *)buf = 134218242;
        __int16 v212 = v52;
        __int16 v213 = 2112;
        uint64_t v214 = participantIDToURI;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo: did not find mapping from participantID %llu to URI in allocator; trying cache: %@",
          buf,
          0x16u);
      }

      uint64_t v55 = os_log_shim_legacy_logging_enabled(v54);
      if ((_DWORD)v55)
      {
        if (_IDSShouldLogTransport(v55))
        {
          uint64_t v159 = (id *)[v10 ownerParticipantId];
          uint64_t v162 = self->_participantIDToURI;
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo: did not find mapping from participantID %llu to URI in allocator; trying cache: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v159 = (id *)objc_msgSend(v10, "ownerParticipantId", v159, v162);
            uint64_t v162 = self->_participantIDToURI;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo: did not find mapping from participantID %llu to URI in allocator; trying cache: %@");
          }
        }
      }

      os_unfair_lock_lock(&self->_lock);
      id v56 = self->_participantIDToURI;
      __int16 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 ownerParticipantId]));
      __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v57));

      os_unfair_lock_unlock(&self->_lock);
    }

    if (!v49)
    {
      uint64_t v58 = OSLogHandleForTransportCategory("IDSDSession");
      __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        id v60 = (id *)[v10 ownerParticipantId];
        participantIDToPushToken = self->_participantIDToPushToken;
        *(_DWORD *)buf = 134218242;
        __int16 v212 = v60;
        __int16 v213 = 2112;
        uint64_t v214 = participantIDToPushToken;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo: did not find mapping from participantID %llu to push token in allocator; trying cache: %@",
          buf,
          0x16u);
      }

      uint64_t v63 = os_log_shim_legacy_logging_enabled(v62);
      if ((_DWORD)v63)
      {
        if (_IDSShouldLogTransport(v63))
        {
          uint64_t v159 = (id *)[v10 ownerParticipantId];
          uint64_t v162 = self->_participantIDToPushToken;
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo: did not find mapping from participantID %llu to push token in allocator; trying cache: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v159 = (id *)objc_msgSend(v10, "ownerParticipantId", v159, v162);
            uint64_t v162 = self->_participantIDToPushToken;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo: did not find mapping from participantID %llu to push token in allocator; trying cache: %@");
          }
        }
      }

      os_unfair_lock_lock(&self->_lock);
      uint64_t v64 = self->_participantIDToPushToken;
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 ownerParticipantId]));
      id v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v64, "objectForKeyedSubscript:", v65));

      os_unfair_lock_unlock(&self->_lock);
    }

    if (v45)
    {
      if (v49
        && (id v66 = (void *)objc_claimAutoreleasedReturnValue([v49 rawToken]),
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
            unsigned int v68 = [v66 isEqual:v67],
            v67,
            v66,
            !v68))
      {
        if (sub_1003CC744(v45))
        {
          uint64_t v83 = OSLogHandleForTransportCategory("IDSDSession");
          id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo dropping material info because it came from blocked URI",  buf,  2u);
          }

          uint64_t v86 = os_log_shim_legacy_logging_enabled(v85);
          if ((_DWORD)v86)
          {
            if (_IDSShouldLogTransport(v86))
            {
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo dropping material info because it came from blocked URI");
              if (_IDSShouldLog(0LL, @"IDSDSession")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo dropping material info because it came from blocked URI");
              }
            }
          }
        }

        else if ([v10 ownerParticipantId])
        {
          uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue([v45 URIByAddingOptionalPushToken:v49]);
          if (-[IDSDSession destinationsContainFromURI:](self, "destinationsContainFromURI:", v185)
            || -[IDSDSession destinationsContainFromURI:](self, "destinationsContainFromURI:", v45))
          {
            if (objc_msgSend(v9, "materialType", v159, v162) == 13)
            {
              metricsCollector = self->_metricsCollector;
              BOOL v88 = (void *)objc_claimAutoreleasedReturnValue([v49 rawToken]);
              -[IDSGFTMetricsCollector receivedUnverifiedKMOverQUICFromToken:]( metricsCollector,  "receivedUnverifiedKMOverQUICFromToken:",  v88);
            }

            v197[0] = _NSConcreteStackBlock;
            v197[1] = 3221225472LL;
            v197[2] = sub_10009B4D0;
            v197[3] = &unk_1008F8D68;
            id v198 = v9;
            uint64_t v199 = self;
            id v200 = v10;
            uint64_t v174 = v186;
            uint64_t v201 = v174;
            id v171 = v49;
            id v202 = v171;
            id v170 = v45;
            id v203 = v170;
            v182 = objc_retainBlock(v197);
            if (v187)
            {
              id v177 = (void *)objc_claimAutoreleasedReturnValue([v190 objectForKey:@"signature"]);
              uint64_t v90 = objc_opt_class(&OBJC_CLASS___NSString, v89);
              if ((objc_opt_isKindOfClass(v177, v90) & 1) != 0)
              {
                id v91 = (void *)objc_claimAutoreleasedReturnValue([v190 objectForKey:@"signature"]);
                v188 = (id *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v91));
              }

              else
              {
                id v91 = (void *)objc_claimAutoreleasedReturnValue([v190 objectForKey:@"signature"]);
                uint64_t v129 = objc_opt_class(&OBJC_CLASS___NSData, v128);
                if ((objc_opt_isKindOfClass(v91, v129) & 1) != 0) {
                  v188 = (id *)objc_claimAutoreleasedReturnValue([v190 objectForKey:@"signature"]);
                }
                else {
                  v188 = 0LL;
                }
              }

              if (v188)
              {
                uint64_t v131 = objc_opt_class(&OBJC_CLASS___NSString, v130);
                id v132 = sub_10009C9FC(v131, v190, @"sessionID");
                uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue(v132);
                uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                id v134 = (void *)objc_claimAutoreleasedReturnValue([v133 uniqueID]);
                unsigned __int8 v135 = [v181 isEqual:v134];

                if ((v135 & 1) != 0)
                {
                  id v136 = (void *)objc_claimAutoreleasedReturnValue([v181 dataUsingEncoding:4]);
                  unint64_t v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v136));

                  [v169 appendData:v189];
                  uint64_t v137 = OSLogHandleForTransportCategory("IDSDSession");
                  v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
                  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    __int16 v212 = v188;
                    __int16 v213 = 2112;
                    uint64_t v214 = v174;
                    _os_log_impl( (void *)&_mh_execute_header,  v138,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo verifying signature: %@ matchesPayload: %@",  buf,  0x16u);
                  }

                  uint64_t v140 = os_log_shim_legacy_logging_enabled(v139);
                  if ((_DWORD)v140)
                  {
                    if (_IDSShouldLogTransport(v140))
                    {
                      v160 = v188;
                      uint64_t v163 = v174;
                      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo verifying signature: %@ matchesPayload: %@");
                      if (_IDSShouldLog(0LL, @"IDSDSession"))
                      {
                        v160 = v188;
                        uint64_t v163 = v174;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo verifying signature: %@ matchesPayload: %@");
                      }
                    }
                  }

                  uint64_t v141 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance",  v160,  v163));
                  uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession getCallerCert](self, "getCallerCert"));
                  uint64_t v173 = (void *)objc_claimAutoreleasedReturnValue([v171 rawToken]);
                  v142 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession getFromService](self, "getFromService"));
                  uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession fromURI](self, "fromURI"));
                  v193[0] = _NSConcreteStackBlock;
                  v193[1] = 3221225472LL;
                  v193[2] = sub_10009CAA4;
                  v193[3] = &unk_1008F8DB8;
                  uint64_t v194 = v188;
                  uint64_t v195 = v174;
                  v196 = v182;
                  LOBYTE(v167) = 0;
                  [v141 publicKeyVerifySignedData:v194 matchesData:v169 forSignatureType:0 identity:v168 forURI:v170 pushToken:v173 service:v142 localURI:v143 pr iority:300 completion:v193 avoidMainQueue:v167];
                }

                else
                {
                  uint64_t v148 = OSLogHandleForTransportCategory("IDSDSession");
                  uint64_t v149 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                    v151 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v150 uniqueID]);
                    *(_DWORD *)buf = 138412546;
                    __int16 v212 = (id *)v181;
                    __int16 v213 = 2112;
                    uint64_t v214 = v151;
                    _os_log_impl( (void *)&_mh_execute_header,  v149,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo ignoring material info; sessionID %@ does not match our sessionID %@",
                      buf,
                      0x16u);
                  }

                  uint64_t v153 = os_log_shim_legacy_logging_enabled(v152);
                  if ((_DWORD)v153)
                  {
                    if (_IDSShouldLogTransport(v153))
                    {
                      v154 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                      v160 = (id *)v181;
                      uint64_t v163 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v154 uniqueID]);
                      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo ignoring material info; sessionID %@ does not match our sessionID %@");

                      if (_IDSShouldLog(0LL, @"IDSDSession"))
                      {
                        v155 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v181, v163));
                        v160 = (id *)v181;
                        uint64_t v163 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v155 uniqueID]);
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo ignoring material info; sessionID %@ does not match our sessionID %@");
                      }
                    }
                  }

                  -[IDSDSession materialInfoError:](self, "materialInfoError:", @"sessionIDMismatch", v160, v163);
                }
              }

              else
              {
                uint64_t v144 = OSLogHandleForTransportCategory("IDSDSession");
                uint64_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
                if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v212 = v190;
                  _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo did not receive signature: %@",  buf,  0xCu);
                }

                uint64_t v147 = os_log_shim_legacy_logging_enabled(v146);
                if ((_DWORD)v147)
                {
                  if (_IDSShouldLogTransport(v147))
                  {
                    v160 = v190;
                    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo did not receive signature: %@");
                    if (_IDSShouldLog(0LL, @"IDSDSession"))
                    {
                      v160 = v190;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo did not receive signature: %@");
                    }
                  }
                }

                -[IDSDSession materialInfoError:](self, "materialInfoError:", @"missingSignature", v160);
              }

              uint64_t v103 = v188;
            }

            else
            {
              uint64_t v96 = OSLogHandleForTransportCategory("IDSDSession");
              uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo not verifying signature",  buf,  2u);
              }

              uint64_t v99 = os_log_shim_legacy_logging_enabled(v98);
              if ((_DWORD)v99)
              {
                uint64_t v99 = _IDSShouldLogTransport(v99);
                if ((_DWORD)v99)
                {
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo not verifying signature");
                  uint64_t v99 = _IDSShouldLog(0LL, @"IDSDSession");
                  if ((_DWORD)v99) {
                    uint64_t v99 = _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo not verifying signature");
                  }
                }
              }

              uint64_t v101 = im_primary_queue(v99, v100);
              id v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
              v191[0] = _NSConcreteStackBlock;
              v191[1] = 3221225472LL;
              v191[2] = sub_10009CCE4;
              v191[3] = &unk_1008F6330;
              unsigned int v192 = v182;
              sub_100076748(v102, QOS_CLASS_USER_INTERACTIVE, v191);

              uint64_t v103 = v192;
            }
          }

          else
          {
            pendingMaterialInfoByFromID = self->_pendingMaterialInfoByFromID;
            if (!pendingMaterialInfoByFromID)
            {
              CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              __int16 v106 = self->_pendingMaterialInfoByFromID;
              self->_pendingMaterialInfoByFromID = Mutable;

              pendingMaterialInfoByFromID = self->_pendingMaterialInfoByFromID;
            }

            uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingMaterialInfoByFromID,  "objectForKeyedSubscript:",  v45,  v159,  v162));
            BOOL v108 = v107 == 0LL;

            if (v108)
            {
              uint64_t v109 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingMaterialInfoByFromID,  "setObject:forKeyedSubscript:",  v109,  v45);
            }

            id location = (id)0xAAAAAAAAAAAAAAAALL;
            objc_initWeak(&location, self);
            double v110 = sub_1000766FC();
            unsigned int v111 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMaterialInfoByFromID,  "objectForKeyedSubscript:",  v45));
            v204[0] = _NSConcreteStackBlock;
            v204[1] = 3221225472LL;
            v204[2] = sub_10009B01C;
            v204[3] = &unk_1008F8D40;
            id v183 = v10;
            id v205 = v183;
            __int16 v206 = self;
            *(double *)&v209[1] = v110 + 60.0;
            objc_copyWeak(v209, &location);
            id v207 = v8;
            id v208 = v9;
            uint64_t v112 = objc_retainBlock(v204);
            [v111 addObject:v112];

            while (1)
            {

              id v113 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMaterialInfoByFromID,  "objectForKeyedSubscript:",  v45));
              BOOL v114 = (unint64_t)[v113 count] > 0x20;

              if (!v114) {
                break;
              }
              unsigned int v111 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMaterialInfoByFromID,  "objectForKeyedSubscript:",  v45));
              [v111 removeFirstObject];
            }

            uint64_t v115 = OSLogHandleForTransportCategory("IDSDSession");
            __int16 v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              id v175 = (id *)[v183 ownerParticipantId];
              uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              __int16 v118 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v117 groupID]);
              id v178 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue([v178 uniqueID]);
              uint64_t v120 = objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
              uint64_t v172 = v117;
              *(_DWORD *)buf = 134218754;
              __int16 v212 = v175;
              __int16 v213 = 2112;
              uint64_t v214 = v118;
              __int16 v215 = 2112;
              uint64_t v216 = v119;
              __int16 v217 = 2112;
              v121 = (void *)v120;
              uint64_t v218 = v120;
              _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo: saving material from %llu for group %@ and session %@ until we have member, sinc e the originator of material is not in group membership: %@",  buf,  0x2Au);
            }

            uint64_t v123 = os_log_shim_legacy_logging_enabled(v122);
            if ((_DWORD)v123)
            {
              if (_IDSShouldLogTransport(v123))
              {
                id v176 = [v183 ownerParticipantId];
                v124 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                v179 = (void *)objc_claimAutoreleasedReturnValue([v124 groupID]);
                id v125 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue([v125 uniqueID]);
                v166 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
                id v161 = v176;
                id v164 = v179;
                _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo: saving material from %llu for group %@ and session %@ until we have member, since the originator of material is not in group membership: %@");

                if (_IDSShouldLog(0LL, @"IDSDSession"))
                {
                  id v180 = objc_msgSend(v183, "ownerParticipantId", v176, v179, v165, v166);
                  id v126 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                  v184 = (void *)objc_claimAutoreleasedReturnValue([v126 groupID]);
                  id v127 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
                  uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue([v127 uniqueID]);
                  v166 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession destinations](self, "destinations"));
                  id v161 = v180;
                  id v164 = v184;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo: saving material from %llu for group %@ and session %@ until we have member, since the originator of material is not in group membership: %@");
                }
              }
            }

            -[IDSDSession materialInfoError:]( self,  "materialInfoError:",  @"ReceivedFromUnknownMember",  v161,  v164,  v165,  v166);

            objc_destroyWeak(v209);
            objc_destroyWeak(&location);
          }
        }

        else
        {
          uint64_t v92 = OSLogHandleForTransportCategory("IDSDSession");
          uint64_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not process material because ownerParticipantId is 0",  buf,  2u);
          }

          uint64_t v95 = os_log_shim_legacy_logging_enabled(v94);
          if ((_DWORD)v95)
          {
            if (_IDSShouldLogTransport(v95))
            {
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not process material because ownerParticipantId is 0");
              if (_IDSShouldLog(0LL, @"IDSDSession")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not process material because ownerParticipantId is 0");
              }
            }
          }

          -[IDSDSession materialInfoError:](self, "materialInfoError:", @"missingOwnerParticipantID", v159, v162);
        }
      }

      else
      {
        uint64_t v69 = OSLogHandleForTransportCategory("IDSDSession");
        id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v71 = (id *)[v10 ownerParticipantId];
          *(_DWORD *)buf = 134217984;
          __int16 v212 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not get push token for participant %llu",  buf,  0xCu);
        }

        uint64_t v73 = os_log_shim_legacy_logging_enabled(v72);
        if ((_DWORD)v73)
        {
          if (_IDSShouldLogTransport(v73))
          {
            uint64_t v159 = (id *)[v10 ownerParticipantId];
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not get push token for participant %llu");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v159 = (id *)objc_msgSend(v10, "ownerParticipantId", v159);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not get push token for participant %llu");
            }
          }
        }

        -[IDSDSession materialInfoError:](self, "materialInfoError:", @"missingFromToken", v159, v162);
      }
    }

    else
    {
      uint64_t v78 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v80 = (id *)[v10 ownerParticipantId];
        *(_DWORD *)buf = 134217984;
        __int16 v212 = v80;
        _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "didReceiveMaterialInfo could not get fromURI for participant %llu",  buf,  0xCu);
      }

      uint64_t v82 = os_log_shim_legacy_logging_enabled(v81);
      if ((_DWORD)v82)
      {
        if (_IDSShouldLogTransport(v82))
        {
          uint64_t v159 = (id *)[v10 ownerParticipantId];
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"didReceiveMaterialInfo could not get fromURI for participant %llu");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v159 = (id *)objc_msgSend(v10, "ownerParticipantId", v159);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"didReceiveMaterialInfo could not get fromURI for participant %llu");
          }
        }
      }

      -[IDSDSession materialInfoError:](self, "materialInfoError:", @"missingFromURI", v159, v162);
    }

    goto LABEL_87;
  }

  uint64_t v15 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo: SME disabled", buf, 2u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      _IDSLogTransport(@"IDSDSession", @"IDS", @"didReceiveMaterialInfo: SME disabled");
    }
  }

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("IDSDSession");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didConnectForDeviceUniqueID:%@ cbuuid:%@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v25 = v9;
    id v26 = v10;
    id v23 = self;
    id v24 = v8;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didConnectForDeviceUniqueID:%@ cbuuid:%@");
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v23, v24, v25, v26));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
  id v17 = objc_msgSend(v14, "onTransportThread_getLinkType:", v16);

  uint64_t v20 = im_primary_queue(v18, v19);
  uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CFF4;
  block[3] = &unk_1008F68C8;
  void block[4] = self;
  void block[5] = v17;
  dispatch_block_t v22 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
  dispatch_async(v21, v22);
}

- (void)link:(id)a3 didReceiveReportEvent:(id)a4
{
  id v42 = a3;
  id v44 = a4;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v44;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveReportEvent:%@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v40 = v42;
    id v41 = v44;
    __int16 v38 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didReceiveReportEvent:%@");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v38, v40, v41));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v50 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49[0] = v11;
    v49[1] = v11;
    memset(buf, 170, 0x1000uLL);
    IDSByteBufferInitForWrite(v49);
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v44 allKeys]);
    unsigned __int8 v13 = 0;
    id v14 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v14) {
      goto LABEL_36;
    }
    uint64_t v15 = *(void *)v46;
    uint64_t v16 = IDSGlobalLinkAttributeAcceptDelayKey;
    uint64_t v17 = IDSQuickRelayServerProviderKey;
    uint64_t v18 = buf;
    while (1)
    {
      for (int i = 0LL; i != v14; int i = (char *)i + 1)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (objc_msgSend(v20, "isEqualToString:", v16, v39))
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v16]);
          id v22 = [v21 unsignedIntValue];

          uint64_t v23 = OSLogHandleForTransportCategory("IDSDSession");
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v51 = 67109120;
            int v52 = (int)v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Report acceptDelay: %d", v51, 8u);
          }

          uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
          if ((_DWORD)v26)
          {
            if (_IDSShouldLogTransport(v26))
            {
              id v39 = v22;
              _IDSLogTransport(@"IDSDSession", @"IDS", @"Report acceptDelay: %d");
              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                id v39 = v22;
                _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Report acceptDelay: %d");
              }
            }
          }

          char v27 = 1;
        }

        else
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v17]);
          id v22 = [v28 unsignedIntValue];

          uint64_t v29 = OSLogHandleForTransportCategory("IDSDSession");
          __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v51 = 67109120;
            int v52 = (int)v22;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Report QuickRelay Server Provider: %d",  v51,  8u);
          }

          uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
          if ((_DWORD)v32)
          {
            if (_IDSShouldLogTransport(v32))
            {
              id v39 = v22;
              _IDSLogTransport(@"IDSDSession", @"IDS", @"Report QuickRelay Server Provider: %d");
              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                id v39 = v22;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Report QuickRelay Server Provider: %d");
              }
            }
          }

          char v27 = 2;
        }

        *(_WORD *)uint64_t v18 = 0;
        v18[2] = 0;
        v18[3] = v27;
        v18[4] = BYTE3(v22);
        void v18[5] = BYTE2(v22);
        v18[6] = BYTE1(v22);
        v18[7] = v22;
        v18 += 8;
        v13 += 8;
      }

      id v14 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (!v14)
      {
LABEL_36:

        IDSByteBufferWriteField(v49, 17LL, buf, v13);
        -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
        IDSByteBufferRelease(v49);
        goto LABEL_37;
      }
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v34 = [v33 clientType] == (id)6;

  if (v34) {
    goto LABEL_12;
  }
  uint64_t v35 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_InfoReportKey",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v37) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_InfoReportKey");
  }
LABEL_37:
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v90 = a3;
  id v91 = a5;
  id v92 = a6;
  if (self->_verboseFunctionalLogging)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSDSession");
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = a4->var1;
      int64_t var2 = a4->var2;
      var0 = a4->var0;
      int var25 = a4->var25;
      int v16 = *(unsigned __int8 *)a4->var0;
      int v17 = *((unsigned __int8 *)a4->var0 + 1);
      int v18 = *((unsigned __int8 *)a4->var0 + 2);
      int v19 = *((unsigned __int8 *)a4->var0 + 3);
      *(_DWORD *)buf = 138415362;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v90;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&_BYTE buf[24] = a4;
      *(_WORD *)BOOL v108 = 2112;
      *(void *)&v108[2] = v91;
      __int16 v109 = 2112;
      id v110 = v92;
      __int16 v111 = 2048;
      uint64_t v112 = var0;
      __int16 v113 = 2048;
      int64_t v114 = var2;
      __int16 v115 = 2048;
      unint64_t v116 = var1;
      __int16 v117 = 1024;
      int v118 = var25;
      __int16 v119 = 1024;
      int v120 = v16;
      __int16 v121 = 1024;
      int v122 = v17;
      __int16 v123 = 1024;
      int v124 = v18;
      __int16 v125 = 1024;
      int v126 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceivePacket:%p fromDeviceUniqueID:%@ cbuuid:%@ packetBytes %p packetLength %ld packetMaxLength %ld linkID %d [%02x%02x%02x%02x ...]",  buf,  0x70u);
    }

    if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"IDSDSession"))
    {
      uint64_t v88 = *((unsigned __int8 *)a4->var0 + 2);
      uint64_t v89 = *((unsigned __int8 *)a4->var0 + 3);
      uint64_t v86 = *(unsigned __int8 *)a4->var0;
      uint64_t v87 = *((unsigned __int8 *)a4->var0 + 1);
      unint64_t v84 = a4->var1;
      uint64_t v85 = a4->var25;
      uint64_t v82 = a4->var0;
      int64_t v83 = a4->var2;
      id v81 = v92;
      uint64_t v78 = a4;
      id v80 = v91;
      uint64_t v74 = self;
      id v76 = v90;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceivePacket:%p fromDeviceUniqueID:%@ cbuuid:%@ packetBytes %p packetLength %ld packetMaxLength %ld linkID %d [%02x%02x%02x%02x ...]");
    }
  }

  if (self->_firstPacketReceivedTime == 0.0)
  {
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_firstPacketReceivedTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession sharedState]( self,  "sharedState",  v74,  v76,  v78,  v80,  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  v89));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v22 clientType] == (id)1)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v23 clientType] == (id)5)
  {
LABEL_16:

    goto LABEL_17;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v24 clientType] == (id)6)
  {

    goto LABEL_16;
  }

  BOOL v70 = !self->_bypassUTun;

  if (v70)
  {
    uint64_t v71 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to receive packet",  buf,  0xCu);
    }

    goto LABEL_118;
  }

- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7
{
  uint64_t v154 = a4;
  id v148 = a3;
  id v153 = a5;
  id v12 = a6;
  id v157 = a7;
  uint64_t v13 = OSLogHandleForIDSCategory("IDSDSession");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v148;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v154;
    *(_WORD *)&_BYTE buf[28] = 2112;
    *(void *)&buf[30] = v153;
    *(_WORD *)&buf[38] = 2112;
    *(void *)&buf[40] = v12;
    *(_WORD *)&buf[48] = 2112;
    *(void *)&buf[50] = v157;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didConnectUnderlyingLink:%d linkUUID:%@ localAttributes:%@ remoteAttributes:%@",  buf,  0x3Au);
  }

  if (os_log_shim_legacy_logging_enabled(v15) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v146 = v12;
    id v147 = v157;
    uint64_t v143 = (int)v154;
    id v145 = v153;
    uint64_t v139 = self;
    id v141 = v148;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didConnectUnderlyingLink:%d linkUUID:%@ localAttributes:%@ remoteAttributes:%@");
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v139, v141, v143, v145, v146, v147));
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
  uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsSeparatedByString:@"-"]);

  theDict = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(theDict, @"state", &off_100946A68);
  int v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( self->_serviceIdentifier,  "substringFromIndex:",  [@"com.apple.private.alloy." length]));
  if (v18) {
    CFDictionarySetValue(theDict, @"serviceName", v18);
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([v149 objectAtIndexedSubscript:0]);
  if (v19) {
    CFDictionarySetValue(theDict, @"sessionID", v19);
  }

  IDSPowerLogDictionary(@"IDSDSession", theDict);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v21 clientType] == (id)1)
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v22 clientType] == (id)5)
  {

    goto LABEL_14;
  }

  int v124 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v125 = [v124 clientType] == (id)6;

  if (!v125)
  {
    uint64_t v126 = OSLogHandleForIDSCategory("IDSDSession");
    id v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      else {
        uint64_t v129 = @"NO";
      }
      uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v131 = [v130 clientType];
      if (v131 == (id)1)
      {
        int v132 = 0;
        uint64_t v133 = @"YES";
      }

      else
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v133 = @"YES";
        if ([v7 clientType] == (id)5)
        {
          int v132 = 0;
        }

        else
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          if ([v8 clientType] != (id)6) {
            uint64_t v133 = @"NO";
          }
          int v132 = 1;
        }
      }

      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v129;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&_BYTE buf[24] = v133;
      _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "No need to send kClientChannelMetadataType_LinkConnected, <%@> useQR: %@, isFaceTimeCall: %@",  buf,  0x20u);
      if (v132) {

      }
      if (v131 != (id)1) {
    }
      }

    if (os_log_shim_legacy_logging_enabled(v134)
      && _IDSShouldLog(0LL, @"IDSDSession"))
    {
      unsigned __int8 v135 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v135 useQRDirectly];
      id v136 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v136 clientType] == (id)1)
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_LinkConnected, <%@> useQR: %@, isFaceTimeCall: %@");
      }

      else
      {
        uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        if ([v137 clientType] == (id)5)
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_LinkConnected, <%@> useQR: %@, isFaceTimeCall: %@");
        }

        else
        {
          v138 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          [v138 clientType];
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_LinkConnected, <%@> useQR: %@, isFaceTimeCall: %@");
        }
      }
    }

    goto LABEL_71;
  }

- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6
{
  unsigned int v6 = a6;
  int v8 = a4;
  id v44 = a3;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("IDSDSession");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v8;
    *(_WORD *)&_BYTE buf[28] = 2112;
    *(void *)&buf[30] = v10;
    *(_WORD *)&buf[38] = 1024;
    unsigned int v50 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didDisconnectUnderlyingLinkID:%d linkUUID:%@, reason: %d",  buf,  0x2Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v41 = v10;
    uint64_t v42 = v6;
    id v39 = v44;
    uint64_t v40 = v8;
    int v38 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didDisconnectUnderlyingLinkID:%d linkUUID:%@, reason: %d");
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v38, v39, v40, v41, v42));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsSeparatedByString:@"-"]);

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_100946A80);
  int v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( self->_serviceIdentifier,  "substringFromIndex:",  [@"com.apple.private.alloy." length]));
  if (v18) {
    CFDictionarySetValue(Mutable, @"serviceName", v18);
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
  if (v19) {
    CFDictionarySetValue(Mutable, @"sessionID", v19);
  }

  IDSPowerLogDictionary(@"IDSDSession", Mutable);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v21 clientType] == (id)1)
  {
LABEL_14:

LABEL_15:
LABEL_16:
    *(void *)&_BYTE buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v23;
    *(_OWORD *)&uint8_t buf[16] = v23;
    IDSByteBufferInitForWrite(buf);
    v48[0] = 0xAAAAAAAAAAAAAAAALL;
    v48[1] = 0xAAAAAAAAAAAAAAAALL;
    v47[0] = v8;
    v47[1] = v6;
    [v10 getUUIDBytes:v48];
    IDSByteBufferWriteField(buf, 3LL, v47, 18LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_17;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v22 clientType] == (id)5)
  {

    goto LABEL_14;
  }

  unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v43 = [v34 clientType] == (id)6;

  if (v43) {
    goto LABEL_16;
  }
  uint64_t v35 = OSLogHandleForIDSCategory("IDSDSession");
  double v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_LinkDisconnected",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v37) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_LinkDisconnected");
  }
LABEL_17:
  unsigned int v24 = self->_connectedLinkCount - 1;
  self->_unsigned int connectedLinkCount = v24;
  if (!v24)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
    id v27 = [v26 copy];

    uint64_t v30 = im_primary_queue(v28, v29);
    uint64_t v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v30);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009FA78;
    block[3] = &unk_1008F5F80;
    void block[4] = self;
    id v46 = v27;
    id v32 = v27;
    dispatch_block_t v33 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
    dispatch_async(v31, v33);
  }
}

- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_reliableUnicastRegistrationCompletionBlock)
  {
    id v9 = [v7 mutableCopy];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    [v9 setValue:v11 forKey:IDSSessionUniqueIDKey];

    (*((void (**)(void))self->_reliableUnicastRegistrationCompletionBlock + 2))();
  }

  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveReliableUnicastServerMaterial:%@, Registration Completion block is nil!",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"IDSDSession")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveReliableUnicastServerMaterial:%@, Registration Completion block is nil!");
    }
  }
}

- (id)getLinkIDToLocalRemoteEndpointPairDictionary
{
  linkIDToLocalRemoteEndpointPair = self->_linkIDToLocalRemoteEndpointPair;
  if (!linkIDToLocalRemoteEndpointPair)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v5 = self->_linkIDToLocalRemoteEndpointPair;
    self->_linkIDToLocalRemoteEndpointPair = Mutable;

    linkIDToLocalRemoteEndpointPair = self->_linkIDToLocalRemoteEndpointPair;
  }

  return -[NSMutableDictionary copy](linkIDToLocalRemoteEndpointPair, "copy");
}

- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  char v42 = v5;
  uint64_t v10 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v9;
    LOWORD(v44) = 1024;
    *(_DWORD *)((char *)&v44 + 2) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveChildConnections:%@ forLinkID:%d",  buf,  0x26u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v38 = v9;
    uint64_t v39 = v5;
    double v36 = self;
    id v37 = v8;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveChildConnections:%@ forLinkID:%d");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v36, v37, v38, v39));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v14 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&uint8_t buf[16] = v16;
    IDSByteBufferInitForWrite(buf);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v42,  1LL));
    uint64_t v18 = JWEncodeDictionary(v9);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v17 appendData:v19];

    id v20 = v17;
    IDSByteBufferWriteField(buf, 76, [v20 bytes], (unsigned __int16)objc_msgSend(v20, "length"));
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);

    goto LABEL_13;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v15 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v22 = [v21 clientType] == (id)6;

  if (v22) {
    goto LABEL_12;
  }
  uint64_t v23 = OSLogHandleForIDSCategory("IDSDSession");
  unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    else {
      uint64_t v26 = @"NO";
    }
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v28 = [v27 clientType];
    if (v28 == (id)1)
    {
      int v29 = 0;
      uint64_t v30 = @"YES";
    }

    else
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v30 = @"YES";
      if ([v41 clientType] == (id)5)
      {
        int v29 = 0;
      }

      else
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        if ([v40 clientType] != (id)6) {
          uint64_t v30 = @"NO";
        }
        int v29 = 1;
      }
    }

    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No need to send kClientChannelMetadataType_ChildConnections, <%@> useQR: %@, isFaceTimeCall: %@",  buf,  0x20u);
    if (v29) {

    }
    if (v28 != (id)1) {
  }
    }

  if (os_log_shim_legacy_logging_enabled(v31) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v32 useQRDirectly];
    dispatch_block_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v33 clientType] == (id)1)
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_ChildConnections, <%@> useQR: %@, isFaceTimeCall: %@");
    }

    else
    {
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v34 clientType] == (id)5)
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_ChildConnections, <%@> useQR: %@, isFaceTimeCall: %@");
      }

      else
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        [v35 clientType];
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"No need to send kClientChannelMetadataType_ChildConnections, <%@> useQR: %@, isFaceTimeCall: %@");
      }
    }
  }

- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didWiFiNWPathFlagsChanged:%u",  buf,  0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v20 = v6;
    uint64_t v21 = v4;
    __int16 v19 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didWiFiNWPathFlagsChanged:%u");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v19, v20, v21));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    __int16 v22 = __rev16(v4);
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 62LL, &v22, 2LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v16 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_nwPathWiFiFlagsChanged",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_nwPathWiFiFlagsChanged");
  }
LABEL_13:
}

- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didCellularNWPathFlagsChanged:%u",  buf,  0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v20 = v6;
    uint64_t v21 = v4;
    __int16 v19 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didCellularNWPathFlagsChanged:%u");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v19, v20, v21));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    __int16 v22 = __rev16(v4);
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 63LL, &v22, 2LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v16 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_nwPathCellularFlagsChanged",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_nwPathCellularFlagsChanged");
  }
LABEL_13:
}

- (void)link:(id)a3 didRATChange:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  char v22 = v4;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didRATChange:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v20 = v6;
    uint64_t v21 = v4;
    __int16 v19 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didRATChange:%u");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v19, v20, v21));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 5LL, &v22, 1LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v16 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_RATChanged",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_RATChanged");
  }
LABEL_13:
}

- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didCellularMTUChange:%u",  buf,  0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v20 = v6;
    uint64_t v21 = v4;
    __int16 v19 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didCellularMTUChange:%u");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v19, v20, v21));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    __int16 v22 = __rev16(v4);
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 16LL, &v22, 2LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v16 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_CellularMTUChanged",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_CellularMTUChanged");
  }
LABEL_13:
}

- (void)link:(id)a3 didSoMaskChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didSoMaskChange:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v20 = v6;
    uint64_t v21 = v4;
    __int16 v19 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didSoMaskChange:%u");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v19, v20, v21));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    unsigned int v22 = bswap32(v4);
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 61LL, &v22, 4LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    goto LABEL_13;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v16 = OSLogHandleForIDSCategory("IDSDSession");
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_SoMaskChanged",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_SoMaskChanged");
  }
LABEL_13:
}

- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4
{
  id v62 = a3;
  id v68 = a4;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)id v91 = self;
    *(_WORD *)&v91[8] = 2112;
    id v92 = v62;
    __int16 v93 = 2112;
    id v94 = v68;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didGetLinkProbingStatus:%@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v57 = v62;
    id v59 = v68;
    char v55 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didGetLinkProbingStatus:%@");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v55, v57, v59));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v51 = [v50 clientType] == (id)6;

  if (!v51)
  {
    uint64_t v52 = OSLogHandleForIDSCategory("IDSDSession");
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v91 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_GetLinkStatusKey",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v54) && _IDSShouldLog(0LL, @"IDSDSession")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_GetLinkStatusKey");
    }
    goto LABEL_75;
  }

- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  char v22 = v5;
  uint64_t v9 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    if (v6) {
      uint64_t v11 = @"YES";
    }
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v11;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didDefaultUnderlyingLinkChangeSucceeded:%@ currentDefaultLinkID:%d",  buf,  0x26u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"IDSDSession")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didDefaultUnderlyingLinkChangeSucceeded:%@ currentDefaultLinkID:%d");
  }
  if (v6)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v13 useQRDirectly])
    {
LABEL_14:

LABEL_15:
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v16;
      *(_OWORD *)&uint8_t buf[16] = v16;
      IDSByteBufferInitForWrite(buf);
      IDSByteBufferWriteField(buf, 4LL, &v22, 1LL);
      -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
      IDSByteBufferRelease(buf);
      goto LABEL_16;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v14 clientType] == (id)1)
    {
LABEL_13:

      goto LABEL_14;
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v15 clientType] == (id)5)
    {

      goto LABEL_13;
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v18 = [v17 clientType] == (id)6;

    if (v18) {
      goto LABEL_15;
    }
    uint64_t v19 = OSLogHandleForIDSCategory("IDSDSession");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_DefaultLinkID",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v21) && _IDSShouldLog(0LL, @"IDSDSession")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_DefaultLinkID");
    }
  }

- (void)link:(id)a3 didAddQREvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didAddQREvent:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v17 = v6;
    id v18 = v7;
    __int128 v16 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didAddQREvent:%@");
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v16, v17, v18));
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v12 clientType] != (id)1)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v13 clientType] != (id)5)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v15 = [v14 clientType] == (id)6;

        if (!v15) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", v7);
LABEL_13:
}

- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  id v56 = a3;
  id v8 = a4;
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v90 = self;
    __int16 v91 = 2112;
    id v92 = v56;
    __int16 v93 = 2112;
    *(void *)id v94 = v8;
    *(_WORD *)&v94[8] = 1024;
    *(_DWORD *)&v94[10] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveParticipantUpdate:%@, status:%u",  buf,  0x26u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v10 useQRDirectly] & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v11 clientType] != (id)1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v12 clientType] != (id)5)
      {
        unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v34 = [v33 clientType] == (id)6;

        if (!v34) {
          goto LABEL_55;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  if (v8)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSStunAttributeSessionStateCounterKey]);
    unsigned int v14 = [v13 unsignedIntValue];

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSStunAttributeSessionStateTypeKey]);
    unsigned int v16 = [v15 unsignedShortValue];

    id v17 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSStunAttributeEncParticipantIDsKey]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSStunAttributeStunTruncatedKey]);
    BOOL v19 = v18 != 0LL;

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSStunMessageTypeKey]);
    unsigned int v21 = [v20 unsignedShortValue];

    if (v21 == 5)
    {
      if (v14 && v14 > self->_currentSessionStateCounter)
      {
        self->_currentSessionStateCounter = v14;
        uint64_t v24 = im_primary_queue(v22, v23);
        uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000A29DC;
        block[3] = &unk_1008F8DE0;
        void block[4] = self;
        id v17 = v17;
        id v84 = v17;
        __int16 v85 = v16;
        BOOL v86 = v19;
        dispatch_block_t v26 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
        dispatch_async(v25, v26);
      }
    }

    else if (v21 - 2 > 2)
    {
      if (v21 == 6)
      {
        uint64_t v30 = im_primary_queue(v22, v23);
        uint64_t v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v30);
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472LL;
        v57[2] = sub_1000A2FE8;
        v57[3] = &unk_1008F87D8;
        v57[4] = self;
        __int16 v58 = v16;
        dispatch_block_t v32 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v57);
        dispatch_async(v31, v32);
      }

      else
      {
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_1006989C0();
        }
      }
    }

    else
    {
      if ((v21 == 3 || v21 == 4 && (v5 & 0xFFFFFFFD) == 1) && v14 && v14 > self->_currentSessionStateCounter) {
        self->_currentSessionStateCounter = v14;
      }
      v81[0] = 0LL;
      v81[1] = v81;
      v81[2] = 0x2020000000LL;
      int v82 = -1431655766;
      if (v16 == 3)
      {
        uint64_t v27 = im_primary_queue(v22, v23);
        id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472LL;
        v75[2] = sub_1000A2AD4;
        v75[3] = &unk_1008F8E08;
        __int16 v78 = v21;
        __int16 v79 = v5;
        v75[4] = self;
        unsigned __int8 v77 = v81;
        id v76 = v17;
        BOOL v80 = v19;
        dispatch_block_t v29 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v75);
        dispatch_async(v28, v29);
      }

      else if (v16 > 2)
      {
        if (v16 == 4)
        {
          uint64_t v38 = im_primary_queue(v22, v23);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472LL;
          v62[2] = sub_1000A2DA4;
          v62[3] = &unk_1008F8E08;
          v62[4] = self;
          uint64_t v64 = v81;
          __int16 v65 = v21;
          __int16 v66 = v5;
          id v63 = v17;
          BOOL v67 = v19;
          sub_100076748(v39, QOS_CLASS_USER_INTERACTIVE, v62);
        }

        else if (v16 - 7 > 1)
        {
          uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v90 = self;
            __int16 v91 = 2112;
            id v92 = v56;
            __int16 v93 = 1024;
            *(_DWORD *)id v94 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveParticipantUpdate: IDSQRSessionSTUNMessageTypeErrorResponse, operationFlag: %u, not supported",  buf,  0x1Cu);
          }
        }

        else
        {
          __int16 v40 = v16 != 7;
          if (v5)
          {
            NSErrorUserInfoKey v87 = NSDebugDescriptionErrorKey;
            __int16 v88 = @"participantUpgrade message error";
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"participantUpgrade",  v5,  v41));

            self->_BOOL isLightweightParticipant = v16 != 7;
            BOOL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              BOOL isLightweightParticipant = self->_isLightweightParticipant;
              *(_DWORD *)buf = 138413058;
              if (isLightweightParticipant) {
                uint64_t v45 = @"YES";
              }
              else {
                uint64_t v45 = @"NO";
              }
              uint64_t v90 = self;
              __int16 v91 = 2112;
              id v92 = v56;
              __int16 v93 = 1024;
              *(_DWORD *)id v94 = v16;
              *(_WORD *)&v94[4] = 2112;
              *(void *)&v94[6] = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveParticipantUpdate: operationFlag: %u has issue, change the _isLightweightParticipant to %@",  buf,  0x26u);
            }

            id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 groupID]);
              *(_DWORD *)buf = 138412546;
              uint64_t v90 = self;
              __int16 v91 = 2112;
              id v92 = v48;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "<%@> didReceiveParticipantUpdate: reset MKM status for: %@",  buf,  0x16u);
            }

            char v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
            unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            BOOL v51 = (void *)objc_claimAutoreleasedReturnValue([v50 groupID]);
            [v49 resetMKMLocalSentStatus:v51];

            if (self->_isLightweightParticipant) {
              id v22 = -[IDSDSession unregisterClientChannel](self, "unregisterClientChannel");
            }
            else {
              id v22 = -[IDSDSession registerClientChannel](self, "registerClientChannel");
            }
          }

          else
          {
            uint64_t v42 = 0LL;
          }

          uint64_t v53 = im_primary_queue(v22, v23);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_1000A2EF8;
          v59[3] = &unk_1008F8040;
          __int16 v61 = v40;
          v59[4] = self;
          id v60 = v42;
          id v55 = v42;
          sub_100076748(v54, QOS_CLASS_USER_INTERACTIVE, v59);
        }
      }

      else
      {
        uint64_t v35 = im_primary_queue(v22, v23);
        double v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_1000A2C1C;
        v68[3] = &unk_1008F8E30;
        __int16 v71 = v21;
        __int16 v72 = v5;
        v68[4] = self;
        BOOL v70 = v81;
        __int16 v73 = v16;
        id v69 = v17;
        BOOL v74 = v19;
        sub_100076748(v36, QOS_CLASS_USER_INTERACTIVE, v68);
      }

      _Block_object_dispose(v81, 8);
    }
  }

  else
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_100698960();
    }
  }

LABEL_55:
}

- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int currentSessionStateCounter = self->_currentSessionStateCounter;
    *(_DWORD *)buf = 138413058;
    unsigned int v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 1024;
    unsigned int v25 = a4;
    __int16 v26 = 1024;
    unsigned int v27 = currentSessionStateCounter;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveSessionStateCounter:%u, _currentSessionStateCounter: %u",  buf,  0x22u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v9 useQRDirectly] & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v10 clientType] != (id)1)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v11 clientType] != (id)5)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v18 = [v17 clientType];

        if (v18 != (id)6) {
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  if (self->_currentSessionStateCounter < a4)
  {
    uint64_t v14 = im_primary_queue(v12, v13);
    BOOL v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A32D4;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_block_t v16 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
    dispatch_async(v15, v16);
  }

- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v32 = self;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ plugin didReceivePluginRegistration: %llu",  buf,  0x20u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v12 clientType] != (id)1)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v13 clientType] != (id)5)
      {
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v26 = [v25 clientType];

        if (v26 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantID]( self->_groupStatusNotificationParams,  "participantID"));
  id v15 = [v14 unsignedLongLongValue];

  v29[0] = IDSGroupSessionParticipantIdentifierKey;
  dispatch_block_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  v30[0] = v16;
  v29[1] = IDSGroupSessionLocalParticipantIdentifierKey;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v15));
  v29[2] = IDSGroupSessionPluginNameKey;
  v30[1] = v17;
  v30[2] = v9;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));

  uint64_t v21 = im_primary_queue(v19, v20);
  __int16 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000A3670;
  v27[3] = &unk_1008F5F80;
  v27[4] = self;
  id v28 = v18;
  id v23 = v18;
  dispatch_block_t v24 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v27);
  dispatch_async(v22, v24);

LABEL_10:
}

- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2048;
    unint64_t v33 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ plugin didReceivePluginUnregistration: %llu",  buf,  0x20u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v12 clientType] != (id)1)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v13 clientType] != (id)5)
      {
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v23 = [v22 clientType];

        if (v23 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  v26[0] = IDSGroupSessionParticipantIdentifierKey;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  v26[1] = IDSGroupSessionPluginNameKey;
  v27[0] = v14;
  v27[1] = v9;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));

  uint64_t v18 = im_primary_queue(v16, v17);
  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000A39C8;
  v24[3] = &unk_1008F5F80;
  v24[4] = self;
  id v25 = v15;
  id v20 = v15;
  dispatch_block_t v21 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v24);
  dispatch_async(v19, v21);

LABEL_10:
}

- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ plugin didReceiveRequestToPurgeRegistration:%@",  buf,  0x20u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A3BE0;
  v10[3] = &unk_1008F8E58;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ plugin didReceivePluginDisconnect:%@",  (uint8_t *)&v10,  0x20u);
  }

  multiplexerTransport = self->_multiplexerTransport;
  if (multiplexerTransport) {
    -[IDSMultiplexerGroupSessionTransport purgeQUICConnectionsForParticipants:]( multiplexerTransport,  "purgeQUICConnectionsForParticipants:",  v7);
  }
}

- (id)_createOneWayParticipantDictionaryFromMappedParticipantsDict:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A3DC4;
  v7[3] = &unk_1008F8E80;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = -[NSMutableDictionary copy](v4, "copy");
  return v5;
}

- (id)_breakDictionaryIntoMultipleChunks:(id)a3 chunkSize:(int)a4
{
  id v5 = a3;
  dispatch_block_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v6 = [v24 count];
  id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v6)
  {
    int v7 = 0;
    unint64_t v22 = a4;
    do
    {
      int v8 = v7;
      else {
        id v9 = v6;
      }
      int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subarrayWithRange:", v7, v9));
      id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (int i = 0LL; i != v14; int i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v17]);
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v18, v17);
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v14);
      }

      id v19 = -[NSMutableDictionary copy](v11, "copy");
      -[NSMutableArray addObject:](v23, "addObject:", v19);

      v6 -= (unint64_t)[v12 count];
      int v7 = [v12 count] + v8;
    }

    while (v6);
  }

  id v20 = -[NSMutableArray copy](v23, "copy");

  return v20;
}

- (void)_sendParticipantMappingUpdateToClient:(id)a3 forLinkID:(char)a4 shouldReplace:(BOOL)a5
{
  BOOL v5 = a5;
  char v15 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  0LL));
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v8;
  v13[1] = v8;
  IDSByteBufferInitForWrite(v13);
  IDSByteBufferWriteField(v13, 1LL, &v15, 1LL);
  id v9 = v7;
  id v10 = [v9 bytes];
  uint64_t v11 = (unsigned __int16)[v9 length];
  if (v5) {
    uint64_t v12 = 74LL;
  }
  else {
    uint64_t v12 = 75LL;
  }
  IDSByteBufferWriteField(v13, v12, v10, v11);
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
  IDSByteBufferRelease(v13);
}

- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    dispatch_block_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 1024;
    int v30 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveMappedParticipantsDict:%@ for linkID:%d ",  buf,  0x26u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v12 clientType] != (id)1)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v13 clientType] != (id)5)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v20 = [v19 clientType];

        if (v20 != (id)6) {
          goto LABEL_15;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _createOneWayParticipantDictionaryFromMappedParticipantsDict:]( self,  "_createOneWayParticipantDictionaryFromMappedParticipantsDict:",  v9));
  if ((unint64_t)[v14 count] > 0x1D)
  {
    char v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _breakDictionaryIntoMultipleChunks:chunkSize:]( self,  "_breakDictionaryIntoMultipleChunks:chunkSize:",  v14,  30LL));
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (IDSDSession *)[v9 count];
      id v18 = [v15 count];
      *(_DWORD *)buf = 134218240;
      dispatch_block_t v24 = v17;
      __int16 v25 = 2048;
      id v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "didReceiveMappedParticipantsDict: breaking %lu element dict into %lu chunks.",  buf,  0x16u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000A43AC;
    v21[3] = &unk_1008F8EA8;
    v21[4] = self;
    char v22 = v5;
    [v15 enumerateObjectsUsingBlock:v21];
  }

  else
  {
    -[IDSDSession _sendParticipantMappingUpdateToClient:forLinkID:shouldReplace:]( self,  "_sendParticipantMappingUpdateToClient:forLinkID:shouldReplace:",  v14,  v5,  1LL);
  }

LABEL_15:
}

- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 1024;
    unsigned int v25 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<%@> didReceiveBlockedIndicationForLink:%@ reason: %u",  buf,  0x1Cu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if (([v8 useQRDirectly] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v9 clientType] != (id)1)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v10 clientType] != (id)5)
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v17 = [v16 clientType];

        if (v17 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  uint64_t v13 = im_primary_queue(v11, v12);
  unint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000A45AC;
  v18[3] = &unk_1008F78D8;
  v18[4] = self;
  unsigned int v19 = a4;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v18);
  dispatch_async(v14, v15);

LABEL_10:
}

- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link: %@ didReceiveEncryptedDataBlobs: %@",  buf,  0x20u);
  }

  uint64_t v11 = im_primary_queue(v9, v10);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A4714;
  v15[3] = &unk_1008F5F80;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v15);
  dispatch_async(v12, v14);
}

- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    unsigned int v16 = a4;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "didReceiveErrorIndicationWithCode: %u for link: %@ <%@>",  buf,  0x1Cu);
  }

  if (a4 == 2)
  {
    -[IDSGFTMetricsCollector serverShortMKICacheMiss](self->_metricsCollector, "serverShortMKICacheMiss");
  }

  else
  {
    uint64_t v10 = im_primary_queue(v8, v9);
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    _OWORD v13[2] = sub_1000A4874;
    v13[3] = &unk_1008F78D8;
    v13[4] = self;
    unsigned int v14 = a4;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v13);
    dispatch_async(v11, v12);
  }
}

- (void)link:(id)a3 didReceiveEncryptionInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v7 isGeneratedLocally];
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    if (v10) {
      uint64_t v11 = @"YES";
    }
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v7;
    LOWORD(v44[0]) = 2112;
    *(void *)((char *)v44 + 2) = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveEncryptionInformation:%@, local: %@",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    unsigned int v13 = [v7 isGeneratedLocally];
    unsigned int v14 = @"NO";
    if (v13) {
      unsigned int v14 = @"YES";
    }
    id v37 = v7;
    uint64_t v38 = v14;
    __int16 v35 = self;
    id v36 = v6;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveEncryptionInformation:%@, local: %@");
  }

  dispatch_block_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v35, v36, v37, v38));
  if (([v15 useQRDirectly] & 1) == 0)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v16 clientType] != (id)1)
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v17 clientType] != (id)5)
      {
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v34 = [v33 clientType] == (id)6;

        if (!v34) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
  }

LABEL_16:
  id v18 = [v7 isGeneratedLocally];
  char v40 = (char)v18;
  metricsCollector = self->_metricsCollector;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 keyIndex]);
  -[IDSGFTMetricsCollector sendMKMToAVC:isGeneratedLocally:]( metricsCollector,  "sendMKMToAVC:isGeneratedLocally:",  v20,  v18);

  v42[0] = 0xAAAAAAAAAAAAAAAALL;
  v42[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 keyIndex]);
  [v21 getUUIDBytes:v42];

  v44[0] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v22;
  *(_OWORD *)&uint8_t buf[16] = v22;
  IDSByteBufferInitForWrite(buf);
  if ((_DWORD)v18)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 groupID]);
    BOOL v25 = v24 == 0LL;

    if (!v25)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 groupID]);
      id v29 = [v26 encryptionSequenceNumberForGroupID:v28];

      unint64_t v41 = bswap64((unint64_t)v29);
      IDSByteBufferWriteField(buf, 69LL, &v41, 8LL);
    }
  }

  id v30 = objc_claimAutoreleasedReturnValue([v7 keyMaterial]);
  IDSByteBufferWriteField(buf, 30, [v30 bytes], 32);

  id v31 = objc_claimAutoreleasedReturnValue([v7 keySalt]);
  IDSByteBufferWriteField(buf, 31, [v31 bytes], 16);

  IDSByteBufferWriteField(buf, 32LL, v42, 16LL);
  IDSByteBufferWriteField(buf, 55LL, &v40, 1LL);
  unsigned __int8 v39 = [v7 shortKeyIndexLength];
  IDSByteBufferWriteField(buf, 82LL, &v39, 1LL);
  id v32 = [v7 participantID];
  LOBYTE(v41) = HIBYTE(v32);
  BYTE1(v41) = BYTE6(v32);
  BYTE2(v41) = BYTE5(v32);
  BYTE3(v41) = BYTE4(v32);
  BYTE4(v41) = BYTE3(v32);
  BYTE5(v41) = BYTE2(v32);
  BYTE6(v41) = BYTE1(v32);
  HIBYTE(v41) = (_BYTE)v32;
  IDSByteBufferWriteField(buf, 24LL, &v41, 8LL);
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
  IDSByteBufferRelease(buf);
LABEL_20:
}

- (void)link:(id)a3 didReceiveMembershipChangedInformation:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&_BYTE buf[24] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveMembershipChangedInformation:%u",  buf,  0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v17 = v6;
    uint64_t v18 = v4;
    unsigned int v16 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveMembershipChangedInformation:%u");
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v16, v17, v18));
  if (([v10 useQRDirectly] & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v11 clientType] != (id)1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v12 clientType] != (id)5)
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v15 = [v14 clientType] == (id)6;

        if (!v15) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  char v19 = v4;
  IDSByteBufferInitForWrite(buf);
  IDSByteBufferWriteField(buf, 33LL, &v19, 1LL);
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
  IDSByteBufferRelease(buf);
LABEL_13:
}

- (void)link:(id)a3 didReceiveDebugDataForClient:(id)a4 dataType:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v24 = a5;
  uint64_t v10 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveDebugDataForClient:%@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v12) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    id v22 = v8;
    id v23 = v9;
    unint64_t v21 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> link:%@ didReceiveDebugDataForClient:%@");
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v21, v22, v23));
  if (([v13 useQRDirectly] & 1) == 0)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v14 clientType] != (id)1)
    {
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v15 clientType] != (id)5)
      {
        char v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v20 = [v19 clientType] == (id)6;

        if (!v20) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  id v16 = v9;
  id v17 = [v16 bytes];
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v18;
  *(_OWORD *)&uint8_t buf[16] = v18;
  IDSByteBufferInitForWrite(buf);
  IDSByteBufferWriteField(buf, 253LL, &v24, 1LL);
  IDSByteBufferWriteField(buf, 254, v17, (unsigned __int16)[v16 length]);
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
  IDSByteBufferRelease(buf);
LABEL_13:
}

- (void)terminateCallDueToIdleClientForLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<%@> terminateCallDueToIdleClientForLink:%@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    __int128 v18 = self;
    id v19 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> terminateCallDueToIdleClientForLink:%@");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v18, v19));
  if (([v8 useQRDirectly] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if ([v9 clientType] != (id)1)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v10 clientType] != (id)5)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v17 = [v16 clientType] == (id)6;

        if (!v17) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  uint64_t v13 = im_primary_queue(v11, v12);
  unsigned int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A5498;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v14, v15);

LABEL_13:
}

- (void)_sendSessionInfoResponseErrorToClient:(unsigned int)a3
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v5;
  v7[1] = v5;
  IDSByteBufferInitForWrite(v7);
  unsigned int v6 = bswap32(a3);
  IDSByteBufferWriteField(v7, 54LL, &v6, 4LL);
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
  IDSByteBufferRelease(v7);
}

- (void)_processParticipantInfo:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  id v46 = self;
  if (self->_handOffOverQREnabled)
  {
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v37 = v5;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    id v35 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v60;
      do
      {
        for (int i = 0LL; i != v35; int i = (char *)i + 1)
        {
          if (*(void *)v60 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
          unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:"));
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          id v39 = v6;
          id v42 = [v39 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v42)
          {
            uint64_t v40 = *(void *)v56;
            while (2)
            {
              for (uint64_t j = 0LL; j != v42; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v56 != v40) {
                  objc_enumerationMutation(v39);
                }
                unint64_t v8 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
                id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 0, 8));
                if ((unint64_t)[v9 length] <= 7)
                {
                  uint64_t v29 = OSLogHandleForTransportCategory("IDSDSession");
                  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "_processParticipantInfo: invalid encryptedBlobLength!",  buf,  2u);
                  }

                  uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
                  if ((_DWORD)v32)
                  {
                    if (_IDSShouldLogTransport(v32))
                    {
                      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"_processParticipantInfo: invalid encryptedBlobLength!");
                      if (_IDSShouldLog(0LL, @"IDSDSession")) {
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"_processParticipantInfo: invalid encryptedBlobLength!");
                      }
                    }
                  }

                  goto LABEL_25;
                }

                id v45 = v9;
                uint64_t v10 = *(void *)[v45 bytes];
                uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 8, v10));
                uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "subdataWithRange:",  v10 + 8,  (char *)objc_msgSend(v8, "length") - v10 - 8));
                uint64_t v13 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v45);
                -[NSMutableData appendData:](v13, "appendData:", v11);
                unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getURIFromParticipantIDNumber:]( v46,  "_getURIFromParticipantIDNumber:",  v44));
                dispatch_block_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v46, "sharedState"));
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceName]);
                BOOL v43 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v14,  v16));

                BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokenFromParticipantIDNumber:]( v46,  "_getPushTokenFromParticipantIDNumber:",  v44));
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v46, "sharedState"));
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceName]);
                BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v17,  v19));

                unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
                id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession getCallerCert](v46, "getCallerCert"));
                __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v20 rawToken]);
                id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession getFromService](v46, "getFromService"));
                BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession fromURI](v46, "fromURI"));
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472LL;
                _BYTE v47[2] = sub_1000A5A94;
                v47[3] = &unk_1008F8EF8;
                id v48 = v12;
                char v49 = v13;
                id v50 = v11;
                BOOL v51 = v46;
                uint64_t v52 = v44;
                unint64_t v53 = a4;
                id v26 = v11;
                __int16 v27 = v13;
                id v28 = v12;
                LOBYTE(v33) = 0;
                [v21 publicKeyVerifySignedData:v28 matchesData:v27 forSignatureType:0 identity:v22 forURI:v43 pushToken:v23 service:v24 localURI:v25 prio rity:300 completion:v47 avoidMainQueue:v33];
              }

              id v42 = [v39 countByEnumeratingWithState:&v55 objects:v63 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
        }

        id v35 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }

      while (v35);
    }

- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v11 = a3;
  id v12 = a4;
  id v121 = a5;
  id v122 = a6;
  uint64_t v120 = v11;
  uint64_t v13 = OSLogHandleForIDSCategory("IDSDSession");
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v121;
    *(_WORD *)&_BYTE buf[32] = 2112;
    *(void *)&buf[34] = v122;
    __int16 v134 = 1024;
    int v135 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "link:%@ didReceiveSessionInfo:%@ relayGroupID:%@ relaySessionID:%@ status: %u",  buf,  0x30u);
  }

  if (os_log_shim_legacy_logging_enabled(v15) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    double v113 = *(double *)&v122;
    uint64_t v114 = v7;
    id v110 = v12;
    id v111 = v121;
    id v109 = v11;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"link:%@ didReceiveSessionInfo:%@ relayGroupID:%@ relaySessionID:%@ status: %u");
  }

  if (!(_DWORD)v7)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey]);
    unsigned int v25 = [v24 intValue];

    id v26 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseOfflineRequestKey]);
    unsigned int v27 = [v26 BOOLValue];

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoIndicationKey]);
    unsigned int v29 = [v28 BOOLValue];

    uint64_t v30 = IDSGlobalLinkOptionSessionInfoResponseStreamInfoKey;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseStreamInfoKey]);
    uint64_t v32 = (const void *)kIDSQRAllocateKey_StreamInfoGenerationCounter;
    if (v31 && kIDSQRAllocateKey_StreamInfoGenerationCounter)
    {
      uint64_t v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v30]);
      id v34 = objc_msgSend((id)CFDictionaryGetValue(v33, v32), "unsignedIntValue");
    }

    else
    {
      id v34 = objc_msgSend(0, "unsignedIntValue", v109, v110, v111, *(void *)&v113, v114);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:IDSGlobalLinkOptionSessionInfoCommandFlagKey]);
    unsigned __int8 v36 = [v35 unsignedIntValue];

    id v117 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseLightweightParticipantsKey]);
    unint64_t v116 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseJoinedParticipantInfoKey]);
    __int16 v115 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseLeftParticipantInfoKey]);
    -[IDSDSession _processParticipantInfo:type:](self, "_processParticipantInfo:type:", v116, 1LL);
    -[IDSDSession _processParticipantInfo:type:](self, "_processParticipantInfo:type:", v115, 2LL);
    if (((v27 | v29 ^ 1) & 1) == 0 && self->_currentGenerationCounter >= v34)
    {
      genCounterUpdatedByResponseTime = self->_genCounterUpdatedByResponseTime;
      if (genCounterUpdatedByResponseTime)
      {
        -[NSDate timeIntervalSinceNow](genCounterUpdatedByResponseTime, "timeIntervalSinceNow");
        double v39 = -v38;
        uint64_t v40 = OSLogHandleForIDSCategory("IDSDSession");
        unint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int currentGenerationCounter = self->_currentGenerationCounter;
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v120;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v34;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = currentGenerationCounter;
          *(_WORD *)&_BYTE buf[24] = 2048;
          *(double *)&buf[26] = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "link:%@ didReceiveSessionInfo: Got outdated indication with generationCounter: %u, currentGenerationCounter: %u after %lf seconds",  buf,  0x22u);
        }

        if (os_log_shim_legacy_logging_enabled(v43)
          && _IDSShouldLog(0LL, @"IDSDSession"))
        {
          double v113 = v39;
          id v110 = v34;
          id v111 = (id)self->_currentGenerationCounter;
          id v109 = v120;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"link:%@ didReceiveSessionInfo: Got outdated indication with generationCounter: %u, currentGenerationCounter: %u after %lf seconds");
        }

        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946AB0,  IDSDSessionReportQREventSubTypeKey);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v39));
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v45,  IDSDSessionReportDurationKey);

        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946A08,  IDSDSessionReportResultCodeKey);
        -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", Mutable);
      }
    }

    if (v25 == 2) {
      char v46 = v27;
    }
    else {
      char v46 = 1;
    }
    if ((v46 & 1) != 0
      || (unsigned int v47 = self->_currentGenerationCounter, v47 < v34)
      || v47 == (_DWORD)v34 && (v36 & 1) != 0)
    {
      if ((v27 & 1) == 0 && self->_currentGenerationCounter < v34)
      {
        uint64_t v48 = OSLogHandleForIDSCategory("IDSDSession");
        char v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v50 = self->_currentGenerationCounter;
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v120;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v50;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = (_DWORD)v34;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "link:%@ didReceiveSessionInfo: increment generation counter (%u -> %u)",  buf,  0x18u);
        }

        if (os_log_shim_legacy_logging_enabled(v51)
          && _IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v110 = (id)self->_currentGenerationCounter;
          id v111 = v34;
          id v109 = v120;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"link:%@ didReceiveSessionInfo: increment generation counter (%u -> %u)");
        }

        self->_unsigned int currentGenerationCounter = v34;
        if (v29)
        {
          uint64_t v52 = self->_genCounterUpdatedByResponseTime;
          self->_genCounterUpdatedByResponseTime = 0LL;
        }

        else
        {
          __int128 v55 = objc_alloc_init(&OBJC_CLASS___NSDate);
          uint64_t v52 = self->_genCounterUpdatedByResponseTime;
          self->_genCounterUpdatedByResponseTime = v55;
        }
      }

      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "objectForKeyedSubscript:",  IDSGlobalLinkOptionSessionInfoResponseParticipantsKey,  v109,  v110,  v111,  *(void *)&v113));
      if ([v56 count])
      {
        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokensFromParticipantIDArray:useNullPlaceholder:]( self,  "_getPushTokensFromParticipantIDArray:useNullPlaceholder:",  v56,  1LL));
        -[IDSDSession getActiveParticipants:pushTokenForParticipants:isLightweightParticipant:]( self,  "getActiveParticipants:pushTokenForParticipants:isLightweightParticipant:",  v56,  v58,  0LL);
      }

      else
      {
        uint64_t v59 = im_primary_queue(0LL, v57);
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472LL;
        v130[2] = sub_1000A70D4;
        v130[3] = &unk_1008F6010;
        v130[4] = self;
        __int128 v60 = (dispatch_queue_s *)(id)objc_claimAutoreleasedReturnValue(v59);
        dispatch_block_t v61 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v130);
        dispatch_async(v60, v61);
      }

      if ([v117 count])
      {
        id v63 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _getPushTokensFromParticipantIDArray:useNullPlaceholder:]( self,  "_getPushTokensFromParticipantIDArray:useNullPlaceholder:",  v117,  1LL));
        -[IDSDSession getActiveParticipants:pushTokenForParticipants:isLightweightParticipant:]( self,  "getActiveParticipants:pushTokenForParticipants:isLightweightParticipant:",  v117,  v63,  1LL);
      }

      else
      {
        uint64_t v64 = im_primary_queue(0LL, v62);
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472LL;
        v129[2] = sub_1000A7248;
        v129[3] = &unk_1008F6010;
        v129[4] = self;
        __int16 v65 = (dispatch_queue_s *)(id)objc_claimAutoreleasedReturnValue(v64);
        dispatch_block_t v66 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v129);
        dispatch_async(v65, v66);
      }
    }

    uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v30, v109, v110, v111));
    if (!v119) {
      goto LABEL_118;
    }
    theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    BOOL v67 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:IDSGlobalLinkOptionLinkIDKey]);
    if (v67)
    {
      CFDictionarySetValue(theDict, IDSDataChannelLinkIDKey, v67);
    }

    else
    {
      id v68 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698D3C();
      }
    }

    id v69 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoLinkIDToQueryKey]);
    if (v69)
    {
      CFDictionarySetValue(theDict, IDSDataChannelLinkIDToQueryKey, v69);
    }

    else
    {
      id v70 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698CBC();
      }
    }

    __int16 v71 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:v32]);
    if (v71)
    {
      CFDictionarySetValue(theDict, IDSDataChannelParticipantGenerationCounterKey, v71);
    }

    else
    {
      id v72 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698C3C();
      }
    }

    __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoPeerSubscribedStreams]);
    if (v73)
    {
      CFDictionarySetValue(theDict, IDSDataChannelPeerSubscribedStreamsKey, v73);
    }

    else
    {
      id v74 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698BBC();
      }
    }

    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoPeerPublishedStreams]);
    id v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    id v77 = v75;
    id v78 = [v77 countByEnumeratingWithState:&v125 objects:v132 count:16];
    if (v78)
    {
      uint64_t v79 = *(void *)v126;
      uint64_t v80 = IDSDataChannelNoStreamsKey;
      uint64_t v81 = IDSDataChannelAllStreamsKey;
      do
      {
        for (int i = 0LL; i != v78; int i = (char *)i + 1)
        {
          if (*(void *)v126 != v79) {
            objc_enumerationMutation(v77);
          }
          __int128 v83 = *(void **)(*((void *)&v125 + 1) + 8LL * (void)i);
          if ([v83 anyStream])
          {
            id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 participantID]);
            [v76 setObject:v81 forKeyedSubscript:v84];
          }

          else
          {
            __int16 v85 = (void *)objc_claimAutoreleasedReturnValue([v83 streamArray]);
            BOOL v86 = v85 == 0LL;

            if (v86)
            {
              id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 participantID]);
              [v76 setObject:v80 forKeyedSubscript:v84];
            }

            else
            {
              id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 streamArray]);
              NSErrorUserInfoKey v87 = (void *)objc_claimAutoreleasedReturnValue([v83 participantID]);
              [v76 setObject:v84 forKeyedSubscript:v87];
            }
          }
        }

        id v78 = [v77 countByEnumeratingWithState:&v125 objects:v132 count:16];
      }

      while (v78);
    }

    id v88 = v76;
    if (v88)
    {
      CFDictionarySetValue(theDict, IDSDataChannelPeerPublishedStreamsKey, v88);
    }

    else
    {
      id v89 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698B3C();
      }
    }

    uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoRequestBytesSentKey]);
    if (v90)
    {
      CFDictionarySetValue(theDict, IDSDataChannelSessionInfoRequestBytesSentKey, v90);
    }

    else
    {
      id v91 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698ABC();
      }
    }

    id v92 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseBytesReceivedKey]);
    if (v92)
    {
      CFDictionarySetValue(theDict, IDSDataChannelSessionInfoResponseBytesReceivedKey, v92);
    }

    else
    {
      id v93 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100698A3C();
      }
    }

    id v124 = 0LL;
    id v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  theDict,  0LL,  &v124));
    id v95 = v124;
    if (v95)
    {
      uint64_t v96 = OSLogHandleForIDSCategory("IDSDSession");
      unsigned int v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v98 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v99 = (void *)objc_claimAutoreleasedReturnValue([v98 groupID]);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v120;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&_BYTE buf[24] = v99;
        *(_WORD *)&_BYTE buf[32] = 2112;
        *(void *)&buf[34] = v95;
        _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "<%@> link:%@ didReceiveSessionInfo failed to encode streamInfo response for group %@ (error: %@)",  buf,  0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled(v100)
        && _IDSShouldLog(0LL, @"IDSDSession"))
      {
        __int16 v101 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v101 groupID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link:%@ didReceiveSessionInfo failed to encode streamInfo response for group %@ (error: %@)");
      }

      goto LABEL_117;
    }

    __int16 v102 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if (([v102 useQRDirectly] & 1) == 0)
    {
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v103 clientType] != (id)1)
      {
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        if ([v104 clientType] != (id)5)
        {
          uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          BOOL v108 = [v107 clientType] == (id)6;

          if (!v108) {
            goto LABEL_117;
          }
          goto LABEL_116;
        }
      }
    }

LABEL_116:
    *(void *)&_BYTE buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v105 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v105 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v105;
    *(_OWORD *)&uint8_t buf[16] = v105;
    IDSByteBufferInitForWrite(buf);
    id v106 = v94;
    IDSByteBufferWriteField(buf, 39, [v106 bytes], (unsigned __int16)objc_msgSend(v106, "length"));
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
LABEL_117:

LABEL_118:
    goto LABEL_119;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v16 useQRDirectly])
  {
LABEL_12:

LABEL_13:
    id v19 = -[IDSDSession _sendSessionInfoResponseErrorToClient:]( self,  "_sendSessionInfoResponseErrorToClient:",  v7,  v109,  v110,  v111,  *(void *)&v113,  v114);
    goto LABEL_14;
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v17 clientType] == (id)1)
  {
LABEL_11:

    goto LABEL_12;
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v18 clientType] == (id)5)
  {

    goto LABEL_11;
  }

  unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v54 = [v53 clientType] == (id)6;

  if (v54) {
    goto LABEL_13;
  }
LABEL_14:
  if ((_DWORD)v7 != 1)
  {
    uint64_t v21 = im_primary_queue(v19, v20);
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A6FD0;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
    dispatch_async(v22, v23);
  }

- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<%@> link: %@ didFinishConvergenceForRelaySessionID: %@.",  buf,  0x20u);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> link: %@ didFinishConvergenceForRelaySessionID: %@.");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link: %@ didFinishConvergenceForRelaySessionID: %@.");
      }
    }
  }

  self->_unsigned int currentGenerationCounter = 0;
  genCounterUpdatedByResponseTime = self->_genCounterUpdatedByResponseTime;
  self->_genCounterUpdatedByResponseTime = 0LL;

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &off_100946978,  IDSGlobalLinkOptionSessionInfoRequestTypeKey,  &off_100946AC8,  IDSGlobalLinkOptionSessionInfoCommandFlagKey,  0LL));
  -[IDSDSession requestSessionInfoWithOptions:](self, "requestSessionInfoWithOptions:", v13);
}

- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = OSLogHandleForTransportCategory("IDSDSession");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = @"NO";
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = self;
    if (v7) {
      __int16 v18 = @"YES";
    }
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&_BYTE buf[24] = v14;
    *(_WORD *)char v46 = 2112;
    *(void *)&v46[2] = v15;
    __int16 v47 = 2112;
    uint64_t v48 = v18;
    __int16 v49 = 2112;
    id v50 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<%@> link: %@ didReceiveSessionStats for group: %@ session: %@ success: %@ %@.",  buf,  0x3Eu);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> link: %@ didReceiveSessionStats for group: %@ session: %@ success: %@ %@.");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link: %@ didReceiveSessionStats for group: %@ session: %@ success: %@ %@.");
      }
    }
  }

  if (v7)
  {
    uint64_t v21 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSGlobalLinkOptionLinkIDKey]);
    if (v22)
    {
      CFDictionarySetValue(v21, IDSDataChannelLinkIDKey, v22);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100698D3C();
    }

    dispatch_block_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSGlobalLinkOptionStatsIdentifierKey]);
    if (v23)
    {
      CFDictionarySetValue(v21, IDSDataChannelStatIdentifierKey, v23);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100698E58();
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSGlobalLinkOptionStatsRTTKey]);
    if (v24)
    {
      CFDictionarySetValue(v21, IDSDataChannelStatRTTKey, v24);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100698DD8();
    }

    id v44 = 0LL;
    id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v21,  0LL,  &v44));
    id v25 = v44;
    if (v25)
    {
      uint64_t v26 = OSLogHandleForTransportCategory("IDSDSession");
      unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 groupID]);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&_BYTE buf[24] = v29;
        *(_WORD *)char v46 = 2112;
        *(void *)&v46[2] = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "<%@> link: %@ didReceiveSessionStats failed to encode stats response for group %@ (error: %@)",  buf,  0x2Au);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          double v39 = (void *)objc_claimAutoreleasedReturnValue([v32 groupID]);
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"<%@> link: %@ didReceiveSessionStats failed to encode stats response for group %@ (error: %@)");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", self, v12, v39, v25));
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v33 groupID]);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> link: %@ didReceiveSessionStats failed to encode stats response for group %@ (error: %@)");
          }
        }
      }

      goto LABEL_36;
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    if (([v34 useQRDirectly] & 1) == 0)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      if ([v35 clientType] != (id)1)
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        if ([v42 clientType] != (id)5)
        {
          double v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          BOOL v41 = [v38 clientType] == (id)6;

          if (!v41) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
    }

LABEL_35:
    *(void *)char v46 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v36 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v36;
    *(_OWORD *)&uint8_t buf[16] = v36;
    IDSByteBufferInitForWrite(buf);
    id v37 = v43;
    IDSByteBufferWriteField(buf, 40, [v37 bytes], (unsigned __int16)objc_msgSend(v37, "length"));
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
LABEL_36:
  }
}

- (BOOL)destinationsContainFromURI:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tokenFreeURI]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 destinations]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (int i = 0LL; i != v9; int i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (([v12 isEqualToURI:v4] & 1) != 0
          || ([v12 isEqualToURI:v5] & 1) != 0)
        {
          BOOL v20 = 1;
          goto LABEL_17;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 destinations]);
    *(_DWORD *)buf = 138412546;
    id v29 = v4;
    __int16 v30 = 2112;
    uint64_t v31 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "destinationsContainFromURI: %@ is not in the destinations %@",  buf,  0x16u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18
    && _IDSShouldLogTransport(v18)
    && (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState")),
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 destinations]),
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"destinationsContainFromURI: %@ is not in the destinations %@"),  v22,  v19,  _IDSShouldLog(0LL, @"IDSDSession")))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v4, v22));
    dispatch_block_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 destinations]);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"destinationsContainFromURI: %@ is not in the destinations %@");

    BOOL v20 = 0;
LABEL_17:
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6 lightweightStatusDict:(id)a7
{
  BOOL v169 = a6;
  id v175 = a3;
  id v170 = a4;
  id v176 = a5;
  id v177 = (NSMutableDictionary *)a7;
  uint64_t v181 = self;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v178 = (void *)objc_claimAutoreleasedReturnValue([v11 destinations]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  __int128 v174 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationsLightweightStatus]);

  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472LL;
  v207[2] = sub_1000A9308;
  v207[3] = &unk_1008F64D0;
  v207[4] = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "__imArrayByApplyingBlock:", v207));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "__imSetFromArray"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v15 setDestinations:v14];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v16 setDestinationsLightweightStatus:v177];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 destinations]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 destinationsLightweightStatus]);
  char v168 = sub_1001A1C20(v178, v174, v18, v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 destinations]);
  unsigned int v23 = [v178 isEqualToSet:v22];
  if (v176) {
    unsigned int v24 = 0;
  }
  else {
    unsigned int v24 = v23;
  }

  if (v24)
  {
    uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Ignored updateMembers since destinations have not been changed.",  buf,  2u);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Ignored updateMembers since destinations have not been changed.");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Ignored updateMembers since destinations have not been changed.");
        }
      }
    }
  }

  else
  {
    id v179 = [v178 count];
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 destinations]);
    id v172 = [v30 count];

    if (v179 > v172)
    {
      __int128 v171 = 0LL;
      int v41 = 2;
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 destinations]);
      __int128 v171 = (NSMutableDictionary *)[v32 mutableCopy];

      -[NSMutableDictionary minusSet:](v171, "minusSet:", v178);
      uint64_t v33 = OSLogHandleForTransportCategory("IDSDSession");
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v212 = v171;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "updateMembers: newly added destinations: %@",  buf,  0xCu);
      }

      uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
      if ((_DWORD)v36)
      {
        if (_IDSShouldLogTransport(v36))
        {
          id v147 = v171;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"updateMembers: newly added destinations: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            id v147 = v171;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"updateMembers: newly added destinations: %@");
          }
        }
      }

      if (v181->_supportUnauthenticatedUser)
      {
        if (-[IDSDSession shouldAllocateForInvitee](v181, "shouldAllocateForInvitee") && v169)
        {
LABEL_31:
          id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](v181, "accountController", v147));
          id v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 accountID]);
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v42 accountWithUniqueID:v44]);
          id v37 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v45 _registrationCert]);

          char v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v46 getQuickRelayAllocateOptions:&off_1009469A8]);

          __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 groupID]);

          if (v48)
          {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_GroupID, v48);
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100698ED8();
          }

          CFDictionarySetValue(theDict, kIDSQRAllocateKey_AllocateRequestForUnauthorizedUser, &__kCFBooleanTrue);
          uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](v181, "qrAllocator"));
          __int128 v164 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue([v164 destinations]);
          uint64_t v152 = (void *)objc_claimAutoreleasedReturnValue([v162 allObjects]);
          v160 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue([v160 uniqueID]);
          uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          id v156 = (void *)objc_claimAutoreleasedReturnValue([v158 fromURI]);
          __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v156 unprefixedURI]);
          id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 _bestGuessURI]);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](v181, "accountController"));
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
          unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 accountID]);
          BOOL v54 = (void *)objc_claimAutoreleasedReturnValue([v51 accountWithUniqueID:v53]);
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 service]);
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 identifier]);
          id v57 =  [v154 setupNewAllocation:v152 sessionID:v150 fromIdentity:v37 fromURI:v50 fromService:v56 options:theDict connectReadyHandler:0];
        }

        else
        {
          __int128 v205 = 0u;
          __int128 v206 = 0u;
          __int128 v203 = 0u;
          __int128 v204 = 0u;
          id v37 = v171;
          id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v203,  v217,  16LL);
          if (v38)
          {
            uint64_t v39 = *(void *)v204;
            while (2)
            {
              for (int i = 0LL; i != v38; int i = (char *)i + 1)
              {
                if (*(void *)v204 != v39) {
                  objc_enumerationMutation(v37);
                }
                if (objc_msgSend( *(id *)(*((void *)&v203 + 1) + 8 * (void)i),  "isTemporaryURI",  v147))
                {

                  goto LABEL_31;
                }
              }

              id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v203,  v217,  16LL);
              if (v38) {
                continue;
              }
              break;
            }
          }
        }
      }

      int v41 = 1;
    }

    unsigned int theDicta = v41;
    uint64_t v58 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      dispatch_block_t v61 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v60 groupID]);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      uint64_t v63 = objc_claimAutoreleasedReturnValue([v62 destinations]);
      uint64_t v64 = (void *)v63;
      __int16 v65 = @"NO";
      *(_DWORD *)buf = 138412802;
      __int16 v212 = v61;
      __int16 v213 = 2112;
      if (v169) {
        __int16 v65 = @"YES";
      }
      uint64_t v214 = v63;
      __int16 v215 = 2112;
      uint64_t v216 = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Updated destinations for group %@ to %@ (triggeredLocally %@)",  buf,  0x20u);
    }

    uint64_t v67 = os_log_shim_legacy_logging_enabled(v66);
    if ((_DWORD)v67 && _IDSShouldLogTransport(v67))
    {
      id v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      id v69 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v68 groupID]);
      id v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      uint64_t v71 = objc_claimAutoreleasedReturnValue([v70 destinations]);
      id v72 = (void *)v71;
      __int16 v73 = v169 ? @"YES" : @"NO";
      id v148 = (void *)v71;
      uint64_t v149 = v73;
      id v147 = v69;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Updated destinations for group %@ to %@ (triggeredLocally %@)");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState", v69, v148, v73));
        uint64_t v75 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v74 groupID]);
        id v76 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
        id v148 = (void *)objc_claimAutoreleasedReturnValue([v76 destinations]);
        uint64_t v149 = v73;
        id v147 = v75;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Updated destinations for group %@ to %@ (triggeredLocally %@)");
      }
    }

    if (v177)
    {
      uint64_t v77 = OSLogHandleForTransportCategory("IDSDSession");
      id v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v212 = v177;
        _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Updated destinations have lightweight status values: %@",  buf,  0xCu);
      }

      uint64_t v80 = os_log_shim_legacy_logging_enabled(v79);
      if ((_DWORD)v80)
      {
        if (_IDSShouldLogTransport(v80))
        {
          id v147 = v177;
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Updated destinations have lightweight status values: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            id v147 = v177;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Updated destinations have lightweight status values: %@");
          }
        }
      }
    }

    BOOL v81 = v179 <= v172;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946AE0,  IDSDSessionReportTransportTypeKey);
    int v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", theDicta));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v82,  IDSDSessionReportMembershipChangeTypeKey);

    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946A08,  IDSDSessionReportResultCodeKey);
    -[IDSDSession addQREventForRTCReport:](v181, "addQREventForRTCReport:", Mutable);
    __int128 v83 = v181;
    if (v181->_isLightweightParticipant && v81)
    {
      __int16 v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
      BOOL v86 = (void *)objc_claimAutoreleasedReturnValue([v85 destinations]);
      id v87 = [v86 mutableCopy];

      [v87 minusSet:v178];
      __int128 v201 = 0u;
      __int128 v202 = 0u;
      __int128 v199 = 0u;
      __int128 v200 = 0u;
      id v88 = v87;
      id v89 = [v88 countByEnumeratingWithState:&v199 objects:v210 count:16];
      uint64_t v90 = v88;
      if (v89)
      {
        uint64_t v91 = *(void *)v200;
        while (2)
        {
          for (uint64_t j = 0LL; j != v89; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v200 != v91) {
              objc_enumerationMutation(v88);
            }
            id v93 = *(void **)(*((void *)&v199 + 1) + 8LL * (void)j);
            id v94 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](v181, "qrAllocator", v147, v148, v149));
            id v95 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
            uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v95 groupID]);
            unsigned int v97 = (void *)objc_claimAutoreleasedReturnValue([v93 prefixedURI]);
            LODWORD(v93) = [v94 isURIAvailabeInAllocateResponse:v96 uri:v97];

            if (!(_DWORD)v93)
            {

              uint64_t v98 = OSLogHandleForTransportCategory("IDSDSession");
              id v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "Re-allocating due to new member",  buf,  2u);
              }

              uint64_t v101 = os_log_shim_legacy_logging_enabled(v100);
              if ((_DWORD)v101)
              {
                if (_IDSShouldLogTransport(v101))
                {
                  _IDSLogTransport(@"IDSDSession", @"IDS", @"Re-allocating due to new member");
                  if (_IDSShouldLog(0LL, @"IDSDSession")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Re-allocating due to new member");
                  }
                }
              }

              __int16 v102 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](v181, "accountController"));
              uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              v104 = (void *)objc_claimAutoreleasedReturnValue([v103 accountID]);
              __int128 v105 = (void *)objc_claimAutoreleasedReturnValue([v102 accountWithUniqueID:v104]);
              uint64_t v163 = objc_claimAutoreleasedReturnValue([v105 _registrationCert]);

              id v106 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              id v180 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v106 getQuickRelayAllocateOptions:&off_1009469A8]);

              uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              BOOL v108 = (void *)objc_claimAutoreleasedReturnValue([v107 groupID]);

              if (v108)
              {
                CFDictionarySetValue(v180, kIDSQRAllocateKey_GroupID, v108);
              }

              else
              {
                id v109 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100698ED8();
                }
              }

              id v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v181->_isLightweightParticipant));
              if (v110) {
                CFDictionarySetValue(v180, kIDSQRAllocateKey_IsLightweightParticipant, v110);
              }

              id v111 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](v181, "qrAllocator"));
              __int128 v165 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              unint64_t v161 = (void *)objc_claimAutoreleasedReturnValue([v165 destinations]);
              id v153 = (void *)objc_claimAutoreleasedReturnValue([v161 allObjects]);
              id v159 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              v151 = (void *)objc_claimAutoreleasedReturnValue([v159 uniqueID]);
              id v157 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              v155 = (void *)objc_claimAutoreleasedReturnValue([v157 fromURI]);
              uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v155 unprefixedURI]);
              double v113 = (void *)objc_claimAutoreleasedReturnValue([v112 _bestGuessURI]);
              uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](v181, "accountController"));
              __int16 v115 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](v181, "sharedState"));
              unint64_t v116 = (void *)objc_claimAutoreleasedReturnValue([v115 accountID]);
              id v117 = (void *)objc_claimAutoreleasedReturnValue([v114 accountWithUniqueID:v116]);
              uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue([v117 service]);
              uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue([v118 identifier]);
              id v120 =  [v111 setupNewAllocation:v153 sessionID:v151 fromIdentity:v163 fromURI:v113 fromService:v119 options:v180 connectReadyHandler:0];

              uint64_t v90 = (void *)v163;
              goto LABEL_83;
            }
          }

          id v89 = [v88 countByEnumeratingWithState:&v199 objects:v210 count:16];
          if (v89) {
            continue;
          }
          break;
        }

        uint64_t v90 = v88;
      }

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 groupID]);
    *(_DWORD *)buf = 138412546;
    unsigned int v24 = v11;
    __int16 v25 = 2112;
    __int128 v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "manageDesignatedMembers for group %@ to %@",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 groupID]);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"manageDesignatedMembers for group %@ to %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v18, v7));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"manageDesignatedMembers for group %@ to %@");
      }
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000A9F7C;
  v20[3] = &unk_1008F8F98;
  v20[4] = self;
  id v21 = v7;
  unsigned __int16 v22 = a4;
  id v16 = v7;
  IDSTransportThreadAddBlock(v20, v17);
}

- (void)removeParticipantIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 groupID]);
    *(_DWORD *)buf = 138412546;
    BOOL v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "removeParticipantIDs for group %@ to %@",  buf,  0x16u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 groupID]);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"removeParticipantIDs for group %@ to %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v15, v4));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"removeParticipantIDs for group %@ to %@");
      }
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000AA208;
  v17[3] = &unk_1008F8800;
  v17[4] = self;
  id v18 = v4;
  id v13 = v4;
  IDSTransportThreadAddBlock(v17, v14);
}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "updateParticipantData: new participantData: %@",  buf,  0xCu);
  }

  uint64_t v11 = im_primary_queue(v9, v10);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA3D8;
  block[3] = &unk_1008F5F58;
  void block[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v12, v15);
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "updateParticipantInfo: new participantInfo: %@",  (uint8_t *)&v15,  0xCu);
  }

  -[IDSGroupStatusNotificationParameters setParticipantInfo:]( self->_groupStatusNotificationParams,  "setParticipantInfo:",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[IDSDSession formAndEncryptDataBlob:type:](self, "formAndEncryptDataBlob:type:", v7, 12LL));

    os_unfair_lock_lock(&self->_lock);
    encryptedDataBlob = self->_encryptedDataBlob;
    self->_encryptedDataBlob = v8;

    os_unfair_lock_unlock(&self->_lock);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
  [v10 updateServerDesiredKeyMaterialsForGroup:v12 sessionID:v14];
}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 triggeredLocally:(BOOL)a5 withContext:(id)a6 lightweightStatusDict:(id)a7
{
  uint64_t v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (!a5)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v27 setDestinationsLightweightStatus:v14];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 groupID]);

    if (v29)
    {
      uint64_t v32 = im_primary_queue(v30, v31);
      uint64_t v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000AACAC;
      block[3] = &unk_1008F7DE0;
      void block[4] = self;
      id v69 = v12;
      BOOL v70 = a5;
      dispatch_block_t v34 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
      dispatch_async(v33, v34);

      uint64_t v35 = v69;
LABEL_14:

      goto LABEL_20;
    }

    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100698FE8();
    }
LABEL_19:

    goto LABEL_20;
  }

  if (v10 >= 2)
  {
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100698F84(v10, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_19;
  }

  int isLightweightParticipant = self->_isLightweightParticipant;
  int v16 = v10 == 0;
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (isLightweightParticipant != v16)
  {
    if (v18)
    {
      id v43 = @"NO";
      *(_DWORD *)buf = 138413058;
      if ((_DWORD)v10) {
        id v44 = @"NO";
      }
      else {
        id v44 = @"YES";
      }
      id v72 = (IDSDSession *)v44;
      __int16 v73 = 2112;
      if (isLightweightParticipant) {
        id v43 = @"YES";
      }
      *(void *)id v74 = v43;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v10;
      __int16 v75 = 2112;
      id v76 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "updateParticipantType: to: %@, wasLightweightParticipant: %@, type: %u, lightweightStatusDict: %@",  buf,  0x26u);
    }

    id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      char v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v46 groupID]);
      *(_DWORD *)buf = 138412546;
      id v72 = self;
      __int16 v73 = 2112;
      *(void *)id v74 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "<%@> updateParticipantType: reset MKM status for %@",  buf,  0x16u);
    }

    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 groupID]);
    [v48 resetMKMLocalSentStatus:v50];

    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 groupID]);

    if (v52)
    {
      self->_int isLightweightParticipant = v16;
      unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v53 setDestinationsLightweightStatus:v14];

      if (self->_isLightweightParticipant)
      {
        id v54 = -[IDSDSession unregisterClientChannel](self, "unregisterClientChannel");
      }

      else
      {
        -[IDSDSession registerClientChannel](self, "registerClientChannel");
        id v54 = -[IDSDSession _sendConnectedLinkInfoToAVC](self, "_sendConnectedLinkInfoToAVC");
      }

      uint64_t v56 = im_primary_queue(v54, v55);
      id v57 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v56);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000AAD8C;
      v64[3] = &unk_1008F8DE0;
      v64[4] = self;
      id v65 = v12;
      BOOL v67 = a5;
      __int16 v66 = v10;
      dispatch_block_t v58 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v64);
      dispatch_async(v57, v58);

      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_1000AAF10;
      v62[3] = &unk_1008F8FC0;
      v62[4] = self;
      __int16 v63 = v10;
      IDSTransportThreadAddBlock(v62, v59);
      uint64_t v35 = v65;
      goto LABEL_14;
    }

    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100698F58();
    }
    goto LABEL_19;
  }

  if (v18)
  {
    uint64_t v19 = @"YES";
    BOOL v20 = self->_isLightweightParticipant;
    *(_DWORD *)buf = 138413058;
    if (isLightweightParticipant) {
      __int16 v21 = @"YES";
    }
    else {
      __int16 v21 = @"NO";
    }
    id v72 = (IDSDSession *)v21;
    __int16 v73 = 1024;
    if (!v20) {
      uint64_t v19 = @"NO";
    }
    *(_DWORD *)id v74 = v10;
    *(_WORD *)&v74[4] = 2112;
    *(void *)&v74[6] = v19;
    __int16 v75 = 2112;
    id v76 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "updateParticipantType: No need to change the type: wasLightweightParticipant: %@, type: %u, current: %@, lightweig htStatusDict: %@",  buf,  0x26u);
  }

  uint64_t v24 = im_primary_queue(v22, v23);
  __int16 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000AAF90;
  v60[3] = &unk_1008F87D8;
  v60[4] = self;
  __int16 v61 = v10;
  dispatch_block_t v26 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v60);
  dispatch_async(v25, v26);

LABEL_20:
}

- (void)_sendConnectedLinkInfoToAVC
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000AB0D0;
  v2[3] = &unk_1008F7948;
  v2[4] = self;
  IDSTransportThreadAddBlock(v2, a2);
}

- (void)setGroupStreamInfo:(id)a3 sessionInfo:(id)a4
{
  id v49 = a3;
  theDict = (__CFDictionary *)a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v49 maxConcurrentStreams]);
  if (v5) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams, v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v49 generationCounter]);
  if (v6) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoGenerationCounter, v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v49 publishedStreams]);
  if (v7) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoPublishedStreams, v7);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v49 subscribedStreams]);
  id value = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v9 = IDSGroupSessionAllParticipantsKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IDSGroupSessionAllParticipantsKey]);

  if (!v10)
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v17 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t v18 = *(void *)v54;
    uint64_t v19 = IDSGroupSessionAllStreamsKey;
    while (1)
    {
      for (int i = 0LL; i != v17; int i = (char *)i + 1)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v21]);
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
        {
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v21]);
          unsigned int v26 = [v25 isEqualToString:v19];

          if (v26)
          {
            id v27 = (id)objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  v21,  0LL,  0LL,  1LL));
            [value addObject:v27];
            goto LABEL_21;
          }
        }

        else
        {
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v21]);
        id v27 = [v28 mutableCopy];

        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  v21,  v27,  0LL,  0LL));
        [value addObject:v29];

LABEL_21:
      }

      id v17 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (!v17)
      {
LABEL_23:

        uint64_t v30 = value;
        goto LABEL_32;
      }
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
  {

LABEL_25:
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString, v32);
    if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0)
    {
      dispatch_block_t v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
      unsigned int v35 = [v34 isEqualToString:IDSGroupSessionNoStreamsKey];

      if (v35)
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  0LL,  0LL,  1LL,  0LL));
        goto LABEL_28;
      }
    }

    else
    {
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  0LL,  v37,  1LL,  0LL));

    goto LABEL_31;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  unsigned int v15 = [v14 isEqualToString:IDSGroupSessionAllStreamsKey];

  if (!v15) {
    goto LABEL_25;
  }
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[IDSQRParticipantStreams streamWithParticipantID:streamArray:anyParticipant:anyStream:]( &OBJC_CLASS___IDSQRParticipantStreams,  "streamWithParticipantID:streamArray:anyParticipant:anyStream:",  0LL,  0LL,  1LL,  1LL));
LABEL_28:
  uint64_t v36 = (void *)v16;
LABEL_31:
  uint64_t v30 = value;
  [value addObject:v36];

LABEL_32:
  if (v30) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoSubscribedStreams, v30);
  }
  uint64_t v38 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( theDict,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_StreamInfoSubscribedStreams));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v49 subscribedStreams]);
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v58 = v40;
    __int16 v59 = 2112;
    __int128 v60 = theDict;
    __int16 v61 = 2112;
    uint64_t v62 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "setGroupStreamInfo: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@, sessionInfo:%@, streamInfo.subs cribedStreams:%@",  buf,  0x20u);
  }

  uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
  if ((_DWORD)v43)
  {
    if (_IDSShouldLogTransport(v43))
    {
      uint64_t v44 = kIDSQRAllocateKey_StreamInfoSubscribedStreams;
      id v45 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( theDict,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_StreamInfoSubscribedStreams));
      __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v49 subscribedStreams]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"setGroupStreamInfo: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@, sessionInfo:%@, streamInfo.subscribedStreams:%@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        char v46 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( theDict,  "objectForKeyedSubscript:",  v44,  v45,  theDict,  v47));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v49 subscribedStreams]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"setGroupStreamInfo: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@, sessionInfo:%@, streamInfo.subscribedStreams:%@");
      }
    }
  }
}

- (id)_checkIfPushMessageSizeGreaterThanMaxLimit:(id)a3 maxLimit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 length];
  if ((unint64_t)v7 <= a4)
  {
    uint64_t v19 = 0LL;
  }

  else
  {
    id v8 = v7;
    uint64_t v9 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupID]);
      *(_DWORD *)buf = 134218242;
      unint64_t v26 = a4;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client data blob size is greater than push size limitation which is %ld and groupID: %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Client data blob size is greater than push size limitation which is %ld and groupID: %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", a4, v21));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 groupID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Client data blob size is greater than push size limitation which is %ld and groupID: %@");
        }
      }
    }

    id v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Client data blob size %lu is greater than push size limitation %ld",  v8,  a4);
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    uint64_t v24 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"joinGroupSessionError",  -1000LL,  v18));
  }

  return v19;
}

- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3
{
  uint64_t v4 = qword_1009BE930;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1009BE930, &stru_1008F91C0);
  }
  self->_idsContextTimeStamp = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:timeStamp:]( self,  "_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:timeStamp:",  v5));

  return v6;
}

- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3 timeStamp:(double)a4
{
  id v28 = a3;
  double v32 = a4;
  id v29 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v32,  8LL);
  if (v28) {
    -[NSMutableData appendData:](v29, "appendData:", v28);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession formAndEncryptDataBlob:type:](self, "formAndEncryptDataBlob:type:", v29, 7LL));
  id v7 = v6;
  if (v6)
  {
    id v31 = [v6 length];
    __int16 v27 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v31,  8LL);
    -[NSMutableData appendData:](v27, "appendData:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 accountWithUniqueID:v11]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    id v30 = 0LL;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( [v8 publicKeySignData:v27 withSignatureType:0 service:v14 priority:300 error:&v30]);
    id v16 = v30;

    if (!v15 || v16)
    {
      uint64_t v22 = OSLogHandleForTransportCategory("IDSDSession");
      NSErrorUserInfoKey v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Unable to sign the encrypted blob with error :%@",  buf,  0xCu);
      }

      uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
      if ((_DWORD)v25)
      {
        if (_IDSShouldLogTransport(v25))
        {
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Unable to sign the encrypted blob with error :%@");
          if (_IDSShouldLog(0LL, @"IDSDSession")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Unable to sign the encrypted blob with error :%@");
          }
        }
      }

      id v17 = 0LL;
    }

    else
    {
      id v17 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v27);
      -[NSMutableData appendData:](v17, "appendData:", v15);
    }
  }

  else
  {
    uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to encrypt the blob!", buf, 2u);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"Unable to encrypt the blob!");
      }
    }

    id v17 = 0LL;
  }

  return v17;
}

- (double)getIDSContextTimeStamp
{
  return self->_idsContextTimeStamp;
}

- (void)joinWithOptions:(id)a3
{
}

- (void)joinWithOptions:(id)a3 messageContext:(id)a4
{
  id v208 = a3;
  id v205 = a4;
  if (self->_joinStartTime == 0.0)
  {
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_joinStartTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  __int128 v203 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"-"]);

  theDict = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(theDict, @"state", &off_100946AC8);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( self->_serviceIdentifier,  "substringFromIndex:",  [@"com.apple.private.alloy." length]));
  if (v8) {
    CFDictionarySetValue(theDict, @"serviceName", v8);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v203 objectAtIndexedSubscript:0]);
  if (v9) {
    CFDictionarySetValue(theDict, @"sessionID", v9);
  }

  IDSPowerLogDictionary(@"IDSDSession", theDict);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 getSessionInfoFromDefaults:v12 groupID:v14]);
  __int128 v204 = (__CFDictionary *)[v15 mutableCopy];

  id v16 = objc_alloc_init(&OBJC_CLASS___IDSGroupStatusNotificationParameters);
  groupStatusNotificationParams = self->_groupStatusNotificationParams;
  self->_groupStatusNotificationParams = v16;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionIsInitiatorKey]);
  -[IDSGroupStatusNotificationParameters setIsInitiator:](self->_groupStatusNotificationParams, "setIsInitiator:", v18);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionJoinTypeKey]);
  -[IDSGroupStatusNotificationParameters setJoinType:](self->_groupStatusNotificationParams, "setJoinType:", v19);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionParticipantDataKey]);
  -[IDSGroupStatusNotificationParameters setParticipantData:]( self->_groupStatusNotificationParams,  "setParticipantData:",  v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionParticipantInfoKey]);
  -[IDSGroupStatusNotificationParameters setParticipantInfo:]( self->_groupStatusNotificationParams,  "setParticipantInfo:",  v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionPublishedStreamsKey]);
  -[IDSGroupStatusNotificationParameters setPublishedStreams:]( self->_groupStatusNotificationParams,  "setPublishedStreams:",  v22);

  NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionSubscribedStreamsKey]);
  -[IDSGroupStatusNotificationParameters setSubscribedStreams:]( self->_groupStatusNotificationParams,  "setSubscribedStreams:",  v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionMaxConcurrentStreamsKey]);
  -[IDSGroupStatusNotificationParameters setMaxConcurrentStreams:]( self->_groupStatusNotificationParams,  "setMaxConcurrentStreams:",  v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionGenerationCounterKey]);
  -[IDSGroupStatusNotificationParameters setGenerationCounter:]( self->_groupStatusNotificationParams,  "setGenerationCounter:",  v25);

  uint64_t v26 = IDSGroupSessionClientContextDataKey;
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionClientContextDataKey]);
  -[IDSGroupStatusNotificationParameters setClientJoinContextData:]( self->_groupStatusNotificationParams,  "setClientJoinContextData:",  v27);

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionCommandContextKey]);
  -[IDSGroupStatusNotificationParameters setCommandContext:]( self->_groupStatusNotificationParams,  "setCommandContext:",  v28);

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionMirageProtocolHandshakeBlobKey]);
  -[IDSGroupStatusNotificationParameters setParticipantMirageHandshakeBlob:]( self->_groupStatusNotificationParams,  "setParticipantMirageHandshakeBlob:",  v29);

  self->_unsigned int groupSessionState = 0;
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionStartedAsUPlusOneKey]);
  self->_BOOL startedAsUPlusOneSession = [v30 BOOLValue];

  id v31 = (NSNumber *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters commandContext]( self->_groupStatusNotificationParams,  "commandContext"));
  callType = self->_callType;
  self->_callType = v31;

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionNewServerAllocationKey]);
  unsigned int value = [v33 BOOLValue];

  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 uniqueID]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 fromURI]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantData]( self->_groupStatusNotificationParams,  "participantData"));
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantInfo]( self->_groupStatusNotificationParams,  "participantInfo"));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters participantMirageHandshakeBlob]( self->_groupStatusNotificationParams,  "participantMirageHandshakeBlob"));
    uint64_t v42 = self->_callType;
    *(_DWORD *)buf = 138413570;
    *(void *)__int16 v212 = v36;
    *(_WORD *)&v212[8] = 2112;
    *(void *)&v212[10] = v38;
    *(_WORD *)&v212[18] = 2112;
    *(void *)&v212[20] = v39;
    __int16 v213 = 2112;
    uint64_t v214 = v40;
    __int16 v215 = 2112;
    uint64_t v216 = v41;
    __int16 v217 = 2112;
    uint64_t v218 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "joinWithOptions for %@: URI: %@, participantData: %@, participantInfo: %@, handshakeBlob: %@, callType: %@",  buf,  0x3Eu);
  }

  id v43 = -[IDSGFTMetricsCollector localDidJoin](self->_metricsCollector, "localDidJoin");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  unsigned int v45 = [v44 shouldUseGecko];

  if (v45) {
    -[IDSGFTMetricsCollector useGecko](self->_metricsCollector, "useGecko");
  }
  -[IDSDSession updateRelevantEncryptedDataBlob](self, "updateRelevantEncryptedDataBlob");
  char v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v46 setUseQRDirectly:1];

  __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v47 setState:5];

  __int128 v196 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionForceQRKey]);
  uint64_t v48 = IDSGroupSessionCallScreeningMode;
  id v49 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:IDSGroupSessionCallScreeningMode]);
  self->_disableP2PLinks = [v49 BOOLValue];

  id v50 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:v48]);
  self->_sessionIsNonUserParticipantInitiated = [v50 BOOLValue];

  if (self->_sessionIsNonUserParticipantInitiated) {
    uint64_t v51 = &off_100946AF8;
  }
  else {
    uint64_t v51 = &off_100946B10;
  }
  -[IDSGroupStatusNotificationParameters setQuickRelayUserType:]( self->_groupStatusNotificationParams,  "setQuickRelayUserType:",  v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:IDSGroupSessionForceTCPFallbackOnWiFiKey]);
  self->_forceTCPFallbackOnWiFint i = [v52 BOOLValue];

  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:IDSGroupSessionForceTCPFallbackOnCellKey]);
  self->_forceTCPFallbackOnCell = [v53 BOOLValue];

  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:IDSGlobalLinkOptionForceIPv6Key]);
  self->_forceIPid v6 = [v54 BOOLValue];

  if (self->_forceIPv6) {
    self->_preferredAddressFamily = 2LL;
  }
  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472LL;
  id v209[2] = sub_1000AD608;
  v209[3] = &unk_1008F6010;
  id v195 = v205;
  id v210 = v195;
  __int128 v201 = objc_retainBlock(v209);
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 accountID]);
  dispatch_block_t v58 = (void *)objc_claimAutoreleasedReturnValue([v55 accountWithUniqueID:v57]);
  id v59 = [v58 maxRemoteMessagingPayloadSize];

  __int128 v202 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:v26]);
  __int128 v206 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _checkIfPushMessageSizeGreaterThanMaxLimit:maxLimit:]( self,  "_checkIfPushMessageSizeGreaterThanMaxLimit:maxLimit:",  v202,  v59));
  if (v206)
  {
    ((void (*)(void))v201[2])();
    valueb = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](valueb, "setShouldBoost:", 1LL);
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 pushTopic]);
    id v177 = (void *)objc_claimAutoreleasedReturnValue( [v60 broadcasterForTopic:v62 entitlement:kIDSSessionEntitlement command:0 messageContext:valueb]);

    id v174 = objc_alloc(&OBJC_CLASS___IDSGroupSessionParticipantUpdate);
    __int16 v63 = objc_alloc(&OBJC_CLASS___NSUUID);
    __int128 v193 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    CFMutableDictionaryRef v191 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue([v193 groupID]);
    id v179 = -[NSUUID initWithUUIDString:](v63, "initWithUUIDString:", v191);
    BOOL v189 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters isInitiator]( self->_groupStatusNotificationParams,  "isInitiator"));
    unsigned int v172 = [v189 BOOLValue];
    uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
    id v187 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v183 = (void *)objc_claimAutoreleasedReturnValue([v187 accountID]);
    uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue([v185 accountWithUniqueID:v183]);
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v181 primaryRegistration]);
    id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 pushToken]);
    __int16 v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v67 = (void *)objc_claimAutoreleasedReturnValue([v66 fromURI]);
    id v68 = (void *)objc_claimAutoreleasedReturnValue([v67 prefixedURI]);
    id v69 = (void *)_IDSCopyIDForTokenWithURI(v65, v68);
    BOOL v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters joinType](self->_groupStatusNotificationParams, "joinType"));
    BOOL v71 = [v70 integerValue] == (id)1;
    id v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    LOBYTE(v167) = 0;
    id v175 = [v174 initWithGroupUUID:v179 isInitiator:v172 participantIdentifier:0 participantDestinationID:v69 participantUpdateType:1 particip antUpdateSubtype:v71 fromServer:v167 serverDate:v72 participantData:0 clientContextData:0 members:0 participantIDs:0 relaySessionID:0];

    __int16 v73 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v74 = (void *)objc_claimAutoreleasedReturnValue([v73 uniqueID]);
    __int16 v75 = (void *)objc_claimAutoreleasedReturnValue([v175 dictionaryRepresentation]);
    [v177 sessionDidJoinGroup:v74 participantUpdateDictionary:v75 error:v206];

    goto LABEL_60;
  }

  id v76 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  [v76 updateCriticalReliabilityState];

  self->_BOOL sharedSessionHasJoined = 1;
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  BOOL sharedSessionHasJoined = self->_sharedSessionHasJoined;
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v79 uniqueID]);
  [v77 setSharedSessionHasJoined:sharedSessionHasJoined forIDSSession:v80];

  if (v204)
  {
    CFDictionarySetValue(v204, kIDSQRAllocateKey_AllocateType, &off_1009469A8);
    BOOL v81 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    int v82 = (void *)objc_claimAutoreleasedReturnValue([v81 groupID]);

    if (v82)
    {
      CFDictionarySetValue(v204, kIDSQRAllocateKey_GroupID, v82);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100699114();
    }

    -[IDSDSession setGroupStreamInfo:sessionInfo:]( self,  "setGroupStreamInfo:sessionInfo:",  self->_groupStatusNotificationParams,  v204);
    if ([v196 isEqualToIgnoringCase:@"yes"])
    {
      id v109 = IDSGroupSessionForceQRSession;
      if (v109)
      {
        CFDictionarySetValue(v204, kIDSQRAllocateKey_TestOptions, v109);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100699094();
      }
    }

    -[IDSDSession connectQRServer:withPreferredLocalInterface:]( self,  "connectQRServer:withPreferredLocalInterface:",  v204,  0LL);
    uint64_t v194 = IDSGroupSessionTimeBaseKey;
LABEL_55:
    valuec = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue([v124 destinations]);
    __int128 v126 = (void *)objc_claimAutoreleasedReturnValue([v125 allObjects]);
    id v127 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue([v127 groupID]);
    uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue([v129 uniqueID]);
    id v131 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v132 = (void *)objc_claimAutoreleasedReturnValue([v131 destinationsLightweightStatus]);
    [valuec setMembers:v126 forGroup:v128 sessionID:v130 lightweightStatusDict:v132];

    uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:v194]);
    if (!v133) {
      uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    }
    uint64_t v134 = GLUCreateSetUPlusOneEvent(self->_startedAsUPlusOneSession, v133);
    uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
    if (v135) {
      -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", v135);
    }
    ((void (*)(void))v201[2])();

    goto LABEL_60;
  }

  __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 groupID]);
  if (v84)
  {
    __int16 v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v86 = (void *)objc_claimAutoreleasedReturnValue([v85 destinations]);
    BOOL v87 = v86 == 0LL;

    if (!v87)
    {
      if (self->_qrReason)
      {
        id v88 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
        id v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue([v89 groupID]);
        id v91 = objc_msgSend( v88,  "invalidateLatestResponse:qrReason:previousError:",  v90,  (unsigned __int16)-[NSNumber intValue](self->_qrReason, "intValue"),  (unsigned __int16)-[NSNumber intValue](self->_qrError, "intValue"));

        uint64_t v92 = OSLogHandleForTransportCategory("IDSDSession");
        id v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          qrReason = self->_qrReason;
          qrError = self->_qrError;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)__int16 v212 = (_DWORD)v91;
          *(_WORD *)&v212[4] = 2112;
          *(void *)&v212[6] = qrReason;
          *(_WORD *)&v212[14] = 2112;
          *(void *)&v212[16] = qrError;
          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "invalidateLatestResponse status: %d, reason: %@, error: %@",  buf,  0x1Cu);
        }

        uint64_t v97 = os_log_shim_legacy_logging_enabled(v96);
        if ((_DWORD)v97)
        {
          if (_IDSShouldLogTransport(v97))
          {
            char v168 = self->_qrReason;
            __int128 v171 = self->_qrError;
            unint64_t v167 = v91;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"invalidateLatestResponse status: %d, reason: %@, error: %@");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              char v168 = self->_qrReason;
              __int128 v171 = self->_qrError;
              unint64_t v167 = (unint64_t)v91;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"invalidateLatestResponse status: %d, reason: %@, error: %@");
            }
          }
        }
      }

      if (self->_handOffOverQREnabled)
      {
        uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:]( self,  "_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:",  0LL));
        if (v98)
        {
          id v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
          uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue([v100 uniqueID]);
          [v99 setIDSContextBlob:v98 forIDSSession:v101];
        }
      }

      __int16 v102 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController", v167, v168, v171));
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v104 = (void *)objc_claimAutoreleasedReturnValue([v103 accountID]);
      __int128 v105 = (void *)objc_claimAutoreleasedReturnValue([v102 accountWithUniqueID:v104]);
      char v188 = (void *)objc_claimAutoreleasedReturnValue([v105 _registrationCert]);

      id v106 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int128 v192 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v106 getQuickRelayAllocateOptions:&off_1009469A8]);

      CFDictionarySetValue(v192, kIDSQRAllocateKey_AllocateType, &off_1009469A8);
      uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      BOOL v108 = (void *)objc_claimAutoreleasedReturnValue([v107 groupID]);

      if (v108)
      {
        CFDictionarySetValue(v192, kIDSQRAllocateKey_GroupID, v108);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100698ED8();
      }

      if ([v196 isEqualToIgnoringCase:@"yes"])
      {
        id v136 = IDSGroupSessionForceQRSession;
        if (v136)
        {
          CFDictionarySetValue(v192, kIDSQRAllocateKey_TestOptions, v136);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100699014();
        }
      }

      -[IDSDSession setGroupStreamInfo:sessionInfo:]( self,  "setGroupStreamInfo:sessionInfo:",  self->_groupStatusNotificationParams,  v192);
      -[IDSDSession setShouldConnectToQRServer:](self, "setShouldConnectToQRServer:", 1LL);
      CFDictionarySetValue(v192, kIDSQRAllocateKey_IsJoinAllocation, &__kCFBooleanTrue);
      if (value) {
        CFDictionarySetValue(v192, kIDSQRAllocateKey_IsNewUPlusOneSession, &__kCFBooleanTrue);
      }
      id v137 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionIsReliableUnicastSession]);
      id v138 = [v137 BOOLValue];

      uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
      uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v141 = [v140 isInitiator];
      v142 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue([v142 uniqueID]);
      [v139 setIsReliableUnicastSession:v138 isClient:v141 forIDSSession:v143];

      if ((_DWORD)v138)
      {
        uint64_t v144 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v145 = [v144 isInitiator];

        dispatch_block_t v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v145 ^ 1));
        if (v146) {
          CFDictionarySetValue(v192, kIDSQRAllocateKey_waitingForAllocation, v146);
        }
      }

      if (self->_disableP2PLinks)
      {
        id v147 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
        id v148 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue([v148 uniqueID]);
        [v147 setAllowP2PforIDSSession:v149 isEnabled:0];
      }

      char v190 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:IDSGroupSessionConversationIDKey]);
      if (v190) {
        CFDictionarySetValue(v192, kIDSQRAllocateKey_ConversationID, v190);
      }
      uint64_t v194 = IDSGroupSessionTimeBaseKey;
      id valuea = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "objectForKeyedSubscript:"));
      if (valuea)
      {
        CFDictionarySetValue(v192, kIDSQRAllocateKey_TimeBase, valuea);

        if (qword_1009BE930 != -1) {
          dispatch_once(&qword_1009BE930, &stru_1008F91C0);
        }
        uint64_t v150 = mach_continuous_time();
        double v151 = *(double *)&qword_1009BE938;
        [valuea timeIntervalSinceNow];
        self->_timeBase = v151 * (double)v150 + v152;
        id v153 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
        uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        v155 = (void *)objc_claimAutoreleasedReturnValue([v154 uniqueID]);
        [v153 setTimeBase:valuea forIDSSession:v155];
      }

      id v156 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isLightweightParticipant));
      if (v156) {
        CFDictionarySetValue(v192, kIDSQRAllocateKey_IsLightweightParticipant, v156);
      }

      -[IDSGFTMetricsCollector sendAllocationRequest](self->_metricsCollector, "sendAllocationRequest");
      id v178 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      id v186 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      v184 = (void *)objc_claimAutoreleasedReturnValue([v186 destinations]);
      id v176 = (void *)objc_claimAutoreleasedReturnValue([v184 allObjects]);
      v182 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int128 v173 = (void *)objc_claimAutoreleasedReturnValue([v182 uniqueID]);
      id v180 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v157 = (void *)objc_claimAutoreleasedReturnValue([v180 fromURI]);
      uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue([v157 unprefixedURI]);
      id v159 = (void *)objc_claimAutoreleasedReturnValue([v158 _bestGuessURI]);
      v160 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
      unint64_t v161 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue([v161 accountID]);
      uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue([v160 accountWithUniqueID:v162]);
      __int128 v164 = (void *)objc_claimAutoreleasedReturnValue([v163 service]);
      __int128 v165 = (void *)objc_claimAutoreleasedReturnValue([v164 identifier]);
      id v166 =  [v178 setupNewAllocation:v176 sessionID:v173 fromIdentity:v188 fromURI:v159 fromService:v165 options:v192 connectReadyHandler:0];

      goto LABEL_55;
    }
  }

  else
  {
  }

  uint64_t v110 = OSLogHandleForTransportCategory("IDSDSession");
  id v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    double v113 = (void *)objc_claimAutoreleasedReturnValue([v112 groupID]);
    uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v115 = (void *)objc_claimAutoreleasedReturnValue([v114 destinations]);
    *(_DWORD *)buf = 138412546;
    *(void *)__int16 v212 = v113;
    *(_WORD *)&v212[8] = 2112;
    *(void *)&v212[10] = v115;
    _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "Participant query in process or defaults are not set for hardcoded QR session info, self.sharedState.groupID: %@, self.sharedState.destinations: %@",  buf,  0x16u);
  }

  uint64_t v117 = os_log_shim_legacy_logging_enabled(v116);
  if ((_DWORD)v117)
  {
    if (_IDSShouldLogTransport(v117))
    {
      uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue([v118 groupID]);
      id v120 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      BOOL v169 = (void *)objc_claimAutoreleasedReturnValue([v120 destinations]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Participant query in process or defaults are not set for hardcoded QR session info, self.sharedState.groupID: %@, self.sharedState.destinations: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v119, v169));
        id v122 = (void *)objc_claimAutoreleasedReturnValue([v121 groupID]);
        dispatch_block_t v123 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v170 = (void *)objc_claimAutoreleasedReturnValue([v123 destinations]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Participant query in process or defaults are not set for hardcoded QR session info, self.sharedState.groupID: %@, self.sharedState.destinations: %@");
      }
    }
  }

  self->_joinGroupSessionPending = 1;
  ((void (*)(void))v201[2])();
LABEL_60:
}

- (void)receiveJoinNotificationFromAParticipant
{
  if (self->_startedAsUPlusOneSession)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000AD9B8;
    v19[3] = &unk_1008F7948;
    v19[4] = self;
    IDSTransportThreadAddBlock(v19, a2);
  }

  if (self->_joinRecvTime == 0.0)
  {
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_joinRecvTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  }

  if (IMGetDomainBoolForKey(@"com.apple.ids", @"reinitiateAfter15s")
    && !self->_reinitTestCompleted)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will reinitiate after 15s for %@.", buf, 0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Will reinitiate after 15s for %@.");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v15));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Will reinitiate after 15s for %@.");
      }
    }

    self->_reinitTestCompleted = 1;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v11 = dispatch_time(0LL, 15000000000LL);
    uint64_t v13 = im_primary_queue(v11, v12);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000ADA20;
    block[3] = &unk_1008F8A78;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v11, v14, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

- (void)leaveGroupSession:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"-"]);

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_100946B28);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( self->_serviceIdentifier,  "substringFromIndex:",  [@"com.apple.private.alloy." length]));
  if (v10) {
    CFDictionarySetValue(Mutable, @"serviceName", v10);
  }

  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
  if (v11) {
    CFDictionarySetValue(Mutable, @"sessionID", v11);
  }

  IDSPowerLogDictionary(@"IDSDSession", Mutable);
  self->_BOOL sharedSessionHasJoined = 0;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  BOOL sharedSessionHasJoined = self->_sharedSessionHasJoined;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
  [v12 setSharedSessionHasJoined:sharedSessionHasJoined forIDSSession:v15];

  -[IDSDSession setShouldConnectToQRServer:](self, "setShouldConnectToQRServer:", 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:IDSGroupSessionClientContextDataKey]);

  -[IDSGroupStatusNotificationParameters setClientLeaveContextData:]( self->_groupStatusNotificationParams,  "setClientLeaveContextData:",  v16);
  if (self->_handOffOverQREnabled)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters clientLeaveContextData]( self->_groupStatusNotificationParams,  "clientLeaveContextData"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:]( self,  "_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:",  v17));

    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueID]);
      [v19 setIDSContextBlob:v18 forIDSSession:v21];
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 groupID]);
  [v22 cleanUpCachedMappings:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uniqueID]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000ADDD8;
  v35[3] = &unk_1008F8C80;
  v35[4] = self;
  [v25 disconnectGlobalLinkForDevice:v27 isReinitiating:0 completionHandler:v35];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  LODWORD(v26) = [v28 isInternalInstall];

  if ((_DWORD)v26)
  {
    uint64_t v31 = im_primary_queue(v29, v30);
    double v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000AE410;
    v34[3] = &unk_1008F6010;
    v34[4] = self;
    dispatch_block_t v33 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v34);
    dispatch_async(v32, v33);
  }
}

- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountID]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 accountWithUniqueID:v11]);

  if (v12)
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 unprefixedURIStringsFromRegistration]);
      *(_DWORD *)buf = 138478339;
      __int16 v47 = v6;
      __int16 v48 = 2112;
      id v49 = v15;
      __int16 v50 = 2112;
      id v51 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialMessage - message %{private}@ given aliases %@  destination: %@",  buf,  0x20u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v12 unprefixedURIStringsFromRegistration]);
        id v43 = v7;
        uint64_t v39 = v6;
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"sendKeyMaterialMessage - message %{private}@ given aliases %@  destination: %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unprefixedURIStringsFromRegistration", v6, v40, v7));
          id v43 = v7;
          uint64_t v39 = v6;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"sendKeyMaterialMessage - message %{private}@ given aliases %@  destination: %@");
        }
      }
    }

    id v18 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
    [v18 setPriority:300];
    [v18 setDestinations:v7];
    [v18 setMessage:v6];
    [v18 setIdentifier:v8];
    [v18 setAlwaysSkipSelf:1];
    uint64_t v19 = IDSGetUUIDData(v8);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v18 setMessageUUID:v20];

    [v18 setFireAndForget:1];
    [v18 setBypassStorage:1];
    [v18 setCommand:&off_100946B40];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredLackOfCapabilities](self, "requiredLackOfCapabilities"));
    id v22 = [v21 count];

    if (v22)
    {
      NSErrorUserInfoKey v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredLackOfCapabilities](self, "requiredLackOfCapabilities"));
        *(_DWORD *)buf = 138412290;
        __int16 v47 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialMessage - requires lack of properties {requiredLackOfCapabilities: %@}",  buf,  0xCu);
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredLackOfCapabilities](self, "requiredLackOfCapabilities"));
      [v18 setRequireLackOfRegistrationProperties:v25];
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredCapabilities](self, "requiredCapabilities", v39, v40, v43));
    id v27 = [v26 count];

    if (v27)
    {
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredCapabilities](self, "requiredCapabilities"));
        *(_DWORD *)buf = 138412290;
        __int16 v47 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialMessage - requires properties {requiredCapabilities: %@}",  buf,  0xCu);
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession requiredCapabilities](self, "requiredCapabilities"));
      [v18 setRequireAllRegistrationProperties:v30];
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000AEA64;
    void v44[3] = &unk_1008F8A50;
    id v45 = v8;
    [v12 sendMessageWithSendParameters:v18 willSendBlock:0 completionBlock:v44];
    uint64_t v31 = v45;
    goto LABEL_21;
  }

  uint64_t v32 = OSLogHandleForIDSCategory("Warning");
  dispatch_block_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 accountID]);
    *(_DWORD *)buf = 138412546;
    __int16 v47 = @"IDSDSession";
    __int16 v48 = 2112;
    id v49 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%@ - No account with unique ID %@ found to send a message, bailing...",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v36))
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v37 accountID]);
    _IDSWarnV(@"IDSFoundation", @"%@ - No account with unique ID %@ found to send a message, bailing...");

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", @"IDSDSession", v41));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v38 accountID]);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No account with unique ID %@ found to send a message, bailing...");

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", @"IDSDSession", v42));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
    _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No account with unique ID %@ found to send a message, bailing...");
LABEL_21:
  }
}

- (void)sendKeyMaterialMessageDataOverQR:(id)a3 toDestination:(id)a4 completionBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000AED60;
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

- (void)setServerDesiredKeyMaterials:(id)a3 signer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    unsigned __int8 v10 = [v9 shouldUseGecko];

    if ((v10 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      objc_storeStrong((id *)&self->_serverDesiredKeyMaterialsFromGroupEncryptionController, a3);
      id v11 = [v8 copy];
      id serverDesiredKeyMaterialsSigner = self->_serverDesiredKeyMaterialsSigner;
      self->_id serverDesiredKeyMaterialsSigner = v11;

      os_unfair_lock_unlock(&self->_lock);
      -[IDSDSession updateServerDesiredKeyMaterials](self, "updateServerDesiredKeyMaterials");
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "setServerDesiredKeyMaterials: SME disabled",  v17,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"setServerDesiredKeyMaterials: SME disabled");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"setServerDesiredKeyMaterials: SME disabled");
        }
      }
    }
  }
}

- (id)getDesiredMaterialSetForEncryptedData
{
  keyValueDelivery = self->_keyValueDelivery;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionKeyValueDeliveryProtocol getAllKeyValueDeliveryLocalMaterialSetForGroupID:]( keyValueDelivery,  "getAllKeyValueDeliveryLocalMaterialSetForGroupID:",  v4));

  return v5;
}

- (void)updateServerDesiredKeyValueDeliveryMaterialsNeeded
{
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    [v11 updateServerDesiredKeyMaterialsForGroup:v4 sessionID:v6];
  }

  else
  {
    uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyValueDeliveryMaterialsNeeded: SME disabled",  buf,  2u);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10 && _IDSShouldLogTransport(v10))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"updateServerDesiredKeyValueDeliveryMaterialsNeeded: SME disabled");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"updateServerDesiredKeyValueDeliveryMaterialsNeeded: SME disabled");
      }
    }
  }

- (void)requestKeyValueDeliveryDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  if (a3 == 1)
  {
    uint64_t v6 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v21 = 5;
      __int16 v22 = 2112;
      NSErrorUserInfoKey v23 = @"MIRAGEKEY";
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "requestKeyValueDeliveryDataForKey: requesting type %d (%@) for %llu",  buf,  0x1Cu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
    {
      uint64_t v17 = @"MIRAGEKEY";
      unint64_t v18 = a4;
      uint64_t v16 = 5LL;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"requestKeyValueDeliveryDataForKey: requesting type %d (%@) for %llu");
      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v17 = @"MIRAGEKEY";
        unint64_t v18 = a4;
        uint64_t v16 = 5LL;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"requestKeyValueDeliveryDataForKey: requesting type %d (%@) for %llu");
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4,  v16,  v17,  v18));
    uint64_t v19 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    -[IDSDSession requestMaterialsForParticipantIDs:materialType:]( self,  "requestMaterialsForParticipantIDs:materialType:",  v11,  5LL);
  }

  else
  {
    uint64_t v12 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "requestKeyValueDeliveryDataForKey: unknown type: %d",  buf,  8u);
    }

    uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
    if ((_DWORD)v15)
    {
      if (_IDSShouldLogTransport(v15))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"requestKeyValueDeliveryDataForKey: unknown type: %d");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"requestKeyValueDeliveryDataForKey: unknown type: %d");
        }
      }
    }
  }

- (id)serverDesiredKeyMaterials
{
  if (self->_isServerMaterialExchangeEnabled) {
    return -[NSSet mutableCopy](self->_serverDesiredKeyMaterialsFromGroupEncryptionController, "mutableCopy");
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
}

- (void)updateServerDesiredKeyMaterials
{
  if (self->_isServerMaterialExchangeEnabled)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    unsigned __int8 v4 = [v3 shouldUseGecko];

    if ((v4 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession serverDesiredKeyMaterials](self, "serverDesiredKeyMaterials"));
      id v6 = [self->_serverDesiredKeyMaterialsSigner copy];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);

      os_unfair_lock_unlock(&self->_lock);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000AF85C;
      v17[3] = &unk_1008F9038;
      v17[4] = self;
      id v18 = v8;
      id v19 = v5;
      id v20 = v6;
      id v9 = v6;
      id v10 = v5;
      id v11 = v8;
      IDSTransportThreadAddBlock(v17, v12);
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterials: SME disabled",  buf,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"updateServerDesiredKeyMaterials: SME disabled");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"updateServerDesiredKeyMaterials: SME disabled");
        }
      }
    }
  }

- (void)didCreateMKM:(id)a3
{
  metricsCollector = self->_metricsCollector;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 keyIndex]);
  -[IDSGFTMetricsCollector didCreateMKM:](metricsCollector, "didCreateMKM:", v4);
}

- (void)recvKeyMaterial:(id)a3
{
  id v4 = a3;
  if (self->_multiplexerEnabled)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMultiplexerGroupSessionTransport fanoutEncryptionManager]( self->_multiplexerTransport,  "fanoutEncryptionManager"));
    [v5 recvKeyMaterial:v4];
  }

  __int16 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  uint64_t v26 = sub_1000AFBCC;
  id v27 = &unk_1008F8800;
  id v28 = self;
  id v6 = v4;
  id v29 = v6;
  IDSTransportThreadAddBlock(&v24, v7);
  if (qword_1009BE930 != -1) {
    dispatch_once(&qword_1009BE930, &stru_1008F91C0);
  }
  double v8 = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
  self->_newKeyEventTime = v8;
  double membershipChangeEventTime = self->_membershipChangeEventTime;
  if (membershipChangeEventTime != 0.0)
  {
    uint64_t v10 = (uint64_t)((v8 - membershipChangeEventTime) * 1000.0);
    uint64_t v11 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      dispatch_block_t v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received the new MKM %lld milleseconds after the membership change event for group %@",  buf,  0x16u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v22 = v10;
        NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue([v17 groupID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Received the new MKM %lld milleseconds after the membership change event for group %@");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v10, v23, v24, v25, v26, v27, v28));
          uint64_t v22 = v10;
          NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue([v18 groupID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Received the new MKM %lld milleseconds after the membership change event for group %@");
        }
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance", v22, v23));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceName]);
    [v19 IDSRealTimeEncryptionServiceName:v21 activeParticipants:self->_cachedNumberOfActiveParticipants membershipChangeMKMTimeDelta:v10];

    self->_double membershipChangeEventTime = 0.0;
    self->_newKeyEventTime = 0.0;
  }
}

- (void)didSendKeyMaterial:(id)a3 duration:(double)a4
{
  id v5 = a3;
  if (self->_firstMKMSentTime == 0.0)
  {
    id v6 = v5;
    if (qword_1009BE930 != -1) {
      dispatch_once(&qword_1009BE930, &stru_1008F91C0);
    }
    self->_firstMKMSentTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
    id v5 = v6;
  }
}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  if (self->_multiplexerEnabled)
  {
    multiplexerTransport = self->_multiplexerTransport;
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[IDSMultiplexerGroupSessionTransport fanoutEncryptionManager]( multiplexerTransport,  "fanoutEncryptionManager"));
    [v5 invalidateKeyMaterialByKeyIndexes:v4];
  }

- (void)_sendClientDecryptedDatabBlobs:(id)a3 type:(int)a4 forParticipant:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 participantURI]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v10));

  BOOL v12 = sub_1003CC744(v11);
  if (v12)
  {
    uint64_t v14 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "_sendClientDecryptedDatabBlobs: dropping because it came from blocked URI",  buf,  2u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"_sendClientDecryptedDatabBlobs: dropping because it came from blocked URI");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"_sendClientDecryptedDatabBlobs: dropping because it came from blocked URI");
        }
      }
    }
  }

  else
  {
    uint64_t v18 = im_primary_queue(v12, v13);
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000AFE9C;
    v21[3] = &unk_1008F9060;
    v21[4] = self;
    int v24 = a4;
    id v22 = v9;
    id v23 = v8;
    dispatch_block_t v20 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v21);
    dispatch_async(v19, v20);
  }
}

- (void)_sendRemoteParticipantInfoEventToClient:(id)a3 forParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = im_primary_queue(v7, v8);
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B017C;
  block[3] = &unk_1008F5F58;
  void block[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
  dispatch_async(v10, v13);
}

- (void)receiveAndDecryptEncryptedDataBlobs:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v45 = self;
  if (!self->_typeToKeyIDToEncryptedData)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
    self->_typeToKeyIDToEncryptedData = Mutable;
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = v4;
  id v43 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v54;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v54 != v42)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }

        uint64_t v46 = v7;
        uint64_t v9 = *(const void **)(*((void *)&v53 + 1) + 8 * v7);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v9, v37, v38, v39, v40, lock));
        theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v45->_typeToKeyIDToEncryptedData,  "objectForKeyedSubscript:",  v9));
        if (!theDict) {
          theDict = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v50;
          do
          {
            for (int i = 0LL; i != v12; int i = (char *)i + 1)
            {
              if (*(void *)v50 != v13) {
                objc_enumerationMutation(v11);
              }
              id v15 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
              if ((unint64_t)objc_msgSend(v15, "length", v37, v38) > 0x10)
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", 0, 16));
                id v23 = (char *)[v15 length] - 16;
                int v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", 16, v23));
                id v25 = v22;
                uint64_t v26 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc],  "initWithUUIDBytes:",  [v25 bytes]);
                uint64_t v27 = OSLogHandleForTransportCategory("IDSDSession");
                id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  dispatch_block_t v58 = v9;
                  __int16 v59 = 2048;
                  __int128 v60 = v23;
                  __int16 v61 = 2112;
                  uint64_t v62 = v24;
                  __int16 v63 = 2112;
                  uint64_t v64 = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "receiveAndDecryptEncryptedDataBlobs: type: %@, blobLength: %lu, standaloneBlob: %@, keyID: %@",  buf,  0x2Au);
                }

                uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
                if ((_DWORD)v30)
                {
                  if (_IDSShouldLogTransport(v30))
                  {
                    uint64_t v39 = v24;
                    uint64_t v40 = v26;
                    uint64_t v37 = v9;
                    uint64_t v38 = v23;
                    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"receiveAndDecryptEncryptedDataBlobs: type: %@, blobLength: %lu, standaloneBlob: %@, keyID: %@");
                    if (_IDSShouldLog(0LL, @"IDSDSession"))
                    {
                      uint64_t v39 = v24;
                      uint64_t v40 = v26;
                      uint64_t v37 = v9;
                      uint64_t v38 = v23;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"receiveAndDecryptEncryptedDataBlobs: type: %@, blobLength: %lu, standaloneBlob: %@, keyID: %@");
                    }
                  }
                }

                if (v24) {
                  CFDictionarySetValue(theDict, v26, v24);
                }
              }

              else
              {
                uint64_t v16 = OSLogHandleForTransportCategory("IDSDSession");
                uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v18 = (char *)[v15 length];
                  *(_DWORD *)buf = 138412546;
                  dispatch_block_t v58 = v9;
                  __int16 v59 = 2048;
                  __int128 v60 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "receiveAndDecryptEncryptedDataBlobs: blob too small: type: %@, dataBlob length: %lu",  buf,  0x16u);
                }

                uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
                if ((_DWORD)v20)
                {
                  if (_IDSShouldLogTransport(v20))
                  {
                    uint64_t v37 = v9;
                    uint64_t v38 = (char *)[v15 length];
                    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"receiveAndDecryptEncryptedDataBlobs: blob too small: type: %@, dataBlob length: %lu");
                    if (_IDSShouldLog(0LL, @"IDSDSession"))
                    {
                      int v21 = (char *)objc_msgSend(v15, "length", v9, v38);
                      uint64_t v37 = v9;
                      uint64_t v38 = v21;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"receiveAndDecryptEncryptedDataBlobs: blob too small: type: %@, dataBlob length: %lu");
                    }
                  }
                }
              }
            }

            id v12 = [v11 countByEnumeratingWithState:&v49 objects:v65 count:16];
          }

          while (v12);
        }

        uint64_t v31 = theDict;
        if (theDict)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)v45->_typeToKeyIDToEncryptedData, v9, theDict);
          uint64_t v31 = theDict;
        }

        uint64_t v7 = v46 + 1;
      }

      while ((id)(v46 + 1) != v43);
      id v43 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    }

    while (v43);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v34 = im_primary_queue(v32, v33);
  unsigned int v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v34);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B080C;
  block[3] = &unk_1008F6010;
  void block[4] = v45;
  dispatch_block_t v36 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v35, v36);
}

- (void)_decryptReceivedDataBlobsUsingSKMs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableDictionary count](self->_typeToKeyIDToEncryptedData, "count");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = -[NSMutableDictionary count](self->_typeToParticipantIDToDecryptedDataBlob, "count");
      typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
      *(_DWORD *)buf = 134218242;
      id v61 = v7;
      __int16 v62 = 2112;
      __int16 v63 = typeToKeyIDToEncryptedData;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_decryptReceivedDataBlobsUsingSKMs: _typeToParticipantIDToDecryptedDataBlob count: %llu, _typeToKeyIDToEncryptedData: %@",  buf,  0x16u);
    }

    if (!self->_typeToParticipantIDToDecryptedDataBlob)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      typeToParticipantIDToDecryptedDataBlob = self->_typeToParticipantIDToDecryptedDataBlob;
      self->_typeToParticipantIDToDecryptedDataBlob = Mutable;
    }

    id v11 = -[NSMutableDictionary copy](self->_typeToKeyIDToEncryptedData, "copy");
    os_unfair_lock_t lock = p_lock;
    os_unfair_lock_unlock(p_lock);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = v11;
    id v36 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v55;
      do
      {
        for (int i = 0LL; i != v36; int i = (char *)i + 1)
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          CFMutableDictionaryRef v14 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_typeToParticipantIDToDecryptedDataBlob,  "objectForKeyedSubscript:",  v13));
          if (!v14) {
            CFMutableDictionaryRef v14 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          CFMutableDictionaryRef v15 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_typeToKeyIDToEncryptedData,  "objectForKeyedSubscript:",  v13));
          if (!v15) {
            CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          unsigned int v16 = [v13 intValue];
          id v17 = -[__CFDictionary count](v15, "count");
          uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          if (v17)
          {
            uint64_t v41 = v14;
            uint64_t v42 = i;
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472LL;
            v50[2] = sub_1000B0D00;
            v50[3] = &unk_1008F9088;
            v50[4] = v13;
            v50[5] = self;
            unsigned int v38 = v16;
            unsigned int v53 = v16;
            uint64_t v19 = v18;
            uint64_t v37 = v14;
            __int128 v51 = v37;
            uint64_t v39 = v19;
            uint64_t v20 = v19;
            __int128 v52 = v20;
            uint64_t v40 = v15;
            -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v50);
            os_unfair_lock_lock(lock);
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            int v21 = v20;
            id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v47;
              do
              {
                for (uint64_t j = 0LL; j != v23; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_typeToKeyIDToEncryptedData,  "objectForKeyedSubscript:",  v13));
                  [v27 removeObjectForKey:v26];

                  id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_typeToKeyIDToEncryptedData,  "objectForKeyedSubscript:",  v13));
                  id v29 = [v28 count];

                  if (!v29) {
                    -[NSMutableDictionary removeObjectForKey:]( self->_typeToKeyIDToEncryptedData,  "removeObjectForKey:",  v13);
                  }
                  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_typeToKeyIDToEncryptedData,  "objectForKeyedSubscript:",  v13));
                    id v32 = [v31 count];
                    uint64_t v33 = self->_typeToKeyIDToEncryptedData;
                    *(_DWORD *)buf = 134218242;
                    id v61 = v32;
                    __int16 v62 = 2112;
                    __int16 v63 = v33;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "_decryptReceivedDataBlobsUsingSKMs: count: %llu, %@",  buf,  0x16u);
                  }
                }

                id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
              }

              while (v23);
            }

            os_unfair_lock_unlock(lock);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = sub_1000B120C;
            void v44[3] = &unk_1008F90B0;
            void v44[4] = self;
            v44[5] = v13;
            unsigned int v45 = v38;
            -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v37, "enumerateKeysAndObjectsUsingBlock:", v44);

            CFMutableDictionaryRef v14 = v41;
            int i = v42;
            uint64_t v18 = v39;
            CFMutableDictionaryRef v15 = v40;
          }
        }

        id v36 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v36);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_decryptReceivedEncryptedDataBlobsUsingSKMs, no encryptedBlobTypeCount, return",  buf,  2u);
    }

    os_unfair_lock_unlock(p_lock);
  }

- (BOOL)shouldReportToClient:(id)a3 timeStamp:(double)a4 type:(unint64_t)a5
{
  id v8 = a3;
  participantIDToRemoteParticipantContext = self->_participantIDToRemoteParticipantContext;
  if (!participantIDToRemoteParticipantContext)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v11 = self->_participantIDToRemoteParticipantContext;
    self->_participantIDToRemoteParticipantContext = Mutable;

    participantIDToRemoteParticipantContext = self->_participantIDToRemoteParticipantContext;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( participantIDToRemoteParticipantContext,  "objectForKeyedSubscript:",  v8));
  uint64_t v13 = v12;
  if (!v12)
  {
    id v17 = -[IDSDSessionRemoteParticipantContext initWithtimeStamp:updateType:]( objc_alloc(&OBJC_CLASS___IDSDSessionRemoteParticipantContext),  "initWithtimeStamp:updateType:",  a5,  a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantIDToRemoteParticipantContext,  "setObject:forKeyedSubscript:",  v17,  v8);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      BOOL v19 = 1;
      goto LABEL_18;
    }

    int v26 = 138412546;
    uint64_t v27 = v17;
    __int16 v28 = 2048;
    id v29 = [v8 unsignedLongLongValue];
    uint64_t v20 = "shouldReportToClient: Sending first event %@ for participantID: %llu!";
    int v21 = v23;
    uint32_t v22 = 22;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
    goto LABEL_17;
  }

  [v12 timeStamp];
  double v15 = v14;
  id v16 = [v13 updateType];
  id v17 = -[IDSDSessionRemoteParticipantContext initWithtimeStamp:updateType:]( objc_alloc(&OBJC_CLASS___IDSDSessionRemoteParticipantContext),  "initWithtimeStamp:updateType:",  a5,  a4);
  if (v15 < a4 && v16 != (id)a5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantIDToRemoteParticipantContext,  "setObject:forKeyedSubscript:",  v17,  v8);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v26 = 138412802;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2048;
    id v31 = [v8 unsignedLongLongValue];
    uint64_t v20 = "shouldReportToClient: Sending update event %@ previous event %@ for participantID: %llu!";
    int v21 = v23;
    uint32_t v22 = 32;
    goto LABEL_16;
  }

  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2048;
    id v31 = [v8 unsignedLongLongValue];
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "shouldReportToClient: Not Sending event %@ previous event %@ for participantID: %llu!",  (uint8_t *)&v26,  0x20u);
  }

  BOOL v19 = 0;
LABEL_18:

  return v19;
}

- (void)rejectedKeyRecoveryRequestFromURI:(id)a3 reason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    *(_DWORD *)buf = 138412802;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 1024;
    int v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "rejectedKeyRecoveryRequestFromURI for session %@, from: %@, reason: %u",  buf,  0x1Cu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    uint64_t v12 = _IDSShouldLogTransport(v12);
    if ((_DWORD)v12)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"rejectedKeyRecoveryRequestFromURI for session %@, from: %@, reason: %u");

      uint64_t v12 = _IDSShouldLog(0LL, @"IDSDSession");
      if ((_DWORD)v12)
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v20, v6, v4));
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"rejectedKeyRecoveryRequestFromURI for session %@, from: %@, reason: %u");
      }
    }
  }

  uint64_t v16 = im_primary_queue(v12, v13);
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1C34;
  block[3] = &unk_1008F88C0;
  void block[4] = self;
  id v23 = v6;
  int v24 = v4;
  id v18 = v6;
  dispatch_block_t v19 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
  dispatch_async(v17, v19);
}

- (void)recvStableKeyMaterialForFrameworkCache:(id)a3
{
  id v41 = a3;
  uint64_t v4 = OSLogHandleForTransportCategory("IDSDSession");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    *(_DWORD *)buf = 138412546;
    __int128 v51 = v7;
    __int16 v52 = 2112;
    id v53 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "recvStableKeyMaterialForFrameworkCache for session %@. SKM: %@",  buf,  0x16u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      id v40 = v41;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"recvStableKeyMaterialForFrameworkCache for session %@. SKM: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v39, v41));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
        id v40 = v41;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"recvStableKeyMaterialForFrameworkCache for session %@. SKM: %@");
      }
    }
  }

  if (v41)
  {
    id v12 = [v41 count];
    if (v12)
    {
      uint64_t v14 = im_primary_queue(v12, v13);
      double v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000B2274;
      block[3] = &unk_1008F5F80;
      void block[4] = self;
      id v16 = v41;
      id v48 = v16;
      dispatch_block_t v17 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
      dispatch_async(v15, v17);

      os_unfair_lock_lock(&self->_lock);
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id obj = v16;
      char v18 = 0;
      id v19 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v44;
        do
        {
          for (int i = 0LL; i != v19; int i = (char *)i + 1)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(obj);
            }
            uint32_t v22 = -[IDSGroupEncryptionKeyMaterial initWithDictionary:]( objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial),  "initWithDictionary:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i));
            unsigned __int8 v23 = -[IDSGroupEncryptionKeyManager recvKeyMaterial:]( self->_dataBlobEncryptionManager,  "recvKeyMaterial:",  v22);
            keyIDToParticipantID = self->_keyIDToParticipantID;
            if (!keyIDToParticipantID)
            {
              CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              int v26 = self->_keyIDToParticipantID;
              self->_keyIDToParticipantID = Mutable;

              keyIDToParticipantID = self->_keyIDToParticipantID;
            }

            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IDSGroupEncryptionKeyMaterial participantID](v22, "participantID", v39, v40)));
            id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v22, "keyIndex"));
            -[NSMutableDictionary setObject:forKey:](keyIDToParticipantID, "setObject:forKey:", v27, v28);

            v18 |= v23;
          }

          id v19 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        }

        while (v19);
      }

      __int16 v29 = -[IDSGroupSessionDataCryptor initWithTopic:keyManager:]( objc_alloc(&OBJC_CLASS___IDSGroupSessionDataCryptor),  "initWithTopic:keyManager:",  @"dataBlobEncryption",  self->_dataBlobEncryptionManager);
      cryptorForBlobs = self->_cryptorForBlobs;
      self->_cryptorForBlobs = v29;

      os_unfair_lock_unlock(&self->_lock);
      -[IDSDSession _decryptReceivedDataBlobsUsingSKMs](self, "_decryptReceivedDataBlobsUsingSKMs");
      if ((v18 & 1) != 0)
      {
        uint64_t v31 = OSLogHandleForTransportCategory("IDSDSession");
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
          *(_DWORD *)buf = 138412290;
          __int128 v51 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "recvStableKeyMaterialForFrameworkCache for session %@. Re-encyrpting Blobs with new encryption key (local SKM)",  buf,  0xCu);
        }

        uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
        if ((_DWORD)v36)
        {
          if (_IDSShouldLogTransport(v36))
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"recvStableKeyMaterialForFrameworkCache for session %@. Re-encyrpting Blobs with new encryption key (local SKM)");

            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v39));
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 uniqueID]);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"recvStableKeyMaterialForFrameworkCache for session %@. Re-encyrpting Blobs with new encryption key (local SKM)");
            }
          }
        }

        -[IDSDSession updateRelevantEncryptedDataBlob](self, "updateRelevantEncryptedDataBlob", v39);
      }
    }
  }
}

- (void)InvalidateStableKeyMaterialInFrameworkCache:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B2410;
  v10[3] = &unk_1008F5F80;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v10);
  dispatch_async(v7, v9);
}

- (void)recvMembershipChangeEventWithReason:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (self->_multiplexerEnabled)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMultiplexerGroupSessionTransport fanoutEncryptionManager]( self->_multiplexerTransport,  "fanoutEncryptionManager"));
    [v7 receiveMembershipChangedInformation:v4];

    if ((v4 - 1) <= 1u)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMultiplexerGroupSessionTransport fanoutEncryptionManager]( self->_multiplexerTransport,  "fanoutEncryptionManager"));
      [v8 purgeOldKeyMaterial];
    }
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B2610;
  v11[3] = &unk_1008F90D8;
  char v13 = v4;
  v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  IDSTransportThreadAddBlock(v11, v10);
  if (qword_1009BE930 != -1) {
    dispatch_once(&qword_1009BE930, &stru_1008F91C0);
  }
  self->_double membershipChangeEventTime = *(double *)&qword_1009BE938 * (double)mach_continuous_time();
}

- (void)sendAllocationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountWithUniqueID:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);

  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  int v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_Recipients]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  int v24 = v4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_AllocateType]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 getQuickRelayAllocateOptions:v11]);

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  -[IDSGFTMetricsCollector sendAllocationRequest](self->_metricsCollector, "sendAllocationRequest");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession accountController](self, "accountController"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v15 accountID]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithUniqueID:v29]);
  unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v28 _registrationCert]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  dispatch_block_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fromURI]);
  char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 unprefixedURI]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _bestGuessURI]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B2964;
  void v30[3] = &unk_1008F9100;
  objc_copyWeak(&v32, location);
  id v21 = v9;
  id v31 = v21;
  id v22 =  [v27 setupNewAllocation:v26 sessionID:v13 fromIdentity:v23 fromURI:v19 fromService:v20 options:v25 connectReadyHandler:v30];

  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
}

- (void)hasOutdatedSKI:(id)a3
{
  id v4 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v11, "setShouldBoost:", 1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushTopic]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 broadcasterForTopic:v7 entitlement:kIDSSessionEntitlement command:0 messageContext:v11]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  [v8 session:v10 hasOutdatedSKI:v4];
}

- (void)requestEncryptionKeyForParticipantIDs:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B2C0C;
  v10[3] = &unk_1008F5F80;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v10);
  dispatch_async(v7, v9);
}

- (void)requestMaterialsForParticipantIDs:(id)a3 materialType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    *(_DWORD *)buf = 138412802;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 1024;
    int v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "requestMaterialsForParticipantIDs for session %@. participantIDs: %@; materialType:%d",
      buf,
      0x1Cu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      char v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"requestMaterialsForParticipantIDs for session %@. participantIDs: %@; materialType:%d");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v20, v6, v4));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"requestMaterialsForParticipantIDs for session %@. participantIDs: %@; materialType:%d");
      }
    }
  }

  if (self->_isServerMaterialExchangeEnabled)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000B3110;
    v22[3] = &unk_1008F8828;
    v22[4] = self;
    id v23 = v6;
    int v24 = v4;
    IDSTransportThreadAddBlock(v22, v15);
  }

  else
  {
    uint64_t v16 = OSLogHandleForTransportCategory("IDSDSession");
    dispatch_block_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "requestMaterialsForParticipantIDs: SME disabled",  buf,  2u);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"requestMaterialsForParticipantIDs: SME disabled");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"requestMaterialsForParticipantIDs: SME disabled");
        }
      }
    }
  }
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B3204;
  v8[3] = &unk_1008F9128;
  id v9 = a4;
  unint64_t v10 = a3;
  v8[4] = self;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B347C;
  v8[3] = &unk_1008F9128;
  id v9 = a4;
  unint64_t v10 = a3;
  v8[4] = self;
  id v6 = v9;
  IDSTransportThreadAddBlock(v8, v7);
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _OWORD v7[2] = sub_1000B3744;
  v7[3] = &unk_1008F9150;
  id v9 = &v11;
  unint64_t v10 = a3;
  void v7[4] = self;
  id v4 = a4;
  id v8 = v4;
  IDSTransportThreadAddSyncBlock(v7);
  unint64_t v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)onParticipantID2PushTokenMappingChange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v5 = objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
  id v6 = -[NSUUID initWithUUIDBytes:](v4, "initWithUUIDBytes:", [v5 bytes]);
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));

  __int16 v29 = v3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSQRAllocateKey_Allocations]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    uint64_t v12 = kIDSQRAllocateKey_RecipientID;
    uint64_t v13 = kIDSQRAllocateKey_RecipientPushToken;
    do
    {
      for (int i = 0LL; i != v10; int i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v12]);
        dispatch_block_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v16 unsignedLongLongValue]));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
        [v8 addObject:v17];
        [v31 addObject:v18];
      }

      id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v10);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000B3AD0;
  v33[3] = &unk_1008F7900;
  v33[4] = self;
  id v34 = v27;
  id v35 = v8;
  id v19 = v8;
  id v20 = v27;
  uint64_t v22 = IDSTransportThreadAddBlock(v33, v21);
  uint64_t v24 = im_primary_queue(v22, v23);
  id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3B74;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_block_t v26 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v25, v26);
}

- (void)onURI2ParticipantIDMappingChange:(id)a3 allocateResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v9 = objc_claimAutoreleasedReturnValue([v7 objectForKey:kIDSQRAllocateKey_IDSSessionID]);
  id v10 = -[NSUUID initWithUUIDBytes:](v8, "initWithUUIDBytes:", [v9 bytes]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString"));

  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v13 = objc_claimAutoreleasedReturnValue([v7 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
  unint64_t v14 = -[NSUUID initWithUUIDBytes:](v12, "initWithUUIDBytes:", [v13 bytes]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v14, "UUIDString"));

  uint64_t v16 = OSLogHandleForTransportCategory("IDSDSession");
  dispatch_block_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "URI to participantID mapping changed for sessionID: %@",  buf,  0xCu);
  }

  uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
  if ((_DWORD)v19)
  {
    if (_IDSShouldLogTransport(v19))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"URI to participantID mapping changed for sessionID: %@");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"URI to participantID mapping changed for sessionID: %@");
      }
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000B3F14;
  v23[3] = &unk_1008F7900;
  v23[4] = self;
  id v24 = v15;
  id v25 = v6;
  id v20 = v6;
  id v21 = v15;
  IDSTransportThreadAddBlock(v23, v22);
}

- (void)qrAllocatorDidReceiveAllocateResponse:(id)a3
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 objectForKey:kIDSQRAllocateKey_Allocations]);
  id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    uint64_t v23 = kIDSQRAllocateKey_RecipientID;
    uint64_t v24 = *(void *)v29;
    os_unfair_lock_t lock = &self->_lock;
    uint64_t v21 = kIDSQRAllocateKey_RecipientURI;
    uint64_t v20 = kIDSQRAllocateKey_RecipientPushToken;
    do
    {
      for (int i = 0LL; i != v25; int i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v23, v20));
        id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 unsignedLongLongValue]));
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupID]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 getURIFromParticipantID:v10 participantID:v7]);

        os_unfair_lock_lock(lock);
        dispatch_block_t v26 = v6;
        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v11));
        }

        else
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v21]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v13));
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantIDToURI,  "setObject:forKeyedSubscript:",  v12,  v7);

        os_unfair_lock_unlock(lock);
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
        dispatch_block_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 getPushTokenFromParticipantID:v16 participantID:v7]);

        os_unfair_lock_lock(lock);
        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v17));
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v20]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v19));
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantIDToPushToken,  "setObject:forKeyedSubscript:",  v18,  v7);

        os_unfair_lock_unlock(lock);
      }

      id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v25);
  }
}

- (void)processAllocationErrorStatus:(int)a3 errorCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = OSLogHandleForTransportCategory("IDSDSession");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 1024;
    int v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Allocation failure for session %@, status = %d, code = %d",  buf,  0x18u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v16 = v5;
      uint64_t v17 = v4;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Allocation failure for session %@, status = %d, code = %d");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v15, v5, v4));
        uint64_t v16 = v5;
        uint64_t v17 = v4;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Allocation failure for session %@, status = %d, code = %d");
      }
    }
  }

  -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", v4, v15, v16, v17);
}

- (void)_updateActiveParticipants:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  self->_cachedNumberOfActiveParticipants = (int64_t)v5;
  uint64_t v7 = im_primary_queue(v5, v6);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B4570;
  v11[3] = &unk_1008F5F80;
  id v12 = v4;
  id v13 = self;
  id v9 = v4;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v11);
  dispatch_async(v8, v10);
}

- (void)_updateActiveLightweightParticipants:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B4B04;
  v10[3] = &unk_1008F5F80;
  id v11 = v4;
  id v12 = self;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INTERACTIVE,  0,  v10);
  dispatch_async(v7, v9);
}

- (id)_createGroupSessionActiveParticipantsFromParticipants:(id)a3 pushTokenForParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_block_t v9 = objc_alloc(&OBJC_CLASS___NSUUID);
  dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 groupID]);
  id v12 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v11);

  if ([v6 count])
  {
    unint64_t v13 = 0LL;
    do
    {
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v13]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v13]);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNull, v16);
      if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
      {
        uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v33) = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Missing push token at index %d. Replacing NSNull with nil.",  buf,  8u);
        }

        uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
        if ((_DWORD)v21)
        {
          if (_IDSShouldLogTransport(v21))
          {
            unint64_t v30 = v13;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Missing push token at index %d. Replacing NSNull with nil.");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              unint64_t v30 = v13;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Missing push token at index %d. Replacing NSNull with nil.");
            }
          }
        }

        uint64_t v15 = 0LL;
      }

      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v14, v30));
      if (v22)
      {
        id v23 = objc_msgSend( [IDSGroupSessionActiveParticipant alloc],  "initWithGroupUUID:participantIdentifier:isKnown:participantURI:pushToken:",  v12,  objc_msgSend(v14, "unsignedLongLongValue"),  1,  v22,  v15);
      }

      else
      {
        uint64_t v24 = OSLogHandleForTransportCategory("IDSDSession");
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v33 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Couldn't get the URI from the QRAllocate response for participantID: %llu, create active participant with nil URI",  buf,  0xCu);
        }

        uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
        if ((_DWORD)v27)
        {
          if (_IDSShouldLogTransport(v27))
          {
            __int128 v31 = v14;
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Couldn't get the URI from the QRAllocate response for participantID: %llu, create active participant with nil URI");
            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              __int128 v31 = v14;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Couldn't get the URI from the QRAllocate response for participantID: %llu, create active participant with nil URI");
            }
          }
        }

        id v23 = objc_msgSend( [IDSGroupSessionActiveParticipant alloc],  "initWithGroupUUID:participantIdentifier:isKnown:participantURI:pushToken:",  v12,  objc_msgSend(v14, "unsignedLongLongValue"),  0,  0,  0);
      }

      __int128 v28 = v23;
      objc_msgSend(v8, "addObject:", v23, v31);

      ++v13;
    }

    while ((unint64_t)[v6 count] > v13);
  }

  return v8;
}

- (void)getActiveParticipants:(id)a3 pushTokenForParticipants:(id)a4 isLightweightParticipant:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (_os_feature_enabled_impl("IDS", "PrioritizedActiveParticipants"))
  {
    dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDSessionActiveParticipantsCache sharedInstance]( &OBJC_CLASS___IDSDSessionActiveParticipantsCache,  "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
    [v10 updateParticipants:v11 forSessionID:v13];
  }

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSession _createGroupSessionActiveParticipantsFromParticipants:pushTokenForParticipants:]( self,  "_createGroupSessionActiveParticipantsFromParticipants:pushTokenForParticipants:",  v8,  v9));
  if (v14)
  {
    if (v5)
    {
      uint64_t v15 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "update active lightweight participants: %@",  buf,  0xCu);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          __int128 v43 = v14;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"update active lightweight participants: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            __int128 v43 = v14;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"update active lightweight participants: %@");
          }
        }
      }

      -[IDSDSession _updateActiveLightweightParticipants:](self, "_updateActiveLightweightParticipants:", v14, v43);
    }

    else
    {
      uint64_t v23 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "update active participants: %@", buf, 0xCu);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          __int128 v43 = v14;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"update active participants: %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            __int128 v43 = v14;
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"update active participants: %@");
          }
        }
      }

      -[IDSDSession _updateActiveParticipants:](self, "_updateActiveParticipants:", v14, v43);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 groupID]);
    BOOL v30 = [v27 localParticipantIDForGroupID:v29] == 0;

    if (v30)
    {
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueID]);
      id v34 = [v31 getLocalParticipantIDForRelaySessionID:v33];

      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 groupID]);
        *(_DWORD *)buf = 134218242;
        id v45 = v34;
        __int16 v46 = 2112;
        __int128 v47 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "currentLocalParticipantID: %llu, groupID: %@",  buf,  0x16u);
      }

      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 groupID]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 uniqueID]);
      [v38 setLocalParticipantID:v34 forGroupID:v40 sessionID:v42];
    }
  }

  else
  {
    uint64_t v19 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to get URI from QR allocate response",  buf,  2u);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport(@"IDSDSession", @"IDS", @"Failed to get URI from QR allocate response");
        if (_IDSShouldLog(0LL, @"IDSDSession")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Failed to get URI from QR allocate response");
        }
      }
    }
  }
}

- (void)registerMultiplexerTransport
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueID]);

  BOOL v5 = -[IDSMultiplexerGroupSessionTransport initWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSMultiplexerGroupSessionTransport),  "initWithIdentifier:",  v4);
  multiplexerTransport = self->_multiplexerTransport;
  self->_multiplexerTransport = v5;

  id v7 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"fanout context"]);
  id v8 = (const char *)[v7 UTF8String];

  id v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, strlen(v8));
  dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[IDSMultiplexerGroupSessionTransport setParticipantIDToAliasConverter:]( self->_multiplexerTransport,  "setParticipantIDToAliasConverter:",  self);
  id v11 = -[IDSGroupEncryptionKeyManager initWithEncryptionContext:encryptionKeySize:]( objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyManager),  "initWithEncryptionContext:encryptionKeySize:",  v10,  60LL);
  -[IDSMultiplexerGroupSessionTransport setFanoutEncryptionManager:]( self->_multiplexerTransport,  "setFanoutEncryptionManager:",  v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController"));
  unint64_t v13 = self->_multiplexerTransport;
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_1000B5868;
  uint64_t v20 = &unk_1008F91A0;
  id v21 = v12;
  id v22 = v4;
  id v14 = v4;
  id v15 = v12;
  -[IDSMultiplexerGroupSessionTransport setPacketBufferReadHandler:](v13, "setPacketBufferReadHandler:", &v17);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupSessionMultiplexer sharedInstance]( &OBJC_CLASS___IDSGroupSessionMultiplexer,  "sharedInstance",  v17,  v18,  v19,  v20));
  [v16 registerMultiplexerTransport:self->_multiplexerTransport];
}

- (void)reinitiate
{
  uint64_t v3 = OSLogHandleForTransportCategory("IDSDSession");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    *(_DWORD *)buf = 138412290;
    __int16 v75 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reinitiate called for session %@", buf, 0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v68 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Reinitiate called for session %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v68));
        id v68 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Reinitiate called for session %@");
      }
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v68));
  unsigned __int8 v12 = [v11 supportsReinitiate];

  if ((v12 & 1) != 0)
  {
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v14 = [v13 state] == 5;

    if (v14)
    {
      if (-[IDSDSession isWithDefaultPairedDevice](self, "isWithDefaultPairedDevice"))
      {
        uint64_t v15 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
          *(_DWORD *)buf = 138412290;
          __int16 v75 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate called, but this session is with the default paired device",  buf,  0xCu);
        }

        uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
        if ((_DWORD)v20 && _IDSShouldLogTransport(v20))
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          BOOL v70 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate called, but this session is with the default paired device");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v70));
            BOOL v71 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate called, but this session is with the default paired device");
          }
        }
      }

      else
      {
        __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned __int8 v57 = [v56 isInitiator];

        if ((v57 & 1) != 0)
        {
          -[IDSDSession _startReinitiateAsInitiator](self, "_startReinitiateAsInitiator");
        }

        else
        {
          uint64_t v58 = OSLogHandleForTransportCategory("IDSDSession");
          __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 uniqueID]);
            *(_DWORD *)buf = 138412290;
            __int16 v75 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate: sending request for initiator to kick off reinitiate flow",  buf,  0xCu);
          }

          uint64_t v63 = os_log_shim_legacy_logging_enabled(v62);
          if ((_DWORD)v63)
          {
            if (_IDSShouldLogTransport(v63))
            {
              uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              id v69 = (void *)objc_claimAutoreleasedReturnValue([v64 uniqueID]);
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate: sending request for initiator to kick off reinitiate flow");

              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                id v65 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v69));
                id v69 = (void *)objc_claimAutoreleasedReturnValue([v65 uniqueID]);
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate: sending request for initiator to kick off reinitiate flow");
              }
            }
          }

          __int16 v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger", v69));
          [v66 sendReinitiateMessageWithSubcommand:1];

          -[IDSDSession submitAWDMetricsForIDSSessionReinitiateRequested]( self,  "submitAWDMetricsForIDSSessionReinitiateRequested");
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946B70,  IDSDSessionReportTransportTypeKey);
          -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946A08,  IDSDSessionReportResultCodeKey);
          -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", Mutable);
        }
      }
    }

    else
    {
      uint64_t v42 = OSLogHandleForTransportCategory("IDSDSession");
      __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 uniqueID]);
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v47 = [v46 state];
        *(_DWORD *)buf = 138412546;
        __int16 v75 = v45;
        __int16 v76 = 1024;
        unsigned int v77 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate called, but our current state is not connected (current state: %u)",  buf,  0x12u);
      }

      uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
      if ((_DWORD)v49)
      {
        if (_IDSShouldLogTransport(v49))
        {
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 uniqueID]);
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v72 = [v52 state];
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate called, but our current state is not connected (current state: %u)");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            id v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v51, v72));
            __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 uniqueID]);
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            [v55 state];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate called, but our current state is not connected (current state: %u)");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v23 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v28 = [v27 enableQuickRelay];
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v30 = [v29 useQRDirectly];
      *(_DWORD *)buf = 138412802;
      __int16 v75 = v26;
      __int16 v76 = 1024;
      unsigned int v77 = v28;
      __int16 v78 = 1024;
      unsigned int v79 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate called, but we don't support reinitiate, enableQuickRelay: %d, useQRDirectly: %d",  buf,  0x18u);
    }

    uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
    if ((_DWORD)v32)
    {
      if (_IDSShouldLogTransport(v32))
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v36 = [v35 enableQuickRelay];
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        uint64_t v73 = [v37 useQRDirectly];
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate called, but we don't support reinitiate, enableQuickRelay: %d, useQRDirectly: %d");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v34, v36, v73));
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 uniqueID]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          [v40 enableQuickRelay];
          id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          [v41 useQRDirectly];
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate called, but we don't support reinitiate, enableQuickRelay: %d, useQRDirectly: %d");
        }
      }
    }
  }

- (void)_startReinitiateAsInitiator
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v3 setState:6];

  -[IDSDSession submitAWDMetricsForIDSSessionReinitiateStarted](self, "submitAWDMetricsForIDSSessionReinitiateStarted");
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946B88,  IDSDSessionReportTransportTypeKey);
  -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100946A08,  IDSDSessionReportResultCodeKey);
  -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", Mutable);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v5 setEnableSKE:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  [v6 invalidateSession:v8 isExpiryPurging:0];

  uint64_t v9 = OSLogHandleForTransportCategory("IDSDSession");
  dispatch_block_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate: disconnecting global link",  buf,  0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Session %@ reinitiate: disconnecting global link");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v20));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate: disconnecting global link");
      }
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v20));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B6638;
  v21[3] = &unk_1008F8C80;
  v21[4] = self;
  [v17 disconnectGlobalLinkForDevice:v19 isReinitiating:1 completionHandler:v21];
}

- (void)receivedReinitiateMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:IDSDSessionMessageReinitiateSubcommand]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = [v8 integerValue];
    switch((unint64_t)v11)
    {
      case 1uLL:
        -[IDSDSession _receivedReinitiateRequestMessage:fromURI:]( self,  "_receivedReinitiateRequestMessage:fromURI:",  v6,  v7);
        break;
      case 2uLL:
        -[IDSDSession _receivedReinitiateTeardownMessage:fromURI:]( self,  "_receivedReinitiateTeardownMessage:fromURI:",  v6,  v7);
        break;
      case 3uLL:
        -[IDSDSession _receivedReinitiateTeardownAckMessage:fromURI:]( self,  "_receivedReinitiateTeardownAckMessage:fromURI:",  v6,  v7);
        break;
      case 4uLL:
        -[IDSDSession _receivedReinitiateBringupMessage:fromURI:]( self,  "_receivedReinitiateBringupMessage:fromURI:",  v6,  v7);
        break;
      case 5uLL:
        -[IDSDSession _receivedReinitiateBringupAckMessage:fromURI:]( self,  "_receivedReinitiateBringupAckMessage:fromURI:",  v6,  v7);
        break;
      default:
        id v13 = v11;
        uint64_t v14 = OSLogHandleForTransportCategory("IDSDSession");
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
          *(_DWORD *)buf = 138412546;
          unsigned int v28 = v16;
          __int16 v29 = 2112;
          unsigned int v30 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unhandled reinitiate subcommand type %@ for session %@",  buf,  0x16u);
        }

        uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
        if ((_DWORD)v20)
        {
          if (_IDSShouldLogTransport(v20))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
            _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Unhandled reinitiate subcommand type %@ for session %@");

            if (_IDSShouldLog(0LL, @"IDSDSession"))
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v13,  v21,  v25));
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueID]);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Unhandled reinitiate subcommand type %@ for session %@");
            }
          }
        }

        break;
    }
  }

  else
  {
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10069937C();
    }
  }
}

- (void)_receivedReinitiateRequestMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v13 = [v12 isInitiator];
    uint64_t v14 = @"NO";
    *(_DWORD *)buf = 138412802;
    uint64_t v58 = v11;
    __int16 v59 = 2112;
    if (v13) {
      uint64_t v14 = @"YES";
    }
    id v60 = v6;
    __int16 v61 = 2112;
    uint64_t v62 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reinitiate request message received for session %@: %@, isInitiator: %@",  buf,  0x20u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v20 = [v19 isInitiator] ? @"YES" : @"NO";
    id v54 = v6;
    __int128 v56 = v20;
    __int128 v51 = v18;
    _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Reinitiate request message received for session %@: %@, isInitiator: %@");

    if (_IDSShouldLog(0LL, @"IDSDSession"))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v18, v6, v56));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      else {
        uint64_t v24 = @"NO";
      }
      id v54 = v6;
      __int128 v56 = (__CFString *)v24;
      __int128 v51 = v22;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate request message received for session %@: %@, isInitiator: %@");
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v51, v54, v56));
  unsigned __int8 v26 = [v25 supportsReinitiate];

  if ((v26 & 1) != 0)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v28 = [v27 state] == 5;

    if (v28)
    {
      -[IDSDSession _startReinitiateAsInitiator](self, "_startReinitiateAsInitiator");
    }

    else
    {
      uint64_t v37 = OSLogHandleForTransportCategory("IDSDSession");
      __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueID]);
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v42 = [v41 state];
        *(_DWORD *)buf = 138412546;
        uint64_t v58 = v40;
        __int16 v59 = 1024;
        LODWORD(v60) = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate request message, but our current state is not connected (current state: %u)",  buf,  0x12u);
      }

      uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
      if ((_DWORD)v44)
      {
        if (_IDSShouldLogTransport(v44))
        {
          id v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 uniqueID]);
          unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v55 = [v47 state];
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate request message, but our current state is not connected (current state: %u)");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v46, v55));
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 uniqueID]);
            __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            [v50 state];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate request message, but our current state is not connected (current state: %u)");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v29 = OSLogHandleForTransportCategory("IDSDSession");
    unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueID]);
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate request message, but we don't support reinitiate",  buf,  0xCu);
    }

    uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
    if ((_DWORD)v34)
    {
      if (_IDSShouldLogTransport(v34))
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v35 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate request message, but we don't support reinitiate");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v52));
          id v53 = (void *)objc_claimAutoreleasedReturnValue([v36 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate request message, but we don't support reinitiate");
        }
      }
    }
  }
}

- (void)_receivedReinitiateTeardownMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    *(_DWORD *)buf = 138412546;
    __int16 v66 = v11;
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reinitiate teardown message received for session %@: %@",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
      id v62 = v6;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Reinitiate teardown message received for session %@: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v58, v6));
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
        id v62 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate teardown message received for session %@: %@");
      }
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v58, v62));
  unsigned __int8 v17 = [v16 supportsReinitiate];

  if ((v17 & 1) != 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v19 = [v18 state] == 5;

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v20 setState:6];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      [v21 setEnableSKE:0];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
      [v22 invalidateSession:v24 isExpiryPurging:0];

      uint64_t v25 = OSLogHandleForTransportCategory("IDSDSession");
      unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
        *(_DWORD *)buf = 138412290;
        __int16 v66 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate teardown: disconnecting global link",  buf,  0xCu);
      }

      uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
      if ((_DWORD)v30)
      {
        if (_IDSShouldLogTransport(v30))
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueID]);
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate teardown: disconnecting global link");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v59));
            __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueID]);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate teardown: disconnecting global link");
          }
        }
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v59));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 uniqueID]);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000B77EC;
      v64[3] = &unk_1008F8C80;
      v64[4] = self;
      [v33 disconnectGlobalLinkForDevice:v35 isReinitiating:1 completionHandler:v64];
    }

    else
    {
      uint64_t v44 = OSLogHandleForTransportCategory("IDSDSession");
      id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 uniqueID]);
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        unsigned int v49 = [v48 state];
        *(_DWORD *)buf = 138412546;
        __int16 v66 = v47;
        __int16 v67 = 1024;
        LODWORD(v68) = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate teardown message, but our current state is not connected (current state: %u)",  buf,  0x12u);
      }

      uint64_t v51 = os_log_shim_legacy_logging_enabled(v50);
      if ((_DWORD)v51)
      {
        if (_IDSShouldLogTransport(v51))
        {
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 uniqueID]);
          id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
          id v63 = [v54 state];
          _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate teardown message, but our current state is not connected (current state: %u)");

          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            id v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v53, v63));
            __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 uniqueID]);
            unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
            [v57 state];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate teardown message, but our current state is not connected (current state: %u)");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v36 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 uniqueID]);
      *(_DWORD *)buf = 138412290;
      __int16 v66 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate teardown message, but we don't support reinitiate",  buf,  0xCu);
    }

    uint64_t v41 = os_log_shim_legacy_logging_enabled(v40);
    if ((_DWORD)v41)
    {
      if (_IDSShouldLogTransport(v41))
      {
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v42 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate teardown message, but we don't support reinitiate");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v60));
          __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v43 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate teardown message, but we don't support reinitiate");
        }
      }
    }
  }
}

- (void)_receivedReinitiateTeardownAckMessage:(id)a3 fromURI:(id)a4
{
  id v75 = a3;
  id v74 = a4;
  uint64_t v5 = OSLogHandleForTransportCategory("IDSDSession");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 138412546;
    __int16 v78 = v8;
    __int16 v79 = 2112;
    id v80 = v75;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Reinitiate teardown ack message received for session %@: %@",  buf,  0x16u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
      id v60 = v75;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Reinitiate teardown ack message received for session %@: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v58, v75));
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
        id v60 = v75;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate teardown ack message received for session %@: %@");
      }
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v58, v60));
  BOOL v14 = [v13 state] == 6;

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v16 = [v15 sharedSession];

    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v18 = v17;
    if (v16)
    {
      theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v17 getQuickRelayAllocateOptions:&off_1009469A8]);

      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 groupID]);

      if (v20)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_GroupID, v20);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100698ED8();
      }

      id v35 = IDSGroupSessionForceQRSession;
      if (v35)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_TestOptions, v35);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100699014();
      }

      uint64_t v34 = self;
      self->_shouldConnectToQRServer = 1;
    }

    else
    {
      theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v17 getQuickRelayAllocateOptions:&off_100946978]);

      uint64_t v34 = self;
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](v34, "qrAllocator"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
    [v36 clearResponseFromQRGroupID:v38];

    uint64_t v39 = OSLogHandleForTransportCategory("IDSDSession");
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v41 uniqueID]);
      *(_DWORD *)buf = 138412290;
      __int16 v78 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate: setting up new QR allocation",  buf,  0xCu);
    }

    uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
    if ((_DWORD)v44)
    {
      if (_IDSShouldLogTransport(v44))
      {
        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v45 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate: setting up new QR allocation");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v59));
          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v46 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate: setting up new QR allocation");
        }
      }
    }

    id v65 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator", v59));
    id v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v71 = (void *)objc_claimAutoreleasedReturnValue([v72 destinations]);
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v71 allObjects]);
    BOOL v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v63 = (void *)objc_claimAutoreleasedReturnValue([v70 uniqueID]);
    id v68 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v69 accountID]);
    __int16 v66 = (void *)objc_claimAutoreleasedReturnValue([v68 accountWithUniqueID:v67]);
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v66 _registrationCert]);
    unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 fromURI]);
    unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 unprefixedURI]);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 _bestGuessURI]);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 accountID]);
    id v54 = (void *)objc_claimAutoreleasedReturnValue([v51 accountWithUniqueID:v53]);
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 service]);
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 identifier]);
    id v57 =  [v65 setupNewAllocation:v64 sessionID:v63 fromIdentity:v62 fromURI:v50 fromService:v56 options:theDict connectReadyHandler:0];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger"));
    [v32 sendReinitiateMessageWithSubcommand:4];
    goto LABEL_32;
  }

  uint64_t v21 = OSLogHandleForTransportCategory("IDSDSession");
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v26 = [v25 state];
    *(_DWORD *)buf = 138412546;
    __int16 v78 = v24;
    __int16 v79 = 1024;
    LODWORD(v80) = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate teardown ack message, but our current state is not reinitiating (current state: %u)",  buf,  0x12u);
  }

  uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
  if ((_DWORD)v28)
  {
    if (_IDSShouldLogTransport(v28))
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueID]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v61 = [v31 state];
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate teardown ack message, but our current state is not reinitiating (current state: %u)");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v30, v61));
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary uniqueID](theDict, "uniqueID"));
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        [v33 state];
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate teardown ack message, but our current state is not reinitiating (current state: %u)");

LABEL_32:
      }
    }
  }
}

- (void)_receivedReinitiateBringupMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    *(_DWORD *)buf = 138412546;
    unsigned int v49 = v11;
    __int16 v50 = 2112;
    id v51 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reinitiate bringup message received for session %@: %@",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
      id v46 = v6;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Reinitiate bringup message received for session %@: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v44, v6));
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
        id v46 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate bringup message received for session %@: %@");
      }
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v44, v46));
  BOOL v17 = [v16 state] == 6;

  if (v17)
  {
    uint64_t v18 = OSLogHandleForTransportCategory("IDSDSession");
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueID]);
      *(_DWORD *)buf = 138412290;
      unsigned int v49 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Session %@ reinitiate bringup: requesting allocation for recipient",  buf,  0xCu);
    }

    uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
    if ((_DWORD)v23)
    {
      if (_IDSShouldLogTransport(v23))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueID]);
        _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ reinitiate bringup: requesting allocation for recipient");

        if (_IDSShouldLog(0LL, @"IDSDSession"))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v45));
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ reinitiate bringup: requesting allocation for recipient");
        }
      }
    }

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator", v45));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
    [v26 requestAllocationForRecipient:v28];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v29 setState:5];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger"));
    [v30 sendReinitiateMessageWithSubcommand:5];
    goto LABEL_15;
  }

  uint64_t v31 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v36 = [v35 state];
    *(_DWORD *)buf = 138412546;
    unsigned int v49 = v34;
    __int16 v50 = 1024;
    LODWORD(v51) = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate bringup message, but our current state is not reintiating (current state: %u)",  buf,  0x12u);
  }

  uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
  if ((_DWORD)v38)
  {
    if (_IDSShouldLogTransport(v38))
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueID]);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v47 = [v41 state];
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate bringup message, but our current state is not reintiating (current state: %u)");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v40, v47));
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueID]);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        [v43 state];
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate bringup message, but our current state is not reintiating (current state: %u)");

LABEL_15:
      }
    }
  }
}

- (void)_receivedReinitiateBringupAckMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    *(_DWORD *)buf = 138412546;
    __int128 v56 = v11;
    __int16 v57 = 2112;
    id v58 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reinitiate bringup ack message received for session %@: %@",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
      id v53 = v6;
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Reinitiate bringup ack message received for session %@: %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v51, v6));
        id v51 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
        id v53 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate bringup ack message received for session %@: %@");
      }
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v51, v53));
  BOOL v17 = [v16 state] == 6;

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v19 = [v18 sharedSession];

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 pushToken]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession qrAllocator](self, "qrAllocator"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 rawToken]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 getRelaySessionIDForIDSSessionID:v23 pushToken:v24]);

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v27 useSecureQRControlMessage]));

      if (v28)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v28);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006993E8();
      }

      uint64_t v43 = OSLogHandleForTransportCategory("IDSDSession");
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v56 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Reinitiate accepted relay-session-id %@",  buf,  0xCu);
      }

      uint64_t v46 = os_log_shim_legacy_logging_enabled(v45);
      if ((_DWORD)v46)
      {
        if (_IDSShouldLogTransport(v46))
        {
          __int16 v52 = v25;
          _IDSLogTransport(@"IDSDSession", @"IDS", @"Reinitiate accepted relay-session-id %@");
          if (_IDSShouldLog(0LL, @"IDSDSession"))
          {
            __int16 v52 = v25;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Reinitiate accepted relay-session-id %@");
          }
        }
      }

      id v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession utunController](self, "utunController", v52));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 uniqueID]);
      [v47 setAcceptedRelaySession:v49 relaySessionID:v25 options:Mutable];
    }

    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    [v50 setState:5];

    -[IDSDSession submitAWDMetricsForIDSSessionReinitiateConnected]( self,  "submitAWDMetricsForIDSSessionReinitiateConnected");
    CFMutableDictionaryRef v40 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[__CFDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  &off_100946BA0,  IDSDSessionReportTransportTypeKey);
    -[__CFDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  &off_100946A08,  IDSDSessionReportResultCodeKey);
    -[IDSDSession addQREventForRTCReport:](self, "addQREventForRTCReport:", v40);
    goto LABEL_27;
  }

  uint64_t v29 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueID]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v34 = [v33 state];
    *(_DWORD *)buf = 138412546;
    __int128 v56 = v32;
    __int16 v57 = 1024;
    LODWORD(v58) = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Session %@ received reinitiate bringup ack message, but our current state is not reintiating (current state: %u)",  buf,  0x12u);
  }

  uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
  if ((_DWORD)v36)
  {
    if (_IDSShouldLogTransport(v36))
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v54 = [v39 state];
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Session %@ received reinitiate bringup ack message, but our current state is not reintiating (current state: %u)");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        CFMutableDictionaryRef v40 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v38, v54));
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary uniqueID](v40, "uniqueID"));
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
        [v42 state];
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Session %@ received reinitiate bringup ack message, but our current state is not reintiating (current state: %u)");

LABEL_27:
      }
    }
  }
}

- (void)didSessionReinitiated
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSDSession");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<%@> IDSDSession didSessionReinitiated",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"IDSDSession"))
  {
    uint64_t v15 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"<%@> IDSDSession didSessionReinitiated");
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState", v15));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v7 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    char v16 = 1;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v9;
    __int128 v18 = v9;
    IDSByteBufferInitForWrite(buf);
    IDSByteBufferWriteField(buf, 34LL, &v16, 1LL);
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:]( self,  "writeToClientChannel:packetBuffer:metaData:metadataSize:",  self->_clientChannel,  0LL);
    IDSByteBufferRelease(buf);
    return;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  if ([v8 clientType] == (id)5)
  {

    goto LABEL_10;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v11 = [v10 clientType] == (id)6;

  if (v11) {
    goto LABEL_12;
  }
  uint64_t v12 = OSLogHandleForIDSCategory("IDSDSession");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "<%@> need a client channel to send the event kClientChannelMetadataType_SessionReinitiated",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v14))
  {
    if (_IDSShouldLog(0LL, @"IDSDSession")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"<%@> need a client channel to send the event kClientChannelMetadataType_SessionReinitiated");
    }
  }

- (BOOL)isWithDefaultPairedDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 destinations]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  LOBYTE(v3) = [v7 destinationIsDefaultPairedDevice:v6];

  return (char)v3;
}

- (void)invitationDeclined
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v2 sendCancelInvitationToDestinations:0 remoteEndReason:30 data:0];
}

- (void)sendCancelInvitationMessage
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v2 sendCancelInvitationToDestinations:0 remoteEndReason:0 data:0];
}

- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v7 sendInvitationWithOptions:v6 declineOnError:v4];
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v7 sendInvitationWithData:v6 declineOnError:v4];
}

- (void)cancelInvitation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v2 cancelInvitation];
}

- (void)cancelInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v5 cancelInvitationWithData:v4];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v4 cancelInvitationWithRemoteEndedReasonOverride:v3];
}

- (void)acceptInvitation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v2 acceptInvitation];
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v5 acceptInvitationWithData:v4];
}

- (void)declineInvitation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v2 declineInvitation];
}

- (void)declineInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v5 declineInvitationWithData:v4];
}

- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v11 declineInvitationWithData:v10 forceFromURI:v9 additionalMessageAttributes:v8];
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B954C;
  v10[3] = &unk_1008F64D0;
  void v10[4] = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imSetByApplyingBlock:", v10));

  [v8 sendSessionMessage:v7 toDestinations:v9];
}

- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v8 receivedAcceptMessage:v7 fromURI:v6];
}

- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v8 receivedDeclineMessage:v7 fromURI:v6];
}

- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v8 receivedCancelMessage:v7 fromURI:v6];
}

- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger"));
  [v8 receivedSessionMessage:v7 fromURI:v6];
}

- (void)receivedEndMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession messenger](self, "messenger"));
  [v8 receivedEndMessage:v7 fromURI:v6];
}

- (void)setRemoteBlob:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v5 setRemoteBlob:v4];
}

- (void)setInviteTimeout:(int64_t)a3
{
  double v3 = (double)a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v4 setInviteTimeout:v3];
}

- (void)setQuickRelaySessionToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v5 setQuickRelaySessionToken:v4];
}

- (void)setRemoteUseCloudPairedControlChannel:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v5 setRemoteUseCloudPairedControlChannel:v4];
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v5 setRemoteUseCloudPairedControlChannel:v4];
}

- (void)setSSRCRecv:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v4 setSSRCRecv:v3];
}

- (void)setSeqRecvStart:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession invitationManager](self, "invitationManager"));
  [v4 setSeqRecvStart:v3];
}

- (IDSDGroupStatusNotificationController)groupStatusNotificationController
{
  groupStatusNotificationController = self->_groupStatusNotificationController;
  if (groupStatusNotificationController) {
    return groupStatusNotificationController;
  }
  else {
    return (IDSDGroupStatusNotificationController *)(id)objc_claimAutoreleasedReturnValue( +[IDSDGroupStatusNotificationController sharedInstance]( &OBJC_CLASS___IDSDGroupStatusNotificationController,  "sharedInstance"));
  }
}

- (NSSet)destinations
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destinations]);

  return (NSSet *)v3;
}

- (id)destinationsLightweightStatus
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destinationsLightweightStatus]);

  return v3;
}

- (id)uniqueID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueID]);

  return v3;
}

- (BOOL)isInitiator
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned __int8 v3 = [v2 isInitiator];

  return v3;
}

- (BOOL)enableQuickRelay
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned __int8 v3 = [v2 enableQuickRelay];

  return v3;
}

- (int64_t)clientType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = [v2 clientType];

  return (int64_t)v3;
}

- (id)participantID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 participantID]);

  return v3;
}

- (id)accountID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountID]);

  return v3;
}

- (id)groupID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupID]);

  return v3;
}

- (id)fromURI
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fromURI]);

  return v3;
}

- (id)clientChannelUUID
{
  return self->_clientChannelUUID;
}

- (unsigned)state
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned int v3 = [v2 state];

  return v3;
}

- (BOOL)isScreenSharingSession
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned __int8 v3 = [v2 isScreenSharingSession];

  return v3;
}

- (BOOL)isLightweightParticipant
{
  return self->_isLightweightParticipant;
}

- (void)_setClientType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  [v4 setClientType:a3];
}

- (BOOL)_useBTDatagramPipe
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  unsigned __int8 v3 = [v2 useBTDatagramPipe];

  return v3;
}

- (unint64_t)connectionCountHint
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = [v2 connectionCountHint];

  return (unint64_t)v3;
}

- (NSArray)requiredCapabilities
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredCapabilities]);

  return (NSArray *)v3;
}

- (NSArray)requiredLackOfCapabilities
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredLackOfCapabilities]);

  return (NSArray *)v3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (BOOL)disallowCellularInterface
{
  return self->_disallowCellularInterface;
}

- (BOOL)disallowWifiInterface
{
  return self->_disallowWifiInterface;
}

- (unsigned)groupSessionState
{
  return self->_groupSessionState;
}

- (NSString)instanceID
{
  return self->_instanceID;
}

- (IDSDSessionInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (IDSDSessionMessenger)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (NSNumber)qrError
{
  return self->_qrError;
}

- (void)setQrError:(id)a3
{
}

- (NSNumber)qrReason
{
  return self->_qrReason;
}

- (void)setQrReason:(id)a3
{
}

- (BOOL)shouldConnectToQRServer
{
  return self->_shouldConnectToQRServer;
}

- (void)setShouldConnectToQRServer:(BOOL)a3
{
  self->_shouldConnectToQRServer = a3;
}

- (BOOL)sharedSessionHasJoined
{
  return self->_sharedSessionHasJoined;
}

- (void)setSharedSessionHasJoined:(BOOL)a3
{
  self->_BOOL sharedSessionHasJoined = a3;
}

- (NSData)encryptedDataBlob
{
  return self->_encryptedDataBlob;
}

- (NSData)encryptedMirageHandshakeBlob
{
  return self->_encryptedMirageHandshakeBlob;
}

- (IDSGFTMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (BOOL)handOffOverQREnabled
{
  return self->_handOffOverQREnabled;
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (void)setGroupStatusNotificationController:(id)a3
{
}

- (NSSet)serverDesiredMaterials
{
  return (NSSet *)objc_getProperty(self, a2, 920LL, 1);
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSUTunController)utunController
{
  return self->_utunController;
}

- (void)setUtunController:(id)a3
{
}

- (IDSQuickRelayAllocator)qrAllocator
{
  return self->_qrAllocator;
}

- (void).cxx_destruct
{
}

- (BOOL)_shouldSubmitMetricsForThisSession
{
  awdStartTimestamp = self->_awdStartTimestamp;
  if (!awdStartTimestamp)
  {
    id v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v5 = self->_awdStartTimestamp;
    self->_awdStartTimestamp = v4;

    awdStartTimestamp = self->_awdStartTimestamp;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
  BOOL v7 = -[IDSDSession _shouldSubmitMetricsBasedOnDate:isInitiator:]( self,  "_shouldSubmitMetricsBasedOnDate:isInitiator:",  awdStartTimestamp,  [v6 isInitiator]);

  return v7;
}

- (BOOL)_shouldSubmitMetricsBasedOnDate:(id)a3 isInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  BOOL v7 = -[NSTimeZone initWithName:](objc_alloc(&OBJC_CLASS___NSTimeZone), "initWithName:", @"GMT");
  -[NSCalendar setTimeZone:](v6, "setTimeZone:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v6, "components:fromDate:", 112LL, v5));

  unint64_t v9 = (unint64_t)[v8 day];
  id v10 = [v8 hour];
  uint64_t v11 = (uint64_t)[v8 minute];
  if (v10 == (id)23 && v11 > 54)
  {
    BOOL v12 = 0;
  }

  else
  {
    BOOL v13 = (v9 & 1) == 0;
    if (v4) {
      BOOL v13 = (v9 & 0x8000000000000001LL) == 1;
    }
    if (v10) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v11 < 6;
    }
    BOOL v12 = !v14 && v13;
  }

  return v12;
}

- (void)submitAWDMetricsForIDSSessionStarted
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v3 = objc_alloc(&OBJC_CLASS___IDSSessionStartedMetric);
    awdUniqueId = self->_awdUniqueId;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 peerProtocolVersion]));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v18 = objc_msgSend( v3,  "initWithGuid:protocolVersionNumber:serviceName:clientType:",  awdUniqueId,  v6,  v8,  objc_msgSend(v9, "clientType"));

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v10 logMetric:v18];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    BOOL v12 = self->_awdUniqueId;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v13 peerProtocolVersion]));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceName]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    objc_msgSend( v11,  "sessionStartedWithAWDGUID:protocolVersionNumber:serviceName:clientType:",  v12,  v14,  v16,  objc_msgSend(v17, "clientType"));
  }

- (void)submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:(id)a3
{
  id v7 = a3;
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v4 = [[IDSSessionInvitationSentMetric alloc] initWithGuid:self->_awdUniqueId numberOfRecipients:v7];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v5 logMetric:v4];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v6 sessionInvitationSentWithAWDGUID:self->_awdUniqueId numberOfRecipients:v7];
  }
}

- (void)submitAWDMetricsForIDSSessionInvitationReceived
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionInvitationReceivedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionInvitationReceivedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:(unsigned int)a3 numberOfRecipients:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v6 = [[IDSSessionCancelSentMetric alloc] initWithGuid:self->_awdUniqueId numberOfRecipients:v9 remoteSessionEndReason:v4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v7 logMetric:v6];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v8 sessionCancelSentWithAWDGUID:self->_awdUniqueId numberOfRecipients:v9 remoteSessionEndReason:v4];
  }
}

- (void)submitAWDMetricsForIDSSessionCancelReceived
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionCanceledMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionCancelReceivedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionDeclineSent
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionDeclineSentMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionDeclineSentWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionDeclineReceived
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionDeclineReceivedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionDeclineReceivedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionAcceptSent
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionAcceptSentMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionAcceptSentWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionAcceptReceived
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionAcceptReceivedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionAcceptReceivedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionConnected
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionConnectedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionConnectedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionReinitiateRequested
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionReinitiateRequestedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionReinitiateRequestedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionReinitiateStarted
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionReinitiateStartedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionReinitiateStartedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionReinitiateConnected
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v5 = [[IDSSessionReinitiateConnectedMetric alloc] initWithGuid:self->_awdUniqueId];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v3 logMetric:v5];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v4 sessionReinitiateConnectedWithAWDGUID:self->_awdUniqueId];
  }

- (void)submitAWDMetricsForIDSSessionCompleted
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 destinations]);
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v4));

    unsigned int v28 = sub_1001B0038(v34);
    id v30 = objc_alloc(&OBJC_CLASS___IDSSessionCompleted);
    awdUniqueId = self->_awdUniqueId;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v33 peerProtocolVersion]));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceName]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    id v23 = [v31 clientType];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v21 = [v27 enableQuickRelay];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v20 = [v25 useQRDirectly];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v19 = [v22 isInitiator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v18 = [v5 isScreenSharingSession];
    unsigned __int8 v6 = -[IDSDSession isWithDefaultPairedDevice](self, "isWithDefaultPairedDevice");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v8 = [v7 transportType];
    unint64_t initialLinkType = self->_initialLinkType;
    int64_t linkProtocol = self->_linkProtocol;
    unsigned int reason = self->_reason;
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sessionDuration](self, "sessionDuration"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession connectDuration](self, "connectDuration"));
    BYTE1(v17) = self->_disallowCellularInterface;
    LOBYTE(v17) = self->_disallowWifiInterface;
    HIDWORD(v16) = v8;
    BYTE2(v16) = v6;
    BYTE1(v16) = v18;
    LOBYTE(v16) = v19;
    id v14 = objc_msgSend( v30,  "initWithGuid:protocolVersionNumber:serviceName:clientType:isQREnabled:isUsingQRDirectly:isInitiator:isScreen SharingSessionType:isWithDefaultPairedDevice:transportType:linkType:linkProtocol:endedReason:destinationType :durationOfSession:durationToConnect:isWifiInterfaceDisallowed:isCellularInterfaceDisallowed:",  awdUniqueId,  v26,  v24,  v23,  v21,  v20,  v16,  __PAIR64__(linkProtocol, initialLinkType),  __PAIR64__(v28, reason),  v12,  v13,  v17);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v15 logMetric:v14];
  }

- (void)submitAWDMetricsForIDSSessionWithEndReason:(unsigned int)a3
{
  if (-[IDSDSession _shouldSubmitMetricsForThisSession](self, "_shouldSubmitMetricsForThisSession"))
  {
    unsigned int v39 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connection]);
    unsigned int v38 = [v6 natType];

    if (qword_1009C0850
      || ((id v7 = (void **)IMWeakLinkSymbol("GKSErrorDetailedError", @"GameKitServices")) == 0LL
        ? (unsigned int v8 = 0LL)
        : (unsigned int v8 = *v7),
          objc_storeStrong((id *)&qword_1009C0850, v8),
          qword_1009C0850))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:qword_1009C0850]);
      uint64_t v13 = (uint64_t)[v12 intValue];
    }

    else
    {
      uint64_t v13 = 0xFFFFFFFFLL;
    }

    CFMutableDictionaryRef v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
    if (qword_1009C0858
      || ((id v14 = (void **)IMWeakLinkSymbol("GKSErrorReturnCode", @"GameKitServices")) == 0LL
        ? (uint64_t v15 = 0LL)
        : (uint64_t v15 = *v14),
          objc_storeStrong((id *)&qword_1009C0858, v15),
          qword_1009C0858))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 error]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:qword_1009C0858]);
      uint64_t v20 = (uint64_t)[v19 intValue];
    }

    else
    {
      uint64_t v20 = 0xFFFFFFFFLL;
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
    id v36 = objc_alloc(&OBJC_CLASS___IDSSessionEndedMetric);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 error]);
    id v35 = [v22 code];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sessionDuration](self, "sessionDuration"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession connectDuration](self, "connectDuration"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connection]);
    unsigned int v27 = [v26 connectionType];
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v38));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession sharedState](self, "sharedState"));
    LOBYTE(v34) = [v29 isInitiator];
    BYTE4(v33) = 0;
    LODWORD(v33) = v27;
    LODWORD(v32) = 0;
    id v30 = objc_msgSend( v36,  "initWithGuid:endedReason:genericError:gameKitError:conferenceMiscError:callDuration:networkCheckResult:dataR ate:gksError:connectDuration:remoteNetworkConnection:localNetworkConnection:connectionType:usesRelay:current NATType:remoteNATType:relayConnectDuration:isInitiator:linkQuality:gksReturnCode:",  0,  v39,  v35,  0,  0,  v23,  v32,  &off_1009476E0,  v40,  v24,  0x200000002,  v33,  v28,  &off_1009476F8,  0,  v34,  &off_100947710,  v37);

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v31 logMetric:v30];
  }

@end