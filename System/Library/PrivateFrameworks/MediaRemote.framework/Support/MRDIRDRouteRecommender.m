@interface MRDIRDRouteRecommender
- (IRSession)session;
- (MRDIRDRouteRecommender)init;
- (MRRouteRecommenderDelegate)delegate;
- (NSString)bundleIdentifierPendingUpdate;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (id)defaultsContext;
- (id)irCandidateFor:(id)a3;
- (id)sortCandidateResults:(id)a3 contextIdentifier:(id)a4;
- (int)firstUnlockToken;
- (int64_t)allowedContextUpdates;
- (int64_t)mode;
- (void)_onQueue_createRunningSessionWithCompletion:(id)a3;
- (void)_onQueue_createRunningSessionWithServiceToken:(id)a3;
- (void)_onQueue_initializeSessionWithCompletion:(id)a3;
- (void)_onQueue_invalidateSession;
- (void)addEvent:(id)a3 forRouteCandidate:(id)a4;
- (void)fetchServiceTokenWithCompletion:(id)a3;
- (void)getSessionWithLatestConfiguration:(id)a3;
- (void)initializeSessionIfNeededWithCompletion:(id)a3;
- (void)requestCurrentContext;
- (void)requestCurrentContextWithBundleID:(id)a3;
- (void)runSession:(id)a3 withMode:(int64_t)a4 andServiceToken:(id)a5;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)setAllowedContextUpdates:(int64_t)a3;
- (void)setBundleIdentifierPendingUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstUnlockToken:(int)a3;
- (void)setMode:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateRouteCandidate:(id)a3;
- (void)updateRouteCandidates:(id)a3;
@end

@implementation MRDIRDRouteRecommender

- (MRDIRDRouteRecommender)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDIRDRouteRecommender;
  v2 = -[MRDIRDRouteRecommender init](&v8, "init");
  if (v2)
  {
    v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mediaremote");
    -[MRDIRDRouteRecommender setUserDefaults:](v2, "setUserDefaults:", v3);

    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.MRIRDRouteRecommender", v5);
    -[MRDIRDRouteRecommender setQueue:](v2, "setQueue:", v6);
  }

  return v2;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
  uint64_t v5 = _MRLogForCategory(13LL, a2);
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Mode set to %ld", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A0BE8;
  v7[3] = &unk_10039E330;
  v7[4] = self;
  v7[5] = a3;
  -[MRDIRDRouteRecommender initializeSessionIfNeededWithCompletion:]( self,  "initializeSessionIfNeededWithCompletion:",  v7);
}

- (void)addEvent:(id)a3 forRouteCandidate:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A0D48;
  v8[3] = &unk_10039E3A8;
  id v9 = a3;
  v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[MRDIRDRouteRecommender getSessionWithLatestConfiguration:](self, "getSessionWithLatestConfiguration:", v8);
}

- (void)requestCurrentContext
{
}

- (void)requestCurrentContextWithBundleID:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A1250;
  v5[3] = &unk_10039E410;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[MRDIRDRouteRecommender getSessionWithLatestConfiguration:](self, "getSessionWithLatestConfiguration:", v5);
}

- (void)updateRouteCandidate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A13C4;
  v5[3] = &unk_10039E410;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[MRDIRDRouteRecommender getSessionWithLatestConfiguration:](self, "getSessionWithLatestConfiguration:", v5);
}

- (void)updateRouteCandidates:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000A1570;
    v5[3] = &unk_10039E410;
    id v6 = v4;
    id v7 = self;
    -[MRDIRDRouteRecommender getSessionWithLatestConfiguration:](self, "getSessionWithLatestConfiguration:", v5);
  }
}

- (id)defaultsContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender userDefaults](self, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"IRContextUpdate"]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRIRRouteRecommendationContext fromObject:]( &OBJC_CLASS___MRIRRouteRecommendationContext,  "fromObject:",  v3));
  if (v5)
  {
    uint64_t v6 = _MRLogForCategory(13LL, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD Overriding context with %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v5;
}

- (id)sortCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_10039E4D8]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A1C30;
  v11[3] = &unk_10039E500;
  id v12 = v5;
  id v8 = v5;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_map:", v11));

  return v9;
}

- (id)irCandidateFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___IRCandidate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 routeIdentifier]);
  id v6 = [v4 initWithCandidateIdentifier:v5];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 nodes]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_map:", &stru_10039E540));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v6 updateNodes:v9];

  return v6;
}

- (void)initializeSessionIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000A2040;
  handler[3] = &unk_10039E568;
  objc_copyWeak(&v20, &location);
  id v6 = v4;
  id v19 = v6;
  uint32_t v7 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockToken, v5, handler);

  if (v7)
  {
    uint64_t v9 = _MRLogForCategory(13LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD Failed to register for first unlock notification (status = %d)",  buf,  8u);
    }
  }

  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A20C4;
    block[3] = &unk_10039E590;
    objc_copyWeak(&v17, &location);
    id v16 = v6;
    dispatch_async(v12, block);

    objc_destroyWeak(&v17);
  }

  else
  {
    uint64_t v13 = _MRLogForCategory(13LL, v11);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD Device not yet unlocked since boot",  buf,  2u);
    }
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_onQueue_initializeSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1000A2200;
  uint64_t v13 = &unk_10039E5B8;
  v14 = self;
  id v15 = v4;
  id v6 = v4;
  uint32_t v7 = objc_retainBlock(&v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender session](self, "session", v10, v11, v12, v13, v14));

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender session](self, "session"));
    ((void (*)(void ***, void *, void))v7[2])(v7, v9, 0LL);
  }

  else
  {
    -[MRDIRDRouteRecommender _onQueue_createRunningSessionWithCompletion:]( self,  "_onQueue_createRunningSessionWithCompletion:",  v7);
  }

  if (notify_is_valid_token(self->_firstUnlockToken)) {
    notify_cancel(self->_firstUnlockToken);
  }
}

