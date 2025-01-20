@interface CSDFaceTimeProviderDelegate
- (BOOL)providerDelegate:(id)a3 isExclusivelyManagingCallWithUUID:(id)a4;
- (BOOL)providerDelegate:(id)a3 isManagingCallWithUUID:(id)a4;
- (BOOL)shouldUseIDSDemuxer;
- (CPApplicationMonitor)applicationMonitor;
- (CPBiomeSessionDonator)cpBiomeStreamDonator;
- (CPConversationManagerHost)conversationManagerHost;
- (CSDBlockUtilitiesProtocol)blockUtilities;
- (CSDConversationManager)conversationManager;
- (CSDConversationManagerXPCServer)conversationManagerXPCServer;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeConversationProviderDelegate)faceTimeConversationProviderDelegate;
- (CSDFaceTimeIDSProviderDelegate)faceTimeIDSProviderDelegate;
- (CSDFaceTimeIMAVProviderDelegate)faceTimeIMAVProviderDelegate;
- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer;
- (CSDFaceTimeProviderDelegate)init;
- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 chManager:(id)a5;
- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 featureFlags:(id)a5 blockUtilities:(id)a6 shouldUseIDSDemuxer:(BOOL)a7 chManager:(id)a8;
- (CSDGFTServiceConversationProviderDelegate)groupFaceTimeServiceProviderDelegate;
- (CSDNeighborhoodActivityConduit)conduit;
- (CSDProviderCallDataSource)callDataSource;
- (CXProvider)provider;
- (NSMutableDictionary)delayedActionsByCallUUID;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit;
- (id)ISOCountryCodeForCallWithUUID:(id)a3;
- (id)_createJoinCallAction:(id)a3 outgoingCallerID:(id)a4 gftOneToOneDestinations:(id)a5;
- (id)providerConfiguration;
- (void)_createDelayedActionListIfNecessary:(id)a3;
- (void)_processDelayedActionList:(id)a3 provider:(id)a4;
- (void)dealloc;
- (void)deferReportingAudioFinishedForCallWithUUID:(id)a3;
- (void)initiateModernFTInviteForAction:(id)a3 destinations:(id)a4 excludedIMAVDestinations:(id)a5 joinCallActionToFulfill:(id)a6;
- (void)provider:(id)a3 didActivateAudioSession:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5;
- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 endedAtDate:(id)a5 withReason:(int64_t)a6 failureContext:(id)a7;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)providerDelegate:(id)a3 endOtherProvidersCallWithUUID:(id)a4;
- (void)providerDelegate:(id)a3 requestedTransaction:(id)a4 completion:(id)a5;
- (void)providerDelegate:(id)a3 requestedUpgradeToExistingCallForConversation:(id)a4 withSessionToken:(id)a5 completion:(id)a6;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)setCallDataSource:(id)a3;
- (void)setFaceTimeConversationProviderDelegate:(id)a3;
- (void)setFaceTimeIDSProviderDelegate:(id)a3;
- (void)setFaceTimeIMAVProviderDelegate:(id)a3;
- (void)setFaceTimeInviteDemuxer:(id)a3;
- (void)setGroupFaceTimeServiceProviderDelegate:(id)a3;
- (void)setServerBag:(id)a3;
- (void)updateProviderConfigurationWithSenderIdentities:(id)a3;
@end

@implementation CSDFaceTimeProviderDelegate

- (CSDFaceTimeProviderDelegate)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDFaceTimeProviderDelegate.m",  79,  @"%s is not available. Use a designated initializer instead.",  "-[CSDFaceTimeProviderDelegate init]");

  return 0LL;
}

- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 chManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v12 = objc_alloc_init(&OBJC_CLASS___CSDBlockUtilities);
  -[TUFeatureFlags conversationOneToOneModeEnabled](v11, "conversationOneToOneModeEnabled");
  v13 = -[CSDFaceTimeProviderDelegate initWithCallSource:queue:featureFlags:blockUtilities:shouldUseIDSDemuxer:chManager:]( self,  "initWithCallSource:queue:featureFlags:blockUtilities:shouldUseIDSDemuxer:chManager:",  v10,  v9,  v11,  v12,  0LL,  v8);

  return v13;
}

- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 featureFlags:(id)a5 blockUtilities:(id)a6 shouldUseIDSDemuxer:(BOOL)a7 chManager:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v64 = a6;
  id v17 = a8;
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___CSDFaceTimeProviderDelegate;
  v18 = -[CSDFaceTimeProviderDelegate init](&v68, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a4);
    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate queue](v19, "queue"));
    dispatch_assert_queue_V2(v20);

    objc_storeStrong((id *)&v19->_featureFlags, a5);
    v21 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v19->_serverBag;
    v19->_serverBag = (CSDConversationServerBag *)v21;

    objc_storeStrong((id *)&v19->_blockUtilities, a6);
    v19->_shouldUseIDSDemuxer = a7;
    v23 = objc_alloc_init(&OBJC_CLASS___CSDFaceTimeInviteDemuxer);
    faceTimeInviteDemuxer = v19->_faceTimeInviteDemuxer;
    v19->_faceTimeInviteDemuxer = v23;

    v25 = -[CSDFaceTimeIDSProviderDelegate initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate),  "initWithQueue:",  v15);
    faceTimeIDSProviderDelegate = v19->_faceTimeIDSProviderDelegate;
    v19->_faceTimeIDSProviderDelegate = v25;

    -[CSDFaceTimeIDSProviderDelegate setFaceTimeDemuxerDelegate:]( v19->_faceTimeIDSProviderDelegate,  "setFaceTimeDemuxerDelegate:",  v19);
    v27 = -[CSDFaceTimeIMAVProviderDelegate initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDFaceTimeIMAVProviderDelegate),  "initWithQueue:",  v15);
    faceTimeIMAVProviderDelegate = v19->_faceTimeIMAVProviderDelegate;
    v19->_faceTimeIMAVProviderDelegate = v27;

    -[CSDFaceTimeIMAVProviderDelegate setFaceTimeDemuxerDelegate:]( v19->_faceTimeIMAVProviderDelegate,  "setFaceTimeDemuxerDelegate:",  v19);
    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    delayedActionsByCallUUID = v19->_delayedActionsByCallUUID;
    v19->_delayedActionsByCallUUID = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___CPApplicationController);
    v32 = objc_alloc_init(&OBJC_CLASS___CSDConversationInvitationResolver);
    v33 = objc_alloc(&OBJC_CLASS___CSDConversationManager);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[CSDReportingController sharedInstanceWithQueue:]( &OBJC_CLASS___CSDReportingController,  "sharedInstanceWithQueue:",  v15));
    v35 = -[CSDConversationManager initWithReportingController:cpApplicationController:invitationResolver:]( v33,  "initWithReportingController:cpApplicationController:invitationResolver:",  v34,  v31,  v32);
    conversationManager = v19->_conversationManager;
    v19->_conversationManager = v35;

    v37 = -[CSDConversationManagerXPCServer initWithConversationManager:featureFlags:]( objc_alloc(&OBJC_CLASS___CSDConversationManagerXPCServer),  "initWithConversationManager:featureFlags:",  v19->_conversationManager,  v19->_featureFlags);
    conversationManagerXPCServer = v19->_conversationManagerXPCServer;
    v19->_conversationManagerXPCServer = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v40 = [v39 deviceType];

    if (v40 != (id)7 && (TUSharePlayForceDisabled() & 1) == 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 neighborhoodActivityConduit]);
      neighborhoodActivityConduit = v19->_neighborhoodActivityConduit;
      v19->_neighborhoodActivityConduit = (TUNeighborhoodActivityConduit *)v42;
    }

    v44 = -[CPBiomeSessionDonator initWithDataSource:parentQueue:]( objc_alloc(&OBJC_CLASS___CPBiomeSessionDonator),  "initWithDataSource:parentQueue:",  v19->_conversationManager,  v15);
    cpBiomeStreamDonator = v19->_cpBiomeStreamDonator;
    v19->_cpBiomeStreamDonator = v44;

    v46 = -[CPConversationManagerHost initWithDataSource:]( objc_alloc(&OBJC_CLASS___CPConversationManagerHost),  "initWithDataSource:",  v19->_conversationManager);
    conversationManagerHost = v19->_conversationManagerHost;
    v19->_conversationManagerHost = v46;

    v48 = -[CPApplicationMonitor initWithApplicationController:queue:]( objc_alloc(&OBJC_CLASS___CPApplicationMonitor),  "initWithApplicationController:queue:",  v31,  v15);
    applicationMonitor = v19->_applicationMonitor;
    v19->_applicationMonitor = v48;

    -[CSDConversationManager addObserver:queue:]( v19->_conversationManager,  "addObserver:queue:",  v19->_applicationMonitor,  v15);
    v50 = -[CSDFaceTimeConversationProviderDelegate initWithConversationManager:queue:invitationResolver:]( objc_alloc(&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate),  "initWithConversationManager:queue:invitationResolver:",  v19->_conversationManager,  v15,  v32);
    faceTimeConversationProviderDelegate = v19->_faceTimeConversationProviderDelegate;
    v19->_faceTimeConversationProviderDelegate = v50;

    -[CSDAbstractFaceTimeConversationProviderDelegate setFaceTimeDemuxerDelegate:]( v19->_faceTimeConversationProviderDelegate,  "setFaceTimeDemuxerDelegate:",  v19);
    if ([v16 groupFacetimeAsAServiceEnabled])
    {
      v52 = -[CSDGFTServiceConversationProviderDelegate initWithConversationManager:queue:invitationResolver:]( objc_alloc(&OBJC_CLASS___CSDGFTServiceConversationProviderDelegate),  "initWithConversationManager:queue:invitationResolver:",  v19->_conversationManager,  v15,  v32);
      groupFaceTimeServiceProviderDelegate = v19->_groupFaceTimeServiceProviderDelegate;
      v19->_groupFaceTimeServiceProviderDelegate = v52;

      -[CSDAbstractFaceTimeConversationProviderDelegate setFaceTimeDemuxerDelegate:]( v19->_groupFaceTimeServiceProviderDelegate,  "setFaceTimeDemuxerDelegate:",  v19);
      objc_initWeak(&location, v19);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_1000A96B4;
      v65[3] = &unk_1003D9358;
      objc_copyWeak(&v66, &location);
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      [v54 setBeginListeningBlock:v65];

      objc_destroyWeak(&v66);
      objc_destroyWeak(&location);
    }

    int v55 = TUSimulatedModeEnabled();
    v56 = &off_1003D5E18;
    v57 = v19->_conversationManager;
    if (!v55) {
      v56 = off_1003D5DA0;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v56, "sharedInstance"));
    -[CSDConversationManager beginListeningOnService:](v57, "beginListeningOnService:", v58);

    -[CSDConversationManager generateAllInactiveLinks](v19->_conversationManager, "generateAllInactiveLinks");
    id v59 = objc_alloc(&OBJC_CLASS___CXInProcessProvider);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate providerConfiguration](v19, "providerConfiguration"));
    v61 = (CXProvider *)[v59 initWithConfiguration:v60 callSource:v14];
    provider = v19->_provider;
    v19->_provider = v61;

    -[CXProvider setDelegate:queue:](v19->_provider, "setDelegate:queue:", v19, v19->_queue);
  }

  return v19;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate conversationManagerXPCServer](self, "conversationManagerXPCServer"));
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDFaceTimeProviderDelegate;
  -[CSDFaceTimeProviderDelegate dealloc](&v4, "dealloc");
}

