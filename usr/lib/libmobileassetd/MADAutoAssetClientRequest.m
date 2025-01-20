@interface MADAutoAssetClientRequest
+ (BOOL)supportsSecureCoding;
+ (id)responseErrorSummary:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientRequestAuditToken;
- (MAAutoAssetProgress)downloadProgress;
- (MAAutoAssetStatus)autoAssetStatus;
- (MADAutoAssetClientRequest)initWithCoder:(id)a3;
- (MADAutoAssetTimed)timedTracker;
- (NSError)responseError;
- (NSString)autoAssetJobUUID;
- (NSString)clientID;
- (NSString)clientRequestUUID;
- (SUCoreConnectClientProxy)clientProgressProxy;
- (SUCoreConnectMessage)clientRequestMessage;
- (SUCoreConnectMessage)responseMessage;
- (id)clientReplyCompletion;
- (id)initForClientID:(id)a3 withClientRequestMessage:(id)a4 withClientProgressProxy:(id)a5 withClientReplyCompletion:(id)a6;
- (id)summary;
- (id)summaryWithResponseMessage:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetJobUUID:(id)a3;
- (void)setAutoAssetStatus:(id)a3;
- (void)setClientReplyCompletion:(id)a3;
- (void)setClientRequestUUID:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setResponseError:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setTimedTracker:(id)a3;
@end

@implementation MADAutoAssetClientRequest

- (id)initForClientID:(id)a3 withClientRequestMessage:(id)a4 withClientProgressProxy:(id)a5 withClientReplyCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MADAutoAssetClientRequest;
  v15 = -[MADAutoAssetClientRequest init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientID, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    clientRequestUUID = v16->_clientRequestUUID;
    v16->_clientRequestUUID = (NSString *)v18;

    objc_storeStrong((id *)&v16->_clientRequestMessage, a4);
    objc_storeStrong((id *)&v16->_clientProgressProxy, a5);
    responseMessage = v16->_responseMessage;
    v16->_responseMessage = 0LL;

    responseError = v16->_responseError;
    v16->_responseError = 0LL;

    autoAssetJobUUID = v16->_autoAssetJobUUID;
    v16->_autoAssetJobUUID = 0LL;

    downloadProgress = v16->_downloadProgress;
    v16->_downloadProgress = 0LL;

    autoAssetStatus = v16->_autoAssetStatus;
    v16->_autoAssetStatus = 0LL;

    timedTracker = v16->_timedTracker;
    v16->_timedTracker = 0LL;

    id v26 = objc_retainBlock(v14);
    id clientReplyCompletion = v16->_clientReplyCompletion;
    v16->_id clientReplyCompletion = v26;
  }

  return v16;
}

- (NSString)clientRequestUUID
{
  return self->_clientRequestUUID;
}

- (SUCoreConnectMessage)clientRequestMessage
{
  return self->_clientRequestMessage;
}

- (id)summary
{
  return -[MADAutoAssetClientRequest summaryWithResponseMessage:](self, "summaryWithResponseMessage:", 1LL);
}

- (id)summaryWithResponseMessage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest responseError](self, "responseError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v5));

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientID](self, "clientID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientRequestUUID](self, "clientRequestUUID"));
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientRequestMessage](self, "clientRequestMessage"));
  id v34 = +[MADAutoAssetControlManager newSummaryForRequestMessage:includingSelector:]( &OBJC_CLASS___MADAutoAssetControlManager,  "newSummaryForRequestMessage:includingSelector:");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientProgressProxy](self, "clientProgressProxy"));
  v9 = @"Y";
  v10 = @"N";
  v28 = (void *)v8;
  if (!v8) {
    v9 = @"N";
  }
  v24 = v9;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest responseMessage](self, "responseMessage"));
  if (v27)
  {
    if (v3)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest responseMessage](self, "responseMessage"));
      v10 = (const __CFString *)objc_claimAutoreleasedReturnValue([v21 summary]);
      int v26 = 1;
    }

    else
    {
      int v26 = 0;
      v10 = @"Y";
    }
  }

  else
  {
    int v26 = 0;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetJobUUID](self, "autoAssetJobUUID"));
  if (v11) {
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetJobUUID](self, "autoAssetJobUUID"));
  }
  else {
    v33 = @"N";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest downloadProgress](self, "downloadProgress"));
  if (v12)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest downloadProgress](self, "downloadProgress"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 summary]);
  }

  else
  {
    v32 = @"N";
  }

  v30 = (void *)v7;
  v31 = (__CFString *)v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetStatus](self, "autoAssetStatus"));
  if (v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetStatus](self, "autoAssetStatus"));
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 summary]);
  }

  else
  {
    id v14 = @"N";
  }

  v25 = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest timedTracker](self, "timedTracker"));
  if (v15)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest timedTracker](self, "timedTracker"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
  }

  else
  {
    v16 = @"N";
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientReplyCompletion](self, "clientReplyCompletion"));
  uint64_t v18 = @"Y";
  if (!v17) {
    uint64_t v18 = @"N";
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientID:%@|requestUUID:%@|requestMessage:%@|progressProxy:%@|responseMessage:%@|responseError:%@|jobUUID:%@|downloadProgress:%@|autoAssetStatus:%@|timedTracker:%@|replyCompletion:%@]",  v30,  v35,  v34,  v24,  v31,  v6,  v33,  v32,  v14,  v16,  v18));

  if (v15)
  {
  }

  if (v13)
  {
  }

  if (v12)
  {
  }

  if (v25) {
  if (v26)
  }
  {
  }

  return v19;
}

