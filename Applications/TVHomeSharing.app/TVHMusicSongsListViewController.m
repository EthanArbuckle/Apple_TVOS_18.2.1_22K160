@interface TVHMusicSongsListViewController
+ (TVHMusicSongsListViewController)new;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (NSArray)sortOptions;
- (TVHCollectionViewChangeSetDataSource)changeSetDataSource;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHListView)listView;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMusicSongsListViewController)init;
- (TVHMusicSongsListViewController)initWithCoder:(id)a3;
- (TVHMusicSongsListViewController)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4 sortOptions:(id)a5 initialSortOption:(id)a6;
- (TVHMusicSongsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMusicSongsListViewControllerDelegate)delegate;
- (TVHNowPlayingBarsListViewCellController)nowPlayingBarsController;
- (id)_sectionHeaderViewForCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)preferredFocusEnvironments;
- (unint64_t)currentSortOptionIndexForSortContextMenuButton:(id)a3;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)_handlePlayButtonAction;
- (void)_handleShuffleButtonAction;
- (void)_handleSortButtonAction;
- (void)_startPlaybackOfMediaItemsAtIndex:(unint64_t)a3 shuffle:(BOOL)a4;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)mediaEntitiesDataSource:(id)a3 currentSortDidChange:(id)a4;
- (void)setChangeSetDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListView:(id)a3;
- (void)setNowPlayingBarsController:(id)a3;
- (void)sortContextMenuButton:(id)a3 didSelectSortOption:(id)a4;
- (void)updateWithMediaEntitiesDataSourceFetchResult:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHMusicSongsListViewController

+ (TVHMusicSongsListViewController)new
{
  return 0LL;
}

- (TVHMusicSongsListViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicSongsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMusicSongsListViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMusicSongsListViewController)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4 sortOptions:(id)a5 initialSortOption:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHMusicSongsListViewController;
  v15 = -[TVHMusicSongsListViewController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", 0LL, 0LL);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaLibrary, a3);
    v17 = (NSArray *)[v13 copy];
    sortOptions = v16->_sortOptions;
    v16->_sortOptions = v17;

    v19 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v12);
    dataSource = v16->_dataSource;
    v16->_dataSource = v19;

    -[TVHMediaEntitiesDataSource setDelegate:](v16->_dataSource, "setDelegate:", v16);
    -[TVHMediaEntitiesDataSource setCurrentSortOption:](v16->_dataSource, "setCurrentSortOption:", v14);
    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v16->_dataSource, "setProvideIndexTitles:", 1LL);
  }

  return v16;
}

- (void)updateWithMediaEntitiesDataSourceFetchResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  id v7 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  [v5 updateWithMediaEntitiesDataSourceFetchResults:v6];
}

- (void)loadView
{
  id v4 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
  -[TVHListViewLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 24.0);
  v3 = -[TVHListView initWithFrame:listViewLayout:]( objc_alloc(&OBJC_CLASS___TVHListView),  "initWithFrame:listViewLayout:",  v4,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[TVHMusicSongsListViewController setListView:](self, "setListView:", v3);
  -[TVHMusicSongsListViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHMusicSongsListViewController;
  -[TVHMusicSongsListViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController listView](self, "listView"));
  [v3 setDelegate:self];
  [v3 setClipsToBounds:0];
  [v3 setRemembersLastFocusedIndexPath:1];
  +[TVHMusicMainViewController defaultMusicCategoryWithHeaderContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryWithHeaderContentInset");
  objc_msgSend(v3, "setContentInset:");
  [v3 configureDefaultGradientMaskForDirection:1];
  [v3 registerClass:objc_opt_class(TVHMusicSongListViewCell) forCellWithReuseIdentifier:@"TVHMusicSongListViewCell"];
  [v3 registerClass:objc_opt_class(TVHCollectionViewSectionHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderViewIdentifier"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController tvh_playbackManager](self, "tvh_playbackManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interactivePlaylistPlayer]);

  v6 = objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsListViewCellController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  v8 = -[TVHNowPlayingBarsListViewCellController initWithListView:dataSource:player:]( v6,  "initWithListView:dataSource:player:",  v3,  v7,  v5);

  -[TVHMusicSongsListViewController setNowPlayingBarsController:](self, "setNowPlayingBarsController:", v8);
  -[TVHNowPlayingBarsListViewCellController setMonitoringPlayer:](v8, "setMonitoringPlayer:", 1LL);
  objc_initWeak(&location, self);
  v9 = objc_alloc(&OBJC_CLASS___TVHCollectionViewChangeSetDataSource);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003E634;
  v14[3] = &unk_1000FD750;
  objc_copyWeak(&v15, &location);
  id v11 = -[TVHCollectionViewChangeSetDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v9,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v10,  &stru_1000FDE78,  v14);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003E698;
  v12[3] = &unk_1000FCFB0;
  objc_copyWeak(&v13, &location);
  -[TVHCollectionViewChangeSetDataSource setSupplementaryViewProvider:](v11, "setSupplementaryViewProvider:", v12);
  -[TVHMusicSongsListViewController setChangeSetDataSource:](self, "setChangeSetDataSource:", v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMusicSongsListViewController;
  -[TVHMusicSongsListViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController listView](self, "listView"));
  [v3 bounds];
  double v5 = v4;
  [v3 contentInset];
  double v8 = v5 - v6 - v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 listViewLayout]);
  [v9 itemSize];
  if (v8 != v11 || v10 != 68.0)
  {
    objc_msgSend(v9, "setItemSize:", v8, 68.0);
    [v9 invalidateLayout];
  }
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController listView](self, "listView"));
  double v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (sub_100073068())
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    if (v7)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemAtIndexPath:v7]);

      if (v9)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_10003E98C;
        v12[3] = &unk_1000FDEA0;
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = 0.0;
  if (!a5) {
    double v5 = 190.0;
  }
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController navigationController](self, "navigationController"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItemAtIndexPath:v5]);

  if (v10 && v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController mediaLibrary](self, "mediaLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController tvh_mediaItemContextMenuAlertControllerWithMediaItem:mediaLibrary:navigationController:options:]( &OBJC_CLASS___UIAlertController,  "tvh_mediaItemContextMenuAlertControllerWithMediaItem:mediaLibrary:navigationController:options:",  v7,  v8,  v10,  3LL));

    if (v9) {
      -[TVHMusicSongsListViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
    }
  }
}

