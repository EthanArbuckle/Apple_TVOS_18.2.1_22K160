@interface TVMusicLibraryArtistDetailViewController
+ (void)initialize;
- (BOOL)_shouldShowHeadingTitles;
- (BOOL)didPlayObject:(id)a3;
- (BOOL)showGradientMask;
- (BOOL)updateWithModelResponse:(id)a3;
- (CGSize)artworkSize;
- (CGSize)cellSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MPModelLibraryResponse)musicVideosResponse;
- (TVMusicLibraryArtistDetailViewController)initWithArtist:(id)a3;
- (UIControl)artistButton;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIFocusGuide)bottomButtonFocusGuide;
- (UIView)emptyContentView;
- (UIView)footerView;
- (double)cellsTopMargin;
- (double)headerVerticalOffset;
- (id)_musicVideosLibraryRequest;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)libraryPageType;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_addArtistButton;
- (void)_addEmptyContentView;
- (void)_configureForEmptyContent:(BOOL)a3;
- (void)_playArtistRadioStation;
- (void)_playMusicVideo:(id)a3;
- (void)_selectedArtist;
- (void)_updateContentInset;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)configureCell:(id)a3 forObject:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)playShuffled:(BOOL)a3;
- (void)setArtistButton:(id)a3;
- (void)setBottomButtonFocusGuide:(id)a3;
- (void)setEmptyContentView:(id)a3;
- (void)setFavoriteState:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setMpResults:(id)a3 completion:(id)a4;
- (void)setMusicVideosResponse:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryArtistDetailViewController

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicLibraryArtistDetailViewController");
  v3 = (void *)qword_1002BEB68;
  qword_1002BEB68 = (uint64_t)v2;
}

- (TVMusicLibraryArtistDetailViewController)initWithArtist:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  v5 = -[TVMusicLibraryAlbumsViewController initWithArtist:](&v18, "initWithArtist:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v5, "collectionView"));
    objc_msgSend( v7,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(TVMusicSectionHeaderView, v8),  UICollectionElementKindSectionHeader,  @"TVMusicCollectionViewTextHeaderIdentifier");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v6, "collectionView"));
    objc_msgSend( v9,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(UICollectionReusableView, v10),  UICollectionElementKindSectionHeader,  @"TVMusicCollectionViewBlankHeaderIdentifier");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v6, "collectionView"));
    objc_msgSend( v11,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicLibraryCollectionViewCell, v12),  @"TVMusicCollectionViewVideoCellIdentifier");

    objc_initWeak(&location, v6);
    objc_copyWeak(&v16, &location);
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController headerView]( v6,  "headerView",  _NSConcreteStackBlock,  3221225472LL,  sub_1000A3964,  &unk_100269F48));
    [v13 setArtistFavoriteHandler:&v15];

    -[TVMusicMPRequestViewController setPreventPopWhenEmpty:](v6, "setPreventPopWhenEmpty:", 1LL);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setFavoriteState:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A3A2C;
  v6[3] = &unk_10026A408;
  v6[4] = self;
  +[TVMusicLibraryUtilities setFavoriteFlag:forItem:completion:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "setFavoriteFlag:forItem:completion:",  v3,  v5,  v6);
}

