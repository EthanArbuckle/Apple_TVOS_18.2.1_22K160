@interface IDSDXPCGroupSessionKeyValueDeliveryProvider
- (IDSDXPCGroupSessionKeyValueDeliveryProvider)initWithQueue:(id)a3 connection:(id)a4;
- (OS_dispatch_queue)queue;
- (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation IDSDXPCGroupSessionKeyValueDeliveryProvider

- (IDSDXPCGroupSessionKeyValueDeliveryProvider)initWithQueue:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasEntitlement:kIDSGroupSessionKeyValueDeliveryEntitlement])
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___IDSDXPCGroupSessionKeyValueDeliveryProvider;
    v9 = -[IDSDXPCGroupSessionKeyValueDeliveryProvider init](&v14, "init");
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_queue, a3);
    }
    self = v10;
    v11 = self;
  }

  else
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Missing IDS Group Session Key Value Delivery entitlement -- failing creation of IDSDXPCGroupSessionKeyValueDeliv eryProvider collaborator {connection: %@}",  buf,  0xCu);
    }

    v11 = 0LL;
  }

  return v11;
}

- (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionWithUniqueID:v5]);

  if (!v7) {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyValueDelivery]);
  (*((void (**)(id, void *, void))v9 + 2))(v9, v8, 0LL);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end