@interface TVHKMediaEntitiesFetchControllerResultSet
- (id)tvh_firstMediaEntities;
- (id)tvh_firstMediaEntity;
@end

@implementation TVHKMediaEntitiesFetchControllerResultSet

- (id)tvh_firstMediaEntities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchControllerResultSet results](self, "results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 response]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntitiesResult]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  v7 = v6;
  if (!v6) {
    v6 = &__NSArray0__struct;
  }
  id v8 = v6;

  return v8;
}

- (id)tvh_firstMediaEntity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchControllerResultSet tvh_firstMediaEntities](self, "tvh_firstMediaEntities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

@end