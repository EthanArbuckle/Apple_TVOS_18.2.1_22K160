@interface GEOThrottlerServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)isSafeWithRequest:(id)a3;
@end

@implementation GEOThrottlerServer

+ (id)identifier
{
  return @"throttler";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100011D18(v10) == 603)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___GEOThrottlerIsSafeRequest, v13, v14);
    id v16 = sub_100012270(@"throttler", v10, v11, v15, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    BOOL v19 = v17 != 0LL;
    if (v17)
    {
      [v17 setSignpostId:a6];
      -[GEOThrottlerServer isSafeWithRequest:](self, "isSafeWithRequest:", v18);
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)isSafeWithRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 requestKindType];
  id v5 = [v3 requestKindSubtype];
  id v6 = [[GEOThrottlerIsSafeReply alloc] initWithRequest:v3];
  if ([v3 includeToken])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 throttlerToken]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEODataRequestThrottler sharedThrottler](&OBJC_CLASS___GEODataRequestThrottler, "sharedThrottler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
    id v19 = 0LL;
    id v20 = v7;
    [v8 allowRequest:v4 | ((void)v5 << 32) forClient:v9 throttlerToken:&v20 error:&v19];
    id v10 = v20;

    id v11 = v19;
    [v6 setThrottlerToken:v10];
    [v6 setError:v11];
  }

  if (([v3 availableRequestCount] & 1) != 0
    || [v3 nextSafeRequestTime])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEODataRequestThrottler sharedThrottler](&OBJC_CLASS___GEODataRequestThrottler, "sharedThrottler"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
    [v13 getInfoForRequest:v4 | ((void)v5 << 32) client:v14 timeUntilNextReset:&v18 availableRequestCount:&v17];

    [v6 setAvailableRequestCount:v17];
    unsigned int v15 = [v6 availableRequestCount];
    double v16 = v18;
    if (v15) {
      double v16 = -0.0;
    }
    [v6 setNextSafeRequestTime:Current + v16];
  }

  [v6 send];
}

@end