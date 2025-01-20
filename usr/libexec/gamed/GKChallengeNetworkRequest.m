@interface GKChallengeNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKChallengeNetworkRequest)initWithChallenges:(id)a3 bundleID:(id)a4;
- (GKChallengeNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableSet)challenges;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)mergeRequestData:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setChallenges:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKChallengeNetworkRequest

+ (id)bagKey
{
  return @"gk-issue-challenges";
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKChallengeNetworkRequest)initWithChallenges:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKChallengeNetworkRequest;
  v8 = -[GKChallengeNetworkRequest init](&v14, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    -[GKChallengeNetworkRequest setUuid:](v8, "setUuid:", v10);

    id v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKChallengeNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKChallengeNetworkRequest setChallenges:](v8, "setChallenges:", v6);
    -[GKChallengeNetworkRequest setBundleID:](v8, "setBundleID:", v7);
  }

  return v8;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 challenges]);

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (void)mergeRequestData:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 challenges]);

  [v6 unionSet:v5];
}

- (GKChallengeNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKChallengeNetworkRequest;
  v5 = -[GKChallengeNetworkRequest init](&v9, "init");
  id v6 = v5;
  if (v5)
  {
    -[GKChallengeNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKChallengeNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (id)postBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"challenges");

  return v3;
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"ChallengesTaskKey");

  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "bagKey");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"BagKeyKey");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"UUIDKey");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"BundleIDKey");

  return v3;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKChallengeNetworkRequest setUuid:](self, "setUuid:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKChallengeNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ChallengesTaskKey"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v9 = [v8 mutableCopy];
  -[GKChallengeNetworkRequest setChallenges:](self, "setChallenges:", v9);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKChallengeNetworkRequest setBundleID:](self, "setBundleID:", v10);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: PlayerID: %@ Challenges: %@",  v3,  v4,  v5));

  return (NSString *)v6;
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

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
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

- (NSMutableSet)challenges
{
  return self->challenges;
}

- (void)setChallenges:(id)a3
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

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end