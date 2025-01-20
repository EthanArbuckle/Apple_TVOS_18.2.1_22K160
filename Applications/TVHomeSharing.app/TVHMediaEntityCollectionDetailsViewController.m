@interface TVHMediaEntityCollectionDetailsViewController
+ (CGSize)listViewCellSize;
+ (TVHMediaEntityCollectionDetailsViewController)new;
- (BOOL)_delegateShouldAutoplayMediaItems;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (Class)listViewCellClass;
- (NSArray)mediaItems;
- (TVHCollectionViewChangeSetDataSource)changeSetDataSource;
- (TVHKBackgroundImageInfo)backgroundImageInfo;
- (TVHKMediaEntityCollection)mediaEntityCollection;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntityCollectionDetailsViewController)init;
- (TVHMediaEntityCollectionDetailsViewController)initWithCoder:(id)a3;
- (TVHMediaEntityCollectionDetailsViewController)initWithMediaEntityCollection:(id)a3 mediaLibrary:(id)a4 imageShape:(unint64_t)a5 backgroundImageInfo:(id)a6;
- (TVHMediaEntityCollectionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMediaEntityCollectionDetailsViewControllerDelegate)delegate;
- (TVHNowPlayingBarsListViewCellController)nowPlayingBarsController;
- (TVHPreviewingListViewController)previewingListViewController;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)moreContextMenuActionsForMediaEntityCollectionPreviewPlaybackControlsView:(id)a3;
- (id)moreContextMenuTitleForMediaEntityCollectionPreviewPlaybackControlsView:(id)a3;
- (unint64_t)_delegateContextMenuOptionsForMediaItem:(id)a3;
- (unint64_t)imageShape;
- (unint64_t)previewType;
- (void)_addPreviewView;
- (void)_delegateConfigureCell:(id)a3 atIndexPath:(id)a4;
- (void)_delegateUpdateHeaderView;
- (void)_startPlaybackOfMediaItems:(id)a3 atIndex:(unint64_t)a4;
- (void)_updateBackgroundImage;
- (void)_updateDescriptionPreviewViewAtIndexPath:(id)a3;
- (void)_updatePreviewView;
- (void)_updatePreviewView:(id)a3;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)loadView;
- (void)mediaEntityCollectionContentDescriptionPreviewViewDidSelectContentDescription:(id)a3;
- (void)mediaEntityCollectionPreviewPlaybackControlsViewDidSelectMoreButton:(id)a3;
- (void)mediaEntityCollectionPreviewPlaybackControlsViewDidSelectShuffleButton:(id)a3;
- (void)setBackgroundImageInfo:(id)a3;
- (void)setChangeSetDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListViewCellClass:(Class)a3;
- (void)setMediaEntityCollection:(id)a3;
- (void)setMediaItems:(id)a3 changeSet:(id)a4;
- (void)setNowPlayingBarsController:(id)a3;
- (void)setPreviewType:(unint64_t)a3;
- (void)setPreviewingListViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMediaEntityCollectionDetailsViewController

+ (TVHMediaEntityCollectionDetailsViewController)new
{
  return 0LL;
}

- (TVHMediaEntityCollectionDetailsViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntityCollectionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaEntityCollectionDetailsViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntityCollectionDetailsViewController)initWithMediaEntityCollection:(id)a3 mediaLibrary:(id)a4 imageShape:(unint64_t)a5 backgroundImageInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaEntityCollection");
  }
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController;
  v14 = -[TVHMediaEntityCollectionDetailsViewController initWithNibName:bundle:]( &v22,  "initWithNibName:bundle:",  0LL,  0LL);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mediaEntityCollection, a3);
    objc_storeStrong((id *)&v15->_mediaLibrary, a4);
    v15->_imageShape = a5;
    objc_storeStrong((id *)&v15->_backgroundImageInfo, a6);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVHListViewCell);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    Class listViewCellClass = v15->_listViewCellClass;
    v15->_Class listViewCellClass = (Class)v17;

    v19 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"MediaItemsFetchResultIdentifier");
    dataSource = v15->_dataSource;
    v15->_dataSource = v19;
  }

  return v15;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "shouldAutoplayMediaItemsForMediaEntityCol lectionDetailsViewController:") & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector( v5,  "mediaEntityCollectionDetailsViewController:contextMenuOptionsForMediaItem:");

  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
}

