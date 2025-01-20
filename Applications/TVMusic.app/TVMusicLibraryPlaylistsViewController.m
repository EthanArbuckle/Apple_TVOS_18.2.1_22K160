@interface TVMusicLibraryPlaylistsViewController
- (MPModelPlaylist)parentPlaylistFolder;
- (TVMusicLibraryPlaylistsViewController)init;
- (TVMusicLibraryPlaylistsViewController)initWithParentPlaylistFolder:(id)a3;
- (double)collectionViewTop;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (id)playlistAtIndexPath:(id)a3;
- (id)subtitleForPlaylist:(id)a3;
- (id)titleForPlaylist:(id)a3;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handlePlayPauseCommand;
- (void)setParentPlaylistFolder:(id)a3;
@end

@implementation TVMusicLibraryPlaylistsViewController

- (TVMusicLibraryPlaylistsViewController)initWithParentPlaylistFolder:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  v5,  0LL,  1LL));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicLibraryPlaylistsViewController;
  v8 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v10,  "initWithTitle:libraryRequest:pageType:",  v6,  v7,  2LL);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentPlaylistFolder, a3);
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](v8, "setShowIndexBarTitles:", 1LL);
  }

  return v8;
}

- (TVMusicLibraryPlaylistsViewController)init
{
  return -[TVMusicLibraryPlaylistsViewController initWithParentPlaylistFolder:]( self,  "initWithParentPlaylistFolder:",  0LL);
}

- (id)playlistAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  return v6;
}

- (id)titleForPlaylist:(id)a3
{
  return [a3 name];
}

- (id)subtitleForPlaylist:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 curator]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return v4;
}

- (double)collectionViewTop
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController title](self, "title"));
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController title](self, "title"));
    id v6 = [v5 length];

    if (v6) {
      return 238.0;
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicLibraryPlaylistsViewController;
  -[TVMusicMPRequestViewController collectionViewTop](&v8, "collectionViewTop");
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController playlistAtIndexPath:](self, "playlistAtIndexPath:", a4));
  if ([v14 type] == (id)3)
  {
    id v5 = -[TVMusicLibraryPlaylistsViewController initWithParentPlaylistFolder:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryPlaylistsViewController),  "initWithParentPlaylistFolder:",  v14);
    -[TVMusicMPRequestViewController setPreventPopWhenEmpty:](v5, "setPreventPopWhenEmpty:", 1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController navigationController](self, "navigationController"));
    [v6 pushViewController:v5 animated:1];
  }

  else
  {
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI")
      || ![v14 isSubscribed])
    {
      goto LABEL_9;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v14 identifiers]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 personalizedStore]);
    id v9 = [v8 cloudID];

    if (v9)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPCloudController sharedCloudController]( &OBJC_CLASS___MPCloudController,  "sharedCloudController"));
      [v10 updateSubscribedPlaylistWithSagaID:v9 ignoreMinRefreshInterval:0 completionHandler:0];
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities urlForDisplayingPlaylist:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "urlForDisplayingPlaylist:",  v14));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
      [v13 openJavascriptAppWithURL:v12];
    }

    else
    {
LABEL_9:
      +[TVMusicLibraryUtilities showPageForPlaylist:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showPageForPlaylist:",  v14);
    }
  }
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if ((sub_10006DF28() & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController playlistAtIndexPath:](self, "playlistAtIndexPath:", v6));
    +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v5);
  }
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController playlistAtIndexPath:](self, "playlistAtIndexPath:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v3));

  return v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](self, "cellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:v4]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController playlistAtIndexPath:](self, "playlistAtIndexPath:", v4));
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController titleForPlaylist:](self, "titleForPlaylist:", v8));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController subtitleForPlaylist:](self, "subtitleForPlaylist:", v8));
  if ([v8 type] != (id)1)
  {
    if ([v8 type] == (id)2)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController traitCollection](self, "traitCollection"));
      id v12 = [v11 userInterfaceStyle];
      uint64_t v14 = 8LL;
    }

    else
    {
      id v15 = [v8 type];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController traitCollection](self, "traitCollection"));
      id v12 = [v11 userInterfaceStyle];
      if (v15 != (id)3)
      {
        uint64_t v13 = 6LL;
        goto LABEL_9;
      }

      uint64_t v14 = 10LL;
    }

    id v16 = sub_100030478(v14, 1uLL, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController traitCollection](self, "traitCollection"));
  id v12 = [v11 userInterfaceStyle];
  uint64_t v13 = 7LL;
LABEL_9:
  id v19 = sub_100030478(v13, 1uLL, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog]);
  uint64_t v11 = v20;
  if (v20)
  {
    id v21 = v20;
    uint64_t v11 = v21;
  }

  else
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue([v8 tracksTiledArtworkCatalogWithRows:2 columns:2]);
  }

  v18 = v21;
LABEL_13:

  [v7 setPlaceholderImage:v17];
  if (v9) {
    v22 = v9;
  }
  else {
    v22 = &stru_100279068;
  }
  [v7 setTitle:v22];
  [v7 setSubTitle:v10];
  -[TVMusicMPRequestViewController artworkSize](self, "artworkSize");
  objc_msgSend(v7, "setArtworkCatalog:withFittingSize:", v18);
  objc_msgSend( v7,  "setShowFavoriteIndicator:",  +[TVMusicLibraryUtilities isItemFavorited:](TVMusicLibraryUtilities, "isItemFavorited:", v8));

  return v7;
}

- (void)handlePlayPauseCommand
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v4 == v5)
  {
    [v16 pause];
    goto LABEL_9;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  if (v6 == (void *)v7)
  {
  }

  else
  {
    objc_super v8 = (void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v9 != v10) {
      goto LABEL_9;
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v12 = (uint64_t)[v11 totalItemCount];

  if (v12 >= 1)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 indexPathForLastFocusedItem]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryPlaylistsViewController playlistAtIndexPath:](self, "playlistAtIndexPath:", v14));
    +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  3LL,  v15);
  }

- (MPModelPlaylist)parentPlaylistFolder
{
  return self->_parentPlaylistFolder;
}

- (void)setParentPlaylistFolder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end