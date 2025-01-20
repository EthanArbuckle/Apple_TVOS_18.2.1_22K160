@interface MTTVNowPlayingViewController
- (BOOL)_tvTabBarShouldAutohide;
- (BOOL)isRemoteViewService;
- (IMActionController)actionController;
- (MTTVNowPlayingViewController)init;
- (TVPPlayback)playback;
- (TVPPlaybackViewController)playbackViewController;
- (UITabBarController)tabBarController;
- (id)_menuItemsForActionController:(id)a3;
- (id)musicNowPlayingViewController;
- (id)musicPlayQueue;
- (id)rootNavigationController;
- (id)routePickerControlForPlaybackViewController:(id)a3;
- (int64_t)currentEndpointDeviceTypeForPlaybackViewController:(id)a3;
- (void)_nowPlayingViewWillAppear:(id)a3;
- (void)_playbackQueueDidChange:(id)a3;
- (void)_playerPathChanged:(id)a3;
- (void)_updateAudioRoute;
- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)setActionController:(id)a3;
- (void)setPlayback:(id)a3;
- (void)setPlaybackViewController:(id)a3;
- (void)setRemoteViewService:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MTTVNowPlayingViewController

- (MTTVNowPlayingViewController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVPlayerManager defaultPlayer](&OBJC_CLASS___MTTVPlayerManager, "defaultPlayer"));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVNowPlayingViewController;
  v4 = -[MTTVNowPlayingViewController initWithPlayer:invalidateWhenDone:initialPlaybackType:]( &v10,  "initWithPlayer:invalidateWhenDone:initialPlaybackType:",  v3,  0LL,  1LL);
  v5 = v4;
  if (v4)
  {
    -[MTTVNowPlayingViewController setPlayback:](v4, "setPlayback:", v3);
    -[MTTVNowPlayingViewController setShowsTitleWhileLoading:](v5, "setShowsTitleWhileLoading:", 1LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v5 selector:"_nowPlayingViewWillAppear:" name:TVPPlaybackViewWillAppearNotification object:0];
    [v6 addObserver:v5 selector:"_nowPlayingViewWillDisappear:" name:TVPPlaybackViewWillDisappearNotification object:0];
    [v6 addObserver:v5 selector:"_nowPlayingViewWillLoad:" name:TVPPlaybackViewWillLoadNotification object:0];
    [v6 addObserver:v5 selector:"_playbackQueueDidChange:" name:@"TVMusicPlayQueueChangedNotification" object:v3];
    uint64_t v7 = MTApplicationDidBecomeActiveNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v6 addObserver:v5 selector:"_appDidBecomeActive:" name:v7 object:v8];

    [v6 addObserver:v5 selector:"_playerPathChanged:" name:@"TVMusicPlayQueuePlayerPathChangedNotification" object:0];
    [v6 addObserver:v5 selector:"_audioRouteDidChange:" name:MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification object:0];
  }

  return v5;
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVNowPlayingViewController;
  -[MTTVNowPlayingViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  if (a3) {
    -[MTTVNowPlayingViewController setHasBeenRemovedFromParentViewController:]( self,  "setHasBeenRemovedFromParentViewController:",  0LL);
  }
}

- (BOOL)_tvTabBarShouldAutohide
{
  return 1;
}

- (void)setPlaybackViewController:(id)a3
{
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicPlayQueue](self, "musicPlayQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v7 audioRoute]);
  [v5 setEndpointRoute:v6];
}

