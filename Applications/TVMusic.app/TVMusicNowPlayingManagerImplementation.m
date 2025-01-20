@interface TVMusicNowPlayingManagerImplementation
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BOOL)_idleNowPlayingShouldAppear;
- (BOOL)_viewControllerIsInSystemNowPlaying:(id)a3;
- (BOOL)isIdleTimerSuspended;
- (BOOL)isNowPlayingVisible;
- (BOOL)isTimedLyricsViewControllerVisible:(id)a3;
- (BOOL)playbackViewController:(id)a3 handleControlGesture:(int64_t)a4;
- (BOOL)playbackViewController:(id)a3 shouldShowIdleViewControllerForMediaItem:(id)a4;
- (BOOL)playbackViewControllerShouldChangeMediaUsingDirection:(id)a3;
- (BOOL)timedLyricsViewControllerIsPlayingSpatialAudio:(id)a3;
- (BOOL)timedLyricsViewControllerPlaybackIsPaused:(id)a3;
- (NSHashTable)visibleViewControllers;
- (NSTimer)screenSaverTimer;
- (TVMTimedLyricsViewController)timedLyricsViewController;
- (TVMusicNowPlayingManagerImplementation)init;
- (TVMusicNowPlayingViewPresenting)musicViewController;
- (double)elapsedTimeForTimedLyricsViewController:(id)a3;
- (int64_t)minimumScreensaverDelayMinutes;
- (unint64_t)_currentlyPlayingPlaybackType;
- (void)_appDidBecomeActive:(id)a3;
- (void)_appWillResignActive:(id)a3;
- (void)_currentMediaItemDidChange:(id)a3;
- (void)_musicVideoAddToLibrary:(id)a3;
- (void)_musicVideoRemoveFromLibrary:(id)a3;
- (void)_musicViewWillAppear:(id)a3;
- (void)_musicViewWillDisappear:(id)a3;
- (void)_pictureInPictureDidStart:(id)a3;
- (void)_pictureInPictureWillRestore:(id)a3;
- (void)_pictureInPictureWillStop:(id)a3;
- (void)_playQueueDidChangeAutoplayAvailability:(id)a3;
- (void)_playQueueDidChangeChangeDirection:(id)a3;
- (void)_playQueueEndActionUpdated:(id)a3;
- (void)_playbackError:(id)a3;
- (void)_playbackQueueDidChange:(id)a3;
- (void)_playbackStateDidChange:(id)a3;
- (void)_removePlaybackControllers;
- (void)_removePlaybackControllersWithCompletion:(id)a3;
- (void)_restoreScreenSaverDelay;
- (void)_setAllowsPictureInPicture:(BOOL)a3;
- (void)_setMinimumScreenSaverDelay;
- (void)_showIdleNowPlayingIfPossible;
- (void)_subscriptionStatusCapabilitiesChanged:(id)a3;
- (void)_systemNowPlayingDidAppear:(id)a3;
- (void)_systemNowPlayingWillDisappear:(id)a3;
- (void)_updateAdditionalRightControlsForNowPlayingViewController:(id)a3;
- (void)_updateAudioRoute;
- (void)_updateIdleNowPlayingTimer;
- (void)_updateScreensaverTimeout;
- (void)_videoOutputDidChange:(id)a3;
- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playbackViewController:(id)a3 wantsIdleViewControllerForMediaItem:(id)a4 withCompletion:(id)a5;
- (void)playbackViewController:(id)a3 willShowIdleViewController:(id)a4 forMediaItem:(id)a5 targetCoverFrame:(CGRect *)a6;
- (void)sendPlayCommandForTimedLyricsViewController:(id)a3;
- (void)sendTogglePlayPauseCommandForTimedLyricsViewController:(id)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setIdleTimerSuspended:(BOOL)a3;
- (void)setMinimumScreensaverDelayMinutes:(int64_t)a3;
- (void)setMusicViewController:(id)a3;
- (void)setScreenSaverTimer:(id)a3;
- (void)setTimedLyricsViewController:(id)a3;
- (void)setVisibleViewControllers:(id)a3;
- (void)showPlaybackControllerWithInitialPlaybackType:(unint64_t)a3;
- (void)timedLyricsViewController:(id)a3 didHaveViewEvent:(id)a4;
- (void)timedLyricsViewController:(id)a3 jumpToPosition:(double)a4;
- (void)timedLyricsViewDidUpdateAutoscroll:(id)a3;
@end

@implementation TVMusicNowPlayingManagerImplementation

