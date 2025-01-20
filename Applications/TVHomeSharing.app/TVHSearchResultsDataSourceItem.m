@interface TVHSearchResultsDataSourceItem
- (BOOL)hasDisplayableContent;
- (NSSet)mediaEntityTypes;
- (NSString)identifier;
- (NSString)title;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesShelfViewController)shelfViewController;
- (TVHSearchResultsDataSourceItem)initWithIdentifier:(id)a3 title:(id)a4 mediaEntityTypes:(id)a5;
- (void)setShelfViewController:(id)a3;
@end

@implementation TVHSearchResultsDataSourceItem

- (TVHSearchResultsDataSourceItem)initWithIdentifier:(id)a3 title:(id)a4 mediaEntityTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHSearchResultsDataSourceItem;
  v11 = -[TVHSearchResultsDataSourceItem init](&v22, "init");
  if (v11)
  {
    v12 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  v8);
    v13 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
    v23 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    v15 = -[TVHMediaEntitiesDataSource initWithIdentifier:itemCollectionDescriptors:initialSortOption:]( v13,  "initWithIdentifier:itemCollectionDescriptors:initialSortOption:",  v8,  v14,  0LL);
    dataSource = v11->_dataSource;
    v11->_dataSource = v15;

    v17 = (NSString *)[v9 copy];
    title = v11->_title;
    v11->_title = v17;

    v19 = (NSSet *)[v10 copy];
    mediaEntityTypes = v11->_mediaEntityTypes;
    v11->_mediaEntityTypes = v19;
  }

  return v11;
}

- (NSString)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSourceItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (BOOL)hasDisplayableContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSourceItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntities]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSSet)mediaEntityTypes
{
  return self->_mediaEntityTypes;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVHMediaEntitiesShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (void)setShelfViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end