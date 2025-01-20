@interface TVHPlaylistViewControllerFactory
+ (id)playlistViewControllerWithMediaEntity:(id)a3 mediaLibrary:(id)a4 playlistsFetchControllerIdentifier:(id)a5 playlistsFetchRequestIdentifier:(id)a6 playlistItemMediaCategoryTypes:(id)a7;
+ (id)playlistViewControllerWithPlaylist:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6;
@end

@implementation TVHPlaylistViewControllerFactory

+ (id)playlistViewControllerWithMediaEntity:(id)a3 mediaLibrary:(id)a4 playlistsFetchControllerIdentifier:(id)a5 playlistsFetchRequestIdentifier:(id)a6 playlistItemMediaCategoryTypes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0)
  {
    id v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 type]);
    id v20 = [v19 mediaEntityCollectionType];

    if (v20 == (id)5)
    {
      v21 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext),  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v14,  v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue( [a1 playlistViewControllerWithPlaylist:v18 mediaLibrary:v13 playlistsFetchContext:v21 playlistItemMediaCategoryTypes:v16]);
    }

    else
    {
      v22 = 0LL;
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

+ (id)playlistViewControllerWithPlaylist:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 type]);
  id v14 = [v13 mediaEntityCollectionType];

  if (v14 == (id)5)
  {
    if ([v9 playlistType] == (id)1) {
      id v15 = -[TVHPlaylistFolderViewController initWithPlaylistFolder:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( objc_alloc(&OBJC_CLASS___TVHPlaylistFolderViewController),  "initWithPlaylistFolder:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:",  v9,  v10,  v11,  v12);
    }
    else {
      id v15 = -[TVHPlaylistViewController initWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( objc_alloc(&OBJC_CLASS___TVHPlaylistViewController),  "initWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:",  v9,  v10,  v11,  v12);
    }
    id v16 = v15;
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

@end