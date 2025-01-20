@interface NIServerSessionLifeCycleManager
+ (NIServerSessionLifeCycleManager)new;
- (BOOL)doesClientWantSessionToRun;
- (BOOL)isDiscoveryActive;
- (BOOL)isPositioningSensorActive;
- (BOOL)isSessionInvalidated;
- (BOOL)isTracking;
- (BOOL)isTrackingPeer:(id)a3;
- (BOOL)timeoutOnPeerInactivity;
- (NIServerSessionLifeCycleManager)init;
- (NIServerSessionLifeCycleManager)initWithSessionIdentifier:(id)a3 cycleRate:(duration<long)long updatesQueue:()std:(1000>>)a4 :(id)a5 ratio<1 analyticsManager:(id)a6;
- (NIServerSessionLifeCycleObserver)observer;
- (NSArray)peers;
- (NSUUID)sessionIdentifier;
- (double)maxInactivityAfterTrackingBeganSeconds;
- (double)maxInactivityBeforeTrackingBeganSeconds;
- (id).cxx_construct;
- (void)_printStats;
- (void)_removeAllPeers;
- (void)_removePeer:(id)a3;
- (void)_startMonitoringPeersActivity:(id)a3;
- (void)_watchdogLoop;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)failedToAddPeer;
- (void)failedToRemovePeer;
- (void)invalidateCalled;
- (void)measurementReceivedForToken:(id)a3 contTimestamp:(double)a4;
- (void)pauseCalled;
- (void)peerHangupReceived:(id)a3;
- (void)peerLostCallbackReceived:(id)a3;
- (void)positioningSensorSessionStarted;
- (void)positioningSensorSessionStopped;
- (void)removeObserver:(id)a3;
- (void)runWithConfigurationCalled;
- (void)setClientWantsSessionToRun:(BOOL)a3;
- (void)setDiscoveryActive:(BOOL)a3;
- (void)setMaxInactivityAfterTrackingBeganSeconds:(double)a3;
- (void)setMaxInactivityBeforeTrackingBeganSeconds:(double)a3;
- (void)setPositioningSensorActive:(BOOL)a3;
- (void)setSessionInvalidated:(BOOL)a3;
- (void)setTimeoutOnPeerInactivity:(BOOL)a3;
- (void)setTracking:(BOOL)a3;
- (void)startedDiscoveringPeersWithTokens:(id)a3;
- (void)stoppedDiscoveringAllPeers;
- (void)stoppedDiscoveringPeersWithTokens:(id)a3;
@end

@implementation NIServerSessionLifeCycleManager

