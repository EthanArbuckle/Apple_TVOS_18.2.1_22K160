@interface TVMusicLibraryRecentlyAddedViewController
- (TVMusicLibraryRecentlyAddedViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5;
- (UIControl)playButton;
- (UIControl)shuffleAllButton;
- (double)collectionViewTop;
- (id)_placeholderImageForObjectType:(int64_t)a3;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (int64_t)updateTypeForIndexPath:(id)a3;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handlePlayPauseCommand;
- (void)setPlayButton:(id)a3;
- (void)setShuffleAllButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryRecentlyAddedViewController

- (TVMusicLibraryRecentlyAddedViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicLibraryRecentlyAddedViewController;
  v5 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v12,  "initWithTitle:libraryRequest:pageType:",  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v5, "collectionView"));
    objc_msgSend( v7,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicLibraryCollectionViewCell, v8),  @"TVMusicCollectionViewCellIdentifierMovie");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v6, "collectionView"));
    objc_msgSend( v9,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicLibraryCollectionViewCell, v10),  @"TVMusicCollectionViewCellIdentifierMusicVideo");
  }

  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryRecentlyAddedViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  [v3 removeFromSuperview];
}

- (double)collectionViewTop
{
  return 195.0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  switch((unint64_t)[v7 type])
  {
    case 2uLL:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000A8AF8;
      v20[3] = &unk_100269278;
      id v21 = v7;
      +[TVMusicLibraryUtilities findSingleMusicVideoInAlbum:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findSingleMusicVideoInAlbum:completionHandler:",  v8,  v20);

      goto LABEL_13;
    case 4uLL:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
      if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI")
        || ![v8 isSubscribed])
      {
        goto LABEL_12;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personalizedStore]);
      id v11 = [v10 cloudID];

      if (v11)
      {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPCloudController sharedCloudController]( &OBJC_CLASS___MPCloudController,  "sharedCloudController"));
        [v12 updateSubscribedPlaylistWithSagaID:v11 ignoreMinRefreshInterval:0 completionHandler:0];
      }

      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities urlForDisplayingPlaylist:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "urlForDisplayingPlaylist:",  v8));
      if (v13)
      {
        v14 = (void *)v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
        [v15 openJavascriptAppWithURL:v14];
      }

      else
      {
LABEL_12:
        +[TVMContextMenus getPropertiesWithLibraryObject:completion:]( &OBJC_CLASS___TVMContextMenus,  "getPropertiesWithLibraryObject:completion:",  v7,  &stru_10026D300);
      }

