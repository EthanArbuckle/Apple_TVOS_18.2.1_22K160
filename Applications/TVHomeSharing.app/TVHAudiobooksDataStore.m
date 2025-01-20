@interface TVHAudiobooksDataStore
- (NSArray)fetchRequests;
- (TVHAudiobooksDataStore)init;
- (TVHCatalogueDataSource)catalogueDataSource;
@end

@implementation TVHAudiobooksDataStore

- (TVHAudiobooksDataStore)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVHAudiobooksDataStore;
  v2 = -[TVHAudiobooksDataStore init](&v29, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  8LL));
    uint64_t v4 = TVHKCommonMediaEntityCollectionProperties([v3 setIdentifier:@"AudiobooksFetchRequestIdentifier"]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 setProperties:v5];
    v34 = @"genreTitle";
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    [v3 setGroupingKeyPaths:v6];
    objc_msgSend(v3, "tvh_addPlayedStateGroupingKeyPath");
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateGroupingIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateRecentlyAddedMediaEntities);
    [v3 setOptions:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
    v33 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    [v3 setSortDescriptors:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"AUDIOBOOKS_TITLE" value:0 table:0]);

    v27 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueItem),  "initWithTitle:hideable:fetchRequestIdentifier:",  v28,  0LL,  v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:",  @"AudiobookPlaylistsFetchRequestIdentifier",  &off_100106AA0));
    v13 = objc_alloc(&OBJC_CLASS___TVHCataloguePlaylistsItem);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    v26 = -[TVHCataloguePlaylistsItem initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:]( v13,  "initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:",  &off_100106A88,  v14);

    v32[0] = v27;
    v32[1] = v26;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
    v16 = -[TVHCatalogueSection initWithItems:](objc_alloc(&OBJC_CLASS___TVHCatalogueSection), "initWithItems:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:@"GENRES_TITLE" value:0 table:0]);

    v19 = -[TVHCatalogueGroupingSection initWithGroupingKey:title:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGroupingSection),  "initWithGroupingKey:title:fetchRequestIdentifier:",  @"genreTitle",  v18,  v10);
    v31[0] = v16;
    v31[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
    v21 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  v20);
    catalogueDataSource = v2->_catalogueDataSource;
    v2->_catalogueDataSource = v21;

    v30[0] = v3;
    v30[1] = v12;
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    fetchRequests = v2->_fetchRequests;
    v2->_fetchRequests = (NSArray *)v23;
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