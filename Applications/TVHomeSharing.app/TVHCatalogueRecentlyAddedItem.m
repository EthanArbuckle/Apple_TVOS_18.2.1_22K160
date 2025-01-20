@interface TVHCatalogueRecentlyAddedItem
+ (id)new;
- (BOOL)isHideable;
- (BOOL)isRemoveable;
- (BOOL)shouldDisplay;
- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4;
- (NSString)fetchRequestIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHCatalogueGridRelatedContent)gridRelatedContent;
- (TVHCatalogueRecentlyAddedItem)init;
- (TVHCatalogueRecentlyAddedItem)initWithTitle:(id)a3 fetchRequestIdentifier:(id)a4;
- (TVHCatalogueRelatedContent)relatedContent;
- (id)_mediaEntitiesDataSource;
@end

@implementation TVHCatalogueRecentlyAddedItem

+ (id)new
{
  return 0LL;
}

- (TVHCatalogueRecentlyAddedItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueRecentlyAddedItem)initWithTitle:(id)a3 fetchRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHCatalogueRecentlyAddedItem;
  v8 = -[TVHCatalogueRecentlyAddedItem init](&v20, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)[v7 copy];
    fetchRequestIdentifier = v8->_fetchRequestIdentifier;
    v8->_fetchRequestIdentifier = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v14;

    v16 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v8->_fetchRequestIdentifier);
    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v16, "setProvideIndexTitles:", 1LL);
    v17 = -[TVHCatalogueGridRelatedContent initWithMediaEntitiesDataSource:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGridRelatedContent),  "initWithMediaEntitiesDataSource:",  v16);
    gridRelatedContent = v8->_gridRelatedContent;
    v8->_gridRelatedContent = v17;
  }

  return v8;
}

- (TVHCatalogueRelatedContent)relatedContent
{
  return (TVHCatalogueRelatedContent *)self->_gridRelatedContent;
}

- (BOOL)shouldDisplay
{
  return 1;
}

- (BOOL)isHideable
{
  return 0;
}

- (BOOL)isRemoveable
{
  return 0;
}

- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 recentlyAddedMediaEntitiesResult]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 recentlyAddedMediaEntitiesChangeSet]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueRecentlyAddedItem _mediaEntitiesDataSource](self, "_mediaEntitiesDataSource"));
  v11 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueRecentlyAddedItem fetchRequestIdentifier](self, "fetchRequestIdentifier"));
  v13 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v11,  "initWithIdentifier:mediaEntities:",  v12,  v8);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 indexBarItems]);
  -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v13, "setIndexBarItems:", v14);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v13, "setChangeSet:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntities]);
  id v16 = [v15 count];

  v21 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  [v10 updateWithMediaEntitiesDataSourceFetchResults:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntities]);
  id v19 = [v18 count];

  return v16 != v19;
}

- (id)_mediaEntitiesDataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueRecentlyAddedItem gridRelatedContent](self, "gridRelatedContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntitiesDataSource]);

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)fetchRequestIdentifier
{
  return self->_fetchRequestIdentifier;
}

- (TVHCatalogueGridRelatedContent)gridRelatedContent
{
  return self->_gridRelatedContent;
}

- (void).cxx_destruct
{
}

@end