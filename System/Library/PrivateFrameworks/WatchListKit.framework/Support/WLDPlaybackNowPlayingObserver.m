@interface WLDPlaybackNowPlayingObserver
- (BOOL)_isAnyAppPlaying;
- (BOOL)_isPlayerPathPlaying:(id)a3;
- (BOOL)_isSummary:(id)a3 signifantChangeFromSummary:(id)a4;
- (BOOL)_nowPlayingAppIsPlayingForPlayerPath:(id)a3;
- (BOOL)_shouldPlayerPathBeConsidered:(id)a3;
- (WLDPlaybackNowPlayingObserver)initWithUpdateHandler:(id)a3;
- (id)_fetchActivePlayerPaths;
- (id)_getActivePlayerPaths;
- (id)_nowPlayingInfoForPlayerPath:(id)a3;
- (id)_unsupportedMediaTypes;
- (id)nowPlayingSummaries;
- (id)updateHandler;
- (void)_activePlayerPathsDidChangeNotification:(id)a3;
- (void)_fetchNowPlayingInfo:(id)a3;
- (void)_forceFetchNowPlayingInfofromActivePlayers;
- (void)_isPlayingDidChangeNotification:(id)a3;
- (void)_nowPlayingInfoDidChangeNotification:(id)a3;
- (void)_processLastSummary:(id)a3;
- (void)_setActivePlayerPaths:(id)a3;
- (void)_updateWithInfo:(id)a3 sessionID:(id)a4;
- (void)dealloc;
- (void)setUpdateHandler:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation WLDPlaybackNowPlayingObserver

- (WLDPlaybackNowPlayingObserver)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___WLDPlaybackNowPlayingObserver;
  v5 = -[WLDPlaybackNowPlayingObserver init](&v17, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = v6;

    v5->_isObserving = 0;
    dispatch_queue_t v8 = dispatch_queue_create("WLDPlaybackNowPlayingObserverQueueNotif", 0LL);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("WLDPlaybackNowPlayingObserverQueueLookup", 0LL);
    lookupQueue = v5->_lookupQueue;
    v5->_lookupQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    lastSummaryDict = v5->_lastSummaryDict;
    v5->_lastSummaryDict = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _fetchActivePlayerPaths](v5, "_fetchActivePlayerPaths"));
    activePlayerPaths = v5->_activePlayerPaths;
    v5->_activePlayerPaths = (NSArray *)v14;

    -[WLDPlaybackNowPlayingObserver startObserving](v5, "startObserving");
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WLDPlaybackNowPlayingObserver;
  -[WLDPlaybackNowPlayingObserver dealloc](&v3, "dealloc");
}

- (void)startObserving
{
  if (!self->_isObserving)
  {
    uint64_t v3 = WLKPlaybackTrackingLogObject(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - Start Playback observation",  buf,  2u);
    }

    self->_isObserving = 1;
    MRMediaRemoteRegisterForNowPlayingNotifications(self->_notificationQueue);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"_nowPlayingInfoDidChangeNotification:" name:kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification object:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"_isPlayingDidChangeNotification:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:self selector:"_activePlayerPathsDidChangeNotification:" name:kMRMediaRemoteActivePlayerPathsDidChange object:0];

    notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __47__WLDPlaybackNowPlayingObserver_startObserving__block_invoke;
    block[3] = &unk_10003D480;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }

id __47__WLDPlaybackNowPlayingObserver_startObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceFetchNowPlayingInfofromActivePlayers];
}

- (void)stopObserving
{
  if (self->_isObserving)
  {
    uint64_t v3 = WLKPlaybackTrackingLogObject(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - Stop Playback observation",  v6,  2u);
    }

    self->_isObserving = 0;
    MRMediaRemoteUnregisterForNowPlayingNotifications();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 removeObserver:self];
  }

- (id)nowPlayingSummaries
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v5 stringValue]);

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _getActivePlayerPaths](self, "_getActivePlayerPaths"));
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v9);
        lookupQueue = self->_lookupQueue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = __52__WLDPlaybackNowPlayingObserver_nowPlayingSummaries__block_invoke;
        v18[3] = &unk_10003DB00;
        v18[4] = v10;
        id v19 = v17;
        v21 = &v26;
        v12 = v6;
        v20 = v12;
        MRMediaRemoteGetNowPlayingInfoForPlayer(v10, 0LL, lookupQueue, v18);
        dispatch_time_t v13 = dispatch_time(0LL, 2000000000LL);
        dispatch_semaphore_wait(v12, v13);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }

    while (v7);
  }

  id v14 = [(id)v27[5] copy];
  _Block_object_dispose(&v26, 8);

  return v14;
}