- (TVMusicNowPlayingManagerImplementation)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingManagerImplementation;
  v2 = -[TVMusicNowPlayingManagerImplementation init](&v31, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    player = v2->_player;
    v2->_player = (TVMusicPlayer *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    visibleViewControllers = v2->_visibleViewControllers;
    v2->_visibleViewControllers = (NSHashTable *)v5;

    +[RBDevice setAllowsRenderingInBackground:](&OBJC_CLASS___RBDevice, "setAllowsRenderingInBackground:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_musicViewWillAppear:" name:@"TVMusicNowPlayingWillAppear" object:0];
    [v7 addObserver:v2 selector:"_musicViewWillDisappear:" name:@"TVMusicNowPlayingWillDisappear" object:0];
    [v7 addObserver:v2 selector:"_playbackQueueDidChange:" name:@"TVMusicPlayQueueChangedNotification" object:v2->_player];
    [v7 addObserver:v2 selector:"_currentMediaItemDidChange:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:v2->_player];
    [v7 addObserver:v2 selector:"_playbackStateDidChange:" name:TVPPlaybackStateDidChangeNotification object:v2->_player];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](v2->_player, "playQueue"));
    [v7 addObserver:v2 selector:"_newTracklist:" name:@"TVMusicPlayQueueNewTracklistNotification" object:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v7 addObserver:v2 selector:"_appDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v7 addObserver:v2 selector:"_appWillResignActive:" name:UIApplicationWillResignActiveNotification object:v10];

    [v7 addObserver:v2 selector:"_audioRouteDidChange:" name:MPAVRoutingDataSourceRoutesDidChangeNotification object:0];
    [v7 addObserver:v2 selector:"_playbackError:" name:TVPPlaybackErrorNotification object:v2->_player];
    [v7 addObserver:v2 selector:"_musicVideoAddToLibrary:" name:@"TVMusicNowPlayingVideoDidSelectAddToLibrary" object:0];
    [v7 addObserver:v2 selector:"_musicVideoRemoveFromLibrary:" name:@"TVMusicNowPlayingVideoDidSelectRemoveFromLibrary" object:0];
    [v7 addObserver:v2 selector:"_playQueueDidChangeAutoplayAvailability:" name:@"TVMusicPlayQueueAutoplayAvailabilityChangedNotification" object:0];
    [v7 addObserver:v2 selector:"_playQueueEndActionUpdated:" name:@"TVMusicPlayQueueEndActionChangedNotification" object:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](v2->_player, "playQueue"));
    [v7 addObserver:v2 selector:"_playQueueDidChangeChangeDirection:" name:@"TVMusicPlayQueueChangeDirectionChangedNotification" object:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](v2->_player, "playQueue"));
    [v7 addObserver:v2 selector:"_pictureInPictureDidStart:" name:@"TVMusicPlayQueuePictureInPictureDidStartNotification" object:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](v2->_player, "playQueue"));
    [v7 addObserver:v2 selector:"_pictureInPictureWillStop:" name:@"TVMusicPlayQueuePictureInPictureWillStopNotification" object:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](v2->_player, "playQueue"));
    [v7 addObserver:v2 selector:"_pictureInPictureWillRestore:" name:@"TVMusicPlayQueuePictureInPictureWillRestoreNotification" object:v14];

    [v7 addObserver:v2 selector:"_subscriptionStatusCapabilitiesChanged:" name:TVMusicSubscriptionStatusCapabilitiesChangedNotification object:0];
    [v7 addObserver:v2 selector:"_systemNowPlayingDidAppear:" name:@"TVMusicSystemNowPlayingViewControllerDidAppear" object:0];
    [v7 addObserver:v2 selector:"_systemNowPlayingWillDisappear:" name:@"TVMusicSystemNowPlayingViewControllerWillDisappear" object:0];
    [v7 addObserver:v2 selector:"_videoOutputDidChange:" name:@"TVMusicPlayQueueVideoOutputChangedNotification" object:0];
    -[TVMusicPlayer addObserver:forKeyPath:options:context:]( v2->_player,  "addObserver:forKeyPath:options:context:",  v2,  @"playQueue.isRadioPlayback",  1LL,  off_1002B6258);
    -[TVMusicNowPlayingManagerImplementation addObserver:forKeyPath:options:context:]( v2,  "addObserver:forKeyPath:options:context:",  v2,  @"musicViewController.isRestMode",  0LL,  off_1002B6260);
    v2->_idleTimerSuspended = 1;
    id v15 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    [v15 setIdentifier:@"com.apple.TVMusic.nowPlayingManager"];
    [v15 setEventMask:4095];
    [v15 setAttentionLostTimeout:60.0];
    v16 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v16;

    v18 = v2->_attentionAwarenessClient;
    id v30 = 0LL;
    -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( v18,  "setConfiguration:shouldReset:error:",  v15,  0LL,  &v30);
    id v19 = v30;
    if (v19)
    {
      id v20 = sub_10004FA60();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Unable to configure attention awareness: %@",  buf,  0xCu);
      }
    }

    else
    {
      objc_initWeak((id *)buf, v2);
      v22 = v2->_attentionAwarenessClient;
      v23 = &_dispatch_main_q;
      v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472LL;
      v27 = sub_10004FAA0;
      v28 = &unk_10026AF70;
      objc_copyWeak(&v29, (id *)buf);
      -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]( v22,  "setEventHandlerWithQueue:block:",  &_dispatch_main_q,  &v25);

      -[AWAttentionAwarenessClient resumeWithError:]( v2->_attentionAwarenessClient,  "resumeWithError:",  0LL,  v25,  v26,  v27,  v28);
      -[TVMusicNowPlayingManagerImplementation _updateIdleNowPlayingTimer](v2, "_updateIdleNowPlayingTimer");
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingManagerImplementation;
  -[TVMusicNowPlayingManagerImplementation dealloc](&v3, "dealloc");
}

- (BOOL)isNowPlayingVisible
{
  return +[TVMusicPlaybackViewController hasActivePlaybackViewController]( &OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController,  "hasActivePlaybackViewController");
}

