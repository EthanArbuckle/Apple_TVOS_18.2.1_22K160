@interface GKTestToolClientProxy
- (BOOL)isPosingAsGameCenter;
- (GKGameInternal)testGame;
- (NSString)testProtocolVersion;
- (id)adamID;
- (id)bundleIdentifier;
- (id)bundleShortVersion;
- (id)bundleVersion;
- (id)externalVersion;
- (id)protocolVersion;
- (id)transportWithCredential:(id)a3;
- (void)setTestGame:(id)a3;
- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5;
- (void)setTestProtocolVersion:(id)a3;
@end

@implementation GKTestToolClientProxy

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  v13 = (void *)v12;
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v12 = (uint64_t)[(id)v12 isEqualToString:GKGameKitTesterIdentifier];
  if ((v12 & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v12 = (uint64_t)[v13 isEqualToString:GKGKTester2Identifier];
  if ((v12 & 1) != 0
    || (uint64_t v12 = (uint64_t)[v13 isEqualToString:GKGKTester2OldIdentifier], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.sample"], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.onword"], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.Chess"], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.LameGame"], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.TheCoast"], (v12 & 1) != 0)
    || (uint64_t v12 = (uint64_t)[v13 containsString:@"com.apple.Boxes"], (_DWORD)v12))
  {
LABEL_11:
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleVersion]);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@, %@)",  v14,  v13,  v15));
    }

    else
    {
      v16 = @"Game Center (default)";
    }

    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers(v12);
    }
    v18 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "setTestGame: %@ protocolVersion: %@",  buf,  0x16u);
    }

    -[GKTestToolClientProxy setTestGame:](self, "setTestGame:", v9);
    -[GKTestToolClientProxy setTestProtocolVersion:](self, "setTestProtocolVersion:", v10);
    v19 = 0LL;
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers(v12);
    }
    v22 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000ECABC((uint64_t)v13, v22);
    }
    v23 = NSStringFromSelector(a2);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:description:]( &OBJC_CLASS___NSError,  "userErrorForCode:description:",  32LL,  v16));
  }

  if (v11)
  {
    v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EC500;
    block[3] = &unk_10026B030;
    id v26 = v11;
    id v25 = v19;
    dispatch_async(v20, block);
  }
}

- (BOOL)isPosingAsGameCenter
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (v3)
  {
    unsigned __int8 v4 = 0;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    v5 = -[GKClientProxy bundleIdentifier](&v8, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    unsigned __int8 v4 = [v6 isEqualToString:GKGameCenterToolIdentifier];
  }

  return v4;
}

- (id)transportWithCredential:(id)a3
{
  id v4 = a3;
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 transportWithCredential:v4]);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy transportWithCredential:](&v9, "transportWithCredential:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)bundleIdentifier
{
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy bundleIdentifier](&v9, "bundleIdentifier");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

LABEL_7:
  return v6;
}

- (id)bundleVersion
{
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 bundleVersion]);
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy bundleVersion](&v9, "bundleVersion");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleVersion]);

LABEL_7:
  return v6;
}

- (id)bundleShortVersion
{
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 bundleShortVersion]);
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy bundleShortVersion](&v9, "bundleShortVersion");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 shortBundleVersion]);

LABEL_7:
  return v6;
}

- (id)adamID
{
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 adamID]);
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy adamID](&v9, "adamID");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 adamID]);

LABEL_7:
  return v6;
}

- (id)externalVersion
{
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 externalVersion]);
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    id v7 = -[GKClientProxy externalVersion](&v9, "externalVersion");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 externalVersion]);

LABEL_7:
  return v6;
}

- (id)protocolVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testProtocolVersion](self, "testProtocolVersion"));
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GKTestToolClientProxy;
    v6 = -[GKClientProxy protocolVersion](&v9, "protocolVersion");
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  id v7 = v5;

  return v7;
}

- (GKGameInternal)testGame
{
  return self->_testGame;
}

- (void)setTestGame:(id)a3
{
}

- (NSString)testProtocolVersion
{
  return self->_testProtocolVersion;
}

- (void)setTestProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end