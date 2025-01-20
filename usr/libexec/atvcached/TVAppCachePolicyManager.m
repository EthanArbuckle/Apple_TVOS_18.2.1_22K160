@interface TVAppCachePolicyManager
- (NSMutableDictionary)mutablePurgeRequests;
- (NSMutableSet)mutableDoNotPurgeApplications;
- (NSURL)URL;
- (OS_dispatch_queue)policiesQueue;
- (TVAppCachePolicyManager)init;
- (TVAppCachePolicyManager)initWithURL:(id)a3;
- (id)_allowedPurgeRequestsForUrgency:(int64_t)a3;
- (id)manager:(id)a3 purgeTasksForUrgency:(int64_t)a4;
- (void)addPurgeRequest:(id)a3 forApplication:(id)a4;
- (void)appCachePurgeTask:(id)a3 didPurgeAmount:(int64_t)a4 atUrgency:(int64_t)a5;
- (void)loadPolicies;
- (void)removeAllPurgeRequestsForApplication:(id)a3;
- (void)removePurgeRequestWithURL:(id)a3 forApplication:(id)a4;
- (void)savePolicies;
- (void)setDoNotPurge:(BOOL)a3 forApplication:(id)a4;
- (void)setMutableDoNotPurgeApplications:(id)a3;
- (void)setMutablePurgeRequests:(id)a3;
- (void)setPoliciesQueue:(id)a3;
@end

@implementation TVAppCachePolicyManager

- (TVAppCachePolicyManager)init
{
  return -[TVAppCachePolicyManager initWithURL:](self, "initWithURL:", 0LL);
}

- (TVAppCachePolicyManager)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVAppCachePolicyManager;
  v6 = -[TVAppCachePolicyManager init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.atvcached.cd.purge", 0LL);
    policiesQueue = v7->_policiesQueue;
    v7->_policiesQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mutableDoNotPurgeApplications = v7->_mutableDoNotPurgeApplications;
    v7->_mutableDoNotPurgeApplications = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutablePurgeRequests = v7->_mutablePurgeRequests;
    v7->_mutablePurgeRequests = v12;

    -[TVAppCachePolicyManager loadPolicies](v7, "loadPolicies");
  }

  return v7;
}

- (void)loadPolicies
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL"));
    id v24 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v4,  0LL,  &v24));
    id v6 = v24;

    if (v5)
    {
      id v23 = 0LL;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v23));
      id v8 = v23;

      if (v7 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
      {
        v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        mutableDoNotPurgeApplications = self->_mutableDoNotPurgeApplications;
        self->_mutableDoNotPurgeApplications = v10;

        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"TVAggregatePurgeRequests"]);
        if (v12 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_100003088;
          v21[3] = &unk_10000C3F0;
          v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v22 = v14;
          [v12 enumerateKeysAndObjectsUsingBlock:v21];
          mutablePurgeRequests = self->_mutablePurgeRequests;
          self->_mutablePurgeRequests = v14;
          v16 = v14;
        }

        else
        {
          v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v16 = self->_mutablePurgeRequests;
          self->_mutablePurgeRequests = v20;
        }
      }

      else
      {
        id v17 = sub_100007290();
        v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
          sub_100007620(self);
        }
      }
    }

    else
    {
      id v18 = sub_100007290();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL"));
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        __int16 v27 = 2114;
        id v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Failed to load app cache policies from file located at %{public}@ (May be first run; may not exist). Error: %{public}@",
          buf,
          0x16u);
      }

      id v8 = v6;
    }
  }

- (void)savePolicies
{
  id v3 = sub_100007290();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL"));
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to save policies to %{public}@",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL"));
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager mutablePurgeRequests](self, "mutablePurgeRequests"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000033C0;
    v20[3] = &unk_10000C418;
    uint64_t v9 = v7;
    v21 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v20];

    v22 = @"TVAggregatePurgeRequests";
    id v23 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v19 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  200LL,  0LL,  &v19));
    id v12 = v19;
    if (!v11
      || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager URL](self, "URL")),
          id v18 = v12,
          unsigned __int8 v14 = [v11 writeToURL:v13 options:1 error:&v18],
          id v15 = v18,
          v12,
          v13,
          id v12 = v15,
          (v14 & 1) == 0))
    {
      id v16 = sub_100007290();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000076A0((uint64_t)self);
      }
    }
  }

- (void)setDoNotPurge:(BOOL)a3 forApplication:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000034E0;
    block[3] = &unk_10000C440;
    BOOL v10 = a3;
    block[4] = self;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

- (void)addPurgeRequest:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 cacheURL]);
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100003620;
    v11[3] = &unk_10000C468;
    v11[4] = self;
    id v12 = v9;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v10, v11);
  }
}

- (void)removePurgeRequestWithURL:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000377C;
    block[3] = &unk_10000C490;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(v9, block);
  }
}

- (void)removeAllPurgeRequestsForApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000038C4;
    v6[3] = &unk_10000C4E0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (id)manager:(id)a3 purgeTasksForUrgency:(int64_t)a4
{
  id v6 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_100003B6C;
  id v15 = sub_100003B7C;
  id v16 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003B84;
  block[3] = &unk_10000C508;
  block[4] = self;
  void block[5] = &v11;
  block[6] = a4;
  dispatch_sync(v7, block);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)appCachePurgeTask:(id)a3 didPurgeAmount:(int64_t)a4 atUrgency:(int64_t)a5
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager policiesQueue](self, "policiesQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003C58;
  v9[3] = &unk_10000C4E0;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (id)_allowedPurgeRequestsForUrgency:(int64_t)a3
{
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v20 = self;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager mutablePurgeRequests](self, "mutablePurgeRequests"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((uint64_t)[v11 urgency] <= a3)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppCachePolicyManager mutableDoNotPurgeApplications](v20, "mutableDoNotPurgeApplications"));
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 applications]);
          id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v23;
            while (2)
            {
              for (j = 0LL; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([v12 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)])
                {

                  goto LABEL_17;
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          [v19 addObject:v11];
LABEL_17:
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v8);
  }

  return v19;
}

- (NSURL)URL
{
  return self->_URL;
}

- (OS_dispatch_queue)policiesQueue
{
  return self->_policiesQueue;
}

- (void)setPoliciesQueue:(id)a3
{
}

- (NSMutableSet)mutableDoNotPurgeApplications
{
  return self->_mutableDoNotPurgeApplications;
}

- (void)setMutableDoNotPurgeApplications:(id)a3
{
}

- (NSMutableDictionary)mutablePurgeRequests
{
  return self->_mutablePurgeRequests;
}

- (void)setMutablePurgeRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end