- (id)providerConfiguration
{
  v2 = objc_alloc_init(&OBJC_CLASS___CXProviderConfiguration);
  -[CXProviderConfiguration setMaximumCallGroups:](v2, "setMaximumCallGroups:", 2LL);
  -[CXProviderConfiguration setMaximumCallsPerCallGroup:](v2, "setMaximumCallsPerCallGroup:", 1LL);
  -[CXProviderConfiguration setSupportsAudioOnly:](v2, "setSupportsAudioOnly:", 1LL);
  -[CXProviderConfiguration setSupportsVideo:](v2, "setSupportsVideo:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1003F1720, &off_1003F1738, 0LL));
  -[CXProviderConfiguration setSupportedHandleTypes:](v2, "setSupportedHandleTypes:", v3);

  return v2;
}

- (id)ISOCountryCodeForCallWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ISOCountryCodeForCallWithUUID:v4]);

  return v6;
}

- (void)updateProviderConfigurationWithSenderIdentities:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  [v5 updateProviderConfigurationWithSenderIdentities:v4];
}

- (void)deferReportingAudioFinishedForCallWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0LL, 1750000000LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A9A04;
  v8[3] = &unk_1003D7758;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, v8);
}

- (void)_createDelayedActionListIfNecessary:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v8]);

  if (!v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (void)_processDelayedActionList:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
    id v12 = [v11 copy];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
    [v13 setObject:0 forKeyedSubscript:v6];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _callWithUUID:v6]);

    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Processing delayed actions:%@", buf, 0xCu);
      }

      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v17 = (os_log_s *)v12;
      id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v17);
            }
            -[CSDFaceTimeProviderDelegate provider:performSetRelayingCallAction:]( self,  "provider:performSetRelayingCallAction:",  v7,  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i),  (void)v23);
          }

          id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        }

        while (v20);
      }
    }

    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not processing delayed actions because we no longer have a call",  buf,  2u);
    }
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "providerDelegate: %@ callUUID: %@ dateStartedConnecting: %@",  (uint8_t *)&v18,  0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate provider](self, "provider"));
  [v13 reportOutgoingCallWithUUID:v9 startedConnectingAtDate:v10];

  -[CSDFaceTimeProviderDelegate providerDelegate:endOtherProvidersCallWithUUID:]( self,  "providerDelegate:endOtherProvidersCallWithUUID:",  v8,  v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _callWithUUID:v9]);

  if (!v15)
  {
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ending call since dataSource is not tracking any call for callUUID: %@",  (uint8_t *)&v18,  0xCu);
    }

    [v8 endCallWithUUIDAsLocalHangup:v9];
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "providerDelegate: %@ callUUID: %@ dateConnected: %@",  (uint8_t *)&v18,  0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate provider](self, "provider"));
  [v13 reportOutgoingCallWithUUID:v9 connectedAtDate:v10];

  -[CSDFaceTimeProviderDelegate providerDelegate:endOtherProvidersCallWithUUID:]( self,  "providerDelegate:endOtherProvidersCallWithUUID:",  v8,  v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _callWithUUID:v9]);

  if (!v15)
  {
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ending call since dataSource is not tracking any call for callUUID: %@",  (uint8_t *)&v18,  0xCu);
    }

    [v8 endCallWithUUIDAsLocalHangup:v9];
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 endedAtDate:(id)a5 withReason:(int64_t)a6 failureContext:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v61 = v11;
    __int16 v62 = 2112;
    id v63 = v12;
    __int16 v64 = 2112;
    int64_t v65 = (int64_t)v13;
    __int16 v66 = 2048;
    int64_t v67 = a6;
    __int16 v68 = 2112;
    id v69 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "providerDelegate: %@ callUUID: %@ dateEnded: %@ endedReason: %ld failureContext: %@",  buf,  0x34u);
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v19 = v18;
  if (v17 == v11)
  {
    v59[0] = v18;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
    v59[1] = v22;
    id v23 = v59;
  }

  else
  {

    if (v19 == v11)
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
      v58[0] = v19;
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
      v58[1] = v22;
      id v23 = v58;
    }

    else
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));

      if (v20 != v11)
      {
        id v21 = 0LL;
        goto LABEL_11;
      }

      id v19 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
      v57[0] = v19;
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
      v57[1] = v22;
      id v23 = v57;
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));

