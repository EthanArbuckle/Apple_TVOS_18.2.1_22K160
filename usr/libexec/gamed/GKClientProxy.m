@interface GKClientProxy
+ (BOOL)isExtensionBundleID:(id)a3;
+ (BOOL)isFirstParty:(BOOL)a3 sourceApp:(id)a4 allowList:(id)a5;
+ (id)_clientLookup;
+ (id)_existingManagedObjectContextForPlayerID:(id)a3;
+ (id)_newManagedObjectContextWithCacheURL:(id)a3 environment:(int64_t)a4 psc:(id)a5 storeOptions:(id)a6;
+ (id)cacheDirectoryForBundleID:(id)a3;
+ (id)cacheFileQueue;
+ (id)clientForBundleID:(id)a3;
+ (id)clientForBundleID:(id)a3 bundle:(id)a4 pid:(int)a5 createIfNecessary:(BOOL)a6;
+ (id)clientForBundleID:(id)a3 pid:(int)a4 createIfNecessary:(BOOL)a5;
+ (id)clientForInviteSessionToken:(id)a3;
+ (id)clientForMatchmakingRID:(id)a3;
+ (id)clientForProcessIdentifier:(int)a3;
+ (id)clientsToBeEnumerated;
+ (id)contextKeyForPlayerID:(id)a3;
+ (id)createPersistentStoreCoordinator;
+ (id)factoryQueue;
+ (id)foregroundClient;
+ (id)gameCenterCacheDatabaseURLForPlayerID:(id)a3 language:(id)a4 name:(id)a5 fileManager:(id)a6;
+ (id)gameCenterClient;
+ (id)getParentBundleIDPrefixWithChildBundleID:(id)a3 parentBundleID:(id)a4;
+ (id)insecureDatabaseDirectoryURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5;
+ (id)insecureDatabaseFileURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5 name:(id)a6;
+ (id)lastKnownAppInitStateForClientWithBundleID:(id)a3 pid:(int)a4;
+ (id)managedObjectModel;
+ (id)newManagedObjectContextForPlayerID:(id)a3 bundleID:(id)a4 language:(id)a5 environment:(int64_t)a6;
+ (id)nonGameCenterForegroundClient;
+ (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3;
+ (id)syncQueue;
+ (void)authenticationDidChange;
+ (void)closeDatabaseFromManagedObjectContextForMOC:(id)a3;
+ (void)closeDatabaseFromManagedObjectContextForPlayerID:(id)a3;
+ (void)enumerateClientsUsingBlock:(id)a3;
+ (void)migrateInsecureDatabaseToSecureDatabaseURL:(id)a3 usingPersistantStoreCoordinator:(id)a4 fileManager:(id)a5 options:(id)a6 playerID:(id)a7 bundleID:(id)a8 language:(id)a9 name:(id)a10;
+ (void)performDelayedRequestsForEnvironment:(int64_t)a3;
+ (void)removeAllCaches;
+ (void)removeAllCachesWithHandler:(id)a3;
+ (void)removeCacheForPlayerID:(id)a3;
+ (void)removeClient:(id)a3;
+ (void)saveAppInitState:(id)a3 forBundleID:(id)a4 pid:(int)a5;
- (BOOL)clientHasAnyPrivateEntitlement;
- (BOOL)conformsToMultiUserRestrictions;
- (BOOL)distributorIsFirstPartyApple;
- (BOOL)initialized;
- (BOOL)installed;
- (BOOL)isAppUnlistedAndDisallowed;
- (BOOL)isDevSigned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtension;
- (BOOL)isGameCenter;
- (BOOL)isGameCenterEnabledClient;
- (BOOL)isOcelot;
- (BOOL)isUIService;
- (BOOL)processMatchResponse:(id)a3;
- (BOOL)setAppInitState:(id)a3;
- (BOOL)supportsMultipleActivePlayers;
- (BOOL)supportsNearbyAdvertising;
- (GKClientProxy)initWithBundleIdentifier:(id)a3 bundleOrNil:(id)a4 pid:(int)a5;
- (GKDatabaseConnection)delayedRequestsDBConnection;
- (GKEntitlements)entitlements;
- (GKEventTuple)launchEvent;
- (GKGameInternal)currentGame;
- (GKInviteSession)inviteSession;
- (GKMatchResponse)currentMatchResponse;
- (GKPeerDiscovery)peerDiscovery;
- (GKThreadsafeDictionary)appSessions;
- (GKUIViewService)viewService;
- (GKViceroyNearbyDiscovery)nearbyDiscovery;
- (LSApplicationRecord)applicationRecord;
- (NSDate)achievementsRateLimitingStartDate;
- (NSDate)scoresRateLimitingStartDate;
- (NSDictionary)gameDescriptor;
- (NSDictionary)preferencesFromBag;
- (NSLocale)locale;
- (NSMapTable)extensionProxies;
- (NSMutableArray)pendingDataTypesForRefresh;
- (NSMutableDictionary)alreadyCoalescingNetworkRequests;
- (NSNumber)adamID;
- (NSNumber)externalVersion;
- (NSNumber)sandboxExtensionToken;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)description;
- (NSString)language;
- (NSString)originalBundleIdentifier;
- (NSString)parentBundleIdentifier;
- (NSString)persistentAnchorIdentifier;
- (NSString)protocolVersion;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)authQueue;
- (OS_dispatch_queue)cacheQueue;
- (OS_dispatch_queue)checkMatchStatusQueue;
- (OS_dispatch_queue)delayedRequestsQueue;
- (OS_dispatch_queue)replyQueue;
- (OS_dispatch_source)checkMatchStatusTimer;
- (_GKStateMachine)appInitStateMachine;
- (id)_delayedRequestWriterWithCacheWriterClass:(Class)a3 cacheReaderClass:(Class)a4 networkWriterClass:(Class)a5 bagKey:(id)a6 batchSubmissionInterval:(int64_t)a7 credential:(id)a8;
- (id)_managedObjectContextForPlayerID:(id)a3;
- (id)appInitState;
- (id)appSessionForPlayer:(id)a3;
- (id)appTerminateRequestWithBackgroundFlag:(BOOL)a3;
- (id)connectionProxyForUseCase:(id)a3;
- (id)credentialForPlayer:(id)a3;
- (id)deletePlayerPhotoWriterWithCredential:(id)a3;
- (id)fetchOrCreateInviteSession;
- (id)missingTransitionFromState:(id)a3 toState:(id)a4;
- (id)removeGameWriterWithCredential:(id)a3;
- (id)requestsCacheForEnvironment:(int64_t)a3;
- (id)serviceForClass:(Class)a3 transport:(id)a4 client:(id)a5 credential:(id)a6;
- (id)setPlayerPhotoWriterWithCredential:(id)a3;
- (id)setPlayerStatusWriterWithCredential:(id)a3;
- (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3;
- (id)transactionGroupIfCacheExistsForPlayerID:(id)a3;
- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4;
- (id)transportWithCredential:(id)a3;
- (id)verifyAuthorized;
- (int)pid;
- (int64_t)achievementsRateLimitingCurrentNumberOfRequests;
- (int64_t)appSignatureType;
- (int64_t)environment;
- (int64_t)scoresRateLimitingCurrentNumberOfRequests;
- (unint64_t)hash;
- (unsigned)achievementsRateLimitedCurrentState;
- (unsigned)applicationState;
- (unsigned)previousApplicationState;
- (unsigned)scoresRateLimitedCurrentState;
- (void)_removeDelayedRequestStore;
- (void)_setupDelayedRequestsWriters;
- (void)acceptInviteWithNotification:(id)a3;
- (void)acceptMultiplayerGameInvite;
- (void)achievementSelected:(id)a3;
- (void)addAppSession:(id)a3 forCredential:(id)a4;
- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5;
- (void)backgroundWithCompletionHandler:(id)a3;
- (void)beginNetworkActivity;
- (void)bgInitializeWithCredential:(id)a3 completionHandler:(id)a4;
- (void)cancelGameInvite:(id)a3;
- (void)cancelInvitationForSession:(id)a3 playerID:(id)a4 pushTokens:(id)a5 handler:(id)a6;
- (void)cancelInviteWithNotification:(id)a3;
- (void)cancelOutstandingCheckMatchStatus;
- (void)challengeCompleted:(id)a3;
- (void)challengeReceived:(id)a3;
- (void)checkMatchStatus;
- (void)clearDiscoveryInfo;
- (void)completedChallengeSelected:(id)a3;
- (void)completedOptimisticAuthenticationWithResponse:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)declineInviteWithNotification:(id)a3;
- (void)deleteInviteSession;
- (void)didConnectToParticipantWithID:(id)a3;
- (void)didDisconnectFromParticipantWithID:(id)a3;
- (void)didEnterForeground;
- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6;
- (void)endNetworkActivity;
- (void)fetchTurnBasedData;
- (void)friendRequestSelected:(id)a3;
- (void)getAccountNameWithHandler:(id)a3;
- (void)getAuthenticatedLocalPlayersWithStatus:(unint64_t)a3 handler:(id)a4;
- (void)getAuthenticatedPlayerCredential:(id)a3;
- (void)getAuthenticatedPlayerIDWithHandler:(id)a3;
- (void)getAuthenticatedPlayerInfo:(id)a3;
- (void)getGamedFiredUpWithHandler:(id)a3;
- (void)getPreferenceForKey:(id)a3 handler:(id)a4;
- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getPrivateServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
- (void)initializeInitializationStateMachine;
- (void)initializeWithCredential:(id)a3 completionHandler:(id)a4;
- (void)loadRemoteImageDataForURL:(id)a3 reply:(id)a4;
- (void)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4 handler:(id)a5;
- (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5;
- (void)metricsValuesChanged;
- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5;
- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5;
- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4;
- (void)performAsync:(id)a3;
- (void)performDelayedRequestsForCredential:(id)a3;
- (void)performDelayedRequestsForEnvironment:(int64_t)a3;
- (void)performSync:(id)a3;
- (void)playerFound:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5;
- (void)playerLost:(id)a3 deviceID:(id)a4;
- (void)presentBannerWithNotification:(id)a3;
- (void)receivedChallengeSelected:(id)a3;
- (void)receivedData:(id)a3 deviceID:(id)a4 data:(id)a5;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)refreshPendingDataTypes;
- (void)relayPushNotification:(id)a3;
- (void)removeAppSessionForPlayer:(id)a3;
- (void)requestSandboxExtension:(id)a3;
- (void)resetLoginCancelCount;
- (void)resetNetworkActivity;
- (void)respondedToNearbyInvite:(id)a3;
- (void)scoreSelected:(id)a3;
- (void)sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:(id)a3 completionHandler:(id)a4;
- (void)setAchievementsRateLimitedCurrentState:(unsigned __int8)a3;
- (void)setAchievementsRateLimitingCurrentNumberOfRequests:(int64_t)a3;
- (void)setAchievementsRateLimitingStartDate:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAlreadyCoalescingNetworkRequests:(id)a3;
- (void)setAppInitStateMachine:(id)a3;
- (void)setAppSessions:(id)a3;
- (void)setApplicationState:(unsigned int)a3;
- (void)setAuthQueue:(id)a3;
- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCacheQueue:(id)a3;
- (void)setCheckMatchStatusQueue:(id)a3;
- (void)setCheckMatchStatusTimer:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentGame:(id)a3;
- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5;
- (void)setCurrentMatchResponse:(id)a3;
- (void)setDelayedRequestsDBConnection:(id)a3;
- (void)setDelayedRequestsQueue:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setExtensionProxies:(id)a3;
- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4;
- (void)setExternalVersion:(id)a3;
- (void)setHostPID:(int)a3 reply:(id)a4;
- (void)setInitialized:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setInviteSession:(id)a3;
- (void)setIsAppUnlistedAndDisallowed:(BOOL)a3;
- (void)setIsGameCenterEnabledClient:(BOOL)a3;
- (void)setIsOcelot:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLaunchEvent:(id)a3;
- (void)setLaunchEvent:(unint64_t)a3 withContext:(id)a4;
- (void)setNearbyDiscovery:(id)a3;
- (void)setOriginalBundleIdentifier:(id)a3;
- (void)setParentBundleIdentifier:(id)a3;
- (void)setPeerDiscovery:(id)a3;
- (void)setPendingDataTypesForRefresh:(id)a3;
- (void)setPersistentAnchorIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setPreferencesFromBag:(id)a3;
- (void)setPreferencesValues:(id)a3;
- (void)setPreviousApplicationState:(unsigned int)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setScoresRateLimitedCurrentState:(unsigned __int8)a3;
- (void)setScoresRateLimitingCurrentNumberOfRequests:(int64_t)a3;
- (void)setScoresRateLimitingStartDate:(id)a3;
- (void)setSupportsMultipleActivePlayers:(BOOL)a3;
- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5;
- (void)setViewService:(id)a3;
- (void)stateDidChange;
- (void)terminateWithCompletionHandler:(id)a3;
- (void)updateAppInitState;
- (void)updateIfRecentlyInstalled;
- (void)updateInviteWithNotification:(id)a3;
- (void)updatePreferencesFromBag:(id)a3;
@end

