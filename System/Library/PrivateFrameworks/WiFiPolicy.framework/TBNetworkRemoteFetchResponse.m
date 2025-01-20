@interface TBNetworkRemoteFetchResponse
+ (id)responseWithNetworkSearchResults:(id)a3;
- (GEOWiFiQualityNetworkSearchResult)networkSearchResult;
- (TBNetworkRemoteFetchResponse)initWithNetworkSearchResults:(id)a3;
- (void)setNetworkSearchResult:(id)a3;
@end

@implementation TBNetworkRemoteFetchResponse

+ (id)responseWithNetworkSearchResults:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithNetworkSearchResults:v4];

  return v5;
}

- (TBNetworkRemoteFetchResponse)initWithNetworkSearchResults:(id)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectAtIndexedSubscript:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v4 count] >= 2) {
    NSLog( @"%s: GEOWiFiQualityNetworkSearchResult is greater than 1 (count %lu)",  "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]",  [v4 count]);
  }
  [v5 matches];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectAtIndexedSubscript:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 matches];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 count];

  if (v9 >= 2) {
    NSLog( @"%s: GEOWiFiESSMatch is greater than 1 (count %lu)",  "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]",  [v4 count]);
  }
  NSLog( @"%s: result count: %lu",  "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]",  [v4 count]);
  if ([v7 status] != 1)
  {
    NSLog(@"%s: match status is not OK", "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]");
    v14 = objc_alloc(&OBJC_CLASS___TBError);
    uint64_t v19 = *MEMORY[0x1896075E0];
    v20 = @"No results returned from remote source";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = -[TBError initWithType:userInfo:](v14, "initWithType:userInfo:", 154LL, v11);
LABEL_10:
    v13 = (void *)v15;
    v12 = 0LL;
    goto LABEL_11;
  }

  [v7 ess];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    uint64_t v21 = *MEMORY[0x1896075E0];
    v22 = @"nil ess from response";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = +[TBError responseErrorWithUserInfo:](&OBJC_CLASS___TBError, "responseErrorWithUserInfo:", v11);
    goto LABEL_10;
  }

  [v7 ess];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v23 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0LL;
LABEL_11:

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TBNetworkRemoteFetchResponse;
  v16 = -[TBRemoteFetchResponse initWithResults:tiles:error:](&v18, sel_initWithResults_tiles_error_, v12, 0LL, v13);

  return v16;
}

- (GEOWiFiQualityNetworkSearchResult)networkSearchResult
{
  return self->_networkSearchResult;
}

- (void)setNetworkSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end