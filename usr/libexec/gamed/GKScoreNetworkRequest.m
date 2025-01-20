@interface GKScoreNetworkRequest
+ (id)bagKey;
+ (int64_t)coalescingDelay;
- (BOOL)coalescingAgent;
- (BOOL)currentlyRunning;
- (BOOL)issueRequests;
- (GKScoreNetworkRequest)initWithScores:(id)a3 bundleID:(id)a4 eligibleChallenges:(id)a5;
- (GKScoreNetworkRequest)initWithTask:(id)a3;
- (NSArray)challengeIDs;
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
- (void)setChallengeIDs:(id)a3;
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

@implementation GKScoreNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-scores";
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKScoreNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKScoreNetworkRequest;
  v5 = -[GKScoreNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKScoreNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKScoreNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (GKScoreNetworkRequest)initWithScores:(id)a3 bundleID:(id)a4 eligibleChallenges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___GKScoreNetworkRequest;
  v11 = -[GKScoreNetworkRequest init](&v30, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    -[GKScoreNetworkRequest setUuid:](v11, "setUuid:", v13);

    id v14 = _localPlayerID();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GKScoreNetworkRequest setPlayerID:](v11, "setPlayerID:", v15);

    -[GKScoreNetworkRequest setBundleID:](v11, "setBundleID:", v9);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[GKScoreNetworkRequest setRequestData:](v11, "setRequestData:", v16);

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](v11, "requestData"));
    [v18 setObject:v17 forKeyedSubscript:@"RequestDataKey"];

    -[GKScoreNetworkRequest setChallengeIDs:](v11, "setChallengeIDs:", v10);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v19 = v8;
    id v20 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        v23 = 0LL;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v26 + 1) + 8 * (void)v23),  "serverRepresentation",  (void)v26));
          -[NSMutableSet addObject:](v17, "addObject:", v24);

          v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v21);
    }
  }

  return v11;
}

- (int64_t)numberOfRequests
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"RequestDataKey"]);

  id v4 = [v3 count];
  return (int64_t)v4;
}

- (id)postBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestDataKey"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"scores");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"eligible-challenges");

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTasks]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  [v5 removeObjectForKey:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 pendingRequests]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  [v8 removeObjectForKey:v7];
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"RequestDataKey"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"RequestDataKey");

  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "bagKey");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"BagKeyKey");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"UUIDKey");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"BundleIDKey");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"challengesIDKey");

  return v3;
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v6 = *a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestDataKey"]);

  if (v8)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RequestDataKey"]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestDataKey"]);
    [v9 unionSet:v12];
  }

  else
  {
    id v10 = [v7 copy];

    id v11 = v10;
    *a3 = v11;
  }

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  -[GKScoreNetworkRequest setCoalescingAgent:](self, "setCoalescingAgent:", 0LL);
  -[GKScoreNetworkRequest setIssueRequests:](self, "setIssueRequests:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKScoreNetworkRequest setUuid:](self, "setUuid:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKScoreNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKScoreNetworkRequest setBundleID:](self, "setBundleID:", v7);

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[GKScoreNetworkRequest setRequestData:](self, "setRequestData:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"challengesIDKey"]);
  -[GKScoreNetworkRequest setChallengeIDs:](self, "setChallengeIDs:", v9);

  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestDataKey"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v12));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  [v11 setObject:v10 forKeyedSubscript:@"RequestDataKey"];
}

+ (int64_t)coalescingDelay
{
  return 3LL;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 count]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: PlayerID: %@ Scores: %@ challengeIDs: %@",  v3,  v4,  v6,  v7));

  return (NSString *)v8;
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
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

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSArray)challengeIDs
{
  return self->challengeIDs;
}

- (void)setChallengeIDs:(id)a3
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

- (void).cxx_destruct
{
}

@end