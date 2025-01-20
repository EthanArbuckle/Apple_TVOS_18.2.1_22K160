@interface MRDUIActivityServer
- (BOOL)hasNowPlayingAssertion;
- (MRDActiveUserController)activeUserController;
- (MRDUIActivityController)activityController;
- (MRDUIActivityServer)init;
- (MRDiscoveredGroupSession)discoveredSession;
- (MRPlayerPath)electedPlayer;
- (MSVTimer)activeUserChangedTimer;
- (MSVTimer)nowPlayingActivityAssertionEndTimer;
- (NSArray)activeRecommendationActivities;
- (NSDate)nowPlayingActivityAssertionEndDate;
- (NSMutableDictionary)routeRecommendationActivities;
- (NSMutableDictionary)suppressedBundleIdentifiers;
- (NSSet)activeRecommendations;
- (NSString)nowPlayingActivityUserIdentifier;
- (OS_dispatch_queue)queue;
- (id)combinedSuppressedBundleIdentifiers;
- (void)_activeUserDidChange:(id)a3 previous:(id)a4;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handlePlaybackQueueDidChangeNotification:(id)a3;
- (void)acquireGroupSessionLowPowerPlatterAssertionWithReply:(id)a3;
- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3 withReply:(id)a4;
- (void)acquireLockScreenControlsAssertionWithReply:(id)a3;
- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5 withReply:(id)a6;
- (void)acquireQuickControlsAssertionWithReply:(id)a3;
- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3 withReply:(id)a4;
- (void)acquireScreenMirroringQuickControlsAssertionWithReply:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)contextForActivityIdentifier:(id)a3 reply:(id)a4;
- (void)evaluateState;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)nowPlayingEnded;
- (void)releaseGroupSessionLowPowerPlatterAssertionWithReply:(id)a3;
- (void)releaseGroupSessionNearbyAssertionWithReply:(id)a3;
- (void)releaseLockScreenControlsAssertionWithReply:(id)a3;
- (void)releaseQuickControlsAssertionWithReply:(id)a3;
- (void)releaseRouteRecommendationAssertionWithReply:(id)a3;
- (void)releaseScreenMirroringQuickControlsAssertionWithReply:(id)a3;
- (void)releaseTimeBasedNowPlayingActivityAssertions;
- (void)routeRecommendationDismissed;
- (void)setActiveRecommendationActivities:(id)a3;
- (void)setActiveRecommendations:(id)a3;
- (void)setActiveUserChangedTimer:(id)a3;
- (void)setActiveUserController:(id)a3;
- (void)setDiscoveredSession:(id)a3;
- (void)setElectedPlayer:(id)a3;
- (void)setNowPlayingActivityAssertionEndDate:(id)a3;
- (void)setNowPlayingActivityAssertionEndTimer:(id)a3;
- (void)setNowPlayingActivityUserIdentifier:(id)a3;
- (void)setPreferredState:(int64_t)a3 reply:(id)a4;
- (void)setRouteRecommendationActivities:(id)a3;
- (void)setSuppressedBundleIdentifiers:(id)a3;
- (void)suppressPresentationOverBundleIdentifiers:(id)a3 reply:(id)a4;
- (void)updateActiveUser;
@end

@implementation MRDUIActivityServer

- (MRDUIActivityServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDUIActivityServer;
  v2 = -[MRDUIActivityServer init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 messageQueue]);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.MRDUIActivityServer.queue", v4, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    nowPlayingActivityAssertionEndDate = v2->_nowPlayingActivityAssertionEndDate;
    v2->_nowPlayingActivityAssertionEndDate = (NSDate *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
    [v11 addClientObserver:v2];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_handleElectedPlayerDidChangeNotification:" name:kMRMediaRemoteElectedPlayerDidChangeNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_handlePlaybackQueueDidChangeNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];

    v15 = (void *)MRSupportsSystemUIActivitiesBlock;
    MRSupportsSystemUIActivitiesBlock = &stru_10039A590;
  }

  return v2;
}

- (void)acquireLockScreenControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasLockScreenAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)releaseLockScreenControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasLockScreenAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)acquireQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v9 setHasQuickControlsAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingActivityIdentifier]);
  v4[2](v4, v8);
}

- (void)releaseQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasQuickControlsAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)acquireScreenMirroringQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasScreenMirroringAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)releaseScreenMirroringQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasScreenMirroringAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 clientForConnection:v9]);

  -[MRDUIActivityServer setDiscoveredSession:](self, "setDiscoveredSession:", v7);
  [v10 setHasGroupSessionNearbyAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v6[2](v6);
}

- (void)releaseGroupSessionNearbyAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasGroupSessionNearbyAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 clientForConnection:v9]);

  [v10 setRouteRecommendationIdentifiers:v7];
  [v10 setHasRouteRecommendationAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v6[2](v6);
}

- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5 withReply:(id)a6
{
  id v34 = a3;
  id v10 = (void (**)(void))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientForConnection:v12]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NowPlayingActivityAssertion for client: %@<%p>, duration: %ld",  v14,  v13,  a4));

  if (([v34 isEqualToString:MRNowPlayingActivityActiveRouteIdentifier] & 1) == 0)
  {
    else {
      v16 = v34;
    }
    id v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v33 = v13;
    v19 = v10;
    int64_t v20 = a5;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 routingServer]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 systemEndpointController]);
    id v23 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:v17 type:0 reason:v15];

    [v22 updateSystemEndpointForRequest:v23];
    a5 = v20;
    id v10 = v19;
    v13 = v33;
  }

  if (a4 == 2)
  {
    double v24 = 480.0;
  }

  else
  {
    if (a4 != 1)
    {
      if (!a4) {
        [v13 setHasNowPlayingActivityAssertion:1];
      }
      goto LABEL_15;
    }

    double v24 = 10.0;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer nowPlayingActivityAssertionEndDate](self, "nowPlayingActivityAssertionEndDate"));
  [v25 timeIntervalSinceDate:v26];
  double v28 = v27;

  if (v28 > 0.0) {
    -[MRDUIActivityServer setNowPlayingActivityAssertionEndDate:](self, "setNowPlayingActivityAssertionEndDate:", v25);
  }

LABEL_15:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 nowPlayingActivityIdentifier]);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( -[MRDUIActivityServer combinedSuppressedBundleIdentifiers]( self,  "combinedSuppressedBundleIdentifiers"));
  if (v30) {
    [v31 updateNowPlayingActivityState:a5 suppressedBundleIdentifiers:v32];
  }
  else {
    [v31 startNowPlayingActivityWithPreferredState:a5 suppressedBundleIdentifiers:v32];
  }

  -[MRDUIActivityServer updateActiveUser](self, "updateActiveUser");
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v10[2](v10);
}

- (void)updateActiveUser
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activeUserController](self, "activeUserController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000230F4;
  v8[3] = &unk_10039A5B8;
  v8[4] = self;
  [v3 observeActiveUserWithQueue:v4 handler:v8];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activeUserController](self, "activeUserController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023110;
  v7[3] = &unk_1003993A0;
  v7[4] = self;
  [v5 fetchActiveUserWithQueue:v6 completion:v7];
}

- (void)setPreferredState:(int64_t)a3 reply:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 clientForConnection:v8]);

  uint64_t v11 = _MRLogForCategory(11LL, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
    int v18 = 138412802;
    v19 = v13;
    __int16 v20 = 2048;
    v21 = v9;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDUIActivityServer] Client %@<%p> setting preferred state: %ld",  (uint8_t *)&v18,  0x20u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingActivityIdentifier]);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDUIActivityServer combinedSuppressedBundleIdentifiers]( self,  "combinedSuppressedBundleIdentifiers"));
    [v16 updateNowPlayingActivityState:a3 suppressedBundleIdentifiers:v17];
  }

  v6[2](v6);
}

- (void)releaseTimeBasedNowPlayingActivityAssertions
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  -[MRDUIActivityServer setNowPlayingActivityAssertionEndDate:](self, "setNowPlayingActivityAssertionEndDate:", v3);
}

- (id)combinedSuppressedBundleIdentifiers
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  suppressedBundleIdentifiers = self->_suppressedBundleIdentifiers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002348C;
  v8[3] = &unk_10039A5E0;
  id v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( suppressedBundleIdentifiers,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));

  return v6;
}

- (void)suppressPresentationOverBundleIdentifiers:(id)a3 reply:(id)a4
{
  id v19 = a3;
  v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 clientForConnection:v8]);

  if (!self->_suppressedBundleIdentifiers)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    suppressedBundleIdentifiers = self->_suppressedBundleIdentifiers;
    self->_suppressedBundleIdentifiers = v10;
  }

  id v12 = [v19 copy];
  v13 = self->_suppressedBundleIdentifiers;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nowPlayingActivityIdentifier]);

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDUIActivityServer combinedSuppressedBundleIdentifiers]( self,  "combinedSuppressedBundleIdentifiers"));
    [v17 updateNowPlayingActivityState:1 suppressedBundleIdentifiers:v18];
  }

  v6[2](v6);
}

