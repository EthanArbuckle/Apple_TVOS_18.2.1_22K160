@interface MRDAVRoutingServer
- (BOOL)_setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5;
- (BOOL)_shouldIgnorePortStatusFailureForRouteWithUID:(id)a3 previouslyCachedRouteUID:(id *)a4;
- (BOOL)airplayActive;
- (BOOL)isSilentPrimary;
- (BOOL)isStartingNowPlayingSession;
- (BOOL)outputDeviceAuthorizationSession:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5;
- (BOOL)routeIsActiveWithUID:(id)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5;
- (MRDAVHostedRoutingService)hostedRoutingService;
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3;
- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3 hostedRoutingService:(id)a4 systemEndpointController:(id)a5 autoConnectionController:(id)a6 homeServer:(id)a7 avOutputDeviceAuthorizationSession:(id)a8;
- (MRDAVSystemEndpointController)systemEndpointController;
- (MRDRouteRecommendationController)recommendationController;
- (MROSTransaction)discoveryTransaction;
- (MSVSystemDialog)activeDialog;
- (MSVSystemDialog)activePasswordDialog;
- (id)_createAirPlaySecuritySettings;
- (id)_descriptionForDiscoveryMode:(unsigned int)a3;
- (id)_existingKeychainAccountForOutputDevice:(id)a3 password:(id *)a4;
- (id)_passwordDialogForRouteWithName:(id)a3 usingInputType:(int64_t)a4;
- (id)_predictGroupLeaderForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5;
- (id)_preferredIdentifierForMACAddress:(id)a3 identifier:(id)a4 name:(id)a5;
- (id)_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7;
- (id)_savedPasswordForOutputDevice:(id)a3;
- (id)applicationPickedRoutes;
- (id)clientsForApplicationPickedRoute:(id)a3;
- (id)clientsWithApplicationPickedRoutes;
- (id)createTransientEndpointForOutputDeviceUID:(id)a3 details:(id)a4;
- (id)mediaActivityManager;
- (id)pickableRoutesForCategory:(id)a3;
- (void)_clearPasswordForOutputDevice:(id)a3;
- (void)_clientInvalidatedNotification:(id)a3;
- (void)_failedToConnectToOutputDeviceNotification:(id)a3;
- (void)_handleAddVirtualOutputDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleAuthenticationFailureForRoute:(id)a3 withOptions:(unsigned int)a4;
- (void)_handleAuthorizationRequest:(id)a3;
- (void)_handleClearAllAVRoutePasswordsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleClusterErrorStatus:(int)a3 forRoute:(id)a4;
- (void)_handleCreateDirectEndpointForDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateEndpointWithDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateGroupWithDevices:(id)a3 fromClient:(id)a4;
- (void)_handleCreateHostedEndpointForDevices:(id)a3 fromClient:(id)a4;
- (void)_handleDismissAllBannersMessage:(id)a3 fromClient:(id)a4;
- (void)_handleErrorStatus:(int)a3 forRoute:(id)a4;
- (void)_handleGetActiveSystemEndpointUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAirPlaySecuritySettingsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAirplayStatus:(id)a3 fromClient:(id)a4;
- (void)_handleGetExternalDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetExternalScreenTypeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetHostedEndpointForDeviceUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetHostedRoutingXPCEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetOutputContextUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPickableRoutesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetRecentAVOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetRecommendRouteCandidatesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVirtualOutputDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGroupDevicesAndSendCommand:(id)a3 fromClient:(id)a4;
- (void)_handleMigrateFromEndpointToEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleMigrateFromEndpointToOutputDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleModifyOutputContextMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePauseOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePredictGroupLeader:(id)a3 fromClient:(id)a4;
- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePromptForRouteAuthorizationMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecommendRouteCandidateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveFromParentGroup:(id)a3 fromClient:(id)a4;
- (void)_handleResetOutputContextMessage:(id)a3 fromClient:(id)a4;
- (void)_handleResumeNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleSearchEndpointsForOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSearchEndpointsForRoutingContextUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetApplicationPickedRoutes:(id)a3 fromClient:(id)a4;
- (void)_handleSetNearbyDevice:(id)a3 fromClient:(id)a4;
- (void)_handleSetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPickedRouteMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetRecentAVOutputDeviceUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetRouteDiscoveryModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4;
- (void)_handleStartNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleStopNowPlayingSession:(id)a3 fromClient:(id)a4;
- (void)_handleUnpickAirPlayRoutesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateActiveSystemEndpointUIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleWillStartPlayingInterruptMessage:(id)a3 fromClient:(id)a4;
- (void)_launchTVClusterSettings;
- (void)_loadMostRecentlyPicked;
- (void)_postExternalScreenDidChange;
- (void)_postRouteStatusDidChangeNotificationForRoute:(id)a3 newStatus:(int)a4;
- (void)_presentPasswordDialogForRoute:(id)a3 withOptions:(unsigned int)a4;
- (void)_reevaluateAirplayActive;
- (void)_registerNotifications;
- (void)_routingDataSourceExternalScreenDidChangeNotification:(id)a3;
- (void)_routingDataSourcePickableRoutesDidChangeNotification:(id)a3;
- (void)_routingDataSourceRouteStatusDidChangeNotification:(id)a3;
- (void)_saveMostRecentlyPicked;
- (void)_storePassword:(id)a3 forOutputDevice:(id)a4;
- (void)_storePassword:(id)a3 forRoute:(id)a4;
- (void)_unregisterNotifications;
- (void)_updateSystemRouteDiscoveryMode;
- (void)collectDiagnostic:(id)a3;
- (void)createEndpointForOutputDeviceIDs:(id)a3 details:(id)a4 completion:(id)a5;
- (void)createEndpointForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)outputDeviceAuthorizationSession:(id)a3 didProvideAuthorizationRequest:(id)a4;
- (void)pickCachedRouteWithUID:(id)a3;
- (void)postSystemEndpointDeviceChange:(id)a3 type:(int64_t)a4 originClient:(id)a5 handler:(id)a6;
- (void)removeOutputDeviceUIDsFromParentGroup:(id)a3 details:(id)a4 completion:(id)a5;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)restoreClientSystemEndpointWithType:(int64_t)a3 handler:(id)a4;
- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)setActiveDialog:(id)a3;
- (void)setActivePasswordDialog:(id)a3;
- (void)setAirplayActive:(BOOL)a3;
- (void)setDiscoveryTransaction:(id)a3;
- (void)systemEndpointController:(id)a3 activeSystemEndpointDidChangeForRequest:(id)a4 type:(int64_t)a5;
@end

@implementation MRDAVRoutingServer

- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___MRDAVHostedRoutingService);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 supportSystemEndpoints];

  if (v7)
  {
    v8 = objc_alloc(&OBJC_CLASS___MRDAVSystemEndpointController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedRoutingService hostedRoutingController](v5, "hostedRoutingController"));
    v10 = -[MRDAVSystemEndpointController initWithRoutingController:](v8, "initWithRoutingController:", v9);
  }

  else
  {
    v10 = 0LL;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___MRDExternalDeviceHomeServer);
  id v12 = -[objc_class sharedAuthorizationSession](off_1003F7818(), "sharedAuthorizationSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MRDAutoConnectionController sharedConnectionController]( &OBJC_CLASS___MRDAutoConnectionController,  "sharedConnectionController"));
  v15 = -[MRDAVRoutingServer initWithRoutingDataSource:hostedRoutingService:systemEndpointController:autoConnectionController:homeServer:avOutputDeviceAuthorizationSession:]( self,  "initWithRoutingDataSource:hostedRoutingService:systemEndpointController:autoConnectionController:homeServer:av OutputDeviceAuthorizationSession:",  v4,  v5,  v10,  v14,  v11,  v13);

  return v15;
}

- (MRDAVRoutingServer)initWithRoutingDataSource:(id)a3 hostedRoutingService:(id)a4 systemEndpointController:(id)a5 autoConnectionController:(id)a6 homeServer:(id)a7 avOutputDeviceAuthorizationSession:(id)a8
{
  id v55 = a3;
  id v54 = a4;
  id v53 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___MRDAVRoutingServer;
  v18 = -[MRDAVRoutingServer init](&v60, "init");
  if (v18)
  {
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.mediaremote.routingServer.workerQueue", v20);
    workerQueue = v18->_workerQueue;
    v18->_workerQueue = (OS_dispatch_queue *)v21;

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100108E34;
    v58[3] = &unk_1003A10B8;
    v23 = v18;
    v59 = v23;
    +[MRAVLightweightReconnaissanceSession setSearchEndpointsForOutputDeviceUIDImplementation:]( &OBJC_CLASS___MRAVLightweightReconnaissanceSession,  "setSearchEndpointsForOutputDeviceUIDImplementation:",  v58);
    +[MRAVOutputContextModification setModifyOutputContextImplementation:]( &OBJC_CLASS___MRAVOutputContextModification,  "setModifyOutputContextImplementation:",  &stru_1003A10F8);
    objc_storeStrong((id *)&v23->_routingDataSource, a3);
    objc_storeStrong((id *)&v23->_hostedRoutingService, a4);
    objc_storeStrong((id *)&v23->_systemEndpointController, a5);
    -[MRDAVSystemEndpointController setDelegate:](v23->_systemEndpointController, "setDelegate:", v23);
    objc_storeStrong((id *)&v23->_autoConnectionController, a6);
    objc_storeStrong((id *)&v23->_homeServer, a7);
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    routeUIDsToIgnorePortStatusFailures = v23->_routeUIDsToIgnorePortStatusFailures;
    v23->_routeUIDsToIgnorePortStatusFailures = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    reconnaissanceSessions = v23->_reconnaissanceSessions;
    v23->_reconnaissanceSessions = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mostRecentlyPickedDevices = v23->_mostRecentlyPickedDevices;
    v23->_mostRecentlyPickedDevices = v28;

    v23->_mostRecentStatus = -1;
    v30 = objc_alloc_init(&OBJC_CLASS___MRDRoutingContinuityManager);
    routingContinuityManager = v23->_routingContinuityManager;
    v23->_routingContinuityManager = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v33 = [v32 supportMultiplayerHost];

    if (v33)
    {
      v34 = objc_alloc_init(&OBJC_CLASS___MRDIdleTopologySimplifier);
      topologySimplifier = v23->_topologySimplifier;
      v23->_topologySimplifier = v34;

      v36 = objc_alloc_init(&OBJC_CLASS___MRDAVLocalDeviceCommitManager);
      localDeviceCommitManager = v23->_localDeviceCommitManager;
      v23->_localDeviceCommitManager = v36;

      v38 = objc_alloc_init(&OBJC_CLASS___MRDNowPlayingAirPlaySessionController);
      nowPlayingAirPlaySessionController = v23->_nowPlayingAirPlaySessionController;
      v23->_nowPlayingAirPlaySessionController = v38;
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v41 = [v40 useProactivePFSQSender];

    if (v41)
    {
      v42 = objc_alloc_init(&OBJC_CLASS___MRDProactivePrepareForSetQueueSender);
      proactivePrepareForSetQueueSender = v23->_proactivePrepareForSetQueueSender;
      v23->_proactivePrepareForSetQueueSender = v42;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v45 = [v44 supportRouteRecommendations];

    if (v45)
    {
      v46 = objc_alloc_init(&OBJC_CLASS___MRDRouteRecommendationController);
      recommendationController = v23->_recommendationController;
      v23->_recommendationController = v46;
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v48 showBluePill];

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v49 donateActiveRoutesToBiome];

    [v17 setDelegate:v23];
    uint64_t v50 = objc_claimAutoreleasedReturnValue( +[MRDPreemptiveRemoteControlConnectionManager sharedManager]( &OBJC_CLASS___MRDPreemptiveRemoteControlConnectionManager,  "sharedManager"));
    preemptiveRemoteControlConnectionManager = v23->_preemptiveRemoteControlConnectionManager;
    v23->_preemptiveRemoteControlConnectionManager = (MRDPreemptiveRemoteControlConnectionManager *)v50;

    -[MRDAVRoutingServer _registerNotifications](v23, "_registerNotifications");
    -[MRDAVRoutingServer _loadMostRecentlyPicked](v23, "_loadMostRecentlyPicked");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100108EE4;
    block[3] = &unk_100399250;
    v57 = v23;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v18;
}

- (void)dealloc
{
  id v3 = -[objc_class sharedAuthorizationSession](off_1003F7818(), "sharedAuthorizationSession");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 setDelegate:0];
  -[MRDAVRoutingServer _unregisterNotifications](self, "_unregisterNotifications");

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDAVRoutingServer;
  -[MRDAVRoutingServer dealloc](&v5, "dealloc");
}

- (void)setAirplayActive:(BOOL)a3
{
  if (self->_airplayActive != a3)
  {
    self->_airplayActive = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"MRDRoutingServerAirplayActiveDidChange" object:self];
  }

- (BOOL)isSilentPrimary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned __int8 v3 = [v2 supportNowPlayingSessionDataSource];

  if ((v3 & 1) == 0) {
    return MRMediaRemoteGetLocalIsProxyGroupPlayer();
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v5 = [v4 supportMultiplayerHost];

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
    unsigned int v6 = [v8 containsLocalDevice] ^ 1;
  }

  return v6;
}

