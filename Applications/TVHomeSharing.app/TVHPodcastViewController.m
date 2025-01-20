@interface TVHPodcastViewController
- (TVHPodcastViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6;
- (TVHPodcastViewController)initWithPodcast:(id)a3 mediaLibrary:(id)a4 podcastsFetchContext:(id)a5;
@end

@implementation TVHPodcastViewController

- (TVHPodcastViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6
{
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v8);

  return 0LL;
}

- (TVHPodcastViewController)initWithPodcast:(id)a3 mediaLibrary:(id)a4 podcastsFetchContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  6LL));
  uint64_t v13 = TVHKCommonMediaItemProperties([v12 setIdentifier:@"PodcastEpisodesFetchRequestIdentifier"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setProperties:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v11));
  [v12 setPredicate:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingReleaseDateSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingReleaseDateSortDescriptor"));
  v23 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  [v12 setSortDescriptors:v17];

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHPodcastViewController;
  v18 = -[TVHEpisodeAlbumViewController initWithAlbum:mediaLibrary:albumsFetchContext:albumItemsFetchRequest:]( &v22,  "initWithAlbum:mediaLibrary:albumsFetchContext:albumItemsFetchRequest:",  v10,  v9,  v8,  v12);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"NO_PODCAST_EPISODES_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v18, "setNoContentErrorMessage:", v20);
  }

  return v18;
}

@end