- (void)_onQueue_invalidateSession
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = _MRLogForCategory(13LL, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IRD Invalidating Session", v9, 2u);
  }

  uint32_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender session](self, "session"));
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender session](self, "session"));
    [v8 invalidate];
  }

  -[MRDIRDRouteRecommender setSession:](self, "setSession:", 0LL);
}

- (void)_onQueue_createRunningSessionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A23D0;
  v7[3] = &unk_10039E5E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRDIRDRouteRecommender fetchServiceTokenWithCompletion:](self, "fetchServiceTokenWithCompletion:", v7);
}

- (void)_onQueue_createRunningSessionWithServiceToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(&OBJC_CLASS___IRSession);
  -[IRSession setDelegate:](v6, "setDelegate:", self);
  uint64_t v8 = _MRLogForCategory(13LL, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD createRunningSession: session created %@",  (uint8_t *)&v10,  0xCu);
  }

  -[MRDIRDRouteRecommender setSession:](self, "setSession:", v6);
  -[MRDIRDRouteRecommender runSession:withMode:andServiceToken:]( self,  "runSession:withMode:andServiceToken:",  v6,  -[MRDIRDRouteRecommender mode](self, "mode"),  v4);
}

- (void)getSessionWithLatestConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(13LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD getSessionWithLatestConfiguration:",  buf,  2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A2718;
  v9[3] = &unk_10039E608;
  id v10 = v4;
  id v8 = v4;
  -[MRDIRDRouteRecommender initializeSessionIfNeededWithCompletion:]( self,  "initializeSessionIfNeededWithCompletion:",  v9);
}

- (void)runSession:(id)a3 withMode:(int64_t)a4 andServiceToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [[IRConfiguration alloc] initWithServiceToken:v8];

  [v9 setMode:a4];
  uint64_t v11 = _MRLogForCategory(13LL, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD Will call (%p)%@ runWithConfiguration: %@",  (uint8_t *)&v13,  0x20u);
  }

  [v7 runWithConfiguration:v9];
}

- (void)fetchServiceTokenWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  uint64_t v5 = _MRLogForCategory(13LL, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD fetchServiceTokenWithCompletion: non user aware",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IRServiceToken serviceTokenForServiceIdentifier:]( &OBJC_CLASS___IRServiceToken,  "serviceTokenForServiceIdentifier:",  MRIRServiceTokenIdentifier));
  v3[2](v3, v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2A20;
  block[3] = &unk_100398F40;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _MRLogForCategory(13LL, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD session:didUpdateContext: %@",  (uint8_t *)&v19,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender defaultsContext](self, "defaultsContext"));
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IRContextMediaRouteKey]);
  }
  id v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contextIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 candidateResults]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIRDRouteRecommender sortCandidateResults:contextIdentifier:]( self,  "sortCandidateResults:contextIdentifier:",  v14,  v13));
  if (-[MRDIRDRouteRecommender allowedContextUpdates](self, "allowedContextUpdates") >= 1
    && (id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender bundleIdentifierPendingUpdate](self, "bundleIdentifierPendingUpdate")),
        v16,
        v16))
  {
    -[MRDIRDRouteRecommender setAllowedContextUpdates:]( self,  "setAllowedContextUpdates:",  (char *)-[MRDIRDRouteRecommender allowedContextUpdates](self, "allowedContextUpdates") - 1);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender delegate](self, "delegate"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender bundleIdentifierPendingUpdate](self, "bundleIdentifierPendingUpdate"));
    [v17 didReceiveNewRecommendations:v15 forBundleIdentifier:v18];
  }

  else
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRDRouteRecommender delegate](self, "delegate"));
    [v17 didReceiveNewRecommendations:v15 forBundleIdentifier:0];
  }
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  uint64_t v5 = _MRLogForCategory(13LL, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD session:suspendedWithReason: %ld",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = _MRLogForCategory(13LL, a2);
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218240;
    int64_t v10 = a4;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD session:suspensionReasonEnded:isNoLongerSuspended: %ld %d",  (uint8_t *)&v9,  0x12u);
  }
}

- (void)session:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v4 = a4;
  uint64_t v6 = _MRLogForCategory(13LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD session:didUpdateBundlesWithSignificantInteractionPattern: %@",  buf,  0xCu);
  }

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___IRMediaBundle);
        char isKindOfClass = objc_opt_isKindOfClass(v15, v17);
        int v19 = v8;
        if ((isKindOfClass & 1) == 0
          || (id v20 = v15,
              id v21 = [v20 bundleType],
              [v9 setObject:v20 forKeyedSubscript:v16],
              v20,
              [v8 addObject:v16],
              int v19 = v23,
              v21 == (id)2))
        {
          [v19 addObject:v16];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v12);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaBundleManager shared](&OBJC_CLASS___MRDMediaBundleManager, "shared"));
  [v22 setBundles:v9];
}

- (MRRouteRecommenderDelegate)delegate
{
  return (MRRouteRecommenderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (IRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (void)setFirstUnlockToken:(int)a3
{
  self->_firstUnlockToken = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (int64_t)allowedContextUpdates
{
  return self->_allowedContextUpdates;
}

- (void)setAllowedContextUpdates:(int64_t)a3
{
  self->_allowedContextUpdates = a3;
}

- (NSString)bundleIdentifierPendingUpdate
{
  return self->_bundleIdentifierPendingUpdate;
}

- (void)setBundleIdentifierPendingUpdate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end