LABEL_11:
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v24 = v21;
  id v25 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
  id v44 = v11;
  id obj = v24;
  id v42 = v14;
  id v43 = v13;
  if (v25)
  {
    id v26 = v25;
    int v27 = 0;
    int v28 = 0;
    uint64_t v29 = *(void *)v52;
LABEL_13:
    uint64_t v30 = 0LL;
    while (1)
    {
      if (*(void *)v52 != v29) {
        objc_enumerationMutation(obj);
      }
      v31 = *(void **)(*((void *)&v51 + 1) + 8 * v30);
      v28 |= objc_msgSend(v31, "hasCallStartedConnectingWithUUID:", v12, v42, v43, v44);
      v27 |= [v31 isManagingCallWithUUID:v12];
      if ((v28 & 1) != 0 && (v27 & 1) != 0) {
        goto LABEL_39;
      }
      if (v26 == (id)++v30)
      {
        id v24 = obj;
        id v26 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v26) {
          goto LABEL_13;
        }

        id v13 = v43;
        id v11 = v44;
        id v14 = v42;
        if ((v28 & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_40;
      }
    }
  }

  LOBYTE(v27) = 0;
LABEL_23:
  if (a6 == 2)
  {
LABEL_26:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate provider](self, "provider", v42, v43, v44));
    v33 = v32;
    if (v14) {
      [v32 reportCallWithUUID:v12 failedAtDate:v13 withContext:v14];
    }
    else {
      [v32 reportCallWithUUID:v12 endedAtDate:v13 privateReason:a6];
    }

    -[CSDFaceTimeProviderDelegate deferReportingAudioFinishedForCallWithUUID:]( self,  "deferReportingAudioFinishedForCallWithUUID:",  v12);
LABEL_30:
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v34 = v24;
    id v35 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          id v40 = sub_1001704C4();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v61 = v12;
            __int16 v62 = 2112;
            id v63 = v39;
            __int16 v64 = 2048;
            int64_t v65 = a6;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Ending call with UUID %@ on other provider delegate %@ because ended reason was %ld",  buf,  0x20u);
          }

          [v39 endCallWithUUIDAsDeclinedElsewhere:v12];
        }

        id v36 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }

      while (v36);
    }

- (void)providerDelegate:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "providerDelegate: %@ transaction: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate provider](self, "provider"));
  [v13 requestTransaction:v9 completion:v10];
}

- (void)providerDelegate:(id)a3 requestedUpgradeToExistingCallForConversation:(id)a4 withSessionToken:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, id, id, id, id, void *, void *, void *))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v21 = (id)objc_claimAutoreleasedReturnValue([v12 upgradeCallForConversation:v11 withSessionToken:v10]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 callForConversation:v11 withSessionToken:v10]);

  id v15 = [v14 isMuted];
  id v16 = [v14 isSendingVideo];
  id v17 = [v14 isVideo];
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v14 upgradeSessionUUID]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteFromID]);
  v9[2](v9, v21, v15, v16, v17, v18, v19, v20);
}

- (BOOL)providerDelegate:(id)a3 isManagingCallWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _callWithUUID:v5]);

  return v7 != 0LL;
}

- (BOOL)providerDelegate:(id)a3 isExclusivelyManagingCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v10 = v9;
  if (v8 == v6)
  {
LABEL_7:
    if (([v9 isManagingCallWithUUID:v7] & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
LABEL_12:
      int v14 = v13;
      unsigned int v12 = [v13 isManagingCallWithUUID:v7] ^ 1;

      goto LABEL_13;
    }

- (void)providerDelegate:(id)a3 endOtherProvidersCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "providerDelegate: %@ ending callUUID %@",  (uint8_t *)&v17,  0x16u);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v12 = v11;
  if (v10 == v6) {
    goto LABEL_9;
  }

  if (v12 == v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
    id v12 = v11;
LABEL_9:
    [v11 endCallWithUUIDAsAnsweredElsewhere:v7];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    goto LABEL_10;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));

  if (v13 == v6)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
    [v14 endCallWithUUIDAsAnsweredElsewhere:v7];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
LABEL_10:
    id v16 = v15;
    [v15 endCallWithUUIDAsAnsweredElsewhere:v7];
  }
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  [v6 providerDidBegin:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  [v7 providerDidBegin:v4];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
  [v8 providerDidBegin:v4];

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
  [v9 providerDidBegin:v4];
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  [v6 providerDidReset:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  [v7 providerDidReset:v4];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
  [v8 providerDidReset:v4];

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
  [v9 providerDidReset:v4];
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] action: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[CSDFaceTimeProviderDelegate provider:performStartCallAction:shouldUseIDSDemuxer:]( self,  "provider:performStartCallAction:shouldUseIDSDemuxer:",  v7,  v6,  -[CSDFaceTimeProviderDelegate shouldUseIDSDemuxer](self, "shouldUseIDSDemuxer"));
}

