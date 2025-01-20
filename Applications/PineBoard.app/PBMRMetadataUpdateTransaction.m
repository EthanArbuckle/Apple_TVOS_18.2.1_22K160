@interface PBMRMetadataUpdateTransaction
- (BOOL)_canBeInterrupted;
- (BSWatchdog)watchdog;
- (MRPlayerPath)nowPlayingPlayerPath;
- (NSDictionary)nowPlayingInfo;
- (PBMRMetadataUpdateTransaction)initWithRequest:(void *)a3 playerPath:(void *)a4;
- (id)queue;
- (unsigned)playbackState;
- (void)_begin;
- (void)_didComplete;
- (void)_queue_handlePlaybackQueueResponse:(void *)a3 error:(id)a4;
- (void)dealloc;
- (void)playerPath;
- (void)request;
@end

@implementation PBMRMetadataUpdateTransaction

- (PBMRMetadataUpdateTransaction)initWithRequest:(void *)a3 playerPath:(void *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBMRMetadataUpdateTransaction;
  v6 = -[PBMRMetadataUpdateTransaction init](&v12, "init");
  if (v6)
  {
    v6->_request = (void *)CFRetain(a3);
    v6->_playerPath = (void *)CFRetain(a4);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.PineBoard.MediaRemote.MetadataUpdate", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v6->_playbackState = 0;
    objc_storeStrong((id *)&v6->_nowPlayingPlayerPath, a4);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMRMetadataUpdateTransaction;
  -[PBMRMetadataUpdateTransaction dealloc](&v3, "dealloc");
}

- (void)_queue_handlePlaybackQueueResponse:(void *)a3 error:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = sub_100083474();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100272BA8();
    }
  }

  if (a3 && MRPlaybackQueueGetContentItemAtOffset(a3, 0LL))
  {
    dispatch_queue_t v9 = (NSDictionary *)MRContentItemCopyNowPlayingInfo();
    nowPlayingInfo = self->_nowPlayingInfo;
    self->_nowPlayingInfo = v9;
  }
}

- (id)queue
{
  return self->_queue;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PBMRMetadataUpdateTransaction;
  -[PBMRMetadataUpdateTransaction _begin](&v26, "_begin");
  objc_initWeak(&location, self);
  objc_super v3 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](self, "queue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000322A8;
  v23[3] = &unk_1003D1228;
  objc_copyWeak(&v24, &location);
  v5 = -[BSWatchdog initWithTimeout:queue:completion:](v3, "initWithTimeout:queue:completion:", v4, v23, 2.0);
  watchdog = self->_watchdog;
  self->_watchdog = v5;

  -[PBMRMetadataUpdateTransaction addMilestone:](self, "addMilestone:", @"PBMRNowPlayingInfoResponseMilestone");
  request = self->_request;
  playerPath = self->_playerPath;
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](self, "queue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100032328;
  v21[3] = &unk_1003D1578;
  objc_copyWeak(&v22, &location);
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(request, playerPath, v9, v21);

  -[PBMRMetadataUpdateTransaction addMilestone:](self, "addMilestone:", @"PBMRGetPlaybackStateMilestone");
  v10 = self->_playerPath;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](self, "queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000323C8;
  v19[3] = &unk_1003D15A0;
  objc_copyWeak(&v20, &location);
  MRMediaRemoteGetPlaybackStateForPlayer(v10, v11, v19);

  -[PBMRMetadataUpdateTransaction addMilestone:](self, "addMilestone:", @"PBMRResolvePlayerPathMilestone");
  objc_super v12 = self->_playerPath;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBMRMetadataUpdateTransaction queue](self, "queue"));
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_100032454;
  v17 = &unk_1003D1578;
  objc_copyWeak(&v18, &location);
  MRMediaRemoteNowPlayingResolvePlayerPath(v12, v13, &v14);

  -[BSWatchdog start](self->_watchdog, "start", v14, v15, v16, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMRMetadataUpdateTransaction;
  -[PBMRMetadataUpdateTransaction _didComplete](&v3, "_didComplete");
  -[BSWatchdog invalidate](self->_watchdog, "invalidate");
}

- (NSDictionary)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (MRPlayerPath)nowPlayingPlayerPath
{
  return self->_nowPlayingPlayerPath;
}

- (void)request
{
  return self->_request;
}

- (void)playerPath
{
  return self->_playerPath;
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
}

@end