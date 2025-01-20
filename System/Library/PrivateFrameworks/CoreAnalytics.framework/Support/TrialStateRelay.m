@interface TrialStateRelay
- (TrialStateRelay)initWithMonitoring:(TrialStateDelegate *)a3;
- (id).cxx_construct;
- (void)_updateTrialState:(id)a3 experimentIdentifiers:(id)a4;
- (void)dealloc;
- (void)refreshTrialState:(id)a3;
- (void)subscribeToTrialNamespace:(id)a3;
- (void)unsubscribeAllUpdateHandlers;
@end

@implementation TrialStateRelay

- (TrialStateRelay)initWithMonitoring:(TrialStateDelegate *)a3
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TrialStateRelay;
  v4 = -[TrialStateRelay init](&v29, "init");
  if (v4)
  {
    if (objc_opt_class(&OBJC_CLASS___TRIClient))
    {
      v4->_trialStateDelegate = a3;
      dispatch_queue_t v5 = dispatch_queue_create("analyticsd.Trial.CallbackQueue", 0LL);
      fObj = v4->_trialClientQueue.fObj.fObj;
      v4->_trialClientQueue.fObj.fObj = (OS_dispatch_object *)v5;

      v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      notificationTokens = v4->_notificationTokens;
      v4->_notificationTokens = v7;

      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 334LL));
      trialClient = v4->trialClient;
      v4->trialClient = (TRIClient *)v9;

      v11 = (os_log_s *)qword_100131948;
      if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[TrialStateRelay] TrialIdentifier: initialized trialClient for CA project ID",  buf,  2u);
      }

      id v28 = 0LL;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[TRIClient getSandboxExtensionTokensForIdentifierQueryWithError:]( &OBJC_CLASS___TRIClient,  "getSandboxExtensionTokensForIdentifierQueryWithError:",  &v28));
      id v27 = v28;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v35 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v36;
        do
        {
          v16 = 0LL;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v16);
            if (v17)
            {
              v18 = +[NSNumber numberWithLongLong:]( NSNumber, "numberWithLongLong:", sandbox_extension_consume([v17 UTF8String]));
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              if (((unint64_t)[v19 longLongValue] & 0x8000000000000000) != 0)
              {
                v20 = (os_log_s *)(id)qword_100131948;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  int v22 = *__error();
                  *(_DWORD *)buf = 67109120;
                  int v33 = v22;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[TrialStateRelay] Trial: Failed to consume extension: %i",  buf,  8u);
                }
              }

              -[NSMutableArray addObject:](v4->_sbExtensionHandles, "addObject:", v19);
            }

            else
            {
              v21 = (os_log_s *)qword_100131948;
              if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_ERROR)) {
                sub_1000D93A8(&v30, v31, v21);
              }
            }

            v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v35 objects:v34 count:16];
        }

        while (v14);
      }

      if (v27)
      {
        v23 = (os_log_s *)(id)qword_100131948;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedDescription]);
          sub_1000D9354(v24, buf, v23);
        }
      }
    }

    v25 = v4;
  }

  return v4;
}

- (void)dealloc
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = self->_sbExtensionHandles;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
  if (v4)
  {
    uint64_t v6 = *(void *)v16;
    *(void *)&__int128 v5 = 67109120LL;
    __int128 v10 = v5;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        if (sandbox_extension_release(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v7), "longLongValue", v10)))
        {
          v8 = (os_log_s *)(id)qword_100131948;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v9 = *__error();
            *(_DWORD *)buf = v10;
            int v13 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[TrialStateRelay] Trial: Couldn't release extension %i",  buf,  8u);
          }
        }

        v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
    }

    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TrialStateRelay;
  -[TrialStateRelay dealloc](&v11, "dealloc");
}