- (BOOL)isStartingNowPlayingSession
{
  return -[MRDNowPlayingAirPlaySessionController isStartingNowPlayingSession]( self->_nowPlayingAirPlaySessionController,  "isStartingNowPlayingSession");
}

- (id)pickableRoutesForCategory:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource pickableRoutesForCategory:]( self->_routingDataSource,  "pickableRoutesForCategory:",  a3));
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "dictionary", (void)v12));
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[MRDAVRoute initWithDictionary:](objc_alloc(&OBJC_CLASS___MRDAVRoute), "initWithDictionary:", v9);

  LOBYTE(v5) = -[MRDAVRoutingServer _setPickedRoute:withPassword:options:]( self,  "_setPickedRoute:withPassword:options:",  v10,  v8,  v5);
  return v5;
}

- (void)pickCachedRouteWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Route change requested for AV server's cached routes with UID %{public}@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingDataSource pickedRoutes](self->_routingDataSource, "pickedRoutes"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)i), "uniqueIdentifier", (void)v26));
        unsigned __int8 v15 = [v14 hasPrefix:v4];

        if ((v15 & 1) != 0)
        {
          id v18 = v9;
          goto LABEL_27;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource pickableRoutesForCategory:]( self->_routingDataSource,  "pickableRoutesForCategory:",  0LL));
  id v17 = v4;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:buf count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v31;
    while (2)
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
        if (objc_msgSend(v22, "matchesUniqueIdentifier:", v17, (void)v26))
        {
          id v19 = v22;
          goto LABEL_22;
        }
      }

      id v19 = [v18 countByEnumeratingWithState:&v30 objects:buf count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

- (BOOL)routeIsActiveWithUID:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingDataSource pickedRoute](routingDataSource, "pickedRoute"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
  unsigned __int8 v7 = [v6 hasPrefix:v4];

  return v7;
}

- (id)applicationPickedRoutes
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allClients]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v4;
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
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v9),  "applicationPickedRoutes",  (void)v13));
        -[NSMutableSet addObjectsFromArray:](v2, "addObjectsFromArray:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v2, "allObjects"));
  return v11;
}

- (id)clientsForApplicationPickedRoute:(id)a3
{
  id v3 = a3;
  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allClients]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v5;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationPickedRoutes]);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
              unsigned int v16 = [v14 isEqual:v15];

              if (v16)
              {
                -[NSMutableArray addObject:](v19, "addObject:", v7);
                goto LABEL_16;
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

- (id)clientsWithApplicationPickedRoutes
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allClients]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationPickedRoutes", (void)v16));
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationPickedRoutes]);
          id v14 = [v13 count];

          if (v14) {
            -[NSMutableArray addObject:](v2, "addObject:", v10);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v2;
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if ([a3 isEntitledFor:0x10000])
  {
    -[MRDAVRoutingServer restoreClientSystemEndpointWithType:handler:]( self,  "restoreClientSystemEndpointWithType:handler:",  0LL,  v6);
    -[MRDAVRoutingServer restoreClientSystemEndpointWithType:handler:]( self,  "restoreClientSystemEndpointWithType:handler:",  1LL,  v6);
    -[MRDAVRoutingServer restoreClientSystemEndpointWithType:handler:]( self,  "restoreClientSystemEndpointWithType:handler:",  2LL,  v6);
    -[MRDAVRoutingServer restoreClientSystemEndpointWithType:handler:]( self,  "restoreClientSystemEndpointWithType:handler:",  3LL,  v6);
  }
}

- (void)restoreClientSystemEndpointWithType:(int64_t)a3 handler:(id)a4
{
  systemEndpointController = self->_systemEndpointController;
  if (systemEndpointController)
  {
    id v7 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController activeOutputDeviceUID:]( systemEndpointController,  "activeOutputDeviceUID:",  a3));
    id v8 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v9 reason:@"Restore"];
    [v8 setChangeType:0];
    -[MRDAVRoutingServer postSystemEndpointDeviceChange:type:originClient:handler:]( self,  "postSystemEndpointDeviceChange:type:originClient:handler:",  v8,  a3,  0LL,  v7);
  }

