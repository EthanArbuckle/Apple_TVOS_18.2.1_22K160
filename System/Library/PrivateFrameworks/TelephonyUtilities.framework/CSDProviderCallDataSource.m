@interface CSDProviderCallDataSource
+ (BOOL)_isSystemProviderForIdentifier:(id)a3;
+ (Class)callClass;
- (BOOL)_actionRequiresReasonableUserIntent:(id)a3;
- (BOOL)_allowRevertingStateForCompletedTransactionGroup:(id)a3;
- (BOOL)_shouldAllowRequestedAction:(id)a3 forCallSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldAllowRequestedTransaction:(id)a3 forCallSource:(id)a4 error:(id *)a5;
- (BOOL)_shouldBlockIfScreenSharing;
- (BOOL)callSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5;
- (BOOL)deferCommittingTransactions;
- (BOOL)sharingModeEnabled;
- (CSDCallFilterController)callFilterController;
- (CSDCallProviderManager)callProviderManager;
- (CSDCallSourceFetcher)callSourceFetcher;
- (CSDCoreTelephonyClient)coreTelephonyClient;
- (CSDFaceTimeProviderDelegate)faceTimeProviderDelegate;
- (CSDNeighborhoodActivityConduit)conduit;
- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities;
- (CSDProviderCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4 coreTelephonyClient:(id)a5 chManager:(id)a6 callSourceManager:(id)a7 protectedAppsUtilities:(id)a8;
- (CSDRelayCallDataSource)relayCallDataSource;
- (CSDRouteManager)routeManager;
- (CSDVoIPProcessAssertionManager)processAssertionManager;
- (CXCallControllerHost)callControllerHost;
- (CXCallSource)telephonyCallSource;
- (CXCallSourceManager)callSourceManager;
- (CXInProcessCallSource)faceTimeCallSource;
- (CXInProcessCallSource)superboxCallSource;
- (NSMutableDictionary)pendingCallsToChatUUIDs;
- (NSMutableDictionary)pendingPulledCallContexts;
- (_TtC13callservicesd27CSDSuperboxProviderDelegate)superboxProviderDelegate;
- (double)dispatchDelay;
- (id)_ISOCountryCodeForCall:(id)a3;
- (id)_ISOCountryCodeForCallWithUUID:(id)a3 provider:(id)a4 callUpdate:(id)a5;
- (id)_callGroupsWithBackingCallSource:(id)a3;
- (id)_callWithUUID:(id)a3;
- (id)_callWithUUID:(id)a3 backingCallSource:(id)a4;
- (id)_callWithUUID:(id)a3 controllableByCallSource:(id)a4;
- (id)_endMutuallyExclusiveCalls:(id)a3;
- (id)_identifiersForCalls:(id)a3;
- (id)_localProviderForCallSource:(id)a3;
- (id)_providerForCallSource:(id)a3;
- (id)_relayCallWithUUID:(id)a3;
- (id)blockedByExtension;
- (id)callDirectoryAllowsCallFromSourceAddress;
- (id)callGroupUUIDToCalls;
- (id)callSourceForDialRequest:(id)a3;
- (id)callSourceWithIdentifier:(id)a3;
- (id)dndAllowsCall;
- (id)lowPowerModeEnabledBlock;
- (id)providerWithIdentifier:(id)a3;
- (id)shouldFilterCall;
- (id)shouldPreferRelayOverDirectSecondaryCalling;
- (id)supportsPrimaryCalling;
- (void)_addSupplementalActionsForRequestedTransaction:(id)a3 onCallSource:(id)a4;
- (void)_commitUncommittedTransactions;
- (void)_deferCommittingTransactionsUntilAfterRunningBlock:(id)a3;
- (void)_endCall:(id)a3;
- (void)_performRequestedTransaction:(id)a3 onCallSource:(id)a4;
- (void)_processCompletedCallAction:(id)a3 forCall:(id)a4 allowRevertingState:(BOOL)a5 isOnenessActive:(BOOL)a6;
- (void)_processRequestedTransaction:(id)a3 fromCallSource:(id)a4 completion:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)callControllerHost:(id)a3 clientWithIdentifier:(id)a4 requestedTransaction:(id)a5 completion:(id)a6;
- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4;
- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5;
- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6;
- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5;
- (void)callSourceManager:(id)a3 completedTransactionGroup:(id)a4;
- (void)callSourcesChangedForCallSourceManager:(id)a3;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)holdOrEndOtherCallsBecauseCallWillBeginOutgoing:(id)a3;
- (void)performCallAction:(id)a3 forCall:(id)a4;
- (void)performCallActions:(id)a3 forCall:(id)a4;
- (void)performStartCallAction:(id)a3 forCall:(id)a4;
- (void)providersChangedForProviderManager:(id)a3;
- (void)pullCallWithHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)registerCall:(id)a3;
- (void)sendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)setBlockedByExtension:(id)a3;
- (void)setCallDirectoryAllowsCallFromSourceAddress:(id)a3;
- (void)setCallFilterController:(id)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setDeferCommittingTransactions:(BOOL)a3;
- (void)setDispatchDelay:(double)a3;
- (void)setDndAllowsCall:(id)a3;
- (void)setLowPowerModeEnabledBlock:(id)a3;
- (void)setProtectedAppsUtilities:(id)a3;
- (void)setRelayCallDataSource:(id)a3;
- (void)setRouteManager:(id)a3;
- (void)setSharingModeEnabled:(BOOL)a3;
- (void)setShouldFilterCall:(id)a3;
- (void)setShouldPreferRelayOverDirectSecondaryCalling:(id)a3;
- (void)setSupportsPrimaryCalling:(id)a3;
- (void)setTTYType:(int)a3 forCalls:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4;
- (void)startTrackingCall:(id)a3;
- (void)stopTrackingCall:(id)a3;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
- (void)updateFilteredOutReasonForCall:(id)a3 WithError:(id)a4;
@end

@implementation CSDProviderCallDataSource

