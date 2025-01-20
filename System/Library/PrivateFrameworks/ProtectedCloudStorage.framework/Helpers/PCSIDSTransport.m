@interface PCSIDSTransport
+ (id)transportWithIDSServiceName:(id)a3;
- (BOOL)serviceDelegateSet;
- (IDSService)service;
- (NSMutableDictionary)pendingReplies;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)transaction;
- (PCSIDSMessagingDelegate)delegate;
- (PCSIDSTransport)initWithServiceName:(id)a3;
- (id)copyLocalPairedDevices;
- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8;
- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setServiceDelegateSet:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PCSIDSTransport

+ (id)transportWithIDSServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_100004B8C;
  v17 = sub_100004B9C;
  id v18 = 0LL;
  if (qword_10002BD60 != -1) {
    dispatch_once(&qword_10002BD60, &stru_100024948);
  }
  v5 = (dispatch_queue_s *)qword_10002BD50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004BEC;
  block[3] = &unk_100024970;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (PCSIDSTransport)initWithServiceName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PCSIDSTransport;
  v5 = -[PCSIDSTransport init](&v17, "init");
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  pendingReplies = v5->_pendingReplies;
  v5->_pendingReplies = v6;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.ProtectedCloudStorage.IDSMessaging", 0LL);
  internalQueue = v5->_internalQueue;
  v5->_internalQueue = (OS_dispatch_queue *)v8;

  id v10 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", v4);
  service = v5->_service;
  v5->_service = v10;

  if (v5->_service)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport service](v5, "service"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport internalQueue](v5, "internalQueue"));
    [v12 addDelegate:v5 queue:v13];

LABEL_4:
    v14 = v5;
    goto LABEL_8;
  }

  uint64_t v15 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to create IDSService for %@", buf, 0xCu);
  }

  v14 = 0LL;
LABEL_8:

  return v14;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004EA8;
  block[3] = &unk_100024998;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005060;
  block[3] = &unk_1000249C0;
  id v27 = v16;
  id v28 = v17;
  double v29 = a6;
  id v24 = v15;
  v25 = self;
  int64_t v30 = a5;
  id v26 = v14;
  id v19 = v16;
  id v20 = v14;
  id v21 = v15;
  id v22 = v17;
  dispatch_async(v18, block);
}

- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 idsContext]);
  unsigned __int8 v16 = [v15 expectsPeerResponse];

  if ((v16 & 1) != 0)
  {
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport internalQueue](self, "internalQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100005660;
    v21[3] = &unk_1000249E8;
    double v26 = a6;
    id v22 = v13;
    v23 = self;
    id v24 = v12;
    int64_t v27 = a5;
    id v25 = v14;
    dispatch_async(v17, v21);
  }

  else
  {
    id v18 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 message]);
      *(_DWORD *)buf = 138412546;
      double v29 = v20;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Reply attempted to message that did not expect peer response: %@ -> %@",  buf,  0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 incomingResponseIdentifier]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport pendingReplies](self, "pendingReplies"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

    if (v15)
    {
      unsigned __int8 v16 = -[PCSIDSMessage initWithMessage:idsContext:fromID:]( objc_alloc(&OBJC_CLASS___PCSIDSMessage),  "initWithMessage:idsContext:fromID:",  v10,  v12,  v11);
      id v17 = (void *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 incomingResponseIdentifier]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
        int v27 = 138412546;
        id v28 = v19;
        __int16 v29 = 2112;
        __int16 v30 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received reply for message ID %@ with ID %@",  (uint8_t *)&v27,  0x16u);
      }

      [v15 runReplyHandlerWithMessage:v16 error:0];
      goto LABEL_12;
    }

    id v25 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = v25;
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
      int v27 = 138412546;
      id v28 = v26;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Got message with ID %@ with response ID %@, but no reply handler available",  (uint8_t *)&v27,  0x16u);

LABEL_12:
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport delegate](self, "delegate"));
    id v21 = (void *)qword_10002BDE0;
    BOOL v22 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v22)
      {
        v23 = v21;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 outgoingResponseIdentifier]);
        int v27 = 138412290;
        id v28 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received message with ID %@",  (uint8_t *)&v27,  0xCu);
      }

      unsigned __int8 v16 = -[PCSIDSMessage initWithMessage:idsContext:fromID:]( objc_alloc(&OBJC_CLASS___PCSIDSMessage),  "initWithMessage:idsContext:fromID:",  v10,  v12,  v11);
      [v15 incomingMessage:v16 fromDevice:v11];
      goto LABEL_12;
    }

    if (v22)
    {
      int v27 = 138412546;
      id v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Got message from %@ with id %@ with no delegate set",  (uint8_t *)&v27,  0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSIDSTransport pendingReplies](self, "pendingReplies"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);

    if (v13)
    {
      [v13 runReplyHandlerWithMessage:0 error:v11];
    }

    else
    {
      id v14 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error occurred sending message %@: %@",  (uint8_t *)&v15,  0x16u);
      }
    }
  }
}

- (id)copyLocalPairedDevices
{
  return 0LL;
}

- (PCSIDSMessagingDelegate)delegate
{
  return (PCSIDSMessagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)pendingReplies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40LL, 1);
}

- (BOOL)serviceDelegateSet
{
  return self->_serviceDelegateSet;
}

- (void)setServiceDelegateSet:(BOOL)a3
{
  self->_serviceDelegateSet = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end