@interface TVHVideoPlaybackContext
+ (BOOL)automaticallyNotifiesObserversOfState;
- (BOOL)isPlayingFirstItemInPlaylist:(id)a3;
- (BOOL)session:(id)a3 repeatEnabledForCurrentMediaItem:(id)a4;
- (BOOL)session:(id)a3 shuffleEnabledForCurrentMediaItem:(id)a4;
- (BOOL)session:(id)a3 skipEnabledForCurrentMediaItem:(id)a4;
- (BOOL)sessionShouldBecomeActiveIfPossible:(id)a3;
- (BOOL)usingDiskCaching;
- (BSWatchdog)restoreUserInterfaceWatchdog;
- (NSString)description;
- (TVHPlaybackContextDelegate)delegate;
- (TVHPlayer)player;
- (TVHVideoPlaybackContext)init;
- (TVHVideoPlaybackViewController)fullscreenVideoPlaybackViewController;
- (id)_videoPlaybackViewControllerForPlayer:(id)a3;
- (id)_videoPlaybackViewControllerForPlayer:(id)a3 playerViewController:(id)a4;
- (id)restoreUserInterfaceCompletionHandler;
- (int64_t)session:(id)a3 editingStyleFlagsForMediaItem:(id)a4;
- (unint64_t)state;
- (void)_completeRestoreUserInterfaceWithSuccess:(BOOL)a3;
- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_tearDownPictureInPicturePlayback;
- (void)configureWithPlaylist:(id)a3 canUseDiskCaching:(BOOL)a4;
- (void)dealloc;
- (void)restorePictureInPictureVideoToFullscreen;
- (void)setDelegate:(id)a3;
- (void)setFullscreenVideoPlaybackViewController:(id)a3;
- (void)setRestoreUserInterfaceCompletionHandler:(id)a3;
- (void)setRestoreUserInterfaceWatchdog:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUsingDiskCaching:(BOOL)a3;
- (void)videoPlayerViewController:(id)a3 didStartPictureInPictureWithAVPlayerViewController:(id)a4;
- (void)videoPlayerViewController:(id)a3 didStopPictureInPictureWithAVPlayerViewController:(id)a4;
- (void)videoPlayerViewController:(id)a3 failedToStartPictureInPictureWithAVPlayerViewController:(id)a4 error:(id)a5;
- (void)videoPlayerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController:(id)a4 completionHandler:(id)a5;
- (void)videoPlayerViewController:(id)a3 willStartPictureInPictureWithAVPlayerViewController:(id)a4;
- (void)videoPlayerViewController:(id)a3 willStopPictureInPictureWithAVPlayerViewController:(id)a4;
- (void)videoPlayerViewControllerViewDidAppear:(id)a3;
@end

@implementation TVHVideoPlaybackContext

- (TVHVideoPlaybackContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHVideoPlaybackContext;
  v2 = -[TVHVideoPlaybackContext init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

    v5 = -[TVHPlayer initWithName:](objc_alloc(&OBJC_CLASS___TVHPlayer), "initWithName:", v4);
    player = v2->_player;
    v2->_player = v5;

    -[TVHPlayer setPausesOnRouteChange:](v2->_player, "setPausesOnRouteChange:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlayer mediaRemoteNowPlayingSession](v2->_player, "mediaRemoteNowPlayingSession"));
    [v7 setDelegate:v2];

    -[TVHPlayer setUsesMediaRemoteNowPlayingSession:](v2->_player, "setUsesMediaRemoteNowPlayingSession:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:v2->_player];
    [v8 addObserver:v2 selector:"_handleCurrentPlaybackMediaItemDidChangeNotification:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:v2->_player];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHVideoPlaybackContext;
  -[TVHVideoPlaybackContext dealloc](&v4, "dealloc");
}

- (BOOL)isPlayingFirstItemInPlaylist:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentMediaItem]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  id v9 = v7;
  objc_super v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v11 = v10;
    }
    else {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  id v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaItem]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 activeList]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  id v17 = v15;
  v18 = v17;
  if (v16)
  {
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0) {
      v19 = v18;
    }
    else {
      v19 = 0LL;
    }
  }

  else
  {
    v19 = 0LL;
  }

  id v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 mediaItem]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
  unsigned __int8 v24 = [v22 isEqual:v23];

  return v24;
}

