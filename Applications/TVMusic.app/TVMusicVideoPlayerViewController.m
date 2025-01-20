@interface TVMusicVideoPlayerViewController
- (BOOL)isManuallyPausedState;
- (BOOL)isViewVisible;
- (MPCVideoOutput)videoOutput;
- (NSObject)becomeActiveNotification;
- (NSObject)favoriteStateChangedNotification;
- (NSObject)libraryUpdatedNotification;
- (NSObject)nowPlayingViewUpdatedNotification;
- (NSObject)updateControlsNotification;
- (TVMusicPlayer)player;
- (TVMusicVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVMusicVideoPlayerViewController)initWithPlayer:(id)a3;
- (UIViewController)playerViewController;
- (id)_favoriteButton;
- (id)_libraryButton;
- (unint64_t)_indexOfFavoriteButton;
- (unint64_t)_indexOfLibraryButton;
- (void)_addPlayerViewControllerIfNeeded;
- (void)_insertFavoriteButtonForVideoIsFavorited:(BOOL)a3;
- (void)_insertLibraryButtonForVideoInLibrary:(BOOL)a3;
- (void)_removeFavoriteButton;
- (void)_removeLibraryButton;
- (void)_updateVideoControlsMenu;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBecomeActiveNotification:(id)a3;
- (void)setFavoriteStateChangedNotification:(id)a3;
- (void)setLibraryUpdatedNotification:(id)a3;
- (void)setManuallyPausedState:(BOOL)a3;
- (void)setNowPlayingViewUpdatedNotification:(id)a3;
- (void)setUpdateControlsNotification:(id)a3;
- (void)setVideoOutput:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicVideoPlayerViewController

- (TVMusicVideoPlayerViewController)initWithPlayer:(id)a3
{
  id v5 = a3;
  v6 = -[TVMusicVideoPlayerViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_player, a3);
  }

  return v7;
}

- (TVMusicVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  v8 = -[TVMusicVideoPlayerViewController initWithNibName:bundle:](&v37, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000599A8;
    v34[3] = &unk_10026AE58;
    objc_copyWeak(&v35, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 addObserverForName:UIApplicationDidBecomeActiveNotification object:0 queue:v10 usingBlock:v34]);
    -[TVMusicVideoPlayerViewController setBecomeActiveNotification:](v8, "setBecomeActiveNotification:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000599D4;
    v32[3] = &unk_10026AE58;
    objc_copyWeak(&v33, &location);
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"TVMusicLibraryManagerLibraryUpdatedNotification" object:0 queue:v13 usingBlock:v32]);
    -[TVMusicVideoPlayerViewController setLibraryUpdatedNotification:](v8, "setLibraryUpdatedNotification:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100059A00;
    v30[3] = &unk_10026AE58;
    objc_copyWeak(&v31, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v15 addObserverForName:@"TVMusicNowPlayingDidUpdateView" object:0 queue:v16 usingBlock:v30]);
    -[TVMusicVideoPlayerViewController setNowPlayingViewUpdatedNotification:]( v8,  "setNowPlayingViewUpdatedNotification:",  v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100059A2C;
    v28[3] = &unk_10026AE58;
    objc_copyWeak(&v29, &location);
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v18 addObserverForName:@"_TVMusicVideoPlayerViewControllerUpdateControlsNotification" object:0 queue:v19 usingBlock:v28]);
    -[TVMusicVideoPlayerViewController setUpdateControlsNotification:](v8, "setUpdateControlsNotification:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVMNowPlayingFavoriteStateController didChangeFavoriteStateNotification]( &OBJC_CLASS___TVMNowPlayingFavoriteStateController,  "didChangeFavoriteStateNotification"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100059A58;
    v26[3] = &unk_10026AE58;
    objc_copyWeak(&v27, &location);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 addObserverForName:v22 object:0 queue:v23 usingBlock:v26]);
    -[TVMusicVideoPlayerViewController setFavoriteStateChangedNotification:]( v8,  "setFavoriteStateChangedNotification:",  v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController becomeActiveNotification](self, "becomeActiveNotification"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController becomeActiveNotification](self, "becomeActiveNotification"));
    [v4 removeObserver:v5];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController libraryUpdatedNotification](self, "libraryUpdatedNotification"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController libraryUpdatedNotification](self, "libraryUpdatedNotification"));
    [v7 removeObserver:v8];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicVideoPlayerViewController nowPlayingViewUpdatedNotification]( self,  "nowPlayingViewUpdatedNotification"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicVideoPlayerViewController nowPlayingViewUpdatedNotification]( self,  "nowPlayingViewUpdatedNotification"));
    [v10 removeObserver:v11];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController updateControlsNotification](self, "updateControlsNotification"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController updateControlsNotification](self, "updateControlsNotification"));
    [v13 removeObserver:v14];
  }

  videoOutput = self->_videoOutput;
  if (videoOutput) {
    -[MPCVideoOutput removeObserver:forKeyPath:context:]( videoOutput,  "removeObserver:forKeyPath:context:",  self,  @"isReadyForDisplay",  off_1002B6508);
  }
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController dealloc](&v16, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));
  [v3 setAccessibilityIdentifier:@"TVMusic.NowPlaying.VideoPlayerView"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));
  [v5 setBackgroundColor:v4];

  -[TVMusicVideoPlayerViewController _addPlayerViewControllerIfNeeded](self, "_addPlayerViewControllerIfNeeded");
  -[TVMusicVideoPlayerViewController _updateVideoControlsMenu](self, "_updateVideoControlsMenu");
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TVMusicVideoPlayerViewController setViewVisible:](self, "setViewVisible:", 1LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVMusicVideoPlayerViewController _removeLibraryButton](self, "_removeLibraryButton");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicVideoPlayerViewController;
  -[TVMusicVideoPlayerViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[TVMusicVideoPlayerViewController setViewVisible:](self, "setViewVisible:", 0LL);
}

