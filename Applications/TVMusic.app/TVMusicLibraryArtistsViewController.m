@interface TVMusicLibraryArtistsViewController
- (CGPoint)cellSpacing;
- (CGSize)cellSize;
- (NSCache)artistCache;
- (TVMusicLibraryArtistsViewController)init;
- (UIImage)placeholderImage;
- (id)_artistForItemAtGlobalIndex:(int64_t)a3 prefetch:(BOOL)a4;
- (id)_artistForItemAtIndexpath:(id)a3;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (void)_playShuffled:(BOOL)a3;
- (void)_prefetchFromIndex:(int64_t)a3;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)handlePlayPauseCommand;
- (void)setArtistCache:(id)a3;
- (void)setMpResults:(id)a3 completion:(id)a4;
- (void)setPlaceholderImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryArtistsViewController

- (TVMusicLibraryArtistsViewController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistsViewController;
  v4 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v7,  "initWithTitle:libraryRequest:pageType:",  0LL,  v3,  4LL);

  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistsViewController;
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](&v6, "setShowIndexBarTitles:", 1LL);
  }

  return v4;
}

- (CGSize)cellSize
{
  double v2 = 273.0;
  double v3 = 320.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)cellSpacing
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistsViewController;
  -[TVMusicMPRequestViewController cellSpacing](&v4, "cellSpacing");
  double v3 = 52.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setMpResults:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController artistCache](self, "artistCache"));
  [v8 removeAllObjects];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistsViewController;
  -[TVMusicMPRequestViewController setMpResults:completion:](&v9, "setMpResults:completion:", v7, v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtIndexpath:]( self,  "_artistForItemAtIndexpath:",  a4));
  if (v4)
  {
    v5 = v4;
    +[TVMusicLibraryUtilities showPageForArtist:](&OBJC_CLASS___TVMusicLibraryUtilities, "showPageForArtist:", v4);
    objc_super v4 = v5;
  }
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtIndexpath:]( self,  "_artistForItemAtIndexpath:",  v6));
    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v5);
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicLibraryArtistsViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v10, "viewDidLoad");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v3 setPrefetchDataSource:self];

  objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
  -[TVMusicLibraryArtistsViewController setArtistCache:](self, "setArtistCache:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController artistCache](self, "artistCache"));
  [v5 setCountLimit:200];

  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController headerView]( self,  "headerView",  _NSConcreteStackBlock,  3221225472LL,  sub_1000D8CBC,  &unk_100269F48));
  [v6 setPlayHandler:&v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtGlobalIndex:prefetch:]( self,  "_artistForItemAtGlobalIndex:prefetch:",  [a3 item],  0));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v3));

  return v4;
}

- (void)_playShuffled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForArtist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForArtist:",  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemKind]);
  [v10 setSectionKind:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemSortDescriptors]);
  [v10 setSectionSortDescriptors:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  objc_msgSend(v10, "setFilteringOptions:", objc_msgSend(v9, "filteringOptions"));

  +[TVMusicPlaybackHelper playFromRequest:shuffle:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:shuffle:initialPlaybackType:",  v10,  v3,  1LL);
}

- (id)_artistForItemAtIndexpath:(id)a3
{
  return -[TVMusicLibraryArtistsViewController _artistForItemAtGlobalIndex:prefetch:]( self,  "_artistForItemAtGlobalIndex:prefetch:",  [a3 item],  1);
}

- (id)_artistForItemAtGlobalIndex:(int64_t)a3 prefetch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController artistCache](self, "artistCache"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForGlobalIndex:a3]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v12 itemAtIndexPath:v11]);

    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController artistCache](self, "artistCache"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      [v13 setObject:v9 forKey:v14];
    }

    if (v4) {
      -[TVMusicLibraryArtistsViewController _prefetchFromIndex:](self, "_prefetchFromIndex:", a3 + 1);
    }
  }

  return v9;
}

- (void)_prefetchFromIndex:(int64_t)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D900C;
  v7[3] = &unk_100268E30;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (UIImage)placeholderImage
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController traitCollection](self, "traitCollection"));
  id v3 = sub_100030478(3, 1uLL, [v2 userInterfaceStyle]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (UIImage *)v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](self, "cellIdentifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:v4]);

  [v7 setImageShape:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtIndexpath:]( self,  "_artistForItemAtIndexpath:",  v4));

  objc_super v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryArtistsViewController placeholderImage](self, "placeholderImage"));
  [v7 setPlaceholderImage:v11];

  if (v9) {
    v12 = v9;
  }
  else {
    v12 = &stru_100279068;
  }
  [v7 setTitle:v12];
  -[TVMusicMPRequestViewController artworkSize](self, "artworkSize");
  objc_msgSend(v7, "setArtworkCatalog:withFittingSize:", v10);
  objc_msgSend( v7,  "setShowFavoriteIndicator:",  +[TVMusicLibraryUtilities isItemFavorited:](TVMusicLibraryUtilities, "isItemFavorited:", v8));

  return v7;
}

- (void)handlePlayPauseCommand
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v5)
  {
    [v14 pause];
    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  if (v6 == (void *)v7)
  {
  }

  else
  {
    id v8 = (void *)v7;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v9 != v10) {
      goto LABEL_10;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 indexPathForLastFocusedItem]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtIndexpath:]( self,  "_artistForItemAtIndexpath:",  v12));

  if (v13) {
    +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  4LL,  v13);
  }

LABEL_10:
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryArtistsViewController _artistForItemAtGlobalIndex:prefetch:]( self,  "_artistForItemAtGlobalIndex:prefetch:",  [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) item],  0));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 artworkCatalog]);
        -[TVMusicMPRequestViewController artworkSize](self, "artworkSize");
        objc_msgSend(v11, "setFittingSize:");
        [v11 requestImageWithCompletion:&stru_10026E220];

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (NSCache)artistCache
{
  return self->_artistCache;
}

- (void)setArtistCache:(id)a3
{
}

- (void)setPlaceholderImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end