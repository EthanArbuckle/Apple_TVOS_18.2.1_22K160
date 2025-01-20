@interface GTFileWriterServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterServiceXPCProxy

- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GTFileWriterServiceXPCProxy;
  v8 = -[GTFileWriterServiceXPCProxy init](&v20, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTFileWriterService;
    v10 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    v12 = -[GTServiceConnection initWithConnection:device:port:]( v10,  "initWithConnection:device:port:",  v6,  v11,  [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v9));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
    id v16 = newSetWithArrayMinusArray(v14, v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v17;
  }

  return v8;
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
    v10.super_class = (Class)&OBJC_CLASS___GTFileWriterServiceXPCProxy;
    BOOL v8 = -[GTFileWriterServiceXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000D51C;
  v26[3] = &unk_100030940;
  id v27 = v13;
  id v25 = v13;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v26);
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000D71C;
  v26[3] = &unk_100030940;
  id v27 = v13;
  id v25 = v13;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v26);
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v19);

  id v22 = v18;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "path", v23);
  id v24 = v17;
  id v25 = (const char *)[v24 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v25);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v16);

  xpc_dictionary_set_uint64(empty, "sessionID", a7);
  connection = self->_connection;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000D968;
  v28[3] = &unk_100030940;
  id v29 = v15;
  id v27 = v15;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v28);
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "data", v10);

  xpc_dictionary_set_uint64(empty, "sessionID", a4);
  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000DAD4;
  v15[3] = &unk_100030940;
  id v16 = v9;
  id v14 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v15);
}

- (void).cxx_destruct
{
}

@end