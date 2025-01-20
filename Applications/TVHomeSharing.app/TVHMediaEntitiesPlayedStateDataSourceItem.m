@interface TVHMediaEntitiesPlayedStateDataSourceItem
- (BOOL)hasDisplayableContent;
- (NSString)identifier;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesPlayedStateDataSourceItem)initWithMediaEntitiesDataSource:(id)a3 shelfViewControllerBlock:(id)a4;
- (TVHMediaEntitiesShelfViewController)shelfViewController;
@end

@implementation TVHMediaEntitiesPlayedStateDataSourceItem

- (TVHMediaEntitiesPlayedStateDataSourceItem)initWithMediaEntitiesDataSource:(id)a3 shelfViewControllerBlock:(id)a4
{
  id v7 = a3;
  v8 = (uint64_t (**)(id, id))a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesPlayedStateDataSourceItem;
  v9 = -[TVHMediaEntitiesPlayedStateDataSourceItem init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    uint64_t v11 = v8[2](v8, v7);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    shelfViewController = v10->_shelfViewController;
    v10->_shelfViewController = (TVHMediaEntitiesShelfViewController *)v12;
  }

  return v10;
}

- (NSString)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSourceItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (BOOL)hasDisplayableContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSourceItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntities]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVHMediaEntitiesShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (void).cxx_destruct
{
}

@end