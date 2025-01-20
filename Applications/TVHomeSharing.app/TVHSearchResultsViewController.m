@interface TVHSearchResultsViewController
+ (TVHSearchResultsViewController)new;
+ (id)_displayableMediaEntityTypes;
- (CGSize)_imageSizeForMediaEntityType:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDictionary)lockupLayoutsDictionary;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHSearchResultsDataSource)searchResultsDataSource;
- (TVHSearchResultsViewController)init;
- (TVHSearchResultsViewController)initWithCoder:(id)a3;
- (TVHSearchResultsViewController)initWithMediaLibrary:(id)a3;
- (TVHSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHSearchResultsViewControllerDelegate)delegate;
- (id)_shelfViewLayout;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_delegateDidLongPressMediaEntity:(id)a3;
- (void)_delegateDidPlayMediaEntity:(id)a3;
- (void)_delegateDidSelectMediaEntity:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setLockupLayoutsDictionary:(id)a3;
- (void)updateWithSearchControllerResult:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHSearchResultsViewController

+ (TVHSearchResultsViewController)new
{
  return 0LL;
}

- (TVHSearchResultsViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHSearchResultsViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSearchResultsViewController)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  v6 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v6, "setScrollDirection:", 0LL);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v6, "setMinimumLineSpacing:", 50.0);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHSearchResultsViewController;
  v7 = -[TVHStackViewController initWithLayout:](&v18, "initWithLayout:", v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaLibrary, a3);
    v9 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSource);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100050E88;
    v16[3] = &unk_1000FE200;
    v10 = v8;
    v17 = v10;
    v11 = -[TVHSearchResultsDataSource initWithShelfViewControllerBlock:](v9, "initWithShelfViewControllerBlock:", v16);
    searchResultsDataSource = v10->_searchResultsDataSource;
    v10->_searchResultsDataSource = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewController stackView](v10, "stackView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 collectionView]);
    [v14 setContentInsetAdjustmentBehavior:0];
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "searchResultsViewController:didSelectMediaEntity:") & 1;
  if ((objc_opt_respondsToSelector(v5, "searchResultsViewController:didLongPressMediaEntity:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector(v5, "searchResultsViewController:didPlayMediaEntity:");

  if ((v7 & 1) != 0) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (void)updateWithSearchControllerResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  [v5 updateWithSearchControllerResult:v4];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHSearchResultsViewController;
  -[TVHSearchResultsViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewController stackView](self, "stackView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionView]);

  [v4 registerClass:objc_opt_class(TVHStackViewControllerCollectionViewCell) forCellWithReuseIdentifier:@"CellReuseIdentifier"];
  objc_initWeak(&location, self);
  id v5 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  char v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_1000512C0;
  v11 = &unk_1000FCF88;
  objc_copyWeak(&v12, &location);
  char v7 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v5,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v4,  v6,  &stru_1000FE220,  &v8);

  -[TVHSearchResultsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v7, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaEntitiesShelfViewControllerAtIndexPath:v7]);

  [v8 frame];
  double Width = CGRectGetWidth(v23);
  [v8 adjustedContentInset];
  double v13 = v12;
  double v15 = v14;

  double v16 = Width - v13 - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
  objc_msgSend(v17, "sizeThatFits:", v16, 1.79769313e308);
  double v19 = v18;

  double v20 = v16;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController childViewControllers](self, "childViewControllers"));
    unsigned __int8 v10 = [v9 containsObject:v8];

    if ((v10 & 1) == 0)
    {
      -[TVHSearchResultsViewController addChildViewController:](self, "addChildViewController:", v8);
      [v8 didMoveToParentViewController:self];
      goto LABEL_9;
    }

    id v11 = sub_10007A078();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C7F8();
    }
  }

  else
  {
    id v13 = sub_10007A078();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C798();
    }
  }

LABEL_9:
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  if (!v8)
  {
    id v11 = sub_10007A078();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C858();
    }
    goto LABEL_8;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController childViewControllers](self, "childViewControllers"));
  unsigned int v10 = [v9 containsObject:v8];

  if (!v10)
  {
    id v13 = sub_10007A078();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C8B8();
    }
LABEL_8:

    goto LABEL_9;
  }

  [v8 willMoveToParentViewController:0];
  [v8 removeFromParentViewController];
LABEL_9:
}

- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVHCircularLockup);
  if ((objc_opt_isKindOfClass(v13, v8) & 1) != 0)
  {
    id v9 = v13;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController mediaLibrary](self, "mediaLibrary"));
    +[TVHCircularLockupConfigurator configureCircularLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHCircularLockupConfigurator,  "configureCircularLockup:withMediaEntity:mediaLibrary:",  v9,  v7,  v10);
LABEL_5:

    goto LABEL_6;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVHPosterLockup);
  if ((objc_opt_isKindOfClass(v13, v11) & 1) != 0)
  {
    id v12 = v13;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController mediaLibrary](self, "mediaLibrary"));
    +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v12,  v7,  v10);
    goto LABEL_5;
  }

- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4
{
}

- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)_delegateDidSelectMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController delegate](self, "delegate"));
    [v5 searchResultsViewController:self didSelectMediaEntity:v4];
  }

- (void)_delegateDidLongPressMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController delegate](self, "delegate"));
    [v5 searchResultsViewController:self didLongPressMediaEntity:v4];
  }

- (void)_delegateDidPlayMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController delegate](self, "delegate"));
    [v5 searchResultsViewController:self didPlayMediaEntity:v4];
  }