- (NIServerSessionLifeCycleManager)initWithSessionIdentifier:(id)a3 cycleRate:(duration<long)long updatesQueue:()std:(1000>>)a4 :(id)a5 ratio<1 analyticsManager:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_16:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v31 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 65, @"Invalid parameter not satisfying: %@", @"updatesQueue" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v30 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 64, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_16;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_17:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v32 handleFailureInMethod:a2, self, @"NIServerSessionLifeCycleManager.mm", 66, @"Invalid parameter not satisfying: %@", @"analyticsManager" object file lineNumber description];

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NIServerSessionLifeCycleManager;
  v15 = -[NIServerSessionLifeCycleManager init](&v33, "init");
  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_sessionIdentifier, a3);
    v15->_cycleRate = a4;
    objc_storeStrong((id *)&v15->_updatesQueue, a5);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.nearbyd.sessionLifeCycleWatchdog", 0LL);
    watchdogQueue = v15->_watchdogQueue;
    v15->_watchdogQueue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    nearbyObjectsCache = v15->_nearbyObjectsCache;
    v15->_nearbyObjectsCache = v20;

    objc_storeWeak((id *)&v15->_analyticsManager, v14);
    -[NIServerSessionLifeCycleManager setTimeoutOnPeerInactivity:](v15, "setTimeoutOnPeerInactivity:", 1LL);
    -[NIServerSessionLifeCycleManager setMaxInactivityAfterTrackingBeganSeconds:]( v15,  "setMaxInactivityAfterTrackingBeganSeconds:",  60.0);
    -[NIServerSessionLifeCycleManager setMaxInactivityBeforeTrackingBeganSeconds:]( v15,  "setMaxInactivityBeforeTrackingBeganSeconds:",  120.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v22 doubleForKey:@"MaxInactivityAfterTrackingBeganSeconds"];
    double v24 = v23;
    [v22 doubleForKey:@"MaxInactivityBeforeTrackingBeganSeconds"];
    double v26 = v25;
    if (v24 > 0.0)
    {
      v27 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v35 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#lifecycle,* MaxInactivityAfterTrackingBeganSeconds from default write: %f",  buf,  0xCu);
      }

      -[NIServerSessionLifeCycleManager setMaxInactivityAfterTrackingBeganSeconds:]( v15,  "setMaxInactivityAfterTrackingBeganSeconds:",  v24);
    }

    if (v26 > 0.0)
    {
      v28 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v35 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "#lifecycle,* MaxInactivityBeforeTrackingBeganSeconds from default write: %f",  buf,  0xCu);
      }

      -[NIServerSessionLifeCycleManager setMaxInactivityBeforeTrackingBeganSeconds:]( v15,  "setMaxInactivityBeforeTrackingBeganSeconds:",  v26);
    }
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIServerSessionLifeCycleManager;
  -[NIServerSessionLifeCycleManager dealloc](&v3, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  sub_1000065CC(__p, "addObserver");
  v8 = __p;
  v5 = sub_1001E68F8((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_1004242F8, (__int128 **)&v8);
  ++v5[5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  sub_1000065CC(__p, "removeObserver");
  v8 = __p;
  v5 = sub_1001E68F8((uint64_t)&self->_callCounter, (unsigned __int8 *)__p, (uint64_t)&unk_1004242F8, (__int128 **)&v8);
  ++v5[5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
}

- (NSArray)peers
{
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1001E3F8C;
  v10 = sub_1001E3F9C;
  id v11 = 0LL;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E3FA4;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)runWithConfigurationCalled
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4074;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
  id v4 = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E41BC;
  v5[3] = &unk_1007A3000;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (void)pauseCalled
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E421C;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)invalidateCalled
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E43C0;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)failedToAddPeer
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4568;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)failedToRemovePeer
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E46FC;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)startedDiscoveringPeersWithTokens:(id)a3
{
  id v4 = a3;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E48B4;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(watchdogQueue, block);
}

- (void)stoppedDiscoveringPeersWithTokens:(id)a3
{
  id v4 = a3;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4A80;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(watchdogQueue, block);
}

- (void)stoppedDiscoveringAllPeers
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4CA8;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)peerLostCallbackReceived:(id)a3
{
  id v4 = a3;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4E70;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(watchdogQueue, block);
}

- (void)positioningSensorSessionStarted
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E5048;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)positioningSensorSessionStopped
{
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E51E8;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(watchdogQueue, block);
}

- (void)measurementReceivedForToken:(id)a3 contTimestamp:(double)a4
{
  id v6 = a3;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E53B8;
  block[3] = &unk_1007B6360;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_sync(watchdogQueue, block);
}

- (void)peerHangupReceived:(id)a3
{
  id v4 = a3;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E5514;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(watchdogQueue, block);
}

- (BOOL)isTrackingPeer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E5670;
  block[3] = &unk_1007B6388;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(watchdogQueue, block);
  LOBYTE(watchdogQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)watchdogQueue;
}

- (void)_startMonitoringPeersActivity:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id obj = v11;
  id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      char v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PRPeerActivityEntry entryWithActivityType:]( &OBJC_CLASS___PRPeerActivityEntry,  "entryWithActivityType:",  0LL,  v11));
        id v10 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v8);
        -[NSMutableArray addObject:](v4, "addObject:", v10);
        -[NSMutableDictionary setObject:forKey:](self->_nearbyObjectsCache, "setObject:forKey:", v9, v8);

        char v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }
}