- (CSDProviderCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4 coreTelephonyClient:(id)a5 chManager:(id)a6 callSourceManager:(id)a7 protectedAppsUtilities:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = (CSDCoreTelephonyClient *)a5;
  id v17 = a6;
  v18 = (CXCallSourceManager *)a7;
  id v19 = a8;
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___CSDProviderCallDataSource;
  v20 = -[CSDCallDataSource initWithCallStateController:queue:](&v79, "initWithCallStateController:queue:", v14, v15);
  if (v20)
  {
    id v68 = v19;
    v21 = v16;
    if (!v16) {
      v21 = -[CSDCoreTelephonyClient initWithQueue:shouldRegisterForECBMNotification:]( objc_alloc(&OBJC_CLASS___CSDCoreTelephonyClient),  "initWithQueue:shouldRegisterForECBMNotification:",  v15,  0LL);
    }
    id v69 = v17;
    objc_storeStrong((id *)&v20->_coreTelephonyClient, v21);
    if (!v16) {

    }
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingCallsToChatUUIDs = v20->_pendingCallsToChatUUIDs;
    v20->_pendingCallsToChatUUIDs = v22;

    id dndAllowsCall = v20->_dndAllowsCall;
    v20->_id dndAllowsCall = &stru_1003DC498;

    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_100194544;
    v77[3] = &unk_1003DC4C0;
    id v25 = v14;
    id v78 = v25;
    v26 = objc_retainBlock(v77);
    id callDirectoryAllowsCallFromSourceAddress = v20->_callDirectoryAllowsCallFromSourceAddress;
    v20->_id callDirectoryAllowsCallFromSourceAddress = v26;

    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_1001945A8;
    v75[3] = &unk_1003DC4E8;
    id v28 = v25;
    id v76 = v28;
    v29 = objc_retainBlock(v75);
    id blockedByExtension = v20->_blockedByExtension;
    v20->_id blockedByExtension = v29;

    id supportsPrimaryCalling = v20->_supportsPrimaryCalling;
    v20->_id supportsPrimaryCalling = &stru_1003DC508;

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_10019461C;
    v73[3] = &unk_1003DC530;
    id v74 = v28;
    v32 = objc_retainBlock(v73);
    id shouldPreferRelayOverDirectSecondaryCalling = v20->_shouldPreferRelayOverDirectSecondaryCalling;
    v20->_id shouldPreferRelayOverDirectSecondaryCalling = v32;

    v34 = -[CSDVoIPProcessAssertionManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDVoIPProcessAssertionManager),  "initWithSerialQueue:",  v15);
    processAssertionManager = v20->_processAssertionManager;
    v20->_processAssertionManager = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___CSDCallFilterController);
    callFilterController = v20->_callFilterController;
    v20->_callFilterController = v36;

    objc_initWeak(&location, v20);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100194678;
    v70[3] = &unk_1003DC558;
    objc_copyWeak(&v71, &location);
    v38 = objc_retainBlock(v70);
    id shouldFilterCall = v20->_shouldFilterCall;
    v20->_id shouldFilterCall = v38;

    id lowPowerModeEnabledBlock = v20->_lowPowerModeEnabledBlock;
    v20->_id lowPowerModeEnabledBlock = &stru_1003DC578;

    v20->_dispatchDelay = 1.0;
    v41 = v18;
    if (!v18) {
      v41 = -[CXCallSourceManager initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___CXCallSourceManager),  "initWithDelegate:queue:",  v20,  v15);
    }
    objc_storeStrong((id *)&v20->_callSourceManager, v41);
    if (!v18) {

    }
    v42 = -[CXCallControllerHost initWithDelegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___CXCallControllerHost),  "initWithDelegate:delegateQueue:",  v20,  v15);
    callControllerHost = v20->_callControllerHost;
    v20->_callControllerHost = v42;

    v44 = -[CSDCallSourceFetcher initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDCallSourceFetcher),  "initWithSerialQueue:",  v15);
    callSourceFetcher = v20->_callSourceFetcher;
    v20->_callSourceFetcher = v44;

    -[CSDCallSourceFetcher setDataSource:](v20->_callSourceFetcher, "setDataSource:", v20);
    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingPulledCallContexts = v20->_pendingPulledCallContexts;
    v20->_pendingPulledCallContexts = (NSMutableDictionary *)v46;

    v48 = objc_alloc(&OBJC_CLASS___CXInProcessCallSource);
    uint64_t v49 = TUPreferredFaceTimeBundleIdentifier(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    uint64_t v52 = TUBundle(v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue( [v53 localizedStringForKey:@"FACETIME" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    v55 = -[CXInProcessCallSource initWithIdentifier:bundleIdentifier:fallbackLocalizedName:]( v48,  "initWithIdentifier:bundleIdentifier:fallbackLocalizedName:",  @"com.apple.telephonyutilities.callservicesd.FaceTimeProvider",  v50,  v54);
    faceTimeCallSource = v20->_faceTimeCallSource;
    v20->_faceTimeCallSource = v55;

    v57 = -[CSDFaceTimeProviderDelegate initWithCallSource:queue:chManager:]( objc_alloc(&OBJC_CLASS___CSDFaceTimeProviderDelegate),  "initWithCallSource:queue:chManager:",  v20->_faceTimeCallSource,  v15,  v69);
    faceTimeProviderDelegate = v20->_faceTimeProviderDelegate;
    v20->_faceTimeProviderDelegate = v57;

    -[CSDFaceTimeProviderDelegate setCallDataSource:](v20->_faceTimeProviderDelegate, "setCallDataSource:", v20);
    -[CSDProviderCallDataSource setSharingModeEnabled:](v20, "setSharingModeEnabled:", 0LL);
    id v19 = v68;
    if (TUShouldCreateSuperboxProvider( -[CXCallSourceManager addCallSource:]( v20->_callSourceManager,  "addCallSource:",  v20->_faceTimeCallSource)))
    {
      v59 = -[CXInProcessCallSource initWithIdentifier:bundleIdentifier:fallbackLocalizedName:]( objc_alloc(&OBJC_CLASS___CXInProcessCallSource),  "initWithIdentifier:bundleIdentifier:fallbackLocalizedName:",  @"com.apple.Superbox",  @"com.apple.Superbox",  @"Superbox");
      superboxCallSource = v20->_superboxCallSource;
      v20->_superboxCallSource = v59;

      v61 = objc_alloc(&OBJC_CLASS____TtC13callservicesd27CSDSuperboxProviderDelegate);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource superboxCallSource](v20, "superboxCallSource"));
      v63 = -[CSDSuperboxProviderDelegate initWithCallSource:](v61, "initWithCallSource:", v62);
      superboxProviderDelegate = v20->_superboxProviderDelegate;
      v20->_superboxProviderDelegate = v63;

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](v20, "callSourceManager"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource superboxCallSource](v20, "superboxCallSource"));
      [v65 addCallSource:v66];

      id v19 = v68;
    }

    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);

    id v17 = v69;
  }

  return v20;
}

+ (Class)callClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDProviderCall, a2);
}

- (void)registerCall:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDProviderCallDataSource;
  -[CSDCallDataSource registerCall:](&v8, "registerCall:", v4);
  unsigned int v5 = -[CSDCallDataSource shouldTrackCall:](self, "shouldTrackCall:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callControllerHost](self, "callControllerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cxCall]);
  if (v5) {
    [v6 addOrUpdateCall:v7];
  }
  else {
    [v6 removeCall:v7];
  }
}

- (void)startTrackingCall:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDProviderCallDataSource;
  -[CSDCallDataSource startTrackingCall:](&v9, "startTrackingCall:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  unsigned __int8 v6 = [v4 isPTT];

  if ((v6 & 1) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource processAssertionManager](self, "processAssertionManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v5 acquireProcessAssertionForBundleIdentifier:v8];

LABEL_4:
  }
}

- (void)stopTrackingCall:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDProviderCallDataSource;
  -[CSDCallDataSource stopTrackingCall:](&v12, "stopTrackingCall:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  unsigned __int8 v6 = [v5 isSystemProvider];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource processAssertionManager](self, "processAssertionManager"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    [v7 invalidateProcessAssertionForBundleIdentifier:v9];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifierUUID]);
  [v10 failOutstandingActionsForCallWithUUID:v11];
}

- (CSDNeighborhoodActivityConduit)conduit
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource faceTimeProviderDelegate](self, "faceTimeProviderDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 conduit]);

  return (CSDNeighborhoodActivityConduit *)v3;
}

- (CSDRouteManager)routeManager
{
  routeManager = self->_routeManager;
  if (!routeManager)
  {
    id v4 = (CSDRouteManager *)objc_claimAutoreleasedReturnValue(+[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance"));
    unsigned int v5 = self->_routeManager;
    self->_routeManager = v4;

    routeManager = self->_routeManager;
  }

  return routeManager;
}

- (void)setCallProviderManager:(id)a3
{
  p_callProviderManager = &self->_callProviderManager;
  objc_storeStrong((id *)&self->_callProviderManager, a3);
  id v6 = a3;
  v7 = *p_callProviderManager;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  -[CSDCallProviderManager addDelegate:queue:](v7, "addDelegate:queue:", self, v8);
}

- (id)callGroupUUIDToCalls
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callGroupUUID]);

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 callGroupUUID]);
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v9 callGroupUUID]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v13]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 arrayByAddingObject:v9]);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v9 callGroupUUID]);
            [v3 setObject:v15 forKeyedSubscript:v16];
          }

          else
          {
            v23 = v9;
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL));
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 callGroupUUID]);
            [v3 setObject:v13 forKeyedSubscript:v14];
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  id v17 = [v3 copy];
  return v17;
}

- (CXCallSource)telephonyCallSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callSourceWithIdentifier:@"com.apple.coretelephony"]);

  return (CXCallSource *)v3;
}

- (id)_callWithUUID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v4));

  return v5;
}

- (id)_relayCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource relayCallDataSource](self, "relayCallDataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 callWithUniqueProxyIdentifier:v6]);
  return v7;
}

- (id)_callWithUUID:(id)a3 backingCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v19;
    do
    {
      v13 = 0LL;
      id v14 = v11;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)v13);

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueProxyIdentifierUUID]);
        if ([v15 isEqual:v6])
        {
          id v16 = (id)objc_claimAutoreleasedReturnValue([v11 backingCallSource]);

          if (v16 == v7) {
            goto LABEL_14;
          }
        }

        else
        {
        }

        v13 = (char *)v13 + 1;
        id v14 = v11;
      }

      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  id v11 = 0LL;