+ (CGSize)listViewCellSize
{
  double v2 = 846.0;
  double v3 = 90.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewType:(unint64_t)a3
{
  if (self->_previewType != a3)
  {
    self->_previewType = a3;
  }

- (void)setMediaEntityCollection:(id)a3
{
  id v5 = (TVHKMediaEntityCollection *)a3;
  if (self->_mediaEntityCollection != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_mediaEntityCollection, a3);
    unsigned int v6 = -[TVHMediaEntityCollectionDetailsViewController isViewLoaded](self, "isViewLoaded");
    id v5 = v7;
    if (v6)
    {
      -[TVHMediaEntityCollectionDetailsViewController _updatePreviewView](self, "_updatePreviewView");
      -[TVHMediaEntityCollectionDetailsViewController _delegateUpdateHeaderView](self, "_delegateUpdateHeaderView");
      id v5 = v7;
    }
  }
}

- (void)setBackgroundImageInfo:(id)a3
{
  id v5 = a3;
  if (-[TVHKBackgroundImageInfo isEqual:](self->_backgroundImageInfo, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_backgroundImageInfo, a3);
  }
}

- (NSArray)mediaItems
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntities]);

  return (NSArray *)v3;
}

- (void)setMediaItems:(id)a3 changeSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  @"MediaItemsFetchResultIdentifier",  v7);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v8, "setChangeSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  id v11 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v9 updateWithMediaEntitiesDataSourceFetchResults:v10];
}

- (void)loadView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  -[TVHMediaEntityCollectionDetailsViewController setView:](self, "setView:", v12);
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController;
  -[TVHMediaEntityCollectionDetailsViewController viewDidLoad](&v28, "viewDidLoad");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = -[TVHPreviewingListViewController initWithItemSize:]( objc_alloc(&OBJC_CLASS___TVHPreviewingListViewController),  "initWithItemSize:",  846.0,  90.0);
  -[TVHMediaEntityCollectionDetailsViewController setPreviewingListViewController:]( self,  "setPreviewingListViewController:",  v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](v12, "listView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 interactivePlaylistPlayer]);

  uint64_t v16 = objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsListViewCellController);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  v24 = (void *)v15;
  v18 = -[TVHNowPlayingBarsListViewCellController initWithListView:dataSource:player:]( v16,  "initWithListView:dataSource:player:",  v13,  v17,  v15);

  -[TVHMediaEntityCollectionDetailsViewController setNowPlayingBarsController:]( self,  "setNowPlayingBarsController:",  v18);
  -[TVHNowPlayingBarsListViewCellController setMonitoringPlayer:](v18, "setMonitoringPlayer:", 1LL);
  v19 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntityCollectionHeaderView);
  -[TVHPreviewingListViewController setListHeaderViewMargin:](v12, "setListHeaderViewMargin:", 76.0, 0.0, 66.0, 0.0);
  -[TVHPreviewingListViewController setListHeaderView:](v12, "setListHeaderView:", v19);
  -[TVHPreviewingListViewController setPreviewOnRightSide:](v12, "setPreviewOnRightSide:", 1LL);
  -[TVHPreviewingListViewController setUpdatesListViewCellSelectedAppearance:]( v12,  "setUpdatesListViewCellSelectedAppearance:",  1LL);
  -[TVHPreviewingListViewController setListViewMargin:](v12, "setListViewMargin:", 0.0, 160.0, 0.0, 0.0);
  -[TVHMediaEntityCollectionDetailsViewController _addPreviewView](self, "_addPreviewView");
  -[TVHMediaEntityCollectionDetailsViewController _delegateUpdateHeaderView](self, "_delegateUpdateHeaderView");
  -[TVHMediaEntityCollectionDetailsViewController _updateBackgroundImage](self, "_updateBackgroundImage");
  -[TVHMediaEntityCollectionDetailsViewController addChildViewController:](self, "addChildViewController:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController view](v12, "view"));
  objc_msgSend(v20, "setFrame:", v5, v7, v9, v11);
  [v3 addSubview:v20];
  -[TVHPreviewingListViewController didMoveToParentViewController:](v12, "didMoveToParentViewController:", self);
  objc_msgSend(v13, "setContentInset:", 0.0, 0.0, 90.0, 78.0);
  [v13 setDelegate:self];
  objc_msgSend( v13,  "registerClass:forCellWithReuseIdentifier:",  -[TVHMediaEntityCollectionDetailsViewController listViewCellClass](self, "listViewCellClass"),  @"MediaItemCellIdentifier");
  objc_initWeak(&location, self);
  v21 = objc_alloc(&OBJC_CLASS___TVHCollectionViewChangeSetDataSource);
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000544F4;
  v25[3] = &unk_1000FD750;
  objc_copyWeak(&v26, &location);
  v23 = -[TVHCollectionViewChangeSetDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v21,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v13,  v22,  &stru_1000FE288,  v25);

  -[TVHMediaEntityCollectionDetailsViewController setChangeSetDataSource:](self, "setChangeSetDataSource:", v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController;
  -[TVHMediaEntityCollectionDetailsViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interactivePlaylistPlayer]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:v5];

  -[TVHMediaEntityCollectionDetailsViewController _updatePreviewView](self, "_updatePreviewView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController;
  -[TVHMediaEntityCollectionDetailsViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interactivePlaylistPlayer]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:TVPPlaybackStateDidChangeNotification object:v5];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  id v6 = [v5 item];

  -[TVHMediaEntityCollectionDetailsViewController _startPlaybackOfMediaItems:atIndex:]( self,  "_startPlaybackOfMediaItems:atIndex:",  v7,  v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (sub_100073068())
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    if (v7)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemAtIndexPath:v7]);

      if (v9)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100054814;
        v12[3] = &unk_1000FD7C8;
        v12[4] = self;
        id v13 = v9;
        double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  v12));
      }

      else
      {
        double v10 = 0LL;
      }
    }

    else
    {
      double v10 = 0LL;
    }
  }

  else
  {
    double v10 = 0LL;
  }

  return v10;
}

- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  id v6 = [v5 item];

  -[TVHMediaEntityCollectionDetailsViewController _startPlaybackOfMediaItems:atIndex:]( self,  "_startPlaybackOfMediaItems:atIndex:",  v7,  v6);
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController navigationController](self, "navigationController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItemAtIndexPath:v5]);

  if (v11 && v7)
  {
    unint64_t v8 = -[TVHMediaEntityCollectionDetailsViewController _delegateContextMenuOptionsForMediaItem:]( self,  "_delegateContextMenuOptionsForMediaItem:",  v7);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaLibrary](self, "mediaLibrary"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController tvh_mediaItemContextMenuAlertControllerWithMediaItem:mediaLibrary:navigationController:options:]( &OBJC_CLASS___UIAlertController,  "tvh_mediaItemContextMenuAlertControllerWithMediaItem:mediaLibrary:navigationController:options:",  v7,  v9,  v11,  v8));

    if (v10) {
      -[TVHMediaEntityCollectionDetailsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
    }
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((id)-[TVHMediaEntityCollectionDetailsViewController previewType](self, "previewType") == (id)1)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedIndexPath]);
    double v10 = v9;
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100054A6C;
      v11[3] = &unk_1000FCDB8;
      v11[4] = self;
      id v12 = v9;
      [v8 addCoordinatedAnimations:v11 completion:0];
    }
  }
}

- (void)mediaEntityCollectionContentDescriptionPreviewViewDidSelectContentDescription:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 mediaEntityTitle]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentDescription]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
  id v7 = [[TVSUITextAlertController alloc] initWithTitle:v8 text:v6];
  -[TVHMediaEntityCollectionDetailsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
}

- (void)mediaEntityCollectionPreviewPlaybackControlsViewDidSelectShuffleButton:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( v4,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  v5,  v6,  0LL,  3LL);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v7 playPlaylist:v8];
}