@implementation GKClientProxy

- (void)initializeInitializationStateMachine
{
  v3 = objc_alloc_init(&OBJC_CLASS____GKStateMachine);
  v8[0] = @"GKAppInitInProgress";
  v7[0] = @"GKAppInitUnknown";
  v7[1] = @"GKAppInitInProgress";
  v6[0] = @"GKAppInitialized";
  v6[1] = @"GKAppInitUnknown";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  v7[2] = @"GKAppInitialized";
  v8[1] = v4;
  v8[2] = @"GKAppInitUnknown";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));
  -[_GKStateMachine setValidTransitions:](v3, "setValidTransitions:", v5);

  -[_GKStateMachine setCurrentState:](v3, "setCurrentState:", @"GKAppInitUnknown");
  -[_GKStateMachine setDelegate:](v3, "setDelegate:", self);
  -[_GKStateMachine setShouldLogStateTransitions:](v3, "setShouldLogStateTransitions:", 1LL);
  -[GKClientProxy setAppInitStateMachine:](self, "setAppInitStateMachine:", v3);
}

- (GKClientProxy)initWithBundleIdentifier:(id)a3 bundleOrNil:(id)a4 pid:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v11 = -[GKClientProxy init](self, "init");
  if (!v11) {
    goto LABEL_34;
  }
  context = objc_autoreleasePoolPush();
  if (!v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKClientProxy MUST have a bundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (bundleIdentifier != nil)\n[%s (%s:%d)]",  v12,  "-[GKClientProxy initWithBundleIdentifier:bundleOrNil:pid:]",  [v14 UTF8String],  177));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationProxyForBundleID:v9]);
  v18 = v17;
  v11->_installed = v17 != 0LL;
  if (!v10) {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v17 bundle]);
  }
  id v19 = (id)objc_claimAutoreleasedReturnValue([v18 bundleVersion]);
  if ([v9 isEqualToString:GKGameCenterIdentifier])
  {
    id v20 = GKGameCenterBundleVersion;

    id v19 = v20;
  }

  if (!v19) {
    id v19 = (id)objc_claimAutoreleasedReturnValue([v10 _gkBundleVersion]);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleShortVersion]);
  if ((v21 || (v21 = (void *)objc_claimAutoreleasedReturnValue([v10 _gkBundleShortVersion])) != 0)
    && !v19)
  {
    id v19 = v21;
  }

  else if (!v19 || v21)
  {
    goto LABEL_17;
  }

  id v19 = v19;
  v21 = v19;
LABEL_17:
  v11->_pid = v5;
  objc_storeStrong((id *)&v11->_bundleIdentifier, a3);
  v22 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v9,  0LL,  0LL);
  applicationRecord = v11->_applicationRecord;
  v11->_applicationRecord = v22;

  objc_storeStrong((id *)&v11->_bundleVersion, v19);
  objc_storeStrong((id *)&v11->_bundleShortVersion, v21);
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v18 adamID]);
  adamID = v11->_adamID;
  v11->_adamID = (NSNumber *)v24;

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v18 externalVersion]);
  externalVersion = v11->_externalVersion;
  v11->_externalVersion = (NSNumber *)v26;

  v11->_isAppUnlistedAndDisallowed = 0;
  uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSBundle _gkPreferredSystemLanguage](&OBJC_CLASS___NSBundle, "_gkPreferredSystemLanguage"));
  language = v11->_language;
  v11->_language = (NSString *)v28;

  if (!v11->_language)
  {
    uint64_t v30 = GKGetPreferredLanguage();
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSLocale canonicalLanguageIdentifierFromString:]( &OBJC_CLASS___NSLocale,  "canonicalLanguageIdentifierFromString:",  v31));
    v33 = v11->_language;
    v11->_language = (NSString *)v32;
  }

  v11->_applicationState = GKGetApplicationStateForBundleID(v11->_bundleIdentifier);
  dispatch_queue_t v34 = dispatch_queue_create("com.apple.gamecenter.clientproxy.authQueue", 0LL);
  authQueue = v11->_authQueue;
  v11->_authQueue = (OS_dispatch_queue *)v34;

  dispatch_queue_t v36 = dispatch_queue_create("com.apple.gamecenter.clientproxy.checkMatchStatusQueue", 0LL);
  checkMatchStatusQueue = v11->_checkMatchStatusQueue;
  v11->_checkMatchStatusQueue = (OS_dispatch_queue *)v36;

  dispatch_queue_t v38 = dispatch_queue_create("com.apple.gamecenter.clientproxy.replyQueue", 0LL);
  replyQueue = v11->_replyQueue;
  v11->_replyQueue = (OS_dispatch_queue *)v38;

  -[GKClientProxy initializeInitializationStateMachine](v11, "initializeInitializationStateMachine");
  dispatch_queue_t v40 = dispatch_queue_create("com.apple.gamecenter.clientproxy.cacheQueue", 0LL);
  cacheQueue = v11->_cacheQueue;
  v11->_cacheQueue = (OS_dispatch_queue *)v40;

  dispatch_queue_t v42 = dispatch_queue_create("com.apple.gamecenter.clientproxy.delayedRequestsQueue", 0LL);
  delayedRequestsQueue = v11->_delayedRequestsQueue;
  v11->_delayedRequestsQueue = (OS_dispatch_queue *)v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v11->_environment = (int64_t)[v44 currentEnvironment];
  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pendingDataTypesForRefresh = v11->_pendingDataTypesForRefresh;
  v11->_pendingDataTypesForRefresh = v45;

  v47 = objc_alloc(&OBJC_CLASS___GKThreadsafeDictionary);
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.gamed.gk-app-sessions-%@-%d",  v9,  v5));
  v49 = -[GKThreadsafeDictionary initWithName:](v47, "initWithName:", v48);
  appSessions = v11->_appSessions;
  v11->_appSessions = v49;

  v11->_achievementsRateLimitingCurrentNumberOfRequests = 0LL;
  v11->_achievementsRateLimitedCurrentState = 0;
  uint64_t v51 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  achievementsRateLimitingStartDate = v11->_achievementsRateLimitingStartDate;
  v11->_achievementsRateLimitingStartDate = (NSDate *)v51;

  v11->_scoresRateLimitingCurrentNumberOfRequests = 0LL;
  v11->_scoresRateLimitedCurrentState = 0;
  uint64_t v53 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  scoresRateLimitingStartDate = v11->_scoresRateLimitingStartDate;
  v11->_scoresRateLimitingStartDate = (NSDate *)v53;

  v55 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  5LL,  5LL,  6LL);
  extensionProxies = v11->_extensionProxies;
  v11->_extensionProxies = v55;

  v57 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[GKClientProxy setAlreadyCoalescingNetworkRequests:](v11, "setAlreadyCoalescingNetworkRequests:", v57);

  if (v10)
  {
    id v59 = [v10 _gkIsEligibleForNearbyAdvertising];
    if ((v59 & 1) != 0)
    {
      v11->_supportsNearbyAdvertising = 1;
      if (!os_log_GKGeneral) {
        id v60 = (id)GKOSLoggers(v59);
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_1000E9208();
      }
    }

    else
    {
      v11->_supportsNearbyAdvertising = 0;
      if (!os_log_GKGeneral) {
        id v64 = (id)GKOSLoggers(v59);
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_1000E9270();
      }
    }
  }

  else
  {
    v11->_supportsNearbyAdvertising = 0;
    if (!os_log_GKGeneral) {
      id v61 = (id)GKOSLoggers(v58);
    }
    v62 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9194((uint64_t)v9, v62, v63);
    }
  }

  objc_autoreleasePoolPop(context);
LABEL_34:

  return v11;
}

- (GKViceroyNearbyDiscovery)nearbyDiscovery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v4 = [v3 disableViceroyNearby];

  if ((v4 & 1) != 0)
  {
LABEL_14:
    v11 = 0LL;
    return v11;
  }

  BOOL v5 = -[GKClientProxy supportsNearbyAdvertising](self, "supportsNearbyAdvertising");
  if (!v5)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v5);
    }
    v13 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9358(v13);
    }
    goto LABEL_14;
  }

  nearbyDiscovery = self->_nearbyDiscovery;
  if (!nearbyDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v5);
    }
    v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E92D8(v8);
    }
    id v9 = objc_alloc_init(&OBJC_CLASS___GKViceroyNearbyDiscovery);
    id v10 = self->_nearbyDiscovery;
    self->_nearbyDiscovery = v9;

    nearbyDiscovery = self->_nearbyDiscovery;
  }

  v11 = nearbyDiscovery;
  return v11;
}

- (GKPeerDiscovery)peerDiscovery
{
  BOOL v3 = -[GKClientProxy supportsNearbyAdvertising](self, "supportsNearbyAdvertising");
  if (v3)
  {
    peerDiscovery = self->_peerDiscovery;
    if (!peerDiscovery)
    {
      if (!os_log_GKGeneral) {
        id v5 = (id)GKOSLoggers(v3);
      }
      v6 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_1000E9404(v6);
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "pushCredentialForEnvironment:",  -[GKClientProxy environment](self, "environment")));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerInternal]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pushToken]);

      if (v11
        && (v13 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]), v13, v13))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
        unsigned int v15 = [v14 fastSyncTransportEnabled];

        if (v15)
        {
          v16 = objc_alloc(&OBJC_CLASS___GKPeerDiscovery);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]);
          v18 = -[GKPeerDiscovery initWithDelegate:localPlayerID:localPushToken:]( v16,  "initWithDelegate:localPlayerID:localPushToken:",  self,  v17,  v11);
          id v19 = self->_peerDiscovery;
          self->_peerDiscovery = v18;
        }
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v23 = (id)GKOSLoggers(v12);
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_1000E93D8();
        }
      }

      peerDiscovery = self->_peerDiscovery;
    }

    v22 = peerDiscovery;
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers(v3);
    }
    v21 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9484(v21);
    }
    v22 = 0LL;
  }

  return v22;
}

- (void)clearDiscoveryInfo
{
  if (self->_nearbyDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v3 = (id)GKOSLoggers(self);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9530();
    }
    -[GKViceroyNearbyDiscovery stopBrowsing](self->_nearbyDiscovery, "stopBrowsing");
    -[GKViceroyNearbyDiscovery stopAdvertising](self->_nearbyDiscovery, "stopAdvertising");
    nearbyDiscovery = self->_nearbyDiscovery;
    self->_nearbyDiscovery = 0LL;
  }

  if (self->_peerDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers(self);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9504();
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  327LL,  "-[GKClientProxy clearDiscoveryInfo]"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v6));

    [v7 enter];
    peerDiscovery = self->_peerDiscovery;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000DB704;
    v15[3] = &unk_10026B670;
    id v9 = v7;
    id v16 = v9;
    -[GKPeerDiscovery stopListeningWithCompletionHandler:](peerDiscovery, "stopListeningWithCompletionHandler:", v15);
    [v9 enter];
    id v10 = self->_peerDiscovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000DB76C;
    v13[3] = &unk_10026B670;
    id v14 = v9;
    id v11 = v9;
    -[GKPeerDiscovery stopBrowsingWithCompletionHandler:](v10, "stopBrowsingWithCompletionHandler:", v13);
    [v11 wait];
    uint64_t v12 = self->_peerDiscovery;
    self->_peerDiscovery = 0LL;
  }

- (NSString)parentBundleIdentifier
{
  return 0LL;
}

- (BOOL)distributorIsFirstPartyApple
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesMetadata]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 distributorInfo]);
  id v6 = [v5 distributorIsFirstPartyApple];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iTunesMetadata]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sourceApp]);

  if (qword_1002BB5C0 != -1) {
    dispatch_once(&qword_1002BB5C0, &stru_1002718A0);
  }
  BOOL v10 = +[GKClientProxy isFirstParty:sourceApp:allowList:]( &OBJC_CLASS___GKClientProxy,  "isFirstParty:sourceApp:allowList:",  v6,  v9,  qword_1002BB5B8);

  return v10;
}

+ (BOOL)isFirstParty:(BOOL)a3 sourceApp:(id)a4 allowList:(id)a5
{
  id v7 = a4;
  id v8 = [a5 containsObject:v7];
  char v9 = (char)v8;
  if ((_DWORD)v8)
  {
    BOOL v10 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v11 = (id)GKOSLoggers(v8);
      BOOL v10 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000E95B4();
    }
  }

  else if (!a3)
  {
    uint64_t v12 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v13 = (id)GKOSLoggers(v8);
      uint64_t v12 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9618();
    }
  }

  return v9 | a3;
}