LABEL_14:

  return v11;
}

- (id)_callWithUUID:(id)a3 controllableByCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v20;
    do
    {
      v13 = 0LL;
      id v14 = v11;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)v13);

        id v15 = (id)objc_claimAutoreleasedReturnValue([v11 backingCallSource]);
        if (v15 == v7)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueProxyIdentifierUUID]);
          unsigned __int8 v17 = [v16 isEqual:v6];

          if ((v17 & 1) != 0) {
            goto LABEL_13;
          }
        }

        else
        {
        }

        v13 = (char *)v13 + 1;
        id v14 = v11;
      }

      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  id v11 = 0LL;
LABEL_13:

  return v11;
}

- (id)_callGroupsWithBackingCallSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 callGroupUUID]);
        if (v12) {
          goto LABEL_7;
        }
        id v13 = (id)objc_claimAutoreleasedReturnValue([v11 backingCallSource]);

        if (v13 == v4)
        {
          v35 = v11;
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v35,  1LL));
          [v5 addObject:v12];
LABEL_7:
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v14 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      id v8 = v14;
    }

    while (v14);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callGroupUUIDToCalls](self, "callGroupUUIDToCalls", 0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);

  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        __int128 v21 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
        id v23 = (id)objc_claimAutoreleasedReturnValue([v22 backingCallSource]);

        if (v23 == v4) {
          [v5 addObject:v21];
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v18);
  }

  id v24 = [v5 copy];
  return v24;
}

- (id)_providerForCallSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 providersByIdentifierForRemoteClients:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  return v8;
}

- (id)_localProviderForCallSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localProvidersByIdentifierForRemoteClients:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  return v8;
}

- (id)_ISOCountryCodeForCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  if ([v5 isFaceTimeProvider])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource faceTimeProviderDelegate](self, "faceTimeProviderDelegate"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifierUUID]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 ISOCountryCodeForCallWithUUID:v7]);
  }

  else
  {
    if (![v5 isTelephonyProvider])
    {
      uint64_t v9 = 0LL;
      goto LABEL_9;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    if (!v6)
    {
      uint64_t v9 = 0LL;
      goto LABEL_7;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource coreTelephonyClient](self, "coreTelephonyClient"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 ISOCountryCodeForSubscriptionUUID:v6]);
  }

  uint64_t v9 = (void *)v8;

LABEL_7:
LABEL_9:

  return v9;
}

- (id)_ISOCountryCodeForCallWithUUID:(id)a3 provider:(id)a4 callUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isFaceTimeProvider])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource faceTimeProviderDelegate](self, "faceTimeProviderDelegate"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 ISOCountryCodeForCallWithUUID:v8]);
LABEL_8:

    goto LABEL_9;
  }

  if ([v9 isTelephonyProvider])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localSenderIdentityUUID]);
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource coreTelephonyClient](self, "coreTelephonyClient"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 ISOCountryCodeForSubscriptionUUID:v11]);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    goto LABEL_8;
  }

  uint64_t v12 = 0LL;
LABEL_9:

  return v12;
}

- (id)_identifiersForCalls:(id)a3
{
  id v3 = a3;
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
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v9),  "uniqueProxyIdentifier",  (void)v12));
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)_shouldBlockIfScreenSharing
{
  if ((TUAllowCallsDuringScreenSharing(self, a2) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", 0LL));
    id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0LL; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) isSharingScreen])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }

        id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

- (void)_deferCommittingTransactionsUntilAfterRunningBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  -[CSDProviderCallDataSource setDeferCommittingTransactions:](self, "setDeferCommittingTransactions:", 1LL);
  v4[2](v4);

  -[CSDProviderCallDataSource setDeferCommittingTransactions:](self, "setDeferCommittingTransactions:", 0LL);
  -[CSDProviderCallDataSource _commitUncommittedTransactions](self, "_commitUncommittedTransactions");
}

- (void)_commitUncommittedTransactions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
  [v2 commitUncommittedTransactions];
}

- (BOOL)_allowRevertingStateForCompletedTransactionGroup:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allActions", 0));
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
        __int128 v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v8 state] == (id)1)
        {
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v9);
          if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (void)_endCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    int v11 = 138412290;
    __int128 v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ending mutually exclusive call with uPI %@ because we have a newer incoming call that can not co-exist with it.",  (uint8_t *)&v11,  0xCu);
  }

  __int128 v8 = objc_alloc(&OBJC_CLASS___CXEndCallAction);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifierUUID]);
  uint64_t v10 = -[CXEndCallAction initWithCallUUID:](v8, "initWithCallUUID:", v9);

  -[CSDProviderCallDataSource performCallAction:forCall:](self, "performCallAction:forCall:", v10, v4);
}

- (id)_endMutuallyExclusiveCalls:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_endMutuallyExclusiveCalls: update=%@",  buf,  0xCu);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v8)
  {

    id v10 = 0LL;
LABEL_24:
    id v18 = 0LL;
    goto LABEL_25;
  }

  id v9 = v8;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v23;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v7);
      }
      __int128 v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
      if ([v13 isMutuallyExclusiveCall])
      {
        if (v10)
        {
          id v14 = sub_1001704C4();
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Found multiple existing mutually exclusive calls.  Ending call %@",  buf,  0xCu);
          }

          -[CSDProviderCallDataSource _endCall:](self, "_endCall:", v13);
        }

        else
        {
          id v10 = v13;
        }
      }
    }

    id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  }

  while (v9);

  if (!v10)
  {
    id v18 = 0LL;
    goto LABEL_25;
  }

  if (![v4 isMutuallyExclusiveCall])
  {
    -[CSDProviderCallDataSource _endCall:](self, "_endCall:", v10);
    goto LABEL_24;
  }

  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring mutually exclusive update", buf, 2u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_incomingCallErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_incomingCallErrorWithCode:",  102LL));
LABEL_25:
  id v19 = sub_1001704C4();
  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v10;
    __int16 v28 = 2112;
    __int128 v29 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "_endMutuallyExclusiveCalls: mutuallyExclusiveCall=%@, error=%@",  buf,  0x16u);
  }

  return v18;
}

- (void)_processCompletedCallAction:(id)a3 forCall:(id)a4 allowRevertingState:(BOOL)a5 isOnenessActive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v13);
  if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
  {
    id v16 = (os_log_s *)v10;
    id v17 = -[os_log_s state](v16, "state");
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    __int128 v20 = v19;
    if (v17 == (id)1)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v106 = 138412290;
        *(void *)&v106[4] = v16;
        __int128 v21 = "Start call action fulfilled: %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, v106, 0xCu);
        goto LABEL_10;
      }

      goto LABEL_10;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1002BA8E4();
    }

    if (v6) {
      [v11 disconnectWithReason:51];
    }
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
LABEL_16:
    __int128 v25 = (void *)v26;
    [v11 setDateEnded:v26];
    goto LABEL_17;
  }

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___CXJoinCallAction, v15);
  if ((objc_opt_isKindOfClass(v10, v22) & 1) != 0)
  {
    id v16 = (os_log_s *)v10;
    if (-[os_log_s state](v16, "state") == (id)1)
    {
      id v24 = sub_1001704C4();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v106 = 138412290;
        *(void *)&v106[4] = v16;
        __int128 v21 = "Join call action fulfilled: %@";
        goto LABEL_9;
      }

- (BOOL)_actionRequiresReasonableUserIntent:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v4);
  BOOL v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v6),  0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = objc_opt_class(v3, v9);

  LOBYTE(v10) = [v8 containsObject:v10];
  return v10;
}