- (id)mediaActivityManager
{
  mediaActivityManager = self->_mediaActivityManager;
  if (!mediaActivityManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MRDMediaActivityManager);
    id v5 = self->_mediaActivityManager;
    self->_mediaActivityManager = v4;

    mediaActivityManager = self->_mediaActivityManager;
  }

  return mediaActivityManager;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x300000000000001uLL:
      -[MRDAVRoutingServer _handleSetRouteDiscoveryModeMessage:fromClient:]( self,  "_handleSetRouteDiscoveryModeMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000002uLL:
      -[MRDAVRoutingServer _handleGetPickableRoutesMessage:fromClient:]( self,  "_handleGetPickableRoutesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000003uLL:
      -[MRDAVRoutingServer _handleSetPickedRouteMessage:fromClient:]( self,  "_handleSetPickedRouteMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000004uLL:
      -[MRDAVRoutingServer _handleGetPickedRouteHasVolumeControlMessage:fromClient:]( self,  "_handleGetPickedRouteHasVolumeControlMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000005uLL:
      -[MRDAVRoutingServer _handleSetPickedRouteHasVolumeControlMessage:fromClient:]( self,  "_handleSetPickedRouteHasVolumeControlMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000006uLL:
      -[MRDAVRoutingServer _handleGetExternalScreenTypeMessage:fromClient:]( self,  "_handleGetExternalScreenTypeMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000007uLL:
      -[MRDAVRoutingServer _handleGetSavedAVRoutePasswordMessage:fromClient:]( self,  "_handleGetSavedAVRoutePasswordMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000008uLL:
      -[MRDAVRoutingServer _handleSetSavedAVRoutePasswordMessage:fromClient:]( self,  "_handleSetSavedAVRoutePasswordMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000009uLL:
      -[MRDAVRoutingServer _handleClearAllAVRoutePasswordsMessage:fromClient:]( self,  "_handleClearAllAVRoutePasswordsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000AuLL:
      -[MRDAVRoutingServer _handleUnpickAirPlayRoutesMessage:fromClient:]( self,  "_handleUnpickAirPlayRoutesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000BuLL:
      -[MRDAVRoutingServer _handleSetApplicationPickedRoutes:fromClient:]( self,  "_handleSetApplicationPickedRoutes:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000CuLL:
      -[MRDAVRoutingServer _handleGetAirPlaySecuritySettingsMessage:fromClient:]( self,  "_handleGetAirPlaySecuritySettingsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000DuLL:
      -[MRDAVRoutingServer _handleGetHostedRoutingXPCEndpointMessage:fromClient:]( self,  "_handleGetHostedRoutingXPCEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000EuLL:
      -[MRDAVRoutingServer _handleSetRecentAVOutputDeviceUIDMessage:fromClient:]( self,  "_handleSetRecentAVOutputDeviceUIDMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000000FuLL:
      -[MRDAVRoutingServer _handleGetRecentAVOutputDeviceUIDsMessage:fromClient:]( self,  "_handleGetRecentAVOutputDeviceUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000010uLL:
      -[MRDAVRoutingServer _handleGetActiveSystemEndpointUIDsMessage:fromClient:]( self,  "_handleGetActiveSystemEndpointUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000011uLL:
      -[MRDAVRoutingServer _handleUpdateActiveSystemEndpointUIDMessage:fromClient:]( self,  "_handleUpdateActiveSystemEndpointUIDMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000013uLL:
      -[MRDAVRoutingServer _handleCreateEndpointWithDevices:fromClient:]( self,  "_handleCreateEndpointWithDevices:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000014uLL:
      -[MRDAVRoutingServer _handlePromptForRouteAuthorizationMessage:fromClient:]( self,  "_handlePromptForRouteAuthorizationMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000015uLL:
      -[MRDAVRoutingServer _handlePresentRouteAuthorizationStatusMessage:fromClient:]( self,  "_handlePresentRouteAuthorizationStatusMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000016uLL:
      -[MRDAVRoutingServer _handleGetAirplayStatus:fromClient:](self, "_handleGetAirplayStatus:fromClient:", xdict, v6);
      break;
    case 0x300000000000017uLL:
      -[MRDAVRoutingServer _handleGroupDevicesAndSendCommand:fromClient:]( self,  "_handleGroupDevicesAndSendCommand:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000018uLL:
      -[MRDAVRoutingServer _handleRemoveFromParentGroup:fromClient:]( self,  "_handleRemoveFromParentGroup:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000019uLL:
      -[MRDAVRoutingServer _handlePredictGroupLeader:fromClient:]( self,  "_handlePredictGroupLeader:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000001AuLL:
      -[MRDAVRoutingServer _handleSetNearbyDevice:fromClient:](self, "_handleSetNearbyDevice:fromClient:", xdict, v6);
      break;
    case 0x30000000000001CuLL:
      -[MRDAVRoutingServer _handleResetOutputContextMessage:fromClient:]( self,  "_handleResetOutputContextMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000001DuLL:
      -[MRDAVRoutingServer _handleGetExternalDeviceMessage:fromClient:]( self,  "_handleGetExternalDeviceMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000001EuLL:
      -[MRDAVRoutingServer _handleAddVirtualOutputDeviceMessage:fromClient:]( self,  "_handleAddVirtualOutputDeviceMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000001FuLL:
      -[MRDAVRoutingServer _handleGetVirtualOutputDevicesMessage:fromClient:]( self,  "_handleGetVirtualOutputDevicesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000020uLL:
      -[MRDAVRoutingServer _handleCreateGroupWithDevices:fromClient:]( self,  "_handleCreateGroupWithDevices:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000021uLL:
      -[MRDAVRoutingServer _handleCreateDirectEndpointForDevices:fromClient:]( self,  "_handleCreateDirectEndpointForDevices:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000022uLL:
      -[MRDExternalDeviceHomeServer handleXPCMessage:fromClient:]( self->_homeServer,  "handleXPCMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000023uLL:
      -[MRDAVRoutingServer _handleStartNowPlayingSession:fromClient:]( self,  "_handleStartNowPlayingSession:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000024uLL:
      -[MRDAVRoutingServer _handleStopNowPlayingSession:fromClient:]( self,  "_handleStopNowPlayingSession:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000025uLL:
      -[MRDAVRoutingServer _handleGetOutputContextUIDMessage:fromClient:]( self,  "_handleGetOutputContextUIDMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000026uLL:
      -[MRDAVRoutingServer _handleMigrateFromEndpointToOutputDevicesMessage:fromClient:]( self,  "_handleMigrateFromEndpointToOutputDevicesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000027uLL:
      -[MRDAVRoutingServer _handleMigrateFromEndpointToEndpointMessage:fromClient:]( self,  "_handleMigrateFromEndpointToEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000028uLL:
      -[MRDAVRoutingServer _handleModifyOutputContextMessage:fromClient:]( self,  "_handleModifyOutputContextMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000029uLL:
      -[MRDAVRoutingServer _handleCreateHostedEndpointForDevices:fromClient:]( self,  "_handleCreateHostedEndpointForDevices:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002AuLL:
      -[MRDAVRoutingServer _handleWillStartPlayingInterruptMessage:fromClient:]( self,  "_handleWillStartPlayingInterruptMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002BuLL:
      -[MRDAVRoutingServer _handleRecommendRouteCandidateMessage:fromClient:]( self,  "_handleRecommendRouteCandidateMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002CuLL:
      -[MRDAVRoutingServer _handleGetRecommendRouteCandidatesMessage:fromClient:]( self,  "_handleGetRecommendRouteCandidatesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002DuLL:
      -[MRDAVRoutingServer _handleResumeNowPlayingSession:fromClient:]( self,  "_handleResumeNowPlayingSession:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002EuLL:
      -[MRDAVRoutingServer _handleDismissAllBannersMessage:fromClient:]( self,  "_handleDismissAllBannersMessage:fromClient:",  xdict,  v6);
      break;
    case 0x30000000000002FuLL:
      -[MRDAVRoutingServer _handlePauseOutputDeviceUIDsMessage:fromClient:]( self,  "_handlePauseOutputDeviceUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000030uLL:
      -[MRDAVRoutingServer _handleSearchEndpointsForOutputDeviceUIDsMessage:fromClient:]( self,  "_handleSearchEndpointsForOutputDeviceUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000031uLL:
      -[MRDAVRoutingServer _handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:fromClient:]( self,  "_handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000032uLL:
      -[MRDAVRoutingServer _handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:fromClient:]( self,  "_handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x300000000000033uLL:
      -[MRDAVRoutingServer _handleSearchEndpointsForRoutingContextUIDMessage:fromClient:]( self,  "_handleSearchEndpointsForRoutingContextUIDMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v5 = a3;
  id v6 = (void *)MRMediaRemoteCopyDeviceUID( objc_msgSend( v5,  "setSystemDiscoveryMode:",  -[MRDAVRoutingDataSource discoveryMode](routingDataSource, "discoveryMode")));
  [v5 setLocalReceiverPairingIdentity:v6];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer _createAirPlaySecuritySettings](self, "_createAirPlaySecuritySettings"));
  [v5 setAirplaySecuritySettings:v11];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController systemEndpointInfo]( self->_systemEndpointController,  "systemEndpointInfo"));
  [v5 setSystemActiveEndpoints:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController recentlyDismissedRecommendationsInfo]( self->_systemEndpointController,  "recentlyDismissedRecommendationsInfo"));
  [v5 setRecentlyDismissedSystemEndpoints:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAutoConnectionController autoConnectingEndpoints]( self->_autoConnectionController,  "autoConnectingEndpoints"));
  [v5 setAutoConnectingEndpoints:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAutoConnectionController autoConnectedEndpoints]( self->_autoConnectionController,  "autoConnectedEndpoints"));
  [v5 setAutoConnectedEndpoints:v10];

  [v5 setAutomaticRemoteControlConnections:self->_preemptiveRemoteControlConnectionManager];
  -[MRDAVHostedRoutingService collectDiagnostic:](self->_hostedRoutingService, "collectDiagnostic:", v5);
}

- (void)outputDeviceAuthorizationSession:(id)a3 didProvideAuthorizationRequest:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (unint64_t)[v5 status];
  if (v6 > 5) {
    id v8 = 0LL;
  }
  else {
    id v8 = off_1003A16C0[v6];
  }
  uint64_t v9 = _MRLogForCategory(0LL, v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v49 = v5;
    __int16 v50 = 2114;
    v51 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Received output device authorization request: %{public}@ (status = %{public}@)",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDevice]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  __int128 v13 = -[MRDAVOutputDeviceRoute initWithAVOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDAVOutputDeviceRoute),  "initWithAVOutputDevice:",  v11);
  -[MRDAVRoutingServer _postRouteStatusDidChangeNotificationForRoute:newStatus:]( self,  "_postRouteStatusDidChangeNotificationForRoute:newStatus:",  v13,  1LL);

  __int128 v15 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _savedPasswordForOutputDevice:]( self,  "_savedPasswordForOutputDevice:",  v11));
  if (v15)
  {
    uint64_t v16 = _MRLogForCategory(0LL, v14);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      *(_DWORD *)buf = 138543618;
      id v49 = v18;
      __int16 v50 = 2112;
      v51 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Authorization request using saved password for %{public}@: %@",  buf,  0x16u);
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10010A5D8;
    v44[3] = &unk_100399008;
    unsigned int v45 = v11;
    v46 = v15;
    v47 = self;
    id v19 = v11;
    [v5 respondWithAuthorizationToken:v46 completionHandler:v44];

    id v20 = v45;
  }

  else
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue([v5 authorizationTokenType]);
    id v21 = off_1003F7820();
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    unsigned int v23 = [v19 isEqualToString:v22];

    uint64_t v24 = 3LL;
    if (!v23) {
      uint64_t v24 = 1LL;
    }
    uint64_t v33 = v24;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10010A634;
    v41[3] = &unk_100398E60;
    id v25 = v12;
    id v42 = v25;
    v34 = v12;
    id v26 = v5;
    id v43 = v26;
    __int128 v27 = objc_retainBlock(v41);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10010A6F0;
    v35[3] = &unk_1003A1170;
    id v36 = v11;
    id v37 = v26;
    id v38 = v25;
    v39 = self;
    id v40 = v27;
    id v20 = v11;
    __int128 v28 = v27;
    __int128 v29 = objc_retainBlock(v35);
    __int128 v30 = objc_alloc(&OBJC_CLASS___MRDRouteAuthorizationRequest);
    __int128 v31 = -[MRDAVOutputDeviceRoute initWithAVOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDAVOutputDeviceRoute),  "initWithAVOutputDevice:",  v20);
    __int128 v32 = -[MRDRouteAuthorizationRequest initWithRoute:inputType:responseCallback:cancelCallback:]( v30,  "initWithRoute:inputType:responseCallback:cancelCallback:",  v31,  v33,  v29,  v28);

    -[MRDAVRoutingServer _handleAuthorizationRequest:](self, "_handleAuthorizationRequest:", v32);
    uint64_t v12 = v34;
  }
}

- (BOOL)outputDeviceAuthorizationSession:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5
{
  return self->_activePasswordDialog == 0LL;
}

- (void)_handleSetRouteDiscoveryModeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  objc_msgSend(v6, "setRouteDiscoveryMode:", xpc_dictionary_get_uint64(a3, "MRXPC_ROUTE_DISCOVERY_MODE_KEY"));
  uint64_t v8 = _MRLogForCategory(0LL, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _descriptionForDiscoveryMode:]( self,  "_descriptionForDiscoveryMode:",  [v6 routeDiscoveryMode]));
    int v12 = 138543618;
    __int128 v13 = v10;
    __int16 v14 = 2114;
    __int128 v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Client %{public}@ changed route discovery mode to %{public}@.",  (uint8_t *)&v12,  0x16u);
  }

  -[MRDAVRoutingServer _updateSystemRouteDiscoveryMode](self, "_updateSystemRouteDiscoveryMode");
}

- (void)_handleGetPickableRoutesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "MRXPC_ROUTE_CATEGORY_KEY");
  if (string) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v10 = (id)v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer pickableRoutesForCategory:](self, "pickableRoutesForCategory:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  200LL,  0LL,  0LL));
  sub_10013AC78(v5, (uint64_t)"MRXPC_ROUTES_DATA_KEY", v9, 0LL);
}

- (void)_handleSetPickedRouteMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MRCreatePropertyListFromXPCMessage(v6, "MRXPC_ROUTE_DESCRIPTION_DATA_KEY");
  uint64_t v9 = MRCreateStringFromXPCMessage(v6, "MRXPC_ROUTE_UID_KEY");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = MRCreateStringFromXPCMessage(v6, "MRXPC_ROUTE_PASSWORD_KEY");
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_ROUTE_OPTIONS_KEY");
  if (v8)
  {
    uint64_t v15 = _MRLogForCategory(0LL, v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
      __int128 v18 = (void *)MRMediaRemoteCopySetPickedRouteOptionsDescription(uint64);
      *(_DWORD *)buf = 138543874;
      id v38 = v17;
      __int16 v39 = 2114;
      id v40 = v8;
      __int16 v41 = 2114;
      id v42 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] %{public}@ requesting to pick route: %{public}@, options: %{public}@",  buf,  0x20u);
    }

    if (-[MRDAVRoutingServer setPickedRoute:withPassword:options:]( self,  "setPickedRoute:withPassword:options:",  v8,  v12,  uint64))
    {
      unsigned int v19 = 0;
    }

    else
    {
      unsigned int v19 = 7;
    }

    sub_10013AD7C(v6, v19);
  }

  else
  {
    uint64_t v20 = _MRLogForCategory(0LL, v13);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    __int128 v22 = v21;
    if (v10)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
        uint64_t v24 = (void *)MRMediaRemoteCopySetPickedRouteOptionsDescription(uint64);
        *(_DWORD *)buf = 138543874;
        id v38 = v23;
        __int16 v39 = 2114;
        id v40 = v10;
        __int16 v41 = 2114;
        id v42 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] %{public}@ requesting to pick route with UID: %{public}@, options: %{public}@",  buf,  0x20u);
      }

      id v25 = -[MRDAVReconnaissanceSession initWithRouteUID:]( objc_alloc(&OBJC_CLASS___MRDAVReconnaissanceSession),  "initWithRouteUID:",  v10);
      -[NSMutableSet addObject:](self->_reconnaissanceSessions, "addObject:", v25);
      uint64_t v27 = _MRLogForCategory(0LL, v26);
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Beginning AV reconnaissance session for route with UID: %{public}@",  buf,  0xCu);
      }

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v25);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10010AF2C;
      v29[3] = &unk_1003A1198;
      objc_copyWeak(&v33, (id *)buf);
      id v30 = v10;
      id v31 = v12;
      int v35 = uint64;
      objc_copyWeak(&v34, &location);
      id v32 = v6;
      -[MRDAVReconnaissanceSession beginSearchWithTimeout:completion:]( v25,  "beginSearchWithTimeout:completion:",  v29,  5.0);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1002B9324();
      }

      sub_10013AD7C(v6, 7u);
    }
  }
}

- (void)_handleGetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queryExistingPlayerPathForXPCMessage:v13 forClient:v5]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
    unsigned int v11 = [v10 volumeControlCapabilities];

    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  sub_10013AB4C(v13, (uint64_t)"MRXPC_ROUTE_VOLUME_CONTROL_CAPABILITIES_KEY", 0LL, v12, 0LL);
}

- (void)_handleSetPickedRouteHasVolumeControlMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queryExistingPlayerPathForXPCMessage:xdict forClient:v5]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);

  if (v9)
  {
    if ([v8 isLocalOrigin])
    {
      unsigned int v10 = 2;
    }

    else
    {
      int64_t int64 = xpc_dictionary_get_int64(xdict, "MRXPC_ROUTE_VOLUME_CONTROL_CAPABILITIES_KEY");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
      [v12 setVolumeControlCapabilities:int64];

      unsigned int v10 = 0;
    }
  }

  else
  {
    unsigned int v10 = [v8 error];
  }

  sub_10013AD7C(xdict, v10);
}

- (void)_handleGetExternalScreenTypeMessage:(id)a3 fromClient:(id)a4
{
  routingDataSource = self->_routingDataSource;
  id v5 = a3;
  sub_10013AB4C( v5,  (uint64_t)"MRXPC_ROUTE_EXTERNAL_SCREEN_TYPE_KEY",  1LL,  -[MRDAVRoutingDataSource externalScreenType](routingDataSource, "externalScreenType"),  0LL);
}

- (void)_handleGetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  uint64_t v5 = MRCreateStringFromXPCMessage(v4, "MRXPC_ROUTE_NAME_KEY");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6) {
    id v6 = (void *)MSVKeychainCopyKeychainValue(v6, @"com.apple.airplay.password");
  }
  id v8 = v6;
  sub_10013AB4C(v4, (uint64_t)"MRXPC_ROUTE_PASSWORD_KEY", 3, (uint64_t)[v8 UTF8String], 0);
}

- (void)_handleSetSavedAVRoutePasswordMessage:(id)a3 fromClient:(id)a4
{
  id v10 = a3;
  uint64_t v4 = MRCreateStringFromXPCMessage(v10, "MRXPC_ROUTE_NAME_KEY");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = MRCreateStringFromXPCMessage(v10, "MRXPC_ROUTE_PASSWORD_KEY");
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)v7;
  if (v5)
  {
    MSVKeychainSetKeychainValue(v7, v5, @"com.apple.airplay.password");
    unsigned int v9 = 0;
  }

  else
  {
    unsigned int v9 = 2;
  }

  sub_10013AD7C(v10, v9);
}

- (void)_handleClearAllAVRoutePasswordsMessage:(id)a3 fromClient:(id)a4
{
  uint64_t v4 = _MRLogForCategory(0LL, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Requesting to clear all AirPlay route passwords...",  buf,  2u);
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, kSecUseSystemKeychain);
  -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  @"com.apple.airplay.password",  kSecAttrService);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", kSecMatchLimitAll, kSecMatchLimit);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", kCFBooleanTrue, kSecReturnPersistentRef);
  CFTypeRef result = 0LL;
  uint64_t v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if ((_DWORD)v7 == -25300)
  {
    uint64_t v22 = _MRLogForCategory(0LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B9494();
    }
  }

  else
  {
    uint64_t v9 = v7;
    if ((_DWORD)v7)
    {
      uint64_t v23 = _MRLogForCategory(0LL, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002B942C(v9, v10, v24, v25, v26, v27, v28, v29);
      }
    }

    else
    {
      id v10 = (id)result;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v31,  v38,  16LL);
      if (v11)
      {
        id v12 = v11;
        id v30 = v6;
        uint64_t v13 = *(void *)v32;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
            uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, kSecValuePersistentRef);
            -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", kCFBooleanTrue, kSecReturnPersistentRef);
            OSStatus v17 = SecItemDelete((CFDictionaryRef)v16);
            if (v17)
            {
              OSStatus v19 = v17;
              uint64_t v20 = _MRLogForCategory(0LL, v18);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v37 = v19;
                _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[AVRoutingServer] Error %ld trying to delete passwords",  buf,  0xCu);
              }
            }
          }

          id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v31,  v38,  16LL);
        }

        while (v12);
        uint64_t v6 = v30;
      }
    }
  }
}

- (void)_handleUnpickAirPlayRoutesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Requesting to unpick AirPlay routes",  v10,  2u);
  }

  if (-[MRDAVRoutingDataSource unpickAirPlayRoutes](self->_routingDataSource, "unpickAirPlayRoutes")) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = 7;
  }
  sub_10013AD7C(v5, v9);
}

- (void)_handleSetApplicationPickedRoutes:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MRCreatePropertyListFromXPCMessage(v5, "MRXPC_ROUTES_DATA_KEY");
  BOOL v8 = xpc_dictionary_get_BOOL(v5, "MRXPC_ROUTE_OPTIONS_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Received SetApplicationPickedRoutes message with route descriptions: %{public}@",  buf,  0xCu);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      OSStatus v17 = 0LL;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = -[MRDAVRoute initWithDictionary:]( objc_alloc(&OBJC_CLASS___MRDAVRoute),  "initWithDictionary:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v17));
        -[NSMutableArray addObject:](v12, "addObject:", v18);

        OSStatus v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

  -[MRDAVRoutingServer _setApplicationPickedRoutes:updateRoutes:forClient:]( self,  "_setApplicationPickedRoutes:updateRoutes:forClient:",  v12,  v8,  v6);
}

- (void)_handleGetAirPlaySecuritySettingsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010BA44;
  v10[3] = &unk_100398E60;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleGetHostedRoutingXPCEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010BB50;
  v13[3] = &unk_100398F40;
  id v14 = v7;
  id v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_dictionary_handoff_reply(v9, workerQueue, v13, v11, v12);
}

- (void)_handleSetRecentAVOutputDeviceUIDMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateStringFromXPCMessage(v5, "MRXPC_ROUTE_UID_KEY");
  id v10 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableArray insertObject:atIndex:](self->_mostRecentlyPickedDevices, "insertObject:atIndex:");
  id v7 = -[NSMutableArray count](self->_mostRecentlyPickedDevices, "count");
  if ((unint64_t)v7 >= 2)
  {
    unint64_t v8 = (unint64_t)v7;
    id v9 = -[NSMutableArray indexOfObject:inRange:]( self->_mostRecentlyPickedDevices,  "indexOfObject:inRange:",  v10,  1LL,  (char *)-[NSMutableArray count](self->_mostRecentlyPickedDevices, "count") - 1);
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_mostRecentlyPickedDevices, "removeObjectAtIndex:", v9);
      --v8;
    }

    if (v8 >= 0xB) {
      -[NSMutableArray removeObjectsInRange:](self->_mostRecentlyPickedDevices, "removeObjectsInRange:", 10LL, v8 - 10);
    }
  }

  -[MRDAVRoutingServer _saveMostRecentlyPicked](self, "_saveMostRecentlyPicked");
  sub_10013AD7C(v5, 0);
}