- (void)mediaEntityCollectionPreviewPlaybackControlsViewDidSelectMoreButton:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager", a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 interactivePlaylistPlayer]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaEntityCollection](self, "mediaEntityCollection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController tvh_moreAlertControllerWithMediaEntityCollection:mediaItems:mediaLibrary:player:]( &OBJC_CLASS___UIAlertController,  "tvh_moreAlertControllerWithMediaEntityCollection:mediaItems:mediaLibrary:player:",  v5,  v6,  v7,  v9));

  -[TVHMediaEntityCollectionDetailsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
}

- (id)moreContextMenuActionsForMediaEntityCollectionPreviewPlaybackControlsView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController mediaEntityCollection]( self,  "mediaEntityCollection",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v6 = [v5 mediaEntityCollectionType];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v6 == (id)5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"PLAY_PLAYLIST_NEXT_TITLE" value:0 table:0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v10 = v9;
    id v11 = @"PLAY_PLAYLIST_LAST_TITLE";
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"PLAY_ALBUM_NEXT_TITLE" value:0 table:0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v10 = v9;
    id v11 = @"PLAY_ALBUM_LAST_TITLE";
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:0 table:0]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_playNextActionWithMediaItems:title:]( &OBJC_CLASS___UIAction,  "tvh_playNextActionWithMediaItems:title:",  v13,  v8));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaItems](self, "mediaItems"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_playLaterActionWithMediaItems:title:]( &OBJC_CLASS___UIAction,  "tvh_playLaterActionWithMediaItems:title:",  v15,  v12));

  v19[0] = v14;
  v19[1] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));

  return v17;
}

- (id)moreContextMenuTitleForMediaEntityCollectionPreviewPlaybackControlsView:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController mediaEntityCollection]( self,  "mediaEntityCollection",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayTitle"));

  return v4;
}

- (void)_delegateUpdateHeaderView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController previewingListViewController]( self,  "previewingListViewController"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 listHeaderView]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController delegate](self, "delegate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaEntityCollection](self, "mediaEntityCollection"));
  [v4 mediaEntityCollectionDetailsViewController:self updateHeaderView:v6 forMediaEntityCollection:v5];
}

- (void)_delegateConfigureCell:(id)a3 atIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemAtIndexPath:v6]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController delegate](self, "delegate"));
    [v9 mediaEntityCollectionDetailsViewController:self configureCell:v13 forMediaItem:v8];

    if ([v13 conformsToProtocol:&OBJC_PROTOCOL___TVHNowPlayingBarsListViewCell])
    {
      id v10 = v13;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController nowPlayingBarsController]( self,  "nowPlayingBarsController"));
      id v12 = [v11 nowPlayingBarsStateAtIndexPath:v6];

      [v10 setNowPlayingBarsState:v12];
    }
  }
}

- (BOOL)_delegateShouldAutoplayMediaItems
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0) {
    return 1;
  }
  double v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController delegate](self, "delegate"));
  LOBYTE(v3) = [v4 shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:v3];

  return (char)v3;
}

- (unint64_t)_delegateContextMenuOptionsForMediaItem:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) == 0) {
    return 0LL;
  }
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController delegate](self, "delegate"));
  id v7 = [v6 mediaEntityCollectionDetailsViewController:self contextMenuOptionsForMediaItem:v5];

  return (unint64_t)v7;
}

- (void)_addPreviewView
{
  unint64_t v3 = -[TVHMediaEntityCollectionDetailsViewController previewType](self, "previewType");
  if (v3 == 1)
  {
    id v4 = off_1000FC4D0;
  }

  else
  {
    if (v3)
    {
      id v6 = 0LL;
      goto LABEL_7;
    }

    id v4 = off_1000FC4D8;
  }

  id v6 = objc_alloc_init(*v4);
  [v6 setDelegate:self];
  objc_msgSend(v6, "setImageShape:", -[TVHMediaEntityCollectionDetailsViewController imageShape](self, "imageShape"));
LABEL_7:
  -[TVHMediaEntityCollectionDetailsViewController _updatePreviewView:](self, "_updatePreviewView:", v6);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController previewingListViewController]( self,  "previewingListViewController"));
  [v5 setPreviewView:v6];
}

