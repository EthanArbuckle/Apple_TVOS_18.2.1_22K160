@interface TVHPlaybackManager
- (BOOL)_isAnyPlaybackContextUsingDiskCaching;
- (BOOL)playbackContextMediaRemoteSessionShouldBecomeActive:(id)a3;
- (NSMutableSet)videoPlaybackContexts;
- (OS_dispatch_source)keepAliveTimer;
- (TVHInteractivePlaylistPlaybackContext)interactivePlaylistPlaybackContext;
- (TVHPlaybackManager)init;
- (TVHPlaybackManagerDelegate)delegate;
- (TVPPlayer)interactivePlaylistPlayer;
- (id)_allActivePlayers;
- (id)_allPlaybackContexts;
- (id)_allPlayers;
- (id)_currentFullScreenVideoPlaybackContext;
- (id)_currentPictureInPictureVideoPlaybackContext;
- (void)_addVideoPlaybackContext:(id)a3;
- (void)_handlePlaybackErrorNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_removeVideoPlaybackContext:(id)a3;
- (void)_sendKeepAlive;
- (void)_showPlaybackViewController:(id)a3 animate:(BOOL)a4 viewControllersToRemove:(id)a5;
- (void)_startKeepAliveTimerIfRequired;
- (void)_stopKeepAliveTimer;
- (void)_videoPlaybackContext:(id)a3 stateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)dealloc;
- (void)didDisconnectMediaLibraryWithIdentifier:(id)a3;
- (void)interactivePlaylistPlaybackContext:(id)a3 showMediaEntityCollectionForMediaItem:(id)a4 mediaEntityCollectionType:(unint64_t)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playPlaylist:(id)a3;
- (void)playPlaylist:(id)a3 andRemoveViewControllers:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInteractivePlaylistPlaybackContext:(id)a3;
- (void)setKeepAliveTimer:(id)a3;
- (void)setVideoPlaybackContexts:(id)a3;
- (void)systemServicePresentNowPlayingUI;
@end

@implementation TVHPlaybackManager

- (TVHPlaybackManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHPlaybackManager;
  v2 = -[TVHPlaybackManager init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVHInteractivePlaylistPlaybackContext);
    interactivePlaylistPlaybackContext = v2->_interactivePlaylistPlaybackContext;
    v2->_interactivePlaylistPlaybackContext = v3;

    -[TVHInteractivePlaylistPlaybackContext setDelegate:](v2->_interactivePlaylistPlaybackContext, "setDelegate:", v2);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    videoPlaybackContexts = v2->_videoPlaybackContexts;
    v2->_videoPlaybackContexts = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:0];
    [v7 addObserver:v2 selector:"_handlePlaybackErrorNotification:" name:TVPPlaybackErrorNotification object:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 systemServiceProxy]);
    [v9 registerNowPlayingDelegate:v2];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHPlaybackManager;
  -[TVHPlaybackManager dealloc](&v4, "dealloc");
}

- (TVPPlayer)interactivePlaylistPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (TVPPlayer *)v3;
}

- (void)playPlaylist:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  -[TVHPlaybackManager playPlaylist:andRemoveViewControllers:](self, "playPlaylist:andRemoveViewControllers:", v4, 0LL);
}

- (void)playPlaylist:(id)a3 andRemoveViewControllers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v8 = sub_100079E48();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allPlaybackContexts](self, "_allPlaybackContexts"));
    int v22 = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received playback request. playlist=%@, allPlaybackContexts=%@",  (uint8_t *)&v22,  0x16u);
  }

  if ([v6 isEligibleForPictureInPicture])
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 player]);
    [v12 setPlaylist:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPlaybackManager _currentPictureInPictureVideoPlaybackContext]( self,  "_currentPictureInPictureVideoPlaybackContext"));
    unsigned int v14 = [v13 isPlayingFirstItemInPlaylist:v6];
    id v15 = sub_100079E48();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Playlist is eligible for picture-in-picture, but the existing PiP content matches the first item of the playli st. Will move PiP content to fullscreen. playlist=%@",  (uint8_t *)&v22,  0xCu);
      }

      [v13 restorePictureInPictureVideoToFullscreen];
      v18 = 0LL;
    }

    else
    {
      if (v17)
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Playlist is eligible for picture-in-picture. Will allocate and use a new video playback context. playlist=%@",  (uint8_t *)&v22,  0xCu);
      }

      v21 = objc_alloc_init(&OBJC_CLASS___TVHVideoPlaybackContext);
      -[TVHPlaybackManager _addVideoPlaybackContext:](self, "_addVideoPlaybackContext:", v21);
      -[TVHVideoPlaybackContext configureWithPlaylist:canUseDiskCaching:]( v21,  "configureWithPlaylist:canUseDiskCaching:",  v6,  -[TVHPlaybackManager _isAnyPlaybackContextUsingDiskCaching]( self,  "_isAnyPlaybackContextUsingDiskCaching") ^ 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackContext playbackViewController](v21, "playbackViewController"));
    }
  }

  else
  {
    id v19 = sub_100079E48();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Playlist is not eligible for picture-in-picture. Will use the interactive playlist playback context. playlist=%@",  (uint8_t *)&v22,  0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
    objc_msgSend( v13,  "configureWithPlaylist:canUseDiskCaching:",  v6,  -[TVHPlaybackManager _isAnyPlaybackContextUsingDiskCaching]( self,  "_isAnyPlaybackContextUsingDiskCaching") ^ 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v13 playbackViewController]);
  }

  if (v18) {
    -[TVHPlaybackManager _showPlaybackViewController:animate:viewControllersToRemove:]( self,  "_showPlaybackViewController:animate:viewControllersToRemove:",  v18,  1LL,  v7);
  }
}

- (void)didDisconnectMediaLibraryWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allActivePlayers](self, "_allActivePlayers"));
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v8) playlist]);
        v10 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100059680;
        v13[3] = &unk_1000FE438;
        id v14 = v4;
        id v15 = v10;
        objc_super v11 = v10;
        objc_msgSend(v9, "tvh_enumeratePlayerMediaItemsWithBlock:", v13);
        [v9 removeItemsAtIndexes:v11];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }
}

- (void)systemServicePresentNowPlayingUI
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10005977C;
  v2[3] = &unk_1000FCEF8;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (BOOL)playbackContextMediaRemoteSessionShouldBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[TVHPlaybackManager _currentFullScreenVideoPlaybackContext]( self,  "_currentFullScreenVideoPlaybackContext"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVHPlaybackManager _currentPictureInPictureVideoPlaybackContext]( self,  "_currentPictureInPictureVideoPlaybackContext"));
  id v8 = (id)v7;
  if (v6 == v4) {
    goto LABEL_8;
  }
  if (v5 == v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 state]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

    if (v11 != v12 || v6)
    {
      if (v8 != v4 || v6) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }

- (void)interactivePlaylistPlaybackContext:(id)a3 showMediaEntityCollectionForMediaItem:(id)a4 mediaEntityCollectionType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager delegate](self, "delegate"));
  [v8 playbackManager:self showMediaEntityCollectionForMediaItem:v7 mediaEntityCollectionType:a5];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (off_1001568E0 == a6)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVHVideoPlaybackContext);
    id v13 = v10;
    id v14 = v13;
    if (v12)
    {
      if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
        id v15 = v14;
      }
      else {
        id v15 = 0LL;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    id v16 = v15;

    if (v16)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_safeNumberForKey:", NSKeyValueChangeOldKey));
      id v18 = [v17 unsignedIntegerValue];

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_safeNumberForKey:", NSKeyValueChangeNewKey));
      id v20 = [v19 unsignedIntegerValue];

      -[TVHPlaybackManager _videoPlaybackContext:stateDidChangeFrom:to:]( self,  "_videoPlaybackContext:stateDidChangeFrom:to:",  v16,  v18,  v20);
    }
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___TVHPlaybackManager;
    -[TVHPlaybackManager observeValueForKeyPath:ofObject:change:context:]( &v21,  "observeValueForKeyPath:ofObject:change:context:",  a3,  v10,  v11,  a6);
  }
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allActivePlayers](self, "_allActivePlayers", a3));
  if ([v4 count]) {
    -[TVHPlaybackManager _startKeepAliveTimerIfRequired](self, "_startKeepAliveTimerIfRequired");
  }
  else {
    -[TVHPlaybackManager _stopKeepAliveTimer](self, "_stopKeepAliveTimer");
  }
}

- (void)_handlePlaybackErrorNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPPlayer);
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  id v10 = v9;

  id v16 = (id)objc_claimAutoreleasedReturnValue([v10 currentMediaItem]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:TVPPlaybackErrorKey]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v16, v13) & 1) != 0 && v12)
  {
    id v14 = v16;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager delegate](self, "delegate"));
    [v15 playbackManager:self playbackOfMediaItem:v14 didFailWithError:v12];
  }
}

- (void)_startKeepAliveTimerIfRequired
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager keepAliveTimer](self, "keepAliveTimer"));

  id v4 = sub_100079E48();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "KeepAlive timer is already running. No need to start it again.",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Starting KeepAlive timer.",  (uint8_t *)buf,  2u);
    }

    id v5 = (os_log_s *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    -[TVHPlaybackManager setKeepAliveTimer:](self, "setKeepAliveTimer:", v5);
    dispatch_time_t v7 = dispatch_time(0LL, 45000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v7, 0xA7A358200uLL, 0LL);
    objc_initWeak(buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100059E24;
    handler[3] = &unk_1000FCEF8;
    objc_copyWeak(&v9, buf);
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    dispatch_resume((dispatch_object_t)v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)_stopKeepAliveTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager keepAliveTimer](self, "keepAliveTimer"));

  if (v3)
  {
    id v4 = sub_100079E48();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping KeepAlive timer.", v7, 2u);
    }

    BOOL v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager keepAliveTimer](self, "keepAliveTimer"));
    dispatch_source_cancel(v6);

    -[TVHPlaybackManager setKeepAliveTimer:](self, "setKeepAliveTimer:", 0LL);
  }