uint64_t __52__WLDPlaybackNowPlayingObserver_nowPlayingSummaries__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

    if (v5)
    {
      id v6 = a2;
      id v7 = objc_alloc(&OBJC_CLASS___WLKPlaybackSummary);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
      uint64_t v10 = -[WLKPlaybackSummary initWithMediaRemoteDictionary:bundleID:accountID:isFromActivePlayerPath:]( v7,  "initWithMediaRemoteDictionary:bundleID:accountID:isFromActivePlayerPath:",  v6,  v9,  *(void *)(a1 + 40),  1LL);

      if (v10) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v10];
      }
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_isPlayingDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRNowPlayingPlayerPathUserInfoKey]);

  if (-[WLDPlaybackNowPlayingObserver _shouldPlayerPathBeConsidered:](self, "_shouldPlayerPathBeConsidered:", v8))
  {
    unsigned __int8 v5 = -[WLDPlaybackNowPlayingObserver _isAnyAppPlaying](self, "_isAnyAppPlaying");
    transaction = self->_transaction;
    if ((v5 & 1) == 0)
    {
      if (transaction)
      {
        id v7 = 0LL;
LABEL_8:
        self->_transaction = v7;

        goto LABEL_9;
      }

- (void)_activePlayerPathsDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _fetchActivePlayerPaths](self, "_fetchActivePlayerPaths", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _getActivePlayerPaths](self, "_getActivePlayerPaths"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v8);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)j);
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v14);
  }

  -[WLDPlaybackNowPlayingObserver _setActivePlayerPaths:](self, "_setActivePlayerPaths:", v6);
}

- (void)_nowPlayingInfoDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRNowPlayingPlayerPathUserInfoKey]);

  if (-[WLDPlaybackNowPlayingObserver _shouldPlayerPathBeConsidered:](self, "_shouldPlayerPathBeConsidered:", v5)) {
    -[WLDPlaybackNowPlayingObserver _fetchNowPlayingInfo:](self, "_fetchNowPlayingInfo:", v5);
  }
}

- (void)_fetchNowPlayingInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[WLDPlaybackNowPlayingObserver _nowPlayingInfoForPlayerPath:]( self,  "_nowPlayingInfoForPlayerPath:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v9));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v10]);
  id v12 = self;
  objc_sync_enter(v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12->_lastSummaryDict, "objectForKey:", v10));
  objc_sync_exit(v12);

  id v14 = [v11 isEquivalentToSummaryExcludingTimestamp:v13];
  if ((v14 & 1) != 0)
  {
    uint64_t v15 = WLKPlaybackTrackingLogObject(v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - -SigEval- ignoring duplicate NPI",  buf,  2u);
    }

    goto LABEL_8;
  }

  if (v11)
  {
    if (-[WLDPlaybackNowPlayingObserver _isSummary:signifantChangeFromSummary:]( v12,  "_isSummary:signifantChangeFromSummary:",  v11,  v13))
    {
      -[WLDPlaybackNowPlayingObserver _updateWithInfo:sessionID:](v12, "_updateWithInfo:sessionID:", v11, v10);
    }

- (BOOL)_isPlayerPathPlaying:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  lookupQueue = self->_lookupQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __54__WLDPlaybackNowPlayingObserver__isPlayerPathPlaying___block_invoke;
  v10[3] = &unk_10003DB28;
  id v12 = &v13;
  id v7 = v5;
  uint64_t v11 = v7;
  MRMediaRemoteGetPlaybackStateForPlayer(v4, lookupQueue, v10);
  dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_wait(v7, v8);
  LOBYTE(lookupQueue) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)lookupQueue;
}

uint64_t __54__WLDPlaybackNowPlayingObserver__isPlayerPathPlaying___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_shouldPlayerPathBeConsidered:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 origin]);
  unsigned int v5 = [v4 isLocal];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allAppBundleIdentifiers]);

    BOOL v10 = (+[WLKChannelUtilities isItunesBundleID:]( WLKChannelUtilities,  "isItunesBundleID:",  v7) & 1) != 0 || [v9 containsObject:v7];
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_getActivePlayerPaths
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activePlayerPaths;
  objc_sync_exit(v2);

  id v4 = -[NSArray copy](v3, "copy");
  return v4;
}

- (void)_setActivePlayerPaths:(id)a3
{
  id v4 = (NSArray *)a3;
  id obj = self;
  objc_sync_enter(obj);
  activePlayerPaths = obj->_activePlayerPaths;
  obj->_activePlayerPaths = v4;

  objc_sync_exit(obj);
}

