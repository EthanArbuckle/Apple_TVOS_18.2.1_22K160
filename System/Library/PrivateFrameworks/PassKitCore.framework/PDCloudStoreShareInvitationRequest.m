@interface PDCloudStoreShareInvitationRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSString)groupName;
- (NSString)suffix;
- (PDCloudStoreShareInvitationRequest)initWithType:(unint64_t)a3 completion:(id)a4;
- (int64_t)qualityOfService;
- (unint64_t)type;
- (void)callCompletionsWithResponse:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setSuffix:(id)a3;
@end

@implementation PDCloudStoreShareInvitationRequest

- (PDCloudStoreShareInvitationRequest)initWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCloudStoreShareInvitationRequest;
  v7 = -[PDCloudStoreShareInvitationRequest init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_qualityOfService = 17LL;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v8->_completionHandlers;
    v8->_completionHandlers = v9;

    v11 = v8->_completionHandlers;
    id v12 = objc_retainBlock(v6);
    -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v12);
  }

  return v8;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDCloudStoreShareInvitationRequest canCoalesceRequest:](self, "canCoalesceRequest:", v4);
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableArray addObjectsFromArray:](completionHandlers, "addObjectsFromArray:", v7);

    int64_t qualityOfService = self->_qualityOfService;
    else {
      id v9 = (id)self->_qualityOfService;
    }
    self->_int64_t qualityOfService = (int64_t)v9;
  }

  return v5;
}

- (void)callCompletionsWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray copy](self->_completionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10) + 16LL))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id type = (id)self->_type;
  return type == [a3 type];
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_int64_t qualityOfService = a3;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end