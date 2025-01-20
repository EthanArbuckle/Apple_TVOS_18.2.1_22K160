@interface TrustURLSessionCache
- (NSMutableArray)_clientLRUList;
- (NSMutableDictionary)_clientSessionMap;
- (TrustURLSessionCache)initWithDelegate:(id)a3;
- (TrustURLSessionDelegate)delegate;
- (_NSHSTSStorage)_sharedHSTSCache;
- (id)createSessionForAuditToken:(id)a3;
- (id)sessionForAuditToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)set_clientLRUList:(id)a3;
- (void)set_clientSessionMap:(id)a3;
- (void)set_sharedHSTSCache:(id)a3;
@end

@implementation TrustURLSessionCache

- (TrustURLSessionCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TrustURLSessionCache;
  v5 = -[TrustURLSessionCache init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[TrustURLSessionCache setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  20LL));
    -[TrustURLSessionCache set_clientSessionMap:](v6, "set_clientSessionMap:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 21LL));
    -[TrustURLSessionCache set_clientLRUList:](v6, "set_clientLRUList:", v8);

    id v9 = -[_NSHSTSStorage initInMemoryStore](objc_alloc(&OBJC_CLASS____NSHSTSStorage), "initInMemoryStore");
    -[TrustURLSessionCache set_sharedHSTSCache:](v6, "set_sharedHSTSCache:", v9);
  }

  return v6;
}

- (id)createSessionForAuditToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _sharedHSTSCache](self, "_sharedHSTSCache"));
  objc_msgSend(v5, "set_hstsStorage:", v6);

  [v5 setHTTPCookieStorage:0];
  [v5 setURLCache:0];
  v14 = @"User-Agent";
  v15 = @"com.apple.trustd/3.0";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  [v5 setHTTPAdditionalHeaders:v7];

  objc_msgSend(v5, "set_sourceApplicationAuditTokenData:", v4);
  objc_msgSend(v5, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.trustd.TrustURLSession");
  v8 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queue]);
  -[NSOperationQueue setUnderlyingQueue:](v8, "setUnderlyingQueue:", v10);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v5,  v11,  v8));

  return v12;
}

- (id)sessionForAuditToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    [v8 removeObject:v4];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    [v9 insertObject:v4 atIndex:0];
LABEL_5:

    goto LABEL_6;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache createSessionForAuditToken:](self, "createSessionForAuditToken:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  [v10 insertObject:v4 atIndex:0];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
  [v11 setObject:v7 forKey:v4];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
  id v13 = [v12 count];

  if ((unint64_t)v13 >= 0x15)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", (char *)objc_msgSend( v15,  "count") - 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v9]);

    [v17 finishTasksAndInvalidate];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientSessionMap](self, "_clientSessionMap"));
    [v18 removeObjectForKey:v9];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionCache _clientLRUList](self, "_clientLRUList"));
    [v19 removeLastObject];

    goto LABEL_5;
  }

- (TrustURLSessionDelegate)delegate
{
  return (TrustURLSessionDelegate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)_clientSessionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)set_clientSessionMap:(id)a3
{
}

- (NSMutableArray)_clientLRUList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)set_clientLRUList:(id)a3
{
}

- (_NSHSTSStorage)_sharedHSTSCache
{
  return (_NSHSTSStorage *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)set_sharedHSTSCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end