- (void)_updateAdditionalRightControlsForNowPlayingViewController:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  if (![v4 storeFrontSupportsLyrics])
  {
    v8 = 0LL;
    goto LABEL_5;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned int v6 = [v5 allowsLyricsFromCatalog];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  22.0));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"quote.bubble",  v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVPMusicNowPlayingControlItem controlItemWithImage:handler:]( &OBJC_CLASS___TVPMusicNowPlayingControlItem,  "controlItemWithImage:handler:",  v4,  &stru_10026AFB0));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  22.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"quote.bubble.fill",  v9));

    [v8 setImage:v10 forControlState:4];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 buttonView]);
    [v11 setAccessibilityIdentifier:@"Lyrics"];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    objc_msgSend( v8,  "setSelected:",  objc_msgSend(v12, "BOOLForKey:", @"TVMusicNowPlayingManagerIdleLyricsEnabledKey"));

LABEL_5:
    goto LABEL_7;
  }

  v8 = 0LL;
LABEL_7:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 player]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playQueue]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  if ([v17 hasMusicSubscription])
  {
    unsigned int v18 = [v16 isQueueEndActionAvailable:3];

    if (!v18) {
      goto LABEL_11;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:",  6LL,  22.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"infinity",  v19));

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10004FF7C;
    v25[3] = &unk_10026AFD8;
    id v26 = v16;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[_TVMusicNowPlayingManagerAutoplayControlItem controlItemWithImage:handler:]( &OBJC_CLASS____TVMusicNowPlayingManagerAutoplayControlItem,  "controlItemWithImage:handler:",  v17,  v25));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 buttonView]);
    [v21 setAccessibilityIdentifier:@"AutoPlay"];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 player]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 playQueue]);
    objc_msgSend(v20, "setSelected:", objc_msgSend(v24, "queueEndAction") == (id)3);

    [v13 addObject:v20];
  }

LABEL_11:
  if (v8) {
    [v13 addObject:v8];
  }
  if ((objc_opt_respondsToSelector(v3, "setAdditionalRightControlItems:") & 1) != 0) {
    [v3 setAdditionalRightControlItems:v13];
  }
}

- (void)_musicViewWillAppear:(id)a3
{
  id v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v17 object]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v17 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIViewController, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v17 object]);
    unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___TVMusicNowPlayingViewPresenting];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation visibleViewControllers](self, "visibleViewControllers"));
      [v10 addObject:v4];

      -[TVMusicNowPlayingManagerImplementation setMusicViewController:](self, "setMusicViewController:", v4);
      [v4 setPlaybackDelegate:self];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self->_player, "playQueue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioRoute]);
      [v4 setEndpointRoute:v12];

      -[TVMusicNowPlayingManagerImplementation _updateAdditionalRightControlsForNowPlayingViewController:]( self,  "_updateAdditionalRightControlsForNowPlayingViewController:",  v4);
      [v4 setOverrideUserInterfaceStyle:2];
      if (+[TVMusicNowPlayingArtworkVisualizerView isSupported]( &OBJC_CLASS___TVMusicNowPlayingArtworkVisualizerView,  "isSupported"))
      {
        v13 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingArtworkVisualizerView);
        [v4 setCustomBackgroundProvider:v13];
      }

      else
      {
        [v4 setShowAnimatedBackground:1];
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v15 = [v14 integerForKey:@"TVMusic.ScreenSaverTimeoutMinutes"];
      int64_t v16 = 60LL;
      if (v15) {
        int64_t v16 = (int64_t)v15;
      }
      self->_minimumScreensaverDelayMinutes = v16;

      -[TVMusicNowPlayingManagerImplementation _updateScreensaverTimeout](self, "_updateScreensaverTimeout");
    }
  }

  else
  {
  }

  -[TVMusicNowPlayingManagerImplementation _updateIdleNowPlayingTimer](self, "_updateIdleNowPlayingTimer");
}

- (void)_musicViewWillDisappear:(id)a3
{
  id v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v13 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIViewController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v13 object]);
    unsigned int v8 = [v7 conformsToProtocol:&OBJC_PROTOCOL___TVMusicNowPlayingViewPresenting];

    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation visibleViewControllers](self, "visibleViewControllers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v13 object]);
      [v9 removeObject:v10];

      -[TVMusicNowPlayingManagerImplementation _updateIdleNowPlayingTimer](self, "_updateIdleNowPlayingTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue([v13 object]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation musicViewController](self, "musicViewController"));

      if (v11 == v12)
      {
        -[TVMusicNowPlayingManagerImplementation _restoreScreenSaverDelay](self, "_restoreScreenSaverDelay");
        -[TVMusicNowPlayingManagerImplementation setMusicViewController:](self, "setMusicViewController:", 0LL);
      }
    }
  }

  else
  {
  }
}

- (void)_playbackQueueDidChange:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingManagerImplementation visibleViewControllers]( self,  "visibleViewControllers",  a3,  0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) reloadPlaylist];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)_playQueueDidChangeAutoplayAvailability:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingManagerImplementation visibleViewControllers]( self,  "visibleViewControllers",  a3,  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      __int128 v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TVMusicNowPlayingManagerImplementation _updateAdditionalRightControlsForNowPlayingViewController:]( self,  "_updateAdditionalRightControlsForNowPlayingViewController:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        __int128 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_subscriptionStatusCapabilitiesChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  id v5 = sub_100050538;
  id v6 = &unk_100268CF0;
  uint64_t v7 = self;
  id v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053FAC;
    block[3] = &unk_100268D60;
    __int128 v9 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_playQueueEndActionUpdated:(id)a3
{
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation visibleViewControllers](self, "visibleViewControllers", a3));
  id v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v28;
    uint64_t v19 = *(void *)v28;
    do
    {
      id v6 = 0LL;
      id v20 = v4;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v6);
        if ((objc_opt_respondsToSelector(v7, "additionalRightControlItems") & 1) != 0)
        {
          v22 = v6;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalRightControlItems]);
          id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            id v11 = v9;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (i = 0LL; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v8);
                }
                v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
                uint64_t v15 = objc_opt_class(&OBJC_CLASS____TVMusicNowPlayingManagerAutoplayControlItem, v10);
                if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
                {
                  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlayerManager sharedInstance]( &OBJC_CLASS___TVMusicPlayerManager,  "sharedInstance"));
                  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 player]);
                  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playQueue]);
                  objc_msgSend(v14, "setSelected:", objc_msgSend(v18, "queueEndAction") == (id)3);
                }
              }

              id v11 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }

            while (v11);
          }

          uint64_t v5 = v19;
          id v4 = v20;
          id v6 = v22;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v6 != v4);
      id v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v4);
  }
}