- (void)restorePictureInPictureVideoToFullscreen
{
  unint64_t v3 = -[TVHVideoPlaybackContext state](self, "state");
  id v4 = sub_100079E48();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3 == 3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will restore PiP video to fullscreen playback. context=%@",  (uint8_t *)&v14,  0xCu);
    }

    -[TVHVideoPlaybackContext _tearDownPictureInPicturePlayback](self, "_tearDownPictureInPicturePlayback");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext _videoPlaybackViewControllerForPlayer:]( self,  "_videoPlaybackViewControllerForPlayer:",  v7));

    -[TVHVideoPlaybackContext setFullscreenVideoPlaybackViewController:]( self,  "setFullscreenVideoPlaybackViewController:",  v6);
    -[TVHVideoPlaybackContext setState:](self, "setState:", 1LL);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10009CA50((uint64_t)self, v6, v8, v9, v10, v11, v12, v13);
  }
}

- (void)configureWithPlaylist:(id)a3 canUseDiskCaching:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100079E48();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Configuring context with playlist for fullscreen video playback. context=%@, playlist=%@, canUseDiskCaching=%{BOOL}d",  (uint8_t *)&v13,  0x1Cu);
  }

  -[TVHVideoPlaybackContext _tearDownPictureInPicturePlayback](self, "_tearDownPictureInPicturePlayback");
  -[TVHVideoPlaybackContext setUsingDiskCaching:](self, "setUsingDiskCaching:", v4);
  objc_msgSend(v6, "tvh_updateMediaItemsAllowsDiskCaching:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioSession sharedInstance](&OBJC_CLASS___TVPAudioSession, "sharedInstance"));
  [v9 setConfigurationBlock:&stru_1000FEDA8];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
  [v10 setErrorBehavior:2];
  [v10 setPlaylist:v6];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext _videoPlaybackViewControllerForPlayer:]( self,  "_videoPlaybackViewControllerForPlayer:",  v11));

  -[TVHVideoPlaybackContext setFullscreenVideoPlaybackViewController:]( self,  "setFullscreenVideoPlaybackViewController:",  v12);
  -[TVHVideoPlaybackContext setState:](self, "setState:", 1LL);
}

- (BOOL)sessionShouldBecomeActiveIfPossible:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext delegate](self, "delegate", a3));
  v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 playbackContextMediaRemoteSessionShouldBecomeActive:self];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (int64_t)session:(id)a3 editingStyleFlagsForMediaItem:(id)a4
{
  return 3LL;
}

- (BOOL)session:(id)a3 repeatEnabledForCurrentMediaItem:(id)a4
{
  return 0;
}

- (BOOL)session:(id)a3 shuffleEnabledForCurrentMediaItem:(id)a4
{
  return 0;
}

- (BOOL)session:(id)a3 skipEnabledForCurrentMediaItem:(id)a4
{
  return 1;
}

- (void)videoPlayerViewControllerViewDidAppear:(id)a3
{
  dispatch_time_t v3 = dispatch_time(0LL, 100000000LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006C5C4;
  v4[3] = &unk_1000FCEF8;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, &_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)videoPlayerViewController:(id)a3 willStartPictureInPictureWithAVPlayerViewController:(id)a4
{
  id v5 = a3;
  id v6 = sub_100079E48();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received willStartPictureInPicture. context=%@",  (uint8_t *)&v8,  0xCu);
  }

  [v5 setAllowsVideoPlaybackWithoutVisuals:1];
  -[TVHVideoPlaybackContext setState:](self, "setState:", 2LL);
}

- (void)videoPlayerViewController:(id)a3 didStartPictureInPictureWithAVPlayerViewController:(id)a4
{
  id v5 = sub_100079E48();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received didStartPictureInPicture. context=%@",  (uint8_t *)&v7,  0xCu);
  }

  -[TVHVideoPlaybackContext setState:](self, "setState:", 3LL);
}

- (void)videoPlayerViewController:(id)a3 failedToStartPictureInPictureWithAVPlayerViewController:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = sub_100079E48();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received failedToStartPictureInPicture. context=%@, error=%@",  (uint8_t *)&v10,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
  [v9 stop];
}