- (BOOL)_shouldAllowRequestedAction:(id)a3 forCallSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _providerForCallSource:](self, "_providerForCallSource:", v11));
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CXCallAction, v13);
  if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
  {
    id v16 = v10;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUID]);
    uint64_t v66 = objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:controllableByCallSource:]( self,  "_callWithUUID:controllableByCallSource:",  v17,  v11));

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUID]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _callWithUUID:](self, "_callWithUUID:", v18));

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUID]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _relayCallWithUUID:](self, "_relayCallWithUUID:", v20));

    if (-[CSDProviderCallDataSource _actionRequiresReasonableUserIntent:]( self,  "_actionRequiresReasonableUserIntent:",  v16))
    {
      if (v7)
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"));
        unsigned __int8 v24 = [v23 validateUserIntentForCallSource:v11];

        if ((v24 & 1) == 0)
        {
          id v48 = sub_1001704C4();
          uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = objc_opt_class(v16, v50);
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
            *(_DWORD *)buf = 138412546;
            uint64_t v68 = v51;
            __int16 v69 = 2112;
            id v70 = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested %@ because user intent could not be validated for call source with identifier: %@",  buf,  0x16u);
          }

          id v53 = [v11 processIdentifier];
          +[CSDCrashReporter simulateCrashReportFromPID:withKillCode:usingReasonWithFormat:]( &OBJC_CLASS___CSDCrashReporter,  "simulateCrashReportFromPID:withKillCode:usingReasonWithFormat:",  v53,  3735931409LL,  @"Not allowing requested %@ because user intent could not be reasonably validated to gain access to the microphone while in the background.",  objc_opt_class(v16, v54));
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  6LL));
          goto LABEL_47;
        }
      }
    }

    uint64_t v25 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v22);
    if ((objc_opt_isKindOfClass(v16, v25) & 1) == 0)
    {
      uint64_t v38 = objc_opt_class(&OBJC_CLASS___CXSetGroupCallAction, v26);
      if ((objc_opt_isKindOfClass(v16, v38) & 1) == 0
        || (uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUIDToGroupWith]),
            v40,
            !v40))
      {
        uint64_t v43 = objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v39);
        if ((objc_opt_isKindOfClass(v16, v43) & 1) != 0 && v21)
        {
          id v44 = sub_1001704C4();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          uint64_t v46 = (void *)v66;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested answer call action because a relay call with same UUID already exists: %@",  buf,  0xCu);
          }

          uint64_t v47 = 5LL;
        }

        else
        {
          uint64_t v46 = (void *)v66;
          if (v66)
          {
            v35 = 0LL;
            goto LABEL_48;
          }

          id v57 = sub_1001704C4();
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUID]);
            v59 = (void *)objc_claimAutoreleasedReturnValue([v65 UUIDString]);
            id v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
            *(_DWORD *)buf = 138412802;
            uint64_t v68 = (uint64_t)v59;
            __int16 v69 = 2112;
            id v70 = v11;
            __int16 v71 = 2112;
            id v72 = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested action because no call was found for call UUID %@ and call source %@. All calls: %@",  buf,  0x20u);

            uint64_t v46 = 0LL;
          }

          uint64_t v47 = 4LL;
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  v47));
LABEL_48:

        if (a6) {
          goto LABEL_49;
        }
        goto LABEL_50;
      }

      id v41 = (void *)objc_claimAutoreleasedReturnValue([v16 callUUIDToGroupWith]);
      id v42 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:controllableByCallSource:]( self,  "_callWithUUID:controllableByCallSource:",  v41,  v11));

      if (v42)
      {
        v35 = 0LL;
      }

      else
      {
        id v61 = sub_1001704C4();
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
          *(_DWORD *)buf = 138412802;
          uint64_t v68 = (uint64_t)v16;
          __int16 v69 = 2112;
          id v70 = v11;
          __int16 v71 = 2112;
          id v72 = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested action because no call was found to group with for action %@ and call source % @. All calls: %@",  buf,  0x20u);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  4LL));
      }

LABEL_47:
      uint64_t v46 = (void *)v66;
      goto LABEL_48;
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callGroupsWithBackingCallSource:]( self,  "_callGroupsWithBackingCallSource:",  v11));
    uint64_t v28 = v27;
    if (v19 | v21)
    {
      id v29 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = v19;
        __int16 v69 = 2112;
        id v70 = (id)v21;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested start call action because a call with same UUID already exists callWithUUID: %@, relayCallWithUUID: %@",  buf,  0x16u);
      }

      uint64_t v31 = 5LL;
    }

    else
    {
      id v55 = [v27 count];
      if (v55 < [v12 maximumCallGroups])
      {
        v35 = 0LL;
LABEL_38:

        goto LABEL_47;
      }

      id v56 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v68 = (uint64_t)v11;
        __int16 v69 = 2048;
        id v70 = [v12 maximumCallGroups];
        __int16 v71 = 2112;
        id v72 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested start call action because call source %@ is at the maximum call group count of %lu: %@",  buf,  0x20u);
      }

      uint64_t v31 = 7LL;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  v31));
    goto LABEL_38;
  }

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___CXSendMMIOrUSSDCodeAction, v15);
  if ((objc_opt_isKindOfClass(v10, v32) & 1) != 0)
  {
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    unsigned __int8 v34 = [v33 isEqualToString:@"com.apple.coretelephony"];

    if ((v34 & 1) != 0)
    {
      v35 = 0LL;
      if (!a6) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }

  id v36 = sub_1001704C4();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (uint64_t)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested action because action is not allowed to be requested: %@",  buf,  0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  6LL));
  if (a6) {
LABEL_49:
  }
    *a6 = v35;
LABEL_50:

  return v35 == 0LL;
}

- (BOOL)_shouldAllowRequestedTransaction:(id)a3 forCallSource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 actions]);
  id v11 = [v10 count];

  if (v11)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 actions]);
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v16);
          id v23 = 0LL;
          -[CSDProviderCallDataSource _shouldAllowRequestedAction:forCallSource:shouldValidateUserIntent:error:]( self,  "_shouldAllowRequestedAction:forCallSource:shouldValidateUserIntent:error:",  v17,  v9,  1LL,  &v23);
          id v18 = v23;
          if (v18)
          {
            uint64_t v19 = v18;
            goto LABEL_12;
          }

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = 0LL;
LABEL_12:

    if (a5) {
      goto LABEL_13;
    }
  }

  else
  {
    id v21 = sub_1001704C4();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested transaction because it is empty: %@",  buf,  0xCu);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_requestTransactionErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_requestTransactionErrorWithCode:",  3LL));
    if (a5) {
LABEL_13:
    }
      *a5 = v19;
  }

  return v19 == 0LL;
}

- (void)_processRequestedTransaction:(id)a3 fromCallSource:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v16 = 0LL;
  id v10 = (void (**)(id, id))a5;
  unsigned int v11 = -[CSDProviderCallDataSource _shouldAllowRequestedTransaction:forCallSource:error:]( self,  "_shouldAllowRequestedTransaction:forCallSource:error:",  v8,  v9,  &v16);
  id v12 = v16;
  id v13 = sub_1001704C4();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Allowing requested transaction: %@",  buf,  0xCu);
    }

    -[CSDProviderCallDataSource _performRequestedTransaction:onCallSource:]( self,  "_performRequestedTransaction:onCallSource:",  v8,  v9);
  }

  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing requested transaction: %@",  buf,  0xCu);
    }
  }

  v10[2](v10, v12);
}

- (void)_performRequestedTransaction:(id)a3 onCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  unsigned __int8 v34 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 actions]);
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v47 count:16];
  v35 = v7;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v9);
        }
        BOOL v15 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v11);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          id v18 = sub_1001704C4();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v46 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Dialing new call due to requested start call action: %@",  buf,  0xCu);
          }

          id v20 = v15;
          id v21 = -[CSDProviderCall initOutgoingWithRequestedStartCallAction:backingCallSource:]( objc_alloc(&OBJC_CLASS___CSDProviderCall),  "initOutgoingWithRequestedStartCallAction:backingCallSource:",  v20,  v35);

          [v8 setCallDelegatesIfNeeded:v21];
          [v8 propertiesChangedForCall:v21];
        }

        else
        {
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___CXCallAction, v17);
          if ((objc_opt_isKindOfClass(v15, v22) & 1) == 0) {
            continue;
          }
          id v23 = v15;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 callUUID]);
          id v21 = (id)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v24,  v35));

          uint64_t v25 = objc_claimAutoreleasedReturnValue([v21 backingCallSource]);
          id v7 = (id)v25;
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }

    while (v12);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v34 actions]);
  id v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)j);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
        [v32 addAction:v31 toUncommittedTransactionForCallSource:v7];
      }

      id v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v28);
  }

  -[CSDProviderCallDataSource _addSupplementalActionsForRequestedTransaction:onCallSource:]( self,  "_addSupplementalActionsForRequestedTransaction:onCallSource:",  v34,  v7);
  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
  [v33 commitUncommittedTransactions];
}

