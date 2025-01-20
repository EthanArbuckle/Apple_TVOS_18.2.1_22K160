@interface ICDPlaybackPositionSyncCoordinator
- (ICDPlaybackPositionSyncCoordinator)initWithOperationQueue:(id)a3;
- (void)_onQueue_addSyncBlockWithIdentifier:(id)a3 block:(id)a4;
- (void)_onQueue_flushSyncBlocks;
- (void)_onQueue_scheduleBlockWithIdentifier:(id)a3 isCheckpoint:(BOOL)a4 block:(id)a5;
- (void)scheduleSyncForContext:(id)a3 isCheckpoint:(BOOL)a4;
@end

@implementation ICDPlaybackPositionSyncCoordinator

- (ICDPlaybackPositionSyncCoordinator)initWithOperationQueue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionSyncCoordinator;
  v6 = -[ICDPlaybackPositionSyncCoordinator init](&v16, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloudd.ICDPlaybackPositionSyncCoordinator.serialQueue", 0LL);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingSyncBlocks = v6->_pendingSyncBlocks;
    v6->_pendingSyncBlocks = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    inFlightSyncIDs = v6->_inFlightSyncIDs;
    v6->_inFlightSyncIDs = (NSMutableSet *)v11;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_operationQueue, a3);
    }

    else
    {
      v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      operationQueue = v6->_operationQueue;
      v6->_operationQueue = v13;

      -[NSOperationQueue setName:]( v6->_operationQueue,  "setName:",  @"com.apple.itunescloudd.ICDPlaybackPositionSyncCoordinator.operationQueue");
      -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    }
  }

  return v6;
}

- (void)scheduleSyncForContext:(id)a3 isCheckpoint:(BOOL)a4
{
  id v6 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004A30;
  block[3] = &unk_1001A3358;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_onQueue_addSyncBlockWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingSyncBlocks,  "objectForKeyedSubscript:",  v6));

  uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v11 = 138543618;
      BOOL v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Sync already pending with identifier %{public}@.",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    if (v10)
    {
      int v11 = 138543618;
      BOOL v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Adding pending sync block for identifier %{public}@.",  (uint8_t *)&v11,  0x16u);
    }

    uint64_t v9 = (os_log_s *)objc_retainBlock(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingSyncBlocks,  "setObject:forKeyedSubscript:",  v9,  v6);
  }
}

- (void)_onQueue_flushSyncBlocks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_pendingSyncBlocks, "allValues"));
  -[NSMutableDictionary removeAllObjects](self->_pendingSyncBlocks, "removeAllObjects");
  v4 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Flushing sync blocks", buf, 0xCu);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)_onQueue_scheduleBlockWithIdentifier:(id)a3 isCheckpoint:(BOOL)a4 block:(id)a5
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2(serialQueue);
  -[ICDPlaybackPositionSyncCoordinator _onQueue_addSyncBlockWithIdentifier:block:]( self,  "_onQueue_addSyncBlockWithIdentifier:block:",  v10,  v9);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000049E0;
  v20[3] = &unk_1001A6B90;
  v20[4] = self;
  __int128 v11 = objc_retainBlock(v20);
  if (a4)
  {
    syncTimerSource = self->_syncTimerSource;
    __int128 v13 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (syncTimerSource)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = 0x4024000000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ New checkpoint sync request. Delaying sync by %f seconds",  buf,  0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)self->_syncTimerSource);
      __int128 v13 = self->_syncTimerSource;
      self->_syncTimerSource = 0LL;
    }

    else if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = 0x4024000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Scheduling sync %f seconds from now...",  buf,  0x16u);
    }

    objc_super v16 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_serialQueue);
    v17 = self->_syncTimerSource;
    self->_syncTimerSource = v16;

    v18 = self->_syncTimerSource;
    dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_syncTimerSource, v11);
    dispatch_resume((dispatch_object_t)self->_syncTimerSource);
  }

  else
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing sync NOW.", buf, 0xCu);
    }

    ((void (*)(void *))v11[2])(v11);
  }
}

- (void).cxx_destruct
{
}

@end