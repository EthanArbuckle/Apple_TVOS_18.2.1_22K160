@interface CSDCallSourceFetcher
- (CSDCallSourceFetcher)init;
- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3;
- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3 timeout:(double)a4;
- (CSDCallSourceFetcherDataSource)dataSource;
- (NSMutableDictionary)pendingCompletions;
- (OS_dispatch_queue)serialQueue;
- (double)timeout;
- (void)_waitForCallSourceWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchCallSourceForIdentifier:(id)a3 completion:(id)a4;
- (void)handleCallSourcesChanged;
- (void)setDataSource:(id)a3;
- (void)setPendingCompletions:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation CSDCallSourceFetcher

- (CSDCallSourceFetcher)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDCallSourceFetcher.m",  27,  @"%s is not available. Use another initializer instead.",  "-[CSDCallSourceFetcher init]");

  return 0LL;
}

- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3
{
  return -[CSDCallSourceFetcher initWithSerialQueue:timeout:](self, "initWithSerialQueue:timeout:", a3, 10.0);
}

- (CSDCallSourceFetcher)initWithSerialQueue:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSDCallSourceFetcher;
  v8 = -[CSDCallSourceFetcher init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serialQueue, a3);
    v9->_timeout = a4;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingCompletions = v9->_pendingCompletions;
    v9->_pendingCompletions = (NSMutableDictionary *)v10;
  }

  return v9;
}

- (void)fetchCallSourceForIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callSourceWithIdentifier:v10]);

  if (v9) {
    v6[2](v6, v9);
  }
  else {
    -[CSDCallSourceFetcher _waitForCallSourceWithIdentifier:completion:]( self,  "_waitForCallSourceWithIdentifier:completion:",  v10,  v6);
  }
}

- (void)handleCallSourcesChanged
{
  v2 = self;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher pendingCompletions](v2, "pendingCompletions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id obj = v5;
  id v24 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    v22 = v2;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher dataSource](v2, "dataSource"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callSourceWithIdentifier:v7]);

        if (v9)
        {
          v25 = i;
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher pendingCompletions](v2, "pendingCompletions"));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v27;
            do
            {
              for (j = 0LL; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)j);
                id v18 = sub_1001704C4();
                v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v35 = v7;
                  _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Calling fetch completion block for call source with identifier %@",  buf,  0xCu);
                }

                (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v9);
              }

              id v14 = [v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
            }

            while (v14);
          }

          v2 = v22;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher pendingCompletions](v22, "pendingCompletions"));
          [v20 setObject:0 forKeyedSubscript:v7];

          i = v25;
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }

    while (v24);
  }
}

- (void)_waitForCallSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Waiting for call source with identifier %@",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher pendingCompletions](self, "pendingCompletions"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (!v12)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher pendingCompletions](self, "pendingCompletions"));
    [v13 setObject:v12 forKeyedSubscript:v6];
  }

  id v14 = [v7 copy];
  id v15 = objc_retainBlock(v14);
  [v12 addObject:v15];

  -[CSDCallSourceFetcher timeout](self, "timeout");
  dispatch_time_t v17 = dispatch_time(0LL, (uint64_t)(v16 * 1000000000.0));
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallSourceFetcher serialQueue](self, "serialQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10009361C;
  v22[3] = &unk_1003D8F08;
  v22[4] = self;
  id v23 = v6;
  id v24 = v14;
  id v25 = v7;
  id v19 = v7;
  id v20 = v14;
  id v21 = v6;
  dispatch_after(v17, v18, v22);
}

- (CSDCallSourceFetcherDataSource)dataSource
{
  return (CSDCallSourceFetcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableDictionary)pendingCompletions
{
  return self->_pendingCompletions;
}

- (void)setPendingCompletions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end