@interface TVHShowsDataStore
+ (TVHShowsDataStore)new;
- (BOOL)_shouldUpdateCatalogueDataSource;
- (NSArray)fetchRequests;
- (NSString)fetchControllerIdentifier;
- (TVHCatalogueDataSource)catalogueDataSource;
- (TVHKMediaEntitiesFetchRequest)showPlaylistsFetchRequest;
- (TVHKMediaEntitiesFetchRequest)showsFetchRequest;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHShowsDataStore)init;
- (TVHShowsDataStore)initWithMediaLibrary:(id)a3 mode:(unint64_t)a4;
- (TVHShowsInfoCenter)showsInfoCenter;
- (id)_allContentCatalogueDataSource;
- (id)_showsFetchResponseFromFetchControllerResultSet:(id)a3;
- (unint64_t)completedFetchCount;
- (unint64_t)mode;
- (void)setCompletedFetchCount:(unint64_t)a3;
- (void)setShowPlaylistsFetchRequest:(id)a3;
- (void)setShowsFetchRequest:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3;
@end

@implementation TVHShowsDataStore

+ (TVHShowsDataStore)new
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v3);

  return 0LL;
}

- (TVHShowsDataStore)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHShowsDataStore)initWithMediaLibrary:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVHShowsDataStore;
  v8 = -[TVHShowsDataStore init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a3);
    v9->_unint64_t mode = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  6LL,  4LL));
    uint64_t v11 = TVHKCommonMediaEntityCollectionProperties([v10 setIdentifier:@"ShowsFetchRequestIdentifier"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 setProperties:v12];
    v33 = @"genreTitle";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    [v10 setGroupingKeyPaths:v13];
    objc_msgSend(v10, "tvh_addPlayedStateGroupingKeyPath");
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateGroupingIndexBarItems);
    -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateRecentlyAddedMediaEntities);
    [v10 setOptions:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
    v32 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    [v10 setSortDescriptors:v16];

    showsFetchRequest = v9->_showsFetchRequest;
    v9->_showsFetchRequest = (TVHKMediaEntitiesFetchRequest *)v10;

    v18 = -[TVHShowsInfoCenter initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHShowsInfoCenter),  "initWithMediaLibrary:",  v7);
    showsInfoCenter = v9->_showsInfoCenter;
    v9->_showsInfoCenter = v18;

    unint64_t mode = v9->_mode;
    if (mode == 1)
    {
      v30 = v9->_showsFetchRequest;
      v24 = &v30;
      uint64_t v25 = 1LL;
      goto LABEL_6;
    }

    if (!mode)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:",  @"ShowPlaylistsFetchRequestIdentifier",  &off_100106B00));
      showPlaylistsFetchRequest = v9->_showPlaylistsFetchRequest;
      v9->_showPlaylistsFetchRequest = (TVHKMediaEntitiesFetchRequest *)v21;

      v23 = v9->_showPlaylistsFetchRequest;
      v31[0] = v9->_showsFetchRequest;
      v31[1] = v23;
      v24 = (TVHKMediaEntitiesFetchRequest **)v31;
      uint64_t v25 = 2LL;
LABEL_6:
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, v25));
      fetchRequests = v9->_fetchRequests;
      v9->_fetchRequests = (NSArray *)v26;
    }
  }

  return v9;
}

