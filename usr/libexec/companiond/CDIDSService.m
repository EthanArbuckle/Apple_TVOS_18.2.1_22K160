@interface CDIDSService
- (CDIDSService)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)messageReceivedHandler;
- (void)_activated;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)sendMessage:(int64_t)a3 toUsernames:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDispatchQueue:(id)a3;
- (void)setMessageReceivedHandler:(id)a3;
@end

@implementation CDIDSService

- (CDIDSService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDIDSService;
  v2 = -[CDIDSService init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000197CC;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019838;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activated
{
  v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.companion.auth");
  idsService = self->_idsService;
  self->_idsService = v3;

  -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_dispatchQueue);
  id v5 = sub_1000198E0();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS service activated.", v7, 2u);
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    idsService = self->_idsService;
    self->_idsService = 0LL;

    id messageReceivedHandler = self->_messageReceivedHandler;
    self->_id messageReceivedHandler = 0LL;

    self->_invalidateDone = 1;
    id v5 = sub_1000198E0();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS service invalidated.", v7, 2u);
    }
  }

- (void)sendMessage:(int64_t)a3 toUsernames:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019A44;
  block[3] = &unk_100031040;
  v11 = self;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_1000198E0();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "IDS incomingMessage: account=%@, incomingMessage=%@, fromID=%@",  (uint8_t *)&v20,  0x20u);
  }

  uint64_t NSNumber = NSDictionaryGetNSNumber(v11, @"type", 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  id v17 = [v16 copy];
  id v18 = [v17 integerValue];

  id messageReceivedHandler = (void (**)(id, id))self->_messageReceivedHandler;
  if (messageReceivedHandler) {
    messageReceivedHandler[2](messageReceivedHandler, v18);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = sub_1000198E0();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v9)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138413058;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 1024;
      int v22 = 1;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "IDS didSendWithSuccess: account=%@, identifier=%@, success=%d, error=%@",  (uint8_t *)&v17,  0x26u);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138413058;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 1024;
    int v22 = 0;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "IDS failed to send: account=%@, identifier=%@, success=%d, error=%@",  (uint8_t *)&v17,  0x26u);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)messageReceivedHandler
{
  return self->_messageReceivedHandler;
}

- (void)setMessageReceivedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end