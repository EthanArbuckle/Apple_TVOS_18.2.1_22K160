@interface SDLogAgentContainer
+ (id)containerAtLocation:(id)a3 forTaskType:(int)a4 withTimeout:(double)a5 withDelegate:(id)a6 withMsgContents:(id)a7 withReplyBlock:(id)a8;
- (BOOL)_execute;
- (BOOL)sendHelperMessage;
- (NSDictionary)msgContents;
- (NSString)outputDir;
- (NSString)taskName;
- (OS_xpc_object)logAgentConnection;
- (OS_xpc_object)reply;
- (id)helperRepliedHandler;
- (id)replyBlock;
- (unint64_t)taskType;
- (void)setLogAgentConnection:(id)a3;
- (void)setMsgContents:(id)a3;
- (void)setOutputDir:(id)a3;
- (void)setReply:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setTaskName:(id)a3;
- (void)setTaskType:(unint64_t)a3;
@end

@implementation SDLogAgentContainer

+ (id)containerAtLocation:(id)a3 forTaskType:(int)a4 withTimeout:(double)a5 withDelegate:(id)a6 withMsgContents:(id)a7 withReplyBlock:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  v17 = sub_10003F784(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = sub_100024C0C(v13, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDLogAgentContainer),  "initWithName:andDestination:withDelegate:",  v20,  0LL,  v16);
  if (v21)
  {
    -[SDTaskContainer setTimeout:](v21, "setTimeout:", a5);
    -[SDLogAgentContainer setTaskType:](v21, "setTaskType:", a4);
    v22 = sub_10003F784(a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[SDLogAgentContainer setTaskName:](v21, "setTaskName:", v23);

    -[SDLogAgentContainer setOutputDir:](v21, "setOutputDir:", v13);
    -[SDLogAgentContainer setMsgContents:](v21, "setMsgContents:", v14);
    -[SDLogAgentContainer setReplyBlock:](v21, "setReplyBlock:", v15);
    -[SDLogAgentContainer setReply:](v21, "setReply:", 0LL);
  }

  return v21;
}

- (id)helperRepliedHandler
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003EB48;
  v3[3] = &unk_100089798;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (BOOL)sendHelperMessage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v3 recordHelperTaskStart];
  v4 = sub_100021BFC(&stru_100089B00);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[SDLogAgentContainer setLogAgentConnection:](self, "setLogAgentConnection:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer logAgentConnection](self, "logAgentConnection"));
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v7)
    {
      xpc_dictionary_set_int64(v7, "taskType", -[SDLogAgentContainer taskType](self, "taskType"));
      unsigned __int8 v8 = -[SDTaskContainer runByItself](self, "runByItself");
      -[SDTaskContainer timeout](self, "timeout");
      double v10 = v9;
      if ((v8 & 1) == 0)
      {
        [v3 minimumTimeBeforeTimeouts];
        double v10 = v10 + v11;
      }

      xpc_dictionary_set_double(v7, "taskTimeout", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer outputDir](self, "outputDir"));

      if (v12)
      {
        id v13 = objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer outputDir](self, "outputDir"));
        xpc_dictionary_set_string(v7, "taskOutputDir", (const char *)[v13 fileSystemRepresentation]);
      }

      else
      {
        xpc_dictionary_set_BOOL(v7, "taskNoOutputDir", 1);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));

      if (v18)
      {
        v37 = v3;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));
        id v20 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v39;
          do
          {
            v23 = 0LL;
            do
            {
              if (*(void *)v39 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(id *)(*((void *)&v38 + 1) + 8LL * (void)v23);
              v25 = (const char *)[v24 UTF8String];
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));
              v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v24]);
              xpc_dictionary_set_value(v7, v25, v27);

              v23 = (char *)v23 + 1;
            }

            while (v21 != v23);
            id v21 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }

          while (v21);
        }

        v3 = v37;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      xpc_dictionary_set_int64(v7, "startTimeClockNS", (int64_t)[v28 startDiagnosticTimeClockNS]);

      v29 = sub_100024174();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      v31 = v30;
      if ((unint64_t)&self->super.super.super.super.isa + 1 >= 2 && os_signpost_enabled(v30))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer taskName](self, "taskName"));
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)self,  "Helper Task",  "%@",  buf,  0xCu);
      }

      v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer logAgentConnection](self, "logAgentConnection"));
      v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 taskQueue]);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer helperRepliedHandler](self, "helperRepliedHandler"));
      xpc_connection_send_message_with_reply(v33, v7, v34, v35);
    }
  }

  else
  {
    id v14 = sub_1000241E4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100056F44(self);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer taskName](self, "taskName"));
    [v16 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"No connection with sysdiagnose_helper. Cannot execute task: %@", v17 category msg];

    [v3 recordHelperTaskEnd];
  }

  return v6 != 0LL;
}

- (BOOL)_execute
{
  return -[SDLogAgentContainer sendHelperMessage](self, "sendHelperMessage");
}

- (OS_xpc_object)logAgentConnection
{
  return self->_logAgentConnection;
}

- (void)setLogAgentConnection:(id)a3
{
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(unint64_t)a3
{
  self->_taskType = a3;
}

- (NSString)taskName
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setTaskName:(id)a3
{
}

- (NSString)outputDir
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setOutputDir:(id)a3
{
}

- (NSDictionary)msgContents
{
  return (NSDictionary *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setMsgContents:(id)a3
{
}

- (id)replyBlock
{
  return objc_getProperty(self, a2, 184LL, 1);
}

- (void)setReplyBlock:(id)a3
{
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end