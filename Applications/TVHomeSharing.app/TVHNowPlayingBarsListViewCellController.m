@interface TVHNowPlayingBarsListViewCellController
+ (id)new;
- (BOOL)monitoringPlayer;
- (TVHListView)listView;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHNowPlayingBarsListViewCellController)init;
- (TVHNowPlayingBarsListViewCellController)initWithListView:(id)a3 dataSource:(id)a4 player:(id)a5;
- (TVPPlayer)player;
- (id)_currentMediaItem;
- (unint64_t)_nowPlayingBarsStateAtIndexPath:(id)a3 withCurrentMediaItem:(id)a4;
- (unint64_t)nowPlayingBarsStateAtIndexPath:(id)a3;
- (void)_startMonitoringPlayer;
- (void)_stopMonitoringPlayer;
- (void)_updateVisibleListViewCells;
- (void)dealloc;
- (void)setMonitoringPlayer:(BOOL)a3;
@end

@implementation TVHNowPlayingBarsListViewCellController

+ (id)new
{
  return 0LL;
}

- (TVHNowPlayingBarsListViewCellController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHNowPlayingBarsListViewCellController)initWithListView:(id)a3 dataSource:(id)a4 player:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHNowPlayingBarsListViewCellController;
  v12 = -[TVHNowPlayingBarsListViewCellController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listView, a3);
    objc_storeStrong((id *)&v13->_dataSource, a4);
    objc_storeStrong((id *)&v13->_player, a5);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHNowPlayingBarsListViewCellController;
  -[TVHNowPlayingBarsListViewCellController dealloc](&v3, "dealloc");
}

- (void)setMonitoringPlayer:(BOOL)a3
{
  if (self->_monitoringPlayer != a3)
  {
    BOOL v3 = a3;
    if (self->_monitoringPlayer) {
      -[TVHNowPlayingBarsListViewCellController _stopMonitoringPlayer](self, "_stopMonitoringPlayer");
    }
    self->_monitoringPlayer = v3;
    if (v3) {
      -[TVHNowPlayingBarsListViewCellController _startMonitoringPlayer](self, "_startMonitoringPlayer");
    }
    else {
      -[TVHNowPlayingBarsListViewCellController _stopMonitoringPlayer](self, "_stopMonitoringPlayer");
    }
  }

- (unint64_t)nowPlayingBarsStateAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentMediaItem]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItem]);
  }
  else {
    v8 = 0LL;
  }
  unint64_t v9 = -[TVHNowPlayingBarsListViewCellController _nowPlayingBarsStateAtIndexPath:withCurrentMediaItem:]( self,  "_nowPlayingBarsStateAtIndexPath:withCurrentMediaItem:",  v4,  v8);

  return v9;
}

- (void)_startMonitoringPlayer
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController player](self, "player"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleCurrentPlaybackMediaItemDidChangeNotification:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:v4];
  [v3 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:v4];
  -[TVHNowPlayingBarsListViewCellController _updateVisibleListViewCells](self, "_updateVisibleListViewCells");
}

- (void)_stopMonitoringPlayer
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController player](self, "player"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:TVPPlaybackCurrentMediaItemDidChangeNotification object:v4];
  [v3 removeObserver:self name:TVPPlaybackStateDidChangeNotification object:v4];
  -[TVHNowPlayingBarsListViewCellController _updateVisibleListViewCells](self, "_updateVisibleListViewCells");
}

- (id)_currentMediaItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController player](self, "player"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMediaItem]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItem]);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (unint64_t)_nowPlayingBarsStateAtIndexPath:(id)a3 withCurrentMediaItem:(id)a4
{
  if (!a4) {
    return 0LL;
  }
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController dataSource](self, "dataSource"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemAtIndexPath:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  LODWORD(v8) = [v10 isEqual:v11];

  if ((_DWORD)v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController player](self, "player"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 state]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));

    if (v13 == v14) {
      unint64_t v15 = 2LL;
    }
    else {
      unint64_t v15 = 1LL;
    }
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  return v15;
}

- (void)_updateVisibleListViewCells
{
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController _currentMediaItem](self, "_currentMediaItem"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingBarsListViewCellController listView](self, "listView"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexPathsForVisibleItems]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 cellForItemAtIndexPath:v9]);
        if ([v10 conformsToProtocol:&OBJC_PROTOCOL___TVHNowPlayingBarsListViewCell])
        {
          id v11 = v10;
          objc_msgSend( v11,  "setNowPlayingBarsState:",  -[TVHNowPlayingBarsListViewCellController _nowPlayingBarsStateAtIndexPath:withCurrentMediaItem:]( self,  "_nowPlayingBarsStateAtIndexPath:withCurrentMediaItem:",  v9,  v12));
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }
}

- (TVHListView)listView
{
  return self->_listView;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVPPlayer)player
{
  return self->_player;
}

- (BOOL)monitoringPlayer
{
  return self->_monitoringPlayer;
}

- (void).cxx_destruct
{
}

@end