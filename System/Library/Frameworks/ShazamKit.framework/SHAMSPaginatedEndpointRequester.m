@interface SHAMSPaginatedEndpointRequester
- (SHAMSEndpointRequester)endpointRequester;
- (SHAMSPaginatedEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4;
- (void)invalidate;
- (void)performRequests:(id)a3 completionHandler:(id)a4;
- (void)setEndpointRequester:(id)a3;
@end

@implementation SHAMSPaginatedEndpointRequester

- (SHAMSPaginatedEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHAMSPaginatedEndpointRequester;
  v7 = -[SHAMSPaginatedEndpointRequester init](&v11, "init");
  if (v7)
  {
    v8 = -[SHAMSEndpointRequester initWithClientIdentifier:clientType:]( objc_alloc(&OBJC_CLASS___SHAMSEndpointRequester),  "initWithClientIdentifier:clientType:",  v6,  a4);
    endpointRequester = v7->_endpointRequester;
    v7->_endpointRequester = v8;
  }

  return v7;
}

- (void)performRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_group_create();
  if (v8)
  {
    v22 = v7;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ShazamKit.PaginatedEndpointRequester", 0LL);
    v10 = dispatch_semaphore_create(5LL);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v23 = v6;
    id obj = v6;
    id v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          dispatch_group_enter(v8);
          dispatch_time_t v17 = dispatch_time(0LL, 30000000000LL);
          dispatch_semaphore_wait(v10, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHAMSPaginatedEndpointRequester endpointRequester](self, "endpointRequester"));
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_10003D5D8;
          v28[3] = &unk_10006DE68;
          v29 = v9;
          id v30 = v11;
          v31 = v8;
          v32 = v10;
          [v18 performRequest:v16 withReply:v28];
        }

        id v13 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v13);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003D688;
    block[3] = &unk_10006CEF0;
    id v7 = v22;
    id v26 = v11;
    id v27 = v22;
    id v19 = v11;
    dispatch_group_notify(v8, v9, block);

    id v6 = v23;
  }

  else
  {
    uint64_t v20 = sh_log_object(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create dispatch group for paginated network request",  buf,  2u);
    }

    NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
    v40 = @"Failed to start paginated network request";
    dispatch_queue_t v9 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    v10 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  500LL,  0LL,  v9));
    (*((void (**)(id, void, dispatch_semaphore_s *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SHAMSPaginatedEndpointRequester endpointRequester](self, "endpointRequester"));
  [v2 invalidate];
}

- (SHAMSEndpointRequester)endpointRequester
{
  return self->_endpointRequester;
}

- (void)setEndpointRequester:(id)a3
{
}

- (void).cxx_destruct
{
}

@end