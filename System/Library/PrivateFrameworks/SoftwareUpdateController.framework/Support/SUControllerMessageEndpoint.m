@interface SUControllerMessageEndpoint
+ (id)sharedEndpoint;
- (IDSService)service;
- (NSMutableDictionary)messageHandlers;
- (NSMutableDictionary)pendingMessageCompletions;
- (NSMutableDictionary)pendingMessageReplies;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)queue;
- (SUControllerMessageEndpoint)init;
- (id)sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 isCritical:(BOOL)a6 error:(id *)a7;
- (void)resume;
- (void)sendErrorReply:(id)a3 toMessage:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendReply:(id)a3 toMessage:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setHandler:(id)a3 forMessagesOfType:(id)a4;
- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4;
- (void)setMessageHandlers:(id)a3;
- (void)setPendingMessageCompletions:(id)a3;
- (void)setPendingMessageReplies:(id)a3;
- (void)suspend;
@end

@implementation SUControllerMessageEndpoint

+ (id)sharedEndpoint
{
  if (qword_100079658 != -1) {
    dispatch_once(&qword_100079658, &stru_100065A50);
  }
  return (id)qword_100079650;
}

- (SUControllerMessageEndpoint)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SUControllerMessageEndpoint;
  v2 = -[SUControllerMessageEndpoint init](&v18, "init");
  if (v2)
  {
    v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.otaupdate");
    service = v2->_service;
    v2->_service = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sucontroller.SUControllerMessageEndpoint", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.sucontroller.ids_endpoint", &_dispatch_queue_attr_concurrent);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerMessageHandler", 0LL);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingMessageCompletions = v2->_pendingMessageCompletions;
    v2->_pendingMessageCompletions = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingMessageReplies = v2->_pendingMessageReplies;
    v2->_pendingMessageReplies = v15;
  }

  return v2;
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v8]);
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:completion:]", @"Trying to send this message over IDS... %@", v9 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:completion:]", "SUControllerMessageEndpoint.m", 92, "false");
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v9]);
  [v8 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]", @"Trying to send this message over IDS... %@", v10 label format];

  __assert_rtn( "-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]",  "SUControllerMessageEndpoint.m",  99,  "false");
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v8]);
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:withReply:]", @"Trying to send this message over IDS... %@", v9 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:withReply:]", "SUControllerMessageEndpoint.m", 120, "false");
}

- (void)sendReply:(id)a3 toMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v7 logAtLevel:0, "-[SUControllerMessageEndpoint sendReply:toMessage:]", @"Trying to send this message over IDS... %@", v5 label format];

  __assert_rtn("-[SUControllerMessageEndpoint sendReply:toMessage:]", "SUControllerMessageEndpoint.m", 142, "false");
}

- (void)setHandler:(id)a3 forMessagesOfType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035494;
  block[3] = &unk_100065A78;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000355A8;
  block[3] = &unk_100065AA0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (id)sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 isCritical:(BOOL)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v17 = a4;
  if (v12)
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_100035BC8;
    v61[3] = &unk_1000658D0;
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v62 = v18;
    [v12 enumerateKeysAndObjectsUsingBlock:v61];
    id v60 = 0LL;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  200LL,  0LL,  &v60));
    id v24 = v60;
    if (v19)
    {
      v56 = v19;
      uint64_t v55 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
      id v57 = v17;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v25,  IDSSendMessageOptionExpectsPeerResponseKey));

      if (v57) {
        [v26 setObject:v57 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
      }
      v27 = &IDSSendMessageOptionTimeoutKey;
      if (a6)
      {
        v28 = &off_10006EC18;
        uint64_t v29 = 300LL;
      }

      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
        [v26 setObject:v35 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

        v28 = (_UNKNOWN **)&__kCFBooleanTrue;
        v27 = &IDSSendMessageOptionFireAndForgetKey;
        uint64_t v29 = 200LL;
      }

      [v26 setObject:v28 forKeyedSubscript:*v27];
      [v26 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint service](self, "service"));
      id v58 = v24;
      id v59 = 0LL;
      v34 = (void *)v55;
      unsigned __int8 v37 = [v36 sendData:v19 toDestinations:v55 priority:v29 options:v26 identifier:&v59 error:&v58];
      id v54 = v59;
      id v38 = v58;

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      if ((v37 & 1) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  off_100079388));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v40]);
        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  off_100079388));
          v43 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v42]);
          v44 = v54;
          [v39 logAtLevel:2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Sent message:%@ %@", v43, v54 label format];

          v34 = (void *)v55;
        }

        else
        {
          v44 = v54;
          [v39 logAtLevel:2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Sent message:%@ %@", &stru_100066480, v54 label format];
        }

        id v17 = v57;

        id v32 = v44;
        v51 = v44;
        v19 = v56;
      }

      else
      {
        objc_msgSend( v39,  "logAtLevel:label:format:",  0,  "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]",  @"Failed to send message: %ld",  objc_msgSend(v38, "code"));

        if (a7)
        {
          id v49 = sub_1000382D8( @"SUControllerError",  2LL,  v38,  @"Failed to send message: %@",  v45,  v46,  v47,  v48,  (uint64_t)v38);
          *a7 = (id)objc_claimAutoreleasedReturnValue(v49);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        [v50 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Failed to send message: %@", v38 label format];

        id v32 = 0LL;
        id v17 = v57;
        v51 = v54;
      }

      id v24 = v38;
    }

    else
    {
      if (a7)
      {
        id v33 = sub_1000382D8( @"SUControllerError",  1LL,  v24,  @"Failed to serialize message '%@'",  v20,  v21,  v22,  v23,  (uint64_t)v12);
        *a7 = (id)objc_claimAutoreleasedReturnValue(v33);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v34 logAtLevel:0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", @"Failed to serialize message '%@'", v12 label format];
      id v32 = 0LL;
    }
  }

  else
  {
    if (a7)
    {
      id v30 = sub_1000382D8( @"SUControllerError",  1LL,  0LL,  @"Cannot send nil message",  v13,  v14,  v15,  v16,  v53);
      *a7 = (id)objc_claimAutoreleasedReturnValue(v30);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v31 logAtLevel:0 label:"-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]" format:@"Cannot send nil message"];

    id v32 = 0LL;
  }

  return v32;
}

