@interface APSTaskServer
- (APSDaemon)daemon;
- (APSTaskServer)initWithConnection:(id)a3 queue:(id)a4 apsDaemon:(id)a5;
- (BOOL)_handleTaskControlResponse:(id)a3 controlResponse:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (id)_getCacheEntryForHostname:(id)a3;
- (id)_getCourierForEnvironmentName:(id)a3;
- (id)getTaskWithMessageId:(unint64_t)a3;
- (id)getTaskWithTaskId:(unint64_t)a3;
- (void)dealloc;
- (void)handleTaskControlResponseMessage:(id)a3 message:(id)a4;
- (void)handleTaskNotificationMessage:(id)a3 message:(id)a4;
- (void)resolveDNS:(id)a3 reply:(id)a4;
@end

@implementation APSTaskServer

- (APSTaskServer)initWithConnection:(id)a3 queue:(id)a4 apsDaemon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___APSTaskServer;
  v12 = -[APSTaskServer init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    outstandingTaskList = v13->_outstandingTaskList;
    v13->_outstandingTaskList = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    dnsCache = v13->_dnsCache;
    v13->_dnsCache = v16;

    id remoteDNSResponseHandler = v13->_remoteDNSResponseHandler;
    v13->_id remoteDNSResponseHandler = 0LL;

    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeStrong((id *)&v13->_daemon, a5);
  }

  return v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[APSTaskServer _getCourierForEnvironmentName:]( self,  "_getCourierForEnvironmentName:",  self->_environmentName));
  [v3 removeTaskServer:self];
  connection = self->_connection;
  self->_connection = 0LL;

  outstandingTaskList = self->_outstandingTaskList;
  self->_outstandingTaskList = 0LL;

  dnsCache = self->_dnsCache;
  self->_dnsCache = 0LL;

  daemon = self->_daemon;
  self->_daemon = 0LL;

  environmentName = self->_environmentName;
  self->_environmentName = 0LL;

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSTaskServer;
  -[APSTaskServer dealloc](&v9, "dealloc");
}

- (id)_getCourierForEnvironmentName:(id)a3
{
  return -[APSDaemon courierForEnvironmentName:](self->_daemon, "courierForEnvironmentName:", a3);
}

- (void)resolveDNS:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
    *(_DWORD *)buf = 138412290;
    v50 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received DNS request for hostname %@",  buf,  0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  objc_super v9 = self->_dnsCache;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v45;
LABEL_5:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hostname]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
      unsigned int v17 = [v15 isEqualToString:v16];

      if (v17) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
    objc_super v20 = (void *)v43;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v14 getAddressListForHostname:v19 now:v43 addressFamily:1]);

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
    v23 = (TASKEdgeDnsInput *)objc_claimAutoreleasedReturnValue([v14 getAddressListForHostname:v22 now:v43 addressFamily:2]);

    id v24 = [v21 count];
    if ((char *)-[TASKEdgeDnsInput count](v23, "count") + (void)v24)
    {
      v38 = objc_alloc(&OBJC_CLASS___APSDNSResponse);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:@","]);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsInput componentsJoinedByString:](v23, "componentsJoinedByString:", @","));
      v34 = -[APSDNSResponse initResponseForHostname:ipv4Address:ipv6Address:]( v38,  "initResponseForHostname:ipv4Address:ipv6Address:",  v39,  v40,  v41);

      v35 = (TASKRequest *)objc_claimAutoreleasedReturnValue([v6 hostname]);
      v18 = v42;
      (*((void (**)(id, TASKRequest *, TASKInput *, void))v42 + 2))(v42, v35, v34, 0LL);
      goto LABEL_19;
    }

    id v25 = v14;

    v18 = v42;
    if (v25) {
      goto LABEL_15;
    }
  }

  else
  {
LABEL_11:

    v18 = v42;
  }

  -[NSMutableArray removeObject:](self->_dnsCache, "removeObject:", 0LL);
  id v25 = 0LL;