- (void)releaseRouteRecommendationAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setRouteRecommendationIdentifiers:&__NSArray0__struct];
  [v7 setHasRouteRecommendationAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)routeRecommendationDismissed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clients]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_filter:", &stru_10039A620));

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "routeRecommendationDismissed", (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)nowPlayingEnded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activeUserController](self, "activeUserController"));
  [v2 stopObserving];
}

- (void)contextForActivityIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 contextForActivityIdentifier:v8]);

  (*((void (**)(id, void *))a4 + 2))(v7, v9);
}

- (void)acquireGroupSessionLowPowerPlatterAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasGroupSessionLowPowerPlatterAssertion:1];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)releaseGroupSessionLowPowerPlatterAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 clientForConnection:v6]);

  [v7 setHasGroupSessionLowPowerPlatterAssertion:0];
  -[MRDUIActivityServer evaluateState](self, "evaluateState");
  v4[2](v4);
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clients]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_filter:", &stru_10039A640));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "nearbyGroupSessionDismissed:",  v3,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (BOOL)hasNowPlayingAssertion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clients]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "hasQuickControlsAssertion", (void)v12) & 1) != 0
          || ([v9 hasLockScreenAssertion] & 1) != 0
          || ([v9 hasNowPlayingActivityAssertion] & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_14;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

- (void)evaluateState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clients]);

  v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  id obj = v3;
  id v79 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  if (v79)
  {
    uint64_t v78 = *(void *)v92;
    do
    {
      for (i = 0LL; i != v79; i = (char *)i + 1)
      {
        uint64_t v81 = v4;
        uint64_t v82 = v7;
        if (*(void *)v92 != v78) {
          objc_enumerationMutation(obj);
        }
        __int128 v11 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
        unsigned int v12 = [v11 hasQuickControlsAssertion];
        unsigned int v13 = [v11 hasLockScreenAssertion];
        unsigned int v14 = [v11 hasScreenMirroringAssertion];
        unsigned int v15 = [v11 hasGroupSessionNearbyAssertion];
        if ([v11 hasRouteRecommendationAssertion])
        {
          uint64_t v77 = v6;
          uint64_t v16 = v5;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 routeRecommendationIdentifiers]);
          -[NSMutableArray addObjectsFromArray:](v76, "addObjectsFromArray:", v17);

          uint64_t v5 = v16;
          uint64_t v6 = v77;
        }

        v8 += v12;
        v9 += v13;
        uint64_t v7 = v82 + v14;
        v6 += v15;
        v5 += [v11 hasGroupSessionLowPowerPlatterAssertion];
        uint64_t v4 = v81 + [v11 hasNowPlayingActivityAssertion];
      }

      id v79 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
    }

    while (v79);
  }

  uint64_t v18 = v6;

  if (v9 > 0 || v8 > 0 || v4 >= 1)
  {
    id v19 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 nowPlayingActivityIdentifier]);

    if (v27) {
      goto LABEL_20;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue( -[MRDUIActivityServer combinedSuppressedBundleIdentifiers]( self,  "combinedSuppressedBundleIdentifiers"));
    [v25 startNowPlayingActivityWithPreferredState:0 suppressedBundleIdentifiers:v28];
  }

  else
  {
    id v19 = self;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( -[MRDUIActivityServer nowPlayingActivityAssertionEndDate]( self,  "nowPlayingActivityAssertionEndDate"));
    [v20 timeIntervalSinceNow];
    double v22 = v21;

    if (v22 <= 0.0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
      [v25 endNowPlayingActivity];
    }

    else
    {
      uint64_t v24 = _MRLogForCategory(11LL, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG)) {
        sub_1002B5284(self, (os_log_s *)v25);
      }
    }
  }