- (void)_handleGetRecentAVOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  mostRecentlyPickedDevices = self->_mostRecentlyPickedDevices;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  mostRecentlyPickedDevices,  200LL,  0LL,  0LL));
  sub_10013AC78(v5, (uint64_t)"MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY", v6, 0LL);
}

- (void)_handleUpdateActiveSystemEndpointUIDMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010BEF8;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handleGetActiveSystemEndpointUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010C19C;
  v13[3] = &unk_100398F40;
  id v14 = v7;
  id v15 = v6;
  id v16 = self;
  id v9 = v6;
  id v10 = v7;
  xpc_dictionary_handoff_reply(v9, workerQueue, v13, v11, v12);
}

- (void)_handleGetHostedEndpointForDeviceUIDMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010C328;
  v13[3] = &unk_100398F40;
  id v14 = v7;
  id v15 = v6;
  id v16 = self;
  id v9 = v6;
  id v10 = v7;
  xpc_dictionary_handoff_reply(v9, workerQueue, v13, v11, v12);
}

- (void)_handlePromptForRouteAuthorizationMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10010C5B4;
  v22[3] = &unk_1003A0288;
  id v23 = v5;
  id v8 = v5;
  id v9 = objc_retainBlock(v22);
  id v10 = [v7 inputType];
  uint64_t v11 = objc_alloc(&OBJC_CLASS___MRDOutputDeviceRoute);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 route]);
  id v13 = -[MRDOutputDeviceRoute initWithOutputDevice:](v11, "initWithOutputDevice:", v12);

  id v14 = objc_alloc(&OBJC_CLASS___MRDRouteAuthorizationRequest);
  OSStatus v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  OSStatus v19 = sub_10010C694;
  __int128 v20 = &unk_100399EC0;
  id v21 = v9;
  id v15 = v9;
  id v16 = -[MRDRouteAuthorizationRequest initWithRoute:inputType:responseCallback:cancelCallback:]( v14,  "initWithRoute:inputType:responseCallback:cancelCallback:",  v13,  v10,  v15,  &v17);
  -[MRDAVRoutingServer _handleAuthorizationRequest:](self, "_handleAuthorizationRequest:", v16, v17, v18, v19, v20);
}

- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = [v11 status];
  id v8 = objc_alloc(&OBJC_CLASS___MRDOutputDeviceRoute);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 route]);
  id v10 = -[MRDOutputDeviceRoute initWithOutputDevice:](v8, "initWithOutputDevice:", v9);
  -[MRDAVRoutingServer _handleErrorStatus:forRoute:](self, "_handleErrorStatus:forRoute:", v7, v10);

  sub_10013ADE4(v5, 0LL);
}

- (void)_handleGetAirplayStatus:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010C7CC;
  v10[3] = &unk_100398E60;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleSetNearbyDevice:(id)a3 fromClient:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010C890;
  v5[3] = &unk_100399350;
  id v6 = a3;
  id v4 = v6;
  sub_10013ADE4(v4, v5);
}

- (void)_handleResetOutputContextMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010C918;
  v10[3] = &unk_100399250;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleAddVirtualOutputDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if (!_os_feature_enabled_impl("MediaRemote", "virtual_device")
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
        unsigned __int8 v5 = [v4 useAPSyncAPI],
        v4,
        (v5 & 1) == 0))
  {
    sub_10013ADE4(v6, &stru_1003A11B8);
  }
}

- (void)_handleGetVirtualOutputDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if (!_os_feature_enabled_impl("MediaRemote", "virtual_device")
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
        unsigned __int8 v5 = [v4 useAPSyncAPI],
        v4,
        (v5 & 1) == 0))
  {
    sub_10013ADE4(v6, &stru_1003A11D8);
  }
}

- (void)_handleCreateGroupWithDevices:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010CC14;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handleStartNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010CF18;
  v13[3] = &unk_100398F40;
  id v14 = v7;
  id v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_dictionary_handoff_reply(v9, workerQueue, v13, v11, v12);
}

- (void)_handleStopNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010D3AC;
  v13[3] = &unk_100398F40;
  id v14 = v7;
  id v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_dictionary_handoff_reply(v9, workerQueue, v13, v11, v12);
}

- (void)_handleResumeNowPlayingSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  workerQueue = self->_workerQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10010D4D0;
  v16[3] = &unk_100399880;
  id v17 = v7;
  id v18 = v9;
  OSStatus v19 = self;
  id v20 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v7;
  xpc_dictionary_handoff_reply(v11, workerQueue, v16, v14, v15);
}

- (void)_handleGetOutputContextUIDMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  if (qword_1003FDF68 != -1) {
    dispatch_once(&qword_1003FDF68, &stru_1003A1268);
  }
  uint64_t v5 = qword_1003FDF60;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010D614;
  v7[3] = &unk_1003A0288;
  id v8 = v4;
  id v6 = v4;
  MRMediaRemoteGetDeviceUIDWithRetryIntervals(&off_1003BBB58, v5, v7);
}

- (void)_handleMigrateFromEndpointToOutputDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010D770;
  v10[3] = &unk_100398E60;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleMigrateFromEndpointToEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010DC08;
  v10[3] = &unk_100398E60;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleCreateEndpointWithDevices:(id)a3 fromClient:(id)a4
{
}

- (void)_handleCreateDirectEndpointForDevices:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010E100;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handleGroupDevicesAndSendCommand:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010E444;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handleCreateHostedEndpointForDevices:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010EB1C;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handlePredictGroupLeader:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010F050;
  v13[3] = &unk_100398F40;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v9 = v7;
  id v10 = v6;
  xpc_dictionary_handoff_reply(v10, workerQueue, v13, v11, v12);
}

- (void)_handleRemoveFromParentGroup:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MRCreatePropertyListFromXPCMessage(v6, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  uint64_t v9 = MRCreateRequestDetailsFromXPCMessage(v6);
  id v10 = (MRRequestDetails *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
    uint64_t v12 = MRRequestDetailsInitiatorInfer;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v10 = -[MRRequestDetails initWithInitiator:requestID:reason:userInitiated:originatingBundleID:]( v11,  "initWithInitiator:requestID:reason:userInitiated:originatingBundleID:",  v12,  0LL,  @"RoutingServer.handleRemoveFromParentGroup",  0LL,  v13);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010F2FC;
  v15[3] = &unk_100399508;
  id v16 = v6;
  id v14 = v6;
  -[MRDAVRoutingServer removeOutputDeviceUIDsFromParentGroup:details:completion:]( self,  "removeOutputDeviceUIDsFromParentGroup:details:completion:",  v8,  v10,  v15);
}

- (void)_handleGetExternalDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003FDF78 != -1) {
    dispatch_once(&qword_1003FDF78, &stru_1003A1370);
  }
  if ([v7 isEntitledFor:0x8000])
  {
    uint64_t v8 = qword_1003FDF70;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10010F4C8;
    v11[3] = &unk_100398E60;
    id v12 = v6;
    id v13 = self;
    xpc_dictionary_handoff_reply(v12, v8, v11, v9, v10);
  }

  else
  {
    sub_10013ADE4(v6, &stru_1003A1390);
  }
}

