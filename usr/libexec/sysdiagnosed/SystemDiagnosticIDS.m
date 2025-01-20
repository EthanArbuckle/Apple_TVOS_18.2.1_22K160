@interface SystemDiagnosticIDS
+ (id)getIDSCaseString:(int)a3;
+ (id)getIDSCommandString:(int)a3;
+ (id)sharedInstance;
+ (void)setTestingMode:(BOOL)a3;
- (BOOL)isPaired;
- (BOOL)sendFileAtPath:(id)a3 forDiagnosticID:(id)a4 withCase:(int)a5;
- (BOOL)sendFilenamePair:(id)a3;
- (BOOL)sendMessage:(int)a3;
- (BOOL)sendMessage:(int)a3 WithData:(id)a4;
- (BOOL)sendMessage:(int)a3 WithString:(id)a4;
- (BOOL)sendRemoteArchiveMessage:(id)a3;
- (BOOL)sendTransferSize:(unint64_t)a3;
- (BOOL)startCoSysdiagnoseForFilename:(id)a3;
- (IDSService)service;
- (NSMutableDictionary)executionGroupDictionary;
- (NSMutableDictionary)localGroupDictionary;
- (NSMutableDictionary)localTupleDictionary;
- (NSString)transferIdentifier;
- (OS_dispatch_queue)run_queue;
- (SystemDiagnosticIDS)init;
- (id)getDispatchGroupForDiagnostic:(id)a3;
- (id)stringFromProtobuf:(id)a3;
- (unint64_t)transfer_size;
- (void)SDStart:(id)a3;
- (void)SDStop;
- (void)setExecutionGroupDictionary:(id)a3;
- (void)setLocalGroupDictionary:(id)a3;
- (void)setLocalTupleDictionary:(id)a3;
- (void)setRun_queue:(id)a3;
- (void)setService:(id)a3;
- (void)setTransferIdentifier:(id)a3;
- (void)setTransfer_size:(unint64_t)a3;
@end

@implementation SystemDiagnosticIDS

+ (void)setTestingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting IDS testing mode to %d",  (uint8_t *)v4,  8u);
  }

  byte_1000A5300 = v3;
}

+ (id)sharedInstance
{
  if (byte_1000A5300)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IDS testing mode enabled, return nil for object",  v3,  2u);
    }

    return 0LL;
  }

  else
  {
    if (qword_1000A5310 != -1) {
      dispatch_once(&qword_1000A5310, &stru_100089E18);
    }
    return (id)qword_1000A5308;
  }

+ (id)getIDSCaseString:(int)a3
{
  else {
    return (id)*((void *)&off_100089E38 + a3);
  }
}

+ (id)getIDSCommandString:(int)a3
{
  else {
    return (id)*((void *)&off_100089E68 + a3);
  }
}

- (SystemDiagnosticIDS)init
{
  if (objc_opt_class(&OBJC_CLASS___IDSService, a2))
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___SystemDiagnosticIDS;
    BOOL v3 = -[SystemDiagnosticIDS init](&v24, "init");
    if (v3)
    {
      v4 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.sysdiagnose");
      service = v3->_service;
      v3->_service = v4;

      if (!v3->_service) {
        sub_100057AB0();
      }
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.sysdiagnose.idsqueue", 0LL);
      run_queue = v3->_run_queue;
      v3->_run_queue = (OS_dispatch_queue *)v6;

      v8 = (dispatch_object_s *)v3->_run_queue;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_set_target_queue(v8, v10);

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      localGroupDictionary = v3->_localGroupDictionary;
      v3->_localGroupDictionary = (NSMutableDictionary *)v11;

      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      localTupleDictionary = v3->_localTupleDictionary;
      v3->_localTupleDictionary = (NSMutableDictionary *)v13;

      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      executionGroupDictionary = v3->_executionGroupDictionary;
      v3->_executionGroupDictionary = (NSMutableDictionary *)v15;

      v17 = (dispatch_queue_s *)v3->_run_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100052780;
      block[3] = &unk_100088EA8;
      v23 = v3;
      dispatch_async(v17, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IDS service initialized.",  v21,  2u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v18 log:@"IDS service initialized."];
    }

    self = v3;
    v19 = self;
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

- (BOOL)isPaired
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        dispatch_queue_t v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 isDefaultPairedDevice])
        {
          else {
            LOBYTE(v3) = 0;
          }
          goto LABEL_13;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)getDispatchGroupForDiagnostic:(id)a3
{
  localGroupDictionary = self->_localGroupDictionary;
  if (localGroupDictionary) {
    localGroupDictionary = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( localGroupDictionary,  "objectForKey:",  a3));
  }
  return localGroupDictionary;
}