- (void)_updatePreviewView
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController previewingListViewController]( self,  "previewingListViewController"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 previewView]);

  -[TVHMediaEntityCollectionDetailsViewController _updatePreviewView:](self, "_updatePreviewView:", v4);
}

- (void)_updatePreviewView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaEntityCollection](self, "mediaEntityCollection"));
  [v4 preferredImageSize];
  double v7 = v6;
  double v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaLibrary](self, "mediaLibrary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  v5,  v10,  v7,  v9));

  [v4 setImageProxy:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v5,  v7,  v9));
  [v4 setPlaceholder:v12];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVHMediaEntityCollectionPlaybackControlsPreviewView);
  id v14 = v4;
  id v29 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      uint64_t v15 = v29;
    }
    else {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = v15;

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 interactivePlaylistPlayer]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playlist]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___TVHPlayerPlaylist);
    id v21 = v19;
    objc_super v22 = v21;
    if (v20)
    {
      if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
        v23 = v22;
      }
      else {
        v23 = 0LL;
      }
    }

    else
    {
      v23 = 0LL;
    }

    id v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v18 state]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
    if (v25 == (void *)v26)
    {
      id v28 = 0LL;
      v27 = v25;
    }

    else
    {
      v27 = (void *)v26;
      id v28 = [v24 canItemsBeAdded];
    }

    [v16 setShowsMoreButton:v28];
  }
}

- (void)_updateDescriptionPreviewViewAtIndexPath:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController previewingListViewController]( self,  "previewingListViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 previewView]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHMediaEntityCollectionContentDescriptionPreviewView);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController dataSource](self, "dataSource"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemAtIndexPath:v13]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_contentDescriptionAttributedString"));
    [v7 setContentDescription:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_displayTitle"));
    [v7 setMediaEntityTitle:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    [v7 setMediaEntityIdentifier:v12];
  }
}

- (void)_updateBackgroundImage
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController backgroundImageInfo](self, "backgroundImageInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionDetailsViewController previewingListViewController]( self,  "previewingListViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 image]);
  [v4 setBackgroundImage:v5];

  id v6 = [v3 recommendedForegroundUserInterfaceStyle];
  id v7 = sub_10007A1C8();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = sub_10007A238((unint64_t)v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "TVHMediaEntityCollectionDetailsViewController: Overriding user interface style to: %@",  (uint8_t *)&v11,  0xCu);
  }

  -[TVHMediaEntityCollectionDetailsViewController setOverrideUserInterfaceStyle:]( self,  "setOverrideUserInterfaceStyle:",  v6);
}

- (void)_startPlaybackOfMediaItems:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (-[TVHMediaEntityCollectionDetailsViewController _delegateShouldAutoplayMediaItems]( self,  "_delegateShouldAutoplayMediaItems"))
  {
    id v7 = v6;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:a4]);
    id v13 = v8;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

    a4 = 0LL;
  }

  double v9 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController mediaLibrary](self, "mediaLibrary"));
  int v11 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( v9,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  v7,  v10,  a4,  2LL);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v12 playPlaylist:v11];
}

- (TVHMediaEntityCollectionDetailsViewControllerDelegate)delegate
{
  return (TVHMediaEntityCollectionDetailsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (Class)listViewCellClass
{
  return self->_listViewCellClass;
}

- (void)setListViewCellClass:(Class)a3
{
}

- (unint64_t)previewType
{
  return self->_previewType;
}

- (TVHKMediaEntityCollection)mediaEntityCollection
{
  return self->_mediaEntityCollection;
}

- (TVHKBackgroundImageInfo)backgroundImageInfo
{
  return self->_backgroundImageInfo;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)imageShape
{
  return self->_imageShape;
}

- (TVHNowPlayingBarsListViewCellController)nowPlayingBarsController
{
  return self->_nowPlayingBarsController;
}

- (void)setNowPlayingBarsController:(id)a3
{
}

- (TVHPreviewingListViewController)previewingListViewController
{
  return self->_previewingListViewController;
}

- (void)setPreviewingListViewController:(id)a3
{
}

- (TVHCollectionViewChangeSetDataSource)changeSetDataSource
{
  return self->_changeSetDataSource;
}

- (void)setChangeSetDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end