- (TVHCatalogueDataSource)catalogueDataSource
{
  if (!self->_catalogueDataSource)
  {
    if (-[TVHShowsDataStore _shouldUpdateCatalogueDataSource](self, "_shouldUpdateCatalogueDataSource")) {
      v3 = (TVHCatalogueDataSource *)objc_claimAutoreleasedReturnValue( -[TVHShowsDataStore _allContentCatalogueDataSource]( self,  "_allContentCatalogueDataSource"));
    }
    else {
      v3 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  &__NSArray0__struct);
    }
    catalogueDataSource = self->_catalogueDataSource;
    self->_catalogueDataSource = v3;
  }

  return self->_catalogueDataSource;
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v8 = a3;
  if (-[TVHShowsDataStore _shouldUpdateCatalogueDataSource](self, "_shouldUpdateCatalogueDataSource"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore catalogueDataSource](self, "catalogueDataSource"));
    [v4 updateWithMediaEntitiesFetchControllerResultSet:v8];
  }

  unint64_t v5 = -[TVHShowsDataStore completedFetchCount](self, "completedFetchCount");
  if (!v5 || [v8 hasChanges])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore showsInfoCenter](self, "showsInfoCenter"));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHShowsDataStore _showsFetchResponseFromFetchControllerResultSet:]( self,  "_showsFetchResponseFromFetchControllerResultSet:",  v8));
      [v6 updateWithFetchResponse:v7];
    }
  }

  -[TVHShowsDataStore setCompletedFetchCount:](self, "setCompletedFetchCount:", v5 + 1);
}

- (BOOL)_shouldUpdateCatalogueDataSource
{
  return -[TVHShowsDataStore mode](self, "mode") == 0;
}

- (id)_showsFetchResponseFromFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  if (-[TVHShowsDataStore mode](self, "mode") > 1)
  {
    v6 = 0LL;
  }

  else
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resultForRequestIdentifier:@"ShowsFetchRequestIdentifier"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  }

  return v6;
}

- (id)_allContentCatalogueDataSource
{
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore showsFetchRequest](self, "showsFetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"RECENTLY_ADDED_TITLE" value:0 table:0]);

  uint64_t v21 = -[TVHCatalogueRecentlyAddedItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueRecentlyAddedItem),  "initWithTitle:fetchRequestIdentifier:",  v24,  v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"SHOWS_TITLE" value:0 table:0]);

  v20 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueItem),  "initWithTitle:hideable:fetchRequestIdentifier:",  v23,  0LL,  v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"UNWATCHED_TITLE" value:0 table:0]);

  id v7 = -[TVHCataloguePlayedStateItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCataloguePlayedStateItem),  "initWithTitle:fetchRequestIdentifier:",  v22,  v3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore showPlaylistsFetchRequest](self, "showPlaylistsFetchRequest"));
  v9 = objc_alloc(&OBJC_CLASS___TVHCataloguePlaylistsItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v11 = -[TVHCataloguePlaylistsItem initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:]( v9,  "initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:",  &off_100106AE8,  v10);

  v27[0] = v21;
  v27[1] = v20;
  v27[2] = v7;
  v27[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL));
  v13 = -[TVHCatalogueSection initWithItems:](objc_alloc(&OBJC_CLASS___TVHCatalogueSection), "initWithItems:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"GENRES_TITLE" value:0 table:0]);

  v16 = -[TVHCatalogueGroupingSection initWithGroupingKey:title:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGroupingSection),  "initWithGroupingKey:title:fetchRequestIdentifier:",  @"genreTitle",  v15,  v3);
  v26[0] = v13;
  v26[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  v18 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  v17);

  return v18;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)fetchRequests
{
  return self->_fetchRequests;
}

- (TVHShowsInfoCenter)showsInfoCenter
{
  return self->_showsInfoCenter;
}

- (NSString)fetchControllerIdentifier
{
  return self->_fetchControllerIdentifier;
}

- (TVHKMediaEntitiesFetchRequest)showsFetchRequest
{
  return self->_showsFetchRequest;
}

- (void)setShowsFetchRequest:(id)a3
{
}

- (TVHKMediaEntitiesFetchRequest)showPlaylistsFetchRequest
{
  return self->_showPlaylistsFetchRequest;
}

- (void)setShowPlaylistsFetchRequest:(id)a3
{
}

- (unint64_t)completedFetchCount
{
  return self->_completedFetchCount;
}

- (void)setCompletedFetchCount:(unint64_t)a3
{
  self->_completedFetchCount = a3;
}

- (void).cxx_destruct
{
}

@end