- (void)_playQueueDidChangeChangeDirection:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self->_player, "playQueue", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 lastPlayerResponse]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 tracklist]);
  if ([v5 lastChangeDirection] == (id)5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 tracklist]);
    id v7 = [v6 repeatType];

    if (!v7) {
      -[TVMusicNowPlayingManagerImplementation _removePlaybackControllers](self, "_removePlaybackControllers");
    }
  }

  else
  {
  }
}

- (void)_currentMediaItemDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playQueue]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 currentMediaItem]);
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 playQueue]);
    unsigned __int8 v9 = [v8 isAirplayActive];

    if ((v9 & 1) == 0
      && (id)-[TVMusicNowPlayingManagerImplementation _currentlyPlayingPlaybackType]( self,  "_currentlyPlayingPlaybackType") == (id)2 && +[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted"))
    {
      [v4 pause];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000509EC;
      v10[3] = &unk_100268CF0;
      id v11 = v4;
      -[TVMusicNowPlayingManagerImplementation hideCurrentPlaybackControllerWithCompletion:]( self,  "hideCurrentPlaybackControllerWithCompletion:",  v10);
    }
  }

  else
  {
  }
}

- (void)_playbackStateDidChange:(id)a3
{
  id v13 = a3;
  if (!+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVPPlaybackStateNewStateKey]);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 navigationController]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
    if (v5 == v8)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topViewController]);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController, v10);
      char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

      if ((isKindOfClass & 1) != 0) {
        -[TVMusicNowPlayingManagerImplementation _removePlaybackControllers](self, "_removePlaybackControllers");
      }
    }

    else
    {
    }
  }

  -[TVMusicNowPlayingManagerImplementation _updateIdleNowPlayingTimer](self, "_updateIdleNowPlayingTimer");
  -[TVMusicNowPlayingManagerImplementation _updateScreensaverTimeout](self, "_updateScreensaverTimeout");
}

- (void)_systemNowPlayingDidAppear:(id)a3
{
}

- (void)_systemNowPlayingWillDisappear:(id)a3
{
}

- (void)_videoOutputDidChange:(id)a3
{
}

- (void)_setAllowsPictureInPicture:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self->_player, "playQueue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 videoOutput]);

  if ([v8 allowsPictureInPicturePlayback] != v3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playQueue](self->_player, "playQueue"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 videoOutput]);
    [v7 setAllowsPictureInPicturePlayback:v3];
  }
}

- (void)_pictureInPictureDidStart:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingManagerImplementation visibleViewControllers]( self,  "visibleViewControllers",  a3,  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) didShowPictureInPicture];
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  else
  {

    -[TVMusicNowPlayingManagerImplementation _removePlaybackControllers](self, "_removePlaybackControllers");
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v9 setIdleTimerDisabled:1];
}

- (void)_pictureInPictureWillStop:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation screenSaverTimer](self, "screenSaverTimer", a3));
  unsigned __int8 v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 setIdleTimerDisabled:0];
  }

- (void)_pictureInPictureWillRestore:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100051044;
  v22 = sub_10005106C;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v23 = (id)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"TVMusicPlayQueuePictureInPictureWillRestoreCompletionUserInfoKey"]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation visibleViewControllers](self, "visibleViewControllers"));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100051074;
        v13[3] = &unk_10026B000;
        v13[4] = &v18;
        [v10 willStopPictureInPictureWithCompletion:v13];
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }

    while (v7);
  }

  else
  {

    -[TVMusicNowPlayingManagerImplementation showPlaybackControllerWithInitialPlaybackType:]( self,  "showPlaybackControllerWithInitialPlaybackType:",  -[TVMusicNowPlayingManagerImplementation _currentlyPlayingPlaybackType](self, "_currentlyPlayingPlaybackType"));
    if (v19[5])
    {
      dispatch_time_t v11 = dispatch_time(0LL, 600000000LL);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000510C8;
      v12[3] = &unk_10026B000;
      v12[4] = &v18;
      dispatch_after(v11, &_dispatch_main_q, v12);
    }
  }

  _Block_object_dispose(&v18, 8);
}

- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)playbackViewController:(id)a3 shouldShowIdleViewControllerForMediaItem:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelContainer"]);

  if ([v6 type] != (id)1) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 song]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lyrics]);
  if (![v9 hasStoreLyrics])
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 song]);
    unsigned int v11 = +[TVMusicLyricsRequest _hasBundledTTMLLyricsForSong:]( &OBJC_CLASS___TVMusicLyricsRequest,  "_hasBundledTTMLLyricsForSong:",  v10);

    if (v11) {
      goto LABEL_5;
    }
