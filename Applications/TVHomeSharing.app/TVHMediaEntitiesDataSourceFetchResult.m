@interface TVHMediaEntitiesDataSourceFetchResult
+ (id)new;
- (NSArray)indexBarItems;
- (NSArray)mediaEntities;
- (NSArray)sortDescriptors;
- (NSString)identifier;
- (TVHKCollectionChangeSet)changeSet;
- (TVHMediaEntitiesDataSourceFetchResult)init;
- (TVHMediaEntitiesDataSourceFetchResult)initWithFetchControllerResultSet:(id)a3;
- (TVHMediaEntitiesDataSourceFetchResult)initWithIdentifier:(id)a3 mediaEntities:(id)a4;
- (void)setChangeSet:(id)a3;
- (void)setIndexBarItems:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation TVHMediaEntitiesDataSourceFetchResult

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntitiesDataSourceFetchResult)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesDataSourceFetchResult)initWithIdentifier:(id)a3 mediaEntities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult;
  v8 = -[TVHMediaEntitiesDataSourceFetchResult init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = (NSArray *)[v7 copy];
    mediaEntities = v8->_mediaEntities;
    v8->_mediaEntities = v11;
  }

  return v8;
}

- (TVHMediaEntitiesDataSourceFetchResult)initWithFetchControllerResultSet:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesResult]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 changeSet]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaEntitiesChangeSet]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntities]);
  v13 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( self,  "initWithIdentifier:mediaEntities:",  v11,  v12);

  if (v13)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v8 sortDescriptors]);
    -[TVHMediaEntitiesDataSourceFetchResult setSortDescriptors:](v13, "setSortDescriptors:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 indexBarItems]);
    -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v13, "setIndexBarItems:", v15);

    -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v13, "setChangeSet:", v10);
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)indexBarItems
{
  return self->_indexBarItems;
}

- (void)setIndexBarItems:(id)a3
{
}

- (TVHKCollectionChangeSet)changeSet
{
  return self->_changeSet;
}

- (void)setChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end