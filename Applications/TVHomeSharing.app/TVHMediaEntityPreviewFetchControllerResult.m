@interface TVHMediaEntityPreviewFetchControllerResult
+ (id)new;
- (TVHKCollectionChangeSet)changeSet;
- (TVHKMediaEntitiesFetchResult)latestMediaEntitiesFetchResult;
- (TVHKMediaEntitiesFetchResult)previousMediaEntitiesFetchResult;
- (TVHMediaEntityPreviewFetchControllerResult)init;
- (TVHMediaEntityPreviewFetchControllerResult)initWithLatestMediaEntitiesFetchResult:(id)a3 previousMediaEntitiesFetchResult:(id)a4 changeSet:(id)a5;
@end

@implementation TVHMediaEntityPreviewFetchControllerResult

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntityPreviewFetchControllerResult)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntityPreviewFetchControllerResult)initWithLatestMediaEntitiesFetchResult:(id)a3 previousMediaEntitiesFetchResult:(id)a4 changeSet:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMediaEntityPreviewFetchControllerResult;
  v12 = -[TVHMediaEntityPreviewFetchControllerResult init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_latestMediaEntitiesFetchResult, a3);
    objc_storeStrong((id *)&v13->_previousMediaEntitiesFetchResult, a4);
    objc_storeStrong((id *)&v13->_changeSet, a5);
  }

  return v13;
}

- (TVHKMediaEntitiesFetchResult)latestMediaEntitiesFetchResult
{
  return self->_latestMediaEntitiesFetchResult;
}

- (TVHKMediaEntitiesFetchResult)previousMediaEntitiesFetchResult
{
  return self->_previousMediaEntitiesFetchResult;
}

- (TVHKCollectionChangeSet)changeSet
{
  return self->_changeSet;
}

- (void).cxx_destruct
{
}

@end