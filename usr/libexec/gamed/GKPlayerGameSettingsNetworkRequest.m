@interface GKPlayerGameSettingsNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKPlayerGameSettingsNetworkRequest)initWithBundleID:(id)a3 value:(id)a4;
- (GKPlayerGameSettingsNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)playerID;
- (NSString)settingValue;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)removeFromStore:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setSettingValue:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKPlayerGameSettingsNetworkRequest

+ (id)bagKey
{
  return @"gk-set-per-game-settings";
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 settingValue]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (GKPlayerGameSettingsNetworkRequest)initWithBundleID:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKPlayerGameSettingsNetworkRequest;
  v8 = -[GKPlayerGameSettingsNetworkRequest init](&v14, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    -[GKPlayerGameSettingsNetworkRequest setUuid:](v8, "setUuid:", v10);

    id v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKPlayerGameSettingsNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKPlayerGameSettingsNetworkRequest setBundleID:](v8, "setBundleID:", v6);
    -[GKPlayerGameSettingsNetworkRequest setSettingValue:](v8, "setSettingValue:", v7);
  }

  return v8;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UUIDKey"]);
  -[GKPlayerGameSettingsNetworkRequest setUuid:](self, "setUuid:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BundleIDKey"]);
  -[GKPlayerGameSettingsNetworkRequest setBundleID:](self, "setBundleID:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PlayerIDKey"]);
  -[GKPlayerGameSettingsNetworkRequest setPlayerID:](self, "setPlayerID:", v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"playerGameSettingsKey"]);
  -[GKPlayerGameSettingsNetworkRequest setSettingValue:](self, "setSettingValue:", v8);
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest nsurlRequest](self, "nsurlRequest"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  [v10 setValue:v11 forHTTPHeaderField:@"x-gk-bundle-id"];

  handleStandardRequest(self, v12, v9, v8);
}

- (GKPlayerGameSettingsNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKPlayerGameSettingsNetworkRequest;
  v5 = -[GKPlayerGameSettingsNetworkRequest init](&v9, "init");
  id v6 = v5;
  if (v5)
  {
    -[GKPlayerGameSettingsNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v4));
    -[GKPlayerGameSettingsNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);
  }

  return v6;
}

- (id)postBody
{
  v7[0] = @"allow-friend-list-access";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  v7[1] = @"for-bundle-id";
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest playerID](self, "playerID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v6]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTasks]);
  [v7 removeObjectForKey:v9];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 pendingRequests]);
  [v8 removeObjectForKey:v9];
}

- (id)taskInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest playerID](self, "playerID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"PlayerIDKey");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"BundleIDKey");

  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"BagKeyKey");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"UUIDKey");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"playerGameSettingsKey");

  return v3;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)settingValue
{
  return self->settingValue;
}

- (void)setSettingValue:(id)a3
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