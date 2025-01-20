@interface TBTileRemoteFetchResponse
+ (id)responseWithTileItems:(id)a3;
- (TBTileRemoteFetchResponse)initWithTileItems:(id)a3;
@end

@implementation TBTileRemoteFetchResponse

+ (id)responseWithTileItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTileItems:v4];

  return v5;
}

- (TBTileRemoteFetchResponse)initWithTileItems:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = 0LL;
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___TBError);
    uint64_t v12 = *MEMORY[0x1896075E0];
    v13[0] = @"No results returned from remote source";
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TBError initWithType:userInfo:](v7, "initWithType:userInfo:", 154LL, v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TBTileRemoteFetchResponse;
  v9 = -[TBRemoteFetchResponse initWithResults:tiles:error:](&v11, sel_initWithResults_tiles_error_, 0LL, v5, v6);

  return v9;
}

@end