- (int64_t)libraryPageType
{
  return 12LL;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  -[TVMusicLibraryAlbumsViewController viewDidLoad](&v12, "viewDidLoad");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 universalStore]);
  id v6 = [v5 adamID];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v6));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000A3C54;
    v9[3] = &unk_10026D228;
    objc_copyWeak(&v10, &location);
    +[TVMusicLibraryUtilities storeURLRequestForID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "storeURLRequestForID:completionHandler:",  v8,  v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (CGSize)cellSize
{
  double v2 = 320.0;
  double v3 = 408.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)artworkSize
{
  double v2 = 320.0;
  double v3 = 320.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cellsTopMargin
{
  unsigned int v2 = -[TVMusicLibraryArtistDetailViewController _shouldShowHeadingTitles](self, "_shouldShowHeadingTitles");
  double result = 164.0;
  if (v2) {
    return 214.0;
  }
  return result;
}

- (BOOL)showGradientMask
{
  return 0;
}

- (void)_updateContentInset
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[TVMusicLibraryArtistDetailViewController cellsTopMargin](self, "cellsTopMargin");
  if (v5 != v12)
  {
    -[TVMusicLibraryArtistDetailViewController cellsTopMargin](self, "cellsTopMargin");
    double v14 = v13;
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    objc_msgSend(v15, "setContentInset:", v14, v7, v9, v11);
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  -[TVMusicMPRequestViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v29,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));

  if (v7 == v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));

    if (!v16)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 indexPathForLastFocusedItem]);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 indexPathForLastFocusedItem]);
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v14 cellForItemAtIndexPath:v24]);

        double v14 = (void *)v25;
      }

      if (v14)
      {
        v33 = v14;
        uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        id v15 = (void *)v26;
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v32 = v15;
        uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      }

      v27 = (void *)v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController bottomButtonFocusGuide](self, "bottomButtonFocusGuide"));
      [v28 setPreferredFocusEnvironments:v27];

      if (!v14) {
      goto LABEL_12;
      }
    }

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
    v34 = v14;
    v17 = &v34;
    goto LABEL_9;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController bottomButtonFocusGuide](self, "bottomButtonFocusGuide"));
  [v9 setPreferredFocusEnvironments:0];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
  if (v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
    unsigned int v13 = [v11 isDescendantOfView:v12];

    if (v13)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bottomEdgeFocusGuide]);
      [v15 setPreferredFocusEnvironments:0];
LABEL_12:

      goto LABEL_13;
    }

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
    v31 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bottomEdgeFocusGuide]);
    [v20 setPreferredFocusEnvironments:v15];

LABEL_11:
    goto LABEL_12;
  }

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));

  if (v18)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
    v30 = v14;
    v17 = &v30;
LABEL_9:
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController bottomButtonFocusGuide](self, "bottomButtonFocusGuide"));
    [v19 setPreferredFocusEnvironments:v15];
    goto LABEL_11;
  }

- (id)preferredFocusEnvironments
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  id v3 = -[TVMusicMPRequestViewController preferredFocusEnvironments](&v11, "preferredFocusEnvironments");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
    double v7 = (void *)v6;
    if (v4)
    {
      uint64_t v12 = v6;
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v4]);
    }

    else
    {
      uint64_t v13 = v6;
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    }
  }

  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)setMpResults:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)objc_opt_new(&OBJC_CLASS___MPMutableSectionedCollection);
  [v8 appendSection:&stru_100279068];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000A4448;
  v17[3] = &unk_10026D250;
  id v9 = v8;
  id v18 = v9;
  objc_msgSend(v7, "tvm_enumerateItemsUsingBlock:", v17);

  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistDetailViewController _musicVideosLibraryRequest]( self,  "_musicVideosLibraryRequest"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000A44C8;
  v13[3] = &unk_100268C60;
  id v14 = v9;
  id v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v9;
  [v10 performWithResponseHandler:v13];
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  id v10 = a3;
  -[TVMusicMPRequestViewController collectionView:didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "collectionView:didUpdateFocusInContext:withAnimationCoordinator:",  v10,  v8,  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "visibleSupplementaryViewsOfKind:",  UICollectionElementKindSectionHeader,  v12.receiver,  v12.super_class));

  if (v11) {
    -[TVMusicMPRequestViewController _updateHeaderViews:forFocusContext:withAnimationCoordinator:]( self,  "_updateHeaderViews:forFocusContext:withAnimationCoordinator:",  v11,  v8,  v9);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistDetailViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:"));
  if (v5)
  {
    if (![v7 section] && objc_msgSend(v5, "type") == (id)2)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 album]);
      +[TVMusicLibraryUtilities showPageForAlbum:](&OBJC_CLASS___TVMusicLibraryUtilities, "showPageForAlbum:", v6);
