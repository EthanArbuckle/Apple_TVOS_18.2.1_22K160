@interface TVHInteractivePlaylistPlaybackContext
+ (id)_contextMenuDataWithMenuItems:(id)a3 title:(id)a4 artistName:(id)a5;
+ (id)_mediaItemForPlayerMediaItem:(id)a3;
- (BOOL)playbackViewControllerProvidesCustomControls:(id)a3;
- (BOOL)session:(id)a3 repeatEnabledForCurrentMediaItem:(id)a4;
- (BOOL)session:(id)a3 shuffleEnabledForCurrentMediaItem:(id)a4;
- (BOOL)session:(id)a3 skipEnabledForCurrentMediaItem:(id)a4;
- (BOOL)sessionShouldBecomeActiveIfPossible:(id)a3;
- (BOOL)usingDiskCaching;
- (NSString)description;
- (TVHInteractivePlaylistPlaybackContext)init;
- (TVHPlaybackContextDelegate)delegate;
- (TVHPlaybackViewController)playbackViewController;
- (TVHPlayer)player;
- (id)_displayAlbumArtistMenuWithPlayerMediaItem:(id)a3;
- (id)_displayAlbumMenuWithPlayerMediaItem:(id)a3;
- (id)_displayCollectionURLForMediaItem:(id)a3 collectionType:(unint64_t)a4;
- (int64_t)currentEndpointDeviceTypeForPlaybackViewController:(id)a3;
- (int64_t)session:(id)a3 editingStyleFlagsForMediaItem:(id)a4;
- (void)_displayCollectionForMediaItem:(id)a3 collectionType:(unint64_t)a4;
- (void)_handleMusicNowPlayingWillAppearNotification:(id)a3;
- (void)_handleMusicNowPlayingWillDisappearNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)configureWithPlaylist:(id)a3 canUseDiskCaching:(BOOL)a4;
- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)playbackViewController:(id)a3 controlsForMediaItem:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setUsingDiskCaching:(BOOL)a3;
@end

@implementation TVHInteractivePlaylistPlaybackContext

- (TVHInteractivePlaylistPlaybackContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHInteractivePlaylistPlaybackContext;
  v2 = -[TVHInteractivePlaylistPlaybackContext init](&v8, "init");
  if (v2)
  {
    v3 = -[TVHPlayer initWithName:](objc_alloc(&OBJC_CLASS___TVHPlayer), "initWithName:", @"InteractivePlaylist");
    player = v2->_player;
    v2->_player = v3;

    -[TVHPlayer setPausesOnRouteChange:](v2->_player, "setPausesOnRouteChange:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlayer mediaRemoteNowPlayingSession](v2->_player, "mediaRemoteNowPlayingSession"));
    [v5 setDelegate:v2];

    -[TVHPlayer setUsesMediaRemoteNowPlayingSession:](v2->_player, "setUsesMediaRemoteNowPlayingSession:", 1LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:v2->_player];
    [v6 addObserver:v2 selector:"_handleMusicNowPlayingWillAppearNotification:" name:TVPMusicNowPlayingWillAppear object:0];
    [v6 addObserver:v2 selector:"_handleMusicNowPlayingWillDisappearNotification:" name:TVPMusicNowPlayingWillDisappear object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHInteractivePlaylistPlaybackContext;
  -[TVHInteractivePlaylistPlaybackContext dealloc](&v4, "dealloc");
}

- (TVHPlaybackViewController)playbackViewController
{
  v3 = objc_alloc(&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackContext player](self, "player"));
  v5 = -[TVHInteractivePlaylistPlaybackViewController initWithPlayer:](v3, "initWithPlayer:", v4);

  return (TVHPlaybackViewController *)v5;
}

- (void)configureWithPlaylist:(id)a3 canUseDiskCaching:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100079E48();
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Configuring interactive playlist playback controller. playlist=%@. canUseDiskCaching=%{BOOL}d",  (uint8_t *)&v11,  0x12u);
  }

  -[TVHInteractivePlaylistPlaybackContext setUsingDiskCaching:](self, "setUsingDiskCaching:", v4);
  objc_msgSend(v6, "tvh_updateMediaItemsAllowsDiskCaching:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackContext player](self, "player"));
  [v9 setErrorBehavior:1];
  [v9 setPlaylist:v6];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioSession sharedInstance](&OBJC_CLASS___TVPAudioSession, "sharedInstance"));
  [v10 setConfigurationBlock:&stru_1000FDF80];
}

- (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHInteractivePlaylistPlaybackContext _displayAlbumArtistMenuWithPlayerMediaItem:]( self,  "_displayAlbumArtistMenuWithPlayerMediaItem:",  v7));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v16, "tvhk_addObjectIfNotNil:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHInteractivePlaylistPlaybackContext _displayAlbumMenuWithPlayerMediaItem:]( self,  "_displayAlbumMenuWithPlayerMediaItem:",  v7));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v16, "tvhk_addObjectIfNotNil:", v9);

  id v10 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v11 = [v10 initWithIdentifier:TVPMusicContextMenuPlayNextIdentifier actionBlock:0];
  -[NSMutableArray addObject:](v16, "addObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:TVPMediaItemMetadataTitle]);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:TVPMediaItemMetadataArtist]);

  id v14 = [(id)objc_opt_class(self) _contextMenuDataWithMenuItems:v16 title:v12 artistName:v13];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v6[2](v6, v15);
}