- (UIViewController)playerViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController videoOutput](self, "videoOutput"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerViewController]);

  return (UIViewController *)v3;
}

- (void)setVideoOutput:(id)a3
{
  id v5 = (MPCVideoOutput *)a3;
  p_videoOutput = &self->_videoOutput;
  if (self->_videoOutput == v5) {
    goto LABEL_12;
  }
  v13 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 superview]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));

  if (v10 == v11)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    [v12 removeFromSuperview];

LABEL_6:
  }

  if (*p_videoOutput) {
    -[MPCVideoOutput removeObserver:forKeyPath:context:]( *p_videoOutput,  "removeObserver:forKeyPath:context:",  self,  @"isReadyForDisplay",  off_1002B6508);
  }
  objc_storeStrong((id *)&self->_videoOutput, a3);
  if (v13) {
    -[MPCVideoOutput addObserver:forKeyPath:options:context:]( v13,  "addObserver:forKeyPath:options:context:",  self,  @"isReadyForDisplay",  0LL,  off_1002B6508);
  }
  -[TVMusicVideoPlayerViewController _addPlayerViewControllerIfNeeded](self, "_addPlayerViewControllerIfNeeded");
  id v5 = v13;
LABEL_12:
}

- (void)_addPlayerViewControllerIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
  if (v3)
  {
    id v25 = v3;
    if (-[TVMusicVideoPlayerViewController isViewLoaded](self, "isViewLoaded"))
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));

      if (v6 == v7) {
        return;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      -[TVMusicVideoPlayerViewController addChildViewController:](self, "addChildViewController:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
      [v21 setAutoresizingMask:18];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self, "view"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 view]);
      [v22 addSubview:v24];

      id v25 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController playerViewController](self, "playerViewController"));
      [v25 didMoveToParentViewController:self];
    }

    v3 = v25;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1002B6508 == a6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10005A20C;
    v7[3] = &unk_100268CF0;
    v7[4] = self;
    objc_super v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005B338;
    block[3] = &unk_100268D60;
    id v9 = v6;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)_updateVideoControlsMenu
{
  if (_os_feature_enabled_impl("MediaPlayer", "Favoriting"))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[TVMNowPlayingFavoriteStateController sharedController]( &OBJC_CLASS___TVMNowPlayingFavoriteStateController,  "sharedController"));
    if ([v13 canBeFavorite])
    {
      id v3 = [v13 isFavorite];
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController _favoriteButton](self, "_favoriteButton"));
      id v5 = v4;
      if (v4) {
        [v4 setFavorited:v3];
      }
      else {
        -[TVMusicVideoPlayerViewController _insertFavoriteButtonForVideoIsFavorited:]( self,  "_insertFavoriteButtonForVideoIsFavorited:",  v3);
      }
    }

    else
    {
      -[TVMusicVideoPlayerViewController _removeFavoriteButton](self, "_removeFavoriteButton");
    }
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentPlayingItem]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataObject]);

    if ([v9 type] == (id)1
      && (double v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMSubscriptionManager sharedInstance]( TVMSubscriptionManager,  "sharedInstance")),  v11 = [v10 hasMusicSubscription],  v10,  v11))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v9 song]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10005A4F0;
      v14[3] = &unk_100268F50;
      v14[4] = self;
      +[TVMusicLibraryUtilities isSongInLibrary:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "isSongInLibrary:completionHandler:",  v12,  v14);
    }

    else
    {
      -[TVMusicVideoPlayerViewController _removeLibraryButton](self, "_removeLibraryButton");
    }
  }