- (void)videoPlayerViewController:(id)a3 willStopPictureInPictureWithAVPlayerViewController:(id)a4
{
  id v5 = sub_100079E48();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received willStopPictureInPicture. context=%@",  (uint8_t *)&v7,  0xCu);
  }

  if ((id)-[TVHVideoPlaybackContext state](self, "state") == (id)3) {
    -[TVHVideoPlaybackContext setState:](self, "setState:", 4LL);
  }
}

- (void)videoPlayerViewController:(id)a3 didStopPictureInPictureWithAVPlayerViewController:(id)a4
{
  id v5 = sub_100079E48();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received didStopPictureInPicture. context=%@",  (uint8_t *)&v8,  0xCu);
  }

  if ((id)-[TVHVideoPlaybackContext state](self, "state") == (id)4)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
    [v7 stop];
  }

- (void)videoPlayerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10006CD34;
  v36[3] = &unk_1000FE050;
  id v10 = a5;
  id v37 = v10;
  uint64_t v11 = objc_retainBlock(v36);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext restoreUserInterfaceCompletionHandler]( self,  "restoreUserInterfaceCompletionHandler"));
  BOOL v13 = v12 == 0LL;

  id v14 = sub_100079E48();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received restoreUserInterfaceForPictureInPictureStop. Will restore PiP video to fullscreen. context=%@",  buf,  0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext _videoPlaybackViewControllerForPlayer:playerViewController:]( self,  "_videoPlaybackViewControllerForPlayer:playerViewController:",  v23,  v9));

    [v24 setPresentsNowPlayingVideoWithoutAnimations:1];
    -[TVHVideoPlaybackContext setFullscreenVideoPlaybackViewController:]( self,  "setFullscreenVideoPlaybackViewController:",  v24);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10006CD48;
    v34[3] = &unk_1000FE050;
    v35 = v11;
    -[TVHVideoPlaybackContext setRestoreUserInterfaceCompletionHandler:]( self,  "setRestoreUserInterfaceCompletionHandler:",  v34);
    objc_initWeak((id *)buf, self);
    v25 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    v26 = &_dispatch_main_q;
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = sub_10006CD54;
    v31 = &unk_1000FEDD0;
    objc_copyWeak(&v33, (id *)buf);
    v32 = self;
    v27 = -[BSWatchdog initWithTimeout:queue:completion:]( v25,  "initWithTimeout:queue:completion:",  &_dispatch_main_q,  &v28,  5.0);

    -[TVHVideoPlaybackContext setRestoreUserInterfaceWatchdog:]( self,  "setRestoreUserInterfaceWatchdog:",  v27,  v28,  v29,  v30,  v31);
    -[BSWatchdog start](v27, "start");
    -[TVHVideoPlaybackContext setState:](self, "setState:", 1LL);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009CB18((uint64_t)self, v16, v17, v18, v19, v20, v21, v22);
    }

    ((void (*)(void *, void))v11[2])(v11, 0LL);
  }
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVPPlaybackStateNewStateKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v5 == v6)
  {
    id v7 = sub_100079E48();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Playback has stopped. Will reset -usingDiskCaching and notify delegate. context=%@",  (uint8_t *)&v9,  0xCu);
    }

    -[TVHVideoPlaybackContext setUsingDiskCaching:](self, "setUsingDiskCaching:", 0LL);
    -[TVHVideoPlaybackContext setFullscreenVideoPlaybackViewController:]( self,  "setFullscreenVideoPlaybackViewController:",  0LL);
    -[TVHVideoPlaybackContext setState:](self, "setState:", 0LL);
  }
}

- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVPPlayer);
  id v6 = v4;
  id v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;

  if ((id)-[TVHVideoPlaybackContext state](self, "state") == (id)3)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext player](self, "player"));
    [v10 stop];
  }

