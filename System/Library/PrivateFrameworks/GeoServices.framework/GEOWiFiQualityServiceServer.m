@interface GEOWiFiQualityServiceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)cancelWithMessage:(id)a3;
- (void)submitWithMessage:(id)a3;
- (void)tileWithMessage:(id)a3;
@end

@implementation GEOWiFiQualityServiceServer

+ (id)identifier
{
  return @"wifiqualsvc";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  int v12 = sub_100011D18(a3);
  switch(v12)
  {
    case 430:
      id v16 = [[GEOMessage alloc] initWithXPCMessage:v10 peer:v11];
      v14 = v16;
      BOOL v15 = v16 != 0LL;
      if (v16)
      {
        [v16 setSignpostId:a6];
        -[GEOWiFiQualityServiceServer tileWithMessage:](self, "tileWithMessage:", v14);
        goto LABEL_10;
      }

      break;
    case 614:
      id v17 = [[GEOMessage alloc] initWithXPCMessage:v10 peer:v11];
      v14 = v17;
      BOOL v15 = v17 != 0LL;
      if (v17)
      {
        [v17 setSignpostId:a6];
        -[GEOWiFiQualityServiceServer cancelWithMessage:](self, "cancelWithMessage:", v14);
        goto LABEL_10;
      }

      break;
    case 660:
      id v13 = [[GEOMessage alloc] initWithXPCMessage:v10 peer:v11];
      v14 = v13;
      BOOL v15 = v13 != 0LL;
      if (v13)
      {
        [v13 setSignpostId:a6];
        -[GEOWiFiQualityServiceServer submitWithMessage:](self, "submitWithMessage:", v14);
LABEL_10:
        BOOL v15 = 1;
      }

      break;
    default:
      BOOL v15 = 0;
      goto LABEL_13;
  }

LABEL_13:
  return v15;
}

- (void)submitWithMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wifireq"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wifireqid"]);

  v8 = -[GEOWiFiQualityServiceRequest initWithData:]( objc_alloc(&OBJC_CLASS___GEOWiFiQualityServiceRequest),  "initWithData:",  v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOWiFiQualityServiceManager sharedManager]( &OBJC_CLASS___GEOWiFiQualityServiceManager,  "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GEOXPCConnection defaultXPCServerConnectionQueue]( &OBJC_CLASS___GEOXPCConnection,  "defaultXPCServerConnectionQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100025BE4;
  v13[3] = &unk_10005A108;
  id v14 = v3;
  id v12 = v3;
  [v9 submitWiFiQualityServiceRequest:v8 requestId:v7 auditToken:v10 completionQueue:v11 completion:v13];
}

- (void)tileWithMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wifitk"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wifiet"]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"wifireqid"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GEOWiFiQualityServiceManager sharedManager]( &OBJC_CLASS___GEOWiFiQualityServiceManager,  "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredAuditToken]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GEOXPCConnection defaultXPCServerConnectionQueue]( &OBJC_CLASS___GEOXPCConnection,  "defaultXPCServerConnectionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100025E58;
  v14[3] = &unk_10005A130;
  id v15 = v3;
  id v13 = v3;
  [v10 submitWiFiQualityTileLoadForKey:v5 eTag:v7 requestId:v9 auditToken:v11 completionQueue:v12 completion:v14];
}

- (void)cancelWithMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wifireqid"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOWiFiQualityServiceManager sharedManager]( &OBJC_CLASS___GEOWiFiQualityServiceManager,  "sharedManager"));
  [v5 cancelRequestId:v6];

  [v3 sendReply:0];
}

@end