LABEL_7:
    LOBYTE(v14) = 0;
    goto LABEL_10;
  }

LABEL_5:
  if ([v7 type] == (id)13)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 radioStation]);
    BOOL v13 = [v12 type] == (id)4;
  }

  else
  {
    BOOL v13 = 0;
  }

  unsigned int v14 = !-[TVMusicPlayer isLive](self->_player, "isLive") && !v13;
LABEL_10:

  return v14;
}

- (void)playbackViewController:(id)a3 wantsIdleViewControllerForMediaItem:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  if ([v9 type] == (id)1)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifiers]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 universalStore]);
    id v12 = [v11 adamID];
    if (v12)
    {
      id v13 = v12;

LABEL_5:
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 song]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100051450;
      v19[3] = &unk_10026B078;
      v19[4] = self;
      id v20 = v7;
      id v21 = v9;
      id v23 = v13;
      id v22 = v8;
      +[TVMusicLyricsRequest requestTTMLLyricsForSong:completion:]( &OBJC_CLASS___TVMusicLyricsRequest,  "requestTTMLLyricsForSong:completion:",  v16,  v19);

      goto LABEL_9;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifiers]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 universalStore]);
    id v13 = [v15 subscriptionAdamID];

    if (v13) {
      goto LABEL_5;
    }
  }

  id v17 = sub_10004FA60();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Can't get store ID for mediaItem: %@",  buf,  0xCu);
  }

  (*((void (**)(id, void))v8 + 2))(v8, 0LL);
LABEL_9:
}

- (void)playbackViewController:(id)a3 willShowIdleViewController:(id)a4 forMediaItem:(id)a5 targetCoverFrame:(CGRect *)a6
{
  id v21 = a4;
  CGFloat y = a6->origin.y;
  double width = a6->size.width;
  CGFloat height = a6->size.height;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a3 view]);
  [v12 bounds];
  double v14 = v13;

  unsigned int v15 = [v21 conformsToProtocol:&OBJC_PROTOCOL___TVMTimedLyricsPresenting];
  __int128 v16 = v21;
  if (v15)
  {
    CGFloat v17 = v14 * 0.5 - width + -288.0;
    id v18 = v21;
    v22.origin.x = v17;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.CGFloat height = height;
    [v18 setCurrentLineCenterY:CGRectGetMidY(v22)];
    a6->origin.x = v17;
    a6->origin.CGFloat y = y;
    a6->size.double width = width;
    a6->size.CGFloat height = height;
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___TVMTimedLyricsViewController, v19);
    if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0) {
      -[TVMusicNowPlayingManagerImplementation setTimedLyricsViewController:]( self,  "setTimedLyricsViewController:",  v18);
    }

    __int128 v16 = v21;
  }
}

- (BOOL)playbackViewController:(id)a3 handleControlGesture:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingManagerImplementation timedLyricsViewController]( self,  "timedLyricsViewController",  a3));

  if (!v6) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation timedLyricsViewController](self, "timedLyricsViewController"));
  unsigned __int8 v8 = [v7 handleSelectGesture];

  return v8;
}

- (BOOL)playbackViewControllerShouldChangeMediaUsingDirection:(id)a3
{
  return 1;
}

- (double)elapsedTimeForTimedLyricsViewController:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v5 != v6) {
    goto LABEL_4;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playQueue]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentPlayingItem]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataObject]);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifiers]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 song]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifiers]);
  unsigned int v13 = [v10 intersectsSet:v12];

  if (v13)
  {
    [v4 elapsedTime];
    double v15 = v14;
  }

  else
  {
LABEL_4:
    double v15 = 2.22507386e-308;
  }

  return v15;
}

- (void)timedLyricsViewController:(id)a3 jumpToPosition:(double)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer", a3));
  [v5 setElapsedTime:a4];
}

- (BOOL)timedLyricsViewControllerPlaybackIsPaused:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  BOOL v6 = v4 == v5;

  return v6;
}

- (BOOL)timedLyricsViewControllerIsPlayingSpatialAudio:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playQueue]);
  unsigned __int8 v5 = [v4 isPlayingSpatialAudio];

  return v5;
}

- (void)sendPlayCommandForTimedLyricsViewController:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v3 != v4) {
    [v5 play];
  }
}

- (void)sendTogglePlayPauseCommandForTimedLyricsViewController:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer", a3));
  [v3 togglePlayPause];
}

- (BOOL)isTimedLyricsViewControllerVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[TVMusicAppDelegate isAppActive](&OBJC_CLASS___TVMusicAppDelegate, "isAppActive")
    || +[TVMusicSystemNowPlayingViewController isVisible]( &OBJC_CLASS___TVMusicSystemNowPlayingViewController,  "isVisible")
    && -[TVMusicNowPlayingManagerImplementation _viewControllerIsInSystemNowPlaying:]( self,  "_viewControllerIsInSystemNowPlaying:",  v4);

  return v5;
}

- (void)timedLyricsViewController:(id)a3 didHaveViewEvent:(id)a4
{
  id v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 lyricsReportingController]);
  [v5 recordLyricsViewEvent:v4];
}