- (void)provider:(id)a3 performStartCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate blockUtilities](self, "blockUtilities"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString handle](v9, "handle"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
  uint64_t v16 = (uint64_t)[v12 blockCallReasonForHandles:v14 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider" callDataSource:v15];

  if (v16 >= 1)
  {
    int v17 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate blockUtilities](self, "blockUtilities"));
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
    -[__CFString reportFailureForReason:provider:callUUID:actionToFail:]( v17,  "reportFailureForReason:provider:callUUID:actionToFail:",  v16,  v8,  v18,  v9);
    goto LABEL_27;
  }

  if (!a5)
  {
    int v17 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString handle](v9, "handle"));
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[__CFString value](v17, "value"));
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v18 IDSFormattedDestinationID]);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v44));
    -[CSDFaceTimeProviderDelegate initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:]( self,  "initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:",  v9,  v45,  &__NSArray0__struct,  0LL);

    goto LABEL_27;
  }

  int v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[TUCallCapabilities outgoingRelayCallerID]( &OBJC_CLASS___TUCallCapabilities,  "outgoingRelayCallerID"));
  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "outgoingCallerID: %@", buf, 0xCu);
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
  -[CSDFaceTimeProviderDelegate _createDelayedActionListIfNecessary:](self, "_createDelayedActionListIfNecessary:", v21);

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate featureFlags](self, "featureFlags"));
  if ([v22 uPlusOneSessionWithCapabilitiesEnabled])
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate serverBag](self, "serverBag"));
    unsigned int v24 = [v23 isUPlusOneSessionCapabilitiesEnabled];

    if (v24)
    {
      id v25 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate _createJoinCallAction:outgoingCallerID:gftOneToOneDestinations:]( self,  "_createJoinCallAction:outgoingCallerID:gftOneToOneDestinations:",  v9,  v17,  0LL));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v26 timeIntervalSinceDate:v18];
      double v28 = v27 * 1000.0;

      if (v28 > 5000.0)
      {
        uint64_t v66 = TUCallTUStartCallActionDuration;
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringValue]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingString:@"ms duration"]);
        int64_t v67 = v31;
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));

        id v33 = sub_1001704C4();
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
          *(_DWORD *)buf = 138412546;
          id v63 = v35;
          __int16 v64 = 2112;
          int64_t v65 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "reportJoinDurationLongerThanThreasholdForCallUUID: %@, %@",  buf,  0x16u);
        }

        id v36 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
        [v36 reportJoinDurationLongerThanThreasholdForCallUUID:v37 report:v32];
      }

      id v38 = sub_1001704C4();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Created join call action without gftOneToOneDestinations: %@",  buf,  0xCu);
      }

      -[CSDFaceTimeProviderDelegate provider:performJoinCallAction:shouldUseIDSDemuxer:]( self,  "provider:performJoinCallAction:shouldUseIDSDemuxer:",  v8,  v25,  0LL);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString handle](v9, "handle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 value]);
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 IDSFormattedDestinationID]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v42));
      -[CSDFaceTimeProviderDelegate initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:]( self,  "initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:",  v9,  v43,  &__NSArray0__struct,  0LL);

      goto LABEL_27;
    }
  }

  else
  {
  }

  id v46 = sub_1001704C4();
  __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate featureFlags](self, "featureFlags"));
    else {
      __int128 v49 = @"NO";
    }
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate serverBag](self, "serverBag"));
    unsigned int v51 = [v50 isUPlusOneSessionCapabilitiesEnabled];
    __int128 v52 = @"NO";
    if (v51) {
      __int128 v52 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v63 = v49;
    __int16 v64 = 2112;
    int64_t v65 = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "uPlusOneSessionWithCapabilitiesEnabled: %@, isUPlusOneSessionCapabilitiesEnabled: %@",  buf,  0x16u);
  }

  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeInviteDemuxer](self, "faceTimeInviteDemuxer"));
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString handle](v9, "handle"));
  int v55 = (void *)objc_claimAutoreleasedReturnValue([v54 tuHandle]);
  id v56 = -[__CFString isVideo](v9, "isVideo");
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  void v57[2] = sub_1000AB3C8;
  v57[3] = &unk_1003D93A8;
  v57[4] = self;
  v58 = v9;
  int v17 = v17;
  id v59 = v17;
  id v18 = v18;
  id v60 = v18;
  id v61 = v8;
  [v53 idsPeersForHandle:v55 video:v56 fromID:v17 completionHandler:v57];

LABEL_27:
}