- (NSDictionary)lockupLayoutsDictionary
{
  lockupLayoutsDictionary = self->_lockupLayoutsDictionary;
  if (!lockupLayoutsDictionary)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupFooterViewLayout);
    -[TVHSimpleLockupFooterViewLayout setType:](v5, "setType:", 0LL);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v6 = [(id)objc_opt_class(self) _displayableMediaEntityTypes];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          -[TVHSearchResultsViewController _imageSizeForMediaEntityType:](self, "_imageSizeForMediaEntityType:", v12);
          double v14 = v13;
          double v16 = v15;
          v17 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
          -[TVHSimpleLockupLayout setContentViewSize:](v17, "setContentViewSize:", v14, v16);
          -[TVHSimpleLockupLayout setFooterViewLayout:](v17, "setFooterViewLayout:", v5);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, v12);
        }

        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    double v18 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
    double v19 = self->_lockupLayoutsDictionary;
    self->_lockupLayoutsDictionary = v18;

    lockupLayoutsDictionary = self->_lockupLayoutsDictionary;
  }

  return lockupLayoutsDictionary;
}

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController searchResultsDataSource](self, "searchResultsDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v10 setChildView:v9];

  [v10 setIdentifier:v6];
}

+ (id)_displayableMediaEntityTypes
{
  if (qword_100157318 != -1) {
    dispatch_once(&qword_100157318, &stru_1000FE240);
  }
  return (id)qword_100157310;
}

- (CGSize)_imageSizeForMediaEntityType:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobook](&OBJC_CLASS___TVHKMediaEntityType, "audiobook"));

  if (v5 == v4) {
    goto LABEL_22;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobookChapter](&OBJC_CLASS___TVHKMediaEntityType, "audiobookChapter"));

  if (v6 == v4) {
    goto LABEL_22;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType homeVideo](&OBJC_CLASS___TVHKMediaEntityType, "homeVideo"));

  if (v7 == v4) {
    goto LABEL_20;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUCourse](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUCourse"));

  if (v8 == v4) {
    goto LABEL_22;
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUAudioEpisode"));
  if ((id)v9 == v4)
  {
LABEL_21:

    goto LABEL_22;
  }

  id v10 = (void *)v9;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUVideoEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUVideoEpisode"));

  if (v11 == v4)
  {
LABEL_22:
    CGFloat width = 250.0;
    goto LABEL_23;
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movie](&OBJC_CLASS___TVHKMediaEntityType, "movie"));

  if (v12 == v4
    || (id v13 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movieRental](&OBJC_CLASS___TVHKMediaEntityType, "movieRental")),
        v13,
        v13 == v4))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController mediaLibrary](self, "mediaLibrary"));
    unsigned int v29 = objc_msgSend(v28, "tvh_shouldDisplayWideMovieCoverArt");

    if (v29) {
      CGFloat width = 444.0;
    }
    else {
      CGFloat width = 250.0;
    }
    if (v29) {
      double height = 250.0;
    }
    else {
      double height = 375.0;
    }
    goto LABEL_24;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbum](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbum"));

  CGFloat width = 308.0;
  if (v14 == v4)
  {
    double height = 308.0;
    goto LABEL_24;
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbumArtist](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbumArtist"));

  double height = 308.0;
  if (v16 != v4)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicSong](&OBJC_CLASS___TVHKMediaEntityType, "musicSong"));

    if (v18 == v4) {
      goto LABEL_22;
    }
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicVideo](&OBJC_CLASS___TVHKMediaEntityType, "musicVideo"));

    if (v19 != v4)
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcast](&OBJC_CLASS___TVHKMediaEntityType, "podcast"));

      if (v20 != v4)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcastAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "podcastAudioEpisode"));
        if ((id)v21 != v4)
        {
          __int128 v22 = (void *)v21;
          id v23 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityType podcastVideoEpisode]( &OBJC_CLASS___TVHKMediaEntityType,  "podcastVideoEpisode"));

          CGFloat width = 250.0;
          double height = 250.0;
          if (v23 != v4)
          {
            id v24 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType show](&OBJC_CLASS___TVHKMediaEntityType, "show"));

            if (v24 == v4)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController mediaLibrary](self, "mediaLibrary"));
              unsigned int v31 = objc_msgSend(v30, "tvh_shouldDisplayWideShowCoverArt");

              double height = 250.0;
              if (v31) {
                CGFloat width = 444.0;
              }
              else {
                CGFloat width = 250.0;
              }
            }

            else
            {
              CGFloat width = CGSizeZero.width;
              double height = CGSizeZero.height;
              id v25 = (id)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType showEpisode](&OBJC_CLASS___TVHKMediaEntityType, "showEpisode"));

              if (v25 == v4)
              {
                CGFloat width = 444.0;
                double height = 250.0;
              }
            }
          }

          goto LABEL_24;
        }

        goto LABEL_21;
      }

      goto LABEL_22;
    }

- (id)_shelfViewLayout
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesShelfViewLayout);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsViewController lockupLayoutsDictionary](self, "lockupLayoutsDictionary"));
  -[TVHMediaEntitiesShelfViewLayout setLockupLayoutByMediaEntityType:](v3, "setLockupLayoutByMediaEntityType:", v4);

  -[TVHShelfViewLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 48.0);
  return v3;
}

- (TVHSearchResultsViewControllerDelegate)delegate
{
  return (TVHSearchResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHSearchResultsDataSource)searchResultsDataSource
{
  return self->_searchResultsDataSource;
}

- (TVHCollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void)setLockupLayoutsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end