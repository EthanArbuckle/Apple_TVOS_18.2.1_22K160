@interface KTFetchURIOperation
- (KTFetchURIOperation)initWithURI:(id)a3 application:(id)a4 dependencies:(id)a5;
- (KTOperationDependencies)deps;
- (NSOperation)finishedOp;
- (NSString)application;
- (NSString)uri;
- (QueryRequest)queryRequest;
- (QueryResponse)queryResponse;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setQueryRequest:(id)a3;
- (void)setQueryResponse:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation KTFetchURIOperation

- (KTFetchURIOperation)initWithURI:(id)a3 application:(id)a4 dependencies:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___KTFetchURIOperation;
  v11 = -[KTGroupOperation init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFetchURIOperation setUri:](v11, "setUri:", v8);
    -[KTFetchURIOperation setApplication:](v12, "setApplication:", v9);
    -[KTFetchURIOperation setDeps:](v12, "setDeps:", v10);
    v13 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTFetchURIOperation setFinishedOp:](v12, "setFinishedOp:", v13);

    v14 = v12;
  }

  return v12;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation uri](self, "uri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation application](self, "application"));
  id v19 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildQueryRequest:application:error:",  v3,  v4,  &v19));
  id v6 = v19;
  -[KTFetchURIOperation setQueryRequest:](self, "setQueryRequest:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation queryRequest](self, "queryRequest"));
  LODWORD(v3) = v7 == 0LL;

  if ((_DWORD)v3)
  {
    if (qword_1002EEAC0 != -1) {
      dispatch_once(&qword_1002EEAC0, &stru_1002855F0);
    }
    v14 = (void *)qword_1002EEAC8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAC8, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation uri](self, "uri"));
      *(_DWORD *)location = 141558530;
      *(void *)&location[4] = 1752392040LL;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "FetchKTSelf: failed to create query request for %{mask.hash}@: %@",  location,  0x20u);
    }

    -[KTResultOperation setError:](self, "setError:", v6);
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTFetchURIOperation setFinishedOp:](self, "setFinishedOp:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    *(void *)location = 0LL;
    objc_initWeak((id *)location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logClient]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation queryRequest](self, "queryRequest"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100169FA4;
    v17[3] = &unk_100285678;
    objc_copyWeak(&v18, (id *)location);
    [v12 fetchQuery:v13 uuid:v10 completionHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setUri:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (QueryRequest)queryRequest
{
  return (QueryRequest *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setQueryRequest:(id)a3
{
}

- (QueryResponse)queryResponse
{
  return (QueryResponse *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setQueryResponse:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end