- (void)_handleModifyOutputContextMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010F6C4;
  v10[3] = &unk_100399250;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleWillStartPlayingInterruptMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010FA24;
  v10[3] = &unk_100399250;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleRecommendRouteCandidateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] [MRDRRC] _handleRecommendRouteCandidateMessage: %@ fromClient: %@",  buf,  0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010FC1C;
  v12[3] = &unk_100399378;
  id v13 = v6;
  id v14 = self;
  id v11 = v6;
  sub_10013ADE4(v11, v12);
}

- (void)_handleGetRecommendRouteCandidatesMessage:(id)a3 fromClient:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self->_recommendationController, "recommender", a3, a4));
  [v4 requestCurrentContext];
}

- (void)_handleDismissAllBannersMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] _handleDismissAllBannersMessage: %@ fromClient: %@",  buf,  0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010FE0C;
  v11[3] = &unk_100399350;
  void v11[4] = self;
  sub_10013ADE4(v6, v11);
}

- (void)_handlePauseOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreatePropertyListFromXPCMessage(v4, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  id v6 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
  id v7 = (void *)MRCreateDataFromXPCMessage(v4, "MRXPC_REQUEST_DETAILS");
  uint64_t v8 = -[MRRequestDetails initWithData:](v6, "initWithData:", v7);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10010FF30;
  v14[3] = &unk_100399508;
  id v15 = v4;
  id v9 = v4;
  uint64_t v10 = objc_retainBlock(v14);
  qos_class_t v11 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v11, 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  +[MRDPauseOutputDevicesRequest pauseOutputDeviceUIDs:details:queue:completion:]( &OBJC_CLASS___MRDPauseOutputDevicesRequest,  "pauseOutputDeviceUIDs:details:queue:completion:",  v5,  v8,  v13,  v10);
}

- (void)_handleSearchEndpointsForOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100110038;
  v10[3] = &unk_100398E60;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingService hostedRoutingController]( self->_hostedRoutingService,  "hostedRoutingController"));
  id v15 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  __int16 v17 = -[NSMutableString initWithFormat:]( v15,  "initWithFormat:",  @"%@<%@>",  @"RoutingServer.searchEndpointsForOutputDeviceUID",  v16);

  if (v10) {
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" for %@", v10);
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 reason]);

  if (v18)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 reason]);
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" because %@", v20);
  }

  uint64_t v21 = _MRLogForCategory(10LL, v19);
  __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v57 = (const __CFString *)v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1001107D0;
  v49[3] = &unk_10039CA18;
  id v23 = v14;
  id v50 = v23;
  id v24 = v10;
  id v51 = v24;
  v52 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
  id v25 = v11;
  id v53 = v25;
  id v26 = v13;
  id v54 = v26;
  id v27 = v12;
  id v55 = v27;
  uint64_t v28 = objc_retainBlock(v49);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v23 availableEndpoints]);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100110CA0;
  v47[3] = &unk_1003A13E0;
  id v30 = v24;
  id v48 = v30;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "msv_firstWhere:", v47));

  if (!v31) {
    goto LABEL_15;
  }
  unsigned int v32 = [v31 isConnected];
  uint64_t v34 = _MRLogForCategory(10LL, v33);
  int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (!v32)
  {
    if (v36)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v25 requestID]);
      *(_DWORD *)buf = 138543874;
      v57 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
      __int16 v58 = 2114;
      v59 = v38;
      __int16 v60 = 2112;
      v61 = @"Found in hostedRouting but not connected";
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

LABEL_15:
    qos_class_t v39 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v39, 0LL);
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100110CAC;
    v42[3] = &unk_1003A1408;
    v46 = v28;
    id v43 = v23;
    v44 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
    id v45 = v25;
    +[MRDLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:details:queue:completion:]( &OBJC_CLASS___MRDLightweightReconnaissanceSession,  "searchEndpointsForOutputDeviceUID:timeout:details:queue:completion:",  v30,  v45,  v41,  v42,  a4);

    goto LABEL_16;
  }

  if (v36)
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v25 requestID]);
    *(_DWORD *)buf = 138543874;
    v57 = @"RoutingServer.searchEndpointsForOutputDeviceUID";
    __int16 v58 = 2114;
    v59 = v37;
    __int16 v60 = 2112;
    v61 = @"Found in hostedRouting";
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  ((void (*)(void *, void *, void))v28[2])(v28, v31, 0LL);
LABEL_16:
}

- (void)_handleSendCommandToEachEndpointContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100110FE0;
  v10[3] = &unk_100399250;
  id v11 = v5;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleSendCommandToNewGroupContainingOutputDeviceUIDsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001112D4;
  v10[3] = &unk_100398E60;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)_handleSearchEndpointsForRoutingContextUIDMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  workerQueue = self->_workerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001116D0;
  v10[3] = &unk_100398E60;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  xpc_dictionary_handoff_reply(v7, workerQueue, v10, v8, v9);
}

- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  __int16 v14 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  id v16 = -[NSMutableString initWithFormat:]( v14,  "initWithFormat:",  @"%@<%@>",  @"RoutingServer.searchEndpointsForRoutingContextUID",  v15);

  if (v10) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v10);
  }
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);

  if (v17)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" because %@", v19);
  }

  uint64_t v20 = _MRLogForCategory(10LL, v18);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100111C60;
  v46[3] = &unk_10039CA18;
  id v22 = v10;
  id v47 = v22;
  id v48 = @"RoutingServer.searchEndpointsForRoutingContextUID";
  id v49 = v11;
  id v50 = v13;
  id v51 = 0LL;
  id v52 = v12;
  id v23 = v12;
  id v24 = v13;
  id v25 = v11;
  id v26 = objc_retainBlock(v46);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 requestID]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100112080;
  v44[3] = &unk_100399530;
  uint64_t v29 = v26;
  id v45 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:&_dispatch_main_q queue:v44 handler:a4];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10011209C;
  v40[3] = &unk_100399120;
  v40[4] = self;
  id v41 = v22;
  id v42 = v30;
  id v43 = v29;
  __int128 v31 = v29;
  id v32 = v30;
  id v33 = v22;
  uint64_t v34 = objc_retainBlock(v40);
  int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100112264;
  v38[3] = &unk_10039D028;
  id v39 = v34;
  BOOL v36 = v34;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( [v35 addObserverForName:@"MRDHostedRoutingControllerAvailableExternalDevicesDidChangeNotification" object:0 queue:0 usingBlock:v38]);

  v36[2](v36);
}

- (void)systemEndpointController:(id)a3 activeSystemEndpointDidChangeForRequest:(id)a4 type:(int64_t)a5
{
  systemEndpointController = self->_systemEndpointController;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[MRDAVSystemEndpointController originClientForDeviceUID:]( systemEndpointController,  "originClientForDeviceUID:",  v9));

  -[MRDAVRoutingServer postSystemEndpointDeviceChange:type:originClient:handler:]( self,  "postSystemEndpointDeviceChange:type:originClient:handler:",  v8,  a5,  v10,  0LL);
  if (a5 == 2) {
    notify_post("com.apple.mediaremote.recommendedSystemEndpointDidChange");
  }
}

- (void)postSystemEndpointDeviceChange:(id)a3 type:(int64_t)a4 originClient:(id)a5 handler:(id)a6
{
  id v25 = a3;
  id v9 = a5;
  id v10 = (void (**)(id, void, NSMutableDictionary *))a6;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v12,  kMRMediaRemoteActiveEndpointTypeUserInfoKey);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v25 changeType]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey);

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 activeNowPlayingClient]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activePlayerClient]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v15 playbackState]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v16,  kMRMediaRemotePlaybackStateUserInfoKey);

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v25 reason]);
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v25 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v18,  kMRMediaRemoteActiveEndpointReasonUserInfoKey);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v25 outputDeviceUID]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 outputDeviceUID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v20,  kMRAVEndpointOutputDeviceIdentifierUserInfoKey);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
  MRAddPlayerPathToUserInfo(v11, v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);
  MRAddDeviceInfoToUserInfo(v11, v22);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v25,  MRUpdateActiveSystemEndpointRequestUserInfoKey);
  uint64_t v23 = _MRMediaRemoteActiveSystemEndpointDidChangeNotification;
  if (v10)
  {
    v10[2](v10, _MRMediaRemoteActiveSystemEndpointDidChangeNotification, v11);
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v24 postClientNotificationNamed:v23 userInfo:v11 predicate:&stru_1003A14E0];
  }
}

- (void)_clientInvalidatedNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[MRDAVRoutingServer _setApplicationPickedRoutes:updateRoutes:forClient:]( self,  "_setApplicationPickedRoutes:updateRoutes:forClient:",  0LL,  1LL,  v4);
  -[MRDAVRoutingServer _updateSystemRouteDiscoveryMode](self, "_updateSystemRouteDiscoveryMode");
}

- (void)_routingDataSourcePickableRoutesDidChangeNotification:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", a3));
  [v3 postClientNotificationNamed:kMRMediaRemotePickableRoutesDidChangeNotification];
}

- (void)_routingDataSourceExternalScreenDidChangeNotification:(id)a3
{
}

- (void)_routingDataSourceRouteStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MRDAVRoutingDataSourceAVRouteUserInfoKey"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MRDAVRoutingDataSourceRouteStatusUserInfoKey"]);
  id v9 = [v8 intValue];

  if (((_DWORD)v9 - 1) > 1)
  {
    if ((_DWORD)v9) {
      -[MRDAVRoutingServer _handleErrorStatus:forRoute:](self, "_handleErrorStatus:forRoute:", v9, v6);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    unsigned __int8 v11 = -[MRDAVRoutingServer _shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:]( self,  "_shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:",  v10,  0LL);

    if ((v11 & 1) != 0)
    {
      uint64_t v13 = _MRLogForCategory(0LL, v12);
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Ignoring VAD port authentication failure.",  v15,  2u);
      }
    }

    else
    {
      -[MRDAVRoutingServer _handleAuthenticationFailureForRoute:withOptions:]( self,  "_handleAuthenticationFailureForRoute:withOptions:",  v6,  0LL);
    }
  }

  self->_mostRecentStatus = (int)v9;
  -[MRDAVRoutingServer _postRouteStatusDidChangeNotificationForRoute:newStatus:]( self,  "_postRouteStatusDidChangeNotificationForRoute:newStatus:",  v6,  v9);
}

- (void)_failedToConnectToOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1002B97A4();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = off_1003F7828();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v10]);

  if (v11) {
    uint64_t v12 = -[MRDAVOutputDeviceRoute initWithAVOutputDevice:]( objc_alloc(&OBJC_CLASS___MRDAVOutputDeviceRoute),  "initWithAVOutputDevice:",  v11);
  }
  else {
    uint64_t v12 = 0LL;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v14 = off_1003F7830();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 objectForKey:v15]);

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v18 = off_1003F7838();
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v19]);

  uint64_t v21 = objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest);
  id v22 = (objc_class *)objc_opt_class(&OBJC_CLASS___MRGroupTopologyModificationRequest);
  uint64_t v23 = NSStringFromClass(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v48 = v20;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v24]);
  id v26 = -[MRGroupTopologyModificationRequest initWithData:](v21, "initWithData:", v25);

  uint64_t v29 = (void *)v16;
  if (v16)
  {
    id v44 = v4;
    id v45 = v12;
    v46 = v11;
    id v47 = self;
    id v30 = off_1003F7840();
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v49[0] = v31;
    v50[0] = &off_1003BB738;
    id v32 = off_1003F7848();
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v49[1] = v33;
    v50[1] = &off_1003BB750;
    id v34 = off_1003F7850();
    int v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v49[2] = v35;
    v50[2] = &off_1003BB768;
    id v36 = off_1003F7858();
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v49[3] = v37;
    v50[3] = &off_1003BB780;
    id v38 = off_1003F7860();
    id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    void v49[4] = v39;
    v50[4] = &off_1003BB798;
    uint64_t v40 = 5LL;
    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  5LL));
    id v42 = v29;
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v29]);

    if (v43) {
      uint64_t v40 = (uint64_t)[v43 intValue];
    }
    self = v47;

    uint64_t v12 = v45;
    unsigned __int8 v11 = v46;
    uint64_t v29 = v42;
    id v4 = v44;
    if (!v26) {
      goto LABEL_13;
    }
