@interface TVMusicLibraryShowsViewController
- (BOOL)_shouldShowHeadingTitles;
- (CGPoint)cellSpacing;
- (CGSize)artworkSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDateComponentsFormatter)durationFormatter;
- (TVMusicLibraryShowsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionViewTop;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)cellIdentifier;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)handlePlayPauseCommand;
- (void)setMpResults:(id)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryShowsViewController

- (TVMusicLibraryShowsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicLibraryShowsViewController;
  v4 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v15,  "initWithTitle:libraryRequest:pageType:",  0LL,  a4,  8LL);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v4, "collectionView"));
    objc_msgSend( v6,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicLibraryCollectionViewCell, v7),  @"TVMusicCollectionViewMovieCellIdentifier");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v5, "collectionView"));
    objc_msgSend( v8,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicLibraryCollectionViewCell, v9),  @"TVMusicCollectionViewTVShowCellIdentifier");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v5, "collectionView"));
    objc_msgSend( v10,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(TVMusicSectionHeaderView, v11),  UICollectionElementKindSectionHeader,  @"TVMusicCollectionViewTextHeaderIdentifier");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v5, "collectionView"));
    objc_msgSend( v12,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(UICollectionReusableView, v13),  UICollectionElementKindSectionHeader,  @"TVMusicCollectionViewBlankHeaderIdentifier");
  }

  return v5;
}

- (double)collectionViewTop
{
  return 238.0;
}

- (CGPoint)cellSpacing
{
  double v2 = 40.0;
  double v3 = 94.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryShowsViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v4, "viewDidLoad");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  [v3 removeFromSuperview];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPModelTVShow, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100058618;
    v14[3] = &unk_10026B2B8;
    id v15 = v7;
    v16 = self;
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVSeasonsLibraryRequestForShow:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVSeasonsLibraryRequestForShow:",  v15));
    id v11 = v17;
    id v12 = v15;
    [v11 performWithResponseHandler:v14];
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPModelMovie, v10);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0) {
      +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  7LL,  v7);
    }
  }
}

- (void)setMpResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS___MPMutableSectionedCollection);
  [v8 appendSection:&stru_100279068];
  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allItems]);
    [v8 appendItems:v9];
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000589FC;
  v13[3] = &unk_10026B308;
  id v15 = self;
  id v16 = v7;
  id v14 = v8;
  id v11 = v7;
  id v12 = v8;
  [v10 performWithResponseHandler:v13];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPModelMovie, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  uint64_t v10 = @"TVMusicCollectionViewTVShowCellIdentifier";
  if ((isKindOfClass & 1) != 0) {
    uint64_t v10 = @"TVMusicCollectionViewMovieCellIdentifier";
  }
  id v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v4]);

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPModelTVShow, v14);
  if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
  {
    [v13 setImageShape:0];
    id v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 artworkCatalog]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 title]);
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"EpisodesCount" value:&stru_100279068 table:0]);
    id v22 = [v17 episodesCount];

    v23 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v21,  v22));
    uint64_t v24 = 12LL;
LABEL_11:

    goto LABEL_12;
  }

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___MPModelMovie, v16);
  if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
  {
    [v13 setImageShape:2];
    [v13 setMaximumImageHeight:410.0];
    id v20 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);
    [v20 duration];
    if (v26 <= 0.0)
    {
      v23 = &stru_100279068;
    }

    else
    {
      double v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryShowsViewController durationFormatter](self, "durationFormatter"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringFromTimeInterval:v27]);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v29,  "stringByReplacingOccurrencesOfString:withString:",  @", ",  @" "));
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v20 artworkCatalog]);
    uint64_t v24 = 13LL;
    goto LABEL_11;
  }

  uint64_t v24 = 0LL;
  v19 = 0LL;
  v18 = 0LL;
  v23 = &stru_100279068;