- (void)initiateModernFTInviteForAction:(id)a3 destinations:(id)a4 excludedIMAVDestinations:(id)a5 joinCallActionToFulfill:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000ABB58;
  v19[3] = &unk_1003D93D0;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 inviteIDSPeersWithAction:v18 destinations:v15 joinCallActionToFulfill:v16 completion:v19];
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (-[CSDFaceTimeProviderDelegate shouldUseIDSDemuxer](self, "shouldUseIDSDemuxer"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteMembers]);
    if ([v7 count] == (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 associationIdentifier]);
      -[CSDFaceTimeProviderDelegate provider:performJoinCallAction:shouldUseIDSDemuxer:]( self,  "provider:performJoinCallAction:shouldUseIDSDemuxer:",  v9,  v6,  v8 == 0LL);
    }

    else
    {
      -[CSDFaceTimeProviderDelegate provider:performJoinCallAction:shouldUseIDSDemuxer:]( self,  "provider:performJoinCallAction:shouldUseIDSDemuxer:",  v9,  v6,  0LL);
    }
  }

  else
  {
    -[CSDFaceTimeProviderDelegate provider:performJoinCallAction:shouldUseIDSDemuxer:]( self,  "provider:performJoinCallAction:shouldUseIDSDemuxer:",  v9,  v6,  0LL);
  }
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v9, "UUID"));
    *(_DWORD *)buf = 138412290;
    v88 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Perform join call with action UUID: %@",  buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate blockUtilities](self, "blockUtilities"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString remoteMembers](v9, "remoteMembers"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
  uint64_t v16 = (uint64_t)[v13 blockCallReasonForHandles:v14 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider" callDataSource:v15];

  if (v16 < 1)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString pseudonym](v9, "pseudonym"));
    if ([v19 length])
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString publicKey](v9, "publicKey"));
      id v21 = [v20 length];

      if (v21)
      {
        int v22 = 1;
        goto LABEL_11;
      }
    }

    else
    {
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString remoteMembers](v9, "remoteMembers"));
    id v24 = [v23 count];

    if (!v24)
    {
      id v40 = sub_1001704C4();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1002B4A24();
      }
      goto LABEL_24;
    }

    int v22 = 0;
LABEL_11:
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
    unsigned int v27 = [v25 isUpgradingCallWithUUID:v26];

    if (v27)
    {
      id v28 = sub_1001704C4();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1002B4A50();
      }
LABEL_24:

      -[__CFString fail](v9, "fail");
      goto LABEL_57;
    }

    if ((-[__CFString isVideo](v9, "isVideo") & 1) == 0
      && -[__CFString isVideoEnabled](v9, "isVideoEnabled"))
    {
      id v30 = sub_1001704C4();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1002B4A7C();
      }
      goto LABEL_24;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
    unsigned int v33 = [v31 isManagingCallWithUUID:v32];

    if (v33)
    {
      -[__CFString setUpgrade:](v9, "setUpgrade:", 1LL);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 upgradeSessionUUIDForCallWithUUID:v35]);
      -[__CFString setUpgradeSessionUUID:](v9, "setUpgradeSessionUUID:", v36);

      id v37 = sub_1001704C4();
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v9;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Updated to action: %@", buf, 0xCu);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
      [v39 provider:v8 performJoinCallAction:v9];
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
      unsigned int v43 = [v41 isManagingCallWithUUID:v42];

      if (!v43)
      {
LABEL_30:
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString conversationProviderIdentifier](v9, "conversationProviderIdentifier"));
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 tuConversationProviderForIdentifier:v48]);

        if (((v22 | !v5) & 1) == 0 && [v49 isDefaultProvider])
        {
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
          -[CSDFaceTimeProviderDelegate _createDelayedActionListIfNecessary:]( self,  "_createDelayedActionListIfNecessary:",  v50);

          unsigned int v51 = (__CFString *)objc_claimAutoreleasedReturnValue( +[TUCallCapabilities outgoingRelayCallerID]( &OBJC_CLASS___TUCallCapabilities,  "outgoingRelayCallerID"));
          id v52 = sub_1001704C4();
          __int128 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v51;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "joinCall: callerID: %@", buf, 0xCu);
          }

          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate featureFlags](self, "featureFlags"));
          if ([v54 uPlusOneSessionWithCapabilitiesEnabled])
          {
            int v55 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate serverBag](self, "serverBag"));
            unsigned int v56 = [v55 isUPlusOneSessionCapabilitiesEnabled];

            if (v56)
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
              [v57 provider:v8 performJoinCallAction:v9];

              v58 = objc_alloc(&OBJC_CLASS___CXStartCallAction);
              id v59 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
              id v60 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString remoteMembers](v9, "remoteMembers"));
              id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 anyObject]);
              __int16 v62 = -[CXStartCallAction initWithCallUUID:handle:](v58, "initWithCallUUID:handle:", v59, v61);

              -[CXStartCallAction setVideo:](v62, "setVideo:", -[__CFString isVideo](v9, "isVideo"));
              id v63 = (void *)objc_claimAutoreleasedReturnValue(-[CXStartCallAction handle](v62, "handle"));
              __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v63 value]);
              int64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 IDSFormattedDestinationID]);
              uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v65));
              -[CSDFaceTimeProviderDelegate initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:]( self,  "initiateModernFTInviteForAction:destinations:excludedIMAVDestinations:joinCallActionToFulfill:",  v62,  v66,  &__NSArray0__struct,  0LL);

              goto LABEL_55;
            }
          }

          else
          {
          }

          id v72 = sub_1001704C4();
          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate featureFlags](self, "featureFlags"));
            else {
              v75 = @"NO";
            }
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate serverBag](self, "serverBag"));
            unsigned int v77 = [v76 isUPlusOneSessionCapabilitiesEnabled];
            v78 = @"NO";
            if (v77) {
              v78 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            v88 = v75;
            __int16 v89 = 2112;
            v90 = v78;
            _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "uPlusOneSessionWithCapabilitiesEnabled: %@, isUPlusOneSessionCapabilitiesEnabled: %@",  buf,  0x16u);
          }

          v79 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeInviteDemuxer](self, "faceTimeInviteDemuxer"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString remoteMembers](v9, "remoteMembers"));
          v81 = (void *)objc_claimAutoreleasedReturnValue([v80 anyObject]);
          v82 = (void *)objc_claimAutoreleasedReturnValue([v81 tuHandle]);
          id v83 = -[__CFString isVideo](v9, "isVideo");
          v84[0] = _NSConcreteStackBlock;
          v84[1] = 3221225472LL;
          v84[2] = sub_1000AC8C0;
          v84[3] = &unk_1003D9420;
          v84[4] = self;
          v85 = v9;
          id v86 = v8;
          [v79 idsPeersForHandle:v82 video:v83 fromID:v51 completionHandler:v84];

          goto LABEL_55;
        }

        if (!v49)
        {
LABEL_56:

          goto LABEL_57;
        }

        unsigned int v67 = [v49 isDefaultProvider];
        id v68 = sub_1001704C4();
        id v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
        if (v67)
        {
          if (v70)
          {
            *(_DWORD *)buf = 138412290;
            v88 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Sending JoinCallAction to FaceTimeConversationProviderDelegate- action: %@",  buf,  0xCu);
          }

          v71 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
        }

        else
        {
          if (v70)
          {
            *(_DWORD *)buf = 138412290;
            v88 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Sending JoinCallAction to CSDGFTServiceConversationProviderDelegate- action: %@",  buf,  0xCu);
          }

          v71 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
        }

        unsigned int v51 = v71;
        -[__CFString provider:performJoinCallAction:](v71, "provider:performJoinCallAction:", v8, v9);