LABEL_15:

  objc_super v9 = -[APSOutstandingTask initWithDNSTask:](objc_alloc(&OBJC_CLASS___APSOutstandingTask), "initWithDNSTask:", v6);
  -[NSMutableArray addObject:](self->_outstandingTaskList, "addObject:", v9);
  id v26 = objc_retainBlock(v18);
  id remoteDNSResponseHandler = self->_remoteDNSResponseHandler;
  self->_id remoteDNSResponseHandler = v26;

  environmentName = self->_environmentName;
  if (!environmentName)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 environment]);
    v30 = (NSString *)[v29 copy];
    v31 = self->_environmentName;
    self->_environmentName = v30;

    environmentName = self->_environmentName;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSTaskServer _getCourierForEnvironmentName:]( self,  "_getCourierForEnvironmentName:",  environmentName));
  [v21 addTaskServer:self];
  id v32 = [v21 getNextTaskMessageId];
  v23 = objc_alloc_init(&OBJC_CLASS___TASKEdgeDnsInput);
  -[TASKEdgeDnsInput setRecordType:](v23, "setRecordType:", 0LL);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 hostname]);
  -[TASKEdgeDnsInput setHostname:](v23, "setHostname:", v33);

  v34 = objc_alloc_init(&OBJC_CLASS___TASKInput);
  -[TASKInput setEdgeDNS:](v34, "setEdgeDNS:", v23);
  v35 = objc_alloc_init(&OBJC_CLASS___TASKRequest);
  -[TASKRequest setInput:](v35, "setInput:", v34);
  v36 = objc_alloc_init(&OBJC_CLASS___TASKControlRequest);
  -[TASKControlRequest setCreate:](v36, "setCreate:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TASKControlRequest data](v36, "data"));
  [v21 sendTaskControlMessageWithMetadata:v37 messageId:v32];

  -[NSMutableArray setMessageId:](v9, "setMessageId:", v32);
  -[NSMutableArray setTaskStatus:](v9, "setTaskStatus:", 1LL);

  objc_super v20 = (void *)v43;
LABEL_19:
}

- (id)getTaskWithMessageId:(unint64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_outstandingTaskList;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "messageId", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)getTaskWithTaskId:(unint64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_outstandingTaskList;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "taskId", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (BOOL)_handleTaskControlResponse:(id)a3 controlResponse:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 create]);
  if ([v9 taskId])
  {
    id v11 = [v9 taskId];
    if (v11 != (id)[v10 taskId])
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      objc_msgSend( v12,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"APSTaskServer.m",  154,  @"taskId from message %u does not match the taskId in cache %lu",  objc_msgSend(v10, "taskId"),  objc_msgSend(v9, "taskId"));
    }
  }

  else
  {
    objc_msgSend(v9, "setTaskId:", objc_msgSend(v10, "taskId"));
  }

  switch([v10 status])
  {
    case 0u:
      [v9 setTaskStatus:2];
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        id v40 = [v9 messageId];
        __int16 v41 = 2048;
        id v42 = [v9 taskId];
        __int16 v43 = 2048;
        id v44 = [v9 taskType];
        __int16 v45 = 1024;
        int v46 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received response for task messageId %lu taskId %lu type %lu status %u\n",  buf,  0x26u);
      }

      __int128 v14 = 0LL;
      goto LABEL_29;
    case 1u:
      [v9 setTaskStatus:4];
      __int128 v15 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      if (v13) {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      }
      else {
        v16 = @"This functionalty is disabled by server";
      }
      v38 = v16;
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      v21 = v15;
      NSErrorDomain v22 = NSCocoaErrorDomain;
      uint64_t v23 = 3328LL;
      goto LABEL_27;
    case 2u:
      [v9 setTaskStatus:4];
      unsigned int v17 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      if (v13) {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      }
      else {
        v16 = @"Connection is not ready";
      }
      v36 = v16;
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      v21 = v17;
      NSErrorDomain v22 = NSCocoaErrorDomain;
      uint64_t v23 = 4609LL;
      goto LABEL_27;
    case 3u:
      [v9 setTaskStatus:4];
      v18 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorDomain v19 = NSCocoaErrorDomain;
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      if (v13) {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      }
      else {
        v16 = @"Too many running tasks on server";
      }
      id v32 = v16;
      id v24 = &v32;
      id v25 = &v31;
      goto LABEL_26;
    case 4u:
      [v9 setTaskStatus:4];
      v18 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorDomain v19 = NSCocoaErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      if (v13) {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
      }
      else {
        v16 = @"Server received invalid input";
      }
      v34 = v16;
      id v24 = &v34;
      id v25 = &v33;
LABEL_26:
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  1LL));
      v21 = v18;
      NSErrorDomain v22 = v19;
      uint64_t v23 = 4866LL;
LABEL_27:
      __int128 v14 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", v22, v23, v20);

      if (v13) {
LABEL_29:
      }

      break;
    default:
      __int128 v14 = 0LL;
      break;
  }

  if ([v9 taskStatus] == (id)4 && objc_msgSend(v9, "taskType") == (id)1)
  {
    if (!v14)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v30 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:181 description:@"Returning nil error is unexpected"];
    }

    id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
    if (remoteDNSResponseHandler)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v9 dnsRequest]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 hostname]);
      remoteDNSResponseHandler[2](remoteDNSResponseHandler, v28, 0LL, v14);
    }
  }

  if (a5 && v14) {
    *a5 = v14;
  }

  return v14 == 0LL;
}