- (void)sendErrorReply:(id)a3 toMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL));
    if (v8)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
      uint64_t v15 = v9;
      uint64_t v16 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v14 = 0LL;
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]( self,  "sendMessage:replyingTo:expectingResponse:isCritical:error:",  v10,  v7,  0LL,  1LL,  &v14));
      id v12 = v14;

      if (!v11)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        [v13 logAtLevel:2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", @"Failed to send error reply: %@", v12 label format];
      }
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v12 logAtLevel:2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", @"Failed to archive error '%@'", v6 label format];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a7;
  id v54 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a5,  0LL,  0LL,  &v54));
  id v11 = v54;
  if (!v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v13 = objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
    id v44 = [v13 UTF8String];
    [v11 code];
    [v12 logAtLevel:0 label:"-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]" format:@"Failed to parse IDS message %s: %ld"];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 incomingResponseIdentifier]);

  if (v14)
  {
    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036234;
    block[3] = &unk_100065728;
    void block[4] = self;
    id v51 = v9;
    id v52 = v11;
    id v53 = v10;
    dispatch_async(v19, block);
  }

  else
  {
    if (v10)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v20]);

      if (v21)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint messageHandlers](self, "messageHandlers"));
        id v23 = (id)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v21]);

        if (v23)
        {
          id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint processingQueue](self, "processingQueue"));
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_100036428;
          v45[3] = &unk_100065AC8;
          id v46 = v21;
          id v23 = v23;
          id v49 = v23;
          id v47 = v10;
          id v48 = v9;
          dispatch_async(v24, v45);

          v25 = v46;
        }

        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
          id v36 = objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
          id v37 = [v36 UTF8String];
          objc_msgSend( v35,  "logAtLevel:label:format:",  0,  "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]",  @"No handler for message %s of type %s",  v37,  off_100079388);

          id v42 = sub_1000382D8( @"SUControllerError",  1LL,  0LL,  @"No handler for message type '%@'",  v38,  v39,  v40,  v41,  (uint64_t)v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
          -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v25, v43);
        }
      }

      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        id v28 = objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
        id v29 = [v28 UTF8String];
        objc_msgSend( v27,  "logAtLevel:label:format:",  0,  "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]",  @"Got message %s without %s key",  v29,  off_100079388);

        id v34 = sub_1000382D8( @"SUControllerError",  1LL,  0LL,  @"Dropping message without '%@' key",  v30,  v31,  v32,  v33,  (uint64_t)off_100079388);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v34);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
        -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v23, v25);
      }
    }

    else
    {
      id v26 = sub_1000382D8( @"SUControllerError",  1LL,  v11,  @"Unparseable IDS message",  v15,  v16,  v17,  v18,  (uint64_t)v44);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
      id v23 = (id)objc_claimAutoreleasedReturnValue([v9 outgoingResponseIdentifier]);
      -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v21, v23);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerMessageEndpoint queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100036584;
  v15[3] = &unk_100065AF0;
  id v16 = v11;
  uint64_t v17 = self;
  id v18 = v10;
  BOOL v19 = a6;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
}

- (NSMutableDictionary)pendingMessageCompletions
{
  return self->_pendingMessageCompletions;
}

- (void)setPendingMessageCompletions:(id)a3
{
}

- (NSMutableDictionary)pendingMessageReplies
{
  return self->_pendingMessageReplies;
}

- (void)setPendingMessageReplies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end