LABEL_8:

      goto LABEL_9;
    }

    if ([v7 section] == (id)1 && objc_msgSend(v5, "type") == (id)1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);
      -[TVMusicLibraryArtistDetailViewController _playMusicVideo:](self, "_playMusicVideo:", v6);
      goto LABEL_8;
    }
  }

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistDetailViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  a4));
  if (v4)
  {
    double v5 = v4;
    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v4);
    double v4 = v5;
  }
}

- (double)headerVerticalOffset
{
  return 35.0;
}

- (BOOL)didPlayObject:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)1)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);
    if ([v5 hasVideo])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 storeAsset]);
      if (!v7)
      {

LABEL_11:
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 song]);
        if (v14)
        {
          id v15 = (void *)v14;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);
          unsigned int v17 = [v16 hasVideo];

          if (v17)
          {
            objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);
            -[TVMusicLibraryArtistDetailViewController _playMusicVideo:](self, "_playMusicVideo:", v12);
            goto LABEL_9;
          }
        }

- (void)playShuffled:(BOOL)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForAlbum:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForAlbum:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemKind]);
  [v5 setSectionKind:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemSortDescriptors]);
  [v5 setSectionSortDescriptors:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  uint64_t v14 = v10;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v5 setScopedContainers:v11];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A4BE0;
  v12[3] = &unk_10026D2A0;
  v12[4] = self;
  BOOL v13 = a3;
  [v5 performWithResponseHandler:v12];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section]) {
    double v5 = @"TVMusicCollectionViewVideoCellIdentifier";
  }
  else {
    double v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](self, "cellIdentifier"));
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistDetailViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v4));
  if (v8) {
    -[TVMusicLibraryArtistDetailViewController configureCell:forObject:](self, "configureCell:forObject:", v7, v8);
  }

  return v7;
}

- (void)configureCell:(id)a3 forObject:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if ([v6 type] == (id)2) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
  }
  else {
    uint64_t v7 = 0LL;
  }
  if ([v6 type] != (id)1)
  {
    id v9 = 0LL;
    if (!v7)
    {
      double v24 = 320.0;
      double v25 = 320.0;
      v23 = 0LL;
      objc_super v12 = 0LL;
      id v10 = 0LL;
      goto LABEL_21;
    }

- (BOOL)updateWithModelResponse:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
  if (-[TVMusicMPRequestViewController updateWithModelResponse:](&v10, "updateWithModelResponse:", v4))
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController musicVideosResponse](self, "musicVideosResponse"));
    unsigned int v7 = [v4 isEqual:v6];

    if (v7)
    {
      v9.receiver = self;
      v9.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistDetailViewController;
      BOOL v5 = -[TVMusicMPRequestViewController updateWithModelResponse:](&v9, "updateWithModelResponse:", 0LL);
    }

    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  CGFloat left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  CGFloat right = UIEdgeInsetsZero.right;
  else {
    double v8 = 100.0;
  }
  double top = UIEdgeInsetsZero.top;
  double v10 = left;
  double v11 = right;
  result.CGFloat right = v11;
  result.double bottom = v8;
  result.CGFloat left = v10;
  result.double top = top;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = objc_msgSend(a5, "section", a3, a4);
  double v6 = 560.0;
  if (!v5) {
    double v6 = 320.0;
  }
  double v7 = dbl_1001E8220[v5 == 0LL];
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  objc_super v9 = (NSString *)a4;
  id v10 = a5;
  if (UICollectionElementKindSectionHeader == v9
    && -[TVMusicLibraryArtistDetailViewController _shouldShowHeadingTitles](self, "_shouldShowHeadingTitles"))
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"TVMusicCollectionViewTextHeaderIdentifier" forIndexPath:v10]);
    if ([v10 section])
    {
      if ([v10 section] != (id)1)
      {
LABEL_10:
        [v11 setHidden:0];
        v19 = v11;
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 visibleCells]);
        -[TVMusicMPRequestViewController _adjustOffsetForHeaderViews:withCells:]( self,  "_adjustOffsetForHeaderViews:withCells:",  v17,  v18);

        goto LABEL_7;
      }

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v13 = v12;
      uint64_t v14 = @"MusicLibraryMusicVideosTitle";
    }

    else
    {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v13 = v12;
      uint64_t v14 = @"MusicLibraryAlbumsTitle";
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v14 value:&stru_100279068 table:0]);
    [v11 setHeaderText:v16];

    goto LABEL_10;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"TVMusicCollectionViewBlankHeaderIdentifier" forIndexPath:v10]);
  [v11 setHidden:1];