- (int64_t)currentEndpointDeviceTypeForPlaybackViewController:(id)a3
{
  return 0LL;
}

- (BOOL)playbackViewControllerProvidesCustomControls:(id)a3
{
  return 1;
}

- (void)playbackViewController:(id)a3 controlsForMediaItem:(id)a4 completionHandler:(id)a5
{
  v5 = (void (**)(id, void *))a5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVPMusicNowPlayingControlItem contextControlItem]( &OBJC_CLASS___TVPMusicNowPlayingControlItem,  "contextControlItem"));
  objc_super v8 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v5[2](v5, v7);
}

- (BOOL)sessionShouldBecomeActiveIfPossible:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackContext delegate](self, "delegate", a3));
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
  return 1;
}

- (BOOL)session:(id)a3 shuffleEnabledForCurrentMediaItem:(id)a4
{
  return 1;
}

- (BOOL)session:(id)a3 skipEnabledForCurrentMediaItem:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItem]);
  }
  else {
    unsigned __int8 v6 = 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  id v8 = [v7 mediaCategoryType];

  return v8 != (id)1;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendBool:self->_usingDiskCaching withName:@"usingDiskCaching"];
  id v5 = [v3 appendObject:self->_player withName:@"player"];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (void)_handleMusicNowPlayingWillAppearNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController);
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

  [v9 setPlaybackDelegate:self];
}

- (void)_handleMusicNowPlayingWillDisappearNotification:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  [v8 setPlaybackDelegate:0];
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVPPlaybackStateNewStateKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v5 == v6)
  {
    -[TVHInteractivePlaylistPlaybackContext setUsingDiskCaching:](self, "setUsingDiskCaching:", 0LL);
    id v7 = sub_100079E48();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Playback has stopped. Have reset -usingDiskCaching. context=%@",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (id)_displayAlbumMenuWithPlayerMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _mediaItemForPlayerMediaItem:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 type]),
        id v9 = [v8 mediaCategoryType],
        v8,
        v9 == (id)1))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"MUSIC_GO_TO_ALBUM" value:0 table:0]);

    objc_initWeak(&location, self);
    id v12 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000423D4;
    v15[3] = &unk_1000FDB38;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    id v13 = [v12 initWithTitle:v11 actionBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)_displayAlbumArtistMenuWithPlayerMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _mediaItemForPlayerMediaItem:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 type]),
        id v9 = [v8 mediaCategoryType],
        v8,
        v9 == (id)1))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"MUSIC_GO_TO_ARTIST" value:0 table:0]);

    objc_initWeak(&location, self);
    id v12 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100042590;
    v15[3] = &unk_1000FDB38;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    id v13 = [v12 initWithTitle:v11 actionBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (void)_displayCollectionForMediaItem:(id)a3 collectionType:(unint64_t)a4
{
  id v10 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v7 = [v6 applicationState];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHInteractivePlaylistPlaybackContext _displayCollectionURLForMediaItem:collectionType:]( self,  "_displayCollectionURLForMediaItem:collectionType:",  v10,  a4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v9 openURL:v8 options:&__NSDictionary0__struct completionHandler:0];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackContext delegate](self, "delegate"));
    if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TVHInteractivePlaylistPlaybackContextDelegate]) {
      [v8 interactivePlaylistPlaybackContext:self showMediaEntityCollectionForMediaItem:v10 mediaEntityCollectionType:a4];
    }
  }
}

- (id)_displayCollectionURLForMediaItem:(id)a3 collectionType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___TVHURLBuilder);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaServerIdentifier]);
  id v8 = -[TVHURLBuilder initWithMediaServerIdentifier:](v6, "initWithMediaServerIdentifier:", v7);

  if (a4 == 1)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVHURLBuilder displayAlbumURLForMediaItem:](v8, "displayAlbumURLForMediaItem:", v5));
  }

  else
  {
    if (a4 != 2)
    {
      id v10 = 0LL;
      goto LABEL_7;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVHURLBuilder displayAlbumArtistURLForMediaItem:](v8, "displayAlbumArtistURLForMediaItem:", v5));
  }

  id v10 = (void *)v9;
LABEL_7:

  return v10;
}

+ (id)_mediaItemForPlayerMediaItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItem]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_contextMenuDataWithMenuItems:(id)a3 title:(id)a4 artistName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    if ([v8 length]) {
      id v10 = v8;
    }
    else {
      id v10 = v9;
    }
    id v11 = v10;
    if ([v8 length] && objc_msgSend(v9, "length"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"SONG_BY_ARTIST_FORMAT" value:0 table:0]);

      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v8, v9));
      id v11 = (id)v14;
    }

    id v15 = [[TVPMusicContextMenuData alloc] initWithHeading:v11 menuItems:v7];
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
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

- (void).cxx_destruct
{
}

@end