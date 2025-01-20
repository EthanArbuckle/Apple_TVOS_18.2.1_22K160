@interface GKInstanceScoreNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKInstanceScoreNetworkRequest)initWithInstanceScore:(id)a3 bundleID:(id)a4 challenges:(id)a5;
- (GKInstanceScoreNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)leaderboardID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)requestIdentifier;
- (id)taskInfo;
- (int64_t)value;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setLeaderboardID:(id)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)setValue:(int64_t)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKInstanceScoreNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-instance-score";
}

- (GKInstanceScoreNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKInstanceScoreNetworkRequest;
  v5 = -[GKInstanceScoreNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKInstanceScoreNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKInstanceScoreNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKInstanceScoreNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKInstanceScoreNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKInstanceScoreNetworkRequest setBundleID:](self, "setBundleID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestDataKey"]);
  -[GKInstanceScoreNetworkRequest setRequestData:](self, "setRequestData:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestValueKey"]);
  -[GKInstanceScoreNetworkRequest setValue:](self, "setValue:", [v9 longValue]);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestLeaderboardIDKey"]);
  -[GKInstanceScoreNetworkRequest setLeaderboardID:](self, "setLeaderboardID:", v10);
}

- (GKInstanceScoreNetworkRequest)initWithInstanceScore:(id)a3 bundleID:(id)a4 challenges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GKInstanceScoreNetworkRequest;
  v11 = -[GKInstanceScoreNetworkRequest init](&v25, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    -[GKInstanceScoreNetworkRequest setUuid:](v11, "setUuid:", v13);

    id v14 = _localPlayerID();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GKInstanceScoreNetworkRequest setPlayerID:](v11, "setPlayerID:", v15);

    -[GKInstanceScoreNetworkRequest setBundleID:](v11, "setBundleID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 serverRepresentation]);
    id v17 = [v16 mutableCopy];
    -[GKInstanceScoreNetworkRequest setRequestData:](v11, "setRequestData:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 leaderboardIdentifier]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
    [v19 setObject:v18 forKeyedSubscript:@"leaderboard-id"];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest playerID](v11, "playerID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
    [v21 setObject:v20 forKeyedSubscript:@"player-id"];

    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
      [v22 setObject:v10 forKeyedSubscript:@"challenges"];
    }

    -[GKInstanceScoreNetworkRequest setValue:](v11, "setValue:", [v8 value]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 leaderboardIdentifier]);
    -[GKInstanceScoreNetworkRequest setLeaderboardID:](v11, "setLeaderboardID:", v23);
  }

  return v11;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestData]);

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](self, "requestData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"RequestDataKey");

  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"BagKeyKey");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"UUIDKey");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"BundleIDKey");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[GKInstanceScoreNetworkRequest value](self, "value")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"RequestValueKey");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest leaderboardID](self, "leaderboardID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"RequestLeaderboardIDKey");

  return v3;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)requestIdentifier
{
  id v3 = networkRequestIdentifier(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest leaderboardID](self, "leaderboardID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[GKInstanceScoreNetworkRequest value](self, "value")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@%@", v4, v5, v6));

  return v7;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)leaderboardID
{
  return self->leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
}

- (int64_t)value
{
  return self->value;
}

- (void)setValue:(int64_t)a3
{
  self->value = a3;
}

- (void).cxx_destruct
{
}

@end