- (void)timedLyricsViewDidUpdateAutoscroll:(id)a3
{
  unsigned int v4 = [a3 isAutoScrolling];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation visibleViewControllers](self, "visibleViewControllers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
        if (v4) {
          [v10 didEndUserEngagingLyrics];
        }
        else {
          [v10 willUserEngageLyrics];
        }
        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_appDidBecomeActive:(id)a3
{
}

- (void)_appWillResignActive:(id)a3
{
}

- (void)_playbackError:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  if (v5 == v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:TVPPlaybackWillStopDueToErrorKey]);
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      __int128 v12 = sub_100052238;
      __int128 v13 = &unk_100268CF0;
      __int128 v14 = self;
      __int128 v10 = v11;
      if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
      {
        v12((uint64_t)v10);
      }

      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100053FAC;
        block[3] = &unk_100268D60;
        __int128 v16 = v10;
        dispatch_async(&_dispatch_main_q, block);
      }
    }
  }

  else
  {
  }
}

- (void)_musicVideoAddToLibrary:(id)a3
{
  id v3 = a3;
  id v4 = sub_10004FA60();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v14 = "-[TVMusicNowPlayingManagerImplementation _musicVideoAddToLibrary:]";
    __int16 v15 = 2080;
    __int128 v16 = "-[TVMusicNowPlayingManagerImplementation _musicVideoAddToLibrary:]";
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: Notification: %@", buf, 0x20u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (char *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TVMusicNowPlayingUserInfoMediaItemKey"]);

  if (v7
    && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:TVPMediaItemMetadataStoreItemIdentifier]),
        id v9 = [v8 longLongValue],
        v8,
        v9))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100052408;
    v12[3] = &unk_10026B098;
    v12[4] = v9;
    +[TVMusicLibraryUtilities addItemToLibraryWithAdamID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addItemToLibraryWithAdamID:completionHandler:",  v9,  v12);
  }

  else
  {
    id v10 = sub_10004FA60();
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MediaItem not added to library: %{public}@",  buf,  0xCu);
    }
  }
}

- (void)_musicVideoRemoveFromLibrary:(id)a3
{
  id v3 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v4 = sub_10004FA60();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[TVMusicNowPlayingManagerImplementation _musicVideoRemoveFromLibrary:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicNowPlayingManagerImplementation _musicVideoRemoveFromLibrary:]";
    *(_WORD *)&buf[22] = 2112;
    __int128 v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: Notification: %@", buf, 0x20u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TVMusicNowPlayingUserInfoMediaItemKey"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  __int128 v29 = sub_100052830;
  __int128 v30 = sub_100052840;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPModelSong, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    __int128 v11 = v8;
  }
  else {
    __int128 v11 = 0LL;
  }
  id v31 = v11;
  __int128 v13 = *(void **)(*(void *)&buf[8] + 40LL);
  if (v13) {
    goto LABEL_12;
  }
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPModelGenericObject, v12);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0) {
    __int16 v15 = v8;
  }
  else {
    __int16 v15 = 0LL;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100052848;
  v23[3] = &unk_100269A48;
  id v25 = buf;
  id v16 = v15;
  id v24 = v16;
  +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v23);
  if (*(void *)(*(void *)&buf[8] + 40LL))
  {

    __int128 v13 = *(void **)(*(void *)&buf[8] + 40LL);
LABEL_12:
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10005289C;
    v21[3] = &unk_100268F50;
    id v22 = v8;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicAlerts alertForLibraryDeleteConfirmationWithItemName:completion:]( &OBJC_CLASS___TVMusicAlerts,  "alertForLibraryDeleteConfirmationWithItemName:completion:",  v17,  v21));

    +[TVMusicAlerts showAlertController:](&OBJC_CLASS___TVMusicAlerts, "showAlertController:", v18);
    id v16 = v22;
    goto LABEL_13;
  }

  id v19 = sub_10004FA60();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 v26 = 138543362;
    __int128 v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "MediaItem not removed from library: %{public}@",  v26,  0xCu);
  }

LABEL_13:
  _Block_object_dispose(buf, 8);
}

- (void)_updateAudioRoute
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  id v4 = sub_10005297C;
  BOOL v5 = &unk_100268CF0;
  id v6 = self;
  v2 = v3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v4((uint64_t)v2);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053FAC;
    block[3] = &unk_100268D60;
    uint64_t v8 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_setMinimumScreenSaverDelay
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  uint64_t v4 = (uint64_t)[v3 activationDelay];

  if (v4 >= 1
    && v4 < -[TVMusicNowPlayingManagerImplementation minimumScreensaverDelayMinutes]( self,  "minimumScreensaverDelayMinutes"))
  {
    id v5 = sub_10004FA60();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v18 = -[TVMusicNowPlayingManagerImplementation minimumScreensaverDelayMinutes]( self,  "minimumScreensaverDelayMinutes");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Setting screen saver timeout to %ld minutes.",  buf,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation screenSaverTimer](self, "screenSaverTimer"));
    BOOL v8 = v7 == 0LL;

    if (v8)
    {
      id v9 = sub_10004FA60();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabling idle timer", buf, 2u);
      }

      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v11 setIdleTimerDisabled:1];

      int64_t v12 = -[TVMusicNowPlayingManagerImplementation minimumScreensaverDelayMinutes]( self,  "minimumScreensaverDelayMinutes");
      objc_initWeak((id *)buf, self);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation screenSaverTimer](self, "screenSaverTimer"));
      [v13 invalidate];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100052CF8;
      v15[3] = &unk_10026B0C0;
      objc_copyWeak(&v16, (id *)buf);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v15,  (double)(v12 - v4) * 60.0));
      -[TVMusicNowPlayingManagerImplementation setScreenSaverTimer:](self, "setScreenSaverTimer:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }

- (void)_restoreScreenSaverDelay
{
  id v3 = sub_10004FA60();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Restoring screen saver timeout to default.",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  if ([v5 isIdleTimerDisabled])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    unsigned __int8 v8 = [v7 isVideoPictureInPictureRunning];

    if ((v8 & 1) != 0) {
      goto LABEL_9;
    }
    id v9 = sub_10004FA60();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling idle timer", v13, 2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 setIdleTimerDisabled:0];
  }

LABEL_9:
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation screenSaverTimer](self, "screenSaverTimer"));

  if (v11)
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation screenSaverTimer](self, "screenSaverTimer"));
    [v12 invalidate];

    -[TVMusicNowPlayingManagerImplementation setScreenSaverTimer:](self, "setScreenSaverTimer:", 0LL);
  }