- (void)updateIfRecentlyInstalled
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  unsigned __int8 v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKClientProxy: updateIfRecentlyInstalled", buf, 2u);
  }

  if (!-[GKClientProxy installed](self, "installed"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationProxyForBundleID:v6]);

    if (v7)
    {
      if (!os_log_GKGeneral) {
        id v9 = (id)GKOSLoggers(v8);
      }
      BOOL v10 = (os_log_s *)os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKClientProxy: updateIfRecentlyInstalled - workspace and appProxy exist, updating",  v15,  2u);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleVersion]);
      -[GKClientProxy setBundleVersion:](self, "setBundleVersion:", v11);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleShortVersion]);
      -[GKClientProxy setBundleShortVersion:](self, "setBundleShortVersion:", v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 adamID]);
      -[GKClientProxy setAdamID:](self, "setAdamID:", v13);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 externalVersion]);
      -[GKClientProxy setExternalVersion:](self, "setExternalVersion:", v14);

      -[GKClientProxy setInstalled:](self, "setInstalled:", 1LL);
    }
  }

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v3 setHostClient:0];

  -[GKClientProxy setViewService:](self, "setViewService:", 0LL);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy sandboxExtensionToken](self, "sandboxExtensionToken"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy sandboxExtensionToken](self, "sandboxExtensionToken"));
    sandbox_extension_release([v5 longLongValue]);
  }

  -[NSMapTable removeAllObjects](self->_extensionProxies, "removeAllObjects");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKClientProxy;
  -[GKClientProxy dealloc](&v6, "dealloc");
}

- (id)transportWithCredential:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeBag]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKDataTransport transportWithBag:clientProxy:credential:]( &OBJC_CLASS___GKDataTransport,  "transportWithBag:clientProxy:credential:",  v6,  self,  v4));

  return v7;
}

- (id)credentialForPlayer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountName]);

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 accountName]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "credentialForUsername:environment:",  v7,  -[GKClientProxy environment](self, "environment")));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 playerID]);

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    int64_t v10 = -[GKClientProxy environment](self, "environment");
    if (v9)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialForPlayer:v4 environment:v10]);
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameInternal bundleIdentifier](self->_currentGame, "bundleIdentifier"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryCredentialForEnvironment:v10 gameID:v11]);
    }
  }

  return v8;
}

- (NSString)description
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKClientProxy;
  id v3 = -[GKClientProxy description](&v12, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
  uint64_t pid = self->_pid;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy originalBundleIdentifier](self, "originalBundleIdentifier"));
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (identifier:%@ bundleShortVersion:%@ bundleVersion:%@ pid:%d, originalBundleIdentifier:%@)",  v4,  v5,  v6,  v7,  pid,  v9));

  return (NSString *)v10;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    unsigned int v10 = [v8 isEqual:v9];

    if (v10
      && (id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleVersion]),
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion")),
          unsigned int v13 = [v11 isEqual:v12],
          v12,
          v11,
          v13))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleShortVersion]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
      unsigned __int8 v16 = [v14 isEqual:v15];
    }

    else
    {
      unsigned __int8 v16 = 0;
    }
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (NSDictionary)gameDescriptor
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
    uint64_t v7 = (uint64_t)[v6 integerValue];

    if (v7 >= 1)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
      [v3 setObject:v8 forKey:@"adam-id"];
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy externalVersion](self, "externalVersion"));

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy externalVersion](self, "externalVersion"));
    [v3 setObject:v10 forKey:@"external-version"];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));

  if (v11)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    [v3 setObject:v12 forKey:@"bundle-id"];
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy parentBundleIdentifier](self, "parentBundleIdentifier"));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy parentBundleIdentifier](self, "parentBundleIdentifier"));
    [v3 setObject:v14 forKey:@"parent-bundle-id"];
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));

  if (v15)
  {
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
    [v3 setObject:v16 forKey:@"bundle-version"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
    [v3 setObject:v18 forKey:@"short-bundle-version"];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameDescriptor stringForPlatform:]( &OBJC_CLASS___GKGameDescriptor,  "stringForPlatform:",  +[GKApplicationWorkspace getPlatformForBundleID:]( &OBJC_CLASS___GKApplicationWorkspace,  "getPlatformForBundleID:",  v19)));
  [v3 setObject:v20 forKeyedSubscript:@"platform"];

  return (NSDictionary *)v3;
}

- (NSLocale)locale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy language](self, "language"));
  if (v2) {
    id v3 = -[NSLocale initWithLocaleIdentifier:](objc_alloc(&OBJC_CLASS___NSLocale), "initWithLocaleIdentifier:", v2);
  }
  else {
    id v3 = (NSLocale *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  }
  uint64_t v4 = v3;

  return v4;
}

- (int64_t)appSignatureType
{
  uint64_t v3 = -[GKClientProxy pid](self, "pid");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  uint64_t v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  int64_t v6 = +[GKClientAppSigningStatus appSignatureType:auditToken:]( &OBJC_CLASS___GKClientAppSigningStatus,  "appSignatureType:auditToken:",  v3,  v8);

  return v6;
}

- (BOOL)isDevSigned
{
  uint64_t v3 = -[GKClientProxy pid](self, "pid");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  uint64_t v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  BOOL v6 = +[GKClientAppSigningStatus appIsDevSigned:auditToken:]( &OBJC_CLASS___GKClientAppSigningStatus,  "appIsDevSigned:auditToken:",  v3,  v8);

  return v6;
}

- (BOOL)isGameCenter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:GKGameCenterIdentifier];

  return v3;
}

- (BOOL)isUIService
{
  return 0;
}

- (BOOL)isExtension
{
  return 0;
}

- (BOOL)conformsToMultiUserRestrictions
{
  return 1;
}

- (NSString)protocolVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  uint64_t v3 = GKGetProtocolVersionString([v2 useTestProtocols]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v10)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy preferencesFromBag](self, "preferencesFromBag"));

      if (v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy preferencesFromBag](self, "preferencesFromBag"));
        [v10 setPreferencesValues:v8];
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      [v9 setObject:v10 forKey:v6];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      [v9 removeObjectForKey:v6];
    }
  }
}

- (void)updatePreferencesFromBag:(id)a3
{
  id v4 = a3;
  -[GKClientProxy setPreferencesFromBag:](self, "setPreferencesFromBag:", v4);
  -[GKClientProxy setPreferencesValues:](self, "setPreferencesValues:", v4);
}

- (void)setLaunchEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (GKEventTuple *)objc_claimAutoreleasedReturnValue(-[GKClientProxy launchEvent](self, "launchEvent"));
  if (!v7) {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___GKEventTuple);
  }
  -[GKEventTuple setEventType:](v7, "setEventType:", a3);
  -[GKEventTuple setContext:](v7, "setContext:", v6);

  id v8 = -[GKClientProxy setLaunchEvent:](self, "setLaunchEvent:", v7);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    unsigned int v12 = -[GKEventTuple eventType](v7, "eventType");
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKEventTuple context](v7, "context"));
    v14[0] = 67109634;
    v14[1] = v12;
    __int16 v15 = 2112;
    unsigned __int8 v16 = v13;
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "New launch event(%d) context %@ for client %@",  (uint8_t *)v14,  0x1Cu);
  }
}

- (BOOL)clientHasAnyPrivateEntitlement
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));

  if (v3)
  {
    id v4 = (GKClientProxy *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectEnumerator]);
      uint64_t v5 = (GKClientProxy *)objc_claimAutoreleasedReturnValue([v9 nextObject]);

      goto LABEL_6;
    }

    id v4 = self;
  }

  uint64_t v5 = v4;
LABEL_6:
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](v5, "entitlements"));
  unsigned __int8 v11 = [v10 hasAnyPrivateEntitlement];

  return v11;
}

+ (id)syncQueue
{
  if (qword_1002BB5D0 != -1) {
    dispatch_once(&qword_1002BB5D0, &stru_1002718C0);
  }
  return (id)qword_1002BB5C8;
}

- (void)performSync:(id)a3
{
  dispatch_block_t block = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);

  if (v8 == v6)
  {
    label = dispatch_queue_get_label(v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the same queue(%s), would deadlock at %@",  "-[GKClientProxy performSync:]",  label,  v10));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]",  v11,  "-[GKClientProxy performSync:]",  [v13 UTF8String],  603));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  dispatch_sync(v6, block);
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_async(v7, v4);
}

- (void)checkMatchStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentMatchResponse](self, "currentMatchResponse"));
  if ([v3 transitionToState:3])
  {
    unsigned int v4 = [v3 sequence];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 matchingGroup]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000DCA68;
    void v7[3] = &unk_100271910;
    id v8 = v3;
    id v9 = self;
    unsigned int v11 = v4;
    id v10 = v5;
    id v6 = v5;
    [v6 perform:v7];
  }
}

- (BOOL)processMatchResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentMatchResponse](self, "currentMatchResponse"));
  id v6 = v5;
  if (!v5)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(0LL);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9644();
    }
    goto LABEL_28;
  }

  id v7 = [v5 isFinished];
  if ((_DWORD)v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v7);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_1000E9670();
    }
    goto LABEL_28;
  }

  if (!v4)
  {
LABEL_28:
    BOOL v17 = 0;
    goto LABEL_29;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"rid"]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 rid]);

  if (!v11)
  {
    [v6 setRid:v10];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 serverRequest]);
    id v13 = [v12 mutableCopy];

    [v13 setObject:v10 forKey:@"rid"];
    [v6 setServerRequest:v13];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"match-id"]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
  id v16 = [v15 integerValue];

  BOOL v17 = v16 != (id)5067;
  if (v16 == (id)5067)
  {
    [v6 transitionToState:6];
  }

  else if (v14)
  {
    if ([v6 transitionToState:4])
    {
      v48 = v10;
      -[GKClientProxy cancelOutstandingCheckMatchStatus](self, "cancelOutstandingCheckMatchStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"matches"]);
      [v6 setMatches:v18];

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"match-id"]);
      [v6 setMatchID:v19];

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"rid"]);
      [v6 setRid:v20];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"session-token"]);
      [v6 setSessionToken:v21];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ticket"]);
      [v6 setCdxTicket:v22];

      uint64_t v23 = GKSuggestedTransportVersionKey;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKSuggestedTransportVersionKey]);

      if (v24)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v23]);
        [v6 setTransportVersionToUse:v26];
      }

      v47 = v14;
      if (!os_log_GKGeneral) {
        id v27 = (id)GKOSLoggers(v25);
      }
      uint64_t v28 = (void *)os_log_GKMatch;
      BOOL v29 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v29)
      {
        uint64_t v30 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v6 matches]);
        *(_DWORD *)buf = 138412290;
        v54 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "SUCCESS matches: %@", buf, 0xCu);
      }

      if (!os_log_GKGeneral) {
        id v32 = (id)GKOSLoggers(v29);
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_1000E969C();
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  729LL,  "-[GKClientProxy processMatchResponse:]"));
      dispatch_queue_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v34,  "pushCredentialForEnvironment:",  -[GKClientProxy environment](self, "environment")));
      dispatch_queue_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 playerInternal]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 playerID]);
      dispatch_queue_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v33,  v37));

      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 context]);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1000DD578;
      v49[3] = &unk_10026BDB0;
      id v50 = v38;
      uint64_t v51 = self;
      id v40 = v38;
      [v39 performBlockAndWait:v49];

      id v14 = v47;
      id v10 = v48;
    }
  }

  else
  {
    dispatch_queue_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"poll-delay-ms"]);
    [v42 doubleValue];
    double v44 = v43 / 1000.0;

    dispatch_time_t v45 = dispatch_time(0LL, (uint64_t)(v44 * 1000000000.0));
    if ([v6 transitionToState:2])
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v6 matchingGroup]);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_1000DD394;
      v52[3] = &unk_10026BA70;
      v52[4] = self;
      v52[5] = v45;
      [v46 perform:v52];
    }
  }

LABEL_29:
  return v17;
}

- (void)setCheckMatchStatusTimer:(id)a3
{
  id v4 = (OS_dispatch_source *)a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));

  if (v6 != v7)
  {
    label = dispatch_queue_get_label(v6);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));
    id v10 = dispatch_queue_get_label(v9);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKClientProxy setCheckMatchStatusTimer:]",  label,  v10,  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == self.checkMatchStatusQueue)\n[%s (%s:%d)]",  v12,  "-[GKClientProxy setCheckMatchStatusTimer:]",  [v14 UTF8String],  744));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  checkMatchStatusTimer = self->_checkMatchStatusTimer;
  if (checkMatchStatusTimer) {
    dispatch_source_cancel((dispatch_source_t)checkMatchStatusTimer);
  }
  BOOL v17 = self->_checkMatchStatusTimer;
  self->_checkMatchStatusTimer = v4;
}

