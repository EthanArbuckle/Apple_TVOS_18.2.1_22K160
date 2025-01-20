@interface TBMutableTileFetchResponse
- (NSArray)results;
- (NSDictionary)resultsByBSSID;
- (NSError)error;
- (NSMutableSet)mutableTiles;
- (NSSet)tiles;
- (TBMutableTileFetchResponse)init;
- (void)addResponse:(id)a3;
- (void)setMutableTiles:(id)a3;
@end

@implementation TBMutableTileFetchResponse

- (TBMutableTileFetchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TBMutableTileFetchResponse;
  v2 = -[TBMutableTileFetchResponse init](&v6, sel_init);
  uint64_t v3 = [MEMORY[0x189603FE0] set];
  mutableTiles = v2->_mutableTiles;
  v2->_mutableTiles = (NSMutableSet *)v3;

  return v2;
}

- (void)addResponse:(id)a3
{
  id v8 = a3;
  [v8 tiles];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    mutableTiles = self->_mutableTiles;
    [v8 tiles];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 allObjects];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](mutableTiles, "addObjectsFromArray:", v7);
  }
}

- (NSSet)tiles
{
  return (NSSet *)[MEMORY[0x189604010] setWithSet:self->_mutableTiles];
}

- (NSError)error
{
  return self->error;
}

- (NSArray)results
{
  return self->results;
}

- (NSDictionary)resultsByBSSID
{
  return self->resultsByBSSID;
}

- (NSMutableSet)mutableTiles
{
  return self->_mutableTiles;
}

- (void)setMutableTiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end