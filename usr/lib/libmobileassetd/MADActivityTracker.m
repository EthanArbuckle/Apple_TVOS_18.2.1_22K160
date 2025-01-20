@interface MADActivityTracker
+ (BOOL)persistedCommand:(int)a3;
+ (id)nameOfLayer:(unint64_t)a3;
+ (id)nameOfStatus:(unint64_t)a3;
+ (unint64_t)categoryForCommand:(int)a3;
+ (unint64_t)topLevelActivityForCommand:(int)a3;
- (BOOL)associateEventualReply:(id)a3 withCommand:(int)a4;
- (BOOL)validTracker;
- (DownloadInfo)downloadInfo;
- (MADActivityCommandRequest)request;
- (MADActivityStats)stats;
- (MADActivityTracker)parentTracker;
- (NSMutableDictionary)childDict;
- (NSMutableString)failureReason;
- (NSMutableString)logLeader;
- (NSString)activityName;
- (NSString)activityUUID;
- (NSString)assetType;
- (NSString)initiatorName;
- (OS_os_activity)scopeActivity;
- (OS_xpc_object)reply;
- (OS_xpc_object)xpcConnection;
- (id)init:(unint64_t)a3 fromInitiator:(unint64_t)a4 ofName:(id)a5 withCategory:(unint64_t)a6 forAssetType:(id)a7 associatedWith:(id)a8;
- (int)command;
- (int)instanceCount;
- (unint64_t)category;
- (unint64_t)initiatorType;
- (unint64_t)owner;
- (unint64_t)topLevel;
- (void)assignParentTracker:(id)a3;
- (void)associateActivityName:(id)a3;
- (void)associateCommandRequest:(id)a3;
- (void)associateDownloadInfo:(id)a3;
- (void)associateXPCConnection:(id)a3;
- (void)extendLogLeader:(id)a3 withValue:(id)a4;
- (void)failureResult:(int)a3 ofResultName:(id)a4 forReason:(id)a5;
- (void)invalidate;
- (void)sendReply;
- (void)setActivityName:(id)a3;
- (void)setChildDict:(id)a3;
- (void)setCommand:(int)a3;
- (void)setDownloadInfo:(id)a3;
- (void)setOwner:(unint64_t)a3;
- (void)setParentTracker:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequest:(id)a3;
- (void)setScopeActivity:(id)a3;
- (void)setStats:(id)a3;
- (void)setValidTracker:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
- (void)successWithIssue:(id)a3;
- (void)usesChildDict;
- (void)warningNote:(id)a3 fromMethod:(id)a4 warning:(id)a5;
@end

@implementation MADActivityTracker

- (id)init:(unint64_t)a3 fromInitiator:(unint64_t)a4 ofName:(id)a5 withCategory:(unint64_t)a6 forAssetType:(id)a7 associatedWith:(id)a8
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MADActivityTracker;
  v18 = -[MADActivityTracker init](&v44, "init");
  v19 = v18;
  if (v18)
  {
    v18->_topLevel = a3;
    v18->_initiatorType = a4;
    objc_storeStrong((id *)&v18->_initiatorName, a5);
    v19->_category = a6;
    objc_storeStrong((id *)&v19->_assetType, a7);
    scopeActivity = v19->_scopeActivity;
    v19->_scopeActivity = 0LL;

    activityName = v19->_activityName;
    v19->_activityName = 0LL;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"|"));
    logLeader = v19->_logLeader;
    v19->_logLeader = (NSMutableString *)v22;

    failureReason = v19->_failureReason;
    v19->_failureReason = 0LL;

    v25 = objc_alloc_init(&OBJC_CLASS___MADActivityStats);
    stats = v19->_stats;
    v19->_stats = v25;

    if (v17)
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v17 activityUUID]);
      activityUUID = v19->_activityUUID;
      v19->_activityUUID = (NSString *)v27;

      uint64_t v29 = objc_claimAutoreleasedReturnValue([v17 xpcConnection]);
      xpcConnection = v19->_xpcConnection;
      v19->_xpcConnection = (OS_xpc_object *)v29;

      uint64_t v31 = objc_claimAutoreleasedReturnValue([v17 downloadInfo]);
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 UUIDString]);
      v34 = v19->_activityUUID;
      v19->_activityUUID = (NSString *)v33;

      v35 = v19->_xpcConnection;
      v19->_xpcConnection = 0LL;

      uint64_t v31 = 0LL;
    }

    downloadInfo = v19->_downloadInfo;
    v19->_downloadInfo = (DownloadInfo *)v31;

    v37 = v19->_xpcConnection;
    v19->_xpcConnection = 0LL;

    v19->_command = 0;
    request = v19->_request;
    v19->_request = 0LL;

    reply = v19->_reply;
    v19->_reply = 0LL;

    v40 = v19->_downloadInfo;
    v19->_downloadInfo = 0LL;

    v19->_instanceCount = -1;
    parentTracker = v19->_parentTracker;
    v19->_parentTracker = 0LL;

    childDict = v19->_childDict;
    v19->_childDict = 0LL;

    v19->_validTracker = 1;
  }

  return v19;
}