- (void)cancelOutstandingCheckMatchStatus
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DD830;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelInvitationForSession:(id)a3 playerID:(id)a4 pushTokens:(id)a5 handler:(id)a6
{
  id v30 = a3;
  id v9 = a4;
  id v10 = a5;
  id v27 = a6;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v41;
    do
    {
      __int16 v15 = 0LL;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v15);
        v46[0] = @"id";
        v46[1] = @"push-token";
        v47[0] = v9;
        v47[1] = v16;
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  2LL));
        [v11 addObject:v17];

        __int16 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v13);
  }

  v44[0] = @"session-token";
  v44[1] = @"peers";
  v45[0] = v30;
  v45[1] = v11;
  v44[2] = @"reason";
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  v45[2] = v18;
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v19 = dispatch_group_create();
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = sub_1000DDC08;
  v38[4] = sub_1000DDC18;
  id v39 = 0LL;
  dispatch_group_enter(v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v28 storeBag]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v29 _gkPlistXMLDataForClient:self player:0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pushCredentialForEnvironment:", -[GKClientProxy environment](self, "environment")));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000DDC20;
  v35[3] = &unk_100271960;
  v37 = v38;
  uint64_t v24 = v19;
  dispatch_queue_t v36 = v24;
  [v20 writeDataForBagKey:@"gk-invitation-cancel" postData:v21 client:self credential:v23 completion:v35];

  uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DDCBC;
  block[3] = &unk_100271868;
  id v33 = v27;
  dispatch_queue_t v34 = v38;
  id v26 = v27;
  dispatch_group_notify(v24, v25, block);

  _Block_object_dispose(v38, 8);
}

- (id)fetchOrCreateInviteSession
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));

  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers(v4);
    }
    id v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionToken]);
      int v20 = 134218242;
      v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Already have GKInviteSession(%p), token: %@",  (uint8_t *)&v20,  0x16u);

LABEL_10:
    }
  }

  else
  {
    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___GKInviteSession);
    -[GKClientProxy setInviteSession:](self, "setInviteSession:", v11);

    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers(v12);
    }
    uint64_t v14 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v7 = v14;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sessionToken]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      int v20 = 134218498;
      v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Created a new GKInviteSession(%p), token: %@. Thread: %@",  (uint8_t *)&v20,  0x20u);

      goto LABEL_10;
    }
  }

  return (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
}

- (void)deleteInviteSession
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  uint64_t v4 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
    int v10 = 134217984;
    unsigned int v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "GKClientProxy - deleteInviteSession, self.inviteSession: %p",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 shareRecordID]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils privateDatabase]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "privateDatabase"));
    +[GKCloudKitMultiplayer deleteInviteRecordWithRecordID:fromDatabase:]( &OBJC_CLASS___GKCloudKitMultiplayer,  "deleteInviteRecordWithRecordID:fromDatabase:",  v8,  v9);
  }

  -[GKClientProxy setInviteSession:](self, "setInviteSession:", 0LL);
}

- (void)refreshPendingDataTypes
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  uint64_t v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refreshing pending data types for %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    id v10 = [v9 copy];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    [v11 removeAllObjects];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000DE1D8;
    v12[3] = &unk_100271988;
    v12[4] = self;
    [v10 enumerateObjectsUsingBlock:v12];
  }

- (void)playerFound:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  id v13 = (os_log_s *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "PeerDiscovery player found: %@, deviceID: %@, discoveryInfo: %@",  (uint8_t *)&v14,  0x20u);
  }

  -[GKClientProxy nearbyPlayerFoundForPlayerID:deviceID:discoveryInfo:]( self,  "nearbyPlayerFoundForPlayerID:deviceID:discoveryInfo:",  v8,  v9,  v11);
}

- (void)playerLost:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "PeerDiscovery player lost: %@, deviceID: %@",  (uint8_t *)&v11,  0x16u);
  }

  -[GKClientProxy nearbyPlayerLostForPlayerID:deviceID:](self, "nearbyPlayerLostForPlayerID:deviceID:", v6, v8);
}

- (void)receivedData:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  __int16 v13 = (os_log_s *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "PeerDiscovery data received from player: %@, deviceID: %@",  (uint8_t *)&v14,  0x16u);
  }

  -[GKClientProxy nearbyDataReceivedForPlayerID:deviceID:data:]( self,  "nearbyDataReceivedForPlayerID:deviceID:data:",  v8,  v9,  v11);
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (OS_dispatch_queue)authQueue
{
  return self->_authQueue;
}

- (void)setAuthQueue:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_uint64_t pid = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (NSXPCConnection *)a3;
}

- (GKEntitlements)entitlements
{
  return (GKEntitlements *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (NSNumber)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (NSNumber)externalVersion
{
  return self->_externalVersion;
}

- (void)setExternalVersion:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)originalBundleIdentifier
{
  return self->_originalBundleIdentifier;
}

- (void)setOriginalBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)supportsMultipleActivePlayers
{
  return self->_supportsMultipleActivePlayers;
}

- (void)setSupportsMultipleActivePlayers:(BOOL)a3
{
  self->_supportsMultipleActivePlayers = a3;
}

- (NSString)persistentAnchorIdentifier
{
  return self->_persistentAnchorIdentifier;
}

- (void)setPersistentAnchorIdentifier:(id)a3
{
}

- (BOOL)isOcelot
{
  return self->_isOcelot;
}

- (void)setIsOcelot:(BOOL)a3
{
  self->_isOcelot = a3;
}

- (BOOL)isGameCenterEnabledClient
{
  return self->_isGameCenterEnabledClient;
}

- (void)setIsGameCenterEnabledClient:(BOOL)a3
{
  self->_isGameCenterEnabledClient = a3;
}

- (BOOL)isAppUnlistedAndDisallowed
{
  return self->_isAppUnlistedAndDisallowed;
}

- (void)setIsAppUnlistedAndDisallowed:(BOOL)a3
{
  self->_isAppUnlistedAndDisallowed = a3;
}

- (NSDate)achievementsRateLimitingStartDate
{
  return self->_achievementsRateLimitingStartDate;
}

- (void)setAchievementsRateLimitingStartDate:(id)a3
{
}

- (int64_t)achievementsRateLimitingCurrentNumberOfRequests
{
  return self->_achievementsRateLimitingCurrentNumberOfRequests;
}

- (void)setAchievementsRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_achievementsRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)achievementsRateLimitedCurrentState
{
  return self->_achievementsRateLimitedCurrentState;
}

- (void)setAchievementsRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_achievementsRateLimitedCurrentState = a3;
}

- (NSDate)scoresRateLimitingStartDate
{
  return self->_scoresRateLimitingStartDate;
}

- (void)setScoresRateLimitingStartDate:(id)a3
{
}

- (int64_t)scoresRateLimitingCurrentNumberOfRequests
{
  return self->_scoresRateLimitingCurrentNumberOfRequests;
}

- (void)setScoresRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_scoresRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)scoresRateLimitedCurrentState
{
  return self->_scoresRateLimitedCurrentState;
}

- (void)setScoresRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_scoresRateLimitedCurrentState = a3;
}

- (NSMutableDictionary)alreadyCoalescingNetworkRequests
{
  return self->_alreadyCoalescingNetworkRequests;
}

- (void)setAlreadyCoalescingNetworkRequests:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (GKUIViewService)viewService
{
  return (GKUIViewService *)objc_loadWeakRetained((id *)&self->_viewService);
}

- (void)setViewService:(id)a3
{
}

- (void)setCurrentGame:(id)a3
{
}

- (void)setNearbyDiscovery:(id)a3
{
}

- (void)setPeerDiscovery:(id)a3
{
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (unsigned)previousApplicationState
{
  return self->_previousApplicationState;
}

- (void)setPreviousApplicationState:(unsigned int)a3
{
  self->_previousApplicationState = a3;
}

- (GKEventTuple)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
}

- (GKInviteSession)inviteSession
{
  return (GKInviteSession *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setInviteSession:(id)a3
{
}

- (GKMatchResponse)currentMatchResponse
{
  return (GKMatchResponse *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setCurrentMatchResponse:(id)a3
{
}

- (NSMapTable)extensionProxies
{
  return self->_extensionProxies;
}

- (void)setExtensionProxies:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (_GKStateMachine)appInitStateMachine
{
  return (_GKStateMachine *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setAppInitStateMachine:(id)a3
{
}

- (GKThreadsafeDictionary)appSessions
{
  return self->_appSessions;
}

- (void)setAppSessions:(id)a3
{
}

- (OS_dispatch_queue)delayedRequestsQueue
{
  return self->_delayedRequestsQueue;
}

- (void)setDelayedRequestsQueue:(id)a3
{
}

- (GKDatabaseConnection)delayedRequestsDBConnection
{
  return self->_delayedRequestsDBConnection;
}

- (void)setDelayedRequestsDBConnection:(id)a3
{
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
}

- (NSMutableArray)pendingDataTypesForRefresh
{
  return self->_pendingDataTypesForRefresh;
}

- (void)setPendingDataTypesForRefresh:(id)a3
{
}

- (NSDictionary)preferencesFromBag
{
  return self->_preferencesFromBag;
}

- (void)setPreferencesFromBag:(id)a3
{
}

- (OS_dispatch_source)checkMatchStatusTimer
{
  return self->_checkMatchStatusTimer;
}

- (OS_dispatch_queue)checkMatchStatusQueue
{
  return self->_checkMatchStatusQueue;
}

- (void)setCheckMatchStatusQueue:(id)a3
{
}

- (void)setParentBundleIdentifier:(id)a3
{
}

- (BOOL)supportsNearbyAdvertising
{
  return self->_supportsNearbyAdvertising;
}

- (void).cxx_destruct
{
}

+ (id)factoryQueue
{
  if (qword_1002BB5E0 != -1) {
    dispatch_once(&qword_1002BB5E0, &stru_1002719A8);
  }
  return (id)qword_1002BB5D8;
}

+ (id)_clientLookup
{
  if (qword_1002BB5F0 != -1) {
    dispatch_once(&qword_1002BB5F0, &stru_1002719C8);
  }
  return (id)qword_1002BB5E8;
}

+ (id)gameCenterClient
{
  return [a1 clientForBundleID:GKGameCenterIdentifier bundle:0 pid:0 createIfNecessary:1];
}

+ (id)clientForBundleID:(id)a3
{
  return [a1 clientForBundleID:a3 bundle:0 pid:0 createIfNecessary:1];
}

+ (id)clientForProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithPID:](&OBJC_CLASS___NSBundle, "_gkBundleWithPID:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 clientForBundleID:v6 bundle:v5 pid:v3 createIfNecessary:1]);

  return v7;
}

+ (BOOL)isExtensionBundleID:(id)a3
{
  uint64_t v3 = qword_1002BB600;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002BB600, &stru_1002719E8);
  }
  unsigned __int8 v5 = [(id)qword_1002BB5F8 containsObject:v4];

  return v5;
}

+ (id)clientForBundleID:(id)a3 bundle:(id)a4 pid:(int)a5 createIfNecessary:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v11);
  }
  int v14 = (os_log_s *)os_log_GKTrace;
  uint64_t v15 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if ((_DWORD)v15)
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "GKClientProxy: clientForBundleID: %@, pid: %d",  buf,  0x12u);
  }

  if (v10 || !(_DWORD)v7)
  {
    if (v10)
    {
LABEL_13:
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      v31 = sub_1000DDC08;
      id v32 = sub_1000DDC18;
      id v33 = 0LL;
      __int16 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 factoryQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000DF028;
      block[3] = &unk_100271A10;
      id v26 = buf;
      id v27 = a1;
      int v28 = v7;
      id v24 = v10;
      BOOL v29 = a6;
      id v25 = v12;
      id v19 = v10;
      dispatch_sync(v18, block);

      id v20 = *(id *)(*(void *)&buf[8] + 40LL);
      _Block_object_dispose(buf, 8);

      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSBundle _gkBundleIdentifierOrProcessNameForPID:]( &OBJC_CLASS___NSBundle,  "_gkBundleIdentifierOrProcessNameForPID:",  v7));
    id v10 = (id)v15;
    if (v15)
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v15);
      }
      id v17 = (os_log_s *)os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "GKClientProxy: clientForBundleID: - Obtained bundleID: %@",  buf,  0xCu);
      }

      goto LABEL_13;
    }
  }

  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers(v15);
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_1000E96C8();
  }
  id v20 = 0LL;