- (void)_updateScreensaverTimeout
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation musicViewController](self, "musicViewController"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation musicViewController](self, "musicViewController"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v4 uiState]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation musicViewController](self, "musicViewController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 player]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation musicViewController](self, "musicViewController"));
    if ([v8 isRestMode]
      && ([v11 isPlaylistVisible] & 1) == 0
      && ([v11 nothingPlaying] & 1) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
      if (v7 == v9 && -[TVMusicNowPlayingManagerImplementation isNowPlayingVisible](self, "isNowPlayingVisible"))
      {
        unsigned int v10 = +[TVMusicAppDelegate isAppActive](&OBJC_CLASS___TVMusicAppDelegate, "isAppActive");

        if (v10)
        {
          -[TVMusicNowPlayingManagerImplementation _setMinimumScreenSaverDelay](self, "_setMinimumScreenSaverDelay");
LABEL_14:

          return;
        }

- (BOOL)_viewControllerIsInSystemNowPlaying:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 parentViewController]);
  if (v3)
  {
    id v5 = (void *)v3;
    do
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicSystemNowPlayingViewController, v4);
      char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
      if ((isKindOfClass & 1) != 0) {
        break;
      }
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 parentViewController]);

      id v5 = (void *)v8;
    }

    while (v8);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_idleNowPlayingShouldAppear
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playQueue]);
  if ([v4 playerState] == (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playQueue]);
    if (([v6 isVideoPictureInPictureRunning] & 1) != 0
      || -[TVMusicNowPlayingManagerImplementation isNowPlayingVisible](self, "isNowPlayingVisible"))
    {
      BOOL v7 = 0;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      BOOL v7 = [v8 applicationState] == 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateIdleNowPlayingTimer
{
  unsigned int v3 = -[TVMusicNowPlayingManagerImplementation _idleNowPlayingShouldAppear](self, "_idleNowPlayingShouldAppear");
  unsigned int v4 = -[TVMusicNowPlayingManagerImplementation isIdleTimerSuspended](self, "isIdleTimerSuspended");
  if (v3)
  {
    if (!v4) {
      return;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation attentionAwarenessClient](self, "attentionAwarenessClient"));
    id v15 = 0LL;
    unsigned int v6 = [v5 resumeWithError:&v15];
    id v7 = v15;
    -[TVMusicNowPlayingManagerImplementation setIdleTimerSuspended:](self, "setIdleTimerSuspended:", v6 ^ 1);

    if (!v7) {
      goto LABEL_12;
    }
    id v8 = sub_10004FA60();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    unsigned int v10 = "Unable to resume idle now playing attention awareness: %@";
    goto LABEL_10;
  }

  if ((v4 & 1) != 0) {
    return;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingManagerImplementation attentionAwarenessClient](self, "attentionAwarenessClient"));
  id v14 = 0LL;
  id v12 = [v11 suspendWithError:&v14];
  id v7 = v14;
  -[TVMusicNowPlayingManagerImplementation setIdleTimerSuspended:](self, "setIdleTimerSuspended:", v12);

  if (v7)
  {
    id v13 = sub_10004FA60();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }

    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    unsigned int v10 = "Unable to suspend idle now playing attention awareness: %@";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    goto LABEL_11;
  }

- (void)_showIdleNowPlayingIfPossible
{
  if (-[TVMusicNowPlayingManagerImplementation _idleNowPlayingShouldAppear](self, "_idleNowPlayingShouldAppear")) {
    -[TVMusicNowPlayingManagerImplementation showPlaybackControllerWithInitialPlaybackType:]( self,  "showPlaybackControllerWithInitialPlaybackType:",  -[TVMusicNowPlayingManagerImplementation _currentlyPlayingPlaybackType](self, "_currentlyPlayingPlaybackType"));
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (off_1002B6258 == a6)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    id v15 = [v14 BOOLValue];

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingManagerImplementation visibleViewControllers]( self,  "visibleViewControllers",  0LL));
    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        }

        id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v18);
    }
  }

  else if (off_1002B6260 == a6)
  {
    -[TVMusicNowPlayingManagerImplementation _updateScreensaverTimeout](self, "_updateScreensaverTimeout");
  }
}