LABEL_20:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](v19, "activityController"));
  v30 = v29;
  if (v7 < 1) {
    [v29 endMirroringActivity];
  }
  else {
    [v29 startMirroringActivity];
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](v19, "activityController"));
  v32 = v31;
  if (v18 < 1) {
    [v31 endGroupSessionNearbyActivity];
  }
  else {
    [v31 startGroupSessionNearbyActivity:v19->_discoveredSession];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](v19, "activityController"));
  id v34 = v33;
  if (v5 < 1) {
    [v33 endGroupSessionLowPowerPlatterActivity];
  }
  else {
    [v33 startGroupSessionLowPowerPlatterActivity];
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activeRecommendationActivities](v19, "activeRecommendationActivities"));
  unsigned __int8 v36 = -[NSMutableArray isEqualToArray:](v76, "isEqualToArray:", v35);

  if ((v36 & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activeRecommendationActivities](v19, "activeRecommendationActivities"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer routeRecommendationActivities](v19, "routeRecommendationActivities"));

    if (!v38)
    {
      v39 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[MRDUIActivityServer setRouteRecommendationActivities:](v19, "setRouteRecommendationActivities:", v39);
    }

    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id v40 = v37;
    id v41 = [v40 countByEnumeratingWithState:&v87 objects:v102 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v88;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v88 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)j);
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer routeRecommendationActivities](v19, "routeRecommendationActivities"));
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v45]);

          if (v47)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
            [v49 endRouteRecommendationActivityFor:v47];

            uint64_t v51 = _MRLogForCategory(11LL, v50);
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = v45;
              __int16 v97 = 2112;
              v98 = v47;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "[MRDUIActivityServer] >>+ ending recommendation for route %@ with LA id: %@",  buf,  0x16u);
            }

            v53 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer routeRecommendationActivities](self, "routeRecommendationActivities"));
            [v53 setObject:0 forKeyedSubscript:v45];
          }

          else
          {
            uint64_t v54 = _MRLogForCategory(11LL, v48);
            v53 = (void *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v45;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v53,  OS_LOG_TYPE_DEBUG,  "[MRDUIActivityServer] >>+ could not find activity id for %@",  buf,  0xCu);
            }
          }

LABEL_45:
          id v19 = self;
        }

        id v42 = [v40 countByEnumeratingWithState:&v87 objects:v102 count:16];
      }

      while (v42);
    }

    uint64_t v56 = _MRLogForCategory(11LL, v55);
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
      sub_1002B5200((uint64_t)obj, (uint64_t)v76, v57);
    }

    v58 = v76;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v83,  v101,  16LL);
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v84;
      double v62 = 0.0;
      do
      {
        for (k = 0LL; k != v60; k = (char *)k + 1)
        {
          if (*(void *)v84 != v61) {
            objc_enumerationMutation(v58);
          }
          v64 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)k);
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer routeRecommendationActivities](v19, "routeRecommendationActivities"));
          v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v64]);

          v67 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](v19, "activityController"));
          v68 = v67;
          if (v66)
          {
            [v67 setRouteRecommendationRelevanceScore:v66 activityIdentifier:v62];
            v69 = v68;
          }

          else
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue([v67 startRouteRecommendationActivityFor:v64 relevanceScore:v62]);

            uint64_t v71 = _MRLogForCategory(11LL, v70);
            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v96 = v69;
              __int16 v97 = 2112;
              v98 = v64;
              __int16 v99 = 2048;
              double v100 = -v62;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEBUG,  "[MRDUIActivityServer] >>+ %@ for AVOD %@ (%f)",  buf,  0x20u);
            }

            v73 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer routeRecommendationActivities](self, "routeRecommendationActivities"));
            [v73 setObject:v69 forKeyedSubscript:v64];
          }

          double v62 = v62 + -1.0;
          id v19 = self;
        }

        id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v83,  v101,  16LL);
      }

      while (v60);
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v58));
    -[MRDUIActivityServer setActiveRecommendations:](v19, "setActiveRecommendations:", v74);

    -[MRDUIActivityServer setActiveRecommendationActivities:](v19, "setActiveRecommendationActivities:", v58);
  }
}

- (MRDUIActivityController)activityController
{
  activityController = self->_activityController;
  if (!activityController)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___MRDUIActivityController);
    uint64_t v5 = self->_activityController;
    self->_activityController = v4;

    -[MRDUIActivityController setDelegate:](self->_activityController, "setDelegate:", self);
    activityController = self->_activityController;
  }

  return activityController;
}