- (void)_addSupplementalActionsForRequestedTransaction:(id)a3 onCallSource:(id)a4
{
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 actions]);
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v47;
    id v8 = &_sSo13os_log_type_ta0A0E5faultABvgZ_ptr;
    uint64_t v37 = *(void *)v47;
    do
    {
      id v9 = 0LL;
      id v38 = v6;
      do
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(v8[457], v5);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = v10;
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 callUUID]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _callWithUUID:](self, "_callWithUUID:", v13));

          uint64_t v16 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v15);
          if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0
            || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v17), (objc_opt_isKindOfClass(v12, v18) & 1) != 0)
            || (uint64_t v20 = objc_opt_class(&OBJC_CLASS___CXSetHeldCallAction, v19), (objc_opt_isKindOfClass(v12, v20) & 1) != 0)
            && ([v12 isOnHold] & 1) == 0)
          {
            __int128 v40 = v9;
            __int128 v44 = 0u;
            __int128 v45 = 0u;
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", v37));
            id v22 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
            if (!v22) {
              goto LABEL_28;
            }
            id v23 = v22;
            uint64_t v24 = *(void *)v43;
            while (1)
            {
              for (i = 0LL; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v43 != v24) {
                  objc_enumerationMutation(v21);
                }
                __int128 v26 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
                if (v26 != v14)
                {
                  id v27 = (CXSetHeldCallAction *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v42 + 1) + 8 * (void)i) provider]);
                  id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);
                  if ((-[CXSetHeldCallAction isEqualToCallProvider:](v27, "isEqualToCallProvider:", v28) & 1) == 0
                    && ([v26 isOnHold] & 1) == 0)
                  {
                    uint64_t v30 = objc_opt_class(&OBJC_CLASS___CXStartCallAction, v29);
                    if ((objc_opt_isKindOfClass(v12, v30) & 1) == 0
                      || ([v14 isVideoUpgradeFromCall:v26] & 1) == 0)
                    {
                      unsigned __int8 v31 = [v26 isPTT];

                      if ((v31 & 1) != 0) {
                        continue;
                      }
                      uint64_t v32 = objc_alloc(&OBJC_CLASS___CXSetHeldCallAction);
                      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v26 uniqueProxyIdentifierUUID]);
                      id v27 = -[CXSetHeldCallAction initWithCallUUID:onHold:](v32, "initWithCallUUID:onHold:", v33, 1LL);

                      id v34 = sub_1001704C4();
                      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v51 = v26;
                        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Adding supplemental set held call action for existing call %@",  buf,  0xCu);
                      }

                      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
                      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v26 backingCallSource]);
                      [v28 addAction:v27 toUncommittedTransactionForCallSource:v36];
                    }
                  }
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
              if (!v23)
              {
LABEL_28:

                uint64_t v7 = v37;
                id v6 = v38;
                id v8 = &_sSo13os_log_type_ta0A0E5faultABvgZ_ptr;
                id v9 = v40;
                break;
              }
            }
          }
        }

        id v9 = (char *)v9 + 1;
      }

      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }

    while (v6);
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100197DB8;
  v14[3] = &unk_1003D7B00;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v14);
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100197E9C;
  v8[3] = &unk_1003D7828;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v8);
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100197F7C;
  v8[3] = &unk_1003D7828;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v8);
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10019805C;
  v8[3] = &unk_1003D7828;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v8);
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100198188;
  v14[3] = &unk_1003D7B00;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v14);
}

- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100198248;
  v6[3] = &unk_1003D7918;
  BOOL v9 = a3;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v6);
}

- (void)setTTYType:(int)a3 forCalls:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100198304;
  v6[3] = &unk_1003D9D80;
  int v9 = a3;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v6);
}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001983B8;
  v4[3] = &unk_1003D7758;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( v5,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v4);
}

- (void)pullCallWithHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100198574;
  v8[3] = &unk_1003D8410;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v8);
}

- (id)callSourceForDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  unsigned int v6 = [v5 isTelephonyProvider];

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource telephonyCallSource](self, "telephonyCallSource"));
LABEL_7:
    id v12 = (void *)v7;
    goto LABEL_8;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  unsigned int v9 = [v8 isFaceTimeProvider];

  if (v9)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource faceTimeCallSource](self, "faceTimeCallSource"));
    goto LABEL_7;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  unsigned int v11 = [v10 isSuperboxProvider];

  if (v11)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource superboxCallSource](self, "superboxCallSource"));
    goto LABEL_7;
  }

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 callSources]);
    int v18 = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    id v21 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not determine call source for dial request: %@. All call sources: %@",  (uint8_t *)&v18,  0x16u);
  }

  id v12 = 0LL;
LABEL_8:

  return v12;
}

- (id)providerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 providersByIdentifierForRemoteClients:0]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  return v7;
}

- (void)performCallAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asked to perform action %@ for call %@",  (uint8_t *)&v17,  0x16u);
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CXJoinCallAction, v10);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0) {
    -[CSDProviderCallDataSource holdOrEndOtherCallsBecauseCallWillBeginOutgoing:]( self,  "holdOrEndOtherCallsBecauseCallWillBeginOutgoing:",  v7);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 backingCallSource]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 backingCallSource]);
    [v13 addAction:v6 toUncommittedTransactionForCallSource:v14];

    if (!-[CSDProviderCallDataSource deferCommittingTransactions](self, "deferCommittingTransactions")) {
      -[CSDProviderCallDataSource _commitUncommittedTransactions](self, "_commitUncommittedTransactions");
    }
  }

  else
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping to add action since there is no backing call source",  (uint8_t *)&v17,  2u);
    }
  }
}

- (void)performCallActions:(id)a3 forCall:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100198B88;
  v8[3] = &unk_1003D7828;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[CSDProviderCallDataSource _deferCommittingTransactionsUntilAfterRunningBlock:]( self,  "_deferCommittingTransactionsUntilAfterRunningBlock:",  v8);
}

- (void)holdOrEndOtherCallsBecauseCallWillBeginOutgoing:(id)a3
{
  id v3 = a3;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v3 callCenter]);
  id obj = (id)objc_claimAutoreleasedReturnValue([v39 currentCallGroups]);
  id v4 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v48 + 1) + 8 * (void)i) calls]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
        unsigned int v13 = [v11 isEqualToCallProvider:v12];

        v6 += v13;
      }

      id v5 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
  id v15 = [v14 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v45;
    id obja = v14;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v44 + 1) + 8LL * (void)j);
        if (v19 != v3
          && ([*(id *)(*((void *)&v44 + 1) + 8 * (void)j) isOnHold] & 1) == 0
          && [v19 status] == 1
          && ([v3 isVideoUpgradeFromCall:v19] & 1) == 0
          && ([v19 isPTT] & 1) == 0)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 provider]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
          unsigned int v22 = [v20 isEqualToCallProvider:v21];

          if (v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
            BOOL v24 = v6 >= (unint64_t)[v23 maximumCallGroups];
          }

          else
          {
            BOOL v24 = 0;
          }

          if (([v19 isScreening] & 1) != 0
            || (([v19 isMutuallyExclusiveCall] | v24) & 1) != 0
            || (uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 model]),
                unsigned int v26 = [v25 supportsHolding],
                v25,
                !v26))
          {
            uint64_t v30 = objc_alloc(&OBJC_CLASS___CXEndCallAction);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueProxyIdentifierUUID]);
            uint64_t v29 = -[CXEndCallAction initWithCallUUID:](v30, "initWithCallUUID:", v28);
          }

          else
          {
            id v27 = objc_alloc(&OBJC_CLASS___CXSetHeldCallAction);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueProxyIdentifierUUID]);
            uint64_t v29 = -[CXSetHeldCallAction initWithCallUUID:onHold:](v27, "initWithCallUUID:onHold:", v28, 1LL);
          }

          unsigned __int8 v31 = v29;

          id v32 = sub_1001704C4();
          unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueProxyIdentifierUUID]);
            BOOL v40 = v24;
            v35 = (void *)objc_claimAutoreleasedReturnValue([v19 model]);
            unsigned int v36 = [v35 supportsHolding];
            *(_DWORD *)buf = 138413058;
            id v53 = v31;
            __int16 v54 = 2112;
            id v55 = v34;
            __int16 v56 = 1024;
            BOOL v57 = v40;
            __int16 v58 = 1024;
            unsigned int v59 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Sending action %@ for existing call with uniqueProxyIdentifierUUID=%@ maximumCallGroupsReachedForProvider= %d supportsHolding=%d",  buf,  0x22u);
          }

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v19 backingCallSource]);
          [v37 addAction:v31 toUncommittedTransactionForCallSource:v38];

          id v14 = obja;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }

    while (v16);
  }
}

