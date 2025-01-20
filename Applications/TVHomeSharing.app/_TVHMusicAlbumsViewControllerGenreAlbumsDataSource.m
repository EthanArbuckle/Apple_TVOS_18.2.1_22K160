@interface _TVHMusicAlbumsViewControllerGenreAlbumsDataSource
- (_TVHMusicAlbumsViewControllerGenreAlbumsDataSource)initWithGenre:(id)a3;
- (id)noContentFoundErrorMessage;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sortOptionDidChange:(id)a3;
@end

@implementation _TVHMusicAlbumsViewControllerGenreAlbumsDataSource

- (_TVHMusicAlbumsViewControllerGenreAlbumsDataSource)initWithGenre:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v5 musicGenreAlbumsSortMode]));
  id v7 = v4;
  id v8 = sub_10007D6C8(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_displayTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MusicGenresAlbumsFetchRequestIdentifier",  v10));

  [v9 setIdentifier:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_genreTitlePredicateWithGenreTitle:]( &OBJC_CLASS___NSPredicate,  "tvhk_genreTitlePredicateWithGenreTitle:",  v12));
    [v9 setPredicate:v13];
  }

  [v5 addObserver:self forKeyPath:@"musicGenreAlbumsSortMode" options:0 context:off_100156DE0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerGenreAlbumsDataSource;
  v14 = -[_TVHMusicAlbumsViewControllerDataSource initWithFetchRequest:initialSortOption:]( &v16,  "initWithFetchRequest:initialSortOption:",  v9,  v6);

  return v14;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"musicGenreAlbumsSortMode" context:off_100156DE0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerGenreAlbumsDataSource;
  -[_TVHMusicAlbumsViewControllerGenreAlbumsDataSource dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100156DE0 == a6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance", a3, a4, a5));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v7 musicGenreAlbumsSortMode]));

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVHMusicAlbumsViewControllerDataSource mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v8 currentSortOption]);

    if (v11 == v9) {
      id v10 = 0LL;
    }
    else {
      id v10 = v11;
    }
    -[_TVHMusicAlbumsViewControllerDataSource setPendingSortOption:](self, "setPendingSortOption:", v10);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerGenreAlbumsDataSource;
    -[_TVHMusicAlbumsViewControllerGenreAlbumsDataSource observeValueForKeyPath:ofObject:change:context:]( &v12,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)noContentFoundErrorMessage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"NO_GENRE_ALBUMS_FOUND_ERROR_MESSAGE" value:0 table:0]);

  return v3;
}

- (void)sortOptionDidChange:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v4 = [v3 sortMode];

  [v5 setMusicGenreAlbumsSortMode:v4];
}

@end