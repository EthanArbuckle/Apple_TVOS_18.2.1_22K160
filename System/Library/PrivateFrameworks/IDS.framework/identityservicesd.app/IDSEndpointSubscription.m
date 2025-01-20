@interface IDSEndpointSubscription
- (IDSEndpointSubscription)initWithServiceIdentifier:(id)a3 localURI:(id)a4 subscribedURIs:(id)a5 queue:(id)a6;
- (IDSURI)localURI;
- (NSArray)subscribedURIs;
- (NSMutableDictionary)endpointMap;
- (NSString)peerIDManagerToken;
- (NSString)serviceIdentifier;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)peerIDManager;
- (id)resolvedEndpoints;
- (id)resolvedEndpointsDidUpdateHandler;
- (void)_noteSourceDidDiscoverEndpointMap:(id)a3 forLocalURI:(id)a4;
- (void)_registerEndpointQueryCompletionBlock;
- (void)_signalDidUpdateEndpoints;
- (void)dealloc;
- (void)initializeWithCompletion:(id)a3;
- (void)setEndpointMap:(id)a3;
- (void)setResolvedEndpointsDidUpdateHandler:(id)a3;
@end

@implementation IDSEndpointSubscription

- (IDSEndpointSubscription)initWithServiceIdentifier:(id)a3 localURI:(id)a4 subscribedURIs:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSEndpointSubscription;
  v15 = -[IDSEndpointSubscription init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a6);
    objc_storeStrong((id *)&v16->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v16->_localURI, a4);
    objc_storeStrong((id *)&v16->_subscribedURIs, a5);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    endpointMap = v16->_endpointMap;
    v16->_endpointMap = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    peerIDManagerToken = v16->_peerIDManagerToken;
    v16->_peerIDManagerToken = (NSString *)v19;
  }

  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  [v3 removeEndpointQueryCompletionBlockForToken:self->_peerIDManagerToken];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSEndpointSubscription;
  -[IDSEndpointSubscription dealloc](&v4, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription serviceIdentifier](self, "serviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription localURI](self, "localURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription subscribedURIs](self, "subscribedURIs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p serviceIdentifier: %@, localURI: %@, subscribedURIs: %@>",  v3,  self,  v4,  v5,  v6));

  return v7;
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (void)initializeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog query](&OBJC_CLASS___IDSFoundationLog, "query"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Initializing endpoint subscription {self: %@}",  buf,  0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription peerIDManager](self, "peerIDManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription subscribedURIs](self, "subscribedURIs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription serviceIdentifier](self, "serviceIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription localURI](self, "localURI"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001B5D4;
  v13[3] = &unk_1008F6440;
  objc_copyWeak(&v15, (id *)buf);
  v13[4] = self;
  id v11 = v4;
  id v14 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  [v7 endpointsForURIs:v8 serviceIdentifier:v9 localURI:v10 completion:v13 queue:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (id)resolvedEndpoints
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription endpointMap](self, "endpointMap", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableArray addObjectsFromArray:]( v4,  "addObjectsFromArray:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v4;
}

- (void)_registerEndpointQueryCompletionBlock
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription peerIDManager](self, "peerIDManager"));
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEndpointSubscription peerIDManagerToken]( self,  "peerIDManagerToken",  _NSConcreteStackBlock,  3221225472LL,  sub_10001B960,  &unk_1008F6468));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  [v4 addEndpointQueryCompletionBlock:&v7 forToken:v5 queue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_noteSourceDidDiscoverEndpointMap:(id)a3 forLocalURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (!v10)
  {

    goto LABEL_23;
  }

  id v11 = v10;
  char v22 = 0;
  uint64_t v12 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      if (v7)
      {
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (v14)
        {
          __int128 v15 = (NSArray *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription localURI](self, "localURI"));
          if ([v7 isEqual:v15])
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription subscribedURIs](self, "subscribedURIs"));
            unsigned int v17 = [v16 containsObject:v14];

            if (!v17) {
              continue;
            }
            __int128 v15 = (NSArray *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
            v18 = v15;
            if (!v15)
            {
              v18 = objc_alloc_init(&OBJC_CLASS___NSArray);
              v21 = v18;
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription endpointMap](self, "endpointMap", v21));
            [v19 setObject:v18 forKeyedSubscript:v14];

            if (!v15) {
            char v22 = 1;
            }
          }
        }
      }
    }

    id v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
  }

  while (v11);

  if ((v22 & 1) != 0)
  {
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog query](&OBJC_CLASS___IDSFoundationLog, "query"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Endpoints subscription source did discover relevant endpoints {self: %@, localURI: %@@, endpointMap: %@}",  buf,  0x20u);
    }

    -[IDSEndpointSubscription _signalDidUpdateEndpoints](self, "_signalDidUpdateEndpoints");
  }

- (void)_signalDidUpdateEndpoints
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription resolvedEndpointsDidUpdateHandler](self, "resolvedEndpointsDidUpdateHandler"));
  if (v4)
  {
    id v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( -[IDSEndpointSubscription resolvedEndpointsDidUpdateHandler]( self,  "resolvedEndpointsDidUpdateHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEndpointSubscription resolvedEndpoints](self, "resolvedEndpoints"));
    v6[2](v6, v5);
  }

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (IDSURI)localURI
{
  return self->_localURI;
}

- (NSArray)subscribedURIs
{
  return self->_subscribedURIs;
}

- (id)resolvedEndpointsDidUpdateHandler
{
  return self->_resolvedEndpointsDidUpdateHandler;
}

- (void)setResolvedEndpointsDidUpdateHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)endpointMap
{
  return self->_endpointMap;
}

- (void)setEndpointMap:(id)a3
{
}

- (NSString)peerIDManagerToken
{
  return self->_peerIDManagerToken;
}

- (void).cxx_destruct
{
}

@end