LABEL_12:
    id v27 = -[MRGroupTopologyModificationRequest suppressErrorDialog](v26, "suppressErrorDialog");
    goto LABEL_13;
  }

  uint64_t v40 = 5LL;
  if (v26) {
    goto LABEL_12;
  }
LABEL_13:
  if (MSVDeviceIsAppleTV(v27, v28)
    && [v11 clusterType] == (id)1
    && MRMediaRemoteAVOutputDeviceIsLocalForAirPlay(v11))
  {
    -[MRDAVRoutingServer _handleClusterErrorStatus:forRoute:](self, "_handleClusterErrorStatus:forRoute:", v40, v12);
  }

  else
  {
    -[MRDAVRoutingServer _handleErrorStatus:forRoute:](self, "_handleErrorStatus:forRoute:", v40, v12);
  }

- (void)_postRouteStatusDidChangeNotificationForRoute:(id)a3 newStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v11 = kMRMediaRemoteRouteStatusUserInfoKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  uint64_t v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v8 = [v7 mutableCopy];

  if (v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
    [v8 setObject:v9 forKey:kMRMediaRemoteRouteDescriptionUserInfoKey];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v10 postClientNotificationNamed:kMRMediaRemoteRouteStatusDidChangeNotification userInfo:v8];
}

- (void)_handleAuthorizationRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 route]);
  id v6 = [v4 inputType];
  routingDataSource = self->_routingDataSource;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
  id v9 = (void (**)(id, id, void *))objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource authorizationRequestCallbackForRouteID:]( routingDataSource,  "authorizationRequestCallbackForRouteID:",  v8));

  if (!v9)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MRDAVOutputDeviceRoute);
    if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0) {
      goto LABEL_8;
    }
    id v15 = self->_routingDataSource;
    id v16 = v5;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 avOutputDevice]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clusterID]);
    id v9 = (void (**)(id, id, void *))objc_claimAutoreleasedReturnValue( -[MRDAVRoutingDataSource authorizationRequestCallbackForRouteID:]( v15,  "authorizationRequestCallbackForRouteID:",  v18));

    if (!v9)
    {
LABEL_8:
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activePasswordDialog](self, "activePasswordDialog"));

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
      id v38 = 0LL;
      unsigned int v21 = -[MRDAVRoutingServer _shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:]( self,  "_shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:",  v20,  &v38);
      id v9 = (void (**)(id, id, void *))v38;

      if (!v19 && (v21 & 1) == 0)
      {
        uint64_t v23 = _MRLogForCategory(0LL, v22);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
          *(_DWORD *)buf = 138543362;
          id v43 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Prompting user with authorization request route %{public}@",  buf,  0xCu);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _passwordDialogForRouteWithName:usingInputType:]( self,  "_passwordDialogForRouteWithName:usingInputType:",  v26,  v6));

        __int128 v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472LL;
        id v33 = sub_1001130D8;
        id v34 = &unk_1003A1530;
        id v35 = v4;
        id v36 = v5;
        uint64_t v37 = self;
        [v27 presentWithCompletion:&v31];
        -[MRDAVRoutingServer setActivePasswordDialog:](self, "setActivePasswordDialog:", v27, v31, v32, v33, v34);

        goto LABEL_5;
      }

      if (v19)
      {
        uint64_t v28 = _MRLogForCategory(0LL, v22);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1002B9804();
        }
      }

      else
      {
        if (!v21)
        {
LABEL_20:
          [v4 cancel];
          goto LABEL_5;
        }

        uint64_t v30 = _MRLogForCategory(0LL, v22);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1002B9830();
        }
      }

      goto LABEL_20;
    }
  }

  uint64_t v11 = _MRLogForCategory(0LL, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    *(_DWORD *)buf = 138543362;
    id v43 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Handling authorization request with custom callback for route %{public}@",  buf,  0xCu);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100113000;
  v39[3] = &unk_1003A1508;
  id v40 = v5;
  id v41 = v4;
  v9[2](v9, v6, v39);

LABEL_5:
}

- (void)_registerNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_clientInvalidatedNotification:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];
  [v3 addObserver:self selector:"_routingDataSourcePickableRoutesDidChangeNotification:" name:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:self->_routingDataSource];
  [v3 addObserver:self selector:"_routingDataSourceExternalScreenDidChangeNotification:" name:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self->_routingDataSource];
  [v3 addObserver:self selector:"_routingDataSourceRouteStatusDidChangeNotification:" name:@"MRDAVRoutingDataSourceRouteStatusDidChangeNotification" object:self->_routingDataSource];
  id v4 = off_1003F7868();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[objc_class outputContextManagerForAllOutputContexts]( off_1003F7870(),  "outputContextManagerForAllOutputContexts");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 addObserver:self selector:"_failedToConnectToOutputDeviceNotification:" name:v5 object:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100113448;
  v13[3] = &unk_10039B878;
  void v13[4] = self;
  id v9 =  [v8 addObserverForName:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0 queue:0 usingBlock:v13];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100113450;
  v12[3] = &unk_10039B878;
  void v12[4] = self;
  id v11 =  [v10 addObserverForName:@"MRDMediaRemoteClientDeclaringAirplayActiveDidChange" object:0 queue:0 usingBlock:v12];
}

- (void)_unregisterNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (id)_descriptionForDiscoveryMode:(unsigned int)a3
{
  return (id)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(void *)&a3, a2);
}

- (id)_passwordDialogForRouteWithName:(id)a3 usingInputType:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 3) {
    id v6 = @"AIRPLAY_PIN_ALERT_TITLE";
  }
  else {
    id v6 = @"AIRPLAY_PASSWORD_ALERT_TITLE";
  }
  if (a4 == 3) {
    id v7 = @"AIRPLAY_PIN_ALERT_MESSAGE_FORMAT_%@";
  }
  else {
    id v7 = @"AIRPLAY_PASSWORD_ALERT_MESSAGE_FORMAT_%@";
  }
  uint64_t v8 = MRLocalizedString(v6, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = MRLocalizedString(v7, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = objc_alloc_init(&OBJC_CLASS___MSVSystemDialogOptions);
  [v12 setAlertHeader:v9];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v5));

  [v12 setAlertMessage:v13];
  uint64_t v14 = MRLocalizedString(@"OK", 0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v12 setDefaultButtonTitle:v15];

  uint64_t v16 = MRLocalizedString(@"CANCEL", 0LL);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v12 setAlternateButtonTitle:v17];

  [v12 setShowAsTopmost:1];
  [v12 setForceModalAlertAppearance:1];
  [v12 setShowOnLockscreen:1];
  [v12 setDismissOverlaysOnLockscreen:0];
  id v18 = -[MSVSystemDialog initWithOptions:](objc_alloc(&OBJC_CLASS___MSVSystemDialog), "initWithOptions:", v12);
  id v19 = [[MSVSystemDialogTextField alloc] initWithTitle:&stru_1003AE680];
  [v19 setSecure:1];
  [v19 setKeyboardType:a4];
  -[MSVSystemDialog addTextField:](v18, "addTextField:", v19);

  return v18;
}

- (void)_updateSystemRouteDiscoveryMode
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allClients]);

  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    LODWORD(v7) = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned int v10 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) routeDiscoveryMode];
        else {
          uint64_t v7 = v10;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if ((_DWORD)v7 != -[MRDAVRoutingDataSource discoveryMode](self->_routingDataSource, "discoveryMode"))
  {
    uint64_t v12 = _MRLogForCategory(0LL, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer _descriptionForDiscoveryMode:](self, "_descriptionForDiscoveryMode:", v7));
      *(_DWORD *)buf = 138543362;
      __int128 v31 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Updating system route discovery mode to %{public}@",  buf,  0xCu);
    }

    -[MRDAVRoutingDataSource setDiscoveryMode:](self->_routingDataSource, "setDiscoveryMode:", v7);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer discoveryTransaction](self, "discoveryTransaction"));

  if ((_DWORD)v7)
  {
    if (!v15)
    {
      __int16 v17 = -[MROSTransaction initWithName:]( objc_alloc(&OBJC_CLASS___MROSTransaction),  "initWithName:",  @"com.apple.mediaremoted.MRDAVRoutingServer");
      -[MRDAVRoutingServer setDiscoveryTransaction:](self, "setDiscoveryTransaction:", v17);

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer discoveryTransaction](self, "discoveryTransaction"));
      MRRegisterTransaction(v18);

      uint64_t v20 = _MRLogForCategory(0LL, v19);
      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer discoveryTransaction](self, "discoveryTransaction"));
        *(_DWORD *)buf = 138543362;
        __int128 v31 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Discovery enabled. Starting transaction: %{public}@",  buf,  0xCu);
      }
    }
  }

  else if (v15)
  {
    uint64_t v23 = _MRLogForCategory(0LL, v16);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer discoveryTransaction](self, "discoveryTransaction"));
      *(_DWORD *)buf = 138543362;
      __int128 v31 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Discovery ended. Clearing transaction %{public}@",  buf,  0xCu);
    }

    -[MRDAVRoutingServer setDiscoveryTransaction:](self, "setDiscoveryTransaction:", 0LL);
  }

- (BOOL)_shouldIgnorePortStatusFailureForRouteWithUID:(id)a3 previouslyCachedRouteUID:(id *)a4
{
  id v6 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v7 = self->_routeUIDsToIgnorePortStatusFailures;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(id *)(*((void *)&v23 + 1) + 8LL * (void)v12);

        id v14 = objc_msgSend(v6, "length", (void)v23);
        if (v14 >= [v10 length]) {
          id v15 = v10;
        }
        else {
          id v15 = v6;
        }
        id v16 = v15;
        id v17 = [v6 length];
        if (v17 <= [v10 length]) {
          id v18 = v10;
        }
        else {
          id v18 = v6;
        }
        unsigned int v19 = [v18 containsString:v16];

        if ((v19 & 1) != 0)
        {

          if (a4) {
            unsigned int v21 = v19;
          }
          else {
            unsigned int v21 = 0;
          }
          if (v21 == 1)
          {
            id v10 = v10;
            *a4 = v10;
          }

          BOOL v20 = 1;
          goto LABEL_23;
        }

        uint64_t v12 = (char *)v12 + 1;
        uint64_t v13 = v10;
      }

      while (v9 != v12);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v9) {
        continue;
      }
      break;
    }

    BOOL v20 = 0;
  }

  else
  {

    BOOL v20 = 0;
    id v10 = 0LL;
  }