LABEL_12:
  [v13 setTitle:v19];
  [v13 setSubTitle:v23];
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryShowsViewController traitCollection](self, "traitCollection"));
  id v31 = sub_100030478(v24, 1uLL, [v30 userInterfaceStyle]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v13 setPlaceholderImage:v32];

  -[TVMusicLibraryShowsViewController artworkSize](self, "artworkSize");
  objc_msgSend(v13, "setArtworkCatalog:withFittingSize:", v18);

  return v13;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicLibraryShowsViewController;
  id v10 = a3;
  -[TVMusicMPRequestViewController collectionView:didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "collectionView:didUpdateFocusInContext:withAnimationCoordinator:",  v10,  v8,  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "visibleSupplementaryViewsOfKind:",  UICollectionElementKindSectionHeader,  v12.receiver,  v12.super_class));

  if (v11) {
    -[TVMusicMPRequestViewController _updateHeaderViews:forFocusContext:withAnimationCoordinator:]( self,  "_updateHeaderViews:forFocusContext:withAnimationCoordinator:",  v11,  v8,  v9);
  }
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v7 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v7]);

    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v6);
  }
}

- (CGSize)artworkSize
{
  double v2 = 273.0;
  double v3 = 410.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)cellIdentifier
{
  return @"TVMusicCollectionViewMovieCellIdentifier";
}

- (NSDateComponentsFormatter)durationFormatter
{
  durationFormatter = self->_durationFormatter;
  if (!durationFormatter)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    id v5 = self->_durationFormatter;
    self->_durationFormatter = v4;

    -[NSDateComponentsFormatter setAllowedUnits:](self->_durationFormatter, "setAllowedUnits:", 96LL);
    -[NSDateComponentsFormatter setUnitsStyle:](self->_durationFormatter, "setUnitsStyle:", 2LL);
    durationFormatter = self->_durationFormatter;
  }

  return durationFormatter;
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v6));
  return v7;
}

- (BOOL)_shouldShowHeadingTitles
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
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

- (void)handlePlayPauseCommand
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v3 indexPathForLastFocusedItem]);

  id v4 = v12;
  if (v12)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v12]);

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPModelTVShow, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      uint64_t v10 = 10LL;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPModelMovie, v9);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) == 0)
      {
LABEL_7:

        id v4 = v12;
        goto LABEL_8;
      }

      uint64_t v10 = 7LL;
    }

    +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  v10,  v6);
    goto LABEL_7;
  }

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (NSString *)a4;
  id v10 = a5;
  if (UICollectionElementKindSectionHeader == v9
    && -[TVMusicLibraryShowsViewController _shouldShowHeadingTitles](self, "_shouldShowHeadingTitles"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"TVMusicCollectionViewTextHeaderIdentifier" forIndexPath:v10]);
    if ([v10 section])
    {
      if ([v10 section] != (id)1)
      {
LABEL_10:
        v21 = v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 visibleCells]);
        -[TVMusicMPRequestViewController _adjustOffsetForHeaderViews:withCells:]( self,  "_adjustOffsetForHeaderViews:withCells:",  v19,  v20);

        uint64_t v15 = v11;
        uint64_t v16 = 0LL;
        goto LABEL_7;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v13 = v12;
      uint64_t v14 = @"MusicLibraryMovies";
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v13 = v12;
      uint64_t v14 = @"MusicLibraryTVShows";
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v14 value:&stru_100279068 table:0]);
    [v11 setHeaderText:v18];

    goto LABEL_10;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"TVMusicCollectionViewBlankHeaderIdentifier" forIndexPath:v10]);
  uint64_t v11 = v15;
  uint64_t v16 = 1LL;
LABEL_7:
  [v15 setHidden:v16];

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults", a3));
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults", a3));
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  if (objc_msgSend(a5, "section", a3, a4) == (id)1)
  {
    double v6 = 492.0;
    double v7 = 273.0;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVMusicLibraryShowsViewController;
    -[TVMusicMPRequestViewController cellSize](&v8, "cellSize");
  }

  result.height = v6;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if (a5 == 1)
  {
    double left = 0.0;
    double top = 25.0;
    double bottom = 0.0;
    double right = 0.0;
  }

  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }

  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end