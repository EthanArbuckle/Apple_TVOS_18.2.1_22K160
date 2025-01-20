@interface GKAchievementNetworkRequest
+ (id)bagKey;
+ (int64_t)coalescingDelay;
- (BOOL)coalescingAgent;
- (BOOL)currentlyRunning;
- (BOOL)issueRequests;
- (GKAchievementNetworkRequest)initWithAchievements:(id)a3 bundleID:(id)a4;
- (GKAchievementNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (int64_t)numberOfRequests;
- (void)addInRequestData:(id *)a3 additional:(id)a4;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6;
- (void)removeFromStore:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCoalescingAgent:(BOOL)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKAchievementNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-achievements";
}

+ (int64_t)coalescingDelay
{
  return 3LL;
}

- (GKAchievementNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKAchievementNetworkRequest;
  v5 = -[GKAchievementNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKAchievementNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKAchievementNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (GKAchievementNetworkRequest)initWithAchievements:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GKAchievementNetworkRequest;
  v8 = -[GKAchievementNetworkRequest init](&v29, "init");
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    -[GKAchievementNetworkRequest setUuid:](v8, "setUuid:", v10);

    id v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKAchievementNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKAchievementNetworkRequest setBundleID:](v8, "setBundleID:", v7);
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[GKAchievementNetworkRequest setRequestData:](v8, "setRequestData:", v13);

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier", (void)v25));

          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v19 serverRepresentation]);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](v8, "requestData"));
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
            [v22 setObject:v21 forKeyedSubscript:v23];
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v16);
    }
  }

  return v8;
}

- (int64_t)numberOfRequests
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  -[GKAchievementNetworkRequest setCoalescingAgent:](self, "setCoalescingAgent:", 0LL);
  -[GKAchievementNetworkRequest setIssueRequests:](self, "setIssueRequests:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKAchievementNetworkRequest setUuid:](self, "setUuid:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKAchievementNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKAchievementNetworkRequest setBundleID:](self, "setBundleID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestDataKey"]);
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", @"achievement-id", (void)v17));
        if (v16) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  -[GKAchievementNetworkRequest setRequestData:](self, "setRequestData:", v9);
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = *a3;
    if (v6)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v24 = v5;
      id obj = (id)objc_claimAutoreleasedReturnValue([v5 allValues]);
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v28;
        id v10 = @"achievement-id";
        do
        {
          id v11 = 0LL;
          id v25 = v8;
          do
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v11);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
            if (v13)
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);

              if (v14)
              {
                uint64_t v15 = v9;
                id v16 = v10;
                __int128 v17 = v6;
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"achievement-pct"]);
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"achievement-pct"]);
                id v21 = [v20 longValue];

                id v10 = v16;
                uint64_t v9 = v15;
                id v6 = v17;
                id v8 = v25;
              }

              else
              {
                [v6 setObject:v12 forKeyedSubscript:v13];
              }
            }

            id v11 = (char *)v11 + 1;
          }

          while (v8 != v11);
          id v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v8);
      }

      id v5 = v24;
    }

    else
    {
      *a3 = [v5 copy];
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(0LL);
    }
    v23 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "GKScoreNetworkRequest no incoming data, skipping",  buf,  2u);
    }
  }
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)postBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"achievement-ids");

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTasks]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7
    && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 requestData]),
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData")),
        unsigned int v11 = [v9 isEqualToDictionary:v10],
        v10,
        v9,
        v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTasks]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
    [v12 removeObjectForKey:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 pendingRequests]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
    [v14 removeObjectForKey:v15];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(v8);
    }
    __int128 v17 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "GKAchievementNetworkRequest task completed that was not the current active task, skipping clean up",  v18,  2u);
    }
  }
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"RequestDataKey");

  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "bagKey");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"BagKeyKey");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"UUIDKey");

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"BundleIDKey");

  return v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest playerID](self, "playerID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKAchievementNetworkRequest numberOfRequests](self, "numberOfRequests")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: PlayerID: %@ Achievement Count: %@",  v3,  v4,  v5));

  return (NSString *)v6;
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
}

- (BOOL)currentlyRunning
{
  return self->currentlyRunning;
}

- (void)setCurrentlyRunning:(BOOL)a3
{
  self->currentlyRunning = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)coalescingAgent
{
  return self->coalescingAgent;
}

- (void)setCoalescingAgent:(BOOL)a3
{
  self->coalescingAgent = a3;
}

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (void).cxx_destruct
{
}

@end