- (void)invalidate
{
}

- (void)associateXPCConnection:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker xpcConnection](self, "xpcConnection"));

  if (!v4) {
    -[MADActivityTracker setXpcConnection:](self, "setXpcConnection:", v5);
  }
}

- (void)associateActivityName:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker activityName](self, "activityName"));

  if (!v4) {
    -[MADActivityTracker setActivityName:](self, "setActivityName:", v5);
  }
}

- (BOOL)associateEventualReply:(id)a3 withCommand:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker reply](self, "reply"));

  if (v7)
  {
    LOBYTE(v8) = 0;
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    BOOL v8 = reply != 0LL;
    if (reply)
    {
      -[MADActivityTracker setReply:](self, "setReply:", reply);
      -[MADActivityTracker setCommand:](self, "setCommand:", v4);
    }
  }

  return v8;
}

- (void)associateCommandRequest:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker request](self, "request"));

  if (!v4) {
    -[MADActivityTracker setRequest:](self, "setRequest:", v5);
  }
}

- (void)associateDownloadInfo:(id)a3
{
  id v24 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker downloadInfo](self, "downloadInfo"));

  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSString);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v24 originalUrl]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v24 options]);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tightSummaryIncludingAdditional:0]);
    v9 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"url:%@ initOpts:%@ size(dl:%llu,ex:%llu)",  v6,  v8,  [v24 downloadSize],  objc_msgSend(v24, "totalExpectedBytes"));

    v10 = (void *)objc_claimAutoreleasedReturnValue([v24 task]);
    if (!v10) {
      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue([v24 task]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@" "]);

    int v14 = [v13 count];
    int v15 = v14;
    if (v14 == 1)
    {
      id v16 = v13;
      uint64_t v17 = 0LL;
    }

    else
    {
      if (v14 < 2)
      {
        v18 = v13;
        goto LABEL_12;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
      unsigned int v21 = [v20 isEqualToString:@"BackgroundDownloadTask"];

      if (v21)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:(v15 - 1)]);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"B:%@", v22));

LABEL_6:
        if (v18)
        {
          v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ NSURL:%@",  v9,  v18);

          v9 = v19;
LABEL_12:
        }

- (void)usesChildDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker childDict](self, "childDict"));

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MADActivityTracker setChildDict:](self, "setChildDict:", v4);
  }

- (void)assignParentTracker:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker parentTracker](self, "parentTracker"));

  if (!v4) {
    -[MADActivityTracker setParentTracker:](self, "setParentTracker:", v5);
  }
}

- (void)successWithIssue:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  objc_msgSend(v4, "setSuccessWithIssues:", (char *)objc_msgSend(v4, "successWithIssues") + 1);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstSuccessIssue]);

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v7 setFirstSuccessIssue:v9];
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  [v8 setLastSuccessIssue:v9];
}

- (void)warningNote:(id)a3 fromMethod:(id)a4 warning:(id)a5
{
  id v22 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@[%@]",  @"!W",  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker logLeader](self, "logLeader"));
  LOBYTE(v9) = [v11 containsString:v10];

  if ((v9 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker logLeader](self, "logLeader"));
    [v12 appendFormat:@"%@%@", v10, @"|"];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  objc_msgSend(v13, "setTotalWarnings:", (char *)objc_msgSend(v13, "totalWarnings") + 1);

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstWarningMethod]);

  if (!v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v16 setFirstWarningMethod:v22];
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstWarningMessage]);

  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v19 setFirstWarningMessage:v22];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  [v20 setLastWarningMethod:v22];

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  [v21 setLastWarningMessage:v8];
}