- (void)refreshTrialState:(id)a3
{
  id v4 = a3;
  -[TRIClient refresh](self->trialClient, "refresh");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient experimentIdentifiersWithNamespaceName:]( self->trialClient,  "experimentIdentifiersWithNamespaceName:",  v4));
  uint64_t v6 = (os_log_s *)qword_100131948;
  if (v5)
  {
    v7 = (os_log_s *)(id)qword_100131948;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 experimentId]);
      unsigned int v9 = [v5 deploymentId];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 treatmentId]);
      int v11 = 138413058;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 1024;
      unsigned int v16 = v9;
      __int16 v17 = 2112;
      __int128 v18 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[TrialStateRelay] TrialIdentifier: experimentIdentifiers for namespace %@ are: experimentId: %@, deploymentId: % d, treatmentId: %@",  (uint8_t *)&v11,  0x26u);
    }

    -[TrialStateRelay _updateTrialState:experimentIdentifiers:]( self,  "_updateTrialState:experimentIdentifiers:",  v4,  v5);
  }

  else if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_DEBUG))
  {
    sub_1000D93DC(v6);
  }
}

- (void)subscribeToTrialNamespace:(id)a3
{
  id v4 = a3;
  if (self->trialClient)
  {
    __int128 v5 = objc_autoreleasePoolPush();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    trialClient = self->trialClient;
    id v7 = sub_10000B718((id *)&self->_trialClientQueue.fObj.fObj);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    __int16 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    __int16 v17 = sub_100061E30;
    __int128 v18 = &unk_100128A48;
    objc_copyWeak(&v20, &location);
    id v9 = v4;
    id v19 = v9;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( trialClient,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  v9,  v8,  &v15));

    id v11 = objc_loadWeakRetained(&location);
    objc_msgSend(v11, "refreshTrialState:", v9, v15, v16, v17, v18);

    if (v10) {
      -[NSMutableArray addObject:](self->_notificationTokens, "addObject:", v10);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    id v12 = (os_log_s *)qword_100131948;
    if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_ERROR)) {
      sub_1000D9448(v12, v13, v14);
    }
  }
}

- (void)unsubscribeAllUpdateHandlers
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_notificationTokens;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v9 + 1) + 8LL * (void)v6);
        -[TRIClient removeUpdateHandlerForToken:](self->trialClient, "removeUpdateHandlerForToken:", v7);

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
    }

    while (v4);
  }
}

- (void)_updateTrialState:(id)a3 experimentIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && (__int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 experimentId]), v9, v9))
  {
    trialStateDelegate = self->_trialStateDelegate;
    sub_100005064(v22, (char *)[v6 UTF8String]);
    id v11 = objc_claimAutoreleasedReturnValue([v8 experimentId]);
    sub_100005064(v20, (char *)[v11 UTF8String]);
    std::to_string(&v19, (int)[v8 deploymentId]);
    id v12 = objc_claimAutoreleasedReturnValue([v8 treatmentId]);
    sub_100005064(__p, (char *)[v12 UTF8String]);
    (*((void (**)(id *__return_ptr, TrialStateDelegate *, uint64_t, void **, void **, std::string *, void **))trialStateDelegate->var0
     + 2))( &v16,  trialStateDelegate,  1LL,  v22,  v20,  &v19,  __p);
    id v13 = v16;
    id v16 = 0LL;

    if (v18 < 0) {
      operator delete(__p[0]);
    }

    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }

  else
  {
    uint64_t v14 = self->_trialStateDelegate;
    sub_100005064(v22, (char *)[v6 UTF8String]);
    sub_100005064(v20, "");
    sub_100005064(&v19, "");
    sub_100005064(__p, "");
    (*((void (**)(id *__return_ptr, TrialStateDelegate *, void, void **, void **, std::string *, void **))v14->var0
     + 2))( &v24,  v14,  0LL,  v22,  v20,  &v19,  __p);
    id v15 = v24;
    id v24 = 0LL;

    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }

  if (v23 < 0) {
    operator delete(v22[0]);
  }
}

- (void).cxx_destruct
{
  fObj = self->_trialClientQueue.fObj.fObj;
  self->_trialClientQueue.fObj.fObj = 0LL;

  objc_storeStrong((id *)&self->trialClient, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  return self;
}

@end