@interface GKRemoveFriendNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKRemoveFriendNetworkRequest)initWithFriendPlayerID:(id)a3;
- (GKRemoveFriendNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)friendID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)requestIdentifier;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setFriendID:(id)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKRemoveFriendNetworkRequest

+ (id)bagKey
{
  return @"gk-remove-friend";
}

- (id)postBody
{
  v5 = @"player-id";
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

- (GKRemoveFriendNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKRemoveFriendNetworkRequest;
  v5 = -[GKRemoveFriendNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKRemoveFriendNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKRemoveFriendNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (GKRemoveFriendNetworkRequest)initWithFriendPlayerID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKRemoveFriendNetworkRequest;
  v5 = -[GKRemoveFriendNetworkRequest init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[GKRemoveFriendNetworkRequest setUuid:](v5, "setUuid:", v7);

    id v8 = _localPlayerID();
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKRemoveFriendNetworkRequest setPlayerID:](v5, "setPlayerID:", v9);

    -[GKRemoveFriendNetworkRequest setFriendID:](v5, "setFriendID:", v4);
  }

  return v5;
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"FriendPlayerIDKey");

  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"BagKeyKey");

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"UUIDKey");

  return v3;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKRemoveFriendNetworkRequest setUuid:](self, "setUuid:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FriendPlayerIDKey"]);
  -[GKRemoveFriendNetworkRequest setFriendID:](self, "setFriendID:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKRemoveFriendNetworkRequest setPlayerID:](self, "setPlayerID:", v7);
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)requestIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "bagKey");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@+%@+%@",  v3,  v4,  v7));

  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: PlayerID: %@ FriendPlayerID: %@",  v3,  v4,  v5));

  return (NSString *)v6;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 friendID]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)friendID
{
  return self->friendID;
}

- (void)setFriendID:(id)a3
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

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end