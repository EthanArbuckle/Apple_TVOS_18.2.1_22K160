@interface GTLaunchServiceXPCDispatcher
- (GTLaunchServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)foregroundService_error_:(id)a3 replyConnection:(id)a4;
- (void)launchReplayService_error_:(id)a3 replyConnection:(id)a4;
- (void)processStateForService_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)resumeService_error_:(id)a3 replyConnection:(id)a4;
- (void)symbolicatorForService_completionHandler_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTLaunchServiceXPCDispatcher

- (GTLaunchServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTLaunchServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)launchReplayService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___GTLaunchRequest);
  nsobject = xpc_dictionary_get_nsobject(v7, "request", v8);
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  id v14 = 0LL;
  LOBYTE(v7) = -[GTLaunchService launchReplayService:error:](service, "launchReplayService:error:", nsobject, &v14);
  id v13 = v14;
  [v6 sendMessage:v11];
}

- (void)foregroundService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  service = self->_service;
  id v13 = 0LL;
  -[GTLaunchService foregroundService:error:](service, "foregroundService:error:", uint64, &v13);
  id v10 = v13;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nserror(v12, "error", v10);
  [v6 sendMessage:v12];
}

- (void)resumeService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  service = self->_service;
  id v13 = 0LL;
  -[GTLaunchService resumeService:error:](service, "resumeService:error:", uint64, &v13);
  id v10 = v13;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nserror(v12, "error", v10);
  [v6 sendMessage:v12];
}

- (void)symbolicatorForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001C4D0;
  v14[3] = &unk_100030FB8;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  -[GTLaunchService symbolicatorForService:completionHandler:]( service,  "symbolicatorForService:completionHandler:",  uint64,  v14);
}

- (void)processStateForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001C428;
  v14[3] = &unk_100030FE0;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  -[GTLaunchService processStateForService:completionHandler:]( service,  "processStateForService:completionHandler:",  uint64,  v14);
}

- (void).cxx_destruct
{
}

@end