- (id)_fetchActivePlayerPaths
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0LL;
  lookupQueue = self->_lookupQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke;
  v21[3] = &unk_10003DB50;
  __int128 v23 = &v24;
  unsigned int v5 = v3;
  __int128 v22 = v5;
  MRMediaRemoteGetActivePlayerPathsForOrigin(0LL, lookupQueue, v21);
  dispatch_time_t v6 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allAppBundleIdentifiers]);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v10 = (void *)v25[5];
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke_2;
  __int128 v18 = &unk_10003DB78;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  __int128 v20 = v12;
  [v10 enumerateObjectsUsingBlock:&v15];
  id v13 = -[NSMutableArray copy](v12, "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v24, 8);
  return v13;
}

uint64_t __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__WLDPlaybackNowPlayingObserver__fetchActivePlayerPaths__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  if ((+[WLKChannelUtilities isItunesBundleID:]( WLKChannelUtilities,  "isItunesBundleID:",  v4) & 1) != 0 || [*(id *)(a1 + 32) containsObject:v4])
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)_nowPlayingInfoForPlayerPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v19 = 0LL;
    __int128 v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    __int128 v22 = __Block_byref_object_copy__4;
    __int128 v23 = __Block_byref_object_dispose__4;
    uint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    lookupQueue = self->_lookupQueue;
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    id v13 = __62__WLDPlaybackNowPlayingObserver__nowPlayingInfoForPlayerPath___block_invoke;
    id v14 = &unk_10003DB00;
    uint64_t v15 = self;
    id v16 = v4;
    __int128 v18 = &v19;
    id v7 = v5;
    uint64_t v17 = v7;
    MRMediaRemoteGetNowPlayingInfoForPlayer(v16, 0LL, lookupQueue, &v11);
    dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
    dispatch_semaphore_wait(v7, v8);
    id v9 = objc_msgSend((id)v20[5], "copy", v11, v12, v13, v14, v15);

    _Block_object_dispose(&v19, 8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

void __62__WLDPlaybackNowPlayingObserver__nowPlayingInfoForPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForKey:kMRMediaRemoteNowPlayingInfoMediaType]);
  if (!v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _unsupportedMediaTypes]),
        unsigned __int8 v5 = [v4 containsObject:v3],
        v4,
        (v5 & 1) == 0))
  {
    dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_activeiTunesAccount"));
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getActivePlayerPaths]);
    id v11 = [v10 containsObject:*(void *)(a1 + 40)];

    uint64_t v12 = objc_alloc(&OBJC_CLASS___WLKPlaybackSummary);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    uint64_t v15 = -[WLKPlaybackSummary initWithMediaRemoteDictionary:bundleID:accountID:isFromActivePlayerPath:]( v12,  "initWithMediaRemoteDictionary:bundleID:accountID:isFromActivePlayerPath:",  v21,  v14,  v9,  v11);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) player]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v17, v19));

    if (v15) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v15 forKey:v20];
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_isAnyAppPlaying
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v21 = 0LL;
  __int128 v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _getActivePlayerPaths](self, "_getActivePlayerPaths"));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        lookupQueue = self->_lookupQueue;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = __49__WLDPlaybackNowPlayingObserver__isAnyAppPlaying__block_invoke;
        v14[3] = &unk_10003DB28;
        id v16 = &v21;
        BOOL v10 = v3;
        uint64_t v15 = v10;
        MRMediaRemoteGetPlaybackStateForPlayer(v8, lookupQueue, v14);
        dispatch_time_t v11 = dispatch_time(0LL, 2000000000LL);
        dispatch_semaphore_wait(v10, v11);
      }

      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v5);
  }

  BOOL v12 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  return v12;
}

uint64_t __49__WLDPlaybackNowPlayingObserver__isAnyAppPlaying__block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_nowPlayingAppIsPlayingForPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  lookupQueue = self->_lookupQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __70__WLDPlaybackNowPlayingObserver__nowPlayingAppIsPlayingForPlayerPath___block_invoke;
  v10[3] = &unk_10003DB28;
  BOOL v12 = &v13;
  id v7 = v5;
  dispatch_time_t v11 = v7;
  MRMediaRemoteGetPlaybackStateForPlayer(v4, lookupQueue, v10);
  dispatch_time_t v8 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_wait(v7, v8);
  LOBYTE(lookupQueue) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)lookupQueue;
}

