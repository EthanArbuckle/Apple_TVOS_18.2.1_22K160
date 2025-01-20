@interface RPCompanionLinkDaemon
+ (id)sharedCompanionLinkDaemon;
- (BOOL)_allowMessageForRegistrationOptions:(id)a3 cnx:(id)a4;
- (BOOL)_allowStreamRequest:(id)a3 xpcCnx:(id)a4 rpCnx:(id)a5;
- (BOOL)_clientBLEActionDiscoveryShouldRun;
- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun;
- (BOOL)_clientBLENeedsCLinkAdvertiserShouldRun;
- (BOOL)_clientBLETriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 error:(id *)a5;
- (BOOL)_clientBonjourAWDLBrowserShouldRun;
- (BOOL)_clientBonjourCheckFoundPairedDevice:(id)a3 publicID:(id)a4;
- (BOOL)_clientBonjourCheckLostPairedDevice:(id)a3 publicID:(id)a4;
- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4;
- (BOOL)_clientConnectionStartOnDemand:(id)a3 xpcCnx:(id)a4 error:(id *)a5;
- (BOOL)_clientConnectionStartUnauth:(id)a3 client:(id)a4 publicID:(id)a5 xpcCnx:(id)a6 error:(id *)a7;
- (BOOL)_clientShouldFindNonSameAccountDevices;
- (BOOL)_destinationID:(id)a3 matchesCnx:(id)a4;
- (BOOL)_destinationID:(id)a3 matchesProxyDeviceOnCnx:(id)a4;
- (BOOL)_haveActiveClientConnectionsOnAWDL;
- (BOOL)_haveActiveServerConnectionsOnAWDL;
- (BOOL)_homeKitAuthMatchForBonjourDevice:(id)a3;
- (BOOL)_proxyDevice:(id)a3 isEqualTo:(id)a4;
- (BOOL)_proxyDevice:(id)a3 receivedRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 cnx:(id)a8;
- (BOOL)_receivedRequestID:(id)a3 onXPCCnx:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 unauth:(BOOL)a8 rpCnx:(id)a9;
- (BOOL)_serverBLENeedsCLinkScannerScreenOff;
- (BOOL)_serverBonjourAWDLAdvertiserShouldRun;
- (BOOL)_serverBonjourAWDLShouldRun;
- (BOOL)_serverBonjourShouldRun;
- (BOOL)_serverNearbyActionV2DiscoveryShouldRun;
- (BOOL)_serverNearbyInfoV2DiscoveryShouldRun;
- (BOOL)_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:(int)a3;
- (BOOL)_serverTCPHasActiveConnections;
- (BOOL)_shouldReceiveActivityLevelOverWiFi:(int64_t)a3;
- (BOOL)_shouldSendActivityLevelOverWiFi;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)createDeviceToEndpointMappingForDeviceID:(id)a3 endpointUUID:(id *)a4 error:(id *)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)isNearbyActionV2AdvertiserActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 error:(id *)a5;
- (NSDictionary)destinationIdentifierModelMap;
- (NSDictionary)destinationIdentifierRelMap;
- (NSMutableDictionary)activeSessions;
- (NSMutableSet)activeServers;
- (NSMutableSet)rbsPIDSet;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkDaemon)init;
- (RPCompanionLinkDevice)localDeviceInfo;
- (RPHomeKitManager)rpHomeKitManager;
- (id)_addProxyIdentifier:(id)a3 toDictionary:(id)a4;
- (id)_checkForProxyOrLocalDestinations:(id)a3 eventID:(id)a4 event:(id)a5 options:(id)a6 completion:(id)a7;
- (id)_clientBLENeedsCLinkTargetDevice;
- (id)_clientCreateConnection:(id)a3 xpcCnx:(id)a4 error:(id *)a5;
- (id)_clientShouldConnectOverBonjour:(id)a3 device:(id)a4 identities:(id)a5;
- (id)_contextCollectorDevice;
- (id)_discoveryNonceOrRotate:(BOOL)a3;
- (id)_eventForHomeHubDevice:(id)a3;
- (id)_filterHomeKitUserIdentifiers:(id)a3;
- (id)_findDeviceWithDevice:(id)a3 deviceMap:(id)a4 matchedIdentifier:(id *)a5;
- (id)_findExistingActiveDevice:(id)a3;
- (id)_findMatchingAWDLBonjourDevice:(id)a3;
- (id)_findWiFiConnectionByID:(id)a3;
- (id)_getAppleID;
- (id)_homeKitDecryptRotatingIDForBonjourDevice:(id)a3;
- (id)_serverBonjourAuthTagString;
- (id)_serverBonjourAuthTagStringWithData:(id)a3;
- (id)_serverBonjourTempAuthTagStringWithData:(id)a3;
- (id)_serverTCPHandleConnectionStarted:(id)a3;
- (id)_xpcConnections:(id)a3 withControlFlags:(unint64_t)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)findAuthAWDLPairingModeDeviceForIdentifier:(id)a3;
- (id)findConnectedDeviceForIdentifier:(id)a3 controlFlags:(unint64_t)a4 cnx:(id *)a5;
- (id)findDeviceFromID:(id)a3;
- (id)findServerClientFromID:(id)a3 senderIDS:(id)a4;
- (id)findUnauthDeviceForIdentifier:(id)a3;
- (id)homeHubDeviceForLaunchInstanceID:(id)a3;
- (id)logDictionaryOfStringArrays:(id)a3 withPrefix:(id)a4;
- (int)_airPlayLeaderStateUncached;
- (int)_localMediaAccessControlSetting;
- (int64_t)_sessionsActiveOnConnection:(id)a3 xpcConnection:(id)a4;
- (unint64_t)_nearbyActionDeviceActionTypes;
- (unsigned)_controlFlagsToNearbyActionType:(unint64_t)a3;
- (void)_activate;
- (void)_activeDeviceAdded:(id)a3 cnx:(id)a4;
- (void)_activeDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_activeDeviceChangedForConnection:(id)a3 bonjourDevice:(id)a4;
- (void)_activeDeviceRemoved:(id)a3 cnx:(id)a4;
- (void)_addApplicationPID:(id)a3;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_bleServerHandleConnectionEnded:(id)a3;
- (void)_bleServerHandleConnectionStarted:(id)a3;
- (void)_btPipeConnectionEnded:(id)a3;
- (void)_btPipeConnectionStart;
- (void)_btPipeEnsureStarted;
- (void)_btPipeEnsureStopped;
- (void)_btPipeHandleStateChanged:(id)a3;
- (void)_btPipeSetup:(id)a3 withPriority:(int)a4;
- (void)_btPipeSyncKeysIfNeeded;
- (void)_btPipeTearDown:(id)a3;
- (void)_clientBLEActionDiscoveryEnsureStarted;
- (void)_clientBLEActionDiscoveryEnsureStopped;
- (void)_clientBLEDiscoveryDeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4;
- (void)_clientBLEDiscoveryDeviceLost:(id)a3 force:(BOOL)a4 deviceFlags:(unsigned __int8)a5;
- (void)_clientBLEDiscoveryEnsureStarted;
- (void)_clientBLEDiscoveryEnsureStopped;
- (void)_clientBLEFamilyDeviceReportChanges;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserRestart;
- (void)_clientBLENearbyActionV2AdvertiserUpdate;
- (void)_clientBLENeedsCLinkAdvertiserEnsureStarted;
- (void)_clientBLENeedsCLinkAdvertiserEnsureStopped;
- (void)_clientBLENeedsCLinkAdvertiserRestart;
- (void)_clientBLENeedsCLinkAdvertiserUpdate;
- (void)_clientBonjourAWDLBrowserEnsureStarted;
- (void)_clientBonjourAWDLBrowserEnsureStopped;
- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3;
- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3;
- (void)_clientBonjourEnsureStarted;
- (void)_clientBonjourEnsureStopped;
- (void)_clientBonjourFoundUnauthDevice:(id)a3 isAWDLDevice:(BOOL)a4;
- (void)_clientBonjourLostDevice:(id)a3;
- (void)_clientBonjourLostUnauthDevice:(id)a3;
- (void)_clientBonjourReevaluateAllDevices;
- (void)_clientBonjourReevaluateUnauthDevices;
- (void)_clientConnectionEnded:(id)a3 uniqueID:(id)a4;
- (void)_clientConnectionEndedUnauth:(id)a3 publicID:(id)a4;
- (void)_clientConnectionStart:(id)a3 controlFlags:(unint64_t)a4 uniqueID:(id)a5 identity:(id)a6;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientOnDemandAWDLDiscoveryStartForXPC:(id)a3;
- (void)_clientOnDemandAWDLDiscoveryTimedOutForDevice:(id)a3 xpcCnx:(id)a4;
- (void)_clientOnDemandConnectionEnded:(id)a3 uniqueID:(id)a4;
- (void)_clientOnDemandDiscoveryStart:(id)a3 xpcCnx:(id)a4;
- (void)_clientPurgeUnauthAWDLDevices;
- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)_clientReportFoundDevice:(id)a3;
- (void)_clientReportLostDevice:(id)a3;
- (void)_clientSendActivityLevelOverWiFiIfNecessary;
- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3;
- (void)_configureConnectionForPairing:(id)a3;
- (void)_connectionConfigureCommon:(id)a3;
- (void)_connectionStateChanged:(int)a3 cnx:(id)a4;
- (void)_createDestinationIdentifierMaps;
- (void)_createRequestEntryForXid:(id)a3 requestID:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_deliverEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7 outError:(id *)a8;
- (void)_disconnectRemovedSharedHomeDevices;
- (void)_disconnectUnauthConnections;
- (void)_disconnectUnpairedDevices;
- (void)_duetSyncEnsureStarted;
- (void)_duetSyncEnsureStopped;
- (void)_existingProxyDeviceUpdated:(id)a3 event:(id)a4 isLocal:(BOOL)a5;
- (void)_forEachConnectionWithHandler:(id)a3;
- (void)_forEachMatchingDestinationID:(id)a3 handler:(id)a4;
- (void)_forEachUniqueMatchingDestinationID:(id)a3 handler:(id)a4;
- (void)_handleContextCollectorProxyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleContextCollectorRequest:(id)a3 responseHandler:(id)a4;
- (void)_hidEnsureStarted;
- (void)_hidEnsureStopped;
- (void)_homeHubDeviceAdded:(id)a3;
- (void)_homeHubDeviceRemoved:(id)a3;
- (void)_homeKitEnsureStarted;
- (void)_homeKitEnsureStopped;
- (void)_homeKitGetPairingIdentities;
- (void)_homeKitGetUserInfo:(id)a3;
- (void)_homeKitIdentityUpdated:(id)a3 error:(id)a4;
- (void)_homeKitPairingUpdated:(id)a3;
- (void)_homeKitSelfAccessoryMediaAccessUpdated;
- (void)_homeKitSelfAccessoryMediaSystemUpdated:(int)a3;
- (void)_homeKitSelfAccessoryUpdated;
- (void)_homeKitUpdateInfo:(BOOL)a3;
- (void)_homeKitUpdateUserIdentifiers;
- (void)_interestReceived:(id)a3 cnx:(id)a4;
- (void)_interestRemoveForCnx:(id)a3;
- (void)_interestSendEventID:(id)a3 event:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_localDeviceCleanup;
- (void)_localDeviceUpdate;
- (void)_mediaControlEnsureStarted;
- (void)_mediaControlEnsureStopped;
- (void)_mediaRemoteIDGet;
- (void)_mediaRouteIDGet;
- (void)_miscEnsureStarted;
- (void)_miscEnsureStopped;
- (void)_miscHandleLaunchAppRequest:(id)a3 responseHandler:(id)a4;
- (void)_miscHandleSpeakRequest:(id)a3 responseHandler:(id)a4;
- (void)_personalDeviceUpdate;
- (void)_processPendingLostBLEDevices;
- (void)_processPendingLostNeedsCLinkDevices;
- (void)_proxyDevice:(id)a3 loopbackRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_proxyDeviceAdd:(id)a3 options:(id)a4 eventID:(id)a5 deviceInfo:(id)a6 cnx:(id)a7;
- (void)_proxyDeviceListUpdated:(id)a3 content:(id)a4 options:(id)a5 cnx:(id)a6;
- (void)_proxyDeviceRemove:(id)a3 options:(id)a4 cnx:(id)a5;
- (void)_proxyLocalDeviceUpdateOnConnection:(id)a3 launchInstanceID:(id)a4;
- (void)_reachabilityEnsureStarted;
- (void)_reachabilityEnsureStopped;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7;
- (void)_receivedEventID:(id)a3 onXPCCnx:(id)a4 event:(id)a5 options:(id)a6 unauth:(BOOL)a7 rpCnx:(id)a8;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 unauth:(BOOL)a7 cnx:(id)a8;
- (void)_registerConnectionRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_removeApplicationPID:(id)a3;
- (void)_reportXPCMatchingDiscoveryCLink;
- (void)_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:(id)a3;
- (void)_schedulePendingLostBLEDeviceTimer;
- (void)_schedulePendingLostNeedsCLinkDeviceTimer;
- (void)_sendProxyDeviceUpdateToPeer:(id)a3;
- (void)_serverBLENeedsCLinkScannerDeviceFound:(id)a3;
- (void)_serverBLENeedsCLinkScannerDeviceLost:(id)a3;
- (void)_serverBLENeedsCLinkScannerEnsureStarted;
- (void)_serverBLENeedsCLinkScannerEnsureStopped;
- (void)_serverBTAddressChanged;
- (void)_serverBTAddressMonitorEnsureStarted;
- (void)_serverBTAddressMonitorEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserEnsureStarted;
- (void)_serverBonjourAWDLAdvertiserEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserUpdateTXT;
- (void)_serverBonjourEnsureStarted;
- (void)_serverBonjourEnsureStopped;
- (void)_serverBonjourUpdateTXT;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_serverNearbyActionV2DiscoveryEnsureStarted;
- (void)_serverNearbyActionV2DiscoveryEnsureStopped;
- (void)_serverNearbyInfoV2DeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4;
- (void)_serverNearbyInfoV2DeviceLost:(id)a3 idsIdentifier:(id)a4 force:(BOOL)a5 deviceFlags:(unsigned __int8)a6;
- (void)_serverNearbyInfoV2DiscoveryEnsureStarted;
- (void)_serverNearbyInfoV2DiscoveryEnsureStopped;
- (void)_serverReceivedNeedsAWDLEvent:(id)a3 event:(id)a4;
- (void)_serverTCPEnsureStarted;
- (void)_serverTCPEnsureStopped;
- (void)_serverTCPHandleConnectionEnded:(id)a3;
- (void)_serverTCPRemoveConnectionsWithIdentifier:(id)a3 exceptConnection:(id)a4;
- (void)_sessionHandlePeerDisconnect:(id)a3;
- (void)_sessionHandleStartRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6;
- (void)_sessionHandleStopRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6;
- (void)_siriEnsureStarted;
- (void)_siriEnsureStopped;
- (void)_stereoDeviceUpdate:(int)a3;
- (void)_textInputEnsureStarted;
- (void)_textInputEnsureStopped;
- (void)_update;
- (void)_updateAssertions;
- (void)_updateForXPCClientChange;
- (void)_updateForXPCServerChange;
- (void)_updateHomeHubDevices:(id)a3;
- (void)_updatePersonalRequestsStateForHomeHubDevices;
- (void)_updateRBSProcessMonitor;
- (void)_updateRoomInfoForHomeHubDevice:(id)a3 roomName:(id)a4;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)interestDeregisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5;
- (void)interestRegisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prefsChanged;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 xpcID:(unsigned int)a6 options:(id)a7 responseHandler:(id)a8;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)sessionStartSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 destinationID:(id)a6 completion:(id)a7;
- (void)sessionStopSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6;
- (void)setActiveServers:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setRbsPIDSet:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation RPCompanionLinkDaemon

+ (id)sharedCompanionLinkDaemon
{
  if (qword_100133218 != -1) {
    dispatch_once(&qword_100133218, &stru_1001112E8);
  }
  return (id)qword_100133210;
}

- (RPCompanionLinkDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDaemon;
  v2 = -[RPCompanionLinkDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_coreDeviceChangedNotifier = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_needsPrimaryAppleIDUpdate = 1;
    -[RPCompanionLinkDaemon _createDestinationIdentifierMaps](v3, "_createDestinationIdentifierMaps");
    RandomBytes(&v3->_sessionIDLast, 4LL);
    RandomBytes(&v3->_loopbackXid, 4LL);
    v4 = v3;
  }

  return v3;
}

- (void)_createDestinationIdentifierMaps
{
  v9[0] = @"rapport:rdid:ModelAppleTV";
  v9[1] = @"rapport:rdid:ModelAppleTV";
  v10[0] = &stru_100111328;
  v10[1] = &stru_100111348;
  v9[2] = @"rapport:rdid:ModelAppleTV";
  v9[3] = @"rapport:rdid:ModelAppleTV";
  v10[2] = &stru_100111368;
  v10[3] = &stru_100111388;
  v9[4] = @"rapport:rdid:ModelAppleTV";
  v9[5] = @"rapport:rdid:ModelAppleTV";
  v10[4] = &stru_1001113A8;
  v10[5] = &stru_1001113C8;
  v9[6] = @"rapport:rdid:ModelAppleTV";
  v10[6] = &stru_1001113E8;
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  7LL));
  destinationIdentifierModelMap = self->_destinationIdentifierModelMap;
  self->_destinationIdentifierModelMap = v3;

  v7[0] = @"rapport:rdid:RelationMyiCloud";
  v7[1] = @"rapport:rdid:RelationFamily";
  v8[0] = &stru_100111428;
  v8[1] = &stru_100111448;
  v7[2] = @"rapport:rdid:RelationFriend";
  v7[3] = @"rapport:rdid:RelationSharedHome";
  v8[2] = &stru_100111468;
  v8[3] = &stru_100111488;
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  destinationIdentifierRelMap = self->_destinationIdentifierRelMap;
  self->_destinationIdentifierRelMap = v5;
}

- (id)findServerClientFromID:(id)a3 senderIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon findServerClientFromID:senderIDS:]",  30LL,  "findServerClientFromID: deviceID=%@, senderIDS=%@\n",  v6,  v7);
  }
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10000B284;
  v20 = sub_10000B294;
  id v21 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000B29C;
  v12[3] = &unk_1001114B0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v12);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)findDeviceFromID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10000B284;
  id v14 = sub_10000B294;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000B618;
  v9[3] = &unk_1001114D8;
  v9[4] = &v10;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:]( self,  "_forEachMatchingDestinationID:handler:",  v4,  v9);
  v5 = (void *)v11[5];
  if (v5)
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 == -1)
      {
        v5 = (void *)v11[5];
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon findDeviceFromID:]",  30LL,  "Found match for deviceID='%@', returning device='%@'\n",  v4,  v6);
    }
  }

  else if (dword_100131328 <= 30 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon findDeviceFromID:]",  30LL,  "Failed to find matching device for deviceID='%@'\n",  v4);
  }

- (id)descriptionWithLevel:(int)a3
{
  if (a3 >= 21)
  {
    uint64_t v4 = NSPrintF("RPCompanionLinkDaemon %{ptr}", a2, self);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    return v5;
  }

  uint64_t v6 = *(void *)&a3;
  uint64_t v295 = 0LL;
  v296 = &v295;
  uint64_t v297 = 0x3032000000LL;
  v298 = sub_10000B284;
  v299 = sub_10000B294;
  id v300 = 0LL;
  BOOL v7 = sub_10000AA20();
  id v8 = (id *)(v296 + 5);
  id obj = (id)v296[5];
  NSAppendPrintF(&obj, "-- RPCompanionLinkDaemon --\n");
  objc_storeStrong(v8, obj);
  id v9 = (id *)(v296 + 5);
  id v293 = (id)v296[5];
  uint64_t v10 = mach_continuous_time();
  uint64_t v11 = UpTicksToSeconds(v10 - self->_startTicksFull);
  uint64_t v12 = mach_absolute_time();
  uint64_t v13 = UpTicksToSeconds(v12 - self->_startTicks);
  NSAppendPrintF(&v293, "Up %ll{dur} (awake %ll{dur})", v11, v13);
  objc_storeStrong(v9, v293);
  v201 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
  v202 = (void *)WiFiCopyCurrentNetworkInfoEx(0LL, 0LL);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v202, @"ssid", TypeID, 0LL);
  v200 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v16 = (id *)(v296 + 5);
  id v292 = (id)v296[5];
  v17 = (const char *)sub_10000AAC4((uint64_t)", Nm ", v7);
  NSAppendPrintF(&v292, v17, v201);
  objc_storeStrong(v16, v292);
  uint64_t v18 = (id *)(v296 + 5);
  id v291 = (id)v296[5];
  v19 = (const char *)sub_10000AAC4((uint64_t)", WiFi ", v7);
  NSAppendPrintF(&v291, v19, v200);
  objc_storeStrong(v18, v291);
  v20 = (id *)(v296 + 5);
  id v290 = (id)v296[5];
  id v21 = (const char *)sub_10000AAC4((uint64_t)", AID ", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _getAppleID](self, "_getAppleID"));
  NSAppendPrintF(&v290, v21, v22);
  objc_storeStrong(v20, v290);

  v198 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  v203 = (void *)objc_claimAutoreleasedReturnValue([v198 home]);
  if (v203)
  {
    v23 = (id *)(v296 + 5);
    id v289 = (id)v296[5];
    v24 = (const char *)sub_10000AAC4((uint64_t)", Hm ", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v203 name]);
    NSAppendPrintF(&v289, v24, v25);
    objc_storeStrong(v23, v289);
  }

  if (self->_prefHomeKitEnabled)
  {
    v26 = (id *)(v296 + 5);
    id v288 = (id)v296[5];
    NSAppendPrintF(&v288, ", LTPK <%.4@>", self->_homeKitLTPK);
    objc_storeStrong(v26, v288);
  }

  if (self->_prefCommunal)
  {
    v27 = (id *)(v296 + 5);
    id v287 = (id)v296[5];
    v28 = (const char *)sub_10000AAC4((uint64_t)", MeDev F ", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceFMFDeviceID](self->_systemMonitor, "meDeviceFMFDeviceID"));
    NSAppendPrintF(&v287, v28, v29);
    objc_storeStrong(v27, v287);

    v30 = (id *)(v296 + 5);
    id v286 = (id)v296[5];
    v31 = (const char *)sub_10000AAC4((uint64_t)" I ", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](self->_systemMonitor, "meDeviceIDSDeviceID"));
    NSAppendPrintF(&v286, v31, v32);
    objc_storeStrong(v30, v286);

    v33 = (id *)(v296 + 5);
    id v285 = (id)v296[5];
    v34 = (const char *)sub_10000AAC4((uint64_t)" Nm ", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceName](self->_systemMonitor, "meDeviceName"));
    NSAppendPrintF(&v285, v34, v35);
    objc_storeStrong(v33, v285);
  }

  if ((int)v6 <= 10 && self->_prefHomeKitEnabled)
  {
    v36 = (id *)(v296 + 5);
    id v284 = (id)v296[5];
    NSAppendPrintF( &v284,  ", AT <%@>, IRK <%.4@>, RID <%@>",  self->_homeKitAuthTag,  self->_homeKitIRK,  self->_homeKitRotatingID);
    objc_storeStrong(v36, v284);
LABEL_13:
    v37 = (id *)(v296 + 5);
    id v283 = (id)v296[5];
    NSAppendPrintF(&v283, ", Nonce <%@>", self->_discoveryNonceData);
    objc_storeStrong(v37, v283);
    goto LABEL_14;
  }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D494;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  v2 = self;
  if (dword_100131328 <= 30)
  {
    if (dword_100131328 != -1
      || (self = (RPCompanionLinkDaemon *)_LogCategory_Initialize(&dword_100131328, 30LL), (_DWORD)self))
    {
      self = (RPCompanionLinkDaemon *)LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activate]",  30LL,  "Activate\n");
    }
  }

  int DeviceClass = GestaltGetDeviceClass(self, a2);
  BOOL v4 = sub_10000AA10(DeviceClass);
  v2->_prefCommunal = v4;
  v2->_prefServerBonjourOpportunitistic = GestaltGetDeviceClass(v4, v5) == 3;
  v2->_startTicks = mach_absolute_time();
  v2->_startTicksFull = mach_continuous_time();
  RandomBytes(&v2->_xidLast, 4LL);
  if (!v2->_xpcListener)
  {
    uint64_t v6 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.CompanionLink");
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v6;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
  }

  if (v2->_coreDeviceChangedNotifier == -1)
  {
    dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000D70C;
    handler[3] = &unk_1001115C8;
    handler[4] = v2;
    notify_register_dispatch( "com.apple.dt.coredevice.devicePaired",  &v2->_coreDeviceChangedNotifier,  dispatchQueue,  handler);
  }

  v2->_homeKitWaiting = 1;
  dispatch_time_t v9 = dispatch_time(0LL, 2000000000LL);
  uint64_t v10 = (dispatch_queue_s *)v2->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D714;
  block[3] = &unk_1001110A8;
  block[4] = v2;
  dispatch_after(v9, v10, block);
  if (!v2->_nearfieldDaemon)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[RPNearFieldDaemon sharedNearFieldDaemon](&OBJC_CLASS___RPNearFieldDaemon, "sharedNearFieldDaemon"));
    nearfieldDaemon = v2->_nearfieldDaemon;
    v2->_nearfieldDaemon = (RPNearFieldDaemon *)v13;

    -[RPNearFieldDaemon setDispatchQueue:](v2->_nearfieldDaemon, "setDispatchQueue:", v2->_dispatchQueue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000D7D0;
    v18[3] = &unk_1001110A8;
    v18[4] = v2;
    id v11 = -[RPNearFieldDaemon setTransactionChangedHandler:](v2->_nearfieldDaemon, "setTransactionChangedHandler:", v18);
  }

  if (!v2->_tvDeviceInfoManager && GestaltGetDeviceClass(v11, v12) == 4)
  {
    id v15 = -[RPAppleTVDeviceInfoManager initWithQueue:]( objc_alloc(&OBJC_CLASS___RPAppleTVDeviceInfoManager),  "initWithQueue:",  v2->_dispatchQueue);
    tvDeviceInfoManager = v2->_tvDeviceInfoManager;
    v2->_tvDeviceInfoManager = v15;

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000D7D8;
    v17[3] = &unk_1001110A8;
    v17[4] = v2;
    -[RPAppleTVDeviceInfoManager setDeviceInfoChangedHandler:]( v2->_tvDeviceInfoManager,  "setDeviceInfoChangedHandler:",  v17);
  }

  -[RPCompanionLinkDaemon prefsChanged](v2, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D878;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    BOOL v4 = self->_xpcConnections;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)i), "xpcCnx", (void)v28));
          [v9 invalidate];
        }

        id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingMap, "removeAllObjects");
    xpcMatchingMap = self->_xpcMatchingMap;
    self->_xpcMatchingMap = 0LL;

    -[RPCompanionLinkDaemon _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
    -[RPCompanionLinkDaemon _btPipeEnsureStopped](self, "_btPipeEnsureStopped");
    -[RPCompanionLinkDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    int coreDeviceChangedNotifier = self->_coreDeviceChangedNotifier;
    if (coreDeviceChangedNotifier != -1)
    {
      notify_cancel(coreDeviceChangedNotifier);
      self->_int coreDeviceChangedNotifier = -1;
    }

    -[RPCompanionLinkDaemon _duetSyncEnsureStopped](self, "_duetSyncEnsureStopped", (void)v28);
    -[RPCompanionLinkDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPCompanionLinkDaemon _homeKitEnsureStopped](self, "_homeKitEnsureStopped");
    -[RPCompanionLinkDaemon _hidEnsureStopped](self, "_hidEnsureStopped");
    -[RPCompanionLinkDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
    -[RPCompanionLinkDaemon _miscEnsureStopped](self, "_miscEnsureStopped");
    -[RPCompanionLinkDaemon _siriEnsureStopped](self, "_siriEnsureStopped");
    -[RPCompanionLinkDaemon _textInputEnsureStopped](self, "_textInputEnsureStopped");
    -[RPCompanionLinkDaemon _reachabilityEnsureStopped](self, "_reachabilityEnsureStopped");
    -[RPCompanionLinkDaemon _localDeviceCleanup](self, "_localDeviceCleanup");
    -[NSMutableSet removeAllObjects](self->_needsAWDLNewPeers, "removeAllObjects");
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0LL;

    -[NSMutableSet removeAllObjects](self->_needsAWDLSentToPeers, "removeAllObjects");
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0LL;

    -[NSMutableSet removeAllObjects](self->_needsAWDLRequestIdentifiers, "removeAllObjects");
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0LL;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      uint64_t v16 = needsAWDLRequestTimer;
      dispatch_source_cancel(v16);
      v17 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0LL;
    }

    -[NSMutableDictionary removeAllObjects](self->_registeredEvents, "removeAllObjects");
    registeredEvents = self->_registeredEvents;
    self->_registeredEvents = 0LL;

    -[NSMutableSet removeAllObjects](self->_registeredProfileIDs, "removeAllObjects");
    registeredProfileIDs = self->_registeredProfileIDs;
    self->_registeredProfileIDs = 0LL;

    -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
    registeredRequests = self->_registeredRequests;
    self->_registeredRequests = 0LL;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    -[CBAdvertiser invalidate](self->_cbAdvertiser, "invalidate");
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = 0LL;

    -[RPNearFieldDaemon setTransactionChangedHandler:](self->_nearfieldDaemon, "setTransactionChangedHandler:", 0LL);
    nearfieldDaemon = self->_nearfieldDaemon;
    self->_nearfieldDaemon = 0LL;

    -[RPAppleTVDeviceInfoManager invalidate](self->_tvDeviceInfoManager, "invalidate");
    tvDeviceInfoManager = self->_tvDeviceInfoManager;
    self->_tvDeviceInfoManager = 0LL;

    rbsProcessMonitor = self->_rbsProcessMonitor;
    if (rbsProcessMonitor)
    {
      -[RBSProcessMonitor invalidate](rbsProcessMonitor, "invalidate");
      v26 = self->_rbsProcessMonitor;
      self->_rbsProcessMonitor = 0LL;
    }

    -[NSMutableSet removeAllObjects](self->_rbsPIDSet, "removeAllObjects");
    rbsPIDSet = self->_rbsPIDSet;
    self->_rbsPIDSet = 0LL;

    -[RPCompanionLinkDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_bleClientConnections, "count")
    && !-[NSMutableSet count](self->_bleServerConnections, "count")
    && !self->_bonjourAdvertiser
    && !self->_bonjourBrowser
    && !self->_btAdvAddrMonitor
    && !self->_btPipeConnection
    && !-[NSMutableDictionary count](self->_tcpClientConnections, "count")
    && !-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")
    && !-[NSMutableSet count](self->_tcpServerConnections, "count")
    && !self->_tcpServer
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0LL;

    self->_invalidateDone = 1;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)daemonInfoChanged:(unint64_t)a3
{
  if ((a3 & 0x10) != 0)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon daemonInfoChanged:]", 30LL, "Resetting on sign out\n");
    }

    -[RPCompanionLinkDaemon _btPipeEnsureStopped](self, "_btPipeEnsureStopped");
    -[RPCompanionLinkDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPCompanionLinkDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPCompanionLinkDaemon _update](self, "_update");
    if ((a3 & 0x40) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }

  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }

  -[RPCompanionLinkDaemon _update](self, "_update");
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v5 rangeOfString:@"clAWDLa" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v7 = "yes";
      if (bonjourAWDLAdvertiserForce) {
        id v8 = "yes";
      }
      else {
        id v8 = "no";
      }
      if (bonjourAWDLAdvertiserForce) {
        uint64_t v7 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: AWDL advertiser force: %s -> %s\n",  v8,  v7);
    }

    self->_BOOL bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
    goto LABEL_35;
  }

  if ([v5 rangeOfString:@"clAWDLb" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v10 = "yes";
      if (bonjourBrowserAWDLForce) {
        id v11 = "yes";
      }
      else {
        id v11 = "no";
      }
      if (bonjourBrowserAWDLForce) {
        id v10 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: AWDL browser force: %s -> %s\n",  v11,  v10);
    }

    self->_BOOL bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
    goto LABEL_35;
  }

  if ([v5 rangeOfString:@"clUpdate" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon diagnosticCommand:params:]", 30LL, "Diag: Update\n");
    }

    goto LABEL_35;
  }

  if ([v5 isEqual:@"eval"])
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: Re-evaluate devices\n");
    }

    -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");
    goto LABEL_36;
  }

  if ([v5 isEqual:@"hkbad"])
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: Force bad HomeKit LTPK\n");
    }

    uint64_t v31 = NSRandomData(32LL, 0LL);
    v32 = (NSData *)objc_claimAutoreleasedReturnValue(v31);
    homeKitLTPK = self->_homeKitLTPK;
    self->_homeKitLTPK = v32;

    BOOL v12 = 1;
    id v34 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1LL);
    -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1LL);
    -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
LABEL_68:
    -[RPCompanionLinkDaemon _update](self, "_update");
    goto LABEL_37;
  }

  if ([v5 isEqual:@"hkgood"])
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: Restore HomeKit LTPK\n");
    }

    v35 = self->_homeKitLTPK;
    self->_homeKitLTPK = 0LL;

LABEL_35:
    -[RPCompanionLinkDaemon _update](self, "_update");
    goto LABEL_36;
  }

  if ([v5 isEqual:@"rotate"])
  {
    uint64_t v14 = NSRandomData(6LL, 0LL);
    __int128 v15 = (NSData *)objc_claimAutoreleasedReturnValue(v14);
    btAdvAddrData = self->_btAdvAddrData;
    self->_btAdvAddrData = v15;

    uint64_t v17 = NSPrintF("%.6a", COERCE_DOUBLE((id)-[NSData bytes](self->_btAdvAddrData, "bytes")));
    uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v18;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon diagnosticCommand:params:]",  30LL,  "Diag: Bluetooth address changed: %.6a\n",  COERCE_DOUBLE((id)-[NSData bytes](self->_btAdvAddrData, "bytes")));
    }

    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0LL;

    BOOL v12 = 1;
    id v37 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1LL);
    -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1LL);
    goto LABEL_68;
  }

  if (![v5 isEqual:@"setLaunchID"])
  {
    BOOL v12 = 0;
    goto LABEL_37;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v22 = self->_xpcConnections;
  id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 appID]);
        unsigned int v29 = [v28 isEqual:@"com.apple.rputil"];

        if (v29)
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v21 launchInstanceID]);
          [v27 setLaunchInstanceID:v30];
        }
      }

      id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
    }

    while (v24);
  }

LABEL_36:
  BOOL v12 = 1;
LABEL_37:

  return v12;
}

- (void)prefsChanged
{
  unsigned int DeviceClass = GestaltGetDeviceClass(v3, v4);
  unsigned int v6 = DeviceClass;
  BOOL v7 = 1;
  if (DeviceClass != 3 && DeviceClass - 1 >= 2) {
    BOOL v7 = DeviceClass == 100;
  }
  if (self->_prefAppSignIn != v7)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v8 = "yes";
      if (v7) {
        dispatch_time_t v9 = "no";
      }
      else {
        dispatch_time_t v9 = "yes";
      }
      if (!v7) {
        id v8 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  30LL,  "AppSignIn enabled: %s -> %s\n",  v9,  v8);
    }

    self->_prefAppSignIn = v7;
  }

  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"applyNoiWiFiToUSB", &v111);
  if (v111) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = Int64 == 0;
  }
  BOOL v12 = !v11;
  if (self->_prefApplyNoiWiFiToUSB != v12)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v13 = "yes";
      if (v12) {
        uint64_t v14 = "no";
      }
      else {
        uint64_t v14 = "yes";
      }
      if (!v12) {
        uint64_t v13 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  30LL,  "Apply NoInfraWiFi flag to USB : %s -> %s\n",  v14,  v13);
    }

    self->_prefApplyNoiWiFiToUSB = v12;
  }

  BOOL v15 = 1;
  if (v6 != 3 && v6 - 1 >= 2) {
    BOOL v15 = v6 == 100;
  }
  if (self->_prefCompanionAuthentication != v15)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      __int128 v16 = "yes";
      if (v15) {
        uint64_t v17 = "no";
      }
      else {
        uint64_t v17 = "yes";
      }
      if (!v15) {
        __int128 v16 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  30LL,  "CompanionAuthentication enabled: %s -> %s\n",  v17,  v16);
    }

    self->_prefCompanionAuthentication = v15;
  }

  uint64_t v18 = CFPrefs_GetInt64(@"com.apple.rapport", @"clBLEClient", &v111);
  if (v18) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v111 != 0;
  }
  if (v6 != 3)
  {
    if (v111)
    {
      BOOL v19 = 1;
      if ((v6 > 0xB || ((1 << v6) & 0x816) == 0) && v6 != 100) {
        BOOL v19 = v18 != 0;
      }
    }
  }

  if (self->_prefBLEClient != v19)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      v20 = "yes";
      if (v19) {
        id v21 = "no";
      }
      else {
        id v21 = "yes";
      }
      if (!v19) {
        v20 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  30LL,  "BLE client enabled: %s -> %s\n",  v21,  v20);
    }

    self->_prefBLEClient = v19;
  }

  uint64_t v22 = CFPrefs_GetInt64(@"com.apple.rapport", @"clMeDeviceIsMeOverride", &v111);
  if (v111) {
    id v23 = 0LL;
  }
  else {
    id v23 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22 != 0));
  }
  if (v23 != self->_prefMeDeviceIsMeOverride && (-[NSNumber isEqual:](v23, "isEqual:") & 1) == 0)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      if (-[NSNumber BOOLValue](self->_prefMeDeviceIsMeOverride, "BOOLValue")) {
        id v24 = "yes";
      }
      else {
        id v24 = "no";
      }
      if (-[NSNumber BOOLValue](v23, "BOOLValue")) {
        uint64_t v25 = "yes";
      }
      else {
        uint64_t v25 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "MeDeviceIsMe override: %s -> %s\n",  v24,  v25);
    }

    objc_storeStrong((id *)&self->_prefMeDeviceIsMeOverride, v23);
  }

  uint64_t v26 = CFPrefs_GetInt64(@"com.apple.rapport", @"btPipeEnabled", &v111);
  if (!v111 || (BOOL v27 = 1, v6 != 1) && v6 != 6) {
    BOOL v27 = v26 != 0;
  }
  if (self->_prefBTPipeEnabled != v27)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      __int128 v28 = "yes";
      if (v27) {
        unsigned int v29 = "no";
      }
      else {
        unsigned int v29 = "yes";
      }
      if (!v27) {
        __int128 v28 = "no";
      }
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon prefsChanged]", 40LL, "BTPipe enabled: %s -> %s\n", v29, v28);
    }

    self->_prefBTPipeEnabled = v27;
  }

  uint64_t v30 = CFPrefs_GetInt64(@"com.apple.rapport", @"clClientEnabled", &v111);
  if (v111) {
    BOOL v31 = 0;
  }
  else {
    BOOL v31 = v30 == 0;
  }
  BOOL v32 = !v31;
  if (self->_prefClientEnabled != v32)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      v33 = "yes";
      if (v32) {
        id v34 = "no";
      }
      else {
        id v34 = "yes";
      }
      if (!v32) {
        v33 = "no";
      }
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon prefsChanged]", 40LL, "Client enabled: %s -> %s\n", v34, v33);
    }

    self->_prefClientEnabled = v32;
  }

  uint64_t v35 = CFPrefs_GetInt64(@"com.apple.coredevice", @"hasBeenPaired", &v111);
  if (v111) {
    BOOL v36 = 1;
  }
  else {
    BOOL v36 = v35 == 0;
  }
  BOOL v37 = !v36;
  if (self->_prefCoreDevicePaired != v37)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      __int128 v38 = "yes";
      if (v37) {
        __int128 v39 = "no";
      }
      else {
        __int128 v39 = "yes";
      }
      if (!v37) {
        __int128 v38 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "CoreDevicePaired: %s -> %s\n",  v39,  v38);
    }

    self->_prefCoreDevicePaired = v37;
    if (v37) {
      -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices](self, "_clientBonjourReevaluateUnauthDevices");
    }
  }

  uint64_t v40 = CFPrefs_GetInt64(@"com.apple.coredevice", @"enabled", &v111);
  if (v111) {
    BOOL v41 = 1;
  }
  else {
    BOOL v41 = v40 == 0;
  }
  BOOL v42 = !v41;
  if (self->_prefCoreDeviceEnabled != v42)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      uint64_t v43 = "yes";
      if (v42) {
        v44 = "no";
      }
      else {
        v44 = "yes";
      }
      if (!v42) {
        uint64_t v43 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "CoreDeviceEnabled: %s -> %s\n",  v44,  v43);
    }

    self->_prefCoreDeviceEnabled = v42;
  }

  uint64_t v45 = CFPrefs_GetInt64(@"com.apple.rapport", @"hidEnabled", &v111);
  BOOL v46 = v45 != 0;
  if (v111) {
    BOOL v46 = self->_prefCommunal || v45 != 0;
  }
  if (self->_prefHIDEnabled != v46)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      v48 = "yes";
      if (v46) {
        v49 = "no";
      }
      else {
        v49 = "yes";
      }
      if (!v46) {
        v48 = "no";
      }
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon prefsChanged]", 40LL, "HID enabled: %s -> %s\n", v49, v48);
    }

    self->_prefHIDEnabled = v46;
  }

  uint64_t v50 = CFPrefs_GetInt64(@"com.apple.homed", @"kHomesConfigured", 0LL);
  BOOL v51 = v50 != 0;
  if (v50 && !self->_prefHomeKitConfigured)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "HomeKit configured: %s -> %s\n",  "no",  "yes");
    }

    self->_prefHomeKitConfigured = v51;
  }

  uint64_t v52 = CFPrefs_GetInt64(@"com.apple.rapport", @"clHomeKit", &v111);
  BOOL v55 = v6 != 6 && v111 != 0 || v52 != 0;
  if (self->_prefHomeKitEnabled != v55)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      v56 = "yes";
      if (v55) {
        v57 = "no";
      }
      else {
        v57 = "yes";
      }
      if (!v55) {
        v56 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "HomeKit enabled: %s -> %s\n",  v57,  v56);
    }

    self->_prefHomeKitEnabled = v55;
  }

  uint64_t v58 = CFPrefs_GetInt64(@"com.apple.rapport", @"ignoreCompanionLinkChecks", &v111);
  BOOL v59 = v58 != 0;
  if (self->_prefIgnoreCompanionLinkChecks != v59)
  {
    if (dword_100131328 <= 30)
    {
      uint64_t v60 = v58;
      if (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))
      {
        v61 = "yes";
        if (v60) {
          v62 = "no";
        }
        else {
          v62 = "yes";
        }
        if (!v60) {
          v61 = "no";
        }
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  30LL,  "Ignore CompanionLink Checks: %s -> %s\n",  v62,  v61);
      }
    }

    self->_prefIgnoreCompanionLinkChecks = v59;
  }

  uint64_t v63 = CFPrefs_GetInt64(@"com.apple.rapport", @"ipEnabled", &v111);
  BOOL v66 = v6 != 6 && v111 != 0 || v63 != 0;
  if (self->_prefIPEnabled != v66)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      v67 = "yes";
      if (v66) {
        v68 = "no";
      }
      else {
        v68 = "yes";
      }
      if (!v66) {
        v67 = "no";
      }
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon prefsChanged]", 40LL, "IP enabled: %s -> %s\n", v68, v67);
    }

    self->_prefIPEnabled = v66;
  }

  uint64_t v69 = CFPrefs_GetInt64(@"com.apple.rapport", @"clMaxConnectionCount", &v111);
  if (v69 <= 1000 && v69 >= 0 && v111 == 0) {
    uint64_t v72 = v69;
  }
  else {
    uint64_t v72 = 100LL;
  }
  uint64_t prefMaxConnectionCount = self->_prefMaxConnectionCount;
  if (v72 != prefMaxConnectionCount)
  {
    if (dword_100131328 <= 40)
    {
      if (dword_100131328 == -1)
      {
        LODWORD(prefMaxConnectionCount) = self->_prefMaxConnectionCount;
      }

      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon prefsChanged]",  40LL,  "Max connections: %u -> %lld\n",  prefMaxConnectionCount,  v72);
    }

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___RPXPCMatchingEntry);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, @"type", TypeID, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  CFTypeID v14 = CFStringGetTypeID();
  uint64_t v15 = CFDictionaryGetTypedValue(v8, @"serviceType", v14, 0LL);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (![v13 isEqual:@"discovery"])
  {
    if ([v13 isEqual:@"server"]
      && ([v16 isEqual:@"_companion-link._tcp"] & 1) == 0
      && ([v16 isEqual:@"_rdlink._tcp"] & 1) == 0
      && [v16 length])
    {
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___RPServer);
      -[RPServer setServiceType:](v17, "setServiceType:", v16);
      -[RPCompanionLinkDevice setServersChangedState:](self->_localDeviceInfo, "setServersChangedState:", 6LL);
      -[RPXPCMatchingEntry setServer:](v10, "setServer:", v17);

      goto LABEL_13;
    }

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_xpcMatchingMap, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_xpcMatchingMap, "setObject:forKeyedSubscript:", 0LL, v5);
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 event]);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon removeXPCMatchingToken:]",  30LL,  "LaunchOnDemand removed: %##@, token %llu\n",  v7,  a3);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
    if (v8) {
      -[RPCompanionLinkDevice setServersChangedState:](self->_localDeviceInfo, "setServersChangedState:", 6LL);
    }

    -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
  }

  return v6 != 0LL;
}

- (void)_reportXPCMatchingDiscoveryCLink
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues"));
  [v3 addObjectsFromArray:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleDevices, "allValues"));
  [v3 addObjectsFromArray:v5];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v8 += ((unint64_t)[*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) statusFlags] >> 19) & 1;
        id v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
    LOBYTE(v7) = v8 > 0;
  }

  xpcMatchingMap = self->_xpcMatchingMap;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000FB20;
  v12[3] = &unk_100111628;
  char v13 = (char)v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v12);
}

- (void)_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 effectiveIdentifier]);
  id v6 = (void *)v5;
  id v7 = @"?";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v10 = v7;

  xpcMatchingMap = self->_xpcMatchingMap;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000FD68;
  v11[3] = &unk_100111650;
  v11[4] = v10;
  id v12 = v4;
  id v9 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v11);
}

- (void)_update
{
  if (!self->_systemMonitor)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100010464;
    v32[3] = &unk_1001110A8;
    v32[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v32);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10001046C;
    v31[3] = &unk_1001110A8;
    v31[4] = self;
    -[CUSystemMonitor setMeDeviceChangedHandler:](self->_systemMonitor, "setMeDeviceChangedHandler:", v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100010524;
    v30[3] = &unk_1001110A8;
    v30[4] = self;
    -[CUSystemMonitor setPowerUnlimitedChangedHandler:](self->_systemMonitor, "setPowerUnlimitedChangedHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001052C;
    v29[3] = &unk_1001110A8;
    v29[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100010540;
    v28[3] = &unk_1001110A8;
    v28[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](self->_systemMonitor, "setScreenLockedChangedHandler:", v28);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100010548;
    v27[3] = &unk_1001110A8;
    v27[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v27);
    if (self->_prefIPEnabled)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100010550;
      v26[3] = &unk_1001110A8;
      v26[4] = self;
      -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v26);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100010558;
    v25[3] = &unk_1001110A8;
    v25[4] = self;
    -[CUSystemMonitor setBluetoothAddressChangedHandler:]( self->_systemMonitor,  "setBluetoothAddressChangedHandler:",  v25);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", 0LL);
  }

  if (!self->_cbAdvertiser)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CBAdvertiser);
    cbAdvertiser = self->_cbAdvertiser;
    self->_cbAdvertiser = v5;

    -[CBAdvertiser setDispatchQueue:](self->_cbAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiser activateWithCompletion:](self->_cbAdvertiser, "activateWithCompletion:", &stru_100111690);
  }

  BOOL v7 = self->_prefServerEnabled && !self->_disabled;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identitiesOfType:13 error:0]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identitiesOfType:15 error:0]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identitiesOfType:12 error:0]);

  if (!v7) {
    goto LABEL_19;
  }
  if (!self->_prefCommunal)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    if (([v14 idsIsSignedIn] & 1) != 0
      || [v9 count]
      || [v11 count]
      || [v13 count])
    {

      goto LABEL_17;
    }

    BOOL v16 = sub_100009D20();

    if (v16) {
      goto LABEL_17;
    }
LABEL_19:
    BOOL v15 = -[RPNearFieldDaemon hasCurrentTransaction](self->_nearfieldDaemon, "hasCurrentTransaction");
    goto LABEL_20;
  }

- (void)_updateAssertions
{
  if (!self->_prefClientEnabled && !self->_prefServerEnabled && !self->_prefBTPipeEnabled) {
    goto LABEL_7;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
  if ([v3 sigTermPending])
  {

    goto LABEL_7;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
  unsigned __int8 v5 = [v4 languageChangePending];

  if ((v5 & 1) != 0)
  {
LABEL_7:
    if (self->_osTransaction)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _updateAssertions]", 30LL, "OS transaction stop\n");
      }

      osTransaction = self->_osTransaction;
      self->_osTransaction = 0LL;
    }

    goto LABEL_17;
  }

  if (!self->_osTransaction)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _updateAssertions]", 30LL, "OS transaction start\n");
    }

    id v12 = (OS_os_transaction *)os_transaction_create(off_100131340);
    char v13 = self->_osTransaction;
    self->_osTransaction = v12;

    if (!self->_osTransaction
      && dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _updateAssertions]", 90LL, "### Create transaction failed\n");
    }
  }

- (void)_updateForXPCClientChange
{
  id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v58 = 0LL;
  BOOL v59 = &v58;
  uint64_t v60 = 0x2020000000LL;
  uint64_t v61 = 0LL;
  int DeviceClass = GestaltGetDeviceClass(v43, v2);
  id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v54 = 0LL;
  BOOL v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  char v57 = 0;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = self->_xpcConnections;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v62,  16LL);
  int v4 = 0;
  if (!v3)
  {
    LOBYTE(v45) = 0;
    unsigned int v38 = 0;
    LOBYTE(v5) = 0;
    char v42 = 0;
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v35 = 0LL;
    int64_t v6 = -60LL;
    goto LABEL_49;
  }

  int v45 = 0;
  unsigned int v38 = 0;
  int v5 = 0;
  char v42 = 0;
  uint64_t v40 = *(void *)v51;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v35 = 0LL;
  int64_t v6 = -60LL;
  do
  {
    BOOL v7 = 0LL;
    id v39 = v3;
    do
    {
      if (*(void *)v51 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
      unint64_t v10 = (unint64_t)[v9 controlFlags];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceFilter]);

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100010FD8;
      v47[3] = &unk_1001116B8;
      id v48 = v43;
      v49 = v8;
      [v12 enumerateObjectsUsingBlock:v47];
      if ((v10 & 0x10000) != 0) {
        v42 |= [v12 count] == 0;
      }
      if ((v10 & 0x2104000000LL) != 0 && !self->_prefCommunal)
      {
        v59[3] |= v10;
        *((_BYTE *)v55 + 24) = 1;
        if ((v10 & 2) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        v59[3] |= v10;
        goto LABEL_12;
      }

      if ((v10 & 2) != 0) {
        goto LABEL_11;
      }
LABEL_12:
      if ((v10 & 0x8000) != 0) {
        *((_BYTE *)v55 + 24) = 1;
      }
      if (DeviceClass != 11
        && (v10 & 0x10000000000LL) != 0
        && (([v8 needsCLink] & 1) != 0
         || [v8 needsNearbyActionV2]))
      {
        LOBYTE(v35) = 1;
      }

      if ((v10 & 0x200000000LL) != 0)
      {
        BYTE4(v35) = 1;
        *((_BYTE *)v55 + 24) = 1;
      }

      if ((v10 & 0x20000) != 0
        && (([v8 needsCLink] & 1) != 0
         || [v8 needsNearbyActionV2]))
      {
        char v13 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 destinationDevice]);
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);

        [v36 addObject:v15];
      }

      if ((v10 & 0x10000) != 0)
      {
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
        BOOL v17 = (uint64_t)[v16 bleScreenOffRescanInterval] > 0;

        if (v17)
        {
          char v18 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
          uint64_t v34 = (uint64_t)[v18 bleScreenOffRescanInterval];
        }

        char v19 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
        char v20 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
        BOOL v21 = [v20 bleScreenOffScanRate] < 0x15;

        if (v21)
        {
          char v19 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
          unsigned int v38 = [v19 bleScreenOffScanRate];
LABEL_31:
        }
      }

      if (DeviceClass == 6 && (v10 & 0x10000000000000LL) != 0) {
        _os_feature_enabled_impl("Rapport", "WatchWiFiDiscovery");
      }
      char v22 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
      id v23 = [v22 rssiThreshold];

      BOOL v25 = *((_BYTE *)v55 + 24) != 0;
      v5 |= (v10 >> 16) & 1;
      v4 |= (v10 >> 13) & 1;
      v45 |= (v10 >> 35) & 1;
      if ((v25 & v5 & 1) != 0)
      {
        LOBYTE(v5) = 1;
        goto LABEL_49;
      }

      BOOL v7 = (char *)v7 + 1;
    }

    while (v39 != v7);
    id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v62,  16LL);
  }

  while (v3);
LABEL_49:

  if (!self->_prefCommunal)
  {
    xpcMatchingMap = self->_xpcMatchingMap;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_1000110F8;
    v46[3] = &unk_1001116E0;
    v46[4] = &v58;
    v46[5] = &v54;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingMap, "enumerateKeysAndObjectsUsingBlock:", v46);
  }

  self->_bleDiscoveryControlFlags = v59[3];
  self->_bleDiscoveryForce = *((_BYTE *)v55 + 24);
  self->_bleProximityDetection = BYTE4(v35) & 1;
  self->_discoverPairedDevices = v4 & 1;
  self->_bleRSSIThreshold = v6;
  self->_enableAWDLGuestDiscovery = v45 & 1;
  if (v38) {
    unsigned int v27 = v38;
  }
  else {
    unsigned int v27 = 10;
  }
  self->_bleDiscoveryScreenOffScanRate = v27;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v28 = 0LL;
  }
  else {
    int64_t v28 = v34;
  }
  self->_bleDiscoveryScreenOffRescanInterval = v28;
  BOOL needsAWDLTransaction = self->_needsAWDLTransaction;
  if (needsAWDLTransaction != (v35 & 1))
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 != -1) {
        goto LABEL_60;
      }
      if (_LogCategory_Initialize(&dword_100131328, 30LL))
      {
        BOOL needsAWDLTransaction = self->_needsAWDLTransaction;
LABEL_60:
        uint64_t v30 = "yes";
        if (needsAWDLTransaction) {
          BOOL v31 = "yes";
        }
        else {
          BOOL v31 = "no";
        }
        if ((v35 & 1) == 0) {
          uint64_t v30 = "no";
        }
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _updateForXPCClientChange]",  30LL,  "Needs AWDL Transaction: %s -> %s\n",  v31,  v30);
      }
    }

    self->_BOOL needsAWDLTransaction = v35 & 1;
  }

  if ((v42 & 1) != 0)
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
    self->_screenOffDeviceFilter = 0LL;

    BOOL v33 = 1;
  }

  else
  {
    objc_storeStrong((id *)&self->_screenOffDeviceFilter, v43);
    BOOL v33 = (v5 & 1) != 0 && [v43 count] != 0;
  }

  self->_bleDiscoveryScreenOff = v33;
  if ([v36 count])
  {
    [v36 minusSet:self->_needsAWDLSentToPeers];
    if ([v36 count]) {
      objc_storeStrong((id *)&self->_needsAWDLNewPeers, v36);
    }
  }

  -[RPCompanionLinkDaemon _update](self, "_update");
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v58, 8);
}

- (void)_updateForXPCServerChange
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v2 = self->_xpcConnections;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) server]);
        unint64_t v10 = v9;
        if (v9)
        {
          if ((~(unsigned __int16)[v9 controlFlags] & 0x404) == 0)
          {
            unsigned int v11 = [v10 passwordType];
            if (v11 > 4 || ((1 << v11) & 0x19) == 0) {
              char v6 = 1;
            }
          }

          v5 |= [v10 advertiseDeviceName];
        }
      }

      id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
    char v6 = 0;
  }

  if (self->_serverBonjourInfraPairing != (v6 & 1))
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      char v13 = "yes";
      if ((v6 & 1) != 0) {
        __int128 v14 = "no";
      }
      else {
        __int128 v14 = "yes";
      }
      if ((v6 & 1) == 0) {
        char v13 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _updateForXPCServerChange]",  30LL,  "Bonjour Infra Pairing: %s -> %s\n",  v14,  v13);
    }

    self->_serverBonjourInfraPairing = v6 & 1;
    -[RPCompanionLinkDaemon _update](self, "_update");
  }

  if (self->_bonjourAWDLAdvertiseForPairing != (v5 & 1))
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      BOOL v15 = "yes";
      if ((v5 & 1) != 0) {
        BOOL v16 = "no";
      }
      else {
        BOOL v16 = "yes";
      }
      if ((v5 & 1) == 0) {
        BOOL v15 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _updateForXPCServerChange]",  30LL,  "Bonjour AWDL advertise name for guest pairing: %s -> %s\n",  v16,  v15);
    }

    self->_bonjourAWDLAdvertiseForPairing = v5 & 1;
    -[RPCompanionLinkDaemon _update](self, "_update");
  }

- (void)_addApplicationPID:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_rbsPIDSet, "containsObject:") & 1) == 0)
  {
    rbsPIDSet = self->_rbsPIDSet;
    if (!rbsPIDSet)
    {
      int v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      char v6 = self->_rbsPIDSet;
      self->_rbsPIDSet = v5;

      rbsPIDSet = self->_rbsPIDSet;
    }

    -[NSMutableSet addObject:](rbsPIDSet, "addObject:", v7);
    -[RPCompanionLinkDaemon _updateRBSProcessMonitor](self, "_updateRBSProcessMonitor");
  }
}

- (void)_removeApplicationPID:(id)a3
{
  id v8 = a3;
  unsigned int v4 = -[NSMutableSet containsObject:](self->_rbsPIDSet, "containsObject:", v8);
  int v5 = v8;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_rbsPIDSet, "removeObject:", v8);
    if (-[NSMutableSet count](self->_rbsPIDSet, "count"))
    {
      -[RPCompanionLinkDaemon _updateRBSProcessMonitor](self, "_updateRBSProcessMonitor");
    }

    else
    {
      if (self->_rbsProcessMonitor)
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _removeApplicationPID:]",  30LL,  "Stopping RBS process monitor\n");
        }

        -[RBSProcessMonitor invalidate](self->_rbsProcessMonitor, "invalidate");
        rbsProcessMonitor = self->_rbsProcessMonitor;
        self->_rbsProcessMonitor = 0LL;
      }

      rbsPIDSet = self->_rbsPIDSet;
      self->_rbsPIDSet = 0LL;
    }

    int v5 = v8;
  }
}

- (void)_updateRBSProcessMonitor
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011618;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isNearbyActionV2AdvertiserActive
{
  return self->_bleNearbyActionV2Advertiser != 0LL;
}

- (void)_clientEnsureStarted
{
  if (self->_prefBLEClient || self->_bleDiscoveryForce) {
    -[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted](self, "_clientBLEDiscoveryEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
  }
  if (-[RPCompanionLinkDaemon _clientBLEActionDiscoveryShouldRun](self, "_clientBLEActionDiscoveryShouldRun")) {
    -[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted](self, "_clientBLEActionDiscoveryEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStopped](self, "_clientBLEActionDiscoveryEnsureStopped");
  }
  if (self->_prefIPEnabled) {
    -[RPCompanionLinkDaemon _clientBonjourEnsureStarted](self, "_clientBonjourEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _clientBonjourEnsureStopped](self, "_clientBonjourEnsureStopped");
  }
  if (-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserShouldRun](self, "_clientBLENeedsCLinkAdvertiserShouldRun")) {
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]( self,  "_clientBLENeedsCLinkAdvertiserEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped]( self,  "_clientBLENeedsCLinkAdvertiserEnsureStopped");
  }
  if (-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserShouldRun]( self,  "_clientBLENearbyActionV2AdvertiserShouldRun"))
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]( self,  "_clientBLENearbyActionV2AdvertiserEnsureStarted");
  }

  else
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]( self,  "_clientBLENearbyActionV2AdvertiserEnsureStopped");
  }

  if (-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryShouldRun](self, "_serverNearbyInfoV2DiscoveryShouldRun")) {
    -[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStarted]( self,  "_serverNearbyInfoV2DiscoveryEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStopped]( self,  "_serverNearbyInfoV2DiscoveryEnsureStopped");
  }
  if (-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserShouldRun](self, "_clientBonjourAWDLBrowserShouldRun")) {
    -[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStarted](self, "_clientBonjourAWDLBrowserEnsureStarted");
  }
  else {
    -[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
  }
}

- (void)_clientEnsureStopped
{
}

- (void)_clientBLEActionDiscoveryEnsureStarted
{
  bleActionDiscovery = self->_bleActionDiscovery;
  unsigned int v4 = bleActionDiscovery;
  if (!bleActionDiscovery)
  {
    unsigned int bleActionDiscoveryID = self->_bleActionDiscoveryID;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]",  30LL,  "BLE action discovery start ID %u\n",  bleActionDiscoveryID);
    }

    char v6 = (SFDeviceDiscovery *)objc_alloc_init(off_100131398());
    id v7 = self->_bleActionDiscovery;
    self->_bleActionDiscovery = v6;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleActionDiscovery, "setPurpose:", @"CLink");
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleActionDiscovery, "setRssiThreshold:", -60LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100012018;
    v17[3] = &unk_100111828;
    v17[4] = self;
    unsigned int v18 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleActionDiscovery, "setDeviceFoundHandler:", v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100012040;
    v15[3] = &unk_100111828;
    v15[4] = self;
    unsigned int v16 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleActionDiscovery, "setDeviceLostHandler:", v15);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001206C;
    v13[3] = &unk_100111850;
    v13[4] = self;
    unsigned int v14 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleActionDiscovery, "setDeviceChangedHandler:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100012094;
    v11[3] = &unk_100111878;
    v11[4] = self;
    unsigned int v12 = bleActionDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleActionDiscovery, "setInterruptionHandler:", v11);
    unsigned int v4 = self->_bleActionDiscovery;
  }

  if ((self->_bleDiscoveryControlFlags & 0x382000103C00LL) != 0) {
    uint64_t v8 = 16LL;
  }
  else {
    uint64_t v8 = 48LL;
  }
  if ((id)v8 != -[SFDeviceDiscovery discoveryFlags](v4, "discoveryFlags")) {
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleActionDiscovery, "setDiscoveryFlags:", v8);
  }
  if (!bleActionDiscovery)
  {
    id v9 = self->_bleActionDiscovery;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100012128;
    v10[3] = &unk_1001118A0;
    v10[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v10);
  }

- (void)_clientBLEActionDiscoveryEnsureStopped
{
  if (self->_bleActionDiscovery)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStopped]",  30LL,  "BLE action discovery stop ID %u\n",  self->_bleActionDiscoveryID);
    }

    -[SFDeviceDiscovery invalidate](self->_bleActionDiscovery, "invalidate");
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0LL;

    ++self->_bleActionDiscoveryID;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i)));
          unint64_t v10 = v9;
          if (v9)
          {
            unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
            -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]( self,  "_clientBLEDiscoveryDeviceLost:force:deviceFlags:",  v11,  1LL,  2LL);
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }

- (BOOL)_clientBLEActionDiscoveryShouldRun
{
  unint64_t bleDiscoveryControlFlags = self->_bleDiscoveryControlFlags;
  BOOL v3 = (bleDiscoveryControlFlags & (unint64_t)&_mh_execute_header) != 0
    || (bleDiscoveryControlFlags & 0x2000000000LL) != 0;
  return bleDiscoveryControlFlags && v3;
}

- (void)_clientBLEDiscoveryEnsureStarted
{
  if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) == 0
    && self->_bleDiscoveryScreenOff
    && -[NSSet count](self->_screenOffDeviceFilter, "count"))
  {
    screenOffDeviceFilter = self->_screenOffDeviceFilter;
  }

  else
  {
    screenOffDeviceFilter = 0LL;
  }

  unsigned int v4 = screenOffDeviceFilter;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery) {
    goto LABEL_46;
  }
  unsigned __int8 v6 = -[SFDeviceDiscovery changeFlags](bleDiscovery, "changeFlags");
  BOOL bleProximityDetection = self->_bleProximityDetection;
  if (self->_bleProximityDetection != (v6 & 2) >> 1)
  {
    if (dword_100131328 <= 30)
    {
      unsigned __int8 v8 = v6;
      if (dword_100131328 != -1
        || (int v11 = _LogCategory_Initialize(&dword_100131328, 30LL),
            BOOL bleProximityDetection = self->_bleProximityDetection,
            v11))
      {
        if ((v8 & 2) != 0) {
          id v9 = @"YES";
        }
        else {
          id v9 = @"NO";
        }
        if (bleProximityDetection) {
          unint64_t v10 = @"YES";
        }
        else {
          unint64_t v10 = @"NO";
        }
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]",  30LL,  "Proximity state already enabled %@ needs to be enabled %@\n",  v9,  v10);
        BOOL bleProximityDetection = self->_bleProximityDetection;
      }
    }

    -[SFDeviceDiscovery setChangeFlags:]( self->_bleDiscovery,  "setChangeFlags:",  -[SFDeviceDiscovery changeFlags](self->_bleDiscovery, "changeFlags") & 0xFFFFFFFD | (2 * bleProximityDetection));
  }

  if (-[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold") != (id)self->_bleRSSIThreshold)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]",  30LL,  "BLE discovery RSSI threshold changed from %ld -> %ld\n",  -[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold"),  self->_bleRSSIThreshold);
    }

    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold);
  }

  if (-[NSSet count](v4, "count")
    || (__int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter")),
        id v13 = [v12 count],
        v12,
        v13))
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter"));
    __int128 v15 = v4;
    unsigned int v16 = v14;
    if (v15 == v16)
    {
    }

    else
    {
      BOOL v17 = v16;
      if ((v15 == 0LL) == (v16 != 0LL))
      {

LABEL_34:
        int v20 = 0;
        uint64_t v19 = 30LL;
LABEL_35:
        if ((int)v19 >= dword_100131328
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, v19)))
        {
          if (v20) {
            __int128 v21 = @"NO";
          }
          else {
            __int128 v21 = @"YES";
          }
          char v22 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_bleDiscovery, "deviceFilter"));
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]",  v19,  "deviceFilterChanged %@, bleDiscoveryFilter %@, deviceFilter: %@",  v21,  v22,  v15);
        }

        if ((v20 & 1) == 0) {
          -[SFDeviceDiscovery setDeviceFilter:](self->_bleDiscovery, "setDeviceFilter:", v15);
        }
        goto LABEL_44;
      }

      unsigned int v18 = -[NSSet isEqual:](v15, "isEqual:", v16);

      if (!v18) {
        goto LABEL_34;
      }
    }

    uint64_t v19 = 10LL;
    int v20 = 1;
    goto LABEL_35;
  }

- (void)_clientBLEDiscoveryEnsureStopped
{
  if (self->_bleDiscovery)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStopped]",  30LL,  "BLE discovery stop ID %u\n",  self->_bleDiscoveryID);
    }

    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0LL;

    ++self->_bleDiscoveryID;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
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
          id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i)));
          unint64_t v10 = v9;
          if (v9)
          {
            int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
            -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]( self,  "_clientBLEDiscoveryDeviceLost:force:deviceFlags:",  v11,  1LL,  1LL);
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }

    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    if (pendingLostBLEDevicesTimer)
    {
      dispatch_source_cancel((dispatch_source_t)pendingLostBLEDevicesTimer);
      id v13 = self->_pendingLostBLEDevicesTimer;
      self->_pendingLostBLEDevicesTimer = 0LL;
    }
  }

- (BOOL)_clientBLETriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v14 = a3;
  __int128 v15 = &v21;
  uint64_t v21 = 0LL;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v20[0] = (uint64_t)_NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = (uint64_t)sub_100012E90;
    v20[3] = (uint64_t)&unk_1001118C8;
    v20[4] = (uint64_t)&v21;
    v20[5] = (uint64_t)a5;
    -[SFDeviceDiscovery triggerEnhancedDiscovery:useCase:completion:]( bleDiscovery,  "triggerEnhancedDiscovery:useCase:completion:",  v14,  v6,  v20);
LABEL_5:
    __int128 v15 = v22;
    goto LABEL_6;
  }

  if (a5)
  {
    id v17 = RPErrorF(4294960569LL, (uint64_t)"BLE discovery is not active", v8, v9, v10, v11, v12, v13, v20[0]);
    *a5 = (id)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_5;
  }

- (void)_clientBLEDiscoveryDeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsIdentifier]);
  if (!v7)
  {
    uint64_t v10 = 0LL;
    goto LABEL_9;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceMap]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (!v10 || self->_prefIgnoreCompanionLinkChecks) {
    goto LABEL_9;
  }
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 model]);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = GestaltProductTypeStringToDeviceClass();
    [v10 operatingSystemVersion];
    if ((_DWORD)v13 && (wInTP56r94EFs9NAAi(v13, v48, v49, v50) & 1) == 0)
    {
      if (dword_100131328 <= 20
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  20LL,  "Ignoring BLE device found: old OS %d.%d.%d, %@\n");
      }

      goto LABEL_64;
    }

LABEL_9:
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

    if (v7 && v12)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleDevices,  "objectForKeyedSubscript:",  v12));
      if (v15)
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  30,  "Replacing BLE device identifier %@ with IDS identifier %@, DFl current %#{flags} new %#{flags}\n",  v12,  v7,  [v15 deviceFlags],  &unk_100109588,  v4,  &unk_100109588);
        }

        uint64_t v4 = [v15 deviceFlags] | v4;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bleDevice]);
        -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]( self,  "_clientBLEDiscoveryDeviceLost:force:deviceFlags:",  v16,  1LL,  7LL);
      }
    }

    if (v7) {
      id v17 = v7;
    }
    else {
      id v17 = v12;
    }
    id v18 = v17;
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleDevices,  "objectForKeyedSubscript:",  v18));
      if (v19)
      {
        int v20 = v19;
        unsigned int v47 = [v19 statusFlags];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bleDevice]);
        unsigned int v22 = [v21 isBLEDeviceReplaced];

        if (v22
          && dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 bleDevice]);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  30LL,  "Replaced BLE device %@ -> %@",  v23,  v6);
        }

        id v41 = [v20 updateWithSFDevice:v6];
        objc_msgSend(v20, "setDeviceFlags:", objc_msgSend(v20, "deviceFlags") | v4);
        if (dword_100131328 <= 10)
        {
          if (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL))
          {
            uint64_t v42 = CUDescriptionWithLevel(v6, 30LL);
            unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  10LL,  "BLE device changed: %@ DFl %#{flags}\n",  v43,  v4,  &unk_100109588);
          }

          if (dword_100131328 <= 10
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
          {
            uint64_t v44 = CUDescriptionWithLevel(v20, 30LL);
            int v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  10LL,  "BLE device in cache: %@\n",  v45);
          }
        }

        if ((_DWORD)v41)
        {
          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v20,  v41);
          unsigned int v46 = [v20 statusFlags];
          if ((v47 & 0x40000000) == 0 && (v46 & 0x40000000) != 0) {
            -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:]( self,  "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:",  v20);
          }
          if ((v41 & 1) != 0)
          {
            if (-[RPCompanionLinkDevice isEqualToDevice:]( self->_bleNearbyActionV2Device,  "isEqualToDevice:",  v20))
            {
              -[RPCompanionLinkDevice updateWithSFDevice:](self->_bleNearbyActionV2Device, "updateWithSFDevice:", v6);
              -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserUpdate]( self,  "_clientBLENearbyActionV2AdvertiserUpdate");
            }

            if (-[RPCompanionLinkDevice isEqualToDevice:]( self->_bleNeedsCLinkDevice,  "isEqualToDevice:",  v20))
            {
              -[RPCompanionLinkDevice updateWithSFDevice:](self->_bleNeedsCLinkDevice, "updateWithSFDevice:", v6);
              -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserUpdate]( self,  "_clientBLENeedsCLinkAdvertiserUpdate");
            }
          }
        }
      }

      else
      {
        if (dword_100131328 < 31
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v24 = CUDescriptionWithLevel(v6, 30LL);
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  30,  "BLE device found: %@ at RSSI %ld DFl %#{flags}\n",  v25,  [v26 rssi],  v4,  &unk_100109588);
        }

        unsigned int v27 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        -[RPCompanionLinkDevice setIdentifier:](v27, "setIdentifier:", v18);
        uint64_t v28 = v10;
        -[RPCompanionLinkDevice setIdsDevice:](v27, "setIdsDevice:", v10);
        -[RPCompanionLinkDevice setIdsDeviceIdentifier:](v27, "setIdsDeviceIdentifier:", v7);
        -[RPCompanionLinkDevice updateWithSFDevice:](v27, "updateWithSFDevice:", v6);
        -[RPCompanionLinkDevice setDeviceFlags:]( v27,  "setDeviceFlags:",  -[RPCompanionLinkDevice deviceFlags](v27, "deviceFlags") | v4);
        if (self->_prefIgnoreCompanionLinkChecks)
        {
          id v29 = RPVersionToSourceVersionString(4000000LL);
          int v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          -[RPCompanionLinkDevice setSourceVersion:](v27, "setSourceVersion:", v30);
        }

        unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 idsFamilyEndpointMap]);

        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v7]);
        uint64_t v34 = v33;
        if (v33)
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v33 familyEndpointData]);
          -[RPCompanionLinkDevice updateWithFamilyEndpoint:](v27, "updateWithFamilyEndpoint:", v35);
        }

        bleDevices = self->_bleDevices;
        if (!bleDevices)
        {
          unsigned int v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v38 = self->_bleDevices;
          self->_bleDevices = v37;

          bleDevices = self->_bleDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](bleDevices, "setObject:forKeyedSubscript:", v27, v18);
        -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v27);
        if ((-[RPCompanionLinkDevice statusFlags](v27, "statusFlags") & 0x40000000) != 0) {
          -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:]( self,  "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:",  v27);
        }
        if (dword_100131328 <= 10
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
        {
          uint64_t v39 = CUDescriptionWithLevel(v27, 30LL);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  10LL,  "BLE device in cache: %@\n",  v40);
        }

        uint64_t v10 = v28;
      }
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  90LL,  "### Ignoring BLE device found: no ID, %@\n",  v6);
    }

LABEL_64:
    goto LABEL_65;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceFound:deviceFlags:]",  90LL,  "### Ignoring BLE device found: no model: %@\n",  v6);
  }
LABEL_65:
}

- (void)_clientBLEDiscoveryDeviceLost:(id)a3 force:(BOOL)a4 deviceFlags:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v29 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v29 idsIdentifier]);
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = v9;
  }
  id v13 = v12;
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v13));
    if (!v14 && v9) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleDevices, "objectForKeyedSubscript:", v9));
    }
    if (!v14) {
      goto LABEL_43;
    }
    if (!a4)
    {
      if ([v29 isBLEDeviceReplaced])
      {
        objc_msgSend(v14, "setDeviceFlags:", objc_msgSend(v14, "deviceFlags") & ~(_DWORD)v5);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  30LL,  "Ignoring BLE device lost, BLE Device is being replaced: %@\n",  v29);
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 bleDevice]);
        [v28 setIsBLEDeviceReplaced:1];

        -[RPCompanionLinkDaemon _schedulePendingLostBLEDeviceTimer](self, "_schedulePendingLostBLEDeviceTimer");
LABEL_43:

        goto LABEL_44;
      }

      if (!v11 || ([v29 deviceFlags] & 0x8000) != 0)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bleDevice]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);

        if (([v9 isEqual:v17] & 1) == 0)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  30LL,  "Ignoring BLE device lost for BLE device ID current:%@ old:%@ cached device %@\n",  v9,  v17,  v14);
          }

          goto LABEL_43;
        }
      }
    }

    objc_msgSend(v14, "setDeviceFlags:", objc_msgSend(v14, "deviceFlags") & ~(_DWORD)v5);
    unint64_t v18 = (unint64_t)[v14 statusFlags];
    unint64_t v19 = -[RPCompanionLinkDaemon _nearbyActionDeviceActionTypes](self, "_nearbyActionDeviceActionTypes");
    if (([v14 deviceFlags] & 7) != 0)
    {
      if (([v14 deviceFlags] & 2) != 0 || (v19 & v18) == 0)
      {
        if (dword_100131328 <= 10
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
        {
          uint64_t v24 = CUDescriptionWithLevel(v14, 30LL);
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  10LL,  "BLE device in cache: %@\n",  v25);
        }
      }

      else
      {
        objc_msgSend(v14, "setStatusFlags:", (unint64_t)objc_msgSend(v14, "statusFlags") & ~v19);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v20 = CUDescriptionWithLevel(v14, 30LL);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  30LL,  "BLE device lost for NearbyAction: %@\n",  v21);
        }

        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14);
      }
    }

    else
    {
      if (v9) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleDevices, "setObject:forKeyedSubscript:", 0LL, v9);
      }
      if (v11) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleDevices, "setObject:forKeyedSubscript:", 0LL, v11);
      }
      [v14 removeSFDevice:v29];
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        uint64_t v22 = CUDescriptionWithLevel(v14, 30LL);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  30LL,  "BLE device lost: %@ DFl %#{flags}\n",  v23,  v5,  &unk_100109588);
      }

      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v14);
      if (-[RPCompanionLinkDevice isEqualToDevice:]( self->_bleNearbyActionV2Device,  "isEqualToDevice:",  v14))
      {
        bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
        self->_bleNearbyActionV2Device = 0LL;

        -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart]( self,  "_clientBLENearbyActionV2AdvertiserRestart");
      }

      if (-[RPCompanionLinkDevice isEqualToDevice:](self->_bleNeedsCLinkDevice, "isEqualToDevice:", v14))
      {
        bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
        self->_bleNeedsCLinkDevice = 0LL;

        -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart](self, "_clientBLENeedsCLinkAdvertiserRestart");
      }
    }

    goto LABEL_43;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]",  90LL,  "### Ignoring BLE device lost: no ID, %@\n",  v29);
  }
LABEL_44:
}

- (void)_schedulePendingLostBLEDeviceTimer
{
  if (!self->_pendingLostBLEDevicesTimer)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _schedulePendingLostBLEDeviceTimer]",  30LL,  "Scheduling timer to process replaced BLE devices");
    }

    BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    pendingLostBLEDevicesTimer = self->_pendingLostBLEDevicesTimer;
    self->_pendingLostBLEDevicesTimer = v3;

    uint64_t v5 = self->_pendingLostBLEDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100013CC4;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    CUDispatchTimerSet(self->_pendingLostBLEDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostBLEDevicesTimer);
  }

- (void)_processPendingLostBLEDevices
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleDevices, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
        unsigned int v10 = [v9 isBLEDeviceReplaced];

        if (v10)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _processPendingLostBLEDevices]",  30LL,  "Process lost event for replaced BLE device: %@\n",  v8);
          }

          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
          [v11 setIsBLEDeviceReplaced:0];

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
          -[RPCompanionLinkDaemon _clientBLEDiscoveryDeviceLost:force:deviceFlags:]( self,  "_clientBLEDiscoveryDeviceLost:force:deviceFlags:",  v12,  0LL,  0LL);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }
}

- (BOOL)_clientShouldFindNonSameAccountDevices
{
  int DeviceClass = GestaltGetDeviceClass(self, a2);
  if (DeviceClass == 1)
  {
LABEL_4:
    if (self->_inDiscoverySession) {
      goto LABEL_5;
    }
    return 0;
  }

  if (DeviceClass != 4)
  {
    if (DeviceClass != 3) {
      return 0;
    }
    goto LABEL_4;
  }

- (void)_serverNearbyInfoV2DeviceFound:(id)a3 deviceFlags:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 btAddressData]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 nearbyInfoV2TempAuthTagData]);
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resolveIdentityForTempAuthTagData:v8 bluetoothAddressData:v7]);

      if (v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceID]);
        if (v11)
        {
          uint64_t v12 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyInfoV2Devices,  "objectForKeyedSubscript:",  v11));
          if (v12)
          {
            __int128 v13 = v12;
            id v14 = -[RPCompanionLinkDevice updateWithCBDevice:](v12, "updateWithCBDevice:", v6);
            if ((_DWORD)v14) {
              -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v13,  v14);
            }
          }

          else
          {
            if (dword_100131328 < 31
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              uint64_t v26 = CUDescriptionWithLevel(v6, 30LL);
              unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]",  30,  "NearbyInfoV2 device found: %@ at RSSI %ld DFl %#{flags}\n",  v27,  (int)[v6 rssi],  v4,  &unk_100109588);
            }

            __int128 v13 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
            -[RPCompanionLinkDevice setDeviceFlags:]( v13,  "setDeviceFlags:",  -[RPCompanionLinkDevice deviceFlags](v13, "deviceFlags") | v4);
            -[RPCompanionLinkDevice updateWithIdentity:](v13, "updateWithIdentity:", v10);
            -[RPCompanionLinkDevice updateWithCBDevice:](v13, "updateWithCBDevice:", v6);
            -[RPCompanionLinkDevice setStatusFlags:]( v13,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v13, "statusFlags") | 0x200);
            nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            if (!nearbyInfoV2Devices)
            {
              id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              int v30 = self->_nearbyInfoV2Devices;
              self->_nearbyInfoV2Devices = v29;

              nearbyInfoV2Devices = self->_nearbyInfoV2Devices;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( nearbyInfoV2Devices,  "setObject:forKeyedSubscript:",  v13,  v11);
            -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v13);
            if (dword_100131328 <= 10
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
            {
              uint64_t v31 = CUDescriptionWithLevel(v13, 30LL);
              BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]",  10LL,  "NearbyInfoV2 device in cache: %@\n",  v32);
            }
          }
        }

        else if (dword_100131328 <= 90 {
               && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
        }
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]",  90LL,  "### Ignoring NearbyInfoV2 device found: no ID, %@\n",  v6);
        }
      }

      else if (dword_100131328 <= 90 {
             && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      }
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]",  90LL,  "### Ignoring NearbyInfoV2 device found: unable to resolve authTag, %@\n",  v6);
      }
    }

    else
    {
      BOOL v33 = v7;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_nearbyInfoV2Devices, "allKeys"));
      id v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v35 = *(void *)v37;
        while (2)
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v37 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
            unint64_t v19 = self;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyInfoV2Devices,  "objectForKeyedSubscript:",  v18));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 cbDevice]);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
            id v23 = v6;
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
            unsigned int v25 = [v22 isEqualToString:v24];

            if (v25)
            {
              if (dword_100131328 <= 90
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
              {
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceFound:deviceFlags:]",  90LL,  "NearbyInfoV2 device no longer has tempAuthTag");
              }

              id v6 = v23;
              -[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]( v19,  "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:",  v23,  v18,  1LL,  4LL);

              goto LABEL_31;
            }

            id v6 = v23;
            self = v19;
          }

          id v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

- (void)_serverNearbyInfoV2DeviceLost:(id)a3 idsIdentifier:(id)a4 force:(BOOL)a5 deviceFlags:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v29 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v29 idsDeviceID]);
  __int128 v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = v10;
  }
  id v15 = v14;

  if (!v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v29 btAddressData]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v29 nearbyInfoV2TempAuthTagData]);
    uint64_t v18 = (void *)v17;
    if (v16 && v17)
    {
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 resolveIdentityForTempAuthTagData:v18 bluetoothAddressData:v16]);

      id v15 = (id)objc_claimAutoreleasedReturnValue([v20 idsDeviceID]);
    }
  }

  if (v15) {
    uint64_t v21 = v15;
  }
  else {
    uint64_t v21 = v11;
  }
  id v22 = v21;
  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyInfoV2Devices,  "objectForKeyedSubscript:",  v22));
    if (v23) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v11 == 0LL;
    }
    if (!v24) {
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyInfoV2Devices,  "objectForKeyedSubscript:",  v11));
    }
    if (!v23) {
      goto LABEL_28;
    }
    objc_msgSend(v23, "setDeviceFlags:", objc_msgSend(v23, "deviceFlags") & ~(_DWORD)v6);
    if (!a5)
    {
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v23 cbDevice]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stableIdentifier]);

      if (([v22 isEqual:v26] & 1) == 0)
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]",  30LL,  "Ignoring NearbyInfoV2 device lost: stale ID, %@ vs %@\n",  v22,  v26);
        }

        goto LABEL_28;
      }
    }

    if (([v23 deviceFlags] & 7) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_nearbyInfoV2Devices,  "setObject:forKeyedSubscript:",  0LL,  v22);
      [v23 removeCBDevice:v29];
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        uint64_t v27 = CUDescriptionWithLevel(v23, 30LL);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]",  30LL,  "NearbyInfoV2 device lost: %@ DFl %#{flags}\n",  v28,  v6,  &unk_100109588);
      }

      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v23);
    }

- (void)_clientBLEFamilyDeviceReportChanges
{
  uint64_t v2 = self;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleDevices, "allKeys"));
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v20 = *(void *)v23;
    uint64_t v21 = v3;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_bleDevices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i)));
        uint64_t v9 = v8;
        if (v8)
        {
          if (([v8 deviceFlags] & 2) != 0)
          {
            uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 idsDeviceIdentifier]);
            if (v10)
            {
              uint64_t v11 = (void *)v10;
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsFamilyEndpointMap]);
              id v14 = v2;
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 familyEndpointData]);
              id v17 = [v9 updateWithFamilyEndpoint:v16];

              uint64_t v2 = v14;
              if ((_DWORD)v17)
              {
                if (dword_100131328 <= 30
                  && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
                {
                  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
                  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 sourceVersion]);
                  LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLEFamilyDeviceReportChanges]",  30LL,  "Reporting change in family BLE device to client - idsDeviceID: %@, deviceName: %@, source version: %@",  v11,  v18,  v19);
                }

                -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( v14,  "_clientReportChangedDevice:changes:",  v9,  v17);
              }

              uint64_t v6 = v20;
              BOOL v3 = v21;
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v5);
  }
}

- (void)_clientBLENeedsCLinkAdvertiserEnsureStarted
{
  if (!self->_bleNeedsCLinkAdvertiser)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _clientBLENeedsCLinkTargetDevice](self, "_clientBLENeedsCLinkTargetDevice"));
    id v4 = v3;
    if (!self->_enableAWDLGuestDiscovery && v3 == 0LL)
    {
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]",  90LL,  "Could not find device to target authTag advertisement to, not starting NeedsCLink advertiser");
      }
    }

    else
    {
      objc_storeStrong((id *)&self->_bleNeedsCLinkDevice, v3);
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]",  30LL,  "BLE NeedsCLink advertiser start\n");
      }

      uint64_t v6 = (SFService *)objc_alloc_init(off_1001313A0());
      bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
      self->_bleNeedsCLinkAdvertiser = v6;

      -[SFService setAdvertiseRate:](self->_bleNeedsCLinkAdvertiser, "setAdvertiseRate:", 60LL);
      -[SFService setDeviceActionType:](self->_bleNeedsCLinkAdvertiser, "setDeviceActionType:", 51LL);
      -[SFService setDispatchQueue:](self->_bleNeedsCLinkAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService setIdentifier:]( self->_bleNeedsCLinkAdvertiser,  "setIdentifier:",  @"bb6e0a35-ca03-4151-8feb-f6bcae4d9a41");
      -[SFService setLabel:](self->_bleNeedsCLinkAdvertiser, "setLabel:", @"CLink");
      -[SFService setNeedsKeyboard:](self->_bleNeedsCLinkAdvertiser, "setNeedsKeyboard:", 1LL);
      -[SFService setPairSetupDisabled:](self->_bleNeedsCLinkAdvertiser, "setPairSetupDisabled:", 1LL);
      -[SFService setOverrideScreenOff:]( self->_bleNeedsCLinkAdvertiser,  "setOverrideScreenOff:",  self->_bleNeedsCLinkAdvertiserScreenOff);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v8);

      uint64_t v9 = self->_bleNeedsCLinkAdvertiser;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100014BE8;
      v10[3] = &unk_1001118A0;
      v10[4] = self;
      -[SFService activateWithCompletion:](v9, "activateWithCompletion:", v10);
      -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1LL);
    }
  }

- (void)_clientBLENeedsCLinkAdvertiserUpdate
{
  bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
  if (bleNeedsCLinkAdvertiser && self->_bleNeedsCLinkDevice)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFService targetAuthTag](bleNeedsCLinkAdvertiser, "targetAuthTag"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
    id v8 = v4;
    id v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0LL) != (v6 != 0LL))
      {
        unsigned __int8 v7 = [v8 isEqual:v6];

        if ((v7 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserUpdate]",  30LL,  "BLE NeedsCLink advertiser updating target data <%.3@> -> <%.3@>\n",  v8,  v6);
      }

      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }

- (void)_clientBLENeedsCLinkAdvertiserRestart
{
  bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
  self->_bleNeedsCLinkDevice = 0LL;

  if (-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserShouldRun](self, "_clientBLENeedsCLinkAdvertiserShouldRun"))
  {
    id v4 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _clientBLENeedsCLinkTargetDevice]( self,  "_clientBLENeedsCLinkTargetDevice"));
    id v5 = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = v4;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart]",  30LL,  "Restarting BLE NeedsCLink advertiser with a new device %@\n",  self->_bleNeedsCLinkDevice);
    }

    if (self->_bleNeedsCLinkAdvertiser)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNeedsCLinkDevice, "bleTargetData"));
      -[SFService setTargetAuthTag:](self->_bleNeedsCLinkAdvertiser, "setTargetAuthTag:", v6);

      bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
      if (bleNeedsCLinkAdvertiserProcessName)
      {
        id v8 = bleNeedsCLinkAdvertiserProcessName;
        id v9 = (id)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](&OBJC_CLASS___RPMetrics, "sharedMetrics"));
        [v9 logNeedsAWDLAdvertisementClient:v8 actionType:51 bluetoothType:15];
      }
    }

    else
    {
      -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]( self,  "_clientBLENeedsCLinkAdvertiserEnsureStarted");
    }
  }

  else
  {
    -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped]( self,  "_clientBLENeedsCLinkAdvertiserEnsureStopped");
  }

- (void)_clientBLENeedsCLinkAdvertiserEnsureStopped
{
  if (self->_bleNeedsCLinkAdvertiser)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStopped]",  30LL,  "BLE NeedsCLink advertiser stop\n");
    }

    -[RPCompanionLinkDaemon _clientPurgeUnauthAWDLDevices](self, "_clientPurgeUnauthAWDLDevices");
    -[SFService invalidate](self->_bleNeedsCLinkAdvertiser, "invalidate");
    bleNeedsCLinkAdvertiser = self->_bleNeedsCLinkAdvertiser;
    self->_bleNeedsCLinkAdvertiser = 0LL;

    bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
    self->_bleNeedsCLinkAdvertiserProcessName = 0LL;

    bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
    self->_bleNeedsCLinkDevice = 0LL;

    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0LL);
  }

- (BOOL)_clientBLENeedsCLinkAdvertiserShouldRun
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  BOOL v3 = self->_xpcConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "needsCLink", (void)v24))
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 netCnx]);
          unsigned int v12 = [v11 state];

          if (v12 != 1)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcCnx]);
            id v14 = sub_10000A8B0((uint64_t)[v13 processIdentifier]);
            id v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
            bleNeedsCLinkAdvertiserProcessName = self->_bleNeedsCLinkAdvertiserProcessName;
            self->_bleNeedsCLinkAdvertiserProcessName = v15;

            if (GestaltGetDeviceClass(v17, v18) == 1)
            {
              unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceType]);
              if ([v20 isEqualToString:@"com.apple.ApplicationService.chrono"])
              {
                LOBYTE(v21) = 1;
              }

              else
              {
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
                unint64_t v21 = ((unint64_t)[v22 controlFlags] >> 51) & 1;
              }
            }

            else
            {
              LOBYTE(v21) = 0;
            }

            v6 |= v21;
            char v7 = 1;
          }
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    }

    while (v5);
  }

  else
  {
    char v6 = 0;
    char v7 = 0;
  }

  self->_bleNeedsCLinkAdvertiserScreenOff = v6 & 1;
  return v7 & 1;
}

- (id)_clientBLENeedsCLinkTargetDevice
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v2 = self->_xpcConnections;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
LABEL_3:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v4) {
        objc_enumerationMutation(v2);
      }
      char v6 = *(void **)(*((void *)&v14 + 1) + 8 * v5);
      if (objc_msgSend(v6, "needsCLink", (void)v14))
      {
        char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 netCnx]);
        unsigned int v8 = [v7 state];

        if (v8 != 1)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 daemonDevice]);

          if (v9)
          {
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 daemonDevice]);
            unsigned __int8 v11 = [v10 statusFlags];

            if ((v11 & 2) != 0) {
              break;
            }
          }
        }
      }

      if (v3 == (id)++v5)
      {
        id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

    unsigned int v12 = v6;

    if (v12)
    {
      id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet daemonDevice](v12, "daemonDevice"));
      uint64_t v2 = v12;
      goto LABEL_15;
    }

    return 0LL;
  }

  else
  {
LABEL_15:

    return v3;
  }

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = self->_xpcConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "needsNearbyActionV2", (void)v18))
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 netCnx]);
          unsigned int v10 = [v9 state];

          if (v10 != 1)
          {
            unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 bonjourDevice]);

            if (!v11)
            {
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcCnx]);
              id v14 = sub_10000A8B0((uint64_t)[v13 processIdentifier]);
              __int128 v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
              bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
              self->_bleNearbyActionV2AdvertiserProcessName = v15;

              BOOL v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  if (self->_bleNearbyActionV2Advertiser)
  {
    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1LL);
  }

  else
  {
    if (self->_bleNearbyActionV2Device) {
      goto LABEL_16;
    }
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v3 = self->_xpcConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned int v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if ([v8 needsNearbyActionV2])
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bonjourDevice]);

            if (!v9)
            {
              unsigned int v10 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue([v8 daemonDevice]);
              bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
              self->_bleNearbyActionV2Device = v10;

              goto LABEL_15;
            }
          }
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser && self->_bleNearbyActionV2Device)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Advertiser targetData](bleNearbyActionV2Advertiser, "targetData"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
    id v8 = v4;
    id v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0LL) != (v6 != 0LL))
      {
        unsigned __int8 v7 = [v8 isEqual:v6];

        if ((v7 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserUpdate]",  30LL,  "BLE NearbyActionV2 advertiser updating target data <%.3@> -> <%.3@>\n",  v8,  v6);
      }

      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }

- (void)_clientBLENearbyActionV2AdvertiserRestart
{
  if (-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserShouldRun]( self,  "_clientBLENearbyActionV2AdvertiserShouldRun"))
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart]",  30LL,  "Restarting BLE NearbyActionV2 advertiser with a new device\n");
    }

    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]( self,  "_clientBLENearbyActionV2AdvertiserEnsureStarted");
  }

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    -[RPNearbyActionV2Advertiser invalidate](bleNearbyActionV2Advertiser, "invalidate");
    id v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0LL;

    bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
    self->_bleNearbyActionV2AdvertiserProcessName = 0LL;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0LL;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]",  30LL,  "BLE NearbyActionV2 advertiser stopped\n");
    }

    -[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0LL);
  }

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 77LL;
  if (a3) {
    uint64_t v5 = 75LL;
  }
  id v6 = (&self->super.isa)[v5];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v6;
  id v7 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v7)
  {
    id v8 = "disable";
    uint64_t v9 = *(void *)v25;
    if (v3) {
      id v8 = "enable";
    }
    __int128 v18 = v8;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v23 = 0LL;
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:]( self,  "findConnectedDeviceForIdentifier:controlFlags:cnx:",  v11,  0x400000LL,  &v23));
        if (v12
          && ([v23 linkType] == 6
           || [v23 linkType] == 8
           || [v23 linkType] == 7))
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:]",  30LL,  "Sending NeedsAWDL %s event to %@ over connection %@\n",  v18,  v12,  v23);
          }

          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
          [v13 setObject:v14 forKeyedSubscript:@"_i"];

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
          [v13 setObject:v15 forKeyedSubscript:@"_ena"];

          v21[0] = 0LL;
          v21[1] = v21;
          v21[2] = 0x2020000000LL;
          BOOL v22 = v3;
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_100015E5C;
          v20[3] = &unk_1001118F0;
          v20[5] = v11;
          uint64_t v20[6] = v21;
          v20[4] = self;
          [v23 sendEncryptedEventID:@"_needsAWDL" event:v13 options:0 completion:v20];
          _Block_object_dispose(v21, 8);
        }
      }

      id v7 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    }

    while (v7);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0LL;
  }

  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0LL;
}

- (void)_clientBonjourEnsureStarted
{
  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData || !self->_prefServerShouldRun)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourEnsureStarted]",  30LL,  "Bonjour browser start\n");
      }

      BOOL v3 = objc_alloc_init(&OBJC_CLASS___CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowser, "setChangeFlags:", 0xFFFFFFFFLL);
      -[CUBonjourBrowser setControlFlags:](self->_bonjourBrowser, "setControlFlags:", 1LL);
      -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowser, "setDispatchQueue:", self->_dispatchQueue);
      -[CUBonjourBrowser setDomain:](self->_bonjourBrowser, "setDomain:", @"local.");
      -[CUBonjourBrowser setLabel:](self->_bonjourBrowser, "setLabel:", @"CLink");
      -[CUBonjourBrowser setServiceType:](self->_bonjourBrowser, "setServiceType:", @"_companion-link._tcp");
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100016140;
      v7[3] = &unk_100111918;
      void v7[4] = self;
      -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowser, "setDeviceFoundHandler:", v7);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10001615C;
      v6[3] = &unk_100111918;
      v6[4] = self;
      -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowser, "setDeviceLostHandler:", v6);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100016174;
      v5[3] = &unk_100111940;
      v5[4] = self;
      -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowser, "setDeviceChangedHandler:", v5);
      -[CUBonjourBrowser activate](self->_bonjourBrowser, "activate");
    }

    else if (dword_100131328 <= 20 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourEnsureStarted]",  20LL,  "Deferring Bonjour browse without BT addr\n");
    }
  }

- (void)_clientBonjourEnsureStopped
{
  if (self->_bonjourBrowser)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourEnsureStopped]",  30LL,  "Bonjour browser stop\n");
    }

    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0LL;

    bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
    if (bonjourReevaluateTimer)
    {
      id v6 = bonjourReevaluateTimer;
      dispatch_source_cancel(v6);
      uint64_t v5 = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = 0LL;
    }
  }

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 txtDictionary]);
  if (!self->_btAdvAddrStr)
  {
LABEL_13:
    CFDictionaryGetInt64(v7, @"rpRF", 0LL);
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"rpVr", TypeID, 0LL);
    id v11 = objc_claimAutoreleasedReturnValue(TypedValue);
    id v18 = [v11 UTF8String];
    if (v18)
    {
      uint64_t v19 = TextToSourceVersion(v18, -1LL);
      if (v19 > 0x10CA0B)
      {
        int Int64 = CFDictionaryGetInt64(v7, @"rpFl", 0LL);
        int v21 = Int64;
        if (!self->_prefCommunal && (Int64 & 2) != 0 && (Int64 & 0x20000) != 0)
        {
          uint64_t v22 = 394LL;
        }

        else if ((Int64 & 0x200000) == 0 || !self->_prefCoreDevicePaired)
        {
          uint64_t v22 = 2LL;
        }

        else
        {
          uint64_t v22 = 130LL;
        }

        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 resolveIdentityForBonjourDevice:v6 typeFlags:v22]);

        unsigned int v26 = -[RPCompanionLinkDaemon _homeKitAuthMatchForBonjourDevice:]( self,  "_homeKitAuthMatchForBonjourDevice:",  v6);
        unsigned int v27 = v26;
        if ((v26 & 1) == 0 && !v25)
        {
LABEL_31:
          -[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]( self,  "_clientBonjourFoundUnauthDevice:isAWDLDevice:",  v6,  0LL);
          BOOL v28 = 0;
LABEL_92:

          goto LABEL_73;
        }

        if (v26
          && (id v29 = (id)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _homeKitDecryptRotatingIDForBonjourDevice:]( self,  "_homeKitDecryptRotatingIDForBonjourDevice:",  v6))) != 0LL)
        {
          int v30 = v29;
          int v75 = 1;
          v76 = v29;
        }

        else
        {
          uint64_t v31 = objc_claimAutoreleasedReturnValue([v25 idsDeviceID]);
          if (!v31)
          {
            if (dword_100131328 <= 10
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
            {
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]",  10LL,  "Ignoring device without uniqueID: %@\n",  v6);
            }

            goto LABEL_31;
          }

          int v30 = (void *)v31;
          v76 = 0LL;
          int v75 = 0;
        }

        BOOL v32 = self->_uniqueIDStr;
        id v33 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self->_localDeviceInfo, "idsDeviceIdentifier"));
        v77 = v33;
        if (v32 && (id v33 = -[NSString caseInsensitiveCompare:](v32, "caseInsensitiveCompare:", v30)) == NSOrderedSame
          || v77 && (id v33 = [v77 caseInsensitiveCompare:v30]) == 0)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            id v35 = sub_100016C1C(v6);
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]",  30LL,  "Ignoring our own resolved Bonjour device: %@\n",  v36);
          }

          goto LABEL_90;
        }

        if (!a4) {
          id v33 = -[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices]( self,  "_clientBonjourReevaluateUnauthDevices");
        }
        if ((v21 & 0x100000) != 0)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]",  30LL,  "Skipping no-auto-connect device: %@\n",  v6);
          }

          goto LABEL_90;
        }

        if (GestaltGetDeviceClass(v33, v34) == 6)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]",  30LL,  "Skipping auto-connect for watch discovered device: %@\n",  v6);
          }

- (void)_clientBonjourLostDevice:(id)a3
{
  id v20 = a3;
  -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v20);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v20 txtDictionary]);
  int Int64 = CFDictionaryGetInt64(v4, @"rpFl", 0LL);

  if ((*(void *)&Int64 & 0x20000LL) != 0 && (Int64 & 2) != 0LL && !self->_prefCommunal) {
    uint64_t v8 = 394LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resolveIdentityForBonjourDevice:v20 typeFlags:v8]);
  unsigned int v11 = -[RPCompanionLinkDaemon _homeKitAuthMatchForBonjourDevice:](self, "_homeKitAuthMatchForBonjourDevice:", v20);
  if (((v11 & 1) != 0 || v10)
    && (v11
     && (id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _homeKitDecryptRotatingIDForBonjourDevice:]( self,  "_homeKitDecryptRotatingIDForBonjourDevice:",  v20))) != 0 || (id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceID])) != 0))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v12));
    if (v13)
    {
      id v14 = (void *)v13;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceID]);
      if (v15)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v15));
        if (v14)
        {
          id v16 = v15;

          id v12 = v16;
        }
      }

      else
      {
        id v14 = 0LL;
      }
    }

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v17 = v20;
      if ((objc_opt_respondsToSelector(v17, "shortDescription") & 1) != 0)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 shortDescription]);
      }

      else if ((objc_opt_respondsToSelector(v17, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 descriptionWithLevel:50]);
      }

      else
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 description]);
      }

      uint64_t v19 = (void *)v18;

      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourLostDevice:]",  30LL,  "Bonjour peer lost <%@>: %@\n",  v12,  v19);
    }

    if (v14) {
      [v14 setPresent:0];
    }
  }
}

- (void)_clientBonjourFoundUnauthDevice:(id)a3 isAWDLDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v30 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v30 txtDictionary]);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"rpBA", TypeID, 0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v9));
    unsigned int v11 = v10;
    if (v10)
    {
      [v10 setBonjourPeerDevice:v30];
      [v11 setPresent:1];
    }

    if (!self->_discoverPairedDevices
      || !-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:]( self,  "_clientBonjourCheckFoundPairedDevice:publicID:",  v30,  v9))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unauthDevices,  "objectForKeyedSubscript:",  v9));
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = [v12 updateWithBonjourDevice:v30];
        if ((_DWORD)v14)
        {
          id v15 = v14;
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            id v16 = v30;
            if ((objc_opt_respondsToSelector(v16, "detailedDescription") & 1) != 0)
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 detailedDescription]);
            }

            else if ((objc_opt_respondsToSelector(v16, "descriptionWithLevel:") & 1) != 0)
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 descriptionWithLevel:20]);
            }

            else
            {
              uint64_t v24 = NSPrintF("%@\n", v16);
              uint64_t v17 = objc_claimAutoreleasedReturnValue(v24);
            }

            __int128 v25 = (void *)v17;

            if (v4) {
              unsigned int v26 = @"YES";
            }
            else {
              unsigned int v26 = @"NO";
            }
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]",  30LL,  "Bonjour unauth peer changed. BLE Address: <%@>, device: %@, changed flags: %#{flags}, found over AWDL: %@\n",  v9,  v25,  v15,  &unk_1001095AC,  v26);
          }

          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v13,  v15);
        }
      }

      else
      {
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        -[RPCompanionLinkDevice updateWithBonjourDevice:](v18, "updateWithBonjourDevice:", v30);
        -[RPCompanionLinkDevice setFlags:]( v18,  "setFlags:",  -[RPCompanionLinkDevice flags](v18, "flags") | 1);
        if (v4)
        {
          -[RPCompanionLinkDevice setStatusFlags:]( v18,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v18, "statusFlags") & 0xFFFFFFFFFFFFFFFBLL);
          -[RPCompanionLinkDevice setStatusFlags:]( v18,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v18, "statusFlags") | 8);
        }

        unauthDevices = self->_unauthDevices;
        if (!unauthDevices)
        {
          id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          int v21 = self->_unauthDevices;
          self->_unauthDevices = v20;

          unauthDevices = self->_unauthDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](unauthDevices, "setObject:forKeyedSubscript:", v18, v9);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          id v22 = v30;
          if ((objc_opt_respondsToSelector(v22, "detailedDescription") & 1) != 0)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 detailedDescription]);
          }

          else if ((objc_opt_respondsToSelector(v22, "descriptionWithLevel:") & 1) != 0)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 descriptionWithLevel:20]);
          }

          else
          {
            uint64_t v27 = NSPrintF("%@\n", v22);
            uint64_t v23 = objc_claimAutoreleasedReturnValue(v27);
          }

          BOOL v28 = (void *)v23;

          id v29 = @"NO";
          if (v4) {
            id v29 = @"YES";
          }
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]",  30LL,  "Bonjour unauth peer found. BLE Address: <%@>, device: %@, found over AWDL: %@\n",  v9,  v28,  v29);
        }

        -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v18);
      }
    }
  }

  else if (dword_100131328 <= 10 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourFoundUnauthDevice:isAWDLDevice:]",  10LL,  "Ignoring found unauth device without public ID: %@\n",  v30);
  }
}

- (BOOL)_clientBonjourCheckFoundPairedDevice:(id)a3 publicID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resolveIdentityForBonjourDevice:v6 typeFlags:128]);

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pairedDevices,  "objectForKeyedSubscript:",  v7));
    unsigned int v11 = v10;
    if (v10)
    {
      id v12 = [v10 updateWithBonjourDevice:v6];
      if ((_DWORD)v12)
      {
        id v13 = v12;
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          id v14 = v6;
          if ((objc_opt_respondsToSelector(v14, "shortDescription") & 1) != 0)
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 shortDescription]);
          }

          else if ((objc_opt_respondsToSelector(v14, "descriptionWithLevel:") & 1) != 0)
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 descriptionWithLevel:50]);
          }

          else
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 description]);
          }

          id v22 = (void *)v15;

          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:]",  30LL,  "Bonjour paired peer changed <%@>: %@, %#{flags}\n",  v7,  v22,  v13,  &unk_1001095AC);
        }

        -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v11,  v13);
      }
    }

    else
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
      -[RPCompanionLinkDevice updateWithBonjourDevice:](v16, "updateWithBonjourDevice:", v6);
      -[RPCompanionLinkDevice setStatusFlags:]( v16,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v16, "statusFlags") | 0x8000);
      pairedDevices = self->_pairedDevices;
      if (!pairedDevices)
      {
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v19 = self->_pairedDevices;
        self->_pairedDevices = v18;

        pairedDevices = self->_pairedDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](pairedDevices, "setObject:forKeyedSubscript:", v16, v7);
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        id v20 = v6;
        if ((objc_opt_respondsToSelector(v20, "shortDescription") & 1) != 0)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 shortDescription]);
        }

        else if ((objc_opt_respondsToSelector(v20, "descriptionWithLevel:") & 1) != 0)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 descriptionWithLevel:50]);
        }

        else
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 description]);
        }

        uint64_t v23 = (void *)v21;

        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourCheckFoundPairedDevice:publicID:]",  30LL,  "Bonjour paired peer found <%@>: %@\n",  v7,  v23);
      }

      -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v16);
    }
  }

  return v9 != 0LL;
}

- (void)_clientBonjourLostUnauthDevice:(id)a3
{
  id v14 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v14 txtDictionary]);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"rpBA", TypeID, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v7));
    uint64_t v9 = v8;
    if (v8) {
      [v8 setPresent:0];
    }
    if (!-[RPCompanionLinkDaemon _clientBonjourCheckLostPairedDevice:publicID:]( self,  "_clientBonjourCheckLostPairedDevice:publicID:",  v14,  v7))
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unauthDevices,  "objectForKeyedSubscript:",  v7));
      if (v10)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_unauthDevices,  "setObject:forKeyedSubscript:",  0LL,  v7);
        [v10 removeBonjourDevice:v14];
        objc_msgSend(v10, "setStatusFlags:", (unint64_t)objc_msgSend(v10, "statusFlags") & 0xFFFFFFFFFFFFFFF7);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          id v11 = v14;
          if ((objc_opt_respondsToSelector(v11, "shortDescription") & 1) != 0)
          {
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 shortDescription]);
          }

          else if ((objc_opt_respondsToSelector(v11, "descriptionWithLevel:") & 1) != 0)
          {
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 descriptionWithLevel:50]);
          }

          else
          {
            uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 description]);
          }

          id v13 = (void *)v12;

          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:]",  30LL,  "Bonjour unauth peer lost <%@>: %@\n",  v7,  v13);
        }

        -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v10);
      }
    }
  }

  else if (dword_100131328 <= 10 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:]",  10LL,  "Ignoring lost unauth device without public ID: %@\n",  v14);
  }
}

- (BOOL)_clientBonjourCheckLostPairedDevice:(id)a3 publicID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairedDevices, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pairedDevices, "setObject:forKeyedSubscript:", 0LL, v7);
    [v8 removeBonjourDevice:v6];
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v9 = v6;
      if ((objc_opt_respondsToSelector(v9, "shortDescription") & 1) != 0)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 shortDescription]);
      }

      else if ((objc_opt_respondsToSelector(v9, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 descriptionWithLevel:50]);
      }

      else
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 description]);
      }

      id v11 = (void *)v10;

      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourCheckLostPairedDevice:publicID:]",  30LL,  "Bonjour paired peer lost <%@>: %@\n",  v7,  v11);
    }

    -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v8);
  }

  return v8 != 0LL;
}

- (void)_clientBonjourReevaluateAllDevices
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUBonjourBrowser devices](self->_bonjourBrowser, "devices"));
  if ([v3 count] && !self->_bonjourReevaluateTimer)
  {
    if (mach_absolute_time() >= self->_bonjourReevaluateNextTicks)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices]",  30,  "Re-evaluating all devices: %d total\n",  [v3 count]);
      }

      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            -[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]( self,  "_clientBonjourFoundDevice:reevaluate:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i),  1LL);
          }

          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }

        while (v9);
      }

      uint64_t v12 = mach_absolute_time();
      self->_bonjourReevaluateNextTicks = SecondsToUpTicks(30LL) + v12;
    }

    else
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices]",  30LL,  "Re-evaluating all devices: rate limit\n");
      }

      BOOL v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      bonjourReevaluateTimer = self->_bonjourReevaluateTimer;
      self->_bonjourReevaluateTimer = v4;
      id v6 = v4;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100017B8C;
      handler[3] = &unk_100111968;
      handler[4] = v6;
      void handler[5] = self;
      dispatch_source_set_event_handler(v6, handler);
      CUDispatchTimerSet(v6, 30.0, -1.0, 1.0);
      dispatch_activate(v6);
    }
  }
}

- (void)_clientBonjourReevaluateUnauthDevices
{
  if (-[NSMutableDictionary count](self->_unauthDevices, "count")
    && dword_100131328 <= 30
    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices]",  30LL,  "Re-evaluating unauth devices\n");
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_unauthDevices, "allValues"));
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
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) bonjourDevice]);
        if (v8
          && -[RPCompanionLinkDaemon _clientBonjourFoundDevice:reevaluate:]( self,  "_clientBonjourFoundDevice:reevaluate:",  v8,  1LL))
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourReevaluateUnauthDevices]",  30LL,  "Removing unauth device after re-evaluating: %@\n",  v8);
          }

          -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v8);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStarted]",  30LL,  "Bonjour AWDL browser start\n");
    }

    if (self->_needsAWDLTransaction)
    {
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
      [v3 activateForClient:@"Ensemble"];
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowserAWDL, "setChangeFlags:", 0xFFFFFFFFLL);
    -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowserAWDL, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourBrowser setDomain:](self->_bonjourBrowserAWDL, "setDomain:", @"local.");
    -[CUBonjourBrowser setInterfaceName:](self->_bonjourBrowserAWDL, "setInterfaceName:", @"awdl0");
    -[CUBonjourBrowser setLabel:](self->_bonjourBrowserAWDL, "setLabel:", @"CLink");
    -[CUBonjourBrowser setServiceType:](self->_bonjourBrowserAWDL, "setServiceType:", @"_companion-link._tcp");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100017FD0;
    v11[3] = &unk_100111918;
    v11[4] = self;
    -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowserAWDL, "setDeviceFoundHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100017FE8;
    v10[3] = &unk_100111918;
    v10[4] = self;
    -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowserAWDL, "setDeviceLostHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100018000;
    v9[3] = &unk_100111940;
    v9[4] = self;
    -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowserAWDL, "setDeviceChangedHandler:", v9);
    -[CUBonjourBrowser activate](self->_bonjourBrowserAWDL, "activate");
    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    if (bonjourBrowserAWDLProcess)
    {
      id v7 = bonjourBrowserAWDLProcess;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](&OBJC_CLASS___RPMetrics, "sharedMetrics"));
      [v8 logAWDLBrowseClient:v7];
    }
  }

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  if (self->_bonjourBrowserAWDL)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserEnsureStopped]",  30LL,  "Bonjour AWDL browser stop\n");
    }

    -[CUBonjourBrowser invalidate](self->_bonjourBrowserAWDL, "invalidate");
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0LL;

    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    self->_bonjourBrowserAWDLProcess = 0LL;

    -[NSMutableDictionary removeAllObjects](self->_bonjourAWDLDevices, "removeAllObjects");
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0LL;

    -[NSMutableDictionary removeAllObjects](self->_authenticatedAWDLPairingModeDevices, "removeAllObjects");
    authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
    self->_authenticatedAWDLPairingModeDevices = 0LL;

    if (!self->_needsAWDLTransaction && !self->_bonjourAWDLAdvertiser)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
      [v7 invalidateForClient:@"Ensemble"];
    }
  }

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  if (self->_bonjourBrowserAWDLForce) {
    return 1;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v3 = self->_xpcConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v8, "needsCLink", (void)v16) & 1) != 0
          || [v8 needsNearbyActionV2])
        {
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
          unsigned int v10 = [v9 controlFlags];

          if ((v10 & 0x400000) == 0)
          {
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcCnx]);
            id v13 = sub_10000A8B0((uint64_t)[v12 processIdentifier]);
            __int128 v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
            bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
            self->_bonjourBrowserAWDLProcess = v14;

            return 1;
          }
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  return -[RPCompanionLinkDaemon _haveActiveClientConnectionsOnAWDL](self, "_haveActiveClientConnectionsOnAWDL");
}

- (id)_clientShouldConnectOverBonjour:(id)a3 device:(id)a4 identities:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 netCnx]);
  if ([v10 present])
  {

LABEL_8:
    id v15 = 0LL;
    goto LABEL_28;
  }

  if ([v7 needsCLink])
  {
  }

  else
  {
    unsigned __int8 v11 = [v7 needsNearbyActionV2];

    if ((v11 & 1) == 0) {
      goto LABEL_8;
    }
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v8 publicIdentifier]);
  }
  __int128 v16 = v14;

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier]);
  if (!v17
    && v16
    && dword_100131328 <= 90
    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 xpcCnx]);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:]",  90,  "Destination device %@ for connection from pid %d has no IDS identifier\n",  v16,  [v18 processIdentifier]);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v19 = v9;
  id v15 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v27 = v16;
    id v28 = v9;
    uint64_t v20 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v19);
        }
        id v22 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 idsDeviceID]);
        unsigned int v25 = [v23 isEqual:v24];

        if (v25)
        {
          id v15 = v22;
          goto LABEL_26;
        }
      }

      id v15 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15) {
        continue;
      }
      break;
    }

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 txtDictionary]);
    uint64_t Int64 = CFDictionaryGetInt64(v5, @"rpRF", 0LL);
    if (Int64)
    {
      if (dword_100131328 > 30
        || dword_100131328 == -1 && !_LogCategory_Initialize(&dword_100131328, 30LL))
      {
        goto LABEL_145;
      }

      uint64_t v7 = CUDescriptionWithLevel(v3, 30LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Ignoring AWDL device: requirements, %#ll{flags}, %@\n",  Int64,  &unk_1001095A0,  v8);
      goto LABEL_13;
    }

    if ((CFDictionaryGetInt64(v5, @"rpFl", 0LL) & 0x800) == 0)
    {
      if (dword_100131328 > 30
        || dword_100131328 == -1 && !_LogCategory_Initialize(&dword_100131328, 30LL))
      {
        goto LABEL_145;
      }

      uint64_t v11 = CUDescriptionWithLevel(v3, 30LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Ignoring AWDL device: no connect flag for Bonjour device: %@\n",  v8);
LABEL_13:

LABEL_145:
      goto LABEL_146;
    }

    CFTypeID TypeID = CFStringGetTypeID();
    objc_msgSend(v3, "setName:", CFDictionaryGetTypedValue(v5, @"rpNm", TypeID, 0));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resolveIdentitiesForBonjourDevice:v3 typeFlags:19882]);
    if ([v14 count])
    {
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      id obj = v14;
      id v15 = [obj countByEnumeratingWithState:&v117 objects:v127 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v118;
LABEL_17:
        uint64_t v18 = 0LL;
        while (1)
        {
          if (*(void *)v118 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v117 + 1) + 8 * v18) idsDeviceID]);
          if (v19) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [obj countByEnumeratingWithState:&v117 objects:v127 count:16];
            if (v16) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }

        uint64_t v22 = v19;

        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v23 = CUDescriptionWithLevel(v3, 30LL);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Found AWDL device: %@, %@\n",  v22,  v24);
        }

        bonjourAWDLDevices = self->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          unsigned int v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v27 = self->_bonjourAWDLDevices;
          self->_bonjourAWDLDevices = v26;

          bonjourAWDLDevices = self->_bonjourAWDLDevices;
        }

        uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bonjourAWDLDevices, "objectForKeyedSubscript:", v22));
        if (v28
          && dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v29 = CUDescriptionWithLevel(v28, 30LL);
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          uint64_t v31 = CUDescriptionWithLevel(v3, 30LL);
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Replacing AWDL device %@ with %@\n",  v30,  v32);
        }

        v86 = (void *)v28;
        BOOL v88 = (void *)v22;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bonjourAWDLDevices,  "setObject:forKeyedSubscript:",  v3,  v22);
        __int128 v115 = 0u;
        __int128 v116 = 0u;
        __int128 v113 = 0u;
        __int128 v114 = 0u;
        id v33 = self->_xpcConnections;
        id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v113,  v126,  16LL);
        id v89 = v3;
        v87 = v14;
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v114;
LABEL_48:
          uint64_t v37 = 0LL;
          while (1)
          {
            if (*(void *)v114 != v36) {
              objc_enumerationMutation(v33);
            }
            __int128 v38 = *(void **)(*((void *)&v113 + 1) + 8 * v37);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 daemonDevice]);
            uint64_t v40 = objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:]( self,  "_clientShouldConnectOverBonjour:device:identities:",  v38,  v39,  obj));
            if (v40) {
              break;
            }

            if (v35 == (id)++v37)
            {
              id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v113,  v126,  16LL);
              if (v35) {
                goto LABEL_48;
              }
              uint64_t v84 = v5;
              uint64_t v85 = v13;
              id v41 = 0LL;
              goto LABEL_69;
            }
          }

          uint64_t v42 = (RPCompanionLinkDevice *)v40;
          [v38 setBonjourDevice:v89];
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Creating connection for xpcCnx %@",  v38);
          }

          id v112 = 0LL;
          id v41 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]( self,  "_clientCreateConnection:xpcCnx:error:",  v39,  v38,  &v112));
          id v43 = v112;
          if (v41)
          {
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              CFTypeID v44 = (void *)objc_claimAutoreleasedReturnValue([v38 client]);
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30,  "Start connection on found AWDL device for client CID 0x%X : %@, %@\n",  [v44 clientID],  v39,  v42);
            }

            uint64_t v84 = v5;
            uint64_t v85 = v13;

LABEL_69:
            id v3 = v89;
            goto LABEL_70;
          }

          if (dword_100131328 <= 90
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  90LL,  "### Start connection on found AWDL device failed: %@, %{error}\n",  v39,  v43);
          }

          id v41 = v33;
          uint64_t v21 = v88;
          goto LABEL_142;
        }

        uint64_t v84 = v5;
        uint64_t v85 = v13;
        id v41 = 0LL;
LABEL_70:

        __int128 v110 = 0u;
        __int128 v111 = 0u;
        __int128 v108 = 0u;
        __int128 v109 = 0u;
        uint64_t v45 = self->_xpcConnections;
        id v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v108,  v125,  16LL);
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v109;
          do
          {
            for (i = 0LL; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v109 != v48) {
                objc_enumerationMutation(v45);
              }
              int v50 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
              BOOL v51 = (void *)objc_claimAutoreleasedReturnValue([v50 daemonDevice]);
              int v52 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _clientShouldConnectOverBonjour:device:identities:]( self,  "_clientShouldConnectOverBonjour:device:identities:",  v50,  v51,  obj));
              if (v52)
              {
                if (dword_100131328 <= 30
                  && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
                {
                  id v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet label](v41, "label"));
                  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v50 client]);
                  LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30,  "Using connection %@ for client 0x%X",  v53,  [v54 clientID]);

                  id v3 = v89;
                }

                BOOL v55 = (void *)objc_claimAutoreleasedReturnValue([v50 netCnx]);

                if (v55)
                {
                  id v56 = (void *)objc_claimAutoreleasedReturnValue([v50 netCnx]);
                  [v56 processSendsUsingConnection:v41];
                }

                [v50 setNetCnx:v41];
                [v50 setBonjourDevice:v3];
                uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v50 session]);
                [v57 setCnx:v41];

                uint64_t v58 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v50 discoveryTimer]);
                int v59 = v58;
                if (v58)
                {
                  dispatch_source_cancel(v58);
                  [v50 setDiscoveryTimer:0];
                  [v50 setNeedsCLink:0];
                  [v50 setNeedsNearbyActionV2:0];
                }
              }
            }

            id v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v108,  v125,  16LL);
          }

          while (v47);
        }

        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _xpcConnections:withControlFlags:]( self,  "_xpcConnections:withControlFlags:",  self->_xpcConnections,  0x1000000000000LL));
        uint64_t v60 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatedAWDLPairingModeDevices,  "objectForKeyedSubscript:",  v88));
        uint64_t v42 = (RPCompanionLinkDevice *)v60;
        if (!v60) {
          uint64_t v42 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        }
        id v61 = -[RPCompanionLinkDevice updateWithBonjourDevice:](v42, "updateWithBonjourDevice:", v89);
        -[RPCompanionLinkDevice setStatusFlags:]( v42,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v42, "statusFlags") & 0xFFFFFFFFFFFFFFFBLL);
        -[RPCompanionLinkDevice setStatusFlags:]( v42,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v42, "statusFlags") | 8);
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        id v62 = obj;
        id v63 = [v62 countByEnumeratingWithState:&v104 objects:v124 count:16];
        id v13 = v85;
        if (v63)
        {
          id v64 = v63;
          uint64_t v65 = *(void *)v105;
          do
          {
            for (j = 0LL; j != v64; j = (char *)j + 1)
            {
              if (*(void *)v105 != v65) {
                objc_enumerationMutation(v62);
              }
              id v61 = (id)(-[RPCompanionLinkDevice updateTrustStatusFlagsWithIdentity:]( v42,  "updateTrustStatusFlagsWithIdentity:",  *(void *)(*((void *)&v104 + 1) + 8LL * (void)j)) | v61);
            }

            id v64 = [v62 countByEnumeratingWithState:&v104 objects:v124 count:16];
          }

          while (v64);
        }

        if ((-[RPCompanionLinkDevice statusFlags](v42, "statusFlags") & 0x80000000) == 0)
        {
          id v5 = v84;
          uint64_t v21 = v88;
          if (v60)
          {
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Auth AWDL Pairing Mode device lost because pairing mode flag lost: %@\n",  v42);
            }

            __int128 v94 = 0u;
            __int128 v95 = 0u;
            __int128 v92 = 0u;
            __int128 v93 = 0u;
            id v70 = v39;
            id v71 = [v70 countByEnumeratingWithState:&v92 objects:v121 count:16];
            if (v71)
            {
              id v72 = v71;
              uint64_t v73 = *(void *)v93;
              do
              {
                for (k = 0LL; k != v72; k = (char *)k + 1)
                {
                  if (*(void *)v93 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  [*(id *)(*((void *)&v92 + 1) + 8 * (void)k) reportLostDevice:v42];
                }

                id v72 = [v70 countByEnumeratingWithState:&v92 objects:v121 count:16];
              }

              while (v72);
            }

            uint64_t v21 = v88;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_authenticatedAWDLPairingModeDevices,  "setObject:forKeyedSubscript:",  0LL,  v88);
          }

          goto LABEL_141;
        }

        authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        id v5 = v84;
        uint64_t v21 = v88;
        if (!authenticatedAWDLPairingModeDevices)
        {
          uint64_t v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v69 = self->_authenticatedAWDLPairingModeDevices;
          self->_authenticatedAWDLPairingModeDevices = v68;

          authenticatedAWDLPairingModeDevices = self->_authenticatedAWDLPairingModeDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( authenticatedAWDLPairingModeDevices,  "setObject:forKeyedSubscript:",  v42,  v88);
        if (v60 && (_DWORD)v61)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Auth AWDL Pairing Mode device changed: %@\n",  v42);
          }

          __int128 v102 = 0u;
          __int128 v103 = 0u;
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          id v75 = v39;
          id v76 = [v75 countByEnumeratingWithState:&v100 objects:v123 count:16];
          if (v76)
          {
            id v77 = v76;
            uint64_t v78 = *(void *)v101;
            do
            {
              for (m = 0LL; m != v77; m = (char *)m + 1)
              {
                if (*(void *)v101 != v78) {
                  objc_enumerationMutation(v75);
                }
                [*(id *)(*((void *)&v100 + 1) + 8 * (void)m) reportChangedDevice:v42 changes:v61];
              }

              id v77 = [v75 countByEnumeratingWithState:&v100 objects:v123 count:16];
            }

            while (v77);
          }
        }

        else
        {
          if (v60)
          {
LABEL_141:
            -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
LABEL_142:

            id v3 = v89;
            id v14 = v87;
            goto LABEL_143;
          }

          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Auth AWDL Pairing Mode device found: %@\n",  v42);
          }

          __int128 v98 = 0u;
          __int128 v99 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          id v75 = v39;
          id v80 = [v75 countByEnumeratingWithState:&v96 objects:v122 count:16];
          if (v80)
          {
            id v81 = v80;
            uint64_t v82 = *(void *)v97;
            do
            {
              for (n = 0LL; n != v81; n = (char *)n + 1)
              {
                if (*(void *)v97 != v82) {
                  objc_enumerationMutation(v75);
                }
                [*(id *)(*((void *)&v96 + 1) + 8 * (void)n) reportFoundDevice:v42 outReason:0];
              }

              id v81 = [v75 countByEnumeratingWithState:&v96 objects:v122 count:16];
            }

            while (v81);
          }
        }

        uint64_t v21 = v88;
        goto LABEL_141;
      }

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  id v23 = a3;
  -[RPCompanionLinkDaemon _clientBonjourLostUnauthDevice:](self, "_clientBonjourLostUnauthDevice:", v23);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resolveIdentityForBonjourDevice:v23 typeFlags:19882]);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    if (!v7)
    {
      if (dword_100131328 > 90
        || dword_100131328 == -1 && !_LogCategory_Initialize(&dword_100131328, 90LL))
      {
        goto LABEL_31;
      }

      uint64_t v17 = CUDescriptionWithLevel(v23, 30LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]",  90LL,  "Ignoring lost AWDL device with missing IDS device ID: %@\n",  v9);
      goto LABEL_30;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bonjourAWDLDevices,  "objectForKeyedSubscript:",  v7));
    uint64_t v9 = v8;
    if (!v8)
    {
      if (dword_100131328 > 30
        || dword_100131328 == -1 && !_LogCategory_Initialize(&dword_100131328, 30LL))
      {
        goto LABEL_30;
      }

      uint64_t v22 = CUDescriptionWithLevel(v23, 30LL);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v22);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]",  30LL,  "Ignoring lost AWDL device not in cache\n",  v12);
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
    id v12 = v10;
    id v13 = v11;
    id v14 = v13;
    if (v12 == v13)
    {
    }

    else
    {
      if ((v12 == 0LL) == (v13 != 0LL))
      {

LABEL_39:
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientBonjourAWDLBrowserLostDevice:]",  30LL,  "Ignoring lost AWDL device lost: stale ID, %@ vs %@\n",  v14,  v12);
        }

- (void)_clientConnectionStart:(id)a3 controlFlags:(unint64_t)a4 uniqueID:(id)a5 identity:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
  id v14 = &v13[(void)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")];
  if ((unint64_t)v14 < self->_prefMaxConnectionCount)
  {
    if (v12) {
      unint64_t v15 = a4 | 0x80;
    }
    else {
      unint64_t v15 = a4;
    }
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___RPConnection);
    -[RPConnection setBonjourPeerDevice:](v16, "setBonjourPeerDevice:", v10);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    -[RPConnection setCloudDaemon:](v16, "setCloudDaemon:", v17);

    -[RPConnection setControlFlags:](v16, "setControlFlags:", v15);
    -[RPConnection setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
    -[RPConnection setHomeKitManager:](v16, "setHomeKitManager:", self->_homeKitManager);
    -[RPConnection setIdentityResolved:](v16, "setIdentityResolved:", v12);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    -[RPConnection setIdentityDaemon:](v16, "setIdentityDaemon:", v18);

    uint64_t v19 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v20 = self->_cnxIDLast + 1;
    self->_cnxIDLast = v20;
    uint64_t v21 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@Cnx-%u", @"CLink", v20);
    -[RPConnection setLabel:](v16, "setLabel:", v21);

    -[RPConnection setLocalDeviceInfo:](v16, "setLocalDeviceInfo:", self->_localDeviceInfo);
    -[RPConnection setNetLinkManager:](v16, "setNetLinkManager:", self->_netLinkManager);
    -[RPConnection setPeerIdentifier:](v16, "setPeerIdentifier:", v11);
    -[RPConnection setPreferredIdentityType:](v16, "setPreferredIdentityType:", [v12 type]);
    -[RPConnection setPresent:](v16, "setPresent:", 1LL);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100019B7C;
    v38[3] = &unk_100111708;
    v38[4] = self;
    void v38[5] = v16;
    id v22 = v11;
    id v39 = v22;
    -[RPConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v38);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100019BA8;
    v37[3] = &unk_100111968;
    v37[4] = self;
    v37[5] = v16;
    -[RPConnection setPeerUpdatedHandler:](v16, "setPeerUpdatedHandler:", v37);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100019C0C;
    v36[3] = &unk_100111990;
    v36[4] = self;
    void v36[5] = v16;
    -[RPConnection setReceivedEventHandler:](v16, "setReceivedEventHandler:", v36);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100019C28;
    v35[3] = &unk_1001119B8;
    v35[4] = self;
    void v35[5] = v16;
    -[RPConnection setReceivedRequestHandler:](v16, "setReceivedRequestHandler:", v35);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100019C48;
    v34[3] = &unk_1001119E0;
    v34[4] = self;
    v34[5] = v16;
    -[RPConnection setStateChangedHandler:](v16, "setStateChangedHandler:", v34);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100019C58;
    v33[3] = &unk_100111968;
    v33[4] = v16;
    v33[5] = self;
    -[RPConnection setHomeKitUserIdentifierHandler:](v16, "setHomeKitUserIdentifierHandler:", v33);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100019CDC;
    v32[3] = &unk_100111968;
    v32[4] = self;
    void v32[5] = v16;
    -[RPConnection setProxyDeviceUpdateHandler:](v16, "setProxyDeviceUpdateHandler:", v32);
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v23 = v10;
      if ((objc_opt_respondsToSelector(v23, "detailedDescription") & 1) != 0)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 detailedDescription]);
      }

      else if ((objc_opt_respondsToSelector(v23, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 descriptionWithLevel:20]);
      }

      else
      {
        uint64_t v27 = NSPrintF("%@\n", v23);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v27);
      }

      uint64_t v28 = (void *)v24;

      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:]",  30LL,  "Connection start: UID %@, BD %@, Cnx %@\n",  v22,  v28,  v16);
    }

    tcpClientConnections = self->_tcpClientConnections;
    if (!tcpClientConnections)
    {
      __int128 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v31 = self->_tcpClientConnections;
      self->_tcpClientConnections = v30;

      tcpClientConnections = self->_tcpClientConnections;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v16, v22);
    -[RPConnection activate](v16, "activate");
    -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

    goto LABEL_28;
  }

  if (dword_100131328 <= 60 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 60LL)))
  {
    id v25 = v10;
    if ((objc_opt_respondsToSelector(v25, "shortDescription") & 1) != 0)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 shortDescription]);
    }

    else if ((objc_opt_respondsToSelector(v25, "descriptionWithLevel:") & 1) != 0)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 descriptionWithLevel:50]);
    }

    else
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 description]);
    }

    uint64_t v16 = (RPConnection *)v26;

    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionStart:controlFlags:uniqueID:identity:]",  60LL,  "Skipping new connection when at our limit of %d: %@\n",  v14,  v16);
LABEL_28:
  }
}

- (BOOL)_clientConnectionStartOnDemand:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]( self,  "_clientCreateConnection:xpcCnx:error:",  a3,  a4,  a5));
  if (v6) {
    -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  }

  return v6 != 0LL;
}

- (id)_clientCreateConnection:(id)a3 xpcCnx:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
    uint64_t v24 = v17;
    if (!v17)
    {
      id v44 = RPErrorF(4294960534LL, (uint64_t)"No client for on-demand connection", v18, v19, v20, v21, v22, v23, v114);
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        id v46 = v8;
        if ((objc_opt_respondsToSelector(v46, "shortDescription") & 1) != 0)
        {
          uint64_t v47 = objc_claimAutoreleasedReturnValue([v46 shortDescription]);
        }

        else if ((objc_opt_respondsToSelector(v46, "descriptionWithLevel:") & 1) != 0)
        {
          uint64_t v47 = objc_claimAutoreleasedReturnValue([v46 descriptionWithLevel:50]);
        }

        else
        {
          uint64_t v47 = objc_claimAutoreleasedReturnValue([v46 description]);
        }

        __int128 v95 = (void *)v47;

        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]",  90LL,  "### Start on-demand connection failed: %@, %{error}\n",  v95,  v45);
      }

      if (a5) {
        *a5 = v45;
      }

      id v72 = 0LL;
      goto LABEL_136;
    }

    unint64_t v25 = (unint64_t)[v17 controlFlags];
    uint64_t v26 = (RPConnection *)objc_claimAutoreleasedReturnValue([v9 netCnx]);
    if (!v26)
    {
      uint64_t v26 = objc_alloc_init(&OBJC_CLASS___RPConnection);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v24 appID]);
      -[RPConnection setAppID:](v26, "setAppID:", v27);

      -[RPConnection setDispatchQueue:](v26, "setDispatchQueue:", self->_dispatchQueue);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      -[RPConnection setIdentityDaemon:](v26, "setIdentityDaemon:", v28);

      [v9 setNetCnx:v26];
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);

    if (v29)
    {
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);
      -[RPConnection setDestinationString:](v26, "setDestinationString:", v30);
    }

    else
    {
      __int128 v117 = (void *)objc_claimAutoreleasedReturnValue([v8 bonjourDevice]);
      if (v117 || (__int128 v117 = (void *)objc_claimAutoreleasedReturnValue([v9 bonjourDevice])) != 0)
      {
        unint64_t v116 = v25;
        int v39 = 0;
        __int128 v38 = "Infra";
        goto LABEL_20;
      }

      if ((v25 & 0x400000) == 0 && ((v25 & 0x20000) != 0 || GestaltGetDeviceClass(0LL, v48) != 6))
      {
        __int128 v117 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _findMatchingAWDLBonjourDevice:]( self,  "_findMatchingAWDLBonjourDevice:",  v8));
        if (v117)
        {
          unint64_t v116 = v25;
          [v9 setNeedsCLink:1];
          int v39 = 0;
          __int128 v38 = "AWDL";
          goto LABEL_20;
        }
      }
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);

    if (v31)
    {
      unint64_t v116 = v25;
      __int128 v117 = 0LL;
      __int128 v38 = "Infra";
      int v39 = 1;
LABEL_20:
      unsigned int v49 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
      id v62 = RPErrorF(4294896146LL, (uint64_t)"Too many existing TCP connections", v50, v51, v52, v53, v54, v55, v114);
      id v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]",  90LL,  "### Start on-demand connection failed: %@, %{error}\n",  v8,  v63);
      }

      if (a5) {
        *a5 = v63;
      }

      goto LABEL_74;
    }

    if ((v25 & 0x100) != 0)
    {
      __int128 v38 = "ForceL2CAP";
      if (!"ForceL2CAP") {
        goto LABEL_83;
      }
    }

    else if (([v8 statusFlags] & 0x200) != 0)
    {
      uint64_t v140 = 0LL;
      SocketGetInterfaceInfo(0xFFFFFFFFLL, "awdl0", 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, &v140, 0LL);
      __int128 v38 = (const char *)((v140 << 63 >> 63) & (unint64_t)"NoLocalAWDL");
      if (!v38) {
        goto LABEL_83;
      }
    }

    else
    {
      __int128 v38 = "NoWiFiP2P";
      if (!"NoWiFiP2P") {
        goto LABEL_83;
      }
    }

    if ((v25 & 0x20000000000LL) == 0)
    {
      unint64_t v116 = v25;
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v73 identifier]);

      if (!v74)
      {
        id v96 = RPErrorF(4294960588LL, (uint64_t)"No BLE device", v75, v76, v77, v78, v79, v80, v114);
        id v92 = (id)objc_claimAutoreleasedReturnValue(v96);
        if (dword_100131328 <= 90
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
        {
          id v97 = sub_100016C1C(v8);
          __int128 v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]",  90LL,  "### Start on-demand connection failed: %@, %{error}\n",  v98,  v92);
        }

        goto LABEL_119;
      }

      id v81 = -[NSMutableDictionary count](self->_bleClientConnections, "count");
      if ((unint64_t)v81 >= 4)
      {
        id v89 = "Too many existing BLE connections";
        uint64_t v90 = 4294896146LL;
LABEL_80:
        id v91 = RPErrorF(v90, (uint64_t)v89, v83, v84, v85, v86, v87, v88, v114);
        id v92 = (id)objc_claimAutoreleasedReturnValue(v91);
        if (dword_100131328 <= 90
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientCreateConnection:xpcCnx:error:]",  90LL,  "### Start on-demand connection failed: %@, %{error}\n",  v8,  v92);
        }

- (void)_clientConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionEnded:uniqueID:]",  30LL,  "Connection ended: UID %@, Cnx %@\n",  v6,  v9);
  }
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0LL, v9);
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleClientConnections,  "objectForKeyedSubscript:",  v6));
  if (v7 == v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bleClientConnections,  "setObject:forKeyedSubscript:",  0LL,  v6);
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v6));

  if (v8 == v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tcpClientConnections,  "setObject:forKeyedSubscript:",  0LL,  v6);
  }
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (void)_clientOnDemandConnectionEnded:(id)a3 uniqueID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandConnectionEnded:uniqueID:]",  30LL,  "On demand connection ended: UID %@, Cnx %@\n",  v6,  v10);
  }
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0LL, v10);
  -[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:](self, "_sessionHandlePeerDisconnect:", v10);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 bonjourPeerDevice]);

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpOnDemandClientConnections,  "objectForKeyedSubscript:",  v6));
    if (v8 == v10)
    {
      p_tcpOnDemandClientConnections = &self->_tcpOnDemandClientConnections;
LABEL_9:
      -[NSMutableDictionary setObject:forKeyedSubscript:]( *p_tcpOnDemandClientConnections,  "setObject:forKeyedSubscript:",  0LL,  v6);
    }
  }

  else
  {
    p_tcpOnDemandClientConnections = &self->_bleClientConnections;
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleClientConnections,  "objectForKeyedSubscript:",  v6));
    if (v8 == v10) {
      goto LABEL_9;
    }
  }

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (BOOL)_clientConnectionStartUnauth:(id)a3 client:(id)a4 publicID:(id)a5 xpcCnx:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 bonjourDevice]);
  if (!v22)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      id v41 = v12;
      if ((objc_opt_respondsToSelector(v41, "shortDescription") & 1) != 0)
      {
        uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 shortDescription]);
      }

      else if ((objc_opt_respondsToSelector(v41, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 descriptionWithLevel:50]);
      }

      else
      {
        uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 description]);
      }

      uint64_t v45 = (void *)v42;

      uint64_t prefMaxConnectionCount = (uint64_t)v45;
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]",  90LL,  "Failing new connection without Bonjour device: %@\n");

      if (!a7) {
        goto LABEL_47;
      }
    }

    else if (!a7)
    {
LABEL_47:
      BOOL v52 = 0;
      goto LABEL_48;
    }

    id v46 = "No Bonjour Device";
    uint64_t v47 = 4294960591LL;
LABEL_46:
    id v54 = RPErrorF(v47, (uint64_t)v46, v16, v17, v18, v19, v20, v21, prefMaxConnectionCount);
    BOOL v52 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(v54);
    goto LABEL_48;
  }

  uint64_t v23 = (char *)-[NSMutableDictionary count](self->_tcpClientConnections, "count");
  uint64_t v24 = &v23[(void)-[NSMutableDictionary count](self->_tcpOnDemandClientConnections, "count")];
  if ((unint64_t)v24 >= self->_prefMaxConnectionCount)
  {
    if (dword_100131328 <= 60
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 60LL)))
    {
      id v43 = v12;
      if ((objc_opt_respondsToSelector(v43, "shortDescription") & 1) != 0)
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue([v43 shortDescription]);
      }

      else if ((objc_opt_respondsToSelector(v43, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue([v43 descriptionWithLevel:50]);
      }

      else
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue([v43 description]);
      }

      uint64_t v53 = (void *)v44;

      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]",  60LL,  "Failing new connection when at our limit of %d: %@\n",  v24,  v53);
      if (!a7) {
        goto LABEL_47;
      }
    }

    else if (!a7)
    {
      goto LABEL_47;
    }

    uint64_t prefMaxConnectionCount = self->_prefMaxConnectionCount;
    id v46 = "At connection limit %d";
    uint64_t v47 = 4294960567LL;
    goto LABEL_46;
  }

  unint64_t v25 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 appID]);
  -[RPConnection setAppID:](v25, "setAppID:", v26);

  -[RPConnection setBonjourPeerDevice:](v25, "setBonjourPeerDevice:", v22);
  -[RPConnection setClient:](v25, "setClient:", v13);
  -[RPConnection setControlFlags:]( v25,  "setControlFlags:",  (unint64_t)[v13 controlFlags] | (unint64_t)-[RPConnection controlFlags]( v25,  "controlFlags") | 0x200);
  -[RPConnection setDispatchQueue:](v25, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setFlags:](v25, "setFlags:", 1LL);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v25, "setIdentityDaemon:", v27);

  uint64_t v28 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v29 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v29;
  __int128 v30 = -[NSString initWithFormat:](v28, "initWithFormat:", @"%@Cnx-%u", @"CLink", v29);
  -[RPConnection setLabel:](v25, "setLabel:", v30);

  -[RPConnection setLocalDeviceInfo:](v25, "setLocalDeviceInfo:", self->_localDeviceInfo);
  -[RPConnection setNetLinkManager:](v25, "setNetLinkManager:", self->_netLinkManager);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v13 password]);
  -[RPConnection setPassword:](v25, "setPassword:", v31);

  -[RPConnection setPeerIdentifier:](v25, "setPeerIdentifier:", v14);
  -[RPConnection setPresent:](v25, "setPresent:", 1LL);
  [v15 setNetCnx:v25];
  -[RPCompanionLinkDaemon _configureConnectionForPairing:](self, "_configureConnectionForPairing:", v25);
  id v32 = [v13 passwordType];
  uint64_t v33 = "xpcStatusUpdatableGiveStatusUpdate:peerDevice:currentState:statusInfo:" + 22;
  if ((_DWORD)v32)
  {
    id v34 = v32;
    if ((_DWORD)v32 != 3)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v13 allowedMACAddresses]);
      -[RPConnection setAllowedMACAddresses:](v25, "setAllowedMACAddresses:", v35);

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v13 pairSetupACL]);
      -[RPConnection setPairSetupACL:](v25, "setPairSetupACL:", v36);

      uint64_t v33 = "StatusUpdate:peerDevice:currentState:statusInfo:";
      -[RPConnection setPasswordType:](v25, "setPasswordType:", v34);
      if (([v13 internalAuthFlags] & 8) != 0)
      {
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472LL;
        v73[2] = sub_10001B69C;
        v73[3] = &unk_1001118A0;
        id v74 = v15;
        -[RPConnection setAuthCompletionHandler:](v25, "setAuthCompletionHandler:", v73);
      }

      if (([v13 internalAuthFlags] & 4) != 0)
      {
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472LL;
        v70[2] = sub_10001B6A8;
        v70[3] = &unk_100111A08;
        id v71 = v15;
        id v72 = v25;
        -[RPConnection setPromptForPasswordHandler:](v25, "setPromptForPasswordHandler:", v70);
      }
    }
  }

  id v62 = _NSConcreteStackBlock;
  uint64_t v63 = *((void *)v33 + 22);
  uint64_t v37 = v63;
  id v64 = sub_10001B6E8;
  uint64_t v65 = &unk_100111A58;
  BOOL v66 = self;
  uint64_t v67 = v25;
  id v38 = v14;
  id v68 = v38;
  id v69 = v15;
  -[RPConnection setInvalidationHandler:](v25, "setInvalidationHandler:", &v62);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = v37;
  v61[2] = sub_10001B714;
  v61[3] = &unk_100111990;
  v61[4] = self;
  v61[5] = v25;
  -[RPConnection setReceivedEventHandler:](v25, "setReceivedEventHandler:", v61);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = v37;
  v60[2] = sub_10001B730;
  v60[3] = &unk_1001119B8;
  v60[4] = self;
  v60[5] = v25;
  -[RPConnection setReceivedRequestHandler:](v25, "setReceivedRequestHandler:", v60);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = v37;
  v59[2] = sub_10001B750;
  v59[3] = &unk_1001119E0;
  v59[4] = self;
  v59[5] = v25;
  -[RPConnection setStateChangedHandler:](v25, "setStateChangedHandler:", v59);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = v37;
  v58[2] = sub_10001B760;
  v58[3] = &unk_100111968;
  v58[4] = v25;
  v58[5] = self;
  -[RPConnection setHomeKitUserIdentifierHandler:](v25, "setHomeKitUserIdentifierHandler:", v58);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = v37;
  v57[2] = sub_10001B7E4;
  v57[3] = &unk_100111968;
  v57[4] = self;
  v57[5] = v25;
  -[RPConnection setProxyDeviceUpdateHandler:](v25, "setProxyDeviceUpdateHandler:", v57);
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    id v39 = v12;
    if ((objc_opt_respondsToSelector(v39, "shortDescription") & 1) != 0)
    {
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 shortDescription]);
    }

    else if ((objc_opt_respondsToSelector(v39, "descriptionWithLevel:") & 1) != 0)
    {
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 descriptionWithLevel:50]);
    }

    else
    {
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 description]);
    }

    uint64_t v48 = (void *)v40;

    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]",  30LL,  "Connection start auth: PID %@, BD %@, Cnx %@\n",  v38,  v48,  v25);
  }

  tcpClientConnections = self->_tcpClientConnections;
  if (!tcpClientConnections)
  {
    uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v51 = self->_tcpClientConnections;
    self->_tcpClientConnections = v50;

    tcpClientConnections = self->_tcpClientConnections;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](tcpClientConnections, "setObject:forKeyedSubscript:", v25, v38);
  -[RPConnection activate](v25, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");

  BOOL v52 = 1;
LABEL_48:

  return v52;
}

- (void)_clientConnectionEndedUnauth:(id)a3 publicID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientConnectionEndedUnauth:publicID:]",  30LL,  "Connection ended unauth: PID %@, Cnx %@\n",  v6,  v8);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tcpClientConnections,  "objectForKeyedSubscript:",  v6));
  if (v7 == v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tcpClientConnections,  "setObject:forKeyedSubscript:",  0LL,  v6);
  }
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");
}

- (void)_clientOnDemandDiscoveryStart:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 discoveryTimer]);

  if (!v9)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandDiscoveryStart:xpcCnx:]",  30LL,  "Starting on-demand connection discovery over AWDL for %@\n",  v7);
    }

    id v10 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    [v8 setDiscoveryTimer:v10];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001BB54;
    handler[3] = &unk_100111A58;
    handler[4] = v10;
    void handler[5] = self;
    id v11 = v7;
    id v19 = v11;
    id v12 = v8;
    id v20 = v12;
    dispatch_source_set_event_handler(v10, handler);
    CUDispatchTimerSet(v10, 15.0, -1.0, 1.0);
    dispatch_activate(v10);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 client]);
    objc_msgSend( v11,  "setNearbyActionV2Type:",  -[RPCompanionLinkDaemon _controlFlagsToNearbyActionType:]( self,  "_controlFlagsToNearbyActionType:",  objc_msgSend(v13, "controlFlags")));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bleTargetData]);
    if (v14 && [v11 nearbyActionV2Type])
    {
      [v12 setNeedsNearbyActionV2:1];
      bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
      p_bleNearbyActionV2Device = &self->_bleNearbyActionV2Device;
      if (!bleNearbyActionV2Device) {
        goto LABEL_16;
      }
    }

    else
    {
      [v12 setNeedsCLink:1];
      bleNeedsCLinkDevice = self->_bleNeedsCLinkDevice;
      p_bleNearbyActionV2Device = &self->_bleNeedsCLinkDevice;
      if (!bleNeedsCLinkDevice) {
LABEL_16:
      }
        objc_storeStrong((id *)p_bleNearbyActionV2Device, a3);
    }

    goto LABEL_18;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandDiscoveryStart:xpcCnx:]",  90LL,  "### Start on-demand connection discovery already started: %@\n",  v7);
  }
LABEL_18:
}

- (void)_clientOnDemandAWDLDiscoveryStartForXPC:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  [v5 awdlGuestDiscoveryTimeout];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryTimer]);
  if (v8)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]",  90LL,  "### Restarting on-demand AWDL guest discovery");
    }

    id v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v4 discoveryTimer]);
    dispatch_source_cancel(v9);

    [v4 setDiscoveryTimer:0];
    [v4 setNeedsCLink:0];
  }

  double v10 = fmax(v7, 15.0);
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]",  30LL,  "Starting on-demand AWDL guest discovery with time-out %f\n",  v10);
  }
  self->_enableAWDLGuestDiscovery = 1;
  id v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  [v4 setDiscoveryTimer:v11];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001BD7C;
  handler[3] = &unk_100111708;
  handler[4] = v11;
  id v14 = v4;
  id v15 = self;
  id v12 = v4;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet(v11, v10, -1.0, 1.0);
  dispatch_activate(v11);
  [v12 setNeedsCLink:1];
  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (void)_clientOnDemandAWDLDiscoveryTimedOutForDevice:(id)a3 xpcCnx:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryTimedOutForDevice:xpcCnx:]",  90LL,  "### Start on-demand connection discovery timed out: %@\n",  v21);
  }
  [v6 setDiscoveryTimer:0];
  [v6 setNeedsCLink:0];
  [v6 setNeedsNearbyActionV2:0];
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 daemonDevice]);
  unsigned int v8 = [v7 isEqualToDevice:self->_bleNearbyActionV2Device];

  if (v8)
  {
    -[RPCompanionLinkDaemon _clientBLENearbyActionV2AdvertiserRestart]( self,  "_clientBLENearbyActionV2AdvertiserRestart");
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 daemonDevice]);
    unsigned int v10 = [v9 isEqualToDevice:self->_bleNeedsCLinkDevice];

    if (v10) {
      -[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserRestart](self, "_clientBLENeedsCLinkAdvertiserRestart");
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 netCnx]);
  id v18 = RPErrorF(4294960574LL, (uint64_t)"On-demand discovery timeout", v12, v13, v14, v15, v16, v17, v20);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v11 invalidateWithError:v19];

  [v6 setNetCnx:0];
  -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
}

- (void)_clientPurgeUnauthAWDLDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_unauthDevices;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unauthDevices,  "objectForKeyedSubscript:",  v9));
        id v11 = v10;
        if (v10 && ([v10 statusFlags] & 8) != 0)
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _clientPurgeUnauthAWDLDevices]",  30LL,  "Purging device: %@\n",  v11);
          }

          objc_msgSend( v11,  "setStatusFlags:",  (unint64_t)objc_msgSend(v11, "statusFlags") & 0xFFFFFFFFFFFFFFF3);
          [v3 addObject:v9];
          -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v11);
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_unauthDevices, "removeObjectsForKeys:", v3);
}

- (id)logDictionaryOfStringArrays:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v25 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    unint64_t v6 = 0LL;
    id v7 = 0LL;
    id v23 = v5;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v26 = v9;
          uint64_t v14 = *(void *)v30;
          while (2)
          {
            uint64_t v15 = 0LL;
            unint64_t v16 = v6;
            uint64_t v17 = v7;
            do
            {
              uint64_t v18 = v15;
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
              id v28 = v17;
              NSAppendPrintF(&v28, "%@, ", v19);
              id v7 = v28;

              unint64_t v6 = v16 + v15 + 1;
              if (v6 >= 0x11)
              {
                id v27 = v7;
                NSAppendPrintF( &v27,  " ... %d more not shown",  [v11 count] + ~(_DWORD)v16 - v15);
                id v20 = v27;

                id v7 = v20;
                goto LABEL_16;
              }

              ++v15;
              uint64_t v17 = v7;
            }

            while (v13 != (id)(v18 + 1));
            id v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
            unint64_t v6 = v16 + v15;
            if (v13) {
              continue;
            }
            break;
          }

          unint64_t v6 = v16 + v18 + 1;
LABEL_16:
          id v5 = v23;
          uint64_t v9 = v26;
        }

        if (dword_100131328 <= 10
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon logDictionaryOfStringArrays:withPrefix:]",  10LL,  "%@.%@: %@",  v22,  v9,  v7);
        }
      }

      id v25 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v25);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_clientReportFoundDevice:(id)a3
{
  id v4 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "reportFoundDevice:outReason:",  v4,  0,  (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)_clientReportLostDevice:(id)a3
{
  id v4 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "reportLostDevice:", v4, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "reportChangedDevice:changes:",  v6,  v4,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (BOOL)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131328 <= 10 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon triggerEnhancedDiscoveryForReason:useCase:error:]",  10LL,  "Incoming enhanced discovery trigger for reason '%@' with use case: 0x%x\n",  v8,  v6);
  }
  BOOL v9 = -[RPCompanionLinkDaemon _clientBLETriggerEnhancedDiscovery:useCase:error:]( self,  "_clientBLETriggerEnhancedDiscovery:useCase:error:",  v8,  v6,  a5);

  return v9;
}

- (BOOL)createDeviceToEndpointMappingForDeviceID:(id)a3 endpointUUID:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon findDeviceFromID:](self, "findDeviceFromID:", v8));
  if (v15)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:]",  30LL,  "Will create mapping for device=%@ UUID=%@\n",  v15,  v16);
    }

    if (a4) {
      *a4 = v16;
    }
    BOOL v17 = +[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]( &OBJC_CLASS___RPNWEndpoint,  "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:",  v15,  v16,  @"NA",  0LL,  0LL);
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:]",  30LL,  "Failed to find device with deviceID=%@\n",  v8);
    }

    if (a5)
    {
      id v18 = RPErrorF(4294960569LL, (uint64_t)"Failed to find device for mapping", v9, v10, v11, v12, v13, v14, v20);
      BOOL v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (void)_serverEnsureStarted
{
  unsigned int v3 = -[RPCompanionLinkDaemon _serverBonjourShouldRun](self, "_serverBonjourShouldRun");
  unsigned __int8 v4 = -[RPCompanionLinkDaemon _serverBonjourAWDLShouldRun](self, "_serverBonjourAWDLShouldRun");
  if ((v3 & 1) != 0
    || (v4 & 1) != 0
    || -[RPCompanionLinkDaemon _serverTCPHasActiveConnections](self, "_serverTCPHasActiveConnections"))
  {
    -[RPCompanionLinkDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
  }

  else
  {
    -[RPCompanionLinkDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
  }

  -[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStarted](self, "_serverBTAddressMonitorEnsureStarted");
  -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted](self, "_serverBLENeedsCLinkScannerEnsureStarted");
  if (-[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryShouldRun](self, "_serverNearbyActionV2DiscoveryShouldRun"))
  {
    -[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryEnsureStarted]( self,  "_serverNearbyActionV2DiscoveryEnsureStarted");
    if (!v3) {
      goto LABEL_13;
    }
  }

  else
  {
    -[RPCompanionLinkDaemon _serverNearbyActionV2DiscoveryEnsureStopped]( self,  "_serverNearbyActionV2DiscoveryEnsureStopped");
    if (!v3) {
      goto LABEL_13;
    }
  }

  if (!self->_homeKitWaiting || self->_homeKitLTPK)
  {
    -[RPCompanionLinkDaemon _serverBonjourEnsureStarted](self, "_serverBonjourEnsureStarted");
    goto LABEL_14;
  }

- (void)_serverEnsureStopped
{
}

- (BOOL)_serverNearbyActionV2DiscoveryShouldRun
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  id v3 = [v2 idsIsSignedIn];
  BOOL v6 = (_DWORD)v3
    && ((int DeviceClass = GestaltGetDeviceClass(v3, v4), DeviceClass == 3) || DeviceClass == 100 || DeviceClass == 11)
    && (([v2 idsHasiPad] & 1) != 0
     || ([v2 idsHasMac] & 1) != 0
     || [v2 idsHasRealityDevice]);

  return v6;
}

- (void)_serverNearbyActionV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyActionV2Discovery)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    -[RPNearbyActionV2Discovery setDiscoveryFlags:]( self->_bleNearbyActionV2Discovery,  "setDiscoveryFlags:",  0x402000000LL);
    -[RPNearbyActionV2Discovery setDispatchQueue:]( self->_bleNearbyActionV2Discovery,  "setDispatchQueue:",  self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001CBE0;
    v7[3] = &unk_1001110A8;
    void v7[4] = self;
    -[RPNearbyActionV2Discovery setUpdateHandler:](self->_bleNearbyActionV2Discovery, "setUpdateHandler:", v7);
    id v5 = self->_bleNearbyActionV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001CC0C;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[RPNearbyActionV2Discovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverNearbyActionV2DiscoveryEnsureStopped
{
  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    -[RPNearbyActionV2Discovery invalidate](bleNearbyActionV2Discovery, "invalidate");
    uint64_t v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0LL;
  }

- (BOOL)_serverNearbyInfoV2DiscoveryShouldRun
{
  if (_os_feature_enabled_impl("Sharing", "AskToAirDrop"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identitiesOfType:15 error:0]);

    id v5 = [v4 count];
    if (v5
      && ((int DeviceClass = GestaltGetDeviceClass(v5, v6), DeviceClass == 1) || DeviceClass == 100 || DeviceClass == 3))
    {
      BOOL v8 = (BYTE5(self->_bleDiscoveryControlFlags) >> 5) & 1;
    }

    else
    {
      LOBYTE(v8) = 0;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_serverNearbyInfoV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStarted]",  30LL,  "Starting NearbyInfoV2 discovery");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPNearbyInfoV2Discovery);
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = v3;

    -[RPNearbyInfoV2Discovery setDiscoveryType:](self->_bleNearbyInfoV2Discovery, "setDiscoveryType:", 17LL);
    -[RPNearbyInfoV2Discovery setDispatchQueue:]( self->_bleNearbyInfoV2Discovery,  "setDispatchQueue:",  self->_dispatchQueue);
    -[RPNearbyInfoV2Discovery setUseCase:](self->_bleNearbyInfoV2Discovery, "setUseCase:", 131094LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001CE84;
    v8[3] = &unk_100111A80;
    void v8[4] = self;
    -[RPNearbyInfoV2Discovery setDeviceFoundHandler:](self->_bleNearbyInfoV2Discovery, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001CED4;
    v7[3] = &unk_100111A80;
    void v7[4] = self;
    -[RPNearbyInfoV2Discovery setDeviceLostHandler:](self->_bleNearbyInfoV2Discovery, "setDeviceLostHandler:", v7);
    id v5 = self->_bleNearbyInfoV2Discovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001CF2C;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[RPNearbyInfoV2Discovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverNearbyInfoV2DiscoveryEnsureStopped
{
  if (self->_bleNearbyInfoV2Discovery)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverNearbyInfoV2DiscoveryEnsureStopped]",  30LL,  "Stopping NearbyInfoV2 discovery");
    }

    -[RPNearbyInfoV2Discovery invalidate](self->_bleNearbyInfoV2Discovery, "invalidate");
    bleNearbyInfoV2Discovery = self->_bleNearbyInfoV2Discovery;
    self->_bleNearbyInfoV2Discovery = 0LL;

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_nearbyInfoV2Devices, "allKeys", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyInfoV2Devices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i)));
          uint64_t v10 = v9;
          if (v9)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cbDevice]);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceIdentifier]);
            -[RPCompanionLinkDaemon _serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:]( self,  "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:",  v11,  v12,  1LL,  4LL);
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }
  }

- (void)_serverBLENeedsCLinkScannerEnsureStarted
{
  if (self->_bleNeedsCLinkScanner)
  {
    BOOL v3 = -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerScreenOff](self, "_serverBLENeedsCLinkScannerScreenOff");
  }

  else
  {
    unsigned int bleNeedsCLinkScannerID = self->_bleNeedsCLinkScannerID;
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted]",  30LL,  "BLE NeedsCLink scanner start ID %u\n",  bleNeedsCLinkScannerID);
    }

    id v5 = (SFDeviceDiscovery *)objc_alloc_init(off_100131398());
    bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = v5;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNeedsCLinkScanner, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNeedsCLinkScanner, "setDiscoveryFlags:", 64LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNeedsCLinkScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setOverrideScreenOff:]( self->_bleNeedsCLinkScanner,  "setOverrideScreenOff:",  -[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerScreenOff](self, "_serverBLENeedsCLinkScannerScreenOff"));
    -[SFDeviceDiscovery setPurpose:](self->_bleNeedsCLinkScanner, "setPurpose:", @"CLink");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001D330;
    v13[3] = &unk_100111828;
    unsigned int v14 = bleNeedsCLinkScannerID;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNeedsCLinkScanner, "setDeviceFoundHandler:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001D350;
    v11[3] = &unk_100111828;
    unsigned int v12 = bleNeedsCLinkScannerID;
    v11[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleNeedsCLinkScanner, "setDeviceLostHandler:", v11);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001D370;
    v9[3] = &unk_100111850;
    unsigned int v10 = bleNeedsCLinkScannerID;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNeedsCLinkScanner, "setDeviceChangedHandler:", v9);
    uint64_t v7 = self->_bleNeedsCLinkScanner;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001D390;
    v8[3] = &unk_1001118A0;
    void v8[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }

- (void)_serverBLENeedsCLinkScannerEnsureStopped
{
  if (self->_bleNeedsCLinkScanner)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStopped]",  30LL,  "BLE NeedsCLink scanner stop ID %u\n",  self->_bleNeedsCLinkScannerID);
    }

    -[SFDeviceDiscovery invalidate](self->_bleNeedsCLinkScanner, "invalidate");
    bleNeedsCLinkScanner = self->_bleNeedsCLinkScanner;
    self->_bleNeedsCLinkScanner = 0LL;

    ++self->_bleNeedsCLinkScannerID;
    -[NSMutableDictionary removeAllObjects](self->_bleNeedsCLinkDevices, "removeAllObjects");
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    if (pendingLostNeedsCLinkDevicesTimer)
    {
      dispatch_source_cancel((dispatch_source_t)pendingLostNeedsCLinkDevicesTimer);
      id v5 = self->_pendingLostNeedsCLinkDevicesTimer;
      self->_pendingLostNeedsCLinkDevicesTimer = 0LL;
    }
  }

- (BOOL)_serverBLENeedsCLinkScannerScreenOff
{
  if (self->_prefCommunal) {
    return 1;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  BOOL v2 = ([v3 idsHasAppleTV] & 1) != 0
    || ([v3 idsHasHomePod] & 1) != 0
    || ([v3 idsHasMac] & 1) != 0
    || (int)[v3 idsHandheldCount] > 2;

  return v2;
}

- (void)_serverBLENeedsCLinkScannerDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
  if (v6)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleNeedsCLinkDevices,  "objectForKeyedSubscript:",  v6));
    if ([v4 deviceActionType] != 51)
    {
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bleNeedsCLinkDevices,  "setObject:forKeyedSubscript:",  0LL,  v6);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]",  30LL,  "NeedsCLink device lost: %@\n",  v8);
        }
      }

      goto LABEL_44;
    }

    bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    if (!bleNeedsCLinkDevices)
    {
      unsigned int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v11 = self->_bleNeedsCLinkDevices;
      self->_bleNeedsCLinkDevices = v10;

      bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](bleNeedsCLinkDevices, "setObject:forKeyedSubscript:", v4, v6);
    if (v8)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceFound:]",  30LL,  "NeedsCLink device changed: %@\n",  v4);
      }

- (void)_serverBLENeedsCLinkScannerDeviceLost:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleNeedsCLinkDevices,  "objectForKeyedSubscript:",  v5));
    if (v6)
    {
      if ([v7 isBLEDeviceReplaced])
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]",  30LL,  "Ignoring NeedsCLink lost, BLE Device is being replaced: %@\n",  v7);
        }

        [v6 setIsBLEDeviceReplaced:1];
        -[RPCompanionLinkDaemon _schedulePendingLostNeedsCLinkDeviceTimer]( self,  "_schedulePendingLostNeedsCLinkDeviceTimer");
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bleNeedsCLinkDevices,  "setObject:forKeyedSubscript:",  0LL,  v5);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]",  30LL,  "NeedsCLink device lost: %@\n",  v6);
        }

        -[RPCompanionLinkDaemon _update](self, "_update");
      }
    }
  }

  else if (dword_100131328 <= 30 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerDeviceLost:]",  30LL,  "Ignoring NeedsCLink lost: No ID, %@\n",  v7);
  }
}

- (void)_schedulePendingLostNeedsCLinkDeviceTimer
{
  if (!self->_pendingLostNeedsCLinkDevicesTimer)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _schedulePendingLostNeedsCLinkDeviceTimer]",  30LL,  "Scheduling timer to process replaced NeedsCLink devices");
    }

    BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    pendingLostNeedsCLinkDevicesTimer = self->_pendingLostNeedsCLinkDevicesTimer;
    self->_pendingLostNeedsCLinkDevicesTimer = v3;

    id v5 = self->_pendingLostNeedsCLinkDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001DCCC;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    CUDispatchTimerSet(self->_pendingLostNeedsCLinkDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostNeedsCLinkDevicesTimer);
  }

- (void)_processPendingLostNeedsCLinkDevices
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleNeedsCLinkDevices, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v9 isBLEDeviceReplaced])
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _processPendingLostNeedsCLinkDevices]",  30LL,  "Process lost event for replaced NeedsCLink device: %@\n",  v9);
          }

          bleNeedsCLinkDevices = self->_bleNeedsCLinkDevices;
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( bleNeedsCLinkDevices,  "setObject:forKeyedSubscript:",  0LL,  v12);

          char v6 = 1;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);

    if ((v6 & 1) != 0) {
      -[RPCompanionLinkDaemon _update](self, "_update");
    }
  }

  else
  {
  }

- (BOOL)_serverBonjourShouldRun
{
  return self->_prefServerBonjourAlways
      || self->_serverBonjourInfraPairing
      || self->_prefServerBonjourOpportunitistic
      && ((-[CUSystemMonitor powerUnlimited](self->_systemMonitor, "powerUnlimited") & 1) != 0
       || !-[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked"));
}

- (BOOL)_serverBonjourAWDLShouldRun
{
  BOOL result = -[NSMutableDictionary count](self->_bleNeedsCLinkDevices, "count")
        || (v3 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearbyActionV2Discovery actionV2Devices]( self->_bleNearbyActionV2Discovery,  "actionV2Devices")),  id v4 = [v3 count],  v3,  v4)
        || self->_bonjourAWDLAdvertiserForce
        || -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count") != 0LL;
  return result;
}

- (void)_serverBonjourEnsureStarted
{
  if (self->_bonjourAdvertiser)
  {
    -[RPCompanionLinkDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
    return;
  }

  if (!self->_btAdvAddrData)
  {
    BOOL v3 = "Deferring Bonjour advertise without BT addr\n";
LABEL_14:
    LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _serverBonjourEnsureStarted]", 20LL, v3);
    return;
  }

  if ((int)-[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort") <= 0)
  {
    BOOL v3 = "Deferring Bonjour advertise without TCP listening port\n";
    goto LABEL_14;
  }

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourEnsureStarted]",  30LL,  "Bonjour advertiser start\n");
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___CUBonjourAdvertiser);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = v4;

  -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourAdvertiser setDomain:](self->_bonjourAdvertiser, "setDomain:", @"local.");
  -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:", @"CLink");
  -[CUBonjourAdvertiser setPort:]( self->_bonjourAdvertiser,  "setPort:",  -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
  -[CUBonjourAdvertiser setServiceType:](self->_bonjourAdvertiser, "setServiceType:", @"_companion-link._tcp");
  -[RPCompanionLinkDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
  -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
}

- (void)_serverBonjourEnsureStopped
{
  if (self->_bonjourAdvertiser)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourEnsureStopped]",  30LL,  "Bonjour advertiser stop\n");
    }

    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0LL;
  }

- (id)_serverBonjourAuthTagString
{
  BOOL v3 = self->_deviceAuthTagStr;
  if (!v3)
  {
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _serverBonjourAuthTagStringWithData:]( self,  "_serverBonjourAuthTagStringWithData:",  self->_btAdvAddrData));
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v4;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAuthTagString]",  30LL,  "AuthTagDevice updated: <%@>\n",  self->_deviceAuthTagStr);
    }

    BOOL v3 = self->_deviceAuthTagStr;
  }

  return v3;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identityOfSelfAndReturnError:0]);

    if (v5)
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authTagForData:v3 type:1 error:0]);
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = v6;
        uint64_t v9 = NSPrintF("%.3H", [v8 bytes], objc_msgSend(v8, "length"), objc_msgSend(v8, "length"));
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      }

      else
      {
        unsigned int v10 = 0LL;
      }
    }

    else
    {
      unsigned int v10 = 0LL;
    }
  }

  else
  {
    unsigned int v10 = 0LL;
  }

  return v10;
}

- (id)_serverBonjourTempAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identityOfTemporarySelfAndReturnError:0]);

    if (v5)
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authTagForData:v3 type:1 error:0]);
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = v6;
        uint64_t v9 = NSPrintF("%.3H", [v8 bytes], objc_msgSend(v8, "length"), objc_msgSend(v8, "length"));
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      }

      else
      {
        unsigned int v10 = 0LL;
      }
    }

    else
    {
      unsigned int v10 = 0LL;
    }
  }

  else
  {
    unsigned int v10 = 0LL;
  }

  return v10;
}

- (void)_serverBonjourUpdateTXT
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _serverBonjourAuthTagString](self, "_serverBonjourAuthTagString"));
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"rpAD");
  }

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", btAdvAddrStr, @"rpBA");
  }
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 0LL));
  id v8 = v6;
  if (v6)
  {
    id v9 = v6;
    uint64_t v10 = NSPrintF("%.3H", [v9 bytes], objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"rpHN");
  }

  int DeviceClass = GestaltGetDeviceClass(v6, v7);
  unint64_t v38 = 0LL;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags( &v38,  -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags"));
  unint64_t v13 = v38;
  if (DeviceClass == 7) {
    unint64_t v13 = v38 | 0x40000;
  }
  unint64_t v14 = v13 & 0xFFFFFFFFFFBFFFFDLL | (2LL * self->_prefCommunal) | ((unint64_t)self->_prefCoreDeviceEnabled << 22);
  unint64_t v38 = v14;
  if (DeviceClass == 100)
  {
    unint64_t v38 = v14 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)self->_prefCoreDevicePaired << 21);
    sub_10000AA10(100);
LABEL_12:
    unint64_t v15 = v38 | 0x20000;
    goto LABEL_14;
  }

  if (sub_10000AA10(DeviceClass)) {
    goto LABEL_12;
  }
  unint64_t v15 = v38;
LABEL_14:
  unint64_t v38 = v15 & 0xFFFFFFFFFFF6DFFFLL | ((unint64_t)self->_serverBonjourInfraPairing << 19) | ((unint64_t)self->_prefMediaControlEnabled << 13) | ((unint64_t)self->_prefTouchEnabled << 16);
  unint64_t v16 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
  unint64_t v38 = v38 & 0xFFFFFFFFFFFFBFFFLL | (((v16 >> 16) & 1) << 14);
  unint64_t v17 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
  unint64_t v18 = v38 & 0xFFFFFFFFFF7FFFFFLL | (((v17 >> 34) & 1) << 23);
  unint64_t v38 = v18;
  if (v18)
  {
    uint64_t v19 = NSPrintF("0x%llX", v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, @"rpFl");
  }

  unsigned int v21 = self->_homeKitAuthTag;

  if (v21)
  {
    unsigned int v22 = v21;
    id v23 = -[NSData bytes](v22, "bytes");
    id v24 = -[NSData length](v22, "length");
    id v25 = -[NSData length](v22, "length");
    uint64_t v26 = NSPrintF("%.3H", v23, v24, v25, v38);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, @"rpHA");
  }

  __int128 v28 = self->_homeKitRotatingID;

  if (v28)
  {
    __int128 v29 = v28;
    uint64_t v30 = NSPrintF( "%.3H",  -[NSData bytes](v29, "bytes"),  -[NSData length](v29, "length"),  -[NSData length](v29, "length"));
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v31, @"rpHI");
  }

  unsigned int v32 = -[RPCompanionLinkDaemon _localMediaAccessControlSetting](self, "_localMediaAccessControlSetting");
  if (v32 - 1 >= 2) {
    unsigned int v33 = 0;
  }
  else {
    unsigned int v33 = v32;
  }
  uint64_t v34 = NSPrintF("%d", v33);
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v35, @"rpMac");

  if (self->_prefCommunal)
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));
    if (v36) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v36, @"rpMd");
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  @"630.42.2",  @"rpVr");
  if (-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]( self,  "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:",  6LL))
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier"));
    if (v37) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v37, @"rpMRtID");
    }
  }

  -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAdvertiser, "setTxtDictionary:", v3);
}

- (BOOL)_serverBonjourAWDLAdvertiserShouldRun
{
  if (self->_bonjourAWDLAdvertiserForce) {
    return 1;
  }
  if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count")) {
    return 1;
  }
  if (-[RPCompanionLinkDaemon _haveActiveServerConnectionsOnAWDL](self, "_haveActiveServerConnectionsOnAWDL")) {
    return 1;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
  id v4 = [v3 count];

  if (v4) {
    return 1;
  }
  if (!-[NSMutableDictionary count](self->_bleNeedsCLinkDevices, "count")) {
    return 0;
  }
  if (!self->_prefUseTargetAuthTag) {
    return 1;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identityOfSelfAndReturnError:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identityOfTemporarySelfAndReturnError:0]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIRKData]);
  if (!v11)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]",  30LL,  "Enabling Bonjour AWDL advertiser as selfIdentity (%@) does not have selfIRK\n",  v8);
    }

    BOOL v5 = 1;
    goto LABEL_67;
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleNeedsCLinkDevices, "allValues"));
  id v50 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v50)
  {
    BOOL v5 = 0;
    goto LABEL_66;
  }

  unsigned int v12 = &selRef_set;
  unint64_t v13 = &selRef__registerForIncomingMessages;
  uint64_t v49 = *(void *)v53;
  id v46 = v10;
  uint64_t v47 = v8;
  id v43 = v11;
  while (2)
  {
    unint64_t v14 = 0LL;
    uint64_t v44 = v13[432];
    uint64_t v45 = v12[369];
    do
    {
      if (*(void *)v53 != v49) {
        objc_enumerationMutation(obj);
      }
      unint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v14);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bleDevice]);
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 advertisementFields]);
      CFTypeID TypeID = CFDataGetTypeID();
      uint64_t TypedValue = CFDictionaryGetTypedValue(v17, @"tatag", TypeID, 0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

      if (!v20)
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          id v38 = sub_100016C1C(v15);
          id v28 = (id)objc_claimAutoreleasedReturnValue(v38);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]",  30LL,  "Enabling Bonjour AWDL advertiser as device (%@) does not have target AuthTag\n",  v28);
          goto LABEL_64;
        }

        goto LABEL_65;
      }

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v8 authTagForData:v21 type:2 error:0]);
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        id v23 = v15;
        if ((objc_opt_respondsToSelector(v23, v45) & 1) != 0)
        {
          uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 shortDescription]);
        }

        else if ((objc_opt_respondsToSelector(v23, v44) & 1) != 0)
        {
          uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 descriptionWithLevel:50]);
        }

        else
        {
          uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 description]);
        }

        id v25 = (void *)v24;

        LogPrintF( &dword_100131328, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Evaluating target AuthTag <%@> from device (%@) using BLE addr %.6a selfAuthTag <%@>\n", v20, v25, [v21 bytes], v22);
      }

      uint64_t v51 = v21;
      id v26 = v22;
      id v27 = [v26 bytes];
      id v28 = v20;
      if (!memcmp(v27, [v28 bytes], (size_t)objc_msgSend(v28, "length")))
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          id v39 = sub_100016C1C(v15);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]",  30LL,  "Enabling Bonjour AWDL advertiser as target AuthTag from device (%@) is a match\n",  v40);
        }

LABEL_64:
LABEL_65:
        BOOL v5 = 1;
        uint64_t v11 = v43;
        goto LABEL_66;
      }

      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiser advertisingAddressDataNonConnectable]( self->_cbAdvertiser,  "advertisingAddressDataNonConnectable"));
      if (v29)
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIRKData]);

        if (v30)
        {
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v10 authTagForData:v29 type:2 error:0]);
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            id v32 = sub_100016C1C(v15);
            unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            LogPrintF( &dword_100131328, "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]", 30, "Evaluating target AuthTag <%@> from device (%@) using non-connectable BLE addr %.6a selfTemporaryAuthTag <%@>\n", v28, v33, [v29 bytes], v31);
          }

          id v34 = v31;
          id v35 = [v34 bytes];
          id v36 = v28;
          if (!memcmp(v35, [v36 bytes], (size_t)objc_msgSend(v36, "length")))
          {
            id v8 = v47;
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              id v41 = sub_100016C1C(v15);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]",  30LL,  "Enabling Bonjour AWDL advertiser as target AuthTag from device (%@) is a match\n",  v42);
            }

            id v28 = v36;
            uint64_t v10 = v46;
            goto LABEL_64;
          }

          id v8 = v47;
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserShouldRun]",  30LL,  "Skip enabling Bonjour AWDL advertiser as target AuthTag <%@> did not match hash <%@>\n",  v36,  v26);
          }

          uint64_t v10 = v46;
        }
      }

      unint64_t v14 = (char *)v14 + 1;
    }

    while (v50 != v14);
    id v37 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    BOOL v5 = 0;
    uint64_t v11 = v43;
    unsigned int v12 = &selRef_set;
    unint64_t v13 = &selRef__registerForIncomingMessages;
    id v50 = v37;
    if (v37) {
      continue;
    }
    break;
  }

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  if (self->_bonjourAWDLAdvertiser)
  {
    -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
  }

  else
  {
    unint64_t v15 = self->_btAdvAddrData;
    if (v15)
    {
      id v3 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      if ((int)v3 <= 0)
      {
        if (dword_100131328 <= 20
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  20LL,  "Deferring Bonjour AWDL advertise without TCP listening port\n");
        }
      }

      else
      {
        id v5 = v3;
        if (GestaltGetDeviceClass(v3, v4) != 11)
        {
          if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count")
            || (char v6 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearbyActionV2Discovery actionV2Devices]( self->_bleNearbyActionV2Discovery,  "actionV2Devices")),  v7 = [v6 count],  v6,  v7))
          {
            id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
            [v8 activateForClient:@"Ensemble"];
          }
        }

        id v9 = objc_alloc_init(&OBJC_CLASS___CUBonjourAdvertiser);
        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
        self->_bonjourAWDLAdvertiser = v9;

        -[CUBonjourAdvertiser setAdvertiseFlags:](self->_bonjourAWDLAdvertiser, "setAdvertiseFlags:", 2048LL);
        -[CUBonjourAdvertiser setDispatchQueue:]( self->_bonjourAWDLAdvertiser,  "setDispatchQueue:",  self->_dispatchQueue);
        -[CUBonjourAdvertiser setDomain:](self->_bonjourAWDLAdvertiser, "setDomain:", @"local.");
        -[CUBonjourAdvertiser setInterfaceName:](self->_bonjourAWDLAdvertiser, "setInterfaceName:", @"awdl0");
        -[CUBonjourAdvertiser setLabel:](self->_bonjourAWDLAdvertiser, "setLabel:", @"CLink");
        uint64_t v11 = NSPrintF("CLink-%@", v15);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v12);

        -[CUBonjourAdvertiser setPort:](self->_bonjourAWDLAdvertiser, "setPort:", v5);
        -[CUBonjourAdvertiser setServiceType:]( self->_bonjourAWDLAdvertiser,  "setServiceType:",  @"_companion-link._tcp");
        -[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          uint64_t v13 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30LL);
          unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  30LL,  "Bonjour AWDL advertiser start: %@\n",  v14);
        }

        -[CUBonjourAdvertiser activate](self->_bonjourAWDLAdvertiser, "activate");
      }
    }

    else if (dword_100131328 <= 20 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  20LL,  "Deferring Bonjour AWDL advertise without BT addr\n");
    }
  }

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 != -1
        || (int v6 = _LogCategory_Initialize(&dword_100131328, 30LL),
            bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser,
            v6))
      {
        uint64_t v4 = CUDescriptionWithLevel(bonjourAWDLAdvertiser, 30LL);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserEnsureStopped]",  30LL,  "Bonjour AWDL advertiser stop: %@\n",  v5);

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }

    -[CUBonjourAdvertiser invalidate](bonjourAWDLAdvertiser, "invalidate");
    if (!self->_bonjourBrowserAWDL)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
      [v7 invalidateForClient:@"Ensemble"];
    }

    id v8 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0LL;

    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0LL;
  }

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  if (self->_deviceAWDLRandomID
    || (uint64_t v3 = NSRandomData(6LL, 0LL),
        uint64_t v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v4,
        deviceAWDLRandomID,
        (id)-[NSData length](self->_deviceAWDLRandomID, "length") == (id)6))
  {
    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v6 = self->_deviceAWDLRandomID;
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = NSPrintF("%.6a", COERCE_DOUBLE((id)-[NSData bytes](v8, "bytes")));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v10, @"rpBA");
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _serverBonjourAuthTagStringWithData:]( self,  "_serverBonjourAuthTagStringWithData:",  v8));
      if (v11) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v11, @"rpAD");
      }
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _serverBonjourTempAuthTagStringWithData:]( self,  "_serverBonjourTempAuthTagStringWithData:",  v8));
      if (v12) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v12, @"rpTAD");
      }
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]",  30LL,  "Using Bluetooth Identifier %@ and AuthTag %@ for AWDL Bonjour advertisement\n",  v10,  v11);
      }

      unint64_t v13 = (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags");
      uint64_t v14 = 18432LL;
      if ((v13 & 0x10000) == 0) {
        uint64_t v14 = 2048LL;
      }
      if (self->_bonjourAWDLAdvertiseForPairing) {
        uint64_t v15 = v14 | 0x80000;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = NSPrintF("0x%llX", v15);
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v17, @"rpFl");

      id v18 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  @"630.42.2",  @"rpVr");
      if (dword_100131328 <= 30)
      {
        if (dword_100131328 != -1 || (id v18 = (id)_LogCategory_Initialize(&dword_100131328, 30LL), (_DWORD)v18))
        {
          if (self->_bonjourAWDLAdvertiseForPairing) {
            uint64_t v20 = "yes";
          }
          else {
            uint64_t v20 = "no";
          }
          id v18 = (id)LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]",  30LL,  "Bonjour advertise name: %s\n",  v20);
        }
      }

      if (GestaltGetDeviceClass(v18, v19) == 4 || self->_bonjourAWDLAdvertiseForPairing)
      {
        unsigned int v21 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBonjourAWDLAdvertiserUpdateTXT]",  30LL,  "Using device name: %@\n",  v21);
        }

        if (v21) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v21, @"rpNm");
        }
      }

      if (-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]( self,  "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:",  4LL))
      {
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier"));
        if (v22) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v22,  @"rpMRtID");
        }
      }

      -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAWDLAdvertiser, "setTxtDictionary:", v23);
    }
  }

- (void)_serverReceivedNeedsAWDLEvent:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_i", TypeID, 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v10)
  {
    uint64_t NSNumber = NSDictionaryGetNSNumber(v7, @"_ena", 0LL);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    unsigned int v13 = [v12 BOOLValue];

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v14 = "disable";
      if (v13) {
        uint64_t v14 = "enable";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:]",  30LL,  "Received NeedsAWDL %s event from peer %@\n",  v14,  v10);
    }

    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v13)
    {
      if (needsAWDLRequestIdentifiers) {
        goto LABEL_19;
      }
      uint64_t v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      unint64_t v17 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = v16;

      -[NSMutableSet addObject:](self->_needsAWDLRequestIdentifiers, "addObject:", v10);
      if (self->_needsAWDLRequestTimer) {
        goto LABEL_19;
      }
      id v18 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v18;
      uint64_t v20 = v18;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10001F894;
      handler[3] = &unk_1001110A8;
      handler[4] = self;
      dispatch_source_set_event_handler(v20, handler);
      CUDispatchTimerSet(v20, 15.0, -1.0, 1.0);
      dispatch_activate(v20);
    }

    else
    {
      -[NSMutableSet removeObject:](needsAWDLRequestIdentifiers, "removeObject:", v10);
      if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count")) {
        goto LABEL_19;
      }
      unsigned int v21 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0LL;

      unsigned int v22 = self->_needsAWDLRequestTimer;
      if (!v22) {
        goto LABEL_19;
      }
      uint64_t v20 = v22;
      dispatch_source_cancel(v20);
      id v23 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0LL;
    }

LABEL_19:
    -[RPCompanionLinkDaemon _update](self, "_update");
    goto LABEL_20;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:]",  90LL,  "Ignoring received NeedsAWDL event '%@' as it does not have peer identifier\n",  v6);
  }
LABEL_20:
}

- (BOOL)_shouldSendActivityLevelOverWiFi
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (self->_prefSendActLvlInfra)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _shouldSendActivityLevelOverWiFi]",  30LL,  "Sending activity levels to phone over infra wifi changed from %s -> %s. Clients: %@",  "yes",  "no",  v3);
    }

    self->_prefSendActLvlInfra = 0;
  }

  return 0;
}

- (BOOL)_shouldReceiveActivityLevelOverWiFi:(int64_t)a3
{
  return a3 == 2;
}

- (void)_clientSendActivityLevelOverWiFiIfNecessary
{
  if (-[RPCompanionLinkDaemon _shouldSendActivityLevelOverWiFi](self, "_shouldSendActivityLevelOverWiFi"))
  {
    id v3 = -[RPCompanionLinkDevice activityLevel](self->_localDeviceInfo, "activityLevel");
    if ((_DWORD)v3 != self->_lastSentActivityLevelOverWiFi)
    {
      id v4 = v3;
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceArray]);

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10001FC88;
      v24[3] = &unk_100111AA8;
      v24[4] = self;
      id v8 = v5;
      id v25 = v8;
      id v18 = v7;
      [v7 enumerateObjectsUsingBlock:v24];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      uint64_t v9 = v8;
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          unsigned int v13 = 0LL;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
            id v19 = 0LL;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:]( self,  "findConnectedDeviceForIdentifier:controlFlags:cnx:",  v14,  0x400000LL,  &v19));
            if (v15
              && ([v19 linkType] == 6
               || [v19 linkType] == 8
               || [v19 linkType] == 7))
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
              [v16 setObject:v17 forKeyedSubscript:@"_actLvl"];

              [v19 sendEncryptedEventID:@"_systemInfoUpdate" event:v16 options:0 completion:&stru_100111AC8];
            }

            self->_lastSentActivityLevelOverWiFi = (int)v4;

            unsigned int v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
        }

        while (v11);
      }
    }
  }

- (void)_serverBTAddressMonitorEnsureStarted
{
  if (!self->_btAdvAddrMonitor)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStarted]",  30LL,  "BT address monitor start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_btAdvAddrMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001FE88;
    v7[3] = &unk_1001110A8;
    void v7[4] = self;
    -[CUSystemMonitor setRotatingIdentifierChangedHandler:]( self->_btAdvAddrMonitor,  "setRotatingIdentifierChangedHandler:",  v7);
    id v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001FE90;
    v6[3] = &unk_1001110A8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverBTAddressMonitorEnsureStopped
{
  if (self->_btAdvAddrMonitor)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverBTAddressMonitorEnsureStopped]",  30LL,  "BT address monitor stop\n");
    }

    -[CUSystemMonitor invalidate](self->_btAdvAddrMonitor, "invalidate");
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0LL;
  }

- (void)_serverBTAddressChanged
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor rotatingIdentifierData](self->_btAdvAddrMonitor, "rotatingIdentifierData"));
  if ([obj length] == (id)6
    && (-[NSData isEqual:](self->_btAdvAddrData, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    id v3 = obj;
    uint64_t v4 = NSPrintF("%.6a", COERCE_DOUBLE([v3 bytes]));
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v5;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328, "-[RPCompanionLinkDaemon _serverBTAddressChanged]", 30, "Bluetooth address changed: %.6a\n", COERCE_DOUBLE([v3 bytes]));
    }

    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0LL;

    id v8 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1LL);
    -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1LL);
    -[RPCompanionLinkDaemon _update](self, "_update");
  }
}

- (BOOL)_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:(int)a3
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.airplay", @"enabled", &v17);
  uint64_t v5 = CFPrefs_GetInt64(@"com.apple.airplay", @"p2pAllow", &v16);
  uint64_t v6 = CFPrefs_GetInt64(@"com.apple.airplay", @"restrictToInfraAdvertising", v15);
  int DeviceClass = GestaltGetDeviceClass();
  int v8 = GestaltGetDeviceClass();
  BOOL v10 = Int64 == 1 || v17 == -6727;
  if (v5 != 1) {
    LODWORD(v5) = (DeviceClass == 4 || v8 == 100) && v16 == -6727;
  }
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]",  30LL,  "AirPlay advertisement preferences: enabled %d, p2p %d, intraOnly %d\n",  v10,  v5,  v6 == 1);
  }
  if (a3 == 6) {
    return DeviceClass == 4 && v10;
  }
  if (a3 != 4)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      else {
        uint64_t v14 = off_100112398[a3];
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:]",  90LL,  "Checking AirPlay advertisement with unsupported linkType %@\n",  v14);
    }

    return 0;
  }

  BOOL v11 = DeviceClass == 4 && v10;
  return v11 && v6 != 1 && ((v5 ^ 1) & 1) == 0;
}

- (void)_serverTCPEnsureStarted
{
  if (!self->_tcpServer)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _serverTCPEnsureStarted]", 30LL, "TCP server start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 13LL);
    -[CUTCPServer setLabel:](self->_tcpServer, "setLabel:", @"CLink");
    -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", self->_prefMaxConnectionCount);
    -[CUTCPServer setNetLinkManager:](self->_tcpServer, "setNetLinkManager:", self->_netLinkManager);
    -[CUTCPServer setConnectionPrepareHandler:](self->_tcpServer, "setConnectionPrepareHandler:", &stru_100111B08);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100020404;
    v9[3] = &unk_100111B30;
    v9[4] = self;
    -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v9);
    uint64_t v5 = self->_tcpServer;
    id v8 = 0LL;
    -[CUTCPServer activateDirectAndReturnError:](v5, "activateDirectAndReturnError:", &v8);
    id v6 = v8;
    if (v6)
    {
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverTCPEnsureStarted]",  90LL,  "### TCP server failed: %{error}\n",  v6);
      }

      -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
      id v7 = self->_tcpServer;
      self->_tcpServer = 0LL;
    }

    else
    {
      -[RPCompanionLinkDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
    }
  }

- (void)_serverTCPEnsureStopped
{
  if (self->_tcpServer)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _serverTCPEnsureStopped]", 30LL, "TCP server stop\n");
    }

    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v3 = self->_tcpServerConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "invalidate", (void)v9);
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_tcpServerConnections, "removeAllObjects");
    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0LL;
  }

- (id)_serverTCPHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setHomeKitManager:](v5, "setHomeKitManager:", self->_homeKitManager);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  -[RPConnection setCloudDaemon:](v5, "setCloudDaemon:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v5, "setIdentityDaemon:", v7);

  id v8 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  __int128 v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@Cnx-%u", @"CLink", v9);
  -[RPConnection setLabel:](v5, "setLabel:", v10);

  -[RPConnection setLocalDeviceInfo:](v5, "setLocalDeviceInfo:", self->_localDeviceInfo);
  -[RPConnection setTcpConnection:](v5, "setTcpConnection:", v4);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection label](v5, "label"));
  [v4 setLabel:v11];

  -[RPCompanionLinkDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v5);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100020858;
  v23[3] = &unk_100111968;
  v23[4] = v5;
  v23[5] = self;
  -[RPConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100020890;
  v22[3] = &unk_100111968;
  v22[4] = v5;
  v22[5] = self;
  -[RPConnection setPeerUpdatedHandler:](v5, "setPeerUpdatedHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100020910;
  void v21[3] = &unk_100111990;
  v21[4] = v5;
  v21[5] = self;
  -[RPConnection setReceivedEventHandler:](v5, "setReceivedEventHandler:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100020994;
  v20[3] = &unk_1001119B8;
  v20[4] = v5;
  v20[5] = self;
  -[RPConnection setReceivedRequestHandler:](v5, "setReceivedRequestHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100020A2C;
  v19[3] = &unk_1001119E0;
  v19[4] = v5;
  v19[5] = self;
  -[RPConnection setStateChangedHandler:](v5, "setStateChangedHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100020A6C;
  v18[3] = &unk_100111968;
  v18[4] = v5;
  void v18[5] = self;
  -[RPConnection setHomeKitUserIdentifierHandler:](v5, "setHomeKitUserIdentifierHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100020AF0;
  v17[3] = &unk_100111968;
  v17[4] = self;
  void v17[5] = v5;
  -[RPConnection setProxyDeviceUpdateHandler:](v5, "setProxyDeviceUpdateHandler:", v17);
  -[RPCompanionLinkDaemon _configureConnectionForPairing:](self, "_configureConnectionForPairing:", v5);
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    unsigned int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v14 = self->_tcpServerConnections;
    self->_tcpServerConnections = v13;

    tcpServerConnections = self->_tcpServerConnections;
  }

  -[NSMutableSet addObject:](tcpServerConnections, "addObject:", v5);
  -[RPConnection activate](v5, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
  uint64_t v15 = v5;

  return v15;
}

- (void)_configureConnectionForPairing:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100020BA0;
  v4[3] = &unk_100111B98;
  id v5 = a3;
  id v3 = v5;
  [v3 setConfigurePairingHandler:v4];
}

- (void)_serverTCPHandleConnectionEnded:(id)a3
{
  id v4 = a3;
  if (([v4 controlFlags] & 0x200) != 0)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = self->_xpcConnections;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (!v6) {
      goto LABEL_14;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (1)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "netCnx", (void)v15));
        if ((id)v11 == v4)
        {
        }

        else
        {
          __int128 v12 = (void *)v11;
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 session]);
          id v14 = (id)objc_claimAutoreleasedReturnValue([v13 cnx]);

          if (v14 != v4) {
            continue;
          }
        }

        [v10 updateErrorFlags:512];
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (!v7)
      {
LABEL_14:

        break;
      }
    }
  }

  -[NSMutableSet removeObject:](self->_tcpServerConnections, "removeObject:", v4, (void)v15);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0LL, v4);
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_serverTCPRemoveConnectionsWithIdentifier:(id)a3 exceptConnection:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (([v6 clientMode] & 1) == 0)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v7 = -[NSMutableSet copy](self->_tcpServerConnections, "copy");
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)i);
          if (v12 != v6)
          {
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) peerDeviceInfo]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDeviceInfo]);
            unsigned int v15 = [v13 isEqualToDeviceBasic:v14];

            if (v15)
            {
              if (dword_100131328 <= 30
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
              {
                __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 label]);
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 label]);
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _serverTCPRemoveConnectionsWithIdentifier:exceptConnection:]",  30LL,  "Removing stale connection %@, replacing with new connection %@ for device identifier %@\n",  v16,  v17,  v18);
              }

              [v12 setInvalidationHandled:1];
              -[RPCompanionLinkDaemon _serverTCPHandleConnectionEnded:](self, "_serverTCPHandleConnectionEnded:", v12);
              [v12 invalidate];
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v9);
    }
  }
}

- (BOOL)_serverTCPHasActiveConnections
{
  if (self->_prefServerBonjourOpportunitistic) {
    return -[RPCompanionLinkDaemon _haveActiveServerConnectionsOnAWDL](self, "_haveActiveServerConnectionsOnAWDL");
  }
  else {
    return -[NSMutableSet count](self->_tcpServerConnections, "count") != 0LL;
  }
}

- (void)_bleServerEnsureStarted
{
  if (!self->_bleServer)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _bleServerEnsureStarted]", 30LL, "BLE server start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    -[CUBLEServer setDispatchQueue:](self->_bleServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEServer setLabel:](self->_bleServer, "setLabel:", @"CLink");
    -[CUBLEServer setListenPSM:](self->_bleServer, "setListenPSM:", 129LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000212D8;
    v7[3] = &unk_100111BC0;
    void v7[4] = self;
    -[CUBLEServer setConnectionStartedHandler:](self->_bleServer, "setConnectionStartedHandler:", v7);
    id v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000212E4;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[CUBLEServer activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer
    && dword_100131328 <= 30
    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _bleServerEnsureStopped]", 30LL, "BLE server stop\n");
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = self->_bleServerConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "invalidate", (void)v9);
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_bleServerConnections, "removeAllObjects");
  -[CUBLEServer invalidate](self->_bleServer, "invalidate");
  bleServer = self->_bleServer;
  self->_bleServer = 0LL;
}

- (void)_bleServerHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setBleConnection:](v5, "setBleConnection:", v4);

  -[RPConnection setControlFlags:](v5, "setControlFlags:", 512LL);
  -[RPConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v5, "setIdentityDaemon:", v6);

  id v7 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  __int128 v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@Cnx-%u", @"CLink", v8);
  -[RPConnection setLabel:](v5, "setLabel:", v9);

  -[RPConnection setLocalDeviceInfo:](v5, "setLocalDeviceInfo:", self->_localDeviceInfo);
  -[RPCompanionLinkDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002179C;
  v18[3] = &unk_100111968;
  v18[4] = v5;
  void v18[5] = self;
  -[RPConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000217D4;
  v17[3] = &unk_100111990;
  v17[4] = v5;
  void v17[5] = self;
  -[RPConnection setReceivedEventHandler:](v5, "setReceivedEventHandler:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100021858;
  v16[3] = &unk_1001119B8;
  v16[4] = v5;
  void v16[5] = self;
  -[RPConnection setReceivedRequestHandler:](v5, "setReceivedRequestHandler:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000218F0;
  v15[3] = &unk_1001119E0;
  _BYTE v15[4] = v5;
  void v15[5] = self;
  -[RPConnection setStateChangedHandler:](v5, "setStateChangedHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100021930;
  v14[3] = &unk_100111968;
  v14[4] = v5;
  v14[5] = self;
  -[RPConnection setHomeKitUserIdentifierHandler:](v5, "setHomeKitUserIdentifierHandler:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000219B4;
  v13[3] = &unk_100111968;
  v13[4] = self;
  void v13[5] = v5;
  -[RPConnection setProxyDeviceUpdateHandler:](v5, "setProxyDeviceUpdateHandler:", v13);
  bleServerConnections = self->_bleServerConnections;
  if (!bleServerConnections)
  {
    __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v12 = self->_bleServerConnections;
    self->_bleServerConnections = v11;

    bleServerConnections = self->_bleServerConnections;
  }

  -[NSMutableSet addObject:](bleServerConnections, "addObject:", v5);
  -[RPConnection activate](v5, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_bleServerHandleConnectionEnded:(id)a3
{
  bleServerConnections = self->_bleServerConnections;
  id v5 = a3;
  -[NSMutableSet removeObject:](bleServerConnections, "removeObject:", v5);
  -[RPCompanionLinkDaemon _connectionStateChanged:cnx:](self, "_connectionStateChanged:cnx:", 0LL, v5);

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_btPipeSetup:(id)a3 withPriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    else {
      id v7 = off_1001123F8[(int)v4];
    }
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _btPipeSetup:withPriority:]",  30LL,  "BTPipe %s priority start\n",  v7);
  }

  [v6 setDispatchQueue:self->_dispatchQueue];
  [v6 setLabel:@"CLink"];
  [v6 setPriority:v4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100021BA8;
  v12[3] = &unk_100111968;
  id v8 = v6;
  id v13 = v8;
  id v14 = self;
  [v8 setStateChangedHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100021BBC;
  v10[3] = &unk_1001118A0;
  id v11 = v8;
  id v9 = v8;
  [v9 activateWithCompletion:v10];
}

- (void)_btPipeEnsureStarted
{
  id v3 = -[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked");
  if ((v3 & 1) != 0)
  {
    if (!self->_btPipe)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___CUBluetoothScalablePipe);
      btPipe = self->_btPipe;
      self->_btPipe = v5;

      -[CUBluetoothScalablePipe setIdentifier:](self->_btPipe, "setIdentifier:", @"CLink");
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100021F40;
      v15[3] = &unk_1001110A8;
      _BYTE v15[4] = self;
      -[CUBluetoothScalablePipe setPeerHostStateChangedHandler:](self->_btPipe, "setPeerHostStateChangedHandler:", v15);
      id v3 = -[RPCompanionLinkDaemon _btPipeSetup:withPriority:](self, "_btPipeSetup:withPriority:", self->_btPipe, 2LL);
    }

    if (!self->_btPipeHighPriority)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___CUBluetoothScalablePipe);
      btPipeHighPriority = self->_btPipeHighPriority;
      self->_btPipeHighPriority = v7;

      -[CUBluetoothScalablePipe setIdentifier:](self->_btPipeHighPriority, "setIdentifier:", @"CLinkHP");
      id v3 = -[RPCompanionLinkDaemon _btPipeSetup:withPriority:]( self,  "_btPipeSetup:withPriority:",  self->_btPipeHighPriority,  3LL);
    }

    if (GestaltGetDeviceClass(v3, v4) == 1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      if ([v9 idsHasWatch])
      {
        int v10 = _os_feature_enabled_impl("Rapport", "WatchWiFiDiscovery");

        if (!v10) {
          return;
        }
        __int128 v16 = @"statusFlags";
        __int128 v17 = &off_10011ADC0;
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  @"_ctxtColl"));

        if (!v11)
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          v14[2] = sub_100021FEC;
          v14[3] = &unk_100111BE8;
          v14[4] = self;
          -[RPCompanionLinkDaemon registerRequestID:options:handler:]( self,  "registerRequestID:options:handler:",  @"_ctxtColl",  v9,  v14);
        }

        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  @"_ctxtCollProxy"));

        if (!v12)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_100021FF8;
          v13[3] = &unk_100111BE8;
          v13[4] = self;
          -[RPCompanionLinkDaemon registerRequestID:options:handler:]( self,  "registerRequestID:options:handler:",  @"_ctxtCollProxy",  v9,  v13);
        }
      }
    }
  }

  else if (dword_100131328 <= 30 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _btPipeEnsureStarted]",  30LL,  "Deferring BTPipe start until FirstUnlock\n");
  }

- (void)_btPipeTearDown:(id)a3
{
  id v8 = a3;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    unsigned int v4 = [v8 priority];
    if (v4 > 3) {
      id v5 = "?";
    }
    else {
      id v5 = off_1001123F8[v4];
    }
    LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _btPipeTearDown:]", 30LL, "BTPipe %s priority stop\n", v5);
  }

  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    -[RPConnection invalidate](btPipeConnection, "invalidate");
    id v7 = self->_btPipeConnection;
    self->_btPipeConnection = 0LL;
  }

  [v8 invalidate];
}

- (void)_btPipeEnsureStopped
{
  if (self->_btPipe)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipe = self->_btPipe;
    self->_btPipe = 0LL;
  }

  if (self->_btPipeHighPriority)
  {
    -[RPCompanionLinkDaemon _btPipeTearDown:](self, "_btPipeTearDown:");
    btPipeHighPriority = self->_btPipeHighPriority;
    self->_btPipeHighPriority = 0LL;
  }

- (void)_btPipeHandleStateChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 state];
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    unsigned int v6 = [v4 priority];
    if (v6 > 3) {
      id v7 = "?";
    }
    else {
      id v7 = off_1001123F8[v6];
    }
    if (v5 > 2) {
      id v8 = "?";
    }
    else {
      id v8 = off_100112418[v5];
    }
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _btPipeHandleStateChanged:]",  30LL,  "BTPipe %s priority state changed to %s\n",  v7,  v8);
  }

  btPipeConnection = self->_btPipeConnection;
  if (v5 == 1)
  {
    if (!btPipeConnection
      && -[CUBluetoothScalablePipe state](self->_btPipe, "state") == 1
      && -[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000222B8;
      block[3] = &unk_1001110A8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }

  else if (btPipeConnection {
         && -[CUBluetoothScalablePipe state](self->_btPipe, "state") == 2
  }
         && -[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 2)
  {
    -[RPConnection invalidate](self->_btPipeConnection, "invalidate");
    id v11 = self->_btPipeConnection;
    self->_btPipeConnection = 0LL;
  }
}

- (void)_btPipeConnectionStart
{
  id v3 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setBtPipe:](v3, "setBtPipe:", self->_btPipe);
  -[RPConnection setBtPipeHighPriority:](v3, "setBtPipeHighPriority:", self->_btPipeHighPriority);
  -[RPConnection setControlFlags:](v3, "setControlFlags:", 64LL);
  -[RPConnection setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v3, "setIdentityDaemon:", v4);

  unsigned int v5 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v6 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v6;
  id v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@Cnx-%u", @"CLink", v6);
  -[RPConnection setLabel:](v3, "setLabel:", v7);

  -[RPConnection setLocalDeviceInfo:](v3, "setLocalDeviceInfo:", self->_localDeviceInfo);
  id v8 = -[RPConnection setPasswordType:](v3, "setPasswordType:", 3LL);
  else {
    int v10 = @"BTPipe-Watch";
  }
  -[RPConnection setPeerIdentifier:](v3, "setPeerIdentifier:", v10);
  -[RPConnection setPresent:](v3, "setPresent:", 1LL);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100022580;
  v22[3] = &unk_100111968;
  v22[4] = self;
  v22[5] = v3;
  -[RPConnection setInvalidationHandler:](v3, "setInvalidationHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10002258C;
  void v21[3] = &unk_1001118A0;
  v21[4] = self;
  -[RPConnection setPairVerifyCompletion:](v3, "setPairVerifyCompletion:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000225D8;
  v20[3] = &unk_100111968;
  v20[4] = v3;
  v20[5] = self;
  -[RPConnection setPeerUpdatedHandler:](v3, "setPeerUpdatedHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100022628;
  v19[3] = &unk_100111990;
  v19[4] = self;
  v19[5] = v3;
  -[RPConnection setReceivedEventHandler:](v3, "setReceivedEventHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100022644;
  v18[3] = &unk_1001119B8;
  v18[4] = self;
  void v18[5] = v3;
  -[RPConnection setReceivedRequestHandler:](v3, "setReceivedRequestHandler:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100022664;
  v17[3] = &unk_1001119E0;
  v17[4] = self;
  void v17[5] = v3;
  -[RPConnection setStateChangedHandler:](v3, "setStateChangedHandler:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100022674;
  v16[3] = &unk_100111968;
  v16[4] = v3;
  void v16[5] = self;
  -[RPConnection setHomeKitUserIdentifierHandler:](v3, "setHomeKitUserIdentifierHandler:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000226F8;
  v15[3] = &unk_100111968;
  _BYTE v15[4] = self;
  void v15[5] = v3;
  -[RPConnection setProxyDeviceUpdateHandler:](v3, "setProxyDeviceUpdateHandler:", v15);
  btPipeConnection = self->_btPipeConnection;
  if (btPipeConnection)
  {
    -[RPConnection invalidate](btPipeConnection, "invalidate");
    __int128 v12 = self->_btPipeConnection;
    self->_btPipeConnection = 0LL;
  }

  id v13 = self->_btPipeConnection;
  self->_btPipeConnection = v3;
  id v14 = v3;

  -[RPConnection activate](v14, "activate");
  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_btPipeConnectionEnded:(id)a3
{
  btPipeConnection = self->_btPipeConnection;
  self->_btPipeConnection = 0LL;

  -[RPCompanionLinkDaemon _updateAssertions](self, "_updateAssertions");
}

- (void)_btPipeSyncKeysIfNeeded
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CUBluetoothScalablePipe peerIdentifier](self->_btPipe, "peerIdentifier"));
  id v4 = (void *)v3;
  if (v3)
  {
    id v11 = (void *)v3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceForBluetoothUUID:v11]);

    if (v6)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v8 addSelfIdentityInfoToMessage:v7 flags:0];

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      [v9 sendIDSMessage:v7 cloudServiceID:@"com.apple.private.alloy.nearby" frameType:48 destinationDevice:v6 sendFlags:1 msgCtx:0 error:0];
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _btPipeSyncKeysIfNeeded]",  90LL,  "### No IDS device ID for watch identity request for Bluetooth UUID %@\n",  v11);
    }

    goto LABEL_18;
  }

  if (dword_100131328 <= 90)
  {
    id v11 = 0LL;
    if (dword_100131328 != -1 || (int v10 = _LogCategory_Initialize(&dword_100131328, 90LL), v4 = 0LL, v10))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _btPipeSyncKeysIfNeeded]",  90LL,  "### No peer identifier for watch identity request\n");
LABEL_18:
      id v4 = v11;
    }
  }
}

- (void)_activeDeviceAdded:(id)a3 cnx:(id)a4
{
  id v20 = a3;
  uint64_t v6 = (RPConnection *)a4;
  objc_msgSend(v20, "setLinkType:", -[RPConnection linkType](v6, "linkType"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection btPipe](v6, "btPipe"));

  unint64_t v8 = (unint64_t)[v20 statusFlags];
  uint64_t v9 = 4LL;
  if (v7) {
    uint64_t v9 = 1LL;
  }
  [v20 setStatusFlags:v8 | v9];
  if (!self->_prefCommunal) {
    goto LABEL_20;
  }
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDeviceIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice idsPersonalDeviceIdentifier]( self->_localDeviceInfo,  "idsPersonalDeviceIdentifier"));
  id v12 = v10;
  id v13 = v11;
  id v14 = v13;
  if (v12 == v13)
  {
  }

  else
  {
    if ((v12 == 0LL) == (v13 != 0LL))
    {

      goto LABEL_11;
    }

    unsigned int v15 = [v12 isEqual:v13];

    if (!v15)
    {
LABEL_11:
      unint64_t v16 = ~(unint64_t)[v20 statusFlags] & 0x10000080000;

      if (v16) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
  }

LABEL_12:
  if ([v20 isPersonal])
  {
    personalCnx = self->_personalCnx;
    [v20 setPersonal:1];
    objc_msgSend(v20, "setStatusFlags:", (unint64_t)objc_msgSend(v20, "statusFlags") | 0x80);
    objc_storeStrong((id *)&self->_personalCnx, a4);
    if (personalCnx == v6) {
      goto LABEL_20;
    }
  }

  else
  {
    [v20 setPersonal:1];
    objc_msgSend(v20, "setStatusFlags:", (unint64_t)objc_msgSend(v20, "statusFlags") | 0x80);
    objc_storeStrong((id *)&self->_personalCnx, a4);
  }

  if (dword_100131328 > 30) {
    goto LABEL_24;
  }
  if (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activeDeviceAdded:cnx:]",  30LL,  "Personal device added: %@\n",  v20);
  }
LABEL_20:
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    uint64_t v18 = CUDescriptionWithLevel(v20, 20LL);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activeDeviceAdded:cnx:]",  30LL,  "Add active device: %@\n",  v19);
  }

- (void)_activeDeviceRemoved:(id)a3 cnx:(id)a4
{
  id v16 = a3;
  uint64_t v6 = (RPConnection *)a4;
  -[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:](self, "_sessionHandlePeerDisconnect:", v6);
  [v16 setLinkType:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection btPipe](v6, "btPipe"));

  unint64_t v8 = (unint64_t)[v16 statusFlags];
  uint64_t v9 = -2LL;
  if (!v7) {
    uint64_t v9 = -5LL;
  }
  [v16 setStatusFlags:v8 & v9];
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    uint64_t v10 = CUDescriptionWithLevel(v16, 20LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:]",  30LL,  "Remove active device: %@\n",  v11);
  }

  if (self->_personalCnx == v6)
  {
    self->_personalCnx = 0LL;

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:]",  30LL,  "Personal device removed: %@\n",  v16);
    }

    -[RPCompanionLinkDaemon _personalDeviceUpdate](self, "_personalDeviceUpdate");
  }

  -[RPCompanionLinkDaemon _stereoDeviceUpdate:](self, "_stereoDeviceUpdate:", 0LL);
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  notify_post("com.apple.rapport.CompanionLinkDeviceRemoved");
  -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v6, "peerDeviceInfo"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);

  tcpClientConnections = self->_tcpClientConnections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100022E24;
  v17[3] = &unk_100111C10;
  uint64_t v18 = v6;
  __int128 v19 = v13;
  unsigned int v15 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpClientConnections,  "enumerateKeysAndObjectsUsingBlock:",  v17);
}

- (void)_activeDeviceChangedForConnection:(id)a3 bonjourDevice:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 peerDeviceInfo]);
  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"removedServices"]);

    if (v9) {
      [v19 sendReachabilityProbe:"Bonjour partial remove"];
    }
    id v10 = [v7 updateWithBonjourDevice:v6];
    if ((_DWORD)v10)
    {
      id v11 = v10;
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v19 label]);
        id v13 = (void *)v12;
        if (v12) {
          id v14 = (const __CFString *)v12;
        }
        else {
          id v14 = &stru_1001152C8;
        }
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v19 peerIdentifier]);
        id v16 = v6;
        if ((objc_opt_respondsToSelector(v16, "shortDescription") & 1) != 0)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 shortDescription]);
        }

        else if ((objc_opt_respondsToSelector(v16, "descriptionWithLevel:") & 1) != 0)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 descriptionWithLevel:50]);
        }

        else
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 description]);
        }

        uint64_t v18 = (void *)v17;

        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _activeDeviceChangedForConnection:bonjourDevice:]",  30LL,  "Bonjour peer changed <%@ %@>: %@, %#{flags}\n",  v14,  v15,  v18,  v11,  &unk_1001095AC);
      }

      -[RPCompanionLinkDaemon _activeDeviceChanged:changes:](self, "_activeDeviceChanged:changes:", v7, v11);
    }
  }
}

- (void)_activeDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink](self, "_reportXPCMatchingDiscoveryCLink");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "reportChangedDevice:changes:",  v6,  v4,  (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (int)_airPlayLeaderStateUncached
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 components]);

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) mediaProfile]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accessory]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

        if (v16
          && (!v10 || ((unint64_t)[v16 caseInsensitiveCompare:v10] & 0x8000000000000000) != 0))
        {
          id v17 = v16;

          uint64_t v10 = v17;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v9);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  else {
    int v18 = 5;
  }

  return v18;
}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  unsigned int v5 = self->_activeServers;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v11 = [v10 passwordType];
        if (v11 > 4 || ((1 << (char)v11) & 0x19) == 0)
        {
          id v13 = v11;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allowedMACAddresses]);
          [v4 setAllowedMACAddresses:v14];

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 pairSetupACL]);
          [v4 setPairSetupACL:v15];

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 password]);
          [v4 setPassword:v16];

          [v4 setPasswordType:v13];
          unsigned __int8 v17 = [v10 internalAuthFlags];
          if ((v17 & 1) != 0)
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472LL;
            v29[2] = sub_10002370C;
            v29[3] = &unk_100111C38;
            v29[4] = v10;
            [v4 setShowPasswordHandler:v29];
          }

          if ((v17 & 2) != 0)
          {
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472LL;
            v28[2] = sub_10002376C;
            v28[3] = &unk_100111C60;
            v28[4] = v10;
            [v4 setHidePasswordHandler:v28];
          }

          goto LABEL_17;
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (unsigned)_controlFlagsToNearbyActionType:(unint64_t)a3
{
  if ((a3 & 0x10000000000LL) != 0) {
    return 38;
  }
  else {
    return 0;
  }
}

- (id)_findExistingActiveDevice:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 isEqualToDeviceBasic:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_connectionStateChanged:(int)a3 cnx:(id)a4
{
  id v15 = a4;
  -[RPCompanionLinkDaemon _update](self, "_update");
  if (a3 != 1) {
    -[RPCompanionLinkDaemon _interestRemoveForCnx:](self, "_interestRemoveForCnx:", v15);
  }
  if (([v15 flags] & 1) == 0
    && ([v15 controlFlags] & 0x200) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 peerDeviceInfo]);
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceIdentifier]);
      if (v8 || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier])) != 0)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _findExistingActiveDevice:](self, "_findExistingActiveDevice:", v7));
        uint64_t v10 = v9;
        if (a3 == 1)
        {
          if (v9)
          {
            if ([v15 clientMode])
            {
              __int128 v11 = v10;
            }

            else
            {
              if (dword_100131328 <= 30
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
              {
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]",  30LL,  "Replacing stale connection with new: %@, %@\n",  v8,  v15);
              }

              -[RPCompanionLinkDaemon _serverTCPRemoveConnectionsWithIdentifier:exceptConnection:]( self,  "_serverTCPRemoveConnectionsWithIdentifier:exceptConnection:",  v8,  v15);
              __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activeDevices,  "objectForKeyedSubscript:",  v8));

              if (v11
                && dword_100131328 <= 90
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
              {
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]",  90LL,  "### Remove stale device failed: %@\n",  v11);
              }
            }
          }

          else
          {
            __int128 v11 = 0LL;
          }

          activeDevices = self->_activeDevices;
          if (!activeDevices)
          {
            __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int128 v14 = self->_activeDevices;
            self->_activeDevices = v13;

            activeDevices = self->_activeDevices;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](activeDevices, "setObject:forKeyedSubscript:", v7, v8);
          if (!v11) {
            -[RPCompanionLinkDaemon _activeDeviceAdded:cnx:](self, "_activeDeviceAdded:cnx:", v7, v15);
          }
        }

        else if (v9)
        {
          if ([v9 isEqualToDeviceBasic:v7])
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activeDevices,  "setObject:forKeyedSubscript:",  0LL,  v8);
            -[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:](self, "_activeDeviceRemoved:cnx:", v10, v15);
          }

          else if (dword_100131328 <= 90 {
                 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
          }
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]",  90LL,  "### Ignoring remove active device on mismatch: ED %@, CD %@, Cnx %@\n",  v10,  v7,  v15);
          }

          __int128 v11 = v10;
        }

        else
        {
          __int128 v11 = 0LL;
        }
      }

      else if (dword_100131328 <= 90 {
             && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      }
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]",  90LL,  "State changed with no device identifier for connection: %@\n",  v15);
      }
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _connectionStateChanged:cnx:]",  90LL,  "State changed with no device for connection: %@\n",  v15);
    }
  }
}

- (BOOL)_destinationID:(id)a3 matchesCnx:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (RPConnection *)a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerIdentifier](v7, "peerIdentifier"));
  unsigned __int8 v9 = [v8 isEqual:v6];

  if ((v9 & 1) == 0)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    unsigned __int8 v13 = [v12 isEqual:v6];

    if ((v13 & 1) != 0
      || (__int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceIdentifier]),
          unsigned __int8 v15 = [v14 isEqual:v6],
          v14,
          (v15 & 1) != 0)
      || (id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 publicIdentifier]),
          unsigned __int8 v17 = [v16 isEqual:v6],
          v16,
          (v17 & 1) != 0))
    {
      char v10 = 1;
LABEL_7:

      goto LABEL_8;
    }

    if ((-[RPConnection controlFlags](v7, "controlFlags") & 0x200) == 0)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_destinationIdentifierModelMap,  "objectForKeyedSubscript:",  v6));
      if (v19)
      {
        id v20 = (uint64_t (**)(void, void))v19;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 model]);
        unsigned __int8 v23 = ((uint64_t (**)(void, void *))v20)[2](v20, v22);
LABEL_12:
        char v10 = v23;

LABEL_15:
        goto LABEL_7;
      }

      uint64_t v24 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_destinationIdentifierRelMap,  "objectForKeyedSubscript:",  v6));
      if (v24)
      {
        id v20 = (uint64_t (**)(void, void))v24;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        char v10 = ((uint64_t (**)(void, id))v20)[2](v20, [v21 statusFlags]);
        goto LABEL_15;
      }

      if (([v6 isEqual:@"rapport:rdid:ActivePhone"] & 1) != 0
        || ([v6 isEqual:@"rapport:rdid:ActiveWatch"] & 1) != 0
        || [v6 isEqual:@"rapport:rdid:PairedCompanion"])
      {
        btPipeConnection = self->_btPipeConnection;
LABEL_20:
        char v10 = btPipeConnection == v7;
        goto LABEL_7;
      }

      if (-[RPCompanionLinkDaemon _destinationID:matchesProxyDeviceOnCnx:]( self,  "_destinationID:matchesProxyDeviceOnCnx:",  v6,  v7))
      {
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerIdentifier](v7, "peerIdentifier"));
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _destinationID:matchesCnx:]",  30LL,  "Connection to %@ is acting as a proxy for destination %@",  v26,  v6);
        }

        goto LABEL_35;
      }

      if ([v6 isEqual:@"rapport:rdid:PersonalCompanion"])
      {
        btPipeConnection = self->_personalCnx;
        goto LABEL_20;
      }

      if ([v6 isEqual:@"rapport:rdid:StereoCounterpart"])
      {
        btPipeConnection = self->_stereoCnx;
        goto LABEL_20;
      }

      if ([v6 isEqual:@"rapport:rdid:SameHome"])
      {
LABEL_35:
        char v10 = ((unint64_t)-[RPConnection statusFlags](v7, "statusFlags") & 0x10000AE000LL) != 0;
        goto LABEL_7;
      }

      if ([v6 isEqual:@"rapport:rdid:SameRoom"]
        && ((unint64_t)-[RPConnection statusFlags](v7, "statusFlags") & 0x10000AE000LL) != 0)
      {
        id v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice roomName]( self->_localDeviceInfo,  "roomName"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v7, "peerDeviceInfo"));
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 roomName]);
        unsigned __int8 v23 = [v20 isEqual:v22];
        goto LABEL_12;
      }
    }

    char v10 = 0;
    goto LABEL_7;
  }

  char v10 = 1;
LABEL_8:

  return v10;
}

- (void)_disconnectRemovedSharedHomeDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identitiesOfType:9 error:0]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100024054;
  v5[3] = &unk_100111C88;
  v5[4] = v4;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v5);
}

- (void)_disconnectUnauthConnections
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = -[NSMutableSet copy](self->_tcpServerConnections, "copy");
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v7 flags])
        {
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _disconnectUnauthConnections]",  30LL,  "Disconnect unauth: %@\n",  v7);
          }

          [v7 invalidate];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

- (void)_disconnectUnpairedDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identitiesOfType:8 error:0]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100024420;
  v5[3] = &unk_100111C88;
  v5[4] = v4;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v5);
}

- (id)_discoveryNonceOrRotate:(BOOL)a3
{
  if (a3 || (id v4 = self->_discoveryNonceData) == 0LL)
  {
    uint64_t v5 = NSRandomData(6LL, 0LL);
    id v4 = (NSData *)objc_claimAutoreleasedReturnValue(v5);
    objc_storeStrong((id *)&self->_discoveryNonceData, v4);
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _discoveryNonceOrRotate:]",  30LL,  "Discovery Nonce updated: <%@>\n",  v4);
    }
  }

  return v4;
}

- (void)_duetSyncEnsureStarted
{
  if (!self->_duetSyncClient)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _duetSyncEnsureStarted]",  30LL,  "DuetSync advertiser start\n");
    }

    id v3 = (SFClient *)objc_alloc_init(off_1001313A8());
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = v3;

    -[SFClient setDispatchQueue:](self->_duetSyncClient, "setDispatchQueue:", self->_dispatchQueue);
    -[SFClient activateAssertionWithIdentifier:]( self->_duetSyncClient,  "activateAssertionWithIdentifier:",  @"com.apple.sharing.DuetSync");
  }

- (void)_duetSyncEnsureStopped
{
  if (self->_duetSyncClient)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _duetSyncEnsureStopped]", 30LL, "DuetSync advertiser stop\n");
    }

    -[SFClient invalidate](self->_duetSyncClient, "invalidate");
    duetSyncClient = self->_duetSyncClient;
    self->_duetSyncClient = 0LL;
  }

- (id)findAuthAWDLPairingModeDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatedAWDLPairingModeDevices,  "objectForKeyedSubscript:",  v4));
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_authenticatedAWDLPairingModeDevices, "allKeys"));
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatedAWDLPairingModeDevices,  "objectForKeyedSubscript:",  v13));
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 publicIdentifier]);
          unsigned __int8 v16 = [v15 isEqual:v4];

          if ((v16 & 1) != 0)
          {
            id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatedAWDLPairingModeDevices,  "objectForKeyedSubscript:",  v13));

            goto LABEL_13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0LL;
LABEL_13:
    id v6 = 0LL;
  }

  return v7;
}

- (id)findConnectedDeviceForIdentifier:(id)a3 controlFlags:(unint64_t)a4 cnx:(id *)a5
{
  uint64_t v15 = 0LL;
  unsigned __int8 v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int128 v18 = sub_10000B284;
  __int128 v19 = sub_10000B294;
  id v20 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100024A78;
  v9[3] = &unk_100111CB0;
  unint64_t v13 = a4;
  id v10 = self;
  id v6 = a3;
  id v11 = v6;
  __int128 v12 = &v15;
  __int128 v14 = a5;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](v10, "_forEachConnectionWithHandler:", v9);
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)_findWiFiConnectionByID:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unint64_t v13 = sub_10000B284;
  __int128 v14 = sub_10000B294;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024E30;
  v7[3] = &unk_100111CD8;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_findMatchingAWDLBonjourDevice:(id)a3
{
  id v4 = a3;
  id v5 = self->_bonjourAWDLDevices;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if (v6
    && (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0
    || (v6, (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier])) != 0)
    && (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0
    || (v6, (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 publicIdentifier])) != 0)
    && (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6))) != 0)
  {
    id v8 = (void *)v7;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_findDeviceWithDevice:(id)a3 deviceMap:(id)a4 matchedIdentifier:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
  if (v9 && (uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9])) != 0
    || (v9, (id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier])) != 0)
    && (uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9])) != 0)
  {
    id v11 = (void *)v10;
    uint64_t v12 = (void *)v10;
    if (a5)
    {
LABEL_6:
      objc_storeStrong(a5, v9);
      uint64_t v12 = v11;
    }
  }

  else
  {

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 publicIdentifier]);
    if (!v9)
    {
      uint64_t v12 = 0LL;
      goto LABEL_15;
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    if (v13) {
      uint64_t v12 = (void *)v13;
    }
    else {
      uint64_t v12 = 0LL;
    }
    if (v13)
    {
      id v11 = (void *)v13;
      if (a5) {
        goto LABEL_6;
      }
    }
  }

- (id)findUnauthDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  __int128 v14 = sub_10000B284;
  id v15 = sub_10000B294;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unauthDevices, "objectForKeyedSubscript:", v4));
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000251C4;
    v8[3] = &unk_100111CD8;
    id v9 = v4;
    uint64_t v10 = &v11;
    -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v8);
    id v6 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_forEachConnectionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  v41[0] = 0;
  btPipeConnection = self->_btPipeConnection;
  if (!btPipeConnection
    || ((*((void (**)(id, RPConnection *, char *))v4 + 2))(v4, btPipeConnection, v41), !*((_BYTE *)v39 + 24)))
  {
    tcpClientConnections = self->_tcpClientConnections;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10002558C;
    v35[3] = &unk_100111D00;
    id v8 = v5;
    id v36 = v8;
    id v37 = &v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpClientConnections,  "enumerateKeysAndObjectsUsingBlock:",  v35);
    if (!*((_BYTE *)v39 + 24))
    {
      tcpOnDemandClientConnections = self->_tcpOnDemandClientConnections;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000255E0;
      v32[3] = &unk_100111D00;
      id v10 = v8;
      id v33 = v10;
      id v34 = &v38;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpOnDemandClientConnections,  "enumerateKeysAndObjectsUsingBlock:",  v32);
      if (!*((_BYTE *)v39 + 24))
      {
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        uint64_t v11 = self->_tcpServerConnections;
        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v28,  v43,  16LL);
        if (v12)
        {
          uint64_t v13 = *(void *)v29;
LABEL_7:
          uint64_t v14 = 0LL;
          while (1)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v11);
            }
            (*((void (**)(id, void, uint64_t *))v10 + 2))( v10,  *(void *)(*((void *)&v28 + 1) + 8 * v14),  v39 + 3);
            if (*((_BYTE *)v39 + 24)) {
              break;
            }
            if (v12 == (id)++v14)
            {
              id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v28,  v43,  16LL);
              if (v12) {
                goto LABEL_7;
              }
              goto LABEL_13;
            }
          }
        }

        else
        {
LABEL_13:

          bleClientConnections = self->_bleClientConnections;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_100025634;
          v25[3] = &unk_100111D00;
          id v16 = (NSMutableSet *)v10;
          __int128 v26 = v16;
          __int128 v27 = &v38;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( bleClientConnections,  "enumerateKeysAndObjectsUsingBlock:",  v25);
          if (!*((_BYTE *)v39 + 24))
          {
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            uint64_t v17 = self->_bleServerConnections;
            id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v21,  v42,  16LL);
            if (v18)
            {
              uint64_t v19 = *(void *)v22;
LABEL_16:
              uint64_t v20 = 0LL;
              while (1)
              {
                if (*(void *)v22 != v19) {
                  objc_enumerationMutation(v17);
                }
                ((void (*)(NSMutableSet *, void, uint64_t *))v16[2].super.super.isa)( v16,  *(void *)(*((void *)&v21 + 1) + 8 * v20),  v39 + 3);
                if (*((_BYTE *)v39 + 24)) {
                  break;
                }
                if (v18 == (id)++v20)
                {
                  id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v21,  v42,  16LL);
                  if (v18) {
                    goto LABEL_16;
                  }
                  break;
                }
              }
            }
          }

          uint64_t v11 = v26;
        }
      }
    }
  }

  _Block_object_dispose(&v38, 8);
}

- (void)_forEachMatchingDestinationID:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002572C;
  v7[3] = &unk_100111D28;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](v8, "_forEachConnectionWithHandler:", v7);
}

- (void)_forEachUniqueMatchingDestinationID:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100025844;
  v10[3] = &unk_100111D50;
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v12 = v6;
  id v8 = v6;
  id v9 = v11;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:]( self,  "_forEachMatchingDestinationID:handler:",  v7,  v10);
}

- (id)_getAppleID
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CUAppleIDClient);
  id v3 = [v2 copyMyAppleIDAndReturnError:0];

  return v3;
}

- (BOOL)_haveActiveClientConnectionsOnAWDL
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_tcpOnDemandClientConnections, "allValues", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v8 state] == 1 && objc_msgSend(v8, "linkType") == 4)
        {
          id v10 = (NSString *)objc_claimAutoreleasedReturnValue([v8 inUseProcessesToString]);
          bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
          self->_bonjourBrowserAWDLProcess = v10;

          BOOL v9 = 1;
          goto LABEL_12;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_haveActiveServerConnectionsOnAWDL
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = self->_tcpServerConnections;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)i), "linkType", (void)v7) == 4)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)_hidEnsureStarted
{
  if (!self->_hidDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _hidEnsureStarted]", 30LL, "HID daemon start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPHIDDaemon);
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = v3;

    -[RPHIDDaemon setMessenger:](self->_hidDaemon, "setMessenger:", self);
    id v5 = self->_hidDaemon;
    id v8 = 0LL;
    unsigned __int8 v6 = -[RPHIDDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    id v7 = v8;
    if ((v6 & 1) == 0
      && dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _hidEnsureStarted]",  90LL,  "### HID daemon start failed: %{error}\n",  v7);
    }
  }

- (void)_hidEnsureStopped
{
  if (self->_hidDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _hidEnsureStopped]", 30LL, "HID daemon stop\n");
    }

    -[RPHIDDaemon invalidate](self->_hidDaemon, "invalidate");
    hidDaemon = self->_hidDaemon;
    self->_hidDaemon = 0LL;
  }

- (void)interestRegisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestPeers,  "objectForKeyedSubscript:",  v9));
  if (!v11)
  {
    if (!self->_interestPeers)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      interestPeers = self->_interestPeers;
      self->_interestPeers = v12;
    }

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interestPeers, "setObject:forKeyedSubscript:", v11, v9);
  }

  __int128 v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v8));
  if (v14)
  {
    __int128 v15 = v14;
    -[NSMutableSet addObject:](v14, "addObject:", v10);
  }

  else
  {
    __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, v8);
    -[NSMutableSet addObject:](v15, "addObject:", v10);
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon interestRegisterEventID:peerIdentifier:owner:]",  30LL,  "Interest register local: Peer %@, EventID %@\n",  v9,  v8);
    }

    id v18 = v8;
    uint64_t v19 = @"_regEvents";
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    uint64_t v20 = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_interest",  v17,  v9,  0LL,  0LL);
  }
}

- (void)interestDeregisterEventID:(id)a3 peerIdentifier:(id)a4 owner:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interestPeers, "objectForKeyedSubscript:", v9));
  id v12 = v11;
  if (v11)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);
    __int128 v14 = v13;
    if (v13)
    {
      [v13 removeObject:v10];
      if (![v14 count])
      {
        [v12 setObject:0 forKeyedSubscript:v8];
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon interestDeregisterEventID:peerIdentifier:owner:]",  30LL,  "Interest deregister local: Peer %@, EventID %@\n",  v9,  v8);
        }

        id v17 = v8;
        id v18 = @"_deregEvents";
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
        uint64_t v19 = v15;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

        -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_interest",  v16,  v9,  0LL,  0LL);
      }
    }
  }
}

- (void)_interestReceived:(id)a3 cnx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDeviceInfo]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v9)
  {
    id v10 = (void *)v9;

LABEL_4:
    id v42 = v7;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    CFTypeID TypeID = CFArrayGetTypeID();
    id v43 = v6;
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"_regEvents", TypeID, 0LL);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    id v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      id v18 = v15;
      uint64_t v19 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v16, v17);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestEvents,  "objectForKeyedSubscript:",  v21));
            __int128 v24 = (NSMutableSet *)v23;
            if (!v23)
            {
              __int128 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              interestEvents = self->_interestEvents;
              if (!interestEvents)
              {
                __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                __int128 v27 = self->_interestEvents;
                self->_interestEvents = v26;

                interestEvents = self->_interestEvents;
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( interestEvents,  "setObject:forKeyedSubscript:",  v24,  v21);
            }

            -[NSMutableSet addObject:](v24, "addObject:", v10);
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _interestReceived:cnx:]",  30LL,  "Interest register remote: Peer %@, EventID %@ (%d total)\n",  v10,  v21,  -[NSMutableSet count](v24, "count"));
            }

            if (!v23) {
              -[RPHIDDaemon registeredEventID:](self->_hidDaemon, "registeredEventID:", v21);
            }
            -[RPMediaControlDaemon registeredEventID:](self->_mediaControlDaemon, "registeredEventID:", v21);
          }
        }

        id v18 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }

      while (v18);
    }

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    CFTypeID v28 = CFArrayGetTypeID();
    uint64_t v29 = CFDictionaryGetTypedValue(v43, @"_deregEvents", v28, 0LL);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v31)
    {
      id v34 = v31;
      uint64_t v35 = *(void *)v45;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v30);
          }
          uint64_t v37 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)j);
          uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString, v32, v33);
          if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
          {
            id v39 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestEvents,  "objectForKeyedSubscript:",  v37));
            uint64_t v40 = v39;
            if (v39)
            {
              [v39 removeObject:v10];
              id v41 = [v40 count];
              if (!v41) {
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_interestEvents,  "setObject:forKeyedSubscript:",  0LL,  v37);
              }
              if (dword_100131328 <= 30
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
              {
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _interestReceived:cnx:]",  30LL,  "Interest deregister remote: Peer %@, EventID %@ (%d total)\n",  v10,  v37,  v41);
              }

              if (!v41)
              {
                -[RPHIDDaemon deregisteredEventID:](self->_hidDaemon, "deregisteredEventID:", v37);
                -[RPMediaControlDaemon deregisteredEventID:](self->_mediaControlDaemon, "deregisteredEventID:", v37);
              }
            }
          }
        }

        id v34 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }

      while (v34);
    }

    id v7 = v42;
    id v6 = v43;
    goto LABEL_42;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDeviceInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 publicIdentifier]);

  if (v10) {
    goto LABEL_4;
  }
  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _interestReceived:cnx:]",  90LL,  "### Interest received with no peer identifier: %@\n",  v7);
  }
LABEL_42:
}

- (void)_interestRemoveForCnx:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerDeviceInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  if (v6)
  {
    id v15 = v4;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_interestEvents, "allKeys"));
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestEvents,  "objectForKeyedSubscript:",  v12));
          [v13 removeObject:v6];
          id v14 = [v13 count];
          if (!v14) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_interestEvents,  "setObject:forKeyedSubscript:",  0LL,  v12);
          }
          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _interestRemoveForCnx:]",  30LL,  "Interest deregister remote: Peer %@, EventID %@ (%d total)\n",  v6,  v12,  v14);
          }

          if (!v14)
          {
            -[RPHIDDaemon deregisteredEventID:](self->_hidDaemon, "deregisteredEventID:", v12);
            -[RPMediaControlDaemon deregisteredEventID:](self->_mediaControlDaemon, "deregisteredEventID:", v12);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }

    id v4 = v15;
  }

  else if (dword_100131328 <= 90 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _interestRemoveForCnx:]",  90LL,  "### Interest remove all with no peer identifier: %@\n",  v4);
  }
}

- (void)_interestSendEventID:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestEvents,  "objectForKeyedSubscript:",  v6,  0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  v6,  v7,  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12),  0LL,  0LL);
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)_localDeviceUpdate
{
  unsigned __int8 v179 = -[RPCompanionLinkDevice changed](self->_localDeviceInfo, "changed");
  BOOL v3 = sub_10000AA20();
  int v4 = v3;
  int DeviceClass = GestaltGetDeviceClass(v3, v5);
  if (!self->_localDeviceInfo)
  {
    __int128 v14 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
    localDeviceInfo = self->_localDeviceInfo;
    self->_localDeviceInfo = v14;

    -[RPCompanionLinkDevice setDaemon:](self->_localDeviceInfo, "setDaemon:", 1LL);
    -[RPCompanionLinkDevice setFlags:]( self->_localDeviceInfo,  "setFlags:",  -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x40);
    -[RPCompanionLinkDevice setFlags:]( self->_localDeviceInfo,  "setFlags:",  -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x80);
    if (DeviceClass == 4)
    {
      -[RPCompanionLinkDevice setStatusFlags:]( self->_localDeviceInfo,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](self->_localDeviceInfo, "statusFlags") | 0x10000);
      BOOL v7 = 0;
      goto LABEL_12;
    }

    if (DeviceClass == 7) {
      -[RPCompanionLinkDevice setFlags:]( self->_localDeviceInfo,  "setFlags:",  -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 2);
    }
  }

  BOOL v7 = DeviceClass == 7;
  if (!self->_soundBoardUserLeaderKVO && DeviceClass == 7)
  {
    soundBoardPrefs = self->_soundBoardPrefs;
    if (!soundBoardPrefs)
    {
      id v9 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.soundboard");
      id v10 = self->_soundBoardPrefs;
      self->_soundBoardPrefs = v9;

      soundBoardPrefs = self->_soundBoardPrefs;
    }

    BOOL v7 = 1;
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( soundBoardPrefs,  "addObserver:forKeyPath:options:context:",  self,  @"stereo_leader",  1LL,  0LL);
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( self->_soundBoardPrefs,  "addObserver:forKeyPath:options:context:",  self,  @"stereo_leader_info",  1LL,  0LL);
    self->_soundBoardUserLeaderKVO = 1;
    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.soundboard", @"stereo_leader", 0LL);
    self->_soundBoardUserLeader = Int64 != 0;
    if (!Int64)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      __int128 v13 = (void *)CFPrefs_CopyTypedValue(@"com.apple.soundboard", @"stereo_leader_info", TypeID, 0LL);
      self->_soundBoardUserLeader = CFDictionaryGetInt64(v13, @"stereo_leader", 0LL) != 0;

      BOOL v7 = 1;
    }
  }

- (void)_localDeviceCleanup
{
  if (self->_mediaAccessControlKVO)
  {
    self->_mediaAccessControlKVO = 0;
    -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_airplayPrefs,  "removeObserver:forKeyPath:context:",  self,  @"accessControlLevel",  0LL);
    -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_airplayPrefs,  "removeObserver:forKeyPath:context:",  self,  @"p2pAllow",  0LL);
  }

  airplayPrefs = self->_airplayPrefs;
  self->_airplayPrefs = 0LL;

  if (self->_soundBoardUserLeaderKVO)
  {
    self->_soundBoardUserLeaderKVO = 0;
    -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_soundBoardPrefs,  "removeObserver:forKeyPath:context:",  self,  @"stereo_leader",  0LL);
    -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_soundBoardPrefs,  "removeObserver:forKeyPath:context:",  self,  @"stereo_leader_info",  0LL);
  }

  soundBoardPrefs = self->_soundBoardPrefs;
  self->_soundBoardPrefs = 0LL;
}

- (int)_localMediaAccessControlSetting
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.airplay", @"accessControlLevel", &v8);
  uint64_t v3 = CFPrefs_GetInt64(@"com.apple.airplay", @"p2pAllow", &v7);
  int v4 = v3 == 1;
  BOOL v5 = Int64 == 1;
  if (Int64 == 1) {
    int v4 = 3;
  }
  if (v3 == 1) {
    BOOL v5 = 1;
  }
  if (v8) {
    BOOL v5 = 1;
  }
  if (v7) {
    BOOL v5 = 1;
  }
  if (v5) {
    return v4;
  }
  else {
    return 2;
  }
}

- (void)_mediaControlEnsureStarted
{
  if (!self->_mediaControlDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _mediaControlEnsureStarted]",  30LL,  "MediaControl daemon start\n");
    }

    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPMediaControlDaemon);
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = v3;

    -[RPMediaControlDaemon setMessenger:](self->_mediaControlDaemon, "setMessenger:", self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100028494;
    v9[3] = &unk_100111DA0;
    void v9[4] = self;
    -[RPMediaControlDaemon setSendInterestEventHandler:](self->_mediaControlDaemon, "setSendInterestEventHandler:", v9);
    BOOL v5 = self->_mediaControlDaemon;
    id v8 = 0LL;
    unsigned __int8 v6 = -[RPMediaControlDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    id v7 = v8;
    if ((v6 & 1) == 0
      && dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _mediaControlEnsureStarted]",  90LL,  "### MediaControl daemon start failed: %{error}\n",  v7);
    }
  }

- (void)_mediaControlEnsureStopped
{
  if (self->_mediaControlDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _mediaControlEnsureStopped]",  30LL,  "MediaControl daemon stop\n");
    }

    -[RPMediaControlDaemon invalidate](self->_mediaControlDaemon, "invalidate");
    mediaControlDaemon = self->_mediaControlDaemon;
    self->_mediaControlDaemon = 0LL;
  }

- (void)_mediaRemoteIDGet
{
  if (!self->_mediaRemoteIDGetting)
  {
    uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
    if (LocalOrigin)
    {
      self->_mediaRemoteIDGetting = 1;
      dispatchQueue = self->_dispatchQueue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100028608;
      v5[3] = &unk_100111DC8;
      v5[4] = self;
      MRMediaRemoteGetDeviceInfo(LocalOrigin, dispatchQueue, v5);
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _mediaRemoteIDGet]",  90LL,  "### MRMediaRemoteGetLocalOrigin failed\n");
    }
  }

- (void)_mediaRouteIDGet
{
  if (!self->_mediaRouteIDGetting)
  {
    self->_mediaRouteIDGetting = 1;
    id v3 = objc_alloc_init(&OBJC_CLASS___CUPairingManager);
    [v3 setDispatchQueue:self->_dispatchQueue];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000288B4;
    v4[3] = &unk_100111DF0;
    void v4[4] = v3;
    v4[5] = self;
    [v3 getPairingIdentityWithOptions:5 completion:v4];
  }

- (void)_miscEnsureStarted
{
  if (!self->_miscStarted)
  {
    uint64_t v11 = @"statusFlags";
    uint64_t v12 = &off_10011ADC0;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _miscEnsureStarted]",  30LL,  "== Registering for _launchApp request\n");
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100028CC8;
    v8[3] = &unk_100111BE8;
    void v8[4] = self;
    -[RPCompanionLinkDaemon registerRequestID:options:handler:]( self,  "registerRequestID:options:handler:",  @"_launchApp",  v3,  v8);
    if (self->_prefCommunal)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100028CD4;
      v7[3] = &unk_100111BE8;
      void v7[4] = self;
      -[RPCompanionLinkDaemon registerRequestID:options:handler:]( self,  "registerRequestID:options:handler:",  @"_speak",  v3,  v7);
    }

    id v9 = @"statusFlags";
    id v10 = &off_10011ADD8;
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100028CE0;
    v6[3] = &unk_100111E18;
    v6[4] = self;
    -[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]( self,  "_registerConnectionRequestID:options:handler:",  @"_sessionStart",  v4,  v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100028CF0;
    v5[3] = &unk_100111E18;
    v5[4] = self;
    -[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]( self,  "_registerConnectionRequestID:options:handler:",  @"_sessionStop",  v4,  v5);
    self->_miscStarted = 1;
  }

- (void)_miscEnsureStopped
{
  if (self->_miscStarted)
  {
    if (GestaltGetDeviceClass(self, a2) == 1)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      unsigned int v4 = [v3 idsHasWatch];

      if (v4) {
        -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", @"_ctxtColl");
      }
    }

    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", @"_launchApp");
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", @"_sessionStart");
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", @"_sessionStop");
    -[RPCompanionLinkDaemon deregisterRequestID:](self, "deregisterRequestID:", @"_speak");
    self->_miscStarted = 0;
  }

- (void)_miscHandleLaunchAppRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v5, @"_bundleID", TypeID, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t Int64 = CFDictionaryGetInt64(v5, @"_lbg", 0LL);
  if (v9)
  {
    BOOL v11 = Int64 != 0;
    uint64_t v12 = dispatch_queue_create("RPLaunchApp", 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100028FF8;
    block[3] = &unk_100111E68;
    BOOL v32 = v11;
    block[4] = v9;
    id v31 = v6;
    dispatch_async(v12, block);
  }

  else
  {
    CFTypeID v13 = CFStringGetTypeID();
    uint64_t v14 = CFDictionaryGetTypedValue(v5, @"_urlS", v13, 0LL);
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    if (v12 && (id v21 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v12)) != 0LL)
    {
      id v22 = v21;
      uint64_t v23 = dispatch_queue_create("RPOpenURL", 0LL);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10002926C;
      v27[3] = &unk_100111E90;
      id v28 = v22;
      id v29 = v6;
      unsigned __int8 v24 = v22;
      dispatch_async(v23, v27);
    }

    else
    {
      id v25 = RPErrorF(4294960591LL, (uint64_t)"No valid bundleID or URL to LaunchApp", v15, v16, v17, v18, v19, v20, v26);
      unsigned __int8 v24 = (NSURL *)objc_claimAutoreleasedReturnValue(v25);
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _miscHandleLaunchAppRequest:responseHandler:]",  90LL,  "### LaunchApp failed: %{error}\n",  v24);
      }

      (*((void (**)(id, void, void, NSURL *))v6 + 2))(v6, 0LL, 0LL, v24);
    }
  }
}

- (void)_miscHandleSpeakRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_speakText", TypeID, 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v10)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___CUVoiceSession);
    [v17 setDispatchQueue:self->_dispatchQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100029514;
    void v21[3] = &unk_100111EB8;
    v21[4] = v17;
    id v22 = v6;
    [v17 speakText:v10 flags:0 completion:v21];
  }

  else
  {
    id v18 = RPErrorF(4294960591LL, (uint64_t)"No text to speak", v11, v12, v13, v14, v15, v16, v20);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _miscHandleSpeakRequest:responseHandler:]",  90LL,  "### Speak failed: %{error}\n",  v19);
    }

    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v19);
  }
}

- (unint64_t)_nearbyActionDeviceActionTypes
{
  return 1210056704LL;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  if (([v8 isEqualToString:@"stereo_leader"] & 1) != 0
    || [v8 isEqualToString:@"stereo_leader_info"])
  {
    if (CFDictionaryGetInt64(v9, NSKeyValueChangeNewKey, 0LL))
    {
      BOOL v10 = 1;
    }

    else
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      uint64_t v12 = (void *)CFPrefs_CopyTypedValue(@"com.apple.soundboard", @"stereo_leader_info", TypeID, 0LL);
      BOOL v10 = CFDictionaryGetInt64(v12, @"stereo_leader", 0LL) != 0;
    }

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v13 = "no";
      if (v10) {
        uint64_t v13 = "yes";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon observeValueForKeyPath:ofObject:change:context:]",  30LL,  "SoundBoard stereo leader changed: %s\n",  v13);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100029748;
    block[3] = &unk_100111EE0;
    block[4] = self;
    BOOL v18 = v10;
    dispatch_async(dispatchQueue, block);
  }

  if (([v8 isEqualToString:@"accessControlLevel"] & 1) != 0
    || [v8 isEqualToString:@"p2pAllow"])
  {
    uint64_t v15 = (dispatch_queue_s *)self->_dispatchQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002976C;
    v16[3] = &unk_1001110A8;
    v16[4] = self;
    dispatch_async(v15, v16);
  }
}

- (void)_personalDeviceUpdate
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_10000B284;
  uint64_t v13 = sub_10000B294;
  id v14 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice idsPersonalDeviceIdentifier]( self->_localDeviceInfo,  "idsPersonalDeviceIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000298EC;
  v8[3] = &unk_1001114B0;
  void v8[4] = v3;
  void v8[5] = self;
  v8[6] = &v9;
  -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v8);
  unsigned int v4 = v10;
  id v5 = (RPConnection *)v10[5];
  if (v5 != self->_personalCnx)
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 == -1)
      {
        int v7 = _LogCategory_Initialize(&dword_100131328, 30LL);
        unsigned int v4 = v10;
        if (!v7) {
          goto LABEL_6;
        }
        id v5 = (RPConnection *)v10[5];
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v5, "peerDeviceInfo"));
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _personalDeviceUpdate]",  30LL,  "Personal device changed: %@\n",  v6);

      unsigned int v4 = v10;
    }

- (void)_reachabilityEnsureStarted
{
  if (!self->_netLinkManager)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _reachabilityEnsureStarted]", 30LL, "Reachability start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUNetLinkManager);
    netLinkManager = self->_netLinkManager;
    self->_netLinkManager = v3;

    -[CUNetLinkManager setDispatchQueue:](self->_netLinkManager, "setDispatchQueue:", self->_dispatchQueue);
    -[CUNetLinkManager setLabel:](self->_netLinkManager, "setLabel:", @"CLink");
    -[CUNetLinkManager activate](self->_netLinkManager, "activate");
  }

- (void)_reachabilityEnsureStopped
{
  if (self->_netLinkManager
    && dword_100131328 <= 30
    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _reachabilityEnsureStopped]", 30LL, "Reachability stop\n");
  }

  -[CUNetLinkManager invalidate](self->_netLinkManager, "invalidate");
  netLinkManager = self->_netLinkManager;
  self->_netLinkManager = 0LL;
}

- (void)_siriEnsureStarted
{
  if (!self->_siriDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _siriEnsureStarted]", 30LL, "Siri daemon start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPSiriDaemon);
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = v3;

    -[RPSiriDaemon setMessenger:](self->_siriDaemon, "setMessenger:", self);
    id v5 = self->_siriDaemon;
    id v8 = 0LL;
    unsigned __int8 v6 = -[RPSiriDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    id v7 = v8;
    if ((v6 & 1) == 0
      && dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _siriEnsureStarted]",  90LL,  "### Siri daemon start failed: %{error}\n",  v7);
    }
  }

- (void)_siriEnsureStopped
{
  if (self->_siriDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _siriEnsureStopped]", 30LL, "Siri daemon stop\n");
    }

    -[RPSiriDaemon invalidate](self->_siriDaemon, "invalidate");
    siriDaemon = self->_siriDaemon;
    self->_siriDaemon = 0LL;
  }

- (void)_stereoDeviceUpdate:(int)a3
{
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x3032000000LL;
  BOOL v66 = sub_10000B284;
  id v67 = sub_10000B294;
  id v68 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
  uint64_t v57 = 0LL;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  id v60 = sub_10000B284;
  id v61 = sub_10000B294;
  id v6 = v5;
  id v62 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier"));
  unsigned int v8 = -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole");
  if (v7 && v8 - 1 <= 1)
  {
    int v9 = v8 == 2;
    v55[0] = _NSConcreteStackBlock;
    if (v8 == 1) {
      int v9 = 2;
    }
    v55[1] = 3221225472LL;
    v55[2] = sub_10002A724;
    v55[3] = &unk_100111F08;
    int v56 = v9;
    v55[4] = v7;
    v55[5] = &v63;
    v55[6] = &v57;
    -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", v55);
  }

  unsigned __int8 v10 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
  id v11 = (id)v58[5];
  id v12 = v6;
  uint64_t v13 = v12;
  if (v11 == v12)
  {
    unsigned int v14 = 1;
  }

  else if ((v12 != 0LL) == (v11 == 0LL))
  {
    unsigned int v14 = 0;
  }

  else
  {
    unsigned int v14 = [v11 isEqual:v12];
  }

  unsigned int v15 = v10 & 0x80;
  BOOL v16 = v15 >> 7 != v14;
  if (v15 >> 7 != v14)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v17 = "yes";
      if (v15) {
        BOOL v18 = "yes";
      }
      else {
        BOOL v18 = "no";
      }
      if (!v14) {
        id v17 = "no";
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]",  30LL,  "MediaSystem leader changed: %s -> %s\n",  v18,  v17);
    }

    localDeviceInfo = self->_localDeviceInfo;
    if (v14) {
      unint64_t v20 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x80;
    }
    else {
      unint64_t v20 = (unint64_t)-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0xFFFFFF7F;
    }
    -[RPCompanionLinkDevice setFlags:](localDeviceInfo, "setFlags:", v20);
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
  }

  if (v7)
  {
    if (v64[5]) {
      uint64_t v21 = 4LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));

    uint64_t v21 = v22 != 0LL;
  }

  unsigned int v23 = -[RPCompanionLinkDevice mediaSystemState](self->_localDeviceInfo, "mediaSystemState");
  BOOL v24 = v21 != v23;
  if ((_DWORD)v21 != v23)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      if (v23 > 4) {
        id v25 = "?";
      }
      else {
        id v25 = off_100112468[v23];
      }
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]",  30LL,  "MediaSystemState changed: %s -> %s\n",  v25,  off_100112468[v21]);
    }

    -[RPCompanionLinkDevice setMediaSystemState:](self->_localDeviceInfo, "setMediaSystemState:", v21);
    BOOL v16 = 1;
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
  }

  unsigned int v26 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0x200;
  int soundBoardUserLeader = self->_soundBoardUserLeader;
  if (soundBoardUserLeader != v26 >> 9)
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 != -1
        || (int v30 = _LogCategory_Initialize(&dword_100131328, 30LL),
            int soundBoardUserLeader = self->_soundBoardUserLeader,
            v30))
      {
        if (v26) {
          id v28 = "yes";
        }
        else {
          id v28 = "no";
        }
        if (soundBoardUserLeader) {
          id v29 = "yes";
        }
        else {
          id v29 = "no";
        }
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]",  30LL,  "User leader changed: %s -> %s\n",  v28,  v29);
        int soundBoardUserLeader = self->_soundBoardUserLeader;
      }
    }

    id v31 = self->_localDeviceInfo;
    if (soundBoardUserLeader) {
      unint64_t v32 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x200;
    }
    else {
      unint64_t v32 = (unint64_t)-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 0xFFFFFDFF;
    }
    -[RPCompanionLinkDevice setFlags:](v31, "setFlags:", v32);
    BOOL v16 = 1;
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
  }

  uint64_t v33 = (RPConnection *)v64[5];
  stereoCnx = self->_stereoCnx;
  if (v33 != stereoCnx)
  {
    if (v33 && !stereoCnx)
    {
      if (dword_100131328 <= 30)
      {
        if (dword_100131328 == -1)
        {
          uint64_t v33 = (RPConnection *)v64[5];
        }

        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection peerDeviceInfo](v33, "peerDeviceInfo"));
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _stereoDeviceUpdate:]",  30LL,  "Stereo counterpart found: %@\n",  v35);
        goto LABEL_70;
      }

- (void)_textInputEnsureStarted
{
  if (!self->_textInputDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _textInputEnsureStarted]", 30LL, "TextInput daemon start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPTextInputDaemon);
    textInputDaemon = self->_textInputDaemon;
    self->_textInputDaemon = v3;

    -[RPTextInputDaemon setMessenger:](self->_textInputDaemon, "setMessenger:", self);
    id v5 = self->_textInputDaemon;
    id v8 = 0LL;
    unsigned __int8 v6 = -[RPTextInputDaemon activateAndReturnError:](v5, "activateAndReturnError:", &v8);
    id v7 = v8;
    if ((v6 & 1) == 0
      && dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _textInputEnsureStarted]",  90LL,  "### TextInput daemon start failed: %{error}\n",  v7);
    }
  }

- (void)_textInputEnsureStopped
{
  if (self->_textInputDaemon)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _textInputEnsureStopped]", 30LL, "TextInput daemon stop\n");
    }

    -[RPTextInputDaemon invalidate](self->_textInputDaemon, "invalidate");
    textInputDaemon = self->_textInputDaemon;
    self->_textInputDaemon = 0LL;
  }

- (id)_xpcConnections:(id)a3 withControlFlags:(unint64_t)a4
{
  id v5 = a3;
  unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "client", (void)v16));
        unint64_t v14 = (unint64_t)[v13 controlFlags] & a4;

        if (v14) {
          -[NSMutableSet addObject:](v6, "addObject:", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  return v6;
}

- (void)_homeKitEnsureStarted
{
  if (!self->_homeKitManager)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF(&dword_100131328, "-[RPCompanionLinkDaemon _homeKitEnsureStarted]", 30LL, "HomeKit monitor start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v3;

    -[CUHomeKitManager setDispatchQueue:](self->_homeKitManager, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_prefCommunal) {
      uint64_t v5 = 842LL;
    }
    else {
      uint64_t v5 = 1600LL;
    }
    -[CUHomeKitManager setFlags:](self->_homeKitManager, "setFlags:", v5);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10002AE94;
    v22[3] = &unk_1001110A8;
    v22[4] = self;
    -[CUHomeKitManager setResolvableAccessoriesChangedHandler:]( self->_homeKitManager,  "setResolvableAccessoriesChangedHandler:",  v22);
    if ((v5 & 2) != 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10002AF14;
      void v21[3] = &unk_1001110A8;
      v21[4] = self;
      -[CUHomeKitManager setSelfAccessoryMediaAccessUpdatedHandler:]( self->_homeKitManager,  "setSelfAccessoryMediaAccessUpdatedHandler:",  v21);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10002AF28;
      v20[3] = &unk_1001110A8;
      v20[4] = self;
      -[CUHomeKitManager setSelfAccessoryMediaSystemUpdatedHandler:]( self->_homeKitManager,  "setSelfAccessoryMediaSystemUpdatedHandler:",  v20);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10002AF40;
      v19[3] = &unk_1001110A8;
      v19[4] = self;
      -[CUHomeKitManager setSelfAccessoryUpdatedHandler:](self->_homeKitManager, "setSelfAccessoryUpdatedHandler:", v19);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10002AF54;
      v18[3] = &unk_1001110A8;
      v18[4] = self;
      -[CUHomeKitManager setSelfAccessorySiriAccessUpdatedHandler:]( self->_homeKitManager,  "setSelfAccessorySiriAccessUpdatedHandler:",  v18);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002AF68;
    v17[3] = &unk_100111C60;
    void v17[4] = self;
    -[CUHomeKitManager setStateChangedHandler:](self->_homeKitManager, "setStateChangedHandler:", v17);
    -[CUHomeKitManager activate](self->_homeKitManager, "activate");
  }

  if (!self->_rpHomeKitManager)
  {
    unsigned __int8 v6 = -[RPHomeKitManager initWithQueue:]( objc_alloc(&OBJC_CLASS___RPHomeKitManager),  "initWithQueue:",  self->_dispatchQueue);
    rpHomeKitManager = self->_rpHomeKitManager;
    self->_rpHomeKitManager = v6;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002B014;
    v16[3] = &unk_1001110A8;
    v16[4] = self;
    -[RPHomeKitManager setPersonalRequestsStateChangedHandler:]( self->_rpHomeKitManager,  "setPersonalRequestsStateChangedHandler:",  v16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002B01C;
    v15[3] = &unk_100111F30;
    _BYTE v15[4] = self;
    -[RPHomeKitManager setRoomUpdatedHandler:](self->_rpHomeKitManager, "setRoomUpdatedHandler:", v15);
  }

  if (!self->_homeHubEndpointManager)
  {
    id v8 = -[RPHomeHubEndpointManager initWithQueue:]( objc_alloc(&OBJC_CLASS___RPHomeHubEndpointManager),  "initWithQueue:",  self->_dispatchQueue);
    homeHubEndpointManager = self->_homeHubEndpointManager;
    self->_homeHubEndpointManager = v8;

    uint64_t v10 = self->_homeHubEndpointManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002B02C;
    v14[3] = &unk_1001110A8;
    v14[4] = self;
    -[RPHomeHubEndpointManager activateWithUpdateHandler:](v10, "activateWithUpdateHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002B080;
    v13[3] = &unk_100111F58;
    v13[4] = self;
    -[RPHomeHubEndpointManager setDeviceChangedHandler:](self->_homeHubEndpointManager, "setDeviceChangedHandler:", v13);
  }

  unsigned int v11 = -[CUHomeKitManager state](self->_homeKitManager, "state");
  if (v11 == 1) {
    -[RPCompanionLinkDaemon _homeKitGetPairingIdentities](self, "_homeKitGetPairingIdentities");
  }
  if (!self->_receiveHomeKitPairingUpdated)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_homeKitPairingUpdated:" name:@"HMAccessoryPairingIdentityUpdatedNotification" object:0];
    self->_receiveHomeKitPairingUpdated = 1;
  }

  if (v11 == 1) {
    -[RPCompanionLinkDaemon _homeKitUpdateUserIdentifiers](self, "_homeKitUpdateUserIdentifiers");
  }
}

- (void)_homeKitEnsureStopped
{
  rpHomeKitManager = self->_rpHomeKitManager;
  if (rpHomeKitManager)
  {
    -[RPHomeKitManager invalidate](rpHomeKitManager, "invalidate");
    unsigned int v4 = self->_rpHomeKitManager;
    self->_rpHomeKitManager = 0LL;
  }

  homeHubEndpointManager = self->_homeHubEndpointManager;
  if (homeHubEndpointManager)
  {
    -[RPHomeHubEndpointManager invalidate](homeHubEndpointManager, "invalidate");
    -[RPCompanionLinkDaemon _updateHomeHubDevices:](self, "_updateHomeHubDevices:", 0LL);
    unsigned __int8 v6 = self->_homeHubEndpointManager;
    self->_homeHubEndpointManager = 0LL;

    -[NSMutableDictionary removeAllObjects](self->_homeHubDevices, "removeAllObjects");
    homeHubDevices = self->_homeHubDevices;
    self->_homeHubDevices = 0LL;
  }

  homeKitManager = self->_homeKitManager;
  if (homeKitManager)
  {
    -[CUHomeKitManager invalidate](homeKitManager, "invalidate");
    id v9 = self->_homeKitManager;
    self->_homeKitManager = 0LL;
  }

  if (self->_receiveHomeKitPairingUpdated)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 removeObserver:self name:@"HMAccessoryPairingIdentityUpdatedNotification" object:0];
    self->_receiveHomeKitPairingUpdated = 0;
  }

  homeKitAuthTag = self->_homeKitAuthTag;
  self->_homeKitAuthTag = 0LL;

  homeKitIRK = self->_homeKitIRK;
  self->_homeKitIRK = 0LL;

  homeKitLTPK = self->_homeKitLTPK;
  self->_homeKitLTPK = 0LL;

  homeKitRotatingID = self->_homeKitRotatingID;
  self->_homeKitRotatingID = 0LL;
}

- (void)_homeKitPairingUpdated:(id)a3
{
  id v4 = a3;
  if (dword_100131328 <= 40 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitPairingUpdated:]",  40LL,  "Received notification that HomeKit pairing identity was updated\n");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B2D4;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_homeKitGetPairingIdentities
{
  if (!self->_homeKitGettingIdentity && (!self->_homeKitLTPK || self->_homeKitForceGetIdentity))
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitGetPairingIdentities]",  30LL,  "HomeKit identity get\n");
    }

    *(_WORD *)&self->_homeKitForceGetIdentity = 256;
    homeKitManager = self->_homeKitManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10002B3B0;
    v4[3] = &unk_100111F80;
    void v4[4] = self;
    -[CUHomeKitManager getPairingIdentityWithOptions:completion:]( homeKitManager,  "getPairingIdentityWithOptions:completion:",  34LL,  v4);
  }

- (BOOL)_homeKitAuthMatchForBonjourDevice:(id)a3
{
  id v4 = a3;
  if ((id)-[NSData length](self->_homeKitIRK, "length") == (id)16)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 txtDictionary]);
    uint64_t v14 = 0LL;
    CFDictionaryGetData(v5, @"rpHA", &v15, 6LL, &v14, 0LL);
    if (v14 == 6 && (CFDictionaryGetHardwareAddress(v5, @"rpBA", v13, 6LL, &v12), !v12))
    {
      uint64_t v7 = SipHash(-[NSData bytes](self->_homeKitIRK, "bytes"), v13, 6LL);
      LOBYTE(v10) = BYTE5(v7);
      BYTE1(v10) = BYTE4(v7);
      BYTE2(v10) = BYTE3(v7);
      HIBYTE(v10) = BYTE2(v7);
      LOBYTE(v11) = BYTE1(v7);
      HIBYTE(v11) = v7;
      BOOL v6 = v10 == v15 && v11 == v16;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_homeKitDecryptRotatingIDForBonjourDevice:(id)a3
{
  if (!self->_homeKitLTPK) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 txtDictionary]);
  CFDictionaryGetHardwareAddress(v4, @"rpBA", &v12, 6LL, &v11);
  if (v11)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v14 = 0LL;
    CFDictionaryGetData(v4, @"rpHN", &v9, 6LL, &v14, 0LL);
    uint64_t v5 = 0LL;
    if (v14 == 6)
    {
      uint64_t v14 = 0LL;
      CFDictionaryGetData(v4, @"rpHI", v8, 6LL, &v14, 0LL);
      uint64_t v5 = 0LL;
      if (v14 == 6)
      {
        CryptoHKDF( kCryptoHashDescriptor_SHA512,  -[NSData bytes](self->_homeKitLTPK, "bytes"),  -[NSData length](self->_homeKitLTPK, "length"),  "HomeKitRotatingKey-Salt",  23LL,  "HomeKitRotatingKey-Info",  23LL,  32LL,  v19);
        int v15 = v12;
        __int16 v16 = v13;
        int v17 = v9;
        __int16 v18 = v10;
        chacha20_all_96x32(v19, &v15, 0LL, v8, 6LL, v8);
        uint64_t v7 = NSPrintF("%.3H", v8, 6LL, 6LL);
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
      }
    }
  }

  return v5;
}

- (void)_homeKitGetUserInfo:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 home]);
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 currentUser]);
      if (v8)
      {
        int v9 = (void *)objc_claimAutoreleasedReturnValue([v12 accountID]);

        if (!v9)
        {
          __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 userID]);
          [v12 setAccountID:v10];

          int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
          [v12 setHomeKitUserIdentifier:v11];
        }
      }
    }
  }
}

- (void)_homeKitIdentityUpdated:(id)a3 error:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v19 publicKey]);
    if (![v7 length])
    {
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        [v7 length];
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]",  90LL,  "### No HomeKit public key (%d bytes)\n");
      }

      goto LABEL_29;
    }

    homeKitLTPK = self->_homeKitLTPK;
    int v9 = v7;
    __int16 v10 = homeKitLTPK;
    if (v9 == v10)
    {
    }

    else
    {
      int v11 = v10;
      if ((v9 == 0LL) == (v10 != 0LL))
      {

        goto LABEL_20;
      }

      unsigned int v12 = -[NSData isEqual:](v9, "isEqual:", v10);

      if (!v12)
      {
LABEL_20:
        objc_storeStrong((id *)&self->_homeKitLTPK, v7);
        __int16 v13 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
        -[RPIdentity setEdPKData:](v13, "setEdPKData:", v9);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 secretKey]);
        -[RPIdentity setEdSKData:](v13, "setEdSKData:", v14);

        int v15 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
        -[RPIdentity setIdentifier:](v13, "setIdentifier:", v16);

        -[RPCompanionLinkDaemon _homeKitGetUserInfo:](self, "_homeKitGetUserInfo:", v13);
        int v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        [v17 setHomeKitIdentity:v13];

        self->_prefHomeKitConfigured = 1;
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]",  30LL,  "HomeKit identity updated: %{mask}\n",  v9);
        }

        -[RPCompanionLinkDaemon _forEachConnectionWithHandler:](self, "_forEachConnectionWithHandler:", &stru_100111FA0);
        id v18 = -[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 1LL);
        -[RPCompanionLinkDaemon _homeKitUpdateInfo:](self, "_homeKitUpdateInfo:", 1LL);
        -[RPCompanionLinkDaemon _clientBonjourReevaluateAllDevices](self, "_clientBonjourReevaluateAllDevices");
        -[RPCompanionLinkDaemon _update](self, "_update");

LABEL_29:
        goto LABEL_30;
      }
    }

    if (dword_100131328 <= 10
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 10LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]",  10LL,  "HomeKit identity unchanged\n");
    }

    goto LABEL_29;
  }

  if (dword_100131328 <= 60 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 60LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitIdentityUpdated:error:]",  60LL,  "### Get HomeKit identity failed: %{error}\n",  v6);
  }
LABEL_30:
}

- (void)_homeKitSelfAccessoryMediaAccessUpdated
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice password](self->_localDeviceInfo, "password"));
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[CUHomeKitManager selfAccessoryMediaAccessPassword]( self->_homeKitManager,  "selfAccessoryMediaAccessPassword"));
  id v5 = v3;
  id v14 = v5;
  if (v4 == v5)
  {

    goto LABEL_6;
  }

  if ((v5 != 0LL) == (v4 == 0LL))
  {

    goto LABEL_8;
  }

  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) != 0)
  {
LABEL_6:
    int v7 = 0;
    goto LABEL_19;
  }

- (void)_homeKitSelfAccessoryMediaSystemUpdated:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);

  id v8 = v7;
  id v9 = v5;
  id v10 = v9;
  BOOL v11 = v8 != v9;
  if (v8 == v9)
  {

    uint64_t v13 = v10;
  }

  else
  {
    if ((v9 != 0LL) != (v8 == 0LL))
    {
      unsigned __int8 v12 = [v8 isEqual:v9];

      if ((v12 & 1) != 0)
      {
        BOOL v11 = 0;
        goto LABEL_13;
      }
    }

    else
    {
    }

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]",  30LL,  "HomeKit SelfAccessory MediaSystem identifier changed: %@ -> %@\n",  v10,  v8);
    }

    -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_localDeviceInfo, "setMediaSystemIdentifier:", v8);
    -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    CFPrefs_SetValue(@"com.apple.airplay", @"tightSyncUUID", v13);
  }

LABEL_13:
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice mediaSystemIdentifierEffective]( self->_localDeviceInfo,  "mediaSystemIdentifierEffective"));

  if (self->_stereoCnx) {
    int v15 = v8;
  }
  else {
    int v15 = 0LL;
  }
  id v16 = v15;

  id v17 = v16;
  id v18 = v14;
  id v19 = v18;
  if (v17 == v18)
  {

    int v21 = v11;
    goto LABEL_27;
  }

  if ((v18 != 0LL) != (v17 == 0LL))
  {
    unsigned __int8 v20 = [v17 isEqual:v18];

    int v21 = v11;
    if ((v20 & 1) != 0) {
      goto LABEL_27;
    }
  }

  else
  {
  }

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]",  30LL,  "Effective MediaSystem identifier changed: %@ -> %@\n",  v19,  v17);
  }
  -[RPCompanionLinkDevice setMediaSystemIdentifierEffective:]( self->_localDeviceInfo,  "setMediaSystemIdentifierEffective:",  v17);
  int v21 = 1;
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
LABEL_27:
  uint64_t v59 = v19;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaSystemName](self->_localDeviceInfo, "mediaSystemName"));
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessoryMediaSystem](self->_homeKitManager, "selfAccessoryMediaSystem"));
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);

  id v25 = v24;
  id v26 = v22;
  __int128 v27 = v26;
  if (v25 == v26)
  {
  }

  else
  {
    if ((v26 != 0LL) == (v25 == 0LL))
    {

      goto LABEL_40;
    }

    unsigned __int8 v28 = [v25 isEqual:v26];

    if ((v28 & 1) == 0)
    {
LABEL_40:
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]",  30LL,  "HomeKit SelfAccessory MediaSystem name changed: '%@' -> '%@'\n",  v27,  v25);
      }

      -[RPCompanionLinkDevice setMediaSystemName:](self->_localDeviceInfo, "setMediaSystemName:", v25);
      int v21 = 1;
      -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
      goto LABEL_45;
    }
  }

  if (![v25 length] && !self->_fixedSoundBoardNameIssue && self->_soundBoardPrefs)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    int v30 = (void *)CFPrefs_CopyTypedValue(@"com.apple.airplay", @"name", TypeID, 0LL);
    if ([v30 length])
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryMediaSystemUpdated:]",  30LL,  "Clearing stale AirPlay name (was '%@')\n",  v30);
      }

      CFPrefs_RemoveValue(@"com.apple.airplay", @"name");
      BOOL v11 = 1;
      self->_fixedSoundBoardNameIssue = 1;
    }
  }

- (void)_homeKitSelfAccessoryUpdated
{
  id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]",  30LL,  "HomeKit SelfAccessory updated\n");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice roomName](self->_localDeviceInfo, "roomName"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 room]);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

    id v7 = v6;
    id v8 = v4;
    id v9 = v8;
    if (v7 == v8)
    {
    }

    else
    {
      if ((v8 != 0LL) == (v7 == 0LL))
      {

        goto LABEL_16;
      }

      unsigned __int8 v10 = [v7 isEqual:v8];

      if ((v10 & 1) == 0)
      {
LABEL_16:
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]",  30LL,  "HomeKit SelfAccessory room changed: %@ -> %@\n",  v9,  v7);
        }

        -[RPCompanionLinkDevice setRoomName:](self->_localDeviceInfo, "setRoomName:", v7);
        -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
        if (v7)
        {
          [v26 setObject:v7 forKeyedSubscript:@"_roomName"];
        }

        else
        {
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          [v26 setObject:v12 forKeyedSubscript:@"_roomName"];
        }

        int v11 = 1;
LABEL_26:
        int v13 = -[RPCompanionLinkDevice personalRequestsState]( self->_localDeviceInfo,  "personalRequestsState");
        unsigned int v14 = -[CUHomeKitManager selfAccessorySiriEnabled]( self->_homeKitManager,  "selfAccessorySiriEnabled");
        if (v14) {
          uint64_t v15 = 6LL;
        }
        else {
          uint64_t v15 = 5LL;
        }
        if ((_DWORD)v15 == v13)
        {
          if (!v11) {
            goto LABEL_45;
          }
        }

        else
        {
          if (dword_100131328 <= 30)
          {
            unsigned int v16 = v14;
            if (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))
            {
              if (v13 >= 8)
              {
                id v17 = "?";
                if (v13 > 9) {
                  id v17 = "User";
                }
              }

              else
              {
                id v17 = off_1001124D8[v13];
              }

              id v18 = "No";
              if (v16) {
                id v18 = "Yes";
              }
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]",  30LL,  "HomeKit SelfAccessory Personal Requests changed: %s -> %s\n",  v17,  v18);
            }
          }

          -[RPCompanionLinkDevice setPersonalRequestsState:](self->_localDeviceInfo, "setPersonalRequestsState:", v15);
          -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 1LL);
        }

        -[RPCompanionLinkDaemon _update](self, "_update");
LABEL_45:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CUHomeKitManager selfAccessory](self->_homeKitManager, "selfAccessory"));
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 home]);
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentUser]);

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager currentUser](self->_rpHomeKitManager, "currentUser"));
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueIdentifier]);
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
        unsigned __int8 v25 = [v23 isEqual:v24];

        if ((v25 & 1) == 0)
        {
          -[RPHomeKitManager setCurrentUser:](self->_rpHomeKitManager, "setCurrentUser:", 0LL);
          -[RPCompanionLinkDaemon _updatePersonalRequestsStateForHomeHubDevices]( self,  "_updatePersonalRequestsStateForHomeHubDevices");
        }

        if ([v26 count]) {
          -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_systemInfoUpdate",  v26,  @"rapport:rdid:SameHome",  0LL,  0LL);
        }

        goto LABEL_50;
      }
    }

    int v11 = 0;
    goto LABEL_26;
  }

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitSelfAccessoryUpdated]",  30LL,  "HomeKit SelfAccessory update with no accessory\n");
  }
LABEL_50:
}

- (void)_homeKitUpdateInfo:(BOOL)a3
{
  if (a3)
  {
    homeKitAuthTag = self->_homeKitAuthTag;
    self->_homeKitAuthTag = 0LL;

    homeKitIRK = self->_homeKitIRK;
    self->_homeKitIRK = 0LL;

    homeKitRotatingID = self->_homeKitRotatingID;
    self->_homeKitRotatingID = 0LL;
  }

  if (!self->_homeKitIRK)
  {
    homeKitLTPK = self->_homeKitLTPK;
    if (homeKitLTPK)
    {
      CryptoHKDF( kCryptoHashDescriptor_SHA512,  -[NSData bytes](homeKitLTPK, "bytes"),  -[NSData length](self->_homeKitLTPK, "length"),  "HomeKitIRK-Salt",  15LL,  "HomeKitIRK-Info",  15LL,  16LL,  v25);
      int v11 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v25, 16LL);
      unsigned __int8 v12 = self->_homeKitIRK;
      self->_homeKitIRK = v11;

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]",  30LL,  "HomeKit IRK updated: <%.4@>\n",  self->_homeKitIRK);
      }
    }
  }

  if (!self->_homeKitAuthTag && (id)-[NSData length](self->_homeKitIRK, "length") == (id)16)
  {
    if (self->_btAdvAddrData)
    {
      uint64_t v7 = SipHash( -[NSData bytes](self->_homeKitIRK, "bytes"),  -[NSData bytes](self->_btAdvAddrData, "bytes"),  -[NSData length](self->_btAdvAddrData, "length"));
      v25[0] = BYTE5(v7);
      v25[1] = BYTE4(v7);
      v25[2] = BYTE3(v7);
      v25[3] = BYTE2(v7);
      void v25[4] = BYTE1(v7);
      void v25[5] = v7;
      id v8 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v25, 6LL);
      id v9 = self->_homeKitAuthTag;
      self->_homeKitAuthTag = v8;

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]",  30LL,  "HomeKit AuthTag updated: <%@>\n",  self->_homeKitAuthTag);
      }
    }
  }

  if (!self->_homeKitRotatingID)
  {
    if (self->_btAdvAddrData)
    {
      int v13 = self->_homeKitLTPK;
      if (v13)
      {
        if (self->_uniqueIDData)
        {
          unsigned int v14 = (void *)kCryptoHashDescriptor_SHA512;
          CryptoHKDF( kCryptoHashDescriptor_SHA512,  -[NSData bytes](v13, "bytes"),  -[NSData length](self->_homeKitLTPK, "length"),  "HomeKitRotatingKey-Salt",  23LL,  "HomeKitRotatingKey-Info",  23LL,  32LL,  v25);
          NSUInteger v15 = -[NSData length](self->_btAdvAddrData, "length");
          btAdvAddrData = self->_btAdvAddrData;
          if (v15 == 6)
          {
            __memcpy_chk( v23,  -[NSData bytes](btAdvAddrData, "bytes"),  -[NSData length](self->_btAdvAddrData, "length"),  12LL);
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _discoveryNonceOrRotate:](self, "_discoveryNonceOrRotate:", 0LL));
            if ([v14 length] == (id)6)
            {
              id v17 = v14;
              __memcpy_chk(v24, [v17 bytes], objc_msgSend(v17, "length"), 6);
              NSUInteger v18 = -[NSData length](self->_uniqueIDData, "length");
              uniqueIDData = self->_uniqueIDData;
              if (v18 == 6)
              {
                chacha20_all_96x32( v25,  v23,  0LL,  -[NSData bytes](uniqueIDData, "bytes"),  -[NSData length](self->_uniqueIDData, "length"),  v22);
                unsigned __int8 v20 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v22,  6LL);
                int v21 = self->_homeKitRotatingID;
                self->_homeKitRotatingID = v20;

                if (dword_100131328 <= 30
                  && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
                {
                  LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeKitUpdateInfo:]",  30LL,  "HomeKit rotating ID updated: <%@>\n",  self->_homeKitRotatingID);
                }

                return;
              }

- (void)_homeKitUpdateUserIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeKitManager homeKitUserIdentifiers](self->_rpHomeKitManager, "homeKitUserIdentifiers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers"));
  id v5 = [v4 count];
  id v6 = [v3 count];

  if (v5 == v6)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        int v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11);
          int v13 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice homeKitUserIdentifiers]( self->_localDeviceInfo,  "homeKitUserIdentifiers",  (void)v14));
          LODWORD(v12) = [v13 containsObject:v12];

          if (!(_DWORD)v12)
          {

            goto LABEL_12;
          }

          int v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
LABEL_12:
    -[RPCompanionLinkDevice setHomeKitUserIdentifiers:](self->_localDeviceInfo, "setHomeKitUserIdentifiers:", 0LL);
    -[RPCompanionLinkDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
  }
}

- (id)_filterHomeKitUserIdentifiers:(id)a3
{
  return -[RPHomeKitManager filterHomeKitUserIdentifiers:](self->_rpHomeKitManager, "filterHomeKitUserIdentifiers:", a3);
}

- (id)_eventForHomeHubDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

    if (v6) {
      [v5 setObject:v4 forKeyedSubscript:@"_i"];
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 homeKitIdentifier]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 homeKitIdentifier]);
      [v5 setObject:v8 forKeyedSubscript:@"_hkID"];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRouteIdentifier]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRouteIdentifier]);
      [v5 setObject:v10 forKeyedSubscript:@"_mRtID"];
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 siriInfo]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 siriInfo]);
      [v5 setObject:v12 forKeyedSubscript:@"_siriInfo"];
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 roomName]);

    if (v13)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 roomName]);
      [v5 setObject:v14 forKeyedSubscript:@"_roomName"];
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _eventForHomeHubDevice:]",  30LL,  "Skip notifying about proxy device with no identifier (%@)",  v3);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (void)_homeHubDeviceAdded:(id)a3
{
  id v4 = a3;
  homeHubDevices = self->_homeHubDevices;
  id v27 = v4;
  if (!homeHubDevices)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = self->_homeHubDevices;
    self->_homeHubDevices = v6;

    id v4 = v27;
    homeHubDevices = self->_homeHubDevices;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      uint64_t v12 = CUDescriptionWithLevel(v27, 20LL);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeHubDeviceAdded:]",  40LL,  "HomeHub device added %@\n",  v13);
    }

    objc_msgSend( v27,  "setPersonalDeviceState:",  -[RPCompanionLinkDevice personalDeviceState](self->_localDeviceInfo, "personalDeviceState"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDevice idsPersonalDeviceIdentifier]( self->_localDeviceInfo,  "idsPersonalDeviceIdentifier"));
    [v27 setIdsPersonalDeviceIdentifier:v14];

    rpHomeKitManager = self->_rpHomeKitManager;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v27 homeKitIdentifier]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( -[RPHomeKitManager homeHubDeviceWithIdentifier:]( rpHomeKitManager,  "homeHubDeviceWithIdentifier:",  v16));

    __int128 v17 = self->_rpHomeKitManager;
    NSUInteger v18 = (void *)objc_claimAutoreleasedReturnValue([v27 homeKitIdentifier]);
    LODWORD(v17) = -[RPHomeKitManager personalRequestsStateForAccessory:]( v17,  "personalRequestsStateForAccessory:",  v18);

    if ((_DWORD)v17) {
      uint64_t v19 = 6LL;
    }
    else {
      uint64_t v19 = 5LL;
    }
    [v27 setPersonalRequestsState:v19];
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 room]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
    [v27 setRoomName:v21];

    id v22 = self->_homeHubDevices;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v27, v23);

    -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v27);
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v27));
    if (v24)
    {
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v25 addObject:v24];
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v25,  @"_proxyDevs",  0LL));
      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_proxyAdd",  v26,  @"rapport:rdid:SameHome",  0LL,  &stru_100111FC0);
    }

    goto LABEL_19;
  }

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    uint64_t v10 = CUDescriptionWithLevel(v9, 20LL);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeHubDeviceAdded:]",  30LL,  "Ignoring device added (%@) as it already exists: %@\n",  v27,  v11);
LABEL_19:
  }
}

- (void)_homeHubDeviceRemoved:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "setStatusFlags:", (unint64_t)objc_msgSend(v11, "statusFlags") & 0xFFFFFFFFEFFFFFFFLL);
  [v11 setSiriInfo:0];
  -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v11);
  homeHubDevices = self->_homeHubDevices;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](homeHubDevices, "setObject:forKeyedSubscript:", 0LL, v5);

  if (dword_100131328 <= 40 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
  {
    uint64_t v6 = CUDescriptionWithLevel(v11, 20LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _homeHubDeviceRemoved:]",  40LL,  "HomeHub device removed %@\n",  v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v11));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v9 addObject:v8];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  @"_proxyDevs",  0LL));
    -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_proxyRemove",  v10,  @"rapport:rdid:SameHome",  0LL,  &stru_100111FE0);
  }
}

- (void)_updateHomeHubDevices:(id)a3
{
  id v4 = a3;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        homeHubDevices = self->_homeHubDevices;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v11));

        if (!v12) {
          -[RPCompanionLinkDaemon _homeHubDeviceAdded:](self, "_homeHubDeviceAdded:", v9);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v6);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  id v14 = [v13 copy];

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    int v30 = self;
    do
    {
      NSUInteger v18 = 0LL;
      id v31 = v16;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v18);
        if ((objc_msgSend(v19, "statusFlags", v29) & 0x20000000) != 0)
        {
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v20 = v4;
          id v21 = v4;
          id v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v34;
            while (2)
            {
              for (j = 0LL; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v34 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
                unsigned __int8 v28 = [v26 isEqual:v27];

                if ((v28 & 1) != 0)
                {

                  id v4 = v20;
                  self = v30;
                  goto LABEL_26;
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          self = v30;
          -[RPCompanionLinkDaemon _homeHubDeviceRemoved:](v30, "_homeHubDeviceRemoved:", v19);
          id v4 = v20;
LABEL_26:
          uint64_t v17 = v29;
          id v16 = v31;
        }

        NSUInteger v18 = (char *)v18 + 1;
      }

      while (v18 != v16);
      id v16 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }

    while (v16);
  }

  -[RPCompanionLinkDaemon _update](self, "_update");
}

- (void)_updateRoomInfoForHomeHubDevice:(id)a3 roomName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  id v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if (([v12 statusFlags] & 0x20000000) != 0)
        {
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          unsigned int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            id v26 = v7;
            id v27 = v6;
            [v12 setRoomName:v7];
            [v12 setChanged:1];
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            id v15 = self->_xpcConnections;
            id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v30;
              do
              {
                for (j = 0LL; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v30 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
                  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 client]);

                  if (v21)
                  {
                    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 launchInstanceID]);
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 launchInstanceID]);
                    unsigned int v24 = [v22 isEqual:v23];

                    if (v24) {
                      -[RPCompanionLinkDaemon _proxyLocalDeviceUpdateOnConnection:launchInstanceID:]( self,  "_proxyLocalDeviceUpdateOnConnection:launchInstanceID:",  v20,  v22);
                    }
                  }
                }

                id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
              }

              while (v17);
            }

            unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v12));
            -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_proxyUpdate",  v25,  @"rapport:rdid:SameHome",  0LL,  0LL);

            id v7 = v26;
            id v6 = v27;
            goto LABEL_23;
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)_updatePersonalRequestsStateForHomeHubDevices
{
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v27 = *(void *)v34;
    unsigned __int8 v25 = v3;
    do
    {
      id v6 = 0LL;
      id v26 = v5;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v6);
        if (([v7 statusFlags] & 0x20000000) != 0)
        {
          int v8 = [v7 personalRequestsState];
          unsigned __int8 v28 = v6;
          rpHomeKitManager = self->_rpHomeKitManager;
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 homeKitIdentifier]);
          unsigned int v11 = -[RPHomeKitManager personalRequestsStateForAccessory:]( rpHomeKitManager,  "personalRequestsStateForAccessory:",  v10);

          uint64_t v12 = v11 ? 6LL : 5LL;
          if (v8 != (_DWORD)v12)
          {
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              if (v8 >= 8)
              {
                int v13 = "?";
                if (v8 > 9) {
                  int v13 = "User";
                }
              }

              else
              {
                int v13 = off_1001124D8[v8];
              }

              unsigned int v14 = "No";
              if (v11) {
                unsigned int v14 = "Yes";
              }
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _updatePersonalRequestsStateForHomeHubDevices]",  30LL,  "Peronal requests state updated on HomeHub device %@: %s -> %s\n",  v7,  v13,  v14);
            }

            [v7 setPersonalRequestsState:v12];
            [v7 setChanged:1];
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            id v15 = self->_xpcConnections;
            id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v30;
              do
              {
                for (i = 0LL; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v30 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
                  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 client]);

                  if (v21)
                  {
                    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 launchInstanceID]);
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 launchInstanceID]);
                    unsigned int v24 = [v22 isEqual:v23];

                    if (v24) {
                      -[RPCompanionLinkDaemon _proxyLocalDeviceUpdateOnConnection:launchInstanceID:]( self,  "_proxyLocalDeviceUpdateOnConnection:launchInstanceID:",  v20,  v22);
                    }
                  }
                }

                id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
              }

              while (v17);
            }

            id v3 = v25;
            id v5 = v26;
            id v6 = v28;
          }
        }

        id v6 = (char *)v6 + 1;
      }

      while (v6 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v5);
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredEvents,  "objectForKeyedSubscript:",  v15));

  if (v10)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon registerEventID:options:handler:]",  90LL,  "### RegisterEventID daemon duplicate '%@'\n",  v15);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon registerEventID:options:handler:]",  30LL,  "RegisterEventID daemon '%@'\n",  v15);
    }

    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___RPEventRegistration);
    -[RPEventRegistration setEventID:](v11, "setEventID:", v15);
    -[RPEventRegistration setOptions:](v11, "setOptions:", v8);
    -[RPEventRegistration setHandler:](v11, "setHandler:", v9);
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      unsigned int v14 = self->_registeredEvents;
      self->_registeredEvents = v13;

      registeredEvents = self->_registeredEvents;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v11, v15);
  }
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100131328 <= 30)
  {
    if (dword_100131328 != -1 || (v5 = _LogCategory_Initialize(&dword_100131328, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon deregisterEventID:]",  30LL,  "DeregisterEventID daemon '%@'\n",  v4);
      id v4 = v6;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0LL, v4);
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v35 = a6;
  id v30 = a7;
  __int128 v36 = v12;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _checkForProxyOrLocalDestinations:eventID:event:options:completion:]( self,  "_checkForProxyOrLocalDestinations:eventID:event:options:completion:",  v13,  v12,  a4,  v35));
  if (v31)
  {
    if ([v13 isEqualToString:@"rapport:rdid:SameHome"])
    {
      if ([v12 isEqualToString:@"_proxyUpdate"])
      {
        -[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]( self,  "_existingProxyDeviceUpdated:event:isLocal:",  v12,  v31,  1LL);
      }

      else if ([v12 isEqualToString:@"_systemInfoUpdate"])
      {
        -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  self->_localDeviceInfo,  2LL);
      }
    }

    unsigned int xidLast = self->_xidLast;
    if (xidLast + 1 > 1) {
      unsigned int v15 = xidLast + 1;
    }
    else {
      unsigned int v15 = 1;
    }
    self->_unsigned int xidLast = v15;
    unsigned int v32 = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10011ADF0,  @"_t",  v12,  @"_i",  v31,  @"_c",  v16,  @"_x",  0LL));

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"chatty"]);
    unsigned int v18 = [v17 BOOLValue];

    if (v18) {
      [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_cht"];
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"inUseProcess"]);

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"inUseProcess"]);
      [v34 setObject:v20 forKeyedSubscript:@"_inUseProc"];
    }

    v62[0] = 0LL;
    v62[1] = v62;
    v62[2] = 0x3032000000LL;
    v62[3] = sub_10000B284;
    v62[4] = sub_10000B294;
    id v63 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v59 = &v58;
    uint64_t v60 = 0x2020000000LL;
    int v61 = 0;
    group = dispatch_group_create();
    if ([v13 isEqual:@"rapport:rdid:InterestedPeers"])
    {
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interestEvents,  "objectForKeyedSubscript:",  v12));
      id v22 = [v21 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v55;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v55 != v23) {
              objc_enumerationMutation(v21);
            }
            uint64_t v25 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472LL;
            v47[2] = sub_10002E8A4;
            v47[3] = &unk_100112030;
            void v47[4] = group;
            id v48 = v34;
            __int128 v51 = v62;
            id v49 = v36;
            unsigned int v53 = v32;
            id v50 = v35;
            __int128 v52 = &v58;
            -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:]( self,  "_forEachMatchingDestinationID:handler:",  v25,  v47);
          }

          id v22 = [v21 countByEnumeratingWithState:&v54 objects:v64 count:16];
        }

        while (v22);
      }
    }

    else
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10002EA0C;
      v40[3] = &unk_100112030;
      v40[4] = group;
      id v41 = v34;
      __int128 v44 = v62;
      id v42 = v12;
      unsigned int v46 = v32;
      id v43 = v35;
      id v45 = &v58;
      -[RPCompanionLinkDaemon _forEachUniqueMatchingDestinationID:handler:]( self,  "_forEachUniqueMatchingDestinationID:handler:",  v13,  v40);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002EB74;
    block[3] = &unk_100112058;
    id v38 = v30;
    __int128 v39 = v62;
    dispatch_group_notify(group, dispatchQueue, block);
    if (*((_DWORD *)v59 + 6)) {
      goto LABEL_35;
    }
    id v27 = v36;
    if (([v27 isEqual:@"HIDRelay"] & 1) != 0
      || ([v27 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
      || ([v27 isEqual:@"_hidT"] & 1) != 0
      || ([v27 isEqual:@"_laData"] & 1) != 0)
    {
    }

    else
    {
      unsigned int v29 = [v27 isEqual:@"_siA"];

      if (!v29)
      {
        uint64_t v28 = 30LL;
        goto LABEL_31;
      }
    }

    uint64_t v28 = 10LL;
LABEL_31:
    if ((int)v28 >= dword_100131328
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, v28)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]",  v28,  "SendEventID '%@' to %@ not found\n",  v27,  v13);
    }

- (void)_receivedEventID:(id)a3 onXPCCnx:(id)a4 event:(id)a5 options:(id)a6 unauth:(BOOL)a7 rpCnx:(id)a8
{
  BOOL v9 = a7;
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v14 registeredEvents]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v22]);
  if (v19)
  {
    id v20 = (void *)v19;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 registeredEvents]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"*"]);

    if (!v20) {
      goto LABEL_7;
    }
  }

  if (!v9
    || -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:]( self,  "_allowMessageForRegistrationOptions:cnx:",  v20,  v17))
  {
    [v14 receivedEventID:v22 event:v15 options:v16];
  }

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7
{
  BOOL v8 = a6;
  id v15 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (((unint64_t)[v14 statusFlags] & 0x10000AE000) != 0
    && [v15 isEqual:@"_interest"])
  {
    -[RPCompanionLinkDaemon _interestReceived:cnx:](self, "_interestReceived:cnx:", v12, v14);
    goto LABEL_12;
  }

  if (([v15 isEqual:@"_proxyAdd"] & 1) != 0
    || [v15 isEqual:@"_proxyRemove"])
  {
    if (!v8)
    {
      -[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]( self,  "_proxyDeviceListUpdated:content:options:cnx:",  v15,  v12,  v13,  v14);
      goto LABEL_12;
    }

    goto LABEL_7;
  }

  if ([v15 isEqual:@"_proxyUpdate"])
  {
    if (!v8)
    {
      -[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]( self,  "_existingProxyDeviceUpdated:event:isLocal:",  v15,  v12,  0LL);
      goto LABEL_12;
    }

- (void)_deliverEventID:(id)a3 event:(id)a4 options:(id)a5 unauth:(BOOL)a6 cnx:(id)a7 outError:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v55 = a4;
  id v54 = a5;
  __int128 v52 = v14;
  id v53 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredEvents,  "objectForKeyedSubscript:",  v14));
  id v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v15 handler]);
  if (v16)
  {
    if (!v10
      || (uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 options])) != 0
      && (unsigned int v18 = (void *)v17,
          unsigned int v19 = -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:]( self,  "_allowMessageForRegistrationOptions:cnx:",  v17,  v53),  v18,  v19))
    {
      ((void (**)(void, id, id))v16)[2](v16, v55, v54);
    }
  }

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v55, @"proxyID", TypeID, 0LL);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(TypedValue);
  unsigned int v29 = (void *)v22;
  if (v22) {
    BOOL v30 = !v10;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30)
  {
    if (!a8) {
      goto LABEL_27;
    }
    id v48 = RPErrorF( 4294960542LL,  (uint64_t)"EventID '%@' for proxy device on unauthenticated connection is not allowed",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v52);
    goto LABEL_34;
  }

  if (!v22)
  {
    id v49 = 0LL;
    id v50 = v16;
    __int128 v51 = v15;
    __int128 v39 = 0LL;
    goto LABEL_15;
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homeHubDevices,  "objectForKeyedSubscript:",  v22));
  if (v31)
  {
    id v38 = v31;
    id v49 = v29;
    id v50 = v16;
    __int128 v51 = v15;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v31 launchInstanceID]);

LABEL_15:
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v40 = self->_xpcConnections;
    id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v56,  v60,  16LL);
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v57;
      do
      {
        for (i = 0LL; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          id v45 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue([v45 launchInstanceID]);
          __int128 v47 = v46;
          if ((v39 != 0) == (v46 != 0) && (!v39 || [v46 isEqual:v39])) {
            -[RPCompanionLinkDaemon _receivedEventID:onXPCCnx:event:options:unauth:rpCnx:]( self,  "_receivedEventID:onXPCCnx:event:options:unauth:rpCnx:",  v52,  v45,  v55,  v54,  v10,  v53);
          }
        }

        id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v56,  v60,  16LL);
      }

      while (v42);
    }

    id v16 = v50;
    id v15 = v51;
    unsigned int v29 = v49;
    goto LABEL_27;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:]",  90LL,  "### Ignoring event ID '%@', proxy device with identifier %@ is not found",  v29,  v52);
  }
  if (a8)
  {
    id v48 = RPErrorF(4294960569LL, (uint64_t)"Proxy device %@ is not found", v32, v33, v34, v35, v36, v37, (uint64_t)v29);
LABEL_34:
    *a8 = (id)objc_claimAutoreleasedReturnValue(v48);
  }

- (void)_registerConnectionRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v15));

  if (v10)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]",  90LL,  "### RegisterRequestID daemon duplicate '%@'\n",  v15);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _registerConnectionRequestID:options:handler:]",  30LL,  "RegisterRequestID daemon '%@'\n",  v15);
    }

    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v11, "setRequestID:", v15);
    -[RPRequestRegistration setOptions:](v11, "setOptions:", v8);
    -[RPRequestRegistration setCnxHandler:](v11, "setCnxHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v15);
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v15));

  if (v10)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon registerRequestID:options:handler:]",  90LL,  "### RegisterRequestID daemon duplicate '%@'\n",  v15);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon registerRequestID:options:handler:]",  30LL,  "RegisterRequestID daemon '%@'\n",  v15);
    }

    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v11, "setRequestID:", v15);
    -[RPRequestRegistration setOptions:](v11, "setOptions:", v8);
    -[RPRequestRegistration setHandler:](v11, "setHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v11, v15);
  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100131328 <= 30)
  {
    if (dword_100131328 != -1 || (v5 = _LogCategory_Initialize(&dword_100131328, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon deregisterRequestID:]",  30LL,  "DeregisterRequestID daemon '%@'\n",  v4);
      id v4 = v6;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredRequests,  "setObject:forKeyedSubscript:",  0LL,  v4);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 xpcID:(unsigned int)a6 options:(id)a7 responseHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _addProxyIdentifier:toDictionary:]( self,  "_addProxyIdentifier:toDictionary:",  v15,  a4));
  unsigned int v19 = (RPCompanionLinkDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homeHubDevices,  "objectForKeyedSubscript:",  v15));
  id v20 = v19;
  if (v19 && (-[RPCompanionLinkDevice statusFlags](v19, "statusFlags") & 0x20000000) != 0)
  {
    uint64_t v24 = self;
    localDeviceInfo = v20;
    goto LABEL_9;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_localDeviceInfo, "effectiveIdentifier"));
  unsigned int v22 = [v15 isEqual:v21];

  if (v22)
  {
    localDeviceInfo = self->_localDeviceInfo;
    uint64_t v24 = self;
LABEL_9:
    -[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]( v24,  "_proxyDevice:loopbackRequestID:request:options:responseHandler:",  localDeviceInfo,  v14,  v18,  v16,  v17);
    goto LABEL_10;
  }

  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10002F814;
  v34[3] = &unk_100112080;
  __int128 v39 = &v41;
  id v35 = v14;
  id v36 = v18;
  unsigned int v40 = a6;
  id v37 = v16;
  id v25 = v17;
  id v38 = v25;
  -[RPCompanionLinkDaemon _forEachMatchingDestinationID:handler:]( self,  "_forEachMatchingDestinationID:handler:",  v15,  v34);

  if (!*((_BYTE *)v42 + 24))
  {
    id v32 = RPErrorF(4294960569LL, (uint64_t)"'%@' not found", v26, v27, v28, v29, v30, v31, (uint64_t)v15);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    (*((void (**)(id, void, void, void *))v25 + 2))(v25, 0LL, 0LL, v33);
  }

  _Block_object_dispose(&v41, 8);
LABEL_10:
}

- (BOOL)_receivedRequestID:(id)a3 onXPCCnx:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 unauth:(BOOL)a8 rpCnx:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ((([v15 isEqualToString:@"_streamStart"] & 1) != 0
     || [v15 isEqualToString:@"_streamStop"])
    && !-[RPCompanionLinkDaemon _allowStreamRequest:xpcCnx:rpCnx:]( self,  "_allowStreamRequest:xpcCnx:rpCnx:",  v17,  v16,  v20))
  {
    BOOL v23 = 0;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 registeredRequests]);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v15]);

    if (v22
      && (!v9
       || -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:]( self,  "_allowMessageForRegistrationOptions:cnx:",  v22,  v20)))
    {
      [v16 receivedRequestID:v15 request:v17 options:v18 responseHandler:v19];
      BOOL v23 = 1;
    }

    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 unauth:(BOOL)a7 cnx:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v56 = a5;
  id v16 = a6;
  id v57 = a8;
  id v55 = v14;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredRequests,  "objectForKeyedSubscript:",  v14));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 handler]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 cnxHandler]);
  if (v18 | v19
    && (!v9
     || (uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 options])) != 0
     && (id v21 = (void *)v20,
         unsigned int v22 = -[RPCompanionLinkDaemon _allowMessageForRegistrationOptions:cnx:]( self,  "_allowMessageForRegistrationOptions:cnx:",  v20,  v57),  v21,  v22)))
  {
    if (v19) {
      (*(void (**)(uint64_t, id, id, id, id))(v19 + 16))(v19, v57, v15, v56, v16);
    }
    else {
      (*(void (**)(uint64_t, id, id, id))(v18 + 16))(v18, v15, v56, v16);
    }
  }

  else
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v15, @"proxyID", TypeID, 0LL);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(TypedValue);
    uint64_t v26 = (void *)v25;
    if (v25) {
      BOOL v27 = !v9;
    }
    else {
      BOOL v27 = 1;
    }
    if (v27)
    {
      if (v25)
      {
        if (!-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:]( self,  "_proxyDevice:receivedRequestID:request:options:responseHandler:cnx:",  v25,  v55,  v15,  v56,  v16,  v57))
        {
          id v34 = RPErrorF(4294960582LL, (uint64_t)"No request handler", v28, v29, v30, v31, v32, v33, v51);
          id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0LL, 0LL, v35);
        }
      }

      else
      {
        uint64_t v52 = v19;
        uint64_t v53 = v18;
        id v54 = v17;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v36 = self->_xpcConnections;
        id v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v58,  v62,  16LL);
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v59;
          while (2)
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v59 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
              id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 launchInstanceID]);

              if (!v42)
              {
                uint64_t v51 = (uint64_t)v57;
                if (-[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:]( self,  "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:",  v55,  v41,  v15,  v56,  v16,  v9))
                {

                  goto LABEL_26;
                }
              }
            }

            id v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v58,  v62,  16LL);
            if (v38) {
              continue;
            }
            break;
          }
        }

        id v49 = RPErrorF(4294960582LL, (uint64_t)"No request handler", v43, v44, v45, v46, v47, v48, v51);
        id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0LL, 0LL, v50);

LABEL_26:
        uint64_t v18 = v53;
        id v17 = v54;
        uint64_t v26 = 0LL;
        uint64_t v19 = v52;
      }
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _receivedRequestID:request:options:responseHandler:unauth:cnx:]",  90LL,  "### Ignoring request ID %@ received for proxy device %@ on unAuth connection",  v55,  v26);
    }
  }
}

- (BOOL)_allowMessageForRegistrationOptions:(id)a3 cnx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v9 = v6
    && (unint64_t v8 = (unint64_t)[v6 statusFlags] & 0x70000AF000) != 0
    && (CFDictionaryGetInt64(v5, @"statusFlags", 0LL) & v8) != 0
    || CFDictionaryGetInt64(v5, @"allowUnauthenticated", 0LL) != 0;

  return v9;
}

- (BOOL)_allowStreamRequest:(id)a3 xpcCnx:(id)a4 rpCnx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 destinationDevice]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDeviceInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    id v15 = v13;
    id v16 = v14;
    id v17 = v16;
    if (v15 == v16) {
      goto LABEL_26;
    }
    if (v16)
    {
      unsigned __int8 v18 = [v15 isEqual:v16];

      if ((v18 & 1) != 0) {
        goto LABEL_27;
      }
    }

    else
    {
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceIdentifier]);
    id v15 = v15;
    id v20 = v19;
    if (v15 == v20) {
      goto LABEL_25;
    }
    id v21 = v20;
    if (v20)
    {
      unsigned __int8 v22 = [v15 isEqual:v20];

      if ((v22 & 1) != 0) {
        goto LABEL_28;
      }
    }

    else
    {
    }
  }

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);

  if (!v23)
  {
    id v27 = 0LL;
    goto LABEL_18;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  id v15 = v23;
  id v25 = v24;
  id v17 = v25;
  if (v15 == v25)
  {
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }

  if (v25)
  {
    unsigned __int8 v26 = [v15 isEqual:v25];

    if ((v26 & 1) != 0) {
      goto LABEL_27;
    }
  }

  else
  {
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceIdentifier]);
  id v27 = v15;
  id v30 = v29;
  if (v27 == v30)
  {
    id v15 = v27;
LABEL_25:

    goto LABEL_26;
  }

  uint64_t v31 = v30;
  if (!v30)
  {
    unsigned __int8 v28 = 0;
    id v15 = v27;
    goto LABEL_36;
  }

  unsigned __int8 v32 = [v27 isEqual:v30];

  if ((v32 & 1) != 0)
  {
    id v15 = v27;
LABEL_28:
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_streamSrv", TypeID, 0LL);
    id v17 = (id)objc_claimAutoreleasedReturnValue(TypedValue);
    if (!v17)
    {
      unsigned __int8 v28 = 0;
LABEL_37:

      id v27 = v15;
      goto LABEL_38;
    }

    id v27 = (id)objc_claimAutoreleasedReturnValue([v8 client]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v27 serviceType]);
    id v17 = v17;
    id v36 = v35;
    id v37 = v36;
    if (v17 == v36)
    {
      unsigned __int8 v28 = 1;
    }

    else if (v36)
    {
      unsigned __int8 v28 = [v17 isEqual:v36];
    }

    else
    {
      unsigned __int8 v28 = 0;
    }

LABEL_36:
    goto LABEL_37;
  }

- (void)_proxyDeviceListUpdated:(id)a3 content:(id)a4 options:(id)a5 cnx:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v44 = a5;
  id v11 = a6;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12, v13);
  uint64_t NSArrayOfClass = NSDictionaryGetNSArrayOfClass(v10, @"_proxyDevs", v14, &v51);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(NSArrayOfClass);
  if (v16)
  {
    id v39 = v10;
    id v40 = v9;
    unsigned int v42 = [v9 isEqual:@"_proxyAdd"];
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v38 = v16;
    id obj = v16;
    id v17 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v48;
      uint64_t v41 = *(void *)v48;
      do
      {
        id v20 = 0LL;
        id v45 = v18;
        do
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v20);
          CFTypeID TypeID = CFStringGetTypeID();
          uint64_t TypedValue = CFDictionaryGetTypedValue(v21, @"_i", TypeID, &v51);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          if (v24)
          {
            uint64_t NSUUID = NSDictionaryGetNSUUID(v21, @"_hkID", &v51);
            unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(NSUUID);
            if (v26)
            {
              id v27 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
              -[RPCompanionLinkDevice setIdentifier:](v27, "setIdentifier:", v24);
              -[RPCompanionLinkDevice setHomeKitIdentifier:](v27, "setHomeKitIdentifier:", v26);
              -[RPCompanionLinkDevice setStatusFlags:]( v27,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v27, "statusFlags") | 0x10000000);
              -[RPCompanionLinkDevice setFlags:]( v27,  "setFlags:",  -[RPCompanionLinkDevice flags](v27, "flags") | 0x2000);
              CFTypeID v28 = CFStringGetTypeID();
              uint64_t v29 = CFDictionaryGetTypedValue(v21, @"_mRtID", v28, &v51);
              id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              if (v30) {
                -[RPCompanionLinkDevice setMediaRouteIdentifier:](v27, "setMediaRouteIdentifier:", v30);
              }
              CFTypeID v31 = CFDictionaryGetTypeID();
              uint64_t v32 = CFDictionaryGetTypedValue(v21, @"_siriInfo", v31, 0LL);
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              if (v33) {
                -[RPCompanionLinkDevice setSiriInfo:](v27, "setSiriInfo:", v33);
              }
              CFTypeID v34 = CFStringGetTypeID();
              uint64_t v35 = CFDictionaryGetTypedValue(v21, @"_roomName", v34, 0LL);
              id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
              if (v36) {
                -[RPCompanionLinkDevice setRoomName:](v27, "setRoomName:", v36);
              }
              -[RPCompanionLinkDevice setStatusFlags:]( v27,  "setStatusFlags:",  (unint64_t)-[RPCompanionLinkDevice statusFlags](v27, "statusFlags") | (unint64_t)[v11 statusFlags] & 0x10000AE000);
              if (v42) {
                -[RPCompanionLinkDaemon _proxyDeviceAdd:options:eventID:deviceInfo:cnx:]( self,  "_proxyDeviceAdd:options:eventID:deviceInfo:cnx:",  v27,  v44,  v40,  v21,  v11);
              }
              else {
                -[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]( self,  "_proxyDeviceRemove:options:cnx:",  v27,  v44,  v11);
              }

              id v18 = v45;
              uint64_t v19 = v41;
            }

            else if (dword_100131328 <= 90 {
                   && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
            }
            {
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]",  90LL,  "### Received proxy device info without HomeKit identifier: %@\n",  v21);
            }
          }

          else if (dword_100131328 <= 90 {
                 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
          }
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]",  90LL,  "### Received proxy device info without identifier: %@\n",  v21);
          }

          id v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v37 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        id v18 = v37;
      }

      while (v37);
    }

    id v10 = v39;
    id v9 = v40;
    id v16 = v38;
  }

  else if (dword_100131328 <= 90 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceListUpdated:content:options:cnx:]",  90LL,  "### Received proxy device list without device info: %#m\n",  v51);
  }
}

- (void)_proxyDeviceAdd:(id)a3 options:(id)a4 eventID:(id)a5 deviceInfo:(id)a6 cnx:(id)a7
{
  id v26 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 proxyDevices]);

  if (!v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v13 setProxyDevices:v15];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 proxyDevices]);
  [v16 addObject:v26];

  homeHubDevices = self->_homeHubDevices;
  if (!homeHubDevices)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v19 = self->_homeHubDevices;
    self->_homeHubDevices = v18;

    homeHubDevices = self->_homeHubDevices;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homeHubDevices, "objectForKeyedSubscript:", v20));

  if (v21)
  {
    -[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]( self,  "_existingProxyDeviceUpdated:event:isLocal:",  v11,  v12,  0LL);
  }

  else
  {
    unsigned __int8 v22 = self->_homeHubDevices;
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v26, v23);

    objc_msgSend(v26, "setLinkType:", objc_msgSend(v13, "linkType"));
    objc_msgSend(v26, "setStatusFlags:", (unint64_t)objc_msgSend(v26, "statusFlags") | 4);
    -[RPCompanionLinkDaemon _clientReportFoundDevice:](self, "_clientReportFoundDevice:", v26);
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v24 = CUDescriptionWithLevel(v26, 20LL);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceAdd:options:eventID:deviceInfo:cnx:]",  30LL,  "Proxy device added %@\n",  v25);
    }
  }
}

- (void)_proxyDeviceRemove:(id)a3 options:(id)a4 cnx:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 proxyDevices]);
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      if (-[RPCompanionLinkDaemon _proxyDevice:isEqualTo:](self, "_proxyDevice:isEqualTo:", v14, v7)) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v15 = v14;

    if (!v15) {
      goto LABEL_15;
    }
    if (([v15 statusFlags] & 0x20000000) != 0)
    {
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]",  90LL,  " ### Proxy device removed on connection while it is hosted here: %@\n",  v7);
      }
    }

    else
    {
      objc_msgSend(v15, "setStatusFlags:", (unint64_t)objc_msgSend(v15, "statusFlags") & 0xFFFFFFFFEFFFFFFFLL);
      -[RPCompanionLinkDaemon _clientReportLostDevice:](self, "_clientReportLostDevice:", v15);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyDevices]);
      [v16 removeObject:v15];

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        uint64_t v17 = CUDescriptionWithLevel(v15, 20LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]",  30LL,  "Proxy device removed %@\n",  v18);
      }

      homeHubDevices = self->_homeHubDevices;
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](homeHubDevices, "setObject:forKeyedSubscript:", 0LL, v20);
    }
  }

  else
  {
LABEL_9:

LABEL_15:
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDeviceRemove:options:cnx:]",  90LL,  "### Proxy device removed is not present on this connection: %@ \n",  v7);
    }

    id v15 = 0LL;
  }
}

- (BOOL)_proxyDevice:(id)a3 receivedRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7 cnx:(id)a8
{
  id v14 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homeHubDevices,  "objectForKeyedSubscript:",  v14));
  if (v15)
  {
    if (dword_100131328 <= 40
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:]",  40LL,  "Received requestID '%@' for proxy device %@",  v32,  v14);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v16 = self->_xpcConnections;
    id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    if (v17)
    {
      id v18 = v17;
      id v27 = v14;
      uint64_t v19 = *(void *)v34;
      while (2)
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          __int128 v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 launchInstanceID]);
          if (v22)
          {
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v15 launchInstanceID]);
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              if (-[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:]( self,  "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:",  v32,  v21,  v31,  v30,  v29,  0LL,  v28))
              {

                BOOL v25 = 1;
                goto LABEL_21;
              }
            }
          }
        }

        id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
        if (v18) {
          continue;
        }
        break;
      }

      BOOL v25 = 0;
LABEL_21:
      id v14 = v27;
    }

    else
    {
      BOOL v25 = 0;
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDevice:receivedRequestID:request:options:responseHandler:cnx:]",  30LL,  "Proxy device with identifier %@ is not found, ignoring request ID %@",  v14,  v32);
    }

    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_proxyDevice:(id)a3 isEqualTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 homeKitIdentifier]);
  if ([v7 isEqual:v8])
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v9 = [v10 isEqual:v11];
  }

  return v9;
}

- (BOOL)_destinationID:(id)a3 matchesProxyDeviceOnCnx:(id)a4
{
  id v5 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "proxyDevices", 0));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) identifier]);
        unsigned __int8 v11 = [v10 isEqual:v5];

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_addProxyIdentifier:(id)a3 toDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homeHubDevices, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    id v9 = [v7 mutableCopy];
    [v9 setObject:v6 forKeyedSubscript:@"proxyID"];

    id v7 = v9;
  }

  return v7;
}

- (void)_sendProxyDeviceUpdateToPeer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_homeHubDevices, "allKeys"));
  id v6 = [v5 count];

  if (v6)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues"));
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8)
    {
      id v10 = v7;
      goto LABEL_18;
    }

    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (([v13 statusFlags] & 0x20000000) != 0)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _eventForHomeHubDevice:](self, "_eventForHomeHubDevice:", v13));
          if (v14)
          {
            if (!v10) {
              id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            }
            [v10 addObject:v14];
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);

    if (v10)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v10,  @"_proxyDevs",  0LL));
      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self,  "sendEventID:event:destinationID:options:completion:",  @"_proxyAdd",  v15,  v4,  0LL,  &stru_1001120A0);

LABEL_18:
    }
  }
}

- (void)_proxyLocalDeviceUpdateOnConnection:(id)a3 launchInstanceID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon homeHubDeviceForLaunchInstanceID:]( self,  "homeHubDeviceForLaunchInstanceID:",  v6));
  id v8 = v7;
  if (v7)
  {
    if (([v7 changed] & 1) != 0
      || ([v11 localDeviceUpdated] & 1) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 xpcCnx]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxy]);
      [v10 companionLinkLocalDeviceUpdated:v8];

      if (([v11 localDeviceUpdated] & 1) == 0)
      {
        [v11 reportFoundDevice:self->_localDeviceInfo outReason:0];
        [v11 setLocalDeviceUpdated:1];
      }

      [v8 setChanged:0];
    }
  }

  else if (dword_100131328 <= 90 {
         && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
  }
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyLocalDeviceUpdateOnConnection:launchInstanceID:]",  90LL,  "### Unable to find HomeHub device with launch instance ID %@",  v6);
  }
}

- (id)homeHubDeviceForLaunchInstanceID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_homeHubDevices, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 launchInstanceID]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_existingProxyDeviceUpdated:(id)a3 event:(id)a4 isLocal:(BOOL)a5
{
  BOOL v5 = a5;
  id v37 = a3;
  id v8 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, @"_i", TypeID, 0LL);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homeHubDevices,  "objectForKeyedSubscript:",  v11));
    if (!v12)
    {
      if (dword_100131328 <= 90
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]",  90LL,  "### HomeHub devices with identifier '%@' was not found for event %@",  v11,  v37);
      }

      goto LABEL_44;
    }

    CFTypeID v13 = CFDictionaryGetTypeID();
    uint64_t v14 = CFDictionaryGetTypedValue(v8, @"_siriInfo", v13, 0LL);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v36 = v5;
    if (v15)
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v12 siriInfo]);
      id v17 = v15;
      __int128 v18 = v17;
      if (v16 == v17)
      {
      }

      else
      {
        if (!v16)
        {

          goto LABEL_19;
        }

        unsigned __int8 v19 = [v16 isEqual:v17];

        if ((v19 & 1) == 0)
        {
LABEL_19:
          if (dword_100131328 <= 40
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
          {
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]",  40LL,  "Siri info updated on HomeHub device %@\n",  v21);
          }

          [v12 setSiriInfo:v18];
          int v20 = 1;
LABEL_26:
          CFTypeID v22 = CFStringGetTypeID();
          uint64_t v23 = CFDictionaryGetTypedValue(v8, @"_roomName", v22, 0LL);
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          if (v24)
          {
            BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v12 roomName]);
            unsigned __int8 v26 = [v24 isEqual:v25];

            if ((v26 & 1) == 0)
            {
              if (dword_100131328 <= 40
                && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
              {
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 roomName]);
                LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]",  40LL,  "Room name updated on HomeHub device %@: %@ -> %@\n",  v27,  v28,  v24);
              }

              [v12 setRoomName:v24];
              int v20 = 1;
            }
          }

          CFTypeID v29 = CFStringGetTypeID();
          uint64_t v30 = CFDictionaryGetTypedValue(v8, @"_mRtID", v29, 0LL);
          id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          if (v31
            && (id v32 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaRouteIdentifier]),
                unsigned __int8 v33 = [v31 isEqual:v32],
                v32,
                (v33 & 1) == 0))
          {
            if (dword_100131328 <= 40
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
            {
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaRouteIdentifier]);
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]",  40LL,  "Media route identifier updated on HomeHub device %@: %@ -> %@\n",  v34,  v35,  v31);
            }

            [v12 setMediaRouteIdentifier:v31];
          }

          else if ((v20 | v36) != 1)
          {
            goto LABEL_43;
          }

          -[RPCompanionLinkDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v12,  2LL);
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
      }
    }

    int v20 = 0;
    goto LABEL_26;
  }

  if (dword_100131328 <= 90 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _existingProxyDeviceUpdated:event:isLocal:]",  90LL,  "### Received eventID '%@' without identifier ",  v37);
  }
LABEL_45:
}

- (void)_createRequestEntryForXid:(id)a3 requestID:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___RPRequestEntry);
  -[RPRequestEntry setOptions:](v14, "setOptions:", v11);
  -[RPRequestEntry setRequestID:](v14, "setRequestID:", v13);

  -[RPRequestEntry setResponseHandler:](v14, "setResponseHandler:", v12);
  -[RPRequestEntry setSendTicks:](v14, "setSendTicks:", mach_absolute_time());
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loopbackRequests, "setObject:forKeyedSubscript:", v14, v10);
  if (v11)
  {
    double Double = CFDictionaryGetDouble(v11, @"timeoutSeconds", 0LL);
    if (Double > 0.0)
    {
      double v16 = Double;
      id v17 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100031A04;
      handler[3] = &unk_100111708;
      handler[4] = v17;
      void handler[5] = self;
      id v19 = v10;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet(v17, v16, -1.0, -10.0);
      dispatch_resume(v17);
      -[RPRequestEntry setTimer:](v14, "setTimer:", v17);
    }
  }
}

- (void)_proxyDevice:(id)a3 loopbackRequestID:(id)a4 request:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v58 = a4;
  id v55 = a5;
  id v13 = a6;
  id v14 = a7;
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  if (!v57)
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]",  90LL,  "### Proxy device to send requestID %@ has null identifier",  v58);
    }

    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v49 = RPErrorF(4294960569LL, (uint64_t)"'%@' not found", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0LL, 0LL, v50);

    goto LABEL_35;
  }

  if (!self->_loopbackRequests)
  {
    __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    loopbackRequests = self->_loopbackRequests;
    self->_loopbackRequests = v15;
  }

  unsigned int loopbackXid = self->_loopbackXid;
  if (loopbackXid + 1 > 1) {
    uint64_t v18 = loopbackXid + 1;
  }
  else {
    uint64_t v18 = 1LL;
  }
  self->_unsigned int loopbackXid = v18;
  uint64_t v53 = v18;
  id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  id v51 = v14;
  id v52 = v13;
  -[RPCompanionLinkDaemon _createRequestEntryForXid:requestID:options:responseHandler:]( self,  "_createRequestEntryForXid:requestID:options:responseHandler:");
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]",  30LL,  "SendRequestID '%@', XID 0x%x, to device %@ over loopback\n",  v58,  v53,  v57);
  }
  v67[0] = @"dlt";
  v67[1] = @"senderID";
  v68[0] = &off_10011AE08;
  v68[1] = v57;
  v67[2] = @"xid";
  v68[2] = v56;
  id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  3LL));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v19 = self->_xpcConnections;
  id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v62,  v66,  16LL);
  if (!v20) {
    goto LABEL_29;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v63;
  do
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v63 != v22) {
        objc_enumerationMutation(v19);
      }
      unsigned int v24 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v12 launchInstanceID]);
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 launchInstanceID]);
      id v27 = v25;
      id v28 = v26;
      if (v27 == v28)
      {

LABEL_24:
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_100032058;
        v59[3] = &unk_1001120C8;
        v59[4] = self;
        v59[5] = v56;
        void v59[6] = v57;
        int v61 = v53;
        id v60 = v12;
        unsigned __int8 v31 = -[RPCompanionLinkDaemon _receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:]( self,  "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:",  v58,  v24,  v55,  v54,  v59,  0LL,  0LL);

        if ((v31 & 1) != 0) {
          goto LABEL_32;
        }
        continue;
      }

      CFTypeID v29 = v28;
      if ((v27 == 0LL) == (v28 != 0LL))
      {

        continue;
      }

      unsigned __int8 v30 = [v27 isEqual:v28];

      if ((v30 & 1) != 0) {
        goto LABEL_24;
      }
    }

    id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v62,  v66,  16LL);
  }

  while (v21);
LABEL_29:

  id v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_loopbackRequests,  "objectForKeyedSubscript:",  v56));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loopbackRequests, "setObject:forKeyedSubscript:", 0LL, v56);
  id v32 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableSet timer](v19, "timer"));
  -[NSMutableSet setTimer:](v19, "setTimer:", 0LL);
  if (v32) {
    dispatch_source_cancel(v32);
  }
  unsigned __int8 v33 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(-[NSMutableSet responseHandler](v19, "responseHandler"));
  id v40 = RPErrorF(4294960582LL, (uint64_t)"Request '%@' not handled", v34, v35, v36, v37, v38, v39, (uint64_t)v58);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  ((void (**)(void, void, void, void *))v33)[2](v33, 0LL, 0LL, v41);

LABEL_32:
  id v14 = v51;
  id v13 = v52;

LABEL_35:
}

- (id)_checkForProxyOrLocalDestinations:(id)a3 eventID:(id)a4 event:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = (void (**)(id, id))a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homeHubDevices,  "objectForKeyedSubscript:",  v12));
  if (v17
    && (v18 = objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon _addProxyIdentifier:toDictionary:]( self,  "_addProxyIdentifier:toDictionary:",  v12,  v14)),  v14,  id v14 = (id)v18,  ([v17 flags] & 0x20000000) != 0)
    || (id v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_localDeviceInfo, "effectiveIdentifier")),
        unsigned int v20 = [v12 isEqual:v19],
        v19,
        v20))
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _checkForProxyOrLocalDestinations:eventID:event:options:completion:]",  30LL,  "Send eventID '%@' to destination %@ over loopback\n",  v13,  v12);
    }

    id v24 = 0LL;
    -[RPCompanionLinkDaemon _deliverEventID:event:options:unauth:cnx:outError:]( self,  "_deliverEventID:event:options:unauth:cnx:outError:",  v13,  v14,  v15,  0LL,  0LL,  &v24);
    id v22 = v24;
    if (v16) {
      v16[2](v16, v22);
    }

    id v21 = 0LL;
  }

  else
  {
    id v14 = v14;
    id v21 = v14;
  }

  return v21;
}

- (void)sessionStartSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 destinationID:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v34 = a7;
  uint64_t v35 = self;
  unsigned int sessionIDLast = self->_sessionIDLast;
  BOOL v15 = __CFADD__(sessionIDLast, 1);
  unsigned int v16 = sessionIDLast + 1;
  unsigned int v17 = sessionIDLast + 2;
  if (v15) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v16;
  }
  self->_unsigned int sessionIDLast = v18;
  unsigned __int8 v33 = v12;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v12 serviceType]);
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon sessionStartSend:session:xpcID:destinationID:completion:]",  30LL,  "Session start request: Service %@, destinationID %@, CSID 0x%llX connection %@\n",  v19,  v13,  v18,  v20);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 btPipeHighPriority]);
  BOOL v22 = [v21 state] == 1;

  v47[0] = v19;
  v46[0] = @"_srvT";
  v46[1] = @"_sid";
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v18));
  v47[1] = v23;
  v46[2] = @"_btHP";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
  v47[2] = v24;
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  3LL));

  v45[0] = &off_10011AE20;
  v44[0] = @"timeoutSeconds";
  v44[1] = @"highPriority";
  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
  v45[1] = v26;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000327B8;
  v37[3] = &unk_1001120F0;
  id v28 = (void *)v19;
  v37[4] = v19;
  id v38 = v13;
  id v39 = v33;
  id v40 = v11;
  id v42 = v34;
  uint64_t v43 = v18;
  uint64_t v41 = v35;
  id v29 = v11;
  id v30 = v33;
  id v31 = v34;
  id v32 = v13;
  [v29 sendEncryptedRequestID:@"_sessionStart" request:v25 xpcID:a5 options:v27 responseHandler:v37];
}

- (void)sessionStopSend:(id)a3 session:(id)a4 xpcID:(unsigned int)a5 completion:(id)a6
{
  id v9 = a3;
  id v22 = a6;
  id v10 = a4;
  id v11 = [v10 sessionID];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeSessions, "setObject:forKeyedSubscript:", 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 peerIdentifier]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceType]);

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon sessionStopSend:session:xpcID:completion:]",  30LL,  "Session stop request: Service %@, PeerID %@, SID 0x%llX\n",  v13,  v12,  v11);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 btPipeHighPriority]);
  BOOL v15 = [v14 state] == 1;

  v30[0] = @"_sid";
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
  v30[1] = @"_btHP";
  v31[0] = v16;
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
  v31[1] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));

  v29[0] = &off_10011AE38;
  v28[0] = @"timeoutSeconds";
  v28[1] = @"highPriority";
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
  v29[1] = v19;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100032CEC;
  v25[3] = &unk_100112118;
  void v25[4] = v13;
  void v25[5] = v12;
  id v26 = v22;
  id v27 = v11;
  id v21 = v22;
  [v9 sendEncryptedRequestID:@"_sessionStop" request:v18 xpcID:a5 options:v20 responseHandler:v25];
}

- (void)_sessionHandleStartRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  id v89 = a3;
  id v87 = a4;
  id v86 = a5;
  uint64_t v114 = 0LL;
  unsigned __int8 v115 = &v114;
  uint64_t v116 = 0x3032000000LL;
  unint64_t v117 = sub_10000B284;
  unsigned int v118 = sub_10000B294;
  id v119 = 0LL;
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_100033558;
  v111[3] = &unk_100112140;
  __int128 v113 = &v114;
  id v85 = a6;
  id v112 = v85;
  uint64_t v84 = objc_retainBlock(v111);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v87, @"senderID", TypeID, 0LL);
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v88)
  {
    id v70 = RPErrorF(4294960534LL, (uint64_t)"No senderID", v12, v13, v14, v15, v16, v17, v83);
    uint64_t v71 = objc_claimAutoreleasedReturnValue(v70);
    unsigned __int8 v72 = (void *)v115[5];
    v115[5] = v71;

    goto LABEL_42;
  }

  uint64_t Int64 = CFDictionaryGetInt64(v89, @"_sid", &v110);
  if (v110)
  {
    id v73 = RPErrorF(v110, (uint64_t)"No peer sessionID", v18, v19, v20, v21, v22, v23, v83);
    uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);
LABEL_46:
    unsigned __int8 v33 = (void *)v115[5];
    v115[5] = v74;
    goto LABEL_41;
  }

  if (!Int64)
  {
    id v75 = RPErrorF(4294960591LL, (uint64_t)"Bad peer sessionID", v18, v19, v20, v21, v22, v23, v83);
    uint64_t v74 = objc_claimAutoreleasedReturnValue(v75);
    goto LABEL_46;
  }

  CFTypeID v25 = CFStringGetTypeID();
  uint64_t v26 = CFDictionaryGetTypedValue(v89, @"_srvT", v25, 0LL);
  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (!v33)
  {
    id v76 = RPErrorF(4294896129LL, (uint64_t)"No service type", v27, v28, v29, v30, v31, v32, v83);
    uint64_t v77 = objc_claimAutoreleasedReturnValue(v76);
    uint64_t v78 = (void *)v115[5];
    v115[5] = v77;

    goto LABEL_41;
  }

  uint64_t v104 = 0LL;
  unsigned int v105 = (id *)&v104;
  uint64_t v106 = 0x3032000000LL;
  BOOL v107 = sub_10000B284;
  uint64_t v108 = sub_10000B294;
  id v109 = 0LL;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id v34 = self->_activeServers;
  id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v100,  v124,  16LL);
  if (v35)
  {
    uint64_t v36 = *(void *)v101;
    while (2)
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v101 != v36) {
          objc_enumerationMutation(v34);
        }
        id v38 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)i);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 serviceType]);
        unsigned __int8 v40 = [v39 isEqual:v33];

        if ((v40 & 1) != 0)
        {
          objc_storeStrong(v105 + 5, v38);
          goto LABEL_15;
        }
      }

      id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v100,  v124,  16LL);
      if (v35) {
        continue;
      }
      break;
    }
  }

- (void)_sessionHandleStopRequest:(id)a3 options:(id)a4 cnx:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v68 = 0LL;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000LL;
  uint64_t v71 = sub_10000B284;
  unsigned __int8 v72 = sub_10000B294;
  id v73 = 0LL;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_100033C24;
  v65[3] = &unk_100112140;
  uint64_t v67 = &v68;
  id v13 = a6;
  id v66 = v13;
  uint64_t v14 = objc_retainBlock(v65);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v11, @"senderID", TypeID, 0LL);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v23)
  {
    id v51 = RPErrorF(4294896131LL, (uint64_t)"No senderID", v17, v18, v19, v20, v21, v22, v61);
    uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
    uint64_t v53 = (void *)v69[5];
    v69[5] = v52;

    goto LABEL_21;
  }

  uint64_t Int64 = CFDictionaryGetInt64(v10, @"_sid", &v64);
  id v63 = v11;
  if (v64)
  {
    id v54 = RPErrorF(v64, (uint64_t)"No sessionID", v24, v25, v26, v27, v28, v29, v61);
    uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
LABEL_25:
    uint64_t v31 = (void *)v69[5];
    v69[5] = v55;
    goto LABEL_20;
  }

  if (!Int64)
  {
    id v56 = RPErrorF(4294960591LL, (uint64_t)"Bad sessionID", v24, v25, v26, v27, v28, v29, v61);
    uint64_t v55 = objc_claimAutoreleasedReturnValue(v56);
    goto LABEL_25;
  }

  id v62 = v10;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", Int64));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activeSessions,  "objectForKeyedSubscript:",  v31));
  id v39 = v32;
  if (v32)
  {
    unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v32 peerID]);
    unsigned __int8 v41 = [v40 isEqual:v23];

    if ((v41 & 1) != 0)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v39 serviceType]);
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _sessionHandleStopRequest:options:cnx:responseHandler:]",  30LL,  "Session stop: Service %@, PeerID %@, SID 0x%llX, request\n",  v48,  v23,  Int64);
      }

      (*((void (**)(id, void *, void, void))v13 + 2))(v13, &__NSDictionary0__struct, 0LL, 0LL);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activeSessions,  "setObject:forKeyedSubscript:",  0LL,  v31);
      [v39 setCnx:0];
      [v12 sessionStopped:v39];
      if ([v12 clientMode]
        && ([v12 controlFlags] & 0x200) != 0)
      {
        uint64_t v49 = -[RPCompanionLinkDaemon _sessionsActiveOnConnection:xpcConnection:]( self,  "_sessionsActiveOnConnection:xpcConnection:",  v12,  0LL);
        if (v49 < 1)
        {
          [v12 invalidate];
        }

        else if (dword_100131328 <= 40 {
               && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
        }
        {
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v12 label]);
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _sessionHandleStopRequest:options:cnx:responseHandler:]",  40LL,  "Connection %@ has %llu active sessions in progress, skip invalidating",  v50,  v49);
        }
      }

      [v39 invalidate];
      goto LABEL_19;
    }

    id v59 = RPErrorF(4294960523LL, (uint64_t)"Not owner of session", v42, v43, v44, v45, v46, v47, v61);
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v59);
  }

  else
  {
    id v57 = RPErrorF(4294960569LL, (uint64_t)"Session not found", v33, v34, v35, v36, v37, v38, v61);
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
  }

  uint64_t v60 = (void *)v69[5];
  v69[5] = v58;

LABEL_19:
  id v10 = v62;
LABEL_20:

  id v11 = v63;
LABEL_21:

  ((void (*)(void *))v14[2])(v14);
  _Block_object_dispose(&v68, 8);
}

- (void)_sessionHandlePeerDisconnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerIdentifier]);
  if (v5)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_activeSessions, "allKeys"));
    id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activeSessions,  "objectForKeyedSubscript:",  v10));
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peerID]);
          unsigned int v13 = [v12 isEqual:v5];

          if (!v13
            || (id v14 = (id)objc_claimAutoreleasedReturnValue([v11 cnx]), v14, v14 != v4))
          {

            goto LABEL_17;
          }

          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceType]);
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _sessionHandlePeerDisconnect:]",  30,  "Session stop: Service %@, PeerID %@, SID 0x%llX, disconnect\n",  v15,  v5,  [v11 sessionID]);
          }

          [v11 setCnx:0];
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activeSessions,  "setObject:forKeyedSubscript:",  0LL,  v10);
          [v11 invalidate];
        }

        id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (int64_t)_sessionsActiveOnConnection:(id)a3 xpcConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  xpcConnections = self->_xpcConnections;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100034094;
  v18[3] = &unk_1001121B8;
  id v9 = v7;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  uint64_t v21 = &v22;
  -[NSMutableSet enumerateObjectsUsingBlock:](xpcConnections, "enumerateObjectsUsingBlock:", v18);
  activeSessions = self->_activeSessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100034154;
  v15[3] = &unk_1001121E0;
  id v12 = v10;
  id v16 = v12;
  __int128 v17 = &v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessions, "enumerateKeysAndObjectsUsingBlock:", v15);
  int64_t v13 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)_handleContextCollectorProxyRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ctxCollProxyReq"]);
  if (v17)
  {
    id v18 = [v8 mutableCopy];
    [v18 removeObjectForKey:@"ctxCollProxyReq"];
    id v19 = [v18 copy];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _contextCollectorDevice](self, "_contextCollectorDevice"));
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _handleContextCollectorProxyRequest:options:responseHandler:]",  30LL,  "Sending proxy request %@ to context collector %@",  v17,  v21);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000343D4;
    v26[3] = &unk_100112208;
    id v27 = v10;
    -[RPCompanionLinkDaemon sendRequestID:request:destinationID:options:responseHandler:]( self,  "sendRequestID:request:destinationID:options:responseHandler:",  v17,  v19,  v22,  v9,  v26);

    id v8 = v19;
  }

  else
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _handleContextCollectorProxyRequest:options:responseHandler:]",  90LL,  "Proxy request missing requestID");
    }

    id v23 = RPErrorF(4294960534LL, (uint64_t)"Missing proxy requestID", v11, v12, v13, v14, v15, v16, v25);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v24);
  }
}

- (void)_handleContextCollectorRequest:(id)a3 responseHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void *, void, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon _contextCollectorDevice](self, "_contextCollectorDevice"));
  uint64_t v13 = v6;
  if (v6)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourDevice]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 ipAddress]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 bonjourDevice]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceInfo]);
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v18, @"deviceID", TypeID, 0LL);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v15 && v16 && v21)
    {
      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon _handleContextCollectorRequest:responseHandler:]",  30LL,  "Sending context collector information to paired watch: %@\n",  v13);
      }

      v33[0] = @"_bi";
      v33[1] = @"_dIP";
      v34[0] = v15;
      v34[1] = v16;
      v33[2] = @"_i";
      v34[2] = v21;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
      uint64_t v29 = 0LL;
    }

    else
    {
      id v31 = RPErrorF( 4294960534LL,  (uint64_t)"Insufficient context collector device information",  v22,  v23,  v24,  v25,  v26,  v27,  v32);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v30 = 0LL;
    }
  }

  else
  {
    id v28 = RPErrorF( 4294960534LL,  (uint64_t)"No context collector found (proxy discovery)",  v7,  v8,  v9,  v10,  v11,  v12,  v32);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = 0LL;
  }

  v5[2](v5, v30, 0LL, v29);
}

- (id)_contextCollectorDevice
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeDevices, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourDevice]);

        if (v7)
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourDevice]);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 txtDictionary]);

          if ((CFDictionaryGetInt64(v9, @"rpFl", 0LL) & 0x800000) != 0)
          {
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourDevice]);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
            CFTypeID TypeID = CFStringGetTypeID();
            uint64_t TypedValue = CFDictionaryGetTypedValue(v11, @"deviceID", TypeID, 0LL);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

            if (v14)
            {
              id v3 = v6;

              goto LABEL_14;
            }
          }
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = -[RPCompanionLinkXPCConnection initWithDaemon:xpcCnx:]( objc_alloc(&OBJC_CLASS___RPCompanionLinkXPCConnection),  "initWithDaemon:xpcCnx:",  self,  v5);
  -[RPCompanionLinkXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPCompanionLinkXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  uint64_t v10 = self->_xpcClientInterface;
  if (!v10)
  {
    uint64_t v68 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v11, v12);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14, v15);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData, v17, v18);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDate, v20, v21);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNull, v23, v24);
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v26, v27);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString, v29, v30);
    uint64_t v34 = -[NSSet initWithObjects:]( v68,  "initWithObjects:",  v13,  v16,  v19,  v22,  v25,  v28,  v31,  objc_opt_class(&OBJC_CLASS___NSUUID, v32, v33),  0LL);
    uint64_t v10 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPCompanionLinkXPCClientInterface));
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v10,  "setClasses:forSelector:argumentIndex:ofReply:",  v34,  "companionLinkReceivedEventID:event:options:",  1LL,  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v10,  "setClasses:forSelector:argumentIndex:ofReply:",  v34,  "companionLinkReceivedRequestID:request:options:responseHandler:",  1LL,  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v10,  "setClasses:forSelector:argumentIndex:ofReply:",  v34,  "companionLinkReceivedRequestID:request:options:responseHandler:",  0LL,  1LL);
    objc_storeStrong((id *)&self->_xpcClientInterface, v10);
  }

  uint64_t v35 = self->_xpcServerInterface;
  if (!v35)
  {
    id v69 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSArray, v36, v37);
    uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDictionary, v38, v39);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSData, v41, v42);
    uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDate, v44, v45);
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSNull, v47, v48);
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber, v50, v51);
    uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSString, v53, v54);
    uint64_t v58 = -[NSSet initWithObjects:]( v69,  "initWithObjects:",  v67,  v40,  v43,  v46,  v49,  v52,  v55,  objc_opt_class(&OBJC_CLASS___NSUUID, v56, v57),  0LL);
    uint64_t v35 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPCompanionLinkXPCServerInterface));
    id v59 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSArray, v60, v61);
    __int128 v65 = -[NSSet initWithObjects:]( v59,  "initWithObjects:",  v62,  objc_opt_class(&OBJC_CLASS___RPCompanionLinkDevice, v63, v64),  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v35,  "setClasses:forSelector:argumentIndex:ofReply:",  v65,  "companionLinkActivateClient:completion:",  0LL,  1LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v35,  "setClasses:forSelector:argumentIndex:ofReply:",  v58,  "companionLinkSendEventID:event:destinationID:options:nwActivityToken:completion:",  1LL,  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v35,  "setClasses:forSelector:argumentIndex:ofReply:",  v58,  "companionLinkSendRequestID:request:destinationID:options:nwActivityToken:responseHandler:",  1LL,  0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v35,  "setClasses:forSelector:argumentIndex:ofReply:",  v58,  "companionLinkSendRequestID:request:destinationID:options:nwActivityToken:responseHandler:",  0LL,  1LL);
    objc_storeStrong((id *)&self->_xpcServerInterface, v35);
  }

  [v5 setExportedInterface:v35];
  [v5 setExportedObject:v6];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  void v70[2] = sub_100034C2C;
  v70[3] = &unk_100111968;
  void v70[4] = self;
  v70[5] = v6;
  [v5 setInvalidationHandler:v70];
  [v5 setRemoteObjectInterface:v10];
  [v5 _setQueue:self->_dispatchQueue];
  [v5 resume];
  if (dword_100131328 <= 20 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v6 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v6);
  -[RPCompanionLinkDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 rbsPID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 rbsPID]);
    -[RPCompanionLinkDaemon _removeApplicationPID:](self, "_removeApplicationPID:", v5);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (RPHomeKitManager)rpHomeKitManager
{
  return self->_rpHomeKitManager;
}

- (NSMutableSet)activeServers
{
  return self->_activeServers;
}

- (void)setActiveServers:(id)a3
{
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
}

- (NSDictionary)destinationIdentifierModelMap
{
  return self->_destinationIdentifierModelMap;
}

- (NSDictionary)destinationIdentifierRelMap
{
  return self->_destinationIdentifierRelMap;
}

- (NSMutableSet)rbsPIDSet
{
  return self->_rbsPIDSet;
}

- (void)setRbsPIDSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end