- (void)setNowPlayingActivityAssertionEndDate:(id)a3
{
  id v5 = a3;
  uint64_t v7 = _MRLogForCategory(11LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingActivityAssertionEndDate = self->_nowPlayingActivityAssertionEndDate;
    *(_DWORD *)buf = 138412546;
    id v17 = nowPlayingActivityAssertionEndDate;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDUIActivityServer] Update now playing activity end date from: %@ -> %@",  buf,  0x16u);
  }

  objc_storeStrong((id *)&self->_nowPlayingActivityAssertionEndDate, a3);
  -[MSVTimer invalidate](self->_nowPlayingActivityAssertionEndTimer, "invalidate");
  [v5 timeIntervalSinceNow];
  double v11 = v10 + 1.0;
  if (v10 + 1.0 > 0.0)
  {
    objc_initWeak((id *)buf, self);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100024650;
    v14[3] = &unk_10039A668;
    objc_copyWeak(&v15, (id *)buf);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v12,  v14,  v11));
    -[MRDUIActivityServer setNowPlayingActivityAssertionEndTimer:](self, "setNowPlayingActivityAssertionEndTimer:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024780;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002494C;
  v9[3] = &unk_100398E60;
  id v10 = v6;
  double v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)_handlePlaybackQueueDidChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100024AE0;
  v9[3] = &unk_100398E60;
  id v10 = v6;
  double v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)_activeUserDidChange:(id)a3 previous:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(11LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v7;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDUIActivityServer] Active user changed from %@ to %@",  buf,  0x16u);
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer activityController](self, "activityController"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingActivityIdentifier]);

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 routingServer]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 systemEndpointController]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeOutputDeviceUID]);

  if (v7)
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer nowPlayingActivityUserIdentifier](self, "nowPlayingActivityUserIdentifier"));
    unsigned __int8 v19 = [v7 isEqualToString:v18];

    char v20 = v19 ^ 1;
    if (v6)
    {
LABEL_5:
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer nowPlayingActivityUserIdentifier](self, "nowPlayingActivityUserIdentifier"));
      unsigned __int8 v22 = [v6 isEqualToString:v21];

      char v23 = v22 ^ 1;
      goto LABEL_8;
    }
  }

  else
  {
    char v20 = 1;
    if (v6) {
      goto LABEL_5;
    }
  }

  char v23 = 1;
LABEL_8:
  if (v12) {
    BOOL v24 = v16 == 0LL;
  }
  else {
    BOOL v24 = 1;
  }
  if (v24) {
    char v25 = 1;
  }
  else {
    char v25 = v20;
  }
  if ((v25 & 1) != 0)
  {
    if (!v12) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {
      uint64_t v26 = _MRLogForCategory(11LL, v17);
      double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[MRDUIActivityServer] Invalidating ASE reset timer because initial user is active",  buf,  2u);
      }

      -[MRDUIActivityServer setActiveUserChangedTimer:](self, "setActiveUserChangedTimer:", 0LL);
    }
  }

  else
  {
    uint64_t v28 = _MRLogForCategory(11LL, v17);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDUIActivityServer] Scheduling ASE reset timer because initial user is not active",  buf,  2u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v30 activeUserTimeoutInterval];
    double v32 = v31;

    objc_initWeak((id *)buf, self);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100024F34;
    v35[3] = &unk_10039A668;
    objc_copyWeak(&v36, (id *)buf);
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v33,  v35,  v32));
    -[MRDUIActivityServer setActiveUserChangedTimer:](self, "setActiveUserChangedTimer:", v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDUIActivityServer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025108;
  block[3] = &unk_100398E60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRPlayerPath)electedPlayer
{
  return self->_electedPlayer;
}

- (void)setElectedPlayer:(id)a3
{
}

- (MRDiscoveredGroupSession)discoveredSession
{
  return self->_discoveredSession;
}

- (void)setDiscoveredSession:(id)a3
{
}

- (NSSet)activeRecommendations
{
  return self->_activeRecommendations;
}

- (void)setActiveRecommendations:(id)a3
{
}

- (NSArray)activeRecommendationActivities
{
  return self->_activeRecommendationActivities;
}

- (void)setActiveRecommendationActivities:(id)a3
{
}

- (NSMutableDictionary)routeRecommendationActivities
{
  return self->_routeRecommendationActivities;
}

- (void)setRouteRecommendationActivities:(id)a3
{
}

- (NSMutableDictionary)suppressedBundleIdentifiers
{
  return self->_suppressedBundleIdentifiers;
}

- (void)setSuppressedBundleIdentifiers:(id)a3
{
}

- (NSDate)nowPlayingActivityAssertionEndDate
{
  return self->_nowPlayingActivityAssertionEndDate;
}

- (MSVTimer)nowPlayingActivityAssertionEndTimer
{
  return self->_nowPlayingActivityAssertionEndTimer;
}

- (void)setNowPlayingActivityAssertionEndTimer:(id)a3
{
}

- (MRDActiveUserController)activeUserController
{
  return self->_activeUserController;
}

- (void)setActiveUserController:(id)a3
{
}

- (NSString)nowPlayingActivityUserIdentifier
{
  return self->_nowPlayingActivityUserIdentifier;
}

- (void)setNowPlayingActivityUserIdentifier:(id)a3
{
}

- (MSVTimer)activeUserChangedTimer
{
  return self->_activeUserChangedTimer;
}

- (void)setActiveUserChangedTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end