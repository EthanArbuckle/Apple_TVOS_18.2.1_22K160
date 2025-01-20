@interface GTLoopbackServiceXPCDispatcher
- (GTLoopbackServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)echo_:(id)a3 replyConnection:(id)a4;
- (void)echo_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)echo_repeat_callback_:(id)a3 replyConnection:(id)a4;
- (void)echo_repeat_callback_complete_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTLoopbackServiceXPCDispatcher

- (GTLoopbackServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTLoopbackServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)echo_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTLoopbackService echo:](self->_service, "echo:", nsdictionary_any));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "data", (uint64_t)v8);
  [v6 sendMessage:v10];
}

- (void)echo_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000113C4;
  v14[3] = &unk_100030BB8;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  -[GTLoopbackService echo:completionHandler:](service, "echo:completionHandler:", nsdictionary_any, v14);
}

- (void)echo_repeat_callback_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  uint64_t v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_object_t array = xpc_dictionary_get_array(v7, "_pathHistory");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(array);

  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  service = self->_service;
  v22[3] = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100011544;
  v16[3] = &unk_100030BE0;
  v19 = v22;
  uint64_t v20 = v10;
  uint64_t v21 = uint64;
  id v17 = v12;
  id v18 = v6;
  id v14 = v6;
  id v15 = v12;
  -[GTLoopbackService echo:repeat:callback:](service, "echo:repeat:callback:", nsdictionary_any, uint64, v16);

  _Block_object_dispose(v22, 8);
}

- (void)echo_repeat_callback_complete_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  uint64_t v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_object_t array = xpc_dictionary_get_array(v7, "_pathHistory");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(array);
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100011788;
  v22[3] = &unk_100030C08;
  uint64_t v25 = v10;
  id v23 = v12;
  id v24 = v6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001181C;
  v19[3] = &unk_100030BB8;
  id v20 = v14;
  id v21 = v24;
  id v16 = v24;
  id v17 = v14;
  id v18 = v12;
  -[GTLoopbackService echo:repeat:callback:complete:]( service,  "echo:repeat:callback:complete:",  nsdictionary_any,  uint64,  v22,  v19);
}

- (void).cxx_destruct
{
}

@end