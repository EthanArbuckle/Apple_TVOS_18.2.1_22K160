@interface TBRemoteFetchTileItem
- (NSArray)networks;
- (NSError)error;
- (TBRemoteFetchTileItem)initWithEmptyTileKey:(unint64_t)a3 etag:(id)a4 error:(id)a5;
- (TBRemoteFetchTileItem)initWithTile:(id)a3 status:(unint64_t)a4 etag:(id)a5 error:(id)a6;
- (TBTile)tile;
- (unint64_t)status;
@end

@implementation TBRemoteFetchTileItem

- (TBRemoteFetchTileItem)initWithTile:(id)a3 status:(unint64_t)a4 etag:(id)a5 error:(id)a6
{
  v10 = (NSError *)a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TBRemoteFetchTileItem;
  id v11 = a5;
  id v12 = a3;
  v13 = -[TBRemoteFetchTileItem init](&v23, sel_init);
  uint64_t v14 = objc_msgSend(v12, "ess", v23.receiver, v23.super_class);
  networks = v13->_networks;
  v13->_networks = (NSArray *)v14;

  v13->_status = a4;
  v16 = objc_alloc(&OBJC_CLASS___TBFetchedTile);
  uint64_t v17 = [v12 tileKey];

  [MEMORY[0x189603F50] date];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = -[TBFetchedTile initWithKey:etag:created:](v16, "initWithKey:etag:created:", v17, v11, v18);

  tile = v13->_tile;
  v13->_tile = (TBTile *)v19;

  error = v13->_error;
  v13->_error = v10;

  return v13;
}

- (TBRemoteFetchTileItem)initWithEmptyTileKey:(unint64_t)a3 etag:(id)a4 error:(id)a5
{
  v8 = (NSError *)a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TBRemoteFetchTileItem;
  id v9 = a4;
  v10 = -[TBRemoteFetchTileItem init](&v17, sel_init);
  v10->_status = 3LL;
  id v11 = objc_alloc(&OBJC_CLASS___TBFetchedTile);
  objc_msgSend(MEMORY[0x189603F50], "date", v17.receiver, v17.super_class);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[TBFetchedTile initWithKey:etag:created:](v11, "initWithKey:etag:created:", a3, v9, v12);

  tile = v10->_tile;
  v10->_tile = (TBTile *)v13;

  error = v10->_error;
  v10->_error = v8;

  return v10;
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