- (id)musicNowPlayingViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController playbackViewController](self, "playbackViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentChildViewController]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVPMusicNowPlayingViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)musicPlayQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController playback](self, "playback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playlist]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTTVMusicPlayQueue);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  v6 = (void (**)(id, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 podcastEpisode]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaPlayerEpisodeLookupUtil findEpisodeFromModelObject:]( &OBJC_CLASS___MTMediaPlayerEpisodeLookupUtil,  "findEpisodeFromModelObject:",  v8));
  if (v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v19 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPCResponseItem"]);
    v11 = -[IMActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVPlaybackEpisodeActionController),  "initWithDelegate:",  self);
    -[MTTVEpisodeActionController setResponseItem:](v11, "setResponseItem:", v10);
    -[IMActionController setActionObject:](v11, "setActionObject:", v9);
    actionController = self->_actionController;
    self->_actionController = &v11->super.super.super;
  }

  else
  {
    v13 = -[IMActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTStoreActionController),  "initWithDelegate:",  self);
    v14 = self->_actionController;
    self->_actionController = &v13->super.super;

    -[IMActionController setActionObject:](self->_actionController, "setActionObject:", v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self->_actionController, "moreAction"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 titleForAlertController]);

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVNowPlayingViewController _menuItemsForActionController:]( self,  "_menuItemsForActionController:",  self->_actionController));
  id v18 = [[TVPMusicContextMenuData alloc] initWithHeading:v16 menuItems:v17];
  v6[2](v6, v18);
}

- (int64_t)currentEndpointDeviceTypeForPlaybackViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPath]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 route]);

  if ([v5 isHomePodRoute])
  {
    else {
      int64_t v6 = 2LL;
    }
  }

  else
  {
    int64_t v6 = [v5 isAppleTVRoute];
  }

  return v6;
}

- (id)routePickerControlForPlaybackViewController:(id)a3
{
  routePickerButton = self->_routePickerButton;
  if (!routePickerButton)
  {
    id v5 = -[AVRoutePickerView initWithFrame:]( objc_alloc(&OBJC_CLASS___AVRoutePickerView),  "initWithFrame:",  0.0,  0.0,  40.0,  40.0);
    int64_t v6 = self->_routePickerButton;
    self->_routePickerButton = v5;

    -[AVRoutePickerView setRoutePickerButtonStyle:](self->_routePickerButton, "setRoutePickerButtonStyle:", 0LL);
    routePickerButton = self->_routePickerButton;
  }

  return routePickerButton;
}

- (id)_menuItemsForActionController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 availableActions]);
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v10 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10005E024;
        v16[3] = &unk_10023FF98;
        v16[4] = v9;
        id v12 = [v10 initWithTitle:v11 actionBlock:v16];

        -[NSMutableArray addObject:](v4, "addObject:", v12);
      }

      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  id v13 = -[NSMutableArray copy](v4, "copy");
  return v13;
}

- (id)rootNavigationController
{
  if (-[MTTVNowPlayingViewController isRemoteViewService](self, "isRemoteViewService"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController navigationController](self, "navigationController"));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 rootNavController]);
  }

  return v3;
}

- (UITabBarController)tabBarController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVNowPlayingViewController;
  v2 = -[MTTVNowPlayingViewController tabBarController](&v4, "tabBarController");
  return (UITabBarController *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)_nowPlayingViewWillAppear:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[MTTVNowPlayingViewController setPlaybackViewController:](self, "setPlaybackViewController:", v5);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicNowPlayingViewController](self, "musicNowPlayingViewController"));
  [v4 setShowAnimatedBackground:1];

  -[MTTVNowPlayingViewController _updateAudioRoute](self, "_updateAudioRoute");
}

- (void)_playbackQueueDidChange:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicNowPlayingViewController](self, "musicNowPlayingViewController", a3));
  [v3 reloadPlaylist];
}

- (void)_playerPathChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicNowPlayingViewController](self, "musicNowPlayingViewController"));
  [v4 reloadPlaylist];
}

- (void)_updateAudioRoute
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicPlayQueue](self, "musicPlayQueue"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 audioRoute]);

  -[TVPPlaybackViewController setEndpointRoute:](self->_playbackViewController, "setEndpointRoute:", v6);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNowPlayingViewController musicNowPlayingViewController](self, "musicNowPlayingViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlaybackViewController endpointRoute](self->_playbackViewController, "endpointRoute"));
  [v4 setEndpointRoute:v5];
}

- (TVPPlayback)playback
{
  return self->_playback;
}

- (void)setPlayback:(id)a3
{
}

- (BOOL)isRemoteViewService
{
  return self->_remoteViewService;
}

- (void)setRemoteViewService:(BOOL)a3
{
  self->_remoteViewService = a3;
}

- (IMActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
}

- (TVPPlaybackViewController)playbackViewController
{
  return self->_playbackViewController;
}

- (void).cxx_destruct
{
}

@end