- (NSError)responseError
{
  return self->_responseError;
}

+ (id)responseErrorSummary:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 checkedDescription]);
    if ([v3 hasPrefix:@"[com.apple.MobileAssetError."])
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "substringFromIndex:",  objc_msgSend(@"[com.apple.MobileAssetError.", "length")));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@", v4));
    }

    else
    {
      v5 = v3;
    }
  }

  else
  {
    v5 = @"N";
  }

  return v5;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (SUCoreConnectClientProxy)clientProgressProxy
{
  return self->_clientProgressProxy;
}

- (SUCoreConnectMessage)responseMessage
{
  return self->_responseMessage;
}

- (NSString)autoAssetJobUUID
{
  return self->_autoAssetJobUUID;
}

- (MAAutoAssetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (MAAutoAssetStatus)autoAssetStatus
{
  return self->_autoAssetStatus;
}

- (MADAutoAssetTimed)timedTracker
{
  return self->_timedTracker;
}

- (id)clientReplyCompletion
{
  return self->_clientReplyCompletion;
}

- (void)setClientReplyCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MADAutoAssetClientRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___MADAutoAssetClientRequest;
  v5 = -[MADAutoAssetClientRequest init](&v38, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientRequestUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    clientRequestUUID = v5->_clientRequestUUID;
    v5->_clientRequestUUID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectMessage) forKey:@"clientRequestMessage"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    clientRequestMessage = v5->_clientRequestMessage;
    v5->_clientRequestMessage = (SUCoreConnectMessage *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectClientProxy) forKey:@"clientProgressProxy"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    clientProgressProxy = v5->_clientProgressProxy;
    v5->_clientProgressProxy = (SUCoreConnectClientProxy *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectMessage) forKey:@"responseMessage"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    responseMessage = v5->_responseMessage;
    v5->_responseMessage = (SUCoreConnectMessage *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"responseError"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    responseError = v5->_responseError;
    v5->_responseError = (NSError *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetJobUUID"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    autoAssetJobUUID = v5->_autoAssetJobUUID;
    v5->_autoAssetJobUUID = (NSString *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetProgress) forKey:@"downloadProgress"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetStatus) forKey:@"autoAssetStatus"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    autoAssetStatus = v5->_autoAssetStatus;
    v5->_autoAssetStatus = (MAAutoAssetStatus *)v31;

    id v33 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetTimed) forKey:@"timedTracker"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    timedTracker = v5->_timedTracker;
    v5->_timedTracker = (MADAutoAssetTimed *)v34;

    id clientReplyCompletion = v5->_clientReplyCompletion;
    v5->_id clientReplyCompletion = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientID](self, "clientID"));
  [v4 encodeObject:v5 forKey:@"clientID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientRequestUUID](self, "clientRequestUUID"));
  [v4 encodeObject:v6 forKey:@"clientRequestUUID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientRequestMessage](self, "clientRequestMessage"));
  [v4 encodeObject:v7 forKey:@"clientRequestMessage"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest clientProgressProxy](self, "clientProgressProxy"));
  [v4 encodeObject:v8 forKey:@"clientProgressProxy"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest responseMessage](self, "responseMessage"));
  [v4 encodeObject:v9 forKey:@"responseMessage"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest responseError](self, "responseError"));
  [v4 encodeObject:v10 forKey:@"responseError"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetJobUUID](self, "autoAssetJobUUID"));
  [v4 encodeObject:v11 forKey:@"autoAssetJobUUID"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest downloadProgress](self, "downloadProgress"));
  [v4 encodeObject:v12 forKey:@"downloadProgress"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest autoAssetStatus](self, "autoAssetStatus"));
  [v4 encodeObject:v13 forKey:@"autoAssetStatus"];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest timedTracker](self, "timedTracker"));
  [v4 encodeObject:v14 forKey:@"timedTracker"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setClientRequestUUID:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientRequestAuditToken
{
  __int128 v3 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[3].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setResponseMessage:(id)a3
{
}

- (void)setResponseError:(id)a3
{
}

- (void)setAutoAssetJobUUID:(id)a3
{
}

- (void)setDownloadProgress:(id)a3
{
}

- (void)setAutoAssetStatus:(id)a3
{
}

- (void)setTimedTracker:(id)a3
{
}

@end