- (int64_t)updateTypeForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController previousMPResults](self, "previousMPResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemAtIndexPath:v4]);

  if ([v8 type] != (id)2 || objc_msgSend(v6, "type") != (id)2) {
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 album]);
  id v10 = [v9 trackCount];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
  if (v10 != [v11 trackCount])
  {

    goto LABEL_8;
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v8 album]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
  unsigned int v19 = [v13 hasVideo];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 representativeSong]);
  unsigned int v18 = [v15 hasVideo];

  if (v19 != v18)
  {
LABEL_8:
    int64_t v16 = 2LL;
    goto LABEL_6;
  }

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  BOOL v7 = 0LL;
  uint64_t v8 = 0LL;
  v9 = 0LL;
  id v10 = 0LL;
  id v11 = 0LL;
  switch((unint64_t)[v6 type])
  {
    case 2uLL:
      v50 = v6;
      id v51 = v4;
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
      v14 = v13;
      if (v13)
      {
        v9 = v13;
      }

      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"UnknownAlbum" value:&stru_100279068 table:0]);
      }

      if ([v12 trackCount] == (id)1
        && (v24 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]),
            unsigned int v25 = [v24 hasVideo],
            v24,
            v25))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 title]);

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
          uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 title]);

          v9 = (__CFString *)v29;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( [v30 dequeueReusableCellWithReuseIdentifier:@"TVMusicCollectionViewCellIdentifierMusicVideo" forIndexPath:v51]);

        [v22 setImageShape:1];
        v31 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
        BOOL v7 = +[TVMusicLibraryUtilities isItemFavorited:](&OBJC_CLASS___TVMusicLibraryUtilities, "isItemFavorited:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryRecentlyAddedViewController traitCollection](self, "traitCollection"));
        id v33 = sub_100030478(4, 1uLL, [v32 userInterfaceStyle]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v34 artworkCatalog]);
      }

      else
      {
        BOOL v7 = +[TVMusicLibraryUtilities isItemFavorited:](&OBJC_CLASS___TVMusicLibraryUtilities, "isItemFavorited:", v12);
        id v11 = 0LL;
        uint64_t v8 = 0LL;
        v22 = 0LL;
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue([v12 artist]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 name]);
      if (v36 || ([v12 isCompilation] & 1) == 0)
      {
        id v10 = v36;
      }

      else
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( [v49 localizedStringForKey:@"MusicLibraryRecentlyAddedSubtitleVariousArtists" value:&stru_100279068 table:0]);
      }

      id v4 = v51;
      if (v8) {
        goto LABEL_22;
      }
      goto LABEL_21;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 8uLL:
      goto LABEL_37;
    case 4uLL:
      id v52 = v4;
      v15 = v6;
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 playlist]);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 name]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 curator]);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
      unsigned int v19 = v18;
      if (v18)
      {
        id v10 = v18;
      }

      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"MusicLibraryRecentlyAddedSubtitlePlaylist" value:&stru_100279068 table:0]);
      }

      if ([v16 type] == (id)1)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryRecentlyAddedViewController traitCollection](self, "traitCollection"));
        id v39 = sub_100030478(7, 1uLL, [v38 userInterfaceStyle]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue([v16 artworkCatalog]);
        id v41 = v40;
        if (v40)
        {
          id v42 = v40;
          id v41 = v42;
        }

        else
        {
          id v42 = (id)objc_claimAutoreleasedReturnValue([v16 tracksTiledArtworkCatalogWithRows:2 columns:2]);
        }

        uint64_t v8 = v42;
        goto LABEL_34;
      }

      if ([v16 type] == (id)2)
      {
        id v41 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryRecentlyAddedViewController traitCollection](self, "traitCollection"));
        id v43 = sub_100030478(8, 1uLL, [v41 userInterfaceStyle]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v43);
        uint64_t v8 = 0LL;
LABEL_34:
        id v4 = v52;
        goto LABEL_35;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([v16 artworkCatalog]);
      id v41 = v44;
      id v4 = v52;
      if (v44)
      {
        id v41 = v44;
        id v11 = 0LL;
        uint64_t v8 = v41;
      }

      else
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v16 tracksTiledArtworkCatalogWithRows:2 columns:2]);
        id v11 = 0LL;
      }

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

    if ([v7 type] == (id)2)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000A973C;
      v9[3] = &unk_10026D388;
      id v11 = &stru_10026D340;
      id v10 = v7;
      +[TVMusicLibraryUtilities findSingleMusicVideoInAlbum:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findSingleMusicVideoInAlbum:completionHandler:",  v8,  v9);
    }

    else
    {
      +[TVMusicContextMenuFactory contextMenuForLibraryObject:completionHandler:]( &OBJC_CLASS___TVMusicContextMenuFactory,  "contextMenuForLibraryObject:completionHandler:",  v7,  &stru_10026D360);
    }
  }
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  return v6;
}

- (id)_placeholderImageForObjectType:(int64_t)a3
{
  int64_t v3 = a3 - 2;
  if ((unint64_t)(a3 - 2) <= 7 && ((0xA5u >> v3) & 1) != 0)
  {
    uint64_t v4 = qword_1001E8278[v3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryRecentlyAddedViewController traitCollection](self, "traitCollection"));
    id v6 = sub_100030478(v4, 1uLL, [v5 userInterfaceStyle]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

- (void)handlePlayPauseCommand
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v5)
  {
    [v17 pause];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
    if (v6 == (void *)v7)
    {

      goto LABEL_7;
    }

    uint64_t v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v9 == v10)
    {
LABEL_7:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 indexPathForLastFocusedItem]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 itemAtIndexPath:v13]);

      if ([v14 type] == (id)2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 album]);
        uint64_t v16 = 1LL;
      }

      else if ([v14 type] == (id)4)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playlist]);
        uint64_t v16 = 3LL;
      }

      else if ([v14 type] == (id)9)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 movie]);
        uint64_t v16 = 7LL;
      }

      else
      {
        if ([v14 type] != (id)7)
        {
LABEL_16:

          goto LABEL_17;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 season]);
        uint64_t v16 = 9LL;
      }

      +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  v16,  v15);

      goto LABEL_16;
    }
  }

- (UIControl)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (UIControl)shuffleAllButton
{
  return self->_shuffleAllButton;
}

- (void)setShuffleAllButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end