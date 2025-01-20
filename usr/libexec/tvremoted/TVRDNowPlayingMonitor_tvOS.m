@interface TVRDNowPlayingMonitor_tvOS
- (MRLanguageOption)currentCaptionsTrack;
- (MRLanguageOption)preferredCaptionTrack;
- (MRLanguageOption)preferredOnlyForcedCaptionTrack;
- (MRNowPlayingController)nowPlayingController;
- (NSObject)playbackNotificationToken;
- (TVRCNowPlayingInfo)currentNowPlayingInfo;
- (TVRDNowPlayingMonitor_tvOS)initWithUpdateHandler:(id)a3;
- (_TVRDNowPlayingInfoState)state;
- (id)updateHandler;
- (void)_invokeUpdateHandlerWithNowPlayingInfo:(id)a3;
- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 didUpdateResponse:(id)a4;
- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)dealloc;
- (void)setNowPlayingController:(id)a3;
- (void)setPlaybackNotificationToken:(id)a3;
- (void)setState:(id)a3;
- (void)updateTimedMetadata:(id)a3;
@end

@implementation TVRDNowPlayingMonitor_tvOS

- (TVRDNowPlayingMonitor_tvOS)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVRDNowPlayingMonitor_tvOS;
  v5 = -[TVRDNowPlayingMonitor_tvOS init](&v28, "init");
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___MRNowPlayingControllerConfiguration);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDestination localDestination](&OBJC_CLASS___MRDestination, "localDestination"));
    id v8 = [v6 initWithDestination:v7];

    [v8 setWantsChangeCallbacksDuringInitialLoad:1];
    [v8 setRequestPlaybackQueue:1];
    [v8 setRequestClientProperties:1];
    [v8 setRequestPlaybackState:1];
    v9 = -[MRNowPlayingController initWithConfiguration:]( objc_alloc(&OBJC_CLASS___MRNowPlayingController),  "initWithConfiguration:",  v8);
    -[MRNowPlayingController setDelegate:](v9, "setDelegate:", v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke;
    block[3] = &unk_100020BA0;
    v10 = v9;
    v27 = v10;
    dispatch_async(&_dispatch_main_q, block);
    id v11 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = v11;

    objc_initWeak(&location, v5);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_2;
    v23[3] = &unk_100020BC8;
    objc_copyWeak(&v24, &location);
    v13 = objc_retainBlock(v23);
    v14 = -[_TVRDNowPlayingInfoState initWithHandler:]( objc_alloc(&OBJC_CLASS____TVRDNowPlayingInfoState),  "initWithHandler:",  v13);
    state = v5->_state;
    v5->_state = v14;

    objc_storeStrong((id *)&v5->_nowPlayingController, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    uint64_t v17 = WLKDidReportPlaybackDistributedNotification;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_3;
    v21[3] = &unk_100020C18;
    objc_copyWeak(&v22, &location);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 addObserverForName:v17 object:0 queue:0 usingBlock:v21]);
    playbackNotificationToken = v5->_playbackNotificationToken;
    v5->_playbackNotificationToken = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS playbackNotificationToken](self, "playbackNotificationToken"));
  [v3 removeObserver:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 timedMetadata]);
  objc_msgSend(v6, "tvrd_removeForRestoration");

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVRDNowPlayingMonitor_tvOS;
  -[TVRDNowPlayingMonitor_tvOS dealloc](&v7, "dealloc");
}

- (TVRCNowPlayingInfo)currentNowPlayingInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingInfoForCurrentState]);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
    [v5 triggerUpdateForCaptionMetadata];
  }

  return (TVRCNowPlayingInfo *)v4;
}

- (MRLanguageOption)currentCaptionsTrack
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentCaptionTrack]);

  return (MRLanguageOption *)v3;
}

- (MRLanguageOption)preferredCaptionTrack
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredCaptionTrack]);

  return (MRLanguageOption *)v3;
}

- (MRLanguageOption)preferredOnlyForcedCaptionTrack
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredOnlyForcedCaptionTrack]);

  return (MRLanguageOption *)v3;
}

- (void)updateTimedMetadata:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __50__TVRDNowPlayingMonitor_tvOS_updateTimedMetadata___block_invoke;
  v4[3] = &unk_100020C40;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v5 = a4;
  id v6 = _TVRDNPLog();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "controllerDidLoadResponse fired for %{public}@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackQueue]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentItems]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __57__TVRDNowPlayingMonitor_tvOS_controller_didLoadResponse___block_invoke;
    v11[3] = &unk_100020C40;
    v11[4] = self;
    id v12 = v10;
    dispatch_async(&_dispatch_main_q, v11);
  }
}

- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5
{
  id v8 = _TVRDNPLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)&double v10 = a4;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
    *(float *)&double v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12));
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "controllerPlaybackRateDidChangeFrom %@ -> %@",  buf,  0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __70__TVRDNowPlayingMonitor_tvOS_controller_playbackRateDidChangeFrom_to___block_invoke;
  v14[3] = &unk_100020C68;
  v14[4] = self;
  float v15 = a5;
  dispatch_async(&_dispatch_main_q, v14);
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __61__TVRDNowPlayingMonitor_tvOS_controller_playerPathDidChange___block_invoke;
  v5[3] = &unk_100020C40;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)controller:(id)a3 didUpdateResponse:(id)a4
{
  id v5 = a4;
  id v6 = _TVRDNPLog();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "controllerDidUpdateResponse fired for %{public}@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackQueue]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentItems]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __59__TVRDNowPlayingMonitor_tvOS_controller_didUpdateResponse___block_invoke;
  v12[3] = &unk_100020C40;
  id v13 = v10;
  id v14 = self;
  id v11 = v10;
  dispatch_async(&_dispatch_main_q, v12);
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = _TVRDNPLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "controllerPlaybackStateDidChangeFrom %@ -> %@",  buf,  0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __71__TVRDNowPlayingMonitor_tvOS_controller_playbackStateDidChangeFrom_to___block_invoke;
  v12[3] = &unk_100020C90;
  void v12[4] = self;
  int v13 = v6;
  int v14 = v5;
  dispatch_async(&_dispatch_main_q, v12);
}

- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  id v6 = _TVRDNPLog();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    double v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "contentItemsDidUpdateWithContentItemChanges fired with content item %{public}@",  buf,  0xCu);
  }

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __85__TVRDNowPlayingMonitor_tvOS_controller_contentItemsDidUpdateWithContentItemChanges___block_invoke;
    v8[3] = &unk_100020C40;
    id v9 = v5;
    double v10 = self;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)_invokeUpdateHandlerWithNowPlayingInfo:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS updateHandler](self, "updateHandler"));

  if (v4)
  {
    uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TVRDNowPlayingMonitor_tvOS updateHandler](self, "updateHandler"));
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (MRNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (_TVRDNowPlayingInfoState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSObject)playbackNotificationToken
{
  return self->_playbackNotificationToken;
}

- (void)setPlaybackNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end