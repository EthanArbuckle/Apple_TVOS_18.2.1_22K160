@interface MRDNowPlayingClient
- (BOOL)_onQueue_anyPlayerIsPlaying;
- (BOOL)anyPlayerIsPlaying;
- (BOOL)canBeNowPlaying;
- (BOOL)canBeNowPlayingForPlayerClient:(id)a3;
- (BOOL)hasNowPlayingData;
- (BOOL)isForegrounded;
- (BOOL)perPlayerCanBeNowPlaying;
- (BOOL)supportsBackgroundAudio;
- (MRClient)client;
- (MRClient)pushStateClient;
- (MRDNowPlayingClient)initWithPlayerPath:(id)a3;
- (MRDNowPlayingClientDelegate)delegate;
- (MRDNowPlayingPlayerClient)activePlayerClient;
- (MRDNowPlayingPlayerClient)nowPlayingPlayerClient;
- (MRDNowPlayingPlayerClient)pushStateActivePlayerClient;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)playerPath;
- (NSArray)playerClients;
- (NSDate)canBeNowPlayingTimestamp;
- (id)_onQueue_activePlayerClient;
- (id)_onQueue_addPlayer:(id)a3;
- (id)_onQueue_existingPlayerClientForPlayer:(id)a3;
- (id)_onQueue_playerClientForPlayer:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)existingPlayerClientForPlayer:(id)a3;
- (id)existingPlayerClientForPlayerPath:(id)a3;
- (id)notificationPlayerPathFromPlayer:(id)a3;
- (id)playerClientForPlayer:(id)a3;
- (void)_onQueue_initializeDisplayName;
- (void)_onQueue_popState;
- (void)_onQueue_pushState;
- (void)_onQueue_removePlayerClientForPlayer:(id)a3;
- (void)_onQueue_setActivePlayerClient:(id)a3;
- (void)_reevaluateCanBeNowPlaying;
- (void)dealloc;
- (void)handleCanBeNowPlayingPlayerDidChange:(id)a3;
- (void)initializeBundleIdentifier;
- (void)initializeDisplayName;
- (void)removePlayerClientForPlayer:(id)a3;
- (void)setActivePlayerClient:(id)a3;
- (void)setCanBeNowPlaying:(BOOL)a3;
- (void)setCanBeNowPlayingTimestamp:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsForegrounded:(BOOL)a3;
- (void)setNowPlayingPlayerClient:(id)a3;
- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3;
- (void)setPushStateActivePlayerClient:(id)a3;
- (void)setPushStateClient:(id)a3;
- (void)setSupportsBackgroundAudio:(BOOL)a3;
- (void)updateClient:(id)a3;
@end

@implementation MRDNowPlayingClient

