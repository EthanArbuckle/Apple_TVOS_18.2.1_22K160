@interface XPCServiceBroker
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation XPCServiceBroker

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  catalog = self->_catalog;
  id v6 = a4;
  v7 = sub_10022A284((uint64_t)&OBJC_CLASS___XPCServiceClient, v6, catalog);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E3798;
  block[3] = &unk_1003E9DC0;
  block[4] = self;
  v9 = v7;
  v23 = v9;
  dispatch_async(dispatchQueue, block);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ASDServiceBroker interface](&OBJC_CLASS___ASDServiceBroker, "interface"));
  [v6 setExportedInterface:v10];

  [v6 setExportedObject:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ASDNotificationCenter interface](&OBJC_CLASS___ASDNotificationCenter, "interface"));
  [v6 setRemoteObjectInterface:v11];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1001E37A4;
  v19 = &unk_1003E9DC0;
  v12 = v9;
  v20 = v12;
  v21 = self;
  [v6 setInvalidationHandler:&v16];
  objc_msgSend(v6, "resume", v16, v17, v18, v19);

  id v13 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  sub_1002E7D7C((uint64_t)v14, v12);

  return 1;
}

- (void).cxx_destruct
{
}

@end