- (BOOL)sendFileAtPath:(id)a3 forDiagnosticID:(id)a4 withCase:(int)a5
{
  return 0;
}

- (BOOL)sendMessage:(int)a3 WithString:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v4 = *(void *)&a3;
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([a4 dataUsingEncoding:4]);
  LOBYTE(v4) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", v4, v6);

  return v4;
}

- (BOOL)sendMessage:(int)a3 WithData:(id)a4
{
  BOOL v4 = 0;
  if (a3 && self->_service)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v22 = IDSSendMessageOptionTimeoutKey;
    v23 = &off_10009A648;
    id v7 = a4;
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v9 = [[IDSProtobuf alloc] initWithProtobufData:v7 type:(unsigned __int16)v6 isResponse:0];

    service = self->_service;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
    id v18 = 0LL;
    id v19 = 0LL;
    -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:]( service,  "sendProtobuf:toDestinations:priority:options:identifier:error:",  v9,  v11,  300LL,  v8,  &v19,  &v18);
    id v12 = v19;
    id v13 = v18;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticIDS getIDSCommandString:]( &OBJC_CLASS___SystemDiagnosticIDS,  "getIDSCommandString:",  v6));
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IDS sendMessage: %@",  buf,  0xCu);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticIDS getIDSCommandString:]( &OBJC_CLASS___SystemDiagnosticIDS,  "getIDSCommandString:",  v6));
    [v15 log:@"IDS sendMessage: %@", v16];

    BOOL v4 = [v12 length] != 0;
  }

  return v4;
}

- (BOOL)sendFilenamePair:(id)a3
{
  return 0;
}

- (id)stringFromProtobuf:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  v5 = (NSString *)objc_claimAutoreleasedReturnValue([v3 data]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    id v7 = [v6 length];

    if (v7)
    {
      __int128 v8 = objc_alloc(&OBJC_CLASS___NSString);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
      v5 = -[NSString initWithData:encoding:](v8, "initWithData:encoding:", v9, 4LL);

      goto LABEL_6;
    }

- (void)SDStart:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create("Respond to co-sysdiagnose");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052FAC;
  block[3] = &unk_100089540;
  id v11 = v5;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)SDStop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v2 clearAllResources];

  +[SDTaskDepot signalStopTasks](&OBJC_CLASS___SDTaskDepot, "signalStopTasks");
}

- (BOOL)sendMessage:(int)a3
{
  return -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", *(void *)&a3, 0LL);
}

- (BOOL)sendTransferSize:(unint64_t)a3
{
  return 0;
}

- (BOOL)sendRemoteArchiveMessage:(id)a3
{
  return 0;
}

- (BOOL)startCoSysdiagnoseForFilename:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  LOBYTE(self) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 1LL, v4);

  return (char)self;
}

- (NSMutableDictionary)localGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLocalGroupDictionary:(id)a3
{
}

- (NSMutableDictionary)executionGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setExecutionGroupDictionary:(id)a3
{
}

- (NSMutableDictionary)localTupleDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalTupleDictionary:(id)a3
{
}

- (unint64_t)transfer_size
{
  return self->_transfer_size;
}

- (void)setTransfer_size:(unint64_t)a3
{
  self->_transfer_size = a3;
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRun_queue:(id)a3
{
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTransferIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end