- (void)failureResult:(int)a3 ofResultName:(id)a4 forReason:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v18 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  unsigned int v10 = [v9 failureResult];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "setAdditionalFailures:", (char *)objc_msgSend(v11, "additionalFailures") + 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstAdditionalFailure]);

    if (!v14)
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
      [v15 setFirstAdditionalFailure:v8];
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v16 setLastAdditionalFailure:v8];
  }

  else
  {
    [v11 setFailureResult:v6];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v17 setFailureResultName:v18];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker stats](self, "stats"));
    [v16 setFailureReason:v8];
  }
}

- (void)extendLogLeader:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MADActivityTracker logLeader](self, "logLeader"));
  [v8 appendFormat:@"%@:%@%@", v7, v6, @"|"];
}

- (void)sendReply
{
  xpc_object_t message = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[MADActivityTracker reply](self, "reply"));
  if (message)
  {
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MADActivityTracker xpcConnection](self, "xpcConnection"));
    xpc_connection_send_message(v3, message);

    -[MADActivityTracker setReply:](self, "setReply:", 0LL);
  }
}

+ (unint64_t)topLevelActivityForCommand:(int)a3
{
  int v3 = a3 - 1;
  uint64_t v4 = stringForMAXpcCommand(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = 3LL;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityTracker topLevelActivityForCommand:]",  @"{topLevelActivityForCommand} unknown command:%@",  v7,  v8,  v9,  v10,  (uint64_t)v5);

  return v6;
}

+ (unint64_t)categoryForCommand:(int)a3
{
  int v3 = a3 - 1;
  uint64_t v4 = stringForMAXpcCommand(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityTracker categoryForCommand:]",  @"{categoryForCommand} unknown command:%@",  v6,  v7,  v8,  v9,  (uint64_t)v5);

  return 2LL;
}

+ (BOOL)persistedCommand:(int)a3
{
  unint64_t v4 = +[MADActivityTracker categoryForCommand:](&OBJC_CLASS___MADActivityTracker, "categoryForCommand:");
  if (v4 - 1 >= 0xA)
  {
    uint64_t v6 = v4;
    uint64_t v7 = stringForMAXpcCommand(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v7);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityTracker persistedCommand:]",  @"{persistedCommand} unknown category:%llu for command:%@",  v8,  v9,  v10,  v11,  v6);

    LOBYTE(v5) = 0;
  }

  else
  {
    return (0x38u >> (v4 - 1)) & 1;
  }

  return v5;
}

+ (id)nameOfLayer:(unint64_t)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnknownLayer(%lld)",  a3));
  }
  else {
    return off_34E9C8[a3];
  }
}

+ (id)nameOfStatus:(unint64_t)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnknownStatusChange(%lld)",  a3));
  }
  else {
    return off_34E9E0[a3];
  }
}

- (unint64_t)topLevel
{
  return self->_topLevel;
}

- (unint64_t)initiatorType
{
  return self->_initiatorType;
}

- (NSString)initiatorName
{
  return self->_initiatorName;
}

- (unint64_t)category
{
  return self->_category;
}

- (OS_os_activity)scopeActivity
{
  return self->_scopeActivity;
}

- (void)setScopeActivity:(id)a3
{
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (BOOL)validTracker
{
  return self->_validTracker;
}

- (void)setValidTracker:(BOOL)a3
{
  self->_validTracker = a3;
}

- (NSMutableString)logLeader
{
  return self->_logLeader;
}

- (NSMutableString)failureReason
{
  return self->_failureReason;
}

- (MADActivityStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (int)command
{
  return self->_command;
}

- (void)setCommand:(int)a3
{
  self->_command = a3;
}

- (MADActivityCommandRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (OS_xpc_object)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (DownloadInfo)downloadInfo
{
  return self->_downloadInfo;
}

- (void)setDownloadInfo:(id)a3
{
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void)setOwner:(unint64_t)a3
{
  self->_owner = a3;
}

- (int)instanceCount
{
  return self->_instanceCount;
}

- (MADActivityTracker)parentTracker
{
  return self->_parentTracker;
}

- (void)setParentTracker:(id)a3
{
}

- (NSMutableDictionary)childDict
{
  return self->_childDict;
}

- (void)setChildDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end