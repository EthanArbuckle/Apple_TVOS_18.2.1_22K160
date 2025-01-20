@interface GTURLAccessProviderXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProviderXPCProxy

- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = &OBJC_PROTOCOL___GTURLAccessProvider;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolName]);
  v10 = NSStringFromProtocol((Protocol *)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  unsigned int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS___GTURLAccessProviderXPCProxy;
    v13 = -[GTURLAccessProviderXPCProxy init](&v25, "init");
    if (v13)
    {
      v14 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
      v16 = -[GTServiceConnection initWithConnection:device:port:]( v14,  "initWithConnection:device:port:",  v6,  v15,  [v7 servicePort]);
      connection = v13->_connection;
      v13->_connection = (GTXPCConnection *)v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v8));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
      id v20 = newSetWithArrayMinusArray(v18, v19);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      ignoreMethods = v13->_ignoreMethods;
      v13->_ignoreMethods = (NSSet *)v21;
    }

    self = v13;
    v23 = self;
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v7))
  {
    BOOL v8 = 0;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___GTURLAccessProviderXPCProxy;
    BOOL v8 = -[GTURLAccessProviderXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v8);

  mach_msg_type_number_t task_info_outCnt = 8;
  if (!task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt)) {
    xpc_dictionary_set_data(empty, "auditToken", task_info_out, 0x20uLL);
  }
  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100008890;
  v13[3] = &unk_100030940;
  id v14 = v7;
  id v12 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v13);
}

- (id)makeURL:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTXPCConnection connection](self->_connection, "connection"));
  xpc_connection_get_audit_token(v8, v19);

  uint64_t v9 = APP_SANDBOX_READ;
  id v10 = v5;
  id v11 = [v10 fileSystemRepresentation];

  v18[0] = v19[0];
  v18[1] = v19[1];
  id v12 = (const char *)sandbox_extension_issue_file_to_process(v9, v11, SANDBOX_EXTENSION_DEFAULT, v18);
  if (v12)
  {
    v13 = (char *)v12;
    xpc_dictionary_set_string(empty, "sandboxExtension", v12);
    free(v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GTXPCConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v14)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(v14, "identifier", v15);
  }

  else
  {
    nsobject = 0LL;
  }

  return nsobject;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  uint64_t v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  _OWORD v18[2] = sub_100008C08;
  v18[3] = &unk_100030940;
  id v19 = v9;
  id v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  uint64_t v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  _OWORD v18[2] = sub_100008DA4;
  v18[3] = &unk_100030940;
  id v19 = v9;
  id v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);
}

- (id)urlForPath:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = v5;
  id v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(empty, "path", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GTXPCConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v10)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(v10, "result", v11);
    string = xpc_dictionary_get_string(v10, "sandboxExtension");
    if (string)
    {
      id v14 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", string, strlen(string) + 1);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      _CFURLAttachSecurityScopeToFileURL(nsobject, v15);
    }
  }

  else
  {
    nsobject = 0LL;
  }

  return nsobject;
}

- (void).cxx_destruct
{
}

@end