- (void)_insertFavoriteButtonForVideoIsFavorited:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  &stru_100279068,  0LL,  @"TVMusic.vpvc.favorite",  &stru_10026B350));
  [v5 setFavorited:v3];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoOutput]);

  double v16 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
  if (v10
    && (unsigned int v11 = (void *)v10,
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]),
        id v13 = [v12 count],
        v12,
        v11,
        v13))
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v14]);
    [v8 setTransportBarCustomMenuItems:v15];
  }

  else
  {
    [v8 setTransportBarCustomMenuItems:v9];
  }
}

- (void)_removeFavoriteButton
{
  unint64_t v3 = -[TVMusicVideoPlayerViewController _indexOfFavoriteButton](self, "_indexOfFavoriteButton");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playQueue]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 videoOutput]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 transportBarCustomMenuItems]);
    id v8 = [v7 mutableCopy];

    [v8 removeObjectAtIndex:v4];
    [v9 setTransportBarCustomMenuItems:v8];
  }

- (id)_favoriteButton
{
  unint64_t v3 = -[TVMusicVideoPlayerViewController _indexOfFavoriteButton](self, "_indexOfFavoriteButton");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = 0LL;
  }

  else
  {
    unint64_t v5 = v3;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoOutput]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v5]);
  }

  return v4;
}

- (unint64_t)_indexOfFavoriteButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playQueue]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 videoOutput]);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transportBarCustomMenuItems]);
  id v6 = [v5 indexOfObjectPassingTest:&stru_10026B3B0];

  return (unint64_t)v6;
}

- (void)_insertLibraryButtonForVideoInLibrary:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  &stru_100279068,  0LL,  @"TVMusic.vpvc.add",  &stru_10026B3D0));
  [v5 setInLibrary:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoOutput]);

  double v16 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
  if (v10
    && (unsigned int v11 = (void *)v10,
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]),
        id v13 = [v12 count],
        v12,
        v11,
        v13))
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v14]);
    [v8 setTransportBarCustomMenuItems:v15];
  }

  else
  {
    [v8 setTransportBarCustomMenuItems:v9];
  }
}

- (void)_removeLibraryButton
{
  unint64_t v3 = -[TVMusicVideoPlayerViewController _indexOfLibraryButton](self, "_indexOfLibraryButton");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playQueue]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 videoOutput]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 transportBarCustomMenuItems]);
    id v8 = [v7 mutableCopy];

    [v8 removeObjectAtIndex:v4];
    [v9 setTransportBarCustomMenuItems:v8];
  }

- (id)_libraryButton
{
  unint64_t v3 = -[TVMusicVideoPlayerViewController _indexOfLibraryButton](self, "_indexOfLibraryButton");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = 0LL;
  }

  else
  {
    unint64_t v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoOutput]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transportBarCustomMenuItems]);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v5]);
  }

  return v4;
}

- (unint64_t)_indexOfLibraryButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController player](self, "player"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playQueue]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 videoOutput]);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transportBarCustomMenuItems]);
  id v6 = [v5 indexOfObjectPassingTest:&stru_10026B410];

  return (unint64_t)v6;
}

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (TVMusicPlayer)player
{
  return self->_player;
}

- (BOOL)isManuallyPausedState
{
  return self->_manuallyPausedState;
}

- (void)setManuallyPausedState:(BOOL)a3
{
  self->_manuallyPausedState = a3;
}

- (NSObject)becomeActiveNotification
{
  return self->_becomeActiveNotification;
}

- (void)setBecomeActiveNotification:(id)a3
{
}

- (NSObject)libraryUpdatedNotification
{
  return self->_libraryUpdatedNotification;
}

- (void)setLibraryUpdatedNotification:(id)a3
{
}

- (NSObject)nowPlayingViewUpdatedNotification
{
  return self->_nowPlayingViewUpdatedNotification;
}

- (void)setNowPlayingViewUpdatedNotification:(id)a3
{
}

- (NSObject)updateControlsNotification
{
  return self->_updateControlsNotification;
}

- (void)setUpdateControlsNotification:(id)a3
{
}

- (NSObject)favoriteStateChangedNotification
{
  return self->_favoriteStateChangedNotification;
}

- (void)setFavoriteStateChangedNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end