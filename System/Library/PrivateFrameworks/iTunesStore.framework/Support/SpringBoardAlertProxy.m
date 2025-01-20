@interface SpringBoardAlertProxy
- (OS_xpc_object)XPCEndpoint;
- (SpringBoardAlertProxy)initWithMessage:(id)a3;
- (SpringBoardAlertProxyDelegate)delegate;
- (void)_disconnect;
- (void)_handleMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SpringBoardAlertProxy

- (SpringBoardAlertProxy)initWithMessage:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SpringBoardAlertProxy;
  id v5 = -[SpringBoardAlertProxy init](&v31, "init");
  if (v5)
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, "2");
    v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue(value);
    v8 = v7;
    if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_endpoint)
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.itunesstored.SpringBoardAlertProxy.delegate", 0LL);
      v11 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v10;

      dispatch_queue_t v12 = dispatch_queue_create("com.apple.itunesstored.SpringBoardAlertProxy", 0LL);
      v13 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v12;

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_set_target_queue(*((dispatch_object_t *)v5 + 2), v9);
      dispatch_set_target_queue(*((dispatch_object_t *)v5 + 3), v9);
      xpc_connection_t v15 = xpc_connection_create_from_endpoint(v8);
      v16 = -[SSXPCConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___SSXPCConnection),  "initWithXPCConnection:",  v15);
      v17 = (void *)*((void *)v5 + 6);
      *((void *)v5 + 6) = v16;

      v18 = objc_alloc_init(&OBJC_CLASS___SSXPCConnection);
      v19 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v18;

      id v20 = [*((id *)v5 + 4) createXPCEndpoint];
      v21 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v20;

      objc_initWeak(&location, v5);
      v22 = (void *)*((void *)v5 + 6);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10003E86C;
      v28[3] = &unk_10034BC98;
      objc_copyWeak(&v29, &location);
      [v22 setDisconnectBlock:v28];
      v23 = (void *)*((void *)v5 + 4);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10003E898;
      v26[3] = &unk_10034BCC0;
      objc_copyWeak(&v27, &location);
      [v23 setMessageBlock:v26];
      v24 = (void *)SSXPCCreateMessageDictionary(-1LL);
      [*((id *)v5 + 6) sendMessage:v24];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }

    else
    {
      v9 = (dispatch_queue_s *)v5;
      id v5 = 0LL;
    }
  }

  return (SpringBoardAlertProxy *)v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SpringBoardAlertProxy;
  -[SpringBoardAlertProxy dealloc](&v3, "dealloc");
}

- (SpringBoardAlertProxyDelegate)delegate
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_10003EA18;
  dispatch_queue_t v10 = sub_10003EA28;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003EA30;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SpringBoardAlertProxyDelegate *)v3;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EAE4;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EB6C;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_disconnect
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EBD0;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003ED30;
  v11[3] = &unk_10034AD58;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = (_xpc_connection_s *)a4;
  dispatch_async(dispatchQueue, v11);
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  xpc_connection_send_message(v9, reply);
}

- (OS_xpc_object)XPCEndpoint
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end