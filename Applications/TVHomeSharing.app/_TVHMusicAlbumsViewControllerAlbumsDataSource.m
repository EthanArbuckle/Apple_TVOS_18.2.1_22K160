@interface _TVHMusicAlbumsViewControllerAlbumsDataSource
- (_TVHMusicAlbumsViewControllerAlbumsDataSource)init;
- (id)noContentFoundErrorMessage;
- (void)sortOptionDidChange:(id)a3;
@end

@implementation _TVHMusicAlbumsViewControllerAlbumsDataSource

- (_TVHMusicAlbumsViewControllerAlbumsDataSource)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v3 musicAlbumsSortMode]));

  id v5 = sub_10007D6C8(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 setIdentifier:@"MusicAlbumsFetchRequestIdentifier"];
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityCompilationAlbumsPredicateWithWantCompilationAlbums:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityCompilationAlbumsPredicateWithWantCompilationAlbums:",  0LL));
  [v6 setPredicate:v7];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerAlbumsDataSource;
  v8 = -[_TVHMusicAlbumsViewControllerDataSource initWithFetchRequest:initialSortOption:]( &v10,  "initWithFetchRequest:initialSortOption:",  v6,  v4);

  return v8;
}

- (id)noContentFoundErrorMessage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"NO_ALBUMS_FOUND_ERROR_MESSAGE" value:0 table:0]);

  return v3;
}

- (void)sortOptionDidChange:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v4 = [v3 sortMode];

  [v5 setMusicAlbumsSortMode:v4];
}

@end