- (void)_removePeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_watchdogQueue);
  -[NSMutableDictionary removeObjectForKey:](self->_nearbyObjectsCache, "removeObjectForKey:", v4);
}

- (void)_removeAllPeers
{
}

- (void)_watchdogLoop
{
  if (!self->_clientWantsSessionToRun || self->_sessionInvalidated) {
    return;
  }
  v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id obj = self->_nearbyObjectsCache;
  id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v78,  16LL);
  id v5 = &unk_10040C000;
  if (!v3) {
    goto LABEL_50;
  }
  int v43 = 0;
  uint64_t v45 = *(void *)v68;
  id v46 = v3;
  *(void *)&__int128 v4 = 138412546LL;
  __int128 v41 = v4;
  do
  {
    for (i = 0LL; i != v46; i = (char *)i + 1)
    {
      if (*(void *)v68 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)i);
      v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nearbyObjectsCache,  "objectForKeyedSubscript:",  v6,  v41));
      [v48 latestActivityTimestamp];
      double v8 = sub_100023CC4() - v7;
      if ([v48 latestActivityType])
      {
        if (-[NIServerSessionLifeCycleManager timeoutOnPeerInactivity](self, "timeoutOnPeerInactivity"))
        {
          -[NIServerSessionLifeCycleManager maxInactivityAfterTrackingBeganSeconds]( self,  "maxInactivityAfterTrackingBeganSeconds");
          if (v8 > v9)
          {
            -[NSMutableArray addObject:](v42, "addObject:", v6);
            id v10 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              sessionIdentifier = self->_sessionIdentifier;
              *(_DWORD *)buf = v41;
              v75 = sessionIdentifier;
              __int16 v76 = 2112;
              uint64_t v77 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#lifecycle,(ses id: %@) TRACKING timed out for %@",  buf,  0x16u);
            }

            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            id v12 = self->_observers;
            id v13 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v57,  v72,  16LL);
            if (v13)
            {
              uint64_t v14 = *(void *)v58;
              do
              {
                for (j = 0LL; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v58 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
                  updatesQueue = (dispatch_queue_s *)self->_updatesQueue;
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472LL;
                  block[2] = sub_1001E614C;
                  block[3] = &unk_1007A2248;
                  block[4] = v16;
                  void block[5] = v6;
                  dispatch_async(updatesQueue, block);
                }

                id v13 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v57,  v72,  16LL);
              }

              while (v13);
            }

            id v5 = (void *)&unk_10040C000;
            dispatch_queue_t v18 = (dispatch_queue_s *)self->_updatesQueue;
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472LL;
            v55[2] = sub_1001E6158;
            v55[3] = &unk_1007A2248;
            v55[4] = self;
            v55[5] = v6;
            v19 = v55;