- (NSString)description
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlayer playlist](self->_player, "playlist"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvh_currentMediaItemTitle"));
  id v6 = [v3 appendObject:v5 withName:@"currentMediaItemTitle"];

  id v7 = [v3 appendBool:self->_usingDiskCaching withName:@"usingDiskCaching"];
  id v8 = [v3 appendObject:self->_player withName:@"player"];
  id v9 =  [v3 appendObject:self->_fullscreenVideoPlaybackViewController withName:@"fullscreenVideoPlaybackViewController"];
  unint64_t state = self->_state;
  if (state > 4) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = (uint64_t)*(&off_1000FEDF0 + state);
  }
  id v12 = [v3 appendObject:v11 withName:@"state"];
  id v13 = objc_retainBlock(self->_restoreUserInterfaceCompletionHandler);
  id v14 = [v3 appendObject:v13 withName:@"restoreUserInterfaceCompletionHandler"];

  id v15 =  [v3 appendObject:self->_restoreUserInterfaceWatchdog withName:@"restoreUserInterfaceWatchdog"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v16;
}

+ (BOOL)automaticallyNotifiesObserversOfState
{
  return 0;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    -[TVHVideoPlaybackContext willChangeValueForKey:](self, "willChangeValueForKey:", @"state");
    self->_unint64_t state = a3;
    -[TVHVideoPlaybackContext didChangeValueForKey:](self, "didChangeValueForKey:", @"state");
  }

- (void)_completeRestoreUserInterfaceWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext restoreUserInterfaceWatchdog](self, "restoreUserInterfaceWatchdog"));
  [v5 invalidate];

  -[TVHVideoPlaybackContext setRestoreUserInterfaceWatchdog:](self, "setRestoreUserInterfaceWatchdog:", 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext restoreUserInterfaceCompletionHandler]( self,  "restoreUserInterfaceCompletionHandler"));
  -[TVHVideoPlaybackContext setRestoreUserInterfaceCompletionHandler:]( self,  "setRestoreUserInterfaceCompletionHandler:",  0LL);
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, BOOL))v7 + 2))(v7, v3);
    id v6 = v7;
  }
}

- (id)_videoPlaybackViewControllerForPlayer:(id)a3
{
  return -[TVHVideoPlaybackContext _videoPlaybackViewControllerForPlayer:playerViewController:]( self,  "_videoPlaybackViewControllerForPlayer:playerViewController:",  a3,  0LL);
}

- (id)_videoPlaybackViewControllerForPlayer:(id)a3 playerViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[TVHVideoPlaybackViewController initWithPlayer:]( objc_alloc(&OBJC_CLASS___TVHVideoPlaybackViewController),  "initWithPlayer:",  v7);

  -[TVHVideoPlaybackViewController setDelegate:](v8, "setDelegate:", self);
  if (v6) {
    -[TVHVideoPlaybackViewController _useNowPlayingVideoViewController:](v8, "_useNowPlayingVideoViewController:", v6);
  }

  return v8;
}

- (void)_tearDownPictureInPicturePlayback
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext fullscreenVideoPlaybackViewController]( self,  "fullscreenVideoPlaybackViewController"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 avPlayerViewController]);

  [v5 setPlayer:0];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHVideoPlaybackContext restoreUserInterfaceCompletionHandler]( self,  "restoreUserInterfaceCompletionHandler"));
  if (v4) {
    -[TVHVideoPlaybackContext _completeRestoreUserInterfaceWithSuccess:]( self,  "_completeRestoreUserInterfaceWithSuccess:",  0LL);
  }
}

- (TVHPlaybackContextDelegate)delegate
{
  return (TVHPlaybackContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHPlayer)player
{
  return self->_player;
}

- (BOOL)usingDiskCaching
{
  return self->_usingDiskCaching;
}

- (void)setUsingDiskCaching:(BOOL)a3
{
  self->_usingDiskCaching = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (TVHVideoPlaybackViewController)fullscreenVideoPlaybackViewController
{
  return self->_fullscreenVideoPlaybackViewController;
}

- (void)setFullscreenVideoPlaybackViewController:(id)a3
{
}

- (id)restoreUserInterfaceCompletionHandler
{
  return self->_restoreUserInterfaceCompletionHandler;
}

- (void)setRestoreUserInterfaceCompletionHandler:(id)a3
{
}

- (BSWatchdog)restoreUserInterfaceWatchdog
{
  return self->_restoreUserInterfaceWatchdog;
}

- (void)setRestoreUserInterfaceWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end