LABEL_7:

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults", a3));
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults", a3));
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (void)_playMusicVideo:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController _musicVideosLibraryRequest](self, "_musicVideosLibraryRequest"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);

  +[TVMusicPlaybackHelper playFromRequest:startItemIdentifiers:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:startItemIdentifiers:initialPlaybackType:",  v6,  v5,  3LL);
}

- (id)_musicVideosLibraryRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory musicVideosLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "musicVideosLibraryRequest"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  v19 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  [v3 setScopedContainers:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemSortDescriptors]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
  id v10 = (void *)MPModelPropertyAlbumLibraryAddedDate;

  if (v9 == v10)
  {
    uint64_t v13 = &MPModelPropertySongLibraryAddedDate;
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
    objc_super v12 = (void *)MPModelPropertyAlbumYear;

    if (v11 != v12) {
      goto LABEL_7;
    }
    uint64_t v13 = &MPModelPropertySongYear;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  *v13,  [v8 ascending]));
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v18 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    [v3 setItemSortDescriptors:v16];
  }

- (void)_addArtistButton
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryButtonFactory wideGoToArtistButtonWithArtistName:]( &OBJC_CLASS___TVMusicLibraryButtonFactory,  "wideGoToArtistButtonWithArtistName:",  v4));
  -[TVMusicLibraryArtistDetailViewController setArtistButton:](self, "setArtistButton:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  [v6 addTarget:self action:"_selectedArtist" forControlEvents:0x2000];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v7 contentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[TVMusicMPRequestViewController cellSpacing](self, "cellSpacing");
  double v15 = v14 + 190.0;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "setContentInset:", v9, v11, v15, v13);

  unsigned int v17 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[TVMusicLibraryArtistDetailViewController setFooterView:](self, "setFooterView:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  [v19 addSubview:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  [v22 addSubview:v23];

  double v24 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  v79 = v25;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v79, 1LL));
  -[UIFocusGuide setPreferredFocusEnvironments:](v24, "setPreferredFocusEnvironments:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  [v27 addLayoutGuide:v24];

  -[TVMusicLibraryArtistDetailViewController setBottomButtonFocusGuide:](self, "setBottomButtonFocusGuide:", v24);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v24, "leftAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v77 leftAnchor]);
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 constraintEqualToAnchor:v75]);
  v78[0] = v74;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v24, "rightAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v73 rightAnchor]);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v70]);
  v78[1] = v69;
  v71 = v24;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v24, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v68 topAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66]);
  v78[2] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](v24, "heightAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToConstant:1.0]);
  v78[3] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue([v62 leftAnchor]);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v61 leftAnchor]);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v59]);
  v78[4] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v57 rightAnchor]);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue([v56 rightAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
  v78[5] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v52 bottomAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v51 bottomAnchor]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintGreaterThanOrEqualToAnchor:v49]);
  v78[6] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v47 bottomAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v46 overlayLayoutView]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v44 bottomAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintGreaterThanOrEqualToAnchor:v43]);
  v78[7] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v41 heightAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToConstant:190.0]);
  v78[8] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v38 bottomAnchor]);
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 bottomAnchor]);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v30 constant:70.0]);
  v78[9] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController artistButton](self, "artistButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 centerXAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController footerView](self, "footerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 centerXAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v35]);
  v78[10] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 11LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v37);
}