uint64_t __70__WLDPlaybackNowPlayingObserver__nowPlayingAppIsPlayingForPlayerPath___block_invoke( uint64_t a1,  int a2)
{
  if (a2 == 1) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_processLastSummary:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v9));

  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_lastSummaryDict, "objectForKey:", v10));
  BOOL v12 = v11;
  if (v11 && [v11 playbackState] == (id)1)
  {
    uint64_t v13 = WLKPlaybackTrackingLogObject(1LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - _processLastSummary Generating stopped playback event",  buf,  2u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0]);
    -[WLDPlaybackNowPlayingObserver _updateWithInfo:sessionID:](v5, "_updateWithInfo:sessionID:", v15, v10);
  }

  lastSummaryDict = v5->_lastSummaryDict;
  __int128 v19 = v10;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  -[NSMutableDictionary removeObjectsForKeys:](lastSummaryDict, "removeObjectsForKeys:", v17);

  objc_sync_exit(v5);
}

- (void)_forceFetchNowPlayingInfofromActivePlayers
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackNowPlayingObserver _getActivePlayerPaths](self, "_getActivePlayerPaths"));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[WLDPlaybackNowPlayingObserver _fetchNowPlayingInfo:]( self,  "_fetchNowPlayingInfo:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (id)_unsupportedMediaTypes
{
  if (_unsupportedMediaTypes_onceToken != -1) {
    dispatch_once(&_unsupportedMediaTypes_onceToken, &__block_literal_global_11);
  }
  return (id)_unsupportedMediaTypes___unsupportedTypes;
}

void __55__WLDPlaybackNowPlayingObserver__unsupportedMediaTypes__block_invoke(id a1)
{
  v3[0] = kMRMediaRemoteMediaTypeMusic;
  v3[1] = kMRMediaRemoteMediaTypeAudioBook;
  v3[2] = kMRMediaRemoteMediaTypePodcast;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  v2 = (void *)_unsupportedMediaTypes___unsupportedTypes;
  _unsupportedMediaTypes___unsupportedTypes = v1;
}

- (void)_updateWithInfo:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_updateHandler)
  {
    notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __59__WLDPlaybackNowPlayingObserver__updateWithInfo_sessionID___block_invoke;
    block[3] = &unk_10003D7D8;
    id v10 = v6;
    __int128 v11 = self;
    id v12 = v7;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __59__WLDPlaybackNowPlayingObserver__updateWithInfo_sessionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = WLKPlaybackTrackingLogObject(a1);
  dispatch_semaphore_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - Calling update handler with summary: %@",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 56LL) + 16LL))();
}

- (BOOL)_isSummary:(id)a3 signifantChangeFromSummary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 isSameContent:v6])
  {
    LOBYTE(v29) = 1;
    uint64_t v28 = @"content changed";
    goto LABEL_19;
  }

  uint64_t v7 = (__CFString *)[v6 playbackState];
  __int128 v8 = (__CFString *)[v5 playbackState];
  if (v7 != v8
    || (__int128 v9 = (__CFString *)[v6 completionState],
        __int128 v8 = (__CFString *)[v5 completionState],
        v9 != v8)
    || (__int128 v8 = (__CFString *)[v6 playbackState], v8 != (__CFString *)1))
  {
    uint64_t v28 = @"significant change";
    goto LABEL_11;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 elapsedTime]);
  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 timestamp]);
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackRate]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
  LOBYTE(v14) = objc_opt_isKindOfClass(v17, v19);

  double v20 = 1.0;
  if ((v14 & 1) != 0)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackRate]);
    [v21 doubleValue];
    double v20 = v22;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 elapsedTime]);
  [v23 doubleValue];
  double v25 = v24 + v16 * v20;

  double v27 = vabdd_f64(v12, v25);
  if (v27 > 1.0)
  {
    __int128 v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"elapsed time drift exceeds maximum: %.5f",  *(void *)&v27));
    uint64_t v28 = v8;
LABEL_11:
    uint64_t v30 = WLKPlaybackTrackingLogObject(v8);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39[0] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - -SigEval- update %@ ->",  buf,  0xCu);
    }

    uint64_t v33 = WLKPlaybackTrackingLogObject(v32);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39[0] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - -SigEval- %@",  buf,  0xCu);
    }

    BOOL v29 = 1;
    goto LABEL_16;
  }

  BOOL v29 = 0;
  uint64_t v28 = @"nominal elapsed time update";
LABEL_16:
  uint64_t v35 = WLKPlaybackTrackingLogObject(v26);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v39[0]) = v29;
    WORD2(v39[0]) = 2112;
    *(void *)((char *)v39 + 6) = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - -SigEval- [%d] reason: %@",  buf,  0x12u);
  }

LABEL_19:
  return v29;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end