- (void)mediaEntitiesDataSource:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController delegate](self, "delegate"));
  [v6 musicSongsListViewController:self currentSortDidChange:v5];
}

- (unint64_t)currentSortOptionIndexForSortContextMenuButton:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSortOption]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController sortOptions](self, "sortOptions"));
  id v7 = [v6 indexOfObject:v5];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0LL;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }

  return v8;
}

- (void)sortContextMenuButton:(id)a3 didSelectSortOption:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  [v6 setCurrentSortOption:v5];
}

- (void)_handlePlayButtonAction
{
}

- (void)_handleShuffleButtonAction
{
}

- (void)_handleSortButtonAction
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController sortOptions](self, "sortOptions"));
  if ([v3 count])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSortOption]);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10003ECD8;
    v7[3] = &unk_1000FDEC8;
    v7[4] = self;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController tvh_sortOptionAlertControllerWithSortOptions:currentSortOptionIndex:completionHandler:]( UIAlertController,  "tvh_sortOptionAlertControllerWithSortOptions:currentSortOptionIndex:completionHandler:",  v3,  [v3 indexOfObject:v5],  v7));
    -[TVHMusicSongsListViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
  }
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemAtIndexPath:v6]);

  if (v8)
  {
    id v9 = v19;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_displayTitle"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 contentRating]);
    objc_msgSend(v9, "setTitle:hasExplicitLyrics:", v10, objc_msgSend(v11, "isExplicitContent"));

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 artistTitle]);
    [v9 setArtistTitle:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 duration]);
    [v9 setDuration:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController mediaLibrary](self, "mediaLibrary"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  v8,  v14,  68.0,  68.0));

    [v9 setImageProxy:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForType:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForType:containerSize:",  7LL,  68.0,  68.0));
    [v9 setPlaceholder:v16];
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController nowPlayingBarsController](self, "nowPlayingBarsController"));
    id v18 = [v17 nowPlayingBarsStateAtIndexPath:v6];

    [v9 setNowPlayingBarsState:v18];
  }
}

- (void)_startPlaybackOfMediaItemsAtIndex:(unint64_t)a3 shuffle:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController dataSource](self, "dataSource"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);

  if (v4) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  id v9 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController mediaLibrary](self, "mediaLibrary"));
  double v11 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( v9,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  v13,  v10,  a3,  v8);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsListViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v12 playPlaylist:v11];
}

- (id)_sectionHeaderViewForCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    [v6 contentInset];
    double v10 = v9;
    double v12 = v11;
    [v6 bounds];
    id v14 = -[TVHInteractiveHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHInteractiveHeaderView),  "initWithFrame:",  0.0,  0.0,  v13 - v10 - v12,  190.0);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton playMusicButton](&OBJC_CLASS___TVHButton, "playMusicButton"));
    [v15 addTarget:self action:"_handlePlayButtonAction" forControlEvents:0x2000];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton shuffleButton](&OBJC_CLASS___TVHButton, "shuffleButton"));
    [v16 addTarget:self action:"_handleShuffleButtonAction" forControlEvents:0x2000];
    if (sub_100073068())
    {
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVHButton sortContextMenuButtonWithDataSource:delegate:]( &OBJC_CLASS___TVHButton,  "sortContextMenuButtonWithDataSource:delegate:",  self,  self));
    }

    else
    {
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton sortButton](&OBJC_CLASS___TVHButton, "sortButton"));
      [v17 addTarget:self action:"_handleSortButtonAction" forControlEvents:0x2000];
    }

    v20[0] = v15;
    v20[1] = v16;
    v20[2] = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
    -[TVHInteractiveHeaderView setControls:](v14, "setControls:", v18);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderViewIdentifier" forIndexPath:v7]);
    [v8 setBannerView:v14];
  }

  return v8;
}

- (TVHMusicSongsListViewControllerDelegate)delegate
{
  return (TVHMusicSongsListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)sortOptions
{
  return self->_sortOptions;
}

- (TVHListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (TVHCollectionViewChangeSetDataSource)changeSetDataSource
{
  return self->_changeSetDataSource;
}

- (void)setChangeSetDataSource:(id)a3
{
}

- (TVHNowPlayingBarsListViewCellController)nowPlayingBarsController
{
  return self->_nowPlayingBarsController;
}

- (void)setNowPlayingBarsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end