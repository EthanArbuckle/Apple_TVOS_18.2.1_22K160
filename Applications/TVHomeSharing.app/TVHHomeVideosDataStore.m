@interface TVHHomeVideosDataStore
- (NSArray)fetchRequests;
- (TVHCatalogueDataSource)catalogueDataSource;
- (TVHHomeVideosDataStore)init;
@end

@implementation TVHHomeVideosDataStore

- (TVHHomeVideosDataStore)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVHHomeVideosDataStore;
  v2 = -[TVHHomeVideosDataStore init](&v35, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  5LL));
    uint64_t v4 = TVHKCommonMediaItemProperties([v3 setIdentifier:@"HomeVideosFetchRequestIdentifier"]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 setProperties:v5];
    v40 = @"genreTitle";
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    [v3 setGroupingKeyPaths:v6];
    objc_msgSend(v3, "tvh_addPlayedStateGroupingKeyPath");
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateGroupingIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateRecentlyAddedMediaEntities);
    [v3 setOptions:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
    v39 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    [v3 setSortDescriptors:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"RECENTLY_ADDED_TITLE" value:0 table:0]);

    v31 = -[TVHCatalogueRecentlyAddedItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueRecentlyAddedItem),  "initWithTitle:fetchRequestIdentifier:",  v34,  v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"HOME_VIDEOS_TITLE" value:0 table:0]);

    v30 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueItem),  "initWithTitle:hideable:fetchRequestIdentifier:",  v33,  0LL,  v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"UNWATCHED_TITLE" value:0 table:0]);

    v29 = -[TVHCataloguePlayedStateItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCataloguePlayedStateItem),  "initWithTitle:fetchRequestIdentifier:",  v32,  v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:",  @"HomeVideoPlaylistsFetchRequestIdentifier",  &off_100106E00));
    v15 = objc_alloc(&OBJC_CLASS___TVHCataloguePlaylistsItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    v17 = -[TVHCataloguePlaylistsItem initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:]( v15,  "initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:",  &off_100106DE8,  v16);

    v38[0] = v31;
    v38[1] = v30;
    v38[2] = v29;
    v38[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 4LL));
    v19 = -[TVHCatalogueSection initWithItems:](objc_alloc(&OBJC_CLASS___TVHCatalogueSection), "initWithItems:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"GENRES_TITLE" value:0 table:0]);

    v22 = -[TVHCatalogueGroupingSection initWithGroupingKey:title:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGroupingSection),  "initWithGroupingKey:title:fetchRequestIdentifier:",  @"genreTitle",  v21,  v10);
    v37[0] = v19;
    v37[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
    v24 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  v23);
    catalogueDataSource = v2->_catalogueDataSource;
    v2->_catalogueDataSource = v24;

    v36[0] = v3;
    v36[1] = v14;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
    fetchRequests = v2->_fetchRequests;
    v2->_fetchRequests = (NSArray *)v26;
  }

  return v2;
}

- (NSArray)fetchRequests
{
  return self->_fetchRequests;
}

- (TVHCatalogueDataSource)catalogueDataSource
{
  return self->_catalogueDataSource;
}

- (void).cxx_destruct
{
}

@end