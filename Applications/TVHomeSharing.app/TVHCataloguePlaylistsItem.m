@interface TVHCataloguePlaylistsItem
- (NSArray)playlistItemMediaCategoryTypes;
- (TVHCataloguePlaylistsItem)initWithPlaylistItemMediaCategoryTypes:(id)a3 fetchRequestIdentifier:(id)a4;
- (TVHCataloguePlaylistsItem)initWithTitle:(id)a3 hideable:(BOOL)a4 fetchRequestIdentifier:(id)a5;
@end

@implementation TVHCataloguePlaylistsItem

- (TVHCataloguePlaylistsItem)initWithTitle:(id)a3 hideable:(BOOL)a4 fetchRequestIdentifier:(id)a5
{
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v7);

  return 0LL;
}

- (TVHCataloguePlaylistsItem)initWithPlaylistItemMediaCategoryTypes:(id)a3 fetchRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"PLAYLISTS_TITLE" value:0 table:0]);

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHCataloguePlaylistsItem;
  v10 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( &v14,  "initWithTitle:hideable:fetchRequestIdentifier:",  v9,  0LL,  v7);

  if (v10)
  {
    v11 = (NSArray *)[v6 copy];
    playlistItemMediaCategoryTypes = v10->_playlistItemMediaCategoryTypes;
    v10->_playlistItemMediaCategoryTypes = v11;
  }

  return v10;
}

- (NSArray)playlistItemMediaCategoryTypes
{
  return self->_playlistItemMediaCategoryTypes;
}

- (void).cxx_destruct
{
}

@end