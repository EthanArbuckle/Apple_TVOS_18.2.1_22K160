@interface TVMusicLibraryAlbumsViewController
+ (id)propertySetForAlbumCells;
+ (void)initialize;
- (BOOL)didPlayObject:(id)a3;
- (BOOL)didSelectObject:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (MPModelArtist)artist;
- (MPModelComposer)composer;
- (MPModelGenre)genre;
- (TVMusicLibraryAlbumsViewController)init;
- (TVMusicLibraryAlbumsViewController)initWithArtist:(id)a3;
- (TVMusicLibraryAlbumsViewController)initWithCompilations:(BOOL)a3;
- (TVMusicLibraryAlbumsViewController)initWithComposer:(id)a3 showTitle:(BOOL)a4;
- (TVMusicLibraryAlbumsViewController)initWithGenre:(id)a3 showTitle:(BOOL)a4;
- (TVMusicLibraryAlbumsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (id)placeholderImage;
- (void)_getCompleteAlbumForDisplayAlbum:(id)a3 completion:(id)a4;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forObject:(id)a4;
- (void)didSelectAlbum:(id)a3;
- (void)handlePlayPauseCommand;
- (void)playShuffled:(BOOL)a3;
- (void)setArtist:(id)a3;
- (void)setComposer:(id)a3;
- (void)setGenre:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryAlbumsViewController

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicLibraryAlbumsViewController");
  v3 = (void *)qword_1002BE858;
  qword_1002BE858 = (uint64_t)v2;
}

- (TVMusicLibraryAlbumsViewController)init
{
  return -[TVMusicLibraryAlbumsViewController initWithCompilations:](self, "initWithCompilations:", 0LL);
}

- (TVMusicLibraryAlbumsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicLibraryAlbumsViewController;
  v10 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v16,  "initWithTitle:libraryRequest:pageType:",  v8,  v9,  a5);
  if (v10)
  {
    objc_initWeak(&location, v10);
    objc_copyWeak(&v14, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController headerView]( v10,  "headerView",  _NSConcreteStackBlock,  3221225472LL,  sub_100031EB0,  &unk_100269F48));
    [v11 setPlayHandler:&v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (TVMusicLibraryAlbumsViewController)initWithCompilations:(BOOL)a3
{
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory compilationsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "compilationsLibraryRequest"));
    uint64_t v6 = 11LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
    uint64_t v6 = 5LL;
  }

  id v7 = objc_msgSend((id)objc_opt_class(self, v4), "propertySetForAlbumCells");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setItemProperties:v8];

  id v9 = -[TVMusicLibraryAlbumsViewController initWithTitle:libraryRequest:pageType:]( self,  "initWithTitle:libraryRequest:pageType:",  0LL,  v5,  v6);
  v10 = v9;
  if (v9)
  {
    v12.receiver = v9;
    v12.super_class = (Class)&OBJC_CLASS___TVMusicLibraryAlbumsViewController;
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](&v12, "setShowIndexBarTitles:", 1LL);
  }

  return v10;
}

- (TVMusicLibraryAlbumsViewController)initWithGenre:(id)a3 showTitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "propertySetForAlbumCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v8 setItemProperties:v11];

  id v18 = v7;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v8 setScopedContainers:v12];

  if (v4) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  }
  else {
    uint64_t v13 = 0LL;
  }
  if (v7) {
    uint64_t v14 = 13LL;
  }
  else {
    uint64_t v14 = 5LL;
  }
  v15 = -[TVMusicLibraryAlbumsViewController initWithTitle:libraryRequest:pageType:]( self,  "initWithTitle:libraryRequest:pageType:",  v13,  v8,  v14);
  objc_super v16 = v15;
  if (v7 && v15)
  {
    objc_storeStrong((id *)&v15->_genre, a3);
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](v16, "setShowIndexBarTitles:", 1LL);
  }

  return v16;
}

- (TVMusicLibraryAlbumsViewController)initWithArtist:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequestForArtist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequestForArtist:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  id v8 = -[TVMusicLibraryAlbumsViewController initWithTitle:libraryRequest:pageType:]( self,  "initWithTitle:libraryRequest:pageType:",  v7,  v6,  12LL);

  if (v5 && v8) {
    objc_storeStrong((id *)&v8->_artist, a3);
  }

  return v8;
}

- (TVMusicLibraryAlbumsViewController)initWithComposer:(id)a3 showTitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v14 = v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v8 setScopedContainers:v9];

  if (v4) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  }
  else {
    id v10 = 0LL;
  }
  v11 = -[TVMusicLibraryAlbumsViewController initWithTitle:libraryRequest:pageType:]( self,  "initWithTitle:libraryRequest:pageType:",  v10,  v8,  14LL);
  objc_super v12 = v11;
  if (v7 && v11) {
    objc_storeStrong((id *)&v11->_composer, a3);
  }

  return v12;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVMusicLibraryAlbumsViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v2, "viewDidLoad");
}

