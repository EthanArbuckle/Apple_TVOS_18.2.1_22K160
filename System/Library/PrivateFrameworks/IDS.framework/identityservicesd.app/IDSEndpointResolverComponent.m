@interface IDSEndpointResolverComponent
- (IDSEndpointResolverComponent)initWithQueryCache:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSEndpointResolverComponent

- (IDSEndpointResolverComponent)initWithQueryCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSEndpointResolverComponent;
  v6 = -[IDSEndpointResolverComponent init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peerIDManager, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]);
  id v7 = [v6 count];

  if (v7)
  {
    else {
      uint64_t v8 = 2LL;
    }
    else {
      uint64_t v9 = v8;
    }
    peerIDManager = self->_peerIDManager;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 fromID]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v12,  v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 fromIdentity]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]( peerIDManager,  "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:",  v11,  v14,  v15,  v16,  v9,  [v4 disallowQueryRefresh] ^ 1));

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v23, 0));
          id v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v32;
            do
            {
              for (j = 0LL; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v32 != v27) {
                  objc_enumerationMutation(v24);
                }
                -[NSMutableArray addObject:](v5, "addObject:", *(void *)(*((void *)&v31 + 1) + 8LL * (void)j));
              }

              id v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }

            while (v26);
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v20);
    }
  }

  [v4 setEndpoints:v5];
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v4));

  return v29;
}

- (void).cxx_destruct
{
}

@end