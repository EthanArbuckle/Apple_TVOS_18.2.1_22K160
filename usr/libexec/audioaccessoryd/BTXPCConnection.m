@interface BTXPCConnection
- (BTXPCConnection)initWithConnection:(id)a3;
- (OS_xpc_object)connection;
- (id)description;
- (int)remotePID;
- (unsigned)remoteUID;
- (void)dealloc;
- (void)handleDisconnection;
- (void)handleEvent:(id)a3;
- (void)handleMsg:(id)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setConnection:(id)a3;
- (void)setRemotePID:(int)a3;
- (void)setRemoteUID:(unsigned int)a3;
@end

@implementation BTXPCConnection

- (BTXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
    sub_10019152C();
  }
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BTXPCConnection;
  v6 = -[BTXPCConnection init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = &v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    -[BTXPCConnection setRemoteUID:](v7, "setRemoteUID:", xpc_connection_get_euid(v7->_connection));
    -[BTXPCConnection setRemotePID:](v7, "setRemotePID:", xpc_connection_get_pid(v7->_connection));
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 xpcQueue]);
    xpc_connection_set_target_queue(connection, v11);

    v12 = *p_connection;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000896F0;
    v14[3] = &unk_100208A40;
    objc_copyWeak(&v15, &location);
    xpc_connection_set_event_handler(v12, v14);
    xpc_connection_resume(*p_connection);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));

  if (v3)
  {
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
    pid_t pid = xpc_connection_get_pid(v4);
    proc_name(pid, buffer, 0x40u);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BTXPCConnection(%d-%d): Process Name: %s",  -[BTXPCConnection remotePID](self, "remotePID"),  -[BTXPCConnection remoteUID](self, "remoteUID"),  buffer));
}

- (void)dealloc
{
  os_log_t v3 = sub_100060178("XPC");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection description](self, "description"));
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC client connection dealloc: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTXPCConnection;
  -[BTXPCConnection dealloc](&v6, "dealloc");
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BTXPCConnection handleMsg:](self, "handleMsg:", v4);
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v4 == &_xpc_error_connection_invalid)
      {
        -[BTXPCConnection handleDisconnection](self, "handleDisconnection");
        goto LABEL_10;
      }

      os_log_t v8 = sub_100060178("XPC");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10019158C();
      }
    }

    else
    {
      os_log_t v6 = sub_100060178("XPC");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001915EC();
      }
    }
  }

- (void)handleDisconnection
{
  os_log_t v3 = sub_100060178("XPC");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection description](self, "description"));
    int v7 = 138412290;
    os_log_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "XPC client disconnection: %@",  (uint8_t *)&v7,  0xCu);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v6 removeConnection:self];
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("XPC");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = -[BTXPCConnection remoteUID](self, "remoteUID");
    unsigned int v8 = -[BTXPCConnection remotePID](self, "remotePID");
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    v12[0] = 67109634;
    v12[1] = v7;
    __int16 v13 = 1024;
    unsigned int v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received XPC(%d-%d) message: %@",  (uint8_t *)v12,  0x18u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
  objc_msgSend( v10,  "handleConnection:XPCMessage:userID:processID:",  v11,  v4,  -[BTXPCConnection remoteUID](self, "remoteUID"),  -[BTXPCConnection remotePID](self, "remotePID"));
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_autoreleasePoolPush();
  os_log_t v9 = sub_100060178("XPC");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412547;
    id v18 = v6;
    __int16 v19 = 2113;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Send message: %@, args: %{private}@",  (uint8_t *)&v17,  0x16u);
  }

  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v12 = v6;
  xpc_dictionary_set_string(v11, "kMsgId", (const char *)[v12 UTF8String]);
  if (v7)
  {
    __int16 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
    xpc_dictionary_set_value(v11, "kMsgArgs", v13);
  }

  os_log_t v14 = sub_100060178("XPC");
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10019164C();
  }

  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
  xpc_connection_send_message(v16, v11);

  objc_autoreleasePoolPop(v8);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unsigned)remoteUID
{
  return self->_remoteUID;
}

- (void)setRemoteUID:(unsigned int)a3
{
  self->_remoteUID = a3;
}

- (int)remotePID
{
  return self->_remotePID;
}

- (void)setRemotePID:(int)a3
{
  self->_remotePID = a3;
}

- (void).cxx_destruct
{
}

@end