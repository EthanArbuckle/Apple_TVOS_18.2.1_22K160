@interface _TVHMusicAlbumsViewControllerComposerAlbumsDataSource
- (_TVHMusicAlbumsViewControllerComposerAlbumsDataSource)initWithComposer:(id)a3;
- (id)headerTitle;
- (id)noContentFoundErrorMessage;
@end

@implementation _TVHMusicAlbumsViewControllerComposerAlbumsDataSource

- (_TVHMusicAlbumsViewControllerComposerAlbumsDataSource)initWithComposer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption artistTitle](&OBJC_CLASS___TVHSortOption, "artistTitle"));
  id v6 = v4;
  id v7 = sub_10007D6C8(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_displayTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MusicComposerAlbumsFetchRequestIdentifier",  v9));

  [v8 setIdentifier:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaItemComposerTitlePredicateWithComposerTitle:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaItemComposerTitlePredicateWithComposerTitle:",  v11));
    [v8 setPredicate:v12];
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerComposerAlbumsDataSource;
  v13 = -[_TVHMusicAlbumsViewControllerDataSource initWithFetchRequest:initialSortOption:]( &v17,  "initWithFetchRequest:initialSortOption:",  v8,  v5);
  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_displayTitle"));
    headerTitle = v13->_headerTitle;
    v13->_headerTitle = (NSString *)v14;
  }

  return v13;
}

- (id)noContentFoundErrorMessage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"NO_COMPOSER_ALBUMS_FOUND_ERROR_MESSAGE" value:0 table:0]);

  return v3;
}

- (id)headerTitle
{
  return self->_headerTitle;
}

- (void).cxx_destruct
{
}

@end