LABEL_55:

        goto LABEL_56;
      }

      id v44 = sub_1001704C4();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Found a IMAV chat that is being tracked for action: %@",  buf,  0xCu);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
      [v39 endCallWithUUID:v46];
    }

    goto LABEL_30;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate blockUtilities](self, "blockUtilities"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString callUUID](v9, "callUUID"));
  [v17 reportFailureForReason:v16 provider:v8 callUUID:v18 actionToFail:v9];

LABEL_57:
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v55 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v54 = [v31 isManagingCallWithUUID:v32];

    id v6 = v55;
    if ((v54 & 1) != 0) {
      goto LABEL_7;
    }
    id v33 = sub_1001704C4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 _callWithUUID:v36]);

    if (v37)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v39]);
      if (v40)
      {
        uint64_t v42 = (void *)v40;
        uint64_t v43 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v41);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v43);

        if ((isKindOfClass & 1) != 0)
        {
          id v46 = sub_1001704C4();
          __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v7;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v49]);
          [v50 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v51 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v45);
      if ((objc_opt_isKindOfClass(v7, v51) & 1) != 0
        && ([v37 status] == 5 || objc_msgSend(v37, "status") == 6))
      {
        id v52 = sub_1001704C4();
        unsigned __int8 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v57 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }

    id v54 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v53 = [v30 isManagingCallWithUUID:v31];

    id v6 = v54;
    if ((v53 & 1) != 0) {
      goto LABEL_7;
    }
    id v32 = sub_1001704C4();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _callWithUUID:v35]);

    if (v36)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
      if (v39)
      {
        uint64_t v41 = (void *)v39;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v40);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v42);

        if ((isKindOfClass & 1) != 0)
        {
          id v45 = sub_1001704C4();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v7;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);
          [v49 addObject:v7];

          goto LABEL_33;
        }
      }

      else
      {
      }

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v44);
      if ((objc_opt_isKindOfClass(v7, v50) & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }

    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isBottomUpMute] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
    objc_msgSend(v8, "setUplinkMuted:", objc_msgSend(v7, "isMuted"));
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIDSProviderDelegate](self, "faceTimeIDSProviderDelegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate faceTimeIMAVProviderDelegate](self, "faceTimeIMAVProviderDelegate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
  if (([v11 isManagingCallWithUUID:v12] & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    if ([v13 isManagingCallWithUUID:v14])
    {

      goto LABEL_7;
    }

    id v55 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    unsigned __int8 v54 = [v31 isManagingCallWithUUID:v32];

    id v6 = v55;
    if ((v54 & 1) != 0) {
      goto LABEL_9;
    }
    id v33 = sub_1001704C4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[WARN] No provider delegate is managing call for action %@",  buf,  0xCu);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate callDataSource](self, "callDataSource"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 _callWithUUID:v36]);

    if (v37)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v39]);
      if (v40)
      {
        uint64_t v42 = (void *)v40;
        uint64_t v43 = objc_opt_class(&OBJC_CLASS___CXSetRelayingCallAction, v41);
        char isKindOfClass = objc_opt_isKindOfClass(v7, v43);

        if ((isKindOfClass & 1) != 0)
        {
          id v46 = sub_1001704C4();
          __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v7;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate delayedActionsByCallUUID](self, "delayedActionsByCallUUID"));
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v49]);
          [v50 addObject:v7];

          goto LABEL_35;
        }
      }

      else
      {
      }

      uint64_t v51 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v45);
      if ((objc_opt_isKindOfClass(v7, v51) & 1) != 0
        && ([v37 status] == 5 || objc_msgSend(v37, "status") == 6))
      {
        id v52 = sub_1001704C4();
        unsigned __int8 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v57 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Fulfilling action %@ because call has ended",  buf,  0xCu);
        }

        [v7 fulfill];
        goto LABEL_35;
      }
    }

    [v7 fail];
