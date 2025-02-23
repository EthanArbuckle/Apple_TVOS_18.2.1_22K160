@interface GKMultiplayerGroupRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKMultiplayerGroupRequest)initWithGroupID:(id)a3;
- (GKMultiplayerGroupRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSSet)participants;
- (NSString)bundleID;
- (NSString)playerGroupID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)requestIdentifier;
- (id)taskInfo;
- (int64_t)playedAt;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPlayedAt:(int64_t)a3;
- (void)setPlayerGroupID:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKMultiplayerGroupRequest

+ (id)bagKey
{
  return @"gk-put-player-group";
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 playerGroupID]);
  if ([v5 isEqualToString:v6])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 participants]);
    unsigned __int8 v9 = [v7 isEqualToSet:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKMultiplayerGroupRequest)initWithGroupID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKMultiplayerGroupRequest;
  v5 = -[GKMultiplayerGroupRequest init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[GKMultiplayerGroupRequest setUuid:](v5, "setUuid:", v7);

    -[GKMultiplayerGroupRequest setPlayerGroupID:](v5, "setPlayerGroupID:", v4);
    id v8 = _localPlayerID();
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKMultiplayerGroupRequest setPlayerID:](v5, "setPlayerID:", v9);
  }

  return v5;
}

- (GKMultiplayerGroupRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKMultiplayerGroupRequest;
  v5 = -[GKMultiplayerGroupRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKMultiplayerGroupRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKMultiplayerGroupRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKMultiplayerGroupRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKMultiplayerGroupRequest setBundleID:](self, "setBundleID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestDataKey"]);
  -[GKMultiplayerGroupRequest setRequestData:](self, "setRequestData:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestParticipantsKey"]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  -[GKMultiplayerGroupRequest setParticipants:](self, "setParticipants:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestPlayerGroupIDKey"]);
  -[GKMultiplayerGroupRequest setPlayerGroupID:](self, "setPlayerGroupID:", v10);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RequestPlayedAtKey"]);
  -[GKMultiplayerGroupRequest setPlayedAt:](self, "setPlayedAt:", [v11 longValue]);

  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKMultiplayerGroupRequest setPlayerID:](self, "setPlayerID:", v12);
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"UUIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"BundleIDKey");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest requestData](self, "requestData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"RequestDataKey");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"RequestParticipantsKey");

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"RequestPlayerGroupIDKey");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKMultiplayerGroupRequest playedAt](self, "playedAt")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"RequestPlayedAtKey");

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"PlayerIDKey");

  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "bagKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"BagKeyKey");

  return v3;
}

- (id)postBody
{
  v14[0] = @"player-group-id";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  v15[0] = v3;
  v14[1] = @"participants";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  v15[1] = v5;
  v14[2] = @"game";
  bundleID = self->bundleID;
  uint64_t v12 = @"bundle-id";
  id v13 = bundleID;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  v15[2] = v7;
  v14[3] = @"played-at";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKMultiplayerGroupRequest playedAt](self, "playedAt")));
  v15[3] = v8;
  v14[4] = @"properties";
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest requestData](self, "requestData"));
  v15[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));

  return v10;
}

- (id)requestIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerID](self, "playerID"));
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "bagKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@+%@+%@",  v3,  v4,  v7));

  return v8;
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

- (NSString)playerGroupID
{
  return self->playerGroupID;
}

- (void)setPlayerGroupID:(id)a3
{
}

- (NSSet)participants
{
  return self->participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(int64_t)a3
{
  self->_playedAt = a3;
}

- (void).cxx_destruct
{
}

@end