- (void)handleTaskControlResponseMessage:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolTaskStatus"]);
  id v10 = [v9 intValue];

  uint64_t v11 = (void)v10 << 56;
  if (!((void)v10 << 56))
  {
    [v7 setTaskStatus:2];
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolTaskControlPayload"]);
    __int128 v13 = -[TASKControlResponse initWithData:](objc_alloc(&OBJC_CLASS___TASKControlResponse), "initWithData:", v17);
    id v24 = 0LL;
    -[APSTaskServer _handleTaskControlResponse:controlResponse:error:]( self,  "_handleTaskControlResponse:controlResponse:error:",  v7,  v13,  &v24);
    v18 = (NSError *)v24;
LABEL_8:

    goto LABEL_10;
  }

  [v7 setTaskStatus:4];
  if (v11 == 0x200000000000000LL)
  {
    NSErrorDomain v19 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    id v26 = @"Task handling is disabled";
    __int128 v13 = (TASKControlResponse *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    __int128 v14 = v19;
    NSErrorDomain v15 = NSCocoaErrorDomain;
    uint64_t v16 = 3328LL;
    goto LABEL_7;
  }

  if (v11 == 0x100000000000000LL)
  {
    __int128 v12 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v28 = @"Server failed to deserialize protobuf payload";
    __int128 v13 = (TASKControlResponse *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    __int128 v14 = v12;
    NSErrorDomain v15 = NSCocoaErrorDomain;
    uint64_t v16 = 2048LL;
LABEL_7:
    v18 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", v15, v16, v13);
    unsigned int v17 = 0LL;
    goto LABEL_8;
  }

  unsigned int v17 = 0LL;
  v18 = 0LL;
LABEL_10:
  if ([v7 taskStatus] == (id)4)
  {
    if ([v7 taskType] == (id)1)
    {
      id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
      if (remoteDNSResponseHandler)
      {
        if (!v18)
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          [v23 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:220 description:@"Returning nil error is unexpected"];

          id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
        NSErrorDomain v22 = (void *)objc_claimAutoreleasedReturnValue([v21 hostname]);
        remoteDNSResponseHandler[2](remoteDNSResponseHandler, v22, 0LL, v18);
      }
    }

    -[NSMutableArray removeObject:](self->_outstandingTaskList, "removeObject:", v7);
  }
}

- (id)_getCacheEntryForHostname:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_dnsCache;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hostname", (void)v13));
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)handleTaskNotificationMessage:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolTaskStatus"]);
  unsigned __int8 v10 = [v9 intValue];

  if (!v10)
  {
    if ([v7 taskType] != (id)1)
    {
      __int128 v13 = 0LL;
      goto LABEL_52;
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolTaskNotificationPayload"]);
    __int128 v14 = -[TASKNotifyRequest initWithData:](objc_alloc(&OBJC_CLASS___TASKNotifyRequest), "initWithData:", v12);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[TASKNotifyRequest output](v14, "output"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 edgeDNS]);

    if ([v16 status]
      || ![v16 ipv4sCount] && !objc_msgSend(v16, "ipv6sCount"))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v61 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:249 description:@"Did not receive any ipv4 or ipv6 addresses in DNS task notification"];
    }

    v66 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v66 hostname]);
    v18 = (APSDNSCacheEntry *)objc_claimAutoreleasedReturnValue(-[APSTaskServer _getCacheEntryForHostname:](self, "_getCacheEntryForHostname:", v17));

    unsigned int v19 = [v16 status];
    if (v19 - 1 >= 4)
    {
      if (v19)
      {
        __int128 v13 = 0LL;
LABEL_50:

        goto LABEL_51;
      }

      [v7 setTaskStatus:3];
      uint64_t v23 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
      v65 = self;
      v62 = v14;
      if ([v16 ipv4sCount])
      {
        v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        if ([v16 ipv4sCount])
        {
          unint64_t v24 = 0LL;
          do
          {
            NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue([v16 ipv4AtIndex:v24]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 ipAddress]);
            [v26 getBytes:v68 length:4];

            if (inet_ntop(2, v68, (char *)buf, 0x10u))
            {
              NSErrorUserInfoKey v27 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  buf,  1LL);
              -[NSMutableArray addObject:](v67, "addObject:", v27);
              if (!v18)
              {
                v28 = objc_alloc(&OBJC_CLASS___APSDNSCacheEntry);
                v29 = (void *)objc_claimAutoreleasedReturnValue([v66 hostname]);
                v18 = -[APSDNSCacheEntry initWithHostname:](v28, "initWithHostname:", v29);

                self = v65;
                -[NSMutableArray addObject:](v65->_dnsCache, "addObject:", v18);
              }

              -[APSDNSCacheEntry addCacheIPAddress:addressFamily:timeToLive:]( v18,  "addCacheIPAddress:addressFamily:timeToLive:",  v27,  1,  (double)[v25 ttl]);
            }

            ++v24;
          }

          while ((unint64_t)[v16 ipv4sCount] > v24);
        }

        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v31 = [v16 ipv4sCount];
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
          NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue([v32 hostname]);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v33;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received %u IPv4 addresses for hostname %@: %@",  buf,  0x1Cu);

          self = v65;
        }

        uint64_t v23 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
      }

      else
      {
        v67 = 0LL;
      }

      if ([v16 ipv6sCount])
      {
        NSErrorUserInfoKey v35 = (__CFString *)objc_alloc_init((Class)v23[301]);
        v63 = v35;
        if ([v16 ipv6sCount])
        {
          unint64_t v36 = 0LL;
          do
          {
            memset(buf, 0, 46);
            NSErrorUserInfoKey v37 = (void *)objc_claimAutoreleasedReturnValue([v16 ipv6AtIndex:v36]);
            v68[0] = 7696;
            v38 = (void *)objc_claimAutoreleasedReturnValue([v37 ipAddress]);
            [v38 getBytes:v69 length:16];

            if (inet_ntop(30, v69, (char *)buf, 0x10u))
            {
              v39 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  buf,  1LL);
              -[__CFString addObject:](v35, "addObject:", v39);
              if (!v18)
              {
                id v40 = objc_alloc(&OBJC_CLASS___APSDNSCacheEntry);
                __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v66 hostname]);
                v18 = -[APSDNSCacheEntry initWithHostname:](v40, "initWithHostname:", v41);

                NSErrorUserInfoKey v35 = v63;
                -[NSMutableArray addObject:](v65->_dnsCache, "addObject:", v18);
              }

              -[APSDNSCacheEntry addCacheIPAddress:addressFamily:timeToLive:]( v18,  "addCacheIPAddress:addressFamily:timeToLive:",  v39,  2,  (double)[v37 ttl]);
            }

            ++v36;
          }

          while ((unint64_t)[v16 ipv6sCount] > v36);
        }

        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v43 = [v16 ipv6sCount];
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 hostname]);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v45;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Received %u IPv6 addresses for hostname %@: %@",  buf,  0x1Cu);
        }

        self = v65;
        __int128 v14 = v62;
      }

      else
      {
        v63 = 0LL;
      }

      if (self->_remoteDNSResponseHandler)
      {
        int v46 = objc_alloc(&OBJC_CLASS___APSDNSResponse);
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 hostname]);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v67, "componentsJoinedByString:", @","));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsJoinedByString:](v63, "componentsJoinedByString:", @","));
        id v51 = -[APSDNSResponse initResponseForHostname:ipv4Address:ipv6Address:]( v46,  "initResponseForHostname:ipv4Address:ipv6Address:",  v48,  v49,  v50);

        self = v65;
        id remoteDNSResponseHandler = (void (**)(id, void *, id, void))v65->_remoteDNSResponseHandler;
        v53 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 hostname]);
        remoteDNSResponseHandler[2](remoteDNSResponseHandler, v54, v51, 0LL);

        __int128 v14 = v62;
      }

      if (-[TASKNotifyRequest hasIsLast](v14, "hasIsLast") && -[TASKNotifyRequest isLast](v14, "isLast"))
      {
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = v14;
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[TASKNotifyRequest description](v14, "description"));
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Received last notification for task, removing the task: %@",  buf,  0xCu);

          __int128 v14 = v56;
        }

        -[NSMutableArray removeObject:](self->_outstandingTaskList, "removeObject:", v7);
      }

      __int128 v13 = 0LL;
      NSErrorDomain v22 = v63;
    }

    else
    {
      v64 = v18;
      objc_super v20 = v14;
      [v7 setTaskStatus:4];
      v21 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
      v67 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v16 errorMessage]);
      if (v67) {
        NSErrorDomain v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 errorMessage]);
      }
      else {
        NSErrorDomain v22 = @"Server returned an error in Task notification";
      }
      v71 = v22;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
      __int128 v13 = -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4610LL,  v34);

      __int128 v14 = v20;
      v18 = v64;
      if (!v67) {
        goto LABEL_49;
      }
    }

LABEL_49:
    goto LABEL_50;
  }

  [v7 setTaskStatus:4];
  unsigned __int8 v11 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
  v74 = @"Server received invalid input";
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
  __int128 v13 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 4866LL, v12);
LABEL_51:

LABEL_52:
  if ([v7 taskStatus] == (id)4)
  {
    if ([v7 taskType] == (id)1)
    {
      v58 = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsRequest]);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 hostname]);
        v58[2](v58, v60, 0LL, v13);
      }
    }

    -[NSMutableArray removeObject:](self->_outstandingTaskList, "removeObject:", v7);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (APSDaemon)daemon
{
  return self->_daemon;
}

- (void).cxx_destruct
{
}

@end