- (void)_selectedArtist
{
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicUIMainViewController shared](&OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController, "shared"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
    [v10 showPageForArtist:v3];
LABEL_5:

    double v9 = v10;
    goto LABEL_6;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 adamID]));
  id v8 = sub_100092E80(v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v8);

  double v9 = v10;
  if (v10)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    [v3 openJavascriptAppWithURL:v10];
    goto LABEL_5;
  }

- (void)_configureForEmptyContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));

  if (v3)
  {
    if (!v5) {
      -[TVMusicLibraryArtistDetailViewController _addEmptyContentView](self, "_addEmptyContentView");
    }
    goto LABEL_6;
  }

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController emptyContentView](self, "emptyContentView"));
    [v6 removeFromSuperview];

    -[TVMusicLibraryArtistDetailViewController setEmptyContentView:](self, "setEmptyContentView:", 0LL);
LABEL_6:
    -[TVMusicLibraryArtistDetailViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  [v7 setShowPlayButtons:!v3];
}

- (void)_addEmptyContentView
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1LL);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"LibraryArtistEmptyContent" value:&stru_100279068 table:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v8));
  -[UILabel setText:](v4, "setText:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager subtitle3Font](&OBJC_CLASS___TVThemeManager, "subtitle3Font"));
  -[UILabel setFont:](v4, "setFont:", v10);

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
  -[UILabel setTextColor:](v4, "setTextColor:", v11);

  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryButtonFactory artistStartStationButton]( &OBJC_CLASS___TVMusicLibraryButtonFactory,  "artistStartStationButton"));
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 addTarget:self action:"_playArtistRadioStation" forControlEvents:0x2000];
  -[UIView addSubview:](v3, "addSubview:", v4);
  -[UIView addSubview:](v3, "addSubview:", v12);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  [v13 addSubview:v3];

  v38 = self;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v40 centerXAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v37]);
  v41[0] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistDetailViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 centerYAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33 constant:20.0]);
  v41[1] = v32;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4, "centerXAnchor"));
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v29]);
  v41[2] = v28;
  double v14 = v4;
  v30 = v4;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4, "topAnchor"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26]);
  v41[3] = v25;
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v12 centerXAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
  v41[4] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 topAnchor]);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v14, "bottomAnchor"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17 constant:45.0]);
  v41[5] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v12 bottomAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);
  v41[6] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 7LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);

  -[TVMusicLibraryArtistDetailViewController setEmptyContentView:](v38, "setEmptyContentView:", v3);
}

- (void)_playArtistRadioStation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
  +[TVMusicRadioUtilities playFromMPArtist:](&OBJC_CLASS___TVMusicRadioUtilities, "playFromMPArtist:", v2);
}

- (BOOL)_shouldShowHeadingTitles
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  if ((uint64_t)[v3 numberOfSections] < 2)
  {
    BOOL v6 = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    if ((uint64_t)[v4 numberOfItemsInSection:0] < 1)
    {
      BOOL v6 = 0;
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
      BOOL v6 = (uint64_t)[v5 numberOfItemsInSection:1] > 0;
    }
  }

  return v6;
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v6 = [v4 section];
  if ((uint64_t)v6 >= (uint64_t)[v5 numberOfSections]
    || (id v7 = [v4 item],
        (uint64_t)v7 >= (uint64_t)objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v4, "section"))))
  {
    double v9 = (os_log_s *)qword_1002BEB68;
    if (os_log_type_enabled((os_log_t)qword_1002BEB68, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Invalid index path: %@",  (uint8_t *)&v11,  0xCu);
    }

    id v8 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);
  }

  return v8;
}

- (UIControl)artistButton
{
  return self->_artistButton;
}

- (void)setArtistButton:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (MPModelLibraryResponse)musicVideosResponse
{
  return self->_musicVideosResponse;
}

- (void)setMusicVideosResponse:(id)a3
{
}

- (UIFocusGuide)bottomButtonFocusGuide
{
  return self->_bottomButtonFocusGuide;
}

- (void)setBottomButtonFocusGuide:(id)a3
{
}

- (UIView)emptyContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_emptyContentView);
}

- (void)setEmptyContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end