- (MRDNowPlayingClient)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MRDNowPlayingClient;
  v5 = -[MRDNowPlayingClient init](&v29, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingClient", v9);
    v11 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v10;

    *(_WORD *)(v5 + 27) = 257;
    v12 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v5 + 4) origin]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v5 + 4) client]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    if ([v12 isLocallyHosted] && !objc_msgSend(v13, "processIdentifier"))
    {
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
      uint64_t v16 = *((void *)v5 + 1);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000DD90C;
      v25[3] = &unk_10039FE78;
      v26 = v5;
      id v27 = v13;
      v17 = v15;
      v28 = v17;
      MRProcessIDForApplication(v14, v16, v25);
      dispatch_time_t v18 = dispatch_time(0LL, 5000000000LL);
      if (!dispatch_semaphore_wait(v17, v18))
      {
        uint64_t v20 = _MRLogForCategory(1LL, v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] Timeout trying to pid for %{public}@",  buf,  0xCu);
        }
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v5 selector:"handleCanBeNowPlayingPlayerDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying object:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v5 selector:"handleCanBeNowPlayingPlayerDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying object:0];

    [v5 initializeBundleIdentifier];
  }

  return (MRDNowPlayingClient *)v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___MRDNowPlayingClient;
  -[MRDNowPlayingClient dealloc](&v2, "dealloc");
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p playerPath=%@ playerClients=%@>",  v5,  self,  self->_playerPath,  self->_playerClients));

  return v6;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient playerPath](self, "playerPath"));
  uint64_t v5 = MRCreateIndentedDebugDescriptionFromObject(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](self, "client"));
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[MRDNowPlayingClient perPlayerCanBeNowPlaying](self, "perPlayerCanBeNowPlaying")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject(v7);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (self->_canBeNowPlaying) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromObject(v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromObject(self->_canBeNowPlayingTimestamp);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (self->_effectiveCanBeNowPlaying) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  uint64_t v14 = MRCreateIndentedDebugDescriptionFromObject(v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (-[MRDNowPlayingClient anyPlayerIsPlaying](self, "anyPlayerIsPlaying")) {
    dispatch_semaphore_t v15 = @"YES";
  }
  else {
    dispatch_semaphore_t v15 = @"NO";
  }
  uint64_t v16 = MRCreateIndentedDebugDescriptionFromObject(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (-[MRDNowPlayingClient hasNowPlayingData](self, "hasNowPlayingData")) {
    dispatch_time_t v18 = @"YES";
  }
  else {
    dispatch_time_t v18 = @"NO";
  }
  uint64_t v19 = MRCreateIndentedDebugDescriptionFromObject(v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (-[MRDNowPlayingClient isForegrounded](self, "isForegrounded")) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  uint64_t v21 = MRCreateIndentedDebugDescriptionFromObject(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (-[MRDNowPlayingClient supportsBackgroundAudio](self, "supportsBackgroundAudio")) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  uint64_t v24 = MRCreateIndentedDebugDescriptionFromObject(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient activePlayerClient](self, "activePlayerClient"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v35 playerPath]);
  uint64_t v27 = MRCreateIndentedDebugDescriptionFromObject(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  playerClients = self->_playerClients;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000DDD40;
  v45[3] = &unk_10039FEA0;
  v45[4] = self;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](playerClients, "sortedArrayUsingComparator:", v45));
  uint64_t v31 = MRCreateIndentedDebugDescriptionFromObject(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p {\n    player path = %@\n    client = %@\n    perPlayerCanBeNowPlaying = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimestamp = %@\n    effectiveCanBeNowPlaying = %@\n    any player is playing = %@\n    has now playing data = %@\n    foregrounded = %@\n    supportsBackgroundAudio = %@\n    active player client = %@\n    player clients = %@\n}",  v39,  self,  v44,  v38,  v43,  v37,  v12,  v36,  v17,  v34,  v22,  v25,  v28,  v32));

  return v40;
}

- (NSArray)playerClients
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DDF00;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)initializeBundleIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  id v4 = [v3 processIdentifier];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](self->_playerPath, "origin"));
  unsigned int v6 = [v5 isLocallyHosted];

  if (v6)
  {
    v7 = sub_10013D19C((uint64_t)v4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
    [v9 setBundleIdentifier:v8];

    id v10 = sub_10013D554((int)v4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
    [v11 setProcessUserIdentifier:v10];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 parentApplicationBundleIdentifier]);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
  }

  uint64_t v18 = _MRLogForCategory(1LL, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    playerPath = self->_playerPath;
    int v22 = 138543874;
    v23 = playerPath;
    __int16 v24 = 2114;
    v25 = @"effectiveBundleIdentifier";
    __int16 v26 = 2112;
    id v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v22,  0x20u);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](self->_playerPath, "origin"));
  [v21 isLocallyHosted];
}

- (void)_onQueue_initializeDisplayName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
  if (v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](self->_playerPath, "origin"));
    unsigned int v6 = [v5 isLocallyHosted];

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 parentApplicationBundleIdentifier]);
      uint64_t v8 = (void *)v7;
      if (!v7 || (v9 = sub_10013D3F4(v7), (id v11 = (void *)objc_claimAutoreleasedReturnValue(v9)) == 0LL))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
        id v13 = sub_10013D3F4((uint64_t)v12);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      }

      uint64_t v14 = _MRLogForCategory(1LL, v10);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v17 = 138543874;
        uint64_t v18 = playerPath;
        __int16 v19 = 2114;
        uint64_t v20 = @"displayName";
        __int16 v21 = 2112;
        int v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v17,  0x20u);
      }

      [v3 setDisplayName:v11];
    }
  }
}

- (void)initializeDisplayName
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DE2E8;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (MRPlayerPath)playerPath
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DE3E4;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

- (MRPlayerPath)activePlayerPath
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DE4E8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

- (void)setClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DE5E8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)updateClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DE698;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (MRClient)client
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DE7AC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRClient *)v3;
}

- (void)setActivePlayerClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DE87C;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_onQueue_setActivePlayerClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MRDNowPlayingClient _onQueue_pushState](self, "_onQueue_pushState");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](self->_nowPlayingPlayerClient, "playerPath"));

  uint64_t v7 = _MRLogForCategory(1LL, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      playerPath = self->_playerPath;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](self->_nowPlayingPlayerClient, "playerPath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
      int v14 = 138544130;
      id v15 = playerPath;
      __int16 v16 = 2114;
      int v17 = @"activePlayerClient";
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  (uint8_t *)&v14,  0x2Au);