LABEL_35:

    goto LABEL_17;
  }

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
  char v8 = objc_opt_respondsToSelector(v7, "provider:didActivateAudioSession:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    [v9 provider:v13 didActivateAudioSession:v6];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
  char v11 = objc_opt_respondsToSelector(v10, "provider:didActivateAudioSession:");

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    [v12 provider:v13 didActivateAudioSession:v6];
  }
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
  char v8 = objc_opt_respondsToSelector(v7, "provider:didDeactivateAudioSession:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate faceTimeConversationProviderDelegate]( self,  "faceTimeConversationProviderDelegate"));
    [v9 provider:v13 didDeactivateAudioSession:v6];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
  char v11 = objc_opt_respondsToSelector(v10, "provider:didDeactivateAudioSession:");

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeProviderDelegate groupFaceTimeServiceProviderDelegate]( self,  "groupFaceTimeServiceProviderDelegate"));
    [v12 provider:v13 didDeactivateAudioSession:v6];
  }
}

- (id)_createJoinCallAction:(id)a3 outgoingCallerID:(id)a4 gftOneToOneDestinations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = objc_alloc(&OBJC_CLASS___CXJoinCallAction);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 callUUID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  int v14 = -[CXJoinCallAction initWithCallUUID:groupUUID:](v11, "initWithCallUUID:groupUUID:", v12, v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v15));
  -[CXJoinCallAction setRemoteMembers:](v14, "setRemoteMembers:", v16);

  -[CXJoinCallAction setVideoEnabled:](v14, "setVideoEnabled:", [v8 isVideo]);
  -[CXJoinCallAction setVideo:](v14, "setVideo:", [v8 isVideo]);
  -[CXJoinCallAction setRelay:](v14, "setRelay:", [v8 isRelay]);
  else {
    uint64_t v17 = 1LL;
  }
  -[CXJoinCallAction setAvMode:](v14, "setAvMode:", v17);
  -[CXJoinCallAction setPresentationMode:](v14, "setPresentationMode:", 0LL);
  -[CXJoinCallAction setConversationProviderIdentifier:]( v14,  "setConversationProviderIdentifier:",  @"com.apple.telephonyutilities.callservicesd.FaceTimeProvider");
  if (v10)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
    -[CXJoinCallAction setRemotePushTokens:](v14, "setRemotePushTokens:", v18);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 localSenderIdentityUUID]);

  if (v19)
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeProviderDelegate conversationManager](self, "conversationManager"));
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 localSenderIdentityUUID]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 callerIDHandleForSenderIdentityUUID:v21 callerID:v9]);

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v22));
      -[CXJoinCallAction setCallerID:](v14, "setCallerID:", v23);
    }
  }

  return v14;
}

- (CSDConversationManagerXPCServer)conversationManagerXPCServer
{
  return self->_conversationManagerXPCServer;
}

- (CPConversationManagerHost)conversationManagerHost
{
  return self->_conversationManagerHost;
}

- (CPBiomeSessionDonator)cpBiomeStreamDonator
{
  return self->_cpBiomeStreamDonator;
}

- (CPApplicationMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit
{
  return self->_neighborhoodActivityConduit;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDBlockUtilitiesProtocol)blockUtilities
{
  return self->_blockUtilities;
}

- (BOOL)shouldUseIDSDemuxer
{
  return self->_shouldUseIDSDemuxer;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)delayedActionsByCallUUID
{
  return self->_delayedActionsByCallUUID;
}

- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer
{
  return self->_faceTimeInviteDemuxer;
}

- (void)setFaceTimeInviteDemuxer:(id)a3
{
}

- (CSDFaceTimeIDSProviderDelegate)faceTimeIDSProviderDelegate
{
  return self->_faceTimeIDSProviderDelegate;
}

- (void)setFaceTimeIDSProviderDelegate:(id)a3
{
}

- (CSDFaceTimeIMAVProviderDelegate)faceTimeIMAVProviderDelegate
{
  return self->_faceTimeIMAVProviderDelegate;
}

- (void)setFaceTimeIMAVProviderDelegate:(id)a3
{
}

- (CSDFaceTimeConversationProviderDelegate)faceTimeConversationProviderDelegate
{
  return self->_faceTimeConversationProviderDelegate;
}

- (void)setFaceTimeConversationProviderDelegate:(id)a3
{
}

- (CSDGFTServiceConversationProviderDelegate)groupFaceTimeServiceProviderDelegate
{
  return self->_groupFaceTimeServiceProviderDelegate;
}

- (void)setGroupFaceTimeServiceProviderDelegate:(id)a3
{
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDProviderCallDataSource)callDataSource
{
  return (CSDProviderCallDataSource *)objc_loadWeakRetained((id *)&self->_callDataSource);
}

- (void)setCallDataSource:(id)a3
{
}

- (CSDNeighborhoodActivityConduit)conduit
{
  return self->_conduit;
}

- (void).cxx_destruct
{
}

@end