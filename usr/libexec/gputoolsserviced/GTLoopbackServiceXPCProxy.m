@interface GTLoopbackServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTLoopbackServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)echo:(id)a3;
- (void)echo:(id)a3 completionHandler:(id)a4;
- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5;
- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6;
@end

@implementation GTLoopbackServiceXPCProxy

- (GTLoopbackServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GTLoopbackServiceXPCProxy;
  v8 = -[GTLoopbackServiceXPCProxy init](&v19, "init");
  if (v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    v11 = -[GTServiceConnection initWithConnection:device:port:]( v9,  "initWithConnection:device:port:",  v6,  v10,  [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[GTServiceProperties protocolMethods:]( &OBJC_CLASS___GTServiceProperties,  "protocolMethods:",  &OBJC_PROTOCOL___GTLoopbackService));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
    id v15 = newSetWithArrayMinusArray(v13, v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;
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
    v10.super_class = (Class)&OBJC_CLASS___GTLoopbackServiceXPCProxy;
    BOOL v8 = -[GTLoopbackServiceXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)echo:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v5);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  v9 = v8;
  if (v8) {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v8, "data");
  }
  else {
    id nsdictionary_any = 0LL;
  }

  return nsdictionary_any;
}

- (void)echo:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v8);

  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100010E08;
  v13[3] = &unk_100030940;
  id v14 = v7;
  id v12 = v7;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v13);
}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v10);

  xpc_dictionary_set_uint64(xdict, "repeat", a4);
  id v12 = -[GTLoopbackReplyStream initWithCallback:]( objc_alloc(&OBJC_CLASS___GTLoopbackReplyStream),  "initWithCallback:",  v9);

  -[GTLoopbackReplyStream setDispatcherId:]( v12,  "setDispatcherId:",  -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v12));
  -[GTServiceConnection sendMessage:withReplyStreamId:]( self->_connection,  "sendMessage:withReplyStreamId:",  xdict,  -[GTLoopbackReplyStream dispatcherId](v12, "dispatcherId"));
}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v13);

  xpc_dictionary_set_uint64(empty, "repeat", a4);
  uint64_t v16 = -[GTLoopbackReplyStream initWithCallback:]( objc_alloc(&OBJC_CLASS___GTLoopbackReplyStream),  "initWithCallback:",  v12);

  -[GTLoopbackReplyStream setDispatcherId:]( v16,  "setDispatcherId:",  -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v16));
  connection = self->_connection;
  id v18 = -[GTLoopbackReplyStream dispatcherId](v16, "dispatcherId");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000110D8;
  v21[3] = &unk_100030B90;
  v22 = v16;
  id v23 = v11;
  v21[4] = self;
  objc_super v19 = v16;
  id v20 = v11;
  -[GTServiceConnection sendMessage:withReplyStreamId:replyHandler:]( connection,  "sendMessage:withReplyStreamId:replyHandler:",  empty,  v18,  v21);
}

- (void).cxx_destruct
{
}

@end