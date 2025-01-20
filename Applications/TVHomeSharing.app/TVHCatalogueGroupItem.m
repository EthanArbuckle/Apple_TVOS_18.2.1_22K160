@interface TVHCatalogueGroupItem
+ (id)new;
- (BOOL)isHideable;
- (BOOL)isRemoveable;
- (BOOL)shouldDisplay;
- (BOOL)updateWithMediaEntitiesDataSourceFetchResult:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (TVHCatalogueGridRelatedContent)gridRelatedContent;
- (TVHCatalogueGroupItem)init;
- (TVHCatalogueGroupItem)initWithIdentifier:(id)a3 title:(id)a4;
- (TVHCatalogueRelatedContent)relatedContent;
- (id)_mediaEntitiesDataSource;
@end

@implementation TVHCatalogueGroupItem

+ (id)new
{
  return 0LL;
}

- (TVHCatalogueGroupItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueGroupItem)initWithIdentifier:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHCatalogueGroupItem;
  v8 = -[TVHCatalogueGroupItem init](&v17, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = (NSString *)[v7 copy];
    title = v8->_title;
    v8->_title = v11;

    v13 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v6);
    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v13, "setProvideIndexTitles:", 1LL);
    v14 = -[TVHCatalogueGridRelatedContent initWithMediaEntitiesDataSource:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGridRelatedContent),  "initWithMediaEntitiesDataSource:",  v13);
    gridRelatedContent = v8->_gridRelatedContent;
    v8->_gridRelatedContent = v14;
  }

  return v8;
}

- (BOOL)updateWithMediaEntitiesDataSourceFetchResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupItem _mediaEntitiesDataSource](self, "_mediaEntitiesDataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  id v7 = [v6 count];

  id v12 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  [v5 updateWithMediaEntitiesDataSourceFetchResults:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  id v10 = [v9 count];

  return v7 != v10;
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
  return 1;
}

- (id)_mediaEntitiesDataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupItem gridRelatedContent](self, "gridRelatedContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntitiesDataSource]);

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TVHCatalogueGridRelatedContent)gridRelatedContent
{
  return self->_gridRelatedContent;
}

- (void).cxx_destruct
{
}

@end