LABEL_6:
    }
  }

  else if (v9)
  {
    id v13 = self->_playerPath;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
    int v14 = 138543874;
    id v15 = v13;
    __int16 v16 = 2114;
    int v17 = @"activePlayerClient";
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v14,  0x20u);
    goto LABEL_6;
  }

  -[MRDNowPlayingClient setNowPlayingPlayerClient:](self, "setNowPlayingPlayerClient:", v4);
  -[MRDNowPlayingClient _onQueue_popState](self, "_onQueue_popState");
}

- (MRDNowPlayingPlayerClient)activePlayerClient
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DEB14;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDNowPlayingPlayerClient *)v3;
}

- (id)_onQueue_activePlayerClient
{
  return self->_nowPlayingPlayerClient;
}

- (void)_reevaluateCanBeNowPlaying
{
  serialQueue = self->_serialQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000DEBCC;
  v3[3] = &unk_100399250;
  v3[4] = self;
  msv_dispatch_sync_on_queue(serialQueue, v3);
}

- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DEE9C;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (void)setCanBeNowPlaying:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DEF0C;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (BOOL)canBeNowPlaying
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DEFC8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)canBeNowPlayingTimestamp
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  char v9 = sub_1000DDEE8;
  uint64_t v10 = sub_1000DDEF8;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DF0A8;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (BOOL)anyPlayerIsPlaying
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DF1B8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_onQueue_anyPlayerIsPlaying
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  char v3 = self->_playerClients;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)i), "isPlaying", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)canBeNowPlayingForPlayerClient:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingClient perPlayerCanBeNowPlaying](self, "perPlayerCanBeNowPlaying")
    || !-[MRDNowPlayingClient canBeNowPlaying](self, "canBeNowPlaying"))
  {
    unsigned __int8 v5 = [v4 canBeNowPlayingPlayer];
  }

  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setIsForegrounded:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DF3A0;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (id)playerClientForPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000DDEE8;
  __int16 v16 = sub_1000DDEF8;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000DF4FC;
  v9[3] = &unk_100399CB8;
  __int128 v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_onQueue_playerClientForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4
    || (id v4 = (id)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"))) != 0LL)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( -[MRDNowPlayingClient _onQueue_existingPlayerClientForPlayer:]( self,  "_onQueue_existingPlayerClientForPlayer:",  v4));
    if (v5)
    {
      id v6 = (void *)v5;
    }

    else
    {
      id v7 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](self->_playerPath, "origin"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
      id v10 = -[MRPlayerPath initWithOrigin:client:player:](v7, "initWithOrigin:client:player:", v8, v9, v4);

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient _onQueue_addPlayer:](self, "_onQueue_addPlayer:", v10));
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_onQueue_addPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  [v4 setClient:v5];

  uint64_t v7 = _MRLogForCategory(1LL, v6);
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] Creating playerClient for %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  __int128 v9 = -[MRDNowPlayingPlayerClient initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingPlayerClient),  "initWithPlayerPath:",  v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingServer]);
  -[MRDNowPlayingPlayerClient setDelegate:](v9, "setDelegate:", v11);

  playerClients = self->_playerClients;
  if (!playerClients)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v14 = self->_playerClients;
    self->_playerClients = v13;

    playerClients = self->_playerClients;
  }

  -[NSMutableArray addObject:](playerClients, "addObject:", v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingClient:self playerDidRegister:v9];

  if (-[NSMutableArray count](self->_playerClients, "count") == (id)1) {
    -[MRDNowPlayingClient _onQueue_setActivePlayerClient:](self, "_onQueue_setActivePlayerClient:", v9);
  }

  return v9;
}

- (id)existingPlayerClientForPlayerPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 player]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient existingPlayerClientForPlayer:](self, "existingPlayerClientForPlayer:", v4));

  return v5;
}

- (id)existingPlayerClientForPlayer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000DDEE8;
  __int16 v16 = sub_1000DDEF8;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000DF8F8;
  v9[3] = &unk_100399CB8;
  __int128 v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_onQueue_existingPlayerClientForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_playerClients;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        __int128 v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player", (void)v12));
        if ([v10 isEqual:v4])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)removePlayerClientForPlayer:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DFAE8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_onQueue_removePlayerClientForPlayer:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingClient _onQueue_existingPlayerClientForPlayer:]( self,  "_onQueue_existingPlayerClientForPlayer:",  v5));

  if (v7)
  {
    -[MRDNowPlayingClient _onQueue_pushState](self, "_onQueue_pushState");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained nowPlayingClient:self playerDidUnregister:v7];

    -[NSMutableArray removeObject:](self->_playerClients, "removeObject:", v7);
    -[MRDNowPlayingClient _onQueue_popState](self, "_onQueue_popState");
  }
}

