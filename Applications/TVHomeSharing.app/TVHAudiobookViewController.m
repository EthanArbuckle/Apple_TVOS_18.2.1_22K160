@interface TVHAudiobookViewController
- (TVHAudiobookViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6;
- (TVHAudiobookViewController)initWithAudiobook:(id)a3 mediaLibrary:(id)a4 audiobooksFetchContext:(id)a5;
@end

@implementation TVHAudiobookViewController

- (TVHAudiobookViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6
{
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v8);

  return 0LL;
}

- (TVHAudiobookViewController)initWithAudiobook:(id)a3 mediaLibrary:(id)a4 audiobooksFetchContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  8LL));
  uint64_t v13 = TVHKCommonMediaItemProperties([v12 setIdentifier:@"AudiobookChaptersFetchRequestIdentifier"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setProperties:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v11));
  [v12 setPredicate:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingEpisodeNumberSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingEpisodeNumberSortDescriptor"));
  v25 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  [v12 setSortDescriptors:v17];

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVHAudiobookViewController;
  v18 = -[TVHEpisodeAlbumViewController initWithAlbum:mediaLibrary:albumsFetchContext:albumItemsFetchRequest:]( &v24,  "initWithAlbum:mediaLibrary:albumsFetchContext:albumItemsFetchRequest:",  v10,  v9,  v8,  v12);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"SD_AUDIOBOOK_CHAPTERS_COUNT_FORMAT" value:0 table:0]);

    -[TVHEpisodeAlbumViewController setEpisodeCountFormatString:](v18, "setEpisodeCountFormatString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"NO_AUDIOBOOK_CHAPTERS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v18, "setNoContentErrorMessage:", v22);
  }

  return v18;
}

@end