- (void)_handleClusterErrorStatus:(int)a3 forRoute:(id)a4
{
  id v51 = a4;
  -[NSDate timeIntervalSinceNow](self->_lastClusterConnectionFailureDate, "timeIntervalSinceNow");
  double v8 = v7;
  BOOL v10 = v7 > -480.0 && self->_lastClusterConnectionFailureDate != 0LL;
  uint64_t v11 = _MRLogForCategory(0LL, v6);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = -v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Suppressing cluster connection error. %.2f since last alert",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    if (v13)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] Error connecting to cluster member: %{public}@",  (uint8_t *)&buf,  0xCu);
    }

    id v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastClusterConnectionFailureDate = self->_lastClusterConnectionFailureDate;
    self->_lastClusterConnectionFailureDate = v14;

    uint64_t v16 = MRLocalizedString(@"AIRPLAY_GENERIC_ERROR_ALERT_TITLE", 0LL);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((a3 - 7) > 2)
    {
      id v17 = @"AIRPLAY_CLUSTER_ATV_ALERT_MESSAGE";
    }

    else
    {
      id v17 = off_1003A16F0[a3 - 7];
      uint64_t v18 = MRLocalizedString(@"AIRPLAY_CLUSTER_ATV_ALERT_RELAYFAILED_TITLE", 0LL);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

      id v50 = (void *)v19;
    }

    uint64_t v20 = MRLocalizedString(v17, 0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);

    __int128 v24 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"Dialog.handleClusterErrorStatus",  v23);
    __int128 v26 = v24;
    if (v51) {
      -[NSMutableString appendFormat:](v24, "appendFormat:", @" for %@", v51);
    }
    uint64_t v27 = _MRLogForCategory(10LL, v25);
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v74 = 0x3032000000LL;
    v75 = sub_1001140E4;
    v76 = sub_1001140F4;
    id v77 = 0LL;
    uint64_t v67 = 0LL;
    v68 = &v67;
    uint64_t v69 = 0x3032000000LL;
    v70 = sub_1001140E4;
    v71 = sub_1001140F4;
    id v72 = 0LL;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1001140FC;
    v61[3] = &unk_1003A1558;
    id v62 = v51;
    id v29 = v23;
    id v63 = v29;
    id v49 = v21;
    id v64 = v49;
    v65 = &v67;
    p___int128 buf = &buf;
    uint64_t v30 = objc_retainBlock(v61);
    id v31 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_100114374;
    v59[3] = &unk_100399530;
    uint64_t v32 = v30;
    id v60 = v32;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_100114380;
    v56[3] = &unk_10039BAB8;
    id v33 = [v31 initWithTimeout:@"Cluster connect error" reason:v59 handler:300.0];
    id v57 = v33;
    id v34 = v32;
    id v58 = v34;
    id v35 = objc_retainBlock(v56);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    uint64_t v38 = MRAVEndpointDidAddOutputDeviceNotification;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_1001143CC;
    v54[3] = &unk_10039D028;
    id v39 = v35;
    id v55 = v39;
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v36 addObserverForName:v38 object:v37 queue:0 usingBlock:v54]);
    id v41 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v40;

    uint64_t v42 = MRLocalizedString(@"AIRPLAY_ATV_CLUSTER_TRY_AGAIN", 0LL);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    uint64_t v44 = MRLocalizedString(@"AIRPLAY_ATV_CLUSTER_CHANGE_DEFAULT_OUTPUT", 0LL);
    id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1001143DC;
    v52[3] = &unk_1003A1580;
    v52[4] = self;
    v46 = v39;
    id v53 = v46;
    uint64_t v47 = objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _presentDialogWithTitle:message:defaultButtonTitle:alternateButtonTitle:completion:]( self,  "_presentDialogWithTitle:message:defaultButtonTitle:alternateButtonTitle:completion:",  v50,  v12,  v43,  v45,  v52));
    id v48 = (void *)v68[5];
    v68[5] = v47;

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_launchTVClusterSettings
{
  uint64_t v4 = FBSOpenApplicationOptionKeyPayloadURL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=DefaultAudioOutput"));
  id v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  sub_10013B904(@"com.apple.TVSettings", (uint64_t)v3, &stru_1003A15A0);
}

- (void)_handleErrorStatus:(int)a3 forRoute:(id)a4
{
  id v6 = a4;
  double v8 = v6;
  if (self->_mostRecentStatus == a3
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]),
        unsigned __int8 v10 = -[MRDAVRoutingServer _shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:]( self,  "_shouldIgnorePortStatusFailureForRouteWithUID:previouslyCachedRouteUID:",  v9,  0LL),  v9,  (v10 & 1) != 0))
  {
    uint64_t v11 = _MRLogForCategory(0LL, v7);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      mostRecentStatus = (NSMutableSet *)self->_mostRecentStatus;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
      *(_DWORD *)__int128 buf = 134218242;
      uint64_t v42 = mostRecentStatus;
      __int16 v43 = 2114;
      uint64_t v44 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] AirPlay Error %ld: Ignoring because error for %{public}@ because the status code has not c hanged and already prompted user.",  buf,  0x16u);
    }

    uint64_t v16 = _MRLogForCategory(0LL, v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      routeUIDsToIgnorePortStatusFailures = self->_routeUIDsToIgnorePortStatusFailures;
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v42 = routeUIDsToIgnorePortStatusFailures;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] RouteUIDs ignored for port status failures: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 name]);
    uint64_t v20 = (void *)v19;
    unsigned int v21 = @"<Unknown>";
    if (v19) {
      unsigned int v21 = (__CFString *)v19;
    }
    id v17 = v21;

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 extendedInfo]);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 modelName]);
    unsigned int v24 = [v23 hasPrefix:@"AppleTV"];

    switch(a3)
    {
      case 6:
        uint64_t v29 = MRLocalizedString(@"AIRPLAY_GENERIC_ERROR_ALERT_TITLE", 0LL);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
        __int128 v28 = @"AIRPLAY_NOT_CONNETED_ALERT_MESSAGE_FORMAT_%@";
        break;
      case 4:
        uint64_t v30 = MRLocalizedString(@"AIRPLAY_GENERIC_ERROR_ALERT_TITLE", 0LL);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v30);
        __int128 v28 = @"AIRPLAY_OUT_OF_RANGE_ALERT_MESSAGE_FORMAT_%@";
        break;
      case 3:
        if (v24) {
          uint64_t v25 = @"AIRPLAY_BUSY_ATV_ALERT_TITLE";
        }
        else {
          uint64_t v25 = @"AIRPLAY_BUSY_ALERT_TITLE";
        }
        uint64_t v26 = MRLocalizedString(v25, 0LL);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        __int128 v28 = @"AIRPLAY_BUSY_ALERT_MESSAGE_FORMAT_%@";
        break;
      default:
        uint64_t v31 = MRLocalizedString(@"AIRPLAY_GENERIC_ERROR_ALERT_TITLE", 0LL);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v31);
        __int128 v28 = @"AIRPLAY_GENERIC_ALERT_MESSAGE_FORMAT_%@";
        break;
    }

    uint64_t v32 = MRLocalizedString(v28, 0LL);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v17));

    uint64_t v36 = _MRLogForCategory(0LL, v35);
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218498;
      uint64_t v42 = (NSMutableSet *)a3;
      __int16 v43 = 2114;
      uint64_t v44 = v27;
      __int16 v45 = 2114;
      v46 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] AirPlay Error %ld: %{public}@: %{public}@",  buf,  0x20u);
    }

    uint64_t v38 = MRLocalizedString(@"OK", 0LL);
    id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    id v40 =  -[MRDAVRoutingServer _presentDialogWithTitle:message:defaultButtonTitle:alternateButtonTitle:completion:]( self,  "_presentDialogWithTitle:message:defaultButtonTitle:alternateButtonTitle:completion:",  v27,  v34,  v39,  0LL,  0LL);
  }
}

- (id)_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = objc_alloc_init(&OBJC_CLASS___MSVSystemDialogOptions);
  [v17 setAlertHeader:v12];
  [v17 setAlertMessage:v13];
  [v17 setDefaultButtonTitle:v16];

  [v17 setAlternateButtonTitle:v15];
  [v17 setShowAsTopmost:1];
  [v17 setForceModalAlertAppearance:1];
  [v17 setShowOnLockscreen:1];
  [v17 setDismissOverlaysOnLockscreen:0];
  uint64_t v18 = -[MSVSystemDialog initWithOptions:](objc_alloc(&OBJC_CLASS___MSVSystemDialog), "initWithOptions:", v17);
  -[MSVSystemDialog dismiss](self->_activePasswordDialog, "dismiss");
  -[MRDAVRoutingServer setActivePasswordDialog:](self, "setActivePasswordDialog:", 0LL);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));

  if (v19)
  {
    uint64_t v21 = _MRLogForCategory(0LL, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = objc_opt_class(self);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));
      uint64_t v30 = objc_opt_class(v35);
      id v34 = v14;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v33 options]);
      id v36 = v12;
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v32 alertHeader]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 options]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 alertMessage]);
      *(_DWORD *)__int128 buf = 138545666;
      uint64_t v38 = v31;
      __int16 v39 = 2048;
      id v40 = self;
      __int16 v41 = 2114;
      uint64_t v42 = v30;
      __int16 v43 = 2048;
      uint64_t v44 = v23;
      __int16 v45 = 2114;
      v46 = v24;
      __int16 v47 = 2114;
      id v48 = v27;
      __int16 v49 = 2114;
      uint64_t v50 = objc_opt_class(v18);
      __int16 v51 = 2048;
      id v52 = v18;
      __int16 v53 = 2114;
      id v54 = v36;
      __int16 v55 = 2114;
      id v56 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[AVRoutingServer] <%{public}@: %p> Dismissing active dialog <%{public}@: %p - %{public}@: %{public}@> to present new dialog: <%{public}@: %p - %{public}@: %{public}@>",  buf,  0x66u);

      id v12 = v36;
      id v14 = v34;
    }

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer activeDialog](self, "activeDialog"));
    [v28 dismiss];
  }

  -[MRDAVRoutingServer setActiveDialog:](self, "setActiveDialog:", v18);
  -[MSVSystemDialog presentWithCompletion:](v18, "presentWithCompletion:", v14);

  return v18;
}

- (void)_handleAuthenticationFailureForRoute:(id)a3 withOptions:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  MSVKeychainSetKeychainValue(0LL, v6, @"com.apple.airplay.password");

  if (!self->_activePasswordDialog) {
    -[MRDAVRoutingServer _presentPasswordDialogForRoute:withOptions:]( self,  "_presentPasswordDialogForRoute:withOptions:",  v7,  v4);
  }
}

- (id)_existingKeychainAccountForOutputDevice:(id)a3 password:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifyingMACAddress]);
  if ((unint64_t)[v6 length] < 6)
  {
    unsigned __int8 v10 = 0LL;
LABEL_5:
    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 ID]);

    uint64_t v11 = MSVKeychainCopyKeychainValue(v7, @"com.apple.airplay.password");
    if (v11)
    {
      id v9 = (void *)v11;
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 name]);

      id v9 = (void *)MSVKeychainCopyKeychainValue(v12, @"com.apple.airplay.password");
      id v7 = (id)v12;
    }

    goto LABEL_9;
  }

  HardwareAddressToCString([v6 bytes], 6, v14);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  uint64_t v8 = MSVKeychainCopyKeychainValue(v7, @"com.apple.airplay.password");
  if (v8)
  {
    id v9 = (void *)v8;

    goto LABEL_9;
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);

  id v9 = (void *)MSVKeychainCopyKeychainValue(v10, @"com.apple.airplay.password");
  id v7 = v10;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_9:

  if (a4) {
    *a4 = v9;
  }

  return v7;
}

- (id)_savedPasswordForOutputDevice:(id)a3
{
  id v5 = 0LL;
  id v3 =  -[MRDAVRoutingServer _existingKeychainAccountForOutputDevice:password:]( self,  "_existingKeychainAccountForOutputDevice:password:",  a3,  &v5);
  return v5;
}

- (void)_clearPasswordForOutputDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _existingKeychainAccountForOutputDevice:password:]( self,  "_existingKeychainAccountForOutputDevice:password:",  a3,  0LL));
  if (v3)
  {
    uint64_t v4 = v3;
    MSVKeychainSetKeychainValue(0LL, v3, @"com.apple.airplay.password");
    id v3 = v4;
  }
}

- (void)_saveMostRecentlyPicked
{
}

- (void)_loadMostRecentlyPicked
{
  id v3 = (void *)CFPreferencesCopyAppValue(@"MostRecentlyUsedAVOutputDeviceUIDs", @"com.apple.mediaremote");
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = (NSMutableArray *)[v3 mutableCopy];
    mostRecentlyPickedDevices = self->_mostRecentlyPickedDevices;
    self->_mostRecentlyPickedDevices = v4;

    id v3 = v6;
  }
}