- (BOOL)hasNowPlayingData
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DFC38;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)notificationPlayerPathFromPlayer:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  [v4 setClient:v5];

  if (!v4) {
    id v4 = -[MRPlayerPath copy](self->_playerPath, "copy");
  }
  return v4;
}

- (void)_onQueue_pushState
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  id v4 = [v3 copy];
  -[MRDNowPlayingClient setPushStateClient:](self, "setPushStateClient:", v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient _onQueue_activePlayerClient](self, "_onQueue_activePlayerClient"));
  -[MRDNowPlayingClient setPushStateActivePlayerClient:](self, "setPushStateActivePlayerClient:", v5);
}

- (void)_onQueue_popState
{
  id v4 = (MRDNowPlayingPlayerClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingClient _onQueue_activePlayerClient]( self,  "_onQueue_activePlayerClient"));
  if (self->_pushStateActivePlayerClient != v4)
  {
    uint64_t v5 = _MRLogForCategory(1LL, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](self->_pushStateActivePlayerClient, "playerPath"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 player]);
      char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClient playerPath](v4, "playerPath"));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 player]);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v88 = (uint64_t)v9;
      __int16 v89 = 2114;
      v90 = v12;
      __int16 v91 = 2114;
      v92 = playerPath;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] ActiveNowPlayingPlayer changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained nowPlayingClient:self activePlayerDidChangeFromPlayerClient:self->_pushStateActivePlayerClient toPlayerClient:v4];
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 displayName]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MRClient displayName](self->_pushStateClient, "displayName"));
  v81 = v4;
  v79 = (void *)v17;
  if (v16 && (uint64_t v18 = v17, ([v16 isEqualToString:v17] & 1) == 0))
  {
    uint64_t v21 = _MRLogForCategory(1LL, v19);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v88 = v18;
      __int16 v89 = 2114;
      v90 = v16;
      __int16 v91 = 2114;
      v92 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] DisplayName changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
    }

    -[MRDNowPlayingClient _onQueue_initializeDisplayName](self, "_onQueue_initializeDisplayName");
    int v20 = 1;
  }

  else
  {
    int v20 = 0;
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v15 parentApplicationBundleIdentifier]);
  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MRClient parentApplicationBundleIdentifier](self->_pushStateClient, "parentApplicationBundleIdentifier"));
  if (v24 && ([v24 isEqualToString:v25] & 1) == 0)
  {
    uint64_t v27 = _MRLogForCategory(1LL, v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v29 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      uint64_t v88 = v25;
      __int16 v89 = 2114;
      v90 = v24;
      __int16 v91 = 2114;
      v92 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] ParentAppBundleIdentifier changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
    }

    -[MRDNowPlayingClient initializeBundleIdentifier](self, "initializeBundleIdentifier");
    -[MRDNowPlayingClient _onQueue_initializeDisplayName](self, "_onQueue_initializeDisplayName");
    int v20 = 1;
  }

  v78 = (void *)v25;
  v30 = (void *)MRNowPlayingClientCopyBundleIdentifierExtendedHierarchy(v15);
  uint64_t v31 = v30;
  v80 = v16;
  if (v30 && [v30 count])
  {
    v32 = (void *)MRNowPlayingClientCopyBundleIdentifierExtendedHierarchy(self->_pushStateClient);
    unsigned int v34 = [v31 isEqualToArray:v32];
    if ((v34 & 1) == 0)
    {
      uint64_t v35 = _MRLogForCategory(1LL, v33);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_playerPath;
        *(_DWORD *)buf = 138543874;
        uint64_t v88 = (uint64_t)v32;
        __int16 v89 = 2114;
        v90 = v31;
        __int16 v91 = 2114;
        v92 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] BundleIdentifierHierarchy changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
      }

      int v20 = 1;
    }

    int v77 = v34 ^ 1;
  }

  else
  {
    int v77 = 0;
  }

  id v38 = [v15 visibility];
  if (v38)
  {
    id v39 = v38;
    if (-[MRClient visibility](self->_pushStateClient, "visibility") != v38)
    {
      uint64_t v40 = ((uint64_t (*)(void))NSStringFromMRClientVisibility)();
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      uint64_t v42 = NSStringFromMRClientVisibility(v39);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      uint64_t v45 = _MRLogForCategory(1LL, v44);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_playerPath;
        *(_DWORD *)buf = 138543874;
        uint64_t v88 = (uint64_t)v41;
        __int16 v89 = 2114;
        v90 = v43;
        __int16 v91 = 2114;
        v92 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] Visibility changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
      }

      int v20 = 1;
    }
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue([v15 tintColor]);
  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MRClient tintColor](self->_pushStateClient, "tintColor"));
    if (([v49 isEqual:v48] & 1) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 description]);
      v51 = (void *)objc_claimAutoreleasedReturnValue([v48 description]);
      uint64_t v53 = _MRLogForCategory(1LL, v52);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = self->_playerPath;
        *(_DWORD *)buf = 138543874;
        uint64_t v88 = (uint64_t)v50;
        __int16 v89 = 2114;
        v90 = v51;
        __int16 v91 = 2114;
        v92 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] TintColor changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
      }

      int v20 = 1;
    }
  }

  id v56 = (id)objc_claimAutoreleasedReturnValue([v15 appIcon]);
  id v57 = (id)objc_claimAutoreleasedReturnValue(-[MRClient appIcon](self->_pushStateClient, "appIcon"));
  if (v56 == v57)
  {

LABEL_41:
    if (!v20) {
      goto LABEL_51;
    }
    goto LABEL_42;
  }

  v58 = v57;
  unsigned __int8 v59 = [v56 isEqual:v57];

  if ((v59 & 1) != 0) {
    goto LABEL_41;
  }
  uint64_t v61 = _MRLogForCategory(1LL, v60);
  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MRClient appIcon](self->_pushStateClient, "appIcon"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 absoluteString]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v15 appIcon]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 absoluteString]);
    v67 = self->_playerPath;
    *(_DWORD *)buf = 138543874;
    uint64_t v88 = (uint64_t)v64;
    __int16 v89 = 2114;
    v90 = v66;
    __int16 v91 = 2114;
    v92 = v67;
    _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingClient] AppIcon changed from %{public}@ to %{public}@ for %{public}@",  buf,  0x20u);
  }

