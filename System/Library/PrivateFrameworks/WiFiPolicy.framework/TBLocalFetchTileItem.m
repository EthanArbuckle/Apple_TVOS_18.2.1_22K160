@interface TBLocalFetchTileItem
- (NSArray)networks;
- (NSError)error;
- (TBLocalFetchTileItem)initWithTile:(id)a3 error:(id)a4;
- (TBTile)tile;
- (unint64_t)status;
@end

@implementation TBLocalFetchTileItem

- (TBLocalFetchTileItem)initWithTile:(id)a3 error:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TBLocalFetchTileItem;
  id v4 = a3;
  v5 = -[TBLocalFetchTileItem init](&v16, sel_init);
  v5->_status = 1LL;
  v6 = objc_alloc(&OBJC_CLASS___TBFetchedTile);
  uint64_t v7 = objc_msgSend(v4, "key", v16.receiver, v16.super_class);
  [v4 etag];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 created];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[TBFetchedTile initWithKey:etag:created:](v6, "initWithKey:etag:created:", v7, v8, v9);
  tile = v5->_tile;
  v5->_tile = (TBTile *)v10;

  [v4 networks];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [v12 allObjects];
  networks = v5->_networks;
  v5->_networks = (NSArray *)v13;

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)networks
{
  return self->_networks;
}

- (unint64_t)status
{
  return self->_status;
}

- (TBTile)tile
{
  return self->_tile;
}

- (void).cxx_destruct
{
}

@end