- (void)performStartCallAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CSDProviderCallDataSource holdOrEndOtherCallsBecauseCallWillBeginOutgoing:]( self,  "holdOrEndOtherCallsBecauseCallWillBeginOutgoing:",  v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 isoCountryCode]);

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _ISOCountryCodeForCall:](self, "_ISOCountryCodeForCall:", v7));
    if ([v9 length])
    {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CXCallUpdate);
      -[CXCallUpdate setISOCountryCode:](v10, "setISOCountryCode:", v9);
      [v7 updateWithCallUpdate:v10];
    }
  }

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asked to perform start call action %@ for call %@",  (uint8_t *)&v13,  0x16u);
  }

  -[CSDProviderCallDataSource performCallAction:forCall:](self, "performCallAction:forCall:", v6, v7);
}

- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Call source %@ registered with configuration %@",  (uint8_t *)&v23,  0x16u);
  }

  uint64_t v10 = -[TUCallProvider initWithCallSource:configuration:]( objc_alloc(&OBJC_CLASS___TUCallProvider),  "initWithCallSource:configuration:",  v6,  v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v12 = [v11 isEqualToString:@"com.apple.coretelephony"];

  if (v12)
  {
    -[TUCallProvider setBundleIdentifier:](v10, "setBundleIdentifier:", TUBundleIdentifierPhoneApplication);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallProvider localizedName](v10, "localizedName"));
    if (v14)
    {
      -[TUCallProvider setLocalizedName:](v10, "setLocalizedName:", v14);
    }

    else
    {
      uint64_t v15 = TUBundle(0LL, v13);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"PHONE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[TUCallProvider setLocalizedName:](v10, "setLocalizedName:", v17);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"));
  [v18 registerLocalProvider:v10];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v20 = [v19 isEqualToString:@"com.apple.coretelephony"];

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource faceTimeProviderDelegate](self, "faceTimeProviderDelegate"));
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 prioritizedSenderIdentities]);
    [v21 updateProviderConfigurationWithSenderIdentities:v22];
  }
}

- (BOOL)callSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0LL;
  BOOL v10 = -[CSDProviderCallDataSource _shouldAllowRequestedAction:forCallSource:shouldValidateUserIntent:error:]( self,  "_shouldAllowRequestedAction:forCallSource:shouldValidateUserIntent:error:",  v9,  v8,  0LL,  &v15);
  id v11 = v15;
  if (v11)
  {
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002BAEE0();
    }
  }

  if (a5) {
    *a5 = v11;
  }

  return v10;
}

- (void)updateFilteredOutReasonForCall:(id)a3 WithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_17;
  }
  if ([v7 code] == (id)4)
  {
    if (![v6 filteredOutReason])
    {
      id v9 = v6;
      uint64_t v10 = 1LL;
LABEL_13:
      [v9 setFilteredOutReason:v10];
    }
  }

  else if ([v8 code] == (id)3)
  {
    if (![v6 filteredOutReason])
    {
      id v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource callDirectoryAllowsCallFromSourceAddress]( self,  "callDirectoryAllowsCallFromSourceAddress"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      char v14 = ((uint64_t (**)(void, void *))v11)[2](v11, v13);

      id v9 = v6;
      if ((v14 & 1) == 0)
      {
        [v6 setFilteredOutReason:4];
        uint64_t v17 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource blockedByExtension]( self,  "blockedByExtension"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
        uint64_t v20 = ((uint64_t (**)(void, void *))v17)[2](v17, v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        [v6 setBlockedByExtension:v21];

        goto LABEL_14;
      }

      uint64_t v10 = 6LL;
      goto LABEL_13;
    }
  }

  else
  {
    if ([v8 code] == (id)104)
    {
      id v9 = v6;
      uint64_t v10 = 7LL;
      goto LABEL_13;
    }

    if ([v8 code] == (id)105)
    {
      id v9 = v6;
      uint64_t v10 = 8LL;
      goto LABEL_13;
    }
  }

- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6
{
  id v148 = a3;
  id v149 = a4;
  id v9 = (__CFString *)a5;
  v144 = (void (**)(id, void *))a6;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v149 UUIDString]);
    *(_DWORD *)buf = 138412802;
    *(void *)v175 = v148;
    *(_WORD *)&v175[8] = 2112;
    v176 = v12;
    __int16 v177 = 2112;
    v178 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received add incoming call request from call source %@ with UUID %@ update %@",  buf,  0x20u);
  }

  +[CSDSignposts trace:](&OBJC_CLASS___CSDSignposts, "trace:", 4LL);
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _callWithUUID:](self, "_callWithUUID:", v149));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _relayCallWithUUID:](self, "_relayCallWithUUID:", v149));
  v145 = (__CFString *)v13;
  if (__PAIR128__((unint64_t)v146, v13) != 0)
  {
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v175 = v146;
      *(_WORD *)&v175[8] = 2112;
      v176 = v145;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring add incoming call request because a call already exists with the same UUID: existingCall: %@, re layCallWithUUID: %@",  buf,  0x16u);
    }

    v147 = (void *)objc_claimAutoreleasedReturnValue( +[NSError cx_incomingCallErrorWithCode:]( &OBJC_CLASS___NSError,  "cx_incomingCallErrorWithCode:",  2LL));
    v144[2](v144, v147);
    goto LABEL_98;
  }

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _providerForCallSource:](self, "_providerForCallSource:", v148));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  uint64_t v168 = 0LL;
  v169 = &v168;
  uint64_t v170 = 0x3032000000LL;
  v171 = sub_10019A990;
  v172 = sub_10019A9A0;
  id v173 = 0LL;
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString account](v9, "account"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localSenderIdentityUUID](v9, "localSenderIdentityUUID"));
  if (!v140 && v143)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v147 senderIdentityForUUID:v143]);
    uint64_t v17 = v16;
    if (!v16)
    {
LABEL_24:

      goto LABEL_25;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
    if (v18) {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v18));
    }
    else {
      id v19 = 0LL;
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 ISOCountryCode]);
    if (![v20 length])
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource coreTelephonyClient](self, "coreTelephonyClient"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 accountISOCountryCodeForSubscriptionUUID:v143]);

      uint64_t v20 = (void *)v22;
    }

    int v23 = (void *)objc_claimAutoreleasedReturnValue([v17 accountUUID]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedName]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedServiceName]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v17 localizedShortName]);
    id v27 = (void *)v26;
    if (v23 && v24 && v25 && v20 && v26)
    {
      id v28 = [[CXAccount alloc] initWithUUID:v23 description:v24 serviceName:v25 isoCountryCode:v20 handle:v19 shortLabel:v26];
      -[__CFString setAccount:](v9, "setAccount:", v28);
    }

    else if (!v23)
    {
LABEL_23:

      goto LABEL_24;
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
    -[__CFString setLocalSenderSubscriptionIdentifier:](v9, "setLocalSenderSubscriptionIdentifier:", v29);

    goto LABEL_23;
  }

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5
{
  id v8 = (CXEndCallAction *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = v8;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ updated call with UUID %@ with update %@",  buf,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:controllableByCallSource:]( self,  "_callWithUUID:controllableByCallSource:",  v9,  v8));
  if (([v14 isMutuallyExclusiveCall] & 1) != 0
    || [v10 isMutuallyExclusiveCall])
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v15 = (CXEndCallAction *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
    id v16 = -[CXEndCallAction countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
    if (v16)
    {
      id v17 = v16;
      id v38 = v10;
      __int128 v39 = v8;
      uint64_t v18 = *(void *)v41;
      while (2)
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueProxyIdentifierUUID", v38, v39));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueProxyIdentifierUUID]);
          unsigned int v23 = [v21 isEqual:v22];

          if (!v23)
          {

            id v15 = -[CXEndCallAction initWithCallUUID:]( objc_alloc(&OBJC_CLASS___CXEndCallAction),  "initWithCallUUID:",  v9);
            id v24 = sub_1001704C4();
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v45 = v15;
              __int16 v46 = 2112;
              id v47 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Sending %@ for existing call with uniqueProxyIdentifierUUID=%@ since it cannot co-exist with ongoing calls.",  buf,  0x16u);
            }

            -[CSDProviderCallDataSource performCallAction:forCall:](self, "performCallAction:forCall:", v15, v14);
            goto LABEL_17;
          }
        }

        id v17 = -[CXEndCallAction countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
        if (v17) {
          continue;
        }
        break;
      }

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    int v22 = 138412802;
    id v23 = v8;
    __int16 v24 = 2112;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ updated call with UUID %@ with DTMFUpdate %@",  (uint8_t *)&v22,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:controllableByCallSource:]( self,  "_callWithUUID:controllableByCallSource:",  v9,  v8));
  if (v14
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 digits]),
        id v16 = [v15 length],
        v15,
        v16))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 tuCallDTMFUpdate]);
    [v17 handleReceivedCallDTMFUpdate:v18 forCall:v14];
  }

  else
  {
    id v19 = sub_1001704C4();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
      int v22 = 138412802;
      id v23 = v8;
      __int16 v24 = 2112;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] No call found for call source %@ and UUID %@. All calls: %@",  (uint8_t *)&v22,  0x20u);
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    *(_DWORD *)buf = 138413314;
    id v80 = v12;
    __int16 v81 = 2112;
    id v82 = v18;
    __int16 v83 = 2112;
    id v84 = v14;
    __int16 v85 = 2048;
    int64_t v86 = a6;
    __int16 v87 = 2112;
    id v88 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Call source %@ ended call with UUID %@ with ended at date %@ with reason %ld failure context %@",  buf,  0x34u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v13,  v12));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _providerForCallSource:](self, "_providerForCallSource:", v12));
  int v65 = v15;
  if (!v19)
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource pendingCallsToChatUUIDs](self, "pendingCallsToChatUUIDs"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v13]);

    if (v30)
    {
      unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v76[0] = @"CSDIDSPendingChatUUIDKey";
      v76[1] = @"CSDIDSPendingCallKey";
      v77[0] = v13;
      v77[1] = v30;
      BOOL v32 = v20;
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));
      [v31 postNotificationName:@"CSDIDSPendingMessageDidReceiveCancelNotification" object:0 userInfo:v33];

      uint64_t v20 = v32;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource pendingCallsToChatUUIDs](self, "pendingCallsToChatUUIDs"));
      [v34 setObject:0 forKeyedSubscript:v13];
    }

    else
    {
      id v36 = sub_1001704C4();
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        char v37 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
        *(_DWORD *)buf = 138412802;
        id v80 = v12;
        __int16 v81 = 2112;
        id v82 = v37;
        __int16 v83 = 2112;
        id v84 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  OS_LOG_TYPE_DEFAULT,  "[WARN] No call found for call source %@ and UUID %@. All calls: %@",  buf,  0x20u);
      }
    }

    goto LABEL_19;
  }

  if ([v19 isIncoming]
    && v20
    && ([v20 isSystemProvider] & 1) == 0
    && (+[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate"),
        double v22 = v21,
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 dateCreated]),
        [v23 timeIntervalSinceReferenceDate],
        double v25 = v22 - v24,
        v23,
        v25 < 2.0))
  {
    __int128 v39 = v14;
    id v40 = sub_1001704C4();
    __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
      *(_DWORD *)buf = 138412290;
      id v80 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "[WARN] Deferring acknowledgement of VoIP call with UUID %@ ended until minimum ring duration has passed",  buf,  0xCu);
    }

    dispatch_time_t v43 = dispatch_time(0LL, (uint64_t)((2.0 - v25 + 0.01) * 1000000000.0));
    uint64_t v44 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019B904;
    block[3] = &unk_1003DC5C8;
    block[4] = self;
    id v71 = v12;
    id v72 = v13;
    id v73 = v39;
    int64_t v75 = a6;
    id v35 = v65;
    id v74 = v65;
    dispatch_after(v43, v44, block);

    id v14 = v39;
  }

  else
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v19 dateEnded]);

    if (v26)
    {
      id v27 = sub_1001704C4();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v80 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[WARN] Call %@ already has a date ended",  buf,  0xCu);
      }