- (void)showPlaybackControllerWithInitialPlaybackType:(unint64_t)a3
{
  id v5 = sub_10004FA60();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 2) {
      id v7 = @"(Unknown)";
    }
    else {
      id v7 = *(&off_10026B100 + a3 - 1);
    }
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Showing Now Playing view controller for playback type: %@",  buf,  0xCu);
  }

  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
    [v8 showNowPlayingWithPlaybackType:a3];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 navigationController]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 topViewController]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
    }

    else
    {
      unsigned __int8 v13 = -[TVMusicNowPlayingManagerImplementation isNowPlayingVisible](self, "isNowPlayingVisible");

      if ((v13 & 1) == 0)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100053638;
        v14[3] = &unk_100268E30;
        v14[4] = v8;
        v14[5] = a3;
        -[TVMusicNowPlayingManagerImplementation _removePlaybackControllersWithCompletion:]( self,  "_removePlaybackControllersWithCompletion:",  v14);
      }
    }
  }
}

- (unint64_t)_currentlyPlayingPlaybackType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playQueue]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentMediaItem]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
  unsigned int v6 = (void *)v5;
  if (v5 == TVPMediaTypeMusicVideo)
  {
    unint64_t v8 = 3LL;
  }

  else if (v5 == TVPMediaTypeMovie || v5 == TVPMediaTypeTVEpisode)
  {
    unint64_t v8 = 2LL;
  }

  else if ([v2 currentMediaItemHasVideoContent])
  {
    unint64_t v8 = 2LL;
  }

  else
  {
    unint64_t v8 = 1LL;
  }

  return v8;
}

- (void)_removePlaybackControllers
{
}

- (void)_removePlaybackControllersWithCompletion:(id)a3
{
  unsigned int v3 = (void (**)(void))a3;
  if (!+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 navigationController]);

    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
    id v12 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = *(void *)v61;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v61 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController, v13);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
            uint64_t v19 = v9;
          }
          else {
            uint64_t v19 = v42;
          }
          [v19 addObject:v17];
        }

        id v14 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }

      while (v14);
    }

    if (![v9 count])
    {
      int v35 = 1;
      uint64_t v5 = v7;
      if (v3) {
        goto LABEL_40;
      }
      goto LABEL_42;
    }

    v36 = v3;
    uint64_t v20 = dispatch_group_create();
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v21 = v9;
    id v41 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v41)
    {
      char v22 = 0;
      id obj = v21;
      uint64_t v39 = *(void *)v57;
      v40 = v9;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(obj);
          }
          __int128 v24 = *(void **)(*((void *)&v56 + 1) + 8 * v23);
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          v43 = v24;
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "childViewControllers", v36));
          id v26 = [v25 countByEnumeratingWithState:&v52 objects:v66 count:16];
          uint64_t v44 = v23;
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v53;
            do
            {
              for (j = 0LL; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v53 != v28) {
                  objc_enumerationMutation(v25);
                }
                __int128 v30 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
                id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 presentedViewController]);

                if (v31)
                {
                  dispatch_group_enter(v20);
                  v50[0] = _NSConcreteStackBlock;
                  v50[1] = 3221225472LL;
                  v50[2] = sub_100053D44;
                  v50[3] = &unk_100268CF0;
                  v51 = v20;
                  [v30 dismissViewControllerAnimated:0 completion:v50];

                  char v22 = 1;
                }
              }

              id v27 = [v25 countByEnumeratingWithState:&v52 objects:v66 count:16];
            }

            while (v27);
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue([v43 presentedViewController]);
          if (v32) {
            [v43 dismissViewControllerAnimated:0 completion:0];
          }
          uint64_t v23 = v44 + 1;
          id v9 = v40;
        }

        while ((id)(v44 + 1) != v41);
        id v41 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
      }

      while (v41);

      if ((v22 & 1) != 0)
      {
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
        v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100053D4C;
        v45[3] = &unk_100269200;
        v46 = v20;
        uint64_t v5 = v7;
        id v47 = v7;
        id v48 = v42;
        unsigned int v3 = v36;
        v49 = v36;
        dispatch_async(v34, v45);

        int v35 = 0;
        goto LABEL_39;
      }
    }

    else
    {
    }

    uint64_t v5 = v7;
    objc_msgSend(v7, "setViewControllers:", v42, v36);
    int v35 = 1;
    unsigned int v3 = v37;
LABEL_39:

    if (v3)
    {
LABEL_40:
      if (v35) {
        v3[2](v3);
      }
    }

- (TVMTimedLyricsViewController)timedLyricsViewController
{
  return (TVMTimedLyricsViewController *)objc_loadWeakRetained((id *)&self->_timedLyricsViewController);
}

- (void)setTimedLyricsViewController:(id)a3
{
}

- (NSTimer)screenSaverTimer
{
  return self->_screenSaverTimer;
}

- (void)setScreenSaverTimer:(id)a3
{
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (BOOL)isIdleTimerSuspended
{
  return self->_idleTimerSuspended;
}

- (void)setIdleTimerSuspended:(BOOL)a3
{
  self->_idleTimerSuspended = a3;
}

- (int64_t)minimumScreensaverDelayMinutes
{
  return self->_minimumScreensaverDelayMinutes;
}

- (void)setMinimumScreensaverDelayMinutes:(int64_t)a3
{
  self->_minimumScreensaverDelayMinutes = a3;
}

- (TVMusicNowPlayingViewPresenting)musicViewController
{
  return (TVMusicNowPlayingViewPresenting *)objc_loadWeakRetained((id *)&self->_musicViewController);
}

- (void)setMusicViewController:(id)a3
{
}

- (NSHashTable)visibleViewControllers
{
  return self->_visibleViewControllers;
}

- (void)setVisibleViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end