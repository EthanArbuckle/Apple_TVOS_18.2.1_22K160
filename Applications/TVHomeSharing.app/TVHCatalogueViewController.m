@interface TVHCatalogueViewController
+ (id)_displayableMediaEntityTypes;
+ (id)new;
- (CGSize)_imageSizeForMediaEntityType:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (NSDictionary)lockupLayoutsDictionary;
- (TVHCatalogueDataSource)catalogueDataSource;
- (TVHCatalogueViewController)init;
- (TVHCatalogueViewController)initWithCoder:(id)a3;
- (TVHCatalogueViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4;
- (TVHCatalogueViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHCatalogueViewControllerDelegate)delegate;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHPreviewingListViewController)listViewController;
- (id)_previewViewControllerForIndexPath:(id)a3;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_delegateDidLongPressMediaEntity:(id)a3;
- (void)_delegateDidPlayMediaEntity:(id)a3;
- (void)_delegateDidSelectMediaEntity:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadView;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didLongPressMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)mediaEntitiesPlayedStateViewController:(id)a3 didLongPressMediaEntity:(id)a4;
- (void)mediaEntitiesPlayedStateViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesPlayedStateViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setListViewController:(id)a3;
- (void)setLockupLayoutsDictionary:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHCatalogueViewController

+ (id)new
{
  return 0LL;
}

- (TVHCatalogueViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHCatalogueViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHCatalogueViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
    if (v9) {
      goto LABEL_3;
    }
  }

  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"dataSource");
LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVHCatalogueViewController;
  v10 = -[TVHCatalogueViewController initWithNibName:bundle:](&v23, "initWithNibName:bundle:", 0LL, 0LL);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaLibrary, a3);
    objc_storeStrong((id *)&v11->_catalogueDataSource, a4);
    v12 = -[TVHPreviewingListViewController initWithItemSize:]( objc_alloc(&OBJC_CLASS___TVHPreviewingListViewController),  "initWithItemSize:",  488.0,  70.0);
    listViewController = v11->_listViewController;
    v11->_listViewController = v12;

    -[TVHPreviewingListViewController setListViewMargin:]( v11->_listViewController,  "setListViewMargin:",  0.0,  90.0,  0.0,  0.0);
    -[TVHPreviewingListViewController setPreviewOnRightSide:](v11->_listViewController, "setPreviewOnRightSide:", 1LL);
    -[TVHPreviewingListViewController setPreviewViewRespectSafeAreaInsets:]( v11->_listViewController,  "setPreviewViewRespectSafeAreaInsets:",  1LL);
    -[TVHPreviewingListViewController setUpdatesListViewCellSelectedAppearance:]( v11->_listViewController,  "setUpdatesListViewCellSelectedAppearance:",  1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](v11->_listViewController, "listView"));
    objc_msgSend(v14, "setContentInset:", 45.0, 0.0, 60.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource headerTitle](v11->_catalogueDataSource, "headerTitle"));
    if (v15)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___TVHSimpleHeaderView);
      -[TVHSimpleHeaderView setCentersLabel:](v16, "setCentersLabel:", 1LL);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleHeaderView label](v16, "label"));
      [v17 setText:v15];

      -[TVHPreviewingListViewController setHeaderView:](v11->_listViewController, "setHeaderView:", v16);
    }

    objc_initWeak(&location, v11);
    v18 = v11->_listViewController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000935C;
    v20[3] = &unk_1000FCF20;
    objc_copyWeak(&v21, &location);
    -[TVHPreviewingListViewController setAutoUpdatePreviewViewControllerBlock:]( v18,  "setAutoUpdatePreviewViewControllerBlock:",  v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "catalogViewController:didSelectMediaEntity:") & 1;
  if ((objc_opt_respondsToSelector(v5, "catalogViewController:didLongPressMediaEntity:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector(v5, "catalogViewController:didPlayMediaEntity:");

  if ((v7 & 1) != 0) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  -[TVHCatalogueViewController setView:](self, "setView:", v12);
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVHCatalogueViewController;
  -[TVHCatalogueViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController listViewController](self, "listViewController"));
  -[TVHCatalogueViewController addChildViewController:](self, "addChildViewController:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  [v3 addSubview:v13];
  [v12 didMoveToParentViewController:self];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 listView]);
  [v14 registerClass:objc_opt_class(TVHCatalogueListViewCell) forCellWithReuseIdentifier:@"ListViewCellIdentifier"];
  [v14 registerClass:objc_opt_class(TVHCatalogueListViewSectionHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ListViewSectionHeaderViewIdentifier"];
  [v14 setDelegate:self];
  objc_initWeak(&location, self);
  v15 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000097F8;
  v20[3] = &unk_1000FCF88;
  objc_copyWeak(&v21, &location);
  v17 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v15,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v14,  v16,  &stru_1000FCF60,  v20);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000985C;
  v18[3] = &unk_1000FCFB0;
  objc_copyWeak(&v19, &location);
  -[TVHCollectionViewDiffableDataSource setSupplementaryViewProvider:](v17, "setSupplementaryViewProvider:", v18);
  -[TVHCatalogueViewController setDiffableDataSource:](self, "setDiffableDataSource:", v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 willDisplayCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 didEndDisplayingCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 didUpdateFocusInContext:v9 withAnimationCoordinator:v8];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource", a3, a4));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionTitleAIndex:a5]);

  if ([v7 length]) {
    double v8 = 102.0;
  }
  else {
    double v8 = 0.0;
  }

  double v9 = 0.0;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesGridViewController:(id)a3 didLongPressMediaEntity:(id)a4
{
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)mediaEntitiesPlayedStateViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesPlayedStateViewController:(id)a3 didLongPressMediaEntity:(id)a4
{
}

- (void)mediaEntitiesPlayedStateViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)_delegateDidSelectMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController delegate](self, "delegate"));
    [v5 catalogViewController:self didSelectMediaEntity:v4];
  }

