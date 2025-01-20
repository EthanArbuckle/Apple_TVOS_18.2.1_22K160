@interface TVMusicLibraryVideosViewController
- (CGPoint)cellSpacing;
- (CGSize)artworkSize;
- (CGSize)cellSize;
- (TVMusicLibraryVideosViewController)init;
- (id)_musicVideoAtIndexPath:(id)a3;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (id)placeholderImage;
- (void)_playFromItemAtIndexPath:(id)a3;
- (void)_selectedPlayButton;
- (void)_selectedShuffleButton;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handlePlayPauseCommand;
@end

@implementation TVMusicLibraryVideosViewController

- (TVMusicLibraryVideosViewController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory musicVideosLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "musicVideosLibraryRequest"));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicLibraryVideosViewController;
  v4 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v10,  "initWithTitle:libraryRequest:pageType:",  0LL,  v3,  9LL);

  if (v4)
  {
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](v4, "setShowIndexBarTitles:", 1LL);
    objc_initWeak(&location, v4);
    objc_copyWeak(&v8, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController headerView]( v4,  "headerView",  _NSConcreteStackBlock,  3221225472LL,  sub_1000366BC,  &unk_100269F48));
    [v5 setPlayHandler:&v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (CGPoint)cellSpacing
{
  double v2 = 40.0;
  double v3 = 52.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)cellSize
{
  double v2 = 376.0;
  double v3 = 295.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)artworkSize
{
  double v2 = 436.0;
  double v3 = 245.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_selectedPlayButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v4 = (uint64_t)[v3 totalItemCount];

  if (v4 >= 1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    -[TVMusicLibraryVideosViewController _playFromItemAtIndexPath:](self, "_playFromItemAtIndexPath:", v5);
  }

- (void)_selectedShuffleButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v4 = (uint64_t)[v3 totalItemCount];

  if (v4 >= 1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
    +[TVMusicPlaybackHelper playFromRequest:shuffle:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:shuffle:initialPlaybackType:",  v5,  1LL,  3LL);
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController _musicVideoAtIndexPath:](self, "_musicVideoAtIndexPath:", v6));
    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v5);
  }
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController _musicVideoAtIndexPath:](self, "_musicVideoAtIndexPath:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v3));

  return v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](self, "cellIdentifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:v4]);

  [v7 setImageShape:1];
  [v7 setMaximumImageHeight:212.0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController _musicVideoAtIndexPath:](self, "_musicVideoAtIndexPath:", v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  [v7 setTitle:v9];

  objc_msgSend(v7, "setIsExplicit:", objc_msgSend(v8, "isExplicitSong"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v8 artist]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 name]);
  v12 = (void *)v11;
  v13 = &stru_100279068;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  [v7 setSubTitle:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController placeholderImage](self, "placeholderImage"));
  [v7 setPlaceholderImage:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog]);
  -[TVMusicLibraryVideosViewController artworkSize](self, "artworkSize");
  objc_msgSend(v7, "setArtworkCatalog:withFittingSize:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 storeAsset]);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 storeAsset]);
    objc_msgSend(v7, "setGreyedOut:", objc_msgSend(v18, "isRedownloadable") ^ 1);
  }

  else
  {
    [v7 setGreyedOut:0];
  }

  objc_msgSend( v7,  "setShowFavoriteIndicator:",  +[TVMusicLibraryUtilities isItemFavorited:](TVMusicLibraryUtilities, "isItemFavorited:", v8));
  return v7;
}

- (id)placeholderImage
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController traitCollection](self, "traitCollection"));
  id v3 = sub_100030478(11, 1uLL, [v2 userInterfaceStyle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)handlePlayPauseCommand
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v5)
  {
    [v13 pause];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
    if (v6 == (void *)v7)
    {

LABEL_7:
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 indexPathForLastFocusedItem]);

      -[TVMusicLibraryVideosViewController _playFromItemAtIndexPath:](self, "_playFromItemAtIndexPath:", v12);
      goto LABEL_8;
    }

    id v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v9 == v10) {
      goto LABEL_7;
    }
  }

- (void)_playFromItemAtIndexPath:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryVideosViewController _musicVideoAtIndexPath:](self, "_musicVideoAtIndexPath:", a3));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v10 storeAsset]);
  if (!v4
    || (id v5 = (void *)v4,
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 storeAsset]),
        unsigned int v7 = [v6 isRedownloadable],
        v6,
        v5,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
    +[TVMusicPlaybackHelper playFromRequest:startItemIdentifiers:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:startItemIdentifiers:initialPlaybackType:",  v8,  v9,  3LL);
  }
}

- (id)_musicVideoAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v6 = [v4 item];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForGlobalIndex:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v7]);

  return v9;
}

@end