LABEL_42:
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v68 = self->_playerClients;
  id v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v82,  v86,  16LL);
  if (v69)
  {
    id v70 = v69;
    uint64_t v71 = *(void *)v83;
    do
    {
      v72 = 0LL;
      do
      {
        if (*(void *)v83 != v71) {
          objc_enumerationMutation(v68);
        }
        [*(id *)(*((void *)&v82 + 1) + 8 * (void)v72) updateClient:v15];
        v72 = (char *)v72 + 1;
      }

      while (v70 != v72);
      id v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v82,  v86,  16LL);
    }

    while (v70);
  }

  id v73 = objc_loadWeakRetained((id *)&self->_delegate);
  id v74 = [v15 copy];
  [v73 nowPlayingClient:self clientStateDidChange:v74];

  if (v77)
  {
    id v75 = objc_loadWeakRetained((id *)&self->_delegate);
    [v75 nowPlayingClient:self activePlayerDidChangeFromPlayerClient:v81 toPlayerClient:v81];
  }

- (void)handleCanBeNowPlayingPlayerDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v13 origin]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient playerPath](self, "playerPath"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  if ([v6 isEqual:v8])
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v13 client]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient playerPath](self, "playerPath"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
    unsigned int v12 = [v9 isEqual:v11];

    if (v12) {
      -[MRDNowPlayingClient _reevaluateCanBeNowPlaying](self, "_reevaluateCanBeNowPlaying");
    }
  }

  else
  {
  }
}

- (BOOL)perPlayerCanBeNowPlaying
{
  return self->_perPlayerCanBeNowPlaying;
}

- (void)setCanBeNowPlayingTimestamp:(id)a3
{
}

- (BOOL)isForegrounded
{
  return self->_isForegrounded;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (void)setSupportsBackgroundAudio:(BOOL)a3
{
  self->_supportsBackgroundAudio = a3;
}

- (MRDNowPlayingClientDelegate)delegate
{
  return (MRDNowPlayingClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDNowPlayingPlayerClient)nowPlayingPlayerClient
{
  return self->_nowPlayingPlayerClient;
}

- (void)setNowPlayingPlayerClient:(id)a3
{
}

- (MRDNowPlayingPlayerClient)pushStateActivePlayerClient
{
  return self->_pushStateActivePlayerClient;
}

- (void)setPushStateActivePlayerClient:(id)a3
{
}

- (MRClient)pushStateClient
{
  return self->_pushStateClient;
}

- (void)setPushStateClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end