LABEL_19:
      id v35 = v65;
      goto LABEL_20;
    }

    [v19 setEndedReason:a6];
    id v35 = v15;
    [v19 setFailureContext:v15];
    if (v14)
    {
      [v19 setDateEnded:v14];
    }

    else
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v19 setDateEnded:v45];
    }

    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v19 callGroupUUID]);

    if (v46)
    {
      id v61 = v20;
      id v62 = v14;
      id v63 = v13;
      id v64 = v12;
      id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int16 v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls"));
      id v49 = [v48 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v49)
      {
        id v50 = v49;
        uint64_t v51 = *(void *)v67;
        do
        {
          for (i = 0LL; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v67 != v51) {
              objc_enumerationMutation(v48);
            }
            id v53 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
            if (v53 != v19)
            {
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v19 callGroupUUID]);
              unsigned int v56 = [v54 isEqual:v55];

              if (v56) {
                [v47 addObject:v53];
              }
            }
          }

          id v50 = [v48 countByEnumeratingWithState:&v66 objects:v78 count:16];
        }

        while (v50);
      }

      id v13 = v63;
      id v12 = v64;
      uint64_t v20 = v61;
      id v14 = v62;
      id v35 = v65;
      if ([v47 count] == (id)1)
      {
        id v57 = sub_1001704C4();
        __int16 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);
          *(_DWORD *)buf = 138412290;
          id v80 = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Setting callGroupUUID to nil for orphaned grouped call %@",  buf,  0xCu);
        }

        id v60 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);
        [v60 setCallGroupUUID:0];
      }
    }
  }

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ sent invitation for outgoing call with UUID %@ at date %@",  (uint8_t *)&v25,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v9,  v8));
  id v14 = v13;
  if (v13)
  {
    if ([v13 isOutgoing])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateSentInvitation]);

      if (!v15)
      {
        if (v10)
        {
          [v14 setDateSentInvitation:v10];
          goto LABEL_15;
        }

        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v14 setDateSentInvitation:v17];
        goto LABEL_14;
      }

      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        int v25 = 138412290;
        id v26 = v18;
        id v19 = "[WARN] Call with UUID %@ already has a date started outgoing";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, 0xCu);
      }
    }

    else
    {
      id v24 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        int v25 = 138412290;
        id v26 = v18;
        id v19 = "[WARN] Call with UUID %@ is not outgoing";
        goto LABEL_13;
      }
    }

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ started connecting call with UUID %@ at date %@",  (uint8_t *)&v25,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v9,  v8));
  id v14 = v13;
  if (v13)
  {
    if ([v13 isOutgoing])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateStartedConnecting]);

      if (!v15)
      {
        if (v10)
        {
          [v14 setDateStartedConnecting:v10];
          goto LABEL_15;
        }

        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v14 setDateStartedConnecting:v17];
        goto LABEL_14;
      }

      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        int v25 = 138412290;
        id v26 = v18;
        id v19 = "[WARN] Call with UUID %@ already has a date started connecting";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, 0xCu);
      }
    }

    else
    {
      id v24 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        int v25 = 138412290;
        id v26 = v18;
        id v19 = "[WARN] Call with UUID %@ is not outgoing";
        goto LABEL_13;
      }
    }

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ connected outgoing call with UUID %@ at date %@",  (uint8_t *)&v25,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v9,  v8));
  id v14 = v13;
  if (v13)
  {
    if (([v13 isOutgoing] & 1) == 0
      && ![v14 shouldAcceptDateConnectedProviderUpdates])
    {
      id v24 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        int v25 = 138412290;
        id v26 = v18;
        id v19 = "[WARN] Call with %@ is not outgoing";
        goto LABEL_16;
      }

- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v8,  v13));
  if (!v10)
  {
    id v11 = -[CSDProviderCall initOutgoingWithUpdate:callUUID:backingCallSource:isExpanseProvider:]( objc_alloc(&OBJC_CLASS___CSDProviderCall),  "initOutgoingWithUpdate:callUUID:backingCallSource:isExpanseProvider:",  v9,  v8,  v13,  1LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    [v12 setCallDelegatesIfNeeded:v11];
    [v12 propertiesChangedForCall:v11];
  }
}

- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    double v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Call source %@ finished audio for call with UUID %@",  (uint8_t *)&v19,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  v7,  v6));
  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      int v19 = 138412546;
      id v20 = v11;
      __int16 v21 = 2112;
      double v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Found call %@ for UUID %@, so setting hasAudioFinished",  (uint8_t *)&v19,  0x16u);
    }

    [v11 setHasAudioFinished:1];
  }

  else
  {
    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      int v19 = 138412290;
      id v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Did not find a call for UUID %@, so expediting deferred end interruption instead",  (uint8_t *)&v19,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 audioController]);
    [v18 expediteDeferredEndInterruptionForCallWithUUID:v7];
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6
{
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[CSDProviderCallDataSource _callWithUUID:backingCallSource:]( self,  "_callWithUUID:backingCallSource:",  a4,  a3));
  id v12 = (void *)v11;
  if (v11)
  {
    if (a6 == 2)
    {
      uint64_t v17 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      BOOL v14 = self;
      id v15 = v10;
      uint64_t v16 = 2LL;
      goto LABEL_6;
    }

    if (a6 == 1)
    {
      uint64_t v18 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      BOOL v14 = self;
      id v15 = v10;
      uint64_t v16 = 1LL;
LABEL_6:
      -[CSDCallDataSource handleFrequencyDataChanged:inDirection:forCalls:]( v14,  "handleFrequencyDataChanged:inDirection:forCalls:",  v15,  v16,  v13);
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6
{
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource _callWithUUID:backingCallSource:](self, "_callWithUUID:backingCallSource:", a4, a3));
  id v10 = (void *)v9;
  if (v9)
  {
    if (a6 == 2)
    {
      uint64_t v15 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      id v12 = self;
      *(float *)&double v13 = a5;
      uint64_t v14 = 2LL;
      goto LABEL_6;
    }

    if (a6 == 1)
    {
      uint64_t v16 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
      id v12 = self;
      *(float *)&double v13 = a5;
      uint64_t v14 = 1LL;
LABEL_6:
      -[CSDCallDataSource handleMeterLevelChanged:inDirection:forCalls:]( v12,  "handleMeterLevelChanged:inDirection:forCalls:",  v14,  v11,  v13);
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sub_1001704C4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    int v17 = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v15;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2048;
    int64_t v24 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Call source %@ received call with UUID: %@ crossDeviceIdentifier %@ bytesOfDataUsed %ld",  (uint8_t *)&v17,  0x2Au);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  -[CSDCallDataSource handleBytesOfDataUsedChanged:forCallWithUniqueProxyIdentifier:callHistoryIdentifier:]( self,  "handleBytesOfDataUsedChanged:forCallWithUniqueProxyIdentifier:callHistoryIdentifier:",  a6,  v16,  v12);
}

- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call source %@ received requested transaction %@",  (uint8_t *)&v13,  0x16u);
  }

  -[CSDProviderCallDataSource _processRequestedTransaction:fromCallSource:completion:]( self,  "_processRequestedTransaction:fromCallSource:completion:",  v9,  v8,  v10);
}

- (void)callSourceManager:(id)a3 completedTransactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019C930;
  block[3] = &unk_1003D7828;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)callSourcesChangedForCallSourceManager:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019CEE4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)callControllerHost:(id)a3 clientWithIdentifier:(id)a4 requestedTransaction:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1001704C4();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Call controller host %@ requested transaction %@ for connection with identifier: %@",  buf,  0x20u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceFetcher](self, "callSourceFetcher"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10019D2EC;
  v19[3] = &unk_1003DC5F0;
  id v20 = v12;
  __int16 v21 = self;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  [v16 fetchCallSourceForIdentifier:v11 completion:v19];
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Marking all calls as changed because providers changed",  buf,  2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource calls](self, "calls", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) propertiesChanged];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v8);
  }
}

- (id)callSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCallDataSource callSourceManager](self, "callSourceManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callSourceWithIdentifier:v4]);

  return v6;
}

+ (BOOL)_isSystemProviderForIdentifier:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.coretelephony"];
  unsigned __int8 v5 = [v3 isEqualToString:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

  return v4 | v5;
}

- (CSDCoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CSDFaceTimeProviderDelegate)faceTimeProviderDelegate
{
  return self->_faceTimeProviderDelegate;
}

- (CSDCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDCallFilterController)callFilterController
{
  return self->_callFilterController;
}

- (void)setCallFilterController:(id)a3
{
}

- (CXCallControllerHost)callControllerHost
{
  return self->_callControllerHost;
}

- (BOOL)deferCommittingTransactions
{
  return self->_deferCommittingTransactions;
}

- (void)setDeferCommittingTransactions:(BOOL)a3
{
  self->_deferCommittingTransactions = a3;
}

- (CXInProcessCallSource)faceTimeCallSource
{
  return self->_faceTimeCallSource;
}

- (CXInProcessCallSource)superboxCallSource
{
  return self->_superboxCallSource;
}

- (_TtC13callservicesd27CSDSuperboxProviderDelegate)superboxProviderDelegate
{
  return self->_superboxProviderDelegate;
}

- (CSDCallSourceFetcher)callSourceFetcher
{
  return self->_callSourceFetcher;
}

- (NSMutableDictionary)pendingCallsToChatUUIDs
{
  return self->_pendingCallsToChatUUIDs;
}

- (NSMutableDictionary)pendingPulledCallContexts
{
  return self->_pendingPulledCallContexts;
}

- (CXCallSourceManager)callSourceManager
{
  return self->_callSourceManager;
}

- (CSDVoIPProcessAssertionManager)processAssertionManager
{
  return self->_processAssertionManager;
}

- (CSDRelayCallDataSource)relayCallDataSource
{
  return (CSDRelayCallDataSource *)objc_loadWeakRetained((id *)&self->_relayCallDataSource);
}

- (void)setRelayCallDataSource:(id)a3
{
}

- (BOOL)sharingModeEnabled
{
  return self->_sharingModeEnabled;
}

- (void)setSharingModeEnabled:(BOOL)a3
{
  self->_sharingModeEnabled = a3;
}

- (void)setRouteManager:(id)a3
{
}

- (id)dndAllowsCall
{
  return self->_dndAllowsCall;
}

- (void)setDndAllowsCall:(id)a3
{
}

- (id)supportsPrimaryCalling
{
  return self->_supportsPrimaryCalling;
}

- (void)setSupportsPrimaryCalling:(id)a3
{
}

- (id)shouldPreferRelayOverDirectSecondaryCalling
{
  return self->_shouldPreferRelayOverDirectSecondaryCalling;
}

- (void)setShouldPreferRelayOverDirectSecondaryCalling:(id)a3
{
}

- (id)shouldFilterCall
{
  return self->_shouldFilterCall;
}

- (void)setShouldFilterCall:(id)a3
{
}

- (id)lowPowerModeEnabledBlock
{
  return self->_lowPowerModeEnabledBlock;
}

- (void)setLowPowerModeEnabledBlock:(id)a3
{
}

- (id)callDirectoryAllowsCallFromSourceAddress
{
  return self->_callDirectoryAllowsCallFromSourceAddress;
}

- (void)setCallDirectoryAllowsCallFromSourceAddress:(id)a3
{
}

- (id)blockedByExtension
{
  return self->_blockedByExtension;
}

- (void)setBlockedByExtension:(id)a3
{
}

- (double)dispatchDelay
{
  return self->_dispatchDelay;
}

- (void)setDispatchDelay:(double)a3
{
  self->_dispatchDelay = a3;
}

- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities
{
  return self->_protectedAppsUtilities;
}

- (void)setProtectedAppsUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end