@interface TBErrorFetchResponse
+ (id)remoteResponseWithError:(id)a3;
+ (id)responseWithError:(id)a3;
- (NSArray)results;
- (NSError)error;
- (NSSet)tiles;
- (TBErrorFetchResponse)initWithError:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TBErrorFetchResponse

+ (id)responseWithError:(id)a3
{
  id v3 = a3;
  v4 = -[TBErrorFetchResponse initWithError:](objc_alloc(&OBJC_CLASS___TBErrorFetchResponse), "initWithError:", v3);

  return v4;
}

+ (id)remoteResponseWithError:(id)a3
{
  v20[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 domain];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:*MEMORY[0x189607740]];

  if (v6)
  {
    if ([v4 code] == -1009) {
      uint64_t v7 = 155LL;
    }
    else {
      uint64_t v7 = 150LL;
    }
    v8 = @"Unknown remote fetch error";
  }

  else
  {
    [v4 domain];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [v4 code];
      v8 = @"Unknown remote fetch error";
      uint64_t v7 = 150LL;
      switch(v12)
      {
        case -9LL:
        case -1LL:
          goto LABEL_11;
        case -8LL:
        case -6LL:
        case -5LL:
        case -3LL:
        case -2LL:
          break;
        case -7LL:
          v8 = @"Server error";
          uint64_t v7 = 153LL;
          break;
        case -4LL:
          v8 = @"No configured URL for remote fetch";
          uint64_t v7 = 151LL;
          break;
        default:
          if (v12 == -15)
          {
LABEL_11:
            v8 = @"Connection error";
            uint64_t v7 = 152LL;
          }

          break;
      }
    }

    else
    {
      v8 = @"Unknown remote fetch error";
      uint64_t v7 = 150LL;
    }
  }

  uint64_t v13 = *MEMORY[0x189607798];
  v19[0] = *MEMORY[0x1896075E0];
  v19[1] = v13;
  v20[0] = v8;
  v20[1] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = objc_alloc((Class)a1);
  v16 = -[TBError initWithType:userInfo:](objc_alloc(&OBJC_CLASS___TBError), "initWithType:userInfo:", v7, v14);
  v17 = (void *)[v15 initWithError:v16];

  return v17;
}

- (TBErrorFetchResponse)initWithError:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TBErrorFetchResponse;
  id v3 = a3;
  id v4 = -[TBErrorFetchResponse init](&v8, sel_init);
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  error = v4->_error;
  v4->_error = (NSError *)v5;

  return v4;
}

- (NSArray)results
{
  return self->results;
}

- (NSSet)tiles
{
  return self->tiles;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end