- (BOOL)_setPickedRoute:(id)a3 withPassword:(id)a4 options:(unsigned int)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  routeUIDsToIgnorePortStatusFailures = self->_routeUIDsToIgnorePortStatusFailures;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  if ((v5 & 1) != 0) {
    -[NSMutableSet addObject:](routeUIDsToIgnorePortStatusFailures, "addObject:", v11);
  }
  else {
    -[NSMutableSet removeObject:](routeUIDsToIgnorePortStatusFailures, "removeObject:", v11);
  }

  self->_mostRecentStatus = -1;
  BOOL v13 = -[MRDAVRoutingDataSource setPickedRoute:withPassword:]( self->_routingDataSource,  "setPickedRoute:withPassword:",  v8,  v9);
  if (!v13)
  {
    uint64_t v14 = _MRLogForCategory(0LL, v12);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B9914();
    }
  }

  return v13;
}

- (void)_postExternalScreenDidChange
{
  uint64_t v2 = -[MRDAVRoutingDataSource externalScreenType](self->_routingDataSource, "externalScreenType");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v4 = kMRMediaRemoteExternalScreenTypeDidChangeNotification;
  uint64_t v7 = kMRMediaRemoteExternalScreenTypeUserInfoKey;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v2));
  id v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v3 postClientNotificationNamed:v4 userInfo:v6];
}

- (void)_presentPasswordDialogForRoute:(id)a3 withOptions:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v7 postClientNotificationNamed:kMRMediaRemoteWillPresentRouteAuthenticationPromptNotification];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedInfo]);
  else {
    uint64_t v9 = 1LL;
  }
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _passwordDialogForRouteWithName:usingInputType:]( self,  "_passwordDialogForRouteWithName:usingInputType:",  v10,  v9));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011522C;
  v13[3] = &unk_1003A15C8;
  void v13[4] = self;
  id v14 = v6;
  unsigned int v15 = a4;
  id v12 = v6;
  [v11 presentWithCompletion:v13];
  -[MRDAVRoutingServer setActivePasswordDialog:](self, "setActivePasswordDialog:", v11);
}

- (void)_storePassword:(id)a3 forRoute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 MACAddress]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  id v11 = (id)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _preferredIdentifierForMACAddress:identifier:name:]( self,  "_preferredIdentifierForMACAddress:identifier:name:",  v8,  v9,  v10));
  MSVKeychainSetKeychainValue(v7, v11, @"com.apple.airplay.password");
}

- (void)_storePassword:(id)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifyingMACAddress]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 ID]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  id v11 = (id)objc_claimAutoreleasedReturnValue( -[MRDAVRoutingServer _preferredIdentifierForMACAddress:identifier:name:]( self,  "_preferredIdentifierForMACAddress:identifier:name:",  v8,  v9,  v10));
  MSVKeychainSetKeychainValue(v7, v11, @"com.apple.airplay.password");
}

- (id)_preferredIdentifierForMACAddress:(id)a3 identifier:(id)a4 name:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v7 length] < 6)
  {
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = v9;
    }
  }

  else
  {
    HardwareAddressToCString([v7 bytes], 6, v13);
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
  }

  id v11 = v10;

  return v11;
}

- (id)_createAirPlaySecuritySettings
{
  if (MRSupportsMediaControlReceiver(self, a2))
  {
    int v11 = 0;
    if (qword_1003FDFF0 != -1) {
      dispatch_once(&qword_1003FDFF0, &stru_1003A16A0);
    }
    if (qword_1003FDFF8 && dlsym((void *)qword_1003FDFF8, "APReceiverMediaRemoteXPCClient_CopyProperty"))
    {
      uint64_t v2 = (void *)((uint64_t (*)(uint64_t, uint64_t))off_1003F7938[0])( (uint64_t)@"AirPlaySecuritySetting",  (uint64_t)&v11);
      uint64_t v4 = v2;
      if (v11 || !v2)
      {
        uint64_t v7 = _MRLogForCategory(0LL, v3);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1002B9974(&v11, v8);
        }

        char v5 = 0LL;
      }

      else
      {
        char v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"password"]);
      }
    }

    else
    {
      char v5 = 0LL;
    }

    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    char v5 = 0LL;
  }

  id v9 = (void *)MRAVAirPlaySecuritySettingsCreate(v5, v6);

  return v9;
}

- (void)createEndpointForOutputDeviceIDs:(id)a3 details:(id)a4 completion:(id)a5
{
}

- (void)createEndpointForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5 completion:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100115728;
  v9[3] = &unk_1003A15F0;
  id v10 = a6;
  id v8 = v10;
  +[MRDCreateEndpointRequest createEndpointWithOutputDeviceUIDs:timeout:details:completion:]( &OBJC_CLASS___MRDCreateEndpointRequest,  "createEndpointWithOutputDeviceUIDs:timeout:details:completion:",  a3,  a5,  v9,  30.0);
}

- (id)createTransientEndpointForOutputDeviceUID:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 requestID]);
  int v11 = -[NSMutableString initWithFormat:]( v9,  "initWithFormat:",  @"%@<%@>",  @"createTransientEndpointForOutputDeviceUID",  v10);

  if (v6) {
    -[NSMutableString appendFormat:](v11, "appendFormat:", @" for %@", v6);
  }
  uint64_t v13 = _MRLogForCategory(10LL, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v40 = (const __CFString *)v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingService hostedRoutingController]( self->_hostedRoutingService,  "hostedRoutingController"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 availableOutputDevices]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100115B2C;
  v37[3] = &unk_10039AC00;
  id v17 = v6;
  id v38 = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_firstWhere:", v37));
  if (v18)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingService hostedRoutingController]( self->_hostedRoutingService,  "hostedRoutingController"));
    __int16 v47 = v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 makeEndpointWithOutputDevices:v20 options:0]);
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 debugName]);

  uint64_t v24 = _MRLogForCategory(10LL, v23);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v7 requestID]);
      id v36 = v7;
      __int128 v28 = v8;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v21 debugName]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v30 timeIntervalSinceDate:v28];
      *(_DWORD *)__int128 buf = 138544130;
      id v40 = @"createTransientEndpointForOutputDeviceUID";
      __int16 v41 = 2114;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = v29;
      __int16 v45 = 2048;
      uint64_t v46 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds",  buf,  0x2Au);

      id v8 = v28;
      id v7 = v36;
    }
  }

  else if (v26)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v7 requestID]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v33 timeIntervalSinceDate:v8];
    *(_DWORD *)__int128 buf = 138543874;
    id v40 = @"createTransientEndpointForOutputDeviceUID";
    __int16 v41 = 2114;
    uint64_t v42 = v32;
    __int16 v43 = 2048;
    uint64_t v44 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
  }

  return v21;
}

- (void)removeOutputDeviceUIDsFromParentGroup:(id)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaremote.removeFromParentGroup", v12);

  id v14 = objc_alloc(&OBJC_CLASS___NSMutableString);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);
  id v16 = -[NSMutableString initWithFormat:]( v14,  "initWithFormat:",  @"%@<%@>",  @"removeOutputDeviceUIDsFromParentGroup",  v15);

  if (v7) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v7);
  }
  uint64_t v18 = _MRLogForCategory(10LL, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v59 = 0x3032000000LL;
  id v60 = sub_1001140E4;
  v61 = sub_1001140F4;
  id v62 = 0LL;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100116010;
  v51[3] = &unk_1003A1618;
  p___int128 buf = &buf;
  id v35 = v8;
  id v52 = v35;
  id v32 = v10;
  id v53 = v32;
  id v31 = v9;
  id v54 = v31;
  id v33 = objc_retainBlock(v51);
  uint64_t v20 = dispatch_group_create();
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceInfo]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceUID]);

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v7;
  id v24 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        if ([v27 isEqualToString:v23])
        {
          __int128 v28 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( +[MRAVLocalEndpoint sharedLocalEndpoint]( &OBJC_CLASS___MRAVLocalEndpoint,  "sharedLocalEndpoint"));
          dispatch_group_enter(v20);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_100116168;
          v44[3] = &unk_100398F68;
          uint64_t v46 = &buf;
          __int16 v45 = v20;
          -[dispatch_group_s removeOutputDeviceFromParentGroup:queue:completion:]( v28,  "removeOutputDeviceFromParentGroup:queue:completion:",  v23,  v13,  v44);
        }

        else
        {
          dispatch_group_enter(v20);
          id v56 = v27;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v56,  1LL));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = sub_1001161B4;
          v39[3] = &unk_1003A1640;
          id v40 = v20;
          __int16 v41 = v27;
          uint64_t v42 = v13;
          __int16 v43 = &buf;
          -[MRDAVRoutingServer createEndpointForOutputDeviceIDs:details:completion:]( self,  "createEndpointForOutputDeviceIDs:details:completion:",  v29,  v35,  v39);

          __int128 v28 = v40;
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    }

    while (v24);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001162E4;
  block[3] = &unk_100399EC0;
  id v38 = v33;
  uint64_t v30 = v33;
  dispatch_group_notify(v20, v13, block);

  _Block_object_dispose(&buf, 8);
}

- (id)_predictGroupLeaderForOutputDeviceIDs:(id)a3 options:(unint64_t)a4 details:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  dispatch_queue_attr_t v11 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  dispatch_queue_t v13 = -[NSMutableString initWithFormat:](v11, "initWithFormat:", @"%@<%@>", @"PredictGroupLeader", v12);

  if (v8) {
    -[NSMutableString appendFormat:](v13, "appendFormat:", @" for %@", v8);
  }
  uint64_t v15 = _MRLogForCategory(10LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v38 = (const __CFString *)v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingService hostedRoutingController]( self->_hostedRoutingService,  "hostedRoutingController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 availableOutputDevices]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100116628;
  v35[3] = &unk_10039AC00;
  id v19 = v8;
  id v36 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "msv_filter:", v35));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingService hostedRoutingController]( self->_hostedRoutingService,  "hostedRoutingController"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 determineGroupLeaderForOutputDevices:v20 options:a4 | 0x3E]);

  uint64_t v24 = _MRLogForCategory(10LL, v23);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v28 timeIntervalSinceDate:v10];
      *(_DWORD *)__int128 buf = 138544130;
      id v38 = @"PredictGroupLeader";
      __int16 v39 = 2114;
      id v40 = v27;
      __int16 v41 = 2112;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v29;
      uint64_t v30 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v31 = v25;
      uint32_t v32 = 42;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
  }

  else if (v26)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v28 timeIntervalSinceDate:v10];
    *(_DWORD *)__int128 buf = 138543874;
    id v38 = @"PredictGroupLeader";
    __int16 v39 = 2114;
    id v40 = v27;
    __int16 v41 = 2048;
    uint64_t v42 = v33;
    uint64_t v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v31 = v25;
    uint32_t v32 = 32;
    goto LABEL_10;
  }

  return v22;
}

- (void)_reevaluateAirplayActive
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v4 = [v3 supportMultiplayerHost];

  if (v4)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    char v5 = (void *)objc_claimAutoreleasedReturnValue([v6 allClients]);
    -[MRDAVRoutingServer setAirplayActive:](self, "setAirplayActive:", objc_msgSend(v5, "mr_any:", &stru_1003A1660));
  }

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDAVHostedRoutingService)hostedRoutingService
{
  return self->_hostedRoutingService;
}

- (MRDAVSystemEndpointController)systemEndpointController
{
  return self->_systemEndpointController;
}

- (MRDRouteRecommendationController)recommendationController
{
  return self->_recommendationController;
}

- (BOOL)airplayActive
{
  return self->_airplayActive;
}

- (MSVSystemDialog)activePasswordDialog
{
  return self->_activePasswordDialog;
}

- (void)setActivePasswordDialog:(id)a3
{
}

- (MSVSystemDialog)activeDialog
{
  return (MSVSystemDialog *)objc_loadWeakRetained((id *)&self->_activeDialog);
}

- (void)setActiveDialog:(id)a3
{
}

- (MROSTransaction)discoveryTransaction
{
  return self->_discoveryTransaction;
}

- (void)setDiscoveryTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end