- (void)_sendKeepAlive
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v20 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allActivePlayers](self, "_allActivePlayers"));
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v8) currentMediaItem]);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
        id v11 = v9;
        uint64_t v12 = v11;
        if (v10)
        {
          if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0LL;
          }
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        id v14 = v13;

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaItem]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mediaServerIdentifier]);
          -[NSMutableSet addObject:](v3, "addObject:", v16);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v6);
  }

  id v17 = sub_100079E48();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sending KeepAlives for media servers [%@]",  buf,  0xCu);
  }

  if (-[NSMutableSet count](v3, "count"))
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager delegate](v20, "delegate"));
    [v19 playbackManager:v20 sendKeepAlivesForMediaServerIdentifiers:v3];
  }
}

- (void)_showPlaybackViewController:(id)a3 animate:(BOOL)a4 viewControllersToRemove:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  if ([v9 supportsPictureInPicture])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 player]);
    [v11 setPlaylist:0];
  }

  if (v5) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager delegate](self, "delegate"));
  [v13 playbackManager:self showPlaybackViewController:v9 options:v12 viewControllersToRemove:v8];
}

- (id)_allPlaybackContexts
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager interactivePlaylistPlaybackContext](self, "interactivePlaylistPlaybackContext"));
  -[NSMutableSet bs_safeAddObject:](v3, "bs_safeAddObject:", v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
  -[NSMutableSet unionSet:](v3, "unionSet:", v5);

  id v6 = -[NSMutableSet copy](v3, "copy");
  return v6;
}

- (id)_allPlayers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allPlaybackContexts](self, "_allPlaybackContexts"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_map:", &stru_1000FE478));

  return v3;
}

- (id)_allActivePlayers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allPlayers](self, "_allPlayers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_filter:", &stru_1000FE4B8));

  return v3;
}

- (id)_currentPictureInPictureVideoPlaybackContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_firstObjectPassingTest:", &stru_1000FE4F8));

  return v3;
}

- (id)_currentFullScreenVideoPlaybackContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_firstObjectPassingTest:", &stru_1000FE518));

  return v3;
}

- (BOOL)_isAnyPlaybackContextUsingDiskCaching
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager _allPlaybackContexts](self, "_allPlaybackContexts"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_firstObjectPassingTest:", &stru_1000FE558));

  return v3 != 0LL;
}

- (void)_videoPlaybackContext:(id)a3 stateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  if (a5 == 3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPlaybackManager _currentFullScreenVideoPlaybackContext]( self,  "_currentFullScreenVideoPlaybackContext"));

    if (!v9)
    {
      id v10 = sub_100079E48();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PiP has started and we don't have a fullscreen video playing so we are transitioning from fullscreen playback to PiP. Will remove the placeholder playback view controller",  (uint8_t *)&v17,  2u);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager delegate](self, "delegate"));
      [v12 playbackManager:self removePlaybackViewControllerAnimated:0];
LABEL_12:
    }
  }

  else
  {
    if (a4 && a5 == 1)
    {
      id v13 = sub_100079E48();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Video playback is being restored to fullscreen. videoPlaybackContext=%@",  (uint8_t *)&v17,  0xCu);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackViewController]);
      if (v12) {
        -[TVHPlaybackManager _showPlaybackViewController:animate:viewControllersToRemove:]( self,  "_showPlaybackViewController:animate:viewControllersToRemove:",  v12,  0LL,  0LL);
      }
      goto LABEL_12;
    }

    if (!a5)
    {
      id v15 = sub_100079E48();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Video playback context has finished. Will remove it. videoPlaybackContext=%@",  (uint8_t *)&v17,  0xCu);
      }

      -[TVHPlaybackManager _removeVideoPlaybackContext:](self, "_removeVideoPlaybackContext:", v8);
    }
  }
}

- (void)_addVideoPlaybackContext:(id)a3
{
  id v4 = off_1001568E0;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"state" options:3 context:v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
  [v6 addObject:v5];
}

- (void)_removeVideoPlaybackContext:(id)a3
{
  id v4 = off_1001568E0;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"state" context:v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
  [v6 removeObject:v5];
}

- (TVHPlaybackManagerDelegate)delegate
{
  return (TVHPlaybackManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHInteractivePlaylistPlaybackContext)interactivePlaylistPlaybackContext
{
  return self->_interactivePlaylistPlaybackContext;
}

- (void)setInteractivePlaylistPlaybackContext:(id)a3
{
}

- (NSMutableSet)videoPlaybackContexts
{
  return self->_videoPlaybackContexts;
}

- (void)setVideoPlaybackContexts:(id)a3
{
}

- (OS_dispatch_source)keepAliveTimer
{
  return self->_keepAliveTimer;
}

- (void)setKeepAliveTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end