LABEL_19:

  return v20;
}

+ (id)clientForBundleID:(id)a3 pid:(int)a4 createIfNecessary:(BOOL)a5
{
  return [a1 clientForBundleID:a3 bundle:0 pid:*(void *)&a4 createIfNecessary:a5];
}

+ (id)foregroundClient
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000DDC08;
  id v9 = sub_1000DDC18;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DF940;
  v4[3] = &unk_100271A38;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)nonGameCenterForegroundClient
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000DDC08;
  id v9 = sub_1000DDC18;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DFA74;
  v4[3] = &unk_100271A38;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)clientForInviteSessionToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "clientForInviteSessionToken: incoming session token %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_1000DDC08;
  id v17 = sub_1000DDC18;
  id v18 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000DFC80;
  v11[3] = &unk_10026B2C8;
  id v8 = v5;
  id v12 = v8;
  p___int128 buf = &buf;
  [a1 enumerateClientsUsingBlock:v11];
  id v9 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&buf, 8);
  return v9;
}

+ (id)clientForMatchmakingRID:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_1000DDC08;
  int v14 = sub_1000DDC18;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DFED8;
  void v7[3] = &unk_100271A60;
  id v9 = &v10;
  id v4 = a3;
  id v8 = v4;
  [a1 enumerateClientsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)clientsToBeEnumerated
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000DDC08;
  id v11 = sub_1000DDC18;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 factoryQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_1000E0068;
  v6[3] = &unk_100271AD8;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateClientsUsingBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 clientsToBeEnumerated]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E01D8;
  void v7[3] = &unk_100271B00;
  id v8 = v4;
  id v5 = v4;
  [v6 enumerateObjectsUsingBlock:v7];
}

+ (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if (v5)
  {
    [v4 setConnection:0];
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 factoryQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E02B0;
    block[3] = &unk_10026B4D0;
    id v10 = a1;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

- (id)serviceForClass:(Class)a3 transport:(id)a4 client:(id)a5 credential:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___GKService, v13)) & 1) == 0)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([serviceClass isSubclassOfClass:[GKService class]])\n[%s (%s:%d)]",  v14,  "-[GKClientProxy(GKDaemonProtocol) serviceForClass:transport:client:credential:]",  [v16 UTF8String],  1223));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
  if (objc_msgSend( v18,  "hasEntitlements:",  -[objc_class requiredEntitlements](a3, "requiredEntitlements"))) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class serviceWithTransport:forClient:credential:]( a3,  "serviceWithTransport:forClient:credential:",  v10,  v11,  v12));
  }
  else {
    id v19 = 0LL;
  }
  if ([v19 requiresAuthentication]
    && ([v18 hasEntitlements:&_mh_execute_header] & 1) == 0
    && !-[GKClientProxy isUIService](self, "isUIService")
    && !-[GKClientProxy isExtension](self, "isExtension"))
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[GKAuthenticationWrapperService authenticationWrapperForService:]( &OBJC_CLASS___GKAuthenticationWrapperService,  "authenticationWrapperForService:",  v19));

    id v19 = (void *)v20;
  }

  return v19;
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  if (a4) {
    dispatch_async((dispatch_queue_t)self->_replyQueue, a4);
  }
}

- (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 absoluteString]);
    id v12 = (void *)v11;
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers(v11);
    }
    int v14 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412802;
      id v68 = v9;
      __int16 v69 = 2112;
      id v70 = v10;
      __int16 v71 = 2112;
      v72 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received URL from %@ (%@) : %@", buf, 0x20u);
    }

    if (!v12) {
      goto LABEL_35;
    }
    v54 = self;
    uint64_t v58 = v12;
    v57 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v8,  0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v57, "queryItems"));
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (!v16) {
      goto LABEL_34;
    }
    id v17 = v16;
    id v55 = v9;
    id v56 = v10;
    id v18 = 0LL;
    uint64_t v19 = *(void *)v63;
    uint64_t v20 = GKFriendRequestURLZippedData;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v15);
        }
        __int16 v22 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
        unsigned int v24 = [v23 isEqualToString:v20];

        if (v24)
        {
          id v25 = v22;

          id v18 = v25;
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }

    while (v17);
    id v9 = v55;
    id v10 = v56;
    if (!v18)
    {
LABEL_34:

      id v12 = v58;
LABEL_35:

      goto LABEL_36;
    }

    id v26 = objc_alloc(&OBJC_CLASS___NSData);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
    int v28 = -[NSData initWithBase64EncodedString:options:](v26, "initWithBase64EncodedString:options:", v27, 0LL);

    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSData _gkZippedDictionaryValue](v28, "_gkZippedDictionaryValue"));
    id v30 = [v29 mutableCopy];

    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:GKFriendRequestURLFriendCode]);
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:GKFriendRequestURLSenderAlias]);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:GKFriendRequestURLSenderPlayerID]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v58 dataUsingEncoding:4]);
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v49 base64EncodedStringWithOptions:0]);
    v52 = (void *)v32;
    id v33 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v34 = (id)GKOSLoggers(v32);
      id v33 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412802;
      id v68 = v31;
      __int16 v69 = 2112;
      id v70 = v50;
      __int16 v71 = 2112;
      v72 = v52;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "New friend request with code: %@, senderAlias: %@, decoded url to %@",  buf,  0x20u);
      if (v31) {
        goto LABEL_21;
      }
    }

    else if (v31)
    {
LABEL_21:
      uint64_t v53 = v31;
      v47 = v28;
      [v30 setObject:v52 forKeyedSubscript:GKFriendRequestURL];
      [v30 setObject:v55 forKeyedSubscript:GKFriendRequestURLSenderHandle];
      [v30 setObject:v56 forKeyedSubscript:GKFriendRequestURLContactID];
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v30 setObject:v35 forKeyedSubscript:GKFriendRequestTimestamp];

      os_unfair_lock_lock( +[GKFriendServicePrivate messageInboxEntriesLock]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxEntriesLock"));
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[GKFriendServicePrivate messageInboxLocation]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxLocation"));
      v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v36));
      if (!v37) {
        v37 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      }
      dispatch_queue_t v38 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v37);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v30, v53);
      v48 = (void *)v36;
      id v39 = -[NSMutableDictionary writeToFile:atomically:](v38, "writeToFile:atomically:", v36, 1LL);
      id v10 = v56;
      int v46 = (int)v39;
      if ((v39 & 1) == 0)
      {
        if (!os_log_GKGeneral) {
          id v40 = (id)GKOSLoggers(v39);
        }
        __int128 v41 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v68 = v48;
          __int16 v69 = 2112;
          id v70 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "Failed to write message inbox: %@ value of: %@",  buf,  0x16u);
        }
      }

      os_unfair_lock_unlock( +[GKFriendServicePrivate messageInboxEntriesLock]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxEntriesLock"));
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v53));

      if (!v42)
      {
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v53 componentsSeparatedByString:@"|"]);
        double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndexedSubscript:0]);

        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_1000E0B6C;
        v59[3] = &unk_100271B50;
        id v60 = v51;
        id v61 = v44;
        id v45 = v44;
        -[GKClientProxy getAuthenticatedLocalPlayersWithStatus:handler:]( v54,  "getAuthenticatedLocalPlayersWithStatus:handler:",  1LL,  v59);
      }

      if (v46) {
        +[GKClientProxy enumerateClientsUsingBlock:]( &OBJC_CLASS___GKClientProxy,  "enumerateClientsUsingBlock:",  &stru_100271B70);
      }

      int v28 = v47;
      v31 = v53;
    }

    goto LABEL_34;
  }

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v6 = a5;
  uint64_t v7 = v6;
  if (v6)
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E0D74;
    block[3] = &unk_10026B120;
    id v10 = v6;
    dispatch_async(replyQueue, block);
  }
}

- (void)getServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v54 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKAccountService, v10),  v9,  v8,  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v14 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKProfileService, v13),  v9,  v8,  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v17 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKFriendService, v16),  v9,  v8,  0LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v20 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKGameService, v19),  v9,  v8,  0LL);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKGameStatService, v21),  v9,  v8,  0LL);
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKChallengeService, v23),  v9,  v8,  0LL);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v27 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKMultiplayerMatchService, v26),  v9,  v8,  0LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v27);
  id v29 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKTurnBasedService, v28),  v9,  v8,  0LL);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKUtilityService, v30),  v9,  v8,  0LL);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v34 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKBulletinService, v33),  v9,  v8,  0LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1120;
  block[3] = &unk_100271B98;
  id v65 = v35;
  id v66 = v54;
  uint64_t v36 = v12;
  id v56 = v12;
  id v57 = v15;
  v37 = v18;
  id v58 = v18;
  id v59 = v53;
  id v60 = v45;
  id v61 = v25;
  id v62 = v47;
  id v63 = v49;
  id v64 = v32;
  id v52 = v35;
  id v51 = v32;
  id v50 = v49;
  id v48 = v47;
  id v38 = v25;
  id v46 = v45;
  id v39 = v53;
  id v40 = v37;
  id v41 = v15;
  id v42 = v36;
  id v43 = v54;
  dispatch_async(queue, block);
}

- (void)getPrivateServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v54 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKAccountServicePrivate, v10),  v9,  v8,  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v14 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKProfileServicePrivate, v13),  v9,  v8,  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v17 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKFriendServicePrivate, v16),  v9,  v8,  0LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v20 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKGameServicePrivate, v19),  v9,  v8,  0LL);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKGameStatServicePrivate, v21),  v9,  v8,  0LL);
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKChallengeServicePrivate, v23),  v9,  v8,  0LL);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v27 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKMultiplayerMatchServicePrivate, v26),  v9,  v8,  0LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v27);
  id v29 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKTurnBasedServicePrivate, v28),  v9,  v8,  0LL);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKUtilityServicePrivate, v30),  v9,  v8,  0LL);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v34 = -[GKClientProxy serviceForClass:transport:client:credential:]( self,  "serviceForClass:transport:client:credential:",  objc_opt_class(&OBJC_CLASS___GKBulletinServicePrivate, v33),  v9,  v8,  0LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1500;
  block[3] = &unk_100271B98;
  id v65 = v35;
  id v66 = v54;
  uint64_t v36 = v12;
  id v56 = v12;
  id v57 = v15;
  v37 = v18;
  id v58 = v18;
  id v59 = v53;
  id v60 = v45;
  id v61 = v25;
  id v62 = v47;
  id v63 = v49;
  id v64 = v32;
  id v52 = v35;
  id v51 = v32;
  id v50 = v49;
  id v48 = v47;
  id v38 = v25;
  id v46 = v45;
  id v39 = v53;
  id v40 = v37;
  id v41 = v15;
  id v42 = v36;
  id v43 = v54;
  dispatch_async(queue, block);
}

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v29) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKClientProxy: client requests services for pid %d",  buf,  8u);
  }

  if (self->_pid != a3)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (pid == _pid)\n[%s (%s:%d)]",  v13,  "-[GKClientProxy(GKDaemonProtocol) getServicesForPID:localPlayer:reply:]",  [v15 UTF8String],  1389));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  -[GKClientProxy updateAppInitState](self, "updateAppInitState");
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[GKClientProxy credentialForPlayer:](self, "credentialForPlayer:", v8));
  id v18 = (void *)v17;
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers(v17);
  }
  id v20 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "credential: %@", buf, 0xCu);
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[GKClientProxy transportWithCredential:](self, "transportWithCredential:", v18));
  id v22 = (void *)v21;
  if (!os_log_GKGeneral) {
    id v23 = (id)GKOSLoggers(v21);
  }
  id v24 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v25 = v24;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 alias]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 accountName]);
    *(_DWORD *)__int128 buf = 138412546;
    id v29 = v26;
    __int16 v30 = 2112;
    id v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "alloc services for %@:%@", buf, 0x16u);
  }

  -[GKClientProxy getServicesWithTransport:forClient:reply:]( self,  "getServicesWithTransport:forClient:reply:",  v22,  self,  v10);
}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v26) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKClientProxy: client requests private services for pid %d",  buf,  8u);
  }

  if (self->_pid != a3)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (pid == _pid)\n[%s (%s:%d)]",  v13,  "-[GKClientProxy(GKDaemonProtocol) getPrivateServicesForPID:localPlayer:reply:]",  [v15 UTF8String],  1405));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  -[GKClientProxy updateAppInitState](self, "updateAppInitState");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy credentialForPlayer:](self, "credentialForPlayer:", v8));
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[GKClientProxy transportWithCredential:](self, "transportWithCredential:", v17));
  id v19 = (void *)v18;
  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers(v18);
  }
  uint64_t v21 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v22 = v21;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 alias]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 accountName]);
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v26 = v23;
    __int16 v27 = 2112;
    uint64_t v28 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "alloc private services for %@:%@", buf, 0x16u);
  }

  -[GKClientProxy getPrivateServicesWithTransport:forClient:reply:]( self,  "getPrivateServicesWithTransport:forClient:reply:",  v19,  self,  v10);
}

- (void)getAuthenticatedPlayerInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17[0] = 0LL;
    v17[1] = v17;
    v17[2] = 0x3032000000LL;
    v17[3] = sub_1000DDC08;
    v17[4] = sub_1000DDC18;
    id v18 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1425LL,  "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerInfo:]"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v5));

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    unsigned int v8 = [v7 hasEntitlements:0x10000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      _DWORD v14[2] = sub_1000E1CA4;
      v14[3] = &unk_100271BC0;
      v14[4] = self;
      uint64_t v16 = v17;
      id v15 = v6;
      [v15 perform:v14];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E1DC8;
    v11[3] = &unk_10026B030;
    id v13 = v4;
    id v10 = v6;
    id v12 = v10;
    [v10 notifyOnQueue:v9 block:v11];

    _Block_object_dispose(v17, 8);
  }
}

- (void)getAuthenticatedPlayerCredential:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17[0] = 0LL;
    v17[1] = v17;
    v17[2] = 0x3032000000LL;
    v17[3] = sub_1000DDC08;
    v17[4] = sub_1000DDC18;
    id v18 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1458LL,  "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerCredential:]"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v5));

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    unsigned int v8 = [v7 hasEntitlements:0x200000000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      _DWORD v14[2] = sub_1000E1FE8;
      v14[3] = &unk_100271BC0;
      v14[4] = self;
      uint64_t v16 = v17;
      id v15 = v6;
      [v15 perform:v14];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E215C;
    v11[3] = &unk_10026B030;
    id v13 = v4;
    id v10 = v6;
    id v12 = v10;
    [v10 notifyOnQueue:v9 block:v11];

    _Block_object_dispose(v17, 8);
  }
}

- (void)getGamedFiredUpWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1519LL,  "-[GKClientProxy(GKDaemonProtocol) getGamedFiredUpWithHandler:]"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v5));

    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v7);
    }
    id v9 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "gamed is loaded and initialized.", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E2310;
    v11[3] = &unk_10026B030;
    id v12 = @"Gamed at your service";
    id v13 = v4;
    [v6 notifyOnQueue:v10 block:v11];
  }
}

- (void)getAuthenticatedLocalPlayersWithStatus:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  int64_t v8 = -[GKClientProxy environment](self, "environment");
  BOOL v9 = -[GKClientProxy conformsToMultiUserRestrictions](self, "conformsToMultiUserRestrictions");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentGame](self, "currentGame"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 primaryCredentialForEnvironment:v8 conformsToMultiUserRestrictions:v9 gameID:v11]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 allCredentialsForEnvironment:v8]);
  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.gamecenter"];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1542LL,  "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playerID]);
      id v19 =  -[GKClientProxy transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v16,  v18);
    }
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000E2614;
  v32[3] = &unk_100271C10;
  id v20 = v12;
  id v34 = self;
  unint64_t v35 = a3;
  id v33 = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 _gkFilterWithBlock:v32]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1600LL,  "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v22));

  [v23 setObject:v21 forKeyedSubscript:@"players"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000E27E4;
  v29[3] = &unk_100271C60;
  id v24 = v23;
  id v30 = v24;
  id v31 = self;
  [v21 enumerateObjectsUsingBlock:v29];
  if (v6)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E2DB4;
    v26[3] = &unk_10026B030;
    id v28 = v6;
    id v27 = v24;
    [v27 notifyOnQueue:v25 block:v26];
  }
}

- (void)getAccountNameWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1671LL,  "-[GKClientProxy(GKDaemonProtocol) getAccountNameWithHandler:]"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v5));

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    unsigned int v8 = [v7 hasEntitlements:0x10000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      _DWORD v14[2] = sub_1000E2F6C;
      v14[3] = &unk_10026B5E0;
      id v15 = v6;
      [v15 perform:v14];
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E2FF0;
    v11[3] = &unk_10026B030;
    id v12 = v6;
    id v13 = v4;
    id v10 = v6;
    [v10 notifyOnQueue:v9 block:v11];
  }
}

- (void)getAuthenticatedPlayerIDWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_1000E30B8;
    v6[3] = &unk_10026BB98;
    id v7 = v4;
    -[GKClientProxy getAuthenticatedPlayerInfo:](self, "getAuthenticatedPlayerInfo:", v6);
  }
}

- (void)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4 handler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _gkLocalizedMessageFromDictionary:forBundleID:]( &OBJC_CLASS___NSBundle,  "_gkLocalizedMessageFromDictionary:forBundleID:",  a3,  a4));
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E31D0;
    v12[3] = &unk_10026B030;
    id v13 = v9;
    id v14 = v8;
    id v11 = v9;
    dispatch_async(v10, v12);
  }
}

- (void)loadRemoteImageDataForURL:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([v8 _gkIsValidServerURL])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
      +[NSData _gkRequestClientsRemoteImageDataForURL:queue:reply:]( &OBJC_CLASS___NSData,  "_gkRequestClientsRemoteImageDataForURL:queue:reply:",  v8,  v7,  v6);
    }

    else
    {
      v6[2](v6, 0LL);
    }
  }
}

- (void)resetLoginCancelCount
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(self);
  }
  uint64_t v3 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "resetCancelledLogins: user will be presented with fullscreen sheet if they are not signed in",  v6,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 signInVisibilityManager]);
  [v5 reset];
}

- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKActivity named:](&OBJC_CLASS___GKActivity, "named:", @"handleCloudKitShareMetadata"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E33E8;
  v10[3] = &unk_10026B310;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 execute:v10];
}

+ (void)authenticationDidChange
{
}

- (void)sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  1750LL,  "-[GKClientProxy(Authentication) sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:com pletionHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E3598;
  v11[3] = &unk_10026B148;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v8, v11);
}

- (id)missingTransitionFromState:(id)a3 toState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = (id)GKOSLoggers(v6);
    id v8 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000E97FC();
  }

  return v7;
}

- (void)stateDidChange
{
  if (self->_pid)
  {
    if (self->_bundleIdentifier)
    {
      uint64_t v3 = (void *)objc_opt_class(self, a2);
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[_GKStateMachine currentState](self->_appInitStateMachine, "currentState"));
      [v3 saveAppInitState:v4 forBundleID:self->_bundleIdentifier pid:self->_pid];
    }
  }

- (BOOL)setAppInitState:(id)a3
{
  return -[_GKStateMachine applyState:](self->_appInitStateMachine, "applyState:", a3);
}

- (id)appInitState
{
  return -[_GKStateMachine currentState](self->_appInitStateMachine, "currentState");
}

- (id)verifyAuthorized
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v4 = [v3 isGameCenterRestricted];

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = 10LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned __int8 v7 = [v6 lockedDown];

    if ((v7 & 1) != 0)
    {
      uint64_t v5 = 36LL;
    }

    else
    {
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GKClientProxy appInitState](self, "appInitState"));

      if (v8 == @"GKAppInitialized")
      {
        id v9 = 0LL;
        return v9;
      }

      uint64_t v5 = 6LL;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  v5,  0LL));
  return v9;
}

+ (id)lastKnownAppInitStateForClientWithBundleID:(id)a3 pid:(int)a4
{
  id v5 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1000DDC08;
  id v19 = sub_1000DDC18;
  id v20 = @"GKAppInitUnknown";
  id v6 = GKSavedAuthentiactionStateQueue();
  unsigned __int8 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E39E4;
  block[3] = &unk_100271CE8;
  int v14 = a4;
  id v12 = v5;
  id v13 = &v15;
  id v8 = v5;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (void)saveAppInitState:(id)a3 forBundleID:(id)a4 pid:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = GKSavedAuthentiactionStateQueue();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E3CC0;
  block[3] = &unk_100271D10;
  id v14 = v7;
  id v15 = v8;
  int v16 = a5;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)updateAppInitState
{
  if (self->_pid)
  {
    if (self->_bundleIdentifier)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_GKStateMachine currentState](self->_appInitStateMachine, "currentState"));
      unsigned int v4 = [v3 isEqualToString:@"GKAppInitUnknown"];

      if (v4)
      {
        id v6 = objc_msgSend( (id)objc_opt_class(self, v5),  "lastKnownAppInitStateForClientWithBundleID:pid:",  self->_bundleIdentifier,  self->_pid);
        id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
      }
    }
  }

- (void)didEnterForeground
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  unsigned int v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)__int128 buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "did enter foreground: %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  [v7 invalidate];

  if (-[GKClientProxy isGameCenter](self, "isGameCenter"))
  {
    -[GKClientProxy refreshPendingDataTypes](self, "refreshPendingDataTypes");
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
    [v8 setAuthenticatingWithSettingsBundleID:0];
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E41C0;
  v10[3] = &unk_10026BDB0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
  id v12 = self;
  id v9 = v11;
  [v9 performAsync:v10];
}

- (id)connectionProxyForUseCase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4484;
  v9[3] = &unk_100271D38;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v9]);

  return v7;
}

- (void)metricsValuesChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"metricsValuesChanged"));
  [v2 metricsValuesChanged];
}

- (void)presentBannerWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"presentBannerWithNotification"));
  [v5 presentBannerWithNotification:v4];
}

- (void)requestSandboxExtension:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"requestSandboxExtension"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E4624;
  void v7[3] = &unk_100271D60;
  id v8 = v4;
  id v6 = v4;
  [v5 requestSandboxExtension:v7];
}

- (void)beginNetworkActivity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"beginNetworkActivity"));
  [v2 beginNetworkActivity];
}

- (void)endNetworkActivity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"endNetworkActivity"));
  [v2 endNetworkActivity];
}

- (void)resetNetworkActivity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"resetNetworkActivity"));
  [v2 resetNetworkActivity];
}

- (void)respondedToNearbyInvite:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"respondedToNearbyInvite"));
  [v5 respondedToNearbyInvite:v4];
}

- (void)friendRequestSelected:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"friendRequestSelected"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  unsigned int v6 = [v5 isEqualToString:GKGameCenterIdentifier];

  if (v6) {
    [v4 friendRequestSelected:v7];
  }
}

- (void)receivedChallengeSelected:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"receivedChallengeSelected"));
  [v5 receivedChallengeSelected:v4];
}

- (void)completedChallengeSelected:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"completedChallengeSelected"));
  [v5 completedChallengeSelected:v4];
}

- (void)challengeReceived:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", @"challengeReceived"));
  [v5 challengeReceived:v4];
}

- (void)challengeCompleted:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"challengeCompleted"));
  [v5 challengeCompleted:v4];
}

- (void)scoreSelected:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", @"scoreSelected"));
  [v5 scoreSelected:v4];
}

- (void)achievementSelected:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", @"achievement"));
  [v5 achievementSelected:v4];
}

- (void)fetchTurnBasedData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"fetchTurnBasedData"));
  [v3 fetchTurnBasedData];
  -[GKClientProxy refreshContentsForDataType:userInfo:](self, "refreshContentsForDataType:userInfo:", 14LL, 0LL);
}

- (void)acceptMultiplayerGameInvite
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"acceptMultiplayerGameInvite"));
  [v5 acceptMultiplayerGameInvite];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v3 acceptMultiplayerGameInvite];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  [v4 _gkEnumerateKeysAndObjectsUsingBlock:&stru_100271DA0];
}

- (void)acceptInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"acceptInviteWithNotification"));
  [v5 acceptInviteWithNotification:v4];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v6 acceptInviteWithNotification:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4B4C;
  v9[3] = &unk_100271DC8;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)declineInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"declineInviteWithNotification"));
  [v5 declineInviteWithNotification:v4];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v6 declineInviteWithNotification:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4C34;
  v9[3] = &unk_100271DC8;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)updateInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:&stru_100271DE8]);

  if (v6)
  {
    [v6 updateInviteWithNotification:v4];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v7);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000E98D8();
    }
  }
}

- (void)cancelInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"cancelInviteWithNotification"));
  [v5 cancelInviteWithNotification:v4];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v6 cancelInviteWithNotification:v4];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4E44;
  v9[3] = &unk_100271DC8;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)cancelGameInvite:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"cancelGameInvite"));
  [v5 cancelGameInvite:v4];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v6 cancelGameInvite:v4];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4F2C;
  v9[3] = &unk_100271DC8;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"nearbyPlayerFound"));
  [v11 nearbyPlayerFoundForPlayerID:v10 deviceID:v9 discoveryInfo:v8];
}

- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", @"nearbyPlayerLost"));
  [v8 nearbyPlayerLostForPlayerID:v7 deviceID:v6];
}

- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"nearbyDataReceived"));
  [v11 nearbyDataReceivedForPlayerID:v10 deviceID:v9 data:v8];
}

- (void)relayPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"relayPushNotification"));
  [v5 relayPushNotification:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v6 relayPushNotification:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E518C;
  v9[3] = &unk_100271DC8;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)didConnectToParticipantWithID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"didConnectToParticipantWithID"));
  [v5 didConnectToParticipantWithID:v4];
}

- (void)didDisconnectFromParticipantWithID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"didDisconnectFromParticipantWithID"));
  [v5 didDisconnectFromParticipantWithID:v4];
}

- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", @"didReceiveData"));
  [v13 didReceiveData:v12 reliably:v7 forRecipients:v11 fromSender:v10];
}

- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"setBadgeCount:forType:"));
  [v6 setBadgeCount:a3 forType:a4];
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((-[GKClientProxy applicationState](self, "applicationState") == 2
     || -[GKClientProxy applicationState](self, "applicationState") == 4)
    && !-[GKClientProxy isExtension](self, "isExtension")
    && !(BOOL v7 = -[GKClientProxy isUIService](self, "isUIService")))
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers(v7);
    }
    id v19 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v24) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "App is backgrounded, defering refresh until app is running in foreground for data type = %i",  buf,  8u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___GKRefreshData);
    -[GKRefreshData setDataType:](v9, "setDataType:", v4);
    -[GKRefreshData setUserInfo:](v9, "setUserInfo:", v6);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    [v17 addObject:v9];
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[GKClientProxy connectionProxyForUseCase:]( self,  "connectionProxyForUseCase:",  @"refreshContentsForDataType"));
    id v9 = (GKRefreshData *)v8;
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v8);
    }
    id v11 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      uint64_t v13 = GKRefreshDataTypeAsString(v4);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)__int128 buf = 138412546;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKRefreshContents - refreshing contents for dataType: %@ userInfo: %@",  buf,  0x16u);
    }

    -[GKRefreshData refreshContentsForDataType:userInfo:](v9, "refreshContentsForDataType:userInfo:", v4, v6);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
    [v15 refreshContentsForDataType:v4 userInfo:v6];

    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000E55BC;
    v20[3] = &unk_100271E10;
    int v22 = v4;
    id v21 = v6;
    [v16 _gkEnumerateKeysAndObjectsUsingBlock:v20];

    uint64_t v17 = v21;
  }
}

- (void)setPreferencesValues:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxy]);

  [v6 setPreferencesValues:v4];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  [v7 setPreferencesValues:v4];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E56B4;
  v10[3] = &unk_100271DC8;
  id v11 = v4;
  id v9 = v4;
  [v8 _gkEnumerateKeysAndObjectsUsingBlock:v10];
}

- (void)getPreferenceForKey:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(id, id, BOOL))a4;
  if (v5)
  {
    id v9 = v5;
    id v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, GKGameCenterIdentifier);
    BOOL v7 = v6;
    if (v6) {
      id v8 = [v6 BOOLValue];
    }
    else {
      id v8 = 0LL;
    }
    v9[2](v9, v8, v7 != 0LL);

    id v5 = v9;
  }
}

- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v20 = a5;
  dispatch_group_t v9 = dispatch_group_create();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
  if (v10) {
    [v8 setBundleVersion:v10];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
  if (v11) {
    [v8 setShortBundleVersion:v11];
  }
  -[GKClientProxy setCurrentGame:](self, "setCurrentGame:", v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000E598C;
  v28[3] = &unk_100271D38;
  uint64_t v13 = v9;
  id v29 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteObjectProxyWithErrorHandler:v28]);

  if (v14)
  {
    dispatch_group_enter(v13);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E5A18;
    v26[3] = &unk_10026B670;
    id v27 = v13;
    [v14 setCurrentGame:v8 serverEnvironment:a4 reply:v26];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  int v16 = v15;
  if (v15) {
    [v15 setCurrentGame:v8 serverEnvironment:a4 reply:&stru_100271E30];
  }
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000E5A24;
  v23[3] = &unk_100271E78;
  id v18 = v8;
  id v24 = v18;
  int64_t v25 = a4;
  [v17 _gkEnumerateKeysAndObjectsUsingBlock:v23];

  if (v20)
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E5A40;
    block[3] = &unk_10026B120;
    id v22 = v20;
    dispatch_group_notify(v13, replyQueue, block);
  }
}

- (GKGameInternal)currentGame
{
  currentGame = self->_currentGame;
  if (currentGame)
  {
    id v3 = currentGame;
  }

  else
  {
    id v3 = objc_opt_new(&OBJC_CLASS___GKGameInternal);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    -[GKGameInternal setBundleIdentifier:](v3, "setBundleIdentifier:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
    -[GKGameInternal setBundleVersion:](v3, "setBundleVersion:", v6);

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
    -[GKGameInternal setShortBundleVersion:](v3, "setShortBundleVersion:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    -[GKGameInternal setName:](v3, "setName:", v8);

    dispatch_group_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
      -[GKGameInternal setPlatform:]( v3,  "setPlatform:",  +[GKApplicationWorkspace getPlatformForBundleID:]( &OBJC_CLASS___GKApplicationWorkspace,  "getPlatformForBundleID:",  v10));
    }

    else
    {
      -[GKGameInternal setPlatform:]( v3,  "setPlatform:",  +[GKGameDescriptor currentPlatform](&OBJC_CLASS___GKGameDescriptor, "currentPlatform"));
    }
  }

  return v3;
}

- (void)completedOptimisticAuthenticationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);

  [v9 completedOptimisticAuthenticationWithResponse:v7 error:v6];
}

- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  2300LL,  "-[GKClientProxy(GKClientInterface) authenticatedPlayersDidChange:authenticatingBundleID:reply:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E5D14;
  v15[3] = &unk_10026B0F8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v11, v15);
}

- (id)appTerminateRequestWithBackgroundFlag:(BOOL)a3
{
  v9[0] = @"background";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  v10[0] = v3;
  v9[1] = @"timestamp";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](&OBJC_CLASS___NSDate, "_gkServerTimestamp"));
  v10[1] = v4;
  v9[2] = @"udid";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](&OBJC_CLASS___GKDevice, "currentDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 udid]);
  v10[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  2355LL,  "-[GKClientProxy(GKClientInterface) terminateWithCompletionHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  if (-[GKClientProxy initialized](self, "initialized"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy appTerminateRequestWithBackgroundFlag:]( self,  "appTerminateRequestWithBackgroundFlag:",  0LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKThreadsafeDictionary dictionaryCopy](self->_appSessions, "dictionaryCopy"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E6324;
    v15[3] = &unk_100271F30;
    id v16 = v6;
    id v17 = self;
    id v18 = v7;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v15];
  }

  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E6614;
    v12[3] = &unk_10026B030;
    id v14 = v4;
    id v13 = v6;
    [v13 notifyOnQueue:v11 block:v12];
  }
}

- (void)backgroundWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  2388LL,  "-[GKClientProxy(GKClientInterface) backgroundWithCompletionHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  if (-[GKClientProxy initialized](self, "initialized"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy appTerminateRequestWithBackgroundFlag:]( self,  "appTerminateRequestWithBackgroundFlag:",  1LL));
    appSessions = self->_appSessions;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E6804;
    v15[3] = &unk_100271F58;
    id v16 = v6;
    id v17 = self;
    id v18 = v7;
    id v9 = v7;
    -[GKThreadsafeDictionary readFromDictionary:](appSessions, "readFromDictionary:", v15);
  }

  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E6B78;
    v12[3] = &unk_10026B030;
    id v14 = v4;
    id v13 = v6;
    [v13 notifyOnQueue:v11 block:v12];
  }
}

- (void)addAppSession:(id)a3 forCredential:(id)a4
{
  if (a3)
  {
    appSessions = self->_appSessions;
    v11[0] = a3;
    v11[1] = a4;
    id v6 = a4;
    id v7 = a3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playerInternal]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]);
    -[GKThreadsafeDictionary setObject:forKey:](appSessions, "setObject:forKey:", v8, v10);
  }

- (id)appSessionForPlayer:(id)a3
{
  appSessions = self->_appSessions;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 playerID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKThreadsafeDictionary objectForKey:](appSessions, "objectForKey:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  return v6;
}

- (void)removeAppSessionForPlayer:(id)a3
{
}

- (void)initializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  2442LL,  "-[GKClientProxy(GKClientInterface) initializeWithCredential:completionHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v30[0] = @"background";
  BOOL v10 = -[GKClientProxy previousApplicationState](self, "previousApplicationState") == 2
     || -[GKClientProxy previousApplicationState](self, "previousApplicationState") == 4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  v31[0] = v11;
  v30[1] = @"timestamp";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](&OBJC_CLASS___NSDate, "_gkServerTimestamp"));
  v31[1] = v12;
  v30[2] = @"udid";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](&OBJC_CLASS___GKDevice, "currentDevice"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 udid]);
  v31[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000E6FC0;
  v26[3] = &unk_10026BEC8;
  void v26[4] = self;
  id v27 = v6;
  id v28 = v15;
  id v16 = v9;
  id v29 = v16;
  id v17 = v15;
  id v18 = v6;
  [v16 perform:v26];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000E71E4;
  v23[3] = &unk_10026B1E8;
  id v24 = v16;
  id v25 = v7;
  void v23[4] = self;
  id v21 = v16;
  id v22 = v7;
  [v21 notifyOnQueue:v20 block:v23];
}

- (void)bgInitializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy.m",  2485LL,  "-[GKClientProxy(GKClientInterface) bgInitializeWithCredential:completionHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  id v24 = @"timestamp";
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](&OBJC_CLASS___NSDate, "_gkServerTimestamp"));
  id v25 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000E7470;
  v20[3] = &unk_10026BEC8;
  void v20[4] = self;
  id v12 = v6;
  id v21 = v12;
  id v13 = v11;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  [v14 perform:v20];
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000E75E4;
    v17[3] = &unk_10026B030;
    id v19 = v7;
    id v18 = v14;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

+ (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  uint64_t v4 = GKSupportDataRoot(a1, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (a3 == 5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"DelayedRequests"]);
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[GKPreferences displayNameForEnvironment:](&OBJC_CLASS___GKPreferences, "displayNameForEnvironment:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DelayedRequests-%@",  v8));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v9]);

    id v6 = (void *)v8;
  }

  return v7;
}

- (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "storeAndForwardDirectoryPathForEnvironment:", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:self->_bundleIdentifier]);

  return v6;
}

- (id)requestsCacheForEnvironment:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy storeAndForwardDirectoryPathForEnvironment:]( self,  "storeAndForwardDirectoryPathForEnvironment:",  a3));
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPreferences displayNameForEnvironment:]( &OBJC_CLASS___GKPreferences,  "displayNameForEnvironment:",  a3));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.delayedRequests", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);

  LOBYTE(v8) = [v5 fileExistsAtPath:v9];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKDatabaseConnection connectionWithDatabasePath:]( &OBJC_CLASS___GKDatabaseConnection,  "connectionWithDatabasePath:",  v9));
  if ((v8 & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([@"delayed_requests.schema" stringByDeletingPathExtension]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([@"delayed_requests.schema" pathExtension]);
    uint64_t v13 = GKGameCenterFoundationBundle();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pathForResource:v11 ofType:v12]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKSQLRunner runnerWithConnection:](&OBJC_CLASS___GKSQLRunner, "runnerWithConnection:", v10));
    [v16 runSQLFromFileAtPath:v15];
  }

  return v10;
}

- (void)_setupDelayedRequestsWriters
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v5 = v4;
  delayedRequestsQueue = (dispatch_queue_s *)self->_delayedRequestsQueue;
  if (v4 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v4);
    uint64_t v8 = dispatch_queue_get_label(delayedRequestsQueue);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]",  label,  v8,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]",  v10,  "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]",  [v12 UTF8String],  2576));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  if (!self->_delayedRequestsDBConnection)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy requestsCacheForEnvironment:]( self,  "requestsCacheForEnvironment:",  -[GKClientProxy environment](self, "environment")));
    -[GKClientProxy setDelayedRequestsDBConnection:](self, "setDelayedRequestsDBConnection:", v14);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy delayedRequestsDBConnection](self, "delayedRequestsDBConnection"));
  [v15 checkAndOpenDatabase];
}