LABEL_34:
            dispatch_async(v18, v19);
            goto LABEL_40;
          }
        }

        v31 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
        {
          v32 = self->_sessionIdentifier;
          *(_DWORD *)buf = v41;
          v75 = v32;
          __int16 v76 = 2112;
          uint64_t v77 = v6;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "#lifecycle,(ses id: %@) TRACKING active for %@",  buf,  0x16u);
        }

        ++v43;
      }

      else
      {
        if (-[NIServerSessionLifeCycleManager timeoutOnPeerInactivity](self, "timeoutOnPeerInactivity"))
        {
          -[NIServerSessionLifeCycleManager maxInactivityBeforeTrackingBeganSeconds]( self,  "maxInactivityBeforeTrackingBeganSeconds");
          if (v8 > v20)
          {
            -[NSMutableArray addObject:](v42, "addObject:", v6);
            v21 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              v22 = self->_sessionIdentifier;
              *(_DWORD *)buf = v41;
              v75 = v22;
              __int16 v76 = 2112;
              uint64_t v77 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#lifecycle,(ses id: %@) DISCOVERY timed out for %@",  buf,  0x16u);
            }

            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            double v23 = self->_observers;
            id v24 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v63,  v73,  16LL);
            if (v24)
            {
              uint64_t v25 = *(void *)v64;
              do
              {
                for (k = 0LL; k != v24; k = (char *)k + 1)
                {
                  if (*(void *)v64 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)k);
                  v28 = (dispatch_queue_s *)self->_updatesQueue;
                  v62[0] = _NSConcreteStackBlock;
                  v62[1] = 3221225472LL;
                  v62[2] = sub_1001E60EC;
                  v62[3] = &unk_1007A2248;
                  v62[4] = v27;
                  v62[5] = v6;
                  dispatch_async(v28, v62);
                }

                id v24 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v63,  v73,  16LL);
              }

              while (v24);
            }

            id v5 = (void *)&unk_10040C000;
            dispatch_queue_t v18 = (dispatch_queue_s *)self->_updatesQueue;
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472LL;
            v61[2] = sub_1001E60F8;
            v61[3] = &unk_1007A2248;
            v61[4] = self;
            v61[5] = v6;
            v19 = v61;
            goto LABEL_34;
          }
        }

        v29 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
        {
          v30 = self->_sessionIdentifier;
          *(_DWORD *)buf = v41;
          v75 = v30;
          __int16 v76 = 2112;
          uint64_t v77 = v6;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "#lifecycle,(ses id: %@) DISCOVERY active for %@",  buf,  0x16u);
        }
      }

- (NIServerSessionLifeCycleManager)init
{
}

+ (NIServerSessionLifeCycleManager)new
{
}

- (void)setDiscoveryActive:(BOOL)a3
{
  self->_discoveryActive = a3;
}

- (BOOL)isDiscoveryActive
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E62E4;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientWantsSessionToRun:(BOOL)a3
{
  self->_clientWantsSessionToRun = a3;
}

- (BOOL)doesClientWantSessionToRun
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E63B4;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPositioningSensorActive:(BOOL)a3
{
  self->_positioningSensorActive = a3;
}

- (BOOL)isPositioningSensorActive
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E6484;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (BOOL)isTracking
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E6554;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSessionInvalidated:(BOOL)a3
{
  self->_sessionInvalidated = a3;
}

- (BOOL)isSessionInvalidated
{
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E6624;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(watchdogQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_printStats
{
  char v3 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  for (i = &self->_callCounter.__table_.__p1_;
        ;
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"%s : %llu times\n", next, i[5].__value_.__next_))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
    next = i + 2;
    if (SHIBYTE(i[4].__value_.__next_) < 0) {
      next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, unsigned long long>, void *>>> *)next->__value_.__next_;
    }
  }

  uint64_t v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412546;
    char v9 = sessionIdentifier;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#lifecycle,\n============================\nStats for session ID %@\n%@\n============================",  buf,  0x16u);
  }
}

- (BOOL)timeoutOnPeerInactivity
{
  return self->timeoutOnPeerInactivity;
}

- (void)setTimeoutOnPeerInactivity:(BOOL)a3
{
  self->timeoutOnPeerInactivity = a3;
}

- (double)maxInactivityAfterTrackingBeganSeconds
{
  return self->maxInactivityAfterTrackingBeganSeconds;
}

- (void)setMaxInactivityAfterTrackingBeganSeconds:(double)a3
{
  self->maxInactivityAfterTrackingBeganSeconds = a3;
}

- (double)maxInactivityBeforeTrackingBeganSeconds
{
  return self->maxInactivityBeforeTrackingBeganSeconds;
}

- (void)setMaxInactivityBeforeTrackingBeganSeconds:(double)a3
{
  self->maxInactivityBeforeTrackingBeganSeconds = a3;
}

- (NIServerSessionLifeCycleObserver)observer
{
  return (NIServerSessionLifeCycleObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 136LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end