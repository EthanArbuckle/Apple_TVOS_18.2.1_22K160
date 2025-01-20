@interface TVMusicLibraryViewController
+ (id)TVShowsViewController;
+ (id)albumsViewControllerForAllAlbums;
+ (id)albumsViewControllerForArtist:(id)a3;
+ (id)albumsViewControllerForComposer:(id)a3;
+ (id)albumsViewControllerForGenre:(id)a3;
+ (id)artistsViewController;
+ (id)compilationsViewController;
+ (id)composersViewController;
+ (id)madeForYouViewController;
+ (id)musicVideosViewController;
+ (id)playlistsViewController;
+ (id)recentlyAddedViewController;
+ (id)songsViewControllerForAllSongs;
+ (void)albumDetailsViewController:(id)a3 completion:(id)a4;
+ (void)albumDetailsViewController:(id)a3 genre:(id)a4 composer:(id)a5 completion:(id)a6;
+ (void)playlistDetailsViewController:(id)a3 completion:(id)a4;
@end

@implementation TVMusicLibraryViewController

+ (id)albumsViewControllerForAllAlbums
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryAlbumsViewController);
}

+ (id)albumsViewControllerForGenre:(id)a3
{
  id v3 = a3;
  v4 = -[TVMusicLibraryAlbumsViewController initWithGenre:showTitle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryAlbumsViewController),  "initWithGenre:showTitle:",  v3,  0LL);

  return v4;
}

+ (id)albumsViewControllerForArtist:(id)a3
{
  id v3 = a3;
  v4 = -[TVMusicLibraryArtistDetailViewController initWithArtist:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryArtistDetailViewController),  "initWithArtist:",  v3);

  return v4;
}

+ (id)albumsViewControllerForComposer:(id)a3
{
  id v3 = a3;
  v4 = -[TVMusicLibraryAlbumsViewController initWithComposer:showTitle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryComposerDetailViewController),  "initWithComposer:showTitle:",  v3,  1LL);

  return v4;
}

+ (id)artistsViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryArtistsViewController);
}

+ (id)compilationsViewController
{
  return  -[TVMusicLibraryAlbumsViewController initWithCompilations:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryAlbumsViewController),  "initWithCompilations:",  1LL);
}

+ (id)composersViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryComposersViewController);
}

+ (id)musicVideosViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryVideosViewController);
}

+ (id)playlistsViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryPlaylistsViewController);
}

+ (id)recentlyAddedViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory recentlyAddedlibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "recentlyAddedlibraryRequest"));
  objc_msgSend(v2, "setContentRange:", 0, 60);
  id v3 = -[TVMusicLibraryRecentlyAddedViewController initWithTitle:libraryRequest:pageType:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryRecentlyAddedViewController),  "initWithTitle:libraryRequest:pageType:",  0LL,  v2,  1LL);

  return v3;
}

+ (id)songsViewControllerForAllSongs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
  id v3 = -[TVMusicLibrarySongsViewController initWithLibraryRequest:]( objc_alloc(&OBJC_CLASS___TVMusicLibrarySongsViewController),  "initWithLibraryRequest:",  v2);

  return v3;
}

+ (id)TVShowsViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVShowsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVShowsLibraryRequest"));
  id v3 = objc_alloc(&OBJC_CLASS___TVMusicLibraryShowsViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"MusicLibraryShowsTitle" value:&stru_100279068 table:0]);
  v6 = -[TVMusicLibraryShowsViewController initWithTitle:libraryRequest:](v3, "initWithTitle:libraryRequest:", v5, v2);

  return v6;
}

+ (void)albumDetailsViewController:(id)a3 completion:(id)a4
{
}

+ (void)albumDetailsViewController:(id)a3 genre:(id)a4 composer:(id)a5 completion:(id)a6
{
  id v9 = a6;
  if (a4) {
    id v10 = a4;
  }
  else {
    id v10 = a5;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009E9D8;
  v14[3] = &unk_10026CF48;
  id v15 = v9;
  id v11 = v9;
  id v12 = a5;
  id v13 = a4;
  +[TVMusicJSAlbumDetailViewController getViewControllerForAlbum:optionalGenreOrComposer:completion:]( &OBJC_CLASS___TVMusicJSAlbumDetailViewController,  "getViewControllerForAlbum:optionalGenreOrComposer:completion:",  a3,  v10,  v14);
}

+ (void)playlistDetailsViewController:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009EA70;
  v6[3] = &unk_10026CF70;
  id v7 = a4;
  id v5 = v7;
  +[TVMusicJSPlaylistDetailViewController getViewControllerForPlaylist:completion:]( &OBJC_CLASS___TVMusicJSPlaylistDetailViewController,  "getViewControllerForPlaylist:completion:",  a3,  v6);
}

+ (id)madeForYouViewController
{
  return objc_alloc_init(&OBJC_CLASS___TVMusicLibraryMadeForYouViewController);
}

@end