- (void)_removeDelayedRequestStore
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v5 = v4;
  delayedRequestsQueue = (dispatch_queue_s *)self->_delayedRequestsQueue;
  if (v4 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v4);
    uint64_t v8 = dispatch_queue_get_label(delayedRequestsQueue);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]",  label,  v8,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]",  v10,  "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]",  [v12 UTF8String],  2589));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[GKClientProxy storeAndForwardDirectoryPathForEnvironment:]( self,  "storeAndForwardDirectoryPathForEnvironment:",  -[GKClientProxy environment](self, "environment")));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@".doomed"]);
  id v17 = (void *)v16;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v16);
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000E9B94();
  }
  id v31 = 0LL;
  unsigned int v19 = [v14 moveItemAtPath:v15 toPath:v17 error:&v31];
  id v20 = v31;
  id v21 = v20;
  if (v19)
  {
    -[GKClientProxy setDelayedRequestsDBConnection:](self, "setDelayedRequestsDBConnection:", 0LL);
    id v30 = v21;
    unsigned __int8 v22 = [v14 removeItemAtPath:v17 error:&v30];
    id v23 = v30;

    if ((v22 & 1) != 0)
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers(v24);
      }
      id v26 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Deleted delayed request store file at path %@",  buf,  0xCu);
      }
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v29 = (id)GKOSLoggers(v24);
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000E9B34();
      }
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v27 = (id)GKOSLoggers(v20);
    }
    id v28 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412802;
      id v33 = v15;
      __int16 v34 = 2112;
      unint64_t v35 = v17;
      __int16 v36 = 2112;
      v37 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Failed to move delayed requests store %@ to %@. ERROR: %@",  buf,  0x20u);
    }

    id v23 = v21;
  }
}

- (id)_delayedRequestWriterWithCacheWriterClass:(Class)a3 cacheReaderClass:(Class)a4 networkWriterClass:(Class)a5 bagKey:(id)a6 batchSubmissionInterval:(int64_t)a7 credential:(id)a8
{
  id v14 = a6;
  id v15 = a8;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_1000DDC08;
  id v33 = sub_1000DDC18;
  id v34 = 0LL;
  delayedRequestsQueue = (dispatch_queue_s *)self->_delayedRequestsQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000E7F1C;
  v21[3] = &unk_100271F80;
  Class v25 = a3;
  Class v26 = a4;
  v21[4] = self;
  id v22 = v15;
  id v23 = v14;
  uint64_t v24 = &v29;
  Class v27 = a5;
  int64_t v28 = a7;
  id v17 = v14;
  id v18 = v15;
  dispatch_sync(delayedRequestsQueue, v21);
  id v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (id)setPlayerStatusWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GKDelayedSetPlayerStatusCacheWriter, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GKDelayedSetPlayerStatusCacheReader, v7);
  id v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:]( self,  "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___GKDelayedRequestsNetworkWriter, v9),  @"gk-set-player-status",  0LL,  v4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)setPlayerPhotoWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GKDelayedSetPhotoCacheWriter, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GKDelayedSetPhotoCacheReader, v7);
  id v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:]( self,  "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___GKDelayedSetPhotoNetworkWriter, v9),  @"gk-get-image-upload-url",  0LL,  v4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)deletePlayerPhotoWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GKDelayedDeletePhotoCacheWriter, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GKDelayedDeletePhotoCacheReader, v7);
  id v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:]( self,  "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___GKDelayedRequestsNetworkWriter, v9),  @"gk-delete-profile-image",  0LL,  v4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)removeGameWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GKRemoveGamesCacheWriter, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GKRemoveGamesCacheReader, v7);
  id v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:]( self,  "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___GKDelayedRequestsNetworkWriter, v9),  @"gk-remove-game",  0LL,  v4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  uint64_t v5 = GKAtomicCompareAndSwap32Barrier(0LL, 1LL, &unk_1002BB618);
  if ((_DWORD)v5)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 cacheFileQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E8414;
    block[3] = &unk_100271FA0;
    void block[4] = a3;
    dispatch_async(v6, block);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v5);
    }
    uint64_t v8 = (os_log_s *)os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Game Center not sending store and forward as achievements or scores are being sent on another thread",  v9,  2u);
    }
  }

- (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 allCredentialsForEnvironment:a3]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E86BC;
  void v7[3] = &unk_100271FC8;
  void v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)performDelayedRequestsForCredential:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8764;
  block[3] = &unk_10026BDB0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(v6, block);
}

+ (id)contextKeyForPlayerID:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @"<global>";
  }
}

+ (id)_existingManagedObjectContextForPlayerID:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "contextKeyForPlayerID:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002BB620 objectForKey:v7]);
  return v8;
}

- (id)_managedObjectContextForPlayerID:(id)a3
{
  id v5 = a3;
  if (qword_1002BB628 != -1) {
    dispatch_once(&qword_1002BB628, &stru_100272060);
  }
  id v6 = objc_msgSend((id)objc_opt_class(self, v4), "contextKeyForPlayerID:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)qword_1002BB620;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E9DAC;
  v12[3] = &unk_100272088;
  void v12[4] = self;
  id v13 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7 objectProducerBlock:v12]);

  return v10;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy+Cache.m",  59LL,  "-[GKClientProxy(Cache) transactionGroupWithName:forPlayerID:]"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy _managedObjectContextForPlayerID:](self, "_managedObjectContextForPlayerID:", v5));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v6,  v7,  self));
  return v8;
}

- (id)transactionGroupIfCacheExistsForPlayerID:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_existingManagedObjectContextForPlayerID:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKClientProxy+Cache.m",  71LL,  "-[GKClientProxy(Cache) transactionGroupIfCacheExistsForPlayerID:]"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v8,  v7,  self));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)cacheDirectoryForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = GKInsecureCacheRoot(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Data"]);

  if (v3)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v3]);

    id v6 = (void *)v7;
  }

  return v6;
}

+ (id)insecureDatabaseDirectoryURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5
{
  uint64_t v8 = (__CFString *)a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 cacheDirectoryForBundleID:a3]);
  id v11 = @"global";
  if (v8) {
    id v11 = v8;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.gcdata",  v9,  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v12]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v13, 1LL));

  return v14;
}

+ (id)insecureDatabaseFileURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5 name:(id)a6
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 insecureDatabaseDirectoryURLForBundleID:a3 language:a4 playerID:a5]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v10 isDirectory:0]);

  return v12;
}

+ (void)removeCacheForPlayerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 contextKeyForPlayerID:v4]);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 cacheFileQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EA398;
  block[3] = &unk_10026B4D0;
  id v7 = v4;
  id v28 = v5;
  id v29 = a1;
  id v27 = v7;
  id v8 = v5;
  dispatch_sync(v6, block);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 gameCenterClient]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 entityCacheProvider]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 language]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000EA418;
  v21[3] = &unk_10026BF40;
  id v22 = v6;
  id v14 = v10;
  id v23 = v14;
  id v24 = v9;
  id v25 = v7;
  id v15 = v7;
  id v16 = v9;
  id v17 = v6;
  [v12 deleteCacheWithPlayerID:v15 language:v13 completionHandler:v21];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000EA534;
  v19[3] = &unk_10026B670;
  id v20 = v14;
  id v18 = v14;
  dispatch_async(v17, v19);
}

+ (void)removeAllCachesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002BB620 dictionaryCopy]);
  id v6 = (void *)qword_1002BB620;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  [v6 removeObjectsForKeys:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 entityCacheProvider]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000EA728;
  v12[3] = &unk_100271938;
  id v14 = v4;
  id v15 = a1;
  id v13 = v5;
  id v10 = v4;
  id v11 = v5;
  [v9 deleteAllCachesWithCompletionHandler:v12];
}

+ (void)removeAllCaches
{
}

+ (id)managedObjectModel
{
  if (qword_1002BB630 != -1) {
    dispatch_once(&qword_1002BB630, &stru_1002720C8);
  }
  return (id)qword_1002BB638;
}

+ (id)cacheFileQueue
{
  if (qword_1002BB640 != -1) {
    dispatch_once(&qword_1002BB640, &stru_1002720E8);
  }
  return (id)qword_1002BB648;
}

+ (void)migrateInsecureDatabaseToSecureDatabaseURL:(id)a3 usingPersistantStoreCoordinator:(id)a4 fileManager:(id)a5 options:(id)a6 playerID:(id)a7 bundleID:(id)a8 language:(id)a9 name:(id)a10
{
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v22 = (id)objc_claimAutoreleasedReturnValue([a1 insecureDatabaseFileURLForBundleID:v16 language:a9 playerID:a7 name:a10]);
  id v21 = -[GKInsecureDatabaseMigrator initWithInsecureDatabaseURL:secureDatabaseURL:persistentStoreCoordinator:options:fileManager:bundleID:]( objc_alloc(&OBJC_CLASS___GKInsecureDatabaseMigrator),  "initWithInsecureDatabaseURL:secureDatabaseURL:persistentStoreCoordinator:options:fileManager:bundleID:",  v22,  v20,  v19,  v17,  v18,  v16);

  -[GKInsecureDatabaseMigrator migrate](v21, "migrate");
}

+ (id)_newManagedObjectContextWithCacheURL:(id)a3 environment:(int64_t)a4 psc:(id)a5 storeOptions:(id)a6
{
  id v42 = a3;
  id v41 = a5;
  id v9 = a6;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 cacheFileQueue]);

  if (v11 != v12)
  {
    label = dispatch_queue_get_label(v11);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 cacheFileQueue]);
    id v15 = dispatch_queue_get_label(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]",  label,  v15,  v16));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy+Cache.m"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == [self cacheFileQueue])\n[%s (%s:%d)]",  v17,  "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]",  [v19 UTF8String],  282));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v20);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a1 gameCenterClient]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v25 = [v23 environment];
  id v26 = [v23 conformsToMultiUserRestrictions];
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 currentGame]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue( [v24 primaryCredentialForEnvironment:v25 conformsToMultiUserRestrictions:v26 gameID:v28]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 playerInternal]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 playerID]);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000EB078;
  v43[3] = &unk_10026BE78;
  id v44 = v42;
  id v45 = v41;
  id v46 = v9;
  id v47 = v21;
  uint64_t v32 = v22;
  id v48 = v32;
  v49 = v31;
  id v33 = v31;
  id v34 = v21;
  id v35 = v9;
  id v36 = v41;
  id v37 = v42;
  -[NSManagedObjectContext performBlockAndWait:](v32, "performBlockAndWait:", v43);
  id v38 = v49;
  id v39 = v32;

  return v39;
}

+ (id)newManagedObjectContextForPlayerID:(id)a3 bundleID:(id)a4 language:(id)a5 environment:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1000EB534;
  id v30 = sub_1000EB544;
  id v31 = 0LL;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 cacheFileQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000EB54C;
  v19[3] = &unk_100272110;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = &v26;
  id v24 = a1;
  int64_t v25 = a6;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_sync(v13, v19);

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)gameCenterCacheDatabaseURLForPlayerID:(id)a3 language:(id)a4 name:(id)a5 fileManager:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = -[GKSecureFileLocator initWithFileManager:]( objc_alloc(&OBJC_CLASS___GKSecureFileLocator),  "initWithFileManager:",  v10);

  if ([v9 length]) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[GKSecureFileLocator databaseFileWithBundleID:language:contextID:name:]( v13,  "databaseFileWithBundleID:language:contextID:name:",  GKGameCenterIdentifier,  v12,  v9,  v11));
  }
  else {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[GKSecureFileLocator globalDatabaseFileWithBundleID:language:name:]( v13,  "globalDatabaseFileWithBundleID:language:name:",  GKGameCenterIdentifier,  v12,  v11));
  }
  id v15 = (void *)v14;

  return v15;
}

+ (id)createPersistentStoreCoordinator
{
  id v2 = objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy managedObjectModel](&OBJC_CLASS___GKClientProxy, "managedObjectModel"));
  id v4 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:](v2, "initWithManagedObjectModel:", v3);

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  id v7 = (void *)os_log_GKPerf;
  if (os_log_type_enabled(os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    sub_1000EBF18(v7);
  }
  return v4;
}

+ (void)closeDatabaseFromManagedObjectContextForPlayerID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 _existingManagedObjectContextForPlayerID:a3]);
  [a1 closeDatabaseFromManagedObjectContextForMOC:v4];
}

+ (void)closeDatabaseFromManagedObjectContextForMOC:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000EB8F4;
  v4[3] = &unk_10026B670;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

+ (id)getParentBundleIDPrefixWithChildBundleID:(id)a3 parentBundleID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  sub_10012B610(v5, v7, v8, (uint64_t)a4);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease(v7, v10);
  swift_bridgeObjectRelease(a4, v12);
  if (v11)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11, v14);
  }

  else
  {
    NSString v13 = 0LL;
  }

  return v13;
}

@end