- (BOOL)didSelectObject:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 album]);
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100032374;
    v6[3] = &unk_10026A160;
    v6[4] = self;
    -[TVMusicLibraryAlbumsViewController _getCompleteAlbumForDisplayAlbum:completion:]( self,  "_getCompleteAlbumForDisplayAlbum:completion:",  v4,  v6);
  }

  return v4 != 0LL;
}

- (void)didSelectAlbum:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController genre](self, "genre"));

  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000324B8;
    v11[3] = &unk_100269278;
    uint64_t v6 = &v12;
    id v12 = v4;
    +[TVMusicLibraryUtilities findSingleMusicVideoInAlbum:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findSingleMusicVideoInAlbum:completionHandler:",  v4,  v11);
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000325B8;
    v9[3] = &unk_100268CF0;
    uint64_t v6 = &v10;
    id v10 = v4;
    id v7 = v9;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100033244;
    block[3] = &unk_100268D60;
    id v14 = v7;
    id v8 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (BOOL)didPlayObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100032684;
    v8[3] = &unk_10026A160;
    id v9 = v4;
    -[TVMusicLibraryAlbumsViewController _getCompleteAlbumForDisplayAlbum:completion:]( self,  "_getCompleteAlbumForDisplayAlbum:completion:",  v6,  v8);
  }

  return v5 != 0LL;
}

- (void)_getCompleteAlbumForDisplayAlbum:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);

  uint64_t v13 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  [v7 setAllowedItemIdentifiers:v9];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000328C4;
  v11[3] = &unk_10026A188;
  id v12 = v5;
  id v10 = v5;
  [v7 performWithResponseHandler:v11];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryAlbumsViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  a4));
  -[TVMusicLibraryAlbumsViewController didSelectObject:](self, "didSelectObject:", v5);
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryAlbumsViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v6));
    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v5);
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](self, "cellIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryAlbumsViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v4));
  -[TVMusicLibraryAlbumsViewController configureCell:forObject:](self, "configureCell:forObject:", v7, v8);

  return v7;
}

- (id)placeholderImage
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController traitCollection](self, "traitCollection"));
  id v3 = sub_100030478(1, 1uLL, [v2 userInterfaceStyle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)handlePlayPauseCommand
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v5)
  {
    [v14 pause];
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
    if (v6 == (void *)v7)
    {

LABEL_7:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 indexPathForLastFocusedItem]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryAlbumsViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v12));

      -[TVMusicLibraryAlbumsViewController didPlayObject:](self, "didPlayObject:", v13);
      goto LABEL_8;
    }

    id v8 = (void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v9 == v10) {
      goto LABEL_7;
    }
  }

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v6 = [v4 item];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForGlobalIndex:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v9));
  return v10;
}

- (void)configureCell:(id)a3 forObject:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if ([v6 type] == (id)2)
  {
    [v19 setImageShape:0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"UnknownAlbum" value:&stru_100279068 table:0]);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 artist]);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 name]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 artworkCatalog]);
  }

  else
  {
    v11 = 0LL;
    id v12 = 0LL;
    id v10 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController placeholderImage](self, "placeholderImage"));
  [v19 setPlaceholderImage:v15];

  if (v10) {
    objc_super v16 = v10;
  }
  else {
    objc_super v16 = &stru_100279068;
  }
  [v19 setTitle:v16];
  if (v12) {
    v17 = v12;
  }
  else {
    v17 = &stru_100279068;
  }
  [v19 setSubTitle:v17];
  -[TVMusicMPRequestViewController artworkSize](self, "artworkSize");
  objc_msgSend(v19, "setArtworkCatalog:withFittingSize:", v11);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
  objc_msgSend( v19,  "setShowFavoriteIndicator:",  +[TVMusicLibraryUtilities isItemFavorited:](TVMusicLibraryUtilities, "isItemFavorited:", v18));
}

- (void)playShuffled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController genre](self, "genre"));
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController artist](self, "artist"));
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryAlbumsViewController composer](self, "composer"));
    }
    id v7 = v10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForAlbum:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForAlbum:",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 itemKind]);
  [v11 setSectionKind:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 itemSortDescriptors]);
  [v11 setSectionSortDescriptors:v15];

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  objc_msgSend(v11, "setFilteringOptions:", objc_msgSend(v16, "filteringOptions"));

  if (v7)
  {
    id v18 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    [v11 setScopedContainers:v17];
  }

  +[TVMusicPlaybackHelper playFromRequest:shuffle:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:shuffle:initialPlaybackType:",  v11,  v3,  1LL);
}

+ (id)propertySetForAlbumCells
{
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v12[0] = MPModelPropertyAlbumArtwork;
  v12[1] = MPModelPropertyAlbumIsFavorite;
  v12[2] = MPModelPropertyAlbumTitle;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  uint64_t v10 = MPModelRelationshipAlbumArtist;
  uint64_t v9 = MPModelPropertyArtistName;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v4));
  v11 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v7 = [v2 initWithProperties:v3 relationships:v6];

  return v7;
}

- (MPModelArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (MPModelGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (MPModelComposer)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end