- (void)_delegateDidLongPressMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController delegate](self, "delegate"));
    [v5 catalogViewController:self didLongPressMediaEntity:v4];
  }

- (void)_delegateDidPlayMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController delegate](self, "delegate"));
    [v5 catalogViewController:self didPlayMediaEntity:v4];
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
          -[TVHCatalogueViewController _imageSizeForMediaEntityType:](self, "_imageSizeForMediaEntityType:", v12);
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

    v18 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
    id v19 = self->_lockupLayoutsDictionary;
    self->_lockupLayoutsDictionary = v18;

    lockupLayoutsDictionary = self->_lockupLayoutsDictionary;
  }

  return lockupLayoutsDictionary;
}

- (id)_previewViewControllerForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 relatedContentForIndexPath:v4]);

  id v7 = [v6 displayType];
  if (!v7)
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVHCatalogueGridRelatedContent);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesDataSource]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController lockupLayoutsDictionary](self, "lockupLayoutsDictionary"));
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesGridViewLayout);
      -[TVHMediaEntitiesGridViewLayout setLockupLayoutByMediaEntityType:](v12, "setLockupLayoutByMediaEntityType:", v11);
      double v15 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:applyGradientMask:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:applyGradientMask:",  v10,  v12,  1LL);
      -[TVHMediaEntitiesGridViewController setGridContentInset:](v15, "setGridContentInset:", 45.0, 68.0, 60.0, 90.0);
      goto LABEL_7;
    }

    id v25 = sub_10007A1C8();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if (v7 != (id)1)
  {
LABEL_13:
    double v15 = 0LL;
    goto LABEL_14;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVHCataloguePlayedStateRelatedContent);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    id v17 = sub_10007A1C8();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_13;
    }

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemForIdentifier:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  [v11 setTitle:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedContent]);
  objc_msgSend(v11, "setMediaEntitiesCount:", objc_msgSend(v10, "mediaEntitiesCount"));
}

+ (id)_displayableMediaEntityTypes
{
  if (qword_100157278 != -1) {
    dispatch_once(&qword_100157278, &stru_1000FCFF0);
  }
  return (id)qword_100157270;
}

- (CGSize)_imageSizeForMediaEntityType:(id)a3
{
  id v4 = a3;
  if ([v4 mediaEntityCollectionType] == (id)5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController catalogueDataSource](self, "catalogueDataSource"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlistsItem]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playlistItemMediaCategoryTypes]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    id v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController mediaLibrary](self, "mediaLibrary"));
    id v11 = objc_msgSend(v10, "tvh_playlistCoverArtShapeForPlaylistItemMediaCategoryType:", v9);

    if (v11 == (id)2) {
      double v12 = 200.0;
    }
    else {
      double v12 = 340.0;
    }
    double v13 = dbl_1000C30D0[v11 == (id)2];
  }

  else
  {
    double v14 = (char *)[v4 mediaCategoryType];
    if ((unint64_t)(v14 - 2) < 2)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController mediaLibrary](self, "mediaLibrary"));
      unsigned int v16 = objc_msgSend(v15, "tvh_shouldDisplayWideMovieCoverArt");

      BOOL v17 = v16 == 0;
      if (v16) {
        double v12 = 200.0;
      }
      else {
        double v12 = 375.0;
      }
      double v18 = 250.0;
    }

    else
    {
      if (v14 != (char *)4)
      {
        if (v14 == (char *)5)
        {
          double v12 = 200.0;
          double v13 = 355.0;
        }

        else
        {
          double v13 = 340.0;
          double v12 = 340.0;
        }

        goto LABEL_21;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController mediaLibrary](self, "mediaLibrary"));
      unsigned int v20 = objc_msgSend(v19, "tvh_shouldDisplayWideShowCoverArt");

      BOOL v17 = v20 == 0;
      double v18 = 340.0;
      if (v20) {
        double v12 = 200.0;
      }
      else {
        double v12 = 340.0;
      }
    }

    if (v17) {
      double v13 = v18;
    }
    else {
      double v13 = 355.0;
    }
  }

- (TVHCatalogueViewControllerDelegate)delegate
{
  return (TVHCatalogueViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHCatalogueDataSource)catalogueDataSource
{
  return self->_catalogueDataSource;
}

- (TVHCollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (TVHPreviewingListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (void)setLockupLayoutsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end