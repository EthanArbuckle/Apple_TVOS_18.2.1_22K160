@interface TVHCatalogueItem
+ (TVHCatalogueItem)new;
- (BOOL)isHideable;
- (BOOL)isRemoveable;
- (BOOL)shouldDisplay;
- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4;
- (NSString)fetchRequestIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHCatalogueGridRelatedContent)gridRelatedContent;
- (TVHCatalogueItem)init;
- (TVHCatalogueItem)initWithTitle:(id)a3 hideable:(BOOL)a4 fetchRequestIdentifier:(id)a5;
- (TVHCatalogueRelatedContent)relatedContent;
- (id)_mediaEntitiesDataSource;
@end

@implementation TVHCatalogueItem

+ (TVHCatalogueItem)new
{
  return 0LL;
}

- (TVHCatalogueItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueItem)initWithTitle:(id)a3 hideable:(BOOL)a4 fetchRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHCatalogueItem;
  v10 = -[TVHCatalogueItem init](&v22, "init");
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    title = v10->_title;
    v10->_title = v11;

    v13 = (NSString *)[v9 copy];
    fetchRequestIdentifier = v10->_fetchRequestIdentifier;
    v10->_fetchRequestIdentifier = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 UUIDString]);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v16;

    v10->_hideable = a4;
    v18 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v9);
    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v18, "setProvideIndexTitles:", 1LL);
    v19 = -[TVHCatalogueGridRelatedContent initWithMediaEntitiesDataSource:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGridRelatedContent),  "initWithMediaEntitiesDataSource:",  v18);
    gridRelatedContent = v10->_gridRelatedContent;
    v10->_gridRelatedContent = v19;
  }

  return v10;
}

- (TVHCatalogueRelatedContent)relatedContent
{
  return (TVHCatalogueRelatedContent *)self->_gridRelatedContent;
}

- (BOOL)shouldDisplay
{
  if (!-[TVHCatalogueItem isHideable](self, "isHideable")) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueItem relatedContent](self, "relatedContent"));
  unsigned __int8 v4 = [v3 hasDisplayableContent];

  return v4;
}

- (BOOL)isRemoveable
{
  return 0;
}

- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaEntitiesResult]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesChangeSet]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueItem _mediaEntitiesDataSource](self, "_mediaEntitiesDataSource"));
  v11 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueItem fetchRequestIdentifier](self, "fetchRequestIdentifier"));
  v13 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v11,  "initWithIdentifier:mediaEntities:",  v12,  v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 indexBarItems]);
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueItem gridRelatedContent](self, "gridRelatedContent"));
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

- (BOOL)isHideable
{
  return self->_hideable;
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